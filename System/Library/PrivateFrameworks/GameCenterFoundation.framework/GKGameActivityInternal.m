@implementation GKGameActivityInternal

- (BOOL)isEqual:(id)a3
{
  GKGameActivityInternal *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (GKGameActivityInternal *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[GKGameActivityInternal activityID](v4, "activityID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKGameActivityInternal activityID](self, "activityID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKGameActivityInternal activityID](self, "activityID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_1 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_1, &__block_literal_global_12);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_1;
}

void __49__GKGameActivityInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v7[0] = objc_opt_class();
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0, CFSTR("activityType"), CFSTR("userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  v6[2] = CFSTR("activityID");
  v7[2] = objc_opt_class();
  v6[3] = CFSTR("bundleID");
  v7[3] = objc_opt_class();
  v6[4] = CFSTR("createdAt");
  v7[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 5);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_1;
  secureCodedPropertyKeys_sSecureCodedKeys_1 = v4;

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameActivityInternal activityID](self, "activityID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameActivityInternal activityType](self, "activityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameActivityInternal bundleID](self, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameActivityInternal createdAt](self, "createdAt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameActivityInternal userInfo](self, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, activityID: %@, activityType: %@, bundleID: %@, createdAt: %@, userInfo: %@>"), v5, self, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (GKGameActivityInternal)initWithActivityType:(id)a3 bundleID:(id)a4 andUserInfo:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  GKGameActivityInternal *v13;

  v8 = (void *)MEMORY[0x1E0C99D68];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[GKGameActivityInternal initWithActivityType:bundleID:createdAt:andUserInfo:](self, "initWithActivityType:bundleID:createdAt:andUserInfo:", v11, v10, v12, v9);

  return v13;
}

- (GKGameActivityInternal)initWithActivityType:(id)a3 bundleID:(id)a4 createdAt:(id)a5 andUserInfo:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  GKGameActivityInternal *v15;
  GKGameActivityInternal *v16;
  void *v17;
  uint64_t v18;
  NSString *activityID;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)GKGameActivityInternal;
  v15 = -[GKGameActivityInternal init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_activityType, a3);
    objc_storeStrong((id *)&v16->_userInfo, a6);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = objc_claimAutoreleasedReturnValue();
    activityID = v16->_activityID;
    v16->_activityID = (NSString *)v18;

    objc_storeStrong((id *)&v16->_bundleID, a4);
    objc_storeStrong((id *)&v16->_createdAt, a5);
  }

  return v16;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)activityID
{
  return self->_activityID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_activityID, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

@end
