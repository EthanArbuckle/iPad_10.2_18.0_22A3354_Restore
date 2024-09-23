@implementation _MLCCPUNeuron

- (_MLCCPUNeuron)initWithDevice:(id)a3 descriptor:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _MLCCPUNeuron *v17;
  objc_super v19;
  _OWORD v20[11];
  _OWORD v21[11];
  _OWORD v22[22];
  _OWORD v23[3];
  uint64_t v24;
  void *v25;
  _QWORD v26[3];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v24 = 0;
  memset(v23, 0, sizeof(v23));
  memset(v22, 0, sizeof(v22));
  if ((setBNNSActivation((uint64_t)v23, v8) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v22, 408);
    v10 = objc_claimAutoreleasedReturnValue();
    memset(v21, 0, sizeof(v21));
    memset(v20, 0, sizeof(v20));
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v21, 176);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v20, 176);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", 13, v10, v13, v14, 0, 0, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      objc_msgSend(v9, "addObject:", v15);
    v16 = (void *)objc_msgSend(v9, "copy");
    v19.receiver = self;
    v19.super_class = (Class)_MLCCPUNeuron;
    self = -[_MLCCPULayer initWithDevice:deviceOps:](&v19, sel_initWithDevice_deviceOps_, v7, v16);

    v17 = self;
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_MLCCPUNeuron initWithDevice:descriptor:].cold.1(a2, v8);
    v17 = 0;
  }

  return v17;
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
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  BOOL v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  unint64_t v115;
  _OWORD v116[2];
  _QWORD v117[2];
  _QWORD v118[2];
  void *v119;
  uint64_t v120;
  _QWORD v121[2];
  _QWORD v122[2];
  void *v123;
  _QWORD v124[3];

  v124[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a6;
  objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "params");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "bytes");
  if (objc_msgSend(v10, "deviceOpType") == 16)
  {
    objc_msgSend(v9, "descriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shape");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    v16 = 0;
    switch(v15)
    {
      case 1:
        goto LABEL_4;
      case 2:
        goto LABEL_3;
      case 3:
        objc_msgSend(v9, "descriptor");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "shape");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "objectAtIndexedSubscript:", 2);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v58, "unsignedIntegerValue") == 1)
        {
          v59 = objc_msgSend(v10, "softmaxDimension");

          if (v59 != 2)
            goto LABEL_3;
        }
        else
        {

        }
        if (objc_msgSend(v10, "softmaxDimension") != 2)
          goto LABEL_24;
        v67 = 0;
        goto LABEL_25;
      case 4:
        objc_msgSend(v9, "descriptor");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "shape");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "objectAtIndexedSubscript:", 2);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v62, "unsignedIntegerValue") != 1)
          goto LABEL_23;
        v110 = v12;
        v63 = v8;
        objc_msgSend(v9, "descriptor");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "shape");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "objectAtIndexedSubscript:", 3);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v66, "unsignedIntegerValue") == 1)
        {
          v115 = objc_msgSend(v10, "softmaxDimension");

          v8 = v63;
          v12 = v110;
          if (v115 < 2)
          {
LABEL_3:
            v16 = 1 - objc_msgSend(v10, "softmaxDimension");
LABEL_4:
            *(_DWORD *)(v12 + 400) = 1 << v16;
            objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "descriptor");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "shape");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "count");

            objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "descriptor");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "shape");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "objectAtIndexedSubscript:", 0);
            v22 = objc_claimAutoreleasedReturnValue();
            v112 = v11;
            v104 = (void *)v22;
            if (v20 == 1)
            {
              v124[0] = v22;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 1);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "descriptor");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "stride");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "objectAtIndexedSubscript:", 0);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              v123 = v113;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v123, 1);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "descriptor");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              CPU_BuildBNNSNDArrayDescriptor(v12, v23, v26, 0, objc_msgSend(v27, "dataType"), 1, 0);
            }
            else
            {
              v122[0] = v22;
              objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "descriptor");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "shape");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "objectAtIndexedSubscript:", 1);
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              v122[1] = v102;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 2);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "descriptor");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "stride");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              v121[0] = v91;
              objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "descriptor");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "stride");
              v28 = v8;
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectAtIndexedSubscript:", 1);
              v98 = v21;
              v30 = v12;
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v121[1] = v31;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v121, 2);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "descriptor");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              CPU_BuildBNNSNDArrayDescriptor(v30, v113, v32, 0, objc_msgSend(v34, "dataType"), 1, 0);

              v25 = v92;
              v24 = v94;

              v26 = v90;
              v12 = v30;
              v21 = v98;

              v8 = v28;
              v23 = v96;

            }
            v114 = v8;
            objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "descriptor");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "shape");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "count");

            v109 = v12;
            v39 = v12 + 176;
            objc_msgSend(v9, "descriptor");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "shape");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "objectAtIndexedSubscript:", 0);
            v40 = objc_claimAutoreleasedReturnValue();
            v103 = (void *)v40;
            if (v38 == 1)
            {
              v120 = v40;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v120, 1);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "descriptor");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "stride");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "objectAtIndexedSubscript:", 0);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v119 = v44;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v119, 1);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "descriptor");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              CPU_BuildBNNSNDArrayDescriptor(v39, v41, v45, 0, objc_msgSend(v46, "dataType"), 1, 0);

            }
            else
            {
              v118[0] = v40;
              objc_msgSend(v9, "descriptor");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "shape");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v99, "objectAtIndexedSubscript:", 1);
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              v118[1] = v97;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 2);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "descriptor");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "stride");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "objectAtIndexedSubscript:", 0);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v117[0] = v48;
              objc_msgSend(v9, "descriptor");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "stride");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "objectAtIndexedSubscript:", 1);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v117[1] = v51;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 2);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "descriptor");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              CPU_BuildBNNSNDArrayDescriptor(v39, v93, v52, 0, objc_msgSend(v53, "dataType"), 1, 0);

            }
            v54 = v109;
            goto LABEL_27;
          }
        }
        else
        {

          v8 = v63;
          v12 = v110;
LABEL_23:

        }
