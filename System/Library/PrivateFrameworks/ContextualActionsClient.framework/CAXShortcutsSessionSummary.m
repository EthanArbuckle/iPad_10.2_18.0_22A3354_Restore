@implementation CAXShortcutsSessionSummary

- (CAXShortcutsSessionSummary)initWithActions:(id)a3 sessionIdentifier:(id)a4
{
  id v7;
  id v8;
  CAXShortcutsSessionSummary *v9;
  CAXShortcutsSessionSummary *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAXShortcutsSessionSummary;
  v9 = -[CAXShortcutsSessionSummary init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actions, a3);
    objc_storeStrong((id *)&v10->_sessionIdentifier, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x24BDD1540]);
      v21 = *MEMORY[0x24BDD0FC8];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CAXShortcutsSessionSummary actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("codingKeyForActions"));

  -[CAXShortcutsSessionSummary sessionIdentifier](self, "sessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CAXShortcutsSessionSummary sessionIdentifier](self, "sessionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("codingKeyForSessionId"));

  }
}

- (CAXShortcutsSessionSummary)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  CAXShortcutsSessionSummary *v20;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BE7A630];
  v6 = (void *)MEMORY[0x219A31BB4]();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v6);
  __atxlog_handle_contextual_actions();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v7, CFSTR("codingKeyForSessionId"), v4, 1, CFSTR("com.apple.proactive.decode.CAXShorctutsSessionSummar"), -1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BE7A630];
  v11 = (void *)MEMORY[0x219A31BB4]();
  v12 = objc_alloc(MEMORY[0x24BDBCF20]);
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = (void *)objc_msgSend(v12, "initWithObjects:", v13, v14, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v11);
  __atxlog_handle_contextual_actions();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v15, CFSTR("codingKeyForActions"), v4, 1, CFSTR("com.apple.proactive.decode.CAXShorctutsSessionSummar"), -1, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    __atxlog_handle_contextual_actions();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[CAXShortcutsSessionSummary initWithCoder:].cold.1(v4, v19);

    v20 = 0;
  }
  else
  {
    self = -[CAXShortcutsSessionSummary initWithActions:sessionIdentifier:](self, "initWithActions:sessionIdentifier:", v17, v9);
    v20 = self;
  }

  return v20;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSUUID)blendingCacheUpdateUUID
{
  return self->_blendingCacheUpdateUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendingCacheUpdateUUID, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

- (void)initWithCoder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_2196B3000, a2, OS_LOG_TYPE_ERROR, "init with coder failed for CAXShortcutsSessionSummary with error: %@", (uint8_t *)&v4, 0xCu);

}

@end
