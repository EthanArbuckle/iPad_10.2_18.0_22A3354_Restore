@implementation _QLAudioScrubberViewContainer

- (_QLAudioScrubberViewContainer)init
{
  _QLAudioScrubberViewContainer *v2;
  _QLAudioScrubberViewContainer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_QLAudioScrubberViewContainer;
  v2 = -[_QLAudioScrubberViewContainer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_QLAudioScrubberViewContainer setAccessibilityIdentifier:](v2, "setAccessibilityIdentifier:", CFSTR("QLAudioScrubberViewContainerAccessibilityIdentifier"));
  return v3;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  CGFloat Width;
  double v4;
  double v5;
  CGSize result;
  CGRect v7;

  -[_QLAudioScrubberViewContainer superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  Width = CGRectGetWidth(v7);

  v4 = 40.0;
  v5 = Width;
  result.height = v4;
  result.width = v5;
  return result;
}

@end
