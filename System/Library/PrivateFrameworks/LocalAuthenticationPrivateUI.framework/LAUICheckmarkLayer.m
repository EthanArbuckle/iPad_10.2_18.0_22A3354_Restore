@implementation LAUICheckmarkLayer

- (LAUICheckmarkLayer)init
{
  LAUICheckmarkLayer *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CAShapeLayer *v11;
  _anonymous_namespace_ *v12;
  void *v13;
  LAUICheckmarkLayer *v14;
  LAUICheckmarkLayer *v15;
  id *p_shape_layer;
  LAUICheckmarkLayer *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  double v22;
  CATransform3D v24;
  CATransform3D a;
  objc_super v26;
  _QWORD v27[12];
  _QWORD v28[13];

  v2 = self;
  v28[12] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x20BD1B564](self, a2);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDE5718];
  objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("checkmark"), CFSTR("caml"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "packageWithContentsOfURL:type:options:error:", v6, *MEMORY[0x24BDE5D58], 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "rootLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("position");
  v27[1] = CFSTR("bounds");
  v28[0] = v9;
  v28[1] = v9;
  v27[2] = CFSTR("transform");
  v27[3] = CFSTR("backgroundColor");
  v28[2] = v9;
  v28[3] = v9;
  v27[4] = CFSTR("cornerRadius");
  v27[5] = CFSTR("contents");
  v28[4] = v9;
  v28[5] = v9;
  v27[6] = CFSTR("anchorPoint");
  v27[7] = CFSTR("opacity");
  v28[6] = v9;
  v28[7] = v9;
  v27[8] = CFSTR("strokeStart");
  v27[9] = CFSTR("strokeEnd");
  v28[8] = v9;
  v28[9] = v9;
  v27[10] = CFSTR("strokeColor");
  v27[11] = CFSTR("fillColor");
  v28[10] = v9;
  v28[11] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setActions:", v10);
  objc_msgSend(v8, "setAnchorPoint:", 0.5, 0.5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = (_anonymous_namespace_ *)v8;
  else
    v12 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  if (v13)
  {
    v26.receiver = v2;
    v26.super_class = (Class)LAUICheckmarkLayer;
    v14 = -[LAUICheckmarkLayer init](&v26, sel_init);
    v15 = v14;
    if (v14)
    {
      p_shape_layer = (id *)&v14->_shape_layer;
      objc_storeStrong((id *)&v14->_shape_layer, v13);
      if (*p_shape_layer)
        objc_msgSend(*p_shape_layer, "transform");
      else
        memset(&a, 0, sizeof(a));
      v18 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
      *(_OWORD *)&v24.m31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
      *(_OWORD *)&v24.m33 = v18;
      v19 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
      *(_OWORD *)&v24.m41 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
      *(_OWORD *)&v24.m43 = v19;
      v20 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
      *(_OWORD *)&v24.m11 = *MEMORY[0x24BDE5598];
      *(_OWORD *)&v24.m13 = v20;
      v21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
      *(_OWORD *)&v24.m21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
      *(_OWORD *)&v24.m23 = v21;
      if (!CATransform3DEqualToTransform(&a, &v24))
        __assert_rtn("-[LAUICheckmarkLayer init]", "LAUICheckmarkLayer.mm", 119, "CATransform3DEqualToTransform([_shape_layer transform], CATransform3DIdentity)");
      objc_msgSend(*p_shape_layer, "bounds");
      v15->_line_width = v22 * 0.144021524;
      v15->_effective_line_width = v22 * 0.144021524;
      v15->_line_width_scale = 1.0;
      objc_msgSend(*p_shape_layer, "setLineWidth:", v15->_line_width);
      if (*p_shape_layer)
      {
        -[LAUICheckmarkLayer addSublayer:](v15, "addSublayer:");
        -[LAUICheckmarkLayer _updateRevealedAnimated:](v15, "_updateRevealedAnimated:", 0);
      }
    }
    v2 = v15;
    v17 = v2;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  LAUI_CA_utilities::animation_completion_handler_container::execute((LAUI_CA_utilities::animation_completion_handler_container **)&self->_completions, 0);
  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)LAUICheckmarkLayer;
  -[LAUICheckmarkLayer dealloc](&v3, sel_dealloc);
}

- (void)layoutSublayers
{
  double v3;
  double v4;
  double v5;
  double v6;
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
  CGFloat v17;
  __int128 v18;
  CAShapeLayer *shape_layer;
  CAShapeLayer *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CAShapeLayer *v30;
  CGFloat v31;
  double MidX;
  double v33;
  double v34;
  double v35;
  CATransform3D v36;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v39;
  CATransform3D v40;
  objc_super v41;
  CGRect v42;
  CGRect v43;

  v41.receiver = self;
  v41.super_class = (Class)LAUICheckmarkLayer;
  -[LAUICheckmarkLayer layoutSublayers](&v41, sel_layoutSublayers);
  -[CAShapeLayer bounds](self->_shape_layer, "bounds");
  v4 = v3;
  v5 = self->_effective_line_width * 0.5;
  v6 = v5 + v3 + v5;
  v35 = v7;
  v8 = v5 + v7 + v5;
  -[LAUICheckmarkLayer bounds](self, "bounds");
  v33 = v10;
  v34 = v11;
  v13 = v12;
  v14 = v9;
  v15 = v12 / v6;
  v16 = 1.0;
  if (v6 == 0.0)
    v15 = 1.0;
  if (v8 != 0.0)
    v16 = v9 / v8;
  if (v16 >= v15)
    v17 = v15;
  else
    v17 = v16;
  v18 = 0uLL;
  memset(&v40, 0, sizeof(v40));
  shape_layer = self->_shape_layer;
  if (shape_layer)
  {
    -[CAShapeLayer transform](shape_layer, "transform");
    v18 = 0uLL;
  }
  *(_OWORD *)&v39.m41 = v18;
  *(_OWORD *)&v39.m43 = v18;
  *(_OWORD *)&v39.m31 = v18;
  *(_OWORD *)&v39.m33 = v18;
  *(_OWORD *)&v39.m21 = v18;
  *(_OWORD *)&v39.m23 = v18;
  *(_OWORD *)&v39.m11 = v18;
  *(_OWORD *)&v39.m13 = v18;
  CATransform3DMakeScale(&v39, v17, v17, 1.0);
  a = v40;
  b = v39;
  if (!CATransform3DEqualToTransform(&a, &b))
  {
    v20 = self->_shape_layer;
    v36 = v39;
    -[CAShapeLayer setTransform:](v20, "setTransform:", &v36);
  }
  v21 = v6 * v17;
  v22 = v8 * v17;
  -[LAUICheckmarkLayer contentsScale](self, "contentsScale");
  v24 = v33 + (v13 - v21) * 0.5;
  if (v23 == 0.0)
  {
    v25 = round(v24);
    v26 = round(v34 + (v14 - v22) * 0.5);
  }
  else
  {
    v25 = round(v24 * v23) / v23;
    v26 = round((v34 + (v14 - v22) * 0.5) * v23) / v23;
  }
  v27 = v25 + v17 * v5;
  v28 = v26 + v17 * v5;
  v29 = v4 * v17;
  v30 = self->_shape_layer;
  v31 = v35 * v17;
  v42.origin.x = v27;
  v42.origin.y = v28;
  v42.size.width = v29;
  v42.size.height = v35 * v17;
  MidX = CGRectGetMidX(v42);
  v43.origin.x = v27;
  v43.origin.y = v28;
  v43.size.width = v29;
  v43.size.height = v31;
  -[CAShapeLayer setPosition:](v30, "setPosition:", MidX, CGRectGetMidY(v43));
}

- (void)setLineWidthScale:(double)a3
{
  if (self->_line_width_scale != a3)
  {
    self->_line_width_scale = a3;
    if (a3 < 0.0)
      a3 = 0.0;
    self->_effective_line_width = a3 * self->_line_width;
    -[CAShapeLayer setLineWidth:](self->_shape_layer, "setLineWidth:");
    -[LAUICheckmarkLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPrimaryColor:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UIColor *v6;
  UIColor *primary_color;
  UIColor *v8;
  UIColor *v9;
  UIColor *v10;

  v4 = a4;
  v6 = (UIColor *)a3;
  primary_color = self->_primary_color;
  v10 = v6;
  if (primary_color != v6 && (!v6 || !primary_color || (-[UIColor isEqual:](primary_color, "isEqual:", v6) & 1) == 0))
  {
    v8 = (UIColor *)-[UIColor copy](v10, "copy");
    v9 = self->_primary_color;
    self->_primary_color = v8;

    -[LAUICheckmarkLayer setColor:animated:](self, "setColor:animated:", -[UIColor CGColor](self->_primary_color, "CGColor"), v4);
  }

}

- (void)setColor:(CGColor *)a3 animated:(BOOL)a4
{
  CGColor *color;
  _BOOL4 v6;
  CGColor *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CAMediaTimingFunction *v14;
  CAShapeLayer *v15;
  CAShapeLayer *shape_layer;
  CAShapeLayer *v17;
  uint64_t v18;
  void *animation;
  _BYTE v20[32];
  id v21;

  color = self->_color;
  if (color != a3)
  {
    v6 = a4;
    if (a3 && color)
    {
      if (CGColorEqualToColor(color, a3))
        return;
      color = self->_color;
    }
    CGColorRelease(color);
    v8 = CGColorRetain(a3);
    self->_color = v8;
    if (v6)
    {
      -[CAShapeLayer removeAnimationForKey:](self->_shape_layer, "removeAnimationForKey:", CFSTR("strokeColor"));
      v9 = objc_alloc(MEMORY[0x24BDE56F0]);
      LODWORD(v10) = 1043928040;
      LODWORD(v11) = 1058272560;
      LODWORD(v12) = 1063980840;
      LODWORD(v13) = 0;
      v14 = (CAMediaTimingFunction *)objc_msgSend(v9, "initWithControlPoints::::", v10, v13, v11, v12);
      LAUI_CA_utilities::spring_factory::spring_factory((LAUI_CA_utilities::spring_factory *)v20, 2.0, 300.0, 400.0, 0.0, v14);

      -[CAShapeLayer presentationLayer](self->_shape_layer, "presentationLayer");
      v15 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
      shape_layer = v15;
      if (!v15)
        shape_layer = self->_shape_layer;
      v17 = shape_layer;

      v18 = -[CAShapeLayer strokeColor](v17, "strokeColor");
      animation = LAUI_CA_utilities::spring_factory::create_animation((LAUI_CA_utilities::spring_factory *)v20, CFSTR("strokeColor"));
      objc_msgSend(animation, "setAdditive:", 0);
      objc_msgSend(animation, "setFromValue:", v18);
      objc_msgSend(animation, "setToValue:", self->_color);
      -[CAShapeLayer addAnimation:forKey:](self->_shape_layer, "addAnimation:forKey:", animation, CFSTR("strokeColor"));

      v8 = self->_color;
    }
    -[CAShapeLayer setStrokeColor:](self->_shape_layer, "setStrokeColor:", v8);
  }
}

- (void)setRevealed:(BOOL)a3 animated:(BOOL)a4
{
  -[LAUICheckmarkLayer setRevealed:animated:withCompletion:](self, "setRevealed:animated:withCompletion:", a3, a4, 0);
}

- (void)setRevealed:(BOOL)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  void *v15;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v15 = v8;
  if (self->_revealed == v6)
  {
    if (v8)
    {
      if (self->_animating)
      {
        std::vector<LAUI_CA_utilities::animation_completion_handler_container>::emplace_back<void({block_pointer} {__strong}&)(BOOL)>((uint64_t *)&self->_completions, &v15);
      }
      else
      {
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3321888768;
        v13[2] = __58__LAUICheckmarkLayer_setRevealed_animated_withCompletion___block_invoke;
        v13[3] = &__block_descriptor_40_ea8_32c71_ZTSKZ58__LAUICheckmarkLayer_setRevealed_animated_withCompletion__E3__0_e5_v8__0l;
        v12 = (void *)MEMORY[0x20BD1B708](v8, v9, v10, v11);
        v14 = (id)MEMORY[0x20BD1B708]();
        dispatch_async(MEMORY[0x24BDAC9B8], v13);

      }
    }
  }
  else
  {
    -[LAUICheckmarkLayer _executeCompletions:](self, "_executeCompletions:", 0);
    self->_revealed = v6;
    if (v15)
      std::vector<LAUI_CA_utilities::animation_completion_handler_container>::emplace_back<void({block_pointer} {__strong}&)(BOOL)>((uint64_t *)&self->_completions, &v15);
    -[LAUICheckmarkLayer _updateRevealedAnimated:](self, "_updateRevealedAnimated:", v5);
  }

}

uint64_t __58__LAUICheckmarkLayer_setRevealed_animated_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CGSize)aspectSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[CAShapeLayer bounds](self->_shape_layer, "bounds");
  v4 = 1.0;
  if (v2 >= 1.0)
    v5 = v2;
  else
    v5 = 1.0;
  if (v3 >= 1.0)
    v4 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (CGSize)defaultSizeForCircleWithDiameter:(double)a3 scale:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[LAUICheckmarkLayer aspectSize](self, "aspectSize");
  v8 = v7;
  v9 = a3 * 0.434065934;
  if (a4 == 0.0)
  {
    v10 = round(v9);
    v11 = round(v6 * (v10 / v8));
  }
  else
  {
    v10 = round(v9 * a4) / a4;
    v11 = round(v6 * (v10 / v8) * a4) / a4;
  }
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_updateRevealedAnimated:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  _BOOL4 animating;
  unsigned int v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CAMediaTimingFunction *v14;
  double v15;
  CAShapeLayer *v16;
  CAShapeLayer *v17;
  CAShapeLayer *shape_layer;
  void *animation;
  double v20;
  double v21;
  CAAnimation *v22;
  void *v23;
  __CFString *v24;
  double v25;
  void *v26;
  int v27;
  int v28;
  double v29;
  void *v30;
  double v31;
  id v32;
  id v33;
  unsigned int v34;
  _QWORD v35[4];
  id v36;
  unsigned int v37;
  id location;
  _BYTE v39[32];
  id v40;

  v3 = a3;
  v5 = 1.0;
  if (!self->_revealed)
  {
    -[CAShapeLayer strokeStart](self->_shape_layer, "strokeStart");
    v5 = v6;
  }
  animating = self->_animating;
  self->_animating = v3;
  v8 = self->_animation_index + 1;
  self->_animation_index = v8;
  if (!v3)
  {
    -[CAShapeLayer setStrokeEnd:](self->_shape_layer, "setStrokeEnd:", v5);
    LODWORD(v25) = 1.0;
    -[CAShapeLayer setOpacity:](self->_shape_layer, "setOpacity:", v25);
    -[CAShapeLayer removeAllAnimations](self->_shape_layer, "removeAllAnimations");
    -[LAUICheckmarkLayer _executeCompletions:](self, "_executeCompletions:", 1);
    -[LAUICheckmarkLayer _animationsDidResolve](self, "_animationsDidResolve");
    return;
  }
  v9 = objc_alloc(MEMORY[0x24BDE56F0]);
  LODWORD(v10) = 1043928040;
  LODWORD(v11) = 1058272560;
  LODWORD(v12) = 1063980840;
  LODWORD(v13) = 0;
  v14 = (CAMediaTimingFunction *)objc_msgSend(v9, "initWithControlPoints::::", v10, v13, v11, v12);
  LAUI_CA_utilities::spring_factory::spring_factory((LAUI_CA_utilities::spring_factory *)v39, 2.0, 300.0, 400.0, 0.0, v14);

  if (self->_revealed)
  {
    if (animating)
    {
      std::vector<UIView * {__strong}>::emplace_back<UIView * {__strong}&>((char **)&self->_transient_shape_layers, (id *)&self->_shape_layer);
      v17 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
      shape_layer = self->_shape_layer;
      self->_shape_layer = v17;

      if (self->_shape_layer)
        -[LAUICheckmarkLayer addSublayer:](self, "addSublayer:");
    }
    LODWORD(v15) = 1.0;
    -[CAShapeLayer setOpacity:](self->_shape_layer, "setOpacity:", v15);
    animation = LAUI_CA_utilities::spring_factory::create_animation((LAUI_CA_utilities::spring_factory *)v39, CFSTR("strokeEnd"));
    -[CAShapeLayer strokeStart](self->_shape_layer, "strokeStart");
    v21 = v20;
    v22 = animation;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v21 - v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAAnimation setFromValue:](v22, "setFromValue:", v23);

    -[CAAnimation setToValue:](v22, "setToValue:", &unk_24C2850C8);
    -[CAShapeLayer setStrokeEnd:](self->_shape_layer, "setStrokeEnd:", v5);
    v24 = CFSTR("strokeEnd");
    if (!v22)
      goto LABEL_14;
  }
  else
  {
    v26 = LAUI_CA_utilities::spring_factory::create_animation((LAUI_CA_utilities::spring_factory *)v39, CFSTR("opacity"));
    -[CAShapeLayer opacity](self->_shape_layer, "opacity");
    v28 = v27;
    v22 = v26;
    LODWORD(v29) = v28;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAAnimation setFromValue:](v22, "setFromValue:", v30);

    -[CAAnimation setToValue:](v22, "setToValue:", &unk_24C2850C8);
    LODWORD(v31) = 0;
    -[CAShapeLayer setOpacity:](self->_shape_layer, "setOpacity:", v31);
    v24 = CFSTR("opacity");
    if (!v22)
    {
LABEL_14:
      self->_animating = 0;
      -[LAUICheckmarkLayer _executeCompletions:](self, "_executeCompletions:", 1);
      -[LAUICheckmarkLayer _animationsDidResolve](self, "_animationsDidResolve");
      goto LABEL_15;
    }
  }
  if (!self->_shape_layer)
    goto LABEL_14;
  objc_initWeak(&location, self);
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3321888768;
  v35[2] = __46__LAUICheckmarkLayer__updateRevealedAnimated___block_invoke;
  v35[3] = &__block_descriptor_48_ea8_32c59_ZTSKZ46__LAUICheckmarkLayer__updateRevealedAnimated__E3__1_e8_v12__0B8l;
  objc_copyWeak(&v33, &location);
  v34 = v8;
  objc_copyWeak(&v36, &v33);
  v37 = v34;
  -[CAAnimation laui_setDidStopHandler:](v22, "laui_setDidStopHandler:", v35);
  objc_destroyWeak(&v33);
  v32 = LAUILayerAddAdditiveAnimation(&self->_shape_layer->super, &v24->isa, v22);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
