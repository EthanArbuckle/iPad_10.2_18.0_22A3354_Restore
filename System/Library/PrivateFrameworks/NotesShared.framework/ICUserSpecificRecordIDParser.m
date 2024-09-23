@implementation ICUserSpecificRecordIDParser

- (ICUserSpecificRecordIDParser)initWithSharedRecordType:(id)a3 sharedRecordID:(id)a4 userRecordName:(id)a5 ownerName:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  ICUserSpecificRecordIDParser *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  NSString *v33;
  NSString *recordType;
  id v36;
  void *v38;
  objc_super v39;

  v10 = a3;
  v11 = a4;
  v12 = (void *)MEMORY[0x1E0C99DE8];
  v13 = a6;
  v14 = a5;
  objc_msgSend(v12, "arrayWithCapacity:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v10;
  objc_msgSend((id)objc_opt_class(), "userSpecificRecordTypeForSharedRecordType:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:atIndexedSubscript:", v16, 0);

  objc_msgSend(v15, "setObject:atIndexedSubscript:", v14, 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "zoneID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "databaseScope");
  CKDatabaseScopeString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:atIndexedSubscript:", v19, 0);

  objc_msgSend(v11, "zoneID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "zoneName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:atIndexedSubscript:", v21, 1);

  objc_msgSend(v17, "setObject:atIndexedSubscript:", v13, 2);
  objc_msgSend(v11, "recordName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:atIndexedSubscript:", v22, 3);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsJoinedByString:", CFSTR("::"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:atIndexedSubscript:", v24, 0);

  objc_msgSend(v17, "componentsJoinedByString:", CFSTR("::"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:atIndexedSubscript:", v25, 1);

  objc_msgSend(v23, "componentsJoinedByString:", CFSTR("/"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v26, "length") < 0x100)
  {
    v36 = a4;
    v29 = objc_alloc(MEMORY[0x1E0C95098]);
    objc_msgSend(v11, "zoneID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "zoneName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v29, "initWithZoneName:ownerName:", v31, *MEMORY[0x1E0C94730]);

    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v26, v27);
    v39.receiver = self;
    v39.super_class = (Class)ICUserSpecificRecordIDParser;
    self = -[ICUserSpecificRecordIDParser init](&v39, sel_init);
    if (!self)
      goto LABEL_7;
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v33 = (NSString *)objc_claimAutoreleasedReturnValue();
    recordType = self->_recordType;
    self->_recordType = v33;

    objc_storeStrong((id *)&self->_recordID, v32);
    objc_storeStrong((id *)&self->_sharedRecordType, a3);
    objc_storeStrong((id *)&self->_sharedRecordID, v36);
    v28 = 0;
    if (-[ICUserSpecificRecordIDParser validate](self, "validate"))
LABEL_7:
      v28 = self;

  }
  else
  {
    v27 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[ICUserSpecificRecordIDParser initWithSharedRecordType:sharedRecordID:userRecordName:ownerName:].cold.1();
    v28 = 0;
  }

  return v28;
}

- (ICUserSpecificRecordIDParser)initWithRecordName:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  __CFString *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  ICUserSpecificRecordIDParser *v42;
  void *v43;
  ICUserSpecificRecordIDParser *v44;
  NSObject *v45;
  __CFString *v47;
  __CFString *obj;
  void *v49;
  void *v50;
  __CFString *v51;
  void *v52;
  __CFString *v53;
  NSObject *v54;
  __CFString *v55;
  __CFString *v56;
  __CFString *v57;
  NSObject *v58;
  objc_super v59;

  v4 = a3;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 2)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject componentsSeparatedByString:](v6, "componentsSeparatedByString:", CFSTR("::"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") == 2)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v58 = objc_claimAutoreleasedReturnValue();
      -[NSObject componentsSeparatedByString:](v58, "componentsSeparatedByString:", CFSTR("::"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count") == 4)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "ic_nilWhenEmpty");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v10)
          v12 = (__CFString *)v10;
        else
          v12 = CFSTR("(null)");
        obj = v12;
        v13 = v12;

        v49 = v7;
        objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "ic_nilWhenEmpty");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
          v17 = (__CFString *)v15;
        else
          v17 = CFSTR("(null)");
        v57 = v17;

        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "ic_nilWhenEmpty");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        if (v19)
          v21 = (__CFString *)v19;
        else
          v21 = CFSTR("(null)");
        v56 = v21;

        v54 = v13;
        objc_msgSend((id)objc_opt_class(), "sharedRecordTypeForUserSpecificRecordType:", v13);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "ic_nilWhenEmpty");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        if (v23)
          v25 = (__CFString *)v23;
        else
          v25 = CFSTR("(null)");
        v47 = v25;
        v53 = v25;

        objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "ic_nilWhenEmpty");
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v27;
        if (v27)
          v29 = (__CFString *)v27;
        else
          v29 = CFSTR("(null)");
        v55 = v29;

        v50 = v8;
        objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "ic_nilWhenEmpty");
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = (void *)v31;
        if (v31)
          v33 = (__CFString *)v31;
        else
          v33 = CFSTR("(null)");
        v34 = v33;

        v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", v56, v57);
        v36 = objc_alloc(MEMORY[0x1E0C95070]);
        v52 = (void *)v35;
        v37 = v35;
        v38 = v34;
        v39 = (void *)objc_msgSend(v36, "initWithRecordName:zoneID:", v4, v37);
        v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", v56, v55);
        v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v38, v40);
        v59.receiver = self;
        v59.super_class = (Class)ICUserSpecificRecordIDParser;
        v42 = -[ICUserSpecificRecordIDParser init](&v59, sel_init);
        self = v42;
        v51 = v38;
        if (v42
          && (objc_storeStrong((id *)&v42->_recordType, obj),
              objc_storeStrong((id *)&self->_recordID, v39),
              objc_storeStrong((id *)&self->_sharedRecordType, v47),
              objc_storeStrong((id *)&self->_sharedRecordID, v41),
              !-[ICUserSpecificRecordIDParser validate](self, "validate")))
        {
          v43 = (void *)v40;
          v44 = 0;
        }
        else
        {
          v43 = (void *)v40;
          v44 = self;
        }
        v7 = v49;
        v8 = v50;

        v45 = v54;
      }
      else
      {
        v45 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          -[ICUserSpecificRecordIDParser initWithRecordName:].cold.1();
        v44 = 0;
      }

    }
    else
    {
      v58 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        -[ICUserSpecificRecordIDParser initWithRecordName:].cold.2();
      v44 = 0;
    }

  }
  else
  {
    v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICUserSpecificRecordIDParser initWithRecordName:].cold.3();
    v44 = 0;
  }

  return v44;
}

