@implementation MFWebKitMainThread

+ (id)sharedInstance
{
  void *v2;
  MFWebKitMainThread *v3;
  void *v4;

  v2 = (void *)sWKMTSharedInstance;
  if (!sWKMTSharedInstance)
  {
    v3 = objc_alloc_init(MFWebKitMainThread);
    v4 = (void *)sWKMTSharedInstance;
    sWKMTSharedInstance = (uint64_t)v3;

    v2 = (void *)sWKMTSharedInstance;
  }
  return v2;
}

- (MFWebKitMainThread)init
{
  MFWebKitMainThread *v2;
  uint64_t v3;
  MFLock *visibleDictLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFWebKitMainThread;
  v2 = -[MFWebKitMainThread init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D460A8]), "initWithName:andDelegate:", CFSTR("MFWebKitMainThread_Lock"), v2);
    visibleDictLock = v2->_visibleDictLock;
    v2->_visibleDictLock = (MFLock *)v3;

    v2->_visibleDict = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], 0);
  }
  return v2;
}

- (void)dealloc
{
  __CFDictionary *visibleDict;
  objc_super v4;

  visibleDict = self->_visibleDict;
  if (visibleDict)
    CFRelease(visibleDict);
  v4.receiver = self;
  v4.super_class = (Class)MFWebKitMainThread;
  -[MFWebKitMainThread dealloc](&v4, sel_dealloc);
}

- (void)_mainThreadPopulateDictForMimeType:(id)a3
{
  unsigned int v4;
  id key;

  key = a3;
  WebThreadLock();
  v4 = objc_msgSend(MEMORY[0x1E0DD97A8], "canShowMIMEType:", key);
  -[MFLock lock](self->_visibleDictLock, "lock");
  CFDictionarySetValue(self->_visibleDict, key, (const void *)v4);
  -[MFLock unlock](self->_visibleDictLock, "unlock");

}

- (int)dictValueForMimeType:(id)a3
{
  id v4;
  __CFDictionary *visibleDict;
  id v6;
  void *v7;
  __CFDictionary *v8;
  int v9;
  _QWORD v11[5];
  id v12;
  void *value;

  v4 = a3;
  value = 0;
  -[MFLock lock](self->_visibleDictLock, "lock");
  visibleDict = self->_visibleDict;
  if (!visibleDict || !CFDictionaryGetValueIfPresent(visibleDict, v4, (const void **)&value))
  {
    -[MFLock unlock](self->_visibleDictLock, "unlock");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43__MFWebKitMainThread_dictValueForMimeType___block_invoke;
    v11[3] = &unk_1E5A65430;
    v11[4] = self;
    v6 = v4;
    v12 = v6;
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performSyncBlock:", v11);

    -[MFLock lock](self->_visibleDictLock, "lock");
    v8 = self->_visibleDict;
    if (v8)
      value = (void *)CFDictionaryGetValue(v8, v6);

  }
  -[MFLock unlock](self->_visibleDictLock, "unlock");
  v9 = (int)value;

  return v9;
}

uint64_t __43__MFWebKitMainThread_dictValueForMimeType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainThreadPopulateDictForMimeType:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleDictLock, 0);
}

@end
