@implementation CNContactPickerContentViewController

- (CNContactPickerContentViewController)init
{
  CNContactPickerContentViewController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNContactPickerContentViewController;
  v2 = -[CNContactPickerContentViewController init](&v5, sel_init);
  -[CNContactPickerContentViewController view](v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, 100.0, 100.0);

  return v2;
}

- (void)setupWithOptions:(id)a3 readyBlock:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  CNContactStoreDataSource *v60;
  void *v61;
  _BOOL8 v62;
  CNContactNavigationController *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  _BOOL8 v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  _BOOL8 v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  _BOOL8 v105;
  void *v106;
  void *v107;
  void *v108;
  _BOOL8 v109;
  void *v110;
  _BOOL8 v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  _BOOL8 v121;
  void *v122;
  unint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  _BOOL8 v128;
  void *v129;
  _BOOL8 v130;
  void *v131;
  _BOOL8 v132;
  void *v133;
  uint64_t v134;
  void *v135;
  unint64_t v136;
  void *v137;
  uint64_t v138;
  void *v139;
  void *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  _BOOL8 v148;
  void *v149;
  _BOOL8 v150;
  void *v151;
  void *v152;
  _BOOL8 v153;
  void *v154;
  uint64_t v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  double v161;
  double v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  uint64_t v172;
  void *v173;
  void *v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  _BOOL4 v189;
  void *v190;
  id v191;
  void (**v192)(id, id);
  id v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  uint8_t v198[128];
  uint8_t buf[4];
  id v200;
  uint64_t v201;

  v201 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v192 = (void (**)(id, id))a4;
  objc_msgSend((id)objc_opt_class(), "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v200 = v6;
    _os_log_debug_impl(&dword_18AC56000, v7, OS_LOG_TYPE_DEBUG, "setupWithOptions: %@", buf, 0xCu);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Properties"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = 0u;
  v195 = 0u;
  v196 = 0u;
  v197 = 0u;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("predicateForEnablingContact"), CFSTR("predicateForSelectionOfContact"), CFSTR("predicateForSelectionOfProperty"), CFSTR("displayedPropertyKeys"), CFSTR("cardActions"), CFSTR("hidesSearchableSources"), CFSTR("onlyRealContacts"), CFSTR("allowsEditing"), CFSTR("allowsCancel"), CFSTR("allowsDone"), CFSTR("allowsNamePicking"), CFSTR("prompt"), CFSTR("hidesPromptInLandscape"), CFSTR("bannerTitle"), CFSTR("bannerValue"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v194, v198, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v195;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v195 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v194 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          -[CNContactPickerContentViewController setValue:forKey:](self, "setValue:forKey:", v15, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v194, v198, 16);
    }
    while (v11);
  }

  v193 = 0;
  -[CNContactPickerContentViewController _validatePredicatesWithError:](self, "_validatePredicatesWithError:", &v193);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v191 = v193;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ClientWantsSingleContact"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController setClientWantsSingleContact:](self, "setClientWantsSingleContact:", objc_msgSend(v17, "BOOLValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ClientWantsSingleProperty"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController setClientWantsSingleProperty:](self, "setClientWantsSingleProperty:", objc_msgSend(v18, "BOOLValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ClientWantsMultipleContacts"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController setClientWantsMultipleContacts:](self, "setClientWantsMultipleContacts:", objc_msgSend(v19, "BOOLValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ClientWantsMultipleProperties"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController setClientWantsMultipleProperties:](self, "setClientWantsMultipleProperties:", objc_msgSend(v20, "BOOLValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ClientHasContactsAccess"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController setClientHasContactsAccess:](self, "setClientHasContactsAccess:", objc_msgSend(v21, "BOOLValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("familyMember"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController setFamilyMember:](self, "setFamilyMember:", v22);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("parentContainer"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController setParentContainer:](self, "setParentContainer:", v23);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ignoresParentalRestrictions"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController setIgnoresParentalRestrictions:](self, "setIgnoresParentalRestrictions:", objc_msgSend(v24, "BOOLValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("prohibitedPropertyKeys"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController setProhibitedPropertyKeys:](self, "setProhibitedPropertyKeys:", v25);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allowsDeletion"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController setAllowsDeletion:](self, "setAllowsDeletion:", objc_msgSend(v26, "BOOLValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allowsNamePicking"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController setAllowsNamePicking:](self, "setAllowsNamePicking:", objc_msgSend(v27, "BOOLValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hostIdiom"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController setHostIdiom:](self, "setHostIdiom:", (int)objc_msgSend(v28, "intValue"));

  -[CNContactPickerContentViewController setShowsInlineActions:](self, "setShowsInlineActions:", 0);
  -[CNContactPickerContentViewController setShowsSharedProfile:](self, "setShowsSharedProfile:", 0);
  -[CNContactPickerContentViewController setShowsGroupMembership:](self, "setShowsGroupMembership:", 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allowsSearchForMultiSelect"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController setAllowsSearchForMultiSelect:](self, "setAllowsSearchForMultiSelect:", objc_msgSend(v29, "BOOLValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shouldDisplaySuggestionsController"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController setShouldDisplaySuggestionsController:](self, "setShouldDisplaySuggestionsController:", objc_msgSend(v30, "BOOLValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionsIgnoredContactIdentifiers"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController setSuggestionsIgnoredContactIdentifiers:](self, "setSuggestionsIgnoredContactIdentifiers:", v31);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionsInteractionDomains"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController setSuggestionsInteractionDomains:](self, "setSuggestionsInteractionDomains:", v32);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestedContacts"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController setSuggestedContacts:](self, "setSuggestedContacts:", v33);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shouldDisplayAddNewContactRow"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController setShouldDisplayAddNewContactRow:](self, "setShouldDisplayAddNewContactRow:", objc_msgSend(v34, "BOOLValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("targetGroupIdentifier"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController setTargetGroupIdentifier:](self, "setTargetGroupIdentifier:", v35);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shouldHideDuplicates"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController setShouldHideDuplicates:](self, "setShouldHideDuplicates:", objc_msgSend(v36, "BOOLValue"));

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "featureFlags");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "isFeatureEnabled:", 9);

  if (v39)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("limitedAccessContactSelection"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerContentViewController setLimitedAccessContactSelection:](self, "setLimitedAccessContactSelection:", v40);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("limitedAccessPickerType"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerContentViewController setLimitedAccessPickerType:](self, "setLimitedAccessPickerType:", objc_msgSend(v41, "integerValue"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("limitedAccessAppName"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerContentViewController setLimitedAccessAppName:](self, "setLimitedAccessAppName:", v42);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("limitedAccessAppBundleId"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerContentViewController setLimitedAccessAppBundleId:](self, "setLimitedAccessAppBundleId:", v43);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasPickerPrivacyUI"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerContentViewController setHasPickerPrivacyUI:](self, "setHasPickerPrivacyUI:", objc_msgSend(v44, "BOOLValue"));

    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "authorizationContext");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (!+[CNLimitedAccessPickerSupport isPickerLimitedAccess:](CNLimitedAccessPickerSupport, "isPickerLimitedAccess:", -[CNContactPickerContentViewController limitedAccessPickerType](self, "limitedAccessPickerType"))&& v46&& (objc_msgSend(v46, "isFullAccessGranted") & 1) == 0)
    {
      -[CNContactPickerContentViewController setHasPickerPrivacyUI:](self, "setHasPickerPrivacyUI:", 1);
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("limitedAccessSearchQuery"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerContentViewController setLimitedAccessInitialSearchQuery:](self, "setLimitedAccessInitialSearchQuery:", v47);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("limitedAccessContactCaption"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerContentViewController setLimitedAccessContactCaption:](self, "setLimitedAccessContactCaption:", objc_msgSend(v48, "integerValue"));

  }
  v49 = -[CNContactPickerContentViewController clientWantsMultipleContacts](self, "clientWantsMultipleContacts")
     || -[CNContactPickerContentViewController clientWantsMultipleProperties](self, "clientWantsMultipleProperties");
  -[CNContactPickerContentViewController contactNavigationController](self, "contactNavigationController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v50)
  {
    v189 = v49;
    if (objc_msgSend(MEMORY[0x1E0C97200], "suggestionsEnabled"))
    {
      if (-[CNContactPickerContentViewController onlyRealContacts](self, "onlyRealContacts"))
        v51 = 1;
      else
        v51 = 3;
    }
    else
    {
      v51 = 1;
    }
    -[CNContactPickerContentViewController managedConfiguration](self, "managedConfiguration");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      v53 = objc_alloc(MEMORY[0x1E0C97298]);
      objc_msgSend(MEMORY[0x1E0C972B0], "currentEnvironment");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactPickerContentViewController managedConfiguration](self, "managedConfiguration");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v53, "initWithEnvironment:options:managedConfiguration:", v54, v51, v55);

    }
    else
    {
      -[CNContactPickerContentViewController familyMember](self, "familyMember");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = (void *)MEMORY[0x1E0C97298];
      if (v57)
      {
        -[CNContactPickerContentViewController familyMember](self, "familyMember");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "storeForFamilyMember:", v59);
        v56 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C97298], "storeWithOptions:", v51);
        v56 = objc_claimAutoreleasedReturnValue();
      }
    }
    v188 = (void *)v56;
    v60 = -[CNContactStoreDataSource initWithStore:]([CNContactStoreDataSource alloc], "initWithStore:", v56);
    -[CNContactStoreDataSource setKeysToFetch:](v60, "setKeysToFetch:", v16);
    -[CNContactPickerContentViewController managedConfiguration](self, "managedConfiguration");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStoreDataSource setManagedConfiguration:](v60, "setManagedConfiguration:", v61);

    if (objc_msgSend(v16, "count"))
      v62 = 1;
    else
      v62 = +[CNLimitedAccessPickerSupport isPickerLimitedAccess:](CNLimitedAccessPickerSupport, "isPickerLimitedAccess:", -[CNContactPickerContentViewController limitedAccessPickerType](self, "limitedAccessPickerType"));
    -[CNContactStoreDataSource setFetchUnified:](v60, "setFetchUnified:", v62);
    v63 = -[CNContactNavigationController initWithDataSource:]([CNContactNavigationController alloc], "initWithDataSource:", v60);
    -[CNContactNavigationController setDelegate:](v63, "setDelegate:", self);
    -[CNContactNavigationController contactListViewController](v63, "contactListViewController");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setDisableContextMenus:", 1);

    -[CNContactPickerContentViewController managedConfiguration](self, "managedConfiguration");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (v65)
    {
      -[CNContactPickerContentViewController managedConfiguration](self, "managedConfiguration");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactNavigationController setManagedConfiguration:](v63, "setManagedConfiguration:", v66);

    }
    -[CNContactPickerContentViewController parentContainer](self, "parentContainer");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (v67)
    {
      v68 = (void *)MEMORY[0x1E0C99E60];
      -[CNContactPickerContentViewController parentContainer](self, "parentContainer");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "identifier");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setWithObject:", v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactStoreDataSource filter](v60, "filter");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setContainerIdentifiers:", v71);

    }
    if (!+[CNLimitedAccessPickerSupport shouldLimitedAccessPickerNeedContactsFilter:](CNLimitedAccessPickerSupport, "shouldLimitedAccessPickerNeedContactsFilter:", -[CNContactPickerContentViewController limitedAccessPickerType](self, "limitedAccessPickerType")))goto LABEL_51;
    -[CNContactPickerContentViewController limitedAccessContactSelection](self, "limitedAccessContactSelection");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStoreDataSource filter](v60, "filter");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setLimitedAccessIdentifiers:", v73);

    if (-[CNContactPickerContentViewController limitedAccessPickerType](self, "limitedAccessPickerType") == 5)
    {
      v184 = v16;
      v75 = (void *)MEMORY[0x1E0CB3940];
      CNContactsUIBundle();
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "localizedStringForKey:value:table:", CFSTR("LIMITED_CONTACTS_SELECTED_TITLE-%@"), &stru_1E20507A8, CFSTR("Localized"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactPickerContentViewController limitedAccessAppName](self, "limitedAccessAppName");
      v78 = objc_claimAutoreleasedReturnValue();
      v79 = (void *)v78;
    }
    else
    {
      if (-[CNContactPickerContentViewController limitedAccessPickerType](self, "limitedAccessPickerType") != 2)
        goto LABEL_45;
      v184 = v16;
      v75 = (void *)MEMORY[0x1E0CB3940];
      CNContactsUIBundle();
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "localizedStringForKey:value:table:", CFSTR("SELECTED_COUNT"), &stru_1E20507A8, CFSTR("Localized"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactPickerContentViewController limitedAccessContactSelection](self, "limitedAccessContactSelection");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v79, "count");
    }
    objc_msgSend(v75, "localizedStringWithFormat:", v77, v78);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStoreDataSource filter](v60, "filter");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setCustomDisplayName:", v80);

    v16 = v184;
