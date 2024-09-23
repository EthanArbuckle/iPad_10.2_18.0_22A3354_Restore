@implementation ICCameraItem

- (ICCameraItem)initWithName:(id)a3 parentFolder:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICCameraItem *v11;
  ICCameraItem *v12;
  unsigned int v13;
  signed int v14;
  void *v15;
  ICCameraItem *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ICCameraItem;
  v11 = -[ICCameraItem init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    -[ICCameraItem setName:](v11, "setName:", v8);
    -[ICCameraItem setParentFolder:](v12, "setParentFolder:", v9);
    -[ICCameraItem setParentID:](v12, "setParentID:", objc_msgSend(v9, "objectID"));
    do
      v13 = __ldaxr((unsigned int *)&NextICAObjectID__sLastICObjectID);
    while (__stlxr(v13 + 2, (unsigned int *)&NextICAObjectID__sLastICObjectID));
    v14 = atomic_load((unsigned int *)&NextICAObjectID__sLastICObjectID);
    -[ICCameraItem setObjectID:](v12, "setObjectID:", v14);
    -[ICCameraItem setOwnerID:](v12, "setOwnerID:", 0);
    -[ICCameraItem setTwinID:](v12, "setTwinID:", 0);
    -[ICCameraItem setDevice:](v12, "setDevice:", v10);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraItem setUserData:](v12, "setUserData:", v15);

    v16 = v12;
  }

  return v12;
}

- (void)setUTI:(id)a3
{
  void *v4;
  int v5;
  NSString **v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  id v13;

  v13 = a3;
  objc_msgSend((id)*MEMORY[0x1E0CEC4F0], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v13, "isEqualToString:", v4);

  if (v5)
  {
    v6 = (NSString **)MEMORY[0x1E0CA5B58];
  }
  else
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v13, "isEqualToString:", v7);

    if (v8)
    {
      v6 = (NSString **)MEMORY[0x1E0CA5B90];
    }
    else
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC568], "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v13, "isEqualToString:", v9);

      if (v10)
      {
        v6 = (NSString **)MEMORY[0x1E0CA5BF8];
      }
      else
      {
        objc_msgSend((id)*MEMORY[0x1E0CEC450], "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v13, "isEqualToString:", v11);

        if (v12)
          v6 = (NSString **)MEMORY[0x1E0CA5AC8];
        else
          v6 = (NSString **)MEMORY[0x1E0CA5B20];
      }
    }
  }
  self->_UTI = *v6;

}

- (void)setParentID:(unint64_t)a3
{
  self->_parentID = a3;
}

- (void)setOwnerID:(unint64_t)a3
{
  self->_ownerID = a3;
}

- (void)setTwinID:(unint64_t)a3
{
  self->_twinID = a3;
}

- (void)setObjectID:(unint64_t)a3
{
  self->_objectID = a3;
}

- (NSString)mediaItemType
{
  return (NSString *)CFSTR("item");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  const char *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("\n%@ <%p>:\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCameraItem device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  device                  : %@\n"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("  parentID                : 0x%lx\n"), -[ICCameraItem parentID](self, "parentID"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  objectID                : 0x%lx\n"), -[ICCameraItem objectID](self, "objectID"));
  -[ICCameraItem parentFolder](self, "parentFolder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  parentFolder            : %@\n"), v7);

  -[ICCameraItem name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  name                    : %@\n"), v8);

  -[ICCameraItem UTI](self, "UTI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  UTI                     : %@\n"), v9);

  v10 = -[ICCameraItem isLocked](self, "isLocked");
  v11 = "NO";
  if (v10)
    v11 = "YES";
  objc_msgSend(v3, "appendFormat:", CFSTR("  locked                  : %s\n"), v11);
  -[ICCameraItem creationDate](self, "creationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  creationDate            : %@\n"), v12);

  -[ICCameraItem modificationDate](self, "modificationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  modificationDate        : %@\n"), v13);

  return v3;
}

- (void)setMetadataState:(unint64_t)a3
{
  if (-[ICCameraItem privMetadataState](self, "privMetadataState") != a3)
    -[ICCameraItem setPrivMetadataState:](self, "setPrivMetadataState:", a3);
}

- (id)valueForUndefinedKey:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqual:", CFSTR("thumbnail")))
  {
    -[ICCameraItem thumbnail](self, "thumbnail");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)requestThumbnail
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B98FC000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)requestMetadata
{
  void *v2;

  __ICOSLogCreate();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ICCameraItem requestMetadata] - unimplemented in base class"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
    -[ICCameraItem requestThumbnail].cold.1();

}

- (void)flushThumbnailCache
{
  void *v2;

  __ICOSLogCreate();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ICCameraItem flushThumbnailCache] - unimplemented in base class"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
    -[ICCameraItem requestThumbnail].cold.1();

}

- (void)flushMetadataCache
{
  void *v2;

  __ICOSLogCreate();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ICCameraItem flushMetadataCache] - unimplemented in base class"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
    -[ICCameraItem requestThumbnail].cold.1();

}

- (CGImageRef)thumbnail
{
  return 0;
}

- (NSDictionary)metadata
{
  return 0;
}

- (BOOL)hasThumbnail
{
  return 0;
}

- (BOOL)hasMetadata
{
  return 0;
}

