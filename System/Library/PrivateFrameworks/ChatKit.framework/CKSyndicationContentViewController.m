@implementation CKSyndicationContentViewController

- (CKSyndicationContentViewController)initWithIndex:(unint64_t)a3
{
  CKSyndicationContentViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  CKSyndicationContentViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  objc_super v16;
  objc_super v17;

  v4 = self;
  -[CKSyndicationContentViewController setOnboardingPage:](self, "setOnboardingPage:");
  switch(a3)
  {
    case 2uLL:
      CKFrameworkBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_SYNDICATION_PINS_DETAIL_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      CKFrameworkBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_SYNDICATION_PINS_DETAIL_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v9 = -[CKSyndicationContentViewController initWithTitle:detailText:icon:](&v15, sel_initWithTitle_detailText_icon_, v6, v8, 0, v4, CKSyndicationContentViewController, v16.receiver, v16.super_class, v17.receiver, v17.super_class);
LABEL_9:
      v4 = v9;

      return v4;
    case 1uLL:
      CKFrameworkBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_SYNDICATION_PHOTOS_DETAIL_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      CKFrameworkBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_SYNDICATION_PHOTOS_DETAIL_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v9 = -[CKSyndicationContentViewController initWithTitle:detailText:icon:](&v16, sel_initWithTitle_detailText_icon_, v6, v8, 0, v15.receiver, v15.super_class, v4, CKSyndicationContentViewController, v17.receiver, v17.super_class);
      goto LABEL_9;
    case 0uLL:
      CKFrameworkBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_SYNDICATION_DETAIL_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      CKFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_SYNDICATION_DETAIL_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("WHATS_NEW_SYNDICATION_DETAIL_DESCRIPTION_MAC")))
      {

        v8 = CFSTR("Content shared in Messages can automatically appear in apps such as Photos, Safari, and more.");
      }
      v9 = -[CKSyndicationContentViewController initWithTitle:detailText:icon:](&v17, sel_initWithTitle_detailText_icon_, v6, v8, 0, v15.receiver, v15.super_class, v16.receiver, v16.super_class, v4, CKSyndicationContentViewController);
      goto LABEL_9;
  }
  return v4;
}

- (void)loadView
{
  unint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKSyndicationContentViewController;
  -[OBBaseWelcomeController loadView](&v4, sel_loadView);
  v3 = -[CKSyndicationContentViewController onboardingPage](self, "onboardingPage");
  switch(v3)
  {
    case 2uLL:
      -[CKSyndicationContentViewController setUpHighlightsContent](self, "setUpHighlightsContent");
      break;
    case 1uLL:
      -[CKSyndicationContentViewController setUpPhotosContent](self, "setUpPhotosContent");
      break;
    case 0uLL:
      -[CKSyndicationContentViewController setUpSharedWithYouContentCollectionView](self, "setUpSharedWithYouContentCollectionView");
      break;
  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)CKSyndicationContentViewController;
  -[OBBaseWelcomeController viewDidLayoutSubviews](&v48, sel_viewDidLayoutSubviews);
  -[CKSyndicationContentViewController updateMaxContentSize](self, "updateMaxContentSize");
  -[CKSyndicationContentViewController micropillView1](self, "micropillView1");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4 * 0.5;
  -[CKSyndicationContentViewController micropillView1](self, "micropillView1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", v5);

  -[CKSyndicationContentViewController micropillView2](self, "micropillView2");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9 * 0.5;
  -[CKSyndicationContentViewController micropillView2](self, "micropillView2");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", v10);

  -[CKSyndicationContentViewController tvPinIconView](self, "tvPinIconView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14 * 0.5;
  -[CKSyndicationContentViewController tvPinIconView](self, "tvPinIconView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCornerRadius:", v15);

  -[CKSyndicationContentViewController podcastPinIconView](self, "podcastPinIconView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v20 = v19 * 0.5;
  -[CKSyndicationContentViewController podcastPinIconView](self, "podcastPinIconView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCornerRadius:", v20);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "messageHighlightTranscriptBalloonBorderWidth");
  v25 = v24;

  -[CKSyndicationContentViewController tvPinIconView](self, "tvPinIconView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBorderWidth:", v25);

  -[CKSyndicationContentViewController podcastPinIconView](self, "podcastPinIconView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBorderWidth:", v25);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v31 = objc_msgSend(v30, "CGColor");
  -[CKSyndicationContentViewController tvPinIconView](self, "tvPinIconView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setBorderColor:", v31);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v35 = objc_msgSend(v34, "CGColor");
  -[CKSyndicationContentViewController podcastPinIconView](self, "podcastPinIconView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setBorderColor:", v35);

  -[CKSyndicationContentViewController podcastLinkBalloonView](self, "podcastLinkBalloonView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "bounds");
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  -[CKSyndicationContentViewController gradientLayer](self, "gradientLayer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setFrame:", v40, v42, v44, v46);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __89__CKSyndicationContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_1E274B4D0;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v4, 0);
}

uint64_t __89__CKSyndicationContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateMaxContentSize");
}

