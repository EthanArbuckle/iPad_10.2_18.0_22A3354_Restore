@implementation ZoomUI_UIAlertControllerOverride

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIAlertController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t);
  void *v44;
  id v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[4];
  id v52;
  id v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  double *v59;
  uint64_t v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  _QWORD v65[2];
  _QWORD v66[3];

  v66[2] = *MEMORY[0x24BDAC8D0];
  v64.receiver = self;
  v64.super_class = (Class)ZoomUI_UIAlertControllerOverride;
  -[ZoomUI_UIAlertControllerOverride viewDidAppear:](&v64, sel_viewDidAppear_, a3);
  -[ZoomUI_UIAlertControllerOverride safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "safeValueForKey:", CFSTR("bounds"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CGRectValue");
    v9 = v8;
    v11 = v10;

    v58 = 0;
    v59 = (double *)&v58;
    v60 = 0x4010000000;
    v61 = &unk_230B1E1C6;
    v62 = 0u;
    v12 = MEMORY[0x24BDAC760];
    v63 = 0u;
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __50__ZoomUI_UIAlertControllerOverride_viewDidAppear___block_invoke;
    v51[3] = &unk_24FED6040;
    v54 = &v58;
    v13 = v6;
    v52 = v13;
    v55 = v9;
    v56 = v11;
    __asm { FMOV            V0.2D, #2.0 }
    v57 = _Q0;
    v53 = v5;
    soft_AXPerformSafeBlock(v51);
    v19 = *((_QWORD *)v59 + 4);
    v20 = *((_QWORD *)v59 + 5);
    v21 = *((_QWORD *)v59 + 6);
    v22 = *((_QWORD *)v59 + 7);

    _Block_object_dispose(&v58, 8);
    v58 = 0;
    v59 = (double *)&v58;
    v60 = 0x4010000000;
    v61 = &unk_230B1E1C6;
    v62 = 0u;
    v63 = 0u;
    v41 = v12;
    v42 = 3221225472;
    v43 = __50__ZoomUI_UIAlertControllerOverride_viewDidAppear___block_invoke_2;
    v44 = &unk_24FED6068;
    v46 = &v58;
    v23 = v13;
    v45 = v23;
    v47 = v19;
    v48 = v20;
    v49 = v21;
    v50 = v22;
    soft_AXPerformSafeBlock(&v41);
    v24 = v59[4];
    v25 = v59[5];
    v26 = v59[6];
    v27 = v59[7];

    _Block_object_dispose(&v58, 8);
    v28 = soft_AXUIConvertRectFromScreenToContextSpace(v23, v24, v25, v26, v27);
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v35 = objc_alloc(MEMORY[0x24BDD16C8]);
    v65[0] = CFSTR("frame");
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v28, v30, v32, v34, v41, v42, v43, v44);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = CFSTR("contextId");
    v66[0] = v36;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v23, "_contextId"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v37;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v35, "initWithName:object:userInfo:", CFSTR("ZoomUIAleartWillAppearNotification"), 0, v38);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "postNotification:", v39);

  }
}

@end
