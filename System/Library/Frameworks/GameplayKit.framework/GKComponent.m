@implementation GKComponent

- (GKComponent)init
{
  GKComponent *v2;
  GKComponent *v3;
  GKComponentSystem *componentSystem;
  NSString *componentName;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKComponent;
  v2 = -[GKComponent init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_entity = 0;
    v2->_usesPerComponentUpdateCount = 0;
    componentSystem = v2->_componentSystem;
    v2->_componentSystem = 0;

    componentName = v3->_componentName;
    v3->_componentName = 0;

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKComponent)initWithCoder:(id)a3
{
  id v4;
  GKComponent *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *componentName;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  GKComponent *v20;
  void *v21;
  NSString *v22;
  void *v24;
  id obj;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[12];

  v32[10] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[GKComponent init](self, "init");
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    v32[2] = objc_opt_class();
    v32[3] = objc_opt_class();
    v32[4] = objc_opt_class();
    v32[5] = objc_opt_class();
    v32[6] = objc_opt_class();
    v32[7] = objc_opt_class();
    v32[8] = objc_opt_class();
    v32[9] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

    objc_msgSend(v4, "allowedClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_componentName"));
    v9 = objc_claimAutoreleasedReturnValue();
    componentName = v5->_componentName;
    v5->_componentName = (NSString *)v9;

    v24 = v6;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_propertyNames"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    if (obj)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v11)
      {
        v12 = v11;
        v26 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v28 != v26)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_msgSend(v4, "decodeObjectForKey:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              v16 = v4;
              v17 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v14, "substringToIndex:", 1);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "capitalizedString");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "substringFromIndex:", 1);
              v20 = v5;
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "stringWithFormat:", CFSTR("set%@%@:"), v19, v21);
              v22 = (NSString *)objc_claimAutoreleasedReturnValue();

              v5 = v20;
              NSSelectorFromString(v22);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                -[GKComponent setValue:forKey:](v20, "setValue:forKey:", v15, v14);
              else
                NSLog(CFSTR("%@: Cannot set initial value of %@ property."), v20->_componentName, v14);

              v4 = v16;
            }

          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v12);
      }
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *componentName;

  componentName = self->_componentName;
  if (componentName)
    objc_msgSend(a3, "encodeObject:forKey:", componentName, CFSTR("_componentName"));
}

- (GKEntity)entity
{
  return self->_entity;
}

- (id)copy
{
  return -[GKComponent copyWithZone:](self, "copyWithZone:", MEMORY[0x22E2A4F5C](self, a2));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_componentSystem, 0);
}

- (GKComponent)initWithName:(id)a3
{
  id v5;
  GKComponent *v6;
  GKComponent *v7;

  v5 = a3;
  v6 = -[GKComponent init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_componentName, a3);

  return v7;
}

- (void)setEntity:(id)a3
{
  self->_entity = (GKEntity *)a3;
}

- (BOOL)usesPerComponentUpdate
{
  return self->_usesPerComponentUpdateCount != 0;
}

- (void)setUsesPerComponentUpdate:(BOOL)a3
{
  int usesPerComponentUpdateCount;
  int v4;

  usesPerComponentUpdateCount = self->_usesPerComponentUpdateCount;
  if (a3)
    v4 = usesPerComponentUpdateCount + 1;
  else
    v4 = usesPerComponentUpdateCount - 1;
  self->_usesPerComponentUpdateCount = v4;
}

- (void)setComponentName:(id)a3
{
  objc_storeStrong((id *)&self->_componentName, a3);
}

- (NSString)componentName
{
  NSString *componentName;
  NSString *v3;
  objc_class *v4;

  componentName = self->_componentName;
  if (componentName)
  {
    v3 = componentName;
  }
  else
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setComponentSystem:(id)a3
{
  objc_storeStrong((id *)&self->_componentSystem, a3);
}

- (GKComponentSystem)componentSystem
{
  return self->_componentSystem;
}

@end