LABEL_15:

}

void __46__LAUICheckmarkLayer__updateRevealedAnimated___block_invoke(uint64_t a1, uint64_t a2)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *((_DWORD *)WeakRetained + 17) == *(_DWORD *)(a1 + 40))
  {
    WeakRetained[64] = 0;
    objc_msgSend(WeakRetained, "_executeCompletions:", a2);
    objc_msgSend(WeakRetained, "_animationsDidResolve");
  }

}

- (void)_executeCompletions:(BOOL)a3
{
  void ***p_completions;

  p_completions = (void ***)&self->_completions;
  LAUI_CA_utilities::animation_completion_handler_container::execute((LAUI_CA_utilities::animation_completion_handler_container **)&self->_completions, a3);
  std::vector<LAUI_CA_utilities::animation_completion_handler_container>::__base_destruct_at_end[abi:ne180100]((uint64_t)p_completions, *p_completions);
  std::vector<LAUI_CA_utilities::animation_completion_handler_container>::shrink_to_fit((uint64_t *)p_completions);
}

- (void)_animationsDidResolve
{
  double v2;
  vector<CAShapeLayer *, std::allocator<CAShapeLayer *>> *p_transient_shape_layers;
  __end_cap_ **var0;
  __end_ **begin;
  void *v7;
  char *v8;
  char *i;
  void *v10;
  CAShapeLayer *shape_layer;

  p_transient_shape_layers = &self->_transient_shape_layers;
  begin = self->_transient_shape_layers.__begin_;
  var0 = self->_transient_shape_layers.var0;
  if (var0 != begin)
  {
    do
    {
      v7 = *begin++;
      objc_msgSend(v7, "removeFromSuperlayer");
    }
    while (begin != var0);
    v8 = (char *)p_transient_shape_layers->__begin_;
    for (i = (char *)p_transient_shape_layers->var0; i != v8; i -= 8)
    {
      v10 = (void *)*((_QWORD *)i - 1);

    }
    p_transient_shape_layers->var0 = (__end_cap_ **)v8;
    std::vector<CAShapeLayer * {__strong}>::shrink_to_fit((char **)p_transient_shape_layers);
  }
  if (!self->_revealed)
  {
    LODWORD(v2) = 1.0;
    -[CAShapeLayer setOpacity:](self->_shape_layer, "setOpacity:", v2);
    shape_layer = self->_shape_layer;
    -[CAShapeLayer strokeStart](shape_layer, "strokeStart");
    -[CAShapeLayer setStrokeEnd:](shape_layer, "setStrokeEnd:");
  }
}

- (UIColor)primaryColor
{
  return self->_primary_color;
}

- (double)lineWidthScale
{
  return self->_line_width_scale;
}

- (CGColor)color
{
  return self->_color;
}

- (BOOL)isRevealed
{
  return self->_revealed;
}

- (void).cxx_destruct
{
  void **p_begin;

  objc_storeStrong((id *)&self->_primary_color, 0);
  p_begin = (void **)&self->_completions.__begin_;
  std::vector<LAUI_CA_utilities::animation_completion_handler_container>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = (void **)&self->_transient_shape_layers.__begin_;
  std::vector<UIView * {__strong}>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  objc_storeStrong((id *)&self->_shape_layer, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 11) = 0;
  return self;
}

@end
