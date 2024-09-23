@implementation HUMediaPlatterCollectionViewCell

- (void)prepareForReuse
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HUMediaPlatterCollectionViewCell;
  -[HUViewControllerCollectionViewCell prepareForReuse](&v2, sel_prepareForReuse);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  objc_super v43;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (!-[HUViewControllerCollectionViewCell allowSelfSizing](self, "allowSelfSizing"))
  {
    v43.receiver = self;
    v43.super_class = (Class)HUMediaPlatterCollectionViewCell;
    *(float *)&v10 = a4;
    *(float *)&v11 = a5;
    -[HUViewControllerCollectionViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v43, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v10, v11);
    v28 = v41;
    v30 = v42;
LABEL_6:
    v39 = v28;
    v40 = v30;
    goto LABEL_7;
  }
  -[HUMediaPlatterCollectionViewCell setClipsToBounds:](self, "setClipsToBounds:", 1);
  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeThatFits:", width, 3.40282347e38);
  v15 = v14;

  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v19 = v18;
  v21 = v20;

  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v19, v21, width, v15);

  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layoutIfNeeded");

  -[HUMediaPlatterCollectionViewCell _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", 16.0);
  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "preferredContentSize");
  v28 = v27;
  v30 = v29;

  if (*MEMORY[0x1E0C9D820] != v28 || *(double *)(MEMORY[0x1E0C9D820] + 8) != v30)
    goto LABEL_6;
  -[HUViewControllerCollectionViewCell viewController](self, "viewController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v33 = a4;
  *(float *)&v34 = a5;
  objc_msgSend(v32, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v33, v34);
  v36 = v35;
  v38 = v37;

  v39 = v36;
  v40 = v38;
LABEL_7:
  result.height = v40;
  result.width = v39;
  return result;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (-[HUViewControllerCollectionViewCell allowSelfSizing](self, "allowSelfSizing"))
  {
    v8.receiver = self;
    v8.super_class = (Class)HUMediaPlatterCollectionViewCell;
    -[HUViewControllerCollectionViewCell preferredLayoutAttributesFittingAttributes:](&v8, sel_preferredLayoutAttributesFittingAttributes_, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (id)prefixString
{
  return 0;
}

- (id)primaryString
{
  return 0;
}

- (id)secondaryString
{
  return 0;
}

- (id)secondaryAttributedString
{
  return 0;
}

- (CGRect)iconViewTileFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)prefixLabelTileFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)primaryLabelTileFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)secondaryLabelTileFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)prefixLabelShouldFeather
{
  return 0;
}

- (BOOL)primaryLabelShouldFeather
{
  return 0;
}

- (BOOL)secondaryLabelShouldFeather
{
  return 0;
}

- (id)prefixLabelFont
{
  return 0;
}

- (id)primaryLabelFont
{
  return 0;
}

- (id)secondaryLabelFont
{
  return 0;
}

- (id)prefixLabelTextColor
{
  return 0;
}

- (id)primaryLabelTextColor
{
  return 0;
}

- (id)secondaryLabelTextColor
{
  return 0;
}

- (CGRect)tileFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[HUMediaPlatterCollectionViewCell frame](self, "frame");
  v6 = v2;
  v7 = v3;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (unint64_t)backgroundDisplayStyle
{
  return 2;
}

- (id)createBackgroundBlurView
{
  return 0;
}

- (id)backgroundColor
{
  void *v2;
  void *v3;
  void *v4;

  -[HUMediaPlatterCollectionViewCell traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceStyle") == 1)
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "colorWithAlphaComponent:", 0.9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)recognizeDoubleClickGesture
{
  return 0;
}

- (id)baseIconViewConfiguration
{
  return 0;
}

@end
