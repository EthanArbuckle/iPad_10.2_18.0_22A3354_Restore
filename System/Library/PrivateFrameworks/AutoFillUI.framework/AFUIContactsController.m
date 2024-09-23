@implementation AFUIContactsController

- (AFUIContactsController)init
{
  AFUIContactsController *v2;
  CNContactStore *v3;
  CNContactStore *contactStore;
  NSMutableArray *v5;
  NSMutableArray *meDisplayNameObservers;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AFUIContactsController;
  v2 = -[AFUIContactsController init](&v9, sel_init);
  if (v2)
  {
    v3 = (CNContactStore *)objc_alloc_init(MEMORY[0x24BDBACF8]);
    contactStore = v2->_contactStore;
    v2->_contactStore = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    meDisplayNameObservers = v2->_meDisplayNameObservers;
    v2->_meDisplayNameObservers = v5;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__loadMe, *MEMORY[0x24BDBA3D8], 0);

    -[AFUIContactsController _loadMe](v2, "_loadMe");
  }
  return v2;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)addMeDisplayNameObserverAndGetInitialValue:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AFUIContactsController meDisplayNameObservers](self, "meDisplayNameObservers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  -[AFUIContactsController _meDisplayName](self, "_meDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v6, "meDisplayNameChanged:", v5);

}

