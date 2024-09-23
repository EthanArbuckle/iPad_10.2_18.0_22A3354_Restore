@implementation _MLCCPUReduction

- (_MLCCPUReduction)initWithDevice:(id)a3 reduceType:(int)a4 dimensions:(id)a5
{
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  _MLCCPUReduction *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;
  _OWORD v22[11];
  _BYTE v23[528];
  int v24;
  void *v25;
  _QWORD v26[2];
  _OWORD v27[11];
  _OWORD v28[11];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  bzero(v23, 0x218uLL);
  v10 = 1;
  switch(a4)
  {
    case 1:
      v10 = 6;
      goto LABEL_12;
    case 2:
      v10 = 4;
      goto LABEL_12;
    case 3:
      goto LABEL_13;
    case 4:
      goto LABEL_12;
    case 5:
      v10 = 2;
      goto LABEL_12;
    case 6:
      v10 = 3;
      goto LABEL_12;
    case 7:
      v10 = 9;
      goto LABEL_12;
    case 8:
      v10 = 10;
      goto LABEL_12;
    case 9:
      v10 = 11;
LABEL_12:
      v24 = v10;
LABEL_13:
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v23, 536);
      v11 = objc_claimAutoreleasedReturnValue();
      memset(v28, 0, sizeof(v28));
      memset(v27, 0, sizeof(v27));
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v27, 176);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v28, 176);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      memset(v22, 0, sizeof(v22));
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v22, 176);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v13;
      v26[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", 43, v11, v16, v17, 0, 0, 0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setBinaryOperation:", 0);
      if (v18)
        objc_msgSend(v9, "addObject:", v18);
      v19 = (void *)objc_msgSend(v9, "copy");
      v21.receiver = self;
      v21.super_class = (Class)_MLCCPUReduction;
      self = -[_MLCCPULayer initWithDevice:deviceOps:](&v21, sel_initWithDevice_deviceOps_, v8, v19);

      v12 = self;
      break;
    default:
      +[MLCLog framework](MLCLog, "framework");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_MLCCPUReduction initWithDevice:reduceType:dimensions:].cold.1(a2, a4, v11);
      v12 = 0;
      break;
  }

  return v12;
}

+ (id)layerWithDevice:(id)a3 reduceType:(int)a4 dimensions:(id)a5 sourceShapeCount:(unint64_t)a6
{
  uint64_t v6;
  id v9;
  id v10;
  void *v11;

  v6 = *(_QWORD *)&a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:reduceType:dimensions:", v10, v6, v9);

  return v11;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int MajorDescriptor;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  _OWORD v38[2];

  v8 = a5;
  v37 = a6;
  objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "params");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend(v9, "bytes");

  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shape");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stride");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v8;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "descriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v10;
  LODWORD(v8) = CPU_BuildBNNSNDArrayLastMajorDescriptor(v10, v13, v16, 0, objc_msgSend(v18, "dataType"));

  if (!(_DWORD)v8)
  {
    v32 = 0;
    v19 = v37;
LABEL_8:
    v28 = v35;
    v27 = v36;
    goto LABEL_9;
  }
  v19 = v37;
  objc_msgSend(v37, "descriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "shape");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "descriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stride");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "descriptor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  MajorDescriptor = CPU_BuildBNNSNDArrayLastMajorDescriptor(v34 + 176, v21, v23, 0, objc_msgSend(v24, "dataType"));

  if (!MajorDescriptor)
  {
    v32 = 0;
    goto LABEL_8;
  }
  memset(v38, 0, sizeof(v38));
  LODWORD(v38[0]) = 1;
  v26 = MEMORY[0x1D82639D8](v34, v38);
  v28 = v35;
  v27 = v36;
  if (v26)
  {
    objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setSourceStride:", CPU_SetBatchStride(v29));

    objc_msgSend(v35, "setResultStride:", CPU_SetBatchStride(v37));
  }
  objc_opt_class();
  v30 = (void *)objc_opt_new();
  objc_msgSend(v35, "setLayer:", v30);

  objc_msgSend(v35, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFilter:", v26);

  v32 = 1;
LABEL_9:

  return v32;
}

- (void)initWithDevice:(const char *)a1 reduceType:(int)a2 dimensions:(NSObject *)a3 .cold.1(const char *a1, int a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 1024;
  v9 = a2;
  _os_log_error_impl(&dword_1D4999000, a3, OS_LOG_TYPE_ERROR, "%@: unknown reduceType type = %d", (uint8_t *)&v6, 0x12u);

}

@end
