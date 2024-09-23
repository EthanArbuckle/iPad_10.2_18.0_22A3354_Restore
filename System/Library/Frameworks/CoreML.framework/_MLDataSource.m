@implementation _MLDataSource

- (_MLDataSource)initWithMLFeatureProvider:(id)a3 forPrediction:(BOOL)a4 neuralNetworkEngine:(id)a5 error:(id *)a6
{
  _BOOL4 v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  MLMultiArray *v27;
  int v28;
  void *v29;
  void *v30;
  MLMultiArray *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  MLMultiArray *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  int v49;
  uint64_t v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  void *v54;
  char v55;
  MLMultiArray *v56;
  void *v57;
  id v58;
  char v59;
  void *v60;
  void *v61;
  char v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  char isKindOfClass;
  void *v78;
  void *v79;
  uint64_t v80;
  MLMultiArray *v81;
  void *v82;
  void *v83;
  void *v84;
  BOOL v85;
  void *v86;
  void *v87;
  void *v88;
  BOOL v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  _BOOL4 v94;
  id v95;
  uint64_t v96;
  id v97;
  id v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  _BOOL4 v104;
  id v105;
  uint64_t v106;
  id v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  BOOL v113;
  id v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  BOOL v118;
  id v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  _BOOL4 v124;
  NSDictionary *dataTensorDictionary;
  NSDictionary *v126;
  _MLDataSource *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  MLMultiArray *v133;
  id v134;
  void *v135;
  int v137;
  uint64_t v138;
  void *v139;
  void *v140;
  _MLDataSource *v141;
  id obj;
  uint64_t v143;
  NSDictionary *v144;
  id v145;
  uint64_t v146;
  void *v147;
  void *v148;
  MLMultiArray *v149;
  id v151;
  void *v152;
  void *v153;
  id v154;
  void *v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  objc_super v168;
  _QWORD v169[5];
  _QWORD v170[5];
  _QWORD v171[5];
  _QWORD v172[5];
  _QWORD v173[5];
  _BYTE v174[128];
  uint64_t v175;

  v7 = a4;
  v175 = *MEMORY[0x1E0C80C00];
  v151 = a3;
  v156 = a5;
  v168.receiver = self;
  v168.super_class = (Class)_MLDataSource;
  v141 = -[_MLDataSource init](&v168, sel_init);
  if (!v141)
    goto LABEL_99;
  objc_msgSend(v156, "modelDescription");
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inputDescriptionsByName");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trainingInputDescriptionsByName");
  }
  v153 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v144 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v156, "espressoInputShapes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithDictionary:", v11);
  v139 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v156, "espressoInputStrides");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithDictionary:", v13);
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  objc_msgSend(v153, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v164, v174, 16);
  if (!v14)
  {
    v137 = 0;
    v148 = 0;
    v145 = 0;
    goto LABEL_93;
  }
  v137 = 0;
  v148 = 0;
  v145 = 0;
  v146 = *(_QWORD *)v165;
  do
  {
    v143 = v14;
    for (i = 0; i != v143; ++i)
    {
      if (*(_QWORD *)v165 != v146)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * i);
      objc_msgSend(v151, "featureValueForName:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "objectForKeyedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isOptional");
      if (v17)
        v20 = 0;
      else
        v20 = v19;

      if (v20)
      {
        if (objc_msgSend(0, "type"))
        {
          objc_msgSend(v153, "objectForKeyedSubscript:", v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "type") != 5)
          {

LABEL_101:
            if (a6)
            {
              +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v145, CFSTR("Data provided in input: %@ is missing feature value for training input: %@"), v151, v16);
              *a6 = (id)objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_154;
          }
          objc_msgSend(0, "multiArrayValue");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "shape");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "count") == 0;

          if (!v24)
            goto LABEL_101;
        }
        if ((objc_msgSend(v156, "sequenceConcatConsumesOptionalInputNamed:", v16) & 1) != 0)
        {
          objc_msgSend(v153, "objectForKeyedSubscript:", v16);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "multiArrayConstraint");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "shape");
          v27 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();

          if (-[MLMultiArray count](v27, "count") != 1)
          {
            if (-[MLMultiArray count](v27, "count") == 2)
            {
              v35 = (void *)MEMORY[0x1E0C99DE8];
              v171[0] = &unk_1E3DA1D98;
              v171[1] = &unk_1E3DA1DB0;
              v171[2] = &unk_1E3DA1DB0;
              -[MLMultiArray objectAtIndexedSubscript:](v27, "objectAtIndexedSubscript:", 0);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v171[3] = v30;
              -[MLMultiArray objectAtIndexedSubscript:](v27, "objectAtIndexedSubscript:", 1);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v171[4] = v36;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v171, 5);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "arrayWithArray:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (-[MLMultiArray count](v27, "count") == 3)
              {
                v39 = (void *)MEMORY[0x1E0C99DE8];
                v170[0] = &unk_1E3DA1D98;
                v170[1] = &unk_1E3DA1DB0;
                -[MLMultiArray objectAtIndexedSubscript:](v27, "objectAtIndexedSubscript:", 0);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v170[2] = v30;
                -[MLMultiArray objectAtIndexedSubscript:](v27, "objectAtIndexedSubscript:", 1);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v170[3] = v36;
                -[MLMultiArray objectAtIndexedSubscript:](v27, "objectAtIndexedSubscript:", 2);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v170[4] = v37;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v170, 5);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "arrayWithArray:", v40);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v41 = -[MLMultiArray count](v27, "count");
                v42 = (void *)MEMORY[0x1E0C99DE8];
                if (v41 != 4)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v27);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "setObject:atIndexedSubscript:", &unk_1E3DA1D98, 0);
                  goto LABEL_33;
                }
                v169[0] = &unk_1E3DA1D98;
                -[MLMultiArray objectAtIndexedSubscript:](v27, "objectAtIndexedSubscript:", 0);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v169[1] = v30;
                -[MLMultiArray objectAtIndexedSubscript:](v27, "objectAtIndexedSubscript:", 1);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v169[2] = v36;
                -[MLMultiArray objectAtIndexedSubscript:](v27, "objectAtIndexedSubscript:", 2);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v169[3] = v37;
                -[MLMultiArray objectAtIndexedSubscript:](v27, "objectAtIndexedSubscript:", 3);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v169[4] = v40;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v169, 5);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "arrayWithArray:", v43);
                v38 = (void *)objc_claimAutoreleasedReturnValue();

              }
            }

            goto LABEL_32;
          }
          v28 = objc_msgSend(v156, "ndArrayInterpretation");
          v29 = (void *)MEMORY[0x1E0C99DE8];
          if (v28)
          {
            v173[0] = &unk_1E3DA1D98;
            v173[1] = &unk_1E3DA1DB0;
            v173[2] = &unk_1E3DA1DB0;
            v173[3] = &unk_1E3DA1DB0;
            -[MLMultiArray objectAtIndexedSubscript:](v27, "objectAtIndexedSubscript:", 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v173[4] = v30;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v173, 5);
          }
          else
          {
            v172[0] = &unk_1E3DA1D98;
            v172[1] = &unk_1E3DA1DB0;
            -[MLMultiArray objectAtIndexedSubscript:](v27, "objectAtIndexedSubscript:", 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v172[2] = v30;
            v172[3] = &unk_1E3DA1DB0;
            v172[4] = &unk_1E3DA1DB0;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v172, 5);
          }
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "arrayWithArray:", v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

