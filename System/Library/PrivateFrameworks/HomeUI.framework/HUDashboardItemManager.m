@implementation HUDashboardItemManager

uint64_t __71__HUDashboardItemManager__didFinishUpdateTransactionWithAffectedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isHomeMenuStatusItem:", a2);
}

uint64_t __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HUAccessoryTypeGroupForDashboardSectionIdentifier(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31130], "otherAccessoryTypeGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (BOOL)isEmptyDashboard
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  -[HUDashboardItemManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUDashboardItemManager context](self, "context");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v5, "room");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_visibleAccessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v5) = objc_msgSend(v7, "na_all:", &__block_literal_global_128);
    -[HUDashboardItemManager context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "room");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hf_hasVisibleAccessories") ^ 1 | v5;

  }
  else
  {
    -[HFItemManager home](self, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "hf_hasVisibleAccessories") ^ 1;
  }

  return v10;
}

BOOL __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(*(id *)(a1 + 32), "childItemsForItem:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31328], "hu_preferredToggleableControlItemInControlItems:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  char v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  unint64_t v84;
  void *v85;
  int v86;
  void *v87;
  int v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  char v110;
  void *v111;
  id v112;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  _QWORD v120[5];
  _QWORD v121[5];
  _QWORD v122[5];
  id v123;
  id v124;
  _QWORD v125[5];
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  _QWORD v130[3];

  v130[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardItemManager context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldHideSectionWithIdentifier:", CFSTR("bannersSection"));

  if ((v7 & 1) == 0)
  {
    -[HUDashboardItemManager bannerItemModule](self, "bannerItemModule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "buildSectionsWithDisplayedItems:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "na_safeAddObjectsFromArray:", v9);
  }
  -[HUDashboardItemManager context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldHideSectionWithIdentifier:", CFSTR("statusSection"));

  if ((v11 & 1) == 0)
  {
    -[HUDashboardItemManager statusItemModule](self, "statusItemModule");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "buildSectionsWithDisplayedItems:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "na_safeAddObjectsFromArray:", v13);
  }
  -[HUDashboardItemManager context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "shouldHideSectionWithIdentifier:", CFSTR("tipsSection"));

  if ((v15 & 1) != 0)
  {
    v16 = 0;
  }
  else
  {
    -[HUDashboardItemManager tipItemModule](self, "tipItemModule");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "buildSectionsWithDisplayedItems:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[HUDashboardItemManager energyDashboardItemModule](self, "energyDashboardItemModule");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "buildSectionsWithDisplayedItems:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v125[0] = MEMORY[0x1E0C809B0];
  v125[1] = 3221225472;
  v125[2] = __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke;
  v125[3] = &unk_1E6F56038;
  v125[4] = self;
  objc_msgSend(v19, "na_filter:", v125);
  v20 = objc_claimAutoreleasedReturnValue();

  v116 = (void *)v20;
  objc_msgSend(v5, "na_safeAddObjectsFromArray:", v20);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardItemManager context](self, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "shouldHideSectionWithIdentifier:", CFSTR("camerasSection")) & 1) == 0)
  {
    -[HUDashboardItemManager context](self, "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "cameraPresentationStyle");

    if (v24 != 1)
      goto LABEL_12;
    -[HUDashboardItemManager cameraItemModule](self, "cameraItemModule");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "buildSectionsWithDisplayedItems:", v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "na_safeAddObjectsFromArray:", v22);
  }

LABEL_12:
  -[HUDashboardItemManager context](self, "context");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "shouldHideSectionWithIdentifier:", CFSTR("scenesSection"));

  if ((v27 & 1) == 0)
  {
    -[HUDashboardItemManager actionSetItemModule](self, "actionSetItemModule");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "buildSectionsWithDisplayedItems:", v4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "na_safeAddObjectsFromArray:", v29);
  }
  if (_os_feature_enabled_impl())
  {
    -[HUDashboardItemManager context](self, "context");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "shouldHideSectionWithIdentifier:", CFSTR("NowPlayingSection"));

    if ((v31 & 1) == 0)
    {
      v32 = (void *)MEMORY[0x1E0D4C5B0];
      v122[0] = MEMORY[0x1E0C809B0];
      v122[1] = 3221225472;
      v122[2] = __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke_2;
      v122[3] = &unk_1E6F56060;
      v122[4] = self;
      v123 = v4;
      v124 = v5;
      objc_msgSend(v32, "homePlatterPreferredRouteIdentifier:", v122);

    }
  }
  -[HUDashboardItemManager accessoryTransformItemProvider](self, "accessoryTransformItemProvider");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "items");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v34, "mutableCopy");

  -[HUDashboardItemManager programmableSwitchItemProvider](self, "programmableSwitchItemProvider");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "items");
  v37 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "unionSet:", v37);

  v115 = v35;
  objc_msgSend(v35, "na_setByIntersectingWithSet:", v4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardItemManager context](self, "context");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v37) = objc_msgSend(v39, "shouldHideSectionWithIdentifier:", CFSTR("favoritesSection"));

  if ((v37 & 1) == 0)
  {
    -[HUDashboardItemManager favoritesItemProvider](self, "favoritesItemProvider");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "items");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "na_setByIntersectingWithSet:", v4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUDashboardItemManager _buildFavoritesSectionWithFavoriteItems:](self, "_buildFavoritesSectionWithFavoriteItems:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "na_safeAddObjectsFromArray:", v43);

  }
  -[HUDashboardItemManager context](self, "context");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "accessoryGroupingStyle");

  if (v45 == 2)
  {
    v121[0] = MEMORY[0x1E0C809B0];
    v121[1] = 3221225472;
    v121[2] = __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke_275;
    v121[3] = &unk_1E6F508C8;
    v121[4] = self;
    objc_msgSend(v38, "na_filter:", v121);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardItemManager _buildRoomSectionsWithItems:](self, "_buildRoomSectionsWithItems:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v47);

  }
  -[HUDashboardItemManager context](self, "context");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "accessoryGroupingStyle");

  if (v49 == 3)
  {
    -[HUDashboardItemManager _buildAccessoryCategorySectionsWithItems:](self, "_buildAccessoryCategorySectionsWithItems:", v38);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v50);

  }
  -[HUDashboardItemManager context](self, "context");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "shouldHideSectionWithIdentifier:", CFSTR("AllAccessoriesSection"));

  if ((v52 & 1) == 0)
  {
    -[HUDashboardItemManager _buildSingleAccessoryGroupSectionWithItems:allDisplayedItems:](self, "_buildSingleAccessoryGroupSectionWithItems:allDisplayedItems:", v38, v4);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v53);

  }
  -[HUDashboardItemManager context](self, "context");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "room");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = objc_alloc(MEMORY[0x1E0CB3928]);
  v119 = v16;
  if (v55)
  {
    -[HUDashboardItemManager context](self, "context");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "room");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "hf_dashboardSectionReorderableUUIDStringComparator");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)objc_msgSend(v56, "initWithKey:ascending:comparator:", CFSTR("identifier"), 1, v59);

    v16 = v119;
  }
  else
  {
    -[HFItemManager home](self, "home");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "hf_dashboardSectionReorderableUUIDStringComparator");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)objc_msgSend(v56, "initWithKey:ascending:comparator:", CFSTR("identifier"), 1, v58);
  }

  v130[0] = v60;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sortUsingDescriptors:", v61);

  objc_msgSend(v5, "na_safeAddObjectsFromArray:", v21);
  if (v16)
  {
    v120[0] = MEMORY[0x1E0C809B0];
    v120[1] = 3221225472;
    v120[2] = __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke_2_280;
    v120[3] = &unk_1E6F56088;
    v120[4] = self;
    v62 = objc_msgSend(v5, "indexOfObjectPassingTest:", v120);
    if (v62 < objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v62 + 1, objc_msgSend(v16, "count"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "insertObjects:atIndexes:", v16, v63);

    }
  }
  -[HUDashboardItemManager context](self, "context");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v64, "shouldHideSectionWithIdentifier:", CFSTR("camerasSection")) & 1) == 0)
  {
    -[HUDashboardItemManager context](self, "context");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "cameraPresentationStyle");

    if (v66 != 2)
      goto LABEL_35;
    -[HUDashboardItemManager cameraItemModule](self, "cameraItemModule");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "buildSectionsWithDisplayedItems:", v4);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "na_safeAddObjectsFromArray:", v64);
  }

LABEL_35:
  -[HUDashboardItemManager context](self, "context");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "shouldHideSectionWithIdentifier:", CFSTR("GuestAccessSection"));

  v117 = v38;
  if ((v69 & 1) != 0)
    goto LABEL_48;
  v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("GuestAccessSection"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUDashboardSection_GuestAccess_Title"), CFSTR("HUDashboardSection_GuestAccess_Title"), 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setHeaderTitle:", v71);

  -[HUDashboardItemManager scheduleRuleItemProvider](self, "scheduleRuleItemProvider");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "items");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v4, "intersectsSet:", v73);

  v118 = v70;
  if (v74)
  {
    -[HUDashboardItemManager scheduleRuleItemProvider](self, "scheduleRuleItemProvider");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "items");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "allObjects");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D31758], "sortComparatorForScheduleRules");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "sortedArrayUsingComparator:", v77);
    v78 = v5;
    v79 = v4;
    v80 = v21;
    v81 = v60;
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setItems:", v82);

    v60 = v81;
    v21 = v80;
    v4 = v79;
    v5 = v78;
    v83 = v114;

    v38 = v117;
    v84 = 0x1E0C99000;
