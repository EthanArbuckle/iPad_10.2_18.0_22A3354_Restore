@implementation PFUbiquityExportContext

- (PFUbiquityExportContext)initWithLocalPeerID:(id)a3 andUbiquityRootLocation:(id)a4
{
  PFUbiquityExportContext *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PFUbiquityExportContext;
  v6 = -[PFUbiquityExportContext init](&v8, sel_init);
  if (v6)
  {
    v6->_storeNameToStoreExportContext = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6->_ubiquityRootPathToStack = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6->_localPeerID = (NSString *)a3;
    v6->_ubiquityRootLocation = (PFUbiquityLocation *)a4;
    v6->_useLocalStorage = 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_storeNameToStoreExportContext = 0;
  self->_ubiquityRootPathToStack = 0;

  self->_localPeerID = 0;
  self->_ubiquityRootLocation = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityExportContext;
  -[PFUbiquityExportContext dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  NSString *localPeerID;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PFUbiquityExportContext;
  v4 = -[PFUbiquityExportContext description](&v7, sel_description);
  if (self)
    localPeerID = self->_localPeerID;
  else
    localPeerID = 0;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n\tlocalPeerID: %@\n\tstoreNameToStoreExportContext: %@\n"), v4, localPeerID, self->_storeNameToStoreExportContext);
}

- (PFUbiquityStoreExportContext)storeExportContextForStore:(uint64_t)a1
{
  uint64_t v4;
  PFUbiquityStoreExportContext *v5;
  _QWORD *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  SEL v11;

  if (!a1)
    return 0;
  v4 = objc_msgSend((id)objc_msgSend(a2, "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"));
  v5 = (PFUbiquityStoreExportContext *)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v4);
  if (!v5)
  {
    v5 = -[PFUbiquityStoreExportContext initWithStoreName:andUbiquityRootLocation:forLocalPeerID:]([PFUbiquityStoreExportContext alloc], "initWithStoreName:andUbiquityRootLocation:forLocalPeerID:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 24));
    objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v5, v4);
    objc_opt_self();
    v6 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, v4, *(_QWORD *)(a1 + 24));
    v8 = v6;
    if (v5)
    {
      if (v6 && (v9 = v6[11]) != 0)
        v10 = *(void **)(v9 + 88);
      else
        v10 = 0;
      objc_setProperty_nonatomic(v5, v7, v10, 48);

      objc_setProperty_nonatomic(v5, v11, a2, 40);
    }
    else
    {

    }
  }
  return v5;
}

@end
