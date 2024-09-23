@implementation MLCSliceLayer

+ (MLCSliceLayer)sliceLayerWithStart:(NSArray *)start end:(NSArray *)end stride:(NSArray *)stride
{
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  void *v11;

  v8 = stride;
  v9 = end;
  v10 = start;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initSliceLayerWithStart:end:stride:", v10, v9, v8);

  return (MLCSliceLayer *)v11;
}

- (id)initSliceLayerWithStart:(id)a3 end:(id)a4 stride:(id)a5
{
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  unint64_t v26;
  MLCSliceLayer *v27;
  id *p_isa;
  NSObject *v29;
  MLCSliceLayer *v30;
  id obj;
  id v33;
  MLCSliceLayer *v34;
  const char *v35;
  objc_super v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v10, "count");
  if (v13 != objc_msgSend(v11, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[MLCSliceLayer initSliceLayerWithStart:end:stride:].cold.4(a2);
    goto LABEL_28;
  }
  if (v12)
  {
    v14 = -[NSObject count](v12, "count");
    if (v14 != objc_msgSend(v11, "count"))
    {
      +[MLCLog framework](MLCLog, "framework");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[MLCSliceLayer initSliceLayerWithStart:end:stride:].cold.3(a2);
      goto LABEL_28;
    }
  }
  v33 = a4;
  v34 = self;
  v35 = a2;
  if (!objc_msgSend(v10, "count", a3))
  {
LABEL_10:
    self = v34;
    if (!v12 || !objc_msgSend(v10, "count"))
    {
LABEL_15:
      v25 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      if (objc_msgSend(v10, "count"))
      {
        v26 = 0;
        do
        {
          -[NSObject addObject:](v25, "addObject:", &unk_1E98444D0);
          ++v26;
        }
        while (v26 < objc_msgSend(v10, "count"));
      }
      v36.receiver = v34;
      v36.super_class = (Class)MLCSliceLayer;
      v27 = -[MLCLayer initWithLabel:](&v36, sel_initWithLabel_, CFSTR("Slice"));
      p_isa = (id *)&v27->super.super.isa;
      if (v27)
      {
        objc_storeStrong((id *)&v27->_start, obj);
        objc_storeStrong(p_isa + 26, v33);
        if (v12)
          v29 = v12;
        else
          v29 = v25;
        objc_storeStrong(p_isa + 27, v29);
      }
      self = p_isa;
      v30 = self;
      goto LABEL_29;
    }
    v22 = 0;
    while (1)
    {
      -[NSObject objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "integerValue");

      if (v24 <= 0)
        break;
      if (++v22 >= (unint64_t)objc_msgSend(v10, "count"))
        goto LABEL_15;
    }
    +[MLCLog framework](MLCLog, "framework");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[MLCSliceLayer initSliceLayerWithStart:end:stride:].cold.1(v35);
LABEL_28:
    v30 = 0;
    goto LABEL_29;
  }
  v15 = 0;
  while (1)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "integerValue") < 0)
      break;
    objc_msgSend(v11, "objectAtIndexedSubscript:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "integerValue") <= 0)
    {

      break;
    }
    objc_msgSend(v11, "objectAtIndexedSubscript:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "unsignedIntegerValue");
    objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "unsignedIntegerValue");

    if (v19 <= v21)
      goto LABEL_32;
    if (++v15 >= (unint64_t)objc_msgSend(v10, "count"))
      goto LABEL_10;
  }

LABEL_32:
  +[MLCLog framework](MLCLog, "framework");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    -[MLCSliceLayer initSliceLayerWithStart:end:stride:].cold.2(v35);
  v30 = 0;
  self = v34;
LABEL_29:

  return v30;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  unint64_t v51;
  void *v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  unint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  char v68;
  void *v69;
  NSObject *v71;
  void *v72;
  id v73;
  MLCSliceLayer *v74;
  objc_super v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  int v79;
  __int16 v80;
  id v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v73 = a5;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "dimensionCount");
  v74 = self;
  -[MLCSliceLayer start](self, "start");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v13 != v15)
  {
    +[MLCLog framework](MLCLog, "framework");
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      -[MLCSliceLayer compileForDevice:sourceTensors:resultTensor:].cold.5(a2);
    goto LABEL_24;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "descriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "dataType");

  if (!+[MLCLayer supportsDataType:onDevice:](MLCSliceLayer, "supportsDataType:onDevice:", v18, v9))
  {
    +[MLCLog framework](MLCLog, "framework");
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v77 = v69;
      v78 = 1024;
      v79 = v18;
      v80 = 2112;
      v81 = v9;
      _os_log_error_impl(&dword_1D4999000, v66, OS_LOG_TYPE_ERROR, "%@: slice layer with data type = %d is not supported on a device = %@", buf, 0x1Cu);

    }
LABEL_24:
    v68 = 0;
    v52 = v73;
    goto LABEL_25;
  }
  v72 = v9;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "descriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "dimensionCount");

  if (v21 >= 2)
  {
    v22 = 1;
    while (1)
    {
      -[MLCSliceLayer end](v74, "end");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "unsignedIntegerValue");
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "descriptor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "shape");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndexedSubscript:", v22);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "unsignedIntegerValue");

      if (v25 > v30)
        break;
      ++v22;
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "descriptor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "dimensionCount");

      if (v22 >= v33)
        goto LABEL_7;
    }
    +[MLCLog framework](MLCLog, "framework");
    v66 = objc_claimAutoreleasedReturnValue();
    v9 = v72;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      -[MLCSliceLayer compileForDevice:sourceTensors:resultTensor:].cold.1();
    goto LABEL_24;
  }