LABEL_45:
    if (-[CNContactPickerContentViewController limitedAccessPickerType](self, "limitedAccessPickerType") == 6)
    {
      -[CNContactStoreDataSource filter](v60, "filter");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v82;
      v84 = 2;
    }
    else
    {
      if (-[CNContactPickerContentViewController limitedAccessPickerType](self, "limitedAccessPickerType") != 2
        && -[CNContactPickerContentViewController limitedAccessPickerType](self, "limitedAccessPickerType") != 5)
      {
        goto LABEL_51;
      }
      -[CNContactStoreDataSource filter](v60, "filter");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v82;
      v84 = 1;
    }
    objc_msgSend(v82, "setLimitedAccessFilterMode:", v84);

LABEL_51:
    -[CNContactStoreDataSource filter](v60, "filter");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = (void *)objc_msgSend(v85, "copy");
    -[CNContactNavigationController contactListViewController](v63, "contactListViewController");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "dataSource");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setFilter:", v86);

    -[CNContactNavigationController contactListViewController](v63, "contactListViewController");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setShouldAllowDrags:", 0);

    -[CNContactNavigationController contactListViewController](v63, "contactListViewController");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setShouldAllowDrops:", 0);

    v91 = -[CNContactPickerContentViewController allowsSearchForMultiSelect](self, "allowsSearchForMultiSelect");
    -[CNContactNavigationController contactListViewController](v63, "contactListViewController");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "setShouldAllowSearchForMultiSelect:", v91);

    -[CNContactPickerContentViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController setProhibitedPropertyKeys:](v63, "setProhibitedPropertyKeys:", v93);

    -[CNContactNavigationController setIgnoresMapsData:](v63, "setIgnoresMapsData:", 1);
    -[CNContactNavigationController setHideMailToGroupButton:](v63, "setHideMailToGroupButton:", 1);
    -[CNContactPickerContentViewController familyMember](self, "familyMember");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (v94)
    {
      -[CNContactNavigationController setHideGroupsButton:](v63, "setHideGroupsButton:", 1);
      v49 = v189;
    }
    else
    {
      -[CNContactPickerContentViewController parentContainer](self, "parentContainer");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v189;
      if (v95)
        v96 = 1;
      else
        v96 = +[CNLimitedAccessPickerSupport isPickerLimitedAccessSummary:](CNLimitedAccessPickerSupport, "isPickerLimitedAccessSummary:", -[CNContactPickerContentViewController limitedAccessPickerType](self, "limitedAccessPickerType"));
      -[CNContactNavigationController setHideGroupsButton:](v63, "setHideGroupsButton:", v96);

    }
    -[CNContactPickerContentViewController targetGroupIdentifier](self, "targetGroupIdentifier");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController setContactPickerTargetGroupIdentifier:](v63, "setContactPickerTargetGroupIdentifier:", v97);

    -[CNContactNavigationController contactListViewController](v63, "contactListViewController");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setShouldDisplayGroupsGrid:", 0);

    -[CNContactPickerContentViewController suggestedContacts](self, "suggestedContacts");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController contactListViewController](v63, "contactListViewController");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "setSuggestedContacts:", v99);

    -[CNContactPickerContentViewController suggestionsIgnoredContactIdentifiers](self, "suggestionsIgnoredContactIdentifiers");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController contactListViewController](v63, "contactListViewController");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setSuggestionsIgnoredContactIdentifiers:", v101);

    -[CNContactPickerContentViewController suggestionsInteractionDomains](self, "suggestionsInteractionDomains");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController contactListViewController](v63, "contactListViewController");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setSuggestionsInteractionDomains:", v103);

    v105 = -[CNContactPickerContentViewController shouldDisplaySuggestionsController](self, "shouldDisplaySuggestionsController");
    -[CNContactNavigationController contactListViewController](v63, "contactListViewController");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "setShouldDisplaySuggestionsController:", v105);

    -[CNContactNavigationController contactListViewController](v63, "contactListViewController");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "setAllowsEditingActions:", 0);

    -[CNContactNavigationController contactListViewController](v63, "contactListViewController");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setAllowsListEditing:", 0);

    v109 = -[CNContactPickerContentViewController shouldDisplayAddNewContactRow](self, "shouldDisplayAddNewContactRow");
    -[CNContactNavigationController contactListViewController](v63, "contactListViewController");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setShouldDisplayAddNewContactRow:", v109);

    v111 = -[CNContactPickerContentViewController shouldHideDuplicates](self, "shouldHideDuplicates");
    -[CNContactNavigationController contactListViewController](v63, "contactListViewController");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "setShouldHideDuplicates:", v111);

    -[CNContactPickerContentViewController limitedAccessContactSelection](self, "limitedAccessContactSelection");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController contactListViewController](v63, "contactListViewController");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "setLimitedAccessContactSelection:", v113);

    v115 = -[CNContactPickerContentViewController limitedAccessPickerType](self, "limitedAccessPickerType");
    -[CNContactNavigationController contactListViewController](v63, "contactListViewController");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "setLimitedAccessPickerType:", v115);

    -[CNContactPickerContentViewController limitedAccessAppName](self, "limitedAccessAppName");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController contactListViewController](v63, "contactListViewController");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "setLimitedAccessAppName:", v117);

    -[CNContactPickerContentViewController limitedAccessAppBundleId](self, "limitedAccessAppBundleId");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController contactListViewController](v63, "contactListViewController");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "setLimitedAccessAppBundleId:", v119);

    v121 = -[CNContactPickerContentViewController hasPickerPrivacyUI](self, "hasPickerPrivacyUI");
    -[CNContactNavigationController contactListViewController](v63, "contactListViewController");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "setHasPickerPrivacyUI:", v121);

    v123 = -[CNContactPickerContentViewController limitedAccessContactCaption](self, "limitedAccessContactCaption");
    -[CNContactNavigationController contactListViewController](v63, "contactListViewController");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "setLimitedAccessContactCaption:", v123);

    -[CNContactNavigationController setHostIdiom:](v63, "setHostIdiom:", -[CNContactPickerContentViewController hostIdiom](self, "hostIdiom"));
    -[CNContactPickerContentViewController parentContainer](self, "parentContainer");
    v125 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v125)
    {
      -[CNContactNavigationController accountsAndGroupsViewController](v63, "accountsAndGroupsViewController");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "selectAllContacts");

      -[CNContactNavigationController contactListViewController](v63, "contactListViewController");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "reloadTitle");

    }
    -[CNContactPickerContentViewController setDataSource:](self, "setDataSource:", v60);
    -[CNContactPickerContentViewController setContactNavigationController:](self, "setContactNavigationController:", v63);

  }
  v128 = -[CNContactPickerContentViewController allowsCancel](self, "allowsCancel");
  -[CNContactPickerContentViewController contactNavigationController](self, "contactNavigationController");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "setAllowsCanceling:", v128);

  v130 = -[CNContactPickerContentViewController allowsEditing](self, "allowsEditing");
  -[CNContactPickerContentViewController contactNavigationController](self, "contactNavigationController");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "setAllowsCardEditing:", v130);

  v132 = -[CNContactPickerContentViewController hidesSearchableSources](self, "hidesSearchableSources");
  -[CNContactPickerContentViewController contactNavigationController](self, "contactNavigationController");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "setHidesSearchableSources:", v132);

  v134 = -[CNContactPickerContentViewController limitedAccessPickerType](self, "limitedAccessPickerType");
  -[CNContactPickerContentViewController contactNavigationController](self, "contactNavigationController");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "setLimitedAccessPickerType:", v134);

  v136 = -[CNContactPickerContentViewController limitedAccessContactCaption](self, "limitedAccessContactCaption");
  -[CNContactPickerContentViewController contactNavigationController](self, "contactNavigationController");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "setLimitedAccessContactCaption:", v136);

  if (-[CNContactPickerContentViewController limitedAccessPickerType](self, "limitedAccessPickerType") == 6)
  {
    -[CNContactPickerContentViewController limitedAccessInitialSearchQuery](self, "limitedAccessInitialSearchQuery");
    v138 = objc_claimAutoreleasedReturnValue();
    if (v138)
    {
      v139 = (void *)v138;
      -[CNContactPickerContentViewController limitedAccessInitialSearchQuery](self, "limitedAccessInitialSearchQuery");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = objc_msgSend(v140, "length");

      if (v141)
      {
        -[CNContactPickerContentViewController contactNavigationController](self, "contactNavigationController");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactPickerContentViewController limitedAccessInitialSearchQuery](self, "limitedAccessInitialSearchQuery");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "searchForString:makeSearchBarFirstResponder:", v143, 0);

      }
    }
  }
  if (v49)
  {
    if (-[CNContactPickerContentViewController limitedAccessPickerType](self, "limitedAccessPickerType") == 1)
    {
      -[CNContactPickerContentViewController setAllowsDone:](self, "setAllowsDone:", 0);
      -[CNContactPickerContentViewController contactNavigationController](self, "contactNavigationController");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "accountsAndGroupsViewController");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "setIsLimitedAccessOnboarding:", 1);

    }
    else
    {
      -[CNContactPickerContentViewController setAllowsDone:](self, "setAllowsDone:", 1);
    }
    -[CNContactPickerContentViewController contactNavigationController](self, "contactNavigationController");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "contactListViewController");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "setupForMultiSelection");

  }
  v148 = -[CNContactPickerContentViewController allowsDone](self, "allowsDone");
  -[CNContactPickerContentViewController contactNavigationController](self, "contactNavigationController");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "setAllowsDone:", v148);

  v150 = -[CNContactPickerContentViewController allowsDone](self, "allowsDone");
  -[CNContactPickerContentViewController contactNavigationController](self, "contactNavigationController");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "accountsAndGroupsViewController");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "setAllowsDone:", v150);

  v153 = -[CNContactPickerContentViewController allowsCancel](self, "allowsCancel");
  -[CNContactPickerContentViewController contactNavigationController](self, "contactNavigationController");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "accountsAndGroupsViewController");
  v155 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v155, "setAllowsCanceling:", v153);

  -[CNContactPickerContentViewController contactNavigationController](self, "contactNavigationController");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "accountsAndGroupsViewController");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "setAllowsEditing:", 0);

  -[CNContactPickerContentViewController childViewControllers](self, "childViewControllers");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController contactNavigationController](self, "contactNavigationController");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v155) = objc_msgSend(v158, "containsObject:", v159);

  if ((v155 & 1) == 0)
    -[UIViewController cnui_addChildViewController:](self, "cnui_addChildViewController:", self->_contactNavigationController);
  -[CNContactPickerContentViewController view](self, "view");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "bounds");
  -[CNContactPickerContentViewController _updatePromptWithViewSize:transitionCoordinator:](self, "_updatePromptWithViewSize:transitionCoordinator:", 0, v161, v162);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ScrollContact"));
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  if (v163)
  {
    -[CNContactNavigationController dataSource](self->_contactNavigationController, "dataSource");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "store");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    if (v165)
    {
      -[CNContactPickerContentViewController contactNavigationController](self, "contactNavigationController");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "contactListViewController");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "contactFormatter");
      v168 = (void *)objc_claimAutoreleasedReturnValue();

      v187 = v168;
      objc_msgSend(v168, "stringFromContact:", v163);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v169, "length"))
      {
        objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingName:", v169);
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v165, "unifiedContactsMatchingPredicate:keysToFetch:error:");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v190 = 0;
        v170 = 0;
      }
      v186 = v165;
      if (!objc_msgSend(v170, "count"))
      {
        v185 = v16;
        objc_msgSend(v163, "familyName");
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        v172 = objc_msgSend(v171, "length");

        if (v172)
        {
          v173 = (void *)MEMORY[0x1E0C97200];
          objc_msgSend(v163, "familyName");
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v173, "predicateForContactsMatchingName:", v174);
          v175 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v165, "unifiedContactsMatchingPredicate:keysToFetch:error:", v175, MEMORY[0x1E0C9AA60], 0);
          v176 = objc_claimAutoreleasedReturnValue();

          v190 = (void *)v175;
          v170 = (void *)v176;
        }
        v16 = v185;
      }
      v177 = v169;
      if (objc_msgSend(v170, "count"))
      {
        objc_msgSend(v170, "firstObject");
        v178 = v16;
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "indexPathForContact:", v179);
        v180 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = v178;
      }
      else
      {
        v180 = 0;
      }

      v165 = v186;
      if (v180)
      {
        -[CNContactNavigationController contactListViewController](self->_contactNavigationController, "contactListViewController");
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v181, "collectionView");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v182, "scrollToItemAtIndexPath:atScrollPosition:animated:", v180, 2, 0);

      }
    }

  }
  -[CNContactPickerContentViewController navigationItem](self, "navigationItem");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "setLargeTitleDisplayMode:", 2);

  if (v192)
    v192[2](v192, v191);

}

