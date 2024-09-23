@implementation CXCall

- (CXCall)init
{

  return 0;
}

- (CXCall)initWithUUID:(id)a3
{
  id v5;
  CXCall *v6;
  CXCall *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CXCall;
  v6 = -[CXCall init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_UUID, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXCall)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CXCall *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSString *providerIdentifier;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_UUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CXCall initWithUUID:](self, "initWithUUID:", v7);

  if (v8)
  {
    v9 = objc_opt_class();
    NSStringFromSelector(sel_providerIdentifier);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    providerIdentifier = v8->_providerIdentifier;
    v8->_providerIdentifier = (NSString *)v11;

    NSStringFromSelector(sel_isOutgoing);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_outgoing = objc_msgSend(v4, "decodeBoolForKey:", v13);

    NSStringFromSelector(sel_isOnHold);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_onHold = objc_msgSend(v4, "decodeBoolForKey:", v14);

    NSStringFromSelector(sel_hasConnected);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_hasConnected = objc_msgSend(v4, "decodeBoolForKey:", v15);

    NSStringFromSelector(sel_hasEnded);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_hasEnded = objc_msgSend(v4, "decodeBoolForKey:", v16);

    NSStringFromSelector(sel_isEndpointOnCurrentDevice);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_endpointOnCurrentDevice = objc_msgSend(v4, "decodeBoolForKey:", v17);

    NSStringFromSelector(sel_isHostedOnCurrentDevice);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_hostedOnCurrentDevice = objc_msgSend(v4, "decodeBoolForKey:", v18);

    NSStringFromSelector(sel_isVideo);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_video = objc_msgSend(v4, "decodeBoolForKey:", v19);

    NSStringFromSelector(sel_isScreening);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_screening = objc_msgSend(v4, "decodeBoolForKey:", v20);

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  _BOOL8 v23;
  id v24;

  v4 = a3;
  -[CXCall UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[CXCall providerIdentifier](self, "providerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_providerIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  v9 = -[CXCall isOutgoing](self, "isOutgoing");
  NSStringFromSelector(sel_isOutgoing);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v9, v10);

  v11 = -[CXCall isOnHold](self, "isOnHold");
  NSStringFromSelector(sel_isOnHold);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v11, v12);

  v13 = -[CXCall hasConnected](self, "hasConnected");
  NSStringFromSelector(sel_hasConnected);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v13, v14);

  v15 = -[CXCall hasEnded](self, "hasEnded");
  NSStringFromSelector(sel_hasEnded);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v15, v16);

  v17 = -[CXCall isEndpointOnCurrentDevice](self, "isEndpointOnCurrentDevice");
  NSStringFromSelector(sel_isEndpointOnCurrentDevice);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v17, v18);

  v19 = -[CXCall isHostedOnCurrentDevice](self, "isHostedOnCurrentDevice");
  NSStringFromSelector(sel_isHostedOnCurrentDevice);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v19, v20);

  v21 = -[CXCall isVideo](self, "isVideo");
  NSStringFromSelector(sel_isVideo);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v21, v22);

  v23 = -[CXCall isScreening](self, "isScreening");
  NSStringFromSelector(sel_isScreening);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v23, v24);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CXCall isEqualToCall:](self, "isEqualToCall:", v4);

  return v5;
}

