@implementation GSFontEnsureFontFileAccess

void __GSFontEnsureFontFileAccess_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "URLByDeletingLastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v7, "rangeOfString:", CFSTR(".asset"));
  if (v4)
  {
    objc_msgSend(v7, "substringToIndex:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D22400], "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessFontAsset:", v5);

  }
  CFRelease(*(CFTypeRef *)(a1 + 32));

}

@end
