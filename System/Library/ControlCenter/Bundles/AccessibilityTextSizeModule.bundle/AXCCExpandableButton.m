@implementation AXCCExpandableButton

- (id)initForControlCenter
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = objc_msgSend_initWithFrame_(self, a2, v2, v3, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v7)
  {
    objc_msgSend_controlCenterDarkMaterial(MEMORY[0x24BE19B38], v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBackgroundView_((void *)v7, v9, (uint64_t)v8, v10);

    objc_msgSend_controlCenterApplyPrimaryContentShadow(*(void **)(v7 + 552), v11, v12, v13);
    objc_msgSend_controlCenterApplyPrimaryContentShadow(*(void **)(v7 + 560), v14, v15, v16);
    objc_msgSend_controlCenterApplyPrimaryContentShadow(*(void **)(v7 + 568), v17, v18, v19);
    *(_BYTE *)(v7 + 469) = 1;
  }
  return (id)v7;
}

- (AXCCExpandableButton)initWithFrame:(CGRect)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  id v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  id v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  double v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  id v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  double v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  id v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  double v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  id v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  objc_super v145;

  v145.receiver = self;
  v145.super_class = (Class)AXCCExpandableButton;
  v6 = -[AXCCExpandableButton initWithFrame:](&v145, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v6)
  {
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v6 + 64);
    *((_QWORD *)v6 + 64) = v7;

    *((_QWORD *)v6 + 60) = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend_setContentVerticalAlignment_(v6, v9, 0, v10);
    v11 = objc_alloc(MEMORY[0x24BEBDB00]);
    v12 = *MEMORY[0x24BDBF090];
    v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v19 = objc_msgSend_initWithFrame_(v11, v16, v17, v18, *MEMORY[0x24BDBF090], v13, v14, v15);
    v20 = (void *)*((_QWORD *)v6 + 65);
    *((_QWORD *)v6 + 65) = v19;

    objc_msgSend_systemGroupedBackgroundColor(MEMORY[0x24BEBD4B8], v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBackgroundColor_(*((void **)v6 + 65), v25, (uint64_t)v24, v26);

    objc_msgSend_addSubview_(v6, v27, *((_QWORD *)v6 + 65), v28);
    v29 = objc_opt_new();
    v30 = (void *)*((_QWORD *)v6 + 68);
    *((_QWORD *)v6 + 68) = v29;

    objc_msgSend_setUserInteractionEnabled_(*((void **)v6 + 68), v31, 0, v32);
    objc_msgSend_setClipsToBounds_(*((void **)v6 + 68), v33, 1, v34);
    objc_msgSend_addSubview_(v6, v35, *((_QWORD *)v6 + 68), v36);
    v37 = objc_alloc(MEMORY[0x24BEBDB00]);
    v41 = objc_msgSend_initWithFrame_(v37, v38, v39, v40, v12, v13, v14, v15);
    v42 = (void *)*((_QWORD *)v6 + 67);
    *((_QWORD *)v6 + 67) = v41;

    objc_msgSend_addSubview_(*((void **)v6 + 68), v43, *((_QWORD *)v6 + 67), v44);
    v45 = objc_alloc(MEMORY[0x24BEBDB00]);
    v49 = objc_msgSend_initWithFrame_(v45, v46, v47, v48, v12, v13, v14, v15);
    v50 = (void *)*((_QWORD *)v6 + 66);
    *((_QWORD *)v6 + 66) = v49;

    objc_msgSend_whiteColor(MEMORY[0x24BEBD4B8], v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBackgroundColor_(*((void **)v6 + 66), v55, (uint64_t)v54, v56);

    objc_msgSend__setDrawsAsBackdropOverlayWithBlendMode_(*((void **)v6 + 66), v57, 2, v58);
    objc_msgSend_addSubview_(*((void **)v6 + 67), v59, *((_QWORD *)v6 + 66), v60);
    v61 = objc_alloc(MEMORY[0x24BEBD708]);
    v65 = objc_msgSend_initWithFrame_(v61, v62, v63, v64, v12, v13, v14, v15);
    v66 = (void *)*((_QWORD *)v6 + 69);
    *((_QWORD *)v6 + 69) = v65;

    objc_msgSend_setNumberOfLines_(*((void **)v6 + 69), v67, 2, v68);
    objc_msgSend_setTextAlignment_(*((void **)v6 + 69), v69, 1, v70);
    LODWORD(v71) = 1051931443;
    objc_msgSend__setHyphenationFactor_(*((void **)v6 + 69), v72, v73, v74, v71);
    objc_msgSend_labelColor(MEMORY[0x24BEBD4B8], v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTextColor_(*((void **)v6 + 69), v79, (uint64_t)v78, v80);

    objc_msgSend_addSubview_(v6, v81, *((_QWORD *)v6 + 69), v82);
    v83 = objc_alloc(MEMORY[0x24BEBD708]);
    v87 = objc_msgSend_initWithFrame_(v83, v84, v85, v86, v12, v13, v14, v15);
    v88 = (void *)*((_QWORD *)v6 + 70);
    *((_QWORD *)v6 + 70) = v87;

    objc_msgSend_setNumberOfLines_(*((void **)v6 + 70), v89, 2, v90);
    objc_msgSend_setTextAlignment_(*((void **)v6 + 70), v91, 1, v92);
    LODWORD(v93) = 1051931443;
    objc_msgSend__setHyphenationFactor_(*((void **)v6 + 70), v94, v95, v96, v93);
    objc_msgSend_labelColor(MEMORY[0x24BEBD4B8], v97, v98, v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTextColor_(*((void **)v6 + 70), v101, (uint64_t)v100, v102);

    objc_msgSend_addSubview_(v6, v103, *((_QWORD *)v6 + 70), v104);
    v105 = objc_alloc(MEMORY[0x24BEBD708]);
    v109 = objc_msgSend_initWithFrame_(v105, v106, v107, v108, v12, v13, v14, v15);
    v110 = (void *)*((_QWORD *)v6 + 71);
    *((_QWORD *)v6 + 71) = v109;

    objc_msgSend_setNumberOfLines_(*((void **)v6 + 71), v111, 2, v112);
    objc_msgSend_setTextAlignment_(*((void **)v6 + 71), v113, 1, v114);
    LODWORD(v115) = 1051931443;
    objc_msgSend__setHyphenationFactor_(*((void **)v6 + 71), v116, v117, v118, v115);
    objc_msgSend_setAlpha_(*((void **)v6 + 71), v119, v120, v121, 0.0);
    objc_msgSend_labelColor(MEMORY[0x24BEBD4B8], v122, v123, v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTextColor_(*((void **)v6 + 71), v126, (uint64_t)v125, v127);

    objc_msgSend_addSubview_(v6, v128, *((_QWORD *)v6 + 71), v129);
    v130 = objc_alloc(MEMORY[0x24BEBD828]);
    v133 = (void *)objc_msgSend_initWithDelegate_(v130, v131, (uint64_t)v6, v132);
    objc_msgSend_addInteraction_(v6, v134, (uint64_t)v133, v135);
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v136, v137, v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v139, v140, (uint64_t)v6, (uint64_t)sel_updateContentSizeCategory, *MEMORY[0x24BEBE088], 0);

    objc_msgSend_updateContentSizeCategory(v6, v141, v142, v143);
  }
  return (AXCCExpandableButton *)v6;
}

- (void)layoutSubviews
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  int64_t axis;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSMutableArray *buttons;
  CGFloat Height;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSMutableArray *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  double v67;
  CGFloat x;
  double v69;
  CGFloat y;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  NSMutableArray *v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t i;
  void *v84;
  const char *v85;
  uint64_t v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  double v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  double v112;
  BOOL v113;
  double v114;
  UIView *backgroundView;
  double v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  CGFloat Width;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _QWORD v134[12];
  _QWORD v135[12];
  objc_super v136;
  _BYTE v137[128];
  uint64_t v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;

  v138 = *MEMORY[0x24BDAC8D0];
  v136.receiver = self;
  v136.super_class = (Class)AXCCExpandableButton;
  -[AXCCExpandableButton layoutSubviews](&v136, sel_layoutSubviews);
  objc_msgSend_bounds(self, v3, v4, v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend_traitCollection(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_displayScale(v17, v18, v19, v20);

  axis = self->_axis;
  if (axis)
  {
    if (axis == 1)
    {
      v139.origin.x = v7;
      v139.origin.y = v9;
      v139.size.width = v11;
      v139.size.height = v13;
      Width = CGRectGetWidth(v139);
      v140.origin.x = v7;
      v140.origin.y = v9;
      v140.size.width = v11;
      v140.size.height = v13;
      v25 = 0;
      CGRectGetHeight(v140);
      v141.origin.x = v7;
      v141.origin.y = v9;
      v141.size.width = v11;
      v141.size.height = v13;
      CGRectGetHeight(v141);
      UIFloorToScale();
      v27 = v26;
      if ((unint64_t)objc_msgSend_count(self->_buttons, v28, v29, v30) >= 2)
      {
        objc_msgSend_count(self->_buttons, v31, v32, v33);
        objc_msgSend_count(self->_buttons, v34, v35, v36);
        UIFloorToScale();
        v25 = v37;
      }
      buttons = self->_buttons;
      v134[0] = MEMORY[0x24BDAC760];
      v134[1] = 3221225472;
      v134[2] = sub_230F86070;
      v134[3] = &unk_24FFC4460;
      v134[4] = self;
      *(CGFloat *)&v134[5] = v7;
      *(CGFloat *)&v134[6] = v9;
      *(CGFloat *)&v134[7] = v11;
      *(CGFloat *)&v134[8] = v13;
      v134[9] = v27;
      v134[10] = v25;
      *(CGFloat *)&v134[11] = Width;
      objc_msgSend_enumerateObjectsUsingBlock_(buttons, v31, (uint64_t)v134, v33);
    }
  }
  else
  {
    v142.origin.x = v7;
    v142.origin.y = v9;
    v142.size.width = v11;
    v142.size.height = v13;
    Height = CGRectGetHeight(v142);
    v143.origin.x = v7;
    v143.origin.y = v9;
    v143.size.width = v11;
    v143.size.height = v13;
    CGRectGetWidth(v143);
    v144.origin.x = v7;
    v144.origin.y = v9;
    v144.size.width = v11;
    v144.size.height = v13;
    CGRectGetWidth(v144);
    UIFloorToScale();
    v41 = v40;
    objc_msgSend_count(self->_options, v42, v43, v44);
    UIFloorToScale();
    v45 = self->_buttons;
    v135[0] = MEMORY[0x24BDAC760];
    v135[1] = 3221225472;
    v135[2] = sub_230F8602C;
    v135[3] = &unk_24FFC4460;
    v135[4] = self;
    *(CGFloat *)&v135[5] = v7;
    *(CGFloat *)&v135[6] = v9;
    *(CGFloat *)&v135[7] = v11;
    *(CGFloat *)&v135[8] = v13;
    v135[9] = v41;
    v135[10] = v46;
    *(CGFloat *)&v135[11] = Height;
    objc_msgSend_enumerateObjectsUsingBlock_(v45, v47, (uint64_t)v135, v48);
  }
  objc_msgSend_firstObject(self->_buttons, v21, v22, v23);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageFrame(v49, v50, v51, v52);
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v60 = v59;
  objc_msgSend_firstObject(self->_buttons, v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convertRect_fromView_(self, v65, (uint64_t)v64, v66, v54, v56, v58, v60);
  x = v67;
  y = v69;
  v72 = v71;
  v74 = v73;

  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  v75 = self->_buttons;
  v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v76, (uint64_t)&v130, (uint64_t)v137, 16);
  if (v77)
  {
    v81 = v77;
    v82 = *(_QWORD *)v131;
    do
    {
      for (i = 0; i != v81; ++i)
      {
        if (*(_QWORD *)v131 != v82)
          objc_enumerationMutation(v75);
        v84 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * i);
        objc_msgSend_imageFrame(v84, v78, v79, v80);
        objc_msgSend_convertRect_fromView_(self, v85, (uint64_t)v84, v86);
        v149.origin.x = v87;
        v149.origin.y = v88;
        v149.size.width = v89;
        v149.size.height = v90;
        v145.origin.x = x;
        v145.origin.y = y;
        v145.size.width = v72;
        v145.size.height = v74;
        v146 = CGRectUnion(v145, v149);
        x = v146.origin.x;
        y = v146.origin.y;
        v72 = v146.size.width;
        v74 = v146.size.height;
      }
      v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v78, (uint64_t)&v130, (uint64_t)v137, 16);
    }
    while (v81);
  }

  objc_msgSend_bounds(self, v91, v92, v93);
  UIRectCenteredXInRect();
  v95 = v94;
  v97 = v96;
  v99 = v98;
  v101 = v100;
  objc_msgSend_setFrame_(self->_backgroundView, v102, v103, v104);
  objc_msgSend_setFrame_(self->_clippingView, v105, v106, v107, v95, v97, v99, v101);
  v147.origin.x = v95;
  v147.origin.y = v97;
  v147.size.width = v99;
  v147.size.height = v101;
  v108 = CGRectGetWidth(v147);
  v148.origin.x = v95;
  v148.origin.y = v97;
  v148.size.width = v99;
  v148.size.height = v101;
  v112 = CGRectGetHeight(v148);
  v113 = v108 == v112;
  if (v108 < v112)
    v112 = v108;
  v114 = v112 * 0.5;
  backgroundView = self->_backgroundView;
  v116 = v112 * 0.5;
  if (v113)
  {
    objc_msgSend__setCornerRadius_(backgroundView, v109, v110, v111, v116);
    objc_msgSend__setCornerRadius_(self->_clippingView, v117, v118, v119, v114);
  }
  else
  {
    objc_msgSend__setContinuousCornerRadius_(backgroundView, v109, v110, v111, v116);
    objc_msgSend__setContinuousCornerRadius_(self->_clippingView, v120, v121, v122, v114);
  }
  objc_msgSend__layoutSelectionView(self, v123, v124, v125);
  objc_msgSend__layoutLabels(self, v126, v127, v128);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3;
  uint64_t v4;
  double height;
  CGFloat width;
  double v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (self->_axis && self->_expanded)
  {
    v8 = self->_maximumExpandedSize.height;
    if (v8 <= 0.0)
    {
      v9 = self->_buttonImageSize.height;
      v8 = v9 * (double)(unint64_t)objc_msgSend_count(self->_buttons, a2, v3, v4);
    }
  }
  else
  {
    v10 = (void *)objc_opt_class();
    objc_msgSend_collapsedHeightWithImageHeight_maximumHeight_(v10, v11, v12, v13, self->_buttonImageSize.height, height);
    v8 = v14 + 0.0;
  }
  if (v8 >= height)
    v15 = height;
  else
    v15 = v8;
  v16 = width;
  result.height = v15;
  result.width = v16;
  return result;
}

+ (double)collapsedHeightWithImageHeight:(double)a3 maximumHeight:(double)a4
{
  uint64_t v4;
  uint64_t v5;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;

  v7 = a3 + 8.0;
  objc_msgSend_mainScreen(MEMORY[0x24BEBD8F8], a2, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scale(v8, v9, v10, v11);

  v12 = *MEMORY[0x24BEBE098];
  objc_msgSend__preferredFontForTextStyle_maximumContentSizeCategory_(MEMORY[0x24BEBB520], v13, *MEMORY[0x24BEBE200], *MEMORY[0x24BEBE098]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lineHeight(v14, v15, v16, v17);
  UICeilToScale();
  v19 = v7 + v18;
  objc_msgSend__preferredFontForTextStyle_maximumContentSizeCategory_(MEMORY[0x24BEBB520], v20, *MEMORY[0x24BEBE1E0], v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lineHeight(v21, v22, v23, v24);
  UICeilToScale();
  v26 = v19 + v25;
  if (v26 < a4)
    a4 = v26;

  return a4;
}

- (void)setBackgroundView:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  UIView *backgroundView;
  const char *v9;
  char *v10;

  v5 = (const char *)a3;
  backgroundView = self->_backgroundView;
  v10 = (char *)v5;
  if (backgroundView != (UIView *)v5)
  {
    objc_msgSend_removeFromSuperview(backgroundView, v5, v6, v7);
    objc_storeStrong((id *)&self->_backgroundView, a3);
    objc_msgSend_insertSubview_atIndex_(self, v9, (uint64_t)v10, 0);
  }

}

- (void)setStylingProvider:(id)a3
{
  const char *v5;
  uint64_t v6;
  AXCCVisualStylingProvider *v7;
  AXCCVisualStylingProvider *stylingProvider;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = (AXCCVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v7)
  {
    objc_msgSend_removeObserver_(stylingProvider, v5, (uint64_t)self, v6);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    objc_msgSend_addObserver_(self->_stylingProvider, v9, (uint64_t)self, v10);
    objc_msgSend_updateVisualStyling(self, v11, v12, v13);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = self->_buttons;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v22, (uint64_t)v26, 16);
    if (v16)
    {
      v19 = v16;
      v20 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v14);
          objc_msgSend_setStylingProvider_(*(void **)(*((_QWORD *)&v22 + 1) + 8 * i), v17, (uint64_t)v7, v18, (_QWORD)v22);
        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v22, (uint64_t)v26, 16);
      }
      while (v19);
    }

  }
}

