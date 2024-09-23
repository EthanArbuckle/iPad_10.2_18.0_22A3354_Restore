@implementation CNVisualIdentityAvatarViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNVisualIdentityAvatarViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNVisualIdentityAvatarViewController"), CFSTR("visualIdentity"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNVisualIdentity"), CFSTR("contacts"), "@", 0);

}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityCustomContent
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v21.receiver = self;
  v21.super_class = (Class)CNVisualIdentityAvatarViewControllerAccessibility;
  -[CNVisualIdentityAvatarViewControllerAccessibility accessibilityCustomContent](&v21, sel_accessibilityCustomContent);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[CNVisualIdentityAvatarViewControllerAccessibility axContacts](self, "axContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 3)
  {
    -[CNVisualIdentityAvatarViewControllerAccessibility axContacts](self, "axContacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          -[CNVisualIdentityAvatarViewControllerAccessibility axContactNameForCNContact:](self, "axContactNameForCNContact:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)MEMORY[0x24BDB3D68];
            accessibilityLocalizedString(CFSTR("contact"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "customContentWithLabel:value:", v14, v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v3, "axSafelyAddObject:", v15);
          }

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v9);
    }

  }
  return v3;
}

- (id)axContactNameForCNContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (!v3
    || (objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", v3, 0),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v3, "phoneNumbers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "emailAddresses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringValue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (!objc_msgSend(v6, "count"))
      {
        v4 = 0;
        goto LABEL_8;
      }
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_8:
  }

  return v4;
}

- (id)axAvatarContacts
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;

  -[CNVisualIdentityAvatarViewControllerAccessibility axContacts](self, "axContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarViewControllerAccessibility axContactNameForCNContact:](self, "axContactNameForCNContact:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v3, "count");
    if (v6 != 1)
    {
      if (v6 == 2)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNVisualIdentityAvatarViewControllerAccessibility axContactNameForCNContact:](self, "axContactNameForCNContact:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("avatar.contacts"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", v10, v5, v8);
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNVisualIdentityAvatarViewControllerAccessibility axContactNameForCNContact:](self, "axContactNameForCNContact:", v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("avatar.contacts.overflow"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringWithFormat:", v10, v8, objc_msgSend(v3, "count") - 2);
        v15 = objc_claimAutoreleasedReturnValue();
        __UIAXStringForVariables();
        v11 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v15;
      }

      v5 = (void *)v11;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)axContacts
{
  void *v2;
  void *v3;

  -[CNVisualIdentityAvatarViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("visualIdentity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeArrayForKey:", CFSTR("contacts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
