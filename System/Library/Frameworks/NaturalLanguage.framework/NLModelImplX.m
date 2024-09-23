@implementation NLModelImplX

- (NLModelImplX)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  id v27;
  void *v28;
  id v29;
  NLModelImplX *v30;
  NLModelImplX *v31;
  uint64_t v32;
  NLModelConfiguration *configuration;
  uint64_t v34;
  NSData *customEmbeddingData;
  void *v36;
  uint64_t v37;
  NSDictionary *labelMap;
  NLModelImplX *v39;
  NLModelImplX *v40;
  NLModelImplX *v41;
  void *v42;
  unint64_t v43;
  id v44;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  void **v54;
  uint64_t *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  const __CFString **v67;
  uint64_t *v68;
  void *v69;
  id v70;
  uint64_t v71;
  void *v72;
  id v74;
  uint64_t v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v81;
  NLModelImplX *v82;
  id v83;
  id v84;
  id obj;
  objc_super v86;
  id v87;
  id v88;
  uint64_t v89;
  const __CFString *v90;
  uint64_t v91;
  const __CFString *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  const __CFString *v102;
  uint64_t v103;
  _QWORD v104[3];

  v104[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v83 = a5;
  v84 = a8;
  v88 = 0;
  v15 = a9;
  v75 = objc_msgSend(v14, "revision");
  v103 = *MEMORY[0x1E0D50598];
  v104[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, &v103, 1);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MRLNeuralNetworkCreate();
  stringForKey(v15, 0x1E4A3BC50, 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v72;
  stringForKeyWithDefault(v15, CFSTR("TrainingEmbeddingType"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  stringForKeyWithDefault(v15, CFSTR("EmbeddingModelIdentifier"), 0);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v71 = unsignedIntegerForKey(v15, 0x1E4A3BC90, 0);

  v20 = v17;
  v78 = v17;
  if (!v17)
  {
    objc_msgSend(v14, "language");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = v19;
  v77 = v19;
  if (!v19)
  {
    objc_msgSend(v14, "options");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    stringForKeyWithDefault(v22, CFSTR("EmbeddingType"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v21, "isEqualToString:", CFSTR("Static")))
  {
    if (!v20
      || (+[NLEmbedding wordEmbeddingForLanguage:revision:](NLEmbedding, "wordEmbeddingForLanguage:revision:", v20, v75), (v23 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      NSLog(CFSTR("Failed to load static embedding for language %@ revision %llu"), v20, v75);
LABEL_22:
      v24 = 0;
      goto LABEL_23;
    }
    goto LABEL_16;
  }
  if (objc_msgSend(v21, "isEqualToString:", CFSTR("Dynamic")))
  {
    if (!v20
      || (+[NLEmbedding contextualWordEmbeddingForLanguage:revision:](NLEmbedding, "contextualWordEmbeddingForLanguage:revision:", v20, v75), (v23 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      NSLog(CFSTR("Failed to load dynamic embedding for language %@ revision %llu"), v20, v75);
      goto LABEL_22;
    }
LABEL_16:
    v24 = v23;
LABEL_23:
    v26 = 0;
    goto LABEL_24;
  }
  if (objc_msgSend(v21, "isEqualToString:", CFSTR("Transformer")))
  {
    if (!v20
      || (+[NLEmbedding transformerContextualTokenEmbeddingForLanguage:](NLEmbedding, "transformerContextualTokenEmbeddingForLanguage:", v20), (v23 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      NSLog(CFSTR("Failed to load transformer embedding for language %@"), v20);
      goto LABEL_22;
    }
    goto LABEL_16;
  }
  if (!objc_msgSend(v21, "isEqualToString:", CFSTR("Contextual")))
  {
    if (!objc_msgSend(v21, "isEqualToString:", CFSTR("Custom")))
      goto LABEL_22;
    if (v84)
    {
      v87 = 0;
      +[NLEmbedding embeddingWithData:error:](NLEmbedding, "embeddingWithData:error:", v84, &v87);
      v24 = objc_claimAutoreleasedReturnValue();
      v27 = v87;
      if (v24)
        goto LABEL_40;
    }
    else
    {
      v27 = 0;
    }
    NSLog(CFSTR("Failed to load embedding from data"));
    v24 = 0;
LABEL_40:
    v26 = 0;
    if (!v16)
      goto LABEL_41;
    goto LABEL_25;
  }
  if (obj)
  {
    +[NLContextualEmbedding contextualEmbeddingWithModelIdentifier:](NLContextualEmbedding, "contextualEmbeddingWithModelIdentifier:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      NSLog(CFSTR("Failed to load contextual embedding for identifier %@"), obj);
      goto LABEL_22;
    }
  }
  else
  {
    if (!v20)
    {
      NSLog(CFSTR("Failed to load contextual embedding, no identifier specified"));
      goto LABEL_22;
    }
    +[NLContextualEmbedding contextualEmbeddingWithLanguage:](NLContextualEmbedding, "contextualEmbeddingWithLanguage:", v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      NSLog(CFSTR("Failed to load contextual embedding for language %@"), v20);
      goto LABEL_22;
    }
  }
  v42 = v25;
  if ((objc_msgSend(v25, "hasAvailableAssets") & 1) == 0)
  {
    NSLog(CFSTR("Assets not available for contextual embedding %@"), v42);
    requestContextualEmbeddingAssetsForEmbedding_0(v42);
  }
  v24 = 0;
  v26 = (unint64_t)v42;
LABEL_24:
  v27 = 0;
  if (!v16)
  {
LABEL_41:
    v40 = self;
LABEL_42:
    v36 = v83;
    if (!a10)
    {
      v41 = 0;
      goto LABEL_49;
    }
    if (v88)
    {
      v43 = v26;
      v44 = v88;
LABEL_48:
      v26 = v43;
      v41 = 0;
      *a10 = v44;
      goto LABEL_49;
    }
    if (v27)
    {
      v43 = v26;
      v44 = objc_retainAutorelease(v27);
      goto LABEL_48;
    }
    v74 = (id)v26;
    if (v24)
    {
      v81 = (void *)MEMORY[0x1E0CB35C8];
      v101 = *MEMORY[0x1E0CB2D50];
      v102 = CFSTR("Failed to load model file, invalid Transfer model data");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
      v46 = v14;
      v47 = v13;
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 1, v48);
      *a10 = (id)objc_claimAutoreleasedReturnValue();

      v13 = v47;
      v14 = v46;
      v27 = 0;
    }
    else
    {
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("Static")))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load model file, could not find static embedding for language %@ revision %llu"), v20, v75);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (void *)MEMORY[0x1E0CB35C8];
        v51 = v14;
        v52 = v13;
        v99 = *MEMORY[0x1E0CB2D50];
        v100 = v49;
        v53 = (void *)MEMORY[0x1E0C99D80];
        v54 = &v100;
        v55 = &v99;
      }
      else
      {
        if (!objc_msgSend(v21, "isEqualToString:", CFSTR("Dynamic")))
        {
          if (objc_msgSend(v21, "isEqualToString:", CFSTR("Transformer")))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load model file, could not find transformer embedding for language %@"), v20);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = (void *)MEMORY[0x1E0CB35C8];
            v95 = *MEMORY[0x1E0CB2D50];
            v96 = v57;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 8, v59);
            *a10 = (id)objc_claimAutoreleasedReturnValue();

            v36 = v83;
            v41 = 0;
          }
          else
          {
            v82 = v40;
            v60 = v14;
            if (objc_msgSend(v21, "isEqualToString:", CFSTR("Contextual")))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load model file, could not find contextual embedding for language %@"), v20);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = (void *)MEMORY[0x1E0CB35C8];
              v93 = *MEMORY[0x1E0CB2D50];
              v94 = v61;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 8, v63);
              *a10 = (id)objc_claimAutoreleasedReturnValue();

              v36 = v83;
              v41 = 0;
            }
            else
            {
              v76 = v13;
              v64 = objc_msgSend(v21, "isEqualToString:", CFSTR("Custom"));
              v65 = (void *)MEMORY[0x1E0CB35C8];
              if (v64)
              {
                v91 = *MEMORY[0x1E0CB2D50];
                v92 = CFSTR("Failed to load model file, invalid custom embedding");
                v66 = (void *)MEMORY[0x1E0C99D80];
                v67 = &v92;
                v68 = &v91;
              }
              else
              {
                v89 = *MEMORY[0x1E0CB2D50];
                v90 = CFSTR("Failed to load model file, invalid embedding type");
                v66 = (void *)MEMORY[0x1E0C99D80];
                v67 = &v90;
                v68 = &v89;
              }
              objc_msgSend(v66, "dictionaryWithObjects:forKeys:count:", v67, v68, 1);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 1, v69);
              *a10 = (id)objc_claimAutoreleasedReturnValue();

              v41 = 0;
              v13 = v76;
            }
            v14 = v60;
            v40 = v82;
          }
          v27 = 0;
          goto LABEL_58;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load model file, could not find dynamic embedding for language %@ revision %llu"), v20, v75);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (void *)MEMORY[0x1E0CB35C8];
        v51 = v14;
        v52 = v13;
        v97 = *MEMORY[0x1E0CB2D50];
        v98 = v49;
        v53 = (void *)MEMORY[0x1E0C99D80];
        v54 = &v98;
        v55 = &v97;
      }
      objc_msgSend(v53, "dictionaryWithObjects:forKeys:count:", v54, v55, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v52;
      v14 = v51;
      v27 = 0;
      objc_msgSend(v50, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 8, v56);
      *a10 = (id)objc_claimAutoreleasedReturnValue();

      v36 = v83;
    }
    v41 = 0;
LABEL_58:
    v26 = (unint64_t)v74;
    goto LABEL_49;
  }
LABEL_25:
  if (!(v24 | v26))
    goto LABEL_41;
  v70 = v27;
  v28 = (void *)v26;
  v29 = v13;
  v86.receiver = self;
  v86.super_class = (Class)NLModelImplX;
  v30 = -[NLModelImplX init](&v86, sel_init);
  if (!v30)
  {
    v40 = 0;
    v26 = (unint64_t)v28;
    v27 = v70;
    goto LABEL_42;
  }
  v31 = v30;
  v30->_montrealModel = (MontrealNeuralNetwork *)v16;
  v32 = objc_msgSend(v14, "copy");
  configuration = v31->_configuration;
  v31->_configuration = (NLModelConfiguration *)v32;

  objc_storeStrong((id *)&v31->_embedding, (id)v24);
  objc_storeStrong((id *)&v31->_contextualEmbedding, v28);
  v34 = objc_msgSend(v84, "copy");
  customEmbeddingData = v31->_customEmbeddingData;
  v31->_customEmbeddingData = (NSData *)v34;

  v36 = v83;
  v37 = objc_msgSend(v83, "copy");
  labelMap = v31->_labelMap;
  v31->_labelMap = (NSDictionary *)v37;

  v31->_numberOfTrainingInstances = v71;
  objc_storeStrong((id *)&v31->_trainingLanguage, v72);
  objc_storeStrong((id *)&v31->_trainingEmbeddingType, v18);
  objc_storeStrong((id *)&v31->_embeddingModelIdentifier, obj);
  objc_storeStrong((id *)&v31->_modelData, a3);
  v39 = v31;
  v26 = (unint64_t)v28;
  v40 = v39;
  v41 = v39;
  v13 = v29;
  v27 = v70;
LABEL_49:

  return v41;
}

- (NLModelImplX)initWithModelTrainer:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString **v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  NLModelImplX *v25;
  __CFString *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  __CFString *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  NLDataEnumerator *v60;
  void *v61;
  double Current;
  NLDataEnumerator *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  unint64_t v71;
  void *v72;
  void *v73;
  NSObject *v74;
  id v75;
  uint64_t v76;
  NLDataEnumerator *v77;
  id v78;
  id v79;
  const void *v80;
  void *v81;
  void *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NLModelImplX *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  id v97;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  NLDataEnumerator *v105;
  id v106;
  NLDataEnumerator *v107;
  __CFString *v108;
  void *v109;
  CFTypeRef cf;
  void *v111;
  uint64_t v112;
  id v113;
  unint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v124;
  void *v125;
  void *v126;
  __CFString *v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  NLDataEnumerator *v137;
  id v138;
  _QWORD v139[5];
  id v140;
  id v141;
  uint8_t v142[4];
  uint64_t v143;
  _QWORD v144[8];
  _QWORD v145[8];
  uint64_t v146;
  const __CFString *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  _BYTE buf[32];
  __int128 v161;
  uint64_t v162;

  v162 = *MEMORY[0x1E0C80C00];
  v141 = 0;
  v128 = a3;
  objc_msgSend(v128, "configuration");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "language");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "embeddingURL");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "embeddingModel");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "embeddingData");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "dataSet");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)buf = xmmword_1A36F74D0;
  *(int64x2_t *)&buf[16] = vdupq_n_s64(0x400uLL);
  v161 = xmmword_1A36F7900;
  +[NLDataSet dataSetWithDataSet:constraintParameters:modelTrainer:](NLDataSet, "dataSetWithDataSet:constraintParameters:modelTrainer:", v130, buf, v128);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "labelMap");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "inverseLabelMap");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v129, "revision");
  v114 = objc_msgSend(v130, "numberOfTrainingInstances");
  v7 = objc_msgSend(v130, "numberOfLabels");
  v8 = objc_msgSend(v130, "numberOfValidationInstances");
  objc_msgSend(v128, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = unsignedIntegerForKey(v9, (uint64_t)CFSTR("MaximumIterations"), 75);

  objc_msgSend(v129, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  stringForKeyWithDefault(v10, CFSTR("EmbeddingType"), 0);
  v127 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(v130, "dataProviderOfType:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recognizedLanguage");
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }
  v126 = v11;
  if (v127 || !v11)
  {
    if (-[__CFString isEqualToString:](v127, "isEqualToString:", CFSTR("Static")))
    {
      v16 = v126;
      if (v126)
      {
        +[NLEmbedding wordEmbeddingForLanguage:revision:](NLEmbedding, "wordEmbeddingForLanguage:revision:", v126, v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v126;
        if (v14)
          goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load static embedding for language %@ revision %llu"), v16, v6);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (a4)
      {
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v156 = *MEMORY[0x1E0CB2D50];
        v157 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v157, &v156, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 8, v20);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      requestWordEmbeddingAssetsForLanguage(v126);
      goto LABEL_40;
    }
    if (-[__CFString isEqualToString:](v127, "isEqualToString:", CFSTR("Dynamic")))
    {
      v16 = v126;
      if (v126)
      {
        +[NLEmbedding contextualWordEmbeddingForLanguage:revision:](NLEmbedding, "contextualWordEmbeddingForLanguage:revision:", v126, v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v126;
        if (v14)
          goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load dynamic embedding for language %@ revision %llu"), v16, v6);
      v21 = objc_claimAutoreleasedReturnValue();
      v18 = v21;
      if (a4)
      {
        v22 = (void *)MEMORY[0x1E0CB35C8];
        v154 = *MEMORY[0x1E0CB2D50];
        v155 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 8, v23);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      requestWordEmbeddingAssetsForLanguage(v126);
      goto LABEL_40;
    }
    if (-[__CFString isEqualToString:](v127, "isEqualToString:", CFSTR("Transformer")))
    {
      v16 = v126;
      if (v126)
      {
        +[NLEmbedding transformerContextualTokenEmbeddingForLanguage:](NLEmbedding, "transformerContextualTokenEmbeddingForLanguage:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v126;
        if (v14)
          goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load transformer embedding for language %@"), v16);
      v27 = objc_claimAutoreleasedReturnValue();
      v18 = v27;
      if (a4)
      {
        v28 = (void *)MEMORY[0x1E0CB35C8];
        v152 = *MEMORY[0x1E0CB2D50];
        v153 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v153, &v152, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 8, v29);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      requestWordEmbeddingAssetsForLanguage(v126);
      goto LABEL_40;
    }
    if (-[__CFString isEqualToString:](v127, "isEqualToString:", CFSTR("Contextual")))
    {
      v44 = v126;
      if (v126)
      {
        +[NLContextualEmbedding contextualEmbeddingWithLanguage:](NLContextualEmbedding, "contextualEmbeddingWithLanguage:");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v45;
        v44 = v126;
        if (v45)
        {
          if ((objc_msgSend(v45, "hasAvailableAssets", v126) & 1) != 0)
          {
            v36 = 0;
            v116 = 0;
            v117 = 0;
            v121 = 0;
LABEL_45:
            v124 = 0;
            if (!objc_msgSend(v14, "dimension"))
            {
              v24 = v14;
              v25 = 0;
              v26 = v36;
              goto LABEL_144;
            }
            v26 = v36;
            if (v114 < 2 || (v124 = 0, v7 < 2) || (v109 = v14, v8 <= 1))
            {
              v24 = v14;
              v25 = 0;
              goto LABEL_144;
            }
            goto LABEL_49;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assets not available for contextual embedding %@"), v14);
          v92 = objc_claimAutoreleasedReturnValue();
          v18 = v92;
          if (a4)
          {
            v93 = (void *)MEMORY[0x1E0CB35C8];
            v150 = *MEMORY[0x1E0CB2D50];
            v151 = v92;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v151, &v150, 1);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 8, v94);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          requestContextualEmbeddingAssetsForEmbedding_0(v14);
          v117 = 0;
LABEL_41:
          v121 = 0;
          v116 = 0;
          if (v18)
          {
LABEL_42:
            v33 = (const __CFString *)v18;
            v34 = v14;
            goto LABEL_43;
          }
LABEL_141:
          v26 = 0;
          if (v14)
            goto LABEL_44;
LABEL_142:
          v124 = 0;
          v24 = 0;
          goto LABEL_143;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load contextual embedding for language %@"), v44);
      v89 = objc_claimAutoreleasedReturnValue();
      v18 = v89;
      if (a4)
      {
        v90 = (void *)MEMORY[0x1E0CB35C8];
        v148 = *MEMORY[0x1E0CB2D50];
        v149 = v89;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v149, &v148, 1);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 8, v91);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_40:
      v117 = 0;
      v14 = 0;
      goto LABEL_41;
    }
    if (!-[__CFString isEqualToString:](v127, "isEqualToString:", CFSTR("Custom")))
    {
      v124 = 0;
      v24 = 0;
      v26 = 0;
      v116 = 0;
      v117 = 0;
      v121 = 0;
LABEL_143:
      v25 = 0;
      goto LABEL_144;
    }
    if (v119)
    {
      +[NLEmbedding _embeddingWithContentsOfURL:error:](NLEmbedding, "_embeddingWithContentsOfURL:error:", v119, 0);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      if (v117)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v119);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = 0;
      }
      else
      {
        +[NLModel modelWithContentsOfURL:error:](NLModel, "modelWithContentsOfURL:error:", v119, a4);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = v96;
        if (!v96)
        {
          v121 = 0;
          v116 = 0;
          goto LABEL_140;
        }
        objc_msgSend(v96, "embeddingData");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v121)
      {
        +[NLEmbedding _embeddingWithData:error:](NLEmbedding, "_embeddingWithData:error:", v121, a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          goto LABEL_23;
      }
      else
      {
        v121 = 0;
      }
LABEL_140:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load custom embedding from %@"), v119);
      v18 = objc_claimAutoreleasedReturnValue();
      v14 = 0;
      if (v18)
        goto LABEL_42;
      goto LABEL_141;
    }
    if (v118)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v95 = v118;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (+[NLModel modelWithMLModel:error:](NLModel, "modelWithMLModel:error:", v118, a4),
              (v95 = (id)objc_claimAutoreleasedReturnValue()) == 0))
        {
          v116 = 0;
          goto LABEL_146;
        }
      }
      v116 = v95;
      objc_msgSend(v95, "embeddingData");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      if (v121)
      {
        +[NLEmbedding _embeddingWithData:error:](NLEmbedding, "_embeddingWithData:error:", v121, a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0;
        if (v14)
        {
          v117 = 0;
          goto LABEL_23;
        }
        v33 = CFSTR("Failed to load custom embedding from model");
        v117 = 0;
LABEL_43:
        v35 = v33;
        NSLog(CFSTR("%@"), v33);
        objc_msgSend(v128, "logMessage:", v35);
        v14 = v34;
        v26 = (__CFString *)v35;
        if (v34)
        {
LABEL_44:
          v36 = v26;
          goto LABEL_45;
        }
        goto LABEL_142;
      }
LABEL_146:
      v121 = 0;
      v34 = 0;
      v117 = 0;
      v33 = CFSTR("Failed to load custom embedding from model");
      goto LABEL_43;
    }
    if (!v115)
    {
      v33 = CFSTR("Failed to load custom embedding, no embedding specified");
      if (a4)
      {
        v99 = (void *)MEMORY[0x1E0CB35C8];
        v146 = *MEMORY[0x1E0CB2D50];
        v147 = CFSTR("Failed to load custom embedding, no embedding specified");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 4, v100);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v116 = 0;
        v117 = 0;
        v121 = 0;
        v34 = 0;
        v33 = CFSTR("Failed to load custom embedding, no embedding specified");
      }
      else
      {
        v116 = 0;
        v117 = 0;
        v121 = 0;
        v34 = 0;
      }
      goto LABEL_43;
    }
    +[NLEmbedding _embeddingWithData:error:](NLEmbedding, "_embeddingWithData:error:", v115, 0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    if (v117)
    {
      v97 = v115;
      v116 = 0;
      goto LABEL_132;
    }
    +[NLModel modelWithData:error:](NLModel, "modelWithData:error:", v115, a4);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v101;
    if (v101)
    {
      objc_msgSend(v101, "embeddingData");
      v102 = objc_claimAutoreleasedReturnValue();
      if (v102)
      {
        v97 = (id)v102;
LABEL_132:
        v121 = v97;
        +[NLEmbedding _embeddingWithData:error:](NLEmbedding, "_embeddingWithData:error:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          goto LABEL_23;
        goto LABEL_156;
      }
    }
    else
    {
      v116 = 0;
    }
    v121 = 0;
LABEL_156:
    v34 = 0;
    v33 = CFSTR("Failed to load custom embedding from data");
    goto LABEL_43;
  }
  +[NLEmbedding contextualWordEmbeddingForLanguage:revision:](NLEmbedding, "contextualWordEmbeddingForLanguage:revision:", v11, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    +[NLEmbedding wordEmbeddingForLanguage:revision:](NLEmbedding, "wordEmbeddingForLanguage:revision:", v126, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = NLModelEmbeddingTypeStatic;
      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load embedding for language %@ revision %llu"), v126, v6);
    v30 = objc_claimAutoreleasedReturnValue();
    v18 = v30;
    if (a4)
    {
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v158 = *MEMORY[0x1E0CB2D50];
      v159 = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v159, &v158, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 8, v32);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    requestWordEmbeddingAssetsForLanguage(v126);
    v127 = 0;
    goto LABEL_40;
  }
  v15 = NLModelEmbeddingTypeDynamic;
LABEL_21:
  v127 = *v15;
LABEL_22:
  v116 = 0;
  v117 = 0;
  v121 = 0;
LABEL_23:
  v24 = 0;
  if (objc_msgSend(v14, "dimension", v16) && v114 > 1)
  {
    v25 = 0;
    if (v7 < 2)
    {
      v124 = v14;
      goto LABEL_36;
    }
    v124 = v14;
    v109 = 0;
    v26 = 0;
    if (v8 < 2)
    {
      v124 = v14;
      v25 = 0;
LABEL_36:
      v24 = 0;
      v26 = 0;
      goto LABEL_144;
    }
LABEL_49:
    v108 = v26;
    v37 = objc_msgSend(v14, "dimension");
    v38 = objc_msgSend(v125, "numberOfTrainingInstances");
    if (v38 < 0x21)
    {
      v42 = 1;
    }
    else
    {
      v39 = 16;
      if (v38 < 0x100)
        v39 = v38 >> 4;
      v40 = 3 * v39;
      if (3 * v39 >= v38)
        v40 = v38;
      if (v39 >= v40)
      {
        v42 = v39;
      }
      else
      {
        v41 = v38;
        v42 = v39;
        do
        {
          v43 = v39 + 1;
          if (v38 % (v39 + 1) < v41)
          {
            v42 = v39 + 1;
            v41 = v38 % (v39 + 1);
          }
          ++v39;
        }
        while (v40 != v43);
      }
    }
    v46 = objc_msgSend(v125, "numberOfValidationInstances");
    if (v46 < 0x21)
    {
      v50 = 1;
    }
    else
    {
      v47 = 16;
      if (v46 < 0x100)
        v47 = v46 >> 4;
      v48 = 3 * v47;
      if (3 * v47 >= v46)
        v48 = v46;
      if (v47 >= v48)
      {
        v50 = v47;
      }
      else
      {
        v49 = v46;
        v50 = v47;
        do
        {
          v51 = v47 + 1;
          if (v46 % (v47 + 1) < v49)
          {
            v50 = v47 + 1;
            v49 = v46 % (v47 + 1);
          }
          ++v47;
        }
        while (v48 != v51);
      }
    }
    v52 = *MEMORY[0x1E0D503C8];
    v144[0] = *MEMORY[0x1E0D503D0];
    v144[1] = v52;
    v145[0] = &unk_1E4A47CA8;
    v145[1] = &unk_1E4A47CC0;
    v144[2] = *MEMORY[0x1E0D503C0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v37);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v145[2] = v53;
    v144[3] = *MEMORY[0x1E0D503E8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7 - 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v145[3] = v54;
    v144[4] = *MEMORY[0x1E0D503A0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v42);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v145[4] = v55;
    v144[5] = *MEMORY[0x1E0D503B8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v50);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v145[5] = v56;
    v144[6] = *MEMORY[0x1E0D503E0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v112);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v145[6] = v57;
    v144[7] = *MEMORY[0x1E0D503D8];
    LODWORD(v58) = 973279855;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v145[7] = v59;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v145, v144, 8);
    v111 = (void *)objc_claimAutoreleasedReturnValue();

    cf = (CFTypeRef)MLPModelTrainerCreate();
    if (cf)
    {
      v60 = [NLDataEnumerator alloc];
      objc_msgSend(v125, "dataProviderOfType:", 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = -[NLDataEnumerator initWithDataProvider:](v60, "initWithDataProvider:", v61);

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      Current = CFAbsoluteTimeGetCurrent();
      if (objc_msgSend(v125, "numberOfValidationInstances"))
      {
        v63 = [NLDataEnumerator alloc];
        objc_msgSend(v125, "dataProviderOfType:", 1);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = -[NLDataEnumerator initWithDataProvider:](v63, "initWithDataProvider:", v64);

      }
      else
      {
        v107 = 0;
      }
      reportInstanceCompletionToTrainer(v128, v114 - 1, v114, 2);
      v65 = (void *)MEMORY[0x1E0CB3940];
      -[__CFString lowercaseString](v127, "lowercaseString");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "stringWithFormat:", CFSTR("Starting %@ transfer training with %llu training samples and %llu validation samples"), v66, v114, v8);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "logMessage:", v67);

      v68 = (void *)MEMORY[0x1A8592E0C]();
      NLGetLogCategory(0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "internal");
      v70 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = 0;
        _os_log_impl(&dword_1A36A7000, v70, OS_LOG_TYPE_INFO, "event: %lu", buf, 0xCu);
      }

      objc_autoreleasePoolPop(v68);
      if (objc_msgSend(&unk_1E4A47E00, "count"))
      {
        v71 = 0;
        do
        {
          v72 = (void *)MEMORY[0x1A8592E0C]();
          NLGetLogCategory(0);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "internal");
          v74 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(&unk_1E4A47E00, "objectAtIndexedSubscript:", v71);
            v75 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v76 = objc_msgSend(v75, "UTF8String");
            *(_DWORD *)buf = 134218498;
            *(_QWORD *)&buf[4] = 1;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v71;
            *(_WORD *)&buf[22] = 2082;
            *(_QWORD *)&buf[24] = v76;
            _os_log_impl(&dword_1A36A7000, v74, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %{public}s", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v72);
          ++v71;
        }
        while (v71 < objc_msgSend(&unk_1E4A47E00, "count"));
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      *(_QWORD *)&buf[24] = __Block_byref_object_copy__3;
      *(_QWORD *)&v161 = __Block_byref_object_dispose__3;
      *((_QWORD *)&v161 + 1) = &unk_1E4A47E28;
      v139[0] = 0;
      v139[1] = v139;
      v139[2] = 0x3032000000;
      v139[3] = __Block_byref_object_copy__3;
      v139[4] = __Block_byref_object_dispose__3;
      v140 = 0;
      v134 = v124;
      v135 = v109;
      v136 = v122;
      v137 = v105;
      v138 = v104;
      v113 = v103;
      v77 = v137;
      v78 = v134;
      v24 = v135;
      v132 = v136;
      v106 = v138;
      v133 = v128;
      v79 = v133;
      v131 = v79;
      v80 = (const void *)MLPModelTrainerTrainModel();
      v81 = (void *)MEMORY[0x1A8592E0C]();
      NLGetLogCategory(0);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "internal");
      v83 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v142 = 134217984;
        v143 = 3;
        _os_log_impl(&dword_1A36A7000, v83, OS_LOG_TYPE_INFO, "event: %lu", v142, 0xCu);
      }

      objc_autoreleasePoolPop(v81);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Finished transfer training in %.2f seconds"), CFAbsoluteTimeGetCurrent() - Current);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "logMessage:", v84);

      if (v80)
      {
        v25 = (NLModelImplX *)NLModelContainerCopyContainerData();
        CFRelease(v80);
      }
      else
      {
        v25 = 0;
      }
      CFRelease(cf);

      _Block_object_dispose(v139, 8);
      _Block_object_dispose(buf, 8);

      if (!v25)
      {
        v124 = v78;
        goto LABEL_109;
      }
      v85 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v114);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "dictionaryWithObjectsAndKeys:", v86, 0x1E4A3BC90, v127, 0x1E4A3BCD0, 0);
      v111 = (void *)objc_claimAutoreleasedReturnValue();

      if (v126)
        objc_msgSend(v111, "setObject:forKey:", v126, 0x1E4A3BC50);
      if (v24)
      {
        objc_msgSend(v24, "identifier");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "setObject:forKey:", v87, 0x1E4A3BCF0);

      }
      v88 = -[NLModelImplX initWithModelData:configuration:labelMap:vocabularyMap:documentFrequencyMap:customEmbeddingData:trainingInfo:error:](self, "initWithModelData:configuration:labelMap:vocabularyMap:documentFrequencyMap:customEmbeddingData:trainingInfo:error:", v25, v129, v120, 0, 0, v121, v111, 0);
      CFRelease(v25);
      v25 = v88;
      self = v25;
    }
    else
    {
      v25 = 0;
      if (a4 && v141)
      {
        v25 = 0;
        *a4 = v141;
      }
    }

    v24 = v109;
LABEL_109:
    v26 = v108;
    goto LABEL_144;
  }
  v124 = v14;
  v26 = 0;
  v25 = 0;
LABEL_144:

  return v25;
}

