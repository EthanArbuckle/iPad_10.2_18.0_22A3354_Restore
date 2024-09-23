@implementation NSNumber(AFSecurityDigestibleChunksProvider)

- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  if (!v6)
    goto LABEL_13;
  if ((a3 & 1) == 0)
  {
    (*((void (**)(id, void *, uint64_t))v6 + 2))(v6, &AFSecurityDigestibleChunksProviderType, 4);
    strcpy((char *)v12, "{NSNumber=#}");
    ((void (**)(_QWORD, _QWORD *, uint64_t))v7)[2](v7, v12, 13);
    ((void (**)(_QWORD, void *, uint64_t))v7)[2](v7, &AFSecurityDigestibleChunksProviderData, 4);
  }
  v8 = objc_retainAutorelease(a1);
  v9 = *(char *)objc_msgSend(v8, "objCType") - 66;
  if (v9 <= 0x31)
  {
    if (((1 << v9) & 0x28483) != 0)
    {
      v10 = objc_msgSend(v8, "unsignedLongLongValue");
      goto LABEL_9;
    }
    if (((1 << v9) & 0x2848200000000) != 0)
    {
      v10 = objc_msgSend(v8, "longLongValue");
LABEL_9:
      v12[0] = v10;
LABEL_10:
      ((void (**)(_QWORD, _QWORD *, uint64_t))v7)[2](v7, v12, 8);
      goto LABEL_11;
    }
    if (((1 << v9) & 0x1400000000) != 0)
    {
      objc_msgSend(v8, "doubleValue");
      v12[0] = v11;
      goto LABEL_10;
    }
  }
LABEL_11:
  if ((a3 & 1) == 0)
    ((void (**)(_QWORD, void *, uint64_t))v7)[2](v7, &AFSecurityDigestibleChunksProviderEnd, 4);
LABEL_13:

}

@end
