@implementation DEDAttachmentItem

+ (id)itemWithURL:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BE2C988];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithPathURL:", v5);

  if (v6)
  {
    objc_msgSend(a1, "itemWithDEItem:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)itemWithDictionary:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("displayName"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    stringIfNil(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDisplayName:", v6);

    v7 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attachedPath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURLWithPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAttachedPath:", v9);

    v10 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("modificationDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_dateWithString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setModificationDate:", v12);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("fileSize"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFileSize:", v13);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deviceID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeviceID:", v14);

  }
  return v4;
}

+ (id)itemWithDEItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (v4)
  {
    objc_msgSend(v3, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "displayName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDisplayName:", v6);
    }
    else
    {
      objc_msgSend(v3, "attachedPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDisplayName:", v7);

    }
    objc_msgSend(v3, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAttachedPath:", v8);

    objc_msgSend(v3, "modificationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setModificationDate:", v9);

    objc_msgSend(v3, "filesize");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFileSize:", v10);

    +[DEDDevice currentDevice](DEDDevice, "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeviceID:", v12);

  }
  return v4;
}

- (id)serialize
{
  void *v3;
  void *v4;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  __CFString *v19;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x24BDAC8D0];
  -[DEDAttachmentItem attachedPath](self, "attachedPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[DEDUtils sharedLog](DEDUtils, "sharedLog");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[DEDAttachmentItem serialize].cold.1(self, v5);

  }
  v20[0] = CFSTR("displayName");
  -[DEDAttachmentItem displayName](self, "displayName");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  v20[1] = CFSTR("attachedPath");
  -[DEDAttachmentItem attachedPath](self, "attachedPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "path");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v7;
  v20[2] = CFSTR("modificationDate");
  -[DEDAttachmentItem modificationDate](self, "modificationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serialize");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v10;
  v20[3] = CFSTR("fileSize");
  -[DEDAttachmentItem fileSize](self, "fileSize");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[DEDAttachmentItem fileSize](self, "fileSize");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = &unk_24D202C80;
  }
  v21[3] = v12;
  v20[4] = CFSTR("deviceID");
  -[DEDAttachmentItem deviceID](self, "deviceID");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  return v15;
}

- (BOOL)isLocal
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;

  -[DEDAttachmentItem deviceID](self, "deviceID");
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

  -[DEDAttachmentItem deviceID](self, "deviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "isEqualToString:", v6);

  return (char)v5;
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
  -[DEDAttachmentItem serialize](self, "serialize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (id)archivedClasses
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

- (NSString)deviceID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)modificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setModificationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)fileSize
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFileSize:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSURL)attachedPath
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAttachedPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachedPath, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

- (void)serialize
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_21469E000, a2, OS_LOG_TYPE_ERROR, "attachment item [%{public}@] has nil path", (uint8_t *)&v4, 0xCu);

}

@end
