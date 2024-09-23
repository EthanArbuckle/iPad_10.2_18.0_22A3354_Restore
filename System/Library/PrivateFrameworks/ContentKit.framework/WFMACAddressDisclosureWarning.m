@implementation WFMACAddressDisclosureWarning

- (WFMACAddressDisclosureWarning)initWithDisplayedMACAddress:(id)a3
{
  id v5;
  WFMACAddressDisclosureWarning *v6;
  WFMACAddressDisclosureWarning *v7;
  WFMACAddressDisclosureWarning *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFMACAddressDisclosureWarning;
  v6 = -[WFMACAddressDisclosureWarning init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayedMACAddress, a3);
    v8 = v7;
  }

  return v7;
}

- (id)localizedMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("This shortcut is attempting to use your MAC address “%1$@”. This may be used to infer your device identity or location."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMACAddressDisclosureWarning displayedMACAddress](self, "displayedMACAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (WFMACAddressDisclosureWarning)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WFMACAddressDisclosureWarning *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayedMACAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WFMACAddressDisclosureWarning initWithDisplayedMACAddress:](self, "initWithDisplayedMACAddress:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFMACAddressDisclosureWarning displayedMACAddress](self, "displayedMACAddress");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("displayedMACAddress"));

}

- (NSString)displayedMACAddress
{
  return self->_displayedMACAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedMACAddress, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
