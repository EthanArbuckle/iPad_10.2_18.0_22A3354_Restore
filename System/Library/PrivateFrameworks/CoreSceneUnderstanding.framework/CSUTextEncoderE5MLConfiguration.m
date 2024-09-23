@implementation CSUTextEncoderE5MLConfiguration

+ (int64_t)_resolvedRevision:(int64_t)a3
{
  return a3;
}

+ (id)getConfigurationFromModelCatalogForRevision_v1_2_EnglishWithError:(id *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  id v40;
  const char *v41;
  void *inited;

  v5 = (void *)objc_opt_new();
  objc_msgSend_fetchAndReturnError_(v5, v6, (uint64_t)a3, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDD1488];
    v13 = objc_opt_class();
    objc_msgSend_bundleForClass_(v12, v14, v13, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pathForResource_ofType_inDirectory_(v17, v18, (uint64_t)CFSTR("t5_base"), (uint64_t)CFSTR("model"), (uint64_t)CFSTR("SystemSearch/v1.2.0/"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend_URLByAppendingPathComponent_(v11, v19, (uint64_t)CFSTR("md1_e5_3outputs_token_embed_fp32inOut.mlmodelc"), v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(v23, v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend_URLByAppendingPathComponent_(v11, v29, (uint64_t)CFSTR("md1_e5_3outputs_text_model_fp16outs_only.mlmodelc"), v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_path(v32, v33, v34, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          v40 = objc_alloc((Class)a1);
          inited = (void *)objc_msgSend_initTextEncoderV1ConfigurationForRevision_vocabularyModelPath_tokenEmbeddingNetworkPath_textEncoderNetworkPath_encoderParams_(v40, v41, 2, (uint64_t)v22, (uint64_t)v28, v37, &unk_250B1CDC8);
        }
        else if (a3)
        {
          objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v38, (uint64_t)CFSTR("text embedding model file not found in bundle!"), 0, v39);
          inited = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          inited = 0;
        }

      }
      else if (a3)
      {
        objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v29, (uint64_t)CFSTR("token embedding model file not found in bundle!"), 0, v31);
        inited = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        inited = 0;
      }

    }
    else if (a3)
    {
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v19, (uint64_t)CFSTR("Vocabulary model file not found in bundle!"), 0, v21);
      inited = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      inited = 0;
    }

  }
  else if (a3)
  {
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v9, (uint64_t)CFSTR("Model Catalog asset base url for text and token encoders is nil!"), (uint64_t)*a3, v10);
    inited = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    inited = 0;
  }

  return inited;
}

+ (id)getConfigurationForRevision_v1_2_EnglishWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  id v21;
  const char *v22;
  void *inited;

  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = objc_opt_class();
  objc_msgSend_bundleForClass_(v5, v7, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathForResource_ofType_inDirectory_(v10, v11, (uint64_t)CFSTR("t5_base"), (uint64_t)CFSTR("model"), (uint64_t)CFSTR("SystemSearch/v1.2.0/"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend_pathForResource_ofType_inDirectory_(v10, v12, (uint64_t)CFSTR("SystemSearch_v1.2.0_ac4rja6ikq-15000_token-embed-en"), (uint64_t)CFSTR("mlmodelc"), (uint64_t)CFSTR("SystemSearch/v1.2.0/"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend_pathForResource_ofType_inDirectory_(v10, v15, (uint64_t)CFSTR("SystemSearch_v1.2.0_ac4rja6ikq-15000_text-encoder-en"), (uint64_t)CFSTR("mlmodelc"), (uint64_t)CFSTR("SystemSearch/v1.2.0/"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = objc_alloc((Class)a1);
        inited = (void *)objc_msgSend_initTextEncoderV1ConfigurationForRevision_vocabularyModelPath_tokenEmbeddingNetworkPath_textEncoderNetworkPath_encoderParams_(v21, v22, 2, (uint64_t)v14, (uint64_t)v17, v20, &unk_250B1CDF0);
      }
      else if (a3)
      {
        objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v18, (uint64_t)CFSTR("text embedding model file not found in bundle!"), 0, v19);
        inited = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        inited = 0;
      }

    }
    else if (a3)
    {
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v15, (uint64_t)CFSTR("token embedding model file not found in bundle!"), 0, v16);
      inited = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      inited = 0;
    }

  }
  else if (a3)
  {
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v12, (uint64_t)CFSTR("Vocabulary model file not found in bundle!"), 0, v13);
    inited = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    inited = 0;
  }

  return inited;
}

