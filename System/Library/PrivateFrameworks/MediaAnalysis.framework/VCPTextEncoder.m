@implementation VCPTextEncoder

+ (BOOL)useCSULanguageEncoder
{
  return 1;
}

+ (id)sharedModel:(id)a3 identifier:(id)a4 outputNames:(id)a5 inputNames:(id)a6 functionName:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __77__VCPTextEncoder_sharedModel_identifier_outputNames_inputNames_functionName___block_invoke;
  v23[3] = &unk_1E6B16800;
  v17 = v11;
  v24 = v17;
  v18 = v13;
  v25 = v18;
  v19 = v14;
  v26 = v19;
  v20 = v15;
  v27 = v20;
  objc_msgSend(v16, "sharedInstanceWithIdentifier:andCreationBlock:", v12, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

VCPCNNModelEspressoV2 *__77__VCPTextEncoder_sharedModel_identifier_outputNames_inputNames_functionName___block_invoke(_QWORD *a1)
{
  return -[VCPCNNModelEspressoV2 initWithParameters:outputNames:inputNames:functionName:]([VCPCNNModelEspressoV2 alloc], "initWithParameters:outputNames:inputNames:functionName:", a1[4], a1[5], a1[6], a1[7]);
}

- (VCPTextEncoder)init
{
  VCPTextEncoder *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  CSUTextEncoder *csuTextEncoder;
  int64_t v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  VCPCNNModelEspressoV2 *tokenModel;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  VCPCNNModelEspressoV2 *textModel;
  VCPTextTokenizerT5 *v27;
  VCPTextTokenizer *textTokenizer;
  BOOL v29;
  int v30;
  void *v31;
  VCPTextEncoder *v32;
  VCPTextEncoder *v33;
  id v35;
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)VCPTextEncoder;
  v2 = -[VCPTextEncoder init](&v36, sel_init);
  if (!v2)
    goto LABEL_32;
  if (objc_msgSend((id)objc_opt_class(), "useCSULanguageEncoder"))
  {
    if (+[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision") == 5)
      v3 = 9;
    else
      v3 = 8;
    v35 = 0;
    objc_msgSend(MEMORY[0x1E0D18910], "createForRevision:error:", v3, &v35);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v35;
    if (v4)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D18908]), "initWithConfiguration:", v4);
      csuTextEncoder = v2->_csuTextEncoder;
      v2->_csuTextEncoder = (CSUTextEncoder *)v6;

      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Use CSUSystemSearchTextEncoderV1 as text encoder", buf, 2u);
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "description");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v38 = v31;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Failed to create encoder config (%@)", buf, 0xCu);

    }
    v30 = 0;
    goto LABEL_29;
  }
  v8 = +[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision");
  if (v8 == 5)
    v9 = CFSTR("md5_token_embed.bundle");
  else
    v9 = CFSTR("md4_token_embed.bundle");
  v10 = (void *)MEMORY[0x1E0CB3940];
  if (v8 == 5)
    v11 = CFSTR("md5_text_model.bundle");
  else
    v11 = CFSTR("md4_text_model.bundle");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("token_model"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resourceURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v9, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sharedModel:identifier:outputNames:inputNames:functionName:", v17, v14, &unk_1E6B761D0, &unk_1E6B761E8, CFSTR("main"));
  v18 = objc_claimAutoreleasedReturnValue();
  tokenModel = v2->_tokenModel;
  v2->_tokenModel = (VCPCNNModelEspressoV2 *)v18;

  if (v2->_tokenModel)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v11, v16);
    v20 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("text_model"), v23);
    v24 = objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "sharedModel:identifier:outputNames:inputNames:functionName:", v20, v24, &unk_1E6B76200, &unk_1E6B76218, CFSTR("main"));
    v25 = objc_claimAutoreleasedReturnValue();
    textModel = v2->_textModel;
    v2->_textModel = (VCPCNNModelEspressoV2 *)v25;

    if (v2->_textModel)
    {
      v27 = objc_alloc_init(VCPTextTokenizerT5);
      textTokenizer = v2->_textTokenizer;
      v2->_textTokenizer = &v27->super;

      v29 = v2->_textTokenizer != 0;
      if (v2->_textTokenizer)
        v30 = 0;
      else
        v30 = -108;
    }
    else
    {
      v29 = 0;
      v30 = -18;
    }
    v14 = (void *)v24;
    v17 = (void *)v20;
  }
  else
  {
    v29 = 0;
    v30 = -108;
  }

  if (v29)