- (id)_validatePredicatesWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void (**v11)(void *, const __CFString *);
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD aBlock[5];
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C973B8]);
  objc_msgSend((id)objc_opt_class(), "descriptorForContactPropertiesSupportingPredicateEvaluation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowedKeys:", v8);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__CNContactPickerContentViewController__validatePredicatesWithError___block_invoke;
  aBlock[3] = &unk_1E204EF98;
  aBlock[4] = self;
  v9 = v6;
  v19 = v9;
  v10 = v5;
  v20 = v10;
  v11 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
  v11[2](v11, CFSTR("predicateForEnablingContact"));
  v11[2](v11, CFSTR("predicateForSelectionOfContact"));
  objc_msgSend(v9, "usedKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowedKeys:", &unk_1E20D3940);
  v11[2](v11, CFSTR("predicateForSelectionOfProperty"));
  v13 = objc_msgSend(v10, "count");
  if (a3 && v13)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0C968C8];
    v21 = *MEMORY[0x1E0C968D0];
    v22 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 300, v16);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (void)_updatePromptWithViewSize:(CGSize)a3 transitionCoordinator:(id)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  height = a3.height;
  width = a3.width;
  -[CNContactPickerContentViewController prompt](self, "prompt", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (width <= height
     || !-[CNContactPickerContentViewController hidesPromptInLandscape](self, "hidesPromptInLandscape")))
  {
    -[CNContactPickerContentViewController prompt](self, "prompt");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  -[CNContactNavigationController contactListViewController](self->_contactNavigationController, "contactListViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPrompt:", v10);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)CNContactPickerContentViewController;
  v7 = a4;
  -[CNContactPickerContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[CNContactPickerContentViewController _updatePromptWithViewSize:transitionCoordinator:](self, "_updatePromptWithViewSize:transitionCoordinator:", v7, width, height, v8.receiver, v8.super_class);

}

