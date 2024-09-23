@implementation CKMergeableValueDownloadTask

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
  objc_storeStrong((id *)&self->_record, a3);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (CKMergeableValueID)mergeableValueID
{
  return self->_mergeableValueID;
}

- (void)setMergeableValueID:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableValueID, a3);
}

- (CKMergeableRecordValue)recordValue
{
  return self->_recordValue;
}

- (void)setRecordValue:(id)a3
{
  objc_storeStrong((id *)&self->_recordValue, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_recordValue, 0);
  objc_storeStrong((id *)&self->_mergeableValueID, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end
