@implementation AVChapterMetadataItem

- (int64_t)_chapterGroupIndex
{
  return self->_privChapter->chapterGroupIndex;
}

- (int64_t)_chapterIndex
{
  return self->_privChapter->chapterIndex;
}

- (void)_takeValueFrom:(id)a3
{
  id v5;
  int v6;
  CFTypeID v7;
  CFTypeID TypeID;
  NSObject *v9;
  NSObject *v10;
  CFTypeID v11;
  NSObject *v12;
  CFTypeID v13;
  const void *v14;
  const void *v15;
  CFTypeID v16;
  CFTypeRef v17;
  id v18;

  v5 = -[AVChapterMetadataItem commonKey](self, "commonKey");
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CC4720]);
  v7 = CFGetTypeID(a3);
  TypeID = CFDictionaryGetTypeID();
  if (v6)
  {
    if (v7 != TypeID)
      goto LABEL_10;
    v9 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC3FE0]);
    v10 = v9;
    if (v9)
    {
      v11 = CFGetTypeID(v9);
      if (v11 == CFDataGetTypeID())
      {
        v10 = CFRetain(v10);
        goto LABEL_11;
      }
LABEL_10:
      v10 = 0;
    }
  }
  else
  {
    if (v7 != TypeID)
      goto LABEL_10;
    v12 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC4030]);
    v10 = v12;
    if (v12)
    {
      v13 = CFGetTypeID(v12);
      if (v13 == CFStringGetTypeID())
        v10 = CFRetain(v10);
      else
        v10 = 0;
    }
    v14 = (const void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC4028]);
    if (v14)
    {
      v15 = v14;
      v16 = CFGetTypeID(v14);
      if (v16 == CFStringGetTypeID())
      {
        v17 = (id)CFRetain(v15);

        v18 = objc_alloc(MEMORY[0x1E0C99D80]);
        self->super._priv->extras = (NSDictionary *)objc_msgSend(v18, "initWithObjectsAndKeys:", v17, *MEMORY[0x1E0CC47A0], 0);
      }
    }
  }
LABEL_11:

  self->_privChapter->value = v10;
  -[AVChapterMetadataItem _setValueStatus:figErrorCode:](self, "_setValueStatus:figErrorCode:", 2, 0);
}

uint64_t __37__AVChapterMetadataItem__valueStatus__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 16)
                                                                              + 128);
  return result;
}

uint64_t __75__AVChapterMetadataItem_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 144), "addObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_valueForKeyDependsOnMetadataValue:(id)a3
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (!a3)
    goto LABEL_6;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("value")) & 1) != 0)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  v7 = objc_msgSend(a3, "rangeOfString:options:", CFSTR("Value"), 14);
  LOBYTE(v5) = 1;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL && !v6)
  {
LABEL_6:
    v5 = objc_msgSend(a3, "isEqualToString:", CFSTR("extraAttributes"));
    if (v5)
    {
      v8 = -[AVChapterMetadataItem commonKey](self, "commonKey");
      LOBYTE(v5) = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CC4720]) ^ 1;
    }
  }
  return v5;
}

- (id)commonKey
{
  return self->_privChapter->chapterType;
}