- (void)removeMeDisplayNameObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFUIContactsController meDisplayNameObservers](self, "meDisplayNameObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (id)allContactsViewControllerForTextContentType:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x24BDBAE78];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[AFUIContactsController contactsKeysForTextContentType:](self, "contactsKeysForTextContentType:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisplayedPropertyKeys:", v7);

  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  LOBYTE(v7) = AFTextContentTypeIsInNameSet(v5);

  if (((v7 & 1) != 0 || self->_alwaysAllowsNamePicking) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("allowsNamePicking"));
  return v6;
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[AFUIContactsController contactPropertyPickerDelegate](self, "contactPropertyPickerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIContactsController _customInfoForContactProperty:useMultilineFallback:](self, "_customInfoForContactProperty:useMultilineFallback:", v5, objc_msgSend(v6, "isSingleLineDocument") ^ 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[AFUIContactsController contactPropertyPickerDelegate](self, "contactPropertyPickerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userSelectedContactProperties:", v8);

}

- (void)contactPickerDidCancel:(id)a3
{
  id v3;

  -[AFUIContactsController contactPropertyPickerDelegate](self, "contactPropertyPickerDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactPickerDidCancel");

}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[AFUIContactsController contactPropertyPickerDelegate](self, "contactPropertyPickerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIContactsController _customInfoForContactProperty:useMultilineFallback:](self, "_customInfoForContactProperty:useMultilineFallback:", v6, objc_msgSend(v8, "isSingleLineDocument") ^ 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AFUIContactsController contactPropertyPickerDelegate](self, "contactPropertyPickerDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userSelectedContactProperties:", v9);

  objc_msgSend(v7, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, 0);
  return 0;
}

- (void)_loadMe
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[16];

  v16[15] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  objc_msgSend(MEMORY[0x24BDBAE90], "descriptorForRequiredKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDBA288];
  v16[1] = v4;
  v16[2] = v5;
  v6 = *MEMORY[0x24BDBA378];
  v16[3] = *MEMORY[0x24BDBA348];
  v16[4] = v6;
  v7 = *MEMORY[0x24BDBA2C8];
  v16[5] = *MEMORY[0x24BDBA318];
  v16[6] = v7;
  v8 = *MEMORY[0x24BDBA2C0];
  v16[7] = *MEMORY[0x24BDBA310];
  v16[8] = v8;
  v9 = *MEMORY[0x24BDBA320];
  v16[9] = *MEMORY[0x24BDBA380];
  v16[10] = v9;
  v10 = *MEMORY[0x24BDBA340];
  v16[11] = *MEMORY[0x24BDBA300];
  v16[12] = v10;
  v11 = *MEMORY[0x24BDBA258];
  v16[13] = *MEMORY[0x24BDBA3F8];
  v16[14] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[AFUIContactsController contactStore](self, "contactStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v13, "_ios_meContactWithKeysToFetch:error:", v12, &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIContactsController setMe:](self, "setMe:", v14);

}

- (id)_meContactInfosForTextContentType:(id)a3 meContact:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  AFUIContactInfo *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  AFUIContactInfo *v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  void *k;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  __CFString *v43;
  __CFString *v44;
  AFUIContactInfo *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  unint64_t v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t m;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  __CFString *v70;
  __CFString *v71;
  void *v72;
  void *v73;
  void *v74;
  AFUIContactInfo *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  AFUIContactInfo *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t n;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t ii;
  void *v122;
  void *v123;
  void *v124;
  id v126;
  id obj;
  __CFString *v128;
  id v129;
  id v131;
  id v132;
  id v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  uint64_t v164;

  v164 = *MEMORY[0x24BDAC8D0];
  v126 = a3;
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v154 = 0u;
  v155 = 0u;
  v156 = 0u;
  v157 = 0u;
  objc_msgSend(v5, "emailAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v154, v163, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v155;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v155 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x24BDBAD38];
        objc_msgSend(v12, "label");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForLabel:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        v17 = &stru_250857310;
        if (v15)
          v17 = (__CFString *)v15;
        v18 = v17;

        objc_msgSend(v6, "objectForKey:", v18);
        v19 = (AFUIContactInfo *)objc_claimAutoreleasedReturnValue();
        if (v19
          || (v19 = -[AFUIContactInfo initWithLabel:]([AFUIContactInfo alloc], "initWithLabel:", v18),
              objc_msgSend(v6, "setObject:forKey:", v19, v18),
              v19))
        {
          objc_msgSend(v12, "value");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[AFUIContactInfo setEmailString:](v19, "setEmailString:", v20);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v154, v163, 16);
    }
    while (v9);
  }

  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  objc_msgSend(v5, "urlAddresses");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v150, v162, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v151;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v151 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * j);
        v27 = (void *)MEMORY[0x24BDBAD38];
        objc_msgSend(v26, "label");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "localizedStringForLabel:", v28);
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = (void *)v29;
        v31 = &stru_250857310;
        if (v29)
          v31 = (__CFString *)v29;
        v32 = v31;

        objc_msgSend(v6, "objectForKey:", v32);
        v33 = (AFUIContactInfo *)objc_claimAutoreleasedReturnValue();
        if (v33
          || (v33 = -[AFUIContactInfo initWithLabel:]([AFUIContactInfo alloc], "initWithLabel:", v32),
              objc_msgSend(v6, "setObject:forKey:", v33, v32),
              v33))
        {
          objc_msgSend(v26, "value");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[AFUIContactInfo setUrlString:](v33, "setUrlString:", v34);

        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v150, v162, 16);
    }
    while (v23);
  }

  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  objc_msgSend(v5, "phoneNumbers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v131 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v161, 16);
  if (v131)
  {
    v35 = *(_QWORD *)v147;
    v36 = 0x24BDBA000uLL;
    do
    {
      for (k = 0; k != v131; k = (char *)k + 1)
      {
        if (*(_QWORD *)v147 != v35)
          objc_enumerationMutation(obj);
        v38 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * (_QWORD)k);
        v39 = (void *)MEMORY[0x24BDBAD38];
        objc_msgSend(v38, "label");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "localizedStringForLabel:", v40);
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = (void *)v41;
        v43 = &stru_250857310;
        if (v41)
          v43 = (__CFString *)v41;
        v44 = v43;

        objc_msgSend(v6, "objectForKey:", v44);
        v45 = (AFUIContactInfo *)objc_claimAutoreleasedReturnValue();
        if (v45
          || (v45 = -[AFUIContactInfo initWithLabel:]([AFUIContactInfo alloc], "initWithLabel:", v44),
              objc_msgSend(v6, "setObject:forKey:", v45, v44),
              v45))
        {
          objc_msgSend(v38, "value");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "stringValue");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[AFUIContactInfo setPhoneString:](v45, "setPhoneString:", v47);

          objc_msgSend(v38, "value");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "digitsRemovingDialingCode");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (v49)
          {
            -[AFUIContactInfo setPhoneNationalNumberString:](v45, "setPhoneNationalNumberString:", v49);
            if (objc_msgSend(v49, "length") == 10)
            {
              objc_msgSend(v49, "substringToIndex:", 3);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              -[AFUIContactInfo setPhoneAreaCodeString:](v45, "setPhoneAreaCodeString:", v50);

              objc_msgSend(v49, "substringFromIndex:", 3);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              -[AFUIContactInfo setPhoneLocalNumberString:](v45, "setPhoneLocalNumberString:", v51);

            }
            else if (objc_msgSend(v49, "length") == 7)
            {
              -[AFUIContactInfo setPhoneAreaCodeString:](v45, "setPhoneAreaCodeString:", &stru_250857310);
              -[AFUIContactInfo setPhoneLocalNumberString:](v45, "setPhoneLocalNumberString:", v49);
            }
            -[AFUIContactInfo setPhoneExtensionString:](v45, "setPhoneExtensionString:", &stru_250857310);
          }
          v52 = *(void **)(v36 + 3464);
          objc_msgSend(v38, "value");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "countryCode");
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = v36;
          v56 = (void *)v54;
          if (v54)
          {
            objc_msgSend(v52, "dialingCodeForISOCountryCode:", v54);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(*(id *)(v55 + 3464), "defaultCountryCode");
            v128 = v44;
            v58 = v5;
            v59 = v6;
            v60 = v35;
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "dialingCodeForISOCountryCode:", v61);
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            v35 = v60;
            v6 = v59;
            v5 = v58;
            v44 = v128;
          }

          if (v57)
            -[AFUIContactInfo setPhoneCountryCodeString:](v45, "setPhoneCountryCodeString:", v57);

          v36 = 0x24BDBA000;
        }

      }
      v131 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v161, 16);
    }
    while (v131);
  }

  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  objc_msgSend(v5, "postalAddresses");
  v129 = (id)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v142, v160, 16);
  if (v62)
  {
    v63 = v62;
    v132 = *(id *)v143;
    do
    {
      for (m = 0; m != v63; ++m)
      {
        if (*(id *)v143 != v132)
          objc_enumerationMutation(v129);
        v65 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * m);
        v66 = (void *)MEMORY[0x24BDBAD38];
        objc_msgSend(v65, "label");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "localizedStringForLabel:", v67);
        v68 = objc_claimAutoreleasedReturnValue();
        v69 = (void *)v68;
        v70 = &stru_250857310;
        if (v68)
          v70 = (__CFString *)v68;
        v71 = v70;

        objc_msgSend(v65, "value");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "street");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "componentsSeparatedByString:", CFSTR("\n"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKey:", v71);
        v75 = (AFUIContactInfo *)objc_claimAutoreleasedReturnValue();
        if (v75
          || (v75 = -[AFUIContactInfo initWithLabel:]([AFUIContactInfo alloc], "initWithLabel:", v71),
              objc_msgSend(v6, "setObject:forKey:", v75, v71),
              v75))
        {
          if (v74)
          {
            objc_msgSend(v74, "objectAtIndex:", 0);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            -[AFUIContactInfo setStreetAddressLine1String:](v75, "setStreetAddressLine1String:", v76);

          }
          if ((unint64_t)objc_msgSend(v74, "count") >= 2)
          {
            objc_msgSend(v74, "objectAtIndex:", 1);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            -[AFUIContactInfo setStreetAddressLine2String:](v75, "setStreetAddressLine2String:", v77);

          }
          objc_msgSend(v65, "value");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "subLocality");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          -[AFUIContactInfo setSublocalityString:](v75, "setSublocalityString:", v79);

          objc_msgSend(v65, "value");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "city");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          -[AFUIContactInfo setCityString:](v75, "setCityString:", v81);

          objc_msgSend(v65, "value");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "state");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          -[AFUIContactInfo setStateString:](v75, "setStateString:", v83);

          objc_msgSend(v65, "value");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "postalCode");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          -[AFUIContactInfo setPostalCodeString:](v75, "setPostalCodeString:", v85);

          objc_msgSend(v65, "value");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "country");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          -[AFUIContactInfo setCountryString:](v75, "setCountryString:", v87);

          v88 = (void *)MEMORY[0x24BDBAD98];
          objc_msgSend(v65, "value");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "singleLineStringFromPostalAddress:addCountryName:", v89, 0);
          v90 = (void *)objc_claimAutoreleasedReturnValue();

          -[AFUIContactInfo setFullStreetAddressString:](v75, "setFullStreetAddressString:", v90);
        }

      }
      v63 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v142, v160, 16);
    }
    while (v63);
  }

  objc_msgSend(v6, "allKeys");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "count");

  if (!v92)
  {
    v93 = objc_alloc_init(AFUIContactInfo);
    objc_msgSend(v6, "setObject:forKey:", v93, &stru_250857310);

  }
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  objc_msgSend(v6, "allKeys");
  v133 = (id)objc_claimAutoreleasedReturnValue();
  v94 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v138, v159, 16);
  if (v94)
  {
    v95 = v94;
    v96 = *(_QWORD *)v139;
    do
    {
      for (n = 0; n != v95; ++n)
      {
        if (*(_QWORD *)v139 != v96)
          objc_enumerationMutation(v133);
        objc_msgSend(v6, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * n));
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", v5, 0);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setNameString:", v99);

        objc_msgSend(v5, "givenName");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setGivenNameString:", v100);

        objc_msgSend(v5, "familyName");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setFamilyNameString:", v101);

        objc_msgSend(v5, "middleName");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setMiddleNameString:", v102);

        objc_msgSend(v5, "namePrefix");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setNamePrefixString:", v103);

        objc_msgSend(v5, "nameSuffix");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setNameSuffixString:", v104);

        objc_msgSend(v5, "nickname");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setNicknameString:", v105);

        objc_msgSend(v5, "jobTitle");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setJobTitleString:", v106);

        objc_msgSend(v5, "organizationName");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setOrganizationNameString:", v107);

        objc_msgSend(v5, "birthday");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFUIContactsController formattedDateForComponents:](self, "formattedDateForComponents:", v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setBirthdateString:", v109);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v108, "day"));
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "stringValue");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setBirthdateDayString:", v111);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v108, "month"));
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "stringValue");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setBirthdateMonthString:", v113);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v108, "year"));
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "stringValue");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setBirthdateYearString:", v115);

      }
      v95 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v138, v159, 16);
    }
    while (v95);
  }

  -[AFUIContactsController unifyPhoneNumberAndAddressDataAcrossContactInfos:withTextContentType:](self, "unifyPhoneNumberAndAddressDataAcrossContactInfos:withTextContentType:", v6, v126);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  if (_meContactInfosForTextContentType_meContact__onceToken != -1)
    dispatch_once(&_meContactInfosForTextContentType_meContact__onceToken, &__block_literal_global_9);
  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  v117 = (id)_meContactInfosForTextContentType_meContact__preferredLabelOrder;
  v118 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v134, v158, 16);
  if (v118)
  {
    v119 = v118;
    v120 = *(_QWORD *)v135;
    do
    {
      for (ii = 0; ii != v119; ++ii)
      {
        if (*(_QWORD *)v135 != v120)
          objc_enumerationMutation(v117);
        objc_msgSend(MEMORY[0x24BDBAD38], "localizedStringForLabel:", *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * ii));
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v122);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        if (v123)
        {
          objc_msgSend(v116, "addObject:", v123);
          objc_msgSend(v6, "removeObjectForKey:", v122);
        }

      }
      v119 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v134, v158, 16);
    }
    while (v119);
  }

  objc_msgSend(v6, "allValues");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "addObjectsFromArray:", v124);

  return v116;
}

