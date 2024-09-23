@implementation StepByStepUIViewController_Create_Guest

- (void)loadView
{
  const char *v3;
  const char *v4;
  NSMutableDictionary *outResultsDict;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  NSMutableDictionary *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  unsigned int v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  const char *v23;
  UILabel *justTextLabel;
  char *justTextContainerView;
  const char *v26;
  void *ProductLocalizedStringWithFormat;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)StepByStepUIViewController_Create_Guest;
  -[StepByStepUIViewController loadView](&v40, sel_loadView);
  objc_msgSend_setGuestNetworkEnabled_(self, v3, 0);
  objc_msgSend_setGuestNetSecMode_(self, v4, 1);
  outResultsDict = self->super.super._outResultsDict;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v9 = objc_msgSend_guestNetworkEnabled(self, v7, v8);
  v11 = objc_msgSend_numberWithBool_(v6, v10, v9);
  objc_msgSend_setValue_forKey_(outResultsDict, v12, v11, CFSTR("kSBSKey_GuestNetwork_On"));
  objc_msgSend_setValue_forKey_(self->super.super._outResultsDict, v13, (uint64_t)&stru_24DD08368, CFSTR("kSBSKey_GuestNetwork_Name"));
  v14 = self->super.super._outResultsDict;
  v15 = (void *)MEMORY[0x24BDD16E0];
  v18 = objc_msgSend_guestNetSecMode(self, v16, v17);
  v20 = objc_msgSend_numberWithInteger_(v15, v19, v18);
  objc_msgSend_setValue_forKey_(v14, v21, v20, CFSTR("kSBSKey_GuestNetwork_Security"));
  objc_msgSend_setValue_forKey_(self->super.super._outResultsDict, v22, (uint64_t)&stru_24DD08368, CFSTR("kSBSKey_GuestNetwork_Password"));
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v23, (uint64_t)CFSTR("kNext"), 0, 0);
  justTextLabel = self->super.justTextLabel;
  justTextContainerView = (char *)self->super.justTextContainerView;
  ProductLocalizedStringWithFormat = (void *)objc_msgSend_getProductLocalizedStringWithFormat_(self, v26, (uint64_t)CFSTR("StepByStepChoice_Create_Guest.GuestNetworkInfo%@"));
  sub_21A6829C8(justTextLabel, justTextContainerView, ProductLocalizedStringWithFormat);
  v30 = objc_msgSend_tableHeaderContainerView(self, v28, v29);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v31, v30);
  v34 = objc_msgSend_tableHeaderContainerView(self, v32, v33);
  v37 = (void *)objc_msgSend_tableView(self, v35, v36);
  objc_msgSend_setTableHeaderView_(v37, v38, v34);
  objc_msgSend_setDelegate_(self, v39, (uint64_t)self);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  objc_super v34;

  v3 = a3;
  v5 = (void *)objc_msgSend_valueForKey_(self->super.super._outResultsDict, a2, (uint64_t)CFSTR("kSBSKey_GuestNetwork_On"));
  v8 = objc_msgSend_BOOLValue(v5, v6, v7);
  objc_msgSend_setGuestNetworkEnabled_(self, v9, v8);
  v11 = objc_msgSend_valueForKey_(self->super.super._outResultsDict, v10, (uint64_t)CFSTR("kSBSKey_GuestNetwork_Name"));
  if (v11)
    objc_msgSend_setWifiName_(self, v12, v11);
  else
    objc_msgSend_setWifiName_(self, v12, (uint64_t)&stru_24DD08368);
  v14 = (void *)objc_msgSend_valueForKey_(self->super.super._outResultsDict, v13, (uint64_t)CFSTR("kSBSKey_GuestNetwork_Security"));
  v17 = objc_msgSend_integerValue(v14, v15, v16);
  objc_msgSend_setGuestNetSecMode_(self, v18, v17);
  v20 = objc_msgSend_valueForKey_(self->super.super._outResultsDict, v19, (uint64_t)CFSTR("kSBSKey_GuestNetwork_Password"));
  if (v20)
    objc_msgSend_setWifiPassword_(self, v21, v20);
  else
    objc_msgSend_setWifiPassword_(self, v21, (uint64_t)&stru_24DD08368);
  v24 = (void *)objc_msgSend_inParamDict(self, v22, v23);
  v26 = objc_msgSend_objectForKey_(v24, v25, (uint64_t)CFSTR("kSBSKey_TargetBase"));
  objc_msgSend_syncTopoUIForTarget_andSource_andNetwork_connectionType_(self, v27, v26, 0, 0, 0);
  objc_msgSend_setupTable(self, v28, v29);
  objc_msgSend_updateTable(self, v30, v31);
  objc_msgSend_validateAndUpdateNextButton(self, v32, v33);
  v34.receiver = self;
  v34.super_class = (Class)StepByStepUIViewController_Create_Guest;
  -[StepByStepUIViewController viewWillAppear:](&v34, sel_viewWillAppear_, v3);
}

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

