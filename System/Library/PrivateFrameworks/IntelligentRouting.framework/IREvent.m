@implementation IREvent

- (IREvent)initWithName:(id)a3
{
  id v5;
  IREvent *v6;
  IREvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IREvent;
  v6 = -[IREvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_name, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:", self->_name);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_name, CFSTR("name"));
}

- (IREvent)initWithCoder:(id)a3
{
  id v4;
  IREvent *v5;
  void *v6;
  uint64_t v7;
  NSString *name;
  IREvent *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IREvent;
  v5 = -[IREvent init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v7 = objc_claimAutoreleasedReturnValue();

    name = v5->_name;
    v5->_name = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (IREvent)init
{
  __assert_rtn("-[IREvent init]", "IREvent.m", 53, "NO");
}

+ (id)new
{
  __assert_rtn("+[IREvent new]", "IREvent.m", 58, "NO");
}

- (int64_t)eventSubType
{
  __assert_rtn("-[IREvent eventSubType]", "IREvent.m", 63, "NO");
}

- (id)contextIdentifier
{
  __assert_rtn("-[IREvent contextIdentifier]", "IREvent.m", 68, "NO");
}

- (id)bundleID
{
  __assert_rtn("-[IREvent bundleID]", "IREvent.m", 73, "NO");
}

- (int64_t)eventType
{
  __assert_rtn("-[IREvent eventType]", "IREvent.m", 78, "NO");
}

- (BOOL)isOutsideApp
{
  return 0;
}

- (BOOL)isEligibleApp
{
  return 0;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  objc_msgSend(v6, "appendFormat:", CFSTR(", name: %@"), self->_name);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[IREvent name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      -[IREvent name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v9 == v10;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_name, "hash") ^ 0x43;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