- (void)updateMaxContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  id v20;

  -[CKSyndicationContentViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "origin");
  v5 = v4;
  -[CKSyndicationContentViewController headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v5 + v7;

  -[CKSyndicationContentViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10 - v8;

  -[CKSyndicationContentViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;

  -[CKSyndicationContentViewController setMaxContentSize:](self, "setMaxContentSize:", v14, v11);
  if (!CKIsRunningInMacCatalyst())
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v14 = v16;

    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v19 = v18;

    if (v14 > v19)
      v11 = v14;
    else
      v11 = v19;
    if (v14 > v19)
      v14 = v19;
  }
  -[CKSyndicationContentViewController sharedWithYouViewController](self, "sharedWithYouViewController");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMaxContentSize:", v14, v11);

}

- (void)setMaxContentSize:(CGSize)a3
{
  id v4;

  if (a3.width != self->_maxContentSize.width || a3.height != self->_maxContentSize.height)
  {
    self->_maxContentSize = a3;
    -[CKSyndicationContentViewController view](self, "view");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsUpdateConstraints");

  }
}

- (void)updateViewConstraints
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  _BOOL4 v40;
  double v41;
  double v42;
  double v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
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
  void *v102;
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
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
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
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  uint64_t v260;
  void *v261;
  uint64_t v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  uint64_t v267;
  void *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  uint64_t v278;
  void *v279;
  uint64_t v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  objc_super v286;
  _QWORD v287[24];
  _QWORD v288[16];
  _QWORD v289[17];
  _QWORD v290[4];

  v290[2] = *MEMORY[0x1E0C80C00];
  -[CKSyndicationContentViewController constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = 0x1E0CB3000uLL;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CB3718];
    -[CKSyndicationContentViewController constraints](self, "constraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deactivateConstraints:", v7);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationContentViewController setConstraints:](self, "setConstraints:", v8);

  -[CKSyndicationContentViewController contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationContentViewController maxContentSize](self, "maxContentSize");
  v11 = v10;
  v12 = v10 * 0.5;
  -[CKSyndicationContentViewController traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayScale");
  -[CKSyndicationContentViewController setPhotoLongSide:](self, "setPhotoLongSide:", round(v12 * v14) / v14);

  -[CKSyndicationContentViewController traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayScale");
  -[CKSyndicationContentViewController setPhotoShortSide:](self, "setPhotoShortSide:", round(v12 * 0.8 * v16) / v16);

  -[CKSyndicationContentViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v19 = v18;

  -[CKSyndicationContentViewController photoShortSide](self, "photoShortSide");
  v21 = v20;
  -[CKSyndicationContentViewController maxContentSize](self, "maxContentSize");
  if (v21 >= v22 * 0.25)
  {
    v29 = v19 / 15.0;
  }
  else
  {
    -[CKSyndicationContentViewController traitCollection](self, "traitCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "displayScale");
    -[CKSyndicationContentViewController setPhotoLongSide:](self, "setPhotoLongSide:", round(v11 * 0.6 * v24) / v24);

    -[CKSyndicationContentViewController traitCollection](self, "traitCollection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "displayScale");
    -[CKSyndicationContentViewController setPhotoShortSide:](self, "setPhotoShortSide:", round(v11 * 0.6 * 0.8 * v26) / v26);

    -[CKSyndicationContentViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bounds");
    v29 = v28 * 0.125;

  }
  if (IMSharedHelperDeviceIsiPad() && !CKIsRunningInMacCatalyst())
  {
    -[CKSyndicationContentViewController traitCollection](self, "traitCollection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "displayScale");
    -[CKSyndicationContentViewController setPhotoLongSide:](self, "setPhotoLongSide:", round(v11 * 0.6 * v31) / v31);

    -[CKSyndicationContentViewController traitCollection](self, "traitCollection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "displayScale");
    -[CKSyndicationContentViewController setPhotoShortSide:](self, "setPhotoShortSide:", round(v11 * 0.6 * 0.8 * v33) / v33);

    -[CKSyndicationContentViewController view](self, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bounds");
    v29 = v35 / 12.0;

  }
  -[CKSyndicationContentViewController maxContentSize](self, "maxContentSize");
  v37 = v36 * 1.2;
  -[CKSyndicationContentViewController maxContentSize](self, "maxContentSize");
  v39 = v38;
  v40 = v37 < v38;
  if (IMSharedHelperDeviceIsiPad() && !CKIsRunningInMacCatalyst())
  {
    v41 = 0.4;
    v42 = 0.3;
    v43 = 0.12;
  }
  else if (CKIsRunningInMacCatalyst())
  {
    v41 = 0.5;
    v42 = 0.35;
    v43 = 0.15;
  }
  else
  {
    v43 = dbl_18E7CB6E0[v40];
    v42 = dbl_18E7CB6F0[v40];
    v41 = dbl_18E7CB700[v40];
  }
  v44 = -[CKSyndicationContentViewController onboardingPage](self, "onboardingPage");
  if (v44 == 2)
  {
    v259 = v9;
    if (v37 >= v39 || (IMSharedHelperDeviceIsiPad() & 1) != 0)
    {
      -[CKSyndicationContentViewController constraints](self, "constraints");
      v275 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController tvLinkBalloonView](self, "tvLinkBalloonView");
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v283, "widthAnchor");
      v272 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController view](self, "view");
      v266 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v266, "widthAnchor");
      v269 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v272, "constraintEqualToAnchor:multiplier:", v269, v41);
      v278 = objc_claimAutoreleasedReturnValue();
      v287[0] = v278;
      -[CKSyndicationContentViewController tvLinkBalloonView](self, "tvLinkBalloonView");
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v263, "heightAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController view](self, "view");
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v284, "widthAnchor");
      v260 = objc_claimAutoreleasedReturnValue();
      v285 = v55;
      objc_msgSend(v55, "constraintEqualToAnchor:multiplier:", v260, v42);
      v282 = (void *)objc_claimAutoreleasedReturnValue();
      v287[1] = v282;
      -[CKSyndicationContentViewController podcastLinkBalloonView](self, "podcastLinkBalloonView");
      v281 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v281, "widthAnchor");
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController view](self, "view");
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v257, "widthAnchor");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "constraintEqualToAnchor:multiplier:", v253, v41);
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      v287[2] = v251;
      -[CKSyndicationContentViewController podcastLinkBalloonView](self, "podcastLinkBalloonView");
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v249, "heightAnchor");
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController view](self, "view");
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v247, "widthAnchor");
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v245, "constraintEqualToAnchor:multiplier:", v243, v43);
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      v287[3] = v241;
      -[CKSyndicationContentViewController musicLinkBalloonView](self, "musicLinkBalloonView");
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v239, "widthAnchor");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController view](self, "view");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v237, "widthAnchor");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v235, "constraintEqualToAnchor:multiplier:", v233, v41);
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      v287[4] = v231;
      -[CKSyndicationContentViewController musicLinkBalloonView](self, "musicLinkBalloonView");
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v229, "heightAnchor");
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController view](self, "view");
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v227, "widthAnchor");
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v225, "constraintEqualToAnchor:multiplier:", v223, v43);
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      v287[5] = v221;
      -[CKSyndicationContentViewController gradientView](self, "gradientView");
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v219, "widthAnchor");
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController view](self, "view");
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v216, "widthAnchor");
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v213, "constraintEqualToAnchor:multiplier:", v210, v41);
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      v287[6] = v207;
      -[CKSyndicationContentViewController gradientView](self, "gradientView");
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v204, "heightAnchor");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController view](self, "view");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v201, "widthAnchor");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "constraintEqualToAnchor:multiplier:", v195, v43);
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      v287[7] = v192;
      -[CKSyndicationContentViewController tvLinkBalloonView](self, "tvLinkBalloonView");
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v189, "topAnchor");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "topAnchor");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "constraintEqualToAnchor:", v183);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      v287[8] = v180;
      -[CKSyndicationContentViewController podcastLinkBalloonView](self, "podcastLinkBalloonView");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v177, "topAnchor");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController tvLinkBalloonView](self, "tvLinkBalloonView");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "bottomAnchor");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v171, "constraintEqualToAnchor:constant:", v168, 10.0);
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      v287[9] = v165;
      -[CKSyndicationContentViewController musicLinkBalloonView](self, "musicLinkBalloonView");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "topAnchor");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController podcastLinkBalloonView](self, "podcastLinkBalloonView");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "bottomAnchor");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "constraintEqualToAnchor:constant:", v153, 10.0);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      v287[10] = v150;
      -[CKSyndicationContentViewController tvLinkBalloonView](self, "tvLinkBalloonView");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "centerXAnchor");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "centerXAnchor");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "constraintEqualToAnchor:", v144);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v287[11] = v142;
      -[CKSyndicationContentViewController podcastLinkBalloonView](self, "podcastLinkBalloonView");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "centerXAnchor");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "centerXAnchor");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "constraintEqualToAnchor:", v136);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v287[12] = v134;
      -[CKSyndicationContentViewController musicLinkBalloonView](self, "musicLinkBalloonView");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "centerXAnchor");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "centerXAnchor");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "constraintEqualToAnchor:", v128);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v287[13] = v127;
      -[CKSyndicationContentViewController gradientView](self, "gradientView");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "topAnchor");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController podcastLinkBalloonView](self, "podcastLinkBalloonView");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "bottomAnchor");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "constraintEqualToAnchor:constant:", v123, 10.0);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v287[14] = v122;
      -[CKSyndicationContentViewController gradientView](self, "gradientView");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "centerXAnchor");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "centerXAnchor");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "constraintEqualToAnchor:", v119);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v287[15] = v118;
      -[CKSyndicationContentViewController tvPinIconView](self, "tvPinIconView");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "topAnchor");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController tvLinkBalloonView](self, "tvLinkBalloonView");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "bottomAnchor");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "constraintEqualToAnchor:constant:", v114, -11.0);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v287[16] = v113;
      -[CKSyndicationContentViewController tvPinIconView](self, "tvPinIconView");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "leadingAnchor");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController tvLinkBalloonView](self, "tvLinkBalloonView");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "trailingAnchor");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "constraintEqualToAnchor:constant:", v109, -11.0);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v287[17] = v108;
      -[CKSyndicationContentViewController tvPinIconView](self, "tvPinIconView");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "widthAnchor");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "constraintEqualToConstant:", 22.0);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v287[18] = v105;
      -[CKSyndicationContentViewController tvPinIconView](self, "tvPinIconView");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "heightAnchor");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "constraintEqualToConstant:", 22.0);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v287[19] = v102;
      -[CKSyndicationContentViewController podcastPinIconView](self, "podcastPinIconView");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "topAnchor");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController podcastLinkBalloonView](self, "podcastLinkBalloonView");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "bottomAnchor");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "constraintEqualToAnchor:constant:", v98, -11.0);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v287[20] = v97;
      -[CKSyndicationContentViewController podcastPinIconView](self, "podcastPinIconView");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "leadingAnchor");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController podcastLinkBalloonView](self, "podcastLinkBalloonView");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "trailingAnchor");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "constraintEqualToAnchor:constant:", v93, -11.0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v287[21] = v56;
      -[CKSyndicationContentViewController podcastPinIconView](self, "podcastPinIconView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "widthAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "constraintEqualToConstant:", 22.0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v287[22] = v59;
      -[CKSyndicationContentViewController podcastPinIconView](self, "podcastPinIconView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "heightAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "constraintEqualToConstant:", 22.0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v287[23] = v62;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v287, 24);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v275;
      objc_msgSend(v275, "addObjectsFromArray:", v63);

      v47 = v266;
      v54 = (void *)v260;

      v50 = v263;
      v48 = (void *)v269;

      v46 = v272;
      v9 = v259;

      v49 = (void *)v278;
      v64 = v213;
    }
    else
    {
      -[CKSyndicationContentViewController podcastPinIconView](self, "podcastPinIconView");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "removeFromSuperview");

      -[CKSyndicationContentViewController constraints](self, "constraints");
      v277 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController tvLinkBalloonView](self, "tvLinkBalloonView");
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v283, "widthAnchor");
      v274 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController view](self, "view");
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v268, "widthAnchor");
      v271 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v274, "constraintEqualToAnchor:multiplier:", v271, v41);
      v280 = objc_claimAutoreleasedReturnValue();
      v288[0] = v280;
      -[CKSyndicationContentViewController tvLinkBalloonView](self, "tvLinkBalloonView");
      v265 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v265, "heightAnchor");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController view](self, "view");
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v284, "widthAnchor");
      v262 = objc_claimAutoreleasedReturnValue();
      v285 = v80;
      objc_msgSend(v80, "constraintEqualToAnchor:multiplier:", v262, v42);
      v282 = (void *)objc_claimAutoreleasedReturnValue();
      v288[1] = v282;
      -[CKSyndicationContentViewController podcastLinkBalloonView](self, "podcastLinkBalloonView");
      v281 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v281, "widthAnchor");
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController view](self, "view");
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v257, "widthAnchor");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "constraintEqualToAnchor:multiplier:", v253, v41);
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      v288[2] = v251;
      -[CKSyndicationContentViewController podcastLinkBalloonView](self, "podcastLinkBalloonView");
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v249, "heightAnchor");
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController view](self, "view");
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v247, "widthAnchor");
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v245, "constraintEqualToAnchor:multiplier:", v243, v43);
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      v288[3] = v241;
      -[CKSyndicationContentViewController gradientView](self, "gradientView");
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v239, "widthAnchor");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController view](self, "view");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v237, "widthAnchor");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v235, "constraintEqualToAnchor:multiplier:", v233, v41);
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      v288[4] = v231;
      -[CKSyndicationContentViewController gradientView](self, "gradientView");
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v229, "heightAnchor");
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController view](self, "view");
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v227, "widthAnchor");
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v225, "constraintEqualToAnchor:multiplier:", v223, v43);
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      v288[5] = v221;
      -[CKSyndicationContentViewController tvLinkBalloonView](self, "tvLinkBalloonView");
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v219, "topAnchor");
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "topAnchor");
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v218, "constraintEqualToAnchor:", v215);
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      v288[6] = v212;
      -[CKSyndicationContentViewController podcastLinkBalloonView](self, "podcastLinkBalloonView");
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v209, "topAnchor");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController tvLinkBalloonView](self, "tvLinkBalloonView");
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "bottomAnchor");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "constraintEqualToAnchor:constant:", v200, 10.0);
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      v288[7] = v197;
      -[CKSyndicationContentViewController tvLinkBalloonView](self, "tvLinkBalloonView");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v194, "centerXAnchor");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "centerXAnchor");
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v191, "constraintEqualToAnchor:", v188);
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      v288[8] = v185;
      -[CKSyndicationContentViewController podcastLinkBalloonView](self, "podcastLinkBalloonView");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v182, "centerXAnchor");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "centerXAnchor");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "constraintEqualToAnchor:", v176);
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      v288[9] = v173;
      -[CKSyndicationContentViewController gradientView](self, "gradientView");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "topAnchor");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController tvLinkBalloonView](self, "tvLinkBalloonView");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "bottomAnchor");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v164, "constraintEqualToAnchor:constant:", v161, 10.0);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      v288[10] = v158;
      -[CKSyndicationContentViewController gradientView](self, "gradientView");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "centerXAnchor");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "centerXAnchor");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "constraintEqualToAnchor:", v149);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v288[11] = v147;
      -[CKSyndicationContentViewController tvPinIconView](self, "tvPinIconView");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "topAnchor");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController tvLinkBalloonView](self, "tvLinkBalloonView");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "bottomAnchor");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "constraintEqualToAnchor:constant:", v139, -11.0);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      v288[12] = v137;
      -[CKSyndicationContentViewController tvPinIconView](self, "tvPinIconView");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "leadingAnchor");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSyndicationContentViewController tvLinkBalloonView](self, "tvLinkBalloonView");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "trailingAnchor");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "constraintEqualToAnchor:constant:", v129, -11.0);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v288[13] = v81;
      -[CKSyndicationContentViewController tvPinIconView](self, "tvPinIconView");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "widthAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "constraintEqualToConstant:", 22.0);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v288[14] = v84;
      -[CKSyndicationContentViewController tvPinIconView](self, "tvPinIconView");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "heightAnchor");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "constraintEqualToConstant:", 22.0);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v288[15] = v87;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v288, 16);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v277;
      objc_msgSend(v277, "addObjectsFromArray:", v88);

      v54 = (void *)v262;
      v50 = v265;

      v48 = (void *)v271;
      v49 = (void *)v280;

      v46 = v274;
      v9 = v259;

      v47 = v268;
      v64 = v218;
    }

    v5 = 0x1E0CB3000uLL;
  }
  else if (v44 == 1)
  {
    -[CKSyndicationContentViewController constraints](self, "constraints");
    v276 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSyndicationContentViewController highlightsView1](self, "highlightsView1");
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v283, "topAnchor");
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v267 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v273, "constraintEqualToAnchor:constant:", v267, 20.0);
    v270 = objc_claimAutoreleasedReturnValue();
    v289[0] = v270;
    -[CKSyndicationContentViewController highlightsView1](self, "highlightsView1");
    v279 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v279, "leadingAnchor");
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v264, "constraintEqualToAnchor:constant:", v29);
    v284 = (void *)objc_claimAutoreleasedReturnValue();
    v289[1] = v284;
    -[CKSyndicationContentViewController highlightsView1](self, "highlightsView1");
    v261 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v261, "widthAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSyndicationContentViewController photoLongSide](self, "photoLongSide");
    v282 = v65;
    objc_msgSend(v65, "constraintEqualToConstant:");
    v281 = (void *)objc_claimAutoreleasedReturnValue();
    v289[2] = v281;
    -[CKSyndicationContentViewController highlightsView1](self, "highlightsView1");
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v258, "heightAnchor");
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSyndicationContentViewController photoShortSide](self, "photoShortSide");
    objc_msgSend(v256, "constraintEqualToConstant:");
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    v289[3] = v254;
    -[CKSyndicationContentViewController highlightsView2](self, "highlightsView2");
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v252, "topAnchor");
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v250, "constraintEqualToAnchor:constant:", v248, v11 * 0.1 + 20.0);
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    v289[4] = v246;
    -[CKSyndicationContentViewController highlightsView2](self, "highlightsView2");
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v244, "trailingAnchor");
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trailingAnchor");
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v242, "constraintEqualToAnchor:constant:", v240, -v29);
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    v289[5] = v238;
    -[CKSyndicationContentViewController highlightsView2](self, "highlightsView2");
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v236, "widthAnchor");
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSyndicationContentViewController photoShortSide](self, "photoShortSide");
    objc_msgSend(v234, "constraintEqualToConstant:");
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    v289[6] = v232;
    -[CKSyndicationContentViewController highlightsView2](self, "highlightsView2");
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v230, "heightAnchor");
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSyndicationContentViewController photoLongSide](self, "photoLongSide");
    objc_msgSend(v228, "constraintEqualToConstant:");
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    v289[7] = v226;
    -[CKSyndicationContentViewController micropillView1](self, "micropillView1");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v224, "topAnchor");
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v222, "constraintEqualToAnchor:constant:", v220, 7.5);
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    v289[8] = v217;
    -[CKSyndicationContentViewController micropillView1](self, "micropillView1");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v214, "leadingAnchor");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSyndicationContentViewController photoLongSide](self, "photoLongSide");
    objc_msgSend(v211, "constraintEqualToAnchor:constant:", v208, v29 + v66 + -132.0);
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    v289[9] = v205;
    -[CKSyndicationContentViewController micropillView1](self, "micropillView1");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v202, "widthAnchor");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSyndicationContentViewController maxContentSize](self, "maxContentSize");
    objc_msgSend(v199, "constraintLessThanOrEqualToConstant:", v67 - v29);
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    v289[10] = v196;
    -[CKSyndicationContentViewController micropillView1](self, "micropillView1");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "heightAnchor");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "constraintEqualToConstant:", 25.0);
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    v289[11] = v187;
    -[CKSyndicationContentViewController micropillView2](self, "micropillView2");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "topAnchor");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSyndicationContentViewController photoLongSide](self, "photoLongSide");
    objc_msgSend(v181, "constraintEqualToAnchor:constant:", v178, v68 + 20.0 + v11 * 0.1 + -12.5);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    v289[12] = v175;
    -[CKSyndicationContentViewController micropillView2](self, "micropillView2");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "trailingAnchor");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trailingAnchor");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSyndicationContentViewController photoShortSide](self, "photoShortSide");
    objc_msgSend(v169, "constraintEqualToAnchor:constant:", v166, -v29 - v69 + 132.0);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v289[13] = v163;
    -[CKSyndicationContentViewController micropillView2](self, "micropillView2");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "bottomAnchor");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "constraintEqualToAnchor:constant:", v154, -20.0);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v289[14] = v151;
    -[CKSyndicationContentViewController micropillView2](self, "micropillView2");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "widthAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSyndicationContentViewController maxContentSize](self, "maxContentSize");
    objc_msgSend(v71, "constraintLessThanOrEqualToConstant:", v72 - v29);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v289[15] = v73;
    -[CKSyndicationContentViewController micropillView2](self, "micropillView2");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "heightAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToConstant:", 25.0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v289[16] = v76;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v289, 17);
    v77 = v9;
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v276;
    objc_msgSend(v276, "addObjectsFromArray:", v78);

    v9 = v77;
    v46 = v273;

    v5 = 0x1E0CB3000;
    v54 = v261;

    v50 = v264;
    v49 = v279;

    v48 = (void *)v270;
    v47 = (void *)v267;

  }
  else
  {
    if (v44)
      goto LABEL_26;
    -[CKSyndicationContentViewController constraints](self, "constraints");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSyndicationContentViewController sharedWithYouViewController](self, "sharedWithYouViewController");
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v283, "view");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v290[0] = v49;
    -[CKSyndicationContentViewController sharedWithYouViewController](self, "sharedWithYouViewController");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "view");
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v285, "centerXAnchor");
    v51 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerXAnchor");
    v52 = objc_claimAutoreleasedReturnValue();
    v284 = (void *)v51;
    v53 = (void *)v51;
    v54 = (void *)v52;
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v282 = (void *)objc_claimAutoreleasedReturnValue();
    v290[1] = v282;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v290, 2);
    v281 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObjectsFromArray:");
  }

