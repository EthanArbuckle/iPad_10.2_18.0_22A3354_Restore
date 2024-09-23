@implementation MPUStackView

- (MPUStackView)initWithFrame:(CGRect)a3
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("MPUStackViewInitializationException"), CFSTR("Do not use -initWithFrame:. Please use -initWithFrame:itemClass:itemReuseIdentifier: instead."), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  return 0;
}

- (MPUStackView)initWithFrame:(CGRect)a3 itemClass:(Class)a4 itemReuseIdentifier:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  MPUStackView *v12;
  MPUStackView *v13;
  uint64_t v14;
  NSString *itemReuseIdentifier;
  void *v16;
  double v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MPUStackView;
  v12 = -[MPUStackView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_itemClass, a4);
    v14 = objc_msgSend(v11, "copy");
    itemReuseIdentifier = v13->_itemReuseIdentifier;
    v13->_itemReuseIdentifier = (NSString *)v14;

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scale");
    v13->_configuration.scale = v17;

    +[_MPUStackItemReuseCache registerStackViewForReuseIdentifier:](_MPUStackItemReuseCache, "registerStackViewForReuseIdentifier:", v13->_itemReuseIdentifier);
    -[MPUStackView setClipsToBounds:](v13, "setClipsToBounds:", 0);
  }

  return v13;
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  +[_MPUStackItemReuseCache unregisterStackViewForReuseIdentifier:](_MPUStackItemReuseCache, "unregisterStackViewForReuseIdentifier:", self->_itemReuseIdentifier);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_items;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        +[_MPUStackItemReuseCache enqueueReusableStackItem:forReuseIdentifier:](_MPUStackItemReuseCache, "enqueueReusableStackItem:forReuseIdentifier:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), self->_itemReuseIdentifier);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)MPUStackView;
  -[MPUStackView dealloc](&v8, sel_dealloc);
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPUStackView;
  -[MPUStackView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[MPUStackView updateForChangedDistanceFromVanishingPoint](self, "updateForChangedDistanceFromVanishingPoint");
}

- (void)didMoveToWindow
{
  UIWindow *v3;
  UIWindow *window;
  void *v5;
  double v6;
  void *v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MPUStackView;
  -[MPUStackView didMoveToWindow](&v9, sel_didMoveToWindow);
  -[MPUStackView window](self, "window");
  v3 = (UIWindow *)objc_claimAutoreleasedReturnValue();
  window = self->_window;
  self->_window = v3;

  -[UIWindow screen](self->_window, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  self->_configuration.scale = v6;

  if (self->_configuration.scale < 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    self->_configuration.scale = v8;

  }
  -[MPUStackView updateForChangedDistanceFromVanishingPoint](self, "updateForChangedDistanceFromVanishingPoint");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPUStackView;
  -[MPUStackView layoutSubviews](&v3, sel_layoutSubviews);
  -[MPUStackView updateForChangedDistanceFromVanishingPoint](self, "updateForChangedDistanceFromVanishingPoint");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPUStackView;
  -[MPUStackView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[MPUStackView _updateGeometryFieldsInConfiguration](self, "_updateGeometryFieldsInConfiguration");
}

- (void)setCenter:(CGPoint)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPUStackView;
  -[MPUStackView setCenter:](&v4, sel_setCenter_, a3.x, a3.y);
  -[MPUStackView _updateGeometryFieldsInConfiguration](self, "_updateGeometryFieldsInConfiguration");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPUStackView;
  -[MPUStackView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[MPUStackView _updateGeometryFieldsInConfiguration](self, "_updateGeometryFieldsInConfiguration");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double height;
  CGSize result;

  width = self->_configuration.baseSize.width;
  height = self->_configuration.baseSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)baseSize
{
  double width;
  double height;
  CGSize result;

  width = self->_configuration.baseSize.width;
  height = self->_configuration.baseSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setBaseSize:(CGSize)a3
{
  if (self->_configuration.baseSize.width != a3.width || self->_configuration.baseSize.height != a3.height)
  {
    self->_configuration.baseSize = a3;
    -[MPUStackView updateForChangedDistanceFromVanishingPoint](self, "updateForChangedDistanceFromVanishingPoint");
  }
}

- (BOOL)forcesIntegralX
{
  return self->_configuration.forcesIntegralX;
}

- (BOOL)forcesIntegralY
{
  return self->_configuration.forcesIntegralY;
}

- (UIOffset)maximumRelativeOffsetStep
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_configuration.maximumRelativeOffsetStep.horizontal;
  vertical = self->_configuration.maximumRelativeOffsetStep.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[MPUStackView reloadData](self, "reloadData");
    v5 = obj;
  }

}

- (void)setForcesIntegralX:(BOOL)a3
{
  if (self->_configuration.forcesIntegralX != a3)
  {
    self->_configuration.forcesIntegralX = a3;
    -[MPUStackView updateForChangedDistanceFromVanishingPoint](self, "updateForChangedDistanceFromVanishingPoint");
  }
}

- (void)setForcesIntegralY:(BOOL)a3
{
  if (self->_configuration.forcesIntegralY != a3)
  {
    self->_configuration.forcesIntegralY = a3;
    -[MPUStackView updateForChangedDistanceFromVanishingPoint](self, "updateForChangedDistanceFromVanishingPoint");
  }
}

- (void)setMaximumRelativeOffsetStep:(UIOffset)a3
{
  if (self->_configuration.maximumRelativeOffsetStep.horizontal != a3.horizontal
    || self->_configuration.maximumRelativeOffsetStep.vertical != a3.vertical)
  {
    self->_configuration.maximumRelativeOffsetStep = a3;
    -[MPUStackView updateForChangedDistanceFromVanishingPoint](self, "updateForChangedDistanceFromVanishingPoint");
  }
}

- (void)setPerspectiveTargetView:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_perspectiveTargetView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_perspectiveTargetView, obj);
    -[MPUStackView updateForChangedDistanceFromVanishingPoint](self, "updateForChangedDistanceFromVanishingPoint");
    v5 = obj;
  }

}

