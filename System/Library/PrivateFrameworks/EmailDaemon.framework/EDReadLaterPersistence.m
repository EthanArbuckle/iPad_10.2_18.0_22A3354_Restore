@implementation EDReadLaterPersistence

- (EDReadLaterPersistence)initWithDatabase:(id)a3 hookRegistry:(id)a4
{
  id v7;
  id v8;
  EDReadLaterPersistence *v9;
  EDReadLaterPersistence *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EDReadLaterPersistence;
  v9 = -[EDReadLaterPersistence init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    objc_storeStrong((id *)&v10->_hookRegistry, a4);
  }

  return v10;
}

- (void)scheduleRecurringActivity
{
  EDReadLaterCloudStorage *v3;
  EDReadLaterCloudStorage *v4;
  EDReadLaterCloudStorage *cloudStorage;
  id v6;

  v3 = [EDReadLaterCloudStorage alloc];
  -[EDReadLaterPersistence hookRegistry](self, "hookRegistry");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[EDReadLaterCloudStorage initWithHookRegistry:](v3, "initWithHookRegistry:");
  cloudStorage = self->_cloudStorage;
  self->_cloudStorage = v4;

}

- (void)persistReadLaterForMessage:(id)a3 date:(id)a4 displayDate:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDReadLaterPersistence.m"), 48, CFSTR("Expect a non-nil date"));

    if (v11)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (!v10)
  {
LABEL_3:
    objc_msgSend(v15, "dateReceived");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_4:
  objc_msgSend(v9, "ec_integerDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ec_integerDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDReadLaterPersistence _persistReadLater:date:displayDate:](self, "_persistReadLater:date:displayDate:", v15, v12, v13);

}

- (void)removeReadLaterForMessage:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "dateReceived");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ec_integerDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDReadLaterPersistence _persistReadLater:date:displayDate:](self, "_persistReadLater:date:displayDate:", v6, 0, v5);

}

- (void)_persistReadLater:(id)a3 date:(id)a4 displayDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  EDReadLaterPersistence *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[EDReadLaterPersistence database](self, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDReadLaterPersistence _persistReadLater:date:displayDate:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__EDReadLaterPersistence__persistReadLater_date_displayDate___block_invoke;
  v16[3] = &unk_1E949D860;
  v13 = v9;
  v17 = v13;
  v15 = v8;
  v18 = v15;
  v14 = v10;
  v19 = v14;
  v20 = self;
  objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, v16);

}

uint64_t __61__EDReadLaterPersistence__persistReadLater_date_displayDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v18;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:conflictResolution:", CFSTR("message_global_data"), 1);
  v5 = *(void **)(a1 + 32);
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("read_later_date"));
  if (!v5)

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "globalMessageID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "equalTo:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWhereClause:", v9);

  v18 = 0;
  v10 = objc_msgSend(v3, "executeUpdateStatement:error:", v4, &v18);
  v11 = v18;
  if ((v10 & 1) != 0)
  {
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E2C8]), "initWithDate:", *(_QWORD *)(a1 + 32));
    else
      v13 = 0;
    objc_msgSend(*(id *)(a1 + 40), "setReadLater:", v13);
    if (v12)

    v14 = *(void **)(a1 + 48);
    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 40), "displayDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToDate:", v15);

      if ((v16 & 1) == 0)
        objc_msgSend(*(id *)(a1 + 56), "_persistDisplayDate:message:connection:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v3);
    }
  }
  else
  {
    objc_msgSend(v3, "handleError:message:", v11, CFSTR("Updating read later date"));
  }

  return v10;
}

- (void)_persistDisplayDate:(id)a3 message:(id)a4 connection:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDReadLaterPersistence.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayDate"));

  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("messages"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("display_date"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("global_message_id"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10, "globalMessageID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "equalTo:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWhereClause:", v15);

  v18 = 0;
  LODWORD(v15) = objc_msgSend(v11, "executeUpdateStatement:error:", v12, &v18);
  v16 = v18;
  if ((_DWORD)v15)
    objc_msgSend(v10, "setDisplayDate:", v9);
  else
    objc_msgSend(v11, "handleError:message:", v16, CFSTR("Resetting display date after updating read later"));

}

- (id)cloudStorageReadLaterDateForMessage:(id)a3 displayDate:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[EDReadLaterPersistence cloudStorage](self, "cloudStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cloudStorageReadLaterDateForMessage:displayDate:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (EDReadLaterCloudStorage)cloudStorage
{
  return self->_cloudStorage;
}

- (void)setCloudStorage:(id)a3
{
  objc_storeStrong((id *)&self->_cloudStorage, a3);
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (void)setHookRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_hookRegistry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_cloudStorage, 0);
}

@end
