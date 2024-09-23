@implementation FCCKDatabaseEncryptionMiddleware

- (id)initWithEncryptionSchema:(void *)a3 recordNameCipher:
{
  id v6;
  id v7;
  id *v8;
  objc_super v10;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)FCCKDatabaseEncryptionMiddleware;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      if (!v7)
        -[FCCKPrivateDatabaseSchema enumerateZoneSchemasWithBlock:]((uint64_t)v6, &__block_literal_global_87);
    }
  }

  return a1;
}

void __78__FCCKDatabaseEncryptionMiddleware_initWithEncryptionSchema_recordNameCipher___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a2 && *(_BYTE *)(a2 + 8) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("a record name cipher is required for a schema with record name encryption"));
    v3 = 136315906;
    v4 = "-[FCCKDatabaseEncryptionMiddleware initWithEncryptionSchema:recordNameCipher:]_block_invoke";
    v5 = 2080;
    v6 = "FCCKDatabaseEncryptionMiddleware.m";
    v7 = 1024;
    v8 = 60;
    v9 = 2114;
    v10 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v3, 0x26u);

  }
}

- (int64_t)database:(id)a3 willEnqueueOperation:(id)a4 error:(id *)a5
{
  uint64_t *v7;
  id v8;
  void *v9;
  int64_t v10;

  v7 = (uint64_t *)a3;
  v8 = a4;
  v9 = v8;
  if (!v7
    || !*((_BYTE *)v7 + 10)
    || v7[5] > 0
    || (v7[1] & 1) == 0
    || (-[CKDatabaseOperation fc_canBypassEncryptionRequirement](v8) & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fc_encryptionRequiredError");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 1;
  }

  return v10;
}

- (id)clientToServerRecordZoneID:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  return -[FCCKDatabaseEncryptionMiddleware _serverZoneIDFromClientZoneID:database:error:]((uint64_t)self, a3, (uint64_t)a4, a5);
}

- (id)_serverZoneIDFromClientZoneID:(uint64_t)a3 database:(_QWORD *)a4 error:
{
  id v7;
  void *v8;
  id v9;
  FCCKRecordZoneIDMapping *v10;
  FCCKRecordZoneIDMapping *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;

  v7 = a2;
  v8 = v7;
  if (a1)
  {
    v9 = v7;
    v10 = (FCCKRecordZoneIDMapping *)*(id *)(a1 + 8);
    v11 = v10;
    if (a3)
      v12 = *(_QWORD *)(a3 + 40);
    else
      v12 = 0;
    -[FCCKPrivateDatabaseSchema mappingFromRecordZoneID:toVersion:](v10, v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "hasChanges"))
    {
      v14 = objc_alloc(MEMORY[0x1E0C95098]);
      objc_msgSend(v13, "toZoneSchema");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v15)
        v17 = *(void **)(v15 + 16);
      else
        v17 = 0;
      v18 = v17;
      objc_msgSend(v9, "ownerName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v14, "initWithZoneName:ownerName:", v18, v19);

      v9 = (id)v20;
    }
    if (a4)
      *a4 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)serverToClientRecordZoneID:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  return -[FCCKDatabaseEncryptionMiddleware _clientZoneIDFromServerZoneID:error:]((uint64_t)self, a3, a5);
}

