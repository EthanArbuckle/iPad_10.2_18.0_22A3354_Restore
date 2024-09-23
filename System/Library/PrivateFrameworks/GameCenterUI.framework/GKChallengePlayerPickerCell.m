@implementation GKChallengePlayerPickerCell

- (void)setSelected:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKChallengePlayerPickerCell;
  -[GKDashboardPlayerPickerCell setSelected:](&v6, sel_setSelected_, a3);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.0700000003);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallengePlayerPickerCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

@end
