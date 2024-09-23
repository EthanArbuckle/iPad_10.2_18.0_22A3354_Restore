@implementation AVTomatoRatingView

- (AVTomatoRatingView)init
{
  AVTomatoRatingView *v2;
  AVTomatoRatingView *v3;
  uint64_t v4;
  UIColor *textColor;
  UIImageView *v6;
  UIImageView *tomatoRatingIcon;
  UILabel *v8;
  UILabel *tomatoRatingLabel;
  UILabel *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)AVTomatoRatingView;
  v2 = -[AVTomatoRatingView init](&v33, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_tomatoFreshness = 3;
    v2->_tomatoRating = NAN;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemPinkColor");
    v4 = objc_claimAutoreleasedReturnValue();
    textColor = v3->_textColor;
    v3->_textColor = (UIColor *)v4;

    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    tomatoRatingIcon = v3->_tomatoRatingIcon;
    v3->_tomatoRatingIcon = v6;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_tomatoRatingIcon, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAccessibilityIdentifier:](v3->_tomatoRatingIcon, "setAccessibilityIdentifier:", CFSTR("AVTomatoRatingIcon"));
    -[AVTomatoRatingView addSubview:](v3, "addSubview:", v3->_tomatoRatingIcon);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    tomatoRatingLabel = v3->_tomatoRatingLabel;
    v3->_tomatoRatingLabel = v8;

    -[UILabel setBackgroundColor:](v3->_tomatoRatingLabel, "setBackgroundColor:", 0);
    v10 = v3->_tomatoRatingLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    -[UILabel setOpaque:](v3->_tomatoRatingLabel, "setOpaque:", 0);
    -[UILabel setTextColor:](v3->_tomatoRatingLabel, "setTextColor:", v3->_textColor);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_tomatoRatingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](v3->_tomatoRatingLabel, "setAccessibilityIdentifier:", CFSTR("AVTomatoRatingLabel"));
    -[AVTomatoRatingView addSubview:](v3, "addSubview:", v3->_tomatoRatingLabel);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v3->_tomatoRatingIcon, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v3->_tomatoRatingLabel, "lastBaselineAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v15);

    -[UIImageView leftAnchor](v3->_tomatoRatingIcon, "leftAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTomatoRatingView leftAnchor](v3, "leftAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v18);

    -[UILabel topAnchor](v3->_tomatoRatingLabel, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTomatoRatingView topAnchor](v3, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v21);

    -[UILabel rightAnchor](v3->_tomatoRatingLabel, "rightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTomatoRatingView rightAnchor](v3, "rightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v24);

    -[UILabel bottomAnchor](v3->_tomatoRatingLabel, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTomatoRatingView bottomAnchor](v3, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v27);

    -[UILabel leftAnchor](v3->_tomatoRatingLabel, "leftAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView rightAnchor](v3->_tomatoRatingIcon, "rightAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, 6.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v31) = 1144750080;
    objc_msgSend(v30, "setPriority:", v31);
    objc_msgSend(v12, "addObject:", v30);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v12);

  }
  return v3;
}

- (void)setTomatoFreshness:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  id v11;

  if (self->_tomatoFreshness != a3)
  {
    self->_tomatoFreshness = a3;
    if (a3 > 2)
    {
      v7 = 0;
      v11 = 0;
    }
    else
    {
      v4 = (uint64_t)*(&off_1E5BB4E50 + a3);
      AVLocalizedString(*(&off_1E5BB4E38 + a3));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0DC3870];
      AVBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "imageNamed:inBundle:compatibleWithTraitCollection:", v4, v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v7, "scale");
    if (fabs(v8 + -2.0) > 0.00000011920929)
    {
      v9 = (void *)MEMORY[0x1E0DC3870];
      v10 = objc_retainAutorelease(v7);
      objc_msgSend(v9, "imageWithCGImage:scale:orientation:", objc_msgSend(v10, "CGImage"), objc_msgSend(v10, "imageOrientation"), 2.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[UIImageView setImage:](self->_tomatoRatingIcon, "setImage:", v7);
    -[UIImageView setAccessibilityValue:](self->_tomatoRatingIcon, "setAccessibilityValue:", v11);

  }
}

- (void)setTomatoRating:(float)a3
{
  double v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_tomatoRating != a3)
  {
    if (a3 > 1.0)
      a3 = a3 / 100.0;
    self->_tomatoRating = a3;
    v7 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v7, "setNumberStyle:", 3);
    *(float *)&v4 = self->_tomatoRating;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromNumber:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setText:](self->_tomatoRatingLabel, "setText:", v6);
  }
}

- (UIFont)font
{
  return -[UILabel font](self->_tomatoRatingLabel, "font");
}

- (void)setFont:(id)a3
{
  -[UILabel setFont:](self->_tomatoRatingLabel, "setFont:", a3);
}

- (void)setTextColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  if (self->_textColor != v5)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    -[UILabel setTextColor:](self->_tomatoRatingLabel, "setTextColor:", v5);
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVTomatoRatingView;
  -[AVTomatoRatingView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[UILabel setTextColor:](self->_tomatoRatingLabel, "setTextColor:", self->_textColor);
}

- (id)viewForLastBaselineLayout
{
  return self->_tomatoRatingLabel;
}

- (float)tomatoRating
{
  return self->_tomatoRating;
}

- (unint64_t)tomatoFreshness
{
  return self->_tomatoFreshness;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_tomatoRatingLabel, 0);
  objc_storeStrong((id *)&self->_tomatoRatingIcon, 0);
}

@end
