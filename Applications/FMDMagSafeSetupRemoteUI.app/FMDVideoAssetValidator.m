@implementation FMDVideoAssetValidator

- (BOOL)isValidVideoAtFilePath:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVURLAsset URLAssetWithURL:options:](AVURLAsset, "URLAssetWithURL:options:", v3, 0));
  v5 = objc_msgSend(v4, "isPlayable");

  return v5;
}

@end
