@implementation LPMultipleImageView

- (LPMultipleImageView)initWithHost:(id)a3
{

  return 0;
}

- (LPMultipleImageView)initWithHost:(id)a3 images:(id)a4 style:(id)a5
{
  id v8;
  id v9;
  id v10;
  LPMultipleImageView *v11;
  LPMultipleImageView *v12;
  id *p_images;
  uint64_t v14;
  id v15;
  LPMultipleImageView *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)LPMultipleImageView;
  v11 = -[LPComponentView initWithHost:](&v18, sel_initWithHost_, v8);
  v12 = v11;
  if (v11)
  {
    p_images = (id *)&v11->_images;
    objc_storeStrong((id *)&v11->_images, a4);
    objc_storeStrong((id *)&v12->_style, a5);
    if ((unint64_t)objc_msgSend(*p_images, "count") >= 5)
    {
      objc_msgSend(*p_images, "subarrayWithRange:", 0, 4);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *p_images;
      *p_images = (id)v14;

    }
    v16 = v12;
  }

  return v12;
}

- (void)ensureImageViews
{
  NSMutableArray *v3;
  NSMutableArray *imageViews;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
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
  LPImageView *v23;
  void *v24;
  LPImageView *v25;
  LPPointUnit *v26;

  if (!self->_imageViews)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    imageViews = self->_imageViews;
    self->_imageViews = v3;

    v5 = computeMultipleImageLayoutForImages(self->_images);
    v26 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 1.0);
    v6 = 0;
    v7 = v5 - 1;
    while (v6 < -[NSArray count](self->_images, "count"))
    {
      -[NSArray objectAtIndexedSubscript:](self->_images, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)-[LPImageViewStyle copy](self->_style, "copy");
      +[LPPointUnit zero](LPPointUnit, "zero");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "padding");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBottom:", v10);

      +[LPPointUnit zero](LPPointUnit, "zero");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "padding");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTop:", v12);

      +[LPPointUnit zero](LPPointUnit, "zero");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "padding");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTrailing:", v14);

      +[LPPointUnit zero](LPPointUnit, "zero");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "padding");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setLeading:", v16);

      switch(v7)
      {
        case 0:
          objc_msgSend(v9, "padding");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6)
            objc_msgSend(v18, "setTop:", v26);
          else
            objc_msgSend(v18, "setBottom:", v26);
          goto LABEL_23;
        case 1:
          objc_msgSend(v9, "padding");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6)
            objc_msgSend(v18, "setLeading:", v26);
          else
            objc_msgSend(v18, "setTrailing:", v26);
          goto LABEL_23;
        case 2:
          if (v6 == 1)
            goto LABEL_18;
          if (!v6)
            goto LABEL_11;
          goto LABEL_22;
        case 3:
          if (v6 == 2)
          {
            objc_msgSend(v9, "padding");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setLeading:", v26);

            objc_msgSend(v9, "padding");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setTop:", v26);

            objc_msgSend(v9, "padding");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setBottom:", v26);
          }
          else if (v6 == 1)
          {
LABEL_18:
            objc_msgSend(v9, "padding");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setLeading:", v26);

            objc_msgSend(v9, "padding");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setBottom:", v26);
          }
          else if (v6)
          {
LABEL_22:
            objc_msgSend(v9, "padding");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setLeading:", v26);

            objc_msgSend(v9, "padding");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setTop:", v26);
          }
          else
          {
LABEL_11:
            objc_msgSend(v9, "padding");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setTrailing:", v26);
          }
LABEL_23:

LABEL_24:
          objc_msgSend(v9, "setScalingMode:", 2);
          v23 = [LPImageView alloc];
          -[LPComponentView host](self, "host");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[LPImageView initWithHost:image:properties:style:](v23, "initWithHost:image:properties:style:", v24, v8, 0, v9);

          -[NSMutableArray addObject:](self->_imageViews, "addObject:", v25);
          -[LPMultipleImageView addSubview:](self, "addSubview:", v25);

          ++v6;
          break;
        default:
          goto LABEL_24;
      }
    }

  }
}

