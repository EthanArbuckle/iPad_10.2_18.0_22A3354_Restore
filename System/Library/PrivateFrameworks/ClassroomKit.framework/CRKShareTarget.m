@implementation CRKShareTarget

- (CRKShareTarget)initWithDictionary:(id)a3
{
  id v5;
  CRKShareTarget *v6;
  id v7;
  void *v8;
  uint64_t v9;
  DMFControlGroupIdentifier *courseIdentifier;
  void *v11;
  uint64_t v12;
  NSString *type;
  void *v14;
  uint64_t v15;
  NSString *identifier;
  void *v17;
  uint64_t v18;
  NSString *displayName;
  void *v20;
  uint64_t v21;
  NSString *secondaryName;
  void *v23;
  uint64_t v24;
  NSData *iconImageData;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  objc_super v32;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKShareTarget.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionary"));

  }
  v32.receiver = self;
  v32.super_class = (Class)CRKShareTarget;
  v6 = -[CRKShareTarget init](&v32, sel_init);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BE2C7E8]);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CourseIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithString:", v8);
    courseIdentifier = v6->_courseIdentifier;
    v6->_courseIdentifier = (DMFControlGroupIdentifier *)v9;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    type = v6->_type;
    v6->_type = (NSString *)v12;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Identifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v15;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DisplayName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    displayName = v6->_displayName;
    v6->_displayName = (NSString *)v18;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SecondaryName"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    secondaryName = v6->_secondaryName;
    v6->_secondaryName = (NSString *)v21;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IconImageData"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    iconImageData = v6->_iconImageData;
    v6->_iconImageData = (NSData *)v24;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IsCourse"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_course = objc_msgSend(v26, "BOOLValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IsGroup"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_group = objc_msgSend(v27, "BOOLValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IsInstructor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_instructor = objc_msgSend(v28, "BOOLValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SupportsFileURLs"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_supportsFileURLs = objc_msgSend(v29, "BOOLValue");

  }
  return v6;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = (void *)objc_opt_new();
  -[CRKShareTarget courseIdentifier](self, "courseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CRKShareTarget courseIdentifier](self, "courseIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("CourseIdentifier"));

  }
  -[CRKShareTarget type](self, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CRKShareTarget type](self, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("Type"));

  }
  -[CRKShareTarget identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CRKShareTarget identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("Identifier"));

  }
  -[CRKShareTarget displayName](self, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CRKShareTarget displayName](self, "displayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("DisplayName"));

  }
  -[CRKShareTarget secondaryName](self, "secondaryName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[CRKShareTarget secondaryName](self, "secondaryName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("SecondaryName"));

  }
  -[CRKShareTarget iconImageData](self, "iconImageData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[CRKShareTarget iconImageData](self, "iconImageData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("IconImageData"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKShareTarget isCourse](self, "isCourse"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("IsCourse"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKShareTarget isGroup](self, "isGroup"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("IsGroup"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKShareTarget isInstructor](self, "isInstructor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("IsInstructor"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKShareTarget supportsFileURLs](self, "supportsFileURLs"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("SupportsFileURLs"));

  v21 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v21;
}

- (id)operationToSendItems:(id)a3 fromBundleIdentifier:(id)a4 description:(id)a5 previewImageData:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v10 = (void *)MEMORY[0x24BDD1758];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "predicateWithFormat:", CFSTR("isFileURL == %@"), MEMORY[0x24BDBD1C8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "filteredArrayUsingPredicate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_opt_new();
  -[CRKShareTarget courseIdentifier](self, "courseIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCourseIdentifier:", v18);

  -[CRKShareTarget type](self, "type");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTargetType:", v19);

  -[CRKShareTarget identifier](self, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTargetIdentifier:", v20);

  objc_msgSend(v17, "setUrls:", v14);
  objc_msgSend(MEMORY[0x24BDBCF48], "crk_overriddenDescriptionForItems:originalDescription:", v14, v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setShareDescription:", v21);
  objc_msgSend(v17, "setPreviewImageData:", v11);

  objc_msgSend((id)objc_opt_class(), "sandboxExtensionsForFileURLs:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSandboxExtensions:", v22);

  objc_msgSend(v17, "setSourceBundleIdentifier:", v13);
  -[CRKShareTarget taskClient](self, "taskClient");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "prepareTaskOperationForRequest:", v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)sandboxExtensionsForFileURLs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "path", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(a1, "sandboxExtensionForPath:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

        }
        objc_msgSend(v11, "stringByDeletingLastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(a1, "sandboxExtensionForPath:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v13);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)sandboxExtensionForPath:(id)a3
{
  id v3;
  id v4;
  char *v5;
  NSObject *v6;
  void *v7;
  int v9;
  id v10;
  __int16 v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(CFSTR("com.apple.app-sandbox.read"), "UTF8String");
  v4 = objc_retainAutorelease(v3);
  objc_msgSend(v4, "UTF8String");
  v5 = (char *)sandbox_extension_issue_file();
  if (_CRKLogGeneral_onceToken_3 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_3, &__block_literal_global_17);
  v6 = _CRKLogGeneral_logObj_3;
  if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_3, OS_LOG_TYPE_INFO))
  {
    v9 = 138543618;
    v10 = v4;
    v11 = 2082;
    v12 = v5;
    _os_log_impl(&dword_218C99000, v6, OS_LOG_TYPE_INFO, "Created sandbox extension for file with path %{public}@: %{public}s", (uint8_t *)&v9, 0x16u);
  }
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v5, strlen(v5) + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    free(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[CRKShareTarget courseIdentifier](self, "courseIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CRKShareTarget type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[CRKShareTarget identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[CRKShareTarget displayName](self, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[CRKShareTarget secondaryName](self, "secondaryName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  CRKShareTarget *v4;
  BOOL v5;

  v4 = (CRKShareTarget *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CRKShareTarget isEqualToShareTarget:](self, "isEqualToShareTarget:", v4);
  }

  return v5;
}

- (BOOL)isEqualToShareTarget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  _BOOL4 v33;
  int v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;

  v4 = a3;
  -[CRKShareTarget courseIdentifier](self, "courseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "courseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  if (v7 | v8 && (v9 = objc_msgSend((id)v7, "isEqual:", v8), (id)v8, (id)v7, !v9))
  {
    LOBYTE(v31) = 0;
  }
  else
  {
    -[CRKShareTarget type](self, "type");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v13 = v11;
    if (v12 | v13 && (v14 = objc_msgSend((id)v12, "isEqual:", v13), (id)v13, (id)v12, !v14))
    {
      LOBYTE(v31) = 0;
    }
    else
    {
      -[CRKShareTarget identifier](self, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v15;
      v18 = v16;
      if (v17 | v18
        && (v19 = objc_msgSend((id)v17, "isEqual:", v18), (id)v18, (id)v17, !v19))
      {
        LOBYTE(v31) = 0;
      }
      else
      {
        -[CRKShareTarget displayName](self, "displayName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "displayName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v20;
        v36 = v21;
        v37 = (void *)v22;
        if (v22 | v36
          && (v34 = objc_msgSend((id)v22, "isEqual:", v36), (id)v36, (id)v22, !v34))
        {
          LOBYTE(v31) = 0;
        }
        else
        {
          v35 = v17;
          -[CRKShareTarget secondaryName](self, "secondaryName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "secondaryName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v23;
          v26 = v24;
          if ((!(v25 | v26)
             || (v27 = objc_msgSend((id)v25, "isEqual:", v26), (id)v26, (id)v25, v27))
            && (v28 = -[CRKShareTarget isCourse](self, "isCourse"), v28 == objc_msgSend(v4, "isCourse"))
            && (v29 = -[CRKShareTarget isGroup](self, "isGroup"), v29 == objc_msgSend(v4, "isGroup"))
            && (v30 = -[CRKShareTarget isInstructor](self, "isInstructor"),
                v30 == objc_msgSend(v4, "isInstructor")))
          {
            v33 = -[CRKShareTarget supportsFileURLs](self, "supportsFileURLs");
            v31 = v33 ^ objc_msgSend(v4, "supportsFileURLs") ^ 1;
          }
          else
          {
            LOBYTE(v31) = 0;
          }
          v17 = v35;

        }
      }

    }
  }

  return v31;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRKShareTarget identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKShareTarget displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {identifier = %@, displayName = %@}>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (void)setCourseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)secondaryName
{
  return self->_secondaryName;
}

- (void)setSecondaryName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)iconImageData
{
  return self->_iconImageData;
}

- (void)setIconImageData:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageData, a3);
}

- (BOOL)isGroup
{
  return self->_group;
}

- (void)setGroup:(BOOL)a3
{
  self->_group = a3;
}

- (BOOL)isCourse
{
  return self->_course;
}

- (void)setCourse:(BOOL)a3
{
  self->_course = a3;
}

- (BOOL)isInstructor
{
  return self->_instructor;
}

- (void)setInstructor:(BOOL)a3
{
  self->_instructor = a3;
}

- (BOOL)supportsFileURLs
{
  return self->_supportsFileURLs;
}

- (void)setSupportsFileURLs:(BOOL)a3
{
  self->_supportsFileURLs = a3;
}

- (CATTaskClient)taskClient
{
  return self->_taskClient;
}

- (void)setTaskClient:(id)a3
{
  objc_storeStrong((id *)&self->_taskClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskClient, 0);
  objc_storeStrong((id *)&self->_iconImageData, 0);
  objc_storeStrong((id *)&self->_secondaryName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_courseIdentifier, 0);
}

@end
