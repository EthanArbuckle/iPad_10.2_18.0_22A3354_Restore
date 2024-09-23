@implementation NSString(AFSecurityDigestibleChunksProvider)

- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  char v9[16];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  if (v6)
  {
    if ((a3 & 1) == 0)
    {
      (*((void (**)(id, void *, uint64_t))v6 + 2))(v6, &AFSecurityDigestibleChunksProviderType, 4);
      strcpy(v9, "{NSString=#}");
      ((void (**)(_QWORD, char *, uint64_t))v7)[2](v7, v9, 13);
      ((void (**)(_QWORD, void *, uint64_t))v7)[2](v7, &AFSecurityDigestibleChunksProviderData, 4);
    }
    objc_msgSend(a1, "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 1, v7);
    if ((a3 & 1) == 0)
      ((void (**)(_QWORD, void *, uint64_t))v7)[2](v7, &AFSecurityDigestibleChunksProviderEnd, 4);

  }
}

@end
