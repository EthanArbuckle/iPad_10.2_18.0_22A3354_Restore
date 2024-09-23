@implementation MLCMultiheadAttentionLayer

+ (MLCMultiheadAttentionLayer)layerWithDescriptor:(MLCMultiheadAttentionDescriptor *)descriptor weights:(NSArray *)weights biases:(NSArray *)biases attentionBiases:(NSArray *)attentionBiases
{
  NSArray *v10;
  NSArray *v11;
  NSArray *v12;
  MLCMultiheadAttentionDescriptor *v13;
  void *v14;

  v10 = attentionBiases;
  v11 = biases;
  v12 = weights;
  v13 = descriptor;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:weights:bias:attentionBias:", v13, v12, v11, v10);

  return (MLCMultiheadAttentionLayer *)v14;
}

- (MLCMultiheadAttentionLayer)initWithDescriptor:(id)a3 weights:(id)a4 bias:(id)a5 attentionBias:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  NSObject *v17;
  MLCMultiheadAttentionLayer *v18;
  char v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  unint64_t v40;
  NSObject *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  unint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  void *v68;
  void *v69;
  unint64_t v70;
  void *v71;
  void *v72;
  NSObject *v73;
  MLCMultiheadAttentionLayer *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  unint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  NSObject *v111;
  void *v112;
  void *v113;
  void *v114;
  char v115;
  MLCMultiheadAttentionLayer *v116;
  id *p_isa;
  id *v118;
  void *v119;
  void *v120;
  void *v121;
  unint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  id v127;
  unint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  unint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  id v137;
  void *v138;
  void *v139;
  char v140;
  NSObject *v141;
  NSObject *v142;
  char v143;
  char v144;
  id obj;
  id v146;
  const char *v147;
  id v148;
  uint64_t v149;
  char v150;
  uint64_t v151;
  void *v152;
  void *v153;
  void *v154;
  char v155;
  char v156;
  void *v157;
  void *v158;
  void *v159;
  NSObject *v160;
  char v161;
  char v162;
  void *v163;
  MLCMultiheadAttentionLayer *v164;
  id *v165;
  unint64_t v166;
  id *v167;
  void *v168;
  void *v169;
  unint64_t v170;
  id *v171;
  objc_super v172;
  objc_super v173;
  _QWORD v174[2];
  void *v175;
  _QWORD v176[2];
  void *v177;
  _QWORD v178[2];
  void *v179;
  _QWORD v180[2];
  void *v181;
  _QWORD v182[2];
  void *v183;
  _QWORD v184[2];
  void *v185;
  _QWORD v186[3];
  _QWORD v187[2];
  _QWORD v188[3];
  _QWORD v189[2];
  _QWORD v190[3];
  _QWORD v191[2];
  _QWORD v192[3];
  _QWORD v193[4];

  v193[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (objc_msgSend(v13, "count") != 4)
  {
    +[MLCLog framework](MLCLog, "framework");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.17(a2);
    goto LABEL_11;
  }
  if (objc_msgSend(v12, "hasBiases"))
  {
    if (!v14)
    {
      +[MLCLog framework](MLCLog, "framework");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.1(a2);
      goto LABEL_11;
    }
    if (objc_msgSend(v14, "count") != 4)
    {
      +[MLCLog framework](MLCLog, "framework");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.16(a2);
      goto LABEL_11;
    }
  }
  v16 = objc_msgSend(v12, "hasBiases");
  if (v14 && (v16 & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.15(a2);
LABEL_11:
    v18 = 0;
    goto LABEL_12;
  }
  if (objc_msgSend(v12, "hasAttentionBiases"))
  {
    if (!v15)
    {
      +[MLCLog framework](MLCLog, "framework");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.2(a2);
      goto LABEL_11;
    }
    if (objc_msgSend(v15, "count") != 2)
    {
      +[MLCLog framework](MLCLog, "framework");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.14(a2);
      goto LABEL_11;
    }
  }
  v20 = objc_msgSend(v12, "hasAttentionBiases");
  if (v15 && (v20 & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.13(a2);
    goto LABEL_11;
  }
  obj = a4;
  v146 = a6;
  v147 = a2;
  v164 = self;
  v169 = v14;
  v21 = objc_msgSend(v12, "modelDimension");
  v151 = objc_msgSend(v12, "keyDimension");
  v149 = objc_msgSend(v12, "valueDimension");
  v22 = objc_msgSend(v12, "headCount");
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "descriptor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "shape");
  v17 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v193[0] = v157;
  v170 = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v193[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v193, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = v22;
  v168 = v15;
  v148 = a5;
  if (-[NSObject isEqualToArray:](v17, "isEqualToArray:", v26))
  {

    v27 = 0x1E0CB3000;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v192[0] = v28;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v170 / v22);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v22;
    v31 = (void *)v29;
    v192[1] = v29;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v192[2] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v192, 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = -[NSObject isEqualToArray:](v17, "isEqualToArray:", v33);

    v15 = v168;
    v27 = 0x1E0CB3000uLL;
    if ((v143 & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.12(v147);
      goto LABEL_54;
    }
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "descriptor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "shape");
  v36 = objc_claimAutoreleasedReturnValue();

  v37 = v170;
  objc_msgSend(*(id *)(v27 + 2024), "numberWithUnsignedInteger:", v170);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v191[0] = v158;
  objc_msgSend(*(id *)(v27 + 2024), "numberWithUnsignedInteger:", v151);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v191[1] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v191, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v27;
  if (-[NSObject isEqualToArray:](v36, "isEqualToArray:", v39))
  {
    v41 = v36;

    v42 = v40;
  }
  else
  {
    objc_msgSend(*(id *)(v27 + 2024), "numberWithUnsignedInteger:", v170);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v190[0] = v152;
    objc_msgSend(*(id *)(v27 + 2024), "numberWithUnsignedInteger:", v170 / v166);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v190[1] = v43;
    objc_msgSend(*(id *)(v27 + 2024), "numberWithUnsignedInteger:", v166);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v190[2] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v190, 3);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v36;
    v144 = -[NSObject isEqualToArray:](v36, "isEqualToArray:", v45);

    v15 = v168;
    v37 = v170;

    v42 = 0x1E0CB3000uLL;
    if ((v144 & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.11(v147);

      v18 = 0;
      v17 = v41;
      goto LABEL_55;
    }
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "descriptor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "shape");
  v17 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v42 + 2024), "numberWithUnsignedInteger:", v37);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v189[0] = v48;
  objc_msgSend(*(id *)(v42 + 2024), "numberWithUnsignedInteger:", v149);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v189[1] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v189, 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSObject isEqualToArray:](v17, "isEqualToArray:", v50))
  {

    v51 = v42;
  }
  else
  {
    objc_msgSend(*(id *)(v42 + 2024), "numberWithUnsignedInteger:", v37);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = v48;
    v188[0] = v153;
    v51 = v42;
    objc_msgSend(*(id *)(v42 + 2024), "numberWithUnsignedInteger:", v37 / v166);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v188[1] = v52;
    objc_msgSend(*(id *)(v42 + 2024), "numberWithUnsignedInteger:", v166);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v188[2] = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v188, 3);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v150 = -[NSObject isEqualToArray:](v17, "isEqualToArray:", v54);

    v37 = v170;
    v15 = v168;

    if ((v150 & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.10(v147);
      goto LABEL_54;
    }
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "descriptor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "shape");
  v57 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v51 + 2024), "numberWithUnsignedInteger:", v37);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v187[0] = v154;
  objc_msgSend(*(id *)(v51 + 2024), "numberWithUnsignedInteger:", v37);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v187[1] = v58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v187, 2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = v57;
  if (-[NSObject isEqualToArray:](v57, "isEqualToArray:", v59))
  {

    v60 = v148;
  }
  else
  {
    v62 = v51;
    objc_msgSend(*(id *)(v51 + 2024), "numberWithUnsignedInteger:", v37);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v186[0] = v63;
    objc_msgSend(*(id *)(v62 + 2024), "numberWithUnsignedInteger:", v37 / v166);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v186[1] = v64;
    objc_msgSend(*(id *)(v62 + 2024), "numberWithUnsignedInteger:", v166);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v186[2] = v65;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v186, 3);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = -[NSObject isEqualToArray:](v57, "isEqualToArray:", v66);

    v15 = v168;
    v60 = v148;
    if ((v67 & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v79 = objc_claimAutoreleasedReturnValue();
      self = v164;
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.9(v147);
      goto LABEL_59;
    }
  }
  if (!objc_msgSend(v12, "hasBiases"))
  {
    v14 = v169;
    v74 = v164;
    goto LABEL_49;
  }
  objc_msgSend(v169, "objectAtIndexedSubscript:", 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "descriptor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "shape");
  v17 = objc_claimAutoreleasedReturnValue();

  v70 = v170;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v170);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v185 = v71;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v185, 1);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSObject isEqualToArray:](v17, "isEqualToArray:", v72))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v170 / v166);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v184[0] = v80;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v166);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v184[1] = v81;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v184, 2);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = -[NSObject isEqualToArray:](v17, "isEqualToArray:", v82);

    v70 = v170;
    if ((v161 & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v111 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
        -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.8(v147);

      v18 = 0;
      goto LABEL_98;
    }
  }
  objc_msgSend(v169, "objectAtIndexedSubscript:", 1);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "descriptor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "shape");
  v85 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v70);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v183 = v86;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v183, 1);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSObject isEqualToArray:](v85, "isEqualToArray:", v87))
  {

    goto LABEL_65;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v70 / v166);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v182[0] = v88;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v166);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v182[1] = v89;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v182, 2);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = -[NSObject isEqualToArray:](v85, "isEqualToArray:", v90);

  v70 = v170;
  if ((v155 & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v141 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
      -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.7(v147);

    v18 = 0;
    v17 = v85;
LABEL_98:
    v15 = v168;
    v14 = v169;
    goto LABEL_56;
  }
LABEL_65:
  objc_msgSend(v169, "objectAtIndexedSubscript:", 2);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "descriptor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "shape");
  v17 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v70);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v181 = v93;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v181, 1);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSObject isEqualToArray:](v17, "isEqualToArray:", v94))
  {

    v95 = v70;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v70 / v166);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v180[0] = v163;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v166);
    v95 = v70;
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v180[1] = v104;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v180, 2);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = -[NSObject isEqualToArray:](v17, "isEqualToArray:", v105);

    if ((v156 & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v61 = objc_claimAutoreleasedReturnValue();
      v15 = v168;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.6(v147);
      goto LABEL_54;
    }
  }
  objc_msgSend(v169, "objectAtIndexedSubscript:", 3);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "descriptor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "shape");
  v108 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v95);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = v109;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v179, 1);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v168;
  v160 = v108;
  if (-[NSObject isEqualToArray:](v108, "isEqualToArray:", v110))
  {

    v14 = v169;
    v74 = v164;
    v60 = v148;
    goto LABEL_49;
  }
  v178[0] = &unk_1E98444E8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v95);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v178[1] = v138;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v178, 2);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = -[NSObject isEqualToArray:](v108, "isEqualToArray:", v139);

  if ((v140 & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v79 = objc_claimAutoreleasedReturnValue();
    self = v164;
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.5(v147);
LABEL_59:

    v18 = 0;
    v17 = v160;
    v14 = v169;
    goto LABEL_12;
  }
  v14 = v169;
  v74 = v164;
  v60 = v148;
LABEL_49:
  if (!objc_msgSend(v12, "hasAttentionBiases"))
  {
    v17 = v160;
LABEL_79:
    v173.receiver = v74;
    v173.super_class = (Class)MLCMultiheadAttentionLayer;
    v116 = -[MLCLayer initWithLabel:](&v173, sel_initWithLabel_, CFSTR("MultiheadAttention"));
    p_isa = (id *)&v116->super.super.isa;
    if (v116)
    {
      objc_storeStrong((id *)&v116->_descriptor, a3);
      v118 = p_isa + 26;
      objc_storeStrong(p_isa + 26, obj);
      v165 = p_isa + 27;
      objc_storeStrong(p_isa + 27, v60);
      v171 = p_isa;
      v167 = p_isa + 28;
      objc_storeStrong(p_isa + 28, v146);
      v119 = (void *)MEMORY[0x1E0C9AA60];
      v120 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      v121 = (void *)objc_msgSend(v119, "mutableCopy");
      if (objc_msgSend(v13, "count"))
      {
        v122 = 0;
        do
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", v122);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLCTensorParameter parameterWithTensor:](MLCTensorParameter, "parameterWithTensor:", v123);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "setObject:atIndexedSubscript:", v124, v122);

          objc_msgSend(*v118, "objectAtIndexedSubscript:", v122);
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "setIsLayerParameter:", 1);

          ++v122;
        }
        while (v122 < objc_msgSend(v13, "count"));
      }
      v126 = objc_msgSend(v120, "copy");
      v127 = v171[29];
      v171[29] = (id)v126;

      if (objc_msgSend(v12, "hasBiases") && objc_msgSend(v169, "count"))
      {
        v128 = 0;
        do
        {
          objc_msgSend(v169, "objectAtIndexedSubscript:", v128);
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLCTensorParameter parameterWithTensor:](MLCTensorParameter, "parameterWithTensor:", v129);
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "addObject:", v130);

          objc_msgSend(*v165, "objectAtIndexedSubscript:", v128);
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v131, "setIsLayerParameter:", 1);

          ++v128;
        }
        while (v128 < objc_msgSend(v169, "count"));
      }
      if (objc_msgSend(v12, "hasAttentionBiases") && objc_msgSend(v168, "count"))
      {
        v132 = 0;
        do
        {
          objc_msgSend(v168, "objectAtIndexedSubscript:", v132);
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLCTensorParameter parameterWithTensor:](MLCTensorParameter, "parameterWithTensor:", v133);
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "addObject:", v134);

          objc_msgSend(*v167, "objectAtIndexedSubscript:", v132);
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "setIsLayerParameter:", 1);

          ++v132;
        }
        while (v132 < objc_msgSend(v168, "count"));
      }
      v136 = objc_msgSend(v121, "copy");
      p_isa = v171;
      v137 = v171[30];
      v171[30] = (id)v136;

      v172.receiver = v171;
      v172.super_class = (Class)MLCMultiheadAttentionLayer;
      -[MLCLayer setIsUpdatable:](&v172, sel_setIsUpdatable_, 1);

      v14 = v169;
      v15 = v168;
    }
    self = p_isa;
    v18 = self;
    goto LABEL_12;
  }
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "descriptor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "shape");
  v17 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v170);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = v77;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v177, 1);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSObject isEqualToArray:](v17, "isEqualToArray:", v78))
  {

    goto LABEL_68;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v170 / v166);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v176[0] = v96;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v166);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v176[1] = v97;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v176, 2);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = -[NSObject isEqualToArray:](v17, "isEqualToArray:", v98);

  v15 = v168;
  if ((v162 & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.4(v147);
LABEL_54:

    v18 = 0;
LABEL_55:
    v14 = v169;
LABEL_56:
    self = v164;
    goto LABEL_12;
  }
LABEL_68:
  objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "descriptor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "shape");
  v101 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v170);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = v102;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v175, 1);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSObject isEqualToArray:](v101, "isEqualToArray:", v103))
  {

    v17 = v101;
    v14 = v169;
LABEL_78:
    v74 = v164;
    v60 = v148;
    goto LABEL_79;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v170 / v166);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v174[0] = v112;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v166);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v174[1] = v113;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v174, 2);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = -[NSObject isEqualToArray:](v101, "isEqualToArray:", v114);

  if ((v115 & 1) != 0)
  {
    v17 = v101;
    v15 = v168;
    v14 = v169;
    goto LABEL_78;
  }
  +[MLCLog framework](MLCLog, "framework");
  v142 = objc_claimAutoreleasedReturnValue();
  self = v164;
  if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
    -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.3(v147);

  v18 = 0;
  v17 = v101;
  v15 = v168;
  v14 = v169;
