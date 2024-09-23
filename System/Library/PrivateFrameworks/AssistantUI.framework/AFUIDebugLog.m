@implementation AFUIDebugLog

+ (id)logWithData:(id)a3 mimeType:(id)a4 name:(id)a5 attemptCompression:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:mimeType:name:attemptCompression:", v12, v11, v10, v6);

  return v13;
}

- (AFUIDebugLog)initWithData:(id)a3 mimeType:(id)a4 name:(id)a5 attemptCompression:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  AFUIDebugLog *v13;
  uint64_t v14;
  NSData *data;
  NSString *mimeType;
  uint64_t v17;
  uint64_t v18;
  NSData *v19;
  uint64_t v20;
  NSString *v21;
  NSString *name;
  objc_super v24;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v24.receiver = self;
  v24.super_class = (Class)AFUIDebugLog;
  v13 = -[AFUIDebugLog init](&v24, sel_init);
  if (v13)
  {
    if (v6)
    {
      objc_msgSend(v10, "sruif_dataByCompressingWithGzip");
      v14 = objc_claimAutoreleasedReturnValue();
      data = v13->_data;
      v13->_data = (NSData *)v14;

    }
    if (v13->_data)
    {
      mimeType = v13->_mimeType;
      v13->_mimeType = (NSString *)CFSTR("application/x-gzip");

      objc_msgSend(v12, "stringByAppendingPathExtension:", CFSTR("gz"));
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = objc_msgSend(v10, "copy");
      v19 = v13->_data;
      v13->_data = (NSData *)v18;

      v20 = objc_msgSend(v11, "copy");
      v21 = v13->_mimeType;
      v13->_mimeType = (NSString *)v20;

      v17 = objc_msgSend(v12, "copy");
    }
    name = v13->_name;
    v13->_name = (NSString *)v17;

    if (!v13->_mimeType)
    {
      v13->_mimeType = (NSString *)CFSTR("application/octet-stream");

    }
  }

  return v13;
}

- (NSData)data
{
  return self->_data;
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
