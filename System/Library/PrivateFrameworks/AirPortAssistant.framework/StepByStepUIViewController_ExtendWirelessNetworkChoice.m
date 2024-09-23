@implementation StepByStepUIViewController_ExtendWirelessNetworkChoice

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  NSDictionary *sourceNetwork;
  NSDictionary *sourceBase;
  objc_super v14;

  v3 = a3;
  v7 = (void *)objc_msgSend_objectForKey_(self->super.super.super._outResultsDict, a2, (uint64_t)CFSTR("kSBSKey_SelectorChoice"));
  if (!v7)
  {
    v8 = (void *)objc_msgSend_inParamDict(self, v5, v6);
    v7 = (void *)objc_msgSend_objectForKey_(v8, v9, (uint64_t)CFSTR("kSBSKey_SelectorChoice"));
    if (!v7)
      v7 = (void *)objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v10, 211);
    objc_msgSend_setObject_forKey_(self->super.super.super._outResultsDict, v10, (uint64_t)v7, CFSTR("kSBSKey_SelectorChoice"));
  }
  *(_DWORD *)(&self->super.showFullList + 3) = objc_msgSend_integerValue(v7, v5, v6);
  sourceNetwork = self->super._sourceNetwork;
  if (sourceNetwork)
    objc_msgSend_setObject_forKey_(self->super.super.super._outResultsDict, v11, (uint64_t)sourceNetwork, CFSTR("kSBSKey_SourceNetwork"));
  sourceBase = self->super._sourceBase;
  if (sourceBase)
    objc_msgSend_setObject_forKey_(self->super.super.super._outResultsDict, v11, (uint64_t)sourceBase, CFSTR("kSBSKey_SourceBase"));
  v14.receiver = self;
  v14.super_class = (Class)StepByStepUIViewController_ExtendWirelessNetworkChoice;
  -[StepByStepUIViewController_DevicePicker viewWillAppear:](&v14, sel_viewWillAppear_, v3);
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

- (void)selectedDeviceUpdated
{
  uint64_t v2;
  int canBeExtendedWithDWDS;
  const char *v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t ProductLocalizedStringWithFormat;
  NSMutableDictionary *outResultsDict;
  const char *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  UILabel *justTextLabel;
  char *justTextContainerView;
  const char *v17;
  void *valid;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;

  canBeExtendedWithDWDS = objc_msgSend_canBeExtendedWithDWDS(self, a2, v2);
  if (canBeExtendedWithDWDS)
    v6 = CFSTR("StepByStepStatus_ExtendWireless%@");
  else
    v6 = CFSTR("PrimarySetupRecommendation_Join.Specific%@");
  if (canBeExtendedWithDWDS)
    v7 = 211;
  else
    v7 = 212;
  ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v5, (uint64_t)v6);
  outResultsDict = self->super.super.super._outResultsDict;
  v11 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v10, v7);
  objc_msgSend_setObject_forKey_(outResultsDict, v12, v11, CFSTR("kSBSKey_SelectorChoice"));
  v14 = objc_msgSend_nameForNetworkOrDevice_(StepByStepUtilities, v13, (uint64_t)self->super._selectedDevice);
  justTextLabel = self->super.super.justTextLabel;
  justTextContainerView = (char *)self->super.super.justTextContainerView;
  valid = (void *)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(MEMORY[0x24BDD17C8], v17, ProductLocalizedStringWithFormat, CFSTR("%@"), 0, v14);
  sub_21A6829C8(justTextLabel, justTextContainerView, valid);
  v21 = objc_msgSend_tableHeaderContainerView(self, v19, v20);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v22, v21);
  v25 = objc_msgSend_tableHeaderContainerView(self, v23, v24);
  v28 = (void *)objc_msgSend_tableView(self, v26, v27);
  objc_msgSend_setTableHeaderView_(v28, v29, v25);
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
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  NSDictionary *sourceBase;

  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = (void *)objc_msgSend_inParamDict(self, a2, v2);
  v7 = objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("kSBSKey_NetworkScanRecordList"));
  v9 = objc_msgSend_arrayWithArray_(v4, v8, v7);
  if (v9)
  {
    v12 = (void *)v9;
    v13 = (void *)objc_msgSend_inParamDict(self, v10, v11);
    v15 = objc_msgSend_objectForKey_(v13, v14, (uint64_t)CFSTR("kSBSKey_BrowseRecordList"));
    objc_msgSend_addBrowsedRecords_toDestList_(self, v16, v15, v12);
    v18 = objc_msgSend_sortedArrayUsingSelector_(v12, v17, (uint64_t)sel_ssidAndBaseNameLocalizedCaseInsensitiveCompare_);
    objc_msgSend_setSortedDevices_(self, v19, v18);
    sourceBase = self->super._sourceBase;
    self->super._selectedDevice = sourceBase;
    if (!sourceBase)
      self->super._selectedDevice = self->super._sourceNetwork;
    MEMORY[0x24BEDD108](self, sel_setConnectionMedium_, off_2550F49E8[0]);
  }
}

