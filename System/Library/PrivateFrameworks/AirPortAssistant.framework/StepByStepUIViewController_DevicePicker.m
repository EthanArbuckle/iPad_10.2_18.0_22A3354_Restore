@implementation StepByStepUIViewController_DevicePicker

- (StepByStepUIViewController_DevicePicker)initWithNibName:(id)a3 bundle:(id)a4
{
  StepByStepUIViewController_DevicePicker *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)StepByStepUIViewController_DevicePicker;
  result = -[AssistantSubUIViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
  if (result)
    result->showFullList = 1;
  return result;
}

- (void)loadView
{
  const char *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  NSDictionary *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)StepByStepUIViewController_DevicePicker;
  -[StepByStepUIViewController loadView](&v36, sel_loadView);
  objc_msgSend_setDelegate_(self, v3, (uint64_t)self);
  v6 = (void *)objc_msgSend_inParamDict(self, v4, v5);
  self->_sourceBase = (NSDictionary *)objc_msgSend_objectForKey_(v6, v7, (uint64_t)CFSTR("kSBSKey_SourceBase"));
  v10 = (void *)objc_msgSend_inParamDict(self, v8, v9);
  self->_sourceNetwork = (NSDictionary *)objc_msgSend_objectForKey_(v10, v11, (uint64_t)CFSTR("kSBSKey_SourceNetwork"));
  v14 = (void *)objc_msgSend_inParamDict(self, v12, v13);
  self->_targetBase = (NSDictionary *)objc_msgSend_objectForKey_(v14, v15, (uint64_t)CFSTR("kSBSKey_TargetBase"));
  objc_msgSend_setupDevices(self, v16, v17);
  if (!self->_selectedDevice)
  {
    v20 = (void *)objc_msgSend_sortedDevices(self, v18, v19);
    if (objc_msgSend_count(v20, v21, v22))
    {
      v25 = (void *)objc_msgSend_sortedDevices(self, v23, v24);
      v27 = (NSDictionary *)objc_msgSend_objectAtIndex_(v25, v26, 0);
      self->_selectedDevice = v27;
      if (!v27)
        return;
    }
    else if (!self->_selectedDevice)
    {
      return;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend_prepareParams(self, v28, v29);
  v30 = (void *)objc_msgSend_inParamDict(self, v28, v29);
  v32 = (void *)objc_msgSend_objectForKey_(v30, v31, (uint64_t)CFSTR("kSBSKey_Mode"));
  if (objc_msgSend_integerValue(v32, v33, v34) == 2)
    objc_msgSend_setLeftNavigationButton_enable_hide_(self, v35, (uint64_t)CFSTR("kCancel"), 1, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
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
  const char *v24;
  uint64_t v25;
  objc_super v26;

  v3 = a3;
  v5 = (void *)objc_msgSend_inParamDict(self, a2, a3);
  v7 = (void *)objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("kSBSKey_Mode"));
  if (objc_msgSend_integerValue(v7, v8, v9) == 2)
  {
    objc_msgSend_setLeftNavigationButton_enable_hide_(self, v10, (uint64_t)CFSTR("kCancel"), 1, 0);
    if (objc_msgSend_showMoreOptions(self, v11, v12))
    {
      if (!objc_msgSend_actionController(self, v10, v13))
      {
        v15 = objc_msgSend_tableManager(self, v10, v14);
        v18 = objc_msgSend_parentController(self, v16, v17);
        v20 = objc_msgSend_recommendationActionControllerWithTableManager_andAssistantUIViewController_(RecommendationActionController, v19, v15, v18);
        objc_msgSend_setActionController_(self, v21, v20);
      }
    }
  }
  if (objc_msgSend_conformsToProtocol_(self, v10, (uint64_t)&unk_2551102D0))
  {
    objc_msgSend_setupPickerTable(self, v22, v23);
    objc_msgSend_setupHeaderAndFooter(self, v24, v25);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend_updateNavigationButtons(self, v22, v23);
  }
  objc_msgSend_updateSelections(self, v22, v23);
  v26.receiver = self;
  v26.super_class = (Class)StepByStepUIViewController_DevicePicker;
  -[StepByStepUIViewController viewWillAppear:](&v26, sel_viewWillAppear_, v3);
}

- (id)valueForItemOfType:(id)a3 atTypeIndex:(unint64_t)a4 inCellWithTag:(int64_t)a5
{
  return (id)objc_msgSend_nameForNetworkOrDevice_(StepByStepUtilities, a2, (uint64_t)self->_selectedDevice, a4, a5);
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
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  RecommendationActionController *actionController;
  const char *v27;
  uint64_t v28;
  uint64_t isPrimaryRecommendation;
  void *v30;
  const char *v31;
  unint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  NSDictionary *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;

  v5 = objc_msgSend_section(a3, a2, (uint64_t)a3);
  v8 = (void *)objc_msgSend_tableManager(self, v6, v7);
  if (v5 == objc_msgSend_indexOfSectionWithIdentifier_(v8, v9, qword_2550F4B00))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v50 = 0;
      v14 = (void *)objc_msgSend_tableManager(self, v12, v13);
      if (objc_msgSend_tagOfCellAtIndexPath_tag_(v14, v15, (uint64_t)a3, &v50))
      {
        if (v50 != 1400203111)
        {
          if (v50 == 1333028978)
          {
            self->showFullList = 1;
            v18 = (void *)objc_msgSend_tableManager(self, v16, v17);
            objc_msgSend_deleteSectionWithIdentifier_animated_(v18, v19, qword_2550F4B00, 1);
            objc_msgSend_setupPickerTable(self, v20, v21);
          }
          else
          {
            v32 = objc_msgSend_row(a3, v16, v17);
            if (objc_msgSend_sortedDevices(self, v33, v34))
            {
              v37 = (void *)objc_msgSend_sortedDevices(self, v35, v36);
              if (v32 < objc_msgSend_count(v37, v38, v39))
              {
                v42 = (void *)objc_msgSend_sortedDevices(self, v40, v41);
                v45 = objc_msgSend_row(a3, v43, v44);
                v47 = (NSDictionary *)objc_msgSend_objectAtIndex_(v42, v46, v45);
                self->_selectedDevice = v47;
                if (v47)
                  objc_msgSend_updateSelections(self, v48, v49);
              }
            }
          }
        }
      }
    }
  }
  else
  {
    v22 = (void *)objc_msgSend_tableManager(self, v10, v11);
    if (v5 == objc_msgSend_indexOfSectionWithIdentifier_(v22, v23, (uint64_t)CFSTR("ActionTableSection")))
    {
      actionController = self->actionController;
      if (actionController)
      {
        isPrimaryRecommendation = objc_msgSend_isPrimaryRecommendation(actionController, v24, v25);
        if ((_DWORD)isPrimaryRecommendation)
        {
          objc_msgSend_setupPickerTable(self, v27, v28);
        }
        else
        {
          v30 = (void *)objc_msgSend_tableManager(self, v27, v28);
          objc_msgSend_deleteSectionWithIdentifier_(v30, v31, qword_2550F4B00);
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          MEMORY[0x24BEDD108](self, sel_primaryActionSelected_, isPrimaryRecommendation);
      }
    }
  }
}

