@implementation MTLIndexedConstantValue

- (MTLIndexedConstantValue)initWithValue:(const void *)a3 type:(unint64_t)a4 index:(unint64_t)a5
{
  MTLIndexedConstantValue *v8;
  MTLIndexedConstantValue *v9;
  size_t v10;
  char *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTLIndexedConstantValue;
  v8 = -[MTLIndexedConstantValue init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_index = a5;
    v8->_dataType = a4;
    v10 = _MTLConstantDataSize(a4);
    v11 = (char *)operator new[]();
    v9->_data = v11;
    memcpy(v11, a3, v10);
  }
  return v9;
}

- (void)dealloc
{
  char *data;
  objc_super v4;

  data = self->_data;
  if (data)
    MEMORY[0x186DABFA4](data, 0x1000C8077774924);
  self->_data = 0;
  v4.receiver = self;
  v4.super_class = (Class)MTLIndexedConstantValue;
  -[MTLIndexedConstantValue dealloc](&v4, sel_dealloc);
}

- (id)describe
{
  void *v3;
  void *v4;

  v3 = (void *)newStringFromConstantValue((unsigned __int16 *)self->_data, self->_dataType);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("index: %@; type: %@; value: %@"),
                 objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_index),
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
  void *v8;
  objc_super v10;
  _QWORD v11[10];

  v11[9] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v5 = (void *)newStringFromConstantValue((unsigned __int16 *)self->_data, self->_dataType);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)MTLIndexedConstantValue;
  v7 = -[MTLIndexedConstantValue description](&v10, sel_description);
  v11[0] = v4;
  v11[1] = CFSTR("Index =");
  v11[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_index);
  v11[3] = v4;
  v11[4] = CFSTR("Type =");
  v11[5] = MTLDataTypeString(self->_dataType);
  v11[6] = v4;
  v11[7] = CFSTR("Value =");
  v11[8] = v5;
  v8 = (void *)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 9), "componentsJoinedByString:", CFSTR(" ")));

  return v8;
}

- (id)description
{
  return -[MTLIndexedConstantValue formattedDescription:](self, "formattedDescription:", 0);
}

- (unint64_t)index
{
  return self->_index;
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
