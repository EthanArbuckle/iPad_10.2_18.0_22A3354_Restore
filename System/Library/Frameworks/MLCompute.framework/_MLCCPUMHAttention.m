@implementation _MLCCPUMHAttention

- (_MLCCPUMHAttention)initWithDevice:(id)a3 descriptor:(id)a4 weights:(id)a5 bias:(id)a6 attnBias:(id)a7 inferenceOnly:(BOOL)a8
{
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
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
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _BOOL4 v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  _BOOL4 v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  _BOOL4 v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  _BOOL4 v115;
  void *v116;
  void *v117;
  _MLCCPUMHAttention *v118;
  void *v119;
  _MLCCPUMHAttention *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  _BOOL4 v143;
  int v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  _BOOL4 v166;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  void *v170;
  unint64_t v171;
  unint64_t v172;
  void *v173;
  id v175;
  void *v176;
  void *v177;
  void *v178;
  id v179;
  void *v180;
  id v181;
  id v182;
  uint64_t v183;
  void *v184;
  objc_super v185;
  _BYTE v186[2480];
  _QWORD v187[4];
  _QWORD v188[2];
  _QWORD v189[2];
  _QWORD v190[3];
  _QWORD v191[3];
  _QWORD v192[5];

  v166 = a8;
  v192[3] = *MEMORY[0x1E0C80C00];
  v175 = a3;
  v12 = a4;
  v13 = a5;
  v182 = a6;
  v181 = a7;
  v180 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  bzero(v186, 0x9B0uLL);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v186, 2480);
  v179 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = objc_msgSend(v179, "bytes");
  v15 = objc_msgSend(v12, "modelDimension");
  v169 = objc_msgSend(v12, "keyDimension");
  v167 = objc_msgSend(v12, "valueDimension");
  v176 = v12;
  v16 = objc_msgSend(v12, "headCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v192[0] = v17;
  v171 = v15 / v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v192[1] = v18;
  v172 = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v192[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v192, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "descriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v20, objc_msgSend(v22, "dataType"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v183 = v14;
  v24 = v14 + 176;
  objc_msgSend(v23, "descriptor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "shape");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = v23;
  objc_msgSend(v23, "descriptor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stride");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "data");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = v13;
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "descriptor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = CPU_BuildBNNSNDArrayDescriptorColMajor(v24, v26, v28, v30, objc_msgSend(v32, "dataType"), 3);

  if ((_DWORD)v24)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v169);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v191[0] = v33;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v171);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v191[1] = v34;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v172);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v191[2] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v191, 3);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v184, "objectAtIndexedSubscript:", 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "descriptor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v36, objc_msgSend(v38, "dataType"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "descriptor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "shape");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v170 = v39;
    objc_msgSend(v39, "descriptor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "stride");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "objectAtIndexedSubscript:", 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "data");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "objectAtIndexedSubscript:", 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "descriptor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v37) = CPU_BuildBNNSNDArrayDescriptorColMajor(v183 + 704, v41, v43, v45, objc_msgSend(v47, "dataType"), 3);

    if (!(_DWORD)v37)
    {
      v118 = 0;
      v120 = self;
      v119 = v175;
      v73 = v176;
      v116 = v181;
      v121 = v182;
LABEL_36:

      v20 = v36;
      goto LABEL_37;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v167);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v190[0] = v48;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v171);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v190[1] = v49;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v172);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v190[2] = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v190, 3);
    v51 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v184, "objectAtIndexedSubscript:", 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "descriptor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v168 = (void *)v51;
    +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v51, objc_msgSend(v53, "dataType"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v54, "descriptor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "shape");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v165 = v54;
    objc_msgSend(v54, "descriptor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "stride");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "objectAtIndexedSubscript:", 2);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "data");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "objectAtIndexedSubscript:", 2);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "descriptor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v52) = CPU_BuildBNNSNDArrayDescriptorColMajor(v183 + 1232, v56, v58, v60, objc_msgSend(v62, "dataType"), 3);

    if (!(_DWORD)v52)
      goto LABEL_13;
    objc_msgSend(v184, "objectAtIndexedSubscript:", 3);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "descriptor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "shape");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "objectAtIndexedSubscript:", 3);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "descriptor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "stride");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "objectAtIndexedSubscript:", 3);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "data");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "objectAtIndexedSubscript:", 3);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "descriptor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = CPU_BuildBNNSNDArrayDescriptorColMajor(v183 + 2120, v64, v67, v69, objc_msgSend(v71, "dataType"), 2);

    if (!v72)
    {
LABEL_13:
      v118 = 0;
      v120 = self;
      v119 = v175;
      v73 = v176;
      goto LABEL_14;
    }
    v73 = v176;
    if (objc_msgSend(v176, "hasBiases"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v171);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v189[0] = v74;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v172);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v189[1] = v75;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v189, 2);
      v76 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v182, "objectAtIndexedSubscript:", 0);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "descriptor");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v168 = (void *)v76;
      +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v76, objc_msgSend(v78, "dataType"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v79, "descriptor");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "shape");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = v79;
      objc_msgSend(v79, "descriptor");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "stride");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v182, "objectAtIndexedSubscript:", 0);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "data");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v182, "objectAtIndexedSubscript:", 0);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "descriptor");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v77) = CPU_BuildBNNSNDArrayDescriptorColMajor(v183 + 352, v81, v83, v85, objc_msgSend(v87, "dataType"), 2);

      if ((_DWORD)v77)
      {
        objc_msgSend(v163, "descriptor");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "shape");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v163, "descriptor");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "stride");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v182, "objectAtIndexedSubscript:", 1);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "data");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v182, "objectAtIndexedSubscript:", 1);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "descriptor");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = CPU_BuildBNNSNDArrayDescriptorColMajor(v183 + 880, v89, v91, v93, objc_msgSend(v95, "dataType"), 2);

        if (v96)
        {
          objc_msgSend(v163, "descriptor");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "shape");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v163, "descriptor");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "stride");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v182, "objectAtIndexedSubscript:", 2);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "data");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v182, "objectAtIndexedSubscript:", 2);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "descriptor");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = CPU_BuildBNNSNDArrayDescriptorColMajor(v183 + 1408, v98, v100, v102, objc_msgSend(v104, "dataType"), 2);

          if (v105)
          {
            objc_msgSend(v182, "objectAtIndexedSubscript:", 3);
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v161, "descriptor");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "shape");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v182, "objectAtIndexedSubscript:", 3);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "descriptor");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "stride");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v182, "objectAtIndexedSubscript:", 3);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "data");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v182, "objectAtIndexedSubscript:", 3);
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "descriptor");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            v115 = CPU_BuildBNNSNDArrayDescriptorColMajor(v183 + 2296, v107, v110, v112, objc_msgSend(v114, "dataType"), 1);

            if (!v115)
            {
              v118 = 0;
              v36 = v168;
              v120 = self;
              v119 = v175;
              v73 = v176;
              v116 = v181;
              v121 = v182;
              goto LABEL_35;
            }
            v73 = v176;
            v116 = v181;
            v117 = v168;
            goto LABEL_16;
          }
        }
        v157 = v163;
        v118 = 0;
      }
      else
      {
        v118 = 0;
        v157 = v163;
      }
      v120 = self;
      v119 = v175;
      v116 = v181;
      v121 = v182;
