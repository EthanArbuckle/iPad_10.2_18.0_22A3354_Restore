@implementation HMDHomePresenceUpdate

- (HMDHomePresenceUpdate)initWithHomePresence:(id)a3 userPresence:(id)a4 update:(BOOL)a5 causingDevice:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMDHomePresenceUpdate *v14;
  HMDHomePresenceUpdate *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HMDHomePresenceUpdate;
  v14 = -[HMDHomePresenceUpdate init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_homePresence, a3);
    objc_storeStrong((id *)&v15->_userPresence, a4);
    v15->_update = a5;
    objc_storeStrong((id *)&v15->_causingDevice, a6);
  }

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDHomePresenceUpdate homePresence](self, "homePresence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomePresenceUpdate userPresence](self, "userPresence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomePresenceUpdate isUpdate](self, "isUpdate");
  HMFBooleanToString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomePresenceUpdate causingDevice](self, "causingDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[Home-Presence-Update: %@/%@/%@/%@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HMDHomePresence)homePresence
{
  return self->_homePresence;
}

- (HMDUserPresence)userPresence
{
  return self->_userPresence;
}

- (BOOL)isUpdate
{
  return self->_update;
}

- (HMDDevice)causingDevice
{
  return self->_causingDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_causingDevice, 0);
  objc_storeStrong((id *)&self->_userPresence, 0);
  objc_storeStrong((id *)&self->_homePresence, 0);
}

@end
