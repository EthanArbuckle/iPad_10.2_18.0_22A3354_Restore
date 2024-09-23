@implementation StepByStepUIViewController_Join_Config

- (StepByStepUIViewController_Join_Config)initWithNibName:(id)a3 bundle:(id)a4
{
  StepByStepUIViewController_Join_Config *v4;
  const char *v5;
  StepByStepUIViewController_Join_Config *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)StepByStepUIViewController_Join_Config;
  v4 = -[StepByStepUIViewController_DevicePicker initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  v6 = v4;
  if (v4)
  {
    v4->super._showSingleBaseTopo = 1;
    objc_msgSend_setDelegate_(v4, v5, (uint64_t)v4);
  }
  return v6;
}

- (void)loadView
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)StepByStepUIViewController_Join_Config;
  -[StepByStepUIViewController_DevicePicker loadView](&v10, sel_loadView);
  v5 = (void *)objc_msgSend_inParamDict(self, v3, v4);
  v7 = (void *)objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("kSBSKey_Mode"));
  if (objc_msgSend_integerValue(v7, v8, v9) == 2)
    self->super.showFullList = 0;
}

- (BOOL)shouldChangeTextField:(id)a3 atIndexPath:(id)a4 forTextIndex:(unint64_t)a5 toString:(id)a6
{
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v16;

  v16 = 0;
  v9 = (void *)objc_msgSend_tableManager(self, a2, (uint64_t)a3, a4, a5);
  objc_msgSend_tagOfCellAtIndexPath_tag_(v9, v10, (uint64_t)a4, &v16);
  if (v16 == 1937329773)
  {
    v13 = (void *)objc_msgSend_outResultsDict(self, v11, v12);
    objc_msgSend_setValue_forKey_(v13, v14, (uint64_t)a6, CFSTR("kSBSKey_BaseName"));
  }
  return 1;
}

- (void)setupEditableBaseStationName
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const __CFString *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const __CFString *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  char v29;
  const char *v30;
  uint64_t v31;
  int deviceKind;
  const __CFString *v33;
  void *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  void *isSecure_keyboardType_withTag;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;

  v3 = sub_21A682B88(1937329773, a2);
  v6 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v4, v5);
  v9 = (void *)objc_msgSend_personalizedBaseName(self, v7, v8);
  if (!objc_msgSend_length(v9, v10, v11))
  {
    v14 = sub_21A69154C(self->productID, self->deviceKind);
    objc_msgSend_setPersonalizedBaseName_(self, v15, (uint64_t)v14);
  }
  v16 = (void *)objc_msgSend_personalizedBaseName(self, v12, v13);
  if (!objc_msgSend_length(v16, v17, v18))
  {
    v21 = sub_21A691584(self->productID, self->deviceKind);
    objc_msgSend_setPersonalizedBaseName_(self, v22, (uint64_t)v21);
  }
  v23 = (void *)objc_msgSend_outResultsDict(self, v19, v20);
  v26 = objc_msgSend_personalizedBaseName(self, v24, v25);
  objc_msgSend_setValue_forKey_(v23, v27, v26, CFSTR("kSBSKey_BaseName"));
  v29 = objc_msgSend_scanInfoSupportsSpruce_(WiFiUtils, v28, (uint64_t)self->super.super.super._inParamDict);
  self->supportsSpruce = v29;
  if ((v29 & 1) == 0)
  {
    deviceKind = self->deviceKind;
    if ((deviceKind - 2) >= 2)
    {
      if (deviceKind == 4)
        v33 = CFSTR("CustomBaseName.MFiAccessory");
      else
        v33 = CFSTR("CustomBaseName");
    }
    else
    {
      v3 = sub_21A682B88(1635077710, v30);
      v33 = CFSTR("CustomBaseName.Airplay");
    }
    v34 = (void *)objc_msgSend_tableManager(self, v30, v31);
    v35 = sub_21A690C10((uint64_t)v33, qword_2550F4DE8);
    v38 = objc_msgSend_personalizedBaseName(self, v36, v37);
    v39 = sub_21A690C10((uint64_t)CFSTR("CustomBaseNamePlaceholder"), qword_2550F4DE8);
    isSecure_keyboardType_withTag = (void *)objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v34, v40, 0, v35, v38, v39, 0, 0, 1937329773);
    v43 = (uint64_t)isSecure_keyboardType_withTag;
    if (v3)
      objc_msgSend_setObject_forKey_(isSecure_keyboardType_withTag, v42, v3, CFSTR("nsFormatter"));
    objc_msgSend_addObject_(v6, v42, v43);
    v46 = (void *)objc_msgSend_tableManager(self, v44, v45);
    v48 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCED8], v47, (uint64_t)v6, CFSTR("sectionRows"), CFSTR("WiFiName"), CFSTR("identifier"), 0);
    objc_msgSend_addSectionInfo_(v46, v49, v48);
  }
}

