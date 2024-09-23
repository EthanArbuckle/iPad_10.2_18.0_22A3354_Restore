@implementation NSUUID(AFSecurityDigestibleChunksProvider)

- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  if (v6)
  {
    if ((a3 & 1) == 0)
    {
      (*((void (**)(id, void *, uint64_t))v6 + 2))(v6, &AFSecurityDigestibleChunksProviderType, 4);
      strcpy((char *)v8, "{NSUUID=#}");
      ((void (**)(_QWORD, _QWORD *, uint64_t))v7)[2](v7, v8, 11);
      ((void (**)(_QWORD, void *, uint64_t))v7)[2](v7, &AFSecurityDigestibleChunksProviderData, 4);
    }
    v8[0] = 0;
    v8[1] = 0;
    objc_msgSend(a1, "getUUIDBytes:", v8);
    ((void (**)(_QWORD, _QWORD *, uint64_t))v7)[2](v7, v8, 16);
    if ((a3 & 1) == 0)
      ((void (**)(_QWORD, void *, uint64_t))v7)[2](v7, &AFSecurityDigestibleChunksProviderEnd, 4);
  }

}

@end