- (void)setSizeInsetStep:(CGSize)a3
{
  if (self->_configuration.sizeInsetStep.width != a3.width || self->_configuration.sizeInsetStep.height != a3.height)
  {
    self->_configuration.sizeInsetStep = a3;
    -[MPUStackView updateForChangedDistanceFromVanishingPoint](self, "updateForChangedDistanceFromVanishingPoint");
  }
}

- (void)setVanishingPoint:(CGPoint)a3
{
  if (self->_configuration.vanishingPoint.x != a3.x || self->_configuration.vanishingPoint.y != a3.y)
  {
    self->_configuration.vanishingPoint = a3;
    -[MPUStackView updateForChangedDistanceFromVanishingPoint](self, "updateForChangedDistanceFromVanishingPoint");
  }
}

- (CGSize)sizeInsetStep
{
  double width;
  double height;
  CGSize result;

  width = self->_configuration.sizeInsetStep.width;
  height = self->_configuration.sizeInsetStep.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGPoint)vanishingPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_configuration.vanishingPoint.x;
  y = self->_configuration.vanishingPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)beginIgnoringDistanceUpdates
{
  ++self->_distanceIgnoreCount;
}

- (void)endIgnoringDistanceUpdates
{
  int64_t distanceIgnoreCount;
  BOOL v3;
  BOOL v4;
  int64_t v5;

  distanceIgnoreCount = self->_distanceIgnoreCount;
  v3 = distanceIgnoreCount == 1;
  v4 = distanceIgnoreCount < 1;
  v5 = distanceIgnoreCount - 1;
  if (!v4)
  {
    self->_distanceIgnoreCount = v5;
    if (v3)
      -[MPUStackView updateForChangedDistanceFromVanishingPoint](self, "updateForChangedDistanceFromVanishingPoint");
  }
}

- (id)itemAtIndex:(int64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", a3);
}

