@implementation ACUIIdentityPickerViewController

- (void)viewDidLoad
{
  uint64_t v2;
  NSString *property;
  uint64_t v4;
  uint64_t v5;
  NSArray *emailAddresses;
  ACUIIdentityPickerViewController *v7;
  id v8;
  id v9;
  ACUIIdentityPickerViewController *v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  char v15;
  id v16;
  char v17;
  id v18;
  id WeakRetained;
  char v20;
  id v21;
  unsigned __int8 isKindOfClass;
  NSString *v23;
  id v24;
  unsigned __int8 v25;
  uint64_t v26;
  id v27;
  char v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  void (*v35)(id *);
  void *v36;
  ACUIIdentityPickerViewController *v37;
  objc_super v38;
  char v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  SEL v44;
  ACUIIdentityPickerViewController *v45;

  v45 = self;
  v44 = a2;
  v43 = (id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ (int)*MEMORY[0x1E0D80628]), "target");
  v42 = &unk_1EFF6F458;
  v25 = 0;
  if (v43)
    v25 = objc_msgSend(v43, "conformsToProtocol:", v42);
  if (((v25 ^ 1) & 1) != 0)
  {
    v24 = (id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = NSStringFromProtocol((Protocol *)v42);
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v44, v45, CFSTR("ACUIIdentityPickerViewController.m"), 125, CFSTR("target must conform to %@"), v23);

  }
  objc_storeWeak((id *)&v45->_delegate, v43);
  v41 = (id)objc_msgSend(*(id *)((char *)&v45->super.super.super.super.super.isa+ (int)*MEMORY[0x1E0D80628]), "propertyForKey:", *MEMORY[0x1E0D808B0]);
  isKindOfClass = 0;
  if (v41)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  if (((isKindOfClass ^ 1) & 1) != 0)
  {
    v21 = (id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v44, v45, CFSTR("ACUIIdentityPickerViewController.m"), 129, CFSTR("%@ must be an NSString"), v41);

  }
  v2 = objc_msgSend(v41, "copy");
  property = v45->_property;
  v45->_property = (NSString *)v2;

  v40 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&v45->_delegate);
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    v18 = objc_loadWeakRetained((id *)&v45->_delegate);
    v40 = objc_msgSend(v18, "configurationOptionsForIdentityPickerController:", v45);

  }
  else
  {
    v16 = objc_loadWeakRetained((id *)&v45->_delegate);
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      v14 = objc_loadWeakRetained((id *)&v45->_delegate);
      v15 = objc_msgSend(v14, "allowEditingForIdentityPickerController:", v45);

      v39 = v15 & 1;
      v4 = 3;
      if ((v15 & 1) == 0)
        v4 = 0;
      v40 = v4;
    }
  }
  v45->_userInteractiveSwitch = (v40 & 1) != 0;
  v45->_userInteractiveIdentityList = (v40 & 2) != 0;
  v45->_allowIdentitySelectionForDisabledSwitch = (v40 & 4) != 0;
  v13 = objc_loadWeakRetained((id *)&v45->_delegate);
  v12 = (id)objc_msgSend(v13, "emailAddressesForIdentityPickerController:", v45);
  v5 = objc_msgSend(v12, "copy");
  emailAddresses = v45->_emailAddresses;
  v45->_emailAddresses = (NSArray *)v5;

  v38.receiver = v45;
  v38.super_class = (Class)ACUIIdentityPickerViewController;
  -[ACUIIdentityPickerViewController viewDidLoad](&v38, sel_viewDidLoad);
  if (v45->_userInteractiveIdentityList || v45->_userInteractiveSwitch)
  {
    queue = dispatch_get_global_queue(0, 0);
    v32 = MEMORY[0x1E0C809B0];
    v33 = -1073741824;
    v34 = 0;
    v35 = __47__ACUIIdentityPickerViewController_viewDidLoad__block_invoke;
    v36 = &unk_1E9A155C8;
    v37 = v45;
    dispatch_async(queue, &v32);

    objc_storeStrong((id *)&v37, 0);
  }
  else
  {
    v31 = -[ACUIIdentityPickerViewController _selectedIdentity](v45, "_selectedIdentity");
    if (-[ACUIIdentityPickerViewController _isPropertyEnabled](v45, "_isPropertyEnabled"))
    {
      v10 = v45;
      v28 = 0;
      if (v31)
      {
        v29 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v31);
        v28 = 1;
        v9 = v29;
      }
      else
      {
        v9 = 0;
      }
      -[ACUIIdentityPickerViewController _finishedFetchingIdentities:](v10, "_finishedFetchingIdentities:", v9);
      if ((v28 & 1) != 0)

    }
    else
    {
      v27 = (id)-[ACUIIdentityPickerViewController specifierForID:](v45, "specifierForID:", CFSTR("CertificatesGroup"));
      v26 = 0;
      if (v27)
      {
        -[ACUIIdentityPickerViewController getGroup:row:ofSpecifier:](v45, "getGroup:row:ofSpecifier:", &v26, 0, v27);
        v7 = v45;
        v8 = (id)-[ACUIIdentityPickerViewController specifiersInGroup:](v45, "specifiersInGroup:", v26);
        -[ACUIIdentityPickerViewController removeContiguousSpecifiers:animated:](v7, "removeContiguousSpecifiers:animated:");

        -[ACUIIdentityPickerViewController removeSpecifier:](v45, "removeSpecifier:", v27);
      }
      objc_storeStrong(&v27, 0);
    }
  }
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
}

