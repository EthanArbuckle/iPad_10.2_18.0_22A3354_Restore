@implementation PHAssetResource(MovieResource)

- (id)vcp_avAsset
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "privateFileURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
