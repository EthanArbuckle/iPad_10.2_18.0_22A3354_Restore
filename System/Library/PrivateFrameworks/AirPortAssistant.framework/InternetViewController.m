@implementation InternetViewController

- (void)loadView
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  _BOOL8 v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  objc_super v41;
  UIActivityIndicatorView *v42;
  uint64_t v43;

  v42 = 0;
  v43 = 0;
  v41.receiver = self;
  v41.super_class = (Class)InternetViewController;
  -[AUUITableViewController loadView](&v41, sel_loadView);
  v5 = (void *)objc_msgSend_view(self, v3, v4);
  objc_msgSend_frame(v5, v6, v7);
  v9 = v8;
  v13 = objc_msgSend_tableViewWithWidth_height_(AssistantSubUIViewController, v10, v11, v8, v12);
  objc_msgSend_setTableView_(self, v14, v13);
  v17 = objc_msgSend_containerViewWithWidth_(AssistantSubUIViewController, v15, v16, v9);
  objc_msgSend_setTableHeaderContainerView_(self, v18, v17);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self->tableHeaderContainerView, v19, 0);
  self->spinnerWithStatusAdjacentLabel = (UILabel *)objc_msgSend_labelViewInContainer_width_withSpinner_above_(AssistantSubUIViewController, v20, (uint64_t)&v43, &v42, 0, v9);
  objc_msgSend_setSpinnerWithStatusAdjacentView_(self, v21, v43);
  self->spinnerWithStatusAdjacentSpinner = v42;
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self->spinnerWithStatusAdjacentView, v22, 0);
  v43 = 0;
  self->descriptionLabel = (UILabel *)objc_msgSend_labelViewInContainer_width_(AssistantSubUIViewController, v23, (uint64_t)&v43, v9);
  objc_msgSend_setDescriptionContainerView_(self, v24, v43);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self->descriptionContainerView, v25, 0);
  v28 = objc_msgSend_containerViewWithWidth_(AssistantSubUIViewController, v26, v27, v9);
  objc_msgSend_setDiagramContainerView_(self, v29, v28);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self->diagramContainerView, v30, 0);
  objc_msgSend_setLeftNavigationButton_enable_hide_(self, v31, (uint64_t)CFSTR("kBack"), 1, 0);
  v34 = objc_msgSend_internetFlow(self, v32, v33) != 3;
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v35, (uint64_t)CFSTR("kNext"), v34, 0);
  v38 = objc_msgSend_internetFlow(self, v36, v37);
  switch(v38)
  {
    case 3:
      objc_msgSend_addSwapCablingUI(self, v39, v40);
      break;
    case 2:
      objc_msgSend_addInternetNotWorkingUI(self, v39, v40);
      break;
    case 1:
      objc_msgSend_addInternetWANPluginUI(self, v39, v40);
      break;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  objc_super v8;

  v3 = a3;
  v5 = (void *)objc_msgSend_layer(self->cablingImageLastFrame, a2, a3);
  objc_msgSend_removeAllAnimations(v5, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)InternetViewController;
  -[AUUITableViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)InternetViewController;
  -[InternetViewController viewDidAppear:](&v15, sel_viewDidAppear_, a3);
  objc_msgSend_bounds(self->tableHeaderContainerView, v4, v5);
  v7 = v6;
  v9 = v8;
  v12 = (void *)objc_msgSend_tableView(self, v10, v11);
  objc_msgSend_setContentSize_(v12, v13, v14, v7, v9);
}

- (void)dealloc
{
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  objc_super v9;

  objc_msgSend_setSpinnerWithStatusAdjacentView_(self, a2, 0);
  objc_msgSend_setDescriptionContainerView_(self, v3, 0);
  objc_msgSend_setTableHeaderContainerView_(self, v4, 0);
  objc_msgSend_setDiagramContainerView_(self, v5, 0);
  objc_msgSend_setCablingImageLastFrame_(self, v6, 0);
  objc_msgSend_setSwapDescriptionText_(self, v7, 0);
  objc_msgSend_setSwapSourceLabelText_(self, v8, 0);
  v9.receiver = self;
  v9.super_class = (Class)InternetViewController;
  -[AssistantSubUIViewController dealloc](&v9, sel_dealloc);
}

