@implementation STScreenTimeConfiguration

- (STScreenTimeConfiguration)initWithEnforcesChildRestrictions:(BOOL)a3
{
  _BOOL8 v3;
  STScreenTimeConfiguration *v4;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)STScreenTimeConfiguration;
  v4 = -[STScreenTimeConfiguration init](&v6, sel_init);
  -[STScreenTimeConfiguration _stScreenTimeConfigurationCommonInitWithEnforcesChildRestrictions:](v4, "_stScreenTimeConfigurationCommonInitWithEnforcesChildRestrictions:", v3);
  return v4;
}

- (void)_stScreenTimeConfigurationCommonInitWithEnforcesChildRestrictions:(BOOL)a3
{
  self->_enforcesChildRestrictions = a3;
}

- (STScreenTimeConfiguration)initWithCoder:(id)a3
{
  id v4;
  STScreenTimeConfiguration *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("EnforcesChildRestrictions")))
  {
    v15.receiver = self;
    v15.super_class = (Class)STScreenTimeConfiguration;
    v5 = -[STScreenTimeConfiguration init](&v15, sel_init);
    -[STScreenTimeConfiguration _stScreenTimeConfigurationCommonInitWithEnforcesChildRestrictions:](v5, "_stScreenTimeConfigurationCommonInitWithEnforcesChildRestrictions:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EnforcesChildRestrictions")));
  }
  else
  {

    v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v6)
      -[STScreenTimeConfiguration initWithCoder:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    v5 = 0;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_enforcesChildRestrictions, CFSTR("EnforcesChildRestrictions"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)STScreenTimeConfiguration;
  -[STScreenTimeConfiguration description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ enforcesChildRestrictions: %d"), v4, -[STScreenTimeConfiguration enforcesChildRestrictions](self, "enforcesChildRestrictions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)enforcesChildRestrictions
{
  return self->_enforcesChildRestrictions;
}

- (void)setEnforcesChildRestrictions:(BOOL)a3
{
  self->_enforcesChildRestrictions = a3;
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_218A7F000, MEMORY[0x24BDACB70], a3, "Failed to decode STScreenTimeConfiguration with hasEnforcesChildRestrictions: %{public}d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

@end
