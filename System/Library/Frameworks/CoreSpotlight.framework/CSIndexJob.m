@implementation CSIndexJob

- (CSIndexJob)initWithJobType:(int64_t)a3 jobOptions:(int64_t)a4
{
  CSIndexJob *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSIndexJob;
  result = -[CSIndexJob init](&v7, sel_init);
  if (result)
  {
    result->_jobType = a3;
    result->_jobOptions = a4;
  }
  return result;
}

- (CSIndexJob)initWithJobType:(int64_t)a3
{
  return -[CSIndexJob initWithJobType:jobOptions:](self, "initWithJobType:jobOptions:", a3, 0);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t jobType;
  id v5;

  jobType = self->_jobType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", jobType, CFSTR("t"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_jobOptions, CFSTR("o"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifiersToReindex, CFSTR("ids"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_excludedBundleIDs, CFSTR("excb"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_providerIdentifier, CFSTR("pid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_providerIdentifiers, CFSTR("pids"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_protectionClasses, CFSTR("pcs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_providerType, CFSTR("pt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extensionBundleID, CFSTR("extb"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_searchContext, CFSTR("sc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_importData, CFSTR("imd"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reason, CFSTR("reas"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fileType, CFSTR("ftp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fileAttributeSets, CFSTR("fattr"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_updatedItems, CFSTR("u"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_updatedItemsMask, CFSTR("um"));

}

- (CSIndexJob)initWithCoder:(id)a3
{
  id v4;
  CSIndexJob *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *identifiersToReindex;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *excludedBundleIDs;
  uint64_t v16;
  NSString *providerIdentifier;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *providerIdentifiers;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSArray *protectionClasses;
  uint64_t v28;
  NSString *providerType;
  uint64_t v30;
  NSString *extensionBundleID;
  uint64_t v32;
  CSSearchContext *searchContext;
  uint64_t v34;
  NSData *importData;
  uint64_t v36;
  NSString *reason;
  uint64_t v38;
  NSString *fileType;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSArray *fileAttributeSets;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSArray *updatedItems;
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)CSIndexJob;
  v5 = -[CSIndexJob init](&v51, sel_init);
  if (v5)
  {
    v5->_jobType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("t"));
    v5->_jobOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("o"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ids"));
    v9 = objc_claimAutoreleasedReturnValue();
    identifiersToReindex = v5->_identifiersToReindex;
    v5->_identifiersToReindex = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("excb"));
    v14 = objc_claimAutoreleasedReturnValue();
    excludedBundleIDs = v5->_excludedBundleIDs;
    v5->_excludedBundleIDs = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pid"));
    v16 = objc_claimAutoreleasedReturnValue();
    providerIdentifier = v5->_providerIdentifier;
    v5->_providerIdentifier = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("pids"));
    v21 = objc_claimAutoreleasedReturnValue();
    providerIdentifiers = v5->_providerIdentifiers;
    v5->_providerIdentifiers = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("pcs"));
    v26 = objc_claimAutoreleasedReturnValue();
    protectionClasses = v5->_protectionClasses;
    v5->_protectionClasses = (NSArray *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pt"));
    v28 = objc_claimAutoreleasedReturnValue();
    providerType = v5->_providerType;
    v5->_providerType = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extb"));
    v30 = objc_claimAutoreleasedReturnValue();
    extensionBundleID = v5->_extensionBundleID;
    v5->_extensionBundleID = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sc"));
    v32 = objc_claimAutoreleasedReturnValue();
    searchContext = v5->_searchContext;
    v5->_searchContext = (CSSearchContext *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imd"));
    v34 = objc_claimAutoreleasedReturnValue();
    importData = v5->_importData;
    v5->_importData = (NSData *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reas"));
    v36 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ftp"));
    v38 = objc_claimAutoreleasedReturnValue();
    fileType = v5->_fileType;
    v5->_fileType = (NSString *)v38;

    v40 = (void *)MEMORY[0x1E0C99E60];
    v41 = objc_opt_class();
    objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("fattr"));
    v43 = objc_claimAutoreleasedReturnValue();
    fileAttributeSets = v5->_fileAttributeSets;
    v5->_fileAttributeSets = (NSArray *)v43;

    v45 = (void *)MEMORY[0x1E0C99E60];
    v46 = objc_opt_class();
    objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, CFSTR("u"));
    v48 = objc_claimAutoreleasedReturnValue();
    updatedItems = v5->_updatedItems;
    v5->_updatedItems = (NSArray *)v48;

    v5->_updatedItemsMask = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("um"));
  }

  return v5;
}

- (CSIndexJob)initWithXPCDict:(id)a3
{
  id v4;
  uint64_t uint64;
  CSIndexJob *v6;
  void *v7;
  NSArray *v8;
  NSArray *identifiersToReindex;
  void *v10;
  NSArray *v11;
  NSArray *excludedBundleIDs;
  NSString *v13;
  NSString *providerIdentifier;
  void *v15;
  NSArray *v16;
  NSArray *providerIdentifiers;
  void *v18;
  NSArray *v19;
  NSArray *protectionClasses;
  NSString *v21;
  NSString *providerType;
  NSString *v23;
  NSString *extensionBundleID;
  void *v25;
  CSSearchContext *v26;
  CSSearchContext *searchContext;
  NSData *v28;
  NSData *importData;
  NSString *v30;
  NSString *reason;
  NSString *v32;
  NSString *fileType;

  v4 = a3;
  uint64 = xpc_dictionary_get_uint64(v4, "t");
  v6 = -[CSIndexJob initWithJobType:jobOptions:](self, "initWithJobType:jobOptions:", uint64, xpc_dictionary_get_uint64(v4, "o"));
  if (v6)
  {
    xpc_dictionary_get_value(v4, "ids");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[CSXPCConnection copyNSStringArrayFromXPCArray:](CSXPCConnection, "copyNSStringArrayFromXPCArray:", v7);
    identifiersToReindex = v6->_identifiersToReindex;
    v6->_identifiersToReindex = v8;

    xpc_dictionary_get_value(v4, "excb");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[CSXPCConnection copyNSStringArrayFromXPCArray:](CSXPCConnection, "copyNSStringArrayFromXPCArray:", v10);
    excludedBundleIDs = v6->_excludedBundleIDs;
    v6->_excludedBundleIDs = v11;

    v13 = +[CSXPCConnection copyNSStringForKey:fromXPCDictionary:](CSXPCConnection, "copyNSStringForKey:fromXPCDictionary:", "pid", v4);
    providerIdentifier = v6->_providerIdentifier;
    v6->_providerIdentifier = v13;

    xpc_dictionary_get_value(v4, "pids");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[CSXPCConnection copyNSStringArrayFromXPCArray:](CSXPCConnection, "copyNSStringArrayFromXPCArray:", v15);
    providerIdentifiers = v6->_providerIdentifiers;
    v6->_providerIdentifiers = v16;

    xpc_dictionary_get_value(v4, "pcs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = +[CSXPCConnection copyNSStringArrayFromXPCArray:](CSXPCConnection, "copyNSStringArrayFromXPCArray:", v18);
    protectionClasses = v6->_protectionClasses;
    v6->_protectionClasses = v19;

    v21 = +[CSXPCConnection copyNSStringForKey:fromXPCDictionary:](CSXPCConnection, "copyNSStringForKey:fromXPCDictionary:", "pt", v4);
    providerType = v6->_providerType;
    v6->_providerType = v21;

    v23 = +[CSXPCConnection copyNSStringForKey:fromXPCDictionary:](CSXPCConnection, "copyNSStringForKey:fromXPCDictionary:", "extb", v4);
    extensionBundleID = v6->_extensionBundleID;
    v6->_extensionBundleID = v23;

    xpc_dictionary_get_dictionary(v4, "sc");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = -[CSSearchContext initWithXPCDictionary:]([CSSearchContext alloc], "initWithXPCDictionary:", v25);
      searchContext = v6->_searchContext;
      v6->_searchContext = v26;

    }
    v28 = +[CSXPCConnection copyNSDataForKey:fromXPCDictionary:](CSXPCConnection, "copyNSDataForKey:fromXPCDictionary:", "imd", v4);
    importData = v6->_importData;
    v6->_importData = v28;

    v30 = +[CSXPCConnection copyNSStringForKey:fromXPCDictionary:](CSXPCConnection, "copyNSStringForKey:fromXPCDictionary:", "reas", v4);
    reason = v6->_reason;
    v6->_reason = v30;

    v32 = +[CSXPCConnection copyNSStringForKey:fromXPCDictionary:](CSXPCConnection, "copyNSStringForKey:fromXPCDictionary:", "ftp", v4);
    fileType = v6->_fileType;
    v6->_fileType = v32;

  }
  return v6;
}

- (id)xpc_dictionary
{
  xpc_object_t v3;
  NSString *providerIdentifier;
  NSArray *providerIdentifiers;
  NSArray *protectionClasses;
  NSString *providerType;
  NSString *extensionBundleID;
  void *v9;
  NSData *importData;
  NSString *reason;
  NSString *fileType;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "t", self->_jobType);
  xpc_dictionary_set_uint64(v3, "o", self->_jobOptions);
  +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, self->_identifiersToReindex, "ids");
  +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, self->_excludedBundleIDs, "excb");
  providerIdentifier = self->_providerIdentifier;
  if (providerIdentifier)
    xpc_dictionary_set_string(v3, "pid", -[NSString UTF8String](providerIdentifier, "UTF8String"));
  providerIdentifiers = self->_providerIdentifiers;
  if (providerIdentifiers)
    +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, providerIdentifiers, "pids");
  protectionClasses = self->_protectionClasses;
  if (protectionClasses)
    +[CSXPCConnection dictionary:setStringArray:forKey:](CSXPCConnection, "dictionary:setStringArray:forKey:", v3, protectionClasses, "pcs");
  providerType = self->_providerType;
  if (providerType)
    xpc_dictionary_set_string(v3, "pt", -[NSString UTF8String](providerType, "UTF8String"));
  extensionBundleID = self->_extensionBundleID;
  if (extensionBundleID)
    xpc_dictionary_set_string(v3, "extb", -[NSString UTF8String](extensionBundleID, "UTF8String"));
  -[CSSearchContext xpc_dictionary](self->_searchContext, "xpc_dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    xpc_dictionary_set_value(v3, "sc", v9);
  importData = self->_importData;
  if (importData)
    xpc_dictionary_set_data(v3, "imd", -[NSData bytes](importData, "bytes"), -[NSData length](self->_importData, "length"));
  reason = self->_reason;
  if (reason)
    xpc_dictionary_set_string(v3, "reas", -[NSString UTF8String](reason, "UTF8String"));
  fileType = self->_fileType;
  if (fileType)
    xpc_dictionary_set_string(v3, "ftp", -[NSString UTF8String](fileType, "UTF8String"));

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithJobType:jobOptions:", self->_jobType, self->_jobOptions);
  objc_msgSend(v4, "setIdentifiersToReindex:", self->_identifiersToReindex);
  objc_msgSend(v4, "setExcludedBundleIDs:", self->_excludedBundleIDs);
  objc_msgSend(v4, "setProviderIdentifier:", self->_providerIdentifier);
  objc_msgSend(v4, "setProviderIdentifiers:", self->_providerIdentifiers);
  objc_msgSend(v4, "setProtectionClasses:", self->_protectionClasses);
  objc_msgSend(v4, "setProviderType:", self->_providerType);
  objc_msgSend(v4, "setExtensionBundleID:", self->_extensionBundleID);
  objc_msgSend(v4, "setSearchContext:", self->_searchContext);
  objc_msgSend(v4, "setImportData:", self->_importData);
  objc_msgSend(v4, "setReason:", self->_reason);
  objc_msgSend(v4, "setFileType:", self->_fileType);
  objc_msgSend(v4, "setFileAttributeSets:", self->_fileAttributeSets);
  objc_msgSend(v4, "setUpdatedItems:", self->_updatedItems);
  objc_msgSend(v4, "setUpdatedItemsMask:", self->_updatedItemsMask);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  int64_t jobType;
  int64_t jobOptions;
  NSArray *identifiersToReindex;
  NSArray *v10;
  NSArray *v11;
  BOOL v12;
  NSArray *excludedBundleIDs;
  NSArray *v14;
  NSArray *v15;
  void *v16;
  void *searchContext;
  uint64_t v18;
  void *v19;
  NSArray *v20;
  void *v21;
  NSData *importData;
  NSData *v23;
  NSData *v24;
  NSString *fileType;
  void *v26;
  NSArray *fileAttributeSets;
  uint64_t v28;
  NSArray *v29;
  void *v30;
  NSArray *updatedItems;
  uint64_t v32;
  NSArray *v33;
  void *v34;
  int64_t updatedItemsMask;
  void *v37;
  void *v38;
  void *v39;
  NSData *v40;
  NSArray *v41;
  void *v42;
  void *v43;
  void *v44;
  NSArray *v45;
  void *v46;
  void *v47;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    jobType = self->_jobType;
    if (jobType != objc_msgSend(v6, "jobType")
      || (jobOptions = self->_jobOptions, jobOptions != objc_msgSend(v6, "jobOptions")))
    {
      v12 = 0;
LABEL_39:

      goto LABEL_40;
    }
    identifiersToReindex = self->_identifiersToReindex;
    objc_msgSend(v6, "identifiersToReindex");
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (identifiersToReindex != v10)
    {
      v11 = self->_identifiersToReindex;
      objc_msgSend(v6, "identifiersToReindex");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSArray isEqual:](v11, "isEqual:", v3))
      {
        v12 = 0;
        goto LABEL_37;
      }
    }
    excludedBundleIDs = self->_excludedBundleIDs;
    objc_msgSend(v6, "excludedBundleIDs");
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (excludedBundleIDs != v14)
    {
      v15 = self->_excludedBundleIDs;
      objc_msgSend(v6, "excludedBundleIDs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSArray isEqual:](v15, "isEqual:", v16))
      {
        v12 = 0;
LABEL_35:

LABEL_36:
        if (identifiersToReindex == v10)
        {
LABEL_38:

          goto LABEL_39;
        }
LABEL_37:

        goto LABEL_38;
      }
      v46 = v16;
    }
    searchContext = self->_searchContext;
    objc_msgSend(v6, "searchContext");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v47 = searchContext;
    if (searchContext == (void *)v18)
    {
      v41 = v14;
      v20 = identifiersToReindex;
      v21 = (void *)v18;
      v45 = excludedBundleIDs;
    }
    else
    {
      -[CSSearchContext userQuery](self->_searchContext, "userQuery");
      searchContext = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "searchContext");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "userQuery");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(searchContext, "isEqual:"))
      {
        v12 = 0;
LABEL_33:

LABEL_34:
        v16 = v46;
        if (excludedBundleIDs == v14)
          goto LABEL_36;
        goto LABEL_35;
      }
      v41 = v14;
      v20 = identifiersToReindex;
      v21 = v19;
      v45 = excludedBundleIDs;
    }
    importData = self->_importData;
    objc_msgSend(v6, "importData");
    v23 = (NSData *)objc_claimAutoreleasedReturnValue();
    v40 = importData;
    v44 = searchContext;
    if (importData == v23)
    {
      v38 = v3;
      v19 = v21;
    }
    else
    {
      v24 = self->_importData;
      objc_msgSend(v6, "importData");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v21;
      if (!-[NSData isEqualToData:](v24, "isEqualToData:"))
      {
        v12 = 0;
        searchContext = v44;
        identifiersToReindex = v20;
        v14 = v41;
LABEL_31:

LABEL_32:
        excludedBundleIDs = v45;
        if (v47 == v19)
          goto LABEL_34;
        goto LABEL_33;
      }
      v38 = v3;
    }
    identifiersToReindex = v20;
    fileType = self->_fileType;
    objc_msgSend(v6, "fileType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v41;
    if (-[NSString isEqualToString:](fileType, "isEqualToString:", v26))
    {
      fileAttributeSets = self->_fileAttributeSets;
      objc_msgSend(v6, "fileAttributeSets");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = fileAttributeSets;
      v30 = (void *)v28;
      if (-[NSArray isEqualToArray:](v29, "isEqualToArray:", v28))
      {
        v37 = v30;
        updatedItems = self->_updatedItems;
        objc_msgSend(v6, "updatedItems");
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = updatedItems;
        v34 = (void *)v32;
        if (-[NSArray isEqualToArray:](v33, "isEqualToArray:"))
        {
          updatedItemsMask = self->_updatedItemsMask;
          v12 = updatedItemsMask == objc_msgSend(v6, "updatedItemsMask");

          goto LABEL_30;
        }

      }
      else
      {

      }
    }

    v12 = 0;
LABEL_30:
    v3 = v38;
    searchContext = v44;
    if (v40 == v23)
      goto LABEL_32;
    goto LABEL_31;
  }
  v12 = 0;
