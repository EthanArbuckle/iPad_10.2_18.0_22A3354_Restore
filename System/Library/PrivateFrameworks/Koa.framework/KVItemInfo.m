@implementation KVItemInfo

- (KVItemInfo)initWithCascadeEntityInfo:(id)a3
{
  id v5;
  KVItemInfo *v6;
  KVItemInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KVItemInfo;
  v6 = -[KVItemInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_entityInfo, a3);

  return v7;
}

- (id)item
{
  uint64_t v2;
  SEMCascadeEntityInfo *entityInfo;
  void *v5;
  id v6;
  NSObject *v7;
  SEMCascadeEntityInfo *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  SEMCascadeEntityInfo *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  entityInfo = self->_entityInfo;
  v10 = 0;
  objc_msgSend_toKVItem_(entityInfo, a2, (uint64_t)&v10, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (!v5)
  {
    v7 = qword_1ED114588;
    if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
    {
      v9 = self->_entityInfo;
      *(_DWORD *)buf = 136315650;
      v12 = "-[KVItemInfo item]";
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v6;
      _os_log_error_impl(&dword_1B70E7000, v7, OS_LOG_TYPE_ERROR, "%s Failed to resolve KVItem from entityInfo: %@ error: %@", buf, 0x20u);
    }
  }

  return v5;
}

- (id)itemId
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_item(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_itemId(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)itemType
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;

  objc_msgSend_item(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_itemType(v4, v5, v6, v7);

  return v8;
}

- (id)originAppId
{
  return (id)((uint64_t (*)(SEMCascadeEntityInfo *, char *))MEMORY[0x1E0DE7D20])(self->_entityInfo, sel_sourceIdentifier);
}

- (id)priorInfo
{
  return 0;
}

- (id)unindexedFields
{
  return 0;
}

- (id)unindexedFieldsWithType:(int64_t)a3
{
  return 0;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_description(self->_entityInfo, a2, v2, v3);
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
  v11 = objc_msgSend_copyWithZone_(self->_entityInfo, v9, (uint64_t)a3, v10);
  v12 = (void *)v8[1];
  v8[1] = v11;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  KVItemInfo *v4;
  KVItemInfo *v5;
  const char *v6;
  uint64_t v7;
  char isEqualToItemInfo;

  v4 = (KVItemInfo *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToItemInfo = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToItemInfo = objc_msgSend_isEqualToItemInfo_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    isEqualToItemInfo = 0;
  }

  return isEqualToItemInfo;
}

- (BOOL)isEqualToItemInfo:(id)a3
{
  uint64_t v3;
  SEMCascadeEntityInfo *entityInfo;
  void *v5;
  const char *v6;
  uint64_t v7;

  entityInfo = self->_entityInfo;
  objc_msgSend_entityInfo(a3, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(entityInfo) = objc_msgSend_isEqual_(entityInfo, v6, (uint64_t)v5, v7);

  return (char)entityInfo;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_hash(self->_entityInfo, a2, v2, v3);
}

- (SEMCascadeEntityInfo)entityInfo
{
  return self->_entityInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityInfo, 0);
}

@end
