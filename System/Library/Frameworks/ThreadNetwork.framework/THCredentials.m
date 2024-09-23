@implementation THCredentials

- (id)initThreadCredentials:(id)a3 extendedPANID:(id)a4 borderAgentID:(id)a5 activeOperationalDataSet:(id)a6 PSKC:(id)a7 networkKey:(id)a8 channel:(unsigned __int8)a9 panID:(id)a10 creationDate:(id)a11 lastModificationDate:(id)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  THCredentials *v25;
  THCredentials *v26;
  id obj;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v33 = a3;
  obj = a4;
  v19 = a4;
  v29 = a5;
  v20 = a5;
  v30 = a6;
  v21 = a6;
  v31 = a7;
  v34 = a7;
  v22 = a8;
  v23 = a10;
  v24 = a11;
  v32 = a12;
  v35.receiver = self;
  v35.super_class = (Class)THCredentials;
  v25 = -[THCredentials init](&v35, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_networkName, a3);
    objc_storeStrong((id *)&v26->_extendedPANID, obj);
    objc_storeStrong((id *)&v26->_borderAgentID, v29);
    objc_storeStrong((id *)&v26->_activeOperationalDataSet, v30);
    objc_storeStrong((id *)&v26->_PSKC, v31);
    objc_storeStrong((id *)&v26->_networkKey, a8);
    v26->_channel = a9;
    objc_storeStrong((id *)&v26->_panID, a10);
    objc_storeStrong((id *)&v26->_creationDate, a11);
    objc_storeStrong((id *)&v26->_lastModificationDate, a12);
  }

  return v26;
}

- (THCredentials)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  THCredentials *v14;
  void *v15;
  THCredentials *v16;
  char v17;
  THCredentials *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("xp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ba"));
  v27 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nk"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("psk"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ch"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("panid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dscreds"));
  v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cr"));
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lm"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)v5;
  v14 = 0;
  v28 = v13;
  v29 = v9;
  if (v13 && v6)
  {
    v25 = v7;
    v15 = (void *)v11;
    v16 = self;
    if (v9)
      v17 = objc_msgSend(v9, "charValue");
    else
      v17 = -1;
    v21 = (void *)v26;
    v20 = (void *)v27;
    v24 = v15;
    v19 = v15;
    LOBYTE(v23) = v17;
    v7 = v25;
    v18 = (THCredentials *)-[THCredentials initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:](v16, "initThreadCredentials:extendedPANID:borderAgentID:activeOperationalDataSet:PSKC:networkKey:channel:panID:creationDate:lastModificationDate:", v13, v6, v27, v26, v8, v25, v23, v10, v24, v12);
    v14 = v18;
  }
  else
  {
    v18 = self;
    v19 = (void *)v11;
    v21 = (void *)v26;
    v20 = (void *)v27;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[THCredentials networkName](self, "networkName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v4, CFSTR("name"));

  -[THCredentials extendedPANID](self, "extendedPANID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v5, CFSTR("xp"));

  -[THCredentials borderAgentID](self, "borderAgentID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v6, CFSTR("ba"));

  -[THCredentials networkKey](self, "networkKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v7, CFSTR("nk"));

  -[THCredentials PSKC](self, "PSKC");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v8, CFSTR("psk"));

  if (-[THCredentials channel](self, "channel") == 255)
  {
    objc_msgSend(v14, "encodeObject:forKey:", 0, CFSTR("ch"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[THCredentials channel](self, "channel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v9, CFSTR("ch"));

  }
  -[THCredentials panID](self, "panID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v10, CFSTR("panid"));

  -[THCredentials activeOperationalDataSet](self, "activeOperationalDataSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v11, CFSTR("dscreds"));

  -[THCredentials creationDate](self, "creationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v12, CFSTR("cr"));

  -[THCredentials lastModificationDate](self, "lastModificationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v13, CFSTR("lm"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)networkName
{
  return self->_networkName;
}

- (NSData)extendedPANID
{
  return self->_extendedPANID;
}

- (NSData)borderAgentID
{
  return self->_borderAgentID;
}

- (NSData)activeOperationalDataSet
{
  return self->_activeOperationalDataSet;
}

- (NSData)networkKey
{
  return self->_networkKey;
}

- (NSData)PSKC
{
  return self->_PSKC;
}

- (uint8_t)channel
{
  return self->_channel;
}

- (void)setChannel:(uint8_t)channel
{
  self->_channel = channel;
}

- (NSData)panID
{
  return self->_panID;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)lastModificationDate
{
  return self->_lastModificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_panID, 0);
  objc_storeStrong((id *)&self->_PSKC, 0);
  objc_storeStrong((id *)&self->_networkKey, 0);
  objc_storeStrong((id *)&self->_activeOperationalDataSet, 0);
  objc_storeStrong((id *)&self->_borderAgentID, 0);
  objc_storeStrong((id *)&self->_extendedPANID, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
}

@end
