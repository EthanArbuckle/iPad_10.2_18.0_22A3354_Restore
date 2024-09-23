@implementation _CFPrefsPendingKVONotification

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_CFPrefsPendingKVONotification;
  -[_CFPrefsPendingKVONotification dealloc](&v3, sel_dealloc);
}

- (void)setValues:(void *)a1
{
  if (a1)
    objc_setProperty_atomic(a1, newValue, newValue, 24);
}

- (void)setSource:(void *)a1
{
  if (a1)
    objc_setProperty_atomic(a1, newValue, newValue, 8);
}

- (void)setOldValues:(void *)a1
{
  if (a1)
    objc_setProperty_atomic(a1, newValue, newValue, 16);
}

- (id)source
{
  if (result)
    return objc_getProperty(result, a2, 8, 1);
  return result;
}

- (id)oldValues
{
  if (result)
    return objc_getProperty(result, a2, 16, 1);
  return result;
}

- (id)values
{
  if (result)
    return objc_getProperty(result, a2, 24, 1);
  return result;
}

@end
