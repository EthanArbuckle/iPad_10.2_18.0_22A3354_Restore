@implementation HMDUnassociatedAccessory

- (HMDUnassociatedAccessory)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDUnassociatedAccessory)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 messageDispatcher:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDUnassociatedAccessory *v14;
  uint64_t v15;
  NSUUID *uuid;
  uint64_t v17;
  NSString *identifier;
  uint64_t v19;
  NSString *name;
  void *v21;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)HMDUnassociatedAccessory;
  v14 = -[HMDUnassociatedAccessory init](&v23, sel_init);
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = objc_claimAutoreleasedReturnValue();
    uuid = v14->_uuid;
    v14->_uuid = (NSUUID *)v15;

    v17 = objc_msgSend(v10, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v17;

    v19 = objc_msgSend(v11, "copy");
    name = v14->_name;
    v14->_name = (NSString *)v19;

    v21 = v12;
    if (!v12)
    {
      +[HMDUnassociatedAccessory otherAccessoryCategory](HMDUnassociatedAccessory, "otherAccessoryCategory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v14->_category, v21);
    if (!v12)

    objc_storeStrong((id *)&v14->_messageDispatcher, a6);
    if (v13)
      -[HMDUnassociatedAccessory _registerForMessages](v14, "_registerForMessages");
  }

  return v14;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HMDUnassociatedAccessory messageDispatcher](self, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDUnassociatedAccessory;
  -[HMDUnassociatedAccessory dealloc](&v4, sel_dealloc);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDUnassociatedAccessory identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (unint64_t)transportTypes
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (BOOL)supportsCHIP
{
  return 0;
}

- (BOOL)isKnownToSystemCommissioner
{
  return 0;
}

- (BOOL)requiresThreadRouter
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  HMDUnassociatedAccessory *v4;
  HMDUnassociatedAccessory *v5;
  HMDUnassociatedAccessory *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDUnassociatedAccessory *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDUnassociatedAccessory identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUnassociatedAccessory identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAccessory identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)descriptionWithPointer:(BOOL)a3 additionalDescription:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  _BOOL4 v22;
  __CFString *v23;
  void *v24;
  void *v25;
  id v26;

  v4 = a3;
  v26 = a4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v4;
  v20 = v6;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = &stru_1E89C3E38;
  }
  -[HMDUnassociatedAccessory uuid](self, "uuid");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDUnassociatedAccessory isKnownToSystemCommissioner](self, "isKnownToSystemCommissioner"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDUnassociatedAccessory rootPublicKey](self, "rootPublicKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "hash"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAccessory nodeID](self, "nodeID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAccessory identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAccessory name](self, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAccessory category](self, "category");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "name");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@"), v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@%@, UUID = %@, knownToSystemCommissioner = %@, RPK(Hash) = %@, NodeID = %@, Identifier = %@, Name = %@, Category = %@%@>"), v25, v23, v24, v7, v10, v11, v12, v13, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@%@, UUID = %@, knownToSystemCommissioner = %@, RPK(Hash) = %@, NodeID = %@, Identifier = %@, Name = %@, Category = %@%@>"), v25, v23, v24, v7, v10, v11, v12, v13, v15, &stru_1E89C3E38);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v22)
  return v18;
}

- (NSString)debugDescription
{
  return (NSString *)-[HMDUnassociatedAccessory descriptionWithPointer:additionalDescription:](self, "descriptionWithPointer:additionalDescription:", 1, 0);
}

- (NSString)description
{
  return (NSString *)-[HMDUnassociatedAccessory descriptionWithPointer:additionalDescription:](self, "descriptionWithPointer:additionalDescription:", 0, 0);
}

- (id)dumpDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[HMDUnassociatedAccessory name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAccessory uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUnassociatedAccessory identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Accessory '%@': uuid %@  identifier %@"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKey:", v9, *MEMORY[0x1E0D27F80]);
  return v3;
}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[HMDUnassociatedAccessory messageDispatcher](self, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", CFSTR("kIdentifyAccessoryRequestKey"), self, v5, sel__handleIdentify_);

}

