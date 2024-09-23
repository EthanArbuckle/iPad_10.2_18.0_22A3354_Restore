@implementation CNContactViewController

- (void)_setupViewController
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
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
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  char v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t i;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  int64_t v88;
  _BOOL8 v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  const __CFString *v96;
  void *v97;
  void *v98;
  const __CFString *v99;
  void *v100;
  void *v101;
  int v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  _QWORD v111[4];
  id v112;
  CNContactViewController *v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[128];
  void *v119;
  _QWORD v120[26];
  UIEdgeInsets v121;

  v120[24] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactViewController setContentContact:](self, "setContentContact:", v5);

  -[CNContactViewController contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CNContactViewController contact](self, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v119, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  -[CNContactViewController contact](self, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSuggested");

  if (v10 && -[CNContactViewController mode](self, "mode") == 3)
  {
    -[CNContactViewController contact](self, "contact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copyWithCuratingAllSuggestionsAndBirthdaySuggestion");
    -[CNContactViewController setContentContact:](self, "setContentContact:", v12);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactViewController additionalContact](self, "additionalContact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v109 = (void *)v3;
  if (v14)
  {
    -[CNContactViewController additionalContact](self, "additionalContact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObject:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "isSuggested"))
    {
      v17 = objc_msgSend(v15, "copyWithCuratingAllSuggestionsAndBirthdaySuggestion");

      v10 = 1;
      v15 = (void *)v17;
    }
    -[CNContactViewController contact](self, "contact");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");

    objc_msgSend(v19, "addAllPropertiesFromContact:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_msgSend(v13, "addObjectsFromArray:", v20);
    -[CNContactViewController setContentContact:](self, "setContentContact:", v19);

    v8 = (void *)v16;
  }
  -[CNContactViewController contactStore](self, "contactStore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    -[CNContactViewController setActions:](self, "setActions:", -[CNContactViewController actions](self, "actions") & 0xFFFFFFFFFFFFFFDFLL);
    if (v10)
      v22 = 7;
    else
      v22 = 1;
    objc_msgSend(MEMORY[0x1E0C97298], "storeWithOptions:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactViewController setContactStore:](self, "setContactStore:", v23);

  }
  if (!-[CNContactViewController _shouldBeOutOfProcess](self, "_shouldBeOutOfProcess"))
  {
    -[CNContactViewController contactStore](self, "contactStore");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactViewController viewController](self, "viewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setContactStore:", v24);

  }
  -[CNContactViewController displayedPropertyKeys](self, "displayedPropertyKeys");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[CNContactViewController displayedPropertyKeys](self, "displayedPropertyKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("displayedProperties"));

  }
  -[CNContactViewController primaryPropertyKey](self, "primaryPropertyKey");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    v30 = -[CNContactViewController mode](self, "mode");

    if (v30 == 2)
    {
      -[CNContactViewController primaryPropertyKey](self, "primaryPropertyKey");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, CFSTR("primaryProperty"));

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactViewController allowsDisplayModePickerActions](self, "allowsDisplayModePickerActions"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("allowsDisplayModePickerActions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactViewController allowsEditPhoto](self, "allowsEditPhoto"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("allowsEditPhoto"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactViewController allowsNamePicking](self, "allowsNamePicking"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, CFSTR("allowsNamePicking"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactViewController showsInlineActions](self, "showsInlineActions"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, CFSTR("showsInlineActions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactViewController showsSharedProfile](self, "showsSharedProfile"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, CFSTR("showsSharedProfile"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactViewController showsGroupMembership](self, "showsGroupMembership"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v37, CFSTR("showsGroupMembership"));

  -[CNContactViewController contactHeaderViewController](self, "contactHeaderViewController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[CNContactViewController contactHeaderViewController](self, "contactHeaderViewController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v39, CFSTR("personHeaderViewController"));

  }
  -[CNContactViewController contactHeaderView](self, "contactHeaderView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[CNContactViewController contactHeaderView](self, "contactHeaderView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v41, CFSTR("personHeaderView"));

  }
  -[CNContactViewController contactHeaderViewDelegate](self, "contactHeaderViewDelegate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[CNContactViewController contactHeaderViewDelegate](self, "contactHeaderViewDelegate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v43, CFSTR("personHeaderViewDelegate"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)-[CNContactViewController actions](self, "actions") >> 5) & 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v44, CFSTR("allowsAddingToAddressBook"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)-[CNContactViewController actions](self, "actions") >> 6) & 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v45, CFSTR("allowsAddToFavorites"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)-[CNContactViewController actions](self, "actions") >> 7) & 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v46, CFSTR("allowsContactBlocking"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)-[CNContactViewController actions](self, "actions") >> 11) & 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v47, CFSTR("allowsContactBlockingAndReporting"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)-[CNContactViewController actions](self, "actions") >> 1) & 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v48, CFSTR("allowsCardActions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)-[CNContactViewController actions](self, "actions") >> 4) & 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v49, CFSTR("allowsSharing"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)-[CNContactViewController actions](self, "actions") >> 2) & 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v50, CFSTR("allowsConferencing"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)-[CNContactViewController actions](self, "actions") >> 8) & 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v51, CFSTR("allowsDeletion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)-[CNContactViewController actions](self, "actions") >> 10) & 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v52, CFSTR("allowsEditInApp"));

  -[CNContactViewController warningMessage](self, "warningMessage");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v53, CFSTR("warningMessage"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactViewController shouldDrawNavigationBar](self, "shouldDrawNavigationBar"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v54, CFSTR("shouldDrawNavigationBar"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactViewController editingProposedInformation](self, "editingProposedInformation"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v55, CFSTR("editingProposedInformation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactViewController forcesTransparentBackground](self, "forcesTransparentBackground"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v56, CFSTR("forcesTransparentBackground"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactViewController usesBrandedCallHeaderFormat](self, "usesBrandedCallHeaderFormat"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v57, CFSTR("usesBrandedCallHeaderFormat"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactViewController shouldShowSharedProfileBanner](self, "shouldShowSharedProfileBanner"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v58, CFSTR("shouldShowSharedProfileBanner"));

  -[CNContactViewController staticIdentity](self, "staticIdentity");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v59, CFSTR("staticIdentity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactViewController showContactPhotoPosterCell](self, "showContactPhotoPosterCell"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v60, CFSTR("showContactPhotoPosterCell"));

  if (-[CNContactViewController isEditing](self, "isEditing"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isEditing"));
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "isRunningTest"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("runningPPT"));
  -[CNContactViewController highlightedPropertyIdentifier](self, "highlightedPropertyIdentifier");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v110 = v13;
  if (v61)
  {
    v62 = (void *)MEMORY[0x1E0C97280];
    -[CNContactViewController contentContact](self, "contentContact");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactViewController highlightedPropertyKey](self, "highlightedPropertyKey");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactViewController highlightedPropertyIdentifier](self, "highlightedPropertyIdentifier");
    v65 = v8;
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v63, v64, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v65;
    v13 = v110;

    objc_msgSend(v110, "addObject:", v67);
  }
  if (objc_msgSend(v13, "count"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("highlightedProperties"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactViewController highlightedPropertyImportant](self, "highlightedPropertyImportant"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v68, CFSTR("highlightedPropertyImportant"));

  -[CNContactViewController contentContact](self, "contentContact");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v69, CFSTR("contact"));

  if ((unint64_t)objc_msgSend(v8, "count") > 1
    || (objc_msgSend(v8, "firstObject"),
        v70 = (void *)objc_claimAutoreleasedReturnValue(),
        -[CNContactViewController contentContact](self, "contentContact"),
        v71 = (void *)objc_claimAutoreleasedReturnValue(),
        v72 = objc_msgSend(v70, "isEqual:", v71),
        v71,
        v70,
        (v72 & 1) == 0))
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("originalContacts"));
  }
  v108 = v8;
  v73 = *MEMORY[0x1E0D13848];
  -[CNContactViewController navigationItemController](self, "navigationItemController");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "navigationItem");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "title");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v73) = (*(uint64_t (**)(uint64_t, void *))(v73 + 16))(v73, v76);

  if ((v73 & 1) == 0)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("layoutPositionallyAfterNavBar"));
  -[CNContactViewController navigationItem](self, "navigationItem");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactViewController setupNavBarAppearance:asOpaqueWhenScrolled:](self, "setupNavBarAppearance:asOpaqueWhenScrolled:", v77, 0);

  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v120[0] = CFSTR("importantMessage");
  v120[1] = CFSTR("allowsConferencing");
  v120[2] = CFSTR("alternateName");
  v120[3] = CFSTR("message");
  v120[4] = CFSTR("shouldShowLinkedContacts");
  v120[5] = CFSTR("parentGroup");
  v120[6] = CFSTR("displayedPropertyKeys");
  v120[7] = CFSTR("allowsActions");
  v120[8] = CFSTR("allowsDeletion");
  v120[9] = CFSTR("allowsEditing");
  v120[10] = CFSTR("allowsNamePicking");
  v120[11] = CFSTR("showsInlineActions");
  v120[12] = CFSTR("showsSharedProfile");
  v120[13] = CFSTR("showsGroupMembership");
  v120[14] = CFSTR("mode");
  v120[15] = CFSTR("parentContainer");
  v120[16] = CFSTR("verifiedInfoMessage");
  v120[17] = CFSTR("allowsAddingToAddressBook");
  v120[18] = CFSTR("allowsAddToFavorites");
  v120[19] = CFSTR("allowsSharing");
  v120[20] = CFSTR("allowsContactBlocking");
  v120[21] = CFSTR("allowsContactBlockingAndReporting");
  v120[22] = CFSTR("showingMeContact");
  v120[23] = CFSTR("showContactPhotoPosterCell");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v120, 24);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v114, v118, 16);
  if (v79)
  {
    v80 = v79;
    v81 = *(_QWORD *)v115;
    do
    {
      for (i = 0; i != v80; ++i)
      {
        if (*(_QWORD *)v115 != v81)
          objc_enumerationMutation(v78);
        v83 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v84)
        {
          -[CNContactViewController valueForKey:](self, "valueForKey:", v83);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          if (v85)
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v85, v83);

        }
      }
      v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v114, v118, 16);
    }
    while (v80);
  }

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "_peripheryInsets");
  NSStringFromUIEdgeInsets(v121);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v87, CFSTR("mainScreenPeripheryInsets"));

  switch(-[CNContactViewController mode](self, "mode"))
  {
    case 1:
      v88 = -[CNContactViewController editMode](self, "editMode");
      v89 = v88 == 2 || -[CNContactViewController editMode](self, "editMode") == 1;
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("allowsAddingToAddressBook"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v89);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v97, CFSTR("allowsEditing"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v88 == 2);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = CFSTR("alwaysEditing");
      goto LABEL_68;
    case 2:
      v90 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("allowsEditing"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v90, CFSTR("allowsAddToFavorites"));
      -[CNContactViewController recentsData](self, "recentsData");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v91, CFSTR("recentsData"));

      -[CNContactViewController primaryPropertyKey](self, "primaryPropertyKey");
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      if (v92)
      {
        -[CNContactViewController contentContact](self, "contentContact");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactViewController _primaryPropertyStringForContact:](self, "_primaryPropertyStringForContact:", v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();

        if (v94)
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v94, CFSTR("alternateName"));

      }
      else
      {
        -[CNContactViewController alternateName](self, "alternateName");
        v107 = (void *)objc_claimAutoreleasedReturnValue();

        if (v107)
        {
          -[CNContactViewController alternateName](self, "alternateName");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = CFSTR("alternateName");
LABEL_68:
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v98, v99);

        }
      }
      break;
    case 3:
      v95 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("allowsEditing"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v95, CFSTR("alwaysEditing"));
      v96 = CFSTR("layoutPositionallyAfterNavBar");
      goto LABEL_65;
    case 4:
      v95 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("allowsEditing"));
      v96 = CFSTR("alwaysEditing");
      goto LABEL_65;
    case 5:
      v95 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("allowsEditing"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v95, CFSTR("allowsCardActions"));
      v96 = CFSTR("allowsAddingToAddressBook");
