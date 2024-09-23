@implementation GCGenericDeviceDataBitTestExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataBitTestExpressionModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDeviceDataBitTestExpressionModel *v4;
  uint64_t v5;
  GCGenericDeviceDataProcessorExpressionModel *inputExpression;
  uint64_t v7;
  GCGenericDeviceDataProcessorExpressionModel *maskExpression;
  uint64_t v9;
  GCGenericDeviceDataProcessorExpressionModel *trueExpression;
  uint64_t v11;
  GCGenericDeviceDataProcessorExpressionModel *falseExpression;
  char v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)GCGenericDeviceDataBitTestExpressionModel;
  v3 = a3;
  v4 = -[GCGenericDeviceDataProcessorExpressionModel initWithCoder:](&v15, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputExpression"), v15.receiver, v15.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  inputExpression = v4->_inputExpression;
  v4->_inputExpression = (GCGenericDeviceDataProcessorExpressionModel *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maskExpression"));
  v7 = objc_claimAutoreleasedReturnValue();
  maskExpression = v4->_maskExpression;
  v4->_maskExpression = (GCGenericDeviceDataProcessorExpressionModel *)v7;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trueExpression"));
  v9 = objc_claimAutoreleasedReturnValue();
  trueExpression = v4->_trueExpression;
  v4->_trueExpression = (GCGenericDeviceDataProcessorExpressionModel *)v9;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("falseExpression"));
  v11 = objc_claimAutoreleasedReturnValue();
  falseExpression = v4->_falseExpression;
  v4->_falseExpression = (GCGenericDeviceDataProcessorExpressionModel *)v11;

  v13 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("partialMatch"));
  v4->_partialMatch = v13;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GCGenericDeviceDataBitTestExpressionModel;
  v4 = a3;
  -[GCGenericDeviceDataProcessorExpressionModel encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[GCGenericDeviceDataBitTestExpressionModel inputExpression](self, "inputExpression", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("inputExpression"));

  -[GCGenericDeviceDataBitTestExpressionModel maskExpression](self, "maskExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("maskExpression"));

  -[GCGenericDeviceDataBitTestExpressionModel trueExpression](self, "trueExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("trueExpression"));

  -[GCGenericDeviceDataBitTestExpressionModel falseExpression](self, "falseExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("falseExpression"));

  objc_msgSend(v4, "encodeBool:forKey:", -[GCGenericDeviceDataBitTestExpressionModel partialMatch](self, "partialMatch"), CFSTR("partialMatch"));
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
  _BOOL4 v13;
  int v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GCGenericDeviceDataBitTestExpressionModel;
  if (-[GCGenericDeviceDataProcessorExpressionModel isEqual:](&v16, sel_isEqual_, v4))
  {
    -[GCGenericDeviceDataBitTestExpressionModel inputExpression](self, "inputExpression");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputExpression");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      -[GCGenericDeviceDataBitTestExpressionModel maskExpression](self, "maskExpression");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "maskExpression");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[GCGenericDeviceDataBitTestExpressionModel trueExpression](self, "trueExpression");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "trueExpression");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqual:", v10))
        {
          -[GCGenericDeviceDataBitTestExpressionModel falseExpression](self, "falseExpression");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "falseExpression");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqual:", v12))
          {
            v13 = -[GCGenericDeviceDataBitTestExpressionModel partialMatch](self, "partialMatch");
            v14 = v13 ^ objc_msgSend(v4, "partialMatch") ^ 1;
          }
          else
          {
            LOBYTE(v14) = 0;
          }

        }
        else
        {
          LOBYTE(v14) = 0;
        }

      }
      else
      {
        LOBYTE(v14) = 0;
      }

    }
    else
    {
      LOBYTE(v14) = 0;
    }

  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

+ (id)description
{
  return CFSTR("Bit Test Expression");
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
  void *v11;
  void *v12;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;

  v14 = -[GCGenericDeviceDataBitTestExpressionModel partialMatch](self, "partialMatch");
  -[GCGenericDeviceDataBitTestExpressionModel inputExpression](self, "inputExpression");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataBitTestExpressionModel maskExpression](self, "maskExpression");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataBitTestExpressionModel trueExpression](self, "trueExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataBitTestExpressionModel falseExpression](self, "falseExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("(bit-test %i\n\t%@\n\t%@\n\t%@\n\t%@\n)"), v14, v3, v5, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataBitTestExpressionModel inputExpression](self, "inputExpression");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "debugDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataBitTestExpressionModel maskExpression](self, "maskExpression");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "debugDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataBitTestExpressionModel trueExpression](self, "trueExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataBitTestExpressionModel falseExpression](self, "falseExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "debugDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t input = %@\n\t mask = %@\n\t trueExpression = %@\n\t falseExpression = %@\n\t partialMatch = %i\n}"), v14, self, v4, v5, v8, v11, -[GCGenericDeviceDataBitTestExpressionModel partialMatch](self, "partialMatch"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (GCGenericDeviceDataProcessorExpressionModel)inputExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 8, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)maskExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 16, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)trueExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 24, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)falseExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)partialMatch
{
  return self->_partialMatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_falseExpression, 0);
  objc_storeStrong((id *)&self->_trueExpression, 0);
  objc_storeStrong((id *)&self->_maskExpression, 0);
  objc_storeStrong((id *)&self->_inputExpression, 0);
}

- (id)_buildPullExpressionWithOverrideBuilder:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v6 = a3;
  -[GCGenericDeviceDataBitTestExpressionModel inputExpression](self, "inputExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buildPullExpressionWithOverrideBuilder:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[GCGenericDeviceDataBitTestExpressionModel maskExpression](self, "maskExpression");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buildPullExpressionWithOverrideBuilder:error:", v6, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[GCGenericDeviceDataBitTestExpressionModel trueExpression](self, "trueExpression");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "buildPullExpressionWithOverrideBuilder:error:", v6, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[GCGenericDeviceDataBitTestExpressionModel falseExpression](self, "falseExpression");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "buildPullExpressionWithOverrideBuilder:error:", v6, a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __104__GCGenericDeviceDataBitTestExpressionModel_Compilation___buildPullExpressionWithOverrideBuilder_error___block_invoke;
          v17[3] = &unk_1EA4D2A60;
          v18 = v8;
          v19 = v10;
          v20 = v12;
          v21 = v14;
          v15 = _Block_copy(v17);

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __104__GCGenericDeviceDataBitTestExpressionModel_Compilation___buildPullExpressionWithOverrideBuilder_error___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t v4;

  v2 = (*(double (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = (*(double (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = 48;
  if (((uint64_t)rint(v3) & (uint64_t)rint(v2)) == 0)
    v4 = 56;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + v4) + 16))();
}

@end
