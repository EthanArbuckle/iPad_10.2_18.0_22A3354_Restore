@implementation LAUIPearlGlyphLabel

- (LAUIPearlGlyphLabel)init
{
  return -[LAUIPearlGlyphLabel initWithStyle:](self, "initWithStyle:", 0);
}

- (LAUIPearlGlyphLabel)initWithFrame:(CGRect)a3
{
  return -[LAUIPearlGlyphLabel initWithStyle:](self, "initWithStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (LAUIPearlGlyphLabel)initWithStyle:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  char *v8;
  char *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  LAUIPearlGlyphView *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  BOOL v41;
  void *v42;
  void *v44;
  id v45;
  CATransform3D v46;
  objc_super v47;
  void *v48;
  _QWORD v49[2];
  _QWORD v50[12];
  _QWORD v51[14];

  v51[12] = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v47.receiver = self;
  v47.super_class = (Class)LAUIPearlGlyphLabel;
  v8 = -[LAUIPearlGlyphLabel initWithFrame:](&v47, sel_initWithFrame_, v4, v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    *((_QWORD *)v8 + 74) = a3;
    v8[584] = 1;
    *((int64x2_t *)v8 + 38) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *(_OWORD *)(v8 + 552) = *((_OWORD *)v8 + 38);
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = CFSTR("position");
    v50[1] = CFSTR("bounds");
    v51[0] = v10;
    v51[1] = v10;
    v50[2] = CFSTR("transform");
    v50[3] = CFSTR("backgroundColor");
    v51[2] = v10;
    v51[3] = v10;
    v50[4] = CFSTR("cornerRadius");
    v50[5] = CFSTR("contents");
    v51[4] = v10;
    v51[5] = v10;
    v50[6] = CFSTR("anchorPoint");
    v50[7] = CFSTR("opacity");
    v51[6] = v10;
    v51[7] = v10;
    v50[8] = CFSTR("strokeStart");
    v50[9] = CFSTR("strokeEnd");
    v51[8] = v10;
    v51[9] = v10;
    v50[10] = CFSTR("strokeColor");
    v50[11] = CFSTR("fillColor");
    v51[10] = v10;
    v51[11] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 12);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsGroupOpacity:", 0);
    v12 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    v13 = (void *)*((_QWORD *)v9 + 52);
    *((_QWORD *)v9 + 52) = v12;

    objc_msgSend(*((id *)v9 + 52), "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CATransform3DMakeScale(&v46, 1.1, 1.1, 1.0);
    objc_msgSend(v14, "setTransform:", &v46);

    objc_msgSend(v9, "addSubview:", *((_QWORD *)v9 + 52));
    objc_msgSend(*((id *)v9 + 52), "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setAllowsGroupOpacity:", 0);
    objc_msgSend(v15, "setAllowsGroupBlending:", 0);
    v16 = objc_alloc_init(MEMORY[0x24BDE5640]);
    v17 = (void *)*((_QWORD *)v9 + 53);
    *((_QWORD *)v9 + 53) = v16;

    objc_msgSend(*((id *)v9 + 53), "setCornerCurve:", *MEMORY[0x24BDE58E8]);
    objc_msgSend(*((id *)v9 + 53), "setAllowsInPlaceFiltering:", 1);
    objc_msgSend(*((id *)v9 + 53), "setActions:", v44);
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A10]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setName:", CFSTR("saturation"));
    objc_msgSend(v18, "setValue:forKey:", &unk_24C284E70, CFSTR("inputAmount"));
    v19 = *MEMORY[0x24BDE5A78];
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A78]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setName:", CFSTR("blur"));
    objc_msgSend(v20, "setValue:forKey:", &unk_24C284E70, CFSTR("inputRadius"));
    objc_msgSend(v20, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("inputNormalizeEdges"));
    v21 = (void *)*((_QWORD *)v9 + 53);
    v49[0] = v18;
    v49[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFilters:", v22);

    objc_msgSend(v15, "addSublayer:", *((_QWORD *)v9 + 53));
    v23 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    v24 = (void *)*((_QWORD *)v9 + 54);
    *((_QWORD *)v9 + 54) = v23;

    objc_msgSend(*((id *)v9 + 54), "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*((id *)v9 + 52), "addSubview:", *((_QWORD *)v9 + 54));
    v26 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    v27 = (void *)*((_QWORD *)v9 + 55);
    *((_QWORD *)v9 + 55) = v26;

    objc_msgSend(*((id *)v9 + 55), "setTextAlignment:", 1);
    objc_msgSend(*((id *)v9 + 55), "setLineBreakMode:", 4);
    objc_msgSend(*((id *)v9 + 54), "addSubview:", *((_QWORD *)v9 + 55));
    v28 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    v29 = (void *)*((_QWORD *)v9 + 56);
    *((_QWORD *)v9 + 56) = v28;

    objc_msgSend(*((id *)v9 + 56), "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "setAllowsGroupOpacity:", 0);
    objc_msgSend(v30, "setAllowsGroupBlending:", 0);
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5B68]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCompositingFilter:", v31);

    objc_msgSend(*((id *)v9 + 52), "addSubview:", *((_QWORD *)v9 + 56));
    v32 = [LAUIPearlGlyphView alloc];
    v33 = +[LAUIPearlGlyphStaticConfiguration createDefaultConfiguration](LAUIPearlGlyphStaticConfiguration, "createDefaultConfiguration");
    v34 = -[LAUIPearlGlyphView initWithConfiguration:](v32, "initWithConfiguration:", v33);
    v35 = (void *)*((_QWORD *)v9 + 57);
    *((_QWORD *)v9 + 57) = v34;

    objc_msgSend(*((id *)v9 + 57), "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*((id *)v9 + 57), "setBounds:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 30.0, 30.0);
    objc_msgSend(*((id *)v9 + 57), "setState:animated:", 2, 0);
    objc_msgSend(*((id *)v9 + 57), "setPaused:", 1);
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", v19);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setValue:forKey:", &unk_24C284E88, CFSTR("inputRadius"));
    objc_msgSend(v37, "setValue:forKey:", MEMORY[0x24BDBD1C0], CFSTR("inputHardEdges"));
    objc_msgSend(v37, "setValue:forKey:", MEMORY[0x24BDBD1C0], CFSTR("inputNormalizeEdges"));
    v48 = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setFilters:", v38);

    objc_msgSend(*((id *)v9 + 56), "addSubview:", *((_QWORD *)v9 + 57));
    objc_msgSend(v9, "_applyStyle");
    v39 = (void *)*((_QWORD *)v9 + 53);
    objc_msgSend(*((id *)v9 + 64), "colorWithAlphaComponent:", 0.0);
    v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v39, "setBackgroundColor:", objc_msgSend(v40, "CGColor"));

    objc_msgSend(*((id *)v9 + 55), "setTextColor:", *((_QWORD *)v9 + 65));
    v41 = UIAccessibilityIsReduceTransparencyEnabled() || UIAccessibilityIsReduceMotionEnabled();
    v9[583] = v41;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v44);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObserver:selector:name:object:", v9, sel_applicationDidBecomeActive_, *MEMORY[0x24BDF7510], 0);
    objc_msgSend(v42, "addObserver:selector:name:object:", v9, sel_reduceTransparencyDidChange_, *MEMORY[0x24BDF7318], 0);
    objc_msgSend(v42, "addObserver:selector:name:object:", v9, sel_reduceMotionDidChange_, *MEMORY[0x24BDF7310], 0);
    objc_msgSend(v42, "addObserver:selector:name:object:", v9, sel_boldTextStatusDidChange_, *MEMORY[0x24BDF71F8], 0);
    objc_msgSend(v42, "addObserver:selector:name:object:", v9, sel_contentSizeCategoryDidChange_, *MEMORY[0x24BDF7670], 0);
    objc_msgSend(v9, "_updateFontAnimated:", 0);
    objc_msgSend(v9, "_applyVisibilityAnimated:", 0);

  }
  return (LAUIPearlGlyphLabel *)v9;
}