LABEL_29:
    v2->_embeddingDim = 512;
  if (!v30)
  {
LABEL_32:
    v32 = v2;
    goto LABEL_33;
  }
  v32 = 0;
LABEL_33:
  v33 = v32;

  return v33;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VCPTextEncoder;
  -[VCPTextEncoder dealloc](&v2, sel_dealloc);
}

+ (id)convertToCSEmbedding:(id)a3 isFP16:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  int v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[2];

  v4 = a4;
  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    if (objc_msgSend(v5, "length") == 1024)
    {
      v7 = _os_feature_enabled_impl();
      v8 = objc_alloc(MEMORY[0x1E0CA6BA8]);
      v18[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        v10 = 5;
      else
        v10 = 4;
      v11 = (void *)objc_msgSend(v8, "initWithFormat:dimension:version:vectors:", 1, 1, v10, v9);

      goto LABEL_13;
    }
    if (objc_msgSend(v6, "length") == 1536)
    {
      v12 = objc_alloc(MEMORY[0x1E0CA6BA8]);
      v17 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v12, "initWithFormat:dimension:version:vectors:", 1, 2, 2, v13);

      goto LABEL_13;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134217984;
    v16 = objc_msgSend(v6, "length");
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unexpected embedding size %lu", (uint8_t *)&v15, 0xCu);
  }
  v11 = 0;
LABEL_13:

  return v11;
}

+ (id)convertFloat16ToFloat32:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  id v6;
  __int16 *v7;
  id v8;
  _DWORD *v9;
  uint64_t v10;
  __int16 v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * (v4 >> 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v3);
  v7 = (__int16 *)objc_msgSend(v6, "bytes");
  v8 = objc_retainAutorelease(v5);
  v9 = (_DWORD *)objc_msgSend(v8, "mutableBytes");
  if (v4 >= 2)
  {
    if (v4 >> 1 <= 1)
      v10 = 1;
    else
      v10 = v4 >> 1;
    do
    {
      v11 = *v7++;
      _H0 = v11;
      __asm { FCVT            S0, H0 }
      *v9++ = _S0;
      --v10;
    }
    while (v10);
  }

  return v8;
}

+ (id)convertFloat32ToFloat16:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  id v6;
  int *v7;
  id v8;
  _WORD *v9;
  uint64_t v10;
  int v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 2 * (v4 >> 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v3);
  v7 = (int *)objc_msgSend(v6, "bytes");
  v8 = objc_retainAutorelease(v5);
  v9 = (_WORD *)objc_msgSend(v8, "mutableBytes");
  if (v4 >= 4)
  {
    if (v4 >> 2 <= 1)
      v10 = 1;
    else
      v10 = v4 >> 2;
    do
    {
      v11 = *v7++;
      _S0 = v11;
      __asm { FCVT            H0, S0 }
      *v9++ = _S0;
      --v10;
    }
    while (v10);
  }

  return v8;
}

