@implementation BuddyCloudConfigAboutConfigurationContainerController

+ (id)defaultParagraphTextAttributes
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&unk_1002EEC70;
  location = 0;
  objc_storeStrong(&location, &stru_100284280);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)qword_1002EEC68;
}

- (BuddyCloudConfigAboutConfigurationContainerController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSBundle *v18;
  NSString *v19;
  BuddyCloudConfigAboutConfigurationContainerController *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  id v30;
  id location[2];
  id v32;

  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = 0;
  objc_storeStrong(&v30, a4);
  v5 = v32;
  v32 = 0;
  v29.receiver = v5;
  v29.super_class = (Class)BuddyCloudConfigAboutConfigurationContainerController;
  v32 = -[BuddyCloudConfigAboutConfigurationContainerController initWithNibName:bundle:](&v29, "initWithNibName:bundle:", location[0], v30);
  objc_storeStrong(&v32, v32);
  if (v32)
  {
    v6 = objc_msgSend(objc_alloc((Class)UIScrollView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v7 = (void *)*((_QWORD *)v32 + 2);
    *((_QWORD *)v32 + 2) = v6;

    objc_msgSend(*((id *)v32 + 2), "setScrollEnabled:", 1);
    *(_QWORD *)&v27 = 0x404C800000000000;
    *((_QWORD *)&v27 + 1) = qword_1002EEC50;
    *(_QWORD *)&v28 = 0x404C800000000000;
    *((_QWORD *)&v28 + 1) = qword_1002EEC50;
    v26 = v28;
    v25 = v27;
    v8 = (void *)*((_QWORD *)v32 + 2);
    v24 = v28;
    v23 = v27;
    objc_msgSend(v8, "setContentInset:", 57.0, *(double *)&qword_1002EEC50, 57.0, *(double *)&qword_1002EEC50);
    objc_msgSend(v32, "setView:", *((_QWORD *)v32 + 2));
    v9 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v10 = objc_msgSend(v9, "backgroundColor");
    objc_msgSend(*((id *)v32 + 2), "setBackgroundColor:", v10);

    v11 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v12 = (void *)*((_QWORD *)v32 + 3);
    *((_QWORD *)v32 + 3) = v11;

    v13 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    objc_msgSend(v13, "applyThemeToLabel:", *((_QWORD *)v32 + 3));

    objc_msgSend(*((id *)v32 + 3), "setNumberOfLines:", 0);
    objc_msgSend(*((id *)v32 + 3), "setText:", &stru_100284738);
    v22 = objc_alloc_init((Class)UIView);
    v14 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v15 = objc_msgSend(v14, "backgroundColor");
    objc_msgSend(v22, "setBackgroundColor:", v15);

    objc_msgSend(v22, "setAutoresizingMask:", 18);
    v16 = objc_msgSend(v32, "view");
    objc_msgSend(v16, "insertSubview:atIndex:", *((_QWORD *)v32 + 3), 0);

    v17 = objc_msgSend(v32, "view");
    objc_msgSend(v17, "insertSubview:belowSubview:", v22, *((_QWORD *)v32 + 3));

    v18 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v19 = -[NSBundle localizedStringForKey:value:table:](v18, "localizedStringForKey:value:table:", CFSTR("REMOTE_MANAGEMENT_TITLE"), &stru_100284738, CFSTR("Localizable"));
    objc_msgSend(v32, "setTitle:", v19);

    objc_storeStrong(&v22, 0);
  }
  v20 = (BuddyCloudConfigAboutConfigurationContainerController *)v32;
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v32, 0);
  return v20;
}

- (void)viewDidLayoutSubviews
{
  UIScrollView *v2;
  UILabel *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UILabel *v12;
  UIScrollView *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  SEL v21;
  BuddyCloudConfigAboutConfigurationContainerController *v22;

  v22 = self;
  v21 = a2;
  v20.receiver = self;
  v20.super_class = (Class)BuddyCloudConfigAboutConfigurationContainerController;
  -[BuddyCloudConfigAboutConfigurationContainerController viewDidLayoutSubviews](&v20, "viewDidLayoutSubviews");
  v2 = -[BuddyCloudConfigAboutConfigurationContainerController containerView](v22, "containerView");
  -[UIScrollView bounds](v2, "bounds");

  v3 = -[BuddyCloudConfigAboutConfigurationContainerController descriptionLabel](v22, "descriptionLabel");
  sub_1001AACD8();
  -[UILabel sizeThatFits:](v3, "sizeThatFits:", v4, v5);
  v18 = v6;
  v19 = v7;

  sub_1001AAD0C();
  v15 = v8;
  v14 = v9;
  v17 = v10;
  v16 = v11;
  v12 = -[BuddyCloudConfigAboutConfigurationContainerController descriptionLabel](v22, "descriptionLabel");
  -[UILabel setFrame:](v12, "setFrame:", v14, v15, v16, v17);

  v13 = -[BuddyCloudConfigAboutConfigurationContainerController containerView](v22, "containerView");
  -[UIScrollView setContentSize:](v13, "setContentSize:", v18, v19, *(_QWORD *)&v18, *(_QWORD *)&v19);

}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  NSBundle *v4;
  NSString *v5;
  id v6;
  id v7;
  UILabel *v8;
  id v9;
  objc_super v10;
  BOOL v11;
  SEL v12;
  BuddyCloudConfigAboutConfigurationContainerController *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BuddyCloudConfigAboutConfigurationContainerController;
  -[BuddyCloudConfigAboutConfigurationContainerController viewWillAppear:](&v10, "viewWillAppear:", a3);
  v3 = objc_alloc((Class)UIBarButtonItem);
  v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v5 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_100284738, CFSTR("Localizable"));
  v9 = objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 2, v13, "controllerDone:");

  v6 = -[BuddyCloudConfigAboutConfigurationContainerController navigationItem](v13, "navigationItem");
  objc_msgSend(v6, "setRightBarButtonItem:", v9);

  v7 = -[BuddyCloudConfigAboutConfigurationContainerController _descriptionText](v13, "_descriptionText");
  v8 = -[BuddyCloudConfigAboutConfigurationContainerController descriptionLabel](v13, "descriptionLabel");
  -[UILabel setAttributedText:](v8, "setAttributedText:", v7);

  objc_storeStrong(&v9, 0);
}