- (void)dealloc
{
  void *v3;
  NSObject *visibilityTimer;
  OS_dispatch_source *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  visibilityTimer = self->_visibilityTimer;
  if (visibilityTimer)
  {
    dispatch_source_cancel(visibilityTimer);
    v5 = self->_visibilityTimer;
    self->_visibilityTimer = 0;

  }
  -[LAUIPearlGlyphLabel invalidate](self, "invalidate");
  v6.receiver = self;
  v6.super_class = (Class)LAUIPearlGlyphLabel;
  -[LAUIPearlGlyphLabel dealloc](&v6, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  double width;
  double v8;
  double height;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  width = self->_currentLabelSize.width;
  v8 = self->_currentMaximumSize.width;
  height = self->_currentMaximumSize.height;
  -[UILabel font](self->_label, "font");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lineHeight");
  v12 = v11;
  objc_msgSend(v10, "leading");
  if (width <= 0.0)
    v14 = 0.0;
  else
    v14 = width + 12.0 + 12.0;
  v15 = fmax(v6, 1.0);
  v16 = ceil(v15 * (v12 + v13)) / v15 + 5.0 + 5.0;

  v17 = fmin(fmax(v16, 0.0), height);
  v18 = fmin(fmax(v14, v17), v8);
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LAUIPearlGlyphLabel;
  -[LAUIPearlGlyphLabel didMoveToWindow](&v4, sel_didMoveToWindow);
  -[LAUIPearlGlyphLabel window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_inWindow = v3 != 0;

  -[LAUIPearlGlyphLabel _updateText](self, "_updateText");
}

- (void)layoutIfNeededAnimated:(BOOL)a3
{
  self->_animated = a3;
  -[LAUIPearlGlyphLabel layoutIfNeeded](self, "layoutIfNeeded");
  self->_animated = 0;
}

- (void)layoutSubviews
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 animated;
  void *v15;
  id v16;
  char v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double height;
  double width;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CABackdropLayer *background;
  CGFloat v33;
  CGFloat v34;
  id v35;
  char v36;
  CABackdropLayer *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  CGFloat v44;
  CGFloat v45;
  id v46;
  char v47;
  id v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  CGFloat v54;
  CGFloat v55;
  double v56;
  double v57;
  id v58;
  char v59;
  id v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  id v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  id v79;
  char v80;
  id v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  char v87;
  __end_ **begin;
  __end_cap_ **i;
  void *v90;
  double v91;
  CGFloat v92;
  double v93;
  CGFloat v94;
  double v95;
  double v96;
  double v97;
  double v98;
  char v99;
  id v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  void *v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  CGFloat v118;
  double v119;
  CGFloat v120;
  id v121;
  char v122;
  id v123;
  double v124;
  double v125;
  double v126;
  double v127;
  CGFloat v128;
  LAUIPearlGlyphLabel *v129;
  void *v130;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CALayer *__unsafe_unretained, CALayer *>, void *>>> *begin_node;
  id v132;
  id v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  CGFloat v143;
  CGFloat v144;
  char v145;
  id v146;
  double v147;
  double v148;
  double v149;
  double v150;
  LAUIPearlGlyphLabel *left;
  LAUIPearlGlyphLabel *v152;
  BOOL v153;
  uint64_t v154;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  char m11_low;
  double v167;
  CGFloat m21;
  __int128 v169;
  char v170;
  _BYTE v171[31];
  id v172;
  __int128 v173;
  char v174;
  CATransform3D v175;
  CATransform3D v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  objc_super v185;
  _OWORD v186[2];
  _OWORD v187[2];
  _OWORD v188[2];
  _OWORD v189[2];
  _OWORD v190[2];
  _OWORD v191[2];
  _OWORD v192[2];
  _OWORD v193[2];
  _OWORD v194[2];
  uint64_t v195;

  v195 = *MEMORY[0x24BDAC8D0];
  v185.receiver = self;
  v185.super_class = (Class)LAUIPearlGlyphLabel;
  -[LAUIPearlGlyphLabel layoutSubviews](&v185, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  -[LAUIPearlGlyphLabel bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v163 = *MEMORY[0x24BDBEFB0];
  animated = self->_animated;
  if (self->_animated)
  {
    LAUI_CA_utilities::spring_factory::spring_factory((LAUI_CA_utilities::spring_factory *)&v176, 1.0, 199.791, 25.4425, 0.0, 0);
    m11_low = LOBYTE(v176.m11);
    v194[0] = *(_OWORD *)((char *)&v176.m11 + 1);
    *(_OWORD *)((char *)v194 + 15) = *(_OWORD *)&v176.m13;
    m21 = v176.m21;
    v184 = *(_OWORD *)&v176.m22;
  }
  else
  {
    m11_low = 0;
  }
  -[UIView layer](self->_container, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (animated)
  {
    v193[0] = v194[0];
    *(_OWORD *)((char *)v193 + 15) = *(_OWORD *)((char *)v194 + 15);
    v16 = *(id *)&m21;
    v183 = v184;
    v17 = m11_low;
  }
  else
  {
    v17 = 0;
  }
  v18 = v15;
  objc_msgSend(v18, "anchorPoint");
  v20 = v6 + v19 * v10;
  v22 = v8 + v21 * v12;
  LOBYTE(v176.m11) = 0;
  LOBYTE(v176.m24) = 0;
  if (animated)
  {
    LOBYTE(v176.m11) = v17;
    *(_OWORD *)((char *)&v176.m11 + 1) = v193[0];
    *(_OWORD *)&v176.m13 = *(_OWORD *)((char *)v193 + 15);
    *(_QWORD *)&v176.m21 = *(id *)&m21;
    *(_OWORD *)&v176.m22 = v183;
    LOBYTE(v176.m24) = 1;
  }
  LAUI_CA_utilities::set_layer_geometry(v18, (LAUI_CA_utilities::spring_factory *)&v176, v20, v22, v163, v13, v10, v12);
  if (LOBYTE(v176.m24))

  if (animated)
  width = self->_currentMaximumSize.width;
  height = self->_currentMaximumSize.height;
  -[UILabel font](self->_label, "font");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "lineHeight");
  v27 = v26;
  objc_msgSend(v25, "leading");
  v29 = v28;

  -[CABackdropLayer cornerRadius](self->_background, "cornerRadius");
  v30 = fmax(v4, 1.0);
  v165 = fmin(fmax(v12, ceil(v30 * (v27 + v29)) / v30 + 5.0 + 5.0), height);
  v167 = round(v30 * (v165 * 0.5)) / v30;
  if (v31 != v167)
    -[CABackdropLayer setCornerRadius:](self->_background, "setCornerRadius:", v167);
  background = self->_background;
  v33 = *MEMORY[0x24BDBEFB0];
  v34 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  if (animated)
  {
    v192[0] = v194[0];
    *(_OWORD *)((char *)v192 + 15) = *(_OWORD *)((char *)v194 + 15);
    v35 = *(id *)&m21;
    v182 = v184;
    v36 = m11_low;
  }
  else
  {
    v36 = 0;
  }
  v37 = background;
  -[CABackdropLayer anchorPoint](v37, "anchorPoint");
  v38 = fmin(fmax(v10, v165), width);
  v162 = round(v30 * (v163 + (v10 - v38) * 0.5)) / v30;
  v164 = v38;
  v40 = v162 + v39 * v38;
  v161 = round(v30 * (v13 + (v12 - v165) * 0.5)) / v30;
  v42 = v161 + v41 * v165;
  LOBYTE(v176.m11) = 0;
  LOBYTE(v176.m24) = 0;
  if (animated)
  {
    LOBYTE(v176.m11) = v36;
    *(_OWORD *)((char *)&v176.m11 + 1) = v192[0];
    *(_OWORD *)&v176.m13 = *(_OWORD *)((char *)v192 + 15);
    *(_QWORD *)&v176.m21 = *(id *)&m21;
    *(_OWORD *)&v176.m22 = v182;
    LOBYTE(v176.m24) = 1;
  }
  LAUI_CA_utilities::set_layer_geometry(v37, (LAUI_CA_utilities::spring_factory *)&v176, v40, v42, v33, v34, v164, v165);
  if (LOBYTE(v176.m24))

  if (animated)
  -[UIView layer](self->_glyphContainer, "layer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = *MEMORY[0x24BDBEFB0];
  v45 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  if (animated)
  {
    v191[0] = v194[0];
    *(_OWORD *)((char *)v191 + 15) = *(_OWORD *)((char *)v194 + 15);
    v46 = *(id *)&m21;
    v181 = v184;
    v47 = m11_low;
  }
  else
  {
    v47 = 0;
  }
  v48 = v43;
  objc_msgSend(v48, "anchorPoint");
  v154 = 448;
  v50 = v162 + v49 * v164;
  v52 = v161 + v51 * v165;
  LOBYTE(v176.m11) = 0;
  LOBYTE(v176.m24) = 0;
  if (animated)
  {
    LOBYTE(v176.m11) = v47;
    *(_OWORD *)((char *)&v176.m11 + 1) = v191[0];
    *(_OWORD *)&v176.m13 = *(_OWORD *)((char *)v191 + 15);
    *(_QWORD *)&v176.m21 = *(id *)&m21;
    *(_OWORD *)&v176.m22 = v181;
    LOBYTE(v176.m24) = 1;
  }
  LAUI_CA_utilities::set_layer_geometry(v48, (LAUI_CA_utilities::spring_factory *)&v176, v50, v52, v44, v45, v164, v165);
  if (LOBYTE(v176.m24))

  if (animated)
  -[UIView layer](self->_labelContainer, "layer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = *MEMORY[0x24BDBF090];
  v55 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v56 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v57 = *(double *)(MEMORY[0x24BDBF090] + 24);
  if (animated)
  {
    v190[0] = v194[0];
    *(_OWORD *)((char *)v190 + 15) = *(_OWORD *)((char *)v194 + 15);
    v58 = *(id *)&m21;
    v180 = v184;
    v59 = m11_low;
  }
  else
  {
    v59 = 0;
  }
  v60 = v53;
  objc_msgSend(v60, "anchorPoint");
  v62 = round(v30 * (v162 + (v164 - v56) * 0.5)) / v30 + v61 * v56;
  v64 = round(v30 * (v161 + (v165 - v57) * 0.5)) / v30 + v63 * v57;
  LOBYTE(v176.m11) = 0;
  LOBYTE(v176.m24) = 0;
  if (animated)
  {
    LOBYTE(v176.m11) = v59;
    *(_OWORD *)((char *)&v176.m11 + 1) = v190[0];
    *(_OWORD *)&v176.m13 = *(_OWORD *)((char *)v190 + 15);
    *(_QWORD *)&v176.m21 = *(id *)&m21;
    *(_OWORD *)&v176.m22 = v180;
    LOBYTE(v176.m24) = 1;
  }
  LAUI_CA_utilities::set_layer_geometry(v60, (LAUI_CA_utilities::spring_factory *)&v176, v62, v64, v54, v55, v56, v57);
  if (LOBYTE(v176.m24))

  if (animated)
  -[UIView bounds](self->_labelContainer, "bounds");
  v158 = v66;
  v159 = v65;
  v156 = v68;
  v157 = v67;
  -[UILabel layer](self->_label, "layer");
  v69 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "bounds");
  v71 = v70;
  v73 = v72;
  v75 = v74;
  v77 = v76;
  v78 = self->_maximumSize.width;
  if (animated)
  {
    v189[0] = v194[0];
    *(_OWORD *)((char *)v189 + 15) = *(_OWORD *)((char *)v194 + 15);
    v79 = *(id *)&m21;
    v179 = v184;
    v80 = m11_low;
  }
  else
  {
    v80 = 0;
  }
  v81 = v69;
  objc_msgSend(v81, "anchorPoint");
  v82 = fmin(v75, v78 + -12.0 + -12.0);
  v84 = round(v30 * (v159 + (v157 - v82) * 0.5)) / v30 + v83 * v82;
  v86 = round(v30 * (v158 + (v156 - v77) * 0.5)) / v30 + v85 * v77;
  LOBYTE(v176.m11) = 0;
  LOBYTE(v176.m24) = 0;
  if (animated)
  {
    LOBYTE(v176.m11) = v80;
    *(_OWORD *)((char *)&v176.m11 + 1) = v189[0];
    *(_OWORD *)&v176.m13 = *(_OWORD *)((char *)v189 + 15);
    *(_QWORD *)&v176.m21 = *(id *)&m21;
    *(_OWORD *)&v176.m22 = v179;
    LOBYTE(v176.m24) = 1;
  }
  v87 = LAUI_CA_utilities::set_layer_geometry(v81, (LAUI_CA_utilities::spring_factory *)&v176, v84, v86, v71, v73, v82, v77);
  if (LOBYTE(v176.m24))

  if (animated)
  if ((v87 & 2) != 0)
    -[UILabel setNeedsDisplay](self->_label, "setNeedsDisplay");

  begin = self->_labelSnapshots.__begin_;
  for (i = self->_labelSnapshots.var0; begin != i; ++begin)
  {
    -[__end_ layer](*begin, "layer", v154);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "bounds");
    v92 = v91;
    v94 = v93;
    v96 = v95;
    v98 = v97;
    if (animated)
    {
      v188[0] = v194[0];
      *(_OWORD *)((char *)v188 + 15) = *(_OWORD *)((char *)v194 + 15);
      v69 = *(id *)&m21;
      v178 = v184;
      v99 = m11_low;
    }
    else
    {
      v99 = 0;
    }
    v100 = v90;
    objc_msgSend(v100, "anchorPoint");
    v102 = v101;
    v104 = v103;
    LOBYTE(v176.m11) = 0;
    LOBYTE(v176.m24) = 0;
    if (animated)
    {
      LOBYTE(v176.m11) = v99;
      *(_OWORD *)((char *)&v176.m11 + 1) = v188[0];
      *(_OWORD *)&v176.m13 = *(_OWORD *)((char *)v188 + 15);
      *(_QWORD *)&v176.m21 = v69;
      *(_OWORD *)&v176.m22 = v178;
      LOBYTE(v176.m24) = 1;
    }
    LAUI_CA_utilities::set_layer_geometry(v100, (LAUI_CA_utilities::spring_factory *)&v176, round(v30 * (v159 + (v157 - v96) * 0.5)) / v30 + v102 * v96, round(v30 * (v158 + (v156 - v98) * 0.5)) / v30 + v104 * v98, v92, v94, v96, v98);
    if (LOBYTE(v176.m24))

    if (animated)
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v154), "bounds", v154);
  v160 = v105;
  v107 = v106;
  v109 = v108;
  v111 = v110;
  -[LAUIPearlGlyphView layer](self->_glyph, "layer");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "bounds");
  v114 = v113;
  v116 = v115;
  v118 = v117;
  v120 = v119;
  if (animated)
  {
    v187[0] = v194[0];
    *(_OWORD *)((char *)v187 + 15) = *(_OWORD *)((char *)v194 + 15);
    v121 = *(id *)&m21;
    v177 = v184;
    v122 = m11_low;
  }
  else
  {
    v122 = 0;
  }
  v123 = v112;
  objc_msgSend(v123, "anchorPoint");
  v125 = round(v30 * (v107 + (v160 - v114) * 0.5)) / v30 + v124 * v114;
  v127 = round(v30 * (v109 + (v111 - v116) * 0.5)) / v30 + v126 * v116;
  LOBYTE(v176.m11) = 0;
  LOBYTE(v176.m24) = 0;
  if (animated)
  {
    LOBYTE(v176.m11) = v122;
    *(_OWORD *)((char *)&v176.m11 + 1) = v187[0];
    *(_OWORD *)&v176.m13 = *(_OWORD *)((char *)v187 + 15);
    *(_QWORD *)&v176.m21 = *(id *)&m21;
    *(_OWORD *)&v176.m22 = v177;
    LOBYTE(v176.m24) = 1;
  }
  LAUI_CA_utilities::set_layer_geometry(v123, (LAUI_CA_utilities::spring_factory *)&v176, v125, v127, v120, v118, v114, v116);
  if (LOBYTE(v176.m24))

  if (animated)
  memset(&v176, 0, sizeof(v176));
  v128 = round(v30 * (fmax(v160, v111) * 0.83908046)) / v30 / fmax(v114, v116);
  CATransform3DMakeScale(&v176, v128, v128, 1.0);
  v175 = v176;
  v170 = 0;
  v174 = 0;
  if (animated)
  {
    v170 = m11_low;
    *(_OWORD *)v171 = v194[0];
    *(_OWORD *)&v171[15] = *(_OWORD *)((char *)v194 + 15);
    v172 = *(id *)&m21;
    v173 = v184;
    v174 = 1;
  }
  LAUI_CA_utilities::set_layer_transform(v123, (__int128 *)&v175, (LAUI_CA_utilities::spring_factory *)&v170);
  if (v174)

  v129 = self;
  -[UIView layer](self->_container, "layer");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CALayer *__unsafe_unretained, CALayer *>, void *>>> *)self->_masks.__tree_.__begin_node_;
  if (begin_node != &self->_masks.__tree_.__pair1_)
  {
    do
    {
      v132 = begin_node[4].__value_.__left_;
      v133 = begin_node[5].__value_.__left_;
      objc_msgSend(v133, "cornerRadius");
      if (v134 != v167)
        objc_msgSend(v133, "setCornerRadius:", v167);
      objc_msgSend(v132, "convertRect:fromLayer:", v130, v162, v161, v164, v165);
      v136 = v135;
      v138 = v137;
      v140 = v139;
      v142 = v141;
      v143 = *MEMORY[0x24BDBEFB0];
      v144 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      if (animated)
      {
        v186[0] = v194[0];
        *(_OWORD *)((char *)v186 + 15) = *(_OWORD *)((char *)v194 + 15);
        v129 = (LAUIPearlGlyphLabel *)*(id *)&m21;
        v169 = v184;
        v145 = m11_low;
      }
      else
      {
        v145 = 0;
      }
      v146 = v133;
      objc_msgSend(v146, "anchorPoint");
      v148 = v147;
      v150 = v149;
      LOBYTE(v176.m11) = 0;
      LOBYTE(v176.m24) = 0;
      if (animated)
      {
        LOBYTE(v176.m11) = v145;
        *(_OWORD *)((char *)&v176.m11 + 1) = v186[0];
        *(_OWORD *)&v176.m13 = *(_OWORD *)((char *)v186 + 15);
        *(_QWORD *)&v176.m21 = v129;
        *(_OWORD *)&v176.m22 = v169;
        LOBYTE(v176.m24) = 1;
      }
      LAUI_CA_utilities::set_layer_geometry(v146, (LAUI_CA_utilities::spring_factory *)&v176, v136 + v148 * v140, v138 + v150 * v142, v143, v144, v140, v142);
      if (LOBYTE(v176.m24))

      if (animated)
      left = (LAUIPearlGlyphLabel *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v152 = left;
          left = (LAUIPearlGlyphLabel *)left->super.super.super.isa;
        }
        while (left);
      }
      else
      {
        do
        {
          v152 = (LAUIPearlGlyphLabel *)begin_node[2].__value_.__left_;
          v153 = v152->super.super.super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CALayer *__unsafe_unretained, CALayer *>, void *>>> *)v152;
        }
        while (!v153);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CALayer *__unsafe_unretained, CALayer *>, void *>>> *)v152;
    }
    while (v152 != (LAUIPearlGlyphLabel *)&self->_masks.__tree_.__pair1_);
  }

  if (animated)
}

