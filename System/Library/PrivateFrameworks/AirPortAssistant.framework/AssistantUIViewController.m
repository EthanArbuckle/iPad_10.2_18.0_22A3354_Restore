@implementation AssistantUIViewController

- (AssistantUIViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  AssistantUIViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AssistantUIViewController;
  v4 = -[AUUITableViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
    sub_21A690BB0(CFSTR("SetupRecommendations"));
  return v4;
}

- (void)loadView
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  AssistantUIController *v6;
  const char *v7;
  id v8;
  const char *v9;
  id v10;
  const char *v11;
  id v12;
  uint64_t v13;
  const char *v14;
  id v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t Button;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  id v62;
  uint64_t v63;
  const char *v64;
  id v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  double v76;
  const char *v77;
  const char *v78;
  UILabel *justTextLabel;
  void *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  double v84;
  double v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  NSDictionary *v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  double v100;
  uint64_t v101;
  const char *v102;
  const char *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  double v111;
  uint64_t v112;
  const char *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  double v121;
  uint64_t v122;
  const char *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  double v129;
  double v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  double v138;
  uint64_t v139;
  const char *v140;
  UIActivityIndicatorView *v141;
  uint64_t v142;
  objc_super v143;
  const __CFString *v144;
  _QWORD v145[2];

  v145[1] = *MEMORY[0x24BDAC8D0];
  v143.receiver = self;
  v143.super_class = (Class)AssistantUIViewController;
  -[AUUITableViewController loadView](&v143, sel_loadView);
  if (!objc_msgSend__assistantUIController(self, v3, v4))
  {
    v6 = objc_alloc_init(AssistantUIController);
    objc_msgSend_set_assistantUIController_(self, v7, (uint64_t)v6);
  }
  objc_msgSend_setDelegate_(self, v5, (uint64_t)self);
  v8 = objc_alloc(MEMORY[0x24BDF6860]);
  v10 = (id)objc_msgSend_initWithBarButtonSystemItem_target_action_(v8, v9, 1, self, sel_handleCancelButton_);
  objc_msgSend_setCancelButton_(self, v11, (uint64_t)v10);
  v12 = objc_alloc(MEMORY[0x24BDF6860]);
  v13 = sub_21A690C10((uint64_t)CFSTR("kNext"), qword_2550F4DE8);
  v15 = (id)objc_msgSend_initWithTitle_style_target_action_(v12, v14, v13, 2, self, sel_handleNextButton_);
  objc_msgSend_setNextButton_(self, v16, (uint64_t)v15);
  v19 = objc_msgSend_cancelButton(self, v17, v18);
  v22 = (void *)objc_msgSend_navigationItem(self, v20, v21);
  objc_msgSend_setLeftBarButtonItem_(v22, v23, v19);
  Button = objc_msgSend_nextButton(self, v24, v25);
  v29 = (void *)objc_msgSend_navigationItem(self, v27, v28);
  objc_msgSend_setRightBarButtonItem_(v29, v30, Button);
  v33 = (void *)objc_msgSend_nextButton(self, v31, v32);
  objc_msgSend_setEnabled_(v33, v34, 0);
  v37 = (void *)objc_msgSend_cancelButton(self, v35, v36);
  objc_msgSend_setEnabled_(v37, v38, 0);
  LODWORD(v40) = objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v39, (uint64_t)self->_scanInfoRecord);
  if (!(_DWORD)v40)
  {
    v40 = objc_msgSend_callerParamDict(self, v41, v42);
    if (v40)
    {
      v45 = (void *)objc_msgSend_callerParamDict(self, v43, v44);
      v47 = (void *)objc_msgSend_objectForKey_(v45, v46, (uint64_t)CFSTR("wacShouldHideFindAppUI"));
      if (objc_msgSend_BOOLValue(v47, v48, v49))
        LODWORD(v40) = 4;
      else
        LODWORD(v40) = 0;
    }
  }
  v50 = sub_21A69111C(v40);
  v51 = sub_21A690C10((uint64_t)v50, qword_2550F4DE8);
  v54 = (void *)objc_msgSend_navigationItem(self, v52, v53);
  objc_msgSend_setTitle_(v54, v55, v51);
  objc_msgSend_setDelegate_(self->_assistantUIController, v56, (uint64_t)self);
  objc_msgSend_performSelector_withObject_afterDelay_(self, v57, (uint64_t)sel_initializeServiesDone, 0, 0.0);
  v60 = (void *)objc_msgSend_navigationController(self, v58, v59);
  objc_msgSend_setDelegate_(v60, v61, (uint64_t)self);
  v62 = objc_alloc(MEMORY[0x24BDF6860]);
  v63 = sub_21A690C10((uint64_t)CFSTR("kBack"), qword_2550F4DE8);
  v65 = (id)objc_msgSend_initWithTitle_style_target_action_(v62, v64, v63, 0, 0, 0);
  v68 = (void *)objc_msgSend_navigationItem(self, v66, v67);
  objc_msgSend_setBackBarButtonItem_(v68, v69, (uint64_t)v65);
  v142 = 0;
  v72 = (void *)objc_msgSend_view(self, v70, v71);
  objc_msgSend_frame(v72, v73, v74);
  self->justTextLabel = (UILabel *)objc_msgSend_labelViewInContainer_width_(AssistantSubUIViewController, v75, (uint64_t)&v142, v76);
  objc_msgSend_setJustTextContainerView_(self, v77, v142);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self->justTextContainerView, v78, 0);
  justTextLabel = self->justTextLabel;
  v80 = (void *)MEMORY[0x24BDD1628];
  v144 = CFSTR("height");
  v81 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_frame(justTextLabel, v82, v83);
  *(float *)&v85 = v84;
  v145[0] = objc_msgSend_numberWithFloat_(v81, v86, v87, v85);
  v89 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v88, (uint64_t)v145, &v144, 1);
  v90 = _NSDictionaryOfVariableBindings(CFSTR("justTextLabel"), self->justTextLabel, 0);
  v92 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v80, v91, (uint64_t)CFSTR("V:[justTextLabel(>=height)]"), 0, v89, v90);
  objc_msgSend_addConstraints_(justTextLabel, v93, v92);
  v141 = 0;
  v142 = 0;
  v96 = (void *)objc_msgSend_view(self, v94, v95);
  objc_msgSend_frame(v96, v97, v98);
  self->spinnerWithStatusBelowLabel = (UILabel *)objc_msgSend_labelViewInContainer_width_withSpinner_above_(AssistantSubUIViewController, v99, (uint64_t)&v142, &v141, 1, v100);
  v101 = v142;
  self->spinnerWithStatusBelowSpinner = v141;
  objc_msgSend_setSpinnerWithStatusBelowView_(self, v102, v101);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self->spinnerWithStatusBelowView, v103, 0);
  v142 = 0;
  v106 = (void *)objc_msgSend_view(self, v104, v105);
  objc_msgSend_frame(v106, v107, v108);
  v112 = objc_msgSend_topoViewWithWidth_(AssistantSubUIViewController, v109, v110, v111);
  objc_msgSend_setTopoView_(self, v113, v112);
  v116 = (void *)objc_msgSend_view(self, v114, v115);
  objc_msgSend_frame(v116, v117, v118);
  v122 = objc_msgSend_containerViewWithWidth_(AssistantSubUIViewController, v119, v120, v121);
  objc_msgSend_setTableHeaderContainerView_(self, v123, v122);
  v126 = (void *)objc_msgSend_view(self, v124, v125);
  objc_msgSend_frame(v126, v127, v128);
  v130 = v129;
  v133 = (void *)objc_msgSend_view(self, v131, v132);
  objc_msgSend_frame(v133, v134, v135);
  v139 = objc_msgSend_tableViewWithWidth_height_(AssistantSubUIViewController, v136, v137, v130, v138);
  objc_msgSend_setTableView_(self, v140, v139);
}

- (void)initializeServiesDone
{
  objc_msgSend_performSelector_withObject_afterDelay_(self, a2, (uint64_t)sel_readyToGuess, 0, 0.0);
}

- (void)dealloc
{
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  NSDictionary *mfiAccessoryResponseDict;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  objc_super v12;

  objc_msgSend_setPasswordAlert_(self, v3, 0);
  objc_msgSend_setAskUserQuestionAlert_(self, v4, 0);
  objc_msgSend_setConnectionVerificationAlert_(self, v5, 0);
  objc_msgSend_set_controllerContext_(self, v6, 0);
  mfiAccessoryResponseDict = self->_mfiAccessoryResponseDict;
  if (mfiAccessoryResponseDict)

  sub_21A690BE8();
  objc_msgSend_setCurrentSubController_(self, v8, 0);
  objc_msgSend_setJustTextContainerView_(self, v9, 0);
  objc_msgSend_setSpinnerWithStatusBelowView_(self, v10, 0);
  objc_msgSend_setTopoView_(self, v11, 0);
  v12.receiver = self;
  v12.super_class = (Class)AssistantUIViewController;
  -[AUUITableViewController dealloc](&v12, sel_dealloc);
}

- (void)readyToGuess
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;

  v6 = objc_msgSend_macAddress(self, a2, v2);
  if (v6
    || (v7 = (void *)objc_msgSend_scanInfoRecord(self, v4, v5),
        (v6 = objc_msgSend_objectForKey_(v7, v8, (uint64_t)CFSTR("BSSID"))) != 0)
    || (v9 = (void *)objc_msgSend_scanInfoRecord(self, v4, v5),
        (v6 = objc_msgSend_objectForKey_(v9, v10, (uint64_t)CFSTR("raMA"))) != 0))
  {
    v11 = objc_msgSend_scanInfoRecord(self, v4, v5);
    objc_msgSend_setTargetScanRecord_(self->_assistantUIController, v12, v11);
    objc_msgSend_setTargetMACAddress_(self->_assistantUIController, v13, v6);
    v16 = objc_msgSend_paramScanResults(self, v14, v15);
    objc_msgSend_setParamScanResults_(self->_assistantUIController, v17, v16);
    MEMORY[0x24BEDD108](self->_assistantUIController, sel_startAutoGuess, v18);
  }
}

- (void)baseStationConfigurationComplete:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  if (objc_msgSend_doneWithAssistant_(self->_assistantUIController, a2, 0) != -6771)
  {
    v6 = objc_msgSend_assistantResult(self->_assistantUIController, v4, v5);
    MEMORY[0x24BEDD108](self, sel_doneWithAssistantResult_, v6);
  }
}

- (void)callbackAskCancel
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;

  if (objc_msgSend__controllerContext(self, a2, v2))
    objc_msgSend_set_controllerContext_(self, v4, 0);
  v6 = (void *)objc_msgSend_uiAlert(self, v4, v5);
  objc_msgSend_dismissWithNoActionAnimated_(v6, v7, 1);
}

- (BOOL)auUIAlertOKAction:(id)a3
{
  const char *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;

  switch(objc_msgSend_tag(a3, a2, (uint64_t)a3))
  {
    case 4000:
      objc_msgSend_skipWANPort(self, v5, v6);
      goto LABEL_10;
    case 4001:
      v8 = (void *)objc_msgSend_uiAlert(self, v5, v6);
      v11 = (void *)objc_msgSend_context(v8, v9, v10);
      v14 = (void *)objc_msgSend_textField(a3, v12, v13);
      v17 = objc_msgSend_text(v14, v15, v16);
      objc_msgSend_callbackAskUserForPasswordResult_password_remember_(v11, v18, 0, v17, 2);
      goto LABEL_10;
    case 4002:
      v19 = (void *)objc_msgSend_uiAlert(self, v5, v6);
      v22 = (void *)objc_msgSend_context(v19, v20, v21);
      objc_msgSend_callbackAskUserAQuestionResult_result_(v22, v23, 4, 0);
      goto LABEL_10;
    case 4003:
      v24 = (void *)objc_msgSend_uiAlert(self, v5, v6);
      v27 = (void *)objc_msgSend_context(v24, v25, v26);
      objc_msgSend_callbackAskUserAQuestionResult_result_(v27, v28, 5, 4294960539);
      goto LABEL_10;
    case 4004:
      v29 = (void *)objc_msgSend_uiAlert(self, v5, v6);
      v32 = (void *)objc_msgSend_context(v29, v30, v31);
      v35 = (void *)objc_msgSend_textField(a3, v33, v34);
      v38 = objc_msgSend_text(v35, v36, v37);
      objc_msgSend_callbackAskUserForSetupCodeResult_password_(v32, v39, 0, v38);
      goto LABEL_10;
    case 4005:
      v40 = (void *)objc_msgSend_uiAlert(self, v5, v6);
      v43 = (void *)objc_msgSend_context(v40, v41, v42);
      objc_msgSend_callbackAskUserForUncertifiedResult_(v43, v44, 0);
LABEL_10:
      v7 = 1;
      break;
    default:
      v7 = 0;
      break;
  }
  objc_msgSend_setUiAlert_(self, v5, 0);
  return v7;
}

