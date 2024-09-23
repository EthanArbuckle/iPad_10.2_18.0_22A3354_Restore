@implementation CESRSpeechProfileSite

- (CESRSpeechProfileSite)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CESRSpeechProfileSite)initWithSpeechProfileSiteURL:(id)a3 readOnly:(BOOL)a4 create:(BOOL)a5 userId:(id)a6 userIdHash:(id)a7 error:(id *)a8
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v15;
  id v16;
  id v17;
  CESRSpeechProfileSite *v18;
  CESRSpeechProfileSite *v19;
  void *v20;
  CESRDictionaryLog *v21;
  CESRDictionaryLog *log;
  CESRDictionaryLog *v23;
  void *v24;
  uint64_t v25;
  NSString *description;
  uint64_t v27;
  NSMutableArray *instances;
  CESRSpeechProfileSite *v29;
  objc_super v31;

  v11 = a5;
  v12 = a4;
  v15 = a3;
  v16 = a6;
  v17 = a7;
  v31.receiver = self;
  v31.super_class = (Class)CESRSpeechProfileSite;
  v18 = -[CESRSpeechProfileSite init](&v31, sel_init);
  v19 = v18;
  if (!v18)
    goto LABEL_9;
  objc_storeStrong((id *)&v18->_speechProfileSiteURL, a3);
  v19->_dataProtectionClass = SFProtectionClassForDataSiteURL();
  if (v11)
  {
    SFGetOrCreateDirectoryURL();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      goto LABEL_10;
  }
  v21 = -[CESRDictionaryLog initWithFilename:protectionClass:directory:readOnly:create:error:]([CESRDictionaryLog alloc], "initWithFilename:protectionClass:directory:readOnly:create:error:", CFSTR("Site"), v19->_dataProtectionClass, v19->_speechProfileSiteURL, v12, v11, a8);
  log = v19->_log;
  v19->_log = v21;

  v23 = v19->_log;
  if (!v23
    || v16
    && v11
    && !-[CESRDictionaryLog writeUpdatedObject:forKey:error:](v23, "writeUpdatedObject:forKey:error:", v16, CFSTR("userId"), a8))
  {
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v19->_userIdHash, a7);
  -[CESRSpeechProfileSite userId](v19, "userId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  SFUserDescription();
  v25 = objc_claimAutoreleasedReturnValue();
  description = v19->_description;
  v19->_description = (NSString *)v25;

  +[CESRSpeechProfileInstance loadAllInstancesAtSpeechProfileSiteURL:error:](CESRSpeechProfileInstance, "loadAllInstancesAtSpeechProfileSiteURL:error:", v19->_speechProfileSiteURL, a8);
  v27 = objc_claimAutoreleasedReturnValue();
  instances = v19->_instances;
  v19->_instances = (NSMutableArray *)v27;

  if (!v19->_instances)
LABEL_10:
    v29 = 0;
  else
LABEL_9:
    v29 = v19;

  return v29;
}

- (id)description
{
  return self->_description;
}

- (NSString)userId
{
  return (NSString *)-[CESRDictionaryLog objectForKey:](self->_log, "objectForKey:", CFSTR("userId"));
}

- (NSDate)lastMaintenance
{
  return (NSDate *)-[CESRDictionaryLog objectForKey:](self->_log, "objectForKey:", CFSTR("lastMaintenance"));
}

- (BOOL)recordMaintenance:(id *)a3
{
  CESRDictionaryLog *log;
  void *v5;

  log = self->_log;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[CESRDictionaryLog writeUpdatedObject:forKey:error:](log, "writeUpdatedObject:forKey:error:", v5, CFSTR("lastMaintenance"), a3);

  return (char)a3;
}

- (NSArray)instances
{
  return (NSArray *)self->_instances;
}

- (id)instanceWithLocale:(id)a3 options:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v5;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v5 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_instances;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "locale");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqual:", v7))
        {
          v15 = objc_msgSend(v13, "options");

          if (v15 == (_DWORD)v5)
          {
            v16 = v13;

            goto LABEL_14;
          }
        }
        else
        {

        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  +[CESRSpeechProfileInstance loadOrCreateInstanceAtSpeechProfileSiteURL:locale:options:error:](CESRSpeechProfileInstance, "loadOrCreateInstanceAtSpeechProfileSiteURL:locale:options:error:", self->_speechProfileSiteURL, v7, v5, a5);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
    -[NSMutableArray addObject:](self->_instances, "addObject:", v16);
LABEL_14:

  return v16;
}

