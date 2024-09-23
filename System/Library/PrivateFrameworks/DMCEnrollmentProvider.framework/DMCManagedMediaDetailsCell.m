@implementation DMCManagedMediaDetailsCell

- (void)setManagedBook:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_BOOK_RESTRICTIONS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(v4, "managedBookConfigurationInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCItemSummaryCell createViewWithDescriptors:](self, "createViewWithDescriptors:", v7);

}

- (void)setManagedApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[DMCManagedMediaDetailsCell localizedManagedAppRestrictionsTitle](DMCManagedMediaDetailsCell, "localizedManagedAppRestrictionsTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(v4, "managedAppConfigurationInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCItemSummaryCell createViewWithDescriptors:](self, "createViewWithDescriptors:", v7);

}

+ (id)localizedManagedAppRestrictionsTitle
{
  return DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APP_RESTRICTIONS"));
}

@end
