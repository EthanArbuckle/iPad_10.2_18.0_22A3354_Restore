@implementation AssistantSubUIViewController

- (AssistantSubUIViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AssistantSubUIViewController *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AssistantSubUIViewController;
  v8 = -[AUUITableViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, a3, a4);
  if (v8)
    v8->_outResultsDict = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (dword_2550EE4D0 <= 100 && (dword_2550EE4D0 != -1 || sub_21A69876C((uint64_t)&dword_2550EE4D0, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE4D0, (uint64_t)"-[AssistantSubUIViewController initWithNibName:bundle:]", 100, (uint64_t)"%@\n", v4, v5, v6, v7, (uint64_t)v8);
  return v8;
}

- (void)viewDidLoad
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AssistantSubUIViewController;
  -[AssistantSubUIViewController viewDidLoad](&v14, sel_viewDidLoad);
  v4 = objc_msgSend_objectForKey_(self->_inParamDict, v3, (uint64_t)CFSTR("kSBSKey_TargetNetwork"));
  v6 = objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v5, v4);
  v7 = sub_21A69111C(v6);
  v8 = sub_21A690C10((uint64_t)v7, qword_2550F4DE8);
  v11 = (void *)objc_msgSend_navigationItem(self, v9, v10);
  objc_msgSend_setTitle_(v11, v12, v8);
  objc_msgSend_setLeftNavigationButton_enable_hide_(self, v13, (uint64_t)CFSTR("kBack"), 1, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AssistantSubUIViewController;
  -[AUUITableViewController dealloc](&v3, sel_dealloc);
}

- (void)setLeftNavigationButton:(id)a3 enable:(BOOL)a4 hide:(BOOL)a5
{
  const char *v7;
  id v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;

  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("kBack"), a4, a5))
  {
    v8 = objc_alloc(MEMORY[0x24BDF6860]);
    v9 = sub_21A690C10((uint64_t)CFSTR("kBack"), qword_2550F4DE8);
    v11 = objc_msgSend_initWithTitle_style_target_action_(v8, v10, v9, 0, 0, 0);
    v14 = (void *)objc_msgSend_navigationItem(self, v12, v13);
    objc_msgSend_setBackBarButtonItem_(v14, v15, v11);
  }
  else if (objc_msgSend_isEqualToString_(a3, v7, (uint64_t)CFSTR("kCancel")))
  {
    v16 = objc_alloc(MEMORY[0x24BDF6860]);
    v17 = sub_21A690C10((uint64_t)CFSTR("kCancel"), qword_2550F4DE8);
    v20 = objc_msgSend_parentController(self, v18, v19);
    v22 = objc_msgSend_initWithTitle_style_target_action_(v16, v21, v17, 0, v20, sel_handleCancelButton_);
    v25 = (void *)objc_msgSend_navigationItem(self, v23, v24);
    objc_msgSend_setLeftBarButtonItem_(v25, v26, v22);
  }
}

- (void)setRightNavigationButton:(id)a3 enable:(BOOL)a4 hide:(BOOL)a5
{
  _BOOL8 v6;
  const char *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  void *v18;
  const char *v19;

  v6 = a4;
  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("kNext")))
  {
    if (a5)
    {
      v10 = 0;
    }
    else
    {
      v11 = objc_alloc(MEMORY[0x24BDF6860]);
      v12 = sub_21A690C10((uint64_t)CFSTR("kNext"), qword_2550F4DE8);
      v15 = objc_msgSend_parentController(self, v13, v14);
      v10 = (id)objc_msgSend_initWithTitle_style_target_action_(v11, v16, v12, 2, v15, sel_handleNextButton_);
      objc_msgSend_setEnabled_(v10, v17, v6);
    }
    v18 = (void *)objc_msgSend_navigationItem(self, v8, v9);
    objc_msgSend_setRightBarButtonItem_(v18, v19, (uint64_t)v10);
  }
}

- (id)getProductLocalizedStringWithFormat:(id)a3
{
  uint64_t v4;
  const char *v5;

  v4 = objc_msgSend_inParamDict(self, a2, (uint64_t)a3);
  return (id)objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v5, (uint64_t)a3, v4);
}

+ (id)labelViewInContainer:(id *)a3 width:(double)a4
{
  return (id)objc_msgSend_labelViewInContainer_width_constrain_(AssistantSubUIViewController, a2, (uint64_t)a3, 1, a4);
}

