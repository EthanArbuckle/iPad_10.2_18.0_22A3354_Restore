@implementation AFApplicationInfo

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  void *v6;
  int pid;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    identifier = self->_identifier;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](identifier, "isEqualToString:", v6))
    {
      pid = self->_pid;
      v8 = pid == objc_msgSend(v4, "pid");
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

- (int)pid
{
  return self->_pid;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("_identifier"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_pid, CFSTR("_pid"));

}

- (AFApplicationInfo)initWithCoder:(id)a3
{
  id v4;
  AFApplicationInfo *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFApplicationInfo;
  v5 = -[AFApplicationInfo init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_pid = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_pid"));
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash") ^ self->_pid;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)AFApplicationInfo;
  -[AFApplicationInfo description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@ %d"), v4, self->_identifier, self->_pid);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