- (BOOL)auUIAlertCancelAction:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  BOOL v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;

  switch(objc_msgSend_tag(a3, a2, (uint64_t)a3))
  {
    case 4000:
      goto LABEL_9;
    case 4001:
      v6 = (void *)objc_msgSend_uiAlert(self, v4, v5);
      v9 = (void *)objc_msgSend_context(v6, v7, v8);
      objc_msgSend_callbackAskUserForPasswordResult_password_remember_(v9, v10, 4294960573, 0, 2);
      goto LABEL_9;
    case 4002:
      v12 = (void *)objc_msgSend_uiAlert(self, v4, v5);
      v15 = (void *)objc_msgSend_context(v12, v13, v14);
      objc_msgSend_callbackAskUserAQuestionResult_result_(v15, v16, 4, 4294960573);
      goto LABEL_9;
    case 4003:
      v17 = (void *)objc_msgSend_uiAlert(self, v4, v5);
      v20 = (void *)objc_msgSend_context(v17, v18, v19);
      objc_msgSend_callbackAskUserAQuestionResult_result_(v20, v21, 5, 4294960527);
      goto LABEL_9;
    case 4004:
      v22 = (void *)objc_msgSend_uiAlert(self, v4, v5);
      v25 = (void *)objc_msgSend_context(v22, v23, v24);
      objc_msgSend_callbackAskUserForSetupCodeResult_password_(v25, v26, 4294960573, &stru_24DD08368);
      goto LABEL_9;
    case 4005:
      v27 = (void *)objc_msgSend_uiAlert(self, v4, v5);
      v30 = (void *)objc_msgSend_context(v27, v28, v29);
      objc_msgSend_callbackAskUserForUncertifiedResult_(v30, v31, 4294960573);
LABEL_9:
      v11 = 1;
      break;
    default:
      v11 = 0;
      break;
  }
  objc_msgSend_setUiAlert_(self, v4, 0);
  return v11;
}

- (BOOL)auUIAlertAlternateAction:(id)a3
{
  return 0;
}

- (BOOL)auUIAlertDestructiveAction:(id)a3
{
  return 0;
}

- (int)callbackAskUserForUncertifiedForController:(id)a3
{
  AUUIAlert *v6;
  const char *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;

  if (objc_msgSend_uiAlert(self, a2, (uint64_t)a3))
    return -6721;
  sub_21A690BB0(CFSTR("SetupRecommendations"));
  v6 = [AUUIAlert alloc];
  v8 = (id)objc_msgSend_initWithViewController_(v6, v7, (uint64_t)self);
  objc_msgSend_setUiAlert_(self, v9, (uint64_t)v8);
  v10 = sub_21A690C10((uint64_t)CFSTR("kAddHomeKitAccessoryTitle"), qword_2550F4DE8);
  objc_msgSend_setTitle_(self->uiAlert, v11, v10);
  v12 = sub_21A690C10((uint64_t)CFSTR("kAddHomeKitAccessoryMessage"), qword_2550F4DE8);
  objc_msgSend_setMessage_(self->uiAlert, v13, v12);
  objc_msgSend_setDelegate_(self->uiAlert, v14, (uint64_t)self);
  v15 = sub_21A690C10((uint64_t)CFSTR("kAddHomeKitAccessoryAddAnyway"), qword_2550F4DE8);
  objc_msgSend_setOkButtonTitle_(self->uiAlert, v16, v15);
  v17 = sub_21A690C10((uint64_t)CFSTR("kCancel"), qword_2550F4DE8);
  objc_msgSend_setCancelButtonTitle_(self->uiAlert, v18, v17);
  objc_msgSend_setContext_(self->uiAlert, v19, (uint64_t)a3);
  objc_msgSend_setTag_(self->uiAlert, v20, 4005);
  objc_msgSend_show(self->uiAlert, v21, v22);
  return 0;
}

- (int)callbackAskUserForPassword:(int)a3 param:(id)a4 forController:(id)a5
{
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t valid;
  AUPasswordUIAlert *v15;
  const char *v16;
  id v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;

  if (!a4)
    return -6705;
  if (objc_msgSend_uiAlert(self, a2, *(uint64_t *)&a3))
    return -6721;
  if (!a3)
  {
    v10 = CFSTR("kAskUserForBasePassword");
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    v10 = CFSTR("kAskUserForNetworkPassword");
LABEL_9:
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = sub_21A690C10((uint64_t)v10, qword_2550F4DE8);
    valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v11, v13, v12, CFSTR("%@"), 0, a4);
    v15 = [AUPasswordUIAlert alloc];
    v17 = (id)objc_msgSend_initWithViewController_(v15, v16, (uint64_t)self);
    objc_msgSend_setUiAlert_(self, v18, (uint64_t)v17);
    objc_msgSend_setTitle_(self->uiAlert, v19, valid);
    objc_msgSend_setMessage_(self->uiAlert, v20, (uint64_t)&stru_24DD08368);
    objc_msgSend_setDelegate_(self->uiAlert, v21, (uint64_t)self);
    v22 = sub_21A690C10((uint64_t)CFSTR("kOK"), qword_2550F4DE8);
    objc_msgSend_setOkButtonTitle_(self->uiAlert, v23, v22);
    v24 = sub_21A690C10((uint64_t)CFSTR("kCancel"), qword_2550F4DE8);
    objc_msgSend_setCancelButtonTitle_(self->uiAlert, v25, v24);
    objc_msgSend_setContext_(self->uiAlert, v26, (uint64_t)a5);
    objc_msgSend_setTag_(self->uiAlert, v27, 4001);
    objc_msgSend_show(self->uiAlert, v28, v29);
    return 0;
  }
  return -6705;
}

- (int)callbackAskUserForSetupCode:(int)a3 isRetry:(BOOL)a4 forController:(id)a5
{
  _BOOL4 v6;
  const __CFString *v9;
  uint64_t v10;
  AUSetupCodeUIAlert *v11;
  const char *v12;
  id v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;

  v6 = a4;
  if (objc_msgSend_uiAlert(self, a2, *(uint64_t *)&a3))
    return -6721;
  sub_21A690BB0(CFSTR("SetupRecommendations"));
  if (v6)
    v9 = CFSTR("kAskUserForSetupCodeRetry");
  else
    v9 = CFSTR("kAskUserForSetupCode");
  v10 = sub_21A690C10((uint64_t)v9, qword_2550F4DE8);
  v11 = [AUSetupCodeUIAlert alloc];
  v13 = (id)objc_msgSend_initWithViewController_(v11, v12, (uint64_t)self);
  objc_msgSend_setUiAlert_(self, v14, (uint64_t)v13);
  objc_msgSend_setTitle_(self->uiAlert, v15, v10);
  objc_msgSend_setMessage_(self->uiAlert, v16, (uint64_t)&stru_24DD08368);
  objc_msgSend_setDelegate_(self->uiAlert, v17, (uint64_t)self);
  v18 = sub_21A690C10((uint64_t)CFSTR("kOK"), qword_2550F4DE8);
  objc_msgSend_setOkButtonTitle_(self->uiAlert, v19, v18);
  v20 = sub_21A690C10((uint64_t)CFSTR("kCancel"), qword_2550F4DE8);
  objc_msgSend_setCancelButtonTitle_(self->uiAlert, v21, v20);
  objc_msgSend_setContext_(self->uiAlert, v22, (uint64_t)a5);
  objc_msgSend_setTag_(self->uiAlert, v23, 4004);
  objc_msgSend_show(self->uiAlert, v24, v25);
  return 0;
}

- (int)callbackAskUserAQuestion:(int)a3 paramDict:(id)a4 forController:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  AUUIAlert *v17;
  const char *v18;
  id v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  const char *v37;
  uint64_t valid;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  const __CFString *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  AUUIAlert *v55;
  const char *v56;
  id v57;
  const char *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;

  if (self->_controllerContext)
    return -6721;
  if (a3 == 5)
  {
    if (a4)
    {
      v9 = objc_msgSend_objectForKey_(a4, a2, (uint64_t)CFSTR("kAssistantCallbackAskUserParamKey_MessageKey"));
      v10 = sub_21A690C10(v9, qword_2550F4DE8);
      v12 = objc_msgSend_objectForKey_(a4, v11, (uint64_t)CFSTR("kAssistantCallbackAskUserParamKey_OKKey"));
      v13 = sub_21A690C10(v12, qword_2550F4DE8);
      v15 = objc_msgSend_objectForKey_(a4, v14, (uint64_t)CFSTR("kAssistantCallbackAskUserParamKey_CancelKey"));
      v16 = sub_21A690C10(v15, qword_2550F4DE8);
      v17 = [AUUIAlert alloc];
      v19 = (id)objc_msgSend_initWithViewController_(v17, v18, (uint64_t)self);
      objc_msgSend_setUiAlert_(self, v20, (uint64_t)v19);
      objc_msgSend_setTitle_(self->uiAlert, v21, v10);
      objc_msgSend_setMessage_(self->uiAlert, v22, (uint64_t)&stru_24DD08368);
      objc_msgSend_setDelegate_(self->uiAlert, v23, (uint64_t)self);
      objc_msgSend_setOkButtonTitle_(self->uiAlert, v24, v13);
      objc_msgSend_setCancelButtonTitle_(self->uiAlert, v25, v16);
      objc_msgSend_setContext_(self->uiAlert, v26, (uint64_t)a5);
      objc_msgSend_setTag_(self->uiAlert, v27, 4003);
      objc_msgSend_show(self->uiAlert, v28, v29);
      return 0;
    }
  }
  else
  {
    if (a3 != 4)
    {
      if (a3 == 3)
        objc_msgSend_callbackAskUserAQuestionResult_result_(a5, a2, *(uint64_t *)&a3, 0);
      return 0;
    }
    if (a4)
    {
      v30 = objc_msgSend_objectForKey_(a4, a2, (uint64_t)CFSTR("kAssistantCallbackAskUserParamKey_Warning_MessageKey"));
      v32 = objc_msgSend_objectForKey_(a4, v31, (uint64_t)CFSTR("kAssistantCallbackAskUserParamKey_Warning_MessageParam1"));
      v34 = objc_msgSend_objectForKey_(a4, v33, (uint64_t)CFSTR("kAssistantCallbackAskUserParamKey_Warning_MessageParam2"));
      v35 = (void *)MEMORY[0x24BDD17C8];
      v36 = sub_21A690C10(v30, qword_2550F4DE8);
      valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v35, v37, v36, CFSTR("%@%@"), 0, v32, v34);
      v40 = objc_msgSend_objectForKey_(a4, v39, (uint64_t)CFSTR("kAssistantCallbackAskUserParamKey_Warning_PromptKey"));
      v42 = objc_msgSend_objectForKey_(a4, v41, (uint64_t)CFSTR("kAssistantCallbackAskUserParamKey_Warning_PromptParam1"));
      v44 = objc_msgSend_objectForKey_(a4, v43, (uint64_t)CFSTR("kAssistantCallbackAskUserParamKey_Warning_PromptParam2"));
      v45 = (void *)MEMORY[0x24BDD17C8];
      v46 = sub_21A690C10(v40, qword_2550F4DE8);
      v48 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v45, v47, v46, CFSTR("%@%@"), 0, v42, v44);
      v50 = (const __CFString *)objc_msgSend_objectForKey_(a4, v49, (uint64_t)CFSTR("kAssistantCallbackAskUserParamKey_OKKey"));
      if (!v50)
        v50 = CFSTR("kOK");
      v51 = sub_21A690C10((uint64_t)v50, qword_2550F4DE8);
      v53 = objc_msgSend_objectForKey_(a4, v52, (uint64_t)CFSTR("kAssistantCallbackAskUserParamKey_CancelKey"));
      if (v53)
        v53 = sub_21A690C10(v53, qword_2550F4DE8);
      if (v53)
        v54 = v51;
      else
        v54 = 0;
      if (v53)
        v51 = v53;
      v55 = [AUUIAlert alloc];
      v57 = (id)objc_msgSend_initWithViewController_(v55, v56, (uint64_t)self);
      objc_msgSend_setUiAlert_(self, v58, (uint64_t)v57);
      objc_msgSend_setTitle_(self->uiAlert, v59, v48);
      objc_msgSend_setMessage_(self->uiAlert, v60, valid);
      objc_msgSend_setDelegate_(self->uiAlert, v61, (uint64_t)self);
      objc_msgSend_setOkButtonTitle_(self->uiAlert, v62, v54);
      objc_msgSend_setCancelButtonTitle_(self->uiAlert, v63, v51);
      objc_msgSend_setContext_(self->uiAlert, v64, (uint64_t)a5);
      objc_msgSend_setTag_(self->uiAlert, v65, 4002);
      objc_msgSend_show(self->uiAlert, v66, v67);
      return 0;
    }
  }
  return -6705;
}

- (void)playDoneSound
{
  void *v2;
  uint64_t v3;
  const char *v4;
  void *v5;
  const char *v6;
  const __CFString *v7;
  const __CFURL *v8;
  OSStatus v9;
  SystemSoundID outSystemSoundID;

  v2 = (void *)MEMORY[0x24BDD1488];
  v3 = objc_opt_class();
  v5 = (void *)objc_msgSend_bundleForClass_(v2, v4, v3);
  v7 = (const __CFString *)objc_msgSend_pathForResource_ofType_(v5, v6, (uint64_t)CFSTR("burn complete.aif"), &stru_24DD08368);
  v8 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x24BDBD260], v7, kCFURLPOSIXPathStyle, 0);
  outSystemSoundID = 0;
  v9 = AudioServicesCreateSystemSoundID(v8, &outSystemSoundID);
  CFRelease(v8);
  if (!v9)
  {
    AudioServicesAddSystemSoundCompletion(outSystemSoundID, 0, 0, (AudioServicesSystemSoundCompletionProc)sub_21A67BE2C, 0);
    AudioServicesPlayAlertSound(outSystemSoundID);
  }
}

