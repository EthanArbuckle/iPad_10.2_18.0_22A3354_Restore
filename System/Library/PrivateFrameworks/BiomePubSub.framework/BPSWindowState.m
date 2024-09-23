@implementation BPSWindowState

- (BPSWindowState)initWithIdentifier:(id)a3 aggregate:(id)a4 completed:(BOOL)a5
{
  id v9;
  id v10;
  BPSWindowState *v11;
  BPSWindowState *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BPSWindowState;
  v11 = -[BPSWindowState init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong(&v12->_aggregate, a4);
    v12->_completed = a5;
  }

  return v12;
}

- (id)metadata
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Override method %@ in subclass %@"), v4, objc_opt_class());

  return 0;
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
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSWindowState identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

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

  -[BPSWindowState identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[BPSWindowState identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[BPSWindowState aggregate](self, "aggregate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("aggregate"));

  objc_msgSend(v6, "encodeBool:forKey:", -[BPSWindowState completed](self, "completed"), CFSTR("completed"));
}

- (BPSWindowState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BPSWindowState *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3510], "bm_allowedClassesForSecureCodingBMBookmark");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("aggregate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      self = -[BPSWindowState initWithIdentifier:aggregate:completed:](self, "initWithIdentifier:aggregate:completed:", v5, v7, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("completed")));
      v8 = self;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (id)aggregate
{
  return self->_aggregate;
}

- (void)setAggregate:(id)a3
{
  objc_storeStrong(&self->_aggregate, a3);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_aggregate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
