@implementation HMDUserPresenceFeed

- (HMDUserPresenceFeed)initWithUser:(id)a3 presenceAuthStatus:(id)a4 presenceComputeStatus:(id)a5 presenceRegion:(id)a6 reason:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDUserPresenceFeed *v17;
  HMDUserPresenceFeed *v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)HMDUserPresenceFeed;
  v17 = -[HMDUserPresenceFeed init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_user, v12);
    objc_storeStrong((id *)&v18->_presenceAuthStatus, a4);
    objc_storeStrong((id *)&v18->_presenceComputeStatus, a5);
    objc_storeStrong((id *)&v18->_presenceRegion, a6);
    objc_storeStrong((id *)&v18->_reason, a7);
  }

  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDUserPresenceFeed user](self, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserPresenceFeed presenceAuthStatus](self, "presenceAuthStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserPresenceFeed presenceComputeStatus](self, "presenceComputeStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserPresenceFeed presenceRegion](self, "presenceRegion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserPresenceFeed reason](self, "reason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[HMDUserPresenceFeed User: %@, Auth: %@, Compute: %@, Region: %@, Reason: %@]"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  HMDUserPresenceFeed *v4;
  HMDUserPresenceFeed *v5;
  HMDUserPresenceFeed *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  char v23;

  v4 = (HMDUserPresenceFeed *)a3;
  if (v4 == self)
  {
    v23 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (!v6)
      goto LABEL_11;
    -[HMDUserPresenceFeed user](self, "user");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserPresenceFeed user](v6, "user");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if (!v11)
      goto LABEL_11;
    -[HMDUserPresenceFeed presenceAuthStatus](self, "presenceAuthStatus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserPresenceFeed presenceAuthStatus](v6, "presenceAuthStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (!v14)
      goto LABEL_11;
    -[HMDUserPresenceFeed presenceComputeStatus](self, "presenceComputeStatus");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserPresenceFeed presenceComputeStatus](v6, "presenceComputeStatus");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_11;
    -[HMDUserPresenceFeed presenceRegion](self, "presenceRegion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserPresenceFeed presenceRegion](v6, "presenceRegion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (v20)
    {
      -[HMDUserPresenceFeed reason](self, "reason");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserPresenceFeed reason](v6, "reason");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqual:", v22);

    }
    else
    {
LABEL_11:
      v23 = 0;
    }

  }
  return v23;
}

- (HMDUser)user
{
  return (HMDUser *)objc_loadWeakRetained((id *)&self->_user);
}

- (HMUserPresenceAuthorization)presenceAuthStatus
{
  return self->_presenceAuthStatus;
}

- (HMUserPresenceCompute)presenceComputeStatus
{
  return self->_presenceComputeStatus;
}

- (HMDUserPresenceRegion)presenceRegion
{
  return self->_presenceRegion;
}

- (HMDUserPresenceUpdateReason)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_presenceRegion, 0);
  objc_storeStrong((id *)&self->_presenceComputeStatus, 0);
  objc_storeStrong((id *)&self->_presenceAuthStatus, 0);
  objc_destroyWeak((id *)&self->_user);
}

@end
