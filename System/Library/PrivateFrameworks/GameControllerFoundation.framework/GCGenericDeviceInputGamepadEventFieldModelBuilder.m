@implementation GCGenericDeviceInputGamepadEventFieldModelBuilder

- (GCGenericDeviceInputGamepadEventFieldModelBuilder)init
{
  GCGenericDeviceInputGamepadEventFieldModelBuilder *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GCGenericDeviceInputGamepadEventFieldModelBuilder;
  v2 = -[GCGenericDeviceInputGamepadEventFieldModelBuilder init](&v4, sel_init);
  -[GCGenericDeviceInputGamepadEventFieldModelBuilder reset](v2, "reset");
  return v2;
}

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GCGenericDeviceInputGamepadEventFieldModelBuilder setExtendedIndex:](self, "setExtendedIndex:", objc_msgSend(v4, "extendedIndex"));
  objc_msgSend(v4, "sourceExpression");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[GCGenericDeviceInputGamepadEventFieldModelBuilder setSourceExpression:](self, "setSourceExpression:", v5);
}

- (void)reset
{
  -[GCGenericDeviceInputGamepadEventFieldModelBuilder setExtendedIndex:](self, "setExtendedIndex:", -1);
}

- (id)build
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "modelClass"));
  v3[1] = -[GCGenericDeviceInputGamepadEventFieldModelBuilder extendedIndex](self, "extendedIndex");
  -[GCGenericDeviceInputGamepadEventFieldModelBuilder sourceExpression](self, "sourceExpression");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copy");
  v6 = (void *)v3[2];
  v3[2] = v5;

  return v3;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "modelClass"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "isEqual:", self);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GCGenericDeviceInputGamepadEventFieldModelBuilder;
    v5 = -[GCGenericDeviceInputGamepadEventFieldModelBuilder isEqual:](&v8, sel_isEqual_, v4);
  }
  v6 = v5;

  return v6;
}

- (int64_t)extendedIndex
{
  return self->_extendedIndex;
}

- (void)setExtendedIndex:(int64_t)a3
{
  self->_extendedIndex = a3;
}

- (GCGenericDeviceDataProcessorExpressionModel)sourceExpression
{
  return self->_sourceExpression;
}

- (void)setSourceExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceExpression, 0);
}

@end
