@implementation WFCellularCarrierDisclosureWarning

- (WFCellularCarrierDisclosureWarning)initWithDisplayedCarrierName:(id)a3
{
  id v5;
  WFCellularCarrierDisclosureWarning *v6;
  WFCellularCarrierDisclosureWarning *v7;
  WFCellularCarrierDisclosureWarning *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFCellularCarrierDisclosureWarning;
  v6 = -[WFCellularCarrierDisclosureWarning init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayedCarrierName, a3);
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
  WFLocalizedString(CFSTR("This shortcut is attempting to use information about your cellular network “%1$@”. This may be used to infer your device location."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCellularCarrierDisclosureWarning displayedCarrierName](self, "displayedCarrierName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (WFCellularCarrierDisclosureWarning)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WFCellularCarrierDisclosureWarning *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayedCarrierName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WFCellularCarrierDisclosureWarning initWithDisplayedCarrierName:](self, "initWithDisplayedCarrierName:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFCellularCarrierDisclosureWarning displayedCarrierName](self, "displayedCarrierName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("displayedCarrierName"));

}

- (NSString)displayedCarrierName
{
  return self->_displayedCarrierName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedCarrierName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
