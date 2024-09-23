@implementation CHReflowQuery

- (id)reflowableTextTokensForInitialStrokes:(id)a3 point:(CGPoint)a4 completion:(id)a5 shouldCancel:(id)a6
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
  id v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  _QWORD v46[4];
  id v47;
  id v48;
  os_signpost_id_t v49;
  double v50;
  double v51;
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
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CHReflowQuery", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v17 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHReflowQuery\", buf, 2u);
  }

  objc_msgSend_recognitionSession(self, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_latestStrokeProvider(v23, v24, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodedStrokeIdentifiers_withStrokeProvider_(CHStrokeUtilities, v30, (uint64_t)v11, (uint64_t)v29, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_recognitionSession(self, v34, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = sub_1BE83C10C;
  v46[3] = &unk_1E77F5DB0;
  v48 = v12;
  v49 = v15;
  v50 = x;
  v51 = y;
  v47 = v11;
  v40 = v12;
  v41 = v11;
  objc_msgSend_reflowableTextLinesForContextStrokes_point_completion_shouldCancel_(v39, v42, (uint64_t)v33, (uint64_t)v46, (uint64_t)v13, v43, x, y);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
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

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("CHReflowQuery %p"), v2, v3, v4, self);
}

@end