- (void)showTellUserToResetBroadbandDeviceForStatus:(int)a3 paramDict:(id)a4
{
  InternetViewController *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;

  v5 = [InternetViewController alloc];
  v7 = (void *)objc_msgSend_initWithNibName_bundle_(v5, v6, 0, 0);
  v10 = objc_msgSend_guessCompleteDict(self->_assistantUIController, v8, v9);
  v12 = objc_msgSend_unconfiguredBaseStationFromGuessCompleteDict_(AutoGuessController, v11, v10);
  if (v12)
  {
    v14 = v12;
    objc_msgSend_setCurrentSubController_(self, v13, (uint64_t)v7);
    v17 = (void *)objc_msgSend_currentSubController(self, v15, v16);
    objc_msgSend_setInParamDict_(v17, v18, v14);
    v21 = (void *)objc_msgSend_currentSubController(self, v19, v20);
    objc_msgSend_setParentController_(v21, v22, (uint64_t)self);

    self->_currentUIConfigStep = 1;
    objc_msgSend_presentInternetDisconnectedUI(v7, v23, v24);
    objc_msgSend_setDelegate_(v7, v25, (uint64_t)self);
    objc_msgSend_pushViewController_animated_(self, v26, (uint64_t)v7, 1);
  }
}

- (void)showAskUserForPPPoECredentialsForStatus:(int)a3 paramDict:(id)a4
{
  PPPoEViewController *v5;
  const char *v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;

  v5 = [PPPoEViewController alloc];
  v7 = (void *)objc_msgSend_initWithNibName_bundle_(v5, v6, 0, 0);
  objc_msgSend_setCurrentSubController_(self, v8, (uint64_t)v7);
  v11 = (void *)objc_msgSend_currentSubController(self, v9, v10);
  objc_msgSend_setParentController_(v11, v12, (uint64_t)self);

  self->_currentUIConfigStep = 3;
  objc_msgSend_pushViewController_animated_(self, v13, (uint64_t)v7, 1);
}

- (void)showUIConfigPromptToSendDiagsUsageStatsWithParamDict:(id)a3
{
  AssistantDiagsUsageStatsUIViewController *v4;
  const char *v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;

  v4 = [AssistantDiagsUsageStatsUIViewController alloc];
  v6 = (void *)objc_msgSend_initWithNibName_bundle_(v4, v5, 0, 0);
  objc_msgSend_setCurrentSubController_(self, v7, (uint64_t)v6);
  v10 = (void *)objc_msgSend_currentSubController(self, v8, v9);
  objc_msgSend_setParentController_(v10, v11, (uint64_t)self);

  self->_currentUIConfigStep = 7;
  objc_msgSend_pushViewController_animated_(self, v12, (uint64_t)v6, 1);
}

- (void)showUIConfigPromptForGuestNetConfigWithParamDict:(id)a3
{
  uint64_t v5;
  const char *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;

  v5 = objc_msgSend_newStepByStepControllerForStep_(self, a2, 3);
  if (v5)
  {
    v7 = (void *)v5;
    v8 = (void *)MEMORY[0x24BDBCE70];
    v9 = objc_msgSend_objectForKey_(a3, v6, (uint64_t)CFSTR("kBSConfigurationUIConfig_TargetBaseKey"));
    v11 = objc_msgSend_objectForKey_(a3, v10, (uint64_t)CFSTR("kBSConfigurationUIConfig_BaseNameKey"));
    v13 = objc_msgSend_objectForKey_(a3, v12, (uint64_t)CFSTR("kBSConfigurationUIConfig_NetworkameKey"));
    v15 = objc_msgSend_dictionaryWithObjectsAndKeys_(v8, v14, v9, CFSTR("kSBSKey_TargetBase"), v11, CFSTR("kSBSKey_BaseName"), v13, CFSTR("kSBSKey_NetworkName"), 0);
    objc_msgSend_setInParamDict_(v7, v16, v15);
    objc_msgSend_setCurrentSubController_(self, v17, (uint64_t)v7);
    v20 = (void *)objc_msgSend_currentSubController(self, v18, v19);
    objc_msgSend_setParentController_(v20, v21, (uint64_t)self);

    self->_currentUIConfigStep = 8;
    objc_msgSend_pushViewController_animated_(self, v22, (uint64_t)v7, 1);
  }
}

- (void)showTellUserToPlugInEthernetForStatus:(int)a3 paramDict:(id)a4
{
  InternetViewController *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;

  v5 = [InternetViewController alloc];
  v7 = (void *)objc_msgSend_initWithNibName_bundle_(v5, v6, 0, 0);
  v10 = objc_msgSend_guessCompleteDict(self->_assistantUIController, v8, v9);
  v12 = objc_msgSend_unconfiguredBaseStationFromGuessCompleteDict_(AutoGuessController, v11, v10);
  if (v12)
  {
    v14 = v12;
    objc_msgSend_setCurrentSubController_(self, v13, (uint64_t)v7);
    v17 = (void *)objc_msgSend_currentSubController(self, v15, v16);
    objc_msgSend_setInParamDict_(v17, v18, v14);
    v21 = (void *)objc_msgSend_currentSubController(self, v19, v20);
    objc_msgSend_setParentController_(v21, v22, (uint64_t)self);

    self->_currentUIConfigStep = 1;
    objc_msgSend_presentInternetWANPluginUI(v7, v23, v24);
    objc_msgSend_setDelegate_(v7, v25, (uint64_t)self);
    objc_msgSend_pushViewController_animated_(self, v26, (uint64_t)v7, 1);
  }
}

- (void)showAskUserSwapCablingForStatus:(int)a3 paramDict:(id)a4
{
  uint64_t v5;
  InternetViewController *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;

  if (a3 == -6771)
  {
    v5 = objc_msgSend_currentSubController(self, a2, *(uint64_t *)&a3, a4);
    MEMORY[0x24BEDD108](v5, sel_presentSwapCablingCompleteUI, v31);
  }
  else
  {
    v7 = [InternetViewController alloc];
    v9 = (void *)objc_msgSend_initWithNibName_bundle_(v7, v8, 0, 0);
    v11 = objc_msgSend_objectForKey_(a4, v10, (uint64_t)CFSTR("kBSConfigurationSwapCabling_TargetBase"));
    if (v11)
    {
      v13 = v11;
      v14 = objc_msgSend_objectForKey_(a4, v12, (uint64_t)CFSTR("kBSConfigurationSwapCabling_SourceBase"));
      if (v14)
      {
        v16 = v14;
        objc_msgSend_setCurrentSubController_(self, v15, (uint64_t)v9);
        v18 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCE70], v17, v13, CFSTR("kSBSKey_TargetBase"), v16, CFSTR("kSBSKey_SourceBase"), 0);
        v21 = (void *)objc_msgSend_currentSubController(self, v19, v20);
        objc_msgSend_setInParamDict_(v21, v22, v18);
        v25 = (void *)objc_msgSend_currentSubController(self, v23, v24);
        objc_msgSend_setParentController_(v25, v26, (uint64_t)self);

        self->_currentUIConfigStep = 5;
        objc_msgSend_presentSwapCablingUI(v9, v27, v28);
        objc_msgSend_setDelegate_(v9, v29, (uint64_t)self);
        objc_msgSend_pushViewController_animated_(self, v30, (uint64_t)v9, 1);
      }
    }
  }
}

- (void)showTellUserToFixTheirInternetConnection
{
  InternetViewController *v3;
  const char *v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;

  v3 = [InternetViewController alloc];
  v5 = (void *)objc_msgSend_initWithNibName_bundle_(v3, v4, 0, 0);
  objc_msgSend_setCurrentSubController_(self, v6, (uint64_t)v5);
  v9 = (void *)objc_msgSend_currentSubController(self, v7, v8);
  objc_msgSend_setParentController_(v9, v10, (uint64_t)self);

  objc_msgSend_pushViewController_animated_(self, v11, (uint64_t)v5, 1);
}

- (void)handeImmediateCancel
{
  MEMORY[0x24BEDD108](self, sel_handleCancelRequest_, 1);
}

- (void)handleCancelButton:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_handleCancelRequest_, 0);
}

- (void)handleNextButton:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  unint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  AssistantUIController *assistantUIController;
  uint64_t v34;
  const char *v35;
  int currentUIConfigStep;

  switch(objc_msgSend_state(self->_assistantUIController, a2, (uint64_t)a3))
  {
    case 2u:
      v6 = (void *)objc_msgSend_navigationController(self, v4, v5);
      v9 = (void *)objc_msgSend_topViewController(v6, v7, v8);
      v12 = (void *)objc_msgSend_tableManager(v9, v10, v11);
      v15 = (void *)objc_msgSend_tableManager(v9, v13, v14);
      v17 = objc_msgSend_indexOfSectionWithIdentifier_(v15, v16, (uint64_t)CFSTR("ActionTableSection"));
      v19 = objc_msgSend_tagOfSelectedRowInMenuSection_(v12, v18, v17);
      self->_selectedActionTag = v19;
      switch(v19)
      {
        case 0x5072696DuLL:
          goto LABEL_5;
        case 0x4D6F7265uLL:
          MEMORY[0x24BEDD108](self->_assistantUIController, sel_startStepByStepFromAutoGuessRecommendation, v21);
          break;
        case 0uLL:
LABEL_5:
          v22 = objc_msgSend_outResultsDict(v9, v20, v21);
          MEMORY[0x24BEDD108](self, sel_startSetup_, v22);
          break;
      }
      return;
    case 3u:
      v23 = (void *)objc_msgSend_navigationController(self, v4, v5);
      v32 = (void *)objc_msgSend_topViewController(v23, v24, v25);
      if (dword_2550EE510 <= 100 && (dword_2550EE510 != -1 || sub_21A69876C((uint64_t)&dword_2550EE510, 0x64u)))
        sub_21A698FDC((uint64_t)&dword_2550EE510, (uint64_t)"-[AssistantUIViewController handleNextButton:]", 100, (uint64_t)"GOING FORWARD from current controller %@\n", v28, v29, v30, v31, (uint64_t)v32);
      assistantUIController = self->_assistantUIController;
      v34 = objc_msgSend_outResultsDict(v32, v26, v27);
      objc_msgSend_presentUIForStepByStepNextStepResult_withOptions_(assistantUIController, v35, 0, v34);
      return;
    case 6u:
      switch(self->_currentUIConfigStep)
      {
        case 1:
          MEMORY[0x24BEDD108](self, sel_confirmSkipWANPort, v5);
          break;
        case 3:
          MEMORY[0x24BEDD108](self, sel_continueWithPPPoESettings, v5);
          break;
        case 5:
          MEMORY[0x24BEDD108](self, sel_continueWithSwapCabling, v5);
          break;
        case 6:
          MEMORY[0x24BEDD108](self, sel_skipPluginAudioCabling, v5);
          break;
        default:
          return;
      }
      return;
    case 7u:
      currentUIConfigStep = self->_currentUIConfigStep;
      if (currentUIConfigStep == 8)
      {
        MEMORY[0x24BEDD108](self, sel_continueWithGuestNetSettings, v5);
      }
      else if (currentUIConfigStep == 7)
      {
        MEMORY[0x24BEDD108](self, sel_continueWithDiagsAndUsageStats, v5);
      }
      return;
    default:
      return;
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  int currentUIConfigStep;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  self->_goingBack = 0;
  if (objc_msgSend_currentSubController(self, a2, (uint64_t)a3, a4, a5)
    && (id)objc_msgSend_currentSubController(self, v8, v9) != a4)
  {
    v14 = (void *)objc_msgSend_viewControllers(a3, v8, v9);
    v17 = objc_msgSend_currentSubController(self, v15, v16);
    self->_goingBack = objc_msgSend_indexOfObject_(v14, v18, v17) == 0x7FFFFFFFFFFFFFFFLL;
  }
  if (dword_2550EE510 <= 100 && (dword_2550EE510 != -1 || sub_21A69876C((uint64_t)&dword_2550EE510, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE510, (uint64_t)"-[AssistantUIViewController navigationController:didShowViewController:animated:]", 100, (uint64_t)"%@\n", v10, v11, v12, v13, (uint64_t)a4);
  if (objc_msgSend_state(self->_assistantUIController, v8, v9) == 3)
  {
    if (!self->_goingBack)
      goto LABEL_26;
    objc_msgSend_presentUIForStepByStepNextStepResult_withOptions_(self->_assistantUIController, v19, 4294960527, 0);
    goto LABEL_19;
  }
  if (objc_msgSend_state(self->_assistantUIController, v19, v20) == 6)
  {
    if (!self->_goingBack)
      goto LABEL_26;
    currentUIConfigStep = self->_currentUIConfigStep;
    if ((currentUIConfigStep - 3) < 4 || currentUIConfigStep == 1)
      objc_msgSend_presentUIForConnectionVerificationResult_withOptions_(self->_assistantUIController, v19, 4294960527, 0);
LABEL_19:
    if (dword_2550EE510 <= 100 && (dword_2550EE510 != -1 || sub_21A69876C((uint64_t)&dword_2550EE510, 0x64u)))
    {
      v23 = objc_msgSend_currentSubController(self, v19, v20);
      sub_21A698FDC((uint64_t)&dword_2550EE510, (uint64_t)"-[AssistantUIViewController navigationController:didShowViewController:animated:]", 100, (uint64_t)"GOING BACKWARD from %@ to %@\n", v24, v25, v26, v27, v23);
    }
    goto LABEL_26;
  }
  if (objc_msgSend_state(self->_assistantUIController, v19, v20) == 7 && self->_goingBack)
  {
    objc_msgSend_showUIConfigPromptResult_withOptions_(self->_assistantUIController, v19, 4294960527, 0);
    objc_msgSend_showUIForSetupStatus(self, v28, v29);
  }
LABEL_26:
  v30 = objc_msgSend_tableManager(self, v19, v20);
  MEMORY[0x24BEDD108](v30, sel_hideKeyboard, v31);
}

- (void)touchInCellAtIndexPath:(id)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_msgSend_section(a3, a2, (uint64_t)a3);
  v7 = (void *)objc_msgSend_tableManager(self, v5, v6);
  if (v4 == objc_msgSend_indexOfSectionWithIdentifier_(v7, v8, (uint64_t)CFSTR("ShowPasswords")))
  {
    MEMORY[0x24BEDD108](self, sel_setupCompleteShowPasswords_, !self->showingPasswordsAtEnd);
  }
  else
  {
    v11 = (void *)objc_msgSend_tableManager(self, v9, v10);
    if (v4 == objc_msgSend_indexOfSectionWithIdentifier_(v11, v12, (uint64_t)CFSTR("FindAppTableSection")))
      sub_21A736DE4((const __CFDictionary *)self->_mfiAccessoryResponseDict);
  }
}

- (void)assistantWaitingForResourcesStart
{
  uint64_t v2;
  void *v3;
  const char *v4;

  v3 = (void *)objc_msgSend_cancelButton(self, a2, v2);
  objc_msgSend_setEnabled_(v3, v4, 1);
}

- (void)assistantWaitingForResourcesComplete
{
  uint64_t v2;
  void *v3;
  const char *v4;

  v3 = (void *)objc_msgSend_cancelButton(self, a2, v2);
  objc_msgSend_setEnabled_(v3, v4, 0);
}

- (void)assistantUpdateProgress:(id)a3 forState:(int)a4
{
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  UILabel *justTextLabel;
  char *justTextContainerView;
  void *v13;
  const char *v14;
  const char *v15;

  switch(a4)
  {
    case 1:
    case 6:
      goto LABEL_8;
    case 3:
    case 4:
      if (objc_msgSend_length(a3, a2, (uint64_t)a3))
      {
        objc_msgSend_currentSubController(self, v6, v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v10 = objc_msgSend_currentSubController(self, v8, v9);
          MEMORY[0x24BEDD108](v10, sel_stepByStepUpdateProgress_forState_, a3);
        }
      }
      return;
    case 5:
      goto LABEL_7;
    case 8:
      if (objc_msgSend_settingUpStatusText(self, a2, (uint64_t)a3))
      {
        justTextLabel = self->justTextLabel;
        justTextContainerView = (char *)self->justTextContainerView;
        v13 = (void *)objc_msgSend_settingUpStatusText(self, a2, (uint64_t)a3);
        sub_21A6829C8(justTextLabel, justTextContainerView, v13);
        objc_msgSend_setSettingUpStatusText_(self, v14, 0);
      }
LABEL_7:
      if (objc_msgSend_length(a3, a2, (uint64_t)a3))
      {
LABEL_8:
        sub_21A6829C8(self->spinnerWithStatusBelowLabel, (char *)self->spinnerWithStatusBelowView, a3);
        objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v15, (uint64_t)self->tableHeaderContainerView);
      }
      break;
    default:
      return;
  }
}

