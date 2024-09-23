@implementation IDSCKFetchRecordZonesOperation

+ (Class)__class
{
  if (qword_1EE40B160 != -1)
    dispatch_once(&qword_1EE40B160, &unk_1E3C20798);
  return (Class)(id)qword_1EE40B158;
}

+ (id)alloc
{
  uint64_t v2;
  double v3;

  return objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

- (id)fetchRecordZonesCompletionBlock
{
  return self->_fetchRecordZonesCompletionBlock;
}

- (void)setFetchRecordZonesCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchRecordZonesCompletionBlock, 0);
}

@end
