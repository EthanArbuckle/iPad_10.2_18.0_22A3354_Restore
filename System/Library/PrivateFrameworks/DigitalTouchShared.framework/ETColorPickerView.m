@implementation ETColorPickerView

- (ETColorPickerView)initWithFrame:(CGRect)a3 collapsedFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  ETColorPickerView *v12;
  id v13;
  uint64_t v14;
  UIView *contentView;
  uint64_t v16;
  UITapGestureRecognizer *presentTapGestureRecognizer;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  ETColorWheelView *v23;
  ETColorWheelView *colorWheelView;
  double MidX;
  objc_super v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v27.receiver = self;
  v27.super_class = (Class)ETColorPickerView;
  v12 = -[DTSColorPicker initWithFrame:](&v27, sel_initWithFrame_);
  if (v12)
  {
    if (SetupSpecValuesIfNeeded_onceToken != -1)
      dispatch_once(&SetupSpecValuesIfNeeded_onceToken, &__block_literal_global);
    v12->_expandedFrame.origin.x = v11;
    v12->_expandedFrame.origin.y = v10;
    v12->_expandedFrame.size.width = v9;
    v12->_expandedFrame.size.height = v8;
    v12->_collapsedFrame.origin.x = x;
    v12->_collapsedFrame.origin.y = y;
    v12->_collapsedFrame.size.width = width;
    v12->_collapsedFrame.size.height = height;
    v13 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[ETColorPickerView bounds](v12, "bounds");
    v14 = objc_msgSend(v13, "initWithFrame:");
    contentView = v12->_contentView;
    v12->_contentView = (UIView *)v14;

    -[ETColorPickerView addSubview:](v12, "addSubview:", v12->_contentView);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v12, sel_presentTapReceived_);
    presentTapGestureRecognizer = v12->_presentTapGestureRecognizer;
    v12->_presentTapGestureRecognizer = (UITapGestureRecognizer *)v16;

    -[ETColorPickerView addGestureRecognizer:](v12, "addGestureRecognizer:", v12->_presentTapGestureRecognizer);
    -[DTSColorPicker createPaletteCirclesWithParentView:](v12, "createPaletteCirclesWithParentView:", v12->_contentView);
    -[ETColorPickerView layoutPaletteCircles](v12, "layoutPaletteCircles");
    -[UIView bounds](v12->_contentView, "bounds");
    v18 = v28.origin.x;
    v19 = v28.origin.y;
    v20 = v28.size.width;
    v21 = v28.size.height;
    v22 = CGRectGetWidth(v28);
    v23 = -[ETColorWheelView initWithFrame:]([ETColorWheelView alloc], "initWithFrame:", 0.0, 0.0, v22, v22);
    colorWheelView = v12->_colorWheelView;
    v12->_colorWheelView = v23;

    -[DTSColorWheel setDelegate:](v12->_colorWheelView, "setDelegate:", v12);
    v29.origin.x = v18;
    v29.origin.y = v19;
    v29.size.width = v20;
    v29.size.height = v21;
    MidX = CGRectGetMidX(v29);
    v30.origin.x = v18;
    v30.origin.y = v19;
    v30.size.width = v20;
    v30.size.height = v21;
    -[ETColorWheelView setCenter:](v12->_colorWheelView, "setCenter:", MidX, CGRectGetMidY(v30));
    -[UIView addSubview:](v12->_contentView, "addSubview:", v12->_colorWheelView);
    -[ETColorPickerView _dismissAnimated:completion:](v12, "_dismissAnimated:completion:", 0, 0);
  }
  return v12;
}