- (BOOL)removeInstance:(id)a3 error:(id *)a4
{
  id v6;
  int v7;

  v6 = a3;
  v7 = objc_msgSend(v6, "remove:", a4);
  if (v7)
    -[NSMutableArray removeObject:](self->_instances, "removeObject:", v6);

  return v7;
}

- (BOOL)remove:(id *)a3
{
  return SFRemoveItemIfExistsAtURL();
}

- (BOOL)isEqual:(id)a3
{
  CESRSpeechProfileSite *v4;
  CESRSpeechProfileSite *v5;
  BOOL v6;

  v4 = (CESRSpeechProfileSite *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CESRSpeechProfileSite isEqualToSpeechProfileSite:](self, "isEqualToSpeechProfileSite:", v5);

  return v6;
}

- (BOOL)isEqualToSpeechProfileSite:(id)a3
{
  void *v4;

  objc_msgSend(a3, "speechProfileSiteURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CESRSpeechProfileSite isEquivalentSpeechProfileSiteURL:](self, "isEquivalentSpeechProfileSiteURL:", v4);

  return (char)self;
}

- (BOOL)isEquivalentSpeechProfileSiteURL:(id)a3
{
  NSURL *speechProfileSiteURL;
  id v4;
  void *v5;
  void *v6;

  speechProfileSiteURL = self->_speechProfileSiteURL;
  v4 = a3;
  -[NSURL path](speechProfileSiteURL, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  return -[NSURL hash](self->_speechProfileSiteURL, "hash");
}

- (NSURL)speechProfileSiteURL
{
  return self->_speechProfileSiteURL;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (NSNumber)userIdHash
{
  return self->_userIdHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdHash, 0);
  objc_storeStrong((id *)&self->_speechProfileSiteURL, 0);
  objc_storeStrong((id *)&self->_instances, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

+ (id)_speechProfileSiteAtRootDirectoryURL:(id)a3 userId:(id)a4 readOnly:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  _QWORD v29[2];

  v7 = a5;
  v29[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a3;
  SFUserIdHash();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SFDataSiteURL();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSpeechProfileSiteURL:readOnly:create:userId:userIdHash:error:", v13, v7, v7 ^ 1, v10, v12, a6);
  v15 = v14;
  if (!v14)
  {
LABEL_12:
    v18 = 0;
    goto LABEL_13;
  }
  if (!v10)
  {
    objc_msgSend(v14, "userId");
    a1 = (id)objc_claimAutoreleasedReturnValue();
    if (!a1)
      goto LABEL_6;
  }
  objc_msgSend(v15, "userId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v10, "isEqual:", v16);

  if (!v10)
  {

    if ((v17 & 1) != 0)
      goto LABEL_6;
    goto LABEL_8;
  }
  if ((v17 & 1) == 0)
  {
LABEL_8:
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB28A8];
    v28 = *MEMORY[0x1E0CB2D50];
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v15, "speechProfileSiteURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("Speech profile site: %@ does not match userId: \"%@\" at speechProfileSiteURL: %@"), v15, v10, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, -1000, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (a6 && v25)
      *a6 = objc_retainAutorelease(v25);

    goto LABEL_12;
  }
LABEL_6:
  v18 = v15;
LABEL_13:

  return v18;
}

+ (id)_existingSpeechProfileSiteAtURL:(id)a3 readOnly:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v26;
  _QWORD v27[2];

  v6 = a4;
  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  SFUserIdHashFromDataSiteURL();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSpeechProfileSiteURL:readOnly:create:userId:userIdHash:error:", v8, v6, 0, 0, v9, a5);

  if (v10)
  {
    if (!v9)
    {
      objc_msgSend(v10, "userId");
      a1 = (id)objc_claimAutoreleasedReturnValue();
      SFUserIdHash();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {

        goto LABEL_15;
      }
      v8 = (id)v11;
    }
    objc_msgSend(v10, "userId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SFUserIdHash();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "isEqual:", v13);

    if (v9)
    {
      if ((v14 & 1) != 0)
        goto LABEL_15;
      goto LABEL_9;
    }

    if ((v14 & 1) == 0)
    {
LABEL_9:
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB28A8];
      v26 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)MEMORY[0x1E0CB3940];
      SFUserIdHashToString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "speechProfileSiteURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("Speech profile site: %@ does not match userIdHash: %@ at speechProfileSiteURL: %@"), v10, v18, v19, v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, -1000, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (a5 && v22)
        *a5 = objc_retainAutorelease(v22);

      goto LABEL_13;
    }
LABEL_15:
    v24 = v10;
    goto LABEL_16;
  }
LABEL_13:
  v24 = 0;
LABEL_16:

  return v24;
}

@end
