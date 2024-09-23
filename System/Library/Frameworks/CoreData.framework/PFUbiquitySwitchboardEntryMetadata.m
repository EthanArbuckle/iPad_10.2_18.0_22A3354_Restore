@implementation PFUbiquitySwitchboardEntryMetadata

- (void)setUbiquityRootLocation:(uint64_t)a1
{
  void *v4;
  const char *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    if (v4 != a2)
    {

      v6 = a2;
      *(_QWORD *)(a1 + 24) = v6;
      v7 = *(void **)(a1 + 80);
      if (v7)
      {
        objc_setProperty_nonatomic(v7, v5, v6, 24);
        v6 = *(id *)(a1 + 24);
      }
      v8 = *(void **)(a1 + 72);
      if (v8)
      {
        objc_setProperty_nonatomic(v8, v5, v6, 40);
        v6 = *(id *)(a1 + 24);
      }
      -[PFUbiquitySwitchboardCacheWrapper setUbiquityRootLocation:](*(_QWORD *)(a1 + 88), v6);
      if (*(_QWORD *)(a1 + 24))
      {
        v9 = *(id *)(a1 + 120);
        *(_QWORD *)(a1 + 120) = -[PFUbiquityBaselineHeuristics initWithLocalPeerID:storeName:modelVersionHash:andUbiquityRootLocation:]([PFUbiquityBaselineHeuristics alloc], "initWithLocalPeerID:storeName:modelVersionHash:andUbiquityRootLocation:", *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 24));

      }
      else
      {

        *(_QWORD *)(a1 + 120) = 0;
      }
    }
  }
}

- (void)tearDown
{
  if (a1)
  {
    -[_PFUbiquityRecordsImporter tearDown](a1[9]);
    -[_PFUbiquityRecordsExporter stopWatchingForChanges](a1[10]);
    -[PFUbiquitySwitchboardCacheWrapper cacheWrapperWillBeRemovedFromEntry](a1[11]);
  }
}

- (uint64_t)setUseLocalStorage:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v3 = result;
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@:%@\nUsing local storage: %d for new NSFileManager current token %@"), "-[PFUbiquitySwitchboardEntryMetadata setUseLocalStorage:]", 906, *(_QWORD *)(v3 + 8), *(_QWORD *)(v3 + 16), a2, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "ubiquityIdentityToken"));
    *(_BYTE *)(v3 + 104) = a2;
    v4 = *(_QWORD *)(v3 + 80);
    if (v4)
    {
      *(_BYTE *)(v4 + 66) = a2;
      *(_BYTE *)(v4 + 65) = a2 ^ 1;
    }
    result = *(_QWORD *)(v3 + 72);
    if (a2)
    {
      return -[_PFUbiquityRecordsImporter tearDown](result);
    }
    else if (result)
    {
      if ((*(_BYTE *)(result + 24) & 1) == 0)
      {
        *(_BYTE *)(result + 128) = 1;
        *(_BYTE *)(result + 24) = 1;
      }
    }
  }
  return result;
}

- (PFUbiquitySwitchboardEntryMetadata)initWithLocalPeerID:(id)a3 ubiquityRootLocation:(id)a4 localRootLocation:(id)a5 storeName:(id)a6 andPrivateQueue:(id)a7
{
  char *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PFUbiquitySwitchboardEntryMetadata;
  v12 = -[PFUbiquitySwitchboardEntryMetadata init](&v14, sel_init);
  if (v12)
  {
    *((_QWORD *)v12 + 1) = a3;
    *((_QWORD *)v12 + 2) = a6;
    *((_QWORD *)v12 + 15) = 0;
    -[PFUbiquitySwitchboardEntryMetadata setUbiquityRootLocation:]((uint64_t)v12, a4);
    *((_QWORD *)v12 + 4) = a5;
    *((_QWORD *)v12 + 5) = 0;
    *((_QWORD *)v12 + 6) = objc_alloc_init(MEMORY[0x1E0C99E20]);
    *(_OWORD *)(v12 + 56) = 0u;
    *(_OWORD *)(v12 + 72) = 0u;
    *((_QWORD *)v12 + 11) = 0;
    *((_WORD *)v12 + 52) = 1;
    *((_QWORD *)v12 + 14) = a7;
    dispatch_retain((dispatch_object_t)a7);
  }
  return (PFUbiquitySwitchboardEntryMetadata *)v12;
}

- (void)dealloc
{
  SEL v3;
  NSObject *privateQueue;
  objc_super v5;

  self->_localPeerID = 0;
  self->_storeName = 0;

  self->_ubiquityRootLocation = 0;
  self->_localRootLocation = 0;

  self->_activeModelVersionHash = 0;
  self->_stores = 0;

  self->_privatePSC = 0;
  self->_privateStore = 0;

  self->_importer = 0;
  self->_exporter = 0;
  objc_setProperty_nonatomic(self, v3, 0, 88);
  privateQueue = self->_privateQueue;
  self->_privateQueue = 0;
  dispatch_release(privateQueue);

  self->_baselineHeuristics = 0;
  v5.receiver = self;
  v5.super_class = (Class)PFUbiquitySwitchboardEntryMetadata;
  -[PFUbiquitySwitchboardEntryMetadata dealloc](&v5, sel_dealloc);
}

- (void)setUseLocalAccount:(uint64_t)a1
{
  char v2;
  BOOL v4;

  if (a1)
  {
    v2 = a2;
    if (*(_BYTE *)(a1 + 105) && (a2 & 1) == 0)
    {

      *(_QWORD *)(a1 + 80) = 0;
      -[_PFUbiquityRecordsImporter tearDown](*(_QWORD *)(a1 + 72));

      *(_QWORD *)(a1 + 72) = 0;
      -[PFUbiquitySwitchboardCacheWrapper cacheWrapperWillBeRemovedFromEntry](*(_QWORD *)(a1 + 88));

      *(_QWORD *)(a1 + 88) = 0;
LABEL_9:
      *(_BYTE *)(a1 + 105) = v2;
      return;
    }
    if (*(_BYTE *)(a1 + 105))
      v4 = 1;
    else
      v4 = a2 == 0;
    if (!v4)
      goto LABEL_9;
  }
}

@end
