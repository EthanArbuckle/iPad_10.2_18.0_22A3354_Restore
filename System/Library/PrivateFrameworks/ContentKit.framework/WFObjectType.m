@implementation WFObjectType

- (WFObjectType)initWithClassName:(id)a3 inBundle:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WFObjectType *v10;
  uint64_t v11;
  NSString *className;
  WFObjectType *v13;
  void *v15;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFObjectType.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("className"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFObjectType.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundle"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFObjectType;
  v10 = -[WFObjectType init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    className = v10->_className;
    v10->_className = (NSString *)v11;

    objc_storeStrong((id *)&v10->_bundle, a4);
    v13 = v10;
  }

  return v10;
}

- (WFObjectType)initWithObjectClass:(Class)a3
{
  WFObjectType *v5;
  WFObjectType *v6;
  uint64_t v7;
  NSString *className;
  WFObjectType *v9;
  void *v12;
  objc_super v13;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFObjectType.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectClass"));

  }
  v13.receiver = self;
  v13.super_class = (Class)WFObjectType;
  v5 = -[WFObjectType init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_objectClass, a3);
    NSStringFromClass(a3);
    v7 = objc_claimAutoreleasedReturnValue();
    className = v6->_className;
    v6->_className = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self || -[WFObjectType isEqualToType:](self, "isEqualToType:");
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFObjectType;
  v3 = -[WFType hash](&v7, sel_hash);
  -[WFObjectType className](self, "className");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqualToType:(id)a3
{
  WFObjectType *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WFObjectType *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFObjectType className](v4, "className");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFObjectType className](self, "className");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isEqualToClass:(Class)a3
{
  void *v4;
  void *v5;
  char v6;

  NSStringFromClass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFObjectType className](self, "className");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (BOOL)conformsToType:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "className");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WFObjectType objectClass](self, "objectClass");
    do
    {
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", v5);

      if ((v8 & 1) != 0)
        break;
      v6 = (objc_class *)-[objc_class superclass](v6, "superclass");
    }
    while (v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)conformsToClass:(Class)a3
{
  return -[objc_class isSubclassOfClass:](-[WFObjectType objectClass](self, "objectClass"), "isSubclassOfClass:", a3);
}

- (Class)objectClass
{
  Class objectClass;
  Class result;
  void *v5;
  char v6;
  id v7;
  NSString *v8;
  objc_class *v9;
  Class v10;
  Class v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  objectClass = self->_objectClass;
  if (objectClass)
    return objectClass;
  -[WFObjectType bundle](self, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v6 = objc_msgSend(v5, "loadAndReturnError:", &v16);
  v7 = v16;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Unable to load bundle %@: %@"), v5, v7);
    __break(1u);
    goto LABEL_8;
  }
  -[WFObjectType className](self, "className");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(v8);
  v9 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v10 = self->_objectClass;
  self->_objectClass = v9;

  v11 = self->_objectClass;
  if (!v11)
  {
LABEL_8:
    v13 = (void *)MEMORY[0x24BDBCE88];
    v14 = *MEMORY[0x24BDBCAB0];
    -[WFObjectType className](self, "className");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "raise:format:", v14, CFSTR("Unable to load object class named %@ from bundle: %@"), v15, v5);

    __break(1u);
    return result;
  }
  v12 = v11;

  return v12;
}

- (WFObjectType)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  WFObjectType *v7;
  Class v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("className"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundlePath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v6);
    v7 = (WFObjectType *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      self = -[WFObjectType initWithClassName:inBundle:](self, "initWithClassName:inBundle:", v5, v7);

      v7 = self;
    }
  }
  else
  {
    v8 = NSClassFromString(v5);
    if (v8)
    {
      self = -[WFObjectType initWithObjectClass:](self, "initWithObjectClass:", v8);
      v7 = self;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFObjectType className](self, "className");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("className"));

  -[WFObjectType bundle](self, "bundle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundlePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundlePath"));

}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (NSString)className
{
  return self->_className;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_objectClass, 0);
}

+ (WFObjectType)typeWithClass:(Class)a3
{
  return (WFObjectType *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithObjectClass:", a3);
}

+ (id)typesWithClasses:(id)a3
{
  id v5;
  void *v6;
  void *v8;
  _QWORD v9[5];

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFObjectType.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectClasses"));

  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __33__WFObjectType_typesWithClasses___block_invoke;
  v9[3] = &__block_descriptor_40_e25___WFObjectType_24__0_8Q16l;
  v9[4] = a1;
  objc_msgSend(v5, "if_map:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (WFObjectType)typeWithClassName:(id)a3 frameworkName:(id)a4 location:(unint64_t)a5
{
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = a4;
  v9 = (objc_class *)MEMORY[0x24BDBCF48];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initFileURLWithPath:isDirectory:", CFSTR("/"), 1);
  if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2 && _CFMZEnabled())
  {
    objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", CFSTR("/System/iOSSupport/"), 1);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", CFSTR("/System/Library/"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a5 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    v14 = CFSTR("PrivateFrameworks");
    goto LABEL_8;
  }
  if ((a5 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    v14 = CFSTR("Frameworks");
LABEL_8:
    objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", v14, 1);
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v15;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.framework"), v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithClassName:inBundle:", v10, v18);

  return (WFObjectType *)v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

id __33__WFObjectType_typesWithClasses___block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithObjectClass:", a2);
}

@end
