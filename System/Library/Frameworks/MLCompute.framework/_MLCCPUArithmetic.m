@implementation _MLCCPUArithmetic

+ (int)arithmeticOperatorTypeFor:(int)a3
{
  if (a3 <= 0x1D && ((1 << a3) & 0x3C20000F) != 0)
    return 2;
  else
    return 1;
}

+ (unsigned)bnnsArithmeticFunctionFor:(int)a3
{
  NSObject *v6;

  if (a3 < 0x1E)
    return dword_1D4AB8EF0[a3];
  +[MLCLog framework](MLCLog, "framework");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    +[_MLCCPUArithmetic bnnsArithmeticFunctionFor:].cold.1(a2, a3, v6);

  return 0;
}

- (_MLCCPUArithmetic)initWithDevice:(id)a3 operation:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  _DWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _MLCCPUArithmetic *v19;
  objc_super v21;
  _OWORD v22[4];
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];
  _OWORD v27[11];
  _OWORD v28[11];
  _OWORD v29[11];
  uint64_t v30;

  v4 = *(_QWORD *)&a4;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  memset(v22, 0, sizeof(v22));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v22, 64);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (_DWORD *)objc_msgSend(v8, "bytes");
  *v9 = objc_msgSend((id)objc_opt_class(), "bnnsArithmeticFunctionFor:", v4);
  memset(v29, 0, sizeof(v29));
  memset(v28, 0, sizeof(v28));
  memset(v27, 0, sizeof(v27));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v28, 176);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v27, 176);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "arithmeticOperatorTypeFor:", v4) == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v29, 176);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v10;
    v26[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", 1, v8, v13, v14, 0, 0, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setBinaryOperation:", 1);
    if (!v15)
      goto LABEL_6;
    goto LABEL_5;
  }
  v24 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", 1, v8, v16, v17, 0, 0, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setBinaryOperation:", 0);
  if (v15)
LABEL_5:
    objc_msgSend(v7, "addObject:", v15);
