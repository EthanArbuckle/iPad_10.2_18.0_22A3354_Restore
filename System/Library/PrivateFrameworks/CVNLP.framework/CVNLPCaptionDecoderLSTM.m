@implementation CVNLPCaptionDecoderLSTM

- (CVNLPCaptionDecoderLSTM)initWithOptions:(id)a3 runTimeParams:(id)a4
{
  id v6;
  id v7;
  CVNLPCaptionDecoderLSTM *v8;
  const char *v9;
  uint64_t v10;
  CVNLPCaptionDecoderLSTM *v11;
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
  void *v22;
  const char *v23;
  uint64_t v24;
  NSDictionary *vocab;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  const char *v57;
  std::runtime_error *exception;
  const char *v60;
  std::runtime_error *v61;
  const char *v62;
  std::runtime_error *v63;
  const char *v64;
  std::runtime_error *v65;
  const char *v66;
  std::runtime_error *v67;
  const char *v68;
  std::runtime_error *v69;
  const char *v70;
  std::runtime_error *v71;
  const char *v72;
  std::runtime_error *v73;
  const char *v74;
  std::runtime_error *v75;
  const char *v76;
  std::runtime_error *v77;
  const char *v78;
  std::runtime_error *v79;
  const char *v80;
  std::runtime_error *v81;
  const char *v82;
  std::runtime_error *v83;
  const char *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  objc_super v90;

  v6 = a3;
  v7 = a4;
  v90.receiver = self;
  v90.super_class = (Class)CVNLPCaptionDecoderLSTM;
  v8 = -[CVNLPCaptionModelBase initWithOptions:runTimeParams:](&v90, sel_initWithOptions_runTimeParams_, v6, v7);
  v11 = v8;
  if (v8)
  {
    v8->startID = 0;
    v8->endID = 0;
    v8->maxCaptionLen = 16;
    v8->beamSize = 5;
    v8->meanFeaturesPresent = 0;
    objc_msgSend_objectForKeyedSubscript_(v6, v9, (uint64_t)CVNLPCaptionModelPath, v10);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathComponent_(v87, v12, (uint64_t)CFSTR("vocab_reverse.json"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0C99D50];
    v86 = v14;
    objc_msgSend_path(v14, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataWithContentsOfFile_(v15, v20, (uint64_t)v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v89 = 0;
    objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v23, (uint64_t)v22, 0, &v89);
    v24 = objc_claimAutoreleasedReturnValue();
    v85 = v89;
    vocab = v11->vocab;
    v11->vocab = (NSDictionary *)v24;

    objc_msgSend_URLByAppendingPathComponent_(v87, v26, (uint64_t)CFSTR("decoder_opt_pro.espresso.net"), v27);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v11->decoderCtx = (void *)espresso_create_context();
    v11->_decoderPlan = (void *)espresso_create_plan();
    objc_msgSend_path(v88, v28, v29, v30);
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend_UTF8String(v31, v32, v33, v34);
    v35 = espresso_plan_add_network();

    if (v35)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(exception, v60);
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    if (espresso_plan_build())
    {
      v61 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v61, v62);
      __cxa_throw(v61, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    if (c_network_get_input_names())
    {
      v63 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v63, v64);
      __cxa_throw(v63, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    if (v11->meanFeaturesPresent && espresso_network_bind_buffer())
    {
      v83 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v83, v84);
      __cxa_throw(v83, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    if (espresso_network_bind_buffer())
    {
      v65 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v65, v66);
      __cxa_throw(v65, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    if (espresso_network_bind_buffer())
    {
      v67 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v67, v68);
      __cxa_throw(v67, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    if (espresso_network_bind_buffer())
    {
      v69 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v69, v70);
      __cxa_throw(v69, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    if (espresso_network_bind_buffer())
    {
      v71 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v71, v72);
      __cxa_throw(v71, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    if (espresso_network_bind_buffer())
    {
      v73 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v73, v74);
      __cxa_throw(v73, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    if (espresso_network_bind_buffer())
    {
      v75 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v75, v76);
      __cxa_throw(v75, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    if (espresso_network_bind_buffer())
    {
      v77 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v77, v78);
      __cxa_throw(v77, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    if (espresso_network_bind_buffer())
    {
      v79 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v79, v80);
      __cxa_throw(v79, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    if (espresso_network_bind_buffer())
    {
      v81 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v81, v82);
      __cxa_throw(v81, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    v11->vocabSize = objc_msgSend_count(v11->vocab, v36, v37, v38);
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v6, v43, (uint64_t)CVNLPBeamSearchSize, v44);
    v45 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)v45;
    if (v45)
      objc_msgSend_setObject_forKeyedSubscript_(v42, v46, v45, (uint64_t)CVNLPBeamSearchSize);
    else
      objc_msgSend_setObject_forKeyedSubscript_(v42, v46, (uint64_t)&unk_1E60D49C8, (uint64_t)CVNLPBeamSearchSize);
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v48, v11->endID, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v42, v51, (uint64_t)v50, (uint64_t)CVNLPBeamEndToken);

    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v52, v11->vocabSize, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v42, v55, (uint64_t)v54, (uint64_t)CVNLPBeamSearchOutputVocabSize);

    objc_msgSend_setObject_forKeyedSubscript_(v42, v56, (uint64_t)v11->vocab, (uint64_t)CVNLPBeamSearchOutputVocabMap);
    objc_msgSend_setObject_forKeyedSubscript_(v42, v57, MEMORY[0x1E0C9AAB0], (uint64_t)CVNLPBeamSearchIncludeLanguageModel);
    v11->_beamSearch = (CVNLPBeamSearch *)CVNLPBeamSearchCreate(v42, 0);

  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  espresso_plan_destroy();
  espresso_context_destroy();
  CFRelease(self->_beamSearch);
  v3.receiver = self;
  v3.super_class = (Class)CVNLPCaptionDecoderLSTM;
  -[CVNLPCaptionDecoderLSTM dealloc](&v3, sel_dealloc);
}

- (id)packBeamID:(id)a3 tokenID:(id)a4 lstmAttnState:(id *)a5 lstmLangState:(id *)a6 softmax:(id *)a7
{
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *var0;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  _OWORD v52[10];
  uint64_t v53;
  _OWORD v54[10];
  uint64_t v55;

  v12 = a3;
  v13 = a4;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v17, v18, (uint64_t)v12, (uint64_t)CVNLPBeamSearchBeamID);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v19, (uint64_t)v13, (uint64_t)CVNLPBeamSearchNextTokenID);
  if (a7)
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v20, (uint64_t)a7->var0, 4 * self->vocabSize);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v17, v24, (uint64_t)v23, (uint64_t)CVNLPBeamSearchNextTokenSoftmaxValues);

  }
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v20, v21, v22);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    var0 = a5->var0;
    v30 = *(_OWORD *)&a5->var12;
    v54[8] = *(_OWORD *)&a5->var10;
    v54[9] = v30;
    v55 = *(_QWORD *)&a5->var14;
    v31 = *(_OWORD *)&a5->var4;
    v54[4] = *(_OWORD *)&a5->var3[2];
    v54[5] = v31;
    v32 = *(_OWORD *)&a5->var8;
    v54[6] = *(_OWORD *)&a5->var6;
    v54[7] = v32;
    v33 = *(_OWORD *)a5->var2;
    v54[0] = *(_OWORD *)&a5->var0;
    v54[1] = v33;
    v34 = *(_OWORD *)a5->var3;
    v54[2] = *(_OWORD *)&a5->var2[2];
    v54[3] = v34;
    v35 = objc_msgSend__blob_size_(self, v25, (uint64_t)v54, v27);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v36, (uint64_t)var0, 4 * v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v28, v38, (uint64_t)v37, (uint64_t)CFSTR("lstmAttnStateData"));

  }
  if (a6)
  {
    v39 = a6->var0;
    v40 = *(_OWORD *)&a6->var12;
    v52[8] = *(_OWORD *)&a6->var10;
    v52[9] = v40;
    v53 = *(_QWORD *)&a6->var14;
    v41 = *(_OWORD *)&a6->var4;
    v52[4] = *(_OWORD *)&a6->var3[2];
    v52[5] = v41;
    v42 = *(_OWORD *)&a6->var8;
    v52[6] = *(_OWORD *)&a6->var6;
    v52[7] = v42;
    v43 = *(_OWORD *)a6->var2;
    v52[0] = *(_OWORD *)&a6->var0;
    v52[1] = v43;
    v44 = *(_OWORD *)a6->var3;
    v52[2] = *(_OWORD *)&a6->var2[2];
    v52[3] = v44;
    v45 = objc_msgSend__blob_size_(self, v25, (uint64_t)v52, v27);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v46, (uint64_t)v39, 4 * v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v28, v48, (uint64_t)v47, (uint64_t)CFSTR("lstmLangStateData"));

  }
  v49 = (void *)objc_msgSend_copy(v28, v25, v26, v27);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v50, (uint64_t)v49, (uint64_t)CVNLPBeamSearchNextTokenMetaData);

  return v17;
}

- (void)extractBeamID:(id *)a3 tokenID:(id *)a4 lstmAttnState:(id *)a5 lstmLangState:(id *)a6 fromFollowup:(id)a7
{
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *var0;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const void *v50;
  _OWORD v51[10];
  uint64_t v52;
  _OWORD v53[10];
  uint64_t v54;

  v12 = a7;
  objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)CVNLPBeamSearchBeamID, v14);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v12, v15, (uint64_t)CVNLPBeamSearchNextTokenID, v16);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v12, v17, (uint64_t)CVNLPBeamSearchNextTokenMetaData, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)CFSTR("lstmAttnStateData"), v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    var0 = a5->var0;
    v26 = *(_OWORD *)&a5->var12;
    v53[8] = *(_OWORD *)&a5->var10;
    v53[9] = v26;
    v54 = *(_QWORD *)&a5->var14;
    v27 = *(_OWORD *)&a5->var4;
    v53[4] = *(_OWORD *)&a5->var3[2];
    v53[5] = v27;
    v28 = *(_OWORD *)&a5->var8;
    v53[6] = *(_OWORD *)&a5->var6;
    v53[7] = v28;
    v29 = *(_OWORD *)a5->var2;
    v53[0] = *(_OWORD *)&a5->var0;
    v53[1] = v29;
    v30 = *(_OWORD *)a5->var3;
    v53[2] = *(_OWORD *)&a5->var2[2];
    v53[3] = v30;
    v31 = objc_msgSend__blob_size_(self, v22, (uint64_t)v53, v23);
    v32 = objc_retainAutorelease(v24);
    v22 = (const char *)objc_msgSend_bytes(v32, v33, v34, v35);
    if (v31)
      memmove(var0, v22, 4 * v31);
  }
  objc_msgSend_objectForKeyedSubscript_(v19, v22, (uint64_t)CFSTR("lstmLangStateData"), v23);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = a6->var0;
    v40 = *(_OWORD *)&a6->var12;
    v51[8] = *(_OWORD *)&a6->var10;
    v51[9] = v40;
    v52 = *(_QWORD *)&a6->var14;
    v41 = *(_OWORD *)&a6->var4;
    v51[4] = *(_OWORD *)&a6->var3[2];
    v51[5] = v41;
    v42 = *(_OWORD *)&a6->var8;
    v51[6] = *(_OWORD *)&a6->var6;
    v51[7] = v42;
    v43 = *(_OWORD *)a6->var2;
    v51[0] = *(_OWORD *)&a6->var0;
    v51[1] = v43;
    v44 = *(_OWORD *)a6->var3;
    v51[2] = *(_OWORD *)&a6->var2[2];
    v51[3] = v44;
    v45 = objc_msgSend__blob_size_(self, v36, (uint64_t)v51, v37);
    v46 = objc_retainAutorelease(v38);
    v50 = (const void *)objc_msgSend_bytes(v46, v47, v48, v49);
    if (v45)
      memmove(v39, v50, 4 * v45);
  }

}

