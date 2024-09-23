@implementation MFComposeImageSizeView

- (MFComposeImageSizeView)initWithFrame:(CGRect)a3
{
  MFComposeImageSizeView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *visibleScales;
  void *v15;
  void *v16;
  UISegmentedControl *v17;
  UISegmentedControl *segmentedControl;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MFComposeImageSizeView;
  v3 = -[MFComposeImageSizeView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (!sScaleLabels)
    {
      v4 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("SMALL_SIZE_BAR_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("MEDIUM_SIZE_BAR_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v4;
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LARGE_SIZE_BAR_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ACTUAL_SIZE_BAR_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "arrayWithObjects:", v21, v5, v8, v10, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)sScaleLabels;
      sScaleLabels = v11;

    }
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    visibleScales = v3->_visibleScales;
    v3->_visibleScales = v13;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("IMAGE_RESIZING_BAR_TITLE_EXPANDED"), &stru_1E5A6A588, CFSTR("Main"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeImageSizeView setLabel:](v3, "setLabel:", v16);

    v17 = (UISegmentedControl *)objc_alloc_init(MEMORY[0x1E0DC3C58]);
    segmentedControl = v3->_segmentedControl;
    v3->_segmentedControl = v17;

    -[UISegmentedControl addTarget:action:forControlEvents:](v3->_segmentedControl, "addTarget:action:forControlEvents:", v3, sel_segmentedControlChanged, 4096);
    -[MFComposeImageSizeView addSubview:](v3, "addSubview:", v3->_segmentedControl);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double MinX;
  UISegmentedControl *segmentedControl;
  void *v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  v17.receiver = self;
  v17.super_class = (Class)MFComposeImageSizeView;
  -[MFComposeImageSizeView layoutSubviews](&v17, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceLayoutDirection");

  -[MFComposeImageSizeView _contentRect](self, "_contentRect");
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  CGRectGetWidth(v18);
  -[MFComposeImageSizeView labelView](self, "labelView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  CGRectGetWidth(v19);

  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  if (v4 == 1)
    MinX = CGRectGetMinX(*(CGRect *)&v10);
  else
    MinX = CGRectGetMaxX(*(CGRect *)&v10);
  -[MFComposeImageSizeView bounds](self, "bounds", MinX);
  UIRectCenteredYInRect();
  segmentedControl = self->_segmentedControl;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scale");
  UIRectIntegralWithScale();
  -[UISegmentedControl setFrame:](segmentedControl, "setFrame:");

}

- (unint64_t)_scaleLabelIndexForScale:(unint64_t)a3
{
  unint64_t result;

  result = 0;
  while (MFImageScalingFlagConstants[result] != a3)
  {
    if (++result == 4)
      return -1;
  }
  return result;
}

- (unint64_t)_insertIndexForScale:(unint64_t)a3
{
  uint64_t v5;
  int v6;
  NSMutableArray *visibleScales;
  void *v8;

  v5 = 0;
  v6 = 0;
  do
  {
    if (MFImageScalingFlagConstants[v5] == a3)
      break;
    visibleScales = self->_visibleScales;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(visibleScales) = -[NSMutableArray containsObject:](visibleScales, "containsObject:", v8);

    v6 += visibleScales ^ 1;
    ++v5;
  }
  while (v5 != 4);
  return (int)v5 - v6;
}

- (void)setSizeDescription:(id)a3 forScale:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  NSMutableArray *visibleScales;
  void *v22;
  int v23;
  UISegmentedControl *segmentedControl;
  NSMutableArray *v25;
  void *v26;
  unint64_t v27;
  NSMutableArray *v28;
  UISegmentedControl *v29;
  NSMutableArray *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[2];
  CGSize v41;

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend((id)sScaleLabels, "objectAtIndex:", -[MFComposeImageSizeView _scaleLabelIndexForScale:](self, "_scaleLabelIndexForScale:", a4));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 13.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 13.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = *MEMORY[0x1E0DC1138];
  v7 = v39;
  v40[0] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v7;
  v38 = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sizeWithAttributes:", v36);
  v9 = v8;
  if (v6)
    objc_msgSend(v6, "sizeWithAttributes:", v34);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v11 = v9 + 5.0;
  UIRectIntegralWithScale();
  v13 = v12;
  v15 = v14;

  v41.width = v13;
  v41.height = v15;
  UIGraphicsBeginImageContextWithOptions(v41, 0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scale");
  if (v17 <= 1.0)
    v18 = 0.0;
  else
    v18 = 0.5;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "set");

  objc_msgSend(v35, "drawAtPoint:withAttributes:", v36, 0.0, 0.0);
  objc_msgSend(v6, "drawAtPoint:withAttributes:", v34, round(v11), v18);
  UIGraphicsGetImageFromCurrentImageContext();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsPopContext();
  visibleScales = self->_visibleScales;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[NSMutableArray containsObject:](visibleScales, "containsObject:", v22);

  if (v23)
  {
    segmentedControl = self->_segmentedControl;
    v25 = self->_visibleScales;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl setImage:forSegmentAtIndex:](segmentedControl, "setImage:forSegmentAtIndex:", v20, -[NSMutableArray indexOfObject:](v25, "indexOfObject:", v26));
  }
  else
  {
    v27 = -[MFComposeImageSizeView _insertIndexForScale:](self, "_insertIndexForScale:", a4);
    -[UISegmentedControl insertSegmentWithImage:atIndex:animated:](self->_segmentedControl, "insertSegmentWithImage:atIndex:animated:", v20, v27, 0);
    v28 = self->_visibleScales;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray insertObject:atIndex:](v28, "insertObject:atIndex:", v26, v27);
  }

  v29 = self->_segmentedControl;
  v30 = self->_visibleScales;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISegmentedControl setEnabled:forSegmentAtIndex:](v29, "setEnabled:forSegmentAtIndex:", v6 != 0, -[NSMutableArray indexOfObject:](v30, "indexOfObject:", v31));

}

- (void)removeSizeDescriptionForScale:(unint64_t)a3
{
  NSMutableArray *visibleScales;
  void *v5;
  uint64_t v6;

  visibleScales = self->_visibleScales;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSMutableArray indexOfObject:](visibleScales, "indexOfObject:", v5);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[UISegmentedControl removeSegmentAtIndex:animated:](self->_segmentedControl, "removeSegmentAtIndex:animated:", v6, 0);
    -[NSMutableArray removeObjectAtIndex:](self->_visibleScales, "removeObjectAtIndex:", v6);
  }
}

- (void)setScale:(unint64_t)a3
{
  UISegmentedControl *segmentedControl;
  NSMutableArray *visibleScales;
  id v5;

  segmentedControl = self->_segmentedControl;
  visibleScales = self->_visibleScales;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UISegmentedControl setSelectedSegmentIndex:](segmentedControl, "setSelectedSegmentIndex:", -[NSMutableArray indexOfObject:](visibleScales, "indexOfObject:"));

}

- (void)segmentedControlChanged
{
  void *v3;
  uint64_t v4;
  _QWORD v5[6];

  -[NSMutableArray objectAtIndexedSubscript:](self->_visibleScales, "objectAtIndexedSubscript:", -[UISegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue");

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__MFComposeImageSizeView_segmentedControlChanged__block_invoke;
  v5[3] = &unk_1E5A65590;
  v5[4] = self;
  v5[5] = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v5);
}

void __49__MFComposeImageSizeView_segmentedControlChanged__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageSizeView:changedSelectedScaleTo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleScales, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

@end