- (id)deviceTableLabel
{
  return (id)sub_21A690C10((uint64_t)CFSTR("StepByStepStatus_ExtendWirelessNetworkChoice.NetworkToConnectTo"), qword_2550F4DE8);
}

- (id)devicePickerLabel
{
  return (id)sub_21A690C10((uint64_t)CFSTR("StepByStepStatus_ExtendWirelessNetworkChoice.ChooseANetwork"), qword_2550F4DE8);
}

- (void)touchInCellAtIndexPath:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  unsigned int v14;
  NSMutableDictionary *outResultsDict;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  objc_super v21;

  v5 = objc_msgSend_section(a3, a2, (uint64_t)a3);
  v8 = (void *)objc_msgSend_tableManager(self, v6, v7);
  if (v5 == objc_msgSend_indexOfSectionWithIdentifier_(v8, v9, (uint64_t)off_2550F4B08))
  {
    v12 = (void *)objc_msgSend_tableManager(self, v10, v11);
    v14 = objc_msgSend_tagOfSelectedRowInMenuSection_(v12, v13, v5);
    *(_DWORD *)(&self->super.showFullList + 3) = v14;
    outResultsDict = self->super.super.super._outResultsDict;
    v17 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v16, v14);
    objc_msgSend_setObject_forKey_(outResultsDict, v18, v17, CFSTR("kSBSKey_SelectorChoice"));
    objc_msgSend_selectedDeviceUpdated(self, v19, v20);
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)StepByStepUIViewController_ExtendWirelessNetworkChoice;
    -[StepByStepUIViewController_DevicePicker touchInCellAtIndexPath:](&v21, sel_touchInCellAtIndexPath_, a3);
  }
}

- (void)stepByStepUpdateProgress:(id)a3 forState:(int)a4
{
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  objc_super v15;

  v4 = *(_QWORD *)&a4;
  v7 = (void *)objc_msgSend_tableManager(self, a2, (uint64_t)a3);
  v9 = objc_msgSend_indexOfSectionWithIdentifier_(v7, v8, (uint64_t)off_2550F4B08);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v9;
    v13 = (void *)objc_msgSend_tableManager(self, v10, v11);
    objc_msgSend_deleteSection_(v13, v14, v12);
  }
  v15.receiver = self;
  v15.super_class = (Class)StepByStepUIViewController_ExtendWirelessNetworkChoice;
  -[StepByStepUIViewController stepByStepUpdateProgress:forState:](&v15, sel_stepByStepUpdateProgress_forState_, a3, v4);
}

- (BOOL)canBeExtendedWithDWDS
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  NSDictionary *selectedDevice;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL result;
  BOOL v16;

  v4 = (void *)objc_msgSend_inParamDict(self, a2, v2);
  v6 = (void *)objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("kSBSKey_Mode"));
  if (objc_msgSend_integerValue(v6, v7, v8) != 1)
    return 0;
  selectedDevice = self->super._selectedDevice;
  if (!selectedDevice)
    return 0;
  v11 = (void *)objc_msgSend_productIDForNetworkOrDevice_(StepByStepUtilities, v9, (uint64_t)selectedDevice);
  v14 = objc_msgSend_integerValue(v11, v12, v13);
  result = 0;
  if (v14)
    v16 = v14 == 3;
  else
    v16 = 1;
  if (!v16 && v14 != 102)
    return 1;
  return result;
}

- (void)addBrowsedRecords:(id)a3 toDestList:(id)a4
{
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  const char *v17;
  __CFString *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, (uint64_t)a3);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = a3;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v8, (uint64_t)&v24, v28, 16);
  if (v9)
  {
    v12 = v9;
    v13 = *(_QWORD *)v25;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v13)
        objc_enumerationMutation(v7);
      v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v14);
      v16 = (__CFString *)objc_msgSend_objectForKey_(v15, v10, (uint64_t)CFSTR("raMA"));
      v18 = (__CFString *)objc_msgSend_objectForKey_(v15, v17, (uint64_t)CFSTR("raM2"));
      if (!objc_msgSend_length(v16, v19, v20))
        break;
      if (sub_21A68F8D8(v16, 0, (CFArrayRef)a4) != -1
        || objc_msgSend_length(v18, v10, v21) && sub_21A68F8D8(v18, 0, (CFArrayRef)a4) != -1)
      {
        objc_msgSend_addObject_(v6, v10, (uint64_t)v15);
      }
      if (v12 == ++v14)
      {
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v24, v28, 16);
        v12 = v22;
        if (v22)
          goto LABEL_3;
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    if (objc_msgSend_count(v6, v10, v11))
      objc_msgSend_addObjectsFromArray_(a4, v23, (uint64_t)v6);
  }
}

@end
