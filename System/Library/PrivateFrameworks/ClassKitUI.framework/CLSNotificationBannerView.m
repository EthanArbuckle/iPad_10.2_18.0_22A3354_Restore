@implementation CLSNotificationBannerView

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

+ (id)bannerTitleAttributes
{
  if (qword_25547D350 != -1)
    dispatch_once(&qword_25547D350, &unk_24E357160);
  return (id)qword_25547D348;
}

+ (id)bannerMessageAttributes
{
  if (qword_25547D360 != -1)
    dispatch_once(&qword_25547D360, &unk_24E357180);
  return (id)qword_25547D358;
}

+ (id)bundle
{
  if (qword_25547D370 != -1)
    dispatch_once(&qword_25547D370, &unk_24E3571A0);
  return (id)qword_25547D368;
}

- (CLSNotificationBannerView)initWithTitle:(id)a3 imageView:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CLSNotificationBannerView *v15;
  const char *v16;
  uint64_t v17;
  CLSNotificationBannerView *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  const char *v27;
  const char *v28;
  const char *v29;
  UIStackView *v30;
  UIStackView *labelsStackView;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  unint64_t v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  UILabel *titleLabel;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  id v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  id v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  UILabel *messageLabel;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  const char *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  id v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  void *v81;
  const char *v82;
  const char *v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  UILabel *v89;
  double v90;
  double v91;
  UILabel *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  float v100;
  double v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  void *v109;
  const char *v110;
  void *v112;
  objc_super v113;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v113.receiver = self;
  v113.super_class = (Class)CLSNotificationBannerView;
  v11 = *MEMORY[0x24BDBF090];
  v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v13 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v15 = -[CLSNotificationBannerView initWithFrame:](&v113, sel_initWithFrame_, *MEMORY[0x24BDBF090], v12, v13, v14);
  v18 = v15;
  if (v15)
  {
    objc_msgSend_setDuration_(v15, v16, v17, 9.0);
    objc_msgSend_currentTraitCollection(MEMORY[0x24BDF6F30], v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_userInterfaceStyle(v21, v22, v23);

    if (v24 > 2)
      v25 = 0;
    else
      v25 = qword_21EC023D0[v24];
    v26 = objc_alloc(MEMORY[0x24BDF7018]);
    v112 = (void *)objc_msgSend_initWithPrivateStyle_(v26, v27, v25);
    objc_msgSend_addSubview_(v18, v28, (uint64_t)v112);
    objc_storeStrong((id *)&v18->_imageView, a4);
    objc_msgSend_addSubview_(v18, v29, (uint64_t)v18->_imageView);
    v30 = (UIStackView *)objc_alloc_init(MEMORY[0x24BDF6DD0]);
    labelsStackView = v18->_labelsStackView;
    v18->_labelsStackView = v30;

    objc_msgSend_setAxis_(v18->_labelsStackView, v32, 1);
    objc_msgSend_setAlignment_(v18->_labelsStackView, v33, 0);
    objc_msgSend_setDistribution_(v18->_labelsStackView, v34, 2);
    objc_msgSend_addSubview_(v18, v35, (uint64_t)v18->_labelsStackView);
    v38 = 0x24BDF6000uLL;
    if (v8)
    {
      v39 = objc_alloc(MEMORY[0x24BDF6B68]);
      v42 = objc_msgSend_initWithFrame_(v39, v40, v41, v11, v12, v13, v14);
      titleLabel = v18->_titleLabel;
      v18->_titleLabel = (UILabel *)v42;

      objc_msgSend_clearColor(MEMORY[0x24BDF6950], v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setBackgroundColor_(v18->_titleLabel, v47, (uint64_t)v46);

      objc_msgSend_setNumberOfLines_(v18->_titleLabel, v48, 1);
      objc_msgSend_setAdjustsFontSizeToFitWidth_(v18->_titleLabel, v49, 1);
      objc_msgSend_setMinimumScaleFactor_(v18->_titleLabel, v50, v51, 0.8);
      v52 = objc_alloc(MEMORY[0x24BDD1458]);
      v53 = (void *)objc_opt_class();
      objc_msgSend_bannerTitleAttributes(v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (void *)objc_msgSend_initWithString_attributes_(v52, v57, (uint64_t)v8, v56);
      objc_msgSend_setAttributedText_(v18->_titleLabel, v59, (uint64_t)v58);

      v38 = 0x24BDF6000uLL;
      objc_msgSend_setTextAlignment_(v18->_titleLabel, v60, 4);
      objc_msgSend_addArrangedSubview_(v18->_labelsStackView, v61, (uint64_t)v18->_titleLabel);
    }
    if (v10)
    {
      v62 = objc_alloc(MEMORY[0x24BDF6B68]);
      v65 = objc_msgSend_initWithFrame_(v62, v63, v64, v11, v12, v13, v14);
      messageLabel = v18->_messageLabel;
      v18->_messageLabel = (UILabel *)v65;

      objc_msgSend_clearColor(MEMORY[0x24BDF6950], v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setBackgroundColor_(v18->_messageLabel, v70, (uint64_t)v69);

      objc_msgSend_setNumberOfLines_(v18->_messageLabel, v71, 0);
      objc_msgSend_setAdjustsFontSizeToFitWidth_(v18->_messageLabel, v72, 1);
      objc_msgSend_setMinimumScaleFactor_(v18->_messageLabel, v73, v74, 0.8);
      v75 = objc_alloc(MEMORY[0x24BDD1458]);
      v76 = (void *)objc_opt_class();
      objc_msgSend_bannerMessageAttributes(v76, v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = (void *)objc_msgSend_initWithString_attributes_(v75, v80, (uint64_t)v10, v79);
      objc_msgSend_setAttributedText_(v18->_messageLabel, v82, (uint64_t)v81);

      v38 = 0x24BDF6000;
      objc_msgSend_setTextAlignment_(v18->_messageLabel, v83, 4);
      objc_msgSend_addArrangedSubview_(v18->_labelsStackView, v84, (uint64_t)v18->_messageLabel);
    }
    if (qword_25547D378 != -1)
      dispatch_once(&qword_25547D378, &unk_24E357258);
    if (byte_25547D328)
    {
      objc_msgSend_sizeToFit(v18->_titleLabel, v36, v37);
      objc_msgSend_sizeToFit(v18->_messageLabel, v85, v86);
      v89 = v18->_titleLabel;
      if (v89)
      {
        objc_msgSend_frame(v89, v87, v88);
        v91 = v90;
      }
      else
      {
        v91 = 0.0;
      }
      v92 = v18->_messageLabel;
      if (v92)
      {
        objc_msgSend_frame(v92, v87, v88);
        if (v91 < v93)
          v91 = v93;
      }
      v38 = 0x24BDF6000uLL;
      v94 = fmin(v91, 512.0);
      if (qword_25547D378 != -1)
        dispatch_once(&qword_25547D378, &unk_24E357258);
      v95 = 54.0;
      if (!byte_25547D328)
        v95 = 57.0;
      v96 = 12.0;
      if (byte_25547D328)
        v97 = 12.0;
      else
        v97 = 15.0;
      v98 = v94 + v95 + v97;
      if (!byte_25547D328)
        v96 = 15.0;
      v99 = v98 + v96;
      if (v99 < 282.0)
        v99 = 282.0;
      v18->_preferredWidthPad = v99;
      v100 = 16.5;
      if (!byte_25547D328)
        v100 = 16.0;
      v101 = floorf(v100);
      objc_msgSend_layer(v18, v87, v88);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCornerRadius_(v102, v103, v104, v101);

      objc_msgSend_layer(v18, v105, v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setMasksToBounds_(v107, v108, 1);

    }
    objc_msgSend_systemBackgroundColor(*(void **)(v38 + 2384), v36, v37);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBackgroundColor_(v18, v110, (uint64_t)v109);

  }
  objc_msgSend_applyConstraints(v18, v16, v17);

  return v18;
}

- (CLSNotificationBannerView)initWithTitle:(id)a3 image:(id)a4 message:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  CLSNotificationBannerView *v22;

  v8 = (objc_class *)MEMORY[0x24BDF6AE8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [v8 alloc];
  v14 = (void *)objc_msgSend_initWithImage_(v12, v13, (uint64_t)v10);

  objc_msgSend_clearColor(MEMORY[0x24BDF6950], v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBackgroundColor_(v14, v18, (uint64_t)v17);

  objc_msgSend_setContentMode_(v14, v19, 1);
  objc_msgSend_setClipsToBounds_(v14, v20, 1);
  v22 = (CLSNotificationBannerView *)objc_msgSend_initWithTitle_imageView_message_(self, v21, (uint64_t)v11, v14, v9);

  return v22;
}

- (CLSNotificationBannerView)initWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  CLSNotificationBannerView *v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend_bundle(CLSNotificationBannerView, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageNamed_inBundle_(MEMORY[0x24BDF6AC8], v11, (uint64_t)CFSTR("BannerIcon"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (CLSNotificationBannerView *)objc_msgSend_initWithTitle_image_message_(self, v13, (uint64_t)v7, v12, v6);

  return v14;
}

- (void)applyConstraints
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  double v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  double v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  void *v84;
  double v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  void *v96;
  void *v97;
  double v98;
  void *v99;
  const char *v100;
  void *v101;
  const char *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  _QWORD v117[4];
  _QWORD v118[4];

  v118[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_imageView(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v4, v5, 0);

  objc_msgSend_labelsStackView(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v8, v9, 0);

  v10 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend_imageView(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topAnchor(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topAnchor(self, v17, v18);
  v20 = objc_claimAutoreleasedReturnValue();
  v115 = v13;
  if (qword_25547D378 != -1)
    dispatch_once(&qword_25547D378, &unk_24E357258);
  v21 = 12.0;
  if (!byte_25547D328)
    v21 = 11.0;
  objc_msgSend_constraintEqualToAnchor_constant_(v16, v19, v20, v21);
  v118[0] = objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageView(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_leadingAnchor(v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_leadingAnchor(self, v28, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = (void *)v20;
  v113 = v16;
  v107 = v24;
  v109 = (void *)v118[0];
  if (qword_25547D378 != -1)
    dispatch_once(&qword_25547D378, &unk_24E357258);
  v32 = 12.0;
  if (!byte_25547D328)
    v32 = 11.0;
  objc_msgSend_constraintEqualToAnchor_constant_(v27, v30, (uint64_t)v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v118[1] = v33;
  objc_msgSend_imageView(self, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerYAnchor(v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_centerYAnchor(self, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintEqualToAnchor_(v39, v43, (uint64_t)v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v118[2] = v44;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v45, (uint64_t)v118, 3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activateConstraints_(v10, v47, (uint64_t)v46);

  v48 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend_labelsStackView(self, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_leadingAnchor(v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageView(self, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trailingAnchor(v57, v58, v59);
  v61 = objc_claimAutoreleasedReturnValue();
  v106 = v48;
  if (qword_25547D378 != -1)
    dispatch_once(&qword_25547D378, &unk_24E357258);
  v62 = 12.0;
  if (!byte_25547D328)
    v62 = 11.0;
  objc_msgSend_constraintEqualToAnchor_constant_(v54, v60, v61, v62);
  v63 = objc_claimAutoreleasedReturnValue();
  v117[0] = v63;
  objc_msgSend_labelsStackView(self, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topAnchor(v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topAnchor(self, v70, v71);
  v73 = objc_claimAutoreleasedReturnValue();
  v114 = v54;
  v116 = v51;
  v112 = v57;
  v105 = v66;
  if (qword_25547D378 != -1)
    dispatch_once(&qword_25547D378, &unk_24E357258);
  v74 = 12.0;
  if (!byte_25547D328)
    v74 = 15.0;
  objc_msgSend_constraintEqualToAnchor_constant_(v69, v72, v73, v74);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v117[1] = v103;
  objc_msgSend_labelsStackView(self, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bottomAnchor(v77, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bottomAnchor(self, v81, v82);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = (void *)v63;
  v110 = (void *)v61;
  v104 = v69;
  if (qword_25547D378 != -1)
    dispatch_once(&qword_25547D378, &unk_24E357258);
  v85 = 12.0;
  if (!byte_25547D328)
    v85 = 15.0;
  objc_msgSend_constraintEqualToAnchor_constant_(v80, v83, (uint64_t)v84, -v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v117[2] = v86;
  objc_msgSend_labelsStackView(self, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trailingAnchor(v89, v90, v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trailingAnchor(self, v93, v94);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = (void *)v73;
  if (qword_25547D378 != -1)
    dispatch_once(&qword_25547D378, &unk_24E357258);
  v98 = 12.0;
  if (!byte_25547D328)
    v98 = 15.0;
  objc_msgSend_constraintEqualToAnchor_constant_(v92, v95, (uint64_t)v96, -v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v117[3] = v99;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v100, (uint64_t)v117, 4);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activateConstraints_(v106, v102, (uint64_t)v101);

}

- (void)showWithCompletionHandler:(id)a3
{
  objc_msgSend_setCompletionHandler_(self, a2, (uint64_t)a3);
  MEMORY[0x24BEDD108](CLSNotificationBannerWindow, sel_enqueBanner_, self);
}

- (void)hideBanner
{
  uint64_t v2;
  const char *v4;
  id v5;

  objc_msgSend_superview(self, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__hideBanner_quickly_(v5, v4, (uint64_t)self, 1);

}

- (void)callCompletionHandler
{
  uint64_t v2;
  const char *v4;
  void (**v5)(void);

  objc_msgSend_completionHandler(self, a2, v2);
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v5)
    v5[2]();
  objc_msgSend_setCompletionHandler_(self, v4, 0);

}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabel, a3);
}

- (UIStackView)labelsStackView
{
  return self->_labelsStackView;
}

- (void)setLabelsStackView:(id)a3
{
  objc_storeStrong((id *)&self->_labelsStackView, a3);
}

- (double)preferredWidthPad
{
  return self->_preferredWidthPad;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
