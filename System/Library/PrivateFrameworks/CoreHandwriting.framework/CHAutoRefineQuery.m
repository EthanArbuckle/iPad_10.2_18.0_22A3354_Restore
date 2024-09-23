@implementation CHAutoRefineQuery

- (CHAutoRefineQuery)initWithRecognitionSession:(id)a3
{
  CHAutoRefineQuery *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CHAutoRefineQuery *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CHAutoRefineQuery;
  v3 = -[CHQuery initWithRecognitionSession:](&v11, sel_initWithRecognitionSession_, a3);
  v9 = v3;
  if (v3)
    objc_msgSend_setPreferredUpdatesInterval_(v3, v4, v5, v6, v7, v8, 0.25);
  return v9;
}

- (void)q_updateQueryResult
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CHAutoRefineQueryItem *autoRefinedItem;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  CHAutoRefineQueryItem *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CHAutoRefineQueryItem *v32;
  CHAutoRefineQueryItem *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  _BOOL4 v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  objc_super v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  _BOOL4 v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E50;
  v4 = os_signpost_id_generate(v3);

  if (qword_1EF568E88 == -1)
  {
    v5 = (id)qword_1EF568E50;
    v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v5 = (id)qword_1EF568E50;
    v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CHAutoRefineQuery", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v7 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v7, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHAutoRefineQuery\", buf, 2u);
  }

  v55.receiver = self;
  v55.super_class = (Class)CHAutoRefineQuery;
  -[CHQuery q_updateQueryResult](&v55, sel_q_updateQueryResult);
  objc_msgSend_q_sessionResult(self, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  autoRefinedItem = self->_autoRefinedItem;
  self->_autoRefinedItem = 0;

  objc_msgSend_autoRefineResult(v13, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = [CHAutoRefineQueryItem alloc];
    objc_msgSend_autoRefineResult(v13, v22, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (CHAutoRefineQueryItem *)objc_msgSend_initWithAutoRefineResult_(v21, v28, (uint64_t)v27, v29, v30, v31);
    v33 = self->_autoRefinedItem;
    self->_autoRefinedItem = v32;

  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v34 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_debugName(self, v35, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeProviderVersion(v13, v41, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = self->_autoRefinedItem != 0;
    *(_DWORD *)buf = 138412802;
    v57 = v40;
    v58 = 2112;
    v59 = v46;
    v60 = 1024;
    v61 = v47;
    _os_log_impl(&dword_1BE607000, v34, OS_LOG_TYPE_DEBUG, "AutoRefine: %@: beginning update for result version %@, hasAutoRefineResult ? %d", buf, 0x1Cu);

  }
  objc_msgSend_q_queryResultDidChange(self, v48, v49, v50, v51, v52);
  if (qword_1EF568E88 == -1)
  {
    v53 = (id)qword_1EF568E50;
    if (v6 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_21;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v53 = (id)qword_1EF568E50;
    if (v6 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_21;
  }
  if (os_signpost_enabled(v53))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v53, OS_SIGNPOST_INTERVAL_END, v4, "CHAutoRefineQuery", ", buf, 2u);
  }
LABEL_21:

  if (qword_1EF568E88 != -1)
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v54 = (id)qword_1EF568E18[0];
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    goto LABEL_23;
  }
  v54 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
LABEL_23:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v54, OS_LOG_TYPE_DEFAULT, "END \"CHAutoRefineQuery\", buf, 2u);
  }
LABEL_24:

}

- (id)debugName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("AutoRefine Query %p"), v2, v3, v4, self);
}

- (CHAutoRefineQueryItem)autoRefinedItem
{
  return self->_autoRefinedItem;
}

- (void)setAutoRefinedItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoRefinedItem, 0);
}

- (BOOL)wantsAutoRefineUpdates
{
  return 1;
}

@end
