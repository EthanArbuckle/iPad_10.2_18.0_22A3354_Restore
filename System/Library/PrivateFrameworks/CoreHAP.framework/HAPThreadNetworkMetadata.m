@implementation HAPThreadNetworkMetadata

- (HAPThreadNetworkMetadata)initWithName:(id)a3 channel:(unsigned __int8)a4 PANID:(id)a5 extendedPANID:(id)a6 masterKey:(id)a7 passPhrase:(id)a8 PSKc:(id)a9 activeOperationalDataSet:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  HAPThreadNetworkMetadata *v23;
  uint64_t v24;
  NSString *name;
  uint64_t v26;
  NSData *PANID;
  uint64_t v28;
  NSData *extendedPANID;
  uint64_t v30;
  NSData *masterKey;
  uint64_t v32;
  NSString *passPhrase;
  uint64_t v34;
  NSData *PSKc;
  uint64_t v36;
  NSData *activeOperationalDataSet;
  objc_super v39;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v39.receiver = self;
  v39.super_class = (Class)HAPThreadNetworkMetadata;
  v23 = -[HAPThreadNetworkMetadata init](&v39, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v16, "copy");
    name = v23->_name;
    v23->_name = (NSString *)v24;

    v23->_channel = a4;
    v26 = objc_msgSend(v17, "copy");
    PANID = v23->_PANID;
    v23->_PANID = (NSData *)v26;

    v28 = objc_msgSend(v18, "copy");
    extendedPANID = v23->_extendedPANID;
    v23->_extendedPANID = (NSData *)v28;

    v30 = objc_msgSend(v19, "copy");
    masterKey = v23->_masterKey;
    v23->_masterKey = (NSData *)v30;

    v32 = objc_msgSend(v20, "copy");
    passPhrase = v23->_passPhrase;
    v23->_passPhrase = (NSString *)v32;

    v34 = objc_msgSend(v21, "copy");
    PSKc = v23->_PSKc;
    v23->_PSKc = (NSData *)v34;

    v36 = objc_msgSend(v22, "copy");
    activeOperationalDataSet = v23->_activeOperationalDataSet;
    v23->_activeOperationalDataSet = (NSData *)v36;

  }
  return v23;
}

- (HAPThreadNetworkMetadata)initWithActiveOperationalDataSet:(id)a3
{
  id v4;
  HAPThreadNetworkMetadata *v5;
  HAPThreadNetworkMetadata *v6;
  NSString *name;
  NSData *PANID;
  NSData *extendedPANID;
  NSData *masterKey;
  NSString *passPhrase;
  NSData *PSKc;
  uint64_t v13;
  NSData *activeOperationalDataSet;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HAPThreadNetworkMetadata;
  v5 = -[HAPThreadNetworkMetadata init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    name = v5->_name;
    v5->_name = 0;

    v6->_channel = -1;
    PANID = v6->_PANID;
    v6->_PANID = 0;

    extendedPANID = v6->_extendedPANID;
    v6->_extendedPANID = 0;

    masterKey = v6->_masterKey;
    v6->_masterKey = 0;

    passPhrase = v6->_passPhrase;
    v6->_passPhrase = 0;

    PSKc = v6->_PSKc;
    v6->_PSKc = 0;

    v13 = objc_msgSend(v4, "copy");
    activeOperationalDataSet = v6->_activeOperationalDataSet;
    v6->_activeOperationalDataSet = (NSData *)v13;

  }
  return v6;
}

- (id)shortDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HAPThreadNetworkMetadata name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Name"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[HAPThreadNetworkMetadata channel](self, "channel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Channel"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HAPThreadNetworkMetadata PANID](self, "PANID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("PAN ID"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HAPThreadNetworkMetadata extendedPANID](self, "extendedPANID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("extended PAN ID"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)channel
{
  return self->_channel;
}

- (NSData)PANID
{
  return self->_PANID;
}

- (NSData)extendedPANID
{
  return self->_extendedPANID;
}

- (NSData)masterKey
{
  return self->_masterKey;
}

- (NSString)passPhrase
{
  return self->_passPhrase;
}

- (NSData)PSKc
{
  return self->_PSKc;
}

- (NSData)activeOperationalDataSet
{
  return self->_activeOperationalDataSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeOperationalDataSet, 0);
  objc_storeStrong((id *)&self->_PSKc, 0);
  objc_storeStrong((id *)&self->_passPhrase, 0);
  objc_storeStrong((id *)&self->_masterKey, 0);
  objc_storeStrong((id *)&self->_extendedPANID, 0);
  objc_storeStrong((id *)&self->_PANID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
