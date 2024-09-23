@implementation DKCloudUploadResults

- (BOOL)success
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[DKCloudUploadResults syncResult](self, "syncResult");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[DKCloudUploadResults syncResult](self, "syncResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "success");

    if (!v6)
      return 0;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[DKCloudUploadResults backupResults](self, "backupResults", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "success"))
        {
          v12 = 0;
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_13:

  return v12;
}

- (NSArray)backupResults
{
  return self->_backupResults;
}

- (void)setBackupResults:(id)a3
{
  objc_storeStrong((id *)&self->_backupResults, a3);
}

- (DKCloudUploadResult)syncResult
{
  return self->_syncResult;
}

- (void)setSyncResult:(id)a3
{
  objc_storeStrong((id *)&self->_syncResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncResult, 0);
  objc_storeStrong((id *)&self->_backupResults, 0);
}

@end
