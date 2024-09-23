@implementation ENStableGroupID

+ (unint64_t)stableGroupIDLength
{
  return 16;
}

+ (ENStableGroupID)stableGroupIDWithCurrentTime
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUUID:", v3);

  return (ENStableGroupID *)v4;
}

- (id)_mutableDataRepresentation
{
  id v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  -[ENStableGroupID uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getUUIDBytes:", v6);

  objc_msgSend(v3, "appendBytes:length:", v6, 16);
  return v3;
}

- (ENStableGroupID)initWithDataRepresentation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  ENStableGroupID *v7;
  NSObject *v8;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5 == objc_msgSend((id)objc_opt_class(), "stableGroupIDLength"))
  {
    *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    objc_msgSend(v4, "getBytes:length:", &v10, 16);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v10);
    self = -[ENStableGroupID initWithUUID:](self, "initWithUUID:", v6);

    v7 = self;
  }
  else
  {
    +[ENLog groupID](ENLog, "groupID");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v10) = 138543362;
      *(_QWORD *)((char *)&v10 + 4) = v4;
      _os_log_impl(&dword_1D4CF8000, v8, OS_LOG_TYPE_DEFAULT, "ENStableGroupID initWithDataRepresentation - Wrong data length -- Failed {data: %{public}@}", (uint8_t *)&v10, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (ENStableGroupID)initWithUUID:(id)a3
{
  id v5;
  ENStableGroupID *v6;
  ENStableGroupID *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ENStableGroupID;
  v6 = -[ENStableGroupID init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_uuid, a3);

  return v7;
}

- (ENStableGroupID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ENStableGroupID *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kENStableGroupIDUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ENStableGroupID initWithUUID:](self, "initWithUUID:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ENStableGroupID uuid](self, "uuid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kENStableGroupIDUUID"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENStableGroupID uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ENStableGroupID uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  memset(v9, 170, 32);
  v4 = a3;
  -[ENStableGroupID uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getUUIDBytes:", &v9[2]);

  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "getUUIDBytes:", v9);
  v7 = -[ENStableGroupID customUUIDCompare:u2:](self, "customUUIDCompare:u2:", &v9[2], v9);
  if (v7 < 0)
    return -1;
  else
    return v7 > 0;
}

- (int)customUUIDCompare:(unsigned __int8)a3[16] u2:(unsigned __int8)a4[16]
{
  int v4;
  int v5;
  int result;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;

  v4 = a3[6] & 0xF;
  v5 = a4[6] & 0xF;
  result = v4 - v5;
  if (v4 == v5)
  {
    v7 = a3[7];
    v8 = a4[7];
    result = v7 - v8;
    if (v7 == v8)
    {
      v9 = a3[4];
      v10 = a4[4];
      result = v9 - v10;
      if (v9 == v10)
      {
        v11 = a3[5];
        v12 = a4[5];
        result = v11 - v12;
        if (v11 == v12)
        {
          v13 = *a3;
          v14 = *a4;
          result = v13 - v14;
          if (v13 == v14)
          {
            v15 = a3[1];
            v16 = a4[1];
            result = v15 - v16;
            if (v15 == v16)
            {
              v17 = a3[2];
              v18 = a4[2];
              result = v17 - v18;
              if (v17 == v18)
                return a3[3] - a4[3];
            }
          }
        }
      }
    }
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[ENStableGroupID uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p uuid: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