LABEL_12:

  return v18;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  char v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
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
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  unint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  NSObject *v113;
  void *v114;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  int v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  int v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  id v153;
  id v154;
  objc_super v155;
  uint8_t buf[4];
  void *v157;
  __int16 v158;
  int v159;
  __int16 v160;
  id v161;
  uint64_t v162;

  v162 = *MEMORY[0x1E0C80C00];
  v154 = a3;
  v8 = a4;
  v153 = a5;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "dimensionCount");

  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "modelDimension");
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "shape");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v11 - 1;
  objc_msgSend(v16, "objectAtIndexedSubscript:", v11 - 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntegerValue");

  if (v13 != v19)
  {
    +[MLCLog framework](MLCLog, "framework");
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      -[MLCMultiheadAttentionLayer compileForDevice:sourceTensors:resultTensor:].cold.8(a2);
    v79 = 0;
    v34 = v153;
    v43 = v154;
    goto LABEL_56;
  }
  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "keyDimension");
  objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "descriptor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "shape");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "unsignedIntegerValue");

  if (v21 != v26)
  {
    +[MLCLog framework](MLCLog, "framework");
    v78 = objc_claimAutoreleasedReturnValue();
    v34 = v153;
    v43 = v154;
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      -[MLCMultiheadAttentionLayer compileForDevice:sourceTensors:resultTensor:].cold.7(a2);
    goto LABEL_55;
  }
  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "valueDimension");
  objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "descriptor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "shape");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectAtIndexedSubscript:", v17);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "unsignedIntegerValue");

  v34 = v153;
  if (v28 != v33)
  {
    +[MLCLog framework](MLCLog, "framework");
    v78 = objc_claimAutoreleasedReturnValue();
    v43 = v154;
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      -[MLCMultiheadAttentionLayer compileForDevice:sourceTensors:resultTensor:].cold.6(a2);
    goto LABEL_55;
  }
  objc_msgSend(v153, "descriptor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "dimensionCount");

  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "modelDimension");
  objc_msgSend(v153, "descriptor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "shape");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectAtIndexedSubscript:", v36 - 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "unsignedIntegerValue");

  v43 = v154;
  if (v38 != v42)
  {
    +[MLCLog framework](MLCLog, "framework");
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      -[MLCMultiheadAttentionLayer compileForDevice:sourceTensors:resultTensor:].cold.5(a2);
    goto LABEL_55;
  }
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "descriptor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "dataType");

  if (!+[MLCLayer supportsDataType:onDevice:](MLCMultiheadAttentionLayer, "supportsDataType:onDevice:", v46, v154))
  {
    +[MLCLog framework](MLCLog, "framework");
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v157 = v80;
      v158 = 1024;
      v159 = v46;
      v160 = 2112;
      v161 = v154;
      _os_log_error_impl(&dword_1D4999000, v78, OS_LOG_TYPE_ERROR, "%@: MultiheadAttention layer with data type = %d is not supported on a device = %@", buf, 0x1Cu);

    }
    goto LABEL_55;
  }
  if (objc_msgSend(v8, "count") == 5)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "descriptor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "dimensionCount");

    if (v49 == 2)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "descriptor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "shape");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "descriptor");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = v52;
      objc_msgSend(v52, "objectAtIndexedSubscript:", objc_msgSend(v142, "dimensionCount") - 2);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "unsignedIntegerValue");
      objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "descriptor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "shape");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "objectAtIndexedSubscript:", 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (v54 == objc_msgSend(v58, "unsignedIntegerValue"))
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "descriptor");
        v138 = v50;
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v134 = objc_msgSend(v60, "dataType");

        v34 = v153;
        v43 = v154;
        if (v134 == 4)
        {
          -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setHasKeyPaddingMask:", 1);

          objc_msgSend(v8, "objectAtIndexedSubscript:", 4);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "descriptor");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v63, "dimensionCount");

          if (v64 != 3)
            goto LABEL_53;
          objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "descriptor");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "shape");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "descriptor");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "objectAtIndexedSubscript:", objc_msgSend(v150, "dimensionCount") - 2);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v147, "unsignedIntegerValue");
          objc_msgSend(v8, "objectAtIndexedSubscript:", 4);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "descriptor");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "shape");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "objectAtIndexedSubscript:", 2);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          if (v69 != objc_msgSend(v72, "unsignedIntegerValue"))
          {

            v34 = v153;
            v43 = v154;
            goto LABEL_53;
          }
          objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "descriptor");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "shape");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "descriptor");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "objectAtIndexedSubscript:", objc_msgSend(v116, "dimensionCount") - 2);
          v132 = v68;
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v139 = objc_msgSend(v73, "unsignedIntegerValue");
          objc_msgSend(v8, "objectAtIndexedSubscript:", 4);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "descriptor");
          v130 = v65;
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "shape");
          v126 = v66;
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "objectAtIndexedSubscript:", 1);
          v120 = v67;
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v124 = objc_msgSend(v77, "unsignedIntegerValue");

          v34 = v153;
          v43 = v154;
          if (v139 != v124)
          {
LABEL_53:
            +[MLCLog framework](MLCLog, "framework");
            v78 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
              -[MLCMultiheadAttentionLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2);
LABEL_55:
            v79 = 0;
            goto LABEL_56;
          }
          goto LABEL_36;
        }
      }
      else
      {

        v34 = v153;
        v43 = v154;
      }
    }
    +[MLCLog framework](MLCLog, "framework");
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      -[MLCMultiheadAttentionLayer compileForDevice:sourceTensors:resultTensor:].cold.3(a2);
    goto LABEL_55;
  }
  if (objc_msgSend(v8, "count") == 4)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "descriptor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v82, "dimensionCount");

    if (v83 == 3)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "descriptor");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "shape");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "descriptor");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v148 = v96;
      objc_msgSend(v96, "objectAtIndexedSubscript:", objc_msgSend(v141, "dimensionCount") - 2);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(v98, "unsignedIntegerValue");
      objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "descriptor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "shape");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "objectAtIndexedSubscript:", 2);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      if (v99 == objc_msgSend(v92, "unsignedIntegerValue"))
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v131, "descriptor");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "shape");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "descriptor");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "objectAtIndexedSubscript:", objc_msgSend(v121, "dimensionCount") - 2);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = objc_msgSend(v117, "unsignedIntegerValue");
        objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "descriptor");
        v137 = v84;
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "shape");
        v119 = v90;
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "objectAtIndexedSubscript:", 1);
        v145 = v97;
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = objc_msgSend(v104, "unsignedIntegerValue");

        v34 = v153;
        v43 = v154;
        if (v133 == v127)
        {
LABEL_36:
          -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "setHasAttentionMask:", 1);
          goto LABEL_37;
        }
