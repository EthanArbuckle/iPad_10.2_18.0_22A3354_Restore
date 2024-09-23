@implementation AUDeveloperSettingsDatabase

+ (id)sharedDatabase
{
  if (sharedDatabase_onceToken != -1)
    dispatch_once(&sharedDatabase_onceToken, &__block_literal_global_1);
  return (id)sharedDatabase_sharedDatabase;
}

void __45__AUDeveloperSettingsDatabase_sharedDatabase__block_invoke()
{
  AUDeveloperSettingsDatabase *v0;
  void *v1;

  v0 = objc_alloc_init(AUDeveloperSettingsDatabase);
  v1 = (void *)sharedDatabase_sharedDatabase;
  sharedDatabase_sharedDatabase = (uint64_t)v0;

}

- (AUDeveloperSettingsDatabase)init
{
  AUDeveloperSettingsDatabase *v2;
  os_log_t v3;
  OS_os_log *log;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AUDeveloperSettingsDatabase;
  v2 = -[AUDeveloperSettingsDatabase init](&v6, sel_init);
  if (v2)
  {
    v3 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.AUDeveloperSettings"), "UTF8String"), "default");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    -[AUDeveloperSettingsDatabase migrateExistingDefaults](v2, "migrateExistingDefaults");
  }
  return v2;
}

- (void)setAccessoriesDictionary:(id)a3
{
  id v4;
  NSObject *log;

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    -[AUDeveloperSettingsDatabase setAccessoriesDictionary:].cold.1((uint64_t)v4, log);
  objc_msgSend(MEMORY[0x24BDBCF50], "AUDeveloperSettingsSetObject:withKey:", v4, CFSTR("accessories"));

}

- (NSDictionary)accessoriesDictionary
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "AUDeveloperSettingsObjectWithKey:", CFSTR("accessories"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v3)
      goto LABEL_8;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[AUDeveloperSettingsDatabase accessoriesDictionary].cold.2();

  }
  v3 = objc_alloc_init(MEMORY[0x24BDBCE70]);
LABEL_8:
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    -[AUDeveloperSettingsDatabase accessoriesDictionary].cold.1();
  return (NSDictionary *)v3;
}

- (BOOL)isSeedParticipationEnabled:(id)a3
{
  return -[AUDeveloperSettingsDatabase urlLocationTypeForAccessory:](self, "urlLocationTypeForAccessory:", a3) == 3;
}

- (unint64_t)urlLocationTypeForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  -[AUDeveloperSettingsDatabase accessoriesDictionary](self, "accessoriesDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("assetLocation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = AUDeveloperSettingsURLStringToType(v7);

  return v8;
}

- (void)updateAccessory:(id)a3 locationType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *log;
  NSObject *v12;
  const char *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[AUDeveloperSettingsDatabase isValidLocationType:](self, "isValidLocationType:", a4))
  {
    -[AUDeveloperSettingsDatabase accessoriesDictionary](self, "accessoriesDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", AUDeveloperSettingsURLTypeToString(a4));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("assetLocation"));

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v12 = log;
      v13 = AUDeveloperSettingsURLTypeToString(a4);
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136315650;
      v17 = "-[AUDeveloperSettingsDatabase updateAccessory:locationType:]";
      v18 = 2080;
      v19 = v13;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_235CB2000, v12, OS_LOG_TYPE_DEFAULT, "%s: Updating location = %s for accessoryName = %@", (uint8_t *)&v16, 0x20u);

    }
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AUDeveloperSettingsDatabase addAccessoryWithSerialNumber:info:](self, "addAccessoryWithSerialNumber:info:", v6, v15);

  }
}

- (void)addAccessoryWithSerialNumber:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *log;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[AUDeveloperSettingsDatabase accessoriesDictionary](self, "accessoriesDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v6);
    -[AUDeveloperSettingsDatabase setAccessoriesDictionary:](self, "setAccessoriesDictionary:", v9);

  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315394;
      v12 = "-[AUDeveloperSettingsDatabase addAccessoryWithSerialNumber:info:]";
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_235CB2000, log, OS_LOG_TYPE_DEFAULT, "%s: Not adding empty serial number with info = %@", (uint8_t *)&v11, 0x16u);
    }
  }

}

- (void)removeAccessoryWithSerialNumber:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AUDeveloperSettingsDatabase accessoriesDictionary](self, "accessoriesDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeObjectForKey:", v4);
  -[AUDeveloperSettingsDatabase setAccessoriesDictionary:](self, "setAccessoriesDictionary:", v6);

}

- (BOOL)isValidLocationType:(unint64_t)a3
{
  return a3 < 7;
}

- (void)migrateExistingDefaults
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  id v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id v24;
  unint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[AUDeveloperSettingsDatabase seedParticipationDictionary](self, "seedParticipationDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  if (objc_msgSend(v3, "count"))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v21 = v3;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            v24 = 0;
            v25 = 4;
            v23 = 0;
            -[AUDeveloperSettingsDatabase accessoryNameForIdentifier:name:serialNumber:fusingType:](self, "accessoryNameForIdentifier:name:serialNumber:fusingType:", v9, &v24, &v23, &v25);
            v12 = v24;
            v13 = v23;
            if (v13)
            {
              -[AUDeveloperSettingsDatabase accessoriesDictionary](self, "accessoriesDictionary");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "allKeys");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "containsObject:", v13);

              if ((v16 & 1) == 0)
              {
                objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "objectForKeyedSubscript:", v9);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("assetLocation"));

                if (v12)
                  objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, CFSTR("name"));
                if (v25 <= 2)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", AUDeveloperSettingsAccessoryFusingTypeToString(v25));
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("fusing"));

                }
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v17);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[AUDeveloperSettingsDatabase addAccessoryWithSerialNumber:info:](self, "addAccessoryWithSerialNumber:info:", v13, v20);

              }
            }

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v6);
    }

    v3 = v21;
  }

}

- (id)seedParticipationDictionary
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "AUDeveloperSettingsObjectWithKey:", CFSTR("seedParticipation"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    -[AUDeveloperSettingsDatabase seedParticipationDictionary].cold.1();
  return v3;
}

- (void)accessoryNameForIdentifier:(id)a3 name:(id *)a4 serialNumber:(id *)a5 fusingType:(unint64_t *)a6
{
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("+"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v14, "count") == 3;
  v10 = v14;
  if (v9)
  {
    if (a6)
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *a6 = AUDeveloperSettingsAccessoryFusingStringToType(v11);

    }
    if (a5)
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *a5 = (id)objc_msgSend(v12, "copy");

    }
    v10 = v14;
    if (a4)
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v13, "copy");

      v10 = v14;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)setAccessoriesDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 136315650;
  v3 = "-[AUDeveloperSettingsDatabase setAccessoriesDictionary:]";
  v4 = 2112;
  v5 = CFSTR("accessories");
  v6 = 2112;
  v7 = a1;
  _os_log_debug_impl(&dword_235CB2000, a2, OS_LOG_TYPE_DEBUG, "%s: seting %@:%@", (uint8_t *)&v2, 0x20u);
}

- (void)accessoriesDictionary
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_235CB2000, v0, OS_LOG_TYPE_ERROR, "%s: received unknown object = %@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)seedParticipationDictionary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_235CB2000, v0, v1, "%s: dictionary = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
