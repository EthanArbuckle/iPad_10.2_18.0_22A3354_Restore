@implementation NTKUtilityImageAndLabelsComplicationView

- (NTKUtilityImageAndLabelsComplicationView)initWithFrame:(CGRect)a3
{
  NTKUtilityImageAndLabelsComplicationView *v3;
  NTKUtilityImageAndLabelsComplicationView *v4;
  id v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKUtilityImageAndLabelsComplicationView;
  v3 = -[NTKUtilityComplicationView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = -[NTKUtilityComplicationView _newStandardLabelSubview](v3, "_newStandardLabelSubview");
    -[NTKUtilityImageAndLabelsComplicationView setFirstLabel:](v4, "setFirstLabel:", v5);

    v6 = -[NTKUtilityComplicationView _newStandardLabelSubview](v4, "_newStandardLabelSubview");
    -[NTKUtilityImageAndLabelsComplicationView setSecondLabel:](v4, "setSecondLabel:", v6);

  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int IsRTL;
  CLKUIColoringLabel **p_secondLabel;
  CLKUIColoringLabel **p_firstLabel;
  void *v39;
  char v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  _BYTE v44[104];
  double v45;
  _BYTE v46[96];
  double v47;
  _BYTE v48[176];
  double v49;
  objc_super v50;

  v50.receiver = self;
  v50.super_class = (Class)NTKUtilityImageAndLabelsComplicationView;
  -[NTKUtilityComplicationView layoutSubviews](&v50, sel_layoutSubviews);
  -[NTKUtilityImageAndLabelsComplicationView bounds](self, "bounds");
  v4 = v3;
  -[NTKUtilityImageAndLabelsComplicationView firstLabel](self, "firstLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeToFit");

  -[NTKUtilityImageAndLabelsComplicationView secondLabel](self, "secondLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeToFit");

  -[NTKUtilityImageAndLabelsComplicationView imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeToFit");

  -[NTKUtilityComplicationView layoutLabelVertically:](self, "layoutLabelVertically:", self->_firstLabel);
  -[NTKUtilityComplicationView layoutLabelVertically:](self, "layoutLabelVertically:", self->_secondLabel);
  -[NTKUtilityImageAndLabelsComplicationView firstLabel](self, "firstLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[NTKUtilityImageAndLabelsComplicationView secondLabel](self, "secondLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");

  -[NTKUtilityImageAndLabelsComplicationView imageView](self, "imageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v20 = v19;
  v22 = v21;

  -[NTKUtilityComplicationView _imageViewOriginYWithBaseImageSize:labelFrame:](self, "_imageViewOriginYWithBaseImageSize:labelFrame:", v20, v22, v10, v12, v14, v16);
  if (-[NTKUtilityComplicationView shouldUsePlatterInset](self, "shouldUsePlatterInset"))
  {
    -[NTKUtilityComplicationView device](self, "device");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v23, v48);
    v4 = v4 + v49 * -2.0;

  }
  if (v20 > 0.0)
  {
    -[NTKUtilityComplicationView device](self, "device");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v24, v46);
    v4 = v4 - (v20 - v47);

  }
  -[NTKUtilityComplicationView device](self, "device");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_49(v25, v44);
  v26 = v4 - v14 - v45;

  if (v26 >= 0.0)
    v27 = v26;
  else
    v27 = 0.0;
  if (v14 >= v4)
    v28 = 0.0;
  else
    v28 = v27;
  -[NTKUtilityImageAndLabelsComplicationView imageView](self, "imageView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUtilityComplicationView device](self, "device");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  objc_msgSend(v29, "setFrame:");

  -[NTKUtilityImageAndLabelsComplicationView firstLabel](self, "firstLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUtilityComplicationView device](self, "device");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  objc_msgSend(v31, "setFrame:");

  -[NTKUtilityImageAndLabelsComplicationView secondLabel](self, "secondLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUtilityComplicationView device](self, "device");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  objc_msgSend(v33, "setFrame:");

  -[NTKUtilityImageAndLabelsComplicationView secondLabel](self, "secondLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setMaxWidth:", v28);

  IsRTL = CLKLayoutIsRTL();
  if (IsRTL)
    p_secondLabel = &self->_secondLabel;
  else
    p_secondLabel = &self->_firstLabel;
  if (IsRTL)
    p_firstLabel = &self->_firstLabel;
  else
    p_firstLabel = &self->_secondLabel;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", *p_secondLabel, *p_firstLabel, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_imageView)
  {
    v40 = -[NTKUtilityComplicationView placement](self, "placement");
    if ((v40 & 8) != 0 || (v41 = v40 & 0xA, v42 = CLKLayoutIsRTL(), v43 = 0, !v41) && v42)
      v43 = objc_msgSend(v39, "count");
    objc_msgSend(v39, "insertObject:atIndex:", self->_imageView, v43);
  }
  -[NTKUtilityImageAndLabelsComplicationView _layoutSubviewsHorizontally:](self, "_layoutSubviewsHorizontally:", v39);

}

- (BOOL)_shouldLayoutWithImageView
{
  int v3;

  v3 = -[CDComplicationImageView isHidden](self->_imageView, "isHidden") ^ 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[CDComplicationImageView hasMonochromeImage](self->_imageView, "hasMonochromeImage") & v3;
  return v3;
}

- (void)_updateFirstLabelMaxSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  _BYTE v8[96];
  double v9;

  -[NTKUtilityComplicationView maxSize](self, "maxSize");
  v4 = v3;
  if (-[NTKUtilityImageAndLabelsComplicationView _shouldLayoutWithImageView](self, "_shouldLayoutWithImageView"))
  {
    -[CDComplicationImageView sizeThatFits:](self->_imageView, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v6 = v5;
    -[NTKUtilityComplicationView device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v7, v8);
    v4 = v4 - (v6 + v9);

  }
  -[CLKUIColoringLabel setMaxWidth:](self->_firstLabel, "setMaxWidth:", v4);
}

- (double)_widthThatFits
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  double v13;
  double v14;
  void *v15;
  double v17[43];
  _BYTE v18[96];
  double v19;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[CLKUIColoringLabel sizeThatFits:](self->_firstLabel, "sizeThatFits:", *MEMORY[0x1E0C9D820], v4);
  v6 = v5;
  if (-[NTKUtilityImageAndLabelsComplicationView _shouldLayoutWithImageView](self, "_shouldLayoutWithImageView"))
  {
    -[CDComplicationImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v3, v4);
    v8 = v7;
    -[NTKUtilityComplicationView device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v9, v18);
    v6 = v6 + v8 + v19;

  }
  -[CLKUIColoringLabel text](self->_secondLabel, "text");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    v12 = -[CLKUIColoringLabel isHidden](self->_secondLabel, "isHidden");

    if ((v12 & 1) == 0)
    {
      -[CLKUIColoringLabel sizeThatFits:](self->_secondLabel, "sizeThatFits:", v3, v4);
      v14 = v13;
      -[NTKUtilityComplicationView device](self, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _LayoutConstants_49(v15, v17);
      v6 = v6 + v14 + v17[13];

    }
  }
  return v6;
}

- (void)_layoutSubviewsHorizontally:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  double v20;
  uint64_t i;
  void *v22;
  double v23;
  double v24;
  id v25;
  char v26;
  double v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  double MinX;
  void *v32;
  double v33;
  unint64_t v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  char v49[176];
  double v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NTKUtilityImageAndLabelsComplicationView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (-[NTKUtilityComplicationView shouldUsePlatterInset](self, "shouldUsePlatterInset"))
  {
    -[NTKUtilityComplicationView device](self, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v13, v49);
    v14 = v50;

    v6 = v6 + v14;
    v10 = v10 + v14 * -2.0;
  }
  if ((-[NTKUtilityComplicationView placement](self, "placement") & 2) == 0)
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v15 = v4;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v46;
      v20 = 0.0;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v46 != v19)
            objc_enumerationMutation(v15);
          v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          if (-[NTKUtilityImageAndLabelsComplicationView _isViewVisible:](self, "_isViewVisible:", v22, (_QWORD)v45))
          {
            objc_msgSend(v22, "frame");
            v20 = v20 + v23;
            if (v18)
            {
              -[NTKUtilityImageAndLabelsComplicationView _gapBetweenView:nextView:](self, "_gapBetweenView:nextView:", v18, v22);
              v20 = v20 + v24;
            }
            v25 = v22;

            v18 = v25;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
      v20 = 0.0;
    }

    v26 = -[NTKUtilityComplicationView placement](self, "placement");
    v27 = v6;
    v28 = v8;
    v29 = v10;
    v30 = v12;
    if ((v26 & 8) != 0)
    {
      v6 = CGRectGetMaxX(*(CGRect *)&v27) - v20;
    }
    else
    {
      MinX = CGRectGetMinX(*(CGRect *)&v27);
      -[NTKUtilityComplicationView device](self, "device");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      CLKFloorForDevice();
      v6 = MinX + v33;

    }
  }
  if (objc_msgSend(v4, "count", (_QWORD)v45))
  {
    v34 = 0;
    v35 = 0;
    v36 = 0.0;
    v37 = 0.0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v34);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NTKUtilityImageAndLabelsComplicationView _isViewVisible:](self, "_isViewVisible:", v38))
      {
        objc_msgSend(v38, "frame");
        v40 = v39;
        v41 = v6;
        if (v35)
        {
          -[NTKUtilityImageAndLabelsComplicationView _gapBetweenView:nextView:](self, "_gapBetweenView:nextView:", v35, v38);
          v41 = v37 + v36 + v42;
        }
        -[NTKUtilityComplicationView device](self, "device");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        CLKPixelAlignRectForDevice();
        objc_msgSend(v38, "setFrame:");

        v44 = v38;
        v35 = v44;
        v37 = v41;
        v36 = v40;
      }

      ++v34;
    }
    while (objc_msgSend(v4, "count") > v34);

  }
}

