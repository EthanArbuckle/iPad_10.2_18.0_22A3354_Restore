@implementation _MLCGPUFullyConnected

- (_MLCGPUFullyConnected)initWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 descriptor:(id)a6 neuronDescriptor:(id)a7
{
  id v11;
  id v12;
  _MLCGPUFullyConnected *v13;
  _MLCGPUFullyConnected *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
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
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  void *v48;
  _MLCGPUFullyConnected *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  objc_super v58;
  objc_super v59;
  void *v60;
  _QWORD v61[2];
  _QWORD v62[2];
  id v63;
  _QWORD v64[2];
  _QWORD v65[3];

  v65[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v54 = a4;
  v55 = a5;
  v12 = a6;
  v59.receiver = self;
  v59.super_class = (Class)_MLCGPUFullyConnected;
  v13 = -[_MLCGPUFullyConnected init](&v59, sel_init);
  v14 = v13;
  if (v13)
  {
    v50 = v13;
    v53 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_msgSend(v11, "deviceList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      v17 = 0;
      v56 = v11;
      do
      {
        objc_msgSend(v11, "deviceList");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6F20]), "initWithDevice:transposeLeft:transposeRight:resultRows:resultColumns:interiorColumns:alpha:beta:", v19, 0, 1, 1, objc_msgSend(v12, "outputFeatureChannelCount"), objc_msgSend(v12, "inputFeatureChannelCount"), 1.0, 0.0);
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6F20]), "initWithDevice:transposeLeft:transposeRight:resultRows:resultColumns:interiorColumns:alpha:beta:", v19, 0, 0, 1, objc_msgSend(v12, "inputFeatureChannelCount"), objc_msgSend(v12, "outputFeatureChannelCount"), 1.0, 0.0);
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6F20]), "initWithDevice:transposeLeft:transposeRight:resultRows:resultColumns:interiorColumns:alpha:beta:", v19, 1, 0, objc_msgSend(v12, "outputFeatureChannelCount"), objc_msgSend(v12, "inputFeatureChannelCount"), 1, 1.0, 0.0);
        if (v20)
        {
          if (v21)
          {
            v57 = v22;
            +[MLCGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:secondaryGradientKernel:](MLCGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:secondaryGradientKernel:", v20, v21, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v65[0] = v20;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (void *)objc_msgSend(v24, "mutableCopy");
            objc_msgSend(v23, "setForwardStatisticsKernel:", v25);

            v64[0] = v21;
            v64[1] = v57;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)objc_msgSend(v26, "mutableCopy");
            objc_msgSend(v23, "setGradientStatisticsKernel:", v27);

            v22 = v57;
            if (v23)
            {
              objc_msgSend(v11, "deviceList");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "count");

              if (v29 < 2)
              {
                v31 = v54;
              }
              else
              {
                +[MLCMultiGPUDeviceOps multiGPUDeviceOpsWithGPUDeviceOps:](MLCMultiGPUDeviceOps, "multiGPUDeviceOpsWithGPUDeviceOps:", v23);
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                v31 = v54;
                if (v55)
                {
                  v62[0] = v54;
                  v62[1] = v55;
                  v32 = (void *)MEMORY[0x1E0C99D20];
                  v33 = (id *)v62;
                  v34 = 2;
                }
                else
                {
                  v63 = v54;
                  v32 = (void *)MEMORY[0x1E0C99D20];
                  v33 = &v63;
                  v34 = 1;
                }
                objc_msgSend(v32, "arrayWithObjects:count:", v33, v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                GPU_AllocateResourceForMultiGPUTraining(v11, v30, v35, v17);

                v23 = v30;
              }
              if (objc_msgSend(v11, "needToAllocateDeviceMemoryForTensor:", v31))
                objc_msgSend(v11, "allocateDeviceMemoryForTensor:", v31);
              objc_msgSend(v11, "broadcastTensor:", v31);
              objc_msgSend(v31, "descriptor");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setWeightsDataType:", objc_msgSend(v36, "dataType"));

              if (v55)
              {
                if (objc_msgSend(v11, "needToAllocateDeviceMemoryForTensor:", v55))
                  objc_msgSend(v11, "allocateDeviceMemoryForTensor:", v55);
                objc_msgSend(v11, "broadcastTensor:", v55);
                objc_msgSend(v31, "deviceMemory");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "objectAtIndexedSubscript:", v17);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v61[0] = v51;
                objc_msgSend(v55, "deviceMemory");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "objectAtIndexedSubscript:", v17);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v61[1] = v38;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = (void *)objc_msgSend(v39, "copy");
                objc_msgSend(v23, "setExportableState:", v40);

                objc_msgSend(v55, "descriptor");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "setBiasesDataType:", objc_msgSend(v41, "dataType"));

                objc_msgSend(v23, "setArithmeticOp:", 0);
              }
              else
              {
                objc_msgSend(v31, "deviceMemory");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "objectAtIndexedSubscript:", v17);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = v43;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = (void *)objc_msgSend(v44, "copy");
                objc_msgSend(v23, "setExportableState:", v45);

              }
              objc_msgSend(v23, "setTotalElementsPerChannel:", 1);
              objc_msgSend(v23, "setSourceOfForwardNeededForGradient:", 1);
              objc_msgSend(v23, "setResultOfForwardNeededForGradient:", 0);
              objc_msgSend(v53, "addObject:", v23);

              v11 = v56;
              v22 = v57;
            }
          }
        }

        ++v17;
        objc_msgSend(v11, "deviceList");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "count");

        v11 = v56;
      }
      while (v17 < v47);
    }
    v48 = (void *)objc_msgSend(v53, "copy");
    v14 = v50;
    v58.receiver = v50;
    v58.super_class = (Class)_MLCGPUFullyConnected;
    -[_MLCGPULayer setDeviceOps:](&v58, sel_setDeviceOps_, v48);

  }
  return v14;
}

+ (void)setGradientComputeWeightsAndBiasOnly:(id)a3 deviceOps:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;

  v12 = a3;
  v5 = a4;
  objc_msgSend(v12, "deviceList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setComputeWeightsAndBiasOnly:", 1);

      ++v8;
      objc_msgSend(v12, "deviceList");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

    }
    while (v8 < v11);
  }

}

+ (id)layerWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 descriptor:(id)a6 neuronDescriptor:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:weights:biasTerms:descriptor:neuronDescriptor:", v16, v15, v14, v13, v12);

  return v17;
}

@end
