@implementation ML3DatabaseFunction

- (ML3DatabaseFunction)initWithName:(id)a3 argumentCount:(int)a4
{
  id v6;
  ML3DatabaseFunction *v7;
  uint64_t v8;
  NSString *name;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ML3DatabaseFunction;
  v7 = -[ML3DatabaseFunction init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_argumentCount = a4;
  }

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (int)argumentCount
{
  return self->_argumentCount;
}

- (BOOL)registerWithConnection:(id)a3
{
  return 0;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setArgumentCount:(int)a3
{
  self->_argumentCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