- (void)invalidate
{
  -[LAUIPearlGlyphView invalidate](self->_glyph, "invalidate");
}

- (BOOL)inApplicationContext
{
  return -[LAUIPearlGlyphView inApplicationContext](self->_glyph, "inApplicationContext");
}

- (void)setInApplicationContext:(BOOL)a3
{
  -[LAUIPearlGlyphView setInApplicationContext:](self->_glyph, "setInApplicationContext:", a3);
}

- (void)setStyle:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_style != a3)
  {
    v4 = a4;
    self->_style = a3;
    -[LAUIPearlGlyphLabel _applyStyle](self, "_applyStyle");
    -[LAUIPearlGlyphLabel _applyVisibilityAnimated:](self, "_applyVisibilityAnimated:", v4);
  }
}

- (void)setShimmerEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_shimmerEnabled != a3)
  {
    v4 = a4;
    self->_shimmerEnabled = a3;
    self->_visibleNeedsUpdate = 1;
    -[LAUIPearlGlyphLabel _updateGlyphPaused](self, "_updateGlyphPaused");
    -[LAUIPearlGlyphLabel _updateVisibilityAnimated:](self, "_updateVisibilityAnimated:", v4);
  }
}

- (void)setText:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  NSString *v6;
  NSString *text;
  _BOOL4 v8;
  BOOL v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  BOOL v14;
  _BOOL4 v15;
  NSString *v16;
  NSString *v17;

  v4 = a4;
  v16 = (NSString *)a3;
  if (-[NSString length](v16, "length"))
  {
    v6 = v16;
  }
  else
  {

    v6 = 0;
  }
  text = self->_text;
  if (text == v6
    || (v17 = v6) != 0 && text && (v8 = -[NSString isEqualToString:](text, "isEqualToString:", v6), v6 = v17, v8))
  {
    v9 = v4 && self->_textUpdateNeedsAnimation;
    self->_textUpdateNeedsAnimation = v9;
  }
  else
  {
    v10 = (NSString *)-[NSString copy](v6, "copy");
    v11 = self->_text;
    self->_text = v10;

    -[UILabel text](self->_label, "text");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = self->_text;
    if (v13 == v12)
    {
      LOBYTE(v15) = 0;
    }
    else
    {
      if (v13)
        v14 = v12 == 0;
      else
        v14 = 1;
      if (v14)
        LOBYTE(v15) = 1;
      else
        v15 = !-[NSString isEqualToString:](v13, "isEqualToString:", v12);
    }
    self->_textNeedsUpdate = v15;
    self->_textUpdateNeedsAnimation = v15 && v4;
    -[LAUIPearlGlyphLabel _updateText](self, "_updateText");

    v6 = v17;
  }

}

