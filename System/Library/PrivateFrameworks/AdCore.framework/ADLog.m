@implementation ADLog

void ___ADLog_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)_ADLog_logHandles, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = os_log_create("com.apple.iad", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
    objc_msgSend((id)_ADLog_logHandles, "setObject:forKey:", v2, *(_QWORD *)(a1 + 32));
  }
  v3 = *(_BYTE *)(a1 + 48);
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1C998C000, v2, v3, "%{public}@", (uint8_t *)&v5, 0xCu);
  }

}

uint64_t ___ADLog_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t result;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 1282, 8);
  v1 = (void *)_ADLog_logHandles;
  _ADLog_logHandles = v0;

  result = MGGetBoolAnswer();
  _ADLog_internalBuild = result;
  return result;
}

@end
