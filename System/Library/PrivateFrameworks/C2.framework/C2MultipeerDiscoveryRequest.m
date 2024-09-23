@implementation C2MultipeerDiscoveryRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *requestUUID;
  id v5;

  requestUUID = self->_requestUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", requestUUID, CFSTR("requestUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_chunkSignature, CFSTR("chunkSignature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_containerIdentifier, CFSTR("containerIdentifier"));

}

- (C2MultipeerDiscoveryRequest)initWithCoder:(id)a3
{
  id v4;
  C2MultipeerDiscoveryRequest *v5;
  uint64_t v6;
  NSUUID *requestUUID;
  uint64_t v8;
  NSData *chunkSignature;
  uint64_t v10;
  NSString *containerIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)C2MultipeerDiscoveryRequest;
  v5 = -[C2MultipeerDiscoveryRequest init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestUUID = v5->_requestUUID;
    v5->_requestUUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("chunkSignature"));
    v8 = objc_claimAutoreleasedReturnValue();
    chunkSignature = v5->_chunkSignature;
    v5->_chunkSignature = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v10;

  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MultipeerDiscoveryRequest requestUUID](self, "requestUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MultipeerDiscoveryRequest chunkSignature](self, "chunkSignature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MultipeerDiscoveryRequest containerIdentifier](self, "containerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ uuid=%@ chunkSignature=%@ containerIdentifier=%@>"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_requestUUID, a3);
}

- (NSData)chunkSignature
{
  return self->_chunkSignature;
}

- (void)setChunkSignature:(id)a3
{
  objc_storeStrong((id *)&self->_chunkSignature, a3);
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_containerIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_chunkSignature, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end
