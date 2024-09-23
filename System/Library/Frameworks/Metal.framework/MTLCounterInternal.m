@implementation MTLCounterInternal

- (MTLCounterInternal)initWithName:(id)a3 description:(id)a4
{
  MTLCounterInternal *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLCounterInternal;
  v6 = -[MTLCounterInternal init](&v8, sel_init);
  v6->_name = (NSString *)a3;
  v6->_description = (NSString *)a4;
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLCounterInternal;
  -[MTLCounterInternal dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)(id)-[NSString copy](self->_description, "copy");
}

- (unint64_t)hash
{
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v4[0] = -[NSString hash](self->_name, "hash");
  v4[1] = -[NSString hash](self->_description, "hash");
  return _MTLHashState((int *)v4, 0x10uLL);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *Class;
  int v12;
  NSString *name;
  NSString *description;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    v16 = v5;
    v17 = v4;
    v18 = v3;
    Class = object_getClass(self);
    if (Class == object_getClass(a3))
    {
      name = self->_name;
      if (name == (NSString *)objc_msgSend(a3, "name")
        || (v12 = -[NSString isEqual:](self->_name, "isEqual:", objc_msgSend(a3, "name"))) != 0)
      {
        description = self->_description;
        if (description == (NSString *)objc_msgSend(a3, "description", v6, v16, v17, v18, v7, v8)
          || (v12 = -[NSString isEqual:](self->_description, "isEqual:", objc_msgSend(a3, "description"))) != 0)
        {
          LOBYTE(v12) = 1;
        }
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

@end