- (void)layoutPaletteCircles
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  CGRect v24;
  CGRect v25;

  -[UIView bounds](self->_contentView, "bounds");
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  MidX = CGRectGetMidX(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MidY = CGRectGetMidY(v25);
  +[ETColorStore defaultStore](ETColorStore, "defaultStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v12 = v11 - 1;
  -[DTSColorPicker paletteCircles](self, "paletteCircles");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 != 1)
  {
    v13 = 0;
    do
    {
      +[ETPaletteCircleView paletteCircleDiameter](ETPaletteCircleView, "paletteCircleDiameter");
      +[ETColorStore defaultStore](ETColorStore, "defaultStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "colors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      __sincos_stret((double)v13 * (6.28318531 / (double)(unint64_t)(v16 - 1)) + -1.57079633);
      UIRoundToViewScale();
      v18 = v17;
      UIRoundToViewScale();
      v20 = v19;
      objc_msgSend(v23, "objectAtIndexedSubscript:", v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setCenter:", v18, v20);

      ++v13;
    }
    while (v12 != v13);
  }
  objc_msgSend(v23, "lastObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCenter:", MidX, MidY);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  -[ETColorPickerView bounds](self, "bounds", a4);
  v9 = CGRectInset(v8, -12.0, -12.0);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v9, v7);
}

- (void)presentTapReceived:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[ETColorPickerView presentationDelegate](self, "presentationDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorPickerViewWillPresent:duration:", self, 0.3);

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__ETColorPickerView_presentTapReceived___block_invoke;
  v5[3] = &unk_24F6E6A98;
  v5[4] = self;
  -[ETColorPickerView presentAnimated:completion:](self, "presentAnimated:completion:", 1, v5);
}

void __40__ETColorPickerView_presentTapReceived___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "presentationDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorPickerViewDidPresent:", *(_QWORD *)(a1 + 32));

}

- (void)presentAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  BOOL v7;
  void *v8;
  double v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];

  v4 = a3;
  v6 = a4;
  -[UITapGestureRecognizer setEnabled:](self->_presentTapGestureRecognizer, "setEnabled:", 0);
  -[ETColorPickerView setIsExpanded:](self, "setIsExpanded:", 1);
  v7 = !v4;
  v8 = (void *)MEMORY[0x24BDF6F90];
  if (v7)
    v9 = 0.0;
  else
    v9 = 0.3;
  v12 = v6;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __48__ETColorPickerView_presentAnimated_completion___block_invoke;
  v13[3] = &unk_24F6E6A98;
  v13[4] = self;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __48__ETColorPickerView_presentAnimated_completion___block_invoke_2;
  v11[3] = &unk_24F6E6A70;
  v10 = v6;
  objc_msgSend(v8, "animateWithDuration:delay:options:animations:completion:", 4, v13, v11, v9, 0.0);

}

void __48__ETColorPickerView_presentAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __int128 v5;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[3];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464));
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(_QWORD *)(a1 + 32) + 488), *(double *)(*(_QWORD *)(a1 + 32) + 496), *(double *)(*(_QWORD *)(a1 + 32) + 504), *(double *)(*(_QWORD *)(a1 + 32) + 512));
  objc_msgSend(*(id *)(a1 + 32), "paletteCircles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "selectedCircle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "_isCenterCircle:", objc_msgSend(v2, "indexOfObject:", v3)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_addRotationAnimationFromAngle:toAngle:", *(double *)(*(_QWORD *)(a1 + 32) + 568), 0.0);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v18[0] = *MEMORY[0x24BDBD8B8];
  v18[1] = v5;
  v18[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v4, "setTransform:", v18);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "frame");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setCenter:", v6 * 0.5, v7 * 0.5);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v2;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if (v13 != v3)
          objc_msgSend(v13, "setAlpha:", 1.0, (_QWORD)v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v10);
  }

}

uint64_t __48__ETColorPickerView_presentAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v6 = a4;
  if (-[ETColorPickerView isExpanded](self, "isExpanded"))
  {
    -[ETColorPickerView presentationDelegate](self, "presentationDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorPickerView:willDismissAnimated:duration:", self, v4, 0.3);

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __48__ETColorPickerView_dismissAnimated_completion___block_invoke;
    v8[3] = &unk_24F6E6B00;
    v8[4] = self;
    v9 = v6;
    -[ETColorPickerView _dismissAnimated:completion:](self, "_dismissAnimated:completion:", v4, v8);

  }
}

uint64_t __48__ETColorPickerView_dismissAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "presentationDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorPickerViewDidDismiss:", *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    result = (*(uint64_t (**)(void))(result + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 560) = 0;
  return result;
}

