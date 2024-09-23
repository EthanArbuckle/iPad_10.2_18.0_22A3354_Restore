@implementation HDObjectAttachmentSchemaProvider

+ (id)schemaIdentifier
{
  return (id)*MEMORY[0x1E0CB47C8];
}

- (int64_t)schemaVersionForObjectIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  int64_t v10;
  id v12;

  v12 = 0;
  -[HDObjectAttachmentSchemaProvider _objectWithIdentifier:profile:errorOut:]((uint64_t)self, a3, a4, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  objc_msgSend(v7, "hd_sampleType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", a5, 100, CFSTR("Failed to fetch object"), v8);
    goto LABEL_5;
  }
  if (!self)
  {
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v10 = objc_msgSend(v9, "attachmentSchemaVersion");
LABEL_6:

  return v10;
}

- (id)_objectWithIdentifier:(void *)a3 profile:(_QWORD *)a4 errorOut:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
    if (v9)
    {
      v22 = 0;
      v23 = &v22;
      v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__153;
      v26 = __Block_byref_object_dispose__153;
      v27 = 0;
      objc_msgSend(v8, "database");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __75__HDObjectAttachmentSchemaProvider__objectWithIdentifier_profile_errorOut___block_invoke;
      v17[3] = &unk_1E6D01F20;
      v17[4] = a1;
      v18 = v9;
      v20 = &v22;
      v19 = v8;
      +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDDataEntity, "performReadTransactionWithHealthDatabase:error:block:", v10, &v21, v17);
      v11 = v21;

      v12 = (void *)v23[5];
      if (!v12)
      {
        v13 = v11;
        v14 = v13;
        if (v13)
        {
          if (a4)
            *a4 = objc_retainAutorelease(v13);
          else
            _HKLogDroppedError();
        }

        v12 = (void *)v23[5];
      }
      v15 = v12;

      _Block_object_dispose(&v22, 8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 118, CFSTR("No object found with identifier '%@'"), v7);
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)validateAttachment:(id)a3 forObjectWithIdentifier:(id)a4 metadata:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  id v16;

  v11 = a3;
  -[HDObjectAttachmentSchemaProvider _objectWithIdentifier:profile:errorOut:]((uint64_t)self, a4, a6, a7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "sampleType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contentType");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "canAttachFileOfType:size:error:", v14, objc_msgSend(v11, "size"), a7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("The object type is not supported"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v14 = v16;
      if (v16)
      {
        if (a7)
        {
          v14 = objc_retainAutorelease(v16);
          v15 = 0;
          *a7 = v14;
        }
        else
        {
          _HKLogDroppedError();
          v15 = 0;
        }
        v13 = v14;
      }
      else
      {
        v13 = 0;
        v15 = 0;
      }
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)readAuthorizationForObjectIdentifier:(id)a3 client:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  char v13;

  v10 = a4;
  -[HDObjectAttachmentSchemaProvider _objectWithIdentifier:profile:errorOut:]((uint64_t)self, a3, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "authorizationOracle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isAuthorizedToReadObject:error:", v11, a6);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)writeAuthorizationForObjectIdentifier:(id)a3 client:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v10 = a4;
  -[HDObjectAttachmentSchemaProvider _objectWithIdentifier:profile:errorOut:]((uint64_t)self, a3, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_5;
  objc_msgSend(v10, "sourceBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sourceRevision");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "source");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v12, "isEqualToString:", v15);

  if ((v16 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a6, 4, CFSTR("Cannot write to an object from a different source"));
LABEL_5:
    v20 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v10, "authorizationOracle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hd_sampleType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "readAuthorizationStatusForType:error:", v18, a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "canWrite");
LABEL_6:

  return v20;
}

BOOL __75__HDObjectAttachmentSchemaProvider__objectWithIdentifier_profile_errorOut___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  unint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  _BOOL8 v29;
  id v31[4];
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = a2;
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v8, "protectedDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HDDataEntityPredicateForDataUUID();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = 0;
    +[HDDataEntity anyInDatabase:predicate:error:](HDSampleEntity, "anyInDatabase:predicate:error:", v10, v11, v31);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v31[0];

    if (v12)
    {
      objc_msgSend(v9, "protectedDatabase");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "numberForProperty:database:", CFSTR("data_type"), v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = objc_msgSend(v15, "integerValue");
        if (v16 < 0x13D)
        {
          objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
LABEL_23:

LABEL_24:
            goto LABEL_25;
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("HKObjectType for data type code '%li' is unexpectedly nil"), v16);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Unknown data type code '%li'"), v16);
        }
        v18 = (id)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v18);
          else
            _HKLogDroppedError();
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 2000, CFSTR("Unable to fetch dataTypeCodeNumber for objectUUID: %@"), v7);
      }
LABEL_22:
      v17 = 0;
      goto LABEL_23;
    }
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 118, CFSTR("No entity found for objectUUID: %@"), v7);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (!v15)
        goto LABEL_22;
    }
    if (a3)
      *a3 = objc_retainAutorelease(v15);
    else
      _HKLogDroppedError();

    v17 = 0;
    if (v13)
      goto LABEL_24;
    goto LABEL_23;
  }
  v17 = 0;
LABEL_25:

  if (v17)
  {
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(a1 + 48);
    v21 = *(id *)(a1 + 40);
    v22 = v17;
    v23 = v20;
    if (v19)
    {
      v35 = 0;
      v36 = &v35;
      v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__153;
      v39 = __Block_byref_object_dispose__153;
      v40 = 0;
      +[HDSampleEntity entityEnumeratorWithType:profile:](HDSampleEntity, "entityEnumeratorWithType:profile:", v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      HDDataEntityPredicateForDataUUID();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setPredicate:", v25);

      objc_msgSend(v24, "setLimitCount:", 1);
      v31[0] = (id)MEMORY[0x1E0C809B0];
      v31[1] = (id)3221225472;
      v31[2] = __71__HDObjectAttachmentSchemaProvider__objectWithUUID_type_profile_error___block_invoke;
      v31[3] = &unk_1E6D01F48;
      v32 = v21;
      v33 = v23;
      v34 = &v35;
      objc_msgSend(v24, "enumerateWithError:handler:", a3, v31);
      v26 = (id)v36[5];

      _Block_object_dispose(&v35, 8);
    }
    else
    {
      v26 = 0;
    }

    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

    v29 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) != 0;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

BOOL __71__HDObjectAttachmentSchemaProvider__objectWithUUID_type_profile_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;

  v7 = a2;
  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  else
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 118, CFSTR("No object found for objectUUID: %@, profile: %@"), a1[4], a1[5]);

  return v7 != 0;
}

@end
