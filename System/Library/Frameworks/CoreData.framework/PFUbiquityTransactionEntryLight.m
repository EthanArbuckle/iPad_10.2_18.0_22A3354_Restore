@implementation PFUbiquityTransactionEntryLight

- (PFUbiquityTransactionEntryLight)init
{
  PFUbiquityTransactionEntryLight *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityTransactionEntryLight;
  result = -[PFUbiquityTransactionEntryLight init](&v3, sel_init);
  if (result)
  {
    result->_globalID = 0;
    result->_transactionType = 0;
    result->_actingPeerID = 0;
    *(_OWORD *)&result->_transactionNumber = 0u;
    *(_OWORD *)&result->_kv = 0u;
  }
  return result;
}

- (PFUbiquityTransactionEntryLight)initWithTransactionEntry:(id)a3 ubiquityRootLocation:(id)a4 andGlobalIDCache:(id)a5
{
  PFUbiquityTransactionEntryLight *v8;
  int v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;
  PFUbiquityGlobalObjectID *v13;

  v8 = -[PFUbiquityTransactionEntryLight init](self, "init");
  if (v8)
  {
    if (a3)
    {
      v9 = objc_msgSend((id)objc_msgSend(a3, "transactionTypeNum"), "intValue");
      if ((v9 - 1) >= 3)
        v10 = 0;
      else
        v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    v8->_transactionType = v10;
    v8->_transactionNumber = (NSNumber *)(id)objc_msgSend(a3, "transactionNumber");
    if (v8->_transactionType == 3)
    {
      v11 = CFSTR("Baseline");
      v12 = 24;
    }
    else
    {
      v8->_actingPeerID = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "actingPeer"), "peerKey");
      v11 = (const __CFString *)+[PFUbiquityLocation createTransactionLogLocationForPeerID:storeName:modelVersionHash:logFilename:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, objc_msgSend((id)objc_msgSend(a3, "actingPeer"), "peerKey"), objc_msgSend((id)objc_msgSend(a3, "storeMetadata"), "ubiquityName"), objc_msgSend((id)objc_msgSend(a3, "storeMetadata"), "modelVersionHashString"), objc_msgSend(a3, "transactionLogFilename"), a4);
      v12 = 48;
    }
    *(Class *)((char *)&v8->super.isa + v12) = (Class)v11;
    v8->_kv = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorString:]([PFUbiquityKnowledgeVector alloc], "initWithKnowledgeVectorString:", objc_msgSend(a3, "knowledgeVectorString"));
    v8->_storeName = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "storeMetadata"), "ubiquityName");
    v8->_transactionDate = (NSDate *)(id)objc_msgSend(a3, "transactionDate");
    v13 = -[PFUbiquityGlobalObjectIDCache createGlobalIDForGlobalIDString:]((uint64_t)a5, (void *)objc_msgSend(a3, "globalIDStr"));
    v8->_globalID = v13;
    if (!v13)
      v8->_globalID = -[PFUbiquityGlobalObjectID initWithString:]([PFUbiquityGlobalObjectID alloc], "initWithString:", objc_msgSend(a3, "globalIDStr"));
  }
  return v8;
}

- (void)dealloc
{
  SEL v3;
  SEL v4;
  SEL v5;
  SEL v6;
  objc_super v7;

  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 8);
    objc_setProperty_nonatomic(self, v3, 0, 24);
    -[PFUbiquityTransactionEntryLight setTransactionNumber:](self, "setTransactionNumber:", 0);
    objc_setProperty_nonatomic(self, v4, 0, 48);
    objc_setProperty_nonatomic(self, v5, 0, 56);
    objc_setProperty_nonatomic(self, v6, 0, 32);
  }
  else
  {
    objc_msgSend(0, "setTransactionNumber:", 0);
  }
  -[PFUbiquityTransactionEntryLight setTransactionDate:](self, "setTransactionDate:", 0);
  v7.receiver = self;
  v7.super_class = (Class)PFUbiquityTransactionEntryLight;
  -[PFUbiquityTransactionEntryLight dealloc](&v7, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityTransactionEntryLight;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\tstoreName: %@\n\tactingPeerID: %@\n\ttransactionNumber: %@\n\ttransactionDate: %@\n\ttransactionType: %d\n\tglobalID: %@\n\tknowledgeVector: %@\n\ttransactionLogLocation: %@\n"), -[PFUbiquityTransactionEntryLight description](&v3, sel_description), self->_storeName, self->_actingPeerID, self->_transactionNumber, self->_transactionDate, self->_transactionType, self->_globalID, self->_kv, self->_transactionLogLocation);
}

- (NSNumber)transactionNumber
{
  return self->_transactionNumber;
}

- (void)setTransactionNumber:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
