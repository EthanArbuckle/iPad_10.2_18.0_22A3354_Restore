@implementation ICServerChangeToken

- (CKServerChangeToken)ckServerChangeToken
{
  CKServerChangeToken *ckServerChangeToken;
  void *v4;
  CKServerChangeToken *v5;
  CKServerChangeToken *v6;

  ckServerChangeToken = self->_ckServerChangeToken;
  if (!ckServerChangeToken)
  {
    -[ICServerChangeToken ckServerChangeTokenData](self, "ckServerChangeTokenData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (CKServerChangeToken *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95100]), "initWithData:", v4);
      v6 = self->_ckServerChangeToken;
      self->_ckServerChangeToken = v5;

    }
    ckServerChangeToken = self->_ckServerChangeToken;
  }
  return ckServerChangeToken;
}

- (void)setCkServerChangeToken:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ICServerChangeToken ckServerChangeToken](self, "ckServerChangeToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v8);

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_ckServerChangeToken, a3);
    objc_msgSend(v8, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICServerChangeToken setCkServerChangeTokenData:](self, "setCkServerChangeTokenData:", v7);

  }
}

+ (id)addServerChangeTokenForAccount:(id)a3 ckServerChangeToken:(id)a4 zoneID:(id)a5 databaseScope:(int64_t)a6 context:(id)a7
{
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v11 = a5;
  v12 = (void *)MEMORY[0x1E0C97B20];
  v13 = a4;
  v14 = a3;
  objc_msgSend(v12, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("ICServerChangeToken"), a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccount:", v14);
  objc_msgSend(v14, "addServerChangeTokensObject:", v15);

  objc_msgSend(v15, "setCkServerChangeToken:", v13);
  objc_msgSend(v11, "zoneName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setZoneName:", v16);

  objc_msgSend(v11, "ownerName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0C94730]);

  if ((v14 & 1) == 0)
  {
    objc_msgSend(v11, "ownerName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setOwnerName:", v18);

  }
  objc_msgSend(v15, "setDatabaseScope:", a6);

  return v15;
}

+ (id)serverChangeTokenForAccount:(id)a3 zoneID:(id)a4 databaseScope:(int64_t)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v11
    && (objc_msgSend(v11, "ownerName"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0C94730]),
        v13,
        (v14 & 1) == 0))
  {
    objc_msgSend(v11, "ownerName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("account == %@"), v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v16;
  v17 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v11, "zoneName");
  v27 = v10;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "predicateWithFormat:", CFSTR("zoneName == %@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v19;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ownerName == %@"), v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v20;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("databaseScope == %ld"), a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serverChangeTokensMatchingPredicate:inContext:", v23, v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)serverChangeTokensMatchingPredicate:(id)a3 inContext:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;

  v5 = (void *)MEMORY[0x1E0C97B48];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "fetchRequestWithEntityName:", CFSTR("ICServerChangeToken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v7);

  v13 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v8, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v13;
  if (v10)
  {
    v11 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[ICServerChangeToken serverChangeTokensMatchingPredicate:inContext:].cold.1((uint64_t)v10, v11);

  }
  return v9;
}

- (void)setDatabaseScope:(int64_t)a3
{
  void *v5;

  -[ICServerChangeToken willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("databaseScope"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICServerChangeToken setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("databaseScope"));

  -[ICServerChangeToken didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("databaseScope"));
}

- (int64_t)databaseScope
{
  void *v3;
  int64_t v4;

  -[ICServerChangeToken willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("databaseScope"));
  -[ICServerChangeToken primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("databaseScope"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  -[ICServerChangeToken didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("databaseScope"));
  return v4;
}

- (void)didTurnIntoFault
{
  CKRecordZoneID *zoneID;
  CKServerChangeToken *ckServerChangeToken;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICServerChangeToken;
  -[ICServerChangeToken didTurnIntoFault](&v5, sel_didTurnIntoFault);
  zoneID = self->_zoneID;
  self->_zoneID = 0;

  ckServerChangeToken = self->_ckServerChangeToken;
  self->_ckServerChangeToken = 0;

}

- (CKRecordZoneID)zoneID
{
  CKRecordZoneID *zoneID;
  void *v4;
  id v5;
  CKRecordZoneID *v6;
  CKRecordZoneID *v7;

  zoneID = self->_zoneID;
  if (!zoneID)
  {
    -[ICServerChangeToken zoneName](self, "zoneName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[ICServerChangeToken ownerName](self, "ownerName");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (!v5)
        v5 = (id)*MEMORY[0x1E0C94730];
      v6 = (CKRecordZoneID *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", v4, v5);
      v7 = self->_zoneID;
      self->_zoneID = v6;

    }
    zoneID = self->_zoneID;
  }
  return zoneID;
}

- (id)ic_loggingValues
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  ICServerChangeToken *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICServerChangeToken managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__ICServerChangeToken_ic_loggingValues__block_invoke;
  v8[3] = &unk_1E76C73B0;
  v5 = v3;
  v9 = v5;
  v10 = self;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = v5;
  return v6;
}

void __39__ICServerChangeToken_ic_loggingValues__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 40), "zoneName");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = (const __CFString *)v2;
  else
    v4 = &stru_1E76DB108;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, CFSTR("zoneName"));

  objc_msgSend(*(id *)(a1 + 40), "ckServerChangeToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_loggingDescription");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = &stru_1E76DB108;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, CFSTR("ckServerChangeToken"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "databaseScope"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, CFSTR("databaseScope"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckServerChangeToken, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

+ (void)serverChangeTokensMatchingPredicate:(uint64_t)a1 inContext:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BD918000, a2, OS_LOG_TYPE_ERROR, "Error fetching server change tokens: %@", (uint8_t *)&v2, 0xCu);
}

@end
