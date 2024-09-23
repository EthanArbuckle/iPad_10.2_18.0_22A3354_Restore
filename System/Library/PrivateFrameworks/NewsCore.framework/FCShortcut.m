@implementation FCShortcut

- (id)initWithIdentifier:(void *)a3 dictionaryRepresentation:
{
  id v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = a1;
  if (a1)
  {
    v5 = a3;
    v6 = a2;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dateAdded"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("order"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = FCShortcutTypeFromString(v9);
    v11 = (void *)objc_msgSend(v3, "initWithIdentifier:dateAdded:order:shortcutType:", v6, v7, v8, v10);

    v3 = v11;
  }
  return v3;
}

- (FCShortcut)initWithIdentifier:(id)a3 dateAdded:(id)a4 order:(id)a5 shortcutType:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  FCShortcut *v13;
  FCShortcut *v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSNumber *order;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("shortcut list entry must have an item identifier"));
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCShortcut initWithIdentifier:dateAdded:order:shortcutType:]";
    v24 = 2080;
    v25 = "FCShortcut.m";
    v26 = 1024;
    v27 = 20;
    v28 = 2114;
    v29 = v20;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v21.receiver = self;
  v21.super_class = (Class)FCShortcut;
  v13 = -[FCShortcut init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    if (v10)
    {
      v15 = objc_msgSend(v10, "copy");
      identifier = v14->_identifier;
      v14->_identifier = (NSString *)v15;

      objc_storeStrong((id *)&v14->_dateAdded, a4);
      v17 = objc_msgSend(v12, "copy");
      order = v14->_order;
      v14->_order = (NSNumber *)v17;

      v14->_shortcutType = a6;
      v14->_deprecated = a6 != 0;
    }
    else
    {

      v14 = 0;
    }
  }

  return v14;
}

- (CKRecord)asCKRecord
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (qword_1ED0F8290 != -1)
    dispatch_once(&qword_1ED0F8290, &__block_literal_global_73);
  v3 = objc_alloc(MEMORY[0x1E0C95070]);
  -[FCShortcut identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithRecordName:zoneID:", v4, _MergedGlobals_166);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("Shortcut"), v5);
  -[FCShortcut dateAdded](self, "dateAdded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("dateAdded"));

  -[FCShortcut order](self, "order");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("order"));

  NSStringFromShortcutType((__CFString *)-[FCShortcut shortcutType](self, "shortcutType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("type"));

  return (CKRecord *)v6;
}

void __24__FCShortcut_asCKRecord__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C95098]);
  v1 = objc_msgSend(v0, "initWithZoneName:ownerName:", CFSTR("Shortcuts"), *MEMORY[0x1E0C94730]);
  v2 = (void *)_MergedGlobals_166;
  _MergedGlobals_166 = v1;

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

- (NSNumber)order
{
  return self->_order;
}

- (unint64_t)shortcutType
{
  return self->_shortcutType;
}

- (BOOL)isDeprecated
{
  return self->_deprecated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_order, 0);
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
