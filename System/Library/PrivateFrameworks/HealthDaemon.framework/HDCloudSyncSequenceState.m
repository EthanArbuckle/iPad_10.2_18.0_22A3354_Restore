@implementation HDCloudSyncSequenceState

- (HDCloudSyncSequenceState)initWithRecordsToSave:(id)a3 recordIDsToDelete:(id)a4 shouldClearRebaselineDeadline:(BOOL)a5
{
  id v8;
  id v9;
  HDCloudSyncSequenceState *v10;
  uint64_t v11;
  NSArray *recordsToSave;
  uint64_t v13;
  NSArray *recordIDsToDelete;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDCloudSyncSequenceState;
  v10 = -[HDCloudSyncSequenceState init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    recordsToSave = v10->_recordsToSave;
    v10->_recordsToSave = (NSArray *)v11;

    v13 = objc_msgSend(v9, "copy");
    recordIDsToDelete = v10->_recordIDsToDelete;
    v10->_recordIDsToDelete = (NSArray *)v13;

    v10->_shouldClearRebaselineDeadline = a5;
  }

  return v10;
}

- (NSArray)recordsToSave
{
  return self->_recordsToSave;
}

- (NSArray)recordIDsToDelete
{
  return self->_recordIDsToDelete;
}

- (BOOL)shouldClearRebaselineDeadline
{
  return self->_shouldClearRebaselineDeadline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
}

@end