void __70__AFUIContactsController__meContactInfosForTextContentType_meContact___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDBAB70];
  v6[0] = *MEMORY[0x24BDBAB78];
  v6[1] = v0;
  v1 = *MEMORY[0x24BDBAB58];
  v6[2] = *MEMORY[0x24BDBAB98];
  v6[3] = v1;
  v2 = *MEMORY[0x24BDBABA0];
  v6[4] = *MEMORY[0x24BDBABB0];
  v6[5] = v2;
  v3 = *MEMORY[0x24BDBABA8];
  v6[6] = *MEMORY[0x24BDBAB60];
  v6[7] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 8);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_meContactInfosForTextContentType_meContact__preferredLabelOrder;
  _meContactInfosForTextContentType_meContact__preferredLabelOrder = v4;

}

- (id)meContactInfosForTextContentType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AFUIContactsController me](self, "me");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIContactsController _meContactInfosForTextContentType:meContact:](self, "_meContactInfosForTextContentType:meContact:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)formattedDateForComponents:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocale:", v8);

  objc_msgSend(v7, "setLocalizedDateFormatFromTemplate:", CFSTR("ddMMyyyy"));
  objc_msgSend(v7, "stringFromDate:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)unifyPhoneNumberAndAddressDataAcrossContactInfos:(id)a3 withTextContentType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  id v68;

  v68 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDBAD38], "localizedStringForLabel:", *MEMORY[0x24BDBAB58]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBAD38], "localizedStringForLabel:", *MEMORY[0x24BDBAB78]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBAD38], "localizedStringForLabel:", *MEMORY[0x24BDBAB70]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBAD38], "localizedStringForLabel:", *MEMORY[0x24BDBAB98]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBAD38], "localizedStringForLabel:", *MEMORY[0x24BDBABA8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v68;
  if (v11)
  {
    objc_msgSend(v68, "objectForKey:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "phoneString");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
LABEL_23:

      v12 = v68;
      goto LABEL_24;
    }
    objc_msgSend(v68, "objectForKey:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fullStreetAddressString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v68;
    if (v17)
    {
      objc_msgSend(v68, "objectForKey:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "objectForKey:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "objectForKey:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "objectForKey:", v6);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v11, "fullStreetAddressString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
          -[AFUIContactsController copyAddressContactInfoFromContactInfo:toContactInfo:](self, "copyAddressContactInfoFromContactInfo:toContactInfo:", v66, v11);
        objc_msgSend(v11, "emailString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          objc_msgSend(v66, "emailString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setEmailString:", v20);

        }
      }
      if (v13)
      {
        objc_msgSend(v13, "fullStreetAddressString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
          -[AFUIContactsController copyAddressContactInfoFromContactInfo:toContactInfo:](self, "copyAddressContactInfoFromContactInfo:toContactInfo:", v66, v13);
        objc_msgSend(v13, "emailString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          objc_msgSend(v66, "emailString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setEmailString:", v23);

        }
      }
      if (v15)
      {
        objc_msgSend(v15, "fullStreetAddressString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
          -[AFUIContactsController copyAddressContactInfoFromContactInfo:toContactInfo:](self, "copyAddressContactInfoFromContactInfo:toContactInfo:", v66, v15);
        objc_msgSend(v15, "emailString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          objc_msgSend(v66, "emailString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setEmailString:", v26);

        }
      }
      if (AFTextContentTypeIsInPhoneSet(v5))
        objc_msgSend(v68, "removeObjectForKey:", v6);

      goto LABEL_23;
    }
  }
LABEL_24:
  objc_msgSend(v12, "objectForKey:", v6);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v68;
  if (v27)
  {
    v29 = (void *)v27;
    objc_msgSend(v68, "objectForKey:", v6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "phoneString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v68;
    if (!v31)
    {
      objc_msgSend(v68, "objectForKey:", v7);
      v36 = objc_claimAutoreleasedReturnValue();
      if (!v36)
        goto LABEL_38;
      v37 = (void *)v36;
      objc_msgSend(v68, "objectForKey:", v7);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "phoneString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend(v68, "objectForKey:", v7);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "objectForKey:", v6);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFUIContactsController copyPhoneContactInfoFromContactInfo:toContactInfo:](self, "copyPhoneContactInfoFromContactInfo:toContactInfo:", v40, v41);

        v42 = AFTextContentTypeIsInAddressSet(v5);
        v43 = v7;
      }
      else
      {
LABEL_38:
        objc_msgSend(v68, "objectForKey:", v8);
        v53 = objc_claimAutoreleasedReturnValue();
        if (!v53)
          goto LABEL_43;
        v54 = (void *)v53;
        objc_msgSend(v68, "objectForKey:", v8);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "phoneString");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v56)
        {
LABEL_43:
          objc_msgSend(v68, "objectForKey:", v9);
          v59 = objc_claimAutoreleasedReturnValue();
          v28 = v68;
          if (!v59)
            goto LABEL_26;
          v60 = (void *)v59;
          objc_msgSend(v68, "objectForKey:", v9);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "phoneString");
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = v68;
          if (!v62)
            goto LABEL_26;
          objc_msgSend(v68, "objectForKey:", v9);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "objectForKey:", v6);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[AFUIContactsController copyPhoneContactInfoFromContactInfo:toContactInfo:](self, "copyPhoneContactInfoFromContactInfo:toContactInfo:", v63, v64);

          v65 = AFTextContentTypeIsInAddressSet(v5);
          v28 = v68;
          v43 = v9;
          if (!v65)
            goto LABEL_26;
LABEL_42:
          objc_msgSend(v28, "removeObjectForKey:", v43);
          v28 = v68;
          goto LABEL_26;
        }
        objc_msgSend(v68, "objectForKey:", v8);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "objectForKey:", v6);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFUIContactsController copyPhoneContactInfoFromContactInfo:toContactInfo:](self, "copyPhoneContactInfoFromContactInfo:toContactInfo:", v57, v58);

        v42 = AFTextContentTypeIsInAddressSet(v5);
        v43 = v8;
      }
      v28 = v68;
      if ((v42 & 1) == 0)
        goto LABEL_26;
      goto LABEL_42;
    }
  }
