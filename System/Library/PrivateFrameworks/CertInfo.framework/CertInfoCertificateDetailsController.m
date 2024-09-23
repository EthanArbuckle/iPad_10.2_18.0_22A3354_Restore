@implementation CertInfoCertificateDetailsController

- (CertInfoCertificateDetailsController)initWithTrust:(__SecTrust *)a3
{
  return -[CertInfoCertificateDetailsController initWithTrust:certificateIndex:](self, "initWithTrust:certificateIndex:", a3, 0);
}

- (CertInfoCertificateDetailsController)initWithTrust:(__SecTrust *)a3 certificateIndex:(int64_t)a4
{
  CertInfoCertificateDetailsController *v8;
  CertInfoCertificateDetailsController *v9;
  void *v11;
  void *v12;

  if (a3)
  {
    if ((a4 & 0x8000000000000000) == 0)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CertInfoCertificateDetailsController.m"), 94, CFSTR("trust must be non-NULL"));

    if ((a4 & 0x8000000000000000) == 0)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CertInfoCertificateDetailsController.m"), 95, CFSTR("certificateIndex must be greater than or equal to zero"));

LABEL_3:
  if (SecTrustGetCertificateCount(a3) <= a4)
  {
    v9 = 0;
  }
  else
  {
    v8 = (CertInfoCertificateDetailsController *)SecTrustCopyDetailedPropertiesAtIndex();
    v9 = -[CertInfoCertificateDetailsController initWithCertificateProperties:](self, "initWithCertificateProperties:", v8);
    self = v8;
  }

  return v9;
}

- (CertInfoCertificateDetailsController)initWithCertificateProperties:(id)a3
{
  id v4;
  CertInfoCertificateDetailsController *v5;
  CertInfoCertificateDetailsController *v6;
  uint64_t v7;
  NSArray *sectionDictionaries;
  uint64_t v9;
  UIBarButtonItem *doneButton;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CertInfoCertificateDetailsController;
  v5 = -[CertInfoCertificateDetailsController initWithStyle:](&v14, sel_initWithStyle_, 1);
  v6 = v5;
  if (v5)
  {
    -[CertInfoCertificateDetailsController _sectionsForProperties:](v5, "_sectionsForProperties:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    sectionDictionaries = v6->_sectionDictionaries;
    v6->_sectionDictionaries = (NSArray *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, v6, sel__doneButtonPressed_);
    doneButton = v6->_doneButton;
    v6->_doneButton = (UIBarButtonItem *)v9;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CertInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CERTIFICATE"), &stru_24C813780, CFSTR("CertInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertInfoCertificateDetailsController setTitle:](v6, "setTitle:", v12);

  }
  return v6;
}

- (id)_sectionsForProperties:(id)a3
{
  return -[CertInfoCertificateDetailsController _sectionsForProperties:currentSectionDictionary:](self, "_sectionsForProperties:currentSectionDictionary:", a3, 0);
}

- (id)_sectionsForProperties:(id)a3 currentSectionDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v27;
  uint64_t v28;
  id obj;
  id v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("CertInfoCertificateDetailsSectionPropertiesKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    v11 = *MEMORY[0x24BDE9478];
    v32 = *MEMORY[0x24BDE9480];
    v31 = *MEMORY[0x24BDE94A0];
    v28 = *MEMORY[0x24BDE9488];
    do
    {
      v12 = 0;
      v27 = v9;
      do
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v12);
        objc_msgSend(v13, "objectForKey:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v32);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v31);

        if (v16)
        {
          objc_msgSend(v13, "objectForKey:", v28);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "count"))
          {
            v18 = v11;
            v19 = v10;
            v20 = v7;
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjectsAndKeys:", v14, CFSTR("CertInfoCertificateDetailsSectionLabelKey"), v21, CFSTR("CertInfoCertificateDetailsSectionPropertiesKey"), 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[CertInfoCertificateDetailsController _sectionsForProperties:currentSectionDictionary:](self, "_sectionsForProperties:currentSectionDictionary:", v17, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v21, "count"))
              objc_msgSend(v30, "addObject:", v22);
            if (objc_msgSend(v23, "count"))
              objc_msgSend(v30, "addObjectsFromArray:", v23);
            if (objc_msgSend(v21, "count") || objc_msgSend(v23, "count"))
            {

              v6 = 0;
            }

            v7 = v20;
            v10 = v19;
            v11 = v18;
            v9 = v27;
          }

        }
        else
        {
          if (!v6)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v24 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", v24, CFSTR("CertInfoCertificateDetailsSectionPropertiesKey"));
            v6 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addObject:", v6);
            v7 = (void *)v24;
          }
          objc_msgSend(v7, "addObject:", v13);
        }

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v9);
  }

  return v30;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *doneButton;
  UIBarButtonItem *v7;
  void *v8;
  UIBarButtonItem *v9;
  id v10;

  *((_BYTE *)self + 1040) = *((_BYTE *)self + 1040) & 0xFE | a3;
  -[CertInfoCertificateDetailsController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  doneButton = self->_doneButton;

  if ((*((_BYTE *)self + 1040) & 1) != 0 && v5 != doneButton)
  {
    v7 = self->_doneButton;
    -[CertInfoCertificateDetailsController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    v9 = v7;
LABEL_7:
    objc_msgSend(v8, "setRightBarButtonItem:", v9);

    return;
  }
  if ((*((_BYTE *)self + 1040) & 1) == 0 && v5 == doneButton)
  {
    -[CertInfoCertificateDetailsController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    v9 = 0;
    goto LABEL_7;
  }
}

- (BOOL)showsDoneButton
{
  return *((_BYTE *)self + 1040) & 1;
}

- (void)_doneButtonPressed:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CertInfoCertificateDetailsController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CertInfoCertificateDetailsController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "certificateDetailsControllerDidFinish:", self);

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_sectionDictionaries, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[NSArray objectAtIndex:](self->_sectionDictionaries, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("CertInfoCertificateDetailsSectionPropertiesKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[NSArray objectAtIndex:](self->_sectionDictionaries, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("CertInfoCertificateDetailsSectionLabelKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("CertInfoCertificateDetailsControllerTableCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("CertInfoCertificateDetailsControllerTableCell"));
  -[CertInfoCertificateDetailsController _propertiesForIndexPath:](self, "_propertiesForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDE9478]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  _stringValueForPropertyDictionary(v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "detailTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  return v7;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  return sel_copy_ == a4;
}

- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v11 = a5;
  v12 = a6;
  if (sel_copy_ != a4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CertInfoCertificateDetailsController.m"), 248, CFSTR("can only perform copy:"));

  }
  -[CertInfoCertificateDetailsController _propertiesForIndexPath:](self, "_propertiesForIndexPath:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _stringValueForPropertyDictionary(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDF6C40], "generalPasteboard");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setString:", v14);

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a4, 1);
}

- (id)_propertiesForIndexPath:(id)a3
{
  NSArray *sectionDictionaries;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  sectionDictionaries = self->_sectionDictionaries;
  v4 = a3;
  -[NSArray objectAtIndex:](sectionDictionaries, "objectAtIndex:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("CertInfoCertificateDetailsSectionPropertiesKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "row");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (CertInfoCertificateDetailsControllerDelegate)delegate
{
  return (CertInfoCertificateDetailsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_sectionDictionaries, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
