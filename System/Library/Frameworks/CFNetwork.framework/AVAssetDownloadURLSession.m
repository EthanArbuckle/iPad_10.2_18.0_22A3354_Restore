@implementation AVAssetDownloadURLSession

+ (AVAssetDownloadURLSession)sessionWithConfiguration:(NSURLSessionConfiguration *)configuration assetDownloadDelegate:(id)delegate delegateQueue:(NSOperationQueue *)delegateQueue
{
  NSURLSessionConfiguration *v8;

  if (!configuration
    || !CFEqual(-[NSURLSessionConfiguration disposition](configuration, "disposition"), &unk_1EDD00610))
  {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can only create an AVAssetDownloadURLSession from a background configuration"), 0));
  }
  v8 = (NSURLSessionConfiguration *)(id)-[NSURLSessionConfiguration copy](configuration, "copy");
  -[NSURLSessionConfiguration set_supportsAVAssetDownloads:](v8, "set_supportsAVAssetDownloads:", 1);
  return (AVAssetDownloadURLSession *)+[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]((uint64_t)NSURLSession, v8, (uint64_t)delegate, (uint64_t)delegateQueue, 0);
}

- (AVAssetDownloadTask)assetDownloadTaskWithURLAsset:(AVURLAsset *)URLAsset destinationURL:(NSURL *)destinationURL options:(NSDictionary *)options
{
  return 0;
}

- (AVAssetDownloadTask)assetDownloadTaskWithURLAsset:(AVURLAsset *)URLAsset assetTitle:(NSString *)title assetArtworkData:(NSData *)artworkData options:(NSDictionary *)options
{
  return 0;
}

- (AVAggregateAssetDownloadTask)aggregateAssetDownloadTaskWithURLAsset:(AVURLAsset *)URLAsset mediaSelections:(NSArray *)mediaSelections assetTitle:(NSString *)title assetArtworkData:(NSData *)artworkData options:(NSDictionary *)options
{
  return 0;
}

- (AVAssetDownloadTask)assetDownloadTaskWithConfiguration:(AVAssetDownloadConfiguration *)downloadConfiguration
{
  return 0;
}

@end