- (void)doneWithAssistantResult:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AssistantUIController *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;

  v7 = *(_QWORD *)&a3;
  if (dword_2550EE510 <= 100 && (dword_2550EE510 != -1 || sub_21A69876C((uint64_t)&dword_2550EE510, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE510, (uint64_t)"-[AssistantUIViewController doneWithAssistantResult:]", 100, (uint64_t)" result %d\n", v3, v4, v5, v6, v7);
  v9 = self->_assistantUIController;
  objc_msgSend_set_assistantUIController_(self, v10, 0);
  v13 = (void *)objc_msgSend_uiAlert(self, v11, v12);
  objc_msgSend_dismissWithNoActionAnimated_(v13, v14, 1);
  if (self->_assistantDelegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend_assistantCompleteWithResult_(self->_assistantDelegate, v15, v7);
      self->_assistantDelegate = 0;
    }
  }
}

- (void)presentUIForRecommendationStatus
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  UILabel *justTextLabel;
  char *justTextContainerView;
  void *v9;
  UILabel *spinnerWithStatusBelowLabel;
  char *spinnerWithStatusBelowView;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  UIView *tableHeaderContainerView;
  uint64_t v18;
  const char *v19;
  UIView *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *Button;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;

  v4 = (void *)objc_msgSend_tableManager(self, a2, v2);
  objc_msgSend_cleanTableViewForReuse(v4, v5, v6);
  justTextLabel = self->justTextLabel;
  justTextContainerView = (char *)self->justTextContainerView;
  v9 = (void *)sub_21A690C10((uint64_t)CFSTR("CheckingOutYourNetwork"), qword_2550F4DE8);
  sub_21A6829C8(justTextLabel, justTextContainerView, v9);
  spinnerWithStatusBelowLabel = self->spinnerWithStatusBelowLabel;
  spinnerWithStatusBelowView = (char *)self->spinnerWithStatusBelowView;
  v12 = (void *)sub_21A690C10((uint64_t)CFSTR("kIntializingServicesString"), qword_2550F4DE8);
  sub_21A6829C8(spinnerWithStatusBelowLabel, spinnerWithStatusBelowView, v12);
  if (!objc_msgSend_subviews(self->tableHeaderContainerView, v13, v14))
  {
    tableHeaderContainerView = self->tableHeaderContainerView;
    v18 = objc_msgSend_arrayWithObjects_(MEMORY[0x24BDBCE30], v15, (uint64_t)self->justTextContainerView, self->spinnerWithStatusBelowView, 0);
    objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(self, v19, (uint64_t)tableHeaderContainerView, v18, 1);
  }
  v20 = self->tableHeaderContainerView;
  v21 = (void *)objc_msgSend_tableView(self, v15, v16);
  objc_msgSend_setTableHeaderView_(v21, v22, (uint64_t)v20);
  Button = (void *)objc_msgSend_nextButton(self, v23, v24);
  objc_msgSend_setEnabled_(Button, v26, 0);
  v29 = (void *)objc_msgSend_cancelButton(self, v27, v28);
  objc_msgSend_setEnabled_(v29, v30, 1);
  objc_msgSend_startAnimating(self->spinnerWithStatusBelowSpinner, v31, v32);
}

- (void)presentUIForRecommmendationTargetInfo:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  const char *v18;
  unsigned int v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  UIView *tableHeaderContainerView;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  AssistantUIController *assistantUIController;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;

  if (dword_2550EE510 <= 100 && (dword_2550EE510 != -1 || sub_21A69876C((uint64_t)&dword_2550EE510, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE510, (uint64_t)"-[AssistantUIViewController presentUIForRecommmendationTargetInfo:]", 100, (uint64_t)"targetInfo: %@\n", v3, v4, v5, v6, (uint64_t)a3);
  v9 = (void *)objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("kRecommendationTargetInfoKey_ProductID"));
  v11 = (void *)objc_msgSend_objectForKey_(a3, v10, (uint64_t)CFSTR("kRecommendationTargetInfoKey_DeviceKind"));
  v16 = objc_msgSend_integerValue(v11, v12, v13);
  if ((v16 - 3) > 1)
  {
    v19 = objc_msgSend_integerValue(v9, v14, v15);
    v17 = (uint64_t)sub_21A691584(v19, v16);
  }
  else
  {
    v17 = objc_msgSend_objectForKey_(a3, v14, (uint64_t)CFSTR("kRecommendationTargetInfoKey_BaseName"));
  }
  v20 = v17;
  v21 = (void *)objc_msgSend_arrayWithObject_(MEMORY[0x24BDBCEB8], v18, (uint64_t)self->justTextContainerView);
  v23 = v21;
  if ((v16 - 2) >= 3)
    objc_msgSend_addObject_(v21, v22, (uint64_t)self->topoView);
  objc_msgSend_addObject_(v23, v22, (uint64_t)self->spinnerWithStatusBelowView);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(self, v24, (uint64_t)self->tableHeaderContainerView, v23, 1);
  tableHeaderContainerView = self->tableHeaderContainerView;
  v28 = (void *)objc_msgSend_tableView(self, v26, v27);
  objc_msgSend_setTableHeaderView_(v28, v29, (uint64_t)tableHeaderContainerView);
  assistantUIController = self->_assistantUIController;
  v33 = objc_msgSend_layer(self->topoView, v31, v32);
  v36 = objc_msgSend_topoLayout(self, v34, v35);
  v39 = objc_msgSend_topoView(self, v37, v38);
  v41 = objc_msgSend_modifyTopoUIInLayer_withLayout_andOwningView_targetProductID_targetDeviceKind_targetName_targetWiFiName_sourceProductID_sourceDeviceKind_sourceName_sourceWiFiName_connectionType_(assistantUIController, v40, v33, v36, v39, v9, v11, v20, 0, 0, 0, 0, 0, 0);
  objc_msgSend_setTopoLayout_(self, v42, v41);
}

