@implementation ENGroupID

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENGroupID)initWithDataRepresentation:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  ENStableGroupID *v8;
  ENGroupID *v9;
  unsigned int v11;

  v4 = a3;
  v5 = +[ENStableGroupID stableGroupIDLength](ENStableGroupID, "stableGroupIDLength");
  if (objc_msgSend(v4, "length") == v5 + 4)
  {
    objc_msgSend(v4, "subdataWithRange:", 0, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subdataWithRange:", v5, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ENStableGroupID initWithDataRepresentation:]([ENStableGroupID alloc], "initWithDataRepresentation:", v6);
    if (v8)
    {
      v11 = -1431655766;
      objc_msgSend(v7, "getBytes:length:", &v11, 4);
      self = -[ENGroupID initWithStableGroupID:generation:](self, "initWithStableGroupID:generation:", v8, v11);
      v9 = self;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    +[ENLog groupID](ENLog, "groupID");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1D4D0592C((uint64_t)v4, v6);
    v9 = 0;
  }

  return v9;
}

- (ENGroupID)initWithStableGroupID:(id)a3 generation:(int)a4
{
  id v7;
  ENGroupID *v8;
  ENGroupID *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ENGroupID;
  v8 = -[ENGroupID init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_stableGroupID, a3);
    v9->_generation = a4;
  }

  return v9;
}

- (ENGroupID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  ENGroupID *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kENGroupIDStableGroupID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("kENGroupIDGeneration"));

  v7 = -[ENGroupID initWithStableGroupID:generation:](self, "initWithStableGroupID:generation:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ENGroupID stableGroupID](self, "stableGroupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kENGroupIDStableGroupID"));

  objc_msgSend(v5, "encodeInt32:forKey:", -[ENGroupID generation](self, "generation"), CFSTR("kENGroupIDGeneration"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[ENGroupID stableGroupID](self, "stableGroupID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stableGroupID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      v8 = -[ENGroupID generation](self, "generation");
      v9 = v8 == objc_msgSend(v5, "generation");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  int v3;
  void *v4;
  unint64_t v5;

  v3 = -[ENGroupID generation](self, "generation");
  -[ENGroupID stableGroupID](self, "stableGroupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") + 23 * v3 + 8993;

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[ENGroupID stableGroupID](self, "stableGroupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p stableGroupID: %@ generation: %d>"), v4, self, v5, -[ENGroupID generation](self, "generation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSData)dataRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  -[ENGroupID stableGroupID](self, "stableGroupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mutableDataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "appendBytes:length:", &self->_generation, 4);
  return (NSData *)v5;
}

- (BOOL)compare:(id)a3 withResult:(int64_t *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int64_t v16;

  v8 = a3;
  -[ENGroupID stableGroupID](self, "stableGroupID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stableGroupID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    v12 = objc_msgSend(v8, "generation");
    v13 = -[ENGroupID generation](self, "generation");
    v14 = objc_msgSend(v8, "generation");
    v15 = -[ENGroupID generation](self, "generation");
    if (a4)
    {
      if (v12 <= v13)
        v16 = 0;
      else
        v16 = -1;
      if (v14 < v15)
        v16 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", ENGroupIDErrorDomain, -1000, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a4)
    {
      v16 = 0;
LABEL_13:
      *a4 = v16;
    }
  }

  return v11;
}

- (ENStableGroupID)stableGroupID
{
  return self->_stableGroupID;
}

- (int)generation
{
  return self->_generation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableGroupID, 0);
}

@end
