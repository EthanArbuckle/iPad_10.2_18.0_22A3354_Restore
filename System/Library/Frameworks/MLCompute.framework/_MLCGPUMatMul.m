@implementation _MLCGPUMatMul

+ (id)layerWithDevice:(id)a3 descriptor:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
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
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:descriptor:sourceTensors:resultTensor:", v13, v12, v11, v10);

  return v14;
}

- (_MLCGPUMatMul)initWithDevice:(id)a3 descriptor:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _MLCGPUMatMul *v14;
  void *v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
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
  void *v54;
  void *v55;
  void *v56;
  float v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  float v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  float v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  float v89;
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
  id v107;
  _MLCGPUMatMul *v108;
  _BOOL4 v109;
  _BOOL4 v110;
  void *v111;
  id v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  unsigned int v133;
  uint64_t v134;
  void *v135;
  void *v136;
  objc_super v137;
  objc_super v138;
  _QWORD v139[2];
  _QWORD v140[3];
  _QWORD v141[3];
  _QWORD v142[4];

  v142[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v138.receiver = self;
  v138.super_class = (Class)_MLCGPUMatMul;
  v14 = -[_MLCGPUMatMul init](&v138, sel_init);
  if (v14)
  {
    v107 = v13;
    objc_msgSend(v10, "deviceList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = objc_msgSend(v15, "count");

    v111 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    if ((objc_msgSend(v11, "transposesX") & 1) != 0 || objc_msgSend(v11, "transposesY"))
    {
      if (objc_msgSend(v11, "transposesX") && !objc_msgSend(v11, "transposesY"))
      {
        v133 = 0;
        v126 = 1;
      }
      else if ((objc_msgSend(v11, "transposesX") & 1) != 0 || (objc_msgSend(v11, "transposesY") & 1) == 0)
      {
        if (objc_msgSend(v11, "transposesX") && objc_msgSend(v11, "transposesY"))
        {
          v126 = 0x100000001;
          v133 = 1;
        }
        else
        {
          v126 = 0;
          v133 = 0;
        }
      }
      else
      {
        v133 = 0;
        v126 = 0x100000000;
      }
    }
    else
    {
      v133 = 0;
      v126 = 0x100000001;
    }
    v110 = (objc_msgSend(v11, "transposesX") & 1) == 0 && (objc_msgSend(v11, "transposesY") & 1) != 0
        || (objc_msgSend(v11, "transposesX") & 1) == 0 && (objc_msgSend(v11, "transposesY") & 1) == 0;
    v127 = v10;
    v136 = v11;
    v109 = objc_msgSend(v11, "transposesX") && !objc_msgSend(v11, "transposesY")
        || (objc_msgSend(v11, "transposesX") & 1) == 0 && (objc_msgSend(v11, "transposesY") & 1) == 0;
    v108 = v14;
    v16 = 0;
    v17 = 1;
    do
    {
      v18 = 0;
      v19 = v17;
      v142[v16] = 1;
      v20 = 1;
      while (1)
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "descriptor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "dimensionCount") - 2;

        if (v18 >= v23)
          break;
        objc_msgSend(v12, "objectAtIndexedSubscript:", v16);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "descriptor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "shape");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndexedSubscript:", v18);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v20 *= objc_msgSend(v27, "unsignedIntegerValue");
        v142[v16] = v20;

        ++v18;
      }
      v17 = 0;
      v16 = 1;
    }
    while ((v19 & 1) != 0);
    v10 = v127;
    v11 = v136;
    if (v125)
    {
      v28 = 0;
      v123 = v142[1];
      v124 = v142[0];
      do
      {
        objc_msgSend(v10, "deviceList");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectAtIndexedSubscript:", v28);
        v30 = objc_claimAutoreleasedReturnValue();

        v134 = v28;
        v135 = (void *)v30;
        if (v124 == v123)
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "descriptor");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "dimensionCount") - 2;

          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "descriptor");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v129 = objc_msgSend(v35, "dimensionCount") - 1;

          objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "descriptor");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "dimensionCount");

          objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "descriptor");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "dimensionCount") - 1;

          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "descriptor");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "shape");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectAtIndexedSubscript:", v33);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "descriptor");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "shape");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v122 = v41;
          objc_msgSend(v48, "objectAtIndexedSubscript:", v41);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          LODWORD(v48) = objc_msgSend(v11, "transposesX");
          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "descriptor");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "shape");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v52;
          if ((_DWORD)v48)
          {
            objc_msgSend(v52, "objectAtIndexedSubscript:", v33);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v118 = objc_msgSend(v54, "unsignedIntegerValue");

            objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "descriptor");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "shape");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "objectAtIndexedSubscript:", v129);
            v55 = v45;
            v45 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v52, "objectAtIndexedSubscript:", v129);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v118 = objc_msgSend(v55, "unsignedIntegerValue");
          }
          v128 = v38 - 2;

          if (objc_msgSend(v136, "transposesY"))
          {
            objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "descriptor");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "shape");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "objectAtIndexedSubscript:", v128);
            v63 = objc_claimAutoreleasedReturnValue();

            v49 = (void *)v63;
          }
          v64 = objc_alloc(MEMORY[0x1E0CC6F20]);
          v65 = objc_msgSend(v136, "transposesX");
          v66 = objc_msgSend(v136, "transposesY");
          v67 = objc_msgSend(v45, "unsignedIntegerValue");
          v131 = v45;
          v68 = objc_msgSend(v49, "unsignedIntegerValue");
          objc_msgSend(v136, "alpha");
          v119 = (void *)objc_msgSend(v64, "initWithDevice:transposeLeft:transposeRight:resultRows:resultColumns:interiorColumns:alpha:beta:", v30, v65, v66, v67, v68, v118, v69, 0.0);
          v112 = objc_alloc(MEMORY[0x1E0CC6F20]);
          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "descriptor");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "shape");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "objectAtIndexedSubscript:", v33);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v120 = objc_msgSend(v71, "unsignedIntegerValue");
          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "descriptor");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "shape");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "objectAtIndexedSubscript:", v129);
          v75 = v49;
          v117 = v49;
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = objc_msgSend(v76, "unsignedIntegerValue");
          v78 = objc_msgSend(v75, "unsignedIntegerValue");
          objc_msgSend(v136, "alpha");
          v130 = (void *)objc_msgSend(v112, "initWithDevice:transposeLeft:transposeRight:resultRows:resultColumns:interiorColumns:alpha:beta:", v30, v133, v126, v120, v77, v78, v79, 0.0);

          v114 = objc_alloc(MEMORY[0x1E0CC6F20]);
          objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "descriptor");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "shape");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "objectAtIndexedSubscript:", v128);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = objc_msgSend(v81, "unsignedIntegerValue");
          objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "descriptor");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "shape");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "objectAtIndexedSubscript:", v122);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = objc_msgSend(v86, "unsignedIntegerValue");
          v88 = objc_msgSend(v131, "unsignedIntegerValue");
          objc_msgSend(v136, "alpha");
          v90 = (void *)objc_msgSend(v114, "initWithDevice:transposeLeft:transposeRight:resultRows:resultColumns:interiorColumns:alpha:beta:", v135, HIDWORD(v126), v133, v82, v87, v88, v89, 0.0);

          v11 = v136;
          +[MLCMatMulGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:secondaryGradientKernel:](MLCMatMulGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:secondaryGradientKernel:", v119, v130, v90);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          v56 = 0;
          v58 = 0;
          v10 = v127;
          if (!v59)
            goto LABEL_44;
        }
        else
        {
          v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC7078]), "initWithDevice:sourceCount:", v30, 2);
          objc_msgSend(v11, "alpha");
          objc_msgSend(v56, "setAlpha:", v57);
          v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC7130]), "initWithDevice:axis:", v30, 2);
          +[MLCMatMulGPUDeviceOps deviceOps](MLCMatMulGPUDeviceOps, "deviceOps");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v59)
            goto LABEL_44;
        }
        objc_msgSend(v59, "setLayer:", objc_opt_class());
        objc_msgSend(v59, "setMatmulKernel:", v56);
        objc_msgSend(v59, "setReduceSumKernel:", v58);
        v132 = v58;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v11, "transposesX"));
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v141[0] = v91;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v133);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v141[1] = v92;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HIDWORD(v126));
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v141[2] = v93;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v141, 3);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = (void *)objc_msgSend(v94, "copy");
        objc_msgSend(v59, "setTransposeLeft:", v95);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v136, "transposesY"));
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v140[0] = v96;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v126);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v140[1] = v97;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v133);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v140[2] = v98;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v140, 3);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = (void *)objc_msgSend(v99, "copy");
        objc_msgSend(v59, "setTransposeRight:", v100);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v110);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v139[0] = v101;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v109);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v139[1] = v102;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v139, 2);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = (void *)objc_msgSend(v103, "copy");
        objc_msgSend(v59, "setGradientLeftRightMatrixSelectionFlags:", v104);

        v10 = v127;
        v11 = v136;

        v58 = v132;
        objc_msgSend(v59, "setSourceOfForwardNeededForGradient:", 1);
        objc_msgSend(v59, "setResultOfForwardNeededForGradient:", 0);
        objc_msgSend(v111, "addObject:", v59);
