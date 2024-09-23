@implementation CLLocationButton

- (CLLocationButton)init
{
  CLLocationButton *v2;
  const char *v3;
  __n128 v4;
  __n128 v5;
  CLLocationButton *v6;
  const char *v7;
  __n128 v8;
  __n128 v9;
  const char *v10;
  __n128 v11;
  __n128 v12;
  CLLocationButton *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLLocationButton;
  v2 = -[CLLocationButton init](&v15, sel_init);
  v6 = v2;
  if (v2)
  {
    objc_msgSend_setClipsToBounds_(v2, v3, v4, v5, 1);
    objc_msgSend__setupSlotView(v6, v7, v8, v9);
    objc_msgSend_markDirty(v6, v10, v11, v12);
    v13 = v6;
  }

  return v6;
}

- (CLLocationButton)initWithFrame:(CGRect)a3
{
  CLLocationButton *v3;
  const char *v4;
  __n128 v5;
  __n128 v6;
  CLLocationButton *v7;
  const char *v8;
  __n128 v9;
  __n128 v10;
  const char *v11;
  __n128 v12;
  __n128 v13;
  CLLocationButton *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CLLocationButton;
  v3 = -[CLLocationButton initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v3;
  if (v3)
  {
    objc_msgSend_setClipsToBounds_(v3, v4, v5, v6, 1);
    objc_msgSend__setupSlotView(v7, v8, v9, v10);
    objc_msgSend_markDirty(v7, v11, v12, v13);
    v14 = v7;
  }

  return v7;
}

- (CLLocationButton)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLLocationButton *v6;
  __n128 v7;
  __n128 v8;
  uint64_t v9;
  const char *v10;
  __n128 v11;
  __n128 v12;
  uint64_t v13;
  const char *v14;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  double v18;
  const char *v19;
  __n128 v20;
  float v21;
  double v22;
  uint64_t v23;
  const char *v24;
  __n128 v25;
  __n128 v26;
  uint64_t v27;
  UIColor *backgroundColor;
  uint64_t v29;
  const char *v30;
  __n128 v31;
  __n128 v32;
  uint64_t v33;
  UIColor *tintColor;
  const char *v35;
  __n128 v36;
  __n128 v37;
  const char *v38;
  __n128 v39;
  __n128 v40;
  __n128 v41;
  const char *v42;
  __n128 v43;
  __n128 v44;
  const char *v45;
  __n128 v46;
  const char *v47;
  __n128 v48;
  __n128 v49;
  const char *v50;
  __n128 v51;
  __n128 v52;
  const char *v53;
  __n128 v54;
  __n128 v55;
  CLLocationButton *v56;
  objc_super v58;

  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)CLLocationButton;
  v6 = -[CLLocationButton initWithCoder:](&v58, sel_initWithCoder_, v4);
  if (v6)
  {
    v9 = (int)objc_msgSend_decodeIntForKey_(v4, v5, v7, v8, CFSTR("kCLLocationButtonIcon"));
    v13 = (int)objc_msgSend_decodeIntForKey_(v4, v10, v11, v12, CFSTR("kCLLocationButtonLabel"));
    objc_msgSend_decodeFloatForKey_(v4, v14, v15, v16, CFSTR("kCLLocationButtonCornerRadius"));
    v18 = v17.n128_f32[0];
    objc_msgSend_decodeFloatForKey_(v4, v19, v17, v20, CFSTR("kCLLocationButtonFontSize"));
    v22 = v21;
    v23 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v25, v26, v23, CFSTR("kCLLocationButtonBackgroundColor"));
    v27 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v6->_backgroundColor;
    v6->_backgroundColor = (UIColor *)v27;

    v29 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v31, v32, v29, CFSTR("kCLLocationButtonTintColor"));
    v33 = objc_claimAutoreleasedReturnValue();
    tintColor = v6->_tintColor;
    v6->_tintColor = (UIColor *)v33;

    objc_msgSend_setIcon_(v6, v35, v36, v37, v9);
    objc_msgSend_setLabel_(v6, v38, v39, v40, v13);
    v41.n128_f64[0] = v18;
    objc_msgSend_setCornerRadius_(v6, v42, v41, v43);
    v44.n128_f64[0] = v22;
    objc_msgSend_setFontSize_(v6, v45, v44, v46);
    objc_msgSend_setClipsToBounds_(v6, v47, v48, v49, 1);
    objc_msgSend__setupSlotView(v6, v50, v51, v52);
    objc_msgSend_markDirty(v6, v53, v54, v55);
    v56 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  __n128 v6;
  __n128 v7;
  const char *v8;
  __n128 v9;
  __n128 v10;
  uint64_t v11;
  const char *v12;
  __n128 v13;
  __n128 v14;
  const char *v15;
  __n128 v16;
  __n128 v17;
  uint64_t v18;
  const char *v19;
  __n128 v20;
  __n128 v21;
  const char *v22;
  __n128 v23;
  __n128 v24;
  __n128 v25;
  const char *v26;
  __n128 v27;
  const char *v28;
  __n128 v29;
  __n128 v30;
  __n128 v31;
  const char *v32;
  __n128 v33;
  const char *v34;
  __n128 v35;
  __n128 v36;
  const char *v37;
  __n128 v38;
  __n128 v39;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)CLLocationButton;
  v4 = a3;
  -[CLLocationButton encodeWithCoder:](&v40, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInt_forKey_(v4, v5, v6, v7, 1, CFSTR("kCLLocationButtonVersion"), v40.receiver, v40.super_class);
  v11 = objc_msgSend_icon(self, v8, v9, v10);
  objc_msgSend_encodeInt_forKey_(v4, v12, v13, v14, v11, CFSTR("kCLLocationButtonIcon"));
  v18 = objc_msgSend_label(self, v15, v16, v17);
  objc_msgSend_encodeInt_forKey_(v4, v19, v20, v21, v18, CFSTR("kCLLocationButtonLabel"));
  objc_msgSend_cornerRadius(self, v22, v23, v24);
  v25.n128_f32[0] = v25.n128_f64[0];
  objc_msgSend_encodeFloat_forKey_(v4, v26, v25, v27, CFSTR("kCLLocationButtonCornerRadius"));
  objc_msgSend_fontSize(self, v28, v29, v30);
  v31.n128_f32[0] = v31.n128_f64[0];
  objc_msgSend_encodeFloat_forKey_(v4, v32, v31, v33, CFSTR("kCLLocationButtonFontSize"));
  objc_msgSend_encodeObject_forKey_(v4, v34, v35, v36, self->_backgroundColor, CFSTR("kCLLocationButtonBackgroundColor"));
  objc_msgSend_encodeObject_forKey_(v4, v37, v38, v39, self->_tintColor, CFSTR("kCLLocationButtonTintColor"));

}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  const char *v5;
  __n128 v6;
  __n128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLLocationButton;
  v4 = a3;
  -[CLLocationButton _populateArchivedSubviews:](&v8, sel__populateArchivedSubviews_, v4);
  objc_msgSend_removeObject_(v4, v5, v6, v7, self->_slotView, v8.receiver, v8.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)markDirty
{
  self->_intrinsicSize = (CGSize)*MEMORY[0x24BDBF148];
  MEMORY[0x24BEDD108]();
}

