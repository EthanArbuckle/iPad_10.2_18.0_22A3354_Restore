@implementation CKTranscriptDetailsResizableCell

+ (id)identifier
{
  return CFSTR("resizable_cell");
}

- (CKTranscriptDetailsResizableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKTranscriptDetailsResizableCell *v4;
  CKTranscriptDetailsResizableCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKTranscriptDetailsResizableCell;
  v4 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v17, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CKTranscriptDetailsResizableCell textLabel](v4, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 0);

    -[CKTranscriptDetailsResizableCell textLabel](v5, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLineBreakMode:", 0);

    -[CKTranscriptDetailsResizableCell textLabel](v5, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "theme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "detailsCellStaticTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v11);

    if (CKIsRunningInMacCatalyst())
    {
      -[CKTranscriptDetailsResizableCell textLabel](v5, "textLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "theme");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "conversationListDateColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHighlightedTextColor:", v15);

    }
  }
  return v5;
}

@end
