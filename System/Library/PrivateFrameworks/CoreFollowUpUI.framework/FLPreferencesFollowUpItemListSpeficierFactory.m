@implementation FLPreferencesFollowUpItemListSpeficierFactory

+ (id)detailSpecifiersForFollowUpItem:(id)a3 target:(id)a4 selector:(SEL)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  id v51;
  void *v52;
  void *v53;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  id obj;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc(MEMORY[0x24BE1B3C0]);
  objc_msgSend(v7, "groupIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithIdentifier:", v10);

  v56 = v11;
  if (objc_msgSend(v11, "restrictionEnabled"))
  {
    objc_msgSend(MEMORY[0x24BE1B390], "sharedFilter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "overrideGroupRestrictionsForItem:", v7) ^ 1;

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v7, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "groupSpecifierWithID:", v16);
  v17 = objc_claimAutoreleasedReturnValue();

  v55 = (void *)v17;
  objc_msgSend(v14, "addObject:", v17);
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24D55D438, 0, 0, 0, 0, -1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_class();
  v62 = *MEMORY[0x24BE75948];
  objc_msgSend(v18, "setProperty:forKey:", v19);
  v67 = *MEMORY[0x24BE1B2C8];
  objc_msgSend(v18, "setProperty:forKey:", v7);
  objc_msgSend(v7, "representingBundlePath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (uint64_t *)MEMORY[0x24BE75AC8];
  v68 = v18;
  if (v20)
  {
    v22 = v13;
    v23 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(v7, "representingBundlePath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bundleWithPath:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "bundleIconName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x24BDF6AC8];
    if (v26)
    {
      objc_msgSend(v7, "bundleIconName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "imageNamed:inBundle:", v28, v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      SFAppTintColor();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "imageWithTintColor:", v30);
    }
    else
    {
      objc_msgSend(v25, "bundleIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "scale");
      objc_msgSend(v27, "_applicationIconImageForBundleIdentifier:format:scale:", v30, 0);
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v68;
    objc_msgSend(v68, "setProperty:forKey:", v31, *v21);

    v13 = v22;
  }
  objc_msgSend(v14, "addObject:", v18);
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  objc_msgSend(v7, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
  if (v69)
  {
    v66 = *(_QWORD *)v71;
    v64 = *MEMORY[0x24BE75868];
    v65 = *MEMORY[0x24BE1B2C0];
    v63 = *MEMORY[0x24BE1B2F8];
    v57 = (void *)*MEMORY[0x24BE1B2B8];
    v61 = *v21;
    v58 = v7;
    v59 = *MEMORY[0x24BE75A18];
    do
    {
      for (i = 0; i != v69; ++i)
      {
        if (*(_QWORD *)v71 != v66)
          objc_enumerationMutation(obj);
        v33 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        v34 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(v33, "label");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v35, v8, 0, 0, 0, 13, 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v36, "setProperty:forKey:", v33, v65);
        objc_msgSend(v36, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v64);
        objc_msgSend(v36, "setProperty:forKey:", v7, v67);
        objc_msgSend(v36, "setButtonAction:", a5);
        objc_msgSend(v7, "groupIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "isEqualToString:", v63))
        {
          objc_msgSend(v7, "actions");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v38, "count") == 1)
          {
            v39 = objc_msgSend(v7, "displayStyle");

            if ((v39 & 2) == 0)
              goto LABEL_20;
            objc_msgSend(v7, "uniqueIdentifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "stringByAppendingString:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setIdentifier:", v38);
          }

        }
LABEL_20:
        objc_msgSend(v7, "representingBundlePath");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          objc_msgSend(v36, "setProperty:forKey:", objc_opt_class(), v62);
          v41 = (void *)MEMORY[0x24BDD1488];
          objc_msgSend(v7, "representingBundlePath");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "bundleWithPath:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "bundleIconName");
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = (void *)MEMORY[0x24BDF6AC8];
          if (v44)
          {
            objc_msgSend(v7, "bundleIconName");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "imageNamed:inBundle:", v46, v43);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v43, "bundleIdentifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
            v48 = v13;
            v49 = v14;
            v50 = a5;
            v51 = v8;
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "scale");
            objc_msgSend(v45, "_applicationIconImageForBundleIdentifier:format:scale:", v46, 0);
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            v8 = v51;
            a5 = v50;
            v14 = v49;
            v13 = v48;
            v7 = v58;
          }

          objc_msgSend(v47, "_imageWithSize:", 29.0, 29.0);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v36, "setProperty:forKey:", v53, v61);
        }
        if ((_DWORD)v13)
          objc_msgSend(v36, "setProperty:forKey:", MEMORY[0x24BDBD1C0], v59);
        objc_msgSend(v14, "addObject:", v36);

        v18 = v68;
      }
      v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    }
    while (v69);
  }

  return v14;
}

@end
