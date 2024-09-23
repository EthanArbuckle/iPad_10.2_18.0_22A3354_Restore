@implementation _MLCGPUEmbedding

- (_MLCGPUEmbedding)initWithDevice:(id)a3 descriptor:(id)a4 weights:(id)a5 inferenceOnly:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  _MLCGPUEmbedding *v12;
  _MLCGPUEmbedding *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
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
  unint64_t v35;
  void *v36;
  _MLCGPUEmbedding *v38;
  void *v40;
  objc_super v41;
  objc_super v42;
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v42.receiver = self;
  v42.super_class = (Class)_MLCGPUEmbedding;
  v12 = -[_MLCGPUEmbedding init](&v42, sel_init);
  v13 = v12;
  if (v12)
  {
    v38 = v12;
    v40 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_msgSend(v9, "deviceList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      v16 = 0;
      do
      {
        objc_msgSend(v9, "deviceList");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        +[MLCEmbeddingGPUDeviceOps deviceOps](MLCEmbeddingGPUDeviceOps, "deviceOps");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(v11, "deviceMemory");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "count");

          if (v16 >= v21)
          {
            objc_msgSend(v11, "data");
            v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v23 = objc_msgSend(v22, "bytes");
            objc_msgSend(v11, "data");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (void *)objc_msgSend(v18, "newBufferWithBytes:length:options:", v23, objc_msgSend(v24, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
            objc_msgSend(v11, "deviceMemory");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:atIndexedSubscript:", v25, v16);

          }
          if (!a6)
          {
            objc_msgSend(v11, "data");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)objc_msgSend(v18, "newBufferWithLength:options:", objc_msgSend(v27, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
            objc_msgSend(v19, "setGradientForWeights:", v28);

          }
          objc_msgSend(v10, "paddingIndex");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setPaddingIndex:", v29);

          objc_msgSend(v19, "setEmbeddingParams:", 0);
          objc_msgSend(v10, "maximumNorm");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            objc_msgSend(v10, "maximumNorm");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v43[0] = v31;
            objc_msgSend(v10, "pNorm");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v43[1] = v32;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setEmbeddingParams:", v33);

          }
          objc_msgSend(v19, "setScaleGradientByFrequency:", objc_msgSend(v10, "scalesGradientByFrequency"));
          objc_msgSend(v19, "setSourceOfForwardNeededForGradient:", 1);
          objc_msgSend(v19, "setResultOfForwardNeededForGradient:", 0);
          objc_msgSend(v40, "addObject:", v19);
        }

        ++v16;
        objc_msgSend(v9, "deviceList");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "count");

      }
      while (v16 < v35);
    }
    v36 = (void *)objc_msgSend(v40, "copy");
    v13 = v38;
    v41.receiver = v38;
    v41.super_class = (Class)_MLCGPUEmbedding;
    -[_MLCGPULayer setDeviceOps:](&v41, sel_setDeviceOps_, v36);

  }
  return v13;
}

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

@end
