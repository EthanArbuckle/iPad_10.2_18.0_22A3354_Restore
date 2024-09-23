@implementation NSHSTSStorage

_NSHSTSStorage *__39___NSHSTSStorage_sharedPersistentStore__block_invoke()
{
  _NSHSTSStorage *result;
  uint64_t v1;
  const void *v2;
  objc_super v3;

  result = [_NSHSTSStorage alloc];
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)_NSHSTSStorage;
    result = (_NSHSTSStorage *)objc_msgSendSuper2(&v3, sel_init);
    v1 = (uint64_t)result;
    if (result)
    {
      if (HSTSPolicy::getDefaultPolicy(void)::sOnce != -1)
        dispatch_once(&HSTSPolicy::getDefaultPolicy(void)::sOnce, &__block_literal_global_2);
      v2 = (const void *)(HSTSPolicy::getDefaultPolicy(void)::sHSTSPolicy - 16);
      *(_QWORD *)(v1 + 8) = HSTSPolicy::getDefaultPolicy(void)::sHSTSPolicy - 16;
      result = (_NSHSTSStorage *)CFRetain(v2);
    }
  }
  else
  {
    v1 = 0;
  }
  +[_NSHSTSStorage sharedPersistentStore]::store = v1;
  return result;
}

@end
