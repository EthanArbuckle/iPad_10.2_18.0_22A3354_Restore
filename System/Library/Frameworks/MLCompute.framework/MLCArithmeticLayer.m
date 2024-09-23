@implementation MLCArithmeticLayer

- (BOOL)skipGradientComputationForSourceTensor:(id)a3 resultTensor:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  void *v26;
  void *v27;
  unint64_t v28;
  id v30;

  v30 = a3;
  v6 = a4;
  if (-[MLCArithmeticLayer operation](self, "operation")
    && -[MLCArithmeticLayer operation](self, "operation") != MLCArithmeticOperationSubtract)
  {
    goto LABEL_9;
  }
  objc_msgSend(v6, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  objc_msgSend(v30, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v9 == v12)
  {
    objc_msgSend(v6, "descriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shape");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      v16 = 0;
      do
      {
        objc_msgSend(v6, "descriptor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "shape");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "unsignedIntegerValue");
        objc_msgSend(v30, "descriptor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "shape");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", v16);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "unsignedIntegerValue");

        v25 = v20 == v24;
        if (v20 != v24)
          break;
        ++v16;
        objc_msgSend(v6, "descriptor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "shape");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count");

      }
      while (v16 < v28);
    }
    else
    {
      v25 = 1;
    }
  }
  else
  {
LABEL_9:
    v25 = 0;
  }

  return v25;
}

+ (MLCArithmeticLayer)layerWithOperation:(MLCArithmeticOperation)operation
{
  return (MLCArithmeticLayer *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithArithmeticOperation:", *(_QWORD *)&operation);
}

- (MLCArithmeticLayer)initWithArithmeticOperation:(int)a3
{
  MLCArithmeticLayer *result;
  BOOL v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MLCArithmeticLayer;
  result = -[MLCLayer initWithLabel:](&v6, sel_initWithLabel_, CFSTR("Arithmetic"));
  if (result)
  {
    result->_operation = a3;
    if (a3 > 0x1D || (v5 = 1, ((1 << a3) & 0x3C20000F) == 0))
      v5 = 0;
    result->_binaryOperation = v5;
  }
  return result;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  MLCArithmeticOperation v17;
  NSObject *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char isKindOfClass;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  _BOOL4 v39;
  NSObject *v40;
  objc_super v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  int v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "count");
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    while (1)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "descriptor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "dataType");

      if (!+[MLCLayer supportsDataType:onDevice:](MLCArithmeticLayer, "supportsDataType:onDevice:", v16, v8))break;
      if (v12 == ++v13)
        goto LABEL_5;
    }
    +[MLCLog framework](MLCLog, "framework");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v45 = v19;
      v46 = 2048;
      v47 = v13;
      v48 = 1024;
      v49 = v16;
      v50 = 2112;
      v51 = v8;
      _os_log_error_impl(&dword_1D4999000, v18, OS_LOG_TYPE_ERROR, "%@: sourceTensor[%lu] uses unsupported data type = %d on a device = %@", buf, 0x26u);

    }
    goto LABEL_15;
  }
LABEL_5:
  v17 = -[MLCArithmeticLayer operation](self, "operation");
  if (v17 > MLCArithmeticOperationMax)
  {
    +[MLCLog framework](MLCLog, "framework");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MLCArithmeticLayer compileForDevice:sourceTensors:resultTensor:].cold.1(a2);
    goto LABEL_15;
  }
  if (((1 << v17) & 0x3DFFFF0) != 0)
  {
    if (objc_msgSend(v9, "count") != 1)
    {
      +[MLCLog framework](MLCLog, "framework");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[MLCArithmeticLayer compileForDevice:sourceTensors:resultTensor:].cold.4(a2);
LABEL_15:
      v20 = 0;
      goto LABEL_31;
    }
  }
  else if ((unint64_t)objc_msgSend(v9, "count") <= 1)
  {
    +[MLCLog framework](MLCLog, "framework");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MLCArithmeticLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2);
    goto LABEL_15;
  }
  -[MLCLayer fusedLayers](self, "fusedLayers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "count");

  if (v22)
  {
    -[MLCLayer fusedLayers](self, "fusedLayers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[MLCLayer fusedLayers](self, "fusedLayers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v27, "descriptor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "computeEngine");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "arithmeticLayerWithOperation:activationDescriptor:", objc_msgSend(v27, "operation"), 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "computeEngine");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCLayer fusedLayers](self, "fusedLayers");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "sourceTensors");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "compileLayerDeviceOps:sourceTensors:resultTensor:", v29, v33, v10);

      objc_msgSend(v27, "bindDevice:deviceOps:", v8, v29);
      v22 = 0;
    }

  }
  objc_msgSend(v8, "computeEngine");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "arithmeticLayerWithOperation:activationDescriptor:", -[MLCArithmeticLayer operation](self, "operation"), v22);
  v18 = objc_claimAutoreleasedReturnValue();

  if (v18 && -[NSObject count](v18, "count"))
  {
    objc_msgSend(v8, "computeEngine");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v35, "compileLayerDeviceOps:sourceTensors:resultTensor:", v18, v9, v10);

    v43.receiver = self;
    v43.super_class = (Class)MLCArithmeticLayer;
    -[MLCLayer bindDevice:deviceOps:](&v43, sel_bindDevice_deviceOps_, v8, v18);
    if (objc_msgSend(v9, "count") == 2)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[MLCArithmeticLayer skipGradientComputationForSourceTensor:resultTensor:](self, "skipGradientComputationForSourceTensor:resultTensor:", v36, v10);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[MLCArithmeticLayer skipGradientComputationForSourceTensor:resultTensor:](self, "skipGradientComputationForSourceTensor:resultTensor:", v38, v10);

      if (v37 && v39)
        -[MLCLayer setAllocateGradientTensors:](self, "setAllocateGradientTensors:", 0);
    }
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2, (uint64_t)v18, v40);

    v20 = 0;
  }

