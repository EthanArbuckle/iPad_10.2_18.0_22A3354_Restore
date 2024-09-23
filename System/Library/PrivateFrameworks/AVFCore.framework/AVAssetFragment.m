@implementation AVAssetFragment

+ (id)fragmentWithSequenceNumber:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSequenceNumber:", a3);
}

- (AVAssetFragment)init
{
  void *v4;
  uint64_t v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  v6 = NSStringFromSelector(sel_initWithSequenceNumber_);
  v12 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Use %@ instead."), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

- (AVAssetFragment)initWithSequenceNumber:(int64_t)a3
{
  AVAssetFragment *v4;
  AVAssetFragmentInternal *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVAssetFragment;
  v4 = -[AVAssetFragment init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AVAssetFragmentInternal);
    v4->_internal = v5;
    if (v5)
    {
      v5->_sequenceNumber = a3;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetFragment;
  -[AVAssetFragment dealloc](&v3, sel_dealloc);
}

- (int64_t)sequenceNumber
{
  return self->_internal->_sequenceNumber;
}

@end
