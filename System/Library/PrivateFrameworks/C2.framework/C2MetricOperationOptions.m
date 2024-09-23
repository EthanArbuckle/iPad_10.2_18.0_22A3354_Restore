@implementation C2MetricOperationOptions

- (void)setOperationType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setOperationId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setOperationGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationType, 0);
  objc_storeStrong((id *)&self->_operationId, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);
}

- (C2MetricOperationGroupOptions)operationGroup
{
  return self->_operationGroup;
}

- (NSString)operationType
{
  return self->_operationType;
}

- (NSString)operationId
{
  return self->_operationId;
}

- (id)copyWithZone:(_NSZone *)a3
{
  C2MetricOperationOptions *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = +[C2MetricOperationOptions allocWithZone:](C2MetricOperationOptions, "allocWithZone:", a3);
  if (v4)
  {
    -[C2MetricOperationOptions operationGroup](self, "operationGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2MetricOperationOptions setOperationGroup:](v4, "setOperationGroup:", v5);

    -[C2MetricOperationOptions operationId](self, "operationId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2MetricOperationOptions setOperationId:](v4, "setOperationId:", v6);

    -[C2MetricOperationOptions operationType](self, "operationType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2MetricOperationOptions setOperationType:](v4, "setOperationType:", v7);

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  C2MetricOperationOptions *v4;
  C2MetricOperationOptions *v5;
  C2MetricOperationGroupOptions *operationGroup;
  uint64_t v7;
  void *v8;
  C2MetricOperationGroupOptions *v9;
  void *v10;
  _BOOL4 v11;
  BOOL v12;
  NSString *operationId;
  uint64_t v14;
  NSString *v15;
  void *v16;
  int v17;
  NSString *operationType;
  uint64_t v19;
  NSString *v20;
  void *v21;
  char v22;

  v4 = (C2MetricOperationOptions *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      operationGroup = self->_operationGroup;
      -[C2MetricOperationOptions operationGroup](v5, "operationGroup");
      v7 = objc_claimAutoreleasedReturnValue();
      if (operationGroup == (C2MetricOperationGroupOptions *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        v9 = self->_operationGroup;
        if (!v9)
          goto LABEL_19;
        -[C2MetricOperationOptions operationGroup](v5, "operationGroup");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[C2MetricOperationGroupOptions isEqual:](v9, "isEqual:", v10);

        if (!v11)
          goto LABEL_20;
      }
      operationId = self->_operationId;
      -[C2MetricOperationOptions operationId](v5, "operationId");
      v14 = objc_claimAutoreleasedReturnValue();
      if (operationId == (NSString *)v14)
      {

      }
      else
      {
        v8 = (void *)v14;
        v15 = self->_operationId;
        if (!v15)
          goto LABEL_19;
        -[C2MetricOperationOptions operationId](v5, "operationId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[NSString isEqual:](v15, "isEqual:", v16);

        if (!v17)
          goto LABEL_20;
      }
      operationType = self->_operationType;
      -[C2MetricOperationOptions operationType](v5, "operationType");
      v19 = objc_claimAutoreleasedReturnValue();
      if (operationType == (NSString *)v19)
      {

LABEL_24:
        v12 = 1;
        goto LABEL_21;
      }
      v8 = (void *)v19;
      v20 = self->_operationType;
      if (v20)
      {
        -[C2MetricOperationOptions operationType](v5, "operationType");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[NSString isEqual:](v20, "isEqual:", v21);

        if ((v22 & 1) != 0)
          goto LABEL_24;
LABEL_20:
        v12 = 0;
LABEL_21:

        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    v12 = 0;
  }
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = -[C2MetricOperationGroupOptions hash](self->_operationGroup, "hash");
  v4 = -[NSString hash](self->_operationId, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_operationType, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  C2MetricOperationGroupOptions *operationGroup;
  id v5;

  operationGroup = self->_operationGroup;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", operationGroup, CFSTR("operationGroup"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_operationId, CFSTR("operationId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_operationType, CFSTR("operationType"));

}

- (C2MetricOperationOptions)initWithCoder:(id)a3
{
  id v4;
  C2MetricOperationOptions *v5;
  uint64_t v6;
  C2MetricOperationGroupOptions *operationGroup;
  uint64_t v8;
  NSString *operationId;
  uint64_t v10;
  NSString *operationType;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)C2MetricOperationOptions;
  v5 = -[C2MetricOperationOptions init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("operationGroup"));
    v6 = objc_claimAutoreleasedReturnValue();
    operationGroup = v5->_operationGroup;
    v5->_operationGroup = (C2MetricOperationGroupOptions *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("operationId"));
    v8 = objc_claimAutoreleasedReturnValue();
    operationId = v5->_operationId;
    v5->_operationId = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("operationType"));
    v10 = objc_claimAutoreleasedReturnValue();
    operationType = v5->_operationType;
    v5->_operationType = (NSString *)v10;

  }
  return v5;
}

@end
