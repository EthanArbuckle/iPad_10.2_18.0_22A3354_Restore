@implementation CKAllowedSharingOptions

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

- (CKAllowedSharingOptions)initWithAllowedParticipantPermissionOptions:(CKSharingParticipantPermissionOption)allowedParticipantPermissionOptions allowedParticipantAccessOptions:(CKSharingParticipantAccessOption)allowedParticipantAccessOptions
{
  CKAllowedSharingOptions *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKAllowedSharingOptions;
  result = -[CKAllowedSharingOptions init](&v7, sel_init);
  if (result)
  {
    result->_allowedParticipantPermissionOptions = allowedParticipantPermissionOptions;
    result->_allowedParticipantAccessOptions = allowedParticipantAccessOptions;
  }
  return result;
}

+ (CKAllowedSharingOptions)standardOptions
{
  CKAllowedSharingOptions *v2;
  const char *v3;

  v2 = [CKAllowedSharingOptions alloc];
  return (CKAllowedSharingOptions *)(id)objc_msgSend_initWithAllowedParticipantPermissionOptions_allowedParticipantAccessOptions_(v2, v3, 3, 3);
}

- (_SWCollaborationShareOptions)shareOptions
{
  return (_SWCollaborationShareOptions *)((uint64_t (*)(CKAllowedSharingOptions *, char *))MEMORY[0x1E0DE7D20])(self, sel_shareOptionsFromAllowedOptions);
}

