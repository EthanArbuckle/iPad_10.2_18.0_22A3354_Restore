@implementation IRTTRURLQuery

- (IRTTRURLQuery)init
{
  IRTTRURLQuery *v2;
  IRTTRURLQuery *v3;
  NSString *classification;
  NSString *componentName;
  NSString *componentVersion;
  NSString *componentID;
  NSString *reproducibility;
  IRTTRURLQuery *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IRTTRURLQuery;
  v2 = -[IRTTRURLQuery init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    classification = v2->_classification;
    v2->_classification = (NSString *)CFSTR("UI/Usability");

    componentName = v3->_componentName;
    v3->_componentName = (NSString *)CFSTR("Coriander LiveOn");

    componentVersion = v3->_componentVersion;
    v3->_componentVersion = (NSString *)CFSTR("All");

    componentID = v3->_componentID;
    v3->_componentID = (NSString *)CFSTR("1609607");

    reproducibility = v3->_reproducibility;
    v3->_reproducibility = (NSString *)CFSTR("I Didn't Try");

    v9 = v3;
  }

  return v3;
}

- (id)build
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(CFSTR("tap-to-radar://new"), "mutableCopy");
  -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](self->_title, "stringByAddingPercentEncodingWithAllowedCharacters:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("?Title=%@"), v5);

  -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](self->_classification, "stringByAddingPercentEncodingWithAllowedCharacters:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("&Classification=%@"), v6);

  -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](self->_componentName, "stringByAddingPercentEncodingWithAllowedCharacters:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("&ComponentName=%@"), v7);

  -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](self->_componentVersion, "stringByAddingPercentEncodingWithAllowedCharacters:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("&ComponentVersion=%@"), v8);

  -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](self->_componentID, "stringByAddingPercentEncodingWithAllowedCharacters:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("&ComponentID=%@"), v9);

  -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](self->_reproducibility, "stringByAddingPercentEncodingWithAllowedCharacters:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("&Reproducibility=%@"), v10);

  -[NSArray componentsJoinedByString:](self->_extensionIdentifiers, "componentsJoinedByString:", CFSTR(","));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("&ExtensionIdentifiers=%@"), v12);

  -[NSArray componentsJoinedByString:](self->_remoteDeviceSelections, "componentsJoinedByString:", CFSTR(","));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAddingPercentEncodingWithAllowedCharacters:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("&RemoteDeviceSelections=%@"), v14);

  -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](self->_radarDescription, "stringByAddingPercentEncodingWithAllowedCharacters:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("&Description=%@"), v15);

  v16 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl(&dword_23FFBA000, v16, OS_LOG_TYPE_INFO, "#ttr, URL: %@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)classification
{
  return self->_classification;
}

- (NSString)componentName
{
  return self->_componentName;
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (NSString)componentID
{
  return self->_componentID;
}

- (NSString)reproducibility
{
  return self->_reproducibility;
}

- (NSArray)extensionIdentifiers
{
  return self->_extensionIdentifiers;
}

- (void)setExtensionIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)remoteDeviceSelections
{
  return self->_remoteDeviceSelections;
}

- (void)setRemoteDeviceSelections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (void)setRadarDescription:(id)a3
{
  objc_storeStrong((id *)&self->_radarDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_remoteDeviceSelections, 0);
  objc_storeStrong((id *)&self->_extensionIdentifiers, 0);
  objc_storeStrong((id *)&self->_reproducibility, 0);
  objc_storeStrong((id *)&self->_componentID, 0);
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_classification, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