LABEL_65:
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v95, v96);
      break;
    default:
      break;
  }
  objc_msgSend(v109, "setObject:forKeyedSubscript:", v4, CFSTR("Properties"));
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "entitlementVerifier");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend(v101, "currentProcessHasBooleanEntitlement:error:", *MEMORY[0x1E0D137A8], 0);

  if (v102)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNContactViewController ignoresParentalRestrictions](self, "ignoresParentalRestrictions"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "setObject:forKeyedSubscript:", v103, CFSTR("ignoresParentalRestrictions"));

  }
  -[CNContactViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setObject:forKeyedSubscript:", v104, CFSTR("prohibitedPropertyKeys"));

  -[CNContactViewController viewController](self, "viewController");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v111[0] = MEMORY[0x1E0C809B0];
  v111[1] = 3221225472;
  v111[2] = __47__CNContactViewController__setupViewController__block_invoke;
  v111[3] = &unk_1E204E4D8;
  v112 = v4;
  v113 = self;
  v106 = v4;
  objc_msgSend(v105, "setupWithOptions:readyBlock:", v109, v111);

  -[CNContactViewController setRequiresSetup:](self, "setRequiresSetup:", 0);
}

- (int64_t)actions
{
  return self->_actions;
}

- (CNContact)contact
{
  return self->_contact;
}

- (CNContactContentViewController)viewController
{
  return self->_viewController;
}

- (int64_t)editMode
{
  return self->_editMode;
}

- (int64_t)mode
{
  return self->_mode;
}

