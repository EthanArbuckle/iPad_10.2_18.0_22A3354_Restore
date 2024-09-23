@implementation ENRegionServerNKDConfiguration

- (void)encodeWithCoder:(id)a3
{
  NSString *healthAuthorityID;
  id v5;

  healthAuthorityID = self->_healthAuthorityID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", healthAuthorityID, CFSTR("healthAuthorityID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_region, CFSTR("region"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tekLocalDownloadBaseURL, CFSTR("tekLocalDownloadBasePath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tekLocalDownloadIndexURL, CFSTR("tekLocalDownloadIndexFile"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("tekPublishInterval"), self->_tekPublishInterval);
  objc_msgSend(v5, "encodeObject:forKey:", self->_tekUploadURL, CFSTR("tekUploadURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_acceptedReportTypes, CFSTR("acceptedReportTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_testVerificationAPIKey, CFSTR("testVerificationAPIKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_testVerificationCertificateURL, CFSTR("testVerificationCertificateURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_testVerificationURL, CFSTR("testVerificationURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_travelerDownloadConfigurations, CFSTR("tekTravelerDownloadURLs"));

}

- (ENRegionServerNKDConfiguration)initWithServerResponseDictionary:(id)a3
{
  id v4;
  ENRegionServerNKDConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSString *healthAuthorityID;
  void *v9;
  void *v10;
  uint64_t v11;
  ENRegion *region;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSURL *tekUploadURL;
  char Int64Ranged;
  char v21;
  void *v22;
  uint64_t v23;
  NSArray *acceptedReportTypes;
  uint64_t v25;
  NSString *testVerificationAPIKey;
  void *v27;
  uint64_t v28;
  NSURL *testVerificationCertificateURL;
  uint64_t v30;
  NSURL *testVerificationURL;
  void *v32;
  void *travelerDownloadConfigurations;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  ENRegionTravelerServerDownloadConfiguration *v39;
  uint64_t v40;
  NSArray *v41;
  ENRegionServerNKDConfiguration *v42;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  int v54;
  objc_super v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)ENRegionServerNKDConfiguration;
  v5 = -[ENRegionServerNKDConfiguration init](&v55, sel_init);
  if (!v5)
  {
    v42 = 0;
    goto LABEL_46;
  }
  v54 = 0;
  CFDictionaryGetTypeID();
  CFDictionaryGetTypedValue();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v7 = objc_claimAutoreleasedReturnValue();
  healthAuthorityID = v5->_healthAuthorityID;
  v5->_healthAuthorityID = (NSString *)v7;

  +[ENRegion regionFromServerResponseDictionary:](ENRegion, "regionFromServerResponseDictionary:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    v42 = 0;
    goto LABEL_45;
  }
  v11 = objc_msgSend(v9, "copy");
  region = v5->_region;
  v5->_region = (ENRegion *)v11;

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    v42 = 0;
    goto LABEL_44;
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v42 = 0;
    goto LABEL_43;
  }
  objc_storeStrong((id *)&v5->_tekLocalDownloadBaseURL, v14);
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v42 = 0;
    goto LABEL_42;
  }
  v49 = v16;
  objc_storeStrong((id *)&v5->_tekLocalDownloadIndexURL, v16);
  v5->_tekPublishInterval = (double)(3600 * CFDictionaryGetInt64Ranged());
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v42 = 0;
      goto LABEL_41;
    }
    tekUploadURL = v5->_tekUploadURL;
    v5->_tekUploadURL = (NSURL *)v18;

  }
  v47 = v14;
  v48 = v13;

  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (v54)
    v21 = 0;
  else
    v21 = Int64Ranged;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", &unk_24C396E00);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v22;
  if ((v21 & 2) != 0)
  {
    objc_msgSend(v22, "addObject:", &unk_24C396E18);
    if ((v21 & 4) == 0)
    {
LABEL_14:
      if ((v21 & 8) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((v21 & 4) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(v17, "addObject:", &unk_24C396E30);
  if ((v21 & 8) != 0)
LABEL_15:
    objc_msgSend(v17, "addObject:", &unk_24C396E48);
LABEL_16:
  v46 = v15;
  if ((v21 & 0x10) != 0)
    objc_msgSend(v17, "addObject:", &unk_24C396E60);
  v23 = objc_msgSend(v17, "copy");
  acceptedReportTypes = v5->_acceptedReportTypes;
  v5->_acceptedReportTypes = (NSArray *)v23;

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v25 = objc_claimAutoreleasedReturnValue();
  testVerificationAPIKey = v5->_testVerificationAPIKey;
  v5->_testVerificationAPIKey = (NSString *)v25;

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
      goto LABEL_47;
    testVerificationCertificateURL = v5->_testVerificationCertificateURL;
    v5->_testVerificationCertificateURL = (NSURL *)v28;

  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
LABEL_24:

    CFArrayGetTypeID();
    CFDictionaryGetTypedValue();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v32;
    if (v54)
    {
      travelerDownloadConfigurations = v5->_travelerDownloadConfigurations;
      v5->_travelerDownloadConfigurations = (NSArray *)MEMORY[0x24BDBD1A8];
    }
    else
    {
      v44 = v6;
      v45 = v4;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v32, "count"));
      travelerDownloadConfigurations = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v34 = v27;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v51 != v37)
              objc_enumerationMutation(v34);
            v39 = -[ENRegionTravelerServerDownloadConfiguration initWithServerResponseDictionary:]([ENRegionTravelerServerDownloadConfiguration alloc], "initWithServerResponseDictionary:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
            if (v39)
              objc_msgSend(travelerDownloadConfigurations, "addObject:", v39);

          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        }
        while (v36);
      }

      v40 = objc_msgSend(travelerDownloadConfigurations, "copy");
      v41 = v5->_travelerDownloadConfigurations;
      v5->_travelerDownloadConfigurations = (NSArray *)v40;

      v6 = v44;
      v4 = v45;
    }

    v42 = v5;
    goto LABEL_40;
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v27);
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    testVerificationURL = v5->_testVerificationURL;
    v5->_testVerificationURL = (NSURL *)v30;

    goto LABEL_24;
  }
