@implementation MusicKit_SoftLinking_MPServerObjectDatabase

+ (MusicKit_SoftLinking_MPServerObjectDatabase)sharedServerObjectDatabase
{
  if (sharedServerObjectDatabase_sSharedServerObjectDatabaseOnceToken[0] != -1)
    dispatch_once(sharedServerObjectDatabase_sSharedServerObjectDatabaseOnceToken, &__block_literal_global_8);
  return (MusicKit_SoftLinking_MPServerObjectDatabase *)(id)sharedServerObjectDatabase_sSharedServerObjectDatabase;
}

- (id)_initWithUnderlyingServerObjectDatabase:(id)a3
{
  id v5;
  MusicKit_SoftLinking_MPServerObjectDatabase *v6;
  MusicKit_SoftLinking_MPServerObjectDatabase *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPServerObjectDatabase;
  v6 = -[MusicKit_SoftLinking_MPServerObjectDatabase init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingServerObjectDatabase, a3);

  return v7;
}

- (id)importObjectsFromRequest:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  char v6;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(a3, "_underlyingImportRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPServerObjectDatabase importObjectsFromRequest:options:error:](self->_underlyingServerObjectDatabase, "importObjectsFromRequest:options:error:", v8, v6 & 1, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MusicKit_SoftLinking_MPServerObjectDatabaseImportResult _initWithUnderlyingImportResult:]([MusicKit_SoftLinking_MPServerObjectDatabaseImportResult alloc], "_initWithUnderlyingImportResult:", v9);

  return v10;
}

- (id)payloadDataForIdentifier:(id)a3 identifierKinds:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  Class (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v8 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v9 = (void *)getMPModelGenericObjectKindClass_softClass;
  v32 = getMPModelGenericObjectKindClass_softClass;
  v10 = MEMORY[0x1E0C809B0];
  if (!getMPModelGenericObjectKindClass_softClass)
  {
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __getMPModelGenericObjectKindClass_block_invoke;
    v27 = &unk_1E9C05688;
    v28 = &v29;
    __getMPModelGenericObjectKindClass_block_invoke((uint64_t)&v24);
    v9 = (void *)v30[3];
  }
  v11 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v29, 8);
  objc_msgSend(v11, "identityKind");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CCDDD0], "rawSourceFromSource:", 12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v14 = (void *)getMPIdentifierSetClass_softClass_1;
  v32 = getMPIdentifierSetClass_softClass_1;
  if (!getMPIdentifierSetClass_softClass_1)
  {
    v24 = v10;
    v25 = 3221225472;
    v26 = __getMPIdentifierSetClass_block_invoke_1;
    v27 = &unk_1E9C05688;
    v28 = &v29;
    __getMPIdentifierSetClass_block_invoke_1((uint64_t)&v24);
    v14 = (void *)v30[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v29, 8);
  v16 = [v15 alloc];
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __94__MusicKit_SoftLinking_MPServerObjectDatabase_payloadDataForIdentifier_identifierKinds_error___block_invoke;
  v21[3] = &unk_1E9C05D48;
  v22 = v8;
  v23 = a4;
  v17 = v8;
  v18 = (void *)objc_msgSend(v16, "initWithSource:modelKind:block:", v13, v12, v21);
  -[MPServerObjectDatabase payloadDataForIdentifierSet:outError:](self->_underlyingServerObjectDatabase, "payloadDataForIdentifierSet:outError:", v18, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingServerObjectDatabase, 0);
}

@end
