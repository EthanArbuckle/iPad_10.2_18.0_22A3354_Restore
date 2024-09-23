@implementation KVFieldMatch

- (KVFieldMatch)initWithFieldMatch:(id)a3
{
  id v5;
  KVFieldMatch *v6;
  void **p_isa;
  void **p_fieldMatch;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  KVFieldMatch *v17;
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
  v27.super_class = (Class)KVFieldMatch;
  v6 = -[KVFieldMatch init](&v27, sel_init);
  p_isa = (void **)&v6->super.isa;
  if (v6
    && (p_fieldMatch = (void **)&v6->_fieldMatch,
        objc_storeStrong((id *)&v6->_fieldMatch, a3),
        objc_msgSend_entityFieldInfo(p_isa[1], v9, v10, v11),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend_entityType(v12, v13, v14, v15),
        v12,
        v16 != 1))
  {
    v18 = (void *)qword_1ED114588;
    if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
    {
      v20 = *p_fieldMatch;
      v21 = v18;
      objc_msgSend_entityFieldInfo(v20, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *p_fieldMatch;
      *(_DWORD *)buf = 136315650;
      v29 = "-[KVFieldMatch initWithFieldMatch:]";
      v30 = 2112;
      v31 = v25;
      v32 = 2112;
      v33 = v26;
      _os_log_error_impl(&dword_1B70E7000, v21, OS_LOG_TYPE_ERROR, "%s Unsupported entityFieldInfo: %@ for match: %@", buf, 0x20u);

    }
    v17 = 0;
  }
  else
  {
    v17 = p_isa;
  }

  return v17;
}

- (id)fieldSpanInfo
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
  objc_msgSend_fieldSpanInfo(self->_fieldMatch, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_initWithSpanInfo_(v3, v8, (uint64_t)v7, v9);

  return v10;
}

- (id)fieldSpanValue
{
  return (id)((uint64_t (*)(SEMFieldMatch *, char *))MEMORY[0x1E0DE7D20])(self->_fieldMatch, sel_fieldSpanValue);
}

- (int64_t)fieldType
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  int64_t v8;
  id v9;
  NSObject *v10;
  SEMFieldMatch *fieldMatch;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  SEMFieldMatch *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend_entityFieldInfo(self->_fieldMatch, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v8 = objc_msgSend_toKVFieldType_(v5, v6, (uint64_t)&v13, v7);
  v9 = v13;

  if (!v8)
  {
    v10 = qword_1ED114588;
    if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
    {
      fieldMatch = self->_fieldMatch;
      *(_DWORD *)buf = 136315650;
      v15 = "-[KVFieldMatch fieldType]";
      v16 = 2112;
      v17 = fieldMatch;
      v18 = 2112;
      v19 = v9;
      _os_log_error_impl(&dword_1B70E7000, v10, OS_LOG_TYPE_ERROR, "%s Failed to resolve fieldType from match: %@ error: %@", buf, 0x20u);
    }
  }

  return v8;
}

- (BOOL)isValueMatch
{
  return 0;
}

- (BOOL)isLabelMatch
{
  return 0;
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
  v11 = objc_msgSend_copyWithZone_(self->_fieldMatch, v9, (uint64_t)a3, v10);
  v12 = (void *)v8[1];
  v8[1] = v11;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  KVFieldMatch *v4;
  KVFieldMatch *v5;
  const char *v6;
  uint64_t v7;
  char isEqualToFieldMatch;

  v4 = (KVFieldMatch *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToFieldMatch = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToFieldMatch = objc_msgSend_isEqualToFieldMatch_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    isEqualToFieldMatch = 0;
  }

  return isEqualToFieldMatch;
}

- (BOOL)isEqualToFieldMatch:(id)a3
{
  uint64_t v3;
  SEMFieldMatch *fieldMatch;
  void *v5;
  const char *v6;
  uint64_t v7;

  fieldMatch = self->_fieldMatch;
  objc_msgSend_fieldMatch(a3, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(fieldMatch) = objc_msgSend_isEqual_(fieldMatch, v6, (uint64_t)v5, v7);

  return (char)fieldMatch;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_description(self->_fieldMatch, a2, v2, v3);
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_hash(self->_fieldMatch, a2, v2, v3);
}

- (SEMFieldMatch)fieldMatch
{
  return self->_fieldMatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldMatch, 0);
}

@end
