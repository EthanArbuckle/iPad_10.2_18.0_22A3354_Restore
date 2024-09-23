@implementation DOCTagDotView

- (DOCTagDotView)initWithDefaultTagDimension:(double)a3 adjustsSizeForContentSizeCategory:(BOOL)a4
{
  _BOOL4 v4;
  DOCTagDotView *v6;
  DOCTagDotView *v7;
  UIImageView *v8;
  UIImageView *dotView;
  CALayer *v10;
  CALayer *checkmarkLayer;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSLayoutConstraint *tagDimensionConstraint;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *notificationObservances;
  void *v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  id v34;
  id location;
  objc_super v36;
  _QWORD v37[2];

  v4 = a4;
  v37[1] = *MEMORY[0x24BDAC8D0];
  v36.receiver = self;
  v36.super_class = (Class)DOCTagDotView;
  v6 = -[DOCTagDotView initWithFrame:](&v36, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_renderedTagVariant = 0;
    v6->_defaultTagDimension = a3;
    v6->_adjustsSizeForContentSizeCategory = v4;
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    dotView = v7->_dotView;
    v7->_dotView = v8;

    v10 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
    checkmarkLayer = v7->_checkmarkLayer;
    v7->_checkmarkLayer = v10;

    -[CALayer setHidden:](v7->_checkmarkLayer, "setHidden:", 1);
    v12 = objc_alloc_init(MEMORY[0x24BDE56D0]);
    +[DOCTagCheckmarkView checkmarkImage](DOCTagCheckmarkView, "checkmarkImage");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "setContents:", objc_msgSend(v13, "CGImage"));

    -[CALayer setMask:](v7->_checkmarkLayer, "setMask:", v12);
    -[DOCTagDotView updateLayoutOfLayers](v7, "updateLayoutOfLayers");
    -[DOCTagDotView addSubview:](v7, "addSubview:", v7->_dotView);
    -[DOCTagDotView layer](v7, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagDotView checkmarkLayer](v7, "checkmarkLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSublayer:", v15);

    -[DOCTagDotView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DOCTagDotView heightAnchor](v7, "heightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToConstant:", a3);
    v17 = objc_claimAutoreleasedReturnValue();
    tagDimensionConstraint = v7->_tagDimensionConstraint;
    v7->_tagDimensionConstraint = (NSLayoutConstraint *)v17;

    -[DOCTagDotView widthAnchor](v7, "widthAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagDotView heightAnchor](v7, "heightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    -[DOCTagDotView updateForChangedTraitsAffectingFonts](v7, "updateForChangedTraitsAffectingFonts");
    -[NSLayoutConstraint setActive:](v7->_tagDimensionConstraint, "setActive:", 1);
    objc_initWeak(&location, v7);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = MEMORY[0x24BDAC760];
    v31 = 3221225472;
    v32 = __79__DOCTagDotView_initWithDefaultTagDimension_adjustsSizeForContentSizeCategory___block_invoke;
    v33 = &unk_24E327A58;
    objc_copyWeak(&v34, &location);
    objc_msgSend(v22, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x24BEBDDB8], 0, v23, &v30);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 1, v30, v31, v32, v33);
    v25 = objc_claimAutoreleasedReturnValue();
    notificationObservances = v7->_notificationObservances;
    v7->_notificationObservances = (NSArray *)v25;

    if (v4)
    {
      objc_msgSend(MEMORY[0x24BEBDAB0], "doc_traitsAffectingFonts");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (id)-[DOCTagDotView registerForTraitChanges:withAction:](v7, "registerForTraitChanges:withAction:", v27, sel_updateForChangedTraitsAffectingFonts);

    }
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);

  }
  return v7;
}

void __79__DOCTagDotView_initWithDefaultTagDimension_adjustsSizeForContentSizeCategory___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateLayoutOfLayers");

}

- (void)dealloc
{
  void *v3;
  NSArray *notificationObservances;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  notificationObservances = self->_notificationObservances;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __24__DOCTagDotView_dealloc__block_invoke;
  v7[3] = &unk_24E327A80;
  v8 = v3;
  v5 = v3;
  -[NSArray enumerateObjectsUsingBlock:](notificationObservances, "enumerateObjectsUsingBlock:", v7);

  v6.receiver = self;
  v6.super_class = (Class)DOCTagDotView;
  -[DOCTagDotView dealloc](&v6, sel_dealloc);
}