- (UIBarButtonItem)addContactBarButtonItem
{
  void *v2;
  void *v3;

  -[CNContactPickerContentViewController contactNavigationController](self, "contactNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addContactBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBarButtonItem *)v3;
}

- (void)invalidateSelectionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[CNContactPickerContentViewController contactNavigationController](self, "contactNavigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactListViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v6, "indexPathsForSelectedItems", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "deselectItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v3);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (BOOL)contactNavigationControllerShouldAddNewContact:(id)a3
{
  void *v4;
  void *v5;

  -[CNContactPickerContentViewController familyMember](self, "familyMember", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNContactPickerContentViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pickerDidSelectAddNewContact");

  }
  return v4 == 0;
}

- (BOOL)contactNavigationController:(id)a3 canSelectContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;

  v6 = a3;
  v7 = a4;
  -[CNContactPickerContentViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keysToFetch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "areKeysAvailable:", v9);

  if ((v10 & 1) == 0)
  {
    -[CNContactPickerContentViewController contactNavigationController](self, "contactNavigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerContentViewController dataSource](self, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "keysToFetch");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "completeContactFromContact:fromMainStoreOnly:keysToFetch:", v7, 0, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v15;
  }
  -[CNContactPickerContentViewController predicateForEnablingContact](self, "predicateForEnablingContact");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CNContactPickerContentViewController predicateForEnablingContact](self, "predicateForEnablingContact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "evaluateWithObject:", v7);

  }
  else
  {
    v18 = 1;
  }

  return v18;
}

