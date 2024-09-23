@implementation CEMDeviceInformationCommand_StatusQueryResponsesOSUpdateSettings

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[11];

  v6[10] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("CatalogURL");
  v6[1] = CFSTR("IsDefaultCatalog");
  v6[2] = CFSTR("PreviousScanDate");
  v6[3] = CFSTR("PreviousScanResult");
  v6[4] = CFSTR("PerformPeriodicCheck");
  v6[5] = CFSTR("AutomaticCheckEnabled");
  v6[6] = CFSTR("BackgroundDownloadEnabled");
  v6[7] = CFSTR("AutomaticAppInstallationEnabled");
  v6[8] = CFSTR("AutomaticOSInstallationEnabled");
  v6[9] = CFSTR("AutomaticSecurityUpdatesEnabled");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithCatalogURL:(id)a3 withIsDefaultCatalog:(id)a4 withPreviousScanDate:(id)a5 withPreviousScanResult:(id)a6 withPerformPeriodicCheck:(id)a7 withAutomaticCheckEnabled:(id)a8 withBackgroundDownloadEnabled:(id)a9 withAutomaticAppInstallationEnabled:(id)a10 withAutomaticOSInstallationEnabled:(id)a11 withAutomaticSecurityUpdatesEnabled:(id)a12
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
  objc_msgSend(v26, "setStatusCatalogURL:", v25);

  objc_msgSend(v26, "setStatusIsDefaultCatalog:", v24);
  objc_msgSend(v26, "setStatusPreviousScanDate:", v23);

  objc_msgSend(v26, "setStatusPreviousScanResult:", v22);
  objc_msgSend(v26, "setStatusPerformPeriodicCheck:", v21);

  objc_msgSend(v26, "setStatusAutomaticCheckEnabled:", v20);
  objc_msgSend(v26, "setStatusBackgroundDownloadEnabled:", v19);

  objc_msgSend(v26, "setStatusAutomaticAppInstallationEnabled:", v18);
  objc_msgSend(v26, "setStatusAutomaticOSInstallationEnabled:", v28);

  objc_msgSend(v26, "setStatusAutomaticSecurityUpdatesEnabled:", v29);
  return v26;
}

