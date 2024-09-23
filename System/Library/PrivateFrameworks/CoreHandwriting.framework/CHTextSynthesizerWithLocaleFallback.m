@implementation CHTextSynthesizerWithLocaleFallback

- (CHTextSynthesizerWithLocaleFallback)initWithLocales:(id)a3 baseSynthesizer:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CHTextSynthesizerWithLocaleFallback *v13;
  uint64_t v14;
  NSArray *locales;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CHTextSynthesizerWithLocaleFallback;
  v13 = -[CHTextSynthesizerWithLocaleFallback init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend_copy(v6, v8, v9, v10, v11, v12);
    locales = v13->_locales;
    v13->_locales = (NSArray *)v14;

    objc_storeStrong((id *)&v13->_synthesizer, a4);
  }

  return v13;
}

- (id)supportedCharacterIndexesForString:(id)a3 options:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  objc_msgSend_supportedCharacterIndexesForString_options_(self->_synthesizer, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)synthesizeDrawingForString:(id)a3 options:(id)a4 shouldCancel:(id)a5 error:(id *)a6
{
  objc_msgSend_synthesizeDrawingForString_options_shouldCancel_error_(self->_synthesizer, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)refineDrawing:(id)a3 transcription:(id)a4 options:(id)a5 shouldCancel:(id)a6 error:(id *)a7
{
  objc_msgSend_refineDrawing_transcription_options_shouldCancel_error_(self->_synthesizer, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)replaceDrawing:(id)a3 originalTranscription:(id)a4 replacementTranscription:(id)a5 options:(id)a6 shouldCancel:(id)a7 error:(id *)a8
{
  objc_msgSend_replaceDrawing_originalTranscription_replacementTranscription_options_shouldCancel_error_(self->_synthesizer, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, a8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)synthesizeExpressionEvaluationResultWithBlock:(id)a3 options:(id)a4 shouldCancel:(id)a5 error:(id *)a6
{
  void (**v10)(id, void *);
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSArray *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSArray *obj;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  NSArray *v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, void *))a3;
  v56 = a4;
  v11 = a5;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = self->_locales;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v57, (uint64_t)v67, 16, v13);
  if (v14)
  {
    v15 = *(_QWORD *)v58;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v58 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        v10[2](v10, v17);
        v18 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_synthesizeDrawingForString_options_shouldCancel_error_(self->_synthesizer, v19, (uint64_t)v18, (uint64_t)v56, (uint64_t)v11, (uint64_t)a6);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v20;
        if (v20 && !objc_msgSend_numberOfNotSynthesizedCharacters(v20, v21, v22, v23, v24, v25))
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v41 = (id)qword_1EF568E60;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_localeIdentifier(v17, v42, v43, v44, v45, v46);
            v47 = (NSArray *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend_length(v18, v48, v49, v50, v51, v52);
            *(_DWORD *)buf = 138412803;
            v62 = v47;
            v63 = 2117;
            v64 = (uint64_t)v18;
            v65 = 2048;
            v66 = v53;
            _os_log_impl(&dword_1BE607000, v41, OS_LOG_TYPE_DEFAULT, "SynthesizerWithLocalFallback: Synthesizing expression evaluation result with %@ transcription=\"%{sensitive}@\" (length=%lu)", buf, 0x20u);

          }
          goto LABEL_19;
        }

      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v57, (uint64_t)v67, 16, v28);
      if (v14)
        continue;
      break;
    }
  }

  objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E0C99DC8], v29, (uint64_t)CFSTR("en_US"), v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, v33);
  obj = (NSArray *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_synthesizeDrawingForString_options_shouldCancel_error_(self->_synthesizer, v34, (uint64_t)obj, (uint64_t)v56, (uint64_t)v11, (uint64_t)a6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v18 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v40 = objc_msgSend_length(obj, v35, v36, v37, v38, v39);
    *(_DWORD *)buf = 138740227;
    v62 = obj;
    v63 = 2048;
    v64 = v40;
    _os_log_impl(&dword_1BE607000, v18, OS_LOG_TYPE_DEFAULT, "SynthesizerWithLocalFallback: Synthesizing expression evaluation result in en_US locale with transcription=\"%{sensitive}@\" (length=%lu)", buf, 0x16u);
  }
LABEL_19:

  return v26;
}

- (NSArray)locales
{
  return self->_locales;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_synthesizer, 0);
}

@end