- (double)_gapBetweenView:(id)a3 nextView:(id)a4
{
  id v6;
  id v7;
  int isKindOfClass;
  int v9;
  void *v10;
  void *v11;
  double *v12;
  double v13;
  uint64_t v15;
  uint64_t v16;
  _BYTE v17[104];
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();
  v10 = &unk_1F8E901F0;
  if ((isKindOfClass & 1) != 0 && (v9 & 1) != 0)
  {
    -[NTKUtilityComplicationView device](self, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v11, v17);
    v12 = (double *)&v18;
LABEL_8:
    v13 = *v12;

    goto LABEL_9;
  }
  v13 = 0.0;
  if (((isKindOfClass | v9) & 1) != 0
    && ((objc_msgSend(v6, "conformsToProtocol:", v10) & 1) != 0
     || objc_msgSend(v7, "conformsToProtocol:", v10)))
  {
    -[NTKUtilityComplicationView device](self, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_49(v11, &v15);
    v12 = (double *)&v16;
    goto LABEL_8;
  }
LABEL_9:

  return v13;
}

- (BOOL)_isViewVisible:(id)a3
{
  id v3;
  BOOL v4;
  double v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isHidden") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "bounds");
    v4 = v5 > 0.0;
  }

  return v4;
}

- (void)_setLabelTextProvider:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NTKUtilityImageAndLabelsComplicationView firstLabel](self, "firstLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextProvider:", v4);

  -[NTKUtilityImageAndLabelsComplicationView setNeedsLayout](self, "setNeedsLayout");
  -[NTKUtilityComplicationView displayObserver](self, "displayObserver");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "complicationDisplayNeedsResize:", self);

}