+ (id)getConfigurationForRevision_v4_0_Tier0WithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  const char *v28;
  void *inited;
  void *v30;

  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = objc_opt_class();
  objc_msgSend_bundleForClass_(v5, v7, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathForResource_ofType_inDirectory_(v10, v11, (uint64_t)CFSTR("omnie_t0_50k"), (uint64_t)CFSTR("model"), (uint64_t)CFSTR("SystemSearch/v4.0.0/"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend_pathForResource_ofType_inDirectory_(v10, v12, (uint64_t)CFSTR("token_model_md4_mubb"), (uint64_t)CFSTR("mlmodelc"), (uint64_t)CFSTR("SystemSearch/v4.0.0/"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v16, (uint64_t)CFSTR("file://%@"), v17, v18, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend_pathForResource_ofType_inDirectory_(v10, v20, (uint64_t)CFSTR("text_model_md4_mubb"), (uint64_t)CFSTR("mlmodelc"), (uint64_t)CFSTR("SystemSearch/v4.0.0/"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v22, (uint64_t)CFSTR("file://%@"), v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = objc_alloc((Class)a1);
        inited = (void *)objc_msgSend_initTextEncoderV1ConfigurationForRevision_vocabularyModelPath_tokenEmbeddingNetworkPath_textEncoderNetworkPath_encoderParams_(v27, v28, 3, (uint64_t)v14, (uint64_t)v19, v26, &unk_250B1CE18);

LABEL_13:
        goto LABEL_14;
      }
      if (a3)
      {
        objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v22, (uint64_t)CFSTR("text embedding model file not found in bundle!"), 0, v24);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
    else if (a3)
    {
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v20, (uint64_t)CFSTR("token embedding model file not found in bundle!"), 0, v21);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
      inited = 0;
      *a3 = v30;
      goto LABEL_13;
    }
    inited = 0;
    goto LABEL_13;
  }
  if (a3)
  {
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v12, (uint64_t)CFSTR("Vocabulary model file not found in bundle!"), 0, v13);
    inited = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    inited = 0;
  }
LABEL_14:

  return inited;
}

+ (id)getConfigurationForRevision_v5_0_Tier0WithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  id v31;
  const char *v32;
  void *inited;
  id v34;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[10];
  _QWORD v39[11];

  v39[10] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = objc_opt_class();
  objc_msgSend_bundleForClass_(v5, v7, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathForResource_ofType_inDirectory_(v10, v11, (uint64_t)CFSTR("omnie_t0_50k"), (uint64_t)CFSTR("model"), (uint64_t)CFSTR("SystemSearch/v5.0.0/"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend_pathForResource_ofType_inDirectory_(v10, v12, (uint64_t)CFSTR("token_model_md5_mubb_enum"), (uint64_t)CFSTR("mlmodelc"), (uint64_t)CFSTR("SystemSearch/v5.0.0/"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v16, (uint64_t)CFSTR("file://%@"), v17, v18, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend_pathForResource_ofType_inDirectory_(v10, v20, (uint64_t)CFSTR("text_model_ctx_512_77"), (uint64_t)CFSTR("mlmodelc"), (uint64_t)CFSTR("SystemSearch/v5.0.0/"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v22, (uint64_t)CFSTR("file://%@"), v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v38[0] = CFSTR("contextLength");
        v38[1] = CFSTR("maxSeqLen");
        v39[0] = &unk_250B1C738;
        v39[1] = &unk_250B1C750;
        v38[2] = CFSTR("tokenEmbedLen");
        v38[3] = CFSTR("numCustomTokens");
        v39[2] = &unk_250B1C798;
        v39[3] = &unk_250B1C768;
        v38[4] = CFSTR("text_embed_shape");
        v38[5] = CFSTR("text_embed_width");
        v39[4] = &unk_250B1CC78;
        v39[5] = &unk_250B1C750;
        v38[6] = CFSTR("text_embed_height");
        v38[7] = CFSTR("usePrecompiledBundleForMacOS");
        v39[6] = &unk_250B1C780;
        v39[7] = MEMORY[0x24BDBD1C0];
        v39[8] = CFSTR("main_ctx_77");
        v38[8] = CFSTR("e5function");
        v38[9] = CFSTR("e5functionsAvailable");
        v36[0] = &unk_250B1C750;
        v36[1] = &unk_250B1C738;
        v37[0] = CFSTR("main_ctx_512");
        v37[1] = CFSTR("main_ctx_77");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v27, (uint64_t)v37, (uint64_t)v36, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v39[9] = v28;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v29, (uint64_t)v39, (uint64_t)v38, 10);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = objc_alloc((Class)a1);
        inited = (void *)objc_msgSend_initTextEncoderV1ConfigurationForRevision_vocabularyModelPath_tokenEmbeddingNetworkPath_textEncoderNetworkPath_encoderParams_(v31, v32, 4, (uint64_t)v14, (uint64_t)v19, v26, v30);

LABEL_13:
        goto LABEL_14;
      }
      if (a3)
      {
        objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v22, (uint64_t)CFSTR("text embedding model file not found in bundle!"), 0, v24);
        v34 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
    else if (a3)
    {
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v20, (uint64_t)CFSTR("token embedding model file not found in bundle!"), 0, v21);
      v34 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
      inited = 0;
      *a3 = v34;
      goto LABEL_13;
    }
    inited = 0;
    goto LABEL_13;
  }
  if (a3)
  {
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v12, (uint64_t)CFSTR("Vocabulary model file not found in bundle!"), 0, v13);
    inited = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    inited = 0;
  }
LABEL_14:

  return inited;
}

+ (id)TextEncoderE5MLConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;

  v8 = objc_msgSend__resolvedRevision_(a1, a2, a3, (uint64_t)a4, v4);
  if (v8 == 3)
  {
    objc_msgSend_getConfigurationForRevision_v4_0_Tier0WithError_(a1, v9, (uint64_t)a4, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    return v12;
  }
  if (v8 == 2)
  {
    objc_msgSend_getConfigurationFromModelCatalogForRevision_v1_2_EnglishWithError_(a1, v9, (uint64_t)a4, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    return v12;
  }
  if (a4)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v9, a3, v10, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v14, v16, (uint64_t)CFSTR("Unsupported TextEncoderE5ML revision %@"), v17, v18, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v20, (uint64_t)v19, v21, v22);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (id)initTextEncoderV1ConfigurationForRevision:(int64_t)a3 vocabularyModelPath:(id)a4 tokenEmbeddingNetworkPath:(id)a5 textEncoderNetworkPath:(id)a6 encoderParams:(id)a7
{
  CSUTextEncoderE5MLConfiguration *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *vocabularyModelPath;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSString *inputTextIDTensorName;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSString *tokenEmbeddingNetworkPath;
  NSString *outputTokenEmbeddingIDTensorName;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSMutableDictionary *layerShapes;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  NSMutableDictionary *layerWidths;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  NSMutableDictionary *layerHeights;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t i;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  BOOL v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  NSString *textEncoderNetworkPath;
  NSString *inputTokenEmbeddingIDTensorName;
  NSString *inputTokenEmbeddingMaskTensorName;
  NSString *outputTextEmbeddingTensorName;
  NSString *outputLastHiddenStateTensorName;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  BOOL v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  NSString *v163;
  void *v164;
  BOOL v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  NSDictionary *v169;
  NSString *e5function;
  const char *v171;
  NSDictionary *v172;
  CSUTextEncoderE5MLConfiguration *v173;
  id v175;
  id v176;
  id v177;
  NSArray *obj;
  CSUTextEncoderE5MLConfiguration *v179;
  uint64_t v180;
  id v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  objc_super v186;
  NSDictionary *v187;
  NSString *v188;
  _BYTE v189[128];
  uint64_t v190;

  v190 = *MEMORY[0x24BDAC8D0];
  v176 = a4;
  v177 = a5;
  v175 = a6;
  v181 = a7;
  v186.receiver = self;
  v186.super_class = (Class)CSUTextEncoderE5MLConfiguration;
  v12 = -[CSUTextEncoderE5MLConfiguration init](&v186, sel_init);
  v179 = v12;
  if (!v12)
    goto LABEL_23;
  v12->_revision = a3;
  v17 = objc_msgSend_copy(v176, v13, v14, v15, v16);
  vocabularyModelPath = v179->_vocabularyModelPath;
  v179->_vocabularyModelPath = (NSString *)v17;

  objc_msgSend_objectForKeyedSubscript_(v181, v19, (uint64_t)CFSTR("contextLength"), v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v179->_contextLength = objc_msgSend_unsignedLongValue(v22, v23, v24, v25, v26);

  objc_msgSend_objectForKeyedSubscript_(v181, v27, (uint64_t)CFSTR("maxSeqLen"), v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v179->_maximumSequenceLength = objc_msgSend_unsignedLongValue(v30, v31, v32, v33, v34);

  v179->_inputIsLowerCase = 1;
  inputTextIDTensorName = v179->_inputTextIDTensorName;
  v179->_inputTextIDTensorName = (NSString *)CFSTR("text_ids");

  v40 = objc_msgSend_copy(v177, v36, v37, v38, v39);
  tokenEmbeddingNetworkPath = v179->_tokenEmbeddingNetworkPath;
  v179->_tokenEmbeddingNetworkPath = (NSString *)v40;

  outputTokenEmbeddingIDTensorName = v179->_outputTokenEmbeddingIDTensorName;
  v179->_outputTokenEmbeddingIDTensorName = (NSString *)CFSTR("token_embed");

  objc_msgSend_objectForKeyedSubscript_(v181, v43, (uint64_t)CFSTR("tokenEmbedLen"), v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v179->_tokenEmbeddingLength = objc_msgSend_unsignedLongValue(v46, v47, v48, v49, v50);

  objc_msgSend_objectForKeyedSubscript_(v181, v51, (uint64_t)CFSTR("numCustomTokens"), v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v179->_numCustomTokens = objc_msgSend_unsignedLongValue(v54, v55, v56, v57, v58);

  objc_msgSend_objectForKeyedSubscript_(v181, v59, (uint64_t)CFSTR("usePrecompiledBundleForMacOS"), v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v179->_usePrecompiledBundleForMacOS = objc_msgSend_BOOLValue(v62, v63, v64, v65, v66);

  v67 = objc_opt_new();
  layerShapes = v179->_layerShapes;
  v179->_layerShapes = (NSMutableDictionary *)v67;

  objc_msgSend_objectForKeyedSubscript_(v181, v69, (uint64_t)CFSTR("text_embed_shape"), v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v179->_layerShapes, v73, (uint64_t)v72, (uint64_t)CFSTR("text_embed"), v74);

  v75 = objc_opt_new();
  layerWidths = v179->_layerWidths;
  v179->_layerWidths = (NSMutableDictionary *)v75;

  objc_msgSend_objectForKeyedSubscript_(v181, v77, (uint64_t)CFSTR("text_embed_width"), v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v179->_layerWidths, v81, (uint64_t)v80, (uint64_t)CFSTR("text_embed"), v82);

  v83 = objc_opt_new();
  layerHeights = v179->_layerHeights;
  v179->_layerHeights = (NSMutableDictionary *)v83;

  objc_msgSend_objectForKeyedSubscript_(v181, v85, (uint64_t)CFSTR("text_embed_height"), v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v179->_layerHeights, v89, (uint64_t)v88, (uint64_t)CFSTR("text_embed"), v90);

  v184 = 0u;
  v185 = 0u;
  v182 = 0u;
  v183 = 0u;
  obj = v179->_additionalLayerNames;
  v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v91, (uint64_t)&v182, (uint64_t)v189, 16);
  if (!v95)
    goto LABEL_16;
  v180 = *(_QWORD *)v183;
  do
  {
    for (i = 0; i != v95; ++i)
    {
      if (*(_QWORD *)v183 != v180)
        objc_enumerationMutation(obj);
      v97 = *(_QWORD *)(*((_QWORD *)&v182 + 1) + 8 * i);
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v92, (uint64_t)CFSTR("%@_shape"), v93, v94, v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v181, v99, (uint64_t)v98, v100, v101);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v105)
        goto LABEL_6;
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v102, (uint64_t)CFSTR("%@_width"), v103, v104, v97);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v181, v107, (uint64_t)v106, v108, v109);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v113)
      {

        goto LABEL_5;
      }
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v110, (uint64_t)CFSTR("%@_height"), v111, v112, v97);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v181, v115, (uint64_t)v114, v116, v117);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = v118 == 0;

      if (!v119)
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v92, (uint64_t)CFSTR("%@_shape"), v93, v94, v97);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v181, v121, (uint64_t)v120, v122, v123);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v179->_layerShapes, v125, (uint64_t)v124, v97, v126);

        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v127, (uint64_t)CFSTR("%@_width"), v128, v129, v97);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v181, v131, (uint64_t)v130, v132, v133);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v179->_layerWidths, v135, (uint64_t)v134, v97, v136);

        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v137, (uint64_t)CFSTR("%@_height"), v138, v139, v97);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v181, v140, (uint64_t)v98, v141, v142);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v179->_layerHeights, v143, (uint64_t)v105, v97, v144);
