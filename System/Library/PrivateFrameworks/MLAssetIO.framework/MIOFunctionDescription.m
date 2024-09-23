@implementation MIOFunctionDescription

- (MIOFunctionDescription)initWithSpecification:(const void *)a3 classLabels:(id)a4
{
  id v6;
  MIOFunctionDescription *v7;
  MIOFunctionDescription *v8;
  uint64_t v9;
  NSArray *classLabels;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MIOFunctionDescription;
  v7 = -[MIOFunctionDescription init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    CoreML::Specification::FunctionDescription::CopyFrom((CoreML::Specification::FunctionDescription *)&v7->_functionDescriptionParams, (const CoreML::Specification::FunctionDescription *)a3);
    v9 = objc_msgSend(v6, "copy");
    classLabels = v8->_classLabels;
    v8->_classLabels = (NSArray *)v9;

  }
  return v8;
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
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("MIOFunctionDescription (%p)\n"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOFunctionDescription inputDescriptions](self, "inputDescriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n    "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  inputDescriptions:\n    %@\n"), v5);

  -[MIOFunctionDescription outputDescriptions](self, "outputDescriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n    "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  outputDescriptions:\n    %@\n"), v7);

  -[MIOFunctionDescription predictedFeatureName](self, "predictedFeatureName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MIOFunctionDescription predictedFeatureName](self, "predictedFeatureName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("  predictedFeatureName: %@\n"), v9);

  }
  -[MIOFunctionDescription predictedProbabilitiesName](self, "predictedProbabilitiesName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MIOFunctionDescription predictedProbabilitiesName](self, "predictedProbabilitiesName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("  predictedProbabilitiesName: %@\n"), v11);

  }
  -[MIOFunctionDescription classLabels](self, "classLabels");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MIOFunctionDescription classLabels](self, "classLabels");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("  classLabels: %@\n"), v13);

  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  MIOFunctionDescription *v4;
  MIOFunctionDescription *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  objc_object *v15;
  objc_object *v16;
  char v17;
  objc_object *v18;
  objc_object *v19;
  char v20;

  v4 = (MIOFunctionDescription *)a3;
  if (self == v4)
  {
    v20 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIOFunctionDescription name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOFunctionDescription name](v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if ((v8 & 1) == 0)
        goto LABEL_10;
      -[MIOFunctionDescription inputDescriptions](self, "inputDescriptions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOFunctionDescription inputDescriptions](v5, "inputDescriptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if ((v11 & 1) == 0)
        goto LABEL_10;
      -[MIOFunctionDescription outputDescriptions](self, "outputDescriptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOFunctionDescription outputDescriptions](v5, "outputDescriptions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if ((v14 & 1) == 0)
        goto LABEL_10;
      -[MIOFunctionDescription predictedFeatureName](self, "predictedFeatureName");
      v15 = (objc_object *)objc_claimAutoreleasedReturnValue();
      -[MIOFunctionDescription predictedFeatureName](v5, "predictedFeatureName");
      v16 = (objc_object *)objc_claimAutoreleasedReturnValue();
      v17 = nullSafeEqual(v15, v16);

      if ((v17 & 1) != 0)
      {
        -[MIOFunctionDescription predictedProbabilitiesName](self, "predictedProbabilitiesName");
        v18 = (objc_object *)objc_claimAutoreleasedReturnValue();
        -[MIOFunctionDescription predictedProbabilitiesName](v5, "predictedProbabilitiesName");
        v19 = (objc_object *)objc_claimAutoreleasedReturnValue();
        v20 = nullSafeEqual(v18, v19);

      }
      else
      {
LABEL_10:
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }
  }

  return v20;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MIOFunctionDescription name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)name
{
  void **ptr;

  ptr = (void **)self->_functionDescriptionParams.name_.ptr_;
  if (*((char *)ptr + 23) < 0)
    ptr = (void **)*ptr;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ptr);
}

- (NSArray)inputDescriptions
{
  return (NSArray *)NSArrayFromFeatureDescriptionSpecifications((uint64_t)&self->_functionDescriptionParams.input_);
}

- (NSArray)outputDescriptions
{
  return (NSArray *)NSArrayFromFeatureDescriptionSpecifications((uint64_t)&self->_functionDescriptionParams.output_);
}

- (NSArray)stateDescriptions
{
  return (NSArray *)NSArrayFromFeatureDescriptionSpecifications((uint64_t)&self->_functionDescriptionParams.state_);
}

- (NSString)predictedFeatureName
{
  _QWORD *ptr;
  void *v3;

  ptr = self->_functionDescriptionParams.predictedfeaturename_.ptr_;
  if (*((char *)ptr + 23) < 0)
  {
    if (!ptr[1])
    {
LABEL_7:
      v3 = 0;
      return (NSString *)v3;
    }
    ptr = (_QWORD *)*ptr;
  }
  else if (!*((_BYTE *)ptr + 23))
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ptr);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSString *)v3;
}

- (NSString)predictedProbabilitiesName
{
  _QWORD *ptr;
  void *v3;

  ptr = self->_functionDescriptionParams.predictedprobabilitiesname_.ptr_;
  if (*((char *)ptr + 23) < 0)
  {
    if (!ptr[1])
    {
LABEL_7:
      v3 = 0;
      return (NSString *)v3;
    }
    ptr = (_QWORD *)*ptr;
  }
  else if (!*((_BYTE *)ptr + 23))
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ptr);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSString *)v3;
}

- (NSArray)classLabels
{
  return self->_classLabels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classLabels, 0);
  CoreML::Specification::FunctionDescription::~FunctionDescription((CoreML::Specification::FunctionDescription *)&self->_functionDescriptionParams);
}

- (id).cxx_construct
{
  CoreML::Specification::FunctionDescription::FunctionDescription((CoreML::Specification::FunctionDescription *)&self->_functionDescriptionParams);
  return self;
}

@end
