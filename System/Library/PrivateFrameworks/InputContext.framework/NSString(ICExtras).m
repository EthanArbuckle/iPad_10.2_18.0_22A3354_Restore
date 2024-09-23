@implementation NSString(ICExtras)

- (BOOL)_ICEnumerateLongCharactersInRange:()ICExtras usingBlock:
{
  void (**v8)(id, uint64_t, _BYTE *);
  uint64_t v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  _BOOL8 v14;
  char v16;

  v8 = a5;
  LODWORD(v9) = 0;
  v16 = 0;
  v10 = a3 + a4;
  if (a3 < a3 + a4)
  {
    v11 = 0;
    while (1)
    {
      v12 = objc_msgSend(a1, "characterAtIndex:", a3);
      v9 = v12;
      if (v11 || (v12 & 0xF800) == 0xD800)
      {
        v13 = v12 & 0xFC00;
        if (!v11 && v13 == 55296)
          goto LABEL_11;
        v14 = 0;
        if (!v11 || v13 != 56320)
          goto LABEL_14;
        v9 = (v12 + (v11 << 10) - 56613888);
      }
      v8[2](v8, v9, &v16);
      LODWORD(v9) = 0;
LABEL_11:
      if (!v16)
      {
        ++a3;
        v11 = v9;
        if (a3 < v10)
          continue;
      }
      break;
    }
  }
  v14 = (_DWORD)v9 == 0;
LABEL_14:

  return v14;
}

@end