LABEL_40:

    goto LABEL_41;
  }
  -[HUDashboardItemManager alwaysAllowedScheduleItem](self, "alwaysAllowedScheduleItem");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v4, "containsObject:", v85);

  v84 = 0x1E0C99000uLL;
  if (v86)
  {
    -[HUDashboardItemManager alwaysAllowedScheduleItem](self, "alwaysAllowedScheduleItem");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = v83;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v129, 1);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "setItems:", v75);
    goto LABEL_40;
  }
LABEL_41:
  -[HUDashboardItemManager pinCodeAccessItem](self, "pinCodeAccessItem");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v4, "containsObject:", v87);

  v89 = v118;
  if (v88)
  {
    objc_msgSend(v118, "items");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardItemManager pinCodeAccessItem](self, "pinCodeAccessItem");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = v91;
    objc_msgSend(*(id *)(v84 + 3360), "arrayWithObjects:count:", &v128, 1);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "arrayByAddingObjectsFromArray:", v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "setItems:", v93);

    v89 = v118;
    v38 = v117;

  }
  -[HUDashboardItemManager homeKeyItem](self, "homeKeyItem");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v4, "containsObject:", v94);

  if (v95)
  {
    objc_msgSend(v89, "items");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardItemManager homeKeyItem](self, "homeKeyItem");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = v97;
    objc_msgSend(*(id *)(v84 + 3360), "arrayWithObjects:count:", &v127, 1);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "arrayByAddingObjectsFromArray:", v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "setItems:", v99);

    v89 = v118;
    v38 = v117;

  }
  -[HUDashboardItemManager contactOwnerItem](self, "contactOwnerItem");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v4, "containsObject:", v100);

  if (v101)
  {
    objc_msgSend(v89, "items");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardItemManager contactOwnerItem](self, "contactOwnerItem");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = v103;
    objc_msgSend(*(id *)(v84 + 3360), "arrayWithObjects:count:", &v126, 1);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "arrayByAddingObjectsFromArray:", v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "setItems:", v105);

    v89 = v118;
    v38 = v117;

  }
  objc_msgSend(v5, "na_safeAddObject:", v89);

LABEL_48:
  objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_286);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  if (v106)
  {
    objc_msgSend(v5, "removeObject:", v106);
    objc_msgSend(v5, "addObject:", v106);
  }
  -[HUDashboardItemManager context](self, "context");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v107, "shouldHideSectionWithIdentifier:", CFSTR("servicePlaceholder")) & 1) != 0)
    goto LABEL_55;
  -[HFItemManager home](self, "home");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v108, "hf_hasVisibleAccessories"))
  {

LABEL_55:
    goto LABEL_56;
  }
  -[HUDashboardItemManager context](self, "context");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend(v109, "shouldHidePlaceholderService");

  v38 = v117;
  if ((v110 & 1) == 0)
  {
    -[HUDashboardItemManager servicePlaceholderItemModule](self, "servicePlaceholderItemModule");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "buildSectionsWithDisplayedItems:", v4);
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "na_safeAddObjectsFromArray:", v107);
    goto LABEL_55;
  }
LABEL_56:
  v112 = v5;

  return v112;
}

- (HUDashboardContext)context
{
  return self->_context;
}

void __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@ routeIdentifier returned by MRNowPlayingRequest: %@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_buildNowPlayingSectionWithItems:forRouteIdentifier:", *(_QWORD *)(a1 + 40), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "na_safeAddObjectsFromArray:", v6);

}

- (HUBannerItemModule)bannerItemModule
{
  return self->_bannerItemModule;
}

- (HFProgrammableSwitchItemProvider)programmableSwitchItemProvider
{
  return self->_programmableSwitchItemProvider;
}

- (HFAccessoryLikeItemProvider)favoritesItemProvider
{
  return self->_favoritesItemProvider;
}

- (HUEnergyDashboardItemModule)energyDashboardItemModule
{
  return self->_energyDashboardItemModule;
}

- (HUDashboardAccessoryTransformItemProvider)accessoryTransformItemProvider
{
  return self->_accessoryTransformItemProvider;
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUDashboardItemManager;
  v4 = a3;
  -[HFItemManager _itemsToHideInSet:](&v10, sel__itemsToHideInSet_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy", v10.receiver, v10.super_class);

  -[HUDashboardItemManager homeMenuStatusItems](self, "homeMenuStatusItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_setByIntersectingWithSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "unionSet:", v8);
  return v6;
}

- (NSSet)homeMenuStatusItems
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HUDashboardItemManager statusItemModule](self, "statusItemModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__HUDashboardItemManager_homeMenuStatusItems__block_invoke;
  v7[3] = &unk_1E6F4DAD8;
  v7[4] = self;
  objc_msgSend(v4, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (HUStatusItemModule)statusItemModule
{
  return self->_statusItemModule;
}

- (HUDashboardTipModule)tipItemModule
{
  return self->_tipItemModule;
}

- (HUDashboardCameraItemModule)cameraItemModule
{
  return self->_cameraItemModule;
}

- (HUDashboardActionSetItemModule)actionSetItemModule
{
  return self->_actionSetItemModule;
}

- (id)_buildRoomSectionsWithItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D310C8];
  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__HUDashboardItemManager__buildRoomSectionsWithItems___block_invoke;
  v13[3] = &unk_1E6F560F8;
  v13[4] = self;
  objc_msgSend(v5, "createRoomSectionsWithItems:inHome:sectionIdentifierBlock:", v6, v7, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUDashboardItemManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "shouldHideEmptySections");

  if ((_DWORD)v6)
  {
    objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v8, v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v8;
  }
  v11 = v10;

  return v11;
}

- (id)_buildFavoritesSectionWithFavoriteItems:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D31570];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentifier:", CFSTR("favoritesSection"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUDashboardFavoritesHeaderTitle"), CFSTR("HUDashboardFavoritesHeaderTitle"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderTitle:", v7);

  -[HUDashboardItemManager reorderableFavoritesList](self, "reorderableFavoritesList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedHomeKitItemComparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v17.receiver = self;
    v17.super_class = (Class)HUDashboardItemManager;
    -[HFItemManager _comparatorForSectionIdentifier:](&v17, sel__comparatorForSectionIdentifier_, CFSTR("favoritesSection"));
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  objc_msgSend(v5, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingComparator:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v12);

  v13 = (void *)MEMORY[0x1E0D314B0];
  v18[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "filterSections:toDisplayedItems:", v14, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)reorderableFavoritesList
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HUDashboardItemManager clientReorderableFavoritesList](self, "clientReorderableFavoritesList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUDashboardItemManager clientReorderableFavoritesList](self, "clientReorderableFavoritesList");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    -[HFItemManager sourceItem](self, "sourceItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "latestResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30CC0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v4 = v8;

  }
  return v4;
}

- (HFReorderableHomeKitItemList)clientReorderableFavoritesList
{
  return self->_clientReorderableFavoritesList;
}

- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  _QWORD v10[5];
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUDashboardItemManager;
  -[HFItemManager _didFinishUpdateTransactionWithAffectedItems:](&v11, sel__didFinishUpdateTransactionWithAffectedItems_, v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__HUDashboardItemManager__didFinishUpdateTransactionWithAffectedItems___block_invoke;
  v10[3] = &unk_1E6F4DAD8;
  v10[4] = self;
  objc_msgSend(v4, "na_filter:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[HUDashboardItemManager dashboardDelegate](self, "dashboardDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dashboardItemManager:didUpdateHomeMenuStatusItems:", self, v5);

  }
  -[HFItemManager sourceItem](self, "sourceItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "containsObject:", v7);

  if (v8)
  {
    -[HFItemManager itemModules](self, "itemModules");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_each:", &__block_literal_global_312);

  }
}

uint64_t __45__HUDashboardItemManager_homeMenuStatusItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isHomeMenuStatusItem:", v3))
  {
    objc_msgSend(v3, "latestResults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue") ^ 1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isHomeMenuStatusItem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D31860], "hu_homeMenuStatusItemClasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", objc_opt_class());

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __54__HUDashboardItemManager__buildRoomSectionsWithItems___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  HUDashboardRoomSectionIdentifierForRoom(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldHideSectionWithIdentifier:", v3);

  if ((v5 & 1) != 0)
    v6 = 0;
  else
    v6 = v3;

  return v6;
}

- (HUDashboardItemManagerDelegate)dashboardDelegate
{
  return (HUDashboardItemManagerDelegate *)objc_loadWeakRetained((id *)&self->_dashboardDelegate);
}

void __71__HUDashboardItemManager__didFinishUpdateTransactionWithAffectedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "supportsReordering"))
    objc_msgSend(v2, "setReorderableHomeKitItemList:", 0);

}

uint64_t __53__HUDashboardItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  char v6;
  uint64_t v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldHideAccessoryRepresentable:", v3);

  if ((v6 & 1) != 0)
    v7 = 0;
  else
    v7 = objc_msgSend(v3, "hf_isFavorite");

  return v7;
}

uint64_t __53__HUDashboardItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "accessoryRepresentableHasStandardTileRepresentation:", v3);

  return v6;
}

- (id)_itemsToUpdateWhenApplicationDidBecomeActive
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUDashboardItemManager bannerItemModule](self, "bannerItemModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bannerItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setupBannerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_setWithSafeObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "shouldHideSectionWithIdentifier:", v5) ^ 1;
  return v6;
}

