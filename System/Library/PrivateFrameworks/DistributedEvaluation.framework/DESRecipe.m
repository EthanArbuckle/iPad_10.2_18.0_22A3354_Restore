@implementation DESRecipe

- (id)_inithWithContentsOfFile:(id)a3 recipeID:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v22 = 0;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v10, 0, &v22);
  v14 = v22;
  if (v13)
  {
    v21 = v14;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v13, 0, &v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v21;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[DESRecipe _initWithRecipeUserInfo:recipeID:bundleIdentifier:](self, "_initWithRecipeUserInfo:recipeID:bundleIdentifier:", v15, v11, v12);
    }
    else
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v10;
        v25 = 2112;
        v26 = v16;
        _os_log_impl(&dword_1B96E5000, v19, OS_LOG_TYPE_INFO, "Unparsable record: %@, %@", buf, 0x16u);
      }

      v17 = 0;
      if (a6)
        *a6 = objc_retainAutorelease(v16);
    }

  }
  else
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v10;
      v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_1B96E5000, v18, OS_LOG_TYPE_INFO, "Unreadable recipe %@: %@", buf, 0x16u);
    }

    if (a6)
    {
      v16 = objc_retainAutorelease(v14);
      v17 = 0;
      *a6 = v16;
    }
    else
    {
      v17 = 0;
      v16 = v14;
    }
  }

  return v17;
}

- (id)_initWithRecipeUserInfo:(id)a3 recipeID:(id)a4 bundleIdentifier:(id)a5
{
  return -[DESRecipe _initWithRecipeUserInfo:recipeID:bundleIdentifier:predicate:](self, "_initWithRecipeUserInfo:recipeID:bundleIdentifier:predicate:", a3, a4, a5, 0);
}

- (id)_initWithRecipeUserInfo:(id)a3 recipeID:(id)a4 bundleIdentifier:(id)a5 predicate:(id)a6
{
  return -[DESRecipe _initWithRecipeUserInfo:recipeID:bundleIdentifier:predicate:attachments:](self, "_initWithRecipeUserInfo:recipeID:bundleIdentifier:predicate:attachments:", a3, a4, a5, a6, MEMORY[0x1E0C9AA60]);
}

- (id)_initWithRecipeUserInfo:(id)a3 recipeID:(id)a4 bundleIdentifier:(id)a5 predicate:(id)a6 attachments:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  DESRecipe *v17;
  uint64_t v18;
  NSString *recipeID;
  uint64_t v20;
  NSString *bundleIdentifier;
  uint64_t v22;
  NSDictionary *recipeUserInfo;
  uint64_t v24;
  NSArray *attachments;
  NSArray *attachmentSignatures;
  NSData *certificate;
  uint64_t v28;
  NSDictionary *predicate;
  DESRecipe *v30;
  objc_super v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)DESRecipe;
  v17 = -[DESRecipe init](&v32, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v13, "copy");
    recipeID = v17->_recipeID;
    v17->_recipeID = (NSString *)v18;

    v20 = objc_msgSend(v14, "copy");
    bundleIdentifier = v17->_bundleIdentifier;
    v17->_bundleIdentifier = (NSString *)v20;

    v22 = objc_msgSend(v12, "copy");
    recipeUserInfo = v17->_recipeUserInfo;
    v17->_recipeUserInfo = (NSDictionary *)v22;

    v24 = objc_msgSend(v16, "copy");
    attachments = v17->_attachments;
    v17->_attachments = (NSArray *)v24;

    attachmentSignatures = v17->_attachmentSignatures;
    v17->_attachmentSignatures = (NSArray *)MEMORY[0x1E0C9AA60];

    certificate = v17->_certificate;
    v17->_certificate = 0;

    v28 = objc_msgSend(v15, "copy");
    predicate = v17->_predicate;
    v17->_predicate = (NSDictionary *)v28;

    v30 = v17;
  }

  return v17;
}