void __47__ACUIIdentityPickerViewController_viewDidLoad__block_invoke(id *a1)
{
  id WeakRetained;
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12[3];

  v12[2] = a1;
  v12[1] = a1;
  WeakRetained = objc_loadWeakRetained((id *)a1[4] + 172);
  v12[0] = (id)objc_msgSend(WeakRetained, "copyIdentitiesForIdentityPickerController:", a1[4]);

  v11 = _SortIdentities(v12[0], *((void **)a1[4] + 175));
  queue = MEMORY[0x1E0C80D38];
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __47__ACUIIdentityPickerViewController_viewDidLoad__block_invoke_2;
  v8 = &unk_1E9A15508;
  v9 = a1[4];
  v10 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(v12, 0);
}

uint64_t __47__ACUIIdentityPickerViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedFetchingIdentities:", *(_QWORD *)(a1 + 40), a1, a1);
}

- (id)specifiers
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void **v7;
  void *v8;
  id WeakRetained;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  const __CFString *v22;
  const __CFString *v23;
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  const __CFString *v28;
  _QWORD *v29;
  id *v30;
  id *v31;
  id *v32;
  id *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[2];
  ACUIIdentityPickerViewController *v39;

  v39 = self;
  v38[1] = a2;
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]))
  {
    WeakRetained = objc_loadWeakRetained((id *)&v39->_delegate);
    v33 = (id *)v38;
    v38[0] = (id)objc_msgSend(WeakRetained, "localizedSwitchNameForIdentityPickerController:", v39);

    v18 = 0x1E0D80000uLL;
    v34 = 0;
    v2 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v38[0], v39, sel__setValue_forSwitchSpecifier_, sel__valueForSwitchSpecifier_, 0);
    v32 = &v37;
    v37 = v2;
    v11 = v2;
    v12 = -[ACUIIdentityPickerViewController property](v39, "property");
    v29 = (_QWORD *)MEMORY[0x1E0D808B0];
    objc_msgSend(v11, "setProperty:forKey:");

    v17 = (_QWORD *)MEMORY[0x1E0D80868];
    objc_msgSend(v37, "setProperty:forKey:", CFSTR("Switch"), *MEMORY[0x1E0D80868]);
    v27 = (_QWORD *)MEMORY[0x1E0D80808];
    v28 = CFSTR("NO");
    objc_msgSend(v37, "setProperty:forKey:");
    v14 = *(id *)(v18 + 1256);
    v19 = 0x1E0CB3000uLL;
    v13 = MEMORY[0x1E0CB34D0];
    v20 = 0x1E9A14000uLL;
    v16 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v22 = &stru_1E9A15E98;
    v23 = CFSTR("Localizable");
    v15 = (id)objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CERTIFICATES"));
    v3 = (id)objc_msgSend(v14, "groupSpecifierWithName:");
    v31 = &v36;
    v36 = v3;

    objc_msgSend(v36, "setProperty:forKey:", CFSTR("CertificatesGroup"), *v17);
    v24 = *(id *)(v18 + 1256);
    v21 = *(id *)(v19 + 1232);
    v26 = (id)objc_msgSend(v21, "bundleForClass:", objc_opt_class());
    v25 = (id)objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("LOADING"), v22, v23);
    v4 = (id)objc_msgSend(v24, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    v30 = &v35;
    v35 = v4;

    objc_msgSend(v35, "setProperty:forKey:", v28, *v27);
    objc_msgSend(v35, "setProperty:forKey:", CFSTR("CertificatesLoading"), *v29);
    v5 = objc_alloc(MEMORY[0x1E0C99D20]);
    v6 = objc_msgSend(v5, "initWithObjects:", v37, v36, v35, 0);
    v7 = (void **)((char *)&v39->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
    v8 = *v7;
    *v7 = (void *)v6;

    objc_storeStrong(v30, v34);
    objc_storeStrong(v31, v34);
    objc_storeStrong(v32, v34);
    objc_storeStrong(v33, v34);
  }
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&v39->super.super.super.super.super.isa
                                                 + (int)*MEMORY[0x1E0D80590]));
}