- (void)setMaximumSize:(CGSize)a3 animated:(BOOL)a4
{
  if (a3.width <= 0.0)
    a3.width = 1.79769313e308;
  if (a3.height <= 0.0)
    a3.height = 1.79769313e308;
  if (self->_maximumSize.width != a3.width || self->_maximumSize.height != a3.height)
  {
    self->_maximumSize = a3;
    -[LAUIPearlGlyphLabel _updateFontAnimated:](self, "_updateFontAnimated:", a4);
  }
}

- (void)_updateGlyphPaused
{
  LAUIPearlGlyphView *glyph;
  _BOOL8 v4;

  glyph = self->_glyph;
  v4 = !self->_inWindow || !self->_text || !self->_shimmerEnabled;
  -[LAUIPearlGlyphView setPaused:](glyph, "setPaused:", v4);
}

- (void)_updateText
{
  _BOOL4 textUpdateNeedsAnimation;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  float v16;
  void *v17;
  id v18;
  double v19;
  float v20;
  id v21;
  void *v22;
  char v23;
  _BYTE v24[31];
  id v25;
  __int128 v26;
  char v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id location;
  _OWORD v32[8];
  _BYTE v33[32];
  void *v34;
  __int128 v35;
  __int128 v36;
  _OWORD v37[2];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  -[LAUIPearlGlyphLabel _updateGlyphPaused](self, "_updateGlyphPaused");
  if ((self->_inWindow || !self->_textUpdateNeedsAnimation) && self->_textNeedsUpdate)
  {
    self->_textNeedsUpdate = 0;
    textUpdateNeedsAnimation = self->_textUpdateNeedsAnimation;
    if (self->_textUpdateNeedsAnimation)
    {
      LAUI_CA_utilities::spring_factory::spring_factory((LAUI_CA_utilities::spring_factory *)v33, 1.0, 199.791, 25.4425, 0.0, 0);
      v4 = v33[0];
      v36 = v35;
      v37[0] = *(_OWORD *)&v33[1];
      *(_OWORD *)((char *)v37 + 15) = *(_OWORD *)&v33[16];
      v22 = v34;
      if (self->_textUpdateNeedsAnimation)
      {
        -[UILabel text](self->_label, "text");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          -[UILabel snapshotViewAfterScreenUpdates:](self->_label, "snapshotViewAfterScreenUpdates:", 0);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)v33 = v6;

          if (v6)
          {
            -[UILabel layer](self->_label, "layer");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "presentationLayer");
            v8 = objc_claimAutoreleasedReturnValue();
            v9 = (void *)v8;
            if (v8)
              v10 = (void *)v8;
            else
              v10 = v7;
            v11 = v10;

            objc_msgSend(v6, "layer");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "opacity");
            objc_msgSend(v12, "setOpacity:");
            objc_msgSend(v11, "position");
            objc_msgSend(v12, "setPosition:");
            objc_msgSend(v11, "bounds");
            objc_msgSend(v12, "setBounds:");
            if (v11)
              objc_msgSend(v11, "transform");
            else
              memset(v32, 0, sizeof(v32));
            objc_msgSend(v12, "setTransform:", v32);

          }
        }
        else
        {
          *(_QWORD *)v33 = 0;

          v6 = 0;
        }
      }
      else
      {
        v6 = 0;
        *(_QWORD *)v33 = 0;
      }
    }
    else
    {
      v6 = 0;
      v4 = 0;
      *(_QWORD *)v33 = 0;
    }
    -[UILabel setText:](self->_label, "setText:", self->_text);
    -[UILabel sizeToFit](self->_label, "sizeToFit");
    -[LAUIPearlGlyphLabel setNeedsLayout](self, "setNeedsLayout");
    -[LAUIPearlGlyphLabel layoutIfNeeded](self, "layoutIfNeeded");
    -[UILabel layer](self->_label, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeAllAnimations");
    LODWORD(v14) = 0;
    objc_msgSend(v13, "setOpacity:", v14);
    if (textUpdateNeedsAnimation && v6)
    {
      objc_msgSend(v6, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "opacity");
      if (v16 > 0.0)
      {
        std::vector<UIView * {__strong}>::emplace_back<UIView * {__strong}&>((char **)&self->_labelSnapshots, (id *)v33);
        -[UIView insertSubview:belowSubview:](self->_labelContainer, "insertSubview:belowSubview:", *(_QWORD *)v33, self->_label);
        objc_msgSend(MEMORY[0x24BDE57D8], "begin");
        objc_initWeak(&location, self);
        v17 = (void *)MEMORY[0x24BDE57D8];
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __34__LAUIPearlGlyphLabel__updateText__block_invoke;
        v28[3] = &unk_24C27EC10;
        v29 = *(id *)v33;
        objc_copyWeak(&v30, &location);
        objc_msgSend(v17, "setCompletionBlock:", v28);
        v23 = v4;
        *(_OWORD *)v24 = v37[0];
        *(_OWORD *)&v24[15] = *(_OWORD *)((char *)v37 + 15);
        v25 = v22;
        v26 = v36;
        v27 = 1;
        v18 = v15;
        objc_msgSend(v18, "opacity");
        v20 = *(float *)&v19;
        if (*(float *)&v19 != 0.0)
        {
          LODWORD(v19) = 0;
          objc_msgSend(v18, "setOpacity:", v19);
          v21 = LAUI_CA_utilities::add_additive_animation<double>(v18, CFSTR("opacity"), (LAUI_CA_utilities::spring_factory *)&v23, v20, 0.0);
        }

        if (v27)
        objc_msgSend(MEMORY[0x24BDE57D8], "commit");
        objc_destroyWeak(&v30);

        objc_destroyWeak(&location);
      }

    }
    -[LAUIPearlGlyphLabel _updateVisibilityAnimated:](self, "_updateVisibilityAnimated:", self->_textUpdateNeedsAnimation);

    if (textUpdateNeedsAnimation)
  }
}

