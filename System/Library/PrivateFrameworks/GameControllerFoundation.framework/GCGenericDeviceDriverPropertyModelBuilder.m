@implementation GCGenericDeviceDriverPropertyModelBuilder

- (GCGenericDeviceDriverPropertyModelBuilder)init
{
  GCGenericDeviceDriverPropertyModelBuilder *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GCGenericDeviceDriverPropertyModelBuilder;
  v2 = -[GCGenericDeviceDriverPropertyModelBuilder init](&v4, sel_init);
  -[GCGenericDeviceDriverPropertyModelBuilder reset](v2, "reset");
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
  id v6;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDriverPropertyModelBuilder setName:](self, "setName:", v5);

  objc_msgSend(v4, "valueExpression");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[GCGenericDeviceDriverPropertyModelBuilder setValueExpression:](self, "setValueExpression:", v6);
}

- (void)reset
{
  -[GCGenericDeviceDriverPropertyModelBuilder setName:](self, "setName:", 0);
  -[GCGenericDeviceDriverPropertyModelBuilder setValueExpression:](self, "setValueExpression:", 0);
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
  void *v12;
  void *v13;

  v4 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "modelClass"));
  -[GCGenericDeviceDriverPropertyModelBuilder name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDriverPropertyModel.m"), 122, CFSTR("'name' can not be nil"));

  }
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  -[GCGenericDeviceDriverPropertyModelBuilder valueExpression](self, "valueExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGenericDeviceDriverPropertyModel.m"), 126, CFSTR("'valueExpression' can not be nil"));

  }
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

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
    v8.super_class = (Class)GCGenericDeviceDriverPropertyModelBuilder;
    v5 = -[GCGenericDeviceDriverPropertyModelBuilder isEqual:](&v8, sel_isEqual_, v4);
  }
  v6 = v5;

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (GCGenericDeviceDataProcessorExpressionModel)valueExpression
{
  return self->_valueExpression;
}

- (void)setValueExpression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueExpression, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
