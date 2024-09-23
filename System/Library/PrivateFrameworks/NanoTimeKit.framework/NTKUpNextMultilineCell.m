@implementation NTKUpNextMultilineCell

+ (CGSize)suggestedBodyImageSizeForDevice:(id)a3
{
  uint64_t v3;
  double v4;
  double v5;
  CGSize result;

  v3 = objc_msgSend(a3, "sizeClass");
  v4 = 27.0;
  switch(v3)
  {
    case 0:
      break;
    case 1:
    case 2:
    case 4:
      v4 = 31.0;
      break;
    default:
      v4 = 34.0;
      break;
  }
  v5 = v4;
  result.height = v5;
  result.width = v4;
  return result;
}

- (NTKUpNextMultilineCell)initWithFrame:(CGRect)a3
{
  NTKUpNextMultilineCell *v3;
  NTKUpNextMultilineCell *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CLKFont *standardFont;
  uint64_t v13;
  CLKFont *italicFont;
  uint64_t v15;
  CLKFont *boldFont;
  uint64_t v17;
  CLKUIColoringLabel *headerLabel;
  CLKUIColoringLabel *v19;
  void *v20;
  uint64_t v21;
  CLKUIColoringLabel *descriptionLine1Label;
  CLKUIColoringLabel *v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  CLKUIColoringLabel *descriptionLine2Label;
  CLKUIColoringLabel *v29;
  void *v30;
  NTKUpNextImageView *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  NTKUpNextImageView *headerImage;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  NTKUpNextImageView *v45;
  NTKUpNextImageView *descriptionImageView;
  double v47;
  double v48;
  UILayoutGuide *v49;
  UILayoutGuide *contentLayoutGuide;
  UILayoutGuide *v51;
  UILayoutGuide *descriptionTextLayoutGuide;
  UILayoutGuide *v53;
  UILayoutGuide *bodyImageSizingLayoutGuide;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  NSArray *withoutHeaderConstraints;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  NSArray *withHeaderConstraints;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  NSArray *headerWithNoImageConstraints;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  double v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  NSArray *headerWithLeftImageConstraints;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  NSArray *headerWithRightImageConstraints;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  double v133;
  void *v134;
  uint64_t v135;
  NSArray *withDescription2Constraints;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  NSArray *withoutDescription2Constraints;
  void *v145;
  void *v146;
  void *v147;
  uint64_t v148;
  NSArray *withoutAccessoryConstraints;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  double v157;
  void *v158;
  uint64_t v159;
  NSArray *withDescriptionImageViewConstraints;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  uint64_t v169;
  NSArray *withStretchableDescriptionImageViewConstraints;
  void *v171;
  void *v172;
  void *v173;
  uint64_t v174;
  NSArray *withoutDescriptionImageViewConstraints;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  uint64_t v231;
  objc_super v232;
  void *v233;
  _QWORD v234[3];
  _QWORD v235[3];
  void *v236;
  _QWORD v237[2];
  _QWORD v238[3];
  _QWORD v239[3];
  _QWORD v240[3];
  _QWORD v241[2];
  _QWORD v242[3];
  _QWORD v243[2];
  _QWORD v244[16];

  v244[14] = *MEMORY[0x1E0C80C00];
  v232.receiver = self;
  v232.super_class = (Class)NTKUpNextMultilineCell;
  v3 = -[NTKUpNextBaseCell initWithFrame:](&v232, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v231 = 0;
    v229 = 0u;
    v230 = 0u;
    v227 = 0u;
    v228 = 0u;
    v225 = 0u;
    v226 = 0u;
    v223 = 0u;
    v224 = 0u;
    v221 = 0u;
    v222 = 0u;
    -[NTKUpNextBaseCell device](v3, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_14(v5, (uint64_t)&v221);

    v6 = *((double *)&v223 + 1);
    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:", *((double *)&v223 + 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fontDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", 1);
    v219 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fontDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fontDescriptorWithSymbolicTraits:", 2);
    v218 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", v6, *MEMORY[0x1E0DC1438]);
    v11 = objc_claimAutoreleasedReturnValue();
    standardFont = v4->_standardFont;
    v4->_standardFont = (CLKFont *)v11;

    objc_msgSend(MEMORY[0x1E0C944D0], "fontWithDescriptor:size:", v219, v6);
    v13 = objc_claimAutoreleasedReturnValue();
    italicFont = v4->_italicFont;
    v4->_italicFont = (CLKFont *)v13;

    objc_msgSend(MEMORY[0x1E0C944D0], "fontWithDescriptor:size:", v218, v6);
    v15 = objc_claimAutoreleasedReturnValue();
    boldFont = v4->_boldFont;
    v4->_boldFont = (CLKFont *)v15;

    __40__NTKUpNextMultilineCell_initWithFrame___block_invoke();
    v17 = objc_claimAutoreleasedReturnValue();
    headerLabel = v4->_headerLabel;
    v4->_headerLabel = (CLKUIColoringLabel *)v17;

    -[CLKUIColoringLabel setFont:](v4->_headerLabel, "setFont:", v4->_boldFont);
    v19 = v4->_headerLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v19, "setTextColor:", v20);

    __40__NTKUpNextMultilineCell_initWithFrame___block_invoke();
    v21 = objc_claimAutoreleasedReturnValue();
    descriptionLine1Label = v4->_descriptionLine1Label;
    v4->_descriptionLine1Label = (CLKUIColoringLabel *)v21;

    v23 = v4->_descriptionLine1Label;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v23, "setTextColor:", v24);

    -[CLKUIColoringLabel setFont:](v4->_descriptionLine1Label, "setFont:", v4->_standardFont);
    objc_msgSend(MEMORY[0x1E0DC1288], "NTKHyphenationParagraphStyle");
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v217, "setLineBreakMode:", 4);
    objc_msgSend(v217, "lineSpacing");
    objc_msgSend(v217, "setLineSpacing:", v25 + *(double *)&v224);
    -[CLKUIColoringLabel setParagraphStyle:](v4->_descriptionLine1Label, "setParagraphStyle:", v217);
    LODWORD(v26) = 1148846080;
    -[CLKUIColoringLabel setContentHuggingPriority:forAxis:](v4->_descriptionLine1Label, "setContentHuggingPriority:forAxis:", 1, v26);
    __40__NTKUpNextMultilineCell_initWithFrame___block_invoke();
    v27 = objc_claimAutoreleasedReturnValue();
    descriptionLine2Label = v4->_descriptionLine2Label;
    v4->_descriptionLine2Label = (CLKUIColoringLabel *)v27;

    v29 = v4->_descriptionLine2Label;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v29, "setTextColor:", v30);

    -[CLKUIColoringLabel setFont:](v4->_descriptionLine2Label, "setFont:", v4->_italicFont);
    -[CLKUIColoringLabel setNumberOfLines:](v4->_descriptionLine2Label, "setNumberOfLines:", 1);
    v31 = [NTKUpNextImageView alloc];
    v32 = *MEMORY[0x1E0C9D648];
    v33 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v34 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v35 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v36 = -[NTKUpNextImageView initWithFrame:parentCell:](v31, "initWithFrame:parentCell:", v4, *MEMORY[0x1E0C9D648], v33, v34, v35);
    headerImage = v4->_headerImage;
    v4->_headerImage = (NTKUpNextImageView *)v36;

    LODWORD(v38) = 1148846080;
    -[NTKUpNextImageView setContentHuggingPriority:forAxis:](v4->_headerImage, "setContentHuggingPriority:forAxis:", 0, v38);
    LODWORD(v39) = 1148846080;
    -[NTKUpNextImageView setContentHuggingPriority:forAxis:](v4->_headerImage, "setContentHuggingPriority:forAxis:", 1, v39);
    LODWORD(v40) = 1148846080;
    -[NTKUpNextImageView setContentCompressionResistancePriority:forAxis:](v4->_headerImage, "setContentCompressionResistancePriority:forAxis:", 0, v40);
    LODWORD(v41) = 1148846080;
    -[NTKUpNextImageView setContentCompressionResistancePriority:forAxis:](v4->_headerImage, "setContentCompressionResistancePriority:forAxis:", 1, v41);
    LODWORD(v42) = 1148846080;
    -[CLKUIColoringLabel setContentCompressionResistancePriority:forAxis:](v4->_descriptionLine1Label, "setContentCompressionResistancePriority:forAxis:", 1, v42);
    LODWORD(v43) = 1148829696;
    -[CLKUIColoringLabel setContentCompressionResistancePriority:forAxis:](v4->_headerLabel, "setContentCompressionResistancePriority:forAxis:", 1, v43);
    LODWORD(v44) = 1132003328;
    -[CLKUIColoringLabel setContentHuggingPriority:forAxis:](v4->_headerLabel, "setContentHuggingPriority:forAxis:", 1, v44);
    -[NTKUpNextImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_headerImage, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v45 = -[NTKUpNextImageView initWithFrame:parentCell:]([NTKUpNextImageView alloc], "initWithFrame:parentCell:", v4, v32, v33, v34, v35);
    descriptionImageView = v4->_descriptionImageView;
    v4->_descriptionImageView = v45;

    -[NTKUpNextImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_descriptionImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[NTKUpNextImageView setContentMode:](v4->_descriptionImageView, "setContentMode:", 6);
    LODWORD(v47) = 1148846080;
    -[NTKUpNextImageView setContentHuggingPriority:forAxis:](v4->_descriptionImageView, "setContentHuggingPriority:forAxis:", 0, v47);
    LODWORD(v48) = 1148846080;
    -[NTKUpNextImageView setContentCompressionResistancePriority:forAxis:](v4->_descriptionImageView, "setContentCompressionResistancePriority:forAxis:", 0, v48);
    -[NTKUpNextImageView setFilterProvider:](v4->_descriptionImageView, "setFilterProvider:", v4);
    v49 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    contentLayoutGuide = v4->_contentLayoutGuide;
    v4->_contentLayoutGuide = v49;

    -[UILayoutGuide setIdentifier:](v4->_contentLayoutGuide, "setIdentifier:", CFSTR("Multiline-Content"));
    v51 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    descriptionTextLayoutGuide = v4->_descriptionTextLayoutGuide;
    v4->_descriptionTextLayoutGuide = v51;

    -[UILayoutGuide setIdentifier:](v4->_descriptionTextLayoutGuide, "setIdentifier:", CFSTR("Multiline-Description-Text"));
    v53 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    bodyImageSizingLayoutGuide = v4->_bodyImageSizingLayoutGuide;
    v4->_bodyImageSizingLayoutGuide = v53;

    -[UILayoutGuide setIdentifier:](v4->_bodyImageSizingLayoutGuide, "setIdentifier:", CFSTR("Multiline-Body-Image"));
    -[NTKUpNextMultilineCell contentView](v4, "contentView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "addLayoutGuide:", v4->_contentLayoutGuide);

    -[NTKUpNextMultilineCell contentView](v4, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addLayoutGuide:", v4->_descriptionTextLayoutGuide);

    -[NTKUpNextMultilineCell contentView](v4, "contentView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "addLayoutGuide:", v4->_bodyImageSizingLayoutGuide);

    -[NTKUpNextMultilineCell contentView](v4, "contentView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addSubview:", v4->_headerImage);

    -[NTKUpNextMultilineCell contentView](v4, "contentView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addSubview:", v4->_headerLabel);

    -[NTKUpNextMultilineCell contentView](v4, "contentView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addSubview:", v4->_descriptionLine1Label);

    -[NTKUpNextMultilineCell contentView](v4, "contentView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addSubview:", v4->_descriptionLine2Label);

    -[NTKUpNextMultilineCell contentView](v4, "contentView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "addSubview:", v4->_descriptionImageView);

    -[CLKFont capHeight](v4->_boldFont, "capHeight");
    -[NTKUpNextBaseCell device](v4, "device");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    CLKRoundForDevice();
    v65 = v64;

    -[UILayoutGuide topAnchor](v4->_contentLayoutGuide, "topAnchor");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextMultilineCell contentView](v4, "contentView");
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v215, "topAnchor");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "constraintEqualToAnchor:constant:", v212, *((double *)&v228 + 1));
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    v244[0] = v210;
    -[UILayoutGuide bottomAnchor](v4->_contentLayoutGuide, "bottomAnchor");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextMultilineCell contentView](v4, "contentView");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v209, "bottomAnchor");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v208, "constraintEqualToAnchor:constant:", v207, -*((double *)&v229 + 1));
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    v244[1] = v206;
    -[UILayoutGuide leadingAnchor](v4->_contentLayoutGuide, "leadingAnchor");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextMultilineCell contentView](v4, "contentView");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v205, "leadingAnchor");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v204, "constraintEqualToAnchor:constant:", v203, *(double *)&v229);
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    v244[2] = v202;
    -[UILayoutGuide trailingAnchor](v4->_contentLayoutGuide, "trailingAnchor");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextMultilineCell contentView](v4, "contentView");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "trailingAnchor");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v200, "constraintEqualToAnchor:constant:", v199, -*(double *)&v230);
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    v244[3] = v198;
    -[UILayoutGuide trailingAnchor](v4->_descriptionTextLayoutGuide, "trailingAnchor");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v4->_contentLayoutGuide, "trailingAnchor");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v197, "constraintEqualToAnchor:", v196);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    v244[4] = v195;
    -[UILayoutGuide bottomAnchor](v4->_descriptionTextLayoutGuide, "bottomAnchor");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v4->_contentLayoutGuide, "bottomAnchor");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v194, "constraintEqualToAnchor:constant:", v193, -*((double *)&v224 + 1));
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    v244[5] = v192;
    -[NTKUpNextImageView centerYAnchor](v4->_headerImage, "centerYAnchor");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel firstBaselineAnchor](v4->_headerLabel, "firstBaselineAnchor");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "constraintEqualToAnchor:constant:", v190, -v65);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    v244[6] = v189;
    -[CLKUIColoringLabel leadingAnchor](v4->_descriptionLine1Label, "leadingAnchor");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v4->_descriptionTextLayoutGuide, "leadingAnchor");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "constraintEqualToAnchor:", v187);
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    v244[7] = v186;
    -[CLKUIColoringLabel trailingAnchor](v4->_descriptionLine1Label, "trailingAnchor");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v4->_descriptionTextLayoutGuide, "trailingAnchor");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "constraintEqualToAnchor:", v184);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    v244[8] = v183;
    -[CLKUIColoringLabel trailingAnchor](v4->_descriptionLine2Label, "trailingAnchor");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v4->_descriptionTextLayoutGuide, "trailingAnchor");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v182, "constraintEqualToAnchor:", v181);
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    v244[9] = v180;
    -[NTKUpNextImageView leadingAnchor](v4->_descriptionImageView, "leadingAnchor");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v4->_contentLayoutGuide, "leadingAnchor");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "constraintEqualToAnchor:constant:", v178, *(double *)&v226);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    v244[10] = v177;
    -[UILayoutGuide leadingAnchor](v4->_bodyImageSizingLayoutGuide, "leadingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v4->_descriptionTextLayoutGuide, "leadingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v244[11] = v68;
    -[UILayoutGuide trailingAnchor](v4->_bodyImageSizingLayoutGuide, "trailingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v4->_descriptionTextLayoutGuide, "trailingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v244[12] = v71;
    -[UILayoutGuide topAnchor](v4->_bodyImageSizingLayoutGuide, "topAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel firstBaselineAnchor](v4->_descriptionLine1Label, "firstBaselineAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKFont capHeight](v4->_standardFont, "capHeight");
    objc_msgSend(v72, "constraintEqualToAnchor:constant:", v73, -(v74 + *((double *)&v227 + 1)));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v244[13] = v75;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v244, 14);
    v216 = (void *)objc_claimAutoreleasedReturnValue();

    -[CLKUIColoringLabel firstBaselineAnchor](v4->_descriptionLine1Label, "firstBaselineAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v4->_contentLayoutGuide, "topAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = *(double *)&v222;
    objc_msgSend(v76, "constraintEqualToAnchor:constant:", v77, *(double *)&v222);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v243[0] = v79;
    -[UILayoutGuide topAnchor](v4->_descriptionTextLayoutGuide, "topAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v4->_contentLayoutGuide, "topAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v243[1] = v82;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v243, 2);
    v83 = objc_claimAutoreleasedReturnValue();
    withoutHeaderConstraints = v4->_withoutHeaderConstraints;
    v4->_withoutHeaderConstraints = (NSArray *)v83;

    -[CLKUIColoringLabel firstBaselineAnchor](v4->_descriptionLine1Label, "firstBaselineAnchor");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel lastBaselineAnchor](v4->_headerLabel, "lastBaselineAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v214, "constraintEqualToAnchor:constant:", v85, v78);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v242[0] = v86;
    -[CLKUIColoringLabel firstBaselineAnchor](v4->_headerLabel, "firstBaselineAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v4->_contentLayoutGuide, "topAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintEqualToAnchor:constant:", v88, *((double *)&v221 + 1));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v242[1] = v89;
    -[UILayoutGuide topAnchor](v4->_descriptionTextLayoutGuide, "topAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel lastBaselineAnchor](v4->_headerLabel, "lastBaselineAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:", v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v242[2] = v92;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v242, 3);
    v93 = objc_claimAutoreleasedReturnValue();
    withHeaderConstraints = v4->_withHeaderConstraints;
    v4->_withHeaderConstraints = (NSArray *)v93;

    -[CLKUIColoringLabel leadingAnchor](v4->_headerLabel, "leadingAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v4->_contentLayoutGuide, "leadingAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintEqualToAnchor:", v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v241[0] = v97;
    -[CLKUIColoringLabel trailingAnchor](v4->_headerLabel, "trailingAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v4->_contentLayoutGuide, "trailingAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToAnchor:", v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v241[1] = v100;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v241, 2);
    v101 = objc_claimAutoreleasedReturnValue();
    headerWithNoImageConstraints = v4->_headerWithNoImageConstraints;
    v4->_headerWithNoImageConstraints = (NSArray *)v101;

    -[NTKUpNextImageView leadingAnchor](v4->_headerImage, "leadingAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v4->_contentLayoutGuide, "leadingAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "constraintEqualToAnchor:", v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v240[0] = v105;
    -[CLKUIColoringLabel leadingAnchor](v4->_headerLabel, "leadingAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextImageView trailingAnchor](v4->_headerImage, "trailingAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = *(double *)&v223;
    objc_msgSend(v106, "constraintEqualToAnchor:constant:", v107, *(double *)&v223);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v240[1] = v109;
    -[CLKUIColoringLabel trailingAnchor](v4->_headerLabel, "trailingAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v4->_contentLayoutGuide, "trailingAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "constraintEqualToAnchor:", v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v240[2] = v112;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v240, 3);
    v113 = objc_claimAutoreleasedReturnValue();
    headerWithLeftImageConstraints = v4->_headerWithLeftImageConstraints;
    v4->_headerWithLeftImageConstraints = (NSArray *)v113;

    -[CLKUIColoringLabel leadingAnchor](v4->_headerLabel, "leadingAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v4->_contentLayoutGuide, "leadingAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "constraintEqualToAnchor:", v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v239[0] = v117;
    -[CLKUIColoringLabel trailingAnchor](v4->_headerLabel, "trailingAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextImageView leadingAnchor](v4->_headerImage, "leadingAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "constraintEqualToAnchor:constant:", v119, -v108);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v239[1] = v120;
    -[NTKUpNextImageView trailingAnchor](v4->_headerImage, "trailingAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v4->_contentLayoutGuide, "trailingAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "constraintEqualToAnchor:", v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v239[2] = v123;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v239, 3);
    v124 = objc_claimAutoreleasedReturnValue();
    headerWithRightImageConstraints = v4->_headerWithRightImageConstraints;
    v4->_headerWithRightImageConstraints = (NSArray *)v124;

    -[CLKUIColoringLabel firstBaselineAnchor](v4->_descriptionLine2Label, "firstBaselineAnchor");
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel lastBaselineAnchor](v4->_descriptionLine1Label, "lastBaselineAnchor");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v220, "constraintEqualToAnchor:constant:", v126, *((double *)&v222 + 1) + *(double *)&v224);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v238[0] = v127;
    -[CLKUIColoringLabel lastBaselineAnchor](v4->_descriptionLine2Label, "lastBaselineAnchor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v4->_descriptionTextLayoutGuide, "bottomAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "constraintEqualToAnchor:", v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v238[1] = v130;
    -[UILayoutGuide bottomAnchor](v4->_bodyImageSizingLayoutGuide, "bottomAnchor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel lastBaselineAnchor](v4->_descriptionLine2Label, "lastBaselineAnchor");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = *((double *)&v227 + 1);
    objc_msgSend(v131, "constraintEqualToAnchor:constant:", v132, *((double *)&v227 + 1));
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v238[2] = v134;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v238, 3);
    v135 = objc_claimAutoreleasedReturnValue();
    withDescription2Constraints = v4->_withDescription2Constraints;
    v4->_withDescription2Constraints = (NSArray *)v135;

    -[CLKUIColoringLabel lastBaselineAnchor](v4->_descriptionLine1Label, "lastBaselineAnchor");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v4->_descriptionTextLayoutGuide, "bottomAnchor");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "constraintLessThanOrEqualToAnchor:", v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v237[0] = v139;
    -[UILayoutGuide bottomAnchor](v4->_bodyImageSizingLayoutGuide, "bottomAnchor");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel lastBaselineAnchor](v4->_descriptionLine1Label, "lastBaselineAnchor");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "constraintEqualToAnchor:constant:", v141, v133);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v237[1] = v142;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v237, 2);
    v143 = objc_claimAutoreleasedReturnValue();
    withoutDescription2Constraints = v4->_withoutDescription2Constraints;
    v4->_withoutDescription2Constraints = (NSArray *)v143;

    -[CLKUIColoringLabel leadingAnchor](v4->_descriptionLine2Label, "leadingAnchor");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v4->_descriptionTextLayoutGuide, "leadingAnchor");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "constraintEqualToAnchor:", v146);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v236 = v147;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v236, 1);
    v148 = objc_claimAutoreleasedReturnValue();
    withoutAccessoryConstraints = v4->_withoutAccessoryConstraints;
    v4->_withoutAccessoryConstraints = (NSArray *)v148;

    -[NTKUpNextImageView heightAnchor](v4->_descriptionImageView, "heightAnchor");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "constraintEqualToConstant:", *(double *)&v227);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v235[0] = v151;
    -[NTKUpNextImageView bottomAnchor](v4->_descriptionImageView, "bottomAnchor");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v4->_contentLayoutGuide, "bottomAnchor");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "constraintEqualToAnchor:constant:", v153, -(*((double *)&v224 + 1) - *(double *)&v228));
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v235[1] = v154;
    -[UILayoutGuide leadingAnchor](v4->_descriptionTextLayoutGuide, "leadingAnchor");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextImageView trailingAnchor](v4->_descriptionImageView, "trailingAnchor");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = *((double *)&v225 + 1);
    objc_msgSend(v155, "constraintEqualToAnchor:constant:", v156, *((double *)&v225 + 1));
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v235[2] = v158;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v235, 3);
    v159 = objc_claimAutoreleasedReturnValue();
    withDescriptionImageViewConstraints = v4->_withDescriptionImageViewConstraints;
    v4->_withDescriptionImageViewConstraints = (NSArray *)v159;

    -[NTKUpNextImageView topAnchor](v4->_descriptionImageView, "topAnchor");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v4->_bodyImageSizingLayoutGuide, "topAnchor");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v211, "constraintEqualToAnchor:", v161);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    v234[0] = v162;
    -[NTKUpNextImageView bottomAnchor](v4->_descriptionImageView, "bottomAnchor");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v4->_bodyImageSizingLayoutGuide, "bottomAnchor");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "constraintEqualToAnchor:", v164);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v234[1] = v165;
    -[UILayoutGuide leadingAnchor](v4->_descriptionTextLayoutGuide, "leadingAnchor");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextImageView trailingAnchor](v4->_descriptionImageView, "trailingAnchor");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "constraintEqualToAnchor:constant:", v167, v157);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v234[2] = v168;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v234, 3);
    v169 = objc_claimAutoreleasedReturnValue();
    withStretchableDescriptionImageViewConstraints = v4->_withStretchableDescriptionImageViewConstraints;
    v4->_withStretchableDescriptionImageViewConstraints = (NSArray *)v169;

    -[UILayoutGuide leadingAnchor](v4->_descriptionTextLayoutGuide, "leadingAnchor");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v4->_contentLayoutGuide, "leadingAnchor");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "constraintEqualToAnchor:", v172);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v233 = v173;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v233, 1);
    v174 = objc_claimAutoreleasedReturnValue();
    withoutDescriptionImageViewConstraints = v4->_withoutDescriptionImageViewConstraints;
    v4->_withoutDescriptionImageViewConstraints = (NSArray *)v174;

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4->_withHeaderConstraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4->_headerWithNoImageConstraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4->_withoutDescription2Constraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4->_withoutAccessoryConstraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4->_withoutDescriptionImageViewConstraints);
    v4->_showingHeader = 1;
    v4->_headerImageEdge = 0;
    -[CLKUIColoringLabel setHidden:](v4->_descriptionLine2Label, "setHidden:", 1);
    -[NTKUpNextImageView setHidden:](v4->_descriptionImageView, "setHidden:", 1);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v216);
    -[CLKUIColoringLabel setNumberOfLines:](v4->_headerLabel, "setNumberOfLines:", 2);
    -[CLKUIColoringLabel setNumberOfLines:](v4->_descriptionLine1Label, "setNumberOfLines:", 2);

  }
  return v4;
}