LABEL_26:
  -[CKSyndicationContentViewController constraints](self, "constraints");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "count");

  if (v90)
  {
    v91 = *(void **)(v5 + 1816);
    -[CKSyndicationContentViewController constraints](self, "constraints");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "activateConstraints:", v92);

  }
  v286.receiver = self;
  v286.super_class = (Class)CKSyndicationContentViewController;
  -[CKSyndicationContentViewController updateViewConstraints](&v286, sel_updateViewConstraints);

}

- (void)setUpSharedWithYouContentCollectionView
{
  void *v3;
  void *v4;
  CKSyndicationSharedWithYouViewController *v5;

  v5 = objc_alloc_init(CKSyndicationSharedWithYouViewController);
  -[CKSyndicationContentViewController setSharedWithYouViewController:](self, "setSharedWithYouViewController:", v5);
  -[CKSyndicationContentViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationSharedWithYouViewController view](v5, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

}

- (id)_setUpPhotosMicropillForAvatarImage:(id)a3 forName:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CEA700];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "setNumberOfLines:", 0);
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMasksToBounds:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v10);

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceLayoutDirection");

  v13 = CFSTR("chevron.right");
  if (v12 == 1)
    v13 = CFSTR("chevron.left");
  v14 = (void *)MEMORY[0x1E0DC1350];
  v15 = v13;
  objc_msgSend(v14, "systemFontOfSize:", 4.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:scale:", v43, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", v15, v42);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "imageWithRenderingMode:", 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setBounds:", 0.0, -1.5, 15.0, 15.0);
  objc_msgSend(v17, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v17);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v41);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBounds:", 0.0, 1.5, 6.0, 8.0);
  objc_msgSend(v18, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v18);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_SYNDICATION_PHOTOS"), &stru_1E276D870, CFSTR("ChatKit"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", v21, v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "userInterfaceLayoutDirection");

  if (v24 == 1)
    v25 = CFSTR("\u200F");
  else
    v25 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v25, "stringByAppendingString:", v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v26);
  v28 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addAttribute:value:range:", v28, v29, 0, objc_msgSend(v27, "length"));

  v30 = objc_msgSend(v26, "rangeOfString:", v5);
  v32 = v31;
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 12.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addAttribute:value:range:", v28, v33, v30, v32);

  objc_msgSend(v27, "addAttribute:value:range:", *MEMORY[0x1E0DC1108], &unk_1E2871510, 0, objc_msgSend(v27, "length"));
  objc_msgSend(v27, "insertAttributedString:atIndex:", v40, 0);
  objc_msgSend(v27, "insertAttributedString:atIndex:", v39, objc_msgSend(v27, "length"));
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", CFSTR(" "));
  objc_msgSend(v27, "insertAttributedString:atIndex:", v34, 1);
  objc_msgSend(v27, "insertAttributedString:atIndex:", v34, 0);
  objc_msgSend(v27, "insertAttributedString:atIndex:", v34, objc_msgSend(v27, "length") - 1);
  objc_msgSend(v27, "insertAttributedString:atIndex:", v34, objc_msgSend(v27, "length"));
  objc_msgSend(v8, "setAttributedText:", v27);
  v35 = objc_alloc(MEMORY[0x1E0CEABE8]);
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 9);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v35, "initWithEffect:", v36);

  objc_msgSend(v8, "addSubview:", v37);
  objc_msgSend(v8, "sizeToFit");

  return v8;
}

