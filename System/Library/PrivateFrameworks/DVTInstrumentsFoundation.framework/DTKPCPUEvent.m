@implementation DTKPCPUEvent

- (DTKPCPUEvent)initWithName:(id)a3 alias:(id)a4 definition:(id)a5 kpepEvent:(kpep_event *)a6
{
  id v10;
  id v11;
  id v12;
  DTKPCPUEvent *v13;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSString *alias;
  NSString *v18;
  NSString *displayName;
  uint64_t v20;
  NSString *definition;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v23.receiver = self;
  v23.super_class = (Class)DTKPCPUEvent;
  v13 = -[DTKPCPUEvent init](&v23, sel_init);
  if (v13)
  {
    if (!objc_msgSend(v10, "length"))
      sub_222BC7830();
    if (!a6)
      sub_222BC7858();
    v14 = objc_msgSend(v10, "copy");
    name = v13->_name;
    v13->_name = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    alias = v13->_alias;
    v13->_alias = (NSString *)v16;

    if (-[NSString length](v13->_alias, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ (%@)"), v13->_alias, v13->_name);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = v13->_name;
    }
    displayName = v13->_displayName;
    v13->_displayName = v18;

    v20 = objc_msgSend(v12, "copy");
    definition = v13->_definition;
    v13->_definition = (NSString *)v20;

    v13->_kpepEvent = a6;
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *alias;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DTKPCPUEvent;
  -[DTKPCPUEvent description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  alias = (const __CFString *)self->_alias;
  if (!alias)
    alias = CFSTR("no alias");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@ (%@)"), self->_name, alias);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)aliasOrName
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString length](self->_alias, "length");
  v4 = 32;
  if (!v3)
    v4 = 24;
  return (NSString *)*(id *)((char *)&self->super.isa + v4);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (kpep_event)kpepEvent
{
  return self->_kpepEvent;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)alias
{
  return self->_alias;
}

- (void)setAlias:(id)a3
{
  objc_storeStrong((id *)&self->_alias, a3);
}

- (NSString)definition
{
  return self->_definition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_alias, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
