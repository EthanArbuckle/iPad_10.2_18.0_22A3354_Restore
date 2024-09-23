@implementation ISiOSAppRecipe

- (ISiOSAppRecipe)init
{
  ISiOSAppRecipe *v2;
  ISiOSAppRecipe *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISiOSAppRecipe;
  v2 = -[ISiOSAppRecipe init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[ISiOSAppRecipe setShouldApplyMask:](v2, "setShouldApplyMask:", 1);
    -[ISiOSAppRecipe setShouldDrawBorder:](v3, "setShouldDrawBorder:", 0);
    -[ISiOSAppRecipe setTintColor:](v3, "setTintColor:", 0);
    -[ISiOSAppRecipe setAllowDarkAndTintable:](v3, "setAllowDarkAndTintable:", 0);
    -[ISiOSAppRecipe setSegment:](v3, "setSegment:", 0);
  }
  return v3;
}

- (void)updateRecipeWithImageDescriptor:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  -[ISiOSAppRecipe setShouldApplyMask:](self, "setShouldApplyMask:", objc_msgSend(v4, "shouldApplyMask"));
  -[ISiOSAppRecipe setShouldDrawBorder:](self, "setShouldDrawBorder:", objc_msgSend(v4, "drawBorder"));
  objc_msgSend(v4, "tintColor");
  v5 = objc_claimAutoreleasedReturnValue();
  -[ISiOSAppRecipe setTintColor:](self, "setTintColor:", v5);

  -[ISiOSAppRecipe setAppearance:](self, "setAppearance:", objc_msgSend(v4, "appearance"));
  -[ISiOSAppRecipe setBackground:](self, "setBackground:", objc_msgSend(v4, "background"));
  -[ISiOSAppRecipe setTemplateVariant:](self, "setTemplateVariant:", objc_msgSend(v4, "templateVariant"));
  LOBYTE(v5) = objc_msgSend(v4, "specialIconOptions");

  if ((v5 & 2) != 0)
    -[ISiOSAppRecipe setAllowDarkAndTintable:](self, "setAllowDarkAndTintable:", 1);
}