LABEL_24:
        v67 = 3 - objc_msgSend(v10, "softmaxDimension");
LABEL_25:
        *(_DWORD *)(v12 + 400) = 1 << v67;
        break;
      default:
        v55 = 0;
        goto LABEL_30;
    }
  }
  v112 = v11;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "descriptor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "shape");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "descriptor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "stride");
  v72 = v10;
  v73 = v9;
  v74 = v12;
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v8;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "descriptor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_BuildBNNSNDArrayDescriptor(v74, v69, v75, 0, objc_msgSend(v77, "dataType"), 1, 0);

  v54 = v74;
  v9 = v73;
  v10 = v72;

  objc_msgSend(v9, "descriptor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "shape");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "stride");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_BuildBNNSNDArrayDescriptor(v54 + 176, v79, v81, 0, objc_msgSend(v82, "dataType"), 1, 0);

LABEL_27:
  memset(v116, 0, sizeof(v116));
  LODWORD(v116[0]) = 1;
  v83 = MEMORY[0x1D8263948](v54, v116);
  v8 = v114;
  if (v83)
  {
    objc_msgSend(v114, "objectAtIndexedSubscript:", 0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSourceStride:", CPU_SetBatchStride(v84));

    objc_msgSend(v10, "setResultStride:", CPU_SetBatchStride(v9));
  }
  objc_opt_class();
  v85 = (void *)objc_opt_new();
  objc_msgSend(v10, "setLayer:", v85);

  objc_msgSend(v10, "layer");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setFilter:", v83);

  v55 = 1;
  v11 = v112;
LABEL_30:

  return v55;
}

- (void)initWithDevice:(const char *)a1 descriptor:(void *)a2 .cold.1(const char *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "activationType");
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v4, v5, "%@: Unknown neuron type %d", v6, v7, v8, v9, 2u);

}

@end
