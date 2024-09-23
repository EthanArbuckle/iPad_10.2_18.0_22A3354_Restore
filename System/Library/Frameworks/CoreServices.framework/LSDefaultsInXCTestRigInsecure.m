@implementation LSDefaultsInXCTestRigInsecure

void ___LSDefaultsInXCTestRigInsecure_block_invoke()
{
  char v0;
  const char *v1;

  if (_LSDefaultsIsAppleInternal_once != -1)
    dispatch_once(&_LSDefaultsIsAppleInternal_once, &__block_literal_global_376);
  v0 = _LSDefaultsIsAppleInternal_appleInternal;
  if (_LSDefaultsIsAppleInternal_appleInternal)
  {
    v1 = getprogname();
    v0 = strcasecmp(v1, "xctest") == 0;
  }
  _LSDefaultsInXCTestRigInsecure_inXCTestRigInsecure = v0;
}

@end