- (id)_clientZoneIDFromServerZoneID:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = v5;
    -[FCCKPrivateDatabaseSchema mappingFromRecordZoneID:toVersion:](*(FCCKRecordZoneIDMapping **)(a1 + 8), v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasChanges"))
    {
      v9 = objc_alloc(MEMORY[0x1E0C95098]);
      objc_msgSend(v8, "toZoneSchema");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
        v12 = *(void **)(v10 + 16);
      else
        v12 = 0;
      v13 = v12;
      objc_msgSend(v7, "ownerName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v9, "initWithZoneName:ownerName:", v13, v14);

      v7 = (id)v15;
    }
    if (a3)
      *a3 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)clientToServerRecordID:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  _QWORD *v8;
  id v9;
  void *v10;
  FCCKPrivateDatabaseSchema *encryptionSchema;
  FCCKPrivateDatabaseSchema *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v19;

  v8 = a4;
  v9 = a3;
  -[FCCKDatabaseEncryptionMiddleware _encryptionKeyForClientRecordID:inDatabase:]((uint64_t)self, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    encryptionSchema = self->_encryptionSchema;
  else
    encryptionSchema = 0;
  v12 = encryptionSchema;
  if (v8)
    v13 = v8[5];
  else
    v13 = 0;

  -[FCCKPrivateDatabaseSchema mappingFromRecordID:toVersion:]((uint64_t)v12, v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  -[FCCKDatabaseEncryptionMiddleware _encryptedRecordIDWithOriginalRecordID:withEncryptionKey:mapping:error:]((uint64_t)self, v9, v10, v14, &v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v19;
  if (v15)
    v17 = v15;
  if (a5)
    *a5 = objc_retainAutorelease(v16);

  return v15;
}

- (id)_encryptionKeyForClientRecordID:(void *)a3 inDatabase:
{
  _QWORD *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  ptrdiff_t v13;
  id Property;
  id v15;

  v5 = a3;
  if (!a1)
  {
    v15 = 0;
    goto LABEL_12;
  }
  v6 = *(id *)(a1 + 8);
  v7 = a2;
  if (v5)
    v8 = v5[5];
  else
    v8 = 0;
  -[FCCKPrivateDatabaseSchema mappingFromRecordID:toVersion:]((uint64_t)v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "toZoneSchema");
  v10 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v10;
  if (!v10 || !*(_BYTE *)(v10 + 10))
  {
    if (v5)
    {
      v13 = 48;
      goto LABEL_10;
    }
LABEL_15:
    Property = 0;
    goto LABEL_11;
  }
  if (!v5)
    goto LABEL_15;
  v13 = 56;
LABEL_10:
  Property = objc_getProperty(v5, v11, v13, 1);
LABEL_11:
  v15 = Property;

LABEL_12:
  return v15;
}

- (id)_encryptedRecordIDWithOriginalRecordID:(void *)a3 withEncryptionKey:(void *)a4 mapping:(_QWORD *)a5 error:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id *v16;
  void *v17;
  _BYTE *v18;
  void *v19;
  unsigned __int8 *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v46;
  id v47;
  id v48;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (!a1)
  {
    v44 = 0;
    goto LABEL_27;
  }
  objc_msgSend(v11, "toRecordName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fromRecordName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if ((v15 & 1) != 0)
  {
    objc_msgSend(v12, "toZoneSchema");
    v16 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "toRecordName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16 || (objc_msgSend(v16[4], "containsObject:", v17) & 1) == 0)
    {
      objc_msgSend(v12, "toZoneSchema");
      v18 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18 && v18[8])
      {
        objc_msgSend(v12, "fromZoneSchema");
        v20 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {

          goto LABEL_9;
        }
        v21 = v20[8];

        if (!v21)
        {
LABEL_9:
          v22 = *(id *)(a1 + 16);
          objc_msgSend(v9, "recordName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "encryptRecordName:withKey:", v23, v10);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            v47 = 0;
            v25 = objc_msgSend(MEMORY[0x1E0C95070], "isValidRecordName:outError:", v24, &v47);
            v26 = v47;
            v46 = 0;
            if (v25)
              v46 = v24;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "fc_encryptionErrorWithCode:descriptionFormat:", 2, CFSTR("Cipher failed to encrypt record name: %@"), 0);
            v26 = (id)objc_claimAutoreleasedReturnValue();
            v46 = 0;
          }

          goto LABEL_18;
        }
        goto LABEL_17;
      }

    }
LABEL_17:
    objc_msgSend(v9, "recordName");
    v46 = (id)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    goto LABEL_18;
  }
  v27 = (void *)MEMORY[0x1E0C95070];
  objc_msgSend(v12, "toRecordName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v29 = objc_msgSend(v27, "isValidRecordName:outError:", v28, &v48);
  v26 = v48;

  if (v29)
  {
    objc_msgSend(v12, "toRecordName");
    v46 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v12, "toRecordName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "fc_encryptionErrorWithCode:descriptionFormat:", 4, CFSTR("Record name is invalid: %@"), v31);
    v32 = objc_claimAutoreleasedReturnValue();

    v46 = 0;
    v26 = (id)v32;
  }
LABEL_18:
  v33 = objc_alloc(MEMORY[0x1E0C95098]);
  v34 = v12;
  objc_msgSend(v12, "toZoneSchema");
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v35;
  v37 = v10;
  if (v35)
    v38 = *(void **)(v35 + 16);
  else
    v38 = 0;
  v39 = v38;
  v40 = v9;
  objc_msgSend(v9, "zoneID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "ownerName");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v33, "initWithZoneName:ownerName:", v39, v42);

  if (a5)
    *a5 = objc_retainAutorelease(v26);
  v44 = 0;
  v10 = v37;
  if (v46)
  {
    v9 = v40;
    v12 = v34;
    if (v43)
      v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v46, v43);
  }
  else
  {
    v9 = v40;
    v12 = v34;
  }

LABEL_27:
  return v44;
}

- (id)serverToClientRecordID:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  FCCKPrivateDatabaseSchema *encryptionSchema;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v16;

  v8 = a3;
  -[FCCKDatabaseEncryptionMiddleware _encryptionKeyForServerRecordID:inDatabase:](self, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    encryptionSchema = self->_encryptionSchema;
  else
    encryptionSchema = 0;
  -[FCCKPrivateDatabaseSchema mappingFromRecordID:toVersion:]((uint64_t)encryptionSchema, v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  -[FCCKDatabaseEncryptionMiddleware _decryptedRecordIDWithOriginalRecordID:withEncryptionKey:mapping:error:]((uint64_t)self, v8, v9, v11, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v16;
  if (v12)
    v14 = v12;
  if (a5)
    *a5 = objc_retainAutorelease(v13);

  return v12;
}

- (_QWORD)_encryptionKeyForServerRecordID:(void *)a3 inDatabase:
{
  id v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  ptrdiff_t v9;
  id Property;

  v5 = a3;
  if (a1)
  {
    -[FCCKPrivateDatabaseSchema schemaForZoneContainingRecordID:](a1[1], a2);
    v6 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v6;
    if (v6 && *(_BYTE *)(v6 + 10))
    {
      if (v5)
      {
        v9 = 56;
LABEL_8:
        Property = objc_getProperty(v5, v7, v9, 1);
LABEL_9:
        a1 = (_QWORD **)Property;

        goto LABEL_10;
      }
    }
    else if (v5)
    {
      v9 = 48;
      goto LABEL_8;
    }
    Property = 0;
    goto LABEL_9;
  }
LABEL_10:

  return a1;
}

- (id)_decryptedRecordIDWithOriginalRecordID:(void *)a3 withEncryptionKey:(void *)a4 mapping:(_QWORD *)a5 error:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id *v16;
  void *v17;
  _BYTE *v18;
  void *v19;
  unsigned __int8 *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v46;
  id v47;
  id v48;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (!a1)
  {
    v44 = 0;
    goto LABEL_27;
  }
  objc_msgSend(v11, "toRecordName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fromRecordName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if ((v15 & 1) != 0)
  {
    objc_msgSend(v12, "fromZoneSchema");
    v16 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fromRecordName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16 || (objc_msgSend(v16[4], "containsObject:", v17) & 1) == 0)
    {
      objc_msgSend(v12, "fromZoneSchema");
      v18 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18 && v18[8])
      {
        objc_msgSend(v12, "toZoneSchema");
        v20 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {

          goto LABEL_9;
        }
        v21 = v20[8];

        if (!v21)
        {
LABEL_9:
          v22 = *(id *)(a1 + 16);
          objc_msgSend(v9, "recordName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "decryptRecordName:withKey:", v23, v10);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            v47 = 0;
            v25 = objc_msgSend(MEMORY[0x1E0C95070], "isValidRecordName:outError:", v24, &v47);
            v26 = v47;
            v46 = 0;
            if (v25)
              v46 = v24;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "fc_encryptionErrorWithCode:descriptionFormat:", 2, CFSTR("Cipher failed to decrypt record name: %@"), 0);
            v26 = (id)objc_claimAutoreleasedReturnValue();
            v46 = 0;
          }

          goto LABEL_18;
        }
        goto LABEL_17;
      }

    }
LABEL_17:
    objc_msgSend(v9, "recordName");
    v46 = (id)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    goto LABEL_18;
  }
  v27 = (void *)MEMORY[0x1E0C95070];
  objc_msgSend(v12, "toRecordName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v29 = objc_msgSend(v27, "isValidRecordName:outError:", v28, &v48);
  v26 = v48;

  if (v29)
  {
    objc_msgSend(v12, "toRecordName");
    v46 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v12, "toRecordName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "fc_encryptionErrorWithCode:descriptionFormat:", 4, CFSTR("Record name is invalid: %@"), v31);
    v32 = objc_claimAutoreleasedReturnValue();

    v46 = 0;
    v26 = (id)v32;
  }
LABEL_18:
  v33 = objc_alloc(MEMORY[0x1E0C95098]);
  v34 = v12;
  objc_msgSend(v12, "toZoneSchema");
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v35;
  v37 = v10;
  if (v35)
    v38 = *(void **)(v35 + 16);
  else
    v38 = 0;
  v39 = v38;
  v40 = v9;
  objc_msgSend(v9, "zoneID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "ownerName");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v33, "initWithZoneName:ownerName:", v39, v42);

  if (a5)
    *a5 = objc_retainAutorelease(v26);
  v44 = 0;
  v10 = v37;
  if (v46)
  {
    v9 = v40;
    v12 = v34;
    if (v43)
      v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v46, v43);
  }
  else
  {
    v9 = v40;
    v12 = v34;
  }

LABEL_27:
  return v44;
}

- (id)clientToServerRecord:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  id v8;
  _QWORD *v9;
  id v10;
  FCCKPrivateDatabaseSchema *encryptionSchema;
  FCCKRecordZoneIDMapping *v12;
  FCCKRecordZoneIDMapping *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  _BOOL4 v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  id v54;
  void *v55;
  void *v56;
  BOOL v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  int v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  FCCKDatabaseEncryptionMiddleware *v89;
  void *v90;
  id *v91;
  id v92;
  _QWORD *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  uint64_t v98;
  int v99;
  void *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE buf[12];
  __int16 v106;
  char *v107;
  __int16 v108;
  int v109;
  __int16 v110;
  void *v111;
  uint8_t v112[4];
  const char *v113;
  __int16 v114;
  char *v115;
  __int16 v116;
  int v117;
  __int16 v118;
  void *v119;
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v8;
  if (self)
    encryptionSchema = self->_encryptionSchema;
  else
    encryptionSchema = 0;
  v12 = encryptionSchema;
  v13 = v12;
  if (v9)
    v14 = v9[5];
  else
    v14 = 0;
  -[FCCKPrivateDatabaseSchema mappingFromRecord:toVersion:](v12, v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v15, "hasChanges"))
  {
    v72 = 0;
    v73 = v10;
    if (!a5)
      goto LABEL_61;
    goto LABEL_60;
  }
  v16 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v10, "recordID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKDatabaseEncryptionMiddleware _encryptionKeyForClientRecordID:inDatabase:]((uint64_t)self, v17, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v96 = v16;
  v19 = v18;
  v20 = v15;
  v95 = v20;
  if (self)
  {
    v89 = self;
    v90 = v15;
    v94 = v19;
    v21 = v20;
    if (!v20 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "mapping");
      *(_DWORD *)v112 = 136315906;
      v113 = "-[FCCKDatabaseEncryptionMiddleware _encryptRecord:withEncryptionKey:mapping:error:]";
      v114 = 2080;
      v115 = "FCCKDatabaseEncryptionMiddleware.m";
      v116 = 1024;
      v117 = 339;
      v118 = 2114;
      v119 = v88;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v112, 0x26u);

    }
    v91 = a5;
    v92 = v10;
    v93 = v9;
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v22 = v96;
    objc_msgSend(v96, "allKeys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
    if (v24)
    {
      v25 = v24;
      v26 = 0;
      v27 = *(_QWORD *)v102;
      v97 = v23;
      v98 = *(_QWORD *)v102;
      while (2)
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v102 != v27)
            objc_enumerationMutation(v23);
          v29 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
          objc_msgSend(v21, "toRecordSchema");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = -[FCCKRecordSchema isFieldKnown:]((uint64_t)v30, (uint64_t)v29);

          if (v31)
          {
            objc_msgSend(v21, "toRecordSchema");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = -[FCCKRecordSchema isFieldEncrypted:]((uint64_t)v32, (uint64_t)v29);

            if (v33)
            {
              v34 = v29;
              v35 = v22;
              v36 = v35;
              v100 = v26;
              if (v34)
              {
                objc_msgSend(v35, "valueStore");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "changedKeysSet");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v38, "containsObject:", v34);

                if (v39)
                {
                  objc_msgSend(v36, "valueStore");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "changedKeysSet");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "removeObject:", v34);

                  objc_msgSend(v36, "encryptedValueStore");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "changedKeysSet");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "addObject:", v34);

                }
                objc_msgSend(v36, "valueStore");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "values");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "objectForKey:", v34);
                v46 = (void *)objc_claimAutoreleasedReturnValue();

                if (v46)
                {
                  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94D18]), "initWithValue:", v46);
                  if (v47)
                  {
                    objc_msgSend(v36, "valueStore");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "values");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "removeObjectForKey:", v34);

                    objc_msgSend(v36, "encryptedValueStore");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "values");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v51, "setObject:forKey:", v47, v34);

                    v52 = 0;
                    v53 = 1;
                  }
                  else
                  {
                    v58 = (void *)MEMORY[0x1E0CB35C8];
                    objc_msgSend(v36, "recordType");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v58, "fc_encryptionErrorWithCode:descriptionFormat:", 3, CFSTR("CKRecord failed to serialize value {%@.%@, %@}"), v50, v34, v46);
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    v53 = 0;
                  }
                  v99 = v53;

                  v23 = v97;
                }
                else
                {
                  v52 = 0;
                  v99 = 1;
                }
                objc_msgSend(v36, "valueStore");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "originalValues");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "objectForKey:", v34);
                v61 = (void *)objc_claimAutoreleasedReturnValue();

                if (v61)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v36, "valueStore");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v62, "originalValues");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v63, "removeObjectForKey:", v34);

                    objc_msgSend(v36, "encryptedValueStore");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v64, "originalValues");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v65, "setObject:forKey:", v61, v34);
                  }
                  else
                  {
                    v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94D18]), "initWithValue:", v61);
                    if (v64)
                    {
                      objc_msgSend(v36, "valueStore");
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v66, "originalValues");
                      v67 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v67, "removeObjectForKey:", v34);

                      objc_msgSend(v36, "encryptedValueStore");
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v65, "originalValues");
                      v68 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v68, "setObject:forKey:", v64, v34);
                    }
                    else
                    {
                      v69 = (void *)MEMORY[0x1E0CB35C8];
                      objc_msgSend(v36, "recordType");
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v69, "fc_encryptionErrorWithCode:descriptionFormat:", 3, CFSTR("CKRecord failed to serialize original value {%@.%@, %@}"), v65, v34, v46);
                      v99 = 0;
                      v68 = v52;
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                    }

                  }
                  v22 = v96;
                  v23 = v97;
                }
                else
                {
                  v22 = v96;
                }

                v57 = v99 != 0;
                v21 = v95;
              }
              else
              {
                v52 = 0;
                v57 = 1;
              }
              v70 = objc_retainAutorelease(v52);

              v71 = v70;
              if (!v57)
              {
                v74 = 0;
                v10 = v92;
                v9 = v93;
                v15 = v90;
                a5 = v91;
                v19 = v94;
                goto LABEL_53;
              }
              v26 = v71;
              v27 = v98;
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            v54 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v22, "recordType");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = (void *)objc_msgSend(v54, "initWithFormat:", CFSTR("Client record field is missing from the schema: %@.%@"), v55, v29);
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = "-[FCCKDatabaseEncryptionMiddleware _encryptRecord:withEncryptionKey:mapping:error:]";
            v106 = 2080;
            v107 = "FCCKDatabaseEncryptionMiddleware.m";
            v108 = 1024;
            v109 = 359;
            v110 = 2114;
            v111 = v56;
            _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: UnknownRecordField) : %s %s:%d %{public}@", buf, 0x26u);

          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
        if (v25)
          continue;
        break;
      }
    }
    else
    {
      v26 = 0;
    }

    objc_msgSend(v22, "recordID");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "recordIDMapping");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v26;
    v77 = v26;
    v19 = v94;
    -[FCCKDatabaseEncryptionMiddleware _encryptedRecordIDWithOriginalRecordID:withEncryptionKey:mapping:error:]((uint64_t)v89, v75, v94, v76, buf);
    v78 = objc_claimAutoreleasedReturnValue();
    v71 = *(id *)buf;

    if (v78)
    {
      v97 = (void *)v78;
      objc_msgSend(v22, "setRecordID:", v78);
      objc_msgSend(v21, "toRecordSchema");
      v79 = objc_claimAutoreleasedReturnValue();
      v80 = (void *)v79;
      a5 = v91;
      v10 = v92;
      v15 = v90;
      if (v79)
        v81 = *(void **)(v79 + 16);
      else
        v81 = 0;
      v82 = v81;
      objc_msgSend(v22, "setRecordType:", v82);

      v74 = 1;
      v9 = v93;
    }
    else
    {
      v97 = 0;
      v74 = 1;
      v10 = v92;
      v9 = v93;
      v15 = v90;
      a5 = v91;
    }
