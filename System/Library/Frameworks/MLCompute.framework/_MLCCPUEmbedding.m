@implementation _MLCCPUEmbedding

+ (id)layerWithDevice:(id)a3 descriptor:(id)a4 weights:(id)a5 inferenceOnly:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:descriptor:weights:inferenceOnly:", v12, v11, v10, v6);

  return v13;
}

- (_MLCCPUEmbedding)initWithDevice:(id)a3 descriptor:(id)a4 weights:(id)a5 inferenceOnly:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  _MLCCPUEmbedding *v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  _MLCCPUEmbedding *v42;
  BOOL v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  objc_super v51;
  _OWORD v52[11];
  _QWORD v53[4];

  v53[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1E0C9AA60];
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v15 = (void *)objc_msgSend(v13, "mutableCopy");
  if (a6)
  {
    v16 = 0;
    v17 = 0;
  }
  else
  {
    v44 = a6;
    v45 = v10;
    v47 = v14;
    memset(v52, 0, sizeof(v52));
    objc_msgSend(v12, "descriptor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "shape");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "descriptor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stride");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "descriptor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = CPU_BuildBNNSNDArrayDescriptorRowMajor((uint64_t)v52, v19, v21, 0, objc_msgSend(v22, "dataType"), 2, 0);

    if (!v23)
    {
      v42 = 0;
      v10 = v45;
      v14 = v47;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v52, 176);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "data");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26 = objc_msgSend(v25, "bytes");
    v16 = objc_retainAutorelease(v24);
    *(_QWORD *)(objc_msgSend(v16, "bytes") + 136) = v26;

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v52, 176);
    v49 = objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 3; ++i)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v52, 176);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:atIndexedSubscript:", v28, i);

    }
    v10 = v45;
    v14 = v47;
    a6 = v44;
    v17 = (void *)v49;
  }
  v50 = v17;
  +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", 47, v16, 0, 0, v15, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    objc_msgSend(v14, "addObject:", v29);
    objc_msgSend(v11, "paddingIndex");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setPaddingIndex:", v30);

    objc_msgSend(v29, "setEmbeddingParams:", 0);
    objc_msgSend(v11, "maximumNorm");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v11, "maximumNorm");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v32;
      objc_msgSend(v11, "pNorm");
      v46 = v11;
      v48 = v14;
      v33 = v12;
      v34 = v10;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v53[1] = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
      v36 = v16;
      v37 = self;
      v38 = a6;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setEmbeddingParams:", v39);

      a6 = v38;
      self = v37;
      v16 = v36;

      v10 = v34;
      v12 = v33;
      v11 = v46;
      v14 = v48;

    }
    objc_msgSend(v29, "setScaleGradientByFrequency:", objc_msgSend(v11, "scalesGradientByFrequency"));
    if (!a6)
    {
      v40 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      objc_msgSend(v29, "setWeightsDeltaDataBytesArray:", v40);

    }
  }
  v41 = (void *)objc_msgSend(v14, "copy");
  v51.receiver = self;
  v51.super_class = (Class)_MLCCPUEmbedding;
  self = -[_MLCCPULayer initWithDevice:deviceOps:](&v51, sel_initWithDevice_deviceOps_, v10, v41);

  v42 = self;
LABEL_14:

  return v42;
}

@end
