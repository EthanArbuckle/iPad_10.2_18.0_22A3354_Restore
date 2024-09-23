@implementation HDOntologyMercuryZipTSVRelationshipLineImporter

+ (BOOL)isHeaderLine:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("source_id"));
}

+ (BOOL)importLineWithScanner:(id)a3 slot:(int64_t)a4 graphDatabase:(id)a5 context:(id *)a6 error:(id *)a7
{
  char v10;
  id v11;
  id v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  int64_t var1;
  int64_t var0;
  id v20;
  void *v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  int64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  void *v30;
  BOOL v31;
  void *v32;
  const __CFString *v33;
  char v34;
  BOOL v36;
  id v37;
  int64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v10 = a4;
  v11 = a3;
  v12 = a5;
  v45 = -1;
  if ((objc_msgSend(v11, "scanLongLong:", &v45) & 1) == 0)
  {
    v32 = (void *)MEMORY[0x1E0CB35C8];
    v33 = CFSTR("Error parsing int64_t into subjectID");
LABEL_15:
    objc_msgSend(v32, "hk_assignError:code:format:", a7, 129, v33);
    goto LABEL_16;
  }
  v44 = -1;
  if ((objc_msgSend(v11, "scanLongLong:", &v44) & 1) == 0)
  {
    v32 = (void *)MEMORY[0x1E0CB35C8];
    v33 = CFSTR("Error parsing int64_t into relationshipType");
    goto LABEL_15;
  }
  v43 = -1;
  if ((objc_msgSend(v11, "scanLongLong:", &v43) & 1) == 0)
  {
    v32 = (void *)MEMORY[0x1E0CB35C8];
    v33 = CFSTR("Error parsing int64_t into objectID");
    goto LABEL_15;
  }
  v42 = 0;
  if ((objc_msgSend(v11, "scanLongLong:", &v42) & 1) != 0)
  {
    v14 = v44;
    v13 = v45;
    v15 = v43;
    v41 = v42;
    v16 = v12;
    objc_opt_self();
    objc_opt_self();
    if (a6->var0 == v13 && a6->var0 != -1 && a6->var1 == v14)
      goto LABEL_24;
    v39 = v15;
    v40 = v16;
    a6->var0 = v13;
    a6->var1 = v14;
    a6->var3 = 1;
    a6->var2 = 1 << v10;
    v17 = v16;
    objc_opt_self();
    v46 = 0;
    v47 = 0;
    var0 = a6->var0;
    var1 = a6->var1;
    v20 = v17;
    objc_opt_self();
    objc_msgSend(v20, "underlyingDatabase");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = +[HDSimpleGraphDatabaseRelationshipEntity maxVersion:slots:subjectNodeID:relationshipID:database:error:](HDSimpleGraphDatabaseRelationshipEntity, "maxVersion:slots:subjectNodeID:relationshipID:database:error:", &v47, &v46, var0, var1, v21, a7);
    if (!v22)
      goto LABEL_26;
    if (v22 == 1)
    {
      v23 = v46;
      v24 = v47;
      v25 = v20;
      objc_opt_self();
      v27 = a6->var0;
      v26 = a6->var1;
      v28 = a6->var2 | v23;
      a6->var2 = v28;
      a6->var3 = v24 < v41;
      if (v24 < v41)
      {
        v29 = v26;
        objc_msgSend(v25, "underlyingDatabase");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = +[HDSimpleGraphDatabaseRelationshipEntity deleteRelationshipsWithSubjectID:relationshipID:database:error:](HDSimpleGraphDatabaseRelationshipEntity, "deleteRelationshipsWithSubjectID:relationshipID:database:error:", v27, v29, v30, a7);
        goto LABEL_22;
      }
      if (v28 != v23)
      {
        v38 = v26;
        objc_msgSend(v25, "underlyingDatabase");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = +[HDSimpleGraphDatabaseRelationshipEntity updateSlots:subjectNodeID:relationshipID:database:error:](HDSimpleGraphDatabaseRelationshipEntity, "updateSlots:subjectNodeID:relationshipID:database:error:", v28, v27, v38, v30, a7);
LABEL_22:
        v36 = v31;

        if (v36)
          goto LABEL_23;
LABEL_26:
        v34 = 0;
        v16 = v40;
        goto LABEL_27;
      }

    }
LABEL_23:

    v15 = v39;
    v16 = v40;
LABEL_24:
    if (!a6->var3)
    {
      v34 = 1;
      goto LABEL_29;
    }
    v37 = v16;
    objc_opt_self();
    v34 = objc_msgSend(v37, "addRelationshipWithSubjectNodeID:type:objectNodeID:version:slots:error:", a6->var0, a6->var1, v15, v41, a6->var2, a7);
LABEL_27:

LABEL_29:
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a7, 129, CFSTR("Error parsing int64_t into version"));
LABEL_16:
  v34 = 0;
LABEL_17:

  return v34;
}

@end