LABEL_40:

  return v12;
}

- (unint64_t)hash
{
  int64_t v3;
  uint64_t v4;

  v3 = 3 * self->_jobOptions + self->_jobType;
  v4 = -[NSArray hash](self->_identifiersToReindex, "hash");
  return v3 + 5 * (-[NSArray hash](self->_excludedBundleIDs, "hash") ^ v4);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("type=%ld"), self->_jobType);
  objc_msgSend(v3, "addObject:", v4);

  if (self->_jobOptions)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("options=%ld"), self->_jobOptions);
    objc_msgSend(v3, "addObject:", v5);

  }
  if (-[NSArray count](self->_identifiersToReindex, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("identifiersCount=%ld"), -[NSArray count](self->_identifiersToReindex, "count"));
    objc_msgSend(v3, "addObject:", v6);

  }
  if (-[NSArray count](self->_excludedBundleIDs, "count"))
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NSArray componentsJoinedByString:](self->_excludedBundleIDs, "componentsJoinedByString:", CFSTR("|"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("excludedBundleIDs=%@"), v8);
    objc_msgSend(v3, "addObject:", v9);

  }
  if (-[NSArray count](self->_protectionClasses, "count"))
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NSArray componentsJoinedByString:](self->_protectionClasses, "componentsJoinedByString:", CFSTR("|"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("pcs=%@"), v11);
    objc_msgSend(v3, "addObject:", v12);

  }
  -[CSSearchContext userQuery](self->_searchContext, "userQuery");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[CSSearchContext userQuery](self->_searchContext, "userQuery");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("query=%@"), v15);
    objc_msgSend(v3, "addObject:", v16);

  }
  if (-[NSData length](self->_importData, "length"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("importData=%d:%p"), -[NSData length](self->_importData, "length"), -[NSData bytes](self->_importData, "bytes"));
    objc_msgSend(v3, "addObject:", v17);

  }
  if (-[NSString length](self->_reason, "length"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("reason=%@"), self->_reason);
    objc_msgSend(v3, "addObject:", v18);

  }
  if (-[NSString length](self->_fileType, "length"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fileType=%@"), self->_fileType);
    objc_msgSend(v3, "addObject:", v19);

  }
  if (-[NSArray count](self->_fileAttributeSets, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fileAttributeSetsCount=%ld"), -[NSArray count](self->_fileAttributeSets, "count"));
    objc_msgSend(v3, "addObject:", v20);

  }
  if (-[NSArray count](self->_updatedItems, "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("updatedItems=%ld"), -[NSArray count](self->_updatedItems, "count"));
    objc_msgSend(v3, "addObject:", v21);

  }
  if (self->_updatedItemsMask)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("updatedItemsMask=%ld"), self->_updatedItemsMask);
    objc_msgSend(v3, "addObject:", v22);

  }
  v23 = objc_alloc(MEMORY[0x1E0CB3940]);
  v24 = objc_opt_class();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("<%@:%p; %@>"), v24, self, v25);

  return v26;
}

