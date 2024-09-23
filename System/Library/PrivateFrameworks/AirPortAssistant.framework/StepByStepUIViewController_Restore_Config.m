@implementation StepByStepUIViewController_Restore_Config

- (void)loadView
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  double v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  double v17;
  const char *v18;
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
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  UIView *tableHeaderContainerView;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)StepByStepUIViewController_Restore_Config;
  -[StepByStepUIViewController loadView](&v43, sel_loadView);
  v42 = 0;
  v5 = (void *)objc_msgSend_view(self, v3, v4);
  objc_msgSend_frame(v5, v6, v7);
  self->restoreRecommendationLabel = (UILabel *)objc_msgSend_labelViewInContainer_width_(AssistantSubUIViewController, v8, (uint64_t)&v42, v9);
  objc_msgSend_setRestoreRecommendationContainerView_(self, v10, v42);
  v42 = 0;
  v13 = (void *)objc_msgSend_view(self, v11, v12);
  objc_msgSend_frame(v13, v14, v15);
  self->dontRestoreRecommendationLabel = (UILabel *)objc_msgSend_labelViewInContainer_width_(AssistantSubUIViewController, v16, (uint64_t)&v42, v17);
  objc_msgSend_setDontRestoreRecommendationContainerView_(self, v18, v42);
  v21 = objc_msgSend_colorWithRed_green_blue_alpha_(MEMORY[0x24BDF6950], v19, v20, 0.5, 0.0, 0.0, 1.0);
  objc_msgSend_setTextColor_(self->dontRestoreRecommendationLabel, v22, v21);
  v25 = objc_msgSend_tableHeaderContainerView(self, v23, v24);
  v28 = (void *)objc_msgSend_tableView(self, v26, v27);
  objc_msgSend_setTableHeaderView_(v28, v29, v25);
  v32 = (void *)objc_msgSend_tableView(self, v30, v31);
  v33 = (void *)MEMORY[0x24BDD1628];
  tableHeaderContainerView = self->super.tableHeaderContainerView;
  v37 = objc_msgSend_tableView(self, v35, v36);
  v39 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v33, v38, (uint64_t)tableHeaderContainerView, 7, 0, v37, 7, 1.0, 0.0);
  objc_msgSend_addConstraint_(v32, v40, v39);
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v41, (uint64_t)CFSTR("kNext"), 1, 0);
}

- (void)dealloc
{
  const char *v3;
  objc_super v4;

  objc_msgSend_setRestoreRecommendationContainerView_(self, a2, 0);
  objc_msgSend_setDontRestoreRecommendationContainerView_(self, v3, 0);
  v4.receiver = self;
  v4.super_class = (Class)StepByStepUIViewController_Restore_Config;
  -[StepByStepUIViewController dealloc](&v4, sel_dealloc);
}

- (void)setupInitialTableHeaderConfiguration
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;

  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = objc_msgSend_justTextContainerView(self, a2, v2);
  v10 = objc_msgSend_topoView(self, v6, v7);
  if (self->dontRestore)
    v11 = objc_msgSend_dontRestoreRecommendationContainerView(self, v8, v9);
  else
    v11 = objc_msgSend_restoreRecommendationContainerView(self, v8, v9);
  v13 = objc_msgSend_arrayWithObjects_(v4, v12, v5, v10, v11, 0);
  v16 = (void *)objc_msgSend_parentController(self, v14, v15);
  v19 = objc_msgSend_tableHeaderContainerView(self, v17, v18);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v16, v20, v19, v13, 1);
  v23 = objc_msgSend_tableHeaderContainerView(self, v21, v22);
  v26 = (void *)objc_msgSend_tableView(self, v24, v25);
  objc_msgSend_setTableHeaderView_(v26, v27, v23);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  UILabel *justTextLabel;
  char *justTextContainerView;
  const char *v11;
  void *ProductLocalizedStringWithFormat;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  UILabel *dontRestoreRecommendationLabel;
  char *dontRestoreRecommendationContainerView;
  void *v41;
  uint64_t v42;
  void **v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  objc_super v47;
  void *v48;
  void *v49;
  uint64_t v50;

  v3 = a3;
  v49 = 0;
  v50 = 0;
  v48 = 0;
  v5 = (void *)objc_msgSend_inParamDict(self, a2, a3);
  v7 = objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("kSBSKey_TargetBase"));
  objc_msgSend_syncTopoUIForTarget_andSource_andNetwork_connectionType_(self, v8, v7, 0, 0, 0);
  justTextLabel = self->super.justTextLabel;
  justTextContainerView = (char *)self->super.justTextContainerView;
  ProductLocalizedStringWithFormat = (void *)objc_msgSend_getProductLocalizedStringWithFormat_(self, v11, (uint64_t)CFSTR("StepByStepStatus_Restore%@"));
  sub_21A6829C8(justTextLabel, justTextContainerView, ProductLocalizedStringWithFormat);
  v15 = objc_msgSend_tableHeaderContainerView(self, v13, v14);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v16, v15);
  v19 = (void *)objc_msgSend_inParamDict(self, v17, v18);
  v21 = objc_msgSend_objectForKey_(v19, v20, (uint64_t)CFSTR("kSBSKey_RestoreRecommendation"));
  v24 = objc_msgSend_inParamDict(self, v22, v23);
  v27 = (void *)objc_msgSend_inParamDict(self, v25, v26);
  v29 = (void *)objc_msgSend_objectForKey_(v27, v28, (uint64_t)CFSTR("kSBSKey_Step"));
  v32 = objc_msgSend_integerValue(v29, v30, v31);
  objc_msgSend_formatRecommendation_fromParamDict_forStep_restoreString_restoreSpecificString_dontRecommendString_(StepByStepUtilities, v33, v21, v24, v32, &v50, &v49, &v48);
  v36 = objc_msgSend_length(v48, v34, v35);
  self->dontRestore = v36 != 0;
  if (v36)
  {
    dontRestoreRecommendationLabel = self->dontRestoreRecommendationLabel;
    dontRestoreRecommendationContainerView = (char *)self->dontRestoreRecommendationContainerView;
    v41 = v48;
  }
  else
  {
    v42 = objc_msgSend_length(v49, v37, v38);
    dontRestoreRecommendationContainerView = (char *)self->restoreRecommendationContainerView;
    if (v42)
      v43 = &v49;
    else
      v43 = (void **)&v50;
    v41 = *v43;
    dontRestoreRecommendationLabel = self->restoreRecommendationLabel;
  }
  sub_21A6829C8(dontRestoreRecommendationLabel, dontRestoreRecommendationContainerView, v41);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v44, (uint64_t)self->super.tableHeaderContainerView);
  objc_msgSend_setupInitialTableHeaderConfiguration(self, v45, v46);
  v47.receiver = self;
  v47.super_class = (Class)StepByStepUIViewController_Restore_Config;
  -[StepByStepUIViewController viewWillAppear:](&v47, sel_viewWillAppear_, v3);
}

- (UIView)restoreRecommendationContainerView
{
  return self->restoreRecommendationContainerView;
}

- (void)setRestoreRecommendationContainerView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1128);
}

- (UIView)dontRestoreRecommendationContainerView
{
  return self->dontRestoreRecommendationContainerView;
}

- (void)setDontRestoreRecommendationContainerView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1144);
}

@end
