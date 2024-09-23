@implementation CHTextSynthesisQuery

- (id)refinementOfContextStrokesWithTranscriptions:(id)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSNumber *styleControlStrength;
  id v38;
  const char *v39;
  void *v40;
  _QWORD v42[4];
  id v43;
  os_signpost_id_t v44;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v11 = (id)qword_1EF568E50;
  v12 = os_signpost_id_generate(v11);

  if (qword_1EF568E88 == -1)
  {
    v13 = (id)qword_1EF568E50;
    if (v12 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v13 = (id)qword_1EF568E50;
    if (v12 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CHTextSynthesisQuery_refineContext", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v14 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTextSynthesisQuery_refineContext\", buf, 2u);
  }

  objc_msgSend_recognitionSession(self, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_latestStrokeProvider(v20, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodedStrokeIdentifiers_withStrokeProvider_(CHStrokeUtilities, v27, (uint64_t)v8, (uint64_t)v26, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_recognitionSession(self, v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  styleControlStrength = self->_styleControlStrength;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = sub_1BE630054;
  v42[3] = &unk_1E77F22B8;
  v44 = v12;
  v38 = v9;
  v43 = v38;
  objc_msgSend_refinementOfContextStrokes_styleControlParameter_completion_shouldCancel_(v36, v39, (uint64_t)v30, (uint64_t)styleControlStrength, (uint64_t)v42, (uint64_t)v10);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (id)refinedTokensForContextStrokes:(id)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSNumber *styleControlStrength;
  id v38;
  const char *v39;
  void *v40;
  _QWORD v42[4];
  id v43;
  os_signpost_id_t v44;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v11 = (id)qword_1EF568E50;
  v12 = os_signpost_id_generate(v11);

  if (qword_1EF568E88 == -1)
  {
    v13 = (id)qword_1EF568E50;
    if (v12 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v13 = (id)qword_1EF568E50;
    if (v12 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CHTextSynthesisQuery_refinedTokens", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v14 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTextSynthesisQuery_refinedTokens\", buf, 2u);
  }

  objc_msgSend_recognitionSession(self, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_latestStrokeProvider(v20, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodedStrokeIdentifiers_withStrokeProvider_(CHStrokeUtilities, v27, (uint64_t)v8, (uint64_t)v26, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_recognitionSession(self, v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  styleControlStrength = self->_styleControlStrength;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = sub_1BE6304E8;
  v42[3] = &unk_1E77F22E0;
  v44 = v12;
  v38 = v9;
  v43 = v38;
  objc_msgSend_refinedTokensForContextStrokes_styleControlParameter_completion_shouldCancel_(v36, v39, (uint64_t)v30, (uint64_t)styleControlStrength, (uint64_t)v42, (uint64_t)v10);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (id)refinementOfSingleLineContextStrokes:(id)a3 transcription:(id)a4 completion:(id)a5 shouldCancel:(id)a6
{
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  NSNumber *styleControlStrength;
  id v75;
  const char *v76;
  void *v77;
  id v79;
  id v80;
  id v81;
  _QWORD v82[4];
  id v83;
  os_signpost_id_t v84;
  uint8_t buf[4];
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v81 = a3;
  v10 = a4;
  v79 = a5;
  v80 = a6;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v11 = (id)qword_1EF568E50;
  v12 = os_signpost_id_generate(v11);

  if (qword_1EF568E88 == -1)
  {
    v13 = (id)qword_1EF568E50;
    if (v12 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v13 = (id)qword_1EF568E50;
    if (v12 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CHTextSynthesisQuery_refineSingleLine", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v14 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTextSynthesisQuery_refineSingleLine\", buf, 2u);
  }

  objc_msgSend_recognitionSession(self, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_latestStrokeProvider(v20, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodedStrokeIdentifiers_withStrokeProvider_(CHStrokeUtilities, v27, (uint64_t)v81, (uint64_t)v26, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (qword_1EF568E88 != -1)
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v31 = (id)qword_1EF568E18[0];
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      goto LABEL_14;
    goto LABEL_13;
  }
  v31 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
LABEL_13:
    v37 = objc_msgSend_length(v10, v32, v33, v34, v35, v36);
    v43 = objc_msgSend_count(v81, v38, v39, v40, v41, v42);
    objc_msgSend_recognitionSession(self, v44, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_latestStrokeProvider(v49, v50, v51, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_orderedStrokes(v55, v56, v57, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend_count(v61, v62, v63, v64, v65, v66);
    *(_DWORD *)buf = 134218496;
    v86 = v37;
    v87 = 2048;
    v88 = v43;
    v89 = 2048;
    v90 = v67;
    _os_log_impl(&dword_1BE607000, v31, OS_LOG_TYPE_DEBUG, "CHTextSynthesisQuery is running AutoRefine for transcription with length = %ld, strokes to replace = %ld, strokes in provider = %ld", buf, 0x20u);

  }
LABEL_14:

  objc_msgSend_recognitionSession(self, v68, v69, v70, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  styleControlStrength = self->_styleControlStrength;
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = sub_1BE630AB4;
  v82[3] = &unk_1E77F22E0;
  v84 = v12;
  v75 = v79;
  v83 = v75;
  objc_msgSend_refinedTokensForSingleLineContextStrokes_styleControlParameter_transcription_completion_shouldCancel_(v73, v76, (uint64_t)v30, (uint64_t)styleControlStrength, (uint64_t)v10, (uint64_t)v82, v80);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  return v77;
}

- (id)refinedTokensForSingleLineContextStrokes:(id)a3 transcription:(id)a4 completion:(id)a5 shouldCancel:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSNumber *styleControlStrength;
  id v41;
  const char *v42;
  void *v43;
  _QWORD v45[4];
  id v46;
  os_signpost_id_t v47;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v14 = (id)qword_1EF568E50;
  v15 = os_signpost_id_generate(v14);

  if (qword_1EF568E88 == -1)
  {
    v16 = (id)qword_1EF568E50;
    if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v16 = (id)qword_1EF568E50;
    if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CHTextSynthesisQuery_refinedTokensSingleLine", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v17 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTextSynthesisQuery_refinedTokensSingleLine\", buf, 2u);
  }

  objc_msgSend_recognitionSession(self, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_latestStrokeProvider(v23, v24, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodedStrokeIdentifiers_withStrokeProvider_(CHStrokeUtilities, v30, (uint64_t)v10, (uint64_t)v29, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_recognitionSession(self, v34, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  styleControlStrength = self->_styleControlStrength;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = sub_1BE631144;
  v45[3] = &unk_1E77F22E0;
  v47 = v15;
  v41 = v12;
  v46 = v41;
  objc_msgSend_refinedTokensForSingleLineContextStrokes_styleControlParameter_transcription_completion_shouldCancel_(v39, v42, (uint64_t)v33, (uint64_t)styleControlStrength, (uint64_t)v11, (uint64_t)v45, v13);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (id)synthesizeTokensForString:(id)a3 point:(CGPoint)a4 completion:(id)a5 shouldCancel:(id)a6
{
  double y;
  double x;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  os_signpost_id_t v31;
  uint8_t buf[16];

  y = a4.y;
  x = a4.x;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v14 = (id)qword_1EF568E50;
  v15 = os_signpost_id_generate(v14);

  if (qword_1EF568E88 == -1)
  {
    v16 = (id)qword_1EF568E50;
    if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v16 = (id)qword_1EF568E50;
    if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CHTextSynthesisQuery_synthesizeTokens", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v17 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTextSynthesisQuery_synthesizeTokens\", buf, 2u);
  }

  objc_msgSend_recognitionSession(self, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_1BE631530;
  v29[3] = &unk_1E77F22E0;
  v31 = v15;
  v24 = v12;
  v30 = v24;
  objc_msgSend_synthesizeTokensForString_point_completion_shouldCancel_(v23, v25, (uint64_t)v11, (uint64_t)v29, (uint64_t)v13, v26, x, y);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)synthesizeTokensForString:(id)a3 replacingStrokes:(id)a4 completion:(id)a5 shouldCancel:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  const char *v41;
  void *v42;
  _QWORD v44[4];
  id v45;
  os_signpost_id_t v46;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v14 = (id)qword_1EF568E50;
  v15 = os_signpost_id_generate(v14);

  if (qword_1EF568E88 == -1)
  {
    v16 = (id)qword_1EF568E50;
    if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v16 = (id)qword_1EF568E50;
    if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CHTextSynthesisQuery_synthesizeTokensReplacing", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v17 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTextSynthesisQuery_synthesizeTokensReplacing\", buf, 2u);
  }

  objc_msgSend_recognitionSession(self, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_latestStrokeProvider(v23, v24, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodedStrokeIdentifiers_withStrokeProvider_(CHStrokeUtilities, v30, (uint64_t)v11, (uint64_t)v29, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_recognitionSession(self, v34, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = sub_1BE6319A8;
  v44[3] = &unk_1E77F22E0;
  v46 = v15;
  v40 = v12;
  v45 = v40;
  objc_msgSend_synthesizeTokensForString_replacingStrokes_completion_shouldCancel_(v39, v41, (uint64_t)v10, (uint64_t)v33, (uint64_t)v44, (uint64_t)v13);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

- (BOOL)q_doesQueryResultDependOnDeclaredVariables
{
  return 0;
}

- (id)debugName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("CHTextSynthesisQuery %p"), v2, v3, v4, self);
}

- (NSNumber)styleControlStrength
{
  return self->_styleControlStrength;
}

- (void)setStyleControlStrength:(id)a3
{
  objc_storeStrong((id *)&self->_styleControlStrength, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleControlStrength, 0);
}

@end