- (void)_addRotationAnimationFromAngle:(double)a3 toAngle:(double)a4
{
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDuration:", 0.3);
  objc_msgSend(v7, "setAdditive:", 1);
  objc_msgSend(v7, "setRemovedOnCompletion:", 0);
  objc_msgSend(v7, "setFillMode:", *MEMORY[0x24BDE5978]);
  *(float *)&v8 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFromValue:", v9);

  *(float *)&v10 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToValue:", v11);

  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimingFunction:", v12);

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __60__ETColorPickerView__addRotationAnimationFromAngle_toAngle___block_invoke;
  v14[3] = &unk_24F6E6A98;
  v14[4] = self;
  objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v14);
  -[UIView layer](self->_contentView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAnimation:forKey:", v7, CFSTR("ColorPickerRotationAnimationKey"));

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

void __60__ETColorPickerView__addRotationAnimationFromAngle_toAngle___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "layer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAnimationForKey:", CFSTR("ColorPickerRotationAnimationKey"));

}

- (void)_dismissAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  char v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];

  v4 = a3;
  v6 = a4;
  v7 = -[ETColorWheelView isHidden](self->_colorWheelView, "isHidden");
  v8 = MEMORY[0x24BDAC760];
  if ((v7 & 1) == 0)
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __49__ETColorPickerView__dismissAnimated_completion___block_invoke;
    v22[3] = &unk_24F6E6A98;
    v22[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v22);
  }
  if (v4)
    v9 = 0.3;
  else
    v9 = 0.0;
  -[DTSColorPicker paletteCircles](self, "paletteCircles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTSColorPicker selectedCircle](self, "selectedCircle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDF6F90];
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __49__ETColorPickerView__dismissAnimated_completion___block_invoke_2;
  v19[3] = &unk_24F6E6B28;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __49__ETColorPickerView__dismissAnimated_completion___block_invoke_3;
  v16[3] = &unk_24F6E6B50;
  v16[4] = self;
  v17 = v21;
  v18 = v6;
  v13 = v6;
  v14 = v21;
  v15 = v10;
  objc_msgSend(v12, "animateWithDuration:delay:options:animations:completion:", 4, v19, v16, v9, 0.0);

}

uint64_t __49__ETColorPickerView__dismissAnimated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "hideColorWheelPickingColor:", 0);
}

