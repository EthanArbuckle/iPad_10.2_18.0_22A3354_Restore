@implementation StepByStepUIViewController_ReplaceBaseStation_Config

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
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)StepByStepUIViewController_ReplaceBaseStation_Config;
  -[StepByStepUIViewController_DevicePicker loadView](&v12, sel_loadView);
  v11 = 0;
  v5 = (void *)objc_msgSend_view(self, v3, v4);
  objc_msgSend_frame(v5, v6, v7);
  self->justTextLabel2 = (UILabel *)objc_msgSend_labelViewInContainer_width_(AssistantSubUIViewController, v8, (uint64_t)&v11, v9);
  objc_msgSend_setJustTextContainerView2_(self, v10, v11);
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend_setJustTextContainerView2_(self, a2, 0);
  v3.receiver = self;
  v3.super_class = (Class)StepByStepUIViewController_ReplaceBaseStation_Config;
  -[StepByStepUIViewController dealloc](&v3, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  objc_super v10;

  v3 = a3;
  v5 = objc_msgSend_tableFooterContainerView(self, a2, a3);
  v8 = (void *)objc_msgSend_tableView(self, v6, v7);
  objc_msgSend_setTableFooterView_(v8, v9, v5);
  v10.receiver = self;
  v10.super_class = (Class)StepByStepUIViewController_ReplaceBaseStation_Config;
  -[StepByStepUIViewController_DevicePicker viewWillAppear:](&v10, sel_viewWillAppear_, v3);
}

- (void)setupEditableBaseStationName
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  const __CFString *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const __CFString *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t isSecure_keyboardType_withTag;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;

  v4 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, v2);
  v7 = (void *)objc_msgSend_inParamDict(self, v5, v6);
  v9 = (const __CFString *)objc_msgSend_objectForKey_(v7, v8, (uint64_t)CFSTR("kSBSKey_TargetBase"));
  v17 = sub_21A68E368(v9, v10, v11, v12, v13, v14, v15, v16);
  v20 = (void *)objc_msgSend_inParamDict(self, v18, v19);
  v22 = objc_msgSend_objectForKey_(v20, v21, (uint64_t)CFSTR("kSBSKey_TargetBase"));
  v30 = sub_21A68E344(v22, v23, v24, v25, v26, v27, v28, v29);
  v31 = sub_21A69154C(v17, v30);
  objc_msgSend_setPersonalizedBaseName_(self, v32, (uint64_t)v31);
  v35 = (void *)objc_msgSend_personalizedBaseName(self, v33, v34);
  if (!objc_msgSend_length(v35, v36, v37))
  {
    v40 = sub_21A691584(v17, v30);
    objc_msgSend_setPersonalizedBaseName_(self, v41, (uint64_t)v40);
  }
  v42 = (void *)objc_msgSend_outResultsDict(self, v38, v39);
  v45 = objc_msgSend_personalizedBaseName(self, v43, v44);
  objc_msgSend_setValue_forKey_(v42, v46, v45, CFSTR("kSBSKey_BaseName"));
  v49 = (void *)objc_msgSend_tableManager(self, v47, v48);
  v50 = sub_21A690C10((uint64_t)CFSTR("CustomBaseName"), qword_2550F4DE8);
  v53 = objc_msgSend_personalizedBaseName(self, v51, v52);
  v54 = sub_21A690C10((uint64_t)CFSTR("CustomBaseNamePlaceholder"), qword_2550F4DE8);
  isSecure_keyboardType_withTag = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v49, v55, 0, v50, v53, v54, 0, 0, 1937329773);
  objc_msgSend_addObject_(v4, v57, isSecure_keyboardType_withTag);
  v60 = (void *)objc_msgSend_tableManager(self, v58, v59);
  v62 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCED8], v61, (uint64_t)v4, CFSTR("sectionRows"), CFSTR("WiFiName"), CFSTR("identifier"), 0);
  objc_msgSend_addSectionInfo_(v60, v63, v62);
}