- (id)_initWithAssetURL:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  DESRecipe *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  uint64_t v37;
  _QWORD v38[3];

  v38[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v28 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v8, 8, &v28);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v28;
    if (!v10)
    {
      if (!a5)
      {
        v18 = 0;
LABEL_23:

        goto LABEL_24;
      }
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v35[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fail to read URL=(%@)"), v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = *MEMORY[0x1E0CB3388];
      v36[0] = v12;
      v36[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 5006, v15);
      v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v11;
      goto LABEL_21;
    }
    v27 = v11;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v10, 0, &v27);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v27;

    if (!v12)
    {
      if (!a5)
      {
        v18 = 0;
        goto LABEL_22;
      }
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v33[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fail to decode JSONObject from URL=(%@)"), v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = *MEMORY[0x1E0CB3388];
      v34[0] = v15;
      v34[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 5006, v16);
      v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("recipe_blob"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("id"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v25 = v13;
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("recipe_predicate_client"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        self = (DESRecipe *)-[DESRecipe _initWithRecipeUserInfo:recipeID:bundleIdentifier:predicate:](self, "_initWithRecipeUserInfo:recipeID:bundleIdentifier:predicate:", v15, v16, v9, v17);
        v18 = self;
      }
      else
      {
        if (!a5)
        {
          v18 = 0;
          goto LABEL_20;
        }
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v25 = v13;
        v29 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing recipe ID for URL=(%@)"), v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1524, v21);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v18 = 0;
      }
    }
    else
    {
      if (!a5)
      {
        v18 = 0;
        goto LABEL_21;
      }
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v25 = v13;
      v31 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing user info dictionary for URL=(%@)"), v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1524, v17);
      v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    v13 = v25;
LABEL_20:

LABEL_21:
LABEL_22:

    v11 = v13;
    goto LABEL_23;
  }
  if (a5)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v37 = *MEMORY[0x1E0CB2D50];
    v38[0] = CFSTR("Nil recipe asset URL");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 5003, v11);
    v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

    goto LABEL_25;
  }
  v18 = 0;
LABEL_25:

  return v18;
}