void __49__ETColorPickerView__dismissAnimated_completion___block_invoke_2(id *a1)
{
  unint64_t v2;
  double v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double Width;
  CGFloat v26;
  double Height;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  id v37;
  double v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  _BYTE v51[128];
  uint64_t v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v52 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "setFrame:", *((double *)a1[4] + 65), *((double *)a1[4] + 66), *((double *)a1[4] + 67), *((double *)a1[4] + 68));
  v2 = objc_msgSend(a1[5], "indexOfObject:", a1[6]);
  if ((objc_msgSend(a1[4], "_isCenterCircle:", v2) & 1) == 0)
  {
    v3 = (double)v2;
    +[ETColorStore defaultStore](ETColorStore, "defaultStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    *((double *)a1[4] + 71) = -(v3 * (6.28318531 / (double)(unint64_t)(v6 - 1)) + -1.57079633 + 1.57079633);
    objc_msgSend(a1[4], "_addRotationAnimationFromAngle:toAngle:", 0.0, *((double *)a1[4] + 71));
  }
  objc_msgSend(*((id *)a1[4] + 58), "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if ((objc_msgSend(a1[4], "_shouldReverseLayoutDirection") & 1) != 0)
  {
    v53.origin.x = v8;
    v53.origin.y = v10;
    v53.size.width = v12;
    v53.size.height = v14;
    v15 = CGRectGetWidth(v53) * -0.5;
    v16 = CGRectGetMinX(*(CGRect *)((char *)a1[4] + 520)) + v15;
  }
  else
  {
    v16 = CGRectGetMidX(*(CGRect *)((char *)a1[4] + 520)) * -0.5;
  }
  objc_msgSend(*((id *)a1[4] + 58), "setFrame:", v16, v10, v12, v14);
  objc_msgSend(a1[6], "frame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  Width = CGRectGetWidth(*(CGRect *)((char *)a1[4] + 520));
  v54.origin.x = v18;
  v54.origin.y = v20;
  v54.size.width = v22;
  v54.size.height = v24;
  v26 = Width / CGRectGetWidth(v54);
  Height = CGRectGetHeight(*(CGRect *)((char *)a1[4] + 520));
  v55.origin.x = v18;
  v55.origin.y = v20;
  v55.size.width = v22;
  v55.size.height = v24;
  memset(&v50, 0, sizeof(v50));
  v28 = Height / CGRectGetHeight(v55);
  CGAffineTransformMakeScale(&v50, v26, v28);
  v29 = (void *)*((_QWORD *)a1[4] + 58);
  v49 = v50;
  objc_msgSend(v29, "setTransform:", &v49);
  objc_msgSend(*((id *)a1[4] + 58), "frame");
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v36 = a1[6];
  objc_msgSend(a1[5], "lastObject");
  v37 = (id)objc_claimAutoreleasedReturnValue();

  v38 = -13.0;
  if (v36 == v37)
  {
    v56.origin.x = v18;
    v56.origin.y = v20;
    v56.size.width = v22;
    v56.size.height = v24;
    v38 = -CGRectGetMinY(v56);
  }
  objc_msgSend(*((id *)a1[4] + 58), "setFrame:", v31, v28 * v38, v33, v35);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v39 = a1[5];
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v46;
    do
    {
      v43 = 0;
      do
      {
        if (*(_QWORD *)v46 != v42)
          objc_enumerationMutation(v39);
        v44 = *(id *)(*((_QWORD *)&v45 + 1) + 8 * v43);
        if (v44 != a1[6])
          objc_msgSend(v44, "setAlpha:", 0.0, (_QWORD)v45);
        ++v43;
      }
      while (v41 != v43);
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v41);
  }

}

uint64_t __49__ETColorPickerView__dismissAnimated_completion___block_invoke_3(uint64_t a1)
{
  ETPaletteCircleView *v2;
  double Width;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "removeFromSuperview");
  v2 = [ETPaletteCircleView alloc];
  Width = CGRectGetWidth(*(CGRect *)(*(_QWORD *)(a1 + 32) + 520));
  v4 = -[ETPaletteCircleView initWithFrame:](v2, "initWithFrame:", 0.0, 0.0, Width, CGRectGetHeight(*(CGRect *)(*(_QWORD *)(a1 + 32) + 520)));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 472);
  *(_QWORD *)(v5 + 472) = v4;

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 472);
  objc_msgSend(*(id *)(a1 + 40), "backgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setSelected:", 1);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472));
  objc_msgSend(*(id *)(a1 + 32), "setIsExpanded:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setEnabled:", 1);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)_isCenterCircle:(unint64_t)a3
{
  void *v4;

  -[DTSColorPicker paletteCircles](self, "paletteCircles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "count") - 1 == a3;

  return a3;
}

- (void)setDimmed:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[DTSColorPicker isDimmed](self, "isDimmed") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)ETColorPickerView;
    -[DTSColorPicker setDimmed:](&v5, sel_setDimmed_, v3);
    if (v3)
      -[ETColorPickerView animateToGray](self, "animateToGray");
    else
      -[ETColorPickerView animateToSelectedColor](self, "animateToSelectedColor");
    -[ETColorPickerView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v3 ^ 1);
  }
}

- (void)animateToGray
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __34__ETColorPickerView_animateToGray__block_invoke;
  v2[3] = &unk_24F6E6A98;
  v2[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 0x20000, v2, 0, 0.4, 0.0);
}

void __34__ETColorPickerView_animateToGray__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.121568627, 1.0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setBackgroundColor:", v2);

}

- (void)animateToSelectedColor
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __43__ETColorPickerView_animateToSelectedColor__block_invoke;
  v2[3] = &unk_24F6E6A98;
  v2[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 0x20000, v2, 0, 0.4, 0.0);
}

void __43__ETColorPickerView_animateToSelectedColor__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "selectedCircle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setBackgroundColor:", v2);

}

- (void)animateOffscreen
{
  void (**v3)(_QWORD);
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__ETColorPickerView_animateOffscreen__block_invoke;
  v4[3] = &unk_24F6E6A98;
  v4[4] = self;
  v3 = (void (**)(_QWORD))MEMORY[0x22E2FF82C](v4, a2);
  if (-[ETColorPickerView isExpanded](self, "isExpanded"))
    -[ETColorPickerView dismissAnimated:completion:](self, "dismissAnimated:completion:", 1, v3);
  else
    v3[2](v3);

}

