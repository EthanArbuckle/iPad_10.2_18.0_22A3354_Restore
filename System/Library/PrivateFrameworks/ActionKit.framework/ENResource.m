@implementation ENResource

- (ENResource)initWithData:(id)a3 mimeType:(id)a4 filename:(id)a5
{
  id v8;
  id v9;
  id v10;
  ENResource *v11;
  ENResource *v12;
  void *v13;
  ENResource *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ENResource;
  v11 = -[ENResource init](&v19, sel_init);
  v12 = v11;
  if (v11
    && (-[ENResource setData:](v11, "setData:", v8),
        -[ENResource setMimeType:](v12, "setMimeType:", v9),
        -[ENResource setFilename:](v12, "setFilename:", v10),
        -[ENResource data](v12, "data"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[WARNING]: data is a required argument, this may become an assertion at a later date"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "evernoteLogErrorString:", v17);

    v14 = 0;
  }
  else
  {
    v14 = v12;
  }

  return v14;
}

- (ENResource)initWithData:(id)a3 mimeType:(id)a4
{
  return -[ENResource initWithData:mimeType:filename:](self, "initWithData:mimeType:filename:", a3, a4, 0);
}

- (void)setData:(id)a3
{
  NSData *v4;
  NSData *v5;
  void *v6;
  void *v7;
  void *v8;
  NSData *data;

  v4 = (NSData *)a3;
  v5 = v4;
  if (v4 && -[NSData length](v4, "length") >= 0x7FFFFFFF)
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Data length for resource is greater than int32."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "evernoteLogErrorString:", v8);

    v5 = 0;
  }
  -[ENResource setDataHash:](self, "setDataHash:", 0);
  data = self->_data;
  self->_data = v5;

}

- (NSData)dataHash
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSData *v6;
  NSData *dataHash;

  if (!self->_dataHash)
  {
    -[ENResource data](self, "data");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      -[ENResource data](self, "data");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "enmd5");
      v6 = (NSData *)objc_claimAutoreleasedReturnValue();
      dataHash = self->_dataHash;
      self->_dataHash = v6;

    }
  }
  return self->_dataHash;
}

- (id)EDAMResource
{
  EDAMResource *v3;
  void *v4;
  EDAMData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  EDAMResourceAttributes *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  -[ENResource data](self, "data");
  v3 = (EDAMResource *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v3 = objc_alloc_init(EDAMResource);
    -[ENResource data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = objc_alloc_init(EDAMData);
      -[EDAMResource setData:](v3, "setData:", v5);

      -[ENResource dataHash](self, "dataHash");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDAMResource data](v3, "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBodyHash:", v6);

      v8 = (void *)MEMORY[0x24BDD16E0];
      -[ENResource data](self, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDAMResource data](v3, "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSize:", v10);

      -[ENResource data](self, "data");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDAMResource data](v3, "data");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBody:", v12);

    }
    -[ENResource mimeType](self, "mimeType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDAMResource setMime:](v3, "setMime:", v14);

    v15 = objc_alloc_init(EDAMResourceAttributes);
    -[ENResource filename](self, "filename");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[ENResource filename](self, "filename");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDAMResourceAttributes setFileName:](v15, "setFileName:", v17);

    }
    -[ENResource sourceUrl](self, "sourceUrl");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[ENResource sourceUrl](self, "sourceUrl");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDAMResourceAttributes setSourceURL:](v15, "setSourceURL:", v19);

    }
    -[EDAMResource setAttributes:](v3, "setAttributes:", v15);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[ENResource edamAttributes](self, "edamAttributes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v31;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(v21);
          v25 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v24);
          -[ENResource edamAttributes](self, "edamAttributes");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "valueForKey:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          -[EDAMResource attributes](v3, "attributes");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setValue:forKey:", v27, v25);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v22);
    }

  }
  return v3;
}

- (NSString)mediaTag
{
  void *v3;
  void *v4;
  void *v5;

  -[ENResource dataHash](self, "dataHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENResource mimeType](self, "mimeType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENMLUtility mediaTagWithDataHash:mime:](ENMLUtility, "mediaTagWithDataHash:mime:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSData)data
{
  return self->_data;
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)sourceUrl
{
  return self->_sourceUrl;
}

- (void)setSourceUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setDataHash:(id)a3
{
  objc_storeStrong((id *)&self->_dataHash, a3);
}

- (NSDictionary)edamAttributes
{
  return self->_edamAttributes;
}

- (void)setEdamAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_edamAttributes, a3);
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_edamAttributes, 0);
  objc_storeStrong((id *)&self->_dataHash, 0);
  objc_storeStrong((id *)&self->_sourceUrl, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

+ (id)resourceWithServiceResource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  ENResource *v6;
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

  v3 = a3;
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(ENResource);
    objc_msgSend(v3, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "body");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENResource setData:](v6, "setData:", v8);

    objc_msgSend(v3, "mime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENResource setMimeType:](v6, "setMimeType:", v9);

    objc_msgSend(v3, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENResource setFilename:](v6, "setFilename:", v11);

    objc_msgSend(v3, "attributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sourceURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENResource setSourceUrl:](v6, "setSourceUrl:", v13);

    objc_msgSend(v3, "guid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENResource setGuid:](v6, "setGuid:", v14);
  }
  else
  {
    +[ENSession sharedSession](ENSession, "sharedSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't create an ENResource from an EDAMResource with no body"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "evernoteLogErrorString:", v16);

    v6 = 0;
  }

  return v6;
}

@end
