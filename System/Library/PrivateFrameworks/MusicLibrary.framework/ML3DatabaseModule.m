@implementation ML3DatabaseModule

- (ML3DatabaseModule)initWithName:(id)a3 moduleMethods:(sqlite3_module *)a4
{
  id v6;
  ML3DatabaseModule *v7;
  uint64_t v8;
  NSString *name;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ML3DatabaseModule;
  v7 = -[ML3DatabaseModule init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_moduleMethods = a4;
  }

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, name='%@'>"), objc_opt_class(), self, self->_name);
}

- (NSString)name
{
  return self->_name;
}

- (sqlite3_module)moduleMethods
{
  return self->_moduleMethods;
}

- (ML3DatabaseModuleContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