LABEL_26:
  objc_msgSend(v28, "objectForKey:", v6);
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    objc_msgSend(v68, "objectForKey:", v6);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "urlString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {

    }
    else
    {
      objc_msgSend(v68, "objectForKey:", v6);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "fullStreetAddressString");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        objc_msgSend(v68, "objectForKey:", v10);
        v46 = objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          v47 = (void *)v46;
          objc_msgSend(v68, "objectForKey:", v10);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "urlString");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (v49)
          {
            objc_msgSend(v68, "objectForKey:", v10);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "urlString");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "objectForKey:", v6);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "setUrlString:", v51);

            if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE0B3A0]))
              objc_msgSend(v68, "removeObjectForKey:", v10);
          }
        }
      }
    }
  }

}

- (void)copyAddressContactInfoFromContactInfo:(id)a3 toContactInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v5 = a4;
  objc_msgSend(v16, "fullStreetAddressString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFullStreetAddressString:", v6);

  objc_msgSend(v16, "streetAddressLine1String");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v16, "streetAddressLine1String");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStreetAddressLine1String:", v8);

  }
  objc_msgSend(v16, "streetAddressLine2String");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v16, "streetAddressLine2String");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStreetAddressLine2String:", v10);

  }
  objc_msgSend(v16, "sublocalityString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSublocalityString:", v11);

  objc_msgSend(v16, "cityString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCityString:", v12);

  objc_msgSend(v16, "stateString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStateString:", v13);

  objc_msgSend(v16, "postalCodeString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPostalCodeString:", v14);

  objc_msgSend(v16, "countryString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCountryString:", v15);

}

