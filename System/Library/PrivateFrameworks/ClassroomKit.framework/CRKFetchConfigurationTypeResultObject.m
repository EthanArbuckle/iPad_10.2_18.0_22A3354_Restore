@implementation CRKFetchConfigurationTypeResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchConfigurationTypeResultObject)initWithCoder:(id)a3
{
  id v4;
  CRKFetchConfigurationTypeResultObject *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKFetchConfigurationTypeResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configurationType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_configurationType = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signedInToStudentMAID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_signedInToStudentMAID = objc_msgSend(v7, "BOOLValue");

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
  v7.super_class = (Class)CRKFetchConfigurationTypeResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKFetchConfigurationTypeResultObject configurationType](self, "configurationType", v7.receiver, v7.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("configurationType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKFetchConfigurationTypeResultObject isSignedInToStudentMAID](self, "isSignedInToStudentMAID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("signedInToStudentMAID"));

}

- (unint64_t)configurationType
{
  return self->_configurationType;
}

- (void)setConfigurationType:(unint64_t)a3
{
  self->_configurationType = a3;
}

- (BOOL)isSignedInToStudentMAID
{
  return self->_signedInToStudentMAID;
}

- (void)setSignedInToStudentMAID:(BOOL)a3
{
  self->_signedInToStudentMAID = a3;
}

@end