- (CGRect)_computeRectForImageAtIndex:(unint64_t)a3 fittingSize:(CGSize *)a4 width:(double *)a5 height:(double *)a6 size:(CGSize)a7 multipleImageLayout:(unint64_t)a8
{
  double height;
  double width;
  _BOOL4 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v21;
  double v22;
  CGRect result;

  height = a7.height;
  width = a7.width;
  v15 = -[UIView _lp_isLTR](self, "_lp_isLTR");
  v16 = *MEMORY[0x1E0C9D648];
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  switch(a3)
  {
    case 0uLL:
      if (a8 == 1)
      {
        v19 = a4->width;
        v18 = a4->height;
        v17 = 0.0;
LABEL_20:
        v16 = 0.0;
        goto LABEL_21;
      }
      if (v15)
      {
        v19 = a4->width;
        v18 = a4->height;
        v17 = 0.0;
        width = a4->width;
        goto LABEL_20;
      }
      v19 = a4->width;
      if (a8)
      {
        v16 = width - v19;
        v18 = a4->height;
        v17 = 0.0;
        width = a4->width;
      }
      else
      {
        width = *(double *)(MEMORY[0x1E0C9D648] + 16);
      }
LABEL_21:
      *a5 = v19 + *a5;
      *a6 = a4->height + *a6;
LABEL_29:
      v22 = width;
      result.size.height = v18;
      result.size.width = v22;
      result.origin.y = v17;
      result.origin.x = v16;
      return result;
    case 1uLL:
      if (a8 == 1)
      {
        v17 = *a6;
        v18 = a4->height;
        *a6 = *a6 + v18;
        goto LABEL_28;
      }
      v21 = a4->width;
      if (v15)
      {
        v16 = width - v21;
        v18 = a4->height;
        *a5 = v21 + *a5;
        v17 = 0.0;
        goto LABEL_16;
      }
      v18 = a4->height;
      *a5 = v21 + *a5;
      v17 = 0.0;
      width = v21;
      goto LABEL_28;
    case 2uLL:
      if (a8 == 3 && v15)
        goto LABEL_15;
      if (a8 == 3)
        goto LABEL_17;
      if (v15)
      {
        v21 = a4->width;
        v18 = a4->height;
        v16 = width - a4->width;
        v17 = height + v18 * -2.0;
        goto LABEL_16;
      }
      width = a4->width;
      v18 = a4->height;
      v17 = height + v18 * -2.0;
      goto LABEL_28;
    case 3uLL:
      if (v15)
      {
LABEL_15:
        v21 = a4->width;
        v18 = a4->height;
        v16 = width - a4->width;
        v17 = height - v18;
LABEL_16:
        width = v21;
      }
      else
      {
LABEL_17:
        width = a4->width;
        v18 = a4->height;
        v17 = height - v18;
LABEL_28:
        v16 = 0.0;
      }
      goto LABEL_29;
    default:
      width = *(double *)(MEMORY[0x1E0C9D648] + 16);
      goto LABEL_29;
  }
}

- (CGSize)_availableSizeForImageNumber:(unint64_t)a3 withLayout:(unint64_t)a4 withinSize:(CGSize)result applyingLayout:(BOOL)a6
{
  double height;
  double width;
  double v8;
  double v9;

  height = result.height;
  width = result.width;
  v8 = fmin(result.width, result.height);
  if (a6)
    v8 = width;
  else
    result.height = v8;
  switch(a4)
  {
    case 1uLL:
      result.height = height * 0.5;
      break;
    case 2uLL:
      v9 = 0.5;
      goto LABEL_13;
    case 3uLL:
      v8 = width * 0.5;
      if (a3)
        result.height = result.height * 0.5;
      break;
    case 4uLL:
      if (a3)
      {
        v8 = width * 0.333333333;
        result.height = result.height * 0.333333333;
      }
      else
      {
        v9 = 0.666666667;
LABEL_13:
        v8 = width * v9;
      }
      break;
    default:
      break;
  }
  result.width = v8;
  return result;
}

- (CGSize)layoutImagesForSize:(CGSize)a3 applyingLayout:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  CGSize result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v27 = 0;
  v28 = 0.0;
  v8 = computeMultipleImageLayoutForImages(self->_images);
  if (-[NSArray count](self->_images, "count"))
  {
    v9 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_images, "objectAtIndexedSubscript:", v9, *(_QWORD *)&v25, v26);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_imageViews, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPMultipleImageView _availableSizeForImageNumber:withLayout:withinSize:applyingLayout:](self, "_availableSizeForImageNumber:withLayout:withinSize:applyingLayout:", v9, v8, v4, width, height);
      v14 = v12;
      v25 = 0.0;
      v26 = 0;
      if (v4)
      {
        v25 = v12;
        v26 = v13;
      }
      else
      {
        if (v8 == 1)
        {
          objc_msgSend(v10, "platformImage", *(_QWORD *)&v25, v26);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "_lp_pixelSize");
          sizeFittingInsideSizeMaintainingAspectRatio(v16, v17, width, 1.79769313e308);
        }
        else
        {
          objc_msgSend(v10, "platformImage", *(_QWORD *)&v25, v26, v27);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "_lp_pixelSize");
          v18 = minimumSizeByComponent(v20, v21, v14);
        }
        v25 = v18;
        v26 = v19;

      }
      -[LPMultipleImageView _computeRectForImageAtIndex:fittingSize:width:height:size:multipleImageLayout:](self, "_computeRectForImageAtIndex:fittingSize:width:height:size:multipleImageLayout:", v9, &v25, &v28, &v27, v8, width, height);
      if (v4)
        objc_msgSend(v11, "setFrame:");

      ++v9;
    }
    while (v9 < -[NSArray count](self->_images, "count"));
    v22 = v28;
  }
  else
  {
    v22 = 0.0;
  }
  v23 = minimumSizeByComponent(width, height, v22);
  result.height = v24;
  result.width = v23;
  return result;
}

- (void)layoutComponentView
{
  double v3;
  double v4;

  -[LPMultipleImageView ensureImageViews](self, "ensureImageViews");
  -[LPMultipleImageView bounds](self, "bounds");
  -[LPMultipleImageView layoutImagesForSize:applyingLayout:](self, "layoutImagesForSize:applyingLayout:", 1, v3, v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[LPImageViewStyle padding](self->_style, "padding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asInsetsForLTR:", -[UIView _lp_isLTR](self, "_lp_isLTR"));
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[LPMultipleImageView layoutImagesForSize:applyingLayout:](self, "layoutImagesForSize:applyingLayout:", 0, width - (v10 + v14), height - (v8 + v12));
  v17 = ceil(v15) - (-v14 - v10);
  v18 = ceil(v16) - (-v12 - v8);
  result.height = v18;
  result.width = v17;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_images, 0);
}

@end