- (void)copyPhoneContactInfoFromContactInfo:(id)a3 toContactInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = a4;
  objc_msgSend(v14, "phoneString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPhoneString:", v6);

  objc_msgSend(v14, "phoneNationalNumberString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v14, "phoneNationalNumberString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPhoneNationalNumberString:", v8);

    objc_msgSend(v14, "phoneAreaCodeString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPhoneAreaCodeString:", v9);

    objc_msgSend(v14, "phoneLocalNumberString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPhoneLocalNumberString:", v10);

    objc_msgSend(v14, "phoneExtensionString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPhoneExtensionString:", v11);

  }
  objc_msgSend(v14, "phoneCountryCodeString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v14, "phoneCountryCodeString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPhoneCountryCodeString:", v13);

  }
}

- (id)_meDisplayName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AFUIContactsController me](self, "me");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDBACC0];
    -[AFUIContactsController me](self, "me");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromContact:style:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)contactsKeysForTextContentType:(id)a3
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((AFTextContentTypeIsInPhoneSet(v3) & 1) != 0)
  {
    v5 = (_QWORD *)MEMORY[0x24BDBA348];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE0B300]) & 1) != 0)
  {
    v5 = (_QWORD *)MEMORY[0x24BDBA288];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE0B3A0]) & 1) != 0)
  {
    v5 = (_QWORD *)MEMORY[0x24BDBA3F8];
  }
  else
  {
    if (!AFTextContentTypeIsInAddressSet(v3))
      goto LABEL_10;
    v5 = (_QWORD *)MEMORY[0x24BDBA378];
  }
  objc_msgSend(v4, "addObject:", *v5);