LABEL_33:
          v44 = -[MLMultiArray initWithShape:dataType:error:]([MLMultiArray alloc], "initWithShape:dataType:error:", v38, 65600, a6);
          -[MLMultiArray fillWithNumber:](v44, "fillWithNumber:", &unk_1E3DA1D08);
          +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v44);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v31 = [MLMultiArray alloc];
          objc_msgSend(v153, "objectForKeyedSubscript:", v16);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "multiArrayConstraint");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "shape");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[MLMultiArray initWithShape:dataType:error:](v31, "initWithShape:dataType:error:", v34, 65600, a6);

          -[MLMultiArray fillWithNumber:](v27, "fillWithNumber:", &unk_1E3DA1D08);
          +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v27);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      if (!v17)
        goto LABEL_101;
      objc_msgSend(v153, "objectForKeyedSubscript:", v16);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "modelDescription");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "predictedFeatureName");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "isEqualToString:", v16);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v156, "lossTargetName");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "isEqualToString:", v16);

      }
      else
      {
        v49 = 0;
      }
      if (((v47 | v49) & 1) != 0 || v152)
      {
        v154 = v16;
        v50 = objc_msgSend(v17, "type");
        if (v50 == 4)
        {
          objc_msgSend(v152, "imageConstraint");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v61, "isAllowedValue:error:", v17, a6);

          if ((v62 & 1) != 0)
          {
            v63 = objc_msgSend(v17, "imageBufferValue");
            v64 = objc_alloc(MEMORY[0x1E0D1F498]);
            objc_msgSend(v156, "imagePreprocessingParameters");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "objectForKeyedSubscript:", v154);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v159 = v145;
            v67 = objc_msgSend(v64, "initWithCVPixelBuffer:imageParameters:error:", v63, v66, &v159);
            v68 = v159;

            if (!v67)
            {
              if (a6)
              {
                +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Failed to copy over image input"));
                v148 = 0;
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v148 = 0;
              }
              v145 = v68;
              goto LABEL_153;
            }
            v69 = (void *)v67;
            v145 = v68;
            v70 = v154;
            goto LABEL_86;
          }
          if (a6)
          {
            objc_msgSend(v152, "imageConstraint");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Image value for %@ does not comply with constraint: %@"), v154, v129);
            *a6 = (id)objc_claimAutoreleasedReturnValue();

          }
        }
        else
        {
          if (v50 == 5)
          {
            objc_msgSend(v17, "multiArrayValue");
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v147, "shape");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v51
              || (objc_msgSend(v147, "shape"),
                  v52 = (void *)objc_claimAutoreleasedReturnValue(),
                  v53 = objc_msgSend(v52, "count") == 0,
                  v52,
                  v51,
                  v53))
            {
              if (a6)
              {
                +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v145, CFSTR("Data provided for %@ has insufficient shape"), v154);
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }
              goto LABEL_119;
            }
            objc_msgSend(v152, "multiArrayConstraint");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v54, "isAllowedValue:isNeuralNetworkInputOrOutput:usingRank5Mapping:featureName:error:", v17, 1, objc_msgSend(v156, "ndArrayInterpretation") ^ 1, v154, a6);

            if ((v55 & 1) == 0)
            {
              if (a6)
              {
                objc_msgSend(v152, "multiArrayConstraint");
                v131 = (void *)objc_claimAutoreleasedReturnValue();
                +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("MLMultiArray value for %@ does not comply with constraint: %@"), v154, v131);
                *a6 = (id)objc_claimAutoreleasedReturnValue();

              }