- (void)setTitle:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  objc_msgSend_setText_(self->_titleLabel, v6, (uint64_t)v5, v7);

  objc_msgSend_setNeedsLayout(self, v8, v9, v10);
}

- (void)setOptions:(id)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t i;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  AXCCRoundButton *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  _QWORD v60[5];

  v59 = a3;
  objc_storeStrong((id *)&self->_options, a3);
  self->_toggleEnabled = 0;
  objc_msgSend_setSelectedOptionIndex_(self, v5, 0x7FFFFFFFFFFFFFFFLL, v6);
  for (i = objc_msgSend_count(self->_buttons, v7, v8, v9); i > objc_msgSend_count(v59, v10, v11, v12, v59); --i)
  {
    objc_msgSend_lastObject(self->_buttons, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeLastObject(self->_buttons, v18, v19, v20);
    objc_msgSend_removeFromSuperview(v17, v21, v22, v23);

  }
  v24 = objc_msgSend_count(self->_buttons, v14, v15, v16);
  if (v24 < objc_msgSend_count(v59, v25, v26, v27))
  {
    v30 = *MEMORY[0x24BDBF090];
    v31 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v32 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v33 = *(double *)(MEMORY[0x24BDBF090] + 24);
    do
    {
      v34 = [AXCCRoundButton alloc];
      v38 = (void *)objc_msgSend_initWithFrame_(v34, v35, v36, v37, v30, v31, v32, v33);
      objc_msgSend_addTarget_action_forControlEvents_(v38, v39, (uint64_t)self, (uint64_t)sel_didTapButton_, 64);
      objc_msgSend_addObject_(self->_buttons, v40, (uint64_t)v38, v41);
      objc_msgSend_addSubview_(self, v42, (uint64_t)v38, v43);

      ++v24;
    }
    while (v24 < objc_msgSend_count(v59, v44, v45, v46));
  }
  v60[0] = MEMORY[0x24BDAC760];
  v60[1] = 3221225472;
  v60[2] = sub_230F86660;
  v60[3] = &unk_24FFC4488;
  v60[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(v59, v28, (uint64_t)v60, v29);
  objc_msgSend__updateButtonsVisiblity(self, v47, v48, v49);
  objc_msgSend_updateVisualStyling(self, v50, v51, v52);
  objc_msgSend__updateSelectionVisiblity(self, v53, v54, v55);
  objc_msgSend_setNeedsLayout(self, v56, v57, v58);

}

- (AXCCExpandableButtonOption)selectedOption
{
  uint64_t v2;
  int64_t selectedOptionIndex;

  selectedOptionIndex = self->_selectedOptionIndex;
  if (selectedOptionIndex == 0x7FFFFFFFFFFFFFFFLL)
    return (AXCCExpandableButtonOption *)0;
  objc_msgSend_objectAtIndexedSubscript_(self->_options, a2, selectedOptionIndex, v2);
  return (AXCCExpandableButtonOption *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSelectedOptionIndex:(int64_t)a3
{
  uint64_t v3;
  BOOL v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  _QWORD v32[5];
  _QWORD v33[5];
  BOOL v34;

  v6 = self->_selectedOptionIndex == 0x7FFFFFFFFFFFFFFFLL;
  self->_selectedOptionIndex = a3;
  objc_msgSend_selectedOption(self, a2, a3, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_title(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setText_(self->_subtitleLabel, v12, (uint64_t)v11, v13);

  v14 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = sub_230F8691C;
  v33[3] = &unk_24FFC44B0;
  v33[4] = self;
  v34 = v6;
  objc_msgSend_performWithoutAnimation_(MEMORY[0x24BEBDB00], v15, (uint64_t)v33, v16);
  objc_msgSend__layoutSelectionView(self, v17, v18, v19);
  objc_msgSend__updateSelectionVisiblity(self, v20, v21, v22);
  objc_msgSend__updateButtonsVisiblity(self, v23, v24, v25);
  objc_msgSend_buttons(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v14;
  v32[1] = 3221225472;
  v32[2] = sub_230F86958;
  v32[3] = &unk_24FFC44D0;
  v32[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v29, v30, (uint64_t)v32, v31);
  UIAccessibilityPostNotification(*MEMORY[0x24BEBDE88], 0);

}

- (void)setAxis:(int64_t)a3
{
  NSMutableArray *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  self->_axis = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = self->_buttons;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v6)
  {
    v10 = v6;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v4);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
        v14 = objc_msgSend__buttonLayoutAxis(self, v7, v8, v9, (_QWORD)v20);
        objc_msgSend_setAxis_(v13, v15, v14, v16);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v10);
  }

  objc_msgSend_setNeedsLayout(self, v17, v18, v19);
}

- (void)setContentVerticalAlignment:(int64_t)a3
{
  NSMutableArray *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)AXCCExpandableButton;
  -[AXCCExpandableButton setContentVerticalAlignment:](&v21, sel_setContentVerticalAlignment_, a3);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_buttons;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v17, (uint64_t)v22, 16);
  if (v6)
  {
    v10 = v6;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v4);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
        v14 = objc_msgSend_contentVerticalAlignment(self, v7, v8, v9, (_QWORD)v17);
        objc_msgSend_setContentVerticalAlignment_(v13, v15, v14, v16);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v17, (uint64_t)v22, 16);
    }
    while (v10);
  }

}