- (void)setDashboardDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dashboardDelegate, a3);
}

- (HUDashboardItemManager)initWithContext:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  HUDashboardItemManager *v9;
  HUDashboardItemManager *v10;
  HUServicePlaceholderItemModule *v11;
  HUServicePlaceholderItemModule *servicePlaceholderItemModule;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  HFPinCodeManager *pinCodeManager;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HUDashboardItemManager;
  v9 = -[HFItemManager initWithDelegate:sourceItem:](&v22, sel_initWithDelegate_sourceItem_, v8, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeWeak((id *)&v10->_dashboardDelegate, v8);
    v11 = -[HFItemModule initWithItemUpdater:]([HUServicePlaceholderItemModule alloc], "initWithItemUpdater:", v10);
    servicePlaceholderItemModule = v10->_servicePlaceholderItemModule;
    v10->_servicePlaceholderItemModule = v11;

    -[HUDashboardItemManager context](v10, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hf_currentUserIsRestrictedGuest");

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDashboardItemManager context](v10, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "home");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pinCodeManagerForHome:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
      pinCodeManager = v10->_pinCodeManager;
      v10->_pinCodeManager = (HFPinCodeManager *)v19;

    }
  }

  return v10;
}

- (void)_registerForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUDashboardItemManager;
  -[HFItemManager _registerForExternalUpdates](&v4, sel__registerForExternalUpdates);
  -[HUDashboardItemManager pinCodeManager](self, "pinCodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (id)_buildItemModulesForHome:(id)a3
{
  void *v4;
  HUStatusItemModule *v5;
  void *v6;
  HUStatusItemModule *v7;
  void *v8;
  HUDashboardActionSetItemModule *v9;
  void *v10;
  HUDashboardActionSetItemModule *v11;
  void *v12;
  HUDashboardCameraItemModule *v13;
  void *v14;
  HUDashboardCameraItemModule *v15;
  void *v16;
  void *v17;
  int v18;
  HUBannerItemModule *v19;
  void *v20;
  HUBannerItemModule *v21;
  void *v22;
  HUDashboardTipModule *v23;
  void *v24;
  HUDashboardTipModule *v25;
  void *v26;
  void *v27;
  HUEnergyDashboardItemModule *v28;
  void *v29;
  void *v30;
  HUEnergyDashboardItemModule *v31;
  void *v32;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [HUStatusItemModule alloc];
  -[HUDashboardItemManager context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HUStatusItemModule initWithContext:itemUpdater:](v5, "initWithContext:itemUpdater:", v6, self);
  -[HUDashboardItemManager setStatusItemModule:](self, "setStatusItemModule:", v7);

  -[HUDashboardItemManager statusItemModule](self, "statusItemModule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeAddObject:", v8);

  v9 = [HUDashboardActionSetItemModule alloc];
  -[HUDashboardItemManager context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HUDashboardActionSetItemModule initWithContext:itemUpdater:](v9, "initWithContext:itemUpdater:", v10, self);
  -[HUDashboardItemManager setActionSetItemModule:](self, "setActionSetItemModule:", v11);

  -[HUDashboardItemManager actionSetItemModule](self, "actionSetItemModule");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v12);

  v13 = [HUDashboardCameraItemModule alloc];
  -[HUDashboardItemManager context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HUDashboardCameraItemModule initWithContext:itemUpdater:](v13, "initWithContext:itemUpdater:", v14, self);
  -[HUDashboardItemManager setCameraItemModule:](self, "setCameraItemModule:", v15);

  -[HUDashboardItemManager cameraItemModule](self, "cameraItemModule");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v16);

  if (objc_msgSend(MEMORY[0x1E0D313C8], "isHomeApp"))
  {
    -[HUDashboardItemManager context](self, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "shouldCreateModule:", objc_opt_class());

    if (v18)
    {
      v19 = [HUBannerItemModule alloc];
      -[HUDashboardItemManager context](self, "context");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[HUBannerItemModule initWithContext:itemUpdater:](v19, "initWithContext:itemUpdater:", v20, self);
      -[HUDashboardItemManager setBannerItemModule:](self, "setBannerItemModule:", v21);

      -[HUDashboardItemManager bannerItemModule](self, "bannerItemModule");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v22);

    }
    v23 = [HUDashboardTipModule alloc];
    -[HUDashboardItemManager context](self, "context");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[HUDashboardTipModule initWithContext:itemUpdater:](v23, "initWithContext:itemUpdater:", v24, self);
    -[HUDashboardItemManager setTipItemModule:](self, "setTipItemModule:", v25);

    -[HUDashboardItemManager tipItemModule](self, "tipItemModule");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v26);

  }
  -[HUDashboardItemManager servicePlaceholderItemModule](self, "servicePlaceholderItemModule");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v27);

  v28 = [HUEnergyDashboardItemModule alloc];
  -[HUDashboardItemManager context](self, "context");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[HUEnergyDashboardItemModule initWithItemUpdater:dashboardContext:home:](v28, "initWithItemUpdater:dashboardContext:home:", self, v29, v30);
  -[HUDashboardItemManager setEnergyDashboardItemModule:](self, "setEnergyDashboardItemModule:", v31);

  -[HUDashboardItemManager energyDashboardItemModule](self, "energyDashboardItemModule");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v32);

  return v4;
}

- (void)setTipItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_tipItemModule, a3);
}

- (void)setStatusItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_statusItemModule, a3);
}

- (void)setServicePlaceholderItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_servicePlaceholderItemModule, a3);
}

- (void)setEnergyDashboardItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_energyDashboardItemModule, a3);
}

- (void)setCameraItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_cameraItemModule, a3);
}

- (void)setBannerItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_bannerItemModule, a3);
}

- (void)setActionSetItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetItemModule, a3);
}

- (HUServicePlaceholderItemModule)servicePlaceholderItemModule
{
  return self->_servicePlaceholderItemModule;
}

- (void)_unregisterForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUDashboardItemManager;
  -[HFItemManager _unregisterForExternalUpdates](&v4, sel__unregisterForExternalUpdates);
  -[HUDashboardItemManager pinCodeManager](self, "pinCodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)setHome:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  HUDashboardContext *v10;
  HUDashboardContext *context;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v4 = a3;
  if (v4)
  {
    -[HUDashboardItemManager context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    v8 = v7;
    if (v6 == v7)
    {

    }
    else
    {
      if (v6)
      {
        v9 = objc_msgSend(v6, "isEqual:", v7);

        if ((v9 & 1) != 0)
          goto LABEL_13;
      }
      else
      {

      }
      +[HUDashboardContext homeDashboardForHome:](HUDashboardContext, "homeDashboardForHome:", v8);
      v10 = (HUDashboardContext *)objc_claimAutoreleasedReturnValue();
      context = self->_context;
      self->_context = v10;

      -[HUDashboardItemManager context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "hf_currentUserIsRestrictedGuest");

      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUDashboardItemManager context](self, "context");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "home");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pinCodeManagerForHome:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUDashboardItemManager setPinCodeManager:](self, "setPinCodeManager:", v18);

        -[HUDashboardItemManager pinCodeManager](self, "pinCodeManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObserver:", self);

      }
      else
      {
        -[HUDashboardItemManager pinCodeManager](self, "pinCodeManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeObserver:", self);

        -[HUDashboardItemManager setPinCodeManager:](self, "setPinCodeManager:", 0);
      }
      -[HUDashboardItemManager dashboardDelegate](self, "dashboardDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDashboardItemManager context](self, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dashboardItemManager:didUpdateContext:", self, v8);
    }

  }
LABEL_13:
  v21.receiver = self;
  v21.super_class = (Class)HUDashboardItemManager;
  -[HFItemManager setHome:](&v21, sel_setHome_, v4);

}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  HUDashboardAccessoryTransformItemProvider *v49;
  void *v50;
  void *v51;
  HUDashboardAccessoryTransformItemProvider *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
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
  int v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  id v89;
  id location;
  _QWORD v91[3];

  v91[1] = *MEMORY[0x1E0C80C00];
  v81 = a3;
  -[HUDashboardItemManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0D31708]);
    -[HUDashboardItemManager context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "room");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithHome:room:", v81, v9);
    -[HFItemManager setSourceItem:](self, "setSourceItem:", v10);

  }
  else
  {
    if (!v81)
      goto LABEL_6;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31418]), "initWithHome:", v81);
    -[HFItemManager setSourceItem:](self, "setSourceItem:", v8);
  }