- (BOOL)validateAndSetValues
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *ValueForFirstItemOfType_inCellWithTag;
  const char *v7;
  uint64_t v8;
  const char *v9;
  unsigned int v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  const char *v31;

  v4 = (void *)objc_msgSend_tableManager(self, a2, v2);
  ValueForFirstItemOfType_inCellWithTag = (void *)objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v4, v5, (uint64_t)CFSTR("editTextView"), 1196314221);
  v9 = (const char *)objc_msgSend_UTF8String(ValueForFirstItemOfType_inCellWithTag, v7, v8);
  v10 = sub_21A68FB74(v9);
  if (v10)
  {
    objc_msgSend_setWifiName_(self, v11, (uint64_t)ValueForFirstItemOfType_inCellWithTag);
    if (objc_msgSend_guestNetSecMode(self, v12, v13) != 7)
    {
LABEL_6:
      LOBYTE(v10) = 1;
      return v10;
    }
    v16 = (void *)objc_msgSend_tableManager(self, v14, v15);
    v18 = (void *)objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v16, v17, (uint64_t)CFSTR("editTextView"), 1196314743);
    v21 = (void *)objc_msgSend_tableManager(self, v19, v20);
    v23 = objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v21, v22, (uint64_t)CFSTR("editTextView"), 1196314710);
    v26 = (void *)objc_msgSend_tableManager(self, v24, v25);
    v10 = objc_msgSend_verifyStr1_forTag1_matchesStr2_forTag2_(v26, v27, (uint64_t)v18, 1196314743, v23, 1196314710);
    if (v10)
    {
      v30 = (const char *)objc_msgSend_UTF8String(v18, v28, v29);
      v10 = sub_21A68FBB0(v30);
      if (v10)
      {
        objc_msgSend_setWifiPassword_(self, v31, (uint64_t)v18);
        goto LABEL_6;
      }
    }
  }
  return v10;
}

- (void)switchTouchedInCellAtIndexPath:(id)a3 forSwitchIndex:(unint64_t)a4 isOn:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a5;
  v15 = 0;
  v8 = (void *)objc_msgSend_tableManager(self, a2, (uint64_t)a3, a4);
  if (objc_msgSend_tagOfCellAtIndexPath_tag_(v8, v9, (uint64_t)a3, &v15))
  {
    if (v15 == 1196314707)
    {
      if (v5)
        objc_msgSend_setGuestNetSecMode_(self, v10, 7);
      else
        objc_msgSend_setGuestNetSecMode_(self, v10, 1);
    }
    else
    {
      if (v15 != 1196315511)
        return;
      objc_msgSend_setGuestNetworkEnabled_(self, v10, v5);
    }
    objc_msgSend_updateTable(self, v11, v12);
    objc_msgSend_validateAndUpdateNextButton(self, v13, v14);
  }
}

- (BOOL)shouldChangeTextField:(id)a3 atIndexPath:(id)a4 forTextIndex:(unint64_t)a5 toString:(id)a6
{
  return 1;
}

- (NSString)wifiName
{
  return self->_wifiName;
}

- (void)setWifiName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1128);
}

- (NSString)wifiPassword
{
  return self->_wifiPassword;
}

- (void)setWifiPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1136);
}

- (BOOL)guestNetworkEnabled
{
  return self->_guestNetworkEnabled;
}

- (void)setGuestNetworkEnabled:(BOOL)a3
{
  self->_guestNetworkEnabled = a3;
}

- (int)guestNetSecMode
{
  return self->_guestNetSecMode;
}

- (void)setGuestNetSecMode:(int)a3
{
  self->_guestNetSecMode = a3;
}

- (void)setupTable
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;

  v4 = (void *)objc_msgSend_tableManager(self, a2, v2);
  objc_msgSend_cleanTableViewForReuse(v4, v5, v6);
  v9 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v7, v8);
  v12 = (void *)objc_msgSend_tableManager(self, v10, v11);
  v13 = sub_21A690C10((uint64_t)CFSTR("StepByStepChoice_Create_Guest.GuestNetSwitchLabel"), qword_2550F4DE8);
  v16 = objc_msgSend_guestNetworkEnabled(self, v14, v15);
  v18 = objc_msgSend_createRowStyleBasicOnOffWithImage_labelText_isOn_withTag_(v12, v17, 0, v13, v16, 1196315511);
  objc_msgSend_addObject_(v9, v19, v18);
  v22 = (void *)objc_msgSend_tableManager(self, v20, v21);
  v24 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCED8], v23, (uint64_t)v9, CFSTR("sectionRows"), CFSTR("GuestNetworkSwitch"), CFSTR("identifier"), 0);
  objc_msgSend_addSectionInfo_(v22, v25, v24);
  objc_msgSend_setupInitialTableHeaderConfiguration(self, v26, v27);
}

