@implementation AISSetupReport

- (NSDictionary)accountAltDSIDsByService
{
  return self->_accountAltDSIDsByService;
}

- (void)setAccountAltDSIDsByService:(id)a3
{
  objc_storeStrong((id *)&self->_accountAltDSIDsByService, a3);
}

- (NSString)createdPersonaID
{
  return self->_createdPersonaID;
}

- (void)setCreatedPersonaID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (AISSetupReportLocaleInfo)peerDeviceLocaleInfo
{
  return self->_peerDeviceLocaleInfo;
}

- (void)setPeerDeviceLocaleInfo:(id)a3
{
  objc_storeStrong((id *)&self->_peerDeviceLocaleInfo, a3);
}

- (NSArray)childReports
{
  return self->_childReports;
}

- (void)setChildReports:(id)a3
{
  objc_storeStrong((id *)&self->_childReports, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childReports, 0);
  objc_storeStrong((id *)&self->_peerDeviceLocaleInfo, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_createdPersonaID, 0);
  objc_storeStrong((id *)&self->_accountAltDSIDsByService, 0);
}

@end