uint64_t __37__ETColorPickerView_animateOffscreen__block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __37__ETColorPickerView_animateOffscreen__block_invoke_2;
  v2[3] = &unk_24F6E6A98;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v2, 0.4);
}

uint64_t __37__ETColorPickerView_animateOffscreen__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(_QWORD *)(a1 + 32) + 520), -*(double *)(*(_QWORD *)(a1 + 32) + 544), *(double *)(*(_QWORD *)(a1 + 32) + 536));
}

- (void)animateOnscreen
{
  _QWORD v3[5];

  if (!-[ETColorPickerView isExpanded](self, "isExpanded"))
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __36__ETColorPickerView_animateOnscreen__block_invoke;
    v3[3] = &unk_24F6E6A98;
    v3[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v3, 0, 0.4);
  }
}

uint64_t __36__ETColorPickerView_animateOnscreen__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(_QWORD *)(a1 + 32) + 520), *(double *)(*(_QWORD *)(a1 + 32) + 528), *(double *)(*(_QWORD *)(a1 + 32) + 536), *(double *)(*(_QWORD *)(a1 + 32) + 544));
}

- (void)paletteCircleTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  if (!self->_dismissingColorPicker)
  {
    self->_dismissingColorPicker = 1;
    objc_msgSend(a3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DTSColorPicker selectedCircle](self, "selectedCircle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v4)
    {
      -[ETColorPickerView dismissAnimated:completion:](self, "dismissAnimated:completion:", 1, 0);
    }
    else
    {
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __41__ETColorPickerView_paletteCircleTapped___block_invoke;
      v7[3] = &unk_24F6E6A98;
      v7[4] = self;
      -[DTSColorPicker selectCircle:completion:](self, "selectCircle:completion:", v4, v7);
    }
    -[DTSColorPicker delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorPickerSelectedColorDidChange:", self);

  }
}

uint64_t __41__ETColorPickerView_paletteCircleTapped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissAnimated:completion:", 1, 0);
}

- (void)showColorWheel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  ETColorPickerView *v11;

  -[DTSColorPicker longPressRecognizer](self, "longPressRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  -[DTSColorPicker selectedCircle](self, "selectedCircle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTSColorPicker paletteCircles](self, "paletteCircles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __35__ETColorPickerView_showColorWheel__block_invoke;
  v8[3] = &unk_24F6E6B28;
  v9 = v5;
  v10 = v4;
  v11 = self;
  v6 = v4;
  v7 = v5;
  -[ETColorPickerView transformSelectionMarkerToPickerCircleWithCompletion:](self, "transformSelectionMarkerToPickerCircleWithCompletion:", v8);

}

uint64_t __35__ETColorPickerView_showColorWheel__block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", *(_QWORD *)(a1 + 40));
  +[ETColorStore defaultStore](ETColorStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 552), "showColorWheelFromPaletteCircle:rotation:", *(_QWORD *)(a1 + 40), v2 * (6.28318531 / (double)(unint64_t)(v5 - 1)) + -1.57079633);
  return objc_msgSend(*(id *)(a1 + 48), "fadeoutPaletterCirclesInPairs");
}

- (void)transformSelectionMarkerToPickerCircleWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ETColorPickerView *v15;

  v4 = a3;
  -[DTSColorPicker selectedCircle](self, "selectedCircle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDF6F90];
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __74__ETColorPickerView_transformSelectionMarkerToPickerCircleWithCompletion___block_invoke;
  v13[3] = &unk_24F6E6B78;
  v14 = v5;
  v15 = self;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __74__ETColorPickerView_transformSelectionMarkerToPickerCircleWithCompletion___block_invoke_2;
  v10[3] = &unk_24F6E6BA0;
  v11 = v14;
  v12 = v4;
  v8 = v4;
  v9 = v14;
  objc_msgSend(v6, "animateWithDuration:animations:completion:", v13, v10, 0.15);

}

