@implementation PPPoEViewController

- (void)setupInitialTableHeaderConfiguration
{
  const char *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  UIView *tableHeaderContainerView;
  const char *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  UIView *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;

  objc_msgSend_setLeftNavigationButton_enable_hide_(self, a2, (uint64_t)CFSTR("kBack"), 1, 0);
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v3, (uint64_t)CFSTR("kNext"), 1, 0);
  objc_msgSend_setDelegate_(self, v4, (uint64_t)self);
  v5 = (void *)sub_21A690C10((uint64_t)CFSTR("PPPoESetupInfo"), qword_2550F4DE8);
  v8 = (void *)objc_msgSend_parentController(self, v6, v7);
  tableHeaderContainerView = self->tableHeaderContainerView;
  v11 = objc_msgSend_arrayWithObject_(MEMORY[0x24BDBCE30], v10, (uint64_t)self->justTextContainerView);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v8, v12, (uint64_t)tableHeaderContainerView, v11, 1);
  sub_21A6829C8(self->justTextLabel, (char *)self->justTextContainerView, v5);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v13, (uint64_t)self->tableHeaderContainerView);
  v14 = self->tableHeaderContainerView;
  v17 = (void *)objc_msgSend_tableView(self, v15, v16);
  objc_msgSend_setTableHeaderView_(v17, v18, (uint64_t)v14);
}

