@implementation BSUIEmojiLabelView(MRUVisualStylingProviderAdditions)

- (void)mru_applyVisualStylingWithColor:()MRUVisualStylingProviderAdditions alpha:blendMode:
{
  id v8;
  id v9;

  v8 = a4;
  objc_msgSend(a1, "contentLabel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mru_applyVisualStylingWithColor:alpha:blendMode:", v8, a5, a2);

}

@end
