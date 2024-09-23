@implementation StepByStepUIViewController_ReplaceChoice

- (void)setupTable
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  uint64_t RowStyleBasicWithImage_text1_text2_withTag;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;

  v4 = (void *)objc_msgSend_inParamDict(self, a2, v2);
  v6 = (void *)objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("kSBSKey_SelectorChoice"));
  v9 = v6;
  if (v6)
  {
    v10 = objc_msgSend_integerValue(v6, v7, v8);
    if (v10 == 320)
      v12 = 1;
    else
      v12 = 2 * (v10 == 330);
    objc_msgSend_setRightNavigationButton_enable_hide_(self, v11, (uint64_t)CFSTR("kNext"), 1, 0);
  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)objc_msgSend_tableManager(self, v7, v8);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v13, v14, (uint64_t)CFSTR("ReplaceChoice")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v20 = (void *)objc_msgSend_tableManager(self, v18, v19);
    v21 = sub_21A690C10((uint64_t)CFSTR("kReplaceBaseStationLabel"), qword_2550F4DE8);
    RowStyleBasicWithImage_text1_text2_withTag = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v20, v22, 0, v21, 0, 0);
    objc_msgSend_addObject_(v17, v24, RowStyleBasicWithImage_text1_text2_withTag);
    v27 = (void *)objc_msgSend_tableManager(self, v25, v26);
    v28 = sub_21A690C10((uint64_t)CFSTR("kReplaceOtherLabel"), qword_2550F4DE8);
    v30 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v27, v29, 0, v28, 0, 2);
    objc_msgSend_addObject_(v17, v31, v30);
    v34 = (void *)objc_msgSend_tableManager(self, v32, v33);
    v35 = (void *)MEMORY[0x24BDBCED8];
    v38 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v36, 1);
    if (v9)
      v39 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v37, v12);
    else
      v39 = 0;
    v40 = objc_msgSend_dictionaryWithObjectsAndKeys_(v35, v37, (uint64_t)v17, CFSTR("sectionRows"), v38, CFSTR("sectionIsMenu"), CFSTR("ReplaceChoice"), CFSTR("identifier"), v39, CFSTR("selectedMenuItemTag"), 0);
    objc_msgSend_addSectionInfo_(v34, v41, v40);
  }
  v42 = (void *)objc_msgSend_parentController(self, v15, v16);
  v45 = objc_msgSend_tableHeaderContainerView(self, v43, v44);
  v46 = (void *)MEMORY[0x24BDBCE30];
  v49 = objc_msgSend_justTextContainerView(self, v47, v48);
  v52 = objc_msgSend_topoView(self, v50, v51);
  v54 = objc_msgSend_arrayWithObjects_(v46, v53, v49, v52, 0);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v42, v55, v45, v54, 1);
  v58 = objc_msgSend_tableHeaderContainerView(self, v56, v57);
  v61 = (void *)objc_msgSend_tableView(self, v59, v60);
  objc_msgSend_setTableHeaderView_(v61, v62, v58);
}

- (void)loadView
{
  const char *v3;
  UILabel *justTextLabel;
  const char *v5;
  uint64_t v6;
  char *v7;
  const char *v8;
  void *ProductLocalizedStringWithFormat;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)StepByStepUIViewController_ReplaceChoice;
  -[StepByStepUIViewController loadView](&v22, sel_loadView);
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v3, (uint64_t)CFSTR("kNext"), 0, 0);
  justTextLabel = self->super.justTextLabel;
  v7 = (char *)objc_msgSend_justTextContainerView(self, v5, v6);
  ProductLocalizedStringWithFormat = (void *)objc_msgSend_getProductLocalizedStringWithFormat_(self, v8, (uint64_t)CFSTR("StepByStepStatus_ReplaceChoice%@"));
  sub_21A6829C8(justTextLabel, v7, ProductLocalizedStringWithFormat);
  v12 = objc_msgSend_tableHeaderContainerView(self, v10, v11);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v13, v12);
  v16 = objc_msgSend_tableHeaderContainerView(self, v14, v15);
  v19 = (void *)objc_msgSend_tableView(self, v17, v18);
  objc_msgSend_setTableHeaderView_(v19, v20, v16);
  objc_msgSend_setDelegate_(self, v21, (uint64_t)self);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  objc_super v11;

  v3 = a3;
  objc_msgSend_setupTable(self, a2, a3);
  v7 = (void *)objc_msgSend_inParamDict(self, v5, v6);
  v9 = objc_msgSend_objectForKey_(v7, v8, (uint64_t)CFSTR("kSBSKey_TargetBase"));
  objc_msgSend_syncTopoUIForTarget_andSource_andNetwork_connectionType_(self, v10, v9, 0, 0, 0);
  v11.receiver = self;
  v11.super_class = (Class)StepByStepUIViewController_ReplaceChoice;
  -[StepByStepUIViewController viewWillAppear:](&v11, sel_viewWillAppear_, v3);
}

- (void)touchInCellAtIndexPath:(id)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *outResultsDict;
  const char *v15;
  uint64_t v16;
  const char *v17;

  v5 = (void *)objc_msgSend_tableManager(self, a2, (uint64_t)a3);
  v8 = objc_msgSend_section(a3, v6, v7);
  v10 = objc_msgSend_tagOfSelectedRowInMenuSection_(v5, v9, v8);
  v12 = 310;
  if (v10 == 1)
    v12 = 320;
  if (v10 == 2)
    v13 = 330;
  else
    v13 = v12;
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v11, (uint64_t)CFSTR("kNext"), 1, 0);
  outResultsDict = self->super.super._outResultsDict;
  v16 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v15, v13);
  objc_msgSend_setObject_forKey_(outResultsDict, v17, v16, CFSTR("kSBSKey_SelectorChoice"));
}

@end
