@implementation CSVoiceTriggerRTModel

- (CSVoiceTriggerRTModel)initWithData:(id)a3 hash:(id)a4 locale:(id)a5 digest:(id)a6 signature:(id)a7 certificate:(id)a8
{
  id v15;
  id v16;
  id v17;
  CSVoiceTriggerRTModel *v18;
  CSVoiceTriggerRTModel *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CSVoiceTriggerRTModel;
  v18 = -[CSVoiceTriggerRTModel init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_modelData, a3);
    objc_storeStrong((id *)&v19->_modelHash, a4);
    objc_storeStrong((id *)&v19->_modelLocale, a5);
    objc_storeStrong((id *)&v19->_digest, a6);
    objc_storeStrong((id *)&v19->_signature, a7);
    objc_storeStrong((id *)&v19->_certificate, a8);
  }

  return v19;
}

- (CSVoiceTriggerRTModel)initWithHash:(id)a3 locale:(id)a4
{
  id v7;
  id v8;
  CSVoiceTriggerRTModel *v9;
  CSVoiceTriggerRTModel *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSVoiceTriggerRTModel;
  v9 = -[CSVoiceTriggerRTModel init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modelHash, a3);
    objc_storeStrong((id *)&v10->_modelLocale, a4);
  }

  return v10;
}

- (CSVoiceTriggerRTModel)initWithData:(id)a3 hash:(id)a4 locale:(id)a5
{
  id v9;
  id v10;
  id v11;
  CSVoiceTriggerRTModel *v12;
  CSVoiceTriggerRTModel *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CSVoiceTriggerRTModel;
  v12 = -[CSVoiceTriggerRTModel init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_modelData, a3);
    objc_storeStrong((id *)&v13->_modelHash, a4);
    objc_storeStrong((id *)&v13->_modelLocale, a5);
  }

  return v13;
}

- (CSVoiceTriggerRTModel)initWithCoder:(id)a3
{
  id v4;
  CSVoiceTriggerRTModel *v5;
  uint64_t v6;
  NSData *modelData;
  uint64_t v8;
  NSString *modelHash;
  uint64_t v10;
  NSString *modelLocale;
  uint64_t v12;
  NSData *digest;
  uint64_t v14;
  NSData *signature;
  uint64_t v16;
  NSData *certificate;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CSVoiceTriggerRTModel;
  v5 = -[CSVoiceTriggerRTModel init](&v19, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("RTModelData")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RTModelData"));
      v6 = objc_claimAutoreleasedReturnValue();
      modelData = v5->_modelData;
      v5->_modelData = (NSData *)v6;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("RTModelHash")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RTModelHash"));
      v8 = objc_claimAutoreleasedReturnValue();
      modelHash = v5->_modelHash;
      v5->_modelHash = (NSString *)v8;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("RTModelLocale")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RTModelLocale"));
      v10 = objc_claimAutoreleasedReturnValue();
      modelLocale = v5->_modelLocale;
      v5->_modelLocale = (NSString *)v10;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("RTModelDigest")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RTModelDigest"));
      v12 = objc_claimAutoreleasedReturnValue();
      digest = v5->_digest;
      v5->_digest = (NSData *)v12;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("RTModelSignature")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RTModelSignature"));
      v14 = objc_claimAutoreleasedReturnValue();
      signature = v5->_signature;
      v5->_signature = (NSData *)v14;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("RTModelCertificate")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RTModelCertificate"));
      v16 = objc_claimAutoreleasedReturnValue();
      certificate = v5->_certificate;
      v5->_certificate = (NSData *)v16;

    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CSVoiceTriggerRTModel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CSVoiceTriggerRTModel *v11;

  v4 = [CSVoiceTriggerRTModel alloc];
  v5 = (void *)-[NSData copy](self->_modelData, "copy");
  v6 = (void *)-[NSString copy](self->_modelHash, "copy");
  v7 = (void *)-[NSString copy](self->_modelLocale, "copy");
  v8 = (void *)-[NSData copy](self->_digest, "copy");
  v9 = (void *)-[NSData copy](self->_signature, "copy");
  v10 = (void *)-[NSData copy](self->_certificate, "copy");
  v11 = -[CSVoiceTriggerRTModel initWithData:hash:locale:digest:signature:certificate:](v4, "initWithData:hash:locale:digest:signature:certificate:", v5, v6, v7, v8, v9, v10);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSData *modelData;
  NSString *modelHash;
  NSString *modelLocale;
  NSData *digest;
  NSData *signature;
  NSData *certificate;
  id v11;

  v4 = a3;
  modelData = self->_modelData;
  v11 = v4;
  if (modelData)
  {
    objc_msgSend(v4, "encodeObject:forKey:", modelData, CFSTR("RTModelData"));
    v4 = v11;
  }
  modelHash = self->_modelHash;
  if (modelHash)
  {
    objc_msgSend(v11, "encodeObject:forKey:", modelHash, CFSTR("RTModelHash"));
    v4 = v11;
  }
  modelLocale = self->_modelLocale;
  if (modelLocale)
  {
    objc_msgSend(v11, "encodeObject:forKey:", modelLocale, CFSTR("RTModelLocale"));
    v4 = v11;
  }
  digest = self->_digest;
  if (digest)
  {
    objc_msgSend(v11, "encodeObject:forKey:", digest, CFSTR("RTModelDigest"));
    v4 = v11;
  }
  signature = self->_signature;
  if (signature)
  {
    objc_msgSend(v11, "encodeObject:forKey:", signature, CFSTR("RTModelSignature"));
    v4 = v11;
  }
  certificate = self->_certificate;
  if (certificate)
  {
    objc_msgSend(v11, "encodeObject:forKey:", certificate, CFSTR("RTModelCertificate"));
    v4 = v11;
  }

}

- (id)builtInRTModelDictionary
{
  void *v3;
  void *v4;
  void *v5;
  NSData *modelData;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (!self->_modelData || !self->_modelHash || !self->_modelLocale)
    return 0;
  objc_msgSend(CFSTR("RT Model for "), "stringByAppendingString:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR(" from asset "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingString:", self->_modelHash);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  modelData = self->_modelData;
  v9[0] = CFSTR("CorealisRTModel");
  v9[1] = CFSTR("CorealisRTModelVersion");
  v10[0] = modelData;
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v3;
  NSUInteger v4;
  NSString *modelHash;
  NSString *modelLocale;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSData length](self->_modelData, "length");
  modelLocale = self->_modelLocale;
  modelHash = self->_modelHash;
  -[NSData base64EncodedStringWithOptions:](self->_digest, "base64EncodedStringWithOptions:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "substringToIndex:", 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData base64EncodedStringWithOptions:](self->_certificate, "base64EncodedStringWithOptions:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "substringToIndex:", 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData base64EncodedStringWithOptions:](self->_signature, "base64EncodedStringWithOptions:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "substringToIndex:", 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("dataSize(%d), hash(%@), locale(%@), digest(%@), cert(%@), signature(%@)"), v4, modelHash, modelLocale, v8, v10, v12);

  return v3;
}

- (NSData)modelData
{
  return self->_modelData;
}

- (NSString)modelLocale
{
  return self->_modelLocale;
}

- (NSString)modelHash
{
  return self->_modelHash;
}

- (NSData)digest
{
  return self->_digest;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSData)certificate
{
  return self->_certificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_modelHash, 0);
  objc_storeStrong((id *)&self->_modelLocale, 0);
  objc_storeStrong((id *)&self->_modelData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
