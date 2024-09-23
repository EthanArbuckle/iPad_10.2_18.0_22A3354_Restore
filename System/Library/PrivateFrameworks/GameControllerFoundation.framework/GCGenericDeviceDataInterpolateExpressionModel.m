@implementation GCGenericDeviceDataInterpolateExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataInterpolateExpressionModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDeviceDataInterpolateExpressionModel *v4;
  uint64_t v5;
  GCGenericDeviceDataProcessorExpressionModel *inputExpression;
  uint64_t v7;
  GCGenericDeviceDataProcessorExpressionModel *inputMinExpression;
  uint64_t v9;
  GCGenericDeviceDataProcessorExpressionModel *inputMaxExpression;
  uint64_t v11;
  GCGenericDeviceDataProcessorExpressionModel *outputMinExpression;
  uint64_t v13;
  GCGenericDeviceDataProcessorExpressionModel *outputMaxExpression;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GCGenericDeviceDataInterpolateExpressionModel;
  v3 = a3;
  v4 = -[GCGenericDeviceDataProcessorExpressionModel initWithCoder:](&v16, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputExpression"), v16.receiver, v16.super_class);
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

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outputMinExpression"));
  v11 = objc_claimAutoreleasedReturnValue();
  outputMinExpression = v4->_outputMinExpression;
  v4->_outputMinExpression = (GCGenericDeviceDataProcessorExpressionModel *)v11;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outputMaxExpression"));
  v13 = objc_claimAutoreleasedReturnValue();

  outputMaxExpression = v4->_outputMaxExpression;
  v4->_outputMaxExpression = (GCGenericDeviceDataProcessorExpressionModel *)v13;

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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceDataInterpolateExpressionModel;
  v4 = a3;
  -[GCGenericDeviceDataProcessorExpressionModel encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[GCGenericDeviceDataInterpolateExpressionModel inputExpression](self, "inputExpression", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("inputExpression"));

  -[GCGenericDeviceDataInterpolateExpressionModel inputMinExpression](self, "inputMinExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("inputMinExpression"));

  -[GCGenericDeviceDataInterpolateExpressionModel inputMaxExpression](self, "inputMaxExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("inputMaxExpression"));

  -[GCGenericDeviceDataInterpolateExpressionModel outputMinExpression](self, "outputMinExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("outputMinExpression"));

  -[GCGenericDeviceDataInterpolateExpressionModel outputMaxExpression](self, "outputMaxExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("outputMaxExpression"));

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
  void *v13;
  char v14;
  void *v16;
  void *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GCGenericDeviceDataInterpolateExpressionModel;
  if (-[GCGenericDeviceDataProcessorExpressionModel isEqual:](&v18, sel_isEqual_, v4))
  {
    -[GCGenericDeviceDataInterpolateExpressionModel inputExpression](self, "inputExpression");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputExpression");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      -[GCGenericDeviceDataInterpolateExpressionModel inputMinExpression](self, "inputMinExpression");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "inputMinExpression");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[GCGenericDeviceDataInterpolateExpressionModel inputMaxExpression](self, "inputMaxExpression");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "inputMaxExpression");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqual:", v10))
        {
          -[GCGenericDeviceDataInterpolateExpressionModel outputMinExpression](self, "outputMinExpression");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "outputMinExpression");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqual:", v12))
          {
            -[GCGenericDeviceDataInterpolateExpressionModel outputMaxExpression](self, "outputMaxExpression");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "outputMaxExpression");
            v17 = v11;
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v16, "isEqual:", v13);

            v11 = v17;
          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)description
{
  return CFSTR("Interpolate Expression");
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
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  -[GCGenericDeviceDataInterpolateExpressionModel inputExpression](self, "inputExpression");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "description");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInterpolateExpressionModel inputMinExpression](self, "inputMinExpression");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInterpolateExpressionModel inputMaxExpression](self, "inputMaxExpression");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInterpolateExpressionModel outputMinExpression](self, "outputMinExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInterpolateExpressionModel outputMaxExpression](self, "outputMaxExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("(interpolate\n\t%@\n\t%@\n\t%@\n\t%@\n\t%@\n)"), v13, v3, v5, v8, v11);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  return v15;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInterpolateExpressionModel inputExpression](self, "inputExpression");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "debugDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInterpolateExpressionModel inputMinExpression](self, "inputMinExpression");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "debugDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInterpolateExpressionModel inputMaxExpression](self, "inputMaxExpression");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "debugDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInterpolateExpressionModel outputMinExpression](self, "outputMinExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataInterpolateExpressionModel outputMaxExpression](self, "outputMaxExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "debugDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t input = %@\n\t inputMin = %@\n\t inputMax = %@\n\t outputMin = %@\n\t outputMax = %@\n}"), v16, self, v13, v4, v5, v8, v11);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  return v17;
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

- (GCGenericDeviceDataProcessorExpressionModel)outputMinExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 32, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)outputMaxExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputMaxExpression, 0);
  objc_storeStrong((id *)&self->_outputMinExpression, 0);
  objc_storeStrong((id *)&self->_inputMaxExpression, 0);
  objc_storeStrong((id *)&self->_inputMinExpression, 0);
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
  void *v16;
  void *v17;
  _QWORD aBlock[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v6 = a3;
  -[GCGenericDeviceDataInterpolateExpressionModel inputExpression](self, "inputExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buildPullExpressionWithOverrideBuilder:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[GCGenericDeviceDataInterpolateExpressionModel inputMinExpression](self, "inputMinExpression");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buildPullExpressionWithOverrideBuilder:error:", v6, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[GCGenericDeviceDataInterpolateExpressionModel inputMaxExpression](self, "inputMaxExpression");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "buildPullExpressionWithOverrideBuilder:error:", v6, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[GCGenericDeviceDataInterpolateExpressionModel outputMinExpression](self, "outputMinExpression");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "buildPullExpressionWithOverrideBuilder:error:", v6, a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[GCGenericDeviceDataInterpolateExpressionModel outputMaxExpression](self, "outputMaxExpression");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "buildPullExpressionWithOverrideBuilder:error:", v6, a4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __108__GCGenericDeviceDataInterpolateExpressionModel_Compilation___buildPullExpressionWithOverrideBuilder_error___block_invoke;
            aBlock[3] = &unk_1EA4D4520;
            v20 = v8;
            v21 = v10;
            v22 = v12;
            v23 = v14;
            v24 = v16;
            v17 = _Block_copy(aBlock);

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

double __108__GCGenericDeviceDataInterpolateExpressionModel_Compilation___buildPullExpressionWithOverrideBuilder_error___block_invoke(_QWORD *a1)
{
  double v2;
  double v3;
  double v4;
  double v5;

  v2 = (*(double (**)(void))(a1[4] + 16))();
  v3 = (*(double (**)(void))(a1[5] + 16))();
  v4 = (*(double (**)(void))(a1[6] + 16))();
  v5 = (*(double (**)(void))(a1[7] + 16))();
  return v5 + fabs((v2 - v3) / (v4 - v3)) * ((*(double (**)(void))(a1[8] + 16))() - v5);
}

@end
