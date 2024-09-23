@implementation C2MultipeerDiscoveryResponse

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
  objc_msgSend(v5, "encodeBool:forKey:", self->_chunkAvailable, CFSTR("chunkAvailable"));

}

- (C2MultipeerDiscoveryResponse)initWithCoder:(id)a3
{
  id v4;
  C2MultipeerDiscoveryResponse *v5;
  uint64_t v6;
  NSUUID *requestUUID;
  uint64_t v8;
  NSData *chunkSignature;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)C2MultipeerDiscoveryResponse;
  v5 = -[C2MultipeerDiscoveryResponse init](&v11, sel_init);
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

    v5->_chunkAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("chunkAvailable"));
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
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MultipeerDiscoveryResponse requestUUID](self, "requestUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MultipeerDiscoveryResponse chunkSignature](self, "chunkSignature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[C2MultipeerDiscoveryResponse chunkAvailable](self, "chunkAvailable");
  v9 = CFSTR("N");
  if (v8)
    v9 = CFSTR("Y");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ uuid=%@ chunkSignature=%@ chunkAvailable=%@>"), v5, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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

- (BOOL)chunkAvailable
{
  return self->_chunkAvailable;
}

- (void)setChunkAvailable:(BOOL)a3
{
  self->_chunkAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chunkSignature, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end