LABEL_33:
      v36 = v168;
LABEL_34:

      goto LABEL_35;
    }
    v117 = v168;
    v116 = v181;
LABEL_16:
    if (!objc_msgSend(v73, "hasAttentionBiases"))
    {
      v168 = v117;
      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v171);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v188[0] = v122;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v172);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v188[1] = v123;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v188, 2);
    v124 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v116, "objectAtIndexedSubscript:", 0);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "descriptor");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v168 = (void *)v124;
    +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v124, objc_msgSend(v126, "dataType"));
    v127 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v127, "descriptor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "shape");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v164 = v127;
    objc_msgSend(v127, "descriptor");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "stride");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "objectAtIndexedSubscript:", 0);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "data");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "objectAtIndexedSubscript:", 0);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "descriptor");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v126) = CPU_BuildBNNSNDArrayDescriptorColMajor(v183 + 1592, v129, v131, v133, objc_msgSend(v135, "dataType"), 2);

    if (!(_DWORD)v126)
    {
      v118 = 0;
      v157 = v164;
      v36 = v168;
      v120 = self;
      v119 = v175;
      v116 = v181;
      v121 = v182;
      goto LABEL_34;
    }
    objc_msgSend(v164, "descriptor");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "shape");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "descriptor");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "stride");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "objectAtIndexedSubscript:", 1);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "data");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "objectAtIndexedSubscript:", 1);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "descriptor");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = CPU_BuildBNNSNDArrayDescriptorColMajor(v183 + 1768, v136, v138, v140, objc_msgSend(v142, "dataType"), 2);

    if (v143)
    {
      v116 = v181;
LABEL_21:
      *(_BYTE *)(v183 + 1584) = objc_msgSend(v73, "addsZeroAttention");
      objc_msgSend(v73, "dropout");
      *(_DWORD *)(v183 + 2472) = v144;
      v145 = (void *)MEMORY[0x1E0C9AA60];
      v146 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      v178 = (void *)objc_msgSend(v145, "mutableCopy");
      v147 = (void *)objc_msgSend(v145, "mutableCopy");
      v148 = (void *)objc_msgSend(v145, "mutableCopy");
      v149 = (void *)objc_msgSend(v145, "mutableCopy");
      if (!v166)
      {
        v150 = v147;
        v151 = (void *)v146;
        v152 = 0;
        v187[0] = v183;
        v187[1] = v183 + 528;
        v187[2] = v183 + 1056;
        v187[3] = v183 + 1944;
        do
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v187[v152], 528);
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v151, "addObject:", v153);

          ++v152;
        }
        while (v152 != 4);
        objc_msgSend(v151, "objectAtIndexedSubscript:", 3);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v178, "addObject:", v154);

        objc_msgSend(v151, "removeLastObject");
        v146 = (uint64_t)v151;
        if ((objc_msgSend(v73, "hasAttentionBiases") & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v183 + 1592, 176);
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v149, "addObject:", v155);

          v146 = (uint64_t)v151;
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v183 + 1768, 176);
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v149, "addObject:", v156);

        }
        v147 = v150;
      }
      v157 = (void *)v146;
      +[MLCMHACPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCMHACPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", 44, v179, v146, v178, 0, 0, 0, 0);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = v175;
      if (v158)
      {
        objc_msgSend(v180, "addObject:", v158);
        objc_msgSend(v158, "setHasBias:", objc_msgSend(v73, "hasBiases"));
        objc_msgSend(v158, "setHasAttnBias:", objc_msgSend(v73, "hasAttentionBiases"));
        objc_msgSend(v158, "setHasKeyMask:", objc_msgSend(v73, "hasKeyPaddingMask"));
        objc_msgSend(v158, "setHasAttnMask:", objc_msgSend(v73, "hasAttentionMask"));
        objc_msgSend(v158, "setInferenceOnly:", v166);
        objc_msgSend(v158, "setAttnBiasDeltaData:", v149);
        objc_msgSend(v158, "setWeightsDeltaDataBytesArray:", v147);
        objc_msgSend(v158, "setBiasDeltaDataBytesArray:", v148);
      }
      v159 = (void *)objc_msgSend(v180, "copy");
      v185.receiver = self;
      v185.super_class = (Class)_MLCCPUMHAttention;
      v120 = -[_MLCCPULayer initWithDevice:deviceOps:](&v185, sel_initWithDevice_deviceOps_, v175, v159);

      v118 = v120;
      v121 = v182;
      goto LABEL_33;
    }
    v118 = 0;
    v120 = self;
    v119 = v175;
