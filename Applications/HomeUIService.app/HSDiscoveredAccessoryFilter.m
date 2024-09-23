@implementation HSDiscoveredAccessoryFilter

- (HSDiscoveredAccessoryFilter)initWithEntitlementContext:(id)a3 setupAccessoryDescription:(id)a4 matterDeviceSetupRequest:(id)a5
{
  id v9;
  id v10;
  id v11;
  HSDiscoveredAccessoryFilter *v12;
  HSDiscoveredAccessoryFilter *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HSDiscoveredAccessoryFilter;
  v12 = -[HSDiscoveredAccessoryFilter init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_entitlementContext, a3);
    objc_storeStrong((id *)&v13->_setupAccessoryDescription, a4);
    objc_storeStrong((id *)&v13->_matterDeviceSetupRequest, a5);
    -[HSDiscoveredAccessoryFilter _computeDenylistedAccessoryCategories](v13, "_computeDenylistedAccessoryCategories");
  }

  return v13;
}

- (BOOL)shouldShowAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  _DWORD v24[2];
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryFilter setupAccessoryDescription](self, "setupAccessoryDescription"));
  if (objc_msgSend(v6, "isSetupInitiatedByOtherMatterEcosystem") && v5)
  {
    v7 = objc_msgSend(v5, "supportsCHIP");

    if ((v7 & 1) == 0)
      goto LABEL_14;
  }
  else
  {

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryFilter entitlementContext](self, "entitlementContext"));
  v9 = objc_msgSend(v8, "isEntitledForHomeKitSPI");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sharingDevice"));
  v11 = v10;
  if (v9)
  {

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sharingDevice"));
      v13 = objc_msgSend(v12, "deviceClassCode");

      LOBYTE(v13) = (v13 & 0xFFFFFFFD) == 4;
      goto LABEL_22;
    }
    if (!v5)
    {
LABEL_14:
      LOBYTE(v13) = 0;
      goto LABEL_22;
    }
  }
  else
  {

    LOBYTE(v13) = 0;
    if (v11 || !v5)
      goto LABEL_22;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryFilter denylistedAccessoryCategories](self, "denylistedAccessoryCategories"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "category"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "categoryType"));
  v17 = objc_msgSend(v14, "containsObject:", v16);

  if ((v17 & 1) != 0)
    goto LABEL_14;
  if (objc_msgSend(v5, "supportsCHIP")
    && objc_msgSend(v5, "knownToSystemCommissioner")
    && (v18 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryFilter matterDeviceSetupRequest](self, "matterDeviceSetupRequest")),
        v18,
        v18))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryFilter matterDeviceSetupRequest](self, "matterDeviceSetupRequest"));
    v13 = objc_msgSend(v19, "hs_shouldShowAccessory:", v5);

    v20 = HFLogForCategory(58);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryFilter matterDeviceSetupRequest](self, "matterDeviceSetupRequest"));
      v24[0] = 67109634;
      v24[1] = v13;
      v25 = 2112;
      v26 = v5;
      v27 = 2112;
      v28 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "answerFromRequest=%d for accessory %@ request %@", (uint8_t *)v24, 0x1Cu);

    }
  }
  else
  {
    LOBYTE(v13) = 1;
  }
LABEL_22:

  return v13;
}

- (void)_computeDenylistedAccessoryCategories
{
  id v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100042468;
  v5[3] = &unk_1000A2E00;
  v5[4] = self;
  v3 = sub_100042468((uint64_t)v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[HSDiscoveredAccessoryFilter setDenylistedAccessoryCategories:](self, "setDenylistedAccessoryCategories:", v4);

}

- (HSEntitlementContext)entitlementContext
{
  return self->_entitlementContext;
}

- (HMSetupAccessoryDescription)setupAccessoryDescription
{
  return self->_setupAccessoryDescription;
}

- (MTSDeviceSetupRequest)matterDeviceSetupRequest
{
  return self->_matterDeviceSetupRequest;
}

- (NSSet)denylistedAccessoryCategories
{
  return self->_denylistedAccessoryCategories;
}

- (void)setDenylistedAccessoryCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denylistedAccessoryCategories, 0);
  objc_storeStrong((id *)&self->_matterDeviceSetupRequest, 0);
  objc_storeStrong((id *)&self->_setupAccessoryDescription, 0);
  objc_storeStrong((id *)&self->_entitlementContext, 0);
}

@end
