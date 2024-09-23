@implementation FBKBugForm

+ (id)entityName
{
  return CFSTR("BugForm");
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  FBKBugForm *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKBugForm setAnnouncementTempFile:](self, "setAnnouncementTempFile:", 0);
  -[FBKBugForm setCachedAnnouncementHTML:](self, "setCachedAnnouncementHTML:", 0);
  -[FBKBugForm setGeneratingTemp:](self, "setGeneratingTemp:", 0);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v57 = (void *)v6;
  -[FBKBugForm setName:](self, "setName:", v6);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("is_active"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = FBKJSONObjectIsNil(v7);

  v8 = (void *)MEMORY[0x24BDD16E0];
  if ((_DWORD)v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("is_active"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[FBKBugForm setActive:](self, "setActive:", objc_msgSend(v9, "BOOLValue"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKBugForm setText:](self, "setText:", v12);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("form_type"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugForm setFeedbackType:](self, "setFeedbackType:", +[FBKBugForm bugFormTypeFromString:](FBKBugForm, "bugFormTypeFromString:"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("form_role"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v13);
  v14 = objc_claimAutoreleasedReturnValue();

  if (v14)
    v15 = +[FBKBugForm bugFormRoleFromString:](FBKBugForm, "bugFormRoleFromString:", v14);
  else
    v15 = 0;
  -[FBKBugForm setRole:](self, "setRole:", v15);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("repeat_per"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v16);
  v17 = objc_claimAutoreleasedReturnValue();

  v60 = (void *)v17;
  -[FBKBugForm setRepeatPer:](self, "setRepeatPer:", v17);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("should_repeat"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = FBKJSONObjectIsNil(v18);

  v19 = (void *)MEMORY[0x24BDD16E0];
  if ((_DWORD)v17)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("should_repeat"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithBool:", objc_msgSend(v21, "BOOLValue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v59 = v20;
  -[FBKBugForm setShouldRepeat:](self, "setShouldRepeat:", objc_msgSend(v20, "BOOLValue"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("platform"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23
    || (objc_msgSend(v23, "isEqualToString:", &stru_24E15EAF8) & 1) != 0
    || objc_msgSend(v23, "isEqualToString:", CFSTR("unspecified")))
  {
    v24 = (void *)*MEMORY[0x24BE2CA00];
    v25 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE2CA38], "allPlatforms");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "containsObject:", v23);

    if ((v47 & 1) == 0)
    {
      +[FBKLog ded](FBKLog, "ded");
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        -[FBKBugForm setPropertiesFromJSONObject:].cold.2(v48, v49, v50, v51, v52, v53, v54, v55);

    }
    v25 = self;
    v24 = v23;
  }
  -[FBKBugForm setPlatform:](v25, "setPlatform:", v24);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("updated_at"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = v23;
  if (v27)
  {
    FBKDateFromServerString(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("question_groups"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = (void *)v14;
  if (v29)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("question_groups"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugForm managedObjectContext](self, "managedObjectContext");
    v31 = v12;
    v32 = v9;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKManagedFeedbackObject importFromJSONArray:intoContext:](FBKQuestionGroup, "importFromJSONArray:intoContext:", v30, v33);
    v34 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("sortOrder"), 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v35;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject sortedArrayUsingDescriptors:](v34, "sortedArrayUsingDescriptors:", v36);
    v37 = v28;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugForm setQuestionGroups:](self, "setQuestionGroups:", v38);

    v28 = v37;
    v9 = v32;
    v12 = v31;

  }
  else
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[FBKBugForm setPropertiesFromJSONObject:].cold.1(self, v34);
  }

  -[FBKBugForm setUpdatedAt:](self, "setUpdatedAt:", v28);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("file_predicates"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("file_predicates"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugForm managedObjectContext](self, "managedObjectContext");
    v41 = v28;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKManagedFeedbackObject importFromJSONArray:intoContext:](FBKFilePredicate, "importFromJSONArray:intoContext:", v40, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugForm setFilePredicates:](self, "setFilePredicates:", v43);

    v28 = v41;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugForm setFilePredicates:](self, "setFilePredicates:", v40);
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("signature"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("signature"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugForm setSignature:](self, "setSignature:", v45);

  }
}

+ (int64_t)bugFormTypeFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  if (bugFormTypeFromString__onceToken != -1)
    dispatch_once(&bugFormTypeFromString__onceToken, &__block_literal_global_34);
  objc_msgSend((id)bugFormTypeFromString__mapping, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "integerValue");
  else
    v6 = -1;

  return v6;
}

void __36__FBKBugForm_bugFormTypeFromString___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("Bug");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v7[1] = CFSTR("ER");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v7[2] = CFSTR("Loc");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v7[3] = CFSTR("Quality");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v3;
  v7[4] = CFSTR("Profile");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)bugFormTypeFromString__mapping;
  bugFormTypeFromString__mapping = v5;

}

+ (int64_t)bugFormRoleFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  if (bugFormRoleFromString__onceToken != -1)
    dispatch_once(&bugFormRoleFromString__onceToken, &__block_literal_global_63);
  objc_msgSend((id)bugFormRoleFromString__mapping, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "integerValue");
  else
    v6 = 0;

  return v6;
}