- (id)_uncachedShareOptionsFromAllowedOptions
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  const char *v9;
  void *v10;

  objc_msgSend_collaborationOptionsGroupsFromAllowedOptions(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CKSharingSummaryStringFromOptionsGroups(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E1F66ED0;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  objc_msgSend_shareOptionsWithOptionsGroups_summary_(MEMORY[0x1E0CD7420], v9, (uint64_t)v4, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)shareOptionsFromAllowedOptions
{
  CKAllowedSharingOptions *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  _SWCollaborationShareOptions *mutableShareOptions;
  uint64_t v7;
  _SWCollaborationShareOptions *v8;
  _SWCollaborationShareOptions *v9;

  v2 = self;
  objc_sync_enter(v2);
  mutableShareOptions = v2->_mutableShareOptions;
  if (!mutableShareOptions)
  {
    objc_msgSend__uncachedShareOptionsFromAllowedOptions(v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v2->_mutableShareOptions;
    v2->_mutableShareOptions = (_SWCollaborationShareOptions *)v7;

    mutableShareOptions = v2->_mutableShareOptions;
  }
  v9 = mutableShareOptions;
  objc_sync_exit(v2);

  return v9;
}

- (id)_uncachedCollaborationOptionsGroupsFromAllowedOptions
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  void *v49;
  CKAllowedSharingOptions *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  void *v82;
  void *v83;
  const char *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  id v121;
  const char *v122;
  void *v123;
  const char *v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  id v133;
  CKAllowedSharingOptions *v134;
  void *v135;
  void *v136;
  _QWORD v137[3];

  v137[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v8 = objc_msgSend_allowedParticipantPermissionOptions(self, v5, v6, v7);
  v9 = v8;
  if ((v8 & 2) != 0)
  {
    v11 = objc_alloc(MEMORY[0x1E0CD7408]);
    CKLocalizedString(CFSTR("COLLABORATION_OPTIONS_PERMISSION_RW"), &stru_1E1F66ED0, v12, v13, v14, v15, v16, v17, v130);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend_initWithTitle_identifier_(v11, v19, (uint64_t)v18, (uint64_t)CFSTR("CKSharingPermissionCanMakeChangesOptionID"));

    objc_msgSend_addObject_(v4, v20, (uint64_t)v10, v21);
    if ((v9 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v10 = 0;
  if ((v8 & 1) != 0)
  {
LABEL_5:
    v22 = objc_alloc(MEMORY[0x1E0CD7408]);
    CKLocalizedString(CFSTR("COLLABORATION_OPTIONS_PERMISSION_RO"), &stru_1E1F66ED0, v23, v24, v25, v26, v27, v28, v130);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend_initWithTitle_identifier_(v22, v30, (uint64_t)v29, (uint64_t)CFSTR("CKSharingPermissionViewOnlyOptionID"));

    objc_msgSend_addObject_(v4, v32, (uint64_t)v31, v33);
  }
LABEL_6:
  v34 = objc_alloc(MEMORY[0x1E0CD7418]);
  CKLocalizedString(CFSTR("COLLABORATION_OPTIONS_PERMISSION_TITLE"), &stru_1E1F66ED0, v35, v36, v37, v38, v39, v40, v130);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend_initWithTitle_identifier_footer_options_(v34, v42, (uint64_t)v41, (uint64_t)CFSTR("CKSharingPermissionGroupID"), 0, v4);

  v44 = (void *)objc_opt_new();
  v48 = objc_msgSend_allowedParticipantAccessOptions(self, v45, v46, v47);
  v49 = 0;
  if ((v48 & 2) == 0)
    goto LABEL_13;
  v50 = self;
  v51 = v10;
  v135 = v4;
  v52 = objc_alloc(MEMORY[0x1E0CD7408]);
  CKLocalizedString(CFSTR("COLLABORATION_OPTIONS_ACCESS_INVITED"), &stru_1E1F66ED0, v53, v54, v55, v56, v57, v58, (uint64_t)v131);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)objc_msgSend_initWithTitle_identifier_(v52, v60, (uint64_t)v59, (uint64_t)CFSTR("CKSharingAccessSpecifiedRecipientsOnlyOptionID"));

  objc_msgSend_addObject_(v44, v62, (uint64_t)v61, v63);
  v134 = v50;
  v49 = 0;
  if (!objc_msgSend_supportAllowingAddedParticipantsToInviteOthers(v50, v64, v65, v66) || !v61)
    goto LABEL_11;
  v10 = v51;
  if (v51)
  {
    v133 = objc_alloc(MEMORY[0x1E0CD7408]);
    CKLocalizedString(CFSTR("COLLABORATION_OPTIONS_ADDING_PEOPLE_ALLOW_OTHERS"), &stru_1E1F66ED0, v67, v68, v69, v70, v71, v72, (uint64_t)v131);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v61, v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v137[0] = v76;
    objc_msgSend_identifier(v51, v77, v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v137[1] = v80;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v81, (uint64_t)v137, 2);
    v82 = v43;
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend_initWithTitle_identifier_subtitle_selected_requiredOptionsIdentifiers_(v133, v84, (uint64_t)v131, (uint64_t)CFSTR("CKSharingAllowOthersToInviteOptionID"), 0, 1, v83);

    v43 = v82;
LABEL_11:
    v10 = v51;
  }

  self = v134;
  v4 = v135;
LABEL_13:
  if ((v48 & 1) != 0)
  {
    v85 = objc_alloc(MEMORY[0x1E0CD7408]);
    CKLocalizedString(CFSTR("COLLABORATION_OPTIONS_ACCESS_ANYONE"), &stru_1E1F66ED0, v86, v87, v88, v89, v90, v91, (uint64_t)v131);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = (void *)objc_msgSend_initWithTitle_identifier_(v85, v93, (uint64_t)v92, (uint64_t)CFSTR("CKSharingAccessAnyoneWithLinkOptionID"));

    objc_msgSend_addObject_(v44, v95, (uint64_t)v94, v96);
  }
  v97 = objc_alloc(MEMORY[0x1E0CD7418]);
  CKLocalizedString(CFSTR("COLLABORATION_OPTIONS_ACCESS_TITLE"), &stru_1E1F66ED0, v98, v99, v100, v101, v102, v103, (uint64_t)v131);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = (void *)objc_msgSend_initWithTitle_identifier_footer_options_(v97, v105, (uint64_t)v104, (uint64_t)CFSTR("CKSharingWhoCanAccessGroupID"), 0, v44);

  objc_msgSend_addObject_(v3, v107, (uint64_t)v106, v108);
  objc_msgSend_addObject_(v3, v109, (uint64_t)v43, v110);
  if (v49)
  {
    if (objc_msgSend__optionsGroupsOnlyContainsSingleOptionInPermissionArrayAndWhoCanAccessArray_(self, v111, (uint64_t)v3, v113))
    {
      CKLocalizedString(CFSTR("COLLABORATION_OPTIONS_PERMISSION_TITLE"), &stru_1E1F66ED0, v114, v115, v116, v117, v118, v119, v132);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v120 = 0;
    }
    v121 = objc_alloc(MEMORY[0x1E0CD7410]);
    v136 = v49;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v122, (uint64_t)&v136, 1);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = (void *)objc_msgSend_initWithTitle_identifier_footer_options_(v121, v124, (uint64_t)v120, (uint64_t)CFSTR("CKSharingAllowOthersToInviteGroupID"), 0, v123);

    objc_msgSend_addObject_(v3, v126, (uint64_t)v125, v127);
  }
  v128 = (void *)objc_msgSend_copy(v3, v111, v112, v113);

  return v128;
}

- (BOOL)_optionsGroupsOnlyContainsSingleOptionInPermissionArrayAndWhoCanAccessArray:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  char v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v38, (uint64_t)v42, 16);
  if (v5)
  {
    v9 = v5;
    v10 = 0;
    v37 = 0;
    v11 = *(_QWORD *)v39;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v3);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend_identifier(v13, v6, v7, v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqualToString_(v14, v15, (uint64_t)CFSTR("CKSharingPermissionGroupID"), v16) & 1) != 0)
        {
          objc_msgSend_options(v13, v17, v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend_count(v20, v21, v22, v23);

          if (v24 == 1)
          {
            v37 = 1;
            continue;
          }
        }
        else
        {

        }
        objc_msgSend_identifier(v13, v6, v7, v8);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToString_(v25, v26, (uint64_t)CFSTR("CKSharingWhoCanAccessGroupID"), v27))
        {
          objc_msgSend_options(v13, v28, v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend_count(v31, v32, v33, v34) == 1;

        }
        else
        {
          v35 = 0;
        }

        v10 |= v35;
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v38, (uint64_t)v42, 16);
      if (!v9)
        goto LABEL_18;
    }
  }
  v10 = 0;
  v37 = 0;