LABEL_14:
    v116 = v181;
    v121 = v182;
    v36 = v168;
LABEL_35:

    goto LABEL_36;
  }
  v118 = 0;
  v120 = self;
  v119 = v175;
  v73 = v176;
  v116 = v181;
  v121 = v182;
LABEL_37:

  return v118;
}

+ (id)layerWithDevice:(id)a3 descriptor:(id)a4 weights:(id)a5 bias:(id)a6 attnBias:(id)a7 inferenceOnly:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v8 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:descriptor:weights:bias:attnBias:inferenceOnly:", v18, v17, v16, v15, v14, v8);

  return v19;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  _BOOL4 v48;
  __int128 *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  unint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  unint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  unint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  unint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  void *v102;
  id v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  void *v113;
  id v114;
  uint64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  void *v124;
  id v125;
  uint64_t v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  id v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  BOOL v151;
  void *v152;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  uint64_t v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  uint64_t v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  unint64_t v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  unint64_t v175;
  unint64_t v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  id v182;
  uint64_t v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  uint64_t v197;
  __int128 *v198;
  id v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  uint64_t v204;
  id v205;
  void *v206;
  void *v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  _OWORD v219[3];

  v8 = a5;
  v205 = a6;
  objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "params");
  v199 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v199, "bytes");
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v200, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stride");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v207 = v8;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "dataType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v198 = (__int128 *)v9;
  v19 = CPU_BuildBNNSNDArrayDescriptorRowMajor(v9, v11, v14, 0, v17, 2, v18);

  if (!v19)
    goto LABEL_14;
  objc_msgSend(v207, "objectAtIndexedSubscript:", 1);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "descriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "shape");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "objectAtIndexedSubscript:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "descriptor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stride");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "objectAtIndexedSubscript:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "descriptor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "dataType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = CPU_BuildBNNSNDArrayDescriptorRowMajor((uint64_t)(v198 + 33), v21, v24, 0, v27, 2, v28);

  if (!v29)
    goto LABEL_14;
  objc_msgSend(v207, "objectAtIndexedSubscript:", 2);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "descriptor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "shape");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "objectAtIndexedSubscript:", 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "descriptor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stride");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "objectAtIndexedSubscript:", 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "descriptor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "dataType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = CPU_BuildBNNSNDArrayDescriptorRowMajor((uint64_t)(v198 + 66), v31, v34, 0, v37, 2, v38);

  if (!v39)
  {
LABEL_14:
    v151 = 0;
    v90 = v207;
    v40 = v205;
    goto LABEL_15;
  }
  v40 = v205;
  objc_msgSend(v205, "descriptor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "shape");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "descriptor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "stride");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "descriptor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "dataType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = CPU_BuildBNNSNDArrayDescriptorRowMajor((uint64_t)v198 + 1944, v42, v44, 0, v46, 2, v47);

  if (!v48)
  {
    v151 = 0;
    v90 = v207;
    goto LABEL_15;
  }
  v49 = v198;
  memset(v219, 0, 32);
  LODWORD(v219[0]) = 1;
  v50 = MEMORY[0x1D826399C](v198, v219);
  v51 = v206;
  if (v50)
  {
    objc_msgSend(v207, "objectAtIndexedSubscript:", 0);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v194, "descriptor");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "stride");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectAtIndexedSubscript:", 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "unsignedIntegerValue");
    objc_msgSend(v207, "objectAtIndexedSubscript:", 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "descriptor");
    v197 = v50;
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "stride");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v207, "objectAtIndexedSubscript:", 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "descriptor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "objectAtIndexedSubscript:", objc_msgSend(v59, "dimensionCount") - 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "setSourceStride:", v54 / objc_msgSend(v60, "unsignedIntegerValue"));

    objc_msgSend(v207, "objectAtIndexedSubscript:", 1);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v195, "descriptor");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "stride");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "objectAtIndexedSubscript:", 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "unsignedIntegerValue");
    objc_msgSend(v207, "objectAtIndexedSubscript:", 1);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "descriptor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "stride");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v207, "objectAtIndexedSubscript:", 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "descriptor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "objectAtIndexedSubscript:", objc_msgSend(v68, "dimensionCount") - 1);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "setSourceStrideSecondary:", v63 / objc_msgSend(v69, "unsignedIntegerValue"));

    objc_msgSend(v207, "objectAtIndexedSubscript:", 2);
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "descriptor");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "stride");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "objectAtIndexedSubscript:", 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "unsignedIntegerValue");
    objc_msgSend(v207, "objectAtIndexedSubscript:", 2);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "descriptor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "stride");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v207, "objectAtIndexedSubscript:", 2);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "descriptor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "objectAtIndexedSubscript:", objc_msgSend(v77, "dimensionCount") - 1);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "setSourceStrideTertiary:", v72 / objc_msgSend(v78, "unsignedIntegerValue"));

    v40 = v205;
    objc_msgSend(v205, "descriptor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "stride");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "objectAtIndexedSubscript:", 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "unsignedIntegerValue");
    objc_msgSend(v205, "descriptor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "stride");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v205, "descriptor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "objectAtIndexedSubscript:", objc_msgSend(v85, "dimensionCount") - 1);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "setResultStride:", v82 / objc_msgSend(v86, "unsignedIntegerValue"));

    v51 = v206;
    v50 = v197;

    v49 = v198;
  }
  v87 = 0x1E0CB3000;
  objc_opt_class();
  v88 = (void *)objc_opt_new();
  objc_msgSend(v51, "setLayer:", v88);

  objc_msgSend(v51, "layer");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setFilter:", v50);

  v90 = v207;
  if ((objc_msgSend(v51, "inferenceOnly") & 1) == 0)
  {
    objc_msgSend(v51, "inDeltaData");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "objectAtIndexedSubscript:", 0);
    v92 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v93 = objc_msgSend(v92, "bytes");

    v94 = *v49;
    v95 = v49[2];
    *(_OWORD *)(v93 + 16) = v49[1];
    *(_OWORD *)(v93 + 32) = v95;
    *(_OWORD *)v93 = v94;
    v96 = v49[3];
    v97 = v49[4];
    v98 = v49[6];
    *(_OWORD *)(v93 + 80) = v49[5];
    *(_OWORD *)(v93 + 96) = v98;
    *(_OWORD *)(v93 + 48) = v96;
    *(_OWORD *)(v93 + 64) = v97;
    v99 = v49[7];
    v100 = v49[8];
    v101 = v49[10];
    *(_OWORD *)(v93 + 144) = v49[9];
    *(_OWORD *)(v93 + 160) = v101;
    *(_OWORD *)(v93 + 112) = v99;
    *(_OWORD *)(v93 + 128) = v100;
    *(_QWORD *)(v93 + 88) = objc_msgSend(v51, "sourceStride");
    objc_msgSend(v51, "inDeltaData");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "objectAtIndexedSubscript:", 1);
    v103 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v104 = objc_msgSend(v103, "bytes");

    v105 = v198[33];
    v106 = v198[35];
    *(_OWORD *)(v104 + 16) = v198[34];
    *(_OWORD *)(v104 + 32) = v106;
    *(_OWORD *)v104 = v105;
    v107 = v198[36];
    v108 = v198[37];
    v109 = v198[39];
    *(_OWORD *)(v104 + 80) = v198[38];
    *(_OWORD *)(v104 + 96) = v109;
    *(_OWORD *)(v104 + 48) = v107;
    *(_OWORD *)(v104 + 64) = v108;
    v110 = v198[40];
    v111 = v198[41];
    v112 = v198[43];
    *(_OWORD *)(v104 + 144) = v198[42];
    *(_OWORD *)(v104 + 160) = v112;
    *(_OWORD *)(v104 + 112) = v110;
    *(_OWORD *)(v104 + 128) = v111;
    *(_QWORD *)(v104 + 88) = objc_msgSend(v51, "sourceStrideSecondary");
    objc_msgSend(v51, "inDeltaData");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "objectAtIndexedSubscript:", 2);
    v114 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v115 = objc_msgSend(v114, "bytes");

    v116 = v198[66];
    v117 = v198[68];
    *(_OWORD *)(v115 + 16) = v198[67];
    *(_OWORD *)(v115 + 32) = v117;
    *(_OWORD *)v115 = v116;
    v118 = v198[69];
    v119 = v198[70];
    v120 = v198[72];
    *(_OWORD *)(v115 + 80) = v198[71];
    *(_OWORD *)(v115 + 96) = v120;
    *(_OWORD *)(v115 + 48) = v118;
    *(_OWORD *)(v115 + 64) = v119;
    v121 = v198[73];
    v122 = v198[74];
    v123 = v198[76];
    *(_OWORD *)(v115 + 144) = v198[75];
    *(_OWORD *)(v115 + 160) = v123;
    *(_OWORD *)(v115 + 112) = v121;
    *(_OWORD *)(v115 + 128) = v122;
    *(_QWORD *)(v115 + 88) = objc_msgSend(v51, "sourceStrideTertiary");
    objc_msgSend(v51, "outDeltaData");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "objectAtIndexedSubscript:", 0);
    v125 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v126 = objc_msgSend(v125, "bytes");

    v127 = *(__int128 *)((char *)v198 + 1944);
    v128 = *(__int128 *)((char *)v198 + 1976);
    *(_OWORD *)(v126 + 16) = *(__int128 *)((char *)v198 + 1960);
    *(_OWORD *)(v126 + 32) = v128;
    *(_OWORD *)v126 = v127;
    v129 = *(__int128 *)((char *)v198 + 1992);
    v130 = *(__int128 *)((char *)v198 + 2008);
    v131 = *(__int128 *)((char *)v198 + 2040);
    *(_OWORD *)(v126 + 80) = *(__int128 *)((char *)v198 + 2024);
    *(_OWORD *)(v126 + 96) = v131;
    *(_OWORD *)(v126 + 48) = v129;
    *(_OWORD *)(v126 + 64) = v130;
    v132 = *(__int128 *)((char *)v198 + 2056);
    v133 = *(__int128 *)((char *)v198 + 2072);
    v134 = *(__int128 *)((char *)v198 + 2104);
    *(_OWORD *)(v126 + 144) = *(__int128 *)((char *)v198 + 2088);
    *(_OWORD *)(v126 + 160) = v134;
    *(_OWORD *)(v126 + 112) = v132;
    *(_OWORD *)(v126 + 128) = v133;
    *(_QWORD *)(v126 + 88) = objc_msgSend(v51, "resultStride");
  }
  if (objc_msgSend(v51, "hasKeyMask"))
  {
    v217 = 0u;
    v218 = 0u;
    v215 = 0u;
    v216 = 0u;
    v213 = 0u;
    v214 = 0u;
    v211 = 0u;
    v212 = 0u;
    v209 = 0u;
    v210 = 0u;
    v208 = 0u;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v208, 176);
    v135 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v136 = objc_msgSend(v135, "bytes");
    objc_msgSend(v207, "objectAtIndexedSubscript:", 3);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "descriptor");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "shape");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v207, "objectAtIndexedSubscript:", 3);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "descriptor");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "stride");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v136) = CPU_BuildBNNSNDArrayDescriptorRowMajor(v136, v139, v142, 0, 4, 1, &unk_1E98441D0);

    if ((_DWORD)v136)
    {
      objc_msgSend(v207, "objectAtIndexedSubscript:", 3);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "descriptor");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = objc_msgSend(v144, "dimensionCount");

      objc_msgSend(v207, "objectAtIndexedSubscript:", 3);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "descriptor");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "shape");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "objectAtIndexedSubscript:", v145 - 1);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "setKeyMaskStride:", objc_msgSend(v149, "unsignedIntegerValue"));

      v51 = v206;
      objc_msgSend(v206, "setKeyMask:", v135);

      v90 = v207;
      v87 = 0x1E0CB3000uLL;
      goto LABEL_12;
    }

    v151 = 0;
    v90 = v207;