LABEL_119:

              goto LABEL_153;
            }
            v56 = [MLMultiArray alloc];
            objc_msgSend(v147, "shape");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v163 = v145;
            v149 = -[MLMultiArray initWithShape:dataType:error:](v56, "initWithShape:dataType:error:", v57, 65568, &v163);
            v58 = v163;

            if (!v149)
            {
              if (a6)
              {
                objc_msgSend(v147, "shape");
                v132 = (void *)objc_claimAutoreleasedReturnValue();
                +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v58, CFSTR("Failed to create multi array of shape %@"), v132);
                *a6 = (id)objc_claimAutoreleasedReturnValue();

              }
              v133 = 0;
              goto LABEL_142;
            }
            v162 = v58;
            v59 = objc_msgSend(v147, "copyIntoMultiArray:error:", v149, &v162);
            v145 = v162;

            if ((v59 & 1) == 0)
            {
              v133 = v149;
              if (a6)
              {
                +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v145, CFSTR("Failed to copy over input multi array"));
                v134 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_130;
              }
LABEL_141:
              v58 = v145;
LABEL_142:

              v145 = v58;
              goto LABEL_153;
            }
            objc_msgSend(v156, "espressoInputShapes");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            if (v60)
            {

              goto LABEL_68;
            }
            objc_msgSend(v156, "espressoInputStrides");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = v84 == 0;

            if (!v85)
            {
LABEL_68:
              objc_msgSend(v156, "espressoInputShapes");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "objectForKeyedSubscript:", v154);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              if (v87)
              {

                goto LABEL_74;
              }
              objc_msgSend(v156, "espressoInputShapes");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "objectForKeyedSubscript:", v154);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              v94 = v93 == 0;

              if (!v94)
              {
LABEL_74:
                v95 = objc_alloc(MEMORY[0x1E0D1F498]);
                v96 = -[MLMultiArray mutableBytes](objc_retainAutorelease(v149), "mutableBytes");
                objc_msgSend(v156, "espressoInputShapes");
                v97 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v97, "objectForKeyedSubscript:", v154);
                v98 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v156, "espressoInputStrides");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v99, "objectForKeyedSubscript:", v154);
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                v101 = objc_msgSend(v95, "initWithData:type:shape:strides:", v96, 2, v98, v100);
                goto LABEL_79;
              }
            }
            objc_msgSend(v147, "shape");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            v112 = objc_msgSend(v156, "ndArrayInterpretation");
            v160 = 0;
            v161 = 0;
            v113 = +[MLDataConversionUtils populateEspressoShapeAndStridesFromInputShape:ndRepresentation:espressoShape:espressoStrides:error:](MLDataConversionUtils, "populateEspressoShapeAndStridesFromInputShape:ndRepresentation:espressoShape:espressoStrides:error:", v111, v112, &v161, &v160, a6);
            v97 = v161;
            v98 = v160;

            if (v113)
            {
              objc_msgSend(v139, "setObject:forKeyedSubscript:", v97, v154);
              objc_msgSend(v140, "setObject:forKeyedSubscript:", v98, v154);
              v114 = objc_alloc(MEMORY[0x1E0D1F498]);
              v115 = -[MLMultiArray mutableBytes](objc_retainAutorelease(v149), "mutableBytes");
              objc_msgSend(v139, "objectForKeyedSubscript:", v154);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v140, "objectForKeyedSubscript:", v154);
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              v101 = objc_msgSend(v114, "initWithData:type:shape:strides:", v115, 2, v99, v100);
              v137 = 1;