- (void)setButtonImageSize:(CGSize)a3
{
  double height;
  double width;
  NSMutableArray *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  height = a3.height;
  width = a3.width;
  v23 = *MEMORY[0x24BDAC8D0];
  self->_buttonImageSize = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_buttons;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v8)
  {
    v12 = v8;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v6);
        objc_msgSend_setImageSize_(*(void **)(*((_QWORD *)&v18 + 1) + 8 * v14++), v9, v10, v11, width, height, (_QWORD)v18);
      }
      while (v12 != v14);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v18, (uint64_t)v22, 16);
    }
    while (v12);
  }

  objc_msgSend_setNeedsLayout(self, v15, v16, v17);
}

- (void)setExpanded:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];

  if (self->_expanded != a3 && !self->_toggleEnabled)
  {
    self->_expanded = a3;
    if (objc_msgSend__isInAnimationBlock(MEMORY[0x24BEBDB00], a2, a3, v3))
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = sub_230F86DEC;
      v17[3] = &unk_24FFC4368;
      v17[4] = self;
      objc_msgSend_animateWithDuration_delay_options_animations_completion_(MEMORY[0x24BEBDB00], v5, 96, (uint64_t)v17, 0, 0.25, 0.0);
    }
    else
    {
      objc_msgSend__updateButtonsVisiblity(self, v5, v6, v7);
      objc_msgSend_updateVisualStyling(self, v11, v12, v13);
      objc_msgSend__updateSelectionVisiblity(self, v14, v15, v16);
    }
    objc_msgSend_setNeedsLayout(self, v8, v9, v10);
  }
}

