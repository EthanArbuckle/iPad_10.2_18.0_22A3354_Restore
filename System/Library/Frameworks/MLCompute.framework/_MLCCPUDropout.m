@implementation _MLCCPUDropout

- (_MLCCPUDropout)initWithDevice:(id)a3 rate:(float)a4 seed:(unint64_t)a5
{
  int v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _MLCCPUDropout *v17;
  objc_super v19;
  _OWORD v20[11];
  _OWORD v21[11];
  _OWORD v22[22];
  float v23;
  int v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[2];

  v5 = a5;
  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v25 = 0;
  memset(v22, 0, sizeof(v22));
  v23 = a4;
  v24 = v5;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v22, 368);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v21, 0, sizeof(v21));
  memset(v20, 0, sizeof(v20));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v21, 176);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v20, 176);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", 8, v10, v13, v14, 0, 0, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v9, "addObject:", v15);
  v16 = (void *)objc_msgSend(v9, "copy");
  v19.receiver = self;
  v19.super_class = (Class)_MLCCPUDropout;
  v17 = -[_MLCCPULayer initWithDevice:deviceOps:](&v19, sel_initWithDevice_deviceOps_, v8, v16);

  return v17;
}

+ (id)layerWithDevice:(id)a3 rate:(float)a4 seed:(unint64_t)a5
{
  id v8;
  id v9;
  double v10;
  void *v11;

  v8 = a3;
  v9 = objc_alloc((Class)a1);
  *(float *)&v10 = a4;
  v11 = (void *)objc_msgSend(v9, "initWithDevice:rate:seed:", v8, a5, v10);

  return v11;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  _OWORD v34[2];

  v8 = a5;
  v32 = a6;
  objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "params");
  v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v33, "bytes");
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "shape");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stride");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "descriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v9;
  LODWORD(v9) = CPU_BuildBNNSNDArrayDescriptor(v9, v12, v15, 0, objc_msgSend(v17, "dataType"), 1, 0);

  v18 = 0;
  if ((_DWORD)v9)
  {
    objc_msgSend(v32, "descriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "shape");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "descriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stride");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "descriptor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = CPU_BuildBNNSNDArrayDescriptor(v30 + 176, v20, v22, 0, objc_msgSend(v23, "dataType"), 1, 0);

    v18 = 0;
    if (v24)
    {
      memset(v34, 0, sizeof(v34));
      LODWORD(v34[0]) = 1;
      v25 = MEMORY[0x1D8263978](v30, v34);
      if (v25)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setSourceStride:", CPU_SetBatchStride(v26));

        objc_msgSend(v31, "setResultStride:", CPU_SetBatchStride(v32));
      }
      objc_opt_class();
      v27 = (void *)objc_opt_new();
      objc_msgSend(v31, "setLayer:", v27);

      objc_msgSend(v31, "layer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setFilter:", v25);

      v18 = 1;
    }
  }

  return v18;
}

@end
