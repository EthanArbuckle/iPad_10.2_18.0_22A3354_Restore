@implementation DEDSeedingFilerToken

- (DEDSeedingFilerToken)initWithEntityID:(id)a3 type:(int64_t)a4 token:(id)a5 dsid:(id)a6
{
  id v10;
  id v11;
  id v12;
  DEDSeedingFilerToken *v13;
  uint64_t v14;
  NSNumber *entityID;
  uint64_t v16;
  NSString *token;
  uint64_t v18;
  NSString *dsid;
  objc_super v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)DEDSeedingFilerToken;
  v13 = -[DEDSeedingFilerToken init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    entityID = v13->_entityID;
    v13->_entityID = (NSNumber *)v14;

    v13->_submissionType = a4;
    v16 = objc_msgSend(v11, "copy");
    token = v13->_token;
    v13->_token = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    dsid = v13->_dsid;
    v13->_dsid = (NSString *)v18;

  }
  return v13;
}

- (id)compiledEntityID
{
  void *v3;
  int64_t v4;
  const char *v5;
  const char *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[DEDSeedingFilerToken submissionType](self, "submissionType");
  v5 = "Unknown";
  if (v4 == 2)
    v5 = "FFU";
  if (v4 == 1)
    v6 = "FR";
  else
    v6 = v5;
  -[DEDSeedingFilerToken entityID](self, "entityID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%s:%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSNumber)entityID
{
  return self->_entityID;
}

- (NSString)token
{
  return self->_token;
}

- (NSString)dsid
{
  return self->_dsid;
}

- (int64_t)submissionType
{
  return self->_submissionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_entityID, 0);
}

@end