LABEL_5:

LABEL_6:
        continue;
      }
    }
    v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v92, (uint64_t)&v182, (uint64_t)v189, 16);
  }
  while (v95);
LABEL_16:

  v149 = objc_msgSend_copy(v175, v145, v146, v147, v148);
  textEncoderNetworkPath = v179->_textEncoderNetworkPath;
  v179->_textEncoderNetworkPath = (NSString *)v149;

  inputTokenEmbeddingIDTensorName = v179->_inputTokenEmbeddingIDTensorName;
  v179->_inputTokenEmbeddingIDTensorName = (NSString *)CFSTR("token_embed");

  inputTokenEmbeddingMaskTensorName = v179->_inputTokenEmbeddingMaskTensorName;
  v179->_inputTokenEmbeddingMaskTensorName = (NSString *)CFSTR("indices");

  outputTextEmbeddingTensorName = v179->_outputTextEmbeddingTensorName;
  v179->_outputTextEmbeddingTensorName = (NSString *)CFSTR("text_embed");

  outputLastHiddenStateTensorName = v179->_outputLastHiddenStateTensorName;
  v179->_outputLastHiddenStateTensorName = (NSString *)CFSTR("input_tranpose");

  objc_msgSend_objectForKey_(v181, v155, (uint64_t)CFSTR("e5function"), v156, v157);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = v158 == 0;

  if (v159)
  {
    v179->_e5function = (NSString *)CFSTR("main");
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(v181, v160, (uint64_t)CFSTR("e5function"), v161, v162);
    v163 = (NSString *)objc_claimAutoreleasedReturnValue();
    v179->_e5function = v163;

  }
  objc_msgSend_objectForKey_(v181, v160, (uint64_t)CFSTR("e5functionsAvailable"), v161, v162);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = v164 == 0;

  if (v165)
  {
    objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v166, v179->_maximumSequenceLength, v167, v168);
    v169 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    e5function = v179->_e5function;
    v187 = v169;
    v188 = e5function;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v171, (uint64_t)&v188, (uint64_t)&v187, 1);
    v172 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v179->_e5FunctionsAvailable = v172;

  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(v181, v166, (uint64_t)CFSTR("e5functionsAvailable"), v167, v168);
    v169 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v179->_e5FunctionsAvailable = v169;
  }

  v173 = v179;