LABEL_18:

  return v37 & v10 & 1;
}

- (id)collaborationOptionsGroupsFromAllowedOptions
{
  CKAllowedSharingOptions *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  NSArray *mutableOptionsGroups;
  uint64_t v7;
  NSArray *v8;
  NSArray *v9;

  v2 = self;
  objc_sync_enter(v2);
  mutableOptionsGroups = v2->_mutableOptionsGroups;
  if (!mutableOptionsGroups)
  {
    objc_msgSend__uncachedCollaborationOptionsGroupsFromAllowedOptions(v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v2->_mutableOptionsGroups;
    v2->_mutableOptionsGroups = (NSArray *)v7;

    mutableOptionsGroups = v2->_mutableOptionsGroups;
  }
  v9 = mutableOptionsGroups;
  objc_sync_exit(v2);

  return v9;
}

- (void)_resolveCollaborationOptionsGroupsForExistingShare:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  CKAllowedSharingOptions *v40;
  NSArray *mutableOptionsGroups;
  NSArray *v42;
  _SWCollaborationShareOptions *mutableShareOptions;
  const char *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  void *v80;
  const char *v81;
  void *v82;
  const char *v83;
  uint64_t v84[2];
  _QWORD v85[2];

  v85[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_shareOptions(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_optionsGroups(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (NSArray *)objc_msgSend_mutableCopy(v12, v13, v14, v15);

  if (objc_msgSend_publicPermission(v4, v17, v18, v19) == 1)
  {
    objc_msgSend__selectOptionWithIdentifier_inGroups_(self, v20, (uint64_t)CFSTR("CKSharingAccessSpecifiedRecipientsOnlyOptionID"), (uint64_t)v16);
    objc_msgSend_participants(v4, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_count(v24, v25, v26, v27);

    if (v28 >= 2)
    {
      if (objc_msgSend_allNonOwnerParticipantsHavePermission_(v4, v29, 2, v30))
      {
        objc_msgSend__selectOptionWithIdentifier_inGroups_(self, v31, (uint64_t)CFSTR("CKSharingPermissionViewOnlyOptionID"), (uint64_t)v16);
      }
      else if (objc_msgSend_allNonOwnerParticipantsHavePermission_(v4, v31, 3, v32))
      {
        objc_msgSend__selectOptionWithIdentifier_inGroups_(self, v44, (uint64_t)CFSTR("CKSharingPermissionCanMakeChangesOptionID"), (uint64_t)v16);
      }
      else
      {
        v45 = objc_alloc(MEMORY[0x1E0CD7408]);
        CKLocalizedString(CFSTR("COLLABORATION_OPTIONS_PERMISSION_MIXED"), &stru_1E1F66ED0, v46, v47, v48, v49, v50, v51, v84[0]);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)objc_msgSend_initWithTitle_identifier_selected_(v45, v53, (uint64_t)v52, (uint64_t)CFSTR("CKSharingPermissionMixedOptionID"), 1);

        v85[0] = v54;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v55, (uint64_t)v85, 1);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__addOptions_toExistingGroupWithID_inOptionsGroups_(self, v57, (uint64_t)v56, (uint64_t)CFSTR("CKSharingPermissionGroupID"), v16);

      }
      if (objc_msgSend_supportAllowingAddedParticipantsToInviteOthers(self, v33, v34, v35))
      {
        if (objc_msgSend_allNonOwnerParticipantsHaveRole_(v4, v58, 2, v59))
        {
          objc_msgSend__selectOptionWithIdentifier_inGroups_(self, v60, (uint64_t)CFSTR("CKSharingAllowOthersToInviteOptionID"), (uint64_t)v16);
        }
        else
        {
          v61 = objc_alloc(MEMORY[0x1E0CD7408]);
          CKLocalizedString(CFSTR("COLLABORATION_OPTIONS_ADDING_PEOPLE_ONLY_YOU"), &stru_1E1F66ED0, v62, v63, v64, v65, v66, v67, v84[0]);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = (void *)objc_msgSend_initWithTitle_identifier_selected_(v61, v69, (uint64_t)v68, (uint64_t)CFSTR("CKSharingOnlyYouCanInviteOthersOptionID"), 0);

          v71 = objc_alloc(MEMORY[0x1E0CD7408]);
          CKLocalizedString(CFSTR("COLLABORATION_OPTIONS_ADDING_PEOPLE_MIXED"), &stru_1E1F66ED0, v72, v73, v74, v75, v76, v77, v84[0]);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = (void *)objc_msgSend_initWithTitle_identifier_selected_(v71, v79, (uint64_t)v78, (uint64_t)CFSTR("CKSharingAllowOthersToInviteMixedOptionID"), 1);

          v84[0] = (uint64_t)v70;
          v84[1] = (uint64_t)v80;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v81, (uint64_t)v84, 2);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__addOptions_toExistingGroupWithID_inOptionsGroups_(self, v83, (uint64_t)v82, (uint64_t)CFSTR("CKSharingAllowOthersToInviteGroupID"), v16);

        }
      }
      else
      {
        objc_msgSend__removeOptionGroupWithID_fromOptionsGroups_(self, v58, (uint64_t)CFSTR("CKSharingAllowOthersToInviteGroupID"), (uint64_t)v16);
      }
    }
  }
  else
  {
    objc_msgSend__selectOptionWithIdentifier_inGroups_(self, v20, (uint64_t)CFSTR("CKSharingAccessAnyoneWithLinkOptionID"), (uint64_t)v16);
    if (objc_msgSend_publicPermission(v4, v36, v37, v38) == 3)
      objc_msgSend__selectOptionWithIdentifier_inGroups_(self, v39, (uint64_t)CFSTR("CKSharingPermissionCanMakeChangesOptionID"), (uint64_t)v16);
    else
      objc_msgSend__selectOptionWithIdentifier_inGroups_(self, v39, (uint64_t)CFSTR("CKSharingPermissionViewOnlyOptionID"), (uint64_t)v16);
  }
  v40 = self;
  objc_sync_enter(v40);
  mutableOptionsGroups = v40->_mutableOptionsGroups;
  v40->_mutableOptionsGroups = v16;
  v42 = v16;

  mutableShareOptions = v40->_mutableShareOptions;
  v40->_mutableShareOptions = 0;

  objc_sync_exit(v40);
}

- (void)_selectOptionWithIdentifier:(id)a3 inGroups:(id)a4
{
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  int isEqualToString;
  void *v26;
  const char *v27;
  uint64_t v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = a4;
  v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v37, (uint64_t)v42, 16);
  if (v31)
  {
    v30 = *(_QWORD *)v38;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v38 != v30)
          objc_enumerationMutation(obj);
        v32 = v10;
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v10);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend_options(v11, v7, v8, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v33, (uint64_t)v41, 16);
        if (v14)
        {
          v18 = v14;
          v19 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v34 != v19)
                objc_enumerationMutation(v12);
              v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_msgSend_identifier(v21, v15, v16, v17);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              isEqualToString = objc_msgSend_isEqualToString_(v22, v23, (uint64_t)v5, v24);

              if (isEqualToString)
              {
                objc_msgSend_setSelected_(v21, v15, 1, v17);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend_identifier(v21, v15, v16, v17);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setSelectedOptionIdentifier_(v11, v27, (uint64_t)v26, v28);

                }
              }
            }
            v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v33, (uint64_t)v41, 16);
          }
          while (v18);
        }

        v10 = v32 + 1;
      }
      while (v32 + 1 != v31);
      v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v37, (uint64_t)v42, 16);
    }
    while (v31);
  }

}