- (UIOffset)relativeOffsetOfItemAtIndex:(double)a3 withCenter:(CGPoint)a4
{
  UIWindow *WeakRetained;
  UIWindow *v7;
  $398D59BE4CDF90A277A98ED890AD3767 *p_configuration;
  UIWindow *v9;
  float64x2_t vanishingPoint;
  float64_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  double v16;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  int64x2_t v28;
  int8x16_t v29;
  double v30;
  float64_t v32;
  CGFloat y;
  float64x2_t v34;
  UIOffset result;

  y = a4.y;
  WeakRetained = (UIWindow *)objc_loadWeakRetained((id *)&self->_perspectiveTargetView);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    p_configuration = &self->_configuration;
LABEL_5:
    -[UIWindow bounds](v7, "bounds", a4);
    vanishingPoint = (float64x2_t)p_configuration->vanishingPoint;
    v12.f64[1] = v11;
    v13 = vsubq_f64(v12, vanishingPoint);
    v14.f64[0] = v32;
    v14.f64[1] = y;
    v34 = vdivq_f64(vsubq_f64(vanishingPoint, v14), (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(vanishingPoint, v13), (int8x16_t)vanishingPoint, (int8x16_t)v13));

    v15 = v34;
    goto LABEL_6;
  }
  v9 = self->_window;
  p_configuration = &self->_configuration;
  if (v9)
  {
    v7 = v9;
    goto LABEL_5;
  }
  v15 = *(float64x2_t *)MEMORY[0x24BDBF148];
LABEL_6:
  v16 = -a3;
  if (a3 >= 0.0)
    v16 = a3;
  __asm { FMOV            V1.2D, #0.5 }
  v22 = vmulq_n_f64(vaddq_f64((float64x2_t)p_configuration->sizeInsetStep, (float64x2_t)p_configuration->sizeInsetStep), v16);
  v23 = vmulq_n_f64((float64x2_t)p_configuration->maximumRelativeOffsetStep, v16);
  v24 = vmulq_f64(v22, _Q1);
  v25 = vsubq_f64(vnegq_f64(v23), v24);
  v26 = vaddq_f64(v23, v24);
  v27 = vmlaq_f64(v25, vaddq_f64(vmulq_f64(v15, _Q1), _Q1), vaddq_f64((float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v25), (int8x16_t)vnegq_f64(v25), (int8x16_t)v25), (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v26), (int8x16_t)vnegq_f64(v26), (int8x16_t)v26)));
  *(int32x2_t *)&_Q1.f64[0] = vdup_n_s32(a3 < 0.0);
  v28.i64[0] = LODWORD(_Q1.f64[0]);
  v28.i64[1] = HIDWORD(_Q1.f64[0]);
  v29 = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v28, 0x3FuLL)), (int8x16_t)vnegq_f64(v27), (int8x16_t)v27);
  v30 = *(double *)&v29.i64[1];
  result.horizontal = *(double *)v29.i64;
  result.vertical = v30;
  return result;
}

- (void)reloadData
{
  -[MPUStackView reloadDataWithTransition:](self, "reloadDataWithTransition:", 0);
}