- (id)_initWithAsset:(id)a3 chapterGroupIndex:(int64_t)a4 chapterIndex:(int64_t)a5 chapterType:(id)a6 extendedLanguageTag:(id)a7 languageCode:(id)a8 chapterDataType:(id)a9 time:(id *)a10 duration:(id *)a11
{
  AVChapterMetadataItem *v17;
  AVChapterMetadataItemInternal *v18;
  void *ISO639_1FromISO639_2T;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v20;
  AVChapterMetadataItemInternal *privChapter;
  int64_t var3;
  AVChapterMetadataItemInternal *v23;
  __int128 v24;
  const void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)AVChapterMetadataItem;
  v17 = -[AVMetadataItem init](&v27, sel_init);
  if (v17)
  {
    v18 = objc_alloc_init(AVChapterMetadataItemInternal);
    v17->_privChapter = v18;
    if (!a6)
      goto LABEL_17;
    if (!a3)
      goto LABEL_17;
    if (!v18)
      goto LABEL_17;
    CFRetain(v18);
    v17->_privChapter->readWriteQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avchaptermetadataitem");
    if (!v17->_privChapter->readWriteQueue)
      goto LABEL_17;
    v17->_privChapter->weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v17);
    v17->_privChapter->chapterGroupIndex = a4;
    v17->_privChapter->chapterIndex = a5;
    v17->_privChapter->chapterType = (NSString *)a6;
    if (a7 || !a8)
    {
      if (a7)
      {
        v20 = a10;
        if (!a8)
          a8 = (id)AVLanguageCodeFromExtendedLanguageTag(a7);
LABEL_15:
        v17->_privChapter->extendedLanguageTag = (NSString *)objc_msgSend(a7, "copy");
        v17->_privChapter->languageCode = (NSString *)objc_msgSend(a8, "copy");
        v17->_privChapter->chapterDataType = (NSString *)objc_msgSend(a9, "copy");
        privChapter = v17->_privChapter;
        var3 = v20->var3;
        *(_OWORD *)&privChapter->time.value = *(_OWORD *)&v20->var0;
        privChapter->time.epoch = var3;
        v23 = v17->_privChapter;
        v24 = *(_OWORD *)&a11->var0;
        v23->duration.epoch = a11->var3;
        *(_OWORD *)&v23->duration.value = v24;
        v25 = (const void *)objc_msgSend(a3, "_figAsset");
        if (v25)
        {
          v17->_privChapter->figAsset = (OpaqueFigAsset *)CFRetain(v25);
          -[AVChapterMetadataItem _addFigAssetNotifications](v17, "_addFigAssetNotifications");
          v17->_privChapter->completions = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
          return v17;
        }
LABEL_17:

        return 0;
      }
    }
    else
    {
      ISO639_1FromISO639_2T = (void *)FigMetadataGetISO639_1FromISO639_2T();
      if (ISO639_1FromISO639_2T)
        a7 = ISO639_1FromISO639_2T;
      else
        a7 = a8;
    }
    v20 = a10;
    goto LABEL_15;
  }
  return v17;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  uint64_t v7;
  void *v8;
  NSObject *readWriteQueue;
  AVChapterMetadataItemInternal *privChapter;
  OpaqueFigAsset *figAsset;
  int64_t chapterGroupIndex;
  int64_t chapterIndex;
  uint64_t (*v14)(OpaqueFigAsset *, int64_t, int64_t, uint64_t);
  uint64_t v15;
  AVChapterMetadataItem *v16;
  uint64_t v17;
  _QWORD v18[6];
  _QWORD v19[6];

  if (-[AVChapterMetadataItem _valueStatus](self, "_valueStatus") < 2)
  {
    v7 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __75__AVChapterMetadataItem_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke;
    v19[3] = &unk_1E3030998;
    v19[4] = self;
    v19[5] = a3;
    if (objc_msgSend((id)objc_msgSend(a3, "indexesOfObjectsPassingTest:", v19), "count"))
    {
      if (a4)
      {
        v8 = (void *)objc_msgSend(a4, "copy");
        readWriteQueue = self->_privChapter->readWriteQueue;
        v18[0] = v7;
        v18[1] = 3221225472;
        v18[2] = __75__AVChapterMetadataItem_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke_2;
        v18[3] = &unk_1E302FCE8;
        v18[4] = self;
        v18[5] = v8;
        av_readwrite_dispatch_queue_write(readWriteQueue, v18);

      }
      privChapter = self->_privChapter;
      figAsset = privChapter->figAsset;
      if (figAsset)
      {
        chapterGroupIndex = privChapter->chapterGroupIndex;
        chapterIndex = privChapter->chapterIndex;
        v14 = *(uint64_t (**)(OpaqueFigAsset *, int64_t, int64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                  + 64);
        if (v14)
        {
          v15 = v14(figAsset, chapterGroupIndex, chapterIndex, 1);
          if (!(_DWORD)v15)
          {
            v16 = self;
            v17 = 1;
LABEL_14:
            -[AVChapterMetadataItem _setValueStatus:figErrorCode:](v16, "_setValueStatus:figErrorCode:", v17, v15);
            return;
          }
        }
        else
        {
          v15 = 4294954514;
        }
      }
      else
      {
        v15 = 4294955126;
      }
      v16 = self;
      v17 = 3;
      goto LABEL_14;
    }
  }
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)_setValueStatus:(int64_t)a3 figErrorCode:(int)a4
{
  NSObject *readWriteQueue;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD block[7];
  int v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  if (a3)
  {
    readWriteQueue = self->_privChapter->readWriteQueue;
    if (a3 == 1)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __54__AVChapterMetadataItem__setValueStatus_figErrorCode___block_invoke;
      v16[3] = &unk_1E302FDB0;
      v16[4] = self;
      v5 = v16;
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__AVChapterMetadataItem__setValueStatus_figErrorCode___block_invoke_2;
      block[3] = &unk_1E3030A50;
      block[4] = self;
      block[6] = a3;
      v15 = a4;
      v5 = block;
    }
    v5[5] = &v17;
    av_readwrite_dispatch_queue_write(readWriteQueue, v5);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = (void *)v18[5];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v23, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v6);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i) + 16))();
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v23, 16);
      }
      while (v7);
    }

  }
  _Block_object_dispose(&v17, 8);
}

