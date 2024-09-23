@implementation AXAuditCategoryResult

- (AXAuditCategoryResult)init
{
  AXAuditCategoryResult *v2;
  uint64_t v3;
  NSMutableString *mutableLog;
  uint64_t v5;
  NSMutableArray *mutableCases;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXAuditCategoryResult;
  v2 = -[AXAuditCategoryResult init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    mutableLog = v2->__mutableLog;
    v2->__mutableLog = (NSMutableString *)v3;

    v5 = objc_opt_new();
    mutableCases = v2->__mutableCases;
    v2->__mutableCases = (NSMutableArray *)v5;

  }
  return v2;
}

- (void)addCaseResult:(id)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    v5 = a3;
    -[AXAuditCategoryResult _mutableCases](self, "_mutableCases");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    objc_msgSend(v5, "setResult:", self);
  }
}

- (NSArray)caseResults
{
  void *v2;
  void *v3;

  -[AXAuditCategoryResult _mutableCases](self, "_mutableCases");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)appendLog:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = (objc_class *)MEMORY[0x24BDD17C8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v10);

  objc_msgSend(v6, "axAuditStringForLog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXAuditCategoryResult delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "auditCategoryResult:didAppendLogWithMessage:", self, v7);

  -[AXAuditCategoryResult _mutableLog](self, "_mutableLog");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v7);

}

- (id)log
{
  void *v2;
  void *v3;

  -[AXAuditCategoryResult _mutableLog](self, "_mutableLog");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (int64_t)issueCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[AXAuditCategoryResult _mutableCases](self, "_mutableCases", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "auditIssues");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 += objc_msgSend(v8, "count");

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)allIssues
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[AXAuditCategoryResult _mutableCases](self, "_mutableCases");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v9, "auditIssues", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14++));
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  v15 = (void *)objc_msgSend(v3, "copy");
  return v15;
}

- (id)issueSummaryStrings
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[AXAuditCategoryResult _mutableCases](self, "_mutableCases");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v9, "auditIssues", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "foundLogMessage");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v15, "length"))
                objc_msgSend(v3, "addObject:", v15);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  v16 = (void *)objc_msgSend(v3, "copy");
  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[AXAuditCategoryResult issueSummaryStrings](self, "issueSummaryStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v12.receiver = self;
  v12.super_class = (Class)AXAuditCategoryResult;
  -[AXAuditCategoryResult description](&v12, sel_description);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (AXAuditCategoryResultDelegate)delegate
{
  return (AXAuditCategoryResultDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSMutableArray)_mutableCases
{
  return self->__mutableCases;
}

- (void)set_mutableCases:(id)a3
{
  objc_storeStrong((id *)&self->__mutableCases, a3);
}

- (NSMutableString)_mutableLog
{
  return self->__mutableLog;
}

- (void)set_mutableLog:(id)a3
{
  objc_storeStrong((id *)&self->__mutableLog, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__mutableLog, 0);
  objc_storeStrong((id *)&self->__mutableCases, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