LABEL_50:
        +[MLCLog framework](MLCLog, "framework");
        v78 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          -[MLCMultiheadAttentionLayer compileForDevice:sourceTensors:resultTensor:].cold.4(a2);
        goto LABEL_55;
      }
      v114 = v100;
      v87 = v98;
      v86 = v141;
    }
    else
    {
      if (v83 != 2)
        goto LABEL_50;
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "descriptor");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "shape");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "descriptor");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v148 = v85;
      objc_msgSend(v85, "objectAtIndexedSubscript:", objc_msgSend(v86, "dimensionCount") - 2);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend(v87, "unsignedIntegerValue");
      objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "descriptor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "shape");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "objectAtIndexedSubscript:", 1);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      if (v88 == objc_msgSend(v92, "unsignedIntegerValue"))
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "descriptor");
        v136 = v84;
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v140 = objc_msgSend(v94, "dataType");

        v34 = v153;
        v43 = v154;
        if (v140 == 4)
        {
          -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "setHasKeyPaddingMask:", 1);
LABEL_37:

          goto LABEL_38;
        }
        goto LABEL_50;
      }
      v114 = v89;
      v97 = v144;
    }

    v34 = v153;
    v43 = v154;
    goto LABEL_50;
  }
LABEL_38:
  if ((unint64_t)objc_msgSend(v8, "count") >= 4)
  {
    v105 = 3;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v105);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "setComputeFlags:", objc_msgSend(v106, "computeFlags") | 8);

      ++v105;
    }
    while (v105 < objc_msgSend(v8, "count"));
  }
  objc_msgSend(v43, "computeEngine");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCMultiheadAttentionLayer weights](self, "weights");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCMultiheadAttentionLayer biases](self, "biases");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCMultiheadAttentionLayer attentionBiases](self, "attentionBiases");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "multiheadAttentionLayerWithDescriptor:weights:bias:attnBias:inferenceOnly:", v108, v109, v110, v111, -[MLCLayer compileForInferenceOnly](self, "compileForInferenceOnly"));
  v78 = objc_claimAutoreleasedReturnValue();

  if (!v78 || !-[NSObject count](v78, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v113 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
      -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2, (uint64_t)v78, v113);

    goto LABEL_55;
  }
  objc_msgSend(v43, "computeEngine");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v112, "compileLayerDeviceOps:sourceTensors:resultTensor:", v78, v8, v34);

  v155.receiver = self;
  v155.super_class = (Class)MLCMultiheadAttentionLayer;
  -[MLCLayer bindDevice:deviceOps:](&v155, sel_bindDevice_deviceOps_, v43, v78);