- (void)presentSwapCablingUI
{
  objc_msgSend_setInternetFlow_(self, a2, 3);
}

- (void)presentSwapCablingCompleteUI
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  const __CFString *v25;
  const char *v26;
  void *valid;
  const char *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;

  v4 = (void *)objc_msgSend_inParamDict(self, a2, v2);
  v6 = (const __CFString *)objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("kSBSKey_TargetBase"));
  v7 = sub_21A690C10((uint64_t)CFSTR("SwapAllCablesDetectedOK"), qword_2550F4DE8);
  v8 = (void *)MEMORY[0x24BDD17C8];
  v16 = sub_21A68E368(v6, v9, v10, v11, v12, v13, v14, v15);
  v24 = sub_21A68E344((uint64_t)v6, v17, v18, v19, v20, v21, v22, v23);
  v25 = sub_21A690D80(v16, v24, 0);
  valid = (void *)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v8, v26, v7, CFSTR("%@"), 0, v25);
  sub_21A6829C8(self->descriptionLabel, (char *)self->descriptionContainerView, valid);
  objc_msgSend_setText_(self->spinnerWithStatusAdjacentLabel, v28, (uint64_t)&stru_24DD08368);
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v29, (uint64_t)CFSTR("kNext"), 1, 0);
  objc_msgSend_stopAnimating(self->spinnerWithStatusAdjacentSpinner, v30, v31);
}

- (void)presentInternetWANPluginUI
{
  objc_msgSend_setInternetFlow_(self, a2, 1);
}

- (void)presentInternetDisconnectedUI
{
  objc_msgSend_setInternetFlow_(self, a2, 2);
}

- (void)determineInfoForDevice:(id)a3 deviceDiagramInfo:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;

  a4->var1 = sub_21A68E368((const __CFString *)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
  a4->var2 = sub_21A68F15C((const __CFString *)a3, v10, v11, v12, v13, v14, v15, v16);
  a4->var4 = sub_21A68E344((uint64_t)a3, v17, v18, v19, v20, v21, v22, v23);
  v24 = sub_21A671298(a4->var1);
  a4->var3 = v24;
  a4->var0 = 1;
  if (v24)
    a4->var0 = sub_21A671268(a4->var1);
}

- (void)startAnimatingCablingForView:(id)a3 startingOpacity:(float)a4 endingOpacity:(float)a5 duration:(double)a6
{
  void *v10;
  double v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;

  v10 = (void *)objc_msgSend_layer(a3, a2, (uint64_t)a3);
  *(float *)&v11 = a4;
  objc_msgSend_setOpacity_(v10, v12, v13, v11);
  v15 = (void *)objc_msgSend_animationWithKeyPath_(MEMORY[0x24BDE5648], v14, (uint64_t)CFSTR("opacity"));
  LODWORD(v16) = 2139095040;
  objc_msgSend_setRepeatCount_(v15, v17, v18, v16);
  objc_msgSend_setAutoreverses_(v15, v19, 1);
  objc_msgSend_setDuration_(v15, v20, v21, a6);
  *(float *)&v22 = a5;
  v25 = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v23, v24, v22);
  objc_msgSend_setToValue_(v15, v26, v25);
  v29 = objc_msgSend_layer(a3, v27, v28);
  MEMORY[0x24BEDD108](v29, sel_addAnimation_forKey_, v15);
}

- (UIView)tableHeaderContainerView
{
  return self->tableHeaderContainerView;
}

- (void)setTableHeaderContainerView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1072);
}

- (UIView)descriptionContainerView
{
  return self->descriptionContainerView;
}

- (void)setDescriptionContainerView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1088);
}

- (UIView)diagramContainerView
{
  return self->diagramContainerView;
}

- (void)setDiagramContainerView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1080);
}

