@implementation HDOntologyMercuryZipTSVNodeLineImporter

+ (BOOL)isHeaderLine:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("hg_id"));
}

+ (BOOL)importLineWithScanner:(id)a3 slot:(int64_t)a4 graphDatabase:(id)a5 context:(id *)a6 error:(id *)a7
{
  char v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v29;
  _BOOL4 v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;

  v9 = a4;
  v10 = a3;
  v11 = a5;
  v40 = -1;
  if ((objc_msgSend(v10, "scanLongLong:", &v40) & 1) != 0)
  {
    v39 = 0;
    if ((objc_msgSend(v10, "scanLongLong:", &v39) & 1) != 0)
    {
      v38 = 0;
      if ((objc_msgSend(v10, "scanLongLong:", &v38) & 1) != 0)
      {
        v12 = v39;
        v13 = v40;
        v37 = v38;
        v36 = v38 != 0;
        v14 = v11;
        objc_opt_self();
        v15 = v14;
        objc_opt_self();
        v41 = 0;
        objc_msgSend(v15, "nodeForID:error:", v13, &v41);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = v41;
        v18 = v17;
        if (v16)
        {
          v19 = objc_retainAutorelease(v16);
        }
        else if (v17)
        {
          if (a7)
            *a7 = objc_retainAutorelease(v17);
          else
            _HKLogDroppedError();

          LOBYTE(a7) = 0;
          goto LABEL_32;
        }

        v20 = v16;
        if (!v16)
        {
          LOBYTE(a7) = objc_msgSend(v15, "insertNodeWithID:version:slots:deleted:error:", v13, v12, 1 << v9, v37 != 0, a7);
LABEL_32:

          goto LABEL_14;
        }
        v21 = v20;
        v22 = v15;
        objc_opt_self();
        v35 = objc_msgSend(v21, "rowID");
        v23 = objc_msgSend(v21, "version");
        v24 = objc_msgSend(v21, "slots");
        v25 = v24 | (1 << v9);
        if (v23 < v12 || v25 != v24)
        {
          v33 = v12;
          if (v23 >= v12)
          {
            v12 = objc_msgSend(v21, "version");
            v36 = objc_msgSend(v21, "isDeleted");
          }
          v34 = v22;
          objc_msgSend(v22, "underlyingDatabase");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = +[HDSimpleGraphDatabaseNodeEntity updateNodeWithID:version:slots:deleted:database:error:](HDSimpleGraphDatabaseNodeEntity, "updateNodeWithID:version:slots:deleted:database:error:", v35, v12, v25, v36, v29, a7);

          if (!v30)
          {
            LOBYTE(a7) = 0;
            v22 = v34;
            goto LABEL_31;
          }
          v22 = v34;
          if (v37 && v23 < v33)
          {
            v31 = v34;
            objc_opt_self();
            objc_msgSend(v31, "underlyingDatabase");
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (!+[HDSimpleGraphDatabaseAttributeEntity deleteAttributesWithNodeID:lessThanVersion:database:error:](HDSimpleGraphDatabaseAttributeEntity, "deleteAttributesWithNodeID:lessThanVersion:database:error:", v35, v33, v32, a7))
            {

              LOBYTE(a7) = 0;
              goto LABEL_31;
            }
            LODWORD(a7) = +[HDSimpleGraphDatabaseRelationshipEntity deleteRelationshipsWithSubjectID:lessThanVersion:database:error:](HDSimpleGraphDatabaseRelationshipEntity, "deleteRelationshipsWithSubjectID:lessThanVersion:database:error:", v35, v33, v32, a7);

            if (!(_DWORD)a7)
              goto LABEL_31;
          }
        }
        LOBYTE(a7) = 1;
LABEL_31:

        goto LABEL_32;
      }
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v27 = CFSTR("Error parsing int64_t into deleted");
    }
    else
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v27 = CFSTR("Error parsing int64_t into version");
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = CFSTR("Error parsing int64_t into rowID");
  }
  objc_msgSend(v26, "hk_assignError:code:format:", a7, 129, v27);
  LOBYTE(a7) = 0;
LABEL_14:

  return (char)a7;
}

@end
