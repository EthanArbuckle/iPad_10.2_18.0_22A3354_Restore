@implementation ARUserProfile

+ (id)defaultProfile
{
  return -[ARUserProfile initWithIdentifier:type:]([ARUserProfile alloc], "initWithIdentifier:type:", CFSTR("Default"), 0x7FFFFFFFFFFFFFFFLL);
}

+ (BOOL)isGuestProfileEnabled
{
  return 0;
}

- (ARUserProfile)initWithIdentifier:(id)a3 type:(int64_t)a4
{
  id v7;
  ARUserProfile *v8;
  ARUserProfile *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ARUserProfile;
  v8 = -[ARUserProfile init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_type = a4;
  }

  return v9;
}

- (id)description
{
  int64_t type;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;

  type = self->_type;
  v4 = CFSTR("PersistGuest");
  v5 = CFSTR("Default");
  if (type != 0x7FFFFFFFFFFFFFFFLL)
    v5 = 0;
  if (type != 2)
    v4 = v5;
  v6 = CFSTR("Enrolled");
  v7 = CFSTR("Guest");
  if (type != 1)
    v7 = 0;
  if (type)
    v6 = v7;
  if (type <= 1)
    v8 = v6;
  else
    v8 = v4;
  v9 = (void *)MEMORY[0x24BDD17C8];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p: Identifier:%@, type:%@>"), v11, self, self->_identifier, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_type == v4[2]
    && -[NSString isEqualToString:](self->_identifier, "isEqualToString:", v4[1]);

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