void __36__FBKBugForm_bugFormRoleFromString___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = CFSTR("Issue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("Survey");
  v5[0] = v0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)bugFormRoleFromString__mapping;
  bugFormRoleFromString__mapping = v2;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)FBKBugForm;
  -[FBKBugForm description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugForm name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FBKBugForm active](self, "active");
  -[FBKBugForm text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugForm questionGroups](self, "questionGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ name=%@; active=%i; text=%@; %lu question groups"),
    v4,
    v5,
    v6,
    v7,
    objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)questionGroupForQuestionID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[FBKBugForm questionGroups](self, "questionGroups", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "questions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "valueForKey:", CFSTR("ID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v4);

        if ((v13 & 1) != 0)
        {
          v14 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)questionForQuestionID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[FBKBugForm questionGroupForQuestionID:](self, "questionGroupForQuestionID:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "questions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "ID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)questionWithRole:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[FBKBugForm questionGroups](self, "questionGroups", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "questionWithRole:", v4);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (int64_t)feedbackType
{
  void *v3;
  int64_t v4;

  -[FBKBugForm willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("feedbackType"));
  -[FBKBugForm primitiveFeedbackType](self, "primitiveFeedbackType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  -[FBKBugForm didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("feedbackType"));
  return v4;
}

- (void)setFeedbackType:(int64_t)a3
{
  void *v5;

  -[FBKBugForm willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("feedbackType"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugForm setPrimitiveFeedbackType:](self, "setPrimitiveFeedbackType:", v5);

  -[FBKBugForm didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("feedbackType"));
}

- (int64_t)role
{
  void *v3;
  int64_t v4;

  -[FBKBugForm willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("role"));
  -[FBKBugForm primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("role"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  -[FBKBugForm didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("role"));
  return v4;
}

- (void)setRole:(int64_t)a3
{
  void *v5;

  -[FBKBugForm willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("role"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugForm setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("role"));

  -[FBKBugForm didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("role"));
}

- (NSArray)questionGroups
{
  void *v3;
  void *v4;

  -[FBKBugForm willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("questionGroups"));
  -[FBKBugForm primitiveQuestionGroups](self, "primitiveQuestionGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKBugForm didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("questionGroups"));
  return (NSArray *)v4;
}

- (void)setQuestionGroups:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[FBKBugForm willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("questionGroups"));
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKBugForm setPrimitiveQuestionGroups:](self, "setPrimitiveQuestionGroups:", v5);
  -[FBKBugForm didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("questionGroups"));
}

- (id)completedResponsesContentItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[FBKManagedFeedbackObject ID](self, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugForm managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKContentItem contentItemsWithFormIDs:fromContext:](FBKContentItem, "contentItemsWithFormIDs:fromContext:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ded_selectItemsPassingTest:", &__block_literal_global_82);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __44__FBKBugForm_completedResponsesContentItems__block_invoke(uint64_t a1, void *a2)
{
  return (objc_msgSend(a2, "itemType") & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (id)draftResponsesContentItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[FBKManagedFeedbackObject ID](self, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugForm managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKContentItem contentItemsWithFormIDs:fromContext:](FBKContentItem, "contentItemsWithFormIDs:fromContext:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ded_selectItemsPassingTest:", &__block_literal_global_83);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __40__FBKBugForm_draftResponsesContentItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itemType") == 1;
}

- (id)completedResponsesContentItemsForTeam:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKManagedFeedbackObject ID](self, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugForm managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKContentItem contentItemsWithFormIDs:fromContext:](FBKContentItem, "contentItemsWithFormIDs:fromContext:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__FBKBugForm_completedResponsesContentItemsForTeam___block_invoke;
  v12[3] = &unk_24E159648;
  v13 = v4;
  v9 = v4;
  objc_msgSend(v8, "ded_selectItemsPassingTest:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __52__FBKBugForm_completedResponsesContentItemsForTeam___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if ((objc_msgSend(v3, "itemType") & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    objc_msgSend(v3, "singleTeam");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)draftResponsesContentItemsForTeam:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKManagedFeedbackObject ID](self, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugForm managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKContentItem contentItemsWithFormIDs:fromContext:](FBKContentItem, "contentItemsWithFormIDs:fromContext:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__FBKBugForm_draftResponsesContentItemsForTeam___block_invoke;
  v12[3] = &unk_24E159648;
  v13 = v4;
  v9 = v4;
  objc_msgSend(v8, "ded_selectItemsPassingTest:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __48__FBKBugForm_draftResponsesContentItemsForTeam___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "itemType") == 1)
  {
    objc_msgSend(v3, "singleTeam");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)requiresPreview
{
  return -[FBKBugForm role](self, "role") == 0;
}

- (BOOL)matchesFormStubSignature:(id)a3
{
  id v4;
  NSObject *v5;
  char v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;

  v4 = a3;
  +[FBKLog model](FBKLog, "model");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FBKBugForm matchesFormStubSignature:].cold.2(self, v4, v5);

  if (-[FBKBugForm role](self, "role") == 1)
  {
    v6 = 1;
  }
  else
  {
    if (v4)
    {
      objc_msgSend(v4, "signature");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[FBKBugForm signature](self, "signature");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7)
      {
        objc_msgSend(v4, "signature");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[NSObject isEqualToString:](v9, "isEqualToString:", v10);

      }
      else
      {
        v6 = v8 == 0;
      }
    }
    else
    {
      +[FBKLog model](FBKLog, "model");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[FBKBugForm matchesFormStubSignature:].cold.1(self, v9);
      v6 = 1;
    }

  }
  return v6;
}

- (id)signatureDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[FBKManagedFeedbackObject ID](self, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");
  -[FBKBugForm signature](self, "signature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("BugForm [%i] <%@>"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)collectsFiles
{
  return -[FBKBugForm role](self, "role") != 1;
}

- (NSNumber)boxedFormRole
{
  return self->boxedFormRole;
}

- (void)setBoxedFormRole:(id)a3
{
  objc_storeStrong((id *)&self->boxedFormRole, a3);
}

- (NSString)cachedAnnouncementHTML
{
  return self->cachedAnnouncementHTML;
}

- (void)setCachedAnnouncementHTML:(id)a3
{
  objc_storeStrong((id *)&self->cachedAnnouncementHTML, a3);
}

- (NSURL)announcementTempFile
{
  return (NSURL *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAnnouncementTempFile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)generatingTemp
{
  return self->generatingTemp;
}

- (void)setGeneratingTemp:(BOOL)a3
{
  self->generatingTemp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->announcementTempFile, 0);
  objc_storeStrong((id *)&self->cachedAnnouncementHTML, 0);
  objc_storeStrong((id *)&self->boxedFormRole, 0);
}

- (id)issueAreaDisplayNameForKeyword:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKBugForm questionWithRole:](self, "questionWithRole:", CFSTR(":area"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v5, "allChoices", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqual:", v4);

          if ((v13 & 1) != 0)
          {
            objc_msgSend(v11, "title");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
        v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)feedbackTypeRank
{
  int64_t v2;

  v2 = -[FBKBugForm feedbackType](self, "feedbackType");
  if ((unint64_t)(v2 + 1) > 5)
    return &unk_24E18CC20;
  else
    return (id)qword_24E1596A8[v2 + 1];
}

- (id)localizedFeedbackTypeName
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;

  switch(-[FBKBugForm feedbackType](self, "feedbackType"))
  {
    case -1:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Other");
      goto LABEL_7;
    case 0:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Bug Report");
      goto LABEL_7;
    case 1:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Enhancement Request");
      goto LABEL_7;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Localization Feedback");
      goto LABEL_7;
    case 3:
    case 4:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Survey");
LABEL_7:
      objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24E15EAF8, CFSTR("CommonStrings"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v2;
  }
  return v2;
}

- (id)localizedFeedbackTypeShortName
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;

  switch(-[FBKBugForm feedbackType](self, "feedbackType"))
  {
    case -1:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Other");
      goto LABEL_7;
    case 0:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Bug");
      goto LABEL_7;
    case 1:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("ER");
      goto LABEL_7;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Loc");
      goto LABEL_7;
    case 3:
    case 4:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Survey");
LABEL_7:
      objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24E15EAF8, CFSTR("CommonStrings"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v2;
  }
  return v2;
}

- (void)updateResolvableQuestions
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  +[FBKLog appHandle](FBKLog, "appHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[FBKBugForm(FBKClientSideResolvers) updateResolvableQuestions].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

}

- (BOOL)canTakeForTeam:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[4];
  _DWORD v29[3];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[FBKBugForm isSurveyAvailable](self, "isSurveyAvailable"))
  {
    if ((-[FBKBugForm shouldRepeat](self, "shouldRepeat") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      -[FBKBugForm draftResponsesContentItemsForTeam:](self, "draftResponsesContentItemsForTeam:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKBugForm completedResponsesContentItemsForTeam:](self, "completedResponsesContentItemsForTeam:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
      {
        -[FBKBugForm repeatPer](self, "repeatPer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("build"));

        if (v9)
        {
          v5 = objc_msgSend(v7, "count") == 0;
        }
        else
        {
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v10 = v7;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
          if (v11)
          {
            v12 = v11;
            v22 = v7;
            v23 = v6;
            v13 = *(_QWORD *)v25;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v25 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "feedback");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = v15;
                if (v15)
                {
                  objc_msgSend(v15, "build");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  +[FBKSSharedConstants swVers](FBKSharedConstants, "swVers");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = objc_msgSend(v17, "caseInsensitiveCompare:", v18);

                  if (!v19)
                  {

                    v5 = 0;
                    goto LABEL_23;
                  }
                }
                else
                {
                  +[FBKLog appHandle](FBKLog, "appHandle");
                  v20 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                    -[FBKBugForm(Survey) canTakeForTeam:].cold.1(v28, self, v29, v20);

                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
            }
            while (v12);
            v5 = 1;
LABEL_23:
            v7 = v22;
            v6 = v23;
          }
          else
          {
            v5 = 1;
          }

        }
      }
      else
      {
        v5 = 1;
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isSurveyAvailable
{
  void *v2;
  char v3;

  -[FBKBugForm surveyContentItem](self, "surveyContentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSurveyAvailable");

  return v3;
}

- (id)surveyActionTextForTeam:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v12;
  uint64_t v13;

  v4 = a3;
  if (-[FBKBugForm isSurveyAvailable](self, "isSurveyAvailable"))
  {
    if (-[FBKBugForm canTakeForTeam:](self, "canTakeForTeam:", v4))
    {
      -[FBKBugForm draftResponsesContentItemsForTeam:](self, "draftResponsesContentItemsForTeam:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (v6)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("SURVEY_CONTINUE_BUTTON");
      }
      else
      {
        -[FBKBugForm completedResponsesContentItemsForTeam:](self, "completedResponsesContentItemsForTeam:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v13)
          v9 = CFSTR("SURVEY_TAKE_AGAIN_BUTTON");
        else
          v9 = CFSTR("SURVEY_TAKE_BUTTON");
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("SURVEY_COMPLETED");
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("SURVEY_CLOSED");
  }
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24E15EAF8, CFSTR("CommonStrings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)surveyAnnouncementHTML
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (surveyAnnouncementHTML_onceToken != -1)
    dispatch_once(&surveyAnnouncementHTML_onceToken, &__block_literal_global_200);
  -[FBKBugForm cachedAnnouncementHTML](self, "cachedAnnouncementHTML");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[FBKBugForm cachedAnnouncementHTML](self, "cachedAnnouncementHTML"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v4,
        !v6))
  {
    -[FBKBugForm text](self, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "rangeOfString:options:", CFSTR("<html>"), 1);

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = (void *)surveyAnnouncementHTML__announcementTemplate;
      -[FBKBugForm text](self, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{{ANNOUNCEMENT_CONTENT}}"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKBugForm setCachedAnnouncementHTML:](self, "setCachedAnnouncementHTML:", v11);

      -[FBKBugForm cachedAnnouncementHTML](self, "cachedAnnouncementHTML");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("target=\"_blank\"), &stru_24E15EAF8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKBugForm setCachedAnnouncementHTML:](self, "setCachedAnnouncementHTML:", v13);

    }
    else
    {
      -[FBKBugForm text](self, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKBugForm setCachedAnnouncementHTML:](self, "setCachedAnnouncementHTML:", v12);
    }

  }
  -[FBKBugForm cachedAnnouncementHTML](self, "cachedAnnouncementHTML");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

void __44__FBKBugForm_Survey__surveyAnnouncementHTML__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("AnnouncementContent"), CFSTR("html"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v1, 4, &v6);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v6;
  v4 = (void *)surveyAnnouncementHTML__announcementTemplate;
  surveyAnnouncementHTML__announcementTemplate = v2;

  if (v3)
  {
    v5 = (void *)surveyAnnouncementHTML__announcementTemplate;
    surveyAnnouncementHTML__announcementTemplate = (uint64_t)&stru_24E15EAF8;

  }
}

- (NSURL)cachedAnnouncementFile
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  FBKBugForm *v14;

  -[FBKBugForm announcementTempFile](self, "announcementTempFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if (!-[FBKBugForm generatingTemp](self, "generatingTemp"))
  {
    -[FBKBugForm setGeneratingTemp:](self, "setGeneratingTemp:", 1);
    -[FBKBugForm fullAnnouncementHTML](self, "fullAnnouncementHTML");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    dispatch_get_global_queue(-32768, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __44__FBKBugForm_Survey__cachedAnnouncementFile__block_invoke;
    v12 = &unk_24E157020;
    v13 = v5;
    v14 = self;
    v7 = v5;
    dispatch_async(v6, &v9);

  }
  -[FBKBugForm announcementTempFile](self, "announcementTempFile", v9, v10, v11, v12);
  return (NSURL *)(id)objc_claimAutoreleasedReturnValue();
}

void __44__FBKBugForm_Survey__cachedAnnouncementFile__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v12;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.html"), v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDBCF48];
  NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "writeToURL:atomically:", v8, 1);

  if ((_DWORD)v7)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__FBKBugForm_Survey__cachedAnnouncementFile__block_invoke_2;
    block[3] = &unk_24E157020;
    block[4] = *(_QWORD *)(a1 + 40);
    v12 = v8;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __44__FBKBugForm_Survey__cachedAnnouncementFile__block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setAnnouncementTempFile:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "setGeneratingTemp:", 0);
}

- (NSString)fullAnnouncementHTML
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  if (fullAnnouncementHTML_onceToken != -1)
    dispatch_once(&fullAnnouncementHTML_onceToken, &__block_literal_global_215);
  -[FBKBugForm cachedAnnouncementHTML](self, "cachedAnnouncementHTML");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[FBKBugForm cachedAnnouncementHTML](self, "cachedAnnouncementHTML"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v4,
        v6))
  {
    -[FBKBugForm cachedAnnouncementHTML](self, "cachedAnnouncementHTML");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FBKBugForm text](self, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "rangeOfString:options:", CFSTR("<html>"), 1);

    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = (void *)fullAnnouncementHTML__announcementTemplate;
      -[FBKBugForm text](self, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{{ANNOUNCEMENT_CONTENT}}"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKBugForm setCachedAnnouncementHTML:](self, "setCachedAnnouncementHTML:", v12);

      -[FBKBugForm cachedAnnouncementHTML](self, "cachedAnnouncementHTML");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("target=\"_blank\"), &stru_24E15EAF8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKBugForm setCachedAnnouncementHTML:](self, "setCachedAnnouncementHTML:", v14);

    }
    else
    {
      -[FBKBugForm text](self, "text");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKBugForm setCachedAnnouncementHTML:](self, "setCachedAnnouncementHTML:", v13);
    }

    v15 = (void *)MEMORY[0x24BDD17C8];
    +[FBKSharedConstants darkModeCSS](FBKSharedConstants, "darkModeCSS");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@</style>"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[FBKBugForm cachedAnnouncementHTML](self, "cachedAnnouncementHTML");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" </style>"), v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKBugForm setCachedAnnouncementHTML:](self, "setCachedAnnouncementHTML:", v19);

    -[FBKBugForm cachedAnnouncementHTML](self, "cachedAnnouncementHTML");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v7;
}

void __42__FBKBugForm_Survey__fullAnnouncementHTML__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("AnnouncementContent"), CFSTR("html"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v1, 4, &v6);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v6;
  v4 = (void *)fullAnnouncementHTML__announcementTemplate;
  fullAnnouncementHTML__announcementTemplate = v2;

  if (v3)
  {
    v5 = (void *)fullAnnouncementHTML__announcementTemplate;
    fullAnnouncementHTML__announcementTemplate = (uint64_t)&stru_24E15EAF8;

  }
}

- (void)setPropertiesFromJSONObject:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 67109120;
  v4[1] = objc_msgSend(v3, "intValue");
  _os_log_error_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_ERROR, "no question_groups for form [%i]", (uint8_t *)v4, 8u);

}

- (void)setPropertiesFromJSONObject:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21D9A9000, a1, a3, "bug form has unsupported platform value", a5, a6, a7, a8, 0);
}

- (void)matchesFormStubSignature:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "signatureDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_ERROR, "Given form stub is nil, cannot compare signatures on [%{public}@]", (uint8_t *)&v4, 0xCu);

}

- (void)matchesFormStubSignature:(NSObject *)a3 .cold.2(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");
  objc_msgSend(a1, "signature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "signature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 67109634;
  v10[1] = v7;
  v11 = 2114;
  v12 = v8;
  v13 = 2114;
  v14 = v9;
  _os_log_debug_impl(&dword_21D9A9000, a3, OS_LOG_TYPE_DEBUG, "Comparing Form [%i] signature: [%{public}@] to [%{public}@]", (uint8_t *)v10, 0x1Cu);

}

@end
