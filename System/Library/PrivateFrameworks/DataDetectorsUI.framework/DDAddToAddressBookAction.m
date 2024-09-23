@implementation DDAddToAddressBookAction

- (void)invalidate
{
  void *v3;

  -[DDAction viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAction:", 0);

  -[DDAction setViewController:](self, "setViewController:", 0);
}

- (id)localizedName
{
  return DDLocalizedString(CFSTR("Add to Contacts"));
}

- (int)interactionType
{
  return 1;
}

+ (BOOL)isAvailable
{
  return +[DDRemoteActionViewController controllerIsAvailable](DDRemoteActionViewController, "controllerIsAvailable");
}

- (void)prepareViewControllerForActionController:(id)a3
{
  id v3;

  v3 = +[DDRemoteActionViewController prepareViewController:forAction:actionController:](DDRemoteActionViewController, "prepareViewController:forAction:actionController:", CFSTR("DDAddToContactsViewController"), self, a3);
}

- (void)adaptForPresentationInPopover:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[DDAction viewController](self, "viewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adaptForPresentationInPopover:", v3);

}

+ (BOOL)actionAvailableForContact:(id)a3
{
  if (a3)
    return objc_msgSend(a1, "isAvailable");
  else
    return 0;
}

- (id)compactTitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  -[DDAddToAddressBookAction contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length") && objc_msgSend(v3, "isKeyAvailable:", CFSTR("organizationName")))
  {
    objc_msgSend(v3, "organizationName");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  if (!objc_msgSend(v4, "length"))
  {

LABEL_7:
    v7.receiver = self;
    v7.super_class = (Class)DDAddToAddressBookAction;
    -[DDAction compactTitle](&v7, sel_compactTitle);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)contact
{
  CNContact **p_contact;
  CNContact *contact;
  NSURL *v5;
  void *v6;
  void *v7;
  CNContact *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  p_contact = &self->super.super._contact;
  contact = self->super.super._contact;
  if (!contact)
  {
    v5 = self->super.super._url;
    DDPersonActionsSupportedSchemes();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (self->super.super._result)
      {
        v7 = 0;
      }
      else
      {
        -[NSURL dd_phoneNumberFromValidSchemes:](v5, "dd_phoneNumberFromValidSchemes:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (!self->super.super._result)
      {
        -[NSURL dd_emailFromValidSchemes:](v5, "dd_emailFromValidSchemes:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dd_userFriendlyEmail");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = (CNContact *)objc_alloc_init(MEMORY[0x1E0C97360]);
        if (v9)
        {
          objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", 0, v9);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
          if (v15)
          {
            v19[0] = v15;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNContact setEmailAddresses:](v8, "setEmailAddresses:", v17);

          }
          objc_storeStrong((id *)p_contact, v8);

          if (!v7)
            goto LABEL_17;
          goto LABEL_11;
        }
LABEL_9:
        if (!v7)
        {
          if (!self->super.super._result)
          {
            v9 = 0;
            v7 = 0;
            goto LABEL_17;
          }
          DDAugmentContactWithResultsFromAction(v8, self);
          v8 = v8;
          v9 = 0;
          v7 = 0;
          v11 = *p_contact;
          *p_contact = v8;
LABEL_16:

LABEL_17:
          contact = *p_contact;
          return contact;
        }
        v9 = 0;
LABEL_11:
        DDPhoneLabeledValue(0, v7);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (id)v10;
        if (v10)
        {
          v18 = v10;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContact setPhoneNumbers:](v8, "setPhoneNumbers:", v12);

        }
        objc_storeStrong((id *)p_contact, v8);
        goto LABEL_16;
      }
    }
    else
    {
      v7 = 0;
    }
    v8 = (CNContact *)objc_alloc_init(MEMORY[0x1E0C97360]);
    goto LABEL_9;
  }
  return contact;
}

- (id)notificationTitle
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSURL *url;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  -[DDAddToAddressBookAction contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", self->super.super._contact, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
      objc_msgSend(v4, "addObject:", v5);
    -[CNContact phoneNumbers](self->super.super._contact, "phoneNumbers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
    {
      TUFormattedPhoneNumber();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
        v12 = (void *)v10;
      else
        v12 = v9;
      v13 = v4;
    }
    else
    {
      -[CNContact emailAddresses](self->super.super._contact, "emailAddresses");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v11, "length"))
      {
        -[CNContact postalAddresses](self->super.super._contact, "postalAddresses");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "firstObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "value");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v46 = v11;
          objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", v31, 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "componentsSeparatedByCharactersInSet:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v36 = v34;
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
          if (v37)
          {
            v38 = v37;
            v39 = *(_QWORD *)v48;
            v45 = v35;
            while (2)
            {
              for (i = 0; i != v38; ++i)
              {
                if (*(_QWORD *)v48 != v39)
                  objc_enumerationMutation(v36);
                v41 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
                objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "stringByTrimmingCharactersInSet:", v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v43, "length"))
                {
                  v35 = v45;
                  objc_msgSend(v45, "addObject:", v43);

                  goto LABEL_35;
                }

              }
              v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
              v35 = v45;
              if (v38)
                continue;
              break;
            }
          }
LABEL_35:

          if (objc_msgSend(v36, "count"))
          {
            objc_msgSend(v35, "componentsJoinedByString:", CFSTR(" "));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v44);

          }
          v11 = v46;
        }

LABEL_16:
        if (objc_msgSend(v4, "count") == 1)
        {
          v23 = (void *)MEMORY[0x1E0CB3940];
          DDLocalizedString(CFSTR("Add “%@” to Contacts"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringWithFormat:", v24, v25);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v26 = objc_msgSend(v4, "count");
          v27 = (void *)MEMORY[0x1E0CB3940];
          if (v26 < 2)
          {
            DDLocalizedString(CFSTR("Add VCard to Contacts"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringWithFormat:", v24);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_22;
          }
          DDLocalizedString(CFSTR("Add “%@” to Contacts\n%@"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringWithFormat:", v24, v25, v28);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

        }
LABEL_22:

        goto LABEL_23;
      }
      v13 = v4;
      v12 = v11;
    }
    objc_msgSend(v13, "addObject:", v12);
    goto LABEL_16;
  }
  url = self->super.super._url;
  v15 = (uint64_t)self->super.super._result;
  if (!((unint64_t)url | v15))
    return 0;
  _displayString(url, v15, 0, 0, 1);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
    return 0;
  v4 = (id)v16;
  v17 = (void *)MEMORY[0x1E0CB3940];
  DDLocalizedString(CFSTR("Add location “%@” to Contacts"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", v18, v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
  return v19;
}

- (id)notificationIconBundleIdentifier
{
  return CFSTR("com.apple.MobileAddressBook");
}

- (id)notificationURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("x-barcode-datadetectors-action:contact"));
}

@end
