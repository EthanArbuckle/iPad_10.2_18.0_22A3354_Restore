@implementation StepByStepUIViewController_ExtendWired_Connections

- (void)loadView
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  objc_super v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  objc_msgSend_setInternetFlow_(self, a2, 3);
  v5 = (void *)objc_msgSend_inParamDict(self, v3, v4);
  v7 = (void *)objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("kSBSKey_Step"));
  if (objc_msgSend_integerValue(v7, v8, v9) == 13)
  {
    v12 = sub_21A690C10((uint64_t)CFSTR("StepByStepStatus_ReplaceOtherConnections.PlugInWANCable"), qword_2550F4DE8);
    objc_msgSend_setSwapDescriptionText_(self, v13, v12);
    v14 = sub_21A690C10((uint64_t)CFSTR("StepByStepStatus_ReplaceOtherConnections.SourceDevice"), qword_2550F4DE8);
  }
  else
  {
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v16 = (void *)objc_msgSend_inParamDict(self, v10, v11);
    v18 = objc_msgSend_objectForKey_(v16, v17, (uint64_t)CFSTR("kSBSKey_SourceBase"));
    objc_msgSend_determineInfoForDevice_deviceDiagramInfo_(self, v19, v18, &v31);
    v20 = sub_21A690C10((uint64_t)CFSTR("StepByStepStatus_ExtendWiredNetworkConnections.PlugInWANCable"), qword_2550F4DE8);
    objc_msgSend_setSwapDescriptionText_(self, v21, v20);
    v14 = (uint64_t)sub_21A690D80(v32, SHIDWORD(v33), 0);
  }
  objc_msgSend_setSwapSourceLabelText_(self, v15, v14);
  v24 = (void *)objc_msgSend_inParamDict(self, v22, v23);
  v26 = (void *)objc_msgSend_objectForKey_(v24, v25, (uint64_t)CFSTR("kSBSKey_Mode"));
  if (objc_msgSend_integerValue(v26, v27, v28) == 2)
    objc_msgSend_setLeftNavigationButton_enable_hide_(self, v29, (uint64_t)CFSTR("kCancel"), 1, 0);
  v30.receiver = self;
  v30.super_class = (Class)StepByStepUIViewController_ExtendWired_Connections;
  -[InternetViewController loadView](&v30, sel_loadView);
}

@end