+ (id)applyL2Norm:(id)a3 isFP16:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  unint64_t v6;
  __int16 *v7;
  id v8;
  _WORD *v9;
  uint64_t v10;
  float v11;
  __int16 *v12;
  uint64_t v13;
  __int16 v14;
  float v20;
  __int16 v22;
  unint64_t v26;
  float *v27;
  float *v28;
  uint64_t v29;
  float v30;
  float *v31;
  uint64_t v32;
  float v33;
  float v34;
  float v36;

  v4 = a4;
  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    if (v4)
    {
      v6 = objc_msgSend(v5, "length");
      v7 = (__int16 *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v6 & 0xFFFFFFFFFFFFFFFELL);
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = (_WORD *)objc_msgSend(v8, "mutableBytes");
      if (v6 >= 2)
      {
        v10 = v6 >> 1;
        if (v6 >> 1 <= 1)
          v10 = 1;
        v11 = 0.0;
        v12 = v7;
        v13 = v10;
        do
        {
          v14 = *v12++;
          _H1 = v14;
          __asm { FCVT            S1, H1 }
          v11 = v11 + (float)(_S1 * _S1);
          --v13;
        }
        while (v13);
        v20 = sqrtf(v11);
        if (v20 > 0.0 && v6 >= 2)
        {
          do
          {
            v22 = *v7++;
            _H1 = v22;
            __asm { FCVT            S1, H1 }
            _S1 = _S1 / v20;
            __asm { FCVT            H1, S1 }
            *v9++ = LOWORD(_S1);
            --v10;
          }
          while (v10);
        }
      }
    }
    else
    {
      v26 = objc_msgSend(v5, "length");
      v27 = (float *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v26 & 0xFFFFFFFFFFFFFFFCLL);
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v28 = (float *)objc_msgSend(v8, "mutableBytes");
      if (v26 >= 4)
      {
        v29 = v26 >> 2;
        if (v26 >> 2 <= 1)
          v29 = 1;
        v30 = 0.0;
        v31 = v27;
        v32 = v29;
        do
        {
          v33 = *v31++;
          v30 = v30 + (float)(v33 * v33);
          --v32;
        }
        while (v32);
        v34 = sqrtf(v30);
        if (v34 > 0.0 && v26 >= 4)
        {
          do
          {
            v36 = *v27++;
            *v28++ = v36 / v34;
            --v29;
          }
          while (v29);
        }
      }
    }
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (id)textEmbeddingForQuery:(id)a3 useFP16:(BOOL)a4
{
  id v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  CSUTextEncoder *csuTextEncoder;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  unsigned int v24;
  VCPEspressoV2Data *v25;
  VCPEspressoV2Data *v26;
  float v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  int v37;
  char v38;
  id v39;
  void *v40;
  VCPEspressoV2Data *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  int v49;
  uint64_t v50;
  void *v51;
  unsigned int v52;
  double v53;
  uint64_t v54;
  const void *v55;
  VCPCNNModelEspressoV2 *textModel;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  int embeddingDim;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  void *v71;
  void *v72;
  _BOOL4 v73;
  void *v74;
  void *__p;
  void *v76;
  uint64_t v77;
  _QWORD v78[5];
  id v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint8_t *v86;
  uint8_t v87[8];
  __int128 buf;
  uint64_t v89;
  uint64_t v90;

  v73 = a4;
  v90 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v80 = 0;
  v81 = &v80;
  v82 = 0x3032000000;
  v83 = __Block_byref_object_copy__6;
  v84 = __Block_byref_object_dispose__6;
  v85 = 0;
  v74 = v5;
  if (self->_csuTextEncoder)
  {
    v6 = dispatch_semaphore_create(0);
    VCPSignPostLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_generate(v7);

    VCPSignPostLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CSUTextEncoder_runOnInputText", ", (uint8_t *)&buf, 2u);
    }

    csuTextEncoder = self->_csuTextEncoder;
    v79 = 0;
    -[CSUTextEncoder runOnInputText:error:](csuTextEncoder, "runOnInputText:error:", v74, &v79);
    v12 = v79;
    VCPSignPostLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v14, OS_SIGNPOST_INTERVAL_END, v8, "CSUTextEncoder_runOnInputText", ", (uint8_t *)&buf, 2u);
    }

    if (v12)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "description");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v15;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Text encoding failed (%@)", (uint8_t *)&buf, 0xCu);

      }
      goto LABEL_56;
    }
    -[CSUTextEncoder inferenceOutputs](self->_csuTextEncoder, "inferenceOutputs");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "CSUTextEmbedding");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "dataType") == 65552)
    {
      -[CSUTextEncoder inferenceOutputs](self->_csuTextEncoder, "inferenceOutputs");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "CSUTextEmbedding");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count") == self->_embeddingDim;

      if (v32)
      {
        -[CSUTextEncoder inferenceOutputs](self->_csuTextEncoder, "inferenceOutputs");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "CSUTextEmbedding");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v78[0] = MEMORY[0x1E0C809B0];
        v78[1] = 3221225472;
        v78[2] = __48__VCPTextEncoder_textEmbeddingForQuery_useFP16___block_invoke;
        v78[3] = &unk_1E6B16828;
        v78[4] = &v80;
        objc_msgSend(v34, "getBytesWithHandler:", v78);

        if (!v73)
        {
          objc_msgSend((id)objc_opt_class(), "convertFloat16ToFloat32:", v81[5]);
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = (void *)v81[5];
          v81[5] = v35;

        }
        v37 = 0;