- (id)_initWithRecipeResponse:(id)a3 recipeID:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  DESRecipe *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSData *certificate;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  DESRecipe *v24;
  NSObject *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSDictionary *parametersUsed;
  uint64_t v53;
  NSDictionary *recipeUserInfo;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  __int128 v58;
  uint64_t v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  id v67;
  NSObject *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  NSString *recipeID;
  uint64_t v73;
  NSString *bundleIdentifier;
  NSObject *v75;
  void *v76;
  id v77;
  NSObject *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  __int128 v87;
  id v88;
  id v89;
  id obj;
  void *v91;
  void *v92;
  void *v93;
  NSObject *log;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  _QWORD v110[4];
  id v111;
  uint64_t *v112;
  uint64_t v113;
  _QWORD v114[4];
  id v115;
  objc_super v116;
  uint64_t v117;
  const __CFString *v118;
  uint64_t v119;
  const __CFString *v120;
  uint8_t buf[4];
  void *v122;
  uint64_t v123;
  const __CFString *v124;
  uint64_t v125;
  const __CFString *v126;
  uint64_t v127;
  const __CFString *v128;
  uint64_t v129;
  const __CFString *v130;
  uint64_t v131;
  const __CFString *v132;
  uint64_t v133;
  const __CFString *v134;
  uint64_t v135;
  const __CFString *v136;
  uint64_t v137;
  const __CFString *v138;
  uint64_t v139;
  const __CFString *v140;
  uint64_t v141;
  const __CFString *v142;
  uint64_t v143;
  const __CFString *v144;
  uint64_t v145;
  const __CFString *v146;
  uint64_t v147;
  const __CFString *v148;
  uint64_t v149;
  _QWORD v150[4];

  v150[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v116.receiver = self;
  v116.super_class = (Class)DESRecipe;
  v13 = -[DESRecipe init](&v116, sel_init);
  if (!v13)
  {
    v24 = 0;
    goto LABEL_136;
  }
  objc_msgSend(v10, "objectForKey:", CFSTR("recipe_signing"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.1();

    if (a6)
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v149 = *MEMORY[0x1E0CB2D68];
      v150[0] = CFSTR("Missing recipe_signing");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v150, &v149, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1521, v15);
      v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
      v24 = 0;
      *a6 = v27;
      goto LABEL_134;
    }
LABEL_26:
    v24 = 0;
    goto LABEL_135;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.17();

    if (a6)
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v147 = *MEMORY[0x1E0CB2D68];
      v148 = CFSTR("Malformed recipe_signing");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1521, v15);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  objc_msgSend(v14, "objectForKey:", CFSTR("recipe_signature"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.16();

    if (a6)
    {
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v145 = *MEMORY[0x1E0CB2D68];
      v146 = CFSTR("Malformed recipe_signature");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1521, v109);
      v24 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = 0;
    }
    goto LABEL_134;
  }
  objc_msgSend(v14, "objectForKey:", CFSTR("recipe_content"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.15();

    if (a6)
    {
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v143 = *MEMORY[0x1E0CB2D68];
      v144 = CFSTR("Malformed recipe_content");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1521, v107);
      v24 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = 0;
    }
    goto LABEL_133;
  }
  objc_msgSend(v14, "objectForKey:", CFSTR("asset_signing_certificate"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v106, "length"))
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.2();

    if (a6)
    {
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v141 = *MEMORY[0x1E0CB2D68];
      v142 = CFSTR("Malformed asset_signing_certificate");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1521, v105);
      v24 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = 0;
    }
    goto LABEL_132;
  }
  objc_msgSend(v106, "dataUsingEncoding:", 4);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v104, "copy");
  certificate = v13->_certificate;
  v13->_certificate = (NSData *)v16;

  objc_msgSend(v108, "dataUsingEncoding:", 4);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  +[DESSignatureKey keyFromData:](DESSignatureKey, "keyFromData:", v104);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v102, "validateBase64Signature:data:", v15, v103) & 1) == 0)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.14();

    if (a6)
    {
      v37 = (void *)MEMORY[0x1E0CB35C8];
      v139 = *MEMORY[0x1E0CB2D68];
      v140 = CFSTR("Failed to validate recipe signature");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v140, &v139, 1);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1504, v101);
      v24 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = 0;
    }
    goto LABEL_131;
  }
  v100 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v108, 0);
  if (!v100)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.3();

    if (a6)
    {
      v39 = (void *)MEMORY[0x1E0CB35C8];
      v137 = *MEMORY[0x1E0CB2D68];
      v138 = CFSTR("Failed to base64 decode recipe content");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1530, v99);
      v24 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = 0;
    }
    goto LABEL_130;
  }
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v100, 0, a6);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v98)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.4();

    if (a6)
    {
      v40 = (void *)MEMORY[0x1E0CB35C8];
      v135 = *MEMORY[0x1E0CB2D68];
      v136 = CFSTR("Failed to deserialize recipe content");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1522, v41);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    v24 = 0;
    goto LABEL_129;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.13();

  v113 = 0;
  v114[0] = &v113;
  v114[1] = 0x3032000000;
  v114[2] = __Block_byref_object_copy__1;
  v114[3] = __Block_byref_object_dispose__1;
  objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("recipe"));
  v115 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.12((uint64_t)v114, v42, v43, v44, v45, v46, v47, v48);

    if (a6)
    {
      v49 = (void *)MEMORY[0x1E0CB35C8];
      v133 = *MEMORY[0x1E0CB2D68];
      v134 = CFSTR("Malformed recipe");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1524, v50);
      v24 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = 0;
    }
    goto LABEL_128;
  }
  objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("parameters"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v93 = v20;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v110[0] = MEMORY[0x1E0C809B0];
    v110[1] = 3221225472;
    v110[2] = __69__DESRecipe__initWithRecipeResponse_recipeID_bundleIdentifier_error___block_invoke;
    v110[3] = &unk_1E706EDC0;
    v22 = v21;
    v111 = v22;
    v112 = &v113;
    objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v110);

    v23 = v22;
  }
  else
  {
    v23 = 0;
  }
  v91 = v23;
  v51 = objc_msgSend(v23, "copy");
  parametersUsed = v13->_parametersUsed;
  v13->_parametersUsed = (NSDictionary *)v51;

  v53 = objc_msgSend(*(id *)(v114[0] + 40), "copy");
  recipeUserInfo = v13->_recipeUserInfo;
  v13->_recipeUserInfo = (NSDictionary *)v53;

  objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("attached_files"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (v96)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.11();

      if (a6)
      {
        v62 = (void *)MEMORY[0x1E0CB35C8];
        v131 = *MEMORY[0x1E0CB2D68];
        v132 = CFSTR("Malformed attached_files");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v132, &v131, 1);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1523, v63);
        v24 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v24 = 0;
      }
      goto LABEL_127;
    }
  }
  objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("attached_files_signatures"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (v95)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.10();

      if (a6)
      {
        v69 = (void *)MEMORY[0x1E0CB35C8];
        v129 = *MEMORY[0x1E0CB2D68];
        v130 = CFSTR("Malformed attached_files_signatures");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
        v70 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1523, v70);
        v92 = (void *)v70;
        v67 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_99;
      }