- (UIView)spinnerWithStatusAdjacentView
{
  return self->spinnerWithStatusAdjacentView;
}

- (void)setSpinnerWithStatusAdjacentView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1048);
}

- (UIImageView)cablingImageLastFrame
{
  return self->cablingImageLastFrame;
}

- (void)setCablingImageLastFrame:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1104);
}

- (unint64_t)internetFlow
{
  return self->internetFlow;
}

- (void)setInternetFlow:(unint64_t)a3
{
  self->internetFlow = a3;
}

- (NSString)swapDescriptionText
{
  return self->_swapDescriptionText;
}

- (void)setSwapDescriptionText:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1120);
}

- (NSString)swapSourceLabelText
{
  return self->_swapSourceLabelText;
}

- (void)setSwapSourceLabelText:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1128);
}

- (void)addSwapCablingUI
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const __CFString *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  const __CFString *v25;
  const __CFString *v26;
  const char *v27;
  uint64_t valid;
  const char *v29;
  UILabel *descriptionLabel;
  char *descriptionContainerView;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v4 = (void *)objc_msgSend_inParamDict(self, a2, v2);
  v6 = objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("kSBSKey_TargetBase"));
  v9 = (void *)objc_msgSend_inParamDict(self, v7, v8);
  v11 = (const __CFString *)objc_msgSend_objectForKey_(v9, v10, (uint64_t)CFSTR("kSBSKey_SourceBase"));
  v41 = 0;
  v42 = 0;
  v43 = 0;
  v38 = 0;
  v39 = 0;
  v40 = 0;
  objc_msgSend_determineInfoForDevice_deviceDiagramInfo_(self, v12, v6, &v41);
  objc_msgSend_determineInfoForDevice_deviceDiagramInfo_(self, v13, (uint64_t)v11, &v38);
  v16 = (void *)objc_msgSend_swapDescriptionText(self, v14, v15);
  if (!objc_msgSend_length(v16, v17, v18))
  {
    v21 = (void *)MEMORY[0x24BDD17C8];
    v22 = sub_21A690C10((uint64_t)CFSTR("SwapAllCables"), qword_2550F4DE8);
    v23 = sub_21A690D80(v39, SHIDWORD(v40), 0);
    v25 = sub_21A691000(v11, (const char *)1, v24);
    v26 = sub_21A690D80(v42, SHIDWORD(v43), 0);
    valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v21, v27, v22, CFSTR("%@%@%@"), 0, v23, v25, v26);
    objc_msgSend_setSwapDescriptionText_(self, v29, valid);
  }
  descriptionLabel = self->descriptionLabel;
  descriptionContainerView = (char *)self->descriptionContainerView;
  v32 = (void *)objc_msgSend_swapDescriptionText(self, v19, v20);
  sub_21A6829C8(descriptionLabel, descriptionContainerView, v32);
  objc_msgSend_startAnimating(self->spinnerWithStatusAdjacentSpinner, v33, v34);
  v35 = sub_21A690C10((uint64_t)CFSTR("SwapCablesWaiting"), qword_2550F4DE8);
  objc_msgSend_setText_(self->spinnerWithStatusAdjacentLabel, v36, v35);
  objc_msgSend_addInformationalDiagramWithWANConnectedBaseProductID_replacementProductID_(self, v37, v39, v42);
}