LABEL_10:
  if (objc_msgSend(v4, "count"))
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (id)meCardViewControllerForTextContentType:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDBAE90];
  v5 = a3;
  -[AFUIContactsController me](self, "me");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForContact:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AFUIContactsController contactsKeysForTextContentType:](self, "contactsKeysForTextContentType:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setDisplayedPropertyKeys:", v8);
  objc_msgSend(v7, "setAllowsEditing:", 0);
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "setModalPresentationStyle:", 2);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v7);

  return v9;
}

- (id)_customInfoForContactProperty:(id)a3 useMultilineFallback:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  id v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  char v68;
  void *v69;
  void *v70;
  void *v71;
  _BOOL4 v72;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "givenName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "givenName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v10, *MEMORY[0x24BE0B318]);

  }
  objc_msgSend(v8, "middleName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "middleName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v12, *MEMORY[0x24BE0B328]);

  }
  objc_msgSend(v8, "familyName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v8, "familyName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v14, *MEMORY[0x24BE0B308]);

  }
  objc_msgSend(v8, "namePrefix");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v8, "namePrefix");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v16, *MEMORY[0x24BE0B338]);

  }
  objc_msgSend(v8, "nameSuffix");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v8, "nameSuffix");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v18, *MEMORY[0x24BE0B340]);

  }
  if (objc_msgSend(v8, "isKeyAvailable:", CFSTR("nickname")))
  {
    objc_msgSend(v8, "nickname");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v8, "nickname");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v20, *MEMORY[0x24BE0B350]);

    }
  }
  if (objc_msgSend(v8, "isKeyAvailable:", CFSTR("jobTitle")))
  {
    objc_msgSend(v8, "jobTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v8, "jobTitle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v22, *MEMORY[0x24BE0B320]);

    }
  }
  if (objc_msgSend(v8, "isKeyAvailable:", CFSTR("organizationName")))
  {
    objc_msgSend(v8, "organizationName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v8, "organizationName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v24, *MEMORY[0x24BE0B368]);

    }
  }
  objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", v8, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "length"))
    objc_msgSend(v7, "setObject:forKey:", v25, *MEMORY[0x24BE0B330]);
  objc_msgSend(v6, "key");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v26, "isEqualToString:", *MEMORY[0x24BDBA2C8]) & 1) != 0)
    goto LABEL_37;
  objc_msgSend(v6, "key");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v27, "isEqualToString:", *MEMORY[0x24BDBA310]) & 1) == 0)
  {
    objc_msgSend(v6, "key");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v28, "isEqualToString:", *MEMORY[0x24BDBA2C0]) & 1) != 0)
    {
LABEL_35:

      goto LABEL_36;
    }
    objc_msgSend(v6, "key");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v29, "isEqualToString:", *MEMORY[0x24BDBA318]) & 1) != 0)
    {
LABEL_34:

      goto LABEL_35;
    }
    v72 = v4;
    objc_msgSend(v6, "key");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v30, "isEqualToString:", *MEMORY[0x24BDBA320]) & 1) != 0)
    {
LABEL_33:

      goto LABEL_34;
    }
    v71 = v30;
    objc_msgSend(v6, "key");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v31, "isEqualToString:", *MEMORY[0x24BDBA328]) & 1) != 0)
    {
LABEL_32:

      v30 = v71;
      goto LABEL_33;
    }
    v70 = v31;
    objc_msgSend(v6, "key");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v32, "isEqualToString:", *MEMORY[0x24BDBA300]) & 1) != 0)
    {
LABEL_31:

      v31 = v70;
      goto LABEL_32;
    }
    v69 = v32;
    objc_msgSend(v6, "key");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v33, "isEqualToString:", *MEMORY[0x24BDBA340]) & 1) != 0)
    {

      v32 = v69;
      goto LABEL_31;
    }
    objc_msgSend(v6, "key");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "isEqualToString:", CFSTR("displayName"));

    if ((v68 & 1) != 0)
      goto LABEL_38;
    objc_msgSend(v6, "value");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "setObject:forKey:", v36, *MEMORY[0x24BE0B358]);
      objc_msgSend(v6, "key");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "isEqualToString:", *MEMORY[0x24BDBA288]);

      if (v38)
        objc_msgSend(v7, "setObject:forKey:", v36, *MEMORY[0x24BE0B300]);
      objc_msgSend(v6, "key");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqualToString:", *MEMORY[0x24BDBA3F8]);

      if (v40)
        objc_msgSend(v7, "setObject:forKey:", v36, *MEMORY[0x24BE0B3A0]);
      v34 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[AFUIContactsController formattedDateForComponents:](self, "formattedDateForComponents:", v36);
        v41 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v41, *MEMORY[0x24BE0B358]);
        objc_msgSend(v6, "key");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "isEqualToString:", *MEMORY[0x24BDBA258]);

        if (v43)
          objc_msgSend(v7, "setObject:forKey:", v41, *MEMORY[0x24BE0B2D0]);
        v34 = v7;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v48 = v36;
            objc_msgSend(v48, "street");
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            if (v49)
            {
              objc_msgSend(v48, "street");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKey:", v50, *MEMORY[0x24BE0B380]);

            }
            objc_msgSend(v48, "city");
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            if (v51)
            {
              objc_msgSend(v48, "city");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKey:", v52, *MEMORY[0x24BE0B2B8]);

            }
            objc_msgSend(v48, "state");
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            if (v53)
            {
              objc_msgSend(v48, "state");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKey:", v54, *MEMORY[0x24BE0B2C8]);

            }
            objc_msgSend(v48, "subLocality");
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            if (v55)
            {
              objc_msgSend(v48, "subLocality");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKey:", v56, *MEMORY[0x24BE0B390]);

            }
            objc_msgSend(v48, "postalCode");
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            if (v57)
            {
              objc_msgSend(v48, "postalCode");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKey:", v58, *MEMORY[0x24BE0B378]);

            }
            objc_msgSend(v48, "country");
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            if (v59)
            {
              objc_msgSend(v48, "country");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKey:", v60, *MEMORY[0x24BE0B2F0]);

            }
            if (v72)
              objc_msgSend(MEMORY[0x24BDBAD98], "stringFromPostalAddress:style:", v48, 0);
            else
              objc_msgSend(MEMORY[0x24BDBAD98], "singleLineStringFromPostalAddress:addCountryName:", v48, 0);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKey:", v66, *MEMORY[0x24BE0B310]);
            objc_msgSend(v7, "setObject:forKey:", v66, *MEMORY[0x24BE0B358]);

            v34 = v7;
          }
          else
          {
            v34 = 0;
          }
          goto LABEL_80;
        }
        v41 = v36;
        objc_msgSend(v41, "stringValue");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v44, *MEMORY[0x24BE0B398]);

        objc_msgSend(v41, "digitsRemovingDialingCode");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (v45)
        {
          objc_msgSend(v7, "setObject:forKey:", v45, CFSTR("tel-national"));
          if (objc_msgSend(v45, "length") == 10)
          {
            objc_msgSend(v45, "substringToIndex:", 3);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKey:", v46, CFSTR("tel-area-code"));

            objc_msgSend(v45, "substringFromIndex:", 3);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKey:", v47, CFSTR("tel-local"));

          }
          else if (objc_msgSend(v45, "length") == 7)
          {
            objc_msgSend(v7, "setObject:forKey:", v45, CFSTR("tel-local"));
          }
        }
        v61 = (void *)MEMORY[0x24BDBAD88];
        objc_msgSend(v41, "countryCode");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (v62)
        {
          objc_msgSend(v61, "dialingCodeForISOCountryCode:", v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBAD88], "defaultCountryCode");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "dialingCodeForISOCountryCode:", v64);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (v63)
          objc_msgSend(v7, "setObject:forKey:", v63, CFSTR("tel-country-code"));
        objc_msgSend(v41, "stringValue");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v65, *MEMORY[0x24BE0B358]);

        v34 = v7;
      }

    }
LABEL_80:

    goto LABEL_39;
  }
LABEL_36:

LABEL_37:
LABEL_38:
  objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("didPickContactNamePropertyKey"));
  v34 = v7;
LABEL_39:

  return v34;
}

- (BOOL)alwaysAllowsNamePicking
{
  return self->_alwaysAllowsNamePicking;
}

- (void)setAlwaysAllowsNamePicking:(BOOL)a3
{
  self->_alwaysAllowsNamePicking = a3;
}

- (AFUIContactPropertyPickerDelegate)contactPropertyPickerDelegate
{
  return (AFUIContactPropertyPickerDelegate *)objc_loadWeakRetained((id *)&self->_contactPropertyPickerDelegate);
}

- (void)setContactPropertyPickerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contactPropertyPickerDelegate, a3);
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (CNContact)me
{
  return (CNContact *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMe:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)meDisplayNameObservers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMeDisplayNameObservers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meDisplayNameObservers, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_contactPropertyPickerDelegate);
}

@end
