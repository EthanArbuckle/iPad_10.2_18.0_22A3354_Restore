@implementation HDBound

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDBound)initWithValue:(id)a3 open:(BOOL)a4
{
  id v6;
  HDBound *v7;
  uint64_t v8;
  NSMeasurement *value;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDBound;
  v7 = -[HDBound init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    value = v7->_value;
    v7->_value = (NSMeasurement *)v8;

    v7->_open = a4;
  }

  return v7;
}

- (HDBound)initWithCoder:(id)a3
{
  id v4;
  HDBound *v5;
  uint64_t v6;
  NSMeasurement *value;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDBound;
  v5 = -[HDBound init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HDBound.value"));
    v6 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSMeasurement *)v6;

    v5->_open = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HDBound.open"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMeasurement *value;
  id v5;

  value = self->_value;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", value, CFSTR("HDBound.value"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_open, CFSTR("HDBound.open"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithValue:open:", self->_value, self->_open);
}

- (BOOL)isEqual:(id)a3
{
  HDBound *v4;
  BOOL v5;

  v4 = (HDBound *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[HDBound isEqualToBound:](self, "isEqualToBound:", v4);
  }

  return v5;
}

- (BOOL)isEqualToBound:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  if (self->_open == objc_msgSend(v4, "open")
    && (objc_msgSend(v4, "value"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NSMeasurement unit](self->_value, "unit"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "canBeConvertedToUnit:", v6),
        v6,
        v5,
        v7))
  {
    objc_msgSend(v4, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMeasurement unit](self->_value, "unit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "measurementByConvertingToUnit:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[NSMeasurement isEqual:](self->_value, "isEqual:", v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[NSMeasurement doubleValue](self->_value, "doubleValue");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("value"));

  -[NSMeasurement unit](self->_value, "unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "symbol");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("units"));

  v9 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("value"));

  if (self->_open)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("open"));
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

- (NSMeasurement)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)open
{
  return self->_open;
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