LABEL_100:
      v24 = 0;
      goto LABEL_126;
    }
  }
  v55 = objc_msgSend(v95, "count");
  if (v55 != objc_msgSend(v96, "count"))
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.9();

    if (a6)
    {
      v65 = (void *)MEMORY[0x1E0CB35C8];
      v127 = *MEMORY[0x1E0CB2D68];
      v128 = CFSTR("Length mismatch between attached_files and attached_files_signatures");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
      v66 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1523, v66);
      v92 = (void *)v66;
      v67 = (id)objc_claimAutoreleasedReturnValue();
LABEL_99:
      v24 = 0;
      *a6 = v67;
      goto LABEL_125;
    }
    goto LABEL_100;
  }
  objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("attached_files_paths"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (v92)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v56 = objc_msgSend(v92, "count");
      if (v56 == objc_msgSend(v96, "count"))
        goto LABEL_70;
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.7();

      if (a6)
      {
        v79 = (void *)MEMORY[0x1E0CB35C8];
        v123 = *MEMORY[0x1E0CB2D68];
        v124 = CFSTR("Length mismatch between paths and attachments");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
        obj = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1523, obj);
        v77 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_111;
      }
    }
    else
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.8();

      if (a6)
      {
        v76 = (void *)MEMORY[0x1E0CB35C8];
        v125 = *MEMORY[0x1E0CB2D68];
        v126 = CFSTR("Malformed paths");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
        obj = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1523, obj);
        v77 = (id)objc_claimAutoreleasedReturnValue();
LABEL_111:
        v24 = 0;
        *a6 = v77;
        goto LABEL_124;
      }
    }
    v24 = 0;
    goto LABEL_125;
  }
LABEL_70:
  obj = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v89 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v88 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v57 = 0;
  *(_QWORD *)&v58 = 138412290;
  v87 = v58;
  while (1)
  {
    if (v57 >= objc_msgSend(v96, "count", v87))
    {
      objc_storeStrong((id *)&v13->_attachments, obj);
      objc_storeStrong((id *)&v13->_attachmentSignatures, v89);
      objc_storeStrong((id *)&v13->_attachmentPaths, v88);
      v71 = objc_msgSend(v11, "copy");
      recipeID = v13->_recipeID;
      v13->_recipeID = (NSString *)v71;

      v73 = objc_msgSend(v12, "copy");
      bundleIdentifier = v13->_bundleIdentifier;
      v13->_bundleIdentifier = (NSString *)v73;

      v24 = v13;
      goto LABEL_123;
    }
    objc_msgSend(v96, "objectAtIndexedSubscript:", v57);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v87;
      v122 = v97;
      _os_log_error_impl(&dword_1B96E5000, v60, OS_LOG_TYPE_ERROR, "Invalid attachmentURLString = %@", buf, 0xCu);
    }
LABEL_85:

    ++v57;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v97);
  v59 = objc_claimAutoreleasedReturnValue();
  v60 = v59;
  if (!v59)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v87;
      v122 = v97;
      _os_log_error_impl(&dword_1B96E5000, log, OS_LOG_TYPE_ERROR, "Fail to create URL from attachmentURLString = %@", buf, 0xCu);
    }
LABEL_84:

    goto LABEL_85;
  }
  objc_msgSend(obj, "addObject:", v59);
  if (v57 >= objc_msgSend(v95, "count"))
  {
LABEL_77:
    if (v57 >= objc_msgSend(v92, "count"))
      goto LABEL_85;
    objc_msgSend(v92, "objectAtIndexedSubscript:", v57);
    log = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.5();

      if (a6)
      {
        v85 = (void *)MEMORY[0x1E0CB35C8];
        v117 = *MEMORY[0x1E0CB2D68];
        v118 = CFSTR("Nonstring type used as attachment path");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1523, v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_121;
      }
      goto LABEL_122;
    }
    objc_msgSend(v88, "addObject:", log);
    goto LABEL_84;
  }
  objc_msgSend(v95, "objectAtIndexedSubscript:", v57);
  log = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v89, "addObject:", log);

    goto LABEL_77;
  }
  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v80 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.6();

  if (a6)
  {
    v81 = (void *)MEMORY[0x1E0CB35C8];
    v119 = *MEMORY[0x1E0CB2D68];
    v120 = CFSTR("Nonstring type used as signature in attached_files_signatures");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1523, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_121:
    *a6 = v83;

  }
LABEL_122:

  v24 = 0;
LABEL_123:

LABEL_124:
LABEL_125:

LABEL_126:
LABEL_127:

LABEL_128:
  _Block_object_dispose(&v113, 8);

