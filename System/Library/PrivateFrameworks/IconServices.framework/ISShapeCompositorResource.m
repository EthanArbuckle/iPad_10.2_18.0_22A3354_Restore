@implementation ISShapeCompositorResource

+ (double)continuousCornerRadiusForSize:(CGSize)a3
{
  if (a3.width >= a3.height)
    a3.width = a3.height;
  return a3.width * 0.225;
}

+ (id)continuousRoundedRectShape
{
  if (continuousRoundedRectShape_onceToken != -1)
    dispatch_once(&continuousRoundedRectShape_onceToken, &__block_literal_global_19);
  return (id)continuousRoundedRectShape_resource;
}

void __55__ISShapeCompositorResource_continuousRoundedRectShape__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ISShapeCompositorResource _init]([ISContinuousRoundedRect alloc], "_init");
  v1 = (void *)continuousRoundedRectShape_resource;
  continuousRoundedRectShape_resource = (uint64_t)v0;

}

+ (id)circleShape
{
  if (circleShape_onceToken != -1)
    dispatch_once(&circleShape_onceToken, &__block_literal_global_11);
  return (id)circleShape_resource;
}

void __40__ISShapeCompositorResource_circleShape__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ISShapeCompositorResource _init]([ISCircle alloc], "_init");
  v1 = (void *)circleShape_resource;
  circleShape_resource = (uint64_t)v0;

}

+ (id)tvOSRoundedRectShape
{
  if (tvOSRoundedRectShape_onceToken != -1)
    dispatch_once(&tvOSRoundedRectShape_onceToken, &__block_literal_global_13);
  return (id)tvOSRoundedRectShape_resource;
}

void __49__ISShapeCompositorResource_tvOSRoundedRectShape__block_invoke()
{
  IStvOSRoundedRect *v0;
  void *v1;

  v0 = objc_alloc_init(IStvOSRoundedRect);
  v1 = (void *)tvOSRoundedRectShape_resource;
  tvOSRoundedRectShape_resource = (uint64_t)v0;

}

- (id)_init
{
  ISShapeCompositorResource *v2;
  uint64_t v3;
  IFColor *fillColor;
  IFColor *lineColor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ISShapeCompositorResource;
  v2 = -[ISShapeCompositorResource init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D3A7A0], "black");
    v3 = objc_claimAutoreleasedReturnValue();
    fillColor = v2->_fillColor;
    v2->_fillColor = (IFColor *)v3;

    lineColor = v2->_lineColor;
    v2->_lineColor = 0;
    v2->_lineWidth = 0.0;

  }
  return v2;
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("Abstract method called."), 0, 0, a3.width, a3.height, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (IFColor)fillColor
{
  return (IFColor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFillColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (IFColor)lineColor
{
  return (IFColor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLineColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end