LABEL_23:

  return v179;
}

+ (id)availableRevisions
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v2 = objc_alloc_init(MEMORY[0x24BDD1698]);
  objc_msgSend_addIndex_(v2, v3, 2, v4, v5);
  objc_msgSend_addIndex_(v2, v6, 3, v7, v8);
  v13 = (void *)objc_msgSend_copy(v2, v9, v10, v11, v12);

  return v13;
}

- (unint64_t)contextLength
{
  return self->_contextLength;
}

- (void)setContextLength:(unint64_t)a3
{
  self->_contextLength = a3;
}

- (NSArray)additionalLayerNames
{
  return self->_additionalLayerNames;
}

- (void)setAdditionalLayerNames:(id)a3
{
  objc_storeStrong((id *)&self->_additionalLayerNames, a3);
}

- (NSString)e5function
{
  return self->_e5function;
}

- (void)setE5function:(id)a3
{
  self->_e5function = (NSString *)a3;
}

- (NSDictionary)e5FunctionsAvailable
{
  return self->_e5FunctionsAvailable;
}

- (void)setE5FunctionsAvailable:(id)a3
{
  self->_e5FunctionsAvailable = (NSDictionary *)a3;
}

- (int64_t)revision
{
  return self->_revision;
}

- (NSString)vocabularyModelPath
{
  return self->_vocabularyModelPath;
}

