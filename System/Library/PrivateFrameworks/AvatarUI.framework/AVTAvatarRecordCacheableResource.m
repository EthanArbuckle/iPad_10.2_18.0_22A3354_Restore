@implementation AVTAvatarRecordCacheableResource

- (AVTAvatarRecordCacheableResource)initWithAvatarRecord:(id)a3 includeAvatarData:(BOOL)a4 environment:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  AVTAvatarRecordCacheableResource *v11;
  AVTAvatarRecordCacheableResource *v12;
  char isKindOfClass;
  objc_super v15;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVTAvatarRecordCacheableResource;
  v11 = -[AVTAvatarRecordCacheableResource init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_record, a3);
    if (v6)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      isKindOfClass = 0;
    }
    v12->_includeAvatarData = isKindOfClass & 1;
    objc_storeStrong((id *)&v12->_environment, a5);
  }

  return v12;
}

+ (id)persistentIdentifierPrefixForRecordWithIdentifier:(id)a3
{
  return a3;
}

- (id)identifierForScope:(id)a3
{
  id v4;
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

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_class();
  -[AVTAvatarRecordCacheableResource record](self, "record");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistentIdentifierPrefixForRecordWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v9);

  objc_msgSend(v5, "appendFormat:", CFSTR("_AK%lu"), AVTAvatarKitSnapshotVersionNumber());
  if (-[AVTAvatarRecordCacheableResource includeAvatarData](self, "includeAvatarData"))
  {
    v10 = (void *)objc_opt_class();
    -[AVTAvatarRecordCacheableResource record](self, "record");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "avatarData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "persistentIdentifierForRecordData:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("_%@"), v13);

  }
  if (v4)
  {
    objc_msgSend(v4, "cacheableResourceAssociatedIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v14);

  }
  v15 = (void *)objc_msgSend(v5, "copy");

  return v15;
}

- (unint64_t)costForScope:(id)a3
{
  return objc_msgSend(a3, "cacheableResourceAssociatedCost");
}

+ (id)persistentIdentifierForRecordData:(id)a3
{
  return (id)objc_msgSend(a3, "avt_SHA256");
}

- (id)persistentDataHashForScope:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[AVTAvatarRecordCacheableResource record](self, "record", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEditable");

  if (v5)
  {
    v6 = (void *)objc_opt_class();
    -[AVTAvatarRecordCacheableResource record](self, "record");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "avatarData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistentIdentifierForRecordData:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)requiresEncryption
{
  void *v2;
  char v3;

  -[AVTAvatarRecordCacheableResource record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditable");

  return v3;
}

- (id)tokenForObservingChangesWithHandler:(id)a3
{
  id v4;
  void *v5;
  int v6;
  AVTAvatarRecordCacheableResourceChangeToken *v7;
  void *v8;
  void *v9;
  void *v10;
  AVTAvatarRecordCacheableResourceChangeToken *v11;

  v4 = a3;
  -[AVTAvatarRecordCacheableResource record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEditable");

  if (v6)
  {
    v7 = [AVTAvatarRecordCacheableResourceChangeToken alloc];
    -[AVTAvatarRecordCacheableResource environment](self, "environment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarRecordCacheableResource record](self, "record");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AVTAvatarRecordCacheableResourceChangeToken initWithEnvironment:recordIdentifier:changeHandler:](v7, "initWithEnvironment:recordIdentifier:changeHandler:", v8, v10, v4);

    -[AVTAvatarRecordCacheableResourceChangeToken startObservingChanges](v11, "startObservingChanges");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVTAvatarRecordCacheableResource;
  -[AVTAvatarRecordCacheableResource description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)objc_opt_class();
  -[AVTAvatarRecordCacheableResource record](self, "record");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentIdentifierPrefixForRecordWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" persistentIDPrefix: %@"), v8);

  v9 = (void *)objc_msgSend(v4, "copy");
  return (NSString *)v9;
}

- (AVTAvatarRecord)record
{
  return self->_record;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (BOOL)includeAvatarData
{
  return self->_includeAvatarData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end
