@implementation HKClinicalSampleAccount

- (id)asClinicalGatewayWithBrand:(id)a3
{
  HKClinicalSampleAccountProvider *provider;
  id v4;
  void *v5;
  HKClinicalGateway *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HKClinicalGateway *v14;
  void *v15;
  HKClinicalGateway *v16;
  void *v18;

  provider = self->_provider;
  v4 = a3;
  -[HKClinicalSampleAccountProvider gateway](provider, "gateway");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [HKClinicalGateway alloc];
  objc_msgSend(v5, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "properties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("subtitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("description"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HKClinicalGatewayUnknownBaseURL();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "FHIRVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v6;
  v15 = (void *)v7;
  v16 = -[HKClinicalGateway initWithExternalID:title:subtitle:displayableDescription:phoneNumber:informationURL:passwordResetURL:patientPortalURL:signupURL:status:type:brand:country:baseURL:FHIRVersion:authSchemas:resourceSchemas:features:gatewayVersions:minCompatibleAPIVersion:](v14, "initWithExternalID:title:subtitle:displayableDescription:phoneNumber:informationURL:passwordResetURL:patientPortalURL:signupURL:status:type:brand:country:baseURL:FHIRVersion:authSchemas:resourceSchemas:features:gatewayVersions:minCompatibleAPIVersion:", v7, v8, v9, v11, 0, 0, 0, 0, 0, 1, 1, v4, CFSTR("US"), v12, v13,
          0,
          0,
          0,
          0,
          0);

  return v16;
}

- (id)asClinicalProviderWithBrand:(id)a3
{
  void *v4;
  HKClinicalProvider *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HKClinicalProvider *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  -[HKClinicalSampleAccount asClinicalGatewayWithBrand:](self, "asClinicalGatewayWithBrand:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [HKClinicalProvider alloc];
  -[HKClinicalSampleAccountProvider identifier](self->_provider, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalSampleAccountProvider title](self->_provider, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalSampleAccountProvider properties](self->_provider, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("subtitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalSampleAccountProvider properties](self->_provider, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("location"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "brand");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HKClinicalProvider initWithExternalID:title:subtitle:location:informationURL:brand:gateways:](v5, "initWithExternalID:title:subtitle:location:informationURL:brand:gateways:", v6, v7, v9, v11, 0, v12, v13);

  return v14;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (HKClinicalSampleAccountProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_storeStrong((id *)&self->_provider, a3);
}

- (NSArray)batches
{
  return self->_batches;
}

- (void)setBatches:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batches, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
