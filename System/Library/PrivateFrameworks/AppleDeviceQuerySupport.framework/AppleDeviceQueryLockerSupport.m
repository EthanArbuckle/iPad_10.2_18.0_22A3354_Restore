@implementation AppleDeviceQueryLockerSupport

- (void)initData
{
  AppleDeviceQueryCacheSupport *v3;
  AppleDeviceQueryCacheSupport *keysCacheForCopyValue;

  initPthreadRecursiveMutex(&self->recursiveMutexForCopyValue);
  v3 = -[AppleDeviceQueryCacheSupport initWithName:andCapacity:andCacheType:]([AppleDeviceQueryCacheSupport alloc], "initWithName:andCapacity:andCacheType:", CFSTR("ZCV"), &unk_2507BE618, 0);
  keysCacheForCopyValue = self->_keysCacheForCopyValue;
  self->_keysCacheForCopyValue = v3;

}

- (void)logHandler
{
  return self->_logHandler;
}

- (void)setLogHandler:(void *)a3
{
  self->_logHandler = a3;
}

- (AppleDeviceQueryCacheSupport)keysCacheForCopyValue
{
  return (AppleDeviceQueryCacheSupport *)objc_getProperty(self, a2, 80, 1);
}

- (void)setKeysCacheForCopyValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysCacheForCopyValue, 0);
}

@end