uint64_t __24__DOCTagDotView_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObserver:", a2);
}

- (void)updateForChangedTraitsAffectingFonts
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  -[DOCTagDotView defaultTagDimension](self, "defaultTagDimension");
  v4 = v3;
  if (-[DOCTagDotView adjustsSizeForContentSizeCategory](self, "adjustsSizeForContentSizeCategory"))
  {
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagDotView defaultTagDimension](self, "defaultTagDimension");
    v7 = v6;
    -[DOCTagDotView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scaledValueForValue:compatibleWithTraitCollection:", v8, v7);
    v4 = v9;

  }
  -[NSLayoutConstraint constant](self->_tagDimensionConstraint, "constant");
  if (v4 != v10)
  {
    -[NSLayoutConstraint setConstant:](self->_tagDimensionConstraint, "setConstant:", v4);
    -[DOCTagDotView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (double)tagDimension
{
  double result;

  -[NSLayoutConstraint constant](self->_tagDimensionConstraint, "constant");
  return result;
}

- (void)setItemTag:(id)a3
{
  DOCTag *v5;
  DOCTag *v6;

  v5 = (DOCTag *)a3;
  if (self->_itemTag != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_itemTag, a3);
    -[DOCTagDotView setNeedsItemTagImageUpdate](self, "setNeedsItemTagImageUpdate");
    -[DOCTagDotView updateContents](self, "updateContents");
    v5 = v6;
  }

}

- (void)setItemTagImage:(id)a3
{
  UIImage *v5;
  _QWORD v6[5];
  UIImage *v7;

  v5 = (UIImage *)a3;
  if (self->_itemTagImage != v5)
  {
    objc_storeStrong((id *)&self->_itemTagImage, a3);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __33__DOCTagDotView_setItemTagImage___block_invoke;
    v6[3] = &unk_24E327A10;
    v6[4] = self;
    v7 = v5;
    -[DOCTagDotView _withoutAnimations:](self, "_withoutAnimations:", v6);

  }
}

void __33__DOCTagDotView_setItemTagImage___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "dotView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v1);

}

- (void)_withoutAnimations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BEBDB00];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__DOCTagDotView__withoutAnimations___block_invoke;
  v6[3] = &unk_24E327AA8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "performWithoutAnimation:", v6);

}

uint64_t __36__DOCTagDotView__withoutAnimations___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)setChecked:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_checked != a3)
  {
    self->_checked = a3;
    v3 = !a3;
    -[DOCTagDotView checkmarkLayer](self, "checkmarkLayer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", v3);

  }
}

- (void)setRenderedTagVariant:(unint64_t)a3
{
  if (self->_renderedTagVariant != a3)
  {
    self->_renderedTagVariant = a3;
    -[DOCTagDotView setNeedsItemTagImageUpdate](self, "setNeedsItemTagImageUpdate");
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  -[DOCTagDotView updateContents](self, "updateContents");
  v3.receiver = self;
  v3.super_class = (Class)DOCTagDotView;
  -[DOCTagDotView layoutSubviews](&v3, sel_layoutSubviews);
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCTagDotView;
  v4 = a3;
  -[DOCTagDotView layoutSublayersOfLayer:](&v6, sel_layoutSublayersOfLayer_, v4);
  -[DOCTagDotView layer](self, "layer", v6.receiver, v6.super_class);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[DOCTagDotView updateLayoutOfLayers](self, "updateLayoutOfLayers");
}

- (void)setNeedsItemTagImageUpdate
{
  self->_needsItemTagImageUpdate = 1;
  -[DOCTagDotView setNeedsLayout](self, "setNeedsLayout");
}

- (void)loadItemTagImageIfNecessary
{
  UIImage *itemTagImage;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  itemTagImage = self->_itemTagImage;
  if (-[DOCTagDotView needsItemTagImageUpdate](self, "needsItemTagImageUpdate") || !itemTagImage)
  {
    self->_needsItemTagImageUpdate = 0;
    -[DOCTagDotView tagDimensionConstraint](self, "tagDimensionConstraint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constant");
    v6 = v5;

    -[DOCTagDotView itemTag](self, "itemTag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[DOCTagRenderingRequest requestForTag:tagDimension:variant:](DOCTagRenderingRequest, "requestForTag:tagDimension:variant:", v7, self->_renderedTagVariant, v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setAllowUnsizedSymbolImages:", 1);
    +[DOCTagRenderer shared](DOCTagRenderer, "shared");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "renderImageWithRequest:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[DOCTagDotView setItemTagImage:](self, "setItemTagImage:", v9);
  }
}

- (void)updateContents
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[DOCTagDotView loadItemTagImageIfNecessary](self, "loadItemTagImageIfNecessary");
  -[DOCTagDotView itemTag](self, "itemTag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tagColorIfNotClear");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  else
    objc_msgSend(MEMORY[0x24BE2DF20], "nonClearNoneTagColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "CGColor");
  -[DOCTagDotView checkmarkLayer](self, "checkmarkLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

}

- (void)updateLayoutOfLayers
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __37__DOCTagDotView_updateLayoutOfLayers__block_invoke;
  v2[3] = &unk_24E3279E8;
  v2[4] = self;
  -[DOCTagDotView _withoutAnimations:](self, "_withoutAnimations:", v2);
}

uint64_t __37__DOCTagDotView_updateLayoutOfLayers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLayoutOfLayers");
}

