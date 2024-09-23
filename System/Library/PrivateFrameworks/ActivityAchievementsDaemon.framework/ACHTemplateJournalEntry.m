@implementation ACHTemplateJournalEntry

- (ACHTemplateJournalEntry)initWithTemplate:(id)a3 provenance:(int64_t)a4 useLegacySyncIdentity:(BOOL)a5 action:(int64_t)a6
{
  id v11;
  ACHTemplateJournalEntry *v12;
  ACHTemplateJournalEntry *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ACHTemplateJournalEntry;
  v12 = -[ACHTemplateJournalEntry init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_action = a6;
    objc_storeStrong((id *)&v12->_template, a3);
    v13->_provenance = a4;
    v13->_useLegacySyncIdentity = a5;
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)ACHTemplateJournalEntry;
  -[ACHTemplateJournalEntry description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(template %@ provenance %lld action %ld)"), v4, self->_template, self->_provenance, self->_action);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v8 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __52__ACHTemplateJournalEntry_applyEntries_withProfile___block_invoke;
  v16[3] = &unk_24D13C458;
  v17 = v5;
  v18 = v6;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __52__ACHTemplateJournalEntry_applyEntries_withProfile___block_invoke_2;
  v13[3] = &unk_24D13AA18;
  v9 = v18;
  v14 = v9;
  v10 = v17;
  v15 = v10;
  LOBYTE(v8) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:](ACHTemplateEntity, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v7, &v19, v16, v13);
  v11 = v19;

  if ((v8 & 1) == 0)
  {
    ACHLogDatabase();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[ACHTemplateJournalEntry applyEntries:withProfile:].cold.1((uint64_t)v10);

  }
}

uint64_t __52__ACHTemplateJournalEntry_applyEntries_withProfile___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v20;
  id v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v21 = a2;
  objc_msgSend(v21, "databaseForEntityClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "action", v20);
        if (v9)
        {
          if (v9 != 1)
            goto LABEL_14;
          objc_msgSend(v8, "template");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v10;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = +[ACHTemplateEntity _removeTemplates:profile:error:](ACHTemplateEntity, "_removeTemplates:profile:error:", v11, *(_QWORD *)(a1 + 40), a3);

          if (!v12)
          {
LABEL_14:
            v18 = 0;
            goto LABEL_15;
          }
        }
        else
        {
          objc_msgSend(v8, "template");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          ACHTemplateSyncIdentityFromTemplate(v13, objc_msgSend(v8, "useLegacySyncIdentity"), *(void **)(a1 + 40), v21);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "template");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v8, "provenance");
          objc_msgSend(v14, "entity");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v16) = +[ACHTemplateEntity _insertTemplate:provenance:syncIdentity:database:error:](ACHTemplateEntity, "_insertTemplate:provenance:syncIdentity:database:error:", v15, v16, objc_msgSend(v17, "persistentID"), v20, a3);

          if (!(_DWORD)v16)
            goto LABEL_14;
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v5)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_15:

  return v18;
}

uint64_t __52__ACHTemplateJournalEntry_applyEntries_withProfile___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "addJournalEntries:error:", *(_QWORD *)(a1 + 40), a3);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACHTemplateJournalEntry)initWithCoder:(id)a3
{
  id v4;
  ACHTemplateJournalEntry *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  ACHTemplate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACHTemplateJournalEntry;
  v5 = -[HDJournalEntry initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_action = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("action"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("template"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01810]), "initWithData:", v6);
      if (v7)
      {
        v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE01850]), "initWithCodable:", v7);
        v9 = v5->_template;
        v5->_template = (ACHTemplate *)v8;

      }
    }
    v5->_provenance = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("provenance"));
    v5->_useLegacySyncIdentity = 1;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UseLegacySyncIdentity")))
      v5->_useLegacySyncIdentity = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UseLegacySyncIdentity"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", self->_action, CFSTR("action"));
  -[ACHTemplateJournalEntry template](self, "template");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ACHCodableFromTemplate();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("template"));
  objc_msgSend(v7, "encodeInt64:forKey:", self->_provenance, CFSTR("provenance"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_useLegacySyncIdentity, CFSTR("UseLegacySyncIdentity"));

}

- (int64_t)action
{
  return self->_action;
}

- (ACHTemplate)template
{
  return self->_template;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void)setProvenance:(int64_t)a3
{
  self->_provenance = a3;
}

- (BOOL)useLegacySyncIdentity
{
  return self->_useLegacySyncIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_template, 0);
}

+ (void)applyEntries:(uint64_t)a1 withProfile:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v1, v2, "Error applying journal entries: %@: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

@end
