@implementation CEMApplicationListInstalledApplicationsCommand_StatusInstalledApplicationListItem

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[19];

  v6[18] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("BundleIdentifier");
  v6[1] = CFSTR("ExternalVersionIdentifier");
  v6[2] = CFSTR("Version");
  v6[3] = CFSTR("ShortVersion");
  v6[4] = CFSTR("Name");
  v6[5] = CFSTR("BundleSize");
  v6[6] = CFSTR("DynamicSize");
  v6[7] = CFSTR("IsValidated");
  v6[8] = CFSTR("Installing");
  v6[9] = CFSTR("AppStoreVendable");
  v6[10] = CFSTR("DeviceBasedVPP");
  v6[11] = CFSTR("BetaApp");
  v6[12] = CFSTR("AdHocCodeSigned");
  v6[13] = CFSTR("HasUpdateAvailable");
  v6[14] = CFSTR("DownloadFailed");
  v6[15] = CFSTR("DownloadWaiting");
  v6[16] = CFSTR("DownloadPaused");
  v6[17] = CFSTR("DownloadCancelled");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithBundleIdentifier:(id)a3 withExternalVersionIdentifier:(id)a4 withVersion:(id)a5 withShortVersion:(id)a6 withName:(id)a7 withBundleSize:(id)a8 withDynamicSize:(id)a9 withIsValidated:(id)a10 withInstalling:(id)a11 withAppStoreVendable:(id)a12 withDeviceBasedVPP:(id)a13 withBetaApp:(id)a14 withAdHocCodeSigned:(id)a15 withHasUpdateAvailable:(id)a16 withDownloadFailed:(id)a17 withDownloadWaiting:(id)a18 withDownloadPaused:(id)a19 withDownloadCancelled:(id)a20
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;

  v53 = a20;
  v52 = a19;
  v51 = a18;
  v50 = a17;
  v49 = a16;
  v48 = a15;
  v47 = a14;
  v46 = a13;
  v45 = a12;
  v20 = a11;
  v21 = a10;
  v22 = a9;
  v23 = a8;
  v24 = a7;
  v25 = a6;
  v26 = a5;
  v27 = a4;
  v28 = a3;
  v29 = (void *)objc_opt_new();
  objc_msgSend(v29, "setStatusBundleIdentifier:", v28);

  objc_msgSend(v29, "setStatusExternalVersionIdentifier:", v27);
  objc_msgSend(v29, "setStatusVersion:", v26);

  objc_msgSend(v29, "setStatusShortVersion:", v25);
  objc_msgSend(v29, "setStatusName:", v24);

  objc_msgSend(v29, "setStatusBundleSize:", v23);
  objc_msgSend(v29, "setStatusDynamicSize:", v22);

  v30 = (void *)MEMORY[0x24BDBD1C8];
  if (v21)
    v31 = v21;
  else
    v31 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v29, "setStatusIsValidated:", v31);

  if (v20)
    v32 = v20;
  else
    v32 = v30;
  objc_msgSend(v29, "setStatusInstalling:", v32);

  objc_msgSend(v29, "setStatusAppStoreVendable:", v45);
  objc_msgSend(v29, "setStatusDeviceBasedVPP:", v46);

  objc_msgSend(v29, "setStatusBetaApp:", v47);
  objc_msgSend(v29, "setStatusAdHocCodeSigned:", v48);

  objc_msgSend(v29, "setStatusHasUpdateAvailable:", v49);
  v33 = (void *)MEMORY[0x24BDBD1C0];
  if (v50)
    v34 = v50;
  else
    v34 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v29, "setStatusDownloadFailed:", v34);

  if (v51)
    v35 = v51;
  else
    v35 = v33;
  objc_msgSend(v29, "setStatusDownloadWaiting:", v35);

  if (v52)
    v36 = v52;
  else
    v36 = v33;
  objc_msgSend(v29, "setStatusDownloadPaused:", v36);

  if (v53)
    v37 = v53;
  else
    v37 = v33;
  objc_msgSend(v29, "setStatusDownloadCancelled:", v37);

  return v29;
}

