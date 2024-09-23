@implementation BRUITestDiagnostic

- (BRUITestDiagnostic)initWithOutputDirectoryPath:(id)a3
{
  id v5;
  BRUITestDiagnostic *v6;
  BRUITestDiagnostic *v7;
  uint64_t v8;
  NSMutableDictionary *diagnosticDataBySectionName;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRUITestDiagnostic;
  v6 = -[BRUITestDiagnostic init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputDirectoryPath, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    diagnosticDataBySectionName = v7->_diagnosticDataBySectionName;
    v7->_diagnosticDataBySectionName = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (void)addDiagnosticData:(id)a3 forFilename:(id)a4
{
  -[BRUITestDiagnostic addDiagnosticData:forFilename:sectionName:](self, "addDiagnosticData:forFilename:sectionName:", a3, a4, 0);
}

- (void)addDiagnosticData:(id)a3 forFilename:(id)a4 sectionName:(id)a5
{
  id v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = (__CFString *)a5;
  if (v9)
    v10 = v9;
  else
    v10 = CFSTR("_kBRUITestDiagnosticDefaultSectionName");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_diagnosticDataBySectionName, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_diagnosticDataBySectionName, "setObject:forKeyedSubscript:", v11, v10);
  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v8);

}

- (BOOL)writeToDiskWithError:(id *)a3
{
  void *v5;
  NSString *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  NSString *v17;
  NSString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  BOOL v30;
  uint64_t v32;
  BRUITestDiagnostic *v33;
  uint64_t v34;
  uint64_t v35;
  NSMutableDictionary *v36;
  void *v37;
  NSString *v38;
  void *v39;
  id *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_outputDirectoryPath;
  v49 = 0;
  v39 = v5;
  v7 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v49);
  v8 = v49;
  v9 = v8;
  if ((v7 & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v8, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDD0B88]) & 1) == 0)
  {

LABEL_28:
    v30 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v9);
    goto LABEL_32;
  }
  v11 = objc_msgSend(v9, "code");

  if (v11 != 516)
    goto LABEL_28;
LABEL_4:
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v12 = self->_diagnosticDataBySectionName;
  v34 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v34)
  {
    v13 = *(_QWORD *)v46;
    v40 = a3;
    v37 = v9;
    v38 = v6;
    v32 = *(_QWORD *)v46;
    v33 = self;
    v36 = v12;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v46 != v13)
          objc_enumerationMutation(v12);
        v35 = v14;
        v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v14);
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("_kBRUITestDiagnosticDefaultSectionName"));
        if (v16)
        {
          v17 = v6;
        }
        else
        {
          -[NSString stringByAppendingPathComponent:](v6, "stringByAppendingPathComponent:", v15);
          v17 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        v18 = v17;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_diagnosticDataBySectionName, "objectForKeyedSubscript:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v20 = v19;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        if (v21)
        {
          v22 = v21;
          v23 = 0;
          v24 = *(_QWORD *)v42;
          while (2)
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v42 != v24)
                objc_enumerationMutation(v20);
              v26 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
              if (((v16 | v23) & 1) == 0)
              {
                if (!objc_msgSend(v39, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v18, 0, 0, a3))goto LABEL_26;
                v23 = 1;
                a3 = v40;
              }
              objc_msgSend(v20, "objectForKeyedSubscript:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSString stringByAppendingPathComponent:](v18, "stringByAppendingPathComponent:", v26);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v27, "writeToFile:options:error:", v28, 1, a3);

              if (!v29)
              {
LABEL_26:

                v30 = 0;
                v9 = v37;
                v6 = v38;
                v12 = v36;
                goto LABEL_31;
              }
              a3 = v40;
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
            if (v22)
              continue;
            break;
          }
        }

        v14 = v35 + 1;
        v9 = v37;
        v6 = v38;
        v13 = v32;
        self = v33;
        v12 = v36;
      }
      while (v35 + 1 != v34);
      v30 = 1;
      v34 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v34);
  }
  else
  {
    v30 = 1;
  }
LABEL_31:

LABEL_32:
  return v30;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticDataBySectionName, 0);
  objc_storeStrong((id *)&self->_outputDirectoryPath, 0);
}

@end
