@implementation AASuspensionInfo

- (AASuspensionInfo)init
{
  -[AASuspensionInfo doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (AASuspensionInfo)initWithDictionary:(id)a3
{
  id v4;
  AASuspensionInfo *v5;
  uint64_t v6;
  NSDictionary *suspensionInfoDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AASuspensionInfo;
  v5 = -[AASuspensionInfo init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    suspensionInfoDictionary = v5->_suspensionInfoDictionary;
    v5->_suspensionInfoDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDictionary:", self->_suspensionInfoDictionary);
}

- (BOOL)isiCloudSuspended
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_suspensionInfoDictionary, "objectForKey:", CFSTR("icloud"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isFamilySuspended
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_suspensionInfoDictionary, "objectForKey:", CFSTR("family"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suspensionInfoDictionary, 0);
}

@end
