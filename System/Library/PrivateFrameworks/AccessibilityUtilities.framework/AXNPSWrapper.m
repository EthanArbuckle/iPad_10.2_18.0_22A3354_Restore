@implementation AXNPSWrapper

+ (void)synchronizeNanoDomain:(id)a3 keys:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0D51618];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "synchronizeNanoDomain:keys:", v7, v6);

}

- (AXNPSWrapper)initWithDomain:(id)a3
{
  id v4;
  AXNPSWrapper *v5;
  uint64_t v6;
  NPSDomainAccessor *wrapped;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXNPSWrapper;
  v5 = -[AXNPSWrapper init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:", v4);
    wrapped = v5->_wrapped;
    v5->_wrapped = (NPSDomainAccessor *)v6;

  }
  return v5;
}

- (id)synchronize
{
  return (id)-[NPSDomainAccessor synchronize](self->_wrapped, "synchronize");
}

- (id)objectForKey:(id)a3
{
  return (id)-[NPSDomainAccessor objectForKey:](self->_wrapped, "objectForKey:", a3);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[NPSDomainAccessor setObject:forKey:](self->_wrapped, "setObject:forKey:", a3, a4);
}

- (NPSDomainAccessor)wrapped
{
  return self->_wrapped;
}

- (void)setWrapped:(id)a3
{
  objc_storeStrong((id *)&self->_wrapped, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapped, 0);
}

@end