- (void)controllerDone:(id)a3
{
  id location[2];
  BuddyCloudConfigAboutConfigurationContainerController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyCloudConfigAboutConfigurationContainerController dismissViewControllerAnimated:completion:](v4, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_storeStrong(location, 0);
}

- (id)_descriptionText
{
  NSString *v2;
  id v3;
  NSString *v4;
  id v5;
  NSString *v6;
  id v7;
  NSString *v8;
  id v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  id v16;
  BOOL v17;
  CNPostalAddressFormatter *v18;
  NSString *v19;
  NSString *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSString *v25;
  id v26;
  id v27;
  NSString *v28;
  id v29;
  NSString *v30;
  id v31;
  id v32;
  NSString *v33;
  id v34;
  NSString *v35;
  id v36;
  id v37;
  NSBundle *v38;
  id v39;
  NSString *v40;
  NSString *v41;
  NSString *v42;
  id v43;
  id v44;
  id v45;
  char v47;
  NSString *v48;
  id v49;
  id v50;
  char v51;
  id v52;
  id location;
  id v54;
  id v55;
  char v56;
  id v57;
  id v58;
  id v59;
  id v60[2];
  BuddyCloudConfigAboutConfigurationContainerController *v61;

  v61 = self;
  v60[1] = (id)a2;
  v60[0] = objc_opt_new(NSMutableAttributedString);
  v59 = +[BuddyAppleIDTableHeaderView defaultDetailTextAttributes](BuddyAppleIDTableHeaderView, "defaultDetailTextAttributes");
  v58 = +[BuddyAppleIDTableHeaderView defaultTitleTextAttributes](BuddyAppleIDTableHeaderView, "defaultTitleTextAttributes");
  v57 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR("\n"), v59);
  v2 = -[BuddyCloudConfigAboutConfigurationContainerController organizationName](v61, "organizationName");

  if (v2)
  {
    v3 = objc_alloc((Class)NSMutableAttributedString);
    v4 = -[BuddyCloudConfigAboutConfigurationContainerController organizationName](v61, "organizationName");
    v5 = objc_msgSend(v3, "initWithString:attributes:", v4, v58);
    objc_msgSend(v60[0], "appendAttributedString:", v5);

    objc_msgSend(v60[0], "appendAttributedString:", v57);
  }
  v6 = -[BuddyCloudConfigAboutConfigurationContainerController organizationDepartment](v61, "organizationDepartment");

  if (v6)
  {
    v7 = objc_alloc((Class)NSMutableAttributedString);
    v8 = -[BuddyCloudConfigAboutConfigurationContainerController organizationDepartment](v61, "organizationDepartment");
    v9 = objc_msgSend(v7, "initWithString:attributes:", v8, v59);
    objc_msgSend(v60[0], "appendAttributedString:", v9);

    objc_msgSend(v60[0], "appendAttributedString:", v57);
  }
  v56 = 0;
  v55 = objc_opt_new(NSMutableDictionary);
  v10 = -[BuddyCloudConfigAboutConfigurationContainerController organizationAddressLine1](v61, "organizationAddressLine1");
  objc_msgSend(v55, "setValue:forKey:", v10, CNPostalAddressStreetKey);

  v11 = -[BuddyCloudConfigAboutConfigurationContainerController organizationAddressLine2](v61, "organizationAddressLine2");
  objc_msgSend(v55, "setValue:forKey:", v11, CNPostalAddressSubLocalityKey);

  v12 = -[BuddyCloudConfigAboutConfigurationContainerController organizationCity](v61, "organizationCity");
  objc_msgSend(v55, "setValue:forKey:", v12, CNPostalAddressCityKey);

  v13 = -[BuddyCloudConfigAboutConfigurationContainerController organizationRegion](v61, "organizationRegion");
  objc_msgSend(v55, "setValue:forKey:", v13, CNPostalAddressStateKey);

  v14 = -[BuddyCloudConfigAboutConfigurationContainerController organizationZipCode](v61, "organizationZipCode");
  objc_msgSend(v55, "setValue:forKey:", v14, CNPostalAddressPostalCodeKey);

  v15 = -[BuddyCloudConfigAboutConfigurationContainerController organizationCountry](v61, "organizationCountry");
  objc_msgSend(v55, "setValue:forKey:", v15, CNPostalAddressCountryKey);

  v54 = +[CNPostalAddress postalAddressWithDictionaryRepresentation:](CNPostalAddress, "postalAddressWithDictionaryRepresentation:", v55);
  if (v54)
  {
    location = +[CNPostalAddressFormatter stringFromPostalAddress:style:](CNPostalAddressFormatter, "stringFromPostalAddress:style:", v54, 0);
    if (objc_msgSend(location, "length"))
    {
      v16 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", location, v59);
      objc_msgSend(v60[0], "appendAttributedString:", v16);

      objc_msgSend(v60[0], "appendAttributedString:", v57);
      v56 = 1;
    }
    objc_storeStrong(&location, 0);
  }
  v51 = 0;
  v17 = 0;
  if ((v56 & 1) == 0)
  {
    v52 = -[BuddyCloudConfigAboutConfigurationContainerController organizationAddress](v61, "organizationAddress");
    v51 = 1;
    v17 = v52 != 0;
  }
  if ((v51 & 1) != 0)

  if (v17)
  {
    v18 = objc_opt_new(CNPostalAddressFormatter);
    v19 = -[BuddyCloudConfigAboutConfigurationContainerController organizationAddress](v61, "organizationAddress");
    v50 = -[CNPostalAddressFormatter postalAddressFromString:](v18, "postalAddressFromString:", v19);

    v49 = 0;
    if (v50)
    {
      v20 = +[CNPostalAddressFormatter stringFromPostalAddress:style:](CNPostalAddressFormatter, "stringFromPostalAddress:style:", v50, 0);
      v21 = v49;
      v49 = v20;

    }
    v22 = v60[0];
    v23 = objc_alloc((Class)NSAttributedString);
    v47 = 0;
    if (!v49)
    {
      v48 = -[BuddyCloudConfigAboutConfigurationContainerController organizationAddress](v61, "organizationAddress");
      v47 = 1;
    }
    v24 = objc_msgSend(v23, "initWithString:attributes:");
    objc_msgSend(v22, "appendAttributedString:", v24);

    if ((v47 & 1) != 0)
    objc_msgSend(v60[0], "appendAttributedString:", v57);
    objc_storeStrong(&v49, 0);
    objc_storeStrong(&v50, 0);
  }
  v25 = -[BuddyCloudConfigAboutConfigurationContainerController organizationSupportPhone](v61, "organizationSupportPhone");

  if (v25)
  {
    v26 = v60[0];
    v27 = objc_alloc((Class)NSMutableAttributedString);
    v28 = -[BuddyCloudConfigAboutConfigurationContainerController organizationSupportPhone](v61, "organizationSupportPhone");
    v29 = objc_msgSend(v27, "initWithString:attributes:", v28, v59);
    objc_msgSend(v26, "appendAttributedString:", v29);

    objc_msgSend(v60[0], "appendAttributedString:", v57);
  }
  v30 = -[BuddyCloudConfigAboutConfigurationContainerController organizationSupportEmail](v61, "organizationSupportEmail");

  if (v30)
  {
    v31 = v60[0];
    v32 = objc_alloc((Class)NSMutableAttributedString);
    v33 = -[BuddyCloudConfigAboutConfigurationContainerController organizationSupportEmail](v61, "organizationSupportEmail");
    v34 = objc_msgSend(v32, "initWithString:attributes:", v33, v59);
    objc_msgSend(v31, "appendAttributedString:", v34);

    objc_msgSend(v60[0], "appendAttributedString:", v57);
  }
  objc_msgSend(v60[0], "appendAttributedString:", v57);
  objc_msgSend(v60[0], "appendAttributedString:", v57);
  v35 = -[BuddyCloudConfigAboutConfigurationContainerController organizationName](v61, "organizationName");

  if (v35)
  {
    v36 = v60[0];
    v37 = objc_alloc((Class)NSMutableAttributedString);
    v38 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v39 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("REMOTE_MANAGEMENT_ABOUT_DESCRIPTION"));
    v40 = -[NSBundle localizedStringForKey:value:table:](v38, "localizedStringForKey:value:table:", v39, &stru_100284738, CFSTR("Localizable"));
    v41 = -[BuddyCloudConfigAboutConfigurationContainerController organizationName](v61, "organizationName");
    v42 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v40, v41);
    v43 = objc_msgSend((id)objc_opt_class(v61), "defaultParagraphTextAttributes");
    v44 = objc_msgSend(v37, "initWithString:attributes:", v42, v43);
    objc_msgSend(v36, "appendAttributedString:", v44);

    objc_msgSend(v60[0], "appendAttributedString:", v57);
  }
  v45 = v60[0];
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(v60, 0);
  return v45;
}

