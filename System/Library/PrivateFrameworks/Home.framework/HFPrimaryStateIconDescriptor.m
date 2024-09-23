@implementation HFPrimaryStateIconDescriptor

- (HFPrimaryStateIconDescriptor)initWithIdentifier:(id)a3 primaryState:(int64_t)a4
{
  id v7;
  HFPrimaryStateIconDescriptor *v8;
  HFPrimaryStateIconDescriptor *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[11];

  v13[10] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFPrimaryStateIconDescriptor;
  v8 = -[HFPrimaryStateIconDescriptor init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_primaryState = a4;
    v13[0] = CFSTR("HFImageIconIdentifierAppleTVRegular");
    v13[1] = CFSTR("HFImageIconIdentifierAppleTVSmall");
    v13[2] = CFSTR("HFImageIconIdentifierServiceCarbonDioxideSensorOn");
    v13[3] = CFSTR("HFImageIconIdentifierServiceCarbonDioxideSensorOff");
    v13[4] = CFSTR("HFImageIconIdentifierServiceCarbonMonoxideSensorOn");
    v13[5] = CFSTR("HFImageIconIdentifierServiceCarbonMonoxideSensorOff");
    v13[6] = CFSTR("HFCAPackageIconIdentifierAirport");
    v13[7] = CFSTR("HFImageIconIdentifierGeneric");
    v13[8] = CFSTR("HFCAPackageIconIdentifierCarbonMonoxideSensor");
    v13[9] = CFSTR("HFCAPackageIconIdentifierCarbonDioxideSensor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 10);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_shouldForceLTR = objc_msgSend(v10, "containsObject:", v7);

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFPrimaryStateIconDescriptor identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    v9 = objc_msgSend(v5, "primaryState");
    if (v9 == -[HFPrimaryStateIconDescriptor primaryState](self, "primaryState"))
      v10 = v8;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[HFPrimaryStateIconDescriptor identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[HFPrimaryStateIconDescriptor primaryState](self, "primaryState") ^ v4;

  return v5;
}

- (id)iconDescriptorByMergingWithIconDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  id v11;
  void *v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v4, "identifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        -[HFPrimaryStateIconDescriptor identifier](self, "identifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEqualToString:", v6),
        v6,
        v5,
        v7))
  {
    v8 = -[HFPrimaryStateIconDescriptor primaryState](self, "primaryState");
    if (v8 == objc_msgSend(v4, "primaryState"))
      v9 = -[HFPrimaryStateIconDescriptor primaryState](self, "primaryState");
    else
      v9 = 2;
    v11 = objc_alloc((Class)objc_opt_class());
    -[HFPrimaryStateIconDescriptor identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "initWithIdentifier:primaryState:", v12, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HFPrimaryStateIconDescriptor primaryState](self, "primaryState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "primaryState"));
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

- (int64_t)primaryState
{
  return self->_primaryState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
