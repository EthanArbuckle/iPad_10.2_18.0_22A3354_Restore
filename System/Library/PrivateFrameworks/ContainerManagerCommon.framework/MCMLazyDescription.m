@implementation MCMLazyDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong(&self->_block, 0);
}

- (id)redactedDescription
{
  return (id)(*((uint64_t (**)(id, uint64_t))self->_block + 2))(self->_block, 1);
}

- (MCMLazyDescription)initWithDescriber:(id)a3
{
  id v4;
  MCMLazyDescription *v5;
  uint64_t v6;
  id block;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMLazyDescription;
  v5 = -[MCMLazyDescription init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1D17D71B4](v4);
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (unint64_t)length
{
  NSString *value;
  id v4;

  value = self->_value;
  if (!value)
  {
    v4 = -[MCMLazyDescription description](self, "description");
    value = self->_value;
  }
  return -[NSString length](value, "length");
}

- (id)description
{
  NSString *value;
  NSString *v4;
  NSString *v5;

  value = self->_value;
  if (!value)
  {
    (*((void (**)(void))self->_block + 2))();
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_value;
    self->_value = v4;

    value = self->_value;
  }
  return value;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSString *value;
  id v9;

  length = a4.length;
  location = a4.location;
  value = self->_value;
  if (!value)
  {
    v9 = -[MCMLazyDescription description](self, "description");
    value = self->_value;
  }
  -[NSString getCharacters:range:](value, "getCharacters:range:", a3, location, length);
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  NSString *value;
  id v6;

  value = self->_value;
  if (!value)
  {
    v6 = -[MCMLazyDescription description](self, "description");
    value = self->_value;
  }
  return -[NSString characterAtIndex:](value, "characterAtIndex:", a3);
}

@end