LABEL_79:

              if (v101)
              {
                objc_msgSend(v154, "stringByAppendingString:", CFSTR("_MultiArray"));
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSDictionary setObject:forKeyedSubscript:](v144, "setObject:forKeyedSubscript:", v149, v82);
                v138 = (uint64_t)v154;
                goto LABEL_85;
              }
              v133 = v149;
              if (!a6)
              {
                v148 = 0;
                goto LABEL_141;
              }
              +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Failed to copy over input multi array"));
              v134 = (id)objc_claimAutoreleasedReturnValue();
              v148 = 0;
LABEL_130:
              *a6 = v134;
            }
            else
            {
              if (a6)
              {
                +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Shape for multi array value of %@ is not allowed"), v154);
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }

            }
            v58 = v145;
            v133 = v149;
            goto LABEL_142;
          }
          objc_msgSend(v156, "modelDescription");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "predictedFeatureName");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = objc_msgSend(v72, "isEqualToString:", v154);

          if (v73)
          {
            if (objc_msgSend(v17, "type") != 1 && objc_msgSend(v17, "type") != 3
              || (objc_msgSend(v152, "isAllowedValue:error:", v17, a6) & 1) == 0)
            {
              if (a6)
              {
                +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Value for %@ does not comply with constraint in description: %@ (%@)"), v154, v152, *a6);
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }
              goto LABEL_153;
            }
            objc_msgSend(v156, "classLabels");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = v74;
            if (!v74 || (v147 = v74, !objc_msgSend(v74, "count")))
            {
              if (a6)
              {
                v147 = v75;
                +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Failed to derive valid training input from class label"));
                v128 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_107;
              }
LABEL_108:

              goto LABEL_153;
            }
            objc_msgSend(v75, "objectAtIndexedSubscript:", 0);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              v75 = v147;
              if (objc_msgSend(v17, "type") != 3)
              {
                if (a6)
                {
                  +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Predicted class is not in expected format"));
                  v128 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_107:
                  *a6 = v128;
                  v75 = v147;
                }
                goto LABEL_108;
              }
              objc_msgSend(v156, "classLabelToIndexMap");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "stringValue");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "objectForKeyedSubscript:", v79);
              v80 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v156, "classLabelToIndexMap");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v17, "int64Value"));
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "objectForKeyedSubscript:", v79);
              v80 = objc_claimAutoreleasedReturnValue();
            }
            v149 = (MLMultiArray *)v80;

            if (!v149)
            {
              v135 = v147;
              if (a6)
              {
                +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Invalid class label %@ provided as input"), v17);
                *a6 = (id)objc_claimAutoreleasedReturnValue();
                v135 = v147;
              }

              goto LABEL_153;
            }
            v81 = -[MLMultiArray initWithShape:dataType:error:]([MLMultiArray alloc], "initWithShape:dataType:error:", &unk_1E3DA2888, 65568, a6);
            v82 = v81;
            if (!v81)
            {
              if (a6)
              {
                +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Failed to copy over input multi array"));
                v82 = 0;
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v82 = 0;
              }
              goto LABEL_152;
            }
            -[MLMultiArray setObject:atIndexedSubscript:](v81, "setObject:atIndexedSubscript:", v149, 0);
            objc_msgSend(v156, "lossTargetName");
            v138 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v156, "espressoInputShapes");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            if (v83)
            {

              goto LABEL_71;
            }
            objc_msgSend(v156, "espressoInputStrides");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = v88 == 0;

            if (!v89)
            {
LABEL_71:
              objc_msgSend(v156, "espressoInputShapes");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "objectForKeyedSubscript:", v154);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              if (v91)
              {

                goto LABEL_76;
              }
              objc_msgSend(v156, "espressoInputShapes");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "objectForKeyedSubscript:", v154);
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              v104 = v103 == 0;

              if (!v104)
              {
LABEL_76:
                v105 = objc_alloc(MEMORY[0x1E0D1F498]);
                v106 = objc_msgSend(objc_retainAutorelease(v82), "mutableBytes");
                objc_msgSend(v156, "espressoInputShapes");
                v107 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v107, "objectForKeyedSubscript:", v154);
                v108 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v156, "espressoInputStrides");
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "objectForKeyedSubscript:", v154);
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                v101 = objc_msgSend(v105, "initWithData:type:shape:strides:", v106, 2, v108, v110);
                goto LABEL_83;
              }
            }
            objc_msgSend(v82, "shape");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            v117 = objc_msgSend(v156, "ndArrayInterpretation");
            v157 = 0;
            v158 = 0;
            v118 = +[MLDataConversionUtils populateEspressoShapeAndStridesFromInputShape:ndRepresentation:espressoShape:espressoStrides:error:](MLDataConversionUtils, "populateEspressoShapeAndStridesFromInputShape:ndRepresentation:espressoShape:espressoStrides:error:", v116, v117, &v158, &v157, a6);
            v107 = v158;
            v108 = v157;

            if (v118)
            {
              objc_msgSend(v139, "setObject:forKeyedSubscript:", v107, v154);
              objc_msgSend(v140, "setObject:forKeyedSubscript:", v108, v154);
              v119 = objc_alloc(MEMORY[0x1E0D1F498]);
              v120 = objc_msgSend(objc_retainAutorelease(v82), "mutableBytes");
              objc_msgSend(v139, "objectForKeyedSubscript:", v154);
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v140, "objectForKeyedSubscript:", v154);
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              v101 = objc_msgSend(v119, "initWithData:type:shape:strides:", v120, 2, v109, v110);
              v137 = 1;
