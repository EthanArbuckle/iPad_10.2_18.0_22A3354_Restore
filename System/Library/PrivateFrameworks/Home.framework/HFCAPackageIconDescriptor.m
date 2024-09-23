@implementation HFCAPackageIconDescriptor

+ (BOOL)iconDescriptorShouldAlwaysAnimate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = a3;
  HFCAPackageIconIdentifierStatesWithContinuousAnimation();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "packageIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HFCAPackageIconDescriptor identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HFCAPackageIconDescriptor state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCAPackageIconDescriptor identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "isEqualToString:", v6);

    objc_msgSend(v5, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCAPackageIconDescriptor state](self, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v10) = 0;
    if (v7 && v8 == v9)
    {
      objc_msgSend(v5, "iconModifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __37__HFCAPackageIconDescriptor_isEqual___block_invoke;
      v14[3] = &unk_1EA7264A8;
      v14[4] = self;
      v15 = v5;
      LODWORD(v10) = objc_msgSend(v12, "na_any:", v14) ^ 1;

    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

- (NSString)packageIdentifier
{
  return self->_packageIdentifier;
}

- (NSString)state
{
  return self->_state;
}

uint64_t __37__HFCAPackageIconDescriptor_isEqual___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "iconModifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "iconModifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v6;
  v10 = v8;
  if (v9 == v10)
  {
    v11 = 0;
  }
  else if (v9)
  {
    v11 = objc_msgSend(v9, "isEqual:", v10) ^ 1;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (NSDictionary)iconModifiers
{
  return self->_iconModifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconModifiers, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_packageIdentifier, 0);
}

- (HFCAPackageIconDescriptor)initWithPackageIdentifier:(id)a3 state:(id)a4 modifiers:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFCAPackageIconDescriptor *v12;
  HFCAPackageIconDescriptor *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[11];

  v17[10] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HFCAPackageIconDescriptor;
  v12 = -[HFCAPackageIconDescriptor init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_packageIdentifier, a3);
    objc_storeStrong((id *)&v13->_state, a4);
    objc_storeStrong((id *)&v13->_iconModifiers, a5);
    v17[0] = CFSTR("HFImageIconIdentifierAppleTVRegular");
    v17[1] = CFSTR("HFImageIconIdentifierAppleTVSmall");
    v17[2] = CFSTR("HFImageIconIdentifierServiceCarbonDioxideSensorOn");
    v17[3] = CFSTR("HFImageIconIdentifierServiceCarbonDioxideSensorOff");
    v17[4] = CFSTR("HFImageIconIdentifierServiceCarbonMonoxideSensorOn");
    v17[5] = CFSTR("HFImageIconIdentifierServiceCarbonMonoxideSensorOff");
    v17[6] = CFSTR("HFCAPackageIconIdentifierAirport");
    v17[7] = CFSTR("HFImageIconIdentifierGeneric");
    v17[8] = CFSTR("HFCAPackageIconIdentifierCarbonMonoxideSensor");
    v17[9] = CFSTR("HFCAPackageIconIdentifierCarbonDioxideSensor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_shouldForceLTR = objc_msgSend(v14, "containsObject:", v9);

  }
  return v13;
}

- (HFCAPackageIconDescriptor)initWithPackageIdentifier:(id)a3 state:(id)a4
{
  return -[HFCAPackageIconDescriptor initWithPackageIdentifier:state:modifiers:](self, "initWithPackageIdentifier:state:modifiers:", a3, a4, 0);
}

- (HFCAPackageIconDescriptor)initWithPackageIdentifier:(id)a3
{
  return -[HFCAPackageIconDescriptor initWithPackageIdentifier:state:](self, "initWithPackageIdentifier:state:", a3, HFCAPackageStateDisplay);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCAPackageIconDescriptor packageIdentifier](self, "packageIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, \"%@\">"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)iconDescriptorByMergingWithIconDescriptor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, void *);
  void *v24;
  HFCAPackageIconDescriptor *v25;
  id v26;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7
    && (objc_msgSend(v7, "identifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        -[HFCAPackageIconDescriptor identifier](self, "identifier"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "isEqualToString:", v9),
        v9,
        v8,
        v10))
  {
    -[HFCAPackageIconDescriptor state](self, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "state");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == v12)
    {
      -[HFCAPackageIconDescriptor state](self, "state");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = HFCAPackageStateOn;
    }
    v15 = v13;

    objc_msgSend(v7, "iconModifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __71__HFCAPackageIconDescriptor_iconDescriptorByMergingWithIconDescriptor___block_invoke;
    v24 = &unk_1EA7264D0;
    v25 = self;
    v26 = v7;
    objc_msgSend(v16, "na_filter:", &v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc((Class)objc_opt_class());
    -[HFCAPackageIconDescriptor identifier](self, "identifier", v21, v22, v23, v24, v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v18, "initWithPackageIdentifier:state:modifiers:", v19, v15, v17);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __71__HFCAPackageIconDescriptor_iconDescriptorByMergingWithIconDescriptor___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "iconModifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "iconModifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v6;
  v10 = v8;
  if (v9 == v10)
  {
    v11 = 1;
  }
  else if (v9)
  {
    v11 = objc_msgSend(v9, "isEqual:", v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
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
    -[HFCAPackageIconDescriptor state](self, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "compare:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)shouldForceLTR
{
  return self->_shouldForceLTR;
}

@end