- (NSString)name
{
  NSString *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_name;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setName:(id)a3
{
  id v4;
  NSString *v5;
  NSString *name;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    os_unfair_recursive_lock_lock_with_options();
    if ((HMFEqualObjects() & 1) != 0)
    {
      os_unfair_recursive_lock_unlock();
    }
    else
    {
      v5 = (NSString *)objc_msgSend(v4, "copy");
      name = self->_name;
      self->_name = v5;

      os_unfair_recursive_lock_unlock();
      v7 = (void *)MEMORY[0x1E0D285D0];
      -[HMDUnassociatedAccessory messageDestination](self, "messageDestination");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("kAccessoryName");
      v13[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "messageWithName:destination:payload:", CFSTR("kAccessoryNameChangedNotificationKey"), v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDUnassociatedAccessory messageDispatcher](self, "messageDispatcher");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sendMessage:completionHandler:", v10, 0);

    }
  }

}

- (HMAccessoryCategory)category
{
  HMAccessoryCategory *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_category;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setCategory:(id)a3
{
  id v4;
  HMAccessoryCategory *v5;
  HMAccessoryCategory *category;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    os_unfair_recursive_lock_lock_with_options();
    if ((HMFEqualObjects() & 1) != 0)
    {
      os_unfair_recursive_lock_unlock();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CBA4E0], "cachedInstanceForHMAccessoryCategory:", v4);
      v5 = (HMAccessoryCategory *)objc_claimAutoreleasedReturnValue();
      category = self->_category;
      self->_category = v5;

      os_unfair_recursive_lock_unlock();
      encodeRootObjectForIncomingXPCMessage(v4, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D285D0];
      -[HMDUnassociatedAccessory messageDestination](self, "messageDestination");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("kAccessoryCategory");
      v14[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "messageWithName:destination:payload:", CFSTR("kAccessoryCategoryChangedNotificationKey"), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDUnassociatedAccessory messageDispatcher](self, "messageDispatcher");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sendMessage:completionHandler:", v11, 0);

    }
  }

}

- (void)updateCategoryWithCategoryIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a3)
  {
    v4 = a3;
    +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "categoryForIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(v10, "categoryForOther");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_alloc(MEMORY[0x1E0CBA1D8]);
    objc_msgSend(v5, "uuidStr");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "catDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithType:name:", v7, v8);

    -[HMDUnassociatedAccessory setCategory:](self, "setCategory:", v9);
  }
}

- (BOOL)isReachable
{
  return 1;
}

- (void)_handleIdentify:(id)a3
{
  id v4;
  void *v5;
  HMDUnassociatedAccessory *v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Identifying", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  objc_initWeak((id *)buf, v6);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__HMDUnassociatedAccessory__handleIdentify___block_invoke;
  v10[3] = &unk_1E89BF250;
  objc_copyWeak(&v12, (id *)buf);
  v9 = v4;
  v11 = v9;
  -[HMDUnassociatedAccessory identifyWithCompletionHandler:](v6, "identifyWithCompletionHandler:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

}

- (void)identifyWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  HMDUnassociatedAccessory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@The accessory does not support identify", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v9);

  }
}

- (void)associateWithAccessoryAdvertisement:(id)a3
{
  HMDAccessoryAdvertisement *v4;
  HMDAccessoryAdvertisement *accessoryAdvertisement;

  v4 = (HMDAccessoryAdvertisement *)a3;
  os_unfair_recursive_lock_lock_with_options();
  accessoryAdvertisement = self->_accessoryAdvertisement;
  self->_accessoryAdvertisement = v4;

  os_unfair_recursive_lock_unlock();
}

