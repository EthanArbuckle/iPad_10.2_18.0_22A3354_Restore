@implementation IDSRTCLogger

- (IDSRTCLogger)initWithCategory:(unsigned __int16)a3
{
  IDSRTCLogger *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IDSRTCLogger;
  result = -[IDSRTCLogger init](&v5, sel_init);
  if (result)
    result->_category = a3;
  return result;
}

+ (id)loggerWithCategory:(unsigned __int16)a3
{
  uint64_t v3;
  id v4;
  const char *v5;
  double v6;

  v3 = a3;
  v4 = objc_alloc((Class)a1);
  return (id)objc_msgSend_initWithCategory_(v4, v5, v3, v6);
}

- (void)logMetric:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  double v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  objc_msgSend_RTCSessionPromiseWithBatchingInterval_(MEMORY[0x1E0D13218], v5, v6, 30.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_19BABE3B8;
  v11[3] = &unk_1E3C220A0;
  v11[4] = self;
  v12 = v4;
  v8 = v4;
  objc_msgSend_registerResultBlock_(v7, v9, (uint64_t)v11, v10);

}

- (unsigned)category
{
  return self->_category;
}

@end
