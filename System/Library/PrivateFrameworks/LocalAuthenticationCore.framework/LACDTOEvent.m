@implementation LACDTOEvent

- (LACDTOEvent)initWithRawValue:(int64_t)a3 optionalValue:(id)a4
{
  id v7;
  LACDTOEvent *v8;
  LACDTOEvent *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LACDTOEvent;
  v8 = -[LACDTOEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_rawValue = a3;
    objc_storeStrong(&v8->_value, a4);
  }

  return v9;
}

- (LACDTOEvent)initWithRawValue:(int64_t)a3
{
  return -[LACDTOEvent initWithRawValue:optionalValue:](self, "initWithRawValue:optionalValue:", a3, 0);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = -[LACDTOEvent rawValue](self, "rawValue");
  if ((unint64_t)(v6 - 1) > 2)
    v7 = CFSTR("LADTOEventRawValueRatchetStateDidChange");
  else
    v7 = off_2510C1298[v6 - 1];
  objc_msgSend(v5, "stringWithFormat:", CFSTR("rawValue: %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v9 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOEvent value](self, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("value: %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR("; "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v4, self, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "rawValue");
    if (v6 == -[LACDTOEvent rawValue](self, "rawValue"))
    {
      objc_msgSend(v5, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACDTOEvent value](self, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

      v10 = v9 ^ 1;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)rawValue
{
  return self->_rawValue;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end
