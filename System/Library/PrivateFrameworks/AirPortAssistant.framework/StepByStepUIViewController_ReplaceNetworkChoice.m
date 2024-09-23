@implementation StepByStepUIViewController_ReplaceNetworkChoice

- (void)setupHeaderAndFooter
{
  uint64_t v2;
  UILabel *justTextLabel;
  char *v5;
  const char *v6;
  void *ProductLocalizedStringWithFormat;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;

  justTextLabel = self->super.super.justTextLabel;
  v5 = (char *)objc_msgSend_justTextContainerView(self, a2, v2);
  ProductLocalizedStringWithFormat = (void *)objc_msgSend_getProductLocalizedStringWithFormat_(self, v6, (uint64_t)CFSTR("StepByStepStatus_ReplaceNetworkChoice%@"));
  sub_21A6829C8(justTextLabel, v5, ProductLocalizedStringWithFormat);
  v10 = objc_msgSend_tableHeaderContainerView(self, v8, v9);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v11, v10);
  v14 = (void *)objc_msgSend_parentController(self, v12, v13);
  v17 = objc_msgSend_tableHeaderContainerView(self, v15, v16);
  v18 = (void *)MEMORY[0x24BDBCE30];
  v21 = objc_msgSend_justTextContainerView(self, v19, v20);
  v24 = objc_msgSend_topoView(self, v22, v23);
  v26 = objc_msgSend_arrayWithObjects_(v18, v25, v21, v24, 0);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v14, v27, v17, v26, 1);
  v30 = objc_msgSend_tableHeaderContainerView(self, v28, v29);
  v33 = (void *)objc_msgSend_tableView(self, v31, v32);
  objc_msgSend_setTableHeaderView_(v33, v34, v30);
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
  v7 = objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("kSBSKey_NetworkScanRecordList"));
  v9 = (void *)objc_msgSend_arrayWithArray_(v4, v8, v7);
  if (v9)
  {
    v11 = objc_msgSend_sortedArrayUsingSelector_(v9, v10, (uint64_t)sel_ssidLocalizedCaseInsensitiveCompare_);
    objc_msgSend_setSortedDevices_(self, v12, v11);
    self->super._selectedDevice = self->super._sourceNetwork;
    MEMORY[0x24BEDD108](self, sel_setConnectionMedium_, off_2550F49F0);
  }
}

- (id)deviceTableLabel
{
  return (id)sub_21A690C10((uint64_t)CFSTR("StepByStepStatus_ReplaceNetworkChoice.ChosenNetwork"), qword_2550F4DE8);
}

- (id)devicePickerLabel
{
  return (id)sub_21A690C10((uint64_t)CFSTR("StepByStepStatus_ReplaceNetworkChoice.ChooseANetwork"), qword_2550F4DE8);
}

@end
