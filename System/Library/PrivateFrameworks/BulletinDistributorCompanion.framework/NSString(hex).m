@implementation NSString(hex)

- (id)hex
{
  void *v2;
  const char *v3;
  size_t v4;
  size_t v5;
  unsigned int v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v4 = strlen(v3);
  if (v4)
  {
    v5 = v4;
    do
    {
      v6 = *(unsigned __int8 *)v3++;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02x"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "appendString:", v7);

      --v5;
    }
    while (v5);
  }
  return v2;
}

- (BOOL)_validHexChar:()hex
{
  return a3 - 48 < 0xA || a3 - 97 < 6 || a3 - 65 < 6;
}

- (id)fromHex
{
  id v1;
  const char *v2;
  size_t v3;
  size_t v4;
  _BYTE *v5;
  _BYTE *v6;
  size_t v7;
  char v8;
  void *v9;
  int v11;
  char v12[3];

  v1 = objc_retainAutorelease(a1);
  v2 = (const char *)objc_msgSend(v1, "UTF8String");
  v3 = strlen(v2);
  v4 = v3;
  if ((v3 & 1) == 0)
  {
    v5 = malloc_type_malloc((v3 >> 1) + 1, 0xA23A9FB4uLL);
    if (v5)
    {
      v6 = v5;
      if (!v4)
      {
LABEL_10:
        v6[v4 >> 1] = 0;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        free(v6);
        return v9;
      }
      v7 = 0;
      while (1)
      {
        v12[0] = v2[v7];
        v8 = v2[v7 + 1];
        v12[1] = v8;
        v12[2] = 0;
        if (!objc_msgSend(v1, "_validHexChar:"))
          break;
        if ((objc_msgSend(v1, "_validHexChar:", v8) & 1) == 0)
          break;
        v11 = 0;
        if (sscanf(v12, "%x", &v11) != 1 || !v11)
          break;
        v6[v7 >> 1] = v11;
        v7 += 2;
        if (v7 >= v4)
          goto LABEL_10;
      }
      free(v6);
    }
  }
  return 0;
}

@end
