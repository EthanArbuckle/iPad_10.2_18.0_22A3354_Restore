@implementation DCLegacySESlotInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DCLegacySESlotInfo)initWithSESlot:(int64_t)a3 isMissing:(BOOL)a4 partition:(id)a5 credentialIdentifier:(id)a6 presentmentKeyIdentifier:(id)a7
{
  NSString *v12;
  NSString *v13;
  NSString *v14;
  DCLegacySESlotInfo *v15;
  NSString *partition;
  NSString *v17;
  NSString *credentialIdentifier;
  NSString *v19;
  NSString *presentmentKeyIdentifier;
  objc_super v22;

  v12 = (NSString *)a5;
  v13 = (NSString *)a6;
  v14 = (NSString *)a7;
  v22.receiver = self;
  v22.super_class = (Class)DCLegacySESlotInfo;
  v15 = -[DCLegacySESlotInfo init](&v22, sel_init);
  v15->_isMissing = a4;
  partition = v15->_partition;
  v15->_seSlot = a3;
  v15->_partition = v12;
  v17 = v12;

  credentialIdentifier = v15->_credentialIdentifier;
  v15->_credentialIdentifier = v13;
  v19 = v13;

  presentmentKeyIdentifier = v15->_presentmentKeyIdentifier;
  v15->_presentmentKeyIdentifier = v14;

  return v15;
}

- (DCLegacySESlotInfo)initWithSESlot:(int64_t)a3 isMissing:(BOOL)a4
{
  return -[DCLegacySESlotInfo initWithSESlot:isMissing:partition:credentialIdentifier:presentmentKeyIdentifier:](self, "initWithSESlot:isMissing:partition:credentialIdentifier:presentmentKeyIdentifier:", a3, a4, 0, 0, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DCLegacySESlotInfo seSlot](self, "seSlot"), 0x24C3074A8);
  objc_msgSend(v4, "encodeBool:forKey:", -[DCLegacySESlotInfo isMissing](self, "isMissing"), 0x24C307508);
  -[DCLegacySESlotInfo partition](self, "partition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, 0x24C307188);

  -[DCLegacySESlotInfo credentialIdentifier](self, "credentialIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, 0x24C307168);

  -[DCLegacySESlotInfo presentmentKeyIdentifier](self, "presentmentKeyIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, 0x24C3074C8);

}

- (DCLegacySESlotInfo)initWithCoder:(id)a3
{
  id v3;
  DCLegacySESlotInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DCLegacySESlotInfo;
  v3 = a3;
  v4 = -[DCLegacySESlotInfo init](&v9, sel_init);
  -[DCLegacySESlotInfo setSeSlot:](v4, "setSeSlot:", objc_msgSend(v3, "decodeIntegerForKey:", 0x24C3074A8, v9.receiver, v9.super_class));
  -[DCLegacySESlotInfo setIsMissing:](v4, "setIsMissing:", objc_msgSend(v3, "decodeBoolForKey:", 0x24C307508));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307188);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCLegacySESlotInfo setPartition:](v4, "setPartition:", v5);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307168);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCLegacySESlotInfo setCredentialIdentifier:](v4, "setCredentialIdentifier:", v6);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3074C8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DCLegacySESlotInfo setPresentmentKeyIdentifier:](v4, "setPresentmentKeyIdentifier:", v7);
  return v4;
}

- (id)description
{
  void *v3;
  int64_t v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[DCLegacySESlotInfo seSlot](self, "seSlot");
  v5 = -[DCLegacySESlotInfo isMissing](self, "isMissing");
  -[DCLegacySESlotInfo partition](self, "partition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCLegacySESlotInfo credentialIdentifier](self, "credentialIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCLegacySESlotInfo presentmentKeyIdentifier](self, "presentmentKeyIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("DCLegacySESlotInfo slot = %d isMissing = %d partition = %@ credentialIdentifier = %@ presentmentKeyIdentifier = %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)seSlot
{
  return self->_seSlot;
}

- (void)setSeSlot:(int64_t)a3
{
  self->_seSlot = a3;
}

- (BOOL)isMissing
{
  return self->_isMissing;
}

- (void)setIsMissing:(BOOL)a3
{
  self->_isMissing = a3;
}

- (NSString)partition
{
  return self->_partition;
}

- (void)setPartition:(id)a3
{
  objc_storeStrong((id *)&self->_partition, a3);
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_credentialIdentifier, a3);
}

- (NSString)presentmentKeyIdentifier
{
  return self->_presentmentKeyIdentifier;
}

- (void)setPresentmentKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_presentmentKeyIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentmentKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_partition, 0);
}

@end