- (void)_setLabelText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[NTKUtilityImageAndLabelsComplicationView firstLabel](self, "firstLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextProvider:", 0);

  -[NTKUtilityImageAndLabelsComplicationView firstLabel](self, "firstLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v4);

  -[NTKUtilityImageAndLabelsComplicationView setNeedsLayout](self, "setNeedsLayout");
  -[NTKUtilityComplicationView displayObserver](self, "displayObserver");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "complicationDisplayNeedsResize:", self);

}

- (void)_setLabelAttributedText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[NTKUtilityImageAndLabelsComplicationView firstLabel](self, "firstLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextProvider:", 0);

  -[NTKUtilityImageAndLabelsComplicationView firstLabel](self, "firstLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributedText:", v4);

  -[NTKUtilityImageAndLabelsComplicationView setNeedsLayout](self, "setNeedsLayout");
  -[NTKUtilityComplicationView displayObserver](self, "displayObserver");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "complicationDisplayNeedsResize:", self);

}

- (void)_setSecondLabelText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[NTKUtilityImageAndLabelsComplicationView secondLabel](self, "secondLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextProvider:", 0);

  -[NTKUtilityImageAndLabelsComplicationView secondLabel](self, "secondLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v4);

  -[NTKUtilityImageAndLabelsComplicationView setNeedsLayout](self, "setNeedsLayout");
  -[NTKUtilityComplicationView displayObserver](self, "displayObserver");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "complicationDisplayNeedsResize:", self);

}