- (void)updateTable
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;

  if (objc_msgSend_guestNetworkEnabled(self, a2, v2))
  {
    objc_msgSend_addGuestNetworkIsEnabledSection(self, v4, v5);
    if (objc_msgSend_guestNetSecMode(self, v6, v7) != 1)
    {
      MEMORY[0x24BEDD108](self, sel_addGuestNetworkPasswordSection, v9);
      return;
    }
  }
  else
  {
    v10 = (void *)objc_msgSend_tableManager(self, v4, v5);
    objc_msgSend_deleteSectionWithIdentifier_(v10, v11, (uint64_t)CFSTR("GuestNetworkWiFiName"));
    v14 = (void *)objc_msgSend_tableManager(self, v12, v13);
    objc_msgSend_deleteSectionWithIdentifier_(v14, v15, (uint64_t)CFSTR("GuestNetworkWPASwitch"));
  }
  v16 = (void *)objc_msgSend_tableManager(self, v8, v9);
  objc_msgSend_deleteSectionWithIdentifier_(v16, v17, (uint64_t)CFSTR("GuestNetworkPassword"));
}

- (void)addGuestNetworkIsEnabledSection
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
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *isSecure_keyboardType_withTag;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
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
  uint64_t v35;
  _BOOL8 v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;

  v4 = (void *)objc_msgSend_tableManager(self, a2, v2);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v4, v5, (uint64_t)CFSTR("GuestNetworkWiFiName")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v6, v7);
    v11 = (void *)objc_msgSend_tableManager(self, v9, v10);
    v12 = sub_21A690C10((uint64_t)CFSTR("CustomWiFiName"), qword_2550F4DE8);
    v13 = sub_21A690C10((uint64_t)CFSTR("CustomWiFiNamePlaceholder"), qword_2550F4DE8);
    isSecure_keyboardType_withTag = (void *)objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v11, v14, 0, v12, &stru_24DD08368, v13, 0, 0, 1196314221);
    v17 = sub_21A682B88(1651722062, v16);
    if (v17)
      objc_msgSend_setObject_forKey_(isSecure_keyboardType_withTag, v18, v17, CFSTR("nsFormatter"));
    objc_msgSend_addObject_(v8, v18, (uint64_t)isSecure_keyboardType_withTag);
    v21 = (void *)objc_msgSend_tableManager(self, v19, v20);
    v23 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCED8], v22, (uint64_t)v8, CFSTR("sectionRows"), CFSTR("GuestNetworkWiFiName"), CFSTR("identifier"), 0);
    objc_msgSend_addSectionInfo_(v21, v24, v23);
  }
  v25 = (void *)objc_msgSend_tableManager(self, v6, v7);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v25, v26, (uint64_t)CFSTR("GuestNetworkWPASwitch")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v29 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v27, v28);
    v32 = (void *)objc_msgSend_tableManager(self, v30, v31);
    v33 = sub_21A690C10((uint64_t)CFSTR("StepByStepChoice_Create_Guest.GuestNetWPASwitchLabel"), qword_2550F4DE8);
    v36 = objc_msgSend_guestNetSecMode(self, v34, v35) != 1;
    v38 = objc_msgSend_createRowStyleBasicOnOffWithImage_labelText_isOn_withTag_(v32, v37, 0, v33, v36, 1196314707);
    objc_msgSend_addObject_(v29, v39, v38);
    v42 = (void *)objc_msgSend_tableManager(self, v40, v41);
    v44 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCED8], v43, (uint64_t)v29, CFSTR("sectionRows"), CFSTR("GuestNetworkWPASwitch"), CFSTR("identifier"), 0);
    objc_msgSend_addSectionInfo_(v42, v45, v44);
  }
}

