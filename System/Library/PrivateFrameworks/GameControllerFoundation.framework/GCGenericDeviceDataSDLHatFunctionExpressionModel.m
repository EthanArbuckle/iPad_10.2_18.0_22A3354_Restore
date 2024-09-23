@implementation GCGenericDeviceDataSDLHatFunctionExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataSDLHatFunctionExpressionModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDeviceDataSDLHatFunctionExpressionModel *v4;
  uint64_t v5;
  GCGenericDeviceDataProcessorExpressionModel *inputExpression;
  uint64_t v7;
  GCGenericDeviceDataProcessorExpressionModel *inputMinExpression;
  uint64_t v9;
  GCGenericDeviceDataProcessorExpressionModel *inputMaxExpression;
  uint64_t v11;
  GCGenericDeviceDataProcessorExpressionModel *maskExpression;
  uint64_t v13;
  GCGenericDeviceDataProcessorExpressionModel *trueExpression;
  uint64_t v15;
  GCGenericDeviceDataProcessorExpressionModel *falseExpression;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)GCGenericDeviceDataSDLHatFunctionExpressionModel;
  v3 = a3;
  v4 = -[GCGenericDeviceDataProcessorExpressionModel initWithCoder:](&v18, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputExpression"), v18.receiver, v18.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  inputExpression = v4->_inputExpression;
  v4->_inputExpression = (GCGenericDeviceDataProcessorExpressionModel *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputMinExpression"));
  v7 = objc_claimAutoreleasedReturnValue();
  inputMinExpression = v4->_inputMinExpression;
  v4->_inputMinExpression = (GCGenericDeviceDataProcessorExpressionModel *)v7;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputMaxExpression"));
  v9 = objc_claimAutoreleasedReturnValue();
  inputMaxExpression = v4->_inputMaxExpression;
  v4->_inputMaxExpression = (GCGenericDeviceDataProcessorExpressionModel *)v9;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maskExpression"));
  v11 = objc_claimAutoreleasedReturnValue();
  maskExpression = v4->_maskExpression;
  v4->_maskExpression = (GCGenericDeviceDataProcessorExpressionModel *)v11;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trueExpression"));
  v13 = objc_claimAutoreleasedReturnValue();
  trueExpression = v4->_trueExpression;
  v4->_trueExpression = (GCGenericDeviceDataProcessorExpressionModel *)v13;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("falseExpression"));
  v15 = objc_claimAutoreleasedReturnValue();

  falseExpression = v4->_falseExpression;
  v4->_falseExpression = (GCGenericDeviceDataProcessorExpressionModel *)v15;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GCGenericDeviceDataSDLHatFunctionExpressionModel;
  v4 = a3;
  -[GCGenericDeviceDataProcessorExpressionModel encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  -[GCGenericDeviceDataSDLHatFunctionExpressionModel inputExpression](self, "inputExpression", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("inputExpression"));

  -[GCGenericDeviceDataSDLHatFunctionExpressionModel inputMinExpression](self, "inputMinExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("inputMinExpression"));

  -[GCGenericDeviceDataSDLHatFunctionExpressionModel inputMaxExpression](self, "inputMaxExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("inputMaxExpression"));

  -[GCGenericDeviceDataSDLHatFunctionExpressionModel maskExpression](self, "maskExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("maskExpression"));

  -[GCGenericDeviceDataSDLHatFunctionExpressionModel trueExpression](self, "trueExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("trueExpression"));

  -[GCGenericDeviceDataSDLHatFunctionExpressionModel falseExpression](self, "falseExpression");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("falseExpression"));

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
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)GCGenericDeviceDataSDLHatFunctionExpressionModel;
  if (-[GCGenericDeviceDataProcessorExpressionModel isEqual:](&v23, sel_isEqual_, v4))
  {
    -[GCGenericDeviceDataSDLHatFunctionExpressionModel inputExpression](self, "inputExpression");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputExpression");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      -[GCGenericDeviceDataSDLHatFunctionExpressionModel inputMinExpression](self, "inputMinExpression");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "inputMinExpression");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[GCGenericDeviceDataSDLHatFunctionExpressionModel inputMaxExpression](self, "inputMaxExpression");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "inputMaxExpression");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqual:", v10))
        {
          -[GCGenericDeviceDataSDLHatFunctionExpressionModel maskExpression](self, "maskExpression");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "maskExpression");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqual:", v12))
          {
            v21 = v11;
            -[GCGenericDeviceDataSDLHatFunctionExpressionModel trueExpression](self, "trueExpression");
            v13 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "trueExpression");
            v14 = objc_claimAutoreleasedReturnValue();
            v22 = (void *)v13;
            v15 = (void *)v13;
            v16 = (void *)v14;
            if (objc_msgSend(v15, "isEqual:", v14))
            {
              -[GCGenericDeviceDataSDLHatFunctionExpressionModel falseExpression](self, "falseExpression");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "falseExpression");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v20, "isEqual:", v19);

            }
            else
            {
              v17 = 0;
            }

            v11 = v21;
          }
          else
          {
            v17 = 0;
          }

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)description
{
  return CFSTR("SDL Hat Function Expression");
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  -[GCGenericDeviceDataSDLHatFunctionExpressionModel inputExpression](self, "inputExpression");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "description");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataSDLHatFunctionExpressionModel inputMinExpression](self, "inputMinExpression");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "description");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataSDLHatFunctionExpressionModel inputMaxExpression](self, "inputMaxExpression");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataSDLHatFunctionExpressionModel maskExpression](self, "maskExpression");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataSDLHatFunctionExpressionModel trueExpression](self, "trueExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataSDLHatFunctionExpressionModel falseExpression](self, "falseExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("(sdl-hat-function\n\t%@\n\t%@\n\t%@\n\t%@\n\t%@\n\t%@\n)"), v15, v12, v3, v4, v7, v10);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  return v17;
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataSDLHatFunctionExpressionModel inputExpression](self, "inputExpression");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "debugDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataSDLHatFunctionExpressionModel inputMinExpression](self, "inputMinExpression");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "debugDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataSDLHatFunctionExpressionModel inputMaxExpression](self, "inputMaxExpression");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "debugDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataSDLHatFunctionExpressionModel maskExpression](self, "maskExpression");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "debugDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataSDLHatFunctionExpressionModel trueExpression](self, "trueExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataSDLHatFunctionExpressionModel falseExpression](self, "falseExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "debugDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t input = %@\n\t inputMin = %@\n\t inputMax = %@\n\t mask = %@\n\t true = %@\n\t false = %@\n}"), v18, self, v15, v13, v12, v4, v7, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (GCGenericDeviceDataProcessorExpressionModel)inputExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 8, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)inputMinExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 16, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)inputMaxExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 24, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)maskExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 32, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)trueExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 40, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)falseExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_falseExpression, 0);
  objc_storeStrong((id *)&self->_trueExpression, 0);
  objc_storeStrong((id *)&self->_maskExpression, 0);
  objc_storeStrong((id *)&self->_inputMaxExpression, 0);
  objc_storeStrong((id *)&self->_inputMinExpression, 0);
  objc_storeStrong((id *)&self->_inputExpression, 0);
}

@end
