@implementation MTLNamedConstantValue

- (MTLNamedConstantValue)initWithValue:(const void *)a3 type:(unint64_t)a4 name:(id)a5
{
  MTLNamedConstantValue *v8;
  size_t v9;
  char *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTLNamedConstantValue;
  v8 = -[MTLNamedConstantValue init](&v12, sel_init);
  if (v8)
  {
    v8->_name = (NSString *)a5;
    v8->_dataType = a4;
    v9 = _MTLConstantDataSize(a4);
    v10 = (char *)operator new[]();
    v8->_data = v10;
    memcpy(v10, a3, v9);
  }
  return v8;
}

- (void)dealloc
{
  char *data;
  objc_super v4;

  data = self->_data;
  if (data)
    MEMORY[0x186DABFA4](data, 0x1000C8077774924);
  self->_data = 0;

  self->_name = 0;
  v4.receiver = self;
  v4.super_class = (Class)MTLNamedConstantValue;
  -[MTLNamedConstantValue dealloc](&v4, sel_dealloc);
}

- (id)describe
{
  void *v3;
  void *v4;

  v3 = (void *)newStringFromConstantValue((unsigned __int16 *)self->_data, self->_dataType);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("name: %@; type: %@; value: %@"),
                 self->_name,
                 MTLDataTypeString(self->_dataType),
                 v3);

  return v4;
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  const __CFString *name;
  unint64_t dataType;
  void *v10;
  objc_super v12;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v5 = (void *)newStringFromConstantValue((unsigned __int16 *)self->_data, self->_dataType);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)MTLNamedConstantValue;
  v7 = -[MTLNamedConstantValue description](&v12, sel_description);
  v13[0] = v4;
  v13[1] = CFSTR("Name =");
  name = CFSTR("<none>");
  dataType = self->_dataType;
  if (self->_name)
    name = (const __CFString *)self->_name;
  v13[2] = name;
  v13[3] = v4;
  v13[4] = CFSTR("Type =");
  v13[5] = MTLDataTypeString(dataType);
  v13[6] = v4;
  v13[7] = CFSTR("Value =");
  v13[8] = v5;
  v10 = (void *)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9), "componentsJoinedByString:", CFSTR(" ")));

  return v10;
}

- (id)description
{
  return -[MTLNamedConstantValue formattedDescription:](self, "formattedDescription:", 0);
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (void)data
{
  return self->_data;
}

@end