- (void)setUpPhotosContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;

  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("WhatsNew_Photos1"));
  v46 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("WhatsNew_Photos2"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v46);
  -[CKSyndicationContentViewController setHighlightsView1:](self, "setHighlightsView1:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v3);
  -[CKSyndicationContentViewController setHighlightsView2:](self, "setHighlightsView2:", v5);

  -[CKSyndicationContentViewController highlightsView1](self, "highlightsView1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CKSyndicationContentViewController highlightsView2](self, "highlightsView2");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("Syndication_Avatar7"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("Syndication_Avatar8"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_SYNDICATION_PHOTOS_EXAMPLE_NAME1"), &stru_1E276D870, CFSTR("ChatKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationContentViewController _setUpPhotosMicropillForAvatarImage:forName:](self, "_setUpPhotosMicropillForAvatarImage:forName:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationContentViewController setMicropillView1:](self, "setMicropillView1:", v12);

  CKFrameworkBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_SYNDICATION_PHOTOS_EXAMPLE_NAME2"), &stru_1E276D870, CFSTR("ChatKit"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationContentViewController _setUpPhotosMicropillForAvatarImage:forName:](self, "_setUpPhotosMicropillForAvatarImage:forName:", v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationContentViewController setMicropillView2:](self, "setMicropillView2:", v15);

  -[CKSyndicationContentViewController highlightsView1](self, "highlightsView1");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCornerRadius:", 25.0);

  -[CKSyndicationContentViewController highlightsView2](self, "highlightsView2");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCornerRadius:", 25.0);

  -[CKSyndicationContentViewController highlightsView1](self, "highlightsView1");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setMasksToBounds:", 1);

  -[CKSyndicationContentViewController highlightsView2](self, "highlightsView2");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setMasksToBounds:", 1);

  v24 = objc_alloc_init(MEMORY[0x1E0CEA658]);
  objc_msgSend(v24, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v25, "setShadowColor:", objc_msgSend(v26, "CGColor"));

  objc_msgSend(v24, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v28) = *(_DWORD *)"333?";
  objc_msgSend(v27, "setShadowOpacity:", v28);

  objc_msgSend(v24, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setShadowRadius:", 25.0);

  objc_msgSend(v24, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setShadowOffset:", 0.0, 2.0);

  -[CKSyndicationContentViewController highlightsView1](self, "highlightsView1");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v31);

  v32 = objc_alloc_init(MEMORY[0x1E0CEA658]);
  objc_msgSend(v32, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v33, "setShadowColor:", objc_msgSend(v34, "CGColor"));

  objc_msgSend(v32, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v36) = *(_DWORD *)"333?";
  objc_msgSend(v35, "setShadowOpacity:", v36);

  objc_msgSend(v32, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setShadowRadius:", 10.0);

  objc_msgSend(v32, "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setShadowOffset:", 0.0, 2.0);

  -[CKSyndicationContentViewController highlightsView2](self, "highlightsView2");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addSubview:", v39);

  -[CKSyndicationContentViewController contentView](self, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addSubview:", v24);

  -[CKSyndicationContentViewController contentView](self, "contentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addSubview:", v32);

  -[CKSyndicationContentViewController contentView](self, "contentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationContentViewController micropillView1](self, "micropillView1");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addSubview:", v43);

  -[CKSyndicationContentViewController contentView](self, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationContentViewController micropillView2](self, "micropillView2");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addSubview:", v45);

}

- (void)setUpHighlightsContent
{
  CKSyndicationOnboardingLinkBalloonView *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CKSyndicationOnboardingLinkBalloonView *v9;
  CKSyndicationOnboardingLinkBalloonView *v10;
  void *v11;
  CKSyndicationOnboardingLinkBalloonView *v12;
  CKSyndicationOnboardingLinkBalloonView *v13;
  void *v14;
  CKSyndicationOnboardingLinkBalloonView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  _QWORD *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[2];
  _QWORD v44[3];

  v44[2] = *MEMORY[0x1E0C80C00];
  v3 = [CKSyndicationOnboardingLinkBalloonView alloc];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("https://tv.apple.com/us/show/mythic-quest/umc.cmc.1nfdfd5zlk05fo1bwwetzldy3?ctx_brand=tvs.sbd.4000"));
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = -[CKSyndicationOnboardingLinkBalloonView initWithFrame:withURL:](v3, "initWithFrame:withURL:", v4, *MEMORY[0x1E0C9D648], v6, v7, v8);

  v10 = [CKSyndicationOnboardingLinkBalloonView alloc];
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("https://podcasts.apple.com/us/podcast/eight-we-go-all/id1507423923?i=1000476834241"));
  v12 = -[CKSyndicationOnboardingLinkBalloonView initWithFrame:withURL:](v10, "initWithFrame:withURL:", v11, v5, v6, v7, v8);

  v13 = [CKSyndicationOnboardingLinkBalloonView alloc];
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("https://music.apple.com/us/album/green-eyes/1534718812?i=1534719300"));
  v15 = -[CKSyndicationOnboardingLinkBalloonView initWithFrame:withURL:](v13, "initWithFrame:withURL:", v14, v5, v6, v7, v8);

  -[CKSyndicationOnboardingLinkBalloonView setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", 0);
  -[CKSyndicationOnboardingLinkBalloonView setUserInteractionEnabled:](v12, "setUserInteractionEnabled:", 0);
  -[CKSyndicationOnboardingLinkBalloonView setUserInteractionEnabled:](v15, "setUserInteractionEnabled:", 0);
  -[CKSyndicationOnboardingLinkBalloonView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CKSyndicationOnboardingLinkBalloonView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CKSyndicationOnboardingLinkBalloonView setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CKSyndicationContentViewController contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v9);

  -[CKSyndicationContentViewController contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v12);

  -[CKSyndicationContentViewController contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v15);

  -[CKSyndicationContentViewController setTvLinkBalloonView:](self, "setTvLinkBalloonView:", v9);
  -[CKSyndicationContentViewController setPodcastLinkBalloonView:](self, "setPodcastLinkBalloonView:", v12);
  -[CKSyndicationContentViewController setMusicLinkBalloonView:](self, "setMusicLinkBalloonView:", v15);
  -[CKSyndicationContentViewController getPinIcon](self, "getPinIcon");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationContentViewController setTvPinIconView:](self, "setTvPinIconView:", v19);

  -[CKSyndicationContentViewController getPinIcon](self, "getPinIcon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationContentViewController setPodcastPinIconView:](self, "setPodcastPinIconView:", v20);

  -[CKSyndicationContentViewController contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationContentViewController tvPinIconView](self, "tvPinIconView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v22);

  -[CKSyndicationContentViewController contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationContentViewController podcastPinIconView](self, "podcastPinIconView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", v24);

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v5, v6, v7, v8);
  -[CKSyndicationContentViewController setGradientView:](self, "setGradientView:", v25);

  -[CKSyndicationContentViewController gradientView](self, "gradientView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0CD2790], "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationContentViewController setGradientLayer:](self, "setGradientLayer:", v27);
  -[CKSyndicationContentViewController gradientView](self, "gradientView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "frame");
  objc_msgSend(v27, "setFrame:");

  -[CKSyndicationContentViewController traitCollection](self, "traitCollection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "userInterfaceStyle");

  if (v30 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.0);
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v44[0] = objc_msgSend(v31, "CGColor");
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v44[1] = objc_msgSend(v32, "CGColor");
    v33 = (void *)MEMORY[0x1E0C99D20];
    v34 = v44;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.0);
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v43[0] = objc_msgSend(v31, "CGColor");
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v43[1] = objc_msgSend(v32, "CGColor");
    v33 = (void *)MEMORY[0x1E0C99D20];
    v34 = v43;
  }
  objc_msgSend(v33, "arrayWithObjects:count:", v34, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationContentViewController gradientLayer](self, "gradientLayer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setColors:", v35);

  -[CKSyndicationContentViewController gradientView](self, "gradientView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "insertSublayer:atIndex:", v27, 0);

  -[CKSyndicationContentViewController contentView](self, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationContentViewController gradientView](self, "gradientView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addSubview:", v40);

  -[CKSyndicationContentViewController contentView](self, "contentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationContentViewController gradientView](self, "gradientView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bringSubviewToFront:", v42);

}

- (id)getPinIcon
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;

  v2 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v7 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], v4, v5, v6);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageHighlightGoldColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v3, v4, v5, v6);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v11);

  objc_msgSend(v7, "addSubview:", v10);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageHighlightImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setImage:", v13);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "messageHighlightGlyphSymbolPointSize");
  v16 = v15;

  objc_msgSend(v10, "setFrame:", (22.0 - v16) * 0.5 + 0.0, (22.0 - v16) * 0.5 + 0.0, v16, v16);
  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  objc_super v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)CKSyndicationContentViewController;
  v4 = a3;
  -[CKSyndicationContentViewController traitCollectionDidChange:](&v24, sel_traitCollectionDidChange_, v4);
  -[CKSyndicationContentViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "CGColor");
    -[CKSyndicationContentViewController tvPinIconView](self, "tvPinIconView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderColor:", v9);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v12, "CGColor");
    -[CKSyndicationContentViewController podcastPinIconView](self, "podcastPinIconView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBorderColor:", v13);

    -[CKSyndicationContentViewController traitCollection](self, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "userInterfaceStyle");

    if (v17 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.0);
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v26[0] = objc_msgSend(v18, "CGColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v26[1] = objc_msgSend(v19, "CGColor");
      v20 = (void *)MEMORY[0x1E0C99D20];
      v21 = v26;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.0);
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v25[0] = objc_msgSend(v18, "CGColor");
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v25[1] = objc_msgSend(v19, "CGColor");
      v20 = (void *)MEMORY[0x1E0C99D20];
      v21 = v25;
    }
    objc_msgSend(v20, "arrayWithObjects:count:", v21, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSyndicationContentViewController gradientLayer](self, "gradientLayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setColors:", v22);

  }
}

