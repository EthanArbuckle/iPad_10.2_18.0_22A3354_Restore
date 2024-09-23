@implementation SFFormAutoFillFrameHandle

- (SFFormAutoFillFrameHandle)initWithFrameHandle:(id)a3 URL:(id)a4 serverTrust:(__SecTrust *)a5 pageID:(id)a6
{
  id v11;
  id v12;
  id v13;
  SFFormAutoFillFrameHandle *v14;
  SFFormAutoFillFrameHandle *v15;
  SFFormAutoFillFrameHandle *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SFFormAutoFillFrameHandle;
  v14 = -[SFFormAutoFillFrameHandle init](&v18, sel_init);
  v15 = v14;
  v16 = 0;
  if (v14 && v11 && v12)
  {
    objc_storeStrong((id *)&v14->_frameHandle, a3);
    objc_storeStrong((id *)&v15->_URL, a4);
    if (a5)
      v15->_serverTrust = (__SecTrust *)CFRetain(a5);
    objc_storeStrong((id *)&v15->_pageID, a6);
    v16 = v15;
  }

  return v16;
}

- (WBSGlobalFrameIdentifier)webFrameIdentifier
{
  id v3;
  NSNumber *pageID;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0D8A978]);
  pageID = self->_pageID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_WKFrameHandle frameID](self->_frameHandle, "frameID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithPageID:frameID:", pageID, v5);

  return (WBSGlobalFrameIdentifier *)v6;
}

- (void)dealloc
{
  __SecTrust *serverTrust;
  objc_super v4;

  serverTrust = self->_serverTrust;
  if (serverTrust)
    CFRelease(serverTrust);
  v4.receiver = self;
  v4.super_class = (Class)SFFormAutoFillFrameHandle;
  -[SFFormAutoFillFrameHandle dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  SFFormAutoFillFrameHandle *v4;
  void *v5;
  char isKindOfClass;
  SFFormAutoFillFrameHandle *v7;
  NSNumber *pageID;
  void *v9;
  char v10;

  v4 = (SFFormAutoFillFrameHandle *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      if (-[_WKFrameHandle isEqual:](self->_frameHandle, "isEqual:", v7->_frameHandle)
        && -[NSURL isEqual:](self->_URL, "isEqual:", v7->_URL))
      {
        pageID = self->_pageID;
        -[SFFormAutoFillFrameHandle pageID](v7, "pageID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[NSNumber isEqualToNumber:](pageID, "isEqualToNumber:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[_WKFrameHandle hash](self->_frameHandle, "hash");
  v4 = -[NSURL hash](self->_URL, "hash") ^ v3;
  return v4 ^ -[NSNumber hash](self->_pageID, "hash");
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; URL = \"%@\"; frameID: %llu, pageID: %llu>"),
    v5,
    self,
    self->_URL,
    -[_WKFrameHandle frameID](self->_frameHandle, "frameID"),
    -[NSNumber unsignedLongLongValue](self->_pageID, "unsignedLongLongValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFFormAutoFillFrameHandle)initWithCoder:(id)a3
{
  id v4;
  SFFormAutoFillFrameHandle *v5;
  SFFormAutoFillFrameHandle *v6;
  void *v7;
  SFFormAutoFillFrameHandle *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFFormAutoFillFrameHandle;
  v5 = -[SFFormAutoFillFrameHandle init](&v13, sel_init);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverTrust"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (SFFormAutoFillFrameHandle *)SecTrustDeserialize();
      if (!v8)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("frameHandle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pageID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SFFormAutoFillFrameHandle initWithFrameHandle:URL:serverTrust:pageID:](v6, "initWithFrameHandle:URL:serverTrust:pageID:", v9, v10, v8, v11);

    if (v8)
      CFRelease(v8);
    v8 = v6;
    goto LABEL_10;
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_frameHandle, CFSTR("frameHandle"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_URL, CFSTR("URL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_pageID, CFSTR("pageID"));
  if (self->_serverTrust)
  {
    v4 = (void *)SecTrustSerialize();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("serverTrust"));

    }
  }

}

- (NSData)serializedData
{
  void *v2;
  id v3;
  NSObject *v4;
  id v6;

  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SFFormAutoFillFrameHandle serializedData].cold.1(v4, v3);
  }

  return (NSData *)v2;
}

+ (id)frameHandleFromSerializedData:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v18;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "_strictlyUnarchivedObjectOfClasses:fromData:error:", v12, v3, &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v18;
    if (v14)
    {
      v15 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[SFFormAutoFillFrameHandle frameHandleFromSerializedData:].cold.1(v15, v14);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v13;
LABEL_9:

        goto LABEL_10;
      }
    }
    v16 = 0;
    goto LABEL_9;
  }
  v16 = 0;
LABEL_10:

  return v16;
}

- (NSURL)webui_URL
{
  return self->_URL;
}

- (__SecTrust)webui_serverTrust
{
  return self->_serverTrust;
}

- (_WKFrameHandle)frameHandle
{
  return self->_frameHandle;
}

- (NSNumber)pageID
{
  return self->_pageID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageID, 0);
  objc_storeStrong((id *)&self->_frameHandle, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (SFFormAutoFillFrameHandle)initWithWebProcessPlugInFrame:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SFFormAutoFillFrameHandle *v11;

  v4 = a3;
  objc_msgSend(v4, "_browserContextController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v6, "_webPageID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "_serverTrust");

  v11 = -[SFFormAutoFillFrameHandle initWithFrameHandle:URL:serverTrust:pageID:](self, "initWithFrameHandle:URL:serverTrust:pageID:", v8, v9, v10, v7);
  return v11;
}

- (void)serializedData
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v5, v6, "Failed to archive SFFormAutoFillFrameHandle: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_6();
}

+ (void)frameHandleFromSerializedData:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v5, v6, "Failed to read from SFFormAutoFillFrameHandle data with exception: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_6();
}

@end