LABEL_53:

    v83 = objc_retainAutorelease(v71);
  }
  else
  {
    v83 = 0;
    v74 = 0;
  }

  v72 = v83;
  v73 = v10;
  if (v74)
  {
    v73 = v96;

  }
  if (a5)
  {
    if (v72 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v85 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v10, "recordType");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = (void *)objc_msgSend(v85, "initWithFormat:", CFSTR("Failed to encrypt record of type %@ with error: %@"), v86, v72);
      *(_DWORD *)v112 = 136315906;
      v113 = "-[FCCKDatabaseEncryptionMiddleware clientToServerRecord:inDatabase:error:]";
      v114 = 2080;
      v115 = "FCCKDatabaseEncryptionMiddleware.m";
      v116 = 1024;
      v117 = 216;
      v118 = 2114;
      v119 = v87;
      _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: RecordEncryptionFailure) : %s %s:%d %{public}@", v112, 0x26u);

    }
LABEL_60:
    v72 = objc_retainAutorelease(v72);
    *a5 = v72;
  }
LABEL_61:

  return v73;
}

- (id)serverToClientRecord:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  FCCKPrivateDatabaseSchema *encryptionSchema;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  _BOOL4 v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  BOOL v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  objc_class *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  int v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  id v82;
  void *v83;
  void *v84;
  FCCKDatabaseEncryptionMiddleware *v85;
  void *v86;
  id *v87;
  id v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  int v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE buf[12];
  __int16 v103;
  char *v104;
  __int16 v105;
  int v106;
  __int16 v107;
  void *v108;
  uint8_t v109[4];
  const char *v110;
  __int16 v111;
  char *v112;
  __int16 v113;
  int v114;
  __int16 v115;
  void *v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v8;
  if (self)
    encryptionSchema = self->_encryptionSchema;
  else
    encryptionSchema = 0;
  -[FCCKPrivateDatabaseSchema mappingFromRecord:toVersion:]((FCCKRecordZoneIDMapping *)encryptionSchema, v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "hasChanges"))
  {
    v70 = 0;
    v71 = v10;
    if (!a5)
      goto LABEL_56;
    goto LABEL_55;
  }
  v13 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v10, "recordID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKDatabaseEncryptionMiddleware _encryptionKeyForServerRecordID:inDatabase:](self, v14, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v13;
  v17 = v15;
  v18 = v12;
  v91 = v16;
  v85 = self;
  if (self)
  {
    v89 = v9;
    v90 = v17;
    v86 = v12;
    v87 = a5;
    v88 = v10;
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    objc_msgSend(v16, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v98, v109, 16);
    v21 = v16;
    if (v20)
    {
      v22 = v20;
      v23 = 0;
      v24 = *(_QWORD *)v99;
      v92 = v19;
      v93 = *(_QWORD *)v99;
      while (2)
      {
        v25 = 0;
        v94 = v22;
        do
        {
          if (*(_QWORD *)v99 != v24)
            objc_enumerationMutation(v19);
          v26 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v25);
          objc_msgSend(v18, "fromRecordSchema");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[FCCKRecordSchema isFieldKnown:]((uint64_t)v27, (uint64_t)v26);

          if (v28)
          {
            objc_msgSend(v18, "fromRecordSchema");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = -[FCCKRecordSchema isFieldEncrypted:]((uint64_t)v29, (uint64_t)v26);

            if (v30)
            {
              v31 = v26;
              v32 = v21;
              v33 = v32;
              if (v31)
              {
                objc_msgSend(v32, "encryptedValueStore");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "changedKeysSet");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = objc_msgSend(v35, "containsObject:", v31);

                if (v36)
                {
                  objc_msgSend(v33, "encryptedValueStore");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "changedKeysSet");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "removeObject:", v31);

                  objc_msgSend(v33, "valueStore");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "changedKeysSet");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "addObject:", v31);

                }
                objc_msgSend(v33, "encryptedValueStore");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "values");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "objectForKey:", v31);
                v43 = (void *)objc_claimAutoreleasedReturnValue();

                v95 = v43;
                v96 = v23;
                if (v43)
                {
                  objc_msgSend(v43, "value");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v44)
                  {
                    objc_msgSend(v33, "encryptedValueStore");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "values");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "removeObjectForKey:", v31);

                    objc_msgSend(v33, "valueStore");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v47, "values");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "setObject:forKey:", v44, v31);

                    v49 = 0;
                    v97 = 1;
                  }
                  else
                  {
                    v54 = (void *)MEMORY[0x1E0CB35C8];
                    objc_msgSend(v33, "recordType");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "fc_encryptionErrorWithCode:descriptionFormat:", 3, CFSTR("CKRecord failed to deserialize value {%@.%@}"), v47, v31);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    v97 = 0;
                  }

                }
                else
                {
                  v49 = 0;
                  v97 = 1;
                }
                objc_msgSend(v33, "encryptedValueStore");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "originalValues");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "objectForKey:", v31);
                v57 = (void *)objc_claimAutoreleasedReturnValue();

                if (v57)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v33, "encryptedValueStore");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v58, "originalValues");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v59, "removeObjectForKey:", v31);

                    objc_msgSend(v33, "valueStore");
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "originalValues");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v61, "setObject:forKey:", v57, v31);
                  }
                  else
                  {
                    v62 = (objc_class *)objc_opt_class();
                    FCCheckedDynamicCast(v62, (uint64_t)v57);
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "value");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v61)
                    {
                      objc_msgSend(v33, "encryptedValueStore");
                      v63 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v63, "originalValues");
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v64, "removeObjectForKey:", v31);

                      objc_msgSend(v33, "valueStore");
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v65, "originalValues");
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v66, "setObject:forKey:", v61, v31);
                    }
                    else
                    {
                      v67 = (void *)MEMORY[0x1E0CB35C8];
                      objc_msgSend(v33, "recordType");
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v67, "fc_encryptionErrorWithCode:descriptionFormat:", 3, CFSTR("CKRecord failed to deserialize original value {%@.%@}"), v65, v31);
                      v97 = 0;
                      v66 = v49;
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                    }

                    v21 = v91;
                  }

                }
                v53 = v97 != 0;
                v19 = v92;
                v23 = v96;
              }
              else
              {
                v49 = 0;
                v53 = 1;
              }
              v68 = objc_retainAutorelease(v49);

              v69 = v68;
              if (!v53)
              {
                v72 = 0;
                v10 = v88;
                v9 = v89;
                v12 = v86;
                a5 = v87;
                v17 = v90;
                goto LABEL_48;
              }
              v23 = v69;
              v24 = v93;
              v22 = v94;
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            v50 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v21, "recordType");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = (void *)objc_msgSend(v50, "initWithFormat:", CFSTR("Server record field is missing from the schema: %@.%@"), v51, v26, v85);
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = "-[FCCKDatabaseEncryptionMiddleware _decryptRecord:withEncryptionKey:mapping:error:]";
            v103 = 2080;
            v104 = "FCCKDatabaseEncryptionMiddleware.m";
            v105 = 1024;
            v106 = 574;
            v107 = 2114;
            v108 = v52;
            _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: UnknownRecordField) : %s %s:%d %{public}@", buf, 0x26u);

          }
          ++v25;
        }
        while (v22 != v25);
        v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v98, v109, 16);
        if (v22)
          continue;
        break;
      }
    }
    else
    {
      v23 = 0;
    }

    objc_msgSend(v21, "recordID");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "recordIDMapping");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v23;
    v17 = v90;
    -[FCCKDatabaseEncryptionMiddleware _decryptedRecordIDWithOriginalRecordID:withEncryptionKey:mapping:error:]((uint64_t)v85, v73, v90, v74, buf);
    v75 = objc_claimAutoreleasedReturnValue();
    v69 = *(id *)buf;

    if (v75)
    {
      v92 = (void *)v75;
      objc_msgSend(v21, "setRecordID:", v75);
      objc_msgSend(v18, "toRecordSchema");
      v76 = objc_claimAutoreleasedReturnValue();
      v77 = (void *)v76;
      a5 = v87;
      v10 = v88;
      if (v76)
        v78 = *(void **)(v76 + 16);
      else
        v78 = 0;
      v79 = v78;
      objc_msgSend(v21, "setRecordType:", v79);

      v72 = 1;
      v9 = v89;
    }
    else
    {
      v92 = 0;
      v72 = 1;
      v10 = v88;
      v9 = v89;
      a5 = v87;
    }
    v12 = v86;
