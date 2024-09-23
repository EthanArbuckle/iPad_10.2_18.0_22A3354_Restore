@implementation LPImageStackView

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    stackedImageVerticalOffset = 0xC018000000000000;
}

- (LPImageStackView)initWithHost:(id)a3
{

  return 0;
}

- (LPImageStackView)initWithHost:(id)a3 images:(id)a4 style:(id)a5
{
  id v8;
  LPImageStackView *v9;
  LPImageStackView *v10;
  LPImageStackView *v11;
  void *v12;
  id *p_images;
  uint64_t v14;
  id v15;
  NSMutableArray *v16;
  NSMutableArray *imageViews;
  LPPointUnit *v18;
  LPPointUnit *v19;
  void *v20;
  double v21;
  LPPointUnit *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t i;
  uint64_t v27;
  LPImageView *v28;
  void *v29;
  id v30;
  LPImageView *v31;
  LPImageStackView *v32;
  id v34;
  id v35;
  id *p_style;
  id obj;
  LPImagePresentationProperties *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v34 = a4;
  v35 = a5;
  v44.receiver = self;
  v44.super_class = (Class)LPImageStackView;
  v9 = -[LPComponentView initWithHost:](&v44, sel_initWithHost_, v8);
  v10 = v9;
  v11 = v9;
  if (v9)
  {
    -[LPImageStackView layer](v9, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMasksToBounds:", 0);

    p_images = (id *)&v10->_images;
    objc_storeStrong((id *)&v10->_images, a4);
    p_style = (id *)&v10->_style;
    objc_storeStrong((id *)&v10->_style, a5);
    if (-[NSArray count](v10->_images, "count") >= 3)
    {
      objc_msgSend(*p_images, "subarrayWithRange:", 0, 2);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *p_images;
      *p_images = (id)v14;

    }
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    imageViews = v11->_imageViews;
    v11->_imageViews = v16;

    v38 = objc_alloc_init(LPImagePresentationProperties);
    -[LPImagePresentationProperties setShouldApplyBackground:](v38, "setShouldApplyBackground:", 1);
    -[LPImagePresentationProperties setRequireFixedSize:](v38, "setRequireFixedSize:", 1);
    v39 = (void *)objc_msgSend(*p_style, "copy");
    objc_msgSend(v39, "setDarkeningAmount:", 0.3);
    v18 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 3.0);
    objc_msgSend(v39, "setCornerRadius:", v18);

    v19 = [LPPointUnit alloc];
    objc_msgSend(v39, "fixedFallbackImageSize");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "value");
    v22 = -[LPPointUnit initWithValue:](v19, "initWithValue:", v21 + -8.0);
    objc_msgSend(v39, "setFixedFallbackImageSize:", v22);

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = *p_images;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v41;
      v25 = 1;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v41 != v24)
            objc_enumerationMutation(obj);
          v27 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          v28 = [LPImageView alloc];
          -[LPComponentView host](v11, "host");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v39;
          if ((v25 & 1) != 0)
            v30 = *p_style;
          v31 = -[LPImageView initWithHost:image:properties:style:](v28, "initWithHost:image:properties:style:", v29, v27, v38, v30);

          -[NSMutableArray addObject:](v11->_imageViews, "addObject:", v31);
          -[UIView _lp_insertSubview:belowSubview:](v11, "_lp_insertSubview:belowSubview:", v31, 0);

          v25 = 0;
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        v25 = 0;
      }
      while (v23);
    }

    v32 = v11;
  }

  return v11;
}

- (void)layoutComponentView
{
  void *v3;
  double v4;
  double v5;

  -[NSMutableArray lastObject](self->_imageViews, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installDarkeningViewIfNeeded");

  -[LPImageStackView bounds](self, "bounds");
  -[LPImageStackView _layoutImagesForSize:applyingLayout:](self, "_layoutImagesForSize:applyingLayout:", 1, v4, v5);
}

- (CGSize)_layoutImagesForSize:(CGSize)a3 applyingLayout:(BOOL)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double x;
  double width;
  double height;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;
  CGRect v27;
  CGRect v28;

  if (a4)
  {
    -[LPImageStackView bounds](self, "bounds", a3.width, a3.height);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[NSMutableArray firstObject](self->_imageViews, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    v27.origin.x = v6;
    v27.origin.y = v8;
    v27.size.width = v10;
    v27.size.height = v12;
    v28 = CGRectInset(v27, 4.0, 4.0);
    x = v28.origin.x;
    width = v28.size.width;
    height = v28.size.height;
    v17 = *(double *)&stackedImageVerticalOffset + v28.origin.y;
    -[NSMutableArray lastObject](self->_imageViews, "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", x, v17, width, height);

  }
  -[LPImageViewStyle fixedSize](self->_style, "fixedSize", a3.width, a3.height);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "asSize");
  v21 = v20;
  v23 = v22;

  v24 = v21;
  v25 = v23;
  result.height = v25;
  result.width = v24;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[LPImageStackView _layoutImagesForSize:applyingLayout:](self, "_layoutImagesForSize:applyingLayout:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_images, 0);
}

@end