- (BOOL)contactSuggestionViewController:(id)a3 shouldSelectContact:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  char v14;
  BOOL v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  id obj;
  void *v71;
  id v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[4];
  id v76;
  id v77;
  CNContactPickerContentViewController *v78;
  void *v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v72 = a5;
  -[CNContactPickerContentViewController predicateForSelectionOfProperty](self, "predicateForSelectionOfProperty");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10
    && (v11 = (void *)v10,
        v12 = -[CNContactPickerContentViewController clientWantsMultipleProperties](self, "clientWantsMultipleProperties"), v11, v12)&& (objc_msgSend(v8, "selectedContacts"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v14 = objc_msgSend(v13, "containsObject:", v9), v13, (v14 & 1) == 0))
  {
    objc_msgSend(v8, "collectionView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97200], "multiValuePropertiesSupportingPredicateValidation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerContentViewController contactNavigationController](self, "contactNavigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "completeContactFromContact:fromMainStoreOnly:keysToFetch:", v9, 0, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactPickerContentViewController predicateForSelectionOfProperty](self, "predicateForSelectionOfProperty");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "validPropertiesByEvaluatingPredicate:onMultiValueProperties:", v21, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v22, "count"))
    {
      if (!self->_contactProperties)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactPickerContentViewController setContactProperties:](self, "setContactProperties:", v23);

      }
      if (objc_msgSend(v22, "count") == 1)
      {
        objc_msgSend(v22, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](self->_contactProperties, "addObject:", v24);

        v15 = 1;
      }
      else
      {
        v66 = v20;
        v67 = v17;
        v68 = v9;
        v69 = v8;
        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v64 = v22;
        obj = v22;
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v82;
          do
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v82 != v28)
                objc_enumerationMutation(obj);
              v30 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
              objc_msgSend(v30, "label", v64);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (v31)
              {
                objc_msgSend(MEMORY[0x1E0C97338], "localizedStringForLabel:", v31);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v33 = (void *)MEMORY[0x1E0C97200];
                objc_msgSend(v30, "key");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "localizedStringForKey:", v34);
                v32 = (void *)objc_claimAutoreleasedReturnValue();

              }
              v35 = (void *)MEMORY[0x1E0DC3448];
              objc_msgSend(v30, "value");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v75[0] = MEMORY[0x1E0C809B0];
              v75[1] = 3221225472;
              v75[2] = __104__CNContactPickerContentViewController_contactSuggestionViewController_shouldSelectContact_atIndexPath___block_invoke;
              v75[3] = &unk_1E204EFC0;
              v76 = v71;
              v77 = v72;
              v78 = self;
              v79 = v30;
              v37 = v25;
              v80 = v37;
              objc_msgSend(v35, "_actionWithTitle:descriptiveText:image:style:handler:shouldDismissHandler:", v36, v32, 0, 0, v75, &__block_literal_global_43_57079);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "addAction:", v38);

            }
            v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
          }
          while (v27);
        }

        v39 = (void *)MEMORY[0x1E0DC3448];
        CNContactsUIBundle();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v73[0] = MEMORY[0x1E0C809B0];
        v73[1] = 3221225472;
        v73[2] = __104__CNContactPickerContentViewController_contactSuggestionViewController_shouldSelectContact_atIndexPath___block_invoke_3;
        v73[3] = &unk_1E204F7F0;
        v42 = v25;
        v74 = v42;
        objc_msgSend(v39, "actionWithTitle:style:handler:", v41, 1, v73);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addAction:", v43);

        objc_msgSend(v42, "popoverPresentationController");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44;
        v17 = v67;
        if (v44)
        {
          objc_msgSend(v44, "setSourceView:", v71);
          objc_msgSend(v71, "layoutAttributesForItemAtIndexPath:", v72);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "frame");
          v48 = v47;
          v50 = v49;
          v52 = v51;
          v54 = v53;
          objc_msgSend(v71, "superview");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "convertRect:toView:", v55, v48, v50, v52, v54);
          v57 = v56;
          v59 = v58;
          v61 = v60;
          v63 = v62;

          objc_msgSend(v45, "setSourceRect:", v57, v59, v61, v63);
        }
        -[CNContactPickerContentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v42, 1, 0, v64);

        v15 = 0;
        v9 = v68;
        v8 = v69;
        v22 = v65;
        v20 = v66;
      }
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (BOOL)contactNavigationController:(id)a3 shouldSelectContact:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id obj;
  void *v60;
  CNContactPickerContentViewController *v61;
  void *v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  id v72;
  CNContactPickerContentViewController *v73;
  void *v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v63 = a5;
  if ((objc_msgSend(v9, "isSuggested") & 1) == 0
    && (-[CNContactPickerContentViewController predicateForSelectionOfProperty](self, "predicateForSelectionOfProperty"),
        (v10 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v11 = (void *)v10,
        v12 = -[CNContactPickerContentViewController clientWantsMultipleProperties](self, "clientWantsMultipleProperties"), v11, v12))
  {
    objc_msgSend(v8, "contactListViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionView");
    v14 = objc_claimAutoreleasedReturnValue();

    v62 = (void *)v14;
    objc_msgSend((id)v14, "indexPathsForSelectedItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v14) = objc_msgSend(v15, "containsObject:", v63);

    if ((v14 & 1) != 0)
    {
      v16 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C97200], "multiValuePropertiesSupportingPredicateValidation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactPickerContentViewController contactNavigationController](self, "contactNavigationController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dataSource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "completeContactFromContact:fromMainStoreOnly:keysToFetch:", v9, 0, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNContactPickerContentViewController predicateForSelectionOfProperty](self, "predicateForSelectionOfProperty");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "validPropertiesByEvaluatingPredicate:onMultiValueProperties:", v22, v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v23, "count"))
      {
        if (!self->_contactProperties)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactPickerContentViewController setContactProperties:](self, "setContactProperties:", v24);

        }
        if (objc_msgSend(v23, "count") == 1)
        {
          objc_msgSend(v23, "firstObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](self->_contactProperties, "addObject:", v25);

          v16 = 1;
        }
        else
        {
          v55 = v21;
          v56 = v18;
          v61 = self;
          v57 = v9;
          v58 = v8;
          objc_msgSend(v62, "cellForItemAtIndexPath:", v63);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "backgroundColor");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3658], "systemGray6Color");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v26;
          objc_msgSend(v26, "setBackgroundColor:", v27);

          objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = 0u;
          v77 = 0u;
          v78 = 0u;
          v79 = 0u;
          v53 = v23;
          obj = v23;
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v77;
            do
            {
              for (i = 0; i != v31; ++i)
              {
                if (*(_QWORD *)v77 != v32)
                  objc_enumerationMutation(obj);
                v34 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
                objc_msgSend(v34, "label", v53);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                if (v35)
                {
                  objc_msgSend(MEMORY[0x1E0C97338], "localizedStringForLabel:", v35);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v37 = (void *)MEMORY[0x1E0C97200];
                  objc_msgSend(v34, "key");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "localizedStringForKey:", v38);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();

                }
                v39 = (void *)MEMORY[0x1E0DC3448];
                objc_msgSend(v34, "value");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v68[0] = MEMORY[0x1E0C809B0];
                v68[1] = 3221225472;
                v68[2] = __100__CNContactPickerContentViewController_contactNavigationController_shouldSelectContact_atIndexPath___block_invoke;
                v68[3] = &unk_1E204F028;
                v69 = v28;
                v70 = v60;
                v71 = v62;
                v72 = v63;
                v73 = v61;
                v74 = v34;
                v41 = v29;
                v75 = v41;
                objc_msgSend(v39, "_actionWithTitle:descriptiveText:image:style:handler:shouldDismissHandler:", v40, v36, 0, 0, v68, &__block_literal_global_47_57071);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "addAction:", v42);

              }
              v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
            }
            while (v31);
          }

          v43 = (void *)MEMORY[0x1E0DC3448];
          CNContactsUIBundle();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v64[0] = MEMORY[0x1E0C809B0];
          v64[1] = 3221225472;
          v64[2] = __100__CNContactPickerContentViewController_contactNavigationController_shouldSelectContact_atIndexPath___block_invoke_3;
          v64[3] = &unk_1E204F9D8;
          v65 = v28;
          v66 = v60;
          v46 = v29;
          v67 = v46;
          v47 = v60;
          v48 = v28;
          objc_msgSend(v43, "actionWithTitle:style:handler:", v45, 1, v64);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addAction:", v49);

          objc_msgSend(v46, "popoverPresentationController");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v50;
          if (v50)
          {
            objc_msgSend(v50, "setSourceView:", v62);
            objc_msgSend(v62, "layoutAttributesForItemAtIndexPath:", v63);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "frame");
            objc_msgSend(v51, "setSourceRect:");

          }
          -[CNContactPickerContentViewController presentViewController:animated:completion:](v61, "presentViewController:animated:completion:", v46, 1, 0, v53);

          v16 = 0;
          v9 = v57;
          v8 = v58;
          v21 = v55;
          v18 = v56;
          v23 = v54;
        }
      }
      else
      {
        v16 = 0;
      }

    }
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (BOOL)contactNavigationController:(id)a3 shouldShowCardForContact:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  int v11;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isSuggested") & 1) != 0 || (objc_msgSend(v7, "hasSuggestedProperties") & 1) != 0)
    goto LABEL_3;
  if (-[CNContactPickerContentViewController clientWantsMultipleContacts](self, "clientWantsMultipleContacts")
    || -[CNContactPickerContentViewController clientWantsMultipleProperties](self, "clientWantsMultipleProperties"))
  {
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  -[CNContactPickerContentViewController predicateForSelectionOfContact](self, "predicateForSelectionOfContact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CNContactPickerContentViewController predicateForSelectionOfContact](self, "predicateForSelectionOfContact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "evaluateWithObject:", v7);

    if (v11)
      goto LABEL_10;
  }
  else if (-[CNContactPickerContentViewController clientWantsSingleContact](self, "clientWantsSingleContact"))
  {
LABEL_10:
    -[CNContactPickerContentViewController _selectedContact:](self, "_selectedContact:", v7);
    goto LABEL_11;
  }
