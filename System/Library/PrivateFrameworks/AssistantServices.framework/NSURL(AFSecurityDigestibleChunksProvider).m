@implementation NSURL(AFSecurityDigestibleChunksProvider)

- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  char v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  if (v6)
  {
    if ((a3 & 1) != 0)
    {
      objc_msgSend(a1, "absoluteString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 1, v7);

    }
    else
    {
      (*((void (**)(id, void *, uint64_t))v6 + 2))(v6, &AFSecurityDigestibleChunksProviderType, 4);
      strcpy(v10, "{NSURL=#@@^v^v}");
      ((void (**)(_QWORD, char *, uint64_t))v7)[2](v7, v10, 16);
      ((void (**)(_QWORD, void *, uint64_t))v7)[2](v7, &AFSecurityDigestibleChunksProviderData, 4);
      objc_msgSend(a1, "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 1, v7);

      ((void (**)(_QWORD, void *, uint64_t))v7)[2](v7, &AFSecurityDigestibleChunksProviderEnd, 4);
    }
  }

}

@end
