@implementation IDSCKModifyRecordsOperation

+ (Class)__class
{
  if (qword_1EE40B0D0 != -1)
    dispatch_once(&qword_1EE40B0D0, &unk_1E3C206B8);
  return (Class)(id)qword_1EE40B0C8;
}

+ (id)alloc
{
  uint64_t v2;
  double v3;

  return objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

- (id)modifyRecordsCompletionBlock
{
  return self->_modifyRecordsCompletionBlock;
}

- (void)setModifyRecordsCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)savePolicy
{
  return self->_savePolicy;
}

- (void)setSavePolicy:(int64_t)a3
{
  self->_savePolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modifyRecordsCompletionBlock, 0);
}

@end
