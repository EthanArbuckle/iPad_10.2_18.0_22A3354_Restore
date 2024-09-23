@implementation CHMarkNoWhiteSpaceColumnsChangeableStep

- (id)process:(id)a3 options:(id)a4
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint8_t v49[16];

  v4 = a3;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v5 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v49 = 0;
    _os_log_impl(&dword_1BE607000, v5, OS_LOG_TYPE_DEBUG, "CHMarkNoWhiteSpaceColumnsChangeableStep is running", v49, 2u);
  }

  objc_msgSend_result(v4, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_tokenColumnCount(v11, v12, v13, v14, v15, v16);
  v23 = 0;
  v24 = v17 & ~(v17 >> 63);
  v25 = v17 - 1;
  while (v24 != v23)
  {
    objc_msgSend_transcriptionPaths(v11, v18, v19, v20, v21, v22);
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject((void *)v26, v27, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tokensInTranscriptionPath_atColumnIndex_(v11, v33, (uint64_t)v32, v25, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v36, v37, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v26) = objc_msgSend_properties(v42, v43, v44, v45, v46, v47);
    --v25;
    ++v23;
    if ((v26 & 0x20) != 0)
      goto LABEL_10;
  }
  v23 = v24;
LABEL_10:
  objc_msgSend_setChangeableTokenColumnCount_(v11, v18, v23, v20, v21, v22);

  return v4;
}

@end
