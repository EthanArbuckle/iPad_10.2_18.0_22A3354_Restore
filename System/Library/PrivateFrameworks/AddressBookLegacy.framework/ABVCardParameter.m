@implementation ABVCardParameter

- (ABVCardParameter)initWithName:(id)a3
{
  ABVCardParameter *v4;
  NSMutableArray *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ABVCardParameter;
  v4 = -[ABVCardParameter init](&v7, sel_init);
  v4->_name = (NSString *)a3;
  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4->_types = v5;
  if (a3)
    -[NSMutableArray addObject:](v5, "addObject:", a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABVCardParameter;
  -[ABVCardParameter dealloc](&v3, sel_dealloc);
}

- (void)setValue:(id)a3
{
  self->_value = a3;
}

- (void)addType:(id)a3
{
  -[NSMutableArray addObject:](self->_types, "addObject:", a3);
}

- (void)addTypes:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->_types, "addObjectsFromArray:", a3);
}

- (id)types
{
  return self->_types;
}

- (id)name
{
  return self->_name;
}

- (void)setGrouping:(id)a3
{
  self->_grouping = (NSString *)a3;
}

- (id)grouping
{
  return self->_grouping;
}

- (id)value
{
  return self->_value;
}

- (BOOL)isPrimary
{
  return self->_primary;
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_primary = a3;
}

- (id)description
{
  const __CFString *name;
  void *v4;
  void *v5;

  if (self->_name)
    name = (const __CFString *)self->_name;
  else
    name = CFSTR("NONAME");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", name);
  v5 = v4;
  if (self->_value)
    objc_msgSend(v4, "appendFormat:", CFSTR("=%@"), self->_value);
  if (self->_primary)
    objc_msgSend(v5, "appendString:", CFSTR(" Primary"));
  return v5;
}

@end
