@implementation GKSegmentedSelectorView

- (GKSegmentedSelectorView)initWithFrame:(CGRect)a3
{
  GKSegmentedSelectorView *v3;
  uint64_t v4;
  UISegmentedControl *segmentedControl;
  void *v6;
  _BYTE *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  void *v15;
  UISegmentedControl *v16;
  void *v17;
  float v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  objc_super v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)GKSegmentedSelectorView;
  v3 = -[GKHeaderWithUnderlineView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!v3)
    return v3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", &unk_1E5A5EBF0);
  segmentedControl = v3->_segmentedControl;
  v3->_segmentedControl = (UISegmentedControl *)v4;

  -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](v3->_segmentedControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (GKHasSlowerGraphicsHardware_onceToken != -1)
    dispatch_once(&GKHasSlowerGraphicsHardware_onceToken, &__block_literal_global_45);
  v7 = (_BYTE *)MEMORY[0x1E0D253F8];
  if ((unint64_t)GKHasSlowerGraphicsHardware_processorCount > 1)
  {
    if (*MEMORY[0x1E0D253F8])
      goto LABEL_9;
    -[GKSegmentedSelectorView segmentedControl](v3, "segmentedControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *MEMORY[0x1E0DC1140];
    objc_msgSend(v6, "emphasizedTextOnDarkBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v9;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = &v31;
    v12 = &v30;
  }
  else
  {
    -[GKSegmentedSelectorView segmentedControl](v3, "segmentedControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v9;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = (void **)v33;
    v12 = &v32;
  }
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitleTextAttributes:forState:", v13, 4);

LABEL_9:
  -[GKSegmentedSelectorView addSubview:](v3, "addSubview:", v3->_segmentedControl);
  -[GKHeaderWithUnderlineView metrics](v3, "metrics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3718];
  v16 = v3->_segmentedControl;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("hairline"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  objc_msgSend(v15, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 10, 0, v3, 10, 1.0, (float)-v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSegmentedSelectorView addConstraint:](v3, "addConstraint:", v19);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_segmentedControl, 9, 0, v3, 9, 1.0, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSegmentedSelectorView addConstraint:](v3, "addConstraint:", v20);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "userInterfaceIdiom");

  if (v22 == 1 && (!*v7 || *MEMORY[0x1E0D25B68]))
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_segmentedControl, 7, 0, 0, 0, 1.0, 664.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = 1144750080;
    objc_msgSend(v23, "setPriority:", v25);
    -[GKSegmentedSelectorView addConstraint:](v3, "addConstraint:", v23);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_segmentedControl, 7, -1, v3, 7, 1.0, -50.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = 1144750080;
    objc_msgSend(v26, "setPriority:", v27);
    -[GKSegmentedSelectorView addConstraint:](v3, "addConstraint:", v26);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_segmentedControl, 7, 0, v3, 7, 1.0, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = 1144750080;
    objc_msgSend(v23, "setPriority:", v24);
    -[GKSegmentedSelectorView setWidthConstraint:](v3, "setWidthConstraint:", v23);
    -[GKSegmentedSelectorView addConstraint:](v3, "addConstraint:", v23);
  }

  return v3;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKSegmentedSelectorView;
  -[GKHeaderWithUnderlineView applyLayoutAttributes:](&v9, sel_applyLayoutAttributes_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "leadingMargin");
    v7 = v6;
    objc_msgSend(v5, "trailingMargin");
    if (v7 == 0.0)
    {
      -[GKSegmentedSelectorView _contentMargin](self, "_contentMargin");
      v7 = v8;
    }
    if (v7 >= v8)
      v8 = v7;
    -[NSLayoutConstraint setConstant:](self->_widthConstraint, "setConstant:", -(v8 + v8));

  }
}

- (BOOL)drawsUnderline
{
  return 0;
}

- (void)setTarget:(id)a3
{
  id v4;
  void *v5;
  id target;
  id v7;

  v4 = a3;
  v5 = v4;
  target = self->_target;
  if (target != v4)
  {
    v7 = v4;
    if (target)
    {
      -[UISegmentedControl removeTarget:action:forControlEvents:](self->_segmentedControl, "removeTarget:action:forControlEvents:", target, sel_selectedSegmentChanged_, 4096);
      v5 = v7;
    }
    self->_target = v5;
    if (v5)
    {
      -[UISegmentedControl addTarget:action:forControlEvents:](self->_segmentedControl, "addTarget:action:forControlEvents:", v5, sel_selectedSegmentChanged_, 4096);
      v5 = v7;
    }
  }

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKSegmentedSelectorView;
  -[GKSegmentedSelectorView prepareForReuse](&v3, sel_prepareForReuse);
  -[UISegmentedControl removeAllSegments](self->_segmentedControl, "removeAllSegments");
  -[GKSegmentedSelectorView setTarget:](self, "setTarget:", 0);
}

- (void)pinningStateChangedTo:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint64_t v12;
  _QWORD v13[2];

  v3 = a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)GKSegmentedSelectorView;
  -[GKHeaderWithUnderlineView pinningStateChangedTo:](&v11, sel_pinningStateChangedTo_);
  v5 = 0.0;
  if (v3)
    v5 = -10.0;
  -[GKSegmentedSelectorView setHitTestInsets:](self, "setHitTestInsets:", v5, v5, v5, v5);
  if (!*MEMORY[0x1E0D253F8])
  {
    if (GKHasSlowerGraphicsHardware_onceToken != -1)
      dispatch_once(&GKHasSlowerGraphicsHardware_onceToken, &__block_literal_global_45);
    if ((unint64_t)GKHasSlowerGraphicsHardware_processorCount >= 2)
    {
      objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKSegmentedSelectorView segmentedControl](self, "segmentedControl");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v3)
      {
        objc_msgSend(v7, "setTitleTextAttributes:forState:", MEMORY[0x1E0C9AA70], 4);
      }
      else
      {
        v12 = *MEMORY[0x1E0DC1140];
        objc_msgSend(v6, "emphasizedTextOnDarkBackgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setTitleTextAttributes:forState:", v10, 4);

      }
    }
  }
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedControl, a3);
}

- (id)target
{
  return self->_target;
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

@end
