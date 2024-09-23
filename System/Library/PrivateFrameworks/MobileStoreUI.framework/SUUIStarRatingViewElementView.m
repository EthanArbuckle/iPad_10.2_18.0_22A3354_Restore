@implementation SUUIStarRatingViewElementView

- (SUUIStarRatingViewElementView)initWithFrame:(CGRect)a3
{
  SUUIStarRatingViewElementView *v3;
  SUUIStarRatingViewElementView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIStarRatingViewElementView;
  v3 = -[SUUIStarRatingViewElementView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_elementSpacing = 3;
    -[SUUIStarRatingViewElementView setContentMode:](v3, "setContentMode:", 3);
  }
  return v4;
}

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
  objc_msgSend(a1, "_attributedStringWithViewElement:context:", v9, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "labelLayoutCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "requestLayoutForViewElement:attributedString:width:", v9, v11, (uint64_t)a4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  float v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  v7 = a5;
  v8 = a4;
  +[SUUIRatingStarsCache cacheWithProperties:](SUUIRatingStarsCache, "cacheWithProperties:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ratingValue");
  objc_msgSend(v9, "ratingStarsImageForRating:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "size");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "labelLayoutCache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "sizeForViewElement:width:", v8, a3);
  v18 = v17;
  v20 = v19;

  if (v15 < v20 && v18 > 0.00000011920929)
    v15 = v20;
  v22 = -0.0;
  if (v18 > 0.00000011920929)
    v22 = v18 + 3.0;
  v23 = v13 + v22;

  v24 = v23;
  v25 = v15;
  result.height = v25;
  result.width = v24;
  return result;
}

