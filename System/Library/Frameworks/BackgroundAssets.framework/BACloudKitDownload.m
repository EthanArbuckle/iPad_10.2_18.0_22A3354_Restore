@implementation BACloudKitDownload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BACloudKitDownload)init
{
  BACloudKitDownload *result;
  int v3;
  const char *v4;

  result = (BACloudKitDownload *)os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
  if ((_DWORD)result)
  {
    v3 = 136315138;
    v4 = "BACloudKitDownload cannot be constructed using -init.";
    _os_log_fault_impl(&dword_21ABD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF BackgroundAssets: %s", (uint8_t *)&v3, 0xCu);
  }
  qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: BACloudKitDownload cannot be constructed using -init.";
  __break(1u);
  return result;
}

- (BACloudKitDownload)initWithIdentifier:(id)a3 recordType:(id)a4 recordName:(id)a5 assetKey:(id)a6 applicationGroupIdentifier:(id)a7
{
  return -[BACloudKitDownload initWithIdentifier:recordType:expectedFieldKey:expectedFieldValue:assetKey:applicationGroupIdentifier:](self, "initWithIdentifier:recordType:expectedFieldKey:expectedFieldValue:assetKey:applicationGroupIdentifier:", a3, a4, CFSTR("Name"), a5, a6, a7);
}

- (BACloudKitDownload)initWithIdentifier:(id)a3 recordType:(id)a4 expectedFieldKey:(id)a5 expectedFieldValue:(id)a6 assetKey:(id)a7 applicationGroupIdentifier:(id)a8
{
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  BACloudKitDownload *v23;
  void *v26;

  v13 = (void *)MEMORY[0x24BDB9030];
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  objc_msgSend(v13, "defaultContainer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "containerIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB91F0], "defaultRecordZone");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "zoneID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[BACloudKitDownload initWithIdentifier:recordType:expectedFieldKey:expectedFieldValue:assetKey:applicationGroupIdentifier:containerIdentifier:zoneID:databaseScope:priority:](self, "initWithIdentifier:recordType:expectedFieldKey:expectedFieldValue:assetKey:applicationGroupIdentifier:containerIdentifier:zoneID:databaseScope:priority:", v19, v18, v17, v16, v15, v14, v20, v22, 1, 0);

  return v23;
}

- (BACloudKitDownload)initWithIdentifier:(id)a3 recordType:(id)a4 expectedFieldKey:(id)a5 expectedFieldValue:(id)a6 assetKey:(id)a7 applicationGroupIdentifier:(id)a8 containerIdentifier:(id)a9 zoneID:(id)a10 databaseScope:(int64_t)a11 priority:(int64_t)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  BACloudKitDownload *v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  id v33;
  id v34;

  v34 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v19, "length"))
  {
    v29 = (void *)MEMORY[0x24BDBCE88];
    v30 = *MEMORY[0x24BDBCAB8];
    v31 = CFSTR("expectedFieldKey must be a valid string.");
LABEL_11:
    objc_msgSend(v29, "exceptionWithName:reason:userInfo:", v30, v31, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "raise");
    v28 = 0;
    goto LABEL_12;
  }
  if (!v20)
  {
    v29 = (void *)MEMORY[0x24BDBCE88];
    v30 = *MEMORY[0x24BDBCAB8];
    v31 = CFSTR("expectedFieldValue cannot be passed in as nil.");
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v29 = (void *)MEMORY[0x24BDBCE88];
            v30 = *MEMORY[0x24BDBCAB8];
            v31 = CFSTR("expectedFieldValue must be of type: NSString, NSNumber, NSDate, NSData, or NSArray.");
            goto LABEL_11;
          }
        }
      }
    }
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ == %%@"), v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v25, v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v18;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91B8]), "initWithRecordType:predicate:", v18, v26);
  self = (BACloudKitDownload *)-[BACloudKitDownload initWithIdentifier:query:assetKey:applicationGroupIdentifier:containerIdentifier:zoneID:databaseScope:priority:](self, v34, v27, v21, v22, v23, v24, a11, a12);

  v18 = v33;
  v28 = self;
LABEL_12:

  return v28;
}

