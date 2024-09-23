@implementation GCSController(GameController)

+ (const)productCategoryLocalizationKeyForProductCategory:()GameController
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DualShock 4")) & 1) != 0)
  {
    v4 = CFSTR("PRODUCT_CATEGORY_DUALSHOCK4");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DualSense")) & 1) != 0)
  {
    v4 = CFSTR("PRODUCT_CATEGORY_DUALSENSE");
  }
  else
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Xbox One")) & 1) != 0)
      goto LABEL_6;
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Xbox Elite")) & 1) != 0)
    {
      v4 = CFSTR("PRODUCT_CATEGORY_XBOX_ELITE");
      goto LABEL_21;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Xbox Adaptive")) & 1) != 0)
    {
      v4 = CFSTR("PRODUCT_CATEGORY_XBOX_ADAPTIVE");
      goto LABEL_21;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Xbox Series X")) & 1) != 0)
    {
LABEL_6:
      v4 = CFSTR("PRODUCT_CATEGORY_XBOX_ONE");
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MFi")) & 1) != 0)
    {
      v4 = CFSTR("PRODUCT_CATEGORY_MFI");
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HID")) & 1) != 0)
    {
      v4 = CFSTR("PRODUCT_CATEGORY_HID");
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Switch JoyCon")) & 1) != 0)
    {
      v4 = CFSTR("PRODUCT_CATEGORY_NINTENDO_JOY_CON");
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Switch Pro Controller")))
    {
      v4 = CFSTR("PRODUCT_CATEGORY_NINTENDO_PRO_CONTROLLER");
    }
    else
    {
      v4 = CFSTR("PRODUCT_CATEGORY_GENERIC_CONTROLLER");
    }
  }
LABEL_21:

  return v4;
}

- (id)initWithController:()GameController
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "vendorName");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "identifier");
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = CFSTR("CONTROLLER");
  }
  objc_msgSend(v3, "physicalInputProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buttons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Button Share"));
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "physicalInputProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "buttons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Button Options"));
  v11 = objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v12 = objc_alloc((Class)&off_254DE3C10);
    v13 = v8;
  }
  else
  {
    objc_msgSend(v3, "physicalInputProfile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "buttons");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Button Options"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v42 = 0;
      goto LABEL_9;
    }
    v12 = objc_alloc((Class)&off_254DE3C10);
    v13 = v11;
  }
  v42 = (void *)objc_msgSend(v12, "initWithElement:", v13);
LABEL_9:
  objc_msgSend(v3, "physicalInputProfile");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allButtons");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[GCSController generateElementDictionaryFromElements:](&off_254DE68F8, "generateElementDictionaryFromElements:", v18);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "physicalInputProfile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allDpads");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[GCSController generateElementDictionaryFromElements:](&off_254DE68F8, "generateElementDictionaryFromElements:", v20);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "physicalInputProfile");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Button Home"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "unmappedSfSymbolsName");
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v44 = (void *)v8;
  if (!v23 || (-[__CFString hasPrefix:](v23, "hasPrefix:", CFSTR("logo")) & 1) == 0)
  {

    v23 = CFSTR("gamecontroller.fill");
  }
  objc_msgSend(v3, "haptics");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "light");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = (void *)unk_254DE4360(&off_254DE4EA0, "newBaseProfile");
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v3, "components");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  v43 = (void *)v11;
  if (v27)
  {
    v28 = v27;
    v29 = 0;
    v30 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v49 != v30)
          objc_enumerationMutation(v26);
        v32 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        if (objc_msgSend(v32, "conformsToProtocol:", &unk_254DD05F8))
        {
          objc_msgSend(v32, "miscellaneous");
          v33 = objc_claimAutoreleasedReturnValue();

          v29 = (void *)v33;
        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v28);
  }
  else
  {
    v29 = 0;
  }

  objc_msgSend(v3, "detailedProductCategory");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[GCSController productCategoryLocalizationKeyForProductCategory:](&off_254DE68F8, "productCategoryLocalizationKeyForProductCategory:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v38) = v25 != 0;
  LOBYTE(v38) = v24 != 0;
  v36 = (id)objc_msgSend(a1, "initWithName:persistentIdentifier:productCategoryKey:hidden:shareButton:buttons:dpads:logoSfSymbolsName:supportsHaptics:supportsLight:baseProfile:miscellaneous:", v47, v46, v35, 0, v42, v41, v40, v23, v38, v39, v29);

  return v36;
}

+ (id)generateElementDictionaryFromElements:()GameController
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init((Class)&off_254DEBD30);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "remappable", (_QWORD)v15))
        {
          v11 = (void *)objc_msgSend(objc_alloc((Class)&off_254DE3C10), "initWithElement:", v10);
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "name");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v13);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

@end
