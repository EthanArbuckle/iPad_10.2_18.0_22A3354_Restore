@implementation BMContextualActionParameter

- (BMContextualActionParameter)initWithType:(id)a3 metadata:(id)a4
{
  id v7;
  id v8;
  BMContextualActionParameter *v9;
  BMContextualActionParameter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMContextualActionParameter;
  v9 = -[BMContextualActionParameter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parameterType, a3);
    objc_storeStrong((id *)&v10->_parameterMetadata, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *parameterType;
  id v5;

  parameterType = self->_parameterType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", parameterType, CFSTR("parameterType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parameterMetadata, CFSTR("parameterMetadata"));

}

- (BMContextualActionParameter)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BMContextualActionParameter *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("parameterMetadata"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[BMContextualActionParameter initWithType:metadata:](self, "initWithType:metadata:", v5, v13);
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[BMContextualActionParameter parameterType](self, "parameterType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || (objc_msgSend(v6, "parameterType"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[BMContextualActionParameter parameterType](self, "parameterType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "parameterType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if (v7)
      {
LABEL_9:

        -[BMContextualActionParameter parameterMetadata](self, "parameterMetadata");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 || (objc_msgSend(v6, "parameterMetadata"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[BMContextualActionParameter parameterMetadata](self, "parameterMetadata");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "parameterMetadata");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqualToDictionary:", v14);

          if (v12)
          {
LABEL_15:

            v11 = v10 & v15;
            goto LABEL_16;
          }
        }
        else
        {
          v15 = 1;
        }

        goto LABEL_15;
      }
    }
    else
    {
      v10 = 1;
    }

    goto LABEL_9;
  }
  v11 = 0;
LABEL_16:

  return v11;
}

- (NSString)parameterType
{
  return self->_parameterType;
}

- (NSDictionary)parameterMetadata
{
  return self->_parameterMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterMetadata, 0);
  objc_storeStrong((id *)&self->_parameterType, 0);
}

@end