LABEL_129:
LABEL_130:

LABEL_131:
LABEL_132:

LABEL_133:
LABEL_134:

LABEL_135:
LABEL_136:

  return v24;
}

void __69__DESRecipe__initWithRecipeResponse_recipeID_bundleIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndex:", arc4random_uniform(objc_msgSend(v6, "count")));
    v7 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)MEMORY[0x1E0CB36D8];
      -[NSObject dataUsingEncoding:](v7, "dataUsingEncoding:", 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      objc_msgSend(v8, "JSONObjectWithData:options:error:", v9, 4, &v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v19;

      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v7, v5);
        v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(CFSTR("$"), "stringByAppendingString:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_fides_objectByReplacingValue:withValue:", v13, v10);
        v14 = objc_claimAutoreleasedReturnValue();

        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          *(_DWORD *)buf = 138412802;
          v21 = v5;
          v22 = 2112;
          v23 = v18;
          v24 = 2112;
          v25 = v14;
          _os_log_debug_impl(&dword_1B96E5000, v15, OS_LOG_TYPE_DEBUG, "Recipe after replacement of %@: %@ -> %@", buf, 0x20u);
        }

        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v17 = *(NSObject **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v14;
      }
      else
      {
        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          __69__DESRecipe__initWithRecipeResponse_recipeID_bundleIdentifier_error___block_invoke_cold_2();
      }

    }
    else
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __69__DESRecipe__initWithRecipeResponse_recipeID_bundleIdentifier_error___block_invoke_cold_3();
    }

  }
  else
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __69__DESRecipe__initWithRecipeResponse_recipeID_bundleIdentifier_error___block_invoke_cold_1();
  }

}

+ (BOOL)transportIsDedisco:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("des_settings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("data_transport"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("dedisco"));

  return v5;
}

- (BOOL)transportIsDedisco
{
  return +[DESRecipe transportIsDedisco:](DESRecipe, "transportIsDedisco:", self->_recipeUserInfo);
}

+ (BOOL)pluginShouldAddNoiseAndEncryptResult:(id)a3
{
  return !+[DESRecipe transportIsDedisco:](DESRecipe, "transportIsDedisco:", a3);
}

- (BOOL)pluginShouldAddNoiseAndEncryptResult
{
  return +[DESRecipe pluginShouldAddNoiseAndEncryptResult:](DESRecipe, "pluginShouldAddNoiseAndEncryptResult:", self->_recipeUserInfo);
}

- (NSString)privacyIdentifier
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_recipeUserInfo, "objectForKeyedSubscript:", CFSTR("privacyIdentifier"));
}

- (NSString)privacyIdentifierExt
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[NSDictionary objectForKeyedSubscript:](self->_recipeUserInfo, "objectForKeyedSubscript:", CFSTR("privacyIdentifierExt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_recipeUserInfo, "objectForKeyedSubscript:", CFSTR("privacyIdentifierExt"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (id)haruspexKeyWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKeyedSubscript:](self->_recipeUserInfo, "objectForKeyedSubscript:", CFSTR("iCloudAggServiceKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v4, 0);
    v6 = v5;
    if (v5)
    {
      v6 = v5;
      v7 = v6;
    }
    else
    {
      if (a3)
      {
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v12 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1501, v10);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      v7 = 0;
    }
  }
  else
  {
    if (!a3)
    {
      v7 = 0;
      goto LABEL_10;
    }
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1501, v6);
    v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v7;
}

+ (BOOL)useSparsification:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v17;
  void *v18;
  void *v19;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sparsification"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sparsification"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("chunkClippingBounds"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sparsification"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("numChunks"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sparsification"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("chunkClippingBounds"));
          v11 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sparsification"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("numChunks"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)v11;
          if (+[DESRecipe _hasValidClippingBounds:matchValidNumChunks:](DESRecipe, "_hasValidClippingBounds:matchValidNumChunks:", v11, v12))
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sparsification"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sparsificationMapFile"));
            v17 = v10;
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            v10 = v17;
          }
          else
          {
            isKindOfClass = 0;
          }

        }
        else
        {
          isKindOfClass = 0;
        }

      }
      else
      {
        isKindOfClass = 0;
      }

    }
    else
    {
      isKindOfClass = 0;
    }

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

+ (BOOL)_hasValidClippingBounds:(id)a3 matchValidNumChunks:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char isKindOfClass;
  int v9;
  BOOL v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  v9 = objc_msgSend(v6, "intValue");
  v10 = isKindOfClass & (objc_msgSend(v5, "count") == v9);

  return v10;
}