- (CNContact)contentContact
{
  return self->_contentContact;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (BOOL)forcesTransparentBackground
{
  return self->_forcesTransparentBackground;
}

- (NSArray)displayedPropertyKeys
{
  return self->_displayedPropertyKeys;
}

- (NSString)warningMessage
{
  return self->_warningMessage;
}

- (BOOL)usesBrandedCallHeaderFormat
{
  return self->_usesBrandedCallHeaderFormat;
}

- (NSString)staticIdentity
{
  return self->_staticIdentity;
}

- (BOOL)showsSharedProfile
{
  return self->_showsSharedProfile;
}

- (BOOL)showsInlineActions
{
  return self->_showsInlineActions;
}

- (BOOL)showsGroupMembership
{
  return self->_showsGroupMembership;
}

- (BOOL)shouldShowSharedProfileBanner
{
  return self->_shouldShowSharedProfileBanner;
}

- (void)setRequiresSetup:(BOOL)a3
{
  id v4;

  if (self->_requiresSetup != a3)
  {
    self->_requiresSetup = a3;
    if (-[CNContactViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[CNContactViewController view](self, "view");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setNeedsLayout");

    }
  }
}

- (void)setContentContact:(id)a3
{
  objc_storeStrong((id *)&self->_contentContact, a3);
}

- (NSArray)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (NSString)primaryPropertyKey
{
  return self->_primaryPropertyKey;
}

- (BOOL)ignoresParentalRestrictions
{
  return self->_ignoresParentalRestrictions;
}

- (BOOL)highlightedPropertyImportant
{
  return self->_highlightedPropertyImportant;
}

- (NSString)highlightedPropertyIdentifier
{
  return self->_highlightedPropertyIdentifier;
}

- (BOOL)editingProposedInformation
{
  return self->_editingProposedInformation;
}

- (UIView)contactHeaderView
{
  return self->_contactHeaderView;
}

- (CNContactViewControllerCustomHeaderViewDelegate)contactHeaderViewDelegate
{
  return (CNContactViewControllerCustomHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_contactHeaderViewDelegate);
}

- (UIViewController)contactHeaderViewController
{
  return self->_contactHeaderViewController;
}

- (void)configureNavigationItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "setLargeTitleDisplayMode:", 2);
  -[CNContactViewController setupNavBarAppearance:asOpaqueWhenScrolled:](self, "setupNavBarAppearance:asOpaqueWhenScrolled:", v4, 0);

  if (-[CNContactViewController displayNavigationButtonsShouldUsePlatterStyle](self, "displayNavigationButtonsShouldUsePlatterStyle"))
  {
    if ((-[CNContactViewController isEditing](self, "isEditing") & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
    else
      +[CNUIColorRepository contactCardStaticHeaderDefaultTintColor](CNUIColorRepository, "contactCardStaticHeaderDefaultTintColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactViewController navigationItemController](self, "navigationItemController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v8);

  }
}

- (id)navigationItemController
{
  CNContactViewController *v2;
  CNContactViewController *v3;
  CNContactViewController *v4;
  void *v5;
  char isKindOfClass;
  uint64_t v7;

  v2 = self;
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    while (1)
    {
      -[CNContactViewController parentViewController](v4, "parentViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        break;
      -[CNContactViewController parentViewController](v4, "parentViewController");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (CNContactViewController *)v7;
      if (!v7)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v4 = v3;
  }
  return v4;
}

- (void)setupNavBarAppearance:(id)a3 asOpaqueWhenScrolled:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  id v7;

  v4 = a4;
  v7 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v5, "configureWithTransparentBackground");
  objc_msgSend(v7, "setScrollEdgeAppearance:", v5);
  if (v4)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v6, "configureWithDefaultBackground");
    objc_msgSend(v7, "setStandardAppearance:", v6);

  }
  else
  {
    objc_msgSend(v7, "setStandardAppearance:", v5);
  }

}

- (BOOL)displayNavigationButtonsShouldUsePlatterStyle
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isFeatureEnabled:", 15))
    v5 = !-[CNContactViewController shouldDrawNavigationBar](self, "shouldDrawNavigationBar");
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)shouldDrawNavigationBar
{
  return self->_shouldDrawNavigationBar;
}

- (BOOL)allowsNamePicking
{
  return self->_allowsNamePicking;
}

- (BOOL)allowsEditPhoto
{
  return self->_allowsEditPhoto;
}

- (BOOL)allowsDisplayModePickerActions
{
  return self->_allowsDisplayModePickerActions;
}

- (CNContact)additionalContact
{
  return self->_additionalContact;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return !-[CNContactViewController _shouldBeOutOfProcess](self, "_shouldBeOutOfProcess");
}

- (void)updateEditing:(BOOL)a3 doneButtonEnabled:(BOOL)a4 doneButtonText:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v5 = a4;
  v6 = a3;
  v12 = a5;
  if (!-[CNContactViewController shouldUseModernNavigationBarHiding](self, "shouldUseModernNavigationBarHiding")
    && !CNUIIsMessages()
    && -[CNContactViewController isEditing](self, "isEditing") != v6)
  {
    -[CNContactViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactViewController setupNavBarAppearance:asOpaqueWhenScrolled:](self, "setupNavBarAppearance:asOpaqueWhenScrolled:", v8, v6);

  }
  if (-[CNContactViewController _shouldBeOutOfProcess](self, "_shouldBeOutOfProcess"))
  {
    if (-[CNContactViewController isEditing](self, "isEditing") != v6)
    {
      -[CNContactViewController setEditing:animated:](self, "setEditing:animated:", v6, 1);
      -[CNContactViewController privateDelegate](self, "privateDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        -[CNContactViewController privateDelegate](self, "privateDelegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contactViewController:didChangeToEditMode:", self, v6);

      }
    }
    -[CNContactViewController updateEditNavigationItemsAnimated:doneButtonEnabled:doneButtonText:](self, "updateEditNavigationItemsAnimated:doneButtonEnabled:doneButtonText:", 1, v5, v12);
  }

}

- (BOOL)_shouldBeOutOfProcess
{
  int64_t v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[CNContactViewController displayMode](self, "displayMode");
  if (v3 != 1)
  {
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entitlementVerifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "currentProcessHasBooleanEntitlement:error:", *MEMORY[0x1E0D13798], 0);

    if (-[CNContactViewController displayMode](self, "displayMode") == 2)
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = v6 ^ 1;
  }
  return v3;
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (BOOL)shouldUseModernNavigationBarHiding
{
  return self->_shouldUseModernNavigationBarHiding;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  if (-[CNContactViewController isEditing](self, "isEditing") != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)CNContactViewController;
    -[CNContactViewController setEditing:animated:](&v8, sel_setEditing_animated_, v5, v4);
    -[CNContactViewController viewController](self, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didChangeToEditMode:", v5);

  }
}

void __47__CNContactViewController__setupViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CNContactViewController__setupViewController__block_invoke_2;
  block[3] = &unk_1E204FAA0;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v4;
  v9 = v5;
  v10 = v3;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (NSAttributedString)verifiedInfoMessage
{
  return self->_verifiedInfoMessage;
}

- (BOOL)showingMeContact
{
  return self->_showingMeContact;
}

- (BOOL)shouldShowLinkedContacts
{
  return self->_shouldShowLinkedContacts;
}

- (CNGroup)parentGroup
{
  return self->_parentGroup;
}

- (CNContainer)parentContainer
{
  return self->_parentContainer;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)importantMessage
{
  return self->_importantMessage;
}

- (NSString)alternateName
{
  return self->_alternateName;
}