LABEL_56:

  return v79;
}

- (BOOL)allocateDataForOptimizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  int v20;
  unint64_t i;
  void *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v4 = a3;
  -[MLCMultiheadAttentionLayer biases](self, "biases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasAttentionBiases");

  if (v8)
  {
    if (!v6)
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    -[MLCMultiheadAttentionLayer attentionBiases](self, "attentionBiases");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v9);

  }
  -[MLCMultiheadAttentionLayer weights](self, "weights");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = 0;
    do
    {
      -[MLCMultiheadAttentionLayer weightsParameters](self, "weightsParameters");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCLayer device](self, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "allocateDataForOptimizer:device:isVector:", v4, v15, 0);

      ++v12;
      -[MLCMultiheadAttentionLayer weights](self, "weights");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

    }
    while (v12 < v17);
  }
  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "hasBiases"))
  {

    goto LABEL_11;
  }
  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hasAttentionBiases");

  if (v20)
  {
LABEL_11:
    for (i = 0; ; ++i)
    {
      -[MLCMultiheadAttentionLayer biases](self, "biases");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");
      -[MLCMultiheadAttentionLayer attentionBiases](self, "attentionBiases");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count") + v23;

      if (i >= v25)
        break;
      -[MLCMultiheadAttentionLayer biasesParameters](self, "biasesParameters");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", i);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCLayer device](self, "device");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "allocateDataForOptimizer:device:isVector:", v4, v28, 0);

    }
  }
  -[MLCLayer device](self, "device");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "computeEngine");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer deviceOps](self, "deviceOps");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCMultiheadAttentionLayer weights](self, "weights");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    v33 = v6;
  else
    v33 = 0;
  objc_msgSend(v30, "setMHALayerOptimizerDataForDeviceOps:optimizerDataForWeights:optimizerDataForBias:", v31, v32, v33);

  return 1;
}

- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  unint64_t i;
  void *v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v34;

  v4 = a3;
  v34 = a4;
  -[MLCMultiheadAttentionLayer weights](self, "weights");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      -[MLCMultiheadAttentionLayer weights](self, "weights");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "descriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 += objc_msgSend(v12, "tensorAllocationSizeInBytes");

      if (v4)
      {
        -[MLCMultiheadAttentionLayer weights](self, "weights");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "descriptor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "tensorAllocationSizeInBytes");
        v9 += objc_msgSend(v34, "numOptimizerDataBuffers") * v16;

      }
      ++v8;
      -[MLCMultiheadAttentionLayer weights](self, "weights");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

    }
    while (v8 < v18);
  }
  else
  {
    v9 = 0;
  }
  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "hasBiases"))
  {

  }
  else
  {
    -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hasAttentionBiases");

    if (!v21)
    {
      v22 = 0;
      goto LABEL_17;
    }
  }
  v22 = 0;
  for (i = 0; ; ++i)
  {
    -[MLCMultiheadAttentionLayer biases](self, "biases");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");
    -[MLCMultiheadAttentionLayer attentionBiases](self, "attentionBiases");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count") + v25;

    if (i >= v27)
      break;
    -[MLCMultiheadAttentionLayer biasesParameters](self, "biasesParameters");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", i);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "tensor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "descriptor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "tensorAllocationSizeInBytes");

    v22 += v32;
    if (v4)
      v22 += objc_msgSend(v34, "numOptimizerDataBuffers") * v32;
  }
