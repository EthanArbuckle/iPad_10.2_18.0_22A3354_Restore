@implementation EDSearchableIndexDiagnosticsSnapshot

- (EDSearchableIndexDiagnosticsSnapshot)initWithDate:(id)a3 indexableMessages:(id)a4 messagesIndexed:(id)a5 turboMode:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  EDSearchableIndexDiagnosticsSnapshot *v14;
  EDSearchableIndexDiagnosticsSnapshot *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)EDSearchableIndexDiagnosticsSnapshot;
  v14 = -[EDSearchableIndexDiagnosticsSnapshot init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_date, a3);
    objc_storeStrong((id *)&v15->_indexableMessages, a4);
    objc_storeStrong((id *)&v15->_messagesIndexed, a5);
    v15->_turboMode = a6;
  }

  return v15;
}

- (EDSearchableIndexDiagnosticsSnapshot)initWithDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  char isKindOfClass;
  EDSearchableIndexDiagnosticsSnapshot *v17;
  EDSearchableIndexDiagnosticsSnapshot *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v19 = self;
  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v21 = 0;
    v22 = 0;
    v20 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v24;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("Date"), v19)
          && (objc_msgSend(v3, "objectForKeyedSubscript:", v9),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              v11 = objc_opt_isKindOfClass(),
              v10,
              (v11 & 1) != 0))
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v9);
          v12 = v22;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("MessagesIndexed"))
               && (objc_msgSend(v3, "objectForKeyedSubscript:", v9),
                   v13 = (void *)objc_claimAutoreleasedReturnValue(),
                   objc_opt_class(),
                   v14 = objc_opt_isKindOfClass(),
                   v13,
                   (v14 & 1) != 0))
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v9);
          v12 = v21;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("IndexableMessages"))
               && (objc_msgSend(v3, "objectForKeyedSubscript:", v9),
                   v15 = (void *)objc_claimAutoreleasedReturnValue(),
                   objc_opt_class(),
                   isKindOfClass = objc_opt_isKindOfClass(),
                   v15,
                   (isKindOfClass & 1) != 0))
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v9);
          v12 = v20;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v9, "isEqualToString:", CFSTR("Turbo")))
            continue;
          objc_msgSend(v3, "objectForKeyedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v12, "BOOLValue");
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (!v5)
        goto LABEL_22;
    }
  }
  v21 = 0;
  v22 = 0;
  v20 = 0;
  v6 = 0;
LABEL_22:

  v17 = 0;
  if (v22 && v21 && v20)
  {
    v17 = -[EDSearchableIndexDiagnosticsSnapshot initWithDate:indexableMessages:messagesIndexed:turboMode:](v19, "initWithDate:indexableMessages:messagesIndexed:turboMode:", v22, v20, v21, v6 & 1);
    v19 = v17;
  }

  return v17;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[EDSearchableIndexDiagnosticsSnapshot date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Date"));

  -[EDSearchableIndexDiagnosticsSnapshot indexableMessages](self, "indexableMessages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("IndexableMessages"));

  -[EDSearchableIndexDiagnosticsSnapshot messagesIndexed](self, "messagesIndexed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("MessagesIndexed"));

  if (-[EDSearchableIndexDiagnosticsSnapshot turboMode](self, "turboMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[EDSearchableIndexDiagnosticsSnapshot turboMode](self, "turboMode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Turbo"));

  }
  return (NSDictionary *)v3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSNumber)indexableMessages
{
  return self->_indexableMessages;
}

- (void)setIndexableMessages:(id)a3
{
  objc_storeStrong((id *)&self->_indexableMessages, a3);
}

- (NSNumber)messagesIndexed
{
  return self->_messagesIndexed;
}

- (void)setMessagesIndexed:(id)a3
{
  objc_storeStrong((id *)&self->_messagesIndexed, a3);
}

- (BOOL)turboMode
{
  return self->_turboMode;
}

- (void)setTurboMode:(BOOL)a3
{
  self->_turboMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesIndexed, 0);
  objc_storeStrong((id *)&self->_indexableMessages, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
