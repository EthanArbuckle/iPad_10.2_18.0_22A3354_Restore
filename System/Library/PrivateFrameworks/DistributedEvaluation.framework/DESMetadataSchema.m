@implementation DESMetadataSchema

- (DESMetadataSchema)initWith:(id)a3 key:(id)a4 attachments:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  DESMetadataSchema *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  char v17;
  int v18;
  id v19;
  NSObject *v20;
  void *v21;
  id *v22;
  void *v23;
  id *v24;
  uint64_t *v25;
  NSObject *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSString *desc;
  void *v35;
  char isKindOfClass;
  DESCategoricalMetadataEncoder *v37;
  DESMetadataEncoder *encoder;
  void *v39;
  char v40;
  void *v41;
  DESMetadataSchema *v42;
  DESNumericMetadataEncoder *v43;
  void *v45;
  char v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  NSObject *v51;
  void *v52;
  void *v53;
  id *v54;
  uint64_t *v55;
  NSObject *v56;
  NSObject *v57;
  id *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  char v64;
  void *v65;
  NSObject *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void **v74;
  uint64_t *v75;
  id v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id *v82;
  id v83;
  id obj;
  uint64_t v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  objc_super v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  _QWORD v105[2];
  _QWORD v106[2];
  _BYTE v107[128];
  uint64_t v108;
  id v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  id v113;
  uint64_t v114;
  _QWORD v115[3];

  v115[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v94.receiver = self;
  v94.super_class = (Class)DESMetadataSchema;
  v13 = -[DESMetadataSchema init](&v94, sel_init);
  if (!v13)
    goto LABEL_36;
  objc_msgSend(v10, "objectForKey:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No schema for metadata key %@, skip encoding."), v11);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[DESMetadataSchema initWith:key:attachments:error:].cold.1();

    if (!a6)
      goto LABEL_31;
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = a6;
    v114 = *MEMORY[0x1E0CB2D68];
    v115[0] = v19;
    v23 = (void *)MEMORY[0x1E0C99D80];
    v24 = (id *)v115;
    v25 = &v114;
    goto LABEL_29;
  }
  v15 = 0x1E0C99000uLL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Schema for %@ is not a dictionary."), v11);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[DESMetadataSchema initWith:key:attachments:error:].cold.1();

    if (!a6)
      goto LABEL_31;
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = a6;
    v112 = *MEMORY[0x1E0CB2D68];
    v113 = v19;
    v23 = (void *)MEMORY[0x1E0C99D80];
    v24 = &v113;
    v25 = &v112;
    goto LABEL_29;
  }
  objc_storeStrong((id *)&v13->_key, a4);
  objc_msgSend(v14, "objectForKey:", CFSTR("type"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("categorical"));

  if ((v17 & 1) != 0)
  {
    v18 = 1;
  }
  else
  {
    objc_msgSend(v14, "objectForKey:", CFSTR("type"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("numeric"));

    if ((v28 & 1) == 0)
    {
      objc_msgSend(v14, "objectForKey:", CFSTR("type"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("fedstats"));

      if (!a6 || (v40 & 1) != 0)
        goto LABEL_32;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed schema, type is neither categorical nor numeric for %@."), v11);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = a6;
      v110 = *MEMORY[0x1E0CB2D68];
      v111 = v19;
      v23 = (void *)MEMORY[0x1E0C99D80];
      v24 = &v111;
      v25 = &v110;
      goto LABEL_29;
    }
    v18 = 0;
  }
  v13->_outputType = v18;
  objc_msgSend(v14, "objectForKey:", CFSTR("buckets"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "objectForKey:", CFSTR("buckets"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "integerValue");

    if (v31)
    {
      objc_msgSend(v14, "objectForKey:", CFSTR("buckets"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v13->_buckets = objc_msgSend(v32, "integerValue");

      objc_msgSend(v14, "objectForKey:", CFSTR("description"));
      v33 = objc_claimAutoreleasedReturnValue();
      desc = v13->_desc;
      v13->_desc = (NSString *)v33;

      if (v13->_outputType == 1)
      {
        objc_msgSend(v14, "objectForKey:", CFSTR("dictionary"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v14, "objectForKey:", CFSTR("dictionary"));
          v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
          v37 = -[DESCategoricalMetadataEncoder initWithSingleSchema:]([DESCategoricalMetadataEncoder alloc], "initWithSingleSchema:", v19);
          if (v37)
          {
            encoder = v13->_encoder;
            v13->_encoder = (DESMetadataEncoder *)v37;

LABEL_35:
LABEL_36:
            v42 = v13;
            goto LABEL_37;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create CategoricalMetadataEncoder for: %@"), v11);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          +[DESLogging coreChannel](DESLogging, "coreChannel");
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            -[DESMetadataSchema initWith:key:attachments:error:].cold.1();

          if (a6)
          {
            v86 = (void *)MEMORY[0x1E0CB35C8];
            v97 = *MEMORY[0x1E0CB2D68];
            v98 = v41;
            objc_msgSend(*(id *)(v15 + 3456), "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
            v58 = a6;
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 2007, v59);
            *v58 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_30;
        }
        objc_msgSend(v14, "objectForKey:", CFSTR("dictionary_path"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v46 = objc_opt_isKindOfClass();

        if ((v46 & 1) != 0)
        {
          objc_msgSend(v14, "objectForKey:", CFSTR("dictionary_path"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = 0u;
          v91 = 0u;
          v92 = 0u;
          v93 = 0u;
          obj = v12;
          v19 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v107, 16);
          if (!v19)
          {
LABEL_66:

            goto LABEL_21;
          }
          v82 = a6;
          v83 = v12;
          v85 = *(_QWORD *)v91;
LABEL_41:
          v47 = 0;
          while (1)
          {
            if (*(_QWORD *)v91 != v85)
              objc_enumerationMutation(obj);
            v48 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v47);
            objc_msgSend(v48, "lastPathComponent");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "isEqualToString:", v41);

            if (v50)
              break;
            if (v19 == (id)++v47)
            {
              v19 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v107, 16);
              if (v19)
                goto LABEL_41;
              a6 = v82;
              v12 = v83;
              goto LABEL_65;
            }
          }
          v89 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v48, 1, &v89);
          v60 = objc_claimAutoreleasedReturnValue();
          v19 = v89;
          v87 = (void *)v60;
          if (!v60)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed schema, unreadable dictionary_path %@ for %@, error: %@"), v41, v11, v19);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            +[DESLogging coreChannel](DESLogging, "coreChannel");
            v66 = objc_claimAutoreleasedReturnValue();
            v12 = v83;
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
              -[DESMetadataSchema initWith:key:attachments:error:].cold.1();

            if (!v82)
              goto LABEL_83;
            v67 = (void *)MEMORY[0x1E0CB35C8];
            v68 = *MEMORY[0x1E0CB2D68];
            v105[0] = *MEMORY[0x1E0CB3388];
            v105[1] = v68;
            v106[0] = v19;
            v106[1] = v87;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 2);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 2007, v69);
            *v82 = (id)objc_claimAutoreleasedReturnValue();
LABEL_82:

LABEL_83:
            goto LABEL_30;
          }
          v88 = v19;
          objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v60, 0, &v88);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v88;

          objc_opt_class();
          v12 = v83;
          v81 = v62;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v61, "objectForKey:", CFSTR("dictionary"));
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v64 = objc_opt_isKindOfClass();

            v65 = v61;
            a6 = v82;
            if ((v64 & 1) != 0)
            {
              objc_msgSend(v65, "objectForKey:", CFSTR("dictionary"));
              v19 = (id)objc_claimAutoreleasedReturnValue();

              obj = v62;
LABEL_65:
              v15 = 0x1E0C99000;
              goto LABEL_66;
            }
            v80 = v65;
            v76 = v62;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed schema, unparsable dictionary read from dictionary_path %@ for %@, error: %@"), v41, v11, v62);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            +[DESLogging coreChannel](DESLogging, "coreChannel");
            v77 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
              -[DESMetadataSchema initWith:key:attachments:error:].cold.1();

            if (!v82)
              goto LABEL_81;
            v72 = (void *)MEMORY[0x1E0CB35C8];
            v101 = *MEMORY[0x1E0CB2D68];
            v102 = v70;
            v79 = v70;
            v73 = (void *)MEMORY[0x1E0C99D80];
            v74 = &v102;
            v75 = &v101;
          }
          else
          {
            v80 = v61;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed schema, unparsable dictionary_path %@ for %@, error: %@"), v41, v11, v62);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            +[DESLogging coreChannel](DESLogging, "coreChannel");
            v71 = objc_claimAutoreleasedReturnValue();
            a6 = v82;
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
              -[DESMetadataSchema initWith:key:attachments:error:].cold.1();

            if (!v82)
            {
              v76 = v81;
              goto LABEL_81;
            }
            v72 = (void *)MEMORY[0x1E0CB35C8];
            v103 = *MEMORY[0x1E0CB2D68];
            v104 = v70;
            v79 = v70;
            v73 = (void *)MEMORY[0x1E0C99D80];
            v74 = &v104;
            v75 = &v103;
          }
          objc_msgSend(v73, "dictionaryWithObjects:forKeys:count:", v74, v75, 1);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 2007, v78);
          *a6 = (id)objc_claimAutoreleasedReturnValue();

          v76 = v81;
          v70 = v79;
LABEL_81:

          v19 = v76;
          v69 = v80;
          goto LABEL_82;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed schema, neither dictionary nor dictionary_path has the correct format for: %@"), v11);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          -[DESMetadataSchema initWith:key:attachments:error:].cold.1();

        if (!a6)
          goto LABEL_31;
        v52 = (void *)MEMORY[0x1E0CB35C8];
        v99 = *MEMORY[0x1E0CB2D68];
        v100 = v19;
        v53 = (void *)MEMORY[0x1E0C99D80];
        v54 = &v100;
        v55 = &v99;
      }
      else
      {
        v43 = objc_alloc_init(DESNumericMetadataEncoder);
        if (v43)
        {
          v19 = v13->_encoder;
          v13->_encoder = (DESMetadataEncoder *)v43;
          goto LABEL_35;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create NumericMetadataEncoder for: %@"), v11);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          -[DESMetadataSchema initWith:key:attachments:error:].cold.1();

        if (!a6)
          goto LABEL_31;
        v52 = (void *)MEMORY[0x1E0CB35C8];
        v95 = *MEMORY[0x1E0CB2D68];
        v96 = v19;
        v53 = (void *)MEMORY[0x1E0C99D80];
        v54 = &v96;
        v55 = &v95;
      }
      objc_msgSend(v53, "dictionaryWithObjects:forKeys:count:", v54, v55, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 2007, v41);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
  }
  else
  {

  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed schema, buckets %ld is <= 0 for %@."), v13->_buckets, v11);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = a6;
    v108 = *MEMORY[0x1E0CB2D68];
    v109 = v19;
    v23 = (void *)MEMORY[0x1E0C99D80];
    v24 = &v109;
    v25 = &v108;
LABEL_29:
    objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 2007, v41);
    *v22 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
LABEL_32:

  v42 = 0;
LABEL_37:

  return v42;
}

- (NSString)key
{
  return self->_key;
}

- (int)outputType
{
  return self->_outputType;
}

- (int64_t)buckets
{
  return self->_buckets;
}

- (NSString)desc
{
  return self->_desc;
}

- (DESMetadataEncoder)encoder
{
  return self->_encoder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoder, 0);
  objc_storeStrong((id *)&self->_desc, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)initWith:key:attachments:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1B96E5000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
