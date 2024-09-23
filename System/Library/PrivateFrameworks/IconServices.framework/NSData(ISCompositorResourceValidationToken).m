@implementation NSData(ISCompositorResourceValidationToken)

+ (id)_is_validToken
{
  if (_is_validToken_onceToken != -1)
    dispatch_once(&_is_validToken_onceToken, &__block_literal_global_48);
  return (id)_is_validToken_validToken;
}

+ (id)_is_staleToken
{
  if (_is_staleToken_onceToken != -1)
    dispatch_once(&_is_staleToken_onceToken, &__block_literal_global_45);
  return (id)_is_staleToken_staleToken;
}

+ (id)_is_invalidToken
{
  if (_is_invalidToken_onceToken != -1)
    dispatch_once(&_is_invalidToken_onceToken, &__block_literal_global_15);
  return (id)_is_invalidToken_invalidToken;
}

- (id)_is_getSequenceNumber:()ISCompositorResourceValidationToken andUUID:
{
  id result;
  uint64_t v8;

  result = (id)objc_msgSend(a1, "length");
  if (result == (id)40)
  {
    v8 = objc_msgSend(objc_retainAutorelease(a1), "bytes");
    *a3 = *(_QWORD *)(v8 + 16);
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v8);
    *a4 = result;
  }
  return result;
}

- (id)_is_databaseUUID
{
  uint64_t v2;
  void *v3;

  if (objc_msgSend(a1, "length") == 40)
  {
    v2 = objc_msgSend(objc_retainAutorelease(a1), "bytes");
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (uint64_t)_is_SequenceNumber
{
  if (objc_msgSend(a1, "length") == 40)
    return *(_QWORD *)(objc_msgSend(objc_retainAutorelease(a1), "bytes") + 16);
  else
    return 0;
}

- (id)_is_persistentIdentifierDigest
{
  uint64_t v2;
  void *v3;

  if (objc_msgSend(a1, "length") == 40)
  {
    v2 = objc_msgSend(objc_retainAutorelease(a1), "bytes");
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v2 + 24);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
