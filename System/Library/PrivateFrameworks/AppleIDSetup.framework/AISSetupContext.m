@implementation AISSetupContext

- (AISSetupContext)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AISSetupContext;
  return -[AISSetupContext init](&v3, sel_init);
}

- (void)setMessageSessionTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_messageSessionTemplate, a3);
  self->_shouldSkipConfirmation = 1;
}

- (NSSet)requiredServiceTypes
{
  return self->_requiredServiceTypes;
}

- (void)setRequiredServiceTypes:(id)a3
{
  objc_storeStrong((id *)&self->_requiredServiceTypes, a3);
}

- (NSSet)desiredServiceTypes
{
  return self->_desiredServiceTypes;
}

- (void)setDesiredServiceTypes:(id)a3
{
  objc_storeStrong((id *)&self->_desiredServiceTypes, a3);
}

- (BOOL)shouldBackgroundDesiredServices
{
  return self->_shouldBackgroundDesiredServices;
}

- (void)setShouldBackgroundDesiredServices:(BOOL)a3
{
  self->_shouldBackgroundDesiredServices = a3;
}

- (CUMessageSession)messageSessionTemplate
{
  return self->_messageSessionTemplate;
}

- (CBDevice)bleDevice
{
  return self->_bleDevice;
}

- (void)setBleDevice:(id)a3
{
  objc_storeStrong((id *)&self->_bleDevice, a3);
}

- (unint64_t)localRole
{
  return self->_localRole;
}

- (void)setLocalRole:(unint64_t)a3
{
  self->_localRole = a3;
}

- (unint64_t)remoteRole
{
  return self->_remoteRole;
}

- (void)setRemoteRole:(unint64_t)a3
{
  self->_remoteRole = a3;
}

- (BOOL)shouldSkipConfirmation
{
  return self->_shouldSkipConfirmation;
}

- (void)setShouldSkipConfirmation:(BOOL)a3
{
  self->_shouldSkipConfirmation = a3;
}

- (AISSetupContextCandidateAccount)candidateAccount
{
  return self->_candidateAccount;
}

- (void)setCandidateAccount:(id)a3
{
  objc_storeStrong((id *)&self->_candidateAccount, a3);
}

- (BOOL)supportsSplitAccounts
{
  return self->_supportsSplitAccounts;
}

- (void)setSupportsSplitAccounts:(BOOL)a3
{
  self->_supportsSplitAccounts = a3;
}

- (NSString)fixedPIN
{
  return self->_fixedPIN;
}

- (void)setFixedPIN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)targetAuthTag
{
  return self->_targetAuthTag;
}

- (void)setTargetAuthTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int)pinType
{
  return self->_pinType;
}

- (void)setPinType:(int)a3
{
  self->_pinType = a3;
}

- (unint64_t)deviceUserKind
{
  return self->_deviceUserKind;
}

- (void)setDeviceUserKind:(unint64_t)a3
{
  self->_deviceUserKind = a3;
}

- (BOOL)shouldCreateDeviceUser
{
  return self->_shouldCreateDeviceUser;
}

- (void)setShouldCreateDeviceUser:(BOOL)a3
{
  self->_shouldCreateDeviceUser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetAuthTag, 0);
  objc_storeStrong((id *)&self->_fixedPIN, 0);
  objc_storeStrong((id *)&self->_candidateAccount, 0);
  objc_storeStrong((id *)&self->_bleDevice, 0);
  objc_storeStrong((id *)&self->_messageSessionTemplate, 0);
  objc_storeStrong((id *)&self->_desiredServiceTypes, 0);
  objc_storeStrong((id *)&self->_requiredServiceTypes, 0);
}

@end
