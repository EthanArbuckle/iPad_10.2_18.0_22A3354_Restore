@implementation HDOntologyMercuryZipTSVAttributeLineImporter

+ (BOOL)isHeaderLine:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("source_id"));
}

+ (BOOL)importLineWithScanner:(id)a3 slot:(int64_t)a4 graphDatabase:(id)a5 context:(id *)a6 error:(id *)a7
{
  char v10;
  id v11;
  id v12;
  char v13;
  id v14;
  int64_t v15;
  int64_t v16;
  id v17;
  id v18;
  int64_t var0;
  int64_t var1;
  id v21;
  void *v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  int64_t v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  int64_t v31;
  void *v32;
  BOOL v33;
  void *v34;
  const __CFString *v35;
  char v36;
  void *v37;
  const __CFString *v38;
  int64_t v39;
  BOOL v40;
  id v41;
  int64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v10 = a4;
  v11 = a3;
  v12 = a5;
  v50 = -1;
  if ((objc_msgSend(v11, "scanLongLong:", &v50) & 1) != 0)
  {
    v49 = -1;
    if ((objc_msgSend(v11, "scanLongLong:", &v49) & 1) != 0)
    {
      v48 = 0;
      v13 = objc_msgSend(v11, "scanString:", &v48);
      v14 = v48;
      if ((v13 & 1) != 0)
      {
        v47 = 0;
        if ((objc_msgSend(v11, "scanLongLong:", &v47) & 1) != 0)
        {
          v16 = v49;
          v15 = v50;
          v45 = v47;
          v17 = v14;
          v46 = v12;
          objc_opt_self();
          objc_opt_self();
          if (a6->var0 == v15 && a6->var0 != -1 && a6->var1 == v16)
            goto LABEL_23;
          v44 = v17;
          a6->var0 = v15;
          a6->var1 = v16;
          a6->var3 = 1;
          a6->var2 = 1 << v10;
          v18 = v46;
          objc_opt_self();
          v51 = 0;
          v52 = 0;
          var0 = a6->var0;
          var1 = a6->var1;
          v21 = v18;
          objc_opt_self();
          objc_msgSend(v21, "underlyingDatabase");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = +[HDSimpleGraphDatabaseAttributeEntity maxVersion:slots:nodeID:type:database:error:](HDSimpleGraphDatabaseAttributeEntity, "maxVersion:slots:nodeID:type:database:error:", &v52, &v51, var0, var1, v22, a7);
          if (!v23)
            goto LABEL_25;
          if (v23 == 1)
          {
            v24 = v51;
            v25 = v52;
            v26 = v21;
            objc_opt_self();
            v27 = a6->var0;
            v28 = a6->var1;
            v29 = a6->var2 | v24;
            a6->var2 = v29;
            a6->var3 = v25 < v45;
            if (v25 < v45)
            {
              v30 = v27;
              v31 = v28;
              objc_msgSend(v26, "underlyingDatabase");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = +[HDSimpleGraphDatabaseAttributeEntity deleteAttributesWithNodeID:type:database:error:](HDSimpleGraphDatabaseAttributeEntity, "deleteAttributesWithNodeID:type:database:error:", v30, v31, v32, a7);
              goto LABEL_21;
            }
            if (v29 != v24)
            {
              v43 = v28;
              v39 = v27;
              objc_msgSend(v26, "underlyingDatabase");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = +[HDSimpleGraphDatabaseAttributeEntity updateSlots:nodeID:type:database:error:](HDSimpleGraphDatabaseAttributeEntity, "updateSlots:nodeID:type:database:error:", v29, v39, v43, v32, a7);
LABEL_21:
              v40 = v33;

              if (v40)
                goto LABEL_22;
LABEL_25:
              v36 = 0;
              v17 = v44;
              goto LABEL_26;
            }

          }
LABEL_22:

          v17 = v44;
LABEL_23:
          if (!a6->var3)
          {
            v36 = 1;
            goto LABEL_28;
          }
          v41 = v46;
          v21 = v17;
          objc_opt_self();
          v36 = objc_msgSend(v41, "addAttributeForNodeID:type:value:version:slots:error:", a6->var0, a6->var1, v21, v45, a6->var2, a7);

LABEL_26:
LABEL_28:

          goto LABEL_29;
        }
        v37 = (void *)MEMORY[0x1E0CB35C8];
        v38 = CFSTR("Error parsing int64_t into version");
      }
      else
      {
        v37 = (void *)MEMORY[0x1E0CB35C8];
        v38 = CFSTR("Error parsing string into attributeValue");
      }
      objc_msgSend(v37, "hk_assignError:code:description:", a7, 129, v38);
      v36 = 0;
LABEL_29:

      goto LABEL_30;
    }
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v35 = CFSTR("Error parsing int64_t into attributeType");
  }
  else
  {
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v35 = CFSTR("Error parsing int64_t into nodeID");
  }
  objc_msgSend(v34, "hk_assignError:code:description:", a7, 129, v35);
  v36 = 0;
LABEL_30:

  return v36;
}

@end
