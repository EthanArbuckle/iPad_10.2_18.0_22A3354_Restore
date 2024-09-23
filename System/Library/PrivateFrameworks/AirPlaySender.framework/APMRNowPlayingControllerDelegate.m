@implementation APMRNowPlayingControllerDelegate

- (APMRNowPlayingControllerDelegate)initWithMetadataSource:(OpaqueAPMetadataSource *)a3
{
  APMRNowPlayingControllerDelegate *v4;
  void *v5;
  void *v6;
  void *v7;
  MRNowPlayingController *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)APMRNowPlayingControllerDelegate;
  v4 = -[APMRNowPlayingControllerDelegate init](&v10, sel_init);
  if (v4)
  {
    v4->_metadataSource = (OpaqueAPMetadataSource *)CFRetain(a3);
    v5 = (void *)objc_msgSend(objc_alloc(getMRNowPlayingControllerConfigurationClass()), "initWithDestination:", a3->var11);
    v6 = v5;
    if (!v5)
      goto LABEL_7;
    objc_msgSend(v5, "setRequestPlaybackState:", 1);
    objc_msgSend(v6, "setRequestSupportedCommands:", 1);
    objc_msgSend(v6, "setRequestClientProperties:", 1);
    v7 = (void *)-[objc_class defaultPlaybackQueueRequest](getMRPlaybackQueueRequestClass(), "defaultPlaybackQueueRequest");
    objc_msgSend(v7, "setArtworkHeight:", 600.0);
    objc_msgSend(v7, "setArtworkWidth:", 600.0);
    objc_msgSend(v6, "setPlaybackQueueRequest:", v7);
    v8 = (MRNowPlayingController *)objc_msgSend(objc_alloc(getMRNowPlayingControllerClass()), "initWithConfiguration:", v6);
    v4->_nowPlayingController = v8;
    if (v8)
    {
      -[MRNowPlayingController setDelegate:](v8, "setDelegate:", v4);
    }
    else
    {
LABEL_7:
      APSLogErrorAt();

      v4 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v4;
}

- (void)dealloc
{
  OpaqueAPMetadataSource *metadataSource;
  objc_super v4;

  metadataSource = self->_metadataSource;
  if (metadataSource)
  {
    CFRelease(metadataSource);
    self->_metadataSource = 0;
  }

  self->_nowPlayingController = 0;
  v4.receiver = self;
  v4.super_class = (Class)APMRNowPlayingControllerDelegate;
  -[APMRNowPlayingControllerDelegate dealloc](&v4, sel_dealloc);
}

- (void)start
{
  -[MRNowPlayingController beginLoadingUpdates](self->_nowPlayingController, "beginLoadingUpdates");
  if (gLogCategory_APMetadataSource <= 50
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)stop
{
  -[MRNowPlayingController endLoadingUpdates](self->_nowPlayingController, "endLoadingUpdates");
  if (gLogCategory_APMetadataSource <= 50
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)flushMetadata
{
  OpaqueAPMetadataSource *metadataSource;
  NSObject *var1;
  _QWORD block[6];

  metadataSource = self->_metadataSource;
  if (gLogCategory_APMetadataSource <= 40
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFRetain(metadataSource);
  var1 = metadataSource->var1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__APMRNowPlayingControllerDelegate_flushMetadata__block_invoke;
  block[3] = &unk_1E82672A8;
  block[4] = self;
  block[5] = metadataSource;
  dispatch_async(var1, block);
}

void __49__APMRNowPlayingControllerDelegate_flushMetadata__block_invoke(uint64_t a1)
{
  const void *v2;
  _QWORD *v3;
  const __CFDictionary *Empty;
  _QWORD *v5;
  uint64_t v6;

  if (gLogCategory_APMetadataSource <= 40
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 88);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 88) = 0;
  }
  v3 = *(_QWORD **)(a1 + 40);
  Empty = (const __CFDictionary *)CFDictionaryGetEmpty();
  metadataSource_handleNowPlayingInfoChangedInternal(v3, Empty, CFSTR("replace"));
  metadataSource_handleMRPlaybackStateChangedInternal(*(_QWORD **)(a1 + 40));
  metadataSource_handleMRSupportedCommandsChangedInternal(*(_QWORD **)(a1 + 40), MEMORY[0x1E0C9AA60]);
  v5 = *(_QWORD **)(a1 + 40);
  v6 = -[objc_class localClient](getMRClientClass(), "localClient");
  metadataSource_handleNowPlayingClientChangedInternal(v5, v6);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (void)notifyNewContentItems:(id)a3
{
  OpaqueAPMetadataSource *metadataSource;
  void *v6;
  id v7;
  NSObject *var1;
  OpaqueAPMetadataSource *v9;
  id v10;
  _QWORD block[7];

  metadataSource = self->_metadataSource;
  if (gLogCategory_APMetadataSource <= 30
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    v9 = metadataSource;
    v10 = a3;
    LogPrintF();
  }
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "firstObject", v9, v10), "copy");
  if (v6)
  {
    CFRetain(metadataSource);
    v7 = v6;
    var1 = metadataSource->var1;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__APMRNowPlayingControllerDelegate_notifyNewContentItems___block_invoke;
    block[3] = &unk_1E82672D0;
    block[4] = self;
    block[5] = v6;
    block[6] = metadataSource;
    dispatch_async(var1, block);
  }

}

void __58__APMRNowPlayingControllerDelegate_notifyNewContentItems___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (gLogCategory_APMetadataSource <= 40
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(_QWORD *)(v2 + 88);
    v9 = objc_msgSend(*(id *)(a1 + 40), "identifier");
    v5 = v2;
    LogPrintF();
  }
  v3 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 88);
  v4 = (const void *)objc_msgSend(*(id *)(a1 + 40), "identifier", v5, v7, v9);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 88) = v4;
  if (v4)
    CFRetain(v4);
  if (v3)
    CFRelease(v3);
  if (gLogCategory_APMetadataSource <= 30
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(_QWORD *)(a1 + 40);
    LogPrintF();
  }
  metadataSource_handleNowPlayingInfoChangedInternal(*(_QWORD **)(a1 + 48), (CFDictionaryRef)objc_msgSend(*(id *)(a1 + 40), "nowPlayingInfo", v6, v8), CFSTR("replace"));
  CFRelease(*(CFTypeRef *)(a1 + 48));

}

