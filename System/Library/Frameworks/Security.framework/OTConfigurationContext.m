@implementation OTConfigurationContext

- (void)setSbd:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void)setOverrideForSetupAccountScript:(BOOL)a3
{
  self->_overrideForSetupAccountScript = a3;
}

- (void)setOtControl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)setFlowID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setEscrowFetchSource:(int64_t)a3
{
  self->_escrowFetchSource = a3;
}

- (void)setDsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setDeviceSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setContainerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setCkksControl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)sbd
{
  return objc_getProperty(self, a2, 104, 1);
}

- (BOOL)overrideForSetupAccountScript
{
  return self->_overrideForSetupAccountScript;
}

- (OTControl)otControl
{
  return (OTControl *)objc_getProperty(self, a2, 88, 1);
}

- (OTConfigurationContext)init
{
  OTConfigurationContext *v2;
  OTConfigurationContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OTConfigurationContext;
  v2 = -[OTConfigurationContext init](&v5, sel_init);
  v3 = v2;
  if (v2)
    objc_storeStrong((id *)&v2->_context, (id)OTDefaultContext);
  return v3;
}

- (int64_t)escrowFetchSource
{
  return self->_escrowFetchSource;
}

- (NSString)dsid
{
  return self->_dsid;
}

- (NSString)context
{
  return self->_context;
}

- (NSString)containerName
{
  return self->_containerName;
}

- (CKKSControl)ckksControl
{
  return (CKKSControl *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sbd, 0);
  objc_storeStrong((id *)&self->_ckksControl, 0);
  objc_storeStrong((id *)&self->_otControl, 0);
  objc_storeStrong((id *)&self->_deviceSessionID, 0);
  objc_storeStrong((id *)&self->_flowID, 0);
  objc_storeStrong((id *)&self->_passwordEquivalentToken, 0);
  objc_storeStrong((id *)&self->_authenticationAppleID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (BOOL)overrideEscrowCache
{
  return -[OTConfigurationContext escrowFetchSource](self, "escrowFetchSource") == 2;
}

- (void)setOverrideEscrowCache:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  -[OTConfigurationContext setEscrowFetchSource:](self, "setEscrowFetchSource:", v3);
}

- (id)makeOTControl:(id *)a3
{
  void *v5;

  -[OTConfigurationContext otControl](self, "otControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[OTConfigurationContext otControl](self, "otControl");
  else
    +[OTControl controlObject:error:](OTControl, "controlObject:error:", 1, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)makeCKKSControl:(id *)a3
{
  void *v5;

  -[OTConfigurationContext ckksControl](self, "ckksControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[OTConfigurationContext ckksControl](self, "ckksControl");
  else
    +[CKKSControl CKKSControlObject:error:](CKKSControl, "CKKSControlObject:error:", 1, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[OTConfigurationContext context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTConfigurationContext containerName](self, "containerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTConfigurationContext altDSID](self, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<OTConfigurationContext %@, %@, %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)authenticationAppleID
{
  return self->_authenticationAppleID;
}

- (void)setAuthenticationAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)passwordEquivalentToken
{
  return self->_passwordEquivalentToken;
}

- (void)setPasswordEquivalentToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)octagonCapableRecordsExist
{
  return self->_octagonCapableRecordsExist;
}

- (void)setOctagonCapableRecordsExist:(BOOL)a3
{
  self->_octagonCapableRecordsExist = a3;
}

- (BOOL)overrideForJoinAfterRestore
{
  return self->_overrideForJoinAfterRestore;
}

- (void)setOverrideForJoinAfterRestore:(BOOL)a3
{
  self->_overrideForJoinAfterRestore = a3;
}

- (NSString)flowID
{
  return self->_flowID;
}

- (NSString)deviceSessionID
{
  return self->_deviceSessionID;
}

- (BOOL)testsEnabled
{
  return self->_testsEnabled;
}

- (void)setTestsEnabled:(BOOL)a3
{
  self->_testsEnabled = a3;
}

@end
