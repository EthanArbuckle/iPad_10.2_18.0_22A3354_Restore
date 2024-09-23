@implementation _MLCCPUCompare

- (_MLCCPUCompare)initWithDevice:(id)a3 operation:(int)a4
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _MLCCPUCompare *v18;
  objc_super v21;
  _OWORD v22[11];
  _OWORD v23[33];
  void *v24;
  _QWORD v25[2];
  _OWORD v26[11];
  _OWORD v27[11];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  if (a4 >= 0xC)
  {
    +[MLCLog framework](MLCLog, "framework");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_MLCCPUCompare initWithDevice:operation:].cold.1(a2, v9);

    v8 = 0;
  }
  else
  {
    v8 = dword_1D4AB8D5C[a4];
  }
  memset(v23, 0, 512);
  LODWORD(v23[0]) = v8;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v23, 536);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v27, 0, sizeof(v27));
  memset(v26, 0, sizeof(v26));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v26, 176);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v27, 176);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v22, 0, sizeof(v22));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v22, 176);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  v25[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", 42, v10, v14, v15, 0, 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setBinaryOperation:", a4 != 8);
  if (v16)
    objc_msgSend(v7, "addObject:", v16);
  v17 = (void *)objc_msgSend(v7, "copy");
  v21.receiver = self;
  v21.super_class = (Class)_MLCCPUCompare;
  v18 = -[_MLCCPULayer initWithDevice:deviceOps:](&v21, sel_initWithDevice_deviceOps_, v6, v17);

  return v18;
}

+ (id)layerWithDevice:(id)a3 operation:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:operation:", v6, v4);

  return v7;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int MajorDescriptor;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;

  v8 = a5;
  v42 = a6;
  objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "params");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend(v9, "bytes");

  v40 = v10;
  v11 = v10 + 8;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "shape");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stride");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = CPU_BuildBNNSNDArrayLastMajorDescriptor(v11, v14, v17, 0, objc_msgSend(v19, "dataType"));

  if ((_DWORD)v11)
  {
    v20 = v8;
    if (objc_msgSend(v8, "count") != 2)
      goto LABEL_4;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "descriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "shape");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "descriptor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stride");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "descriptor");
    v27 = v20;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    MajorDescriptor = CPU_BuildBNNSNDArrayLastMajorDescriptor(v40 + 184, v22, v25, 0, objc_msgSend(v28, "dataType"));

    v20 = v27;
    if (!MajorDescriptor)
    {
      v36 = 0;
      v30 = v42;
    }
    else
    {
LABEL_4:
      v30 = v42;
      objc_msgSend(v42, "descriptor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "shape");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "descriptor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stride");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "descriptor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CPU_BuildBNNSNDArrayLastMajorDescriptor(v40 + 360, v32, v34, 0, objc_msgSend(v35, "dataType"));

    }
    v37 = v41;
  }
  else
  {
    v36 = 0;
    v37 = v41;
    v30 = v42;
    v20 = v8;
  }

  return v36;
}

- (void)initWithDevice:(const char *)a1 operation:(NSObject *)a2 .cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D4999000, a2, OS_LOG_TYPE_ERROR, "%@: Unsupported operation.", (uint8_t *)&v4, 0xCu);

}

@end
