@implementation MLNeuralNetworksCompileTimeParams

- (MLNeuralNetworksCompileTimeParams)initWithLossType:(int64_t)a3 optimizerType:(int64_t)a4 optimizerParameters:(id)a5 lossParameters:(id)a6 trainableLayerNames:(id)a7 updateParameters:(id)a8
{
  id v15;
  id v16;
  id v17;
  MLNeuralNetworksCompileTimeParams *v18;
  MLNeuralNetworksCompileTimeParams *v19;
  id v21;
  objc_super v22;

  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)MLNeuralNetworksCompileTimeParams;
  v18 = -[MLNeuralNetworksCompileTimeParams init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_lossType = a3;
    v18->_optimizerType = a4;
    objc_storeStrong((id *)&v18->_optimizerParameters, a5);
    objc_storeStrong((id *)&v19->_lossParameters, a6);
    objc_storeStrong((id *)&v19->_trainableLayerNames, a7);
    objc_storeStrong((id *)&v19->_updateParameters, a8);
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", -[MLNeuralNetworksCompileTimeParams lossType](self, "lossType"), CFSTR("lossType"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[MLNeuralNetworksCompileTimeParams optimizerType](self, "optimizerType"), CFSTR("optimizerType"));
  -[MLNeuralNetworksCompileTimeParams optimizerParameters](self, "optimizerParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("optimizerParameters"));

  -[MLNeuralNetworksCompileTimeParams lossParameters](self, "lossParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("lossParameters"));

  -[MLNeuralNetworksCompileTimeParams trainableLayerNames](self, "trainableLayerNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("trainableLayerNames"));

  -[MLNeuralNetworksCompileTimeParams updateParameters](self, "updateParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("updateParameters"));

}

- (MLNeuralNetworksCompileTimeParams)initWithCoder:(id)a3
{
  id v4;
  MLNeuralNetworksCompileTimeParams *v5;
  uint64_t v6;
  NSDictionary *optimizerParameters;
  uint64_t v8;
  NSDictionary *lossParameters;
  uint64_t v10;
  NSArray *trainableLayerNames;
  uint64_t v12;
  NSDictionary *updateParameters;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MLNeuralNetworksCompileTimeParams;
  v5 = -[MLNeuralNetworksCompileTimeParams init](&v15, sel_init);
  if (v5)
  {
    v5->_lossType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lossType"));
    v5->_optimizerType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("optimizerType"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("optimizerParameters"));
    v6 = objc_claimAutoreleasedReturnValue();
    optimizerParameters = v5->_optimizerParameters;
    v5->_optimizerParameters = (NSDictionary *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("lossParameters"));
    v8 = objc_claimAutoreleasedReturnValue();
    lossParameters = v5->_lossParameters;
    v5->_lossParameters = (NSDictionary *)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("trainableLayerNames"));
    v10 = objc_claimAutoreleasedReturnValue();
    trainableLayerNames = v5->_trainableLayerNames;
    v5->_trainableLayerNames = (NSArray *)v10;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("updateParameters"));
    v12 = objc_claimAutoreleasedReturnValue();
    updateParameters = v5->_updateParameters;
    v5->_updateParameters = (NSDictionary *)v12;

  }
  return v5;
}

- (BOOL)writeUpdatableParamsToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "writeToURL:options:error:", v6, 1, a4);
  }
  else if (a4)
  {
    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Error in archiving updatable params."));
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)unarchiveUpdatableParamsAtURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v5, 2, a4);
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v11[0] = objc_opt_class();
    v11[1] = objc_opt_class();
    v11[2] = objc_opt_class();
    v11[3] = objc_opt_class();
    v11[4] = objc_opt_class();
    v11[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v8);

    objc_msgSend(MEMORY[0x1E0CB3710], "setClass:forClassName:", objc_opt_class(), CFSTR("MLNeuralNetworksCompileTimeParams"));
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v7, v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Error in unarchiving updatable params."));
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)lossType
{
  return self->_lossType;
}

- (void)setLossType:(int64_t)a3
{
  self->_lossType = a3;
}

- (int64_t)optimizerType
{
  return self->_optimizerType;
}

- (void)setOptimizerType:(int64_t)a3
{
  self->_optimizerType = a3;
}

- (NSDictionary)optimizerParameters
{
  return self->_optimizerParameters;
}

- (void)setOptimizerParameters:(id)a3
{
  objc_storeStrong((id *)&self->_optimizerParameters, a3);
}

- (NSDictionary)lossParameters
{
  return self->_lossParameters;
}

- (void)setLossParameters:(id)a3
{
  objc_storeStrong((id *)&self->_lossParameters, a3);
}

- (NSArray)trainableLayerNames
{
  return self->_trainableLayerNames;
}

- (void)setTrainableLayerNames:(id)a3
{
  objc_storeStrong((id *)&self->_trainableLayerNames, a3);
}

- (NSDictionary)updateParameters
{
  return self->_updateParameters;
}

- (void)setUpdateParameters:(id)a3
{
  objc_storeStrong((id *)&self->_updateParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateParameters, 0);
  objc_storeStrong((id *)&self->_trainableLayerNames, 0);
  objc_storeStrong((id *)&self->_lossParameters, 0);
  objc_storeStrong((id *)&self->_optimizerParameters, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
