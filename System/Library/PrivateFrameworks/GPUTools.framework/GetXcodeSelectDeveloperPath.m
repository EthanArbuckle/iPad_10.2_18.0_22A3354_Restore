@implementation GetXcodeSelectDeveloperPath

void *__GetXcodeSelectDeveloperPath_block_invoke()
{
  void *result;
  void *v1;
  unsigned int (*v2)(_BYTE *, uint64_t, char *, __int16 *, char *);
  char v3;
  __int16 v4;
  _BYTE v5[1024];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  result = dlopen("/usr/lib/libxcselect.dylib", 1);
  if (result)
  {
    v1 = result;
    v2 = (unsigned int (*)(_BYTE *, uint64_t, char *, __int16 *, char *))dlsym(result, "xcselect_get_developer_dir_path");
    if (v2)
    {
      v4 = 0;
      v3 = 0;
      if (v2(v5, 1024, (char *)&v4 + 1, &v4, &v3))
        GetXcodeSelectDeveloperPath__XCSelectXCodePath = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
    }
    return (void *)dlclose(v1);
  }
  return result;
}

@end