LABEL_83:

              if (v101)
              {
                objc_msgSend(v154, "stringByAppendingString:", CFSTR("_MultiArray"));
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSDictionary setObject:forKeyedSubscript:](v144, "setObject:forKeyedSubscript:", v82, v121);

LABEL_85:
                v69 = (void *)v101;
                v70 = (id)v138;
LABEL_86:
                v148 = v69;
                v155 = v70;
                -[NSDictionary setObject:forKeyedSubscript:](v144, "setObject:forKeyedSubscript:");

                goto LABEL_87;
              }
              if (a6)
              {
                +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Failed to copy over input multi array"));
                v148 = 0;
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v148 = 0;
              }
            }
            else
            {
              if (a6)
              {
                +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Shape for multi array value of %@ is not allowed"), v154);
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }

            }
            v154 = (id)v138;
LABEL_152:

            goto LABEL_153;
          }
          if (a6)
          {
            objc_msgSend(v153, "objectForKeyedSubscript:", v154);
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("Input %@ is not in the expected format, expected: %@"), v154, v130);
            *a6 = (id)objc_claimAutoreleasedReturnValue();

          }
        }
LABEL_153:

LABEL_154:
        v127 = 0;
        goto LABEL_155;
      }
LABEL_87:

    }
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v164, v174, 16);
  }
  while (v14);
LABEL_93:

  objc_msgSend(v156, "espressoInputShapes");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v122)
  {
    objc_msgSend(v156, "espressoInputStrides");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = v123 == 0;

    if (((v124 | v137) & 1) == 0)
      goto LABEL_98;
    goto LABEL_97;
  }

  if ((v137 & 1) != 0)
  {
LABEL_97:
    objc_msgSend(v156, "setEspressoInputShapes:", v139);
    objc_msgSend(v156, "setEspressoInputStrides:", v140);
  }
LABEL_98:
  dataTensorDictionary = v141->_dataTensorDictionary;
  v141->_dataTensorDictionary = v144;
  v126 = v144;

LABEL_99:
  v127 = v141;
LABEL_155:

  return v127;
}

- (unint64_t)numberOfDataPoints
{
  return 1;
}

- (NSDictionary)dataTensorDictionary
{
  return self->_dataTensorDictionary;
}

- (void)setDataTensorDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dataTensorDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataTensorDictionary, 0);
}

@end
