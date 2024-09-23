@implementation NotesMigrationManager

- (BOOL)migrateNotesStoreAtURL:(id)a3 storeType:(id)a4 managedObjectModel:(id)a5 options:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  id v42;
  NotesMigrationManager *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;
  uint64_t v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v44 = v12;
  objc_msgSend(MEMORY[0x1E0C97C00], "metadataForPersistentStoreOfType:URL:error:", v13, v12, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v17 = 0;
    goto LABEL_31;
  }
  if (!-[NotesMigrationManager areStoreMetadata:matchingEntityVersionsInModel:](self, "areStoreMetadata:matchingEntityVersionsInModel:", v16, v14))
  {
    v43 = self;
    v38 = v14;
    +[NotesMigrationMapping mappings](NotesMigrationMapping, "mappings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v20 = v18;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v50;
LABEL_7:
      v24 = 0;
      while (1)
      {
        if (*(_QWORD *)v50 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v24);
        objc_msgSend(v19, "insertObject:atIndex:", v25, 0);
        if ((objc_msgSend(v25, "canMigrateStoreMetadata:", v16) & 1) != 0)
          break;
        if (v22 == ++v24)
        {
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
          if (v22)
            goto LABEL_7;
          break;
        }
      }
    }

    if (objc_msgSend(v19, "count")
      && (objc_msgSend(v19, "objectAtIndex:", 0),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          v27 = objc_msgSend(v26, "canMigrateStoreMetadata:", v16),
          v26,
          (v27 & 1) != 0))
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      obj = v19;
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v41)
      {
        v42 = v15;
        v40 = *(_QWORD *)v46;
        while (2)
        {
          v28 = 0;
          v29 = v16;
          do
          {
            if (*(_QWORD *)v46 != v40)
              objc_enumerationMutation(obj);
            v30 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v28);
            objc_msgSend(v30, "sourceModelForStoreMetadata:", v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "destinationModel");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "mappingModelForStoreMetadata:", v29);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (!-[NotesMigrationManager migrateNotesStoreAtURL:storeType:options:sourceModel:destinationModel:mappingModel:error:](v43, "migrateNotesStoreAtURL:storeType:options:sourceModel:destinationModel:mappingModel:error:", v44, v13, v42, v31, v32, v33, a7))
            {

              v16 = v29;
              v15 = v42;
              goto LABEL_27;
            }
            objc_msgSend(MEMORY[0x1E0C97C00], "metadataForPersistentStoreOfType:URL:error:", v13, v44, a7);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v16)
            {
              v17 = 0;
              goto LABEL_35;
            }
            ++v28;
            v29 = v16;
          }
          while (v41 != v28);
          v17 = 1;
          v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
          if (v41)
            continue;
          break;
        }
LABEL_35:
        v15 = v42;
      }
      else
      {
        v17 = 1;
      }
    }
    else
    {
      if (!a7)
      {
        v17 = 0;
        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No mapping claim to be able to migrate storeMetadata: %@"), v16);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0D64170];
      v54 = *MEMORY[0x1E0D64178];
      v55 = v34;
      obj = (id)v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, 101, v31);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

      v17 = 0;
    }

LABEL_30:
    v14 = v38;
    goto LABEL_31;
  }
  v17 = 1;
LABEL_31:

  return v17;
}

- (BOOL)areStoreMetadata:(id)a3 matchingEntityVersionsInModel:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(a4, "entityVersionHashesByName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C979F0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "isEqual:", v7);
  return (char)v5;
}

- (BOOL)migrateNotesStoreAtURL:(id)a3 storeType:(id)a4 options:(id)a5 sourceModel:(id)a6 destinationModel:(id)a7 mappingModel:(id)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  int v31;
  char v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v40;
  void (**v41)(_QWORD);
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v44 = v14;
  if (v19)
  {
    v20 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    objc_msgSend(v20, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v14, 1, a9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __114__NotesMigrationManager_migrateNotesStoreAtURL_storeType_options_sourceModel_destinationModel_mappingModel_error___block_invoke;
      v45[3] = &unk_1E81EAD08;
      v40 = v20;
      v46 = v40;
      v42 = v21;
      v22 = v19;
      v23 = v18;
      v24 = v21;
      v47 = v24;
      v41 = (void (**)(_QWORD))MEMORY[0x1CAA36838](v45);
      objc_msgSend(v24, "URLByAppendingPathComponent:isDirectory:", CFSTR("tmpDB.sqlite"), 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_alloc(MEMORY[0x1E0C97BB0]);
      v43 = v23;
      v27 = v23;
      v19 = v22;
      v28 = (void *)objc_msgSend(v26, "initWithSourceModel:destinationModel:", v17, v27);
      v29 = v14;
      v30 = v15;
      v31 = objc_msgSend(v28, "migrateStoreFromURL:type:options:withMappingModel:toDestinationURL:destinationType:destinationOptions:error:", v29, v15, v16, v22, v25, v15, v16, a9);
      v32 = 0;
      if (v31)
      {
        if (objc_msgSend(v40, "removeItemAtURL:error:", v44, a9))
          v32 = objc_msgSend(v40, "moveItemAtURL:toURL:error:", v25, v44, a9);
        else
          v32 = 0;
      }
      v41[2](v41);

      v21 = v42;
      v18 = v43;
    }
    else
    {
      v30 = v15;
      v32 = 0;
    }

    goto LABEL_13;
  }
  v30 = v15;
  if (a9)
  {
    v33 = v17;
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v35 = v18;
    v36 = *MEMORY[0x1E0D64170];
    v48 = *MEMORY[0x1E0D64178];
    v49[0] = CFSTR("No mapping model specified");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v37 = v34;
    v17 = v33;
    v38 = v36;
    v18 = v35;
    v19 = 0;
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", v38, 101, v20);
    v32 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

    goto LABEL_14;
  }
  v32 = 0;
LABEL_14:

  return v32;
}

void __114__NotesMigrationManager_migrateNotesStoreAtURL_storeType_options_sourceModel_destinationModel_mappingModel_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if ((_DWORD)v2)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    LOBYTE(v4) = objc_msgSend(v4, "removeItemAtPath:error:", v5, &v7);
    v6 = v7;

    if ((v4 & 1) == 0)
      NSLog(CFSTR("Error removing tmp directory: %@"), v6);

  }
}

@end
