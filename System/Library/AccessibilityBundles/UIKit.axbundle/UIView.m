@implementation UIView

- (uint64_t)_accessibilityTextAreaTraits
{
  id v2;
  char v3;
  id location;
  uint64_t v5;
  id v6;
  uint64_t v7;

  v6 = a1;
  if (!a1)
    return 0;
  v5 = 0;
  location = (id)objc_msgSend(v6, "safeValueForKey:", CFSTR("textInputTraits"));
  if ((objc_msgSend(location, "safeBoolForKey:", CFSTR("isSecureTextEntry")) & 1) != 0
    && (objc_msgSend(location, "safeBoolForKey:", CFSTR("displaySecureTextUsingPlainText")) & 1) == 0)
  {
    v5 |= *MEMORY[0x24BEBB168];
  }
  v2 = (id)objc_msgSend(v6, "safeValueForKey:", CFSTR("isEnabled"));
  v3 = objc_msgSend(v2, "BOOLValue");

  if ((v3 & 1) == 0)
    v5 |= *MEMORY[0x24BDF73E8];
  v7 = v5;
  objc_storeStrong(&location, 0);
  return v7;
}

- (id)_accessibilitySecureTextForString:(uint64_t)a1
{
  id v3;
  unint64_t i;
  unint64_t v5;
  id v6;
  int v7;
  id location;
  uint64_t v9;
  id v10;

  v9 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v9)
  {
    v6 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16A8]), "init");
    v5 = objc_msgSend(location, "length");
    for (i = 0; i < v5; ++i)
      objc_msgSend(v6, "appendString:", CFSTR("•"));
    v3 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v6);
    objc_msgSend(v3, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEC58]);
    v10 = v3;
    v7 = 1;
    objc_storeStrong(&v3, 0);
    objc_storeStrong(&v6, 0);
  }
  else
  {
    v10 = 0;
    v7 = 1;
  }
  objc_storeStrong(&location, 0);
  return v10;
}

- (BOOL)_accessibilityUserTestingIsTypeOfButton:(void *)a1
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(_QWORD *, void *, _BYTE *);
  void *v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  int v16;
  int v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  int v21;
  id location;
  id v23;
  BOOL v24;

  v23 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v23)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 838860800;
    v17 = 48;
    v18 = __Block_byref_object_copy__27;
    v19 = __Block_byref_object_dispose__27;
    v20 = 0;
    v7 = MEMORY[0x24BDAC760];
    v8 = -1073741824;
    v9 = 0;
    v10 = __75__UIView_AutomationAccessibility___accessibilityUserTestingIsTypeOfButton___block_invoke;
    v11 = &unk_24FF3E8A8;
    v12 = &v14;
    v13 = (id)objc_msgSend(v23, "_accessibilityFindViewAncestor:startWithSelf:", &v7, 0);
    if (v15[5])
    {
      v6 = 0;
      v6 = objc_msgSend((id)v15[5], "indexOfObject:", v23);
      v5 = -1;
      if ((objc_msgSend(location, "isEqualToString:", CFSTR("default")) & 1) != 0)
      {
        v4 = (id)objc_msgSend(v13, "safeValueForKey:", CFSTR("_defaultButton"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v5 = objc_msgSend(v4, "integerValue");
        if (v5 == -1 && v6 == objc_msgSend((id)v15[5], "count") - 1)
        {
          v24 = 1;
          v21 = 1;
        }
        else
        {
          v21 = 0;
        }
        objc_storeStrong(&v4, 0);
        if (v21)
          goto LABEL_19;
      }
      else if ((objc_msgSend(location, "isEqualToString:", CFSTR("cancel")) & 1) != 0)
      {
        v3 = (id)objc_msgSend(v13, "safeValueForKey:", CFSTR("_cancelButton"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v5 = objc_msgSend(v3, "integerValue");
        objc_storeStrong(&v3, 0);
      }
      v24 = v6 == v5;
      v21 = 1;
    }
    else
    {
      v24 = 0;
      v21 = 1;
    }
LABEL_19:
    objc_storeStrong(&v13, 0);
    _Block_object_dispose(&v14, 8);
    objc_storeStrong(&v20, 0);
    goto LABEL_20;
  }
  v24 = 0;
  v21 = 1;
LABEL_20:
  objc_storeStrong(&location, 0);
  return v24;
}

uint64_t __75__UIView_AutomationAccessibility___accessibilityUserTestingIsTypeOfButton___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v3;
  uint64_t v4;
  void *v5;
  id location[2];
  char v10;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("_buttons"));
    v4 = *(_QWORD *)(a1[4] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v10 = 1;
  }
  else
  {
    if ((objc_msgSend(location[0], "accessibilityIsWindow") & 1) != 0)
      *a3 = 1;
    v10 = 0;
  }
  objc_storeStrong(location, 0);
  return v10 & 1;
}

@end
