@implementation CCUICellularMenuModuleItemIndicatorView

- (CCUICellularMenuModuleItemIndicatorView)init
{
  CCUICellularMenuModuleItemIndicatorView *v2;
  CCUICellularMenuModuleItemIndicatorView *v3;
  UILabel *v4;
  UILabel *indicatorLabel;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  UILabel *v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  UILabel *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  double v53;
  const char *v54;
  double v55;
  const char *v56;
  double v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  void *v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  void *v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  void *v120;
  const char *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  const char *v133;
  void *v134;
  const char *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  void *v146;
  const char *v147;
  objc_super v149;

  v149.receiver = self;
  v149.super_class = (Class)CCUICellularMenuModuleItemIndicatorView;
  v2 = -[CCUICellularMenuModuleItemIndicatorView init](&v149, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_fontSize = 10.0;
    v2->_cornerRadius = 2.0;
    v2->_minPadding = 3.5;
    v2->_baseline = 3.0;
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    indicatorLabel = v3->_indicatorLabel;
    v3->_indicatorLabel = v4;

    objc_msgSend_defaultMetrics(MEMORY[0x24BDF6A80], v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_systemFontOfSize_(MEMORY[0x24BDF6A70], v9, v10, v3->_fontSize);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_scaledFontForFont_(v8, v12, (uint64_t)v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_fontDescriptor(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fontDescriptorWithSymbolicTraits_(v16, v17, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v3->_indicatorLabel;
    objc_msgSend_fontWithDescriptor_size_(MEMORY[0x24BDF6A70], v20, (uint64_t)v18, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFont_(v19, v22, (uint64_t)v21);

    objc_msgSend_setAdjustsFontForContentSizeCategory_(v3->_indicatorLabel, v23, 1);
    objc_msgSend_setNumberOfLines_(v3->_indicatorLabel, v24, 1);
    v25 = v3->_indicatorLabel;
    objc_msgSend_blackColor(MEMORY[0x24BDF6950], v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTextColor_(v25, v29, (uint64_t)v28);

    objc_msgSend_setTextAlignment_(v3->_indicatorLabel, v30, 1);
    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v3->_indicatorLabel, v31, 0);
    objc_msgSend_setAdjustsFontForContentSizeCategory_(v3->_indicatorLabel, v32, 1);
    objc_msgSend_addSubview_(v3, v33, (uint64_t)v3->_indicatorLabel);
    objc_msgSend_systemGrayColor(MEMORY[0x24BDF6950], v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBackgroundColor_(v3, v37, (uint64_t)v36);

    objc_msgSend_layer(v3, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultMetrics(MEMORY[0x24BDF6A80], v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_scaledValueForValue_(v43, v44, v45, v3->_cornerRadius);
    objc_msgSend_setCornerRadius_(v40, v46, v47);

    objc_msgSend_layer(v3, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMasksToBounds_(v50, v51, 1);

    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v3, v52, 0);
    LODWORD(v53) = 1148846080;
    objc_msgSend_setContentCompressionResistancePriority_forAxis_(v3, v54, 0, v53);
    LODWORD(v55) = 1148846080;
    objc_msgSend_setContentCompressionResistancePriority_forAxis_(v3, v56, 1, v55);
    LODWORD(v57) = 1148846080;
    objc_msgSend_setContentHuggingPriority_forAxis_(v3, v58, 0, v57);
    objc_msgSend_widthAnchor(v3, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_heightAnchor(v3, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_constraintGreaterThanOrEqualToAnchor_multiplier_(v61, v65, (uint64_t)v64, 1.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setActive_(v66, v67, 1);

    objc_msgSend_heightAnchor(v3, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultMetrics(MEMORY[0x24BDF6A80], v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_scaledValueForValue_(v73, v74, v75, 13.0);
    objc_msgSend_constraintGreaterThanOrEqualToConstant_(v70, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setActive_(v78, v79, 1);

    objc_msgSend_topAnchor(v3, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_topAnchor(v3->_indicatorLabel, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultMetrics(MEMORY[0x24BDF6A80], v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_scaledValueForValue_(v88, v89, v90, v3->_minPadding);
    objc_msgSend_constraintGreaterThanOrEqualToAnchor_constant_(v82, v91, (uint64_t)v85);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setActive_(v92, v93, 1);

    objc_msgSend_trailingAnchor(v3, v94, v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trailingAnchor(v3->_indicatorLabel, v97, v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultMetrics(MEMORY[0x24BDF6A80], v100, v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_scaledValueForValue_(v102, v103, v104, v3->_minPadding);
    objc_msgSend_constraintGreaterThanOrEqualToAnchor_constant_(v96, v105, (uint64_t)v99);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setActive_(v106, v107, 1);

    objc_msgSend_leadingAnchor(v3->_indicatorLabel, v108, v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_leadingAnchor(v3, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultMetrics(MEMORY[0x24BDF6A80], v114, v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_scaledValueForValue_(v116, v117, v118, v3->_minPadding);
    objc_msgSend_constraintGreaterThanOrEqualToAnchor_constant_(v110, v119, (uint64_t)v113);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setActive_(v120, v121, 1);

    objc_msgSend_bottomAnchor(v3->_indicatorLabel, v122, v123);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bottomAnchor(v3, v125, v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultMetrics(MEMORY[0x24BDF6A80], v128, v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_scaledValueForValue_(v130, v131, v132, v3->_minPadding);
    objc_msgSend_constraintGreaterThanOrEqualToAnchor_constant_(v124, v133, (uint64_t)v127);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setActive_(v134, v135, 1);

    objc_msgSend_indicatorLabel(v3, v136, v137);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_centerYAnchor(v138, v139, v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_centerYAnchor(v3, v142, v143);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_constraintEqualToAnchor_(v141, v145, (uint64_t)v144);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setActive_(v146, v147, 1);

  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v2;
  double v4;
  double v5;
  double v6;
  double v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  objc_msgSend_intrinsicContentSize(self->_indicatorLabel, a2, v2);
  v5 = v4;
  v7 = v6;
  objc_msgSend_defaultMetrics(MEMORY[0x24BDF6A80], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scaledValueForValue_(v10, v11, v12, self->_minPadding);
  v14 = v5 + v13 * 2.0;
  objc_msgSend_defaultMetrics(MEMORY[0x24BDF6A80], v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scaledValueForValue_(v17, v18, v19, 13.0);
  v21 = v20;

  if (v7 < v21)
    v7 = v21;

  v22 = v14;
  v23 = v7;
  result.height = v23;
  result.width = v22;
  return result;
}

- (UILabel)indicatorLabel
{
  return self->_indicatorLabel;
}

- (void)setIndicatorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_indicatorLabel, a3);
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)minPadding
{
  return self->_minPadding;
}

- (void)setMinPadding:(double)a3
{
  self->_minPadding = a3;
}

- (double)baseline
{
  return self->_baseline;
}

- (void)setBaseline:(double)a3
{
  self->_baseline = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorLabel, 0);
}

@end