- (void)loadView
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  double v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  double v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  NSMutableDictionary *outResultsDict;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const __CFString *v54;
  void *v55;
  uint64_t v56;
  const char *v57;
  uint64_t isSecure_keyboardType_withTag;
  const char *v59;
  NSMutableDictionary *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const __CFString *v66;
  void *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  NSMutableDictionary *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  const __CFString *v78;
  void *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  void *v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  const char *v101;
  uint64_t RowStyleBasicWithImage_text1_text2_withTag;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  const char *v113;
  NSMutableDictionary *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  objc_super v119;

  v119.receiver = self;
  v119.super_class = (Class)PPPoEViewController;
  -[AUUITableViewController loadView](&v119, sel_loadView);
  v118 = 0;
  v5 = (void *)objc_msgSend_view(self, v3, v4);
  objc_msgSend_frame(v5, v6, v7);
  self->justTextLabel = (UILabel *)objc_msgSend_labelViewInContainer_width_(AssistantSubUIViewController, v8, (uint64_t)&v118, v9);
  objc_msgSend_setJustTextContainerView_(self, v10, v118);
  v13 = (void *)objc_msgSend_view(self, v11, v12);
  objc_msgSend_frame(v13, v14, v15);
  v19 = objc_msgSend_containerViewWithWidth_(AssistantSubUIViewController, v16, v17, v18);
  objc_msgSend_setTableHeaderContainerView_(self, v20, v19);
  v23 = (void *)objc_msgSend_view(self, v21, v22);
  objc_msgSend_frame(v23, v24, v25);
  v27 = v26;
  v30 = (void *)objc_msgSend_view(self, v28, v29);
  objc_msgSend_frame(v30, v31, v32);
  v36 = objc_msgSend_tableViewWithWidth_height_(AssistantSubUIViewController, v33, v34, v27, v35);
  objc_msgSend_setTableView_(self, v37, v36);
  objc_msgSend_setupInitialTableHeaderConfiguration(self, v38, v39);
  v42 = (void *)objc_msgSend_tableManager(self, v40, v41);
  v46 = 0x24BDBC000;
  if (objc_msgSend_indexOfSectionWithIdentifier_(v42, v43, (uint64_t)CFSTR("PPPoEAccountInfo")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v47 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v44, v45);
    outResultsDict = self->super._outResultsDict;
    v49 = sub_21A690CA4(1885689166);
    v51 = objc_msgSend_objectForKey_(outResultsDict, v50, v49);
    if (v51)
      v54 = (const __CFString *)v51;
    else
      v54 = &stru_24DD08368;
    v55 = (void *)objc_msgSend_tableManager(self, v52, v53);
    v56 = sub_21A691330(1885689166);
    isSecure_keyboardType_withTag = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v55, v57, 0, v56, v54, 0, 0, 0, 1885689166);
    objc_msgSend_addObject_(v47, v59, isSecure_keyboardType_withTag);
    v60 = self->super._outResultsDict;
    v61 = sub_21A690CA4(1885687895);
    v63 = objc_msgSend_objectForKey_(v60, v62, v61);
    if (v63)
      v66 = (const __CFString *)v63;
    else
      v66 = &stru_24DD08368;
    v67 = (void *)objc_msgSend_tableManager(self, v64, v65);
    v68 = sub_21A691330(1885687895);
    v70 = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v67, v69, 0, v68, v66, 0, 1, 0, 1885687895);
    objc_msgSend_addObject_(v47, v71, v70);
    v72 = self->super._outResultsDict;
    v46 = 0x24BDBC000uLL;
    v73 = sub_21A690CA4(1885688654);
    v75 = objc_msgSend_objectForKey_(v72, v74, v73);
    if (v75)
      v78 = (const __CFString *)v75;
    else
      v78 = &stru_24DD08368;
    v79 = (void *)objc_msgSend_tableManager(self, v76, v77);
    v80 = sub_21A691330(1885688654);
    v82 = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v79, v81, 0, v80, v78, 0, 0, 0, 1885688654);
    objc_msgSend_addObject_(v47, v83, v82);
    v86 = (void *)objc_msgSend_tableManager(self, v84, v85);
    v87 = (void *)MEMORY[0x24BDBCED8];
    v88 = sub_21A690C10((uint64_t)CFSTR("PPPoEAccountInformation"), qword_2550F4DE8);
    v90 = objc_msgSend_dictionaryWithObjectsAndKeys_(v87, v89, (uint64_t)v47, CFSTR("sectionRows"), v88, CFSTR("header"), CFSTR("PPPoEAccountInfo"), CFSTR("identifier"), 0);
    objc_msgSend_addSectionInfo_(v86, v91, v90);
  }
  v92 = (void *)objc_msgSend_tableManager(self, v44, v45);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v92, v93, (uint64_t)CFSTR("PPPoEConnectionInfo")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v96 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v94, v95);
    v99 = (void *)objc_msgSend_tableManager(self, v97, v98);
    v100 = sub_21A691330(1651724355);
    RowStyleBasicWithImage_text1_text2_withTag = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v99, v101, 0, v100, CFSTR("dynamicValue"), 1651724355);
    v105 = (void *)objc_msgSend_tableManager(self, v103, v104);
    objc_msgSend_setNewRow_accessoryType_(v105, v106, RowStyleBasicWithImage_text1_text2_withTag, 1);
    objc_msgSend_addObject_(v96, v107, RowStyleBasicWithImage_text1_text2_withTag);
    v110 = (void *)objc_msgSend_tableManager(self, v108, v109);
    v112 = objc_msgSend_dictionaryWithObjectsAndKeys_(*(void **)(v46 + 3800), v111, (uint64_t)v96, CFSTR("sectionRows"), CFSTR("PPPoEConnectionInfo"), CFSTR("identifier"), 0);
    objc_msgSend_addSectionInfo_(v110, v113, v112);
  }
  v114 = self->super._outResultsDict;
  v115 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v94, 0);
  v116 = sub_21A690CA4(1651724355);
  objc_msgSend_setObject_forKey_(v114, v117, v115, v116);
}

- (void)dealloc
{
  const char *v3;
  const char *v4;
  objc_super v5;

  objc_msgSend_setPppoeConnectionUIViewController_(self, a2, 0);
  objc_msgSend_setTableHeaderContainerView_(self, v3, 0);
  objc_msgSend_setJustTextContainerView_(self, v4, 0);
  v5.receiver = self;
  v5.super_class = (Class)PPPoEViewController;
  -[AssistantSubUIViewController dealloc](&v5, sel_dealloc);
}

- (id)valueForItemOfType:(id)a3 atTypeIndex:(unint64_t)a4 inCellWithTag:(int64_t)a5
{
  NSMutableDictionary *outResultsDict;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  unsigned int v11;

  if (a5 != 1651724355)
    return &stru_24DD08368;
  outResultsDict = self->super._outResultsDict;
  v6 = sub_21A690CA4(1651724355);
  v8 = (void *)objc_msgSend_objectForKey_(outResultsDict, v7, v6);
  v11 = objc_msgSend_integerValue(v8, v9, v10);
  return (id)sub_21A691418(1651724355, (const char *)v11);
}

