@implementation _CESRModelPropertiesMutation

- (_CESRModelPropertiesMutation)init
{
  return -[_CESRModelPropertiesMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_CESRModelPropertiesMutation)initWithBaseModel:(id)a3
{
  id v5;
  _CESRModelPropertiesMutation *v6;
  _CESRModelPropertiesMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CESRModelPropertiesMutation;
  v6 = -[_CESRModelPropertiesMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setModelVersion:(id)a3
{
  objc_storeStrong((id *)&self->_modelVersion, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setModelType:(id)a3
{
  objc_storeStrong((id *)&self->_modelType, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void)setModelRoot:(id)a3
{
  objc_storeStrong((id *)&self->_modelRoot, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)generate
{
  CESRModelProperties *baseModel;
  CESRModelProperties *v4;
  CESRModelProperties *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = -[CESRModelProperties initWithModelVersion:modelType:modelRoot:]([CESRModelProperties alloc], "initWithModelVersion:modelType:modelRoot:", self->_modelVersion, self->_modelType, self->_modelRoot);
    goto LABEL_5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) == 0)
  {
    v4 = (CESRModelProperties *)-[CESRModelProperties copy](baseModel, "copy");
LABEL_5:
    v5 = v4;
    return v5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v6 = self->_modelVersion;
  }
  else
  {
    -[CESRModelProperties modelVersion](baseModel, "modelVersion");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v8 = self->_modelType;
  }
  else
  {
    -[CESRModelProperties modelType](self->_baseModel, "modelType");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v10 = self->_modelRoot;
  }
  else
  {
    -[CESRModelProperties modelRoot](self->_baseModel, "modelRoot");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  v5 = -[CESRModelProperties initWithModelVersion:modelType:modelRoot:]([CESRModelProperties alloc], "initWithModelVersion:modelType:modelRoot:", v7, v9, v10);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelRoot, 0);
  objc_storeStrong((id *)&self->_modelType, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
