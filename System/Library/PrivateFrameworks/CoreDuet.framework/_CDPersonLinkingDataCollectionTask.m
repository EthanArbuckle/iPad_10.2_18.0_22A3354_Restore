@implementation _CDPersonLinkingDataCollectionTask

- (_CDPersonLinkingDataCollectionTask)initWithFile:(id)a3 activity:(id)a4
{
  id v7;
  id v8;
  _CDPersonLinkingDataCollectionTask *v9;
  _CDPersonLinkingDataCollectionTask *v10;
  uint64_t v11;
  PersonLinkingLinkedPairEvent *event;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_CDPersonLinkingDataCollectionTask;
  v9 = -[_CDPersonLinkingDataCollectionTask init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_file, a3);
    -[_CDPersonLinkingDataCollectionTask eventFromFile:](v10, "eventFromFile:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    event = v10->_event;
    v10->_event = (PersonLinkingLinkedPairEvent *)v11;

    objc_storeStrong((id *)&v10->_activity, a4);
  }

  return v10;
}

- (id)eventFromDict:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  id obj;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("userID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v4;
  objc_msgSend(v4, "setUserID:", v5);

  v27 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v23 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pairs"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v28)
  {
    v26 = *(_QWORD *)v30;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v30 != v26)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v6);
        v8 = (void *)objc_opt_new();
        v9 = (void *)objc_opt_new();
        v10 = (void *)objc_opt_new();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sourcePerson"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setName:", v12);

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sourcePerson"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("emails"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setEmails:", v14);

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("targetPerson"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("name"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setName:", v16);

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("targetPerson"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("emails"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setEmails:", v18);

        objc_msgSend(v8, "setSourcePerson:", v9);
        objc_msgSend(v8, "setTargetPerson:", v10);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("grade"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setGrade:", objc_msgSend(v19, "BOOLValue"));

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("confidence"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "floatValue");
        objc_msgSend(v8, "setConfidence:");

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("reason"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setReason:", v21);

        objc_msgSend(v27, "addObject:", v8);
        ++v6;
      }
      while (v28 != v6);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v28);
  }

  objc_msgSend(v24, "setPairs:", v27);
  return v24;
}

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[objc_class sharedInstance](getPETEventTracker2Class(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_event)
  {
    v6 = v3;
    objc_msgSend(v3, "logMessage:");
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDPersonLinkingDataCollectionTask file](self, "file");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeItemAtPath:error:", v5, 0);

    v3 = v6;
  }

}

- (id)eventFromFile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v12;
  id v13;

  v4 = a3;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v4, 2, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (v6)
  {
    +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_CDPersonLinkingDataCollectionTask eventFromFile:].cold.2((uint64_t)v4, (uint64_t)v6, v7);
    v8 = 0;
  }
  else
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v7)
    {
      +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_CDPersonLinkingDataCollectionTask eventFromFile:].cold.1((uint64_t)v7, v10);

      v8 = 0;
    }
    else
    {
      -[_CDPersonLinkingDataCollectionTask eventFromDict:](self, "eventFromDict:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v8;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (NSString)file
{
  return self->_file;
}

- (PersonLinkingLinkedPairEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (void)eventFromFile:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_ERROR, "Error unarchiving person linking data: %@", (uint8_t *)&v2, 0xCu);
}

- (void)eventFromFile:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_18DDBE000, log, OS_LOG_TYPE_ERROR, "Error reading person linking data from file %@: %@", (uint8_t *)&v3, 0x16u);
}

@end
