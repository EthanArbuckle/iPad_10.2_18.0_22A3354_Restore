@implementation GCGenericDeviceDataInputElementAttributeExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataInputElementAttributeExpressionModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDeviceDataInputElementAttributeExpressionModel *v4;
  uint64_t v5;
  NSString *elementIdentifier;
  uint64_t v7;
  NSString *attribute;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceDataInputElementAttributeExpressionModel;
  v3 = a3;
  v4 = -[GCGenericDeviceDataProcessorExpressionModel initWithCoder:](&v10, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("elementIdentifier"), v10.receiver, v10.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  elementIdentifier = v4->_elementIdentifier;
  v4->_elementIdentifier = (NSString *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attribute"));
  v7 = objc_claimAutoreleasedReturnValue();

  attribute = v4->_attribute;
  v4->_attribute = (NSString *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GCGenericDeviceDataInputElementAttributeExpressionModel;
  v4 = a3;
  -[GCGenericDeviceDataProcessorExpressionModel encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[GCGenericDeviceDataInputElementAttributeExpressionModel elementIdentifier](self, "elementIdentifier", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("elementIdentifier"));

  -[GCGenericDeviceDataInputElementAttributeExpressionModel attribute](self, "attribute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("attribute"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GCGenericDeviceDataInputElementAttributeExpressionModel;
  if (-[GCGenericDeviceDataProcessorExpressionModel isEqual:](&v11, sel_isEqual_, v4))
  {
    -[GCGenericDeviceDataInputElementAttributeExpressionModel elementIdentifier](self, "elementIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "elementIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      -[GCGenericDeviceDataInputElementAttributeExpressionModel attribute](self, "attribute");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "attribute");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)description
{
  return CFSTR("Element Attribute Expression");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  -[GCGenericDeviceDataInputElementAttributeExpressionModel elementIdentifier](self, "elementIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInputElementAttributeExpressionModel attribute](self, "attribute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("(element-attribute %@ %@)"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInputElementAttributeExpressionModel elementIdentifier](self, "elementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInputElementAttributeExpressionModel attribute](self, "attribute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t identifier = %@\n\t attribute = %@\n}"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)attribute
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribute, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
}

@end