LABEL_7:
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "descriptor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "dimensionCount");

  if (v36 < 2)
  {
LABEL_11:
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "descriptor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "dimensionCount");

    v52 = v73;
    if (v51 < 2)
    {
LABEL_15:
      objc_msgSend(v72, "computeEngine");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCSliceLayer start](v74, "start");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCSliceLayer end](v74, "end");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCSliceLayer stride](v74, "stride");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "sliceLayerWithbegin:end:stride:inferenceOnly:", v63, v64, v65, -[MLCLayer compileForInferenceOnly](v74, "compileForInferenceOnly"));
      v66 = objc_claimAutoreleasedReturnValue();

      if (v66 && -[NSObject count](v66, "count"))
      {
        v9 = v72;
        objc_msgSend(v72, "computeEngine");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v67, "compileLayerDeviceOps:sourceTensors:resultTensor:", v66, v10, v73);

        v75.receiver = v74;
        v75.super_class = (Class)MLCSliceLayer;
        -[MLCLayer bindDevice:deviceOps:](&v75, sel_bindDevice_deviceOps_, v72, v66);
        goto LABEL_25;
      }
      +[MLCLog framework](MLCLog, "framework");
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        -[MLCBatchNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.1();

    }
    else
    {
      v53 = 1;
      while (1)
      {
        v54 = -[MLCSliceLayer resultSizeForDimension:](v74, "resultSizeForDimension:", v53);
        objc_msgSend(v73, "descriptor");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "shape");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "objectAtIndexedSubscript:", v53);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "unsignedIntegerValue");

        if (v54 != v58)
          break;
        ++v53;
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "descriptor");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "dimensionCount");

        if (v53 >= v61)
          goto LABEL_15;
      }
      +[MLCLog framework](MLCLog, "framework");
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        -[MLCSliceLayer compileForDevice:sourceTensors:resultTensor:].cold.4();
    }
    v68 = 0;
    v9 = v72;
    goto LABEL_25;
  }
  v37 = 1;
  while (1)
  {
    -[MLCSliceLayer start](v74, "start");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectAtIndexedSubscript:", v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "unsignedIntegerValue");
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "descriptor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "shape");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectAtIndexedSubscript:", v37);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "unsignedIntegerValue") - 1;

    if (v40 > v45)
      break;
    ++v37;
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "descriptor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "dimensionCount");

    if (v37 >= v48)
      goto LABEL_11;
  }
  +[MLCLog framework](MLCLog, "framework");
  v66 = objc_claimAutoreleasedReturnValue();
  v9 = v72;
  v52 = v73;
  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    -[MLCSliceLayer compileForDevice:sourceTensors:resultTensor:].cold.2();
  v68 = 0;
LABEL_25:

  return v68;
}

- (unint64_t)resultSizeForDimension:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;

  -[MLCSliceLayer stride](self, "stride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");
  if (v7 >= 0)
    v8 = v7;
  else
    v8 = -v7;

  -[MLCSliceLayer end](self, "end");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");
  -[MLCSliceLayer start](self, "start");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (v11 + ~objc_msgSend(v13, "unsignedIntegerValue")) / v8 + 1;

  return v14;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4;
  void *v5;
  unint64_t i;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  for (i = 0; ; ++i)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "descriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shape");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (i >= v10)
      break;
    v11 = -[MLCSliceLayer resultSizeForDimension:](self, "resultSizeForDimension:", i);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:atIndexedSubscript:", v12, i);

  }
  v13 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v13, objc_msgSend(v15, "dataType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)isStaticBatchSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  -[MLCLayer sourceTensors](self, "sourceTensors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  -[MLCLayer resultTensors](self, "resultTensors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = v7 == objc_msgSend(v12, "unsignedIntegerValue");

  return v7;
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
  -[MLCSliceLayer start](self, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCSliceLayer end](self, "end");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCSliceLayer stride](self, "stride");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { start=%@ : end=%@ : stride=%@ }"), v5, v6, v7, v8);
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
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCLayer layerID](self, "layerID");
  -[MLCSliceLayer start](self, "start");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCSliceLayer end](self, "end");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCSliceLayer stride](self, "stride");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Start: %@    End: %@<BR />Stride: %@</FONT>>"), v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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

      v9 = v8 > 1;
      if (v8 <= 1)
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

- (NSArray)start
{
  return self->_start;
}

- (NSArray)end
{
  return self->_end;
}

- (NSArray)stride
{
  return self->_stride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stride, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

- (void)initSliceLayerWithStart:(const char *)a1 end:stride:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: error: stride must be greater than zero at each dimension", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initSliceLayerWithStart:(const char *)a1 end:stride:.cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: error: start and end vectors must be non negative and the end vector must be greater than the start vector at each dimension", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initSliceLayerWithStart:(const char *)a1 end:stride:.cold.3(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: error: stride, start and end vector must have the same dimension", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initSliceLayerWithStart:(const char *)a1 end:stride:.cold.4(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: error: start and end vector must have the same dimension", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: error: the end vector at index [%lu] is greater than the size of the input tensor", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.2()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: error: the start vector at index [%lu] should not be greater than the size of the input tensor minus 1", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.4()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: error: the result tensor size does not match the size of slicing at index [%lu]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.5(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: error: the source tensor size does not match the start and end tensors", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
