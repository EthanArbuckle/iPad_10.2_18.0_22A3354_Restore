@implementation StepByStepUIViewController_CreateExtendOrReplace

- (void)setupInitialTableHeaderConfiguration
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;

  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = objc_msgSend_justTextContainerView(self, a2, v2);
  v8 = objc_msgSend_topoView(self, v6, v7);
  v10 = objc_msgSend_arrayWithObjects_(v4, v9, v5, v8, 0);
  v13 = (void *)objc_msgSend_parentController(self, v11, v12);
  v16 = objc_msgSend_tableHeaderContainerView(self, v14, v15);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v13, v17, v16, v10, 1);
  v20 = objc_msgSend_tableHeaderContainerView(self, v18, v19);
  v23 = (void *)objc_msgSend_tableView(self, v21, v22);
  objc_msgSend_setTableHeaderView_(v23, v24, v20);
}

- (void)setupTable
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  uint64_t RowStyleBasicWithImage_text1_text2_withTag;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  void *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  void *v67;
  const char *v68;
  id v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;

  objc_msgSend_setDelegate_(self, a2, (uint64_t)self);
  v5 = (void *)objc_msgSend_inParamDict(self, v3, v4);
  v7 = (void *)objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("kSBSKey_SelectorChoice"));
  if (v7)
  {
    v10 = objc_msgSend_integerValue(v7, v8, v9);
    v12 = objc_msgSend_selectorChoiceToMatrixTag_(StepByStepUtilities, v11, v10);
LABEL_5:
    v20 = v12;
    goto LABEL_6;
  }
  v15 = (void *)objc_msgSend_inParamDict(self, v8, v9);
  v17 = (void *)objc_msgSend_objectForKey_(v15, v16, (uint64_t)CFSTR("kSBSKey_AutoGuessRecommendation"));
  if (objc_msgSend_length(v17, v18, v19))
  {
    v12 = objc_msgSend_autoGuessRecommendationToMatrixTag_(StepByStepUtilities, v13, (uint64_t)v17);
    goto LABEL_5;
  }
  v20 = 1131570529;
LABEL_6:
  v21 = (void *)objc_msgSend_tableManager(self, v13, v14);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v21, v22, (uint64_t)CFSTR("CERR")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v28 = (void *)objc_msgSend_tableManager(self, v26, v27);
    v29 = sub_21A690C10((uint64_t)CFSTR("kCreateNetworkLabel"), qword_2550F4DE8);
    RowStyleBasicWithImage_text1_text2_withTag = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v28, v30, 0, v29, 0, 1131570529);
    objc_msgSend_addObject_(v25, v32, RowStyleBasicWithImage_text1_text2_withTag);
    v35 = (void *)objc_msgSend_tableManager(self, v33, v34);
    v36 = sub_21A690C10((uint64_t)CFSTR("AddToExistingNetwork"), qword_2550F4DE8);
    v38 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v35, v37, 0, v36, 0, 1165522021);
    objc_msgSend_addObject_(v25, v39, v38);
    v42 = (void *)objc_msgSend_tableManager(self, v40, v41);
    v43 = sub_21A690C10((uint64_t)CFSTR("kReplaceABaseStationLabel"), qword_2550F4DE8);
    v45 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v42, v44, 0, v43, 0, 1382379628);
    objc_msgSend_addObject_(v25, v46, v45);
    v49 = (void *)objc_msgSend_inParamDict(self, v47, v48);
    if (objc_msgSend_objectForKey_(v49, v50, (uint64_t)CFSTR("kSBSKey_RestoreRecommendation")))
    {
      v53 = (void *)objc_msgSend_tableManager(self, v51, v52);
      v54 = sub_21A690C10((uint64_t)CFSTR("kRestorePreviousConfig"), qword_2550F4DE8);
      v56 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v53, v55, 0, v54, 0, 1382380404);
      objc_msgSend_addObject_(v25, v57, v56);
    }
    v58 = (void *)objc_msgSend_tableManager(self, v51, v52);
    v59 = (void *)MEMORY[0x24BDBCED8];
    v61 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v60, 1);
    v63 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v62, v20);
    v65 = objc_msgSend_dictionaryWithObjectsAndKeys_(v59, v64, (uint64_t)v25, CFSTR("sectionRows"), v61, CFSTR("sectionIsMenu"), v63, CFSTR("selectedMenuItemTag"), CFSTR("CERR"), CFSTR("identifier"), 0);
    objc_msgSend_addSectionInfo_(v58, v66, v65);
  }
  v67 = (void *)objc_msgSend_tableManager(self, v23, v24);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v67, v68, (uint64_t)CFSTR("CERRFooter")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v69 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v72 = (void *)objc_msgSend_tableManager(self, v70, v71);
    v74 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCED8], v73, (uint64_t)v69, CFSTR("sectionRows"), &stru_24DD08368, CFSTR("footer"), CFSTR("CERRFooter"), CFSTR("identifier"), 0);
    objc_msgSend_addSectionInfo_(v72, v75, v74);
  }
  MEMORY[0x24BEDD108](self, sel_handleSelectorChoiceWithTag_, v20);
}