+ (id)buildRequiredOnlyWithBundleIdentifier:(id)a3 withExternalVersionIdentifier:(id)a4 withVersion:(id)a5 withShortVersion:(id)a6 withName:(id)a7 withAppStoreVendable:(id)a8 withDeviceBasedVPP:(id)a9 withBetaApp:(id)a10 withAdHocCodeSigned:(id)a11 withHasUpdateAvailable:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v28;
  id v29;

  v29 = a12;
  v28 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  v26 = (void *)objc_opt_new();
  objc_msgSend(v26, "setStatusBundleIdentifier:", v25);

  objc_msgSend(v26, "setStatusExternalVersionIdentifier:", v24);
  objc_msgSend(v26, "setStatusVersion:", v23);

  objc_msgSend(v26, "setStatusShortVersion:", v22);
  objc_msgSend(v26, "setStatusName:", v21);

  objc_msgSend(v26, "setStatusAppStoreVendable:", v20);
  objc_msgSend(v26, "setStatusDeviceBasedVPP:", v19);

  objc_msgSend(v26, "setStatusBetaApp:", v18);
  objc_msgSend(v26, "setStatusAdHocCodeSigned:", v28);

  objc_msgSend(v26, "setStatusHasUpdateAvailable:", v29);
  return v26;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  NSString *v15;
  NSString *statusBundleIdentifier;
  NSString *v17;
  NSString *statusExternalVersionIdentifier;
  NSString *v19;
  NSString *statusVersion;
  NSString *v21;
  NSString *statusShortVersion;
  NSString *v23;
  NSString *statusName;
  NSString *v25;
  NSString *statusBundleSize;
  NSString *v27;
  NSString *statusDynamicSize;
  NSNumber *v29;
  NSNumber *statusIsValidated;
  NSNumber *v31;
  NSNumber *statusInstalling;
  NSNumber *v33;
  NSNumber *statusAppStoreVendable;
  NSNumber *v35;
  NSNumber *statusDeviceBasedVPP;
  NSNumber *v37;
  NSNumber *statusBetaApp;
  NSNumber *v39;
  NSNumber *statusAdHocCodeSigned;
  NSNumber *v41;
  NSNumber *statusHasUpdateAvailable;
  NSNumber *v43;
  NSNumber *statusDownloadFailed;
  NSNumber *v45;
  NSNumber *statusDownloadWaiting;
  NSNumber *v47;
  NSNumber *statusDownloadPaused;
  NSNumber *v49;
  NSNumber *statusDownloadCancelled;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  _QWORD v71[2];

  v71[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMApplicationListInstalledApplicationsCommand_StatusInstalledApplicationListItem allowedStatusKeys](CEMApplicationListInstalledApplicationsCommand_StatusInstalledApplicationListItem, "allowedStatusKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  if (objc_msgSend(v9, "count"))
  {
    if (!a4)
    {
      v14 = 0;
      goto LABEL_27;
    }
    v11 = (void *)MEMORY[0x24BDD1540];
    v70 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected payload keys: %@"), v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v71[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
  }
  else
  {
    v69 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("BundleIdentifier"), 1, 0, &v69);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    v12 = v69;
    statusBundleIdentifier = self->_statusBundleIdentifier;
    self->_statusBundleIdentifier = v15;

    if (!v12)
    {
      v68 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ExternalVersionIdentifier"), 1, 0, &v68);
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      v12 = v68;
      statusExternalVersionIdentifier = self->_statusExternalVersionIdentifier;
      self->_statusExternalVersionIdentifier = v17;

      if (!v12)
      {
        v67 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Version"), 1, 0, &v67);
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        v12 = v67;
        statusVersion = self->_statusVersion;
        self->_statusVersion = v19;

        if (!v12)
        {
          v66 = 0;
          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ShortVersion"), 1, 0, &v66);
          v21 = (NSString *)objc_claimAutoreleasedReturnValue();
          v12 = v66;
          statusShortVersion = self->_statusShortVersion;
          self->_statusShortVersion = v21;

          if (!v12)
          {
            v65 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Name"), 1, 0, &v65);
            v23 = (NSString *)objc_claimAutoreleasedReturnValue();
            v12 = v65;
            statusName = self->_statusName;
            self->_statusName = v23;

            if (!v12)
            {
              v64 = 0;
              -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("BundleSize"), 0, 0, &v64);
              v25 = (NSString *)objc_claimAutoreleasedReturnValue();
              v12 = v64;
              statusBundleSize = self->_statusBundleSize;
              self->_statusBundleSize = v25;

              if (!v12)
              {
                v63 = 0;
                -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DynamicSize"), 0, 0, &v63);
                v27 = (NSString *)objc_claimAutoreleasedReturnValue();
                v12 = v63;
                statusDynamicSize = self->_statusDynamicSize;
                self->_statusDynamicSize = v27;

                if (!v12)
                {
                  v62 = 0;
                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IsValidated"), 0, MEMORY[0x24BDBD1C8], &v62);
                  v29 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v12 = v62;
                  statusIsValidated = self->_statusIsValidated;
                  self->_statusIsValidated = v29;

                  if (!v12)
                  {
                    v61 = 0;
                    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Installing"), 0, MEMORY[0x24BDBD1C8], &v61);
                    v31 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                    v12 = v61;
                    statusInstalling = self->_statusInstalling;
                    self->_statusInstalling = v31;

                    if (!v12)
                    {
                      v60 = 0;
                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AppStoreVendable"), 1, 0, &v60);
                      v33 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                      v12 = v60;
                      statusAppStoreVendable = self->_statusAppStoreVendable;
                      self->_statusAppStoreVendable = v33;

                      if (!v12)
                      {
                        v59 = 0;
                        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DeviceBasedVPP"), 1, 0, &v59);
                        v35 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                        v12 = v59;
                        statusDeviceBasedVPP = self->_statusDeviceBasedVPP;
                        self->_statusDeviceBasedVPP = v35;

                        if (!v12)
                        {
                          v58 = 0;
                          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("BetaApp"), 1, 0, &v58);
                          v37 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                          v12 = v58;
                          statusBetaApp = self->_statusBetaApp;
                          self->_statusBetaApp = v37;

                          if (!v12)
                          {
                            v57 = 0;
                            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AdHocCodeSigned"), 1, 0, &v57);
                            v39 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                            v12 = v57;
                            statusAdHocCodeSigned = self->_statusAdHocCodeSigned;
                            self->_statusAdHocCodeSigned = v39;

                            if (!v12)
                            {
                              v56 = 0;
                              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("HasUpdateAvailable"), 1, 0, &v56);
                              v41 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                              v12 = v56;
                              statusHasUpdateAvailable = self->_statusHasUpdateAvailable;
                              self->_statusHasUpdateAvailable = v41;

                              if (!v12)
                              {
                                v55 = 0;
                                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DownloadFailed"), 0, MEMORY[0x24BDBD1C0], &v55);
                                v43 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                v12 = v55;
                                statusDownloadFailed = self->_statusDownloadFailed;
                                self->_statusDownloadFailed = v43;

                                if (!v12)
                                {
                                  v54 = 0;
                                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DownloadWaiting"), 0, MEMORY[0x24BDBD1C0], &v54);
                                  v45 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                  v12 = v54;
                                  statusDownloadWaiting = self->_statusDownloadWaiting;
                                  self->_statusDownloadWaiting = v45;

                                  if (!v12)
                                  {
                                    v53 = 0;
                                    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DownloadPaused"), 0, MEMORY[0x24BDBD1C0], &v53);
                                    v47 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                    v12 = v53;
                                    statusDownloadPaused = self->_statusDownloadPaused;
                                    self->_statusDownloadPaused = v47;

                                    if (!v12)
                                    {
                                      v52 = 0;
                                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DownloadCancelled"), 0, MEMORY[0x24BDBD1C0], &v52);
                                      v49 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                      v12 = v52;
                                      statusDownloadCancelled = self->_statusDownloadCancelled;
                                      self->_statusDownloadCancelled = v49;

                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    v14 = v12 == 0;
    if (a4 && v12)
    {
      v12 = objc_retainAutorelease(v12);
      v14 = 0;
      *a4 = v12;
    }
  }

LABEL_27:
  return v14;
}

- (id)serializePayload
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("BundleIdentifier"), self->_statusBundleIdentifier, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("ExternalVersionIdentifier"), self->_statusExternalVersionIdentifier, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("Version"), self->_statusVersion, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("ShortVersion"), self->_statusShortVersion, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("Name"), self->_statusName, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("BundleSize"), self->_statusBundleSize, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("DynamicSize"), self->_statusDynamicSize, 0, 0);
  v4 = MEMORY[0x24BDBD1C8];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("IsValidated"), self->_statusIsValidated, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("Installing"), self->_statusInstalling, 0, v4);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("AppStoreVendable"), self->_statusAppStoreVendable, 1, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("DeviceBasedVPP"), self->_statusDeviceBasedVPP, 1, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("BetaApp"), self->_statusBetaApp, 1, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("AdHocCodeSigned"), self->_statusAdHocCodeSigned, 1, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("HasUpdateAvailable"), self->_statusHasUpdateAvailable, 1, 0);
  v5 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("DownloadFailed"), self->_statusDownloadFailed, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("DownloadWaiting"), self->_statusDownloadWaiting, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("DownloadPaused"), self->_statusDownloadPaused, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("DownloadCancelled"), self->_statusDownloadCancelled, 0, v5);
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)CEMApplicationListInstalledApplicationsCommand_StatusInstalledApplicationListItem;
  v4 = -[CEMPayloadBase copyWithZone:](&v42, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_statusBundleIdentifier, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_statusExternalVersionIdentifier, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_statusVersion, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_statusShortVersion, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSString copy](self->_statusName, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSString copy](self->_statusBundleSize, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSString copy](self->_statusDynamicSize, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSNumber copy](self->_statusIsValidated, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  v21 = -[NSNumber copy](self->_statusInstalling, "copy");
  v22 = (void *)v4[10];
  v4[10] = v21;

  v23 = -[NSNumber copy](self->_statusAppStoreVendable, "copy");
  v24 = (void *)v4[11];
  v4[11] = v23;

  v25 = -[NSNumber copy](self->_statusDeviceBasedVPP, "copy");
  v26 = (void *)v4[12];
  v4[12] = v25;

  v27 = -[NSNumber copy](self->_statusBetaApp, "copy");
  v28 = (void *)v4[13];
  v4[13] = v27;

  v29 = -[NSNumber copy](self->_statusAdHocCodeSigned, "copy");
  v30 = (void *)v4[14];
  v4[14] = v29;

  v31 = -[NSNumber copy](self->_statusHasUpdateAvailable, "copy");
  v32 = (void *)v4[15];
  v4[15] = v31;

  v33 = -[NSNumber copy](self->_statusDownloadFailed, "copy");
  v34 = (void *)v4[16];
  v4[16] = v33;

  v35 = -[NSNumber copy](self->_statusDownloadWaiting, "copy");
  v36 = (void *)v4[17];
  v4[17] = v35;

  v37 = -[NSNumber copy](self->_statusDownloadPaused, "copy");
  v38 = (void *)v4[18];
  v4[18] = v37;

  v39 = -[NSNumber copy](self->_statusDownloadCancelled, "copy");
  v40 = (void *)v4[19];
  v4[19] = v39;

  return v4;
}

- (NSString)statusBundleIdentifier
{
  return self->_statusBundleIdentifier;
}

- (void)setStatusBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)statusExternalVersionIdentifier
{
  return self->_statusExternalVersionIdentifier;
}

- (void)setStatusExternalVersionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)statusVersion
{
  return self->_statusVersion;
}

- (void)setStatusVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)statusShortVersion
{
  return self->_statusShortVersion;
}

- (void)setStatusShortVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)statusName
{
  return self->_statusName;
}

- (void)setStatusName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)statusBundleSize
{
  return self->_statusBundleSize;
}

- (void)setStatusBundleSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)statusDynamicSize
{
  return self->_statusDynamicSize;
}

- (void)setStatusDynamicSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)statusIsValidated
{
  return self->_statusIsValidated;
}

- (void)setStatusIsValidated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)statusInstalling
{
  return self->_statusInstalling;
}