LABEL_44:

        v28 = v134 + 1;
      }
      while (v125 != v134 + 1);
    }
    v105 = (void *)objc_msgSend(v111, "copy");
    v14 = v108;
    v137.receiver = v108;
    v137.super_class = (Class)_MLCGPUMatMul;
    -[_MLCGPULayer setDeviceOps:](&v137, sel_setDeviceOps_, v105);

    v13 = v107;
  }

  return v14;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
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
  uint64_t v34;
  uint64_t v35;
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
  unint64_t v49;
  void *v50;
  void *v52;
  void *v53;
  uint64_t DataType;
  void *v55;
  uint64_t v56;
  char v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
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
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  unint64_t v120;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  id v129;
  id v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  char v139;
  uint64_t v140;
  void *v141;
  void *v142;
  _QWORD v143[2];
  _QWORD v144[3];
  _QWORD v145[3];
  _QWORD v146[3];
  uint64_t v147;
  uint64_t v148;
  _QWORD v149[3];
  _QWORD v150[5];

  v150[3] = *MEMORY[0x1E0C80C00];
  v130 = a3;
  v129 = a4;
  v9 = a5;
  v10 = a6;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v150[0] = v11;
  v131 = v9;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v150[1] = v12;
  v150[2] = v10;
  v128 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C9AA60];
  v133 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v15 = 0;
  v142 = (void *)objc_msgSend(v14, "mutableCopy");
  v132 = v13;
  do
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "descriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "dimensionCount") - 1;

    objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "descriptor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "dimensionCount") - 2;

    objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "descriptor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "shape");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = objc_msgSend(v25, "unsignedIntegerValue");

    objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "descriptor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "shape");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = objc_msgSend(v29, "unsignedIntegerValue");

    objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "descriptor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stride");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectAtIndexedSubscript:", v18);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = objc_msgSend(v33, "unsignedIntegerValue");

    v149[v15] = 1;
    v34 = 1;
    if (v21)
    {
      v35 = 0;
      v34 = 1;
      do
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "descriptor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "shape");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectAtIndexedSubscript:", v35);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v34 *= objc_msgSend(v39, "unsignedIntegerValue");
        v149[v15] = v34;

        ++v35;
      }
      while (v21 != v35);
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "descriptor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "shape");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "mutableCopy");
    objc_msgSend(v142, "setObject:atIndexedSubscript:", v43, v15);

    objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "descriptor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "shape");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "count");

    v48 = v142;
    if (v47 <= 3)
    {
      v49 = v47 - 4;
      do
      {
        objc_msgSend(v142, "objectAtIndexedSubscript:", v15);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "insertObject:atIndex:", &unk_1E9843FA8, 0);

      }
      while (!__CFADD__(v49++, 1));
    }
    v13 = v132;
    objc_msgSend(v132, "objectAtIndexedSubscript:", v15);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "descriptor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    DataType = GPU_GetDataType(objc_msgSend(v53, "dataType"));

    objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:matrices:rowBytes:matrixBytes:dataType:", v140, v138, v34, v134 * v138, v134 * v138 * v140, DataType);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "addObject:", v55);

    ++v15;
  }
  while (v15 != 3);
  v141 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  if (v149[0] == v149[1])
  {
    v147 = 0;
    v148 = 0;
  }
  else
  {
    v56 = 0;
    v57 = 1;
    do
    {
      v139 = v57;
      objc_msgSend(v48, "objectAtIndexedSubscript:", v56);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "objectAtIndexedSubscript:", 1);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "unsignedIntegerValue");
      objc_msgSend(v48, "objectAtIndexedSubscript:", 2);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "objectAtIndexedSubscript:", 1);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "unsignedIntegerValue");

      objc_msgSend(v48, "objectAtIndexedSubscript:", v56);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectAtIndexedSubscript:", 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "unsignedIntegerValue");
      objc_msgSend(v48, "objectAtIndexedSubscript:", 2);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "objectAtIndexedSubscript:", 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "unsignedIntegerValue");

      *(&v147 + v56) = (v60 != v63) | (2 * (v66 != v69));
      if (v66 == v69)
      {
        v70 = (void *)objc_msgSend(&unk_1E9844A38, "copy");
        objc_msgSend(v141, "setObject:atIndexedSubscript:", v70, 2 * v56);

        v71 = (void *)objc_msgSend(&unk_1E9844A50, "copy");
        objc_msgSend(v141, "setObject:atIndexedSubscript:", v71, (2 * v56) | 1);
      }
      else if (v60 == v63)
      {
        objc_msgSend(v142, "objectAtIndexedSubscript:", 2);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "objectAtIndexedSubscript:", 0);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v145[0] = v126;
        v82 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v142, "objectAtIndexedSubscript:", v56);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "objectAtIndexedSubscript:", 1);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = objc_msgSend(v122, "unsignedIntegerValue");
        objc_msgSend(v142, "objectAtIndexedSubscript:", v56);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "objectAtIndexedSubscript:", 2);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "numberWithUnsignedInteger:", objc_msgSend(v85, "unsignedIntegerValue") * v83);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v145[1] = v86;
        objc_msgSend(v142, "objectAtIndexedSubscript:", v56);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "objectAtIndexedSubscript:", 3);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v145[2] = v88;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v145, 3);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = (void *)objc_msgSend(v89, "copy");

        objc_msgSend(v141, "setObject:atIndexedSubscript:", v71, 2 * v56);
        v144[0] = &unk_1E9843FA8;
        v90 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v142, "objectAtIndexedSubscript:", v56);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "objectAtIndexedSubscript:", 1);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = objc_msgSend(v127, "unsignedIntegerValue");
        objc_msgSend(v142, "objectAtIndexedSubscript:", v56);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "objectAtIndexedSubscript:", 2);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "numberWithUnsignedInteger:", objc_msgSend(v93, "unsignedIntegerValue") * v91);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v144[1] = v94;
        objc_msgSend(v142, "objectAtIndexedSubscript:", v56);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "objectAtIndexedSubscript:", 3);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v144[2] = v96;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v144, 3);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = (void *)objc_msgSend(v97, "copy");

        objc_msgSend(v141, "setObject:atIndexedSubscript:", v98, (2 * v56) | 1);
      }
      else
      {
        v72 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v142, "objectAtIndexedSubscript:", 2);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "objectAtIndexedSubscript:", 0);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v125, "unsignedIntegerValue");
        objc_msgSend(v142, "objectAtIndexedSubscript:", 2);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "objectAtIndexedSubscript:", 1);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "numberWithUnsignedInteger:", objc_msgSend(v74, "unsignedIntegerValue") * v73);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v146[0] = v75;
        objc_msgSend(v142, "objectAtIndexedSubscript:", v56);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "objectAtIndexedSubscript:", 2);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v146[1] = v77;
        objc_msgSend(v142, "objectAtIndexedSubscript:", v56);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "objectAtIndexedSubscript:", 3);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v146[2] = v79;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v146, 3);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = (void *)objc_msgSend(v80, "copy");

        objc_msgSend(v141, "setObject:atIndexedSubscript:", v71, 2 * v56);
        v81 = (void *)objc_msgSend(&unk_1E9844A68, "copy");
        objc_msgSend(v141, "setObject:atIndexedSubscript:", v81, (2 * v56) | 1);

      }
      v57 = 0;
      v56 = 1;
      v48 = v142;
    }
    while ((v139 & 1) != 0);
  }
  objc_msgSend(v130, "deviceList");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = objc_msgSend(v99, "count");

  if (v100)
  {
    v101 = 0;
    v102 = v147;
    v103 = v148;
    do
    {
      objc_msgSend(v129, "objectAtIndexedSubscript:", v101);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = (void *)objc_opt_new();
      objc_msgSend(v104, "setLayer:", v105);

      objc_msgSend(v104, "setMatrixDescs:", v133);
      v106 = (void *)objc_msgSend(v48, "copy");
      objc_msgSend(v104, "setShapes:", v106);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v102);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v143[0] = v107;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v103);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v143[1] = v108;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v143, 2);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = (void *)objc_msgSend(v109, "copy");
      objc_msgSend(v104, "setBroadcastingFlags:", v110);

      objc_msgSend(v104, "setReductionShapes:", v141);
      if ((unint64_t)objc_msgSend(v131, "count") >= 3)
      {
        objc_msgSend(v128, "descriptor");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "shape");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = objc_msgSend(v112, "count");

        objc_msgSend(v128, "descriptor");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = (void *)objc_msgSend(v114, "newShapeWithCount:", v113);
        objc_msgSend(v104, "setSource0Shape:", v115);

        objc_msgSend(v131, "objectAtIndexedSubscript:", 2);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "descriptor");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = (void *)objc_msgSend(v117, "newShapeWithCount:", v113);
        objc_msgSend(v104, "setSource1Shape:", v118);

        objc_msgSend(v104, "setArithmeticOp:", 0);
        objc_msgSend(v104, "setUseSourceGradientDeviceMemoryForResultGradientTensor:", 1);
      }

      ++v101;
      objc_msgSend(v130, "deviceList");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = objc_msgSend(v119, "count");

      v48 = v142;
    }
    while (v101 < v120);
  }

  return 1;
}

@end
