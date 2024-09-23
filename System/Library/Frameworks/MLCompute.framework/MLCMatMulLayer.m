@implementation MLCMatMulLayer

+ (MLCMatMulLayer)layerWithDescriptor:(MLCMatMulDescriptor *)descriptor
{
  MLCMatMulDescriptor *v4;
  void *v5;

  v4 = descriptor;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v4);

  return (MLCMatMulLayer *)v5;
}

- (MLCMatMulLayer)initWithDescriptor:(id)a3
{
  id v5;
  MLCMatMulLayer *v6;
  MLCMatMulLayer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLCMatMulLayer;
  v6 = -[MLCLayer initWithLabel:](&v9, sel_initWithLabel_, CFSTR("MatMul"));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_descriptor, a3);

  return v7;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  MLCMatMulLayer *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  unint64_t v31;
  void *v32;
  unint64_t v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  MLCMatMulLayer *v45;
  void *v46;
  void *v47;
  char v48;
  NSObject *v50;
  void *v51;
  NSObject *v52;
  const char *v53;
  MLCMatMulLayer *v54;
  objc_super v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  int v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v10)
  {
    +[MLCLog framework](MLCLog, "framework");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MLCMatMulLayer compileForDevice:sourceTensors:resultTensor:].cold.1(a2);
    goto LABEL_31;
  }
  if (!v11)
  {
    +[MLCLog framework](MLCLog, "framework");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MLCMatMulLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2);
    goto LABEL_31;
  }
  v54 = self;
  v13 = objc_msgSend(v10, "count");
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    while (1)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "descriptor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "dataType");

      if (!+[MLCLayer supportsDataType:onDevice:](MLCMatMulLayer, "supportsDataType:onDevice:", v18, v9))
        break;
      if (v14 == ++v15)
        goto LABEL_7;
    }
    +[MLCLog framework](MLCLog, "framework");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v57 = v51;
      v58 = 2048;
      v59 = v15;
      v60 = 1024;
      v61 = v18;
      v62 = 2112;
      v63 = v9;
      _os_log_error_impl(&dword_1D4999000, v19, OS_LOG_TYPE_ERROR, "%@: sourceTensor[%lu] uses unsupported data type = %d on a device = %@", buf, 0x26u);

    }
    goto LABEL_31;
  }
LABEL_7:
  if ((unint64_t)objc_msgSend(v10, "count") > 1)
  {
    v53 = a2;
    v20 = v54;
    -[MLCMatMulLayer resultTensorFromSources:](v54, "resultTensorFromSources:", v10);
    v21 = objc_claimAutoreleasedReturnValue();
    v19 = v21;
    if (!v21)
      goto LABEL_33;
    -[NSObject descriptor](v21, "descriptor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "shape");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "descriptor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "shape");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v23, "isEqualToArray:", v25);

    if ((v26 & 1) != 0)
    {
      if (objc_msgSend(v10, "count") == 3)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "descriptor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "shape");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "mutableCopy");

        v31 = -[NSObject count](v30, "count");
        objc_msgSend(v12, "descriptor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "dimensionCount");

        if (v31 < v33)
        {
          do
          {
            -[NSObject insertObject:atIndex:](v30, "insertObject:atIndex:", &unk_1E9844650, 0);
            ++v31;
            objc_msgSend(v12, "descriptor");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "dimensionCount");

          }
          while (v31 < v35);
        }
        objc_msgSend(v12, "descriptor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "shape");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v37, "count"))
        {
          v38 = 0;
          while (1)
          {
            -[NSObject objectAtIndexedSubscript:](v30, "objectAtIndexedSubscript:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "unsignedIntegerValue");

            objc_msgSend(v37, "objectAtIndexedSubscript:", v38);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "unsignedIntegerValue");

            if (v42 != 1 && v40 != 1 && v40 != v42)
              break;
            if (++v38 >= (unint64_t)objc_msgSend(v37, "count"))
              goto LABEL_25;
          }
          +[MLCLog framework](MLCLog, "framework");
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            -[MLCMatMulLayer compileForDevice:sourceTensors:resultTensor:].cold.6(v53);

          goto LABEL_35;
        }
LABEL_25:

        v20 = v54;
      }
      objc_msgSend(v9, "computeEngine");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCMatMulLayer descriptor](v20, "descriptor");
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = v20;
      v46 = (void *)v44;
      objc_msgSend(v43, "matMulLayerWithDescriptor:sourceTensors:resultTensor:inferenceOnly:", v44, v10, v12, -[MLCLayer compileForInferenceOnly](v45, "compileForInferenceOnly"));
      v30 = objc_claimAutoreleasedReturnValue();

      if (v30 && -[NSObject count](v30, "count"))
      {
        objc_msgSend(v9, "computeEngine");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "compileLayerDeviceOps:sourceTensors:resultTensor:", v30, v10, v12);

        v55.receiver = v54;
        v55.super_class = (Class)MLCMatMulLayer;
        -[MLCLayer bindDevice:deviceOps:](&v55, sel_bindDevice_deviceOps_, v9, v30);
LABEL_36:

        goto LABEL_32;
      }
      +[MLCLog framework](MLCLog, "framework");
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:].cold.2(v53, (uint64_t)v30, v50);

    }
    else
    {
LABEL_33:
      +[MLCLog framework](MLCLog, "framework");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[MLCMatMulLayer compileForDevice:sourceTensors:resultTensor:].cold.4(v53);
    }
LABEL_35:
    v48 = 0;
    goto LABEL_36;
  }
  +[MLCLog framework](MLCLog, "framework");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[MLCMatMulLayer compileForDevice:sourceTensors:resultTensor:].cold.3(a2);
LABEL_31:
  v48 = 0;