LABEL_30:

LABEL_54:
        objc_msgSend((id)objc_opt_class(), "applyL2Norm:isFP16:", v81[5], v73);
        v66 = objc_claimAutoreleasedReturnValue();
        v67 = (void *)v81[5];
        v81[5] = v66;

        goto LABEL_55;
      }
    }
    else
    {

    }
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[CSUTextEncoder inferenceOutputs](self->_csuTextEncoder, "inferenceOutputs");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "CSUTextEmbedding");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "dataType");
      -[CSUTextEncoder inferenceOutputs](self->_csuTextEncoder, "inferenceOutputs");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "CSUTextEmbedding");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "count");
      LODWORD(buf) = 67109376;
      DWORD1(buf) = v44;
      WORD4(buf) = 1024;
      *(_DWORD *)((char *)&buf + 10) = v47;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "CSU unexpected output embedding with type %d, size %d", (uint8_t *)&buf, 0xEu);

    }
    v37 = -18;
    goto LABEL_30;
  }
  -[VCPTextTokenizer encode:](self->_textTokenizer, "encode:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v16);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  if (v17 >= 0x100)
    v18 = 256;
  else
    v18 = v17;
  objc_msgSend(v71, "subarrayWithRange:", 0, v18);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  buf = 0uLL;
  v89 = 0;
  -[VCPCNNModelEspressoV2 inputsSize](self->_tokenModel, "inputsSize");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntValue");

  -[VCPCNNModelEspressoV2 inputsType](self->_tokenModel, "inputsType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "unsignedIntValue");

  v25 = -[VCPEspressoV2Data initWithTensorType:size:]([VCPEspressoV2Data alloc], "initWithTensorType:size:", v24, v21);
  v26 = v25;
  if (!v25)
  {
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v41 = 0;
    v37 = -108;
    goto LABEL_51;
  }
  -[VCPEspressoV2Data setData:padding:](v25, "setData:padding:", v72, &unk_1E6B72728);
  if (objc_msgSend(v72, "count"))
    v27 = (float)(unint64_t)(objc_msgSend(v72, "count") - 1);
  else
    v27 = 0.0;
  v37 = -[VCPCNNModelEspressoV2 espressoForward:](self->_tokenModel, "espressoForward:", -[VCPEspressoV2Data getData:](v26, "getData:", v24));
  if (v37)
  {
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v41 = 0;
    goto LABEL_51;
  }
  std::vector<void *>::resize((uint64_t)&buf, 2uLL);
  -[VCPCNNModelEspressoV2 inputsType](self->_textModel, "inputsType");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "intValue");

  -[VCPCNNModelEspressoV2 outputs](self->_tokenModel, "outputs");
  v50 = objc_msgSend(**(id **)v87, "getData:", v49);
  *(_QWORD *)buf = v50;
  v86 = v87;
  std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v86);
  objc_msgSend(v40, "objectAtIndexedSubscript:", 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "unsignedIntValue");

  v41 = -[VCPEspressoV2Data initWithTensorType:size:]([VCPEspressoV2Data alloc], "initWithTensorType:size:", v52, 1);
  *(float *)&v53 = v27;
  -[VCPEspressoV2Data setValueFP:atIndex:](v41, "setValueFP:atIndex:", 0, v53);
  v54 = -[VCPEspressoV2Data getData:](v41, "getData:", v52);
  v55 = (const void *)buf;
  *(_QWORD *)(buf + 8) = v54;
  textModel = self->_textModel;
  __p = 0;
  v76 = 0;
  v77 = 0;
  std::vector<void *>::__init_with_size[abi:ne180100]<void **,void **>(&__p, v55, *((uint64_t *)&buf + 1), (uint64_t)(*((_QWORD *)&buf + 1) - (_QWORD)v55) >> 3);
  v37 = -[VCPCNNModelEspressoV2 espressoForwardInputs:](textModel, "espressoForwardInputs:", &__p);
  if (__p)
  {
    v76 = __p;
    operator delete(__p);
  }
  if (v37)
  {
    v38 = 0;
    v39 = 0;
    goto LABEL_51;
  }
  -[VCPCNNModelEspressoV2 outputs](self->_textModel, "outputs");
  v39 = *(id *)(*(_QWORD *)v87 + 16);
  v86 = v87;
  std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v86);
  if (!v39)
    goto LABEL_46;
  if (objc_msgSend(v39, "tensorSize") != self->_embeddingDim)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      embeddingDim = self->_embeddingDim;
      *(_DWORD *)v87 = 67109120;
      *(_DWORD *)&v87[4] = embeddingDim;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "MA text encoder output size does not match expected %d", v87, 8u);
    }