- (int64_t)jobType
{
  return self->_jobType;
}

- (void)setJobType:(int64_t)a3
{
  self->_jobType = a3;
}

- (int64_t)jobOptions
{
  return self->_jobOptions;
}

- (void)setJobOptions:(int64_t)a3
{
  self->_jobOptions = a3;
}

- (NSArray)identifiersToReindex
{
  return self->_identifiersToReindex;
}

- (void)setIdentifiersToReindex:(id)a3
{
  objc_storeStrong((id *)&self->_identifiersToReindex, a3);
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDs, a3);
}

- (NSArray)excludedBundleIDs
{
  return self->_excludedBundleIDs;
}

- (void)setExcludedBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_excludedBundleIDs, a3);
}

- (NSArray)protectionClasses
{
  return self->_protectionClasses;
}

- (void)setProtectionClasses:(id)a3
{
  objc_storeStrong((id *)&self->_protectionClasses, a3);
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void)setProviderIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_providerIdentifier, a3);
}

- (NSArray)providerIdentifiers
{
  return self->_providerIdentifiers;
}

- (void)setProviderIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_providerIdentifiers, a3);
}

- (NSString)providerType
{
  return self->_providerType;
}

- (void)setProviderType:(id)a3
{
  objc_storeStrong((id *)&self->_providerType, a3);
}