LABEL_32:

  return v48;
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
  unint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t i;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v62;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  v13 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v14 = objc_msgSend(v8, "count");
  if (v14 <= objc_msgSend(v12, "count"))
    v15 = v12;
  else
    v15 = v8;
  v16 = objc_msgSend(v15, "count");
  v17 = objc_msgSend(v8, "count");
  v18 = v16 - v17;
  if (v16 > v17)
  {
    do
    {
      objc_msgSend(v8, "insertObject:atIndex:", &unk_1E9844650, 0);
      --v18;
    }
    while (v18);
  }
  v19 = objc_msgSend(v12, "count");
  v20 = v16 - v19;
  if (v16 > v19)
  {
    do
    {
      objc_msgSend(v12, "insertObject:atIndex:", &unk_1E9844650, 0);
      --v20;
    }
    while (v20);
  }
  if (v16)
  {
    for (i = 0; i != v16; ++i)
      objc_msgSend(v13, "setObject:atIndexedSubscript:", &unk_1E9844650, i);
  }
  v22 = v16 - 1;
  objc_msgSend(v8, "objectAtIndexedSubscript:", v16 - 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v23, "unsignedIntegerValue");

  v24 = v16 - 2;
  objc_msgSend(v12, "objectAtIndexedSubscript:", v16 - 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v25, "unsignedIntegerValue");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v26, "unsignedIntegerValue");

  objc_msgSend(v12, "objectAtIndexedSubscript:", v22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "unsignedIntegerValue");

  -[MLCMatMulLayer descriptor](self, "descriptor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v4;
  if ((objc_msgSend(v29, "transposesX") & 1) != 0)
  {
    -[MLCMatMulLayer descriptor](self, "descriptor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "transposesY");

    if (v31)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v24);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "unsignedIntegerValue");

      objc_msgSend(v12, "objectAtIndexedSubscript:", v22);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "unsignedIntegerValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", v22);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "unsignedIntegerValue");

      objc_msgSend(v12, "objectAtIndexedSubscript:", v24);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v38, "unsignedIntegerValue");
LABEL_19:

      goto LABEL_20;
    }
  }
  else
  {

  }
  -[MLCMatMulLayer descriptor](self, "descriptor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "transposesX");

  if (v40)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v24);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v41, "unsignedIntegerValue");

    objc_msgSend(v8, "objectAtIndexedSubscript:", v22);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v38, "unsignedIntegerValue");
    v35 = v66;
    goto LABEL_19;
  }
  -[MLCMatMulLayer descriptor](self, "descriptor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "transposesY");

  if (v43)
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", v22);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v44, "unsignedIntegerValue");

    objc_msgSend(v12, "objectAtIndexedSubscript:", v24);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v38, "unsignedIntegerValue");
    v37 = v64;
    v33 = v65;
    goto LABEL_19;
  }
  v33 = v65;
  v35 = v66;
  v37 = v64;
LABEL_20:
  if (v33 != v35)
  {
    +[MLCLog framework](MLCLog, "framework");
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      -[MLCMatMulLayer resultTensorFromSources:].cold.1(a2);
LABEL_36:

    v59 = 0;
    v55 = v67;
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:atIndexedSubscript:", v45, v22);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v37);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:atIndexedSubscript:", v46, v24);

  if (v24)
  {
    v47 = 0;
    while (1)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "unsignedIntegerValue");

      objc_msgSend(v12, "objectAtIndexedSubscript:", v47);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "unsignedIntegerValue");

      if (v51 != 1 && v49 != 1 && v49 != v51)
        break;
      if (v49 == 1)
        v52 = v51;
      else
        v52 = v49;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v53, v47);

      if (v24 == ++v47)
        goto LABEL_30;
    }
    +[MLCLog framework](MLCLog, "framework");
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v69 = v62;
      v70 = 2048;
      v71 = v49;
      v72 = 2048;
      v73 = v51;
      _os_log_error_impl(&dword_1D4999000, v60, OS_LOG_TYPE_ERROR, "%@: the shapes of source tensors do not allow broadcast, [%lu] != [%lu]", buf, 0x20u);

    }
    goto LABEL_36;
  }
LABEL_30:
  v54 = (void *)objc_msgSend(v13, "copy");
  v55 = v67;
  objc_msgSend(v67, "objectAtIndexedSubscript:", 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "descriptor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v54, objc_msgSend(v57, "dataType"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_37:
  return v59;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  uint64_t v4;
  char v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v4 = 0;
  v5 = 1;
  do
  {
    v6 = v5;
    objc_msgSend(a3, "objectAtIndexedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "descriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shape");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 < 2)
      break;
    v5 = 0;
    v4 = 1;
  }
  while ((v6 & 1) != 0);
  return v10 > 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCMatMulLayer descriptor](self, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { descriptor=%@ : resultTensor=%@ }"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)summarizedDOTDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSUInteger v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCLayer layerID](self, "layerID");
  -[MLCMatMulLayer descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alpha");
  v9 = v8;
  -[MLCMatMulLayer descriptor](self, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "transposesX");
  -[MLCMatMulLayer descriptor](self, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Alpha: %.03f<BR />Transposes X: %hhd    Transposes Y: %hhd</FONT>>"), v5, v6, *(_QWORD *)&v9, v11, objc_msgSend(v12, "transposesY"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (MLCMatMulDescriptor)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
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
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: no source tensors specified", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.2(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: no result tensor specified", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.3(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: source tensor array must be of size 2", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.4(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: failure to compile matmul layer", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.6(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: bias tensor is not broadcastable to matmul result tensor", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)resultTensorFromSources:(const char *)a1 .cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: the inner dimension of the last two indices of the source tensors does not match", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
