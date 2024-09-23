@implementation _MLCGPUCompare

- (_MLCGPUCompare)initWithDevice:(id)a3 operation:(int)a4
{
  id v7;
  _MLCGPUCompare *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  __int128 v20;
  objc_super v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_MLCGPUCompare;
  v8 = -[_MLCGPUCompare init](&v22, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "deviceList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    v11 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    if (v10)
    {
      v13 = 0;
      *(_QWORD *)&v12 = 138412546;
      v20 = v12;
      do
      {
        if ((a4 - 6) < 6)
        {
          objc_msgSend(v7, "gpuPipelineStatesCompareLogicalOpForward");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (a4 > 5)
          {
            +[MLCLog framework](MLCLog, "framework");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v20;
              v24 = v17;
              v25 = 1024;
              v26 = a4;
              _os_log_error_impl(&dword_1D4999000, v16, OS_LOG_TYPE_ERROR, "%@: unknown comparison type = %d", buf, 0x12u);
              goto LABEL_11;
            }
LABEL_12:

            goto LABEL_13;
          }
          objc_msgSend(v7, "gpuPipelineStatesCompareRelationalOpForward");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v15 = v14;
        objc_msgSend(v14, "objectAtIndexedSubscript:", v13, v20);
        v16 = objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          +[MLCGPUDeviceOps deviceOpsWithForwardKernel:](MLCGPUDeviceOps, "deviceOpsWithForwardKernel:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setSourceOfForwardNeededForGradient:", 0);
          objc_msgSend(v17, "setResultOfForwardNeededForGradient:", 0);
          if (v17)
          {
            objc_msgSend(v17, "setLayer:", objc_opt_class());
            objc_msgSend(v11, "addObject:", v17);
          }
LABEL_11:

          goto LABEL_12;
        }
LABEL_13:
        ++v13;
      }
      while (v10 != v13);
    }
    v18 = (void *)objc_msgSend(v11, "copy", v20);
    v21.receiver = v8;
    v21.super_class = (Class)_MLCGPUCompare;
    -[_MLCGPULayer setDeviceOps:](&v21, sel_setDeviceOps_, v18);

  }
  return v8;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
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
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  unint64_t v52;
  void *v53;
  void *v54;
  unint64_t v55;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  void *v71;

  v67 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C9AA60];
  v71 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v69 = objc_msgSend(v10, "mutableCopy");
  v11 = objc_msgSend(v9, "count");
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "shape");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v11 != 2)
  {
    v32 = (void *)objc_msgSend(v14, "copy");
LABEL_17:

LABEL_18:
    v49 = (void *)v69;
    goto LABEL_19;
  }
  v16 = objc_msgSend(v14, "count");

  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "descriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "shape");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20 > v16)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "descriptor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "shape");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v23, "count");

  }
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "descriptor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "shape");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "descriptor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "shape");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  v70 = v16;
  if (v16 == v27)
  {
    v32 = (void *)objc_msgSend(v30, "copy");

  }
  else
  {
    v33 = objc_msgSend(v30, "count");

    if (v16)
    {
      v34 = v16;
      v65 = v8;
      v35 = 0;
      v36 = v16 - v33;
      v68 = v33 - v16;
      do
      {
        if (v35 >= v36)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "descriptor");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "shape");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectAtIndexedSubscript:", v68 + v35);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v41, "unsignedIntegerValue");

          v34 = v70;
        }
        else
        {
          v37 = 1;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v37, v65);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setObject:atIndexedSubscript:", v42, v35);

        ++v35;
      }
      while (v34 != v35);
      v32 = v71;
      v8 = v65;
    }
    else
    {
      v32 = v71;
    }
  }
  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "descriptor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "shape");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "count");

  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "shape");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v47;
  v48 = v70;
  if (v70 == v46)
  {
    v71 = (void *)v69;
    v69 = objc_msgSend(v47, "copy");
    goto LABEL_17;
  }
  v57 = objc_msgSend(v47, "count");

  if (!v70)
    goto LABEL_18;
  v66 = v8;
  v58 = 0;
  v49 = (void *)v69;
  do
  {
    if (v58 >= v70 - v57)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "descriptor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "shape");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "objectAtIndexedSubscript:", v57 - v70 + v58);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v63, "unsignedIntegerValue");

      v48 = v70;
      v49 = (void *)v69;

    }
    else
    {
      v59 = 1;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v59, v66);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setObject:atIndexedSubscript:", v64, v58);

    ++v58;
  }
  while (v48 != v58);
  v8 = v66;
LABEL_19:
  objc_msgSend(v67, "deviceList");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "count");

  if (v51)
  {
    v52 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setSource0Shape:", v32);
      if (objc_msgSend(v9, "count") == 2)
        objc_msgSend(v53, "setSource1Shape:", v49);

      ++v52;
      objc_msgSend(v67, "deviceList");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "count");

    }
    while (v52 < v55);
  }

  return 1;
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

@end
