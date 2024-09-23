@implementation CMSExtensionQueuesContentProtectionEndpointConfiguration

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CMSExtensionEndpointConfiguration endpointURL](self, "endpointURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMSExtensionEndpointConfiguration groupHeaders](self, "groupHeaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMSExtensionEndpointConfiguration headers](self, "headers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<CMSExtensionQueuesContentProtectionEndpointConfiguration: endpointURL:%@ groupHeaders:%@ headers:%@ keySystem:%@ certURL:%@>"), v4, v5, v6, self->_keySystemIdentifier, self->_fairPlayKeySystemCertificateUrl);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CMSExtensionQueuesContentProtectionEndpointConfiguration)init
{
  void *v3;
  CMSExtensionQueuesContentProtectionEndpointConfiguration *v4;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", &stru_24E1CDD40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CMSExtensionQueuesContentProtectionEndpointConfiguration initWithDictionary:endpoint:baseURL:groupHeaders:](self, "initWithDictionary:endpoint:baseURL:groupHeaders:", MEMORY[0x24BDBD1B8], &stru_24E1CDD40, v3, MEMORY[0x24BDBD1B8]);

  return v4;
}

- (CMSExtensionQueuesContentProtectionEndpointConfiguration)initWithDictionary:(id)a3 endpoint:(id)a4 baseURL:(id)a5 groupHeaders:(id)a6
{
  id v10;
  id v11;
  id v12;
  CMSExtensionQueuesContentProtectionEndpointConfiguration *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  NSURL *fairPlayKeySystemCertificateUrl;
  CMSExtensionQueuesContentProtectionEndpointConfiguration *v21;
  NSObject *v23;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CMSExtensionQueuesContentProtectionEndpointConfiguration;
  v13 = -[CMSExtensionEndpointConfiguration initWithDictionary:endpoint:baseURL:groupHeaders:](&v24, sel_initWithDictionary_endpoint_baseURL_groupHeaders_, v10, v11, v12, a6);
  if (!v13)
    goto LABEL_7;
  objc_msgSend(v10, "cmsOptionalDictionaryForKey:", CFSTR("cks"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    _CMSILogingFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CMSExtensionQueuesContentProtectionEndpointConfiguration initWithDictionary:endpoint:baseURL:groupHeaders:].cold.1();
    goto LABEL_13;
  }
  v15 = v14;
  -[NSObject cmsOptionalStringForKey:](v14, "cmsOptionalStringForKey:", CFSTR("keySystem"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16 || (objc_msgSend(v16, "isEqualToString:", CFSTR("ContentKeySystemFairPlayStreaming")) & 1) == 0)
  {
    _CMSILogingFacility();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CMSExtensionQueuesContentProtectionEndpointConfiguration initWithDictionary:endpoint:baseURL:groupHeaders:].cold.2();
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v13->_keySystemIdentifier, (id)*MEMORY[0x24BDB1BB8]);
  -[NSObject cmsOptionalStringForKey:](v15, "cmsOptionalStringForKey:", CFSTR("certUrl"));
  v18 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject length](v18, "length"))
  {
    _CMSILogingFacility();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[CMSExtensionQueuesContentProtectionEndpointConfiguration initWithDictionary:endpoint:baseURL:groupHeaders:].cold.3();

LABEL_10:
LABEL_13:

    v21 = 0;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:relativeToURL:", v18, v12);
  v19 = objc_claimAutoreleasedReturnValue();
  fairPlayKeySystemCertificateUrl = v13->_fairPlayKeySystemCertificateUrl;
  v13->_fairPlayKeySystemCertificateUrl = (NSURL *)v19;

LABEL_7:
  v21 = v13;
LABEL_14:

  return v21;
}

- (NSString)keySystemIdentifier
{
  return self->_keySystemIdentifier;
}

- (void)setKeySystemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_keySystemIdentifier, a3);
}

- (NSURL)fairPlayKeySystemCertificateUrl
{
  return self->_fairPlayKeySystemCertificateUrl;
}

- (void)setFairPlayKeySystemCertificateUrl:(id)a3
{
  objc_storeStrong((id *)&self->_fairPlayKeySystemCertificateUrl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fairPlayKeySystemCertificateUrl, 0);
  objc_storeStrong((id *)&self->_keySystemIdentifier, 0);
}

- (void)initWithDictionary:endpoint:baseURL:groupHeaders:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
}

- (void)initWithDictionary:endpoint:baseURL:groupHeaders:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_1();
}

- (void)initWithDictionary:endpoint:baseURL:groupHeaders:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
}

@end