- (void)reloadDataWithTransition:(int64_t)a3
{
  int64_t numberOfItems;
  id WeakRetained;
  int64_t v7;
  BOOL v8;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  MPUStackView *v17;
  uint64_t v18;
  NSMutableArray *items;
  NSMutableArray *v20;
  NSMutableArray *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  MPUStackView *v26;
  uint64_t v27;
  void *v28;
  UIWindow *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double x;
  double y;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD *v51;
  _QWORD v52[5];
  id v53;
  uint64_t *v54;
  double v55;
  double v56;
  _QWORD v57[4];
  id v58;
  MPUStackView *v59;
  id v60;
  _QWORD *v61;
  _QWORD v62[7];
  _QWORD v63[3];
  char v64;
  _QWORD v65[3];
  char v66;
  _QWORD v67[5];
  id v68;
  uint64_t *v69;
  uint64_t *v70;
  double v71;
  double v72;
  _QWORD v73[5];
  id v74;
  uint64_t *v75;
  uint64_t *v76;
  _QWORD v77[5];
  id v78;
  uint64_t *v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;

  numberOfItems = self->_numberOfItems;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v7 = objc_msgSend(WeakRetained, "numberOfItemsInStackView:", self);
  self->_numberOfItems = v7;
  if (numberOfItems)
    v8 = a3 == 0;
  else
    v8 = 1;
  if (!v8 && v7 == numberOfItems)
  {
    if (a3 == 1)
    {
      -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectAtIndex:](self->_items, "removeObjectAtIndex:", 0);
      v85 = 0;
      v86 = &v85;
      v87 = 0x3032000000;
      v88 = __Block_byref_object_copy_;
      v89 = __Block_byref_object_dispose_;
      -[MPUStackView _dequeueReusableItem](self, "_dequeueReusableItem");
      v90 = (id)objc_claimAutoreleasedReturnValue();
      v81 = 0;
      v82 = &v81;
      v83 = 0x2020000000;
      v84 = 0;
      v23 = (void *)v86[5];
      v24 = MEMORY[0x24BDAC760];
      if (!v23)
      {
        v25 = (void *)MEMORY[0x24BDF6F90];
        v73[0] = MEMORY[0x24BDAC760];
        v73[1] = 3221225472;
        v73[2] = __41__MPUStackView_reloadDataWithTransition___block_invoke_2;
        v73[3] = &unk_24DD6E020;
        v75 = &v85;
        v73[4] = self;
        v74 = WeakRetained;
        v76 = &v81;
        objc_msgSend(v25, "performWithoutAnimation:", v73);

        v23 = (void *)v86[5];
      }
      objc_msgSend(v23, "superview");
      v26 = (MPUStackView *)objc_claimAutoreleasedReturnValue();

      v27 = v86[5];
      if (v26 == self)
        -[MPUStackView sendSubviewToBack:](self, "sendSubviewToBack:", v27);
      else
        -[MPUStackView insertSubview:atIndex:](self, "insertSubview:atIndex:", v27, 0);
      -[NSMutableArray addObject:](self->_items, "addObject:", v86[5]);
      v29 = (UIWindow *)objc_loadWeakRetained((id *)&self->_perspectiveTargetView);
      if (!v29)
        v29 = self->_window;
      -[MPUStackView convertPoint:toView:](self, "convertPoint:toView:", v29, self->_configuration.centerInLocalCoordinates.x, self->_configuration.centerInLocalCoordinates.y);
      if (v29)
      {
        v32 = v30;
        v33 = v31;
        -[UIWindow bounds](v29, "bounds");
        x = self->_configuration.vanishingPoint.x;
        y = self->_configuration.vanishingPoint.y;
        v38 = v37 - x;
        if (x > v38)
          v38 = self->_configuration.vanishingPoint.x;
        v39 = v34 - y;
        if (y > v39)
          v39 = self->_configuration.vanishingPoint.y;
        v40 = (x - v32) / v38;
        v41 = (y - v33) / v39;
      }
      else
      {
        v40 = *MEMORY[0x24BDBF148];
        v41 = *(double *)(MEMORY[0x24BDBF148] + 8);
      }
      v42 = (void *)MEMORY[0x24BDF6F90];
      v67[0] = v24;
      v67[1] = 3221225472;
      v67[2] = __41__MPUStackView_reloadDataWithTransition___block_invoke_3;
      v67[3] = &unk_24DD6E048;
      v67[4] = self;
      v69 = &v85;
      v71 = v40;
      v72 = v41;
      v70 = &v81;
      v43 = WeakRetained;
      v68 = v43;
      objc_msgSend(v42, "performWithoutAnimation:", v67);
      v65[0] = 0;
      v65[1] = v65;
      v65[2] = 0x2020000000;
      v66 = 0;
      v63[0] = 0;
      v63[1] = v63;
      v63[2] = 0x2020000000;
      v64 = 0;
      v62[0] = v24;
      v62[1] = 3221225472;
      v62[2] = __41__MPUStackView_reloadDataWithTransition___block_invoke_4;
      v62[3] = &unk_24DD6E070;
      v62[5] = v65;
      v62[6] = v63;
      v62[4] = self;
      v44 = (void *)MEMORY[0x22074DFE0](v62);
      v57[0] = v24;
      v57[1] = 3221225472;
      v57[2] = __41__MPUStackView_reloadDataWithTransition___block_invoke_5;
      v57[3] = &unk_24DD6E098;
      v45 = v22;
      v58 = v45;
      v59 = self;
      v61 = v65;
      v46 = v44;
      v60 = v46;
      +[MPUFallAnimator animateFallForView:withCompletionHandler:](MPUFallAnimator, "animateFallForView:withCompletionHandler:", v45, v57);
      v47 = (void *)MEMORY[0x24BDF6F90];
      v52[0] = v24;
      v52[1] = 3221225472;
      v52[2] = __41__MPUStackView_reloadDataWithTransition___block_invoke_6;
      v52[3] = &unk_24DD6E0C0;
      v52[4] = self;
      v55 = v40;
      v56 = v41;
      v53 = v43;
      v54 = &v85;
      v49[0] = v24;
      v49[1] = 3221225472;
      v49[2] = __41__MPUStackView_reloadDataWithTransition___block_invoke_7;
      v49[3] = &unk_24DD6E0E8;
      v51 = v63;
      v48 = v46;
      v50 = v48;
      objc_msgSend(v47, "animateWithDuration:delay:options:animations:completion:", 1, v52, v49, 0.3, 0.05);

      _Block_object_dispose(v63, 8);
      _Block_object_dispose(v65, 8);

      _Block_object_dispose(&v81, 8);
      _Block_object_dispose(&v85, 8);

    }
  }
  else
  {
    if (v7 <= 0)
    {
      v10 = 0;
    }
    else
    {
      v10 = 0;
      do
      {
        v85 = 0;
        v86 = &v85;
        v87 = 0x3032000000;
        v88 = __Block_byref_object_copy_;
        v89 = __Block_byref_object_dispose_;
        v11 = -[NSMutableArray count](self->_items, "count");
        v12 = 0;
        if (v10 < v11)
        {
          -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v90 = v12;
        v81 = 0;
        v82 = &v81;
        v83 = 0x2020000000;
        v84 = 0;
        v13 = v86;
        if (!v86[5])
        {
          -[MPUStackView _dequeueReusableItem](self, "_dequeueReusableItem");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v86[5];
          v86[5] = v14;

          v13 = v86;
          if (!v86[5])
          {
            v16 = (void *)MEMORY[0x24BDF6F90];
            v77[0] = MEMORY[0x24BDAC760];
            v77[1] = 3221225472;
            v77[2] = __41__MPUStackView_reloadDataWithTransition___block_invoke;
            v77[3] = &unk_24DD6E020;
            v79 = &v85;
            v77[4] = self;
            v78 = WeakRetained;
            v80 = &v81;
            objc_msgSend(v16, "performWithoutAnimation:", v77);

            v13 = v86;
          }
        }
        if (!*((_BYTE *)v82 + 24))
        {
          objc_msgSend((id)v13[5], "willBeginItemViewConfiguration");
          v13 = v86;
        }
        objc_msgSend(WeakRetained, "stackView:applyAttributesToItem:atIndex:", self, v13[5], v10);
        objc_msgSend((id)v86[5], "didCompleteItemViewConfiguration");
        objc_msgSend((id)v86[5], "superview");
        v17 = (MPUStackView *)objc_claimAutoreleasedReturnValue();

        v18 = v86[5];
        if (v17 == self)
          -[MPUStackView sendSubviewToBack:](self, "sendSubviewToBack:", v18);
        else
          -[MPUStackView insertSubview:atIndex:](self, "insertSubview:atIndex:", v18, 0);
        items = self->_items;
        if (!items)
        {
          v20 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", self->_numberOfItems);
          v21 = self->_items;
          self->_items = v20;

          items = self->_items;
        }
        if ((-[NSMutableArray containsObject:](items, "containsObject:", v86[5]) & 1) == 0)
          -[NSMutableArray addObject:](self->_items, "addObject:", v86[5]);
        _Block_object_dispose(&v81, 8);
        _Block_object_dispose(&v85, 8);

        ++v10;
      }
      while ((int64_t)v10 < self->_numberOfItems);
    }
    while (v10 < -[NSMutableArray count](self->_items, "count"))
    {
      -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", v10);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectIdenticalTo:](self->_items, "removeObjectIdenticalTo:", v28);
      objc_msgSend(v28, "removeFromSuperview");
      +[_MPUStackItemReuseCache enqueueReusableStackItem:forReuseIdentifier:](_MPUStackItemReuseCache, "enqueueReusableStackItem:forReuseIdentifier:", v28, self->_itemReuseIdentifier);

    }
    -[MPUStackView updateForChangedDistanceFromVanishingPoint](self, "updateForChangedDistanceFromVanishingPoint");
  }

}

