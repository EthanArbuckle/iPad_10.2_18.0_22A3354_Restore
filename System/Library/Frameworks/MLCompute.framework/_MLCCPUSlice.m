@implementation _MLCCPUSlice

+ (id)layerWithDevice:(id)a3 begin:(id)a4 end:(id)a5 stride:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:begin:end:stride:", v13, v12, v11, v10);

  return v14;
}

- (_MLCCPUSlice)initWithDevice:(id)a3 begin:(id)a4 end:(id)a5 stride:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _MLCCPUSlice *v38;
  void *v40;
  void *v41;
  id v43;
  objc_super v44;
  _OWORD v45[11];
  void *v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0C9AA60];
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v14 = (void *)objc_msgSend(v12, "mutableCopy");
  if (objc_msgSend(v9, "count"))
  {
    v15 = 0;
    do
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "integerValue");
      v18 = v14;
      v19 = v13;
      v20 = v11;
      if (v17 >= 0)
        v21 = v17;
      else
        v21 = -v17;

      objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "unsignedIntegerValue");
      objc_msgSend(v9, "objectAtIndexedSubscript:", v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (v23 + ~objc_msgSend(v24, "unsignedIntegerValue")) / v21;

      v26 = v25 + 1;
      v11 = v20;
      v13 = v19;
      v14 = v18;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v27);

      v28 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v9, "objectAtIndexedSubscript:", v15);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v29, "unsignedIntegerValue"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v30);

      ++v15;
    }
    while (v15 < objc_msgSend(v9, "count"));
  }
  v41 = v10;
  v31 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  memset(v45, 0, sizeof(v45));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v45, 176);
  v32 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v45, 176);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)v32;
  v47[0] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCSliceCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCSliceCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", 48, 0, v34, v35, 0, 0, 0, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v36, "setBegin:", v13);
    objc_msgSend(v36, "setCount:", v14);
    objc_msgSend(v36, "setStride:", v11);
    objc_msgSend(v31, "addObject:", v36);
  }
  v37 = (void *)objc_msgSend(v31, "copy");
  v44.receiver = self;
  v44.super_class = (Class)_MLCCPUSlice;
  v38 = -[_MLCCPULayer initWithDevice:deviceOps:](&v44, sel_initWithDevice_deviceOps_, v43, v37);

  return v38;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  _BOOL4 v56;
  void *v57;
  void *v58;
  BOOL v59;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;

  v8 = a5;
  v9 = a6;
  objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inDeltaData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend(v12, "bytes");

  v66 = v10;
  objc_msgSend(v10, "outDeltaData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = objc_msgSend(v15, "bytes");

  v17 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v9, "descriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "dimensionCount");

  v62 = v13;
  v63 = v8;
  v61 = v16;
  v64 = v9;
  v65 = (void *)v17;
  if (v19)
  {
    v20 = 0;
    v21 = 0;
    do
    {
      v22 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "descriptor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stride");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", v20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "unsignedIntegerValue");
      objc_msgSend(v66, "stride");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndexedSubscript:", v20);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v29, "unsignedIntegerValue") * v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "addObject:", v30);

      v8 = v63;
      objc_msgSend(v63, "objectAtIndexedSubscript:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "descriptor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stride");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", v20);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "unsignedIntegerValue");
      objc_msgSend(v66, "begin");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndexedSubscript:", v20);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v21 += objc_msgSend(v37, "unsignedIntegerValue") * v35;

      ++v20;
      objc_msgSend(v64, "descriptor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "dimensionCount");

    }
    while (v20 < v39);
  }
  else
  {
    v21 = 0;
  }
  v40 = v66;
  objc_msgSend(v66, "setBeginOffset:", v21);
  objc_msgSend(v66, "setStride:", v65);
  objc_msgSend(v66, "count");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "descriptor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "dataType");
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "descriptor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v44) = CPU_BuildBNNSNDArrayDescriptorRowMajor(v62, v41, v65, 0, v44, objc_msgSend(v46, "dimensionCount"), 0);

  v47 = v65;
  if ((v44 & 1) != 0)
  {
    v48 = v64;
    objc_msgSend(v64, "descriptor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "shape");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "descriptor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "stride");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "descriptor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "dataType");
    objc_msgSend(v64, "descriptor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = CPU_BuildBNNSNDArrayDescriptorRowMajor(v61, v50, v52, 0, v54, objc_msgSend(v55, "dimensionCount"), 0);

    v57 = v63;
    if (v56)
    {
      objc_opt_class();
      v58 = (void *)objc_opt_new();
      v40 = v66;
      objc_msgSend(v66, "setLayer:", v58);

      v59 = 1;
    }
    else
    {
      v59 = 0;
      v40 = v66;
    }
    v47 = v65;
  }
  else
  {
    v59 = 0;
    v57 = v63;
    v48 = v64;
  }

  return v59;
}

@end
