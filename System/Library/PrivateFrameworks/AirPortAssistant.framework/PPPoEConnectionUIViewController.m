@implementation PPPoEConnectionUIViewController

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
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const __CFString *v50;
  const char *v51;
  uint64_t RowStyleBasicWithImage_text1_text2_withTag;
  const char *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const __CFString *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const __CFString *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  objc_super v85;

  v85.receiver = self;
  v85.super_class = (Class)PPPoEConnectionUIViewController;
  -[AUUITableViewController loadView](&v85, sel_loadView);
  v5 = (void *)objc_msgSend_view(self, v3, v4);
  objc_msgSend_frame(v5, v6, v7);
  v9 = v8;
  v12 = (void *)objc_msgSend_view(self, v10, v11);
  objc_msgSend_frame(v12, v13, v14);
  v18 = (void *)objc_msgSend_tableViewWithWidth_height_(AssistantSubUIViewController, v15, v16, v9, v17);
  objc_msgSend_setTableView_(self, v19, (uint64_t)v18);
  v22 = objc_msgSend_parentController(self, v20, v21);
  objc_msgSend_setParentController_(self, v23, v22);
  objc_msgSend_setDelegate_(self, v24, (uint64_t)self);
  v27 = (void *)objc_msgSend_view(self, v25, v26);
  objc_msgSend_frame(v27, v28, v29);
  v33 = objc_msgSend_containerViewWithWidth_(AssistantSubUIViewController, v30, v31, v32);
  objc_msgSend_setTableHeaderView_(v18, v34, v33);
  objc_msgSend_setLeftNavigationButton_enable_hide_(self, v35, (uint64_t)CFSTR("kBack"), 1, 0);
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v36, (uint64_t)CFSTR("kNext"), 0, 1);
  v37 = sub_21A690CA4(1651724355);
  v41 = (void *)objc_msgSend_objectForKey_(self->super._outResultsDict, v38, v37);
  if (!v41)
    v41 = (void *)objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v39, 0);
  v42 = (void *)objc_msgSend_tableManager(self, v39, v40);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v42, v43, (uint64_t)CFSTR("PPPoEAccountInfo")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v46 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v44, v45);
    v49 = (void *)objc_msgSend_tableManager(self, v47, v48);
    v50 = sub_21A691418(1651724355, 0);
    RowStyleBasicWithImage_text1_text2_withTag = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v49, v51, 0, v50, 0, 0);
    objc_msgSend_addObject_(v46, v53, RowStyleBasicWithImage_text1_text2_withTag);
    v56 = (void *)objc_msgSend_tableManager(self, v54, v55);
    v57 = sub_21A691418(1651724355, (const char *)1);
    v59 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v56, v58, 0, v57, 0, 1);
    objc_msgSend_addObject_(v46, v60, v59);
    v63 = (void *)objc_msgSend_tableManager(self, v61, v62);
    v64 = sub_21A691418(1651724355, (const char *)2);
    v66 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v63, v65, 0, v64, 0, 2);
    objc_msgSend_addObject_(v46, v67, v66);
    v70 = (void *)objc_msgSend_tableManager(self, v68, v69);
    v71 = (void *)MEMORY[0x24BDBCED8];
    v72 = sub_21A691330(1651724355);
    v74 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v73, 1);
    v76 = objc_msgSend_dictionaryWithObjectsAndKeys_(v71, v75, (uint64_t)v46, CFSTR("sectionRows"), CFSTR("PPPoEConnectionSelectionInfo"), CFSTR("identifier"), v72, CFSTR("header"), v74, CFSTR("sectionIsMenu"), v41, CFSTR("selectedMenuItemTag"), 0);
    objc_msgSend_addSectionInfo_(v70, v77, v76);
  }
  v78 = (void *)objc_msgSend_tableManager(self, v44, v45);
  v81 = objc_msgSend_integerValue(v41, v79, v80);
  v83 = objc_msgSend_indexPathOfCellWithTag_(v78, v82, v81);
  objc_msgSend_touchInCellAtIndexPath_(self, v84, v83);
}

- (void)touchInCellAtIndexPath:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  NSMutableDictionary *outResultsDict;
  uint64_t v14;
  uint64_t v15;
  const char *v16;

  v4 = (void *)objc_msgSend_tableManager(self, a2, (uint64_t)a3);
  v6 = objc_msgSend_indexOfSectionWithIdentifier_(v4, v5, (uint64_t)CFSTR("PPPoEConnectionSelectionInfo"));
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    v10 = v6;
    v11 = (void *)objc_msgSend_tableManager(self, v7, v8);
    v9 = objc_msgSend_tagOfSelectedRowInMenuSection_(v11, v12, v10);
  }
  outResultsDict = self->super._outResultsDict;
  v14 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v7, v9);
  v15 = sub_21A690CA4(1651724355);
  objc_msgSend_setObject_forKey_(outResultsDict, v16, v14, v15);
}

@end