- (CKSyndicationSharedWithYouViewController)sharedWithYouViewController
{
  return self->_sharedWithYouViewController;
}

- (void)setSharedWithYouViewController:(id)a3
{
  objc_storeStrong((id *)&self->_sharedWithYouViewController, a3);
}

- (unint64_t)onboardingPage
{
  return self->_onboardingPage;
}

- (void)setOnboardingPage:(unint64_t)a3
{
  self->_onboardingPage = a3;
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (UIView)highlightsView1
{
  return self->_highlightsView1;
}

- (void)setHighlightsView1:(id)a3
{
  objc_storeStrong((id *)&self->_highlightsView1, a3);
}

- (UILabel)micropillView1
{
  return self->_micropillView1;
}

- (void)setMicropillView1:(id)a3
{
  objc_storeStrong((id *)&self->_micropillView1, a3);
}

- (UIView)highlightsView2
{
  return self->_highlightsView2;
}

- (void)setHighlightsView2:(id)a3
{
  objc_storeStrong((id *)&self->_highlightsView2, a3);
}

- (UILabel)micropillView2
{
  return self->_micropillView2;
}

- (void)setMicropillView2:(id)a3
{
  objc_storeStrong((id *)&self->_micropillView2, a3);
}

- (UIView)combinedHighlightsView
{
  return self->_combinedHighlightsView;
}

- (void)setCombinedHighlightsView:(id)a3
{
  objc_storeStrong((id *)&self->_combinedHighlightsView, a3);
}

- (UIView)tvLinkBalloonView
{
  return self->_tvLinkBalloonView;
}

- (void)setTvLinkBalloonView:(id)a3
{
  objc_storeStrong((id *)&self->_tvLinkBalloonView, a3);
}

- (UIView)podcastLinkBalloonView
{
  return self->_podcastLinkBalloonView;
}

- (void)setPodcastLinkBalloonView:(id)a3
{
  objc_storeStrong((id *)&self->_podcastLinkBalloonView, a3);
}

- (UIView)musicLinkBalloonView
{
  return self->_musicLinkBalloonView;
}

- (void)setMusicLinkBalloonView:(id)a3
{
  objc_storeStrong((id *)&self->_musicLinkBalloonView, a3);
}

- (UIView)tvPinIconView
{
  return self->_tvPinIconView;
}

- (void)setTvPinIconView:(id)a3
{
  objc_storeStrong((id *)&self->_tvPinIconView, a3);
}

- (UIView)podcastPinIconView
{
  return self->_podcastPinIconView;
}

- (void)setPodcastPinIconView:(id)a3
{
  objc_storeStrong((id *)&self->_podcastPinIconView, a3);
}

- (UIView)gradientView
{
  return self->_gradientView;
}

- (void)setGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_gradientView, a3);
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void)setGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_gradientLayer, a3);
}

- (double)photoShortSide
{
  return self->_photoShortSide;
}

- (void)setPhotoShortSide:(double)a3
{
  self->_photoShortSide = a3;
}

- (double)photoLongSide
{
  return self->_photoLongSide;
}

- (void)setPhotoLongSide:(double)a3
{
  self->_photoLongSide = a3;
}

- (CGSize)maxContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxContentSize.width;
  height = self->_maxContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_podcastPinIconView, 0);
  objc_storeStrong((id *)&self->_tvPinIconView, 0);
  objc_storeStrong((id *)&self->_musicLinkBalloonView, 0);
  objc_storeStrong((id *)&self->_podcastLinkBalloonView, 0);
  objc_storeStrong((id *)&self->_tvLinkBalloonView, 0);
  objc_storeStrong((id *)&self->_combinedHighlightsView, 0);
  objc_storeStrong((id *)&self->_micropillView2, 0);
  objc_storeStrong((id *)&self->_highlightsView2, 0);
  objc_storeStrong((id *)&self->_micropillView1, 0);
  objc_storeStrong((id *)&self->_highlightsView1, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_sharedWithYouViewController, 0);
}

@end
