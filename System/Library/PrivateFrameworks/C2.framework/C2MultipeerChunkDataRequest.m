@implementation C2MultipeerChunkDataRequest

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
  objc_msgSend(v5, "encodeBool:forKey:", self->_chunkDataRequested, CFSTR("chunkDataRequested"));

}

- (C2MultipeerChunkDataRequest)initWithCoder:(id)a3
{
  id v4;
  C2MultipeerChunkDataRequest *v5;
  uint64_t v6;
  NSUUID *requestUUID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)C2MultipeerChunkDataRequest;
  v5 = -[C2MultipeerChunkDataRequest init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestUUID = v5->_requestUUID;
    v5->_requestUUID = (NSUUID *)v6;

    v5->_chunkDataRequested = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("chunkDataRequested"));
  }

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MultipeerChunkDataRequest requestUUID](self, "requestUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[C2MultipeerChunkDataRequest chunkDataRequested](self, "chunkDataRequested");
  v8 = CFSTR("N");
  if (v7)
    v8 = CFSTR("Y");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ uuid=%@ chunkDataRequested=%@>"), v5, v6, v8);
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

- (BOOL)chunkDataRequested
{
  return self->_chunkDataRequested;
}

- (void)setChunkDataRequested:(BOOL)a3
{
  self->_chunkDataRequested = a3;
}

- (id)chunkDataCallback
{
  return self->_chunkDataCallback;
}

- (void)setChunkDataCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_chunkDataCallback, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end
