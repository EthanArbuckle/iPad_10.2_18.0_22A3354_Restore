@implementation HDMCDeviceInfo

+ (id)localDeviceInfoWithSettingsManager:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = objc_msgSend(v4, "dayStreamProcessorAlgorithmVersion");
  v7 = objc_msgSend(v4, "menstruationNotificationsEnabled");
  v8 = objc_msgSend(v4, "fertileWindowNotificationsEnabled");

  return (id)objc_msgSend(v5, "initWithDayStreamProcessorAlgorithmVersion:menstruationNotificationsEnabled:fertileWindowNotificationsEnabled:", v6, v7, v8);
}

+ (id)deviceInfoFromStorageGroup:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  HDMCDeviceInfo *v21;
  void *v22;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v24 = a3;
  objc_msgSend(v24, "storageEntries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v4)
  {
    v6 = 0;
    v7 = 0;
    v25 = 0;
    goto LABEL_17;
  }
  v5 = v4;
  v6 = 0;
  v7 = 0;
  v25 = 0;
  v8 = *(_QWORD *)v27;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v27 != v8)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      objc_msgSend(v10, "key");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("DayStreamProcessorAlgorithmVersion"));

      if (v12)
      {
        objc_msgSend(v10, "numberValue:", 0);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v6;
        v6 = (void *)v13;
      }
      else
      {
        objc_msgSend(v10, "key");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("MenstruationNotificationsEnabled"));

        if (v16)
        {
          objc_msgSend(v10, "numberValue:", 0);
          v17 = objc_claimAutoreleasedReturnValue();
          v14 = v7;
          v7 = (void *)v17;
        }
        else
        {
          objc_msgSend(v10, "key");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("FertileWindowNotificationsEnabled"));

          if (!v19)
            continue;
          objc_msgSend(v10, "numberValue:", 0);
          v20 = objc_claimAutoreleasedReturnValue();
          v14 = v25;
          v25 = (void *)v20;
        }
      }

    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  }
  while (v5);
LABEL_17:

  v21 = 0;
  if (v6)
  {
    v22 = v25;
    if (v7 && v25)
      v21 = -[HDMCDeviceInfo initWithDayStreamProcessorAlgorithmVersion:menstruationNotificationsEnabled:fertileWindowNotificationsEnabled:]([HDMCDeviceInfo alloc], "initWithDayStreamProcessorAlgorithmVersion:menstruationNotificationsEnabled:fertileWindowNotificationsEnabled:", objc_msgSend(v6, "integerValue"), objc_msgSend(v7, "BOOLValue"), objc_msgSend(v25, "BOOLValue"));
  }
  else
  {
    v22 = v25;
  }

  return v21;
}

- (HDMCDeviceInfo)initWithDayStreamProcessorAlgorithmVersion:(int64_t)a3 menstruationNotificationsEnabled:(BOOL)a4 fertileWindowNotificationsEnabled:(BOOL)a5
{
  HDMCDeviceInfo *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HDMCDeviceInfo;
  result = -[HDMCDeviceInfo init](&v9, sel_init);
  if (result)
  {
    result->_dayStreamProcessorAlgorithmVersion = a3;
    result->_menstruationNotificationsEnabled = a4;
    result->_fertileWindowNotificationsEnabled = a5;
  }
  return result;
}

- (BOOL)someNotificationsEnabled
{
  return self->_menstruationNotificationsEnabled || self->_fertileWindowNotificationsEnabled;
}

- (BOOL)isEqual:(id)a3
{
  HDMCDeviceInfo *v4;
  HDMCDeviceInfo *v5;
  BOOL v6;

  v4 = (HDMCDeviceInfo *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = self->_dayStreamProcessorAlgorithmVersion == v5->_dayStreamProcessorAlgorithmVersion
        && self->_menstruationNotificationsEnabled == v5->_menstruationNotificationsEnabled
        && self->_fertileWindowNotificationsEnabled == v5->_fertileWindowNotificationsEnabled;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_dayStreamProcessorAlgorithmVersion ^ self->_menstruationNotificationsEnabled ^ self->_fertileWindowNotificationsEnabled;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_dayStreamProcessorAlgorithmVersion);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_menstruationNotificationsEnabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_fertileWindowNotificationsEnabled);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ alg:%@ periodNotifications:%@ fertileWindowNotifications:%@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)dayStreamProcessorAlgorithmVersion
{
  return self->_dayStreamProcessorAlgorithmVersion;
}

- (BOOL)menstruationNotificationsEnabled
{
  return self->_menstruationNotificationsEnabled;
}

- (BOOL)fertileWindowNotificationsEnabled
{
  return self->_fertileWindowNotificationsEnabled;
}

@end
