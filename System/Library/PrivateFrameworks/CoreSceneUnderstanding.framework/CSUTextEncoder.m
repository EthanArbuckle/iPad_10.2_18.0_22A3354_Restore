@implementation CSUTextEncoder

- (CSUTextEncoder)initWithConfiguration:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CSUTextEncoderE5ML *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  CSUTextEncoderE5ML *v19;
  CSUTextEncoderE5ML *textEncoderE5ML;
  CSUTextEncoder *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_configuration, a3);
  if ((unint64_t)(objc_msgSend_revision(v5, v6, v7, v8, v9) - 6) >= 3)
  {
    sub_23A016E78();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_msgSend_revision(v5, v23, v24, v25, v26);
      sub_23A09DD2C((uint64_t)v29, v27, v22);
    }

    goto LABEL_7;
  }
  v10 = [CSUTextEncoderE5ML alloc];
  objc_msgSend_textEncoderE5MLConfig(v5, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (CSUTextEncoderE5ML *)objc_msgSend_initWithConfiguration_(v10, v16, (uint64_t)v15, v17, v18);
  textEncoderE5ML = self->_textEncoderE5ML;
  self->_textEncoderE5ML = v19;

  if (!self->_textEncoderE5ML)
  {
LABEL_7:
    v21 = 0;
    goto LABEL_8;
  }
  v21 = self;
LABEL_8:

  return v21;
}

- (BOOL)loadResources:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  *a3 = 0;
  if ((unint64_t)(objc_msgSend_revision(self->_configuration, a2, (uint64_t)a3, v3, v4) - 6) <= 2)
    return objc_msgSend_loadResources_(self->_textEncoderE5ML, v7, (uint64_t)a3, v8, v9);
  objc_msgSend_errorForInvalidArgumentWithLocalizedDescription_(CSUError, v7, (uint64_t)CFSTR("Text encoder revision not supported in loadResources(...)"), v8, v9);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return 0;
}

- (BOOL)reLoadResources:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  *a3 = 0;
  if ((unint64_t)(objc_msgSend_revision(self->_configuration, a2, (uint64_t)a3, v3, v4) - 6) <= 2)
    return objc_msgSend_reLoadResources_(self->_textEncoderE5ML, v7, (uint64_t)a3, v8, v9);
  objc_msgSend_errorForInvalidArgumentWithLocalizedDescription_(CSUError, v7, (uint64_t)CFSTR("Text encoder revision not supported in reLoadResources(...)"), v8, v9);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return 0;
}

- (void)runOnInput:(id)a3 error:(id *)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  void *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  CSUTextEncoderE5ML *textEncoderE5ML;
  const char *v76;
  uint64_t v77;
  uint8_t *v78;
  uint64_t v79;
  void *context;
  CSUTextEncoder *v81;
  id v82;
  _QWORD v84[6];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  uint8_t v95[128];
  uint8_t buf[8];
  os_signpost_id_t v97;
  uint8_t *v98;
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v82 = a3;
  v89 = 0;
  v90 = &v89;
  v91 = 0x3032000000;
  v92 = sub_23A00E450;
  v93 = sub_23A00E460;
  v94 = 0;
  v81 = self;
  if ((unint64_t)(objc_msgSend_revision(self->_configuration, v5, v6, v7, v8) - 6) >= 3)
  {
    v62 = (void *)MEMORY[0x24BDD17C8];
    v63 = objc_msgSend_revision(self->_configuration, v9, v10, v11, v12);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v68, (uint64_t)v67, v69, v70);
    v71 = objc_claimAutoreleasedReturnValue();
    v72 = (void *)v90[5];
    v90[5] = v71;

    goto LABEL_28;
  }
  context = (void *)MEMORY[0x23B840290]();
  sub_23A016E78();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_generate(v13);

  sub_23A016E78();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239FE9000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "CSUTextEncoderE5MLRunOnInput", ", buf, 2u);
  }

  *(_QWORD *)buf = &off_250B0BCC0;
  v97 = v14;
  v98 = buf;
  v17 = (void *)objc_opt_new();
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v18 = v82;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v85, (uint64_t)v95, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v86;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v86 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v24 = (void *)objc_opt_new();
          objc_msgSend_string(v23, v25, v26, v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setString_(v24, v30, (uint64_t)v29, v31, v32);

          objc_msgSend_addObject_(v17, v33, (uint64_t)v24, v34, v35);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v24 = (void *)objc_opt_new();
            objc_msgSend_embedding(v23, v36, v37, v38, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setEmbedding_(v24, v41, (uint64_t)v40, v42, v43);

            objc_msgSend_addObject_(v17, v44, (uint64_t)v24, v45, v46);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend_errorForInvalidArgumentWithLocalizedDescription_(CSUError, v47, (uint64_t)CFSTR("input item in array for text encoding should be one of types CSUString, CSUTokenEmbedding, CSUTokenID"), v48, v49);
              v73 = objc_claimAutoreleasedReturnValue();
              v74 = (void *)v90[5];
              v90[5] = v73;

              goto LABEL_21;
            }
            v24 = (void *)objc_opt_new();
            objc_msgSend_tokenID(v23, v50, v51, v52, v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setTokenID_(v24, v55, (uint64_t)v54, v56, v57);

            objc_msgSend_addObject_(v17, v58, (uint64_t)v24, v59, v60);
          }
        }

      }
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v61, (uint64_t)&v85, (uint64_t)v95, 16);
      if (v20)
        continue;
      break;
    }
  }