- (BOOL)isEqualToCall:(CXCall *)call
{
  CXCall *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v18;

  v4 = call;
  -[CXCall UUID](self, "UUID");
  v5 = objc_claimAutoreleasedReturnValue();
  -[CXCall UUID](v4, "UUID");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 | v6 && !objc_msgSend((id)v5, "isEqual:", v6))
  {
    LOBYTE(v16) = 0;
  }
  else
  {
    -[CXCall providerIdentifier](self, "providerIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    -[CXCall providerIdentifier](v4, "providerIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    if ((!(v7 | v8) || objc_msgSend((id)v7, "isEqual:", v8))
      && (v9 = -[CXCall isOutgoing](self, "isOutgoing"), v9 == -[CXCall isOutgoing](v4, "isOutgoing"))
      && (v10 = -[CXCall isVideo](self, "isVideo"), v10 == -[CXCall isVideo](v4, "isVideo"))
      && (v11 = -[CXCall isOnHold](self, "isOnHold"), v11 == -[CXCall isOnHold](v4, "isOnHold"))
      && (v12 = -[CXCall hasConnected](self, "hasConnected"), v12 == -[CXCall hasConnected](v4, "hasConnected"))
      && (v13 = -[CXCall hasEnded](self, "hasEnded"), v13 == -[CXCall hasEnded](v4, "hasEnded"))
      && (v14 = -[CXCall isEndpointOnCurrentDevice](self, "isEndpointOnCurrentDevice"),
          v14 == -[CXCall isEndpointOnCurrentDevice](v4, "isEndpointOnCurrentDevice"))
      && (v15 = -[CXCall isHostedOnCurrentDevice](self, "isHostedOnCurrentDevice"),
          v15 == -[CXCall isHostedOnCurrentDevice](v4, "isHostedOnCurrentDevice")))
    {
      v18 = -[CXCall isScreening](self, "isScreening");
      v16 = v18 ^ -[CXCall isScreening](v4, "isScreening") ^ 1;
    }
    else
    {
      LOBYTE(v16) = 0;
    }

  }
  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  -[CXCall UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CXCall providerIdentifier](self, "providerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  if (-[CXCall isOutgoing](self, "isOutgoing"))
    v7 = 1231;
  else
    v7 = 1237;
  v8 = v6 ^ v7;
  if (-[CXCall isVideo](self, "isVideo"))
    v9 = 1231;
  else
    v9 = 1237;
  if (-[CXCall isOnHold](self, "isOnHold"))
    v10 = 1231;
  else
    v10 = 1237;
  v11 = v8 ^ v9 ^ v10;
  if (-[CXCall hasConnected](self, "hasConnected"))
    v12 = 1231;
  else
    v12 = 1237;
  if (-[CXCall hasEnded](self, "hasEnded"))
    v13 = 1231;
  else
    v13 = 1237;
  v14 = v12 ^ v13;
  if (-[CXCall isEndpointOnCurrentDevice](self, "isEndpointOnCurrentDevice"))
    v15 = 1231;
  else
    v15 = 1237;
  v16 = v11 ^ v14 ^ v15;
  if (-[CXCall isHostedOnCurrentDevice](self, "isHostedOnCurrentDevice"))
    v17 = 1231;
  else
    v17 = 1237;
  if (-[CXCall isScreening](self, "isScreening"))
    v18 = 1231;
  else
    v18 = 1237;
  v19 = v16 ^ v17 ^ v18;

  return v19;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setOutgoing:", -[CXCall isOutgoing](self, "isOutgoing"));
  objc_msgSend(v5, "setOnHold:", -[CXCall isOnHold](self, "isOnHold"));
  objc_msgSend(v5, "setHasConnected:", -[CXCall hasConnected](self, "hasConnected"));
  objc_msgSend(v5, "setHasEnded:", -[CXCall hasEnded](self, "hasEnded"));

}

- (id)sanitizedCopy
{
  return -[CXCall sanitizedCopyWithZone:](self, "sanitizedCopyWithZone:", 0);
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CXCall UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithUUID:", v6);

  -[CXCall updateSanitizedCopy:withZone:](self, "updateSanitizedCopy:withZone:", v7, a3);
  return v7;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[CXCall updateSanitizedCopy:withZone:](self, "updateSanitizedCopy:withZone:", v7, a4);
  -[CXCall providerIdentifier](self, "providerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProviderIdentifier:", v6);

  objc_msgSend(v7, "setEndpointOnCurrentDevice:", -[CXCall isEndpointOnCurrentDevice](self, "isEndpointOnCurrentDevice"));
  objc_msgSend(v7, "setHostedOnCurrentDevice:", -[CXCall isHostedOnCurrentDevice](self, "isHostedOnCurrentDevice"));
  objc_msgSend(v7, "setVideo:", -[CXCall isVideo](self, "isVideo"));
  objc_msgSend(v7, "setScreening:", -[CXCall isScreening](self, "isScreening"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CXCall UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithUUID:", v6);

  -[CXCall updateCopy:withZone:](self, "updateCopy:withZone:", v7, a3);
  return v7;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (BOOL)isOutgoing
{
  return self->_outgoing;
}

- (void)setOutgoing:(BOOL)a3
{
  self->_outgoing = a3;
}

- (BOOL)isOnHold
{
  return self->_onHold;
}

- (void)setOnHold:(BOOL)a3
{
  self->_onHold = a3;
}

- (BOOL)hasConnected
{
  return self->_hasConnected;
}

- (void)setHasConnected:(BOOL)a3
{
  self->_hasConnected = a3;
}

- (BOOL)hasEnded
{
  return self->_hasEnded;
}

- (void)setHasEnded:(BOOL)a3
{
  self->_hasEnded = a3;
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void)setProviderIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_providerIdentifier, a3);
}

- (BOOL)isEndpointOnCurrentDevice
{
  return self->_endpointOnCurrentDevice;
}

- (void)setEndpointOnCurrentDevice:(BOOL)a3
{
  self->_endpointOnCurrentDevice = a3;
}

- (BOOL)isHostedOnCurrentDevice
{
  return self->_hostedOnCurrentDevice;
}

- (void)setHostedOnCurrentDevice:(BOOL)a3
{
  self->_hostedOnCurrentDevice = a3;
}

- (BOOL)isVideo
{
  return self->_video;
}

- (void)setVideo:(BOOL)a3
{
  self->_video = a3;
}

- (BOOL)isScreening
{
  return self->_screening;
}

- (void)setScreening:(BOOL)a3
{
  self->_screening = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
