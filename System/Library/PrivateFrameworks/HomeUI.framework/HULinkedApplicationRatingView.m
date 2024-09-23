@implementation HULinkedApplicationRatingView

- (HULinkedApplicationRatingView)initWithFrame:(CGRect)a3
{
  HULinkedApplicationRatingView *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HULinkedApplicationRatingView;
  v3 = -[HULinkedApplicationRatingView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v5 = 5;
    do
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("star-empty"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v6);
      objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v4, "addObject:", v7);
      -[HULinkedApplicationRatingView addSubview:](v3, "addSubview:", v7);

      --v5;
    }
    while (v5);
    -[HULinkedApplicationRatingView setStarViews:](v3, "setStarViews:", v4);
    -[HULinkedApplicationRatingView setupConstraints](v3, "setupConstraints");

  }
  return v3;
}

- (void)setRating:(double)a3
{
  if (a3 < 0.0 || a3 > 5.0)
    NSLog(CFSTR("Rating must be in the range [0,5]"), a2);
  if (self->_rating != a3)
  {
    self->_rating = a3;
    -[HULinkedApplicationRatingView updateStarViews](self, "updateStarViews");
  }
}

- (void)setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t i;
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
  id v26;

  v26 = (id)objc_opt_new();
  -[HULinkedApplicationRatingView starViews](self, "starViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULinkedApplicationRatingView leadingAnchor](self, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObject:", v7);

  objc_msgSend(v4, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULinkedApplicationRatingView topAnchor](self, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObject:", v10);

  objc_msgSend(v4, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULinkedApplicationRatingView bottomAnchor](self, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObject:", v13);

  for (i = 1; i != 5; ++i)
  {
    v15 = v4;
    -[HULinkedApplicationRatingView starViews](self, "starViews");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v19);

    objc_msgSend(v4, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v22);

  }
  objc_msgSend(v4, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULinkedApplicationRatingView trailingAnchor](self, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObject:", v25);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v26);
}

- (void)updateStarViews
{
  double v3;
  double v4;
  unint64_t v5;
  double v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  -[HULinkedApplicationRatingView rating](self, "rating");
  v4 = floor(v3);
  v5 = vcvtmd_u64_f64(v3);
  -[HULinkedApplicationRatingView rating](self, "rating");
  v7 = vcvtpd_u64_f64(v6 - (double)(unint64_t)v4);
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("star-full"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HULinkedApplicationRatingView starViews](self, "starViews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setImage:", v9);
    }
  }
  v12 = v7 + v5;
  if (v7 + v5 > v5)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("star-half"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HULinkedApplicationRatingView starViews](self, "starViews");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setImage:", v13);
      ++v5;
      --v7;
    }
    while (v7);
    v5 = v12;
  }
  if (v5 <= 4)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("star-empty"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HULinkedApplicationRatingView starViews](self, "starViews");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setImage:", v16);
      ++v5;
    }
    while (v5 != 5);
  }
}

- (double)rating
{
  return self->_rating;
}

- (NSArray)starViews
{
  return self->_starViews;
}

- (void)setStarViews:(id)a3
{
  objc_storeStrong((id *)&self->_starViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_starViews, 0);
}

@end