LABEL_3:
  v8 = 1;
LABEL_12:

  return v8;
}

- (BOOL)contactNavigationControllerShouldShowContactsOnKeyCommands:(id)a3
{
  return 0;
}

- (BOOL)contactNavigationController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  if (-[CNContactPickerContentViewController clientWantsSingleProperty](self, "clientWantsSingleProperty")
    && ((-[CNContactPickerContentViewController predicateForSelectionOfProperty](self, "predicateForSelectionOfProperty"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, !v8)|| (-[CNContactPickerContentViewController predicateForSelectionOfProperty](self, "predicateForSelectionOfProperty"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v10 = objc_msgSend(v9, "evaluateWithObject:", v7), v9, v10)))
  {
    -[CNContactPickerContentViewController _selectedProperty:](self, "_selectedProperty:", v7);
    v11 = 0;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BOOL)contactNavigationControllerShouldDismissSearchOnSelection:(id)a3
{
  return 1;
}

- (BOOL)contactNavigationController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  int v14;
  uint64_t v15;

  v6 = a4;
  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  -[CNContactPickerContentViewController displayedPropertyKeys](self, "displayedPropertyKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDisplayedPropertyKeys:", v10);

  -[CNContactPickerContentViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProhibitedPropertyKeys:", v11);

  objc_msgSend(v9, "setIgnoresParentalRestrictions:", -[CNContactPickerContentViewController ignoresParentalRestrictions](self, "ignoresParentalRestrictions"));
  objc_msgSend(v9, "setAllowsNamePicking:", -[CNContactPickerContentViewController allowsNamePicking](self, "allowsNamePicking"));
  objc_msgSend(v9, "setShowsInlineActions:", -[CNContactPickerContentViewController showsInlineActions](self, "showsInlineActions"));
  objc_msgSend(v9, "setShowsSharedProfile:", -[CNContactPickerContentViewController showsSharedProfile](self, "showsSharedProfile"));
  objc_msgSend(v9, "setShowsGroupMembership:", -[CNContactPickerContentViewController showsGroupMembership](self, "showsGroupMembership"));
  v12 = -[CNContactPickerContentViewController cardActions](self, "cardActions");
  objc_msgSend(v9, "contact");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isSuggested");

  if (v14)
    v12 |= 0x20uLL;
  if (-[CNContactPickerContentViewController allowsDeletion](self, "allowsDeletion"))
    v15 = v12 | 0x100;
  else
    v15 = v12;
  objc_msgSend(v9, "setActions:", v15);

  return 0;
}

- (void)contactNavigationControllerDidComplete:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_contactProperties)
  {
    -[CNContactPickerContentViewController _selectedProperties:](self, "_selectedProperties:", self->_contactProperties);
  }
  else
  {
    objc_msgSend(a3, "contactListViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (+[CNLimitedAccessPickerSupport isPickerLimitedAccess:](CNLimitedAccessPickerSupport, "isPickerLimitedAccess:", -[CNContactPickerContentViewController limitedAccessPickerType](self, "limitedAccessPickerType")))
    {
      objc_msgSend(v6, "limitedAccessTotalSelectedContacts");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNLimitedAccessPickerSupport contactsFromIdentifiers:](CNLimitedAccessPickerSupport, "contactsFromIdentifiers:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v6, "selectedContacts");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CNContactPickerContentViewController _selectedContacts:](self, "_selectedContacts:", v5);

  }
}

- (void)contactNavigationController:(id)a3 didCompleteWithNewContact:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CNContactPickerContentViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pickerDidCompleteWithNewContact:", v5);

}

- (void)contactNavigationControllerDidCancel:(id)a3
{
  id v3;

  -[CNContactPickerContentViewController delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pickerDidCancel");

}

- (void)contactNavigationControllerDidGoBack:(id)a3
{
  id v3;

  -[CNContactPickerContentViewController delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pickerDidGoBack");

}

- (id)descriptorsForKeysRequiredByDelegate
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  +[CNContactContentViewController descriptorForRequiredKeys](CNContactContentViewController, "descriptorForRequiredKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_selectedContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CNContactPickerContentViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController descriptorsForKeysRequiredByDelegate](self, "descriptorsForKeysRequiredByDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "completeContactFromContact:fromMainStoreOnly:keysToFetch:", v4, 1, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactPickerContentViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pickerDidSelectContact:property:", v8, 0);

}

- (void)_selectedProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[CNContactPickerContentViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerContentViewController descriptorsForKeysRequiredByDelegate](self, "descriptorsForKeysRequiredByDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "completeContactFromContact:fromMainStoreOnly:keysToFetch:", v6, 1, v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C97280];
  objc_msgSend(v4, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "contactPropertyWithContact:propertyKey:identifier:", v13, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactPickerContentViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pickerDidSelectContact:property:", 0, v11);

}

- (void)_selectedContacts:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        -[CNContactPickerContentViewController dataSource](self, "dataSource", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactPickerContentViewController descriptorsForKeysRequiredByDelegate](self, "descriptorsForKeysRequiredByDelegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "completeContactFromContact:fromMainStoreOnly:keysToFetch:", v11, 1, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v14);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  -[CNContactPickerContentViewController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pickerDidSelectContacts:properties:", v5, 0);

}

- (void)_selectedProperties:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        -[CNContactPickerContentViewController dataSource](self, "dataSource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "contact");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactPickerContentViewController descriptorsForKeysRequiredByDelegate](self, "descriptorsForKeysRequiredByDelegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "completeContactFromContact:fromMainStoreOnly:keysToFetch:", v12, 1, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (void *)MEMORY[0x1E0C97280];
        objc_msgSend(v10, "key");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "contactPropertyWithContact:propertyKey:identifier:", v14, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v18);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  -[CNContactPickerContentViewController delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "pickerDidSelectContacts:properties:", 0, v5);

}

- (void)contactNavigationController:(id)a3 didUpdateLimitedAccessSelection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[CNContactPickerContentViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactListViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "didUpdateLimitedAccessSelection:contactListViewController:", v6, v8);
}

- (void)contactNavigationControllerShouldEditLimitedAccess:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNContactPickerContentViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactListViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "contactListViewControllerShouldEditLimitedAccessSelection:", v5);
}

