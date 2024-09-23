@implementation _MLCCPUMatMul

+ (id)layerWithDevice:(id)a3 descriptor:(id)a4 inferenceOnly:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:descriptor:inferenceOnly:", v9, v8, v5);

  return v10;
}

- (_MLCCPUMatMul)initWithDevice:(id)a3 descriptor:(id)a4 inferenceOnly:(BOOL)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _MLCCPUMatMul *v19;
  _BOOL4 v21;
  objc_super v23;
  _OWORD v24[11];
  _BYTE v25[544];
  void *v26;
  _QWORD v27[4];

  v21 = a5;
  v27[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  bzero(v25, 0x220uLL);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v25, 544);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend(v9, "bytes");
  objc_msgSend(v6, "alpha");
  *(_DWORD *)v10 = v11;
  *(_DWORD *)(v10 + 4) = 0;
  *(_BYTE *)(v10 + 8) = objc_msgSend(v6, "transposesX");
  *(_BYTE *)(v10 + 9) = objc_msgSend(v6, "transposesY");
  *(_WORD *)(v10 + 10) = 0;
  *(_BYTE *)(v10 + 12) = 0;
  memset(v24, 0, sizeof(v24));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v24, 176);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v24, 176);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v24, 176);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v12;
  v27[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", 45, v9, v15, v16, 0, 0, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v8, "addObject:", v17);
    objc_msgSend(v17, "setInferenceOnly:", v21);
    objc_msgSend(v17, "setTransposeX:", objc_msgSend(v6, "transposesX"));
    objc_msgSend(v17, "setTransposeY:", objc_msgSend(v6, "transposesY"));
  }
  v18 = (void *)objc_msgSend(v8, "copy");
  v23.receiver = self;
  v23.super_class = (Class)_MLCCPUMatMul;
  v19 = -[_MLCCPULayer initWithDevice:deviceOps:](&v23, sel_initWithDevice_deviceOps_, v7, v18);

  return v19;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v9;
  BNNSLayerParametersBroadcastMatMul *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  _BOOL4 v52;
  BNNSNDArrayDescriptor *p_o_desc;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  _BOOL4 v61;
  BNNSLayerParametersBroadcastMatMul *v62;
  BNNSLayerParametersBroadcastMatMul *v63;
  void *v64;
  BNNSNDArrayDescriptor *v65;
  BNNSLayerParametersBroadcastMatMul *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  unint64_t v78;
  BOOL v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  unint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  unint64_t v95;
  void *v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  unint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  _OWORD *v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  void *v118;
  id v119;
  _OWORD *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  void *v129;
  id v130;
  _OWORD *v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  BNNSLayerParametersBroadcastMatMul *v144;
  void *v145;
  unint64_t v146;
  void *v147;
  unint64_t v148;
  void *v149;
  unint64_t v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  int v158;
  void *v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  NSObject *v171;
  uint64_t v172;
  void *v173;
  __int128 *v174;
  id v175;
  BNNSNDArrayDescriptor *v176;
  BNNSNDArrayDescriptor *p_iB_desc;
  const char *v178;
  void *v179;
  void *v180;
  id v181;
  void *v182;
  BNNSLayerParametersBroadcastMatMul *layer_params;
  BNNSLayerParametersBroadcastMatMul *layer_paramsa;
  BNNSLayerParametersBroadcastMatMul *layer_paramsb;
  void *v186;
  _BYTE v187[536];
  BNNSFilterParameters filter_params;

  v9 = a5;
  v10 = (BNNSLayerParametersBroadcastMatMul *)a6;
  objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "params");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "bytes");
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "dimensionCount");

  objc_msgSend(v14, "descriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "dimensionCount");

  v181 = v11;
  layer_params = (BNNSLayerParametersBroadcastMatMul *)v12;
  v186 = v14;
  v178 = a2;
  if (v16 != v18)
  {
    v19 = v13;
    objc_msgSend(v13, "descriptor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "shape");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    objc_msgSend(v14, "descriptor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "shape");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "mutableCopy");

    if (v16 <= v18)
      v26 = v18;
    else
      v26 = v16;
    if (v16 < v18)
    {
      v27 = v26 - v16;
      do
      {
        objc_msgSend(v22, "insertObject:atIndex:", &unk_1E9844050, 0);
        --v27;
      }
      while (v27);
    }
    if (v18 < v16)
    {
      v28 = v26 - v18;
      do
      {
        objc_msgSend(v25, "insertObject:atIndex:", &unk_1E9844050, 0);
        --v28;
      }
      while (v28);
    }
    objc_msgSend(v19, "descriptor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v22, objc_msgSend(v29, "dataType"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v30);
    v31 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v186, "descriptor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v25, objc_msgSend(v32, "dataType"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v33);
    v34 = objc_claimAutoreleasedReturnValue();

    v186 = (void *)v34;
    v13 = (void *)v31;
    v12 = (uint64_t)layer_params;
  }
  v35 = v12 + 16;
  objc_msgSend(v13, "descriptor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "shape");
  v37 = v13;
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "descriptor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stride");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "descriptor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "dataType");
  v180 = v37;
  objc_msgSend(v37, "descriptor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = CPU_BuildBNNSNDArrayDescriptorRowMajor(v35, v38, v40, 0, v42, objc_msgSend(v43, "dimensionCount"), 0);

  if (!v44)
    goto LABEL_22;
  objc_msgSend(v186, "descriptor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "shape");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "descriptor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "stride");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "descriptor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "dataType");
  objc_msgSend(v186, "descriptor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  p_iB_desc = &layer_params->iB_desc;
  v52 = CPU_BuildBNNSNDArrayDescriptorRowMajor((uint64_t)&layer_params->iB_desc, v46, v48, 0, v50, objc_msgSend(v51, "dimensionCount"), 0);

  if (!v52)
  {
    v79 = 0;
    v64 = v182;
    goto LABEL_24;
  }
  v174 = (__int128 *)v35;
  p_o_desc = &layer_params->o_desc;
  -[BNNSLayerParametersBroadcastMatMul descriptor](v10, "descriptor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "shape");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNNSLayerParametersBroadcastMatMul descriptor](v10, "descriptor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "stride");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNNSLayerParametersBroadcastMatMul descriptor](v10, "descriptor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "dataType");
  -[BNNSLayerParametersBroadcastMatMul descriptor](v10, "descriptor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = CPU_BuildBNNSNDArrayDescriptorRowMajor((uint64_t)&layer_params->o_desc, v55, v57, 0, v59, objc_msgSend(v60, "dimensionCount"), 0);

  if (!v61)
  {
LABEL_22:
    v79 = 0;
    v64 = v182;
LABEL_24:
    v81 = v180;
    v80 = v181;
    v82 = v186;
    goto LABEL_25;
  }
  v176 = &layer_params->o_desc;
  if (objc_msgSend(v9, "count") == 3)
    layer_params->beta = 1.0;
  memset(&filter_params, 0, sizeof(filter_params));
  filter_params.flags = 1;
  v62 = (BNNSLayerParametersBroadcastMatMul *)BNNSFilterCreateLayerBroadcastMatMul(layer_params, &filter_params);
  v63 = v62;
  v64 = v182;
  v65 = &layer_params->o_desc;
  if (v62)
  {
    layer_paramsa = v62;
    v66 = v10;
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "descriptor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "dimensionCount");

    if (v69)
    {
      v70 = 0;
      v71 = 1;
      do
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "descriptor");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "shape");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "objectAtIndexedSubscript:", v70);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v71 *= objc_msgSend(v75, "unsignedIntegerValue");

        ++v70;
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "descriptor");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v77, "dimensionCount");

      }
      while (v70 < v78);
    }
    else
    {
      v71 = 1;
    }
    objc_msgSend(v182, "setSourceStride:", v71);
    v84 = 1;
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "descriptor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v86, "dimensionCount");

    if (v87)
    {
      v88 = 0;
      v84 = 1;
      do
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "descriptor");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "shape");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "objectAtIndexedSubscript:", v88);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v84 *= objc_msgSend(v92, "unsignedIntegerValue");

        ++v88;
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "descriptor");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = objc_msgSend(v94, "dimensionCount");

      }
      while (v88 < v95);
    }
    objc_msgSend(v182, "setSourceStrideSecondary:", v84);
    v10 = v66;
    -[BNNSLayerParametersBroadcastMatMul descriptor](v66, "descriptor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v96, "dimensionCount");

    if (v97)
    {
      v98 = 0;
      v99 = 1;
      do
      {
        -[BNNSLayerParametersBroadcastMatMul descriptor](v66, "descriptor");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "shape");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "objectAtIndexedSubscript:", v98);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v99 *= objc_msgSend(v102, "unsignedIntegerValue");

        ++v98;
        -[BNNSLayerParametersBroadcastMatMul descriptor](v66, "descriptor");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = objc_msgSend(v103, "dimensionCount");

      }
      while (v98 < v104);
    }
    else
    {
      v99 = 1;
    }
    objc_msgSend(v182, "setResultStride:", v99);
    v65 = p_o_desc;
    v63 = layer_paramsa;
  }
  objc_opt_class();
  v105 = (void *)objc_opt_new();
  objc_msgSend(v182, "setLayer:", v105);

  objc_msgSend(v182, "layer");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setFilter:", v63);

  if ((objc_msgSend(v182, "inferenceOnly") & 1) == 0)
  {
    objc_msgSend(v182, "inDeltaData");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "objectAtIndexedSubscript:", 0);
    v108 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v109 = (_OWORD *)objc_msgSend(v108, "bytes");

    v110 = *v174;
    v111 = v174[2];
    v109[1] = v174[1];
    v109[2] = v111;
    *v109 = v110;
    v112 = v174[3];
    v113 = v174[4];
    v114 = v174[6];
    v109[5] = v174[5];
    v109[6] = v114;
    v109[3] = v112;
    v109[4] = v113;
    v115 = v174[7];
    v116 = v174[8];
    v117 = v174[10];
    v109[9] = v174[9];
    v109[10] = v117;
    v109[7] = v115;
    v109[8] = v116;
    objc_msgSend(v182, "inDeltaData");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "objectAtIndexedSubscript:", 1);
    v119 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v120 = (_OWORD *)objc_msgSend(v119, "bytes");

    v121 = *(_OWORD *)&p_iB_desc->flags;
    v122 = *(_OWORD *)&p_iB_desc->size[3];
    v120[1] = *(_OWORD *)&p_iB_desc->size[1];
    v120[2] = v122;
    *v120 = v121;
    v123 = *(_OWORD *)&p_iB_desc->size[5];
    v124 = *(_OWORD *)&p_iB_desc->size[7];
    v125 = *(_OWORD *)&p_iB_desc->stride[3];
    v120[5] = *(_OWORD *)&p_iB_desc->stride[1];
    v120[6] = v125;
    v120[3] = v123;
    v120[4] = v124;
    v126 = *(_OWORD *)&p_iB_desc->stride[5];
    v127 = *(_OWORD *)&p_iB_desc->stride[7];
    v128 = *(_OWORD *)&p_iB_desc->table_data_type;
    v120[9] = *(_OWORD *)&p_iB_desc->data_type;
    v120[10] = v128;
    v120[7] = v126;
    v120[8] = v127;
    objc_msgSend(v182, "outDeltaData");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "objectAtIndexedSubscript:", 0);
    v130 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v131 = (_OWORD *)objc_msgSend(v130, "bytes");

    v132 = *(_OWORD *)&v65->flags;
    v133 = *(_OWORD *)&v65->size[3];
    v131[1] = *(_OWORD *)&v65->size[1];
    v131[2] = v133;
    *v131 = v132;
    v134 = *(_OWORD *)&v65->size[5];
    v135 = *(_OWORD *)&v65->size[7];
    v136 = *(_OWORD *)&v65->stride[3];
    v131[5] = *(_OWORD *)&v65->stride[1];
    v131[6] = v136;
    v131[3] = v134;
    v131[4] = v135;
    v137 = *(_OWORD *)&v65->stride[5];
    v138 = *(_OWORD *)&v65->stride[7];
    v139 = *(_OWORD *)&v65->table_data_type;
    v131[9] = *(_OWORD *)&v65->data_type;
    v131[10] = v139;
    v131[7] = v137;
    v131[8] = v138;
  }
  if (objc_msgSend(v9, "count") == 2)
  {
    v79 = 1;
    goto LABEL_24;
  }
  bzero(v187, 0x218uLL);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v187, 536);
  v175 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v140 = objc_msgSend(v175, "bytes");
  objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "descriptor");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "shape");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = v10;
  v145 = (void *)objc_msgSend(v143, "mutableCopy");

  v146 = objc_msgSend(v145, "count");
  -[BNNSLayerParametersBroadcastMatMul descriptor](v144, "descriptor");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = objc_msgSend(v147, "dimensionCount");

  if (v146 < v148)
  {
    do
    {
      objc_msgSend(v145, "insertObject:atIndex:", &unk_1E9844050, 0);
      ++v146;
      -[BNNSLayerParametersBroadcastMatMul descriptor](v144, "descriptor");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v150 = objc_msgSend(v149, "dimensionCount");

    }
    while (v146 < v150);
  }
  layer_paramsb = v144;
  -[BNNSLayerParametersBroadcastMatMul descriptor](v144, "descriptor");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v145, objc_msgSend(v151, "dataType"));
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v152);
  v153 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v153, "descriptor");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "shape");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "descriptor");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "stride");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "descriptor");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = objc_msgSend(v157, "dataType");
  v173 = v153;
  objc_msgSend(v153, "descriptor");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v158) = CPU_BuildBNNSNDArrayDescriptorRowMajor(v140 + 176, v154, v156, 0, v158, objc_msgSend(v159, "dimensionCount"), 0);

  if ((v158 & 1) != 0)
  {
    v160 = *(_OWORD *)&v176->flags;
    v161 = *(_OWORD *)&v176->size[3];
    *(_OWORD *)(v140 + 16) = *(_OWORD *)&v176->size[1];
    *(_OWORD *)(v140 + 32) = v161;
    *(_OWORD *)v140 = v160;
    v162 = *(_OWORD *)&v176->size[5];
    v163 = *(_OWORD *)&v176->size[7];
    v164 = *(_OWORD *)&v176->stride[3];
    *(_OWORD *)(v140 + 80) = *(_OWORD *)&v176->stride[1];
    *(_OWORD *)(v140 + 96) = v164;
    *(_OWORD *)(v140 + 48) = v162;
    *(_OWORD *)(v140 + 64) = v163;
    v165 = *(_OWORD *)&v176->stride[5];
    v166 = *(_OWORD *)&v176->stride[7];
    v167 = *(_OWORD *)&v176->table_data_type;
    *(_OWORD *)(v140 + 144) = *(_OWORD *)&v176->data_type;
    *(_OWORD *)(v140 + 160) = v167;
    *(_OWORD *)(v140 + 112) = v165;
    *(_OWORD *)(v140 + 128) = v166;
    *(_DWORD *)(v140 + 528) = 6;
    v168 = MEMORY[0x1D82639D8](v140, &filter_params);
    v79 = v168 != 0;
    if (v168)
    {
      v169 = v168;
      v170 = v175;
      objc_msgSend(v182, "setFusedPrimitiveParams:", v175);
      objc_msgSend(v182, "layer");
      v171 = objc_claimAutoreleasedReturnValue();
      v172 = v169;
      v64 = v182;
      -[NSObject setSecondaryFilter:](v171, "setSecondaryFilter:", v172);
    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v171 = objc_claimAutoreleasedReturnValue();
      v170 = v175;
      if (os_log_type_enabled(v171, OS_LOG_TYPE_ERROR))
        +[_MLCCPUMatMul compileWithDevice:deviceOps:sourceTensors:resultTensor:].cold.1(v178, v171);
      v64 = v182;
    }
    v81 = v180;
    v80 = v181;
    v82 = v186;

  }
  else
  {
    v79 = 0;
    v64 = v182;
    v81 = v180;
    v80 = v181;
    v82 = v186;
    v170 = v175;
  }

  v10 = layer_paramsb;
LABEL_25:

  return v79;
}

+ (void)compileWithDevice:(const char *)a1 deviceOps:(NSObject *)a2 sourceTensors:resultTensor:.cold.1(const char *a1, NSObject *a2)
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
  _os_log_error_impl(&dword_1D4999000, a2, OS_LOG_TYPE_ERROR, "%@: failed to create reduction filter", (uint8_t *)&v4, 0xCu);

}

@end
