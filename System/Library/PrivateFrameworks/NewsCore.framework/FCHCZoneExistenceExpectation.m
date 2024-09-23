@implementation FCHCZoneExistenceExpectation

- (void)validate
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__FCHCZoneExistenceExpectation_validate__block_invoke;
  v6[3] = &unk_1E463BB88;
  v6[4] = self;
  v6[5] = &v13;
  v6[6] = &v7;
  FCWaitUntilBlockIsInvoked(v6);
  if (-[FCHCZoneExistenceExpectation shouldExist](self, "shouldExist"))
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    if (!v14[5] || v8[5])
    {
      v3 = (void *)MEMORY[0x1E0C99DA0];
      -[FCHCZoneExistenceExpectation zoneID](self, "zoneID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "raise:format:", *MEMORY[0x1E0C99750], CFSTR("zone should exist in database: %@"), v4);
LABEL_8:

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    if (v14[5] || (objc_msgSend((id)v8[5], "fc_isMissingZoneError") & 1) == 0)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      -[FCHCZoneExistenceExpectation zoneID](self, "zoneID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "raise:format:", *MEMORY[0x1E0C99750], CFSTR("zone should not exist in database: %@"), v4);
      goto LABEL_8;
    }
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
}

void __40__FCHCZoneExistenceExpectation_validate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__FCHCZoneExistenceExpectation_validate__block_invoke_2;
  v7[3] = &unk_1E463BB60;
  v9 = *(_OWORD *)(a1 + 40);
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "fetchRecordZoneWithID:completionHandler:", v5, v7);

}

void __40__FCHCZoneExistenceExpectation_validate__block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  (*(void (**)(void))(a1[4] + 16))();
}

- (CKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)shouldExist
{
  return self->_shouldExist;
}

- (void)setShouldExist:(BOOL)a3
{
  self->_shouldExist = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
