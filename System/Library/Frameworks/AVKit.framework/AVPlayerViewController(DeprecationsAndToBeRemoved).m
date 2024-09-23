@implementation AVPlayerViewController(DeprecationsAndToBeRemoved)

- (void)setDefaultPlaybackRate:()DeprecationsAndToBeRemoved
{
  id v4;

  -[AVPlayerViewController playerController](self, "playerController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultPlaybackRate:", a3);

}

@end
