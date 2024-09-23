@implementation HMITask

- (HMITask)initWithTaskID:(int)a3
{
  return -[HMITask initWithTaskID:timeout:](self, "initWithTaskID:timeout:", *(_QWORD *)&a3, 0.0);
}

- (HMITask)initWithTaskID:(int)a3 timeout:(double)a4
{
  HMITask *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMITask;
  result = -[HMFOperation initWithTimeout:](&v6, sel_initWithTimeout_, a4);
  if (result)
    result->_taskID = a3;
  return result;
}

- (NSDictionary)results
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[HMFOperation error](self, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[HMFOperation error](self, "error"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "code"),
        v5,
        v4,
        v6 == 12))
  {
    v7 = CFSTR("Canceled");
  }
  else
  {
    -[HMFOperation error](self, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = CFSTR("Error");
    if (!v8)
      v7 = CFSTR("Success");
  }
  v13 = CFSTR("resultCode");
  v14[0] = v7;
  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = v7;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v11;
}

- (void)main
{
  void *v3;

  v3 = (void *)MEMORY[0x220735570](self, a2);
  -[HMITask mainInsideAutoreleasePool](self, "mainInsideAutoreleasePool");
  objc_autoreleasePoolPop(v3);
}

- (void)mainInsideAutoreleasePool
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)progressBlock
{
  return objc_getProperty(self, a2, 320, 1);
}

- (void)setProgressBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 320);
}

- (int)taskID
{
  return self->_taskID;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressBlock, 0);
}

@end
