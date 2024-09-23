@implementation CLSNotificationBannerViewController

- (BOOL)windowPointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  y = a3.y;
  x = a3.x;
  v30 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend_view(self, a2, (uint64_t)a4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_subviews(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v25, v29, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_layer(v14, v15, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_presentationLayer(v17, v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_hitTest_(v20, v21, v22, x, y);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            LOBYTE(v11) = 1;
            goto LABEL_12;
          }
        }
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v15, (uint64_t)&v25, v29, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_12:

  return v11;
}

- (void)handleWindowPan:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  double v10;
  double v11;
  const char *v12;
  id v13;

  v13 = a3;
  if (objc_msgSend_bannerVisible(self, v4, v5))
  {
    objc_msgSend_view(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_translationInView_(v13, v9, (uint64_t)v8);
    v11 = v10;

    if (v11 < 0.0)
      objc_msgSend_hideBannerQuickly_(self, v12, 1);
  }

}

- (void)addBannerView:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  id v24;

  v24 = a3;
  objc_msgSend_bannerView(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_setBannerYPositionConstraint_(self, v7, 0);
    objc_msgSend_setBannerWidthConstraint_(self, v8, 0);
    objc_msgSend_bannerView(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeFromSuperview(v11, v12, v13);

    objc_msgSend_setBannerView_(self, v14, 0);
  }
  objc_msgSend_setBannerView_(self, v7, (uint64_t)v24);
  objc_msgSend_view(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bannerView(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addSubview_(v17, v21, (uint64_t)v20);

  objc_msgSend_addConstraintsForBannerView(self, v22, v23);
}

- (void)showCurrentBanner
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  char v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  id v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  id v27;
  const char *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  _QWORD v32[5];
  id v33;

  objc_msgSend_bannerView(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_subviews(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_containsObject_(v10, v11, (uint64_t)v4);

  if ((v12 & 1) == 0)
  {
    objc_msgSend_view(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addSubview_(v15, v16, (uint64_t)v4);

  }
  objc_msgSend_setBannerAnimating_(self, v13, 1);
  objc_msgSend_setBannerVisible_(self, v17, 1);
  v18 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_21EC00448;
  v32[3] = &unk_24E3571C8;
  v32[4] = self;
  v33 = v4;
  v19 = v4;
  v20 = (void *)MEMORY[0x2207B9158](v32);
  objc_msgSend_view(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutIfNeeded(v23, v24, v25);

  v26 = (void *)MEMORY[0x24BDF6F90];
  v30 = v20;
  v31[0] = v18;
  v31[1] = 3221225472;
  v31[2] = sub_21EC00518;
  v31[3] = &unk_24E357140;
  v31[4] = self;
  v29[0] = v18;
  v29[1] = 3221225472;
  v29[2] = sub_21EC0054C;
  v29[3] = &unk_24E3571F0;
  v27 = v20;
  objc_msgSend_animateWithDuration_delay_options_animations_completion_(v26, v28, 38, v31, v29, 0.6, 0.0);

}

- (void)hideBannerQuickly:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  double v17;
  id v18;
  id v19;
  const char *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v3 = a3;
  objc_msgSend_bannerView(self, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBannerAnimating_(self, v6, 1);
  objc_msgSend_setBannerVisible_(self, v7, 0);
  v8 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = sub_21EC006C4;
  v25[3] = &unk_24E3571C8;
  v25[4] = self;
  v9 = v5;
  v26 = v9;
  v10 = (void *)MEMORY[0x2207B9158](v25);
  objc_msgSend_view(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutIfNeeded(v13, v14, v15);

  v16 = (void *)MEMORY[0x24BDF6F90];
  if (v3)
    v17 = 0.1;
  else
    v17 = 0.3;
  v22 = v10;
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = sub_21EC007A4;
  v23[3] = &unk_24E3571C8;
  v23[4] = self;
  v24 = v9;
  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = sub_21EC00820;
  v21[3] = &unk_24E3571F0;
  v18 = v10;
  v19 = v9;
  objc_msgSend_animateWithDuration_delay_options_animations_completion_(v16, v20, 38, v23, v21, v17, 0.0);

}

- (unint64_t)supportedInterfaceOrientations
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  unint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;

  objc_msgSend_sharedApplication(MEMORY[0x24BDF6800], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_21EBFE7C0(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_window(v10, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v7 == (void *)v13)
  {

  }
  else
  {
    v16 = (void *)v13;
    objc_msgSend_rootViewController(v7, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend_rootViewController(v7, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_supportedInterfaceOrientations(v20, v21, v22);

      if (v23)
        goto LABEL_11;
    }
  }
  v23 = objc_msgSend_supportedInterfaceOrientationsForWindow_(v4, v18, (uint64_t)v7);
  if (!v23)
  {
    objc_msgSend_traitCollection(self, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_userInterfaceIdiom(v26, v27, v28))
      v23 = 30;
    else
      v23 = 26;

  }
LABEL_11:

  return v23;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  _QWORD v15[7];
  objc_super v16;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CLSNotificationBannerViewController;
  -[CLSNotificationBannerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v16, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_msgSend_bannerView(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_superview(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = sub_21EC00A0C;
    v15[3] = &unk_24E357238;
    v15[4] = self;
    *(double *)&v15[5] = width;
    *(double *)&v15[6] = height;
    objc_msgSend_animateAlongsideTransition_completion_(v7, v14, (uint64_t)v15, 0);
  }

}

- (double)bannerWidthForViewSize:(CGSize)a3
{
  uint64_t v3;
  double width;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  double v10;

  width = a3.width;
  if (qword_25547D378 != -1)
    dispatch_once(&qword_25547D378, &unk_24E357258);
  if (byte_25547D328)
  {
    objc_msgSend_bannerView(self, a2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_preferredWidthPad(v6, v7, v8);
    v10 = v9;

    if (width >= v10)
      return v10;
  }
  return width;
}

- (void)addConstraintsForBannerView
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  void *v73;
  double v74;
  void *v75;
  const char *v76;
  void *v77;
  const char *v78;
  _QWORD v79[2];

  v79[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_view(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v4, v5, v6);
  v8 = v7;
  v10 = v9;

  objc_msgSend_bannerView(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v13, v14, 0);

  if (qword_25547D378 != -1)
    dispatch_once(&qword_25547D378, &unk_24E357258);
  if (byte_25547D328)
  {
    objc_msgSend_bannerWidthForViewSize_(self, v15, v16, v8, v10);
    v18 = v17;
    v19 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend_bannerView(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v19, v23, (uint64_t)v22, 7, 0, 0, 0, 1.0, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBannerWidthConstraint_(self, v25, (uint64_t)v24);

    objc_msgSend_bannerView(self, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bannerWidthConstraint(self, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addConstraint_(v28, v32, (uint64_t)v31);
  }
  else
  {
    objc_msgSend_view(self, v15, v16);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend_bannerView(self, v34, v35);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_view(self, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v33, v39, (uint64_t)v31, 7, 0, v38, 7, 1.0, 0.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addConstraint_(v28, v41, (uint64_t)v40);

  }
  objc_msgSend_view(self, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend_bannerView(self, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(v45, v52, (uint64_t)v48, 9, 0, v51, 9, 1.0, 0.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addConstraint_(v44, v54, (uint64_t)v53);

  objc_msgSend_bannerView(self, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v57, v58, v59, 0.0);

  v60 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend_bannerView(self, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topAnchor(v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topAnchor(v69, v70, v71);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_25547D378 != -1)
    dispatch_once(&qword_25547D378, &unk_24E357258);
  v74 = 12.0;
  if (!byte_25547D328)
    v74 = 15.0;
  objc_msgSend_constraintEqualToAnchor_constant_(v66, v72, (uint64_t)v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v75;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v76, (uint64_t)v79, 1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activateConstraints_(v60, v78, (uint64_t)v77);

}

- (CGPoint)_hiddenBannerPosition:(CGSize)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat MidX;
  double MinY;
  float v17;
  double v18;
  double v19;
  CGPoint result;
  CGRect v21;
  CGRect v22;

  objc_msgSend_view(self, a2, v3, a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v4, v5, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v21.origin.x = v8;
  v21.origin.y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  MidX = CGRectGetMidX(v21);
  v22.origin.x = v8;
  v22.origin.y = v10;
  v22.size.width = v12;
  v22.size.height = v14;
  MinY = CGRectGetMinY(v22);
  if (qword_25547D378 != -1)
    dispatch_once(&qword_25547D378, &unk_24E357258);
  v17 = 33.0;
  if (!byte_25547D328)
    v17 = 32.0;
  v18 = MinY - floorf(v17);
  v19 = MidX;
  result.y = v18;
  result.x = v19;
  return result;
}

- (CGPoint)_visibleBannerCenterPosition:(CGSize)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat MidX;
  double MinY;
  float v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGPoint result;
  CGRect v35;
  CGRect v36;

  objc_msgSend_view(self, a2, v3, a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v4, v5, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend_windowScene((void *)qword_25547D330, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_statusBarManager(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_statusBarFrame(v20, v21, v22);
  v24 = v23;
  v26 = v25;

  v35.origin.x = v8;
  v35.origin.y = v10;
  v35.size.width = v12;
  v35.size.height = v14;
  MidX = CGRectGetMidX(v35);
  v36.origin.x = v8;
  v36.origin.y = v10;
  v36.size.width = v12;
  v36.size.height = v14;
  MinY = CGRectGetMinY(v36);
  if (qword_25547D378 != -1)
    dispatch_once(&qword_25547D378, &unk_24E357258);
  v29 = 33.0;
  if (!byte_25547D328)
    v29 = 32.0;
  v30 = floorf(v29);
  if (byte_25547D328)
    v30 = v30 + 16.0;
  if (v24 >= v26)
    v31 = v26;
  else
    v31 = v24;
  v32 = v31 + MinY + v30;
  v33 = MidX;
  result.y = v32;
  result.x = v33;
  return result;
}

- (CLSNotificationBannerView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
  objc_storeStrong((id *)&self->_bannerView, a3);
}

- (BOOL)bannerVisible
{
  return self->_bannerVisible;
}

- (void)setBannerVisible:(BOOL)a3
{
  self->_bannerVisible = a3;
}

- (BOOL)bannerAnimating
{
  return self->_bannerAnimating;
}

- (void)setBannerAnimating:(BOOL)a3
{
  self->_bannerAnimating = a3;
}

- (NSLayoutConstraint)bannerYPositionConstraint
{
  return self->_bannerYPositionConstraint;
}

- (void)setBannerYPositionConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bannerYPositionConstraint, a3);
}

- (NSLayoutConstraint)bannerWidthConstraint
{
  return self->_bannerWidthConstraint;
}

- (void)setBannerWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bannerWidthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_bannerYPositionConstraint, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
}

@end
