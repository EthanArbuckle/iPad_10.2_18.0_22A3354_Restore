@implementation NTKUpNextThumbnailCell

+ (CGSize)suggestedBodyImageSizeForDevice:(id)a3
{
  double v3;
  double v4;
  _OWORD v5[2];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CGSize result;

  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  memset(v5, 0, sizeof(v5));
  _LayoutConstants_34(a3, v5);
  v3 = *(double *)&v8 - (*((double *)&v8 + 1) + *(double *)&v6 * 2.0 + *((double *)&v9 + 1));
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (NTKUpNextThumbnailCell)initWithFrame:(CGRect)a3
{
  NTKUpNextThumbnailCell *v3;
  NTKUpNextThumbnailCell *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  CLKFont *standardFont;
  uint64_t v20;
  CLKFont *boldFont;
  uint64_t v22;
  CLKFont *italicFont;
  uint64_t v24;
  void *v25;
  double v26;
  uint64_t v27;
  CLKUIColoringLabel *headerLabel;
  CLKUIColoringLabel *v29;
  void *v30;
  uint64_t v31;
  CLKUIColoringLabel *descriptionLine1Label;
  CLKUIColoringLabel *v33;
  void *v34;
  uint64_t v35;
  CLKUIColoringLabel *descriptionLine2Label;
  CLKUIColoringLabel *v37;
  void *v38;
  uint64_t v39;
  CLKUIColoringLabel *descriptionLine3Label;
  CLKUIColoringLabel *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  NTKUpNextImageView *v46;
  uint64_t v47;
  NTKUpNextImageView *imageView;
  void *v49;
  UILayoutGuide *v50;
  UILayoutGuide *labelLayoutGuide;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  UILayoutGuide *v58;
  UILayoutGuide *imageLayoutGuide;
  void *v60;
  void *v61;
  uint64_t v62;
  NSLayoutConstraint *imageLayoutGuideWidthConstraint;
  void *v64;
  uint64_t v65;
  NSLayoutConstraint *imageLayoutGuideHeightConstraint;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  void *v79;
  uint64_t v80;
  NSArray *withoutHeaderConstraints;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  NSArray *withHeaderConstraints;
  void *v90;
  void *v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  void *v98;
  uint64_t v99;
  NSArray *withDescription2Constraints;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  NSArray *withoutDescription2Constraints;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  NSArray *withDescription3Constraints;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  NSArray *withoutDescription3Constraints;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  objc_super v191;
  _QWORD v192[2];
  _QWORD v193[5];
  _QWORD v194[2];
  _QWORD v195[2];
  _QWORD v196[2];
  void *v197;
  _QWORD v198[18];

  v198[16] = *MEMORY[0x1E0C80C00];
  v191.receiver = self;
  v191.super_class = (Class)NTKUpNextThumbnailCell;
  v3 = -[NTKUpNextBaseCell initWithFrame:](&v191, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v189 = 0u;
    v190 = 0u;
    v187 = 0u;
    v188 = 0u;
    v185 = 0u;
    v186 = 0u;
    v183 = 0u;
    v184 = 0u;
    -[NTKUpNextBaseCell device](v3, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_34(v5, &v183);

    v6 = *((double *)&v185 + 1);
    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:", *((double *)&v185 + 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fontDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", 1);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fontDescriptor");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v11, "fontDescriptorWithSymbolicTraits:", 2);
    v12 = objc_claimAutoreleasedReturnValue();

    LOBYTE(v11) = CLKIsCurrentLocaleNonLatin();
    v13 = *MEMORY[0x1E0DC1438];
    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", v6, *MEMORY[0x1E0DC1438]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fontDescriptor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if ((v11 & 1) == 0)
    {
      objc_msgSend(v15, "fontDescriptorWithSymbolicTraits:", 1);
      v17 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v17;
    }

    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", v6, v13);
    v18 = objc_claimAutoreleasedReturnValue();
    standardFont = v4->_standardFont;
    v4->_standardFont = (CLKFont *)v18;

    v181 = (void *)v12;
    objc_msgSend(MEMORY[0x1E0C944D0], "fontWithDescriptor:size:", v12, v6);
    v20 = objc_claimAutoreleasedReturnValue();
    boldFont = v4->_boldFont;
    v4->_boldFont = (CLKFont *)v20;

    v182 = (void *)v9;
    objc_msgSend(MEMORY[0x1E0C944D0], "fontWithDescriptor:size:", v9, v6);
    v22 = objc_claimAutoreleasedReturnValue();
    italicFont = v4->_italicFont;
    v4->_italicFont = (CLKFont *)v22;

    v180 = v16;
    objc_msgSend(MEMORY[0x1E0C944D0], "fontWithDescriptor:size:", v16, *((double *)&v190 + 1));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1288], "NTKHyphenationParagraphStyle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setLineBreakMode:", 4);
    objc_msgSend(v25, "lineSpacing");
    objc_msgSend(v25, "setLineSpacing:", v26 + *(double *)&v186);
    __40__NTKUpNextThumbnailCell_initWithFrame___block_invoke();
    v27 = objc_claimAutoreleasedReturnValue();
    headerLabel = v4->_headerLabel;
    v4->_headerLabel = (CLKUIColoringLabel *)v27;

    -[CLKUIColoringLabel setFont:](v4->_headerLabel, "setFont:", v4->_boldFont);
    v29 = v4->_headerLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v29, "setTextColor:", v30);

    -[CLKUIColoringLabel setNumberOfLines:](v4->_headerLabel, "setNumberOfLines:", 2);
    -[CLKUIColoringLabel setParagraphStyle:](v4->_headerLabel, "setParagraphStyle:", v25);
    __40__NTKUpNextThumbnailCell_initWithFrame___block_invoke();
    v31 = objc_claimAutoreleasedReturnValue();
    descriptionLine1Label = v4->_descriptionLine1Label;
    v4->_descriptionLine1Label = (CLKUIColoringLabel *)v31;

    v33 = v4->_descriptionLine1Label;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v33, "setTextColor:", v34);

    -[CLKUIColoringLabel setFont:](v4->_descriptionLine1Label, "setFont:", v4->_standardFont);
    v178 = v25;
    -[CLKUIColoringLabel setParagraphStyle:](v4->_descriptionLine1Label, "setParagraphStyle:", v25);
    __40__NTKUpNextThumbnailCell_initWithFrame___block_invoke();
    v35 = objc_claimAutoreleasedReturnValue();
    descriptionLine2Label = v4->_descriptionLine2Label;
    v4->_descriptionLine2Label = (CLKUIColoringLabel *)v35;

    v37 = v4->_descriptionLine2Label;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v37, "setTextColor:", v38);

    -[CLKUIColoringLabel setFont:](v4->_descriptionLine2Label, "setFont:", v4->_italicFont);
    -[CLKUIColoringLabel setNumberOfLines:](v4->_descriptionLine2Label, "setNumberOfLines:", 1);
    __40__NTKUpNextThumbnailCell_initWithFrame___block_invoke();
    v39 = objc_claimAutoreleasedReturnValue();
    descriptionLine3Label = v4->_descriptionLine3Label;
    v4->_descriptionLine3Label = (CLKUIColoringLabel *)v39;

    v41 = v4->_descriptionLine3Label;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v41, "setTextColor:", v42);

    v179 = (void *)v24;
    -[CLKUIColoringLabel setFont:](v4->_descriptionLine3Label, "setFont:", v24);
    -[CLKUIColoringLabel setNumberOfLines:](v4->_descriptionLine3Label, "setNumberOfLines:", 1);
    -[CLKUIColoringLabel setTextAlignment:](v4->_descriptionLine3Label, "setTextAlignment:", 1);
    -[CLKUIColoringLabel setAdjustsFontSizeToFitWidth:](v4->_descriptionLine3Label, "setAdjustsFontSizeToFitWidth:", 1);
    -[CLKUIColoringLabel setMinimumScaleFactor:](v4->_descriptionLine3Label, "setMinimumScaleFactor:", 0.7);
    -[NTKUpNextBaseCell device](v4, "device");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "sizeClass");

    if (v44 == 3)
    {
      v45 = (uint64_t)*(double *)&v184;
      -[CLKUIColoringLabel setLineSpacing:](v4->_headerLabel, "setLineSpacing:", (uint64_t)*(double *)&v184);
      -[CLKUIColoringLabel setLineSpacing:](v4->_descriptionLine1Label, "setLineSpacing:", v45);
      -[CLKUIColoringLabel setLineSpacing:](v4->_descriptionLine2Label, "setLineSpacing:", (uint64_t)*((double *)&v184 + 1));
    }
    v46 = [NTKUpNextImageView alloc];
    v47 = -[NTKUpNextImageView initWithFrame:parentCell:](v46, "initWithFrame:parentCell:", v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    imageView = v4->_imageView;
    v4->_imageView = (NTKUpNextImageView *)v47;

    -[NTKUpNextImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[NTKUpNextImageView setContentMode:](v4->_imageView, "setContentMode:", 1);
    -[NTKUpNextImageView layer](v4->_imageView, "layer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setCornerRadius:", *(double *)&v183);

    -[NTKUpNextImageView setClipsToBounds:](v4->_imageView, "setClipsToBounds:", 1);
    -[NTKUpNextImageView setFilterProvider:](v4->_imageView, "setFilterProvider:", v4);
    v50 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    labelLayoutGuide = v4->_labelLayoutGuide;
    v4->_labelLayoutGuide = v50;

    -[NTKUpNextThumbnailCell contentView](v4, "contentView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addLayoutGuide:", v4->_labelLayoutGuide);

    -[NTKUpNextThumbnailCell contentView](v4, "contentView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addSubview:", v4->_imageView);

    -[NTKUpNextThumbnailCell contentView](v4, "contentView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addSubview:", v4->_headerLabel);

    -[NTKUpNextThumbnailCell contentView](v4, "contentView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "addSubview:", v4->_descriptionLine1Label);

    -[NTKUpNextThumbnailCell contentView](v4, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addSubview:", v4->_descriptionLine2Label);

    -[NTKUpNextThumbnailCell contentView](v4, "contentView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "addSubview:", v4->_descriptionLine3Label);

    v58 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    imageLayoutGuide = v4->_imageLayoutGuide;
    v4->_imageLayoutGuide = v58;

    -[NTKUpNextThumbnailCell contentView](v4, "contentView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addLayoutGuide:", v4->_imageLayoutGuide);

    -[UILayoutGuide widthAnchor](v4->_imageLayoutGuide, "widthAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToConstant:", 1.0);
    v62 = objc_claimAutoreleasedReturnValue();
    imageLayoutGuideWidthConstraint = v4->_imageLayoutGuideWidthConstraint;
    v4->_imageLayoutGuideWidthConstraint = (NSLayoutConstraint *)v62;

    -[UILayoutGuide heightAnchor](v4->_imageLayoutGuide, "heightAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToConstant:", 1.0);
    v65 = objc_claimAutoreleasedReturnValue();
    imageLayoutGuideHeightConstraint = v4->_imageLayoutGuideHeightConstraint;
    v4->_imageLayoutGuideHeightConstraint = (NSLayoutConstraint *)v65;

    -[NTKUpNextImageView centerYAnchor](v4->_imageView, "centerYAnchor");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide centerYAnchor](v4->_imageLayoutGuide, "centerYAnchor");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "constraintEqualToAnchor:", v175);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v198[0] = v173;
    -[NTKUpNextImageView centerXAnchor](v4->_imageView, "centerXAnchor");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide centerXAnchor](v4->_imageLayoutGuide, "centerXAnchor");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "constraintEqualToAnchor:", v169);
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    v198[1] = v167;
    -[NTKUpNextImageView widthAnchor](v4->_imageView, "widthAnchor");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide widthAnchor](v4->_imageLayoutGuide, "widthAnchor");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "constraintLessThanOrEqualToAnchor:", v163);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v198[2] = v161;
    -[NTKUpNextImageView heightAnchor](v4->_imageView, "heightAnchor");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide heightAnchor](v4->_imageLayoutGuide, "heightAnchor");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "constraintLessThanOrEqualToAnchor:", v157);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    v198[3] = v155;
    -[UILayoutGuide topAnchor](v4->_labelLayoutGuide, "topAnchor");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextThumbnailCell contentView](v4, "contentView");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "topAnchor");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "constraintEqualToAnchor:constant:", v152, *((double *)&v187 + 1));
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v198[4] = v151;
    -[UILayoutGuide bottomAnchor](v4->_labelLayoutGuide, "bottomAnchor");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextThumbnailCell contentView](v4, "contentView");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "bottomAnchor");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "constraintEqualToAnchor:constant:", v148, -*((double *)&v188 + 1));
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v198[5] = v147;
    -[UILayoutGuide leadingAnchor](v4->_labelLayoutGuide, "leadingAnchor");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v4->_imageLayoutGuide, "trailingAnchor");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "constraintEqualToAnchor:constant:", v145, *(double *)&v185);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v198[6] = v144;
    -[UILayoutGuide trailingAnchor](v4->_labelLayoutGuide, "trailingAnchor");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextThumbnailCell contentView](v4, "contentView");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "trailingAnchor");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "constraintEqualToAnchor:constant:", v141, -*(double *)&v189);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v198[7] = v140;
    -[CLKUIColoringLabel leadingAnchor](v4->_headerLabel, "leadingAnchor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v4->_labelLayoutGuide, "leadingAnchor");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "constraintEqualToAnchor:", v138);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v198[8] = v137;
    -[CLKUIColoringLabel trailingAnchor](v4->_headerLabel, "trailingAnchor");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v4->_labelLayoutGuide, "trailingAnchor");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "constraintEqualToAnchor:", v135);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v198[9] = v134;
    -[CLKUIColoringLabel leadingAnchor](v4->_descriptionLine1Label, "leadingAnchor");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v4->_labelLayoutGuide, "leadingAnchor");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "constraintEqualToAnchor:", v132);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v198[10] = v131;
    -[CLKUIColoringLabel trailingAnchor](v4->_descriptionLine1Label, "trailingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v4->_labelLayoutGuide, "trailingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v198[11] = v69;
    -[CLKUIColoringLabel leadingAnchor](v4->_descriptionLine2Label, "leadingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v4->_labelLayoutGuide, "leadingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v198[12] = v72;
    -[CLKUIColoringLabel trailingAnchor](v4->_descriptionLine2Label, "trailingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v4->_labelLayoutGuide, "trailingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:", v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v198[13] = v75;
    v198[14] = v4->_imageLayoutGuideHeightConstraint;
    v198[15] = v4->_imageLayoutGuideWidthConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v198, 16);
    v177 = (void *)objc_claimAutoreleasedReturnValue();

    -[CLKUIColoringLabel firstBaselineAnchor](v4->_descriptionLine1Label, "firstBaselineAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v4->_labelLayoutGuide, "topAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = *((double *)&v183 + 1);
    objc_msgSend(v76, "constraintEqualToAnchor:constant:", v77, *((double *)&v183 + 1));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v197 = v79;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v197, 1);
    v80 = objc_claimAutoreleasedReturnValue();
    withoutHeaderConstraints = v4->_withoutHeaderConstraints;
    v4->_withoutHeaderConstraints = (NSArray *)v80;

    -[CLKUIColoringLabel firstBaselineAnchor](v4->_headerLabel, "firstBaselineAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v4->_labelLayoutGuide, "topAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:constant:", v83, v78);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v196[0] = v84;
    -[CLKUIColoringLabel firstBaselineAnchor](v4->_descriptionLine1Label, "firstBaselineAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel lastBaselineAnchor](v4->_headerLabel, "lastBaselineAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:constant:", v86, *(double *)&v184);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v196[1] = v87;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v196, 2);
    v88 = objc_claimAutoreleasedReturnValue();
    withHeaderConstraints = v4->_withHeaderConstraints;
    v4->_withHeaderConstraints = (NSArray *)v88;

    -[CLKUIColoringLabel firstBaselineAnchor](v4->_descriptionLine2Label, "firstBaselineAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel lastBaselineAnchor](v4->_descriptionLine1Label, "lastBaselineAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = *(double *)&v186;
    objc_msgSend(v90, "constraintEqualToAnchor:constant:", v91, *((double *)&v184 + 1) + *(double *)&v186);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v195[0] = v93;
    -[CLKUIColoringLabel lastBaselineAnchor](v4->_descriptionLine2Label, "lastBaselineAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v4->_labelLayoutGuide, "bottomAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = *((double *)&v186 + 1);
    v97 = -*((double *)&v186 + 1);
    objc_msgSend(v94, "constraintLessThanOrEqualToAnchor:constant:", v95, -*((double *)&v186 + 1));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v195[1] = v98;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v195, 2);
    v99 = objc_claimAutoreleasedReturnValue();
    withDescription2Constraints = v4->_withDescription2Constraints;
    v4->_withDescription2Constraints = (NSArray *)v99;

    -[CLKUIColoringLabel lastBaselineAnchor](v4->_descriptionLine1Label, "lastBaselineAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v4->_labelLayoutGuide, "bottomAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintLessThanOrEqualToAnchor:constant:", v102, v97);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v194[0] = v103;
    -[CLKUIColoringLabel lastBaselineAnchor](v4->_headerLabel, "lastBaselineAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v4->_labelLayoutGuide, "bottomAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "constraintLessThanOrEqualToAnchor:constant:", v105, v97);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v194[1] = v106;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v194, 2);
    v107 = objc_claimAutoreleasedReturnValue();
    withoutDescription2Constraints = v4->_withoutDescription2Constraints;
    v4->_withoutDescription2Constraints = (NSArray *)v107;

    -[UILayoutGuide leadingAnchor](v4->_imageLayoutGuide, "leadingAnchor");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextThumbnailCell contentView](v4, "contentView");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "leadingAnchor");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "constraintEqualToAnchor:constant:", v170, *(double *)&v185);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v193[0] = v168;
    -[UILayoutGuide centerYAnchor](v4->_imageLayoutGuide, "centerYAnchor");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel firstBaselineAnchor](v4->_descriptionLine3Label, "firstBaselineAnchor");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "scale");
    UIRoundToScale();
    objc_msgSend(v164, "constraintEqualToAnchor:constant:", v162);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v193[1] = v160;
    -[CLKUIColoringLabel leadingAnchor](v4->_descriptionLine3Label, "leadingAnchor");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextThumbnailCell contentView](v4, "contentView");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "leadingAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "constraintEqualToAnchor:constant:", v109, 1.0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v193[2] = v110;
    -[CLKUIColoringLabel trailingAnchor](v4->_descriptionLine3Label, "trailingAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v4->_labelLayoutGuide, "leadingAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "constraintEqualToAnchor:constant:", v112, -1.0);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v193[3] = v113;
    -[CLKUIColoringLabel firstBaselineAnchor](v4->_descriptionLine3Label, "firstBaselineAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextThumbnailCell contentView](v4, "contentView");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "bottomAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "constraintEqualToAnchor:constant:", v116, v92 - v96);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v193[4] = v117;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v193, 5);
    v118 = objc_claimAutoreleasedReturnValue();
    withDescription3Constraints = v4->_withDescription3Constraints;
    v4->_withDescription3Constraints = (NSArray *)v118;

    -[UILayoutGuide leadingAnchor](v4->_imageLayoutGuide, "leadingAnchor");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextThumbnailCell contentView](v4, "contentView");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "leadingAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "constraintEqualToAnchor:constant:", v122, *(double *)&v188);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v192[0] = v123;
    -[UILayoutGuide centerYAnchor](v4->_imageLayoutGuide, "centerYAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextThumbnailCell contentView](v4, "contentView");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "centerYAnchor");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "constraintEqualToAnchor:", v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v192[1] = v127;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v192, 2);
    v128 = objc_claimAutoreleasedReturnValue();
    withoutDescription3Constraints = v4->_withoutDescription3Constraints;
    v4->_withoutDescription3Constraints = (NSArray *)v128;

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4->_withoutDescription3Constraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4->_withoutDescription2Constraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4->_withoutHeaderConstraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v177);
    -[CLKUIColoringLabel setNumberOfLines:](v4->_descriptionLine1Label, "setNumberOfLines:", 3);
    -[CLKUIColoringLabel setHidden:](v4->_headerLabel, "setHidden:", 1);
    -[CLKUIColoringLabel setHidden:](v4->_descriptionLine2Label, "setHidden:", 1);
    -[CLKUIColoringLabel setHidden:](v4->_descriptionLine3Label, "setHidden:", 1);

  }
  return v4;
}

