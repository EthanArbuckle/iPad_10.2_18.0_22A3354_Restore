@implementation _MLCCPUGramMatrix

- (_MLCCPUGramMatrix)initWithDevice:(id)a3 scale:(float)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _MLCCPUGramMatrix *v15;
  objc_super v17;
  _OWORD v18[11];
  _OWORD v19[11];
  _OWORD v20[22];
  uint64_t v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v21 = 0;
  memset(v20, 0, sizeof(v20));
  *(float *)v20 = a4;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v20, 360);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v19, 0, sizeof(v19));
  memset(v18, 0, sizeof(v18));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v19, 176);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v18, 176);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", 19, v8, v11, v12, 0, 0, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v7, "addObject:", v13);
  v14 = (void *)objc_msgSend(v7, "copy");
  v17.receiver = self;
  v17.super_class = (Class)_MLCCPUGramMatrix;
  v15 = -[_MLCCPULayer initWithDevice:deviceOps:](&v17, sel_initWithDevice_deviceOps_, v6, v14);

  return v15;
}

+ (id)layerWithDevice:(id)a3 scale:(float)a4
{
  id v6;
  id v7;
  double v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  *(float *)&v8 = a4;
  v9 = (void *)objc_msgSend(v7, "initWithDevice:scale:", v6, v8);

  return v9;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  int v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  unint64_t v45;
  NSObject *v46;
  BOOL v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  id v67;
  BNNSFilterParameters filter_params;

  v8 = 65552;
  v9 = a5;
  v10 = a6;
  objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "params");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend(v12, "bytes");
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "dataType");

  v17 = 65568;
  if (v16 == 1)
  {
    v67 = v12;
    v18 = 4;
LABEL_5:
    *(_DWORD *)(v13 + 152) = v17;
    *(_DWORD *)(v13 + 12) = 196608;
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "descriptor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "shape");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(v13 + 16) = objc_msgSend(v22, "unsignedIntegerValue");

    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "descriptor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "shape");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(v13 + 24) = objc_msgSend(v26, "unsignedIntegerValue");

    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "descriptor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "shape");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndexedSubscript:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(v13 + 32) = objc_msgSend(v30, "unsignedIntegerValue");

    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "descriptor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stride");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndexedSubscript:", 3);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(v13 + 80) = objc_msgSend(v34, "unsignedIntegerValue") / v18;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "descriptor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stride");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectAtIndexedSubscript:", 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(v13 + 88) = objc_msgSend(v38, "unsignedIntegerValue") / v18;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "descriptor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stride");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectAtIndexedSubscript:", 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(v13 + 96) = objc_msgSend(v42, "unsignedIntegerValue") / v18;

    *(_QWORD *)(v13 + 172) = 1065353216;
    objc_msgSend(v10, "descriptor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "dataType");

    if (v44 == 1)
    {
      v45 = 4;
      v8 = 65568;
    }
    else
    {
      if (v44 != 3)
      {
        +[MLCLog framework](MLCLog, "framework");
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          +[_MLCCPUGramMatrix compileWithDevice:deviceOps:sourceTensors:resultTensor:].cold.2(a2, v10);

        v47 = 0;
        goto LABEL_18;
      }
      v45 = 2;
    }
    *(_DWORD *)(v13 + 328) = v8;
    *(_DWORD *)(v13 + 188) = 163840;
    objc_msgSend(v10, "descriptor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "shape");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "objectAtIndexedSubscript:", 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(v13 + 192) = objc_msgSend(v50, "unsignedIntegerValue");

    objc_msgSend(v10, "descriptor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "shape");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectAtIndexedSubscript:", 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(v13 + 200) = objc_msgSend(v53, "unsignedIntegerValue");

    *(_QWORD *)(v13 + 208) = 1;
    objc_msgSend(v10, "descriptor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "stride");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "objectAtIndexedSubscript:", 3);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(v13 + 256) = objc_msgSend(v56, "unsignedIntegerValue") / v45;

    objc_msgSend(v10, "descriptor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "stride");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "objectAtIndexedSubscript:", 2);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(v13 + 264) = objc_msgSend(v59, "unsignedIntegerValue") / v45;

    *(_QWORD *)(v13 + 272) = 0;
    *(_QWORD *)(v13 + 348) = 1065353216;
    memset(&filter_params, 0, sizeof(filter_params));
    filter_params.flags = 1;
    v60 = BNNSFilterCreateLayerGram((const BNNSLayerParametersGram *)v13, &filter_params);
    if (v60)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSourceStride:", CPU_SetBatchStride(v61));

      objc_msgSend(v11, "setResultStride:", CPU_SetBatchStride(v10));
    }
    objc_opt_class();
    v62 = (void *)objc_opt_new();
    objc_msgSend(v11, "setLayer:", v62);

    objc_msgSend(v11, "layer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setFilter:", v60);

    v47 = 1;
LABEL_18:
    v12 = v67;
    goto LABEL_19;
  }
  if (v16 == 3)
  {
    v67 = v12;
    v18 = 2;
    v17 = 65552;
    goto LABEL_5;
  }
  +[MLCLog framework](MLCLog, "framework");
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    +[_MLCCPUGramMatrix compileWithDevice:deviceOps:sourceTensors:resultTensor:].cold.1(a2, v9);

  v47 = 0;
LABEL_19:

  return v47;
}

+ (void)compileWithDevice:(const char *)a1 deviceOps:(void *)a2 sourceTensors:resultTensor:.cold.1(const char *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataType");
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v6, v7, "%@: Unsupported sources data type (%d)", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_4_1();
}

+ (void)compileWithDevice:(const char *)a1 deviceOps:(void *)a2 sourceTensors:resultTensor:.cold.2(const char *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataType");
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v5, v6, "%@: Unsupported result data type (%d)", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4_1();
}

@end
