@implementation CNPostalAddressEditorNavigationController

- (CNPostalAddressEditorNavigationController)initWithContact:(id)a3 propertyKey:(id)a4 editNames:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  CNPostalAddressEditorNavigationController *v10;
  CNPostalAddressEditorViewController *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[2];

  v5 = a5;
  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CNPostalAddressEditorNavigationController;
  v10 = -[CNPostalAddressEditorNavigationController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  if (v10)
  {
    v11 = -[CNPostalAddressEditorViewController initWithContact:propertyKey:editNames:]([CNPostalAddressEditorViewController alloc], "initWithContact:propertyKey:editNames:", v8, v9, v5);
    v15[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPostalAddressEditorNavigationController setViewControllers:](v10, "setViewControllers:", v12);

  }
  return v10;
}

- (CNPostalAddressEditorNavigationController)initWithPropertyKey:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  CNPostalAddressEditorNavigationController *v14;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C97360]);
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C966A8]))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97338]), "initWithLabel:value:", v7, &stru_1E20507A8);
    v17[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEmailAddresses:", v10);
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C967C0]))
  {
    v11 = objc_alloc(MEMORY[0x1E0C97338]);
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", &stru_1E20507A8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v11, "initWithLabel:value:", v7, v12);

    v16 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPhoneNumbers:", v10);
    goto LABEL_5;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C966C0]))
  {
    objc_msgSend(v8, "setFamilyName:", &stru_1E20507A8);
    v13 = 1;
    goto LABEL_7;
  }
LABEL_6:
  v13 = 0;
LABEL_7:
  v14 = -[CNPostalAddressEditorNavigationController initWithContact:propertyKey:editNames:](self, "initWithContact:propertyKey:editNames:", v8, v6, v13);

  return v14;
}

- (CNPostalAddressEditorNavigationController)initWithFirstName:(id)a3 lastName:(id)a4 addressDictionary:(id)a5 label:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  CNPostalAddressEditorNavigationController *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = (objc_class *)MEMORY[0x1E0C97360];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc_init(v10);
  objc_msgSend(v15, "setGivenName:", v14);

  objc_msgSend(v15, "setFamilyName:", v13);
  objc_msgSend(MEMORY[0x1E0C973A8], "postalAddressWithDictionaryRepresentation:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97338]), "initWithLabel:value:", v11, v16);
  v21[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPostalAddresses:", v18);

  v19 = -[CNPostalAddressEditorNavigationController initWithContact:propertyKey:editNames:](self, "initWithContact:propertyKey:editNames:", v15, *MEMORY[0x1E0C967F0], 1);
  return v19;
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNPostalAddressEditorNavigationController;
  v4 = a3;
  -[CNPostalAddressEditorNavigationController setTitle:](&v6, sel_setTitle_, v4);
  -[CNPostalAddressEditorNavigationController topViewController](self, "topViewController", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

- (void)doneWithContact:(id)a3 propertyKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[CNPostalAddressEditorNavigationController addressEditorDelegate](self, "addressEditorDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C971A0], "contactPropertiesByKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isMultiValue"))
    {
      objc_msgSend(v9, "CNValueForContact:", v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C97280], "contactPropertyWithContact:propertyKey:identifier:", v14, v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postalAddressEditor:finishedEditingProperty:", self, v13);

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "postalAddressEditor:finishedEditingContact:", self, v14);
  }

}

- (CNPostalAddressEditorDelegate)addressEditorDelegate
{
  return (CNPostalAddressEditorDelegate *)objc_loadWeakRetained((id *)&self->_addressEditorDelegate);
}

- (void)setAddressEditorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_addressEditorDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_addressEditorDelegate);
}

@end
