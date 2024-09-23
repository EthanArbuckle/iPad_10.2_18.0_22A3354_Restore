@implementation LACSharedMode

- (LACSharedMode)initWithActive:(BOOL)a3
{
  return -[LACSharedMode initWithActive:confirmed:](self, "initWithActive:confirmed:", a3, 1);
}

- (LACSharedMode)initWithActive:(BOOL)a3 confirmed:(BOOL)a4
{
  LACSharedMode *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LACSharedMode;
  result = -[LACSharedMode init](&v7, sel_init);
  if (result)
  {
    result->_active = a3;
    result->_confirmed = a4;
  }
  return result;
}

+ (id)defaultSharedMode
{
  return -[LACSharedMode initWithActive:confirmed:]([LACSharedMode alloc], "initWithActive:confirmed:", 0, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  _BOOL4 v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[LACSharedMode isActive](self, "isActive");
    if (v6 == objc_msgSend(v5, "isActive"))
    {
      v8 = -[LACSharedMode isConfirmed](self, "isConfirmed");
      v7 = v8 ^ objc_msgSend(v5, "isConfirmed") ^ 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v10[0] = CFSTR("isActive");
  if (-[LACSharedMode isActive](self, "isActive"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v10[1] = CFSTR("isConfirmed");
  v11[0] = v5;
  if (-[LACSharedMode isConfirmed](self, "isConfirmed"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v11[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v4, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isConfirmed
{
  return self->_confirmed;
}

@end
