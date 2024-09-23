@implementation NPSPrefPlistProtectedUtil

+ (BOOL)isPlistProtectedAtPath:(id)a3
{
  id v3;
  id v4;
  int v5;
  int v6;
  uint64_t v7;
  BOOL v9;
  id v11;

  v3 = a3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NPSPrefPlistProtectedUtil"), CFSTR("Path cannot be nil"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v4 = objc_retainAutorelease(v3);
  v5 = open_dprotected_np((const char *)objc_msgSend(v4, "UTF8String"), 0, 0, 1);
  if (v5 == -1)
  {
    v7 = 0xFFFFFFFFLL;
  }
  else
  {
    v6 = v5;
    v7 = fcntl(v5, 63);
    close(v6);
  }
  NSLog(CFSTR("%s: Protection Class for %@ is %d"), "+[NPSPrefPlistProtectedUtil isPlistProtectedAtPath:]", v4, v7);
  v9 = (_DWORD)v7 != -1 && (int)v7 < 4;

  return v9;
}

@end