id __40__NTKUpNextMultilineCell_initWithFrame___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc((Class)off_1E6BCA6E0);
  v1 = (void *)objc_msgSend(v0, "initWithFrame:options:", 4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v1, "setLineBreakMode:", 4);
  objc_msgSend(v1, "_setUseShortcutIntrinsicContentSize:", 1);
  objc_msgSend(v1, "setNowProvider:", &__block_literal_global_3_1);
  return v1;
}

uint64_t __40__NTKUpNextMultilineCell_initWithFrame___block_invoke_2()
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
  int *v9;
  int *v10;
  void *v11;
  _BOOL4 v12;
  int *v13;
  int *v14;
  int *v15;
  void *v16;
  void *v17;
  BOOL v18;
  unsigned int v19;
  NTKUpNextImageView *headerImage;
  int v21;
  int *v22;
  int *v23;
  void *v24;
  int v25;
  BOOL v26;
  _BOOL4 v27;
  void *v28;
  int *v29;
  NTKUpNextAccessoryView *v30;
  _BOOL4 v31;
  UIView **p_accessoryView;
  void *v33;
  uint64_t v34;
  UIView **v35;
  void *v36;
  NSArray *withAccessoryConstraints;
  UIView *v38;
  NTKUpNextAccessoryView *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSArray *v44;
  NSArray *v45;
  NSArray *v46;
  UIView *v47;
  id v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  NSArray *v59;
  NSArray *v60;
  int v61;
  void *v62;
  uint64_t v63;
  void *v64;
  _BOOL4 v65;
  void *v66;
  void *v67;
  int v68;
  int v69;
  _BOOL4 showingDescriptionImage;
  double v71;
  BOOL v72;
  float v73;
  uint64_t v74;
  int *v75;
  void *v76;
  void *v77;
  int *v78;
  double v79;
  uint64_t v80;
  CLKUIColoringLabel *descriptionLine1Label;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  int *v102;
  void *v103;
  int v104;
  void *v105;
  NTKUpNextAccessoryView *v106;
  void *v107;
  void *v108;
  void *v109;
  objc_super v110;
  _OWORD v111[8];
  __int128 v112;
  __int128 v113;
  double v114;
  _QWORD v115[6];
  _QWORD v116[5];

  v116[3] = *MEMORY[0x1E0C80C00];
  v114 = 0.0;
  v112 = 0u;
  v113 = 0u;
  memset(v111, 0, sizeof(v111));
  -[NTKUpNextBaseCell device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_14(v3, (uint64_t)v111);

  -[NTKUpNextBaseCell content](self, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v109 = v4;
  objc_msgSend(v4, "description2TextProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  if (self->_showingThirdLine != v8)
  {
    self->_showingThirdLine = v8;
    -[CLKUIColoringLabel setHidden:](self->_descriptionLine2Label, "setHidden:", v7 == 0);
    if (self->_showingThirdLine)
      v9 = &OBJC_IVAR___NTKUpNextMultilineCell__withoutDescription2Constraints;
    else
      v9 = &OBJC_IVAR___NTKUpNextMultilineCell__withDescription2Constraints;
    if (self->_showingThirdLine)
      v10 = &OBJC_IVAR___NTKUpNextMultilineCell__withDescription2Constraints;
    else
      v10 = &OBJC_IVAR___NTKUpNextMultilineCell__withoutDescription2Constraints;
    objc_msgSend(v6, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v9));
    objc_msgSend(v5, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v10));
  }
  objc_msgSend(v4, "headerTextProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 != 0;

  v13 = &OBJC_IVAR___NTKSiderealDataSource__locationManagerToken;
  if (self->_showingHeader != v12)
  {
    self->_showingHeader = v12;
    -[CLKUIColoringLabel setHidden:](self->_headerLabel, "setHidden:", v11 == 0);
    if (self->_showingHeader)
      v14 = &OBJC_IVAR___NTKUpNextMultilineCell__withoutHeaderConstraints;
    else
      v14 = &OBJC_IVAR___NTKUpNextMultilineCell__withHeaderConstraints;
    if (self->_showingHeader)
      v15 = &OBJC_IVAR___NTKUpNextMultilineCell__withHeaderConstraints;
    else
      v15 = &OBJC_IVAR___NTKUpNextMultilineCell__withoutHeaderConstraints;
    objc_msgSend(v6, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v14));
    objc_msgSend(v5, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v15));
  }
  objc_msgSend(v109, "headerImageProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(v109, "overrideHeaderImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      v18 = v11 == 0;
    else
      v18 = 1;
    v12 = !v18;

  }
  v19 = objc_msgSend(v109, "headerImageEdge");
  if (self->_showingHeaderImage != v12 || v19 != self->_headerImageEdge)
  {
    self->_showingHeaderImage = v12;
    self->_headerImageEdge = v19;
    headerImage = self->_headerImage;
    if (self->_showingHeaderImage)
    {
      -[NTKUpNextImageView setHidden:](headerImage, "setHidden:", 0);
      objc_msgSend(v6, "addObjectsFromArray:", self->_headerWithNoImageConstraints);
      v21 = objc_msgSend(v109, "headerImageEdge");
      if (v21 == 2)
        v22 = &OBJC_IVAR___NTKUpNextMultilineCell__headerWithLeftImageConstraints;
      else
        v22 = &OBJC_IVAR___NTKUpNextMultilineCell__headerWithRightImageConstraints;
      if (v21 == 2)
        v23 = &OBJC_IVAR___NTKUpNextMultilineCell__headerWithRightImageConstraints;
      else
        v23 = &OBJC_IVAR___NTKUpNextMultilineCell__headerWithLeftImageConstraints;
    }
    else
    {
      -[NTKUpNextImageView setHidden:](headerImage, "setHidden:", 1);
      objc_msgSend(v6, "addObjectsFromArray:", self->_headerWithLeftImageConstraints);
      v23 = &OBJC_IVAR___NTKUpNextMultilineCell__headerWithNoImageConstraints;
      v22 = &OBJC_IVAR___NTKUpNextMultilineCell__headerWithRightImageConstraints;
    }
    objc_msgSend(v6, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v22));
    objc_msgSend(v5, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v23));
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v109, "imageAccessory");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v108 = 0;
  }
  objc_msgSend(v109, "descriptionAccessory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (int)v108;
  if (v24)
    v26 = v108 == 0;
  else
    v26 = 0;
  v27 = v26;

  if (v108)
  {
    objc_msgSend(v109, "descriptionAccessory");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v28 == 0;

  }
  v29 = &OBJC_IVAR___NTKSiderealDataSource__locationManagerToken;
  if (self->_showingDescriptionAccessory == v27)
  {
    v30 = 0;
    v31 = self->_showingImageAccessory != v25;
LABEL_53:
    v104 = v31;
    goto LABEL_54;
  }
  self->_showingDescriptionAccessory = v27;
  if (!v27)
  {
    v30 = 0;
    v31 = 1;
    goto LABEL_53;
  }
  p_accessoryView = &self->_accessoryView;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = 0;
    v104 = 1;
    v13 = &OBJC_IVAR___NTKSiderealDataSource__locationManagerToken;
  }
  else
  {
    v100 = v5;
    if (self->_withAccessoryConstraints)
    {
      objc_msgSend(v6, "addObjectsFromArray:");
      withAccessoryConstraints = self->_withAccessoryConstraints;
      self->_withAccessoryConstraints = 0;

    }
    -[UIView removeFromSuperview](*p_accessoryView, "removeFromSuperview");
    v38 = *p_accessoryView;
    *p_accessoryView = 0;

    v39 = [NTKUpNextAccessoryView alloc];
    v30 = -[NTKUpNextAccessoryView initWithFrame:](v39, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[NTKUpNextAccessoryView setTranslatesAutoresizingMaskIntoConstraints:](v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_storeStrong((id *)&self->_accessoryView, v30);
    -[CLKUIColoringLabel leadingAnchor](self->_descriptionLine2Label, "leadingAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](*p_accessoryView, "trailingAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "constraintEqualToAnchor:constant:", v105, *(double *)v111);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v116[0] = v98;
    -[UIView leadingAnchor](*p_accessoryView, "leadingAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](self->_descriptionTextLayoutGuide, "leadingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintEqualToAnchor:", v94);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v116[1] = v40;
    -[UIView firstBaselineAnchor](*p_accessoryView, "firstBaselineAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel firstBaselineAnchor](self->_descriptionLine2Label, "firstBaselineAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v116[2] = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 3);
    v44 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v45 = self->_withAccessoryConstraints;
    self->_withAccessoryConstraints = v44;

    v104 = 1;
    v5 = v100;
    v13 = &OBJC_IVAR___NTKSiderealDataSource__locationManagerToken;
    v29 = &OBJC_IVAR___NTKSiderealDataSource__locationManagerToken;
  }
LABEL_54:
  objc_msgSend(v109, "descriptionAccessory");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = v30;
  -[NTKUpNextAccessoryView configureWithDescription:](v30, "configureWithDescription:", v33);

  v34 = v29[240];
  if (*((unsigned __int8 *)&self->super.super.super.super.super.super.isa + v34) == v25
    || (*((_BYTE *)&self->super.super.super.super.super.super.isa + v34) = v25, !v25))
  {
    v36 = 0;
  }
  else
  {
    v35 = &self->_accessoryView;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = 0;
    }
    else
    {
      v101 = v5;
      if (self->_withAccessoryConstraints)
      {
        objc_msgSend(v6, "addObjectsFromArray:");
        v46 = self->_withAccessoryConstraints;
        self->_withAccessoryConstraints = 0;

      }
      -[UIView removeFromSuperview](*v35, "removeFromSuperview");
      v47 = *v35;
      *v35 = 0;

      v48 = objc_alloc(MEMORY[0x1E0DC3890]);
      v49 = (void *)objc_msgSend(v48, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      objc_msgSend(v49, "setContentMode:", 1);
      objc_msgSend(v49, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_storeStrong((id *)&self->_accessoryView, v49);
      -[CLKFont capHeight](self->_italicFont, "capHeight");
      -[NTKUpNextBaseCell device](self, "device");
      v85 = 944;
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      CLKRoundForDevice();
      v52 = v51;

      -[CLKUIColoringLabel leadingAnchor](self->_descriptionLine2Label, "leadingAnchor");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](*v35, "trailingAnchor");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "constraintEqualToAnchor:constant:", v97, *(double *)v111);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v115[0] = v95;
      -[UIView centerYAnchor](*v35, "centerYAnchor");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIColoringLabel firstBaselineAnchor](self->_descriptionLine2Label, "firstBaselineAnchor");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "constraintEqualToAnchor:constant:", v92, -v52);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v115[1] = v91;
      -[UIView leadingAnchor](*v35, "leadingAnchor");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKUpNextMultilineCell contentView](self, "contentView");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "leadingAnchor");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "constraintEqualToAnchor:constant:", v88, *(double *)&v112);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v115[2] = v87;
      -[UIView widthAnchor](*v35, "widthAnchor");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "constraintLessThanOrEqualToConstant:", *((double *)&v113 + 1));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v115[3] = v53;
      -[UIView heightAnchor](*v35, "heightAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v114;
      objc_msgSend(v54, "constraintLessThanOrEqualToConstant:", v114);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v115[4] = v56;
      -[UIView widthAnchor](*v35, "widthAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "constraintGreaterThanOrEqualToConstant:", v55);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v115[5] = v58;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 6);
      v59 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v60 = self->_withAccessoryConstraints;
      self->_withAccessoryConstraints = v59;

      v36 = v49;
      v5 = v101;
    }
    v13 = &OBJC_IVAR___NTKSiderealDataSource__locationManagerToken;
  }
  v61 = v27 | v25;
  objc_msgSend(v108, "image", v85);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "image");
  v63 = objc_claimAutoreleasedReturnValue();

  v103 = (void *)v63;
  objc_msgSend(v36, "setImage:", v63);
  if (v104)
  {
    if (v61)
    {
      -[NTKUpNextMultilineCell contentView](self, "contentView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "addSubview:", self->_accessoryView);

      objc_msgSend(v5, "addObjectsFromArray:", self->_withAccessoryConstraints);
      objc_msgSend(v6, "addObjectsFromArray:", self->_withoutAccessoryConstraints);
LABEL_70:
      v65 = 0;
      goto LABEL_76;
    }
    objc_msgSend(v6, "addObjectsFromArray:", self->_withAccessoryConstraints);
    objc_msgSend(v5, "addObjectsFromArray:", self->_withoutAccessoryConstraints);
    -[UIView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
  }
  else if ((v61 & 1) != 0)
  {
    goto LABEL_70;
  }
  objc_msgSend(v109, "bodyImageProvider");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66)
  {
    v65 = 1;
  }
  else
  {
    objc_msgSend(v109, "overrideBodyImage");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v67 != 0;

  }
LABEL_76:
  v68 = objc_msgSend(v109, "bodyImageShouldStretch");
  v69 = v68;
  if (self->_showingDescriptionImage != v65 || self->_usingStretchableImage != v68)
  {
    self->_showingDescriptionImage = v65;
    self->_usingStretchableImage = v68;
    showingDescriptionImage = self->_showingDescriptionImage;
    if (self->_showingDescriptionImage)
    {
      objc_msgSend(v6, "addObjectsFromArray:", self->_withoutDescriptionImageViewConstraints);
      v72 = v69 == 0;
      if (v69)
        v73 = 250.0;
      else
        v73 = 1000.0;
      if (v69)
        v74 = 0;
      else
        v74 = 6;
      v75 = &OBJC_IVAR___NTKUpNextMultilineCell__withStretchableDescriptionImageViewConstraints;
      v76 = v6;
      v77 = v5;
      if (v72)
        v78 = &OBJC_IVAR___NTKUpNextMultilineCell__withStretchableDescriptionImageViewConstraints;
      else
        v78 = &OBJC_IVAR___NTKUpNextMultilineCell__withDescriptionImageViewConstraints;
      if (v72)
        v75 = &OBJC_IVAR___NTKUpNextMultilineCell__withDescriptionImageViewConstraints;
      v102 = v75;
      *(float *)&v71 = v73;
      -[NTKUpNextImageView setContentHuggingPriority:forAxis:](self->_descriptionImageView, "setContentHuggingPriority:forAxis:", 1, v71);
      *(float *)&v79 = v73;
      -[NTKUpNextImageView setContentCompressionResistancePriority:forAxis:](self->_descriptionImageView, "setContentCompressionResistancePriority:forAxis:", 1, v79);
      -[NTKUpNextImageView setContentMode:](self->_descriptionImageView, "setContentMode:", v74);
      v80 = *v78;
      v5 = v77;
      v6 = v76;
      objc_msgSend(v76, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + v80));
      objc_msgSend(v5, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v102));
    }
    else
    {
      objc_msgSend(v6, "addObjectsFromArray:", self->_withDescriptionImageViewConstraints);
      objc_msgSend(v6, "addObjectsFromArray:", self->_withStretchableDescriptionImageViewConstraints);
      objc_msgSend(v5, "addObjectsFromArray:", self->_withoutDescriptionImageViewConstraints);
    }
    -[NTKUpNextImageView setHidden:](self->_descriptionImageView, "setHidden:", !showingDescriptionImage);
  }
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v6);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v5);
  if (self->_showingThirdLine)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v13[216]), "setNumberOfLines:", 1);
    descriptionLine1Label = self->_descriptionLine1Label;
    if (self->_showingHeader)
      v82 = 1;
    else
      v82 = 2;
  }
  else
  {
    if (self->_showingHeaderImage || self->_showingDescriptionImage)
    {
      v83 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v13[216]);
      v84 = 1;
    }
    else
    {
      if (!self->_showingHeader)
      {
        descriptionLine1Label = self->_descriptionLine1Label;
        v82 = 3;
        goto LABEL_102;
      }
      v83 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v13[216]);
      v84 = 2;
    }
    objc_msgSend(v83, "setNumberOfLines:", v84);
    descriptionLine1Label = self->_descriptionLine1Label;
    v82 = 2;
  }