- (void)setVocabularyModelPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)tokenEmbeddingNetworkPath
{
  return self->_tokenEmbeddingNetworkPath;
}

- (void)setTokenEmbeddingNetworkPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)textEncoderNetworkPath
{
  return self->_textEncoderNetworkPath;
}

- (void)setTextEncoderNetworkPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)maximumSequenceLength
{
  return self->_maximumSequenceLength;
}

- (void)setMaximumSequenceLength:(unint64_t)a3
{
  self->_maximumSequenceLength = a3;
}

- (unint64_t)tokenEmbeddingLength
{
  return self->_tokenEmbeddingLength;
}

- (void)setTokenEmbeddingLength:(unint64_t)a3
{
  self->_tokenEmbeddingLength = a3;
}

- (unint64_t)numCustomTokens
{
  return self->_numCustomTokens;
}

- (void)setNumCustomTokens:(unint64_t)a3
{
  self->_numCustomTokens = a3;
}

- (BOOL)usePrecompiledBundleForMacOS
{
  return self->_usePrecompiledBundleForMacOS;
}

- (void)setUsePrecompiledBundleForMacOS:(BOOL)a3
{
  self->_usePrecompiledBundleForMacOS = a3;
}

- (NSMutableDictionary)layerShapes
{
  return self->_layerShapes;
}