LABEL_6:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  if (_os_feature_enabled_impl())
  {
    if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldShowFakeContentForPerformanceTesting"))
    {
      v12 = objc_alloc_init(MEMORY[0x1E0D313D8]);
      -[HUDashboardItemManager setFakeSpeakersAndTVsItemProvider:](self, "setFakeSpeakersAndTVsItemProvider:", v12);

      -[HUDashboardItemManager fakeSpeakersAndTVsItemProvider](self, "fakeSpeakersAndTVsItemProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v13);

    }
    v14 = objc_alloc(MEMORY[0x1E0D310B8]);
    -[HUDashboardItemManager context](self, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "room");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v16)
    {
      -[HUDashboardItemManager context](self, "context");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "home");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[HUDashboardItemManager context](self, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v14, "initWithAccessoryContainer:inHome:", v17, v19);
    -[HUDashboardItemManager setSpeakersAndTVsItemProvider:](self, "setSpeakersAndTVsItemProvider:", v20);

    if (!v16)
    {

    }
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __53__HUDashboardItemManager__buildItemProvidersForHome___block_invoke;
    v88[3] = &unk_1E6F56010;
    objc_copyWeak(&v89, &location);
    -[HUDashboardItemManager speakersAndTVsItemProvider](self, "speakersAndTVsItemProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFilterBlock:", v88);

    -[HUDashboardItemManager speakersAndTVsItemProvider](self, "speakersAndTVsItemProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v22);

    objc_destroyWeak(&v89);
  }
  v23 = objc_alloc(MEMORY[0x1E0D310B8]);
  -[HUDashboardItemManager context](self, "context");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "room");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
  {
    -[HUDashboardItemManager context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "home");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HUDashboardItemManager context](self, "context");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "home");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v23, "initWithAccessoryContainer:inHome:", v26, v28);
  -[HUDashboardItemManager setFavoritesItemProvider:](self, "setFavoritesItemProvider:", v29);

  if (!v25)
  {

  }
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = __53__HUDashboardItemManager__buildItemProvidersForHome___block_invoke_2;
  v86[3] = &unk_1E6F56010;
  objc_copyWeak(&v87, &location);
  -[HUDashboardItemManager favoritesItemProvider](self, "favoritesItemProvider");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFilterBlock:", v86);

  -[HUDashboardItemManager favoritesItemProvider](self, "favoritesItemProvider");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v31);

  v32 = objc_alloc(MEMORY[0x1E0D310B8]);
  -[HUDashboardItemManager context](self, "context");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "room");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (!v34)
  {
    -[HUDashboardItemManager context](self, "context");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "home");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HUDashboardItemManager context](self, "context");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "home");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v32, "initWithAccessoryContainer:inHome:", v35, v37);
  -[HUDashboardItemManager setAccessoryLikeItemProvider:](self, "setAccessoryLikeItemProvider:", v38);

  if (!v34)
  {

  }
  -[HUDashboardItemManager context](self, "context");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "accessoryLikeItemObjectLevel");
  -[HUDashboardItemManager accessoryLikeItemProvider](self, "accessoryLikeItemProvider");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setObjectLevel:", v40);

  v84[0] = MEMORY[0x1E0C809B0];
  v84[1] = 3221225472;
  v84[2] = __53__HUDashboardItemManager__buildItemProvidersForHome___block_invoke_3;
  v84[3] = &unk_1E6F56010;
  objc_copyWeak(&v85, &location);
  -[HUDashboardItemManager accessoryLikeItemProvider](self, "accessoryLikeItemProvider");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setFilterBlock:", v84);

  -[HUDashboardItemManager context](self, "context");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "accessoryTypeGroup");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[HUDashboardItemManager context](self, "context");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "accessoryTypeGroup");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardItemManager accessoryLikeItemProvider](self, "accessoryLikeItemProvider");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setAccessoryTypeGroups:", v47);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D310C8], "sortedAccessoryTypeGroups");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardItemManager accessoryLikeItemProvider](self, "accessoryLikeItemProvider");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setAccessoryTypeGroups:", v45);
  }

  v49 = [HUDashboardAccessoryTransformItemProvider alloc];
  -[HUDashboardItemManager accessoryLikeItemProvider](self, "accessoryLikeItemProvider");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[HUDashboardAccessoryTransformItemProvider initWithSourceProvider:inHome:](v49, "initWithSourceProvider:inHome:", v50, v51);
  -[HUDashboardItemManager setAccessoryTransformItemProvider:](self, "setAccessoryTransformItemProvider:", v52);

  -[HUDashboardItemManager context](self, "context");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "accessoryGroupingStyle");
  -[HUDashboardItemManager accessoryTransformItemProvider](self, "accessoryTransformItemProvider");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setSplitAccessoryGroupsByRoom:", v54 == 2);

  -[HUDashboardItemManager accessoryTransformItemProvider](self, "accessoryTransformItemProvider");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v56);

  v57 = objc_alloc(MEMORY[0x1E0D31740]);
  -[HUDashboardItemManager context](self, "context");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "home");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v57, "initWithHome:", v59);
  -[HUDashboardItemManager setScheduleRuleItemProvider:](self, "setScheduleRuleItemProvider:", v60);

  -[HUDashboardItemManager scheduleRuleItemProvider](self, "scheduleRuleItemProvider");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v61);

  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D316B0]), "initWithHome:", v81);
  -[HUDashboardItemManager setProgrammableSwitchItemProvider:](self, "setProgrammableSwitchItemProvider:", v62);

  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = __53__HUDashboardItemManager__buildItemProvidersForHome___block_invoke_4;
  v82[3] = &unk_1E6F4DD60;
  objc_copyWeak(&v83, &location);
  -[HUDashboardItemManager programmableSwitchItemProvider](self, "programmableSwitchItemProvider");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setFilter:", v82);

  -[HUDashboardItemManager programmableSwitchItemProvider](self, "programmableSwitchItemProvider");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_safeAddObject:", v64);

  -[HUDashboardItemManager _buildStaticItemsForHome:](self, "_buildStaticItemsForHome:", v81);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v65, "count"))
  {
    -[HUDashboardItemManager context](self, "context");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "home");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "hf_currentUserIsRestrictedGuest");

    v69 = (void *)MEMORY[0x1E0C99E60];
    -[HUDashboardItemManager pinCodeAccessItem](self, "pinCodeAccessItem");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardItemManager homeKeyItem](self, "homeKeyItem");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setWithObjects:", v70, v71, 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31850]), "initWithItems:", v72);
      -[HUDashboardItemManager setNonBlockingItemProvider:](self, "setNonBlockingItemProvider:", v73);

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D308F0]);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDashboardItemManager nonBlockingItemProvider](self, "nonBlockingItemProvider");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "setClientInvalidationReasons:", v74);

      -[HUDashboardItemManager nonBlockingItemProvider](self, "nonBlockingItemProvider");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v76);

    }
    objc_msgSend(v65, "na_setByRemovingObjectsFromSet:", v72);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v77);
    -[HUDashboardItemManager setStaticItemProvider:](self, "setStaticItemProvider:", v78);

    -[HUDashboardItemManager staticItemProvider](self, "staticItemProvider");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_safeAddObject:", v79);

  }
  else
  {
    v77 = v65;
  }

  objc_destroyWeak(&v83);
  objc_destroyWeak(&v85);
  objc_destroyWeak(&v87);
  objc_destroyWeak(&location);

  return v11;
}

- (HFAccessoryLikeItemProvider)accessoryLikeItemProvider
{
  return self->_accessoryLikeItemProvider;
}

- (void)setProgrammableSwitchItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_programmableSwitchItemProvider, a3);
}

- (void)setFavoritesItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_favoritesItemProvider, a3);
}

- (void)setAccessoryTransformItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryTransformItemProvider, a3);
}

- (void)setAccessoryLikeItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryLikeItemProvider, a3);
}

- (id)_buildStaticItemsForHome:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31[2];
  _QWORD v32[4];
  id v33;
  id v34[2];
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id location[2];

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v7 = objc_alloc(MEMORY[0x1E0D31840]);
  v8 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke;
  v37[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v38, location);
  v9 = (void *)objc_msgSend(v7, "initWithResultsBlock:", v37);
  -[HUDashboardItemManager setAccessoryNoAccessItem:](self, "setAccessoryNoAccessItem:", v9);

  -[HUDashboardItemManager accessoryNoAccessItem](self, "accessoryNoAccessItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v10);

  v11 = objc_alloc(MEMORY[0x1E0D31840]);
  v35[0] = v8;
  v35[1] = 3221225472;
  v35[2] = __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_2;
  v35[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v36, location);
  v12 = (void *)objc_msgSend(v11, "initWithResultsBlock:", v35);
  -[HUDashboardItemManager setAlwaysAllowedScheduleItem:](self, "setAlwaysAllowedScheduleItem:", v12);

  -[HUDashboardItemManager alwaysAllowedScheduleItem](self, "alwaysAllowedScheduleItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v13);

  v14 = objc_alloc(MEMORY[0x1E0D31840]);
  v32[0] = v8;
  v32[1] = 3221225472;
  v32[2] = __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_3;
  v32[3] = &unk_1E6F55FC0;
  objc_copyWeak(v34, location);
  v34[1] = (id)a2;
  v15 = v5;
  v33 = v15;
  v16 = (void *)objc_msgSend(v14, "initWithResultsBlock:", v32);
  -[HUDashboardItemManager setPinCodeAccessItem:](self, "setPinCodeAccessItem:", v16);

  -[HUDashboardItemManager pinCodeAccessItem](self, "pinCodeAccessItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v17);

  v18 = objc_alloc(MEMORY[0x1E0D31840]);
  v29[0] = v8;
  v29[1] = 3221225472;
  v29[2] = __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_236;
  v29[3] = &unk_1E6F55FC0;
  objc_copyWeak(v31, location);
  v31[1] = (id)a2;
  v19 = v15;
  v30 = v19;
  v20 = (void *)objc_msgSend(v18, "initWithResultsBlock:", v29);
  -[HUDashboardItemManager setHomeKeyItem:](self, "setHomeKeyItem:", v20);

  -[HUDashboardItemManager homeKeyItem](self, "homeKeyItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v21);

  v22 = objc_alloc(MEMORY[0x1E0D31840]);
  v27[0] = v8;
  v27[1] = 3221225472;
  v27[2] = __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_248;
  v27[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v28, location);
  v23 = (void *)objc_msgSend(v22, "initWithResultsBlock:", v27);
  -[HUDashboardItemManager setContactOwnerItem:](self, "setContactOwnerItem:", v23);

  -[HUDashboardItemManager contactOwnerItem](self, "contactOwnerItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v24);

  v25 = (void *)objc_msgSend(v6, "copy");
  objc_destroyWeak(&v28);

  objc_destroyWeak(v31);
  objc_destroyWeak(v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(location);

  return v25;
}

- (HUDashboardItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithContext_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUDashboardItemManager.m"), 100, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUDashboardItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

uint64_t __42__HUDashboardItemManager_isEmptyDashboard__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isSensorAccessory");
}

- (id)itemModuleForSectionIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("scenesSection")))
  {
    -[HUDashboardItemManager actionSetItemModule](self, "actionSetItemModule");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("camerasSection")))
  {
    -[HUDashboardItemManager cameraItemModule](self, "cameraItemModule");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("statusSection")))
  {
    -[HUDashboardItemManager statusItemModule](self, "statusItemModule");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("tipsSection")))
    {
      v6 = 0;
      goto LABEL_10;
    }
    -[HUDashboardItemManager tipItemModule](self, "tipItemModule");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_10:

  return v6;
}