LABEL_31:
  return v20;
}

- (unint64_t)deviceMemorySizeWithOptimizer:(id)a3 device:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;

  v5 = a4;
  -[MLCLayer sourceTensors](self, "sourceTensors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MLCArithmeticLayer skipGradientComputationForSourceTensor:resultTensor:](self, "skipGradientComputationForSourceTensor:resultTensor:", v7, v9);

  -[MLCLayer sourceTensors](self, "sourceTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 == 2)
  {
    -[MLCLayer sourceTensors](self, "sourceTensors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCLayer resultTensors](self, "resultTensors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MLCArithmeticLayer skipGradientComputationForSourceTensor:resultTensor:](self, "skipGradientComputationForSourceTensor:resultTensor:", v14, v16);

  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v5, "computeEngine");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v18, "deviceMemorySizeForTensor:", v20);

  v22 = 0;
  if (-[MLCLayer isTrainable](self, "isTrainable"))
  {
    -[MLCLayer intermediateGradientTensors](self, "intermediateGradientTensors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      -[MLCLayer intermediateGradientTensors](self, "intermediateGradientTensors");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");

      if (v26)
      {
        v27 = 0;
        v22 = 0;
        do
        {
          objc_msgSend(v5, "computeEngine");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCLayer intermediateGradientTensors](self, "intermediateGradientTensors");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectAtIndexedSubscript:", v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v22 += objc_msgSend(v28, "deviceMemorySizeForTensor:", v30);

          ++v27;
          -[MLCLayer intermediateGradientTensors](self, "intermediateGradientTensors");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "count");

        }
        while (v27 < v32);
      }
      else
      {
        v22 = 0;
      }
    }
    else
    {
      -[MLCLayer sourceGradientTensors](self, "sourceGradientTensors");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "sharedMemoryTensor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = 0;
      if (!v35)
      {
        objc_msgSend(v5, "computeEngine");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayer sourceGradientTensors](self, "sourceGradientTensors");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v36, "deviceMemorySizeForTensor:", v38);

      }
    }
  }
  v39 = v22 + v21;
  if (-[MLCLayer isTrainable](self, "isTrainable"))
  {
    if (objc_msgSend(v5, "type"))
    {
      if (v10)
      {
        objc_msgSend(v5, "computeEngine");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayer sourceGradientTensors](self, "sourceGradientTensors");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v39 -= objc_msgSend(v40, "deviceMemorySizeForTensor:", v42);

      }
      if (v17)
      {
        objc_msgSend(v5, "computeEngine");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayer sourceGradientTensors](self, "sourceGradientTensors");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v39 -= objc_msgSend(v43, "deviceMemorySizeForTensor:", v45);
LABEL_21:

      }
    }
    else if (v10 && v17)
    {
      objc_msgSend(v5, "computeEngine");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCLayer sourceGradientTensors](self, "sourceGradientTensors");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "objectAtIndexedSubscript:", 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v46, "deviceMemorySizeForTensor:", v48);

      objc_msgSend(v5, "computeEngine");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCLayer sourceGradientTensors](self, "sourceGradientTensors");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v39 -= v49 + objc_msgSend(v43, "deviceMemorySizeForTensor:", v45);
      goto LABEL_21;
    }
  }

  return v39;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)MLCArithmeticLayer;
  -[MLCLayer resultTensorsFromBroadcastableSources:resultTensorDataType:](&v9, sel_resultTensorsFromBroadcastableSources_resultTensorDataType_, v4, objc_msgSend(v6, "dataType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCArithmeticLayer operation](self, "operation");
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { operation=%d : conditionalTreeNode=%@ : resultTensor=%@ }"), v5, v6, v7, v8);
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCLayer layerID](self, "layerID");
  MLCArithmeticOperationDebugDescription(-[MLCArithmeticLayer operation](self, "operation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Operation: %@<BR /></FONT>>"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;

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

      if (v8 > 1)
        goto LABEL_10;
    }
    while (++v4 < (unint64_t)objc_msgSend(v3, "count"));
  }
  if (!objc_msgSend(v3, "count"))
  {
LABEL_10:
    v14 = 1;
    goto LABEL_11;
  }
  v9 = 0;
  do
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "descriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shape");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    v14 = v13 == 1;
    if (v13 != 1)
      break;
    ++v9;
  }
  while (v9 < objc_msgSend(v3, "count"));
LABEL_11:

  return v14;
}

- (MLCArithmeticOperation)operation
{
  return self->_operation;
}

- (BOOL)binaryOperation
{
  return self->_binaryOperation;
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: invalid arithmetic operation", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: binary arithmetic operation needs two source tensors", v4, v5, v6, v7, v8);

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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: unary arithmetic operation needs one source tensor", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
