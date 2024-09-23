@implementation CESRModelProperties

- (CESRModelProperties)initWithModelVersion:(id)a3 modelType:(id)a4 modelRoot:(id)a5
{
  id v8;
  id v9;
  id v10;
  CESRModelProperties *v11;
  uint64_t v12;
  NSString *modelVersion;
  uint64_t v14;
  NSString *modelType;
  uint64_t v16;
  NSString *modelRoot;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CESRModelProperties;
  v11 = -[CESRModelProperties init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    modelVersion = v11->_modelVersion;
    v11->_modelVersion = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    modelType = v11->_modelType;
    v11->_modelType = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    modelRoot = v11->_modelRoot;
    v11->_modelRoot = (NSString *)v16;

  }
  return v11;
}

- (id)description
{
  return -[CESRModelProperties _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v19.receiver = self;
  v19.super_class = (Class)CESRModelProperties;
  -[CESRModelProperties description](&v19, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSString description](self->_modelVersion, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("modelVersion = %@"), v7);
  v20[0] = v8;
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSString description](self->_modelType, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("modelType = %@"), v10);
  v20[1] = v11;
  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSString description](self->_modelRoot, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("modelRoot = %@"), v13);
  v20[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {%@}"), v5, v16);

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_modelVersion, "hash");
  v4 = -[NSString hash](self->_modelType, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_modelRoot, "hash");
}

- (BOOL)isEqual:(id)a3
{
  CESRModelProperties *v4;
  CESRModelProperties *v5;
  NSString *v6;
  NSString *modelVersion;
  NSString *v8;
  NSString *modelType;
  NSString *v10;
  NSString *modelRoot;
  BOOL v12;

  v4 = (CESRModelProperties *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[CESRModelProperties modelVersion](v5, "modelVersion");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      modelVersion = self->_modelVersion;
      if (modelVersion == v6 || -[NSString isEqual:](modelVersion, "isEqual:", v6))
      {
        -[CESRModelProperties modelType](v5, "modelType");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        modelType = self->_modelType;
        if (modelType == v8 || -[NSString isEqual:](modelType, "isEqual:", v8))
        {
          -[CESRModelProperties modelRoot](v5, "modelRoot");
          v10 = (NSString *)objc_claimAutoreleasedReturnValue();
          modelRoot = self->_modelRoot;
          v12 = modelRoot == v10 || -[NSString isEqual:](modelRoot, "isEqual:", v10);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (CESRModelProperties)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CESRModelProperties *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRModelProperties::modelVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRModelProperties::modelType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRModelProperties::modelRoot"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CESRModelProperties initWithModelVersion:modelType:modelRoot:](self, "initWithModelVersion:modelType:modelRoot:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *modelVersion;
  id v5;

  modelVersion = self->_modelVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", modelVersion, CFSTR("CESRModelProperties::modelVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelType, CFSTR("CESRModelProperties::modelType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelRoot, CFSTR("CESRModelProperties::modelRoot"));

}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (NSString)modelType
{
  return self->_modelType;
}

- (NSString)modelRoot
{
  return self->_modelRoot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelRoot, 0);
  objc_storeStrong((id *)&self->_modelType, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _CESRModelPropertiesMutation *);
  _CESRModelPropertiesMutation *v5;
  void *v6;

  v4 = (void (**)(id, _CESRModelPropertiesMutation *))a3;
  if (v4)
  {
    v5 = -[_CESRModelPropertiesMutation initWithBaseModel:]([_CESRModelPropertiesMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_CESRModelPropertiesMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[CESRModelProperties copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _CESRModelPropertiesMutation *);
  _CESRModelPropertiesMutation *v4;
  void *v5;

  v3 = (void (**)(id, _CESRModelPropertiesMutation *))a3;
  v4 = objc_alloc_init(_CESRModelPropertiesMutation);
  if (v3)
    v3[2](v3, v4);
  -[_CESRModelPropertiesMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
