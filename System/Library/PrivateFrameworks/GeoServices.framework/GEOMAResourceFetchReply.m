@implementation GEOMAResourceFetchReply

- (BOOL)isValid
{
  return 1;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  NSURL *url;
  id v6;
  NSData *sandBoxToken;
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOMAResourceFetchReply;
  -[GEOXPCReply encodeToXPCDictionary:](&v9, sel_encodeToXPCDictionary_, v4);
  url = self->_url;
  if (url)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", url, 1, 0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "url", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

  }
  sandBoxToken = self->_sandBoxToken;
  if (sandBoxToken)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", sandBoxToken, 1, 0);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "sbt", (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));

  }
}

- (void)setSandBoxToken:(id)a3
{
  objc_storeStrong((id *)&self->_sandBoxToken, a3);
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (GEOMAResourceFetchReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOMAResourceFetchReply *v7;
  const void *data;
  void *v9;
  uint64_t v10;
  NSURL *url;
  const void *v12;
  void *v13;
  uint64_t v14;
  NSData *sandBoxToken;
  GEOMAResourceFetchReply *v16;
  size_t length;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOMAResourceFetchReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v19, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    length = 0;
    data = xpc_dictionary_get_data(v6, "url", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, a4);
      v10 = objc_claimAutoreleasedReturnValue();
      url = v7->_url;
      v7->_url = (NSURL *)v10;

    }
    length = 0;
    v12 = xpc_dictionary_get_data(v6, "sbt", &length);
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v12, length, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v13, a4);
      v14 = objc_claimAutoreleasedReturnValue();
      sandBoxToken = v7->_sandBoxToken;
      v7->_sandBoxToken = (NSData *)v14;

    }
    v16 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandBoxToken, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (NSURL)url
{
  return self->_url;
}

- (NSData)sandBoxToken
{
  return self->_sandBoxToken;
}

@end
