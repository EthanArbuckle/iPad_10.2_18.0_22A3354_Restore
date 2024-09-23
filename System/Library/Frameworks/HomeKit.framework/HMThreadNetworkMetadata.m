@implementation HMThreadNetworkMetadata

- (HMThreadNetworkMetadata)initWithName:(id)a3 channel:(unsigned __int8)a4 PANID:(id)a5 extendedPANID:(id)a6 masterKey:(id)a7 passPhrase:(id)a8 PSKc:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HMThreadNetworkMetadata *v21;
  uint64_t v22;
  NSString *name;
  uint64_t v24;
  NSData *PANID;
  uint64_t v26;
  NSData *extendedPANID;
  uint64_t v28;
  NSData *masterKey;
  uint64_t v30;
  NSString *passPhrase;
  uint64_t v32;
  NSData *PSKc;
  objc_super v35;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v35.receiver = self;
  v35.super_class = (Class)HMThreadNetworkMetadata;
  v21 = -[HMThreadNetworkMetadata init](&v35, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v15, "copy");
    name = v21->_name;
    v21->_name = (NSString *)v22;

    v21->_channel = a4;
    v24 = objc_msgSend(v16, "copy");
    PANID = v21->_PANID;
    v21->_PANID = (NSData *)v24;

    v26 = objc_msgSend(v17, "copy");
    extendedPANID = v21->_extendedPANID;
    v21->_extendedPANID = (NSData *)v26;

    v28 = objc_msgSend(v18, "copy");
    masterKey = v21->_masterKey;
    v21->_masterKey = (NSData *)v28;

    v30 = objc_msgSend(v19, "copy");
    passPhrase = v21->_passPhrase;
    v21->_passPhrase = (NSString *)v30;

    v32 = objc_msgSend(v20, "copy");
    PSKc = v21->_PSKc;
    v21->_PSKc = (NSData *)v32;

  }
  return v21;
}

- (HMThreadNetworkMetadata)initWithName:(id)a3 channel:(unsigned __int8)a4 PANID:(id)a5 extendedPANID:(id)a6 masterKey:(id)a7 passPhrase:(id)a8 PSKc:(id)a9 operationalDataset:(id)a10
{
  uint64_t v14;
  id v17;
  HMThreadNetworkMetadata *v18;
  void *v19;

  v14 = a4;
  v17 = a10;
  v18 = -[HMThreadNetworkMetadata initWithName:channel:PANID:extendedPANID:masterKey:passPhrase:PSKc:](self, "initWithName:channel:PANID:extendedPANID:masterKey:passPhrase:PSKc:", a3, v14, a5, a6, a7, a8, a9);
  v19 = (void *)objc_msgSend(v17, "copy");

  -[HMThreadNetworkMetadata setOperationalDataset:](v18, "setOperationalDataset:", v19);
  return v18;
}

- (HMThreadNetworkMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMThreadNetworkMetadata *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMTNMN.name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMTNMN.channel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMTNMN.panid"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMTNMN.xpanid"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMTNMN.passPhrase"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMTNMN.PSKc"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMTNMN.AOD"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          self = -[HMThreadNetworkMetadata initWithName:channel:PANID:extendedPANID:masterKey:passPhrase:PSKc:operationalDataset:](self, "initWithName:channel:PANID:extendedPANID:masterKey:passPhrase:PSKc:operationalDataset:", v5, objc_msgSend(v6, "unsignedCharValue"), v7, v8, 0, v9, v10, v11);

          v12 = self;
        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[HMThreadNetworkMetadata name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMTNMN.name"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[HMThreadNetworkMetadata channel](self, "channel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMTNMN.channel"));

  -[HMThreadNetworkMetadata PANID](self, "PANID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMTNMN.panid"));

  -[HMThreadNetworkMetadata extendedPANID](self, "extendedPANID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMTNMN.xpanid"));

  -[HMThreadNetworkMetadata passPhrase](self, "passPhrase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HMTNMN.passPhrase"));

  -[HMThreadNetworkMetadata PSKc](self, "PSKc");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("HMTNMN.PSKc"));

  -[HMThreadNetworkMetadata operationalDataset](self, "operationalDataset");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("HMTNMN.AOD"));

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

- (NSData)operationalDataset
{
  return self->_operationalDataset;
}

- (void)setOperationalDataset:(id)a3
{
  objc_storeStrong((id *)&self->_operationalDataset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationalDataset, 0);
  objc_storeStrong((id *)&self->_PSKc, 0);
  objc_storeStrong((id *)&self->_passPhrase, 0);
  objc_storeStrong((id *)&self->_masterKey, 0);
  objc_storeStrong((id *)&self->_extendedPANID, 0);
  objc_storeStrong((id *)&self->_PANID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
