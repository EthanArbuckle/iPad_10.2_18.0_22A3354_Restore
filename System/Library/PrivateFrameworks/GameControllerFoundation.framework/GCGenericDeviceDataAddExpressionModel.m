@implementation GCGenericDeviceDataAddExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataAddExpressionModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDeviceDataAddExpressionModel *v4;
  uint64_t v5;
  GCGenericDeviceDataProcessorExpressionModel *leftExpression;
  uint64_t v7;
  GCGenericDeviceDataProcessorExpressionModel *rightExpression;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceDataAddExpressionModel;
  v3 = a3;
  v4 = -[GCGenericDeviceDataProcessorExpressionModel initWithCoder:](&v10, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("leftExpression"), v10.receiver, v10.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  leftExpression = v4->_leftExpression;
  v4->_leftExpression = (GCGenericDeviceDataProcessorExpressionModel *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rightExpression"));
  v7 = objc_claimAutoreleasedReturnValue();

  rightExpression = v4->_rightExpression;
  v4->_rightExpression = (GCGenericDeviceDataProcessorExpressionModel *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GCGenericDeviceDataAddExpressionModel;
  v4 = a3;
  -[GCGenericDeviceDataProcessorExpressionModel encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[GCGenericDeviceDataAddExpressionModel leftExpression](self, "leftExpression", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("leftExpression"));

  -[GCGenericDeviceDataAddExpressionModel rightExpression](self, "rightExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("rightExpression"));

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
  v11.super_class = (Class)GCGenericDeviceDataAddExpressionModel;
  if (-[GCGenericDeviceDataProcessorExpressionModel isEqual:](&v11, sel_isEqual_, v4))
  {
    -[GCGenericDeviceDataAddExpressionModel leftExpression](self, "leftExpression");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leftExpression");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      -[GCGenericDeviceDataAddExpressionModel rightExpression](self, "rightExpression");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "rightExpression");
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
  return CFSTR("Add Expression");
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

  -[GCGenericDeviceDataAddExpressionModel leftExpression](self, "leftExpression");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataAddExpressionModel rightExpression](self, "rightExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("(add\n\t%@\n\t%@\n)"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataAddExpressionModel leftExpression](self, "leftExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataAddExpressionModel rightExpression](self, "rightExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "debugDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t left = %@\n\t right = %@\n}"), v4, self, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (GCGenericDeviceDataProcessorExpressionModel)leftExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 8, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)rightExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightExpression, 0);
  objc_storeStrong((id *)&self->_leftExpression, 0);
}

- (id)_buildPullExpressionWithOverrideBuilder:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[GCGenericDeviceDataAddExpressionModel leftExpression](self, "leftExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buildPullExpressionWithOverrideBuilder:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[GCGenericDeviceDataAddExpressionModel rightExpression](self, "rightExpression");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buildPullExpressionWithOverrideBuilder:error:", v6, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __100__GCGenericDeviceDataAddExpressionModel_Compilation___buildPullExpressionWithOverrideBuilder_error___block_invoke;
      v13[3] = &unk_1EA4D2A88;
      v14 = v8;
      v15 = v10;
      v11 = _Block_copy(v13);

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

double __100__GCGenericDeviceDataAddExpressionModel_Compilation___buildPullExpressionWithOverrideBuilder_error___block_invoke(uint64_t a1)
{
  double v2;

  v2 = (*(double (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v2 + (*(double (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
