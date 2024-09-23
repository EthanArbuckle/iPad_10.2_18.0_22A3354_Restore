@implementation AFXPCWrapper

- (AFXPCWrapper)initWithXPCObject:(id)a3
{
  id v5;
  AFXPCWrapper *v6;
  AFXPCWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFXPCWrapper;
  v6 = -[AFXPCWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_xpcObject, a3);

  return v7;
}

- (id)xpcObject
{
  return self->_xpcObject;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_xpcObject)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "encodeXPCObject:forKey:", self->_xpcObject, CFSTR("_xpcObject"));
  }

}

- (AFXPCWrapper)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  AFXPCWrapper *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81388], CFSTR("_xpcObject"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = -[AFXPCWrapper initWithXPCObject:](self, "initWithXPCObject:", v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcObject, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