- (BOOL)allowsEditing
{
  return -[CNContactViewController editMode](self, "editMode") != 0;
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  if (-[CNContactViewController requiresSetup](self, "requiresSetup"))
    -[CNContactViewController _setupViewController](self, "_setupViewController");
  v3.receiver = self;
  v3.super_class = (Class)CNContactViewController;
  -[CNContactViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
}

- (BOOL)requiresSetup
{
  return self->_requiresSetup;
}

- (BOOL)allowsActions
{
  return (-[CNContactViewController actions](self, "actions") & 0xFFFFFFFFFFFFFE5FLL) != 0;
}

+ (id)descriptorForRequiredKeys
{
  return +[CNContactContentViewController descriptorForRequiredKeys](CNContactContentViewController, "descriptorForRequiredKeys");
}

- (void)setShowingMeContact:(BOOL)a3
{
  self->_showingMeContact = a3;
}

- (void)setShouldShowLinkedContacts:(BOOL)shouldShowLinkedContacts
{
  self->_shouldShowLinkedContacts = shouldShowLinkedContacts;
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void)setContactStore:(CNContactStore *)contactStore
{
  objc_storeStrong((id *)&self->_contactStore, contactStore);
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (void)setAllowsEditing:(BOOL)allowsEditing
{
  _BOOL4 v3;
  int64_t v5;
  uint64_t v6;

  v3 = allowsEditing;
  v5 = -[CNContactViewController editMode](self, "editMode");
  if (v3)
  {
    if (v5)
      return;
    v6 = 1;
  }
  else
  {
    if (!v5)
      return;
    v6 = 0;
  }
  -[CNContactViewController setEditMode:](self, "setEditMode:", v6);
}

- (void)setActions:(int64_t)a3
{
  self->_actions = a3;
}

- (void)setContact:(CNContact *)contact
{
  objc_storeStrong((id *)&self->_contact, contact);
}

- (CNContactViewController)initWithMode:(int64_t)a3
{
  CNContactViewController *v4;
  CNContactViewController *v5;
  CNContactContentNavigationItemUpdater *v6;
  CNContactContentNavigationItemUpdater *navItemUpdater;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNContactViewController;
  v4 = -[CNContactViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v5 = v4;
  if (v4)
  {
    v4->_mode = a3;
    v4->_actions = 127;
    v4->_editMode = 1;
    v4->_allowsDisplayModePickerActions = 1;
    v4->_allowsEditPhoto = 1;
    v4->_forcesTransparentBackground = 0;
    v4->_showsInlineActions = 1;
    v4->_showsSharedProfile = 1;
    v4->_showsGroupMembership = 1;
    v6 = objc_alloc_init(CNContactContentNavigationItemUpdater);
    navItemUpdater = v5->_navItemUpdater;
    v5->_navItemUpdater = v6;

    v5->_showContactPhotoPosterCell = 1;
    -[CNContactViewController navigationItem](v5, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactViewController configureNavigationItem:](v5, "configureNavigationItem:", v8);

  }
  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNContactViewController;
  -[CNContactViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "isPPTAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("PPTDidShowContact"), self);

  }
}

- (void)loadView
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNContactViewController;
  -[CNContactViewController loadView](&v11, sel_loadView);
  if (-[CNContactViewController forcesTransparentBackground](self, "forcesTransparentBackground"))
  {
    +[CNUIColorRepository transparentBackgroundColor](CNUIColorRepository, "transparentBackgroundColor");
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v4 = (void *)v3;
    -[CNContactViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);
LABEL_6:

    goto LABEL_7;
  }
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v7)
  {
    objc_msgSend(v8, "backgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v5);

    goto LABEL_6;
  }
  v10 = objc_msgSend(v8, "usesOpaqueBackground");

  if (v10 && -[CNContactViewController _shouldBeOutOfProcess](self, "_shouldBeOutOfProcess"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
LABEL_7:
  -[CNContactViewController _viewWillBePresented](self, "_viewWillBePresented");
}

void __47__CNContactViewController__setupViewController__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("alwaysEditing"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", MEMORY[0x1E0C9AAB0]);

  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "setEditing:animated:", 1, 0);
  objc_msgSend(*(id *)(a1 + 40), "_contactPresentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_endDelayingPresentation");

  objc_msgSend(*(id *)(a1 + 40), "cnui_appropriatePresentationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(v10, "setDelegate:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactViewController.m", 757, 3, CFSTR("Error when showing contact view: %@"), v6, v7, v8, v9, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "setHasCompletedSetup:", 1);

}

- (void)setHasCompletedSetup:(BOOL)a3
{
  self->_hasCompletedSetup = a3;
}

- (void)_prepareViewController
{
  void *v3;
  void *v4;
  CNContactContentViewController *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  id v8;

  -[CNContactViewController _contactPresentedViewController](self, "_contactPresentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_beginDelayingPresentation:cancellationHandler:", &__block_literal_global_51137, 10.0);

  -[CNContactViewController viewController](self, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNContactViewController setRequiresSetup:](self, "setRequiresSetup:", 1);
    -[CNContactViewController setHasCompletedSetup:](self, "setHasCompletedSetup:", 0);
  }
  else if (-[CNContactViewController _shouldBeOutOfProcess](self, "_shouldBeOutOfProcess"))
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x3042000000;
    v7[3] = __Block_byref_object_copy__51138;
    v7[4] = __Block_byref_object_dispose__51139;
    objc_initWeak(&v8, self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__CNContactViewController__prepareViewController__block_invoke_76;
    v6[3] = &unk_1E204E540;
    v6[4] = v7;
    +[CNContactViewHostViewController getViewController:](CNContactViewHostViewController, "getViewController:", v6);
    _Block_object_dispose(v7, 8);
    objc_destroyWeak(&v8);
  }
  else
  {
    v5 = objc_alloc_init(CNContactContentViewController);
    -[CNContactViewController _setViewController:](self, "_setViewController:", v5);

  }
}

- (id)_contactPresentedViewController
{
  CNContactViewController *v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;

  v2 = self;
  -[CNContactViewController delegate](v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNContactViewController delegate](v2, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactPresentedViewController:", v2);
    v6 = objc_claimAutoreleasedReturnValue();

    v2 = (CNContactViewController *)v6;
  }
  return v2;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_setViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setDelegate:", self);
  -[CNContactViewController pptDelegate](self, "pptDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPptDelegate:", v5);

  -[CNContactViewController setViewController:](self, "setViewController:", v4);
  -[CNContactViewController _setupViewController](self, "_setupViewController");
  -[UIViewController cnui_addChildViewController:](self, "cnui_addChildViewController:", v4);

  -[CNContactViewController viewController](self, "viewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSize");
  -[CNContactViewController setPreferredContentSize:](self, "setPreferredContentSize:");

}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (CNContactViewControllerPPTDelegate)pptDelegate
{
  return (CNContactViewControllerPPTDelegate *)objc_loadWeakRetained((id *)&self->_pptDelegate);
}

- (void)_endDelayingPresentation
{
  objc_super v3;

  self->_ignoreViewWillBePresented = 1;
  v3.receiver = self;
  v3.super_class = (Class)CNContactViewController;
  -[CNContactViewController _endDelayingPresentation](&v3, sel__endDelayingPresentation);
  self->_ignoreViewWillBePresented = 0;
}

- (void)updateBackButtonIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  id v9;

  if ((-[CNContactViewController isEditing](self, "isEditing") & 1) == 0
    && -[CNContactViewController displayNavigationButtonsShouldUsePlatterStyle](self, "displayNavigationButtonsShouldUsePlatterStyle"))
  {
    -[CNContactViewController currentNavigationController](self, "currentNavigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CNContactViewController navItemUpdater](self, "navItemUpdater");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[CNContactViewController navigationItemController](self, "navigationItemController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CNContactViewController mode](self, "mode");
      -[CNContactViewController platterBackBarButtonItem](self, "platterBackBarButtonItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateBackButtonForPlatterStyleForController:mode:platterBackBarButtonItem:animated:", v6, v7, v8, 0);

    }
  }
}

- (id)platterBackBarButtonItem
{
  void *v3;
  _BOOL8 v4;

  -[CNContactViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutDirection") == 1;

  return -[CNPlatterBackBarButtonItem initWithTarget:action:isRTL:]([CNPlatterBackBarButtonItem alloc], "initWithTarget:action:isRTL:", self, sel_popToPrevious_, v4);
}

- (CNContactContentNavigationItemUpdater)navItemUpdater
{
  return self->_navItemUpdater;
}

- (id)currentNavigationController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[CNContactViewController navigationItemController](self, "navigationItemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    objc_msgSend(v3, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v3, "navigationController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  v6 = v3;
LABEL_6:
  v10 = v6;

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CNContactViewController;
  -[CNContactViewController viewWillAppear:](&v12, sel_viewWillAppear_, a3);
  if (-[CNContactViewController _shouldBeOutOfProcess](self, "_shouldBeOutOfProcess"))
  {
    -[CNContactViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    objc_msgSend(v5, "_setRequestedMaxBackButtonWidth:", v7 / 3.0);

  }
  -[CNContactViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isTranslucent"))
  {

  }
  else
  {
    -[CNContactViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "_backgroundHidden");

    if (v11)
      -[CNContactViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
  }
}

- (BOOL)_isDelayingPresentation
{
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNContactViewController;
  if (-[CNContactViewController _isDelayingPresentation](&v5, sel__isDelayingPresentation))
    return 1;
  if (!self->_ignoreViewWillBePresented && (objc_opt_respondsToSelector() & 1) != 0)
    -[CNContactViewController _viewWillBePresented](self, "_viewWillBePresented");
  v4.receiver = self;
  v4.super_class = (Class)CNContactViewController;
  return -[CNContactViewController _isDelayingPresentation](&v4, sel__isDelayingPresentation);
}

- (void)didMoveToParentViewController:(id)a3
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
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CNContactViewController;
  -[CNContactViewController didMoveToParentViewController:](&v19, sel_didMoveToParentViewController_, v4);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[CNContactViewController observedNavigationItem](self, "observedNavigationItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactViewController navigationItemController](self, "navigationItemController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "navigationItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 != v7)
      {
        -[CNContactViewController observedNavigationItem](self, "observedNavigationItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObserver:forKeyPath:", self, CFSTR("title"));

        -[CNContactViewController observedNavigationItem](self, "observedNavigationItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObserver:forKeyPath:", self, CFSTR("titleView"));

        -[CNContactViewController navigationItemController](self, "navigationItemController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "navigationItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactViewController setObservedNavigationItem:](self, "setObservedNavigationItem:", v11);

        -[CNContactViewController observedNavigationItem](self, "observedNavigationItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObserver:forKeyPath:options:context:", self, CFSTR("title"), 1, 0);

        -[CNContactViewController observedNavigationItem](self, "observedNavigationItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("titleView"), 1, 0);

      }
      objc_msgSend(v4, "navigationItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactViewController configureNavigationItem:](self, "configureNavigationItem:", v14);

      _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactViewController.m", 937, 4, CFSTR("%@ is added to a controller that's not a navigation controller, we'll update the parent navigation item %@ automatically,"), v15, v16, v17, v18, (uint64_t)self);
    }
  }

}

- (CNContactViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[CNContactViewController initWithMode:](self, "initWithMode:", 1, a4);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CNContactViewController observedNavigationItem](self, "observedNavigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("title"));

  -[CNContactViewController setObservedNavigationItem:](self, "setObservedNavigationItem:", 0);
  -[CNContactContentViewController setContactDelegate:](self->_contentViewController, "setContactDelegate:", 0);
  v5.receiver = self;
  v5.super_class = (Class)CNContactViewController;
  -[CNContactViewController dealloc](&v5, sel_dealloc);
}

- (id)_primaryPropertyStringForContact:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v4 = a3;
  -[CNContactViewController primaryPropertyKey](self, "primaryPropertyKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C967C0]);

  if (v6)
  {
    objc_msgSend(v4, "phoneNumbers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "formattedStringValue");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v14 = (void *)v10;

    goto LABEL_8;
  }
  -[CNContactViewController primaryPropertyKey](self, "primaryPropertyKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C966A8]);

  if (!v12)
  {
    -[CNContactViewController primaryPropertyKey](self, "primaryPropertyKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0C967F0]);

    if (!v16)
    {
      v14 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v4, "postalAddresses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", v9, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v4, "emailAddresses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

LABEL_9:
  return v14;
}

- (void)setAllowsActions:(BOOL)allowsActions
{
  int64_t v4;

  if (allowsActions)
    v4 = 127;
  else
    v4 = -[CNContactViewController actions](self, "actions") & 0x1A0;
  -[CNContactViewController setActions:](self, "setActions:", v4);
  if (-[CNContactViewController hasCompletedSetup](self, "hasCompletedSetup"))
    -[CNContactViewController setRequiresSetup:](self, "setRequiresSetup:", 1);
}

- (void)highlightPropertyWithKey:(id)a3 identifier:(id)a4 important:(BOOL)a5
{
  _BOOL8 v5;
  id v8;

  v5 = a5;
  v8 = a4;
  -[CNContactViewController setHighlightedPropertyKey:](self, "setHighlightedPropertyKey:", a3);
  -[CNContactViewController setHighlightedPropertyIdentifier:](self, "setHighlightedPropertyIdentifier:", v8);

  -[CNContactViewController setHighlightedPropertyImportant:](self, "setHighlightedPropertyImportant:", v5);
}

- (void)highlightPropertyWithKey:(NSString *)key identifier:(NSString *)identifier
{
  -[CNContactViewController highlightPropertyWithKey:identifier:important:](self, "highlightPropertyWithKey:identifier:important:", key, identifier, 0);
}

- (void)setInitialPrompt:(id)a3
{
  id *p_initialPrompt;
  id v6;
  void *v7;
  id v8;

  p_initialPrompt = (id *)&self->_initialPrompt;
  v8 = a3;
  if ((objc_msgSend(*p_initialPrompt, "isEqualToString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_initialPrompt, a3);
    v6 = *p_initialPrompt;
    -[CNContactViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPrompt:", v6);

  }
}

- (void)setShouldDrawNavigationBar:(BOOL)a3
{
  id v4;

  if (self->_shouldDrawNavigationBar != a3)
  {
    self->_shouldDrawNavigationBar = a3;
    -[CNContactViewController navigationItem](self, "navigationItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setBackgroundHidden:", !self->_shouldDrawNavigationBar);

  }
}

- (void)setShouldUseModernNavigationBarHiding:(BOOL)a3
{
  id v4;

  if (self->_shouldUseModernNavigationBarHiding != a3)
  {
    self->_shouldUseModernNavigationBarHiding = a3;
    -[CNContactViewController navigationItem](self, "navigationItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactViewController configureNavigationItem:](self, "configureNavigationItem:", v4);

  }
}

- (void)setForcesTransparentBackground:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_forcesTransparentBackground != a3)
  {
    v3 = a3;
    self->_forcesTransparentBackground = a3;
    -[CNContactViewController contentViewController](self, "contentViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setForcesTransparentBackground:", v3);

  }
}

- (void)setUsesBrandedCallHeaderFormat:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_usesBrandedCallHeaderFormat != a3)
  {
    v3 = a3;
    self->_usesBrandedCallHeaderFormat = a3;
    -[CNContactViewController contentViewController](self, "contentViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUsesBrandedCallHeaderFormat:", v3);

  }
}

- (void)setShouldShowSharedProfileBanner:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_shouldShowSharedProfileBanner != a3)
  {
    v3 = a3;
    self->_shouldShowSharedProfileBanner = a3;
    -[CNContactViewController contentViewController](self, "contentViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShouldShowSharedProfileBanner:", v3);

  }
}

- (BOOL)isModalInPresentation
{
  void *v3;
  char v4;
  BOOL v5;

  if (-[CNContactViewController _shouldBeOutOfProcess](self, "_shouldBeOutOfProcess"))
  {
    -[CNContactViewController viewController](self, "viewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isModalInPresentation");
  }
  else
  {
    -[CNContactViewController contentViewController](self, "contentViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasPendingChanges");
  }
  v5 = v4;

  return v5;
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  int v4;
  void *v5;

  if (-[CNContactViewController _shouldBeOutOfProcess](self, "_shouldBeOutOfProcess", a3))
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    -[CNContactViewController contentViewController](self, "contentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "hasPendingChanges") ^ 1;

  }
  return v4;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  if (!-[CNContactViewController _shouldBeOutOfProcess](self, "_shouldBeOutOfProcess", a3))
  {
    -[CNContactViewController contentViewController](self, "contentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasPendingChanges");

    -[CNContactViewController contentViewController](self, "contentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      objc_msgSend(v6, "presentConfirmCancelAlertController");
    else
      objc_msgSend(v6, "performConfirmedCancel");

  }
}

- (void)presentCancelConfirmationAlert
{
  void *v3;
  void *v4;
  id v5;

  -[CNContactViewController navigationItemController](self, "navigationItemController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leftBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactViewController presentConfirmCancelAlertControllerAnchoredAtButtonItem:](self, "presentConfirmCancelAlertControllerAnchoredAtButtonItem:", v4);

}

- (void)presentConfirmCancelAlertControllerAnchoredAtButtonItem:(id)a3
{
  id v4;

  -[CNContactViewController confirmCancelAlertControllerAnchoredAtButtonItem:](self, "confirmCancelAlertControllerAnchoredAtButtonItem:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (id)confirmCancelAlertControllerAnchoredAtButtonItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
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
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  _QWORD v29[5];

  v4 = a3;
  -[CNContactViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasBeenPersisted");
  CNContactsUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = CFSTR("DISCARD_CHANGES_TITLE_EDIT_CONTACT");
  else
    v9 = CFSTR("DISCARD_CHANGES_TITLE_NEW_CONTACT");
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E20507A8, CFSTR("Localized"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DISCARD_CHANGES_DISCARD_ACTION_TITE"), &stru_1E20507A8, CFSTR("Localized"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __76__CNContactViewController_confirmCancelAlertControllerAnchoredAtButtonItem___block_invoke;
  v29[3] = &unk_1E204F7F0;
  v29[4] = self;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 2, v29);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v15);

  v16 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DISCARD_CHANGES_CANCEL_ACTION_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 1, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v19);

  if (v4)
  {
    objc_msgSend(v11, "popoverPresentationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBarButtonItem:", v4);
  }
  else
  {
    -[CNContactViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "popoverPresentationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSourceView:", v21);

    v23 = *MEMORY[0x1E0C9D648];
    v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    objc_msgSend(v11, "popoverPresentationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSourceRect:", v23, v24, v25, v26);
  }

  objc_msgSend(v11, "popoverPresentationController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setPermittedArrowDirections:", 1);

  return v11;
}

- (CNContactContentViewController)contentViewController
{
  void *v3;

  -[CNContactViewController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[CNContactViewController _prepareViewController](self, "_prepareViewController");
  return -[CNContactViewController viewController](self, "viewController");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNContactViewController;
  -[CNContactViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[CNContactViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactViewController setupNavBarAppearance:asOpaqueWhenScrolled:](self, "setupNavBarAppearance:asOpaqueWhenScrolled:", v4, 0);

}

- (_UIRemoteViewController)_containedRemoteViewController
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  -[CNContactViewController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (_UIRemoteViewController *)v5;
}

- (void)setContact:(id)a3 additionalContact:(id)a4 mode:(int64_t)a5
{
  CNContact *v8;
  CNContact *v9;
  CNContact *contact;
  CNContact *v11;
  CNContact *additionalContact;

  v8 = (CNContact *)a3;
  v9 = (CNContact *)a4;
  contact = self->_contact;
  self->_contact = v8;
  v11 = v8;

  additionalContact = self->_additionalContact;
  self->_additionalContact = v9;

  self->_mode = a5;
  -[CNContactViewController setRequiresSetup:](self, "setRequiresSetup:", 1);
  -[CNContactViewController setHasCompletedSetup:](self, "setHasCompletedSetup:", 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CNContactViewController hasCompletedSetup](self, "hasCompletedSetup"))
  {
    -[CNContactViewController observedNavigationItem](self, "observedNavigationItem");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 != v9)
    {
LABEL_9:

      goto LABEL_10;
    }
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("title")))
    {

LABEL_6:
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "isEqual:", v13);

      if (v14)
      {

        v11 = 0;
      }
      -[CNContactViewController viewController](self, "viewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "didChangeToShowTitle:", v11 != 0);

      goto LABEL_9;
    }
    v12 = objc_msgSend(v16, "isEqualToString:", CFSTR("titleView"));

    if (v12)
      goto LABEL_6;
  }
LABEL_10:

}

- (void)editCancel:(id)a3
{
  id v3;

  -[CNContactViewController viewController](self, "viewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editCancel");

}

- (void)toggleEditing
{
  id v2;

  -[CNContactViewController viewController](self, "viewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleEditing");

}

- (void)setDoneButtonText:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  -[CNContactViewController navigationItemController](self, "navigationItemController", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (-[CNContactViewController isEditing](self, "isEditing"))
  {
    objc_msgSend(v10, "editButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", v4);

    if (v4)
      -[CNContactViewController enableSaveKeyboardShortcut](self, "enableSaveKeyboardShortcut");
    if (-[CNContactViewController mode](self, "mode") == 4)
    {
      CNContactsUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("UPDATE"), &stru_1E20507A8, CFSTR("Localized"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "editButtonItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTitle:", v8);

LABEL_8:
    }
  }
  else if (-[CNContactViewController allowsEditing](self, "allowsEditing"))
  {
    objc_msgSend(v10, "editButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", 1);
    goto LABEL_8;
  }

}

- (void)updateEditNavigationItemsAnimated:(BOOL)a3 doneButtonEnabled:(BOOL)a4 doneButtonText:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  int64_t v15;
  _BOOL8 v16;
  _BOOL8 v17;
  BOOL v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v5 = a4;
  -[CNContactViewController navigationItemController](self, "navigationItemController", a3, a4, a5);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[CNContactViewController displayNavigationButtonsShouldUsePlatterStyle](self, "displayNavigationButtonsShouldUsePlatterStyle");
  -[CNContactViewController currentNavigationController](self, "currentNavigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CNContactViewController isEditing](self, "isEditing"))
  {
    -[CNContactViewController navItemUpdater](self, "navItemUpdater");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE1(v25) = a3;
    LOBYTE(v25) = v5;
    v13 = (id)objc_msgSend(v12, "updateEditingNavigationItemForController:actionTarget:isInSheet:isShowingNavBar:shouldUsePlatterStyle:isUpdatingContact:hasChanges:animated:", v27, self, -[UIViewController ab_isInSheet](self, "ab_isInSheet"), -[CNContactViewController shouldDrawNavigationBar](self, "shouldDrawNavigationBar"), v8, -[CNContactViewController mode](self, "mode") == 4, v25);
  }
  else
  {
    HIDWORD(v26) = v5;
    v14 = v11 != 0;
    -[CNContactViewController navItemUpdater](self, "navItemUpdater");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CNContactViewController mode](self, "mode");
    v16 = -[CNContactViewController allowsEditing](self, "allowsEditing");
    v17 = -[UIViewController ab_isInSheet](self, "ab_isInSheet");
    v18 = -[CNContactViewController shouldDrawNavigationBar](self, "shouldDrawNavigationBar");
    -[CNContactViewController platterBackBarButtonItem](self, "platterBackBarButtonItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v26) = a3;
    BYTE2(v25) = v8;
    BYTE1(v25) = v14;
    LOBYTE(v25) = v18;
    v20 = (id)objc_msgSend(v12, "updateDisplayNavigationItemsForController:mode:actionTarget:allowsEditing:editButtonEnabled:isInSheet:isShowingNavBar:shouldShowBackButton:shouldUsePlatterStyle:platterBackBarButtonItem:animated:", v27, v15, self, v16, HIDWORD(v26), v17, v25, v19, v26);

  }
  if (v8)
  {
    if ((-[CNContactViewController isEditing](self, "isEditing") & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
    else
      +[CNUIColorRepository contactCardStaticHeaderDefaultTintColor](CNUIColorRepository, "contactCardStaticHeaderDefaultTintColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactViewController navigationItemController](self, "navigationItemController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "navigationItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "navigationBar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTintColor:", v21);

  }
}

- (void)popToPrevious:(id)a3
{
  id v3;
  id v4;

  -[CNContactViewController currentNavigationController](self, "currentNavigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNContactViewController;
  -[CNContactViewController touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_, a3, a4);
  -[CNContactViewController splitViewController](self, "splitViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNContactViewController splitViewController](self, "splitViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endEditing:", 1);

  }
}

- (void)enableSaveKeyboardShortcut
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("s"), 0x100000, sel_toggleEditing_);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SAVE_CONTACT_KEYBOARD_DISCOVERY"), &stru_1E20507A8, CFSTR("Localized"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDiscoverabilityTitle:", v4);

  -[CNContactViewController addKeyCommand:](self, "addKeyCommand:", v5);
}

- (void)enableCancelKeyboardShortcut
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4DA0], 0, sel_editCancel_);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactViewController addKeyCommand:](self, "addKeyCommand:", v3);

}

- (void)enableEditKeyboardShortcut
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("l"), 0x100000, sel_toggleEditing_);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactViewController addKeyCommand:](self, "addKeyCommand:", v3);

}

- (BOOL)shouldPerformDefaultActionForContact:(id)a3 propertyKey:(id)a4 propertyIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CNContactViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C97280], "contactPropertyWithContact:propertyKey:identifier:", v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "contactViewController:shouldPerformDefaultActionForContactProperty:", self, v13);

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (void)didCompleteWithContact:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CNContactViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNContactViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactViewController:didCompleteWithContact:", self, v7);

  }
}

