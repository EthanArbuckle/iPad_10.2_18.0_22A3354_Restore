@implementation NEIKEv2EAPProtocol

- (NEIKEv2EAPProtocol)initWithMethod:(unint64_t)a3
{
  NEIKEv2EAPProtocol *v4;
  NEIKEv2EAPProtocol *v5;
  NEIKEv2EAPProtocol *v6;
  NSObject *v8;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NEIKEv2EAPProtocol;
  v4 = -[NEIKEv2EAPProtocol init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_method = a3;
    v6 = v4;
  }
  else
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_19BD16000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v9, 2u);
    }

  }
  return v5;
}

- (id)description
{
  unint64_t v3;
  __CFString *v4;

  v3 = -[NEIKEv2EAPProtocol method](self, "method");
  if (v3 >= 8)
    v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown[%llu]"), -[NEIKEv2EAPProtocol method](self, "method"));
  else
    v4 = off_1E3CC0B38[v3];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  if (v4 && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[NEIKEv2EAPProtocol method](self, "method");
    v7 = objc_msgSend(v5, "method");

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NEIKEv2EAPProtocol *v4;
  void *v5;
  void *v6;

  v4 = -[NEIKEv2EAPProtocol initWithMethod:](+[NEIKEv2EAPProtocol allocWithZone:](NEIKEv2EAPProtocol, "allocWithZone:", a3), "initWithMethod:", -[NEIKEv2EAPProtocol method](self, "method"));
  -[NEIKEv2EAPProtocol properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[NEIKEv2EAPProtocol setProperties:](v4, "setProperties:", v6);

  return v4;
}

- (unint64_t)method
{
  return self->_method;
}

- (NSDictionary)properties
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
