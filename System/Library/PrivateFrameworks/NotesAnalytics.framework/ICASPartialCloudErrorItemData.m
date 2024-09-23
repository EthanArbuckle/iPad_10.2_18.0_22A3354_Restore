@implementation ICASPartialCloudErrorItemData

- (ICASPartialCloudErrorItemData)initWithSyncableDataType:(id)a3 errorCode:(id)a4 count:(id)a5 errorString:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ICASPartialCloudErrorItemData *v15;
  ICASPartialCloudErrorItemData *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICASPartialCloudErrorItemData;
  v15 = -[ICASPartialCloudErrorItemData init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_syncableDataType, a3);
    objc_storeStrong((id *)&v16->_errorCode, a4);
    objc_storeStrong((id *)&v16->_count, a5);
    objc_storeStrong((id *)&v16->_errorString, a6);
  }

  return v16;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("PartialCloudErrorItemData");
}

- (id)toDict
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("syncableDataType");
  -[ICASPartialCloudErrorItemData syncableDataType](self, "syncableDataType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICASPartialCloudErrorItemData syncableDataType](self, "syncableDataType");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v18[0] = v4;
  v17[1] = CFSTR("errorCode");
  -[ICASPartialCloudErrorItemData errorCode](self, "errorCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICASPartialCloudErrorItemData errorCode](self, "errorCode");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v18[1] = v7;
  v17[2] = CFSTR("count");
  -[ICASPartialCloudErrorItemData count](self, "count");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ICASPartialCloudErrorItemData count](self, "count");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v18[2] = v10;
  v17[3] = CFSTR("errorString");
  -[ICASPartialCloudErrorItemData errorString](self, "errorString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[ICASPartialCloudErrorItemData errorString](self, "errorString");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v18[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSString)syncableDataType
{
  return self->_syncableDataType;
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (NSNumber)count
{
  return self->_count;
}

- (NSString)errorString
{
  return self->_errorString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorString, 0);
  objc_storeStrong((id *)&self->_count, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_syncableDataType, 0);
}

@end