- (void)_updateLayoutOfLayers
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double x;
  double y;
  double width;
  double height;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  id v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  -[DOCTagDotView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[DOCTagDotView dotView](self, "dotView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  +[DOCTagCheckmarkView checkmarkImage](DOCTagCheckmarkView, "checkmarkImage");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "size");
  v13 = v12;
  v15 = v14;
  -[DOCTagDotView bounds](self, "bounds");
  v17 = v16 * 0.5;
  if (v16 * 0.5 > 0.0)
  {
    objc_msgSend(v39, "size");
    v19 = v18 / v17;
    objc_msgSend(v39, "size");
    v21 = v20 / v17;
    if (v19 >= v20 / v17)
      v21 = v19;
    if (v21 > 1.0)
    {
      v13 = v13 / v21;
      v15 = v15 / v21;
    }
  }
  -[DOCTagDotView bounds](self, "bounds");
  v22 = CGRectGetMidX(v40) - v13 * 0.5;
  -[DOCTagDotView bounds](self, "bounds");
  v42.origin.y = CGRectGetMidY(v41) - v15 * 0.5;
  v42.origin.x = v22;
  v42.size.width = v13;
  v42.size.height = v15;
  v43 = CGRectIntegral(v42);
  x = v43.origin.x;
  y = v43.origin.y;
  width = v43.size.width;
  height = v43.size.height;
  -[DOCTagDotView checkmarkLayer](self, "checkmarkLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", x, y, width, height);

  -[DOCTagDotView checkmarkLayer](self, "checkmarkLayer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  -[DOCTagDotView checkmarkLayer](self, "checkmarkLayer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "mask");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFrame:", v30, v32, v34, v36);

}

- (DOCTag)itemTag
{
  return self->_itemTag;
}

- (BOOL)adjustsSizeForContentSizeCategory
{
  return self->_adjustsSizeForContentSizeCategory;
}

- (BOOL)checked
{
  return self->_checked;
}

- (unint64_t)renderedTagVariant
{
  return self->_renderedTagVariant;
}

- (double)defaultTagDimension
{
  return self->_defaultTagDimension;
}

- (NSLayoutConstraint)tagDimensionConstraint
{
  return self->_tagDimensionConstraint;
}

- (BOOL)needsItemTagImageUpdate
{
  return self->_needsItemTagImageUpdate;
}

- (UIImage)itemTagImage
{
  return self->_itemTagImage;
}

- (UIImageView)dotView
{
  return self->_dotView;
}

- (CALayer)checkmarkLayer
{
  return self->_checkmarkLayer;
}

- (NSArray)notificationObservances
{
  return self->_notificationObservances;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationObservances, 0);
  objc_storeStrong((id *)&self->_checkmarkLayer, 0);
  objc_storeStrong((id *)&self->_dotView, 0);
  objc_storeStrong((id *)&self->_itemTagImage, 0);
  objc_storeStrong((id *)&self->_tagDimensionConstraint, 0);
  objc_storeStrong((id *)&self->_itemTag, 0);
}

@end
