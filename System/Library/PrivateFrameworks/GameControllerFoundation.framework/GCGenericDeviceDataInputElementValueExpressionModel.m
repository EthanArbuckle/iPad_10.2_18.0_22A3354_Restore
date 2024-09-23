@implementation GCGenericDeviceDataInputElementValueExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataInputElementValueExpressionModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDeviceDataInputElementValueExpressionModel *v4;
  uint64_t v5;
  NSString *elementIdentifier;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GCGenericDeviceDataInputElementValueExpressionModel;
  v3 = a3;
  v4 = -[GCGenericDeviceDataProcessorExpressionModel initWithCoder:](&v9, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("elementIdentifier"), v9.receiver, v9.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  elementIdentifier = v4->_elementIdentifier;
  v4->_elementIdentifier = (NSString *)v5;

  v7 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("scaleType"));
  v4->_scaleType = v7;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCGenericDeviceDataInputElementValueExpressionModel;
  v4 = a3;
  -[GCGenericDeviceDataProcessorExpressionModel encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[GCGenericDeviceDataInputElementValueExpressionModel elementIdentifier](self, "elementIdentifier", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("elementIdentifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[GCGenericDeviceDataInputElementValueExpressionModel scaleType](self, "scaleType"), CFSTR("scaleType"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceDataInputElementValueExpressionModel;
  if (-[GCGenericDeviceDataProcessorExpressionModel isEqual:](&v10, sel_isEqual_, v4))
  {
    -[GCGenericDeviceDataInputElementValueExpressionModel elementIdentifier](self, "elementIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "elementIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      v7 = -[GCGenericDeviceDataInputElementValueExpressionModel scaleType](self, "scaleType");
      v8 = v7 == objc_msgSend(v4, "scaleType");
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

  return v8;
}

+ (id)description
{
  return CFSTR("Element Value Expression");
}

- (id)description
{
  void *v3;
  int64_t v4;
  const __CFString *v5;
  void *v6;

  -[GCGenericDeviceDataInputElementValueExpressionModel elementIdentifier](self, "elementIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GCGenericDeviceDataInputElementValueExpressionModel scaleType](self, "scaleType");
  if ((unint64_t)(v4 + 3) > 5)
    v5 = CFSTR("?");
  else
    v5 = off_1EA4D3970[v4 + 3];
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("(element-value %@ %@)"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInputElementValueExpressionModel elementIdentifier](self, "elementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t identifier = %@\n\t scaleType = %zi\n}"), v4, self, v5, -[GCGenericDeviceDataInputElementValueExpressionModel scaleType](self, "scaleType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)scaleType
{
  return self->_scaleType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
}

@end
