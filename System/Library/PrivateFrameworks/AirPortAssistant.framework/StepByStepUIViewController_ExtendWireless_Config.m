@implementation StepByStepUIViewController_ExtendWireless_Config

- (StepByStepUIViewController_ExtendWireless_Config)initWithNibName:(id)a3 bundle:(id)a4
{
  StepByStepUIViewController_ExtendWireless_Config *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)StepByStepUIViewController_ExtendWireless_Config;
  result = -[StepByStepUIViewController_DevicePicker initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
  if (result)
  {
    result->connectionType = &off_2550F49E8[0]->isa;
    result->unlocalizedStatusString = (NSString *)CFSTR("StepByStepStatus_ExtendWireless%@");
    result->isReallyJoin = 0;
  }
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  objc_super v10;

  v3 = a3;
  v5 = (void *)objc_msgSend_inParamDict(self, a2, a3);
  v7 = (void *)objc_msgSend_valueForKey_(v5, v6, (uint64_t)CFSTR("kSBSKey_SelectorChoice"));
  if (v7 && objc_msgSend_integerValue(v7, v8, v9) == 212)
  {
    self->isReallyJoin = 1;
    self->unlocalizedStatusString = (NSString *)CFSTR("PrimarySetupRecommendation_Join.Specific");
  }
  v10.receiver = self;
  v10.super_class = (Class)StepByStepUIViewController_ExtendWireless_Config;
  -[StepByStepUIViewController_DevicePicker viewWillAppear:](&v10, sel_viewWillAppear_, v3);
}

- (void)setupAndShowEditableBaseStationName
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  const __CFString *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const __CFString *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t isSecure_keyboardType_withTag;
  const char *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;

  v4 = (void *)objc_msgSend_tableManager(self, a2, v2);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v4, v5, (uint64_t)CFSTR("WiFiName")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v6, v7);
    v11 = (void *)objc_msgSend_inParamDict(self, v9, v10);
    v13 = (const __CFString *)objc_msgSend_objectForKey_(v11, v12, (uint64_t)CFSTR("kSBSKey_TargetBase"));
    v21 = sub_21A68E368(v13, v14, v15, v16, v17, v18, v19, v20);
    v24 = (void *)objc_msgSend_inParamDict(self, v22, v23);
    v26 = objc_msgSend_objectForKey_(v24, v25, (uint64_t)CFSTR("kSBSKey_TargetBase"));
    v34 = sub_21A68E344(v26, v27, v28, v29, v30, v31, v32, v33);
    v35 = sub_21A69154C(v21, v34);
    objc_msgSend_setPersonalizedBaseName_(self, v36, (uint64_t)v35);
    v39 = (void *)objc_msgSend_personalizedBaseName(self, v37, v38);
    if (!objc_msgSend_length(v39, v40, v41))
    {
      v44 = sub_21A691584(v21, v34);
      objc_msgSend_setPersonalizedBaseName_(self, v45, (uint64_t)v44);
    }
    v46 = (void *)objc_msgSend_outResultsDict(self, v42, v43);
    v49 = objc_msgSend_personalizedBaseName(self, v47, v48);
    objc_msgSend_setValue_forKey_(v46, v50, v49, CFSTR("kSBSKey_BaseName"));
    v53 = (void *)objc_msgSend_tableManager(self, v51, v52);
    v54 = sub_21A690C10((uint64_t)CFSTR("CustomBaseName"), qword_2550F4DE8);
    v57 = objc_msgSend_personalizedBaseName(self, v55, v56);
    v58 = sub_21A690C10((uint64_t)CFSTR("CustomBaseNamePlaceholder"), qword_2550F4DE8);
    isSecure_keyboardType_withTag = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v53, v59, 0, v54, v57, v58, 0, 0, 1937329773);
    objc_msgSend_addObject_(v8, v61, isSecure_keyboardType_withTag);
    v64 = (void *)objc_msgSend_tableManager(self, v62, v63);
    v66 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCED8], v65, (uint64_t)v8, CFSTR("sectionRows"), CFSTR("WiFiName"), CFSTR("identifier"), 0);
    objc_msgSend_addSectionInfo_(v64, v67, v66);
  }
}

- (void)setupHeaderAndFooter
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
  uint64_t v25;

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
  MEMORY[0x24BEDD108](self, sel_setupAndShowEditableBaseStationName, v25);
}

- (void)primaryActionSelected:(BOOL)a3
{
  void *v3;
  const char *v4;

  if (a3)
  {
    MEMORY[0x24BEDD108](self, sel_setupAndShowEditableBaseStationName, a3);
  }
  else
  {
    v3 = (void *)objc_msgSend_tableManager(self, a2, a3);
    objc_msgSend_deleteSectionWithIdentifier_(v3, v4, (uint64_t)CFSTR("WiFiName"));
  }
}

- (void)selectedDeviceUpdated
{
  uint64_t v3;
  const char *v4;
  uint64_t ProductLocalizedStringWithFormat;
  UILabel *justTextLabel;
  const char *v7;
  uint64_t v8;
  char *v9;
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

  v3 = objc_msgSend_nameForNetworkOrDevice_(StepByStepUtilities, a2, (uint64_t)self->super._selectedDevice);
  ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v4, (uint64_t)self->unlocalizedStatusString);
  justTextLabel = self->super.super.justTextLabel;
  v9 = (char *)objc_msgSend_justTextContainerView(self, v7, v8);
  valid = (void *)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(MEMORY[0x24BDD17C8], v10, ProductLocalizedStringWithFormat, CFSTR("%@"), 0, v3);
  sub_21A6829C8(justTextLabel, v9, valid);
  v14 = objc_msgSend_tableHeaderContainerView(self, v12, v13);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v15, v14);
  v18 = objc_msgSend_tableHeaderContainerView(self, v16, v17);
  v21 = (void *)objc_msgSend_tableView(self, v19, v20);
  objc_msgSend_setTableHeaderView_(v21, v22, v18);
}

- (void)updateNavigationButtons
{
  objc_msgSend_setRightNavigationButton_enable_hide_(self, a2, (uint64_t)CFSTR("kNext"), 1, 0);
}

- (id)deviceTableLabel
{
  const __CFString *v2;

  if (self->isReallyJoin)
    v2 = CFSTR("StepByStepStatus_ExtendWireless_Config.DeviceToJoin");
  else
    v2 = CFSTR("StepByStepStatus_ExtendWireless_Config.DeviceToExtend");
  return (id)sub_21A690C10((uint64_t)v2, qword_2550F4DE8);
}

- (id)devicePickerLabel
{
  return (id)sub_21A690C10((uint64_t)CFSTR("StepByStepStatus_ExtendWiredNetworkChoice.ChooseABaseStation"), qword_2550F4DE8);
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
    MEMORY[0x24BEDD108](self, sel_setConnectionMedium_, self->connectionType);
  }
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

- (NSString)personalizedBaseName
{
  return self->personalizedBaseName;
}

- (void)setPersonalizedBaseName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1208);
}

@end
