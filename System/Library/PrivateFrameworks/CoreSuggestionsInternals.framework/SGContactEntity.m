@implementation SGContactEntity

- (SGContactEntity)initWithDuplicateKey:(id)a3 recordId:(id)a4 masterEntityId:(int64_t)a5 title:(id)a6
{
  id v11;
  id v12;
  id v13;
  SGContactEntity *v14;
  SGContactEntity *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGContactEntity.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("duplicateKey"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGContactEntity.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)SGContactEntity;
  v14 = -[SGEntity init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    -[SGEntity setRecordId:](v14, "setRecordId:", v12);
    -[SGEntity setDuplicateKey:](v15, "setDuplicateKey:", v11);
    -[SGEntity setMasterEntityId:](v15, "setMasterEntityId:", a5);
    -[SGEntity setTitle:](v15, "setTitle:", v13);
  }

  return v15;
}

+ (id)contactEntityFromEntity:(id)a3
{
  id v5;
  void *v6;
  char IsContact;
  SGContactEntity *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  SGContactEntity *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGContactEntity.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entity"));

  }
  objc_msgSend(v5, "duplicateKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entityType");
  IsContact = SGEntityTypeIsContact();

  if ((IsContact & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGContactEntity.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("SGEntityTypeIsContact(entity.duplicateKey.entityType)"));

  }
  v8 = [SGContactEntity alloc];
  objc_msgSend(v5, "duplicateKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "masterEntityId");
  objc_msgSend(v5, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SGContactEntity initWithDuplicateKey:recordId:masterEntityId:title:](v8, "initWithDuplicateKey:recordId:masterEntityId:title:", v9, v10, v11, v12);

  objc_msgSend(v5, "duplicateKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGEntity setDuplicateKey:](v13, "setDuplicateKey:", v14);

  objc_msgSend(v5, "sourceKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGEntity setSourceKey:](v13, "setSourceKey:", v15);

  objc_msgSend(v5, "content");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGEntity setContent:](v13, "setContent:", v16);

  objc_msgSend(v5, "creationTimestamp");
  -[SGEntity setCreationTimestamp:](v13, "setCreationTimestamp:");
  objc_msgSend(v5, "lastModifiedTimestamp");
  -[SGEntity setLastModifiedTimestamp:](v13, "setLastModifiedTimestamp:");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v5, "tags");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        -[SGEntity addTag:](v13, "addTag:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v19);
  }

  objc_msgSend(v5, "structuredData");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGEntity setStructuredData:](v13, "setStructuredData:", v22);

  objc_msgSend(v5, "quality");
  -[SGEntity setQuality:](v13, "setQuality:");
  objc_msgSend(v5, "extractionInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGEntity setExtractionInfo:](v13, "setExtractionInfo:", v23);

  return v13;
}

+ (id)contactEntityWithTitle:(id)a3 duplicateKey:(id)a4 recordId:(id)a5 masterEntityId:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  SGContactEntity *v15;
  void *v17;
  void *v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = v13;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGContactEntity.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("duplicateKey"));

    if (v14)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGContactEntity.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

    goto LABEL_3;
  }
  if (!v13)
    goto LABEL_5;
LABEL_3:
  v15 = -[SGContactEntity initWithDuplicateKey:recordId:masterEntityId:title:]([SGContactEntity alloc], "initWithDuplicateKey:recordId:masterEntityId:title:", v12, v14, a6, v11);

  return v15;
}

@end