LABEL_15:
    v51 = v206;
LABEL_16:
    v152 = v199;
    goto LABEL_17;
  }
LABEL_12:
  if ((objc_msgSend(v51, "hasKeyMask") & 1) != 0)
  {
    v150 = 4;
  }
  else if (objc_msgSend(v51, "hasAttnMask"))
  {
    v150 = 3;
  }
  else
  {
    v150 = 4;
  }
  if (!objc_msgSend(v51, "hasAttnMask"))
  {
    v151 = 1;
    goto LABEL_16;
  }
  v217 = 0u;
  v218 = 0u;
  v215 = 0u;
  v216 = 0u;
  v213 = 0u;
  v214 = 0u;
  v211 = 0u;
  v212 = 0u;
  v209 = 0u;
  v210 = 0u;
  v208 = 0u;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v208, 176);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "objectAtIndexedSubscript:", v150);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "descriptor");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "shape");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "objectAtIndexedSubscript:", 0);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = objc_msgSend(v158, "unsignedIntegerValue");

  objc_msgSend(v90, "objectAtIndexedSubscript:", v150);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "descriptor");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "shape");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v163 = (void *)objc_msgSend(v162, "mutableCopy");

  if (v159 == 1)
  {
    v164 = 2;
  }
  else
  {
    objc_msgSend(v90, "objectAtIndexedSubscript:", v150);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "descriptor");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "shape");
    v203 = v154;
    v167 = v163;
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "objectAtIndexedSubscript:", 0);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v170 = objc_msgSend(v169, "unsignedIntegerValue");

    objc_msgSend(v90, "objectAtIndexedSubscript:", 0);
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "descriptor");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "shape");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "objectAtIndexedSubscript:", 0);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    v175 = v87;
    v176 = objc_msgSend(v174, "unsignedIntegerValue");

    v163 = v167;
    v154 = v203;

    objc_msgSend(v163, "removeObjectAtIndex:", 0);
    objc_msgSend(*(id *)(v175 + 2024), "numberWithUnsignedInteger:", v170 / v176);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "insertObject:atIndex:", v177, 0);

    objc_msgSend(*(id *)(v175 + 2024), "numberWithUnsignedInteger:", v176);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "insertObject:atIndex:", v178, 0);

    v164 = 4;
  }
  v204 = v164;
  objc_msgSend(v90, "objectAtIndexedSubscript:", v150);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "descriptor");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v163, objc_msgSend(v180, "dataType"));
  v181 = (void *)objc_claimAutoreleasedReturnValue();

  v182 = objc_retainAutorelease(v154);
  v183 = objc_msgSend(v182, "bytes");
  objc_msgSend(v181, "descriptor");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "shape");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "descriptor");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "stride");
  v187 = v163;
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "objectAtIndexedSubscript:", v150);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "descriptor");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v183) = CPU_BuildBNNSNDArrayDescriptorRowMajor(v183, v185, v188, 0, objc_msgSend(v190, "dataType"), v204, 0);

  v90 = v207;
  v40 = v205;
  v51 = v206;
  v152 = v199;
  if ((_DWORD)v183)
  {
    objc_msgSend(v206, "setAttnMask:", v182);

    v151 = 1;
  }
  else
  {

    v151 = 0;
  }
