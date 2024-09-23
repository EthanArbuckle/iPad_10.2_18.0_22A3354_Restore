@implementation NSNull(AFSecurityDigestibleChunksProvider)

- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:
{
  void (*v5)(void);
  _QWORD *v6;
  char v7[16];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    if ((a3 & 1) == 0)
    {
      v5 = (void (*)(void))a4[2];
      v6 = a4;
      v5();
      strcpy(v7, "{NSNull=#}");
      ((void (*)(id, char *, uint64_t))a4[2])(v6, v7, 11);
      ((void (*)(id, void *, uint64_t))a4[2])(v6, &AFSecurityDigestibleChunksProviderData, 4);
      ((void (*)(id, void *, uint64_t))a4[2])(v6, &AFSecurityDigestibleChunksProviderEnd, 4);

    }
  }
}

@end