+ (id)buildRequiredOnly
{
  return (id)objc_opt_new();
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
  NSString *statusCatalogURL;
  NSNumber *v17;
  NSNumber *statusIsDefaultCatalog;
  NSDate *v19;
  NSDate *statusPreviousScanDate;
  NSString *v21;
  NSString *statusPreviousScanResult;
  NSNumber *v23;
  NSNumber *statusPerformPeriodicCheck;
  NSNumber *v25;
  NSNumber *statusAutomaticCheckEnabled;
  NSNumber *v27;
  NSNumber *statusBackgroundDownloadEnabled;
  NSNumber *v29;
  NSNumber *statusAutomaticAppInstallationEnabled;
  NSNumber *v31;
  NSNumber *statusAutomaticOSInstallationEnabled;
  NSNumber *v33;
  NSNumber *statusAutomaticSecurityUpdatesEnabled;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMDeviceInformationCommand_StatusQueryResponsesOSUpdateSettings allowedStatusKeys](CEMDeviceInformationCommand_StatusQueryResponsesOSUpdateSettings, "allowedStatusKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  if (objc_msgSend(v9, "count"))
  {
    if (!a4)
    {
      v14 = 0;
      goto LABEL_19;
    }
    v11 = (void *)MEMORY[0x24BDD1540];
    v46 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected payload keys: %@"), v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v47[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
  }
  else
  {
    v45 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CatalogURL"), 0, 0, &v45);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    v12 = v45;
    statusCatalogURL = self->_statusCatalogURL;
    self->_statusCatalogURL = v15;

    if (!v12)
    {
      v44 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IsDefaultCatalog"), 0, 0, &v44);
      v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v12 = v44;
      statusIsDefaultCatalog = self->_statusIsDefaultCatalog;
      self->_statusIsDefaultCatalog = v17;

      if (!v12)
      {
        v43 = 0;
        -[CEMPayloadBase loadDateFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadDateFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PreviousScanDate"), 0, 0, &v43);
        v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
        v12 = v43;
        statusPreviousScanDate = self->_statusPreviousScanDate;
        self->_statusPreviousScanDate = v19;

        if (!v12)
        {
          v42 = 0;
          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PreviousScanResult"), 0, 0, &v42);
          v21 = (NSString *)objc_claimAutoreleasedReturnValue();
          v12 = v42;
          statusPreviousScanResult = self->_statusPreviousScanResult;
          self->_statusPreviousScanResult = v21;

          if (!v12)
          {
            v41 = 0;
            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PerformPeriodicCheck"), 0, 0, &v41);
            v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v12 = v41;
            statusPerformPeriodicCheck = self->_statusPerformPeriodicCheck;
            self->_statusPerformPeriodicCheck = v23;

            if (!v12)
            {
              v40 = 0;
              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AutomaticCheckEnabled"), 0, 0, &v40);
              v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v12 = v40;
              statusAutomaticCheckEnabled = self->_statusAutomaticCheckEnabled;
              self->_statusAutomaticCheckEnabled = v25;

              if (!v12)
              {
                v39 = 0;
                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("BackgroundDownloadEnabled"), 0, 0, &v39);
                v27 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v12 = v39;
                statusBackgroundDownloadEnabled = self->_statusBackgroundDownloadEnabled;
                self->_statusBackgroundDownloadEnabled = v27;

                if (!v12)
                {
                  v38 = 0;
                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AutomaticAppInstallationEnabled"), 0, 0, &v38);
                  v29 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v12 = v38;
                  statusAutomaticAppInstallationEnabled = self->_statusAutomaticAppInstallationEnabled;
                  self->_statusAutomaticAppInstallationEnabled = v29;

                  if (!v12)
                  {
                    v37 = 0;
                    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AutomaticOSInstallationEnabled"), 0, 0, &v37);
                    v31 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                    v12 = v37;
                    statusAutomaticOSInstallationEnabled = self->_statusAutomaticOSInstallationEnabled;
                    self->_statusAutomaticOSInstallationEnabled = v31;

                    if (!v12)
                    {
                      v36 = 0;
                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AutomaticSecurityUpdatesEnabled"), 0, 0, &v36);
                      v33 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                      v12 = v36;
                      statusAutomaticSecurityUpdatesEnabled = self->_statusAutomaticSecurityUpdatesEnabled;
                      self->_statusAutomaticSecurityUpdatesEnabled = v33;

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

LABEL_19:
  return v14;
}

- (id)serializePayload
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("CatalogURL"), self->_statusCatalogURL, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("IsDefaultCatalog"), self->_statusIsDefaultCatalog, 0, 0);
  -[CEMPayloadBase serializeDateIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeDateIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("PreviousScanDate"), self->_statusPreviousScanDate, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("PreviousScanResult"), self->_statusPreviousScanResult, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("PerformPeriodicCheck"), self->_statusPerformPeriodicCheck, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("AutomaticCheckEnabled"), self->_statusAutomaticCheckEnabled, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("BackgroundDownloadEnabled"), self->_statusBackgroundDownloadEnabled, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("AutomaticAppInstallationEnabled"), self->_statusAutomaticAppInstallationEnabled, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("AutomaticOSInstallationEnabled"), self->_statusAutomaticOSInstallationEnabled, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v3, CFSTR("AutomaticSecurityUpdatesEnabled"), self->_statusAutomaticSecurityUpdatesEnabled, 0, 0);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
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
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CEMDeviceInformationCommand_StatusQueryResponsesOSUpdateSettings;
  v4 = -[CEMPayloadBase copyWithZone:](&v26, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_statusCatalogURL, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_statusIsDefaultCatalog, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSDate copy](self->_statusPreviousScanDate, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_statusPreviousScanResult, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSNumber copy](self->_statusPerformPeriodicCheck, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSNumber copy](self->_statusAutomaticCheckEnabled, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSNumber copy](self->_statusBackgroundDownloadEnabled, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSNumber copy](self->_statusAutomaticAppInstallationEnabled, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  v21 = -[NSNumber copy](self->_statusAutomaticOSInstallationEnabled, "copy");
  v22 = (void *)v4[10];
  v4[10] = v21;

  v23 = -[NSNumber copy](self->_statusAutomaticSecurityUpdatesEnabled, "copy");
  v24 = (void *)v4[11];
  v4[11] = v23;

  return v4;
}

- (NSString)statusCatalogURL
{
  return self->_statusCatalogURL;
}

- (void)setStatusCatalogURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)statusIsDefaultCatalog
{
  return self->_statusIsDefaultCatalog;
}

- (void)setStatusIsDefaultCatalog:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)statusPreviousScanDate
{
  return self->_statusPreviousScanDate;
}

- (void)setStatusPreviousScanDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)statusPreviousScanResult
{
  return self->_statusPreviousScanResult;
}

- (void)setStatusPreviousScanResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)statusPerformPeriodicCheck
{
  return self->_statusPerformPeriodicCheck;
}

- (void)setStatusPerformPeriodicCheck:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)statusAutomaticCheckEnabled
{
  return self->_statusAutomaticCheckEnabled;
}

- (void)setStatusAutomaticCheckEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)statusBackgroundDownloadEnabled
{
  return self->_statusBackgroundDownloadEnabled;
}

- (void)setStatusBackgroundDownloadEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)statusAutomaticAppInstallationEnabled
{
  return self->_statusAutomaticAppInstallationEnabled;
}

- (void)setStatusAutomaticAppInstallationEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)statusAutomaticOSInstallationEnabled
{
  return self->_statusAutomaticOSInstallationEnabled;
}

- (void)setStatusAutomaticOSInstallationEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)statusAutomaticSecurityUpdatesEnabled
{
  return self->_statusAutomaticSecurityUpdatesEnabled;
}

- (void)setStatusAutomaticSecurityUpdatesEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusAutomaticSecurityUpdatesEnabled, 0);
  objc_storeStrong((id *)&self->_statusAutomaticOSInstallationEnabled, 0);
  objc_storeStrong((id *)&self->_statusAutomaticAppInstallationEnabled, 0);
  objc_storeStrong((id *)&self->_statusBackgroundDownloadEnabled, 0);
  objc_storeStrong((id *)&self->_statusAutomaticCheckEnabled, 0);
  objc_storeStrong((id *)&self->_statusPerformPeriodicCheck, 0);
  objc_storeStrong((id *)&self->_statusPreviousScanResult, 0);
  objc_storeStrong((id *)&self->_statusPreviousScanDate, 0);
  objc_storeStrong((id *)&self->_statusIsDefaultCatalog, 0);
  objc_storeStrong((id *)&self->_statusCatalogURL, 0);
}

@end