- (void)_finishedFetchingIdentities:(id)a3
{
  uint64_t v3;
  ACUIIdentityPickerViewController *v4;
  id v5;
  ACUIIdentityPickerViewController *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unsigned __int8 v11;
  id v12;
  id location[2];
  ACUIIdentityPickerViewController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v14->_identities, location[0]);
  v12 = -[ACUIIdentityPickerViewController _specifiersForIdentities:](v14, "_specifiersForIdentities:", location[0]);
  v11 = -[ACUIIdentityPickerViewController _isPropertyEnabled](v14, "_isPropertyEnabled");
  v10 = -[ACUIIdentityPickerViewController _identityToAutoselectWithEnabled:](v14, "_identityToAutoselectWithEnabled:", v11);
  if (v14->_userInteractiveIdentityList && !v10)
  {
    v11 = 0;
    if (v14->_allowIdentitySelectionForDisabledSwitch)
      v10 = -[ACUIIdentityPickerViewController _selectedIdentity](v14, "_selectedIdentity");
  }
  -[ACUIIdentityPickerViewController _setPropertyEnabled:identity:](v14, "_setPropertyEnabled:identity:", v11 & 1, v10);
  v9 = (id)-[ACUIIdentityPickerViewController specifierForID:](v14, "specifierForID:", CFSTR("Switch"));
  if (v14->_userInteractiveSwitch && objc_msgSend(location[0], "count"))
    objc_msgSend(v9, "setProperty:forKey:", CFSTR("YES"), *MEMORY[0x1E0D80808]);
  v8 = 0;
  -[ACUIIdentityPickerViewController beginUpdates](v14, "beginUpdates", &v8);
  -[ACUIIdentityPickerViewController reloadSpecifier:animated:](v14, "reloadSpecifier:animated:", v9, 1);
  v4 = v14;
  v5 = (id)-[ACUIIdentityPickerViewController specifierForID:](v14, "specifierForID:", CFSTR("CertificatesGroup"));
  -[ACUIIdentityPickerViewController getGroup:row:ofSpecifier:](v4, "getGroup:row:ofSpecifier:", v3);

  v6 = v14;
  v7 = (id)-[ACUIIdentityPickerViewController specifiersInGroup:](v14, "specifiersInGroup:", v8);
  -[ACUIIdentityPickerViewController replaceContiguousSpecifiers:withSpecifiers:animated:](v6, "replaceContiguousSpecifiers:withSpecifiers:animated:");

  -[ACUIIdentityPickerViewController endUpdates](v14, "endUpdates");
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (id)_specifiersForIdentities:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v9;
  id *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id *v16;
  id v17;
  id v18;
  id *v19;
  id v20;
  ACUIIdentityPickerViewController *v21;
  id v22;
  id v23;
  id *v24;
  id v25;
  id v26;
  int v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  unsigned int v45;
  SecCertificateRef certificateRef;
  _QWORD __b[8];
  SecIdentityRef v48;
  id v49;
  id v50;
  id location;
  SEL v52;
  ACUIIdentityPickerViewController *v53;
  id v54;
  __CFString *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v53 = self;
  v52 = a2;
  location = 0;
  objc_storeStrong(&location, a3);
  v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = (id)MEMORY[0x1E0D804E8];
  v36 = MEMORY[0x1E0CB34D0];
  v39 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v38 = (id)objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("CERTIFICATES"), &stru_1E9A15E98, CFSTR("Localizable"));
  v49 = (id)objc_msgSend(v37, "groupSpecifierWithName:");

  objc_msgSend(v49, "setProperty:forKey:", CFSTR("CertificatesGroup"), *MEMORY[0x1E0D80868]);
  objc_msgSend(v50, "addObject:", v49);
  v40 = 0;
  if (objc_msgSend(location, "count"))
  {
    v33 = __b;
    memset(__b, 0, sizeof(__b));
    obj = location;
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v56, 16);
    if (v35)
    {
      v30 = *(_QWORD *)__b[2];
      v31 = v40;
      v32 = v35;
      while (1)
      {
        v28 = v32;
        v29 = v31;
        if (*(_QWORD *)__b[2] != v30)
          objc_enumerationMutation(obj);
        v48 = *(SecIdentityRef *)(__b[1] + 8 * v29);
        certificateRef = 0;
        v27 = 0;
        v45 = 0;
        v45 = SecIdentityCopyCertificate(v48, &certificateRef);
        if (v27 == v45)
        {
          if (certificateRef)
          {
            v55 = (__CFString *)SecCertificateCopySubjectSummary(certificateRef);
            v44 = v55;
            if (v44)
            {
              v22 = (id)MEMORY[0x1E0D804E8];
              v20 = v44;
              v21 = v53;
              v3 = objc_opt_class();
              v25 = 0;
              v4 = (id)objc_msgSend(v22, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, v21, 0, 0, v3, 1, 0);
              v24 = &v43;
              v43 = v4;
              v23 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v48, CFSTR("Identity"));
              objc_msgSend(v43, "setUserInfo:");

              objc_msgSend(v50, "addObject:", v43);
              objc_storeStrong(v24, v25);
            }
            else
            {
              v54 = (id)SecCertificateCopyProperties();
              v5 = v54;
              v19 = &v42;
              v42 = v5;
              v18 = NSStringFromSelector(v52);
              NSLog(CFSTR("%@: no summary for certificate %@"), v18, v42);

              objc_storeStrong(v19, 0);
            }
            CFRelease(certificateRef);
            objc_storeStrong(&v44, 0);
          }
        }
        else
        {
          v26 = NSStringFromSelector(v52);
          NSLog(CFSTR("%@: SecIdentityCopyCertificate returned %d"), v26, v45);

        }
        v31 = v29 + 1;
        v32 = v28;
        if (v29 + 1 >= v28)
        {
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v56, 16);
          v31 = v40;
          v32 = v6;
          if (!v6)
            break;
        }
      }
    }

  }
  else
  {
    v13 = (id)MEMORY[0x1E0D804E8];
    v12 = MEMORY[0x1E0CB34D0];
    v15 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (id)objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("NO_IDENTITIES_EXPLANATION"), &stru_1E9A15E98, CFSTR("Localizable"));
    v17 = 0;
    v7 = (id)objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    v16 = &v41;
    v41 = v7;

    objc_msgSend(v41, "setProperty:forKey:", CFSTR("NO"), *MEMORY[0x1E0D80808]);
    objc_msgSend(v50, "addObject:", v41);
    objc_storeStrong(v16, v17);
  }
  v10 = &v50;
  v9 = v50;
  v11 = 0;
  objc_storeStrong(&v49, 0);
  objc_storeStrong(v10, v11);
  objc_storeStrong(&location, v11);
  return v9;
}