- (void)setEnabled:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AXCCExpandableButton;
  -[AXCCExpandableButton setEnabled:](&v15, sel_setEnabled_, a3);
  objc_msgSend_updateVisualStyling(self, v4, v5, v6);
  objc_msgSend__updateButtonsVisiblity(self, v7, v8, v9);
  objc_msgSend__updateSelectionVisiblity(self, v10, v11, v12);
  objc_msgSend__animateGlyphStateSelected_(self, v13, 0, v14);
}

- (void)setHighlighted:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXCCExpandableButton;
  -[AXCCExpandableButton setHighlighted:](&v7, sel_setHighlighted_, a3);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_230F86F08;
  v6[3] = &unk_24FFC4368;
  v6[4] = self;
  objc_msgSend_animateWithDuration_animations_(MEMORY[0x24BEBDB00], v4, (uint64_t)v6, v5, 0.15);
}

- (void)setAnimating:(BOOL)a3
{
  uint64_t v3;

  self->_animating = a3;
  objc_msgSend__animateGlyphStateSelected_(self, a2, 0, v3);
}

- (void)showMessage:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];

  objc_msgSend_setText_(self->_messageLabel, a2, (uint64_t)a3, v3);
  self->_resetTracking = 1;
  objc_msgSend__layoutLabels(self, v5, v6, v7);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_230F86FC0;
  v9[3] = &unk_24FFC4368;
  v9[4] = self;
  objc_msgSend_animateKeyframesWithDuration_delay_options_animations_completion_(MEMORY[0x24BEBDB00], v8, 0, (uint64_t)v9, 0, 2.5, 0.0);
}