- (void)_ensureValueLoadedSync
{
  AVChapterMetadataItemInternal *privChapter;
  OpaqueFigAsset *figAsset;
  int64_t chapterGroupIndex;
  int64_t chapterIndex;
  uint64_t (*v7)(OpaqueFigAsset *, int64_t, int64_t, uint64_t, CFTypeRef *);
  uint64_t v8;
  CFTypeRef cf;

  if (-[AVChapterMetadataItem _valueStatus](self, "_valueStatus") <= 1)
  {
    cf = 0;
    privChapter = self->_privChapter;
    figAsset = privChapter->figAsset;
    if (figAsset)
    {
      chapterGroupIndex = privChapter->chapterGroupIndex;
      chapterIndex = privChapter->chapterIndex;
      v7 = *(uint64_t (**)(OpaqueFigAsset *, int64_t, int64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
      if (v7)
      {
        v8 = v7(figAsset, chapterGroupIndex, chapterIndex, 1, &cf);
        if (!(_DWORD)v8)
        {
          -[AVChapterMetadataItem _takeValueFrom:](self, "_takeValueFrom:", objc_msgSend((id)cf, "objectAtIndex:", 0, v8));
          goto LABEL_9;
        }
      }
      else
      {
        v8 = 4294954514;
      }
    }
    else
    {
      v8 = 4294955126;
    }
    -[AVChapterMetadataItem _setValueStatus:figErrorCode:](self, "_setValueStatus:figErrorCode:", 3, v8);
LABEL_9:
    if (cf)
      CFRelease(cf);
  }
}

- (int64_t)_valueStatus
{
  NSObject *readWriteQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  readWriteQueue = self->_privChapter->readWriteQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__AVChapterMetadataItem__valueStatus__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(readWriteQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_addFigAssetNotifications
{
  id v3;

  if (self->_privChapter->figAsset)
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    CFRetain(self->_privChapter->weakReference);
    objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", self->_privChapter->weakReference, chapterItem_handleFigChapterLoadingNotification, *MEMORY[0x1E0CC3658], self->_privChapter->figAsset, 0);
    objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", self->_privChapter->weakReference, chapterItem_handleFigChapterLoadingNotification, *MEMORY[0x1E0CC3650], self->_privChapter->figAsset, 0);
    objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", self->_privChapter->weakReference, chapterItem_handleFigChapterLoadingNotification, *MEMORY[0x1E0CC3688], self->_privChapter->figAsset, 0);
  }
}

- (id)extraAttributes
{
  id v3;
  objc_super v5;

  v3 = -[AVChapterMetadataItem commonKey](self, "commonKey");
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CC4720]) & 1) == 0)
    -[AVChapterMetadataItem _ensureValueLoadedSync](self, "_ensureValueLoadedSync");
  v5.receiver = self;
  v5.super_class = (Class)AVChapterMetadataItem;
  return -[AVMetadataItem extraAttributes](&v5, sel_extraAttributes);
}

- (id)value
{
  -[AVChapterMetadataItem _ensureValueLoadedSync](self, "_ensureValueLoadedSync");
  return self->_privChapter->value;
}

- (void)dealloc
{
  AVChapterMetadataItemInternal *privChapter;
  OpaqueFigAsset *figAsset;
  NSObject *readWriteQueue;
  objc_super v6;

  if (self->_privChapter)
  {
    -[AVChapterMetadataItem _removeFigAssetNotifications](self, "_removeFigAssetNotifications");
    privChapter = self->_privChapter;
    figAsset = privChapter->figAsset;
    if (figAsset)
    {
      CFRelease(figAsset);
      privChapter = self->_privChapter;
    }
    readWriteQueue = privChapter->readWriteQueue;
    if (readWriteQueue)
    {
      dispatch_release(readWriteQueue);
      privChapter = self->_privChapter;
    }

    CFRelease(self->_privChapter);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVChapterMetadataItem;
  -[AVMetadataItem dealloc](&v6, sel_dealloc);
}

- (void)_removeFigAssetNotifications
{
  id v3;

  if (self->_privChapter->figAsset)
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_privChapter->weakReference, chapterItem_handleFigChapterLoadingNotification, *MEMORY[0x1E0CC3658], self->_privChapter->figAsset);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_privChapter->weakReference, chapterItem_handleFigChapterLoadingNotification, *MEMORY[0x1E0CC3650], self->_privChapter->figAsset);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_privChapter->weakReference, chapterItem_handleFigChapterLoadingNotification, *MEMORY[0x1E0CC3688], self->_privChapter->figAsset);
    CFRelease(self->_privChapter->weakReference);
  }
}

