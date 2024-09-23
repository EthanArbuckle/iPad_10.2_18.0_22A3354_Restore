@implementation AEAssessmentIndividualConfiguration

- (AEAssessmentIndividualConfiguration)init
{
  AEAssessmentIndividualConfiguration *v2;
  AEAssessmentIndividualConfiguration *v3;
  NSDictionary *configurationInfo;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AEAssessmentIndividualConfiguration;
  v2 = -[AEAssessmentIndividualConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_allowsNetworkAccess = 1;
    configurationInfo = v2->_configurationInfo;
    v2->_configurationInfo = (NSDictionary *)MEMORY[0x24BDBD1B8];

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAllowsNetworkAccess:", -[AEAssessmentIndividualConfiguration allowsNetworkAccess](self, "allowsNetworkAccess"));
  -[AEAssessmentIndividualConfiguration configurationInfo](self, "configurationInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setConfigurationInfo:", v6);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AEAssessmentIndividualConfiguration)initWithCoder:(id)a3
{
  id v4;
  AEAssessmentIndividualConfiguration *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSDictionary *configurationInfo;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AEAssessmentIndividualConfiguration;
  v5 = -[AEAssessmentIndividualConfiguration init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowsNetworkAccess"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsNetworkAccess = objc_msgSend(v6, "BOOLValue");

    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("configurationInfo"));
    v15 = objc_claimAutoreleasedReturnValue();
    configurationInfo = v5->_configurationInfo;
    v5->_configurationInfo = (NSDictionary *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithBool:", -[AEAssessmentIndividualConfiguration allowsNetworkAccess](self, "allowsNetworkAccess"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("allowsNetworkAccess"));

  -[AEAssessmentIndividualConfiguration configurationInfo](self, "configurationInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("configurationInfo"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentIndividualConfiguration allowsNetworkAccess](self, "allowsNetworkAccess"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AEAssessmentIndividualConfiguration configurationInfo](self, "configurationInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  AEAssessmentIndividualConfiguration *v4;
  AEAssessmentIndividualConfiguration *v5;
  char v6;

  v4 = (AEAssessmentIndividualConfiguration *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v6 = 1;
    goto LABEL_7;
  }
  if (-[AEAssessmentIndividualConfiguration isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    v6 = -[AEAssessmentIndividualConfiguration isEqualToConfiguration:]((uint64_t)self, v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (uint64_t)isEqualToConfiguration:(uint64_t)a1
{
  void *v2;
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a2;
  if (a1)
  {
    v5 = objc_msgSend((id)a1, "allowsNetworkAccess");
    if (v5 != objc_msgSend(v4, "allowsNetworkAccess"))
    {
      a1 = 0;
      goto LABEL_11;
    }
    objc_msgSend((id)a1, "configurationInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 || (objc_msgSend(v4, "configurationInfo"), (v2 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend((id)a1, "configurationInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "configurationInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = objc_msgSend(v7, "isEqual:", v8);

      if (v6)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      a1 = 1;
    }

    goto LABEL_10;
  }
LABEL_11:

  return a1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  if (-[AEAssessmentIndividualConfiguration allowsNetworkAccess](self, "allowsNetworkAccess"))
    v5 = CFSTR("Yes");
  else
    v5 = CFSTR("No");
  -[AEAssessmentIndividualConfiguration configurationInfo](self, "configurationInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { allowsNetworkAccess = %@, configurationInfo = %@ }>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)allowsNetworkAccess
{
  return self->_allowsNetworkAccess;
}

- (void)setAllowsNetworkAccess:(BOOL)a3
{
  self->_allowsNetworkAccess = a3;
}

- (NSDictionary)configurationInfo
{
  return self->_configurationInfo;
}

- (void)setConfigurationInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationInfo, 0);
}

@end
