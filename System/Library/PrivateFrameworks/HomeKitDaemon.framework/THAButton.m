@implementation THAButton

- (THAButton)initWithType:(unint64_t)a3 identifier:(unsigned __int8)a4
{
  THAButton *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THAButton;
  result = -[THAButton init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_identifier = a4;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Button  identifier: %lu,  Type: %lu"), -[THAButton identifier](self, "identifier"), -[THAButton type](self, "type"));
}

- (BOOL)isEqual:(id)a3
{
  THAButton *v4;
  THAButton *v5;
  int v6;
  unint64_t v7;
  BOOL v8;

  v4 = (THAButton *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (v5 && (v6 = -[THAButton identifier](self, "identifier"), v6 == -[THAButton identifier](v5, "identifier")))
      {
        v7 = -[THAButton type](self, "type");
        v8 = v7 == -[THAButton type](v5, "type");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[THAButton type](self, "type");
  return -[THAButton identifier](self, "identifier") | (v3 << 8);
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned __int8)a3
{
  self->_identifier = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

@end
