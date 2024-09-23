@implementation CloudFeatureObject

- (CloudFeatureObject)initWithFeatureID:(id)a3 status:(int64_t)a4 canUse:(BOOL)a5 limit:(id)a6 accessToken:(id)a7
{
  id v12;
  id v13;
  id v14;
  CloudFeatureObject *v15;
  uint64_t v16;
  NSString *featureID;
  uint64_t v18;
  NSString *accessToken;
  objc_super v21;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CloudFeatureObject;
  v15 = -[CloudFeatureObject init](&v21, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    featureID = v15->_featureID;
    v15->_featureID = (NSString *)v16;

    v15->_status = a4;
    v15->_canUse = a5;
    objc_storeStrong((id *)&v15->_limit, a6);
    v18 = objc_msgSend(v14, "copy");
    accessToken = v15->_accessToken;
    v15->_accessToken = (NSString *)v18;

  }
  return v15;
}

- (CloudFeatureObject)initWithFeatureID:(id)a3 status:(int64_t)a4 canUse:(BOOL)a5 accessToken:(id)a6
{
  return -[CloudFeatureObject initWithFeatureID:status:canUse:limit:accessToken:](self, "initWithFeatureID:status:canUse:limit:accessToken:", a3, a4, a5, 0, a6);
}

- (CloudFeatureObject)initWithFeatureID:(id)a3 status:(int64_t)a4 canUse:(BOOL)a5 intValue:(int64_t)a6 accessToken:(id)a7
{
  _BOOL8 v8;
  void *v12;
  id v13;
  id v14;
  void *v15;
  CloudFeatureObject *v16;

  v8 = a5;
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = a7;
  v14 = a3;
  objc_msgSend(v12, "numberWithInteger:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CloudFeatureObject initWithFeatureID:status:canUse:limit:accessToken:](self, "initWithFeatureID:status:canUse:limit:accessToken:", v14, a4, v8, v15, v13);

  return v16;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ID: %@, status: %ld, canUse: %d, limit: %@, accessToken: %@"), self->_featureID, self->_status, self->_canUse, self->_limit, self->_accessToken);
}

- (CloudFeatureObject)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CloudFeatureObject;
  return -[CloudFeatureObject init](&v3, sel_init);
}

- (NSString)featureID
{
  return self->_featureID;
}

- (BOOL)canUse
{
  return self->_canUse;
}

- (NSNumber)limit
{
  return self->_limit;
}

- (NSString)accessToken
{
  return self->_accessToken;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_featureID, 0);
}

@end