- (id)primaryResourceEffectReturningBackgroundContentOverride:(id *)a3
{
  ISBlendledTintEffect *v5;
  ISSegmentTintEffect *v6;
  ISSegmentTintEffect *v7;
  void *v8;
  __objc2_class *v9;
  void *v11;
  int v12;
  void *v13;

  if (-[ISiOSAppRecipe templateVariant](self, "templateVariant"))
  {
    *a3 = 0;
    v5 = (ISBlendledTintEffect *)objc_opt_new();
LABEL_3:
    v6 = (ISSegmentTintEffect *)v5;
    goto LABEL_16;
  }
  if (-[ISiOSAppRecipe allowDarkAndTintable](self, "allowDarkAndTintable")
    && -[ISiOSAppRecipe appearance](self, "appearance") == 2)
  {
    *a3 = objc_alloc_init(ISDarkBackgroundResource);
    if (-[ISiOSAppRecipe generic](self, "generic"))
      *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 0.0784, 0.0784, 0.0784, 1.0);
    if (-[ISiOSAppRecipe segment](self, "segment"))
    {
      v7 = [ISSegmentTintEffect alloc];
      -[ISiOSAppRecipe tintColor](self, "tintColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v6 = -[ISSegmentTintEffect initWithColor:](v7, "initWithColor:", v8);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D3A7A0], "white");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[ISSegmentTintEffect initWithColor:](v7, "initWithColor:", v13);

      }
      goto LABEL_16;
    }
    if (self->tintColor)
    {
      v5 = -[ISBlendledTintEffect initWithColor:]([ISBlendledTintEffect alloc], "initWithColor:", self->tintColor);
      goto LABEL_3;
    }
    goto LABEL_24;
  }
  if (!-[ISiOSAppRecipe allowDarkAndTintable](self, "allowDarkAndTintable")
    || -[ISiOSAppRecipe appearance](self, "appearance") != 1)
  {
    objc_msgSend(MEMORY[0x1E0D3A7A0], "white");
    v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  *a3 = objc_alloc_init(ISDarkBackgroundResource);
  if (-[ISiOSAppRecipe segment](self, "segment"))
  {
    v9 = ISSegmentDarkEffect;
LABEL_23:
    v5 = (ISBlendledTintEffect *)objc_alloc_init(v9);
    goto LABEL_3;
  }
  +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isDarkIconDimmingForDedicatedAssetsEnabled");

  if (v12)
  {
    v9 = ISIntelligentDimEffect;
    goto LABEL_23;
  }
LABEL_24:
  v6 = 0;
LABEL_16:
  if (-[ISiOSAppRecipe background](self, "background") == 1)
    *a3 = 0;
  return v6;
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  ISLayer *v8;
  ISContentLayer *v9;
  ISContentLayer *v10;
  void *v11;
  id v12;
  ISContentLayer *v13;
  void *v14;
  ISContentLayer *v15;
  void *v16;
  void *v17;
  id v19;

  height = a3.height;
  width = a3.width;
  v8 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v8, "setSize:", width, height);
  -[ISLayer setName:](v8, "setName:", CFSTR("root layer"));
  v9 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v9, "setName:", CFSTR("Background"));
  -[ISLayer setSize:](v9, "setSize:", width, height);
  v10 = objc_alloc_init(ISContentLayer);
  -[ISLayer setName:](v10, "setName:", CFSTR("primary asset layer"));
  -[ISLayer setSize:](v10, "setSize:", width, height);
  -[ISContentLayer setContent:](v10, "setContent:", CFSTR("kISPrimaryResourceKey"));
  v19 = 0;
  -[ISiOSAppRecipe primaryResourceEffectReturningBackgroundContentOverride:](self, "primaryResourceEffectReturningBackgroundContentOverride:", &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v19;
  -[ISLayer setEffect:](v10, "setEffect:", v11);

  -[ISContentLayer setContent:](v9, "setContent:", v12);
  -[ISLayer addSublayer:](v9, "addSublayer:", v10);
  if (-[ISiOSAppRecipe shouldApplyMask](self, "shouldApplyMask")
    && !-[ISiOSAppRecipe templateVariant](self, "templateVariant"))
  {
    v13 = objc_alloc_init(ISContentLayer);
    -[ISLayer setSize:](v13, "setSize:", width, height);
    -[ISLayer setName:](v13, "setName:", CFSTR("mask layer"));
    +[ISShapeCompositorResource continuousRoundedRectShape](ISShapeCompositorResource, "continuousRoundedRectShape");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISContentLayer setContent:](v13, "setContent:", v14);

    -[ISLayer setMask:](v9, "setMask:", v13);
  }
  -[ISLayer addSublayer:](v8, "addSublayer:", v9);

  if (-[ISiOSAppRecipe shouldDrawBorder](self, "shouldDrawBorder"))
  {
    v15 = objc_alloc_init(ISContentLayer);
    -[ISLayer setName:](v15, "setName:", CFSTR("border"));
    -[ISLayer setSize:](v15, "setSize:", width, height);
    v16 = (void *)objc_opt_new();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithWhite:alpha:", 0.0, 0.13);
    objc_msgSend(v16, "setLineColor:", v17);

    objc_msgSend(v16, "setFillColor:", 0);
    objc_msgSend(v16, "setLineWidth:", 1.0 / a4);
    -[ISContentLayer setContent:](v15, "setContent:", v16);
    -[ISLayer addSublayer:](v8, "addSublayer:", v15);

  }
  return v8;
}

- (IFIconSpecification)iconSpecification
{
  return (IFIconSpecification *)objc_msgSend(MEMORY[0x1E0D3A7B8], "iosAppIconSpecification");
}

- (BOOL)shouldApplyMask
{
  return self->shouldApplyMask;
}

- (void)setShouldApplyMask:(BOOL)a3
{
  self->shouldApplyMask = a3;
}

- (BOOL)shouldDrawBorder
{
  return self->shouldDrawBorder;
}

- (void)setShouldDrawBorder:(BOOL)a3
{
  self->shouldDrawBorder = a3;
}

- (IFColor)tintColor
{
  return (IFColor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTintColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int64_t)appearance
{
  return self->appearance;
}

- (void)setAppearance:(int64_t)a3
{
  self->appearance = a3;
}

- (unint64_t)background
{
  return self->background;
}

- (void)setBackground:(unint64_t)a3
{
  self->background = a3;
}

- (BOOL)templateVariant
{
  return self->_templateVariant;
}

- (void)setTemplateVariant:(BOOL)a3
{
  self->_templateVariant = a3;
}

- (BOOL)allowDarkAndTintable
{
  return self->_allowDarkAndTintable;
}

- (void)setAllowDarkAndTintable:(BOOL)a3
{
  self->_allowDarkAndTintable = a3;
}

- (BOOL)segment
{
  return self->_segment;
}

- (void)setSegment:(BOOL)a3
{
  self->_segment = a3;
}

- (BOOL)generic
{
  return self->_generic;
}

- (void)setGeneric:(BOOL)a3
{
  self->_generic = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->tintColor, 0);
}

@end