LABEL_17:

  return v22 + v9;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4;
  void *v5;
  unint64_t i;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  for (i = 0; ; ++i)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "descriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shape");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (i >= v10)
      break;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "descriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shape");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MLCLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", objc_msgSend(v14, "unsignedIntegerValue"), i);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:atIndexedSubscript:", v16, i);

  }
  v17 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v17, objc_msgSend(v19, "dataType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCMultiheadAttentionLayer weights](self, "weights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCMultiheadAttentionLayer biases](self, "biases");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCMultiheadAttentionLayer attentionBiases](self, "attentionBiases");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { descriptor=%@ : weights=%@ : biases=%@ : attentioBias=%@ : resultTensor=%@ }"), v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)summarizedDOTDescription
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  float v9;
  double v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v23 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[MLCLayer layerID](self, "layerID");
  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v24, "modelDimension");
  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v22, "keyDimension");
  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "valueDimension");
  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "headCount");
  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dropout");
  v10 = v9;
  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasBiases");
  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasAttentionBiases");
  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Model Dimension: %lu    Key Dimension: %lu    Value Dimension: %lu<BR />Head Count: %lu          Dropout: %.03f           Has Biases: %hhd<BR />Has Attention Biases: %hhd    Adds Zero Attention: %hhd</FONT>>"), v21, v20, v19, v18, v5, v7, *(_QWORD *)&v10, v12, v14, objc_msgSend(v15, "addsZeroAttention"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  id v3;
  unint64_t i;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    for (i = 0; i < objc_msgSend(v3, "count"); ++i)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "descriptor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shape");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (i > 2)
      {
        if (v8 < 2)
        {
LABEL_9:
          v9 = 0;
          goto LABEL_10;
        }
      }
      else if (v8 < 3)
      {
        goto LABEL_9;
      }
    }
  }
  v9 = 1;
