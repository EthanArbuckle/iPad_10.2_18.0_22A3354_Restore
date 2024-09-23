@implementation MLCUpsampleLayer

+ (MLCUpsampleLayer)layerWithShape:(NSArray *)shape
{
  NSArray *v4;
  void *v5;

  v4 = shape;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithShape:sampleMode:alignCorners:", v4, 0, 0);

  return (MLCUpsampleLayer *)v5;
}

+ (MLCUpsampleLayer)layerWithShape:(NSArray *)shape sampleMode:(MLCSampleMode)sampleMode alignsCorners:(BOOL)alignsCorners
{
  _BOOL8 v5;
  uint64_t v6;
  NSArray *v8;
  void *v9;

  v5 = alignsCorners;
  v6 = *(_QWORD *)&sampleMode;
  v8 = shape;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithShape:sampleMode:alignCorners:", v8, v6, v5);

  return (MLCUpsampleLayer *)v9;
}

- (MLCUpsampleLayer)initWithShape:(id)a3 sampleMode:(int)a4 alignCorners:(BOOL)a5
{
  id v9;
  MLCUpsampleLayer *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;

  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MLCUpsampleLayer;
  v10 = -[MLCLayer initWithLabel:](&v15, sel_initWithLabel_, CFSTR("Upsampling"));
  if (v10)
  {
    if (objc_msgSend(v9, "count") == 1)
    {
      v11 = 0;
      v10->_upsampleHeight = 1;
    }
    else
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_upsampleHeight = objc_msgSend(v12, "unsignedIntegerValue");

      v11 = 1;
    }
    objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_upsampleWidth = objc_msgSend(v13, "unsignedIntegerValue");

    v10->_sampleMode = a4;
    v10->_alignsCorners = a5;
    objc_storeStrong((id *)&v10->_shape, a3);
  }

  return v10;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  NSObject *v28;
  NSObject *v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  float v44;
  float v45;
  void *v46;
  uint64_t v47;
  _BOOL8 v48;
  double v49;
  double v50;
  void *v51;
  char v52;
  NSObject *v53;
  const char *v54;
  SEL aSelector;
  SEL aSelectorb;
  const char *aSelectora;
  uint64_t v59;
  objc_super v60;
  uint8_t buf[4];
  NSObject *v62;
  __int16 v63;
  _BYTE v64[18];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "dataType");

  if (!+[MLCLayer supportsDataType:onDevice:](MLCUpsampleLayer, "supportsDataType:onDevice:", v14, v9))
  {
    +[MLCLog framework](MLCLog, "framework");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v29 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v62 = v29;
      v63 = 1024;
      *(_DWORD *)v64 = v14;
      *(_WORD *)&v64[4] = 2112;
      *(_QWORD *)&v64[6] = v9;
      _os_log_error_impl(&dword_1D4999000, v28, OS_LOG_TYPE_ERROR, "%@: upsample layer with data type = %d is not supported on a device = %@", buf, 0x1Cu);

    }
    goto LABEL_29;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "shape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18 == 2)
  {
    aSelectorb = a2;
    v27 = 1;
    v30 = 1;
    v31 = 1;
    v23 = 1;
    v32 = -[MLCUpsampleLayer upsampleWidth](self, "upsampleWidth", aSelectorb);
  }
  else
  {
    if (v18 == 4)
    {
      aSelector = a2;
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "descriptor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "shape");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectAtIndexedSubscript:", 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v36, "unsignedIntegerValue");

      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "descriptor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "shape");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectAtIndexedSubscript:", 3);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v40, "unsignedIntegerValue");

      objc_msgSend(v11, "descriptor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "shape");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectAtIndexedSubscript:", 2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v43, "unsignedIntegerValue");

      objc_msgSend(v11, "descriptor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "shape");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v18 != 3)
      {
        +[MLCLog framework](MLCLog, "framework");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[MLCPaddingLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2, v10);
        goto LABEL_29;
      }
      aSelector = a2;
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "descriptor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "shape");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "unsignedIntegerValue");

      objc_msgSend(v11, "descriptor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "shape");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 1;
      v59 = 1;
    }
    v30 = objc_msgSend(v26, "unsignedIntegerValue");

    v31 = v59;
    v32 = -[MLCUpsampleLayer upsampleWidth](self, "upsampleWidth", aSelector);
  }
  if (v30 != v32)
  {
    +[MLCLog framework](MLCLog, "framework");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(aSelectora);
      v53 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v62 = v53;
      v63 = 2048;
      *(_QWORD *)v64 = v30;
      *(_WORD *)&v64[8] = 2048;
      *(_QWORD *)&v64[10] = -[MLCUpsampleLayer upsampleWidth](self, "upsampleWidth");
      v54 = "%@: resultTensor width=%lu does not match value specified in shape=%lu";
LABEL_25:
      _os_log_error_impl(&dword_1D4999000, v28, OS_LOG_TYPE_ERROR, v54, buf, 0x20u);
LABEL_28:

    }