LABEL_46:
    v38 = 0;
    v37 = -18;
    goto LABEL_51;
  }
  if (objc_msgSend(v39, "tensorType") == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", objc_msgSend(v39, "getData:", 2), 4 * objc_msgSend(v39, "tensorSize"));
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = (void *)v81[5];
    v81[5] = v57;

    if (v73)
    {
      objc_msgSend((id)objc_opt_class(), "convertFloat32ToFloat16:", v81[5]);
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = (void *)v81[5];
      v81[5] = v59;

    }
  }
  else if (objc_msgSend(v39, "tensorType") == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", objc_msgSend(v39, "getData:", 1), 2 * objc_msgSend(v39, "tensorSize"));
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = (void *)v81[5];
    v81[5] = v62;

    if (!v73)
    {
      objc_msgSend((id)objc_opt_class(), "convertFloat16ToFloat32:", v81[5]);
      v64 = objc_claimAutoreleasedReturnValue();
      v65 = (void *)v81[5];
      v81[5] = v64;

    }
  }
  v37 = 0;
  v38 = 1;
LABEL_51:

  if ((_QWORD)buf)
  {
    *((_QWORD *)&buf + 1) = buf;
    operator delete((void *)buf);
  }

  if ((v38 & 1) != 0)
    goto LABEL_54;
LABEL_55:
  if (!v37)
  {
    v68 = (void *)v81[5];
    goto LABEL_58;
  }
LABEL_56:
  v68 = 0;
LABEL_58:
  v69 = v68;
  _Block_object_dispose(&v80, 8);

  return v69;
}

void __48__VCPTextEncoder_textEmbeddingForQuery_useFP16___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenModel, 0);
  objc_storeStrong((id *)&self->_csuTextEncoder, 0);
  objc_storeStrong((id *)&self->_textTokenizer, 0);
  objc_storeStrong((id *)&self->_textModel, 0);
}

@end