- (id)computeCaptionForImageWithInputs:(id)a3 genderOption:(int)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  const char *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  const char *v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  id v61;
  id v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t i;
  void *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  _BOOL4 v119;
  uint64_t v120;
  unint64_t j;
  void *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  std::runtime_error *exception;
  const char *v138;
  id v139;
  id v140;
  void *v141;
  void *context;
  void *contexta;
  void *v144;
  id obj;
  id obja;
  uint64_t v147;
  id v148;
  uint64_t v149;
  uint64_t v150;
  CFArrayRef theArray;
  CFArrayRef theArraya;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _OWORD v157[10];
  uint64_t v158;
  id v159;
  id v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  _OWORD v165[10];
  uint64_t v166;
  _OWORD v167[10];
  uint64_t v168;
  _OWORD v169[10];
  uint64_t v170;
  _OWORD v171[10];
  uint64_t v172;
  _OWORD v173[10];
  uint64_t v174;
  _QWORD v175[2];
  _QWORD v176[2];
  _BYTE v177[128];
  _BYTE v178[128];
  _QWORD v179[3];

  v179[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v141 = v5;
  if (self->meanFeaturesPresent)
  {
    objc_msgSend_objectAtIndexedSubscript_(v5, v6, 0, v7);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend_bytes(v8, v9, v10, v11);
    v13 = *(_OWORD *)&self->meanFeatsPlaceholderBlob.stride_batch_number;
    v173[8] = *(_OWORD *)&self->meanFeatsPlaceholderBlob.stride_height;
    v173[9] = v13;
    v174 = *(_QWORD *)&self->meanFeatsPlaceholderBlob.storage_type;
    v14 = *(_OWORD *)&self->meanFeatsPlaceholderBlob.width;
    v173[4] = *(_OWORD *)&self->meanFeatsPlaceholderBlob.stride[2];
    v173[5] = v14;
    v15 = *(_OWORD *)&self->meanFeatsPlaceholderBlob.channels;
    v173[7] = *(_OWORD *)&self->meanFeatsPlaceholderBlob.sequence_length;
    v173[6] = v15;
    v16 = *(_OWORD *)self->meanFeatsPlaceholderBlob.dim;
    v173[0] = *(_OWORD *)&self->meanFeatsPlaceholderBlob.data;
    v173[1] = v16;
    v17 = *(_OWORD *)&self->meanFeatsPlaceholderBlob.dim[2];
    v173[3] = *(_OWORD *)self->meanFeatsPlaceholderBlob.stride;
    v173[2] = v17;
    objc_msgSend__copy_data_to_blob_to_(self, v18, v12, (uint64_t)v173);

    v5 = v141;
  }
  objc_msgSend_objectAtIndexedSubscript_(v5, v6, 1, v7);
  v139 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v22 = objc_msgSend_bytes(v139, v19, v20, v21);
  v23 = *(_OWORD *)&self->attFeatsPlaceholderBlob.stride_batch_number;
  v171[8] = *(_OWORD *)&self->attFeatsPlaceholderBlob.stride_height;
  v171[9] = v23;
  v172 = *(_QWORD *)&self->attFeatsPlaceholderBlob.storage_type;
  v24 = *(_OWORD *)&self->attFeatsPlaceholderBlob.width;
  v171[4] = *(_OWORD *)&self->attFeatsPlaceholderBlob.stride[2];
  v171[5] = v24;
  v25 = *(_OWORD *)&self->attFeatsPlaceholderBlob.channels;
  v171[7] = *(_OWORD *)&self->attFeatsPlaceholderBlob.sequence_length;
  v171[6] = v25;
  v26 = *(_OWORD *)self->attFeatsPlaceholderBlob.dim;
  v171[0] = *(_OWORD *)&self->attFeatsPlaceholderBlob.data;
  v171[1] = v26;
  v27 = *(_OWORD *)self->attFeatsPlaceholderBlob.stride;
  v171[2] = *(_OWORD *)&self->attFeatsPlaceholderBlob.dim[2];
  v171[3] = v27;
  objc_msgSend__copy_data_to_blob_to_(self, v28, v22, (uint64_t)v171);
  objc_msgSend_objectAtIndexedSubscript_(v141, v29, 2, v30);
  v140 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v34 = objc_msgSend_bytes(v140, v31, v32, v33);
  v35 = *(_OWORD *)&self->pAttFeatsPlaceholderBlob.stride_batch_number;
  v169[8] = *(_OWORD *)&self->pAttFeatsPlaceholderBlob.stride_height;
  v169[9] = v35;
  v170 = *(_QWORD *)&self->pAttFeatsPlaceholderBlob.storage_type;
  v36 = *(_OWORD *)&self->pAttFeatsPlaceholderBlob.width;
  v169[4] = *(_OWORD *)&self->pAttFeatsPlaceholderBlob.stride[2];
  v169[5] = v36;
  v37 = *(_OWORD *)&self->pAttFeatsPlaceholderBlob.sequence_length;
  v169[6] = *(_OWORD *)&self->pAttFeatsPlaceholderBlob.channels;
  v169[7] = v37;
  v38 = *(_OWORD *)self->pAttFeatsPlaceholderBlob.dim;
  v169[0] = *(_OWORD *)&self->pAttFeatsPlaceholderBlob.data;
  v169[1] = v38;
  v39 = *(_OWORD *)self->pAttFeatsPlaceholderBlob.stride;
  v169[2] = *(_OWORD *)&self->pAttFeatsPlaceholderBlob.dim[2];
  v169[3] = v39;
  objc_msgSend__copy_data_to_blob_to_(self, v40, v34, (uint64_t)v169);
  v41 = *(_OWORD *)&self->lstmAttStateFeedBlob.stride_batch_number;
  v167[8] = *(_OWORD *)&self->lstmAttStateFeedBlob.stride_height;
  v167[9] = v41;
  v168 = *(_QWORD *)&self->lstmAttStateFeedBlob.storage_type;
  v42 = *(_OWORD *)&self->lstmAttStateFeedBlob.width;
  v167[4] = *(_OWORD *)&self->lstmAttStateFeedBlob.stride[2];
  v167[5] = v42;
  v43 = *(_OWORD *)&self->lstmAttStateFeedBlob.sequence_length;
  v167[6] = *(_OWORD *)&self->lstmAttStateFeedBlob.channels;
  v167[7] = v43;
  v44 = *(_OWORD *)self->lstmAttStateFeedBlob.dim;
  v167[0] = *(_OWORD *)&self->lstmAttStateFeedBlob.data;
  v167[1] = v44;
  v45 = *(_OWORD *)self->lstmAttStateFeedBlob.stride;
  v167[2] = *(_OWORD *)&self->lstmAttStateFeedBlob.dim[2];
  v167[3] = v45;
  LODWORD(v45) = 0;
  objc_msgSend__fill_blob_data_with_(self, v46, (uint64_t)v167, v47, *(double *)&v45);
  v48 = *(_OWORD *)&self->lstmLangStateFeedBlob.stride_batch_number;
  v165[8] = *(_OWORD *)&self->lstmLangStateFeedBlob.stride_height;
  v165[9] = v48;
  v166 = *(_QWORD *)&self->lstmLangStateFeedBlob.storage_type;
  v49 = *(_OWORD *)&self->lstmLangStateFeedBlob.width;
  v165[4] = *(_OWORD *)&self->lstmLangStateFeedBlob.stride[2];
  v165[5] = v49;
  v50 = *(_OWORD *)&self->lstmLangStateFeedBlob.sequence_length;
  v165[6] = *(_OWORD *)&self->lstmLangStateFeedBlob.channels;
  v165[7] = v50;
  v51 = *(_OWORD *)self->lstmLangStateFeedBlob.dim;
  v165[0] = *(_OWORD *)&self->lstmLangStateFeedBlob.data;
  v165[1] = v51;
  v52 = *(_OWORD *)self->lstmLangStateFeedBlob.stride;
  v165[2] = *(_OWORD *)&self->lstmLangStateFeedBlob.dim[2];
  v165[3] = v52;
  LODWORD(v52) = 0;
  objc_msgSend__fill_blob_data_with_(self, v53, (uint64_t)v165, v54, *(double *)&v52);
  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v55, self->startID, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_packBeamID_tokenID_lstmAttnState_lstmLangState_softmax_(self, v58, 0, (uint64_t)v57, 0, 0, 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v179[0] = v59;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v60, (uint64_t)v179, 1);
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = 0;
  v62 = 0;
  do
  {
    context = (void *)MEMORY[0x1B5E08128]();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v63, v64, v65);
    theArray = (CFArrayRef)objc_claimAutoreleasedReturnValue();
    v163 = 0u;
    v164 = 0u;
    v161 = 0u;
    v162 = 0u;
    obj = v144;
    v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v66, (uint64_t)&v161, (uint64_t)v178, 16);
    if (v67)
    {
      v149 = *(_QWORD *)v162;
      do
      {
        v68 = 0;
        v69 = v61;
        v70 = v62;
        do
        {
          if (*(_QWORD *)v162 != v149)
            objc_enumerationMutation(obj);
          v71 = *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * v68);
          v72 = (void *)MEMORY[0x1B5E08128]();
          v159 = v69;
          v160 = v70;
          objc_msgSend_extractBeamID_tokenID_lstmAttnState_lstmLangState_fromFollowup_(self, v73, (uint64_t)&v160, (uint64_t)&v159, &self->lstmAttStateFeedBlob, &self->lstmLangStateFeedBlob, v71);
          v62 = v160;

          v61 = v159;
          v74 = *(_OWORD *)&self->inWordIDBlob.stride_batch_number;
          v157[8] = *(_OWORD *)&self->inWordIDBlob.stride_height;
          v157[9] = v74;
          v158 = *(_QWORD *)&self->inWordIDBlob.storage_type;
          v75 = *(_OWORD *)&self->inWordIDBlob.width;
          v157[4] = *(_OWORD *)&self->inWordIDBlob.stride[2];
          v157[5] = v75;
          v76 = *(_OWORD *)&self->inWordIDBlob.sequence_length;
          v157[6] = *(_OWORD *)&self->inWordIDBlob.channels;
          v157[7] = v76;
          v77 = *(_OWORD *)self->inWordIDBlob.dim;
          v157[0] = *(_OWORD *)&self->inWordIDBlob.data;
          v157[1] = v77;
          v78 = *(_OWORD *)self->inWordIDBlob.stride;
          v157[2] = *(_OWORD *)&self->inWordIDBlob.dim[2];
          v157[3] = v78;
          *(float *)&v82 = (float)(unint64_t)objc_msgSend_unsignedIntegerValue(v61, v79, v80, v81);
          objc_msgSend__fill_blob_data_with_(self, v83, (uint64_t)v157, v84, v82);
          if (espresso_plan_execute_sync())
          {
            exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            espresso_plan_get_error_info();
            std::runtime_error::runtime_error(exception, v138);
            __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
          }
          objc_msgSend_packBeamID_tokenID_lstmAttnState_lstmLangState_softmax_(self, v85, (uint64_t)v62, (uint64_t)v61, &self->newAttStateBlob, &self->newLangStateBlob, &self->langProbBlob);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(theArray, v87, (uint64_t)v86, v88);

          objc_autoreleasePoolPop(v72);
          ++v68;
          v69 = v61;
          v70 = v62;
        }
        while (v67 != v68);
        v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v89, (uint64_t)&v161, (uint64_t)v178, 16);
      }
      while (v67);
    }

    v144 = CVNLPBeamSearchOneStep((uint64_t)self->_beamSearch, theArray);
    objc_autoreleasePoolPop(context);
  }
  while (objc_msgSend_count(v144, v90, v91, v92));
  contexta = (void *)CVNLPBeamSearchCopyTopBeams((uint64_t)self->_beamSearch);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v93, v94, v95);
  v148 = (id)objc_claimAutoreleasedReturnValue();
  v155 = 0u;
  v156 = 0u;
  v153 = 0u;
  v154 = 0u;
  obja = contexta;
  v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v96, (uint64_t)&v153, (uint64_t)v177, 16);
  if (v97)
  {
    v147 = *(_QWORD *)v154;
    do
    {
      v150 = v97;
      for (i = 0; i != v150; ++i)
      {
        if (*(_QWORD *)v154 != v147)
          objc_enumerationMutation(obja);
        v102 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * i);
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v98, v99, v100);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v102, v104, (uint64_t)CVNLPBeamTokens, v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v102, v107, (uint64_t)CVNLPBeamScore, v108);
        theArraya = (CFArrayRef)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_count(v106, v109, v110, v111))
        {
          objc_msgSend_lastObject(v106, v112, v113, v114);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          v119 = objc_msgSend_unsignedIntegerValue(v115, v116, v117, v118) == self->endID;

          if (v119)
          {
            for (j = 0; j < objc_msgSend_count(v106, v112, v120, v114) - 1; ++j)
            {
              objc_msgSend_objectAtIndexedSubscript_(v106, v112, j, v114);
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v123, (uint64_t)CFSTR("%@"), v124, v122);
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(self->vocab, v126, (uint64_t)v125, v127);
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v103, v129, (uint64_t)v128, v130);

            }
          }
        }
        v175[0] = CVNLPGeneratedCaption;
        objc_msgSend_componentsJoinedByString_(v103, v112, (uint64_t)CFSTR(" "), v114);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        v175[1] = CVNLPGeneratedCaptionScore;
        v176[0] = v131;
        v176[1] = theArraya;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v132, (uint64_t)v176, (uint64_t)v175, 2);
        v133 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_addObject_(v148, v134, (uint64_t)v133, v135);
      }
      v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v98, (uint64_t)&v153, (uint64_t)v177, 16);
    }
    while (v97);
  }

  sub_1B035BD2C((_QWORD *)self->_beamSearch + 2);
  return v148;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->vocab, 0);
}

@end