- (void)setStatusInstalling:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)statusAppStoreVendable
{
  return self->_statusAppStoreVendable;
}

- (void)setStatusAppStoreVendable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)statusDeviceBasedVPP
{
  return self->_statusDeviceBasedVPP;
}

- (void)setStatusDeviceBasedVPP:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)statusBetaApp
{
  return self->_statusBetaApp;
}

- (void)setStatusBetaApp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)statusAdHocCodeSigned
{
  return self->_statusAdHocCodeSigned;
}

- (void)setStatusAdHocCodeSigned:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)statusHasUpdateAvailable
{
  return self->_statusHasUpdateAvailable;
}

- (void)setStatusHasUpdateAvailable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)statusDownloadFailed
{
  return self->_statusDownloadFailed;
}

- (void)setStatusDownloadFailed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)statusDownloadWaiting
{
  return self->_statusDownloadWaiting;
}

- (void)setStatusDownloadWaiting:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)statusDownloadPaused
{
  return self->_statusDownloadPaused;
}

- (void)setStatusDownloadPaused:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)statusDownloadCancelled
{
  return self->_statusDownloadCancelled;
}

- (void)setStatusDownloadCancelled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDownloadCancelled, 0);
  objc_storeStrong((id *)&self->_statusDownloadPaused, 0);
  objc_storeStrong((id *)&self->_statusDownloadWaiting, 0);
  objc_storeStrong((id *)&self->_statusDownloadFailed, 0);
  objc_storeStrong((id *)&self->_statusHasUpdateAvailable, 0);
  objc_storeStrong((id *)&self->_statusAdHocCodeSigned, 0);
  objc_storeStrong((id *)&self->_statusBetaApp, 0);
  objc_storeStrong((id *)&self->_statusDeviceBasedVPP, 0);
  objc_storeStrong((id *)&self->_statusAppStoreVendable, 0);
  objc_storeStrong((id *)&self->_statusInstalling, 0);
  objc_storeStrong((id *)&self->_statusIsValidated, 0);
  objc_storeStrong((id *)&self->_statusDynamicSize, 0);
  objc_storeStrong((id *)&self->_statusBundleSize, 0);
  objc_storeStrong((id *)&self->_statusName, 0);
  objc_storeStrong((id *)&self->_statusShortVersion, 0);
  objc_storeStrong((id *)&self->_statusVersion, 0);
  objc_storeStrong((id *)&self->_statusExternalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_statusBundleIdentifier, 0);
}

@end
