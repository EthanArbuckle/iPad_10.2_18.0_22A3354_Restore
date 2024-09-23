@implementation BuddyEnrollmentFlowMCBridge

- (BuddyEnrollmentFlowMCBridge)init
{
  id v2;
  void *v3;
  BuddyEnrollmentFlowMCBridge *v4;
  objc_super v6;
  SEL v7;
  id location;

  v7 = a2;
  location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyEnrollmentFlowMCBridge;
  location = -[BuddyEnrollmentFlowMCBridge init](&v6, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = objc_alloc_init((Class)sub_1000DDA74());
    v3 = (void *)*((_QWORD *)location + 2);
    *((_QWORD *)location + 2) = v2;

  }
  v4 = (BuddyEnrollmentFlowMCBridge *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  unsigned __int8 v3;
  char v4;
  char v6;
  DMCEnrollmentFlowManagedConfigurationHelper *v7;
  objc_super v8;
  SEL v9;
  SEL v10;
  BuddyEnrollmentFlowMCBridge *v11;
  char v12;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BuddyEnrollmentFlowMCBridge;
  v3 = -[BuddyEnrollmentFlowMCBridge respondsToSelector:](&v8, "respondsToSelector:", a3);
  v6 = 0;
  v4 = 1;
  if ((v3 & 1) == 0)
  {
    v7 = -[BuddyEnrollmentFlowMCBridge helper](v11, "helper");
    v6 = 1;
    v4 = objc_opt_respondsToSelector(v7, v9);
  }
  v12 = v4 & 1;
  if ((v6 & 1) != 0)

  return v12 & 1;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return -[BuddyEnrollmentFlowMCBridge helper](self, "helper");
}

- (void)installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  BuddyEnrollmentFlowMCBridge *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = 0;
  objc_storeStrong(&v13, a5);
  v12 = 0;
  objc_storeStrong(&v12, a6);
  v11 = 0;
  objc_storeStrong(&v11, a7);
  -[BuddyEnrollmentFlowMCBridge installEnrollmentProfile:devicePasscode:personaID:rmAccountIdentifier:managedProfileIdentifiers:installationSource:completionHandler:](v16, "installEnrollmentProfile:devicePasscode:personaID:rmAccountIdentifier:managedProfileIdentifiers:installationSource:completionHandler:", location[0], v14, v13, v12, 0, 0, v11);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 managedProfileIdentifiers:(id)a7 installationSource:(id)a8 completionHandler:(id)a9
{
  id v14;
  id v15;
  uint64_t v16;
  void (**v17)(id, id, id, id, id);
  os_log_t oslog;
  id obj;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id location[2];
  BuddyEnrollmentFlowMCBridge *v29;
  uint8_t buf[24];

  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = 0;
  objc_storeStrong(&v27, a4);
  v26 = 0;
  objc_storeStrong(&v26, a5);
  v25 = 0;
  objc_storeStrong(&v25, a6);
  v24 = 0;
  objc_storeStrong(&v24, a7);
  v23 = 0;
  objc_storeStrong(&v23, a8);
  v22 = 0;
  objc_storeStrong(&v22, a9);
  v14 = -[BuddyEnrollmentFlowMCBridge profileInstallationRequestHandler](v29, "profileInstallationRequestHandler");

  if (v14)
  {
    v21 = 0;
    obj = 0;
    v15 = -[BuddyEnrollmentFlowMCBridge detailsFromMDMProfile:error:](v29, "detailsFromMDMProfile:error:", location[0], &obj);
    objc_storeStrong(&v21, obj);
    v20 = objc_msgSend(v15, "objectForKeyedSubscript:", kMCBridgeProfileIdentifierKey);

    if (v21)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v16);
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        sub_100039500((uint64_t)buf, (uint64_t)v21);
        _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "BuddyEnrollmentFlowMCBridge: Invalid profile! Error: %{public}@", buf, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    v17 = (void (**)(id, id, id, id, id))-[BuddyEnrollmentFlowMCBridge profileInstallationRequestHandler](v29, "profileInstallationRequestHandler");
    v17[2](v17, location[0], v20, v25, v22);

    -[BuddyEnrollmentFlowMCBridge setProfileInstallationRequestHandler:](v29, "setProfileInstallationRequestHandler:", 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v21, 0);
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

- (void)trackEnrollmentDirtyState:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (id)profileInstallationRequestHandler
{
  return self->_profileInstallationRequestHandler;
}

- (void)setProfileInstallationRequestHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (DMCEnrollmentFlowManagedConfigurationHelper)helper
{
  return self->_helper;
}

- (void)setHelper:(id)a3
{
  objc_storeStrong((id *)&self->_helper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong(&self->_profileInstallationRequestHandler, 0);
}

@end
