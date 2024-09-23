@implementation ICCloudSyncingObjectActivityEvent

+ (void)registerWithICCRCoder
{
  +[ICCRCoder registerClass:forType:](ICCRCoder, "registerClass:forType:", a1, CFSTR("com.apple.notes.ICCloudSyncingObjectActivityEvent"));
}

- (ICCloudSyncingObjectActivityEvent)initWithData:(id)a3 fallbackData:(id)a4
{
  id v7;
  id v8;
  ICCloudSyncingObjectActivityEvent *v9;
  ICCloudSyncingObjectActivityEvent *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICCloudSyncingObjectActivityEvent;
  v9 = -[ICCloudSyncingObjectActivityEvent init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_fallbackData, a4);
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[ICCloudSyncingObjectActivityEvent data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObjectActivityEvent fallbackData](self, "fallbackData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, dataString: %@, fallbackDataString: %@>"), v4, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  if (a3 == self)
    return 1;
  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObjectActivityEvent data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ICCloudSyncingObjectActivityEvent data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  return 0;
}

- (void)mergeWith:(id)a3
{
  if (!-[ICCloudSyncingObjectActivityEvent isEqual:](self, "isEqual:", a3))
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[self isEqual:other]", "-[ICCloudSyncingObjectActivityEvent mergeWith:]", 1, 0, CFSTR("Cannot merge ICCloudSyncingObjectActivity with a different value"));
}

- (void)encodeWithICCRCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ICCloudSyncingObjectActivityEvent data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeData:forKey:", v4, CFSTR("data"));

  -[ICCloudSyncingObjectActivityEvent fallbackData](self, "fallbackData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ICCloudSyncingObjectActivityEvent fallbackData](self, "fallbackData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeData:forKey:", v6, CFSTR("fallbackData"));

  }
}

- (ICCloudSyncingObjectActivityEvent)initWithICCRCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ICCloudSyncingObjectActivityEvent *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeDataForKey:", CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasDecodableValueForKey:", CFSTR("fallbackData")))
  {
    objc_msgSend(v4, "decodeDataForKey:", CFSTR("fallbackData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = -[ICCloudSyncingObjectActivityEvent initWithData:fallbackData:](self, "initWithData:fallbackData:", v5, v6);

  return v7;
}

- (NSData)data
{
  return self->_data;
}

- (NSData)fallbackData
{
  return self->_fallbackData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackData, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