- (void)presentUIForRecommendationResult:(int)a3 paramDict:(id)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  AssistantUIViewController *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  UIView *tableHeaderContainerView;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *Button;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  const __CFString *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const __CFArray *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  const char *v68;
  const char *v69;
  void *v70;

  if (a3 == -6723)
  {
    MEMORY[0x24BEDD108](self, sel_doneWithAssistantResult_, 4294960573);
  }
  else
  {
    self->_goingBack = 0;
    v7 = (void *)objc_msgSend_navigationController(self, a2, *(uint64_t *)&a3);
    if ((AssistantUIViewController *)objc_msgSend_topViewController(v7, v8, v9) != self)
    {
      v12 = (void *)objc_msgSend_navigationController(self, v10, v11);
      v15 = objc_msgSend_topViewController(v12, v13, v14);
      objc_msgSend_setCurrentSubController_(self, v16, v15);
    }
    v17 = (void *)objc_msgSend_navigationController(self, v10, v11);
    v20 = (AssistantUIViewController *)objc_msgSend_topViewController(v17, v18, v19);
    if (a4)
    {
      if (v20 == self)
      {
        objc_msgSend_setRecommendationParamDict_(self, v21, (uint64_t)a4);
        v23 = objc_msgSend_objectForKey_(a4, v22, (uint64_t)CFSTR("promptString"));
        if (v23)
        {
          v26 = (void *)v23;
          v27 = (void *)objc_msgSend_cancelButton(self, v24, v25);
          objc_msgSend_setEnabled_(v27, v28, 1);
          objc_msgSend_stopAnimating(self->spinnerWithStatusBelowSpinner, v29, v30);
          objc_msgSend_setText_(self->spinnerWithStatusBelowLabel, v31, (uint64_t)&stru_24DD08368);
          sub_21A6829C8(self->spinnerWithStatusBelowLabel, (char *)self->spinnerWithStatusBelowView, &stru_24DD08368);
          sub_21A6829C8(self->justTextLabel, (char *)self->justTextContainerView, v26);
          objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v32, (uint64_t)self->tableHeaderContainerView);
          tableHeaderContainerView = self->tableHeaderContainerView;
          v36 = (void *)objc_msgSend_tableView(self, v34, v35);
          objc_msgSend_setTableHeaderView_(v36, v37, (uint64_t)tableHeaderContainerView);
          Button = (void *)objc_msgSend_nextButton(self, v38, v39);
          objc_msgSend_setEnabled_(Button, v41, 0);
          if (!a3)
          {
            v70 = 0;
            v44 = objc_msgSend_guessCompleteDict(self->_assistantUIController, v42, v43);
            v46 = (const __CFString *)objc_msgSend_primaryRecommendationDictionaryFromCompletionDict_(AutoGuessController, v45, v44);
            v49 = (void *)objc_msgSend_sharedInstance(WiFiUtils, v47, v48);
            v52 = (const __CFArray *)objc_msgSend_unmergedScanInfoArray(v49, v50, v51);
            if (!sub_21A6F9F74(v46, v52, &v70, v53, v54, v55, v56, v57))
            {
              if (v70)
              {
                v59 = (void *)objc_msgSend_objectForKey_(v70, v58, (uint64_t)CFSTR("kSBSKey_Step"));
                v62 = objc_msgSend_integerValue(v59, v60, v61);
                v64 = (void *)objc_msgSend_newStepByStepControllerForStep_(self, v63, v62);
                if (v64)
                {
                  v66 = v64;
                  objc_msgSend_setParentController_(v64, v65, (uint64_t)self);
                  objc_msgSend_setInParamDict_(v66, v67, (uint64_t)v70);

                  objc_msgSend_pushViewController_animated_(self, v68, (uint64_t)v66, 0);
                  objc_msgSend_setCurrentSubController_(self, v69, (uint64_t)v66);
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)presentUIForStepByStepNextStep:(int)a3 paramDict:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v9 = *(_QWORD *)&a3;
  if (dword_2550EE510 <= 100 && (dword_2550EE510 != -1 || sub_21A69876C((uint64_t)&dword_2550EE510, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE510, (uint64_t)"-[AssistantUIViewController presentUIForStepByStepNextStep:paramDict:]", 100, (uint64_t)"step: %d\n", v4, v5, v6, v7, v9);
  if (self->_goingBack)
  {
    v11 = (void *)objc_msgSend_navigationController(self, a2, *(uint64_t *)&a3);
    v14 = objc_msgSend_topViewController(v11, v12, v13);
    objc_msgSend_setCurrentSubController_(self, v15, v14);
    self->_goingBack = 0;
    if (dword_2550EE510 <= 100 && (dword_2550EE510 != -1 || sub_21A69876C((uint64_t)&dword_2550EE510, 0x64u)))
    {
      v18 = "going BACKWARD to %@\n";
LABEL_24:
      v58 = objc_msgSend_currentSubController(self, v16, v17);
      sub_21A698FDC((uint64_t)&dword_2550EE510, (uint64_t)"-[AssistantUIViewController presentUIForStepByStepNextStep:paramDict:]", 100, (uint64_t)v18, v59, v60, v61, v62, v58);
    }
  }
  else
  {
    v19 = (void *)objc_msgSend_newStepByStepControllerForStep_(self, a2, v9);
    objc_msgSend_setParentController_(v19, v20, (uint64_t)self);
    objc_msgSend_setInParamDict_(v19, v21, (uint64_t)a4);
    v24 = (void *)objc_msgSend_currentSubController(self, v22, v23);
    v27 = (void *)objc_msgSend_inParamDict(v24, v25, v26);
    v29 = (void *)objc_msgSend_objectForKey_(v27, v28, (uint64_t)CFSTR("kSBSKey_CannotBeBackedInto"));
    if (objc_msgSend_BOOLValue(v29, v30, v31))
    {
      v34 = (void *)objc_msgSend_navigationController(self, v32, v33);
      objc_msgSend_popViewControllerAnimated_(v34, v35, 0);
    }
    if (objc_msgSend_currentSubController(self, v32, v33)
      && (v38 = (void *)objc_msgSend_currentSubController(self, v36, v37),
          v41 = (void *)objc_msgSend_inParamDict(v38, v39, v40),
          v43 = (void *)objc_msgSend_objectForKey_(v41, v42, (uint64_t)CFSTR("kSBSKey_Step")),
          objc_msgSend_integerValue(v43, v44, v45) == v9))
    {
      v47 = (void *)objc_msgSend_navigationController(self, v36, v46);
      objc_msgSend_popViewControllerAnimated_(v47, v48, 0);
      v53 = 0;
      if (dword_2550EE510 <= 100)
      {
        if (dword_2550EE510 != -1 || sub_21A69876C((uint64_t)&dword_2550EE510, 0x64u))
          sub_21A698FDC((uint64_t)&dword_2550EE510, (uint64_t)"-[AssistantUIViewController presentUIForStepByStepNextStep:paramDict:]", 100, (uint64_t)"REPLACING step with same step %d\n", v49, v50, v51, v52, v9);
        v53 = 0;
      }
    }
    else
    {
      v53 = 1;
    }
    objc_msgSend_setCurrentSubController_(self, v36, (uint64_t)v19);

    v56 = objc_msgSend_currentSubController(self, v54, v55);
    objc_msgSend_pushViewController_animated_(self, v57, v56, v53);
    if (dword_2550EE510 <= 100 && (dword_2550EE510 != -1 || sub_21A69876C((uint64_t)&dword_2550EE510, 0x64u)))
    {
      v18 = "going FORWARD to %@\n";
      goto LABEL_24;
    }
  }
}

- (id)modifyTopoUIInLayer:(id)a3 withLayout:(id)a4 newLayout:(id)a5
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  AssistantUIViewController *v38;
  AssistantUIController *assistantUIController;
  uint64_t v40;
  const char *v41;

  v6 = (void *)objc_msgSend_topoDevicesDescriptor(a5, a2, (uint64_t)a3);
  v9 = objc_msgSend_count(v6, v7, v8);
  if (v9 == 2)
  {
    v21 = (void *)objc_msgSend_objectAtIndex_(v6, v10, 0);
    v23 = objc_msgSend_valueForKey_(v21, v22, (uint64_t)off_2550F49B8[0]);
    v25 = objc_msgSend_valueForKey_(v21, v24, (uint64_t)off_2550F49C0[0]);
    v27 = objc_msgSend_valueForKey_(v21, v26, (uint64_t)off_2550F49C8[0]);
    v29 = objc_msgSend_valueForKey_(v21, v28, (uint64_t)off_2550F49D0[0]);
    v31 = (void *)objc_msgSend_objectAtIndex_(v6, v30, 1);
    v14 = objc_msgSend_valueForKey_(v31, v32, (uint64_t)off_2550F49B8[0]);
    v16 = objc_msgSend_valueForKey_(v31, v33, (uint64_t)off_2550F49C0[0]);
    v18 = objc_msgSend_valueForKey_(v31, v34, (uint64_t)off_2550F49C8[0]);
    v20 = objc_msgSend_valueForKey_(v31, v35, (uint64_t)off_2550F49D0[0]);
    v37 = objc_msgSend_valueForKey_(v31, v36, (uint64_t)off_2550F49D8[0]);
  }
  else
  {
    if (v9 == 1)
    {
      v12 = (void *)objc_msgSend_objectAtIndex_(v6, v10, 0);
      v14 = objc_msgSend_valueForKey_(v12, v13, (uint64_t)off_2550F49B8[0]);
      v16 = objc_msgSend_valueForKey_(v12, v15, (uint64_t)off_2550F49C0[0]);
      v18 = objc_msgSend_valueForKey_(v12, v17, (uint64_t)off_2550F49C8[0]);
      v20 = objc_msgSend_valueForKey_(v12, v19, (uint64_t)off_2550F49D0[0]);
    }
    else
    {
      v14 = 0;
      v16 = 0;
      v20 = 0;
      v18 = 0;
    }
    v23 = 0;
    v25 = 0;
    v29 = 0;
    v27 = 0;
    v37 = 0;
  }
  v38 = self;
  assistantUIController = self->_assistantUIController;
  v40 = objc_msgSend_topoView(v38, v10, v11);
  return (id)objc_msgSend_modifyTopoUIInLayer_withLayout_andOwningView_targetProductID_targetDeviceKind_targetName_targetWiFiName_sourceProductID_sourceDeviceKind_sourceName_sourceWiFiName_connectionType_(assistantUIController, v41, (uint64_t)a3, a4, v40, v14, v16, v20, v18, v23, v25, v29, v27, v37);
}

- (void)connectionVerificationSucceededForSelector:(int)a3
{
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_uiAlert(self, a2, *(uint64_t *)&a3);
  objc_msgSend_dismissWithNoActionAnimated_(v4, v5, 1);
  objc_msgSend_showUIForSetupStatus(self, v6, v7);
}

- (void)presentUIForSetupStatusWithRecommendationDict:(id)a3
{
  uint64_t v5;
  const char *v6;
  void *v7;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  const __CFString *v31;
  const char *v32;
  uint64_t v33;
  uint64_t valid;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  __CFString *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  uint64_t v65;
  const char *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  UILabel *justTextLabel;
  char *justTextContainerView;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  void *Button;
  const char *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  const char *v117;

  v5 = objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("BSAutoGuess_Recommendation"));
  if (!v5)
    return;
  v7 = (void *)v5;
  v8 = (const __CFString *)objc_msgSend_objectForKey_(a3, v6, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredBase"));
  v10 = objc_msgSend_objectForKey_(a3, v9, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredNetwork"));
  if (v8)
  {
    v18 = sub_21A68E368(v8, (uint64_t)v11, v12, v13, v14, v15, v16, v17);
    v26 = sub_21A68E344((uint64_t)v8, v19, v20, v21, v22, v23, v24, v25);
    v27 = (uint64_t)v18;
  }
  else
  {
    v28 = v10;
    v29 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, v11, v10);
    v26 = objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v30, v28);
    v27 = v29;
  }
  v31 = sub_21A690D10(v27, v26);
  v33 = objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v32, (uint64_t)CFSTR("%1$@.InProcess%2$@"), v7, v31);
  valid = sub_21A690C10(v33, qword_2550F4DE8);
  v37 = (void *)objc_msgSend_setupOptions(self->_assistantUIController, v35, v36);
  v39 = (void *)objc_msgSend_objectForKey_(v37, v38, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_ExtendOption_JoinApple"));
  if (objc_msgSend_BOOLValue(v39, v40, v41))
    v33 = objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v42, (uint64_t)CFSTR("%1$@.InProcess%2$@"), CFSTR("BSSetupRecommend_OfferJoinNetwork"), v31);
  if ((objc_msgSend_isEqualToString_(v7, v42, (uint64_t)CFSTR("BSSetupRecommend_OfferExtendWirelessly")) & 1) == 0
    && !objc_msgSend_isEqualToString_(v7, v43, (uint64_t)CFSTR("BSSetupRecommend_AskUserChooseBaseWireless")))
  {
    if ((objc_msgSend_isEqualToString_(v7, v43, (uint64_t)CFSTR("BSSetupRecommend_OfferExtendOverEthernet")) & 1) != 0
      || objc_msgSend_isEqualToString_(v7, v58, (uint64_t)CFSTR("BSSetupRecommend_AskUserChooseBaseWired")))
    {
      v59 = (void *)objc_msgSend_objectForKey_(a3, v58, (uint64_t)CFSTR("BSAutoGuess_SourceBase"));
      if (v59)
      {
LABEL_18:
        v57 = objc_msgSend_valueForKey_(v59, v60, (uint64_t)CFSTR("name"));
        goto LABEL_19;
      }
      v62 = (void *)objc_msgSend_setupOptions(self->_assistantUIController, v60, v61);
      v59 = (void *)objc_msgSend_objectForKey_(v62, v63, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_SourceBase"));
    }
    else
    {
      if ((objc_msgSend_isEqualToString_(v7, v58, (uint64_t)CFSTR("BSSetupRecommend_OfferCreate")) & 1) != 0
        || objc_msgSend_isEqualToString_(v7, v107, (uint64_t)CFSTR("BSSetupRecommend_OfferReplaceSourceIsUnconfigurable")))
      {
        v109 = (void *)objc_msgSend_setupOptions(self->_assistantUIController, v107, v108);
        if (!objc_msgSend_objectForKey_(v109, v110, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_NetworkName")))
          return;
        goto LABEL_21;
      }
      if ((objc_msgSend_isEqualToString_(v7, v107, (uint64_t)CFSTR("BSSetupRecommend_OfferJoinNetwork")) & 1) != 0
        || objc_msgSend_isEqualToString_(v7, v111, (uint64_t)CFSTR("BSSetupRecommend_AskUserChooseNetworkToJoin")))
      {
        v113 = (void *)objc_msgSend_setupOptions(self->_assistantUIController, v111, v112);
        v116 = objc_msgSend_objectForKey_(v113, v114, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_SourceNetwork"));
        if (!v116)
        {
          v116 = objc_msgSend_objectForKey_(a3, v115, (uint64_t)CFSTR("BSAutoGuess_SourceNetwork"));
          if (!v116)
            return;
        }
        v57 = objc_msgSend_scanInfoNetworkName_(WiFiUtils, v115, v116);
        goto LABEL_19;
      }
      if ((objc_msgSend_isEqualToString_(v7, v111, (uint64_t)CFSTR("BSSetupRecommend_OfferRestore")) & 1) != 0
        || (objc_msgSend_isEqualToString_(v7, v67, (uint64_t)CFSTR("BSSetupRecommend_OfferReplaceConfiguration")) & 1) != 0)
      {
        goto LABEL_21;
      }
      if (!objc_msgSend_isEqualToString_(v7, v67, (uint64_t)CFSTR("BSSetupRecommend_OfferReplace")))
        return;
      v59 = (void *)objc_msgSend_objectForKey_(a3, v117, (uint64_t)CFSTR("BSAutoGuess_SourceBase"));
    }
    if (!v59)
      return;
    goto LABEL_18;
  }
  v46 = (__CFString *)objc_msgSend_objectForKey_(a3, v43, (uint64_t)CFSTR("BSAutoGuess_SourceBase"));
  if (!v46)
  {
    v47 = (void *)objc_msgSend_setupOptions(self->_assistantUIController, v44, v45);
    v46 = (__CFString *)objc_msgSend_objectForKey_(v47, v48, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_SourceBase"));
    if (!v46)
      return;
  }
  v56 = objc_msgSend_valueForKey_(v46, v44, (uint64_t)CFSTR("raNm"));
  if (v56)
    goto LABEL_20;
  v57 = (uint64_t)sub_21A68EE6C(v46, v49, v50, v51, v52, v53, v54, v55);
LABEL_19:
  v56 = v57;
LABEL_20:
  v64 = (void *)MEMORY[0x24BDD17C8];
  v65 = sub_21A690C10(v33, qword_2550F4DE8);
  valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v64, v66, v65, CFSTR("%@"), 0, v56);
LABEL_21:
  objc_msgSend_setSettingUpStatusText_(self, v67, valid);
  v70 = (void *)objc_msgSend_navigationController(self, v68, v69);
  v73 = (void *)objc_msgSend_topViewController(v70, v71, v72);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v76 = objc_msgSend_topoLayout(v73, v74, v75);
    v79 = objc_msgSend_topoLayout(self, v77, v78);
    v82 = objc_msgSend_layer(self->topoView, v80, v81);
    objc_msgSend_modifyTopoUIInLayer_withLayout_newLayout_(self, v83, v82, v79, v76);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      justTextLabel = self->justTextLabel;
      justTextContainerView = (char *)self->justTextContainerView;
      v86 = (void *)objc_msgSend_performSelector_(v73, v74, (uint64_t)sel_justTextLabel);
      v89 = (void *)objc_msgSend_text(v86, v87, v88);
      sub_21A6829C8(justTextLabel, justTextContainerView, v89);
    }
  }
  objc_msgSend_showUIForSetupStatus(self, v74, v75);
  v90 = sub_21A690C10((uint64_t)CFSTR("kDone"), qword_2550F4DE8);
  Button = (void *)objc_msgSend_nextButton(self, v91, v92);
  objc_msgSend_setTitle_(Button, v94, v90);
  v97 = (void *)objc_msgSend_nextButton(self, v95, v96);
  objc_msgSend_setStyle_(v97, v98, 2);
  v101 = (void *)objc_msgSend_nextButton(self, v99, v100);
  objc_msgSend_setEnabled_(v101, v102, 0);
  v105 = (void *)objc_msgSend_cancelButton(self, v103, v104);
  objc_msgSend_setEnabled_(v105, v106, 0);
}

- (void)presentUIForSetupResult:(int)a3 baseStationInfo:(id)a4 withPrompt:(id)a5
{
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t valid;
  const char *v39;
  const char *v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  _BOOL4 v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  NSDictionary *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  const char *v72;
  uint64_t RowStyleBasicWholeCellButton_withTag;
  const char *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  UIView *tableHeaderContainerView;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  void *Button;
  const char *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  const char *v119;
  void *v120;
  uint64_t v121;
  const char *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  void *v128;
  uint64_t v129;
  const char *v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  void *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  const char *v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  const char *v150;
  void *v151;
  const char *v152;
  void *v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  id v163;

  sub_21A6829C8(self->justTextLabel, (char *)self->justTextContainerView, &stru_24DD08368);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v9, (uint64_t)self->tableHeaderContainerView);
  if (a3 == -6769)
    goto LABEL_11;
  if (a3)
  {
    if (a3 == -6723)
    {
      objc_msgSend_handleCancelButton_(self, v10, 0);
    }
    else
    {
      sub_21A6829C8(self->justTextLabel, (char *)self->justTextContainerView, a5);
      objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v40, (uint64_t)self->tableHeaderContainerView);
    }
LABEL_11:
    v41 = (void *)objc_msgSend_cancelButton(self, v10, v11);
    objc_msgSend_setEnabled_(v41, v42, 1);
    objc_msgSend_stopAnimating(self->spinnerWithStatusBelowSpinner, v43, v44);
    sub_21A6829C8(self->spinnerWithStatusBelowLabel, (char *)self->spinnerWithStatusBelowView, &stru_24DD08368);
    return;
  }
  v12 = (void *)objc_msgSend_objectForKey_(a4, v10, (uint64_t)CFSTR("kSetupBaseStationInfoKey_RecommendationInfo"));
  v14 = (void *)objc_msgSend_objectForKey_(v12, v13, (uint64_t)CFSTR("BSAutoGuess_Recommendation"));
  if (objc_msgSend_isEqualToString_(v14, v15, (uint64_t)CFSTR("BSSetupRecommend_OfferReplaceSourceIsUnconfigurable")))
  {
    v163 = a4;
    v162 = sub_21A690C10((uint64_t)CFSTR("TextualSentenceConcatenator"), qword_2550F4DE8);
    v17 = (const __CFString *)objc_msgSend_objectForKey_(v12, v16, (uint64_t)CFSTR("BSAutoGuess_SourceBase"));
    v25 = (__CFString *)sub_21A68EE6C(v17, v18, v19, v20, v21, v22, v23, v24);
    v28 = (void *)objc_msgSend_setupOptions(self->_assistantUIController, v26, v27);
    v30 = (void *)objc_msgSend_objectForKey_(v28, v29, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_BaseName"));
    v33 = objc_msgSend_length(v25, v31, v32);
    v36 = objc_msgSend_length(v30, v34, v35);
    if (v33 && v36 && !objc_msgSend_isEqualToString_(v25, v37, (uint64_t)v30))
    {
      v45 = sub_21A690C10((uint64_t)CFSTR("RestoreDefaultsReplacedNamed"), (uint64_t)CFSTR("AirPortSettings"));
      valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(MEMORY[0x24BDD17C8], v46, v45, CFSTR("%@"), 0, v25);
    }
    else
    {
      valid = sub_21A690C10((uint64_t)CFSTR("RestoreDefaultsReplaced"), (uint64_t)CFSTR("AirPortSettings"));
    }
    a5 = (id)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(MEMORY[0x24BDD17C8], v39, v162, CFSTR("%@%@"), 0, a5, valid);
    a4 = v163;
  }
  sub_21A6829C8(self->justTextLabel, (char *)self->justTextContainerView, a5);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v47, (uint64_t)self->tableHeaderContainerView);
  v50 = (void *)objc_msgSend_tableManager(self, v48, v49);
  objc_msgSend_cleanTableViewForReuse(v50, v51, v52);
  v54 = objc_msgSend_objectForKey_(a4, v53, (uint64_t)CFSTR("kSetupBaseStationInfoKey_BrowseRecord"));
  v57 = sub_21A68E2C8(v54) != 2 && sub_21A68E2C8(v54) != 3 && sub_21A68E2C8(v54) != 4;
  v58 = objc_msgSend_callerParamDict(self, v55, v56);
  if (v58)
  {
    v61 = (void *)objc_msgSend_callerParamDict(self, v59, v60);
    v63 = (void *)objc_msgSend_objectForKey_(v61, v62, (uint64_t)CFSTR("wacShouldHideFindAppUI"));
    LODWORD(v58) = objc_msgSend_BOOLValue(v63, v64, v65);
  }
  if (((v57 | v58) & 1) == 0)
  {
    v66 = (NSDictionary *)(id)objc_msgSend_objectForKey_(a4, v59, (uint64_t)CFSTR("kSetupBaseStationInfoKey_MFiAccessoryResponse"));
    self->_mfiAccessoryResponseDict = v66;
    if (v66)
    {
      if (sub_21A736DA8((const __CFDictionary *)v66))
      {
        v67 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v59, v60);
        v70 = (void *)objc_msgSend_tableManager(self, v68, v69);
        v71 = sub_21A690C10((uint64_t)CFSTR("FindAppForAccessory"), (uint64_t)CFSTR("AirPortSettings"));
        RowStyleBasicWholeCellButton_withTag = objc_msgSend_createRowStyleBasicWholeCellButton_withTag_(v70, v72, v71, 1097887809);
        objc_msgSend_addObject_(v67, v74, RowStyleBasicWholeCellButton_withTag);
        v77 = (void *)objc_msgSend_tableManager(self, v75, v76);
        v79 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCED8], v78, (uint64_t)v67, CFSTR("sectionRows"), CFSTR("FindAppTableSection"), CFSTR("identifier"), 0);
        objc_msgSend_addSectionInfo_(v77, v80, v79);
      }
    }
  }
  v81 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v59, v60);
  v84 = (void *)objc_msgSend_text(self->justTextLabel, v82, v83);
  if (objc_msgSend_length(v84, v85, v86))
    objc_msgSend_addObject_(v81, v87, (uint64_t)self->justTextContainerView);
  if (v57)
    objc_msgSend_addObject_(v81, v87, (uint64_t)self->topoView);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(self, v87, (uint64_t)self->tableHeaderContainerView, v81, 1);
  tableHeaderContainerView = self->tableHeaderContainerView;
  v91 = (void *)objc_msgSend_tableView(self, v89, v90);
  objc_msgSend_setTableHeaderView_(v91, v92, (uint64_t)tableHeaderContainerView);
  v93 = sub_21A690C10((uint64_t)CFSTR("kDone"), qword_2550F4DE8);
  Button = (void *)objc_msgSend_nextButton(self, v94, v95);
  objc_msgSend_setTitle_(Button, v97, v93);
  v100 = (void *)objc_msgSend_nextButton(self, v98, v99);
  objc_msgSend_setStyle_(v100, v101, 2);
  v104 = (void *)objc_msgSend_nextButton(self, v102, v103);
  objc_msgSend_setEnabled_(v104, v105, 1);
  v108 = (void *)objc_msgSend_nextButton(self, v106, v107);
  objc_msgSend_setAction_(v108, v109, (uint64_t)sel_baseStationConfigurationComplete_);
  v110 = sub_21A690C10((uint64_t)CFSTR("SetupCompleteTitle"), qword_2550F4DE8);
  v113 = (void *)objc_msgSend_navigationItem(self, v111, v112);
  objc_msgSend_setTitle_(v113, v114, v110);
  v117 = (void *)objc_msgSend_navigationItem(self, v115, v116);
  objc_msgSend_setLeftBarButtonItem_(v117, v118, 0);
  v120 = (void *)objc_msgSend_objectForKey_(a4, v119, (uint64_t)CFSTR("kSetupBaseStationInfoKey_GeneralInfo"));
  v121 = sub_21A690CA4(1937330263);
  v125 = objc_msgSend_objectForKey_(v120, v122, v121);
  if (v125)
  {
    v126 = (void *)objc_msgSend_setupOptions(self->_assistantUIController, v123, v124);
    objc_msgSend_setObject_forKey_(v126, v127, v125, CFSTR("kBSAutoGuessSetupOptionKey_BasePassword"));
  }
  v128 = (void *)objc_msgSend_objectForKey_(a4, v123, (uint64_t)CFSTR("kSetupBaseStationInfoKey_RadioInfo"));
  v129 = sub_21A690CA4(1651725131);
  if (objc_msgSend_objectForKey_(v128, v130, v129))
  {
    v133 = (void *)objc_msgSend_setupOptions(self->_assistantUIController, v131, v132);
    v135 = (void *)objc_msgSend_objectForKey_(a4, v134, (uint64_t)CFSTR("kSetupBaseStationInfoKey_RadioInfo"));
    v136 = sub_21A690CA4(1651725131);
    v138 = objc_msgSend_objectForKey_(v135, v137, v136);
    objc_msgSend_setObject_forKey_(v133, v139, v138, CFSTR("kBSAutoGuessSetupOptionKey_NetworkPassword"));
  }
  if (objc_msgSend_objectForKey_(a4, v131, (uint64_t)CFSTR("kSetupBaseStationInfoKey_DiskInfo")))
  {
    v142 = (void *)objc_msgSend_objectForKey_(a4, v140, (uint64_t)CFSTR("kSetupBaseStationInfoKey_DiskInfo"));
    v143 = sub_21A690CA4(1718842224);
    v145 = objc_msgSend_objectForKey_(v142, v144, v143);
    if (v145)
      v125 = v145;
    v148 = (void *)objc_msgSend_setupOptions(self->_assistantUIController, v146, v147);
    objc_msgSend_setObject_forKey_(v148, v149, v125, CFSTR("kBSAutoGuessSetupOptionKey_DiskSharing_Password"));
  }
  else
  {
    v151 = (void *)objc_msgSend_setupOptions(self->_assistantUIController, v140, v141);
    objc_msgSend_removeObjectForKey_(v151, v152, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_DiskSharing_Password"));
  }
  v153 = (void *)objc_msgSend_objectForKey_(a4, v150, (uint64_t)CFSTR("kSetupBaseStationInfoKey_GuestNetworkInfo"));
  v154 = sub_21A690CA4(1651722064);
  v156 = objc_msgSend_objectForKey_(v153, v155, v154);
  if (v156)
  {
    v159 = v156;
    v160 = (void *)objc_msgSend_setupOptions(self->_assistantUIController, v157, v158);
    objc_msgSend_setObject_forKey_(v160, v161, v159, CFSTR("kBSAutoGuessSetupOptionKey_GuestNetwork_Password"));
  }
}

- (id)valueForItemOfType:(id)a3 atTypeIndex:(unint64_t)a4 inCellWithTag:(int64_t)a5
{
  const __CFString *v5;
  void *v7;
  const char *v8;

  if (a5 > 1196314742)
  {
    if (a5 == 1196314743)
    {
      v5 = CFSTR("kBSAutoGuessSetupOptionKey_GuestNetwork_Password");
      goto LABEL_11;
    }
    if (a5 == 1464225889)
    {
      v5 = CFSTR("kBSAutoGuessSetupOptionKey_NetworkPassword");
      goto LABEL_11;
    }
    return &stru_24DD08368;
  }
  if (a5 == 1113673825)
  {
    v5 = CFSTR("kBSAutoGuessSetupOptionKey_BasePassword");
    goto LABEL_11;
  }
  if (a5 != 1147752545)
    return &stru_24DD08368;
  v5 = CFSTR("kBSAutoGuessSetupOptionKey_DiskSharing_Password");
LABEL_11:
  v7 = (void *)objc_msgSend_setupOptions(self->_assistantUIController, a2, (uint64_t)a3, a4);
  return (id)objc_msgSend_objectForKey_(v7, v8, (uint64_t)v5);
}

- (void)presentWaitingForWANViewWithContinueText:(BOOL)a3
{
  InternetViewController *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;

  v4 = [InternetViewController alloc];
  v6 = (void *)objc_msgSend_initWithNibName_bundle_(v4, v5, 0, 0);
  v9 = objc_msgSend_guessCompleteDict(self->_assistantUIController, v7, v8);
  v11 = objc_msgSend_unconfiguredBaseStationFromGuessCompleteDict_(AutoGuessController, v10, v9);
  if (v11)
  {
    v13 = v11;
    objc_msgSend_setCurrentSubController_(self, v12, (uint64_t)v6);
    v16 = (void *)objc_msgSend_currentSubController(self, v14, v15);
    objc_msgSend_setInParamDict_(v16, v17, v13);
    v20 = (void *)objc_msgSend_currentSubController(self, v18, v19);
    objc_msgSend_setParentController_(v20, v21, (uint64_t)self);

    self->_currentUIConfigStep = 1;
    objc_msgSend_presentInternetWANPluginUI(v6, v22, v23);
    objc_msgSend_setDelegate_(v6, v24, (uint64_t)self);
    objc_msgSend_pushViewController_animated_(self, v25, (uint64_t)v6, 1);
  }
}

+ (void)readjustSubviewsInContainer:(id)a3
{
  MEMORY[0x24BEDD108](a3, sel_layoutIfNeeded, a3);
}

- (void)replaceSubviewsInView:(id)a3 newSubviews:(id)a4 withAnimation:(BOOL)a5
{
  id v5;
  unint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *Object;
  double v19;
  const char *v20;
  const char *v21;
  void *v22;
  NSDictionary *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  NSDictionary *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  double v32;
  double v33;
  const char *v34;
  uint64_t v35;
  double v36;
  double v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  id v41;
  void *v42;
  NSDictionary *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  NSDictionary *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  double v55;
  void *v56;
  const char *v57;
  void *v58;
  NSDictionary *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  void *v63;
  NSDictionary *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  uint64_t v79;

  v5 = a4;
  v79 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend_count(a4, a2, (uint64_t)a3);
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v10 = (void *)objc_msgSend_subviews(a3, v8, v9);
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v74, v78, 16);
  if (v12)
  {
    v15 = v12;
    v16 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v75 != v16)
          objc_enumerationMutation(v10);
        objc_msgSend_removeFromSuperview(*(void **)(*((_QWORD *)&v74 + 1) + 8 * i), v13, v14);
      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v74, v78, 16);
    }
    while (v15);
  }
  if (v7)
  {
    Object = (void *)objc_msgSend_firstObject(v5, v13, v14);
    LODWORD(v19) = 1148846080;
    objc_msgSend_setContentCompressionResistancePriority_forAxis_(Object, v20, 1, v19);
    objc_msgSend_addSubview_(a3, v21, (uint64_t)Object);
    v22 = (void *)MEMORY[0x24BDD1628];
    v23 = _NSDictionaryOfVariableBindings(CFSTR("curSubview"), Object, 0);
    v25 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v22, v24, (uint64_t)CFSTR("H:|[curSubview]|"), 0, 0, v23);
    objc_msgSend_addConstraints_(a3, v26, v25);
    v27 = (void *)MEMORY[0x24BDD1628];
    v28 = _NSDictionaryOfVariableBindings(CFSTR("curSubview"), Object, 0);
    v30 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v27, v29, (uint64_t)CFSTR("V:|[curSubview]"), 0, 0, v28);
    objc_msgSend_addConstraints_(a3, v31, v30);
    v32 = *MEMORY[0x24BDF7B90];
    v33 = *(double *)(MEMORY[0x24BDF7B90] + 8);
    objc_msgSend_systemLayoutSizeFittingSize_(Object, v34, v35, *MEMORY[0x24BDF7B90], v33);
    v37 = v36 + 0.0;
    if (v7 - 1 < 2)
    {
      v39 = Object;
    }
    else
    {
      v38 = 2;
      do
      {
        v39 = (void *)objc_msgSend_objectAtIndex_(v5, v13, v38 - 1);
        objc_msgSend_addSubview_(a3, v40, (uint64_t)v39);
        v41 = v5;
        v42 = (void *)MEMORY[0x24BDD1628];
        v43 = _NSDictionaryOfVariableBindings(CFSTR("curSubview"), v39, 0);
        v45 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v42, v44, (uint64_t)CFSTR("H:|[curSubview]|"), 0, 0, v43);
        objc_msgSend_addConstraints_(a3, v46, v45);
        v47 = (void *)MEMORY[0x24BDD1628];
        v48 = _NSDictionaryOfVariableBindings(CFSTR("previousSubview, curSubview"), Object, v39, 0);
        v49 = v47;
        v5 = v41;
        v51 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v49, v50, (uint64_t)CFSTR("V:[previousSubview][curSubview]"), 0, 0, v48);
        objc_msgSend_addConstraints_(a3, v52, v51);
        objc_msgSend_systemLayoutSizeFittingSize_(v39, v53, v54, v32, v33);
        v37 = v37 + v55;
        ++v38;
        Object = v39;
      }
      while (v7 != v38);
    }
    if (v7 >= 2)
    {
      v56 = (void *)objc_msgSend_lastObject(v5, v13, v14);
      objc_msgSend_addSubview_(a3, v57, (uint64_t)v56);
      v58 = (void *)MEMORY[0x24BDD1628];
      v59 = _NSDictionaryOfVariableBindings(CFSTR("curSubview"), v56, 0);
      v61 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v58, v60, (uint64_t)CFSTR("H:|[curSubview]|"), 0, 0, v59);
      objc_msgSend_addConstraints_(a3, v62, v61);
      v63 = (void *)MEMORY[0x24BDD1628];
      v64 = _NSDictionaryOfVariableBindings(CFSTR("previousSubview, curSubview"), v39, v56, 0);
      v66 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v63, v65, (uint64_t)CFSTR("V:[previousSubview][curSubview]|"), 0, 0, v64);
      objc_msgSend_addConstraints_(a3, v67, v66);
      objc_msgSend_systemLayoutSizeFittingSize_(v56, v68, v69, v32, v33);
    }
  }
  objc_msgSend_frame(a3, v13, v14);
  objc_msgSend_setFrame_(a3, v70, v71);
  objc_msgSend_setNeedsLayout(a3, v72, v73);
}