uint64_t __41__MPUStackView_reloadDataWithTransition___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  v2 = objc_msgSend(objc_alloc(*(Class *)(*(_QWORD *)(a1 + 32) + 576)), "initWithFrame:", 0.0, 0.0, *(double *)(*(_QWORD *)(a1 + 32) + 416), *(double *)(*(_QWORD *)(a1 + 32) + 424));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "willBeginItemViewConfiguration");
  result = objc_msgSend(*(id *)(a1 + 40), "stackView:didCreateItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return result;
}

uint64_t __41__MPUStackView_reloadDataWithTransition___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  v2 = objc_msgSend(objc_alloc(*(Class *)(*(_QWORD *)(a1 + 32) + 576)), "initWithFrame:", 0.0, 0.0, *(double *)(*(_QWORD *)(a1 + 32) + 416), *(double *)(*(_QWORD *)(a1 + 32) + 424));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "willBeginItemViewConfiguration");
  result = objc_msgSend(*(id *)(a1 + 40), "stackView:didCreateItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return result;
}

uint64_t __41__MPUStackView_reloadDataWithTransition___block_invoke_3(uint64_t a1, float64x2_t a2)
{
  a2.f64[0] = *(float64_t *)(a1 + 64);
  _MPUStackViewApplyLayoutToItem(*(_QWORD *)(a1 + 32) + 416, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 592) - 1, a2, *(float64_t *)(a1 + 72));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "willBeginItemViewConfiguration");
  objc_msgSend(*(id *)(a1 + 40), "stackView:applyAttributesToItem:atIndex:");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "didCompleteItemViewConfiguration");
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAlpha:", 0.0);
}

