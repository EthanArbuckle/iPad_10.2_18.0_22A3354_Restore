@implementation SGLabeledValue

- (SGLabeledValue)initWithLabel:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  SGLabeledValue *v8;
  uint64_t v9;
  NSString *label;
  uint64_t v11;
  NSString *value;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SGLabeledValue;
  v8 = -[SGLabeledValue init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    label = v8->_label;
    v8->_label = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    value = v8->_value;
    v8->_value = (NSString *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  SGLabeledValue *v4;
  SGLabeledValue *v5;
  BOOL v6;

  v4 = (SGLabeledValue *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGLabeledValue isEqualToLabeledValue:](self, "isEqualToLabeledValue:", v5);

  return v6;
}

- (BOOL)isEqualToLabeledValue:(id)a3
{
  id *v4;
  NSString *label;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  char v10;
  NSString *v11;
  NSString *v12;

  v4 = (id *)a3;
  label = self->_label;
  v6 = (NSString *)v4[1];
  if (label == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = label;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_value;
  v12 = v11;
  if (v11 == v4[2])
    v10 = 1;
  else
    v10 = -[NSString isEqual:](v11, "isEqual:");

LABEL_9:
  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_label, "hash");
  return -[NSString hash](self->_value, "hash") - v3 + 32 * v3;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGLabeledValue: %@: %@>"), self->_label, self->_value);
}

- (NSString)label
{
  return self->_label;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
