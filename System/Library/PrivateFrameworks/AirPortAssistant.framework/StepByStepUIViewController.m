@implementation StepByStepUIViewController

- (void)dealloc
{
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  objc_super v10;

  objc_msgSend_setTopoLayout_(self, a2, 0);
  objc_msgSend_setSpinnerWithStatusBelowLabel_(self, v3, 0);
  objc_msgSend_setSpinnerWithStatusBelowView_(self, v4, 0);
  objc_msgSend_setSpinnerWithStatusBelowSpinner_(self, v5, 0);
  objc_msgSend_setTopoView_(self, v6, 0);
  objc_msgSend_setTableFooterContainerView_(self, v7, 0);
  objc_msgSend_setJustTextContainerView_(self, v8, 0);
  objc_msgSend_setTableHeaderContainerView_(self, v9, 0);
  v10.receiver = self;
  v10.super_class = (Class)StepByStepUIViewController;
  -[AssistantSubUIViewController dealloc](&v10, sel_dealloc);
}

- (void)loadView
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  double v19;
  const char *v20;
  const char *v21;
  UILabel *justTextLabel;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  double v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  NSDictionary *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  double v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  double v66;
  uint64_t v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  double v74;
  double v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  double v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  objc_super v88;
  const __CFString *v89;
  _QWORD v90[2];

  v90[1] = *MEMORY[0x24BDAC8D0];
  v88.receiver = self;
  v88.super_class = (Class)StepByStepUIViewController;
  -[AUUITableViewController loadView](&v88, sel_loadView);
  v5 = (void *)objc_msgSend_view(self, v3, v4);
  objc_msgSend_frame(v5, v6, v7);
  v11 = objc_msgSend_topoViewWithWidth_(AssistantSubUIViewController, v8, v9, v10);
  objc_msgSend_setTopoView_(self, v12, v11);
  v87 = 0;
  v15 = (void *)objc_msgSend_view(self, v13, v14);
  objc_msgSend_frame(v15, v16, v17);
  self->justTextLabel = (UILabel *)objc_msgSend_labelViewInContainer_width_(AssistantSubUIViewController, v18, (uint64_t)&v87, v19);
  objc_msgSend_setJustTextContainerView_(self, v20, v87);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self->justTextContainerView, v21, 0);
  justTextLabel = self->justTextLabel;
  v23 = (void *)MEMORY[0x24BDD1628];
  v89 = CFSTR("height");
  v24 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_frame(justTextLabel, v25, v26);
  *(float *)&v28 = v27;
  v90[0] = objc_msgSend_numberWithFloat_(v24, v29, v30, v28);
  v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v31, (uint64_t)v90, &v89, 1);
  v33 = _NSDictionaryOfVariableBindings(CFSTR("justTextLabel"), self->justTextLabel, 0);
  v35 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v23, v34, (uint64_t)CFSTR("V:[justTextLabel(>=height)]"), 0, v32, v33);
  objc_msgSend_addConstraints_(justTextLabel, v36, v35);
  v39 = (void *)objc_msgSend_view(self, v37, v38);
  objc_msgSend_frame(v39, v40, v41);
  v45 = objc_msgSend_containerViewWithWidth_(AssistantSubUIViewController, v42, v43, v44);
  objc_msgSend_setTableHeaderContainerView_(self, v46, v45);
  v86 = 0;
  v87 = 0;
  v49 = (void *)objc_msgSend_view(self, v47, v48);
  objc_msgSend_frame(v49, v50, v51);
  v54 = objc_msgSend_labelViewInContainer_width_withSpinner_above_(AssistantSubUIViewController, v52, (uint64_t)&v87, &v86, 1, v53);
  objc_msgSend_setSpinnerWithStatusBelowLabel_(self, v55, v54);
  objc_msgSend_setSpinnerWithStatusBelowView_(self, v56, v87);
  objc_msgSend_setSpinnerWithStatusBelowSpinner_(self, v57, v86);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self->spinnerWithStatusBelowView, v58, 0);
  v61 = (void *)objc_msgSend_view(self, v59, v60);
  objc_msgSend_frame(v61, v62, v63);
  v67 = objc_msgSend_containerViewWithWidth_(AssistantSubUIViewController, v64, v65, v66);
  objc_msgSend_setTableFooterContainerView_(self, v68, v67);
  v71 = (void *)objc_msgSend_view(self, v69, v70);
  objc_msgSend_frame(v71, v72, v73);
  v75 = v74;
  v78 = (void *)objc_msgSend_view(self, v76, v77);
  objc_msgSend_frame(v78, v79, v80);
  v84 = objc_msgSend_tableViewWithWidth_height_(AssistantSubUIViewController, v81, v82, v75, v83);
  objc_msgSend_setTableView_(self, v85, v84);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  const char *v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_msgSend_tableView(self, a2, a3);
  objc_msgSend_setTableFooterView_(v5, v6, 0);
  v7.receiver = self;
  v7.super_class = (Class)StepByStepUIViewController;
  -[AUUITableViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
}

