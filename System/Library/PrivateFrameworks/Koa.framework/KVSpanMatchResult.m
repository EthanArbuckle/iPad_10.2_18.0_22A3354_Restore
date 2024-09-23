@implementation KVSpanMatchResult

- (KVSpanMatchResult)initWithSpanMatchResult:(id)a3
{
  id v5;
  KVSpanMatchResult *v6;
  void **p_isa;
  void **p_spanMatchResult;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  KVSpanMatchResult *v17;
  void *v18;
  void *v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  objc_super v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)KVSpanMatchResult;
  v6 = -[KVSpanMatchResult init](&v27, sel_init);
  p_isa = (void **)&v6->super.isa;
  if (v6
    && (p_spanMatchResult = (void **)&v6->_spanMatchResult,
        objc_storeStrong((id *)&v6->_spanMatchResult, a3),
        objc_msgSend_entityInfo(p_isa[1], v9, v10, v11),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend_entityType(v12, v13, v14, v15),
        v12,
        v16 != 1))
  {
    v18 = (void *)qword_1ED114588;
    if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
    {
      v20 = *p_spanMatchResult;
      v21 = v18;
      objc_msgSend_entityInfo(v20, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *p_spanMatchResult;
      *(_DWORD *)buf = 136315650;
      v29 = "-[KVSpanMatchResult initWithSpanMatchResult:]";
      v30 = 2112;
      v31 = v25;
      v32 = 2112;
      v33 = v26;
      _os_log_error_impl(&dword_1B70E7000, v21, OS_LOG_TYPE_ERROR, "%s Unsupported entityInfo: %@ for result: %@", buf, 0x20u);

    }
    v17 = 0;
  }
  else
  {
    v17 = p_isa;
  }

  return v17;
}

- (id)itemInfo
{
  KVItemInfo *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;

  v3 = [KVItemInfo alloc];
  objc_msgSend_entityInfo(self->_spanMatchResult, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_initWithCascadeEntityInfo_(v3, v8, (uint64_t)v7, v9);

  return v10;
}

- (id)spanInfo
{
  KVSpanInfo *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;

  v3 = [KVSpanInfo alloc];
  objc_msgSend_spanInfo(self->_spanMatchResult, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_initWithSpanInfo_(v3, v8, (uint64_t)v7, v9);

  return v10;
}

- (id)spanValue
{
  return (id)((uint64_t (*)(SEMSpanMatchResult *, char *))MEMORY[0x1E0DE7D20])(self->_spanMatchResult, sel_spanValue);
}

- (id)fieldMatches
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  KVFieldMatch *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend_fieldMatches(self->_spanMatchResult, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_count(v7, v8, v9, v10);
  v14 = (void *)objc_msgSend_initWithCapacity_(v3, v12, v11, v13);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend_fieldMatches(self->_spanMatchResult, v15, v16, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v33, (uint64_t)v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v18);
        v24 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v23);
        v25 = [KVFieldMatch alloc];
        v30 = (void *)objc_msgSend_initWithFieldMatch_(v25, v26, v24, v27);
        if (v30)
          objc_msgSend_addObject_(v14, v28, (uint64_t)v30, v29);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v31, (uint64_t)&v33, (uint64_t)v37, 16);
    }
    while (v21);
  }

  return v14;
}

- (float)score
{
  uint64_t v2;
  uint64_t v3;
  float result;

  objc_msgSend_score(self->_spanMatchResult, a2, v2, v3);
  return result;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_description(self->_spanMatchResult, a2, v2, v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  _QWORD *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v5 = (void *)objc_opt_class();
  v8 = (_QWORD *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v11 = objc_msgSend_copyWithZone_(self->_spanMatchResult, v9, (uint64_t)a3, v10);
  v12 = (void *)v8[1];
  v8[1] = v11;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  KVSpanMatchResult *v4;
  KVSpanMatchResult *v5;
  const char *v6;
  uint64_t v7;
  char isEqualToSpanMatchResult;

  v4 = (KVSpanMatchResult *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToSpanMatchResult = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToSpanMatchResult = objc_msgSend_isEqualToSpanMatchResult_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    isEqualToSpanMatchResult = 0;
  }

  return isEqualToSpanMatchResult;
}

- (BOOL)isEqualToSpanMatchResult:(id)a3
{
  uint64_t v3;
  SEMSpanMatchResult *spanMatchResult;
  void *v5;
  const char *v6;
  uint64_t v7;

  spanMatchResult = self->_spanMatchResult;
  objc_msgSend_spanMatchResult(a3, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(spanMatchResult) = objc_msgSend_isEqual_(spanMatchResult, v6, (uint64_t)v5, v7);

  return (char)spanMatchResult;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_hash(self->_spanMatchResult, a2, v2, v3);
}

- (SEMSpanMatchResult)spanMatchResult
{
  return self->_spanMatchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spanMatchResult, 0);
}

@end