LABEL_29:
    v52 = 0;
    goto LABEL_30;
  }
  if (v27 != -[MLCUpsampleLayer upsampleHeight](self, "upsampleHeight"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(aSelectora);
      v53 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v62 = v53;
      v63 = 2048;
      *(_QWORD *)v64 = v27;
      *(_WORD *)&v64[8] = 2048;
      *(_QWORD *)&v64[10] = -[MLCUpsampleLayer upsampleHeight](self, "upsampleHeight");
      v54 = "%@: resultTensor height=%lu does not match value specified in shape=%lu";
      goto LABEL_25;
    }
    goto LABEL_29;
  }
  v44 = (float)v30 / (float)v23;
  v45 = (float)v27 / (float)v31;
  if (-[MLCUpsampleLayer sampleMode](self, "sampleMode") == MLCSampleModeLinear
    && -[MLCUpsampleLayer alignsCorners](self, "alignsCorners"))
  {
    v44 = (float)(v30 - 1) / (float)(v23 - 1);
    v45 = (float)(v27 - 1) / (float)(v31 - 1);
  }
  objc_msgSend(v9, "computeEngine");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[MLCUpsampleLayer sampleMode](self, "sampleMode");
  v48 = -[MLCUpsampleLayer alignsCorners](self, "alignsCorners");
  *(float *)&v49 = v44;
  *(float *)&v50 = v45;
  objc_msgSend(v46, "upsampleLayerWithScaleFactorX:scaleFactorY:sampleMode:alignCorners:", v47, v48, v49, v50);
  v28 = objc_claimAutoreleasedReturnValue();

  if (!v28 || !-[NSObject count](v28, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      -[MLCPaddingLayer compileForDevice:sourceTensors:resultTensor:].cold.1(aSelectora);
    goto LABEL_28;
  }
  objc_msgSend(v9, "computeEngine");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "compileLayerDeviceOps:sourceTensors:resultTensor:", v28, v10, v11);

  v60.receiver = self;
  v60.super_class = (Class)MLCUpsampleLayer;
  -[MLCLayer bindDevice:deviceOps:](&v60, sel_bindDevice_deviceOps_, v9, v28);
LABEL_30:

  return v52;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  unint64_t result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MLCUpsampleLayer;
  result = -[MLCLayer resultSizeFromSourceSize:dimension:](&v7, sel_resultSizeFromSourceSize_dimension_, a3);
  if (a4 == 2)
    return -[MLCUpsampleLayer upsampleHeight](self, "upsampleHeight");
  if (a4 == 3)
    return -[MLCUpsampleLayer upsampleWidth](self, "upsampleWidth");
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCUpsampleLayer shape](self, "shape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { shape=%@ : conditionalTreeNode=%@ : resultTensor=%@ }"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)summarizedDOTDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSUInteger v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCLayer layerID](self, "layerID");
  -[MLCUpsampleLayer shape](self, "shape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MLCSampleModeDebugDescription(-[MLCUpsampleLayer sampleMode](self, "sampleMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Shape: %@<BR />Sample Mode: %@    Align Corners: %hhd</FONT>>"), v5, v6, v7, v8, -[MLCUpsampleLayer alignsCorners](self, "alignsCorners"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSArray)shape
{
  return self->_shape;
}

- (MLCSampleMode)sampleMode
{
  return self->_sampleMode;
}

- (BOOL)alignsCorners
{
  return self->_alignsCorners;
}

- (unint64_t)upsampleWidth
{
  return self->_upsampleWidth;
}

- (unint64_t)upsampleHeight
{
  return self->_upsampleHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
}

@end
