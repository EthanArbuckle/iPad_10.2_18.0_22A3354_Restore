@implementation FEUserDefaults

uint64_t ___FEUserDefaults_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t result;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.FocusEngine"));
  v1 = (void *)_MergedGlobals_5;
  _MergedGlobals_5 = v0;

  result = os_variant_has_internal_diagnostics();
  if ((_DWORD)result)
    return objc_msgSend((id)_MergedGlobals_5, "addSuiteNamed:", *MEMORY[0x24BDD0B50]);
  return result;
}

@end