CFMutableDictionaryRef __43__NLModelImplX_initWithModelTrainer_error___block_invoke(void **a1, void *a2, unsigned int a3, int a4, _BYTE *a5)
{
  uint64_t v5;

  v5 = 9;
  if (a1[7] == a2)
    v5 = 8;
  return copySampleDataEnumerator_1(a2, a3, a4, a1[4], a1[5], a1[6], a1[v5], a1[7] == a2, a5);
}

void __43__NLModelImplX_initWithModelTrainer_error___block_invoke_2(uint64_t a1, unsigned int a2, void *a3, _BYTE *a4)
{
  _QWORD *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  float v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  double v18;
  void *v19;
  void *v20;
  NSObject *v21;
  float v22;
  void *v23;
  void *v24;
  NSObject *v25;
  float v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = (_QWORD *)MEMORY[0x1E0D503F0];
  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D503F0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) || objc_msgSend(v8, "compare:") == 1)
  {
    v27 = *(id *)(a1 + 32);
    v28 = *(id *)(a1 + 40);
    v29 = *(id *)(a1 + 48);
    v30 = *(id *)(a1 + 56);
    v31 = *(id *)(a1 + 64);
    objc_msgSend((id)MLPModelTrainerEvaluateModel(), "objectForKey:", *v7);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v10;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v9);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v8);
  v11 = *(void **)(a1 + 72);
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "floatValue");
  objc_msgSend(v12, "stringWithFormat:", CFSTR("Iteration %llu validation accuracy %.6f"), a2 + 1, v13 / 100.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logMessage:", v14);

  v15 = (void *)MEMORY[0x1A8592E0C]();
  NLGetLogCategory(0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "internal");
  v17 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_QWORD *)&v18 = *(_QWORD *)(a1 + 104) - a2;
    *(_DWORD *)buf = 134218496;
    v33 = 2;
    v34 = 2048;
    v35 = 0;
    v36 = 2048;
    v37 = v18;
    _os_log_impl(&dword_1A36A7000, v17, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %llu", buf, 0x20u);
  }

  objc_autoreleasePoolPop(v15);
  v19 = (void *)MEMORY[0x1A8592E0C]();
  NLGetLogCategory(0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "internal");
  v21 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "floatValue");
    *(_DWORD *)buf = 134218496;
    v33 = 2;
    v34 = 2048;
    v35 = 1;
    v36 = 2048;
    v37 = v22 / 100.0;
    _os_log_impl(&dword_1A36A7000, v21, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %f", buf, 0x20u);
  }

  objc_autoreleasePoolPop(v19);
  v23 = (void *)MEMORY[0x1A8592E0C]();
  NLGetLogCategory(0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "internal");
  v25 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "floatValue");
    *(_DWORD *)buf = 134218496;
    v33 = 2;
    v34 = 2048;
    v35 = 2;
    v36 = 2048;
    v37 = v26 / 100.0;
    _os_log_impl(&dword_1A36A7000, v25, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %f", buf, 0x20u);
  }

  objc_autoreleasePoolPop(v23);
  if (objc_msgSend(*(id *)(a1 + 72), "shouldStop"))
    *a4 = 1;

}