LABEL_48:

    v80 = objc_retainAutorelease(v69);
  }
  else
  {
    v80 = 0;
    v72 = 0;
  }

  v70 = v80;
  v71 = v10;
  if (v72)
  {
    v71 = v91;

  }
  if (a5)
  {
    if (v70 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v82 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v10, "recordType");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = (void *)objc_msgSend(v82, "initWithFormat:", CFSTR("Failed to decrypt record of type %@ with error: %@"), v83, v70);
      *(_DWORD *)v109 = 136315906;
      v110 = "-[FCCKDatabaseEncryptionMiddleware serverToClientRecord:inDatabase:error:]";
      v111 = 2080;
      v112 = "FCCKDatabaseEncryptionMiddleware.m";
      v113 = 1024;
      v114 = 245;
      v115 = 2114;
      v116 = v84;
      _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: RecordDecryptionFailure) : %s %s:%d %{public}@", v109, 0x26u);

    }
LABEL_55:
    v70 = objc_retainAutorelease(v70);
    *a5 = v70;
  }
LABEL_56:

  return v71;
}

- (id)clientToServerRecordZone:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = (uint64_t)a4;
  objc_msgSend(v8, "zoneID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKDatabaseEncryptionMiddleware _serverZoneIDFromClientZoneID:database:error:]((uint64_t)self, v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "zoneID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v11, "isEqual:", v12);

  v13 = v8;
  if ((v9 & 1) == 0)
  {
    v13 = (void *)objc_msgSend(v8, "copy");

    objc_msgSend(v13, "setZoneID:", v11);
  }
  if (a5)
    *a5 = 0;

  return v13;
}