- (id)buildItemForHomeKitObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF347348))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HUDashboardItemManager accessoryLikeItemProvider](self, "accessoryLikeItemProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "buildItemForAccessoryRepresentable:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_itemSectionForRoom:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;

  HUDashboardRoomSectionIdentifierForRoom(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length")
    && (v5 = -[HFItemManager sectionIndexForDisplayedSectionIdentifier:](self, "sectionIndexForDisplayedSectionIdentifier:", v4), v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    -[HFItemManager itemSectionForSectionIndex:](self, "itemSectionForSectionIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)updateItemSectionHeaderTitleForRoom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  HUDashboardItemManager *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  -[HUDashboardItemManager _itemSectionForRoom:](self, "_itemSectionForRoom:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "headerTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        objc_msgSend(v4, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v20 = self;
        v21 = 2080;
        v22 = "-[HUDashboardItemManager updateItemSectionHeaderTitleForRoom:]";
        v23 = 2112;
        v24 = v13;
        v14 = "(%@ %s) Not updating room name %@ since it's the same.";
LABEL_10:
        _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, v14, buf, 0x20u);

      }
    }
    else
    {
      if (v12)
      {
        objc_msgSend(v7, "headerTitle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v20 = self;
        v21 = 2080;
        v22 = "-[HUDashboardItemManager updateItemSectionHeaderTitleForRoom:]";
        v23 = 2112;
        v24 = v15;
        v25 = 2112;
        v26 = v16;
        v27 = 2112;
        v28 = v4;
        _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "(%@ %s) Updating room name from \"%@\" to %@ for room %@", buf, 0x34u);

      }
      objc_msgSend(v4, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHeaderTitle:", v17);

      v18 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
      v11 = objc_claimAutoreleasedReturnValue();
      -[HFItemManager reloadUIRepresentationForSections:withAnimation:](self, "reloadUIRepresentationForSections:withAnimation:", v11, 0);
    }
  }
  else
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v20 = self;
      v21 = 2080;
      v22 = "-[HUDashboardItemManager updateItemSectionHeaderTitleForRoom:]";
      v23 = 2112;
      v24 = v13;
      v14 = "(%@ %s) roomItemSection is nil for room %@";
      goto LABEL_10;
    }
  }

}

- (unint64_t)getHomeButtonBadgeCount
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[5];
  id v11;
  id location;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "incomingHomeInvitations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v16 = v6;
  objc_initWeak(&location, self);
  -[HUDashboardItemManager homeMenuStatusItems](self, "homeMenuStatusItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__HUDashboardItemManager_getHomeButtonBadgeCount__block_invoke;
  v10[3] = &unk_1E6F55ED8;
  objc_copyWeak(&v11, &location);
  v10[4] = &v13;
  objc_msgSend(v7, "na_each:", v10);

  v8 = v14[3];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v13, 8);
  return v8;
}

void __49__HUDashboardItemManager_getHomeButtonBadgeCount__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E30]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hf_shouldBlockCurrentRestrictedGuestFromHome");

  if ((v9 & 1) == 0)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v6, "count");

}

- (id)matchingItemForHomeKitObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v4, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_setWithSafeObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v5;
    v10 = &unk_1EF347348;
    if (objc_msgSend(v9, "conformsToProtocol:", v10))
      v11 = v9;
    else
      v11 = 0;
    v12 = v11;

    v13 = MEMORY[0x1E0C809B0];
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0D310C0], "accessoryLikeObjectsForAccessoryRepresentable:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v13;
      v22[1] = 3221225472;
      v22[2] = __55__HUDashboardItemManager_matchingItemForHomeKitObject___block_invoke;
      v22[3] = &unk_1E6F55F50;
      v23 = v8;
      objc_msgSend(v14, "na_each:", v22);

    }
    -[HFItemManager allDisplayedItems](self, "allDisplayedItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __55__HUDashboardItemManager_matchingItemForHomeKitObject___block_invoke_4;
    v19[3] = &unk_1E6F4EEA8;
    v20 = v9;
    v21 = v8;
    v16 = v8;
    objc_msgSend(v15, "na_firstObjectPassingTest:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __55__HUDashboardItemManager_matchingItemForHomeKitObject___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "homeKitObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  objc_msgSend(v4, "services");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__HUDashboardItemManager_matchingItemForHomeKitObject___block_invoke_2;
  v12[3] = &unk_1E6F55F00;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v7, "na_each:", v12);

  objc_msgSend(v4, "profiles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __55__HUDashboardItemManager_matchingItemForHomeKitObject___block_invoke_3;
  v10[3] = &unk_1E6F55F28;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v9, "na_each:", v10);

}

