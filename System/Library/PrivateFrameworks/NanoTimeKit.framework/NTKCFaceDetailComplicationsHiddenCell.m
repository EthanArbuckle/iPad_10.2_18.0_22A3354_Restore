@implementation NTKCFaceDetailComplicationsHiddenCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NTKCFaceDetailComplicationsHiddenCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  NTKCFaceDetailComplicationsHiddenCell *v4;
  NTKCFaceDetailComplicationsHiddenCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NTKCFaceDetailComplicationsHiddenCell;
  v4 = -[NTKCDetailTableViewCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[NTKCFaceDetailComplicationsHiddenCell textLabel](v4, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 0);

    BPSDetailTextColor();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailComplicationsHiddenCell textLabel](v5, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

    NTKCompanionClockFaceLocalizedString(CFSTR("EDIT_MODE_COMPLICATIONS_HIDDEN_TEXT_COMPANION"), CFSTR("hidden complications"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailComplicationsHiddenCell textLabel](v5, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

  }
  return v5;
}

- (double)rowHeight
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[NTKCFaceDetailComplicationsHiddenCell layoutIfNeeded](self, "layoutIfNeeded");
  -[NTKCFaceDetailComplicationsHiddenCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_lastLineBaseline");
  v5 = v4;
  -[NTKCFaceDetailComplicationsHiddenCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_scaledValueForValue:", 16.0);
  v9 = v5 + v8;

  return v9;
}

- (id)_fontForTextLabel
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
}

@end
