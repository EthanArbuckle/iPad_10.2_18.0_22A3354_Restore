@implementation PFHistoryAnalyzerDefaultObjectState

- (PFHistoryAnalyzerDefaultObjectState)initWithOriginalChange:(id)a3
{
  PFHistoryAnalyzerDefaultObjectState *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PFHistoryAnalyzerDefaultObjectState;
  v4 = -[PFHistoryAnalyzerDefaultObjectState init](&v7, sel_init);
  if (v4)
  {
    v4->_analyzedObjectID = (NSManagedObjectID *)(id)objc_msgSend(a3, "changedObjectID");
    v4->_originalTransactionNumber = (NSNumber *)(id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend((id)objc_msgSend(a3, "transaction"), "transactionNumber"));
    v5 = objc_msgSend(a3, "changeType");
    v4->_originalChangeType = v5;
    v4->_finalChangeType = v5;
    v4->_finalTransactionNumber = v4->_originalTransactionNumber;
    v4->_tombstone = (NSDictionary *)(id)objc_msgSend(a3, "tombstone");
    v4->_finalChangeAuthor = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "transaction"), "author");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_originalTransactionNumber = 0;
  self->_tombstone = 0;

  self->_finalChangeAuthor = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFHistoryAnalyzerDefaultObjectState;
  -[PFHistoryAnalyzerDefaultObjectState dealloc](&v3, sel_dealloc);
}

- (void)updateWithChange:(id)a3
{

  self->_finalTransactionNumber = (NSNumber *)(id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend((id)objc_msgSend(a3, "transaction"), "transactionNumber"));
  self->_finalChangeType = objc_msgSend(a3, "changeType");

  self->_tombstone = (NSDictionary *)(id)objc_msgSend(a3, "tombstone");
  self->_finalChangeAuthor = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "transaction"), "author");
}

- (id)description
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFHistoryAnalyzerDefaultObjectState;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", -[PFHistoryAnalyzerDefaultObjectState description](&v5, sel_description));
  objc_msgSend(v3, "appendFormat:", CFSTR(" (%@, %@:%@ -> %@:%@, %@)"), self->_analyzedObjectID, self->_originalTransactionNumber, +[NSPersistentHistoryChange stringForChangeType:](NSPersistentHistoryChange, "stringForChangeType:", self->_originalChangeType), self->_finalTransactionNumber, +[NSPersistentHistoryChange stringForChangeType:](NSPersistentHistoryChange, "stringForChangeType:", self->_finalChangeType), self->_finalChangeAuthor);
  return v3;
}

- (NSManagedObjectID)analyzedObjectID
{
  return self->_analyzedObjectID;
}

- (NSNumber)originalTransactionNumber
{
  return self->_originalTransactionNumber;
}

- (int64_t)originalChangeType
{
  return self->_originalChangeType;
}

- (NSNumber)finalTransactionNumber
{
  return self->_finalTransactionNumber;
}

- (int64_t)finalChangeType
{
  return self->_finalChangeType;
}

- (NSDictionary)tombstone
{
  return self->_tombstone;
}

- (NSString)finalChangeAuthor
{
  return self->_finalChangeAuthor;
}

@end