- (void)addInternetWANPluginUI
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  void *v6;
  const __CFString *v7;
  const char *v8;
  uint64_t valid;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v26 = 0;
  v27 = 0;
  v28 = 0;
  v4 = objc_msgSend_inParamDict(self, a2, v2);
  objc_msgSend_determineInfoForDevice_deviceDiagramInfo_(self, v5, v4, &v26);
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = sub_21A690D10(v27, SHIDWORD(v28));
  valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v6, v8, (uint64_t)CFSTR("InternetNoWorkie%@"), CFSTR("%@"), 0, v7);
  v10 = sub_21A690C10((uint64_t)CFSTR("TextualSentenceConcatenator"), qword_2550F4DE8);
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = sub_21A690C10(valid, qword_2550F4DE8);
  v13 = sub_21A690C10((uint64_t)CFSTR("PlugInWANCableForInternet"), qword_2550F4DE8);
  v15 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v11, v14, v10, CFSTR("%@%@"), 0, v12, v13);
  v16 = sub_21A690C10((uint64_t)CFSTR("TextualSentenceConcatenator2NewLines"), qword_2550F4DE8);
  v17 = (void *)MEMORY[0x24BDD17C8];
  v18 = sub_21A690C10((uint64_t)CFSTR("ContinueWithoutInternet"), qword_2550F4DE8);
  v20 = (void *)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v17, v19, v16, CFSTR("%@%@"), 0, v15, v18);
  sub_21A6829C8(self->descriptionLabel, (char *)self->descriptionContainerView, v20);
  objc_msgSend_startAnimating(self->spinnerWithStatusAdjacentSpinner, v21, v22);
  v23 = sub_21A690C10((uint64_t)CFSTR("WaitingForWANPlugin"), qword_2550F4DE8);
  objc_msgSend_setText_(self->spinnerWithStatusAdjacentLabel, v24, v23);
  objc_msgSend_addInformationalDiagramWithWANConnectedBaseProductID_replacementProductID_(self, v25, v27, 0);
}

- (void)addInformationalDiagramWithWANConnectedBaseProductID:(unsigned int)a3 replacementProductID:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  InfoDiagramView *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  UIView *diagramContainerView;
  void *v19;
  NSDictionary *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  UIView *v24;
  void *v25;
  NSDictionary *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  UIView *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  UIView *v34;
  void *v35;
  NSDictionary *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  UIView *tableHeaderContainerView;
  const char *v46;
  uint64_t v47;
  const char *v48;
  UIView *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  NSDictionary *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  NSDictionary *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  UIView *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v7 = [InfoDiagramView alloc];
  objc_msgSend_frame(self->diagramContainerView, v8, v9);
  v11 = (id)objc_msgSend_initWithFrame_wanConnectedBaseProductID_replacementProductID_(v7, v10, v5, v4);
  if (objc_msgSend_swapSourceLabelText(self, v12, v13))
  {
    v16 = objc_msgSend_swapSourceLabelText(self, v14, v15);
    objc_msgSend_setWANConnectedBaseLabelString_(v11, v17, v16);
  }
  objc_msgSend_addSubview_(self->diagramContainerView, v14, (uint64_t)v11);
  diagramContainerView = self->diagramContainerView;
  v19 = (void *)MEMORY[0x24BDD1628];
  v20 = _NSDictionaryOfVariableBindings(CFSTR("diagramContainerView"), diagramContainerView, 0);
  v22 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v19, v21, (uint64_t)CFSTR("V:[diagramContainerView(100@250)]"), 0, 0, v20);
  objc_msgSend_addConstraints_(diagramContainerView, v23, v22);
  v24 = self->diagramContainerView;
  v25 = (void *)MEMORY[0x24BDD1628];
  v26 = _NSDictionaryOfVariableBindings(CFSTR("infoView"), v11, 0);
  v28 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v25, v27, (uint64_t)CFSTR("V:|-10-[infoView]-10-|"), 512, 0, v26);
  objc_msgSend_addConstraints_(v24, v29, v28);
  v30 = self->diagramContainerView;
  v32 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(MEMORY[0x24BDD1628], v31, (uint64_t)v11, 9, 0, v30, 9, 1.0, 0.0);
  objc_msgSend_addConstraint_(v30, v33, v32);
  v34 = self->diagramContainerView;
  v35 = (void *)MEMORY[0x24BDD1628];
  v36 = _NSDictionaryOfVariableBindings(CFSTR("infoView"), v11, 0);
  v38 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v35, v37, (uint64_t)CFSTR("H:|-(>=10)-[infoView]-(>=10)-|"), 0, 0, v36);
  objc_msgSend_addConstraints_(v34, v39, v38);
  objc_msgSend_setNeedsLayout(self->diagramContainerView, v40, v41);
  v44 = (void *)objc_msgSend_parentController(self, v42, v43);
  tableHeaderContainerView = self->tableHeaderContainerView;
  v47 = objc_msgSend_arrayWithObjects_(MEMORY[0x24BDBCE30], v46, (uint64_t)self->spinnerWithStatusAdjacentView, self->diagramContainerView, self->descriptionContainerView, 0);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v44, v48, (uint64_t)tableHeaderContainerView, v47, 1);
  v49 = self->tableHeaderContainerView;
  v52 = (void *)objc_msgSend_tableView(self, v50, v51);
  objc_msgSend_setTableHeaderView_(v52, v53, (uint64_t)v49);
  v56 = (void *)objc_msgSend_tableView(self, v54, v55);
  v57 = (void *)MEMORY[0x24BDD1628];
  v58 = _NSDictionaryOfVariableBindings(CFSTR("tableHeaderContainerView"), self->tableHeaderContainerView, 0);
  v60 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v57, v59, (uint64_t)CFSTR("V:|[tableHeaderContainerView]"), 0, 0, v58);
  objc_msgSend_addConstraints_(v56, v61, v60);
  v64 = (void *)objc_msgSend_tableView(self, v62, v63);
  v65 = (void *)MEMORY[0x24BDD1628];
  v66 = _NSDictionaryOfVariableBindings(CFSTR("tableHeaderContainerView"), self->tableHeaderContainerView, 0);
  v68 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v65, v67, (uint64_t)CFSTR("H:|[tableHeaderContainerView]|"), 0, 0, v66);
  objc_msgSend_addConstraints_(v64, v69, v68);
  v72 = (void *)objc_msgSend_tableView(self, v70, v71);
  v73 = (void *)MEMORY[0x24BDD1628];
  v74 = self->tableHeaderContainerView;
  v77 = objc_msgSend_tableView(self, v75, v76);
  v79 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v73, v78, (uint64_t)v74, 7, 0, v77, 7, 1.0, 0.0);
  objc_msgSend_addConstraint_(v72, v80, v79);
  MEMORY[0x24BEDD108](self, sel_startAnimatingCablingForView_startingOpacity_endingOpacity_duration_, self->cablingImageLastFrame);
}