- (CNContactPickerContentDelegate)delegate
{
  return (CNContactPickerContentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)clientWantsSingleContact
{
  return self->_clientWantsSingleContact;
}

- (void)setClientWantsSingleContact:(BOOL)a3
{
  self->_clientWantsSingleContact = a3;
}

- (BOOL)clientWantsSingleProperty
{
  return self->_clientWantsSingleProperty;
}

- (void)setClientWantsSingleProperty:(BOOL)a3
{
  self->_clientWantsSingleProperty = a3;
}

- (BOOL)clientWantsMultipleContacts
{
  return self->_clientWantsMultipleContacts;
}

- (void)setClientWantsMultipleContacts:(BOOL)a3
{
  self->_clientWantsMultipleContacts = a3;
}

- (BOOL)clientWantsMultipleProperties
{
  return self->_clientWantsMultipleProperties;
}

- (void)setClientWantsMultipleProperties:(BOOL)a3
{
  self->_clientWantsMultipleProperties = a3;
}

- (BOOL)clientHasContactsAccess
{
  return self->_clientHasContactsAccess;
}

- (void)setClientHasContactsAccess:(BOOL)a3
{
  self->_clientHasContactsAccess = a3;
}

- (CNContactNavigationController)contactNavigationController
{
  return self->_contactNavigationController;
}

- (void)setContactNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_contactNavigationController, a3);
}

- (CNContactStoreDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSMutableArray)contactProperties
{
  return self->_contactProperties;
}

- (void)setContactProperties:(id)a3
{
  objc_storeStrong((id *)&self->_contactProperties, a3);
}

- (CNContainer)parentContainer
{
  return self->_parentContainer;
}

- (void)setParentContainer:(id)a3
{
  objc_storeStrong((id *)&self->_parentContainer, a3);
}

- (NSArray)displayedPropertyKeys
{
  return self->_displayedPropertyKeys;
}

- (void)setDisplayedPropertyKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (int64_t)cardActions
{
  return self->_cardActions;
}

- (void)setCardActions:(int64_t)a3
{
  self->_cardActions = a3;
}

- (BOOL)hidesSearchableSources
{
  return self->_hidesSearchableSources;
}

- (void)setHidesSearchableSources:(BOOL)a3
{
  self->_hidesSearchableSources = a3;
}

- (BOOL)onlyRealContacts
{
  return self->_onlyRealContacts;
}

- (void)setOnlyRealContacts:(BOOL)a3
{
  self->_onlyRealContacts = a3;
}

- (BOOL)ignoresParentalRestrictions
{
  return self->_ignoresParentalRestrictions;
}

- (void)setIgnoresParentalRestrictions:(BOOL)a3
{
  self->_ignoresParentalRestrictions = a3;
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (BOOL)allowsCancel
{
  return self->_allowsCancel;
}

- (void)setAllowsCancel:(BOOL)a3
{
  self->_allowsCancel = a3;
}

- (BOOL)allowsDeletion
{
  return self->_allowsDeletion;
}

- (void)setAllowsDeletion:(BOOL)a3
{
  self->_allowsDeletion = a3;
}

- (BOOL)allowsDone
{
  return self->_allowsDone;
}

- (void)setAllowsDone:(BOOL)a3
{
  self->_allowsDone = a3;
}

- (BOOL)allowsSearchForMultiSelect
{
  return self->_allowsSearchForMultiSelect;
}

- (void)setAllowsSearchForMultiSelect:(BOOL)a3
{
  self->_allowsSearchForMultiSelect = a3;
}

- (BOOL)allowsNamePicking
{
  return self->_allowsNamePicking;
}

- (void)setAllowsNamePicking:(BOOL)a3
{
  self->_allowsNamePicking = a3;
}

- (BOOL)showsInlineActions
{
  return self->_showsInlineActions;
}

- (void)setShowsInlineActions:(BOOL)a3
{
  self->_showsInlineActions = a3;
}

- (BOOL)showsSharedProfile
{
  return self->_showsSharedProfile;
}

- (void)setShowsSharedProfile:(BOOL)a3
{
  self->_showsSharedProfile = a3;
}

- (BOOL)showsGroupMembership
{
  return self->_showsGroupMembership;
}

- (void)setShowsGroupMembership:(BOOL)a3
{
  self->_showsGroupMembership = a3;
}

- (BOOL)shouldDisplayAddNewContactRow
{
  return self->_shouldDisplayAddNewContactRow;
}

- (void)setShouldDisplayAddNewContactRow:(BOOL)a3
{
  self->_shouldDisplayAddNewContactRow = a3;
}

- (NSString)targetGroupIdentifier
{
  return self->_targetGroupIdentifier;
}

- (void)setTargetGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (BOOL)hidesPromptInLandscape
{
  return self->_hidesPromptInLandscape;
}

- (void)setHidesPromptInLandscape:(BOOL)a3
{
  self->_hidesPromptInLandscape = a3;
}

- (NSString)bannerTitle
{
  return self->_bannerTitle;
}

- (void)setBannerTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (NSString)bannerValue
{
  return self->_bannerValue;
}

- (void)setBannerValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (NSPredicate)predicateForEnablingContact
{
  return self->_predicateForEnablingContact;
}

- (void)setPredicateForEnablingContact:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (NSPredicate)predicateForSelectionOfContact
{
  return self->_predicateForSelectionOfContact;
}

- (void)setPredicateForSelectionOfContact:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (NSPredicate)predicateForSelectionOfProperty
{
  return self->_predicateForSelectionOfProperty;
}

- (void)setPredicateForSelectionOfProperty:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (FAFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)setFamilyMember:(id)a3
{
  objc_storeStrong((id *)&self->_familyMember, a3);
}

- (NSArray)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (void)setProhibitedPropertyKeys:(id)a3
{
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, a3);
}