- (NSString)extensionBundleID
{
  return self->_extensionBundleID;
}

- (void)setExtensionBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_extensionBundleID, a3);
}

- (CSSearchContext)searchContext
{
  return self->_searchContext;
}

- (void)setSearchContext:(id)a3
{
  objc_storeStrong((id *)&self->_searchContext, a3);
}

- (NSData)importData
{
  return self->_importData;
}

- (void)setImportData:(id)a3
{
  objc_storeStrong((id *)&self->_importData, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (NSString)fileType
{
  return self->_fileType;
}

- (void)setFileType:(id)a3
{
  objc_storeStrong((id *)&self->_fileType, a3);
}

- (NSArray)fileAttributeSets
{
  return self->_fileAttributeSets;
}

- (void)setFileAttributeSets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)updatedItems
{
  return self->_updatedItems;
}

- (void)setUpdatedItems:(id)a3
{
  objc_storeStrong((id *)&self->_updatedItems, a3);
}

- (int64_t)updatedItemsMask
{
  return self->_updatedItemsMask;
}

- (void)setUpdatedItemsMask:(int64_t)a3
{
  self->_updatedItemsMask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedItems, 0);
  objc_storeStrong((id *)&self->_fileAttributeSets, 0);
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_importData, 0);
  objc_storeStrong((id *)&self->_searchContext, 0);
  objc_storeStrong((id *)&self->_extensionBundleID, 0);
  objc_storeStrong((id *)&self->_providerType, 0);
  objc_storeStrong((id *)&self->_providerIdentifiers, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_protectionClasses, 0);
  objc_storeStrong((id *)&self->_excludedBundleIDs, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_identifiersToReindex, 0);
}

@end
