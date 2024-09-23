@implementation PFUbiquitySaveSnapshot

- (PFUbiquitySaveSnapshot)initWithTransactionLog:(id)a3
{
  PFUbiquitySaveSnapshot *v4;
  PFUbiquitySaveSnapshot *v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  PFUbiquityStoreSaveSnapshot *v9;
  const char *v10;
  PFUbiquityStoreSaveSnapshot *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = -[PFUbiquitySaveSnapshot init](self, "init");
  v5 = v4;
  if (!v4)
    return v5;
  if (a3)
  {
    v6 = (_QWORD *)*((_QWORD *)a3 + 3);
    if (v6)
      v6 = (_QWORD *)v6[6];
    v4->_modelVersionHash = (NSString *)v6;
    v7 = (_QWORD *)*((_QWORD *)a3 + 3);
    if (v7)
      v7 = (_QWORD *)v7[4];
    v5->_exportingPeerID = (NSString *)v7;
    v8 = (void *)*((_QWORD *)a3 + 10);
  }
  else
  {
    v4->_modelVersionHash = 0;
    v8 = 0;
    v4->_exportingPeerID = 0;
  }
  v5->_localPeerID = (NSString *)v8;
  v5->_storeNameToStoreSaveSnapshots = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = -[PFUbiquityStoreSaveSnapshot initWithExportingPeerID:]([PFUbiquityStoreSaveSnapshot alloc], "initWithExportingPeerID:", v5->_exportingPeerID);
  v11 = v9;
  if (a3)
  {
    v12 = (void *)*((_QWORD *)a3 + 10);
    if (!v9)
      goto LABEL_11;
    goto LABEL_10;
  }
  v12 = 0;
  if (v9)
LABEL_10:
    objc_setProperty_nonatomic(v9, v10, v12, 136);
LABEL_11:
  if (a3 && (v13 = *((_QWORD *)a3 + 3)) != 0)
    v14 = *(_QWORD *)(v13 + 40);
  else
    v14 = 0;
  -[NSMutableDictionary setObject:forKey:](v5->_storeNameToStoreSaveSnapshots, "setObject:forKey:", v11, v14);

  return v5;
}

- (PFUbiquitySaveSnapshot)initWithSaveNotification:(id)a3 withLocalPeerID:(id)a4
{
  PFUbiquitySaveSnapshot *v6;

  v6 = -[PFUbiquitySaveSnapshot init](self, "init");
  if (v6)
  {
    v6->_transactionDate = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    v6->_exportingPeerID = (NSString *)a4;
    v6->_localPeerID = (NSString *)a4;
    v6->_modelVersionHash = (NSString *)+[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)PFUbiquityLocation, (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "object"), "persistentStoreCoordinator"), "managedObjectModel"));
    v6->_storeNameToStoreSaveSnapshots = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_transactionDate = 0;
  self->_modelVersionHash = 0;

  self->_exportingPeerID = 0;
  self->_storeNameToStoreSaveSnapshots = 0;

  self->_localPeerID = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquitySaveSnapshot;
  -[PFUbiquitySaveSnapshot dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  NSDate *transactionDate;
  NSString *modelVersionHash;
  NSString *exportingPeerID;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)PFUbiquitySaveSnapshot;
  v4 = -[PFUbiquitySaveSnapshot description](&v9, sel_description);
  if (self)
  {
    transactionDate = self->_transactionDate;
    modelVersionHash = self->_modelVersionHash;
    exportingPeerID = self->_exportingPeerID;
  }
  else
  {
    modelVersionHash = 0;
    transactionDate = 0;
    exportingPeerID = 0;
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n\ttransactionDate: %@\n\tmodelVersionHash: %@\n\texportingPeerID: %@\n\tstoreNameToSaveSnapshots: %@\n"), v4, transactionDate, modelVersionHash, exportingPeerID, self->_storeNameToStoreSaveSnapshots);
}

- (void)storeSaveSnapshotForStore:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  id v5;
  const char *v6;

  if (!a1)
    return 0;
  v3 = objc_msgSend((id)objc_msgSend(a2, "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"));
  v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v3);
  if (!v4)
  {
    v5 = -[PFUbiquityStoreSaveSnapshot initForExport:]([PFUbiquityStoreSaveSnapshot alloc], "initForExport:", *(_QWORD *)(a1 + 24));
    v4 = v5;
    if (v5)
      objc_setProperty_nonatomic(v5, v6, *(id *)(a1 + 32), 136);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v4, v3);

  }
  return v4;
}

@end
