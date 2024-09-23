@implementation NSDate(AFSecurityDigestibleChunksProvider)

- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  uint64_t v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  if (v6)
  {
    if ((a3 & 1) == 0)
    {
      (*((void (**)(id, void *, uint64_t))v6 + 2))(v6, &AFSecurityDigestibleChunksProviderType, 4);
      strcpy((char *)v9, "{NSDate=#}");
      ((void (**)(_QWORD, _QWORD *, uint64_t))v7)[2](v7, v9, 11);
      ((void (**)(_QWORD, void *, uint64_t))v7)[2](v7, &AFSecurityDigestibleChunksProviderData, 4);
    }
    objc_msgSend(a1, "timeIntervalSince1970");
    v9[0] = v8;
    ((void (**)(_QWORD, _QWORD *, uint64_t))v7)[2](v7, v9, 8);
    if ((a3 & 1) == 0)
      ((void (**)(_QWORD, void *, uint64_t))v7)[2](v7, &AFSecurityDigestibleChunksProviderEnd, 4);
  }

}

@end
