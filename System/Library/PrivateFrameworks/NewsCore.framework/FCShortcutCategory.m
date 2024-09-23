@implementation FCShortcutCategory

- (FCShortcutCategory)initWithType:(unint64_t)a3 identifier:(id)a4 dateAdded:(id)a5 status:(unint64_t)a6
{
  id v10;
  id v11;
  FCShortcutCategory *v12;
  uint64_t v13;
  NSString *identifier;
  objc_super v16;

  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)FCShortcutCategory;
  v12 = -[FCShortcutCategory init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    v12->_type = a3;
    objc_storeStrong((id *)&v12->_dateAdded, a5);
    v12->_status = a6;
  }

  return v12;
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
  void *v10;

  if (qword_1ED0F7D88 != -1)
    dispatch_once(&qword_1ED0F7D88, &__block_literal_global_10);
  v3 = objc_alloc(MEMORY[0x1E0C95070]);
  -[FCShortcutCategory identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithRecordName:zoneID:", v4, _MergedGlobals_140);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("ShortcutCategory"), v5);
  NSStringFromShortcutCategoryType((__CFString *)-[FCShortcutCategory type](self, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("type"));

  -[FCShortcutCategory identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("categoryID"));

  -[FCShortcutCategory dateAdded](self, "dateAdded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("dateAdded"));

  NSStringFromShortcutCategoryStatus((__CFString *)-[FCShortcutCategory status](self, "status"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("status"));

  return (CKRecord *)v6;
}

void __32__FCShortcutCategory_asCKRecord__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C95098]);
  v1 = objc_msgSend(v0, "initWithZoneName:ownerName:", CFSTR("ShortcutCategories"), *MEMORY[0x1E0C94730]);
  v2 = (void *)_MergedGlobals_140;
  _MergedGlobals_140 = v1;

}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

- (unint64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)initWithIdentifier:(void *)a3 dictionaryRepresentation:
{
  id v3;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = a1;
  if (a1)
  {
    v5 = a3;
    v6 = a2;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = FCShortcutCategoryTypeFromString(v7);

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dateAdded"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = FCShortcutCategoryStatusFromString(v10);
    v12 = (void *)objc_msgSend(v3, "initWithType:identifier:dateAdded:status:", v8, v6, v9, v11);

    v3 = v12;
  }
  return v3;
}

@end