void __55__HUDashboardItemManager_matchingItemForHomeKitObject___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __55__HUDashboardItemManager_matchingItemForHomeKitObject___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __55__HUDashboardItemManager_matchingItemForHomeKitObject___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2544A8))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v3;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF2AC0A8))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v5, "homeKitObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    || (objc_msgSend(v8, "accessoryRepresentableObject"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "hf_homeKitObject"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9))
  {
    if ((objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0
      || (objc_msgSend(v9, "uniqueIdentifier"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v11, "isEqual:", v12),
          v12,
          v11,
          (v13 & 1) != 0))
    {
      v14 = 1;
    }
    else
    {
      v15 = *(void **)(a1 + 40);
      objc_msgSend(v9, "uniqueIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v15, "containsObject:", v16);

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(WeakRetained, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hf_currentUserIsRestrictedGuest") & 1) != 0)
  {
    objc_msgSend(WeakRetained, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hf_isCurrentUserInRestrictedGuestAllowedPeriod");

    if ((v7 & 1) == 0)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUDashboardSection_Accessories_NoAccess_OutOfSchedule_Title"), CFSTR("HUDashboardSection_Accessories_NoAccess_OutOfSchedule_Title"), 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("HUDashboardSection_Accessories_NoAccess_OutOfSchedule_Description");
      goto LABEL_7;
    }
  }
  else
  {

  }
  objc_msgSend(WeakRetained, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hf_isCurrentRestrictedGuestAwayFromHome");

  if (!v12)
  {
    v8 = 0;
    v13 = 0;
    goto LABEL_9;
  }
  _HULocalizedStringWithDefaultValue(CFSTR("HUDashboardSection_Accessories_NoAccess_AwayFromHome_Title"), CFSTR("HUDashboardSection_Accessories_NoAccess_AwayFromHome_Title"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("HUDashboardSection_Accessories_NoAccess_AwayFromHome_Description");
LABEL_7:
  _HULocalizedStringWithDefaultValue(v9, v9, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30D18]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30BF8]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30C90]);
  objc_msgSend(WeakRetained, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hf_shouldBlockCurrentRestrictedGuestFromHome");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16 ^ 1u);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30D70]);

  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D30B78]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

id __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D31758], "localizedStringFromScheduleType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30D18]);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithSystemImageNamed:", CFSTR("calendar.badge.clock"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30C60]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30C38]);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInt:", objc_msgSend(v7, "hf_currentUserIsRestrictedGuest") ^ 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30D70]);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D30B78]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_currentUserIsRestrictedGuest");

  if ((v5 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "pinCodeManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentUserPinCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_226;
    v15[3] = &unk_1E6F55F78;
    v8 = *(_QWORD *)(a1 + 48);
    v15[4] = WeakRetained;
    v17 = v8;
    v16 = *(id *)(a1 + 32);
    objc_msgSend(v7, "flatMap:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recover:", &__block_literal_global_235);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = WeakRetained;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@: %@ Current user is not a restricted guest. Hiding personal code item.", buf, 0x16u);

    }
    v13 = (void *)MEMORY[0x1E0D519C0];
    v18 = *MEMORY[0x1E0D30D70];
    v19 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "futureWithResult:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

id __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_226(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[3];
  _QWORD v26[5];
  _QWORD v27[5];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    HFLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v4;
      v30 = 2112;
      v31 = v5;
      _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@: %@ Found matching PIN code for user.", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "hf_accessoriesSupportingAccessCodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "home");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "hf_currentUserIsRestrictedGuest"))
      {
        objc_msgSend(*(id *)(a1 + 32), "home");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "hasOnboardedForAccessCode") ^ 1;

      }
      else
      {
        v10 = 1;
      }

    }
    else
    {
      v10 = 1;
    }

  }
  else
  {
    v10 = 1;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithSystemImageNamed:", CFSTR("number"));
  v12 = (void *)MEMORY[0x1E0D519C0];
  v26[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUDashboardSection_GuestAccess_PersonalCode"), CFSTR("HUDashboardSection_GuestAccess_PersonalCode"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0D30C38];
  v27[0] = v13;
  v27[1] = MEMORY[0x1E0C9AAB0];
  v15 = *MEMORY[0x1E0D30D70];
  v26[1] = v14;
  v26[2] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0D30C60];
  v27[2] = v16;
  v27[3] = v11;
  v18 = *MEMORY[0x1E0D30B78];
  v26[3] = v17;
  v26[4] = v18;
  v19 = (void *)MEMORY[0x1E0C99E60];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "futureWithResult:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

id __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_233(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[HUDashboardItemManager _buildStaticItemsForHome:]_block_invoke";
    v12 = 2112;
    v13 = v2;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "(%s) Failed to get access codes for current user. Error = %@. Hiding 'Personal Code' item.", buf, 0x16u);
  }

  v4 = (void *)MEMORY[0x1E0D519C0];
  v8 = *MEMORY[0x1E0D30D70];
  v9 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_236(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char v6;
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
  uint64_t v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  _BOOL4 v36;
  int v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  _BYTE v53[26];
  __int16 v54;
  int v55;
  __int16 v56;
  void *v57;
  uint64_t v58;
  _QWORD v59[3];

  v59[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)objc_opt_new();
  objc_msgSend(WeakRetained, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hf_currentUserIsRestrictedGuest");

  if ((v6 & 1) != 0)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUDashboardSection_GuestAccess_HomeKey"), CFSTR("HUDashboardSection_GuestAccess_HomeKey"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30D18]);

    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30C38]);
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(WeakRetained, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithInt:", objc_msgSend(v10, "hf_currentUserIsRestrictedGuest") ^ 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = *MEMORY[0x1E0D30D70];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11);

    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithSystemImageNamed:", CFSTR("apple.homekey"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30C60]);
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "na_safeAddObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "hf_walletKeyAccessories");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v13, "na_safeAddObjectsFromArray:", v15);

    v16 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "na_safeSetObject:forKey:", v16, *MEMORY[0x1E0D30B80]);

    objc_msgSend(WeakRetained, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "home");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "currentUser");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = v14;
    v20 = objc_msgSend(v14, "count");
    objc_msgSend(*(id *)(a1 + 32), "currentUser");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "isEqual:", v21) ^ 1;
    if (v19)
      v23 = v22;
    else
      v23 = 1;

    v24 = objc_msgSend(MEMORY[0x1E0D319D0], "isAnIPhone") ^ 1;
    if ((v23 & 1) != 0
      || (v24 & 1) != 0
      || !v20
      || (objc_msgSend(*(id *)(a1 + 32), "hasOnboardedForWalletKey") & 1) == 0)
    {
      if (v23)
      {
        HFLogForCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v19, "hf_prettyDescription");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "currentUser");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "hf_prettyDescription");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v51 = "-[HUDashboardItemManager _buildStaticItemsForHome:]_block_invoke";
          v52 = 1024;
          *(_DWORD *)v53 = 1;
          *(_WORD *)&v53[4] = 2112;
          *(_QWORD *)&v53[6] = v43;
          *(_WORD *)&v53[14] = 2112;
          *(_QWORD *)&v53[16] = v41;
          _os_log_impl(&dword_1B8E1E000, v33, OS_LOG_TYPE_DEFAULT, "(%s) Hiding homeKeyItem | shouldHideForUser: %{BOOL}d | user = %@ | home.currentUser = %@", buf, 0x26u);

        }
      }
      HFLogForCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v44 = v19;
        v35 = v13;
        v36 = v20 != 0;
        v37 = objc_msgSend(*(id *)(a1 + 32), "hasOnboardedForWalletKey");
        objc_msgSend(MEMORY[0x1E0CBA1A8], "hf_minimumDescriptionsOfAccessories:", v46);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413826;
        v51 = (const char *)WeakRetained;
        v52 = 2080;
        *(_QWORD *)v53 = "-[HUDashboardItemManager _buildStaticItemsForHome:]_block_invoke";
        *(_WORD *)&v53[8] = 1024;
        *(_DWORD *)&v53[10] = v23;
        *(_WORD *)&v53[14] = 1024;
        *(_DWORD *)&v53[16] = v24;
        *(_WORD *)&v53[20] = 1024;
        *(_DWORD *)&v53[22] = v36;
        v13 = v35;
        v19 = v44;
        v54 = 1024;
        v55 = v37;
        v56 = 2112;
        v57 = v38;
        _os_log_impl(&dword_1B8E1E000, v34, OS_LOG_TYPE_DEFAULT, "(%@: %s) Hiding homeKeyItem | shouldHideForUser: %{BOOL}d | shouldHideForDevice: %{BOOL}d, hasWalletKeyAccessories: %{BOOL}d | home.hasOnboardedForWalletKey: %{BOOL}d | walletKeyAccessories: %@", buf, 0x38u);

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "na_safeSetObject:forKey:", v39, v45);

      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(WeakRetained, "home");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "hf_fetchWalletKeyDeviceStateForCurrentDeviceIfNecessary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_243;
      v47[3] = &unk_1E6F55FE8;
      v48 = v3;
      v49 = *(id *)(a1 + 32);
      objc_msgSend(v26, "flatMap:", v47);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    HFLogForCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "context");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "home");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v51 = (const char *)WeakRetained;
      v52 = 2112;
      *(_QWORD *)v53 = v29;
      *(_WORD *)&v53[8] = 2112;
      *(_QWORD *)&v53[10] = v31;
      _os_log_impl(&dword_1B8E1E000, v28, OS_LOG_TYPE_DEFAULT, "%@: %@ Current user is not a restricted guest. Hiding home key item for home %@.", buf, 0x20u);

    }
    v32 = (void *)MEMORY[0x1E0D519C0];
    v58 = *MEMORY[0x1E0D30D70];
    v59[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, &v58, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "futureWithResult:", v12);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v27;
}

id __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_243(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "canAddWalletKeyErrorCode") == 8)
  {
    HFLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[HUDashboardItemManager _buildStaticItemsForHome:]_block_invoke";
      _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "(%s) Hiding \"Home Key\" button because current device has Wallet app deleted", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "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");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_244;
    v7[3] = &unk_1E6F54A58;
    v8 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v5, "flatMap:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

id __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_244(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "BOOLValue"))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_hasWalletKey");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_2_245;
    v7[3] = &unk_1E6F4CD58;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v3, "flatMap:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[HUDashboardItemManager _buildStaticItemsForHome:]_block_invoke";
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "(%s) Hiding 'Home Key' button because current device is NOT wallet key compatible.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 40));
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

id __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_2_245(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "-[HUDashboardItemManager _buildStaticItemsForHome:]_block_invoke_2";
    v10 = 1024;
    v11 = objc_msgSend(v3, "BOOLValue") ^ 1;
    v12 = 1024;
    v13 = objc_msgSend(v3, "BOOLValue");
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) For homeKeyItem, hidden = %{BOOL}d because hasWalletKey = %{BOOL}d", (uint8_t *)&v8, 0x18u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "BOOLValue") ^ 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30D70]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __51__HUDashboardItemManager__buildStaticItemsForHome___block_invoke_248(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(WeakRetained, "_homeOwnerName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
    goto LABEL_3;
  objc_msgSend(WeakRetained, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "owner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "isEqualToString:", v7);

  if (!v8)
  {
    HULocalizedStringWithFormat(CFSTR("HURestrictedGuestAccess_ContactOwner_WithName_Button_Title"), CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v3);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_3:
    _HULocalizedStringWithDefaultValue(CFSTR("HURestrictedGuestAccess_ContactOwner_Button_Title"), CFSTR("HURestrictedGuestAccess_ContactOwner_Button_Title"), 1);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30C38]);
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithInt:", objc_msgSend(v19, "hf_currentUserIsRestrictedGuest") ^ 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D30D70]);

  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D30B78]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

uint64_t __53__HUDashboardItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "shouldHideAccessoryRepresentable:", v3) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31130], "mediaAccessoryTypeGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hf_accessoryType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "containsType:", v8);

  }
  return v6;
}

uint64_t __53__HUDashboardItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  char v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldHideHomeKitObject:", v3);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_opt_class();
    v8 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_programmableSwitchServiceTypes");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "serviceType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v11, "containsObject:", v12);

    }
    else
    {
      objc_opt_class();
      v11 = v8;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v11;
      else
        v13 = 0;
      v7 = v13;

      if (v7)
        v7 = objc_msgSend((id)v7, "hf_isPureProgrammableSwitch") ^ 1;
      else
        v11 = 0;
    }

  }
  return v7;
}

uint64_t __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke_275(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  int v7;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2AC0A8))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldHideInRoomSectionForAccessoryRepresentableItem:", v5);

  return v7 ^ 1u;
}

uint64_t __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke_2_280(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];

  v6 = a2;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", CFSTR("favoritesSection"));

  if ((v8 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __59__HUDashboardItemManager__buildSectionsWithDisplayedItems___block_invoke_3;
    v12[3] = &unk_1E6F4DAD8;
    v12[4] = *(_QWORD *)(a1 + 32);
    v9 = objc_msgSend(v10, "na_any:", v12);

    if ((_DWORD)v9)
      *a4 = 1;
  }

  return v9;
}

