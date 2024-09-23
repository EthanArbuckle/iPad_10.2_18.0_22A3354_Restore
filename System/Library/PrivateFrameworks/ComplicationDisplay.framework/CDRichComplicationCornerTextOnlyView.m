@implementation CDRichComplicationCornerTextOnlyView

- (void)transitionToMonochromeWithFraction:(double)a3
{
  id v4;

  -[CDRichComplicationCornerBaseTextView innerLabel](self, "innerLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionToMonochromeWithFraction:style:", 2, a3);

}

- (void)updateMonochromeColor
{
  id v2;

  -[CDRichComplicationCornerBaseTextView innerLabel](self, "innerLabel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateMonochromeColorWithStyle:", 2);

}

@end