CFMutableDictionaryRef __43__NLModelImplX_initWithModelTrainer_error___block_invoke_3(void **a1, uint64_t a2, unsigned int a3, int a4, _BYTE *a5)
{
  return copySampleDataEnumerator_1(a1[4], a3, a4, a1[5], a1[6], a1[7], a1[8], 1, a5);
}

uint64_t __43__NLModelImplX_initWithModelTrainer_error___block_invoke_66(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "shouldStop");
  if ((_DWORD)result)
    *a3 = 1;
  return result;
}

- (void)dealloc
{
  MontrealNeuralNetwork *montrealModel;
  objc_super v4;

  montrealModel = self->_montrealModel;
  if (montrealModel)
    CFRelease(montrealModel);
  v4.receiver = self;
  v4.super_class = (Class)NLModelImplX;
  -[NLModelImplX dealloc](&v4, sel_dealloc);
}

- (id)modelData
{
  return self->_modelData;
}

- (id)configuration
{
  return self->_configuration;
}

- (unint64_t)systemVersion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[NLModelImplX configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  stringForKeyWithDefault(v4, CFSTR("EmbeddingType"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("Contextual")))
  {
    -[NLModelImplX configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "language");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = +[NLContextualEmbedding systemVersionForLanguage:](NLContextualEmbedding, "systemVersionForLanguage:", v7);
  }
  else
  {
    v8 = 2;
  }

  return v8;
}

