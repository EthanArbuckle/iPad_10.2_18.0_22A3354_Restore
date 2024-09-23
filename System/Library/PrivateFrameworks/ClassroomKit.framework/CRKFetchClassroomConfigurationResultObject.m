@implementation CRKFetchClassroomConfigurationResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchClassroomConfigurationResultObject)initWithCoder:(id)a3
{
  id v4;
  CRKFetchClassroomConfigurationResultObject *v5;
  uint64_t v6;
  NSDictionary *configuration;
  uint64_t v8;
  NSDictionary *configurationsByType;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKFetchClassroomConfigurationResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("configuration"));
    v6 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v6;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("configurationsByType"));
    v8 = objc_claimAutoreleasedReturnValue();
    configurationsByType = v5->_configurationsByType;
    v5->_configurationsByType = (NSDictionary *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRKFetchClassroomConfigurationResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CRKFetchClassroomConfigurationResultObject configuration](self, "configuration", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("configuration"));

  -[CRKFetchClassroomConfigurationResultObject configurationsByType](self, "configurationsByType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("configurationsByType"));

}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)configurationsByType
{
  return self->_configurationsByType;
}

- (void)setConfigurationsByType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationsByType, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