LABEL_102:
  -[CLKUIColoringLabel setNumberOfLines:](descriptionLine1Label, "setNumberOfLines:", v82);
  v110.receiver = self;
  v110.super_class = (Class)NTKUpNextMultilineCell;
  -[NTKUpNextMultilineCell updateConstraints](&v110, sel_updateConstraints);

}

- (void)configureWithContent:(id)a3
{
  id v4;
  void (**v5)(void *, CLKUIColoringLabel *, uint64_t);
  NTKUpNextImageView *headerImage;
  void *v7;
  NTKUpNextImageView *v8;
  void *v9;
  void *v10;
  NTKUpNextImageView *descriptionImageView;
  void *v12;
  NTKUpNextImageView *v13;
  void *v14;
  void *v15;
  NTKUpNextImageView *v16;
  void *v17;
  CLKUIColoringLabel *headerLabel;
  void *v19;
  CLKUIColoringLabel *descriptionLine1Label;
  void *v21;
  CLKUIColoringLabel *descriptionLine2Label;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD aBlock[5];
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)NTKUpNextMultilineCell;
  v4 = a3;
  -[NTKUpNextBaseCell configureWithContent:](&v28, sel_configureWithContent_, v4);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__NTKUpNextMultilineCell_configureWithContent___block_invoke;
  aBlock[3] = &unk_1E6BD1FF8;
  aBlock[4] = self;
  v5 = (void (**)(void *, CLKUIColoringLabel *, uint64_t))_Block_copy(aBlock);
  v5[2](v5, self->_descriptionLine1Label, objc_msgSend(v4, "description1FontStyle"));
  v5[2](v5, self->_descriptionLine2Label, objc_msgSend(v4, "description2FontStyle"));
  headerImage = self->_headerImage;
  objc_msgSend(v4, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextImageView setFallbackTintColor:](headerImage, "setFallbackTintColor:", v7);

  v8 = self->_headerImage;
  objc_msgSend(v4, "overrideHeaderImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerImageProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextImageView setFullColorImage:tintableImageProvider:](v8, "setFullColorImage:tintableImageProvider:", v9, v10);

  descriptionImageView = self->_descriptionImageView;
  objc_msgSend(v4, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextImageView setFallbackTintColor:](descriptionImageView, "setFallbackTintColor:", v12);

  v13 = self->_descriptionImageView;
  objc_msgSend(v4, "overrideBodyImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bodyImageProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextImageView setFullColorImage:tintableImageProvider:](v13, "setFullColorImage:tintableImageProvider:", v14, v15);

  v16 = self->_descriptionImageView;
  objc_msgSend(v4, "bodyImageCompositingFilter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextImageView setCompositingFilter:](v16, "setCompositingFilter:", v17);

  headerLabel = self->_headerLabel;
  objc_msgSend(v4, "headerTextProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  __47__NTKUpNextMultilineCell_configureWithContent___block_invoke_2((uint64_t)v19, headerLabel, v19);

  descriptionLine1Label = self->_descriptionLine1Label;
  objc_msgSend(v4, "description1TextProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  __47__NTKUpNextMultilineCell_configureWithContent___block_invoke_2((uint64_t)v21, descriptionLine1Label, v21);

  descriptionLine2Label = self->_descriptionLine2Label;
  objc_msgSend(v4, "description2TextProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  __47__NTKUpNextMultilineCell_configureWithContent___block_invoke_2((uint64_t)v23, descriptionLine2Label, v23);

  objc_msgSend(v4, "headerTextProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  objc_msgSend(v4, "description1TextProvider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  objc_msgSend(v4, "description2TextProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));
  -[NTKUpNextMultilineCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

void __47__NTKUpNextMultilineCell_configureWithContent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  int *v7;
  id v8;

  v5 = a2;
  v6 = 0.0;
  v8 = v5;
  v7 = &OBJC_IVAR___NTKUpNextMultilineCell__standardFont;
  switch(a3)
  {
    case 0:
      goto LABEL_7;
    case 1:
      if (!CLKIsCurrentLocaleNonLatin())
        v7 = &OBJC_IVAR___NTKUpNextMultilineCell__italicFont;
      goto LABEL_7;
    case 2:
      v7 = &OBJC_IVAR___NTKUpNextMultilineCell__boldFont;
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

void __47__NTKUpNextMultilineCell_configureWithContent___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  v12 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {

    v10 = v12;
    goto LABEL_8;
  }
  objc_msgSend(v6, "shortText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  v10 = v12;
  if (v9)
  {
LABEL_8:
    +[NTKUpNextBaseCell clearLabel:](NTKUpNextBaseCell, "clearLabel:", v10);
    objc_msgSend(v12, "setTextProvider:", v4);
    goto LABEL_9;
  }
  objc_msgSend(v12, "setTextProvider:", 0);
  objc_msgSend(v6, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

LABEL_9:
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKUpNextMultilineCell;
  -[NTKUpNextBaseCell setPaused:](&v8, sel_setPaused_);
  -[CLKUIColoringLabel textProvider](self->_headerLabel, "textProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPaused:", v3);

  -[CLKUIColoringLabel textProvider](self->_descriptionLine1Label, "textProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPaused:", v3);

  -[CLKUIColoringLabel textProvider](self->_descriptionLine2Label, "textProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPaused:", v3);

}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  NTKUpNextImageView *v8;
  void *v9;
  void *v10;

  v8 = (NTKUpNextImageView *)a3;
  if (self->_descriptionImageView == v8)
    a4 = CLKUIAssociatedNonAccentStyle();
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filtersForView:style:fraction:", v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  NTKUpNextImageView *v6;
  void *v7;
  void *v8;

  v6 = (NTKUpNextImageView *)a3;
  if (self->_descriptionImageView == v6)
    a4 = CLKUIAssociatedNonAccentStyle();
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filtersForView:style:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  NTKUpNextImageView *v8;
  void *v9;
  void *v10;

  v8 = (NTKUpNextImageView *)a3;
  if (self->_descriptionImageView == v8)
    a4 = CLKUIAssociatedNonAccentStyle();
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filterForView:style:fraction:", v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  NTKUpNextImageView *v6;
  void *v7;
  void *v8;

  v6 = (NTKUpNextImageView *)a3;
  if (self->_descriptionImageView == v6)
    a4 = CLKUIAssociatedNonAccentStyle();
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filterForView:style:", v6, a4);
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
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKUpNextMultilineCell;
  -[NTKUpNextBaseCell prepareForReuse](&v5, sel_prepareForReuse);
  -[NTKUpNextImageView transitionToMonochromeWithFraction:](self->_headerImage, "transitionToMonochromeWithFraction:", 0.0);
  -[NTKUpNextImageView transitionToMonochromeWithFraction:](self->_descriptionImageView, "transitionToMonochromeWithFraction:", 0.0);
  -[CLKUIColoringLabel layer](self->_headerLabel, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilters:", 0);

  -[UIView layer](self->_accessoryView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilters:", 0);

}

- (void)setFilterProvider:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKUpNextMultilineCell;
  v4 = a3;
  -[NTKUpNextBaseCell setFilterProvider:](&v5, sel_setFilterProvider_, v4);
  -[NTKUpNextImageView setFilterProvider:](self->_headerImage, "setFilterProvider:", v4, v5.receiver, v5.super_class);

}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[NTKUpNextImageView transitionToMonochromeWithFraction:](self->_headerImage, "transitionToMonochromeWithFraction:");
  -[NTKUpNextImageView transitionToMonochromeWithFraction:](self->_descriptionImageView, "transitionToMonochromeWithFraction:", a3);
  if (fabs(a3) >= 0.00000011920929)
  {
    -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filtersForView:style:fraction:", self, 2, a3);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[CLKUIColoringLabel layer](self->_headerLabel, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFilters:", v11);

    }
    -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filtersForView:style:fraction:", self, 1, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[UIView layer](self->_accessoryView, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFilters:", v9);

    }
  }
  else
  {
    -[CLKUIColoringLabel layer](self->_headerLabel, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFilters:", 0);

    -[UIView layer](self->_accessoryView, "layer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFilters:", 0);
  }

}

- (void)updateMonochromeColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NTKUpNextImageView updateMonochromeColor](self->_headerImage, "updateMonochromeColor");
  -[NTKUpNextImageView updateMonochromeColor](self->_descriptionImageView, "updateMonochromeColor");
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filtersForView:style:", self, 2);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CLKUIColoringLabel layer](self->_headerLabel, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFilters:", v8);

  }
  -[NTKUpNextBaseCell filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filtersForView:style:", self, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIView layer](self->_accessoryView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFilters:", v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_withoutDescriptionImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_withStretchableDescriptionImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_withDescriptionImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_withoutAccessoryConstraints, 0);
  objc_storeStrong((id *)&self->_withAccessoryConstraints, 0);
  objc_storeStrong((id *)&self->_withoutDescription2Constraints, 0);
  objc_storeStrong((id *)&self->_withDescription2Constraints, 0);
  objc_storeStrong((id *)&self->_headerWithNoImageConstraints, 0);
  objc_storeStrong((id *)&self->_headerWithRightImageConstraints, 0);
  objc_storeStrong((id *)&self->_headerWithLeftImageConstraints, 0);
  objc_storeStrong((id *)&self->_withoutHeaderConstraints, 0);
  objc_storeStrong((id *)&self->_withHeaderConstraints, 0);
  objc_storeStrong((id *)&self->_boldFont, 0);
  objc_storeStrong((id *)&self->_italicFont, 0);
  objc_storeStrong((id *)&self->_standardFont, 0);
  objc_storeStrong((id *)&self->_descriptionImageView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_storeStrong((id *)&self->_descriptionLine2Label, 0);
  objc_storeStrong((id *)&self->_descriptionLine1Label, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_bodyImageSizingLayoutGuide, 0);
  objc_storeStrong((id *)&self->_descriptionTextLayoutGuide, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
}

@end
