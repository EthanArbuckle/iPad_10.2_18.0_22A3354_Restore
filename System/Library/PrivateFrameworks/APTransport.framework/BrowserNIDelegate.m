@implementation BrowserNIDelegate

- (BrowserNIDelegate)initWithBrowser:(OpaqueAPBrowser *)a3
{
  BrowserNIDelegate *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BrowserNIDelegate;
  v3 = -[BrowserNIDelegate init](&v6, sel_init);
  if (v3)
  {
    v4 = FigCFWeakReferenceHolderCreateWithReferencedObject();
    v3->_browserWeak = (OpaqueFigCFWeakReferenceHolder *)v4;
    if (!v4)
    {
      APSLogErrorAt();

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  OpaqueFigCFWeakReferenceHolder *browserWeak;
  objc_super v4;

  browserWeak = self->_browserWeak;
  if (browserWeak)
  {
    CFRelease(browserWeak);
    self->_browserWeak = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)BrowserNIDelegate;
  -[BrowserNIDelegate dealloc](&v4, sel_dealloc);
}

- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4
{
  uint64_t v4;
  const void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t DerivedStorage;
  int v13;
  float v14;
  float v15;
  float v16;
  const __CFDictionary *Value;
  const __CFDictionary *v18;
  __CFDictionary *MutableCopy;
  __CFDictionary *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *key;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v4)
  {
    v5 = (const void *)v4;
    v6 = **(_DWORD **)CMBaseObjectGetDerivedStorage();
    if (v6 <= 30 && (v6 != -1 || _LogCategory_Initialize()))
    {
      v22 = objc_msgSend(a4, "count");
      LogPrintF();
    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16, v22);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(a4);
          v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
          DerivedStorage = CMBaseObjectGetDerivedStorage();
          key = 0;
          v13 = **(_DWORD **)DerivedStorage;
          if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize()))
          {
            v23 = objc_msgSend(v11, "discoveryToken", v23, v24);
            v24 = v11;
            LogPrintF();
          }
          if (APSRotatingKeyMapperIsInitialized())
          {
            objc_msgSend(v11, "distance");
            v15 = v14;
            getNINearbyObjectDistanceNotAvailable();
            if (v15 != v16)
            {
              if (objc_msgSend(v11, "deviceIdentifier"))
              {
                if (APSRotatingKeyMapperSetDataForKey())
                  goto LABEL_30;
                if (!key)
                  goto LABEL_28;
                Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(DerivedStorage + 200), key);
                if (!Value)
                {
LABEL_30:
                  APSLogErrorAt();
                }
                else
                {
                  v18 = (const __CFDictionary *)CFDictionaryGetValue(Value, CFSTR("LastEventInfo"));
                  if (v18)
                  {
                    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v18);
                    if (MutableCopy)
                    {
                      v20 = MutableCopy;
                      CFDictionarySetValue(MutableCopy, CFSTR("proximityData"), v11);
                      if (browser_setEventInfoForDevice(v5, key, v20))
                        APSLogErrorAt();
                      CFRelease(v20);
                    }
                  }
                }
              }
            }
          }
          if (key)
            CFRelease(key);
LABEL_28:
          ++v10;
        }
        while (v8 != v10);
        v21 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        v8 = v21;
      }
      while (v21);
    }
    CFRelease(v5);
  }
}

- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5
{
  uint64_t v7;
  const void *v8;
  int **DerivedStorage;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v7)
  {
    v8 = (const void *)v7;
    DerivedStorage = (int **)CMBaseObjectGetDerivedStorage();
    v10 = **DerivedStorage;
    if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
    {
      v18 = objc_msgSend(a4, "count");
      v20 = a5;
      LogPrintF();
    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16, v18, v20);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(a4);
          v15 = **DerivedStorage;
          if (v15 <= 30)
          {
            v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v14);
            if (v15 != -1 || _LogCategory_Initialize())
            {
              v19 = objc_msgSend(v16, "discoveryToken", v19, v21);
              v21 = v16;
              LogPrintF();
            }
          }
          ++v14;
        }
        while (v12 != v14);
        v17 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        v12 = v17;
      }
      while (v17);
    }
    CFRelease(v8);
  }
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v4;
  const void *v5;
  int **DerivedStorage;
  int v7;

  v4 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v4)
  {
    v5 = (const void *)v4;
    DerivedStorage = (int **)CMBaseObjectGetDerivedStorage();
    NSErrorToOSStatus();
    v7 = **DerivedStorage;
    if (v7 <= 50 && (v7 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    CFRelease(v5);
  }
}

@end
