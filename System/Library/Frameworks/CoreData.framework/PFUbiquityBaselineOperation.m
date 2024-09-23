@implementation PFUbiquityBaselineOperation

- (PFUbiquityBaselineOperation)initWithPersistentStore:(id)a3 localPeerID:(id)a4 andUbiquityRootLocation:(id)a5
{
  PFUbiquityBaselineOperation *v6;
  NSManagedObjectModel *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PFUbiquityBaselineOperation;
  v6 = -[PFUbiquityImportOperation initWithPersistentStore:localPeerID:andUbiquityRootLocation:](&v9, sel_initWithPersistentStore_localPeerID_andUbiquityRootLocation_, a3, a4, a5);
  if (v6)
  {
    v7 = (NSManagedObjectModel *)(id)objc_msgSend((id)objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel");
    v6->_model = v7;
    v6->_modelVersionHash = (NSString *)+[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)PFUbiquityLocation, v7);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_modelVersionHash = 0;
  self->_model = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineOperation;
  -[PFUbiquityImportOperation dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  NSString *modelVersionHash;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PFUbiquityBaselineOperation;
  v4 = -[PFUbiquityImportOperation description](&v7, sel_description);
  if (self)
    modelVersionHash = self->_modelVersionHash;
  else
    modelVersionHash = 0;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n\tmodelVersionHash: %@\n"), v4, modelVersionHash);
}

@end
