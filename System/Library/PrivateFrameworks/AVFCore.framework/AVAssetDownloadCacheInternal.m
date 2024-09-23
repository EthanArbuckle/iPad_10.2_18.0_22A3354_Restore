@implementation AVAssetDownloadCacheInternal

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->asset);
}

@end
