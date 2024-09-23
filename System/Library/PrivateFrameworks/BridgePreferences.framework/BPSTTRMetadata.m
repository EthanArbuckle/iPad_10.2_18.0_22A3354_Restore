@implementation BPSTTRMetadata

- (BPSTTRMetadata)init
{
  BPSTTRMetadata *v2;
  BPSTTRMetadata *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BPSTTRMetadata;
  v2 = -[BPSTTRMetadata init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BPSTTRMetadata setComponentID:](v2, "setComponentID:", -1);
  return v3;
}

- (BPSTTRMetadata)initWithComponent:(unint64_t)a3
{
  BPSTTRMetadata *v4;
  BPSTTRMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BPSTTRMetadata;
  v4 = -[BPSTTRMetadata init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[BPSTTRMetadata _setComponentValuesFromComponent:](v4, "_setComponentValuesFromComponent:", a3);
  return v5;
}

- (BPSTTRMetadata)initWithComponentName:(id)a3 componentVersion:(id)a4 componentID:(int64_t)a5
{
  id v8;
  id v9;
  BPSTTRMetadata *v10;
  BPSTTRMetadata *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BPSTTRMetadata;
  v10 = -[BPSTTRMetadata init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[BPSTTRMetadata setComponentName:](v10, "setComponentName:", v8);
    -[BPSTTRMetadata setComponentVersion:](v11, "setComponentVersion:", v9);
    -[BPSTTRMetadata setComponentID:](v11, "setComponentID:", a5);
  }

  return v11;
}

- (void)_setComponentValuesFromComponent:(unint64_t)a3
{
  const __CFString *v4;
  const __CFString *v5;
  NSObject *v6;
  uint8_t v7[16];

  switch(a3)
  {
    case 0uLL:
      goto LABEL_11;
    case 1uLL:
      -[BPSTTRMetadata setComponentID:](self, "setComponentID:", 1070638);
      -[BPSTTRMetadata setComponentName:](self, "setComponentName:", CFSTR("Watch Faces"));
      v4 = CFSTR("New Bugs");
      goto LABEL_6;
    case 2uLL:
      -[BPSTTRMetadata setComponentID:](self, "setComponentID:", 871848);
      v5 = CFSTR("HealthKit");
      goto LABEL_5;
    case 3uLL:
      -[BPSTTRMetadata setComponentID:](self, "setComponentID:", 547620);
      v5 = CFSTR("Phone App");
LABEL_5:
      -[BPSTTRMetadata setComponentName:](self, "setComponentName:", v5);
      v4 = CFSTR("watchOS");
LABEL_6:
      -[BPSTTRMetadata setComponentVersion:](self, "setComponentVersion:", v4);
      break;
    default:
      bps_setup_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_21147E000, v6, OS_LOG_TYPE_DEFAULT, "Error: Invalid BPSTTRMetadataComponent! Defaulting to Pepper Pairing | New Bugs", v7, 2u);
      }

LABEL_11:
      -[BPSTTRMetadata setComponentID:](self, "setComponentID:", 576381);
      -[BPSTTRMetadata setComponentName:](self, "setComponentName:", CFSTR("Pepper Pairing"));
      -[BPSTTRMetadata setComponentVersion:](self, "setComponentVersion:", CFSTR("New Bugs"));
      break;
  }
}

- (id)_parameters
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
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
  _QWORD v19[5];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x24BDAC8D0];
  -[BPSTTRMetadata componentName](self, "componentName");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_9;
  v4 = (void *)v3;
  -[BPSTTRMetadata componentVersion](self, "componentVersion");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

    goto LABEL_9;
  }
  v6 = (void *)v5;
  v7 = -[BPSTTRMetadata componentID](self, "componentID");

  if (v7 == -1)
  {
LABEL_9:
    v13 = (void *)MEMORY[0x24BDBD1B8];
    return v13;
  }
  v19[0] = CFSTR("ComponentName");
  -[BPSTTRMetadata componentName](self, "componentName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  v19[1] = CFSTR("ComponentVersion");
  -[BPSTTRMetadata componentVersion](self, "componentVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v9;
  v19[2] = CFSTR("ComponentID");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[BPSTTRMetadata componentID](self, "componentID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v11;
  v20[3] = CFSTR("Watch");
  v19[3] = CFSTR("DeviceClasses");
  v19[4] = CFSTR("Keywords");
  v20[4] = CFSTR("1210568");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  -[BPSTTRMetadata title](self, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[BPSTTRMetadata title](self, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("Title"));

  }
  -[BPSTTRMetadata radarDescription](self, "radarDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[BPSTTRMetadata radarDescription](self, "radarDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v17, CFSTR("Description"));

  }
  return v13;
}

- (id)queryItems
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[BPSTTRMetadata _parameters](self, "_parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", v9, v10);
        objc_msgSend(v3, "addObject:", v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)setComponentName:(id)a3
{
  objc_storeStrong((id *)&self->_componentName, a3);
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (void)setComponentVersion:(id)a3
{
  objc_storeStrong((id *)&self->_componentVersion, a3);
}

- (int64_t)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(int64_t)a3
{
  self->_componentID = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (void)setRadarDescription:(id)a3
{
  objc_storeStrong((id *)&self->_radarDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
}

@end