+ (id)textPropertiesForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  SUUIViewTextProperties *v10;
  void *v11;
  float v12;
  void *v13;
  double v14;
  double v15;
  double v16;

  v7 = a3;
  objc_msgSend(a5, "labelLayoutCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutForWidth:viewElement:", (uint64_t)a4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = -[SUUIViewTextProperties initWithStringLayout:]([SUUIViewTextProperties alloc], "initWithStringLayout:", v9);
    +[SUUIRatingStarsCache cacheWithProperties:](SUUIRatingStarsCache, "cacheWithProperties:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ratingValue");
    objc_msgSend(v11, "ratingStarsImageForRating:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "boundingSize");
    v15 = v14;
    objc_msgSend(v13, "size");
    if (v15 < v16)
    {
      -[SUUIViewTextProperties setBaselineOffsetFromBottom:](v10, "setBaselineOffsetFromBottom:", 0.0);
      -[SUUIViewTextProperties setFirstBaselineOffset:](v10, "setFirstBaselineOffset:", 0.0);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  void *v9;
  float v10;
  UIImage *v11;
  void *v12;
  SUUIAttributedStringLayout *v13;
  id v14;

  v14 = a3;
  v8 = a5;
  +[SUUIRatingStarsCache cacheWithProperties:](SUUIRatingStarsCache, "cacheWithProperties:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ratingValue");
  objc_msgSend(v9, "ratingStarsImageForRating:", v10);
  v11 = (UIImage *)objc_claimAutoreleasedReturnValue();

  if (self->_starRatingImage != v11)
  {
    objc_storeStrong((id *)&self->_starRatingImage, v11);
    -[SUUIStarRatingViewElementView setNeedsDisplay](self, "setNeedsDisplay");
  }
  objc_msgSend(v8, "labelLayoutCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutForWidth:viewElement:", (uint64_t)a4, v14);
  v13 = (SUUIAttributedStringLayout *)objc_claimAutoreleasedReturnValue();

  if (v13 != self->_textLayout)
  {
    objc_storeStrong((id *)&self->_textLayout, v13);
    -[SUUIStarRatingViewElementView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SUUIStarRatingViewElementView setNeedsDisplay](self, "setNeedsDisplay");
  }
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

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  int ShouldReverseLayoutDirection;
  UIImage *starRatingImage;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  SUUIAttributedStringLayout *textLayout;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  CGImage *v26;
  UIImage *v27;
  UIImage *v28;
  CGFloat rect;
  double recta;
  id v31;
  CGRect v32;
  CGRect v33;

  -[SUUIStarRatingViewElementView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v8 = (double *)MEMORY[0x24BDBF090];
  v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v9 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v11 = *(double *)(MEMORY[0x24BDBF090] + 24);
  ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  starRatingImage = self->_starRatingImage;
  v14 = v11;
  v15 = v9;
  v16 = v10;
  if (starRatingImage)
  {
    -[UIImage size](starRatingImage, "size", v9);
    v14 = v17;
    *(float *)&v17 = (v7 - v17 + 2.0) * 0.5;
    v16 = floorf(*(float *)&v17);
  }
  rect = v15;
  v18 = *v8;
  textLayout = self->_textLayout;
  if (textLayout
    && (-[SUUIAttributedStringLayout boundingSize](textLayout, "boundingSize"),
        v9 = v20,
        v11 = v21,
        *(float *)&v20 = (v7 - v21) * 0.5,
        v10 = floorf(*(float *)&v20),
        self->_starRatingImage))
  {
    v22 = v18;
    if ((ShouldReverseLayoutDirection & 1) == 0)
    {
      v32.origin.x = v18;
      v32.origin.y = v16;
      v32.size.width = rect;
      v32.size.height = v14;
      v22 = CGRectGetMaxX(v32) + (double)self->_elementSpacing;
    }
    if (v9 >= v5 - v22)
      v9 = v5 - v22;
    if (v14 < v11)
    {
      -[SUUIAttributedStringLayout baselineOffset](self->_textLayout, "baselineOffset");
      *(float *)&v23 = v23 + v10 - v14 + 2.0;
      v16 = ceilf(*(float *)&v23);
    }
  }
  else
  {
    v22 = v18;
  }
  if (ShouldReverseLayoutDirection && self->_starRatingImage)
  {
    v33.origin.x = v22;
    v33.origin.y = v10;
    v33.size.width = v9;
    v33.size.height = v11;
    v18 = CGRectGetMaxX(v33) + (double)self->_elementSpacing;
  }
  -[SUUIAttributedStringLayout attributedString](self->_textLayout, "attributedString", *(_QWORD *)&rect);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    -[SUUIAttributedStringLayout stringDrawingContext](self->_textLayout, "stringDrawingContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "drawWithRect:options:context:", 33, v24, v22, v10, v9, v11);

  }
  if (storeShouldReverseLayoutDirection())
  {
    v25 = (void *)MEMORY[0x24BEBD640];
    v26 = -[UIImage CGImage](self->_starRatingImage, "CGImage");
    -[UIImage scale](self->_starRatingImage, "scale");
    objc_msgSend(v25, "imageWithCGImage:scale:orientation:", v26, 4);
    v27 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v28 = self->_starRatingImage;
    self->_starRatingImage = v27;

  }
  -[UIImage drawInRect:blendMode:alpha:](self->_starRatingImage, "drawInRect:blendMode:alpha:", 0, v18, v16, recta, v14, 1.0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  UIImage *starRatingImage;
  double v5;
  double v6;
  double v7;
  double v8;
  SUUIAttributedStringLayout *textLayout;
  double v10;
  double v11;
  CGSize result;

  starRatingImage = self->_starRatingImage;
  if (starRatingImage)
  {
    -[UIImage size](starRatingImage, "size", a3.width, a3.height);
    v6 = v5;
    v8 = v7;
  }
  else
  {
    v6 = *MEMORY[0x24BDBF148];
    v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  textLayout = self->_textLayout;
  if (textLayout)
  {
    -[SUUIAttributedStringLayout boundingSize](textLayout, "boundingSize");
  }
  else
  {
    v10 = *MEMORY[0x24BDBF148];
    v11 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  if (self->_starRatingImage)
  {
    if (self->_textLayout)
    {
      v10 = v10 + v6 + (double)self->_elementSpacing;
      if (v8 >= v11)
        v11 = v8;
    }
    else
    {
      v10 = v6;
      v11 = v8;
    }
  }
  result.height = v11;
  result.width = v10;
  return result;
}

+ (id)_attributedStringWithViewElement:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementFontWithStyle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = objc_msgSend(v6, "containerViewElementType");
    if (v9 == 134 || v9 == 104)
    {
      SUUIFontPreferredFontForTextStyle(21);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      SUUIFontForTextStyle(10);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v10;
  }
  objc_msgSend(v6, "tintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attributedStringWithDefaultFont:foregroundColor:style:", v8, v12, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)elementSpacing
{
  return self->_elementSpacing;
}

- (void)setElementSpacing:(int64_t)a3
{
  self->_elementSpacing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayout, 0);
  objc_storeStrong((id *)&self->_starRatingImage, 0);
}

@end