- (void)notifyContentItemUpdates:(id)a3
{
  OpaqueAPMetadataSource *metadataSource;
  void *v6;
  id v7;
  NSObject *var1;
  _QWORD block[8];

  metadataSource = self->_metadataSource;
  if (gLogCategory_APMetadataSource <= 30
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", a3, 1);
  if (v6)
  {
    CFRetain(metadataSource);
    v7 = v6;
    var1 = metadataSource->var1;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__APMRNowPlayingControllerDelegate_notifyContentItemUpdates___block_invoke;
    block[3] = &unk_1E82672F8;
    block[4] = a3;
    block[5] = self;
    block[6] = v6;
    block[7] = metadataSource;
    dispatch_async(var1, block);
  }
  else
  {
    APSLogErrorAt();
  }

}

void __61__APMRNowPlayingControllerDelegate_notifyContentItemUpdates___block_invoke(uint64_t a1)
{
  const __CFArray *v2;
  CFIndex Count;
  CFIndex v4;
  CFIndex v5;
  void *ValueAtIndex;
  uint64_t v7;
  void *v8;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 56) + 88))
  {
    v2 = *(const __CFArray **)(a1 + 32);
    if (v2)
    {
      Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 32));
      if (Count >= 1)
      {
        v4 = Count;
        v5 = 0;
        while (1)
        {
          ValueAtIndex = (void *)CFArrayGetValueAtIndex(v2, v5);
          objc_msgSend(ValueAtIndex, "identifier");
          if (FigCFEqual())
            break;
          if (v4 == ++v5)
            goto LABEL_14;
        }
        if (ValueAtIndex)
        {
          if (gLogCategory_APMetadataSource <= 30
            && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
          {
            v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v8 = ValueAtIndex;
            LogPrintF();
          }
          metadataSource_handleNowPlayingInfoChangedInternal(*(_QWORD **)(a1 + 56), (CFDictionaryRef)objc_msgSend(ValueAtIndex, "nowPlayingInfo", v7, v8), CFSTR("update"));
        }
      }
    }
    else
    {
      APSLogErrorAt();
    }
  }
