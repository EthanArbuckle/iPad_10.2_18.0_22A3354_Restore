@implementation CAMReviewButton

- (void)_commonCAMReviewButtonInitialization
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  self->__numberOfCaptures = 0;
  -[CAMReviewButton _localizedTitleForNumberOfCaptures](self, "_localizedTitleForNumberOfCaptures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMReviewButton setTitleColor:forState:](self, "setTitleColor:forState:", v4, 0);
  -[CAMReviewButton setExclusiveTouch:](self, "setExclusiveTouch:", 1);
  -[CAMReviewButton titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontWithDescriptor:size:", v7, 18.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v8);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "cam_initialLayoutStyle");

  if (v10 == 1)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0DC1298]);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShadowColor:", v12);

    objc_msgSend(v11, "setShadowOffset:", 0.0, 0.0);
    objc_msgSend(v11, "setShadowBlurRadius:", 3.0);
    v13 = *MEMORY[0x1E0DC1140];
    v16[0] = *MEMORY[0x1E0DC1198];
    v16[1] = v13;
    v17[0] = v11;
    v17[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v3, v14);
    -[CAMReviewButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v15, 0);

  }
  else
  {
    -[CAMReviewButton setTitle:forState:](self, "setTitle:forState:", v3, 0);
  }

}

- (CAMReviewButton)initWithFrame:(CGRect)a3
{
  CAMReviewButton *v3;
  CAMReviewButton *v4;
  CAMReviewButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMReviewButton;
  v3 = -[CAMReviewButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMReviewButton _commonCAMReviewButtonInitialization](v3, "_commonCAMReviewButtonInitialization");
    v5 = v4;
  }

  return v4;
}

- (CAMReviewButton)initWithCoder:(id)a3
{
  CAMReviewButton *v3;
  CAMReviewButton *v4;
  CAMReviewButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMReviewButton;
  v3 = -[CAMReviewButton initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[CAMReviewButton _commonCAMReviewButtonInitialization](v3, "_commonCAMReviewButtonInitialization");
    v5 = v4;
  }

  return v4;
}

+ (id)_sharedNumberOfCapturesFormatter
{
  if (_sharedNumberOfCapturesFormatter_onceToken != -1)
    dispatch_once(&_sharedNumberOfCapturesFormatter_onceToken, &__block_literal_global_35);
  return (id)_sharedNumberOfCapturesFormatter_sharedCountFormatter;
}

uint64_t __51__CAMReviewButton__sharedNumberOfCapturesFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)_sharedNumberOfCapturesFormatter_sharedCountFormatter;
  _sharedNumberOfCapturesFormatter_sharedCountFormatter = (uint64_t)v0;

  objc_msgSend((id)_sharedNumberOfCapturesFormatter_sharedCountFormatter, "setGeneratesDecimalNumbers:", 1);
  return objc_msgSend((id)_sharedNumberOfCapturesFormatter_sharedCountFormatter, "setNumberStyle:", 1);
}

- (id)_localizedTitleForNumberOfCaptures
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  CAMLocalizedFrameworkString(CFSTR("API_CANCEL_TITLE"), CFSTR("Title for the Cancel button, which dismisses the view controller"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMReviewButton _numberOfCaptures](self, "_numberOfCaptures");
  if (v4)
  {
    v5 = v4;
    +[CAMReviewButton _sharedNumberOfCapturesFormatter](CAMReviewButton, "_sharedNumberOfCapturesFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromNumber:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    CAMLocalizedFrameworkString(CFSTR("API_REVIEW_NUMBER"), CFSTR("Title for the Review button, which presents the review view controller"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CAMLocalizedFrameworkString(CFSTR("API_REVIEW_TITLE"), CFSTR("Title for the Review button, which presents the review view controller"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CAMLocalizedFrameworkString(CFSTR("API_REVIEW_TITLE_FORMAT"), CFSTR("Format for the Review button title, which presents the review view controller"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@%@"), 0, v11, v10);
    v13 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v13;
  }
  return v3;
}

- (unint64_t)_numberOfCaptures
{
  return self->__numberOfCaptures;
}

- (void)_setNumberOfCaptures:(unint64_t)a3
{
  self->__numberOfCaptures = a3;
}

@end