- (void)setupHeaderAndFooter
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  UILabel *justTextLabel;
  const char *v25;
  uint64_t v26;
  char *v27;
  const char *v28;
  void *ProductLocalizedStringWithFormat;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;

  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = objc_msgSend_justTextContainerView(self, a2, v2);
  v9 = (void *)objc_msgSend_arrayWithObject_(v4, v6, v5);
  if ((self->deviceKind - 2) >= 3)
  {
    v10 = objc_msgSend_topoView(self, v7, v8);
    objc_msgSend_addObject_(v9, v11, v10);
  }
  v12 = (void *)objc_msgSend_parentController(self, v7, v8);
  v15 = objc_msgSend_tableHeaderContainerView(self, v13, v14);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v12, v16, v15, v9, 1);
  v19 = objc_msgSend_tableHeaderContainerView(self, v17, v18);
  v22 = (void *)objc_msgSend_tableView(self, v20, v21);
  objc_msgSend_setTableHeaderView_(v22, v23, v19);
  justTextLabel = self->super.super.justTextLabel;
  v27 = (char *)objc_msgSend_justTextContainerView(self, v25, v26);
  ProductLocalizedStringWithFormat = (void *)objc_msgSend_getProductLocalizedStringWithFormat_(self, v28, (uint64_t)CFSTR("PrimarySetupRecommendation_Join%@"));
  sub_21A6829C8(justTextLabel, v27, ProductLocalizedStringWithFormat);
  v32 = objc_msgSend_tableHeaderContainerView(self, v30, v31);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v33, v32);
  v36 = objc_msgSend_tableHeaderContainerView(self, v34, v35);
  v39 = (void *)objc_msgSend_tableView(self, v37, v38);
  objc_msgSend_setTableHeaderView_(v39, v40, v36);
  objc_msgSend_setupTable(self, v41, v42);
}

- (void)primaryActionSelected:(BOOL)a3
{
  const char *v4;
  uint64_t v5;

  objc_msgSend_setupTable(self, a2, a3);
  objc_msgSend_validateAndUpdateNextButton(self, v4, v5);
}