- (id)_buildNowPlayingSectionWithItems:(id)a3 forRouteIdentifier:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
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
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, void *);
  void *v38;
  id v39;
  void *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0D31570];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithIdentifier:", CFSTR("NowPlayingSection"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUDashboardNowPlayingSectionTitle"), CFSTR("HUDashboardNowPlayingSectionTitle"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHeaderTitle:", v10);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardItemManager fakeSpeakersAndTVsItemProvider](self, "fakeSpeakersAndTVsItemProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    -[HUDashboardItemManager fakeSpeakersAndTVsItemProvider](self, "fakeSpeakersAndTVsItemProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "items");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v17);

  }
  -[HUDashboardItemManager speakersAndTVsItemProvider](self, "speakersAndTVsItemProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "items");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    -[HUDashboardItemManager speakersAndTVsItemProvider](self, "speakersAndTVsItemProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "items");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __78__HUDashboardItemManager__buildNowPlayingSectionWithItems_forRouteIdentifier___block_invoke;
    v38 = &unk_1E6F560D0;
    v39 = v6;
    objc_msgSend(v23, "na_firstObjectPassingTest:", &v35);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "na_safeAddObject:", v24, v35, v36, v37, v38);
  }
  -[HUDashboardItemManager context](self, "context");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "maximumNumberOfItemsInSectionWithIdentifier:", CFSTR("SpeakersAndTVsSection"));

  if (v26 < 2)
  {
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
      v27 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v27 = 0;
    }
  }
  else
  {
    v27 = v11;
    -[HUDashboardItemManager context](self, "context");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "room");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
      objc_msgSend(v9, "setHeaderTitle:", 0);
  }
  objc_msgSend(v9, "setItems:", v27);
  v31 = (void *)MEMORY[0x1E0D314B0];
  v40 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "filterSections:toDisplayedItems:", v32, v8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

uint64_t __78__HUDashboardItemManager__buildNowPlayingSectionWithItems_forRouteIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));
  return v8;
}

- (id)_buildSingleAccessoryGroupSectionWithItems:(id)a3 allDisplayedItems:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0D31570];
  v8 = a4;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithIdentifier:", CFSTR("AllAccessoriesSection"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUDashboardSection_Accessories_Title"), CFSTR("HUDashboardSection_Accessories_Title"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHeaderTitle:", v10);

  -[HUDashboardItemManager accessoryNoAccessItem](self, "accessoryNoAccessItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "containsObject:", v11);

  if (v12)
  {
    -[HUDashboardItemManager accessoryNoAccessItem](self, "accessoryNoAccessItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setItems:", v14);
  }
  else
  {
    objc_msgSend(v6, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingComparator:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setItems:", v15);

  }
  return v9;
}

- (id)_buildAccessoryCategorySectionsWithItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  HUDashboardItemManager *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__17;
  v31 = __Block_byref_object_dispose__17;
  v32 = 0;
  objc_msgSend(MEMORY[0x1E0D310C8], "sortedAccessoryTypeGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __67__HUDashboardItemManager__buildAccessoryCategorySectionsWithItems___block_invoke;
  v24[3] = &unk_1E6F56120;
  v24[4] = self;
  v7 = v5;
  v25 = v7;
  v26 = &v27;
  objc_msgSend(v6, "na_map:", v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 138412802;
      v34 = self;
      v35 = 2048;
      v36 = v10;
      v37 = 2112;
      v38 = v7;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@ Found %lu item(s) without an identified category: %@", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0D31130], "otherAccessoryTypeGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardItemManager reorderableServiceListForType:](self, "reorderableServiceListForType:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortedHomeKitItemComparator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = _Block_copy(v13);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = _Block_copy(v16);

    }
    objc_msgSend(v7, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sortedArrayUsingComparator:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v28[5], "setItems:", v18);

  }
  -[HUDashboardItemManager context](self, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "shouldHideEmptySections");

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v8, v4);
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = v8;
  }
  v22 = v21;

  _Block_object_dispose(&v27, 8);
  return v22;
}

id __67__HUDashboardItemManager__buildAccessoryCategorySectionsWithItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  _QWORD v23[4];
  id v24;

  v3 = a2;
  HUDashboardAccessoryCategorySectionIdentifierForAccessoryTypeGroup(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldHideSectionWithIdentifier:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", v4);
    objc_msgSend(v3, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHeaderTitle:", v9);

    v10 = *(void **)(a1 + 40);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __67__HUDashboardItemManager__buildAccessoryCategorySectionsWithItems___block_invoke_2;
    v23[3] = &unk_1E6F560D0;
    v11 = v3;
    v24 = v11;
    objc_msgSend(v10, "na_filter:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "reorderableServiceListForType:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedHomeKitItemComparator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = _Block_copy(v14);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = _Block_copy(v17);

    }
    objc_msgSend(v12, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sortedArrayUsingComparator:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setItems:", v19);

    objc_msgSend(*(id *)(a1 + 40), "minusSet:", v12);
    objc_msgSend(MEMORY[0x1E0D31130], "otherAccessoryTypeGroup");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v11, "isEqual:", v20);

    if (v21)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v8);
    v7 = v8;

  }
  return v7;
}

uint64_t __67__HUDashboardItemManager__buildAccessoryCategorySectionsWithItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "accessoryRepresentableObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_accessoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "containsType:", v4);

  return v5;
}

- (id)reorderableServiceListForRoom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUDashboardItemManager clientReorderableServiceListByRoom](self, "clientReorderableServiceListByRoom");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[HUDashboardItemManager setClientReorderableServiceListByRoom:](self, "setClientReorderableServiceListByRoom:", v8);

  }
  -[HUDashboardItemManager clientReorderableServiceListByRoom](self, "clientReorderableServiceListByRoom");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HUDashboardItemManager clientReorderableServiceListByRoom](self, "clientReorderableServiceListByRoom");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "hf_reorderableServicesList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)setReorderableServiceList:(id)a3 forRoom:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  objc_msgSend(a4, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HUDashboardItemManager clientReorderableServiceListByRoom](self, "clientReorderableServiceListByRoom");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v9);

}

- (id)reorderableServiceListForType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUDashboardItemManager clientReorderableServiceByTypeList](self, "clientReorderableServiceByTypeList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[HUDashboardItemManager setClientReorderableServiceByTypeList:](self, "setClientReorderableServiceByTypeList:", v7);

  }
  -[HUDashboardItemManager clientReorderableServiceByTypeList](self, "clientReorderableServiceByTypeList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HUDashboardItemManager clientReorderableServiceByTypeList](self, "clientReorderableServiceByTypeList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFItemManager sourceItem](self, "sourceItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "latestResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30CC8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)setReorderableServiceList:(id)a3 forType:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  objc_msgSend(a4, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HUDashboardItemManager clientReorderableServiceByTypeList](self, "clientReorderableServiceByTypeList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v9);

}

- (void)_updateHomeDashboardWithHome:(id)a3
{
  HUDashboardContext *v5;
  HUDashboardContext *context;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  +[HUDashboardContext homeDashboardForHome:](HUDashboardContext, "homeDashboardForHome:", a3);
  v5 = (HUDashboardContext *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  self->_context = v5;

  -[HUDashboardItemManager dashboardDelegate](self, "dashboardDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardItemManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dashboardItemManager:didUpdateContext:", self, v8);

  -[HFItemManager recalculateVisibilityAndSortAllItems](self, "recalculateVisibilityAndSortAllItems");
  -[HUDashboardItemManager accessoryLikeItemProvider](self, "accessoryLikeItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardItemManager accessoryTransformItemProvider](self, "accessoryTransformItemProvider", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  -[HUDashboardItemManager staticItemProvider](self, "staticItemProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HFItemManager reloadAndUpdateItemsForProviders:senderSelector:](self, "reloadAndUpdateItemsForProviders:senderSelector:", v12, a2);

}

- (id)_homeOwnerName
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v14[16];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isInternalTest"))
  {
    HFLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_INFO, "Skipping home owner name lookup as this is an internal unit test", v14, 2u);
    }
    v4 = 0;
  }
  else
  {
    -[HUDashboardItemManager context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home");
    v3 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31998]), "initWithHome:", v3);
    objc_msgSend(v6, "setStyle:", 1);
    -[NSObject owner](v3, "owner");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject hf_handleForUser:](v3, "hf_handleForUser:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
    {
      objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 1000);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D31320], "defaultStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contactForUserHandle:withKeys:", v8, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v12, 1000);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v6, "stringForObjectValue:", v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v4;
}

- (HFScheduleRuleItemProvider)scheduleRuleItemProvider
{
  return self->_scheduleRuleItemProvider;
}

- (void)setScheduleRuleItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleRuleItemProvider, a3);
}

- (HFStaticItem)accessoryNoAccessItem
{
  return self->_accessoryNoAccessItem;
}

- (void)setAccessoryNoAccessItem:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryNoAccessItem, a3);
}

- (HFStaticItem)alwaysAllowedScheduleItem
{
  return self->_alwaysAllowedScheduleItem;
}

- (void)setAlwaysAllowedScheduleItem:(id)a3
{
  objc_storeStrong((id *)&self->_alwaysAllowedScheduleItem, a3);
}

- (HFStaticItem)pinCodeAccessItem
{
  return self->_pinCodeAccessItem;
}

- (void)setPinCodeAccessItem:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeAccessItem, a3);
}