- (HMDAccessoryAdvertisement)accessoryAdvertisement
{
  HMDAccessoryAdvertisement *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_accessoryAdvertisement;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMDUnassociatedAccessory uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (HMDUnassociatedAccessory)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDUnassociatedAccessory *v8;
  void *v9;
  uint64_t v10;
  NSUUID *uuid;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryServerIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.accessoryCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDUnassociatedAccessory initWithIdentifier:name:category:messageDispatcher:](self, "initWithIdentifier:name:category:messageDispatcher:", v5, v6, v7, 0);
  if (v8)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v9);
    uuid = v8->_uuid;
    v8->_uuid = (NSUUID *)v10;

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  _BOOL8 v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  id v20;

  v20 = a3;
  if ((objc_msgSend(v20, "hmd_isForXPCTransport") & 1) == 0)
  {
    -[HMDUnassociatedAccessory identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v4, CFSTR("accessoryServerIdentifier"));

  }
  -[HMDUnassociatedAccessory name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v5, CFSTR("accessoryName"));

  -[HMDUnassociatedAccessory category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v6, CFSTR("HM.accessoryCategory"));

  -[HMDUnassociatedAccessory uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v8, CFSTR("accessoryUUID"));

  objc_msgSend(v20, "encodeBool:forKey:", 0, CFSTR("isBridged"));
  objc_msgSend(v20, "encodeBool:forKey:", 0, CFSTR("paired"));
  objc_msgSend(v20, "encodeBool:forKey:", -[HMDUnassociatedAccessory isReachable](self, "isReachable"), CFSTR("reachable"));
  v9 = -[HMDUnassociatedAccessory associationOptions](self, "associationOptions");
  objc_msgSend(v20, "encodeInteger:forKey:", v9, *MEMORY[0x1E0CB79A8]);
  if (objc_msgSend(v20, "hmd_isForXPCTransportEntitledForSPIAccess"))
    objc_msgSend(v20, "encodeInteger:forKey:", -[HMDUnassociatedAccessory transportTypes](self, "transportTypes"), CFSTR("HM.accessoryTransportTypes"));
  if (objc_msgSend(v20, "hmd_isForXPCTransportEntitledForSPIAccess"))
  {
    v10 = -[HMDUnassociatedAccessory supportsCHIP](self, "supportsCHIP");
    objc_msgSend(v20, "encodeBool:forKey:", v10, *MEMORY[0x1E0CB8058]);
    v11 = -[HMDUnassociatedAccessory isKnownToSystemCommissioner](self, "isKnownToSystemCommissioner");
    objc_msgSend(v20, "encodeBool:forKey:", v11, *MEMORY[0x1E0CB7CA8]);
    -[HMDUnassociatedAccessory rootPublicKey](self, "rootPublicKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v12, *MEMORY[0x1E0CB7E10]);

    -[HMDUnassociatedAccessory nodeID](self, "nodeID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v13, *MEMORY[0x1E0CB7B50]);

    -[HMDUnassociatedAccessory commissioningID](self, "commissioningID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v14, *MEMORY[0x1E0CB7B48]);

    -[HMDUnassociatedAccessory serialNumber](self, "serialNumber");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v15, CFSTR("HM.serialNumber"));

    -[HMDUnassociatedAccessory productID](self, "productID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v16, *MEMORY[0x1E0CB7DA0]);

    -[HMDUnassociatedAccessory vendorID](self, "vendorID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v17, *MEMORY[0x1E0CB8188]);

    v18 = -[HMDUnassociatedAccessory requiresThreadRouter](self, "requiresThreadRouter");
    objc_msgSend(v20, "encodeBool:forKey:", v18, *MEMORY[0x1E0CB7DF0]);
    -[HMDUnassociatedAccessory identifier](self, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v19, CFSTR("accessoryServerIdentifier"));

  }
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)associationOptions
{
  return self->_associationOptions;
}

- (void)setAccessoryAdvertisement:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryAdvertisement, a3);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (NSData)rootPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (NSNumber)nodeID
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSUUID)commissioningID
{
  return (NSUUID *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCommissioningID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSNumber)vendorID
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setVendorID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSNumber)productID
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setProductID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_commissioningID, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_rootPublicKey, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_accessoryAdvertisement, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

void __44__HMDUnassociatedAccessory__handleIdentify___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Identified with error: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v10)[2](v10, v3, 0);

  }
}

+ (id)otherAccessoryCategory
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryForOther");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0CBA1D8]);
  objc_msgSend(v3, "uuidStr");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "catDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithType:name:", v5, v6);

  objc_msgSend(MEMORY[0x1E0CBA4E0], "cachedInstanceForHMAccessoryCategory:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_115743 != -1)
    dispatch_once(&logCategory__hmf_once_t10_115743, &__block_literal_global_115744);
  return (id)logCategory__hmf_once_v11_115745;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __39__HMDUnassociatedAccessory_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v11_115745;
  logCategory__hmf_once_v11_115745 = v0;

}

@end
