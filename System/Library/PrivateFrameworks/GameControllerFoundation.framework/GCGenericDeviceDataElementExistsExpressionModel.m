@implementation GCGenericDeviceDataElementExistsExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataElementExistsExpressionModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDeviceDataElementExistsExpressionModel *v4;
  uint64_t v5;
  NSString *elementIdentifier;
  uint64_t v7;
  GCGenericDeviceDataProcessorExpressionModel *trueExpression;
  uint64_t v9;
  GCGenericDeviceDataProcessorExpressionModel *falseExpression;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GCGenericDeviceDataElementExistsExpressionModel;
  v3 = a3;
  v4 = -[GCGenericDeviceDataProcessorExpressionModel initWithCoder:](&v12, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("elementIdentifier"), v12.receiver, v12.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  elementIdentifier = v4->_elementIdentifier;
  v4->_elementIdentifier = (NSString *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trueExpression"));
  v7 = objc_claimAutoreleasedReturnValue();
  trueExpression = v4->_trueExpression;
  v4->_trueExpression = (GCGenericDeviceDataProcessorExpressionModel *)v7;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("falseExpression"));
  v9 = objc_claimAutoreleasedReturnValue();

  falseExpression = v4->_falseExpression;
  v4->_falseExpression = (GCGenericDeviceDataProcessorExpressionModel *)v9;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GCGenericDeviceDataElementExistsExpressionModel;
  v4 = a3;
  -[GCGenericDeviceDataProcessorExpressionModel encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[GCGenericDeviceDataElementExistsExpressionModel elementIdentifier](self, "elementIdentifier", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("elementIdentifier"));

  -[GCGenericDeviceDataElementExistsExpressionModel trueExpression](self, "trueExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("trueExpression"));

  -[GCGenericDeviceDataElementExistsExpressionModel falseExpression](self, "falseExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("falseExpression"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GCGenericDeviceDataElementExistsExpressionModel;
  if (-[GCGenericDeviceDataProcessorExpressionModel isEqual:](&v13, sel_isEqual_, v4))
  {
    -[GCGenericDeviceDataElementExistsExpressionModel elementIdentifier](self, "elementIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "elementIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      -[GCGenericDeviceDataElementExistsExpressionModel trueExpression](self, "trueExpression");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "trueExpression");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[GCGenericDeviceDataElementExistsExpressionModel falseExpression](self, "falseExpression");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "falseExpression");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)description
{
  return CFSTR("Element Exists Expression");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[GCGenericDeviceDataElementExistsExpressionModel elementIdentifier](self, "elementIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataElementExistsExpressionModel trueExpression](self, "trueExpression");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataElementExistsExpressionModel falseExpression](self, "falseExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("(element-exists '%@'\n\t%@\n\t%@\n)"), v3, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataElementExistsExpressionModel elementIdentifier](self, "elementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataElementExistsExpressionModel trueExpression](self, "trueExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataElementExistsExpressionModel falseExpression](self, "falseExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "debugDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t elementIdentifier = %@\n\t trueExpression = %@\n\t falseExpression = %@\n}"), v4, self, v5, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)trueExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 16, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)falseExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_falseExpression, 0);
  objc_storeStrong((id *)&self->_trueExpression, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
}

@end
