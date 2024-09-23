@implementation DemoPlayerView

+ (Class)layerClass
{
  return (Class)objc_opt_class(AVPlayerLayer, a2);
}

- (AVPlayer)player
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DemoPlayerView layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "player"));

  return (AVPlayer *)v3;
}

- (void)setPlayer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DemoPlayerView layer](self, "layer"));
  objc_msgSend(v5, "setPlayer:", v4);

}

@end