- (void)didDeleteContact:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CNContactViewController privateDelegate](self, "privateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    if (-[CNContactViewController editMode](self, "editMode") != 2)
      -[CNContactViewController setEditing:](self, "setEditing:", 0);
    -[CNContactViewController privateDelegate](self, "privateDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactViewController:didDeleteContact:", self, v7);

  }
}

- (void)isPresentingFullscreen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNContactViewController navigationController](self, "navigationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNavigationBarHidden:animated:", v3, 0);

}

- (void)isPresentingEditingController:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  int v7;
  id v8;

  v3 = a3;
  -[CNContactViewController privateDelegate](self, "privateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0)
      return;
    -[CNContactViewController privateDelegate](self, "privateDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contactViewControllerForUnknownContactDidBeginAddingToContacts:", self);
  }
  else
  {
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
      return;
    -[CNContactViewController privateDelegate](self, "privateDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contactViewControllerForUnknownContactDidEndAddingToContacts:", self);
  }

}

- (void)viewDidAppear
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactViewController.m"), 1097, CFSTR("This should not be called, we pass the pptDelegate directly to the host view controller"));

}

- (void)didExecuteClearRecentsDataAction
{
  void *v3;
  char v4;
  id v5;

  -[CNContactViewController privateDelegate](self, "privateDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNContactViewController privateDelegate](self, "privateDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactViewControllerDidExecuteClearRecentsDataAction:", self);

  }
}