- (BOOL)shouldChangeTextField:(id)a3 atIndexPath:(id)a4 forTextIndex:(unint64_t)a5 toString:(id)a6
{
  void *v9;
  const char *v10;
  NSMutableDictionary *outResultsDict;
  uint64_t v12;
  const char *v13;
  uint64_t v15;

  v15 = 0;
  v9 = (void *)objc_msgSend_tableManager(self, a2, (uint64_t)a3, a4, a5);
  if (objc_msgSend_tagOfCellAtIndexPath_tag_(v9, v10, (uint64_t)a4, &v15))
  {
    if (!a6)
      a6 = &stru_24DD08368;
    outResultsDict = self->super._outResultsDict;
    v12 = sub_21A690CA4(v15);
    objc_msgSend_setObject_forKey_(outResultsDict, v13, (uint64_t)a6, v12);
  }
  return 1;
}

- (void)touchInCellAtIndexPath:(id)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  PPPoEConnectionUIViewController *v11;
  const char *v12;
  id v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;

  v37 = 0;
  v5 = (void *)objc_msgSend_tableManager(self, a2, (uint64_t)a3);
  if (objc_msgSend_tagOfCellAtIndexPath_tag_(v5, v6, (uint64_t)a3, &v37) && v37 == 1651724355)
  {
    v7 = sub_21A690CA4(1651724355);
    v10 = objc_msgSend_objectForKey_(self->super._outResultsDict, v8, v7);
    if (!v10)
      v10 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v9, 0);
    v11 = [PPPoEConnectionUIViewController alloc];
    v13 = (id)objc_msgSend_initWithNibName_bundle_(v11, v12, 0, 0);
    objc_msgSend_setPppoeConnectionUIViewController_(self, v14, (uint64_t)v13);
    v17 = (void *)objc_msgSend_outResultsDict(self->pppoeConnectionUIViewController, v15, v16);
    objc_msgSend_setObject_forKey_(v17, v18, v10, v7);
    v21 = (void *)objc_msgSend_tableManager(self, v19, v20);
    objc_msgSend_endEditing(v21, v22, v23);
    v26 = (void *)objc_msgSend_navigationController(self, v24, v25);
    self->previousNavDelegate = (id)objc_msgSend_delegate(v26, v27, v28);
    v31 = (void *)objc_msgSend_navigationController(self, v29, v30);
    objc_msgSend_setDelegate_(v31, v32, (uint64_t)self);
    v35 = (void *)objc_msgSend_navigationController(self, v33, v34);
    objc_msgSend_pushViewController_animated_(v35, v36, (uint64_t)self->pppoeConnectionUIViewController, 1);
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  id previousNavDelegate;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;

  if (self->pppoeConnectionUIViewController != a4)
  {
    v6 = sub_21A690CA4(1651724355);
    v9 = (void *)objc_msgSend_outResultsDict(self->pppoeConnectionUIViewController, v7, v8);
    v11 = objc_msgSend_objectForKey_(v9, v10, v6);
    if (v11)
    {
      objc_msgSend_setObject_forKey_(self->super._outResultsDict, v12, v11, v6);
      v15 = (void *)objc_msgSend_tableView(self, v13, v14);
      objc_msgSend_reloadData(v15, v16, v17);
      previousNavDelegate = self->previousNavDelegate;
      v21 = (void *)objc_msgSend_navigationController(self, v19, v20);
      objc_msgSend_setDelegate_(v21, v22, (uint64_t)previousNavDelegate);
    }
  }
}

- (PPPoEConnectionUIViewController)pppoeConnectionUIViewController
{
  return (PPPoEConnectionUIViewController *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setPppoeConnectionUIViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (UIView)tableHeaderContainerView
{
  return self->tableHeaderContainerView;
}

- (void)setTableHeaderContainerView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1048);
}

- (UIView)justTextContainerView
{
  return self->justTextContainerView;
}

- (void)setJustTextContainerView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1056);
}

- (UILabel)justTextLabel
{
  return self->justTextLabel;
}

- (void)setJustTextLabel:(id)a3
{
  self->justTextLabel = (UILabel *)a3;
}

@end
