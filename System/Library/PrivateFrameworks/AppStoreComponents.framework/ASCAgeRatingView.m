@implementation ASCAgeRatingView

- (ASCAgeRatingView)initWithFrame:(CGRect)a3
{
  ASCAgeRatingView *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASCAgeRatingView;
  v3 = -[ASCAgeRatingView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAgeRatingView setTextColor:](v3, "setTextColor:", v4);

    -[ASCAgeRatingView setAdjustsFontForContentSizeCategory:](v3, "setAdjustsFontForContentSizeCategory:", 1);
    v5 = objc_alloc_init(MEMORY[0x1E0CA80F0]);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setColor:", v6);

    -[ASCAgeRatingView _setTextEncapsulation:](v3, "_setTextEncapsulation:", v5);
  }
  return v3;
}

- (ASCAgeRatingView)initWithCoder:(id)a3
{
  -[ASCAgeRatingView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCAgeRatingView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  ASCLocalizedFormatString(CFSTR("AX_AGE_RATING"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAgeRatingView text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
