@implementation CCUISatelliteMenuModuleViewController

- (CCUISatelliteMenuModuleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CCUISatelliteMenuModuleViewController *v4;
  const char *v5;
  CCUISatelliteMenuModuleViewController *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CCUISatelliteMenuModuleViewController;
  v4 = -[CCUIAlwaysExpandedMenuModuleViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, a3, a4);
  v6 = v4;
  if (v4)
  {
    objc_msgSend_setMinimumMenuItems_(v4, v5, 2);
    objc_msgSend_setShouldProvideOwnPlatter_(v6, v7, 1);
    objc_msgSend_setIndentation_(v6, v8, 2);
    objc_msgSend_setVisibleMenuItems_(v6, v9, v10, 2.0);
  }
  return v6;
}

- (void)viewDidLoad
{
  const char *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUISatelliteMenuModuleViewController;
  -[CCUIMenuModuleViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend__setupMenuItems(self, v3, v4);
}

- (void)_setupMenuItems
{
  id v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE19B60]);
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = objc_opt_class();
  objc_msgSend_bundleForClass_(v4, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v7, v8, (uint64_t)CFSTR("CONTROL_CENTER_SATELLITE_MENU_DISCONNECT"), &stru_24FFCAEF8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_230FB1104;
  v26[3] = &unk_24FFCABE8;
  v26[4] = self;
  v12 = (void *)objc_msgSend_initWithTitle_identifier_handler_(v3, v11, (uint64_t)v9, CFSTR("disconnect"), v26);

  v13 = objc_alloc(MEMORY[0x24BE19B60]);
  v14 = (void *)MEMORY[0x24BDD1488];
  v15 = objc_opt_class();
  objc_msgSend_bundleForClass_(v14, v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v17, v18, (uint64_t)CFSTR("CONTROL_CENTER_SATELLITE_MENU_DISABLE"), &stru_24FFCAEF8, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v10;
  v25[1] = 3221225472;
  v25[2] = sub_230FB114C;
  v25[3] = &unk_24FFCABE8;
  v25[4] = self;
  v21 = (void *)objc_msgSend_initWithTitle_identifier_handler_(v13, v20, (uint64_t)v19, CFSTR("disable"), v25);

  v27[0] = v12;
  v27[1] = v21;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v22, (uint64_t)v27, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMenuItems_(self, v24, (uint64_t)v23);

}

- (CCUISatelliteMenuModuleViewControllerDelegate)delegate
{
  return (CCUISatelliteMenuModuleViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
