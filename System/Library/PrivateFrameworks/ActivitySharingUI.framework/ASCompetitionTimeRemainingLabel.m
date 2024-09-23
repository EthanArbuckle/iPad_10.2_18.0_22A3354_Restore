@implementation ASCompetitionTimeRemainingLabel

- (ASCompetitionTimeRemainingLabel)initWithFrame:(CGRect)a3
{
  ASCompetitionTimeRemainingLabel *v3;
  ASCompetitionTimeRemainingLabel *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASCompetitionTimeRemainingLabel;
  v3 = -[ASCompetitionTimeRemainingLabel initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ASCompetitionTimeRemainingLabel setTextAlignment:](v3, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 13.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCompetitionTimeRemainingLabel setFont:](v4, "setFont:", v5);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCompetitionTimeRemainingLabel setTextColor:](v4, "setTextColor:", v6);

    -[ASCompetitionTimeRemainingLabel setAllowsDefaultTighteningForTruncation:](v4, "setAllowsDefaultTighteningForTruncation:", 1);
    -[ASCompetitionTimeRemainingLabel setNumberOfLines:](v4, "setNumberOfLines:", 0);
  }
  return v4;
}

@end
