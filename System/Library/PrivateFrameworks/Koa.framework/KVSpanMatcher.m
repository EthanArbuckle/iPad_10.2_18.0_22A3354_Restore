@implementation KVSpanMatcher

- (KVSpanMatcher)initWithSpanMatcher:(id)a3
{
  id v5;
  KVSpanMatcher *v6;
  KVSpanMatcher *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KVSpanMatcher;
  v6 = -[KVSpanMatcher init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_spanMatcher, a3);

  return v7;
}

- (BOOL)setItems:(id)a3 error:(id *)a4
{
  return MEMORY[0x1E0DE7D20](self->_spanMatcher, sel_setItems_error_, a3, a4);
}

- (id)indexLocaleWithError:(id *)a3
{
  return (id)((uint64_t (*)(SEMSpanMatcher *, char *, id *))MEMORY[0x1E0DE7D20])(self->_spanMatcher, sel_indexLocale_, a3);
}

- (id)indexLocaleWithUserId:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0DE7D20](self->_spanMatcher, sel_indexLocaleWithUserId_error_, a3, a4);
}

- (id)matchSpans:(id)a3 error:(id *)a4
{
  SEMSpanMatcher *spanMatcher;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  spanMatcher = self->_spanMatcher;
  objc_msgSend_query(a3, a2, (uint64_t)a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_matchSpans_error_(spanMatcher, v8, (uint64_t)v7, (uint64_t)a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__convertResults_(self, v10, (uint64_t)v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)matchSpans:(id)a3 userId:(id)a4 error:(id *)a5
{
  SEMSpanMatcher *spanMatcher;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;

  spanMatcher = self->_spanMatcher;
  v9 = a4;
  objc_msgSend_query(a3, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_matchSpans_userId_error_(spanMatcher, v14, (uint64_t)v13, (uint64_t)v9, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__convertResults_(self, v16, (uint64_t)v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_convertResults:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  KVSpanMatchResult *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *matched;
  const char *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v8 = objc_msgSend_count(v3, v5, v6, v7);
  v11 = (void *)objc_msgSend_initWithCapacity_(v4, v9, v8, v10);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = v3;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v12);
        v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v17);
        v19 = [KVSpanMatchResult alloc];
        matched = (void *)objc_msgSend_initWithSpanMatchResult_(v19, v20, v18, v21, (_QWORD)v27);
        if (matched)
          objc_msgSend_addObject_(v11, v22, (uint64_t)matched, v23);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v25, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v15);
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spanMatcher, 0);
}

+ (id)indexMatcher
{
  id v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;

  v2 = objc_alloc((Class)objc_opt_class());
  v3 = sub_1B70F793C();
  objc_msgSend_indexMatcher(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_initWithSpanMatcher_(v2, v8, (uint64_t)v7, v9);

  return v10;
}

+ (id)itemMatcher:(id)a3 locale:(id)a4
{
  id v5;
  id v6;
  void *v7;
  objc_class *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE buf[24];
  void *v29;
  uint64_t *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v7 = (void *)qword_1EF151F30;
  v27 = qword_1EF151F30;
  if (!qword_1EF151F30)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_1B70F7B1C;
    v29 = &unk_1E6B7B448;
    v30 = &v24;
    sub_1B70F7B1C((uint64_t)buf);
    v7 = (void *)v25[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v24, 8);
  v9 = [v8 alloc];
  v12 = (void *)objc_msgSend_initWithLocale_(v9, v10, (uint64_t)v6, v11);
  v13 = sub_1B70F793C();
  v23 = 0;
  objc_msgSend_itemMatcher_tokenizer_error_(v13, v14, (uint64_t)v5, (uint64_t)v12, &v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v23;
  if (!v15)
  {
    v17 = qword_1ED114588;
    if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[KVSpanMatcher itemMatcher:locale:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      _os_log_error_impl(&dword_1B70E7000, v17, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }
  }
  v18 = objc_alloc((Class)objc_opt_class());
  v21 = (void *)objc_msgSend_initWithSpanMatcher_(v18, v19, (uint64_t)v15, v20);

  return v21;
}

+ (id)itemMatcher:(id)a3 tokenizer:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  void *v19;

  v7 = a4;
  v8 = a3;
  v9 = sub_1B70F793C();
  objc_msgSend_tokenizer(v7, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_itemMatcher_tokenizer_error_(v9, v14, (uint64_t)v8, (uint64_t)v13, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc((Class)objc_opt_class());
  v19 = (void *)objc_msgSend_initWithSpanMatcher_(v16, v17, (uint64_t)v15, v18);

  return v19;
}

@end