- (void)prepareParams
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const __CFString *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  int v38;
  const char *v39;
  uint64_t v40;
  const char *v41;

  v4 = (void *)objc_msgSend_inParamDict(self, a2, v2);
  v6 = objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("kSBSKey_NetworkPassword"));
  if (v6)
    objc_msgSend_setValue_forKey_(self->super.super.super._outResultsDict, v7, v6, CFSTR("kSBSKey_NetworkPassword"));
  v9 = (void *)objc_msgSend_inParamDict(self, v7, v8);
  v11 = (void *)objc_msgSend_objectForKey_(v9, v10, (uint64_t)CFSTR("kSBSKey_Mode"));
  if (objc_msgSend_integerValue(v11, v12, v13) == 2)
    objc_msgSend_setLeftNavigationButton_enable_hide_(self, v14, (uint64_t)CFSTR("kCancel"), 1, 0);
  v16 = (void *)objc_msgSend_inParamDict(self, v14, v15);
  v18 = (const __CFString *)objc_msgSend_objectForKey_(v16, v17, (uint64_t)CFSTR("kSBSKey_TargetBase"));
  if (v18)
  {
    v26 = (uint64_t)v18;
    self->productID = sub_21A68E368(v18, (uint64_t)v19, v20, v21, v22, v23, v24, v25);
    self->deviceKind = sub_21A68E344(v26, v27, v28, v29, v30, v31, v32, v33);
  }
  else
  {
    v34 = (void *)objc_msgSend_inParamDict(self, v19, v20);
    v36 = objc_msgSend_objectForKey_(v34, v35, (uint64_t)CFSTR("kSBSKey_TargetNetwork"));
    self->productID = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, v37, v36);
    v38 = sub_21A68E2C8(v36);
    self->deviceKind = v38;
    if ((v38 - 3) <= 1)
    {
      v40 = objc_msgSend_scanInfoFriendlyName_(WiFiUtils, v39, v36);
      objc_msgSend_setPersonalizedBaseName_(self, v41, v40);
    }
  }
}

- (void)updateNavigationButtons
{
  objc_msgSend_setRightNavigationButton_enable_hide_(self, a2, (uint64_t)CFSTR("kNext"), 0, 0);
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
  v7 = objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("kSBSKey_NetworkScanRecordList"));
  v9 = (void *)objc_msgSend_arrayWithArray_(v4, v8, v7);
  if (v9)
  {
    v11 = objc_msgSend_sortedArrayUsingSelector_(v9, v10, (uint64_t)sel_ssidLocalizedCaseInsensitiveCompare_);
    objc_msgSend_setSortedDevices_(self, v12, v11);
    self->super._selectedDevice = self->super._sourceNetwork;
    MEMORY[0x24BEDD108](self, sel_setConnectionMedium_, off_2550F49E8[0]);
  }
}

- (id)deviceTableLabel
{
  return (id)sub_21A690C10((uint64_t)CFSTR("StepByStepStatus_Join.ChosenNetwork"), qword_2550F4DE8);
}

- (id)devicePickerLabel
{
  return (id)sub_21A690C10((uint64_t)CFSTR("StepByStepStatus_Join.ChooseANetwork"), qword_2550F4DE8);
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
  const char *v23;
  uint64_t v24;
  uint64_t shouldEnableNextButton;
  const char *v26;

  v3 = objc_msgSend_nameForNetworkOrDevice_(StepByStepUtilities, a2, (uint64_t)self->super._selectedDevice);
  ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v4, (uint64_t)CFSTR("PrimarySetupRecommendation_Join.Specific%@"));
  justTextLabel = self->super.super.justTextLabel;
  v9 = (char *)objc_msgSend_justTextContainerView(self, v7, v8);
  valid = (void *)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(MEMORY[0x24BDD17C8], v10, ProductLocalizedStringWithFormat, CFSTR("%@"), 0, v3);
  sub_21A6829C8(justTextLabel, v9, valid);
  v14 = objc_msgSend_tableHeaderContainerView(self, v12, v13);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v15, v14);
  v18 = objc_msgSend_tableHeaderContainerView(self, v16, v17);
  v21 = (void *)objc_msgSend_tableView(self, v19, v20);
  objc_msgSend_setTableHeaderView_(v21, v22, v18);
  shouldEnableNextButton = objc_msgSend_shouldEnableNextButton(self, v23, v24);
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v26, (uint64_t)CFSTR("kNext"), shouldEnableNextButton, 0);
}

- (BOOL)showMoreOptions
{
  return (self->deviceKind - 5) < 0xFFFFFFFD;
}

- (NSString)personalizedBaseName
{
  return self->personalizedBaseName;
}