- (void)syncTopoUIForTarget:(id)a3 andSource:(id)a4 andNetwork:(id)a5 connectionType:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  __CFString *v10;
  void *v13;
  unsigned int v14;
  const char *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  unsigned int v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  unsigned int v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  unsigned int v47;
  const char *v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  unsigned int v52;
  const char *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  const char *v63;
  const char *v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  const __CFString *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  id v97;

  v10 = (__CFString *)a4;
  v13 = (void *)MEMORY[0x24BDD16E0];
  v14 = sub_21A68E368((const __CFString *)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v6, v7);
  v16 = (void *)objc_msgSend_numberWithInteger_(v13, v15, v14);
  v17 = (void *)MEMORY[0x24BDD16E0];
  v25 = sub_21A68E344((uint64_t)a3, v18, v19, v20, v21, v22, v23, v24);
  v96 = objc_msgSend_numberWithInteger_(v17, v26, v25);
  v97 = a6;
  if (v10)
  {
    v29 = (void *)MEMORY[0x24BDD16E0];
    v30 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, v27, (uint64_t)v10);
    v32 = objc_msgSend_numberWithInteger_(v29, v31, v30);
    v40 = (void *)MEMORY[0x24BDD16E0];
    if (v32)
    {
      v41 = (void *)v32;
      v42 = sub_21A68E2C8((uint64_t)v10);
      v44 = (void *)objc_msgSend_numberWithInteger_(v40, v43, v42);
      v47 = objc_msgSend_integerValue(v41, v45, v46);
      v50 = objc_msgSend_integerValue(v44, v48, v49);
      v51 = (uint64_t)sub_21A691584(v47, v50);
    }
    else
    {
      v52 = sub_21A68E368(v10, v33, v34, v35, v36, v37, v38, v39);
      v41 = (void *)objc_msgSend_numberWithInteger_(v40, v53, v52);
      v54 = (void *)MEMORY[0x24BDD16E0];
      v62 = sub_21A68E344((uint64_t)v10, v55, v56, v57, v58, v59, v60, v61);
      v44 = (void *)objc_msgSend_numberWithInteger_(v54, v63, v62);
      v51 = objc_msgSend_objectForKey_(v10, v64, (uint64_t)CFSTR("name"));
    }
    v10 = (__CFString *)v51;
  }
  else
  {
    v41 = 0;
    v44 = 0;
  }
  v65 = objc_msgSend_integerValue(v16, v27, v28);
  v73 = sub_21A68E344((uint64_t)a3, v66, v67, v68, v69, v70, v71, v72);
  v74 = sub_21A691584(v65, v73);
  v77 = (void *)objc_msgSend_parentController(self, v75, v76);
  v80 = (void *)objc_msgSend__assistantUIController(v77, v78, v79);
  v83 = (void *)objc_msgSend_topoView(self, v81, v82);
  v86 = objc_msgSend_layer(v83, v84, v85);
  v89 = objc_msgSend_topoLayout(self, v87, v88);
  v92 = objc_msgSend_topoView(self, v90, v91);
  v94 = objc_msgSend_modifyTopoUIInLayer_withLayout_andOwningView_targetProductID_targetDeviceKind_targetName_targetWiFiName_sourceProductID_sourceDeviceKind_sourceName_sourceWiFiName_connectionType_(v80, v93, v86, v89, v92, v16, v96, v74, a5, v41, v44, v10, a5, v97);
  objc_msgSend_setTopoLayout_(self, v95, v94);
}

