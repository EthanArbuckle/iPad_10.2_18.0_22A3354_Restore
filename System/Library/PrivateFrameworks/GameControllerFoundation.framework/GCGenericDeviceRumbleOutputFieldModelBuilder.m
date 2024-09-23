@implementation GCGenericDeviceRumbleOutputFieldModelBuilder

- (GCGenericDeviceRumbleOutputFieldModelBuilder)init
{
  GCGenericDeviceRumbleOutputFieldModelBuilder *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GCGenericDeviceRumbleOutputFieldModelBuilder;
  v2 = -[GCGenericDeviceRumbleOutputFieldModelBuilder init](&v4, sel_init);
  -[GCGenericDeviceRumbleOutputFieldModelBuilder reset](v2, "reset");
  return v2;
}

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "valueExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceRumbleOutputFieldModelBuilder setValueExpression:](self, "setValueExpression:", v5);

  objc_msgSend(v4, "offsetExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceRumbleOutputFieldModelBuilder setOffsetExpression:](self, "setOffsetExpression:", v6);

  objc_msgSend(v4, "sizeExpression");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[GCGenericDeviceRumbleOutputFieldModelBuilder setSizeExpression:](self, "setSizeExpression:", v7);
}

- (void)reset
{
  -[GCGenericDeviceRumbleOutputFieldModelBuilder setValueExpression:](self, "setValueExpression:", 0);
  -[GCGenericDeviceRumbleOutputFieldModelBuilder setOffsetExpression:](self, "setOffsetExpression:", 0);
  -[GCGenericDeviceRumbleOutputFieldModelBuilder setSizeExpression:](self, "setSizeExpression:", 0);
}

- (id)build
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;

  v4 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "modelClass"));
  -[GCGenericDeviceRumbleOutputFieldModelBuilder valueExpression](self, "valueExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceRumbleOutputFieldModel.m"), 127, CFSTR("'valueExpression' can not be nil"));

  }
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  -[GCGenericDeviceRumbleOutputFieldModelBuilder offsetExpression](self, "offsetExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceRumbleOutputFieldModel.m"), 131, CFSTR("'offsetExpression' can not be nil"));

  }
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

  -[GCGenericDeviceRumbleOutputFieldModelBuilder sizeExpression](self, "sizeExpression");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceRumbleOutputFieldModel.m"), 135, CFSTR("'sizeExpression' can not be nil"));

  }
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)v4[3];
  v4[3] = v12;

  return v4;
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
    v8.super_class = (Class)GCGenericDeviceRumbleOutputFieldModelBuilder;
    v5 = -[GCGenericDeviceRumbleOutputFieldModelBuilder isEqual:](&v8, sel_isEqual_, v4);
  }
  v6 = v5;

  return v6;
}

- (GCGenericDeviceDataProcessorExpressionModel)valueExpression
{
  return self->_valueExpression;
}

- (void)setValueExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (GCGenericDeviceDataProcessorExpressionModel)offsetExpression
{
  return self->_offsetExpression;
}

- (void)setOffsetExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (GCGenericDeviceDataProcessorExpressionModel)sizeExpression
{
  return self->_sizeExpression;
}

- (void)setSizeExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeExpression, 0);
  objc_storeStrong((id *)&self->_offsetExpression, 0);
  objc_storeStrong((id *)&self->_valueExpression, 0);
}

@end