- (void)didExecuteDeleteFromDowntimeWhitelistAction
{
  void *v3;
  char v4;
  id v5;

  -[CNContactViewController privateDelegate](self, "privateDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNContactViewController privateDelegate](self, "privateDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactViewControllerDidExecuteDeleteFromDowntimeWhitelistAction:", self);

  }
}

- (void)viewServiceDidTerminate
{
  -[CNContactViewController didCompleteWithContact:](self, "didCompleteWithContact:", 0);
  -[CNContactViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)didTapBlockAndReportForContact:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CNContactViewController privateDelegate](self, "privateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNContactViewController privateDelegate](self, "privateDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactViewController:didExecuteBlockAndReportContactAction:", self, v7);

    -[CNContactViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)setDisplayedPropertyKeys:(NSArray *)displayedPropertyKeys
{
  objc_setProperty_nonatomic_copy(self, a2, displayedPropertyKeys, 1008);
}

- (void)setParentGroup:(CNGroup *)parentGroup
{
  objc_storeStrong((id *)&self->_parentGroup, parentGroup);
}

- (void)setParentContainer:(CNContainer *)parentContainer
{
  objc_storeStrong((id *)&self->_parentContainer, parentContainer);
}

- (void)setAlternateName:(NSString *)alternateName
{
  objc_setProperty_nonatomic_copy(self, a2, alternateName, 1048);
}

- (void)setMessage:(NSString *)message
{
  objc_setProperty_nonatomic_copy(self, a2, message, 1056);
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (_UIAccessDeniedView)accessDeniedView
{
  return self->_accessDeniedView;
}

- (NSString)highlightedPropertyKey
{
  return self->_highlightedPropertyKey;
}

- (void)setHighlightedPropertyKey:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedPropertyKey, a3);
}