LABEL_14:
  CFRelease(*(CFTypeRef *)(a1 + 56));

}

- (void)notifyNewPlaybackState:(unsigned int)a3
{
  OpaqueAPMetadataSource *metadataSource;
  NSObject *var1;
  _QWORD block[5];
  unsigned int v7;

  metadataSource = self->_metadataSource;
  if (gLogCategory_APMetadataSource <= 30
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFRetain(metadataSource);
  var1 = metadataSource->var1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__APMRNowPlayingControllerDelegate_notifyNewPlaybackState___block_invoke;
  block[3] = &__block_descriptor_44_e5_v8__0l;
  block[4] = metadataSource;
  v7 = a3;
  dispatch_async(var1, block);
}

void __59__APMRNowPlayingControllerDelegate_notifyNewPlaybackState___block_invoke(uint64_t a1)
{
  metadataSource_handleMRPlaybackStateChangedInternal(*(_QWORD **)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (void)notifyNewProxiableSupportedCommands:(id)a3
{
  id v3;
  OpaqueAPMetadataSource *metadataSource;
  id v5;
  NSObject *var1;
  OpaqueAPMetadataSource *v7;
  uint64_t v8;
  _QWORD block[6];

  v3 = a3;
  if (a3)
  {
    metadataSource = self->_metadataSource;
    if (gLogCategory_APMetadataSource <= 30
      && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
    {
      v7 = metadataSource;
      v8 = objc_msgSend(v3, "count");
      LogPrintF();
    }
    v3 = (id)objc_msgSend(v3, "copy", v7, v8);
    if (v3)
    {
      CFRetain(metadataSource);
      v5 = v3;
      var1 = metadataSource->var1;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __72__APMRNowPlayingControllerDelegate_notifyNewProxiableSupportedCommands___block_invoke;
      block[3] = &unk_1E82672A8;
      block[4] = v3;
      block[5] = metadataSource;
      dispatch_async(var1, block);
    }
    else
    {
      APSLogErrorAt();
    }
  }

}

void __72__APMRNowPlayingControllerDelegate_notifyNewProxiableSupportedCommands___block_invoke(uint64_t a1)
{
  metadataSource_handleMRSupportedCommandsChangedInternal(*(_QWORD **)(a1 + 40), *(CFArrayRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));

}

- (void)notifyNewNowPlayingClient:(id)a3
{
  OpaqueAPMetadataSource *metadataSource;
  void *v5;
  id v6;
  NSObject *var1;
  OpaqueAPMetadataSource *v8;
  id v9;
  _QWORD block[7];

  if (a3)
  {
    metadataSource = self->_metadataSource;
    if (gLogCategory_APMetadataSource <= 30
      && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
    {
      v8 = metadataSource;
      v9 = a3;
      LogPrintF();
    }
    v5 = (void *)objc_msgSend(a3, "copy", v8, v9);
    if (v5)
    {
      CFRetain(metadataSource);
      v6 = v5;
      var1 = metadataSource->var1;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__APMRNowPlayingControllerDelegate_notifyNewNowPlayingClient___block_invoke;
      block[3] = &unk_1E82672D0;
      block[5] = v5;
      block[6] = metadataSource;
      block[4] = a3;
      dispatch_async(var1, block);
    }
    else
    {
      APSLogErrorAt();
    }
  }
  else
  {
    APSLogErrorAt();
    v5 = 0;
  }

}

void __62__APMRNowPlayingControllerDelegate_notifyNewNowPlayingClient___block_invoke(uint64_t a1)
{
  metadataSource_handleNowPlayingClientChangedInternal(*(_QWORD **)(a1 + 48), *(_QWORD *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 48));

}

- (void)controller:(id)a3 didLoadResponse:(id)a4
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  OpaqueAPMetadataSource *metadataSource;
  uint64_t v10;
  _BOOL8 v11;
  OpaqueAPMetadataSource *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;

  v6 = objc_msgSend(a4, "playbackState", a3);
  v7 = (void *)objc_msgSend(a4, "proxiableSupportedCommands");
  v8 = objc_msgSend(a4, "clientProperties");
  if (gLogCategory_APMetadataSource <= 50
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    metadataSource = self->_metadataSource;
    v10 = objc_msgSend(v7, "count");
    if (gLogCategory_APMetadataSource > 40)
      v11 = 0;
    else
      v11 = gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize() != 0;
    v16 = v11;
    v17 = objc_msgSend(a4, "playbackQueue");
    v14 = v10;
    v15 = v8;
    v12 = metadataSource;
    v13 = v6;
    LogPrintF();
  }
  -[APMRNowPlayingControllerDelegate notifyNewContentItems:](self, "notifyNewContentItems:", objc_msgSend((id)objc_msgSend(a4, "playbackQueue", v12, v13, v14, v15, v16, v17), "contentItems"));
  -[APMRNowPlayingControllerDelegate notifyNewPlaybackState:](self, "notifyNewPlaybackState:", v6);
  -[APMRNowPlayingControllerDelegate notifyNewProxiableSupportedCommands:](self, "notifyNewProxiableSupportedCommands:", v7);
  -[APMRNowPlayingControllerDelegate notifyNewNowPlayingClient:](self, "notifyNewNowPlayingClient:", v8);
}

- (void)controller:(id)a3 playbackQueueDidChangeFrom:(id)a4 to:(id)a5
{
  OpaqueAPMetadataSource *metadataSource;
  id v8;

  if (gLogCategory_APMetadataSource <= 30
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    metadataSource = self->_metadataSource;
    v8 = a5;
    LogPrintF();
  }
  -[APMRNowPlayingControllerDelegate notifyNewContentItems:](self, "notifyNewContentItems:", objc_msgSend(a5, "contentItems", metadataSource, v8));
}

- (void)controller:(id)a3 contentItemsDidUpdateWithContentItemChanges:(id)a4
{
  if (gLogCategory_APMetadataSource <= 30
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[APMRNowPlayingControllerDelegate notifyContentItemUpdates:](self, "notifyContentItemUpdates:", a4);
}

- (void)controller:(id)a3 didLoadArtworkForContentItems:(id)a4
{
  void *v7;
  OpaqueAPMetadataSource *metadataSource;
  id v9;
  _QWORD v10[5];

  if (gLogCategory_APMetadataSource <= 30
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    metadataSource = self->_metadataSource;
    v9 = a4;
    LogPrintF();
  }
  v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "response", metadataSource, v9), "playbackQueue"), "contentItems");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__APMRNowPlayingControllerDelegate_controller_didLoadArtworkForContentItems___block_invoke;
  v10[3] = &unk_1E8267320;
  v10[4] = a4;
  -[APMRNowPlayingControllerDelegate notifyContentItemUpdates:](self, "notifyContentItemUpdates:", objc_msgSend(v7, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v10)));
}

BOOL __77__APMRNowPlayingControllerDelegate_controller_didLoadArtworkForContentItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", objc_msgSend(a2, "identifier")) != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5
{
  uint64_t v5;

  v5 = *(_QWORD *)&a5;
  if (gLogCategory_APMetadataSource <= 30
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[APMRNowPlayingControllerDelegate notifyNewPlaybackState:](self, "notifyNewPlaybackState:", v5);
}

- (void)controller:(id)a3 supportedCommandsDidChangeFrom:(id)a4 to:(id)a5
{
  OpaqueAPMetadataSource *metadataSource;

  if (gLogCategory_APMetadataSource <= 30
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    metadataSource = self->_metadataSource;
    LogPrintF();
  }
  -[APMRNowPlayingControllerDelegate notifyNewProxiableSupportedCommands:](self, "notifyNewProxiableSupportedCommands:", objc_msgSend((id)objc_msgSend(a3, "response", metadataSource), "proxiableSupportedCommands"));
}

- (void)controller:(id)a3 clientPropertiesDidChangeFrom:(id)a4 to:(id)a5
{
  if (gLogCategory_APMetadataSource <= 30
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[APMRNowPlayingControllerDelegate notifyNewNowPlayingClient:](self, "notifyNewNowPlayingClient:", a5);
}

- (void)controller:(id)a3 playerPathDidChange:(id)a4
{
  if (gLogCategory_APMetadataSource <= 50
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[APMRNowPlayingControllerDelegate flushMetadata](self, "flushMetadata");
}

@end