- (void)_updateWithImageProvider:(id)a3
{
  char v4;
  CDComplicationImageView *imageView;
  CDComplicationImageView *v6;
  CDComplicationImageView *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(off_1E6BCA178, "existingImageView:supportsImageProvider:", self->_imageView);
  imageView = self->_imageView;
  if ((v4 & 1) == 0)
  {
    -[CDComplicationImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
    objc_msgSend(off_1E6BCA178, "viewForImageProvider:", v8);
    v6 = (CDComplicationImageView *)objc_claimAutoreleasedReturnValue();
    v7 = self->_imageView;
    self->_imageView = v6;

    imageView = self->_imageView;
    if (imageView)
    {
      -[NTKUtilityComplicationView _updateImageViewAlpha:](self, "_updateImageViewAlpha:");
      -[NTKUtilityImageAndLabelsComplicationView addSubview:](self, "addSubview:", self->_imageView);
      imageView = self->_imageView;
    }
  }
  -[NTKUtilityComplicationView _updateImageViewColor:](self, "_updateImageViewColor:", imageView);
  -[CDComplicationImageView setImageProvider:](self->_imageView, "setImageProvider:", v8);
  -[NTKUtilityImageAndLabelsComplicationView _updateFirstLabelMaxSize](self, "_updateFirstLabelMaxSize");

}

- (void)_enumerateColoringViewsWithBlock:(id)a3
{
  void (*v5)(void);
  id v6;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, CLKUIColoringLabel *))a3 + 2))(v6, self->_secondLabel);
  (*((void (**)(id, CDComplicationImageView *))a3 + 2))(v6, self->_imageView);

}

- (void)_enumerateColoringStackedImagesViewsWithBlock:(id)a3
{
  void (**v4)(id, CDComplicationImageView *);

  v4 = (void (**)(id, CDComplicationImageView *))a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4[2](v4, self->_imageView);

}

- (CDComplicationImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (CLKUIColoringLabel)firstLabel
{
  return self->_firstLabel;
}

- (void)setFirstLabel:(id)a3
{
  objc_storeStrong((id *)&self->_firstLabel, a3);
}

- (CLKUIColoringLabel)secondLabel
{
  return self->_secondLabel;
}

- (void)setSecondLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondLabel, 0);
  objc_storeStrong((id *)&self->_firstLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