- (NSString)fileSystemPath
{
  void *v3;
  void *v4;
  void *v5;

  -[ICCameraItem device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "volumePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraItem appendToPath:](self, "appendToPath:", v5);
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (void)appendToPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[ICCameraItem device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "volumePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICCameraItem parentFolder](self, "parentFolder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[ICCameraItem parentFolder](self, "parentFolder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendToPath:", v9);

    }
    else
    {
      objc_msgSend(v9, "appendString:", v5);
    }
    -[ICCameraItem name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR("/%@"), v8);

  }
}

- (ICCameraItem)initWithDictionary:(id)a3 parentFolder:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICCameraItem *v11;
  ICCameraItem *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  ICCameraItem *v26;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)ICCameraItem;
  v11 = -[ICCameraItem init](&v28, sel_init);
  v12 = v11;
  if (v11)
  {
    -[ICCameraItem setDevice:](v11, "setDevice:", v10);
    -[ICCameraItem setParentFolder:](v12, "setParentFolder:", v9);
    -[ICCameraItem setParentID:](v12, "setParentID:", objc_msgSend(v9, "objectID"));
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("icao"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraItem setObjectID:](v12, "setObjectID:", objc_msgSend(v13, "unsignedIntegerValue"));

    -[ICCameraItem setOwnerID:](v12, "setOwnerID:", 0);
    -[ICCameraItem setTwinID:](v12, "setTwinID:", 0);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ifil"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraItem setName:](v12, "setName:", v14);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AddedAfterContentCatalogCompleted"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      v17 = objc_msgSend(v15, "BOOLValue");
    else
      v17 = 0;
    -[ICCameraItem setAddedAfterContentCatalogCompleted:](v12, "setAddedAfterContentCatalogCompleted:", v17);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("file"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "unsignedIntValue");

    v20 = (id *)MEMORY[0x1E0CEC4F0];
    if (v19 != 1684632165)
      v20 = (id *)MEMORY[0x1E0CEC4A0];
    objc_msgSend(*v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraItem setUTI:](v12, "setUTI:", v21);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("lock"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraItem setLocked:](v12, "setLocked:", objc_msgSend(v22, "unsignedIntValue") == 1);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ICAObjectInTemporaryStoreKey"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraItem setInTemporaryStore:](v12, "setInTemporaryStore:", objc_msgSend(v23, "isEqualToString:", CFSTR("YES")));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraItem setUserData:](v12, "setUserData:", v24);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PTPObjH"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraItem setPtpObjectHandle:](v12, "setPtpObjectHandle:", objc_msgSend(v25, "unsignedIntValue"));

    -[ICCameraItem setCreationDate:](v12, "setCreationDate:", 0);
    -[ICCameraItem setModificationDate:](v12, "setModificationDate:", 0);
    v26 = v12;

  }
  return v12;
}

- (CGImageRef)thumbnailIfAvailable
{
  return 0;
}

- (CGImageRef)largeThumbnailIfAvailable
{
  return 0;
}

- (NSDictionary)metadataIfAvailable
{
  return 0;
}

- (ICCameraDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (ICCameraFolder)parentFolder
{
  return self->_parentFolder;
}

- (void)setParentFolder:(id)a3
{
  objc_storeStrong((id *)&self->_parentFolder, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)UTI
{
  return self->_UTI;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (BOOL)isRaw
{
  return self->_raw;
}

- (void)setRaw:(BOOL)a3
{
  self->_raw = a3;
}

- (BOOL)isInTemporaryStore
{
  return self->_inTemporaryStore;
}

- (void)setInTemporaryStore:(BOOL)a3
{
  self->_inTemporaryStore = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSMutableDictionary)userData
{
  return self->_userData;
}

- (void)setUserData:(id)a3
{
  objc_storeStrong((id *)&self->_userData, a3);
}

- (unsigned)ptpObjectHandle
{
  return self->_ptpObjectHandle;
}

- (void)setPtpObjectHandle:(unsigned int)a3
{
  self->_ptpObjectHandle = a3;
}

- (BOOL)wasAddedAfterContentCatalogCompleted
{
  return self->_addedAfterContentCatalogCompleted;
}

- (void)setAddedAfterContentCatalogCompleted:(BOOL)a3
{
  self->_addedAfterContentCatalogCompleted = a3;
}

- (unint64_t)privMetadataState
{
  return self->_privMetadataState;
}

- (void)setPrivMetadataState:(unint64_t)a3
{
  self->_privMetadataState = a3;
}

- (unint64_t)privThumbnailState
{
  return self->_privThumbnailState;
}

- (void)setPrivThumbnailState:(unint64_t)a3
{
  self->_privThumbnailState = a3;
}

- (unsigned)objectHandle
{
  return self->_objectHandle;
}

- (void)setObjectHandle:(unsigned int)a3
{
  self->_objectHandle = a3;
}

- (unint64_t)parentID
{
  return self->_parentID;
}

- (unint64_t)ownerID
{
  return self->_ownerID;
}

- (unint64_t)twinID
{
  return self->_twinID;
}

- (unint64_t)objectID
{
  return self->_objectID;
}

- (id)userObject
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setUserObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSString)relativeFileSystemPath
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeFileSystemPath, 0);
  objc_storeStrong(&self->_userObject, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_parentFolder, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