- (void)_removeOptionGroupWithID:(id)a3 fromOptionsGroups:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  int isEqualToString;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v8)
  {
    v12 = v8;
    v13 = 0;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v6);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend_identifier(v16, v9, v10, v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v17, v18, (uint64_t)v5, v19);

        if (isEqualToString)
        {
          v21 = v16;

          v13 = v21;
        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v12);
    if (v13)
    {
      objc_msgSend_removeObject_(v6, v9, (uint64_t)v13, v11);

    }
  }

}

- (void)_addOptions:(id)a3 toExistingGroupWithID:(id)a4 inOptionsGroups:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  int isEqualToString;
  id v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  int v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  id v54;
  id v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v79, (uint64_t)v84, 16);
  if (v12)
  {
    v16 = v12;
    v74 = v8;
    v17 = 0;
    v18 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v80 != v18)
          objc_enumerationMutation(v10);
        v20 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        objc_msgSend_identifier(v20, v13, v14, v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v21, v22, (uint64_t)v9, v23);

        if (isEqualToString)
        {
          v25 = v20;

          v17 = v25;
        }
      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v79, (uint64_t)v84, 16);
    }
    while (v16);
    v8 = v74;
    if (v17)
    {
      objc_msgSend_title(v17, v13, v14, v15);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v17, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend_isEqualToString_(v30, v31, (uint64_t)CFSTR("CKSharingAllowOthersToInviteGroupID"), v32);

      if (v33
        && (objc_msgSend__optionsGroupsOnlyContainsSingleOptionInPermissionArrayAndWhoCanAccessArray_(self, v34, (uint64_t)v10, v35) & 1) == 0)
      {
        CKLocalizedString(CFSTR("COLLABORATION_OPTIONS_ADDING_PEOPLE_TITLE"), &stru_1E1F66ED0, v36, v37, v38, v39, v40, v41, v73);
        v42 = objc_claimAutoreleasedReturnValue();

        v26 = (void *)v42;
      }
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v43 = v74;
      v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v75, (uint64_t)v83, 16);
      if (v45)
      {
        v49 = v45;
        v50 = 0;
        v51 = *(_QWORD *)v76;
        do
        {
          for (j = 0; j != v49; ++j)
          {
            if (*(_QWORD *)v76 != v51)
              objc_enumerationMutation(v43);
            v53 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
            if (objc_msgSend_isSelected(v53, v46, v47, v48))
            {
              v54 = v53;

              v50 = v54;
            }
          }
          v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v75, (uint64_t)v83, 16);
        }
        while (v49);
      }
      else
      {
        v50 = 0;
      }

      v55 = objc_alloc(MEMORY[0x1E0CD7418]);
      objc_msgSend_options(v17, v56, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayByAddingObjectsFromArray_(v59, v60, (uint64_t)v43, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = (void *)objc_msgSend_initWithTitle_identifier_footer_options_(v55, v63, (uint64_t)v26, (uint64_t)v9, 0, v62);

      if (v50)
      {
        objc_msgSend_identifier(v50, v65, v66, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setSelectedOptionIdentifier_(v64, v69, (uint64_t)v68, v70);

      }
      objc_msgSend_removeObject_(v10, v65, (uint64_t)v17, v67);
      objc_msgSend_addObject_(v10, v71, (uint64_t)v64, v72);

      v8 = v74;
    }
  }

}