- (void)setupPickerTable
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  RecommendationActionController *actionController;
  const char *v13;
  uint64_t v14;
  _BOOL8 v15;
  const char *v16;
  uint64_t SectionInfoWithLongStrings;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  uint64_t v51;

  if (self->actionController)
  {
    v4 = (void *)objc_msgSend_tableManager(self, a2, v2);
    v7 = objc_msgSend_sectionIdentifier(self->actionController, v5, v6);
    if (objc_msgSend_indexOfSectionWithIdentifier_(v4, v8, v7) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = (void *)objc_msgSend_tableManager(self, v9, v10);
      actionController = self->actionController;
      v15 = sub_21A731A84(self, v13, v14) != 1;
      SectionInfoWithLongStrings = objc_msgSend_getSectionInfoWithLongStrings_(actionController, v16, v15);
      objc_msgSend_addSectionInfo_(v11, v18, SectionInfoWithLongStrings);
    }
    else
    {
      objc_msgSend_selectPrimaryRecommendation(self->actionController, v9, v10);
    }
  }
  v19 = (void *)objc_msgSend_tableManager(self, a2, v2);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v19, v20, qword_2550F4B00) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!self->actionController
      || (v23 = (void *)objc_msgSend_sortedDevices(self, v21, v22),
          (unint64_t)objc_msgSend_count(v23, v24, v25) >= 2))
    {
      v26 = (void *)objc_msgSend_sortedDevices(self, v21, v22);
      if (objc_msgSend_count(v26, v27, v28))
      {
        v51 = objc_msgSend_deviceTableLabel(self, v29, v30);
        v33 = (void *)objc_msgSend_sortedDevices(self, v31, v32);
        v35 = objc_msgSend_indexOfObject_(v33, v34, (uint64_t)self->_selectedDevice);
        v50 = (void *)objc_msgSend_tableManager(self, v36, v37);
        v38 = (void *)MEMORY[0x24BDBCED8];
        v41 = objc_msgSend_pickerContent(self, v39, v40);
        v42 = qword_2550F4B00;
        v44 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v43, 1);
        v46 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v45, v35);
        v48 = objc_msgSend_dictionaryWithObjectsAndKeys_(v38, v47, v41, CFSTR("sectionRows"), v42, CFSTR("identifier"), v44, CFSTR("sectionIsMenu"), v51, CFSTR("header"), v46, CFSTR("selectedMenuItemTag"), 0);
        objc_msgSend_insertSectionInfo_atIndex_withRowAnimation_(v50, v49, v48, 0, 100);
      }
    }
  }
}