- (BOOL)shouldDisplaySuggestionsController
{
  return self->_shouldDisplaySuggestionsController;
}

- (void)setShouldDisplaySuggestionsController:(BOOL)a3
{
  self->_shouldDisplaySuggestionsController = a3;
}

- (NSArray)suggestionsIgnoredContactIdentifiers
{
  return self->_suggestionsIgnoredContactIdentifiers;
}

- (void)setSuggestionsIgnoredContactIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsIgnoredContactIdentifiers, a3);
}

- (NSArray)suggestionsInteractionDomains
{
  return self->_suggestionsInteractionDomains;
}

- (void)setSuggestionsInteractionDomains:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsInteractionDomains, a3);
}

- (NSArray)suggestedContacts
{
  return self->_suggestedContacts;
}

- (void)setSuggestedContacts:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedContacts, a3);
}

- (BOOL)shouldHideDuplicates
{
  return self->_shouldHideDuplicates;
}

- (void)setShouldHideDuplicates:(BOOL)a3
{
  self->_shouldHideDuplicates = a3;
}

- (NSSet)limitedAccessContactSelection
{
  return self->_limitedAccessContactSelection;
}

- (void)setLimitedAccessContactSelection:(id)a3
{
  objc_storeStrong((id *)&self->_limitedAccessContactSelection, a3);
}

- (int)limitedAccessPickerType
{
  return self->_limitedAccessPickerType;
}

- (void)setLimitedAccessPickerType:(int)a3
{
  self->_limitedAccessPickerType = a3;
}

- (NSString)limitedAccessAppName
{
  return self->_limitedAccessAppName;
}

- (void)setLimitedAccessAppName:(id)a3
{
  objc_storeStrong((id *)&self->_limitedAccessAppName, a3);
}

- (NSString)limitedAccessAppBundleId
{
  return self->_limitedAccessAppBundleId;
}

- (void)setLimitedAccessAppBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_limitedAccessAppBundleId, a3);
}

- (BOOL)hasPickerPrivacyUI
{
  return self->_hasPickerPrivacyUI;
}

- (void)setHasPickerPrivacyUI:(BOOL)a3
{
  self->_hasPickerPrivacyUI = a3;
}

- (NSString)limitedAccessInitialSearchQuery
{
  return self->_limitedAccessInitialSearchQuery;
}

- (void)setLimitedAccessInitialSearchQuery:(id)a3
{
  objc_storeStrong((id *)&self->_limitedAccessInitialSearchQuery, a3);
}

- (unint64_t)limitedAccessContactCaption
{
  return self->_limitedAccessContactCaption;
}

- (void)setLimitedAccessContactCaption:(unint64_t)a3
{
  self->_limitedAccessContactCaption = a3;
}

- (int64_t)hostIdiom
{
  return self->_hostIdiom;
}

- (void)setHostIdiom:(int64_t)a3
{
  self->_hostIdiom = a3;
}

- (CNAccessAuthorization)accessAuthorization
{
  return self->_accessAuthorization;
}

- (void)setAccessAuthorization:(id)a3
{
  objc_storeStrong((id *)&self->_accessAuthorization, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessAuthorization, 0);
  objc_storeStrong((id *)&self->_limitedAccessInitialSearchQuery, 0);
  objc_storeStrong((id *)&self->_limitedAccessAppBundleId, 0);
  objc_storeStrong((id *)&self->_limitedAccessAppName, 0);
  objc_storeStrong((id *)&self->_limitedAccessContactSelection, 0);
  objc_storeStrong((id *)&self->_suggestedContacts, 0);
  objc_storeStrong((id *)&self->_suggestionsInteractionDomains, 0);
  objc_storeStrong((id *)&self->_suggestionsIgnoredContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_predicateForSelectionOfProperty, 0);
  objc_storeStrong((id *)&self->_predicateForSelectionOfContact, 0);
  objc_storeStrong((id *)&self->_predicateForEnablingContact, 0);
  objc_storeStrong((id *)&self->_bannerValue, 0);
  objc_storeStrong((id *)&self->_bannerTitle, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_targetGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_displayedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_parentContainer, 0);
  objc_storeStrong((id *)&self->_contactProperties, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_contactNavigationController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __100__CNContactPickerContentViewController_contactNavigationController_shouldSelectContact_atIndexPath___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "selectItemAtIndexPath:animated:scrollPosition:", *(_QWORD *)(a1 + 56), 0, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 1024), "addObject:", *(_QWORD *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 80), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __100__CNContactPickerContentViewController_contactNavigationController_shouldSelectContact_atIndexPath___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __100__CNContactPickerContentViewController_contactNavigationController_shouldSelectContact_atIndexPath___block_invoke_2()
{
  return 0;
}

uint64_t __104__CNContactPickerContentViewController_contactSuggestionViewController_shouldSelectContact_atIndexPath___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "selectItemAtIndexPath:animated:scrollPosition:", *(_QWORD *)(a1 + 40), 0, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1024), "addObject:", *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 64), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __104__CNContactPickerContentViewController_contactSuggestionViewController_shouldSelectContact_atIndexPath___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __104__CNContactPickerContentViewController_contactSuggestionViewController_shouldSelectContact_atIndexPath___block_invoke_2()
{
  return 0;
}

void __69__CNContactPickerContentViewController__validatePredicatesWithError___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1[4], "valueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1[5], "setPredicate:", v4);
    v5 = a1[5];
    v9 = 0;
    v6 = objc_msgSend(v5, "validateWithError:", &v9);
    v7 = v9;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v4, "allowEvaluation");
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v11 = v3;
        v12 = 2112;
        v13 = v7;
        _os_log_error_impl(&dword_18AC56000, v8, OS_LOG_TYPE_ERROR, "Invalid %@: %@, removing it.", buf, 0x16u);
      }

      if (v7)
        objc_msgSend(a1[6], "addObject:", v7);
      objc_msgSend(a1[4], "setValue:forKey:", 0, v3);
    }

  }
}

+ (id)log
{
  if (log_cn_once_token_1_57116 != -1)
    dispatch_once(&log_cn_once_token_1_57116, &__block_literal_global_57117);
  return (id)log_cn_once_object_1_57118;
}

+ (id)descriptorForContactPropertiesSupportingPredicateEvaluation
{
  return +[CNContactContentViewController descriptorForRequiredKeys](CNContactContentViewController, "descriptorForRequiredKeys");
}

void __43__CNContactPickerContentViewController_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.ui", "CNContactPickerContentViewController");
  v1 = (void *)log_cn_once_object_1_57118;
  log_cn_once_object_1_57118 = (uint64_t)v0;

}

@end
