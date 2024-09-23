@implementation CKTranscriptLabelCell

+ (id)reuseIdentifier
{
  return CFSTR("TS");
}

- (CKTranscriptLabelCell)initWithFrame:(CGRect)a3
{
  CKTranscriptLabelCell *v3;
  CKTranscriptLabelCell *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptLabelCell;
  v3 = -[CKTranscriptStampCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKTranscriptLabelCell label](v3, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNumberOfLines:", 0);

  }
  return v4;
}

+ (id)createStampLabelView
{
  id v2;

  v2 = objc_alloc(MEMORY[0x1E0CEA700]);
  return (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)setAttributedText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKTranscriptLabelCell label](self, "label");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v4);

}

- (id)attributedText
{
  void *v2;
  void *v3;

  -[CKTranscriptLabelCell label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