uint64_t __54__AVChapterMetadataItem__setValueStatus_figErrorCode___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  v2 = *(_QWORD *)(v1 + 128);
  if (v2)
  {
    if (v2 >= 2)
    {
      v3 = result;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = objc_msgSend(*(id *)(v1 + 144), "copy");
      return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16) + 144), "removeAllObjects");
    }
  }
  else
  {
    *(_QWORD *)(v1 + 128) = 1;
  }
  return result;
}

uint64_t __75__AVChapterMetadataItem_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_valueForKeyDependsOnMetadataValue:", objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:"));
}

uint64_t __54__AVChapterMetadataItem__setValueStatus_figErrorCode___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 16);
  if (*(uint64_t *)(v3 + 128) <= 1)
  {
    *(_QWORD *)(v3 + 128) = *(_QWORD *)(a1 + 48);
    v2 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(a1 + 48) == 3)
    {
      *(_DWORD *)(*(_QWORD *)(v2 + 16) + 136) = *(_DWORD *)(a1 + 56);
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(v2 + 16) + 144), "copy");
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 144), "removeAllObjects");
}

- (AVChapterMetadataItem)init
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  v5 = *MEMORY[0x1E0CA2E18];
  v6 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v3 = v5;
  v4 = v6;
  return (AVChapterMetadataItem *)-[AVChapterMetadataItem _initWithAsset:chapterGroupIndex:chapterIndex:chapterType:extendedLanguageTag:languageCode:chapterDataType:time:duration:](self, "_initWithAsset:chapterGroupIndex:chapterIndex:chapterType:extendedLanguageTag:languageCode:chapterDataType:time:duration:", 0, 0, 0, 0, 0, 0, 0, &v5, &v3);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[AVMetadataItem _initWithFigMetadataDictionary:](+[AVMutableMetadataItem allocWithZone:](AVMutableMetadataItem, "allocWithZone:", a3), "_initWithFigMetadataDictionary:", -[AVMetadataItem _figMetadataDictionaryWithValue:diviningValueDataType:](self, "_figMetadataDictionaryWithValue:diviningValueDataType:", 1, 0));
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  AVChapterMetadataItemInternal *privChapter;
  NSObject *value;
  const __CFAllocator *v8;
  const __CFString *v9;
  __int128 v11;
  CMTime time;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  privChapter = self->_privChapter;
  v11 = *(_OWORD *)&privChapter->chapterType;
  value = privChapter->value;
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  time = (CMTime)privChapter->time;
  v9 = (id)CMTimeCopyDescription(v8, &time);
  time = (CMTime)self->_privChapter->duration;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, chapterType=%@, locale identifier=%@, value=%@, time=%@, duration=%@, extras=%@>"), v5, self, v11, value, v9, (id)CMTimeCopyDescription(v8, &time), self->super._priv->extras);
}

- (id)key
{
  return self->_privChapter->chapterType;
}

- (id)keySpace
{
  return (id)*MEMORY[0x1E0CC4730];
}

- (id)locale
{
  if (self->_privChapter->extendedLanguageTag)
    return (id)objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:");
  else
    return 0;
}

- (id)extendedLanguageTag
{
  return self->_privChapter->extendedLanguageTag;
}

- (id)languageCode
{
  return self->_privChapter->languageCode;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(self->var3 + 80);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(self->var3 + 104);
  return self;
}

- (id)startDate
{
  return 0;
}

- (id)dataType
{
  return self->_privChapter->chapterDataType;
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  int64_t result;

  if (!-[AVChapterMetadataItem _valueForKeyDependsOnMetadataValue:](self, "_valueForKeyDependsOnMetadataValue:", a3))
    return 2;
  result = -[AVChapterMetadataItem _valueStatus](self, "_valueStatus");
  if (a4)
  {
    if (result == 3)
    {
      *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(self->_privChapter->valueErrorCode, 0);
      return 3;
    }
  }
  return result;
}

- (void)cancelLoading
{
  -[AVChapterMetadataItem _setValueStatus:figErrorCode:](self, "_setValueStatus:figErrorCode:", 4, 0);
}

@end
