@implementation ZL14CCPBundleEnvarv

char *___ZL14CCPBundleEnvarv_block_invoke()
{
  char *result;

  result = getenv("CI_CCPORTRAIT_PATH");
  if (result)
  {
    CCPBundleEnvar(void)::b = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", result));
    return (char *)objc_msgSend((id)CCPBundleEnvar(void)::b, "load");
  }
  return result;
}

@end