- (BOOL)validate
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  os_log_t v33;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;

  -[ICUserSpecificRecordIDParser recordType](self, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {

LABEL_15:
    v33 = os_log_create("com.apple.notes", "Cloud");
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      return 0;
    }
LABEL_16:
    -[ICUserSpecificRecordIDParser validate].cold.1();
    goto LABEL_17;
  }
  -[ICUserSpecificRecordIDParser recordType](self, "recordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", CFSTR("(null)"));

  if (v5)
    goto LABEL_15;
  -[ICUserSpecificRecordIDParser recordType](self, "recordType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasSuffix:", CFSTR("_UserSpecific"));

  if ((v7 & 1) == 0)
  {
    v33 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[ICUserSpecificRecordIDParser validate].cold.12();
    goto LABEL_17;
  }
  -[ICUserSpecificRecordIDParser recordID](self, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "databaseScope");

  if (!v10)
  {
    v33 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[ICUserSpecificRecordIDParser validate].cold.2();
    goto LABEL_17;
  }
  -[ICUserSpecificRecordIDParser recordID](self, "recordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "zoneID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "zoneName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "length"))
  {

LABEL_23:
    v33 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[ICUserSpecificRecordIDParser validate].cold.3();
    goto LABEL_17;
  }
  -[ICUserSpecificRecordIDParser recordID](self, "recordID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "zoneID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "zoneName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqual:", CFSTR("(null)"));

  if (v17)
    goto LABEL_23;
  -[ICUserSpecificRecordIDParser recordID](self, "recordID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "zoneID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ownerName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "length"))
  {

LABEL_26:
    v33 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[ICUserSpecificRecordIDParser validate].cold.4();
    goto LABEL_17;
  }
  -[ICUserSpecificRecordIDParser recordID](self, "recordID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "zoneID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ownerName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEqual:", CFSTR("(null)"));

  if (v24)
    goto LABEL_26;
  -[ICUserSpecificRecordIDParser recordID](self, "recordID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "recordName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v26, "length"))
  {

LABEL_29:
    v33 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[ICUserSpecificRecordIDParser validate].cold.5();
    goto LABEL_17;
  }
  -[ICUserSpecificRecordIDParser recordID](self, "recordID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "recordName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isEqual:", CFSTR("(null)"));

  if (v29)
    goto LABEL_29;
  -[ICUserSpecificRecordIDParser recordID](self, "recordID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "recordName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "containsString:", *MEMORY[0x1E0C94730]);

  if (v32)
  {
    v33 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[ICUserSpecificRecordIDParser validate].cold.6();
    goto LABEL_17;
  }
  -[ICUserSpecificRecordIDParser sharedRecordType](self, "sharedRecordType");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v35, "length"))
  {

LABEL_42:
    v33 = os_log_create("com.apple.notes", "Cloud");
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    goto LABEL_16;
  }
  -[ICUserSpecificRecordIDParser sharedRecordType](self, "sharedRecordType");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "isEqual:", CFSTR("(null)"));

  if (v37)
    goto LABEL_42;
  -[ICUserSpecificRecordIDParser sharedRecordID](self, "sharedRecordID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "zoneID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "databaseScope");

  if (!v40)
  {
    v33 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[ICUserSpecificRecordIDParser validate].cold.8();
    goto LABEL_17;
  }
  -[ICUserSpecificRecordIDParser sharedRecordID](self, "sharedRecordID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "zoneID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "zoneName");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v43, "length"))
  {

LABEL_47:
    v33 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[ICUserSpecificRecordIDParser validate].cold.9();
    goto LABEL_17;
  }
  -[ICUserSpecificRecordIDParser sharedRecordID](self, "sharedRecordID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "zoneID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "zoneName");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "isEqual:", CFSTR("(null)"));

  if (v47)
    goto LABEL_47;
  -[ICUserSpecificRecordIDParser sharedRecordID](self, "sharedRecordID");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "zoneID");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "ownerName");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v50, "length"))
  {

LABEL_50:
    v33 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[ICUserSpecificRecordIDParser validate].cold.10();
    goto LABEL_17;
  }
  -[ICUserSpecificRecordIDParser sharedRecordID](self, "sharedRecordID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "zoneID");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "ownerName");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "isEqual:", CFSTR("(null)"));

  if (v54)
    goto LABEL_50;
  -[ICUserSpecificRecordIDParser sharedRecordID](self, "sharedRecordID");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "recordName");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v56, "length"))
  {

LABEL_53:
    v33 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[ICUserSpecificRecordIDParser validate].cold.11();
    goto LABEL_17;
  }
  -[ICUserSpecificRecordIDParser sharedRecordID](self, "sharedRecordID");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "recordName");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "isEqual:", CFSTR("(null)"));

  if (v59)
    goto LABEL_53;
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICUserSpecificRecordIDParser recordType](self, "recordType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICUserSpecificRecordIDParser recordID](self, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICUserSpecificRecordIDParser sharedRecordType](self, "sharedRecordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICUserSpecificRecordIDParser sharedRecordID](self, "sharedRecordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, recordType: %@, recordID: %@, sharedRecordType: %@, sharedRecordID: %@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  BOOL v14;
  char v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  BOOL v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  int v29;
  void *v30;
  unint64_t v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;

  if (a3 != self)
  {
    v4 = a3;
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICUserSpecificRecordIDParser recordType](self, "recordType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)*MEMORY[0x1E0C9B0D0];
    if ((void *)*MEMORY[0x1E0C9B0D0] == v6)
      v9 = 0;
    else
      v9 = v6;
    v10 = v9;
    if (v8 == v7)
      v11 = 0;
    else
      v11 = v7;
    v12 = v11;
    if (v10 | v12)
    {
      v13 = (void *)v12;
      if (v10)
        v14 = v12 == 0;
      else
        v14 = 1;
      if (v14)
      {
        v15 = 0;
LABEL_58:

        goto LABEL_59;
      }
      v16 = objc_msgSend((id)v10, "isEqual:", v12);

      if (!v16)
      {
        v15 = 0;
LABEL_59:

        return v15;
      }
    }
    v38 = v7;
    -[ICUserSpecificRecordIDParser recordID](self, "recordID");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)v10)
      v17 = 0;
    else
      v17 = (void *)v10;
    v18 = v17;
    if (v8 == v13)
      v19 = 0;
    else
      v19 = v13;
    v20 = v19;
    if (v18 | v20)
    {
      v21 = (void *)v20;
      if (v18)
        v22 = v20 == 0;
      else
        v22 = 1;
      if (v22)
      {
        v15 = 0;
LABEL_56:

LABEL_57:
        v7 = v38;
        goto LABEL_58;
      }
      v23 = objc_msgSend((id)v18, "isEqual:", v20);

      if (!v23)
      {
        v15 = 0;
        goto LABEL_57;
      }
    }
    v36 = v6;
    -[ICUserSpecificRecordIDParser sharedRecordType](self, "sharedRecordType");
    v18 = objc_claimAutoreleasedReturnValue();
    v37 = v5;
    objc_msgSend(v5, "sharedRecordType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)v18)
      v24 = 0;
    else
      v24 = (void *)v18;
    v25 = v24;
    if (v8 == v21)
      v26 = 0;
    else
      v26 = v21;
    v27 = v26;
    if (v25 | v27)
    {
      v28 = (void *)v27;
      v15 = 0;
      if (!v25 || !v27)
      {
LABEL_54:

LABEL_55:
        v6 = v36;
        v5 = v37;
        goto LABEL_56;
      }
      v29 = objc_msgSend((id)v25, "isEqual:", v27);

      if (!v29)
      {
        v15 = 0;
        goto LABEL_55;
      }
    }
    -[ICUserSpecificRecordIDParser sharedRecordID](self, "sharedRecordID");
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "sharedRecordID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)v25)
      v30 = 0;
    else
      v30 = (void *)v25;
    v31 = v30;
    if (v8 == v28)
      v32 = 0;
    else
      v32 = v28;
    v33 = v32;
    v34 = (void *)v33;
    if (v31 | v33)
    {
      v15 = 0;
      if (v31 && v33)
        v15 = objc_msgSend((id)v31, "isEqual:", v33);
    }
    else
    {
      v15 = 1;
    }

    goto LABEL_54;
  }
  return 1;
}