- (void)updateSelections
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  NSDictionary *selectedDevice;
  const char *v8;
  NSDictionary *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSDictionary *v16;
  void *v17;
  unsigned int v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  const char *v29;
  NSDictionary *v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  unsigned int ProductIDFromParamDict;
  const char *v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  unsigned int DeviceKindFromParamDict;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  const __CFString *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend_selectedDeviceUpdated(self, v3, v4);
  v6 = objc_msgSend_objectForKey_(self->_selectedDevice, v3, (uint64_t)CFSTR("BSSID"));
  selectedDevice = self->_selectedDevice;
  if (v6)
  {
    self->_sourceNetwork = selectedDevice;
    objc_msgSend_objectForKey_(selectedDevice, v5, (uint64_t)CFSTR("SSID_STR"));
    if (self->_showSingleBaseTopo)
      v9 = 0;
    else
      v9 = self->_selectedDevice;
    self->_sourceBase = v9;
    v30 = self->_selectedDevice;
    if (v30)
      objc_msgSend_setObject_forKey_(self->super.super._outResultsDict, v8, (uint64_t)v30, CFSTR("kSBSKey_SourceNetwork"));
    v80 = 0;
    v81 = 0;
  }
  else
  {
    self->_sourceBase = selectedDevice;
    objc_msgSend_objectForKey_(selectedDevice, v5, (uint64_t)CFSTR("raNm"));
    v16 = self->_selectedDevice;
    if (v16)
      objc_msgSend_setObject_forKey_(self->super.super._outResultsDict, v10, (uint64_t)v16, CFSTR("kSBSKey_SourceBase"));
    v17 = (void *)MEMORY[0x24BDD16E0];
    v18 = sub_21A68E368((const __CFString *)self->_sourceBase, (uint64_t)v10, (uint64_t)v16, v11, v12, v13, v14, v15);
    v81 = objc_msgSend_numberWithInteger_(v17, v19, v18);
    v20 = (void *)MEMORY[0x24BDD16E0];
    v28 = sub_21A68E344((uint64_t)self->_sourceBase, v21, v22, v23, v24, v25, v26, v27);
    v80 = objc_msgSend_numberWithInteger_(v20, v29, v28);
  }
  v31 = (void *)MEMORY[0x24BDD16E0];
  v32 = objc_msgSend_inParamDict(self, v8, (uint64_t)v30);
  ProductIDFromParamDict = objc_msgSend_getProductIDFromParamDict_(StepByStepUtilities, v33, v32);
  v36 = (void *)objc_msgSend_numberWithInteger_(v31, v35, ProductIDFromParamDict);
  v37 = (void *)MEMORY[0x24BDD16E0];
  v40 = objc_msgSend_inParamDict(self, v38, v39);
  DeviceKindFromParamDict = objc_msgSend_getDeviceKindFromParamDict_(StepByStepUtilities, v41, v40);
  v44 = objc_msgSend_numberWithInteger_(v37, v43, DeviceKindFromParamDict);
  v47 = (void *)objc_msgSend_parentController(self, v45, v46);
  v50 = (void *)objc_msgSend__assistantUIController(v47, v48, v49);
  v53 = (void *)objc_msgSend_topoView(self, v51, v52);
  v56 = objc_msgSend_layer(v53, v54, v55);
  v59 = objc_msgSend_topoLayout(self, v57, v58);
  v62 = objc_msgSend_topoView(self, v60, v61);
  v65 = (void *)objc_msgSend_inParamDict(self, v63, v64);
  v67 = objc_msgSend_objectForKey_(v65, v66, (uint64_t)CFSTR("kSBSKey_TargetNetwork"));
  v70 = (const char *)objc_msgSend_integerValue(v36, v68, v69);
  v71 = sub_21A690F78(v67, v70, 0);
  v73 = objc_msgSend_objectForKey_(self->_sourceBase, v72, (uint64_t)CFSTR("name"));
  v76 = objc_msgSend_connectionMedium(self, v74, v75);
  v78 = objc_msgSend_modifyTopoUIInLayer_withLayout_andOwningView_targetProductID_targetDeviceKind_targetName_targetWiFiName_sourceProductID_sourceDeviceKind_sourceName_sourceWiFiName_connectionType_(v50, v77, v56, v59, v62, v36, v44, v71, 0, v81, v80, v73, 0, v76);
  objc_msgSend_setTopoLayout_(self, v79, v78);
}

