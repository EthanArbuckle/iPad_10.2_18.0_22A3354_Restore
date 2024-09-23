@implementation AVFragmentedMediaDataReport

- (AVFragmentedMediaDataReport)init
{
  return -[AVFragmentedMediaDataReport initWithFigFragmentedMediaDataReportDictionary:](self, "initWithFigFragmentedMediaDataReportDictionary:", 0);
}

- (AVFragmentedMediaDataReport)initWithFigFragmentedMediaDataReportDictionary:(id)a3
{
  AVFragmentedMediaDataReport *v5;
  AVFragmentedMediaDataReport *v6;
  AVFragmentedMediaDataReportInternal *v7;
  AVFragmentedMediaDataReport *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AVFragmentedMediaDataReport;
  v5 = -[AVFragmentedMediaDataReport init](&v16, sel_init);
  v6 = v5;
  if (!a3)
  {
    v9 = v5;
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v10, v11, v12, v13, v14, (uint64_t)"figFragmentedMediaDataReportDict != nil"), 0);
    objc_exception_throw(v15);
  }
  if (v5)
  {
    v7 = objc_alloc_init(AVFragmentedMediaDataReportInternal);
    v6->_internal = v7;
    if (v7)
    {
      v6->_internal->figFragmentedMediaDataReportDict = (NSDictionary *)objc_msgSend(a3, "copy");
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  AVFragmentedMediaDataReportInternal *internal;
  objc_super v4;

  internal = self->_internal;
  if (internal)
  {

    internal = self->_internal;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVFragmentedMediaDataReport;
  -[AVFragmentedMediaDataReport dealloc](&v4, sel_dealloc);
}

- (int64_t)numberOfBytesToEndOfFirstVideoFrame
{
  int64_t result;

  result = -[NSDictionary valueForKey:](self->_internal->figFragmentedMediaDataReportDict, "valueForKey:", *MEMORY[0x1E0CC3C98]);
  if (result)
    return objc_msgSend((id)result, "integerValue");
  return result;
}

@end
