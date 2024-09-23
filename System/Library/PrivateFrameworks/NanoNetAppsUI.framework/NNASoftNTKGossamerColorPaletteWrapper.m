@implementation NNASoftNTKGossamerColorPaletteWrapper

+ (id)sharedPalette
{
  if (sharedPalette_onceToken != -1)
    dispatch_once(&sharedPalette_onceToken, &__block_literal_global);
  return (id)sharedPalette_wrapper;
}

void __54__NNASoftNTKGossamerColorPaletteWrapper_sharedPalette__block_invoke()
{
  NNASoftNTKGossamerColorPaletteWrapper *v0;
  void *v1;

  v0 = objc_alloc_init(NNASoftNTKGossamerColorPaletteWrapper);
  v1 = (void *)sharedPalette_wrapper;
  sharedPalette_wrapper = (uint64_t)v0;

}

- (NNASoftNTKGossamerColorPaletteWrapper)init
{
  NNASoftNTKGossamerColorPaletteWrapper *v2;
  SGColorPalette *v3;
  SGColorPalette *colorPalette;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NNASoftNTKGossamerColorPaletteWrapper;
  v2 = -[NNASoftNTKGossamerColorPaletteWrapper init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SGColorPalette);
    colorPalette = v2->_colorPalette;
    v2->_colorPalette = v3;

  }
  return v2;
}

- (void)assertColor:(id)a3 closeTo:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v14 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  v7 = 0.0;
  v6 = a4;
  objc_msgSend(a3, "getRed:green:blue:alpha:", &v14, &v13, &v12, &v11);
  objc_msgSend(v6, "getRed:green:blue:alpha:", &v10, &v9, &v8, &v7);

  -[NNASoftNTKGossamerColorPaletteWrapper assertDouble:closeTo:](self, "assertDouble:closeTo:", v14, v10);
  -[NNASoftNTKGossamerColorPaletteWrapper assertDouble:closeTo:](self, "assertDouble:closeTo:", v13, v9);
  -[NNASoftNTKGossamerColorPaletteWrapper assertDouble:closeTo:](self, "assertDouble:closeTo:", v12, v8);
  -[NNASoftNTKGossamerColorPaletteWrapper assertDouble:closeTo:](self, "assertDouble:closeTo:", v11, v7);
}

- (id)getSolarColorsForLocation:(id)a3 atDate:(id)a4
{
  return -[SGColorPalette getSolarColorsForLocation:atDate:](self->_colorPalette, "getSolarColorsForLocation:atDate:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPalette, 0);
}

@end