- (void)stepByStepUpdateProgress:(id)a3 forState:(int)a4
{
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  UILabel *spinnerWithStatusBelowLabel;
  UIView *spinnerWithStatusBelowView;
  const char *v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;

  if (objc_msgSend_tableView(self, a2, (uint64_t)a3, *(_QWORD *)&a4)
    && objc_msgSend_tableFooterContainerView(self, v6, v7)
    && objc_msgSend_spinnerWithStatusBelowView(self, v8, v9)
    && objc_msgSend_spinnerWithStatusBelowLabel(self, v10, v11))
  {
    v14 = (void *)objc_msgSend_navigationItem(self, v12, v13);
    v17 = (void *)objc_msgSend_rightBarButtonItem(v14, v15, v16);
    objc_msgSend_setEnabled_(v17, v18, 0);
    v21 = (void *)objc_msgSend_tableView(self, v19, v20);
    if (objc_msgSend_numberOfSections(v21, v22, v23) >= 1)
    {
      v26 = (void *)objc_msgSend_tableManager(self, v24, v25);
      objc_msgSend_cleanTableViewForReuse(v26, v27, v28);
      v29 = (void *)MEMORY[0x24BDBCE30];
      v32 = objc_msgSend_spinnerWithStatusBelowView(self, v30, v31);
      v34 = objc_msgSend_arrayWithObjects_(v29, v33, v32, 0);
      v37 = (void *)objc_msgSend_parentController(self, v35, v36);
      v40 = objc_msgSend_tableFooterContainerView(self, v38, v39);
      objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v37, v41, v40, v34, 1);
      v44 = objc_msgSend_tableFooterContainerView(self, v42, v43);
      v47 = (void *)objc_msgSend_tableView(self, v45, v46);
      objc_msgSend_setTableFooterView_(v47, v48, v44);
    }
    objc_msgSend_startAnimating(self->spinnerWithStatusBelowSpinner, v24, v25);
    spinnerWithStatusBelowLabel = self->spinnerWithStatusBelowLabel;
    spinnerWithStatusBelowView = self->spinnerWithStatusBelowView;
    if (objc_msgSend_length(a3, v51, v52))
      objc_msgSend_setText_(spinnerWithStatusBelowLabel, v53, (uint64_t)a3);
    else
      objc_msgSend_setText_(spinnerWithStatusBelowLabel, v53, (uint64_t)CFSTR("\n"));
    objc_msgSend_sizeToFit(spinnerWithStatusBelowLabel, v54, v55);
    objc_msgSend_setNeedsLayout(spinnerWithStatusBelowLabel, v56, v57);
    objc_msgSend_setNeedsLayout(spinnerWithStatusBelowView, v58, v59);
    objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v60, (uint64_t)self->tableHeaderContainerView);
  }
}

- (UIView)tableHeaderContainerView
{
  return self->tableHeaderContainerView;
}

- (void)setTableHeaderContainerView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1064);
}

- (UIView)justTextContainerView
{
  return self->justTextContainerView;
}

- (void)setJustTextContainerView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1072);
}

- (UILabel)justTextLabel
{
  return self->justTextLabel;
}

- (void)setJustTextLabel:(id)a3
{
  self->justTextLabel = (UILabel *)a3;
}

- (UIView)topoView
{
  return self->topoView;
}

- (void)setTopoView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1048);
}

- (NetTopoMiniStaticLayout)topoLayout
{
  return self->topoLayout;
}

- (void)setTopoLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1056);
}

- (UIView)tableFooterContainerView
{
  return self->tableFooterContainerView;
}

- (void)setTableFooterContainerView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1088);
}

- (UIView)spinnerWithStatusBelowView
{
  return self->spinnerWithStatusBelowView;
}

- (void)setSpinnerWithStatusBelowView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1096);
}

- (UILabel)spinnerWithStatusBelowLabel
{
  return self->spinnerWithStatusBelowLabel;
}

- (void)setSpinnerWithStatusBelowLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1104);
}

- (UIActivityIndicatorView)spinnerWithStatusBelowSpinner
{
  return self->spinnerWithStatusBelowSpinner;
}

- (void)setSpinnerWithStatusBelowSpinner:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1112);
}

- (int)sbsMode
{
  return self->sbsMode;
}

- (void)setSbsMode:(int)a3
{
  self->sbsMode = a3;
}

@end