- (void)setPersonalizedBaseName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1192);
}

- (BOOL)shouldEnableNextButton
{
  uint64_t v2;
  RecommendationActionController *actionController;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  int deviceKind;
  void *v20;
  const char *v21;
  void *ValueForFirstItemOfType_inCellWithTag;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  void **p_outResultsDict;
  const char *v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;

  actionController = self->super.actionController;
  if (actionController && !objc_msgSend_isPrimaryRecommendation(actionController, a2, v2))
    goto LABEL_5;
  v5 = (void *)objc_msgSend_nameForNetworkOrDevice_(StepByStepUtilities, a2, (uint64_t)self->super._selectedDevice);
  v8 = objc_msgSend_length(v5, v6, v7);
  if (v8)
  {
    if (self->supportsSpruce)
    {
LABEL_5:
      LOBYTE(v8) = 1;
      return v8;
    }
    v11 = (void *)objc_msgSend_outResultsDict(self, v9, v10);
    v13 = (void *)objc_msgSend_valueForKey_(v11, v12, (uint64_t)CFSTR("kSBSKey_BaseName"));
    v16 = (const char *)objc_msgSend_UTF8String(v13, v14, v15);
    LODWORD(v8) = sub_21A68FBE0(v16);
    if (!(_DWORD)v8)
      return v8;
    deviceKind = self->deviceKind;
    if ((deviceKind - 2) > 2)
    {
      v40 = (void *)objc_msgSend_tableManager(self, v17, v18);
      ValueForFirstItemOfType_inCellWithTag = (void *)objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v40, v41, (uint64_t)CFSTR("editTextView"), 1113673825);
      v44 = (void *)objc_msgSend_tableManager(self, v42, v43);
      v46 = objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v44, v45, (uint64_t)CFSTR("editTextView"), 1113673814);
      v49 = (void *)objc_msgSend_tableManager(self, v47, v48);
      LODWORD(v8) = objc_msgSend_verifyStr1_forTag1_matchesStr2_forTag2_(v49, v50, (uint64_t)ValueForFirstItemOfType_inCellWithTag, 1113673825, v46, 1113673814);
      if ((_DWORD)v8)
      {
        v53 = (const char *)objc_msgSend_UTF8String(ValueForFirstItemOfType_inCellWithTag, v51, v52);
        LODWORD(v8) = sub_21A68FC1C(v53);
        if ((_DWORD)v8)
        {
          p_outResultsDict = (void **)&self->super.super.super._outResultsDict;
          goto LABEL_19;
        }
      }
    }
    else
    {
      if (deviceKind == 4)
        goto LABEL_5;
      v20 = (void *)objc_msgSend_tableManager(self, v17, v18);
      ValueForFirstItemOfType_inCellWithTag = (void *)objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v20, v21, (uint64_t)CFSTR("editTextView"), 1097420897);
      v25 = (void *)objc_msgSend_tableManager(self, v23, v24);
      v27 = (void *)objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v25, v26, (uint64_t)CFSTR("editTextView"), 1097420886);
      v30 = (void *)objc_msgSend_tableManager(self, v28, v29);
      LODWORD(v8) = objc_msgSend_verifyStr1_forTag1_matchesStr2_forTag2_(v30, v31, (uint64_t)ValueForFirstItemOfType_inCellWithTag, 1097420897, v27, 1097420886);
      if (!(_DWORD)v8)
        return v8;
      if (!objc_msgSend_length(ValueForFirstItemOfType_inCellWithTag, v32, v33) && !objc_msgSend_length(v27, v34, v35))
        goto LABEL_5;
      v36 = (const char *)objc_msgSend_UTF8String(ValueForFirstItemOfType_inCellWithTag, v34, v35);
      LODWORD(v8) = sub_21A68FC58(v36);
      if ((_DWORD)v8)
      {
        LODWORD(v8) = sub_21A68FC1C(v36);
        if ((_DWORD)v8)
        {
          p_outResultsDict = (void **)&self->super.super.super._outResultsDict;
          objc_msgSend_setValue_forKey_(*p_outResultsDict, v37, (uint64_t)ValueForFirstItemOfType_inCellWithTag, CFSTR("kSBSKey_AirPlayPassword"));
LABEL_19:
          objc_msgSend_setValue_forKey_(*p_outResultsDict, v39, (uint64_t)ValueForFirstItemOfType_inCellWithTag, CFSTR("kSBSKey_BasePassword"));
          goto LABEL_5;
        }
      }
    }
  }
  return v8;
}