id __40__NTKUpNextThumbnailCell_initWithFrame___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc((Class)off_1E6BCA6E0);
  v1 = (void *)objc_msgSend(v0, "initWithFrame:options:", 4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v1, "setLineBreakMode:", 4);
  objc_msgSend(v1, "_setUseShortcutIntrinsicContentSize:", 1);
  objc_msgSend(v1, "setNowProvider:", &__block_literal_global_3_3);
  return v1;
}

uint64_t __40__NTKUpNextThumbnailCell_initWithFrame___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSLayoutConstraint *imageLayoutGuideHeightConstraint;
  double v22;
  void *v23;
  _BOOL4 v24;
  int *v25;
  int *v26;
  void *v27;
  _BOOL4 v28;
  BOOL v29;
  _BOOL8 v30;
  int *v31;
  int *v32;
  CLKUIColoringLabel *headerLabel;
  uint64_t v34;
  void *v35;
  objc_super v36;
  _OWORD v37[6];
  __int128 v38;
  __int128 v39;

  -[NTKUpNextBaseCell content](self, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  memset(v37, 0, sizeof(v37));
  -[NTKUpNextBaseCell device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_34(v6, v37);

  objc_msgSend(v3, "description3TextProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  if (self->_showingSmallThumbnail == v8)
  {
    if (v7)
      goto LABEL_24;
  }
  else
  {
    self->_showingSmallThumbnail = v8;
    -[CLKUIColoringLabel setHidden:](self->_descriptionLine3Label, "setHidden:", v7 == 0);
    if (v7)
    {
      -[NSLayoutConstraint setConstant:](self->_imageLayoutGuideWidthConstraint, "setConstant:", *((double *)&v38 + 1));
      -[NSLayoutConstraint setConstant:](self->_imageLayoutGuideHeightConstraint, "setConstant:", *(double *)&v39);
      objc_msgSend(v4, "addObjectsFromArray:", self->_withDescription3Constraints);
      objc_msgSend(v5, "addObjectsFromArray:", self->_withoutDescription3Constraints);
      goto LABEL_24;
    }
    objc_msgSend(v4, "addObjectsFromArray:", self->_withoutDescription3Constraints);
    objc_msgSend(v5, "addObjectsFromArray:", self->_withDescription3Constraints);
  }
  v9 = (void *)objc_opt_class();
  -[NTKUpNextBaseCell device](self, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "suggestedBodyImageSizeForDevice:", v10);
  v12 = v11;
  v14 = v13;

  -[NTKUpNextImageView intrinsicContentSize](self->_imageView, "intrinsicContentSize");
  v17 = v16;
  if (v15 == *MEMORY[0x1E0DC55F0] && v16 == *MEMORY[0x1E0DC55F0])
  {
    -[NSLayoutConstraint setConstant:](self->_imageLayoutGuideWidthConstraint, "setConstant:", v12);
    imageLayoutGuideHeightConstraint = self->_imageLayoutGuideHeightConstraint;
    v22 = v14;
  }
  else
  {
    if (v16 <= v15 || v16 <= v14)
    {
      if (v15 >= v16 && v15 > v12)
      {
        v17 = v12 * (v16 / v15);
        v15 = v12;
      }
    }
    else
    {
      v15 = v14 * (v15 / v16);
      v17 = v14;
    }
    -[NSLayoutConstraint setConstant:](self->_imageLayoutGuideWidthConstraint, "setConstant:", v15);
    imageLayoutGuideHeightConstraint = self->_imageLayoutGuideHeightConstraint;
    v22 = v17;
  }
  -[NSLayoutConstraint setConstant:](imageLayoutGuideHeightConstraint, "setConstant:", v22);
LABEL_24:
  objc_msgSend(v3, "description2TextProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23 != 0;

  if (self->_showingThirdLine != v24)
  {
    self->_showingThirdLine = v24;
    -[CLKUIColoringLabel setHidden:](self->_descriptionLine2Label, "setHidden:", v23 == 0);
    if (self->_showingThirdLine)
      v25 = &OBJC_IVAR___NTKUpNextThumbnailCell__withoutDescription2Constraints;
    else
      v25 = &OBJC_IVAR___NTKUpNextThumbnailCell__withDescription2Constraints;
    if (self->_showingThirdLine)
      v26 = &OBJC_IVAR___NTKUpNextThumbnailCell__withDescription2Constraints;
    else
      v26 = &OBJC_IVAR___NTKUpNextThumbnailCell__withoutDescription2Constraints;
    objc_msgSend(v5, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v25));
    objc_msgSend(v4, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v26));
  }
  objc_msgSend(v3, "headerTextProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27 != 0;

  if (self->_showingHeader != v28)
  {
    v29 = v27 == 0;
    v30 = v27 == 0;
    self->_showingHeader = v28;
    if (v27)
      v31 = &OBJC_IVAR___NTKUpNextThumbnailCell__withoutHeaderConstraints;
    else
      v31 = &OBJC_IVAR___NTKUpNextThumbnailCell__withHeaderConstraints;
    if (v29)
      v32 = &OBJC_IVAR___NTKUpNextThumbnailCell__withoutHeaderConstraints;
    else
      v32 = &OBJC_IVAR___NTKUpNextThumbnailCell__withHeaderConstraints;
    -[CLKUIColoringLabel setHidden:](self->_headerLabel, "setHidden:", v30);
    objc_msgSend(v5, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v31));
    objc_msgSend(v4, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v32));
  }
  if (!self->_showingThirdLine)
  {
    if (self->_showingHeader)
    {
      objc_msgSend(v3, "description1TextProvider");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      headerLabel = self->_headerLabel;
      if (v35)
      {
        -[CLKUIColoringLabel setNumberOfLines:](headerLabel, "setNumberOfLines:", 2);
        headerLabel = self->_descriptionLine1Label;
        v34 = 2;
        goto LABEL_49;
      }
    }
    else
    {
      headerLabel = self->_descriptionLine1Label;
    }
    v34 = 3;
    goto LABEL_49;
  }
  -[CLKUIColoringLabel setNumberOfLines:](self->_headerLabel, "setNumberOfLines:", 1);
  headerLabel = self->_descriptionLine1Label;
  if (self->_showingHeader)
    v34 = 1;
  else
    v34 = 2;
LABEL_49:
  -[CLKUIColoringLabel setNumberOfLines:](headerLabel, "setNumberOfLines:", v34);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v5);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4);
  v36.receiver = self;
  v36.super_class = (Class)NTKUpNextThumbnailCell;
  -[NTKUpNextThumbnailCell updateConstraints](&v36, sel_updateConstraints);

}

