@implementation DMCMDMSignoutSpecifierProvider

- (id)specifiers
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  objc_super v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)DMCMDMSignoutSpecifierProvider;
  -[DMCSpecifierProvider specifiers](&v10, sel_specifiers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v9.receiver = self;
    v9.super_class = (Class)DMCMDMSignoutSpecifierProvider;
    -[DMCSpecifierProvider specifiers](&v9, sel_specifiers);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", *MEMORY[0x24BE61428]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    -[DMCMDMSignoutSpecifierProvider _specifierForSignoutButton](self, "_specifierForSignoutButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCSpecifierProvider cachedSpecifiers:](self, "cachedSpecifiers:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
}

- (id)_specifierForSignoutButton
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  DMCLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteButtonSpecifierWithName:target:action:", v4, self, sel__specifierForMDMProfileWasTapped_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setProperty:forKey:", *MEMORY[0x24BE61420], *MEMORY[0x24BE75AC0]);
  return v5;
}

- (void)_specifierForMDMProfileWasTapped:(id)a3
{
  id v4;
  DMCEnrollmentInterface *v5;
  void *v6;
  DMCEnrollmentInterface *v7;
  DMCEnrollmentInterface *enrollmentInterface;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];

  v4 = a3;
  if (!self->_enrollmentInterface)
  {
    v5 = [DMCEnrollmentInterface alloc];
    -[DMCMDMSignoutSpecifierProvider viewController](self, "viewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __67__DMCMDMSignoutSpecifierProvider__specifierForMDMProfileWasTapped___block_invoke;
    v16[3] = &unk_24D52EA88;
    v16[4] = self;
    v7 = -[DMCEnrollmentInterface initFromViewController:enrollmentResultBlock:](v5, "initFromViewController:enrollmentResultBlock:", v6, v16);
    enrollmentInterface = self->_enrollmentInterface;
    self->_enrollmentInterface = v7;

  }
  -[DMCSpecifierProvider rmAccount](self, "rmAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dmc_altDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "length"))
  {
    -[DMCSpecifierProvider accountManager](self, "accountManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accounts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dmc_altDSID");
    v15 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v15;
  }
  -[DMCEnrollmentInterface startUnenrollmentWithAltDSID:silent:](self->_enrollmentInterface, "startUnenrollmentWithAltDSID:silent:", v10, 0);

}

void __67__DMCMDMSignoutSpecifierProvider__specifierForMDMProfileWasTapped___block_invoke(uint64_t a1, char a2, char a3)
{
  _QWORD v3[5];
  char v4;

  if ((a3 & 1) == 0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __67__DMCMDMSignoutSpecifierProvider__specifierForMDMProfileWasTapped___block_invoke_2;
    v3[3] = &unk_24D52EB40;
    v4 = a2;
    v3[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v3);
  }
}

uint64_t __67__DMCMDMSignoutSpecifierProvider__specifierForMDMProfileWasTapped___block_invoke_2(uint64_t result)
{
  _QWORD v1[5];

  if (*(_BYTE *)(result + 40))
  {
    v1[0] = MEMORY[0x24BDAC760];
    v1[1] = 3221225472;
    v1[2] = __67__DMCMDMSignoutSpecifierProvider__specifierForMDMProfileWasTapped___block_invoke_3;
    v1[3] = &unk_24D52E500;
    v1[4] = *(_QWORD *)(result + 32);
    return objc_msgSend(MEMORY[0x24BDF6F98], "_performWithoutDeferringTransitions:", v1);
  }
  return result;
}

void __67__DMCMDMSignoutSpecifierProvider__specifierForMDMProfileWasTapped___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popViewControllerAnimated:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "popRecursivelyToRootController");

    objc_msgSend(*(id *)(a1 + 32), "viewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "viewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "containsObject:", v9);

    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *MEMORY[0x24BE63EA0]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "openSensitiveURL:withOptions:", v11, 0);

    }
  }
}

- (DMCEnrollmentInterface)enrollmentInterface
{
  return self->_enrollmentInterface;
}

- (void)setEnrollmentInterface:(id)a3
{
  objc_storeStrong((id *)&self->_enrollmentInterface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentInterface, 0);
}

@end
