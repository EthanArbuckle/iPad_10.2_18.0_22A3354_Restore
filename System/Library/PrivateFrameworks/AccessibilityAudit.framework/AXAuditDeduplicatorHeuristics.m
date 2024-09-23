@implementation AXAuditDeduplicatorHeuristics

- (AXAuditDeduplicatorHeuristics)init
{
  AXAuditDeduplicatorHeuristics *v2;
  os_log_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXAuditDeduplicatorHeuristics;
  v2 = -[AXAuditDeduplicatorHeuristics init](&v6, sel_init);
  if (v2)
  {
    v3 = os_log_create("AXAuditDeduplicator", "Heuristics");
    -[AXAuditDeduplicatorHeuristics setLog:](v2, "setLog:", v3);

    -[AXAuditDeduplicatorHeuristics setTargetThreshold:](v2, "setTargetThreshold:", 0.4);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXAuditDeduplicatorHeuristics setHashGroups:](v2, "setHashGroups:", v4);

  }
  return v2;
}

- (BOOL)compareIssues:(id)a3 and:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  BOOL v34;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "issueClassification");
  if (v7 != objc_msgSend(v6, "issueClassification"))
    goto LABEL_18;
  objc_msgSend(v5, "auditTestType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("testTypeNone")))
  {

  }
  else
  {
    objc_msgSend(v6, "auditTestType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("testTypeNone"));

    if ((v10 & 1) != 0)
      goto LABEL_18;
    objc_msgSend(v5, "auditTestType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "auditTestType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if (!v13)
      goto LABEL_18;
    objc_msgSend(v5, "elementText");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(v6, "elementText");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        objc_msgSend(v5, "elementText");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "elementText");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToString:", v19);

        if (!v20)
          goto LABEL_18;
      }
      else
      {

      }
    }
    objc_msgSend(v5, "elementDescription");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      objc_msgSend(v6, "elementDescription");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = (void *)v23;
        objc_msgSend(v5, "elementDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "elementDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v25, "isEqualToString:", v26);

        if (!v27)
          goto LABEL_18;
      }
      else
      {

      }
    }
    objc_msgSend(v5, "elementRect");
    v29 = v28;
    objc_msgSend(v6, "elementRect");
    if (vabdd_f64(v29, v30) <= 5.0)
    {
      objc_msgSend(v5, "elementRect");
      v32 = v31;
      objc_msgSend(v6, "elementRect");
      if (vabdd_f64(v32, v33) <= 5.0)
      {
        v34 = 1;
        goto LABEL_19;
      }
    }
  }
LABEL_18:
  v34 = 0;
LABEL_19:

  return v34;
}

- (int)deduplicateIssues:(id)a3 forFeatureHashGroup:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v20;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v22 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v22, "issues");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v24;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v24 != v16)
                objc_enumerationMutation(v13);
              if (-[AXAuditDeduplicatorHeuristics compareIssues:and:](self, "compareIssues:and:", v12, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j)))
              {

                objc_msgSend(v12, "setIsDuplicate:", 1);
                ++v9;
                goto LABEL_16;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            if (v15)
              continue;
            break;
          }
        }

        objc_msgSend(v20, "addObject:", v12);
LABEL_16:
        ;
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  objc_msgSend(v22, "issues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", v20);

  return v9;
}

- (void)setPlatformThreshold:(id)a3
{
  id v4;
  double v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "localizedCaseInsensitiveContainsString:", CFSTR("AppleTV")) & 1) != 0)
  {
    v5 = 0.45;
  }
  else if ((objc_msgSend(v4, "localizedCaseInsensitiveContainsString:", CFSTR("Watch")) & 1) != 0)
  {
    v5 = 0.648;
  }
  else
  {
    v5 = 0.4;
    if ((objc_msgSend(v4, "localizedCaseInsensitiveContainsString:", CFSTR("iPhone")) & 1) == 0
      && (objc_msgSend(v4, "localizedCaseInsensitiveContainsString:", CFSTR("iPad")) & 1) == 0
      && (objc_msgSend(v4, "localizedCaseInsensitiveContainsString:", CFSTR("iPod")) & 1) == 0)
    {
      if (objc_msgSend(v4, "localizedCaseInsensitiveContainsString:", CFSTR("RealityDevice")))
        v5 = 0.4;
      else
        v5 = 0.25;
    }
  }
  -[AXAuditDeduplicatorHeuristics setTargetThreshold:](self, "setTargetThreshold:", v5);
  -[AXAuditDeduplicatorHeuristics log](self, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[AXAuditDeduplicatorHeuristics targetThreshold](self, "targetThreshold");
    v8 = 134218242;
    v9 = v7;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_235CE3000, v6, OS_LOG_TYPE_DEFAULT, "Setting threshold to %fl for platform: %@", (uint8_t *)&v8, 0x16u);
  }

}

- (int)deduplicateIssues:(id)a3 onImage:(CGImage *)a4 forPlatform:(id)a5
{
  return -1;
}

- (NSMutableArray)hashGroups
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHashGroups:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (double)targetThreshold
{
  return self->_targetThreshold;
}

- (void)setTargetThreshold:(double)a3
{
  self->_targetThreshold = a3;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_hashGroups, 0);
}

@end
