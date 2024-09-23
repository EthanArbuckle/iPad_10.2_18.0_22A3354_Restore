@implementation ENParticipantDevice

- (ENParticipantDevice)initWithDevicePublicKey:(id)a3 cypher:(id)a4 identifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  ENParticipantDevice *v12;
  ENParticipantDevice *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ENParticipantDevice;
  v12 = -[ENParticipantDevice init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_devicePublicKey, a3);
    objc_storeStrong((id *)&v13->_cypher, a4);
    objc_storeStrong((id *)&v13->_identifier, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENParticipantDevice)initWithCoder:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kENParticipantDeviceIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ENParticipantDevice devicePublicKey](self, "devicePublicKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kENParticipantDevicePublicKey"));

  -[ENParticipantDevice cypher](self, "cypher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kENParticipantDeviceCypher"));

  -[ENParticipantDevice identifier](self, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kENParticipantDeviceIdentifier"));

}

- (id)signAndConcealData:(id)a3 withSender:(id)a4 cypherIdentifier:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a4;
  v11 = a3;
  -[ENParticipantDevice cypher](self, "cypher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cypherData:withAccountIdentity:identifier:error:", v11, v10, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)verifyAndRevealData:(id)a3 withReceipient:(id)a4 cypherIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[ENParticipantDevice cypher](self, "cypher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENParticipantDevice devicePublicKey](self, "devicePublicKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "decypherData:withAccountIdentity:signingDevicePublicKey:identifier:error:", v12, v11, v14, v10, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (ENDevicePublicKey)devicePublicKey
{
  return self->_devicePublicKey;
}

- (ENCypher)cypher
{
  return self->_cypher;
}

- (void)setCypher:(id)a3
{
  objc_storeStrong((id *)&self->_cypher, a3);
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cypher, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_devicePublicKey, 0);
}

@end