- (id)_identitySpecifiers
{
  id v2;
  id v4;
  id v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id obj;
  uint64_t v12;
  _QWORD __b[8];
  id v14;
  id v15[2];
  ACUIIdentityPickerViewController *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16 = self;
  v15[1] = (id)a2;
  v15[0] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  memset(__b, 0, sizeof(__b));
  obj = *(id *)((char *)&v16->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
  if (v12)
  {
    v8 = *(_QWORD *)__b[2];
    v9 = 0;
    v10 = v12;
    while (1)
    {
      v7 = v9;
      if (*(_QWORD *)__b[2] != v8)
        objc_enumerationMutation(obj);
      v14 = *(id *)(__b[1] + 8 * v9);
      v5 = (id)objc_msgSend(v14, "userInfo");
      v2 = (id)objc_msgSend(v5, "objectForKey:", CFSTR("Identity"));
      v6 = v2 == 0;

      if (!v6)
        objc_msgSend(v15[0], "addObject:", v14);
      ++v9;
      if (v7 + 1 >= v10)
      {
        v9 = 0;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
        if (!v10)
          break;
      }
    }
  }

  v4 = v15[0];
  objc_storeStrong(v15, 0);
  return v4;
}

- (__SecIdentity)_identityToAutoselectWithEnabled:(BOOL)a3
{
  __SecIdentity *v4;
  BOOL v5;

  v5 = a3;
  v4 = -[ACUIIdentityPickerViewController _selectedIdentity](self, "_selectedIdentity");
  if (self->_userInteractiveIdentityList && v5 && !v4 && -[NSArray count](self->_identities, "count"))
    return (__SecIdentity *)-[NSArray objectAtIndex:](self->_identities, "objectAtIndex:", 0);
  return v4;
}

- (void)_setValue:(id)a3 forSwitchSpecifier:(id)a4
{
  uint64_t v5;
  unsigned __int8 v6;
  id v7;
  id location[2];
  ACUIIdentityPickerViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = objc_msgSend(location[0], "BOOLValue") & 1;
  v5 = -[ACUIIdentityPickerViewController _identityToAutoselectWithEnabled:](v9, "_identityToAutoselectWithEnabled:", v6);
  -[ACUIIdentityPickerViewController _setPropertyEnabled:identity:](v9, "_setPropertyEnabled:identity:", v6 & 1, v5);
  -[ACUIIdentityPickerViewController reload](v9, "reload");
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)_setPropertyEnabled:(BOOL)a3 identity:(__SecIdentity *)a4
{
  id WeakRetained;
  BOOL v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "identityPickerController:setPropertyEnabled:withIdentity:", self, v6, a4);

}

