@implementation BWMetalColorCubeRendererParameters

+ (void)initialize
{
  objc_opt_class();
}

- (BWMetalColorCubeRendererParameters)initWithColorFilter:(id)a3 colorLookupCache:(id)a4
{
  BWMetalColorCubeRendererParameters *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BWMetalColorCubeRendererParameters;
  v6 = -[BWMetalColorCubeRendererParameters init](&v9, sel_init);
  if (v6)
  {
    v6->_colorFilter = (CIFilter *)a3;
    v6->_colorLookupCache = (BWColorLookupCache *)a4;
    v7 = (void *)objc_msgSend(a4, "colorLookupTablesForFilter:", a3);
    v6->_foregroundColorLookupTable = (NSData *)(id)objc_msgSend(v7, "foregroundColorLookupTable");
    v6->_backgroundColorLookupTable = (NSData *)(id)objc_msgSend(v7, "backgroundColorLookupTable");
    v6->_interpolationFractionComplete = 1.0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWMetalColorCubeRendererParameters;
  -[BWMetalColorCubeRendererParameters dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BWMetalColorCubeRendererParameters initWithColorFilter:colorLookupCache:]([BWMetalColorCubeRendererParameters alloc], "initWithColorFilter:colorLookupCache:", self->_colorFilter, self->_colorLookupCache);
}

- (signed)type
{
  return 5;
}

- (int)prepareForRenderingWithInputVideoFormat:(id)a3
{
  id v4;
  void *v5;

  if (!-[BWMetalColorCubeRendererParameters foregroundColorLookupTable](self, "foregroundColorLookupTable", a3)
    && !-[BWMetalColorCubeRendererParameters backgroundColorLookupTable](self, "backgroundColorLookupTable"))
  {
    v4 = -[BWColorLookupCache fetchColorLookupTablesForFilter:](-[BWMetalColorCubeRendererParameters colorLookupCache](self, "colorLookupCache"), "fetchColorLookupTablesForFilter:", -[BWMetalColorCubeRendererParameters colorFilter](self, "colorFilter"));
    if (v4)
    {
      v5 = v4;
      -[BWMetalColorCubeRendererParameters setForegroundColorLookupTable:](self, "setForegroundColorLookupTable:", objc_msgSend(v4, "foregroundColorLookupTable"));
      -[BWMetalColorCubeRendererParameters setBackgroundColorLookupTable:](self, "setBackgroundColorLookupTable:", objc_msgSend(v5, "backgroundColorLookupTable"));
    }
  }
  return 0;
}

- (void)setColorFilter:(id)a3
{
  CIFilter *colorFilter;

  colorFilter = self->_colorFilter;
  if (colorFilter != a3)
  {

    self->_colorFilter = (CIFilter *)a3;
  }
}

- (void)updateByInterpolatingFromParameters:(id)a3 toParameters:(id)a4 withFractionComplete:(float)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  double v17;
  double v18;

  if (a3 && objc_msgSend(a3, "type") != 5 || a4 && objc_msgSend(a4, "type") != 5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    if (objc_msgSend(a3, "colorFilter"))
      v9 = (id)objc_msgSend(a3, "foregroundColorLookupTable");
    else
      v9 = -[BWColorLookupCache identityColorLookupTable](self->_colorLookupCache, "identityColorLookupTable");
    v10 = v9;
    if (objc_msgSend(a4, "colorFilter"))
      v11 = (id)objc_msgSend(a4, "foregroundColorLookupTable");
    else
      v11 = -[BWColorLookupCache identityColorLookupTable](self->_colorLookupCache, "identityColorLookupTable");
    v12 = v11;
    if (objc_msgSend(a3, "colorFilter"))
      v13 = (id)objc_msgSend(a3, "backgroundColorLookupTable");
    else
      v13 = -[BWColorLookupCache identityColorLookupTable](self->_colorLookupCache, "identityColorLookupTable");
    v14 = v13;
    if (objc_msgSend(a4, "colorFilter"))
      v15 = (id)objc_msgSend(a4, "backgroundColorLookupTable");
    else
      v15 = -[BWColorLookupCache identityColorLookupTable](self->_colorLookupCache, "identityColorLookupTable");
    v16 = v15;
    if ((objc_msgSend((id)objc_msgSend(a3, "foregroundColorLookupTable"), "isEqual:", objc_msgSend(a4, "foregroundColorLookupTable")) & 1) == 0)
    {
      *(float *)&v17 = a5;
      v10 = -[BWColorLookupCache interpolatedColorLookupTableFromTable:toTable:fractionComplete:](self->_colorLookupCache, "interpolatedColorLookupTableFromTable:toTable:fractionComplete:", v10, v12, v17);
    }
    -[BWMetalColorCubeRendererParameters setForegroundColorLookupTable:](self, "setForegroundColorLookupTable:", v10);
    *(float *)&v18 = a5;
    -[BWMetalColorCubeRendererParameters setBackgroundColorLookupTable:](self, "setBackgroundColorLookupTable:", -[BWColorLookupCache interpolatedColorLookupTableFromTable:toTable:fractionComplete:](self->_colorLookupCache, "interpolatedColorLookupTableFromTable:toTable:fractionComplete:", v14, v16, v18));
    self->_interpolationFractionComplete = a5;
  }
}

- (float)interpolationFractionComplete
{
  return self->_interpolationFractionComplete;
}

- (CIFilter)colorFilter
{
  return self->_colorFilter;
}

- (BWColorLookupCache)colorLookupCache
{
  return self->_colorLookupCache;
}

- (NSData)foregroundColorLookupTable
{
  return self->_foregroundColorLookupTable;
}

- (void)setForegroundColorLookupTable:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSData)backgroundColorLookupTable
{
  return self->_backgroundColorLookupTable;
}

- (void)setBackgroundColorLookupTable:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