uint64_t __41__MPUStackView_reloadDataWithTransition___block_invoke_4(uint64_t result)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
      return objc_msgSend(*(id *)(result + 32), "updateForChangedDistanceFromVanishingPoint");
  }
  return result;
}

uint64_t __41__MPUStackView_reloadDataWithTransition___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  +[_MPUStackItemReuseCache enqueueReusableStackItem:forReuseIdentifier:](_MPUStackItemReuseCache, "enqueueReusableStackItem:forReuseIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 584));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __41__MPUStackView_reloadDataWithTransition___block_invoke_6(uint64_t a1)
{
  id v2;
  uint64_t v3;
  float64x2_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 552);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v5 = v3;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v4.f64[0] = *(float64_t *)(a1 + 56);
        _MPUStackViewApplyLayoutToItem(*(_QWORD *)(a1 + 32) + 416, v9, v6 + i, v4, *(float64_t *)(a1 + 64));
        objc_msgSend(v9, "willBeginItemViewConfiguration", (_QWORD)v11);
        objc_msgSend(*(id *)(a1 + 40), "stackView:applyAttributesToItem:atIndex:", *(_QWORD *)(a1 + 32), v9, v6 + i);
        objc_msgSend(v9, "didCompleteItemViewConfiguration");
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v6 += i;
    }
    while (v5);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAlpha:", 1.0);
}

