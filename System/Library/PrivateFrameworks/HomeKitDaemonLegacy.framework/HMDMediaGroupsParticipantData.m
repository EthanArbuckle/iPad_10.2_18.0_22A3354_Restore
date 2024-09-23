@implementation HMDMediaGroupsParticipantData

- (HMDMediaGroupsParticipantData)initWithDestination:(id)a3 destinationControllerData:(id)a4 backedUpGroups:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDMediaGroupsParticipantData *v13;
  HMDMediaGroupsParticipantData *v14;
  HMDMediaGroupsParticipantData *v16;
  SEL v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    v12 = v11;
    v18.receiver = self;
    v18.super_class = (Class)HMDMediaGroupsParticipantData;
    v13 = -[HMDMediaGroupsParticipantData init](&v18, sel_init);
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_destination, a3);
      objc_storeStrong((id *)&v14->_destinationControllerData, a4);
      objc_storeStrong((id *)&v14->_backedUpGroups, a5);
    }

    return v14;
  }
  else
  {
    v16 = (HMDMediaGroupsParticipantData *)_HMFPreconditionFailure();
    return (HMDMediaGroupsParticipantData *)-[HMDMediaGroupsParticipantData encodeToProtoBufferData](v16, v17);
  }
}

- (id)encodeToProtoBufferData
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0CBA640]);
  -[HMDMediaGroupsParticipantData destination](self, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CBA620]);
    -[HMDMediaGroupsParticipantData destination](self, "destination");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeToProtoBufferData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithData:", v7);
    objc_msgSend(v3, "setDestination:", v8);

  }
  -[HMDMediaGroupsParticipantData destinationControllerData](self, "destinationControllerData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CBA630]);
    -[HMDMediaGroupsParticipantData destinationControllerData](self, "destinationControllerData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeToProtoBufferData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithData:", v12);
    objc_msgSend(v3, "setDestinationController:", v13);

  }
  -[HMDMediaGroupsParticipantData backedUpGroups](self, "backedUpGroups");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");
  objc_msgSend(v3, "setBackupGroups:", v15);

  objc_msgSend(v3, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (HMDMediaGroupsParticipantData)initWithProtoBufferData:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDMediaGroupsParticipantData *v16;

  v4 = (objc_class *)MEMORY[0x1E0CBA640];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

  if (objc_msgSend(v6, "hasDestination"))
  {
    v7 = objc_alloc(MEMORY[0x1E0CBA600]);
    objc_msgSend(v6, "destination");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithProtoBufferData:", v9);

  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v6, "hasDestinationController"))
  {
    v11 = objc_alloc(MEMORY[0x1E0CBA610]);
    objc_msgSend(v6, "destinationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithProtoBufferData:", v13);

  }
  else
  {
    v14 = 0;
  }
  if (objc_msgSend(v6, "backupGroupsCount"))
  {
    objc_msgSend(v6, "backupGroups");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HMDMediaGroupsParticipantData initWithDestination:destinationControllerData:backedUpGroups:](self, "initWithDestination:destinationControllerData:backedUpGroups:", v10, v14, v15);

  }
  else
  {
    v16 = -[HMDMediaGroupsParticipantData initWithDestination:destinationControllerData:backedUpGroups:](self, "initWithDestination:destinationControllerData:backedUpGroups:", v10, v14, MEMORY[0x1E0C9AA60]);
  }

  return v16;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDMediaGroupsParticipantData destination](self, "destination");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("none");
  -[HMDMediaGroupsParticipantData destinationControllerData](self, "destinationControllerData");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("none");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDMediaGroupsParticipantData backedUpGroups](self, "backedUpGroups");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDMediaGroupsParticipantData destination: %@ destinationControllerData: %@ groups count: %@>"), v6, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  HMDMediaGroupsParticipantData *v4;
  HMDMediaGroupsParticipantData *v5;
  HMDMediaGroupsParticipantData *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;

  v4 = (HMDMediaGroupsParticipantData *)a3;
  if (self == v4)
  {
    v19 = 1;
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
      goto LABEL_9;
    -[HMDMediaGroupsParticipantData destination](self, "destination");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaGroupsParticipantData destination](v6, "destination");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();

    if (!v9)
      goto LABEL_9;
    -[HMDMediaGroupsParticipantData destinationControllerData](self, "destinationControllerData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaGroupsParticipantData destinationControllerData](v6, "destinationControllerData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = HMFEqualObjects();

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0C99E60];
      -[HMDMediaGroupsParticipantData backedUpGroups](self, "backedUpGroups");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setWithArray:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0C99E60];
      -[HMDMediaGroupsParticipantData backedUpGroups](v6, "backedUpGroups");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setWithArray:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v15, "isEqual:", v18);

    }
    else
    {
LABEL_9:
      v19 = 0;
    }

  }
  return v19;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[HMDMediaGroupsParticipantData destination](self, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDMediaGroupsParticipantData destination](self, "destination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDMediaGroupsParticipantData destinationControllerData](self, "destinationControllerData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[HMDMediaGroupsParticipantData backedUpGroups](self, "backedUpGroups");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "count");
      goto LABEL_6;
    }
    -[HMDMediaGroupsParticipantData destinationControllerData](self, "destinationControllerData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v5;
  v8 = objc_msgSend(v5, "hash");

LABEL_6:
  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMDMutableMediaGroupsParticipantData *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDMutableMediaGroupsParticipantData *v8;

  v4 = [HMDMutableMediaGroupsParticipantData alloc];
  -[HMDMediaGroupsParticipantData destination](self, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupsParticipantData destinationControllerData](self, "destinationControllerData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupsParticipantData backedUpGroups](self, "backedUpGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDMediaGroupsParticipantData initWithDestination:destinationControllerData:backedUpGroups:](v4, "initWithDestination:destinationControllerData:backedUpGroups:", v5, v6, v7);

  return v8;
}

- (HMMediaDestination)destination
{
  return (HMMediaDestination *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDestination:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (HMMediaDestinationControllerData)destinationControllerData
{
  return (HMMediaDestinationControllerData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDestinationControllerData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSArray)backedUpGroups
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBackedUpGroups:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backedUpGroups, 0);
  objc_storeStrong((id *)&self->_destinationControllerData, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

@end
