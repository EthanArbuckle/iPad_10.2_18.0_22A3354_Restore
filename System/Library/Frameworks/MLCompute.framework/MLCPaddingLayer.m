@implementation MLCPaddingLayer

+ (MLCPaddingLayer)layerWithReflectionPadding:(NSArray *)padding
{
  NSArray *v4;
  id v5;
  double v6;
  void *v7;

  v4 = padding;
  v5 = objc_alloc((Class)a1);
  LODWORD(v6) = 0;
  v7 = (void *)objc_msgSend(v5, "initWithPaddingType:paddingSizes:constantValue:", 1, v4, v6);

  return (MLCPaddingLayer *)v7;
}

+ (MLCPaddingLayer)layerWithSymmetricPadding:(NSArray *)padding
{
  NSArray *v4;
  id v5;
  double v6;
  void *v7;

  v4 = padding;
  v5 = objc_alloc((Class)a1);
  LODWORD(v6) = 0;
  v7 = (void *)objc_msgSend(v5, "initWithPaddingType:paddingSizes:constantValue:", 2, v4, v6);

  return (MLCPaddingLayer *)v7;
}

+ (MLCPaddingLayer)layerWithZeroPadding:(NSArray *)padding
{
  NSArray *v4;
  id v5;
  double v6;
  void *v7;

  v4 = padding;
  v5 = objc_alloc((Class)a1);
  LODWORD(v6) = 0;
  v7 = (void *)objc_msgSend(v5, "initWithPaddingType:paddingSizes:constantValue:", 0, v4, v6);

  return (MLCPaddingLayer *)v7;
}

+ (MLCPaddingLayer)layerWithConstantPadding:(NSArray *)padding constantValue:(float)constantValue
{
  NSArray *v6;
  id v7;
  double v8;
  void *v9;

  v6 = padding;
  v7 = objc_alloc((Class)a1);
  *(float *)&v8 = constantValue;
  v9 = (void *)objc_msgSend(v7, "initWithPaddingType:paddingSizes:constantValue:", 3, v6, v8);

  return (MLCPaddingLayer *)v9;
}

- (MLCPaddingLayer)initWithPaddingType:(int)a3 paddingSizes:(id)a4 constantValue:(float)a5
{
  id v8;
  MLCPaddingLayer *v9;
  MLCPaddingLayer *v10;
  void *v11;
  uint64_t v12;
  int *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MLCPaddingLayer;
  v9 = -[MLCLayer initWithLabel:](&v19, sel_initWithLabel_, CFSTR("Padding"));
  v10 = v9;
  if (v9)
  {
    v9->_paddingType = a3;
    if (objc_msgSend(v8, "count") == 1)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntegerValue");
      v10->_paddingBottom = v12;
      v10->_paddingRight = v12;
      v10->_paddingTop = v12;
      v13 = &OBJC_IVAR___MLCPaddingLayer__paddingLeft;
    }
    else if (objc_msgSend(v8, "count") == 2)
    {
      v10->_paddingTop = 0;
      v10->_paddingBottom = 0;
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_paddingLeft = objc_msgSend(v14, "unsignedIntegerValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntegerValue");
      v13 = &OBJC_IVAR___MLCPaddingLayer__paddingRight;
    }
    else
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_paddingLeft = objc_msgSend(v15, "unsignedIntegerValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_paddingRight = objc_msgSend(v16, "unsignedIntegerValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_paddingTop = objc_msgSend(v17, "unsignedIntegerValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntegerValue");
      v13 = &OBJC_IVAR___MLCPaddingLayer__paddingBottom;
    }
    *(Class *)((char *)&v10->super.super.isa + *v13) = (Class)v12;

    v10->_constantValue = a5;
  }

  return v10;
}

+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4
{
  if (objc_msgSend(a4, "type"))
    return a3 == 1;
  else
    return ((a3 - 1) & 0xFFFFFFFD) == 0;
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
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  float v32;
  const char *v33;
  NSObject *v34;
  char v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  const char *aSelector;
  SEL aSelectora;
  id v49;
  objc_super v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  _BYTE v54[18];
  __int16 v55;
  NSUInteger v56;
  __int16 v57;
  NSUInteger v58;
  __int16 v59;
  SEL v60;
  __int16 v61;
  unint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "dataType");

  -[MLCPaddingLayer constantValue](self, "constantValue");
  if (!+[MLCTensor canConvertValue:toDataType:](MLCTensor, "canConvertValue:toDataType:", v14))
  {
    +[MLCLog framework](MLCLog, "framework");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCPaddingLayer constantValue](self, "constantValue");
      *(_DWORD *)buf = 138412802;
      v52 = v31;
      v53 = 2048;
      *(double *)v54 = v32;
      *(_WORD *)&v54[8] = 1024;
      *(_DWORD *)&v54[10] = v14;
      v33 = "%@: cannot compile padding layer as specified constant value = %f is too large for data type = %d";