LABEL_47:
  v42 = 0;
LABEL_40:
  v14 = v47;
  v13 = v48;

  v15 = v46;
LABEL_41:

  v16 = v49;
LABEL_42:

LABEL_43:
LABEL_44:

LABEL_45:
LABEL_46:

  return v42;
}

- (ENRegionServerNKDConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  ENRegionServerNKDConfiguration *v18;
  uint64_t v19;
  NSString *healthAuthorityID;
  double v21;
  uint64_t v22;
  NSURL *tekUploadURL;
  uint64_t v24;
  NSString *testVerificationAPIKey;
  uint64_t v26;
  NSURL *testVerificationCertificateURL;
  uint64_t v28;
  NSURL *testVerificationURL;
  uint64_t v30;
  NSArray *travelerDownloadConfigurations;
  ENRegionServerNKDConfiguration *v32;
  id obj;
  objc_super v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tekLocalDownloadBasePath"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (obj)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tekLocalDownloadIndexFile"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("region"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)MEMORY[0x24BDBCF20];
        v37[0] = objc_opt_class();
        v37[1] = objc_opt_class();
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setWithArray:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("tekTravelerDownloadURLs"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)MEMORY[0x24BDBCF20];
          v36[0] = objc_opt_class();
          v36[1] = objc_opt_class();
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setWithArray:", v12);
          v13 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("acceptedReportTypes"));
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v14;
          if (v14)
            v16 = (void *)v14;
          else
            v16 = &unk_24C397118;
          v17 = v16;

          v35.receiver = self;
          v35.super_class = (Class)ENRegionServerNKDConfiguration;
          v18 = -[ENRegionServerNKDConfiguration init](&v35, sel_init);
          if (v18)
          {
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("healthAuthorityID"));
            v19 = objc_claimAutoreleasedReturnValue();
            healthAuthorityID = v18->_healthAuthorityID;
            v18->_healthAuthorityID = (NSString *)v19;

            objc_storeStrong((id *)&v18->_region, v6);
            objc_storeStrong((id *)&v18->_tekLocalDownloadBaseURL, obj);
            objc_storeStrong((id *)&v18->_tekLocalDownloadIndexURL, v5);
            objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("tekPublishInterval"));
            v18->_tekPublishInterval = v21;
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tekUploadURL"));
            v22 = objc_claimAutoreleasedReturnValue();
            tekUploadURL = v18->_tekUploadURL;
            v18->_tekUploadURL = (NSURL *)v22;

            objc_storeStrong((id *)&v18->_acceptedReportTypes, v16);
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("testVerificationAPIKey"));
            v24 = objc_claimAutoreleasedReturnValue();
            testVerificationAPIKey = v18->_testVerificationAPIKey;
            v18->_testVerificationAPIKey = (NSString *)v24;

            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("testVerificationCertificateURL"));
            v26 = objc_claimAutoreleasedReturnValue();
            testVerificationCertificateURL = v18->_testVerificationCertificateURL;
            v18->_testVerificationCertificateURL = (NSURL *)v26;

            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("testVerificationURL"));
            v28 = objc_claimAutoreleasedReturnValue();
            testVerificationURL = v18->_testVerificationURL;
            v18->_testVerificationURL = (NSURL *)v28;

            v30 = objc_msgSend(v10, "copy");
            travelerDownloadConfigurations = v18->_travelerDownloadConfigurations;
            v18->_travelerDownloadConfigurations = (NSArray *)v30;

          }
          self = v18;

          v32 = self;
          v9 = (void *)v13;
        }
        else
        {
          v32 = 0;
        }

      }
      else
      {
        v32 = 0;
      }

    }
    else
    {
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENRegion)region
{
  return self->_region;
}

- (NSURL)tekLocalDownloadBaseURL
{
  return self->_tekLocalDownloadBaseURL;
}

- (NSURL)tekLocalDownloadIndexURL
{
  return self->_tekLocalDownloadIndexURL;
}

- (double)tekPublishInterval
{
  return self->_tekPublishInterval;
}

- (NSURL)tekUploadURL
{
  return self->_tekUploadURL;
}

- (NSString)healthAuthorityID
{
  return self->_healthAuthorityID;
}

- (NSArray)acceptedReportTypes
{
  return self->_acceptedReportTypes;
}

- (NSString)testVerificationAPIKey
{
  return self->_testVerificationAPIKey;
}

- (NSURL)testVerificationCertificateURL
{
  return self->_testVerificationCertificateURL;
}

- (NSURL)testVerificationURL
{
  return self->_testVerificationURL;
}

- (NSArray)travelerDownloadConfigurations
{
  return self->_travelerDownloadConfigurations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_travelerDownloadConfigurations, 0);
  objc_storeStrong((id *)&self->_testVerificationURL, 0);
  objc_storeStrong((id *)&self->_testVerificationCertificateURL, 0);
  objc_storeStrong((id *)&self->_testVerificationAPIKey, 0);
  objc_storeStrong((id *)&self->_acceptedReportTypes, 0);
  objc_storeStrong((id *)&self->_healthAuthorityID, 0);
  objc_storeStrong((id *)&self->_tekUploadURL, 0);
  objc_storeStrong((id *)&self->_tekLocalDownloadIndexURL, 0);
  objc_storeStrong((id *)&self->_tekLocalDownloadBaseURL, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
