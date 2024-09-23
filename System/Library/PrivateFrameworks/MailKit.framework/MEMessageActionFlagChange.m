@implementation MEMessageActionFlagChange

- (MEMessageActionFlagChange)initWithFlag:(int64_t)a3
{
  MEMessageActionFlagChange *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MEMessageActionFlagChange;
  result = -[MEMessageActionFlagChange init](&v5, sel_init);
  if (result)
    result->_flag = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEMessageActionFlagChange)initWithCoder:(id)a3
{
  id v4;
  MEMessageActionFlagChange *v5;

  v4 = a3;
  v5 = -[MEMessageActionFlagChange initWithFlag:](self, "initWithFlag:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_flag")));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MEMessageActionFlagChange flag](self, "flag"), CFSTR("EFPropertyKey_flag"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  BOOL v8;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  if ((objc_msgSend(v5, "isEqual:", objc_opt_class()) & 1) != 0)
  {
    v6 = v4;
    v7 = -[MEMessageActionFlagChange flag](self, "flag");
    v8 = v7 == objc_msgSend(v6, "flag");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Flag Change %ld"), -[MEMessageActionFlagChange flag](self, "flag"));
}

- (int64_t)flag
{
  return self->_flag;
}

@end