LABEL_12:
      _os_log_error_impl(&dword_1D4999000, v21, OS_LOG_TYPE_ERROR, v33, buf, 0x1Cu);

    }
LABEL_16:
    v35 = 0;
    goto LABEL_17;
  }
  if (!+[MLCPaddingLayer supportsDataType:onDevice:](MLCPaddingLayer, "supportsDataType:onDevice:", v14, v9))
  {
    +[MLCLog framework](MLCLog, "framework");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v52 = v31;
      v53 = 1024;
      *(_DWORD *)v54 = v14;
      *(_WORD *)&v54[4] = 2112;
      *(_QWORD *)&v54[6] = v9;
      v33 = "%@: padding layer with data type = %d is not supported on a device = %@";
      goto LABEL_12;
    }
    goto LABEL_16;
  }
  aSelector = a2;
  v49 = v11;
  objc_msgSend(v9, "computeEngine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MLCPaddingLayer paddingType](self, "paddingType");
  v17 = -[MLCPaddingLayer paddingLeft](self, "paddingLeft");
  v18 = -[MLCPaddingLayer paddingRight](self, "paddingRight");
  v19 = -[MLCPaddingLayer paddingTop](self, "paddingTop");
  v20 = -[MLCPaddingLayer paddingBottom](self, "paddingBottom");
  -[MLCPaddingLayer constantValue](self, "constantValue");
  objc_msgSend(v15, "paddingLayerWithPaddingType:paddingLeft:paddingRight:paddingTop:paddingBottom:constantValue:dataType:", v16, v17, v18, v19, v20, v14);
  v21 = objc_claimAutoreleasedReturnValue();

  if (!v21 || !-[NSObject count](v21, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    v11 = v49;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[MLCPaddingLayer compileForDevice:sourceTensors:resultTensor:].cold.1(aSelector);

    goto LABEL_16;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "descriptor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "shape");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25 == 4)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "descriptor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "shape");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectAtIndexedSubscript:", 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "unsignedIntegerValue");

    v30 = v41;
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "descriptor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "shape");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v25 != 3)
    {
      +[MLCLog framework](MLCLog, "framework");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        -[MLCPaddingLayer compileForDevice:sourceTensors:resultTensor:].cold.2(aSelector, v10);

      goto LABEL_32;
    }
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "descriptor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "shape");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 1;
  }
  v42 = objc_msgSend(v29, "unsignedIntegerValue");

  if (-[MLCPaddingLayer paddingType](self, "paddingType")
    && -[MLCPaddingLayer paddingType](self, "paddingType") != MLCPaddingTypeConstant
    && (v42 <= -[MLCPaddingLayer paddingLeft](self, "paddingLeft")
     || v42 <= -[MLCPaddingLayer paddingRight](self, "paddingRight")
     || v30 <= -[MLCPaddingLayer paddingTop](self, "paddingTop")
     || v30 <= -[MLCPaddingLayer paddingBottom](self, "paddingBottom")))
  {
    +[MLCLog framework](MLCLog, "framework");
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(aSelector);
      aSelectora = (SEL)v42;
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413826;
      v52 = v46;
      v53 = 2048;
      *(_QWORD *)v54 = -[MLCPaddingLayer paddingLeft](self, "paddingLeft");
      *(_WORD *)&v54[8] = 2048;
      *(_QWORD *)&v54[10] = -[MLCPaddingLayer paddingRight](self, "paddingRight");
      v55 = 2048;
      v56 = -[MLCPaddingLayer paddingTop](self, "paddingTop");
      v57 = 2048;
      v58 = -[MLCPaddingLayer paddingBottom](self, "paddingBottom");
      v59 = 2048;
      v60 = aSelectora;
      v61 = 2048;
      v62 = v30;
      _os_log_error_impl(&dword_1D4999000, v45, OS_LOG_TYPE_ERROR, "%@: padding size [%lu, %lu, %lu, %lu] must be less than the source tensor dimension size=[%lu, %lu]", buf, 0x48u);

    }
LABEL_32:
    v35 = 0;
    v11 = v49;
    goto LABEL_17;
  }
  objc_msgSend(v9, "computeEngine");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v43, "compileLayerDeviceOps:sourceTensors:resultTensor:", v21, v10, v49);

  v11 = v49;
  v50.receiver = self;
  v50.super_class = (Class)MLCPaddingLayer;
  -[MLCLayer bindDevice:deviceOps:](&v50, sel_bindDevice_deviceOps_, v9, v21);