LABEL_10:

  return v9;
}

- (void)linkAssociatedTensors
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;

  -[MLCMultiheadAttentionLayer weights](self, "weights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    do
    {
      -[MLCMultiheadAttentionLayer weights](self, "weights");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "childLayers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", self);

      ++v5;
      -[MLCMultiheadAttentionLayer weights](self, "weights");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

    }
    while (v5 < v10);
  }
  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasBiases");

  if (v12)
  {
    -[MLCMultiheadAttentionLayer biases](self, "biases");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v15 = 0;
      do
      {
        -[MLCMultiheadAttentionLayer biases](self, "biases");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "childLayers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", self);

        ++v15;
        -[MLCMultiheadAttentionLayer biases](self, "biases");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

      }
      while (v15 < v20);
    }
  }
  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "hasAttentionBiases");

  if (v22)
  {
    -[MLCMultiheadAttentionLayer attentionBiases](self, "attentionBiases");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      v25 = 0;
      do
      {
        -[MLCMultiheadAttentionLayer attentionBiases](self, "attentionBiases");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndexedSubscript:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "childLayers");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", self);

        ++v25;
        -[MLCMultiheadAttentionLayer attentionBiases](self, "attentionBiases");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "count");

      }
      while (v25 < v30);
    }
  }
}

