@implementation WFCameraFlashButton

- (WFCameraFlashButton)initWithFrame:(CGRect)a3
{
  WFCameraFlashButton *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WFCameraFlashButton *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _QWORD v27[4];
  id v28;
  WFCameraFlashButton *v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;
  _QWORD v34[4];

  v34[3] = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)WFCameraFlashButton;
  v3 = -[WFCameraFlashButton initWithFrame:](&v33, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.945, 0.804, 0.137, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCameraFlashButton setTintColor:](v3, "setTintColor:", v4);

    v5 = objc_alloc(MEMORY[0x24BEBD668]);
    objc_msgSend(MEMORY[0x24BEC14E0], "actionKitImageNamed:", CFSTR("CameraFlash"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UIImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithImage:", v7);

    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "setContentMode:", 1);
    LODWORD(v9) = 1148846080;
    objc_msgSend(v8, "setContentHuggingPriority:forAxis:", 0, v9);
    -[WFCameraFlashButton addSubview:](v3, "addSubview:", v8);
    -[WFCameraFlashButton setFlashView:](v3, "setFlashView:", v8);
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 10, 0, v3, 10, 1.0, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCameraFlashButton addConstraint:](v3, "addConstraint:", v10);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 1, 0, v3, 1, 1.0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCameraFlashButton addConstraint:](v3, "addConstraint:", v11);

    WFLocalizedString(CFSTR("Auto"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v12;
    WFLocalizedStringWithKey(CFSTR("Flash On"), CFSTR("On"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v13;
    WFLocalizedString(CFSTR("Off"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __37__WFCameraFlashButton_initWithFrame___block_invoke;
    v27[3] = &unk_24E342838;
    v28 = &unk_24E3550F0;
    v17 = v3;
    v29 = v17;
    v30 = v16;
    v31 = v8;
    v32 = v15;
    v18 = v15;
    v19 = v8;
    v20 = v16;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v27);
    -[WFCameraFlashButton setLabels:](v17, "setLabels:", v20);
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCameraFlashButton setSelectedLabel:](v17, "setSelectedLabel:", v21);

    -[WFCameraFlashButton setExpanded:](v17, "setExpanded:", 1);
    LODWORD(v22) = 1144750080;
    -[WFCameraFlashButton setContentCompressionResistancePriority:forAxis:](v17, "setContentCompressionResistancePriority:forAxis:", 0, v22);
    LODWORD(v23) = 1144750080;
    -[WFCameraFlashButton setContentCompressionResistancePriority:forAxis:](v17, "setContentCompressionResistancePriority:forAxis:", 1, v23);
    LODWORD(v24) = 1132068864;
    -[WFCameraFlashButton setContentHuggingPriority:forAxis:](v17, "setContentHuggingPriority:forAxis:", 0, v24);
    LODWORD(v25) = 1132068864;
    -[WFCameraFlashButton setContentHuggingPriority:forAxis:](v17, "setContentHuggingPriority:forAxis:", 1, v25);

  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFCameraFlashButton;
  -[WFCameraFlashButton layoutSubviews](&v4, sel_layoutSubviews);
  if (-[WFCameraFlashButton needsHiding](self, "needsHiding"))
  {
    -[WFCameraFlashButton setNeedsHiding:](self, "setNeedsHiding:", 0);
    -[WFCameraFlashButton setExpanded:](self, "setExpanded:", 0);
    v3.receiver = self;
    v3.super_class = (Class)WFCameraFlashButton;
    -[WFCameraFlashButton layoutSubviews](&v3, sel_layoutSubviews);
  }
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFCameraFlashButton;
  -[WFCameraFlashButton didMoveToWindow](&v4, sel_didMoveToWindow);
  -[WFCameraFlashButton window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[WFCameraFlashButton setNeedsHiding:](self, "setNeedsHiding:", 1);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  WFCameraFlashButton *v5;
  WFCameraFlashButton *v6;
  WFCameraFlashButton *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFCameraFlashButton;
  -[WFCameraFlashButton hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (WFCameraFlashButton *)objc_claimAutoreleasedReturnValue();
  if (-[WFCameraFlashButton isDescendantOfView:](v5, "isDescendantOfView:", self))
    v6 = self;
  else
    v6 = v5;
  v7 = v6;

  return v7;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  objc_super v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WFCameraFlashButton;
  v8 = -[WFCameraFlashButton beginTrackingWithTouch:withEvent:](&v21, sel_beginTrackingWithTouch_withEvent_, v6, v7);
  if (v8)
  {
    if (-[WFCameraFlashButton expanded](self, "expanded"))
    {
      objc_msgSend(v6, "locationInView:", self);
      v20.receiver = self;
      v20.super_class = (Class)WFCameraFlashButton;
      -[WFCameraFlashButton hitTest:withEvent:](&v20, sel_hitTest_withEvent_, v7);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        -[WFCameraFlashButton labels](self, "labels");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", v9);

        v12 = v9;
        if (v11)
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFCameraFlashButton selectedLabel](self, "selectedLabel");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setTextColor:", v13);

          -[WFCameraFlashButton setSelectedLabel:](self, "setSelectedLabel:", v9);
          -[WFCameraFlashButton tintColor](self, "tintColor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFCameraFlashButton selectedLabel](self, "selectedLabel");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setTextColor:", v15);

          -[WFCameraFlashButton setExpanded:](self, "setExpanded:", 0);
          -[WFCameraFlashButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
          v12 = v9;
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {

        v12 = 0;
      }
      -[WFCameraFlashButton flashView](self, "flashView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v9, "isEqual:", v17);

      if (v18)
        -[WFCameraFlashButton setExpanded:](self, "setExpanded:", 0);
      goto LABEL_11;
    }
    -[WFCameraFlashButton setExpanded:](self, "setExpanded:", 1);
  }
LABEL_12:

  return v8;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BEBE9C8];
  v3 = 40.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setExpanded:(BOOL)a3
{
  void *v5;
  _QWORD *v6;
  void *v7;
  CGFloat v8;
  _QWORD v9[6];
  _QWORD v10[5];
  CGRect v11;

  if (self->_expanded != a3)
  {
    if (a3)
    {
      v5 = (void *)MEMORY[0x24BEBDB00];
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __35__WFCameraFlashButton_setExpanded___block_invoke;
      v10[3] = &unk_24E343958;
      v10[4] = self;
      v6 = v10;
    }
    else
    {
      -[WFCameraFlashButton flashView](self, "flashView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "frame");
      v8 = CGRectGetMaxX(v11) + 5.0;

      v5 = (void *)MEMORY[0x24BEBDB00];
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __35__WFCameraFlashButton_setExpanded___block_invoke_2;
      v9[3] = &unk_24E3438C0;
      v9[4] = self;
      *(CGFloat *)&v9[5] = v8;
      v6 = v9;
    }
    objc_msgSend(v5, "animateWithDuration:animations:", v6, 0.200000003);
  }
  self->_expanded = a3;
}

- (void)setFlashMode:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  -[WFCameraFlashButton labels](self, "labels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __36__WFCameraFlashButton_setFlashMode___block_invoke;
  v9[3] = &__block_descriptor_40_e23_B32__0__UIView_8Q16_B24l;
  v9[4] = a3;
  v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[WFCameraFlashButton labels](self, "labels");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCameraFlashButton setSelectedLabel:](self, "setSelectedLabel:", v7);

  }
}

- (int64_t)flashMode
{
  void *v2;
  int64_t v3;

  -[WFCameraFlashButton selectedLabel](self, "selectedLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tag");

  return v3;
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
  objc_storeStrong((id *)&self->_labels, a3);
}

- (UILabel)selectedLabel
{
  return self->_selectedLabel;
}

- (void)setSelectedLabel:(id)a3
{
  objc_storeStrong((id *)&self->_selectedLabel, a3);
}

- (UIImageView)flashView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_flashView);
}

- (void)setFlashView:(id)a3
{
  objc_storeWeak((id *)&self->_flashView, a3);
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (BOOL)needsHiding
{
  return self->_needsHiding;
}

- (void)setNeedsHiding:(BOOL)a3
{
  self->_needsHiding = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_flashView);
  objc_storeStrong((id *)&self->_selectedLabel, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

BOOL __36__WFCameraFlashButton_setFlashMode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tag") == *(_QWORD *)(a1 + 32);
}

void __35__WFCameraFlashButton_setExpanded___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "labels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    v12 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v13 = *MEMORY[0x24BDBD8B8];
    v11 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v6);
        v14[0] = v13;
        v14[1] = v12;
        v14[2] = v11;
        objc_msgSend(v7, "setTransform:", v14, v11, v12, v13);
        objc_msgSend(v7, "setAlpha:", 1.0);
        objc_msgSend(*(id *)(a1 + 32), "selectedLabel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqual:", v7);

        if (v9)
          objc_msgSend(*(id *)(a1 + 32), "tintColor");
        else
          objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setTextColor:", v10);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

void __35__WFCameraFlashButton_setExpanded___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat MinX;
  void *v11;
  char v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  CGRect v21;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "labels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setTextColor:", v8);

        v9 = *(double *)(a1 + 40);
        objc_msgSend(v7, "frame");
        MinX = CGRectGetMinX(v21);
        CGAffineTransformMakeTranslation(&v14, v9 - MinX, 0.0);
        v13 = v14;
        objc_msgSend(v7, "setTransform:", &v13);
        objc_msgSend(*(id *)(a1 + 32), "selectedLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v7);

        if ((v12 & 1) == 0)
          objc_msgSend(v7, "setAlpha:", 0.0);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

void __37__WFCameraFlashButton_initWithFrame___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  void *v7;
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
  id firstValue;

  v5 = (objc_class *)MEMORY[0x24BEBD708];
  v6 = a2;
  firstValue = objc_alloc_init(v5);
  objc_msgSend(firstValue, "setUserInteractionEnabled:", 1);
  objc_msgSend(firstValue, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(firstValue, "setFont:", v7);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(firstValue, "setTextColor:", v8);

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(firstValue, "setTag:", objc_msgSend(v9, "integerValue"));

  objc_msgSend(firstValue, "setText:", v6);
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", firstValue);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", firstValue);
  _NSDictionaryOfVariableBindings(CFSTR("label"), firstValue, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[label]|"), 0, 0, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addConstraints:", v12);

  v13 = *(void **)(a1 + 40);
  v14 = (void *)MEMORY[0x24BDD1628];
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a3 - 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", firstValue, 1, 0, v15, 2, 1.0, 20.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addConstraint:", v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", firstValue, 1, 0, *(_QWORD *)(a1 + 56), 2, 1.0, 20.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addConstraint:", v15);
  }

  if (objc_msgSend(*(id *)(a1 + 64), "count") - 1 == a3)
  {
    v17 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", firstValue, 2, 0, v17, 2, 1.0, 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addConstraint:", v18);

  }
}

@end