- (HFStaticItem)homeKeyItem
{
  return self->_homeKeyItem;
}

- (void)setHomeKeyItem:(id)a3
{
  objc_storeStrong((id *)&self->_homeKeyItem, a3);
}

- (HFStaticItem)contactOwnerItem
{
  return self->_contactOwnerItem;
}

- (void)setContactOwnerItem:(id)a3
{
  objc_storeStrong((id *)&self->_contactOwnerItem, a3);
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeManager, a3);
}

- (HFStaticNonBlockingItemProvider)nonBlockingItemProvider
{
  return self->_nonBlockingItemProvider;
}

- (void)setNonBlockingItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_nonBlockingItemProvider, a3);
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_staticItemProvider, a3);
}

- (HFAccessoryLikeItemProvider)speakersAndTVsItemProvider
{
  return self->_speakersAndTVsItemProvider;
}

- (void)setSpeakersAndTVsItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_speakersAndTVsItemProvider, a3);
}

- (HFFakeMediaAccessoryItemProvider)fakeSpeakersAndTVsItemProvider
{
  return self->_fakeSpeakersAndTVsItemProvider;
}

- (void)setFakeSpeakersAndTVsItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_fakeSpeakersAndTVsItemProvider, a3);
}

- (NSMutableDictionary)clientReorderableServiceListByRoom
{
  return self->_clientReorderableServiceListByRoom;
}

- (void)setClientReorderableServiceListByRoom:(id)a3
{
  objc_storeStrong((id *)&self->_clientReorderableServiceListByRoom, a3);
}

- (NSMutableDictionary)clientReorderableServiceByTypeList
{
  return self->_clientReorderableServiceByTypeList;
}

- (void)setClientReorderableServiceByTypeList:(id)a3
{
  objc_storeStrong((id *)&self->_clientReorderableServiceByTypeList, a3);
}

- (void)setClientReorderableFavoritesList:(id)a3
{
  objc_storeStrong((id *)&self->_clientReorderableFavoritesList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientReorderableFavoritesList, 0);
  objc_storeStrong((id *)&self->_clientReorderableServiceByTypeList, 0);
  objc_storeStrong((id *)&self->_clientReorderableServiceListByRoom, 0);
  objc_storeStrong((id *)&self->_energyDashboardItemModule, 0);
  objc_storeStrong((id *)&self->_servicePlaceholderItemModule, 0);
  objc_storeStrong((id *)&self->_fakeSpeakersAndTVsItemProvider, 0);
  objc_storeStrong((id *)&self->_speakersAndTVsItemProvider, 0);
  objc_storeStrong((id *)&self->_favoritesItemProvider, 0);
  objc_storeStrong((id *)&self->_programmableSwitchItemProvider, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_nonBlockingItemProvider, 0);
  objc_storeStrong((id *)&self->_accessoryTransformItemProvider, 0);
  objc_storeStrong((id *)&self->_accessoryLikeItemProvider, 0);
  objc_storeStrong((id *)&self->_bannerItemModule, 0);
  objc_storeStrong((id *)&self->_tipItemModule, 0);
  objc_storeStrong((id *)&self->_cameraItemModule, 0);
  objc_storeStrong((id *)&self->_actionSetItemModule, 0);
  objc_storeStrong((id *)&self->_statusItemModule, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_storeStrong((id *)&self->_contactOwnerItem, 0);
  objc_storeStrong((id *)&self->_homeKeyItem, 0);
  objc_storeStrong((id *)&self->_pinCodeAccessItem, 0);
  objc_storeStrong((id *)&self->_alwaysAllowedScheduleItem, 0);
  objc_storeStrong((id *)&self->_accessoryNoAccessItem, 0);
  objc_storeStrong((id *)&self->_scheduleRuleItemProvider, 0);
  objc_destroyWeak((id *)&self->_dashboardDelegate);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)home:(id)a3 didAddRoom:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUDashboardItemManager;
  -[HFItemManager home:didAddRoom:](&v5, sel_home_didAddRoom_, a3, a4);
  -[HFItemManager recalculateVisibilityAndSortAllItems](self, "recalculateVisibilityAndSortAllItems");
}

- (void)home:(id)a3 didRemoveRoom:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUDashboardItemManager;
  -[HFItemManager home:didRemoveRoom:](&v5, sel_home_didRemoveRoom_, a3, a4);
  -[HFItemManager recalculateVisibilityAndSortAllItems](self, "recalculateVisibilityAndSortAllItems");
}

- (void)homeDidUpdateApplicationData:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUDashboardItemManager;
  -[HFItemManager homeDidUpdateApplicationData:](&v9, sel_homeDidUpdateApplicationData_, a3);
  -[HFItemManager recalculateVisibilityAndSortAllItems](self, "recalculateVisibilityAndSortAllItems");
  -[HUDashboardItemManager actionSetItemModule](self, "actionSetItemModule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFItemManager reloadAndUpdateItemsForProviders:senderSelector:](self, "reloadAndUpdateItemsForProviders:senderSelector:", v7, a2);

}

- (void)homeDidUpdateAccessControlForCurrentUser:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  objc_super v13;
  uint8_t buf[4];
  HUDashboardItemManager *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUDashboardItemManager;
  -[HFItemManager homeDidUpdateAccessControlForCurrentUser:](&v13, sel_homeDidUpdateAccessControlForCurrentUser_, v5);
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v15 = self;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Access control for current user did update for home: %@.", buf, 0x20u);

  }
  -[HUDashboardItemManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  v11 = v10;
  if (v9 == v10)
  {

  }
  else
  {
    if (!v9)
    {

      goto LABEL_12;
    }
    v12 = objc_msgSend(v9, "isEqual:", v10);

    if ((v12 & 1) == 0)
      goto LABEL_12;
  }
  if ((objc_msgSend(v11, "hf_shouldBlockCurrentUserFromHomeForRoarUpgrade") & 1) != 0
    || objc_msgSend(v11, "hf_currentUserIsRestrictedGuest"))
  {
    -[HUDashboardItemManager _updateHomeDashboardWithHome:](self, "_updateHomeDashboardWithHome:", v11);
  }
LABEL_12:

}

- (void)homeDidUpdateHomeLocationStatus:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  int v14;
  HUDashboardItemManager *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeLocationStatus");
    HMStringFromHomeLocation();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138413058;
    v15 = self;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v5;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Home location status did update for home: %@. homeLocationStatus = %@", (uint8_t *)&v14, 0x2Au);

  }
  -[HUDashboardItemManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "home");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  v12 = v11;
  if (v10 == v11)
  {

  }
  else
  {
    if (!v10)
    {

      goto LABEL_11;
    }
    v13 = objc_msgSend(v10, "isEqual:", v11);

    if ((v13 & 1) == 0)
      goto LABEL_11;
  }
  if (objc_msgSend(v12, "hf_currentUserIsRestrictedGuest"))
    -[HUDashboardItemManager _updateHomeDashboardWithHome:](self, "_updateHomeDashboardWithHome:", v12);
LABEL_11:

}

- (void)restrictedGuestAllowedPeriodStarted:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  HUDashboardItemManager *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412802;
    v18 = self;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Restricted Guest allowed period started for user: %@.", (uint8_t *)&v17, 0x20u);

  }
  -[HUDashboardItemManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentUser");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  v12 = v11;
  if (v10 == v11)
  {

  }
  else
  {
    if (!v10)
    {

      goto LABEL_11;
    }
    v13 = objc_msgSend(v10, "isEqual:", v11);

    if ((v13 & 1) == 0)
      goto LABEL_12;
  }
  -[HUDashboardItemManager context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hf_currentUserIsRestrictedGuest");

  if (v16)
  {
    -[HUDashboardItemManager context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardItemManager _updateHomeDashboardWithHome:](self, "_updateHomeDashboardWithHome:", v9);
LABEL_11:

  }
LABEL_12:

}

- (void)restrictedGuestAllowedPeriodEnded:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  HUDashboardItemManager *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412802;
    v18 = self;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Restricted Guest allowed period ended for user: %@.", (uint8_t *)&v17, 0x20u);

  }
  -[HUDashboardItemManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentUser");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  v12 = v11;
  if (v10 == v11)
  {

  }
  else
  {
    if (!v10)
    {

      goto LABEL_11;
    }
    v13 = objc_msgSend(v10, "isEqual:", v11);

    if ((v13 & 1) == 0)
      goto LABEL_12;
  }
  -[HUDashboardItemManager context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hf_currentUserIsRestrictedGuest");

  if (v16)
  {
    -[HUDashboardItemManager context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardItemManager _updateHomeDashboardWithHome:](self, "_updateHomeDashboardWithHome:", v9);
LABEL_11:

  }
LABEL_12:

}

- (void)pinCodeManagerDidUpdate:(id)a3 pinCodes:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint8_t buf[4];
  HUDashboardItemManager *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Reloading PIN Code related items...", buf, 0x16u);

  }
  -[HUDashboardItemManager nonBlockingItemProvider](self, "nonBlockingItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HUDashboardItemManager nonBlockingItemProvider](self, "nonBlockingItemProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HFItemManager reloadAndUpdateItemsForProviders:senderSelector:](self, "reloadAndUpdateItemsForProviders:senderSelector:", v10, a2);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[HUDashboardItemManager setEnergyDashboardItemModule:](self, "setEnergyDashboardItemModule:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HUDashboardItemManager;
  -[HFItemManager dealloc](&v3, sel_dealloc);
}

@end
