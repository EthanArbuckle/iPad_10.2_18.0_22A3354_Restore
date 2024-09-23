@implementation FBKFilerToken

- (FBKFilerToken)initWithEntityID:(id)a3 type:(unint64_t)a4 token:(id)a5 dsid:(id)a6
{
  id v10;
  id v11;
  id v12;
  FBKFilerToken *v13;
  uint64_t v14;
  NSNumber *entityID;
  uint64_t v16;
  NSString *token;
  uint64_t v18;
  NSNumber *dsid;
  objc_super v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)FBKFilerToken;
  v13 = -[FBKFilerToken init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    entityID = v13->_entityID;
    v13->_entityID = (NSNumber *)v14;

    v13->_entityType = a4;
    v16 = objc_msgSend(v11, "copy");
    token = v13->_token;
    v13->_token = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    dsid = v13->_dsid;
    v13->_dsid = (NSNumber *)v18;

  }
  return v13;
}

- (NSNumber)entityID
{
  return self->_entityID;
}

- (NSString)token
{
  return self->_token;
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (unint64_t)entityType
{
  return self->_entityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_entityID, 0);
}

@end
