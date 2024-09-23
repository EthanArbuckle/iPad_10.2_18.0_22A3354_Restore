@implementation NSPlaceholderDate

uint64_t __33____NSPlaceholderDate_initialize__block_invoke()
{
  uint64_t result;

  if (CFDateGetTypeID_initOnce != -1)
    dispatch_once(&CFDateGetTypeID_initOnce, &__block_literal_global_100);
  result = _CFExecutableLinkedOnOrAfter(7uLL);
  if ((_DWORD)result && *MEMORY[0x1E0DE7C50])
  {
    objc_opt_class();
    return _objc_registerTaggedPointerClass();
  }
  else
  {
    _NSDateTaggedPointersDisabled = 1;
  }
  return result;
}

@end