LABEL_17:

  return v35;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  char *v6;
  NSUInteger v7;
  NSUInteger v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MLCPaddingLayer;
  v6 = -[MLCLayer resultSizeFromSourceSize:dimension:](&v10, sel_resultSizeFromSourceSize_dimension_, a3);
  if (a4 == 2)
  {
    v7 = -[MLCPaddingLayer paddingTop](self, "paddingTop");
    v8 = -[MLCPaddingLayer paddingBottom](self, "paddingBottom");
    goto LABEL_5;
  }
  if (a4 == 3)
  {
    v7 = -[MLCPaddingLayer paddingLeft](self, "paddingLeft");
    v8 = -[MLCPaddingLayer paddingRight](self, "paddingRight");
LABEL_5:
    v6 += v7 + v8;
  }
  return (unint64_t)v6;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSUInteger v34;
  NSUInteger v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSUInteger v42;
  NSUInteger v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:atIndexedSubscript:", v9, 0);

  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "shape");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:atIndexedSubscript:", v13, 1);

  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "shape");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17 == 4)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "descriptor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "shape");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectAtIndexedSubscript:", 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "unsignedIntegerValue");
    v34 = -[MLCPaddingLayer paddingTop](self, "paddingTop");
    v35 = v34 + -[MLCPaddingLayer paddingBottom](self, "paddingBottom") + v33;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:atIndexedSubscript:", v36, 2);

    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "descriptor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "shape");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectAtIndexedSubscript:", 3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "unsignedIntegerValue");
    v42 = -[MLCPaddingLayer paddingLeft](self, "paddingLeft");
    v43 = v42 + -[MLCPaddingLayer paddingRight](self, "paddingRight") + v41;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v43);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v5;
    v27 = v25;
    v28 = 3;
    goto LABEL_5;
  }
  if (v17 == 3)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "descriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "shape");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedIntegerValue");
    v23 = -[MLCPaddingLayer paddingLeft](self, "paddingLeft");
    v24 = v23 + -[MLCPaddingLayer paddingRight](self, "paddingRight") + v22;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v5;
    v27 = v25;
    v28 = 2;
LABEL_5:
    objc_msgSend(v26, "setObject:atIndexedSubscript:", v27, v28);

  }
  v44 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "descriptor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v44, objc_msgSend(v46, "dataType"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  return v48;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  float v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCPaddingLayer paddingType](self, "paddingType");
  v7 = -[MLCPaddingLayer paddingLeft](self, "paddingLeft");
  v8 = -[MLCPaddingLayer paddingRight](self, "paddingRight");
  v9 = -[MLCPaddingLayer paddingTop](self, "paddingTop");
  v10 = -[MLCPaddingLayer paddingBottom](self, "paddingBottom");
  -[MLCPaddingLayer constantValue](self, "constantValue");
  v12 = v11;
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { paddingType=%d, paddingLeft=%lu, paddingRight=%lu, paddingTop=%lu, paddingBottom=%lu, constantValue=%f, conditionalTreeNode=%@, resultTensor = %@ }"), v5, v6, v7, v8, v9, v10, *(_QWORD *)&v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)summarizedDOTDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSUInteger v6;
  void *v7;
  float v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCLayer layerID](self, "layerID");
  MLCPaddingTypeDebugDescription(-[MLCPaddingLayer paddingType](self, "paddingType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCPaddingLayer constantValue](self, "constantValue");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Padding Type: %@     Constant Value: %.03f<BR />Padding Left: %lu    Padding Right: %lu<BR />Padding Top: %lu     Padding Bottom: %lu</FONT>>"), v5, v6, v7, v8, -[MLCPaddingLayer paddingLeft](self, "paddingLeft"), -[MLCPaddingLayer paddingRight](self, "paddingRight"), -[MLCPaddingLayer paddingTop](self, "paddingTop"), -[MLCPaddingLayer paddingBottom](self, "paddingBottom"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "descriptor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shape");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      v9 = v8 > 2;
      if (v8 <= 2)
        break;
      ++v4;
    }
    while (v4 < objc_msgSend(v3, "count"));
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[MLCPaddingLayer paddingType](self, "paddingType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MLCPaddingLayer paddingLeft](self, "paddingLeft"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MLCPaddingLayer paddingRight](self, "paddingRight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MLCPaddingLayer paddingTop](self, "paddingTop"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MLCPaddingLayer paddingBottom](self, "paddingBottom"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCPaddingLayer constantValue](self, "constantValue");
  v11 = (void *)objc_msgSend(v4, "initWithPaddingType:paddingSizes:constantValue:", v5, v10);

  return v11;
}

- (MLCPaddingType)paddingType
{
  return self->_paddingType;
}

- (NSUInteger)paddingLeft
{
  return self->_paddingLeft;
}

- (NSUInteger)paddingRight
{
  return self->_paddingRight;
}

- (NSUInteger)paddingTop
{
  return self->_paddingTop;
}

- (NSUInteger)paddingBottom
{
  return self->_paddingBottom;
}

- (float)constantValue
{
  return self->_constantValue;
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failure to create deviceOps=%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4_1();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.2(const char *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v4, v5, "%@: Source tensor shape not supported=%@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_4_1();
}

@end