- (BOOL)useSparsification
{
  return +[DESRecipe useSparsification:](DESRecipe, "useSparsification:", self->_recipeUserInfo);
}

+ (BOOL)useAggregatableMetadata:(id)a3
{
  void *v3;
  char isKindOfClass;

  if (a3)
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MetadataEncoding"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (BOOL)useAggregatableMetadata
{
  return +[DESRecipe useAggregatableMetadata:](DESRecipe, "useAggregatableMetadata:", self->_recipeUserInfo);
}

+ (BOOL)useAdaptiveClipping:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  BOOL v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ClippingIndicatorScale"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ClippingIndicatorScale"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "doubleValue");
      v8 = v7 > 0.0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)useAdaptiveClipping
{
  return +[DESRecipe useAdaptiveClipping:](DESRecipe, "useAdaptiveClipping:", self->_recipeUserInfo);
}

- (BOOL)useFederatedBuffer
{
  void *v3;
  void *v4;
  char isKindOfClass;

  -[NSDictionary objectForKeyedSubscript:](self->_recipeUserInfo, "objectForKeyedSubscript:", CFSTR("federatedBufferContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_recipeUserInfo, "objectForKeyedSubscript:", CFSTR("ramsayRecipeID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (NSNumber)approximateStaleness
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;

  if (-[DESRecipe useFederatedBuffer](self, "useFederatedBuffer"))
  {
    -[NSDictionary objectForKeyedSubscript:](self->_recipeUserInfo, "objectForKeyedSubscript:", CFSTR("federatedBufferContext"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("iterationStartTime"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("iterationStartTime"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("stalenessScale"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("stalenessBias"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("iterationStartTime"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "doubleValue");
          v11 = v10;
          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("stalenessScale"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("stalenessBias"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[DESFederatedBuffer computeApproximateStaleness:stalenessScale:stalenessBias:](DESFederatedBuffer, "computeApproximateStaleness:stalenessScale:stalenessBias:", v12, v13, v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
          return (NSNumber *)v14;
        }
LABEL_11:
        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[DESRecipe approximateStaleness].cold.1(v3, v15);

        v14 = 0;
        goto LABEL_14;
      }

    }
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSNumber *)v14;
}

- (BOOL)isFederatedBufferStaled:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char isKindOfClass;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  v4 = a3;
  if (v4)
  {
    if (-[DESRecipe useFederatedBuffer](self, "useFederatedBuffer"))
    {
      -[NSDictionary objectForKeyedSubscript:](self->_recipeUserInfo, "objectForKeyedSubscript:", CFSTR("federatedBufferContext"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maximumStaleness"));
      v6 = objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maximumStaleness"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v4, "doubleValue");
          v10 = v9;
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maximumStaleness"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "doubleValue");
          v13 = v12;

          if (v10 < v13)
          {
            LOBYTE(v6) = 0;
            goto LABEL_14;
          }
          +[DESLogging coreChannel](DESLogging, "coreChannel");
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
            -[DESRecipe isFederatedBufferStaled:].cold.1((uint64_t)v4, v5, v6);
        }
        else
        {
          +[DESLogging coreChannel](DESLogging, "coreChannel");
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            -[DESRecipe isFederatedBufferStaled:].cold.2(v5, v6);
        }

        LOBYTE(v6) = 1;
      }
LABEL_14:

      goto LABEL_15;
    }
    LOBYTE(v6) = 0;
  }
  else
  {
    LOBYTE(v6) = 1;
  }
LABEL_15:

  return (char)v6;
}

- (BOOL)isFederatedBufferStaled
{
  DESRecipe *v2;
  void *v3;

  v2 = self;
  -[DESRecipe approximateStaleness](self, "approximateStaleness");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[DESRecipe isFederatedBufferStaled:](v2, "isFederatedBufferStaled:", v3);

  return (char)v2;
}

- (NSNumber)federatedBufferDownScalingFactor
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  NSObject *v10;

  if (-[DESRecipe useFederatedBuffer](self, "useFederatedBuffer"))
  {
    -[DESRecipe approximateStaleness](self, "approximateStaleness");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[DESRecipe federatedBufferDownScalingFactor].cold.1(v4);
      goto LABEL_16;
    }
    if (-[DESRecipe isFederatedBufferStaled:](self, "isFederatedBufferStaled:", v3))
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        -[DESRecipe federatedBufferDownScalingFactor].cold.2(v4);
LABEL_16:
      v5 = 0;
      goto LABEL_17;
    }
    -[NSDictionary objectForKeyedSubscript:](self->_recipeUserInfo, "objectForKeyedSubscript:", CFSTR("federatedBufferContext"));
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("downScalingOrder"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[NSObject objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("downScalingOrder"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[DESRecipe federatedBufferDownScalingFactor].cold.3(v4, v10);

        goto LABEL_16;
      }
      -[NSObject objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("downScalingOrder"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[DESFederatedBuffer computeDownScalingFactor:approximateStaleness:](DESFederatedBuffer, "computeDownScalingFactor:approximateStaleness:", v9, v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_17:

    return (NSNumber *)v5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSNumber *)v5;
}

- (NSNumber)maxNorm
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NSDictionary objectForKeyedSubscript:](self->_recipeUserInfo, "objectForKeyedSubscript:", CFSTR("maxNorm"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_recipeUserInfo, "objectForKeyedSubscript:", CFSTR("L2NormBound"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSNumber *)v6;
}

- (NSNumber)normBinCount
{
  return (NSNumber *)-[NSDictionary objectForKeyedSubscript:](self->_recipeUserInfo, "objectForKeyedSubscript:", CFSTR("normBinCount"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *recipeID;
  NSDictionary *recipeUserInfo;
  NSArray *attachments;
  NSArray *attachmentSignatures;
  void *v9;
  NSArray *attachmentPaths;
  id v11;

  v4 = a3;
  recipeID = self->_recipeID;
  v11 = v4;
  if (recipeID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", recipeID, CFSTR("recipeId"));
    v4 = v11;
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  recipeUserInfo = self->_recipeUserInfo;
  if (recipeUserInfo)
    objc_msgSend(v11, "encodeObject:forKey:", recipeUserInfo, CFSTR("recipeUserInfo"));
  attachments = self->_attachments;
  if (attachments)
    objc_msgSend(v11, "encodeObject:forKey:", attachments, CFSTR("attachments"));
  attachmentSignatures = self->_attachmentSignatures;
  v9 = v11;
  if (attachmentSignatures)
  {
    objc_msgSend(v11, "encodeObject:forKey:", attachmentSignatures, CFSTR("attachmentSignatures"));
    v9 = v11;
  }
  attachmentPaths = self->_attachmentPaths;
  if (attachmentPaths)
  {
    objc_msgSend(v11, "encodeObject:forKey:", attachmentPaths, CFSTR("attachmentPaths"));
    v9 = v11;
  }

}

- (DESRecipe)initWithCoder:(id)a3
{
  id v4;
  DESRecipe *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSDictionary *recipeUserInfo;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *attachments;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *attachmentSignatures;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *attachmentPaths;
  DESRecipe *v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)DESRecipe;
  v5 = -[DESRecipe init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipeId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_storeStrong((id *)&v5->_recipeID, v6);
      objc_storeStrong((id *)&v5->_bundleIdentifier, v7);
      v8 = (void *)MEMORY[0x1E0C99E60];
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("recipeUserInfo"));
      v14 = objc_claimAutoreleasedReturnValue();
      recipeUserInfo = v5->_recipeUserInfo;
      v5->_recipeUserInfo = (NSDictionary *)v14;

      v16 = (void *)MEMORY[0x1E0C99E60];
      v17 = objc_opt_class();
      objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("attachments"));
      v19 = objc_claimAutoreleasedReturnValue();
      attachments = v5->_attachments;
      v5->_attachments = (NSArray *)v19;

      v21 = (void *)MEMORY[0x1E0C99E60];
      v22 = objc_opt_class();
      objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("attachmentSignatures"));
      v24 = objc_claimAutoreleasedReturnValue();
      attachmentSignatures = v5->_attachmentSignatures;
      v5->_attachmentSignatures = (NSArray *)v24;

      v26 = (void *)MEMORY[0x1E0C99E60];
      v27 = objc_opt_class();
      objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("attachmentPaths"));
      v29 = objc_claimAutoreleasedReturnValue();
      attachmentPaths = v5->_attachmentPaths;
      v5->_attachmentPaths = (NSArray *)v29;

      v31 = v5;
    }
    else
    {
      v31 = 0;
    }

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@, %@, %@)"), v5, self->_bundleIdentifier, self->_recipeID, self->_recipeUserInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)recipeUserInfo
{
  return self->_recipeUserInfo;
}

- (NSData)certificate
{
  return self->_certificate;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)attachmentSignatures
{
  return self->_attachmentSignatures;
}

- (void)setAttachmentSignatures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)attachmentPaths
{
  return self->_attachmentPaths;
}

- (void)setAttachmentPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)parametersUsed
{
  return self->_parametersUsed;
}

- (NSString)recipeID
{
  return self->_recipeID;
}

- (void)setRecipeID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_recipeID, 0);
  objc_storeStrong((id *)&self->_parametersUsed, 0);
  objc_storeStrong((id *)&self->_attachmentPaths, 0);
  objc_storeStrong((id *)&self->_attachmentSignatures, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_recipeUserInfo, 0);
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1B96E5000, v0, v1, "Missing recipe_signing for recipeId=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1B96E5000, v0, v1, "asset_signing_certificate is of wrong type or zero length, certStr=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1B96E5000, v0, v1, "Failed to base64 decode recipe content for recipeId=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1B96E5000, v0, v1, "Failed to deserialize recipe content for recipeId=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1B96E5000, v0, v1, "path  is of wrong type, path=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1B96E5000, v0, v1, "signature is of wrong type, signature=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2(&dword_1B96E5000, v0, v1, "Length mismatch between paths and attachments, attachmentURLStrings=%@, attachmentPaths=%@");
  OUTLINED_FUNCTION_1();
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1B96E5000, v0, v1, "attachmentPaths is of wrong type, attachmentPaths=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.9()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2(&dword_1B96E5000, v0, v1, "Length mismatch between attached_files and attached_files_signatures, attachmentURLStrings=%@, attachmentSignatures=%@");
  OUTLINED_FUNCTION_1();
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1B96E5000, v0, v1, "attachmentSignatures is of wrong type, attachmentSignatures=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1B96E5000, v0, v1, "attachmentURLStrings is of wrong type, attachmentURLStrings=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithRecipeResponse:(uint64_t)a3 recipeID:(uint64_t)a4 bundleIdentifier:(uint64_t)a5 error:(uint64_t)a6 .cold.12(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B96E5000, a2, a3, "recipe is of wrong type or zero length, recipe=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.13()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  _os_log_debug_impl(&dword_1B96E5000, v0, OS_LOG_TYPE_DEBUG, "Successfully validated recipe signature: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1B96E5000, v0, v1, "Failed to validate recipe signature: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1B96E5000, v0, v1, "recipe_content is of wrong type, recipeContent=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1B96E5000, v0, v1, "recipe_signature is of wrong type, recipeSignature=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.17()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1B96E5000, v0, v1, "recipe_signing is of wrong type, recipeSigning=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69__DESRecipe__initWithRecipeResponse_recipeID_bundleIdentifier_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2(&dword_1B96E5000, v0, v1, "Skipping invalid parameter set %@: %@");
  OUTLINED_FUNCTION_1();
}

void __69__DESRecipe__initWithRecipeResponse_recipeID_bundleIdentifier_error___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2(&dword_1B96E5000, v0, v1, "Skipping unparsable parameter value %@: %@");
  OUTLINED_FUNCTION_1();
}

void __69__DESRecipe__initWithRecipeResponse_recipeID_bundleIdentifier_error___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2(&dword_1B96E5000, v0, v1, "Skipping invalid parameter value %@: %@");
  OUTLINED_FUNCTION_1();
}

- (void)approximateStaleness
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("iterationStartTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("stalenessScale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("stalenessBias"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_1B96E5000, a2, OS_LOG_TYPE_ERROR, "Recipe content for approximating staleness iterationStartTime=%@ or scale=%@ or bias=%@ is malformed", (uint8_t *)&v7, 0x20u);

}

- (void)isFederatedBufferStaled:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("maximumStaleness"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_1B96E5000, a3, OS_LOG_TYPE_DEBUG, "Rejecting recipe since the staleness %@ is larger or equal than the limit %@", (uint8_t *)&v6, 0x16u);

}

- (void)isFederatedBufferStaled:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("maximumStaleness"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3(&dword_1B96E5000, a2, v4, "Maximum staleness for rejecting staled donation is malformed: %@", v5);

  OUTLINED_FUNCTION_6();
}

- (void)federatedBufferDownScalingFactor
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("downScalingOrder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3(&dword_1B96E5000, a2, v4, "Federated buffer down-scaling order is malformed: %@", v5);

  OUTLINED_FUNCTION_6();
}

@end
