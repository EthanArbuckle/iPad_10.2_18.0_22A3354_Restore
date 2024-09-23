@implementation AssistantDiagsUsageStatsUIViewController

- (void)setUpInitialTableFooter
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  TextLinkButton *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  NSDictionary *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  NSDictionary *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;

  v4 = (void *)objc_msgSend_view(self, a2, v2);
  objc_msgSend_frame(v4, v5, v6);
  v10 = (void *)objc_msgSend_containerViewWithWidth_(AssistantSubUIViewController, v7, v8, v9);
  v11 = [TextLinkButton alloc];
  objc_msgSend_frame(v10, v12, v13);
  v16 = (id)objc_msgSend_initWithFrame_(v11, v14, v15);
  objc_msgSend_addSubview_(v10, v17, (uint64_t)v16);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v16, v18, 0);
  objc_msgSend_setDelegate_(v16, v19, (uint64_t)self);
  v20 = sub_21A690C10((uint64_t)CFSTR("DiagsAndUsageApplePrivacyHelpTitle"), (uint64_t)CFSTR("AirPortSettings"));
  objc_msgSend_setTitle_forState_(v16, v21, v20, 0);
  objc_msgSend_sizeToFit(v16, v22, v23);
  v24 = (void *)MEMORY[0x24BDD1628];
  v25 = _NSDictionaryOfVariableBindings(CFSTR("textLinkButton"), v16, 0);
  v27 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v24, v26, (uint64_t)CFSTR("V:|[textLinkButton]|"), 0, 0, v25);
  objc_msgSend_addConstraints_(v10, v28, v27);
  v29 = (void *)MEMORY[0x24BDD1628];
  v30 = _NSDictionaryOfVariableBindings(CFSTR("textLinkButton"), v16, 0);
  v32 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v29, v31, (uint64_t)CFSTR("H:|[textLinkButton]|"), 0, 0, v30);
  objc_msgSend_addConstraints_(v10, v33, v32);
  objc_msgSend_setLinkContainerView_(self, v34, (uint64_t)v10);
  v37 = (void *)objc_msgSend_tableView(self, v35, v36);
  objc_msgSend_setTableFooterView_(v37, v38, (uint64_t)v10);
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend_setLinkContainerView_(self, a2, 0);
  v3.receiver = self;
  v3.super_class = (Class)AssistantDiagsUsageStatsUIViewController;
  -[AssistantSubUIViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  const char *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  double v10;
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
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t RowStyleBasicWithImage_text1_text2_withTag;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  NSMutableDictionary *outResultsDict;
  uint64_t v56;
  const char *v57;
  const char *v58;
  objc_super v59;

  v59.receiver = self;
  v59.super_class = (Class)AssistantDiagsUsageStatsUIViewController;
  -[AUUITableViewController loadView](&v59, sel_loadView);
  objc_msgSend_setDelegate_(self, v3, (uint64_t)self);
  v6 = (void *)objc_msgSend_view(self, v4, v5);
  objc_msgSend_frame(v6, v7, v8);
  v10 = v9;
  v13 = (void *)objc_msgSend_view(self, v11, v12);
  objc_msgSend_frame(v13, v14, v15);
  v19 = objc_msgSend_tableViewWithWidth_height_(AssistantSubUIViewController, v16, v17, v10, v18);
  objc_msgSend_setTableView_(self, v20, v19);
  objc_msgSend_setLeftNavigationButton_enable_hide_(self, v21, (uint64_t)CFSTR("kBack"), 1, 0);
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v22, (uint64_t)CFSTR("kNext"), 0, 0);
  v25 = (void *)objc_msgSend_tableManager(self, v23, v24);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v25, v26, (uint64_t)CFSTR("SendDontSend")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v29 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v27, v28);
    v32 = (void *)objc_msgSend_tableManager(self, v30, v31);
    v33 = sub_21A690C10((uint64_t)CFSTR("DiagsAndUsageSend"), (uint64_t)CFSTR("AirPortSettings"));
    RowStyleBasicWithImage_text1_text2_withTag = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v32, v34, 0, v33, 0, 1399156324);
    objc_msgSend_addObject_(v29, v36, RowStyleBasicWithImage_text1_text2_withTag);
    v39 = (void *)objc_msgSend_tableManager(self, v37, v38);
    v40 = sub_21A690C10((uint64_t)CFSTR("DiagsAndUsageDontSend"), (uint64_t)CFSTR("AirPortSettings"));
    v42 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v39, v41, 0, v40, 0, 1315918692);
    objc_msgSend_addObject_(v29, v43, v42);
    v46 = (void *)objc_msgSend_tableManager(self, v44, v45);
    v47 = (void *)MEMORY[0x24BDBCED8];
    v49 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v48, 1);
    v50 = sub_21A690C10((uint64_t)CFSTR("DiagsAndUsageTitle"), (uint64_t)CFSTR("AirPortSettings"));
    v51 = sub_21A690C10((uint64_t)CFSTR("DiagsAndUsageHelpAppleText"), (uint64_t)CFSTR("AirPortSettings"));
    v53 = objc_msgSend_dictionaryWithObjectsAndKeys_(v47, v52, (uint64_t)v29, CFSTR("sectionRows"), v49, CFSTR("sectionIsMenu"), v50, CFSTR("header"), v51, CFSTR("footer"), CFSTR("SendDontSend"), CFSTR("identifier"), 0);
    objc_msgSend_addSectionInfo_(v46, v54, v53);
  }
  objc_msgSend_setUpInitialTableFooter(self, v27, v28);
  outResultsDict = self->super._outResultsDict;
  v56 = sub_21A690CA4(1937011781);
  if (objc_msgSend_objectForKey_(outResultsDict, v57, v56))
    objc_msgSend_setRightNavigationButton_enable_hide_(self, v58, (uint64_t)CFSTR("kNext"), 1, 0);
}

- (void)touchInCellAtIndexPath:(id)a3
{
  void *v5;
  const char *v6;
  const char *v7;
  NSMutableDictionary *outResultsDict;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;

  v13 = 0;
  v5 = (void *)objc_msgSend_tableManager(self, a2, (uint64_t)a3);
  objc_msgSend_tagOfCellAtIndexPath_tag_(v5, v6, (uint64_t)a3, &v13);
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v7, (uint64_t)CFSTR("kNext"), 1, 0);
  outResultsDict = self->super._outResultsDict;
  v10 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v9, v13 == 1399156324);
  v11 = sub_21A690CA4(1937011781);
  objc_msgSend_setValue_forKey_(outResultsDict, v12, v10, v11);
}

- (void)handleTextLinkTap
{
  DiagsPrivacyHelpViewController *v3;
  const char *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;

  v3 = [DiagsPrivacyHelpViewController alloc];
  v5 = (id)objc_msgSend_initWithNibName_bundle_(v3, v4, 0, 0);
  v8 = (void *)objc_msgSend_navigationController(self, v6, v7);
  objc_msgSend_pushViewController_animated_(v8, v9, (uint64_t)v5, 1);
}

- (UIView)linkContainerView
{
  return self->_linkContainerView;
}

- (void)setLinkContainerView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1048);
}

@end