- (void)setCommonTraitsForLabel:(id)a3 forSize:(double)a4
{
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;

  objc_msgSend_setTextAlignment_(a3, a2, 1);
  objc_msgSend_setLineBreakMode_(a3, v6, 0);
  v9 = objc_msgSend__secondaryLabelColor(MEMORY[0x24BDF6950], v7, v8);
  objc_msgSend_setTextColor_(a3, v10, v9);
  objc_msgSend_setNumberOfLines_(a3, v11, 0);
  v14 = objc_msgSend_systemFontOfSize_(MEMORY[0x24BDF6A70], v12, v13, a4);
  objc_msgSend_setFont_(a3, v15, v14);
}

- (void)addInternetNotWorkingUI
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const __CFString *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t valid;
  void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  UIView *tableHeaderContainerView;
  const char *v44;
  uint64_t v45;
  const char *v46;
  UIView *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  NSDictionary *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  NSDictionary *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  UIView *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;

  v79 = 0;
  v80 = 0;
  v81 = 0;
  v4 = (void *)objc_msgSend_inParamDict(self, a2, v2);
  v6 = objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("kSBSKey_TargetBase"));
  objc_msgSend_determineInfoForDevice_deviceDiagramInfo_(self, v7, v6, &v79);
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = sub_21A690D10(v80, SHIDWORD(v81));
  v11 = objc_msgSend_stringWithFormat_(v8, v10, (uint64_t)CFSTR("InternetNoWorkie%@"), v9);
  v12 = sub_21A690C10((uint64_t)CFSTR("TextualSentenceConcatenator2NewLines"), qword_2550F4DE8);
  v13 = (void *)MEMORY[0x24BDD17C8];
  v14 = sub_21A690C10(v11, qword_2550F4DE8);
  v15 = sub_21A690C10((uint64_t)CFSTR("NoInternet1"), qword_2550F4DE8);
  valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v13, v16, v12, CFSTR("%@%@"), 0, v14, v15);
  v18 = (void *)MEMORY[0x24BDD17C8];
  v19 = sub_21A690C10((uint64_t)CFSTR("NoInternet1.1"), qword_2550F4DE8);
  v21 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v18, v20, v12, CFSTR("%@%@"), 0, valid, v19);
  v22 = (void *)MEMORY[0x24BDD17C8];
  v23 = sub_21A690C10((uint64_t)CFSTR("NoInternet2"), qword_2550F4DE8);
  v25 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v22, v24, v12, CFSTR("%@%@"), 0, v21, v23);
  v26 = (void *)MEMORY[0x24BDD17C8];
  v27 = sub_21A690C10((uint64_t)CFSTR("NoInternet3"), qword_2550F4DE8);
  v29 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v26, v28, v12, CFSTR("%@%@"), 0, v25, v27);
  v30 = (void *)MEMORY[0x24BDD17C8];
  v31 = sub_21A690C10((uint64_t)CFSTR("ContinueWithoutInternet"), qword_2550F4DE8);
  v33 = (void *)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v30, v32, v12, CFSTR("%@%@"), 0, v29, v31);
  sub_21A6829C8(self->descriptionLabel, (char *)self->descriptionContainerView, v33);
  objc_msgSend_startAnimating(self->spinnerWithStatusAdjacentSpinner, v34, v35);
  v36 = sub_21A690C10((uint64_t)CFSTR("WaitingForInternetAccess"), qword_2550F4DE8);
  objc_msgSend_setText_(self->spinnerWithStatusAdjacentLabel, v37, v36);
  sub_21A69F8E8(self->diagramContainerView, v38, v39);
  v42 = (void *)objc_msgSend_parentController(self, v40, v41);
  tableHeaderContainerView = self->tableHeaderContainerView;
  v45 = objc_msgSend_arrayWithObjects_(MEMORY[0x24BDBCE30], v44, (uint64_t)self->spinnerWithStatusAdjacentView, self->diagramContainerView, self->descriptionContainerView, 0);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v42, v46, (uint64_t)tableHeaderContainerView, v45, 1);
  v47 = self->tableHeaderContainerView;
  v50 = (void *)objc_msgSend_tableView(self, v48, v49);
  objc_msgSend_setTableHeaderView_(v50, v51, (uint64_t)v47);
  v54 = (void *)objc_msgSend_tableView(self, v52, v53);
  v55 = (void *)MEMORY[0x24BDD1628];
  v56 = _NSDictionaryOfVariableBindings(CFSTR("tableHeaderContainerView"), self->tableHeaderContainerView, 0);
  v58 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v55, v57, (uint64_t)CFSTR("V:|[tableHeaderContainerView]"), 0, 0, v56);
  objc_msgSend_addConstraints_(v54, v59, v58);
  v62 = (void *)objc_msgSend_tableView(self, v60, v61);
  v63 = (void *)MEMORY[0x24BDD1628];
  v64 = _NSDictionaryOfVariableBindings(CFSTR("tableHeaderContainerView"), self->tableHeaderContainerView, 0);
  v66 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v63, v65, (uint64_t)CFSTR("H:|[tableHeaderContainerView]|"), 0, 0, v64);
  objc_msgSend_addConstraints_(v62, v67, v66);
  v70 = (void *)objc_msgSend_tableView(self, v68, v69);
  v71 = (void *)MEMORY[0x24BDD1628];
  v72 = self->tableHeaderContainerView;
  v75 = objc_msgSend_tableView(self, v73, v74);
  v77 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v71, v76, (uint64_t)v72, 7, 0, v75, 7, 1.0, 0.0);
  objc_msgSend_addConstraint_(v70, v78, v77);
}

@end
