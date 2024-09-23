@implementation DMTWiFiPayload

+ (NSSet)supportedPayloadTypes
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("com.apple.wifi.managed"));
}

- (DMTWiFiPayload)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  DMTWiFiPayload *v7;
  uint64_t v8;
  NSString *encryptionType;
  uint64_t v10;
  NSString *ssid;
  uint64_t v12;
  NSDictionary *eapClientConfiguration;
  DMTWiFiPayload *v14;
  NSDictionary *v16;
  uint64_t v17;
  NSArray *acceptEAPTypes;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  id v24;
  void *v25;
  CFTypeID v26;
  CFTypeID TypeID;
  uint64_t v28;
  NSArray *certificateAnchorUUID;
  NSArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  id v35;
  void *v36;
  CFTypeID v37;
  CFTypeID v38;
  NSArray *obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v48.receiver = self;
  v48.super_class = (Class)DMTWiFiPayload;
  v7 = -[DMTConfigurationPrimitive initWithDictionary:error:](&v48, sel_initWithDictionary_error_, v6, a4);
  if (v7)
  {
    v7->_autoJoin = DMTValidateProfileBoolean(v6, CFSTR("AutoJoin"), 1, 1, a4);
    DMTValidateProfileString(v6, CFSTR("EncryptionType"), 1, a4);
    v8 = objc_claimAutoreleasedReturnValue();
    encryptionType = v7->_encryptionType;
    v7->_encryptionType = (NSString *)v8;

    DMTValidateProfileString(v6, CFSTR("SSID_STR"), 1, a4);
    v10 = objc_claimAutoreleasedReturnValue();
    ssid = v7->_ssid;
    v7->_ssid = (NSString *)v10;

    DMTValidateProfileDictionary(v6, CFSTR("EAPClientConfiguration"), 1, a4);
    v12 = objc_claimAutoreleasedReturnValue();
    eapClientConfiguration = v7->_eapClientConfiguration;
    v7->_eapClientConfiguration = (NSDictionary *)v12;

    if (!*a4)
    {
      v16 = v7->_eapClientConfiguration;
      if (v16)
      {
        DMTValidateProfileArray(v16, CFSTR("AcceptEAPTypes"), 0, a4);
        v17 = objc_claimAutoreleasedReturnValue();
        acceptEAPTypes = v7->_acceptEAPTypes;
        v7->_acceptEAPTypes = (NSArray *)v17;

        v19 = v7->_acceptEAPTypes;
        if (!v19)
          goto LABEL_3;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        obj = v19;
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v45;
          while (2)
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v45 != v22)
                objc_enumerationMutation(obj);
              v24 = *(id *)(*((_QWORD *)&v44 + 1) + 8 * i);
              if (v24)
              {
                v25 = v24;
                v26 = CFGetTypeID(v24);
                TypeID = CFNumberGetTypeID();

                if (v26 == TypeID)
                  continue;
              }
              DMTErrorWithCodeAndUserInfo(71, &unk_24E5A9C00);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_3;
            }
            v21 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
            if (v21)
              continue;
            break;
          }
        }

        DMTValidateProfileArray(v7->_eapClientConfiguration, CFSTR("PayloadCertificateAnchorUUID"), 1, a4);
        v28 = objc_claimAutoreleasedReturnValue();
        certificateAnchorUUID = v7->_certificateAnchorUUID;
        v7->_certificateAnchorUUID = (NSArray *)v28;

        if (*a4)
          goto LABEL_3;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v30 = v7->_certificateAnchorUUID;
        v31 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v41;
          while (2)
          {
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v41 != v33)
                objc_enumerationMutation(v30);
              v35 = *(id *)(*((_QWORD *)&v40 + 1) + 8 * j);
              if (v35)
              {
                v36 = v35;
                v37 = CFGetTypeID(v35);
                v38 = CFStringGetTypeID();

                if (v37 == v38)
                  continue;
              }
              DMTErrorWithCodeAndUserInfo(71, &unk_24E5A9C28);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_3;
            }
            v32 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
            if (v32)
              continue;
            break;
          }
        }

      }
      v14 = v7;
      goto LABEL_4;
    }
  }
LABEL_3:
  v14 = 0;
LABEL_4:

  return v14;
}

- (BOOL)autoJoin
{
  return self->_autoJoin;
}

- (NSString)encryptionType
{
  return self->_encryptionType;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (NSDictionary)eapClientConfiguration
{
  return self->_eapClientConfiguration;
}

- (NSArray)acceptEAPTypes
{
  return self->_acceptEAPTypes;
}

- (NSArray)certificateAnchorUUID
{
  return self->_certificateAnchorUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateAnchorUUID, 0);
  objc_storeStrong((id *)&self->_acceptEAPTypes, 0);
  objc_storeStrong((id *)&self->_eapClientConfiguration, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_encryptionType, 0);
}

@end
