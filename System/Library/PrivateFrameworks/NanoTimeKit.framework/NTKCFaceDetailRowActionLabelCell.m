@implementation NTKCFaceDetailRowActionLabelCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (double)rowHeight
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 44.0);
  v4 = v3;

  return v4;
}

- (NTKCFaceDetailRowActionLabelCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  NTKCFaceDetailRowActionLabelCell *v4;
  NTKCFaceDetailRowActionLabelCell *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKCFaceDetailRowActionLabelCell;
  v4 = -[NTKCFaceDetailRowActionCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, 1, a4);
  v5 = v4;
  if (v4)
  {
    -[NTKCFaceDetailRowActionLabelCell textLabel](v4, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NTKCActionColor();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v7);

  }
  return v5;
}

@end