- (id)serverToClientRecordZone:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  id v15;

  v7 = a3;
  objc_msgSend(v7, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  -[FCCKDatabaseEncryptionMiddleware _clientZoneIDFromServerZoneID:error:]((uint64_t)self, v8, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;

  objc_msgSend(v7, "zoneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  v13 = v7;
  if ((v12 & 1) == 0)
  {
    v13 = (void *)objc_msgSend(v7, "copy");

    objc_msgSend(v13, "setZoneID:", v9);
  }
  if (a5)
    *a5 = objc_retainAutorelease(v10);

  return v13;
}

- (id)clientToServerRecordType:(id)a3 withRecordID:(id)a4 inDatabase:(id)a5 error:(id *)a6
{
  id v10;
  FCCKPrivateDatabaseSchema *encryptionSchema;
  FCCKRecordZoneIDMapping *v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v10 = a3;
  if (self)
    encryptionSchema = self->_encryptionSchema;
  else
    encryptionSchema = 0;
  v12 = encryptionSchema;
  v13 = a5;
  objc_msgSend(a4, "zoneID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    v15 = v13[5];
  else
    v15 = 0;

  -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneID:toVersion:](v12, v10, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v10;
  if (objc_msgSend(v16, "hasChanges"))
  {
    objc_msgSend(v16, "toRecordSchema");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = *(void **)(v18 + 16);
    else
      v20 = 0;
    v17 = v20;

  }
  if (a6)
    *a6 = 0;

  return v17;
}

- (id)serverToClientRecordType:(id)a3 withRecordID:(id)a4 inDatabase:(id)a5 error:(id *)a6
{
  id v9;
  FCCKPrivateDatabaseSchema *encryptionSchema;
  FCCKRecordZoneIDMapping *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v9 = a3;
  if (self)
    encryptionSchema = self->_encryptionSchema;
  else
    encryptionSchema = 0;
  v11 = encryptionSchema;
  objc_msgSend(a4, "zoneID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneID:toVersion:](v11, v9, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v9;
  if (objc_msgSend(v13, "hasChanges"))
  {
    objc_msgSend(v13, "toRecordSchema");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = *(void **)(v15 + 16);
    else
      v17 = 0;
    v14 = v17;

  }
  if (a6)
    *a6 = 0;

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordNameCipher, 0);
  objc_storeStrong((id *)&self->_encryptionSchema, 0);
}

@end
