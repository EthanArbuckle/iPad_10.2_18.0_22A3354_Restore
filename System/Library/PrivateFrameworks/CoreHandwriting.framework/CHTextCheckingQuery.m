@implementation CHTextCheckingQuery

- (CHTextCheckingQuery)initWithRecognitionSession:(id)a3
{
  id v4;
  CHTextCheckingQuery *v5;
  NSArray *v6;
  NSArray *foundItems;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHTextCheckingQuery;
  v5 = -[CHQuery initWithRecognitionSession:](&v9, sel_initWithRecognitionSession_, v4);
  if (v5)
  {
    v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    foundItems = v5->_foundItems;
    v5->_foundItems = v6;

    if (qword_1EF568DB0 != -1)
      dispatch_once(&qword_1EF568DB0, &unk_1E77F1930);
  }

  return v5;
}

- (void)q_updateQueryResult
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  NSObject *v30;
  unint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSArray *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *p_super;
  NSArray *v50;
  NSArray *foundItems;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  NSObject *v58;
  objc_super v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[136];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  if ((CHHasPersonalizedSynthesisModelReady((uint64_t)self, a2, v2, v3, v4, v5) & 1) != 0)
  {
    if (!self)
      goto LABEL_12;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    objc_msgSend_recognitionSession(self, v7, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_preferredLocales(v12, v13, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v60, (uint64_t)buf, 16, v20);
    if (!v21)
      goto LABEL_11;
    v22 = *(_QWORD *)v61;
LABEL_5:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v61 != v22)
        objc_enumerationMutation(v18);
      if ((CHHasPersonalizedSynthesisSupportForLocale(*(void **)(*((_QWORD *)&v60 + 1) + 8 * v23)) & 1) != 0)
        break;
      if (v21 == ++v23)
      {
        v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v24, (uint64_t)&v60, (uint64_t)buf, 16, v25);
        if (v21)
          goto LABEL_5;
LABEL_11:

LABEL_12:
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v26 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v27 = "CHTextCheckingQuery not running because this device does not have any supported locales enabled.";
          goto LABEL_20;
        }
        goto LABEL_46;
      }
    }

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v28 = (id)qword_1EF568E50;
    v29 = os_signpost_id_generate(v28);

    if (qword_1EF568E88 == -1)
    {
      v30 = (id)qword_1EF568E50;
      v31 = v29 - 1;
      if (v29 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_27;
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v30 = (id)qword_1EF568E50;
      v31 = v29 - 1;
      if (v29 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_27;
    }
    if (os_signpost_enabled(v30))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE607000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v29, "CHTextCheckingQuery_update", ", buf, 2u);
    }
LABEL_27:

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v32 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v32, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTextCheckingQuery_update\", buf, 2u);
    }

    v59.receiver = self;
    v59.super_class = (Class)CHTextCheckingQuery;
    -[CHQuery q_updateQueryResult](&v59, sel_q_updateQueryResult);
    objc_msgSend_q_sessionResult(self, v33, v34, v35, v36, v37);
    v26 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_completeness(v26, v38, v39, v40, v41, v42) == 2)
    {
      sub_1BE7CDD98((void **)&self->super.super.isa, v26);
      v43 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
      p_super = &v43->super;
      if (self->_foundItems != v43)
      {
        v50 = (NSArray *)objc_msgSend_copy(v43, v44, v45, v46, v47, v48);
        foundItems = self->_foundItems;
        self->_foundItems = v50;

        objc_msgSend_q_queryResultDidChange(self, v52, v53, v54, v55, v56);
      }

LABEL_38:
      if (qword_1EF568E88 == -1)
      {
        v57 = (id)qword_1EF568E50;
        if (v31 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_42;
      }
      else
      {
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v57 = (id)qword_1EF568E50;
        if (v31 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_42;
      }
      if (os_signpost_enabled(v57))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BE607000, v57, OS_SIGNPOST_INTERVAL_END, v29, "CHTextCheckingQuery_update", ", buf, 2u);
      }
LABEL_42:

      if (qword_1EF568E88 == -1)
      {
        v58 = (id)qword_1EF568E18[0];
        if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
LABEL_45:

          goto LABEL_46;
        }
      }
      else
      {
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v58 = (id)qword_1EF568E18[0];
        if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          goto LABEL_45;
      }
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v58, OS_LOG_TYPE_DEFAULT, "END \"CHTextCheckingQuery_update\", buf, 2u);
      goto LABEL_45;
    }
    if (qword_1EF568E88 == -1)
    {
      p_super = (id)qword_1EF568E18[0];
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        goto LABEL_38;
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      p_super = (id)qword_1EF568E18[0];
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        goto LABEL_38;
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, p_super, OS_LOG_TYPE_DEFAULT, "CHTextCheckingQuery not running because principal lines are not ready.", buf, 2u);
    goto LABEL_38;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v26 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v27 = "CHTextCheckingQuery not running because this device does not support personalized synthesis.";
LABEL_20:
    _os_log_impl(&dword_1BE607000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
  }
LABEL_46:

}

- (NSArray)foundItems
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1BE7CFE1C;
  v15 = sub_1BE7CFE2C;
  v16 = 0;
  objc_msgSend_processingQueue(self, a2, v2, v3, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BE7D152C;
  v10[3] = &unk_1E77F23B0;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v7, v10);

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v8;
}

- (BOOL)q_resultWantedForCompleteness:(int64_t)a3
{
  return a3 == 2;
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

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Text Checking Query %p"), v2, v3, v4, self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundItems, 0);
}

@end