- (id)labelMap
{
  return self->_labelMap;
}

- (id)customEmbeddingData
{
  return self->_customEmbeddingData;
}

- (unint64_t)numberOfTrainingInstances
{
  return self->_numberOfTrainingInstances;
}

- (id)trainingInfo
{
  void *v3;
  void *v4;
  void *v5;
  NSString *trainingLanguage;
  NSString *embeddingModelIdentifier;

  v3 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfTrainingInstances);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, 0x1E4A3BC90, self->_trainingEmbeddingType, 0x1E4A3BCD0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  trainingLanguage = self->_trainingLanguage;
  if (trainingLanguage)
    objc_msgSend(v5, "setObject:forKey:", trainingLanguage, 0x1E4A3BC50);
  embeddingModelIdentifier = self->_embeddingModelIdentifier;
  if (embeddingModelIdentifier)
    objc_msgSend(v5, "setObject:forKey:", embeddingModelIdentifier, 0x1E4A3BCF0);
  return v5;
}

- (float)outputForString:(id)a3
{
  id v4;
  NLContextualEmbedding *contextualEmbedding;
  void *v6;
  void *v7;
  void *v8;
  id embedding;
  void *v10;
  void *v11;
  id *v12;
  void *v13;
  BOOL v14;
  float *Output;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  contextualEmbedding = self->_contextualEmbedding;
  inputSequenceFromSentence(v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (contextualEmbedding)
    normalizedQuoteTokens(v6);
  else
    formattedTokens(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  embedding = self->_contextualEmbedding;
  if (embedding)
  {
    v20[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v4;
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = &v19;
  }
  else
  {
    embedding = self->_embedding;
    if (!embedding)
    {
LABEL_13:
      Output = 0;
      goto LABEL_14;
    }
    v18 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v4;
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = &v17;
  }
  objc_msgSend(v11, "arrayWithObjects:count:", v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(embedding, "vectorsForTokenizedSentences:untokenizedSentences:maxTokens:", v10, v13, 50);
  embedding = (id)objc_claimAutoreleasedReturnValue();

  if (self->_montrealModel)
    v14 = embedding == 0;
  else
    v14 = 1;
  if (v14)
    goto LABEL_13;
  embedding = objc_retainAutorelease(embedding);
  objc_msgSend(embedding, "bytes");
  MRLNeuralNetworkSetInput();
  MRLNeuralNetworkPredict();
  Output = (float *)MRLNeuralNetworkGetOutput();
LABEL_14:

  return Output;
}

- (id)predictedLabelForString:(id)a3
{
  id v4;
  NSUInteger v5;
  float *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSDictionary *labelMap;
  void *v13;

  v4 = a3;
  v5 = -[NSDictionary count](self->_labelMap, "count");
  v6 = -[NLModelImplX outputForString:](self, "outputForString:", v4);
  if (v6)
  {
    if (v5)
    {
      v8 = 0;
      v9 = 0;
      LODWORD(v7) = 0;
      do
      {
        if (v6[v9] > *(float *)&v7)
        {
          v8 = v9;
          *(float *)&v7 = v6[v9];
        }
        ++v9;
      }
      while (v5 != v9);
      v10 = v8 + 1;
    }
    else
    {
      v10 = 1;
    }
    labelMap = self->_labelMap;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](labelMap, "objectForKey:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)predictedLabelsForTokens:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;

  v4 = a3;
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLModelImplX predictedLabelForString:](self, "predictedLabelForString:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v8 = 0;
    if (v6)
      v9 = v6;
    else
      v9 = &stru_1E4A3BA10;
    do
    {
      objc_msgSend(v7, "addObject:", v9);
      ++v8;
    }
    while (v8 < objc_msgSend(v4, "count"));
  }

  return v7;
}

- (id)predictedLabelHypothesesForString:(id)a3 maximumCount:(unint64_t)a4
{
  id v5;
  void *v6;
  NSUInteger v7;
  float *v8;
  float *v9;
  uint64_t v10;
  NSDictionary *labelMap;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v18;
  void *v19;

  v18 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSDictionary count](self->_labelMap, "count");
  v19 = v5;
  v8 = -[NLModelImplX outputForString:](self, "outputForString:", v5);
  if (v8 && v7)
  {
    v9 = v8;
    v10 = 0;
    do
    {
      labelMap = self->_labelMap;
      v12 = v10 + 1;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10 + 1, v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](labelMap, "objectForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9[v10]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v15, v14);

      }
      ++v10;
    }
    while (v7 != v12);
  }
  topHypotheses(v6, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)predictedLabelHypothesesForTokens:(id)a3 maximumCount:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;

  v6 = a3;
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLModelImplX predictedLabelHypothesesForString:maximumCount:](self, "predictedLabelHypothesesForString:maximumCount:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v10 = 0;
    if (v8)
      v11 = v8;
    else
      v11 = (void *)MEMORY[0x1E0C9AA70];
    do
    {
      objc_msgSend(v9, "addObject:", v11);
      ++v10;
    }
    while (v10 < objc_msgSend(v6, "count"));
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelData, 0);
  objc_storeStrong((id *)&self->_embeddingModelIdentifier, 0);
  objc_storeStrong((id *)&self->_trainingEmbeddingType, 0);
  objc_storeStrong((id *)&self->_trainingLanguage, 0);
  objc_storeStrong((id *)&self->_labelMap, 0);
  objc_storeStrong((id *)&self->_customEmbeddingData, 0);
  objc_storeStrong((id *)&self->_contextualEmbedding, 0);
  objc_storeStrong((id *)&self->_embedding, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