LABEL_6:
  v18 = (void *)objc_msgSend(v7, "copy");
  v21.receiver = self;
  v21.super_class = (Class)_MLCCPUArithmetic;
  v19 = -[_MLCCPULayer initWithDevice:deviceOps:](&v21, sel_initWithDevice_deviceOps_, v6, v18);

  return v19;
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
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  _DWORD *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  unint64_t v65;
  void *v66;
  BOOL v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  _DWORD *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  int v132;
  void *v133;
  void *v134;
  int v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  uint64_t v145;
  void *v146;
  id v147;
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  id v152;
  uint64_t v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  uint64_t v162;
  NSObject *v163;
  void *v164;
  void *v165;
  _DWORD *v167;
  _DWORD *v168;
  const char *v169;
  uint64_t v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  uint64_t v177;
  uint64_t v178;
  unint64_t v179;
  _OWORD v180[2];
  _BYTE v181[560];

  v169 = a2;
  v8 = a5;
  v9 = a6;
  objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "params");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "bytes");

  bzero(v181, 0x228uLL);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v181, 552);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *(_QWORD *)(v12 + 8) = objc_msgSend(v13, "bytes");
  v171 = v13;
  objc_msgSend(v10, "setArithmeticParamsData:", v13);
  v14 = (void *)MEMORY[0x1E0C9AA60];
  v15 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v174 = (void *)objc_msgSend(v14, "mutableCopy");
  v172 = v10;
  v173 = v9;
  v170 = v12;
  if (objc_msgSend(v10, "binaryOperation"))
  {
    if (*(_DWORD *)v12 <= 1u)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v9, "doesShapeMatchWithTensor:", v16);

      if (v17)
        objc_msgSend(v10, "setUseSourceGradientDeviceMemoryForResultGradientTensor:", 1);
      if (!*(_DWORD *)v12)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v9, "doesShapeMatchWithTensor:", v18);

        if (v19)
          objc_msgSend(v10, "setUseSourceGradientDeviceMemoryForSecondaryResultGradientTensor:", 1);
      }
    }
    v175 = v15;
    v20 = *(_DWORD **)(v12 + 8);
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "descriptor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "shape");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = objc_msgSend(v23, "count");

    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "descriptor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "shape");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "descriptor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "shape");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "descriptor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "shape");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");
    if (v27 <= v31)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "descriptor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "shape");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "count");

      if (v35 >= v65)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "descriptor");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "shape");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "objectAtIndexedSubscript:", 0);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "unsignedIntValue");

        if (v72 == 1)
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v20;
          v20[44] = ~objc_msgSend(v73, "computeFlags") & 2;

        }
        else
        {
          v74 = v20;
          v20[44] = 1;
        }
        v39 = v172;
        v38 = v173;
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "descriptor");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "shape");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "objectAtIndexedSubscript:", 0);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(v78, "unsignedIntValue");

        if (v79 == 1)
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v74[90] = ~objc_msgSend(v80, "computeFlags") & 2;

        }
        else
        {
          v74[90] = 1;
        }
        v20 = v74;
      }
      else
      {
        v20[44] = 1;
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v20[90] = ~objc_msgSend(v66, "computeFlags") & 2;

        v39 = v172;
        v38 = v173;
      }
      v37 = v177;
    }
    else
    {

      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v20[44] = ~objc_msgSend(v36, "computeFlags") & 2;

      v20[90] = 1;
      v37 = v35;
      v39 = v172;
      v38 = v173;
    }
    v20[136] = 1;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "descriptor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "shape");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v83, "count");

    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "descriptor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "shape");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v87;
    v179 = v37;
    if (v37 == v84)
    {
      v89 = objc_msgSend(v87, "copy");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setSourceStride:", CPU_SetBatchStride(v90));

      v175 = (void *)v89;
    }
    else
    {
      v91 = v37;
      v92 = objc_msgSend(v87, "count");

      if (v91)
      {
        v167 = v20;
        v93 = 0;
        v94 = v91 - v92;
        v95 = v92 - v91;
        v96 = v175;
        v37 = v91;
        do
        {
          if (v93 >= v94)
          {
            objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "descriptor");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "shape");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "objectAtIndexedSubscript:", v95 + v93);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            v97 = objc_msgSend(v101, "unsignedIntegerValue");

            v37 = v179;
            v96 = v175;

          }
          else
          {
            v97 = 1;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v97, v167, v169);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "setObject:atIndexedSubscript:", v102, v93);

          ++v93;
        }
        while (v37 != v93);
        v39 = v172;
        v38 = v173;
        if (v37 < 2)
        {
          v104 = 1;
          v20 = v167;
        }
        else
        {
          v103 = 1;
          v104 = 1;
          v20 = v167;
          do
          {
            objc_msgSend(v96, "objectAtIndexedSubscript:", v103);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            v104 *= objc_msgSend(v105, "unsignedIntegerValue");

            ++v103;
          }
          while (v37 != v103);
        }
      }
      else
      {
        v104 = 1;
        v37 = 0;
      }
      objc_msgSend(v39, "setSourceStride:", v104);
    }
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "descriptor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "shape");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v108, "count");

    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "descriptor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "shape");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = v112;
    if (v37 == v109)
    {
      v61 = (void *)objc_msgSend(v112, "copy");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setSourceStrideSecondary:", CPU_SetBatchStride(v114));

    }
    else
    {
      v115 = v37;
      v116 = objc_msgSend(v112, "count");

      if (v115)
      {
        v168 = v20;
        v117 = 0;
        v118 = v115 - v116;
        v119 = v116 - v115;
        v61 = v174;
        v120 = v115;
        do
        {
          if (v117 >= v118)
          {
            objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v122, "descriptor");
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "shape");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v124, "objectAtIndexedSubscript:", v119 + v117);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            v121 = objc_msgSend(v125, "unsignedIntegerValue");

            v120 = v179;
            v61 = v174;

          }
          else
          {
            v121 = 1;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v121, v168);
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setObject:atIndexedSubscript:", v126, v117);

          ++v117;
        }
        while (v120 != v117);
        v39 = v172;
        v38 = v173;
        if (v120 < 2)
        {
          v128 = 1;
          v20 = v168;
        }
        else
        {
          v127 = 1;
          v128 = 1;
          v20 = v168;
          do
          {
            objc_msgSend(v61, "objectAtIndexedSubscript:", v127);
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            v128 *= objc_msgSend(v129, "unsignedIntegerValue");

            ++v127;
          }
          while (v120 != v127);
        }
      }
      else
      {
        v128 = 1;
        v61 = v174;
      }
      objc_msgSend(v39, "setSourceStrideSecondary:", v128);
    }
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "descriptor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = CPU_BuildBNNSNDArrayDescriptor((uint64_t)v20, v175, 0, 0, objc_msgSend(v131, "dataType"), 1, 0);

    if (!v132
      || (objc_msgSend(v8, "objectAtIndexedSubscript:", 1),
          v133 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v133, "descriptor"),
          v134 = (void *)objc_claimAutoreleasedReturnValue(),
          v135 = CPU_BuildBNNSNDArrayDescriptor((uint64_t)(v20 + 46), v61, 0, 0, objc_msgSend(v134, "dataType"), 1, 0), v134, v133, !v135))
    {
      v67 = 0;
LABEL_67:
      v60 = v175;
      goto LABEL_68;
    }
    v136 = (uint64_t)(v20 + 92);
    objc_msgSend(v38, "descriptor");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "shape");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "descriptor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "stride");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "descriptor");
    v141 = v61;
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v136) = CPU_BuildBNNSNDArrayDescriptor(v136, v138, v140, 0, objc_msgSend(v142, "dataType"), 1, 0);

    v61 = v141;
    v67 = 0;
    v60 = v175;
    if ((v136 & 1) != 0)
    {
LABEL_59:
      objc_msgSend(v39, "setResultStride:", CPU_SetBatchStride(v38));
      objc_msgSend(v39, "inDeltaData");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "objectAtIndexedSubscript:", 0);
      v144 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v145 = objc_msgSend(v144, "bytes");

      objc_msgSend(v39, "outDeltaData");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "objectAtIndexedSubscript:", 0);
      v147 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v148 = objc_msgSend(v147, "bytes");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v149, "descriptor");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      v175 = v60;
      CPU_BuildBNNSNDArrayDescriptor(v145, v60, 0, 0, objc_msgSend(v150, "dataType"), 1, 0);

      if (objc_msgSend(v39, "binaryOperation"))
      {
        objc_msgSend(v39, "inDeltaData");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v151, "objectAtIndexedSubscript:", 1);
        v152 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v153 = objc_msgSend(v152, "bytes");

        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "descriptor");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        CPU_BuildBNNSNDArrayDescriptor(v153, v61, 0, 0, objc_msgSend(v155, "dataType"), 1, 0);

      }
      v156 = v61;
      objc_msgSend(v38, "descriptor");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "shape");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "descriptor");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "stride");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "descriptor");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      CPU_BuildBNNSNDArrayDescriptor(v148, v158, v160, 0, objc_msgSend(v161, "dataType"), 1, 0);

      memset(v180, 0, sizeof(v180));
      LODWORD(v180[0]) = 1;
      v162 = MEMORY[0x1D8263954](v170, v180);
      if (!v162)
      {
        +[MLCLog framework](MLCLog, "framework");
        v163 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
          +[_MLCCPUArithmetic compileWithDevice:deviceOps:sourceTensors:resultTensor:].cold.1(v169, v163);

      }
      objc_opt_class();
      v164 = (void *)objc_opt_new();
      objc_msgSend(v39, "setLayer:", v164);

      objc_msgSend(v39, "layer");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "setFilter:", v162);

      v67 = 1;
      v61 = v156;
      goto LABEL_67;
    }
  }
  else
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "descriptor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "shape");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v178 = objc_msgSend(v42, "copy");

    v43 = *(_QWORD *)(v12 + 8);
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "descriptor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "shape");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "descriptor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "stride");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v176 = v8;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "descriptor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v43;
    LODWORD(v43) = CPU_BuildBNNSNDArrayDescriptor(v43, v46, v49, 0, objc_msgSend(v51, "dataType"), 1, 0);

    if ((_DWORD)v43)
    {
      *(_DWORD *)(v52 + 176) = 1;
      v38 = v173;
      objc_msgSend(v173, "descriptor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "shape");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "descriptor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "stride");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "descriptor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = CPU_BuildBNNSNDArrayDescriptor(v52 + 184, v54, v56, 0, objc_msgSend(v57, "dataType"), 1, 0);

      if (v58)
      {
        *(_DWORD *)(v52 + 360) = 1;
        v8 = v176;
        objc_msgSend(v176, "objectAtIndexedSubscript:", 0);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v172;
        objc_msgSend(v172, "setSourceStride:", CPU_SetBatchStride(v59));

        v60 = (void *)v178;
        v61 = v174;
        goto LABEL_59;
      }
      v67 = 0;
      v60 = (void *)v178;
      v8 = v176;
    }
    else
    {
      v67 = 0;
      v8 = v176;
      v60 = (void *)v178;
      v38 = v173;
    }
    v39 = v172;
    v61 = v174;
  }
LABEL_68:

  return v67;
}

+ (void)bnnsArithmeticFunctionFor:(NSObject *)a3 .cold.1(const char *a1, int a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 1024;
  v9 = a2;
  _os_log_error_impl(&dword_1D4999000, a3, OS_LOG_TYPE_ERROR, "%@: Unknown arithmetic operation type %d", (uint8_t *)&v6, 0x12u);

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
  _os_log_error_impl(&dword_1D4999000, a2, OS_LOG_TYPE_ERROR, "%@: BNNS filter could not be created", (uint8_t *)&v4, 0xCu);

}

@end