void __74__ETColorPickerView_transformSelectionMarkerToPickerCircleWithCompletion___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  CGFloat v4;
  void *v5;
  double v6;
  double v7;
  double Width;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  CGColor *v19;
  void *v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGRect v25;
  CGRect v26;

  +[ETColorWheelView colorWheelWidth](ETColorWheelView, "colorWheelWidth");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "frame");
  v4 = v3 / CGRectGetWidth(v25);
  CGAffineTransformMakeScale(&v24, v4, v4);
  v5 = *(void **)(a1 + 32);
  v23 = v24;
  objc_msgSend(v5, "setTransform:", &v23);
  +[ETPaletteCircleView paletteCircleDiameter](ETPaletteCircleView, "paletteCircleDiameter");
  v7 = v6 + 2.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 464), "bounds");
  Width = CGRectGetWidth(v26);
  +[ETColorWheelView colorWheelWidth](ETColorWheelView, "colorWheelWidth");
  objc_msgSend(*(id *)(a1 + 40), "movePaletteCircleTowardsViewCenter:distance:", *(_QWORD *)(a1 + 32), v7 + (Width - v9) * -0.5 + 1.0);
  objc_msgSend(*(id *)(a1 + 32), "selectionMarker");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ETColorWheelView pickerDiameter](ETColorWheelView, "pickerDiameter");
  v12 = v11;
  +[ETPaletteCircleView selectionMarkerDiameter](ETPaletteCircleView, "selectionMarkerDiameter");
  v14 = v12 / v13 / v4;
  CGAffineTransformMakeScale(&v22, v14, v14);
  v21 = v22;
  objc_msgSend(v10, "setTransform:", &v21);
  objc_msgSend(*(id *)(a1 + 32), "backgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v15);

  +[ETColorWheelView pickerWidth](ETColorWheelView, "pickerWidth");
  v17 = v16 / v14;
  objc_msgSend(v10, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBorderWidth:", v17);

  v19 = +[ETColorWheelView pickerBorderColor](ETColorWheelView, "pickerBorderColor");
  objc_msgSend(v10, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBorderColor:", v19);

}

uint64_t __74__ETColorPickerView_transformSelectionMarkerToPickerCircleWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)transformPickerCircleToSelectionMarkerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  ETColorPickerView *v17;
  _OWORD v18[3];

  v4 = a3;
  -[DTSColorPicker selectedCircle](self, "selectedCircle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionMarker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v18[0] = *MEMORY[0x24BDBD8B8];
  v18[1] = v7;
  v18[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v6, "setTransform:", v18);
  +[ETPaletteCircleView selectionMarkerColor](ETPaletteCircleView, "selectionMarkerColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v8);

  objc_msgSend(v6, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBorderWidth:", 0.0);

  -[UIView addSubview:](self->_contentView, "addSubview:", v5);
  -[UIView sendSubviewToBack:](self->_contentView, "sendSubviewToBack:", v5);
  v10 = (void *)MEMORY[0x24BDF6F90];
  v14 = v4;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __74__ETColorPickerView_transformPickerCircleToSelectionMarkerWithCompletion___block_invoke;
  v15[3] = &unk_24F6E6B78;
  v16 = v5;
  v17 = self;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __74__ETColorPickerView_transformPickerCircleToSelectionMarkerWithCompletion___block_invoke_2;
  v13[3] = &unk_24F6E6A70;
  v11 = v4;
  v12 = v5;
  objc_msgSend(v10, "animateWithDuration:delay:options:animations:completion:", 0x20000, v15, v13, 0.15, 0.0);

}

uint64_t __74__ETColorPickerView_transformPickerCircleToSelectionMarkerWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v5[0] = *MEMORY[0x24BDBD8B8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  return objc_msgSend(*(id *)(a1 + 40), "movePalettCircleToOriginalLayoutPosition:", *(_QWORD *)(a1 + 32));
}

uint64_t __74__ETColorPickerView_transformPickerCircleToSelectionMarkerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fadeoutPaletterCirclesInPairs
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[ETColorPickerView paletteCircleAnimationPairs](self, "paletteCircleAnimationPairs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ETColorPickerView fadeoutPaletteCircle:delay:](self, "fadeoutPaletteCircle:delay:", v10, (double)(unint64_t)(v6 + i) * 0.0875);
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 != v10)
          -[ETColorPickerView fadeoutPaletteCircle:delay:](self, "fadeoutPaletteCircle:delay:", v11, (double)(unint64_t)(v6 + i) * 0.0875);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v6 += i;
    }
    while (v5);
  }
  -[DTSColorPicker paletteCircles](self, "paletteCircles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDF6F90];
  v15 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __50__ETColorPickerView_fadeoutPaletterCirclesInPairs__block_invoke;
  v23[3] = &unk_24F6E6A98;
  v16 = v13;
  v24 = v16;
  objc_msgSend(v14, "animateWithDuration:delay:options:animations:completion:", 0, v23, 0, 0.15, 0.0);
  v17 = (void *)MEMORY[0x24BDF6F90];
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __50__ETColorPickerView_fadeoutPaletterCirclesInPairs__block_invoke_2;
  v21[3] = &unk_24F6E6A98;
  v22 = v16;
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __50__ETColorPickerView_fadeoutPaletterCirclesInPairs__block_invoke_3;
  v19[3] = &unk_24F6E6BC8;
  v20 = v22;
  v18 = v22;
  objc_msgSend(v17, "animateWithDuration:delay:options:animations:completion:", 0, v21, v19, 0.25, 0.0);

}

uint64_t __50__ETColorPickerView_fadeoutPaletterCirclesInPairs__block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 0.7, 0.7);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __50__ETColorPickerView_fadeoutPaletterCirclesInPairs__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __50__ETColorPickerView_fadeoutPaletterCirclesInPairs__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)fadeinPaletterCirclesInPairs
{
  void *v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[ETColorPickerView paletteCircleAnimationPairs](self, "paletteCircleAnimationPairs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        --v4;
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ETColorPickerView fadeinPaletteCircle:delay:](self, "fadeinPaletteCircle:delay:", v11, (double)v4 * 0.0875);
        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 != v11)
          -[ETColorPickerView fadeinPaletteCircle:delay:](self, "fadeinPaletteCircle:delay:", v12, (double)v4 * 0.0875);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  -[DTSColorPicker paletteCircles](self, "paletteCircles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView addSubview:](self->_contentView, "addSubview:", v14);
  v15 = (void *)MEMORY[0x24BDF6F90];
  v16 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __49__ETColorPickerView_fadeinPaletterCirclesInPairs__block_invoke;
  v22[3] = &unk_24F6E6A98;
  v17 = v14;
  v23 = v17;
  objc_msgSend(v15, "animateWithDuration:delay:options:animations:completion:", 0, v22, 0, 0.25, 0.0);
  v18 = (void *)MEMORY[0x24BDF6F90];
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __49__ETColorPickerView_fadeinPaletterCirclesInPairs__block_invoke_2;
  v20[3] = &unk_24F6E6A98;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "animateWithDuration:delay:options:animations:completion:", 0, v20, 0, 0.15, 0.0);

}

