@implementation CHContextLookupQuery

- (id)contextLookupResultsAtLocation:(CGPoint)a3 completion:(id)a4 shouldCancel:(id)a5
{
  double y;
  double x;
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
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  os_signpost_id_t v29;
  uint8_t buf[16];

  y = a3.y;
  x = a3.x;
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
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CHContextLookupQuery_atLocation", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v14 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHContextLookupQuery_atLocation\", buf, 2u);
  }

  objc_msgSend_recognitionSession(self, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1BE6CDE44;
  v27[3] = &unk_1E77F36E0;
  v28 = v9;
  v29 = v12;
  v21 = v9;
  objc_msgSend_contextLookupResultsAtLocation_completion_shouldCancel_(v20, v22, (uint64_t)v27, (uint64_t)v10, v23, v24, x, y);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)contextLookupResultsWithSelectionPath:(CGPath *)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  os_signpost_id_t v27;
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v10 = (id)qword_1EF568E50;
  v11 = os_signpost_id_generate(v10);

  if (qword_1EF568E88 == -1)
  {
    v12 = (id)qword_1EF568E50;
    if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v12 = (id)qword_1EF568E50;
    if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CHContextLookupQuery_withPath", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v13 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHContextLookupQuery_withPath\", buf, 2u);
  }

  objc_msgSend_recognitionSession(self, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1BE6CE290;
  v25[3] = &unk_1E77F3708;
  v26 = v8;
  v27 = v11;
  v20 = v8;
  objc_msgSend_contextLookupResultsWithSelectionPath_completion_shouldCancel_(v19, v21, (uint64_t)a3, (uint64_t)v25, (uint64_t)v9, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)contextLookupResultsWithSelectedStrokes:(id)a3 completion:(id)a4 shouldCancel:(id)a5
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
  id v21;
  id v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  os_signpost_id_t v30;
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
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CHContextLookupQuery_withSelectedStrokes", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v14 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHContextLookupQuery_withSelectedStrokes\", buf, 2u);
  }

  objc_msgSend_recognitionSession(self, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1BE6CE758;
  v27[3] = &unk_1E77F3730;
  v29 = v9;
  v30 = v12;
  v28 = v8;
  v21 = v9;
  v22 = v8;
  objc_msgSend_contextLookupResultsWithSelectedStrokes_completion_shouldCancel_(v20, v23, (uint64_t)v22, (uint64_t)v27, (uint64_t)v10, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)structuredContextLookupResultsWithSelectionPath:(CGPath *)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[5];
  id v26;
  os_signpost_id_t v27;
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v10 = (id)qword_1EF568E50;
  v11 = os_signpost_id_generate(v10);

  if (qword_1EF568E88 == -1)
  {
    v12 = (id)qword_1EF568E50;
    if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v12 = (id)qword_1EF568E50;
    if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CHContextLookupQuery_withPath", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v13 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHContextLookupQuery_withPath\", buf, 2u);
  }

  objc_msgSend_recognitionSession(self, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1BE6CEC20;
  v25[3] = &unk_1E77F3730;
  v26 = v8;
  v27 = v11;
  v25[4] = self;
  v20 = v8;
  objc_msgSend_contextLookupResultsWithSelectionPath_completion_shouldCancel_(v19, v21, (uint64_t)a3, (uint64_t)v25, (uint64_t)v9, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)structuredContextLookupResultsWithSelectedStrokes:(id)a3 completion:(id)a4 shouldCancel:(id)a5
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
  id v21;
  id v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  _QWORD v27[5];
  id v28;
  id v29;
  os_signpost_id_t v30;
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
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CHContextLookupQuery_withSelectedStrokes", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v14 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHContextLookupQuery_withSelectedStrokes\", buf, 2u);
  }

  objc_msgSend_recognitionSession(self, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1BE6CF128;
  v27[3] = &unk_1E77F3758;
  v27[4] = self;
  v28 = v8;
  v29 = v9;
  v30 = v12;
  v21 = v9;
  v22 = v8;
  objc_msgSend_contextLookupResultsWithSelectedStrokes_completion_shouldCancel_(v20, v23, (uint64_t)v22, (uint64_t)v27, (uint64_t)v10, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)debugName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Context Lookup Query %p"), v2, v3, v4, self);
}

@end
