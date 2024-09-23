@implementation GCGenericDeviceDataClampExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataClampExpressionModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDeviceDataClampExpressionModel *v4;
  uint64_t v5;
  GCGenericDeviceDataProcessorExpressionModel *inputExpression;
  uint64_t v7;
  GCGenericDeviceDataProcessorExpressionModel *minExpression;
  uint64_t v9;
  GCGenericDeviceDataProcessorExpressionModel *maxExpression;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GCGenericDeviceDataClampExpressionModel;
  v3 = a3;
  v4 = -[GCGenericDeviceDataProcessorExpressionModel initWithCoder:](&v12, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputExpression"), v12.receiver, v12.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  inputExpression = v4->_inputExpression;
  v4->_inputExpression = (GCGenericDeviceDataProcessorExpressionModel *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minExpression"));
  v7 = objc_claimAutoreleasedReturnValue();
  minExpression = v4->_minExpression;
  v4->_minExpression = (GCGenericDeviceDataProcessorExpressionModel *)v7;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxExpression"));
  v9 = objc_claimAutoreleasedReturnValue();

  maxExpression = v4->_maxExpression;
  v4->_maxExpression = (GCGenericDeviceDataProcessorExpressionModel *)v9;

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
  v8.super_class = (Class)GCGenericDeviceDataClampExpressionModel;
  v4 = a3;
  -[GCGenericDeviceDataProcessorExpressionModel encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[GCGenericDeviceDataClampExpressionModel inputExpression](self, "inputExpression", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("inputExpression"));

  -[GCGenericDeviceDataClampExpressionModel minExpression](self, "minExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("minExpression"));

  -[GCGenericDeviceDataClampExpressionModel maxExpression](self, "maxExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("maxExpression"));

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
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)GCGenericDeviceDataClampExpressionModel;
  if (-[GCGenericDeviceDataProcessorExpressionModel isEqual:](&v22, sel_isEqual_, v4))
  {
    -[GCGenericDeviceDataClampExpressionModel inputExpression](self, "inputExpression");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputExpression");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "isEqual:", v6))
    {
      v11 = 0;
LABEL_16:

      goto LABEL_17;
    }
    -[GCGenericDeviceDataClampExpressionModel minExpression](self, "minExpression");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "minExpression");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
    {
      -[GCGenericDeviceDataClampExpressionModel maxExpression](self, "maxExpression", v18, v20);
    }
    else
    {
      -[GCGenericDeviceDataClampExpressionModel minExpression](self, "minExpression");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "minExpression");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "isEqual:", v10))
      {
        v11 = 0;
LABEL_14:

LABEL_15:
        goto LABEL_16;
      }
      -[GCGenericDeviceDataClampExpressionModel maxExpression](self, "maxExpression", v10, v9);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "maxExpression");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v12 == (void *)v13)
    {

      v11 = 1;
    }
    else
    {
      v14 = (void *)v13;
      -[GCGenericDeviceDataClampExpressionModel maxExpression](self, "maxExpression");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "maxExpression");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v15, "isEqual:", v16);

    }
    v10 = v19;
    v9 = v21;
    if (v7 == v8)
      goto LABEL_15;
    goto LABEL_14;
  }
  v11 = 0;
LABEL_17:

  return v11;
}

+ (id)description
{
  return CFSTR("Clamp Expression");
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

  -[GCGenericDeviceDataClampExpressionModel inputExpression](self, "inputExpression");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataClampExpressionModel minExpression](self, "minExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataClampExpressionModel maxExpression](self, "maxExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("(clamp\n\t%@\n\t%@\n\t%@\n)"), v5, v8, v11);
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

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataClampExpressionModel inputExpression](self, "inputExpression");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataClampExpressionModel minExpression](self, "minExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDataClampExpressionModel maxExpression](self, "maxExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "debugDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t input = %@\n\t min = %@\n\t max = %@\n}"), v14, self, v5, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (GCGenericDeviceDataProcessorExpressionModel)inputExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 8, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)minExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 16, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)maxExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxExpression, 0);
  objc_storeStrong((id *)&self->_minExpression, 0);
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
  id v14;
  _QWORD aBlock[4];
  id v17;
  id v18;
  id v19;

  v6 = a3;
  -[GCGenericDeviceDataClampExpressionModel inputExpression](self, "inputExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buildPullExpressionWithOverrideBuilder:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[GCGenericDeviceDataClampExpressionModel minExpression](self, "minExpression");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9
      || (-[GCGenericDeviceDataClampExpressionModel minExpression](self, "minExpression"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "buildPullExpressionWithOverrideBuilder:error:", v6, a4),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9))
    {
      -[GCGenericDeviceDataClampExpressionModel maxExpression](self, "maxExpression");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[GCGenericDeviceDataClampExpressionModel maxExpression](self, "maxExpression");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "buildPullExpressionWithOverrideBuilder:error:", v6, a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          goto LABEL_10;
      }
      else
      {
        v13 = 0;
      }
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __102__GCGenericDeviceDataClampExpressionModel_Compilation___buildPullExpressionWithOverrideBuilder_error___block_invoke;
      aBlock[3] = &unk_1EA4D3C70;
      v17 = v8;
      v18 = v9;
      v19 = v13;
      v14 = v13;
      v13 = _Block_copy(aBlock);

LABEL_10:
      goto LABEL_11;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

uint64_t __102__GCGenericDeviceDataClampExpressionModel_Compilation___buildPullExpressionWithOverrideBuilder_error___block_invoke(_QWORD *a1)
{
  (*(void (**)(void))(a1[4] + 16))();
  (*(void (**)(void))(a1[5] + 16))();
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

@end
