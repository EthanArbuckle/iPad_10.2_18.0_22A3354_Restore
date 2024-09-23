@implementation CKTranscriptStampButtonCell

+ (id)reuseIdentifier
{
  return CFSTR("TSBC");
}

+ (id)createStampTextView
{
  void *v2;
  void *v3;
  void *v4;

  +[CKTranscriptStampButtonCellButton buttonWithType:](CKTranscriptStampButtonCellButton, "buttonWithType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLineBreakMode:", 0);

  objc_msgSend(v2, "setContentHorizontalAlignment:", 3);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stampTranscriptInsets");
  objc_msgSend(v2, "setContentEdgeInsets:");

  return v2;
}

- (void)setAttributedText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKTranscriptStampButtonCell stampButton](self, "stampButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedTitle:forState:", v4, 0);

}

- (id)attributedText
{
  void *v2;
  void *v3;

  -[CKTranscriptStampButtonCell stampButton](self, "stampButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedTitleForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