uint64_t __41__MPUStackView_reloadDataWithTransition___block_invoke_7(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CGSize)sizeOfItemAtIndex:(double)a3
{
  float64x2_t v3;
  double v4;
  CGSize result;

  v3 = vsubq_f64((float64x2_t)self->_configuration.baseSize, vmulq_n_f64(vaddq_f64((float64x2_t)self->_configuration.sizeInsetStep, (float64x2_t)self->_configuration.sizeInsetStep), a3));
  v4 = v3.f64[1];
  result.width = v3.f64[0];
  result.height = v4;
  return result;
}

- (void)updateForChangedDistanceFromVanishingPoint
{
  char v3;
  UIWindow *WeakRetained;
  $398D59BE4CDF90A277A98ED890AD3767 *p_configuration;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double x;
  double y;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSMutableArray *v18;
  uint64_t v19;
  float64x2_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (self->_distanceIgnoreCount <= 0)
  {
    v3 = objc_msgSend(MEMORY[0x24BDF6F90], "_isInAnimationBlock");
    if ((v3 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    }
    WeakRetained = (UIWindow *)objc_loadWeakRetained((id *)&self->_perspectiveTargetView);
    if (!WeakRetained)
      WeakRetained = self->_window;
    p_configuration = &self->_configuration;
    -[MPUStackView convertPoint:toView:](self, "convertPoint:toView:", WeakRetained, self->_configuration.centerInLocalCoordinates.x, self->_configuration.centerInLocalCoordinates.y);
    if (WeakRetained)
    {
      v8 = v6;
      v9 = v7;
      -[UIWindow bounds](WeakRetained, "bounds");
      x = self->_configuration.vanishingPoint.x;
      y = self->_configuration.vanishingPoint.y;
      v14 = v13 - x;
      if (x > v14)
        v14 = self->_configuration.vanishingPoint.x;
      v15 = v10 - y;
      if (y > v15)
        v15 = self->_configuration.vanishingPoint.y;
      v16 = (x - v8) / v14;
      v17 = (y - v9) / v15;
    }
    else
    {
      v16 = *MEMORY[0x24BDBF148];
      v17 = *(double *)(MEMORY[0x24BDBF148] + 8);
    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v18 = self->_items;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v19)
    {
      v21 = v19;
      v22 = 0;
      v23 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v26 != v23)
            objc_enumerationMutation(v18);
          v20.f64[0] = v16;
          _MPUStackViewApplyLayoutToItem((uint64_t)p_configuration, *(void **)(*((_QWORD *)&v25 + 1) + 8 * i), v22 + i, v20, v17);
        }
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        v22 += i;
      }
      while (v21);
    }

    if ((v3 & 1) == 0)
      objc_msgSend(MEMORY[0x24BDE57D8], "commit", (_QWORD)v25);

  }
}

- (id)_dequeueReusableItem
{
  return +[_MPUStackItemReuseCache dequeueReusableStackItemWithIdentifier:](_MPUStackItemReuseCache, "dequeueReusableStackItemWithIdentifier:", self->_itemReuseIdentifier);
}

- (void)_updateGeometryFieldsInConfiguration
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[MPUStackView bounds](self, "bounds");
  self->_configuration.bounds.origin.x = v3;
  self->_configuration.bounds.origin.y = v4;
  self->_configuration.bounds.size.width = v5;
  self->_configuration.bounds.size.height = v6;
  self->_configuration.centerInLocalCoordinates.x = v3 + v5 * 0.5;
  self->_configuration.centerInLocalCoordinates.y = v4 + v6 * 0.5;
}

- (MPUStackViewDataSource)dataSource
{
  return (MPUStackViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (Class)itemClass
{
  return self->_itemClass;
}

- (NSString)itemReuseIdentifier
{
  return self->_itemReuseIdentifier;
}

- (NSArray)items
{
  return &self->_items->super;
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (UIView)perspectiveTargetView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_perspectiveTargetView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_perspectiveTargetView);
  objc_storeStrong((id *)&self->_itemReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_itemClass, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
