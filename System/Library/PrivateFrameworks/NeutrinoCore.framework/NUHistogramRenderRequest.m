@implementation NUHistogramRenderRequest

- (NUHistogramRenderRequest)initWithComposition:(id)a3
{
  NUHistogramRenderRequest *v3;
  NUHistogramParameters *v4;
  NUHistogramParameters *parameters;
  NUPixelCountScalePolicy *v6;
  NUScalePolicy *scalePolicy;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NUHistogramRenderRequest;
  v3 = -[NURenderRequest initWithComposition:](&v9, sel_initWithComposition_, a3);
  v4 = objc_alloc_init(NUHistogramParameters);
  parameters = v3->_parameters;
  v3->_parameters = v4;

  v6 = -[NUPixelCountScalePolicy initWithTargetPixelCount:]([NUPixelCountScalePolicy alloc], "initWithTargetPixelCount:", 0x80000);
  scalePolicy = v3->_scalePolicy;
  v3->_scalePolicy = (NUScalePolicy *)v6;

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUHistogramRenderRequest;
  v4 = -[NURenderRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 19, self->_parameters);
    objc_storeStrong(v5 + 21, self->_scalePolicy);
    objc_storeStrong(v5 + 20, self->_histogramCalculationColorSpace);
  }
  return v5;
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)newRenderJob
{
  return -[NUHistogramRenderJob initWithHistogramRequest:]([NUHistogramRenderJob alloc], "initWithHistogramRequest:", self);
}

- (void)setParameters:(id)a3
{
  NUHistogramParameters *v4;
  NUHistogramParameters *parameters;

  v4 = (NUHistogramParameters *)objc_msgSend(a3, "copy");
  parameters = self->_parameters;
  self->_parameters = v4;

}

- (NUHistogramParameters)parameters
{
  return (NUHistogramParameters *)(id)-[NUHistogramParameters copy](self->_parameters, "copy");
}

- (NUColorSpace)histogramCalculationColorSpace
{
  NUColorSpace *histogramCalculationColorSpace;
  NUImagePropertiesRequest *v4;
  void *v5;
  NUImagePropertiesRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NUColorSpace *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NUColorSpace *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  histogramCalculationColorSpace = self->_histogramCalculationColorSpace;
  if (!histogramCalculationColorSpace)
  {
    v4 = [NUImagePropertiesRequest alloc];
    -[NURenderRequest composition](self, "composition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NURenderRequest initWithComposition:](v4, "initWithComposition:", v5);

    v7 = (void *)MEMORY[0x1E0CB3940];
    -[NURenderRequest name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-imageProperties"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderRequest setName:](v6, "setName:", v9);

    v19 = 0;
    -[NUImagePropertiesRequest submitSynchronous:](v6, "submitSynchronous:", &v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v19;
    +[NUColorSpace sRGBColorSpace](NUColorSpace, "sRGBColorSpace");
    v12 = (NUColorSpace *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v10, "properties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "colorSpace");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "isHDR"))
      {
        +[NUColorSpace itur2100HLGColorSpace](NUColorSpace, "itur2100HLGColorSpace");
        v15 = objc_claimAutoreleasedReturnValue();

        v12 = (NUColorSpace *)v15;
      }

    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_5778);
      v16 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v11;
        _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Could not determine image properties: %@", buf, 0xCu);
      }
    }
    v17 = self->_histogramCalculationColorSpace;
    self->_histogramCalculationColorSpace = v12;

    histogramCalculationColorSpace = self->_histogramCalculationColorSpace;
  }
  return histogramCalculationColorSpace;
}

- (void)setHistogramCalculationColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_histogramCalculationColorSpace, a3);
}

- (NUScalePolicy)scalePolicy
{
  return (NUScalePolicy *)objc_getProperty(self, a2, 168, 1);
}

- (void)setScalePolicy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalePolicy, 0);
  objc_storeStrong((id *)&self->_histogramCalculationColorSpace, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
