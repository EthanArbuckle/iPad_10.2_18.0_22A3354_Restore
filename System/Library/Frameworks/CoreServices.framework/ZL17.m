@implementation ZL17

int *___ZL17_LSGetProductNamev_block_invoke()
{
  char *v0;
  const char *v1;
  int *result;
  const __CFString *v4;
  size_t v8;
  _OWORD v9[16];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v0 = getenv("CLASSIC_SUFFIX");
  if (v0)
  {
    v1 = v0;
    result = (int *)strncmp(v0, "iphone", 6uLL);
    if (!(_DWORD)result)
      goto LABEL_13;
    result = (int *)strncmp(v1, "ipad", 4uLL);
    if (!(_DWORD)result)
    {
LABEL_34:
      v4 = CFSTR("ipad");
      goto LABEL_36;
    }
  }
  memset(v9, 0, sizeof(v9));
  v8 = 256;
  result = (int *)sysctlbyname("hw.machine", v9, &v8, 0, 0);
  if ((_DWORD)result)
  {
    if ((_DWORD)result != -1)
      return result;
    result = __error();
    if (*result != 12)
      return result;
  }
  if (v8 >= 6)
  {
    if (LODWORD(v9[0]) != 1869107305 || WORD2(v9[0]) != 25966)
      goto LABEL_15;
LABEL_13:
    v4 = CFSTR("iphone");
LABEL_36:
    _LSGetProductName(void)::_cfBundlePlatform = (uint64_t)v4;
    return result;
  }
  if (v8 < 4)
    return result;
LABEL_15:
  if (LODWORD(v9[0]) == 1685016681)
  {
    v4 = CFSTR("ipod");
    goto LABEL_36;
  }
  if (LODWORD(v9[0]) == 1684099177)
    goto LABEL_34;
  if (v8 < 5)
    return result;
  if (LODWORD(v9[0]) == 1668571479 && BYTE4(v9[0]) == 104)
  {
    v4 = CFSTR("watch");
    goto LABEL_36;
  }
  if (v8 < 7)
    return result;
  if (LODWORD(v9[0]) == 1819308097 && *(_DWORD *)((char *)v9 + 3) == 1448371564)
  {
    v4 = CFSTR("appletv");
    goto LABEL_36;
  }
  if (v8 >= 0xD && *(_QWORD *)&v9[0] == 0x447974696C616552 && *(_QWORD *)((char *)v9 + 5) == 0x6563697665447974)
  {
    v4 = CFSTR("reality");
    goto LABEL_36;
  }
  return result;
}

@end