- (LocationUIProtocol)locationUIProxy
{
  LocationUIProtocol *proxy;
  id v4;
  const char *v5;
  __n128 v6;
  __n128 v7;
  void *v8;
  const char *v9;
  __n128 v10;
  __n128 v11;
  void *v12;
  const char *v13;
  __n128 v14;
  __n128 v15;
  const char *v16;
  __n128 v17;
  __n128 v18;
  const char *v19;
  __n128 v20;
  __n128 v21;
  const char *v22;
  __n128 v23;
  __n128 v24;
  const char *v25;
  __n128 v26;
  __n128 v27;
  LocationUIProtocol *v28;
  LocationUIProtocol *v29;

  proxy = self->_proxy;
  if (!proxy)
  {
    v4 = objc_alloc(MEMORY[0x24BDD1988]);
    v8 = (void *)objc_msgSend_initWithServiceName_(v4, v5, v6, v7, CFSTR("com.apple.corelocation.locationUI"));
    objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v9, v10, v11, &unk_255DB8580);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRemoteObjectInterface_(v8, v13, v14, v15, v12);

    objc_msgSend_setInterruptionHandler_(v8, v16, v17, v18, &unk_24F97D708);
    objc_msgSend_setInvalidationHandler_(v8, v19, v20, v21, &unk_24F97D728);
    objc_msgSend_resume(v8, v22, v23, v24);
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v8, v25, v26, v27, &unk_24F97D768);
    v28 = (LocationUIProtocol *)objc_claimAutoreleasedReturnValue();
    v29 = self->_proxy;
    self->_proxy = v28;

    proxy = self->_proxy;
  }
  return proxy;
}