- (void)loadView
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  const char *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)StepByStepUIViewController_CreateExtendOrReplace;
  -[StepByStepUIViewController loadView](&v20, sel_loadView);
  v5 = (void *)objc_msgSend_view(self, v3, v4);
  objc_msgSend_frame(v5, v6, v7);
  v9 = v8;
  v12 = (void *)objc_msgSend_view(self, v10, v11);
  objc_msgSend_frame(v12, v13, v14);
  v18 = objc_msgSend_tableViewWithWidth_height_(AssistantSubUIViewController, v15, v16, v9, v17);
  objc_msgSend_setTableView_(self, v19, v18);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  const char *v5;
  uint64_t v6;
  UILabel *justTextLabel;
  char *justTextContainerView;
  const char *v9;
  void *ProductLocalizedStringWithFormat;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  objc_super v30;

  v3 = a3;
  objc_msgSend_setRightNavigationButton_enable_hide_(self, a2, (uint64_t)CFSTR("kNext"), 0, 0);
  objc_msgSend_setupTable(self, v5, v6);
  justTextLabel = self->super.justTextLabel;
  justTextContainerView = (char *)self->super.justTextContainerView;
  ProductLocalizedStringWithFormat = (void *)objc_msgSend_getProductLocalizedStringWithFormat_(self, v9, (uint64_t)CFSTR("StepByStepStatus_CreateExtendReplace%@"));
  sub_21A6829C8(justTextLabel, justTextContainerView, ProductLocalizedStringWithFormat);
  v13 = objc_msgSend_tableHeaderContainerView(self, v11, v12);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v14, v13);
  v17 = objc_msgSend_tableHeaderContainerView(self, v15, v16);
  v20 = (void *)objc_msgSend_tableView(self, v18, v19);
  objc_msgSend_setTableHeaderView_(v20, v21, v17);
  objc_msgSend_setupInitialTableHeaderConfiguration(self, v22, v23);
  v26 = (void *)objc_msgSend_inParamDict(self, v24, v25);
  v28 = objc_msgSend_objectForKey_(v26, v27, (uint64_t)CFSTR("kSBSKey_TargetBase"));
  objc_msgSend_syncTopoUIForTarget_andSource_andNetwork_connectionType_(self, v29, v28, 0, 0, 0);
  v30.receiver = self;
  v30.super_class = (Class)StepByStepUIViewController_CreateExtendOrReplace;
  -[StepByStepUIViewController viewWillAppear:](&v30, sel_viewWillAppear_, v3);
}

- (void)touchInCellAtIndexPath:(id)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  v5 = (void *)objc_msgSend_tableManager(self, a2, (uint64_t)a3);
  v8 = objc_msgSend_section(a3, v6, v7);
  v10 = objc_msgSend_tagOfSelectedRowInMenuSection_(v5, v9, v8);
  MEMORY[0x24BEDD108](self, sel_handleSelectorChoiceWithTag_, v10);
}

- (void)handleSelectorChoiceWithTag:(unint64_t)a3
{
  unsigned int v5;
  NSMutableDictionary *outResultsDict;
  const char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t ProductLocalizedStringWithFormat;
  uint64_t v15;

  v5 = objc_msgSend_matrixTagToSelectorChoice_(StepByStepUtilities, a2, a3);
  outResultsDict = self->super.super._outResultsDict;
  v8 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v7, v5);
  objc_msgSend_setObject_forKey_(outResultsDict, v9, v8, CFSTR("kSBSKey_SelectorChoice"));
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v10, (uint64_t)CFSTR("kNext"), 1, 0);
  v13 = &stru_24DD08368;
  if ((uint64_t)a3 > 1382379627)
  {
    if (a3 == 1382379628)
    {
      ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v11, (uint64_t)CFSTR("ReplaceFooter%@"));
      goto LABEL_10;
    }
    if (a3 == 1382380404)
    {
      ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v11, (uint64_t)CFSTR("RestoreFooter%@"));
      goto LABEL_10;
    }
  }
  else
  {
    if (a3 == 1131570529)
    {
      ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v11, (uint64_t)CFSTR("CreateFooter%@"));
      goto LABEL_10;
    }
    if (a3 == 1165522021)
    {
      ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v11, (uint64_t)CFSTR("AddToFooter%@"));
LABEL_10:
      v13 = (const __CFString *)ProductLocalizedStringWithFormat;
    }
  }
  v15 = objc_msgSend_tableManager(self, v11, v12);
  MEMORY[0x24BEDD108](v15, sel_updateFooter_forSectionWithIdentifier_, v13);
}

@end