- (void)setDisplayMessage:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  self->_displayMessage = a3;
  objc_msgSend__updateButtonsVisiblity(self, a2, a3, v3);
  objc_msgSend_updateVisualStyling(self, v5, v6, v7);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4;
  CGFloat y;
  CGFloat x;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  CGPoint v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  objc_msgSend_backgroundView(self, a2, (uint64_t)a4, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_frame(v7, v8, v9, v10);
  v13.x = x;
  v13.y = y;
  v11 = CGRectContainsPoint(v14, v13);

  return v11;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return self->_expanded;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int64_t axis;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  NSMutableArray *buttons;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t selectedOptionIndex;
  BOOL v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  const char *v45;
  uint64_t v46;
  double v47;
  BOOL v48;
  _QWORD v50[7];
  BOOL v51;
  BOOL v52;
  _QWORD v53[7];

  v5 = a3;
  if ((objc_msgSend__isPointerTouch(v5, v6, v7, v8) & 1) == 0)
  {
    axis = self->_axis;
    if (axis)
    {
      objc_msgSend_center(self->_selectionView, v9, v10, v11);
      v14 = v13;
      objc_msgSend_locationInView_(v5, v15, (uint64_t)self, v16);
    }
    else
    {
      objc_msgSend_locationInView_(v5, v9, (uint64_t)self, v11);
      v14 = v20;
      objc_msgSend_center(self->_selectionView, v21, v22, v23);
    }
    v24 = v19;
    buttons = self->_buttons;
    v26 = MEMORY[0x24BDAC760];
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = sub_230F87328;
    v53[3] = &unk_24FFC44F0;
    *(double *)&v53[4] = v14;
    *(double *)&v53[5] = v19;
    v27 = objc_msgSend_indexOfObjectPassingTest_(buttons, v17, (uint64_t)v53, v18);
    if (v27 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v31 = v27;
      selectedOptionIndex = self->_selectedOptionIndex;
      v33 = v27 != selectedOptionIndex;
      v34 = objc_msgSend_count(self->_buttons, v28, v29, v30);
      if ((selectedOptionIndex & (unint64_t)~(selectedOptionIndex >> 63)) >= v34 - 1)
        objc_msgSend_objectAtIndexedSubscript_(self->_buttons, v35, v34 - 1, v36);
      else
        objc_msgSend_objectAtIndexedSubscript_(self->_buttons, v35, selectedOptionIndex & ~(selectedOptionIndex >> 63), v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_center(v37, v38, v39, v40);
      v42 = v41;
      v44 = v43;

      v47 = v24 - v44;
      v50[0] = v26;
      if (!axis)
        v47 = v14 - v42;
      v50[1] = 3221225472;
      v50[2] = sub_230F87350;
      v50[3] = &unk_24FFC4518;
      v50[4] = self;
      v51 = axis == 0;
      *(double *)&v50[5] = v47;
      v52 = v33;
      v50[6] = v31;
      objc_msgSend_animateWithDuration_animations_(MEMORY[0x24BEBDB00], v45, (uint64_t)v50, v46, 0.1);
      if (v31 != selectedOptionIndex)
        objc_msgSend_sendActionsForControlEvents_(self, v28, 4096, v30);
    }
    if (!self->_resetTracking)
    {
      v48 = 1;
      goto LABEL_16;
    }
    objc_msgSend__resetSelectionView(self, v28, v29, v30);
  }
  v48 = 0;
LABEL_16:

  return v48;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXCCExpandableButton;
  -[AXCCExpandableButton endTrackingWithTouch:withEvent:](&v8, sel_endTrackingWithTouch_withEvent_, a3, a4);
  objc_msgSend__resetSelectionView(self, v5, v6, v7);
}

- (void)cancelTrackingWithEvent:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXCCExpandableButton;
  -[AXCCExpandableButton cancelTrackingWithEvent:](&v7, sel_cancelTrackingWithEvent_, a3);
  objc_msgSend__resetSelectionView(self, v4, v5, v6);
}

- (void)didTapButton:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  _QWORD v12[6];
  _QWORD v13[6];

  v5 = objc_msgSend_indexOfObject_(self->_buttons, a2, (uint64_t)a3, v3);
  if (self->_toggleEnabled)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_230F875A0;
    v13[3] = &unk_24FFC4540;
    v13[4] = self;
    v13[5] = v5;
    objc_msgSend_animateWithDuration_animations_(MEMORY[0x24BEBDB00], v6, (uint64_t)v13, v7, 0.25);
LABEL_3:
    objc_msgSend__animateGlyphStateSelected_(self, v8, 1, v9);
    objc_msgSend_sendActionsForControlEvents_(self, v10, 4096, v11);
    return;
  }
  if (self->_expanded && self->_selectedOptionIndex != v5)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_230F875B0;
    v12[3] = &unk_24FFC4540;
    v12[4] = self;
    v12[5] = v5;
    objc_msgSend__springAnimate_(self, v6, (uint64_t)v12, v7);
    goto LABEL_3;
  }
  objc_msgSend_sendActionsForControlEvents_(self, v6, 64, v7);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  AXCCExpandableButton *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;

  v4 = a3;
  objc_msgSend_view(v4, v5, v6, v7);
  v8 = (AXCCExpandableButton *)objc_claimAutoreleasedReturnValue();
  if (v8 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend_numberOfTouchesRequired(v4, v9, v10, v11) != 1)
  {

    goto LABEL_7;
  }
  v15 = objc_msgSend_numberOfTapsRequired(v4, v12, v13, v14);

  if (v15 != 1)
  {
LABEL_7:
    v16 = 1;
    goto LABEL_8;
  }
  v16 = 0;