- (void)setupHeaderAndFooter
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;

  v4 = (void *)objc_msgSend_tableManager(self, a2, v2);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v4, v5, (uint64_t)CFSTR("WiFiName")) == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend_setupEditableBaseStationName(self, v6, v7);
  v8 = (void *)objc_msgSend_parentController(self, v6, v7);
  v11 = objc_msgSend_tableHeaderContainerView(self, v9, v10);
  v12 = (void *)MEMORY[0x24BDBCE30];
  v15 = objc_msgSend_justTextContainerView(self, v13, v14);
  v18 = objc_msgSend_topoView(self, v16, v17);
  v20 = objc_msgSend_arrayWithObjects_(v12, v19, v15, v18, 0);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v8, v21, v11, v20, 0);
  v24 = objc_msgSend_tableHeaderContainerView(self, v22, v23);
  v27 = (void *)objc_msgSend_tableView(self, v25, v26);
  objc_msgSend_setTableHeaderView_(v27, v28, v24);
  v31 = (void *)objc_msgSend_parentController(self, v29, v30);
  v34 = objc_msgSend_tableFooterContainerView(self, v32, v33);
  v35 = (void *)MEMORY[0x24BDBCE30];
  v38 = objc_msgSend_justTextContainerView2(self, v36, v37);
  v40 = objc_msgSend_arrayWithObjects_(v35, v39, v38, 0);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v31, v41, v34, v40, 0);
  v44 = objc_msgSend_tableFooterContainerView(self, v42, v43);
  v47 = (void *)objc_msgSend_tableView(self, v45, v46);
  objc_msgSend_setTableFooterView_(v47, v48, v44);
}

- (void)prepareParams
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;

  v4 = (void *)objc_msgSend_inParamDict(self, a2, v2);
  v6 = objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("kSBSKey_SelectorChoice"));
  if (v6)
  {
    objc_msgSend_setObject_forKey_(self->super.super.super._outResultsDict, v7, v6, CFSTR("kSBSKey_SelectorChoice"));
    v10 = (void *)objc_msgSend_inParamDict(self, v8, v9);
    v12 = (void *)objc_msgSend_objectForKey_(v10, v11, (uint64_t)CFSTR("kSBSKey_Mode"));
    if (objc_msgSend_integerValue(v12, v13, v14) == 2)
      objc_msgSend_setLeftNavigationButton_enable_hide_(self, v15, (uint64_t)CFSTR("kCancel"), 1, 0);
  }
}

- (void)updateNavigationButtons
{
  objc_msgSend_setRightNavigationButton_enable_hide_(self, a2, (uint64_t)CFSTR("kNext"), 1, 0);
}

- (void)setupDevices
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;

  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = (void *)objc_msgSend_inParamDict(self, a2, v2);
  v7 = objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("kSBSKey_BrowseRecordList"));
  v9 = (void *)objc_msgSend_arrayWithArray_(v4, v8, v7);
  if (v9)
  {
    v11 = objc_msgSend_sortedArrayUsingSelector_(v9, v10, (uint64_t)sel_ssidAndBaseNameLocalizedCaseInsensitiveCompare_);
    objc_msgSend_setSortedDevices_(self, v12, v11);
    self->super._selectedDevice = self->super._sourceBase;
    MEMORY[0x24BEDD108](self, sel_setConnectionMedium_, off_2550F49F0);
  }
}

- (id)deviceTableLabel
{
  return (id)sub_21A690C10((uint64_t)CFSTR("StepByStepStatus_ReplaceBaseStation.ChosenBaseStation"), qword_2550F4DE8);
}

- (id)devicePickerLabel
{
  return (id)sub_21A690C10((uint64_t)CFSTR("StepByStepStatus_ReplaceBaseStation.ChooseABaseStation"), qword_2550F4DE8);
}

