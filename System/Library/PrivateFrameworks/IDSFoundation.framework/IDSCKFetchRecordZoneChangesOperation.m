@implementation IDSCKFetchRecordZoneChangesOperation

+ (Class)__class
{
  if (qword_1EE40B130 != -1)
    dispatch_once(&qword_1EE40B130, &unk_1E3C20738);
  return (Class)(id)qword_1EE40B128;
}

+ (id)alloc
{
  uint64_t v2;
  double v3;

  return objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

- (BOOL)fetchAllChanges
{
  return self->_fetchAllChanges;
}

- (void)setFetchAllChanges:(BOOL)a3
{
  self->_fetchAllChanges = a3;
}

- (id)recordChangedBlock
{
  return self->_recordChangedBlock;
}

- (void)setRecordChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)recordWithIDWasDeletedBlock
{
  return self->_recordWithIDWasDeletedBlock;
}

- (void)setRecordWithIDWasDeletedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)recordZoneChangeTokensUpdatedBlock
{
  return self->_recordZoneChangeTokensUpdatedBlock;
}

- (void)setRecordZoneChangeTokensUpdatedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)recordZoneFetchCompletionBlock
{
  return self->_recordZoneFetchCompletionBlock;
}

- (void)setRecordZoneFetchCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)fetchRecordZoneChangesCompletionBlock
{
  return self->_fetchRecordZoneChangesCompletionBlock;
}

- (void)setFetchRecordZoneChangesCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchRecordZoneChangesCompletionBlock, 0);
  objc_storeStrong(&self->_recordZoneFetchCompletionBlock, 0);
  objc_storeStrong(&self->_recordZoneChangeTokensUpdatedBlock, 0);
  objc_storeStrong(&self->_recordWithIDWasDeletedBlock, 0);
  objc_storeStrong(&self->_recordChangedBlock, 0);
}

@end