LABEL_8:

  return v16;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  NSMutableArray *buttons;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  _QWORD v37[4];
  id v38;

  v6 = a4;
  buttons = self->_buttons;
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = sub_230F87790;
  v37[3] = &unk_24FFC4568;
  v8 = v6;
  v38 = v8;
  v11 = objc_msgSend_indexOfObjectPassingTest_(buttons, v9, (uint64_t)v37, v10);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = 0;
  }
  else
  {
    v15 = v11;
    objc_msgSend_objectAtIndexedSubscript_(self->_buttons, v12, v11, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageFrame(v16, v17, v18, v19);
    objc_msgSend_convertRect_fromView_(self, v20, (uint64_t)v16, v21);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v30 = (void *)MEMORY[0x24BEBD838];
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v31, v15, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_regionWithRect_identifier_(v30, v34, (uint64_t)v33, v35, v23, v25, v27, v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  id v25;
  const char *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  id v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  id v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;

  v5 = a4;
  objc_msgSend_identifier(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_integerValue(v9, v10, v11, v12);

  if (self->_toggleEnabled || !self->_expanded)
  {
    v17 = (void *)MEMORY[0x24BEBD420];
    objc_msgSend_rect(v5, v14, v15, v16);
    objc_msgSend_bezierPathWithOvalInRect_(v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc_init(MEMORY[0x24BEBD888]);
    objc_msgSend_setShadowPath_(v22, v23, (uint64_t)v21, v24);
    v25 = objc_alloc(MEMORY[0x24BEBDA30]);
    v27 = (id)objc_msgSend_initWithView_parameters_(v25, v26, (uint64_t)self, (uint64_t)v22);
    objc_msgSend_effectWithPreview_(MEMORY[0x24BEBD830], v28, (uint64_t)v27, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_shapeWithPath_(MEMORY[0x24BEBD840], v31, (uint64_t)v21, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_styleWithEffect_shape_(MEMORY[0x24BEBD848], v34, (uint64_t)v30, (uint64_t)v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v13 == self->_selectedOptionIndex)
    {
      v37 = objc_alloc(MEMORY[0x24BEBDA30]);
      v21 = (void *)objc_msgSend_initWithView_(v37, v38, (uint64_t)self->_selectionView, v39);
      objc_msgSend_effectWithPreview_(MEMORY[0x24BEBD830], v40, (uint64_t)v21, v41);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v42 = (void *)MEMORY[0x24BEBD840];
      v43 = (void *)MEMORY[0x24BEBD420];
      objc_msgSend_bounds(self->_selectionView, v44, v45, v46);
      objc_msgSend_bezierPathWithOvalInRect_(v43, v47, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_shapeWithPath_(v42, v51, (uint64_t)v50, v52);
      v27 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend_styleWithEffect_shape_(MEMORY[0x24BEBD848], v53, (uint64_t)v22, (uint64_t)v27);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    objc_msgSend_objectAtIndexedSubscript_(self->_buttons, v14, v13, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)MEMORY[0x24BEBD420];
    objc_msgSend_imageFrame(v21, v55, v56, v57);
    objc_msgSend_bezierPathWithOvalInRect_(v54, v58, v59, v60);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v27 = objc_alloc_init(MEMORY[0x24BEBD888]);
    objc_msgSend_setShadowPath_(v27, v61, (uint64_t)v22, v62);
    v63 = objc_alloc(MEMORY[0x24BEBDA30]);
    v30 = (void *)objc_msgSend_initWithView_parameters_(v63, v64, (uint64_t)v21, (uint64_t)v27);
    objc_msgSend_effectWithPreview_(MEMORY[0x24BEBD818], v65, (uint64_t)v30, v66);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_shapeWithPath_(MEMORY[0x24BEBD840], v67, (uint64_t)v22, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_styleWithEffect_shape_(MEMORY[0x24BEBD848], v70, (uint64_t)v33, (uint64_t)v69);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_4:

  return v35;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  objc_msgSend_setClipsToBounds_(self->_clippingView, a2, 0, (uint64_t)a4, a5);
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  objc_msgSend_setClipsToBounds_(self->_clippingView, a2, 1, (uint64_t)a4, a5);
}

- (void)_updateButtonsVisiblity
{
  uint64_t v2;
  NSMutableArray *buttons;
  _QWORD v4[5];

  buttons = self->_buttons;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_230F87B18;
  v4[3] = &unk_24FFC4590;
  v4[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(buttons, a2, (uint64_t)v4, v2);
}

- (void)updateVisualStyling
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  AXCCVisualStylingProvider *stylingProvider;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  UILabel *messageLabel;
  double v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  char isEnabled;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;

  if (objc_msgSend_isEnabled(self, a2, v2, v3))
    objc_msgSend_setAlpha_(self->_backgroundView, v5, v6, v7, 1.0);
  else
    objc_msgSend_setAlpha_(self->_backgroundView, v5, v6, v7, 0.5);
  stylingProvider = self->_stylingProvider;
  if (stylingProvider)
  {
    if (self->_displayMessage)
    {
      objc_msgSend_setAlpha_(self->_titleLabel, v8, v9, v10, 0.0);
      objc_msgSend_setAlpha_(self->_subtitleLabel, v12, v13, v14, 0.0);
      objc_msgSend_applyStyle_toView_(self->_stylingProvider, v15, 0, (uint64_t)self->_messageLabel);
      return;
    }
    if (self->_expanded)
      goto LABEL_23;
    isEnabled = objc_msgSend_isEnabled(self, v8, v9, v10);
    stylingProvider = self->_stylingProvider;
    if ((isEnabled & 1) == 0)
    {
      objc_msgSend_applyStyle_toView_(stylingProvider, v8, 0, (uint64_t)self->_titleLabel);
      objc_msgSend_applyStyle_toView_(self->_stylingProvider, v32, 0, (uint64_t)self->_subtitleLabel);
      objc_msgSend_setAlpha_(self->_titleLabel, v33, v34, v35, 0.5);
      objc_msgSend_setAlpha_(self->_subtitleLabel, v36, v37, v38, 0.5);
      goto LABEL_19;
    }
    if (stylingProvider)
    {
LABEL_23:
      if (!self->_expanded)
      {
        objc_msgSend_applyStyle_toView_(stylingProvider, v8, 0, (uint64_t)self->_titleLabel);
        objc_msgSend_applyStyle_toView_(self->_stylingProvider, v24, 0, (uint64_t)self->_subtitleLabel);
LABEL_19:
        messageLabel = self->_messageLabel;
        v23 = 0.0;
        goto LABEL_20;
      }
LABEL_13:
      objc_msgSend_setAlpha_(self->_titleLabel, v8, v9, v10, 0.0);
      objc_msgSend_setAlpha_(self->_subtitleLabel, v25, v26, v27, 0.0);
      goto LABEL_19;
    }
LABEL_12:
    if (!self->_expanded)
    {
      objc_msgSend_setAlpha_(self->_titleLabel, v8, v9, v10, 1.0);
      objc_msgSend_setAlpha_(self->_subtitleLabel, v29, v30, v31, 1.0);
      goto LABEL_19;
    }
    goto LABEL_13;
  }
  if (!self->_displayMessage)
    goto LABEL_12;
  objc_msgSend_setAlpha_(self->_titleLabel, v8, v9, v10, 0.0);
  objc_msgSend_setAlpha_(self->_subtitleLabel, v16, v17, v18, 0.0);
  messageLabel = self->_messageLabel;
  v23 = 1.0;
LABEL_20:
  objc_msgSend_setAlpha_(messageLabel, v19, v20, v21, v23);
}

- (void)_updateSelectionVisiblity
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  objc_msgSend_selectedOption(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_selectedBackgroundColor(v5, v6, v7, v8);
  v24 = (id)objc_claimAutoreleasedReturnValue();

  if (v24 && objc_msgSend_isEnabled(self, v9, v10, v11))
  {
    objc_msgSend_setBackgroundColor_(self->_selectionView, v9, (uint64_t)v24, v11);
  }
  else
  {
    if (self->_expanded && self->_selectedOptionIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend_clearColor(MEMORY[0x24BEBD4B8], v9, v10, v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setBackgroundColor_(self->_selectionView, v19, (uint64_t)v18, v20);

      objc_msgSend_setAlpha_(self->_overlaySelectionView, v21, v22, v23, 0.2);
      goto LABEL_9;
    }
    objc_msgSend_clearColor(MEMORY[0x24BEBD4B8], v9, v10, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBackgroundColor_(self->_selectionView, v16, (uint64_t)v15, v17);

  }
  objc_msgSend_setAlpha_(self->_overlaySelectionView, v12, v13, v14, 0.0);
LABEL_9:

}

- (void)_layoutLabels
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  CGFloat v52;
  CGFloat v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  objc_msgSend_bounds(self, a2, v2, v3);
  objc_msgSend_backgroundView(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_frame(v8, v9, v10, v11);
  CGRectGetMaxY(v54);
  UIRectInset();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  objc_msgSend_sizeThatFits_(self->_titleLabel, v20, v21, v22, v17, v19);
  v55.origin.x = v13;
  v55.origin.y = v15;
  v55.size.width = v17;
  v55.size.height = v19;
  CGRectGetMinY(v55);
  UIRectCenteredXInRect();
  v52 = v24;
  v53 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend_setFrame_(self->_titleLabel, v29, v30, v31);
  objc_msgSend_sizeThatFits_(self->_messageLabel, v32, v33, v34, v17, v19);
  v56.origin.x = v13;
  v56.origin.y = v15;
  v56.size.width = v17;
  v56.size.height = v19;
  CGRectGetMinY(v56);
  UIRectCenteredXInRect();
  objc_msgSend_setFrame_(self->_messageLabel, v35, v36, v37);
  v57.origin.y = v52;
  v57.origin.x = v53;
  v57.size.width = v26;
  v57.size.height = v28;
  CGRectGetHeight(v57);
  UIRectInset();
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  objc_msgSend_sizeThatFits_(self->_subtitleLabel, v46, v47, v48, v42, v44);
  v58.origin.x = v39;
  v58.origin.y = v41;
  v58.size.width = v43;
  v58.size.height = v45;
  CGRectGetMinY(v58);
  UIRectCenteredXInRect();
  objc_msgSend_setFrame_(self->_subtitleLabel, v49, v50, v51);
}

- (void)_layoutSelectionView
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  const char *v9;
  uint64_t v10;
  unint64_t selectedOptionIndex;
  UIView *backgroundView;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  int isHighlighted;
  double v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  double MidX;
  CGFloat MidY;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  CGFloat Height;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  CGFloat v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  if (self->_selectedOptionIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend_count(self->_buttons, a2, v2, v3))
    {
      v8 = objc_msgSend_count(self->_buttons, v5, v6, v7);
      selectedOptionIndex = self->_selectedOptionIndex;
      if (v8 > selectedOptionIndex)
      {
        objc_msgSend_objectAtIndexedSubscript_(self->_buttons, v9, selectedOptionIndex, v10);
        v54 = (id)objc_claimAutoreleasedReturnValue();
        backgroundView = self->_backgroundView;
        objc_msgSend_imageFrame(v54, v13, v14, v15);
        objc_msgSend_convertRect_fromView_(backgroundView, v16, (uint64_t)v54, v17);
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v28 = v27;
        if (self->_expanded)
        {
          isHighlighted = objc_msgSend_isHighlighted(self, v18, v19, v20);
          v30 = 4.0;
          if (isHighlighted)
            v30 = 2.0;
          v22 = v22 + v30;
          v24 = v24 + v30;
          v31 = v30 + v30;
          v26 = v26 - v31;
          v28 = v28 - v31;
        }
        UIRectCenteredAboutPoint();
        objc_msgSend_setBounds_(self->_selectionView, v32, v33, v34);
        v55.origin.x = v22;
        v55.origin.y = v24;
        v55.size.width = v26;
        v55.size.height = v28;
        MidX = CGRectGetMidX(v55);
        v56.origin.x = v22;
        v56.origin.y = v24;
        v56.size.width = v26;
        v56.size.height = v28;
        MidY = CGRectGetMidY(v56);
        objc_msgSend_setCenter_(self->_selectionView, v37, v38, v39, MidX, MidY);
        v57.origin.x = v22;
        v57.origin.y = v24;
        v57.size.width = v26;
        v57.size.height = v28;
        Height = CGRectGetHeight(v57);
        objc_msgSend__setCornerRadius_(self->_selectionView, v41, v42, v43, Height * 0.5);
        v58.origin.x = v22;
        v58.origin.y = v24;
        v58.size.width = v26;
        v58.size.height = v28;
        v44 = CGRectGetHeight(v58);
        objc_msgSend__setCornerRadius_(self->_overlaySelectionView, v45, v46, v47, v44 * 0.5);
        objc_msgSend_bounds(self->_selectionView, v48, v49, v50);
        objc_msgSend_setFrame_(self->_overlaySelectionView, v51, v52, v53);

      }
    }
  }
}

- (void)_springAnimate:(id)a3
{
  objc_class *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BEBDB28];
  v4 = a3;
  v9 = objc_alloc_init(v3);
  objc_msgSend_setDampingRatio_response_(v9, v5, v6, v7, 0.8165, 0.51302);
  objc_msgSend__animateUsingSpringBehavior_tracking_animations_completion_(MEMORY[0x24BEBDB00], v8, (uint64_t)v9, 0, v4, 0);

}

- (void)_animateGlyphStateSelected:(BOOL)a3
{
  uint64_t v3;
  _BOOL4 v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  const __CFString *v14;
  int isEnabled;
  NSMutableArray *buttons;
  _QWORD v17[5];
  __CFString *v18;

  v4 = a3;
  if (objc_msgSend_isEnabled(self, a2, a3, v3)
    && self->_animating
    && (objc_msgSend_selectedOption(self, v6, v7, v8),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend_supportsAnimation(v9, v10, v11, v12),
        v9,
        (v13 & 1) != 0))
  {
    v14 = CFSTR("animating");
  }
  else
  {
    isEnabled = objc_msgSend_isEnabled(self, v6, v7, v8);
    v14 = CFSTR("on");
    if ((isEnabled & v4) == 0)
      v14 = 0;
  }
  buttons = self->_buttons;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_230F884C0;
  v17[3] = &unk_24FFC45B8;
  v17[4] = self;
  v18 = (__CFString *)v14;
  objc_msgSend_enumerateObjectsUsingBlock_(buttons, v6, (uint64_t)v17, v8);

}

- (void)_resetSelectionView
{
  uint64_t v2;
  _QWORD v3[5];

  self->_resetTracking = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_230F88548;
  v3[3] = &unk_24FFC4368;
  v3[4] = self;
  objc_msgSend__springAnimate_(self, a2, (uint64_t)v3, v2);
}

- (int64_t)_buttonLayoutAxis
{
  if (self->_toggleEnabled)
    return 0;
  else
    return self->_axis;
}

- (void)updateContentSizeCategory
{
  uint64_t v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id v12;

  v3 = *MEMORY[0x24BEBE098];
  objc_msgSend__preferredFontForTextStyle_maximumContentSizeCategory_(MEMORY[0x24BEBB520], a2, *MEMORY[0x24BEBE200], *MEMORY[0x24BEBE098]);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__preferredFontForTextStyle_maximumContentSizeCategory_(MEMORY[0x24BEBB520], v4, *MEMORY[0x24BEBE1E0], v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFont_(self->_titleLabel, v6, (uint64_t)v12, v7);
  objc_msgSend_setFont_(self->_subtitleLabel, v8, (uint64_t)v5, v9);
  objc_msgSend_setFont_(self->_messageLabel, v10, (uint64_t)v12, v11);

}

- (BOOL)isAccessibilityElement
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_isExpanded(self, a2, v2, v3) ^ 1;
}

- (id)accessibilityLabel
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_titleLabel(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accessibilityLabel(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)accessibilityValue
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  id v33;

  objc_msgSend_subtitleLabel(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accessibilityLabel(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_messageLabel(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accessibilityLabel(v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_length(v9, v18, v19, v20))
    v24 = v9;
  else
    v24 = 0;
  if (objc_msgSend_length(v17, v21, v22, v23))
  {
    if (objc_msgSend_length(v24, v25, v26, v27))
    {
      objc_msgSend_stringByAppendingString_(v24, v28, (uint64_t)CFSTR(", "), v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_stringByAppendingString_(v30, v31, (uint64_t)v17, v32);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      v24 = v30;
    }
    else
    {
      v33 = v17;
    }

    v24 = v33;
  }

  return v24;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v4 = *MEMORY[0x24BEBDF00];
  v5 = objc_msgSend_toggleEnabled(self, a2, v2, v3);
  v6 = *MEMORY[0x24BEBDF20];
  if (v5)
    v6 = 0;
  return v6 | v4;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (NSArray)options
{
  return self->_options;
}

- (int64_t)selectedOptionIndex
{
  return self->_selectedOptionIndex;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)axis
{
  return self->_axis;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (CGSize)maximumExpandedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumExpandedSize.width;
  height = self->_maximumExpandedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaximumExpandedSize:(CGSize)a3
{
  self->_maximumExpandedSize = a3;
}

- (CGSize)buttonImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_buttonImageSize.width;
  height = self->_buttonImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (AXCCVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (NSMutableArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)overlaySelectionView
{
  return self->_overlaySelectionView;
}

- (void)setOverlaySelectionView:(id)a3
{
  objc_storeStrong((id *)&self->_overlaySelectionView, a3);
}

- (UIView)selectionView
{
  return self->_selectionView;
}

- (void)setSelectionView:(id)a3
{
  objc_storeStrong((id *)&self->_selectionView, a3);
}

- (UIView)clippingView
{
  return self->_clippingView;
}

- (void)setClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_clippingView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabel, a3);
}

- (NSTimer)messageTimer
{
  return self->_messageTimer;
}

- (void)setMessageTimer:(id)a3
{
  objc_storeStrong((id *)&self->_messageTimer, a3);
}

- (BOOL)toggleEnabled
{
  return self->_toggleEnabled;
}

- (void)setToggleEnabled:(BOOL)a3
{
  self->_toggleEnabled = a3;
}

- (BOOL)displayMessage
{
  return self->_displayMessage;
}

- (BOOL)resetTracking
{
  return self->_resetTracking;
}

- (void)setResetTracking:(BOOL)a3
{
  self->_resetTracking = a3;
}

- (BOOL)isControlCenter
{
  return self->_isControlCenter;
}

- (void)setIsControlCenter:(BOOL)a3
{
  self->_isControlCenter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageTimer, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_storeStrong((id *)&self->_overlaySelectionView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