- (BOOL)showMoreOptions
{
  return 1;
}

- (id)pickerContent
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t RowStyleBasicWithImage_text1_text2_withTag;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, v2);
  if (self->showFullList)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = (id)objc_msgSend_sortedDevices(self, v4, v5);
    v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v37, v41, 16);
    if (v8)
    {
      v11 = v8;
      v12 = 0;
      v13 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v38 != v13)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          v16 = (void *)objc_msgSend_tableManager(self, v9, v10);
          v18 = objc_msgSend_nameForNetworkOrDevice_(StepByStepUtilities, v17, v15);
          RowStyleBasicWithImage_text1_text2_withTag = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v16, v19, 0, v18, 0, v12 + i);
          objc_msgSend_addObject_(v6, v21, RowStyleBasicWithImage_text1_text2_withTag);
        }
        v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v37, v41, 16);
        v12 += i;
      }
      while (v11);
    }
  }
  else
  {
    v22 = (void *)objc_msgSend_tableManager(self, v4, v5);
    v24 = objc_msgSend_nameForNetworkOrDevice_(StepByStepUtilities, v23, (uint64_t)self->_selectedDevice);
    v26 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v22, v25, 0, v24, 0, 1400203111);
    objc_msgSend_addObject_(v6, v27, v26);
    v30 = (void *)objc_msgSend_tableManager(self, v28, v29);
    v31 = sub_21A690C10((uint64_t)CFSTR("ShowOtherNetworksEllipsis"), qword_2550F4DE8);
    v33 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v30, v32, 0, v31, 0, 1333028978);
    objc_msgSend_addObject_(v6, v34, v33);
  }
  return v6;
}

- (NSArray)sortedDevices
{
  return self->sortedDevices;
}

- (void)setSortedDevices:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1160);
}

- (NSString)connectionMedium
{
  return self->connectionMedium;
}

- (void)setConnectionMedium:(id)a3
{
  self->connectionMedium = (NSString *)a3;
}

- (RecommendationActionController)actionController
{
  return self->actionController;
}

- (void)setActionController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1176);
}

@end
