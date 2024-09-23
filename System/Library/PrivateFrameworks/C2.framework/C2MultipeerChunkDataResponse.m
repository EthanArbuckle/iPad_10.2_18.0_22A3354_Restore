@implementation C2MultipeerChunkDataResponse

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_chunkData, CFSTR("chunkData"));

}

- (C2MultipeerChunkDataResponse)initWithCoder:(id)a3
{
  id v4;
  C2MultipeerChunkDataResponse *v5;
  uint64_t v6;
  NSUUID *requestUUID;
  uint64_t v8;
  NSData *chunkData;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)C2MultipeerChunkDataResponse;
  v5 = -[C2MultipeerChunkDataResponse init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestUUID = v5->_requestUUID;
    v5->_requestUUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("chunkData"));
    v8 = objc_claimAutoreleasedReturnValue();
    chunkData = v5->_chunkData;
    v5->_chunkData = (NSData *)v8;

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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MultipeerChunkDataResponse requestUUID](self, "requestUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MultipeerChunkDataResponse chunkData](self, "chunkData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ uuid=%@ chunkDataLength=%llu>"), v5, v6, objc_msgSend(v7, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_requestUUID, a3);
}

- (NSData)chunkData
{
  return self->_chunkData;
}

- (void)setChunkData:(id)a3
{
  objc_storeStrong((id *)&self->_chunkData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chunkData, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end