- (AssistantViewControllerDelegate)assistantDelegate
{
  return (AssistantViewControllerDelegate *)self->_assistantDelegate;
}

- (void)setAssistantDelegate:(id)a3
{
  self->_assistantDelegate = a3;
}

- (AssistantUIController)_assistantUIController
{
  return self->_assistantUIController;
}

- (void)set_assistantUIController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1160);
}

- (AssistantCallbackController)_controllerContext
{
  return self->_controllerContext;
}

- (void)set_controllerContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1168);
}

- (NSDictionary)scanInfoRecord
{
  return self->_scanInfoRecord;
}

- (void)setScanInfoRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1128);
}

- (NSArray)paramScanResults
{
  return self->_paramScanResults;
}

- (void)setParamScanResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1136);
}

- (NSDictionary)recommendationParamDict
{
  return self->recommendationParamDict;
}

- (void)setRecommendationParamDict:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1280);
}

- (NSDictionary)callerParamDict
{
  return self->_callerParamDict;
}

- (void)setCallerParamDict:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1152);
}

- (UIView)justTextContainerView
{
  return self->justTextContainerView;
}

- (void)setJustTextContainerView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1048);
}

- (UILabel)justTextLabel
{
  return self->justTextLabel;
}

- (void)setJustTextLabel:(id)a3
{
  self->justTextLabel = (UILabel *)a3;
}