- (void)_setupSlotView
{
  __n128 v2;
  __n128 v3;
  const char *v5;
  __n128 v6;
  __n128 v7;
  void *v8;
  const char *v9;
  __n128 v10;
  __n128 v11;
  id v12;
  const char *v13;
  __n128 v14;
  __n128 v15;
  void *v16;
  const char *v17;
  __n128 v18;
  __n128 v19;
  NSString *v20;
  NSString *sandboxExtension;
  UIColor *v22;
  UIColor *backgroundColor;
  const char *v24;
  __n128 v25;
  __n128 v26;
  UIColor *v27;
  UIColor *tintColor;
  const char *v29;
  __n128 v30;
  __n128 v31;
  const char *v32;
  __n128 v33;
  __n128 v34;
  _UISlotView *v35;
  _UISlotView *slotView;
  const char *v37;
  __n128 v38;
  __n128 v39;
  const char *v40;
  __n128 v41;
  __n128 v42;
  _UISlotView *v43;
  void *v44;
  const char *v45;
  __n128 v46;
  __n128 v47;
  void *v48;
  const char *v49;
  __n128 v50;
  __n128 v51;
  id v52;
  const char *v53;
  __n128 v54;
  __n128 v55;
  void *v56;
  const char *v57;
  __n128 v58;
  __n128 v59;
  void *v60;
  const char *v61;
  __n128 v62;
  __n128 v63;
  void *v64;
  const char *v65;
  __n128 v66;
  __n128 v67;
  void *v68;
  const char *v69;
  __n128 v70;
  __n128 v71;
  void *v72;
  const char *v73;
  __n128 v74;
  __n128 v75;
  void *v76;
  const char *v77;
  __n128 v78;
  __n128 v79;
  void *v80;
  const char *v81;
  __n128 v82;
  __n128 v83;
  void *v84;
  const char *v85;
  __n128 v86;
  __n128 v87;
  __n128 v88;
  const char *v89;
  __n128 v90;
  __n128 v91;
  const char *v92;
  __n128 v93;
  __n128 v94;
  __n128 v95;
  const char *v96;
  NSLayoutConstraint *v97;
  NSLayoutConstraint *minimumWidthConstraint;
  __n128 v99;
  const char *v100;
  __n128 v101;
  const char *v102;
  __n128 v103;
  __n128 v104;
  __n128 v105;
  __n128 v106;
  const char *v107;
  NSLayoutConstraint *v108;
  NSLayoutConstraint *minimumHeightConstraint;
  __n128 v110;
  const char *v111;
  __n128 v112;
  const char *v113;
  __n128 v114;
  __n128 v115;
  const char *v116;
  __n128 v117;
  __n128 v118;
  NSString *v119;
  _QWORD v120[4];
  id v121;
  id location;
  _QWORD v123[4];
  id v124;
  _QWORD v125[2];
  void *v126;
  uint8_t buf[4];
  NSString *v128;
  uint64_t v129;

  v129 = *MEMORY[0x24BDAC8D0];
  if (self->_slotView)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_22D9A2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "#locationButton _slotView has been already created", buf, 2u);
    }
  }
  else
  {
    objc_msgSend_addTarget_action_forControlEvents_(self, a2, v2, v3, 0, sel__actionForPreSetTarget, 64);
    objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bundleURL(v8, v9, v10, v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend_fileSystemRepresentation(v12, v13, v14, v15);
    v16 = (void *)sandbox_extension_issue_file();

    if (v16)
    {
      objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v17, v18, v19, v16, 4);
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      sandboxExtension = self->_sandboxExtension;
      self->_sandboxExtension = v20;

      free(v16);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        v119 = self->_sandboxExtension;
        *(_DWORD *)buf = 138412290;
        v128 = v119;
        _os_log_debug_impl(&dword_22D9A2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "#locationButton sandbox-extension: %@", buf, 0xCu);
      }
    }
    objc_msgSend_systemBlueColor(MEMORY[0x24BDF6948], v17, v18, v19);
    v22 = (UIColor *)objc_claimAutoreleasedReturnValue();
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v22;

    objc_msgSend_systemWhiteColor(MEMORY[0x24BDF6948], v24, v25, v26);
    v27 = (UIColor *)objc_claimAutoreleasedReturnValue();
    tintColor = self->_tintColor;
    self->_tintColor = v27;

    objc_msgSend_setIsAccessibilityElement_(self, v29, v30, v31, 1);
    objc_msgSend_setAccessibilityIdentifier_(self, v32, v33, v34, CFSTR("CLLocationButton"));
    v35 = (_UISlotView *)objc_alloc_init(MEMORY[0x24BDF7158]);
    slotView = self->_slotView;
    self->_slotView = v35;

    objc_msgSend_setUserInteractionEnabled_(self->_slotView, v37, v38, v39, 0);
    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(self->_slotView, v40, v41, v42, 0);
    objc_initWeak((id *)buf, self);
    v43 = self->_slotView;
    objc_opt_self();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = v44;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v45, v46, v47, &v126, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v123[0] = MEMORY[0x24BDAC760];
    v123[1] = 3221225472;
    v123[2] = sub_22D9A42A8;
    v123[3] = &unk_24F97D790;
    objc_copyWeak(&v124, (id *)buf);
    v52 = (id)objc_msgSend_registerForTraitChanges_withHandler_(v43, v49, v50, v51, v48, v123);

    objc_msgSend_addSubview_(self, v53, v54, v55, self->_slotView);
    v56 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend_centerXAnchor(self->_slotView, v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_centerXAnchor(self, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_constraintEqualToAnchor_(v60, v65, v66, v67, v64);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v125[0] = v68;
    objc_msgSend_centerYAnchor(self->_slotView, v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_centerYAnchor(self, v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_constraintEqualToAnchor_(v72, v77, v78, v79, v76);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v125[1] = v80;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v81, v82, v83, v125, 2);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_activateConstraints_(v56, v85, v86, v87, v84);

    v88.n128_u32[0] = 1144750080;
    objc_msgSend_setContentHuggingPriority_forAxis_(self, v89, v88, v90, 1);
    v91.n128_u32[0] = 1144750080;
    objc_msgSend_setContentHuggingPriority_forAxis_(self, v92, v91, v93, 0);
    v94.n128_u64[0] = *(_QWORD *)&self->_intrinsicSize.width;
    v95.n128_u64[0] = 1.0;
    objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(MEMORY[0x24BDD1628], v96, v95, v94, self, 7, 1, 0, 0);
    v97 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    minimumWidthConstraint = self->_minimumWidthConstraint;
    self->_minimumWidthConstraint = v97;

    v99.n128_u32[0] = 1148846080;
    objc_msgSend_setPriority_(self->_minimumWidthConstraint, v100, v99, v101);
    objc_msgSend_setActive_(self->_minimumWidthConstraint, v102, v103, v104, 1);
    v105.n128_u64[0] = *(_QWORD *)&self->_intrinsicSize.height;
    v106.n128_u64[0] = 1.0;
    objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(MEMORY[0x24BDD1628], v107, v106, v105, self, 8, 1, 0, 0);
    v108 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    minimumHeightConstraint = self->_minimumHeightConstraint;
    self->_minimumHeightConstraint = v108;

    v110.n128_u32[0] = 1148846080;
    objc_msgSend_setPriority_(self->_minimumHeightConstraint, v111, v110, v112);
    objc_msgSend_setActive_(self->_minimumHeightConstraint, v113, v114, v115, 1);
    objc_initWeak(&location, self);
    v120[0] = MEMORY[0x24BDAC760];
    v120[1] = 3221225472;
    v120[2] = sub_22D9A4468;
    v120[3] = &unk_24F97D7B8;
    objc_copyWeak(&v121, &location);
    objc_msgSend__setSlotAnyContentProvider_(self->_slotView, v116, v117, v118, v120);
    objc_destroyWeak(&v121);
    objc_destroyWeak(&location);
    objc_destroyWeak(&v124);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_sendActionsForEvents:(unint64_t)a3 withEvent:(id)a4
{
  id v6;
  const char *v7;
  __n128 v8;
  __n128 v9;
  void *v10;
  const char *v11;
  __n128 v12;
  __n128 v13;
  void *v14;
  const char *v15;
  __n128 v16;
  __n128 v17;
  objc_super v18;

  v6 = a4;
  objc_msgSend_locationUIProxy(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__authenticationMessage(v6, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_onPrimaryTouchDownEvent_(v10, v15, v16, v17, v14);

  v18.receiver = self;
  v18.super_class = (Class)CLLocationButton;
  -[CLLocationButton _sendActionsForEvents:withEvent:](&v18, sel__sendActionsForEvents_withEvent_, a3, v6);

}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (void)setIcon:(CLLocationButtonIcon)icon
{
  __n128 v3;
  __n128 v4;

  self->_icon = icon;
  objc_msgSend_markDirty(self, a2, v3, v4);
}

- (void)setLabel:(CLLocationButtonLabel)label
{
  __n128 v3;
  __n128 v4;

  self->_label = label;
  objc_msgSend_markDirty(self, a2, v3, v4);
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  __n128 v3;

  self->_cornerRadius = cornerRadius;
  objc_msgSend_markDirty(self, a2, *(__n128 *)&cornerRadius, v3);
}

- (id)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  const char *v4;
  __n128 v5;
  __n128 v6;

  objc_storeStrong((id *)&self->_backgroundColor, a3);
  objc_msgSend_markDirty(self, v4, v5, v6);
}

- (id)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  const char *v4;
  __n128 v5;
  __n128 v6;

  objc_storeStrong((id *)&self->_tintColor, a3);
  objc_msgSend_markDirty(self, v4, v5, v6);
}

- (void)setFontSize:(CGFloat)fontSize
{
  __n128 v3;

  self->_fontSize = fontSize;
  objc_msgSend_markDirty(self, a2, *(__n128 *)&fontSize, v3);
}

- (id)_computeLocationButtonTag
{
  void **p_resolvedBackgroundColor;
  const char *v4;
  __n128 v5;
  __n128 v6;
  void *v7;
  const char *v8;
  __n128 v9;
  __n128 v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  __n128 v14;
  __n128 v15;
  UIColor *v16;
  UIColor *resolvedTintColor;
  CLLocationButtonTag *v18;
  const char *v19;
  __n128 v20;
  __n128 v21;
  uint64_t v22;
  const char *v23;
  __n128 v24;
  __n128 v25;
  uint64_t v26;
  __n128 v27;
  const char *v28;
  __n128 v29;
  void *v30;
  __n128 v31;
  const char *v32;
  __n128 v33;
  void *v34;
  const char *v35;
  __n128 v36;
  __n128 v37;
  __n128 v38;
  unint64_t v39;
  const char *v40;
  __n128 v41;
  __n128 v42;
  unint64_t v43;
  __n128 v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  const char *v50;
  double v51;
  double v52;
  __n128 v53;
  __n128 v54;
  const char *v55;
  void *v56;
  __n128 v57;
  const char *v58;
  __n128 v59;
  CLLocationButtonTag *v60;
  const char *v61;
  __n128 v62;
  __n128 v63;
  uint64_t v64;
  const char *v65;
  __n128 v66;
  __n128 v67;
  uint64_t v68;
  void *v69;
  UIColor *v70;
  const char *v71;
  __n128 v72;
  __n128 v73;
  __n128 v74;
  unint64_t v75;
  const char *v76;
  __n128 v77;
  __n128 v78;
  unint64_t v79;
  __n128 v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  const char *v86;
  double v87;
  double v88;
  __n128 v89;
  __n128 v90;
  const char *v91;
  void *v92;
  const char *v93;
  __n128 v94;
  __n128 v95;
  void *v96;
  const char *v97;
  __n128 v98;
  __n128 v99;
  const char *v100;
  __n128 v101;
  __n128 v102;
  uint8_t v104[16];
  uint8_t buf[16];

  p_resolvedBackgroundColor = (void **)&self->_resolvedBackgroundColor;
  objc_storeStrong((id *)&self->_resolvedBackgroundColor, self->_backgroundColor);
  objc_storeStrong((id *)&self->_resolvedTintColor, self->_tintColor);
  objc_msgSend_traitCollection(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resolvedColorWithTraitCollection_(self->_backgroundColor, v8, v9, v10, v7);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *p_resolvedBackgroundColor;
  *p_resolvedBackgroundColor = (void *)v11;

  objc_msgSend_resolvedColorWithTraitCollection_(self->_tintColor, v13, v14, v15, v7);
  v16 = (UIColor *)objc_claimAutoreleasedReturnValue();
  resolvedTintColor = self->_resolvedTintColor;
  self->_resolvedTintColor = v16;

  NSLog(CFSTR("_computeLocationButtonTag %@ %@"), *p_resolvedBackgroundColor, self->_resolvedTintColor);
  v18 = [CLLocationButtonTag alloc];
  v22 = objc_msgSend_label(self, v19, v20, v21);
  v26 = objc_msgSend_icon(self, v23, v24, v25);
  v27.n128_u64[0] = 1.0;
  objc_msgSend_colorWithAlphaComponent_(*p_resolvedBackgroundColor, v28, v27, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31.n128_u64[0] = 1.0;
  objc_msgSend_colorWithAlphaComponent_(self->_resolvedTintColor, v32, v31, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cornerRadius(self, v35, v36, v37);
  v39 = v38.n128_u64[0];
  objc_msgSend_frame(self, v40, v38, v41);
  v43 = v42.n128_u64[0];
  v45 = v44.n128_f64[0];
  v47 = v46;
  v49 = v48;
  objc_msgSend_fontSize(self, v50, v42, v44);
  v52 = v51;
  v53.n128_u64[0] = v39;
  v54.n128_u64[0] = v43;
  v56 = (void *)objc_msgSend_initWithLabel_iconType_backgroundColor_tintColor_cornerRadius_frame_fontSize_(v18, v55, v53, v54, v22, v26, v30, v34, v45, v47, v49, v52);

  v57.n128_u32[0] = 1.0;
  if ((objc_msgSend_contrastValidForBgColorAndFgTextWithCumulativeOpacity_(v56, v58, v57, v59) & 1) == 0)
  {
    self->_colorsIllegible = 1;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_22D9A2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error: #locationButton failed due to illegible colors", buf, 2u);
    }
  }
  v60 = [CLLocationButtonTag alloc];
  v64 = objc_msgSend_label(self, v61, v62, v63);
  v68 = objc_msgSend_icon(self, v65, v66, v67);
  v69 = *p_resolvedBackgroundColor;
  v70 = self->_resolvedTintColor;
  objc_msgSend_cornerRadius(self, v71, v72, v73);
  v75 = v74.n128_u64[0];
  objc_msgSend_frame(self, v76, v74, v77);
  v79 = v78.n128_u64[0];
  v81 = v80.n128_f64[0];
  v83 = v82;
  v85 = v84;
  objc_msgSend_fontSize(self, v86, v78, v80);
  v88 = v87;
  v89.n128_u64[0] = v75;
  v90.n128_u64[0] = v79;
  v92 = (void *)objc_msgSend_initWithLabel_iconType_backgroundColor_tintColor_cornerRadius_frame_fontSize_(v60, v91, v89, v90, v64, v68, v69, v70, v81, v83, v85, v88);
  objc_msgSend_layer(self, v93, v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_opacity(v96, v97, v98, v99);
  LOBYTE(v60) = objc_msgSend_contrastValidForBgColorAndFgTextWithCumulativeOpacity_(v92, v100, v101, v102);

  if ((v60 & 1) == 0)
  {
    self->_alphaInsufficient = 1;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v104 = 0;
      _os_log_error_impl(&dword_22D9A2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error: #locationButton failed due to Insufficient Alpha", v104, 2u);
    }
  }

  return v92;
}

- (void)_yieldSlotViewContentForLayerContextID:(unint64_t)a3 slotStyle:(id)a4 withYieldBlock:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  const char *v10;
  __n128 v11;
  __n128 v12;
  void *v13;
  NSString *v14;
  CLLocationButtonDrawing *v15;
  const char *v16;
  __n128 v17;
  __n128 v18;
  void *v19;
  const char *v20;
  __n128 v21;
  __n128 v22;
  void *v23;
  const char *v24;
  __n128 v25;
  __n128 v26;
  const char *v27;
  __n128 v28;
  __n128 v29;
  __n128 v30;
  CGFloat v31;
  const char *v32;
  __n128 v33;
  __n128 v34;
  __n128 v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  __n128 v40;
  __n128 v41;
  uint64_t v42;
  const char *v43;
  __n128 v44;
  __n128 v45;
  void *v46;
  const char *v47;
  __n128 v48;
  __n128 v49;
  NSObject *v50;
  _QWORD v51[5];
  id v52;
  id v53;
  NSString *v54;
  void (**v55)(id, void *);
  unint64_t v56;
  uint8_t buf[16];
  CGRect v58;

  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  objc_msgSend__computeLocationButtonTag(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = self->_sandboxExtension;
  v15 = [CLLocationButtonDrawing alloc];
  v19 = (void *)objc_msgSend_initWithStyle_tag_remote_(v15, v16, v17, v18, v8, v13, 0);
  objc_msgSend_localizedTitle(v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccessibilityLabel_(self, v24, v25, v26, v23);

  objc_msgSend_neededSize(v19, v27, v28, v29);
  v31 = v30.n128_f64[0] + 1.0;
  objc_msgSend_neededSize(v19, v32, v30, v33);
  v35.n128_f64[0] = v34.n128_f64[0] + 1.0;
  self->_intrinsicSize.width = v31;
  self->_intrinsicSize.height = v34.n128_f64[0] + 1.0;
  v36 = (void *)MEMORY[0x24BEBEC48];
  v38 = objc_msgSend_displayScale(v8, v37, v35, v34);
  v42 = objc_msgSend_displayRange(v8, v39, v40, v41);
  objc_msgSend_contentWithDrawing_scale_range_(v36, v43, v44, v45, v19, v38, v42);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v46);
  objc_msgSend_frame(v13, v47, v48, v49);
  if (CGRectIsEmpty(v58))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_22D9A2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "#locationButton skip remote-imaging. tag has zero-size frame", buf, 2u);
    }
  }
  else
  {
    dispatch_get_global_queue(33, 0);
    v50 = objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = sub_22D9A4BA4;
    v51[3] = &unk_24F97D830;
    v51[4] = self;
    v52 = v8;
    v56 = a3;
    v53 = v13;
    v54 = v14;
    v55 = v9;
    dispatch_async(v50, v51);

  }
}

- (void)layoutSubviews
{
  __n128 v2;
  __n128 v3;
  __n128 v5;
  const char *v6;
  __n128 v7;
  __n128 v8;
  const char *v9;
  __n128 v10;
  objc_super v11;

  objc_msgSend__updateContent(self->_slotView, a2, v2, v3);
  v5.n128_u64[0] = *(_QWORD *)&self->_intrinsicSize.width;
  objc_msgSend_setConstant_(self->_minimumWidthConstraint, v6, v5, v7);
  v8.n128_u64[0] = *(_QWORD *)&self->_intrinsicSize.height;
  objc_msgSend_setConstant_(self->_minimumHeightConstraint, v9, v8, v10);
  v11.receiver = self;
  v11.super_class = (Class)CLLocationButton;
  -[CLLocationButton layoutSubviews](&v11, sel_layoutSubviews);
}

- (CGSize)intrinsicContentSize
{
  __n128 v2;
  __n128 v3;
  CGSize *p_intrinsicSize;
  double height;
  CGSize result;

  p_intrinsicSize = &self->_intrinsicSize;
  v2.n128_u64[0] = *(_QWORD *)&self->_intrinsicSize.width;
  if (v2.n128_f64[0] == 0.0)
  {
    v3.n128_u64[0] = *(_QWORD *)&self->_intrinsicSize.height;
    if (v3.n128_f64[0] == 0.0)
    {
      objc_msgSend__updateContent(self->_slotView, a2, v2, v3);
      v2.n128_u64[0] = *(_QWORD *)&p_intrinsicSize->width;
    }
  }
  height = p_intrinsicSize->height;
  result.width = v2.n128_f64[0];
  result.height = height;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  MEMORY[0x24BEDD108](self, sel_intrinsicContentSize, (__n128)a3, *(__n128 *)&a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (unsigned)_secureName
{
  __n128 v2;
  __n128 v3;
  uint64_t v4;
  const char *v5;
  __n128 v6;
  __n128 v7;

  v4 = objc_msgSend_label(self, a2, v2, v3);
  return objc_msgSend_secureNameForLabel_(CLLocationButtonTag, v5, v6, v7, v4);
}

- (CLLocationButtonIcon)icon
{
  return self->_icon;
}

- (CLLocationButtonLabel)label
{
  return self->_label;
}

- (CGFloat)fontSize
{
  return self->_fontSize;
}

- (CGFloat)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)colorsIllegible
{
  return self->_colorsIllegible;
}

- (BOOL)alphaInsufficient
{
  return self->_alphaInsufficient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_minimumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_sandboxExtension, 0);
  objc_storeStrong((id *)&self->_resolvedTintColor, 0);
  objc_storeStrong((id *)&self->_resolvedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_slotView, 0);
}

@end
