@implementation CDPLocalSecretEntryPane

- (void)setTitle:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x24BE1A458];
  v5 = a3;
  objc_msgSend(v4, "builderForKey:", CFSTR("LOCAL_SECRET_ENTRY_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addDeviceClass:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSecretType:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedString");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[CDPPaneHeaderView textLabel](self->super._headerView, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v13);

  -[CDPPaneHeaderView detailTextLabel](self->super._headerView, "detailTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v5);

  -[CDPPaneHeaderView makeAllTheTextFits](self->super._headerView, "makeAllTheTextFits");
  -[CDPPaneHeaderView sizeToFit](self->super._headerView, "sizeToFit");

}

- (double)desiredMinPinHeight
{
  return 132.0;
}

@end