LABEL_17:

  return v151;
}

+ (BOOL)setOptimizerDataForDevice:(id)a3 deviceOps:(id)a4 dataForWeights:(id)a5 dataForBias:(id)a6
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
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
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  void *v61;
  void *v62;
  unint64_t v63;
  uint64_t v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v74[6];
  _QWORD v75[6];

  v75[4] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a6;
  objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "inferenceOnly") & 1) == 0)
  {
    v71 = v9;
    objc_msgSend(v10, "params");
    v66 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v66, "bytes");
    v12 = (void *)MEMORY[0x1E0C9AA60];
    v68 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v67 = (void *)objc_msgSend(v12, "mutableCopy");
    v75[0] = v11 + 176;
    v75[1] = v11 + 704;
    v65 = v11;
    v75[2] = v11 + 1232;
    v75[3] = v11 + 2120;
    v72 = v10;
    v73 = v8;
    if (objc_msgSend(v8, "count"))
    {
      v13 = 0;
      do
      {
        v69 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "optimizerData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        if (v16)
        {
          v17 = 0;
          do
          {
            v18 = (void *)MEMORY[0x1E0C99D50];
            objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "optimizerData");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectAtIndexedSubscript:", v17);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "bytes");
            objc_msgSend(v73, "objectAtIndexedSubscript:", v13);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "optimizerData");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectAtIndexedSubscript:", v17);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "dataWithBytesNoCopy:length:freeWhenDone:", v22, objc_msgSend(v25, "length"), 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v10 = v72;
            objc_msgSend(v72, "weightsMomentumDataBytesArray");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectAtIndexedSubscript:", v13);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "addObject:", v26);

            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v75[v13], 176);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "objectAtIndexedSubscript:", v13);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "optimizerData");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectAtIndexedSubscript:", v17);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "bytes");
            v34 = objc_retainAutorelease(v29);
            *(_QWORD *)(objc_msgSend(v34, "bytes") + 136) = v33;

            v8 = v73;
            objc_msgSend(v69, "addObject:", v34);

            ++v17;
            objc_msgSend(v73, "objectAtIndexedSubscript:", v13);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "optimizerData");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "count");

          }
          while (v17 < v37);
        }
        objc_msgSend(v68, "addObject:", v69);

        ++v13;
      }
      while (v13 < objc_msgSend(v8, "count"));
    }
    v9 = v71;
    if (v71)
    {
      v74[0] = v65 + 352;
      v74[1] = v65 + 880;
      v74[2] = v65 + 1408;
      v74[3] = v65 + 2296;
      v74[4] = v65 + 1592;
      v74[5] = v65 + 1768;
      if (objc_msgSend(v71, "count"))
      {
        v38 = 0;
        do
        {
          v39 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
          objc_msgSend(v9, "objectAtIndexedSubscript:", v38);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "optimizerData");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "count");

          if (v42)
          {
            v43 = 0;
            v70 = v39;
            do
            {
              v44 = (void *)MEMORY[0x1E0C99D50];
              objc_msgSend(v9, "objectAtIndexedSubscript:", v38);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "optimizerData");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "objectAtIndexedSubscript:", v43);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = objc_msgSend(v47, "bytes");
              objc_msgSend(v9, "objectAtIndexedSubscript:", v38);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "optimizerData");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "objectAtIndexedSubscript:", v43);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "dataWithBytesNoCopy:length:freeWhenDone:", v48, objc_msgSend(v51, "length"), 0);
              v52 = (void *)objc_claimAutoreleasedReturnValue();

              v10 = v72;
              objc_msgSend(v72, "biasMomentumDataBytesArray");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "objectAtIndexedSubscript:", v38);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "addObject:", v52);

              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v74[v38], 176);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "objectAtIndexedSubscript:", v38);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "optimizerData");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "objectAtIndexedSubscript:", v43);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = objc_msgSend(v58, "bytes");
              v60 = objc_retainAutorelease(v55);
              *(_QWORD *)(objc_msgSend(v60, "bytes") + 136) = v59;

              v9 = v71;
              v39 = v70;

              objc_msgSend(v70, "addObject:", v60);
              ++v43;
              objc_msgSend(v71, "objectAtIndexedSubscript:", v38);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "optimizerData");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = objc_msgSend(v62, "count");

            }
            while (v43 < v63);
          }
          objc_msgSend(v67, "addObject:", v39);

          ++v38;
        }
        while (v38 < objc_msgSend(v9, "count"));
      }
      v8 = v73;
    }
    objc_msgSend(v10, "setWeightsMomentumDeltaDataArray:", v68);
    objc_msgSend(v10, "setBiasMomentumDeltaDataArray:", v67);

  }
  return 1;
}

@end
