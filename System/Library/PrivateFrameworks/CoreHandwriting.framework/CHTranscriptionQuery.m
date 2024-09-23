@implementation CHTranscriptionQuery

- (id)contextualTextResultsForContextStrokes:(id)a3 completion:(id)a4 shouldCancel:(id)a5
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
  id v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  _QWORD v42[4];
  id v43;
  os_signpost_id_t v44;
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  v10 = a3;
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
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CHTranscriptionQuery", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v14 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTranscriptionQuery\", buf, 2u);
  }

  objc_msgSend_recognitionSession(self, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_latestStrokeProvider(v20, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodedStrokeIdentifiers_withStrokeProvider_(CHStrokeUtilities, v27, (uint64_t)v10, (uint64_t)v26, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_recognitionSession(self, v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = sub_1BE7ED214;
  v42[3] = &unk_1E77F5720;
  v43 = v8;
  v44 = v12;
  v37 = v8;
  objc_msgSend_contextualTextResultsForContextStrokes_completion_shouldCancel_(v36, v38, (uint64_t)v30, (uint64_t)v42, (uint64_t)v9, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (id)debugName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Transcription Query %p"), v2, v3, v4, self);
}

@end
