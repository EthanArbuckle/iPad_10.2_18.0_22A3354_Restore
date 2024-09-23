@implementation IDSCKQueryOperation

+ (Class)__class
{
  if (qword_1EE40B0E0 != -1)
    dispatch_once(&qword_1EE40B0E0, &unk_1E3C206D8);
  return (Class)(id)qword_1EE40B0D8;
}

+ (id)alloc
{
  uint64_t v2;
  double v3;

  return objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

- (id)recordFetchedBlock
{
  return self->_recordFetchedBlock;
}

- (void)setRecordFetchedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_recordFetchedBlock, 0);
}

@end
