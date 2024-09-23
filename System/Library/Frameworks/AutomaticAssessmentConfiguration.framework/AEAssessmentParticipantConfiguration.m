@implementation AEAssessmentParticipantConfiguration

- (AEAssessmentParticipantConfiguration)init
{
  AEAssessmentParticipantConfiguration *v2;
  AEAssessmentParticipantConfiguration *v3;
  NSDictionary *configurationInfo;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AEAssessmentParticipantConfiguration;
  v2 = -[AEAssessmentParticipantConfiguration init](&v6, sel_init);
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
  AEAssessmentParticipantConfiguration *v4;
  uint64_t v5;
  NSDictionary *configurationInfo;

  v4 = -[AEAssessmentParticipantConfiguration init](+[AEAssessmentParticipantConfiguration allocWithZone:](AEAssessmentParticipantConfiguration, "allocWithZone:", a3), "init");
  v4->_allowsNetworkAccess = self->_allowsNetworkAccess;
  v5 = -[NSDictionary copy](self->_configurationInfo, "copy");
  configurationInfo = v4->_configurationInfo;
  v4->_configurationInfo = (NSDictionary *)v5;

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowsNetworkAccess);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSDictionary hash](self->_configurationInfo, "hash") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  AEAssessmentParticipantConfiguration *v4;
  AEAssessmentParticipantConfiguration *v5;
  char v6;

  v4 = (AEAssessmentParticipantConfiguration *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v6 = 1;
    goto LABEL_7;
  }
  if (-[AEAssessmentParticipantConfiguration isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    v6 = -[AEAssessmentParticipantConfiguration isEqualToConfiguration:]((uint64_t)self, v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (uint64_t)isEqualToConfiguration:(uint64_t)a1
{
  _QWORD *v3;
  _QWORD *v4;
  unint64_t v5;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 8) == *((unsigned __int8 *)v3 + 8))
    {
      v5 = *(_QWORD *)(a1 + 16);
      if (v5 | v4[2])
        a1 = objc_msgSend((id)v5, "isEqual:");
      else
        a1 = 1;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = CFSTR("Yes");
  if (!self->_allowsNetworkAccess)
    v5 = CFSTR("No");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { allowsNetworkAccess = %@, configurationInfo = %@ }>"), v4, self, v5, self->_configurationInfo);
}

- (id)individualConfiguration
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setAllowsNetworkAccess:", self->_allowsNetworkAccess);
  v4 = (void *)-[NSDictionary copy](self->_configurationInfo, "copy");
  objc_msgSend(v3, "setConfigurationInfo:", v4);

  return v3;
}

+ (id)instanceFromIndividualConfiguration:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a3)
  {
    v3 = a3;
    v4 = objc_opt_new();
    *(_BYTE *)(v4 + 8) = objc_msgSend(v3, "allowsNetworkAccess");
    objc_msgSend(v3, "configurationInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "copy");
    v7 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v6;

  }
  else
  {
    v4 = 0;
  }
  return (id)v4;
}

- (BOOL)allowsNetworkAccess
{
  return self->_allowsNetworkAccess;
}

- (void)setAllowsNetworkAccess:(BOOL)allowsNetworkAccess
{
  self->_allowsNetworkAccess = allowsNetworkAccess;
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
