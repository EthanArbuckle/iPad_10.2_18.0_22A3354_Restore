@implementation FMDRepairDeviceContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDRepairDeviceContext)initWithCoder:(id)a3
{
  id v4;
  FMDRepairDeviceContext *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *selectedDevices;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *searchIdentifiers;
  uint64_t v16;
  NSString *ephemeralToken;
  void *v18;
  objc_super v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FMDRepairDeviceContext;
  v5 = -[FMDRepairDeviceContext init](&v20, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("selectedDevices"));
    v9 = objc_claimAutoreleasedReturnValue();
    selectedDevices = v5->_selectedDevices;
    v5->_selectedDevices = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("searchIdentifiers"));
    v14 = objc_claimAutoreleasedReturnValue();
    searchIdentifiers = v5->_searchIdentifiers;
    v5->_searchIdentifiers = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ephemeralToken"));
    v16 = objc_claimAutoreleasedReturnValue();
    ephemeralToken = v5->_ephemeralToken;
    v5->_ephemeralToken = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("repairDeviceMode"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_repairDeviceMode = objc_msgSend(v18, "integerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *selectedDevices;
  id v5;
  id v6;

  selectedDevices = self->_selectedDevices;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", selectedDevices, CFSTR("selectedDevices"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_searchIdentifiers, CFSTR("searchIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ephemeralToken, CFSTR("ephemeralToken"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_repairDeviceMode);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("repairDeviceMode"));

}

- (NSArray)selectedDevices
{
  return self->_selectedDevices;
}

- (void)setSelectedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_selectedDevices, a3);
}

- (NSArray)searchIdentifiers
{
  return self->_searchIdentifiers;
}

- (void)setSearchIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_searchIdentifiers, a3);
}

- (NSString)ephemeralToken
{
  return self->_ephemeralToken;
}

- (void)setEphemeralToken:(id)a3
{
  objc_storeStrong((id *)&self->_ephemeralToken, a3);
}

- (int64_t)repairDeviceMode
{
  return self->_repairDeviceMode;
}

- (void)setRepairDeviceMode:(int64_t)a3
{
  self->_repairDeviceMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralToken, 0);
  objc_storeStrong((id *)&self->_searchIdentifiers, 0);
  objc_storeStrong((id *)&self->_selectedDevices, 0);
}

@end
