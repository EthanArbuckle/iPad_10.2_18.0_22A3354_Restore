@implementation ASDSelectorValue

- (ASDSelectorValue)initWithValue:(unsigned int)a3 name:(id)a4 andKind:(unsigned int)a5 selected:(BOOL)a6
{
  id v11;
  ASDSelectorValue *v12;
  ASDSelectorValue *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ASDSelectorValue;
  v12 = -[ASDSelectorValue init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_value = a3;
    objc_storeStrong((id *)&v12->_name, a4);
    v13->_kind = a5;
    v13->_selected = a6;
  }

  return v13;
}

+ (id)withValue:(unsigned int)a3 name:(id)a4 andKind:(unsigned int)a5 selected:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  ASDSelectorValue *v10;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a3;
  v9 = a4;
  v10 = -[ASDSelectorValue initWithValue:name:andKind:selected:]([ASDSelectorValue alloc], "initWithValue:name:andKind:selected:", v8, v9, v7, v6);

  return v10;
}

+ (id)withValue:(unsigned int)a3 name:(id)a4 andKind:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  ASDSelectorValue *v8;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = -[ASDSelectorValue initWithValue:name:andKind:selected:]([ASDSelectorValue alloc], "initWithValue:name:andKind:selected:", v6, v7, v5, 0);

  return v8;
}

+ (id)withValue:(unsigned int)a3 andName:(id)a4 selected:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v7;
  ASDSelectorValue *v8;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = -[ASDSelectorValue initWithValue:name:andKind:selected:]([ASDSelectorValue alloc], "initWithValue:name:andKind:selected:", v6, v7, 0, v5);

  return v8;
}

+ (id)withValue:(unsigned int)a3 andName:(id)a4
{
  uint64_t v4;
  id v5;
  ASDSelectorValue *v6;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = -[ASDSelectorValue initWithValue:name:andKind:selected:]([ASDSelectorValue alloc], "initWithValue:name:andKind:selected:", v4, v5, 0, 0);

  return v6;
}

+ (id)withValue:(unsigned int)a3
{
  return -[ASDSelectorValue initWithValue:name:andKind:selected:]([ASDSelectorValue alloc], "initWithValue:name:andKind:selected:", *(_QWORD *)&a3, 0, 0, 0);
}

- (unint64_t)hash
{
  return -[ASDSelectorValue value](self, "value");
}

- (BOOL)isEqual:(id)a3
{
  ASDSelectorValue *v4;
  unsigned int v5;
  BOOL v6;

  v4 = (ASDSelectorValue *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[ASDSelectorValue value](v4, "value");
      v6 = v5 == -[ASDSelectorValue value](self, "value");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  const char *v17;
  void *v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[ASDSelectorValue value](self, "value");
  if ((int)-[ASDSelectorValue value](self, "value") < 0x20000000
    || (int)-[ASDSelectorValue value](self, "value") > 2130706431)
  {
    v5 = 32;
  }
  else
  {
    v5 = ((int)-[ASDSelectorValue value](self, "value") >> 24);
  }
  if ((int)(-[ASDSelectorValue value](self, "value") << 8) < 0x20000000
    || (int)(-[ASDSelectorValue value](self, "value") << 8) > 2130706431)
  {
    v6 = 32;
  }
  else
  {
    v6 = ((int)(-[ASDSelectorValue value](self, "value") << 8) >> 24);
  }
  if ((int)(-[ASDSelectorValue value](self, "value") << 16) < 0x20000000
    || (int)(-[ASDSelectorValue value](self, "value") << 16) > 2130706431)
  {
    v7 = 32;
  }
  else
  {
    v7 = ((__int16)-[ASDSelectorValue value](self, "value") >> 8);
  }
  if ((int)(-[ASDSelectorValue value](self, "value") << 24) < 520093697
    || -[ASDSelectorValue value](self, "value") == 127)
  {
    v8 = 32;
  }
  else
  {
    v8 = (char)-[ASDSelectorValue value](self, "value");
  }
  -[ASDSelectorValue name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ASDSelectorValue kind](self, "kind");
  if ((int)-[ASDSelectorValue kind](self, "kind") < 0x20000000
    || (int)-[ASDSelectorValue kind](self, "kind") > 2130706431)
  {
    v11 = 32;
  }
  else
  {
    v11 = ((int)-[ASDSelectorValue kind](self, "kind") >> 24);
  }
  v21 = v11;
  if ((int)(-[ASDSelectorValue kind](self, "kind") << 8) < 0x20000000
    || (int)(-[ASDSelectorValue kind](self, "kind") << 8) > 2130706431)
  {
    v12 = 32;
  }
  else
  {
    v12 = ((int)(-[ASDSelectorValue kind](self, "kind") << 8) >> 24);
  }
  v22 = v4;
  v20 = v3;
  if ((int)(-[ASDSelectorValue kind](self, "kind") << 16) < 0x20000000
    || (int)(-[ASDSelectorValue kind](self, "kind") << 16) > 2130706431)
  {
    v13 = 32;
  }
  else
  {
    v13 = ((__int16)-[ASDSelectorValue kind](self, "kind") >> 8);
  }
  v14 = v5;
  if ((int)(-[ASDSelectorValue kind](self, "kind") << 24) < 520093697
    || -[ASDSelectorValue kind](self, "kind") == 127)
  {
    v15 = 32;
  }
  else
  {
    v15 = (char)-[ASDSelectorValue kind](self, "kind");
  }
  v16 = -[ASDSelectorValue selected](self, "selected");
  v17 = "";
  if (v16)
    v17 = ", selected";
  objc_msgSend(v20, "stringWithFormat:", CFSTR("value: %x (%c%c%c%c), name: \"%@\", kind: %x (%c%c%c%c)%s"), v22, v14, v6, v7, v8, v9, v10, v21, v12, v13, v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (unsigned)value
{
  return self->_value;
}

- (void)setValue:(unsigned int)a3
{
  self->_value = a3;
}

- (unsigned)kind
{
  return self->_kind;
}

- (void)setKind:(unsigned int)a3
{
  self->_kind = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)prevSelected
{
  return self->_prevSelected;
}

- (void)setPrevSelected:(BOOL)a3
{
  self->_prevSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
