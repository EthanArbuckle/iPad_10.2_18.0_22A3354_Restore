@implementation SUUITomatoRatingView

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "_attributedStringForRating:context:", v9, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "labelLayoutCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "requestLayoutForViewElement:attributedString:width:", v9, v11, (uint64_t)a4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a1, "_tomatoImageForFreshness:", objc_msgSend(v9, "freshness"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v8, "labelLayoutCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "layoutForWidth:viewElement:", (uint64_t)a3, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "boundingSize");
    if (v14 < v18)
      v14 = v18;
    v12 = v12 + v17 + 3.0;
  }

  v19 = v12;
  v20 = v14;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  UIImageView *imageView;
  UIImageView *v10;
  UIImageView *v11;
  UIImageView *v12;
  void *v13;
  void *v14;
  SUUIAttributedStringView *labelView;
  SUUIAttributedStringView *v16;
  SUUIAttributedStringView *v17;
  SUUIAttributedStringView *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v8 = a5;
  imageView = self->_imageView;
  if (!imageView)
  {
    v10 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    v11 = self->_imageView;
    self->_imageView = v10;

    v12 = self->_imageView;
    -[SUUITomatoRatingView backgroundColor](self, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    -[SUUITomatoRatingView addSubview:](self, "addSubview:", self->_imageView);
    imageView = self->_imageView;
  }
  objc_msgSend((id)objc_opt_class(), "_tomatoImageForFreshness:", objc_msgSend(v22, "freshness"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](imageView, "setImage:", v14);

  labelView = self->_labelView;
  if (!labelView)
  {
    v16 = objc_alloc_init(SUUIAttributedStringView);
    v17 = self->_labelView;
    self->_labelView = v16;

    v18 = self->_labelView;
    -[SUUITomatoRatingView backgroundColor](self, "backgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIAttributedStringView setBackgroundColor:](v18, "setBackgroundColor:", v19);

    -[SUUIAttributedStringView setUserInteractionEnabled:](self->_labelView, "setUserInteractionEnabled:", 0);
    -[SUUITomatoRatingView addSubview:](self, "addSubview:", self->_labelView);
    labelView = self->_labelView;
  }
  objc_msgSend(v8, "labelLayoutCache");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutForWidth:viewElement:", (uint64_t)a4, v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIAttributedStringView setLayout:](labelView, "setLayout:", v21);

  -[SUUITomatoRatingView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  CGFloat v15;
  float v16;
  CGRect v17;

  -[SUUITomatoRatingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = *MEMORY[0x24BDBF090];
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v3, v5);
  v9 = v8;
  v11 = v10;
  *(float *)&v8 = (v6 - v10) * 0.5;
  v12 = floorf(*(float *)&v8);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v7, v12, v9, v10);
  -[SUUIAttributedStringView sizeThatFits:](self->_labelView, "sizeThatFits:", v4, v6);
  v14 = v13;
  v17.origin.x = v7;
  v17.origin.y = v12;
  v17.size.width = v9;
  v17.size.height = v11;
  v15 = CGRectGetMaxX(v17) + 3.0;
  v16 = (v6 - v14) * 0.5;
  -[SUUIAttributedStringView setFrame:](self->_labelView, "setFrame:", v15, floorf(v16), v4 - v15, v14);
}

- (void)setBackgroundColor:(id)a3
{
  UIImageView *imageView;
  id v5;
  objc_super v6;

  imageView = self->_imageView;
  v5 = a3;
  -[UIImageView setBackgroundColor:](imageView, "setBackgroundColor:", v5);
  -[SUUIAttributedStringView setBackgroundColor:](self->_labelView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUITomatoRatingView;
  -[SUUITomatoRatingView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:");
  v7 = v6;
  v9 = v8;
  -[SUUIAttributedStringView sizeThatFits:](self->_labelView, "sizeThatFits:", width, height);
  v12 = v7 + 3.0 + v11;
  if (v9 >= v10)
    v10 = v9;
  result.height = v10;
  result.width = v12;
  return result;
}

+ (id)_attributedStringForRating:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "ratingText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  SUUIViewElementFontWithStyle(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    SUUIFontForTextStyle(10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "attributedStringWithDefaultFont:foregroundColor:style:", v9, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_tomatoImageForFreshness:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  switch(a3)
  {
    case 2:
      v4 = (void *)MEMORY[0x24BEBD640];
      SUUIBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("rottenTomatoesRotten");
      goto LABEL_7;
    case 1:
      v4 = (void *)MEMORY[0x24BEBD640];
      SUUIBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("rottenTomatoesFresh");
      goto LABEL_7;
    case 0:
      v4 = (void *)MEMORY[0x24BEBD640];
      SUUIBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("rottenTomatoesCertified");
LABEL_7:
      objc_msgSend(v4, "imageNamed:inBundle:", v6, v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
