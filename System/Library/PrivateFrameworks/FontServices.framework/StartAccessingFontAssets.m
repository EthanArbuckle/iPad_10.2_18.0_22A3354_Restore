@implementation StartAccessingFontAssets

void __StartAccessingFontAssets_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "state") == 2)
  {
    objc_msgSend(v6, "getLocalFileUrl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      StartAccessingFontAssets_sSuccess = 1;
      *a4 = 1;
    }
  }

}

@end
