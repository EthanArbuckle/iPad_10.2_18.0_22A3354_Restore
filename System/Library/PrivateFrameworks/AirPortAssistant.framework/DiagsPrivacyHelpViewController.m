@implementation DiagsPrivacyHelpViewController

- (DiagsPrivacyHelpViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DiagsPrivacyHelpViewController;
  return -[DiagsPrivacyHelpViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
}

- (void)loadView
{
  const char *v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  double x;
  double y;
  double width;
  double height;
  id v34;
  const char *v35;
  uint64_t v36;
  id v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  objc_super v58;
  CGRect v59;
  CGRect v60;

  v58.receiver = self;
  v58.super_class = (Class)DiagsPrivacyHelpViewController;
  -[DiagsPrivacyHelpViewController loadView](&v58, sel_loadView);
  if (sub_21A731A84(self, v3, v4) == 2)
    v5 = CFSTR("DiagsAndUsageApplePrivacyHelpTitle");
  else
    v5 = CFSTR("DiagsAndUsageApplePrivacyHelpTitle.short");
  v6 = sub_21A690C10((uint64_t)v5, (uint64_t)CFSTR("AirPortSettings"));
  v9 = (void *)objc_msgSend_navigationItem(self, v7, v8);
  objc_msgSend_setTitle_(v9, v10, v6);
  v13 = objc_msgSend__systemBackgroundColor(MEMORY[0x24BDF6950], v11, v12);
  v16 = (void *)objc_msgSend_view(self, v14, v15);
  objc_msgSend_setBackgroundColor_(v16, v17, v13);
  v20 = (void *)objc_msgSend_view(self, v18, v19);
  objc_msgSend_bounds(v20, v21, v22);
  if (v25 <= 400.0)
    v26 = 5.0;
  else
    v26 = 10.0;
  v27 = (void *)objc_msgSend_view(self, v23, v24);
  objc_msgSend_bounds(v27, v28, v29);
  v60 = CGRectInset(v59, v26, v26);
  x = v60.origin.x;
  y = v60.origin.y;
  width = v60.size.width;
  height = v60.size.height;
  v34 = objc_alloc(MEMORY[0x24BDF6EF8]);
  v37 = (id)objc_msgSend_initWithFrame_(v34, v35, v36, x, y, width, height);
  objc_msgSend_setEditable_(v37, v38, 0);
  v41 = objc_msgSend_systemFontOfSize_(MEMORY[0x24BDF6A70], v39, v40, 14.0);
  objc_msgSend_setFont_(v37, v42, v41);
  v45 = objc_msgSend__labelColor(MEMORY[0x24BDF6950], v43, v44);
  objc_msgSend_setTextColor_(v37, v46, v45);
  objc_msgSend_setAutoresizingMask_(v37, v47, 18);
  v50 = objc_msgSend_clearColor(MEMORY[0x24BDF6950], v48, v49);
  objc_msgSend_setBackgroundColor_(v37, v51, v50);
  v52 = sub_21A690C10((uint64_t)CFSTR("ABOUT_DIAGNOSTICS_INFO_TEXT_IOS"), (uint64_t)CFSTR("AirPortSettings"));
  objc_msgSend_setText_(v37, v53, v52);
  v56 = (void *)objc_msgSend_view(self, v54, v55);
  objc_msgSend_addSubview_(v56, v57, (uint64_t)v37);
}

@end
