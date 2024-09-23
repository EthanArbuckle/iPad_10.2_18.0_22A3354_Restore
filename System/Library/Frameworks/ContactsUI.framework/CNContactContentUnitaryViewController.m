@implementation CNContactContentUnitaryViewController

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;

  objc_msgSend(a3, "rowHeight");
  return result;
}

- (id)indexPathOfPropertyItem:(id)a3 editing:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  objc_msgSend(v6, "group");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    -[CNContactContentUnitaryViewController editingContactView](self, "editingContactView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CNContactContentUnitaryViewController sectionOfGroup:inTableView:](self, "sectionOfGroup:inTableView:", v7, v8);
    objc_msgSend(v7, "editingItems");
  }
  else
  {
    -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CNContactContentUnitaryViewController sectionOfGroup:inTableView:](self, "sectionOfGroup:inTableView:", v7, v8);
    objc_msgSend(v7, "displayItems");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexOfObject:", v6);

  v12 = 0;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL && v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  double v10;
  double v11;

  v6 = a3;
  v7 = objc_msgSend(a4, "section");
  -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNContactContentUnitaryViewController sectionOfGroup:inTableView:](self, "sectionOfGroup:inTableView:", v8, v6);

  if (v7 == v9)
  {
    v10 = 150.0;
  }
  else
  {
    objc_msgSend(v6, "estimatedRowHeight");
    v10 = v11;
  }

  return v10;
}

- (CNCardGroup)cardActionsGroup
{
  return self->_cardActionsGroup;
}

- (int64_t)sectionOfGroup:(id)a3 inTableView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  -[CNContactContentUnitaryViewController _currentGroupsForTableView:](self, "_currentGroupsForTableView:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8)
  {
    v11 = objc_msgSend(v8, "indexOfObject:", v6);
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      v10 = -[CNContactContentUnitaryViewController tableViewSectionIndexFromGroupIndex:forTableView:](self, "tableViewSectionIndexFromGroupIndex:forTableView:", v11, v7);
  }

  return v10;
}

- (unint64_t)tableViewSectionIndexFromGroupIndex:(unint64_t)a3 forTableView:(id)a4
{
  return -[CNContactContentUnitaryViewController additionalTopSectionsCountForTableView:](self, "additionalTopSectionsCountForTableView:", a4)+ a3;
}

- (BOOL)isSharedProfileBannerSectionForTableView:(id)a3 section:(int64_t)a4
{
  BOOL result;

  result = -[CNContactContentUnitaryViewController hasSharedProfileBannerSectionForTableView:](self, "hasSharedProfileBannerSectionForTableView:", a3);
  if (a4)
    return 0;
  return result;
}

- (BOOL)isPersonHeaderSectionForTableView:(id)a3 section:(int64_t)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (-[CNContactContentUnitaryViewController hasPersonHeaderSectionForTableView:](self, "hasPersonHeaderSectionForTableView:", v6))
  {
    if (-[CNContactContentUnitaryViewController hasSharedProfileBannerSectionForTableView:](self, "hasSharedProfileBannerSectionForTableView:", v6))
    {
      v7 = a4 == 1;
    }
    else
    {
      v7 = a4 == 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_cardGroupAtTableViewSectionIndex:(int64_t)a3 forTableView:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = -[CNContactContentUnitaryViewController groupIndexFromTableViewSectionIndex:forTableView:](self, "groupIndexFromTableViewSectionIndex:forTableView:", a3, v6);
  -[CNContactContentUnitaryViewController _currentGroupsForTableView:](self, "_currentGroupsForTableView:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") <= v7)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_currentGroupsForTableView:(id)a3
{
  if (self->_editingContactView == a3)
    -[CNContactContentUnitaryViewController editingGroups](self, "editingGroups");
  else
    -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)displayGroups
{
  return self->_displayGroups;
}

- (unint64_t)groupIndexFromTableViewSectionIndex:(unint64_t)a3 forTableView:(id)a4
{
  return a3
       - -[CNContactContentUnitaryViewController additionalTopSectionsCountForTableView:](self, "additionalTopSectionsCountForTableView:", a4);
}

- (int64_t)additionalTopSectionsCountForTableView:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  v5 = -[CNContactContentUnitaryViewController hasSharedProfileBannerSectionForTableView:](self, "hasSharedProfileBannerSectionForTableView:", v4);
  LODWORD(self) = -[CNContactContentUnitaryViewController hasPersonHeaderSectionForTableView:](self, "hasPersonHeaderSectionForTableView:", v4);

  return self + (unint64_t)v5;
}

- (BOOL)hasPersonHeaderSectionForTableView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;

  v4 = a3;
  -[CNContactContentUnitaryViewController personHeaderViewController](self, "personHeaderViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v6 == v4;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)personHeaderViewController
{
  return self->_personHeaderViewController;
}

- (BOOL)hasSharedProfileBannerSectionForTableView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  BOOL v9;
  unint64_t v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFeatureEnabled:", 15);

  if (v7
    && -[CNContactContentUnitaryViewController shouldShowSharedProfileBanner](self, "shouldShowSharedProfileBanner")
    && (-[CNContactContentUnitaryViewController displayContactView](self, "displayContactView"),
        v8 = (id)objc_claimAutoreleasedReturnValue(),
        v8,
        v8 == v4)
    && !-[CNContactContentUnitaryViewController dismissedSharedProfileBannerAction](self, "dismissedSharedProfileBannerAction"))
  {
    v11 = -[CNContactContentUnitaryViewController bannerActionTypeForEffectiveState](self, "bannerActionTypeForEffectiveState");
    v9 = (v11 | -[CNContactContentUnitaryViewController tappedSharedProfileBannerAction](self, "tappedSharedProfileBannerAction")) != 0;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)shouldShowSharedProfileBanner
{
  return self->_shouldShowSharedProfileBanner;
}

- (BOOL)isOrientationPhoneLandscape
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = -[CNContactContentUnitaryViewController interfaceOrientation](self, "interfaceOrientation") - 3;
  if (v4)
    v6 = 1;
  else
    v6 = v5 >= 2;
  return !v6;
}

- (id)applyContactStyle
{
  void *v3;
  uint64_t v4;
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
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  CNContactHeaderEditView *editingHeaderView;
  void *v40;
  void *v41;
  CNContactHeaderDisplayView *displayHeaderView;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  _QWORD v79[2];
  _QWORD v80[3];

  v80[2] = *MEMORY[0x1E0C80C00];
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CAGradientLayer setColors:](self->_contactViewBackgroundGradientLayer, "setColors:", 0);
    -[UIView setBackgroundColor:](self->_contactViewBackgroundView, "setBackgroundColor:", 0);
  }
  if (-[CNContactContentUnitaryViewController shouldSetBackgroundColorToMatchHeader](self, "shouldSetBackgroundColorToMatchHeader"))
  {
    -[CNContactContentUnitaryViewController setContactViewBackgroundToMatchHeader](self, "setContactViewBackgroundToMatchHeader");
    goto LABEL_10;
  }
  if (-[CNContactContentUnitaryViewController forcesTransparentBackground](self, "forcesTransparentBackground"))
  {
    +[CNUIColorRepository transparentBackgroundColor](CNUIColorRepository, "transparentBackgroundColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "backgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_10;
    objc_msgSend(v3, "backgroundColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

LABEL_10:
  objc_msgSend(v3, "sectionBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSectionBackgroundColor:", v8);

  objc_msgSend(v3, "separatorColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSeparatorColor:", v10);

  objc_msgSend(v3, "selectedCellBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSelectedCellBackgroundColor:", v12);

  v14 = (void *)MEMORY[0x1E0C99E08];
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueTextAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryWithDictionary:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *MEMORY[0x1E0DC1140];
  v79[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(v3, "textColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = CFSTR("ABNotesTextColorAttributeName");
  v80[0] = v19;
  objc_msgSend(v3, "notesTextColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addEntriesFromDictionary:", v21);

  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setValueTextAttributes:", v17);

  if (-[CNContactContentUnitaryViewController forcesTransparentBackground](self, "forcesTransparentBackground"))
  {
    +[CNUIColorRepository transparentBackgroundColor](CNUIColorRepository, "transparentBackgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderDisplayView setBackgroundColor:](self->_displayHeaderView, "setBackgroundColor:", v23);

    +[CNUIColorRepository transparentBackgroundColor](CNUIColorRepository, "transparentBackgroundColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderEditView setBackgroundColor:](self->_editingHeaderView, "setBackgroundColor:", v24);

    +[CNUIColorRepository transparentBackgroundColor](CNUIColorRepository, "transparentBackgroundColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_editingFloatingCollapsedHeaderView, "setBackgroundColor:", v25);

    +[CNUIColorRepository transparentBackgroundColor](CNUIColorRepository, "transparentBackgroundColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNContactContentUnitaryViewController environment](self, "environment");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "runningInContactsAppOniPad");

    if (v28)
    {
      +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor](CNUIColorRepository, "contactCardBackgroundiPadOverwriteColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactHeaderDisplayView setBackgroundColor:](self->_displayHeaderView, "setBackgroundColor:", v29);

      +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor](CNUIColorRepository, "contactCardBackgroundiPadOverwriteColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactHeaderEditView setBackgroundColor:](self->_editingHeaderView, "setBackgroundColor:", v30);

      +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor](CNUIColorRepository, "contactCardBackgroundiPadOverwriteColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_editingFloatingCollapsedHeaderView, "setBackgroundColor:", v31);

      +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor](CNUIColorRepository, "contactCardBackgroundiPadOverwriteColor");
    }
    else
    {
      objc_msgSend(v3, "contactHeaderBackgroundColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactHeaderDisplayView setBackgroundColor:](self->_displayHeaderView, "setBackgroundColor:", v32);

      objc_msgSend(v3, "contactHeaderBackgroundColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactHeaderEditView setBackgroundColor:](self->_editingHeaderView, "setBackgroundColor:", v33);

      objc_msgSend(v3, "contactHeaderBackgroundColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_editingFloatingCollapsedHeaderView, "setBackgroundColor:", v34);

      objc_msgSend(v3, "contactHeaderBackgroundColor");
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CNContactActionsContainerView setBackgroundColor:](self->_actionsWrapperView, "setBackgroundColor:", v26);

  v35 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  v36 = -[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader");
  if (!v36 || !v35)
  {
    if (!v36)
      goto LABEL_22;
    goto LABEL_21;
  }
  if (-[CNContactContentUnitaryViewController isOrientationPhoneLandscape](self, "isOrientationPhoneLandscape"))
  {
LABEL_21:
    +[CNUIColorRepository transparentBackgroundColor](CNUIColorRepository, "transparentBackgroundColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactActionsContainerView setBackgroundColor:](self->_actionsWrapperView, "setBackgroundColor:", v37);

    +[CNUIColorRepository transparentBackgroundColor](CNUIColorRepository, "transparentBackgroundColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactActionsContainerView setBackgroundColor:](self->_floatingActionsWrapperView, "setBackgroundColor:", v38);

  }
LABEL_22:
  editingHeaderView = self->_editingHeaderView;
  v77 = v18;
  objc_msgSend(v3, "textColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](editingHeaderView, "cn_updateDictionaryForKey:withChanges:", CFSTR("nameTextAttributes"), v41);

  displayHeaderView = self->_displayHeaderView;
  v75 = v18;
  objc_msgSend(v3, "taglineTextColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](displayHeaderView, "cn_updateDictionaryForKey:withChanges:", CFSTR("taglineTextAttributes"), v44);

  if (((!-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader") | v35) & 1) != 0)
  {
    -[CNContactContentUnitaryViewController actionsViewController](self, "actionsViewController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setViewStyle:", objc_msgSend(v3, "topActionsViewStyle"));
  }
  else
  {
    -[CNContactContentUnitaryViewController floatingActionsViewController](self, "floatingActionsViewController");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setViewStyle:", 10);

    -[CNContactContentUnitaryViewController floatingActionsViewController](self, "floatingActionsViewController");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "actionsView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setEnableVisualEffectViewCaptureView:", 0);

    -[CNContactContentUnitaryViewController actionsViewController](self, "actionsViewController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setViewStyle:", 10);

    +[CNUIColorRepository contactCardStaticHeaderDefaultTintColor](CNUIColorRepository, "contactCardStaticHeaderDefaultTintColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactInlineActionsViewController setPosterTintColor:](self->_actionsViewController, "setPosterTintColor:", v45);
    -[CNContactInlineActionsViewController setPosterTintColor:](self->_floatingActionsViewController, "setPosterTintColor:", v45);
  }

  v50 = objc_msgSend(v3, "usesOpaqueBackground");
  -[CNContactContentUnitaryViewController actionsViewController](self, "actionsViewController");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "layer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v53;
  if (v50)
  {
    objc_msgSend(v53, "setShadowRadius:", 8.0);

    -[CNContactContentUnitaryViewController actionsViewController](self, "actionsViewController");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "view");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "layer");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setShadowOffset:", 0.0, 2.0);

    -[CNContactContentUnitaryViewController actionsViewController](self, "actionsViewController");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "view");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "layer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v62) = 1025758986;
    objc_msgSend(v61, "setShadowOpacity:", v62);

    if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
    {
      -[CNContactContentUnitaryViewController floatingActionsViewController](self, "floatingActionsViewController");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "view");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "layer");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setShadowRadius:", 8.0);

      -[CNContactContentUnitaryViewController floatingActionsViewController](self, "floatingActionsViewController");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "view");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "layer");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setShadowOffset:", 0.0, 2.0);

      -[CNContactContentUnitaryViewController floatingActionsViewController](self, "floatingActionsViewController");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "view");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "layer");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v71;
      LODWORD(v73) = 1025758986;
LABEL_30:
      objc_msgSend(v71, "setShadowOpacity:", v73);

    }
  }
  else
  {
    LODWORD(v54) = 0;
    objc_msgSend(v53, "setShadowOpacity:", v54);

    if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
    {
      -[CNContactContentUnitaryViewController floatingActionsViewController](self, "floatingActionsViewController");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "view");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "layer");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v71;
      LODWORD(v73) = 0;
      goto LABEL_30;
    }
  }

  return v3;
}

- (CNContactInlineActionsViewController)floatingActionsViewController
{
  return self->_floatingActionsViewController;
}

- (CNContactInlineActionsViewController)actionsViewController
{
  return self->_actionsViewController;
}

- (id)contactHeaderView
{
  void *v3;

  if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
  {
    -[CNContactContentUnitaryViewController editingHeaderView](self, "editingHeaderView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
      -[CNContactContentUnitaryViewController staticDisplayHeaderView](self, "staticDisplayHeaderView");
    else
      -[CNContactContentUnitaryViewController displayHeaderView](self, "displayHeaderView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)shouldUseStaticHeader
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFeatureEnabled:", 16);

  return v4;
}

- (CNContactHeaderStaticDisplayView)staticDisplayHeaderView
{
  CNContactHeaderStaticDisplayView *staticDisplayHeaderView;
  _BOOL8 v4;
  void *v5;
  CNContactHeaderStaticDisplayView *v6;
  CNContactHeaderStaticDisplayView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  staticDisplayHeaderView = self->_staticDisplayHeaderView;
  if (!staticDisplayHeaderView)
  {
    v4 = -[CNContactContentUnitaryViewController isHeaderViewPhotoProhibited](self, "isHeaderViewPhotoProhibited");
    -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContactHeaderStaticDisplayView contactHeaderViewWithContact:showingNavBar:monogramOnly:delegate:](CNContactHeaderStaticDisplayView, "contactHeaderViewWithContact:showingNavBar:monogramOnly:delegate:", v5, -[CNContactContentUnitaryViewController layoutPositionallyAfterNavBar](self, "layoutPositionallyAfterNavBar"), v4, self);
    v6 = (CNContactHeaderStaticDisplayView *)objc_claimAutoreleasedReturnValue();
    v7 = self->_staticDisplayHeaderView;
    self->_staticDisplayHeaderView = v6;

    -[CNContactContentUnitaryViewController actionsWrapperView](self, "actionsWrapperView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView setActionsWrapperView:](self->_staticDisplayHeaderView, "setActionsWrapperView:", v8);

    -[CNContactHeaderView setAlwaysShowsMonogram:](self->_staticDisplayHeaderView, "setAlwaysShowsMonogram:", 1);
    -[CNContactContentUnitaryViewController contactFormatter](self, "contactFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView setContactFormatter:](self->_staticDisplayHeaderView, "setContactFormatter:", v9);

    -[CNContactContentUnitaryViewController alternateName](self, "alternateName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView setAlternateName:](self->_staticDisplayHeaderView, "setAlternateName:", v10);

    -[CNContactContentUnitaryViewController message](self, "message");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView setMessage:](self->_staticDisplayHeaderView, "setMessage:", v11);

    -[CNContactContentUnitaryViewController importantMessage](self, "importantMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderStaticDisplayView setImportantMessage:](self->_staticDisplayHeaderView, "setImportantMessage:", v12);

    -[CNContactContentUnitaryViewController presentingDelegate](self, "presentingDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView setPresenterDelegate:](self->_staticDisplayHeaderView, "setPresenterDelegate:", v13);

    -[CNContactHeaderStaticDisplayView setTranslatesAutoresizingMaskIntoConstraints:](self->_staticDisplayHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNContactHeaderStaticDisplayView setAllowsPickerActions:](self->_staticDisplayHeaderView, "setAllowsPickerActions:", -[CNContactContentUnitaryViewController allowsDisplayModePickerActions](self, "allowsDisplayModePickerActions"));
    v14 = -[CNContactContentUnitaryViewController applyContactStyle](self, "applyContactStyle");
    staticDisplayHeaderView = self->_staticDisplayHeaderView;
  }
  return staticDisplayHeaderView;
}

- (BOOL)forcesTransparentBackground
{
  return self->_forcesTransparentBackground;
}

- (BOOL)shouldSetBackgroundColorToMatchHeader
{
  uint64_t v3;
  void *v4;
  int v5;

  if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader")
    && -[CNContactContentUnitaryViewController isOrientationPhoneLandscape](self, "isOrientationPhoneLandscape"))
  {
    v3 = *MEMORY[0x1E0D137F8];
    -[CNContactContentUnitaryViewController headerViewBackgroundColors](self, "headerViewBackgroundColors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (((*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4) & 1) != 0)
      LOBYTE(v5) = 0;
    else
      v5 = -[CNContactContentUnitaryViewController isEditing](self, "isEditing") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)layoutPositionallyAfterNavBar
{
  return self->_layoutPositionallyAfterNavBar;
}

- (id)alternateName
{
  return self->_alternateName;
}

- (id)message
{
  return self->_message;
}

- (id)importantMessage
{
  return self->_importantMessage;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  CNContactView *v6;
  void *v7;
  void *v8;
  int isKindOfClass;
  int v10;
  char v11;
  void *v12;
  int v13;
  CNContactView *editingContactView;
  double v15;
  BOOL v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;

  v6 = (CNContactView *)a3;
  -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", a4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v10 = objc_opt_isKindOfClass();
  objc_opt_class();
  v11 = objc_opt_isKindOfClass();
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "usesInsetPlatterStyle");

  editingContactView = self->_editingContactView;
  v15 = 0.0;
  if (!v13 || (editingContactView != v6 ? (v16 = (v13 & (isKindOfClass | v10)) == 0) : (v16 = 0), !v16))
  {
    if (editingContactView == v6)
    {
      if (v8)
        goto LABEL_18;
      if ((v11 & 1) != 0
        && (-[CNContactContentUnitaryViewController nameEditingGroups](self, "nameEditingGroups"),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            v27 = objc_msgSend(v26, "containsObject:", v7),
            v26,
            v27))
      {
        if (!a4)
        {
          v28 = *MEMORY[0x1E0D13848];
          -[CNContactContentViewController warningMessage](self, "warningMessage");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v28) = (*(uint64_t (**)(uint64_t, void *))(v28 + 16))(v28, v29);

          if ((_DWORD)v28)
            v15 = 0.0;
          else
            v15 = *MEMORY[0x1E0DC53D8];
        }
      }
      else
      {
        v15 = 44.0;
      }
    }
    else
    {
      if (v8)
      {
        if ((isKindOfClass & 1) != 0)
        {
          -[CNContactContentUnitaryViewController contact](self, "contact");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "mainStoreLinkedContacts");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");

          if (v19 >= 2)
            goto LABEL_18;
        }
        if ((v10 & 1) != 0)
        {
          -[CNContactContentUnitaryViewController cardGroupMembershipGroup](self, "cardGroupMembershipGroup");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "parentGroups");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count");

          if (!v22)
          {
            v15 = 55.0;
            goto LABEL_27;
          }
LABEL_18:
          objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "_scaledValueForValue:", 44.0);
          v15 = v25 + 15.0;

          goto LABEL_27;
        }
      }
      -[CNContactContentUnitaryViewController cardShareLocationGroup](self, "cardShareLocationGroup");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 == v23)
      {
        v15 = 55.0;
      }
      else if (((a4 != 1) & objc_msgSend(v7, "addSpacerFromPreviousGroup")) != 0)
      {
        v15 = 55.0;
      }
      else
      {
        v15 = 0.0;
      }
    }
  }
LABEL_27:

  return v15;
}

- (id)_cellForIndexPath:(id)a3 forTableView:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  _BOOL8 v32;
  id v33;
  void *v34;
  void *v35;
  int v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  void *v71;
  void *v72;

  v7 = a3;
  v8 = a4;
  -[CNContactContentUnitaryViewController _itemAtIndexPath:forTableView:](self, "_itemAtIndexPath:forTableView:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController _cellIdentifierForTableView:indexPath:](self, "_cellIdentifierForTableView:indexPath:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController noteCell](self, "noteCell");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_4;
  v12 = (void *)v11;
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_class();
  objc_msgSend(v14, "cellIdentifierForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v10, "isEqualToString:", v15);

  if (v16)
  {
    -[CNContactContentUnitaryViewController noteCell](self, "noteCell");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController setNoteCell:](self, "setNoteCell:", 0);
  }
  else
  {
LABEL_4:
    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dequeueReusableCellWithIdentifier:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactContentUnitaryViewController.m"), 6002, CFSTR("We couldn’t create a cell with identifier: %@ indexPath: %@"), v10, v7);

  }
  v72 = v10;
  if (-[CNContactContentUnitaryViewController mode](self, "mode") == 5)
  {
    objc_opt_class();
    v19 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;

    if (v21)
    {
      -[CNContactContentUnitaryViewController highlightedProperties](self, "highlightedProperties");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "count"))
      {
        -[CNContactContentUnitaryViewController highlightedProperties](self, "highlightedProperties");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "contactProperty");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "containsObject:", v24);

        if (v25 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v17, "setForceSuggested:", 1);
      }
      else
      {

      }
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v17, "setDelegate:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v17, "setShouldShowTransportButtons:", objc_msgSend((id)objc_opt_class(), "enablesTransportButtons"));
  objc_msgSend(v17, "setCardGroupItem:", v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CNContactContentUnitaryViewController presentingDelegate](self, "presentingDelegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPresentingDelegate:", v26);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (v27 == v8)
    {
      -[CNContactContentUnitaryViewController contactView](self, "contactView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_opt_class();
      objc_msgSend(v29, "cellIdentifierForClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v72, "isEqualToString:", v30);

      if (v31)
      {
        if (-[CNContactContentUnitaryViewController allowsEditing](self, "allowsEditing"))
          v32 = -[CNContactContentUnitaryViewController editRequiresAuthorization](self, "editRequiresAuthorization") ^ 1;
        else
          v32 = 0;
        goto LABEL_31;
      }
    }
    else
    {

    }
    v32 = -[CNContactContentUnitaryViewController allowsEditing](self, "allowsEditing");
LABEL_31:
    objc_msgSend(v17, "setAllowsEditing:", v32);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v17, "setAllowsActions:", -[CNContactContentUnitaryViewController allowsActions](self, "allowsActions"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v33 = v17;
    objc_msgSend(v33, "setVIP:", -[CNContactContentUnitaryViewController isMailVIP](self, "isMailVIP"));

  }
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "featureFlags");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isFeatureEnabled:", 11);

  if (v36 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v37 = v17;
    objc_opt_class();
    v38 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v39 = v38;
    else
      v39 = 0;
    v40 = v39;

    -[CNContactContentUnitaryViewController cachedVerifiedHandles](self, "cachedVerifiedHandles");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      -[CNContactContentUnitaryViewController cachedVerifiedHandles](self, "cachedVerifiedHandles");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "displayValue");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setStaticIdentityVerified:", objc_msgSend(v42, "containsObject:", v43));

    }
    else
    {
      objc_msgSend(v37, "setStaticIdentityVerified:", 0);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v44 = v17;
    -[CNContactContentUnitaryViewController emergencyNumberIdentifier](self, "emergencyNumberIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "propertyItem");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "contactProperty");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "identifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setEmergencyPhoneNumber:", objc_msgSend(v45, "isEqualToString:", v48));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v49 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v50 = v49;
    else
      v50 = 0;
    v51 = v50;

    objc_opt_class();
    v52 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v53 = v52;
    else
      v53 = 0;
    v54 = v53;

    -[CNContactContentUnitaryViewController setMenuProviderForCell:forActionGroupItem:](self, "setMenuProviderForCell:forActionGroupItem:", v54, v51);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v55 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v56 = v55;
    else
      v56 = 0;
    v57 = v56;

    objc_msgSend(v57, "setShowsGameCenterLabel:", objc_msgSend(v7, "row") == 0);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v58 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v59 = v58;
    else
      v59 = 0;
    v60 = v59;

    -[CNContactContentUnitaryViewController sharedProfileStateOracle](self, "sharedProfileStateOracle");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setSharedProfileStateOracle:", v61);

    objc_opt_class();
    v62 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v63 = v62;
    else
      v63 = 0;
    v64 = v63;

    -[CNContactContentUnitaryViewController sharedProfileStateOracle](self, "sharedProfileStateOracle");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setSharedProfileStateOracle:", v65);

    objc_msgSend(v64, "setActionDelegate:", self);
    objc_msgSend(v64, "setAllowsEditing:", -[CNContactContentUnitaryViewController allowsEditing](self, "allowsEditing"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v66 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v67 = v66;
    else
      v67 = 0;
    v68 = v67;

    -[CNContactContentUnitaryViewController mutableContactForHeaderView](self, "mutableContactForHeaderView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setMeContact:", v69);

  }
  return v17;
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 != 4)
    return 0;
  -[CNContactContentUnitaryViewController contactView](self, "contactView", v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)allowsEditing
{
  if (self->_allowsEditing)
    return !-[CNContactContentUnitaryViewController isContactProviderDataSource](self, "isContactProviderDataSource");
  else
    return 0;
}

- (int64_t)mode
{
  return self->_mode;
}

- (CNPropertyNoteCell)noteCell
{
  return self->_noteCell;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  void *v24;

  v7 = a3;
  v8 = a4;
  if (-[CNContactContentUnitaryViewController isPersonHeaderIndexPath:forTableView:](self, "isPersonHeaderIndexPath:forTableView:", v8, v7))
  {
    -[CNContactContentUnitaryViewController personHeaderCellForTableView:](self, "personHeaderCellForTableView:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = (void *)v9;
    goto LABEL_21;
  }
  if (-[CNContactContentUnitaryViewController isSharedProfileBannerSectionIndexPath:forTableView:](self, "isSharedProfileBannerSectionIndexPath:forTableView:", v8, v7))
  {
    -[CNContactContentUnitaryViewController sharedProfileBannerSectionCellForTableView:](self, "sharedProfileBannerSectionCellForTableView:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", objc_msgSend(v8, "section"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactContentUnitaryViewController _indexPathIsActionItem:forTableView:](self, "_indexPathIsActionItem:forTableView:", v8, v7)|| -[CNContactContentUnitaryViewController isStandardGroup:](self, "isStandardGroup:", v11))
  {
    -[CNContactContentUnitaryViewController _cellForIndexPath:forTableView:](self, "_cellForIndexPath:forTableView:", v8, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  -[CNContactContentUnitaryViewController _updateLabelWidthForCell:](self, "_updateLabelWidthForCell:", v10);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[CNContactContentUnitaryViewController prepareCell:](self, "prepareCell:", v10);
  -[CNContactContentUnitaryViewController cardGameCenterActionGroup](self, "cardGameCenterActionGroup");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqual:", v12))
    goto LABEL_19;
  -[CNContactContentUnitaryViewController gameCenterManager](self, "gameCenterManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasSentInvite");

  if (v14)
  {
    objc_opt_class();
    v15 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v12 = v16;

    if (v12)
    {
      objc_msgSend(v12, "labelTextAttributes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0DC1140]);

      objc_msgSend(v12, "setLabelTextAttributes:", v18);
    }
LABEL_19:

  }
LABEL_21:
  -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20 == v7)
  {
    -[CNContactContentUnitaryViewController environment](self, "environment");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "runningInContactsAppOniPad");

    if (!v22)
      goto LABEL_25;
    +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor](CNUIColorRepository, "contactCardBackgroundiPadOverwriteColor");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v20);
  }

LABEL_25:
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactContentUnitaryViewController.m"), 3964, CFSTR("We have no cell to return!"));

  }
  return v10;
}

- (BOOL)isPersonHeaderIndexPath:(id)a3 forTableView:(id)a4
{
  id v6;

  v6 = a4;
  LOBYTE(a3) = -[CNContactContentUnitaryViewController isPersonHeaderSectionForTableView:section:](self, "isPersonHeaderSectionForTableView:section:", v6, objc_msgSend(a3, "section"));

  return (char)a3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  CNContactView *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (CNContactView *)a3;
  if (-[CNContactContentUnitaryViewController isSharedProfileBannerSectionForTableView:section:](self, "isSharedProfileBannerSectionForTableView:section:", v6, a4)|| -[CNContactContentUnitaryViewController isPersonHeaderSectionForTableView:section:](self, "isPersonHeaderSectionForTableView:section:", v6, a4))
  {
    v7 = 1;
  }
  else
  {
    -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", a4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CNContactContentUnitaryViewController isStandardGroup:](self, "isStandardGroup:", v8))
    {
      if (self->_editingContactView == v6)
        objc_msgSend(v8, "editingItems");
      else
        objc_msgSend(v8, "displayItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "actionItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    v7 = objc_msgSend(v9, "count");

  }
  return v7;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;

  v6 = a3;
  -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", a4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v6)
  {

LABEL_4:
    -[CNContactContentUnitaryViewController editingContactView](self, "editingContactView");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 != v6)
    {
LABEL_5:
      isKindOfClass = 0;
      goto LABEL_27;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CNContactContentUnitaryViewController nameEditingGroups](self, "nameEditingGroups");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "indexOfObject:", v7);
      -[CNContactContentUnitaryViewController nameEditingGroups](self, "nameEditingGroups");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = v14 == objc_msgSend(v15, "count") - 1;

      goto LABEL_27;
    }
    goto LABEL_26;
  }
  -[CNContactContentUnitaryViewController environment](self, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "runningInContactsAppOniPad");

  if ((v10 & 1) != 0)
    goto LABEL_4;
  -[CNContactContentUnitaryViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentUnitaryViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentUnitaryViewController cardBlockContactGroup](self, "cardBlockContactGroup");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v7 == (void *)v18)
  {

    goto LABEL_26;
  }
  v19 = (void *)v18;
  -[CNContactContentUnitaryViewController cardShareLocationGroup](self, "cardShareLocationGroup");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v21 = v7 == v17;
  else
    v21 = 0;
  v22 = !v21;
  isKindOfClass = 1;
  if (v7 != v20 && v22)
  {
    if (v16 && objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
    {
      -[CNContactContentUnitaryViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "actionItems");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "count"))
      {
        -[CNContactContentUnitaryViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "addSpacerFromPreviousGroup");

        if (!v26)
          goto LABEL_5;
      }
      else
      {

      }
    }
    if ((objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        goto LABEL_27;
      }
    }
LABEL_26:
    isKindOfClass = 1;
  }
LABEL_27:

  return isKindOfClass & 1;
}

- (CNCardGroup)cardMedicalIDGroup
{
  return self->_cardMedicalIDGroup;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  char isKindOfClass;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  unint64_t v19;
  id v20;
  void *v21;
  unint64_t v22;
  id v23;
  void *v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;

  v6 = a3;
  -[CNContactContentUnitaryViewController editingContactView](self, "editingContactView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
  {
    -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
    v8 = objc_claimAutoreleasedReturnValue();
    if ((id)v8 != v6)
    {
      v9 = (id)v8;
      isKindOfClass = 0;
LABEL_24:

      goto LABEL_25;
    }
    -[CNContactContentUnitaryViewController environment](self, "environment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "runningInContactsAppOniPad");

    if (!v12)
    {
      isKindOfClass = 0;
      goto LABEL_25;
    }
    -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", a4, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v14 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    objc_opt_class();
    v17 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

    objc_opt_class();
    v20 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    objc_opt_class();
    v23 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;
    v25 = v24;

    objc_opt_class();
    v9 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v9;
    else
      v26 = 0;
    v27 = v26;

    if (!v16)
    {
      if (v19 | v22)
      {
        isKindOfClass = 0;
        goto LABEL_23;
      }
      if (!(v25 | v27))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          goto LABEL_23;
        }
      }
    }
    isKindOfClass = 1;
LABEL_23:

    goto LABEL_24;
  }
  isKindOfClass = 1;
LABEL_25:

  return isKindOfClass & 1;
}

- (id)contactView
{
  if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
    -[CNContactContentUnitaryViewController editingContactView](self, "editingContactView");
  else
    -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CNContactView)displayContactView
{
  CNContactView *displayContactView;
  CNContactView *v4;
  uint64_t v5;
  void *v6;
  CNContactView *v7;
  CNContactView *v8;
  void *v9;

  displayContactView = self->_displayContactView;
  if (!displayContactView)
  {
    v4 = [CNContactView alloc];
    v5 = objc_msgSend((id)objc_opt_class(), "tableViewStyle");
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CNContactView initWithFrame:style:contact:](v4, "initWithFrame:style:contact:", v5, v6, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v8 = self->_displayContactView;
    self->_displayContactView = v7;

    -[CNContactView setTranslatesAutoresizingMaskIntoConstraints:](self->_displayContactView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNContactView setDataSource:](self->_displayContactView, "setDataSource:", self);
    -[CNContactView setDelegate:](self->_displayContactView, "setDelegate:", self);
    -[CNContactView _setHeaderAndFooterViewsFloat:](self->_displayContactView, "_setHeaderAndFooterViewsFloat:", 0);
    -[CNContactContentUnitaryViewController environment](self, "environment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v9, "runningInContactsAppOniPad");

    displayContactView = self->_displayContactView;
    if ((_DWORD)v5)
    {
      -[CNContactView setSectionHeaderHeight:](displayContactView, "setSectionHeaderHeight:", 0.0);
      displayContactView = self->_displayContactView;
    }
  }
  return displayContactView;
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (CNContactView)editingContactView
{
  CNContactView *editingContactView;
  CNContactView *v4;
  void *v5;
  CNContactView *v6;
  CNContactView *v7;

  editingContactView = self->_editingContactView;
  if (!editingContactView)
  {
    v4 = [CNContactView alloc];
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CNContactView initWithFrame:contact:](v4, "initWithFrame:contact:", v5, 0.0, 0.0, 320.0, 200.0);
    v7 = self->_editingContactView;
    self->_editingContactView = v6;

    -[CNContactView setEditing:](self->_editingContactView, "setEditing:", 1);
    -[CNContactView setDataSource:](self->_editingContactView, "setDataSource:", self);
    -[CNContactView setDelegate:](self->_editingContactView, "setDelegate:", self);
    -[CNContactView _setHeaderAndFooterViewsFloat:](self->_editingContactView, "_setHeaderAndFooterViewsFloat:", 0);
    -[CNContactView setTranslatesAutoresizingMaskIntoConstraints:](self->_editingContactView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNContactView setKeyboardDismissMode:](self->_editingContactView, "setKeyboardDismissMode:", 1);
    editingContactView = self->_editingContactView;
  }
  return editingContactView;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;

  v6 = a3;
  if (!-[CNContactContentUnitaryViewController isSharedProfileBannerSectionForTableView:section:](self, "isSharedProfileBannerSectionForTableView:section:", v6, a4)&& !-[CNContactContentUnitaryViewController isPersonHeaderSectionForTableView:section:](self, "isPersonHeaderSectionForTableView:section:", v6, a4))
  {
    -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", a4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CNContactContentUnitaryViewController contact](self, "contact");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mainStoreLinkedContacts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v10, "count") >= 2)
      {

        goto LABEL_9;
      }
      v11 = -[CNContactContentUnitaryViewController isEditing](self, "isEditing");

      if (v11)
        goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[CNContactContentUnitaryViewController cardEditingDeleteContactGroup](self, "cardEditingDeleteContactGroup");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v12)
      {
        -[CNContactContentUnitaryViewController ignoreContactAction](self, "ignoreContactAction");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          v7 = &stru_1E20507A8;
        else
          v7 = 0;
      }
      else
      {

        v7 = 0;
      }
      goto LABEL_15;
    }
LABEL_9:
    objc_msgSend(v8, "title");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_16;
  }
  v7 = 0;
LABEL_16:

  return v7;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CNContactContentUnitaryViewController contact](self, "contact");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mainStoreLinkedContacts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v11, "count") >= 2)
      {

        goto LABEL_15;
      }
      v12 = -[CNContactContentUnitaryViewController isEditing](self, "isEditing");

      if ((v12 & 1) != 0)
        goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_16;
    -[CNContactContentUnitaryViewController cardEditingDeleteContactGroup](self, "cardEditingDeleteContactGroup");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v5 == (void *)v13)
    {

      goto LABEL_16;
    }
    v10 = (void *)v13;
    -[CNContactContentUnitaryViewController cardShareLocationGroup](self, "cardShareLocationGroup");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v5 != (void *)v14)
    {
      v15 = (void *)v14;
      -[CNContactContentUnitaryViewController cardGameCenterActionGroup](self, "cardGameCenterActionGroup");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 != v16)
      {
        v9 = objc_msgSend(v5, "addSpacerFromPreviousGroup");
        goto LABEL_17;
      }
LABEL_16:
      v9 = 1;
      goto LABEL_17;
    }

LABEL_15:
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_16;
  -[CNContactContentUnitaryViewController nameEditingGroups](self, "nameEditingGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5 != v7;

  v9 = !v8;
LABEL_17:

  return v9 & 1;
}

- (CNCardGroup)cardEditingDeleteContactGroup
{
  return self->_cardEditingDeleteContactGroup;
}

- (CNCardGroup)cardShareLocationGroup
{
  return self->_cardShareLocationGroup;
}

- (CNCardGroup)cardGameCenterActionGroup
{
  return self->_cardGameCenterActionGroup;
}

- (CNCardGroup)cardBlockContactGroup
{
  return self->_cardBlockContactGroup;
}

- (id)_itemAtIndexPath:(id)a3 forTableView:(id)a4
{
  id v6;
  CNContactView *v7;
  void *v8;
  CNContactView *editingContactView;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = (CNContactView *)a4;
  -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", objc_msgSend(v6, "section"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactContentUnitaryViewController isStandardGroup:](self, "isStandardGroup:", v8))
  {
    editingContactView = self->_editingContactView;

    if (editingContactView == v7)
      objc_msgSend(v8, "editingItems");
    else
      objc_msgSend(v8, "displayItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v11 = -[CNContactContentUnitaryViewController _indexPathIsActionItem:forTableView:](self, "_indexPathIsActionItem:forTableView:", v6, v7);

  if (v11)
  {
    objc_msgSend(v8, "actionItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v13 = v10;
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v12 = 0;
LABEL_10:

  return v12;
}

- (BOOL)isStandardGroup:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_12:
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void)_updateLabelWidthForCell:(id)a3
{
  char isKindOfClass;
  void *v5;
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  id v15;

  v15 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v15;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v15;
    v7 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    objc_msgSend(v6, "propertyItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((v7 & 1) != 0)
    {
      -[CNContactContentUnitaryViewController _labelWidthKeyForItem:](self, "_labelWidthKeyForItem:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "group");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController _labelWidthKeyForGroup:](self, "_labelWidthKeyForGroup:", v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[CNContactContentUnitaryViewController cachedLabelWidths](self, "cachedLabelWidths");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    objc_msgSend(v6, "setLabelWidth:", v14);

    v5 = v15;
  }

}

- (BOOL)_indexPathIsActionItem:(id)a3 forTableView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", objc_msgSend(v6, "section"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) != 0
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[CNContactContentUnitaryViewController _itemAtIndexPath:forTableView:](self, "_itemAtIndexPath:forTableView:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      isKindOfClass = 0;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass() ^ 1;
    }
  }

  return isKindOfClass & 1;
}

- (void)_updateCachedLabelWidthsForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double Width;
  void *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  int v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  float v31;
  float v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  CGRect v38;
  CGRect v39;

  v4 = a3;
  objc_opt_class();
  v37 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v37;
  else
    v5 = 0;
  v6 = v5;

  if (v6 && objc_msgSend(v6, "supportsLabel"))
  {
    v7 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "labelTextAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "_scaledValueForValue:", 44.0);
      v12 = v11;
    }
    else
    {
      v12 = 44.0;
    }
    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    Width = CGRectGetWidth(v38);
    if ((v7 & 1) != 0)
    {
      -[CNContactContentUnitaryViewController contactView](self, "contactView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_marginWidth");
      v17 = Width - v16;

    }
    else
    {
      v17 = Width / 3.0;
    }

    if (v7)
      v17 = v17 + -53.0;
    v18 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v6, "displayLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "labelTextAttributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v18, "initWithString:attributes:", v19, v21);

    objc_msgSend(v22, "boundingRectWithSize:options:context:", 3, 0, v17, 10000.0);
    v23 = CGRectGetWidth(v39);
    if (v12 < v23)
      v24 = 1;
    else
      v24 = v7;
    if (!v24)
      v23 = v12;
    if (v23 >= v17)
      v23 = v17;
    v25 = ceil(v23);
    objc_msgSend(v6, "group");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController _labelWidthKeyForGroup:](self, "_labelWidthKeyForGroup:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController _labelWidthKeyForItem:](self, "_labelWidthKeyForItem:", v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController cachedLabelWidths](self, "cachedLabelWidths");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKey:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "floatValue");
    v32 = v31;

    if (v25 > 0.0)
    {
      -[CNContactContentUnitaryViewController cachedLabelWidths](self, "cachedLabelWidths");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKey:", v34, v28);

      if (v25 > v32)
      {
        -[CNContactContentUnitaryViewController cachedLabelWidths](self, "cachedLabelWidths");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setObject:forKey:", v36, v27);

      }
    }

  }
}

- (NSMapTable)cachedLabelWidths
{
  return self->_cachedLabelWidths;
}

- (id)_labelWidthKeyForGroup:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  int v7;

  v3 = (__CFString *)a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[__CFString property](v3, "property");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C96888]))
    {

LABEL_5:
      v4 = CFSTR("alerts");
      goto LABEL_6;
    }
    -[__CFString property](v3, "property");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C96680]);

    v4 = v3;
    if (v7)
      goto LABEL_5;
  }
LABEL_6:

  return v4;
}

- (void)prepareCell:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;

  v46 = a3;
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applyCellAppearance:", v46);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_34;
  objc_opt_class();
  v5 = v46;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (objc_msgSend(v7, "displaysCellSelectionState"))
    v8 = 3;
  else
    v8 = 0;
  objc_msgSend(v7, "setSelectionStyle:", v8);
  objc_msgSend(v4, "labelTextAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueTextAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "actionTextAttributes");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_15:

    v9 = (void *)v12;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v13 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    -[CNContactContentUnitaryViewController actionsDataSource](self, "actionsDataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActionsDataSource:", v16);

    -[CNContactContentUnitaryViewController contact](self, "contact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContact:", v17);

    objc_msgSend(v4, "valueTextAttributes");
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = v15;
    goto LABEL_15;
  }
LABEL_16:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "valueTextAttributes");
    v18 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[CNContactContentUnitaryViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "tintColorOverride");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = v5;
    if (objc_msgSend(v31, "supportsValueColorUsesLabelColor"))
    {
      +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "textColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = 0;
    }
    -[CNContactContentUnitaryViewController highlightedProperties](self, "highlightedProperties");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "count"))
    {
      -[CNContactContentUnitaryViewController highlightedProperties](self, "highlightedProperties");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "propertyItem");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v33;
      objc_msgSend(v44, "contactProperty");
      v35 = v31;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setHighlightedProperty:", objc_msgSend(v34, "containsObject:", v36));

      v31 = v35;
      v33 = v45;

    }
    else
    {
      objc_msgSend(v31, "setHighlightedProperty:", 0);
    }

    if (objc_msgSend(v31, "isSuggested"))
    {
      +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "suggestedLabelTextColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "suggestedValueTextColor");
      v39 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (objc_msgSend(v31, "isHighlightedProperty")
        && -[CNContactContentUnitaryViewController highlightedPropertyImportant](self, "highlightedPropertyImportant"))
      {
        objc_msgSend(v31, "setImportant:", -[CNContactContentUnitaryViewController highlightedPropertyImportant](self, "highlightedPropertyImportant"));
        objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
        v39 = objc_claimAutoreleasedReturnValue();
        v21 = 0;
        goto LABEL_52;
      }
      if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) != 0
        || !objc_msgSend(v31, "supportsTintColorValue"))
      {
        v21 = 0;
LABEL_60:
        if (objc_msgSend(v31, "isHighlightedProperty"))
        {
          if ((objc_msgSend(v31, "isImportant") & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              v40 = v31;
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v41 = v40;
              else
                v41 = 0;
              v42 = v41;

              objc_msgSend(v42, "setShouldShowBadge:", 1);
            }
          }
        }

        if (!v21)
        {
LABEL_26:
          if (v20)
          {
            v22 = (void *)objc_msgSend(v10, "mutableCopy");
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0DC1140]);

            v10 = v22;
          }
          if ((isKindOfClass & 1) != 0)
            goto LABEL_30;
          goto LABEL_29;
        }
        v43 = (void *)objc_msgSend(v9, "mutableCopy");
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0DC1140]);
        v19 = v9;
        v9 = v43;
LABEL_25:

        goto LABEL_26;
      }
      -[CNContactContentUnitaryViewController view](self, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "tintColorOverride");
      v39 = objc_claimAutoreleasedReturnValue();

      v21 = 0;
    }
    v20 = v38;
LABEL_52:

    v20 = (void *)v39;
    goto LABEL_60;
  }
  v21 = 0;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_30;
LABEL_29:
  objc_msgSend(v7, "labelTextAttributes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEqual:", v9);

  if ((v24 & 1) == 0)
LABEL_30:
    objc_msgSend(v7, "setLabelTextAttributes:", v9);
  objc_msgSend(v7, "valueTextAttributes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqual:", v10);

  if ((v26 & 1) == 0)
    objc_msgSend(v7, "setValueTextAttributes:", v10);

LABEL_34:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v27 = v46;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v27;
    else
      v28 = 0;
    v29 = v28;

    objc_msgSend(v4, "labelTextAttributes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setLabelTextAttributes:", v30);

  }
}

- (BOOL)isSharedProfileBannerSectionIndexPath:(id)a3 forTableView:(id)a4
{
  id v6;

  v6 = a4;
  LOBYTE(a3) = -[CNContactContentUnitaryViewController isSharedProfileBannerSectionForTableView:section:](self, "isSharedProfileBannerSectionForTableView:section:", v6, objc_msgSend(a3, "section"));

  return (char)a3;
}

- (id)_cellIdentifierForTableView:(id)a3 indexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;

  v7 = a3;
  v8 = a4;
  -[CNContactContentUnitaryViewController _itemAtIndexPath:forTableView:](self, "_itemAtIndexPath:forTableView:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[CNContactView cellIdentifierForPropertyPlaceholder](CNContactView, "cellIdentifierForPropertyPlaceholder");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", objc_msgSend(v8, "section"), v7);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "useSplitActions"))
      {
        +[CNContactView cellIdentifierForSplitActions](CNContactView, "cellIdentifierForSplitActions");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v10, "displaysDropdownMenu"))
          +[CNContactView cellIdentifierForDropdownMenuActions](CNContactView, "cellIdentifierForDropdownMenuActions");
        else
          +[CNContactView cellIdentifierForActions](CNContactView, "cellIdentifierForActions");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[CNContactView cellIdentifierForFaceTimeGroup](CNContactView, "cellIdentifierForFaceTimeGroup");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
        +[CNContactView cellIdentifierForLinkedCardsEditingGroup](CNContactView, "cellIdentifierForLinkedCardsEditingGroup");
      else
        +[CNContactView cellIdentifierForLinkedCardsGroup](CNContactView, "cellIdentifierForLinkedCardsGroup");
LABEL_18:
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[CNContactView cellIdentifierForLinkedCardsPlaceholderGroup](CNContactView, "cellIdentifierForLinkedCardsPlaceholderGroup");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
          +[CNContactView cellIdentifierForGroupMembershipEditingGroup](CNContactView, "cellIdentifierForGroupMembershipEditingGroup");
        else
          +[CNContactView cellIdentifierForGroupMembershipGroup](CNContactView, "cellIdentifierForGroupMembershipGroup");
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[CNContactView cellIdentifierForGroupMembershipPlaceholderGroup](CNContactView, "cellIdentifierForGroupMembershipPlaceholderGroup");
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[CNContactView cellIdentifierForStaticIdentityPlaceholderGroup](CNContactView, "cellIdentifierForStaticIdentityPlaceholderGroup");
          v12 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[CNContactView cellIdentifierForStaticIdentityEditingGroup](CNContactView, "cellIdentifierForStaticIdentityEditingGroup");
            v12 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (!-[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
                goto LABEL_47;
              +[CNContactView cellIdentifierForContactContainerEditingGroup](CNContactView, "cellIdentifierForContactContainerEditingGroup");
              v12 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                +[CNContactView cellIdentifierForGameCenterGroup](CNContactView, "cellIdentifierForGameCenterGroup");
                v12 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  +[CNContactView cellIdentifierForMeCardSharedProfileGroup](CNContactView, "cellIdentifierForMeCardSharedProfileGroup");
                  v12 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    goto LABEL_47;
                  +[CNContactView cellIdentifierForCardNamePickingGroup](CNContactView, "cellIdentifierForCardNamePickingGroup");
                  v12 = objc_claimAutoreleasedReturnValue();
                }
              }
            }
          }
        }
      }
    }
LABEL_45:
    v14 = (void *)v12;
    if (v12)
      goto LABEL_46;
LABEL_47:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactContentUnitaryViewController.m"), 5979, CFSTR("Unknown group item: %@"), v9);

    v14 = 0;
    goto LABEL_46;
  }
  v10 = v9;
  if (!-[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
  {
    objc_msgSend(v10, "property");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContactView cellIdentifierForProperty:](CNContactView, "cellIdentifierForProperty:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
  +[CNContactView cellIdentifierForEditingPropertyItem:](CNContactView, "cellIdentifierForEditingPropertyItem:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_20:
  v14 = (void *)v11;
LABEL_21:

  if (!v14)
    goto LABEL_47;
LABEL_46:

  return v14;
}

- (NSArray)highlightedProperties
{
  return self->_highlightedProperties;
}

+ (BOOL)enablesTransportButtons
{
  if (enablesTransportButtons_s_onceToken_60668 != -1)
    dispatch_once(&enablesTransportButtons_s_onceToken_60668, &__block_literal_global_60669);
  return enablesTransportButtons_s_enableTransportButtons_60670;
}

- (id)_labelWidthKeyForItem:(id)a3
{
  return a3;
}

- (CNSharedProfileStateOracle)sharedProfileStateOracle
{
  cn_objectResultWithObjectLock();
  return (CNSharedProfileStateOracle *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isMailVIP
{
  return self->_isMailVIP;
}

+ (int64_t)tableViewStyle
{
  return 1;
}

- (id)setupSharedProfileStateOracle
{
  id v3;
  void *v4;
  void *v5;
  CNSharedProfileStateOracle *v6;
  CNSharedProfileStateOracle *sharedProfileStateOracle;

  v3 = objc_alloc(MEMORY[0x1E0C973E0]);
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (CNSharedProfileStateOracle *)objc_msgSend(v3, "initWithContact:contactStore:", v4, v5);
  sharedProfileStateOracle = self->_sharedProfileStateOracle;
  self->_sharedProfileStateOracle = v6;

  if (-[CNContactContentUnitaryViewController shouldShowSharedProfileBanner](self, "shouldShowSharedProfileBanner"))
    self->_bannerActionTypeForEffectiveState = -[CNSharedProfileStateOracle bannerActionTypeForEffectiveState](self->_sharedProfileStateOracle, "bannerActionTypeForEffectiveState");
  return self->_sharedProfileStateOracle;
}

- (id)_loadPropertyGroups
{
  void *v3;
  void (**v4)(void *, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD aBlock[5];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__CNContactContentUnitaryViewController__loadPropertyGroups__block_invoke;
  aBlock[3] = &unk_1E204FD70;
  aBlock[4] = self;
  v18 = v3;
  v24 = v18;
  v4 = (void (**)(void *, void *))_Block_copy(aBlock);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  +[CNContactView allCardProperties](CNContactView, "allCardProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v9 = *MEMORY[0x1E0C966A0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEqualToString:", v9))
        {
          v12 = (void *)MEMORY[0x1E0C972D8];
          -[CNContactContentUnitaryViewController contact](self, "contact");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v12) = objc_msgSend(v12, "isWhitelistedContact:", v13);

          if (!(_DWORD)v12)
            continue;
        }
        -[CNContactContentUnitaryViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsObject:", v11);

        if ((v15 & 1) == 0
          && !-[CNContactContentUnitaryViewController _isUnavailableAuthorizationPropertyKey:](self, "_isUnavailableAuthorizationPropertyKey:", v11))
        {
          v4[2](v4, v11);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v7);
  }

  v4[2](v4, (void *)*MEMORY[0x1E0C96800]);
  v16 = v18;

  return v16;
}

void __60__CNContactContentUnitaryViewController__loadPropertyGroups__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "policy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_cnui_maximumNumberOfValuesForProperty:", v11);

  if (v4)
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "groupClassForProperty:", v11);
    objc_msgSend(*(id *)(a1 + 32), "mutableContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "contactStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "policy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "linkedPoliciesByContactIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupForProperty:contact:store:policy:linkedPolicies:", v11, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v11);
  }

}

- (id)policy
{
  return self->_policy;
}

- (id)contactStore
{
  return self->_contactStore;
}

- (CNMutableContact)mutableContact
{
  return self->_mutableContact;
}

- (id)linkedPoliciesByContactIdentifier
{
  return self->_linkedPoliciesByContactIdentifier;
}

- (BOOL)_isUnavailableAuthorizationPropertyKey:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  NSObject *v9;
  BOOL v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isKeyAvailable:", v4);

  if ((v6 & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0C971A8], "allAuthorizationKeysVector"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "containsKey:", v4),
        v7,
        !v8))
  {
    v10 = 0;
  }
  else
  {
    CNUILogContactCard();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_18AC56000, v9, OS_LOG_TYPE_DEFAULT, "Property %@ will not be displayed as it is unavailable and requires authorization", (uint8_t *)&v12, 0xCu);
    }

    v10 = 1;
  }

  return v10;
}

- (void)headerPhotoDidUpdate
{
  id v3;

  -[CNContactContentUnitaryViewController updateDoneButton](self, "updateDoneButton");
  -[CNContactHeaderEditView updateEditButtonTitle](self->_editingHeaderView, "updateEditButtonTitle");
  if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
  {
    -[CNContactContentUnitaryViewController editingContactView](self, "editingContactView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController scrollScrollViewAllTheWayUp:](self, "scrollScrollViewAllTheWayUp:", v3);

  }
}

- (Class)groupClassForProperty:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96680]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96888]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96800]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C966A0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96668]) & 1) == 0)
  {
    objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96860]);
  }
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  UIEdgeInsets *p_peripheryInsets;
  void *v6;
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CNContactContentUnitaryViewController;
  -[CNContactContentUnitaryViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v13, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (!-[CNContactContentUnitaryViewController isOutOfProcess](self, "isOutOfProcess"))
  {
    p_peripheryInsets = &self->_peripheryInsets;
    -[CNContactContentUnitaryViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_peripheryInsets");
    p_peripheryInsets->top = v9;
    p_peripheryInsets->left = v10;
    p_peripheryInsets->bottom = v11;
    p_peripheryInsets->right = v12;

  }
}

- (void)setContactStore:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  CNUIGroupsAndContainersSaveManager *v8;

  objc_storeStrong((id *)&self->_contactStore, a3);
  v5 = a3;
  -[CNContactContentUnitaryViewController actionsDataSource](self, "actionsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContactStore:", v5);

  -[CNContactContentUnitaryViewController contactViewCache](self, "contactViewCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContactStore:", v5);

  v8 = -[CNUIGroupsAndContainersSaveManager initWithContactStore:]([CNUIGroupsAndContainersSaveManager alloc], "initWithContactStore:", v5);
  -[CNContactContentUnitaryViewController setGroupsAndContainersSaveManager:](self, "setGroupsAndContainersSaveManager:", v8);

}

- (void)setGroupsAndContainersSaveManager:(id)a3
{
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, a3);
}

- (void)_reloadAlertGroups
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CNContactContentUnitaryViewController propertyGroups](self, "propertyGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C96680]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsDisplayModePickerActions:", -[CNContactContentUnitaryViewController allowsDisplayModePickerActions](self, "allowsDisplayModePickerActions"));

  -[CNContactContentUnitaryViewController propertyGroups](self, "propertyGroups");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C96888]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsDisplayModePickerActions:", -[CNContactContentUnitaryViewController allowsDisplayModePickerActions](self, "allowsDisplayModePickerActions"));

}

- (BOOL)allowsDisplayModePickerActions
{
  return self->_allowsDisplayModePickerActions;
}

- (void)setMenuProviderForCell:(id)a3 forActionGroupItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;

  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_4;
  -[CNContactContentUnitaryViewController cardShareLocationGroup](self, "cardShareLocationGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToArray:", v10);

  if (v11)
  {
    -[CNContactContentUnitaryViewController shareLocationController](self, "shareLocationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __83__CNContactContentUnitaryViewController_setMenuProviderForCell_forActionGroupItem___block_invoke;
    v32[3] = &unk_1E204FA28;
    v33 = v6;
    objc_msgSend(v12, "actionsMenuProviderWithCompletion:", v32);

  }
  else
  {
LABEL_4:
    -[CNContactContentUnitaryViewController cardGameCenterActionGroup](self, "cardGameCenterActionGroup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "actions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqualToArray:", v15) & 1) != 0)
    {
      -[CNContactContentUnitaryViewController gameCenterManager](self, "gameCenterManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "shouldActionDisplayDropdownMenu");

      if (v17)
      {
        objc_msgSend(v7, "actions");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "target");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addFriendsMenuProvider");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setMenuProvider:", v21);

        goto LABEL_19;
      }
    }
    else
    {

    }
    objc_msgSend(v7, "actions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v24 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;
    v26 = v25;

    if (v26)
    {
      objc_msgSend(v26, "menuProvider");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMenuProvider:", v27);
    }
    else
    {
      objc_msgSend(v24, "target");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "conformsToProtocol:", &unk_1EDFDD040))
        v29 = v28;
      else
        v29 = 0;
      v27 = v29;

      if (v27)
      {
        objc_msgSend(v6, "contextMenuInteraction");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "menuProviderForContextMenuInteraction:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setMenuProvider:", v31);

      }
    }

  }
LABEL_19:

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNContactContentUnitaryViewController;
  -[CNContactContentUnitaryViewController viewWillLayoutSubviews](&v8, sel_viewWillLayoutSubviews);
  -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calculateLabelSizesIfNeeded");

  if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "calculateLabelSizesIfNeeded");

  }
  -[CNContactContentUnitaryViewController updateOutOfProcessFullscreenPresentationIfNeeded](self, "updateOutOfProcessFullscreenPresentationIfNeeded");
  -[CNContactContentUnitaryViewController updateEditPhotoButtonIfNeeded](self, "updateEditPhotoButtonIfNeeded");
  if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0)
  {
    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEditing");

    if (v6)
    {
      -[CNContactContentUnitaryViewController contactView](self, "contactView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEditing:animated:", 0, 0);

    }
  }
}

- (void)updateOutOfProcessFullscreenPresentationIfNeeded
{
  void *v3;
  char isKindOfClass;
  id v5;

  if (-[CNContactContentUnitaryViewController isOutOfProcess](self, "isOutOfProcess")
    && -[CNContactContentUnitaryViewController isPresentingModalViewController](self, "isPresentingModalViewController"))
  {
    -[CNContactContentUnitaryViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CNContactContentUnitaryViewController presentedViewController](self, "presentedViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        -[CNContactContentUnitaryViewController shouldPresentFullscreen:](self, "shouldPresentFullscreen:", -[CNContactContentUnitaryViewController isPresentingFullscreenForOutOfProcess](self, "isPresentingFullscreenForOutOfProcess"));
    }
    else
    {

    }
  }
}

- (void)updateEditPhotoButtonIfNeeded
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  if (-[CNContactContentUnitaryViewController isHeaderViewPhotoProhibited](self, "isHeaderViewPhotoProhibited"))
  {
    if (!-[CNContactContentUnitaryViewController allowsEditPhoto](self, "allowsEditPhoto"))
      return;
    v3 = 0;
  }
  else
  {
    -[CNContactContentUnitaryViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = +[CNVisualIdentityPickerViewController canShowPhotoPickerForView:withTraitCollection:](CNPhotoPickerViewController, "canShowPhotoPickerForView:withTraitCollection:", v4, v5);

    if (v3 == -[CNContactContentUnitaryViewController allowsEditPhoto](self, "allowsEditPhoto"))
      return;
  }
  -[CNContactContentUnitaryViewController setAllowsEditPhoto:preservingChanges:](self, "setAllowsEditPhoto:preservingChanges:", v3, 1);
}

- (BOOL)isHeaderViewPhotoProhibited
{
  void *v3;
  char v4;
  void *v5;

  -[CNContactContentUnitaryViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0C96708]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[CNContactContentUnitaryViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0C96890]);

  }
  return v4;
}

- (void)initializeTableViewsForHeaderHeight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  id v39;

  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "layoutIfNeeded");
  -[CNContactContentUnitaryViewController actionsWrapperView](self, "actionsWrapperView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  -[CNContactContentUnitaryViewController actionsWrapperView](self, "actionsWrapperView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactContentUnitaryViewController floatingActionsWrapperView](self, "floatingActionsWrapperView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

    -[CNContactContentUnitaryViewController floatingActionsWrapperView](self, "floatingActionsWrapperView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutIfNeeded");

    -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "calculateLabelSizesIfNeeded");

  }
  -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "calculateLabelSizesIfNeeded");

  if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
  {
    -[CNContactContentUnitaryViewController headerHeightConstraint](self, "headerHeightConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constant");
    v11 = v10;
    -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "minHeight");
    if (v11 > v13)
      v14 = 0.0;
    else
      v14 = 1.0;
    -[CNContactContentUnitaryViewController headerDropShadowView](self, "headerDropShadowView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAlpha:", v14);

    if (!-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
      goto LABEL_17;
    -[CNContactContentUnitaryViewController editingFloatingHeaderHeight](self, "editingFloatingHeaderHeight");
    v17 = v16;
    -[CNContactContentUnitaryViewController editingFloatingHeaderHeightConstraint](self, "editingFloatingHeaderHeightConstraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constant");
    v20 = v19;

    if (v20 != v17)
    {
      -[CNContactContentUnitaryViewController editingFloatingHeaderHeightConstraint](self, "editingFloatingHeaderHeightConstraint");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setConstant:", v17);

    }
    -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "maxHeight");
    v24 = v23;

  }
  else
  {
    -[CNContactContentUnitaryViewController headerDropShadowView](self, "headerDropShadowView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAlpha:", 1.0);

    if (!-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
      goto LABEL_17;
    -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "maxHeight");
    v28 = v27;

    -[CNContactContentUnitaryViewController floatingHeaderHeightConstraint](self, "floatingHeaderHeightConstraint");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constant");
    v31 = v30;

    if (v31 != v28)
    {
      -[CNContactContentUnitaryViewController floatingHeaderHeightConstraint](self, "floatingHeaderHeightConstraint");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setConstant:", v28);

    }
    -[CNContactContentUnitaryViewController staticDisplayHeaderHeight](self, "staticDisplayHeaderHeight");
    v24 = v33;
  }
  -[CNContactContentUnitaryViewController headerHeightConstraint](self, "headerHeightConstraint");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constant");
  v36 = v35;

  if (v36 != v24)
  {
    -[CNContactContentUnitaryViewController headerHeightConstraint](self, "headerHeightConstraint");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setConstant:", v24);

  }
LABEL_17:
  -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "layoutIfNeeded");

  -[CNContactContentUnitaryViewController updateInsetsIfNeededForTableView:isEditing:](self, "updateInsetsIfNeededForTableView:isEditing:", v39, -[CNContactContentUnitaryViewController isEditing](self, "isEditing"));
  if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
    -[CNContactContentUnitaryViewController updateCollapsedHeaderToMatchScrollViewState:scrollDirection:animated:](self, "updateCollapsedHeaderToMatchScrollViewState:scrollDirection:animated:", v39, 2, 0);
  else
    -[CNContactContentUnitaryViewController updateHeaderHeightToMatchScrollViewState:scrollDirection:animated:](self, "updateHeaderHeightToMatchScrollViewState:scrollDirection:animated:", v39, 2, 0);

}

- (CNContactActionsContainerView)floatingActionsWrapperView
{
  return self->_floatingActionsWrapperView;
}

- (CNContactActionsContainerView)actionsWrapperView
{
  return self->_actionsWrapperView;
}

- (NSLayoutConstraint)floatingHeaderHeightConstraint
{
  return self->_floatingHeaderHeightConstraint;
}

- (void)updateDisplayCollapsedHeaderToMatchScrollViewState:(id)a3 scrollDirection:(int64_t)a4 animated:(BOOL)a5
{
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader")
    && (-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0)
  {
    -[CNContactContentUnitaryViewController staticDisplayHeaderView](self, "staticDisplayHeaderView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;
    -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v8 - v10;

    if (objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
    {
      -[CNContactContentUnitaryViewController actionsWrapperView](self, "actionsWrapperView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v14 = v13;
    }
    else
    {
      -[CNContactContentUnitaryViewController staticDisplayHeaderView](self, "staticDisplayHeaderView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bottomMargin");
      v14 = v15;
    }

    v16 = v11 - v14;
    objc_msgSend(v24, "contentOffset");
    v18 = v17;
    v19 = v17 >= v16;
    -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isHidden");

    if (((v19 ^ v21) & 1) == 0)
    {
      -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setHidden:", v18 < v16);

      -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "showLabelAndAvatar:animated:", v18 >= v16, 1);

    }
  }

}

- (CNContactHeaderCollapsedView)displayFloatingCollapsedHeaderView
{
  CNContactHeaderCollapsedView *displayFloatingCollapsedHeaderView;
  _BOOL8 v4;
  int v5;
  void *v6;
  CNContactHeaderCollapsedView *v7;
  CNContactHeaderCollapsedView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  displayFloatingCollapsedHeaderView = self->_displayFloatingCollapsedHeaderView;
  if (!displayFloatingCollapsedHeaderView)
  {
    v4 = -[CNContactContentUnitaryViewController isHeaderViewPhotoProhibited](self, "isHeaderViewPhotoProhibited");
    v5 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContactHeaderCollapsedView collapsedContactHeaderViewWithContact:showingNavBar:monogramOnly:delegate:](CNContactHeaderCollapsedView, "collapsedContactHeaderViewWithContact:showingNavBar:monogramOnly:delegate:", v6, -[CNContactContentUnitaryViewController layoutPositionallyAfterNavBar](self, "layoutPositionallyAfterNavBar"), v4, self);
    v7 = (CNContactHeaderCollapsedView *)objc_claimAutoreleasedReturnValue();
    v8 = self->_displayFloatingCollapsedHeaderView;
    self->_displayFloatingCollapsedHeaderView = v7;

    if (v5)
    {
      -[CNContactHeaderCollapsedView setActionsWrapperView:](self->_displayFloatingCollapsedHeaderView, "setActionsWrapperView:", 0);
    }
    else
    {
      -[CNContactContentUnitaryViewController floatingActionsWrapperView](self, "floatingActionsWrapperView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactHeaderCollapsedView setActionsWrapperView:](self->_displayFloatingCollapsedHeaderView, "setActionsWrapperView:", v9);

    }
    -[CNContactHeaderView setAlwaysShowsMonogram:](self->_displayFloatingCollapsedHeaderView, "setAlwaysShowsMonogram:", 1);
    -[CNContactContentUnitaryViewController contactFormatter](self, "contactFormatter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderCollapsedView setContactFormatter:](self->_displayFloatingCollapsedHeaderView, "setContactFormatter:", v10);

    -[CNContactContentUnitaryViewController alternateName](self, "alternateName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderCollapsedView setAlternateName:](self->_displayFloatingCollapsedHeaderView, "setAlternateName:", v11);

    -[CNContactContentUnitaryViewController presentingDelegate](self, "presentingDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView setPresenterDelegate:](self->_displayFloatingCollapsedHeaderView, "setPresenterDelegate:", v12);

    -[CNContactHeaderCollapsedView setTranslatesAutoresizingMaskIntoConstraints:](self->_displayFloatingCollapsedHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNContactHeaderCollapsedView setHidden:](self->_displayFloatingCollapsedHeaderView, "setHidden:", 1);
    -[CNContactHeaderCollapsedView showLabelAndAvatar:animated:](self->_displayFloatingCollapsedHeaderView, "showLabelAndAvatar:animated:", 0, 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderCollapsedView setBackgroundColor:](self->_displayFloatingCollapsedHeaderView, "setBackgroundColor:", v13);

    v14 = -[CNContactContentUnitaryViewController applyContactStyle](self, "applyContactStyle");
    displayFloatingCollapsedHeaderView = self->_displayFloatingCollapsedHeaderView;
  }
  return displayFloatingCollapsedHeaderView;
}

- (id)presentingDelegate
{
  return objc_loadWeakRetained((id *)&self->_presentingDelegate);
}

- (UIEdgeInsets)headerViewSafeAreaInsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[CNContactContentUnitaryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  -[CNContactContentUnitaryViewController navigationBarHeight](self, "navigationBarHeight");
  v11 = v5 - v10;
  v12 = 0.0;
  v13 = v7;
  v14 = v9;
  result.right = v14;
  result.bottom = v12;
  result.left = v13;
  result.top = v11;
  return result;
}

- (BOOL)shouldDisplayAvatarHeaderView
{
  void *v2;
  BOOL v3;

  -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)updateCollapsedHeaderToMatchScrollViewState:(id)a3 scrollDirection:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;

  v5 = a5;
  v8 = a3;
  if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader")
    && (-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0)
  {
    -[CNContactContentUnitaryViewController updateDisplayCollapsedHeaderToMatchScrollViewState:scrollDirection:animated:](self, "updateDisplayCollapsedHeaderToMatchScrollViewState:scrollDirection:animated:", v8, a4, v5);
  }

}

- (NSLayoutConstraint)headerHeightConstraint
{
  return self->_headerHeightConstraint;
}

- (double)staticDisplayHeaderHeight
{
  double v3;
  _BOOL4 v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;

  v3 = 0.0;
  if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader")
    && (-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0)
  {
    v4 = -[CNContactContentUnitaryViewController isPadRegularHorizontalSize](self, "isPadRegularHorizontalSize");
    -[CNContactContentUnitaryViewController staticDisplayHeaderView](self, "staticDisplayHeaderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minHeight");
    v3 = v6;

    -[CNContactContentUnitaryViewController staticDisplayHeaderView](self, "staticDisplayHeaderView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v3;
    if ((objc_msgSend(v7, "shouldUseFixedHeight") & 1) == 0)
    {
      if (v4)
        v9 = 0.525;
      else
        v9 = 0.66;
      -[CNContactContentUnitaryViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      v8 = v9 * v11;

    }
    if (v3 < v8)
      v3 = v8;
    if (objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
    {
      -[CNContactContentUnitaryViewController actionsWrapperView](self, "actionsWrapperView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v3 = v3 + v13;

    }
  }
  return v3;
}

- (BOOL)isPadRegularHorizontalSize
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  -[CNContactContentUnitaryViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "horizontalSizeClass");

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  return v5 == 1 && v3 != 1;
}

- (UIView)headerDropShadowView
{
  return self->_headerDropShadowView;
}

- (void)updateEditNavigationItemsAnimated:(BOOL)a3 updateTintColor:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  CNContactContentUnitaryViewController *v6;
  CNContactContentUnitaryViewController *v7;
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
  void **v21;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void **v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  CNContactContentUnitaryViewController *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  CNContactContentUnitaryViewController *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  char v57;
  void *v58;
  char v59;
  void *v60;
  CNContactContentUnitaryViewController *v61;
  char v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  CNContactContentUnitaryViewController *v68;
  void *v69;
  void *v70;
  BOOL v71;
  void *v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  _BOOL4 v77;
  unsigned int v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _QWORD v86[2];

  v4 = a4;
  v5 = a3;
  v6 = self;
  v86[1] = *MEMORY[0x1E0C80C00];
  if (-[CNContactContentUnitaryViewController isOutOfProcess](self, "isOutOfProcess")
    && !-[CNContactContentUnitaryViewController outOfProcessSetupComplete](v6, "outOfProcessSetupComplete"))
  {
    return;
  }
  -[CNContactContentUnitaryViewController navigationItemController](v6, "navigationItemController");
  v7 = (CNContactContentUnitaryViewController *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController navigationItem](v7, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController currentNavigationController](v6, "currentNavigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((-[CNContactContentUnitaryViewController isEditing](v6, "isEditing") & 1) == 0
    && !-[CNContactContentUnitaryViewController allowsEditing](v6, "allowsEditing"))
  {
    if (-[CNContactContentUnitaryViewController mode](v6, "mode") == 5)
    {
      -[CNContactContentUnitaryViewController editButtonItem](v7, "editButtonItem");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setStyle:", 2);

      -[CNContactContentUnitaryViewController editButtonItem](v7, "editButtonItem");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTarget:", v6);

      -[CNContactContentUnitaryViewController editButtonItem](v7, "editButtonItem");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setAction:", sel_updateContact_);

      CNContactsUIBundle();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("UPDATE"), &stru_1E20507A8, CFSTR("Localized"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController editButtonItem](v7, "editButtonItem");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setTitle:", v32);

      -[CNContactContentUnitaryViewController editButtonItem](v7, "editButtonItem");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v6, sel_editCancel_);
      v81 = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController setCancelKeyboardShortcutEnabled:](v6, "setCancelKeyboardShortcutEnabled:", 1);
      -[CNContactContentUnitaryViewController setEditKeyboardShortcutEnabled:](v6, "setEditKeyboardShortcutEnabled:", 1);
      goto LABEL_35;
    }
    objc_msgSend(v8, "rightBarButtonItems");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController editButtonItem](v7, "editButtonItem");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36 == v37)
      v25 = (void *)MEMORY[0x1E0C9AA60];
    else
      v25 = 0;
    -[CNContactContentUnitaryViewController setCancelKeyboardShortcutEnabled:](v6, "setCancelKeyboardShortcutEnabled:", 0);
    -[CNContactContentUnitaryViewController setEditKeyboardShortcutEnabled:](v6, "setEditKeyboardShortcutEnabled:", 0);
    objc_msgSend(v8, "backBarButtonItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v8, "backBarButtonItem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v27;
      v39 = (void *)MEMORY[0x1E0C99D20];
      v40 = &v80;
LABEL_33:
      objc_msgSend(v39, "arrayWithObjects:count:", v40, 1);
      v41 = objc_claimAutoreleasedReturnValue();
LABEL_34:
      v17 = (void *)v41;
      goto LABEL_35;
    }
    v77 = -[CNContactContentUnitaryViewController displayNavigationButtonsShouldUsePlatterStyle](v6, "displayNavigationButtonsShouldUsePlatterStyle");
    if (v11)
    {
      if (v77)
      {
        -[CNContactContentUnitaryViewController platterBackBarButtonItem](v6, "platterBackBarButtonItem");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v27;
        v39 = (void *)MEMORY[0x1E0C99D20];
        v40 = &v79;
        goto LABEL_33;
      }
    }
    else if (v77)
    {
      objc_msgSend(v8, "leftBarButtonItems");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "_cn_filter:", &__block_literal_global_318);
      v41 = objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    v17 = 0;
    goto LABEL_36;
  }
  if (!-[CNContactContentUnitaryViewController isEditing](v6, "isEditing"))
  {
    -[CNContactContentUnitaryViewController setCancelKeyboardShortcutEnabled:](v6, "setCancelKeyboardShortcutEnabled:", 0);
    objc_msgSend(v8, "backBarButtonItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v8, "backBarButtonItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v19;
      v20 = (void *)MEMORY[0x1E0C99D20];
      v21 = &v85;
    }
    else
    {
      if (!v11
        || !-[CNContactContentUnitaryViewController displayNavigationButtonsShouldUsePlatterStyle](v6, "displayNavigationButtonsShouldUsePlatterStyle"))
      {
        -[CNContactContentUnitaryViewController preEditLeftBarButtonItems](v6, "preEditLeftBarButtonItems");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          -[CNContactContentUnitaryViewController preEditLeftBarButtonItems](v6, "preEditLeftBarButtonItems");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        if (v11
          || !-[CNContactContentUnitaryViewController displayNavigationButtonsShouldUsePlatterStyle](v6, "displayNavigationButtonsShouldUsePlatterStyle"))
        {
          v17 = 0;
          goto LABEL_16;
        }
        objc_msgSend(v8, "leftBarButtonItems");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_cn_filter:", &__block_literal_global_307);
        v22 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v17 = (void *)v22;

LABEL_16:
        -[CNContactContentUnitaryViewController setPreEditLeftBarButtonItems:](v6, "setPreEditLeftBarButtonItems:", 0);
        goto LABEL_17;
      }
      -[CNContactContentUnitaryViewController platterBackBarButtonItem](v6, "platterBackBarButtonItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v19;
      v20 = (void *)MEMORY[0x1E0C99D20];
      v21 = &v84;
    }
    objc_msgSend(v20, "arrayWithObjects:count:", v21, 1);
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  -[CNContactContentUnitaryViewController preEditLeftBarButtonItems](v6, "preEditLeftBarButtonItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v8, "leftBarButtonItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_cn_filter:", &__block_literal_global_302_60592);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      v15 = v14;
    else
      v15 = (void *)MEMORY[0x1E0C9AA60];
    -[CNContactContentUnitaryViewController setPreEditLeftBarButtonItems:](v6, "setPreEditLeftBarButtonItems:", v15);

  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v6, sel_editCancel_);
  v86[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController setCancelKeyboardShortcutEnabled:](v6, "setCancelKeyboardShortcutEnabled:", 1);

LABEL_17:
  -[CNContactContentUnitaryViewController setEditKeyboardShortcutEnabled:](v6, "setEditKeyboardShortcutEnabled:", 1);
  -[CNContactContentUnitaryViewController updateDoneButton](v6, "updateDoneButton");
  if (v7 != v6)
    -[CNContactContentUnitaryViewController setEditing:](v7, "setEditing:", -[CNContactContentUnitaryViewController isEditing](v6, "isEditing"));
  -[CNContactContentUnitaryViewController editButtonItem](v7, "editButtonItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTarget:", v6);

  -[CNContactContentUnitaryViewController editButtonItem](v7, "editButtonItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAction:", sel_toggleEditing_);

  -[CNContactContentUnitaryViewController editButtonItem](v7, "editButtonItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[CNContactContentUnitaryViewController editButtonItem](v7, "editButtonItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v4)
  {
    -[CNContactContentUnitaryViewController navigationItemController](v6, "navigationItemController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController applyNavigationBarTintColorIfNeeded:](v6, "applyNavigationBarTintColorIfNeeded:", v27);
LABEL_35:

  }
LABEL_36:
  if (-[UIViewController ab_isInSheet](v6, "ab_isInSheet"))
  {
    objc_msgSend(v8, "rightBarButtonItems");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leftBarButtonItems");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController extraRightBarButtonItems](v6, "extraRightBarButtonItems");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v44)
    {
      if (objc_msgSend(v42, "count"))
      {
        v45 = v6;
        v46 = v42;
      }
      else
      {
        v46 = (void *)MEMORY[0x1E0C9AA60];
        v45 = v6;
      }
      -[CNContactContentUnitaryViewController setExtraRightBarButtonItems:](v45, "setExtraRightBarButtonItems:", v46);
    }
    -[CNContactContentUnitaryViewController extraRightBarButtonItems](v6, "extraRightBarButtonItems");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v48, "count"))
    {
      v49 = objc_msgSend(v25, "count");

      if (v49)
        goto LABEL_48;
      -[CNContactContentUnitaryViewController extraRightBarButtonItems](v6, "extraRightBarButtonItems");
      v48 = v25;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_48:
    -[CNContactContentUnitaryViewController extraLeftBarButtonItems](v6, "extraLeftBarButtonItems");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v50)
    {
      if (objc_msgSend(v43, "count"))
      {
        v51 = v6;
        v52 = v43;
      }
      else
      {
        v52 = (void *)MEMORY[0x1E0C9AA60];
        v51 = v6;
      }
      -[CNContactContentUnitaryViewController setExtraLeftBarButtonItems:](v51, "setExtraLeftBarButtonItems:", v52);
    }
    -[CNContactContentUnitaryViewController extraLeftBarButtonItems](v6, "extraLeftBarButtonItems");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v53, "count"))
    {
      v54 = objc_msgSend(v17, "count");

      if (v54)
      {
LABEL_57:

        goto LABEL_58;
      }
      -[CNContactContentUnitaryViewController extraLeftBarButtonItems](v6, "extraLeftBarButtonItems");
      v53 = v17;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_57;
  }
LABEL_58:
  if (v17)
    objc_msgSend(v8, "setLeftBarButtonItems:animated:", v17, v5);
  v55 = *MEMORY[0x1E0D137F8];
  objc_msgSend(v8, "leftBarButtonItems");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (*(uint64_t (**)(uint64_t, void *))(v55 + 16))(v55, v56);

  if ((v57 & 1) == 0)
  {
    objc_msgSend(v8, "leftBarButtonItems");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController applyPlatterStyleToBarButtonItemsIfNeeded:](v6, "applyPlatterStyleToBarButtonItemsIfNeeded:", v56);

  }
  if (v25)
    objc_msgSend(v8, "setRightBarButtonItems:animated:", v25, v5);
  objc_msgSend(v8, "rightBarButtonItems");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (*(uint64_t (**)(uint64_t, void *))(v55 + 16))(v55, v58);

  if ((v59 & 1) == 0)
  {
    objc_msgSend(v8, "rightBarButtonItems");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController applyPlatterStyleToBarButtonItemsIfNeeded:](v6, "applyPlatterStyleToBarButtonItemsIfNeeded:", v60);

  }
  -[CNContactContentUnitaryViewController delegate](v6, "delegate");
  v61 = (CNContactContentUnitaryViewController *)objc_claimAutoreleasedReturnValue();
  v62 = objc_opt_respondsToSelector();

  if (v25 && (v62 & 1) != 0)
  {
    -[CNContactContentUnitaryViewController delegate](v6, "delegate");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = -[CNContactContentUnitaryViewController isEditing](v6, "isEditing");
    -[CNContactContentUnitaryViewController editButtonItem](v7, "editButtonItem");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v56, "isEnabled");
    -[CNContactContentUnitaryViewController editButtonItem](v7, "editButtonItem");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "title");
    v61 = v6;
    v66 = v25;
    v67 = v8;
    v68 = v7;
    v69 = v17;
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "updateEditing:doneButtonEnabled:doneButtonText:", v78, v64, v70);

    v17 = v69;
    v7 = v68;
    v8 = v67;
    v25 = v66;
    v6 = v61;

  }
  if (-[CNContactContentUnitaryViewController isEditing](v6, "isEditing"))
  {
    v71 = -[CNContactContentUnitaryViewController layoutPositionallyAfterNavBar](v6, "layoutPositionallyAfterNavBar");
    if (v71)
    {
      v72 = v17;
      v73 = 0;
      v74 = 1;
    }
    else
    {
      objc_msgSend(v8, "title");
      v75 = objc_claimAutoreleasedReturnValue();
      if (v75)
      {
        v61 = (CNContactContentUnitaryViewController *)v75;
        v72 = v17;
        v73 = 0;
        v74 = 1;
      }
      else
      {
        v72 = v17;
        objc_msgSend(v8, "titleView");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = 0;
        if (v56)
        {
          v73 = 1;
          v74 = 1;
        }
        else
        {
          v74 = objc_msgSend(v8, "_backgroundHidden") ^ 1;
          v73 = 1;
        }
      }
    }
    -[CNContactContentUnitaryViewController editingHeaderView](v6, "editingHeaderView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setShouldShowBelowNavigationTitle:", v74);

    if (v73)
    v17 = v72;
    if (!v71)

  }
}

- (double)navigationBarHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[CNContactContentUnitaryViewController currentNavigationController](self, "currentNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  return v5;
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

  -[CNContactContentUnitaryViewController navigationItemController](self, "navigationItemController");
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

- (id)navigationItemController
{
  CNContactContentUnitaryViewController *v2;
  CNContactContentUnitaryViewController *v3;
  CNContactContentUnitaryViewController *v4;
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
      -[CNContactContentUnitaryViewController parentViewController](v4, "parentViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        break;
      -[CNContactContentUnitaryViewController parentViewController](v4, "parentViewController");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (CNContactContentUnitaryViewController *)v7;
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

- (void)applyPlatterStyleToBarButtonItemsIfNeeded:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CNContactContentUnitaryViewController displayNavigationButtonsShouldUsePlatterStyle](self, "displayNavigationButtonsShouldUsePlatterStyle"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
          if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing", (_QWORD)v12) & 1) != 0)
            -[CNContactContentUnitaryViewController transparentPlatterImage](self, "transparentPlatterImage");
          else
            -[CNContactContentUnitaryViewController buttonPlatterImage](self, "buttonPlatterImage");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setBackgroundImage:forState:barMetrics:", v11, 0, 0);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

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
    v5 = !-[CNContactContentUnitaryViewController shouldDrawNavigationBar](self, "shouldDrawNavigationBar");
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)shouldDrawNavigationBar
{
  return self->_shouldDrawNavigationBar;
}

- (id)buttonPlatterImage
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "cnui_roundedNavButtonPlatterImage");
}

- (void)updateDoneButton
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  if (-[CNContactContentUnitaryViewController isOutOfProcess](self, "isOutOfProcess")
    && !-[CNContactContentUnitaryViewController outOfProcessSetupComplete](self, "outOfProcessSetupComplete"))
  {
    return;
  }
  -[CNContactContentUnitaryViewController navigationItemController](self, "navigationItemController");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
  {
    if (-[CNContactContentUnitaryViewController allowsEditing](self, "allowsEditing"))
    {
      objc_msgSend(v21, "editButtonItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setEnabled:", 1);
    }
    else
    {
      if (-[CNContactContentUnitaryViewController mode](self, "mode") != 5)
      {
        v3 = 0;
        v12 = 0;
        goto LABEL_14;
      }
      CNContactsUIBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("UPDATE"), &stru_1E20507A8, CFSTR("Localized"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "editButtonItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTitle:", v9);

      CNContactsUIBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("REVIEW"), &stru_1E20507A8, CFSTR("Localized"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTitle:", v11);

    }
    v3 = 0;
    goto LABEL_12;
  }
  v3 = -[CNContactContentUnitaryViewController hasPendingChanges](self, "hasPendingChanges");
  objc_msgSend(v21, "editButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

  if (-[CNContactContentUnitaryViewController mode](self, "mode") == 4)
  {
    CNContactsUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("UPDATE"), &stru_1E20507A8, CFSTR("Localized"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "editButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v6);

LABEL_12:
  }
  v12 = 1;
LABEL_14:
  -[CNContactContentUnitaryViewController setSaveKeyboardShortcutEnabled:](self, "setSaveKeyboardShortcutEnabled:", v3);
  -[CNContactContentUnitaryViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if (v12)
  {
    if ((v14 & 1) != 0)
    {
      -[CNContactContentUnitaryViewController delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[CNContactContentUnitaryViewController isEditing](self, "isEditing");
      objc_msgSend(v21, "editButtonItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEnabled");
      objc_msgSend(v21, "editButtonItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "title");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "updateEditing:doneButtonEnabled:doneButtonText:", v16, v18, v20);

    }
  }

}

- (CNContactViewHostProtocol)delegate
{
  return (CNContactViewHostProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isOutOfProcess
{
  return 0;
}

- (void)setSaveKeyboardShortcutEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[CNContactContentUnitaryViewController saveCommand](self, "saveCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("s"), 0x100000, sel_toggleEditing_);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController setSaveCommand:](self, "setSaveCommand:", v6);

      CNContactsUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SAVE_CONTACT_KEYBOARD_DISCOVERY"), &stru_1E20507A8, CFSTR("Localized"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController saveCommand](self, "saveCommand");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDiscoverabilityTitle:", v8);

      -[CNContactContentUnitaryViewController saveCommand](self, "saveCommand");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController addKeyCommand:](self, "addKeyCommand:", v11);

    }
  }
  else if (v5)
  {
    -[CNContactContentUnitaryViewController saveCommand](self, "saveCommand");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController removeKeyCommand:](self, "removeKeyCommand:", v10);

    -[CNContactContentUnitaryViewController setSaveCommand:](self, "setSaveCommand:", 0);
  }
}

- (UIKeyCommand)saveCommand
{
  return self->_saveCommand;
}

- (void)setPreEditLeftBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_preEditLeftBarButtonItems, a3);
}

- (void)setEditKeyboardShortcutEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[CNContactContentUnitaryViewController editCommand](self, "editCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("l"), 0x100000, sel_toggleEditing_);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController setEditCommand:](self, "setEditCommand:", v6);

      CNContactsUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("EDIT_CONTACT_KEYBOARD_DISCOVERY"), &stru_1E20507A8, CFSTR("Localized"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController editCommand](self, "editCommand");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDiscoverabilityTitle:", v8);

      -[CNContactContentUnitaryViewController editCommand](self, "editCommand");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController addKeyCommand:](self, "addKeyCommand:", v11);

    }
  }
  else if (v5)
  {
    -[CNContactContentUnitaryViewController editCommand](self, "editCommand");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController removeKeyCommand:](self, "removeKeyCommand:", v10);

    -[CNContactContentUnitaryViewController setEditCommand:](self, "setEditCommand:", 0);
  }
}

- (UIKeyCommand)editCommand
{
  return self->_editCommand;
}

- (void)setCancelKeyboardShortcutEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[CNContactContentUnitaryViewController cancelCommand](self, "cancelCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4DA0], 0, sel_editCancel_);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController setCancelCommand:](self, "setCancelCommand:", v6);

      -[CNContactContentUnitaryViewController cancelCommand](self, "cancelCommand");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController addKeyCommand:](self, "addKeyCommand:", v8);

    }
  }
  else if (v5)
  {
    -[CNContactContentUnitaryViewController cancelCommand](self, "cancelCommand");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController removeKeyCommand:](self, "removeKeyCommand:", v7);

    -[CNContactContentUnitaryViewController setCancelCommand:](self, "setCancelCommand:", 0);
  }
}

- (UIKeyCommand)cancelCommand
{
  return self->_cancelCommand;
}

- (void)applyNavigationBarTintColorIfNeeded:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  if (-[CNContactContentUnitaryViewController displayNavigationButtonsShouldUsePlatterStyle](self, "displayNavigationButtonsShouldUsePlatterStyle"))
  {
    if (-[CNContactContentUnitaryViewController _appearState](self, "_appearState") == 3
      || !-[CNContactContentUnitaryViewController _appearState](self, "_appearState"))
    {
      CNUILogContactCard();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v8 = 0;
        _os_log_debug_impl(&dword_18AC56000, v5, OS_LOG_TYPE_DEBUG, "Not updating navigation bar tint color, view controller is being dismissed", v8, 2u);
      }
    }
    else
    {
      if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) != 0)
        objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
      else
        +[CNUIColorRepository contactCardStaticHeaderDefaultTintColor](CNUIColorRepository, "contactCardStaticHeaderDefaultTintColor");
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "navigationItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "navigationBar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTintColor:", v5);

    }
  }

}

- (void)updateInsetsIfNeededForTableView:(id)a3 isEditing:(BOOL)a4
{
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  _BOOL8 v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;

  v44 = a3;
  if (!-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactContentUnitaryViewController keyboardVerticalOverlap](self, "keyboardVerticalOverlap");
    if (v5 <= 0.0
      || (-[CNContactContentUnitaryViewController view](self, "view"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "bounds"),
          v8 = v7,
          v6,
          v8 <= 0.0))
    {
      -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "maxHeight");
      v19 = v15;
      v18 = 0;
    }
    else
    {
      -[CNContactContentUnitaryViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      v11 = v10;
      -[CNContactContentUnitaryViewController keyboardVerticalOverlap](self, "keyboardVerticalOverlap");
      v13 = v11 - v12 + -64.0;

      v14 = fmax(v13, 0.0);
      -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "maxHeight");
      v18 = v14 <= v17;
      v19 = v15;
      v20 = v14;
    }
    objc_msgSend(v19, "setConstrainedMaxHeight:enabled:", v18, v20);

  }
  objc_msgSend(v44, "contentInset");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[CNContactContentUnitaryViewController insetsForContactTableView:](self, "insetsForContactTableView:", v44);
  if (v30 != v24 || v29 != v22 || v32 != v28 || v31 != v26)
  {
    v36 = v29;
    v37 = v30;
    v38 = v31;
    v39 = v32;
    -[CNContactContentUnitaryViewController scrollIndicatorInsetsForContactTableView:withContentInsets:](self, "scrollIndicatorInsetsForContactTableView:withContentInsets:", v44);
    -[CNContactContentUnitaryViewController updateTableView:contentInsetsTo:withScrollIndicatorInsets:](self, "updateTableView:contentInsetsTo:withScrollIndicatorInsets:", v44, v36, v37, v38, v39, v40, v41, v42, v43);
  }

}

- (id)platterBackBarButtonItem
{
  void *v3;
  _BOOL8 v4;

  -[CNContactContentUnitaryViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutDirection") == 1;

  return -[CNPlatterBackBarButtonItem initWithTarget:action:isRTL:]([CNPlatterBackBarButtonItem alloc], "initWithTarget:action:isRTL:", self, sel_popToPrevious_, v4);
}

- (UIEdgeInsets)insetsForContactTableView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  UIEdgeInsets result;

  v4 = a3;
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  if (!-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "minHeight");
    v7 = v9;

    -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "maxHeight");
    v6 = v11;

    if (v6 == 0.0)
    {
      v15 = *MEMORY[0x1E0DC49E8];
      v27 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v49 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v29 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
      goto LABEL_24;
    }
    if ((objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0
      && (-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0)
    {
      -[CNContactContentUnitaryViewController actionsWrapperView](self, "actionsWrapperView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v5 = v13;

    }
  }
  objc_msgSend(v4, "_systemContentInset");
  v15 = v5 + v6 - v14;
  objc_msgSend(v4, "bounds");
  v17 = v6 - v7 + v16;
  objc_msgSend(v4, "_systemContentInset");
  v19 = v17 - v18 - v15;
  objc_msgSend(v4, "_systemContentInset");
  v21 = v20;
  -[CNContactContentUnitaryViewController keyboardVerticalOverlap](self, "keyboardVerticalOverlap");
  if (v21 >= v22)
    v22 = v21;
  v23 = v19 - v22;
  objc_msgSend(v4, "contentSize");
  if (v23 - v24 >= 0.0)
    v25 = v23 - v24;
  else
    v25 = 0.0;
  objc_msgSend(v4, "contentInset");
  v27 = v26;
  v29 = v28;
  -[CNContactContentUnitaryViewController keyboardVerticalOverlap](self, "keyboardVerticalOverlap");
  if (v30 <= 0.0)
  {
    objc_msgSend(v4, "_systemContentInset");
    v48 = -v47;
    goto LABEL_21;
  }
  -[CNContactContentUnitaryViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "window");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[CNContactContentUnitaryViewController view](self, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "window");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bounds");
    v37 = v36;
    objc_msgSend(v4, "bounds");
    v39 = v38;

    v40 = 0.0;
    if (v37 <= v39)
      goto LABEL_20;
    -[CNContactContentUnitaryViewController view](self, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "window");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bounds");
    v44 = v43;
    objc_msgSend(v4, "bounds");
    v40 = v44 - v45;

    if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
      goto LABEL_20;
    -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "minTitleOffset");
    v40 = v40 - v46;
  }
  else
  {
    v40 = 0.0;
  }

LABEL_20:
  -[CNContactContentUnitaryViewController keyboardVerticalOverlap](self, "keyboardVerticalOverlap");
  v51 = v50;
  objc_msgSend(v4, "_systemContentInset");
  v48 = v40 + v51 - v52;
LABEL_21:
  if (v25 >= v48)
    v49 = v25;
  else
    v49 = v48;
LABEL_24:

  v53 = v15;
  v54 = v27;
  v55 = v49;
  v56 = v29;
  result.right = v56;
  result.bottom = v55;
  result.left = v54;
  result.top = v53;
  return result;
}

- (double)keyboardVerticalOverlap
{
  return self->_keyboardVerticalOverlap;
}

- (void)adjustPreferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  char v11;
  id v12;

  -[CNContactContentUnitaryViewController requiredSizeForVisibleTableView](self, "requiredSizeForVisibleTableView");
  v4 = v3;
  v6 = v5;
  -[CNContactContentUnitaryViewController preferredContentSize](self, "preferredContentSize");
  if (v4 != v8 || v6 != v7)
  {
    -[CNContactContentUnitaryViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v6);
    -[CNContactContentUnitaryViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[CNContactContentUnitaryViewController delegate](self, "delegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController preferredContentSize](self, "preferredContentSize");
      objc_msgSend(v12, "didChangePreferredContentSize:");

    }
  }
}

- (CGSize)requiredSizeForVisibleTableView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  double v11;
  double v12;
  CGSize result;

  -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");
  v5 = v4;
  objc_msgSend(v3, "contentInset");
  v7 = v6;
  -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CNContactContentUnitaryViewController hasPersonHeaderSectionForTableView:](self, "hasPersonHeaderSectionForTableView:", v8))
  {

    goto LABEL_5;
  }
  v9 = -[UIViewController ab_isInPopover](self, "ab_isInPopover");

  if (!v9)
  {
LABEL_5:
    *(double *)&v10 = 0.0;
    goto LABEL_6;
  }
  *(double *)&v10 = 400.0;
LABEL_6:

  v11 = *(double *)&v10;
  v12 = v5 + v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (BOOL)allowsEditPhoto
{
  return self->_allowsEditPhoto;
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setEditCommand:(id)a3
{
  objc_storeStrong((id *)&self->_editCommand, a3);
}

- (UIEdgeInsets)scrollIndicatorInsetsForContactTableView:(id)a3 withContentInsets:(UIEdgeInsets)a4
{
  CGFloat right;
  CGFloat left;
  double top;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  right = a4.right;
  left = a4.left;
  top = a4.top;
  v8 = a3;
  objc_msgSend(v8, "_systemContentInset");
  v10 = top + v9;
  -[CNContactContentUnitaryViewController keyboardVerticalOverlap](self, "keyboardVerticalOverlap");
  v12 = v11;
  objc_msgSend(v8, "_systemContentInset");
  v14 = v13;

  v15 = fmax(v12 - v14, 0.0);
  v16 = v10;
  v17 = left;
  v18 = right;
  result.right = v18;
  result.bottom = v15;
  result.left = v17;
  result.top = v16;
  return result;
}

- (NSArray)preEditLeftBarButtonItems
{
  return self->_preEditLeftBarButtonItems;
}

uint64_t __65__CNContactContentUnitaryViewController_sharedProfileStateOracle__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setupSharedProfileStateOracle");
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  CNContactView *v6;
  CNContactView *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = (CNContactView *)a3;
  v7 = v6;
  v8 = 0;
  if (!a4 && self->_editingContactView == v6)
  {
    v9 = *MEMORY[0x1E0D13848];
    -[CNContactContentViewController warningMessage](self, "warningMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    if ((v9 & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactView dequeueReusableHeaderFooterViewWithIdentifier:](v7, "dequeueReusableHeaderFooterViewWithIdentifier:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = *MEMORY[0x1E0D137F8];
      -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "phoneNumbers");
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setShouldDisplayWarningIcon:", (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 16))(v13, v15));

      objc_msgSend(v8, "warningText");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentViewController warningMessage](self, "warningMessage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v15) = objc_msgSend(v16, "isEqual:", v17);

      if ((v15 & 1) == 0)
      {
        -[CNContactContentViewController warningMessage](self, "warningMessage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setWarningText:", v18);

      }
    }
  }

  return v8;
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  if (-[CNContactContentUnitaryViewController isPersonHeaderIndexPath:forTableView:](self, "isPersonHeaderIndexPath:forTableView:", a5, a3))
  {
    -[CNContactContentUnitaryViewController removePersonHeaderViewControllerFromHierarchy](self, "removePersonHeaderViewControllerFromHierarchy");
  }
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  if (-[CNContactContentUnitaryViewController shouldShowVerifiedFooterInSection:inTableView:](self, "shouldShowVerifiedFooterInSection:inTableView:", a4, v6))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentViewController verifiedInfoMessage](self, "verifiedInfoMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttributedString:", v10);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)updateViewConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactContentUnitaryViewController;
  -[CNContactContentUnitaryViewController updateViewConstraints](&v3, sel_updateViewConstraints);
  -[CNContactContentUnitaryViewController setupConstraintsIfNeeded](self, "setupConstraintsIfNeeded");
}

- (void)setupConstraintsIfNeeded
{
  int v3;
  int v4;
  void *v5;
  int v6;

  v3 = -[CNContactContentUnitaryViewController isEditing](self, "isEditing");
  v4 = -[CNContactContentUnitaryViewController shouldDisplayAvatarHeaderView](self, "shouldDisplayAvatarHeaderView");
  -[CNContactContentUnitaryViewController activatedConstraints](self, "activatedConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count")
    || v3 != -[CNContactContentUnitaryViewController hasEditingConstraints](self, "hasEditingConstraints"))
  {

LABEL_4:
    -[CNContactContentUnitaryViewController setupViewHierarchyAndConstraints](self, "setupViewHierarchyAndConstraints");
    return;
  }
  v6 = -[CNContactContentUnitaryViewController hasAvatarConstraints](self, "hasAvatarConstraints");

  if (v4 != v6)
    goto LABEL_4;
}

- (void)loadContactViewControllerViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_class();
  objc_msgSend(v5, "cellIdentifierForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableCellWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController setNoteCell:](self, "setNoteCell:", v7);

  -[CNContactContentUnitaryViewController view](self, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v8);

}

- (void)setNoteCell:(id)a3
{
  objc_storeStrong((id *)&self->_noteCell, a3);
}

- (void)setupConstraints
{
  uint64_t v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
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
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
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
  void *v72;
  void *v73;
  void *v74;
  void *v75;
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
  double v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
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
  void *v117;
  void *v118;
  double v119;
  double v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  id v154;

  v3 = -[CNContactContentUnitaryViewController isEditing](self, "isEditing");
  v4 = -[CNContactContentUnitaryViewController shouldDisplayAvatarHeaderView](self, "shouldDisplayAvatarHeaderView");
  -[CNContactContentUnitaryViewController setHasEditingConstraints:](self, "setHasEditingConstraints:", v3);
  -[CNContactContentUnitaryViewController setHasAvatarConstraints:](self, "setHasAvatarConstraints:", v4);
  v5 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactContentUnitaryViewController activatedConstraints](self, "activatedConstraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivateConstraints:", v6);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v154 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if ((v3 & 1) == 0)
    {
      v7 = 0.0;
      v8 = 0.0;
      if (!-[CNContactContentViewController isSiri](self, "isSiri"))
      {
        -[CNContactContentUnitaryViewController actionsTopMargin](self, "actionsTopMargin");
        v8 = v9;
      }
      -[CNContactContentUnitaryViewController actionsBottomMargin](self, "actionsBottomMargin");
      v11 = v10;
      if (!-[CNContactContentViewController isSiri](self, "isSiri"))
        v7 = 8.0;
      if (-[CNContactContentUnitaryViewController allowsActionsModel](self, "allowsActionsModel"))
      {
        if (!-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
        {
          -[CNContactContentUnitaryViewController view](self, "view");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "leadingAnchor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactContentUnitaryViewController actionsWrapperView](self, "actionsWrapperView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "leadingAnchor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "constraintEqualToAnchor:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v154, "addObject:", v16);

          -[CNContactContentUnitaryViewController view](self, "view");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "trailingAnchor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactContentUnitaryViewController actionsWrapperView](self, "actionsWrapperView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "trailingAnchor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "constraintEqualToAnchor:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v154, "addObject:", v21);

          if ((objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
          {
            -[CNContactContentUnitaryViewController actionsWrapperView](self, "actionsWrapperView");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "topAnchor");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "bottomAnchor");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "constraintEqualToAnchor:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v154, "addObject:", v26);

          }
        }
        -[CNContactContentUnitaryViewController actionsWrapperView](self, "actionsWrapperView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setLayoutMargins:", v8, v7, v11, v7);

        -[CNContactContentUnitaryViewController view](self, "view");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "_cnui_contactStyle");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "sectionMaximumPlatterWidth");
        v31 = v30;
        v32 = *MEMORY[0x1E0CFAA78];
        -[CNContactInlineActionsViewController view](self->_actionsViewController, "view");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setMinimumLayoutSize:", v31, v32);

        -[CNContactContentUnitaryViewController actionsWrapperView](self, "actionsWrapperView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setNeedsLayout");

        -[CNContactContentUnitaryViewController actionsWrapperView](self, "actionsWrapperView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "layoutIfNeeded");

        if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
        {
          -[CNContactContentUnitaryViewController floatingActionsWrapperView](self, "floatingActionsWrapperView");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setLayoutMargins:", v8, v7, v11, v7);

          -[CNContactContentUnitaryViewController view](self, "view");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "_cnui_contactStyle");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "sectionMaximumPlatterWidth");
          v40 = v39;
          -[CNContactInlineActionsViewController view](self->_floatingActionsViewController, "view");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setMinimumLayoutSize:", v40, v32);

          -[CNContactContentUnitaryViewController floatingActionsWrapperView](self, "floatingActionsWrapperView");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setNeedsLayout");

          -[CNContactContentUnitaryViewController floatingActionsWrapperView](self, "floatingActionsWrapperView");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "layoutIfNeeded");

        }
      }
      if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
      {
        v44 = (void *)MEMORY[0x1E0CB3718];
        -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "maxHeight");
        objc_msgSend(v44, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v45, 8, 0, 0, 0, 1.0, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController setFloatingHeaderHeightConstraint:](self, "setFloatingHeaderHeightConstraint:", v48);

        -[CNContactContentUnitaryViewController floatingHeaderHeightConstraint](self, "floatingHeaderHeightConstraint");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "addObject:", v49);

        -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "leftAnchor");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController view](self, "view");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "leftAnchor");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "constraintEqualToAnchor:", v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "addObject:", v54);

        -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "rightAnchor");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController view](self, "view");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "rightAnchor");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "constraintEqualToAnchor:", v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "addObject:", v59);

        -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "topAnchor");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController view](self, "view");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "topAnchor");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "constraintEqualToAnchor:", v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "addObject:", v64);

      }
    }
    if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader")
      && -[CNContactContentUnitaryViewController isEditing](self, "isEditing")
      && !-[CNContactContentUnitaryViewController shouldDrawNavigationBar](self, "shouldDrawNavigationBar"))
    {
      -[CNContactContentUnitaryViewController editingFloatingCollapsedHeaderView](self, "editingFloatingCollapsedHeaderView");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "leftAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController view](self, "view");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "leftAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "constraintEqualToAnchor:", v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "addObject:", v69);

      -[CNContactContentUnitaryViewController editingFloatingCollapsedHeaderView](self, "editingFloatingCollapsedHeaderView");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "rightAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController view](self, "view");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "rightAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "constraintEqualToAnchor:", v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "addObject:", v74);

      -[CNContactContentUnitaryViewController editingFloatingCollapsedHeaderView](self, "editingFloatingCollapsedHeaderView");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "topAnchor");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController view](self, "view");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "topAnchor");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "constraintEqualToAnchor:", v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "addObject:", v79);

      -[CNContactContentUnitaryViewController editingFloatingCollapsedHeaderView](self, "editingFloatingCollapsedHeaderView");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "heightAnchor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController editingFloatingHeaderHeight](self, "editingFloatingHeaderHeight");
      objc_msgSend(v81, "constraintEqualToConstant:");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController setEditingFloatingHeaderHeightConstraint:](self, "setEditingFloatingHeaderHeightConstraint:", v82);

      -[CNContactContentUnitaryViewController editingFloatingHeaderHeightConstraint](self, "editingFloatingHeaderHeightConstraint");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "addObject:", v83);

    }
    if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader")
      && (-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0)
    {
      -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "heightAnchor");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController staticDisplayHeaderHeight](self, "staticDisplayHeaderHeight");
      objc_msgSend(v86, "constraintEqualToConstant:");
      v88 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v84 = (void *)MEMORY[0x1E0CB3718];
      -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "maxHeight");
      objc_msgSend(v84, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v85, 8, 0, 0, 0, 1.0, v87);
      v88 = objc_claimAutoreleasedReturnValue();
    }
    v89 = (void *)v88;
    -[CNContactContentUnitaryViewController setHeaderHeightConstraint:](self, "setHeaderHeightConstraint:", v88);

    -[CNContactContentUnitaryViewController headerHeightConstraint](self, "headerHeightConstraint");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "addObject:", v90);

    if (!-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
    {
      -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "topAnchor");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController view](self, "view");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "topAnchor");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "constraintEqualToAnchor:", v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "addObject:", v95);

    }
    -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "leftAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController view](self, "view");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "leftAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintEqualToAnchor:", v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "addObject:", v100);

    -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "rightAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController view](self, "view");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "rightAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "constraintEqualToAnchor:", v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "addObject:", v105);

    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "topAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController view](self, "view");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "topAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "constraintEqualToAnchor:", v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "addObject:", v110);

    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "bottomAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController view](self, "view");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "bottomAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "constraintEqualToAnchor:", v114);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "addObject:", v115);

    -[CNContactContentUnitaryViewController headerDropShadowView](self, "headerDropShadowView");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "superview");
    v117 = (void *)objc_claimAutoreleasedReturnValue();

    if (v117)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "scale");
      v120 = v119;

      -[CNContactContentUnitaryViewController headerDropShadowView](self, "headerDropShadowView");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "heightAnchor");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "constraintEqualToConstant:", 1.0 / v120);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "addObject:", v123);

      -[CNContactContentUnitaryViewController headerDropShadowView](self, "headerDropShadowView");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "bottomAnchor");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController headerDropShadowView](self, "headerDropShadowView");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "superview");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "bottomAnchor");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "constraintEqualToAnchor:", v128);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "addObject:", v129);

      -[CNContactContentUnitaryViewController headerDropShadowView](self, "headerDropShadowView");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "leftAnchor");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController headerDropShadowView](self, "headerDropShadowView");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "superview");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "leftAnchor");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "constraintEqualToAnchor:", v134);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "addObject:", v135);

      -[CNContactContentUnitaryViewController headerDropShadowView](self, "headerDropShadowView");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "rightAnchor");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController headerDropShadowView](self, "headerDropShadowView");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "superview");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "rightAnchor");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "constraintEqualToAnchor:", v140);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "addObject:", v141);

    }
  }
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "leftAnchor");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController view](self, "view");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "leftAnchor");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "constraintEqualToAnchor:", v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "addObject:", v146);

  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "rightAnchor");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController view](self, "view");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "rightAnchor");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "constraintEqualToAnchor:", v150);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "addObject:", v151);

  -[CNContactContentUnitaryViewController setActivatedConstraints:](self, "setActivatedConstraints:", v154);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v154);
  if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "updateConstraints");

    if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0)
    {
      -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "updateConstraints");

    }
  }

}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)CNContactContentUnitaryViewController;
  -[CNContactContentUnitaryViewController viewDidLayoutSubviews](&v33, sel_viewDidLayoutSubviews);
  -[CNContactContentUnitaryViewController _updateCachedLabelWidthsIfNeeded](self, "_updateCachedLabelWidthsIfNeeded");
  -[CNContactContentUnitaryViewController setupTableHeaderView](self, "setupTableHeaderView");
  v4 = v3;
  v6 = v5;
  -[CNContactContentUnitaryViewController initializeTableViewsForHeaderHeight](self, "initializeTableViewsForHeaderHeight");
  -[CNContactContentUnitaryViewController adjustPreferredContentSize](self, "adjustPreferredContentSize");
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableHeaderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "frame");
    if (v4 != v10 || v6 != v9)
    {
      -[CNContactContentUnitaryViewController contactView](self, "contactView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTableHeaderView:", v8);

    }
  }
  -[CNContactContentUnitaryViewController setupTableFooterView](self, "setupTableFooterView");
  -[CNContactContentUnitaryViewController focusOnFirstEditingItemIfNeeded](self, "focusOnFirstEditingItemIfNeeded");
  if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[CNContactContentUnitaryViewController contactViewBackgroundGradientLayer](self, "contactViewBackgroundGradientLayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

    -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frame");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    -[CNContactContentUnitaryViewController contactViewBackgroundView](self, "contactViewBackgroundView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);

  }
  -[CNContactContentUnitaryViewController pendingLayoutBlocks](self, "pendingLayoutBlocks");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "enumerateObjectsUsingBlock:", &__block_literal_global_388);

  -[CNContactContentUnitaryViewController setPendingLayoutBlocks:](self, "setPendingLayoutBlocks:", MEMORY[0x1E0C9AA60]);
}

- (CGSize)setupTableHeaderView
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  CGSize result;

  if (-[CNContactContentUnitaryViewController shouldDisplayAvatarHeaderView](self, "shouldDisplayAvatarHeaderView"))
  {
    if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
    {
      -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v7 = (void *)v3;
      goto LABEL_11;
    }
    if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0
      && objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
    {
      -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "backgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController actionsViewController](self, "actionsViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBackgroundColor:", v9);

      -[CNContactContentUnitaryViewController actionsWrapperView](self, "actionsWrapperView");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {
    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "customHeaderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CNContactContentUnitaryViewController contactView](self, "contactView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "customHeaderView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
  }
  v7 = 0;
LABEL_11:
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tableHeaderView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "needsUpdateConstraints");

  if (v7)
  {
    objc_msgSend(v7, "frame");
    v16 = v15;
    v18 = v17;
  }
  else
  {
    v16 = *MEMORY[0x1E0C9D820];
    v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTableHeaderView:", v7);

  if ((v14 & 1) == 0)
  {
    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "tableHeaderView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "needsUpdateConstraints");

    if (v22)
    {
      -[CNContactContentUnitaryViewController contactView](self, "contactView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "tableHeaderView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "updateConstraints");

    }
  }

  v25 = v16;
  v26 = v18;
  result.height = v26;
  result.width = v25;
  return result;
}

- (void)setupTableFooterView
{
  void *v3;
  void *v4;
  void *v5;
  CNContactViewFooterView *v6;
  CNContactViewFooterView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  CNContactViewFooterView *v19;

  if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) != 0
    || (-[CNContactContentUnitaryViewController contact](self, "contact"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "phonemeData"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v19 = (CNContactViewFooterView *)objc_claimAutoreleasedReturnValue();
    -[CNContactViewFooterView setTableFooterView:](v19, "setTableFooterView:", 0);
  }
  else
  {
    objc_opt_class();
    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tableFooterView");
    v19 = (CNContactViewFooterView *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v19;
    else
      v6 = 0;
    v7 = v6;

    if (!v7)
    {
      v19 = objc_alloc_init(CNContactViewFooterView);
      -[CNContactContentUnitaryViewController contactView](self, "contactView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTableFooterView:", v19);

    }
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactViewFooterView setContact:](v19, "setContact:", v9);

    -[CNContactViewFooterView label](v19, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    -[CNContactContentUnitaryViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutMargins");
    v16 = v13 - v15;
    -[CNContactContentUnitaryViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutMargins");
    objc_msgSend(v10, "sizeThatFits:", v16 - v18, 1.79769313e308);

    -[CNContactViewFooterView frame](v19, "frame");
    -[CNContactViewFooterView setFrame:](v19, "setFrame:");
  }

}

- (void)setPendingLayoutBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingLayoutBlocks, a3);
}

- (NSArray)pendingLayoutBlocks
{
  return self->_pendingLayoutBlocks;
}

- (void)focusOnFirstEditingItemIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing")
    && -[CNContactContentUnitaryViewController mode](self, "mode") == 3
    && !-[CNContactContentUnitaryViewController didSetFirstResponder](self, "didSetFirstResponder"))
  {
    -[CNContactContentUnitaryViewController setDidSetFirstResponder:](self, "setDidSetFirstResponder:", 1);
    -[CNContactContentUnitaryViewController nameEditingGroups](self, "nameEditingGroups");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "editingItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentUnitaryViewController indexPathOfEditingPropertyItem:](self, "indexPathOfEditingPropertyItem:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    objc_msgSend(v10, "firstResponderItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "becomeFirstResponder");
  }
}

- (UIView)contactViewBackgroundView
{
  return self->_contactViewBackgroundView;
}

- (CAGradientLayer)contactViewBackgroundGradientLayer
{
  return self->_contactViewBackgroundGradientLayer;
}

- (void)_updateCachedLabelWidthsIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[CNContactContentUnitaryViewController cachedLabelWidths](self, "cachedLabelWidths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (self->_editingContactView
      || (-[CNContactContentUnitaryViewController traitCollection](self, "traitCollection"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "userInterfaceIdiom"),
          v4,
          v5 == 3))
    {
      -[CNContactContentUnitaryViewController _updateCachedLabelWidths](self, "_updateCachedLabelWidths");
    }
  }
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  CNContactView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v6 = (CNContactView *)a3;
  -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", a4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_editingContactView == v6)
  {
    -[CNContactContentUnitaryViewController editingGroups](self, "editingGroups");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v13)
    {
      v11 = 35.0;
    }
    else
    {
      objc_opt_class();
      v11 = 0.0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        v14 = v7;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
        v16 = v15;

        if (objc_msgSend(v16, "valueEditingItemsCount") <= 1)
          v11 = 0.0;
        else
          v11 = *MEMORY[0x1E0DC53D8];

      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CNContactContentUnitaryViewController contact](self, "contact");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mainStoreLinkedContacts");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v9, "count") <= 1)
      {

      }
      else
      {
        -[CNContactContentUnitaryViewController cardGroupMembershipGroup](self, "cardGroupMembershipGroup");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          v11 = 44.0;
          goto LABEL_24;
        }
      }
    }
    if (-[CNContactView numberOfSections](v6, "numberOfSections") - 1 == a4)
    {
      -[CNContactContentUnitaryViewController contact](self, "contact");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "phonemeData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        v11 = 0.0;
      else
        v11 = 44.0;
    }
    else if (-[CNContactContentUnitaryViewController shouldShowVerifiedFooterInSection:inTableView:](self, "shouldShowVerifiedFooterInSection:inTableView:", a4, v6))
    {
      v11 = *MEMORY[0x1E0DC53D8];
    }
    else
    {
      v11 = 0.0;
    }
  }
LABEL_24:

  return v11;
}

- (BOOL)shouldShowVerifiedFooterInSection:(int64_t)a3 inTableView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v6 = a4;
  if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) != 0
    || (-[CNContactContentViewController verifiedInfoMessage](self, "verifiedInfoMessage"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    v11 = 0;
  }
  else
  {
    -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9)
    {
      v11 = -[CNContactContentUnitaryViewController tableView:shouldHaveFullLengthBottomSeparatorForSection:](self, "tableView:shouldHaveFullLengthBottomSeparatorForSection:", v6, a3);
    }
    else
    {
      -[CNContactContentUnitaryViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v8 == v10
         && (objc_msgSend(v8, "addSpacerFromPreviousGroup") & 1) == 0
         && -[CNContactContentUnitaryViewController tableView:shouldHaveFullLengthBottomSeparatorForSection:](self, "tableView:shouldHaveFullLengthBottomSeparatorForSection:", v6, a3);

    }
  }

  return v11;
}

- (NSArray)activatedConstraints
{
  return self->_activatedConstraints;
}

- (void)setupViewHierarchyIncludingAvatarHeader:(BOOL)a3 editing:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
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
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void *v48;
  id v49;
  uint64_t v50;
  _QWORD v51[2];

  v4 = a4;
  v5 = a3;
  v51[1] = *MEMORY[0x1E0C80C00];
  if (-[CNContactContentUnitaryViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[CNContactContentUnitaryViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
    {
      -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v5)
      {
        v51[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v9;
      }
      else
      {
        v50 = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v8;
      }
      objc_msgSend(v13, "addObjectsFromArray:", v12);

    }
    v14 = -[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader");
    if (v4)
    {
      if (v14)
      {
        if (self->_displayFloatingCollapsedHeaderView)
        {
          -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        if (-[CNContactContentUnitaryViewController shouldDrawNavigationBar](self, "shouldDrawNavigationBar"))
          goto LABEL_21;
        -[CNContactContentUnitaryViewController editingFloatingCollapsedHeaderView](self, "editingFloatingCollapsedHeaderView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v9;
      }
      else
      {
        if ((objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
        {
          -[CNContactContentUnitaryViewController actionsWrapperView](self, "actionsWrapperView");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v20);

        }
        if (!self->_displayHeaderView)
          goto LABEL_21;
        -[CNContactContentUnitaryViewController displayHeaderView](self, "displayHeaderView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v8;
      }
      objc_msgSend(v17, "addObject:", v16);

LABEL_21:
      -[CNContactContentUnitaryViewController editingHeaderView](self, "editingHeaderView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController headerDropShadowView](self, "headerDropShadowView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", v22);

      -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v23);

      -[CNContactContentUnitaryViewController editingContactView](self, "editingContactView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v9;
      goto LABEL_32;
    }
    if (v14)
    {
      -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v18);

      if (!self->_editingFloatingCollapsedHeaderView)
      {
LABEL_30:
        -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v35);

        if (!self->_editingContactView)
        {
LABEL_33:
          -[CNContactContentUnitaryViewController contactView](self, "contactView");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "panGestureRecognizer");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "view");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactContentUnitaryViewController contactView](self, "contactView");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "panGestureRecognizer");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "removeGestureRecognizer:", v40);

          -[CNContactContentUnitaryViewController view](self, "view");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactContentUnitaryViewController contactView](self, "contactView");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "panGestureRecognizer");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addGestureRecognizer:", v43);

          v45 = MEMORY[0x1E0C809B0];
          v46 = 3221225472;
          v47 = __89__CNContactContentUnitaryViewController_setupViewHierarchyIncludingAvatarHeader_editing___block_invoke;
          v48 = &unk_1E204F838;
          v49 = v7;
          v44 = v7;
          objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v45);
          objc_msgSend(v8, "enumerateObjectsUsingBlock:", &__block_literal_global_363, v45, v46, v47, v48);

          return;
        }
        -[CNContactContentUnitaryViewController editingContactView](self, "editingContactView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v8;
LABEL_32:
        objc_msgSend(v25, "addObject:", v24);

        goto LABEL_33;
      }
      -[CNContactContentUnitaryViewController editingFloatingCollapsedHeaderView](self, "editingFloatingCollapsedHeaderView");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
      {
        -[CNContactContentUnitaryViewController actionsWrapperView](self, "actionsWrapperView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v26);

        -[CNContactContentUnitaryViewController view](self, "view");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "_cnui_contactStyle");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "usesOpaqueBackground");

        if (v29)
        {
          -[CNContactContentUnitaryViewController actionsWrapperView](self, "actionsWrapperView");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactContentUnitaryViewController headerDropShadowView](self, "headerDropShadowView");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addSubview:", v31);

        }
      }
      if (!-[CNContactContentUnitaryViewController allowsActionsModel](self, "allowsActionsModel"))
      {
        -[CNContactContentUnitaryViewController actionsViewController](self, "actionsViewController");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "view");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "removeFromSuperview");

      }
      if (!self->_editingHeaderView)
        goto LABEL_30;
      -[CNContactContentUnitaryViewController editingHeaderView](self, "editingHeaderView");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v34 = (void *)v19;
    objc_msgSend(v8, "addObject:", v19);

    goto LABEL_30;
  }
}

- (void)setHeaderHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_headerHeightConstraint, a3);
}

- (void)setHasEditingConstraints:(BOOL)a3
{
  self->_hasEditingConstraints = a3;
}

- (void)setHasAvatarConstraints:(BOOL)a3
{
  self->_hasAvatarConstraints = a3;
}

- (void)setFloatingHeaderHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_floatingHeaderHeightConstraint, a3);
}

- (void)setActivatedConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activatedConstraints, a3);
}

- (BOOL)allowsActionsModel
{
  return self->_allowsActionsModel;
}

- (double)actionsTopMargin
{
  int v3;
  double v4;
  void *v5;

  v3 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  if (!-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader") || v3)
  {
    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "usesInsetPlatterStyle"))
      v4 = 20.0;
    else
      v4 = 10.0;

  }
  else
  {
    v4 = 14.0;
    if (!-[CNContactContentUnitaryViewController isPadRegularHorizontalSize](self, "isPadRegularHorizontalSize"))
    {
      if (-[CNContactContentUnitaryViewController isOrientationPhoneLandscape](self, "isOrientationPhoneLandscape"))
        return 14.0;
      else
        return 17.0;
    }
  }
  return v4;
}

- (double)actionsBottomMargin
{
  int v3;
  double v4;
  void *v5;

  v3 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  if (!-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader") || v3)
  {
    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "usesInsetPlatterStyle"))
      v4 = 16.0;
    else
      v4 = 15.0;

  }
  else if (-[CNContactContentUnitaryViewController isPadRegularHorizontalSize](self, "isPadRegularHorizontalSize"))
  {
    return 36.0;
  }
  else if (-[CNContactContentUnitaryViewController isOrientationPhoneLandscape](self, "isOrientationPhoneLandscape"))
  {
    return 9.0;
  }
  else
  {
    return 17.0;
  }
  return v4;
}

uint64_t __70__CNContactContentUnitaryViewController_setContact_shouldScrollToTop___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resumeBackgroundScheduler");
}

- (void)_updateUserActivity
{
  NSObject *v3;
  void *v4;
  CNContactContentUnitaryViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  CNContactContentUnitaryViewController *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((CNUIIsContacts() || CNUIIsMobilePhone())
    && (-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0)
  {
    CNUILogContactCard();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleIdentifier");
      v5 = (CNContactContentUnitaryViewController *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v5;
      _os_log_impl(&dword_18AC56000, v3, OS_LOG_TYPE_INFO, "Activity continuity - running in %@", (uint8_t *)&v17, 0xCu);

    }
    -[CNContactContentUnitaryViewController activityManager](self, "activityManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "makeActivityAdvertisingViewingOfContact:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentUnitaryViewController userActivity](self, "userActivity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {

      if (!v10)
      {
        -[CNContactContentUnitaryViewController setUserActivity:](self, "setUserActivity:", v8);
        -[CNContactContentUnitaryViewController userActivity](self, "userActivity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "becomeCurrent");

        CNUILogContactCard();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          -[CNContactContentUnitaryViewController userActivity](self, "userActivity");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138412546;
          v18 = self;
          v19 = 2112;
          v20 = v13;
          _os_log_impl(&dword_18AC56000, v12, OS_LOG_TYPE_INFO, "Activity continuity -  %@ created %@", (uint8_t *)&v17, 0x16u);

        }
      }
      -[CNContactContentUnitaryViewController userActivity](self, "userActivity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setNeedsSave:", 1);

    }
    else
    {
      objc_msgSend(v9, "resignCurrent");

      CNUILogContactCard();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        -[CNContactContentUnitaryViewController userActivity](self, "userActivity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412546;
        v18 = self;
        v19 = 2112;
        v20 = v16;
        _os_log_impl(&dword_18AC56000, v15, OS_LOG_TYPE_INFO, "Activity continuity -  %@ removed %@", (uint8_t *)&v17, 0x16u);

      }
      -[CNContactContentUnitaryViewController setUserActivity:](self, "setUserActivity:", 0);
    }

  }
}

- (void)updateUserActivityState:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNContactContentUnitaryViewController activityManager](self, "activityManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateUserActivityState:withContentsOfContact:", v4, v5);

}

- (CNUIUserActivityManager)activityManager
{
  return self->_activityManager;
}

uint64_t __89__CNContactContentUnitaryViewController_setupViewHierarchyIncludingAvatarHeader_editing___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertSubview:atIndex:", a2, 0);
}

uint64_t __89__CNContactContentUnitaryViewController_setupViewHierarchyIncludingAvatarHeader_editing___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

uint64_t __64__CNContactContentUnitaryViewController__setupSuggestionActions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSuggested");
}

- (void)setContact:(id)a3
{
  -[CNContactContentUnitaryViewController setContact:shouldScrollToTop:](self, "setContact:shouldScrollToTop:", a3, 1);
}

- (void)setAllowsEditPhoto:(BOOL)a3
{
  -[CNContactContentUnitaryViewController setAllowsEditPhoto:preservingChanges:](self, "setAllowsEditPhoto:preservingChanges:", a3, 0);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int64_t v7;

  v4 = a3;
  -[CNContactContentUnitaryViewController _currentGroupsForTableView:](self, "_currentGroupsForTableView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = -[CNContactContentUnitaryViewController additionalTopSectionsCountForTableView:](self, "additionalTopSectionsCountForTableView:", v4);

  return v7 + v6;
}

- (void)headerView:(id)a3 didSetBackgroundAsGradientColors:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  if (self->_staticDisplayHeaderView == a3)
  {
    v7 = v6;
    -[CNContactContentUnitaryViewController setHeaderViewBackgroundColors:](self, "setHeaderViewBackgroundColors:", v6);
    if (-[CNContactContentUnitaryViewController shouldSetBackgroundColorToMatchHeader](self, "shouldSetBackgroundColorToMatchHeader"))
    {
      -[CNContactContentUnitaryViewController setContactViewBackgroundToMatchHeader](self, "setContactViewBackgroundToMatchHeader");
    }
    else
    {
      -[CNContactHeaderCollapsedView updateBackgroundWithGradientColors:horizontal:](self->_displayFloatingCollapsedHeaderView, "updateBackgroundWithGradientColors:horizontal:", v7, 0);
    }
    v6 = v7;
  }

}

- (void)setHeaderViewBackgroundColors:(id)a3
{
  objc_storeStrong((id *)&self->_headerViewBackgroundColors, a3);
}

- (void)headerView:(id)a3 didSetNameLabelColor:(id)a4
{
  id v6;
  int *v7;
  CNContactHeaderStaticDisplayView *v8;

  v8 = (CNContactHeaderStaticDisplayView *)a3;
  v6 = a4;
  if (self->_staticDisplayHeaderView == v8)
  {
    v7 = &OBJC_IVAR___CNContactContentUnitaryViewController__actionsViewController;
    goto LABEL_5;
  }
  if ((CNContactHeaderStaticDisplayView *)self->_displayFloatingCollapsedHeaderView == v8)
  {
    v7 = &OBJC_IVAR___CNContactContentUnitaryViewController__floatingActionsViewController;
LABEL_5:
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v7), "setPosterTintColor:", v6);
  }

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  if (-[CNContactContentUnitaryViewController isPersonHeaderIndexPath:forTableView:](self, "isPersonHeaderIndexPath:forTableView:", v9, v23))
  {
    -[CNContactContentUnitaryViewController personHeaderViewController](self, "personHeaderViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didMoveToParentViewController:", self);

  }
  objc_opt_class();
  v11 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_opt_class();
  -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", objc_msgSend(v9, "section"), v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (v13)
  {
    v17 = objc_msgSend(v9, "row");
    v18 = objc_msgSend(v23, "numberOfRowsInSection:", objc_msgSend(v9, "section"));
    if (v16
      && v17 < v18 - 1
      && (-[CNContactContentUnitaryViewController displayContactView](self, "displayContactView"),
          v19 = (id)objc_claimAutoreleasedReturnValue(),
          v19,
          v19 == v23))
    {
      -[CNContactContentUnitaryViewController environment](self, "environment");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setShowSeparator:", objc_msgSend(v20, "runningInContactsAppOniPad"));

    }
    else
    {
      objc_msgSend(v13, "setShowSeparator:", 1);
    }
  }
  -[CNContactContentUnitaryViewController editingContactView](self, "editingContactView");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (v21 == v23)
  {
    -[CNContactContentUnitaryViewController editingContactView](self, "editingContactView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "separatorInsetForCell:", v11);
    objc_msgSend(v11, "setSeparatorInset:");

  }
}

- (void)setupWithOptions:(id)a3 readyBlock:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  NSString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  dispatch_time_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _BOOL8 v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  _QWORD block[5];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  __int128 buf;
  const __CFString *v63;
  const __CFString *v64;
  const __CFString *v65;
  const __CFString *v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  const __CFString *v71;
  const __CFString *v72;
  const __CFString *v73;
  const __CFString *v74;
  const __CFString *v75;
  const __CFString *v76;
  const __CFString *v77;
  const __CFString *v78;
  const __CFString *v79;
  const __CFString *v80;
  const __CFString *v81;
  const __CFString *v82;
  const __CFString *v83;
  const __CFString *v84;
  const __CFString *v85;
  const __CFString *v86;
  const __CFString *v87;
  const __CFString *v88;
  const __CFString *v89;
  const __CFString *v90;
  const __CFString *v91;
  const __CFString *v92;
  const __CFString *v93;
  const __CFString *v94;
  const __CFString *v95;
  const __CFString *v96;
  const __CFString *v97;
  const __CFString *v98;
  const __CFString *v99;
  const __CFString *v100;
  const __CFString *v101;
  const __CFString *v102;
  const __CFString *v103;
  const __CFString *v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  CNUILogContactCard();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_debug_impl(&dword_18AC56000, v8, OS_LOG_TYPE_DEBUG, "setupWithOptions: %@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Properties"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactContentUnitaryViewController isOutOfProcess](self, "isOutOfProcess"))
  {
    -[CNContactContentUnitaryViewController setOutOfProcessSetupComplete:](self, "setOutOfProcessSetupComplete:", 0);
    if (objc_msgSend(MEMORY[0x1E0C97200], "suggestionsEnabled"))
      v10 = 3;
    else
      v10 = 1;
    -[CNContactContentUnitaryViewController managedConfiguration](self, "managedConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x1E0C97298]);
      -[CNContactContentUnitaryViewController environment](self, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cnEnvironment");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController managedConfiguration](self, "managedConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v12, "initWithEnvironment:options:managedConfiguration:", v14, v10, v15);
      -[CNContactContentUnitaryViewController setContactStore:](self, "setContactStore:", v16);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C97298], "storeWithOptions:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController setContactStore:](self, "setContactStore:", v13);
    }

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("showContactPhotoPosterCell"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController setShowContactPhotoPosterCell:](self, "setShowContactPhotoPosterCell:", objc_msgSend(v17, "BOOLValue"));

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("runningPPT"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController setRunningPPT:](self, "setRunningPPT:", objc_msgSend(v18, "BOOLValue"));

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("showingMeContact"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController setShowingMeContact:](self, "setShowingMeContact:", objc_msgSend(v19, "BOOLValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ignoresParentalRestrictions"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentViewController setIgnoresParentalRestrictions:](self, "setIgnoresParentalRestrictions:", objc_msgSend(v20, "BOOLValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("prohibitedPropertyKeys"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController setProhibitedPropertyKeys:](self, "setProhibitedPropertyKeys:", v21);

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("warningMessage"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentViewController setWarningMessage:](self, "setWarningMessage:", v22);

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  *(_QWORD *)&buf = CFSTR("allowsDeletion");
  *((_QWORD *)&buf + 1) = CFSTR("allowsCardActions");
  v63 = CFSTR("alwaysEditing");
  v64 = CFSTR("personHeaderView");
  v65 = CFSTR("allowsActions");
  v66 = CFSTR("verifiedInfoMessage");
  v67 = CFSTR("allowsEditInApp");
  v68 = CFSTR("shouldShowLinkedContacts");
  v69 = CFSTR("parentContainer");
  v70 = CFSTR("layoutPositionallyAfterNavBar");
  v71 = CFSTR("mode");
  v72 = CFSTR("allowsDisplayModePickerActions");
  v73 = CFSTR("allowsAddToFavorites");
  v74 = CFSTR("ignoresParentalRestrictions");
  v75 = CFSTR("parentGroup");
  v76 = CFSTR("primaryProperty");
  v77 = CFSTR("allowsAddingToAddressBook");
  v78 = CFSTR("alternateName");
  v79 = CFSTR("allowsEditPhoto");
  v80 = CFSTR("allowsNamePicking");
  v81 = CFSTR("showsInlineActions");
  v82 = CFSTR("showsSharedProfile");
  v83 = CFSTR("showsGroupMembership");
  v84 = CFSTR("displayedProperties");
  v85 = CFSTR("editingProposedInformation");
  v86 = CFSTR("originalContacts");
  v87 = CFSTR("allowsContactBlocking");
  v88 = CFSTR("allowsContactBlockingAndReporting");
  v89 = CFSTR("allowsSharing");
  v90 = CFSTR("highlightedProperties");
  v91 = CFSTR("allowsConferencing");
  v92 = CFSTR("recentsData");
  v93 = CFSTR("showingMeContact");
  v94 = CFSTR("runningPPT");
  v95 = CFSTR("importantMessage");
  v96 = CFSTR("allowsEditing");
  v97 = CFSTR("personHeaderViewController");
  v98 = CFSTR("personHeaderViewDelegate");
  v99 = CFSTR("shouldDrawNavigationBar");
  v100 = CFSTR("forcesTransparentBackground");
  v101 = CFSTR("usesBrandedCallHeaderFormat");
  v102 = CFSTR("shouldShowSharedProfileBanner");
  v103 = CFSTR("message");
  v104 = CFSTR("contact");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &buf, 44);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v58 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
          -[CNContactContentUnitaryViewController setValue:forKey:](self, "setValue:forKey:", v29, v28);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    }
    while (v25);
  }

  if (-[CNContactContentUnitaryViewController isHeaderViewPhotoProhibited](self, "isHeaderViewPhotoProhibited"))
    -[CNContactContentUnitaryViewController setAllowsEditPhoto:](self, "setAllowsEditPhoto:", 0);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("forcesTransparentBackground"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  self->_forcesTransparentBackground = objc_msgSend(v30, "BOOLValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("usesBrandedCallHeaderFormat"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController setUsesBrandedCallHeaderFormat:](self, "setUsesBrandedCallHeaderFormat:", objc_msgSend(v31, "BOOLValue"));

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("highlightedPropertyImportant"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController setHighlightedPropertyImportant:](self, "setHighlightedPropertyImportant:", objc_msgSend(v32, "BOOLValue"));

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("shouldShowSharedProfileBanner"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController setShouldShowSharedProfileBanner:](self, "setShouldShowSharedProfileBanner:", objc_msgSend(v33, "BOOLValue"));

  if (-[CNContactContentViewController alwaysEditing](self, "alwaysEditing")
    || (objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("isEditing")),
        v34 = (void *)objc_claimAutoreleasedReturnValue(),
        v35 = objc_msgSend(v34, "BOOLValue"),
        v34,
        v35))
  {
    -[CNContactContentUnitaryViewController setEditing:animated:](self, "setEditing:animated:", 1, 0);
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("mainScreenPeripheryInsets"));
  v36 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactContentUnitaryViewController isOutOfProcess](self, "isOutOfProcess")
    && ((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0)
  {
    self->_peripheryInsets = UIEdgeInsetsFromString(v36);
  }
  if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
  {
    -[CNContactContentUnitaryViewController cardStaticIdentityGroup](self, "cardStaticIdentityGroup");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("staticIdentity"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v38 && objc_msgSend(v38, "length"))
      {
        -[CNContactContentUnitaryViewController addStaticIdentity:](self, "addStaticIdentity:", v39);
        -[CNContactContentUnitaryViewController setDidLookUpStaticIdentity:](self, "setDidLookUpStaticIdentity:", 1);
        -[CNContactContentUnitaryViewController cardStaticIdentityGroup](self, "cardStaticIdentityGroup");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addIdentity:isNew:", v39, 0);

        v41 = dispatch_time(0, 400000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __69__CNContactContentUnitaryViewController_setupWithOptions_readyBlock___block_invoke;
        block[3] = &unk_1E204F648;
        block[4] = self;
        dispatch_after(v41, MEMORY[0x1E0C80D38], block);
      }

    }
    if (!-[CNContactContentUnitaryViewController didLookUpStaticIdentity](self, "didLookUpStaticIdentity"))
      -[CNContactContentUnitaryViewController _lookupStaticIdentity](self, "_lookupStaticIdentity");
  }
  if (-[CNContactContentUnitaryViewController isOutOfProcess](self, "isOutOfProcess"))
  {
    -[CNContactContentUnitaryViewController setOutOfProcessSetupComplete:](self, "setOutOfProcessSetupComplete:", 1);
    -[CNContactContentUnitaryViewController setNeedsReloadLazy](self, "setNeedsReloadLazy");
    -[CNContactContentUnitaryViewController reloadDataIfNeeded](self, "reloadDataIfNeeded");
    if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
    {
      -[CNContactContentUnitaryViewController staticDisplayHeaderView](self, "staticDisplayHeaderView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "updateForShowingNavBar:", -[CNContactContentUnitaryViewController layoutPositionallyAfterNavBar](self, "layoutPositionallyAfterNavBar"));

      -[CNContactContentUnitaryViewController staticDisplayHeaderView](self, "staticDisplayHeaderView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController mutableContactForHeaderView](self, "mutableContactForHeaderView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "updateWithNewContact:", v44);

      -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "updateForShowingNavBar:", -[CNContactContentUnitaryViewController layoutPositionallyAfterNavBar](self, "layoutPositionallyAfterNavBar"));

      -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
    }
    else
    {
      -[CNContactContentUnitaryViewController displayHeaderView](self, "displayHeaderView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "updateForShowingNavBar:", -[CNContactContentUnitaryViewController layoutPositionallyAfterNavBar](self, "layoutPositionallyAfterNavBar"));

      -[CNContactContentUnitaryViewController displayHeaderView](self, "displayHeaderView");
    }
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController mutableContactForHeaderView](self, "mutableContactForHeaderView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "updateWithNewContact:", v48);

    v49 = -[CNContactContentUnitaryViewController shouldShowGemini](self, "shouldShowGemini");
    if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
      -[CNContactContentUnitaryViewController staticDisplayHeaderView](self, "staticDisplayHeaderView");
    else
      -[CNContactContentUnitaryViewController displayHeaderView](self, "displayHeaderView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setShouldShowGemini:", v49);

    -[CNContactContentUnitaryViewController createCardEditingGeminiGroupIfNeeded](self, "createCardEditingGeminiGroupIfNeeded");
    -[CNContactContentUnitaryViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setShouldShowGemini:", v49);

    if (self->_editingHeaderView)
    {
      -[CNContactContentUnitaryViewController editingHeaderView](self, "editingHeaderView");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "updateForShowingNavBar:", -[CNContactContentUnitaryViewController layoutPositionallyAfterNavBar](self, "layoutPositionallyAfterNavBar"));

      -[CNContactContentUnitaryViewController editingHeaderView](self, "editingHeaderView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController mutableContactForHeaderView](self, "mutableContactForHeaderView");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "updateWithNewContact:", v54);

    }
    -[CNContactContentUnitaryViewController updateEditNavigationItemsAnimated:](self, "updateEditNavigationItemsAnimated:", 0);
    v55 = -[CNContactContentUnitaryViewController applyContactStyle](self, "applyContactStyle");
  }
  if (v7)
    v7[2](v7, 0);

}

- (void)setUsesBrandedCallHeaderFormat:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (self->_usesBrandedCallHeaderFormat != a3
    || -[CNContactHeaderDisplayView usesBrandedCallFormat](self->_displayHeaderView, "usesBrandedCallFormat") != a3
    || -[CNContactHeaderStaticDisplayView usesBrandedCallFormat](self->_staticDisplayHeaderView, "usesBrandedCallFormat") != v3)
  {
    self->_usesBrandedCallHeaderFormat = v3;
    -[CNContactHeaderDisplayView setUsesBrandedCallFormat:](self->_displayHeaderView, "setUsesBrandedCallFormat:", v3);
    -[CNContactHeaderStaticDisplayView setUsesBrandedCallFormat:](self->_staticDisplayHeaderView, "setUsesBrandedCallFormat:", v3);
  }
}

- (void)setShowingMeContact:(BOOL)a3
{
  self->_showingMeContact = a3;
}

- (void)setShouldShowSharedProfileBanner:(BOOL)a3
{
  id v3;

  if (self->_shouldShowSharedProfileBanner != a3)
  {
    self->_shouldShowSharedProfileBanner = a3;
    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

  }
}

- (void)setRunningPPT:(BOOL)a3
{
  self->_runningPPT = a3;
}

- (void)setProhibitedPropertyKeys:(id)a3
{
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, a3);
}

- (void)setHighlightedPropertyImportant:(BOOL)a3
{
  self->_highlightedPropertyImportant = a3;
}

- (id)_addFavoriteActionWithConferencing:(BOOL)a3 telephony:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  CNContactAddFavoriteAction *v10;
  void *v11;
  void *v12;
  void *v13;
  CNContactAddFavoriteAction *v14;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0C966A8];
  v16[0] = *MEMORY[0x1E0C967C0];
  v16[1] = v5;
  v6 = *MEMORY[0x1E0C96740];
  v16[2] = *MEMORY[0x1E0C96868];
  v16[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController _propertyGroupsForKeys:](self, "_propertyGroupsForKeys:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentUnitaryViewController _allDisplayPropertyItemsFromGroups:](self, "_allDisplayPropertyItemsFromGroups:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [CNContactAddFavoriteAction alloc];
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController environment](self, "environment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inProcessFavorites");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CNContactAddFavoriteAction initWithContact:propertyItems:favorites:](v10, "initWithContact:propertyItems:favorites:", v11, v9, v13);

  -[CNContactAction setDelegate:](v14, "setDelegate:", self);
  return v14;
}

- (id)_allDisplayPropertyItemsFromGroups:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v9, "displayItems");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v4, "addObject:", v15);
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)_propertyGroupsForKeys:(id)a3
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        -[CNContactContentUnitaryViewController propertyGroups](self, "propertyGroups", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_loadDisplayGroups
{
  __objc2_class **v2;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v74;
  char v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController cardTopGroup](self, "cardTopGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = v4;
  if (v7)
  {
    -[CNContactContentUnitaryViewController cardTopGroup](self, "cardTopGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v9);

  }
  if (-[CNContactContentUnitaryViewController allowsNamePicking](self, "allowsNamePicking"))
  {
    -[CNContactContentUnitaryViewController namePickingGroup](self, "namePickingGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

  }
  -[CNContactContentUnitaryViewController cardTopGroup](self, "cardTopGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CNContactContentUnitaryViewController _addGroupsInArray:afterGroup:](self, "_addGroupsInArray:afterGroup:", v4, v11);

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  -[CNContactContentUnitaryViewController displayedProperties](self, "displayedProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
  v76 = v4;
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v86;
    v80 = *MEMORY[0x1E0C96668];
    v78 = *(_QWORD *)v86;
    v79 = *MEMORY[0x1E0C96860];
    v2 = &off_1E203F000;
    v77 = v13;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v86 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
        if ((objc_msgSend(v18, "isEqualToString:", v80) & 1) == 0)
        {
          if (!objc_msgSend(v18, "isEqualToString:", v79))
            goto LABEL_16;
          -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[CNContactContentUnitaryViewController hasSharedProfileBannerSectionForTableView:](self, "hasSharedProfileBannerSectionForTableView:", v19);

          if (!v20)
          {
            if (-[CNContactContentUnitaryViewController shouldShowSharedProfileRow](self, "shouldShowSharedProfileRow"))
            {
              if (-[CNContactContentUnitaryViewController showingMeContact](self, "showingMeContact"))
              {
                -[CNContactContentUnitaryViewController meCardSharedProfileGroup](self, "meCardSharedProfileGroup");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "_cn_addNonNilObject:", v21);
LABEL_30:

                continue;
              }
LABEL_16:
              -[CNContactContentUnitaryViewController propertyGroups](self, "propertyGroups");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "objectForKeyedSubscript:", v18);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v21, "displayItems");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v23, "count"))
              {
                -[CNContactContentViewController primaryProperty](self, "primaryProperty");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "property");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v24, "isEqualToString:", v25);

                v13 = v77;
                if ((v26 & 1) == 0)
                {
                  objc_msgSend(v8, "addObject:", v21);
                  v83 = 0u;
                  v84 = 0u;
                  v81 = 0u;
                  v82 = 0u;
                  objc_msgSend(v21, "displayItems");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
                  if (v27)
                  {
                    v28 = v27;
                    v29 = *(_QWORD *)v82;
                    do
                    {
                      for (j = 0; j != v28; ++j)
                      {
                        if (*(_QWORD *)v82 != v29)
                          objc_enumerationMutation(v23);
                        v31 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                          objc_msgSend(v31, "setDelegate:", self);
                      }
                      v28 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
                    }
                    while (v28);
                    v8 = v76;
                    v13 = v77;
                  }
                  goto LABEL_28;
                }
              }
              else
              {
LABEL_28:

              }
              v32 = -[CNContactContentUnitaryViewController _addGroupsInArray:afterGroup:](self, "_addGroupsInArray:afterGroup:", v8, v21);
              v16 = v78;
              goto LABEL_30;
            }
          }
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
    }
    while (v15);
  }

  -[CNContactContentUnitaryViewController cardBottomGroup](self, "cardBottomGroup");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "actions");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v8;
  v36 = objc_msgSend(v34, "count");

  if (v36)
  {
    -[CNContactContentUnitaryViewController cardBottomGroup](self, "cardBottomGroup");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v37);

  }
  -[CNContactContentUnitaryViewController cardBottomGroup](self, "cardBottomGroup");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController _addGroupsInArray:afterGroup:](self, "_addGroupsInArray:afterGroup:", v35, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[CNContactContentUnitaryViewController hideCardActions](self, "hideCardActions"))
  {
    -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "actions");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "count");

    if (v42)
    {
      -[CNContactContentUnitaryViewController cardBottomGroup](self, "cardBottomGroup");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "actions");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v44, "count"))
      {
        if (v39)
        {
          objc_msgSend(v39, "actions");
          v2 = (__objc2_class **)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v2, "count"))
            goto LABEL_42;
        }
        -[CNContactContentViewController primaryProperty](self, "primaryProperty");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v45)
        {
          -[CNContactContentUnitaryViewController contact](self, "contact");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = objc_msgSend(v74, "isSuggested");

          if (v39)
          if ((v75 & 1) == 0)
          {
            -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v46;
            v48 = 0;
            goto LABEL_45;
          }
LABEL_44:
          -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v46;
          v48 = 1;
LABEL_45:
          objc_msgSend(v46, "setAddSpacerFromPreviousGroup:", v48);

          -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "addObject:", v49);

          goto LABEL_46;
        }

        if (v39)
LABEL_42:

      }
      goto LABEL_44;
    }
  }
LABEL_46:
  -[CNContactContentUnitaryViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
  v50 = objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    v51 = (void *)v50;
    -[CNContactContentUnitaryViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "actionItems");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "count");

    if (v54)
    {
      -[CNContactContentUnitaryViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "addObject:", v55);

    }
  }
  if (!-[CNContactContentUnitaryViewController hideCardActions](self, "hideCardActions"))
  {
    -[CNContactContentUnitaryViewController cardShareLocationGroup](self, "cardShareLocationGroup");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "actionItems");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "count");

    if (v58)
    {
      -[CNContactContentUnitaryViewController cardShareLocationGroup](self, "cardShareLocationGroup");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "addObject:", v59);

    }
  }
  -[CNContactContentUnitaryViewController cardFooterGroup](self, "cardFooterGroup");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "actions");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "count");

  if (v62)
  {
    -[CNContactContentUnitaryViewController cardFooterGroup](self, "cardFooterGroup");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "addObject:", v63);

  }
  if (-[CNContactContentUnitaryViewController isSuggestedContact](self, "isSuggestedContact")
    || -[CNContactContentUnitaryViewController allowsContactBlocking](self, "allowsContactBlocking")
    || -[CNContactContentUnitaryViewController allowsContactBlockingAndReporting](self, "allowsContactBlockingAndReporting"))
  {
    -[CNContactContentUnitaryViewController cardBlockContactGroup](self, "cardBlockContactGroup");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "actions");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "count");

    if (v66)
    {
      v67 = -[CNContactContentUnitaryViewController showContactBlockingFirst](self, "showContactBlockingFirst");
      -[CNContactContentUnitaryViewController cardBlockContactGroup](self, "cardBlockContactGroup");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v68;
      if (v67)
      {
        objc_msgSend(v68, "setAddSpacerFromPreviousGroup:", 0);

        -[CNContactContentUnitaryViewController cardBlockContactGroup](self, "cardBlockContactGroup");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "insertObject:atIndex:", v69, 0);
      }
      else
      {
        objc_msgSend(v76, "addObject:", v68);
      }

    }
  }
  -[CNContactContentUnitaryViewController cardLinkedCardsGroup](self, "cardLinkedCardsGroup");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    -[CNContactContentUnitaryViewController cardLinkedCardsGroup](self, "cardLinkedCardsGroup");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "addObject:", v71);

  }
  if (-[CNContactContentUnitaryViewController showsGroupMembership](self, "showsGroupMembership"))
  {
    -[CNContactContentUnitaryViewController cardGroupMembershipGroup](self, "cardGroupMembershipGroup");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "_cn_addNonNilObject:", v72);

  }
  return v76;
}

- (id)_addGroupsInArray:(id)a3 afterGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CNContactContentUnitaryViewController groupsAfterGroup](self, "groupsAfterGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14++), (_QWORD)v17);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    objc_msgSend(v10, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSMutableDictionary)groupsAfterGroup
{
  return self->_groupsAfterGroup;
}

BOOL __81__CNContactContentUnitaryViewController__addMedicalIDGroupAnimated_forTableView___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _BOOL8 v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cardGameCenterActionGroup");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v3)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cardShareLocationGroup");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 == v3)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "cardFooterGroup");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v3)
      {
        v9 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "cardBlockContactGroup");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        if (v7 == v3)
        {
          v9 = 1;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "cardLinkedCardsGroup");
          v8 = (id)objc_claimAutoreleasedReturnValue();
          v9 = v8 == v3;

        }
      }

    }
  }

  return v9;
}

- (CNCardLinkedCardsGroup)cardLinkedCardsGroup
{
  return self->_cardLinkedCardsGroup;
}

- (id)cardFooterGroup
{
  return self->_cardFooterGroup;
}

- (CNCardGroup)cardBottomGroup
{
  return self->_cardBottomGroup;
}

- (BOOL)hideCardActions
{
  return self->_hideCardActions;
}

- (CNCardGroup)cardTopGroup
{
  return self->_cardTopGroup;
}

- (CNCardGroupMembershipGroup)cardGroupMembershipGroup
{
  return self->_cardGroupMembershipGroup;
}

- (BOOL)allowsContactBlocking
{
  return self->_allowsContactBlocking;
}

- (BOOL)allowsContactBlockingAndReporting
{
  return self->_allowsContactBlockingAndReporting;
}

- (BOOL)shouldShowSharedProfileRow
{
  void *v3;
  void *v4;
  int v5;

  if (-[CNContactContentUnitaryViewController showsSharedProfile](self, "showsSharedProfile")
    && (objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "featureFlags"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isFeatureEnabled:", 15),
        v4,
        v3,
        v5)
    && -[CNContactContentUnitaryViewController mode](self, "mode") != 2)
  {
    return -[CNContactContentUnitaryViewController showContactPhotoPosterCell](self, "showContactPhotoPosterCell");
  }
  else
  {
    return 0;
  }
}

- (BOOL)showsSharedProfile
{
  return self->_showsSharedProfile;
}

- (BOOL)isSuggestedContact
{
  void *v2;
  char v3;

  -[CNContactContentUnitaryViewController contact](self, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSuggested");

  return v3;
}

- (id)displayedProperties
{
  return self->_displayedProperties;
}

- (BOOL)allowsNamePicking
{
  return self->_allowsNamePicking;
}

- (void)_reloadMedicalIDGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;

  -[CNContactContentUnitaryViewController environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "healthStoreManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentUnitaryViewController medicalIDLookupToken](self, "medicalIDLookupToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  -[CNContactContentUnitaryViewController setMedicalIDLookupToken:](self, "setMedicalIDLookupToken:", 0);
  -[CNContactContentUnitaryViewController setMedicalIDRegistrationToken:](self, "setMedicalIDRegistrationToken:", 0);
  -[CNContactContentUnitaryViewController setCardMedicalIDGroup:](self, "setCardMedicalIDGroup:", 0);
  if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
    -[CNContactContentUnitaryViewController staticDisplayHeaderView](self, "staticDisplayHeaderView");
  else
    -[CNContactContentUnitaryViewController displayHeaderView](self, "displayHeaderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsEmergencyContact:", 0);

  if (-[CNContactContentUnitaryViewController allowsActions](self, "allowsActions")
    && -[CNContactContentUnitaryViewController allowsCardActions](self, "allowsCardActions"))
  {
    objc_initWeak(&location, self);
    v7 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __62__CNContactContentUnitaryViewController__reloadMedicalIDGroup__block_invoke;
    v20[3] = &unk_1E204FEE8;
    objc_copyWeak(&v22, &location);
    v8 = v4;
    v21 = v8;
    objc_msgSend(v8, "registerMedicalIDDataHandler:", v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController setMedicalIDRegistrationToken:](self, "setMedicalIDRegistrationToken:", v9);
    v10 = (void *)MEMORY[0x1E0D139B8];
    v13 = v7;
    v14 = 3221225472;
    v15 = __62__CNContactContentUnitaryViewController__reloadMedicalIDGroup__block_invoke_4;
    v16 = &unk_1E204FF10;
    objc_copyWeak(&v19, &location);
    v17 = v8;
    v11 = v9;
    v18 = v11;
    objc_msgSend(v10, "tokenWithCancelationBlock:", &v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController setMedicalIDLookupToken:](self, "setMedicalIDLookupToken:", v12, v13, v14, v15, v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    -[CNContactContentUnitaryViewController setCardMedicalIDGroup:](self, "setCardMedicalIDGroup:", 0);
    -[CNContactContentUnitaryViewController setMedicalIDAction:](self, "setMedicalIDAction:", 0);
    -[CNContactContentUnitaryViewController setEmergencyContactAction:](self, "setEmergencyContactAction:", 0);
    -[CNContactContentUnitaryViewController setEmergencyNumberIdentifier:](self, "setEmergencyNumberIdentifier:", 0);
  }

}

- (void)setMedicalIDRegistrationToken:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDRegistrationToken, a3);
}

- (void)setMedicalIDLookupToken:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDLookupToken, a3);
}

void __62__CNContactContentUnitaryViewController__reloadMedicalIDGroup__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  CNCardGroup *v9;
  CNCardGroup *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  CNMedicalIDAction *v15;
  void *v16;
  CNMedicalIDAction *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
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
  char v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  CNEmergencyContactAction *v46;
  void *v47;
  CNEmergencyContactAction *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
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
  id v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  char v78;
  void *v79;
  void *v80;
  _QWORD v81[4];
  id v82;
  uint64_t v83;
  id v84;
  _QWORD v85[2];

  v85[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "medicalIDRegistrationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneNumbers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if ((objc_msgSend(*(id *)(a1 + 40), "showingMeContact") & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 40), "isEditing") & 1) == 0 && v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeAllActions");
      }
      else
      {
        v9 = [CNCardGroup alloc];
        objc_msgSend(*(id *)(a1 + 40), "mutableContact");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[CNCardGroup initWithContact:](v9, "initWithContact:", v8);
        objc_msgSend(*(id *)(a1 + 40), "setCardMedicalIDGroup:", v10);

      }
      objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAddSpacerFromPreviousGroup:", 0);

      v12 = objc_msgSend(*(id *)(a1 + 40), "showingMeContact");
      v13 = *(void **)(a1 + 40);
      if (v12)
      {
        objc_msgSend(v13, "medicalIDAction");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          v15 = [CNMedicalIDAction alloc];
          objc_msgSend(*(id *)(a1 + 40), "contact");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[CNPropertyAction initWithContact:](v15, "initWithContact:", v16);
          objc_msgSend(*(id *)(a1 + 40), "setMedicalIDAction:", v17);

          v18 = *(_QWORD *)(a1 + 48);
          objc_msgSend(*(id *)(a1 + 40), "medicalIDAction");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setHealthStoreManager:", v18);

          v20 = *(void **)(a1 + 40);
          objc_msgSend(v20, "medicalIDAction");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setDelegate:", v20);

          objc_msgSend(*(id *)(a1 + 40), "medicalIDAction");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setShowBackgroundPlatter:", 0);

        }
        objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setAddSpacerFromPreviousGroup:", 1);

        v24 = objc_msgSend(*(id *)(a1 + 40), "shouldUseStaticHeader");
        v25 = *(void **)(a1 + 40);
        if (v24)
          objc_msgSend(v25, "staticDisplayHeaderView");
        else
          objc_msgSend(v25, "displayHeaderView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setIsEmergencyContact:", 0);

        if (*(_QWORD *)(a1 + 56))
        {
          v36 = objc_msgSend(*(id *)(a1 + 40), "isEditing");
          CNContactsUIBundle();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v37;
          if ((v36 & 1) != 0)
          {
            objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_EDIT_MEDICAL_ID"), &stru_1E20507A8, CFSTR("Localized"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = 3;
          }
          else
          {
            objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_SHOW_MEDICAL_ID"), &stru_1E20507A8, CFSTR("Localized"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = 2;
          }
        }
        else
        {
          CNContactsUIBundle();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_CREATE_MEDICAL_ID"), &stru_1E20507A8, CFSTR("Localized"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 1;
        }

        objc_msgSend(*(id *)(a1 + 40), "medicalIDAction");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setMedicalIDActionType:", v40);

        objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "medicalIDAction");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNUIColorRepository contactListEmergencyContactAddTextColor](CNUIColorRepository, "contactListEmergencyContactAddTextColor");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNUIColorRepository contactListEmergencyContactGlyphColor](CNUIColorRepository, "contactListEmergencyContactGlyphColor");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addAction:withTitle:color:glyphColor:transportType:", v43, v39, v44, v45, 6);

        v26 = 0;
      }
      else
      {
        v26 = 0;
        if ((objc_msgSend(v13, "isEditing") & 1) == 0 && v6)
        {
          v27 = *(void **)(a1 + 40);
          v85[0] = *MEMORY[0x1E0C967C0];
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "_propertyGroupsForKeys:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 40), "_allDisplayPropertyItemsFromGroups:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "emergencyContactAction");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            objc_msgSend(*(id *)(a1 + 40), "contact");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "emergencyContactAction");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setContact:", v32);

            objc_msgSend(*(id *)(a1 + 40), "emergencyContactAction");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setPropertyItems:", v30);
          }
          else
          {
            v46 = [CNEmergencyContactAction alloc];
            objc_msgSend(*(id *)(a1 + 40), "contact");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = -[CNEmergencyContactAction initWithContact:healthStoreManager:propertyItems:](v46, "initWithContact:healthStoreManager:propertyItems:", v47, *(_QWORD *)(a1 + 48), v30);
            objc_msgSend(*(id *)(a1 + 40), "setEmergencyContactAction:", v48);

            v49 = *(void **)(a1 + 40);
            objc_msgSend(v49, "emergencyContactAction");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setDelegate:", v49);
          }

          objc_msgSend(*(id *)(a1 + 56), "emergencyContacts");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "contact");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNHealthStoreManager emergencyContactMatchingContact:](CNHealthStoreManager, "emergencyContactMatchingContact:", v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "_cn_firstObjectPassingTest:", v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          CNContactsUIBundle();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v54;
          if (v53)
          {
            objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_EMERGENCY_REMOVE"), &stru_1E20507A8, CFSTR("Localized"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v53, "phoneNumberContactIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_EMERGENCY_ADD"), &stru_1E20507A8, CFSTR("Localized"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            v26 = 0;
          }
          objc_msgSend(*(id *)(a1 + 40), "emergencyContactAction");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setAddingToEmergency:", v53 == 0);

          v58 = objc_msgSend(*(id *)(a1 + 40), "shouldUseStaticHeader");
          v59 = *(void **)(a1 + 40);
          if (v58)
            objc_msgSend(v59, "staticDisplayHeaderView");
          else
            objc_msgSend(v59, "displayHeaderView");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setIsEmergencyContact:", v53 != 0);

          objc_msgSend(*(id *)(a1 + 40), "contactStore");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "emergencyContactAction");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "setContactStore:", v61);

          if (v53)
            +[CNUIColorRepository contactListEmergencyContactGlyphColor](CNUIColorRepository, "contactListEmergencyContactGlyphColor");
          else
            +[CNUIColorRepository contactListEmergencyContactAddTextColor](CNUIColorRepository, "contactListEmergencyContactAddTextColor");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "emergencyContactAction");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "addAction:withTitle:color:transportType:", v65, v56, v63, 0);

        }
      }
      objc_msgSend(*(id *)(a1 + 40), "contactView");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "editingContactView");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = *(void **)(a1 + 40);
      if (v66 == v67)
        objc_msgSend(v68, "editingGroups");
      else
        objc_msgSend(v68, "displayGroups");
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      v70 = (void *)MEMORY[0x1E0DC3F10];
      v81[0] = MEMORY[0x1E0C809B0];
      v81[1] = 3221225472;
      v81[2] = __62__CNContactContentUnitaryViewController__reloadMedicalIDGroup__block_invoke_3;
      v81[3] = &unk_1E204FAA0;
      v71 = v69;
      v72 = *(_QWORD *)(a1 + 40);
      v82 = v71;
      v83 = v72;
      v73 = v66;
      v84 = v73;
      objc_msgSend(v70, "performWithoutAnimation:", v81);
      objc_msgSend(*(id *)(a1 + 40), "emergencyNumberIdentifier");
      v74 = objc_claimAutoreleasedReturnValue();
      v75 = v26;
      if (v26 != (void *)v74)
      {
        v76 = (void *)v74;
        objc_msgSend(*(id *)(a1 + 40), "emergencyNumberIdentifier");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v26, "isEqualToString:", v77);

        if ((v78 & 1) != 0)
        {
LABEL_42:

          return;
        }
        objc_msgSend(*(id *)(a1 + 40), "setEmergencyNumberIdentifier:", v26);
        v79 = *(void **)(a1 + 40);
        objc_msgSend(v79, "propertyGroups");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "objectForKeyedSubscript:", *MEMORY[0x1E0C967C0]);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "reloadCardGroup:forTableView:", v80, v73);

      }
      goto LABEL_42;
    }
  }
}

- (CNEmergencyContactAction)emergencyContactAction
{
  return self->_emergencyContactAction;
}

- (NSString)emergencyNumberIdentifier
{
  return self->_emergencyNumberIdentifier;
}

- (BOOL)shouldUseSharedProfile
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[CNContactContentUnitaryViewController showingMeContact](self, "showingMeContact");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D13D40], "unifiedMeContactMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isMeContact:", v5);

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)showingMeContact
{
  return self->_showingMeContact;
}

- (void)setCardMedicalIDGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardMedicalIDGroup, a3);
}

- (CNHealthStoreManagerToken)medicalIDRegistrationToken
{
  return self->_medicalIDRegistrationToken;
}

- (CNCancelable)medicalIDLookupToken
{
  return self->_medicalIDLookupToken;
}

- (void)_reloadGroupMembershipGroup
{
  void *v3;
  BOOL v4;
  CNContactAddToGroupAction *v5;
  CNContactAddToGroupAction *addToGroupAction;
  CNCardGroupMembershipGroup *v7;
  void *v8;
  CNCardGroupMembershipGroup *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CNCardGroupMembershipGroup *cardGroupMembershipGroup;
  CNContactAddToGroupAction *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CNContactAddToGroupAction *v26;

  if (-[CNContactContentUnitaryViewController showsGroupMembership](self, "showsGroupMembership"))
  {
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isSuggested") & 1) != 0)
    {

    }
    else
    {
      v4 = -[CNContactContentUnitaryViewController hasExistingGroups](self, "hasExistingGroups");

      if (v4)
      {
        if (!self->_addToGroupAction)
        {
          -[CNContactContentUnitaryViewController _addToGroupAction](self, "_addToGroupAction");
          v5 = (CNContactAddToGroupAction *)objc_claimAutoreleasedReturnValue();
          addToGroupAction = self->_addToGroupAction;
          self->_addToGroupAction = v5;

        }
        v7 = [CNCardGroupMembershipGroup alloc];
        -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[CNCardGroup initWithContact:](v7, "initWithContact:", v8);
        -[CNContactContentUnitaryViewController setCardGroupMembershipGroup:](self, "setCardGroupMembershipGroup:", v9);

        -[CNContactContentUnitaryViewController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController contact](self, "contact");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "parentGroupsForContact:", v11);
        v26 = (CNContactAddToGroupAction *)objc_claimAutoreleasedReturnValue();

        -[CNContactContentUnitaryViewController cardGroupMembershipGroup](self, "cardGroupMembershipGroup");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setParentGroups:", v26);

        -[CNContactContentUnitaryViewController addToGroupAction](self, "addToGroupAction");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setContactParentGroups:", v26);

        if (-[CNContactContentUnitaryViewController allowsEditing](self, "allowsEditing"))
        {
          -[CNContactContentUnitaryViewController cardGroupMembershipGroup](self, "cardGroupMembershipGroup");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactContentUnitaryViewController addToGroupAction](self, "addToGroupAction");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          CNContactsUIBundle();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ADD_TO_LIST_TABLE_CELL_TITLE_DISPLAY_MODE"), &stru_1E20507A8, CFSTR("Localized"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addAction:withTitle:", v15, v17);

          -[CNContactContentUnitaryViewController groupEditingContext](self, "groupEditingContext");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {

          }
          else if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
          {
            -[CNContactContentUnitaryViewController _reloadGroupEditingContext](self, "_reloadGroupEditingContext");
          }
          -[CNContactContentUnitaryViewController groupEditingContext](self, "groupEditingContext");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "groupsToDisplayForEditing");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactContentUnitaryViewController cardGroupMembershipGroup](self, "cardGroupMembershipGroup");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setGroupsToDisplayForEditing:", v22);

        }
        if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
        {
          -[CNContactContentUnitaryViewController cardGroupMembershipGroup](self, "cardGroupMembershipGroup");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "groupsToDisplayForEditing");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactAddToGroupAction setContactParentGroups:](self->_addToGroupAction, "setContactParentGroups:", v25);

        }
        else
        {
          -[CNContactAddToGroupAction setContactParentGroups:](self->_addToGroupAction, "setContactParentGroups:", v26);
        }
        v20 = v26;
        goto LABEL_19;
      }
    }
    cardGroupMembershipGroup = self->_cardGroupMembershipGroup;
    self->_cardGroupMembershipGroup = 0;

    v20 = self->_addToGroupAction;
    self->_addToGroupAction = 0;
LABEL_19:

  }
}

- (BOOL)showsGroupMembership
{
  if (self->_showsGroupMembership)
    return !-[CNContactContentUnitaryViewController isContactProviderDataSource](self, "isContactProviderDataSource");
  else
    return 0;
}

- (BOOL)hasExistingGroups
{
  void *v2;
  char v3;

  -[CNContactContentUnitaryViewController contactStore](self, "contactStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasGroups");

  return v3;
}

- (id)_loadEditingGroupsPreservingChanges:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  CNContactContentUnitaryViewController *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    -[CNContactContentUnitaryViewController _loadNameEditingGroups](self, "_loadNameEditingGroups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController setNameEditingGroups:](self, "setNameEditingGroups:", v6);

  }
  -[CNContactContentUnitaryViewController nameEditingGroups](self, "nameEditingGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  v8 = -[CNContactContentUnitaryViewController shouldShowGemini](self, "shouldShowGemini");
  -[CNContactContentUnitaryViewController createCardEditingGeminiGroupIfNeeded](self, "createCardEditingGeminiGroupIfNeeded");
  -[CNContactContentUnitaryViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShouldShowGemini:", v8);

  if (-[CNContactContentUnitaryViewController shouldShowGemini](self, "shouldShowGemini"))
  {
    -[CNContactContentUnitaryViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_cn_addNonNilObject:", v10);

  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  +[CNContactView allCardProperties](CNContactView, "allCardProperties", v5);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v45;
    v14 = *MEMORY[0x1E0C96860];
    v15 = *MEMORY[0x1E0D137F8];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v45 != v13)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if (!objc_msgSend(v17, "isEqualToString:", v14)
          || !-[CNContactContentUnitaryViewController showingMeContact](self, "showingMeContact"))
        {
          v18 = self;
          -[CNContactContentUnitaryViewController propertyGroups](self, "propertyGroups");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20)
            goto LABEL_19;
          objc_msgSend(v20, "editingItems");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (*(uint64_t (**)(uint64_t, void *))(v15 + 16))(v15, v21);

          if ((v22 & 1) != 0)
            goto LABEL_19;
          +[CNContactView addFieldCardProperties](CNContactView, "addFieldCardProperties");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v23, "containsObject:", v17))
          {
            v24 = objc_msgSend(v20, "valueEditingItemsCount");

            if (!v24)
              goto LABEL_19;
          }
          else
          {

          }
          objc_msgSend(v42, "addObject:", v20);
LABEL_19:

          self = v18;
          continue;
        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v12);
  }

  -[CNContactContentUnitaryViewController cardStaticIdentityGroup](self, "cardStaticIdentityGroup");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "_cn_addNonNilObject:", v25);

  -[CNContactContentUnitaryViewController cardEditingActionsGroup](self, "cardEditingActionsGroup");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "actions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");

  if (v28)
  {
    -[CNContactContentUnitaryViewController cardEditingActionsGroup](self, "cardEditingActionsGroup");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObject:", v29);

  }
  -[CNContactContentUnitaryViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "actionItems");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32)
  {
    -[CNContactContentUnitaryViewController cardMedicalIDGroup](self, "cardMedicalIDGroup");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "_cn_addNonNilObject:", v33);

  }
  -[CNContactContentUnitaryViewController createCardEditingContactContainerGroupIfNeeded](self, "createCardEditingContactContainerGroupIfNeeded");
  -[CNContactContentUnitaryViewController cardEditingContactContainerGroup](self, "cardEditingContactContainerGroup");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "_cn_addNonNilObject:", v34);

  -[CNContactContentUnitaryViewController cardLinkedCardsGroup](self, "cardLinkedCardsGroup");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "_cn_addNonNilObject:", v35);

  -[CNContactContentUnitaryViewController cardGroupMembershipGroup](self, "cardGroupMembershipGroup");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "_cn_addNonNilObject:", v36);

  -[CNContactContentUnitaryViewController cardEditingDeleteContactGroup](self, "cardEditingDeleteContactGroup");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "actions");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "count");

  if (v39)
  {
    -[CNContactContentUnitaryViewController cardEditingDeleteContactGroup](self, "cardEditingDeleteContactGroup");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObject:", v40);

  }
  return v42;
}

- (id)propertyGroups
{
  return self->_propertyGroups;
}

- (void)setNameEditingGroups:(id)a3
{
  objc_storeStrong((id *)&self->_nameEditingGroups, a3);
}

- (NSArray)nameEditingGroups
{
  return self->_nameEditingGroups;
}

- (void)createCardEditingContactContainerGroupIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  CNCardContactContainerGroup *v6;
  void *v7;
  CNCardContactContainerGroup *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureEnabled:", 6);

  if (v5)
  {
    if (-[CNContactContentUnitaryViewController shouldAllowContainerPicking](self, "shouldAllowContainerPicking")
      && (-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) != 0)
    {
      v6 = [CNCardContactContainerGroup alloc];
      -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[CNCardGroup initWithContact:](v6, "initWithContact:", v7);
      -[CNContactContentUnitaryViewController setCardEditingContactContainerGroup:](self, "setCardEditingContactContainerGroup:", v8);

      -[CNContactContentUnitaryViewController containerContext](self, "containerContext");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "selectedContainers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController cardEditingContactContainerGroup](self, "cardEditingContactContainerGroup");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setContainers:", v9);

    }
    else
    {
      -[CNContactContentUnitaryViewController setCardEditingContactContainerGroup:](self, "setCardEditingContactContainerGroup:", 0);
    }
  }
}

- (CNCardStaticIdentityGroup)cardStaticIdentityGroup
{
  return self->_cardStaticIdentityGroup;
}

- (CNCardContactContainerGroup)cardEditingContactContainerGroup
{
  return self->_cardEditingContactContainerGroup;
}

- (CNCardGroup)cardEditingActionsGroup
{
  return self->_cardEditingActionsGroup;
}

- (void)_updateCachedLabelWidths
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController setCachedLabelWidths:](self, "setCachedLabelWidths:", v3);

  -[CNContactContentUnitaryViewController editingGroups](self, "editingGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    do
    {
      -[CNContactContentUnitaryViewController editingGroups](self, "editingGroups");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNContactContentUnitaryViewController _updateCachedLabelWidthsForGroup:](self, "_updateCachedLabelWidthsForGroup:", v8);
      ++v6;
      -[CNContactContentUnitaryViewController editingGroups](self, "editingGroups");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

    }
    while (v6 < v10);
  }
  -[CNContactContentUnitaryViewController _updateLabelWidthsForAllVisibleCells](self, "_updateLabelWidthsForAllVisibleCells");
}

- (NSMutableArray)editingGroups
{
  return self->_editingGroups;
}

- (void)_updateCachedLabelWidthsForGroup:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "editingItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[CNContactContentUnitaryViewController _updateCachedLabelWidthsForItem:](self, "_updateCachedLabelWidthsForItem:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_setNeedsUpdateCachedLabelWidths
{
  id v3;

  -[CNContactContentUnitaryViewController setCachedLabelWidths:](self, "setCachedLabelWidths:", 0);
  if (-[CNContactContentUnitaryViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[CNContactContentUnitaryViewController view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

  }
}

- (void)setCachedLabelWidths:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLabelWidths, a3);
}

- (void)_reloadGeminiGroupPreservingChanges:(BOOL)a3
{
  void *v4;
  id v5;

  if (!a3)
  {
    -[CNContactContentUnitaryViewController setCardEditingGeminiGroup:](self, "setCardEditingGeminiGroup:", 0);
    -[CNContactContentUnitaryViewController geminiDataSource](self, "geminiDataSource");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resetDataSource");
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContact:", v4);

  }
}

- (void)setCardEditingGeminiGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardEditingGeminiGroup, a3);
}

- (void)createCardEditingGeminiGroupIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[CNContactContentUnitaryViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CNContactContentUnitaryViewController propertyGroups](self, "propertyGroups");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C96800]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController setCardEditingGeminiGroup:](self, "setCardEditingGeminiGroup:", v5);

    -[CNContactContentUnitaryViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propertyItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[CNContactContentUnitaryViewController geminiDataSource](self, "geminiDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "geminiResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setGeminiResult:", v9);

    objc_msgSend(v10, "setDelegate:", self);
  }
}

- (void)geminiDataSourceDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int64_t v24;
  void *v25;
  int64_t v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "geminiResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editingItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "geminiDataSourceDidUpdate:", v4);
  -[CNContactContentUnitaryViewController indexPathOfEditingPropertyItem:](self, "indexPathOfEditingPropertyItem:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNContactContentUnitaryViewController shouldShowGemini](self, "shouldShowGemini");
  if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactContentUnitaryViewController staticDisplayHeaderView](self, "staticDisplayHeaderView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateGeminiResult:", v5);

    -[CNContactContentUnitaryViewController staticDisplayHeaderView](self, "staticDisplayHeaderView");
  }
  else
  {
    -[CNContactContentUnitaryViewController displayHeaderView](self, "displayHeaderView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateGeminiResult:", v5);

    -[CNContactContentUnitaryViewController displayHeaderView](self, "displayHeaderView");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShouldShowGemini:", v10);

  -[CNContactContentUnitaryViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setGeminiResult:", v5);

  -[CNContactContentUnitaryViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setShouldShowGemini:", v10);

  -[CNContactContentUnitaryViewController editingContactView](self, "editingContactView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    v19 = -[CNContactContentUnitaryViewController isEditing](self, "isEditing");

    if (v19)
    {
      if (v9)
      {
        if (v10)
        {
          v28[0] = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "reloadRowsAtIndexPaths:withRowAnimation:", v20, 100);
        }
        else
        {
          -[CNContactContentUnitaryViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[CNContactContentUnitaryViewController sectionOfGroup:inTableView:](self, "sectionOfGroup:inTableView:", v25, v16);

          -[CNContactContentUnitaryViewController editingGroups](self, "editingGroups");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "removeObjectAtIndex:", v26);

          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v9, "indexAtPosition:", 0));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "deleteSections:withRowAnimation:", v20, 3);
        }
        goto LABEL_13;
      }
      if (v10)
      {
        -[CNContactContentUnitaryViewController editingGroups](self, "editingGroups");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "insertObject:atIndex:", v22, 0);

        -[CNContactContentUnitaryViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[CNContactContentUnitaryViewController sectionOfGroup:inTableView:](self, "sectionOfGroup:inTableView:", v23, v16);

        if (v24 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v24);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "insertSections:withRowAnimation:", v20, 3);
LABEL_13:

        }
      }
    }
  }

}

- (CNCardPropertyGeminiGroup)cardEditingGeminiGroup
{
  return self->_cardEditingGeminiGroup;
}

- (BOOL)shouldShowGemini
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;

  -[CNContactContentUnitaryViewController geminiDataSource](self, "geminiDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "geminiResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && !-[CNContactContentUnitaryViewController showingMeContact](self, "showingMeContact"))
  {
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isSuggested") & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      -[CNContactContentUnitaryViewController displayedProperties](self, "displayedProperties");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0C967C0]))
      {
        -[CNContactContentUnitaryViewController contact](self, "contact");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = +[CNContactContentUnitaryViewController shouldShowGeminiForResult:contact:](CNContactContentUnitaryViewController, "shouldShowGeminiForResult:contact:", v4, v8);

      }
      else
      {
        v5 = 0;
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CNUIGeminiDataSource)geminiDataSource
{
  return self->_geminiDataSource;
}

- (id)indexPathOfEditingPropertyItem:(id)a3
{
  return -[CNContactContentUnitaryViewController indexPathOfPropertyItem:editing:](self, "indexPathOfPropertyItem:editing:", a3, 1);
}

- (void)_addMedicalIDGroupAnimated:(BOOL)a3 forTableView:(id)a4
{
  _BOOL8 v4;
  CNContactView *v6;
  void *v7;
  BOOL (*v8)(uint64_t, void *);
  uint64_t *p_aBlock;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t aBlock;

  v4 = a3;
  v6 = (CNContactView *)a4;
  if (self->_editingContactView == v6)
  {
    -[CNContactContentUnitaryViewController editingGroups](self, "editingGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock = MEMORY[0x1E0C809B0];
    v8 = __81__CNContactContentUnitaryViewController__addMedicalIDGroupAnimated_forTableView___block_invoke;
    p_aBlock = &aBlock;
  }
  else
  {
    -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v8 = __81__CNContactContentUnitaryViewController__addMedicalIDGroupAnimated_forTableView___block_invoke_2;
    p_aBlock = &v14;
  }
  p_aBlock[1] = 3221225472;
  p_aBlock[2] = (uint64_t)v8;
  p_aBlock[3] = (uint64_t)&unk_1E204FE98;
  p_aBlock[4] = (uint64_t)self;
  v10 = _Block_copy(p_aBlock);
  v11 = objc_msgSend(v7, "indexOfObjectPassingTest:", v10);
  if (v11)
  {
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v7, "lastObject");
    else
      objc_msgSend(v7, "objectAtIndexedSubscript:", v11 - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  -[CNContactContentUnitaryViewController cardMedicalIDGroup](self, "cardMedicalIDGroup", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController _addGroup:afterGroup:forTableView:animated:](self, "_addGroup:afterGroup:forTableView:animated:", v13, v12, v6, v4);

}

- (void)_addGroup:(id)a3 afterGroup:(id)a4 forTableView:(id)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  id v23;
  uint64_t v24;

  v6 = a6;
  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v11)
    -[CNContactContentUnitaryViewController addCardGroup:afterGroup:](self, "addCardGroup:afterGroup:", v10, v11);
  if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) != 0)
    -[CNContactContentUnitaryViewController editingGroups](self, "editingGroups");
  else
    -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v11 && (v15 = objc_msgSend(v13, "indexOfObject:", v11), v15 != 0x7FFFFFFFFFFFFFFFLL))
    v16 = v15 + 1;
  else
    v16 = 0;
  v17 = objc_msgSend(v14, "count");
  if (v17 == objc_msgSend(v12, "numberOfSections"))
  {
    objc_msgSend(v12, "beginUpdates");
    objc_msgSend(v14, "insertObject:atIndex:", v10, v16);
    v18 = -[CNContactContentUnitaryViewController tableViewSectionIndexFromGroupIndex:forTableView:](self, "tableViewSectionIndexFromGroupIndex:forTableView:", v16, v12);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v20 = 6;
    else
      v20 = 5;
    objc_msgSend(v12, "insertSections:withRowAnimation:", v19, v20);

    objc_msgSend(v12, "endUpdates");
  }
  else
  {
    CNUILogContactCard();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = 138412290;
      v23 = v10;
      _os_log_impl(&dword_18AC56000, v21, OS_LOG_TYPE_INFO, "Invalid number of sections detected when adding group %@", (uint8_t *)&v22, 0xCu);
    }

    objc_msgSend(v14, "insertObject:atIndex:", v10, v16);
    objc_msgSend(v12, "reloadData");
  }
  -[CNContactContentUnitaryViewController adjustPreferredContentSize](self, "adjustPreferredContentSize");

}

- (void)addCardGroup:(id)a3 afterGroup:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[CNContactContentUnitaryViewController groupsAfterGroup](self, "groupsAfterGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CNContactContentUnitaryViewController groupsAfterGroup](self, "groupsAfterGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController groupsAfterGroup](self, "groupsAfterGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v6);
  }

}

- (void)_reloadNamePickingGroup
{
  void *v3;
  CNCardNamePickingGroup *v4;
  CNCardNamePickingGroup *v5;
  id v6;

  -[CNContactContentUnitaryViewController namePickingGroup](self, "namePickingGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [CNCardNamePickingGroup alloc];
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = -[CNCardGroup initWithContact:](v4, "initWithContact:", v6);
    -[CNContactContentUnitaryViewController setNamePickingGroup:](self, "setNamePickingGroup:", v5);

  }
}

- (CNCardNamePickingGroup)namePickingGroup
{
  return self->_namePickingGroup;
}

- (void)_reloadMeCardSharedProfileGroup
{
  void *v3;
  CNMeCardSharedProfileGroup *v4;
  void *v5;
  CNMeCardSharedProfileGroup *v6;
  void *v7;
  id v8;

  -[CNContactContentUnitaryViewController meCardSharedProfileGroup](self, "meCardSharedProfileGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [CNMeCardSharedProfileGroup alloc];
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CNCardGroup initWithContact:](v4, "initWithContact:", v5);
    -[CNContactContentUnitaryViewController setMeCardSharedProfileGroup:](self, "setMeCardSharedProfileGroup:", v6);

    -[CNContactContentUnitaryViewController _sharedProfileSettingsAction](self, "_sharedProfileSettingsAction");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController meCardSharedProfileGroup](self, "meCardSharedProfileGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSharedProfileSettingsAction:", v8);

  }
}

- (CNMeCardSharedProfileGroup)meCardSharedProfileGroup
{
  return self->_meCardSharedProfileGroup;
}

- (id)_sharedProfileSettingsAction
{
  CNContactSharedProfileSettingsAction *v3;
  void *v4;
  CNContactSharedProfileSettingsAction *v5;
  void *v6;

  v3 = [CNContactSharedProfileSettingsAction alloc];
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNContactAction initWithContact:](v3, "initWithContact:", v4);

  -[CNContactAction setDelegate:](v5, "setDelegate:", self);
  -[CNContactContentUnitaryViewController contactStore](self, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSharedProfileSettingsAction setContactStore:](v5, "setContactStore:", v6);

  return v5;
}

- (void)_updateAvailableTransports
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0)
  {
    v3 = *MEMORY[0x1E0C966A8];
    v7[0] = *MEMORY[0x1E0C967C0];
    v7[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController _propertyGroupsForKeys:](self, "_propertyGroupsForKeys:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentUnitaryViewController _allDisplayPropertyItemsFromGroups:](self, "_allDisplayPropertyItemsFromGroups:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController _updateAvailableTransportsForItems:](self, "_updateAvailableTransportsForItems:", v6);

  }
}

- (void)_reloadFaceTimeGroup
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD aBlock[4];
  id v21;
  id location;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  +[CNCapabilitiesManager defaultCapabilitiesManager](CNCapabilitiesManager, "defaultCapabilitiesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFaceTimeAppAvailable"))
    v4 = objc_msgSend(v3, "isConferencingAvailable") ^ 1;
  else
    v4 = 1;
  v5 = *MEMORY[0x1E0C966A8];
  v23[0] = *MEMORY[0x1E0C967C0];
  v23[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController _propertyGroupsForKeys:](self, "_propertyGroupsForKeys:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentUnitaryViewController _allDisplayPropertyItemsFromGroups:](self, "_allDisplayPropertyItemsFromGroups:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactContentUnitaryViewController allowsActions](self, "allowsActions")
    && -[CNContactContentUnitaryViewController allowsConferencing](self, "allowsConferencing"))
  {
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (((objc_msgSend(v9, "isSuggested") | v4) & 1) != 0 || !objc_msgSend(v8, "count"))
      goto LABEL_10;
    -[CNContactContentViewController primaryProperty](self, "primaryProperty");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

    if (v11)
    {
      objc_msgSend(v8, "_cn_filter:", &__block_literal_global_2_54958);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_cn_map:", &__block_literal_global_54954);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __61__CNContactContentUnitaryViewController__reloadFaceTimeGroup__block_invoke;
      aBlock[3] = &unk_1E204FD98;
      objc_copyWeak(&v21, &location);
      v19 = _Block_copy(aBlock);
      v13 = (void *)MEMORY[0x1E0D13D00];
      -[CNContactContentUnitaryViewController environment](self, "environment");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "idsAvailabilityProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController environment](self, "environment");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "defaultSchedulerProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "validateHandlesForFaceTime:availabilityProvider:schedulerProvider:handler:", v9, v15, v17, v19);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController setFaceTimeIDSLookupToken:](self, "setFaceTimeIDSLookupToken:", v18);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
LABEL_10:

    }
  }

}

- (BOOL)allowsConferencing
{
  return self->_allowsConferencing;
}

- (void)_setupCardActions
{
  void *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  _BOOL4 v21;
  int v22;
  void *v23;
  int v24;
  BOOL v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  char v34;
  uint64_t v35;
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
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
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
  int v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  unsigned int v83;
  unsigned int v84;
  int v85;
  int v86;
  id v87;

  if (!-[CNContactContentUnitaryViewController allowsActions](self, "allowsActions"))
    return;
  -[CNContactContentUnitaryViewController actionProvider](self, "actionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buildCommunicationLimitsActions");

  +[CNCapabilitiesManager defaultCapabilitiesManager](CNCapabilitiesManager, "defaultCapabilitiesManager");
  v87 = (id)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend(v87, "hasCellularTelephonyCapability");
  v86 = objc_msgSend(v87, "areFavoritesAvailable");
  v4 = objc_msgSend(v87, "isMMSConfigured");
  v5 = objc_msgSend(v87, "isMadridConfigured");
  v6 = objc_msgSend(v87, "isConferencingAvailable");
  v85 = objc_msgSend(v87, "isFaceTimeAudioAvailable");
  v7 = objc_msgSend(v87, "isMessagesAppAvailable");
  v83 = objc_msgSend(v87, "isPhoneAppAvailable");
  v8 = objc_msgSend(v87, "isFaceTimeAppAvailable");
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "phoneNumbers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  -[CNContactContentUnitaryViewController contact](self, "contact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "emailAddresses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if ((objc_msgSend(MEMORY[0x1E0C97200], "quickActionsEnabled") & 1) == 0)
  {
    if (v7 && (v11 ? (v15 = v84 | v5) : (v15 = 0), v14 ? (v16 = v4 | v5) : (v16 = 0), (v15 & 1) != 0 || v16))
    {
      -[CNContactContentUnitaryViewController _sendMessageActionAllowingEmailIDs:](self, "_sendMessageActionAllowingEmailIDs:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController setSendMessageAction:](self, "setSendMessageAction:", v17);

    }
    else
    {
      -[CNContactContentUnitaryViewController setSendMessageAction:](self, "setSendMessageAction:", 0);
    }
  }
  v18 = v11 | v14;
  -[CNContactContentUnitaryViewController faceTimeAction](self, "faceTimeAction");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    v20 = 0;
  else
    v20 = v6;
  v21 = v18 != 0;
  if (v20 == 1)
  {
    v22 = v86;
    if (v21)
    {
      if (!(_DWORD)v8)
        goto LABEL_24;
      -[CNContactContentUnitaryViewController _faceTimeAction](self, "_faceTimeAction");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController setFaceTimeAction:](self, "setFaceTimeAction:", v19);
    }
  }
  else
  {
    v22 = v86;
  }

LABEL_24:
  -[CNContactContentUnitaryViewController faceTimeAudioAction](self, "faceTimeAudioAction");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    v24 = 0;
  else
    v24 = v6;
  if ((v24 & v21 & v8) != 1)
    goto LABEL_30;
  if (v85)
  {
    -[CNContactContentUnitaryViewController _faceTimeAudioAction](self, "_faceTimeAudioAction");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController setFaceTimeAudioAction:](self, "setFaceTimeAudioAction:", v23);
LABEL_30:

  }
  -[CNContactContentUnitaryViewController setShareContactAction:](self, "setShareContactAction:", 0);
  v25 = -[CNContactContentUnitaryViewController isHeaderViewPhotoProhibited](self, "isHeaderViewPhotoProhibited");
  if (-[CNContactContentUnitaryViewController allowsSharing](self, "allowsSharing"))
  {
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isSuggested") | v25;

    if ((v27 & 1) == 0)
    {
      -[CNContactContentUnitaryViewController _shareContactAction](self, "_shareContactAction");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController setShareContactAction:](self, "setShareContactAction:", v28);

    }
  }
  if (v22)
  {
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "isUnknown"))
    {

    }
    else
    {
      -[CNContactContentUnitaryViewController contact](self, "contact");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[CNContactContentUnitaryViewController contactHasAvailablePropertiesToFavorite:isPhoneAppAvailable:isFaceTimeAppAvailable:](self, "contactHasAvailablePropertiesToFavorite:isPhoneAppAvailable:isFaceTimeAppAvailable:", v30, v83, v8);

      if (v31)
      {
        -[CNContactContentUnitaryViewController _addFavoriteActionWithConferencing:telephony:](self, "_addFavoriteActionWithConferencing:telephony:", v8 & v6, v83 & v84);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController setAddFavoriteAction:](self, "setAddFavoriteAction:", v32);

        goto LABEL_40;
      }
    }
  }
  -[CNContactContentUnitaryViewController setAddFavoriteAction:](self, "setAddFavoriteAction:", 0);
LABEL_40:
  if (-[CNContactContentUnitaryViewController allowsCardActions](self, "allowsCardActions"))
  {
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isSuggested");

    if ((v34 & 1) == 0)
    {
      if (-[CNContactContentUnitaryViewController allowsSendMessage](self, "allowsSendMessage"))
      {
        -[CNContactContentUnitaryViewController sendMessageAction](self, "sendMessageAction");
        v35 = objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          v36 = (void *)v35;
          -[CNContactContentViewController primaryProperty](self, "primaryProperty");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v37)
          {
            -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNContactContentUnitaryViewController sendMessageAction](self, "sendMessageAction");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            CNContactsUIBundle();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("PHONE_ACTION_TEXT"), &stru_1E20507A8, CFSTR("Localized"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "addAction:withTitle:", v39, v41);

          }
        }
      }
      -[CNContactContentUnitaryViewController shareContactAction](self, "shareContactAction");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController shareContactAction](self, "shareContactAction");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        CNContactsUIBundle();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("SHARE_CONTACT_ACTION_BUTTON_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addAction:withTitle:", v44, v46);

      }
      -[CNContactContentUnitaryViewController addFavoriteAction](self, "addFavoriteAction");
      v47 = objc_claimAutoreleasedReturnValue();
      if (v47)
      {
        v48 = (void *)v47;
        -[CNContactContentUnitaryViewController addFavoriteAction](self, "addFavoriteAction");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "canPerformAction");

        if (v50)
        {
          -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactContentUnitaryViewController addFavoriteAction](self, "addFavoriteAction");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          CNContactsUIBundle();
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("PHONE_ACTION_ADD_TO_FAVORITES"), &stru_1E20507A8, CFSTR("Localized"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addAction:withTitle:", v52, v54);

        }
      }
      -[CNContactContentUnitaryViewController actionProvider](self, "actionProvider");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "shareWithFamilyAction");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (v56 && objc_msgSend(v56, "canPerformAction"))
      {
        objc_msgSend(v56, "setDelegate:", self);
        -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "title");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "addAction:withTitle:", v56, v58);

      }
      -[CNContactContentUnitaryViewController actionProvider](self, "actionProvider");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "stopSharingWithFamilyAction");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController setStopSharingWithFamilyAction:](self, "setStopSharingWithFamilyAction:", v60);

      -[CNContactContentUnitaryViewController stopSharingWithFamilyAction](self, "stopSharingWithFamilyAction");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setDelegate:", self);

      if (-[CNContactContentViewController ignoresParentalRestrictions](self, "ignoresParentalRestrictions"))
      {
        -[CNContactContentUnitaryViewController stopSharingWithFamilyAction](self, "stopSharingWithFamilyAction");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "canPerformAction");

        if (v63)
        {
          -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactContentUnitaryViewController stopSharingWithFamilyAction](self, "stopSharingWithFamilyAction");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactContentUnitaryViewController stopSharingWithFamilyAction](self, "stopSharingWithFamilyAction");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "title");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactContentUnitaryViewController stopSharingWithFamilyAction](self, "stopSharingWithFamilyAction");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "addAction:withTitle:wrapTitle:", v65, v67, objc_msgSend(v68, "wrapTitle"));

        }
      }
      -[CNContactContentUnitaryViewController stopSharingWithFamilyAction](self, "stopSharingWithFamilyAction");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "canPerformAction");

      if (v70)
      {
        -[CNContactContentUnitaryViewController cardEditingActionsGroup](self, "cardEditingActionsGroup");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController stopSharingWithFamilyAction](self, "stopSharingWithFamilyAction");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController stopSharingWithFamilyAction](self, "stopSharingWithFamilyAction");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "title");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController stopSharingWithFamilyAction](self, "stopSharingWithFamilyAction");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "addAction:withTitle:wrapTitle:", v72, v74, objc_msgSend(v75, "wrapTitle"));

      }
      -[CNContactContentUnitaryViewController setupShareLocationActionReload:](self, "setupShareLocationActionReload:", 0);

    }
  }
  -[CNContactContentUnitaryViewController _clearRecentsDataAction](self, "_clearRecentsDataAction");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController setClearRecentsDataAction:](self, "setClearRecentsDataAction:", v76);

  -[CNContactContentUnitaryViewController clearRecentsDataAction](self, "clearRecentsDataAction");
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  if (v77)
  {
    -[CNContactContentUnitaryViewController clearRecentsDataAction](self, "clearRecentsDataAction");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setDelegate:", self);

    -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController clearRecentsDataAction](self, "clearRecentsDataAction");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "localizedStringForKey:value:table:", CFSTR("CLEAR_RECENTS"), &stru_1E20507A8, CFSTR("Localized"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addAction:withTitle:", v80, v82);

  }
}

- (BOOL)allowsActions
{
  return self->_allowsActions;
}

- (CNContactActionProvider)actionProvider
{
  return self->_actionProvider;
}

- (CNContactAddFavoriteAction)addFavoriteAction
{
  return self->_addFavoriteAction;
}

- (void)setShareContactAction:(id)a3
{
  objc_storeStrong((id *)&self->_shareContactAction, a3);
}

- (CNContactAction)stopSharingWithFamilyAction
{
  return self->_stopSharingWithFamilyAction;
}

- (CNContactAction)shareContactAction
{
  return self->_shareContactAction;
}

- (CNPropertyAction)sendMessageAction
{
  return self->_sendMessageAction;
}

- (BOOL)allowsCardActions
{
  return self->_allowsCardActions;
}

- (void)setStopSharingWithFamilyAction:(id)a3
{
  objc_storeStrong((id *)&self->_stopSharingWithFamilyAction, a3);
}

- (void)setClearRecentsDataAction:(id)a3
{
  objc_storeStrong((id *)&self->_clearRecentsDataAction, a3);
}

- (CNPropertyFaceTimeAction)faceTimeAudioAction
{
  return self->_faceTimeAudioAction;
}

- (CNPropertyFaceTimeAction)faceTimeAction
{
  return self->_faceTimeAction;
}

- (BOOL)contactHasAvailablePropertiesToFavorite:(id)a3 isPhoneAppAvailable:(BOOL)a4 isFaceTimeAppAvailable:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  BOOL v14;
  BOOL v15;
  void *v17;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "phoneNumbers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNContactContentUnitaryViewController labeledValuesHasNonSuggestion:](self, "labeledValuesHasNonSuggestion:", v9);

  if (v6 && v10)
    goto LABEL_6;
  objc_msgSend(v8, "emailAddresses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CNContactContentUnitaryViewController labeledValuesHasNonSuggestion:](self, "labeledValuesHasNonSuggestion:", v11);

  if (v5 && (v10 || v12))
    goto LABEL_6;
  objc_msgSend(v8, "socialProfiles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CNContactContentUnitaryViewController labeledValuesHasNonSuggestion:](self, "labeledValuesHasNonSuggestion:", v13);

  if (v14)
  {
LABEL_6:
    v15 = 1;
  }
  else
  {
    objc_msgSend(v8, "instantMessageAddresses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CNContactContentUnitaryViewController labeledValuesHasNonSuggestion:](self, "labeledValuesHasNonSuggestion:", v17);

  }
  return v15;
}

- (BOOL)labeledValuesHasNonSuggestion:(id)a3
{
  return objc_msgSend(a3, "_cn_any:", &__block_literal_global_645);
}

- (CNContactClearRecentsDataAction)clearRecentsDataAction
{
  return self->_clearRecentsDataAction;
}

- (BOOL)allowsSharing
{
  return self->_allowsSharing;
}

- (BOOL)allowsSendMessage
{
  return self->_allowsSendMessage;
}

- (void)_updateAvailableTransportsForItems:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[CNCapabilitiesManager defaultCapabilitiesManager](CNCapabilitiesManager, "defaultCapabilitiesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isMessagesAppAvailable"))
    -[CNContactContentUnitaryViewController _updateIMessageTransportButtonsForItems:](self, "_updateIMessageTransportButtonsForItems:", v5);
  if (objc_msgSend(v4, "isPhoneAppAvailable"))
    -[CNContactContentUnitaryViewController _updatePhoneTransportButtonsForItems:](self, "_updatePhoneTransportButtonsForItems:", v5);
  if (objc_msgSend(v4, "isMailAppAvailable"))
    -[CNContactContentUnitaryViewController _updateEmailTransportButtonsForItems:](self, "_updateEmailTransportButtonsForItems:", v5);
  -[CNContactContentUnitaryViewController _updateTTYTransportButtonsForItems:](self, "_updateTTYTransportButtonsForItems:", v5);

}

- (void)_updateTTYTransportButtonsForItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = *MEMORY[0x1E0C967C0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "property");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v8);

        if (v12)
          objc_msgSend(v10, "setAllowsTTY:", -[CNContactContentUnitaryViewController contactSupportsTTYCalls](self, "contactSupportsTTYCalls"));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (BOOL)contactSupportsTTYCalls
{
  return self->_contactSupportsTTYCalls;
}

- (void)_updatePhoneTransportButtonsForItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  _BOOL8 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = *MEMORY[0x1E0C967C0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "property");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v7);

        if (v11)
        {
          +[CNCapabilitiesManager defaultCapabilitiesManager](CNCapabilitiesManager, "defaultCapabilitiesManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (objc_msgSend(v12, "hasCellularTelephonyCapability") & 1) != 0 || _CFMZEnabled() != 0;
          objc_msgSend(v9, "setAllowsPhone:", v13);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (void)_updateIMessageTransportButtonsForItems:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CNContactContentUnitaryViewController *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD aBlock[4];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[5];

  v26 = self;
  v38[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C97058];
  v38[0] = *MEMORY[0x1E0C97028];
  v38[1] = v4;
  v38[2] = *MEMORY[0x1E0C97008];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    v9 = *MEMORY[0x1E0C967C0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v11, "property", v26);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isEqualToString:", v9) & 1) != 0)
        {
          objc_msgSend(v11, "labeledValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "label");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v29, "containsObject:", v14);

          if (v15)
          {
            objc_msgSend(v11, "setAllowsIMessage:", 1);
            objc_msgSend(v28, "addObject:", v11);
          }
        }
        else
        {

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v7);
  }

  objc_msgSend(v27, "removeObjectsInArray:", v28);
  if (objc_msgSend(v27, "count"))
  {
    objc_msgSend(v27, "_cn_filter:", &__block_literal_global_2_54958);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_cn_map:", &__block_literal_global_54954);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__CNContactContentUnitaryViewController__updateIMessageTransportButtonsForItems___block_invoke;
    aBlock[3] = &unk_1E204FD48;
    v31 = v17;
    v32 = v27;
    v18 = v17;
    v19 = _Block_copy(aBlock);
    v20 = (void *)MEMORY[0x1E0D13D00];
    -[CNContactContentUnitaryViewController environment](v26, "environment");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "idsAvailabilityProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController environment](v26, "environment");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "defaultSchedulerProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "validateHandlesForIMessage:availabilityProvider:schedulerProvider:handler:", v18, v22, v24, v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController setIMessageIDSLookupToken:](v26, "setIMessageIDSLookupToken:", v25);

  }
}

- (void)setIMessageIDSLookupToken:(id)a3
{
  objc_storeStrong((id *)&self->_iMessageIDSLookupToken, a3);
}

- (void)_updateEmailTransportButtonsForItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = *MEMORY[0x1E0C966A8];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "property");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v7);

        if (v11)
          objc_msgSend(v9, "setAllowsEmail:", 1);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (id)_shareContactAction
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  CNContactShareContactAction *v8;

  -[CNContactContentUnitaryViewController contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainStoreLinkedContacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isUnified"))
  {
    objc_msgSend(v3, "linkedContacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", v4);

    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C97200], "unifyContacts:", v4);
      v7 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v7;
    }
  }
  v8 = -[CNContactAction initWithContact:]([CNContactShareContactAction alloc], "initWithContact:", v3);
  if (-[CNContactShareContactAction canPerformAction](v8, "canPerformAction"))
  {
    -[CNContactAction setDelegate:](v8, "setDelegate:", self);
  }
  else
  {

    v8 = 0;
  }

  return v8;
}

- (id)_sendMessageActionAllowingEmailIDs:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  CNPropertySendMessageAction *v11;
  void *v12;
  void *v13;
  CNPropertySendMessageAction *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = *MEMORY[0x1E0C966A8];
    v17 = *MEMORY[0x1E0C967C0];
    v18 = v4;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v17;
    v7 = 2;
  }
  else
  {
    v16 = *MEMORY[0x1E0C967C0];
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v16;
    v7 = 1;
  }
  objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v16, v17, v18, v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController _propertyGroupsForKeys:](self, "_propertyGroupsForKeys:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentUnitaryViewController _allDisplayPropertyItemsFromGroups:](self, "_allDisplayPropertyItemsFromGroups:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [CNPropertySendMessageAction alloc];
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController actionsDataSource](self, "actionsDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CNPropertySendMessageAction initWithContact:propertyItems:actionDataSource:](v11, "initWithContact:propertyItems:actionDataSource:", v12, v10, v13);

  -[CNContactAction setDelegate:](v14, "setDelegate:", self);
  return v14;
}

void __80__CNContactContentUnitaryViewController__retrieveActionsModelPreservingChanges___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "actionsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__CNContactContentUnitaryViewController__retrieveActionsModelPreservingChanges___block_invoke_2;
  v8[3] = &unk_1E204FB90;
  v6 = v3;
  v9 = v6;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v7 = (id)objc_msgSend(v4, "consumer:actionModelsForContact:actionType:handler:", 0, v5, v6, v8);

  objc_destroyWeak(&v10);
}

- (CNUIUserActionListDataSource)actionsDataSource
{
  return self->_actionsDataSource;
}

- (void)_reloadLinkedCardsGroup
{
  CNPropertyLinkedCardsAction *v3;
  CNPropertyLinkedCardsAction *linkedCardsAction;
  CNContactAddLinkedCardAction *addLinkedCardAction;
  CNContactAddLinkedCardAction *v6;
  CNContactAddLinkedCardAction *v7;
  CNCardLinkedCardsGroup *v8;
  void *v9;
  CNCardLinkedCardsGroup *v10;
  void *v11;
  NSMutableArray *editingLinkedContacts;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[CNContactContentUnitaryViewController shouldReallyShowLinkedContactsForEditingState:](self, "shouldReallyShowLinkedContactsForEditingState:", -[CNContactContentUnitaryViewController isEditing](self, "isEditing")))
  {
    if (!self->_linkedCardsAction)
    {
      -[CNContactContentUnitaryViewController _linkedCardsAction](self, "_linkedCardsAction");
      v3 = (CNPropertyLinkedCardsAction *)objc_claimAutoreleasedReturnValue();
      linkedCardsAction = self->_linkedCardsAction;
      self->_linkedCardsAction = v3;

    }
    addLinkedCardAction = self->_addLinkedCardAction;
    if (!addLinkedCardAction)
    {
      -[CNContactContentUnitaryViewController _addLinkedCardAction](self, "_addLinkedCardAction");
      v6 = (CNContactAddLinkedCardAction *)objc_claimAutoreleasedReturnValue();
      v7 = self->_addLinkedCardAction;
      self->_addLinkedCardAction = v6;

      addLinkedCardAction = self->_addLinkedCardAction;
    }
    -[CNContactAddLinkedCardAction setEditingLinkedContacts:](addLinkedCardAction, "setEditingLinkedContacts:", self->_editingLinkedContacts);
    v8 = [CNCardLinkedCardsGroup alloc];
    -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CNCardGroup initWithContact:](v8, "initWithContact:", v9);
    -[CNContactContentUnitaryViewController setCardLinkedCardsGroup:](self, "setCardLinkedCardsGroup:", v10);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    editingLinkedContacts = self->_editingLinkedContacts;
    if (editingLinkedContacts)
    {
      v13 = editingLinkedContacts;
    }
    else
    {
      -[CNContactContentUnitaryViewController contact](self, "contact");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "mainStoreLinkedContacts");
      v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

    }
    -[CNContactContentUnitaryViewController shadowCopyOfReadonlyContact](self, "shadowCopyOfReadonlyContact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v16 = v13;
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v23;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v23 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(v11, "addObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v20++), (_QWORD)v22);
          }
          while (v18 != v20);
          v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v18);
      }

    }
    if ((unint64_t)objc_msgSend(v11, "count", (_QWORD)v22) > 1
      || -[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
    {
      -[CNContactContentUnitaryViewController cardLinkedCardsGroup](self, "cardLinkedCardsGroup");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setLinkedContacts:", v11);

    }
    else
    {
      -[CNContactContentUnitaryViewController setCardLinkedCardsGroup:](self, "setCardLinkedCardsGroup:", 0);
    }

  }
  else
  {
    -[CNContactContentUnitaryViewController setCardLinkedCardsGroup:](self, "setCardLinkedCardsGroup:", 0);
  }
}

- (BOOL)shouldReallyShowLinkedContactsForEditingState:(BOOL)a3
{
  void *v3;
  _BOOL4 v4;
  void *v6;
  void *v7;
  unint64_t v8;
  int v9;
  void *v10;

  v4 = a3;
  if (-[CNContactContentViewController shouldShowLinkedContacts](self, "shouldShowLinkedContacts"))
  {
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mainStoreLinkedContacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    if (v8 < 2)
    {
      if (!v4)
      {
        LOBYTE(v9) = 0;
        goto LABEL_11;
      }
    }
    else
    {
      -[CNContactContentUnitaryViewController shadowCopyOfReadonlyContact](self, "shadowCopyOfReadonlyContact");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3 && !v4)
      {
        LOBYTE(v9) = 0;
        goto LABEL_9;
      }
    }
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isSuggestedMe") ^ 1;

    if (v8 < 2)
    {
LABEL_11:

      return v9;
    }
LABEL_9:

    goto LABEL_11;
  }
  LOBYTE(v9) = 0;
  return v9;
}

- (id)_loadNameEditingGroups
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactView namePropertiesForContact:](CNContactView, "namePropertiesForContact:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v39;
    v30 = *(_QWORD *)v39;
    do
    {
      v8 = 0;
      v32 = v6;
      do
      {
        if (*(_QWORD *)v39 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v8);
        -[CNContactContentUnitaryViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys", v30);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", v9);

        if ((v11 & 1) == 0)
        {
          -[CNContactContentUnitaryViewController contact](self, "contact");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "valueForKey:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          v14 = v13;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v15 = v14;
          else
            v15 = 0;
          v16 = v15;

          if (v14 && (!v16 || objc_msgSend(v16, "length"))
            || (+[CNContactView requiredNameProperties](CNContactView, "requiredNameProperties"),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                v18 = objc_msgSend(v17, "containsObject:", v9),
                v17,
                v18))
          {
            -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNContactContentUnitaryViewController contactStore](self, "contactStore");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNContactContentUnitaryViewController policy](self, "policy");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNContactContentUnitaryViewController linkedPoliciesByContactIdentifier](self, "linkedPoliciesByContactIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            +[CNCardPropertyGroup groupForProperty:contact:store:policy:linkedPolicies:](CNCardPropertyNameGroup, "groupForProperty:contact:store:policy:linkedPolicies:", v9, v19, v20, v21, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v23, "setAddSpacerFromPreviousGroup:", 0);
            v36 = 0u;
            v37 = 0u;
            v34 = 0u;
            v35 = 0u;
            objc_msgSend(v23, "propertyItems");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v35;
              do
              {
                v28 = 0;
                do
                {
                  if (*(_QWORD *)v35 != v27)
                    objc_enumerationMutation(v24);
                  objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v28++), "setDelegate:", self);
                }
                while (v26 != v28);
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
              }
              while (v26);
            }

            objc_msgSend(v31, "addObject:", v23);
            v7 = v30;
            v6 = v32;
          }

        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v6);
  }

  return v31;
}

- (id)contact
{
  return self->_contact;
}

- (id)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (id)_clearRecentsDataAction
{
  void *v3;
  CNContactClearRecentsDataAction *v4;
  CNContactClearRecentsDataAction *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CNContactContentUnitaryViewController recentsData](self, "recentsData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && !-[CNContactContentUnitaryViewController isSuggestedContact](self, "isSuggestedContact"))
  {
    v5 = [CNContactClearRecentsDataAction alloc];
    -[CNContactContentUnitaryViewController recentsData](self, "recentsData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController environment](self, "environment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recentsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[CNContactClearRecentsDataAction initWithRecentsData:coreRecentsManager:](v5, "initWithRecentsData:coreRecentsManager:", v6, v8);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)recentsData
{
  return self->_recentsData;
}

- (CNContactContentUnitaryViewController)initWithEnvironment:(id)a3
{
  id v5;
  CNContactContentUnitaryViewController *v6;
  CNContactViewCache *v7;
  CNContactViewCache *contactViewCache;
  CNUIGeminiDataSource *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  CNUIGeminiDataSource *geminiDataSource;
  void *v14;
  void *v15;
  uint64_t v16;
  CNScheduler *mainThreadScheduler;
  void *v18;
  void *v19;
  uint64_t v20;
  CNScheduler *ktWorkQueue;
  __int128 v22;
  uint64_t v23;
  CNContactFormatter *contactFormatter;
  uint64_t v25;
  NSArray *displayedProperties;
  id v27;
  void *v28;
  uint64_t v29;
  CNUIUserActionListDataSource *actionsDataSource;
  uint64_t v31;
  CNContactInlineActionsViewController *actionsViewController;
  CNContactActionsContainerView *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  CNContactActionsContainerView *actionsWrapperView;
  double v38;
  void *v39;
  uint64_t v40;
  CNContactInlineActionsViewController *floatingActionsViewController;
  CNContactActionsContainerView *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  CNContactActionsContainerView *floatingActionsWrapperView;
  void *v47;
  void *v48;
  UIView *v49;
  uint64_t v50;
  void *v51;
  UIView *contactViewBackgroundView;
  UIView *v53;
  CAGradientLayer *contactViewBackgroundGradientLayer;
  void *v55;
  uint64_t v56;
  UIView *headerDropShadowView;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  CNUIUserActivityManager *activityManager;
  uint64_t v63;
  NSArray *customActions;
  CNUIContactStoreSaveExecutor *v65;
  CNUIContactSaveExecutor *saveContactExecutor;
  CNUIContactStoreLinkedContactSaveExecutor *v67;
  CNUIContactSaveExecutor *saveLinkedContactsExecutor;
  UIGestureRecognizerDelegate *previousBackGestureDelegate;
  NSArray *pendingLayoutBlocks;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  objc_super v86;
  void *v87;
  _QWORD v88[2];

  v88[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v86.receiver = self;
  v86.super_class = (Class)CNContactContentUnitaryViewController;
  v6 = -[CNContactContentViewController initWithEnvironment:](&v86, sel_initWithEnvironment_, v5);
  objc_storeStrong((id *)&v6->_environment, a3);
  v7 = objc_alloc_init(CNContactViewCache);
  contactViewCache = v6->_contactViewCache;
  v6->_contactViewCache = v7;

  if (objc_msgSend(MEMORY[0x1E0C97310], "deviceSupportsGemini"))
  {
    v9 = [CNUIGeminiDataSource alloc];
    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "geminiManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CNUIGeminiDataSource initWithGeminiManager:](v9, "initWithGeminiManager:", v11);
    geminiDataSource = v6->_geminiDataSource;
    v6->_geminiDataSource = (CNUIGeminiDataSource *)v12;

    -[CNUIGeminiDataSource setDelegate:](v6->_geminiDataSource, "setDelegate:", v6);
  }
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "defaultSchedulerProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mainThreadScheduler");
  v16 = objc_claimAutoreleasedReturnValue();
  mainThreadScheduler = v6->_mainThreadScheduler;
  v6->_mainThreadScheduler = (CNScheduler *)v16;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "defaultSchedulerProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "newSerialSchedulerWithName:", CFSTR("com.apple.ContactsUI.ktWorkQueue"));
  ktWorkQueue = v6->_ktWorkQueue;
  v6->_ktWorkQueue = (CNScheduler *)v20;

  v22 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *(_OWORD *)&v6->_peripheryInsets.top = *MEMORY[0x1E0DC49E8];
  *(_OWORD *)&v6->_peripheryInsets.bottom = v22;
  objc_storeWeak((id *)&v6->_presentingDelegate, v6);
  v6->_allowsEditing = 1;
  v6->_allowsActions = 1;
  v6->_allowsCardActions = 1;
  v6->_allowsConferencing = 1;
  v6->_allowsSharing = 1;
  v6->_allowsAddToFavorites = 1;
  v6->_allowsContactBlocking = 0;
  v6->_allowsContactBlockingAndReporting = 0;
  v6->_allowsAddingToAddressBook = 1;
  v6->_allowsSendMessage = 1;
  v6->_allowsSettingLinkedContactsAsPreferred = 1;
  v6->_allowsActionsModel = 1;
  v6->_allowsDisplayModePickerActions = 1;
  v6->_allowsEditPhoto = 1;
  v6->_showsInlineActions = 1;
  v6->_showsSharedProfile = 1;
  v6->_showsGroupMembership = 1;
  v6->_hideCardActions = 0;
  v6->_isMailVIP = 0;
  v6->_showContactBlockingFirst = 0;
  objc_msgSend(MEMORY[0x1E0C97218], "sharedFullNameFormatter");
  v23 = objc_claimAutoreleasedReturnValue();
  contactFormatter = v6->_contactFormatter;
  v6->_contactFormatter = (CNContactFormatter *)v23;

  +[CNContactView allCardProperties](CNContactView, "allCardProperties");
  v25 = objc_claimAutoreleasedReturnValue();
  displayedProperties = v6->_displayedProperties;
  v6->_displayedProperties = (NSArray *)v25;

  v27 = objc_alloc(MEMORY[0x1E0D13D88]);
  objc_msgSend(v5, "actionDiscoveringEnvironment");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "initWithDiscoveringEnvironment:", v28);
  actionsDataSource = v6->_actionsDataSource;
  v6->_actionsDataSource = (CNUIUserActionListDataSource *)v29;

  -[CNContactContentUnitaryViewController createActionsController](v6, "createActionsController");
  v31 = objc_claimAutoreleasedReturnValue();
  actionsViewController = v6->_actionsViewController;
  v6->_actionsViewController = (CNContactInlineActionsViewController *)v31;

  -[CNContactInlineActionsViewController setObjectViewControllerDelegate:](v6->_actionsViewController, "setObjectViewControllerDelegate:", v6);
  -[CNContactInlineActionsViewController setDelegate:](v6->_actionsViewController, "setDelegate:", v6);
  -[CNContactContentUnitaryViewController addChildViewController:](v6, "addChildViewController:", v6->_actionsViewController);
  -[CNContactInlineActionsViewController didMoveToParentViewController:](v6->_actionsViewController, "didMoveToParentViewController:", v6);
  v33 = [CNContactActionsContainerView alloc];
  -[CNContactInlineActionsViewController view](v6->_actionsViewController, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[CNContactActionsContainerView initWithArrangedSubviews:](v33, "initWithArrangedSubviews:", v35);
  actionsWrapperView = v6->_actionsWrapperView;
  v6->_actionsWrapperView = (CNContactActionsContainerView *)v36;

  -[CNContactActionsContainerView setTranslatesAutoresizingMaskIntoConstraints:](v6->_actionsWrapperView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v38 = *MEMORY[0x1E0CFAA78];
  -[CNContactInlineActionsViewController view](v6->_actionsViewController, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setMinimumLayoutSize:", v38, 35.0);

  if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](v6, "shouldUseStaticHeader"))
  {
    -[CNContactContentUnitaryViewController createActionsController](v6, "createActionsController");
    v40 = objc_claimAutoreleasedReturnValue();
    floatingActionsViewController = v6->_floatingActionsViewController;
    v6->_floatingActionsViewController = (CNContactInlineActionsViewController *)v40;

    -[CNContactInlineActionsViewController setObjectViewControllerDelegate:](v6->_floatingActionsViewController, "setObjectViewControllerDelegate:", v6);
    -[CNContactInlineActionsViewController setDelegate:](v6->_floatingActionsViewController, "setDelegate:", v6);
    -[CNContactContentUnitaryViewController addChildViewController:](v6, "addChildViewController:", v6->_floatingActionsViewController);
    -[CNContactInlineActionsViewController didMoveToParentViewController:](v6->_floatingActionsViewController, "didMoveToParentViewController:", v6);
    v42 = [CNContactActionsContainerView alloc];
    -[CNContactInlineActionsViewController view](v6->_floatingActionsViewController, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[CNContactActionsContainerView initWithArrangedSubviews:](v42, "initWithArrangedSubviews:", v44);
    floatingActionsWrapperView = v6->_floatingActionsWrapperView;
    v6->_floatingActionsWrapperView = (CNContactActionsContainerView *)v45;

    -[CNContactActionsContainerView setTranslatesAutoresizingMaskIntoConstraints:](v6->_floatingActionsWrapperView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[CNUIColorRepository transparentBackgroundColor](CNUIColorRepository, "transparentBackgroundColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactActionsContainerView setBackgroundColor:](v6->_floatingActionsWrapperView, "setBackgroundColor:", v47);

    -[CNContactInlineActionsViewController view](v6->_floatingActionsViewController, "view");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setMinimumLayoutSize:", v38, 35.0);

    v49 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v50 = objc_claimAutoreleasedReturnValue();
    -[UIView layer](v49, "layer");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addSublayer:", v50);

    contactViewBackgroundView = v6->_contactViewBackgroundView;
    v6->_contactViewBackgroundView = v49;
    v53 = v49;

    contactViewBackgroundGradientLayer = v6->_contactViewBackgroundGradientLayer;
    v6->_contactViewBackgroundGradientLayer = (CAGradientLayer *)v50;

    -[CNContactContentUnitaryViewController displayContactView](v6, "displayContactView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setBackgroundView:", v53);

  }
  v56 = objc_opt_new();
  headerDropShadowView = v6->_headerDropShadowView;
  v6->_headerDropShadowView = (UIView *)v56;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6->_headerDropShadowView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNContactContentUnitaryViewController environment](v6, "environment");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v58, "runningInContactsAppOniPad") & 1) != 0)
  {
    -[UIView backgroundColor](v6->_headerDropShadowView, "backgroundColor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6->_headerDropShadowView, "setBackgroundColor:", v59);
  }
  else
  {
    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "contactHeaderDropShadowColor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6->_headerDropShadowView, "setBackgroundColor:", v60);

  }
  objc_msgSend(v5, "inProcessActivityManager");
  v61 = objc_claimAutoreleasedReturnValue();
  activityManager = v6->_activityManager;
  v6->_activityManager = (CNUIUserActivityManager *)v61;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v63 = objc_claimAutoreleasedReturnValue();
  customActions = v6->_customActions;
  v6->_customActions = (NSArray *)v63;

  v65 = objc_alloc_init(CNUIContactStoreSaveExecutor);
  saveContactExecutor = v6->_saveContactExecutor;
  v6->_saveContactExecutor = (CNUIContactSaveExecutor *)v65;

  v67 = objc_alloc_init(CNUIContactStoreLinkedContactSaveExecutor);
  saveLinkedContactsExecutor = v6->_saveLinkedContactsExecutor;
  v6->_saveLinkedContactsExecutor = (CNUIContactSaveExecutor *)v67;

  previousBackGestureDelegate = v6->_previousBackGestureDelegate;
  v6->_previousBackGestureDelegate = 0;

  pendingLayoutBlocks = v6->_pendingLayoutBlocks;
  v6->_pendingLayoutBlocks = (NSArray *)MEMORY[0x1E0C9AA60];

  -[CNContactContentUnitaryViewController setNeedsReloadLazy](v6, "setNeedsReloadLazy");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "addObserver:selector:name:object:", v6, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "addObserver:selector:name:object:", v6, sel_localeDidChange_, *MEMORY[0x1E0C99720], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "addObserver:selector:name:object:", v6, sel_contactStoreDidChangeWithNotification_, *MEMORY[0x1E0C96870], 0);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "addObserver:selector:name:object:suspensionBehavior:", v6, sel_contactStoreDidChangeWithNotification_, *MEMORY[0x1E0D136D0], 0, 4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "addObserver:selector:name:object:", v6, sel_keyboardDidShowNotification_, *MEMORY[0x1E0DC4E70], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObserver:selector:name:object:", v6, sel_keyboardWillHideNotification_, *MEMORY[0x1E0DC4FE0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "addObserver:selector:name:object:", v6, sel_favoritesDidChangeWithNotification_, *MEMORY[0x1E0C968E0], 0);

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "featureFlags");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_supportsDrafts = objc_msgSend(v79, "isFeatureEnabled:", 18);

  if (-[CNContactContentUnitaryViewController supportsDrafts](v6, "supportsDrafts"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "addObserver:selector:name:object:", v6, sel_applicationLeftForeground_, *MEMORY[0x1E0DC4868], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "addObserver:selector:name:object:", v6, sel_applicationLeftForeground_, *MEMORY[0x1E0DC4870], 0);

  }
  -[CNContactContentUnitaryViewController setRestorationIdentifier:](v6, "setRestorationIdentifier:", CFSTR("ContactCard"));
  -[CNContactContentUnitaryViewController setRestorationClass:](v6, "setRestorationClass:", objc_opt_class());
  -[CNContactContentUnitaryViewController navigationItem](v6, "navigationItem");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "_setBackgroundHidden:", 1);

  -[CNContactContentUnitaryViewController navigationItem](v6, "navigationItem");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setLargeTitleDisplayMode:", 2);

  v84 = -[CNContactContentUnitaryViewController applyContactStyle](v6, "applyContactStyle");
  return v6;
}

void __82__CNContactContentUnitaryViewController_descriptorForRequiredKeysWithDescription___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[57];

  v39[56] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C966E8];
  v3 = *MEMORY[0x1E0C96768];
  v4 = *MEMORY[0x1E0C966D0];
  v39[2] = *MEMORY[0x1E0C96790];
  v39[3] = v4;
  v5 = *MEMORY[0x1E0C966C0];
  v39[4] = *MEMORY[0x1E0C96780];
  v39[5] = v5;
  v6 = *MEMORY[0x1E0C96798];
  v39[6] = *MEMORY[0x1E0C96820];
  v39[7] = v6;
  v7 = *MEMORY[0x1E0C967D8];
  v39[8] = *MEMORY[0x1E0C967A0];
  v39[9] = v7;
  v8 = *MEMORY[0x1E0C967D0];
  v39[10] = *MEMORY[0x1E0C967E0];
  v39[11] = v8;
  v9 = *MEMORY[0x1E0C967E8];
  v39[12] = *MEMORY[0x1E0C967B8];
  v39[13] = v9;
  v10 = *MEMORY[0x1E0C96758];
  v39[14] = *MEMORY[0x1E0C96698];
  v39[15] = v10;
  v11 = *MEMORY[0x1E0C96670];
  v39[16] = *MEMORY[0x1E0C96668];
  v39[17] = v11;
  v12 = *MEMORY[0x1E0C967B0];
  v39[18] = *MEMORY[0x1E0C967A8];
  v39[19] = v12;
  v13 = *MEMORY[0x1E0C96890];
  v39[20] = *MEMORY[0x1E0C96708];
  v39[21] = v13;
  v14 = *MEMORY[0x1E0C96898];
  v39[22] = *MEMORY[0x1E0C96700];
  v39[23] = v14;
  v15 = *MEMORY[0x1E0C966A8];
  v39[24] = *MEMORY[0x1E0C967C0];
  v39[25] = v15;
  v16 = *MEMORY[0x1E0C96690];
  v39[26] = *MEMORY[0x1E0C967F0];
  v39[27] = v16;
  v17 = *MEMORY[0x1E0C96840];
  v39[28] = *MEMORY[0x1E0C968A0];
  v39[29] = v17;
  v18 = *MEMORY[0x1E0C96740];
  v39[30] = *MEMORY[0x1E0C96868];
  v39[31] = v18;
  v39[0] = v2;
  v39[1] = v3;
  v39[32] = *MEMORY[0x1E0C966E0];
  v39[33] = v3;
  v19 = *MEMORY[0x1E0C96888];
  v39[34] = *MEMORY[0x1E0C96680];
  v39[35] = v19;
  v20 = *MEMORY[0x1E0C96770];
  v39[36] = *MEMORY[0x1E0C96688];
  v39[37] = v20;
  v21 = *MEMORY[0x1E0C96728];
  v39[38] = *MEMORY[0x1E0C96678];
  v39[39] = v21;
  v22 = *MEMORY[0x1E0C96778];
  v39[40] = *MEMORY[0x1E0C96710];
  v39[41] = v22;
  v23 = *MEMORY[0x1E0C968A8];
  v39[42] = *MEMORY[0x1E0D13C50];
  v39[43] = v23;
  v24 = *MEMORY[0x1E0C968B8];
  v39[44] = *MEMORY[0x1E0C968B0];
  v39[45] = v24;
  v25 = *MEMORY[0x1E0C96858];
  v39[46] = *MEMORY[0x1E0C96860];
  v39[47] = v25;
  v26 = *MEMORY[0x1E0C966C8];
  v39[48] = *MEMORY[0x1E0C967C8];
  v39[49] = v26;
  v27 = *MEMORY[0x1E0C96828];
  v39[50] = *MEMORY[0x1E0C96830];
  v39[51] = v27;
  objc_msgSend(MEMORY[0x1E0C97310], "descriptorForRequiredKeys");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *MEMORY[0x1E0C966A0];
  v39[52] = v28;
  v39[53] = v29;
  objc_msgSend(MEMORY[0x1E0C97218], "sharedFullNameFormatter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "descriptorForRequiredKeys");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39[54] = v31;
  objc_msgSend(MEMORY[0x1E0C97218], "sharedFullNameFormatter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactHeaderDisplayView descriptorForRequiredKeysForContactFormatter:](CNContactHeaderDisplayView, "descriptorForRequiredKeysForContactFormatter:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39[55] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 56);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNSiriContactContextProvider descriptorForRequiredKeys](CNSiriContactContextProvider, "descriptorForRequiredKeys");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    objc_msgSend(v34, "arrayByAddingObject:", v35);
    v36 = objc_claimAutoreleasedReturnValue();

    v34 = (void *)v36;
  }
  objc_msgSend(MEMORY[0x1E0C97200], "descriptorWithKeyDescriptors:description:", v34, *(_QWORD *)(a1 + 32));
  v37 = objc_claimAutoreleasedReturnValue();

  v38 = (void *)descriptorForRequiredKeysWithDescription__cn_once_object_10;
  descriptorForRequiredKeysWithDescription__cn_once_object_10 = v37;

}

- (id)createActionsController
{
  CNContactInlineActionsViewController *v3;
  CNUIUserActionListDataSource *actionsDataSource;
  void *v5;
  CNContactInlineActionsViewController *v6;
  void *v7;
  void *v8;
  double v9;

  v3 = [CNContactInlineActionsViewController alloc];
  actionsDataSource = self->_actionsDataSource;
  -[CNContactContentUnitaryViewController environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNContactInlineActionsViewController initWithActionListDataSource:environment:](v3, "initWithActionListDataSource:environment:", actionsDataSource, v5);

  -[CNContactInlineActionsViewController setDisplaysTitles:](v6, "setDisplaysTitles:", 1);
  -[CNContactInlineActionsViewController setDisplaysUnavailableActionTypes:](v6, "setDisplaysUnavailableActionTypes:", 1);
  if (-[CNContactContentUnitaryViewController showsInlineActions](self, "showsInlineActions"))
  {
    objc_msgSend(MEMORY[0x1E0D13D88], "allSupportedActionTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactInlineActionsViewController setSupportedActionTypes:](v6, "setSupportedActionTypes:", v7);

  }
  else
  {
    -[CNContactInlineActionsViewController setSupportedActionTypes:](v6, "setSupportedActionTypes:", MEMORY[0x1E0C9AA60]);
  }
  -[CNContactInlineActionsViewController view](v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 1148846080;
  objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 0, v9);

  return v6;
}

- (BOOL)showsInlineActions
{
  return self->_showsInlineActions;
}

- (BOOL)supportsDrafts
{
  return self->_supportsDrafts;
}

- (void)setNeedsReloadLazy
{
  self->_needsReload = 1;
}

- (void)propertyCellDidChangeLayout:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForCell:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v6, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("needsHeightCalculation"));
    objc_msgSend(v4, "_heightForRowAtIndexPath:", v5);
    objc_msgSend(v4, "_setHeight:forRowAtIndexPath:", v5);
  }

}

uint64_t __76__CNContactContentUnitaryViewController__reloadGameCenterGroupWithPreflight__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateGameCenterGroupAndActionsForContact:relationshipResults:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setShowsSharedProfile:(BOOL)a3
{
  self->_showsSharedProfile = a3;
}

- (void)setShowsGroupMembership:(BOOL)a3
{
  self->_showsGroupMembership = a3;
}

- (void)setShouldDrawNavigationBar:(BOOL)a3
{
  self->_shouldDrawNavigationBar = a3;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (void)setAllowsSharing:(BOOL)a3
{
  self->_allowsSharing = a3;
}

- (void)setAllowsNamePicking:(BOOL)a3
{
  self->_allowsNamePicking = a3;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (void)setAllowsEditInApp:(BOOL)a3
{
  self->_allowsEditInApp = a3;
}

- (void)setAllowsContactBlockingAndReporting:(BOOL)a3
{
  self->_allowsContactBlockingAndReporting = a3;
}

- (void)setAllowsContactBlocking:(BOOL)a3
{
  self->_allowsContactBlocking = a3;
}

- (void)setAllowsConferencing:(BOOL)a3
{
  self->_allowsConferencing = a3;
}

- (void)setAllowsCardActions:(BOOL)a3
{
  self->_allowsCardActions = a3;
}

- (void)setAllowsAddingToAddressBook:(BOOL)a3
{
  self->_allowsAddingToAddressBook = a3;
}

- (void)setAllowsAddToFavorites:(BOOL)a3
{
  self->_allowsAddToFavorites = a3;
}

- (void)setContact:(id)a3 shouldScrollToTop:(BOOL)a4
{
  _BOOL4 v4;
  CNContact *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  CNContactAddToGroupAction *addToGroupAction;
  CNContactAddAddressingGrammarAction *addAddressingGrammarAction;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  uint64_t v50;
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
  char isKindOfClass;
  void *v63;
  CNMutableContact **p_mutableContact;
  NSObject *v65;
  void *v66;
  CNMutableContact *v67;
  CNContactActionProvider *v68;
  CNMutableContact *v69;
  void *v70;
  void *v71;
  void *v72;
  CNContactActionProvider *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  CNCardGroup *v78;
  CNCardGroup *cardTopGroup;
  CNCardGroup *v80;
  CNCardGroup *cardBottomGroup;
  CNCardGroup *v82;
  CNCardGroup *cardActionsGroup;
  CNCardGroup *v84;
  CNCardGroup *cardShareLocationGroup;
  CNCardGroup *v86;
  CNCardGroup *cardBlockContactGroup;
  CNCardGroup *v88;
  CNCardGroup *cardFooterGroup;
  CNCardGroup *v90;
  CNCardGroup *cardEditingActionsGroup;
  CNCardGroup *v92;
  CNCardGroup *cardEditingDeleteContactGroup;
  NSDictionary *propertyGroups;
  void *v95;
  CNSiriContactContextProvider *v96;
  void *v97;
  CNSiriContactContextProvider *v98;
  void *v99;
  CNPropertyLinkedCardsAction *linkedCardsAction;
  CNContactAddLinkedCardAction *addLinkedCardAction;
  void *v102;
  CNCardStaticIdentityGroup *cardStaticIdentityGroup;
  CNUIStaticIdentity *cachedStaticIdentity;
  NSMutableSet *cachedVerifiedHandles;
  CNMutableContact *mutableContactForHeaderView;
  CNSharedProfileStateOracle *sharedProfileStateOracle;
  void *v108;
  void *v109;
  _BOOL4 v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  id v137;
  _BOOL4 v138;
  id v139;
  _QWORD v140[5];
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  id v145;
  _QWORD v146[4];
  id v147;
  uint8_t buf[4];
  void *v149;
  __int16 v150;
  CNMutableContact *v151;
  _BYTE v152[128];
  void *v153;
  void *v154;
  uint64_t v155;
  _QWORD v156[4];

  v4 = a4;
  v156[1] = *MEMORY[0x1E0C80C00];
  v6 = (CNContact *)a3;
  v7 = v6;
  self->_needsRefetch = 0;
  if (self->_contact == v6)
    goto LABEL_58;
  -[CNContact identifier](v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact identifier](self->_contact, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    -[CNContactContentUnitaryViewController setDidSetNewContact:](self, "setDidSetNewContact:", 1);
    addToGroupAction = self->_addToGroupAction;
    self->_addToGroupAction = 0;

    addAddressingGrammarAction = self->_addAddressingGrammarAction;
    self->_addAddressingGrammarAction = 0;

    -[CNContactContentUnitaryViewController setEmergencyContactAction:](self, "setEmergencyContactAction:", 0);
    -[CNContactContentUnitaryViewController setBannerActionTypeForEffectiveState:](self, "setBannerActionTypeForEffectiveState:", 0);
    -[CNContactContentUnitaryViewController setTappedSharedProfileBannerAction:](self, "setTappedSharedProfileBannerAction:", 0);
    -[CNContactContentUnitaryViewController setDismissedSharedProfileBannerAction:](self, "setDismissedSharedProfileBannerAction:", 0);
    -[CNContactContentUnitaryViewController setHasPerformedSharedProfileBannerAnimation:](self, "setHasPerformedSharedProfileBannerAnimation:", 0);
    -[CNContactContentUnitaryViewController setDidEditPronouns:](self, "setDidEditPronouns:", 0);
  }
  -[CNContactContentUnitaryViewController environment](self, "environment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "defaultSchedulerProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "suspendBackgroundScheduler");
  objc_msgSend(v14, "afterCACommitScheduler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v146[0] = MEMORY[0x1E0C809B0];
  v146[1] = 3221225472;
  v146[2] = __70__CNContactContentUnitaryViewController_setContact_shouldScrollToTop___block_invoke;
  v146[3] = &unk_1E204F648;
  v139 = v14;
  v147 = v139;
  objc_msgSend(v15, "performBlock:", v146);

  -[CNContactContentUnitaryViewController contactViewCache](self, "contactViewCache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resetCache");

  LODWORD(v16) = -[CNContactContentUnitaryViewController isOutOfProcess](self, "isOutOfProcess");
  objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeys");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if ((_DWORD)v16)
  {
    v156[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v156, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController _updateContact:withMissingKeysFromRequiredKeys:](self, "_updateContact:withMissingKeysFromRequiredKeys:", v7, v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v20;
  }
  else
  {
    v155 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v155, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assertKeysAreAvailable:", v19);
  }

  -[CNContactContentUnitaryViewController resetEditAuthorizationState](self, "resetEditAuthorizationState");
  -[CNContactContentViewController parentContainer](self, "parentContainer");
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
    goto LABEL_10;
  v22 = (void *)v21;
  -[CNContactContentViewController parentContainer](self, "parentContainer");
  v23 = objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
LABEL_11:

    goto LABEL_12;
  }
  v24 = (void *)v23;
  v25 = objc_msgSend(v7, "hasBeenPersisted");

  if (v25)
  {
LABEL_10:
    -[CNContactContentUnitaryViewController contactViewCache](self, "contactViewCache");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "containerForContact:", v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentViewController setParentContainer:](self, "setParentContainer:", v26);

    goto LABEL_11;
  }
LABEL_12:
  -[CNContactContentUnitaryViewController setContainerContext:](self, "setContainerContext:", 0);
  -[CNContactContentUnitaryViewController contactViewCache](self, "contactViewCache");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "policyForContact:", v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentViewController parentContainer](self, "parentContainer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "type");

  if (!objc_msgSend(v28, "isReadonly") || v30 == 1003)
    goto LABEL_36;
  v31 = v28;
  v138 = v4;
  -[CNContactContentUnitaryViewController contactStore](self, "contactStore");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeysForContact:", v7);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v154, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = 0;
  objc_msgSend(v32, "unifiedContactWithIdentifier:keysToFetch:error:", v33, v35, &v145);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v145;

  if (v36)
  {
    v37 = v36;

    -[CNContactContentUnitaryViewController contactViewCache](self, "contactViewCache");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "policyForContact:", v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v39, "isReadonly"))
    {
      v133 = v39;
      v135 = v36;
      v40 = objc_alloc_init(MEMORY[0x1E0C97360]);
      objc_msgSend(v37, "availableKeyDescriptor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = v41;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v153, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(v40, "copyWithPropertyKeys:", v42);
      v44 = (void *)objc_msgSend(v43, "mutableCopy");
      -[CNContactContentUnitaryViewController setShadowCopyOfReadonlyContact:](self, "setShadowCopyOfReadonlyContact:", v44);

      v143 = 0u;
      v144 = 0u;
      v141 = 0u;
      v142 = 0u;
      +[CNContactView nameProperties](CNContactView, "nameProperties");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v141, v152, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v142;
        do
        {
          for (i = 0; i != v47; ++i)
          {
            if (*(_QWORD *)v142 != v48)
              objc_enumerationMutation(v45);
            v50 = *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * i);
            if (objc_msgSend(v37, "isKeyAvailable:", v50, v133, v135))
            {
              -[CNContactContentUnitaryViewController shadowCopyOfReadonlyContact](self, "shadowCopyOfReadonlyContact");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "valueForKey:", v50);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "setValue:forKey:", v52, v50);

            }
          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v141, v152, 16);
        }
        while (v47);
      }

      v53 = (void *)MEMORY[0x1E0C99DE8];
      -[CNContactContentUnitaryViewController shadowCopyOfReadonlyContact](self, "shadowCopyOfReadonlyContact");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "arrayWithObject:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v37, "isUnified"))
      {
        objc_msgSend(v37, "linkedContacts");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "addObjectsFromArray:", v56);

      }
      else
      {
        objc_msgSend(v55, "addObject:", v37);
      }
      v57 = v137;
      objc_msgSend(MEMORY[0x1E0C97200], "unifyContacts:", v55, v133, v135);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNContactContentUnitaryViewController contactViewCache](self, "contactViewCache");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "policyForDefaultContainer");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController setPolicy:](self, "setPolicy:", v59);

      -[CNContactContentUnitaryViewController policy](self, "policy");
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v60 || v137)
      {
        objc_msgSend(MEMORY[0x1E0C97390], "sharedPermissivePolicy");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController setPolicy:](self, "setPolicy:", v61);

      }
      v4 = v138;
      v39 = v134;
      v36 = v136;
      goto LABEL_35;
    }
    v7 = v37;
  }
  else
  {
    v39 = v31;
  }
  v4 = v138;
  v57 = v137;
LABEL_35:

  v28 = v39;
LABEL_36:
  objc_storeStrong((id *)&self->_contact, v7);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v63 = v7;
  if ((isKindOfClass & 1) == 0)
    v63 = (void *)objc_msgSend(v7, "mutableCopy");
  p_mutableContact = &self->_mutableContact;
  objc_storeStrong((id *)&self->_mutableContact, v63);
  if ((isKindOfClass & 1) == 0)

  CNUILogContactCard();
  v65 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "identifier");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = *p_mutableContact;
    *(_DWORD *)buf = 138543618;
    v149 = v66;
    v150 = 2050;
    v151 = v67;
    _os_log_impl(&dword_18AC56000, v65, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] setting contact with identifier %{public}@, mutable contact %{public}p", buf, 0x16u);

  }
  v68 = [CNContactActionProvider alloc];
  v69 = *p_mutableContact;
  -[CNContactContentViewController parentContainer](self, "parentContainer");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController contactViewCache](self, "contactViewCache");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "contactStore");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = -[CNContactActionProvider initWithContact:inContainer:contactStore:](v68, "initWithContact:inContainer:contactStore:", v69, v70, v72);
  -[CNContactContentUnitaryViewController setActionProvider:](self, "setActionProvider:", v73);

  -[CNContactContentUnitaryViewController actionProvider](self, "actionProvider");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setActionDelegate:", self);

  -[CNContactContentUnitaryViewController customActions](self, "customActions");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v140[0] = MEMORY[0x1E0C809B0];
  v140[1] = 3221225472;
  v140[2] = __70__CNContactContentUnitaryViewController_setContact_shouldScrollToTop___block_invoke_272;
  v140[3] = &unk_1E204F6B8;
  v140[4] = self;
  objc_msgSend(v75, "_cn_filter:", v140);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController setCustomActions:](self, "setCustomActions:", v76);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController setGroupsAfterGroup:](self, "setGroupsAfterGroup:", v77);

  v78 = -[CNCardGroup initWithContact:]([CNCardGroup alloc], "initWithContact:", *p_mutableContact);
  cardTopGroup = self->_cardTopGroup;
  self->_cardTopGroup = v78;

  v80 = -[CNCardGroup initWithContact:]([CNCardGroup alloc], "initWithContact:", *p_mutableContact);
  cardBottomGroup = self->_cardBottomGroup;
  self->_cardBottomGroup = v80;

  -[CNCardGroup setAddSpacerFromPreviousGroup:](self->_cardBottomGroup, "setAddSpacerFromPreviousGroup:", 1);
  v82 = -[CNCardGroup initWithContact:]([CNCardGroup alloc], "initWithContact:", *p_mutableContact);
  cardActionsGroup = self->_cardActionsGroup;
  self->_cardActionsGroup = v82;

  v84 = -[CNCardGroup initWithContact:]([CNCardGroup alloc], "initWithContact:", *p_mutableContact);
  cardShareLocationGroup = self->_cardShareLocationGroup;
  self->_cardShareLocationGroup = v84;

  v86 = -[CNCardGroup initWithContact:]([CNCardGroup alloc], "initWithContact:", *p_mutableContact);
  cardBlockContactGroup = self->_cardBlockContactGroup;
  self->_cardBlockContactGroup = v86;

  -[CNCardGroup setAddSpacerFromPreviousGroup:](self->_cardBlockContactGroup, "setAddSpacerFromPreviousGroup:", 1);
  v88 = -[CNCardGroup initWithContact:]([CNCardGroup alloc], "initWithContact:", *p_mutableContact);
  cardFooterGroup = self->_cardFooterGroup;
  self->_cardFooterGroup = v88;

  -[CNCardGroup setAddSpacerFromPreviousGroup:](self->_cardFooterGroup, "setAddSpacerFromPreviousGroup:", 1);
  v90 = -[CNCardGroup initWithContact:]([CNCardGroup alloc], "initWithContact:", *p_mutableContact);
  cardEditingActionsGroup = self->_cardEditingActionsGroup;
  self->_cardEditingActionsGroup = v90;

  v92 = -[CNCardGroup initWithContact:]([CNCardGroup alloc], "initWithContact:", *p_mutableContact);
  cardEditingDeleteContactGroup = self->_cardEditingDeleteContactGroup;
  self->_cardEditingDeleteContactGroup = v92;

  propertyGroups = self->_propertyGroups;
  self->_propertyGroups = 0;

  -[CNContactContentUnitaryViewController siriContextProvider](self, "siriContextProvider");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v76) = objc_msgSend(v95, "isEnabled");

  v96 = [CNSiriContactContextProvider alloc];
  -[CNContactContentUnitaryViewController contactStore](self, "contactStore");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = -[CNSiriContactContextProvider initWithContact:store:](v96, "initWithContact:store:", v7, v97);
  -[CNContactContentUnitaryViewController setSiriContextProvider:](self, "setSiriContextProvider:", v98);

  if ((_DWORD)v76)
  {
    -[CNContactContentUnitaryViewController siriContextProvider](self, "siriContextProvider");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setEnabled:", 1);

  }
  linkedCardsAction = self->_linkedCardsAction;
  self->_linkedCardsAction = 0;

  addLinkedCardAction = self->_addLinkedCardAction;
  self->_addLinkedCardAction = 0;

  -[CNContactContentUnitaryViewController setCardFaceTimeGroup:](self, "setCardFaceTimeGroup:", 0);
  -[CNContactContentUnitaryViewController setFaceTimeAction:](self, "setFaceTimeAction:", 0);
  -[CNContactContentUnitaryViewController setFaceTimeAudioAction:](self, "setFaceTimeAudioAction:", 0);
  -[CNContactContentUnitaryViewController setSendMessageAction:](self, "setSendMessageAction:", 0);
  -[CNContactContentUnitaryViewController setBlockAction:](self, "setBlockAction:", 0);
  -[CNContactContentUnitaryViewController setBlockReportAction:](self, "setBlockReportAction:", 0);
  -[CNContactContentUnitaryViewController setAddFavoriteAction:](self, "setAddFavoriteAction:", 0);
  -[CNContactContentUnitaryViewController setCreateReminderAction:](self, "setCreateReminderAction:", 0);
  -[CNContactContentUnitaryViewController setShareContactAction:](self, "setShareContactAction:", 0);
  -[CNContactContentUnitaryViewController setIgnoreContactAction:](self, "setIgnoreContactAction:", 0);
  -[CNContactContentUnitaryViewController setCardMedicalIDGroup:](self, "setCardMedicalIDGroup:", 0);
  -[CNContactContentUnitaryViewController setMedicalIDAction:](self, "setMedicalIDAction:", 0);
  -[CNContactContentUnitaryViewController setGameCenterGroup:](self, "setGameCenterGroup:", 0);
  -[CNContactContentUnitaryViewController setCardGameCenterActionGroup:](self, "setCardGameCenterActionGroup:", 0);
  -[CNContactContentUnitaryViewController setNamePickingGroup:](self, "setNamePickingGroup:", 0);
  -[CNContactContentUnitaryViewController setCardSharedProfileGroup:](self, "setCardSharedProfileGroup:", 0);
  -[CNContactContentUnitaryViewController setMeCardSharedProfileGroup:](self, "setMeCardSharedProfileGroup:", 0);
  -[CNContactContentUnitaryViewController setCardEditingGeminiGroup:](self, "setCardEditingGeminiGroup:", 0);
  -[CNContactContentUnitaryViewController geminiDataSource](self, "geminiDataSource");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setContact:", v7);

  cardStaticIdentityGroup = self->_cardStaticIdentityGroup;
  self->_cardStaticIdentityGroup = 0;

  self->_didLookUpStaticIdentity = 0;
  cachedStaticIdentity = self->_cachedStaticIdentity;
  self->_cachedStaticIdentity = 0;

  self->_didFindStaticIdentity = 0;
  cachedVerifiedHandles = self->_cachedVerifiedHandles;
  self->_cachedVerifiedHandles = 0;

  mutableContactForHeaderView = self->_mutableContactForHeaderView;
  self->_mutableContactForHeaderView = 0;

  sharedProfileStateOracle = self->_sharedProfileStateOracle;
  self->_sharedProfileStateOracle = 0;

  if (!-[CNContactContentUnitaryViewController isOutOfProcess](self, "isOutOfProcess")
    || -[CNContactContentUnitaryViewController outOfProcessSetupComplete](self, "outOfProcessSetupComplete"))
  {
    if (self->_editingHeaderView)
    {
      -[CNContactContentUnitaryViewController editingHeaderView](self, "editingHeaderView");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController mutableContactForHeaderView](self, "mutableContactForHeaderView");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "updateWithNewContact:", v109);

    }
    v110 = -[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader");
    -[CNContactContentUnitaryViewController authorizationCheck](self, "authorizationCheck");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = objc_msgSend(v111, "shouldPromptForPasscodeAuthorization");
    if (v110)
    {
      -[CNContactContentUnitaryViewController staticDisplayHeaderView](self, "staticDisplayHeaderView");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "setIsRestrictedContact:", v112);

      v114 = (void *)MEMORY[0x1E0C972D8];
      -[CNContactContentUnitaryViewController mutableContactForHeaderView](self, "mutableContactForHeaderView");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = objc_msgSend(v114, "isWhitelistedContact:", v115);
      -[CNContactContentUnitaryViewController staticDisplayHeaderView](self, "staticDisplayHeaderView");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "setIsDowntimeContact:", v116);

      -[CNContactContentUnitaryViewController staticDisplayHeaderView](self, "staticDisplayHeaderView");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController mutableContactForHeaderView](self, "mutableContactForHeaderView");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "updateWithNewContact:", v119);

      -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
    }
    else
    {
      -[CNContactContentUnitaryViewController displayHeaderView](self, "displayHeaderView");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "setIsRestrictedContact:", v112);

      v121 = (void *)MEMORY[0x1E0C972D8];
      -[CNContactContentUnitaryViewController mutableContactForHeaderView](self, "mutableContactForHeaderView");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = objc_msgSend(v121, "isWhitelistedContact:", v122);
      -[CNContactContentUnitaryViewController displayHeaderView](self, "displayHeaderView");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "setIsDowntimeContact:", v123);

      -[CNContactContentUnitaryViewController displayHeaderView](self, "displayHeaderView");
    }
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController mutableContactForHeaderView](self, "mutableContactForHeaderView");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "updateWithNewContact:", v126);

    -[CNContactContentUnitaryViewController updateEditNavigationItemsAnimated:](self, "updateEditNavigationItemsAnimated:", 0);
  }
  -[CNContactContentUnitaryViewController setContactSupportsTTYCalls:](self, "setContactSupportsTTYCalls:", 0);
  -[CNContactContentUnitaryViewController shareLocationController](self, "shareLocationController");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "setContact:", v7);

  -[CNContactContentUnitaryViewController actionsViewController](self, "actionsViewController");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setContact:", v7);

  if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactContentUnitaryViewController floatingActionsViewController](self, "floatingActionsViewController");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "setContact:", v7);

  }
  -[CNContactContentUnitaryViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 0);
  if (-[CNContactContentUnitaryViewController isViewLoaded](self, "isViewLoaded") && v4)
  {
    -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController scrollScrollViewAllTheWayUp:](self, "scrollScrollViewAllTheWayUp:", v130);

  }
  +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "logContactShown:", v132);

  -[CNContactContentUnitaryViewController prepareContactDidAppearForPPT](self, "prepareContactDidAppearForPPT");
LABEL_58:

}

- (CNContactViewCache)contactViewCache
{
  return self->_contactViewCache;
}

- (void)updateEditNavigationItemsAnimated:(BOOL)a3
{
  -[CNContactContentUnitaryViewController updateEditNavigationItemsAnimated:updateTintColor:](self, "updateEditNavigationItemsAnimated:updateTintColor:", a3, 1);
}

- (CNMutableContact)mutableContactForHeaderView
{
  CNContactContentUnitaryViewController *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  id *p_mutableContact;
  id mutableContactForHeaderView;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t v25[8];
  _QWORD v26[4];
  id v27;

  v2 = self;
  if (!-[CNContactContentUnitaryViewController shouldUseSharedProfile](self, "shouldUseSharedProfile"))
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureEnabled:", 15);

  if (!v5
    || -[CNContactContentUnitaryViewController savingPersonalSharedProfile](v2, "savingPersonalSharedProfile")
    || (objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "nicknameProvider"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isNicknameSharingEnabled"),
        v7,
        v6,
        !v8))
  {
LABEL_10:
    p_mutableContact = (id *)&v2->_mutableContact;
    goto LABEL_11;
  }
  p_mutableContact = (id *)&v2->_mutableContactForHeaderView;
  mutableContactForHeaderView = v2->_mutableContactForHeaderView;
  if (mutableContactForHeaderView)
  {
LABEL_12:
    v2 = (CNContactContentUnitaryViewController *)mutableContactForHeaderView;
    return (CNMutableContact *)v2;
  }
  v11 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nicknameProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __68__CNContactContentUnitaryViewController_mutableContactForHeaderView__block_invoke;
  v26[3] = &unk_1E204F670;
  v14 = v11;
  v27 = v14;
  objc_msgSend(v13, "fetchPersonalNicknameAsContactWithCompletion:", v26);

  v15 = *MEMORY[0x1E0D13880];
  objc_msgSend(v14, "future");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resultWithTimeout:error:", 0, 0.2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    CNUILogContactCard();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_18AC56000, v19, OS_LOG_TYPE_DEFAULT, "Personal nickname fetched from IMNicknameProvider, me card will show shared profile photo and poster", v25, 2u);
    }

    objc_msgSend(v18, "imageData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableContact setImageData:](v2->_mutableContact, "setImageData:", v20);

    objc_msgSend(v18, "thumbnailImageData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableContact setThumbnailImageData:](v2->_mutableContact, "setThumbnailImageData:", v21);

    -[CNMutableContact setCropRect:](v2->_mutableContact, "setCropRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v18, "wallpaper");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableContact setWallpaper:](v2->_mutableContact, "setWallpaper:", v22);

    objc_msgSend(v18, "watchWallpaperImageData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutableContact setWatchWallpaperImageData:](v2->_mutableContact, "setWatchWallpaperImageData:", v23);

    objc_storeStrong((id *)&v2->_mutableContactForHeaderView, v2->_mutableContact);
  }
  else
  {
    objc_storeStrong((id *)&v2->_mutableContactForHeaderView, v2->_mutableContact);
    v2 = (CNContactContentUnitaryViewController *)*p_mutableContact;
  }

  if (v18)
  {
LABEL_11:
    mutableContactForHeaderView = *p_mutableContact;
    goto LABEL_12;
  }
  return (CNMutableContact *)v2;
}

- (BOOL)editRequiresAuthorization
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0D13CB8]);
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentViewController parentContainer](self, "parentContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNContactContentViewController ignoresParentalRestrictions](self, "ignoresParentalRestrictions");
  -[CNContactContentUnitaryViewController contactViewCache](self, "contactViewCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithContact:parentContainer:ignoresParentalRestrictions:linkedParentContainerProvider:", v4, v5, v6, v7);

  LOBYTE(v7) = objc_msgSend(v8, "shouldPromptForPasscodeAuthorization");
  return (char)v7;
}

- (CNSiriContactContextProvider)siriContextProvider
{
  return self->_siriContextProvider;
}

- (void)setTappedSharedProfileBannerAction:(unint64_t)a3
{
  self->_tappedSharedProfileBannerAction = a3;
}

- (void)setSendMessageAction:(id)a3
{
  objc_storeStrong((id *)&self->_sendMessageAction, a3);
}

- (void)setNamePickingGroup:(id)a3
{
  objc_storeStrong((id *)&self->_namePickingGroup, a3);
}

- (void)setMeCardSharedProfileGroup:(id)a3
{
  objc_storeStrong((id *)&self->_meCardSharedProfileGroup, a3);
}

- (void)setEmergencyContactAction:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyContactAction, a3);
}

- (void)setDismissedSharedProfileBannerAction:(unint64_t)a3
{
  self->_dismissedSharedProfileBannerAction = a3;
}

- (void)setCardSharedProfileGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardSharedProfileGroup, a3);
}

- (void)setAddFavoriteAction:(id)a3
{
  objc_storeStrong((id *)&self->_addFavoriteAction, a3);
}

- (void)reloadDataPreservingChanges:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
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
  NSDictionary *v36;
  NSDictionary *propertyGroups;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[16];
  _BYTE v52[128];
  uint64_t v53;

  v3 = a3;
  v53 = *MEMORY[0x1E0C80C00];
  if (-[CNContactContentUnitaryViewController isViewLoaded](self, "isViewLoaded")
    && (!-[CNContactContentUnitaryViewController isOutOfProcess](self, "isOutOfProcess")
     || -[CNContactContentUnitaryViewController outOfProcessSetupComplete](self, "outOfProcessSetupComplete")))
  {
    self->_needsReload = 0;
    -[CNContactContentUnitaryViewController contactStore](self, "contactStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[CNContactContentUnitaryViewController originalContacts](self, "originalContacts");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_cn_filter:", &__block_literal_global_288_60599);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "count"))
        v8 = 7;
      else
        v8 = 1;
      -[CNContactContentUnitaryViewController managedConfiguration](self, "managedConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = objc_alloc(MEMORY[0x1E0C97298]);
        -[CNContactContentUnitaryViewController environment](self, "environment");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "cnEnvironment");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController managedConfiguration](self, "managedConfiguration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v10, "initWithEnvironment:options:managedConfiguration:", v12, v8, v13);
        -[CNContactContentUnitaryViewController setContactStore:](self, "setContactStore:", v14);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C97298], "storeWithOptions:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController setContactStore:](self, "setContactStore:", v11);
      }

    }
    if (!-[CNContactContentUnitaryViewController mode](self, "mode"))
    {
      -[CNContactContentUnitaryViewController parentViewController](self, "parentViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_getClass("ABNewPersonViewController");
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        -[CNContactContentUnitaryViewController setMode:](self, "setMode:", 3);
    }
    if (objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) != 3)
    {
      CNUILogContactCard();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18AC56000, v17, OS_LOG_TYPE_ERROR, "CNContactContentViewController does not have authorization to access contacts.", buf, 2u);
      }

    }
    -[CNContactContentUnitaryViewController shadowCopyOfReadonlyContact](self, "shadowCopyOfReadonlyContact");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      -[CNContactContentUnitaryViewController contact](self, "contact");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController _policyForContact:mode:](self, "_policyForContact:mode:", v19, -[CNContactContentUnitaryViewController mode](self, "mode"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController setPolicy:](self, "setPolicy:", v20);

    }
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isUnified");

    if (v22)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      -[CNContactContentUnitaryViewController contact](self, "contact");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "linkedContacts");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v48 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            -[CNContactContentUnitaryViewController _policyForContact:mode:](self, "_policyForContact:mode:", v30, -[CNContactContentUnitaryViewController mode](self, "mode"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (v31)
            {
              objc_msgSend(v30, "identifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setObject:forKey:", v31, v32);

            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        }
        while (v27);
      }

      v33 = (void *)objc_msgSend(v23, "copy");
      -[CNContactContentUnitaryViewController setLinkedPoliciesByContactIdentifier:](self, "setLinkedPoliciesByContactIdentifier:", v33);

    }
    -[CNContactContentUnitaryViewController iMessageIDSLookupToken](self, "iMessageIDSLookupToken");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "cancel");

    -[CNContactContentUnitaryViewController faceTimeIDSLookupToken](self, "faceTimeIDSLookupToken");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "cancel");

    if (!self->_propertyGroups)
    {
      -[CNContactContentUnitaryViewController _loadPropertyGroups](self, "_loadPropertyGroups");
      v36 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      propertyGroups = self->_propertyGroups;
      self->_propertyGroups = v36;

    }
    -[CNContactContentUnitaryViewController _reloadStaticIdentityGroup](self, "_reloadStaticIdentityGroup");
    -[CNContactContentUnitaryViewController _reloadGeminiGroupPreservingChanges:](self, "_reloadGeminiGroupPreservingChanges:", v3);
    -[CNContactContentUnitaryViewController _reloadLinkedCardsGroup](self, "_reloadLinkedCardsGroup");
    -[CNContactContentUnitaryViewController _reloadGroupMembershipGroup](self, "_reloadGroupMembershipGroup");
    -[CNContactContentUnitaryViewController _reloadPropertyGroupsPreservingChanges:](self, "_reloadPropertyGroupsPreservingChanges:", v3);
    -[CNContactContentUnitaryViewController _reloadMedicalIDGroup](self, "_reloadMedicalIDGroup");
    -[CNContactContentUnitaryViewController _reloadAlertGroups](self, "_reloadAlertGroups");
    -[CNContactContentUnitaryViewController _reloadGameCenterGroup](self, "_reloadGameCenterGroup");
    -[CNContactContentUnitaryViewController _reloadNamePickingGroup](self, "_reloadNamePickingGroup");
    -[CNContactContentUnitaryViewController _reloadSharedProfileGroup](self, "_reloadSharedProfileGroup");
    -[CNContactContentUnitaryViewController _reloadMeCardSharedProfileGroup](self, "_reloadMeCardSharedProfileGroup");
    -[CNContactContentUnitaryViewController _reloadContainerContextPreservingChanges:](self, "_reloadContainerContextPreservingChanges:", v3);
    -[CNContactContentUnitaryViewController setupActionsPreservingChanges:](self, "setupActionsPreservingChanges:", v3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController setGroupsAfterGroup:](self, "setGroupsAfterGroup:", v38);

    -[CNContactContentUnitaryViewController _loadDisplayGroups](self, "_loadDisplayGroups");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController setDisplayGroups:](self, "setDisplayGroups:", v39);

    -[CNContactContentUnitaryViewController _loadEditingGroupsPreservingChanges:](self, "_loadEditingGroupsPreservingChanges:", v3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController setEditingGroups:](self, "setEditingGroups:", v40);

    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController setDeletedEditingGroups:](self, "setDeletedEditingGroups:", v41);

    }
    -[CNContactContentUnitaryViewController _setNeedsUpdateCachedLabelWidths](self, "_setNeedsUpdateCachedLabelWidths");
    -[CNContactContentUnitaryViewController _updateAvailableTransports](self, "_updateAvailableTransports");
    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "reloadData");

    -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "reloadDataPreservingChanges:", v3);

    if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
    {
      -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "reloadDataPreservingChanges:", v3);

    }
    if ((objc_msgSend(MEMORY[0x1E0C97200], "quickActionsEnabled") & 1) == 0)
      -[CNContactContentUnitaryViewController _reloadFaceTimeGroup](self, "_reloadFaceTimeGroup");
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __69__CNContactContentUnitaryViewController_reloadDataPreservingChanges___block_invoke_291;
    v46[3] = &unk_1E204F648;
    v46[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v46);
    -[CNContactContentUnitaryViewController _updateUserActivity](self, "_updateUserActivity");
    -[CNContactContentUnitaryViewController adjustPreferredContentSize](self, "adjustPreferredContentSize");
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController updateViewAnnotationWithContact:](self, "updateViewAnnotationWithContact:", v45);

  }
}

- (void)setGroupsAfterGroup:(id)a3
{
  objc_storeStrong((id *)&self->_groupsAfterGroup, a3);
}

- (CNMutableContact)shadowCopyOfReadonlyContact
{
  return self->_shadowCopyOfReadonlyContact;
}

- (void)setSiriContextProvider:(id)a3
{
  objc_storeStrong((id *)&self->_siriContextProvider, a3);
}

- (void)setPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_policy, a3);
}

- (void)setMedicalIDAction:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDAction, a3);
}

- (void)setIgnoreContactAction:(id)a3
{
  objc_storeStrong((id *)&self->_ignoreContactAction, a3);
}

- (void)setHasPerformedSharedProfileBannerAnimation:(BOOL)a3
{
  self->_hasPerformedSharedProfileBannerAnimation = a3;
}

- (void)setGameCenterGroup:(id)a3
{
  objc_storeStrong((id *)&self->_gameCenterGroup, a3);
}

- (void)setFaceTimeAudioAction:(id)a3
{
  objc_storeStrong((id *)&self->_faceTimeAudioAction, a3);
}

- (void)setFaceTimeAction:(id)a3
{
  objc_storeStrong((id *)&self->_faceTimeAction, a3);
}

- (void)setEditingGroups:(id)a3
{
  objc_storeStrong((id *)&self->_editingGroups, a3);
}

- (void)setEditAuthorizationResult:(int64_t)a3
{
  self->_editAuthorizationResult = a3;
}

- (void)setDisplayGroups:(id)a3
{
  objc_storeStrong((id *)&self->_displayGroups, a3);
}

- (void)setDidSetNewContact:(BOOL)a3
{
  self->_didSetNewContact = a3;
}

- (void)setDidEditPronouns:(BOOL)a3
{
  self->_didEditPronouns = a3;
}

- (void)setDeletedEditingGroups:(id)a3
{
  objc_storeStrong((id *)&self->_deletedEditingGroups, a3);
}

- (void)setCustomActions:(id)a3
{
  objc_storeStrong((id *)&self->_customActions, a3);
}

- (void)setCreateReminderAction:(id)a3
{
  objc_storeStrong((id *)&self->_createReminderAction, a3);
}

- (void)setContainerContext:(id)a3
{
  objc_storeStrong((id *)&self->_containerContext, a3);
}

- (void)setContactSupportsTTYCalls:(BOOL)a3
{
  self->_contactSupportsTTYCalls = a3;
}

- (void)setCardLinkedCardsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardLinkedCardsGroup, a3);
}

- (void)setCardGameCenterActionGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardGameCenterActionGroup, a3);
}

- (void)setCardFaceTimeGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardFaceTimeGroup, a3);
}

- (void)setBlockReportAction:(id)a3
{
  objc_storeStrong((id *)&self->_blockReportAction, a3);
}

- (void)setBlockAction:(id)a3
{
  objc_storeStrong((id *)&self->_blockAction, a3);
}

- (void)setBannerActionTypeForEffectiveState:(unint64_t)a3
{
  self->_bannerActionTypeForEffectiveState = a3;
}

- (void)setActionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_actionProvider, a3);
}

- (void)resetEditAuthorizationState
{
  -[CNContactContentUnitaryViewController setEditAuthorizationResult:](self, "setEditAuthorizationResult:", 1);
}

- (CNCancelable)iMessageIDSLookupToken
{
  return self->_iMessageIDSLookupToken;
}

- (CNCancelable)faceTimeIDSLookupToken
{
  return self->_faceTimeIDSLookupToken;
}

- (id)authorizationCheck
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0D13CB8]);
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentViewController parentContainer](self, "parentContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNContactContentViewController ignoresParentalRestrictions](self, "ignoresParentalRestrictions");
  -[CNContactContentUnitaryViewController contactViewCache](self, "contactViewCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithContact:parentContainer:ignoresParentalRestrictions:linkedParentContainerProvider:", v4, v5, v6, v7);

  return v8;
}

- (void)viewDidLoad
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNContactContentUnitaryViewController;
  -[CNContactContentUnitaryViewController viewDidLoad](&v9, sel_viewDidLoad);
  v3 = *MEMORY[0x1E0D13848];
  -[CNContactContentUnitaryViewController initialPrompt](self, "initialPrompt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if ((v3 & 1) == 0)
  {
    -[CNContactContentUnitaryViewController initialPrompt](self, "initialPrompt");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPrompt:", v5);

  }
  if (-[CNContactContentUnitaryViewController shouldDrawNavigationBar](self, "shouldDrawNavigationBar"))
  {
    -[CNContactContentUnitaryViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setBackgroundHidden:", 0);

  }
  -[CNContactContentUnitaryViewController reloadDataIfNeeded](self, "reloadDataIfNeeded");
  -[CNContactContentUnitaryViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsUpdateConstraints");

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  objc_super v20;

  v3 = a3;
  if (-[CNContactContentUnitaryViewController forcesTransparentBackground](self, "forcesTransparentBackground"))
  {
    +[CNUIColorRepository transparentBackgroundColor](CNUIColorRepository, "transparentBackgroundColor");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;
    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v8 = v7;
    objc_msgSend(v7, "setBackgroundColor:", v6);

    goto LABEL_7;
  }
  if (-[UIViewController ab_shouldUseTransparentBackgroundInPopovers](self, "ab_shouldUseTransparentBackgroundInPopovers"))
  {
    +[CNUIColorRepository popoverBackgroundColor](CNUIColorRepository, "popoverBackgroundColor");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[CNContactContentUnitaryViewController environment](self, "environment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "runningInContactsAppOniPad");

  if (v19)
  {
    +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor](CNUIColorRepository, "contactCardBackgroundiPadOverwriteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_7:
  v20.receiver = self;
  v20.super_class = (Class)CNContactContentUnitaryViewController;
  -[CNContactContentUnitaryViewController viewWillAppear:](&v20, sel_viewWillAppear_, v3);
  -[CNContactContentUnitaryViewController setDismissedSharedProfileBannerAction:](self, "setDismissedSharedProfileBannerAction:", 0);
  -[CNContactContentUnitaryViewController setTappedSharedProfileBannerAction:](self, "setTappedSharedProfileBannerAction:", 0);
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "backgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v12);

  }
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_cnui_applyContactStyle");

  v15 = -[CNContactContentUnitaryViewController applyContactStyle](self, "applyContactStyle");
  if (!-[CNContactContentUnitaryViewController reloadDataIfNeeded](self, "reloadDataIfNeeded"))
    -[CNContactContentUnitaryViewController _setNeedsUpdateCachedLabelWidths](self, "_setNeedsUpdateCachedLabelWidths");
  -[CNContactContentUnitaryViewController updateEditNavigationItemsAnimated:](self, "updateEditNavigationItemsAnimated:", 0);
  -[CNContactContentUnitaryViewController siriContextProvider](self, "siriContextProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEnabled:", 1);

  -[CNContactContentUnitaryViewController shareLocationController](self, "shareLocationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startUpdatingFriends");

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "setNetworkActivityIndicatorVisible:", 0);
}

- (BOOL)reloadDataIfNeeded
{
  if (!self->_needsReload || self->_animating)
    return 0;
  -[CNContactContentUnitaryViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 0);
  return 1;
}

- (void)setupShareLocationActionReload:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;
  id location;

  if (!-[CNContactContentUnitaryViewController showingMeContact](self, "showingMeContact") && !CNUIIsMessages())
  {
    -[CNContactContentUnitaryViewController cardShareLocationGroup](self, "cardShareLocationGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplaysDropdownMenu:", 1);

    -[CNContactContentUnitaryViewController cardShareLocationGroup](self, "cardShareLocationGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController shareLocationController](self, "shareLocationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeActionWithTarget:selector:", v7, sel_perform_);

    objc_initWeak(&location, self);
    -[CNContactContentUnitaryViewController shareLocationController](self, "shareLocationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__CNContactContentUnitaryViewController_setupShareLocationActionReload___block_invoke;
    v9[3] = &unk_1E204FC70;
    objc_copyWeak(&v10, &location);
    v11 = a3;
    objc_msgSend(v8, "canShareWithCompletion:", v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (CNShareLocationController)shareLocationController
{
  CNShareLocationController *shareLocationController;
  CNShareLocationController *v4;
  void *v5;
  void *v6;
  CNShareLocationController *v7;
  CNShareLocationController *v8;

  shareLocationController = self->_shareLocationController;
  if (!shareLocationController)
  {
    v4 = [CNShareLocationController alloc];
    -[CNContactContentUnitaryViewController environment](self, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "idsAvailabilityProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CNShareLocationController initWithIDSAvailabilityProvider:](v4, "initWithIDSAvailabilityProvider:", v6);
    v8 = self->_shareLocationController;
    self->_shareLocationController = v7;

    -[CNShareLocationController setShareLocationDelegate:](self->_shareLocationController, "setShareLocationDelegate:", self);
    shareLocationController = self->_shareLocationController;
  }
  return shareLocationController;
}

void __72__CNContactContentUnitaryViewController_setupShareLocationActionReload___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[7];
  id v8;
  char v9;
  id location;
  _QWORD v11[3];
  char v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__60437;
  v15[4] = __Block_byref_object_dispose__60438;
  v16 = 0;
  if (a2)
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__60437;
    v13[4] = __Block_byref_object_dispose__60438;
    CNContactsUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SHARE_LOCATION_LABEL_TEXT"), &stru_1E20507A8, CFSTR("Localized"));
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v12 = 0;
    objc_initWeak(&location, WeakRetained);
    objc_msgSend(WeakRetained, "shareLocationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__CNContactContentUnitaryViewController_setupShareLocationActionReload___block_invoke_2;
    v7[3] = &unk_1E204FC48;
    objc_copyWeak(&v8, &location);
    v7[4] = v13;
    v7[5] = v11;
    v7[6] = v15;
    v9 = *(_BYTE *)(a1 + 40);
    objc_msgSend(v6, "isSharingWithCompletion:", v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    _Block_object_dispose(v11, 8);
    _Block_object_dispose(v13, 8);

  }
  _Block_object_dispose(v15, 8);

}

- (id)initialPrompt
{
  return self->_initialPrompt;
}

- (void)_reloadPropertyGroupsPreservingChanges:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CNContactContentUnitaryViewController propertyGroups](self, "propertyGroups", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "reloadDataPreservingChanges:", v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_updateLabelWidthsForAllVisibleCells
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v7 = v6;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "visibleCells", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[CNContactContentUnitaryViewController _updateLabelWidthForCell:](self, "_updateLabelWidthForCell:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  objc_msgSend(v3, "setContentOffset:", v5, v7);
  -[CNContactContentUnitaryViewController adjustPreferredContentSize](self, "adjustPreferredContentSize");

}

- (void)updateTableView:(id)a3 contentInsetsTo:(UIEdgeInsets)a4 withScrollIndicatorInsets:(UIEdgeInsets)a5
{
  double left;
  double top;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double bottom;
  double right;
  id v19;

  bottom = a5.bottom;
  right = a5.right;
  left = a5.left;
  top = a5.top;
  v7 = a4.right;
  v8 = a4.bottom;
  v9 = a4.left;
  v10 = a4.top;
  v19 = a3;
  objc_msgSend(v19, "contentInset");
  v12 = v10 - v11;
  objc_msgSend(v19, "contentOffset");
  v14 = v13;
  v16 = v15 - v12;
  objc_msgSend(v19, "setContentInset:", v10, v9, v8, v7);
  objc_msgSend(v19, "setScrollIndicatorInsets:", top, left, bottom, right);
  objc_msgSend(v19, "setContentOffset:", v14, v16);

}

uint64_t __62__CNContactContentUnitaryViewController__lookupStaticIdentity__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "setHadAtLeastOneVerifiedHandle:", objc_msgSend(*(id *)(a1 + 32), "_hasAtLeastOneVerifiedHandle"));
  if (objc_msgSend(*(id *)(a1 + 32), "isEditing") && *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "cardStaticIdentityGroup");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "verificationCode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addIdentity:isNew:", v3, 0);

    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "cardStaticIdentityGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "contactView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadCardGroup:forTableView:", v5, v6);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_lookupKTHandlesIfNeeded");
}

- (void)setHadAtLeastOneVerifiedHandle:(BOOL)a3
{
  self->_hadAtLeastOneVerifiedHandle = a3;
}

- (BOOL)_hasAtLeastOneVerifiedHandle
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[5];

  -[CNContactContentUnitaryViewController cachedStaticIdentity](self, "cachedStaticIdentity");

  -[CNContactContentUnitaryViewController cardGroupForProperty:](self, "cardGroupForProperty:", *MEMORY[0x1E0C966A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x1E0C809B0];
  if (!v4)
    goto LABEL_4;
  objc_msgSend(v3, "displayItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __69__CNContactContentUnitaryViewController__hasAtLeastOneVerifiedHandle__block_invoke;
  v14[3] = &unk_1E204FD20;
  v14[4] = self;
  v7 = objc_msgSend(v6, "_cn_any:", v14);

  if ((v7 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
LABEL_4:
    -[CNContactContentUnitaryViewController cardGroupForProperty:](self, "cardGroupForProperty:", *MEMORY[0x1E0C967C0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v9, "displayItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v5;
      v13[1] = 3221225472;
      v13[2] = __69__CNContactContentUnitaryViewController__hasAtLeastOneVerifiedHandle__block_invoke_2;
      v13[3] = &unk_1E204FD20;
      v13[4] = self;
      v8 = objc_msgSend(v11, "_cn_any:", v13);

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)cardGroupForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNContactContentUnitaryViewController propertyGroups](self, "propertyGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __62__CNContactContentUnitaryViewController__lookupStaticIdentity__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_alloc(MEMORY[0x1E0D13D68]);
  objc_msgSend(WeakRetained, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithContact:", v3);

  objc_msgSend(WeakRetained, "setCachedStaticIdentity:", v4);
  objc_msgSend(WeakRetained, "setCachedVerifiedHandles:", 0);
  objc_msgSend(WeakRetained, "setDidLookUpStaticIdentity:", 1);
  if (v4)
    objc_msgSend(WeakRetained, "setDidFindStaticIdentity:", 1);
  objc_msgSend(WeakRetained, "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__CNContactContentUnitaryViewController__lookupStaticIdentity__block_invoke_2;
  v7[3] = &unk_1E2050400;
  v7[4] = WeakRetained;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)setDidLookUpStaticIdentity:(BOOL)a3
{
  self->_didLookUpStaticIdentity = a3;
}

- (void)setCachedStaticIdentity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 2464);
}

- (CNScheduler)mainThreadScheduler
{
  return self->_mainThreadScheduler;
}

uint64_t __69__CNContactContentUnitaryViewController__hasAtLeastOneVerifiedHandle__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x1E0D13C98];
  objc_msgSend(a2, "labeledValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idsIDForEmail:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "cachedStaticIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isHandleInStore:", v6);

  return v8;
}

uint64_t __69__CNContactContentUnitaryViewController__hasAtLeastOneVerifiedHandle__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x1E0D13C98];
  objc_msgSend(a2, "labeledValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idsIDForPhoneNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "cachedStaticIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isHandleInStore:", v6);

  return v8;
}

- (void)_lookupKTHandlesIfNeeded
{
  CNContactContentUnitaryViewController *v2;
  void *v3;
  void *v4;
  void *v5;
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
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CNContactContentUnitaryViewController *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id obj;
  void *v42;
  uint64_t v43;
  char v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _QWORD v58[2];
  _BYTE v59[128];
  _QWORD v60[2];
  _BYTE v61[128];
  uint64_t v62;

  v2 = self;
  v62 = *MEMORY[0x1E0C80C00];
  -[CNContactContentUnitaryViewController cachedVerifiedHandles](self, "cachedVerifiedHandles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController setCachedVerifiedHandles:](v2, "setCachedVerifiedHandles:", v4);

    if (!-[CNContactContentUnitaryViewController didFindStaticIdentity](v2, "didFindStaticIdentity")
      || (-[CNContactContentUnitaryViewController cachedStaticIdentity](v2, "cachedStaticIdentity"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v6 = *MEMORY[0x1E0C966A8];
      v58[0] = *MEMORY[0x1E0C967C0];
      v58[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      if (!v7)
        goto LABEL_28;
      v8 = v7;
      v9 = *(_QWORD *)v50;
      v39 = *(_QWORD *)v50;
      while (1)
      {
        v10 = 0;
        v40 = v8;
        do
        {
          if (*(_QWORD *)v50 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v10);
          -[CNContactContentUnitaryViewController propertyGroups](v2, "propertyGroups", v39);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "displayItems");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "count");

          if (v15)
          {
            v47 = 0u;
            v48 = 0u;
            v45 = 0u;
            v46 = 0u;
            objc_msgSend(v13, "displayItems");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
            if (!v17)
              goto LABEL_25;
            v18 = v17;
            v42 = v13;
            v43 = v10;
            v44 = 0;
            v19 = *(_QWORD *)v46;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v46 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                objc_msgSend(v21, "labeledValue");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "value");
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  objc_msgSend(MEMORY[0x1E0D13C98], "idsIDForPhoneNumber:", v23);
                else
                  objc_msgSend(MEMORY[0x1E0D13C98], "idsIDForEmail:", v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (v24)
                {
                  -[CNContactContentUnitaryViewController cachedStaticIdentity](v2, "cachedStaticIdentity");
                  v25 = v2;
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = objc_msgSend(v26, "isHandleInStore:", v24);

                  v2 = v25;
                  if (v27)
                  {
                    -[CNContactContentUnitaryViewController cachedVerifiedHandles](v25, "cachedVerifiedHandles");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "displayValue");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "addObject:", v29);

                    v44 = 1;
                  }
                }

              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
            }
            while (v18);

            v9 = v39;
            v8 = v40;
            v13 = v42;
            v10 = v43;
            if ((v44 & 1) != 0)
            {
              -[CNContactContentUnitaryViewController contactView](v2, "contactView");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[CNContactContentUnitaryViewController reloadCardGroup:forTableView:](v2, "reloadCardGroup:forTableView:", v42, v16);
LABEL_25:

            }
          }

          ++v10;
        }
        while (v10 != v8);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
        if (!v8)
          goto LABEL_28;
      }
    }
    -[CNContactContentUnitaryViewController setDidFindStaticIdentity:](v2, "setDidFindStaticIdentity:", 0);
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v30 = *MEMORY[0x1E0C966A8];
    v60[0] = *MEMORY[0x1E0C967C0];
    v60[1] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v54 != v33)
            objc_enumerationMutation(obj);
          v35 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j);
          -[CNContactContentUnitaryViewController propertyGroups](v2, "propertyGroups");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          -[CNContactContentUnitaryViewController contactView](v2, "contactView");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactContentUnitaryViewController reloadCardGroup:forTableView:](v2, "reloadCardGroup:forTableView:", v37, v38);

        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      }
      while (v32);
    }
LABEL_28:

  }
}

- (NSMutableSet)cachedVerifiedHandles
{
  return (NSMutableSet *)objc_getProperty(self, a2, 2472, 1);
}

- (CNUIStaticIdentity)cachedStaticIdentity
{
  return (CNUIStaticIdentity *)objc_getProperty(self, a2, 2464, 1);
}

- (void)setCachedVerifiedHandles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 2472);
}

- (BOOL)didFindStaticIdentity
{
  return self->_didFindStaticIdentity;
}

uint64_t __71__CNContactContentUnitaryViewController_labeledValuesHasNonSuggestion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSuggested") ^ 1;
}

- (void)setAllowsActions:(BOOL)a3
{
  if (self->_allowsActions != a3)
  {
    self->_allowsActions = a3;
    -[CNContactContentUnitaryViewController setNeedsReload](self, "setNeedsReload");
  }
}

- (void)setupActionsPreservingChanges:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  CNCardGroup *v8;
  void *v9;
  CNCardGroup *v10;
  CNCardGroup *cardActionsGroup;
  void *v12;
  uint64_t v13;
  CNCardGroup *v14;
  void *v15;
  CNCardGroup *v16;
  CNCardGroup *cardShareLocationGroup;

  v3 = a3;
  -[CNContactContentUnitaryViewController actionProvider](self, "actionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buildStaticIdentityActions");

  if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) != 0
    || -[CNContactContentViewController alwaysEditing](self, "alwaysEditing"))
  {
    -[CNContactContentUnitaryViewController _setupEditingCardActions](self, "_setupEditingCardActions");
  }
  else
  {
    -[CNCardGroup actions](self->_cardActionsGroup, "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = [CNCardGroup alloc];
      -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[CNCardGroup initWithContact:](v8, "initWithContact:", v9);
      cardActionsGroup = self->_cardActionsGroup;
      self->_cardActionsGroup = v10;

    }
    -[CNCardGroup actions](self->_cardShareLocationGroup, "actions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v14 = [CNCardGroup alloc];
      -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[CNCardGroup initWithContact:](v14, "initWithContact:", v15);
      cardShareLocationGroup = self->_cardShareLocationGroup;
      self->_cardShareLocationGroup = v16;

    }
    -[CNContactContentUnitaryViewController _retrieveActionsModelPreservingChanges:](self, "_retrieveActionsModelPreservingChanges:", v3);
    -[CNContactContentUnitaryViewController _setupCardActions](self, "_setupCardActions");
    -[CNContactContentUnitaryViewController _setupContactBlockingActionPreservingChanges:withUpdate:](self, "_setupContactBlockingActionPreservingChanges:withUpdate:", v3, v3 ^ 1);
    -[CNContactContentUnitaryViewController _setupContactBlockingReportingActionPreservingChanges:withUpdate:](self, "_setupContactBlockingReportingActionPreservingChanges:withUpdate:", v3, v3 ^ 1);
    -[CNContactContentUnitaryViewController _setupSuggestionActions](self, "_setupSuggestionActions");
    -[CNContactContentUnitaryViewController _setupAddToAddressBookActions](self, "_setupAddToAddressBookActions");
    -[CNContactContentUnitaryViewController _setupCustomActions](self, "_setupCustomActions");
  }
}

- (void)_setupSuggestionActions
{
  void *v3;
  CNContactSuggestionAction *v4;
  void *v5;
  CNContactSuggestionAction *v6;
  void *v7;
  id v8;

  -[CNContactContentUnitaryViewController originalContacts](self, "originalContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_filter:", &__block_literal_global_664);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") == 1)
  {
    v4 = [CNContactSuggestionAction alloc];
    objc_msgSend(v8, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CNContactAction initWithContact:](v4, "initWithContact:", v5);
    -[CNContactContentUnitaryViewController setSuggestedContactAction:](self, "setSuggestedContactAction:", v6);

    -[CNContactContentUnitaryViewController suggestedContactAction](self, "suggestedContactAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

  }
  else
  {
    -[CNContactContentUnitaryViewController setSuggestedContactAction:](self, "setSuggestedContactAction:", 0);
  }

}

- (void)setSuggestedContactAction:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedContactAction, a3);
}

- (id)originalContacts
{
  NSArray *originalContacts;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  originalContacts = self->_originalContacts;
  if (originalContacts)
    return originalContacts;
  if (self->_contact)
  {
    v5[0] = self->_contact;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v4;
}

- (void)_setupContactBlockingReportingActionPreservingChanges:(BOOL)a3 withUpdate:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  CNContactToggleBlockReportCallerAction *v9;
  void *v10;
  CNContactToggleBlockReportCallerAction *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  const __CFString *v18;
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
  int64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  v4 = a4;
  v5 = a3;
  if (-[CNContactContentUnitaryViewController allowsContactBlockingAndReporting](self, "allowsContactBlockingAndReporting")&& !-[CNContactContentUnitaryViewController showingMeContact](self, "showingMeContact"))
  {
    -[CNContactContentUnitaryViewController blockReportAction](self, "blockReportAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentUnitaryViewController blockReportAction](self, "blockReportAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = [CNContactToggleBlockReportCallerAction alloc];
      -[CNContactContentUnitaryViewController contact](self, "contact");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[CNContactAction initWithContact:](v9, "initWithContact:", v10);
      -[CNContactContentUnitaryViewController setBlockReportAction:](self, "setBlockReportAction:", v11);

      -[CNContactContentUnitaryViewController blockReportAction](self, "blockReportAction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDelegate:", self);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_blockListDidChange_, *MEMORY[0x1E0D13278], 0);

    }
    -[CNContactContentUnitaryViewController blockReportAction](self, "blockReportAction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isContactBlockedPreservingChanges:", v5);

    if (v7)
    {
      CNContactsUIBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v15)
        v18 = CFSTR("BLOCK_CALLER");
      else
        v18 = CFSTR("UNBLOCK_CALLER");
      objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_1E20507A8, CFSTR("Localized"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNContactContentUnitaryViewController cardBlockContactGroup](self, "cardBlockContactGroup");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeActionWithTitle:", v19);

    }
    CNContactsUIBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if ((v15 & 1) != 0)
    {
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("UNBLOCK_CALLER"), &stru_1E20507A8, CFSTR("Localized"));
      v41 = (id)objc_claimAutoreleasedReturnValue();

      -[CNContactContentUnitaryViewController cardBlockContactGroup](self, "cardBlockContactGroup");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeActionWithTitle:", v41);

      +[CNUIColorRepository contactsApplicationTintColor](CNUIColorRepository, "contactsApplicationTintColor");
    }
    else
    {
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("BLOCK_CALLER"), &stru_1E20507A8, CFSTR("Localized"));
      v41 = (id)objc_claimAutoreleasedReturnValue();

      -[CNContactContentUnitaryViewController cardBlockContactGroup](self, "cardBlockContactGroup");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeActionWithTitle:", v41);

      +[CNUIColorRepository contactCardDestructiveActionTitleTextColor](CNUIColorRepository, "contactCardDestructiveActionTitleTextColor");
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController cardBlockContactGroup](self, "cardBlockContactGroup");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController blockReportAction](self, "blockReportAction");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addAction:withTitle:color:transportType:", v27, v41, v25, 0);

    if (v4)
    {
      -[CNContactContentUnitaryViewController cardBlockContactGroup](self, "cardBlockContactGroup");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[CNContactContentUnitaryViewController sectionOfGroup:inTableView:](self, "sectionOfGroup:inTableView:", v28, v29);

      if (v30 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "contentOffset");
        v33 = v32;
        v35 = v34;

        -[CNContactContentUnitaryViewController contactView](self, "contactView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "beginUpdates");

        -[CNContactContentUnitaryViewController contactView](self, "contactView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v30);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "reloadSections:withRowAnimation:", v38, 0);

        -[CNContactContentUnitaryViewController contactView](self, "contactView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "endUpdates");

        -[CNContactContentUnitaryViewController contactView](self, "contactView");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setContentOffset:", v33, v35);

        -[CNContactContentUnitaryViewController adjustPreferredContentSize](self, "adjustPreferredContentSize");
      }
    }

  }
}

- (void)_setupContactBlockingActionPreservingChanges:(BOOL)a3 withUpdate:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  CNContactToggleBlockCallerAction *v9;
  void *v10;
  CNContactToggleBlockCallerAction *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  const __CFString *v18;
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
  int64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  v4 = a4;
  v5 = a3;
  if (-[CNContactContentUnitaryViewController allowsContactBlocking](self, "allowsContactBlocking")
    && !-[CNContactContentUnitaryViewController showingMeContact](self, "showingMeContact"))
  {
    -[CNContactContentUnitaryViewController blockAction](self, "blockAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentUnitaryViewController blockAction](self, "blockAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = [CNContactToggleBlockCallerAction alloc];
      -[CNContactContentUnitaryViewController contact](self, "contact");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[CNContactAction initWithContact:](v9, "initWithContact:", v10);
      -[CNContactContentUnitaryViewController setBlockAction:](self, "setBlockAction:", v11);

      -[CNContactContentUnitaryViewController blockAction](self, "blockAction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDelegate:", self);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_blockListDidChange_, *MEMORY[0x1E0D13278], 0);

    }
    -[CNContactContentUnitaryViewController blockAction](self, "blockAction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isContactBlockedPreservingChanges:", v5);

    if (v7)
    {
      CNContactsUIBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v15)
        v18 = CFSTR("BLOCK_THIS_CALLER");
      else
        v18 = CFSTR("UNBLOCK_THIS_CALLER");
      objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_1E20507A8, CFSTR("Localized"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNContactContentUnitaryViewController cardBlockContactGroup](self, "cardBlockContactGroup");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeActionWithTitle:", v19);

    }
    CNContactsUIBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if ((v15 & 1) != 0)
    {
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("UNBLOCK_THIS_CALLER"), &stru_1E20507A8, CFSTR("Localized"));
      v41 = (id)objc_claimAutoreleasedReturnValue();

      -[CNContactContentUnitaryViewController cardBlockContactGroup](self, "cardBlockContactGroup");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeActionWithTitle:", v41);

      +[CNUIColorRepository contactsApplicationTintColor](CNUIColorRepository, "contactsApplicationTintColor");
    }
    else
    {
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("BLOCK_THIS_CALLER"), &stru_1E20507A8, CFSTR("Localized"));
      v41 = (id)objc_claimAutoreleasedReturnValue();

      -[CNContactContentUnitaryViewController cardBlockContactGroup](self, "cardBlockContactGroup");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeActionWithTitle:", v41);

      +[CNUIColorRepository contactCardDestructiveActionTitleTextColor](CNUIColorRepository, "contactCardDestructiveActionTitleTextColor");
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController cardBlockContactGroup](self, "cardBlockContactGroup");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController blockAction](self, "blockAction");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addAction:withTitle:color:transportType:", v27, v41, v25, 0);

    if (v4)
    {
      -[CNContactContentUnitaryViewController cardBlockContactGroup](self, "cardBlockContactGroup");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[CNContactContentUnitaryViewController sectionOfGroup:inTableView:](self, "sectionOfGroup:inTableView:", v28, v29);

      if (v30 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "contentOffset");
        v33 = v32;
        v35 = v34;

        -[CNContactContentUnitaryViewController contactView](self, "contactView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "beginUpdates");

        -[CNContactContentUnitaryViewController contactView](self, "contactView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v30);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "reloadSections:withRowAnimation:", v38, 0);

        -[CNContactContentUnitaryViewController contactView](self, "contactView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "endUpdates");

        -[CNContactContentUnitaryViewController contactView](self, "contactView");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setContentOffset:", v33, v35);

        -[CNContactContentUnitaryViewController adjustPreferredContentSize](self, "adjustPreferredContentSize");
      }
    }

  }
}

- (void)_setupAddToAddressBookActions
{
  _BOOL4 v3;
  void *v4;
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
  id v28;

  -[CNContactContentUnitaryViewController contact](self, "contact");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "isUnknown"))
  {
    v3 = -[CNContactContentUnitaryViewController allowsAddingToAddressBook](self, "allowsAddingToAddressBook");

    if (!v3)
      return;
    -[CNContactContentUnitaryViewController _addCreateNewContactAction](self, "_addCreateNewContactAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController setCreateNewContactAction:](self, "setCreateNewContactAction:", v4);

    -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController createNewContactAction](self, "createNewContactAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_CARD_CREATE_NEW_CONTACT"), &stru_1E20507A8, CFSTR("Localized"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:withTitle:", v6, v8);

    -[CNContactContentUnitaryViewController _addToExistingContactAction](self, "_addToExistingContactAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController setAddToExistingContactAction:](self, "setAddToExistingContactAction:", v9);

    -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController addToExistingContactAction](self, "addToExistingContactAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_CARD_ADD_TO_EXISTING_CONTACT"), &stru_1E20507A8, CFSTR("Localized"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:withTitle:", v11, v13);

    -[CNContactContentUnitaryViewController _updateExistingContactAction](self, "_updateExistingContactAction");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      -[CNContactContentUnitaryViewController setUpdateExistingContactAction:](self, "setUpdateExistingContactAction:", v28);
      v14 = (void *)MEMORY[0x1E0CB3940];
      CNContactsUIBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_CARD_ADD_UPDATE_CONTACT-%@"), &stru_1E20507A8, CFSTR("Localized"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController contactFormatter](self, "contactFormatter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "existingContact");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringFromContact:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", v16, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addAction:withTitle:", v28, v20);

    }
    -[CNContactContentUnitaryViewController suggestedContactAction](self, "suggestedContactAction");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[CNContactContentUnitaryViewController cardBlockContactGroup](self, "cardBlockContactGroup");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController suggestedContactAction](self, "suggestedContactAction");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      CNContactsUIBundle();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_IGNORE_CONTACT"), &stru_1E20507A8, CFSTR("Localized"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNUIColorRepository contactCardDestructiveActionTitleTextColor](CNUIColorRepository, "contactCardDestructiveActionTitleTextColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addAction:withTitle:color:transportType:", v24, v26, v27, 0);

    }
  }

}

+ (id)descriptorForRequiredKeys
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactContentUnitaryViewController descriptorForRequiredKeys]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "descriptorForRequiredKeysWithDescription:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)descriptorForRequiredKeysWithDescription:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__CNContactContentUnitaryViewController_descriptorForRequiredKeysWithDescription___block_invoke;
  block[3] = &unk_1E204F648;
  v11 = v3;
  v4 = descriptorForRequiredKeysWithDescription__cn_once_token_10;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&descriptorForRequiredKeysWithDescription__cn_once_token_10, block);
    v7 = v11;
  }
  v8 = (id)descriptorForRequiredKeysWithDescription__cn_once_object_10;

  return v8;
}

- (void)_retrieveActionsModelPreservingChanges:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id location;

  -[CNContactContentUnitaryViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!a3)
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0D13D88], "allActionTypes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __80__CNContactContentUnitaryViewController__retrieveActionsModelPreservingChanges___block_invoke;
      v7[3] = &unk_1E204FBB8;
      v7[4] = self;
      objc_copyWeak(&v8, &location);
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactContentUnitaryViewController;
  -[CNContactContentUnitaryViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CNContactContentUnitaryViewController setUpBackGestureIfNeeded](self, "setUpBackGestureIfNeeded");
  if (self->_needsRefetch && (-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0)
  {
    -[CNContactContentUnitaryViewController _refetchContact](self, "_refetchContact");
    self->_needsRefetch = 0;
  }
  if (!-[CNContactContentViewController alwaysEditing](self, "alwaysEditing"))
    -[CNContactContentUnitaryViewController becomeFirstResponder](self, "becomeFirstResponder");
  -[CNContactContentUnitaryViewController updateWindowTitleForAppearing:](self, "updateWindowTitleForAppearing:", 1);
}

- (void)updateWindowTitleForAppearing:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a3)
  {
    -[CNContactContentUnitaryViewController title](self, "title");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      -[CNContactContentUnitaryViewController navigationController](self, "navigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "title");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        -[CNContactContentUnitaryViewController contactFormatter](self, "contactFormatter");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController contact](self, "contact");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringFromContact:", v6);
        v10 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    -[CNContactContentUnitaryViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v10);

  }
  else
  {
    -[CNContactContentUnitaryViewController view](self, "view");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", 0);
  }

}

- (void)setUpBackGestureIfNeeded
{
  void *v3;
  void *v4;
  CNContactContentUnitaryViewController *v5;
  CNContactContentUnitaryViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  UIGestureRecognizerDelegate *v10;
  void *previousBackGestureDelegate;
  void *v12;
  id v13;

  if (-[CNContactContentUnitaryViewController displayNavigationButtonsShouldUsePlatterStyle](self, "displayNavigationButtonsShouldUsePlatterStyle"))
  {
    -[CNContactContentUnitaryViewController currentNavigationController](self, "currentNavigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "interactivePopGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegate");
    v5 = (CNContactContentUnitaryViewController *)objc_claimAutoreleasedReturnValue();
    if (v5 == self)
    {
      previousBackGestureDelegate = self;
    }
    else
    {
      v6 = v5;
      -[CNContactContentUnitaryViewController currentNavigationController](self, "currentNavigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "interactivePopGestureRecognizer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
LABEL_8:
        -[CNContactContentUnitaryViewController currentNavigationController](self, "currentNavigationController");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "interactivePopGestureRecognizer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setDelegate:", self);

        return;
      }
      -[CNContactContentUnitaryViewController currentNavigationController](self, "currentNavigationController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "interactivePopGestureRecognizer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "delegate");
      v10 = (UIGestureRecognizerDelegate *)objc_claimAutoreleasedReturnValue();
      previousBackGestureDelegate = self->_previousBackGestureDelegate;
      self->_previousBackGestureDelegate = v10;
    }

    goto LABEL_8;
  }
}

- (void)setShowsInlineActions:(BOOL)a3
{
  if (self->_showsInlineActions != a3)
  {
    self->_showsInlineActions = a3;
    if (self->_actionsViewController)
      -[CNContactContentUnitaryViewController rebuildActionsViewControllers](self, "rebuildActionsViewControllers");
  }
}

- (void)_reloadGameCenterGroupWithPreflight
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (-[CNContactContentUnitaryViewController shouldShowGameCenter](self, "shouldShowGameCenter"))
  {
    -[CNContactContentUnitaryViewController gameCenterManager](self, "gameCenterManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __76__CNContactContentUnitaryViewController__reloadGameCenterGroupWithPreflight__block_invoke;
    v5[3] = &unk_1E204FE10;
    v5[4] = self;
    objc_msgSend(v3, "getGameCenterRelationshipsForContact:completionHandler:", v4, v5);

  }
}

- (void)_reloadGameCenterGroup
{
  void *v3;
  CNCardGameCenterManager *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0
    && -[CNContactContentUnitaryViewController shouldShowGameCenter](self, "shouldShowGameCenter"))
  {
    -[CNContactContentUnitaryViewController gameCenterManager](self, "gameCenterManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = objc_alloc_init(CNCardGameCenterManager);
      -[CNContactContentUnitaryViewController setGameCenterManager:](self, "setGameCenterManager:", v4);

    }
    -[CNContactContentUnitaryViewController gameCenterManager](self, "gameCenterManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contact");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "isEqualToString:", v8);

      if ((v9 & 1) == 0)
      {
        -[CNContactContentUnitaryViewController gameCenterManager](self, "gameCenterManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setHasSentInvite:", 0);

      }
    }
    -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController gameCenterManager](self, "gameCenterManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContact:", v11);

    -[CNContactContentUnitaryViewController environment](self, "environment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recentsManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController gameCenterManager](self, "gameCenterManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRecentsManager:", v14);

    if (-[CNContactContentUnitaryViewController requiresGameCenterRefresh](self, "requiresGameCenterRefresh"))
      -[CNContactContentUnitaryViewController _reloadGameCenterGroupWithRefresh](self, "_reloadGameCenterGroupWithRefresh");
    else
      -[CNContactContentUnitaryViewController _reloadGameCenterGroupWithPreflight](self, "_reloadGameCenterGroupWithPreflight");

  }
}

- (CNCardGameCenterManager)gameCenterManager
{
  return self->_gameCenterManager;
}

- (void)setGameCenterManager:(id)a3
{
  objc_storeStrong((id *)&self->_gameCenterManager, a3);
}

- (BOOL)requiresGameCenterRefresh
{
  return self->_requiresGameCenterRefresh;
}

void __70__CNContactContentUnitaryViewController_prepareContactDidAppearForPPT__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pptDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "viewDidAppearForContactViewController:", WeakRetained);

}

- (CNContactViewControllerPPTDelegate)pptDelegate
{
  return (CNContactViewControllerPPTDelegate *)objc_loadWeakRetained((id *)&self->_pptDelegate);
}

- (void)setPptDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pptDelegate, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactContentUnitaryViewController;
  -[CNContactContentUnitaryViewController didMoveToParentViewController:](&v4, sel_didMoveToParentViewController_, a3);
  -[CNContactContentUnitaryViewController updateEditNavigationItemsAnimated:](self, "updateEditNavigationItemsAnimated:", 0);
}

- (void)prepareContactDidAppearForPPT
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (-[CNContactContentUnitaryViewController runningPPT](self, "runningPPT"))
  {
    objc_initWeak(&location, self);
    v3 = (void *)*MEMORY[0x1E0DC4730];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __70__CNContactContentUnitaryViewController_prepareContactDidAppearForPPT__block_invoke;
    v4[3] = &unk_1E204F880;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "installCACommitCompletionBlock:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (BOOL)runningPPT
{
  return self->_runningPPT;
}

- (void)_reloadSharedProfileGroup
{
  void *v3;
  CNCardSharedProfileGroup *v4;
  CNCardSharedProfileGroup *v5;
  id v6;

  -[CNContactContentUnitaryViewController cardSharedProfileGroup](self, "cardSharedProfileGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [CNCardSharedProfileGroup alloc];
    -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = -[CNCardGroup initWithContact:](v4, "initWithContact:", v6);
    -[CNContactContentUnitaryViewController setCardSharedProfileGroup:](self, "setCardSharedProfileGroup:", v5);

  }
}

- (CNCardSharedProfileGroup)cardSharedProfileGroup
{
  return self->_cardSharedProfileGroup;
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[CNContactContentUnitaryViewController isScrollViewControllingHeaderResizeAnimation:](self, "isScrollViewControllingHeaderResizeAnimation:"))
  {
    objc_msgSend(v6, "_verticalVelocity");
    -[CNContactContentUnitaryViewController updateHeaderHeightToMatchScrollViewState:scrollDirection:animated:](self, "updateHeaderHeightToMatchScrollViewState:scrollDirection:animated:", v6, v4 >= 0.0, 1);
  }
  else if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactContentUnitaryViewController staticDisplayHeaderView](self, "staticDisplayHeaderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentOffset");
    objc_msgSend(v5, "updatePosterImageViewForScrollOffset:");

    -[CNContactContentUnitaryViewController updateCollapsedHeaderToMatchScrollViewState:scrollDirection:animated:](self, "updateCollapsedHeaderToMatchScrollViewState:scrollDirection:animated:", v6, 2, 0);
  }

}

- (BOOL)isScrollViewControllingHeaderResizeAnimation:(id)a3
{
  id v4;
  BOOL v5;
  id v6;

  v4 = a3;
  if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    v5 = 0;
  }
  else
  {
    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v6 == v4;

  }
  return v5;
}

uint64_t __64__CNContactContentUnitaryViewController_enablesTransportButtons__block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("CNEnableTransportButtons"), (CFStringRef)*MEMORY[0x1E0C9B228], 0);
  enablesTransportButtons_s_enableTransportButtons_60670 = (_DWORD)result != 0;
  return result;
}

- (void)_reloadContainerContextPreservingChanges:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CNContactContentUnitaryViewController containerContext](self, "containerContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && !a3)
  {
    -[CNContactContentUnitaryViewController containerContext](self, "containerContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resetToInitialState");

    -[CNContactContentViewController parentContainer](self, "parentContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CNContactContentUnitaryViewController containerContext](self, "containerContext");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[CNContactContentViewController parentContainer](self, "parentContainer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addContainer:", v8);

    }
  }
}

- (CNUIContainerContext)containerContext
{
  return self->_containerContext;
}

- (void)_lookupStaticIdentity
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[CNContactContentUnitaryViewController ktWorkQueue](self, "ktWorkQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__CNContactContentUnitaryViewController__lookupStaticIdentity__block_invoke;
  v4[3] = &unk_1E204F880;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "performBlock:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (CNScheduler)ktWorkQueue
{
  return self->_ktWorkQueue;
}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactContentUnitaryViewController;
  -[CNContactContentUnitaryViewController viewIsAppearing:](&v4, sel_viewIsAppearing_, a3);
  -[CNContactContentUnitaryViewController updateEditNavigationItemsAnimated:](self, "updateEditNavigationItemsAnimated:", 0);
}

- (id)_policyForContact:(id)a3 mode:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  if (!-[CNContactContentUnitaryViewController allowsAddingToAddressBook](self, "allowsAddingToAddressBook")
    && (!-[CNContactContentUnitaryViewController allowsEditing](self, "allowsEditing")
     || !objc_msgSend(v6, "hasBeenPersisted")))
  {
    goto LABEL_10;
  }
  if ((unint64_t)a4 <= 5 && ((1 << a4) & 0x32) != 0)
  {
    -[CNContactContentUnitaryViewController contactViewCache](self, "contactViewCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = v6;
  }
  else
  {
    -[CNContactContentUnitaryViewController contactViewCache](self, "contactViewCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 0;
  }
  objc_msgSend(v7, "policyForContact:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0C97390], "sharedPermissivePolicy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (BOOL)allowsAddingToAddressBook
{
  return self->_allowsAddingToAddressBook;
}

- (void)loadView
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[CNContactContentUnitaryViewController setView:](self, "setView:", v3);

  -[CNContactContentUnitaryViewController loadContactViewControllerViews](self, "loadContactViewControllerViews");
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v7 = a4;
  objc_msgSend(v7, "updateConstraintsIfNeeded");
  objc_msgSend(v7, "backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionBackgroundColor");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = 1;
  }
  else
  {
    -[CNContactContentUnitaryViewController environment](self, "environment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "runningInContactsAppOniPad");

  }
  if (v11 && !v8)
  {
    v13 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v8 = (void *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  -[CNContactContentUnitaryViewController environment](self, "environment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "runningInContactsAppOniPad");
  if (v15
    && (-[CNContactContentUnitaryViewController displayContactView](self, "displayContactView"),
        v10 = (id)objc_claimAutoreleasedReturnValue(),
        v10 == v19))
  {
    +[CNUIColorRepository contactCardBackgroundiPadOverwriteColor](CNUIColorRepository, "contactCardBackgroundiPadOverwriteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v18);

    v10 = v19;
  }
  else
  {
    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sectionBackgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v17);

    if (!v15)
      goto LABEL_13;
  }

LABEL_13:
  objc_msgSend(v7, "setBackgroundView:", v8);

}

- (void)_reloadStaticIdentityGroup
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  CNCardStaticIdentityGroup *v7;
  void *v8;
  CNCardStaticIdentityGroup *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureEnabled:", 11);

  if (v5)
  {
    if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
    {
      -[CNContactContentUnitaryViewController cardStaticIdentityGroup](self, "cardStaticIdentityGroup");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v7 = [CNCardStaticIdentityGroup alloc];
        -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[CNCardStaticIdentityGroup initWithContact:](v7, "initWithContact:", v8);
        -[CNContactContentUnitaryViewController setCardStaticIdentityGroup:](self, "setCardStaticIdentityGroup:", v9);

      }
      -[CNContactContentUnitaryViewController cachedStaticIdentity](self, "cachedStaticIdentity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[CNContactContentUnitaryViewController cardStaticIdentityGroup](self, "cardStaticIdentityGroup");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController cachedStaticIdentity](self, "cachedStaticIdentity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "verificationCode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addIdentity:isNew:", v12, 0);

      }
    }
    else
    {
      -[CNContactContentUnitaryViewController setCardStaticIdentityGroup:](self, "setCardStaticIdentityGroup:", 0);
      if (-[CNContactContentUnitaryViewController didLookUpStaticIdentity](self, "didLookUpStaticIdentity"))
        -[CNContactContentUnitaryViewController _lookupKTHandlesIfNeeded](self, "_lookupKTHandlesIfNeeded");
      else
        -[CNContactContentUnitaryViewController _lookupStaticIdentity](self, "_lookupStaticIdentity");
    }
  }
}

- (void)setCardStaticIdentityGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardStaticIdentityGroup, a3);
}

- (BOOL)didLookUpStaticIdentity
{
  return self->_didLookUpStaticIdentity;
}

- (void)_setupCustomActions
{
  void *v3;
  char v4;
  CNEditInAppAction *v5;
  void *v6;
  void *v7;
  CNEditInAppAction *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (-[CNContactContentUnitaryViewController allowsEditInApp](self, "allowsEditInApp"))
  {
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isSuggested");

    if ((v4 & 1) == 0)
    {
      v5 = [CNEditInAppAction alloc];
      -[CNContactContentUnitaryViewController contact](self, "contact");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController activityManager](self, "activityManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[CNEditInAppAction initWithContact:activityManager:](v5, "initWithContact:activityManager:", v6, v7);

      -[CNContactContentUnitaryViewController cardFooterGroup](self, "cardFooterGroup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNEditInAppAction title](v8, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addAction:withTitle:", v8, v10);

    }
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[CNContactContentUnitaryViewController customActions](self, "customActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        +[CNCustomCardAction groupForActionGivenPlacement:inContactContentViewController:](CNCustomCardAction, "groupForActionGivenPlacement:inContactContentViewController:", objc_msgSend(v16, "placement"), self);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "menuProvider");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v17, "setDisplaysDropdownMenu:", 1);
          objc_msgSend(v16, "title");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "menuProvider");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (id)objc_msgSend(v17, "addActionWithTitle:menuProvider:destructive:", v19, v20, objc_msgSend(v16, "isDestructive"));
        }
        else
        {
          objc_msgSend(v16, "title");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "targetActionWrapper");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (id)objc_msgSend(v17, "addActionWithTitle:target:selector:destructive:", v19, v20, sel_performActionWithSender_, objc_msgSend(v16, "isDestructive"));
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

}

- (NSArray)customActions
{
  return self->_customActions;
}

- (BOOL)allowsEditInApp
{
  return self->_allowsEditInApp;
}

- (void)_addFaceTimeGroupAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v3 = a3;
  v11[2] = *MEMORY[0x1E0C80C00];
  if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0)
  {
    if (-[CNContactContentUnitaryViewController shouldAddFaceTimeGroup](self, "shouldAddFaceTimeGroup"))
    {
      v5 = *MEMORY[0x1E0C966A8];
      v11[0] = *MEMORY[0x1E0C967C0];
      v11[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController _displayGroupsForKeys:](self, "_displayGroupsForKeys:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController cardFaceTimeGroup](self, "cardFaceTimeGroup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController _addGroup:afterGroup:forTableView:animated:](self, "_addGroup:afterGroup:forTableView:animated:", v9, v8, v10, v3);

    }
  }
}

- (BOOL)shouldAddFaceTimeGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[CNContactContentUnitaryViewController cardFaceTimeGroup](self, "cardFaceTimeGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController cardFaceTimeGroup](self, "cardFaceTimeGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) != 0)
    return 0;
  -[CNContactContentUnitaryViewController cardFaceTimeGroup](self, "cardFaceTimeGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contact");
  v10 = objc_claimAutoreleasedReturnValue();

  -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__CNContactContentUnitaryViewController_shouldAddFaceTimeGroup__block_invoke;
  v14[3] = &unk_1E204FDC0;
  v15 = (id)v10;
  v12 = (id)v10;
  LOBYTE(v10) = objc_msgSend(v11, "_cn_any:", v14);

  v8 = v10 ^ 1;
  return v8;
}

- (id)cardFaceTimeGroup
{
  return self->_cardFaceTimeGroup;
}

- (void)setAllowsEditPhoto:(BOOL)a3 preservingChanges:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  if (self->_allowsEditPhoto != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_allowsEditPhoto = a3;
    -[CNContactContentUnitaryViewController editingHeaderView](self, "editingHeaderView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsEditPhoto:preservingChanges:", v5, v4);

  }
}

- (void)setAllowsDisplayModePickerActions:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_allowsDisplayModePickerActions != a3)
  {
    v3 = a3;
    self->_allowsDisplayModePickerActions = a3;
    if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
      -[CNContactContentUnitaryViewController staticDisplayHeaderView](self, "staticDisplayHeaderView");
    else
      -[CNContactContentUnitaryViewController displayHeaderView](self, "displayHeaderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsPickerActions:", v3);

    -[CNContactContentUnitaryViewController _reloadAlertGroups](self, "_reloadAlertGroups");
  }
}

void __62__CNContactContentUnitaryViewController__reloadMedicalIDGroup__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  v5 = *(void **)(a1 + 40);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "cardMedicalIDGroup");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadCardGroup:forTableView:", v6, *(_QWORD *)(a1 + 48));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_addMedicalIDGroupAnimated:forTableView:", 0, *(_QWORD *)(a1 + 48));
  }
}

- (void)setForcesTransparentBackground:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  if (self->_forcesTransparentBackground != a3)
  {
    self->_forcesTransparentBackground = a3;
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "schedulerProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mainThreadScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__CNContactContentUnitaryViewController_setForcesTransparentBackground___block_invoke;
    v7[3] = &unk_1E204F648;
    v7[4] = self;
    objc_msgSend(v6, "performBlock:", v7);

  }
}

void __62__CNContactContentUnitaryViewController__reloadMedicalIDGroup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultSchedulerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mainThreadScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__CNContactContentUnitaryViewController__reloadMedicalIDGroup__block_invoke_2;
  v13[3] = &unk_1E204FEC0;
  v14 = v6;
  v15 = WeakRetained;
  v16 = *(id *)(a1 + 32);
  v17 = v5;
  v11 = v5;
  v12 = v6;
  objc_msgSend(v10, "performBlock:", v13);

}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  id v12;
  void *v13;
  id v14;
  void *v15;

  v6 = a3;
  -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", a4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactContentUnitaryViewController isSharedProfileBannerSectionForTableView:section:](self, "isSharedProfileBannerSectionForTableView:section:", v6, a4)|| -[CNContactContentUnitaryViewController isPersonHeaderSectionForTableView:section:](self, "isPersonHeaderSectionForTableView:section:", v6, a4)|| (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)&& (-[CNContactContentUnitaryViewController nameEditingGroups](self, "nameEditingGroups"), v8 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v8, "lastObject"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v8, v7 != v9))
  {
    v10 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      v12 = v7;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
      v14 = v13;

      if (objc_msgSend(v14, "valueEditingItemsCount") >= 2)
      {
        CNContactsUIBundle();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ADDRESSING_GRAMMAR_CARD_GROUP_FOOTER"), &stru_1E20507A8, CFSTR("Localized"));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = &stru_1E20507A8;
      }

    }
    else
    {
      v10 = &stru_1E20507A8;
    }
  }

  return v10;
}

void __76__CNContactContentUnitaryViewController__reloadGameCenterGroupWithPreflight__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultSchedulerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__CNContactContentUnitaryViewController__reloadGameCenterGroupWithPreflight__block_invoke_2;
  v12[3] = &unk_1E204FAA0;
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v14 = v5;
  v10 = v5;
  v11 = v6;
  objc_msgSend(v9, "performBlock:", v12);

}

- (void)updateGameCenterGroupAndActionsForContact:(id)a3 relationshipResults:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  CNCardGroup *v14;
  void *v15;
  CNCardGroup *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  CNCardGroup *v24;
  void *v25;
  CNCardGroup *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CNCardGameCenterGroup *v32;
  void *v33;
  CNCardGameCenterGroup *v34;
  id v35;

  v35 = a3;
  v6 = a4;
  if (-[CNContactContentUnitaryViewController shouldShowGameCenter](self, "shouldShowGameCenter"))
  {
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
    {
      -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v35, "isEqual:", v7);

      if (v8)
      {
        if (+[CNCardGameCenterGroup relationshipResultsContainsFriend:](CNCardGameCenterGroup, "relationshipResultsContainsFriend:", v6))
        {
          -[CNContactContentUnitaryViewController gameCenterGroup](self, "gameCenterGroup");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v9)
          {
            v32 = [CNCardGameCenterGroup alloc];
            -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = -[CNCardGameCenterGroup initWithContact:relationshipResults:](v32, "initWithContact:relationshipResults:", v33, v6);
            -[CNContactContentUnitaryViewController setGameCenterGroup:](self, "setGameCenterGroup:", v34);

            -[CNContactContentUnitaryViewController addGameCenterGroupAnimated:](self, "addGameCenterGroupAnimated:", 1);
            goto LABEL_19;
          }
          -[CNContactContentUnitaryViewController gameCenterGroup](self, "gameCenterGroup");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setRelationshipResults:", v6);
          goto LABEL_14;
        }
        if (_os_feature_enabled_impl())
        {
          -[CNContactContentUnitaryViewController gameCenterManager](self, "gameCenterManager");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "hasSentInvite");

          if (v12)
          {
            -[CNContactContentUnitaryViewController cardGameCenterActionGroup](self, "cardGameCenterActionGroup");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v13)
            {
              v14 = [CNCardGroup alloc];
              -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = -[CNCardGroup initWithContact:](v14, "initWithContact:", v15);
              -[CNContactContentUnitaryViewController setCardGameCenterActionGroup:](self, "setCardGameCenterActionGroup:", v16);

            }
            -[CNContactContentUnitaryViewController cardGameCenterActionGroup](self, "cardGameCenterActionGroup");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "removeAllActions");

            -[CNContactContentUnitaryViewController cardGameCenterActionGroup](self, "cardGameCenterActionGroup");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            CNContactsUIBundle();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("GAME_CENTER_ACTION_SENT_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (id)objc_msgSend(v18, "addActionWithTitle:target:selector:", v20, self, sel__didTapGameCenterSentActionButton_NoOp);

            if (-[CNContactContentUnitaryViewController shouldAddGameCenterActionGroup](self, "shouldAddGameCenterActionGroup"))
            {
              -[CNContactContentUnitaryViewController addGameCenterActionGroupAnimated:](self, "addGameCenterActionGroupAnimated:", 1);
            }
            -[CNContactContentUnitaryViewController cardGameCenterActionGroup](self, "cardGameCenterActionGroup");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNContactContentUnitaryViewController reloadCardGroup:forTableView:](self, "reloadCardGroup:forTableView:", v22, v23);

            -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "reloadData");
LABEL_14:

            goto LABEL_19;
          }
        }
        if (+[CNCardGameCenterGroup shouldShowAddFriendActionForRelationshipResults:](CNCardGameCenterGroup, "shouldShowAddFriendActionForRelationshipResults:", v6))
        {
          v24 = [CNCardGroup alloc];
          -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[CNCardGroup initWithContact:](v24, "initWithContact:", v25);
          -[CNContactContentUnitaryViewController setCardGameCenterActionGroup:](self, "setCardGameCenterActionGroup:", v26);

          -[CNContactContentUnitaryViewController cardGameCenterActionGroup](self, "cardGameCenterActionGroup");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setDisplaysDropdownMenu:", 1);

          -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNCardGameCenterGroup actionForRelationshipResults:forContact:](CNCardGameCenterGroup, "actionForRelationshipResults:forContact:", v6, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            objc_msgSend(v29, "setDelegate:", self);
            -[CNContactContentUnitaryViewController setGameCenterAddFriendAction:](self, "setGameCenterAddFriendAction:", v29);
            -[CNContactContentUnitaryViewController cardGameCenterActionGroup](self, "cardGameCenterActionGroup");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "title");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addAction:withTitle:", v29, v31);

            -[CNContactContentUnitaryViewController addGameCenterActionGroupAnimated:](self, "addGameCenterActionGroupAnimated:", 0);
          }
        }
      }
    }
  }
LABEL_19:

}

- (CNContactContentUnitaryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  CNContactContentUnitaryViewController *v6;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNContactContentUnitaryViewController initWithEnvironment:](self, "initWithEnvironment:", v5);

  return v6;
}

- (CNContactContentUnitaryViewController)initWithContact:(id)a3
{
  id v4;
  CNContactContentUnitaryViewController *v5;
  CNContactContentUnitaryViewController *v6;

  v4 = a3;
  v5 = -[CNContactContentUnitaryViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
    -[CNContactContentUnitaryViewController setContact:](v5, "setContact:", v4);

  return v6;
}

- (CNContactContentUnitaryViewController)initWithContact:(id)a3 prohibitedPropertyKeys:(id)a4
{
  id v6;
  id v7;
  CNContactContentUnitaryViewController *v8;
  CNContactContentUnitaryViewController *v9;
  CNContactContentUnitaryViewController *v10;

  v6 = a3;
  v7 = a4;
  v8 = -[CNContactContentUnitaryViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (v8)
  {
    -[CNContactContentUnitaryViewController setProhibitedPropertyKeys:](v8, "setProhibitedPropertyKeys:", v7);
    -[CNContactContentUnitaryViewController setContact:](v9, "setContact:", v6);
    v10 = v9;
  }

  return v9;
}

- (void)setTitle:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  char v7;
  objc_super v8;

  v5 = a3;
  if (v5
    || (-[CNContactContentUnitaryViewController title](self, "title"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CNContactContentUnitaryViewController title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (!v5)
    {

      if ((v7 & 1) != 0)
        goto LABEL_6;
      goto LABEL_5;
    }
    if ((v7 & 1) == 0)
    {
LABEL_5:
      v8.receiver = self;
      v8.super_class = (Class)CNContactContentUnitaryViewController;
      -[CNContactContentUnitaryViewController setTitle:](&v8, sel_setTitle_, v5);
      -[CNContactContentUnitaryViewController didChangeToShowTitle:](self, "didChangeToShowTitle:", v5 != 0);
    }
  }
LABEL_6:

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CNUIUserActionListDataSource *actionsDataSource;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[CNContactView setDelegate:](self->_displayContactView, "setDelegate:", 0);
  -[CNContactView setDelegate:](self->_editingContactView, "setDelegate:", 0);
  -[CNContactView setDataSource:](self->_displayContactView, "setDataSource:", 0);
  -[CNContactView setDataSource:](self->_editingContactView, "setDataSource:", 0);
  -[CNContactHeaderView setDelegate:](self->_displayHeaderView, "setDelegate:", 0);
  -[CNContactHeaderDisplayView didFinishUsing](self->_displayHeaderView, "didFinishUsing");
  -[CNContactHeaderView setDelegate:](self->_staticDisplayHeaderView, "setDelegate:", 0);
  -[CNContactHeaderStaticDisplayView didFinishUsing](self->_staticDisplayHeaderView, "didFinishUsing");
  -[CNContactHeaderView setDelegate:](self->_displayFloatingCollapsedHeaderView, "setDelegate:", 0);
  -[CNContactHeaderCollapsedView didFinishUsing](self->_displayFloatingCollapsedHeaderView, "didFinishUsing");
  -[CNContactHeaderView setDelegate:](self->_editingHeaderView, "setDelegate:", 0);
  -[CNContactHeaderEditView didFinishUsing](self->_editingHeaderView, "didFinishUsing");
  -[CNContactContentUnitaryViewController headerHeightConstraint](self, "headerHeightConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactContentUnitaryViewController headerHeightConstraint](self, "headerHeightConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v6);

  }
  actionsDataSource = self->_actionsDataSource;
  self->_actionsDataSource = 0;

  -[CNContactAction setDelegate:](self->_addFavoriteAction, "setDelegate:", 0);
  -[CNContactContentUnitaryViewController iMessageIDSLookupToken](self, "iMessageIDSLookupToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancel");

  -[CNContactContentUnitaryViewController faceTimeIDSLookupToken](self, "faceTimeIDSLookupToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancel");

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:", self);

  v11.receiver = self;
  v11.super_class = (Class)CNContactContentUnitaryViewController;
  -[CNContactContentUnitaryViewController dealloc](&v11, sel_dealloc);
}

- (CNContactHeaderDisplayView)displayHeaderView
{
  CNContactHeaderDisplayView *displayHeaderView;
  _BOOL8 v4;
  void *v5;
  CNContactHeaderDisplayView *v6;
  CNContactHeaderDisplayView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  displayHeaderView = self->_displayHeaderView;
  if (!displayHeaderView)
  {
    v4 = -[CNContactContentUnitaryViewController isHeaderViewPhotoProhibited](self, "isHeaderViewPhotoProhibited");
    -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContactHeaderDisplayView contactHeaderViewWithContact:showingNavBar:monogramOnly:delegate:](CNContactHeaderDisplayView, "contactHeaderViewWithContact:showingNavBar:monogramOnly:delegate:", v5, -[CNContactContentUnitaryViewController layoutPositionallyAfterNavBar](self, "layoutPositionallyAfterNavBar"), v4, self);
    v6 = (CNContactHeaderDisplayView *)objc_claimAutoreleasedReturnValue();
    v7 = self->_displayHeaderView;
    self->_displayHeaderView = v6;

    -[CNContactHeaderView setAlwaysShowsMonogram:](self->_displayHeaderView, "setAlwaysShowsMonogram:", 1);
    -[CNContactContentUnitaryViewController contactFormatter](self, "contactFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderDisplayView setContactFormatter:](self->_displayHeaderView, "setContactFormatter:", v8);

    -[CNContactContentUnitaryViewController alternateName](self, "alternateName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderDisplayView setAlternateName:](self->_displayHeaderView, "setAlternateName:", v9);

    -[CNContactContentUnitaryViewController message](self, "message");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderDisplayView setMessage:](self->_displayHeaderView, "setMessage:", v10);

    -[CNContactContentUnitaryViewController importantMessage](self, "importantMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderDisplayView setImportantMessage:](self->_displayHeaderView, "setImportantMessage:", v11);

    -[CNContactContentUnitaryViewController presentingDelegate](self, "presentingDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderView setPresenterDelegate:](self->_displayHeaderView, "setPresenterDelegate:", v12);

    -[CNContactHeaderDisplayView setTranslatesAutoresizingMaskIntoConstraints:](self->_displayHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNContactHeaderDisplayView setAllowsPickerActions:](self->_displayHeaderView, "setAllowsPickerActions:", -[CNContactContentUnitaryViewController allowsDisplayModePickerActions](self, "allowsDisplayModePickerActions"));
    -[CNContactHeaderEditView setAllowsEditPhoto:](self->_editingHeaderView, "setAllowsEditPhoto:", v4 ^ 1);
    v13 = -[CNContactContentUnitaryViewController applyContactStyle](self, "applyContactStyle");
    displayHeaderView = self->_displayHeaderView;
  }
  return displayHeaderView;
}

- (UIView)editingFloatingCollapsedHeaderView
{
  UIView *editingFloatingCollapsedHeaderView;
  UIView *v4;
  UIView *v5;
  id v6;

  editingFloatingCollapsedHeaderView = self->_editingFloatingCollapsedHeaderView;
  if (!editingFloatingCollapsedHeaderView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v5 = self->_editingFloatingCollapsedHeaderView;
    self->_editingFloatingCollapsedHeaderView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_editingFloatingCollapsedHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = -[CNContactContentUnitaryViewController applyContactStyle](self, "applyContactStyle");
    editingFloatingCollapsedHeaderView = self->_editingFloatingCollapsedHeaderView;
  }
  return editingFloatingCollapsedHeaderView;
}

- (CNContactHeaderEditView)editingHeaderView
{
  CNContactHeaderEditView *editingHeaderView;
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  CNContactHeaderEditView *v7;
  CNContactHeaderEditView *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  editingHeaderView = self->_editingHeaderView;
  if (!editingHeaderView)
  {
    v4 = -[CNContactContentUnitaryViewController isHeaderViewPhotoProhibited](self, "isHeaderViewPhotoProhibited");
    v5 = -[CNContactContentUnitaryViewController shouldDrawNavigationBar](self, "shouldDrawNavigationBar")
      || -[CNContactContentUnitaryViewController layoutPositionallyAfterNavBar](self, "layoutPositionallyAfterNavBar");
    -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContactHeaderEditView contactHeaderViewWithContact:shouldAllowTakePhotoAction:showingNavBar:monogramOnly:isOutOfProcess:delegate:](CNContactHeaderEditView, "contactHeaderViewWithContact:shouldAllowTakePhotoAction:showingNavBar:monogramOnly:isOutOfProcess:delegate:", v6, 1, v5, v4, -[CNContactContentUnitaryViewController isOutOfProcess](self, "isOutOfProcess"), self);
    v7 = (CNContactHeaderEditView *)objc_claimAutoreleasedReturnValue();
    v8 = self->_editingHeaderView;
    self->_editingHeaderView = v7;

    -[CNContactContentUnitaryViewController presentingDelegate](self, "presentingDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderEditView setPresenterDelegate:](self->_editingHeaderView, "setPresenterDelegate:", v9);

    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contactHeaderBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderEditView setBackgroundColor:](self->_editingHeaderView, "setBackgroundColor:", v11);

    -[CNContactHeaderEditView setTranslatesAutoresizingMaskIntoConstraints:](self->_editingHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNContactHeaderEditView setAllowsEditPhoto:](self->_editingHeaderView, "setAllowsEditPhoto:", -[CNContactContentUnitaryViewController allowsEditPhoto](self, "allowsEditPhoto") & !v4);
    v12 = -[CNContactContentUnitaryViewController applyContactStyle](self, "applyContactStyle");
    editingHeaderView = self->_editingHeaderView;
  }
  return editingHeaderView;
}

- (void)setDisplayedProperties:(id)a3
{
  NSArray *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  NSArray *v9;
  NSArray *displayedProperties;
  NSArray *v11;

  v5 = (NSArray *)a3;
  if (self->_displayedProperties != v5)
  {
    v11 = v5;
    if (-[NSArray count](v5, "count"))
    {
      -[NSArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactContentUnitaryViewController.m"), 1237, CFSTR("Properties should be strings, are you still using old AB properties?"));

      }
    }
    if (v11)
    {
      v9 = (NSArray *)-[NSArray copy](v11, "copy");
    }
    else
    {
      +[CNContactView allCardProperties](CNContactView, "allCardProperties");
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    displayedProperties = self->_displayedProperties;
    self->_displayedProperties = v9;

    -[CNContactContentUnitaryViewController setNeedsReloadLazy](self, "setNeedsReloadLazy");
    v5 = v11;
  }

}

- (void)setIsMailVIP:(BOOL)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  id v7;

  self->_isMailVIP = a3;
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController cardGroupForProperty:](self, "cardGroupForProperty:", *MEMORY[0x1E0C966A8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNContactContentUnitaryViewController sectionOfGroup:inTableView:](self, "sectionOfGroup:inTableView:", v4, v7);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadSections:withRowAnimation:", v6, 100);

  }
}

- (void)setShowContactBlockingFirst:(BOOL)a3
{
  if (self->_showContactBlockingFirst != a3)
  {
    self->_showContactBlockingFirst = a3;
    -[CNContactContentUnitaryViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 1);
  }
}

- (void)setAlternateName:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_alternateName, a3);
  if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactContentUnitaryViewController staticDisplayHeaderView](self, "staticDisplayHeaderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlternateName:", v7);

    -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
  }
  else
  {
    -[CNContactContentUnitaryViewController displayHeaderView](self, "displayHeaderView");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlternateName:", v7);

}

- (id)cardActions
{
  void *v2;
  void *v3;

  -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory", a3);
  -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateFontSizes");

  -[CNContactView updateFontSizes](self->_editingContactView, "updateFontSizes");
  if (!-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactContentUnitaryViewController displayHeaderView](self, "displayHeaderView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateFontSizes");
LABEL_7:

    goto LABEL_8;
  }
  -[CNContactContentUnitaryViewController staticDisplayHeaderView](self, "staticDisplayHeaderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateFontSizes");

  -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateFontSizes");

  if ((v4 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[CNContactContentUnitaryViewController floatingActionsWrapperView](self, "floatingActionsWrapperView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActionsWrapperView:", v8);

  if ((v4 & 1) == 0)
    goto LABEL_7;
LABEL_8:
  -[CNContactContentUnitaryViewController editingHeaderView](self, "editingHeaderView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateFontSizes");

  -[CNContactView setTableHeaderView:](self->_displayContactView, "setTableHeaderView:", 0);
  -[CNContactContentUnitaryViewController rebuildActionsViewControllers](self, "rebuildActionsViewControllers");
  -[CNContactContentUnitaryViewController viewDidLayoutSubviews](self, "viewDidLayoutSubviews");
  -[CNContactContentUnitaryViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 1);
  -[CNContactContentUnitaryViewController setupViewHierarchyAndConstraints](self, "setupViewHierarchyAndConstraints");
  v11 = -[CNContactContentUnitaryViewController applyContactStyle](self, "applyContactStyle");
}

- (void)rebuildActionsViewControllers
{
  void *v3;
  CNContactInlineActionsViewController *v4;
  CNContactInlineActionsViewController *actionsViewController;
  void *v6;
  CNContactActionsContainerView *actionsWrapperView;
  void *v8;
  void *v9;

  -[CNContactInlineActionsViewController willMoveToParentViewController:](self->_actionsViewController, "willMoveToParentViewController:", 0);
  -[CNContactInlineActionsViewController removeFromParentViewController](self->_actionsViewController, "removeFromParentViewController");
  -[CNContactInlineActionsViewController view](self->_actionsViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[CNContactContentUnitaryViewController createActionsController](self, "createActionsController");
  v4 = (CNContactInlineActionsViewController *)objc_claimAutoreleasedReturnValue();
  actionsViewController = self->_actionsViewController;
  self->_actionsViewController = v4;

  -[CNContactInlineActionsViewController setObjectViewControllerDelegate:](self->_actionsViewController, "setObjectViewControllerDelegate:", self);
  -[CNContactInlineActionsViewController setDelegate:](self->_actionsViewController, "setDelegate:", self);
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactInlineActionsViewController setContact:](self->_actionsViewController, "setContact:", v6);

  -[CNContactContentUnitaryViewController addChildViewController:](self, "addChildViewController:", self->_actionsViewController);
  -[CNContactInlineActionsViewController didMoveToParentViewController:](self->_actionsViewController, "didMoveToParentViewController:", self);
  actionsWrapperView = self->_actionsWrapperView;
  -[CNContactInlineActionsViewController view](self->_actionsViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactActionsContainerView addArrangedSubview:](actionsWrapperView, "addArrangedSubview:", v8);

  if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactInlineActionsViewController willMoveToParentViewController:](self->_floatingActionsViewController, "willMoveToParentViewController:", 0);
    -[CNContactInlineActionsViewController removeFromParentViewController](self->_floatingActionsViewController, "removeFromParentViewController");
    -[CNContactInlineActionsViewController view](self->_floatingActionsViewController, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    if ((objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
      -[CNContactContentUnitaryViewController setUpFloatingActionsViewController](self, "setUpFloatingActionsViewController");
  }
}

- (void)setUpFloatingActionsViewController
{
  CNContactInlineActionsViewController *v3;
  CNContactInlineActionsViewController *floatingActionsViewController;
  void *v5;
  CNContactActionsContainerView *floatingActionsWrapperView;
  id v7;

  if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactContentUnitaryViewController createActionsController](self, "createActionsController");
    v3 = (CNContactInlineActionsViewController *)objc_claimAutoreleasedReturnValue();
    floatingActionsViewController = self->_floatingActionsViewController;
    self->_floatingActionsViewController = v3;

    -[CNContactInlineActionsViewController setObjectViewControllerDelegate:](self->_floatingActionsViewController, "setObjectViewControllerDelegate:", self);
    -[CNContactInlineActionsViewController setDelegate:](self->_floatingActionsViewController, "setDelegate:", self);
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactInlineActionsViewController setContact:](self->_floatingActionsViewController, "setContact:", v5);

    -[CNContactContentUnitaryViewController addChildViewController:](self, "addChildViewController:", self->_floatingActionsViewController);
    -[CNContactInlineActionsViewController didMoveToParentViewController:](self->_floatingActionsViewController, "didMoveToParentViewController:", self);
    floatingActionsWrapperView = self->_floatingActionsWrapperView;
    -[CNContactInlineActionsViewController view](self->_floatingActionsViewController, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactActionsContainerView addArrangedSubview:](floatingActionsWrapperView, "addArrangedSubview:", v7);

  }
}

- (void)localeDidChange:(id)a3
{
  -[CNContactContentUnitaryViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 1);
}

- (void)setMessage:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->_message) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_message, a3);
    if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
      -[CNContactContentUnitaryViewController staticDisplayHeaderView](self, "staticDisplayHeaderView");
    else
      -[CNContactContentUnitaryViewController displayHeaderView](self, "displayHeaderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMessage:", v6);

  }
}

- (void)setImportantMessage:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->_importantMessage) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_importantMessage, a3);
    if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
      -[CNContactContentUnitaryViewController staticDisplayHeaderView](self, "staticDisplayHeaderView");
    else
      -[CNContactContentUnitaryViewController displayHeaderView](self, "displayHeaderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImportantMessage:", v6);

  }
}

- (BOOL)shouldAllowContainerPicking
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureEnabled:", 6);

  if (v5)
  {
    -[CNContactContentViewController parentContainer](self, "parentContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isGuardianRestricted") ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)setupContainerContextIfNeededForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CNUIContainerContext *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CNContactContentUnitaryViewController shouldAllowContainerPicking](self, "shouldAllowContainerPicking"))
  {
    -[CNContactContentUnitaryViewController containerContext](self, "containerContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      if (objc_msgSend(v4, "hasBeenPersisted"))
      {
        objc_msgSend(v4, "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isUnified"))
      {
        v22 = v6;
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v4, "mainStoreLinkedContacts");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v24;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v24 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12);
              -[CNContactContentUnitaryViewController contactViewCache](self, "contactViewCache");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "containerForContact:", v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v13, "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v16);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          }
          while (v10);
        }

        v6 = v22;
      }
      -[CNContactContentViewController parentContainer](self, "parentContainer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 && v6)
      {
        -[CNContactContentViewController parentContainer](self, "parentContainer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v6);

      }
      v19 = -[CNUIContainerContext initWithContainers:]([CNUIContainerContext alloc], "initWithContainers:", v7);
      -[CNContactContentViewController parentContainer](self, "parentContainer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20 && !v6)
      {
        -[CNContactContentViewController parentContainer](self, "parentContainer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNUIContainerContext addContainer:](v19, "addContainer:", v21);

      }
      -[CNContactContentUnitaryViewController setContainerContext:](self, "setContainerContext:", v19);

    }
  }

}

- (void)keyboardDidShowNotification:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  id v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[CNContactContentUnitaryViewController view](self, "view");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertRect:fromWindow:", 0, v7, v9, v11, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  objc_msgSend(v31, "convertRect:fromView:", 0, v16, v18, v20, v22);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  objc_msgSend(v31, "bounds");
  v34.origin.x = v24;
  v34.origin.y = v26;
  v34.size.width = v28;
  v34.size.height = v30;
  v33 = CGRectIntersection(v32, v34);
  -[CNContactContentUnitaryViewController adjustInsetsForKeyboardOverlap:](self, "adjustInsetsForKeyboardOverlap:", CGRectGetHeight(v33));

}

- (void)keyboardWillHideNotification:(id)a3
{
  -[CNContactContentUnitaryViewController adjustInsetsForKeyboardOverlap:](self, "adjustInsetsForKeyboardOverlap:", a3, 0.0);
}

- (void)adjustInsetsForKeyboardOverlap:(double)a3
{
  id v4;

  -[CNContactContentUnitaryViewController setKeyboardVerticalOverlap:](self, "setKeyboardVerticalOverlap:", a3);
  if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
    -[CNContactContentUnitaryViewController editingContactView](self, "editingContactView");
  else
    -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController updateInsetsIfNeededForTableView:isEditing:](self, "updateInsetsIfNeededForTableView:isEditing:", v4, -[CNContactContentUnitaryViewController isEditing](self, "isEditing"));

}

- (void)contactStoreDidChangeWithNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[CNUIContactsEnvironment defaultSchedulerProvider](self->_environment, "defaultSchedulerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainThreadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__CNContactContentUnitaryViewController_contactStoreDidChangeWithNotification___block_invoke;
  v8[3] = &unk_1E2050400;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "performBlock:", v8);

}

- (void)favoritesDidChangeWithNotification:(id)a3
{
  id v4;

  if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing", a3) & 1) == 0)
  {
    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController reloadCardGroupsForFavoritesUpdateInTableView:](self, "reloadCardGroupsForFavoritesUpdateInTableView:", v4);

  }
}

- (void)saveNewContactDraft
{
  -[CNContactContentUnitaryViewController saveModelChangesToContact](self, "saveModelChangesToContact");
  +[CNUIDraftSupport saveNewContactDraft:](CNUIDraftSupport, "saveNewContactDraft:", self->_mutableContact);
  -[CNContactContentUnitaryViewController _refetchContact](self, "_refetchContact");
}

- (void)applicationLeftForeground:(id)a3
{
  if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing", a3)
    && -[CNContactContentUnitaryViewController hasPendingChanges](self, "hasPendingChanges")
    && -[CNContactContentUnitaryViewController mode](self, "mode") == 3)
  {
    -[CNContactContentUnitaryViewController saveNewContactDraft](self, "saveNewContactDraft");
  }
}

- (void)_refetchContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  void *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  self->_needsRefetch = 0;
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentViewController parentContainer](self, "parentContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D13D40], "unifiedMeContactMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isMeContact:", v6);

    CNUILogContactCard();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        objc_msgSend(v3, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v34 = v10;
        _os_log_impl(&dword_18AC56000, v8, OS_LOG_TYPE_DEFAULT, "Refetching contact, is it the me card, identifier %{public}@", buf, 0xCu);

      }
      -[CNContactContentUnitaryViewController contactStore](self, "contactStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeysForContact:", v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      objc_msgSend(v11, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v13, &v32);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v32;
    }
    else
    {
      if (v9)
      {
        objc_msgSend(v3, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v34 = v16;
        _os_log_impl(&dword_18AC56000, v8, OS_LOG_TYPE_DEFAULT, "Refetching contact, is it not the me card, identifier %{public}@", buf, 0xCu);

      }
      -[CNContactContentUnitaryViewController contactStore](self, "contactStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeysForContact:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      objc_msgSend(v11, "unifiedContactWithIdentifier:keysToFetch:error:", v12, v17, &v31);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v31;

    }
    -[CNContactContentUnitaryViewController contactViewCache](self, "contactViewCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "containerForContact:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 || !v14)
    {
      CNUILogContactCard();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController contactStore](self, "contactStore");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v34 = v28;
        v35 = 2112;
        v36 = v15;
        v37 = 2112;
        v38 = v29;
        v39 = 2112;
        v40 = v3;
        _os_log_error_impl(&dword_18AC56000, v27, OS_LOG_TYPE_ERROR, "Error refetching contact with identifier %@, %@, store %@, full contact %@", buf, 0x2Au);

      }
    }
    else
    {
      v20 = objc_msgSend(v14, "isEqual:", v3) ^ 1;
      v21 = objc_msgSend(v19, "isEqual:", v4);
      if ((v20 & 1) != 0)
        goto LABEL_15;
      if (!v21)
        goto LABEL_15;
      -[CNContactContentUnitaryViewController cardGroupMembershipGroup](self, "cardGroupMembershipGroup");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[CNContactContentUnitaryViewController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "parentGroupsForContact:", v14);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        -[CNContactContentUnitaryViewController cardGroupMembershipGroup](self, "cardGroupMembershipGroup");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "parentGroups");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v24, "isEqualToArray:", v26);

        if ((v30 & 1) == 0)
LABEL_15:
          -[CNContactContentUnitaryViewController setContact:shouldScrollToTop:](self, "setContact:shouldScrollToTop:", v14, v20);
      }
    }

  }
}

- (void)setPersonHeaderView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id firstValue;

  firstValue = a3;
  if (firstValue)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", firstValue);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _NSDictionaryOfVariableBindings(CFSTR("personHeaderView"), firstValue, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(firstValue, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[personHeaderView]|"), 0, 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v8);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[personHeaderView]|"), 0, 0, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v9);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v6);
    -[CNContactContentUnitaryViewController setPersonHeaderViewController:](self, "setPersonHeaderViewController:", v4);

  }
  else
  {
    -[CNContactContentUnitaryViewController setPersonHeaderViewController:](self, "setPersonHeaderViewController:", 0);
  }

}

- (id)personHeaderView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CNContactContentUnitaryViewController personHeaderViewController](self, "personHeaderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setPersonHeaderViewController:(id)a3
{
  unint64_t v5;
  UIViewController *personHeaderViewController;
  char v7;
  int v8;
  void *v9;
  unint64_t v10;

  v5 = (unint64_t)a3;
  personHeaderViewController = self->_personHeaderViewController;
  if (v5 | (unint64_t)personHeaderViewController)
  {
    v10 = v5;
    v7 = -[UIViewController isEqual:](personHeaderViewController, "isEqual:", v5);
    v5 = v10;
    if ((v7 & 1) == 0)
    {
      if (self->_personHeaderViewController)
        -[CNContactContentUnitaryViewController removePersonHeaderViewControllerFromHierarchy](self, "removePersonHeaderViewControllerFromHierarchy");
      objc_storeStrong((id *)&self->_personHeaderViewController, a3);
      v8 = -[CNContactContentUnitaryViewController isViewLoaded](self, "isViewLoaded");
      v5 = v10;
      if (v8)
      {
        -[CNContactContentUnitaryViewController contactView](self, "contactView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "reloadData");

        v5 = v10;
      }
    }
  }

}

- (void)addActionWithTitle:(id)a3 menuProvider:(id)a4 inGroup:(id)a5 destructive:(BOOL)a6
{
  -[CNContactContentUnitaryViewController addActionWithTitle:target:selector:menuProvider:inGroup:destructive:](self, "addActionWithTitle:target:selector:menuProvider:inGroup:destructive:", a3, 0, 0, a4, a5, a6);
}

- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 menuProvider:(id)a6 inGroup:(id)a7 destructive:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  CNContactTargetActionWrapper *v18;
  int64_t v19;
  int64_t v20;
  CNCustomCardAction *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  int v29;
  id v30;
  uint64_t v31;

  v8 = a8;
  v31 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a4;
  v18 = -[CNContactTargetActionWrapper initWithTarget:action:]([CNContactTargetActionWrapper alloc], "initWithTarget:action:", v17, a5);

  v19 = +[CNCustomCardAction placementForGroup:inContactContentViewController:](CNCustomCardAction, "placementForGroup:inContactContentViewController:", v16, self);
  if (v19)
  {
    v20 = v19;
    v21 = [CNCustomCardAction alloc];
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[CNCustomCardAction initWithTitle:targetActionWrapper:contactIdentifier:placement:isDestructive:menuProvider:](v21, "initWithTitle:targetActionWrapper:contactIdentifier:placement:isDestructive:menuProvider:", v14, v18, v23, v20, v8, v15);

    -[CNContactContentUnitaryViewController customActions](self, "customActions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "arrayByAddingObject:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController setCustomActions:](self, "setCustomActions:", v26);

  }
  else
  {
    CNUILogContactCard();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v29 = 138412290;
      v30 = v14;
      _os_log_impl(&dword_18AC56000, v24, OS_LOG_TYPE_INFO, "Found undefined placement for action with title %@", (uint8_t *)&v29, 0xCu);
    }
  }

  if (v15)
    v27 = (id)objc_msgSend(v16, "addActionWithTitle:menuProvider:destructive:", v14, v15, v8);
  else
    v28 = (id)objc_msgSend(v16, "addActionWithTitle:target:selector:destructive:", v14, v18, sel_performActionWithSender_, v8);
  -[CNContactContentUnitaryViewController setNeedsReload](self, "setNeedsReload");

}

- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 inGroup:(id)a6 destructive:(BOOL)a7
{
  -[CNContactContentUnitaryViewController addActionWithTitle:target:selector:menuProvider:inGroup:destructive:](self, "addActionWithTitle:target:selector:menuProvider:inGroup:destructive:", a3, a4, a5, 0, a6, a7);
}

- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 inGroup:(id)a6
{
  -[CNContactContentUnitaryViewController addActionWithTitle:target:selector:inGroup:destructive:](self, "addActionWithTitle:target:selector:inGroup:destructive:", a3, a4, a5, a6, 0);
}

- (void)removeActionWithTarget:(id)a3 selector:(SEL)a4 inGroup:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  CNContactContentUnitaryViewController *v17;
  SEL v18;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "removeActionWithTarget:selector:", v8, a4);
  -[CNContactContentUnitaryViewController customActions](self, "customActions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__CNContactContentUnitaryViewController_removeActionWithTarget_selector_inGroup___block_invoke;
  v14[3] = &unk_1E204F720;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v18 = a4;
  v11 = v9;
  v13 = v8;
  objc_msgSend(v10, "_cn_filter:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController setCustomActions:](self, "setCustomActions:", v12);

  -[CNContactContentUnitaryViewController setNeedsReload](self, "setNeedsReload");
}

- (void)reloadCardGroup:(id)a3 forTableView:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (-[CNContactContentUnitaryViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (!-[CNContactContentUnitaryViewController needsReload](self, "needsReload"))
    {
      v7 = -[CNContactContentUnitaryViewController sectionOfGroup:inTableView:](self, "sectionOfGroup:inTableView:", v9, v6);
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController reloadSections:forTableView:](self, "reloadSections:forTableView:", v8, v6);

      }
    }
  }

}

- (void)reloadSections:(id)a3 forTableView:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "beginUpdates");
  objc_msgSend(v6, "reloadSections:withRowAnimation:", v7, 0);

  objc_msgSend(v6, "endUpdates");
  if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
    -[CNContactContentUnitaryViewController updateCollapsedHeaderToMatchScrollViewState:scrollDirection:animated:](self, "updateCollapsedHeaderToMatchScrollViewState:scrollDirection:animated:", v6, 2, 0);
  else
    -[CNContactContentUnitaryViewController updateHeaderHeightToMatchScrollViewState:scrollDirection:animated:](self, "updateHeaderHeightToMatchScrollViewState:scrollDirection:animated:", v6, 2, 0);

  -[CNContactContentUnitaryViewController adjustPreferredContentSize](self, "adjustPreferredContentSize");
}

- (void)reloadCardGroupsForFavoritesUpdateInTableView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[5];

  v21[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CNContactContentUnitaryViewController isViewLoaded](self, "isViewLoaded")
    && !-[CNContactContentUnitaryViewController needsReload](self, "needsReload"))
  {
    -[CNContactContentUnitaryViewController cardGroupForProperty:](self, "cardGroupForProperty:", *MEMORY[0x1E0C966A8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController cardGroupForProperty:](self, "cardGroupForProperty:", *MEMORY[0x1E0C967C0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v5;
    v21[1] = v6;
    -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = -[CNContactContentUnitaryViewController sectionOfGroup:inTableView:](self, "sectionOfGroup:inTableView:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14), v4, (_QWORD)v16);
          if (v15 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v9, "addIndex:", v15);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

    -[CNContactContentUnitaryViewController reloadSections:forTableView:](self, "reloadSections:forTableView:", v9, v4);
  }

}

- (id)indexPathOfDisplayedPropertyItem:(id)a3
{
  return -[CNContactContentUnitaryViewController indexPathOfPropertyItem:editing:](self, "indexPathOfPropertyItem:editing:", a3, 0);
}

- (BOOL)hasPendingChanges
{
  if (-[CNContactContentUnitaryViewController _modelIsEmpty](self, "_modelIsEmpty")
    || !-[CNContactContentUnitaryViewController _modelHasChanges](self, "_modelHasChanges"))
  {
    return 0;
  }
  else
  {
    return -[CNContactContentUnitaryViewController isEditing](self, "isEditing");
  }
}

- (void)cancelAsyncLookups
{
  void *v3;
  void *v4;
  void *v5;

  -[CNContactContentUnitaryViewController faceTimeIDSLookupToken](self, "faceTimeIDSLookupToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CNContactContentUnitaryViewController setFaceTimeIDSLookupToken:](self, "setFaceTimeIDSLookupToken:", 0);
  -[CNContactContentUnitaryViewController iMessageIDSLookupToken](self, "iMessageIDSLookupToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  -[CNContactContentUnitaryViewController setIMessageIDSLookupToken:](self, "setIMessageIDSLookupToken:", 0);
  -[CNContactContentUnitaryViewController medicalIDLookupToken](self, "medicalIDLookupToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  -[CNContactContentUnitaryViewController setMedicalIDLookupToken:](self, "setMedicalIDLookupToken:", 0);
}

- (void)editCancel:(id)a3
{
  void *v4;

  if (-[CNContactContentUnitaryViewController hasPendingChanges](self, "hasPendingChanges", a3))
  {
    if (-[CNContactContentUnitaryViewController isOutOfProcess](self, "isOutOfProcess"))
    {
      -[CNContactContentUnitaryViewController contactView](self, "contactView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "endEditing:", 1);

    }
    -[CNContactContentUnitaryViewController presentConfirmCancelAlertController](self, "presentConfirmCancelAlertController");
  }
  else
  {
    -[CNContactContentUnitaryViewController performConfirmedCancel](self, "performConfirmedCancel");
  }
  if (self->_needsRefetch)
    -[CNContactContentUnitaryViewController _refetchContact](self, "_refetchContact");
}

- (void)popToPrevious:(id)a3
{
  id v3;
  id v4;

  -[CNContactContentUnitaryViewController currentNavigationController](self, "currentNavigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void)presentConfirmCancelAlertController
{
  id v2;

  -[CNContactContentUnitaryViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentCancelConfirmationAlert");

}

- (void)clearMapsDataIfEdited
{
  id v3;

  if (-[CNContactContentUnitaryViewController _modelHasChanges](self, "_modelHasChanges"))
  {
    -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMapsData:", 0);

  }
}

- (BOOL)saveChanges
{
  BOOL result;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v6[16];

  if (self->_saving)
    return 0;
  self->_saving = 1;
  -[CNContactContentUnitaryViewController saveModelChangesToContact](self, "saveModelChangesToContact");
  if (-[CNContactContentUnitaryViewController shouldUpdateSharedProfile](self, "shouldUpdateSharedProfile"))
    -[CNContactContentUnitaryViewController saveModelChangesToSharedProfileContact](self, "saveModelChangesToSharedProfileContact");
  CNUILogContactCard();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] performing save…", v6, 2u);
  }

  v5 = -[CNContactContentUnitaryViewController performSave](self, "performSave");
  result = 0;
  self->_saving = 0;
  if (v5)
  {
    if (-[CNContactContentUnitaryViewController shouldUpdateSharedProfile](self, "shouldUpdateSharedProfile"))
      -[CNContactContentUnitaryViewController performSaveToSharedProfile](self, "performSaveToSharedProfile");
    return 1;
  }
  return result;
}

- (BOOL)shouldUpdateSharedProfile
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isFeatureEnabled:", 15))
    v5 = -[CNContactContentUnitaryViewController shouldUseSharedProfile](self, "shouldUseSharedProfile");
  else
    v5 = 0;

  return v5;
}

- (void)saveModelChangesToSharedProfileContact
{
  void *v3;

  v3 = (void *)-[CNMutableContact copy](self->_mutableContact, "copy");
  -[CNContactContentUnitaryViewController setEditingNicknameContact:](self, "setEditingNicknameContact:", v3);

  -[CNContactContentUnitaryViewController setSavingPersonalSharedProfile:](self, "setSavingPersonalSharedProfile:", 1);
}

- (void)performSaveToSharedProfile
{
  uint64_t v3;
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  void (**v14)(_QWORD);
  _QWORD aBlock[5];

  if (-[CNContactContentUnitaryViewController shouldUpdateSharedProfile](self, "shouldUpdateSharedProfile"))
  {
    v3 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__CNContactContentUnitaryViewController_performSaveToSharedProfile__block_invoke;
    aBlock[3] = &unk_1E204F648;
    aBlock[4] = self;
    v4 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "userInterfaceIdiom"))
    {
      -[CNContactContentUnitaryViewController editingNicknameContact](self, "editingNicknameContact");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "wallpaper");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        -[CNContactContentUnitaryViewController editingNicknameContact](self, "editingNicknameContact");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "watchWallpaperImageData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          -[CNContactContentUnitaryViewController editingNicknameContact](self, "editingNicknameContact");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "wallpaper");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13[0] = v3;
          v13[1] = 3221225472;
          v13[2] = __67__CNContactContentUnitaryViewController_performSaveToSharedProfile__block_invoke_332;
          v13[3] = &unk_1E204F7C8;
          v13[4] = self;
          v14 = v4;
          objc_msgSend(v12, "snapshotImageDataForWatchWithCompletion:", v13);

          goto LABEL_5;
        }
LABEL_4:
        v4[2](v4);
LABEL_5:

        return;
      }

    }
    goto LABEL_4;
  }
  -[CNContactContentUnitaryViewController setSavingPersonalSharedProfile:](self, "setSavingPersonalSharedProfile:", 0);
}

- (void)saveModelChangesToContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;

  -[CNContactContentUnitaryViewController editingGroups](self, "editingGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController _saveChangesForGroups:](self, "_saveChangesForGroups:", v3);

  -[CNContactContentUnitaryViewController deletedEditingGroups](self, "deletedEditingGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController _saveChangesForGroups:](self, "_saveChangesForGroups:", v4);

  -[CNContactContentUnitaryViewController editingHeaderView](self, "editingHeaderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "saveContactPhoto");

  -[CNContactContentUnitaryViewController contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "givenName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "givenName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", v9))
  {

    goto LABEL_5;
  }
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "familyName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "familyName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isEqualToString:", v13);

  if ((v14 & 1) == 0)
  {
LABEL_5:
    -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPhonemeData:", 0);

  }
}

- (BOOL)performSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD block[4];
  id v14;

  -[CNContactContentUnitaryViewController saveContactExecutor](self, "saveContactExecutor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController saveDescriptionForCurrentState](self, "saveDescriptionForCurrentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeSaveWithConfiguration:saveDelegate:", v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController setIssuedSaveRequestIdentifiers:](self, "setIssuedSaveRequestIdentifiers:", v6);

  if (objc_msgSend(v5, "success"))
  {
    -[CNContactContentUnitaryViewController setShadowCopyOfReadonlyContact:](self, "setShadowCopyOfReadonlyContact:", 0);
    _LargeDatabasesSignpostLogQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__CNContactContentUnitaryViewController_performSave__block_invoke;
    block[3] = &unk_1E204F648;
    v14 = v5;
    dispatch_async(v7, block);

  }
  -[CNContactContentUnitaryViewController issuedSaveRequestIdentifiers](self, "issuedSaveRequestIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifiersOfIssuedSaveRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v9);

  -[CNContactContentUnitaryViewController setEditingLinkedContacts:](self, "setEditingLinkedContacts:", 0);
  -[CNContactContentUnitaryViewController setGroupEditingContext:](self, "setGroupEditingContext:", 0);
  objc_msgSend(v5, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController setContact:](self, "setContact:", v10);

  v11 = objc_msgSend(v5, "success");
  return v11;
}

- (id)saveDescriptionForCurrentState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  CNUIContactSaveConfiguration *v12;
  uint64_t v14;
  void *v15;
  CNUIContactSaveConfiguration *v16;

  v16 = [CNUIContactSaveConfiguration alloc];
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController shadowCopyOfReadonlyContact](self, "shadowCopyOfReadonlyContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController editingLinkedContacts](self, "editingLinkedContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController contactStore](self, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentViewController parentGroup](self, "parentGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentViewController parentContainer](self, "parentContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController containerContext](self, "containerContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController groupContext](self, "groupContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CNContactContentViewController ignoresParentalRestrictions](self, "ignoresParentalRestrictions");
  BYTE1(v14) = -[CNContactContentUnitaryViewController saveWasAuthorized](self, "saveWasAuthorized");
  LOBYTE(v14) = v11;
  v12 = -[CNUIContactSaveConfiguration initWithContact:mutableContact:shadowCopyOfReadonlyContact:editingLinkedContacts:contactStore:parentGroup:parentContainer:containerContext:groupContext:ignoresParentalRestrictions:saveWasAuthorized:](v16, "initWithContact:mutableContact:shadowCopyOfReadonlyContact:editingLinkedContacts:contactStore:parentGroup:parentContainer:containerContext:groupContext:ignoresParentalRestrictions:saveWasAuthorized:", v15, v3, v4, v5, v6, v7, v8, v9, v10, v14);

  return v12;
}

- (BOOL)saveWasAuthorized
{
  CNContactContentUnitaryViewController *v2;
  void *v3;

  v2 = self;
  -[CNContactContentUnitaryViewController authorizationCheck](self, "authorizationCheck");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "shouldBypassRestrictionsGivenAuthorizationResult:", -[CNContactContentUnitaryViewController editAuthorizationResult](v2, "editAuthorizationResult"));

  return (char)v2;
}

- (void)updateContact:(id)a3
{
  void *v4;

  if (-[CNContactContentUnitaryViewController saveChanges](self, "saveChanges", a3))
  {
    -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController _didCompleteWithContact:](self, "_didCompleteWithContact:", v4);

  }
  else
  {
    -[CNContactContentUnitaryViewController _didCompleteWithContact:](self, "_didCompleteWithContact:", 0);
  }
  -[CNContactContentUnitaryViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 0);
}

- (BOOL)isContactProviderDataSource
{
  void *v2;
  BOOL v3;

  -[CNContactContentViewController parentContainer](self, "parentContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type") == 1003;

  return v3;
}

- (void)toggleEditing
{
  -[CNContactContentUnitaryViewController toggleEditing:](self, "toggleEditing:", 0);
}

- (void)toggleEditing:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
  {
    -[CNContactContentUnitaryViewController cardStaticIdentityGroup](self, "cardStaticIdentityGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "didChange");

    if (v5)
    {
      -[CNContactContentUnitaryViewController cardStaticIdentityGroup](self, "cardStaticIdentityGroup");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "saveChangesToKTStore");

      if ((v7 & 1) == 0)
      {
        -[CNContactContentUnitaryViewController alertStaticIdentitySaveFailed:](self, "alertStaticIdentitySaveFailed:", v11);
        goto LABEL_8;
      }
      v8 = objc_alloc(MEMORY[0x1E0D13D68]);
      -[CNContactContentUnitaryViewController contact](self, "contact");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithContact:", v9);
      -[CNContactContentUnitaryViewController setCachedStaticIdentity:](self, "setCachedStaticIdentity:", v10);

      -[CNContactContentUnitaryViewController setCachedVerifiedHandles:](self, "setCachedVerifiedHandles:", 0);
    }
    else if (-[CNContactContentUnitaryViewController hadAtLeastOneVerifiedHandle](self, "hadAtLeastOneVerifiedHandle")
           && !-[CNContactContentUnitaryViewController _hasAtLeastOneVerifiedHandle](self, "_hasAtLeastOneVerifiedHandle"))
    {
      -[CNContactContentUnitaryViewController alertDetailsNotVerified:](self, "alertDetailsNotVerified:", v11);
      goto LABEL_8;
    }
  }
  -[CNContactContentUnitaryViewController finishEditing:](self, "finishEditing:", v11);
LABEL_8:

}

- (void)finishEditing:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  int v19;
  NSObject *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t v25[16];

  v4 = a3;
  v5 = -[CNContactContentUnitaryViewController isEditing](self, "isEditing");
  -[CNContactContentUnitaryViewController cancelAsyncLookups](self, "cancelAsyncLookups");
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endEditing:", 1);

  -[CNContactContentUnitaryViewController splitViewController](self, "splitViewController");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_3;
  v8 = (void *)v7;
  -[CNContactContentUnitaryViewController splitViewController](self, "splitViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CNContactContentUnitaryViewController splitViewController](self, "splitViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "endEditing:", 1);

    if (!v5)
      goto LABEL_7;
  }
  else
  {
LABEL_3:
    if (!v5)
      goto LABEL_7;
  }
  if (!-[CNContactContentUnitaryViewController _modelHasChanges](self, "_modelHasChanges"))
  {
    -[CNContactContentUnitaryViewController editCancel:](self, "editCancel:", v4);
    goto LABEL_23;
  }
LABEL_7:
  -[CNContactContentUnitaryViewController presentingViewController](self, "presentingViewController");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_12;
  v15 = (void *)v14;
  -[CNContactContentUnitaryViewController parentViewController](self, "parentViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getClass("ABNewPersonViewController");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = -[CNContactContentUnitaryViewController mode](self, "mode");

    if (v17 == 3)
      goto LABEL_13;
LABEL_12:
    -[CNContactContentUnitaryViewController setEditing:animated:](self, "setEditing:animated:", v5 ^ 1u, 1);
    goto LABEL_13;
  }

LABEL_13:
  if (!v5)
  {
    -[CNContactContentUnitaryViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 0);
    -[CNContactContentUnitaryViewController editingContactView](self, "editingContactView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "reloadData");

    goto LABEL_26;
  }
  -[CNContactContentUnitaryViewController cardEditingGeminiGroup](self, "cardEditingGeminiGroup");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "modified");

  if (v19)
    -[CNContactContentUnitaryViewController requestFavoritesUpdateWithGemini](self, "requestFavoritesUpdateWithGemini");
  CNUILogContactCard();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_18AC56000, v20, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] Done editing, will save changes", v25, 2u);
  }

  v21 = -[CNContactContentUnitaryViewController saveChanges](self, "saveChanges");
  -[CNContactContentViewController setAlwaysEditing:](self, "setAlwaysEditing:", 0);
  if (v21)
  {
    -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController _didCompleteWithContact:](self, "_didCompleteWithContact:", v22);

  }
  else
  {
    -[CNContactContentUnitaryViewController _didCompleteWithContact:](self, "_didCompleteWithContact:", 0);
  }
  -[CNContactContentUnitaryViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 0);
  -[CNContactContentUnitaryViewController editingContactView](self, "editingContactView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "reloadData");

LABEL_23:
  -[CNContactContentUnitaryViewController resetEditAuthorizationState](self, "resetEditAuthorizationState");
  -[CNContactContentUnitaryViewController setRequiresGameCenterRefresh:](self, "setRequiresGameCenterRefresh:", 1);
  if (-[CNContactContentUnitaryViewController supportsDrafts](self, "supportsDrafts"))
    +[CNUIDraftSupport deleteDrafts](CNUIDraftSupport, "deleteDrafts");
  -[CNContactContentUnitaryViewController showUpdateTermOfAddressAlertIfNeeded](self, "showUpdateTermOfAddressAlertIfNeeded");
LABEL_26:

}

- (void)showUpdateTermOfAddressAlertIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;

  if (-[CNContactContentUnitaryViewController didEditPronouns](self, "didEditPronouns"))
  {
    -[CNContactContentUnitaryViewController setDidEditPronouns:](self, "setDidEditPronouns:", 0);
    if (-[CNContactContentUnitaryViewController showingMeContact](self, "showingMeContact"))
    {
      if (objc_msgSend(MEMORY[0x1E0CB3B68], "canSelectUserInflection"))
      {
        v3 = (void *)MEMORY[0x1E0DC3450];
        CNContactsUIBundle();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ADDRESSING_GRAMMAR_UPDATE_SETTINGS_ALERT_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        CNContactsUIBundle();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ADDRESSING_GRAMMAR_UPDATE_SETTINGS_ALERT_MESSAGE"), &stru_1E20507A8, CFSTR("Localized"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = (void *)MEMORY[0x1E0DC3448];
        CNContactsUIBundle();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ADDRESSING_GRAMMAR_UPDATE_SETTINGS_ALERT_CANCEL_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = MEMORY[0x1E0C809B0];
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __77__CNContactContentUnitaryViewController_showUpdateTermOfAddressAlertIfNeeded__block_invoke;
        v25[3] = &unk_1E204F7F0;
        v13 = v8;
        v26 = v13;
        objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 1, v25);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addAction:", v14);

        v15 = (void *)MEMORY[0x1E0DC3448];
        CNContactsUIBundle();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ADDRESSING_GRAMMAR_UPDATE_SETTINGS_ALERT_UPDATE_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v12;
        v21 = 3221225472;
        v22 = __77__CNContactContentUnitaryViewController_showUpdateTermOfAddressAlertIfNeeded__block_invoke_2;
        v23 = &unk_1E204F7F0;
        v24 = v13;
        v18 = v13;
        objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 0, &v20);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addAction:", v19, v20, v21, v22, v23);

        -[CNContactContentUnitaryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);
      }
    }
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  id v8;

  v4 = a4;
  v5 = a3;
  if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing") != a3)
  {
    if (-[CNContactContentUnitaryViewController editingChangeRequiresAuthorization](self, "editingChangeRequiresAuthorization"))
    {
      -[CNContactContentUnitaryViewController navigationItem](self, "navigationItem");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rightBarButtonItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController showEditAuthorizationPane:animated:](self, "showEditAuthorizationPane:animated:", v7, v4);

    }
    else
    {
      -[CNContactContentUnitaryViewController performAuthorizedSetEditing:animated:](self, "performAuthorizedSetEditing:animated:", v5, v4);
    }
  }
}

- (BOOL)editingChangeRequiresAuthorization
{
  return (-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0
      && -[CNContactContentUnitaryViewController editRequiresAuthorization](self, "editRequiresAuthorization");
}

- (void)showEditAuthorizationPane:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  CNUIEditAuthorizationController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(CNUIEditAuthorizationController);
  -[CNContactContentUnitaryViewController setEditAuthorizationController:](self, "setEditAuthorizationController:", v7);

  -[CNContactContentUnitaryViewController editAuthorizationController](self, "editAuthorizationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[CNContactContentUnitaryViewController editAuthorizationController](self, "editAuthorizationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSender:", v6);

  -[CNContactContentUnitaryViewController editAuthorizationController](self, "editAuthorizationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAnimated:", v4);

  -[CNContactContentUnitaryViewController editAuthorizationController](self, "editAuthorizationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setGuardedViewController:", self);

  -[CNContactContentUnitaryViewController editAuthorizationController](self, "editAuthorizationController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentAuthorizationUI");

}

- (void)editAuthorizationController:(id)a3 authorizationDidFinishWithResult:(int64_t)a4
{
  id v6;

  -[CNContactContentUnitaryViewController setEditAuthorizationController:](self, "setEditAuthorizationController:", 0);
  -[CNContactContentUnitaryViewController setEditAuthorizationResult:](self, "setEditAuthorizationResult:", a4);
  if ((unint64_t)a4 >= 2)
  {
    if (a4 == 2)
    {
      -[CNContactContentUnitaryViewController performAuthorizedSetEditing:animated:](self, "performAuthorizedSetEditing:animated:", 1, 1);
      -[CNContactContentUnitaryViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 1);
    }
  }
  else
  {
    -[CNContactContentUnitaryViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didCompleteWithContact:", 0);

  }
}

- (void)performAuthorizedSetEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  void *v10;
  CNContactView *editingContactView;
  void *v12;
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
  void *v23;
  double v24;
  void *v25;
  char v26;
  void *v27;
  _QWORD v28[5];
  objc_super v29;
  uint8_t buf[16];

  v4 = a4;
  v5 = a3;
  CNUILogContactCard();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v8)
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v9 = "[CNContactContentViewController] Entering Edit Mode";
  }
  else
  {
    if (!v8)
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v9 = "[CNContactContentViewController] Leaving Edit Mode";
  }
  _os_log_impl(&dword_18AC56000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
LABEL_7:

  if (-[CNContactContentUnitaryViewController shouldAllowContainerPicking](self, "shouldAllowContainerPicking"))
  {
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController setupContainerContextIfNeededForContact:](self, "setupContainerContextIfNeededForContact:", v10);

  }
  if (v5)
  {
    if (-[CNContactContentUnitaryViewController didSetNewContact](self, "didSetNewContact"))
    {
      -[CNContactContentUnitaryViewController setDidSetNewContact:](self, "setDidSetNewContact:", 0);
      editingContactView = self->_editingContactView;
      self->_editingContactView = 0;

    }
    -[CNContactContentUnitaryViewController setDidEditPronouns:](self, "setDidEditPronouns:", 0);
    -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController editingContactView](self, "editingContactView");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNContactContentUnitaryViewController editingContactView](self, "editingContactView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
  -[CNContactContentUnitaryViewController updateInsetsIfNeededForTableView:isEditing:](self, "updateInsetsIfNeededForTableView:isEditing:", v13, v5);
  objc_msgSend(v12, "_stopScrollingAndZoomingAnimations");
  -[CNContactContentUnitaryViewController _currentTopVisibleGroupInContactView:](self, "_currentTopVisibleGroupInContactView:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController environment](self, "environment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAttributesFromContactView:runningInContactsAppOniPad:", v12, objc_msgSend(v16, "runningInContactsAppOniPad"));

  v29.receiver = self;
  v29.super_class = (Class)CNContactContentUnitaryViewController;
  -[CNContactContentUnitaryViewController setEditing:animated:](&v29, sel_setEditing_animated_, v5, v4);
  -[CNContactContentUnitaryViewController updateEditNavigationItemsAnimated:](self, "updateEditNavigationItemsAnimated:", v4);
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_opt_class();
  objc_msgSend(v19, "cellIdentifierForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dequeueReusableCellWithIdentifier:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController setNoteCell:](self, "setNoteCell:", v21);

  objc_msgSend(v14, "reloadData");
  -[CNContactContentUnitaryViewController _scrollContactView:toVisibleGroup:animated:](self, "_scrollContactView:toVisibleGroup:animated:", v14, v15, 0);
  v22 = (void *)MEMORY[0x1E0DC3F10];
  -[CNContactContentUnitaryViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0.0;
  if (v4)
    v24 = 0.25;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __78__CNContactContentUnitaryViewController_performAuthorizedSetEditing_animated___block_invoke;
  v28[3] = &unk_1E204F648;
  v28[4] = self;
  objc_msgSend(v22, "transitionWithView:duration:options:animations:completion:", v23, 5242880, v28, 0, v24);

  -[CNContactContentUnitaryViewController contactDelegate](self, "contactDelegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_opt_respondsToSelector();

  if ((v26 & 1) != 0)
  {
    -[CNContactContentUnitaryViewController contactDelegate](self, "contactDelegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "contactViewController:didChangeToEditMode:", self, v5);

  }
}

- (void)setupViewHierarchy
{
  -[CNContactContentUnitaryViewController setupViewHierarchyIncludingAvatarHeader:editing:](self, "setupViewHierarchyIncludingAvatarHeader:editing:", -[CNContactContentUnitaryViewController shouldDisplayAvatarHeaderView](self, "shouldDisplayAvatarHeaderView"), -[CNContactContentUnitaryViewController isEditing](self, "isEditing"));
  -[CNContactContentUnitaryViewController setupTableHeaderView](self, "setupTableHeaderView");
  -[CNContactContentUnitaryViewController setupTableFooterView](self, "setupTableFooterView");
  -[CNContactContentUnitaryViewController setHasSetupViewHierarchy:](self, "setHasSetupViewHierarchy:", 1);
}

- (void)setupViewHierarchyAndConstraints
{
  -[CNContactContentUnitaryViewController setupViewHierarchy](self, "setupViewHierarchy");
  -[CNContactContentUnitaryViewController setupConstraints](self, "setupConstraints");
}

- (double)editingFloatingHeaderHeight
{
  void *v2;
  double v3;
  double v4;
  double result;

  -[CNContactContentUnitaryViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeAreaInsets");
  v4 = v3;

  result = 44.0;
  if (v4 >= 44.0)
    return v4;
  return result;
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIGestureRecognizerDelegate *previousBackGestureDelegate;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CNContactContentUnitaryViewController;
  -[CNContactContentUnitaryViewController viewWillDisappear:](&v13, sel_viewWillDisappear_, a3);
  -[CNContactContentUnitaryViewController siriContextProvider](self, "siriContextProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  -[CNContactContentUnitaryViewController updateWindowTitleForAppearing:](self, "updateWindowTitleForAppearing:", 0);
  -[CNContactContentUnitaryViewController shareLocationController](self, "shareLocationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopUpdatingFriends");

  if (-[CNContactContentUnitaryViewController displayNavigationButtonsShouldUsePlatterStyle](self, "displayNavigationButtonsShouldUsePlatterStyle"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController navigationItemController](self, "navigationItemController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTintColor:", v6);

    previousBackGestureDelegate = self->_previousBackGestureDelegate;
    -[CNContactContentUnitaryViewController currentNavigationController](self, "currentNavigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "interactivePopGestureRecognizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", previousBackGestureDelegate);

  }
}

- (void)performWhenViewIsLaidOut:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CNContactContentUnitaryViewController pendingLayoutBlocks](self, "pendingLayoutBlocks");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = _Block_copy(v5);
  objc_msgSend(v8, "arrayByAddingObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController setPendingLayoutBlocks:](self, "setPendingLayoutBlocks:", v7);

}

- (void)didChangeToEditMode:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing") != a3)
    -[CNContactContentUnitaryViewController setEditing:animated:](self, "setEditing:animated:", v3, 0);
}

- (void)editCancel
{
  -[CNContactContentUnitaryViewController editCancel:](self, "editCancel:", 0);
}

- (void)didChangeToShowTitle:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CNContactContentUnitaryViewController setLayoutPositionallyAfterNavBar:](self, "setLayoutPositionallyAfterNavBar:", a3);
  if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactContentUnitaryViewController staticDisplayHeaderView](self, "staticDisplayHeaderView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateForShowingNavBar:", -[CNContactContentUnitaryViewController layoutPositionallyAfterNavBar](self, "layoutPositionallyAfterNavBar"));

    -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
  }
  else
  {
    -[CNContactContentUnitaryViewController displayHeaderView](self, "displayHeaderView");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateForShowingNavBar:", -[CNContactContentUnitaryViewController layoutPositionallyAfterNavBar](self, "layoutPositionallyAfterNavBar"));

  -[CNContactContentUnitaryViewController editingHeaderView](self, "editingHeaderView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateForShowingNavBar:", -[CNContactContentUnitaryViewController layoutPositionallyAfterNavBar](self, "layoutPositionallyAfterNavBar"));

}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v8 = a5;
  if (!-[CNContactContentUnitaryViewController isPersonHeaderIndexPath:forTableView:](self, "isPersonHeaderIndexPath:forTableView:", v8, v23)&& !-[CNContactContentUnitaryViewController isSharedProfileBannerSectionIndexPath:forTableView:](self, "isSharedProfileBannerSectionIndexPath:forTableView:", v8, v23))
  {
    -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", objc_msgSend(v8, "section"), v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "editingItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 != 2)
    {
      if (a4 != 1)
      {
LABEL_17:
        -[CNContactContentUnitaryViewController updateDoneButton](self, "updateDoneButton");

        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "contact");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController removeLinkedContact:](self, "removeLinkedContact:", v12);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          -[CNContactContentUnitaryViewController removeEditingItem:atIndexPath:forTableView:](self, "removeEditingItem:atIndexPath:forTableView:", v11, v8, v23);
          goto LABEL_17;
        }
        objc_msgSend(v11, "group");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          -[CNContactContentUnitaryViewController removeContactFromGroup:](self, "removeContactFromGroup:", v12);
      }
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v23, "cellForRowAtIndexPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CNContactContentUnitaryViewController addLinkedCardAction](self, "addLinkedCardAction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v11, "property");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0C96668]);

          if (v17)
          {
            objc_opt_class();
            objc_msgSend(v23, "cellForRowAtIndexPath:", v8);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v19 = v18;
            else
              v19 = 0;
            v20 = v19;

            -[CNContactContentUnitaryViewController addAddressingGrammarAction](self, "addAddressingGrammarAction");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setIndexPath:", v8);

            -[CNContactContentUnitaryViewController addAddressingGrammarAction](self, "addAddressingGrammarAction");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "performActionWithSender:", v20);

          }
          else
          {
            -[CNContactContentUnitaryViewController addEditingItemAtIndexPath:forTableView:](self, "addEditingItemAtIndexPath:forTableView:", v8, v23);
          }
          goto LABEL_16;
        }
        -[CNContactContentUnitaryViewController actionProvider](self, "actionProvider");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addStaticIdentityAction");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "performActionWithSender:", v12);

        goto LABEL_15;
      }
      -[CNContactContentUnitaryViewController addToGroupAction](self, "addToGroupAction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
    objc_msgSend(v13, "performActionWithSender:", v12);
LABEL_15:

    goto LABEL_16;
  }
LABEL_18:

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  char v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11
    && ((objc_msgSend(v11, "forceSuggested") & 1) != 0 || !objc_msgSend(v11, "allowsCellSelection")))
  {
    v16 = 0;
  }
  else
  {
    -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", objc_msgSend(v7, "section"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController cardGameCenterActionGroup](self, "cardGameCenterActionGroup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqual:", v13) & 1) != 0)
    {
      -[CNContactContentUnitaryViewController gameCenterManager](self, "gameCenterManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "hasSentInvite");

      v16 = v15 ^ 1;
    }
    else
    {

      v16 = 1;
    }
  }

  return v16;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v6 = a4;
  if (!-[CNContactContentUnitaryViewController isPersonHeaderIndexPath:forTableView:](self, "isPersonHeaderIndexPath:forTableView:", v6, v28)&& !-[CNContactContentUnitaryViewController isSharedProfileBannerSectionIndexPath:forTableView:](self, "isSharedProfileBannerSectionIndexPath:forTableView:", v6, v28))
  {
    objc_msgSend(v28, "cellForRowAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CNContactContentUnitaryViewController _indexPathIsActionItem:forTableView:](self, "_indexPathIsActionItem:forTableView:", v6, v28))
    {
      -[CNContactContentUnitaryViewController _itemAtIndexPath:forTableView:](self, "_itemAtIndexPath:forTableView:", v6, v28);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "actions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "performActionWithSender:", v7);
      objc_msgSend(v28, "indexPathForSelectedRow");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "deselectRowAtIndexPath:animated:", v11, 1);

    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing")
        && objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
      {
        objc_msgSend(v28, "deselectRowAtIndexPath:animated:", v6, 1);
        objc_opt_class();
        v12 = v7;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;
        v14 = v13;

        objc_opt_class();
        objc_msgSend(v14, "cardGroupItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v15;
        else
          v16 = 0;
        v17 = v16;

        objc_msgSend(v17, "property");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0C96668]);

        if (v19)
        {
          -[CNContactContentUnitaryViewController addAddressingGrammarAction](self, "addAddressingGrammarAction");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setIndexPath:", v6);

          -[CNContactContentUnitaryViewController addAddressingGrammarAction](self, "addAddressingGrammarAction");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "performActionWithSender:", v14);

        }
        else
        {
          -[CNContactContentUnitaryViewController addEditingItemAtIndexPath:forTableView:](self, "addEditingItemAtIndexPath:forTableView:", v6, v28);
        }

      }
      else
      {
        v22 = (objc_msgSend(v7, "shouldPerformDefaultAction") & 1) != 0
           || -[CNContactContentViewController allowsPropertyActions](self, "allowsPropertyActions");
        if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v7, "isSuggested") & 1) == 0)
          {
            -[CNContactContentUnitaryViewController _itemAtIndexPath:forTableView:](self, "_itemAtIndexPath:forTableView:", v6, v28);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "contact");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "property");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "labeledValue");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = -[CNContactContentUnitaryViewController contactViewController:shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:](self, "contactViewController:shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:", self, v24, v25, v27);

          }
        }
        if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[CNContactContentUnitaryViewController _pickName](self, "_pickName");
        }
        if (v22)
          objc_msgSend(v7, "performDefaultAction");
        objc_msgSend(v28, "deselectRowAtIndexPath:animated:", v6, 1);
      }
    }

  }
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v6;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  if (self->_editingContactView == a3)
  {
    v8 = a3;
    objc_opt_class();
    -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", objc_msgSend(v6, "section"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      objc_opt_class();
      objc_msgSend(v11, "editingItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v15 = v14;

      v7 = v15 && objc_msgSend(v15, "canReorder") && objc_msgSend(v11, "valueEditingItemsCount") > 1;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_opt_class();
  -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", objc_msgSend(v9, "section"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v15 = v12;

  v13 = objc_msgSend(v9, "row");
  v14 = objc_msgSend(v8, "row");

  objc_msgSend(v15, "moveEditingItemFromIndex:toIndex:", v13, v14);
  -[CNContactContentUnitaryViewController updateDoneButton](self, "updateDoneButton");

}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "section");
  v12 = objc_msgSend(v10, "section");
  v13 = v9;
  if (v11 == v12)
  {
    objc_opt_class();
    -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", objc_msgSend(v9, "section"), v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    v17 = objc_msgSend(v10, "row");
    v18 = objc_msgSend(v16, "valueEditingItemsCount");

    if (v17 >= v18)
      v13 = v9;
    else
      v13 = v10;
  }
  v19 = v13;

  return v19;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v8 = a4;
  -[CNContactContentUnitaryViewController tableView:willDisplayFooterView:forSection:](self, "tableView:willDisplayFooterView:forSection:", v21, v8, a5);
  objc_msgSend(v8, "_cnui_applyContactStyle");
  -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", a5, v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController cardEditingDeleteContactGroup](self, "cardEditingDeleteContactGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == v10
    && (-[CNContactContentUnitaryViewController ignoreContactAction](self, "ignoreContactAction"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = v9,
        v17))
  {
    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sectionBackgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[CNContactContentUnitaryViewController contactView](self, "contactView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sectionBackgroundColor");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
  else
  {

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "backgroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "backgroundColor");
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v16 = (void *)v14;
        objc_msgSend(v8, "backgroundView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setBackgroundColor:", v16);

        goto LABEL_16;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[CNContactContentUnitaryViewController environment](self, "environment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "runningInContactsAppOniPad"))
    {
LABEL_17:

      goto LABEL_18;
    }
    -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15 == v21)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFont:", v13);
LABEL_16:

      goto LABEL_17;
    }
  }
LABEL_18:

}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  -[CNContactContentUnitaryViewController environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "runningInContactsAppOniPad");

  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    -[CNContactContentUnitaryViewController _itemAtIndexPath:forTableView:](self, "_itemAtIndexPath:forTableView:", v7, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && -[CNContactContentUnitaryViewController allowsEditing](self, "allowsEditing"))
    {
      v12 = v11;
      objc_msgSend(v12, "group");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        CNContactsUIBundle();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("LIST_SWIPE_ACTION_REMOVE_FROM_GROUP"), &stru_1E20507A8, CFSTR("Localized"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak(&location, self);
        v17 = (void *)MEMORY[0x1E0DC36C8];
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __102__CNContactContentUnitaryViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
        v20[3] = &unk_1E204F8E8;
        objc_copyWeak(&v22, &location);
        v21 = v13;
        objc_msgSend(v17, "contextualActionWithStyle:title:handler:", 1, v16, v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v18);
        objc_msgSend(MEMORY[0x1E0DC3D08], "configurationWithActions:", v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (void)removeContactFromGroup:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__CNContactContentUnitaryViewController_removeContactFromGroup___block_invoke;
  v6[3] = &unk_1E204F910;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[CNContactContentUnitaryViewController authorizeEditContactWithTargetGroup:completion:](self, "authorizeEditContactWithTargetGroup:completion:", v5, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)authorizedRemoveContactFromGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD aBlock[5];

  v4 = a3;
  if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
  {
    -[CNContactContentUnitaryViewController groupEditingContext](self, "groupEditingContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeGroup:", v4);

    -[CNContactContentUnitaryViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 1);
  }
  else
  {
    -[CNContactContentUnitaryViewController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeContact:fromGroup:ignoresGuardianRestrictions:", v7, v4, 1);

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__CNContactContentUnitaryViewController_authorizedRemoveContactFromGroup___block_invoke;
    aBlock[3] = &unk_1E204F648;
    aBlock[4] = self;
    v8 = _Block_copy(aBlock);
    -[CNContactContentUnitaryViewController performWhenViewIsLaidOut:](self, "performWhenViewIsLaidOut:", v8);

  }
}

- (void)addContactToGroup:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__CNContactContentUnitaryViewController_addContactToGroup___block_invoke;
  v6[3] = &unk_1E204F910;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[CNContactContentUnitaryViewController authorizeEditContactWithTargetGroup:completion:](self, "authorizeEditContactWithTargetGroup:completion:", v5, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)authorizedAddContactToGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD aBlock[5];

  v4 = a3;
  if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
  {
    -[CNContactContentUnitaryViewController groupEditingContext](self, "groupEditingContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addGroup:", v4);

    -[CNContactContentUnitaryViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 1);
  }
  else
  {
    -[CNContactContentUnitaryViewController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "addContact:toGroup:moveWasAuthorized:", v7, v4, 1);

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__CNContactContentUnitaryViewController_authorizedAddContactToGroup___block_invoke;
    aBlock[3] = &unk_1E204F648;
    aBlock[4] = self;
    v9 = _Block_copy(aBlock);
    -[CNContactContentUnitaryViewController performWhenViewIsLaidOut:](self, "performWhenViewIsLaidOut:", v9);

  }
}

- (void)authorizeEditContactWithTargetGroup:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);
  id v15;
  id location;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6)
  {
    if (-[CNContactContentUnitaryViewController saveWasAuthorized](self, "saveWasAuthorized"))
      goto LABEL_4;
    -[CNContactContentUnitaryViewController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isAuthorizedToEditContact:withTargetGroupWithIdentifier:ignoresParentalRestrictions:", v9, v10, -[CNContactContentUnitaryViewController saveWasAuthorized](self, "saveWasAuthorized"));

    if ((v11 & 1) != 0)
    {
LABEL_4:
      v7[2](v7);
    }
    else
    {
      objc_initWeak(&location, self);
      -[CNContactContentUnitaryViewController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __88__CNContactContentUnitaryViewController_authorizeEditContactWithTargetGroup_completion___block_invoke;
      v13[3] = &unk_1E204F938;
      objc_copyWeak(&v15, &location);
      v14 = v7;
      objc_msgSend(v12, "authorizeForViewController:sender:animated:completionBlock:", self, self, 1, v13);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }

}

- (id)groupContext
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  CNUIGroupContext *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CNUIGroupContext *v15;
  void *v16;
  void *v17;

  -[CNContactContentUnitaryViewController groupEditingContext](self, "groupEditingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_4;
  v4 = *MEMORY[0x1E0D137F8];
  -[CNContactContentUnitaryViewController groupEditingContext](self, "groupEditingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addedGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v6) & 1) == 0)
  {

    goto LABEL_6;
  }
  -[CNContactContentUnitaryViewController groupEditingContext](self, "groupEditingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removedGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v8);

  if ((v9 & 1) == 0)
  {
LABEL_6:
    -[CNContactContentUnitaryViewController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController groupEditingContext](self, "groupEditingContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addedGroups");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "groupsByContainerDictForContainers:groups:", 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = [CNUIGroupContext alloc];
    -[CNContactContentUnitaryViewController groupEditingContext](self, "groupEditingContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removedGroups");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CNUIGroupContext initWithAddedGroupsByContainerDict:removedGroups:](v15, "initWithAddedGroupsByContainerDict:removedGroups:", v14, v17);

    return v10;
  }
LABEL_4:
  v10 = 0;
  return v10;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[CNContactContentUnitaryViewController _cellIdentifierForTableView:indexPath:](self, "_cellIdentifierForTableView:indexPath:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend((id)objc_opt_class(), "classForCellIdentifier:", v5);

  LOBYTE(v6) = objc_msgSend(v7, "shouldIndentWhileEditing");
  return (char)v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (!-[CNContactContentUnitaryViewController isPersonHeaderIndexPath:forTableView:](self, "isPersonHeaderIndexPath:forTableView:", v7, v6)&& !-[CNContactContentUnitaryViewController isSharedProfileBannerSectionIndexPath:forTableView:](self, "isSharedProfileBannerSectionIndexPath:forTableView:", v7, v6))
  {
    -[CNContactContentUnitaryViewController _itemAtIndexPath:forTableView:](self, "_itemAtIndexPath:forTableView:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v9;
        if ((objc_msgSend(v10, "isReadonly") & 1) != 0
          || !objc_msgSend(v10, "canRemove")
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v8 = 0;
        }
        else
        {
          objc_opt_class();
          v8 = (objc_opt_isKindOfClass() & 1) == 0;
        }

        goto LABEL_16;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v8 = 1;
              goto LABEL_16;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    v8 = objc_opt_isKindOfClass() & 1;
                    goto LABEL_16;
                  }
                }
              }
            }
          }
        }
      }
      v8 = 2;
    }
    else
    {
      v8 = 0;
    }
LABEL_16:

    goto LABEL_17;
  }
  v8 = 0;
LABEL_17:

  return v8;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  if (-[CNContactContentUnitaryViewController isPersonHeaderIndexPath:forTableView:](self, "isPersonHeaderIndexPath:forTableView:", v7, v6)|| -[CNContactContentUnitaryViewController isSharedProfileBannerSectionIndexPath:forTableView:](self, "isSharedProfileBannerSectionIndexPath:forTableView:", v7, v6))
  {
    v8 = 0;
  }
  else
  {
    -[CNContactContentUnitaryViewController _itemAtIndexPath:forTableView:](self, "_itemAtIndexPath:forTableView:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CNContactContentUnitaryViewController isEditing](self, "isEditing");
    v8 = 0;
    if ((v10 & 1) == 0 && v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        v8 = objc_opt_isKindOfClass() ^ 1;
      }
      else
      {
        v8 = 0;
      }
    }

  }
  return v8 & 1;
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  id v9;
  id v10;
  BOOL v11;

  v9 = a3;
  v10 = a5;
  v11 = !-[CNContactContentUnitaryViewController isPersonHeaderIndexPath:forTableView:](self, "isPersonHeaderIndexPath:forTableView:", v10, v9)&& !-[CNContactContentUnitaryViewController isSharedProfileBannerSectionIndexPath:forTableView:](self, "isSharedProfileBannerSectionIndexPath:forTableView:", v10, v9)&& (objc_msgSend(v9, "isEditing") & 1) == 0&& !-[CNContactContentUnitaryViewController _indexPathIsActionItem:forTableView:](self, "_indexPathIsActionItem:forTableView:", v10, v9)&& sel_copy_ == a4;

  return v11;
}

- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  id v7;

  if (sel_copy_ == a4)
  {
    objc_msgSend(a3, "cellForRowAtIndexPath:", a5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, a4);

  }
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  char isKindOfClass;

  v6 = a3;
  v7 = a4;
  if (-[CNContactContentUnitaryViewController isPersonHeaderIndexPath:forTableView:](self, "isPersonHeaderIndexPath:forTableView:", v7, v6)|| -[CNContactContentUnitaryViewController isSharedProfileBannerSectionIndexPath:forTableView:](self, "isSharedProfileBannerSectionIndexPath:forTableView:", v7, v6))
  {
    v8 = 0;
  }
  else
  {
    -[CNContactContentUnitaryViewController _itemAtIndexPath:forTableView:](self, "_itemAtIndexPath:forTableView:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      CNContactsUIBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("UNLINK");
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      CNContactsUIBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if ((isKindOfClass & 1) != 0)
        v12 = CFSTR("LIST_SWIPE_ACTION_REMOVE_FROM_GROUP");
      else
        v12 = CFSTR("DELETE");
    }
    objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1E20507A8, CFSTR("Localized"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (!-[CNContactContentUnitaryViewController isPersonHeaderIndexPath:forTableView:](self, "isPersonHeaderIndexPath:forTableView:", v6, v8)&& !-[CNContactContentUnitaryViewController isSharedProfileBannerSectionIndexPath:forTableView:](self, "isSharedProfileBannerSectionIndexPath:forTableView:", v6, v8))
  {
    objc_msgSend(v8, "cellForRowAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v7, "shouldPerformAccessoryAction"))
      objc_msgSend(v7, "performAccessoryAction");

  }
}

- (void)sender:(id)a3 presentViewController:(id)a4 modalPresentationStyle:(int64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  CGRect v47;

  v8 = a3;
  v9 = a4;
  -[CNContactContentUnitaryViewController splitViewController](self, "splitViewController");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[CNContactContentUnitaryViewController splitViewController](self, "splitViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstResponder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CNContactContentUnitaryViewController splitViewController](self, "splitViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "endEditing:", 1);

    }
  }
  objc_msgSend(v9, "setModalPresentationStyle:", a5);
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setModalTransitionStyle:", objc_msgSend(v17, "modalTransitionStyle"));

  objc_opt_class();
  v46 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v46;
  else
    v18 = 0;
  v19 = v18;

  objc_msgSend(v9, "popoverPresentationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSourceView:", v19);

  objc_msgSend(v19, "bounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController centeredSourceRect:inContactView:](self, "centeredSourceRect:inContactView:", v29, v22, v24, v26, v28);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  objc_msgSend(v9, "popoverPresentationController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setSourceRect:", v31, v33, v35, v37);

  objc_msgSend(v9, "popoverPresentationController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setPermittedArrowDirections:", 15);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v9, "presentationController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setDelegate:", self);

  }
  objc_opt_class();
  v41 = objc_opt_isKindOfClass();
  if (!self->_disablingRotation && (v41 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "userInterfaceIdiom"))
    {
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "_referenceBounds");
    if (CGRectGetHeight(v47) <= 667.0 || objc_msgSend(v9, "modalPresentationStyle"))
    {

      goto LABEL_15;
    }
    v44 = objc_msgSend(v9, "supportedInterfaceOrientations");
    v45 = -[CNContactContentUnitaryViewController supportedInterfaceOrientations](self, "supportedInterfaceOrientations");

    if (v44 != v45)
    {
      -[CNContactContentUnitaryViewController _beginDisablingInterfaceAutorotation](self, "_beginDisablingInterfaceAutorotation");
      self->_disablingRotation = 1;
    }
  }
LABEL_16:
  -[CNContactContentUnitaryViewController setBackgroundColorIfNeededForPresentedViewController:](self, "setBackgroundColorIfNeededForPresentedViewController:", v9);
  -[CNContactContentUnitaryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void)sender:(id)a3 presentViewController:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[CNContactContentUnitaryViewController sender:presentViewController:modalPresentationStyle:](self, "sender:presentViewController:modalPresentationStyle:", v7, v6, -[CNContactContentUnitaryViewController _modalPresentationStyleForViewController:](self, "_modalPresentationStyleForViewController:", v6));

}

- (CGRect)centeredSourceRect:(CGRect)a3 inContactView:(id)a4
{
  CGFloat height;
  double width;
  CGFloat y;
  double x;
  id v9;
  void *v10;
  char v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEditing");

  if ((v11 & 1) == 0)
  {
    objc_msgSend(v9, "layoutMargins");
    v13 = v12;
    objc_msgSend(v9, "layoutMargins");
    width = width - (v13 + v14);
    objc_msgSend(v9, "layoutMargins");
    v16 = v15;
    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sectionContentInset");
    x = x + v16 - v18;

  }
  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)shouldPresentFullscreen:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[CNContactContentUnitaryViewController setIsPresentingFullscreenForOutOfProcess:](self, "setIsPresentingFullscreenForOutOfProcess:");
  -[CNContactContentUnitaryViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CNContactContentUnitaryViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "isPresentingFullscreen:", v3);

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  id v17;
  BOOL v18;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CNContactContentUnitaryViewController;
  -[CNContactContentUnitaryViewController viewWillTransitionToSize:withTransitionCoordinator:](&v22, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[CNContactContentUnitaryViewController presentedViewController](self, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "popoverPresentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourceView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11 == v12;

  }
  else
  {
    v13 = 0;
  }
  objc_initWeak(&location, self);
  v14 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __92__CNContactContentUnitaryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v19[3] = &unk_1E204F960;
  objc_copyWeak(&v20, &location);
  v16[0] = v14;
  v16[1] = 3221225472;
  v16[2] = __92__CNContactContentUnitaryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v16[3] = &unk_1E204F988;
  v18 = v13;
  v16[4] = self;
  v15 = v10;
  v17 = v15;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v19, v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)updateStaticDisplayHeaderImageVisibility
{
  CNContactHeaderStaticDisplayView *v3;
  CNContactHeaderStaticDisplayView *staticDisplayHeaderView;

  -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
  v3 = (CNContactHeaderStaticDisplayView *)objc_claimAutoreleasedReturnValue();
  staticDisplayHeaderView = self->_staticDisplayHeaderView;

  if (v3 == staticDisplayHeaderView)
    -[CNContactHeaderStaticDisplayView updateImageViewVisiblity](self->_staticDisplayHeaderView, "updateImageViewVisiblity");
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && CNUIIsDDActionsService())
    return -1;
  else
    return -2;
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  char isKindOfClass;
  id v13;

  v13 = a3;
  v8 = a5;
  if (a4 != 5)
  {
    if (-[CNContactContentUnitaryViewController isOutOfProcess](self, "isOutOfProcess"))
    {
      -[CNContactContentUnitaryViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        objc_msgSend(v13, "presentedViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          -[CNContactContentUnitaryViewController shouldPresentFullscreen:](self, "shouldPresentFullscreen:", 1);
      }
    }
  }

}

- (void)presentationControllerWillDismiss:(id)a3
{
  if (-[CNContactContentUnitaryViewController isOutOfProcess](self, "isOutOfProcess", a3))
    -[CNContactContentUnitaryViewController shouldPresentFullscreen:](self, "shouldPresentFullscreen:", 0);
}

- (void)performConfirmedCancel
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[CNContactContentUnitaryViewController cancelAsyncLookups](self, "cancelAsyncLookups");
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isUnknown"))
  {
    -[CNContactContentUnitaryViewController shadowCopyOfReadonlyContact](self, "shadowCopyOfReadonlyContact");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
    {

      goto LABEL_8;
    }
    v5 = (void *)v4;
    v6 = -[CNContactContentViewController alwaysEditing](self, "alwaysEditing");

    if (v6)
      goto LABEL_8;
    goto LABEL_6;
  }
  v7 = -[CNContactContentViewController alwaysEditing](self, "alwaysEditing");

  if (!v7)
LABEL_6:
    -[CNContactContentUnitaryViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
LABEL_8:
  -[CNContactContentUnitaryViewController _didCompleteWithContact:](self, "_didCompleteWithContact:", 0);
  if (-[CNContactContentUnitaryViewController mode](self, "mode") == 3)
  {
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[CNContactContentUnitaryViewController cleanupRecentMetadata](self, "cleanupRecentMetadata");
  }
  -[CNContactContentUnitaryViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endEditing:", 1);

  -[CNContactContentUnitaryViewController setEditingLinkedContacts:](self, "setEditingLinkedContacts:", 0);
  -[CNContactContentUnitaryViewController cardStaticIdentityGroup](self, "cardStaticIdentityGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clearDisplay");

  -[CNContactContentUnitaryViewController setGroupEditingContext:](self, "setGroupEditingContext:", 0);
  -[CNContactContentUnitaryViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 0);
  -[CNContactContentUnitaryViewController editingContactView](self, "editingContactView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reloadData");

  if (-[CNContactContentUnitaryViewController supportsDrafts](self, "supportsDrafts"))
    +[CNUIDraftSupport deleteDrafts](CNUIDraftSupport, "deleteDrafts");
}

- (int64_t)_modalPresentationStyleForViewController:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  int v32;

  v4 = a3;
  if (NSClassFromString(CFSTR("QLPreviewController")) && (objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !objc_msgSend(v4, "modalPresentationStyle"))
  {
    v5 = 0;
    goto LABEL_56;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v4, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
LABEL_9:
      v5 = 7;
      goto LABEL_56;
    }
    getSLComposeViewControllerClass_60521();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = 5;
      goto LABEL_56;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "viewControllers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v10 = objc_opt_isKindOfClass();

      if ((v10 & 1) != 0)
      {
        +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "shouldPresentInCurrentContext"))
          v5 = 6;
        else
          v5 = -2;
LABEL_55:

        goto LABEL_56;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "viewControllers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v14 = objc_opt_isKindOfClass();

      if ((v14 & 1) != 0)
      {
        +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "shouldPresentInCurrentContext") & 1) != 0)
        {
          v5 = 3;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "userInterfaceIdiom");

          if ((v21 & 0xFFFFFFFFFFFFFFFBLL) == 1)
            v5 = 2;
          else
            v5 = -2;
        }
        goto LABEL_55;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "viewControllers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = 1;
      }
      else
      {
        objc_opt_class();
        v16 = objc_opt_isKindOfClass();
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v17 = 1;
LABEL_28:
        if (-[UIViewController ab_isInPopover](self, "ab_isInPopover")
          || CNUIIsFaceTime()
          && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              v19 = objc_msgSend(v18, "userInterfaceIdiom"),
              v18,
              (v19 & 0xFFFFFFFFFFFFFFFBLL) == 1))
        {
          v5 = 2;
        }
        else
        {
          if (-[CNContactContentUnitaryViewController isOutOfProcess](self, "isOutOfProcess")
            || CNUIIsDDActionsService())
          {
            objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "userInterfaceIdiom");

            if ((v23 & 0xFFFFFFFFFFFFFFFBLL) == 1)
              goto LABEL_50;
          }
          if ((v17 & 1) != 0
            && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
                v24 = (void *)objc_claimAutoreleasedReturnValue(),
                v25 = objc_msgSend(v24, "userInterfaceIdiom"),
                v24,
                (v25 & 0xFFFFFFFFFFFFFFFBLL) != 1))
          {
LABEL_50:
            v5 = 0;
          }
          else
          {
            +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v26, "shouldPresentInCurrentContext") & 1) != 0)
            {
              v5 = 3;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "userInterfaceIdiom");

              if ((v30 & 0xFFFFFFFFFFFFFFFBLL) == 1)
                v5 = 2;
              else
                v5 = -2;
            }

          }
        }
        goto LABEL_55;
      }
      objc_opt_class();
      v27 = objc_opt_isKindOfClass();
      v17 = v27;
      if (((v16 | v27) & 1) != 0)
        goto LABEL_28;

    }
    if (!-[UIViewController ab_isInPopover](self, "ab_isInPopover")
      && !-[UIViewController ab_isInSheet](self, "ab_isInSheet"))
    {
      +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v28, "shouldPresentInCurrentContext") & 1) != 0 || CNUIIsDDActionsService())
      {

      }
      else
      {
        v32 = _CFMZEnabled();

        if (!v32)
          goto LABEL_9;
      }
    }
    v5 = 3;
    goto LABEL_56;
  }
  v5 = objc_msgSend(v4, "modalPresentationStyle");
LABEL_56:

  return v5;
}

- (void)setBackgroundColorIfNeededForPresentedViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    v10 = v9 ^ 1;
  }
  else
  {
    v10 = 1;
  }

  -[CNContactContentUnitaryViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqual:", v14);

  if ((v10 & 1) == 0 && (v15 & 1) == 0)
  {
    -[CNContactContentUnitaryViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "backgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v18);

  }
}

- (void)sender:(id)a3 dismissViewController:(id)a4
{
  -[CNContactContentUnitaryViewController sender:dismissViewController:completionHandler:](self, "sender:dismissViewController:completionHandler:", a3, a4, 0);
}

- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v7 = a4;
  v8 = a5;
  if (-[CNContactContentUnitaryViewController isOutOfProcess](self, "isOutOfProcess"))
  {
    -[CNContactContentUnitaryViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
      -[CNContactContentUnitaryViewController shouldPresentFullscreen:](self, "shouldPresentFullscreen:", 0);
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__CNContactContentUnitaryViewController_sender_dismissViewController_completionHandler___block_invoke;
  v12[3] = &unk_1E204F9B0;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v12);

}

- (BOOL)isPresentingModalViewController
{
  void *v2;
  BOOL v3;

  -[CNContactContentUnitaryViewController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)viewController:(id)a3 presentationControllerWillDismiss:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[CNContactContentUnitaryViewController presentedViewController](self, "presentedViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
    -[CNContactContentUnitaryViewController presentationControllerWillDismiss:](self, "presentationControllerWillDismiss:", v8);

}

- (BOOL)contactInlineActionsViewController:(id)a3 shouldPerformActionOfType:(id)a4 withContactProperty:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a5;
  objc_msgSend(v6, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[CNContactContentUnitaryViewController contactViewController:shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:](self, "contactViewController:shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:", self, v7, v8, v9);
  return (char)self;
}

- (void)contactInlineActionsViewControllerWillPresentDisambiguationUI:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNContactContentUnitaryViewController contactDelegate](self, "contactDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNContactContentUnitaryViewController contactDelegate](self, "contactDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactViewControllerWillPresentDisambiguationUI:", self);

  }
}

- (void)contactInlineActionsViewControllerDidDismissDisambiguationUI:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNContactContentUnitaryViewController contactDelegate](self, "contactDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNContactContentUnitaryViewController contactDelegate](self, "contactDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactViewControllerDidDismissDisambiguationUI:", self);

  }
}

- (void)action:(id)a3 prepareChildContactViewController:(id)a4 sender:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[CNContactContentUnitaryViewController createNewContactAction](self, "createNewContactAction");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v10 = &unk_1E20D3958;
  if (v9 == v7)
  {
    objc_msgSend(&unk_1E20D3958, "arrayByExcludingObjectsInArray:", &unk_1E20D3970);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[CNContactContentUnitaryViewController valueForKey:](self, "valueForKey:", v16, (_QWORD)v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v8, "setValue:forKey:", v17, v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v13);
  }

  if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
    objc_msgSend(v8, "setAllowsSettingLinkedContactsAsPreferred:", 0);
  objc_msgSend(v8, "setAllowsAddToFavorites:", 0, (_QWORD)v27);
  objc_msgSend(v8, "setAllowsAddingToAddressBook:", 0);
  objc_msgSend(v8, "setShouldShowLinkedContacts:", 0);
  -[CNContactContentViewController parentGroup](self, "parentGroup");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setParentGroup:", v18);

  -[CNContactContentUnitaryViewController linkedCardsAction](self, "linkedCardsAction");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v7;
  if ((id)v19 == v7)
    goto LABEL_17;
  v21 = (void *)v19;
  -[CNContactContentUnitaryViewController addToGroupAction](self, "addToGroupAction");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  if (v22 != v7)
  {
    -[CNContactContentViewController parentContainer](self, "parentContainer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setParentContainer:", v20);
LABEL_17:

  }
  -[CNContactContentUnitaryViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProhibitedPropertyKeys:", v23);

  objc_msgSend(v8, "contactView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController environment](self, "environment");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAttributesFromContactView:runningInContactsAppOniPad:", v25, objc_msgSend(v26, "runningInContactsAppOniPad"));

}

- (id)action:(id)a3 cellForPropertyItem:(id)a4 sender:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "property");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactView cellIdentifierForProperty:](CNContactView, "cellIdentifierForProperty:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = +[CNContactView classForCellIdentifier:](CNContactView, "classForCellIdentifier:", v8);
  v10 = v9;
  if (v9)
  {
    v11 = [v9 alloc];
    NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_msgSend(v11, "initWithStyle:reuseIdentifier:", 0, v12);

    -[objc_class setIgnoreSuggested:](v10, "setIgnoreSuggested:", 1);
    -[objc_class setCardGroupItem:](v10, "setCardGroupItem:", v6);
    -[objc_class setDelegate:](v10, "setDelegate:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[objc_class setAllowsActions:](v10, "setAllowsActions:", -[CNContactContentUnitaryViewController allowsActions](self, "allowsActions"));
    v15[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController _updateAvailableTransportsForItems:](self, "_updateAvailableTransportsForItems:", v13);

    -[CNContactContentUnitaryViewController prepareCell:](self, "prepareCell:", v10);
  }

  return v10;
}

- (void)action:(id)a3 presentViewController:(id)a4 sender:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v8 = a5;
  v9 = a4;
  -[CNContactContentUnitaryViewController createNewContactAction](self, "createNewContactAction");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v21;
  if (v10 != v21)
  {
    -[CNContactContentUnitaryViewController addToExistingContactAction](self, "addToExistingContactAction");
    v12 = objc_claimAutoreleasedReturnValue();
    if ((id)v12 != v21)
    {
      v13 = (void *)v12;
      -[CNContactContentUnitaryViewController updateExistingContactAction](self, "updateExistingContactAction");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14 != v21)
        goto LABEL_10;
      goto LABEL_7;
    }

    v11 = v10;
  }

LABEL_7:
  -[CNContactContentUnitaryViewController delegate](self, "delegate");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[CNContactContentUnitaryViewController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      -[CNContactContentUnitaryViewController delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "isPresentingEditingController:", 1);

    }
  }
LABEL_10:
  -[CNContactContentUnitaryViewController presentingDelegate](self, "presentingDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sender:presentViewController:", v8, v9);

}

- (void)action:(id)a3 presentViewController:(id)a4 modalPresentationStyle:(int64_t)a5 sender:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v10 = a6;
  v11 = a4;
  -[CNContactContentUnitaryViewController createNewContactAction](self, "createNewContactAction");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v23;
  if (v12 != v23)
  {
    -[CNContactContentUnitaryViewController addToExistingContactAction](self, "addToExistingContactAction");
    v14 = objc_claimAutoreleasedReturnValue();
    if ((id)v14 != v23)
    {
      v15 = (void *)v14;
      -[CNContactContentUnitaryViewController updateExistingContactAction](self, "updateExistingContactAction");
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if (v16 != v23)
        goto LABEL_10;
      goto LABEL_7;
    }

    v13 = v12;
  }

LABEL_7:
  -[CNContactContentUnitaryViewController delegate](self, "delegate");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[CNContactContentUnitaryViewController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      -[CNContactContentUnitaryViewController delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "isPresentingEditingController:", 1);

    }
  }
LABEL_10:
  -[CNContactContentUnitaryViewController presentingDelegate](self, "presentingDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sender:presentViewController:modalPresentationStyle:", v10, v11, a5);

}

- (void)action:(id)a3 dismissViewController:(id)a4 sender:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v8 = a5;
  v9 = a4;
  -[CNContactContentUnitaryViewController createNewContactAction](self, "createNewContactAction");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v21;
  if (v10 != v21)
  {
    -[CNContactContentUnitaryViewController addToExistingContactAction](self, "addToExistingContactAction");
    v12 = objc_claimAutoreleasedReturnValue();
    if ((id)v12 != v21)
    {
      v13 = (void *)v12;
      -[CNContactContentUnitaryViewController updateExistingContactAction](self, "updateExistingContactAction");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14 != v21)
        goto LABEL_10;
      goto LABEL_7;
    }

    v11 = v10;
  }

LABEL_7:
  -[CNContactContentUnitaryViewController delegate](self, "delegate");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[CNContactContentUnitaryViewController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      -[CNContactContentUnitaryViewController delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "isPresentingEditingController:", 0);

    }
  }
LABEL_10:
  -[CNContactContentUnitaryViewController presentingDelegate](self, "presentingDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sender:dismissViewController:", v8, v9);

}

- (void)action:(id)a3 pushViewController:(id)a4 sender:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  -[CNContactContentUnitaryViewController setBackgroundColorIfNeededForPresentedViewController:](self, "setBackgroundColorIfNeededForPresentedViewController:", v6);
  -[CNContactContentUnitaryViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prompt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPrompt:", v8);

  -[CNContactContentUnitaryViewController navigationController](self, "navigationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushViewController:animated:", v6, 1);

}

- (void)actionDidUpdate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNContactContentUnitaryViewController addFavoriteAction](self, "addFavoriteAction");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "target");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController addFavoriteAction](self, "addFavoriteAction");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v13)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v9)
            goto LABEL_4;
          goto LABEL_10;
        }
      }

      -[CNContactContentUnitaryViewController addFavoriteAction](self, "addFavoriteAction");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "canPerformAction");

      if ((v21 & 1) != 0)
        goto LABEL_15;
      -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "target");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeActionWithTarget:selector:", v17, objc_msgSend(v4, "selector"));
      goto LABEL_14;
    }
LABEL_10:

    -[CNContactContentUnitaryViewController addFavoriteAction](self, "addFavoriteAction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "canPerformAction");

    if (v15)
    {
      -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController addFavoriteAction](self, "addFavoriteAction");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      CNContactsUIBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("PHONE_ACTION_ADD_TO_FAVORITES"), &stru_1E20507A8, CFSTR("Localized"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addAction:withTitle:", v17, v19);

LABEL_14:
      -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController contactView](self, "contactView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController reloadCardGroup:forTableView:](self, "reloadCardGroup:forTableView:", v22, v23);

    }
  }
LABEL_15:

}

- (void)actionDidFinish:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  dispatch_time_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t);
  void *v69;
  id v70;
  id v71;

  v4 = a3;
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForSelectedRow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v7, 1);

  -[CNContactContentUnitaryViewController deleteContactAction](self, "deleteContactAction");
  v8 = objc_claimAutoreleasedReturnValue();
  if ((id)v8 == v4)
  {

    goto LABEL_13;
  }
  v9 = (void *)v8;
  -[CNContactContentUnitaryViewController ignoreContactAction](self, "ignoreContactAction");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v4)
  {
LABEL_13:
    -[CNContactContentUnitaryViewController contactDelegate](self, "contactDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      -[CNContactContentUnitaryViewController contactDelegate](self, "contactDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController contact](self, "contact");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "contactViewController:didDeleteContact:", self, v22);

    }
    -[CNContactContentUnitaryViewController delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) == 0)
      goto LABEL_18;
    -[CNContactContentUnitaryViewController delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "didDeleteContact:", v26);
    goto LABEL_17;
  }
  -[CNContactContentUnitaryViewController addFavoriteAction](self, "addFavoriteAction");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v4)
  {
    -[CNContactContentUnitaryViewController addFavoriteAction](self, "addFavoriteAction");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "canPerformAction");

    if ((v30 & 1) == 0)
    {
      -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      CNContactsUIBundle();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("PHONE_ACTION_ADD_TO_FAVORITES"), &stru_1E20507A8, CFSTR("Localized"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "removeActionWithTitle:", v33);

    }
    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController reloadCardGroupsForFavoritesUpdateInTableView:](self, "reloadCardGroupsForFavoritesUpdateInTableView:", v27);
    goto LABEL_27;
  }
  -[CNContactContentUnitaryViewController createNewContactAction](self, "createNewContactAction");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v4)
  {
    -[CNContactContentUnitaryViewController createNewContactAction](self, "createNewContactAction");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "createdContact");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController createdNewContact:](self, "createdNewContact:", v34);
    goto LABEL_26;
  }
  -[CNContactContentUnitaryViewController addToExistingContactAction](self, "addToExistingContactAction");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v4)
  {
    -[CNContactContentUnitaryViewController addToExistingContactAction](self, "addToExistingContactAction");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "chosenContact");
    v35 = objc_claimAutoreleasedReturnValue();
LABEL_25:
    v34 = (void *)v35;
    -[CNContactContentUnitaryViewController updatedExistingContact:](self, "updatedExistingContact:", v35);
    goto LABEL_26;
  }
  -[CNContactContentUnitaryViewController updateExistingContactAction](self, "updateExistingContactAction");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 == v4)
  {
    -[CNContactContentUnitaryViewController updateExistingContactAction](self, "updateExistingContactAction");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "existingContact");
    v35 = objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  -[CNContactContentUnitaryViewController addLinkedCardAction](self, "addLinkedCardAction");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 == v4)
  {
    -[CNContactContentUnitaryViewController addLinkedCardAction](self, "addLinkedCardAction");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "chosenContact");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController addLinkedContact:](self, "addLinkedContact:", v34);
    goto LABEL_26;
  }
  -[CNContactContentUnitaryViewController addToGroupAction](self, "addToGroupAction");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 == v4)
  {
    -[CNContactContentUnitaryViewController addToGroupAction](self, "addToGroupAction");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "selectedGroup");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController addContactToGroup:](self, "addContactToGroup:", v34);
    goto LABEL_26;
  }
  -[CNContactContentUnitaryViewController actionProvider](self, "actionProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addStaticIdentityAction");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18 == v4)
  {
    -[CNContactContentUnitaryViewController actionProvider](self, "actionProvider");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addStaticIdentityAction");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "chosenIdentity");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController addStaticIdentity:](self, "addStaticIdentity:", v36);
LABEL_32:

    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactContentUnitaryViewController reloadUnifiedContact](self, "reloadUnifiedContact");
    goto LABEL_28;
  }
  -[CNContactContentUnitaryViewController blockAction](self, "blockAction");
  v37 = (id)objc_claimAutoreleasedReturnValue();

  if (v37 == v4)
  {
    -[CNContactContentUnitaryViewController setShouldIgnoreBlockListChange:](self, "setShouldIgnoreBlockListChange:", 1);
    -[CNContactContentUnitaryViewController _setupContactBlockingActionPreservingChanges:withUpdate:](self, "_setupContactBlockingActionPreservingChanges:withUpdate:", 1, 1);
    goto LABEL_28;
  }
  -[CNContactContentUnitaryViewController blockReportAction](self, "blockReportAction");
  v38 = (id)objc_claimAutoreleasedReturnValue();

  if (v38 == v4)
  {
    -[CNContactContentUnitaryViewController setShouldIgnoreBlockListChange:](self, "setShouldIgnoreBlockListChange:", 1);
    -[CNContactContentUnitaryViewController _setupContactBlockingReportingActionPreservingChanges:withUpdate:](self, "_setupContactBlockingReportingActionPreservingChanges:withUpdate:", 1, 1);
    goto LABEL_28;
  }
  -[CNContactContentUnitaryViewController actionProvider](self, "actionProvider");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "shareWithFamilyAction");
  v40 = (id)objc_claimAutoreleasedReturnValue();

  if (v40 == v4)
  {
    -[CNContactContentUnitaryViewController updateContact:](self, "updateContact:", v4);
    goto LABEL_28;
  }
  -[CNContactContentUnitaryViewController actionProvider](self, "actionProvider");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "stopSharingWithFamilyAction");
  v42 = (id)objc_claimAutoreleasedReturnValue();

  if (v42 == v4)
  {
    -[CNContactContentUnitaryViewController cardActionsGroup](self, "cardActionsGroup");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController stopSharingWithFamilyAction](self, "stopSharingWithFamilyAction");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "title");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "removeActionWithTitle:", v53);

    -[CNContactContentUnitaryViewController setStopSharingWithFamilyAction:](self, "setStopSharingWithFamilyAction:", 0);
    -[CNContactContentUnitaryViewController delegate](self, "delegate");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "didExecuteDeleteFromDowntimeWhitelistAction");

    if (!-[CNContactContentViewController ignoresParentalRestrictions](self, "ignoresParentalRestrictions")
      && -[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
    {
      -[CNContactContentUnitaryViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
      -[CNContactContentUnitaryViewController saveChanges](self, "saveChanges");
    }
    goto LABEL_28;
  }
  -[CNContactContentUnitaryViewController suggestedContactAction](self, "suggestedContactAction");
  v43 = (id)objc_claimAutoreleasedReturnValue();

  if (v43 == v4)
  {
    -[CNContactContentUnitaryViewController contactDelegate](self, "contactDelegate");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_opt_respondsToSelector();

    if ((v56 & 1) != 0)
    {
      -[CNContactContentUnitaryViewController contactDelegate](self, "contactDelegate");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController suggestedContactAction](self, "suggestedContactAction");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "contact");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "contactViewController:didDeleteContact:", self, v59);

    }
    -[CNContactContentUnitaryViewController delegate](self, "delegate");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v60)
      goto LABEL_18;
    -[CNContactContentUnitaryViewController delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController suggestedContactAction](self, "suggestedContactAction");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "contact");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "didDeleteContact:", v61);

LABEL_17:
LABEL_18:
    -[CNContactContentUnitaryViewController navigationController](self, "navigationController");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v28 = (id)objc_msgSend(v27, "popViewControllerAnimated:", 1);
LABEL_27:

    goto LABEL_28;
  }
  -[CNContactContentUnitaryViewController clearRecentsDataAction](self, "clearRecentsDataAction");
  v44 = (id)objc_claimAutoreleasedReturnValue();

  if (v44 == v4)
  {
    -[CNContactContentUnitaryViewController delegate](self, "delegate");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "didExecuteClearRecentsDataAction");
    goto LABEL_27;
  }
  -[CNContactContentUnitaryViewController stopSharingWithFamilyAction](self, "stopSharingWithFamilyAction");
  v45 = (id)objc_claimAutoreleasedReturnValue();

  if (v45 == v4)
  {
    -[CNContactContentUnitaryViewController delegate](self, "delegate");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "didExecuteDeleteFromDowntimeWhitelistAction");
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = v4;
    objc_msgSend(v27, "propertyItem");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "group");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = objc_msgSend(v27, "selectedChoice");
    if (v47 == 2)
    {
      objc_msgSend(v27, "reject");
      objc_msgSend(v34, "reloadDataPreservingChanges:", 0);
      goto LABEL_26;
    }
    if (v47 == 1)
    {
      objc_msgSend(v27, "propertyItem");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController indexPathOfDisplayedPropertyItem:](self, "indexPathOfDisplayedPropertyItem:", v48);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNContactContentUnitaryViewController contactView](self, "contactView");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "selectRowAtIndexPath:animated:scrollPosition:", v36, 0, 0);

      v50 = dispatch_time(0, 500000000);
      v66 = MEMORY[0x1E0C809B0];
      v67 = 3221225472;
      v68 = __57__CNContactContentUnitaryViewController_actionDidFinish___block_invoke;
      v69 = &unk_1E2050400;
      v70 = v27;
      v71 = v34;
      dispatch_after(v50, MEMORY[0x1E0C80D38], &v66);

      goto LABEL_32;
    }
LABEL_26:

    goto LABEL_27;
  }
  -[CNContactContentUnitaryViewController selectContainersAction](self, "selectContainersAction");
  v62 = (id)objc_claimAutoreleasedReturnValue();

  if (v62 == v4)
  {
    -[CNContactContentUnitaryViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 1);
    goto LABEL_28;
  }
  -[CNContactContentUnitaryViewController addAddressingGrammarAction](self, "addAddressingGrammarAction");
  v63 = (id)objc_claimAutoreleasedReturnValue();

  if (v63 == v4)
  {
    -[CNContactContentUnitaryViewController addAddressingGrammarAction](self, "addAddressingGrammarAction");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController completeAddAddressingGrammarAction:](self, "completeAddAddressingGrammarAction:", v27);
    goto LABEL_27;
  }
  -[CNContactContentUnitaryViewController gameCenterAddFriendAction](self, "gameCenterAddFriendAction");
  v64 = (id)objc_claimAutoreleasedReturnValue();

  if (v64 == v4)
  {
    -[CNContactContentUnitaryViewController gameCenterManager](self, "gameCenterManager");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setHasSentInvite:", 1);

    -[CNContactContentUnitaryViewController _reloadGameCenterGroup](self, "_reloadGameCenterGroup");
  }
LABEL_28:
  -[CNContactContentUnitaryViewController updateEditNavigationItemsAnimated:](self, "updateEditNavigationItemsAnimated:", 1, v66, v67, v68, v69);

}

- (void)actionDidFinishFromSecondaryAction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CNContactContentUnitaryViewController blockReportAction](self, "blockReportAction");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[CNContactContentUnitaryViewController setShouldIgnoreBlockListChange:](self, "setShouldIgnoreBlockListChange:", 1);
    -[CNContactContentUnitaryViewController _setupContactBlockingReportingActionPreservingChanges:withUpdate:](self, "_setupContactBlockingReportingActionPreservingChanges:withUpdate:", 1, 1);
    -[CNContactContentUnitaryViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didTapBlockAndReportForContact:", v7);

  }
  -[CNContactContentUnitaryViewController updateEditNavigationItemsAnimated:](self, "updateEditNavigationItemsAnimated:", 1);
}

- (void)completeAddAddressingGrammarAction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  void *v41;
  CNContactContentUnitaryViewController *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "selectedAddressingGrammar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F0] + 16))() & 1) == 0)
  {
    objc_opt_class();
    v6 = *MEMORY[0x1E0C96668];
    -[CNContactContentUnitaryViewController cardGroupForProperty:](self, "cardGroupForProperty:", *MEMORY[0x1E0C96668]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (v9)
    {
      objc_msgSend(v4, "indexPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController editingGroups](self, "editingGroups");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsObject:", v9);

      if ((v12 & 1) == 0)
      {
        v40 = v12;
        v41 = v10;
        v43 = v5;
        +[CNContactView allCardProperties](CNContactView, "allCardProperties");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "indexOfObject:", v6);

        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = self;
        -[CNContactContentUnitaryViewController editingGroups](self, "editingGroups");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v45;
          v19 = 0;
          while (2)
          {
            v20 = 0;
            v39 = v19;
            v38 = v19 + v17;
            do
            {
              if (*(_QWORD *)v45 != v18)
                objc_enumerationMutation(v15);
              v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v20);
              +[CNContactView allCardProperties](CNContactView, "allCardProperties", v38);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "property");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v22, "indexOfObject:", v23);

              if (v24 != 0x7FFFFFFFFFFFFFFFLL && v24 >= v14)
              {
                v26 = v39 + v20;
                goto LABEL_21;
              }
              ++v20;
            }
            while (v17 != v20);
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
            v26 = v38;
            v19 = v38;
            if (v17)
              continue;
            break;
          }
        }
        else
        {
          v26 = 0;
        }
LABEL_21:

        self = v42;
        -[CNContactContentUnitaryViewController editingGroups](v42, "editingGroups");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v27, "mutableCopy");

        objc_msgSend(v28, "insertObject:atIndex:", v9, v26);
        v29 = (void *)objc_msgSend(v28, "copy");
        -[CNContactContentUnitaryViewController setEditingGroups:](v42, "setEditingGroups:", v29);

        -[CNContactContentUnitaryViewController contactView](v42, "contactView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "reloadData");

        -[CNContactContentUnitaryViewController contactView](v42, "contactView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = -[CNContactContentUnitaryViewController sectionOfGroup:inTableView:](v42, "sectionOfGroup:inTableView:", v9, v31);

        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v32);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v43;
        v12 = v40;
      }
      if (v10)
      {
        -[CNContactContentUnitaryViewController addAddressingGrammarAction](self, "addAddressingGrammarAction");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "selectedAddressingGrammar");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v9, "newEditingItemWithValue:", v34);

        if (v35)
        {
          -[CNContactContentUnitaryViewController contactView](self, "contactView");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactContentUnitaryViewController addEditingItem:atIndexPath:forTableView:shouldSetFocus:](self, "addEditingItem:atIndexPath:forTableView:shouldSetFocus:", v35, v10, v36, 0);

          if ((v12 & 1) == 0)
          {
            -[CNContactContentUnitaryViewController contactView](self, "contactView");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "scrollToRowAtIndexPath:atScrollPosition:animated:", v10, 2, 1);

          }
        }

      }
    }

  }
}

- (void)actionWasCanceled:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CNContactContentUnitaryViewController contactView](self, "contactView", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForSelectedRow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v5, 1);

}

- (void)propertyCell:(id)a3 didUpdateItem:(id)a4 withNewLabel:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "updateLabeledValueWithLabel:", a5);
  objc_msgSend(v9, "updateWithPropertyItem:", v8);

  objc_msgSend(v8, "group");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController _updateLabelWidthForCellsInGroup:forTableView:reset:](self, "_updateLabelWidthForCellsInGroup:forTableView:reset:", v10, v11, 1);

  -[CNContactContentUnitaryViewController updateDoneButton](self, "updateDoneButton");
}

- (void)propertyCell:(id)a3 didUpdateItem:(id)a4 withNewValue:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v8 = a4;
  objc_msgSend(v8, "updateLabeledValueWithValue:", a5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v21, "updateWithPropertyItem:", v8);
  objc_msgSend(v8, "group");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController _updateLabelWidthForCellsInGroup:forTableView:reset:](self, "_updateLabelWidthForCellsInGroup:forTableView:reset:", v9, v10, 1);

  objc_msgSend(v8, "property");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0C96680];
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C96680]))
  {

    v13 = *MEMORY[0x1E0C96888];
  }
  else
  {
    objc_msgSend(v8, "property");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0C96888];
    v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0C96888]);

    if (!v15)
      goto LABEL_7;
  }
  -[CNContactContentUnitaryViewController propertyGroups](self, "propertyGroups");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController _validateGroup:](self, "_validateGroup:", v17);

  -[CNContactContentUnitaryViewController propertyGroups](self, "propertyGroups");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController _validateGroup:](self, "_validateGroup:", v19);

LABEL_7:
  if (-[CNContactContentUnitaryViewController isEditing](self, "isEditing"))
  {
    -[CNContactContentUnitaryViewController editingHeaderView](self, "editingHeaderView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateContactWithEditedPropertyItem:", v8);

  }
  -[CNContactContentUnitaryViewController updateDoneButton](self, "updateDoneButton");

}

- (void)propertyCell:(id)a3 performActionForItem:(id)a4 withTransportType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CNPropertySuggestionAction *v15;
  void *v16;
  CNPropertySuggestionAction *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  CNContactContentUnitaryViewController *v38;
  id v39;
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;

  v8 = a3;
  v9 = a4;
  switch(a5)
  {
    case 1:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
LABEL_6:
      -[CNContactContentUnitaryViewController faceTimeAction](self, "faceTimeAction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setType:", a5);

      -[CNContactContentUnitaryViewController faceTimeAction](self, "faceTimeAction");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      goto LABEL_6;
    case 2:
      -[CNContactContentUnitaryViewController sendMessageAction](self, "sendMessageAction");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v12 = v10;
      objc_msgSend(v10, "performActionForItem:sender:", v9, v8);
LABEL_10:

      goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactContentUnitaryViewController linkedCardsAction](self, "linkedCardsAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactContentUnitaryViewController addLinkedCardAction](self, "addLinkedCardAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
    v12 = v13;
    objc_msgSend(v13, "performActionWithSender:", v8);
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactContentUnitaryViewController addToGroupAction](self, "addToGroupAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactContentUnitaryViewController actionProvider](self, "actionProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "staticIdentityAction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "performActionForItem:sender:", v9, v8);
LABEL_21:

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactContentUnitaryViewController actionProvider](self, "actionProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addStaticIdentityAction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "performActionWithSender:", v8);
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactContentUnitaryViewController selectContainersAction](self, "selectContainersAction");
    v15 = (CNPropertySuggestionAction *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController containerContext](self, "containerContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertySuggestionAction performActionWithContainerContext:](v15, "performActionWithContainerContext:", v16);

  }
  else if (objc_msgSend(v8, "isSuggested"))
  {
    v17 = [CNPropertySuggestionAction alloc];
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CNPropertyAction initWithContact:propertyItem:](v17, "initWithContact:propertyItem:", v18, v9);

    -[CNContactAction setDelegate:](v15, "setDelegate:", self);
    -[CNPropertySuggestionAction performActionForItem:sender:](v15, "performActionForItem:sender:", v9, v8);
  }
  else
  {
    if (a5 != 7)
    {
      +[CNPropertyAction performDefaultActionForItem:sender:](CNPropertyAction, "performDefaultActionForItem:sender:", v9, v8);
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
    v15 = (CNPropertySuggestionAction *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("PHONE_ACTION_TTY_CALL"), &stru_1E20507A8, CFSTR("Localized"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __93__CNContactContentUnitaryViewController_propertyCell_performActionForItem_withTransportType___block_invoke;
    v41[3] = &unk_1E204F9D8;
    v41[4] = self;
    v22 = v9;
    v42 = v22;
    v23 = v8;
    v43 = v23;
    objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 0, v41);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertySuggestionAction addAction:](v15, "addAction:", v24);

    v25 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("PHONE_ACTION_TTY_RELAY_CALL"), &stru_1E20507A8, CFSTR("Localized"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = __93__CNContactContentUnitaryViewController_propertyCell_performActionForItem_withTransportType___block_invoke_2;
    v37 = &unk_1E204F9D8;
    v38 = self;
    v39 = v22;
    v28 = v23;
    v40 = v28;
    objc_msgSend(v25, "actionWithTitle:style:handler:", v27, 0, &v34);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertySuggestionAction addAction:](v15, "addAction:", v29, v34, v35, v36, v37, v38);

    v30 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "actionWithTitle:style:handler:", v32, 1, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertySuggestionAction addAction:](v15, "addAction:", v33);

    -[CNContactContentUnitaryViewController sender:presentViewController:](self, "sender:presentViewController:", v28, v15);
  }

LABEL_11:
}

- (void)propertyCell:(id)a3 didDeleteLabel:(id)a4 forGroup:(id)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v19;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v21 = a5;
  objc_msgSend(v21, "itemsUsingLabel:", a4);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v22)
  {
    v19 = *(_QWORD *)v28;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v6);
        objc_msgSend(v21, "nextAvailableLabel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "updateLabeledValueWithLabel:", v8);
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        -[CNContactContentUnitaryViewController contactView](self, "contactView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "visibleCells");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v24;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v24 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v14);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v15, "propertyItem");
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (v16 == v7)
                  objc_msgSend(v15, "updateWithPropertyItem:", v7);
              }
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v12);
        }

        ++v6;
      }
      while (v6 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v22);
  }
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController _updateLabelWidthForCellsInGroup:forTableView:reset:](self, "_updateLabelWidthForCellsInGroup:forTableView:reset:", v21, v17, 1);

  -[CNContactContentUnitaryViewController updateDoneButton](self, "updateDoneButton");
}

- (void)propertyItem:(id)a3 willChangeValue:(id)a4
{
  id v6;
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
  __CFString *v17;
  void *v18;
  uint64_t v19;
  id v20;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "contactProperty");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "phoneticProperty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CNContactContentUnitaryViewController nameEditingGroups](self, "nameEditingGroups");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __70__CNContactContentUnitaryViewController_propertyItem_willChangeValue___block_invoke;
    v54[3] = &unk_1E204FA00;
    v11 = v9;
    v55 = v11;
    objc_msgSend(v10, "_cn_firstObjectPassingTest:", v54);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "editingItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "labeledValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentUnitaryViewController _phoneticNameForValue:currentPhoneticName:property:](self, "_phoneticNameForValue:currentPhoneticName:property:", v7, v16, v11);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v44 = v16;
    if (!objc_msgSend(v7, "length"))
    {
      objc_msgSend(v6, "labeledValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "value");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v11;
      v21 = (void *)v19;
      v22 = v16;
      v23 = v20;
      -[CNContactContentUnitaryViewController _phoneticNameForValue:currentPhoneticName:property:](self, "_phoneticNameForValue:currentPhoneticName:property:", v19, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {

        v17 = &stru_1E20507A8;
      }

      v11 = v23;
      v16 = v44;
    }
    if (v17)
    {
      v42 = v7;
      v43 = v6;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      objc_msgSend(v12, "editingItems");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v51 != v28)
              objc_enumerationMutation(v25);
            objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "updateLabeledValueWithValue:", v17);
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
        }
        while (v27);
      }
      v45 = v11;
      v41 = v12;

      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      -[CNContactContentUnitaryViewController contactView](self, "contactView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "visibleCells");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v47;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v47 != v34)
              objc_enumerationMutation(v31);
            v36 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v36, "propertyItem");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "property");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v38, "isEqualToString:", v45);

              if (v39)
              {
                objc_msgSend(v36, "textField");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "setText:", v17);

              }
            }
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
        }
        while (v33);
      }

      v7 = v42;
      v6 = v43;
      v12 = v41;
      v16 = v44;
    }

  }
}

- (id)_phoneticNameForValue:(id)a3 currentPhoneticName:(id)a4 property:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  const __CFString *v14;
  int v15;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "cnui_stringByTransliteratingToPhoneticCharactersForProperty:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_cn_trimmedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_cn_trimmedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v10, "isEqualToString:", v11);
  v13 = objc_msgSend(v7, "length");

  if (v13)
  {
    if ((v12 & 1) != 0)
    {
      v14 = &stru_1E20507A8;
LABEL_9:

      v9 = (void *)v14;
    }
  }
  else
  {
    if (objc_msgSend(v9, "length"))
      v15 = v12;
    else
      v15 = 1;
    if (v15 == 1)
    {
      v14 = 0;
      goto LABEL_9;
    }
  }
  return v9;
}

- (id)alreadyPickedGroups
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CNContactContentUnitaryViewController editingGroups](self, "editingGroups", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v9, "property");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)contactGroupPickerDidCancel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactContentUnitaryViewController presentingDelegate](self, "presentingDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sender:dismissViewController:", self, v4);

}

- (void)contactGroupPickerDidFinish:(id)a3 withGroup:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[CNContactContentUnitaryViewController presentingDelegate](self, "presentingDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sender:dismissViewController:", self, v6);

  -[CNContactContentUnitaryViewController _addedGroupWithName:](self, "_addedGroupWithName:", v8);
}

- (void)headerView:(id)a3 didAcceptDropOfImageData:(id)a4
{
  id v5;

  v5 = a4;
  if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0)
    -[CNContactContentUnitaryViewController toggleEditing](self, "toggleEditing");
  -[CNContactHeaderEditView presentAvatarPickerWithImageData:](self->_editingHeaderView, "presentAvatarPickerWithImageData:", v5);

}

- (void)headerViewDidPickPreferredChannel:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredChannel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v14);

  if ((v6 & 1) == 0)
  {
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "setPreferredChannel:", v14);
    v9 = objc_alloc_init(MEMORY[0x1E0C973D0]);
    objc_msgSend(v9, "setIgnoresGuardianRestrictions:", -[CNContactContentUnitaryViewController saveWasAuthorized](self, "saveWasAuthorized"));
    -[CNContactContentUnitaryViewController issuedSaveRequestIdentifiers](self, "issuedSaveRequestIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "saveRequestIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    objc_msgSend(v9, "updateContact:", v8);
    -[CNContactContentUnitaryViewController contactStore](self, "contactStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "executeSaveRequest:error:", v9, 0);

    -[CNContactContentUnitaryViewController setContact:](self, "setContact:", v8);
    -[CNContactContentUnitaryViewController requestFavoritesUpdateWithGemini](self, "requestFavoritesUpdateWithGemini");
    -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController updateInsetsIfNeededForTableView:isEditing:](self, "updateInsetsIfNeededForTableView:isEditing:", v13, 0);

  }
}

- (void)requestFavoritesUpdateWithGemini
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;

  -[CNContactContentUnitaryViewController environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inProcessFavorites");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entriesForContact:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.contacts.clientDidDisplayFavorites"), 0, 0, 0);
  }
}

- (BOOL)isNicknameProhibited
{
  void *v2;
  char v3;

  -[CNContactContentUnitaryViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0C967A0]);

  return v3;
}

- (void)headerViewDidChangeHeight:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[CNContactContentUnitaryViewController setupViewHierarchyAndConstraints](self, "setupViewHierarchyAndConstraints");
}

- (BOOL)headerViewShouldCacheContactBackgroundColor:(id)a3
{
  return -[CNContactContentUnitaryViewController mode](self, "mode", a3) == 1;
}

- (void)headerView:(id)a3 didUpdateSensitiveContentOverride:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (a4)
    v5 = 1;
  else
    v5 = 2;
  -[CNContactContentUnitaryViewController contact](self, "contact", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sensitiveContentConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "override");

  if (v8 != v5)
  {
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v17, "sensitiveContentConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v17, "sensitiveContentConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "updatedWithOverride:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSensitiveContentConfiguration:", v12);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C973D8], "configurationWithOverride:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSensitiveContentConfiguration:", v11);
    }

    v13 = objc_alloc_init(MEMORY[0x1E0C973D0]);
    objc_msgSend(v13, "setIgnoresGuardianRestrictions:", -[CNContactContentUnitaryViewController saveWasAuthorized](self, "saveWasAuthorized"));
    -[CNContactContentUnitaryViewController issuedSaveRequestIdentifiers](self, "issuedSaveRequestIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "saveRequestIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

    objc_msgSend(v13, "updateContact:", v17);
    -[CNContactContentUnitaryViewController contactStore](self, "contactStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "executeSaveRequest:error:", v13, 0);

    -[CNContactContentUnitaryViewController setContact:](self, "setContact:", v17);
  }
}

- (void)headerView:(id)a3 didRequestToBlockContact:(BOOL)a4
{
  void *v5;
  CNContactToggleBlockCallerAction *v6;
  void *v7;
  CNContactToggleBlockCallerAction *v8;
  void *v9;
  id v10;

  -[CNContactContentUnitaryViewController blockAction](self, "blockAction", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = [CNContactToggleBlockCallerAction alloc];
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CNContactAction initWithContact:](v6, "initWithContact:", v7);
    -[CNContactContentUnitaryViewController setBlockAction:](self, "setBlockAction:", v8);

    -[CNContactContentUnitaryViewController blockAction](self, "blockAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", self);

  }
  -[CNContactContentUnitaryViewController blockAction](self, "blockAction");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performActionWithSender:", self);

}

- (BOOL)isHeaderViewContactBlocked:(id)a3
{
  void *v4;
  CNContactToggleBlockCallerAction *v5;
  void *v6;
  CNContactToggleBlockCallerAction *v7;
  void *v8;
  void *v9;
  char v10;

  -[CNContactContentUnitaryViewController blockAction](self, "blockAction", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = [CNContactToggleBlockCallerAction alloc];
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CNContactAction initWithContact:](v5, "initWithContact:", v6);
    -[CNContactContentUnitaryViewController setBlockAction:](self, "setBlockAction:", v7);

    -[CNContactContentUnitaryViewController blockAction](self, "blockAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);

  }
  -[CNContactContentUnitaryViewController blockAction](self, "blockAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isContactBlockedPreservingChanges:", 1);

  return v10 ^ 1;
}

- (BOOL)isPadCompactHorizontalSize
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  -[CNContactContentUnitaryViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "horizontalSizeClass");

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  return v5 == 1 && v3 == 1;
}

- (void)headerView:(id)a3 didSetBackgroundAsPosterSnapshotImage:(id)a4
{
  if (self->_staticDisplayHeaderView == a3)
    -[CNContactHeaderCollapsedView updateBackgroundWithPosterSnapshotImage:](self->_displayFloatingCollapsedHeaderView, "updateBackgroundWithPosterSnapshotImage:", a4);
}

- (void)headerViewDidTapNameLabel:(id)a3
{
  if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing", a3) & 1) == 0)
  {
    if (-[CNContactContentUnitaryViewController allowsNamePicking](self, "allowsNamePicking"))
      -[CNContactContentUnitaryViewController _pickName](self, "_pickName");
  }
}

- (void)_pickName
{
  -[CNContactContentUnitaryViewController contactViewController:shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:](self, "contactViewController:shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:", self, self->_contact, *MEMORY[0x1E0C966D0], 0);
}

- (BOOL)shouldShowActionsForAvatarView:(id)a3
{
  return -[CNContactContentUnitaryViewController isEditing](self, "isEditing", a3) ^ 1;
}

- (void)contactViewController:(id)a3 didDeleteContact:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainStoreLinkedContacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v16);

  v8 = v16;
  if (v7)
  {
    -[CNContactContentUnitaryViewController removeLinkedContact:](self, "removeLinkedContact:", v16);
    -[CNContactContentUnitaryViewController saveLinkedContactsExecutor](self, "saveLinkedContactsExecutor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController saveDescriptionForCurrentState](self, "saveDescriptionForCurrentState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "executeSaveWithConfiguration:saveDelegate:", v10, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentUnitaryViewController setEditingLinkedContacts:](self, "setEditingLinkedContacts:", 0);
    -[CNContactContentUnitaryViewController issuedSaveRequestIdentifiers](self, "issuedSaveRequestIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifiersOfIssuedSaveRequests");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v13);

    objc_msgSend(v11, "contact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v11, "contact");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController setContact:](self, "setContact:", v15);

    }
    v8 = v16;
  }

}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 propertyIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[CNContactContentUnitaryViewController contactDelegate](self, "contactDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[CNContactContentUnitaryViewController contactDelegate](self, "contactDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "contactViewController:shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:", self, v9, v10, v11);

  }
  else
  {
    v15 = 1;
  }
  -[CNContactContentUnitaryViewController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    -[CNContactContentUnitaryViewController _removeUnauthorizedKeysFromContact:](self, "_removeUnauthorizedKeysFromContact:", v9);
    v18 = objc_claimAutoreleasedReturnValue();

    -[CNContactContentUnitaryViewController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v19, "shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:", v18, v10, v11);

    v9 = (id)v18;
  }

  return v15;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return !-[CNContactContentUnitaryViewController hasPendingChanges](self, "hasPendingChanges", a3, a4);
}

- (void)setNeedsReload
{
  self->_needsReload = 1;
  -[CNContactContentUnitaryViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_reloadDataIfNeeded, 0, 0.0);
}

- (BOOL)needsReload
{
  return self->_needsReload;
}

- (id)_currentTopVisibleGroupInContactView:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  objc_msgSend(v4, "tableHeaderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  objc_msgSend(v4, "estimatedRowHeight");
  v11 = v9 - v10;

  if (v6 <= v11)
  {
LABEL_14:
    v18 = 0;
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v4, "visibleCells", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
LABEL_4:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v16);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v14)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v19 = v17;

      if (!v19)
        goto LABEL_14;
      objc_msgSend(v19, "propertyItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "property");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController cardGroupForProperty:](self, "cardGroupForProperty:", v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v19;
    }
    else
    {
LABEL_10:
      v18 = 0;
    }

  }
  return v18;
}

- (void)_scrollContactView:(id)a3 toVisibleGroup:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  double v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v5 = a5;
  v18 = a3;
  v8 = a4;
  objc_msgSend(v18, "_effectiveContentInset");
  objc_msgSend(v18, "setContentOffset:", 0.0, -v9);
  if (!v8)
    goto LABEL_10;
  v10 = -[CNContactContentUnitaryViewController sectionOfGroup:inTableView:](self, "sectionOfGroup:inTableView:", v8, v18);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_10;
  v11 = v10;
  objc_msgSend(v8, "displayItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (uint64_t)(double)((unint64_t)objc_msgSend(v12, "count") >> 1);

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v18, "numberOfSections");
  if (v15 <= objc_msgSend(v14, "section"))
    goto LABEL_9;
  v16 = objc_msgSend(v18, "numberOfRowsInSection:", objc_msgSend(v14, "section"));
  if (v16 > objc_msgSend(v14, "row"))
    goto LABEL_7;
  if (objc_msgSend(v18, "numberOfRowsInSection:", objc_msgSend(v14, "section")) < 1)
  {
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v11);
  v17 = objc_claimAutoreleasedReturnValue();

  v14 = (void *)v17;
LABEL_7:
  if (v14)
  {
    objc_msgSend(v18, "scrollToRowAtIndexPath:atScrollPosition:animated:", v14, 2, v5);
    goto LABEL_9;
  }
LABEL_10:

}

- (id)sharedProfileBannerSectionCellForTableView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  -[CNContactContentUnitaryViewController contactView](self, "contactView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactView cellIdentifierForSharedProfileBanner](CNContactView, "cellIdentifierForSharedProfileBanner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSelectionStyle:", 0);
  objc_msgSend(v6, "setSeparatorStyle:", 0);
  objc_msgSend(v6, "_cnui_applyContactStyle");
  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setDelegate:", self);
  -[CNContactContentUnitaryViewController prepareCell:](self, "prepareCell:", v9);
  -[CNContactContentUnitaryViewController sharedProfileStateOracle](self, "sharedProfileStateOracle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUpWithSharedProfileStateOracle:tappedAction:hasPerformedAnimation:", v10, -[CNContactContentUnitaryViewController tappedSharedProfileBannerAction](self, "tappedSharedProfileBannerAction"), -[CNContactContentUnitaryViewController hasPerformedSharedProfileBannerAnimation](self, "hasPerformedSharedProfileBannerAnimation"));

  -[CNContactContentUnitaryViewController setHasPerformedSharedProfileBannerAnimation:](self, "setHasPerformedSharedProfileBannerAnimation:", 1);
  return v7;
}

- (unint64_t)bannerActionTypeForEffectiveState
{
  cn_runWithObjectLock();
  return self->_bannerActionTypeForEffectiveState;
}

- (void)sharedProfileBannerView:(id)a3 didUpdateContact:(id)a4 forAction:(unint64_t)a5
{
  id v7;

  v7 = a4;
  -[CNContactContentUnitaryViewController setTappedSharedProfileBannerAction:](self, "setTappedSharedProfileBannerAction:", a5);
  -[CNContactContentUnitaryViewController setDismissedSharedProfileBannerAction:](self, "setDismissedSharedProfileBannerAction:", 0);
  -[CNContactContentUnitaryViewController setContact:](self, "setContact:", v7);

}

- (void)sharedProfileBannerView:(id)a3 didDismissWithUpdatedContact:(id)a4 forAction:(unint64_t)a5
{
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  BOOL v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];

  v7 = a4;
  -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNContactContentUnitaryViewController hasSharedProfileBannerSectionForTableView:](self, "hasSharedProfileBannerSectionForTableView:", v8);

  -[CNContactContentUnitaryViewController setTappedSharedProfileBannerAction:](self, "setTappedSharedProfileBannerAction:", 0);
  -[CNContactContentUnitaryViewController setDismissedSharedProfileBannerAction:](self, "setDismissedSharedProfileBannerAction:", a5);
  -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CNContactContentUnitaryViewController hasSharedProfileBannerSectionForTableView:](self, "hasSharedProfileBannerSectionForTableView:", v10);

  if (v9 && !v11)
  {
    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __104__CNContactContentUnitaryViewController_sharedProfileBannerView_didDismissWithUpdatedContact_forAction___block_invoke;
    v15[3] = &unk_1E204F648;
    v15[4] = self;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __104__CNContactContentUnitaryViewController_sharedProfileBannerView_didDismissWithUpdatedContact_forAction___block_invoke_2;
    v13[3] = &unk_1E204FA78;
    v13[4] = self;
    v14 = v7;
    objc_msgSend(v12, "performBatchUpdates:completion:", v15, v13);

  }
}

- (void)presentAvatarPosterEditor
{
  void *v3;
  dispatch_time_t v4;
  _QWORD block[5];

  -[CNContactContentUnitaryViewController editingHeaderView](self, "editingHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editButtonTappedWhileEditing:", -[CNContactContentUnitaryViewController isEditing](self, "isEditing"));

  v4 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CNContactContentUnitaryViewController_presentAvatarPosterEditor__block_invoke;
  block[3] = &unk_1E204F648;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);
}

- (id)personHeaderCellForTableView:(id)a3
{
  void *v4;
  CNContactContentUnitaryViewController *v5;
  void *v6;
  CNContactContentUnitaryViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
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
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
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
  _QWORD v63[4];
  _QWORD v64[6];

  v64[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PersonHeaderCellIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("PersonHeaderCellIdentifier"));
    objc_msgSend(v4, "setSelectionStyle:", 0);
    objc_msgSend(v4, "setSeparatorStyle:", 0);
    objc_msgSend(v4, "_cnui_applyContactStyle");
  }
  v5 = self;
  -[CNContactContentUnitaryViewController personHeaderViewController](v5, "personHeaderViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parentViewController");
  v7 = (CNContactContentUnitaryViewController *)objc_claimAutoreleasedReturnValue();

  if (v7 != v5)
  {
    -[CNContactContentUnitaryViewController removePersonHeaderViewControllerFromHierarchy](v5, "removePersonHeaderViewControllerFromHierarchy");
    -[CNContactContentUnitaryViewController personHeaderViewController](v5, "personHeaderViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController addChildViewController:](v5, "addChildViewController:", v8);

    -[CNContactContentUnitaryViewController personHeaderViewController](v5, "personHeaderViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v10);

    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutMarginsGuide");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentUnitaryViewController personHeaderViewDelegate](v5, "personHeaderViewDelegate");
    v14 = objc_claimAutoreleasedReturnValue();
    v61 = v13;
    v62 = v10;
    if (v14
      && (v15 = (void *)v14,
          -[CNContactContentUnitaryViewController personHeaderViewDelegate](v5, "personHeaderViewDelegate"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_opt_respondsToSelector(),
          v16,
          v15,
          (v17 & 1) != 0))
    {
      -[CNContactContentUnitaryViewController personHeaderViewDelegate](v5, "personHeaderViewDelegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController personHeaderViewController](v5, "personHeaderViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "contentInsetsForCustomHeaderViewController:", v19);
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;

      v51 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v10, "topAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "topAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintEqualToAnchor:constant:", v21);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = v58;
      objc_msgSend(v10, "bottomAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentView");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "bottomAnchor");
      v57 = v28;
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:constant:", -v25);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v64[1] = v54;
      objc_msgSend(v10, "leadingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "leadingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v29;
      objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, v23);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v64[2] = v32;
      objc_msgSend(v10, "trailingAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "trailingAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35, -v27);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v64[3] = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 4);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "activateConstraints:", v37);

      v38 = v50;
    }
    else
    {
      v52 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v10, "topAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "topAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = v58;
      objc_msgSend(v10, "bottomAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentView");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "bottomAnchor");
      v57 = v39;
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v63[1] = v54;
      objc_msgSend(v10, "leadingAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "leadingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v40;
      objc_msgSend(v40, "constraintEqualToAnchor:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v63[2] = v31;
      objc_msgSend(v10, "trailingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "trailingAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v63[3] = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 4);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "activateConstraints:", v35);
    }

    -[CNContactContentUnitaryViewController personHeaderViewDelegate](v5, "personHeaderViewDelegate");
    v41 = objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      v42 = (void *)v41;
      -[CNContactContentUnitaryViewController personHeaderViewDelegate](v5, "personHeaderViewDelegate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_opt_respondsToSelector();

      if ((v44 & 1) != 0)
      {
        -[CNContactContentUnitaryViewController personHeaderViewDelegate](v5, "personHeaderViewDelegate");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController personHeaderViewController](v5, "personHeaderViewController");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "backgroundColorForCustomHeaderViewController:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          objc_msgSend(v4, "contentView");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setBackgroundColor:", v47);

          objc_msgSend(v4, "setBackgroundColor:", v47);
        }

      }
    }

  }
  return v4;
}

- (void)removePersonHeaderViewControllerFromHierarchy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  -[CNContactContentUnitaryViewController personHeaderViewController](self, "personHeaderViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNContactContentUnitaryViewController personHeaderViewController](self, "personHeaderViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "willMoveToParentViewController:", 0);

    -[CNContactContentUnitaryViewController personHeaderViewController](self, "personHeaderViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isViewLoaded");

    if (v7)
    {
      -[CNContactContentUnitaryViewController personHeaderViewController](self, "personHeaderViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeFromSuperview");

    }
    -[CNContactContentUnitaryViewController personHeaderViewController](self, "personHeaderViewController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromParentViewController");

  }
}

- (void)_updateLabelWidthForCellsInGroup:(id)a3 forTableView:(id)a4 reset:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a5;
  v16 = a3;
  v8 = a4;
  if (v5)
  {
    -[CNContactContentUnitaryViewController _labelWidthKeyForGroup:](self, "_labelWidthKeyForGroup:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController cachedLabelWidths](self, "cachedLabelWidths");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v9);

  }
  -[CNContactContentUnitaryViewController _updateCachedLabelWidthsForGroup:](self, "_updateCachedLabelWidthsForGroup:", v16);
  v11 = -[CNContactContentUnitaryViewController sectionOfGroup:inTableView:](self, "sectionOfGroup:inTableView:", v16, v8);
  objc_msgSend(v16, "editingItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v13 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v13, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cellForRowAtIndexPath:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController _updateLabelWidthForCell:](self, "_updateLabelWidthForCell:", v15);

      ++v13;
    }
    while (v13 < objc_msgSend(v12, "count"));
  }

}

- (void)addEditingItemAtIndexPath:(id)a3 forTableView:(id)a4
{
  -[CNContactContentUnitaryViewController addEditingItem:atIndexPath:forTableView:shouldSetFocus:](self, "addEditingItem:atIndexPath:forTableView:shouldSetFocus:", 0, a3, a4, 1);
}

- (void)addEditingItem:(id)a3 atIndexPath:(id)a4 forTableView:(id)a5 shouldSetFocus:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  uint64_t v15;
  _QWORD v16[6];
  BOOL v17;
  _QWORD v18[6];
  id v19;

  v10 = a4;
  v11 = a5;
  v12 = a3;
  -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", objc_msgSend(v10, "section"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "addEditingItem:", v12);

  if (v14)
  {
    -[CNContactContentUnitaryViewController _updateLabelWidthForCellsInGroup:forTableView:reset:](self, "_updateLabelWidthForCellsInGroup:forTableView:reset:", v13, v11, 0);
    v15 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __96__CNContactContentUnitaryViewController_addEditingItem_atIndexPath_forTableView_shouldSetFocus___block_invoke;
    v18[3] = &unk_1E204FAA0;
    v18[4] = v13;
    v18[5] = self;
    v19 = v10;
    v16[0] = v15;
    v16[1] = 3221225472;
    v16[2] = __96__CNContactContentUnitaryViewController_addEditingItem_atIndexPath_forTableView_shouldSetFocus___block_invoke_2;
    v16[3] = &unk_1E204FAC8;
    v17 = a6;
    v16[4] = self;
    v16[5] = v13;
    -[CNContactContentUnitaryViewController updateContactsViewWithBlock:completion:](self, "updateContactsViewWithBlock:completion:", v18, v16);

  }
}

- (void)removeEditingItem:(id)a3 atIndexPath:(id)a4 forTableView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  CNContactContentUnitaryViewController *v18;
  id v19;
  id v20;
  char v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CNContactContentUnitaryViewController _cardGroupAtTableViewSectionIndex:forTableView:](self, "_cardGroupAtTableViewSectionIndex:forTableView:", objc_msgSend(v9, "section"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "canAddEditingItem");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__CNContactContentUnitaryViewController_removeEditingItem_atIndexPath_forTableView___block_invoke;
  v16[3] = &unk_1E204FAF0;
  v16[4] = v11;
  v17 = v8;
  v18 = self;
  v19 = v10;
  v20 = v9;
  v21 = v12;
  v13 = v9;
  v14 = v10;
  v15 = v8;
  -[CNContactContentUnitaryViewController updateContactsViewWithBlock:completion:](self, "updateContactsViewWithBlock:completion:", v16, 0);

}

- (void)focusOnLastEditingItemInGroup:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "lastEditingItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController indexPathOfEditingPropertyItem:](self, "indexPathOfEditingPropertyItem:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "firstResponderItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "becomeFirstResponder");
}

- (id)_updateContact:(id)a3 withMissingKeysFromRequiredKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "areKeysAvailable:useIgnorableKeys:findMissingKeys:", v7, 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "first");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    v11 = v6;
  }
  else
  {
    objc_msgSend(v8, "second");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController setMissingRequiredKeys:](self, "setMissingRequiredKeys:", v12);

    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__60437;
    v28 = __Block_byref_object_dispose__60438;
    v29 = 0;
    v13 = objc_alloc(MEMORY[0x1E0C97210]);
    -[CNContactContentUnitaryViewController missingRequiredKeys](self, "missingRequiredKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithKeysToFetch:", v14);

    v16 = (void *)MEMORY[0x1E0C97200];
    objc_msgSend(v6, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateForContactsWithIdentifiers:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPredicate:", v19);

    objc_msgSend(v15, "setUnifyResults:", objc_msgSend(v6, "isUnified"));
    -[CNContactContentUnitaryViewController contactStore](self, "contactStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __88__CNContactContentUnitaryViewController__updateContact_withMissingKeysFromRequiredKeys___block_invoke;
    v23[3] = &unk_1E204FB18;
    v23[4] = &v24;
    objc_msgSend(v20, "enumerateContactsWithFetchRequest:error:usingBlock:", v15, 0, v23);

    v21 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v21, "overwriteStateFromContact:", v25[5]);
    objc_msgSend(v21, "freeze");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v24, 8);
  }

  return v11;
}

- (id)_removeUnauthorizedKeysFromContact:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CNContactContentUnitaryViewController missingRequiredKeys](self, "missingRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_msgSend(v4, "mutableCopy");
    -[CNContactContentUnitaryViewController missingRequiredKeys](self, "missingRequiredKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeKeys:", v8);

    objc_msgSend(v7, "setFrozenSelfAsSnapshot");
    v4 = v7;
  }
  return v4;
}

- (void)_didCompleteWithContact:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    -[CNContactContentUnitaryViewController _removeUnauthorizedKeysFromContact:](self, "_removeUnauthorizedKeysFromContact:", v4);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (self->_contact != &self->_mutableContact->super)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = objc_msgSend(v19, "copy");

        v19 = (id)v6;
      }
    }
    -[CNContactContentUnitaryViewController suggestedContactAction](self, "suggestedContactAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "confirmSuggestion");

  }
  else
  {
    v19 = 0;
  }
  if (-[CNContactContentUnitaryViewController mode](self, "mode") == 3)
  {
    -[CNContactContentUnitaryViewController originalContacts](self, "originalContacts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 == 1)
    {
      if (v19)
      {
        +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController originalContacts](self, "originalContacts");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "logContactCreated:originalContact:", v19, v12);

      }
    }
  }
  -[CNContactContentUnitaryViewController contactDelegate](self, "contactDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[CNContactContentUnitaryViewController contactDelegate](self, "contactDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contactViewController:didCompleteWithContact:", self, v19);

  }
  -[CNContactContentUnitaryViewController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    -[CNContactContentUnitaryViewController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "didCompleteWithContact:", v19);

  }
}

- (void)createdNewContact:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    -[CNContactContentViewController setPrimaryProperty:](self, "setPrimaryProperty:", 0);
    -[CNContactContentUnitaryViewController setContact:](self, "setContact:", v4);
    -[CNContactContentUnitaryViewController setMode:](self, "setMode:", 1);
    -[CNContactContentUnitaryViewController setAllowsEditing:](self, "setAllowsEditing:", 1);
    -[CNContactContentUnitaryViewController setAllowsAddingToAddressBook:](self, "setAllowsAddingToAddressBook:", 0);
    -[CNContactContentUnitaryViewController setAllowsAddToFavorites:](self, "setAllowsAddToFavorites:", 1);
  }
  -[CNContactContentUnitaryViewController _didCompleteWithContact:](self, "_didCompleteWithContact:", v4);

}

- (void)updatedExistingContact:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  -[CNContactContentUnitaryViewController setContact:](self, "setContact:", v5);
  -[CNContactContentUnitaryViewController _didCompleteWithContact:](self, "_didCompleteWithContact:", v6);

}

- (void)_setupEditingLinkedContactsForKeys:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[CNContactContentUnitaryViewController editingLinkedContacts](self, "editingLinkedContacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v13;
  if (!v4)
  {
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isUnified");

    if (v7)
    {
      -[CNContactContentUnitaryViewController contact](self, "contact");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mainStoreLinkedContacts");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "mutableCopy");
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0C99DE8];
      -[CNContactContentUnitaryViewController contact](self, "contact");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copyWithPropertyKeys:", v13);
      objc_msgSend(v11, "arrayWithObject:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v10;
    -[CNContactContentUnitaryViewController setEditingLinkedContacts:](self, "setEditingLinkedContacts:", v10);

    v5 = v13;
  }

}

- (void)addLinkedContact:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v5 = objc_claimAutoreleasedReturnValue();
    if ((id)v5 == v4)
    {

    }
    else
    {
      v6 = (void *)v5;
      -[CNContactContentUnitaryViewController contact](self, "contact");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mainStoreLinkedContacts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", v4);

      if ((v9 & 1) == 0)
      {
        objc_msgSend(v4, "availableKeyDescriptor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController _setupEditingLinkedContactsForKeys:](self, "_setupEditingLinkedContactsForKeys:", v11);

        -[CNContactContentUnitaryViewController editingLinkedContacts](self, "editingLinkedContacts");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v4);

        -[CNContactContentUnitaryViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 1);
        +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "logContactActionType:attributes:", CNUIContactActionTypeLink, 0);

      }
    }
  }

}

- (void)removeLinkedContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mainStoreLinkedContacts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

    -[CNContactContentUnitaryViewController editingLinkedContacts](self, "editingLinkedContacts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v4);

    if ((v7 & 1) != 0 || v9)
    {
      objc_msgSend(v4, "availableKeyDescriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController _setupEditingLinkedContactsForKeys:](self, "_setupEditingLinkedContactsForKeys:", v11);

      -[CNContactContentUnitaryViewController editingLinkedContacts](self, "editingLinkedContacts");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObject:", v4);

      -[CNContactContentUnitaryViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 1);
      +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logContactActionType:attributes:", CNUIContactActionTypeUnlink, 0);

    }
  }

}

- (void)addStaticIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = a3;
    -[CNContactContentUnitaryViewController cardStaticIdentityGroup](self, "cardStaticIdentityGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addIdentity:isNew:", v4, 1);

    -[CNContactContentUnitaryViewController cardStaticIdentityGroup](self, "cardStaticIdentityGroup");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController contactView](self, "contactView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController reloadCardGroup:forTableView:](self, "reloadCardGroup:forTableView:", v7, v6);

  }
}

- (void)reloadUnifiedContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CNContactContentUnitaryViewController contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();

  -[CNContactContentUnitaryViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "linkedContacts");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v8)
  {
    objc_msgSend(v4, "unifyContacts:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController setContact:](self, "setContact:", v7);

    v6 = v8;
  }

}

- (void)cleanupRecentMetadata
{
  -[CNContactContentUnitaryViewController cleanupRecentImageMetadata](self, "cleanupRecentImageMetadata");
  -[CNContactContentUnitaryViewController cleanupRecentPosterMetadata](self, "cleanupRecentPosterMetadata");
}

- (void)cleanupRecentImageMetadata
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C97238]);
  v4 = (void *)MEMORY[0x1E0C97230];
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveRequestToDeleteImagesForContactIdentifiers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  objc_msgSend(v3, "performSaveRequest:error:", v8, &v13);
  v9 = v13;
  if (v9)
  {
    CNUILogContactCard();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[CNContactContentUnitaryViewController contact](self, "contact");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v12;
      _os_log_debug_impl(&dword_18AC56000, v10, OS_LOG_TYPE_DEBUG, "Failed to delete recent image metadata for contact: %@", buf, 0xCu);

    }
  }

}

- (void)cleanupRecentPosterMetadata
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C97278]);
  v4 = (void *)MEMORY[0x1E0C97270];
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveRequestToDeletePostersForContactIdentifiers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  objc_msgSend(v3, "performSaveRequest:error:", v8, &v13);
  v9 = v13;
  if (v9)
  {
    CNUILogContactCard();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[CNContactContentUnitaryViewController contact](self, "contact");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v12;
      _os_log_debug_impl(&dword_18AC56000, v10, OS_LOG_TYPE_DEBUG, "Failed to delete recent poster metadata for contact: %@", buf, 0xCu);

    }
  }

}

- (double)desiredHeightForWidth:(double)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;

  -[CNContactContentUnitaryViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  objc_msgSend(v4, "setFrame:");
  -[CNContactContentUnitaryViewController reloadDataIfNeeded](self, "reloadDataIfNeeded");
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "visibleCells");

  -[CNContactContentUnitaryViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

  -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

  if (-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactContentUnitaryViewController displayFloatingCollapsedHeaderView](self, "displayFloatingCollapsedHeaderView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");

  }
  -[CNContactContentUnitaryViewController requiredSizeForVisibleTableView](self, "requiredSizeForVisibleTableView");
  v11 = v10;
  objc_msgSend(v4, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  objc_msgSend(v4, "setFrame:");

  return v11;
}

- (void)updateContactsViewWithBlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  ++self->_animating;
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__CNContactContentUnitaryViewController_updateContactsViewWithBlock_completion___block_invoke;
  v13[3] = &unk_1E204FB40;
  v14 = v6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__CNContactContentUnitaryViewController_updateContactsViewWithBlock_completion___block_invoke_2;
  v11[3] = &unk_1E204FB68;
  v11[4] = self;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBatchUpdates:completion:", v13, v11);

}

- (void)blockListDidChange:(id)a3
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__handleCoalescedBlockListDidChange, 0);
  -[CNContactContentUnitaryViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__handleCoalescedBlockListDidChange, 0, 0.1);
}

- (void)_handleCoalescedBlockListDidChange
{
  if (-[CNContactContentUnitaryViewController shouldIgnoreBlockListChange](self, "shouldIgnoreBlockListChange"))
    -[CNContactContentUnitaryViewController setShouldIgnoreBlockListChange:](self, "setShouldIgnoreBlockListChange:", 0);
  else
    -[CNContactContentUnitaryViewController _setupContactBlockingActionPreservingChanges:withUpdate:](self, "_setupContactBlockingActionPreservingChanges:withUpdate:", 0, 1);
}

- (void)_setupEditingCardActions
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  CNContactIgnoreDonatedInformationAction *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  CNContactIgnoreDonatedInformationAction *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  CNContactDeleteContactAction *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  CNContactDeleteContactAction *v41;
  void *v42;
  void *v43;
  id v44;

  -[CNContactContentUnitaryViewController policy](self, "policy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isReadonly");

  if ((v4 & 1) != 0)
    return;
  -[CNContactContentUnitaryViewController _setupSuggestionActions](self, "_setupSuggestionActions");
  -[CNContactContentUnitaryViewController alreadyPickedGroups](self, "alreadyPickedGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController policy](self, "policy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[CNContactPropertyGroupPickerViewController propertiesLeftToPickWithPickedGroups:policy:prohibitedPropertyKeys:contact:](CNContactPropertyGroupPickerViewController, "propertiesLeftToPickWithPickedGroups:policy:prohibitedPropertyKeys:contact:", v5, v6, v7, v8);

  if (v9)
  {
    -[CNContactContentUnitaryViewController _addNewFieldAction](self, "_addNewFieldAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController setAddNewFieldAction:](self, "setAddNewFieldAction:", v10);

    -[CNContactContentUnitaryViewController cardEditingActionsGroup](self, "cardEditingActionsGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController addNewFieldAction](self, "addNewFieldAction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ADD_MORE_PROPERTIES"), &stru_1E20507A8, CFSTR("Localized"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:withTitle:", v12, v14);

  }
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isSuggestedMe");

  if (v16)
  {
    v17 = [CNContactIgnoreDonatedInformationAction alloc];
    -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(MEMORY[0x1E0D136E0]);
    -[CNContactContentUnitaryViewController environment](self, "environment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsFactory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[CNContactIgnoreDonatedInformationAction initWithContact:donationStore:componentsFactory:](v17, "initWithContact:donationStore:componentsFactory:", v18, v19, v21);
    -[CNContactContentUnitaryViewController setIgnoreContactAction:](self, "setIgnoreContactAction:", v22);

    -[CNContactContentUnitaryViewController ignoreContactAction](self, "ignoreContactAction");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDelegate:", self);

    -[CNContactContentUnitaryViewController ignoreContactAction](self, "ignoreContactAction");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDestructive:", 1);

    -[CNContactContentUnitaryViewController cardEditingDeleteContactGroup](self, "cardEditingDeleteContactGroup");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController ignoreContactAction](self, "ignoreContactAction");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v29 = CFSTR("CARD_ACTION_IGNORE_CARD");
  }
  else
  {
    -[CNContactContentUnitaryViewController contact](self, "contact");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v25, "isUnknown") & 1) != 0
      || -[CNContactContentViewController editingProposedInformation](self, "editingProposedInformation"))
    {
      goto LABEL_9;
    }
    if (-[CNContactContentViewController allowsDeletion](self, "allowsDeletion"))
    {

    }
    else
    {
      v34 = -[CNContactContentUnitaryViewController saveWasAuthorized](self, "saveWasAuthorized");

      if (!v34)
        goto LABEL_10;
    }
    v35 = [CNContactDeleteContactAction alloc];
    -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController environment](self, "environment");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "recentsManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController environment](self, "environment");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "componentsFactory");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[CNContactDeleteContactAction initWithContact:recentsManager:componentsFactory:](v35, "initWithContact:recentsManager:componentsFactory:", v36, v38, v40);
    -[CNContactContentUnitaryViewController setDeleteContactAction:](self, "setDeleteContactAction:", v41);

    -[CNContactContentUnitaryViewController deleteContactAction](self, "deleteContactAction");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setDelegate:", self);

    -[CNContactContentUnitaryViewController deleteContactAction](self, "deleteContactAction");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setDestructive:", 1);

    -[CNContactContentUnitaryViewController cardEditingDeleteContactGroup](self, "cardEditingDeleteContactGroup");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController deleteContactAction](self, "deleteContactAction");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v29 = CFSTR("CARD_ACTION_DELETE_CARD");
  }
  objc_msgSend(v27, "localizedStringForKey:value:table:", v29, &stru_1E20507A8, CFSTR("Localized"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addAction:withTitle:", v26, v30);

LABEL_9:
LABEL_10:
  if (-[CNContactContentUnitaryViewController shouldAllowContainerPicking](self, "shouldAllowContainerPicking"))
  {
    -[CNContactContentUnitaryViewController _selectContainersAction](self, "_selectContainersAction");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController setSelectContainersAction:](self, "setSelectContainersAction:", v31);

    -[CNContactContentUnitaryViewController selectContainersAction](self, "selectContainersAction");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setDelegate:", self);

  }
  if (self->_addAddressingGrammarAction)
  {
    -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
    v44 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController addAddressingGrammarAction](self, "addAddressingGrammarAction");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setContact:", v44);

  }
  else
  {
    -[CNContactContentUnitaryViewController _addAddressingGrammarAction](self, "_addAddressingGrammarAction");
    v44 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController setAddAddressingGrammarAction:](self, "setAddAddressingGrammarAction:");
  }

}

- (id)_displayGroupsForKeys:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];

  v4 = a3;
  v5 = *MEMORY[0x1E0D137F8];
  -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if ((_DWORD)v5)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  }
  else
  {
    -[CNContactContentUnitaryViewController _propertyGroupsForKeys:](self, "_propertyGroupsForKeys:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__CNContactContentUnitaryViewController__displayGroupsForKeys___block_invoke;
    v10[3] = &unk_1E204FA00;
    v10[4] = self;
    objc_msgSend(v8, "_cn_filter:", v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_faceTimeAction
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  CNPropertyFaceTimeAction *v7;
  void *v8;
  CNPropertyFaceTimeAction *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C966A8];
  v11[0] = *MEMORY[0x1E0C967C0];
  v11[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController _propertyGroupsForKeys:](self, "_propertyGroupsForKeys:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentUnitaryViewController _allDisplayPropertyItemsFromGroups:](self, "_allDisplayPropertyItemsFromGroups:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [CNPropertyFaceTimeAction alloc];
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNPropertyFaceTimeAction initWithContact:propertyItems:](v7, "initWithContact:propertyItems:", v8, v6);

  -[CNContactAction setDelegate:](v9, "setDelegate:", self);
  return v9;
}

- (id)_faceTimeAudioAction
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  CNPropertyFaceTimeAction *v7;
  void *v8;
  CNPropertyFaceTimeAction *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C966A8];
  v11[0] = *MEMORY[0x1E0C967C0];
  v11[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController _propertyGroupsForKeys:](self, "_propertyGroupsForKeys:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentUnitaryViewController _allDisplayPropertyItemsFromGroups:](self, "_allDisplayPropertyItemsFromGroups:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [CNPropertyFaceTimeAction alloc];
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNPropertyFaceTimeAction initWithContact:propertyItems:](v7, "initWithContact:propertyItems:", v8, v6);

  -[CNPropertyFaceTimeAction setType:](v9, "setType:", 1);
  -[CNContactAction setDelegate:](v9, "setDelegate:", self);

  return v9;
}

- (id)_linkedCardsAction
{
  CNPropertyLinkedCardsAction *v3;
  void *v4;
  CNPropertyLinkedCardsAction *v5;

  v3 = [CNPropertyLinkedCardsAction alloc];
  -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNPropertyLinkedCardsAction initWithContact:](v3, "initWithContact:", v4);

  -[CNContactAction setDelegate:](v5, "setDelegate:", self);
  -[CNPropertyLinkedCardsAction setContactDelegate:](v5, "setContactDelegate:", self);
  return v5;
}

- (id)_addLinkedCardAction
{
  CNContactAddLinkedCardAction *v3;
  void *v4;
  CNContactAddLinkedCardAction *v5;

  v3 = [CNContactAddLinkedCardAction alloc];
  -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNContactAction initWithContact:](v3, "initWithContact:", v4);

  -[CNContactAction setDelegate:](v5, "setDelegate:", self);
  return v5;
}

- (id)_addToGroupAction
{
  CNContactAddToGroupAction *v3;
  void *v4;
  CNContactAddToGroupAction *v5;
  void *v6;
  void *v7;

  v3 = [CNContactAddToGroupAction alloc];
  -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNContactAction initWithContact:](v3, "initWithContact:", v4);

  -[CNContactContentUnitaryViewController contactStore](self, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAddToGroupAction setContactStore:](v5, "setContactStore:", v6);

  -[CNContactAction setDelegate:](v5, "setDelegate:", self);
  -[CNContactContentUnitaryViewController managedConfiguration](self, "managedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAddToGroupAction setManagedConfiguration:](v5, "setManagedConfiguration:", v7);

  return v5;
}

- (id)_selectContainersAction
{
  CNContactSelectContainersAction *v3;

  v3 = objc_alloc_init(CNContactSelectContainersAction);
  -[CNContactAction setDelegate:](v3, "setDelegate:", self);
  return v3;
}

- (id)_addNewFieldAction
{
  CNContactAddNewFieldAction *v3;
  void *v4;
  CNContactAddNewFieldAction *v5;
  void *v6;

  v3 = [CNContactAddNewFieldAction alloc];
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNContactAction initWithContact:](v3, "initWithContact:", v4);

  -[CNContactContentUnitaryViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAddNewFieldAction setProhibitedPropertyKeys:](v5, "setProhibitedPropertyKeys:", v6);

  -[CNContactAction setDelegate:](v5, "setDelegate:", self);
  -[CNContactAddNewFieldAction setGroupPickerDelegate:](v5, "setGroupPickerDelegate:", self);
  return v5;
}

- (id)_addCreateNewContactAction
{
  CNContactCreateNewContactAction *v3;
  void *v4;
  CNContactCreateNewContactAction *v5;

  v3 = [CNContactCreateNewContactAction alloc];
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNContactAction initWithContact:](v3, "initWithContact:", v4);

  -[CNContactAction setDelegate:](v5, "setDelegate:", self);
  -[CNContactCreateNewContactAction setPresentingViewController:](v5, "setPresentingViewController:", self);
  return v5;
}

- (id)_addToExistingContactAction
{
  CNContactAddToExistingContactAction *v3;
  void *v4;
  CNContactAddToExistingContactAction *v5;

  v3 = [CNContactAddToExistingContactAction alloc];
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNContactAction initWithContact:](v3, "initWithContact:", v4);

  -[CNContactAction setDelegate:](v5, "setDelegate:", self);
  return v5;
}

- (id)_updateExistingContactAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  CNContactUpdateExistingContactAction *v14;
  void *v15;
  CNContactUpdateExistingContactAction *v16;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  -[CNContactContentUnitaryViewController contactFormatter](self, "contactFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0C97210]);
    -[CNContactContentUnitaryViewController contactFormatter](self, "contactFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "descriptorForRequiredKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "initWithKeysToFetch:", v10);

    objc_msgSend(v11, "setOnlyMainStore:", 1);
    objc_msgSend(v11, "setUnifyResults:", 1);
    objc_msgSend(v11, "setPredicate:", v6);
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__60437;
    v24 = __Block_byref_object_dispose__60438;
    v25 = 0;
    -[CNContactContentUnitaryViewController contactStore](self, "contactStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[4] = &v20;
    v19 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __69__CNContactContentUnitaryViewController__updateExistingContactAction__block_invoke;
    v18[3] = &unk_1E204FB18;
    objc_msgSend(v12, "enumerateContactsWithFetchRequest:error:usingBlock:", v11, &v19, v18);
    v13 = v19;

    if (v21[5])
    {
      v14 = [CNContactUpdateExistingContactAction alloc];
      -[CNContactContentUnitaryViewController contact](self, "contact");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[CNContactAction initWithContact:](v14, "initWithContact:", v15);

      -[CNContactUpdateExistingContactAction setExistingContact:](v16, "setExistingContact:", v21[5]);
      -[CNContactAction setDelegate:](v16, "setDelegate:", self);
    }
    else
    {
      v16 = 0;
    }
    _Block_object_dispose(&v20, 8);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_addAddressingGrammarAction
{
  CNContactAddAddressingGrammarAction *v3;
  void *v4;
  CNContactAddAddressingGrammarAction *v5;

  v3 = [CNContactAddAddressingGrammarAction alloc];
  -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNContactAction initWithContact:](v3, "initWithContact:", v4);

  -[CNContactAction setDelegate:](v5, "setDelegate:", self);
  return v5;
}

- (void)_addShareLocationGroupAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v3 = a3;
  if (-[CNContactContentUnitaryViewController shouldAddShareLocationGroup](self, "shouldAddShareLocationGroup"))
  {
    if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0)
    {
      -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __72__CNContactContentUnitaryViewController__addShareLocationGroupAnimated___block_invoke;
        v13[3] = &unk_1E204FDE8;
        v13[4] = self;
        v7 = objc_msgSend(v6, "_cn_indexOfFirstObjectPassingTest:", v13);

        if (v7 && v7 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", v7 - 1);
          v9 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "lastObject");
          v9 = objc_claimAutoreleasedReturnValue();
        }
        v10 = (void *)v9;

        -[CNContactContentUnitaryViewController cardShareLocationGroup](self, "cardShareLocationGroup");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController _addGroup:afterGroup:forTableView:animated:](self, "_addGroup:afterGroup:forTableView:animated:", v11, v10, v12, v3);

      }
    }
  }
}

- (BOOL)shouldAddShareLocationGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) != 0)
    return 0;
  -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[CNContactContentUnitaryViewController cardShareLocationGroup](self, "cardShareLocationGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentUnitaryViewController cardShareLocationGroup](self, "cardShareLocationGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "_cn_containsObject:", v6);

  return v7 ^ 1;
}

- (BOOL)shouldShowGameCenter
{
  return 1;
}

- (void)_reloadGameCenterGroupWithRefresh
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (-[CNContactContentUnitaryViewController shouldShowGameCenter](self, "shouldShowGameCenter"))
  {
    -[CNContactContentUnitaryViewController setRequiresGameCenterRefresh:](self, "setRequiresGameCenterRefresh:", 0);
    -[CNContactContentUnitaryViewController gameCenterManager](self, "gameCenterManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __74__CNContactContentUnitaryViewController__reloadGameCenterGroupWithRefresh__block_invoke;
    v5[3] = &unk_1E204FE10;
    v5[4] = self;
    objc_msgSend(v3, "refreshGameCenterRelationshipsForContact:completionHandler:", v4, v5);

  }
}

- (void)addGameCenterActionGroupAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v3 = a3;
  if (-[CNContactContentUnitaryViewController shouldShowGameCenter](self, "shouldShowGameCenter"))
  {
    if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0)
    {
      -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __74__CNContactContentUnitaryViewController_addGameCenterActionGroupAnimated___block_invoke;
        v13[3] = &unk_1E204FDE8;
        v13[4] = self;
        v7 = objc_msgSend(v6, "_cn_indexOfFirstObjectPassingTest:", v13);

        if (v7 && v7 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", v7 - 1);
          v9 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "lastObject");
          v9 = objc_claimAutoreleasedReturnValue();
        }
        v10 = (void *)v9;

        -[CNContactContentUnitaryViewController cardGameCenterActionGroup](self, "cardGameCenterActionGroup");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentUnitaryViewController _addGroup:afterGroup:forTableView:animated:](self, "_addGroup:afterGroup:forTableView:animated:", v11, v10, v12, v3);

      }
    }
  }
}

- (void)addGameCenterGroupAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  if (-[CNContactContentUnitaryViewController shouldShowGameCenter](self, "shouldShowGameCenter")
    && -[CNContactContentUnitaryViewController shouldAddGameCenterGroup](self, "shouldAddGameCenterGroup"))
  {
    -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_cn_indexOfFirstObjectPassingTest:", &__block_literal_global_722);

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "_cn_indexOfFirstObjectPassingTest:", &__block_literal_global_723);

    }
    v11 = 0;
    if (v6)
    {
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", v6 - 1);
        v11 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    -[CNContactContentUnitaryViewController gameCenterGroup](self, "gameCenterGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController displayContactView](self, "displayContactView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController _addGroup:afterGroup:forTableView:animated:](self, "_addGroup:afterGroup:forTableView:animated:", v9, v11, v10, v3);

  }
}

- (BOOL)shouldAddGameCenterGroup
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = -[CNContactContentUnitaryViewController shouldShowGameCenter](self, "shouldShowGameCenter");
  if (v3)
  {
    if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0
      && (-[CNContactContentUnitaryViewController displayGroups](self, "displayGroups"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v4,
          v4)
      && (-[CNContactContentUnitaryViewController gameCenterGroup](self, "gameCenterGroup"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController gameCenterGroup](self, "gameCenterGroup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "_cn_containsObject:", v7);

      LOBYTE(v3) = v8 ^ 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)shouldAddGameCenterActionGroup
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = -[CNContactContentUnitaryViewController shouldShowGameCenter](self, "shouldShowGameCenter");
  if (v3)
  {
    if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0
      && (-[CNContactContentUnitaryViewController displayGroups](self, "displayGroups"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v4,
          v4)
      && (-[CNContactContentUnitaryViewController cardGameCenterActionGroup](self, "cardGameCenterActionGroup"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      -[CNContactContentUnitaryViewController displayGroups](self, "displayGroups");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController cardGameCenterActionGroup](self, "cardGameCenterActionGroup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "_cn_containsObject:", v7);

      LOBYTE(v3) = v8 ^ 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)_reloadGroupEditingContext
{
  void *v3;
  void *v4;
  CNUIGroupEditingContext *v5;
  id v6;

  -[CNContactContentUnitaryViewController cardGroupMembershipGroup](self, "cardGroupMembershipGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNContactContentUnitaryViewController cardGroupMembershipGroup](self, "cardGroupMembershipGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parentGroups");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v5 = -[CNUIGroupEditingContext initWithOriginalGroups:]([CNUIGroupEditingContext alloc], "initWithOriginalGroups:", v6);
    -[CNContactContentUnitaryViewController setGroupEditingContext:](self, "setGroupEditingContext:", v5);

  }
}

- (BOOL)_modelHasChanges
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int64_t v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  int v31;
  int v32;
  int v33;
  void *v34;
  char v35;
  char v36;
  uint64_t v37;
  void *v38;
  char v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[CNContactContentUnitaryViewController editingGroups](self, "editingGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v42 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v11, "modified", (_QWORD)v41) & 1) != 0)
        {
          v12 = 1;
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  if (self->_editingHeaderView)
  {
    -[CNContactContentUnitaryViewController editingHeaderView](self, "editingHeaderView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "photoIsModified");

    -[CNContactContentUnitaryViewController editingHeaderView](self, "editingHeaderView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 |= v14 | objc_msgSend(v15, "wallpaperIsModified");

  }
  -[CNContactContentUnitaryViewController editingLinkedContacts](self, "editingLinkedContacts", (_QWORD)v41);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContentUnitaryViewController groupEditingContext](self, "groupEditingContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[CNContactContentUnitaryViewController groupEditingContext](self, "groupEditingContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addedGroups");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      v20 = 1;
    }
    else
    {
      -[CNContactContentUnitaryViewController groupEditingContext](self, "groupEditingContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removedGroups");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v22, "count") != 0;

    }
  }
  else
  {
    v20 = 0;
  }

  -[CNContactContentUnitaryViewController containerContext](self, "containerContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addedContainers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  v26 = -[CNContactContentUnitaryViewController mode](self, "mode");
  v27 = -[CNContactContentUnitaryViewController mode](self, "mode") == 4
     || -[CNContactContentUnitaryViewController mode](self, "mode") == 5;
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "hasNonPersistedData"))
  {
    -[CNContactContentUnitaryViewController shadowCopyOfReadonlyContact](self, "shadowCopyOfReadonlyContact");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29 == 0;

  }
  else
  {
    v30 = 0;
  }
  if (v16)
    v31 = 1;
  else
    v31 = v12;
  v32 = v20 | v31;
  if (v25)
    v32 = 1;
  if (v26 == 3)
    v32 = 1;
  v33 = v32 | (v27 || v30);

  -[CNContactContentUnitaryViewController cardStaticIdentityGroup](self, "cardStaticIdentityGroup");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "didChange");
  if (v33)
    v36 = 1;
  else
    v36 = v35;

  v37 = *MEMORY[0x1E0D137F8];
  -[CNContactContentUnitaryViewController deletedEditingGroups](self, "deletedEditingGroups");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (*(uint64_t (**)(uint64_t, void *))(v37 + 16))(v37, v38);

  return v36 | v39 ^ 1;
}

- (BOOL)_modelIsEmpty
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  char v22;
  char v24;
  uint64_t v25;
  uint64_t v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[CNContactContentUnitaryViewController editingGroups](self, "editingGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    v24 = 1;
    v25 = *(_QWORD *)v33;
    do
    {
      v9 = 0;
      v26 = v7;
      do
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          if ((-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) != 0)
            objc_msgSend(v11, "editingItems");
          else
            objc_msgSend(v11, "propertyItems");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v13 = v12;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v29;
            while (2)
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v29 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_msgSend(v18, "normalizedValue");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v19)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v19, "length"))
                    {

                      v24 = 0;
                      goto LABEL_24;
                    }
                  }

                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
              if (v15)
                continue;
              break;
            }
LABEL_24:
            v8 = v25;
            v7 = v26;
          }

        }
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v7);
  }
  else
  {
    v24 = 1;
  }

  if (self->_editingHeaderView)
  {
    -[CNContactContentUnitaryViewController editingHeaderView](self, "editingHeaderView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hasPhoto");

    v22 = (v21 ^ 1) & v24;
  }
  else
  {
    v22 = v24;
  }

  return v22 & 1;
}

- (void)_validateGroup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CNContactContentUnitaryViewController *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "propertyItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v19 = self;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "labeledValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "isValidValue:", v13);

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v11, "labeledValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "replacementForInvalidValue:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "updateLabeledValueWithValue:", v17);

          v8 = 1;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
    if ((v8 & 1) != 0)
    {
      -[CNContactContentUnitaryViewController contactView](v19, "contactView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController reloadCardGroup:forTableView:](v19, "reloadCardGroup:forTableView:", v4, v18);

    }
  }

}

- (void)_saveChangesForGroups:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        v10 = (void *)objc_opt_class();
        if (objc_msgSend(v10, "isSubclassOfClass:", objc_opt_class()))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[CNContactContentUnitaryViewController setDidEditPronouns:](self, "setDidEditPronouns:", objc_msgSend(v9, "modified"));
          objc_msgSend(v9, "saveChanges");
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)_addedGroupWithName:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  CNContactContentUnitaryViewController *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[CNContactView nameProperties](CNContactView, "nameProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    -[CNContactContentUnitaryViewController mutableContact](self, "mutableContact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController contactStore](self, "contactStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController policy](self, "policy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController linkedPoliciesByContactIdentifier](self, "linkedPoliciesByContactIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNCardPropertyGroup groupForProperty:contact:store:policy:linkedPolicies:](CNCardPropertyNameGroup, "groupForProperty:contact:store:policy:linkedPolicies:", v4, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[CNContactView nameProperties](CNContactView, "nameProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v11;
    objc_msgSend(v11, "property");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "indexOfObject:", v13);

    v43 = self;
    -[CNContactContentUnitaryViewController editingGroups](self, "editingGroups");
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    v44 = v4;
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v46;
      while (2)
      {
        v20 = 0;
        v41 = v18 + v17;
        do
        {
          if (*(_QWORD *)v46 != v19)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v20);
          +[CNContactView nameProperties](CNContactView, "nameProperties", v41);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "property");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "indexOfObject:", v23);

          if (v24 >= v14)
          {
            v25 = v18 + v20;
            goto LABEL_15;
          }
          ++v20;
        }
        while (v17 != v20);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        v25 = v41;
        v18 = v41;
        if (v17)
          continue;
        break;
      }
    }
    else
    {
      v25 = 0;
    }
LABEL_15:

    -[CNContactContentUnitaryViewController nameEditingGroups](v43, "nameEditingGroups");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "mutableCopy");

    objc_msgSend(v28, "insertObject:atIndex:", v42, v25);
    v29 = (void *)objc_msgSend(v28, "copy");
    -[CNContactContentUnitaryViewController setNameEditingGroups:](v43, "setNameEditingGroups:", v29);

    -[CNContactContentUnitaryViewController editingGroups](v43, "editingGroups");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "mutableCopy");

    objc_msgSend(v31, "insertObject:atIndex:", v42, v25);
    v32 = (void *)objc_msgSend(v31, "copy");
    -[CNContactContentUnitaryViewController setEditingGroups:](v43, "setEditingGroups:", v32);

    -[CNContactContentUnitaryViewController contactView](v43, "contactView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "reloadData");

    -[CNContactContentUnitaryViewController contactView](v43, "contactView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[CNContactContentUnitaryViewController sectionOfGroup:inTableView:](v43, "sectionOfGroup:inTableView:", v42, v34);

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController contactView](v43, "contactView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "cellForRowAtIndexPath:", v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "firstResponderItem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "becomeFirstResponder");

    -[CNContactContentUnitaryViewController contactView](v43, "contactView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "scrollToRowAtIndexPath:atScrollPosition:animated:", v36, 2, 0);

    v4 = v44;
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C96668]))
  {
    -[CNContactContentUnitaryViewController addAddressingGrammarAction](self, "addAddressingGrammarAction");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "performActionWithSender:", 0);

  }
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNContactContentUnitaryViewController;
  -[CNContactContentUnitaryViewController encodeRestorableStateWithCoder:](&v18, sel_encodeRestorableStateWithCoder_, v4);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  +[CNContactContentUnitaryViewController BOOLStateRestorationProperties](CNContactContentUnitaryViewController, "BOOLStateRestorationProperties", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[CNContactContentUnitaryViewController valueForKey:](self, "valueForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "encodeObject:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v7);
  }

  -[CNContactContentUnitaryViewController contact](self, "contact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("Identifier"));

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;

  y = a4.y;
  v25 = a3;
  if (!-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "minHeight");
    v10 = v9;

    -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "maxHeight");
    v13 = v12;

    if (-[CNContactContentUnitaryViewController isScrollViewControllingHeaderResizeAnimation:](self, "isScrollViewControllingHeaderResizeAnimation:", v25))
    {
      v14 = v13 - a5->y;
      objc_msgSend(v25, "contentInset");
      v16 = v14 - v15;
      objc_msgSend(v25, "_systemContentInset");
      v18 = v16 - v17;
      if (y <= 0.0)
      {
        v19 = v25;
        if (y >= 0.0)
        {
          if (v18 > v10 && v18 < v13)
          {
            if (v18 - v10 >= (v13 - v10) * 0.5)
              v18 = v13;
            else
              v18 = v10;
          }
        }
        else if (v18 < v13)
        {
          v18 = v13;
        }
      }
      else
      {
        v19 = v25;
        if (v18 > v10)
          v18 = v10;
      }
      v21 = v13 - v18;
      objc_msgSend(v19, "contentInset");
      v23 = v21 - v22;
      objc_msgSend(v25, "_systemContentInset");
      a5->y = v23 - v24;
    }
  }

}

- (void)presentViewController:(id)a3 sourceView:(id)a4
{
  -[CNContactContentUnitaryViewController sender:presentViewController:](self, "sender:presentViewController:", a4, a3);
}

- (void)sharingStatusDidChange
{
  -[CNContactContentUnitaryViewController setupShareLocationActionReload:](self, "setupShareLocationActionReload:", 1);
}

- (double)globalHeaderHeightForContentOffset:(double)a3 contentInset:(UIEdgeInsets)a4
{
  double top;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;

  top = a4.top;
  v7 = 0.0;
  if ((objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory", a3, a4.top, a4.left, a4.bottom, a4.right) & 1) == 0&& (-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0)
  {
    -[CNContactContentUnitaryViewController actionsWrapperView](self, "actionsWrapperView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v7 = v9;

  }
  -[CNContactContentUnitaryViewController contactView](self, "contactView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_systemContentInset");
  v12 = top + v11;

  if (-v12 <= a3)
    v13 = -a3;
  else
    v13 = v12;
  -[CNContactContentUnitaryViewController contactHeaderView](self, "contactHeaderView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minHeight");
  v16 = v7 + v15;

  if (v13 >= v16)
    return v13;
  else
    return v16;
}

- (double)contentOffsetYForGlobalHeaderHeight:(double)a3 contentInset:(UIEdgeInsets)a4
{
  return -a3;
}

- (void)updateHeaderHeightToMatchScrollViewState:(id)a3 scrollDirection:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  id v18;
  id v19;

  v5 = a5;
  v19 = a3;
  if (!-[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader"))
  {
    objc_msgSend(v19, "contentOffset");
    v9 = v8;
    objc_msgSend(v19, "contentInset");
    -[CNContactContentUnitaryViewController globalHeaderHeightForContentOffset:contentInset:](self, "globalHeaderHeightForContentOffset:contentInset:", v9, v10, v11, v12, v13);
    -[CNContactContentUnitaryViewController updateHeaderConstraintForGlobalHeaderHeight:direction:animated:](self, "updateHeaderConstraintForGlobalHeaderHeight:direction:animated:", a4, v5);
    v15 = v14;
    objc_opt_class();
    v16 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    objc_msgSend(v18, "setMaskingInset:", v15);
  }

}

- (double)updateHeaderConstraintForGlobalHeaderHeight:(double)a3 direction:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v8;
  double result;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;

  v8 = -[CNContactContentUnitaryViewController shouldUseStaticHeader](self, "shouldUseStaticHeader", a4, a5);
  result = 0.0;
  if (!v8)
  {
    v10 = 0.0;
    if ((objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory", 0.0) & 1) == 0
      && (-[CNContactContentUnitaryViewController isEditing](self, "isEditing") & 1) == 0)
    {
      -[CNContactContentUnitaryViewController actionsWrapperView](self, "actionsWrapperView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "frame");
      v10 = v12;

    }
    -[CNContactContentUnitaryViewController headerHeightConstraint](self, "headerHeightConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constant");
    v15 = v14;

    if (a3 - v10 != v15 && (a4 || a3 - v10 > v15))
    {
      -[CNContactContentUnitaryViewController headerHeightConstraint](self, "headerHeightConstraint");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setConstant:", a3 - v10);

      return a3;
    }
    else
    {
      return v10 + v15;
    }
  }
  return result;
}

- (void)scrollScrollViewAllTheWayUp:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "contentOffset");
  v4 = v3;
  objc_msgSend(v8, "contentInset");
  v6 = v5;
  objc_msgSend(v8, "_systemContentInset");
  objc_msgSend(v8, "setContentOffset:", v4, -(v6 + v7));

}

- (void)setContactViewBackgroundToMatchHeader
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CNContactHeaderCollapsedView *displayFloatingCollapsedHeaderView;
  void *v25;
  id v26;

  if (-[CNContactContentUnitaryViewController shouldSetBackgroundColorToMatchHeader](self, "shouldSetBackgroundColorToMatchHeader"))
  {
    -[CNContactContentUnitaryViewController headerViewBackgroundColors](self, "headerViewBackgroundColors");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactContentUnitaryViewController headerViewBackgroundColors](self, "headerViewBackgroundColors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4 == 1)
    {
      -[CNContactContentUnitaryViewController headerViewBackgroundColors](self, "headerViewBackgroundColors");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController contactViewBackgroundView](self, "contactViewBackgroundView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBackgroundColor:", v6);

      -[CNContactContentUnitaryViewController contactViewBackgroundGradientLayer](self, "contactViewBackgroundGradientLayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setColors:", 0);
    }
    else
    {
      -[CNContactContentUnitaryViewController contactViewBackgroundView](self, "contactViewBackgroundView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", 0);

      -[CNContactContentUnitaryViewController contactView](self, "contactView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      -[CNContactContentUnitaryViewController contactViewBackgroundGradientLayer](self, "contactViewBackgroundGradientLayer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

      objc_msgSend(v26, "_cn_map:", &__block_literal_global_780);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_cn_reversed");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentUnitaryViewController contactViewBackgroundGradientLayer](self, "contactViewBackgroundGradientLayer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setColors:", v21);

      -[CNContactContentUnitaryViewController contactViewBackgroundGradientLayer](self, "contactViewBackgroundGradientLayer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setStartPoint:", 0.0, 0.5);

      -[CNContactContentUnitaryViewController contactViewBackgroundGradientLayer](self, "contactViewBackgroundGradientLayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setEndPoint:", 1.0, 0.5);
    }

    displayFloatingCollapsedHeaderView = self->_displayFloatingCollapsedHeaderView;
    -[CNContactContentUnitaryViewController headerViewBackgroundColors](self, "headerViewBackgroundColors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactHeaderCollapsedView updateBackgroundWithGradientColors:horizontal:](displayFloatingCollapsedHeaderView, "updateBackgroundWithGradientColors:horizontal:", v25, 1);

  }
}

- (id)defaulTextColor
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *MEMORY[0x1E0D13818];
  -[CNContactContentUnitaryViewController contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wallpaper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterArchiveData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v5) & 1) != 0)
    +[CNUIColorRepository contactCardStaticAvatarHeaderDefaultTextColor](CNUIColorRepository, "contactCardStaticAvatarHeaderDefaultTextColor");
  else
    +[CNUIColorRepository contactCardStaticHeaderDefaultTintColor](CNUIColorRepository, "contactCardStaticHeaderDefaultTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)transparentPlatterImage
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "cnui_imageNamed:", CFSTR("transparent-image"));
}

- (void)alertStaticIdentitySaveFailed:(id)a3
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
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC3450];
  CNContactsUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("STATIC_IDENTITY_INVALID_ACCOUNT_KEY_ALERT"), &stru_1E20507A8, CFSTR("Localized-NARWHAL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("STATIC_IDENTITY_INVALID_ACCOUNT_KEY_MESSAGE"), &stru_1E20507A8, CFSTR("Localized-NARWHAL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v7, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v11 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E20507A8, CFSTR("Localized"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__CNContactContentUnitaryViewController_alertStaticIdentitySaveFailed___block_invoke;
  v16[3] = &unk_1E204FF80;
  objc_copyWeak(&v18, &location);
  v14 = v4;
  v17 = v14;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 0, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v15);

  -[CNContactContentUnitaryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)alertDetailsNotVerified:(id)a3
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
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  CNContactContentUnitaryViewController *v20;
  id v21;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC3450];
  CNContactsUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("STATIC_IDENTITY_DETAILS_NOT_VERIFIED_ALERT"), &stru_1E20507A8, CFSTR("Localized-NARWHAL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("STATIC_IDENTITY_DETAILS_NOT_VERIFIED_MESSAGE"), &stru_1E20507A8, CFSTR("Localized-NARWHAL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v7, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E20507A8, CFSTR("Localized"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __65__CNContactContentUnitaryViewController_alertDetailsNotVerified___block_invoke;
  v19 = &unk_1E204FFA8;
  v20 = self;
  v21 = v4;
  v14 = v4;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 0, &v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v15, v16, v17, v18, v19, v20);

  -[CNContactContentUnitaryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
}

- (void)updateViewAnnotationWithContact:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactContentUnitaryViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "annotateWithContact:isPrimary:isEditing:", v4, 1, -[CNContactContentUnitaryViewController isEditing](self, "isEditing"));

}

- (BOOL)showContactBlockingFirst
{
  return self->_showContactBlockingFirst;
}

- (id)contactDelegate
{
  return objc_loadWeakRetained((id *)&self->_contactDelegate);
}

- (void)setContactDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contactDelegate, a3);
}

- (BOOL)highlightedPropertyImportant
{
  return self->_highlightedPropertyImportant;
}

- (void)setLinkedPoliciesByContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_linkedPoliciesByContactIdentifier, a3);
}

- (id)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (id)missingRequiredKeys
{
  return self->_missingRequiredKeys;
}

- (void)setMissingRequiredKeys:(id)a3
{
  objc_storeStrong((id *)&self->_missingRequiredKeys, a3);
}

- (void)setOriginalContacts:(id)a3
{
  objc_storeStrong((id *)&self->_originalContacts, a3);
}

- (void)setInitialPrompt:(id)a3
{
  objc_storeStrong((id *)&self->_initialPrompt, a3);
}

- (id)saveContactExecutor
{
  return self->_saveContactExecutor;
}

- (void)setSaveContactExecutor:(id)a3
{
  objc_storeStrong((id *)&self->_saveContactExecutor, a3);
}

- (id)saveLinkedContactsExecutor
{
  return self->_saveLinkedContactsExecutor;
}

- (void)setSaveLinkedContactsExecutor:(id)a3
{
  objc_storeStrong((id *)&self->_saveLinkedContactsExecutor, a3);
}

- (BOOL)shouldIgnoreContactStoreDidChangeNotification
{
  return self->_shouldIgnoreContactStoreDidChangeNotification;
}

- (void)setShouldIgnoreContactStoreDidChangeNotification:(BOOL)a3
{
  self->_shouldIgnoreContactStoreDidChangeNotification = a3;
}

- (void)setRecentsData:(id)a3
{
  objc_storeStrong((id *)&self->_recentsData, a3);
}

- (id)contactViewConfiguration
{
  return self->_contactViewConfiguration;
}

- (void)setContactViewConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_contactViewConfiguration, a3);
}

- (void)setPresentingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentingDelegate, a3);
}

- (BOOL)allowsAddToFavorites
{
  return self->_allowsAddToFavorites;
}

- (void)setAllowsSendMessage:(BOOL)a3
{
  self->_allowsSendMessage = a3;
}

- (BOOL)allowsSettingLinkedContactsAsPreferred
{
  return self->_allowsSettingLinkedContactsAsPreferred;
}

- (void)setAllowsSettingLinkedContactsAsPreferred:(BOOL)a3
{
  self->_allowsSettingLinkedContactsAsPreferred = a3;
}

- (void)setAllowsActionsModel:(BOOL)a3
{
  self->_allowsActionsModel = a3;
}

- (void)setHideCardActions:(BOOL)a3
{
  self->_hideCardActions = a3;
}

- (void)setCardTopGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardTopGroup, a3);
}

- (void)setCardBottomGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardBottomGroup, a3);
}

- (id)personHeaderViewDelegate
{
  return objc_loadWeakRetained((id *)&self->_personHeaderViewDelegate);
}

- (void)setPersonHeaderViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_personHeaderViewDelegate, a3);
}

- (void)setMutableContactForHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_mutableContactForHeaderView, a3);
}

- (void)setMutableContact:(id)a3
{
  objc_storeStrong((id *)&self->_mutableContact, a3);
}

- (NSMutableArray)issuedSaveRequestIdentifiers
{
  return self->_issuedSaveRequestIdentifiers;
}

- (void)setIssuedSaveRequestIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_issuedSaveRequestIdentifiers, a3);
}

- (void)setShadowCopyOfReadonlyContact:(id)a3
{
  objc_storeStrong((id *)&self->_shadowCopyOfReadonlyContact, a3);
}

- (void)setDisplayContactView:(id)a3
{
  objc_storeStrong((id *)&self->_displayContactView, a3);
}

- (void)setEditingContactView:(id)a3
{
  objc_storeStrong((id *)&self->_editingContactView, a3);
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (void)setStaticDisplayHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_staticDisplayHeaderView, a3);
}

- (void)setDisplayFloatingCollapsedHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_displayFloatingCollapsedHeaderView, a3);
}

- (void)setEditingFloatingCollapsedHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_editingFloatingCollapsedHeaderView, a3);
}

- (void)setDisplayHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_displayHeaderView, a3);
}

- (void)setEditingHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_editingHeaderView, a3);
}

- (CNUIEditAuthorizationController)editAuthorizationController
{
  return self->_editAuthorizationController;
}

- (void)setEditAuthorizationController:(id)a3
{
  objc_storeStrong((id *)&self->_editAuthorizationController, a3);
}

- (int64_t)editAuthorizationResult
{
  return self->_editAuthorizationResult;
}

- (UIGestureRecognizerDelegate)previousBackGestureDelegate
{
  return self->_previousBackGestureDelegate;
}

- (void)setPreviousBackGestureDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_previousBackGestureDelegate, a3);
}

- (CNContactContainerPickerViewController)containerPicker
{
  return self->_containerPicker;
}

- (void)setContainerPicker:(id)a3
{
  objc_storeStrong((id *)&self->_containerPicker, a3);
}

- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager
{
  return self->_groupsAndContainersSaveManager;
}

- (NSArray)deletedEditingGroups
{
  return self->_deletedEditingGroups;
}

- (NSArray)headerViewBackgroundColors
{
  return self->_headerViewBackgroundColors;
}

- (void)setContactViewBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_contactViewBackgroundView, a3);
}

- (void)setContactViewBackgroundGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_contactViewBackgroundGradientLayer, a3);
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

- (void)setCardActionsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardActionsGroup, a3);
}

- (void)setCardShareLocationGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardShareLocationGroup, a3);
}

- (void)setCardBlockContactGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardBlockContactGroup, a3);
}

- (void)setCardGroupMembershipGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardGroupMembershipGroup, a3);
}

- (CNPropertyLinkedCardsAction)linkedCardsAction
{
  return self->_linkedCardsAction;
}

- (void)setLinkedCardsAction:(id)a3
{
  objc_storeStrong((id *)&self->_linkedCardsAction, a3);
}

- (CNContactAddLinkedCardAction)addLinkedCardAction
{
  return self->_addLinkedCardAction;
}

- (void)setAddLinkedCardAction:(id)a3
{
  objc_storeStrong((id *)&self->_addLinkedCardAction, a3);
}

- (CNContactAddToGroupAction)addToGroupAction
{
  return self->_addToGroupAction;
}

- (void)setAddToGroupAction:(id)a3
{
  objc_storeStrong((id *)&self->_addToGroupAction, a3);
}

- (CNContactAction)createReminderAction
{
  return self->_createReminderAction;
}

- (CNContactToggleBlockCallerAction)blockAction
{
  return self->_blockAction;
}

- (CNContactToggleBlockReportCallerAction)blockReportAction
{
  return self->_blockReportAction;
}

- (CNContactAddNewFieldAction)addNewFieldAction
{
  return self->_addNewFieldAction;
}

- (void)setAddNewFieldAction:(id)a3
{
  objc_storeStrong((id *)&self->_addNewFieldAction, a3);
}

- (CNContactCreateNewContactAction)createNewContactAction
{
  return self->_createNewContactAction;
}

- (void)setCreateNewContactAction:(id)a3
{
  objc_storeStrong((id *)&self->_createNewContactAction, a3);
}

- (CNContactAddToExistingContactAction)addToExistingContactAction
{
  return self->_addToExistingContactAction;
}

- (void)setAddToExistingContactAction:(id)a3
{
  objc_storeStrong((id *)&self->_addToExistingContactAction, a3);
}

- (CNContactUpdateExistingContactAction)updateExistingContactAction
{
  return self->_updateExistingContactAction;
}

- (void)setUpdateExistingContactAction:(id)a3
{
  objc_storeStrong((id *)&self->_updateExistingContactAction, a3);
}

- (CNContactSuggestionAction)suggestedContactAction
{
  return self->_suggestedContactAction;
}

- (CNContactSelectContainersAction)selectContainersAction
{
  return self->_selectContainersAction;
}

- (void)setSelectContainersAction:(id)a3
{
  objc_storeStrong((id *)&self->_selectContainersAction, a3);
}

- (CNContactAddAddressingGrammarAction)addAddressingGrammarAction
{
  return self->_addAddressingGrammarAction;
}

- (void)setAddAddressingGrammarAction:(id)a3
{
  objc_storeStrong((id *)&self->_addAddressingGrammarAction, a3);
}

- (CNContactAction)gameCenterAddFriendAction
{
  return self->_gameCenterAddFriendAction;
}

- (void)setGameCenterAddFriendAction:(id)a3
{
  objc_storeStrong((id *)&self->_gameCenterAddFriendAction, a3);
}

- (CNCardGameCenterGroup)gameCenterGroup
{
  return self->_gameCenterGroup;
}

- (void)setRequiresGameCenterRefresh:(BOOL)a3
{
  self->_requiresGameCenterRefresh = a3;
}

- (void)setSharedProfileStateOracle:(id)a3
{
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, a3);
}

- (unint64_t)tappedSharedProfileBannerAction
{
  return self->_tappedSharedProfileBannerAction;
}

- (unint64_t)dismissedSharedProfileBannerAction
{
  return self->_dismissedSharedProfileBannerAction;
}

- (BOOL)hasPerformedSharedProfileBannerAnimation
{
  return self->_hasPerformedSharedProfileBannerAnimation;
}

- (NSLayoutConstraint)editingFloatingHeaderHeightConstraint
{
  return self->_editingFloatingHeaderHeightConstraint;
}

- (void)setEditingFloatingHeaderHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_editingFloatingHeaderHeightConstraint, a3);
}

- (void)setShareLocationController:(id)a3
{
  objc_storeStrong((id *)&self->_shareLocationController, a3);
}

- (void)setActionsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_actionsViewController, a3);
}

- (void)setActionsWrapperView:(id)a3
{
  objc_storeStrong((id *)&self->_actionsWrapperView, a3);
}

- (void)setFloatingActionsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_floatingActionsViewController, a3);
}

- (void)setFloatingActionsWrapperView:(id)a3
{
  objc_storeStrong((id *)&self->_floatingActionsWrapperView, a3);
}

- (void)setHeaderDropShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_headerDropShadowView, a3);
}

- (BOOL)hasEditingConstraints
{
  return self->_hasEditingConstraints;
}

- (BOOL)hasAvatarConstraints
{
  return self->_hasAvatarConstraints;
}

- (BOOL)hasSetupViewHierarchy
{
  return self->_hasSetupViewHierarchy;
}

- (void)setHasSetupViewHierarchy:(BOOL)a3
{
  self->_hasSetupViewHierarchy = a3;
}

- (CNMedicalIDAction)medicalIDAction
{
  return self->_medicalIDAction;
}

- (void)setEmergencyNumberIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyNumberIdentifier, a3);
}

- (void)setCardEditingActionsGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardEditingActionsGroup, a3);
}

- (void)setCardEditingDeleteContactGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardEditingDeleteContactGroup, a3);
}

- (void)setCardEditingContactContainerGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardEditingContactContainerGroup, a3);
}

- (CNContactAction)deleteContactAction
{
  return self->_deleteContactAction;
}

- (void)setDeleteContactAction:(id)a3
{
  objc_storeStrong((id *)&self->_deleteContactAction, a3);
}

- (CNContactAction)ignoreContactAction
{
  return self->_ignoreContactAction;
}

- (NSMutableArray)editingLinkedContacts
{
  return self->_editingLinkedContacts;
}

- (void)setEditingLinkedContacts:(id)a3
{
  objc_storeStrong((id *)&self->_editingLinkedContacts, a3);
}

- (CNUIGroupEditingContext)groupEditingContext
{
  return self->_groupEditingContext;
}

- (void)setGroupEditingContext:(id)a3
{
  objc_storeStrong((id *)&self->_groupEditingContext, a3);
}

- (void)setFaceTimeIDSLookupToken:(id)a3
{
  objc_storeStrong((id *)&self->_faceTimeIDSLookupToken, a3);
}

- (NSDictionary)userActivityUserInfo
{
  return self->_userActivityUserInfo;
}

- (void)setUserActivityUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityUserInfo, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (BOOL)outOfProcessSetupComplete
{
  return self->_outOfProcessSetupComplete;
}

- (void)setOutOfProcessSetupComplete:(BOOL)a3
{
  self->_outOfProcessSetupComplete = a3;
}

- (BOOL)isPresentingFullscreenForOutOfProcess
{
  return self->_isPresentingFullscreenForOutOfProcess;
}

- (void)setIsPresentingFullscreenForOutOfProcess:(BOOL)a3
{
  self->_isPresentingFullscreenForOutOfProcess = a3;
}

- (BOOL)didSetFirstResponder
{
  return self->_didSetFirstResponder;
}

- (void)setDidSetFirstResponder:(BOOL)a3
{
  self->_didSetFirstResponder = a3;
}

- (void)setHighlightedProperties:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedProperties, a3);
}

- (void)setActionsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_actionsDataSource, a3);
}

- (void)setSaveCommand:(id)a3
{
  objc_storeStrong((id *)&self->_saveCommand, a3);
}

- (void)setCancelCommand:(id)a3
{
  objc_storeStrong((id *)&self->_cancelCommand, a3);
}

- (void)setKeyboardVerticalOverlap:(double)a3
{
  self->_keyboardVerticalOverlap = a3;
}

- (void)setLayoutPositionallyAfterNavBar:(BOOL)a3
{
  self->_layoutPositionallyAfterNavBar = a3;
}

- (UIEdgeInsets)peripheryInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_peripheryInsets.top;
  left = self->_peripheryInsets.left;
  bottom = self->_peripheryInsets.bottom;
  right = self->_peripheryInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)shouldIgnoreBlockListChange
{
  return self->_shouldIgnoreBlockListChange;
}

- (void)setShouldIgnoreBlockListChange:(BOOL)a3
{
  self->_shouldIgnoreBlockListChange = a3;
}

- (BOOL)didSetNewContact
{
  return self->_didSetNewContact;
}

- (BOOL)usesBrandedCallHeaderFormat
{
  return self->_usesBrandedCallHeaderFormat;
}

- (void)setSupportsDrafts:(BOOL)a3
{
  self->_supportsDrafts = a3;
}

- (BOOL)didEditPronouns
{
  return self->_didEditPronouns;
}

- (void)setDidFindStaticIdentity:(BOOL)a3
{
  self->_didFindStaticIdentity = a3;
}

- (BOOL)hadAtLeastOneVerifiedHandle
{
  return self->_hadAtLeastOneVerifiedHandle;
}

- (void)setMainThreadScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_mainThreadScheduler, a3);
}

- (BOOL)savingPersonalSharedProfile
{
  return self->_savingPersonalSharedProfile;
}

- (void)setSavingPersonalSharedProfile:(BOOL)a3
{
  self->_savingPersonalSharedProfile = a3;
}

- (CNMutableContact)editingNicknameContact
{
  return self->_editingNicknameContact;
}

- (void)setEditingNicknameContact:(id)a3
{
  objc_storeStrong((id *)&self->_editingNicknameContact, a3);
}

- (BOOL)showContactPhotoPosterCell
{
  return self->_showContactPhotoPosterCell;
}

- (void)setShowContactPhotoPosterCell:(BOOL)a3
{
  self->_showContactPhotoPosterCell = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingNicknameContact, 0);
  objc_storeStrong((id *)&self->_pendingLayoutBlocks, 0);
  objc_storeStrong((id *)&self->_mainThreadScheduler, 0);
  objc_storeStrong((id *)&self->_ktWorkQueue, 0);
  objc_storeStrong((id *)&self->_cachedVerifiedHandles, 0);
  objc_storeStrong((id *)&self->_cachedStaticIdentity, 0);
  objc_storeStrong((id *)&self->_geminiDataSource, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_contactViewCache, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_preEditLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_cancelCommand, 0);
  objc_storeStrong((id *)&self->_editCommand, 0);
  objc_storeStrong((id *)&self->_saveCommand, 0);
  objc_storeStrong((id *)&self->_actionsDataSource, 0);
  objc_storeStrong((id *)&self->_highlightedProperties, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_userActivityUserInfo, 0);
  objc_storeStrong((id *)&self->_faceTimeIDSLookupToken, 0);
  objc_storeStrong((id *)&self->_iMessageIDSLookupToken, 0);
  objc_storeStrong((id *)&self->_groupEditingContext, 0);
  objc_storeStrong((id *)&self->_editingLinkedContacts, 0);
  objc_storeStrong((id *)&self->_siriContextProvider, 0);
  objc_storeStrong((id *)&self->_ignoreContactAction, 0);
  objc_storeStrong((id *)&self->_deleteContactAction, 0);
  objc_storeStrong((id *)&self->_cardEditingContactContainerGroup, 0);
  objc_storeStrong((id *)&self->_cardEditingGeminiGroup, 0);
  objc_storeStrong((id *)&self->_cardEditingDeleteContactGroup, 0);
  objc_storeStrong((id *)&self->_cardEditingActionsGroup, 0);
  objc_storeStrong((id *)&self->_emergencyNumberIdentifier, 0);
  objc_storeStrong((id *)&self->_medicalIDLookupToken, 0);
  objc_storeStrong((id *)&self->_medicalIDRegistrationToken, 0);
  objc_storeStrong((id *)&self->_emergencyContactAction, 0);
  objc_storeStrong((id *)&self->_medicalIDAction, 0);
  objc_storeStrong((id *)&self->_headerDropShadowView, 0);
  objc_storeStrong((id *)&self->_floatingActionsWrapperView, 0);
  objc_storeStrong((id *)&self->_floatingActionsViewController, 0);
  objc_storeStrong((id *)&self->_actionsWrapperView, 0);
  objc_storeStrong((id *)&self->_actionsViewController, 0);
  objc_storeStrong((id *)&self->_shareLocationController, 0);
  objc_storeStrong((id *)&self->_editingFloatingHeaderHeightConstraint, 0);
  objc_storeStrong((id *)&self->_floatingHeaderHeightConstraint, 0);
  objc_storeStrong((id *)&self->_headerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_activatedConstraints, 0);
  objc_storeStrong((id *)&self->_actionProvider, 0);
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, 0);
  objc_storeStrong((id *)&self->_meCardSharedProfileGroup, 0);
  objc_storeStrong((id *)&self->_cardSharedProfileGroup, 0);
  objc_storeStrong((id *)&self->_namePickingGroup, 0);
  objc_storeStrong((id *)&self->_gameCenterGroup, 0);
  objc_storeStrong((id *)&self->_gameCenterAddFriendAction, 0);
  objc_storeStrong((id *)&self->_cardGameCenterActionGroup, 0);
  objc_storeStrong((id *)&self->_gameCenterManager, 0);
  objc_storeStrong((id *)&self->_addAddressingGrammarAction, 0);
  objc_storeStrong((id *)&self->_selectContainersAction, 0);
  objc_storeStrong((id *)&self->_stopSharingWithFamilyAction, 0);
  objc_storeStrong((id *)&self->_clearRecentsDataAction, 0);
  objc_storeStrong((id *)&self->_suggestedContactAction, 0);
  objc_storeStrong((id *)&self->_updateExistingContactAction, 0);
  objc_storeStrong((id *)&self->_addToExistingContactAction, 0);
  objc_storeStrong((id *)&self->_createNewContactAction, 0);
  objc_storeStrong((id *)&self->_addNewFieldAction, 0);
  objc_storeStrong((id *)&self->_blockReportAction, 0);
  objc_storeStrong((id *)&self->_blockAction, 0);
  objc_storeStrong((id *)&self->_addFavoriteAction, 0);
  objc_storeStrong((id *)&self->_createReminderAction, 0);
  objc_storeStrong((id *)&self->_shareContactAction, 0);
  objc_storeStrong((id *)&self->_addToGroupAction, 0);
  objc_storeStrong((id *)&self->_addLinkedCardAction, 0);
  objc_storeStrong((id *)&self->_linkedCardsAction, 0);
  objc_storeStrong((id *)&self->_faceTimeAudioAction, 0);
  objc_storeStrong((id *)&self->_faceTimeAction, 0);
  objc_storeStrong((id *)&self->_sendMessageAction, 0);
  objc_storeStrong((id *)&self->_noteCell, 0);
  objc_storeStrong((id *)&self->_customActions, 0);
  objc_storeStrong((id *)&self->_cardGroupMembershipGroup, 0);
  objc_storeStrong((id *)&self->_cardLinkedCardsGroup, 0);
  objc_storeStrong((id *)&self->_cardBlockContactGroup, 0);
  objc_storeStrong((id *)&self->_cardStaticIdentityGroup, 0);
  objc_storeStrong((id *)&self->_cardMedicalIDGroup, 0);
  objc_storeStrong((id *)&self->_cardShareLocationGroup, 0);
  objc_storeStrong((id *)&self->_cardActionsGroup, 0);
  objc_storeStrong((id *)&self->_extraLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_extraRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_cachedLabelWidths, 0);
  objc_storeStrong((id *)&self->_contactViewBackgroundGradientLayer, 0);
  objc_storeStrong((id *)&self->_contactViewBackgroundView, 0);
  objc_storeStrong((id *)&self->_headerViewBackgroundColors, 0);
  objc_storeStrong((id *)&self->_groupsAfterGroup, 0);
  objc_storeStrong((id *)&self->_deletedEditingGroups, 0);
  objc_storeStrong((id *)&self->_nameEditingGroups, 0);
  objc_storeStrong((id *)&self->_editingGroups, 0);
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, 0);
  objc_storeStrong((id *)&self->_containerPicker, 0);
  objc_storeStrong((id *)&self->_previousBackGestureDelegate, 0);
  objc_storeStrong((id *)&self->_editAuthorizationController, 0);
  objc_storeStrong((id *)&self->_editingHeaderView, 0);
  objc_storeStrong((id *)&self->_displayHeaderView, 0);
  objc_storeStrong((id *)&self->_editingFloatingCollapsedHeaderView, 0);
  objc_storeStrong((id *)&self->_displayFloatingCollapsedHeaderView, 0);
  objc_storeStrong((id *)&self->_staticDisplayHeaderView, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_editingContactView, 0);
  objc_storeStrong((id *)&self->_displayContactView, 0);
  objc_storeStrong((id *)&self->_containerContext, 0);
  objc_storeStrong((id *)&self->_shadowCopyOfReadonlyContact, 0);
  objc_storeStrong((id *)&self->_issuedSaveRequestIdentifiers, 0);
  objc_storeStrong((id *)&self->_mutableContact, 0);
  objc_storeStrong((id *)&self->_mutableContactForHeaderView, 0);
  objc_destroyWeak((id *)&self->_personHeaderViewDelegate);
  objc_storeStrong((id *)&self->_personHeaderViewController, 0);
  objc_storeStrong((id *)&self->_cardFooterGroup, 0);
  objc_storeStrong((id *)&self->_cardBottomGroup, 0);
  objc_storeStrong((id *)&self->_cardTopGroup, 0);
  objc_storeStrong((id *)&self->_importantMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_alternateName, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_storeStrong((id *)&self->_contactViewConfiguration, 0);
  objc_storeStrong((id *)&self->_displayGroups, 0);
  objc_storeStrong((id *)&self->_cardFaceTimeGroup, 0);
  objc_storeStrong((id *)&self->_propertyGroups, 0);
  objc_storeStrong((id *)&self->_recentsData, 0);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_saveLinkedContactsExecutor, 0);
  objc_storeStrong((id *)&self->_saveContactExecutor, 0);
  objc_storeStrong((id *)&self->_initialPrompt, 0);
  objc_storeStrong((id *)&self->_originalContacts, 0);
  objc_storeStrong((id *)&self->_missingRequiredKeys, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_linkedPoliciesByContactIdentifier, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_destroyWeak((id *)&self->_contactDelegate);
  objc_destroyWeak((id *)&self->_pptDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayedProperties, 0);
}

uint64_t __65__CNContactContentUnitaryViewController_alertDetailsNotVerified___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishEditing:", *(_QWORD *)(a1 + 40));
}

void __71__CNContactContentUnitaryViewController_alertStaticIdentitySaveFailed___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCachedStaticIdentity:", 0);
  objc_msgSend(WeakRetained, "setCachedVerifiedHandles:", 0);
  objc_msgSend(WeakRetained, "finishEditing:", *(_QWORD *)(a1 + 32));

}

uint64_t __78__CNContactContentUnitaryViewController_setContactViewBackgroundToMatchHeader__block_invoke(int a1, id a2)
{
  return objc_msgSend(objc_retainAutorelease(a2), "CGColor");
}

void __62__CNContactContentUnitaryViewController__reloadMedicalIDGroup__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setMedicalIDRegistrationToken:", 0);
  objc_msgSend(*(id *)(a1 + 32), "unregisterHandlerForToken:", *(_QWORD *)(a1 + 40));

}

BOOL __81__CNContactContentUnitaryViewController__addMedicalIDGroupAnimated_forTableView___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  _BOOL8 v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cardLinkedCardsGroup");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v3)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cardStaticIdentityGroup");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 == v3)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "cardEditingDeleteContactGroup");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v6 == v3;

    }
  }

  return v7;
}

BOOL __68__CNContactContentUnitaryViewController_addGameCenterGroupAnimated___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

uint64_t __68__CNContactContentUnitaryViewController_addGameCenterGroupAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "property");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C967B0]);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

BOOL __74__CNContactContentUnitaryViewController_addGameCenterActionGroupAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _BOOL8 v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cardShareLocationGroup");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v3)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cardFooterGroup");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 == v3)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "cardBlockContactGroup");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v3)
      {
        v8 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "cardLinkedCardsGroup");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7 != 0;

      }
    }

  }
  return v8;
}

void __74__CNContactContentUnitaryViewController__reloadGameCenterGroupWithRefresh__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultSchedulerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__CNContactContentUnitaryViewController__reloadGameCenterGroupWithRefresh__block_invoke_2;
  v12[3] = &unk_1E204FAA0;
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v14 = v5;
  v10 = v5;
  v11 = v6;
  objc_msgSend(v9, "performBlock:", v12);

}

uint64_t __74__CNContactContentUnitaryViewController__reloadGameCenterGroupWithRefresh__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateGameCenterGroupAndActionsForContact:relationshipResults:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

BOOL __72__CNContactContentUnitaryViewController__addShareLocationGroupAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _BOOL8 v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cardFooterGroup");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v3)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cardBlockContactGroup");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 == v3)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "cardLinkedCardsGroup");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 != 0;

    }
  }

  return v7;
}

uint64_t __63__CNContactContentUnitaryViewController_shouldAddFaceTimeGroup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v6, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualIgnoringIdentifiers:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __61__CNContactContentUnitaryViewController__reloadFaceTimeGroup__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  CNCardFaceTimeGroup *v5;
  void *v6;
  CNCardFaceTimeGroup *v7;
  id WeakRetained;

  if (objc_msgSend(a2, "isAvailable"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "faceTimeIDSLookupToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancel");

    objc_msgSend(WeakRetained, "setFaceTimeIDSLookupToken:", 0);
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "cardFaceTimeGroup");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        v5 = [CNCardFaceTimeGroup alloc];
        objc_msgSend(WeakRetained, "mutableContact");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[CNCardGroup initWithContact:](v5, "initWithContact:", v6);
        objc_msgSend(WeakRetained, "setCardFaceTimeGroup:", v7);

        if ((objc_msgSend(WeakRetained, "needsReload") & 1) == 0)
          objc_msgSend(WeakRetained, "_addFaceTimeGroupAnimated:", 1);
      }
    }

  }
}

void __81__CNContactContentUnitaryViewController__updateIMessageTransportButtonsForItems___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v12 = a2;
  objc_opt_class();
  objc_msgSend(v12, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    v7 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __81__CNContactContentUnitaryViewController__updateIMessageTransportButtonsForItems___block_invoke_2;
    v15[3] = &unk_1E204FCF8;
    v16 = v5;
    objc_msgSend(v6, "_cn_firstObjectPassingTest:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 40);
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __81__CNContactContentUnitaryViewController__updateIMessageTransportButtonsForItems___block_invoke_3;
    v13[3] = &unk_1E204FD20;
    v14 = v8;
    v10 = v8;
    objc_msgSend(v9, "_cn_firstObjectPassingTest:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsIMessage:", objc_msgSend(v12, "isAvailable"));

  }
}

uint64_t __81__CNContactContentUnitaryViewController__updateIMessageTransportButtonsForItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqual:", a2);
}

uint64_t __81__CNContactContentUnitaryViewController__updateIMessageTransportButtonsForItems___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "contactProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contactProperty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __69__CNContactContentUnitaryViewController__updateExistingContactAction__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v6;
  id *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v6 + 40);
  v7 = (id *)(v6 + 40);
  v8 = v9;
  if (v9)
  {
    *v7 = 0;

    *a3 = 1;
  }
  else
  {
    objc_storeStrong(v7, a2);
  }

}

uint64_t __63__CNContactContentUnitaryViewController__displayGroupsForKeys___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "displayGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

void __72__CNContactContentUnitaryViewController_setupShareLocationActionReload___block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained;
  _QWORD block[5];
  __int128 v6;
  uint64_t v7;
  char v8;
  char v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__CNContactContentUnitaryViewController_setupShareLocationActionReload___block_invoke_3;
  block[3] = &unk_1E204FC20;
  v8 = a2;
  v6 = *(_OWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  block[4] = WeakRetained;
  v9 = *(_BYTE *)(a1 + 64);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __72__CNContactContentUnitaryViewController_setupShareLocationActionReload___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (*(_BYTE *)(a1 + 64))
  {
    CNContactsUIBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SHARE_LOCATION_STOP_SHARING_LABEL_TEXT"), &stru_1E20507A8, CFSTR("Localized"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "shareLocationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactAction contactActionWithTitle:target:selector:destructive:](CNContactAction, "contactActionWithTitle:target:selector:destructive:", v6, v7, sel_perform_, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(*(id *)(a1 + 32), "cardShareLocationGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:withTitle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  if (objc_msgSend(*(id *)(a1 + 32), "shouldAddShareLocationGroup"))
    objc_msgSend(*(id *)(a1 + 32), "_addShareLocationGroupAnimated:", 1);
  if (*(_BYTE *)(a1 + 65))
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "cardShareLocationGroup");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "contactView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reloadCardGroup:forTableView:", v14, v13);

  }
}

void __80__CNContactContentUnitaryViewController__retrieveActionsModelPreservingChanges___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", *MEMORY[0x1E0C965F8]))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __80__CNContactContentUnitaryViewController__retrieveActionsModelPreservingChanges___block_invoke_3;
    v4[3] = &unk_1E204F910;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

    objc_destroyWeak(&v6);
  }

}

void __80__CNContactContentUnitaryViewController__retrieveActionsModelPreservingChanges___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setContactSupportsTTYCalls:", objc_msgSend((id)objc_opt_class(), "actionModelIncludesTTY:", *(_QWORD *)(a1 + 32)));
  objc_msgSend(WeakRetained, "_updateAvailableTransports");

}

uint64_t __80__CNContactContentUnitaryViewController_updateContactsViewWithBlock_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__CNContactContentUnitaryViewController_updateContactsViewWithBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 1308);
  return objc_msgSend(*(id *)(a1 + 32), "reloadDataIfNeeded");
}

void __88__CNContactContentUnitaryViewController__updateContact_withMissingKeysFromRequiredKeys___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __84__CNContactContentUnitaryViewController_removeEditingItem_atIndexPath_forTableView___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;
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
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "removeEditingItem:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_updateLabelWidthForCellsInGroup:forTableView:reset:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), 1);
  v2 = objc_msgSend(*(id *)(a1 + 32), "isMultiValue");
  v3 = *(void **)(a1 + 32);
  if (!v2)
  {
    objc_msgSend(v3, "propertyItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    v7 = *(void **)(a1 + 56);
    if (v6 < 2)
    {
      v24 = *(_QWORD *)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "reloadRowsAtIndexPaths:withRowAnimation:", v8, 100);
    }
    else
    {
      v25 = *(_QWORD *)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deleteRowsAtIndexPaths:withRowAnimation:", v8, 2);
    }
    goto LABEL_15;
  }
  objc_msgSend(v3, "editingItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {

  }
  else
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "canAddEditingItem");

    if ((v9 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "contactView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 64), "section"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "deleteSections:withRowAnimation:", v17, 2);

      objc_msgSend(*(id *)(a1 + 48), "_loadEditingGroupsPreservingChanges:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setEditingGroups:", v18);

      objc_msgSend(*(id *)(a1 + 48), "deletedEditingGroups");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "arrayByAddingObject:", *(_QWORD *)(a1 + 32));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setDeletedEditingGroups:", v19);

      goto LABEL_11;
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "contactView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = *(_QWORD *)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deleteRowsAtIndexPaths:withRowAnimation:", v11, 2);

  objc_msgSend(*(id *)(a1 + 48), "contactView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 64), "section"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_reloadSectionHeaderFooters:withRowAnimation:", v13, 0);

  objc_msgSend(*(id *)(a1 + 32), "property");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0C96668]);

  if ((_DWORD)v13)
  {
    objc_msgSend(*(id *)(a1 + 48), "contactView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reloadData");
LABEL_11:

  }
  if (!*(_BYTE *)(a1 + 72) && objc_msgSend(*(id *)(a1 + 32), "canAddEditingItem"))
  {
    v20 = (void *)MEMORY[0x1E0CB36B0];
    objc_msgSend(*(id *)(a1 + 32), "editingItems");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "indexPathForRow:inSection:", objc_msgSend(v21, "count") - 1, objc_msgSend(*(id *)(a1 + 64), "section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = *(void **)(a1 + 56);
    v26 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "insertRowsAtIndexPaths:withRowAnimation:", v23, 100);

LABEL_15:
  }
}

void __96__CNContactContentUnitaryViewController_addEditingItem_atIndexPath_forTableView_shouldSetFocus___block_invoke(id *a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1[4], "isMultiValue"))
  {
    objc_msgSend(a1[5], "contactView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = a1[6];
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = &v11;
LABEL_7:
    objc_msgSend(v8, "arrayWithObjects:count:", v9, 1, v11, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadRowsAtIndexPaths:withRowAnimation:", v10, 100);

    goto LABEL_8;
  }
  v2 = objc_msgSend(a1[4], "canAddEditingItem");
  objc_msgSend(a1[5], "contactView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v12 = a1[6];
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = &v12;
    goto LABEL_7;
  }
  v13[0] = a1[6];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertRowsAtIndexPaths:withRowAnimation:", v4, 6);

  objc_msgSend(a1[5], "contactView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(a1[6], "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_reloadSectionHeaderFooters:withRowAnimation:", v6, 0);

  objc_msgSend(a1[4], "property");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C96668]);

  if (!(_DWORD)v6)
    return;
  objc_msgSend(a1[5], "contactView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");
LABEL_8:

}

uint64_t __96__CNContactContentUnitaryViewController_addEditingItem_atIndexPath_forTableView_shouldSetFocus___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    if (*(_BYTE *)(result + 48))
      return objc_msgSend(*(id *)(result + 32), "focusOnLastEditingItemInGroup:", *(_QWORD *)(result + 40));
  }
  return result;
}

uint64_t __66__CNContactContentUnitaryViewController_presentAvatarPosterEditor__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEditing:animated:", 1, 0);
}

void __104__CNContactContentUnitaryViewController_sharedProfileBannerView_didDismissWithUpdatedContact_forAction___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "contactView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteSections:withRowAnimation:", v1, 2);

}

uint64_t __104__CNContactContentUnitaryViewController_sharedProfileBannerView_didDismissWithUpdatedContact_forAction___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContact:shouldScrollToTop:", *(_QWORD *)(a1 + 40), 0);
}

_QWORD *__74__CNContactContentUnitaryViewController_bannerActionTypeForEffectiveState__block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (!result[264])
    return (id)objc_msgSend(result, "setupSharedProfileStateOracle");
  return result;
}

void __83__CNContactContentUnitaryViewController_setMenuProviderForCell_forActionGroupItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__CNContactContentUnitaryViewController_setMenuProviderForCell_forActionGroupItem___block_invoke_2;
  v5[3] = &unk_1E204F9B0;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __83__CNContactContentUnitaryViewController_setMenuProviderForCell_forActionGroupItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMenuProvider:", *(_QWORD *)(a1 + 40));
}

uint64_t __70__CNContactContentUnitaryViewController_propertyItem_willChangeValue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "property");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __93__CNContactContentUnitaryViewController_propertyCell_performActionForItem_withTransportType___block_invoke(uint64_t a1)
{
  CNPropertyTTYAction *v2;
  void *v3;
  CNPropertyTTYAction *v4;

  v2 = [CNPropertyTTYAction alloc];
  objc_msgSend(*(id *)(a1 + 32), "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNPropertyAction initWithContact:propertyItem:](v2, "initWithContact:propertyItem:", v3, *(_QWORD *)(a1 + 40));

  -[CNContactAction setDelegate:](v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[CNPropertyTTYAction performActionForItem:sender:](v4, "performActionForItem:sender:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __93__CNContactContentUnitaryViewController_propertyCell_performActionForItem_withTransportType___block_invoke_2(uint64_t a1)
{
  CNPropertyTTYRelayAction *v2;
  void *v3;
  CNPropertyTTYRelayAction *v4;

  v2 = [CNPropertyTTYRelayAction alloc];
  objc_msgSend(*(id *)(a1 + 32), "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNPropertyAction initWithContact:propertyItem:](v2, "initWithContact:propertyItem:", v3, *(_QWORD *)(a1 + 40));

  -[CNContactAction setDelegate:](v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[CNPropertyTTYRelayAction performActionForItem:sender:](v4, "performActionForItem:sender:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __57__CNContactContentUnitaryViewController_actionDidFinish___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "confirm");
  return objc_msgSend(*(id *)(a1 + 40), "reloadDataPreservingChanges:", 0);
}

uint64_t __88__CNContactContentUnitaryViewController_sender_dismissViewController_completionHandler___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t result;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[1306])
  {
    objc_msgSend(v2, "_endDisablingInterfaceAutorotation");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1306) = 0;
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __92__CNContactContentUnitaryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "shouldUseStaticHeader"))
  {
    if ((objc_msgSend(WeakRetained, "hasSetupViewHierarchy") & 1) == 0)
      objc_msgSend(WeakRetained, "setupViewHierarchy");
    objc_msgSend(WeakRetained, "setupConstraints");
    objc_msgSend(WeakRetained, "updateStaticDisplayHeaderImageVisibility");
    v1 = (id)objc_msgSend(WeakRetained, "applyContactStyle");
  }
  if (objc_msgSend(WeakRetained, "displayNavigationButtonsShouldUsePlatterStyle"))
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "userInterfaceIdiom") == 0;

    objc_msgSend(WeakRetained, "updateEditNavigationItemsAnimated:updateTintColor:", 1, v3);
  }

}

void __92__CNContactContentUnitaryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    v7 = v3;
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v3 = v7;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "contactView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "frame");
      objc_msgSend(v6, "scrollRectToVisible:animated:", 0);

      v3 = v7;
    }
  }

}

void __88__CNContactContentUnitaryViewController_authorizeEditContactWithTargetGroup_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setEditAuthorizationResult:", a2);
  if (a2 == 2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __69__CNContactContentUnitaryViewController_authorizedAddContactToGroup___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "contactView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cardGroupMembershipGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scrollContactView:toVisibleGroup:animated:", v4, v3, 0);

}

void __59__CNContactContentUnitaryViewController_addContactToGroup___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "authorizedAddContactToGroup:", *(_QWORD *)(a1 + 32));

}

void __74__CNContactContentUnitaryViewController_authorizedRemoveContactFromGroup___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "contactView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cardGroupMembershipGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scrollContactView:toVisibleGroup:animated:", v4, v3, 0);

}

void __64__CNContactContentUnitaryViewController_removeContactFromGroup___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "authorizedRemoveContactFromGroup:", *(_QWORD *)(a1 + 32));

}

void __102__CNContactContentUnitaryViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "removeContactFromGroup:", *(_QWORD *)(a1 + 32));

}

void __69__CNContactContentUnitaryViewController_setupWithOptions_readyBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "editingContactView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cardStaticIdentityGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scrollContactView:toVisibleGroup:animated:", v4, v3, 1);

}

uint64_t __62__CNContactContentUnitaryViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __78__CNContactContentUnitaryViewController_performAuthorizedSetEditing_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setupConstraintsIfNeeded");
}

uint64_t __77__CNContactContentUnitaryViewController_showUpdateTermOfAddressAlertIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __77__CNContactContentUnitaryViewController_showUpdateTermOfAddressAlertIfNeeded__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_351);
}

void __77__CNContactContentUnitaryViewController_showUpdateTermOfAddressAlertIfNeeded__block_invoke_3()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=INTERNATIONAL"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, 0);

}

void __52__CNContactContentUnitaryViewController_performSave__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "contact");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  +[CNContactContentUnitaryViewController _telemetryForContact:](CNContactContentUnitaryViewController, "_telemetryForContact:", v1);

}

void __67__CNContactContentUnitaryViewController_performSaveToSharedProfile__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nicknameProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__CNContactContentUnitaryViewController_performSaveToSharedProfile__block_invoke_2;
  v4[3] = &unk_1E204F670;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "fetchPersonalNicknameAsContactWithCompletion:", v4);

}

void __67__CNContactContentUnitaryViewController_performSaveToSharedProfile__block_invoke_332(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "editingNicknameContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setWatchWallpaperImageData:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setEditingNicknameContact:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __67__CNContactContentUnitaryViewController_performSaveToSharedProfile__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
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
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CNUILogContactCard();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412290;
    v24 = v3;
    _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] Personal nickname contact fetched from IMNicknameProvider: %@", (uint8_t *)&v23, 0xCu);
  }

  v5 = (void *)objc_msgSend(v3, "mutableCopy");
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "editingNicknameContact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v8, "mutableCopy");

  }
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "editingNicknameContact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "thumbnailImageData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImageData:", v10);

    objc_msgSend(*(id *)(a1 + 32), "editingNicknameContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "thumbnailImageData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setThumbnailImageData:", v12);

    objc_msgSend(v7, "setCropRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceIdiom");

    if (!v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "editingNicknameContact");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "wallpaper");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setWallpaper:", v16);

      objc_msgSend(*(id *)(a1 + 32), "editingNicknameContact");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "watchWallpaperImageData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setWatchWallpaperImageData:", v18);

    }
  }
  CNUILogContactCard();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_18AC56000, v19, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] Saving personal photo and poster changes to Shared Name & Photo", (uint8_t *)&v23, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "nicknameProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "freeze");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPersonalNicknameWithContact:", v22);

  objc_msgSend(*(id *)(a1 + 32), "setEditingNicknameContact:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setSavingPersonalSharedProfile:", 0);

}

BOOL __91__CNContactContentUnitaryViewController_updateEditNavigationItemsAnimated_updateTintColor___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

BOOL __91__CNContactContentUnitaryViewController_updateEditNavigationItemsAnimated_updateTintColor___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

BOOL __91__CNContactContentUnitaryViewController_updateEditNavigationItemsAnimated_updateTintColor___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

uint64_t __81__CNContactContentUnitaryViewController_removeActionWithTarget_selector_inGroup___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "matchesTarget:selector:group:inContactContentViewController:", a1[4], a1[7], a1[5], a1[6]) ^ 1;
}

uint64_t __69__CNContactContentUnitaryViewController_reloadDataPreservingChanges___block_invoke_291(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addFaceTimeGroupAnimated:", 0);
}

uint64_t __69__CNContactContentUnitaryViewController_reloadDataPreservingChanges___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSuggested");
}

void __79__CNContactContentUnitaryViewController_contactStoreDidChangeWithNotification___block_invoke(uint64_t a1)
{
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
  int v12;
  _BYTE *v13;
  void *v14;
  id v15;

  if ((objc_msgSend(*(id *)(a1 + 32), "shouldIgnoreContactStoreDidChangeNotification") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C97088]);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C97090]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 32), "issuedSaveRequestIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((!v15 || (objc_msgSend(v15, "BOOLValue") & 1) == 0)
      && objc_msgSend(v8, "count")
      && objc_msgSend(v5, "count")
      && (objc_msgSend(v5, "isSubsetOfSet:", v8) & 1) != 0)
    {
      goto LABEL_14;
    }
    if (!objc_msgSend(*(id *)(a1 + 32), "isViewLoaded"))
      goto LABEL_10;
    objc_msgSend(*(id *)(a1 + 32), "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = objc_msgSend(*(id *)(a1 + 32), "isEditing");

      if (!v12)
      {
LABEL_10:
        v13 = *(_BYTE **)(a1 + 32);
        if (!v13[1307])
        {
          objc_msgSend(v13, "contactViewCache");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "resetCache");

          objc_msgSend(*(id *)(a1 + 32), "_refetchContact");
        }
        goto LABEL_14;
      }
    }
    else
    {

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1305) = 1;
LABEL_14:

  }
}

uint64_t __70__CNContactContentUnitaryViewController_setContact_shouldScrollToTop___block_invoke_272(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isValidForContact:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1536));
}

void __68__CNContactContentUnitaryViewController_mutableContactForHeaderView__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*MEMORY[0x1E0D13878] + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithResult:error:", v2, 0);

}

id __72__CNContactContentUnitaryViewController_setForcesTransparentBackground___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "applyContactStyle");
}

+ (id)descriptorForRequiredKeysForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableKeyDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v5;
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactContentUnitaryViewController descriptorForRequiredKeysForContact:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "descriptorWithKeyDescriptors:description:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)_telemetryForContact:(id)a3
{
  id v3;
  void *v4;
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
  unint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  NSObject *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  unint64_t v35;
  _BYTE v36[128];
  _QWORD v37[3];
  _QWORD v38[5];

  v38[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v37[0] = CFSTR("PhoneNumbers");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "phoneNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v6;
  v37[1] = CFSTR("EmailAddresses");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "emailAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v9;
  v37[2] = CFSTR("PostalAddresses");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "postalAddresses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "note");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15 >> 11 >= 5)
  {
    _LargeDatabasesLowSeveritySignpostLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v16))
    {
      objc_msgSend(v3, "note");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349056;
      v33 = objc_msgSend(v17, "length");
      _os_signpost_emit_with_name_impl(&dword_18AC56000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LongContactNoteLength", " enableTelemetry=YES %{public, signpost.telemetry:number1, name=NoteLength}lu", buf, 0xCu);

    }
  }
  v27 = v3;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = v13;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v18, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "unsignedIntegerValue");

        if (v25 >= 0xA)
        {
          _LargeDatabasesLowSeveritySignpostLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v26))
          {
            *(_DWORD *)buf = 138543618;
            v33 = v23;
            v34 = 2050;
            v35 = v25;
            _os_signpost_emit_with_name_impl(&dword_18AC56000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HighContactAttributeCount", " enableTelemetry=YES %{public, signpost.telemetry:string1, name=Label}@ %{public, signpost.telemetry:number1, name=LabelCount}lu", buf, 0x16u);
          }

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v20);
  }

}

+ (BOOL)actionModelIncludesTTY:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "allActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_cn_any:", &__block_literal_global_701);

  return v4;
}

+ (BOOL)shouldShowGeminiForResult:(id)a3 contact:(id)a4
{
  void *v4;
  void *v5;
  id v7;
  void *v8;
  BOOL v9;
  int v10;
  void *v11;

  v7 = a3;
  if (v7)
  {
    objc_msgSend(a4, "phoneNumbers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") && objc_msgSend(MEMORY[0x1E0C97310], "deviceSupportsGemini"))
    {
      objc_msgSend(v7, "availableChannels");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v4, "count") > 1)
      {
        v9 = 1;
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
      objc_msgSend(v7, "channel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 1;
      v9 = 1;
      if (!objc_msgSend(v5, "isAvailable"))
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v7, "channel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_msgSend(v11, "isAvailable") & 1) == 0 && objc_msgSend(v7, "usage") == 1;

    if (!v10)
      goto LABEL_16;
    goto LABEL_14;
  }
  v9 = 0;
LABEL_17:

  return v9;
}

+ (id)BOOLStateRestorationProperties
{
  return &unk_1E20D3988;
}

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CNContactContentViewController *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v7 = (void *)MEMORY[0x1E0C97200];
  +[CNContactContentViewController descriptorForRequiredKeys](CNContactContentViewController, "descriptorForRequiredKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactWithStateRestorationCoder:store:keys:", v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v20 = v6;
    v11 = -[CNContactContentViewController initWithContact:]([CNContactContentViewController alloc], "initWithContact:", v10);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(a1, "BOOLStateRestorationProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16);
          objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            -[CNContactContentViewController setValue:forKey:](v11, "setValue:forKey:", v18, v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

    v6 = v20;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __64__CNContactContentUnitaryViewController_actionModelIncludesTTY___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0C96638]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0C96648]);

  }
  return v4;
}

@end