void __34__LAUIPearlGlyphLabel__updateText__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  char **v3;
  void **v4;
  void **v5;
  char *v6;
  char *v7;
  char *i;
  void *v9;
  _QWORD *v10;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (char **)(WeakRetained + 61);
    v5 = (void **)WeakRetained[61];
    v4 = (void **)WeakRetained[62];
    if (v5 != v4)
    {
      while (*v5 != *(void **)(a1 + 32))
      {
        if (++v5 == v4)
        {
          v5 = (void **)WeakRetained[62];
          break;
        }
      }
    }
    if (v5 != v4)
    {
      v10 = WeakRetained;
      std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,UIView * {__strong}*,UIView * {__strong}*,UIView * {__strong}*,0>(v5 + 1, v4, v5);
      v7 = v6;
      for (i = v3[1]; i != v7; i -= 8)
      {
        v9 = (void *)*((_QWORD *)i - 1);

      }
      v3[1] = v7;
      std::vector<UIView * {__strong}>::shrink_to_fit(v3);
      WeakRetained = v10;
    }
  }

}

- (void)_applyStyle
{
  int64_t style;
  UIColor *v4;
  UIColor *v5;
  void *v6;
  double v7;
  double v8;
  UIColor *v9;
  UIColor *backgroundColor;
  UIColor *v11;
  UIColor *textColor;

  style = self->_style;
  if (style == 1)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.5);
    v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v9;

    v6 = (void *)MEMORY[0x24BDF6950];
    v7 = 0.6;
    v8 = 1.0;
  }
  else
  {
    if (style)
      return;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.45);
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_backgroundColor;
    self->_backgroundColor = v4;

    v6 = (void *)MEMORY[0x24BDF6950];
    v7 = 0.8;
    v8 = 0.0;
  }
  objc_msgSend(v6, "colorWithWhite:alpha:", v8, v7);
  v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
  textColor = self->_textColor;
  self->_textColor = v11;

}