- (void)validateAndUpdateNextButton
{
  uint64_t v2;
  uint64_t shouldEnableNextButton;
  const char *v5;

  shouldEnableNextButton = objc_msgSend_shouldEnableNextButton(self, a2, v2);
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v5, (uint64_t)CFSTR("kNext"), shouldEnableNextButton, 0);
}

- (void)setupTable
{
  uint64_t v2;
  RecommendationActionController *actionController;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *isSecure_keyboardType_withTag;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  void *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  void *v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;

  actionController = self->super.actionController;
  if (actionController && !objc_msgSend_isPrimaryRecommendation(actionController, a2, v2))
  {
    v90 = (void *)objc_msgSend_tableManager(self, a2, v2);
    objc_msgSend_deleteSectionWithIdentifier_(v90, v91, (uint64_t)CFSTR("kBasePasswordIdentifier"));
    v94 = (void *)objc_msgSend_tableManager(self, v92, v93);
    objc_msgSend_deleteSectionWithIdentifier_(v94, v95, (uint64_t)CFSTR("WiFiName"));
    v98 = (void *)objc_msgSend_tableManager(self, v96, v97);
    objc_msgSend_deleteSectionWithIdentifier_(v98, v99, (uint64_t)CFSTR("kirPlayPasswordIdentifier"));
  }
  else
  {
    v5 = (void *)objc_msgSend_tableManager(self, a2, v2);
    if (objc_msgSend_indexOfSectionWithIdentifier_(v5, v6, (uint64_t)CFSTR("WiFiName")) == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend_setupEditableBaseStationName(self, v7, v8);
    if ((self->deviceKind - 2) >= 3)
    {
      v9 = (void *)objc_msgSend_tableManager(self, v7, v8);
      if (objc_msgSend_indexOfSectionWithIdentifier_(v9, v10, (uint64_t)CFSTR("kBasePasswordIdentifier")) == 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = objc_msgSend_objectForKey_(self->super.super.super._outResultsDict, v7, (uint64_t)CFSTR("kSBSKey_BasePassword"));
        v14 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v12, v13);
        v17 = (void *)objc_msgSend_tableManager(self, v15, v16);
        v18 = sub_21A690C10((uint64_t)CFSTR("PasswordLabel"), qword_2550F4DE8);
        v19 = sub_21A690C10((uint64_t)CFSTR("CreatePasswordPlaceholder"), qword_2550F4DE8);
        isSecure_keyboardType_withTag = (void *)objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v17, v20, 0, v18, v11, v19, 1, 1, 1113673825);
        v25 = sub_21A682B88(1651721296, v22);
        if (v25)
          objc_msgSend_setObject_forKey_(isSecure_keyboardType_withTag, v23, v25, CFSTR("nsFormatter"));
        v26 = (void *)objc_msgSend_tableManager(self, v23, v24);
        objc_msgSend_setNewRow_verifierAccessoryType_(v26, v27, (uint64_t)isSecure_keyboardType_withTag, 0);
        objc_msgSend_addObject_(v14, v28, (uint64_t)isSecure_keyboardType_withTag);
        v31 = (void *)objc_msgSend_tableManager(self, v29, v30);
        v32 = sub_21A690C10((uint64_t)CFSTR("VerifyLabel"), qword_2550F4DE8);
        v33 = sub_21A690C10((uint64_t)CFSTR("VerifyPlaceholder"), qword_2550F4DE8);
        v35 = (void *)objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v31, v34, 0, v32, v11, v33, 1, 1, 1113673814);
        v38 = (uint64_t)v35;
        if (v25)
          objc_msgSend_setObject_forKey_(v35, v36, v25, CFSTR("nsFormatter"));
        v39 = (void *)objc_msgSend_tableManager(self, v36, v37);
        objc_msgSend_setNewRow_verifierAccessoryType_(v39, v40, v38, 0);
        objc_msgSend_addObject_(v14, v41, v38);
        v42 = sub_21A690C10((uint64_t)CFSTR("AdminPasswordSectionTitle"), qword_2550F4DE8);
        v45 = (void *)objc_msgSend_tableManager(self, v43, v44);
        v47 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCED8], v46, (uint64_t)v14, CFSTR("sectionRows"), v42, CFSTR("header"), CFSTR("kBasePasswordIdentifier"), CFSTR("identifier"), 0);
        objc_msgSend_addSectionInfo_(v45, v48, v47);
      }
    }
    if ((self->deviceKind & 0xFFFFFFFE) == 2)
    {
      v49 = (void *)objc_msgSend_tableManager(self, v7, v8);
      if (objc_msgSend_indexOfSectionWithIdentifier_(v49, v50, (uint64_t)CFSTR("kirPlayPasswordIdentifier")) == 0x7FFFFFFFFFFFFFFFLL)
      {
        v52 = objc_msgSend_objectForKey_(self->super.super.super._outResultsDict, v51, (uint64_t)CFSTR("kSBSKey_AirPlayPassword"));
        v55 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v53, v54);
        v58 = (void *)objc_msgSend_tableManager(self, v56, v57);
        v59 = sub_21A690C10((uint64_t)CFSTR("PasswordLabel"), qword_2550F4DE8);
        v60 = sub_21A690C10((uint64_t)CFSTR("AirPlayPasswordPlaceholder"), qword_2550F4DE8);
        v62 = (void *)objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v58, v61, 0, v59, v52, v60, 1, 1, 1097420897);
        v66 = sub_21A682B88(1651720528, v63);
        if (v66)
          objc_msgSend_setObject_forKey_(v62, v64, v66, CFSTR("nsFormatter"));
        v67 = (void *)objc_msgSend_tableManager(self, v64, v65);
        objc_msgSend_setNewRow_verifierAccessoryType_(v67, v68, (uint64_t)v62, 0);
        objc_msgSend_addObject_(v55, v69, (uint64_t)v62);
        v72 = (void *)objc_msgSend_tableManager(self, v70, v71);
        v73 = sub_21A690C10((uint64_t)CFSTR("VerifyLabel"), qword_2550F4DE8);
        v74 = sub_21A690C10((uint64_t)CFSTR("AirPlayVerifyPlaceholder"), qword_2550F4DE8);
        v76 = (void *)objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v72, v75, 0, v73, v52, v74, 1, 1, 1097420886);
        v79 = (uint64_t)v76;
        if (v66)
          objc_msgSend_setObject_forKey_(v76, v77, v66, CFSTR("nsFormatter"));
        v80 = (void *)objc_msgSend_tableManager(self, v77, v78);
        objc_msgSend_setNewRow_verifierAccessoryType_(v80, v81, v79, 0);
        objc_msgSend_addObject_(v55, v82, v79);
        v83 = sub_21A690C10((uint64_t)CFSTR("AirPlayPasswordSectionTitle"), qword_2550F4DE8);
        v86 = (void *)objc_msgSend_tableManager(self, v84, v85);
        v88 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCED8], v87, (uint64_t)v55, CFSTR("sectionRows"), v83, CFSTR("header"), CFSTR("kirPlayPasswordIdentifier"), CFSTR("identifier"), 0);
        objc_msgSend_addSectionInfo_(v86, v89, v88);
      }
    }
  }
}

