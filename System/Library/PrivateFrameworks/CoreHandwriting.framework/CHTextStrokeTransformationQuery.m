@implementation CHTextStrokeTransformationQuery

- (id)strokePointTransformationsForContextStrokes:(id)a3 completionWithTelemetry:(id)a4 shouldCancel:(id)a5
{
  id v8;
  id v9;
  id v10;
  CHTransformationParameters *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(CHTransformationParameters);
  objc_msgSend_setOrientationBehavior_(v11, v12, 2, v13, v14, v15);
  objc_msgSend_setAlignmentBehavior_(v11, v16, 1, v17, v18, v19);
  objc_msgSend_setLineSpaceBehavior_(v11, v20, 2, v21, v22, v23);
  objc_msgSend_strokePointTransformationsForContextStrokes_parameters_completionWithTelemetry_shouldCancel_(self, v24, (uint64_t)v10, (uint64_t)v11, (uint64_t)v9, (uint64_t)v8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)strokePointTransformationsForContextStrokes:(id)a3 parameters:(id)a4 completionWithTelemetry:(id)a5 shouldCancel:(id)a6
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
  id v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, void *, void *, void *);
  void *v48;
  id v49;
  os_signpost_id_t v50;
  uint8_t buf[16];

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
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
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CHTextStrokeTransformationQuery", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v17 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTextStrokeTransformationQuery\", buf, 2u);
  }

  objc_msgSend_recognitionSession(self, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_latestStrokeProvider(v23, v24, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodedStrokeIdentifiers_withStrokeProvider_(CHStrokeUtilities, v30, (uint64_t)v13, (uint64_t)v29, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = MEMORY[0x1E0C809B0];
  v46 = 3221225472;
  v47 = sub_1BE6B67D4;
  v48 = &unk_1E77F31F0;
  v49 = v10;
  v50 = v15;
  v34 = v10;
  v35 = (void *)MEMORY[0x1C3B81A84](&v45);
  objc_msgSend_recognitionSession(self, v36, v37, v38, v39, v40, v45, v46, v47, v48);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokePointTransformationsForContextStrokes_parameters_completionWithTelemetry_shouldCancel_(v41, v42, (uint64_t)v33, (uint64_t)v12, (uint64_t)v35, (uint64_t)v11);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
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

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("CHTextStrokeTransformationQuery %p"), v2, v3, v4, self);
}

@end
