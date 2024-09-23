@implementation NSData(AFSecurityDigestibleChunksProvider)

- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;
  _QWORD v9[4];
  id v10;
  char v11[16];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  if (v6)
  {
    if ((a3 & 1) == 0)
    {
      (*((void (**)(id, void *, uint64_t))v6 + 2))(v6, &AFSecurityDigestibleChunksProviderType, 4);
      strcpy(v11, "{NSData=#}");
      ((void (**)(_QWORD, char *, uint64_t))v7)[2](v7, v11, 11);
      ((void (**)(_QWORD, void *, uint64_t))v7)[2](v7, &AFSecurityDigestibleChunksProviderData, 4);
    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __97__NSData_AFSecurityDigestibleChunksProvider__af_enumerateDigestibleChunksWithOptions_usingBlock___block_invoke;
    v9[3] = &unk_1E3A2E160;
    v8 = v7;
    v10 = v8;
    objc_msgSend(a1, "enumerateByteRangesUsingBlock:", v9);
    if ((a3 & 1) == 0)
      (*((void (**)(id, void *, uint64_t))v8 + 2))(v8, &AFSecurityDigestibleChunksProviderEnd, 4);

  }
}

@end