+ (id)resolvedOptionsFromOptions:(id)a3 forExistingShare:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v5 = a4;
  v9 = (void *)objc_msgSend_copy(a3, v6, v7, v8);
  if (objc_msgSend_publicPermission(v5, v10, v11, v12) != 1)
    goto LABEL_7;
  objc_msgSend_currentUserParticipant(v5, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_role(v16, v17, v18, v19) == 1)
  {

  }
  else
  {
    objc_msgSend_currentUserParticipant(v5, v20, v21, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend_role(v25, v26, v27, v28);

    if (v29 != 2)
      objc_msgSend_setSupportAllowingAddedParticipantsToInviteOthers_(v9, v23, 0, v24);
  }
  if (objc_msgSend_allNonOwnerParticipantsHavePermission_(v5, v23, 2, v24))
LABEL_7:
    objc_msgSend_setSupportAllowingAddedParticipantsToInviteOthers_(v9, v13, 0, v15);
  objc_msgSend__resolveCollaborationOptionsGroupsForExistingShare_(v9, v13, (uint64_t)v5, v15);

  return v9;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("UTCollaborationOptionsType");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  void *v6;
  id v7;
  uint64_t v8;
  const char *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a3;
  v8 = objc_opt_class();
  objc_msgSend_unarchivedObjectOfClass_fromData_error_(v6, v9, v8, (uint64_t)v7, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("UTCollaborationOptionsType");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3
{
  return 0;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  void (**v5)(id, void *, id);
  const char *v6;
  void *v7;
  id v8;
  id v10;

  v5 = (void (**)(id, void *, id))a4;
  v10 = 0;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v6, (uint64_t)self, 1, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  if (v5)
    v5[2](v5, v7, v8);

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  id v33;

  v4 = a3;
  v8 = objc_msgSend_allowedParticipantPermissionOptions(self, v5, v6, v7);
  objc_msgSend_encodeInteger_forKey_(v4, v9, v8, (uint64_t)CFSTR("CKSharingAllowedParticipantPermissionOptionsKey"));
  v13 = objc_msgSend_allowedParticipantAccessOptions(self, v10, v11, v12);
  objc_msgSend_encodeInteger_forKey_(v4, v14, v13, (uint64_t)CFSTR("CKSharingAllowedParticipantAccessOptionsKey"));
  v18 = objc_msgSend_supportAllowingAddedParticipantsToInviteOthers(self, v15, v16, v17);
  objc_msgSend_encodeBool_forKey_(v4, v19, v18, (uint64_t)CFSTR("CKSharingSupportAllowingAddedParticipantsToInviteOthersKey"));
  objc_msgSend_shareOptions(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, (uint64_t)CFSTR("CKSharingCollaborationShareOptionsKey"));

  objc_msgSend_shareOptions(self, v25, v26, v27);
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_optionsGroups(v33, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v31, (uint64_t)CFSTR("CKSharingCollaborationOptionsGroupsKey"));

}

- (CKAllowedSharingOptions)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  CKAllowedSharingOptions *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  _SWCollaborationShareOptions *mutableShareOptions;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  NSArray *mutableOptionsGroups;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CKAllowedSharingOptions;
  v7 = -[CKAllowedSharingOptions init](&v28, sel_init);
  if (v7)
  {
    v7->_allowedParticipantPermissionOptions = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("CKSharingAllowedParticipantPermissionOptionsKey"), v6);
    v7->_allowedParticipantAccessOptions = objc_msgSend_decodeIntegerForKey_(v4, v8, (uint64_t)CFSTR("CKSharingAllowedParticipantAccessOptionsKey"), v9);
    v7->_supportAllowingAddedParticipantsToInviteOthers = objc_msgSend_decodeBoolForKey_(v4, v10, (uint64_t)CFSTR("CKSharingSupportAllowingAddedParticipantsToInviteOthersKey"), v11);
    v12 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, (uint64_t)CFSTR("CKSharingCollaborationShareOptionsKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    mutableShareOptions = v7->_mutableShareOptions;
    v7->_mutableShareOptions = (_SWCollaborationShareOptions *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    objc_msgSend_setWithObjects_(v16, v21, v17, v22, v18, v19, v20, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v23, (uint64_t)CFSTR("CKSharingCollaborationOptionsGroupsKey"));
    v25 = objc_claimAutoreleasedReturnValue();
    mutableOptionsGroups = v7->_mutableOptionsGroups;
    v7->_mutableOptionsGroups = (NSArray *)v25;

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKAllowedSharingOptions *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _SWCollaborationShareOptions *mutableShareOptions;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSArray *mutableOptionsGroups;

  v4 = objc_alloc_init(CKAllowedSharingOptions);
  v4->_allowedParticipantPermissionOptions = objc_msgSend_allowedParticipantPermissionOptions(self, v5, v6, v7);
  v4->_allowedParticipantAccessOptions = objc_msgSend_allowedParticipantAccessOptions(self, v8, v9, v10);
  v4->_supportAllowingAddedParticipantsToInviteOthers = objc_msgSend_supportAllowingAddedParticipantsToInviteOthers(self, v11, v12, v13);
  objc_msgSend_mutableShareOptions(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_copy(v17, v18, v19, v20);
  mutableShareOptions = v4->_mutableShareOptions;
  v4->_mutableShareOptions = (_SWCollaborationShareOptions *)v21;

  objc_msgSend_mutableOptionsGroups(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v26, v27, v28, v29);
  v30 = objc_claimAutoreleasedReturnValue();
  mutableOptionsGroups = v4->_mutableOptionsGroups;
  v4->_mutableOptionsGroups = (NSArray *)v30;

  return v4;
}

- (CKSharingParticipantPermissionOption)allowedParticipantPermissionOptions
{
  return self->_allowedParticipantPermissionOptions;
}

- (void)setAllowedParticipantPermissionOptions:(CKSharingParticipantPermissionOption)allowedParticipantPermissionOptions
{
  self->_allowedParticipantPermissionOptions = allowedParticipantPermissionOptions;
}

- (CKSharingParticipantAccessOption)allowedParticipantAccessOptions
{
  return self->_allowedParticipantAccessOptions;
}

- (void)setAllowedParticipantAccessOptions:(CKSharingParticipantAccessOption)allowedParticipantAccessOptions
{
  self->_allowedParticipantAccessOptions = allowedParticipantAccessOptions;
}

- (_SWCollaborationShareOptions)mutableShareOptions
{
  return self->_mutableShareOptions;
}

- (void)setMutableShareOptions:(id)a3
{
  objc_storeStrong((id *)&self->_mutableShareOptions, a3);
}

- (NSArray)mutableOptionsGroups
{
  return self->_mutableOptionsGroups;
}

- (void)setMutableOptionsGroups:(id)a3
{
  objc_storeStrong((id *)&self->_mutableOptionsGroups, a3);
}

- (BOOL)supportAllowingAddedParticipantsToInviteOthers
{
  return self->_supportAllowingAddedParticipantsToInviteOthers;
}

- (void)setSupportAllowingAddedParticipantsToInviteOthers:(BOOL)a3
{
  self->_supportAllowingAddedParticipantsToInviteOthers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableOptionsGroups, 0);
  objc_storeStrong((id *)&self->_mutableShareOptions, 0);
}

@end
