@implementation ICCRTimestamp

- (ICCRTimestamp)initWithICCRCoder:(id)a3
{
  id v4;
  uint64_t v5;
  ICCRTimestamp *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "currentDocumentObjectForDecoding");
  if (*(_DWORD *)(v5 + 48) == 7)
  {
    self = -[ICCRTimestamp initWithProtobufTimestamp:decoder:](self, "initWithProtobufTimestamp:decoder:", *(_QWORD *)(v5 + 40), v4);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithICCRCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  CRDT::Timestamp *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "currentDocumentObjectForEncoding");
  v5 = v4;
  if (*(_DWORD *)(v4 + 48) == 7)
  {
    v6 = *(CRDT::Timestamp **)(v4 + 40);
  }
  else
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v5 + 48) = 7;
    v6 = (CRDT::Timestamp *)operator new();
    CRDT::Timestamp::Timestamp(v6);
    *(_QWORD *)(v5 + 40) = v6;
  }
  -[ICCRTimestamp encodeIntoProtobufTimestamp:coder:](self, "encodeIntoProtobufTimestamp:coder:", v6, v7);

}

- (ICCRTimestamp)initWithProtobufTimestamp:(const void *)a3 decoder:(id)a4
{
  id v6;
  ICCRTimestamp *v7;
  int v8;
  uint64_t v9;
  NSUUID *replica;

  v6 = a4;
  v7 = -[ICCRTimestamp init](self, "init");
  if (v7)
  {
    v8 = *((_DWORD *)a3 + 8);
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v6, "decodeUUIDFromUUIDIndex:", *((_QWORD *)a3 + 5));
      v9 = objc_claimAutoreleasedReturnValue();
      replica = v7->_replica;
      v7->_replica = (NSUUID *)v9;

      v8 = *((_DWORD *)a3 + 8);
    }
    if ((v8 & 2) != 0)
      v7->_counter = *((_QWORD *)a3 + 6);
  }

  return v7;
}

- (void)encodeIntoProtobufTimestamp:(void *)a3 coder:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  id v10;

  v10 = a4;
  -[ICCRTimestamp replica](self, "replica");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICCRTimestamp replica](self, "replica");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "encodeUUIDIndexFromUUID:", v7);
    *((_DWORD *)a3 + 8) |= 1u;
    *((_QWORD *)a3 + 5) = v8;

  }
  v9 = -[ICCRTimestamp counter](self, "counter");
  *((_DWORD *)a3 + 8) |= 2u;
  *((_QWORD *)a3 + 6) = v9;

}

- (ICCRTimestamp)initWithReplica:(id)a3 andCounter:(int64_t)a4
{
  id v7;
  ICCRTimestamp *v8;
  ICCRTimestamp *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICCRTimestamp;
  v8 = -[ICCRTimestamp init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_replica, a3);
    v9->_counter = a4;
  }

  return v9;
}

- (void)mergeWith:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "compare:", self) == 1)
  {
    objc_msgSend(v5, "replica");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCRTimestamp setReplica:](self, "setReplica:", v4);

    -[ICCRTimestamp setCounter:](self, "setCounter:", objc_msgSend(v5, "counter"));
  }

}

- (id)nextTimestampForReplica:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  ICCRTimestamp *v7;
  int64_t v8;
  ICCRTimestamp *v9;

  v4 = a3;
  -[ICCRTimestamp replica](self, "replica");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "CR_compare:", v4);

  v7 = [ICCRTimestamp alloc];
  if (v6 == -1)
    v8 = -[ICCRTimestamp counter](self, "counter");
  else
    v8 = -[ICCRTimestamp counter](self, "counter") + 1;
  v9 = -[ICCRTimestamp initWithReplica:andCounter:](v7, "initWithReplica:andCounter:", v4, v8);

  return v9;
}

- (id)nextTimestamp
{
  ICCRTimestamp *v3;
  void *v4;
  ICCRTimestamp *v5;

  v3 = [ICCRTimestamp alloc];
  -[ICCRTimestamp replica](self, "replica");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICCRTimestamp initWithReplica:andCounter:](v3, "initWithReplica:andCounter:", v4, -[ICCRTimestamp counter](self, "counter") + 1);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[ICCRTimestamp isEqualToTimestamp:](self, "isEqualToTimestamp:", v4);

  return v5;
}

- (BOOL)isEqualToTimestamp:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = -[ICCRTimestamp counter](self, "counter");
  if (v5 == objc_msgSend(v4, "counter"))
  {
    -[ICCRTimestamp replica](self, "replica");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replica");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[ICCRTimestamp replica](self, "replica");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[ICCRTimestamp counter](self, "counter") ^ v4;

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  int64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = -[ICCRTimestamp counter](self, "counter");
  if (v5 == objc_msgSend(v4, "counter"))
  {
    -[ICCRTimestamp replica](self, "replica");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replica");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "CR_compare:", v7);

  }
  else
  {
    v9 = -[ICCRTimestamp counter](self, "counter");
    if (v9 > objc_msgSend(v4, "counter"))
      v8 = 1;
    else
      v8 = -1;
  }

  return v8;
}

- (id)earlierTimestamp:(id)a3
{
  ICCRTimestamp *v4;
  ICCRTimestamp *v5;
  ICCRTimestamp *v6;

  v4 = (ICCRTimestamp *)a3;
  if (-[ICCRTimestamp compare:](self, "compare:", v4) == 1)
    v5 = v4;
  else
    v5 = self;
  v6 = v5;

  return v6;
}

- (id)laterTimestamp:(id)a3
{
  ICCRTimestamp *v4;
  ICCRTimestamp *v5;
  ICCRTimestamp *v6;

  v4 = (ICCRTimestamp *)a3;
  if (-[ICCRTimestamp compare:](self, "compare:", v4) == -1)
    v5 = v4;
  else
    v5 = self;
  v6 = v5;

  return v6;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICCRTimestamp counter](self, "counter");
  -[ICCRTimestamp replica](self, "replica");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %ld:%@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)shortDescription
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[ICCRTimestamp counter](self, "counter");
  -[ICCRTimestamp replica](self, "replica");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CR_shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%ld:%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)replica
{
  return self->_replica;
}

- (void)setReplica:(id)a3
{
  objc_storeStrong((id *)&self->_replica, a3);
}

- (int64_t)counter
{
  return self->_counter;
}

- (void)setCounter:(int64_t)a3
{
  self->_counter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replica, 0);
}

@end
