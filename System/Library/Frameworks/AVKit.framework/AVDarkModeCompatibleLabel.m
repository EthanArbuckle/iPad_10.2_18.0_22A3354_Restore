@implementation AVDarkModeCompatibleLabel

- (void)traitCollectionDidChange:(id)a3
{
  id v4;

  -[AVDarkModeCompatibleLabel textColor](self, "textColor", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AVDarkModeCompatibleLabel setTextColor:](self, "setTextColor:", v4);

}

@end
