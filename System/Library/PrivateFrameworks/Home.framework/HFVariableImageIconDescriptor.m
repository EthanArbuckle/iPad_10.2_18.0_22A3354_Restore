@implementation HFVariableImageIconDescriptor

- (HFVariableImageIconDescriptor)initWithSystemImageNamed:(id)a3 variableValue:(double)a4 configuration:(id)a5
{
  HFVariableImageIconDescriptor *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HFVariableImageIconDescriptor;
  result = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:](&v7, sel_initWithSystemImageNamed_configuration_, a3, a5);
  if (result)
    result->_variableValue = a4;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  objc_super v13;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7
    && (v13.receiver = self,
        v13.super_class = (Class)HFVariableImageIconDescriptor,
        -[HFImageIconDescriptor isEqual:](&v13, sel_isEqual_, v7)))
  {
    -[HFVariableImageIconDescriptor variableValue](self, "variableValue");
    v9 = v8;
    objc_msgSend(v7, "variableValue");
    v11 = v9 == v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFVariableImageIconDescriptor;
  v3 = -[HFImageIconDescriptor hash](&v8, sel_hash);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[HFVariableImageIconDescriptor variableValue](self, "variableValue");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v3;

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFImageIconDescriptor imageIdentifier](self, "imageIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFImageIconDescriptor imageSymbolConfiguration](self, "imageSymbolConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFVariableImageIconDescriptor variableValue](self, "variableValue");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, \"%@\", %@ (%f)>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)variableValue
{
  return self->_variableValue;
}

@end
