@implementation WFSSIDDisclosureWarning

- (WFSSIDDisclosureWarning)initWithDisplayedNetworkName:(id)a3
{
  id v5;
  WFSSIDDisclosureWarning *v6;
  WFSSIDDisclosureWarning *v7;
  WFSSIDDisclosureWarning *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSSIDDisclosureWarning;
  v6 = -[WFSSIDDisclosureWarning init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayedNetworkName, a3);
    v8 = v7;
  }

  return v7;
}

- (id)localizedMessage
{
  void *v3;
  int v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasCapability:", *MEMORY[0x24BEC1888]);

  v5 = (void *)MEMORY[0x24BDD17C8];
  if (v4)
    v6 = CFSTR("This shortcut is attempting to use your WLAN network name “%1$@”. This may be used to infer your device location.");
  else
    v6 = CFSTR("This shortcut is attempting to use your Wi-Fi network name “%1$@”. This may be used to infer your device location.");
  WFLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSSIDDisclosureWarning displayedNetworkName](self, "displayedNetworkName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (WFSSIDDisclosureWarning)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WFSSIDDisclosureWarning *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayedNetworkName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WFSSIDDisclosureWarning initWithDisplayedNetworkName:](self, "initWithDisplayedNetworkName:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFSSIDDisclosureWarning displayedNetworkName](self, "displayedNetworkName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("displayedNetworkName"));

}

- (NSString)displayedNetworkName
{
  return self->_displayedNetworkName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedNetworkName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