- (void)unlinkAssociatedTensors
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;

  -[MLCMultiheadAttentionLayer weights](self, "weights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    do
    {
      -[MLCMultiheadAttentionLayer weights](self, "weights");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "childLayers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObject:", self);

      ++v5;
      -[MLCMultiheadAttentionLayer weights](self, "weights");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

    }
    while (v5 < v10);
  }
  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasBiases");

  if (v12)
  {
    -[MLCMultiheadAttentionLayer biases](self, "biases");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v15 = 0;
      do
      {
        -[MLCMultiheadAttentionLayer biases](self, "biases");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "childLayers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeObject:", self);

        ++v15;
        -[MLCMultiheadAttentionLayer biases](self, "biases");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

      }
      while (v15 < v20);
    }
  }
  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "hasAttentionBiases");

  if (v22)
  {
    -[MLCMultiheadAttentionLayer attentionBiases](self, "attentionBiases");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      v25 = 0;
      do
      {
        -[MLCMultiheadAttentionLayer attentionBiases](self, "attentionBiases");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndexedSubscript:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "childLayers");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "removeObject:", self);

        ++v25;
        -[MLCMultiheadAttentionLayer attentionBiases](self, "attentionBiases");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "count");

      }
      while (v25 < v30);
    }
  }
}

- (void)allocateGradientsForParameters
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[MLCMultiheadAttentionLayer weights](self, "weights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "mutableCopy");

  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasBiases");

  if (v5)
  {
    -[MLCMultiheadAttentionLayer biases](self, "biases");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v6);

  }
  -[MLCMultiheadAttentionLayer descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasAttentionBiases");

  if (v8)
  {
    -[MLCMultiheadAttentionLayer attentionBiases](self, "attentionBiases");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v9);

  }
  -[MLCLayer device](self, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "computeEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer deviceOps](self, "deviceOps");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allocateParameterGradientsForDeviceOps:parameters:", v12, v13);

}

- (unint64_t)parametersCount
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;

  -[MLCMultiheadAttentionLayer weightsParameters](self, "weightsParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[MLCMultiheadAttentionLayer biasesParameters](self, "biasesParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MLCMultiheadAttentionLayer biasesParameters](self, "biasesParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 += objc_msgSend(v6, "count");

  }
  return v4;
}

- (MLCMultiheadAttentionDescriptor)descriptor
{
  return self->_descriptor;
}

- (NSArray)weights
{
  return self->_weights;
}

- (NSArray)biases
{
  return self->_biases;
}

- (NSArray)attentionBiases
{
  return self->_attentionBiases;
}

- (NSArray)weightsParameters
{
  return self->_weightsParameters;
}

- (NSArray)biasesParameters
{
  return self->_biasesParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biasesParameters, 0);
  objc_storeStrong((id *)&self->_weightsParameters, 0);
  objc_storeStrong((id *)&self->_attentionBiases, 0);
  objc_storeStrong((id *)&self->_biases, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: bias is set in descriptor but not provided", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: attentionBias is set in descriptor but not provided", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.3(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: value attention bias must of size modelDimension", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.4(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: key attention bias must of size modelDimension", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.5(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: output bias must of size modelDimension", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.6(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: value bias must of size modelDimension", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.7(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: key bias must of size modelDimension", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.8(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: query bias must of size modelDimension", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.9(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: output weights must be of shape modelDimension x modelDimension", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.10(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: value weights must be of shape modelDimension x valueDimension", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.11(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: key weights must be of shape modelDimension x keyDimension", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.12(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: query weights must be of shape modelDimension x modelDimension", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.13(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: attentionBias is not set in descriptor but provided", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.14(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: attentionBias must be an array of size 2", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.15(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: bias is not set in descriptor but provided", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.16(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: bias must be an array of size four", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.17(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: weights must be an array of size four corresponding to query, key, value and output projections respectively", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: attention mask is a 3D tensor of shape 1 x targetLength x sourceLength or (batch x headCount) x targetLength x sourceLength", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.3(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: key mask is a 2D BOOLean tensor of shape batch x sourceLength", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.4(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: key mask is a 2D BOOLean tensor of shape batch x sourceLength and attention mask is a 3D tensor of shape 1 x targetLength x sourceLength or (batch x headCount) x targetLength x sourceLength", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.5(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: output must of of shape batch x targetLength x modelDim", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.6(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: value must of of shape batch x sourceLength x valueDimension", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.7(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: key must be of shape batch x sourceLength x keyDimension", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.8(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: query must be of shape batch x targetLength x modelDim", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
