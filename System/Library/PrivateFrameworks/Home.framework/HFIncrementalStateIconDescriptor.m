@implementation HFIncrementalStateIconDescriptor

- (HFIncrementalStateIconDescriptor)initWithIdentifier:(id)a3 incrementalState:(id)a4
{
  id v7;
  id v8;
  HFIncrementalStateIconDescriptor *v9;
  HFIncrementalStateIconDescriptor *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HFIncrementalStateIconDescriptor;
  v9 = -[HFIncrementalStateIconDescriptor init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_incrementalState, a4);
    v14[0] = CFSTR("HFImageIconIdentifierAppleTVRegular");
    v14[1] = CFSTR("HFImageIconIdentifierAppleTVSmall");
    v14[2] = CFSTR("HFImageIconIdentifierServiceCarbonDioxideSensorOn");
    v14[3] = CFSTR("HFImageIconIdentifierServiceCarbonDioxideSensorOff");
    v14[4] = CFSTR("HFImageIconIdentifierServiceCarbonMonoxideSensorOn");
    v14[5] = CFSTR("HFImageIconIdentifierServiceCarbonMonoxideSensorOff");
    v14[6] = CFSTR("HFCAPackageIconIdentifierAirport");
    v14[7] = CFSTR("HFImageIconIdentifierGeneric");
    v14[8] = CFSTR("HFCAPackageIconIdentifierCarbonMonoxideSensor");
    v14[9] = CFSTR("HFCAPackageIconIdentifierCarbonDioxideSensor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_shouldForceLTR = objc_msgSend(v11, "containsObject:", v7);

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFIncrementalStateIconDescriptor identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    objc_msgSend(v5, "incrementalState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFIncrementalStateIconDescriptor incrementalState](self, "incrementalState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 != v10)
    {
      -[HFIncrementalStateIconDescriptor incrementalState](self, "incrementalState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v5, "incrementalState");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFIncrementalStateIconDescriptor incrementalState](self, "incrementalState");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v8 &= objc_msgSend(v12, "isEqualToNumber:", v13);

      }
      else
      {
        LOBYTE(v8) = 0;
      }

    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HFIncrementalStateIconDescriptor identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HFIncrementalStateIconDescriptor incrementalState](self, "incrementalState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)iconDescriptorByMergingWithIconDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  HFIncrementalStateIconDescriptor *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HFIncrementalStateIconDescriptor *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v4, "identifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        -[HFIncrementalStateIconDescriptor identifier](self, "identifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEqualToString:", v6),
        v6,
        v5,
        v7))
  {
    v8 = (HFIncrementalStateIconDescriptor *)v4;
    -[HFIncrementalStateIconDescriptor incrementalState](self, "incrementalState");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = &unk_1EA7CD7B0;
    -[HFIncrementalStateIconDescriptor incrementalState](v8, "incrementalState");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (void *)v12;
    else
      v14 = &unk_1EA7CD7B0;
    if (objc_msgSend(v11, "compare:", v14) == 1)
      v15 = self;
    else
      v15 = v8;
    -[HFIncrementalStateIconDescriptor incrementalState](v15, "incrementalState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "isEqual:", &unk_1EA7CD7B0))
    {

      v16 = 0;
    }
    v17 = objc_alloc((Class)objc_opt_class());
    -[HFIncrementalStateIconDescriptor identifier](self, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithIdentifier:incrementalState:", v18, v16);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (int64_t)compare:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[HFIncrementalStateIconDescriptor incrementalState](self, "incrementalState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "incrementalState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "compare:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)shouldForceLTR
{
  return self->_shouldForceLTR;
}

- (NSNumber)incrementalState
{
  return self->_incrementalState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incrementalState, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
