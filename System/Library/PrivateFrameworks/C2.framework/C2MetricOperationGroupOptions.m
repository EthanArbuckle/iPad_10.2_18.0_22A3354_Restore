@implementation C2MetricOperationGroupOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationGroupName, 0);
  objc_storeStrong((id *)&self->_operationGroupId, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  C2MetricOperationGroupOptions *v4;
  void *v5;
  void *v6;

  v4 = +[C2MetricOperationGroupOptions allocWithZone:](C2MetricOperationGroupOptions, "allocWithZone:", a3);
  if (v4)
  {
    -[C2MetricOperationGroupOptions operationGroupId](self, "operationGroupId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2MetricOperationGroupOptions setOperationGroupId:](v4, "setOperationGroupId:", v5);

    -[C2MetricOperationGroupOptions operationGroupName](self, "operationGroupName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[C2MetricOperationGroupOptions setOperationGroupName:](v4, "setOperationGroupName:", v6);

  }
  return v4;
}

- (NSString)operationGroupName
{
  return self->_operationGroupName;
}

- (void)setOperationGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setOperationGroupId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)operationGroupId
{
  return self->_operationGroupId;
}

- (BOOL)isEqual:(id)a3
{
  C2MetricOperationGroupOptions *v4;
  C2MetricOperationGroupOptions *v5;
  NSString *operationGroupId;
  uint64_t v7;
  void *v8;
  NSString *v9;
  void *v10;
  int v11;
  BOOL v12;
  NSString *operationGroupName;
  uint64_t v14;
  NSString *v15;
  void *v16;
  char v17;

  v4 = (C2MetricOperationGroupOptions *)a3;
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
      operationGroupId = self->_operationGroupId;
      -[C2MetricOperationGroupOptions operationGroupId](v5, "operationGroupId");
      v7 = objc_claimAutoreleasedReturnValue();
      if (operationGroupId == (NSString *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        v9 = self->_operationGroupId;
        if (!v9)
          goto LABEL_14;
        -[C2MetricOperationGroupOptions operationGroupId](v5, "operationGroupId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[NSString isEqual:](v9, "isEqual:", v10);

        if (!v11)
          goto LABEL_15;
      }
      operationGroupName = self->_operationGroupName;
      -[C2MetricOperationGroupOptions operationGroupName](v5, "operationGroupName");
      v14 = objc_claimAutoreleasedReturnValue();
      if (operationGroupName == (NSString *)v14)
      {

LABEL_17:
        v12 = 1;
        goto LABEL_18;
      }
      v8 = (void *)v14;
      v15 = self->_operationGroupName;
      if (v15)
      {
        -[C2MetricOperationGroupOptions operationGroupName](v5, "operationGroupName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[NSString isEqual:](v15, "isEqual:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_17;
LABEL_15:
        v12 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_14:

      goto LABEL_15;
    }
    v12 = 0;
  }
LABEL_19:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_operationGroupId, "hash");
  return -[NSString hash](self->_operationGroupName, "hash") ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *operationGroupId;
  id v5;

  operationGroupId = self->_operationGroupId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", operationGroupId, CFSTR("id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_operationGroupName, CFSTR("name"));

}

- (C2MetricOperationGroupOptions)initWithCoder:(id)a3
{
  id v4;
  C2MetricOperationGroupOptions *v5;
  uint64_t v6;
  NSString *operationGroupId;
  uint64_t v8;
  NSString *operationGroupName;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)C2MetricOperationGroupOptions;
  v5 = -[C2MetricOperationGroupOptions init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v6 = objc_claimAutoreleasedReturnValue();
    operationGroupId = v5->_operationGroupId;
    v5->_operationGroupId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    operationGroupName = v5->_operationGroupName;
    v5->_operationGroupName = (NSString *)v8;

  }
  return v5;
}

@end
