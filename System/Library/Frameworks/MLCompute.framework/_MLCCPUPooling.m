@implementation _MLCCPUPooling

- (_MLCCPUPooling)initWithDevice:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _MLCCPUPooling *v18;
  objc_super v20;
  _OWORD v21[11];
  _OWORD v22[11];
  _BYTE v23[576];
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[3];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  bzero(v23, 0x2A8uLL);
  v9 = objc_msgSend(v6, "poolingType");
  switch(v9)
  {
    case 1:
      v10 = 0;
      break;
    case 3:
      v10 = 4;
      break;
    case 2:
      if (objc_msgSend(v6, "countIncludesPadding"))
        v10 = 1;
      else
        v10 = 2;
      break;
    default:
      goto LABEL_10;
  }
  v24 = v10;
LABEL_10:
  v25 = objc_msgSend(v6, "kernelWidth");
  v26 = objc_msgSend(v6, "kernelHeight");
  v27 = objc_msgSend(v6, "strideInX");
  v28 = objc_msgSend(v6, "strideInY");
  v29 = objc_msgSend(v6, "dilationRateInX");
  v30 = objc_msgSend(v6, "dilationRateInY");
  if (objc_msgSend(v6, "paddingPolicy") == 2)
  {
    v31 = objc_msgSend(v6, "paddingSizeInX");
    v32 = objc_msgSend(v6, "paddingSizeInY");
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v23, 680);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v22, 0, sizeof(v22));
  memset(v21, 0, sizeof(v21));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v22, 176);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v21, 176);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", 15, v11, v14, v15, 0, 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "setPaddingPolicy:", objc_msgSend(v6, "paddingPolicy"));
    objc_msgSend(v8, "addObject:", v16);
  }
  v17 = (void *)objc_msgSend(v8, "copy");
  v20.receiver = self;
  v20.super_class = (Class)_MLCCPUPooling;
  v18 = -[_MLCCPULayer initWithDevice:deviceOps:](&v20, sel_initWithDevice_deviceOps_, v7, v17);

  return v18;
}

+ (id)layerWithDevice:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:descriptor:", v7, v6);

  return v8;
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
  int v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  unint64_t v25;
  float v26;
  float v27;
  float v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  float v33;
  unint64_t v34;
  float v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  id v44;
  id v45;
  _OWORD v46[2];

  v8 = a5;
  v44 = a6;
  objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "params");
  v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v45, "bytes");
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stride");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CPU_BuildBNNSNDArrayDescriptor(v9, v11, v14, 0, objc_msgSend(v16, "dataType"), 1, 0);

  v18 = 0;
  if (v17)
  {
    objc_msgSend(v44, "descriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "shape");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "descriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stride");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "descriptor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = CPU_BuildBNNSNDArrayDescriptor(v9 + 176, v20, v22, 0, objc_msgSend(v23, "dataType"), 1, 0);

    v18 = 0;
    if (v24)
    {
      if (objc_msgSend(v43, "paddingPolicy") != 2)
      {
        v25 = *(_QWORD *)(v9 + 600);
        v26 = (float)(v25 * *(_QWORD *)(v9 + 184));
        v27 = (float)*(unint64_t *)(v9 + 8);
        if (*(_DWORD *)(v9 + 576))
        {
          v28 = v26 - (float)((float)(v27 - (float)*(unint64_t *)(v9 + 584)) + (float)v25);
          if (v28 < 0.0)
            v28 = 0.0;
          v29 = (unint64_t)(float)(v28 * 0.5);
          *(_QWORD *)(v9 + 648) = v29;
          *(_QWORD *)(v9 + 656) = (unint64_t)(float)(v28 - (float)v29);
          v30 = *(_QWORD *)(v9 + 608);
          v31 = v30 * *(_QWORD *)(v9 + 192);
          v32 = *(_QWORD *)(v9 + 592);
        }
        else
        {
          v33 = v26
              - (float)((float)(v27
                              - (float)(unint64_t)((*(_QWORD *)(v9 + 584) - 1) * *(_QWORD *)(v9 + 616) + 1))
                      + (float)v25);
          if (v33 < 0.0)
            v33 = 0.0;
          v34 = (unint64_t)(float)(v33 * 0.5);
          *(_QWORD *)(v9 + 648) = v34;
          *(_QWORD *)(v9 + 656) = (unint64_t)(float)(v33 - (float)v34);
          v30 = *(_QWORD *)(v9 + 608);
          v31 = v30 * *(_QWORD *)(v9 + 192);
          v32 = (*(_QWORD *)(v9 + 592) - 1) * *(_QWORD *)(v9 + 624) + 1;
        }
        v35 = (float)v31
            - (float)((float)((float)*(unint64_t *)(v9 + 16) - (float)(unint64_t)v32) + (float)v30);
        if (v35 < 0.0)
          v35 = 0.0;
        v36 = (unint64_t)(float)(v35 * 0.5);
        *(_QWORD *)(v9 + 664) = v36;
        *(_QWORD *)(v9 + 672) = (unint64_t)(float)(v35 - (float)v36);
      }
      memset(v46, 0, sizeof(v46));
      LODWORD(v46[0]) = 1;
      v37 = MEMORY[0x1D82639CC](v9, v46);
      if (v37)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setSourceStride:", CPU_SetBatchStride(v38));

        objc_msgSend(v43, "setResultStride:", CPU_SetBatchStride(v44));
      }
      objc_opt_class();
      v39 = (void *)objc_opt_new();
      objc_msgSend(v43, "setLayer:", v39);

      objc_msgSend(v43, "layer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setFilter:", v37);

      v18 = 1;
    }
  }

  return v18;
}

@end
