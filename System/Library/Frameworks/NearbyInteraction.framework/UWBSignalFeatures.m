@implementation UWBSignalFeatures

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UWBSignalFeatures)initWithUWBSignalFeatures:(id)a3
{
  id v4;
  UWBSignalFeatures *v5;
  BiasEstimatorFeatures *v6;
  void *v7;
  uint64_t v8;
  BiasEstimatorFeatures *inputFeatures;
  BiasEstimatorOutputs *v10;
  void *v11;
  uint64_t v12;
  BiasEstimatorOutputs *outputs;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UWBSignalFeatures;
  v5 = -[UWBSignalFeatures init](&v15, sel_init);
  if (v5)
  {
    v6 = [BiasEstimatorFeatures alloc];
    objc_msgSend(v4, "inputFeatures");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[BiasEstimatorFeatures initWithBiasEstimatorFeatures:](v6, "initWithBiasEstimatorFeatures:", v7);
    inputFeatures = v5->_inputFeatures;
    v5->_inputFeatures = (BiasEstimatorFeatures *)v8;

    v10 = [BiasEstimatorOutputs alloc];
    objc_msgSend(v4, "outputs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[BiasEstimatorOutputs initWithBiasEstimatorOutputs:](v10, "initWithBiasEstimatorOutputs:", v11);
    outputs = v5->_outputs;
    v5->_outputs = (BiasEstimatorOutputs *)v12;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithUWBSignalFeatures:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_inputFeatures, CFSTR("inputFeatures"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_outputs, CFSTR("outputProbabilities"));

}

- (UWBSignalFeatures)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UWBSignalFeatures *v7;
  UWBSignalFeatures *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputFeatures"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outputProbabilities"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)UWBSignalFeatures;
  v7 = -[UWBSignalFeatures init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[UWBSignalFeatures setInputFeatures:](v7, "setInputFeatures:", v5);
    -[UWBSignalFeatures setOutputs:](v8, "setOutputs:", v6);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BiasEstimatorFeatures *inputFeatures;
  void *v8;
  BiasEstimatorFeatures *v9;
  BOOL v10;
  BiasEstimatorOutputs *outputs;
  void *v12;
  BiasEstimatorOutputs *v13;
  BOOL v14;
  BOOL v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = 0;
    goto LABEL_12;
  }
  v5 = v4;
  v6 = v5;
  inputFeatures = self->_inputFeatures;
  if (inputFeatures)
    goto LABEL_5;
  objc_msgSend(v5, "inputFeatures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    inputFeatures = self->_inputFeatures;
LABEL_5:
    objc_msgSend(v6, "inputFeatures");
    v9 = (BiasEstimatorFeatures *)objc_claimAutoreleasedReturnValue();
    v10 = inputFeatures == v9;

    goto LABEL_6;
  }
  v10 = 1;
LABEL_6:
  outputs = self->_outputs;
  if (!outputs)
  {
    objc_msgSend(v6, "outputs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v14 = 1;
      goto LABEL_10;
    }
    outputs = self->_outputs;
  }
  objc_msgSend(v6, "outputs");
  v13 = (BiasEstimatorOutputs *)objc_claimAutoreleasedReturnValue();
  v14 = outputs == v13;

LABEL_10:
  v15 = v10 && v14;

LABEL_12:
  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[BiasEstimatorFeatures description](self->_inputFeatures, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BiasEstimatorOutputs description](self->_outputs, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[BiasEstimatorFeatures hash](self->_inputFeatures, "hash");
  return -[BiasEstimatorOutputs hash](self->_outputs, "hash") ^ v3;
}

- (id)orderedBiasEstimatorFeatutes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[BiasEstimatorFeatures populateOrderedInputFeature](self->_inputFeatures, "populateOrderedInputFeature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BiasEstimatorOutputs populateOrderedBiasEstimatorOutputs](self->_outputs, "populateOrderedBiasEstimatorOutputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BiasEstimatorFeatures)inputFeatures
{
  return self->_inputFeatures;
}

- (void)setInputFeatures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BiasEstimatorOutputs)outputs
{
  return self->_outputs;
}

- (void)setOutputs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputFeatures, 0);
}

@end