- (void)setLayerShapes:(id)a3
{
  objc_storeStrong((id *)&self->_layerShapes, a3);
}

- (NSMutableDictionary)layerWidths
{
  return self->_layerWidths;
}

- (void)setLayerWidths:(id)a3
{
  objc_storeStrong((id *)&self->_layerWidths, a3);
}

- (NSMutableDictionary)layerHeights
{
  return self->_layerHeights;
}

- (void)setLayerHeights:(id)a3
{
  objc_storeStrong((id *)&self->_layerHeights, a3);
}

- (BOOL)inputIsLowerCase
{
  return self->_inputIsLowerCase;
}

- (void)setInputIsLowerCase:(BOOL)a3
{
  self->_inputIsLowerCase = a3;
}

- (NSString)inputTextIDTensorName
{
  return self->_inputTextIDTensorName;
}

- (void)setInputTextIDTensorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)outputTokenEmbeddingIDTensorName
{
  return self->_outputTokenEmbeddingIDTensorName;
}

- (void)setOutputTokenEmbeddingIDTensorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)inputTokenEmbeddingIDTensorName
{
  return self->_inputTokenEmbeddingIDTensorName;
}

- (void)setInputTokenEmbeddingIDTensorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)inputTokenEmbeddingMaskTensorName
{
  return self->_inputTokenEmbeddingMaskTensorName;
}

- (void)setInputTokenEmbeddingMaskTensorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)outputTextEmbeddingTensorName
{
  return self->_outputTextEmbeddingTensorName;
}

- (void)setOutputTextEmbeddingTensorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)outputLastHiddenStateTensorName
{
  return self->_outputLastHiddenStateTensorName;
}

- (void)setOutputLastHiddenStateTensorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (int)espressoExecutionEngine
{
  return self->_espressoExecutionEngine;
}

- (void)setEspressoExecutionEngine:(int)a3
{
  self->_espressoExecutionEngine = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputLastHiddenStateTensorName, 0);
  objc_storeStrong((id *)&self->_outputTextEmbeddingTensorName, 0);
  objc_storeStrong((id *)&self->_inputTokenEmbeddingMaskTensorName, 0);
  objc_storeStrong((id *)&self->_inputTokenEmbeddingIDTensorName, 0);
  objc_storeStrong((id *)&self->_outputTokenEmbeddingIDTensorName, 0);
  objc_storeStrong((id *)&self->_inputTextIDTensorName, 0);
  objc_storeStrong((id *)&self->_layerHeights, 0);
  objc_storeStrong((id *)&self->_layerWidths, 0);
  objc_storeStrong((id *)&self->_layerShapes, 0);
  objc_storeStrong((id *)&self->_textEncoderNetworkPath, 0);
  objc_storeStrong((id *)&self->_tokenEmbeddingNetworkPath, 0);
  objc_storeStrong((id *)&self->_vocabularyModelPath, 0);
  objc_storeStrong((id *)&self->_additionalLayerNames, 0);
}

@end
