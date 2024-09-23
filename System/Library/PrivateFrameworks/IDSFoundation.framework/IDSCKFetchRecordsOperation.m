@implementation IDSCKFetchRecordsOperation

+ (Class)__class
{
  if (qword_1EE40B140 != -1)
    dispatch_once(&qword_1EE40B140, &unk_1E3C20758);
  return (Class)(id)qword_1EE40B138;
}

+ (id)alloc
{
  uint64_t v2;
  double v3;

  return objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)perRecordProgressBlock
{
  return self->_perRecordProgressBlock;
}

- (void)setPerRecordProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)perRecordCompletionBlock
{
  return self->_perRecordCompletionBlock;
}

- (void)setPerRecordCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)fetchRecordsCompletionBlock
{
  return self->_fetchRecordsCompletionBlock;
}

- (void)setFetchRecordsCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchRecordsCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordProgressBlock, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
}

@end