- (UIScrollView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)organizationDepartment
{
  return self->_organizationDepartment;
}

- (void)setOrganizationDepartment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)organizationAddress
{
  return self->_organizationAddress;
}

- (void)setOrganizationAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)organizationAddressLine1
{
  return self->_organizationAddressLine1;
}

- (void)setOrganizationAddressLine1:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)organizationAddressLine2
{
  return self->_organizationAddressLine2;
}

- (void)setOrganizationAddressLine2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)organizationCity
{
  return self->_organizationCity;
}

- (void)setOrganizationCity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)organizationRegion
{
  return self->_organizationRegion;
}

- (void)setOrganizationRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)organizationZipCode
{
  return self->_organizationZipCode;
}

- (void)setOrganizationZipCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)organizationCountry
{
  return self->_organizationCountry;
}

- (void)setOrganizationCountry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)organizationSupportPhone
{
  return self->_organizationSupportPhone;
}

- (void)setOrganizationSupportPhone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)organizationSupportEmail
{
  return self->_organizationSupportEmail;
}

- (void)setOrganizationSupportEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)isSupervised
{
  return self->_isSupervised;
}

- (void)setIsSupervised:(BOOL)a3
{
  self->_isSupervised = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizationSupportEmail, 0);
  objc_storeStrong((id *)&self->_organizationSupportPhone, 0);
  objc_storeStrong((id *)&self->_organizationCountry, 0);
  objc_storeStrong((id *)&self->_organizationZipCode, 0);
  objc_storeStrong((id *)&self->_organizationRegion, 0);
  objc_storeStrong((id *)&self->_organizationCity, 0);
  objc_storeStrong((id *)&self->_organizationAddressLine2, 0);
  objc_storeStrong((id *)&self->_organizationAddressLine1, 0);
  objc_storeStrong((id *)&self->_organizationAddress, 0);
  objc_storeStrong((id *)&self->_organizationDepartment, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