- (void)selectedDeviceUpdated
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t ProductLocalizedStringWithFormat;
  UILabel *justTextLabel;
  char *justTextContainerView;
  const char *v10;
  void *valid;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  const char *v54;
  __CFString *v55;
  const char *v56;
  const __CFString *v57;

  v3 = objc_msgSend_nameForNetworkOrDevice_(StepByStepUtilities, a2, (uint64_t)self->super._selectedDevice);
  v5 = objc_msgSend_objectForKey_(self->super._sourceBase, v4, (uint64_t)CFSTR("raNm"));
  ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v6, (uint64_t)CFSTR("StepByStepStatus_ReplaceBaseStation%@"));
  justTextLabel = self->super.super.justTextLabel;
  justTextContainerView = (char *)self->super.super.justTextContainerView;
  valid = (void *)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(MEMORY[0x24BDD17C8], v10, ProductLocalizedStringWithFormat, CFSTR("%@"), 0, v3);
  sub_21A6829C8(justTextLabel, justTextContainerView, valid);
  v14 = objc_msgSend_tableHeaderContainerView(self, v12, v13);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v15, v14);
  v18 = objc_msgSend_tableHeaderContainerView(self, v16, v17);
  v21 = (void *)objc_msgSend_tableView(self, v19, v20);
  objc_msgSend_setTableHeaderView_(v21, v22, v18);
  v25 = (void *)objc_msgSend_inParamDict(self, v23, v24);
  v27 = (void *)objc_msgSend_objectForKey_(v25, v26, (uint64_t)CFSTR("kSBSKey_SelectorChoice"));
  v30 = objc_msgSend_integerValue(v27, v28, v29);
  v32 = objc_msgSend_selectorChoiceToReplaceOption_(StepByStepUtilities, v31, v30);
  v34 = objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v33, (uint64_t)CFSTR("ReplaceBaseRecommendOption.%@"), v32);
  v42 = sub_21A690C10(v34, qword_2550F4DE8);
  switch((_DWORD)v30)
  {
    case 0x137:
      v44 = (void *)MEMORY[0x24BDD17C8];
      v45 = sub_21A68E368((const __CFString *)self->super._targetBase, (uint64_t)v35, v36, v37, v38, v39, v40, v41);
      v53 = sub_21A68E344((uint64_t)self->super._targetBase, v46, v47, v48, v49, v50, v51, v52);
      v57 = sub_21A690D80(v45, v53, 0);
      v43 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v44, v54, v42, CFSTR("%@%@"), 0, v3, v57);
      break;
    case 0x138:
      v43 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(MEMORY[0x24BDD17C8], v35, v42, CFSTR("%@%@"), 0, v3, v5);
      break;
    case 0x139:
      v43 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(MEMORY[0x24BDD17C8], v35, v42, CFSTR("%@"), 0, v3);
      break;
    default:
      v55 = &stru_24DD08368;
      goto LABEL_9;
  }
  v55 = (__CFString *)v43;
LABEL_9:
  sub_21A6829C8(self->justTextLabel2, (char *)self->justTextContainerView2, v55);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v56, (uint64_t)self->super.super.tableHeaderContainerView);
}

- (void)validateAndUpdateNextButton
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  _BOOL8 v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;

  v4 = (void *)objc_msgSend_outResultsDict(self, a2, v2);
  if (objc_msgSend_valueForKey_(v4, v5, (uint64_t)CFSTR("kSBSKey_SourceBase")))
  {
    v8 = (void *)objc_msgSend_outResultsDict(self, v6, v7);
    v10 = (void *)objc_msgSend_valueForKey_(v8, v9, (uint64_t)CFSTR("kSBSKey_BaseName"));
    v13 = objc_msgSend_length(v10, v11, v12) != 0;
    v16 = (void *)objc_msgSend_navigationItem(self, v14, v15);
    v19 = (void *)objc_msgSend_rightBarButtonItem(v16, v17, v18);
    objc_msgSend_setEnabled_(v19, v20, v13);
  }
}

- (BOOL)shouldChangeTextField:(id)a3 atIndexPath:(id)a4 forTextIndex:(unint64_t)a5 toString:(id)a6
{
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;

  v8 = (void *)objc_msgSend_outResultsDict(self, a2, (uint64_t)a3, a4, a5);
  objc_msgSend_setValue_forKey_(v8, v9, (uint64_t)a6, CFSTR("kSBSKey_BaseName"));
  objc_msgSend_validateAndUpdateNextButton(self, v10, v11);
  return 1;
}

- (void)primaryActionSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;

  v3 = a3;
  v5 = (void *)objc_msgSend_tableManager(self, a2, a3);
  if (v3)
  {
    if (objc_msgSend_indexOfSectionWithIdentifier_(v5, v6, (uint64_t)CFSTR("WiFiName")) == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend_setupEditableBaseStationName(self, v7, v8);
    v11 = objc_msgSend_tableFooterContainerView(self, v7, v8);
  }
  else
  {
    objc_msgSend_deleteSectionWithIdentifier_(v5, v6, (uint64_t)CFSTR("WiFiName"));
    v11 = 0;
  }
  v12 = (void *)objc_msgSend_tableView(self, v9, v10);
  objc_msgSend_setTableFooterView_(v12, v13, v11);
}

- (UIView)justTextContainerView2
{
  return self->justTextContainerView2;
}

- (void)setJustTextContainerView2:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1192);
}

- (NSString)personalizedBaseName
{
  return self->personalizedBaseName;
}

- (void)setPersonalizedBaseName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1208);
}

@end
