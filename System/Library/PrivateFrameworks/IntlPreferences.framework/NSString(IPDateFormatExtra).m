@implementation NSString(IPDateFormatExtra)

- (void)_enumerateLongCharactersInRange:()IPDateFormatExtra usingBlock:
{
  void (**v8)(id, uint64_t, _BYTE *);
  unint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v8 = a5;
  v13 = 0;
  v9 = a3 + a4;
  if (a3 < v9)
  {
    v10 = 0;
    while (1)
    {
      v11 = objc_msgSend(a1, "characterAtIndex:", a3);
      v12 = v11;
      if ((v11 & 0xF800) != 0xD800)
        goto LABEL_7;
      if ((v11 & 0xFC00) == 0xD800)
        goto LABEL_9;
      if (v10)
        break;
LABEL_8:
      LODWORD(v12) = 0;
LABEL_9:
      if (!v13)
      {
        ++a3;
        v10 = v12;
        if (a3 < v9)
          continue;
      }
      goto LABEL_11;
    }
    v12 = (v11 + (v10 << 10) - 56613888);
LABEL_7:
    v8[2](v8, v12, &v13);
    goto LABEL_8;
  }
LABEL_11:

}

@end