uint64_t __49__ETColorPickerView_fadeinPaletterCirclesInPairs__block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v4[0] = *MEMORY[0x24BDBD8B8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __49__ETColorPickerView_fadeinPaletterCirclesInPairs__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)fadeoutPaletteCircle:(id)a3 delay:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  ETColorPickerView *v14;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDF6F90];
  v8 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__ETColorPickerView_fadeoutPaletteCircle_delay___block_invoke;
  v12[3] = &unk_24F6E6B78;
  v13 = v6;
  v14 = self;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __48__ETColorPickerView_fadeoutPaletteCircle_delay___block_invoke_2;
  v10[3] = &unk_24F6E6BC8;
  v11 = v13;
  v9 = v13;
  objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 0, v12, v10, 0.25, a4);

}

uint64_t __48__ETColorPickerView_fadeoutPaletteCircle_delay___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  CGAffineTransformMakeScale(&v5, 0.7, 0.7);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  objc_msgSend(v2, "setTransform:", &v4);
  return objc_msgSend(*(id *)(a1 + 40), "movePaletteCircleTowardsViewCenter:distance:", *(_QWORD *)(a1 + 32), 10.0);
}

uint64_t __48__ETColorPickerView_fadeoutPaletteCircle_delay___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)fadeinPaletteCircle:(id)a3 delay:(double)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  ETColorPickerView *v11;

  v6 = a3;
  -[UIView addSubview:](self->_contentView, "addSubview:", v6);
  -[UIView sendSubviewToBack:](self->_contentView, "sendSubviewToBack:", v6);
  v7 = (void *)MEMORY[0x24BDF6F90];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__ETColorPickerView_fadeinPaletteCircle_delay___block_invoke;
  v9[3] = &unk_24F6E6B78;
  v10 = v6;
  v11 = self;
  v8 = v6;
  objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 0, v9, 0, 0.25, a4);

}

