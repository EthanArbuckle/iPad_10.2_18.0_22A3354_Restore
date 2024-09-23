@implementation WFObjectRepresentation

+ (id)object:(id)a3
{
  return (id)objc_msgSend(a1, "object:named:", a3, 0);
}

+ (id)object:(id)a3 named:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObject:named:", v7, v6);

  return v8;
}

+ (id)objects:(id)a3
{
  return (id)objc_msgSend(a1, "objects:named:", a3, 0);
}

+ (id)objects:(id)a3 named:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __40__WFObjectRepresentation_objects_named___block_invoke;
  v10[3] = &unk_24C4DBC20;
  v11 = v6;
  v12 = a1;
  v7 = v6;
  objc_msgSend(a3, "if_map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __40__WFObjectRepresentation_objects_named___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "object:named:", a2, *(_QWORD *)(a1 + 32));
}

- (WFObjectRepresentation)initWithObject:(id)a3 named:(id)a4
{
  id v8;
  id v9;
  WFObjectRepresentation *v10;
  uint64_t v11;
  NSString *wfName;
  WFObjectRepresentation *v13;
  void *v15;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFObjectRepresentation.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

  }
  v10 = -[WFObjectRepresentation init](self, "init");
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      v9 = 0;
    }
    objc_storeStrong(&v10->_object, a3);
    v11 = objc_msgSend(v9, "copy");
    wfName = v10->_wfName;
    v10->_wfName = (NSString *)v11;

    v13 = v10;
  }

  return v10;
}

- (NSString)specifiedName
{
  return self->_wfName;
}

- (NSString)wfName
{
  NSString *wfName;
  NSString *v3;
  void *v4;

  wfName = self->_wfName;
  if (wfName)
  {
    v3 = wfName;
  }
  else
  {
    -[WFObjectRepresentation object](self, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wfName");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (WFObjectType)wfType
{
  void *v2;
  void *v3;

  -[WFObjectRepresentation object](self, "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wfType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFObjectType *)v3;
}

- (id)copyWithName:(id)a3 zone:(_NSZone *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a4);
  -[WFObjectRepresentation object](self, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9 = (void *)objc_msgSend(v7, "initWithObject:named:", v8, v6);
  }
  else
  {
    -[WFObjectRepresentation wfName](self, "wfName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithObject:named:", v8, v10);

  }
  return v9;
}

- (WFObjectRepresentation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WFObjectRepresentation *v8;

  v4 = a3;
  objc_msgSend(v4, "allowedClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("object"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wfName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFObjectRepresentation initWithObject:named:](self, "initWithObject:named:", v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *wfName;
  void *v5;
  id v6;

  v6 = a3;
  if (-[WFObjectRepresentation isEncodable](self, "isEncodable"))
  {
    wfName = self->_wfName;
    if (wfName)
      objc_msgSend(v6, "encodeObject:forKey:", wfName, CFSTR("wfName"));
    -[WFObjectRepresentation object](self, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("object"));

  }
}

- (BOOL)isEncodable
{
  void *v2;
  uint64_t v3;
  BOOL v4;

  -[WFObjectRepresentation object](self, "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_25473D770)
    && objc_msgSend((id)objc_opt_class(), "supportsSecureCoding"))
  {
    v3 = objc_opt_class();
    v4 = v3 != objc_opt_class();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)object
{
  return self->_object;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_wfName, 0);
}

@end
