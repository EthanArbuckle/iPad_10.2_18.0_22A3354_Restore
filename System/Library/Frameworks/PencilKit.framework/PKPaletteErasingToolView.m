@implementation PKPaletteErasingToolView

- (PKPaletteErasingToolView)initWithToolIdentifier:(id)a3 variant:(id)a4 configuration:(id)a5
{
  id v8;
  PKPaletteErasingToolView *v9;
  objc_super v11;

  v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaletteErasingToolView;
  v9 = -[PKPaletteToolView initWithToolIdentifier:variant:configuration:](&v11, sel_initWithToolIdentifier_variant_configuration_, v8, a4, a5);
  if (v9)
    -[PKPaletteErasingToolView setBitmapEraser:](v9, "setBitmapEraser:", objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.ink.eraser")));

  return v9;
}

- (NSString)toolIdentifier
{
  _BOOL4 v2;
  __CFString **v3;

  v2 = -[PKPaletteErasingToolView isBitmapEraser](self, "isBitmapEraser");
  v3 = PKInkIdentifierEraser;
  if (!v2)
    v3 = PKInkIdentifierObjectEraser;
  return (NSString *)*v3;
}

- (void)setBitmapEraser:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (self->_bitmapEraser != a3)
  {
    self->_bitmapEraser = a3;
    -[PKPaletteErasingToolView toolIdentifier](self, "toolIdentifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolView configuration](self, "configuration");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = *(_QWORD *)(v4 + 152);
    else
      v6 = 0;
    +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:inkVersion:]((uint64_t)PKToolConfiguration, v8, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolView setConfiguration:](self, "setConfiguration:", v7);

  }
}

- (double)weight
{
  _QWORD *v3;
  uint64_t v4;
  double result;

  -[PKPaletteToolView configuration](self, "configuration");
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3[19];

    if (v4 == 3)
      return NAN;
  }
  -[PKPaletteAttributeViewController weight](self->_attributeViewController, "weight");
  return result;
}

- (void)setToolProperties:(id)a3
{
  -[PKPaletteErasingToolView setToolProperties:updateUI:](self, "setToolProperties:updateUI:", a3, 1);
}

- (void)setToolProperties:(id)a3 updateUI:(BOOL)a4
{
  _BOOL4 v4;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)PKPaletteErasingToolView;
  -[PKPaletteToolView setToolProperties:](&v6, sel_setToolProperties_, a3);
  if (v4)
    -[PKPaletteErasingToolView _updateAttributesViewController](self, "_updateAttributesViewController");
}

- (id)attributeViewController
{
  PKPaletteErasingAttributesViewController *v3;
  PKPaletteAttributeViewController *attributeViewController;

  if (!self->_attributeViewController)
  {
    v3 = objc_alloc_init(PKPaletteErasingAttributesViewController);
    -[PKPaletteErasingAttributesViewController setDelegate:](v3, "setDelegate:", self);
    attributeViewController = self->_attributeViewController;
    self->_attributeViewController = &v3->super;

  }
  -[PKPaletteErasingToolView _updateAttributesViewController](self, "_updateAttributesViewController");
  return self->_attributeViewController;
}

- (void)_updateAttributesViewController
{
  PKPaletteAttributeViewController *v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;

  v3 = self->_attributeViewController;
  -[PKPaletteAttributeViewController setEraserType:](v3, "setEraserType:", -[PKPaletteErasingToolView isBitmapEraser](self, "isBitmapEraser") ^ 1);
  -[PKPaletteToolView configuration](self, "configuration");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = *(_QWORD *)(v4 + 152) == 3;
  else
    v6 = 0;
  -[PKPaletteAttributeViewController setHideWeightPicker:](v3, "setHideWeightPicker:", v6);

  -[PKPaletteErasingToolView _updateAttributesViewControllerWeight](self, "_updateAttributesViewControllerWeight");
}

- (void)_updateAttributesViewControllerWeight
{
  void *v3;
  void *v4;
  PKPaletteAttributeViewController *v5;

  v5 = self->_attributeViewController;
  if (-[PKPaletteErasingToolView isBitmapEraser](self, "isBitmapEraser"))
  {
    -[PKPaletteToolView toolProperties](self, "toolProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PKInkWeightProperty"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && -[PKPaletteErasingToolView isBitmapEraser](self, "isBitmapEraser"))
    {
      objc_msgSend(v4, "doubleValue");
      -[PKPaletteAttributeViewController setWeight:](v5, "setWeight:");
    }

  }
  else
  {
    -[PKPaletteAttributeViewController setWeight:](v5, "setWeight:", 0.0);
  }

}

- (void)erasingAttributesViewControllerDidChangeErasingType:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[PKPaletteErasingToolView setBitmapEraser:](self, "setBitmapEraser:", objc_msgSend(v4, "eraserType") == 0);
  -[PKPaletteErasingToolView _updateAttributesViewControllerWeight](self, "_updateAttributesViewControllerWeight");
  -[PKPaletteErasingToolView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  +[PKStatisticsManager sharedStatisticsManager]();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "eraserType");

  -[PKStatisticsManager recordPixelObjectEraseModeChange:]((uint64_t)v6, v5);
}

- (void)erasingAttributesViewControllerDidChangeInkThickness:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[PKPaletteToolView toolProperties](self, "toolProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v5, "mutableCopy");

  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "weight");
  v8 = v7;

  objc_msgSend(v6, "numberWithDouble:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("PKInkWeightProperty"));

  v10 = (void *)objc_msgSend(v11, "copy");
  -[PKPaletteErasingToolView setToolProperties:updateUI:](self, "setToolProperties:updateUI:", v10, 0);

  -[PKPaletteErasingToolView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (BOOL)isBitmapEraser
{
  return self->_bitmapEraser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeViewController, 0);
}

@end
