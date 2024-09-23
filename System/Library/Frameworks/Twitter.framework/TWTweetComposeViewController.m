@implementation TWTweetComposeViewController

+ (BOOL)canSendTweet
{
  return objc_msgSend(MEMORY[0x24BDE9890], "isAvailableForServiceType:", *MEMORY[0x24BDE9930]);
}

- (TWTweetComposeViewController)init
{
  TWTweetComposeViewController *v3;

  objc_msgSend(MEMORY[0x24BDE9890], "composeViewControllerForServiceType:", *MEMORY[0x24BDE9930]);
  v3 = (TWTweetComposeViewController *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)setInitialText:(NSString *)text
{
  return 0;
}

- (BOOL)addImage:(UIImage *)image
{
  return 0;
}

- (BOOL)addURL:(NSURL *)url
{
  return 0;
}

- (BOOL)removeAllImages
{
  return 0;
}

- (BOOL)removeAllURLs
{
  return 0;
}

- (TWTweetComposeViewControllerCompletionHandler)completionHandler
{
  return 0;
}

- (id)addURLWithProxyPreviewImage:(id)a3
{
  return 0;
}

- (id)addDownSampledImageDataByProxyWithPreviewImage:(id)a3
{
  return 0;
}

@end