- (void)configureWithContent:(id)a3
{
  id v4;
  CLKUIColoringLabel *headerLabel;
  void *v6;
  CLKUIColoringLabel *descriptionLine1Label;
  void *v8;
  CLKUIColoringLabel *descriptionLine2Label;
  void *v10;
  CLKUIColoringLabel *descriptionLine3Label;
  void *v12;
  void (**v13)(void *, CLKUIColoringLabel *, uint64_t);
  NTKUpNextImageView *imageView;
  void *v15;
  void *v16;
  NTKUpNextImageView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CLKUIColoringLabel *v24;
  float v25;
  double v26;
  _QWORD aBlock[5];
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)NTKUpNextThumbnailCell;
  v4 = a3;
  -[NTKUpNextBaseCell configureWithContent:](&v28, sel_configureWithContent_, v4);
  +[NTKUpNextBaseCell clearLabel:](NTKUpNextBaseCell, "clearLabel:", self->_headerLabel);
  headerLabel = self->_headerLabel;
  objc_msgSend(v4, "headerTextProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](headerLabel, "setTextProvider:", v6);

  +[NTKUpNextBaseCell clearLabel:](NTKUpNextBaseCell, "clearLabel:", self->_descriptionLine1Label);
  descriptionLine1Label = self->_descriptionLine1Label;
  objc_msgSend(v4, "description1TextProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](descriptionLine1Label, "setTextProvider:", v8);

  +[NTKUpNextBaseCell clearLabel:](NTKUpNextBaseCell, "clearLabel:", self->_descriptionLine2Label);
  descriptionLine2Label = self->_descriptionLine2Label;
  objc_msgSend(v4, "description2TextProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](descriptionLine2Label, "setTextProvider:", v10);

  +[NTKUpNextBaseCell clearLabel:](NTKUpNextBaseCell, "clearLabel:", self->_descriptionLine3Label);
  descriptionLine3Label = self->_descriptionLine3Label;
  objc_msgSend(v4, "description3TextProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](descriptionLine3Label, "setTextProvider:", v12);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__NTKUpNextThumbnailCell_configureWithContent___block_invoke;
  aBlock[3] = &unk_1E6BD1FF8;
  aBlock[4] = self;
  v13 = (void (**)(void *, CLKUIColoringLabel *, uint64_t))_Block_copy(aBlock);
  v13[2](v13, self->_headerLabel, objc_msgSend(v4, "headerFontStyle"));
  v13[2](v13, self->_descriptionLine1Label, objc_msgSend(v4, "description1FontStyle"));
  v13[2](v13, self->_descriptionLine2Label, objc_msgSend(v4, "description2FontStyle"));
  imageView = self->_imageView;
  objc_msgSend(v4, "overrideBodyImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bodyImageProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextImageView setFullColorImage:tintableImageProvider:](imageView, "setFullColorImage:tintableImageProvider:", v15, v16);

  v17 = self->_imageView;
  objc_msgSend(v4, "bodyImageCompositingFilter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextImageView setCompositingFilter:](v17, "setCompositingFilter:", v18);

  objc_msgSend(v4, "headerTextProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  objc_msgSend(v4, "description1TextProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  objc_msgSend(v4, "description2TextProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  objc_msgSend(v4, "description3TextProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  objc_msgSend(v4, "description1Opacity");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = self->_descriptionLine1Label;
  if (v23)
  {
    objc_msgSend(v23, "floatValue");
    v26 = v25;
  }
  else
  {
    v26 = 1.0;
  }
  -[CLKUIColoringLabel setAlpha:](v24, "setAlpha:", v26);
  -[NTKUpNextThumbnailCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

void __47__NTKUpNextThumbnailCell_configureWithContent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  int *v7;
  id v8;

  v5 = a2;
  v6 = 0.0;
  v8 = v5;
  v7 = &OBJC_IVAR___NTKUpNextThumbnailCell__standardFont;
  switch(a3)
  {
    case 0:
      goto LABEL_7;
    case 1:
      if (!CLKIsCurrentLocaleNonLatin())
        v7 = &OBJC_IVAR___NTKUpNextThumbnailCell__italicFont;
      goto LABEL_7;
    case 2:
      v7 = &OBJC_IVAR___NTKUpNextThumbnailCell__boldFont;
      goto LABEL_7;
    case 3:
      v6 = 0.8;
LABEL_7:
      objc_msgSend(v8, "setFont:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + *v7));
      v5 = v8;
      break;
    default:
      break;
  }
  objc_msgSend(v5, "setMinimumScaleFactor:", v6);
  objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", v6 != 0.0);

}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKUpNextThumbnailCell;
  -[NTKUpNextBaseCell setPaused:](&v9, sel_setPaused_);
  -[CLKUIColoringLabel textProvider](self->_headerLabel, "textProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPaused:", v3);

  -[CLKUIColoringLabel textProvider](self->_descriptionLine1Label, "textProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPaused:", v3);

  -[CLKUIColoringLabel textProvider](self->_descriptionLine2Label, "textProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPaused:", v3);

  -[CLKUIColoringLabel textProvider](self->_descriptionLine3Label, "textProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPaused:", v3);

}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = CLKUIAssociatedNonAccentStyle();
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filtersForView:style:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v7 = a3;
  v8 = CLKUIAssociatedNonAccentStyle();
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filtersForView:style:fraction:", v7, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v7 = a3;
  v8 = CLKUIAssociatedNonAccentStyle();
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filterForView:style:fraction:", v7, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = CLKUIAssociatedNonAccentStyle();
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filterForView:style:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorForView:accented:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)backgroundColorForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundColorForView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKUpNextThumbnailCell;
  -[NTKUpNextBaseCell prepareForReuse](&v7, sel_prepareForReuse);
  -[NTKUpNextImageView transitionToMonochromeWithFraction:](self->_imageView, "transitionToMonochromeWithFraction:", 0.0);
  -[CLKUIColoringLabel layer](self->_headerLabel, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilters:", 0);

  -[CLKUIColoringLabel layer](self->_descriptionLine1Label, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilters:", 0);

  -[CLKUIColoringLabel layer](self->_descriptionLine2Label, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilters:", 0);

  -[CLKUIColoringLabel layer](self->_descriptionLine3Label, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFilters:", 0);

}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  -[NTKUpNextImageView transitionToMonochromeWithFraction:](self->_imageView, "transitionToMonochromeWithFraction:");
  if (fabs(a3) < 0.00000011920929)
  {
    -[CLKUIColoringLabel layer](self->_headerLabel, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFilters:", 0);

    -[CLKUIColoringLabel layer](self->_descriptionLine1Label, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilters:", 0);

    -[CLKUIColoringLabel layer](self->_descriptionLine2Label, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFilters:", 0);

    -[CLKUIColoringLabel layer](self->_descriptionLine3Label, "layer");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFilters:", 0);
    goto LABEL_9;
  }
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filtersForView:style:fraction:", self, 2, a3);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v19;
  if (v19)
  {
    -[CLKUIColoringLabel layer](self->_headerLabel, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFilters:", v19);

    -[CLKUIColoringLabel layer](self->_descriptionLine3Label, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFilters:", v19);

    -[NTKUpNextBaseCell content](self, "content");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "headerTextProvider");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[NTKUpNextBaseCell content](self, "content");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "headerFontStyle");

      if (v16 == 2)
        goto LABEL_9;
    }
    else
    {

    }
    -[CLKUIColoringLabel layer](self->_descriptionLine1Label, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFilters:", v19);

    -[CLKUIColoringLabel layer](self->_descriptionLine2Label, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFilters:", v19);

LABEL_9:
    v9 = v19;
  }

}

- (void)updateMonochromeColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  -[NTKUpNextImageView updateMonochromeColor](self->_imageView, "updateMonochromeColor");
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filtersForView:style:", self, 2);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[CLKUIColoringLabel layer](self->_headerLabel, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFilters:", v13);

    -[CLKUIColoringLabel layer](self->_descriptionLine3Label, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFilters:", v13);

    -[NTKUpNextBaseCell content](self, "content");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "headerTextProvider");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[NTKUpNextBaseCell content](self, "content");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "headerFontStyle");

      if (v10 == 2)
        goto LABEL_7;
    }
    else
    {

    }
    -[CLKUIColoringLabel layer](self->_descriptionLine1Label, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFilters:", v13);

    -[CLKUIColoringLabel layer](self->_descriptionLine2Label, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFilters:", v13);

  }
LABEL_7:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLayoutGuideHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageLayoutGuideWidthConstraint, 0);
  objc_storeStrong((id *)&self->_withoutDescription3Constraints, 0);
  objc_storeStrong((id *)&self->_withDescription3Constraints, 0);
  objc_storeStrong((id *)&self->_withoutDescription2Constraints, 0);
  objc_storeStrong((id *)&self->_withDescription2Constraints, 0);
  objc_storeStrong((id *)&self->_withoutHeaderConstraints, 0);
  objc_storeStrong((id *)&self->_withHeaderConstraints, 0);
  objc_storeStrong((id *)&self->_boldFont, 0);
  objc_storeStrong((id *)&self->_italicFont, 0);
  objc_storeStrong((id *)&self->_standardFont, 0);
  objc_storeStrong((id *)&self->_descriptionLine3Label, 0);
  objc_storeStrong((id *)&self->_descriptionLine2Label, 0);
  objc_storeStrong((id *)&self->_descriptionLine1Label, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_imageLayoutGuide, 0);
  objc_storeStrong((id *)&self->_labelLayoutGuide, 0);
}

@end
