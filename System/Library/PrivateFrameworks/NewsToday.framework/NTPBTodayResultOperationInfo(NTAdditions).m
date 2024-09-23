@implementation NTPBTodayResultOperationInfo(NTAdditions)

- (uint64_t)setDynamicThumbnailSizeMinimumSizeInPixels:()NTAdditions
{
  objc_msgSend(a1, "setDynamicThumbnailSizePresetMinimumWidthInPixels:", a2);
  return objc_msgSend(a1, "setDynamicThumbnailSizePresetMinimumHeightInPixels:", a3);
}

- (void)setAssetsDirectoryFileURL:()NTAdditions
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAssetsDirectoryFileURLString:", v4);

}

- (id)assetsDirectoryFileURL
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "assetsDirectoryFileURLString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (double)dynamicThumbnailSizeMinimumSizeInPixels
{
  double v2;

  v2 = (double)objc_msgSend(a1, "dynamicThumbnailSizePresetMinimumWidthInPixels");
  objc_msgSend(a1, "dynamicThumbnailSizePresetMinimumHeightInPixels");
  return v2;
}

@end