- (id)_valueForSwitchSpecifier:(id)a3
{
  id v4;
  id location[2];
  ACUIIdentityPickerViewController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ACUIIdentityPickerViewController _isPropertyEnabled](v6, "_isPropertyEnabled"));
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)_isPropertyEnabled
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "isPropertyEnabledForIdentityPickerController:", self);

  return v4 & 1;
}

- (__SecIdentity)_selectedIdentity
{
  id WeakRetained;
  __SecIdentity *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = (__SecIdentity *)objc_msgSend(WeakRetained, "selectedIdentityForIdentityPickerController:", self);

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  BOOL v8;
  id v10;
  const void *v11;
  char v12;
  id v13;
  char v14;
  id v15;
  char v16;
  __SecIdentity *v17;
  id v18;
  objc_super v19;
  id v20;
  id v21;
  id location[2];
  ACUIIdentityPickerViewController *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v19.receiver = v23;
  v19.super_class = (Class)ACUIIdentityPickerViewController;
  v20 = -[ACUIIdentityPickerViewController tableView:cellForRowAtIndexPath:](&v19, sel_tableView_cellForRowAtIndexPath_, location[0], v21);
  v18 = (id)-[ACUIIdentityPickerViewController specifierAtIndex:](v23, "specifierAtIndex:", -[ACUIIdentityPickerViewController indexForIndexPath:](v23, "indexForIndexPath:", v21));
  v10 = (id)objc_msgSend(v18, "userInfo");
  v11 = (const void *)objc_msgSend(v10, "objectForKey:", CFSTR("Identity"));

  if (v11)
  {
    v17 = -[ACUIIdentityPickerViewController _selectedIdentity](v23, "_selectedIdentity");
    if (-[ACUIIdentityPickerViewController _isPropertyEnabled](v23, "_isPropertyEnabled")
      || (v8 = 0, v23->_allowIdentitySelectionForDisabledSwitch))
    {
      v8 = _SecIdentityEqual(v17, v11);
    }
    -[ACUIIdentityPickerViewController _updateCell:selected:](v23, "_updateCell:selected:", v20, v8);
    v16 = -[ACUIIdentityPickerViewController _allowIdentitySelection](v23, "_allowIdentitySelection");
    v14 = 0;
    v12 = 0;
    if ((v16 & 1) != 0)
    {
      v15 = (id)objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
      v14 = 1;
      v7 = v15;
    }
    else
    {
      v13 = (id)objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
      v12 = 1;
      v7 = v13;
    }
    v6 = (id)objc_msgSend(v20, "textLabel");
    objc_msgSend(v6, "setTextColor:", v7);

    if ((v12 & 1) != 0)
    if ((v14 & 1) != 0)

    objc_msgSend(v20, "setSelectionStyle:", (v16 & 1) != 0);
    objc_msgSend(v20, "setAccessoryType:", 2);
  }
  v5 = v20;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v4;
  CFTypeRef v5;
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  id WeakRetained;
  const void *v11;
  id v13;
  uint64_t v14;
  objc_super v15;
  id v16;
  unsigned int v17;
  id v18;
  CFTypeRef v19;
  uint64_t v20;
  id v21;
  id v22;
  id location[2];
  ACUIIdentityPickerViewController *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  v21 = (id)-[ACUIIdentityPickerViewController specifierAtIndex:](v24, "specifierAtIndex:", -[ACUIIdentityPickerViewController indexForIndexPath:](v24, "indexForIndexPath:", v22));
  v13 = (id)objc_msgSend(v21, "userInfo");
  v14 = objc_msgSend(v13, "objectForKey:", CFSTR("Identity"));

  v20 = v14;
  if (v14)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
    v11 = (const void *)objc_msgSend(WeakRetained, "copyTrustForIdentityPickerController:identity:", v24, v20);

    v19 = v11;
    if (v11)
    {
      v18 = (id)objc_msgSend(MEMORY[0x1E0D0D588], "defaultTrustManager");
      v17 = 0;
      v6 = v18;
      v5 = v19;
      v7 = -[NSArray objectAtIndex:](v24->_emailAddresses, "objectAtIndex:", 0);
      v8 = objc_msgSend(v6, "actionForSMIMETrust:sender:", v5);

      v17 = v8;
      v4 = objc_alloc(MEMORY[0x1E0D0D578]);
      v16 = (id)objc_msgSend(v4, "initWithTrust:action:", v19, v8);
      v9 = (id)-[ACUIIdentityPickerViewController navigationController](v24, "navigationController");
      objc_msgSend(v9, "pushViewController:animated:", v16, 1);

      CFRelease(v19);
      objc_storeStrong(&v16, 0);
      objc_storeStrong(&v18, 0);
    }
  }
  else
  {
    v15.receiver = v24;
    v15.super_class = (Class)ACUIIdentityPickerViewController;
    -[ACUIIdentityPickerViewController tableView:accessoryButtonTappedForRowWithIndexPath:](&v15, sel_tableView_accessoryButtonTappedForRowWithIndexPath_, location[0], v22);
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  const void *v4;
  id v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  id v14;
  const void *v15;
  objc_super v16;
  BOOL v17;
  id v18;
  _QWORD __b[8];
  id v20;
  __SecIdentity *v21;
  const void *v22;
  id v23;
  id v24;
  id location[2];
  ACUIIdentityPickerViewController *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = 0;
  objc_storeStrong(&v24, a4);
  v23 = (id)-[ACUIIdentityPickerViewController specifierAtIndex:](v26, "specifierAtIndex:", -[ACUIIdentityPickerViewController indexForIndexPath:](v26, "indexForIndexPath:", v24));
  v14 = (id)objc_msgSend(v23, "userInfo");
  v15 = (const void *)objc_msgSend(v14, "objectForKey:", CFSTR("Identity"));

  v22 = v15;
  v21 = -[ACUIIdentityPickerViewController _selectedIdentity](v26, "_selectedIdentity");
  if (v15)
  {
    if (-[ACUIIdentityPickerViewController _allowIdentitySelection](v26, "_allowIdentitySelection")
      && !_SecIdentityEqual(v22, v21))
    {
      -[ACUIIdentityPickerViewController _setPropertyEnabled:identity:](v26, "_setPropertyEnabled:identity:", -[ACUIIdentityPickerViewController _isPropertyEnabled](v26, "_isPropertyEnabled"), v22);
      memset(__b, 0, sizeof(__b));
      v11 = -[ACUIIdentityPickerViewController _identitySpecifiers](v26, "_identitySpecifiers");
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
      if (v12)
      {
        v8 = *(_QWORD *)__b[2];
        v9 = 0;
        v10 = v12;
        while (1)
        {
          v7 = v9;
          if (*(_QWORD *)__b[2] != v8)
            objc_enumerationMutation(v11);
          v20 = *(id *)(__b[1] + 8 * v9);
          v18 = (id)objc_msgSend(v20, "propertyForKey:", *MEMORY[0x1E0D80940]);
          v4 = v22;
          v5 = (id)objc_msgSend(v20, "userInfo");
          v6 = _SecIdentityEqual(v4, (const void *)objc_msgSend(v5, "objectForKey:", CFSTR("Identity")));

          v17 = v6;
          -[ACUIIdentityPickerViewController _updateCell:selected:](v26, "_updateCell:selected:", v18, v6);
          objc_storeStrong(&v18, 0);
          ++v9;
          if (v7 + 1 >= v10)
          {
            v9 = 0;
            v10 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
            if (!v10)
              break;
          }
        }
      }

    }
    objc_msgSend(location[0], "selectRowAtIndexPath:animated:scrollPosition:", 0, 1, 0);
  }
  else
  {
    v16.receiver = v26;
    v16.super_class = (Class)ACUIIdentityPickerViewController;
    -[ACUIIdentityPickerViewController tableView:didSelectRowAtIndexPath:](&v16, sel_tableView_didSelectRowAtIndexPath_, location[0], v24);
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_allowIdentitySelection
{
  BOOL v3;
  BOOL v4;

  v4 = 0;
  if (self->_userInteractiveIdentityList)
  {
    v3 = 1;
    if (!self->_allowIdentitySelectionForDisabledSwitch)
      return -[ACUIIdentityPickerViewController _isPropertyEnabled](self, "_isPropertyEnabled");
    return v3;
  }
  return v4;
}

- (void)_updateCell:(id)a3 selected:(BOOL)a4
{
  double v4;
  id v6;
  id v7;
  double v8;
  id v9;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = (id)objc_msgSend(location[0], "_checkmarkImage:", 0);
  v6 = (id)objc_msgSend(location[0], "imageView");
  objc_msgSend(v6, "setImage:", v7);

  v4 = 1.0;
  if (!a4)
    v4 = 0.0;
  v8 = v4;
  v9 = (id)objc_msgSend(location[0], "imageView");
  objc_msgSend(v9, "setAlpha:", v8);

  objc_storeStrong(location, 0);
}

- (NSString)property
{
  return self->_property;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_property, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
