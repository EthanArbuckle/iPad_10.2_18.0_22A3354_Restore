@implementation GCGenericDeviceDataConstantExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataConstantExpressionModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDeviceDataConstantExpressionModel *v4;
  double v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GCGenericDeviceDataConstantExpressionModel;
  v3 = a3;
  v4 = -[GCGenericDeviceDataProcessorExpressionModel initWithCoder:](&v8, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("value"), v8.receiver, v8.super_class);
  v6 = v5;

  v4->_value = v6;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GCGenericDeviceDataConstantExpressionModel;
  v4 = a3;
  -[GCGenericDeviceDataProcessorExpressionModel encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  -[GCGenericDeviceDataConstantExpressionModel value](self, "value", v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("value"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceDataConstantExpressionModel;
  if (-[GCGenericDeviceDataProcessorExpressionModel isEqual:](&v10, sel_isEqual_, v4))
  {
    -[GCGenericDeviceDataConstantExpressionModel value](self, "value");
    v6 = v5;
    objc_msgSend(v4, "value");
    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)description
{
  return CFSTR("Constant Expression");
}

- (id)description
{
  uint64_t v2;

  -[GCGenericDeviceDataConstantExpressionModel value](self, "value");
  return +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("(constant %f)"), v2);
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t value = %f\n}"), v4, self, *(_QWORD *)&self->_value);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)value
{
  return self->_value;
}

- (id)_buildPullExpressionWithOverrideBuilder:(id)a3 error:(id *)a4
{
  uint64_t v4;
  _QWORD aBlock[5];

  -[GCGenericDeviceDataConstantExpressionModel value](self, "value", a3, a4);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__GCGenericDeviceDataConstantExpressionModel_Compilation___buildPullExpressionWithOverrideBuilder_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_d8__0l;
  aBlock[4] = v4;
  return _Block_copy(aBlock);
}

double __105__GCGenericDeviceDataConstantExpressionModel_Compilation___buildPullExpressionWithOverrideBuilder_error___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

@end