- (void)syncTopoUIForTarget:(id)a3 andSource:(id)a4 andNetwork:(id)a5 connectionType:(id)a6
{
  void *v9;
  unsigned int v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  const char *v36;
  const char *v37;
  const __CFString *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  void *v64;
  const __CFString *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  if (a4)
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    v10 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, a2, (uint64_t)a4);
    v12 = objc_msgSend_numberWithInteger_(v9, v11, v10);
    if (v12)
    {
      v14 = (void *)v12;
      v15 = (void *)MEMORY[0x24BDD16E0];
      v16 = sub_21A68E2C8((uint64_t)a3);
      v18 = (void *)objc_msgSend_numberWithInteger_(v15, v17, v16);
      LODWORD(v15) = objc_msgSend_integerValue(v14, v19, v20);
      v78 = (uint64_t)v18;
      v23 = objc_msgSend_integerValue(v18, v21, v22);
      v24 = (uint64_t)sub_21A691584(v15, v23);
    }
    else
    {
      v25 = (void *)objc_msgSend_objectForKey_(a4, v13, (uint64_t)CFSTR("txt"));
      v14 = (void *)objc_msgSend_objectForKey_(v25, v26, (uint64_t)CFSTR("syAP"));
      v27 = (void *)MEMORY[0x24BDD16E0];
      v35 = sub_21A68E344((uint64_t)a4, v28, v29, v30, v31, v32, v33, v34);
      v78 = objc_msgSend_numberWithInteger_(v27, v36, v35);
      v24 = objc_msgSend_objectForKey_(a4, v37, (uint64_t)CFSTR("name"));
    }
    v77 = v24;
  }
  else
  {
    v14 = 0;
    v77 = 0;
    v78 = 0;
  }
  v38 = sub_21A691584(self->productID, self->deviceKind);
  v41 = (void *)objc_msgSend_parentController(self, v39, v40);
  v44 = (void *)objc_msgSend__assistantUIController(v41, v42, v43);
  v47 = (void *)objc_msgSend_topoView(self, v45, v46);
  v50 = objc_msgSend_layer(v47, v48, v49);
  v53 = objc_msgSend_topoLayout(self, v51, v52);
  v56 = objc_msgSend_topoView(self, v54, v55);
  v58 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v57, self->productID);
  v60 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v59, self->deviceKind);
  v62 = objc_msgSend_modifyTopoUIInLayer_withLayout_andOwningView_targetProductID_targetDeviceKind_targetName_targetWiFiName_sourceProductID_sourceDeviceKind_sourceName_sourceWiFiName_connectionType_(v44, v61, v50, v53, v56, v58, v60, v38, &stru_24DD08368, v14, v78, v77, &stru_24DD08368, a6);
  objc_msgSend_setTopoLayout_(self, v63, v62);
  v64 = (void *)MEMORY[0x24BDD17C8];
  v65 = sub_21A690D80(self->productID, self->deviceKind, 0);
  v66 = sub_21A690C10((uint64_t)CFSTR("Password"), qword_2550F4DE8);
  v68 = objc_msgSend_stringWithFormat_(v64, v67, (uint64_t)CFSTR("%@ %@"), v65, v66);
  v71 = (void *)objc_msgSend_tableManager(self, v69, v70);
  objc_msgSend_updateHeader_forSectionWithIdentifier_(v71, v72, v68, CFSTR("kBasePasswordIdentifier"));
  v73 = sub_21A690C10((uint64_t)CFSTR("BasePasswordExplanation"), qword_2550F4DE8);
  v76 = objc_msgSend_tableManager(self, v74, v75);
  MEMORY[0x24BEDD108](v76, sel_updateFooter_forSectionWithIdentifier_, v73);
}

@end