- (void)setHighlightedPropertyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedPropertyIdentifier, a3);
}

- (void)setHighlightedPropertyImportant:(BOOL)a3
{
  self->_highlightedPropertyImportant = a3;
}

- (NSArray)extraRightBarButtonItems
{
  return self->_extraRightBarButtonItems;
}

- (void)setExtraRightBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_extraRightBarButtonItems, a3);
}

- (NSArray)extraLeftBarButtonItems
{
  return self->_extraLeftBarButtonItems;
}

- (void)setExtraLeftBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_extraLeftBarButtonItems, a3);
}

- (BOOL)hasCompletedSetup
{
  return self->_hasCompletedSetup;
}

- (NSArray)preEditLeftBarButtonItems
{
  return self->_preEditLeftBarButtonItems;
}

- (void)setPreEditLeftBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_preEditLeftBarButtonItems, a3);
}

- (UINavigationItem)observedNavigationItem
{
  return self->_observedNavigationItem;
}

- (void)setObservedNavigationItem:(id)a3
{
  objc_storeStrong((id *)&self->_observedNavigationItem, a3);
}

- (void)setNavItemUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_navItemUpdater, a3);
}

- (CNPolicy)policy
{
  return self->_policy;
}

- (void)setAdditionalContact:(id)a3
{
  objc_storeStrong((id *)&self->_additionalContact, a3);
}

- (void)setPptDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pptDelegate, a3);
}

- (NSString)initialPrompt
{
  return self->_initialPrompt;
}