- (UIView)spinnerWithStatusBelowView
{
  return self->spinnerWithStatusBelowView;
}

- (void)setSpinnerWithStatusBelowView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1024);
}

- (UIBarButtonItem)nextButton
{
  return self->nextButton;
}

- (void)setNextButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1080);
}

- (UIBarButtonItem)cancelButton
{
  return self->cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1088);
}

- (UITextField)currentTextField
{
  return self->currentTextField;
}

- (void)setCurrentTextField:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1272);
}

- (AssistantSubUIViewController)currentSubController
{
  return self->_currentSubController;
}

- (void)setCurrentSubController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1248);
}

- (UIView)topoView
{
  return self->topoView;
}

- (void)setTopoView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1064);
}

- (NetTopoMiniStaticLayout)topoLayout
{
  return self->topoLayout;
}

- (void)setTopoLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1072);
}

- (UIView)tableHeaderContainerView
{
  return self->tableHeaderContainerView;
}

- (void)setTableHeaderContainerView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1096);
}

- (UITableView)mainTableView
{
  return self->_mainTableView;
}

- (void)setMainTableView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1288);
}

- (int64_t)letMeChooseButtonIndex
{
  return self->letMeChooseButtonIndex;
}

- (void)setLetMeChooseButtonIndex:(int64_t)a3
{
  self->letMeChooseButtonIndex = a3;
}

- (int64_t)restoreButtonIndex
{
  return self->restoreButtonIndex;
}

- (void)setRestoreButtonIndex:(int64_t)a3
{
  self->restoreButtonIndex = a3;
}

- (int64_t)recommendationButtonIndex
{
  return self->recommendationButtonIndex;
}

- (void)setRecommendationButtonIndex:(int64_t)a3
{
  self->recommendationButtonIndex = a3;
}

- (NSString)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1112);
}

- (NSString)settingUpStatusText
{
  return (NSString *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setSettingUpStatusText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1120);
}

- (AUPasswordUIAlert)passwordAlert
{
  return self->passwordAlert;
}

- (void)setPasswordAlert:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1176);
}

- (AUUIAlert)askUserQuestionAlert
{
  return self->askUserQuestionAlert;
}

- (void)setAskUserQuestionAlert:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1184);
}

- (AUUIAlert)connectionVerificationAlert
{
  return self->connectionVerificationAlert;
}

- (void)setConnectionVerificationAlert:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1192);
}

- (AUUIAlert)uiAlert
{
  return self->uiAlert;
}

- (void)setUiAlert:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1200);
}

- (UIView)spinnerWithStatusAdjacentView
{
  return self->_spinnerWithStatusAdjacentView;
}

- (void)setSpinnerWithStatusAdjacentView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1296);
}

- (id)newStepByStepControllerForStep:(int)a3
{
  uint64_t v3;
  id v5;
  const char *v6;

  v3 = 0;
  while (dword_24DD04D88[v3] != a3)
  {
    v3 += 4;
    if (v3 == 60)
      return 0;
  }
  v5 = objc_alloc(NSClassFromString(*(NSString **)&dword_24DD04D88[v3 + 2]));
  return (id)objc_msgSend_initWithNibName_bundle_(v5, v6, 0, 0);
}

- (void)startSetup:(id)a3
{
  MEMORY[0x24BEDD108](self->_assistantUIController, sel_startSetupFromAutoGuessRecommendation_, a3);
}

- (void)popToRootViewControllerAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;

  v3 = a3;
  v5 = (void *)objc_msgSend_navigationController(self, a2, a3);
  v8 = v5;
  if (v3)
  {
    v9 = (void *)objc_msgSend_viewControllers(v5, v6, v7);
    if ((unint64_t)objc_msgSend_count(v9, v10, v11) >= 2)
    {
      v13 = (id)objc_msgSend_objectAtIndex_(v9, v12, 0);
      v14 = (void *)MEMORY[0x24BDBCEB8];
      v17 = objc_msgSend_topViewController(v8, v15, v16);
      v19 = (void *)objc_msgSend_arrayWithObject_(v14, v18, v17);
      objc_msgSend_setViewControllers_animated_(v8, v20, (uint64_t)v19, 0);
      objc_msgSend_removeAllObjects(v19, v21, v22);
      objc_msgSend_addObject_(v19, v23, (uint64_t)v13);
      objc_msgSend_setViewControllers_animated_(v8, v24, (uint64_t)v19, 1);
    }
  }
  else
  {
    objc_msgSend_popToRootViewControllerAnimated_(v5, v6, 0);
  }
  objc_msgSend_setCurrentSubController_(self, v12, 0);
  self->_goingBack = 0;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  const char *v7;

  v4 = a4;
  v6 = (void *)objc_msgSend_navigationController(self, a2, (uint64_t)a3);
  objc_msgSend_pushViewController_animated_(v6, v7, (uint64_t)a3, v4);
}

