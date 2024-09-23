@implementation CFNumberGetTypeID

const char *__CFNumberGetTypeID_block_invoke()
{
  const char *result;
  char v1;

  if (_CFExecutableLinkedOnOrAfter(7uLL) && *MEMORY[0x1E0DE7C50])
    _objc_registerTaggedPointerClass();
  else
    __CFNumberTaggedPointersDisabled = 1;
  result = getenv("CFNumberDisableCache");
  if (result)
  {
    result = (const char *)strcmp(result, "all");
    if ((_DWORD)result)
      v1 = 1;
    else
      v1 = 2;
    __CFNumberCaching = v1;
  }
  return result;
}

@end
