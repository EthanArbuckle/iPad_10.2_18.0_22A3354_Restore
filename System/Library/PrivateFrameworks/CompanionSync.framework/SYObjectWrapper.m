@implementation SYObjectWrapper

- (SYObjectWrapper)initWithSYObject:(id)a3 type:(int64_t)a4
{
  id v7;
  SYObjectWrapper *v8;
  SYObjectWrapper *v9;
  SYObjectWrapper *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SYObjectWrapper;
  v8 = -[SYObjectWrapper init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_wrappedObject, a3);
    v9->_type = a4;
    v10 = v9;
  }

  return v9;
}

- (NSString)objectIdentifier
{
  return (NSString *)-[SYObject syncId](self->_wrappedObject, "syncId");
}

- (NSString)sequencer
{
  return 0;
}

- (int64_t)changeType
{
  return self->_type;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v9.receiver = self;
  v9.super_class = (Class)SYObjectWrapper;
  -[SYObjectWrapper description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYObjectWrapper objectIdentifier](self, "objectIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYObjectWrapper sequencer](self, "sequencer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ (objectIdentifier: %@, sequencer: %@, changeType: %d, wrappedObject: %@)"), v4, v5, v6, -[SYObjectWrapper changeType](self, "changeType"), self->_wrappedObject);

  return (NSString *)v7;
}

- (SYObject)wrappedObject
{
  return self->_wrappedObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedObject, 0);
}

@end