- (void)confirmSkipWANPort
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  const __CFString *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
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
  uint64_t valid;
  AUUIAlert *v34;
  const char *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;

  v4 = objc_msgSend_guessCompleteDict(self->_assistantUIController, a2, v2);
  v6 = (const __CFString *)objc_msgSend_unconfiguredBaseStationFromGuessCompleteDict_(AutoGuessController, v5, v4);
  v9 = (void *)objc_msgSend_currentSubController(self, v7, v8);
  if (v9 && objc_msgSend_internetFlow(v9, v10, v11) == 1)
    v12 = CFSTR("ConnectionVerificationMessage1");
  else
    v12 = CFSTR("ConnectionVerificationMessage2");
  v13 = sub_21A690C10((uint64_t)v12, qword_2550F4DE8);
  v14 = (void *)MEMORY[0x24BDD17C8];
  v22 = sub_21A68E368(v6, v15, v16, v17, v18, v19, v20, v21);
  v30 = sub_21A68E344((uint64_t)v6, v23, v24, v25, v26, v27, v28, v29);
  v31 = sub_21A690D80(v22, v30, 0);
  valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v14, v32, v13, CFSTR("%@"), 0, v31);
  v34 = [AUUIAlert alloc];
  v36 = (id)objc_msgSend_initWithViewController_(v34, v35, (uint64_t)self);
  objc_msgSend_setUiAlert_(self, v37, (uint64_t)v36);
  v38 = sub_21A690C10((uint64_t)CFSTR("NoInternetConnection"), qword_2550F4DE8);
  objc_msgSend_setTitle_(self->uiAlert, v39, v38);
  objc_msgSend_setMessage_(self->uiAlert, v40, valid);
  objc_msgSend_setDelegate_(self->uiAlert, v41, (uint64_t)self);
  v42 = sub_21A690C10((uint64_t)CFSTR("ContinueAnyway"), qword_2550F4DE8);
  objc_msgSend_setOkButtonTitle_(self->uiAlert, v43, v42);
  v44 = sub_21A690C10((uint64_t)CFSTR("ReviewSettings"), qword_2550F4DE8);
  objc_msgSend_setCancelButtonTitle_(self->uiAlert, v45, v44);
  objc_msgSend_setTag_(self->uiAlert, v46, 4000);
  objc_msgSend_setStackButtons_(self->uiAlert, v47, 1);
  objc_msgSend_show(self->uiAlert, v48, v49);
}

- (void)skipWANPort
{
  const char *v3;
  uint64_t v4;

  objc_msgSend_presentUIForConnectionVerificationResult_withOptions_(self->_assistantUIController, a2, 4294960539, 0);
  objc_msgSend_showUIForSetupStatus(self, v3, v4);
}

- (void)continueWithPPPoESettings
{
  uint64_t v2;
  AssistantUIController *assistantUIController;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;

  assistantUIController = self->_assistantUIController;
  v5 = (void *)objc_msgSend_currentSubController(self, a2, v2);
  v8 = objc_msgSend_outResultsDict(v5, v6, v7);
  objc_msgSend_presentUIForConnectionVerificationResult_withOptions_(assistantUIController, v9, 0, v8);
  objc_msgSend_showUIForSetupStatus(self, v10, v11);
}

- (void)continueWithDiagsAndUsageStats
{
  uint64_t v2;
  AssistantUIController *assistantUIController;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;

  assistantUIController = self->_assistantUIController;
  v5 = (void *)objc_msgSend_currentSubController(self, a2, v2);
  v8 = objc_msgSend_outResultsDict(v5, v6, v7);
  objc_msgSend_showUIConfigPromptResult_withOptions_(assistantUIController, v9, 0, v8);
  objc_msgSend_showUIForSetupStatus(self, v10, v11);
}

- (void)continueWithGuestNetSettings
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const __CFString *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  __CFArray *v11;

  v11 = 0;
  v4 = (void *)objc_msgSend_currentSubController(self, a2, v2);
  v7 = (const __CFString *)objc_msgSend_outResultsDict(v4, v5, v6);
  sub_21A6F9094(v7, &v11);
  objc_msgSend_showUIConfigPromptResult_withOptions_(self->_assistantUIController, v8, 0, v11);

  objc_msgSend_showUIForSetupStatus(self, v9, v10);
}

- (void)continueWithSwapCabling
{
  const char *v3;
  uint64_t v4;

  objc_msgSend_presentUIForConnectionVerificationResult_withOptions_(self->_assistantUIController, a2, 4294960525, 0);
  objc_msgSend_showUIForSetupStatus(self, v3, v4);
}

- (void)skipPluginAudioCabling
{
  const char *v3;
  uint64_t v4;

  objc_msgSend_presentUIForConnectionVerificationResult_withOptions_(self->_assistantUIController, a2, 4294960539, 0);
  objc_msgSend_showUIForSetupStatus(self, v3, v4);
}

- (void)showUIForSetupStatus
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  const char *v31;
  int v32;
  const __CFString *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  UIView *tableHeaderContainerView;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;

  if (dword_2550EE510 <= 100 && (dword_2550EE510 != -1 || sub_21A69876C((uint64_t)&dword_2550EE510, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE510, (uint64_t)"-[AssistantUIViewController(private) showUIForSetupStatus]", 100, (uint64_t)"\n", v3, v4, v5, v6, v51);
  v8 = (void *)objc_msgSend_currentSubController(self, a2, v2);
  v11 = (void *)objc_msgSend_tableManager(v8, v9, v10);
  objc_msgSend_cleanTableViewForReuse(v11, v12, v13);
  objc_msgSend_popToRootViewControllerAnimated_(self, v14, 0);
  v17 = objc_msgSend_guessCompleteDict(self->_assistantUIController, v15, v16);
  if (v17)
  {
    v19 = (void *)objc_msgSend_primaryRecommendationDictionaryFromCompletionDict_(AutoGuessController, v18, v17);
    v21 = objc_msgSend_valueForKey_(v19, v20, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredBase"));
  }
  else
  {
    v19 = 0;
    v21 = objc_msgSend_valueForKey_(0, v18, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredBase"));
  }
  if (v21)
  {
    v29 = sub_21A68E344(v21, (uint64_t)v22, v23, v24, v25, v26, v27, v28);
  }
  else
  {
    v30 = objc_msgSend_valueForKey_(v19, v22, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredNetwork"));
    v29 = objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v31, v30);
  }
  v32 = v29;
  v33 = sub_21A69111C(v29);
  v34 = sub_21A690C10((uint64_t)v33, qword_2550F4DE8);
  v37 = (void *)objc_msgSend_navigationItem(self, v35, v36);
  objc_msgSend_setTitle_(v37, v38, v34);
  v40 = (void *)objc_msgSend_arrayWithObject_(MEMORY[0x24BDBCEB8], v39, (uint64_t)self->justTextContainerView);
  v42 = v40;
  if ((v32 - 2) >= 3)
    objc_msgSend_addObject_(v40, v41, (uint64_t)self->topoView);
  objc_msgSend_addObject_(v42, v41, (uint64_t)self->spinnerWithStatusBelowView);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(self, v43, (uint64_t)self->tableHeaderContainerView, v42, 1);
  tableHeaderContainerView = self->tableHeaderContainerView;
  v47 = (void *)objc_msgSend_tableView(self, v45, v46);
  objc_msgSend_setTableHeaderView_(v47, v48, (uint64_t)tableHeaderContainerView);
  objc_msgSend_startAnimating(self->spinnerWithStatusBelowSpinner, v49, v50);
}

- (BOOL)disablesAutomaticKeyboardDismissal
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AssistantUIViewController;
  -[AssistantUIViewController disablesAutomaticKeyboardDismissal](&v3, sel_disablesAutomaticKeyboardDismissal);
  return 0;
}

- (void)setupCompleteShowPasswords:(BOOL)a3
{
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t RowStyleBasicWithImage_text1_text2_withTag;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  const char *v50;

  if (!a3)
    goto LABEL_11;
  v4 = (void *)objc_msgSend_tableManager(self, a2, a3);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v4, v5, (uint64_t)CFSTR("ShowPasswords")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)objc_msgSend_tableManager(self, v6, v7);
    objc_msgSend_deleteSectionWithIdentifier_(v8, v9, (uint64_t)CFSTR("ShowPasswords"));
  }
  v10 = (void *)objc_msgSend_tableManager(self, v6, v7);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v10, v11, (uint64_t)CFSTR("PasswordsTableSection")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, a3);
    v15 = (void *)objc_msgSend_tableManager(self, v13, v14);
    v16 = sub_21A690C10((uint64_t)CFSTR("WiFiPasswordLabel"), qword_2550F4DE8);
    RowStyleBasicWithImage_text1_text2_withTag = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v15, v17, 0, v16, CFSTR("dynamicValue"), 1464225889);
    objc_msgSend_addObject_(v12, v19, RowStyleBasicWithImage_text1_text2_withTag);
    v22 = (void *)objc_msgSend_tableManager(self, v20, v21);
    v23 = sub_21A690C10((uint64_t)CFSTR("BasePasswordLabel"), qword_2550F4DE8);
    v25 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v22, v24, 0, v23, CFSTR("dynamicValue"), 1113673825);
    objc_msgSend_addObject_(v12, v26, v25);
    v29 = (void *)objc_msgSend_setupOptions(self->_assistantUIController, v27, v28);
    if (objc_msgSend_valueForKey_(v29, v30, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_DiskSharing_Password"))
      && objc_msgSend_valueForItemOfType_atTypeIndex_inCellWithTag_(self, v31, (uint64_t)CFSTR("editTextView"), 0, 1147752545))
    {
      v33 = (void *)objc_msgSend_tableManager(self, v31, v32);
      v34 = sub_21A690C10((uint64_t)CFSTR("DiskPasswordLabel"), qword_2550F4DE8);
      v36 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v33, v35, 0, v34, CFSTR("dynamicValue"), 1147752545);
      objc_msgSend_addObject_(v12, v37, v36);
    }
    if (objc_msgSend_valueForItemOfType_atTypeIndex_inCellWithTag_(self, v31, (uint64_t)CFSTR("editTextView"), 0, 1196314743))
    {
      v40 = (void *)objc_msgSend_tableManager(self, v38, v39);
      v41 = sub_21A690C10((uint64_t)CFSTR("GuestNetPasswordLabel"), qword_2550F4DE8);
      v43 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v40, v42, 0, v41, CFSTR("dynamicValue"), 1196314743);
      objc_msgSend_addObject_(v12, v44, v43);
    }
    v45 = (void *)objc_msgSend_tableManager(self, v38, v39);
    v47 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCED8], v46, (uint64_t)v12, CFSTR("sectionRows"), CFSTR("PasswordsTableSection"), CFSTR("identifier"), 0);
    objc_msgSend_addSectionInfo_(v45, v48, v47);
  }
  else
  {
LABEL_11:
    v49 = (void *)objc_msgSend_tableManager(self, a2, a3);
    objc_msgSend_deleteSectionWithIdentifier_(v49, v50, (uint64_t)CFSTR("PasswordsTableSection"));
  }
}

- (void)handleCancelRequest:(BOOL)a3
{
  _BOOL8 v3;
  const char *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a3;
  objc_msgSend_setEnabled_(self->cancelButton, a2, 0);
  objc_msgSend_setEnabled_(self->nextButton, v5, 0);
  v12 = objc_msgSend_cancelCurrentAssistantState_(self->_assistantUIController, v6, v3);
  if (dword_2550EE510 <= 100 && (dword_2550EE510 != -1 || sub_21A69876C((uint64_t)&dword_2550EE510, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE510, (uint64_t)"-[AssistantUIViewController(private) handleCancelRequest:]", 100, (uint64_t)"cancelCurrentAssistantState err: %m\n", v8, v9, v10, v11, v12);
  if (v3 || (_DWORD)v12 != -6771)
  {
    v19 = objc_msgSend_doneWithAssistant_(self->_assistantUIController, v7, v3);
    if (dword_2550EE510 <= 100 && (dword_2550EE510 != -1 || sub_21A69876C((uint64_t)&dword_2550EE510, 0x64u)))
      sub_21A698FDC((uint64_t)&dword_2550EE510, (uint64_t)"-[AssistantUIViewController(private) handleCancelRequest:]", 100, (uint64_t)"doneWithAssistant err: %m\n", v15, v16, v17, v18, v19);
    if (v3 || (_DWORD)v19 != -6771)
    {
      v20 = objc_msgSend_assistantResult(self->_assistantUIController, v13, v14);
      MEMORY[0x24BEDD108](self, sel_doneWithAssistantResult_, v20);
    }
  }
}

- (id)radioNameFromBaseStation:(id)a3
{
  if (a3)
    return (id)objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("raNm"));
  else
    return 0;
}

@end
