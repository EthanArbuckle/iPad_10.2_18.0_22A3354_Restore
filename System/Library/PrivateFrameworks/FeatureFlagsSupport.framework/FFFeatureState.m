@implementation FFFeatureState

- (FFFeatureState)initWithDomain:(id)a3 feature:(id)a4 value:(int64_t)a5
{
  id v8;
  id v9;
  FFFeatureState *v10;

  v8 = a4;
  v9 = a3;
  v10 = -[FFFeatureState initWithDomain:feature:value:phase:disclosureRequired:attributes:buildVersion:]([FFFeatureState alloc], "initWithDomain:feature:value:phase:disclosureRequired:attributes:buildVersion:", v9, v8, a5, 0, 0, 0, 0);

  return v10;
}

- (FFFeatureState)initWithDomain:(id)a3 feature:(id)a4 value:(int64_t)a5 buildVersion:(id)a6
{
  id v10;
  id v11;
  id v12;
  FFFeatureState *v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = -[FFFeatureState initWithDomain:feature:value:phase:disclosureRequired:attributes:buildVersion:]([FFFeatureState alloc], "initWithDomain:feature:value:phase:disclosureRequired:attributes:buildVersion:", v12, v11, a5, 0, 0, 0, v10);

  return v13;
}

- (FFFeatureState)initWithDomain:(id)a3 feature:(id)a4 value:(int64_t)a5 phase:(id)a6 disclosureRequired:(id)a7 attributes:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  FFFeatureState *v19;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a4;
  v18 = a3;
  v19 = -[FFFeatureState initWithDomain:feature:value:phase:disclosureRequired:attributes:buildVersion:]([FFFeatureState alloc], "initWithDomain:feature:value:phase:disclosureRequired:attributes:buildVersion:", v18, v17, a5, v16, v15, v14, 0);

  return v19;
}

- (FFFeatureState)initWithDomain:(id)a3 feature:(id)a4 value:(int64_t)a5 phase:(id)a6 disclosureRequired:(id)a7 attributes:(id)a8 buildVersion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  FFFeatureState *v21;
  FFFeatureState *v22;
  objc_super v24;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v24.receiver = self;
  v24.super_class = (Class)FFFeatureState;
  v21 = -[FFFeatureState init](&v24, sel_init);
  v22 = v21;
  if (v21)
  {
    -[FFFeatureState setAttributes:](v21, "setAttributes:", v19);
    -[FFFeatureState setDomain:](v22, "setDomain:", v15);
    -[FFFeatureState setFeature:](v22, "setFeature:", v16);
    -[FFFeatureState setValue:](v22, "setValue:", a5);
    -[FFFeatureState setPhase:](v22, "setPhase:", v17);
    -[FFFeatureState setDisclosurerequired:](v22, "setDisclosurerequired:", v18);
    -[FFFeatureState setBuildVersion:](v22, "setBuildVersion:", v20);
  }

  return v22;
}

- (id)description
{
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[FFFeatureState value](self, "value");
  if (v3 >= 3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid (%d)"), -[FFFeatureState value](self, "value"));
  else
    v4 = *(&off_1E987FC20 + v3);
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[FFFeatureState domain](self, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FFFeatureState feature](self, "feature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("Feature %@/%@ state %@"), v6, v7, v4);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FFFeatureState *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  FFFeatureState *v11;

  v4 = [FFFeatureState alloc];
  -[FFFeatureState domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FFFeatureState feature](self, "feature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FFFeatureState value](self, "value");
  -[FFFeatureState phase](self, "phase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FFFeatureState disclosurerequired](self, "disclosurerequired");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FFFeatureState attributes](self, "attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FFFeatureState initWithDomain:feature:value:phase:disclosureRequired:attributes:](v4, "initWithDomain:feature:value:phase:disclosureRequired:attributes:", v5, v6, v7, v8, v9, v10);

  return v11;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (NSString)feature
{
  return self->_feature;
}

- (void)setFeature:(id)a3
{
  objc_storeStrong((id *)&self->_feature, a3);
}

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
}

- (NSString)phase
{
  return self->_phase;
}

- (void)setPhase:(id)a3
{
  objc_storeStrong((id *)&self->_phase, a3);
}

- (NSString)disclosurerequired
{
  return self->_disclosurerequired;
}

- (void)setDisclosurerequired:(id)a3
{
  objc_storeStrong((id *)&self->_disclosurerequired, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclosurerequired, 0);
  objc_storeStrong((id *)&self->_phase, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
