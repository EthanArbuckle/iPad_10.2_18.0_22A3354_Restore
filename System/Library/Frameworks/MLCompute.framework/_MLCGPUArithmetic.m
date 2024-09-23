@implementation _MLCGPUArithmetic

- (_MLCGPUArithmetic)initWithDevice:(id)a3 operation:(int)a4 activationDescriptor:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  _MLCGPUArithmetic *v10;
  void *v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  objc_super v17;
  objc_super v18;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_MLCGPUArithmetic;
  v10 = -[_MLCGPUArithmetic init](&v18, sel_init);
  if (v10)
  {
    objc_msgSend(v8, "deviceList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    for (i = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy"); v12; --v12)
    {
      +[MLCGPUDeviceOps deviceOps](MLCGPUDeviceOps, "deviceOps");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v14, "setLayer:", objc_opt_class());
        objc_msgSend(v14, "setArithmeticOp:", v6);
        objc_msgSend(v14, "setNeuronDescriptor:", v9);
        objc_msgSend(i, "addObject:", v14);
      }

    }
    v15 = (void *)objc_msgSend(i, "copy");
    v17.receiver = v10;
    v17.super_class = (Class)_MLCGPUArithmetic;
    -[_MLCGPULayer setDeviceOps:](&v17, sel_setDeviceOps_, v15);

  }
  return v10;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  unint64_t v50;
  id v52;
  void *v53;
  id v54;

  v54 = a3;
  v52 = a4;
  v9 = a5;
  v10 = a6;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shape");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "descriptor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shape");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18 > v14)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "descriptor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "shape");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v21, "count");

    }
  }
  objc_msgSend(v54, "deviceList", v52);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23)
  {
    v24 = 0;
    do
    {
      objc_msgSend(v53, "objectAtIndexedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "arithmeticOp") > 1)
      {
        objc_msgSend(v25, "setSourceOfForwardNeededForGradient:", 1);
      }
      else
      {
        objc_msgSend(v25, "neuronDescriptor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setSourceOfForwardNeededForGradient:", v26 != 0);

        objc_msgSend(v25, "setResultOfForwardNeededForGradient:", 0);
      }
      if (!objc_msgSend(v25, "arithmeticOp") || objc_msgSend(v25, "arithmeticOp") == 1)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v10, "doesShapeMatchWithTensor:", v27);

        if (v28)
          objc_msgSend(v25, "setUseSourceGradientDeviceMemoryForResultGradientTensor:", 1);
      }
      if (!objc_msgSend(v25, "arithmeticOp"))
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v10, "doesShapeMatchWithTensor:", v29);

        if (v30)
          objc_msgSend(v25, "setUseSourceGradientDeviceMemoryForSecondaryResultGradientTensor:", 1);
      }
      if ((unint64_t)objc_msgSend(v9, "count") >= 2)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "descriptor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v32, "newShapeWithCount:", v14);
        objc_msgSend(v25, "setSource0Shape:", v33);

        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "descriptor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_msgSend(v35, "newShapeWithCount:", v14);
        objc_msgSend(v25, "setSource1Shape:", v36);

        if (objc_msgSend(v9, "count") == 3)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "descriptor");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "descriptor");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "shape");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)objc_msgSend(v38, "newShapeWithCount:", objc_msgSend(v40, "count"));
          objc_msgSend(v25, "setSource2Shape:", v41);

        }
      }
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setConstantArithmeticSourcesFlags:", (objc_msgSend(v42, "computeFlags") >> 1) & 1);

      if (objc_msgSend(v9, "count") == 2)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setConstantArithmeticSourcesFlags:", objc_msgSend(v25, "constantArithmeticSourcesFlags") | objc_msgSend(v43, "computeFlags") & 2);

        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (v44 == v45)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "parentLayers");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "count");

          if (v48)
            objc_msgSend(v25, "setConstantArithmeticSourcesFlags:", objc_msgSend(v25, "constantArithmeticSourcesFlags") | 4);
        }
        else
        {

        }
      }

      ++v24;
      objc_msgSend(v54, "deviceList");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "count");

    }
    while (v24 < v50);
  }

  return 1;
}

+ (id)layerWithDevice:(id)a3 operation:(int)a4 activationDescriptor:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:operation:activationDescriptor:", v9, v5, v8);

  return v10;
}

@end