- (id)initWithIdentifier:(void *)a3 query:(void *)a4 assetKey:(void *)a5 applicationGroupIdentifier:(void *)a6 containerIdentifier:(void *)a7 zoneID:(uint64_t)a8 databaseScope:(uint64_t)a9 priority:
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char isKindOfClass;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __SecTask *v28;
  __SecTask *v29;
  const __CFString *v30;
  const __CFString *v31;
  CFTypeID v32;
  uint64_t v33;
  void *v34;
  uint64_t v36;
  uint64_t v37;
  id v38;
  objc_super v39;

  v36 = a8;
  v15 = a2;
  v16 = a3;
  v17 = a4;
  v38 = a5;
  v18 = a6;
  v19 = a7;
  if (a1)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v21 = (_QWORD *)MEMORY[0x24BDBCAB8];
    if ((isKindOfClass & 1) == 0 || !objc_msgSend(v15, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *v21, CFSTR("NSString *  must be a valid unique string."), 0, v36);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "raise");

    }
    if ((objc_msgSend(v16, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *v21, CFSTR("Provided query must be a valid CKQuery."), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "raise");

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v17, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *v21, CFSTR("Provided assetKey must be a valid string."), 0, v36);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "raise");

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v18, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *v21, CFSTR("Provided containerIdentifier must be a valid string."), 0, v36);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "raise");

    }
    if ((objc_msgSend(v19, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *v21, CFSTR("Provided CKRecordZoneID must be a valid object."), 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "raise");

    }
    v39.receiver = a1;
    v39.super_class = (Class)BACloudKitDownload;
    v27 = v38;
    a1 = objc_msgSendSuper2(&v39, sel_initPrivatelyWithApplicationGroupIdentifier_, v38, v36);
    if (a1)
    {
      v28 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x24BDBD240]);
      if (v28)
      {
        v29 = v28;
        v30 = (const __CFString *)SecTaskCopyValueForEntitlement(v28, CFSTR("com.apple.developer.icloud-container-environment"), 0);
        if (v30)
        {
          v31 = v30;
          v32 = CFGetTypeID(v30);
          if (v32 == CFStringGetTypeID())
          {
            v33 = 1;
            if (CFStringCompare(v31, CFSTR("production"), 1uLL))
              v33 = 2;
          }
          else
          {
            v33 = 2;
          }
          CFRelease(v31);
        }
        else
        {
          v33 = 2;
        }
        CFRelease(v29);
        v27 = v38;
      }
      else
      {
        v33 = 2;
      }
      objc_msgSend(a1, "setIdentifier:", v15);
      objc_msgSend(a1, "setPriority:", a9);
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9038]), "initWithContainerIdentifier:environment:", v18, v33);
      objc_msgSend(a1, "setContainerID:", v34);

      objc_msgSend(a1, "setQuery:", v16);
      objc_msgSend(a1, "setAssetKey:", v17);
      objc_msgSend(a1, "setZoneID:", v19);
      objc_msgSend(a1, "setDatabaseScope:", v37);
    }
  }
  else
  {
    v27 = v38;
  }

  return a1;
}

- (BACloudKitDownload)initWithCoder:(id)a3
{
  id v4;
  BACloudKitDownload *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BACloudKitDownload;
  v5 = -[BADownload initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BACKD.ContainerID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BACloudKitDownload setContainerID:](v5, "setContainerID:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BACKD.query"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BACloudKitDownload setQuery:](v5, "setQuery:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BACKD.assetKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BACloudKitDownload setAssetKey:](v5, "setAssetKey:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BACKD.zoneID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BACloudKitDownload setZoneID:](v5, "setZoneID:", v9);

    -[BACloudKitDownload setDatabaseScope:](v5, "setDatabaseScope:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("BACKD.databaseScope")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BACloudKitDownload;
  v4 = a3;
  -[BADownload encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[BACloudKitDownload containerID](self, "containerID", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("BACKD.ContainerID"));

  -[BACloudKitDownload query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("BACKD.query"));

  -[BACloudKitDownload assetKey](self, "assetKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("BACKD.assetKey"));

  -[BACloudKitDownload zoneID](self, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("BACKD.zoneID"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[BACloudKitDownload databaseScope](self, "databaseScope"), CFSTR("BACKD.databaseScope"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BACloudKitDownload;
  return -[BADownload copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
  objc_storeStrong((id *)&self->_containerID, a3);
}

- (CKQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (NSString)assetKey
{
  return self->_assetKey;
}

- (void)setAssetKey:(id)a3
{
  objc_storeStrong((id *)&self->_assetKey, a3);
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_zoneID, a3);
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(int64_t)a3
{
  self->_databaseScope = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_assetKey, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
}

@end
