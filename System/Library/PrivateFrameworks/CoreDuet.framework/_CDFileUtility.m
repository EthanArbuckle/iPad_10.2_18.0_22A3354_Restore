@implementation _CDFileUtility

- (_CDFileUtility)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CDFileUtility;
  return -[_CDFileUtility init](&v3, sel_init);
}

- (id)fileHandlerUtiity:(void *)a3 withBundleId:(void *)a4 withMetaData:
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
  {
    v21 = 0;
    goto LABEL_18;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v7, "stream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[_CDFileUtility fileHandlerUtiity:withBundleId:withMetaData:].cold.1(v20);

    v21 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("eventStream"));
  objc_msgSend(v7, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v13, "timeIntervalSince1970");
    objc_msgSend(v15, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("startDate"));

    if (v14)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("null"), CFSTR("endDate"));
    goto LABEL_12;
  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("null"), CFSTR("startDate"));
  if (!v14)
    goto LABEL_11;
LABEL_5:
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v14, "timeIntervalSince1970");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("endDate"));

  if (!v13)
  {
LABEL_12:
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("null"), CFSTR("duration"));
    goto LABEL_13;
  }
  objc_msgSend(v14, "timeIntervalSinceDate:", v13);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("duration"));

LABEL_13:
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("bundleID"));
  if (v9)
  {
    v22 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, CFSTR("metadata"));

  }
  else
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("null"), CFSTR("metadata"));
  }
  v21 = (void *)objc_msgSend(v10, "copy");

LABEL_17:
LABEL_18:

  return v21;
}

- (void)writeJSON:(void *)a3 withFileHandle:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;

  v5 = a3;
  if (a1)
  {
    v6 = (void *)MEMORY[0x1E0CB36D8];
    v7 = (void *)objc_msgSend(a2, "copy");
    v11 = 0;
    objc_msgSend(v6, "dataWithJSONObject:options:error:", v7, 0, &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;

    if (v9)
    {
      +[_CDLogging dataCollectionChannel](_CDLogging, "dataCollectionChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[_CDFileUtility writeJSON:withFileHandle:].cold.1((uint64_t)v9, v10);
    }
    else
    {
      objc_msgSend(v5, "writeData:", v8);
      objc_msgSend(CFSTR(","), "dataUsingEncoding:", 4);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "writeData:", v10);
    }

  }
}

- (void)fileHandlerUtiity:(os_log_t)log withBundleId:withMetaData:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18DDBE000, log, OS_LOG_TYPE_DEBUG, "Exiting because no eventStreamName found", v1, 2u);
}

- (void)writeJSON:(uint64_t)a1 withFileHandle:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_DEBUG, "Error serializing json data: %@", (uint8_t *)&v2, 0xCu);
}

@end
