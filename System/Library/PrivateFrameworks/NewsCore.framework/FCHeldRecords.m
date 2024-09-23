@implementation FCHeldRecords

- (id)interestTokenForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FCHeldRecords interestTokensByID](self, "interestTokensByID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestTokensByID, 0);
  objc_storeStrong((id *)&self->_recordsByID, 0);
}

+ (id)heldRecordsByMerging:(id)a3 with:(id)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  FCHeldRecords *v22;

  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "recordsByID");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = (void *)MEMORY[0x1E0C9AA70];
  if (v8)
    v11 = v8;
  else
    v11 = MEMORY[0x1E0C9AA70];
  objc_msgSend(v6, "recordsByID");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = v12;
  else
    v14 = (uint64_t)v10;
  objc_msgSend(v5, "fc_dictionaryByAddingEntriesFromDictionary:toDictionary:", v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v7, "interestTokensByID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    v18 = v17;
  else
    v18 = v10;
  objc_msgSend(v6, "interestTokensByID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    v20 = v19;
  else
    v20 = v10;
  objc_msgSend(v16, "fc_dictionaryByAddingEntriesFromDictionary:toDictionary:", v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[FCHeldRecords initWithRecordsByID:interestTokensByID:]([FCHeldRecords alloc], "initWithRecordsByID:interestTokensByID:", v15, v21);
  return v22;
}

- (id)recordWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FCHeldRecords recordsByID](self, "recordsByID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)enumerateRecordsAndInterestTokensInOrder:(id)a3 withBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  if (v7)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
          -[FCHeldRecords recordsByID](self, "recordsByID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          -[FCHeldRecords interestTokensByID](self, "interestTokensByID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            v17 = v16 == 0;
          else
            v17 = 1;
          if (!v17)
            v7[2](v7, v14, v16);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }
  }

}

- (NSDictionary)recordsByID
{
  return self->_recordsByID;
}

- (NSDictionary)interestTokensByID
{
  return self->_interestTokensByID;
}

- (NSArray)allRecords
{
  void *v2;
  void *v3;

  -[FCHeldRecords recordsByID](self, "recordsByID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

void __51__FCHeldRecords_transformRecordsInOrder_withBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);
    v2 = v3;
  }

}

- (FCHeldRecords)initWithRecordsByID:(id)a3 interestTokensByID:(id)a4
{
  id v7;
  id v8;
  FCHeldRecords *v9;
  FCHeldRecords *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCHeldRecords;
  v9 = -[FCHeldRecords init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordsByID, a3);
    objc_storeStrong((id *)&v10->_interestTokensByID, a4);
  }

  return v10;
}

- (NSArray)allRecordIDs
{
  void *v2;
  void *v3;

  -[FCHeldRecords recordsByID](self, "recordsByID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)transformRecordsWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[FCHeldRecords recordsByID](self, "recordsByID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCHeldRecords transformRecordsInOrder:withBlock:](self, "transformRecordsInOrder:withBlock:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)transformRecordsInOrder:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__FCHeldRecords_transformRecordsInOrder_withBlock___block_invoke;
    v10[3] = &unk_1E4644E70;
    v12 = v7;
    v11 = v8;
    -[FCHeldRecords enumerateRecordsAndInterestTokensInOrder:withBlock:](self, "enumerateRecordsAndInterestTokensInOrder:withBlock:", v6, v10);

  }
  return v8;
}

- (void)enumerateRecordsAndInterestTokensWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCHeldRecords recordsByID](self, "recordsByID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCHeldRecords enumerateRecordsAndInterestTokensInOrder:withBlock:](self, "enumerateRecordsAndInterestTokensInOrder:withBlock:", v5, v4);

}

void __47__FCHeldRecords_transformRecordsByIDWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "interestTokensByID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v9, v10);

}

void __40__FCHeldRecords_heldRecordsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)transformRecordsByIDWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[FCHeldRecords recordsByID](self, "recordsByID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__FCHeldRecords_transformRecordsByIDWithBlock___block_invoke;
    v8[3] = &unk_1E4644E98;
    v8[4] = self;
    v10 = v4;
    v9 = v5;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
  return v5;
}

- (id)heldRecordsPassingTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "test");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCHeldRecords heldRecordsPassingTest:]";
    v17 = 2080;
    v18 = "FCHeldRecords.m";
    v19 = 1024;
    v20 = 146;
    v21 = 2114;
    v22 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)objc_opt_new();
  -[FCHeldRecords recordsByID](self, "recordsByID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__FCHeldRecords_heldRecordsPassingTest___block_invoke;
  v12[3] = &unk_1E4644EC0;
  v13 = v5;
  v14 = v4;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);

  -[FCHeldRecords heldRecordsForIDs:](self, "heldRecordsForIDs:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)heldRecordsForIDs:(id)a3
{
  id v4;
  FCHeldRecords *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FCHeldRecords *v10;
  void *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "recordIDs");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCHeldRecords heldRecordsForIDs:]";
    v15 = 2080;
    v16 = "FCHeldRecords.m";
    v17 = 1024;
    v18 = 163;
    v19 = 2114;
    v20 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = [FCHeldRecords alloc];
  -[FCHeldRecords recordsByID](self, "recordsByID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fc_subdictionaryForKeys:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCHeldRecords interestTokensByID](self, "interestTokensByID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fc_subdictionaryForKeys:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FCHeldRecords initWithRecordsByID:interestTokensByID:](v5, "initWithRecordsByID:interestTokensByID:", v7, v9);

  return v10;
}

- (id)onlyRecord
{
  void *v2;
  void *v3;
  void *v4;

  -[FCHeldRecords recordsByID](self, "recordsByID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_onlyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[FCHeldRecords recordsByID](self, "recordsByID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSString)onlyRecordID
{
  void *v2;
  void *v3;
  void *v4;

  -[FCHeldRecords recordsByID](self, "recordsByID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_onlyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (FCInterestToken)onlyInterestToken
{
  void *v2;
  void *v3;
  void *v4;

  -[FCHeldRecords interestTokensByID](self, "interestTokensByID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_onlyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCInterestToken *)v4;
}

@end