+ (id)labelViewInContainer:(id *)a3 width:(double)a4 constrain:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  void *v35;
  NSDictionary *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  NSDictionary *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;

  v5 = a5;
  v8 = objc_alloc(MEMORY[0x24BDF6F90]);
  v11 = (id)objc_msgSend_initWithFrame_(v8, v9, v10, 0.0, 0.0, a4, 50.0);
  v12 = v11;
  if (a3)
    *a3 = v11;
  v13 = objc_alloc(MEMORY[0x24BDF6B68]);
  v16 = (id)objc_msgSend_initWithFrame_(v13, v14, v15, 0.0, 0.0, a4, 50.0);
  objc_msgSend_setText_(v16, v17, (uint64_t)&stru_24DD08368);
  v20 = objc_msgSend_systemFontOfSize_(MEMORY[0x24BDF6A70], v18, v19, 15.0);
  objc_msgSend_setFont_(v16, v21, v20);
  objc_msgSend_setAdjustsFontSizeToFitWidth_(v16, v22, 1);
  objc_msgSend_setMinimumScaleFactor_(v16, v23, v24, 0.866666667);
  v27 = objc_msgSend__secondaryLabelColor(MEMORY[0x24BDF6950], v25, v26);
  objc_msgSend_setTextColor_(v16, v28, v27);
  objc_msgSend_setTextAlignment_(v16, v29, 1);
  objc_msgSend_setLineBreakMode_(v16, v30, 0);
  objc_msgSend_setNumberOfLines_(v16, v31, 0);
  objc_msgSend_addSubview_(v12, v32, (uint64_t)v16);
  if (v5)
  {
    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v16, v33, 0);
    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v12, v34, 0);
    v35 = (void *)MEMORY[0x24BDD1628];
    v36 = _NSDictionaryOfVariableBindings(CFSTR("label"), v16, 0);
    v38 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v35, v37, (uint64_t)CFSTR("V:|-10-[label]-10-|"), 0, 0, v36);
    objc_msgSend_addConstraints_(v12, v39, v38);
    v40 = (void *)MEMORY[0x24BDD1628];
    v41 = _NSDictionaryOfVariableBindings(CFSTR("label"), v16, 0);
    v43 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v40, v42, (uint64_t)CFSTR("H:|-10-[label]-10-|"), 0, 0, v41);
    objc_msgSend_addConstraints_(v12, v44, v43);
  }
  return v16;
}

+ (id)labelViewInContainer:(id *)a3 width:(double)a4 withSpinner:(id *)a5 above:(BOOL)a6
{
  _BOOL4 v6;
  void *v9;
  const char *v10;
  const char *v11;
  id v12;
  const char *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  void *v21;
  void *v22;
  NSDictionary *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  void *v32;
  NSDictionary *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  NSDictionary *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  void *v42;
  NSDictionary *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  void *v48;

  v6 = a6;
  v48 = 0;
  v9 = (void *)objc_msgSend_labelViewInContainer_width_constrain_(AssistantSubUIViewController, a2, (uint64_t)&v48, 0, a4);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v9, v10, 0);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v48, v11, 0);
  if (a3)
    *a3 = v48;
  v12 = objc_alloc(MEMORY[0x24BDF67D0]);
  v14 = (id)objc_msgSend_initWithActivityIndicatorStyle_(v12, v13, 100);
  v17 = objc_msgSend__labelColor(MEMORY[0x24BDF6950], v15, v16);
  objc_msgSend_setColor_(v14, v18, v17);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v14, v19, 0);
  if (a5)
    *a5 = v14;
  objc_msgSend_addSubview_(v48, v20, (uint64_t)v14);
  v21 = v48;
  v22 = (void *)MEMORY[0x24BDD1628];
  if (v6)
  {
    v23 = _NSDictionaryOfVariableBindings(CFSTR("spinner, label"), v14, v9, 0);
    v25 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v22, v24, (uint64_t)CFSTR("V:|-4-[spinner]-4-[label]-4-|"), 0, 0, v23);
    objc_msgSend_addConstraints_(v21, v26, v25);
    v27 = v48;
    v29 = objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(MEMORY[0x24BDD1628], v28, (uint64_t)v14, 9, 0, v48, 9, 1.0, 0.0);
    objc_msgSend_addConstraint_(v27, v30, v29);
    v31 = v48;
    v32 = (void *)MEMORY[0x24BDD1628];
    v33 = _NSDictionaryOfVariableBindings(CFSTR("label"), v9, 0);
    v35 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v32, v34, (uint64_t)CFSTR("H:|-10-[label]-10-|"), 0, 0, v33);
    objc_msgSend_addConstraints_(v31, v36, v35);
  }
  else
  {
    v37 = _NSDictionaryOfVariableBindings(CFSTR("label"), v9, 0);
    v39 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v22, v38, (uint64_t)CFSTR("V:|-10-[label]-10-|"), 0, 0, v37);
    objc_msgSend_addConstraints_(v21, v40, v39);
    v41 = v48;
    v42 = (void *)MEMORY[0x24BDD1628];
    v43 = _NSDictionaryOfVariableBindings(CFSTR("spinner, label"), v14, v9, 0);
    v45 = objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(v42, v44, (uint64_t)CFSTR("H:|-[spinner]-[label]-|"), 1024, 0, v43);
    objc_msgSend_addConstraints_(v41, v46, v45);
  }
  return v9;
}

+ (id)topoViewWithWidth:(double)a3
{
  UITopoView *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;

  v4 = [UITopoView alloc];
  v7 = (id)objc_msgSend_initWithFrame_(v4, v5, v6, 0.0, 0.0, a3, 140.0);
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v7, v8, 0);
  return v7;
}

+ (id)containerViewWithWidth:(double)a3
{
  id v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_alloc(MEMORY[0x24BDF6F90]);
  return (id)objc_msgSend_initWithFrame_(v4, v5, v6, 0.0, 0.0, a3, 20.0);
}

+ (id)tableViewWithWidth:(double)a3 height:(double)a4
{
  id v6;
  const char *v7;

  v6 = objc_alloc(MEMORY[0x24BDF6E58]);
  return (id)objc_msgSend_initWithFrame_style_(v6, v7, 1, 0.0, 0.0, a3, a4);
}

- (AssistantUIViewController)parentController
{
  return self->_parentController;
}

- (void)setParentController:(id)a3
{
  self->_parentController = (AssistantUIViewController *)a3;
}

- (NSDictionary)inParamDict
{
  return self->_inParamDict;
}

- (void)setInParamDict:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1032);
}

- (NSDictionary)outResultsDict
{
  return &self->_outResultsDict->super;
}

@end
