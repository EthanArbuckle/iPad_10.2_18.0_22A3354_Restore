@implementation LPYouTubePlayerViewFullScreenDelegate

- (void)_webViewWillExitElementFullscreen:(id)a3
{
  objc_msgSend(a3, "_clearOverrideLayoutParameters");
}

- (void)_webViewDidExitElementFullscreen:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
}

@end