uint64_t __47__ETColorPickerView_fadeinPaletteCircle_delay___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v5[0] = *MEMORY[0x24BDBD8B8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  return objc_msgSend(*(id *)(a1 + 40), "movePalettCircleToOriginalLayoutPosition:", *(_QWORD *)(a1 + 32));
}

- (void)movePaletteCircleTowardsViewCenter:(id)a3 distance:(double)a4
{
  UIView *contentView;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  CGRect v20;
  CGRect v21;

  contentView = self->_contentView;
  v19 = a3;
  -[UIView bounds](contentView, "bounds");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  MidX = CGRectGetMidX(v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MidY = CGRectGetMidY(v21);
  objc_msgSend(v19, "center");
  v13 = v12;
  v15 = v14;
  v16 = MidX - v12;
  v17 = MidY - v14;
  +[ETPaletteCircleView paletteCircleDiameter](ETPaletteCircleView, "paletteCircleDiameter");
  objc_msgSend(v19, "setCenter:", v13 + v16 / (v18 + 2.0) * a4, v15 + v17 / (v18 + 2.0) * a4);

}

- (void)movePalettCircleToOriginalLayoutPosition:(id)a3
{
  UIView *contentView;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v9;
  unint64_t v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  id v18;
  CGRect v19;
  CGRect v20;

  contentView = self->_contentView;
  v18 = a3;
  -[UIView bounds](contentView, "bounds");
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  CGRectGetMidX(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  CGRectGetMidY(v20);
  -[DTSColorPicker paletteCircles](self, "paletteCircles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfObject:", v18);

  +[ETPaletteCircleView paletteCircleDiameter](ETPaletteCircleView, "paletteCircleDiameter");
  v11 = (double)v10;
  +[ETColorStore defaultStore](ETColorStore, "defaultStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  __sincos_stret(v11 * (6.28318531 / (double)(unint64_t)(v14 - 1)) + -1.57079633);
  UIRoundToViewScale();
  v16 = v15;
  UIRoundToViewScale();
  objc_msgSend(v18, "setCenter:", v16, v17);

}

- (id)paletteCircleAnimationPairs
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  -[DTSColorPicker paletteCircles](self, "paletteCircles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTSColorPicker selectedCircle](self, "selectedCircle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "indexOfObject:", v4);

  +[ETColorStore defaultStore](ETColorStore, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = v8 - 2;
  if (v8 != 2)
  {
    v11 = v8 - 1;
    v12 = 1;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", (v5 + v10) % v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v13;
      objc_msgSend(v3, "objectAtIndexedSubscript:", (v5 + v12) % v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v15);

      ++v12;
      --v10;
    }
    while (v12 <= v10);
  }

  return v9;
}

- (void)colorWheel:(id)a3 willPickColor:(id)a4
{
  id v5;
  void *v6;

  if (a4)
  {
    v5 = a4;
    -[DTSColorPicker selectedCircle](self, "selectedCircle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

  }
  -[ETColorPickerView fadeinPaletterCirclesInPairs](self, "fadeinPaletterCirclesInPairs", a3);
}

- (void)colorWheel:(id)a3 didPickColor:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__ETColorPickerView_colorWheel_didPickColor___block_invoke;
  v7[3] = &unk_24F6E6B78;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[ETColorPickerView transformPickerCircleToSelectionMarkerWithCompletion:](self, "transformPickerCircleToSelectionMarkerWithCompletion:", v7);

}

void __45__ETColorPickerView_colorWheel_didPickColor___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "longPressRecognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", 1);

  if (*(_QWORD *)(a1 + 40))
  {
    +[ETColorStore defaultStore](ETColorStore, "defaultStore");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "paletteCircles");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "selectedCircle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "saveColor:forIndex:", v3, objc_msgSend(v4, "indexOfObject:", v5));

  }
}

- (ETColorPickerViewDelegate)presentationDelegate
{
  return (ETColorPickerViewDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_colorWheelView, 0);
  objc_storeStrong((id *)&self->_presentTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_collapsedSelectedCircle, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