- (void)_updateVisibilityAnimated:(BOOL)a3
{
  void *v3;
  _BOOL8 v4;
  NSString *text;
  int v7;
  int visible;
  BOOL v9;
  OS_dispatch_source *visibilityTimer;
  char v11;
  void *v12;
  double v13;
  id v14;
  double v15;
  double v16;
  id v17;
  char v18;
  _BYTE v19[31];
  id v20;
  __int128 v21;
  char v22;
  char v23;
  _BYTE v24[31];
  void *v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[2];
  uint64_t v29;

  v4 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  text = self->_text;
  v7 = text != 0;
  visible = self->_visible;
  if (visible != v7 || self->_visibleNeedsUpdate)
  {
    if (text)
      v9 = visible == 0;
    else
      v9 = 0;
    if (v9)
      goto LABEL_9;
    if (!text)
    {
      LOBYTE(visibilityTimer) = 0;
      goto LABEL_14;
    }
    visibilityTimer = self->_visibilityTimer;
    if (visibilityTimer)
LABEL_9:
      LOBYTE(visibilityTimer) = a3;
LABEL_14:
    self->_allowDelayedVisibility = (char)visibilityTimer;
    *(_WORD *)&self->_visible = v7;
    -[LAUIPearlGlyphLabel _applyVisibilityAnimated:](self, "_applyVisibilityAnimated:", a3);
    return;
  }
  if (!self->_visibilityTimer)
  {
    if (a3)
    {
      LAUI_CA_utilities::spring_factory::spring_factory((LAUI_CA_utilities::spring_factory *)&v23, 1.0, 199.791, 25.4425, 0.0, 0);
      v11 = v23;
      v28[0] = *(_OWORD *)v24;
      *(_OWORD *)((char *)v28 + 15) = *(_OWORD *)&v24[15];
      v3 = v25;
      v27 = v26;
    }
    else
    {
      v11 = 0;
    }
    -[UILabel layer](self->_label, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v22 = 0;
    if (v4)
    {
      v18 = v11;
      *(_OWORD *)v19 = v28[0];
      *(_OWORD *)&v19[15] = *(_OWORD *)((char *)v28 + 15);
      v20 = v3;
      v21 = v27;
      v22 = 1;
    }
    if (text)
      v13 = 1.0;
    else
      v13 = 0.0;
    v14 = v12;
    objc_msgSend(v14, "opacity");
    v16 = *(float *)&v15;
    if (*(float *)&v15 != v13)
    {
      LODWORD(v15) = 0;
      if (text)
        *(float *)&v15 = 1.0;
      objc_msgSend(v14, "setOpacity:", v15);
      if (v4)
        v17 = LAUI_CA_utilities::add_additive_animation<double>(v14, CFSTR("opacity"), (LAUI_CA_utilities::spring_factory *)&v18, v16, v13);
    }

    if (v22)
    -[LAUIPearlGlyphLabel _updateBoundsSizeAnimated:](self, "_updateBoundsSizeAnimated:", v4);
    if (v4)

  }
}

- (void)_applyVisibilityAnimated:(BOOL)a3
{
  _BOOL4 reduceBlur;
  _BOOL4 shimmerEnabled;
  _BOOL4 visible;
  CABackdropLayer *v8;
  void *v9;
  int v10;
  double v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  char v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  char v28;
  double v29;
  double v30;
  double v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  UIColor *backgroundColor;
  UIColor *v37;
  UIColor *v38;
  UIColor *v39;
  UIColor *v40;
  UIColor *v41;
  char v42;
  void *animation;
  UIColor *v44;
  UIColor *textColor;
  BOOL v46;
  int v47;
  UIColor *v48;
  UIColor *v49;
  UIColor *v50;
  UIColor *v51;
  char v52;
  void *v53;
  double v54;
  int v55;
  id v56;
  double v57;
  double v58;
  id v59;
  NSObject *visibilityTimer;
  OS_dispatch_source *v61;
  OS_dispatch_source *v62;
  OS_dispatch_source *v63;
  NSObject *v64;
  dispatch_time_t v65;
  NSObject *v66;
  void *v67;
  BOOL v68;
  int v69;
  int v70;
  _BOOL4 v71;
  void *v72;
  id to;
  __int16 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  __int128 v78;
  char v79;
  id location;
  _OWORD v81[2];
  id v82;
  __int128 v83;
  char v84;
  __int128 v85;
  __int128 v86;
  id v87;
  __int128 v88;
  unsigned __int8 v89;
  __int128 v90;
  __int128 v91;
  id v92;
  _BYTE v93[24];
  __int128 v94;
  id v95;
  __int128 v96;
  char v97;

  if (self->_glyph)
  {
    reduceBlur = self->_reduceBlur;
    shimmerEnabled = self->_shimmerEnabled;
  }
  else
  {
    shimmerEnabled = 0;
    reduceBlur = 1;
  }
  visible = self->_visible;
  if (a3)
  {
    LAUI_CA_utilities::spring_factory::spring_factory((LAUI_CA_utilities::spring_factory *)&v90, 1.0, 199.791, 25.4425, 0.0, 0);
    v85 = v90;
    v86 = v91;
    v87 = v92;
    v88 = *(_OWORD *)v93;
    v89 = 1;
  }
  else
  {
    LOBYTE(v85) = 0;
    v89 = 0;
  }
  -[CABackdropLayer setEnabled:](self->_background, "setEnabled:", !reduceBlur);
  v8 = self->_background;
  -[CABackdropLayer presentationLayer](v8, "presentationLayer");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[CABackdropLayer valueForKeyPath:](v8, "valueForKeyPath:", CFSTR("filters.saturation.inputAmount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = shimmerEnabled;
  v71 = visible;
  v10 = !visible || reduceBlur;
  v11 = 1.5;
  if (v10)
    v11 = 1.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  v14 = v12;
  v15 = v14;
  if (v13 == v14)
  {

  }
  else
  {
    if (v13)
      v16 = v14 == 0;
    else
      v16 = 1;
    if (v16)
    {

    }
    else
    {
      v17 = objc_msgSend(v13, "isEqual:", v14);

      if ((v17 & 1) != 0)
        goto LABEL_23;
    }
    -[CABackdropLayer setValue:forKeyPath:](v8, "setValue:forKeyPath:", v15, CFSTR("filters.saturation.inputAmount"));
    if (v89)
    {
      objc_msgSend(v13, "doubleValue");
      v19 = v18;
      objc_msgSend(v15, "doubleValue");
      v21 = LAUI_CA_utilities::add_additive_animation<double>(v8, CFSTR("filters.saturation.inputAmount"), (LAUI_CA_utilities::spring_factory *)&v85, v19, v20);
    }
  }
LABEL_23:
  -[CABackdropLayer valueForKeyPath:](v8, "valueForKeyPath:", CFSTR("filters.blur.inputRadius"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v10;
  if (v10)
    v23 = 0;
  else
    v23 = 20;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v22;
  v26 = v24;
  v27 = v26;
  if (v25 == v26)
  {

    goto LABEL_35;
  }
  if (v25 && v26)
  {
    v28 = objc_msgSend(v25, "isEqual:", v26);

    if ((v28 & 1) != 0)
      goto LABEL_35;
  }
  else
  {

  }
  -[CABackdropLayer setValue:forKeyPath:](v8, "setValue:forKeyPath:", v27, CFSTR("filters.blur.inputRadius"));
  if (v89)
  {
    objc_msgSend(v25, "doubleValue");
    v30 = v29;
    objc_msgSend(v27, "doubleValue");
    v32 = LAUI_CA_utilities::add_additive_animation<double>(v8, CFSTR("filters.blur.inputRadius"), (LAUI_CA_utilities::spring_factory *)&v85, v30, v31);
  }
LABEL_35:
  v33 = (void *)MEMORY[0x24BDF6950];
  v34 = objc_msgSend(v72, "backgroundColor");
  if (!v34)
    v34 = -[CABackdropLayer backgroundColor](v8, "backgroundColor");
  objc_msgSend(v33, "colorWithCGColor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  backgroundColor = self->_backgroundColor;
  v68 = a3;
  if (v71)
  {
    if (reduceBlur)
    {
      -[UIColor colorWithAlphaComponent:](backgroundColor, "colorWithAlphaComponent:", 1.0);
      v37 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = backgroundColor;
    }
  }
  else
  {
    -[UIColor colorWithAlphaComponent:](backgroundColor, "colorWithAlphaComponent:", 0.0);
    v37 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v38 = v37;
  v39 = v35;
  v40 = v38;
  v41 = v40;
  if (v39 == v40)
  {

    animation = v39;
LABEL_51:

    goto LABEL_52;
  }
  if (!v39 || !v40)
  {

    goto LABEL_49;
  }
  v42 = -[UIColor isEqual:](v39, "isEqual:", v40);

  if ((v42 & 1) == 0)
  {
LABEL_49:
    v44 = objc_retainAutorelease(v41);
    -[CABackdropLayer setBackgroundColor:](v8, "setBackgroundColor:", -[UIColor CGColor](v44, "CGColor"));
    -[CABackdropLayer removeAnimationForKey:](v8, "removeAnimationForKey:", CFSTR("backgroundColor"));
    if (!v89)
      goto LABEL_52;
    animation = LAUI_CA_utilities::spring_factory::create_animation((LAUI_CA_utilities::spring_factory *)&v85, CFSTR("backgroundColor"));
    objc_msgSend(animation, "setAdditive:", 0);
    objc_msgSend(animation, "setFromValue:", -[UIColor CGColor](objc_retainAutorelease(v39), "CGColor"));
    objc_msgSend(animation, "setToValue:", -[UIColor CGColor](objc_retainAutorelease(v44), "CGColor"));
    -[CABackdropLayer addAnimation:forKey:](v8, "addAnimation:forKey:", animation, CFSTR("backgroundColor"));
    goto LABEL_51;
  }
LABEL_52:

  textColor = self->_textColor;
  if (self->_reduceBlur)
  {
    -[UIColor colorWithAlphaComponent:](textColor, "colorWithAlphaComponent:", 1.0);
    v46 = v68;
    v47 = v70;
    v48 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v48 = textColor;
    v46 = v68;
    v47 = v70;
  }
  -[UILabel textColor](self->_label, "textColor");
  v49 = (UIColor *)(id)objc_claimAutoreleasedReturnValue();
  v50 = v48;
  v51 = v50;
  if (v49 == v50)
  {

    goto LABEL_63;
  }
  if (!v50 || !v49)
  {

    goto LABEL_62;
  }
  v52 = -[UIColor isEqual:](v49, "isEqual:", v50);

  if ((v52 & 1) == 0)
LABEL_62:
    -[UILabel setTextColor:](self->_label, "setTextColor:", v51);
LABEL_63:

  -[UIView layer](self->_glyphContainer, "layer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (double)v69;
  LOBYTE(v81[0]) = 0;
  v84 = 0;
  v55 = v89;
  if (v89)
  {
    v81[0] = v85;
    v81[1] = v86;
    v82 = v87;
    v83 = v88;
    v84 = 1;
  }
  if (v47)
    v54 = 0.0;
  v56 = v53;
  objc_msgSend(v56, "opacity");
  v58 = *(float *)&v57;
  if (v54 != *(float *)&v57)
  {
    *(float *)&v57 = v54;
    objc_msgSend(v56, "setOpacity:", v57);
    if (v55)
      v59 = LAUI_CA_utilities::add_additive_animation<double>(v56, CFSTR("opacity"), (LAUI_CA_utilities::spring_factory *)v81, v58, v54);
  }

  if (v84)
  objc_initWeak(&location, self);
  objc_copyWeak(&to, &location);
  LOBYTE(v74) = v71;
  HIBYTE(v74) = v46;
  LOBYTE(v75) = 0;
  v79 = 0;
  if (v89)
  {
    v75 = v85;
    v76 = v86;
    v77 = v87;
    v78 = v88;
    v79 = 1;
  }
  visibilityTimer = self->_visibilityTimer;
  if (visibilityTimer)
  {
    dispatch_source_cancel(visibilityTimer);
    v61 = self->_visibilityTimer;
    self->_visibilityTimer = 0;

  }
  if (self->_allowDelayedVisibility)
  {
    v62 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    v63 = self->_visibilityTimer;
    self->_visibilityTimer = v62;

    v64 = self->_visibilityTimer;
    v65 = dispatch_time(0, 120000000);
    dispatch_source_set_timer(v64, v65, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    v66 = self->_visibilityTimer;
    *(_QWORD *)&v90 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v90 + 1) = 3321888768;
    *(_QWORD *)&v91 = ___ZZ48__LAUIPearlGlyphLabel__applyVisibilityAnimated__ENK3__2cvU13block_pointerFvvEEv_block_invoke;
    *((_QWORD *)&v91 + 1) = &__block_descriptor_112_ea8_32c61_ZTSKZ48__LAUIPearlGlyphLabel__applyVisibilityAnimated__E3__2_e5_v8__0l;
    objc_copyWeak(&v92, &to);
    *(_WORD *)v93 = v74;
    v93[8] = 0;
    v97 = 0;
    if (v79)
    {
      *(_OWORD *)&v93[8] = v75;
      v94 = v76;
      v95 = v77;
      v96 = v78;
      v97 = 1;
    }
    v67 = (void *)MEMORY[0x20BD1B708](&v90);
    if (v97)

    objc_destroyWeak(&v92);
    dispatch_source_set_event_handler(v66, v67);

    dispatch_resume((dispatch_object_t)self->_visibilityTimer);
  }
  else
  {
    -[LAUIPearlGlyphLabel _applyVisibilityAnimated:]::$_2::operator()((uint64_t)&to);
  }
  if (v79)

  objc_destroyWeak(&to);
  objc_destroyWeak(&location);
  if (v89)

}

- (void)_applyVisibilityAnimated:
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD *v11;
  __int128 v12;
  void *v13;
  unsigned int v14;
  int v15;
  __int128 v16;
  id v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  int v22;
  int v23;
  __int128 v24;
  double v25;
  id v26;
  double v27;
  double v28;
  id v29;
  _OWORD v30[2];
  id v31;
  __int128 v32;
  char v33;
  _OWORD v34[2];
  id v35;
  __int128 v36;
  char v37;
  _OWORD v38[2];
  id v39;
  __int128 v40;
  char v41;
  CATransform3D v42;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)a1);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[71];
    if (v4)
    {
      dispatch_source_cancel(v4);
      v5 = v3[71];
      v3[71] = 0;

    }
    -[NSObject layer](v3[52], "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 8))
    {
      v7 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
      *(_OWORD *)&v42.m31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
      *(_OWORD *)&v42.m33 = v7;
      v8 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
      *(_OWORD *)&v42.m41 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
      *(_OWORD *)&v42.m43 = v8;
      v9 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
      *(_OWORD *)&v42.m11 = *MEMORY[0x24BDE5598];
      *(_OWORD *)&v42.m13 = v9;
      v10 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
      *(_OWORD *)&v42.m21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
      *(_OWORD *)&v42.m23 = v10;
    }
    else
    {
      CATransform3DMakeScale(&v42, 1.1, 1.1, 1.0);
    }
    v11 = (_OWORD *)(a1 + 16);
    LOBYTE(v38[0]) = 0;
    v41 = 0;
    if (*(_BYTE *)(a1 + 72))
    {
      v12 = *(_OWORD *)(a1 + 32);
      v38[0] = *v11;
      v38[1] = v12;
      v39 = *(id *)(a1 + 48);
      v40 = *(_OWORD *)(a1 + 56);
      v41 = 1;
    }
    LAUI_CA_utilities::set_layer_transform(v6, (__int128 *)&v42, (LAUI_CA_utilities::spring_factory *)v38);
    if (v41)

    -[NSObject layer](v3[55], "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(unsigned __int8 *)(a1 + 8);
    LOBYTE(v34[0]) = 0;
    v37 = 0;
    v15 = *(unsigned __int8 *)(a1 + 72);
    if (*(_BYTE *)(a1 + 72))
    {
      v16 = *(_OWORD *)(a1 + 32);
      v34[0] = *v11;
      v34[1] = v16;
      v35 = *(id *)(a1 + 48);
      v36 = *(_OWORD *)(a1 + 56);
      v37 = 1;
    }
    v17 = v13;
    objc_msgSend(v17, "opacity");
    v19 = *(float *)&v18;
    if (*(float *)&v18 != (double)v14)
    {
      *(float *)&v18 = (float)v14;
      objc_msgSend(v17, "setOpacity:", v18);
      if (v15)
        v20 = LAUI_CA_utilities::add_additive_animation<double>(v17, CFSTR("opacity"), (LAUI_CA_utilities::spring_factory *)v34, v19, (double)v14);
    }

    if (v37)
    -[NSObject layer](v3[57], "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(unsigned __int8 *)(a1 + 8);
    LOBYTE(v30[0]) = 0;
    v33 = 0;
    v23 = *(unsigned __int8 *)(a1 + 72);
    if (*(_BYTE *)(a1 + 72))
    {
      v24 = *(_OWORD *)(a1 + 32);
      v30[0] = *v11;
      v30[1] = v24;
      v31 = *(id *)(a1 + 48);
      v32 = *(_OWORD *)(a1 + 56);
      v33 = 1;
    }
    if (v22)
      v25 = 0.35;
    else
      v25 = 1.0;
    v26 = v21;
    objc_msgSend(v26, "opacity", *(_QWORD *)&v30[0]);
    v28 = *(float *)&v27;
    if (v25 != *(float *)&v27)
    {
      *(float *)&v27 = v25;
      objc_msgSend(v26, "setOpacity:", v27);
      if (v23)
        v29 = LAUI_CA_utilities::add_additive_animation<double>(v26, CFSTR("opacity"), (LAUI_CA_utilities::spring_factory *)v30, v28, v25);
    }

    if (v33)
    objc_msgSend(v3, "_updateBoundsSizeAnimated:", *(unsigned __int8 *)(a1 + 9));
    *((_BYTE *)v3 + 578) = 0;
    *((_BYTE *)v3 + 581) = 0;
  }

}

- (id)_applyVisibilityAnimated:(id *)location
{
  if (*((_BYTE *)location + 72))

  objc_destroyWeak(location);
  return location;
}

- (void)_updateBoundsSizeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float64x2_t v24;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  double v36;
  id v38;
  int8x16_t v39;
  float64_t v40;
  float64_t v41;
  float64_t v42;
  float64_t v43;
  float64_t v44;
  float64_t v45;
  double v46;
  _BYTE v47[32];
  id v48;
  _QWORD v49[9];
  float64x2_t v50;

  v3 = a3;
  -[UILabel bounds](self->_label, "bounds");
  self->_currentMaximumSize = self->_maximumSize;
  self->_currentLabelSize.width = v5;
  self->_currentLabelSize.height = v6;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  -[LAUIPearlGlyphLabel layer](self, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anchorPoint");
  v44 = v12;
  v45 = v11;
  objc_msgSend(v10, "position");
  v42 = v14;
  v43 = v13;
  -[LAUIPearlGlyphLabel sizeThatFits:](self, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v40 = v16;
  v41 = v15;
  v39 = *(int8x16_t *)MEMORY[0x24BDF7BF0];
  objc_msgSend(v10, "bounds");
  v20 = v19;
  v22 = v21;
  v23 = fmax(v9, 1.0);
  v24.f64[0] = v45;
  v24.f64[1] = v44;
  __asm { FMOV            V3.2D, #1.0 }
  v29 = vsubq_f64(_Q3, v24);
  v30.f64[0] = v41;
  v30.f64[1] = v40;
  v31.f64[0] = v43;
  v31.f64[1] = v42;
  v32 = vmlsq_f64(v31, v30, v24);
  v33 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v23, 0);
  v34 = vmlaq_f64(v31, v30, v29);
  v35 = vaddq_f64(v30, (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(v30), (int8x16_t)vaddq_f64(vsubq_f64(v32, vdivq_f64(vrndmq_f64(vmulq_n_f64(v32, v23)), v33)), vsubq_f64(vdivq_f64(vrndpq_f64(vmulq_n_f64(v34, v23)), v33), v34)), v39));
  v36 = v35.f64[1];
  if (v20 != v35.f64[0] || v22 != v35.f64[1])
  {
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __49__LAUIPearlGlyphLabel__updateBoundsSizeAnimated___block_invoke;
    v49[3] = &unk_24C27EC38;
    v49[4] = self;
    v49[5] = v17;
    v49[6] = v18;
    *(double *)&v49[7] = v20;
    *(double *)&v49[8] = v22;
    v46 = v35.f64[0];
    v50 = v35;
    objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v49);
    if (v3)
    {
      LAUI_CA_utilities::spring_factory::spring_factory((LAUI_CA_utilities::spring_factory *)v47, 1.0, 199.791, 25.4425, 0.0, 0);
      v38 = LAUI_CA_utilities::add_additive_animation<CGSize>(v10, CFSTR("bounds.size"), (LAUI_CA_utilities::spring_factory *)v47, v20, v22, v46, v36);

    }
    -[LAUIPearlGlyphLabel setNeedsLayout](self, "setNeedsLayout");
    -[LAUIPearlGlyphLabel layoutIfNeededAnimated:](self, "layoutIfNeededAnimated:", v3);
  }

}

uint64_t __49__LAUIPearlGlyphLabel__updateBoundsSizeAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

- (void)_updateReduceBlurState
{
  _BOOL4 v3;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v3 = UIAccessibilityIsReduceTransparencyEnabled() || UIAccessibilityIsReduceMotionEnabled();
  if (self->_reduceBlur != v3)
  {
    self->_reduceBlur = v3;
    -[LAUIPearlGlyphLabel _applyVisibilityAnimated:](self, "_applyVisibilityAnimated:", 0);
  }
}

- (void)_updateFontAnimated:(BOOL)a3
{
  UIFont *v5;
  UIFont *baseFont;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIFont *v14;
  void *v15;
  double height;
  uint64_t v19;
  NSString *text;
  id v21;
  UIFont *v22;
  UIFont *v23;
  id v24;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
  v5 = (UIFont *)objc_claimAutoreleasedReturnValue();
  baseFont = self->_baseFont;
  self->_baseFont = v5;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "scale");
  v8 = v7;

  v22 = self->_baseFont;
  -[UIFont lineHeight](v22, "lineHeight");
  v10 = v9;
  -[UIFont leading](v22, "leading");
  v11 = fmax(v8, 1.0);
  v13 = ceil(v11 * (v10 + v12)) / v11 + 5.0 + 5.0;

  v14 = self->_baseFont;
  v15 = v14;
  height = self->_maximumSize.height;
  if (v13 > height && height > 10.0 && v13 > 10.0)
  {
    v23 = v14;
    -[UIFont _fontScaledByScaleFactor:](v14, "_fontScaledByScaleFactor:", (height + -10.0) / (v13 + -10.0));
    v19 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v19;
  }
  v24 = v15;
  -[UILabel setFont:](self->_label, "setFont:", v15);
  if (self->_textNeedsUpdate)
  {
    self->_textNeedsUpdate = 1;
  }
  else
  {
    text = self->_text;
    self->_textNeedsUpdate = text != 0;
    if (!text)
      goto LABEL_15;
  }
  LOBYTE(text) = self->_textUpdateNeedsAnimation || a3;
LABEL_15:
  self->_textUpdateNeedsAnimation = (char)text;
  -[LAUIPearlGlyphLabel _updateText](self, "_updateText");

}

- (void)boldTextStatusDidChange:(id)a3
{
  -[LAUIPearlGlyphLabel _updateFontAnimated:](self, "_updateFontAnimated:", 0);
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  -[LAUIPearlGlyphLabel _updateFontAnimated:](self, "_updateFontAnimated:", 0);
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)isShimmerEnabled
{
  return self->_shimmerEnabled;
}

- (NSString)text
{
  return self->_text;
}

- (CGSize)maximumSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumSize.width;
  height = self->_maximumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  vector<UIView *, std::allocator<UIView *>> *p_labelSnapshots;

  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_visibilityTimer, 0);
  objc_storeStrong((id *)&self->_baseFont, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  p_labelSnapshots = &self->_labelSnapshots;
  std::vector<UIView * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_labelSnapshots);
  std::__tree<std::__value_type<CALayer *,CALayer * {__strong}>,std::__map_value_compare<CALayer * {__strong},std::__map_value_compare,std::less<CALayer * {__strong}>,true>,std::allocator<std::__map_value_compare>>::destroy((uint64_t)&self->_masks, (_QWORD *)self->_masks.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_glyphContainer, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_labelContainer, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 60) = 0;
  *((_QWORD *)self + 59) = 0;
  *((_QWORD *)self + 58) = (char *)self + 472;
  *((_QWORD *)self + 62) = 0;
  *((_QWORD *)self + 63) = 0;
  *((_QWORD *)self + 61) = 0;
  return self;
}

@end
