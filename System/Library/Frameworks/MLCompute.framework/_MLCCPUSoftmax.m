@implementation _MLCCPUSoftmax

- (_MLCCPUSoftmax)initWithDevice:(id)a3 operation:(int)a4 dimension:(unint64_t)a5
{
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _MLCCPUSoftmax *v18;
  objc_super v20;
  _OWORD v21[11];
  _OWORD v22[11];
  _OWORD v23[22];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[3];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v27 = 0;
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  memset(v23, 0, sizeof(v23));
  if (!a4)
  {
    v10 = 11;
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v10 = 21;
LABEL_5:
    LODWORD(v24) = v10;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v23, 408);
    v11 = objc_claimAutoreleasedReturnValue();
    memset(v22, 0, sizeof(v22));
    memset(v21, 0, sizeof(v21));
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v22, 176);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v21, 176);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", 16, v11, v14, v15, 0, 0, 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "setSoftmaxDimension:", a5);
      objc_msgSend(v9, "addObject:", v16);
    }
    v17 = (void *)objc_msgSend(v9, "copy");
    v20.receiver = self;
    v20.super_class = (Class)_MLCCPUSoftmax;
    self = -[_MLCCPULayer initWithDevice:deviceOps:](&v20, sel_initWithDevice_deviceOps_, v8, v17);

    v18 = self;
    goto LABEL_11;
  }
  +[MLCLog framework](MLCLog, "framework");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[_MLCCPUSoftmax initWithDevice:operation:dimension:].cold.1(a4, v11);
  v18 = 0;
LABEL_11:

  return v18;
}

+ (id)layerWithDevice:(id)a3 operation:(int)a4 dimension:(unint64_t)a5
{
  uint64_t v6;
  id v8;
  void *v9;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:operation:dimension:", v8, v6, a5);

  return v9;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  return +[_MLCCPUNeuron compileWithDevice:deviceOps:sourceTensors:resultTensor:](_MLCCPUNeuron, "compileWithDevice:deviceOps:sourceTensors:resultTensor:", a3, a4, a5, a6);
}

- (void)initWithDevice:(int)a1 operation:(NSObject *)a2 dimension:.cold.1(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[_MLCCPUSoftmax initWithDevice:operation:dimension:]";
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_1D4999000, a2, OS_LOG_TYPE_ERROR, "%s: Unknown softmaxOp=%d", (uint8_t *)&v2, 0x12u);
}

@end