- (void)setEditingProposedInformation:(BOOL)a3
{
  self->_editingProposedInformation = a3;
}

- (BOOL)showContactPhotoPosterCell
{
  return self->_showContactPhotoPosterCell;
}

- (void)setShowContactPhotoPosterCell:(BOOL)a3
{
  self->_showContactPhotoPosterCell = a3;
}

- (void)setStaticIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_staticIdentity, a3);
}

- (void)setDisplayMode:(int64_t)a3
{
  self->_displayMode = a3;
}

- (void)setEditMode:(int64_t)a3
{
  self->_editMode = a3;
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (CNContactRecentsReference)recentsData
{
  return self->_recentsData;
}

- (void)setRecentsData:(id)a3
{
  objc_storeStrong((id *)&self->_recentsData, a3);
}

- (void)setProhibitedPropertyKeys:(id)a3
{
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, a3);
}

- (void)setPrimaryPropertyKey:(id)a3
{
  objc_storeStrong((id *)&self->_primaryPropertyKey, a3);
}

- (void)setAllowsDisplayModePickerActions:(BOOL)a3
{
  self->_allowsDisplayModePickerActions = a3;
}

- (void)setAllowsEditPhoto:(BOOL)a3
{
  self->_allowsEditPhoto = a3;
}

- (void)setIgnoresParentalRestrictions:(BOOL)a3
{
  self->_ignoresParentalRestrictions = a3;
}

- (void)setAllowsNamePicking:(BOOL)a3
{
  self->_allowsNamePicking = a3;
}

- (void)setShowsInlineActions:(BOOL)a3
{
  self->_showsInlineActions = a3;
}

- (void)setShowsSharedProfile:(BOOL)a3
{
  self->_showsSharedProfile = a3;
}

- (void)setShowsGroupMembership:(BOOL)a3
{
  self->_showsGroupMembership = a3;
}

- (void)setImportantMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1248);
}

- (void)setWarningMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1256);
}

- (void)setVerifiedInfoMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1264);
}

- (void)setContactHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_contactHeaderView, a3);
}

- (void)setContactHeaderViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contactHeaderViewController, a3);
}

- (void)setContactHeaderViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contactHeaderViewDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contactHeaderViewDelegate);
  objc_storeStrong((id *)&self->_contactHeaderViewController, 0);
  objc_storeStrong((id *)&self->_contactHeaderView, 0);
  objc_storeStrong((id *)&self->_verifiedInfoMessage, 0);
  objc_storeStrong((id *)&self->_warningMessage, 0);
  objc_storeStrong((id *)&self->_importantMessage, 0);
  objc_storeStrong((id *)&self->_primaryPropertyKey, 0);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_recentsData, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_staticIdentity, 0);
  objc_storeStrong((id *)&self->_initialPrompt, 0);
  objc_destroyWeak((id *)&self->_pptDelegate);
  objc_storeStrong((id *)&self->_additionalContact, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_navItemUpdater, 0);
  objc_storeStrong((id *)&self->_observedNavigationItem, 0);
  objc_storeStrong((id *)&self->_preEditLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_extraLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_extraRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_highlightedPropertyIdentifier, 0);
  objc_storeStrong((id *)&self->_highlightedPropertyKey, 0);
  objc_storeStrong((id *)&self->_accessDeniedView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_contentContact, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_alternateName, 0);
  objc_storeStrong((id *)&self->_parentContainer, 0);
  objc_storeStrong((id *)&self->_parentGroup, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

void __49__CNContactViewController__prepareViewController__block_invoke_76(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setViewController:", v3);

}

uint64_t __49__CNContactViewController__prepareViewController__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;

  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactViewController.m", 780, 3, CFSTR("Contact view delayed appearance timed out"), a5, a6, a7, a8, vars0);
  return 1;
}

void __76__CNContactViewController_confirmCancelAlertControllerAnchoredAtButtonItem___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performConfirmedCancel");

}

+ (CNContactViewController)viewControllerForContact:(CNContact *)contact
{
  CNContact *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = contact;
  objc_msgSend(a1, "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = (uint64_t)v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact assertKeysAreAvailable:](v4, "assertKeysAreAvailable:", v6);

  if (-[CNContact isUnknown](v4, "isUnknown"))
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactViewController.m", 107, 3, CFSTR("Behavior of CNContactViewController created with viewControllerForContact: and passing an unknown contact is undefined. Please use +viewControllerForUnknownContact: instead."), v7, v8, v9, v10, v13[0]);
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMode:", 1);
  objc_msgSend(v11, "setContact:", v4);

  return (CNContactViewController *)v11;
}

+ (CNContactViewController)viewControllerForUnknownContact:(CNContact *)contact
{
  CNContact *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = contact;
  objc_msgSend(a1, "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = (uint64_t)v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact assertKeysAreAvailable:](v4, "assertKeysAreAvailable:", v6);

  if (!-[CNContact isUnknown](v4, "isUnknown"))
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactViewController.m", 118, 3, CFSTR("Behavior of CNContactViewController created with viewControllerForUnknownContact: and passing a known contact is undefined. Please use +viewControllerForContact: instead."), v7, v8, v9, v10, v13[0]);
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMode:", 2);
  objc_msgSend(v11, "setContact:", v4);

  return (CNContactViewController *)v11;
}

+ (CNContactViewController)viewControllerForNewContact:(CNContact *)contact
{
  CNContact *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = contact;
  objc_msgSend(a1, "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact assertKeysAreAvailable:](v4, "assertKeysAreAvailable:", v6);

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMode:", 3);
  CNContactsUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CREATE_NEW_CONTACT_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v9);

  if (!v4)
    v4 = (CNContact *)objc_alloc_init(MEMORY[0x1E0C97360]);
  objc_msgSend(v7, "setContact:", v4);

  return (CNContactViewController *)v7;
}

+ (id)viewControllerForUpdatingContact:(id)a3 withPropertiesFromContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "descriptorForRequiredKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertKeysAreAvailable:", v9);

  v10 = objc_alloc((Class)a1);
  if (objc_msgSend(v6, "isSuggested"))
    v11 = 5;
  else
    v11 = 4;
  v12 = (void *)objc_msgSend(v10, "initWithMode:", v11);
  objc_msgSend(v12, "setContact:", v7);

  objc_msgSend(v12, "setAdditionalContact:", v6);
  return v12;
}

+ (id)viewControllerForUpdatingContact:(id)a3 withPublicAccountIdentity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "descriptorForRequiredKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertKeysAreAvailable:", v9);

  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMode:", 4);
  objc_msgSend(v10, "setContact:", v7);

  objc_msgSend(v10, "setStaticIdentity:", v6);
  return v10;
}

+ (id)viewControllerForNewDraftContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    return 0;
  v5 = v4;
  v6 = (void *)objc_msgSend(v4, "copyWithDistinctIdentifier");

  objc_msgSend(a1, "descriptorForRequiredKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertKeysAreAvailable:", v8);

  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMode:", 3);
  CNContactsUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CREATE_DRAFT_CONTACT_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v11);

  objc_msgSend(v9, "setContact:", v6);
  return v9;
}

+ (id)viewControllerForEditedDraftContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = a3;
  objc_msgSend(a1, "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertKeysAreAvailable:", v6);

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMode:", 4);
  CNContactsUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CREATE_DRAFT_CONTACT_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v9);

  objc_msgSend(v7, "setContact:", v4);
  return v7;
}

@end
