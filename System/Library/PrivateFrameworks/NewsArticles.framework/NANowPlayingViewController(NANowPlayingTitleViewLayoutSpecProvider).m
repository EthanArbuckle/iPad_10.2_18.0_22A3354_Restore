@implementation NANowPlayingViewController(NANowPlayingTitleViewLayoutSpecProvider)

- (double)publisherLogoHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NANowPlayingViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NANowPlayingLayoutSpec publisherLogoHeightInView:](NANowPlayingLayoutSpec, "publisherLogoHeightInView:", v3);
  v5 = v4;

  return v5;
}

@end
