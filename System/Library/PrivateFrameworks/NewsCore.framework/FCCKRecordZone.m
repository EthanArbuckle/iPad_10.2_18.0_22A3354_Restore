@implementation FCCKRecordZone

- (id)initWithDatabase:(void *)a3 delegate:(void *)a4 recordZoneID:
{
  id v8;
  id v9;
  id v10;
  id *v11;
  void *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (!a1)
    goto LABEL_12;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "database != nil");
    *(_DWORD *)buf = 136315906;
    v17 = "-[FCCKRecordZone initWithDatabase:delegate:recordZoneID:]";
    v18 = 2080;
    v19 = "FCCKRecordZone.m";
    v20 = 1024;
    v21 = 42;
    v22 = 2114;
    v23 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v10)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "recordZoneID != nil");
        *(_DWORD *)buf = 136315906;
        v17 = "-[FCCKRecordZone initWithDatabase:delegate:recordZoneID:]";
        v18 = 2080;
        v19 = "FCCKRecordZone.m";
        v20 = 1024;
        v21 = 43;
        v22 = 2114;
        v23 = v14;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }
  }
  else if (!v10)
  {
    goto LABEL_5;
  }
  v15.receiver = a1;
  v15.super_class = (Class)FCCKRecordZone;
  v11 = (id *)objc_msgSendSuper2(&v15, sel_init);
  a1 = v11;
  if (v11)
  {
    if (v8 && v10)
    {
      objc_storeStrong(v11 + 3, a2);
      objc_storeWeak(a1 + 4, v9);
      objc_storeStrong(a1 + 2, a4);
    }
    else
    {

      a1 = 0;
    }
  }
LABEL_12:

  return a1;
}

uint64_t __46__FCCKRecordZone_performActionWithRecordZone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    *(_BYTE *)(v4 + 8) = 1;
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    if (v6)
      v7 = *(_QWORD *)(v6 + 16);
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
    v5 = *(_QWORD *)(a1 + 40);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, v7, 0);
}

- (void)fetchChangesWithChangeToken:(void *)a3 desiredKeys:(char)a4 fetchAllChanges:(uint64_t)a5 qualityOfService:(void *)a6 completion:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  id WeakRetained;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];
  void (*v22)(uint64_t, uint64_t);
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  char v29;
  _BYTE buf[24];
  __int128 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a6;
  v14 = v13;
  if (a1)
  {
    if (v13)
    {
      v15 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v22 = __102__FCCKRecordZone_fetchChangesWithChangeToken_desiredKeys_fetchAllChanges_qualityOfService_completion___block_invoke;
      v23 = &unk_1E463C458;
      v24 = a1;
      v25 = v11;
      v29 = a4;
      v26 = v12;
      v28 = a5;
      v27 = v14;
      v16 = v21;
      v17 = v16;
      if ((*(_BYTE *)(a1 + 8) & 1) != 0)
      {
        ((void (*)(_QWORD *, _QWORD, _QWORD))v22)(v16, *(_QWORD *)(a1 + 16), 0);
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
        v19 = *(_QWORD *)(a1 + 16);
        *(_QWORD *)buf = v15;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __46__FCCKRecordZone_performActionWithRecordZone___block_invoke;
        *(_QWORD *)&v31 = &unk_1E463C408;
        *((_QWORD *)&v31 + 1) = a1;
        v32 = v17;
        objc_msgSend(WeakRetained, "ensureRecordZoneExistsWithID:completionHandler:", v19, buf);

      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completion != nil");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[FCCKRecordZone fetchChangesWithChangeToken:desiredKeys:fetchAllChanges:qualityOfService:completion:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "FCCKRecordZone.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v31) = 96;
      WORD2(v31) = 2114;
      *(_QWORD *)((char *)&v31 + 6) = v20;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
  }

}

void __102__FCCKRecordZone_fetchChangesWithChangeToken_desiredKeys_fetchAllChanges_qualityOfService_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      v4 = *(void **)(v3 + 24);
    else
      v4 = 0;
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(unsigned __int8 *)(a1 + 72);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __102__FCCKRecordZone_fetchChangesWithChangeToken_desiredKeys_fetchAllChanges_qualityOfService_completion___block_invoke_2;
    v9[3] = &unk_1E463C430;
    v8 = *(_QWORD *)(a1 + 64);
    v10 = *(id *)(a1 + 56);
    objc_msgSend(v4, "fetchChangesForRecordZoneID:changeToken:desiredKeys:fetchAllChanges:qualityOfService:completionHandler:", a2, v5, v6, v7, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __102__FCCKRecordZone_fetchChangesWithChangeToken_desiredKeys_fetchAllChanges_qualityOfService_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)description
{
  void *v3;
  CKRecordZoneID *recordZoneID;
  void *v5;
  void *v6;

  +[FCDescription descriptionWithObject:](FCDescription, "descriptionWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    recordZoneID = self->_recordZoneID;
  else
    recordZoneID = 0;
  -[CKRecordZoneID zoneName](recordZoneID, "zoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:value:", CFSTR("recordZoneName"), v5);

  objc_msgSend(v3, "descriptionString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_recordZoneID, 0);
}

@end
