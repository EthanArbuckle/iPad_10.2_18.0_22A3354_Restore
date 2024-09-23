@implementation DEDAttachmentGroup

+ (id)groupWithDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rootURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLWithPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRootURL:", v7);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("displayName"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    stringIfNil(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDisplayName:", v9);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("extensionID"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    stringIfNil(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExtensionID:", v11);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deviceID"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    stringIfNil(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeviceID:", v13);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attachmentItems"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attachmentItems"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = &unk_24D202C08;
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          +[DEDAttachmentItem itemWithDictionary:](DEDAttachmentItem, "itemWithDictionary:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), (_QWORD)v25);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v19);
    }

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAttachmentItems:", v23);

  }
  return v4;
}

+ (id)groupWithDEGroup:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  if (v7)
  {
    objc_msgSend(v5, "rootURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRootURL:", v8);

    objc_msgSend(v5, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v5, "displayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDisplayName:", v10);
    }
    else
    {
      objc_msgSend(v7, "rootURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDisplayName:", v11);

    }
    objc_msgSend(v7, "setExtensionID:", v6);
    +[DEDDevice currentDevice](DEDDevice, "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeviceID:", v13);

    v14 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v5, "attachmentItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayWithCapacity:", objc_msgSend(v15, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v5, "attachmentItems", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          +[DEDAttachmentItem itemWithDEItem:](DEDAttachmentItem, "itemWithDEItem:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v19);
    }

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttachmentItems:", v23);

  }
  return v7;
}

- (id)totalFileSize
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  -[DEDAttachmentGroup attachmentItems](self, "attachmentItems", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "fileSize");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 += objc_msgSend(v8, "integerValue");

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)archiveName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[DEDAttachmentGroup extensionID](self, "extensionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[DEDAttachmentGroup extensionID](self, "extensionID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.tar.gz"), v5);
  }
  else
  {
    -[DEDAttachmentGroup attachmentItems](self, "attachmentItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      -[DEDAttachmentGroup attachmentItems](self, "attachmentItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "attachedPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.tar.gz"), v5);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v24;
  __CFString *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[6];
  _QWORD v34[6];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[DEDAttachmentGroup attachmentItems](self, "attachmentItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[DEDAttachmentGroup attachmentItems](self, "attachmentItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v10), "serialize");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = CFSTR("rootURL");
  -[DEDAttachmentGroup rootURL](self, "rootURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "path");
  v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v26;
  v33[1] = CFSTR("displayName");
  -[DEDAttachmentGroup displayName](self, "displayName");
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v13;
  v33[2] = CFSTR("extensionID");
  -[DEDAttachmentGroup extensionID](self, "extensionID");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v15;
  v33[3] = CFSTR("deviceID");
  -[DEDAttachmentGroup deviceID](self, "deviceID");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v17;
  v33[4] = CFSTR("DEDExtensionID");
  -[DEDAttachmentGroup dedExtensionIdentifier](self, "dedExtensionIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringValue");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v19);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  v33[5] = CFSTR("attachmentItems");
  v22 = (void *)MEMORY[0x24BDBD1A8];
  if (v12)
    v22 = v12;
  v34[4] = v20;
  v34[5] = v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 6);
  v24 = (id)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (DEDExtensionIdentifier)dedExtensionIdentifier
{
  DEDExtensionIdentifier *dedExtensionIdentifier;
  DEDExtensionIdentifier *v4;
  void *v5;
  void *v6;
  DEDExtensionIdentifier *v7;
  DEDExtensionIdentifier *v8;

  dedExtensionIdentifier = self->_dedExtensionIdentifier;
  if (!dedExtensionIdentifier)
  {
    v4 = [DEDExtensionIdentifier alloc];
    -[DEDAttachmentGroup rootURL](self, "rootURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[DEDExtensionIdentifier initWithString:](v4, "initWithString:", v6);
    v8 = self->_dedExtensionIdentifier;
    self->_dedExtensionIdentifier = v7;

    dedExtensionIdentifier = self->_dedExtensionIdentifier;
  }
  return dedExtensionIdentifier;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDAttachmentGroup serialize](self, "serialize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isLocal
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;

  -[DEDAttachmentGroup deviceID](self, "deviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[DEDUtils sharedLog](DEDUtils, "sharedLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[DEDAttachmentGroup isLocal].cold.1(v4);

  }
  +[DEDDevice currentDevice](DEDDevice, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[DEDAttachmentGroup deviceID](self, "deviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "isEqualToString:", v6);

  return (char)v5;
}

+ (id)archivedClasses
{
  if (archivedClasses_onceToken != -1)
    dispatch_once(&archivedClasses_onceToken, &__block_literal_global);
  return (id)archivedClasses__outboundClasses;
}

void __37__DEDAttachmentGroup_archivedClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x24BDBCEF0];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[DEDAttachmentItem archivedClasses](DEDAttachmentItem, "archivedClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v2);

  +[DEDExtensionIdentifier archivedClasses](DEDExtensionIdentifier, "archivedClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v3);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v6);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)archivedClasses__outboundClasses;
  archivedClasses__outboundClasses = v4;

}

- (DEDBugSession)fromBugSession
{
  return (DEDBugSession *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFromBugSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)deviceID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSURL)rootURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRootURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)extensionID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExtensionID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)attachmentItems
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAttachmentItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setDedExtensionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_dedExtensionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dedExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_attachmentItems, 0);
  objc_storeStrong((id *)&self->_extensionID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_rootURL, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_fromBugSession, 0);
}

- (void)isLocal
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21469E000, log, OS_LOG_TYPE_ERROR, "could not determine isLocal because device ID is nil", v1, 2u);
}

@end
