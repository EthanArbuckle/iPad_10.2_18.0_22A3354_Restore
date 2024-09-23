@implementation HMAccessorySetupRequest

- (HMAccessorySetupRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMAccessorySetupRequest;
  return -[HMAccessorySetupRequest init](&v3, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_10;
  -[HMAccessorySetupRequest payload](self, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMFEqualObjects();

  if (!v9)
    goto LABEL_10;
  -[HMAccessorySetupRequest matterPayload](self, "matterPayload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "matterPayload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects();

  if (!v12)
    goto LABEL_10;
  -[HMAccessorySetupRequest homeUniqueIdentifier](self, "homeUniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeUniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = HMFEqualObjects();

  if (!v15)
    goto LABEL_10;
  -[HMAccessorySetupRequest suggestedRoomUniqueIdentifier](self, "suggestedRoomUniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "suggestedRoomUniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = HMFEqualObjects();

  if (v18)
  {
    -[HMAccessorySetupRequest suggestedAccessoryName](self, "suggestedAccessoryName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "suggestedAccessoryName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = HMFEqualObjects();

  }
  else
  {
LABEL_10:
    v21 = 0;
  }

  return v21;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[HMAccessorySetupRequest payload](self, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMAccessorySetupRequest matterPayload](self, "matterPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMAccessorySetupRequest homeUniqueIdentifier](self, "homeUniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[HMAccessorySetupRequest suggestedRoomUniqueIdentifier](self, "suggestedRoomUniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  -[HMAccessorySetupRequest suggestedAccessoryName](self, "suggestedAccessoryName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMAccessorySetupRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[HMAccessorySetupRequest init](+[HMAccessorySetupRequest allocWithZone:](HMAccessorySetupRequest, "allocWithZone:", a3), "init");
  -[HMAccessorySetupRequest payload](self, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySetupRequest setPayload:](v4, "setPayload:", v5);

  -[HMAccessorySetupRequest matterPayload](self, "matterPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySetupRequest setMatterPayload:](v4, "setMatterPayload:", v6);

  -[HMAccessorySetupRequest homeUniqueIdentifier](self, "homeUniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySetupRequest setHomeUniqueIdentifier:](v4, "setHomeUniqueIdentifier:", v7);

  -[HMAccessorySetupRequest suggestedRoomUniqueIdentifier](self, "suggestedRoomUniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySetupRequest setSuggestedRoomUniqueIdentifier:](v4, "setSuggestedRoomUniqueIdentifier:", v8);

  -[HMAccessorySetupRequest suggestedAccessoryName](self, "suggestedAccessoryName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySetupRequest setSuggestedAccessoryName:](v4, "setSuggestedAccessoryName:", v9);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HMAccessorySetupRequest payload](self, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMASR.ck.payload"));

  -[HMAccessorySetupRequest matterPayload](self, "matterPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMASR.ck.matterPayload"));

  -[HMAccessorySetupRequest homeUniqueIdentifier](self, "homeUniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMASR.ck.homeUniqueIdentifier"));

  -[HMAccessorySetupRequest suggestedRoomUniqueIdentifier](self, "suggestedRoomUniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMASR.ck.suggestedRoomUniqueIdentifier"));

  -[HMAccessorySetupRequest suggestedAccessoryName](self, "suggestedAccessoryName");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HMASR.ck.suggestedAccessoryName"));

}

- (HMAccessorySetupRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMAccessorySetupRequest *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMASR.ck.payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v6 = (void *)getMTRSetupPayloadClass_softClass;
  v18 = getMTRSetupPayloadClass_softClass;
  if (!getMTRSetupPayloadClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getMTRSetupPayloadClass_block_invoke;
    v14[3] = &unk_1E3AB4620;
    v14[4] = &v15;
    __getMTRSetupPayloadClass_block_invoke((uint64_t)v14);
    v6 = (void *)v16[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v15, 8);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMASR.ck.matterPayload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMASR.ck.homeUniqueIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMASR.ck.suggestedRoomUniqueIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMASR.ck.suggestedAccessoryName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMAccessorySetupRequest init](self, "init");
  -[HMAccessorySetupRequest setPayload:](v12, "setPayload:", v5);
  -[HMAccessorySetupRequest setMatterPayload:](v12, "setMatterPayload:", v8);
  -[HMAccessorySetupRequest setHomeUniqueIdentifier:](v12, "setHomeUniqueIdentifier:", v9);
  -[HMAccessorySetupRequest setSuggestedRoomUniqueIdentifier:](v12, "setSuggestedRoomUniqueIdentifier:", v10);
  -[HMAccessorySetupRequest setSuggestedAccessoryName:](v12, "setSuggestedAccessoryName:", v11);

  return v12;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySetupRequest payload](self, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMAccessorySetupRequest payload](self, "payload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Payload"), v6);
    objc_msgSend(v3, "addObject:", v7);

  }
  -[HMAccessorySetupRequest matterPayload](self, "matterPayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMAccessorySetupRequest matterPayload](self, "matterPayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Matter Payload"), v10);
    objc_msgSend(v3, "addObject:", v11);

  }
  -[HMAccessorySetupRequest homeUniqueIdentifier](self, "homeUniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMAccessorySetupRequest homeUniqueIdentifier](self, "homeUniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Home Unique Identifier"), v14);
    objc_msgSend(v3, "addObject:", v15);

  }
  -[HMAccessorySetupRequest suggestedRoomUniqueIdentifier](self, "suggestedRoomUniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMAccessorySetupRequest suggestedRoomUniqueIdentifier](self, "suggestedRoomUniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithName:value:", CFSTR("Suggested Room Unique Identifier"), v18);
    objc_msgSend(v3, "addObject:", v19);

  }
  -[HMAccessorySetupRequest suggestedAccessoryName](self, "suggestedAccessoryName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMAccessorySetupRequest suggestedAccessoryName](self, "suggestedAccessoryName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithName:value:", CFSTR("Suggested Accessory Name"), v22);
    objc_msgSend(v3, "addObject:", v23);

  }
  v24 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v24;
}

- (HMAccessorySetupPayload)payload
{
  return (HMAccessorySetupPayload *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPayload:(HMAccessorySetupPayload *)payload
{
  objc_setProperty_atomic_copy(self, a2, payload, 8);
}

- (NSUUID)homeUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHomeUniqueIdentifier:(NSUUID *)homeUniqueIdentifier
{
  objc_setProperty_atomic_copy(self, a2, homeUniqueIdentifier, 16);
}

- (NSUUID)suggestedRoomUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSuggestedRoomUniqueIdentifier:(NSUUID *)suggestedRoomUniqueIdentifier
{
  objc_setProperty_atomic_copy(self, a2, suggestedRoomUniqueIdentifier, 24);
}

- (NSString)suggestedAccessoryName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSuggestedAccessoryName:(NSString *)suggestedAccessoryName
{
  objc_setProperty_atomic_copy(self, a2, suggestedAccessoryName, 32);
}

- (MTRSetupPayload)matterPayload
{
  return (MTRSetupPayload *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMatterPayload:(MTRSetupPayload *)matterPayload
{
  objc_setProperty_atomic(self, a2, matterPayload, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matterPayload, 0);
  objc_storeStrong((id *)&self->_suggestedAccessoryName, 0);
  objc_storeStrong((id *)&self->_suggestedRoomUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_homeUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