- (void)addGuestNetworkPasswordSection
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
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *isSecure_keyboardType_withTag;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
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
  const char *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;

  v4 = (void *)objc_msgSend_tableManager(self, a2, v2);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v4, v5, (uint64_t)CFSTR("GuestNetworkPassword")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v6, v7);
    v11 = (void *)objc_msgSend_tableManager(self, v9, v10);
    v12 = sub_21A690C10((uint64_t)CFSTR("PasswordLabel"), qword_2550F4DE8);
    v15 = objc_msgSend_wifiPassword(self, v13, v14);
    v16 = sub_21A690C10((uint64_t)CFSTR("CreatePasswordPlaceholder"), qword_2550F4DE8);
    isSecure_keyboardType_withTag = (void *)objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v11, v17, 0, v12, v15, v16, 1, 0, 1196314743);
    v22 = sub_21A682B88(1651722064, v19);
    if (v22)
      objc_msgSend_setObject_forKey_(isSecure_keyboardType_withTag, v20, v22, CFSTR("nsFormatter"));
    v23 = (void *)objc_msgSend_tableManager(self, v20, v21);
    objc_msgSend_setNewRow_verifierAccessoryType_(v23, v24, (uint64_t)isSecure_keyboardType_withTag, 0);
    objc_msgSend_addObject_(v8, v25, (uint64_t)isSecure_keyboardType_withTag);
    v28 = (void *)objc_msgSend_tableManager(self, v26, v27);
    v29 = sub_21A690C10((uint64_t)CFSTR("VerifyLabel"), qword_2550F4DE8);
    v32 = objc_msgSend_wifiPassword(self, v30, v31);
    v33 = sub_21A690C10((uint64_t)CFSTR("VerifyPlaceholder"), qword_2550F4DE8);
    v35 = (void *)objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v28, v34, 0, v29, v32, v33, 1, 0, 1196314710);
    v38 = (uint64_t)v35;
    if (v22)
      objc_msgSend_setObject_forKey_(v35, v36, v22, CFSTR("nsFormatter"));
    v39 = (void *)objc_msgSend_tableManager(self, v36, v37);
    objc_msgSend_setNewRow_verifierAccessoryType_(v39, v40, v38, 0);
    objc_msgSend_addObject_(v8, v41, v38);
    v44 = (void *)objc_msgSend_tableManager(self, v42, v43);
    v45 = (void *)MEMORY[0x24BDBCED8];
    v46 = sub_21A690C10((uint64_t)CFSTR("WiFiPasswordRequirement"), qword_2550F4DE8);
    v48 = objc_msgSend_dictionaryWithObjectsAndKeys_(v45, v47, (uint64_t)v8, CFSTR("sectionRows"), v46, CFSTR("footer"), CFSTR("GuestNetworkPassword"), CFSTR("identifier"), 0);
    objc_msgSend_addSectionInfo_(v44, v49, v48);
  }
}

- (void)validateAndUpdateNextButton
{
  uint64_t v2;
  NSMutableDictionary *outResultsDict;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSMutableDictionary *v14;
  uint64_t v15;
  const char *v16;
  NSMutableDictionary *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  unsigned int v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  NSMutableDictionary *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;

  outResultsDict = self->super.super._outResultsDict;
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = objc_msgSend_guestNetworkEnabled(self, a2, v2);
  v8 = objc_msgSend_numberWithBool_(v5, v7, v6);
  objc_msgSend_setValue_forKey_(outResultsDict, v9, v8, CFSTR("kSBSKey_GuestNetwork_On"));
  if (objc_msgSend_guestNetworkEnabled(self, v10, v11))
  {
    if (!objc_msgSend_validateAndSetValues(self, v12, v13))
    {
      v30 = 0;
      goto LABEL_7;
    }
    v14 = self->super.super._outResultsDict;
    v15 = objc_msgSend_wifiName(self, v12, v13);
    objc_msgSend_setValue_forKey_(v14, v16, v15, CFSTR("kSBSKey_GuestNetwork_Name"));
    v17 = self->super.super._outResultsDict;
    v18 = (void *)MEMORY[0x24BDD16E0];
    v21 = objc_msgSend_guestNetSecMode(self, v19, v20);
    v23 = objc_msgSend_numberWithInteger_(v18, v22, v21);
    objc_msgSend_setValue_forKey_(v17, v24, v23, CFSTR("kSBSKey_GuestNetwork_Security"));
    if (objc_msgSend_guestNetSecMode(self, v25, v26) != 1)
    {
      v27 = self->super.super._outResultsDict;
      v28 = objc_msgSend_wifiPassword(self, v12, v13);
      objc_msgSend_setValue_forKey_(v27, v29, v28, CFSTR("kSBSKey_GuestNetwork_Password"));
    }
  }
  v30 = 1;
LABEL_7:
  v31 = (void *)objc_msgSend_navigationItem(self, v12, v13);
  v34 = (void *)objc_msgSend_rightBarButtonItem(v31, v32, v33);
  objc_msgSend_setEnabled_(v34, v35, v30);
}

@end