LABEL_21:

  textEncoderE5ML = v81->_textEncoderE5ML;
  v84[0] = MEMORY[0x24BDAC760];
  v84[1] = 3221225472;
  v84[2] = sub_23A00E468;
  v84[3] = &unk_250B0E3A8;
  v84[4] = v81;
  v84[5] = &v89;
  objc_msgSend_runOnInput_completion_(textEncoderE5ML, v76, (uint64_t)v17, (uint64_t)v84, v77);

  if (!v98)
    sub_239FF19E8();
  (*(void (**)(uint8_t *))(*(_QWORD *)v98 + 48))(v98);
  v78 = v98;
  if (v98 == buf)
  {
    v79 = 4;
    v78 = buf;
    goto LABEL_26;
  }
  if (v98)
  {
    v79 = 5;
LABEL_26:
    (*(void (**)(void))(*(_QWORD *)v78 + 8 * v79))();
  }
  objc_autoreleasePoolPop(context);
LABEL_28:
  if (a4)
    *a4 = objc_retainAutorelease((id)v90[5]);
  _Block_object_dispose(&v89, 8);

}

- (void)runOnInputText:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CSUTextEncoderE5ML *textEncoderE5ML;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_23A00E450;
  v35 = sub_23A00E460;
  v36 = 0;
  if ((unint64_t)(objc_msgSend_revision(self->_configuration, v7, v8, v9, v10) - 6) >= 3)
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    v20 = objc_msgSend_revision(self->_configuration, v11, v12, v13, v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v25, (uint64_t)v24, v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v32[5];
    v32[5] = v28;

    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v15 = (void *)MEMORY[0x23B840290]();
  textEncoderE5ML = self->_textEncoderE5ML;
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = sub_23A00E7F0;
  v30[3] = &unk_250B0E3A8;
  v30[4] = self;
  v30[5] = &v31;
  objc_msgSend_runOnInputText_completion_(textEncoderE5ML, v17, (uint64_t)v6, (uint64_t)v30, v18);
  objc_autoreleasePoolPop(v15);
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease((id)v32[5]);
LABEL_4:
  _Block_object_dispose(&v31, 8);

}

- (void)setContextLength:(unint64_t)a3 error:(id *)a4
{
  uint64_t v4;
  CSUTextEncoderConfiguration *configuration;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  configuration = self->_configuration;
  if (!a4 || configuration)
  {
    if (objc_msgSend_contextLength(configuration, a2, a3, (uint64_t)a4, v4) != a3)
    {
      sub_23A016E78();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v16 = 134217984;
        v17 = a3;
        _os_log_impl(&dword_239FE9000, v9, OS_LOG_TYPE_INFO, "Setting new context length %lu", (uint8_t *)&v16, 0xCu);
      }

      objc_msgSend_setContextLength_(self->_configuration, v10, a3, v11, v12);
      objc_msgSend_reLoadResources_(self, v13, (uint64_t)a4, v14, v15);
    }
  }
  else
  {
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, a2, (uint64_t)CFSTR("Text Encoder Configuration in setContextLength(...) is nil!"), (uint64_t)a4, v4);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
}

- (CSUTextEncoderConfiguration)configuration
{
  return self->_configuration;
}

- (CSUTextEncoderOutput)inferenceOutputs
{
  return self->_inferenceOutputs;
}

- (void)setInferenceOutputs:(id)a3
{
  objc_storeStrong((id *)&self->_inferenceOutputs, a3);
}

- (CSUSystemSearchTextEncoderV1)systemSearchtextEncoder
{
  return self->_systemSearchtextEncoder;
}

- (void)setSystemSearchtextEncoder:(id)a3
{
  objc_storeStrong((id *)&self->_systemSearchtextEncoder, a3);
}

- (CSUTextEncoderE5ML)textEncoderE5ML
{
  return self->_textEncoderE5ML;
}

- (void)setTextEncoderE5ML:(id)a3
{
  objc_storeStrong((id *)&self->_textEncoderE5ML, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEncoderE5ML, 0);
  objc_storeStrong((id *)&self->_systemSearchtextEncoder, 0);
  objc_storeStrong((id *)&self->_inferenceOutputs, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