- (unint64_t)hash
{
  unint64_t result;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = self->_hash;
  if (!result)
  {
    -[ICUserSpecificRecordIDParser recordType](self, "recordType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hash");
    -[ICUserSpecificRecordIDParser recordID](self, "recordID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hash");
    -[ICUserSpecificRecordIDParser sharedRecordType](self, "sharedRecordType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hash");
    -[ICUserSpecificRecordIDParser sharedRecordID](self, "sharedRecordID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hash");
    self->_hash = ICHashWithHashKeys(v5, v10, v11, v12, v13, v14, v15, v16, v7);

    return self->_hash;
  }
  return result;
}

+ (BOOL)isUserSpecificRecordType:(id)a3
{
  return objc_msgSend(a3, "hasSuffix:", CFSTR("_UserSpecific"));
}

+ (BOOL)isUserSpecificRecordID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  objc_msgSend(a3, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") == 2)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("::"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 2)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("::"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count") == 4;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)userSpecificRecordTypeForSharedRecordType:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), a3, CFSTR("_UserSpecific"));
}

+ (id)sharedRecordTypeForUserSpecificRecordType:(id)a3
{
  return (id)objc_msgSend(a3, "ic_stringWithoutSuffix:", CFSTR("_UserSpecific"));
}

- (NSString)recordType
{
  return self->_recordType;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (NSString)sharedRecordType
{
  return self->_sharedRecordType;
}

- (CKRecordID)sharedRecordID
{
  return self->_sharedRecordID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedRecordID, 0);
  objc_storeStrong((id *)&self->_sharedRecordType, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
}

- (void)initWithSharedRecordType:sharedRecordID:userRecordName:ownerName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Cannot construct user-specific record ID because the user-specific record name is longer than allowed {recordName: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithRecordName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Cannot parse user-specific record ID because shared record component has incorrect component count {recordName: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithRecordName:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Cannot parse user-specific record ID because user-specific record component has incorrect component count {recordName: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithRecordName:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Cannot parse user-specific record ID because record name has incorrect component count {recordName: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)validate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Cannot construct user-specific record ID because the user-specific record name doesn't have the user-specific record suffix {recordID: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
