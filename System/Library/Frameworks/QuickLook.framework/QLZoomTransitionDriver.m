@implementation QLZoomTransitionDriver

- (void)_performZoomTransition
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _OWORD *v19;
  double v20;
  UIView *v21;
  UIView *uncroppedView;
  UIView *v23;
  UIView *v24;
  UIView *v25;
  void *v26;
  __int128 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  UIView *v61;
  void *v62;
  UIView *v63;
  UIView *v64;
  UIView *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  UIView *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  void *v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  _BOOL4 v99;
  _BOOL4 v100;
  double v101;
  double v102;
  void *v103;
  int v104;
  double v105;
  void *v106;
  double v107;
  double v108;
  void *v109;
  double v110;
  double v111;
  void *v112;
  void *v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  float64_t v126;
  double v127;
  float64_t v128;
  void *v129;
  void *v130;
  double v131;
  double v132;
  float64x2_t v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double MidY;
  CGFloat MidX;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  int v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  CGAffineTransform *p_t1;
  CGAffineTransform *v159;
  __int128 v160;
  __int128 v161;
  void *v162;
  void *v163;
  void *v164;
  double v165;
  double v166;
  void *v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  uint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  double v178;
  double v179;
  double v180;
  CGFloat v181;
  CGFloat v182;
  CGFloat v183;
  __int128 v184;
  __int128 v185;
  double v186;
  __int128 v187;
  CGFloat v188;
  CGFloat v189;
  CGFloat v190;
  CGFloat v191;
  CGFloat v192;
  double v193;
  double v194;
  double v195;
  double v196;
  _QWORD v197[7];
  __int128 v198;
  __int128 v199;
  __int128 v200;
  CGFloat v201;
  double v202;
  CGAffineTransform v203;
  _QWORD v204[7];
  __int128 v205;
  __int128 v206;
  __int128 v207;
  CGFloat v208;
  double v209;
  CGAffineTransform v210;
  _QWORD v211[6];
  _QWORD v212[6];
  _OWORD v213[3];
  CGAffineTransform v214;
  CGAffineTransform v215;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v218;
  CGAffineTransform v219;
  _OWORD v220[6];
  _OWORD v221[6];
  _OWORD v222[6];
  CGAffineTransform v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  CGRect v230;
  CGRect v231;
  CGRect v232;
  CGRect v233;
  CGRect v234;
  CGRect v235;
  CGRect v236;
  CGRect v237;
  CGRect v238;
  CGRect v239;
  CGRect v240;
  CGRect v241;
  CGRect v242;
  CGRect v243;

  v228 = 0u;
  v229 = 0u;
  v226 = 0u;
  v227 = 0u;
  v224 = 0u;
  v225 = 0u;
  memset(&v223, 0, sizeof(v223));
  memset(&v222[3], 0, 48);
  if (-[QLTransitionDriver presenting](self, "presenting"))
    v3 = 1.0;
  else
    v3 = 0.0;
  v195 = v3;
  if (-[QLTransitionDriver presenting](self, "presenting"))
    v4 = 0.0;
  else
    v4 = 1.0;
  -[QLTransitionDriver transitionContainer](self, "transitionContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v189 = v9;
  v190 = v7;
  -[QLTransitionDriver setTransitionContainerOriginalFrame:](self, "setTransitionContainerOriginalFrame:", v7, v9, v11, v13);
  -[QLTransitionDriver sourceViewFrame](self, "sourceViewFrame");
  v15 = v14;
  v17 = v16;
  -[QLTransitionDriver uncroppedFrame](self, "uncroppedFrame");
  v19 = (_OWORD *)MEMORY[0x24BDBD8B8];
  if (v15 == v20 && v17 == v18)
  {
    -[QLTransitionDriver sourceView](self, "sourceView");
    v21 = (UIView *)objc_claimAutoreleasedReturnValue();
    uncroppedView = self->_uncroppedView;
    self->_uncroppedView = v21;

    if (-[QLTransitionDriver isSourceViewTransformed](self, "isSourceViewTransformed"))
    {
      -[QLTransitionDriver sourceViewCenter](self, "sourceViewCenter");
      -[UIView setCenter:](self->_uncroppedView, "setCenter:");
      -[QLTransitionDriver sourceViewBounds](self, "sourceViewBounds");
      -[UIView setBounds:](self->_uncroppedView, "setBounds:");
      -[QLTransitionDriver sourceViewTransform](self, "sourceViewTransform");
      v23 = self->_uncroppedView;
      v220[0] = v220[3];
      v220[1] = v220[4];
      v220[2] = v220[5];
      -[UIView setTransform:](v23, "setTransform:", v220);
    }
    else
    {
      -[QLTransitionDriver sourceView](self, "sourceView");
      v64 = (UIView *)objc_claimAutoreleasedReturnValue();
      v65 = self->_uncroppedView;
      self->_uncroppedView = v64;

      -[QLTransitionDriver sourceViewFrame](self, "sourceViewFrame");
      -[UIView setFrame:](self->_uncroppedView, "setFrame:");
    }
    -[QLTransitionDriver sourceViewFrame](self, "sourceViewFrame");
  }
  else
  {
    v24 = (UIView *)objc_opt_new();
    v25 = self->_uncroppedView;
    self->_uncroppedView = v24;

    if (-[QLTransitionDriver isSourceViewTransformed](self, "isSourceViewTransformed"))
    {
      -[QLTransitionDriver sourceView](self, "sourceView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v19[1];
      v222[0] = *v19;
      v222[1] = v27;
      v222[2] = v19[2];
      objc_msgSend(v26, "setTransform:", v222);

      -[QLTransitionDriver sourceViewCenter](self, "sourceViewCenter");
      v29 = v28;
      v31 = v30;
      -[QLTransitionDriver sourceView](self, "sourceView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setCenter:", v29, v31);

      -[QLTransitionDriver sourceViewBounds](self, "sourceViewBounds");
      v34 = v33;
      v36 = v35;
      v38 = v37;
      v40 = v39;
      -[QLTransitionDriver sourceView](self, "sourceView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setBounds:", v34, v36, v38, v40);

      -[QLTransitionDriver sourceView](self, "sourceView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "frame");
      v44 = v43;
      -[QLTransitionDriver uncroppedFrame](self, "uncroppedFrame");
      v46 = v44 + v45;
      -[QLTransitionDriver sourceView](self, "sourceView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "frame");
      v49 = v48;
      -[QLTransitionDriver uncroppedFrame](self, "uncroppedFrame");
      v51 = v49 + v50;
      -[QLTransitionDriver uncroppedFrame](self, "uncroppedFrame");
      -[UIView setFrame:](self->_uncroppedView, "setFrame:", v46, v51);

      -[QLTransitionDriver uncroppedFrame](self, "uncroppedFrame");
      v53 = -v52;
      -[QLTransitionDriver uncroppedFrame](self, "uncroppedFrame");
      v55 = -v54;
      -[QLTransitionDriver sourceViewBounds](self, "sourceViewBounds");
      v57 = v56;
      v59 = v58;
      -[QLTransitionDriver sourceView](self, "sourceView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setFrame:", v53, v55, v57, v59);

      v61 = self->_uncroppedView;
      -[QLTransitionDriver sourceView](self, "sourceView");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](v61, "addSubview:", v62);

      -[QLTransitionDriver sourceViewCenter](self, "sourceViewCenter");
      -[UIView setCenter:](self->_uncroppedView, "setCenter:");
      -[QLTransitionDriver sourceViewTransform](self, "sourceViewTransform");
      v63 = self->_uncroppedView;
      v221[0] = v221[3];
      v221[1] = v221[4];
      v221[2] = v221[5];
      -[UIView setTransform:](v63, "setTransform:", v221);
    }
    else
    {
      v70 = self->_uncroppedView;
      -[QLTransitionDriver sourceView](self, "sourceView");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](v70, "addSubview:", v71);

      -[QLTransitionDriver sourceViewFrame](self, "sourceViewFrame");
      v73 = v72;
      -[QLTransitionDriver uncroppedFrame](self, "uncroppedFrame");
      v75 = v73 + v74;
      -[QLTransitionDriver sourceViewFrame](self, "sourceViewFrame");
      v77 = v76;
      -[QLTransitionDriver uncroppedFrame](self, "uncroppedFrame");
      v79 = v77 + v78;
      -[QLTransitionDriver uncroppedFrame](self, "uncroppedFrame");
      -[UIView setFrame:](self->_uncroppedView, "setFrame:", v75, v79);
      -[QLTransitionDriver uncroppedFrame](self, "uncroppedFrame");
      v81 = -v80;
      -[QLTransitionDriver uncroppedFrame](self, "uncroppedFrame");
      v83 = -v82;
      -[QLTransitionDriver sourceViewFrame](self, "sourceViewFrame");
      v85 = v84;
      v87 = v86;
      -[QLTransitionDriver sourceView](self, "sourceView");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "setFrame:", v81, v83, v85, v87);

    }
    -[UIView frame](self->_uncroppedView, "frame");
  }
  v183 = v66;
  v191 = v67;
  v89 = v68;
  v196 = v69;
  -[QLTransitionDriver transitionContainer](self, "transitionContainer");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "addSubview:", self->_uncroppedView);

  -[QLTransitionDriver transitionPreviewItem](self, "transitionPreviewItem");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (v91)
  {
    -[QLTransitionDriver transitionPreviewItem](self, "transitionPreviewItem");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "previewSizeForItemViewControllerSize:", v11, v13);
    v94 = v93;
    v96 = v95;

  }
  else
  {
    -[QLTransitionDriver transitionPreviewSize](self, "transitionPreviewSize");
    v94 = v97;
    v96 = v98;
  }

  v99 = v94 == *MEMORY[0x24BDBF148];
  v100 = v96 == *(double *)(MEMORY[0x24BDBF148] + 8);
  v193 = v13;
  if (v99 && v100)
    v101 = v13;
  else
    v101 = v96;
  if (v99 && v100)
    v102 = v11;
  else
    v102 = v94;
  -[QLTransitionDriver transitionPreviewItem](self, "transitionPreviewItem");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v103, "useFullPDFTransition");

  v192 = v89;
  v194 = v4;
  if (v104)
  {
    v105 = (v102 + -24.0) / v89;
  }
  else
  {
    -[QLTransitionDriver transitionContainer](self, "transitionContainer");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "frame");
    v108 = v107;
    -[QLTransitionDriver transitionContainer](self, "transitionContainer");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "frame");
    v111 = v108 / v110;

    if (v89 / v196 > v111)
      v105 = v102 / v89;
    else
      v105 = v101 / v196;
  }
  -[QLTransitionDriver gestureTracker](self, "gestureTracker");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = v112;
  v182 = v11;
  if (v112)
  {
    objc_msgSend(v112, "trackedBounds");
    v186 = v114;
    v116 = v115;
    v118 = v117;
    v120 = v119;
    objc_msgSend(v113, "anchorPoint");
    v122 = v121;
    v124 = v123;
    objc_msgSend(v113, "trackedCenter");
    v126 = v125;
    v128 = v127;
    memset(&v219, 0, sizeof(v219));
    objc_msgSend(v113, "trackedTransform");
    -[QLTransitionDriver sourceView](self, "sourceView");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "layer");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "anchorPoint");
    v132 = v131;
    v218 = v219;
    v133.f64[1] = v219.ty;
    v133.f64[0] = v126;
    v137 = QLConvertPointFromAnchorPointToNewAnchorPoint((float64x2_t *)&v218, v133, v128, v122, v124, v132, v134, v135, v136, v186, v116, v118, v120);
    MidY = v138;

  }
  else
  {
    v230.origin.x = v190;
    v230.origin.y = v189;
    v230.size.width = v11;
    v230.size.height = v193;
    MidX = CGRectGetMidX(v230);
    v231.size.width = v11;
    v137 = MidX;
    v231.origin.x = v190;
    v231.origin.y = v189;
    v231.size.height = v193;
    MidY = CGRectGetMidY(v231);
  }
  v185 = v19[1];
  v187 = *v19;
  *(_OWORD *)&v218.a = *v19;
  *(_OWORD *)&v218.c = v185;
  v184 = v19[2];
  *(_OWORD *)&v218.tx = v184;
  memset(&v219, 0, sizeof(v219));
  CGAffineTransformScale(&v219, &v218, v105, v105);
  if (v113)
  {
    objc_msgSend(v113, "trackedTransform");
    t1 = v219;
    CGAffineTransformConcat(&v218, &t1, &t2);
    v219 = v218;
  }
  memset(&v218, 0, sizeof(v218));
  if (-[QLTransitionDriver isSourceViewTransformed](self, "isSourceViewTransformed"))
  {
    -[QLTransitionDriver sourceViewTransform](self, "sourceViewTransform");
  }
  else
  {
    *(_OWORD *)&v215.a = v187;
    *(_OWORD *)&v215.c = v185;
    *(_OWORD *)&v215.tx = v184;
  }
  CGAffineTransformScale(&v218, &v215, 1.0 / v105, 1.0 / v105);
  memset(&t1, 0, sizeof(t1));
  -[QLTransitionDriver gestureTracker](self, "gestureTracker");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  if (v141)
  {
    -[QLTransitionDriver gestureTracker](self, "gestureTracker");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = v142;
    if (v142)
      objc_msgSend(v142, "trackedTransform");
    else
      memset(&t1, 0, sizeof(t1));

  }
  else
  {
    *(_OWORD *)&t1.a = v187;
    *(_OWORD *)&t1.c = v185;
    *(_OWORD *)&t1.tx = v184;
  }

  -[QLTransitionDriver transitionPreviewItem](self, "transitionPreviewItem");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = objc_msgSend(v144, "useFullPDFTransition");

  v146 = 0.0;
  v147 = 0.0;
  if (v145)
  {
    -[QLTransitionDriver hostNavigationOffset](self, "hostNavigationOffset");
    v149 = v148 + 16.0;
    v146 = v149 - (v193 - v196 * v105) * 0.5;
    v147 = (v193 / v105 - v196) * 0.5 - v149 / v105;
  }
  if (-[QLTransitionDriver presenting](self, "presenting"))
  {
    if (-[QLTransitionDriver isSourceViewTransformed](self, "isSourceViewTransformed"))
    {
      -[QLTransitionDriver sourceViewCenter](self, "sourceViewCenter");
      v151 = v150;
      v153 = v152;
    }
    else
    {
      v232.origin.x = v183;
      v232.origin.y = v191;
      v232.size.width = v192;
      v232.size.height = v196;
      v151 = CGRectGetMidX(v232);
      v233.origin.x = v183;
      v233.origin.y = v191;
      v233.size.width = v192;
      v233.size.height = v196;
      v153 = CGRectGetMidY(v233);
    }
    v234.origin.x = v190;
    v234.origin.y = v189;
    v234.size.width = v182;
    v234.size.height = v193;
    v181 = CGRectGetMidX(v234);
    v235.origin.x = v190;
    v235.origin.y = v189;
    v235.size.width = v182;
    v235.size.height = v193;
    v156 = CGRectGetMidY(v235);
    if (-[QLTransitionDriver isSourceViewTransformed](self, "isSourceViewTransformed"))
    {
      -[QLTransitionDriver sourceViewTransform](self, "sourceViewTransform");
    }
    else
    {
      *(_OWORD *)&v223.a = v187;
      *(_OWORD *)&v223.c = v185;
      *(_OWORD *)&v223.tx = v184;
    }
    v180 = v146 + v156;
    *(CGAffineTransform *)&v222[3] = v219;
    v238.origin.x = v183;
    v238.origin.y = v191;
    v238.size.width = v192;
    v238.size.height = v196;
    v137 = CGRectGetMidX(v238);
    v239.origin.x = v183;
    v239.origin.y = v191;
    v239.size.width = v192;
    v239.size.height = v196;
    MidY = v147 + CGRectGetMidY(v239);
    v240.origin.x = v190;
    v240.origin.y = v189;
    v240.size.width = v182;
    v240.size.height = v193;
    v188 = CGRectGetMidX(v240);
    v241.origin.x = v190;
    v241.origin.y = v189;
    v241.size.width = v182;
    v241.size.height = v193;
    v157 = CGRectGetMidY(v241);
    p_t1 = &t1;
    v159 = &v218;
  }
  else
  {
    if (-[QLTransitionDriver isSourceViewTransformed](self, "isSourceViewTransformed"))
    {
      -[QLTransitionDriver sourceViewCenter](self, "sourceViewCenter");
      v180 = v155;
      v181 = v154;
    }
    else
    {
      v236.origin.x = v183;
      v236.origin.y = v191;
      v236.size.width = v192;
      v236.size.height = v196;
      v181 = CGRectGetMidX(v236);
      v237.origin.x = v183;
      v237.origin.y = v191;
      v237.size.width = v192;
      v237.size.height = v196;
      v180 = CGRectGetMidY(v237);
    }
    v223 = v219;
    if (-[QLTransitionDriver isSourceViewTransformed](self, "isSourceViewTransformed"))
    {
      -[QLTransitionDriver sourceViewTransform](self, "sourceViewTransform");
    }
    else
    {
      v222[3] = v187;
      v222[4] = v185;
      v222[5] = v184;
    }
    v153 = MidY + v146;
    v242.origin.x = v183;
    v242.origin.y = v191;
    v242.size.width = v192;
    v242.size.height = v196;
    v188 = CGRectGetMidX(v242);
    v243.origin.x = v183;
    v243.origin.y = v191;
    v243.size.width = v192;
    v243.size.height = v196;
    v157 = v147 + CGRectGetMidY(v243);
    p_t1 = &v218;
    v159 = &t1;
    v151 = v137;
  }
  v160 = *(_OWORD *)&v159->c;
  v227 = *(_OWORD *)&v159->a;
  v228 = v160;
  v229 = *(_OWORD *)&v159->tx;
  v161 = *(_OWORD *)&p_t1->c;
  v224 = *(_OWORD *)&p_t1->a;
  v225 = v161;
  v226 = *(_OWORD *)&p_t1->tx;
  v214 = v223;
  -[UIView setTransform:](self->_uncroppedView, "setTransform:", &v214);
  -[UIView setAlpha:](self->_uncroppedView, "setAlpha:", v195);
  -[UIView setCenter:](self->_uncroppedView, "setCenter:", v151, v153);
  -[QLTransitionDriver destinationView](self, "destinationView");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v213[0] = v227;
  v213[1] = v228;
  v213[2] = v229;
  objc_msgSend(v162, "setTransform:", v213);

  -[QLTransitionDriver destinationView](self, "destinationView");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "setAlpha:", v194);

  -[QLTransitionDriver destinationView](self, "destinationView");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "setCenter:", v137, MidY);

  -[QLTransitionDriver duration](self, "duration");
  v166 = v165;
  v167 = (void *)MEMORY[0x24BEBDB00];
  if (-[QLTransitionDriver presenting](self, "presenting"))
    v168 = 0x10000;
  else
    v168 = 0x20000;
  v169 = MEMORY[0x24BDAC760];
  v212[0] = MEMORY[0x24BDAC760];
  v212[1] = 3221225472;
  v212[2] = __48__QLZoomTransitionDriver__performZoomTransition__block_invoke;
  v212[3] = &unk_24C724CD0;
  v212[4] = self;
  *(double *)&v212[5] = 1.0 - v195;
  objc_msgSend(v167, "animateWithDuration:delay:options:animations:completion:", v168, v212, 0, v166 * 0.5, 0.0);
  v170 = (void *)MEMORY[0x24BEBDB00];
  if (-[QLTransitionDriver presenting](self, "presenting"))
    v171 = 0x20000;
  else
    v171 = 0x10000;
  v211[0] = v169;
  v211[1] = 3221225472;
  v211[2] = __48__QLZoomTransitionDriver__performZoomTransition__block_invoke_2;
  v211[3] = &unk_24C724CD0;
  v211[4] = self;
  *(double *)&v211[5] = 1.0 - v194;
  objc_msgSend(v170, "animateWithDuration:delay:options:animations:completion:", v171, v211, 0, v166 * 0.5, 0.0);
  -[QLTransitionDriver transitionContainer](self, "transitionContainer");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "layer");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLTransitionDriver setTransitionContainerMasksToBounds:](self, "setTransitionContainerMasksToBounds:", objc_msgSend(v173, "masksToBounds"));

  -[QLTransitionDriver transitionContainer](self, "transitionContainer");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "layer");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "setMasksToBounds:", 1);

  if (-[QLTransitionDriver presenting](self, "presenting"))
  {
    v204[0] = v169;
    v204[1] = 3221225472;
    v204[2] = __48__QLZoomTransitionDriver__performZoomTransition__block_invoke_3;
    v204[3] = &unk_24C726400;
    v204[4] = self;
    *(CGFloat *)&v204[5] = v188;
    *(double *)&v204[6] = v157;
    v205 = v224;
    v206 = v225;
    v207 = v226;
    v208 = v181;
    v209 = v180;
    v210 = *(CGAffineTransform *)&v222[3];
    objc_msgSend(MEMORY[0x24BEBDB00], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v204, 0, v166, 0.0, 1.0, 350.0, 25.0691051, 0.0);
  }
  else
  {
    -[QLTransitionDriver gestureTracker](self, "gestureTracker");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    if (v176)
    {
      -[QLTransitionDriver gestureTracker](self, "gestureTracker");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v177, "finalAnimationSpringDamping");
      v179 = v178;

    }
    else
    {
      v179 = 1.0;
    }

    v197[0] = v169;
    v197[1] = 3221225472;
    v197[2] = __48__QLZoomTransitionDriver__performZoomTransition__block_invoke_5;
    v197[3] = &unk_24C726400;
    v197[4] = self;
    *(CGFloat *)&v197[5] = v188;
    *(double *)&v197[6] = v157;
    v198 = v224;
    v199 = v225;
    v200 = v226;
    v201 = v181;
    v202 = v180;
    v203 = *(CGAffineTransform *)&v222[3];
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v197, 0, v166, 0.0, v179, 0.0);
  }

}

uint64_t __48__QLZoomTransitionDriver__performZoomTransition__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "setAlpha:", *(double *)(a1 + 40));
}

void __48__QLZoomTransitionDriver__performZoomTransition__block_invoke_2(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "destinationView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

uint64_t __48__QLZoomTransitionDriver__performZoomTransition__block_invoke_3(uint64_t a1)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _QWORD v8[5];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CAFrameRateRange v17;

  v2 = (void *)MEMORY[0x24BEBDB00];
  v17 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__QLZoomTransitionDriver__performZoomTransition__block_invoke_4;
  v8[3] = &unk_24C726400;
  v8[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 56);
  v9 = *(_OWORD *)(a1 + 40);
  v10 = v3;
  v4 = *(_OWORD *)(a1 + 88);
  v11 = *(_OWORD *)(a1 + 72);
  v12 = v4;
  v5 = *(_OWORD *)(a1 + 104);
  v16 = *(_OWORD *)(a1 + 152);
  v15 = *(_OWORD *)(a1 + 136);
  v6 = *(_OWORD *)(a1 + 120);
  v13 = v5;
  v14 = v6;
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 2097154, v8, *(double *)&v17.minimum, *(double *)&v17.maximum, *(double *)&v17.preferred);
}

uint64_t __48__QLZoomTransitionDriver__performZoomTransition__block_invoke_4(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  __int128 v8;
  _OWORD v10[3];
  _OWORD v11[3];

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "destinationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCenter:", v2, v3);

  v5 = *(_OWORD *)(a1 + 72);
  v11[0] = *(_OWORD *)(a1 + 56);
  v11[1] = v5;
  v11[2] = *(_OWORD *)(a1 + 88);
  objc_msgSend(*(id *)(a1 + 32), "destinationView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTransform:", v11);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "setCenter:", *(double *)(a1 + 104), *(double *)(a1 + 112));
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 288);
  v8 = *(_OWORD *)(a1 + 136);
  v10[0] = *(_OWORD *)(a1 + 120);
  v10[1] = v8;
  v10[2] = *(_OWORD *)(a1 + 152);
  return objc_msgSend(v7, "setTransform:", v10);
}

uint64_t __48__QLZoomTransitionDriver__performZoomTransition__block_invoke_5(uint64_t a1)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _QWORD v8[5];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CAFrameRateRange v17;

  v2 = (void *)MEMORY[0x24BEBDB00];
  v17 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__QLZoomTransitionDriver__performZoomTransition__block_invoke_6;
  v8[3] = &unk_24C726400;
  v8[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 56);
  v9 = *(_OWORD *)(a1 + 40);
  v10 = v3;
  v4 = *(_OWORD *)(a1 + 88);
  v11 = *(_OWORD *)(a1 + 72);
  v12 = v4;
  v5 = *(_OWORD *)(a1 + 104);
  v16 = *(_OWORD *)(a1 + 152);
  v15 = *(_OWORD *)(a1 + 136);
  v6 = *(_OWORD *)(a1 + 120);
  v13 = v5;
  v14 = v6;
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 2097154, v8, *(double *)&v17.minimum, *(double *)&v17.maximum, *(double *)&v17.preferred);
}

uint64_t __48__QLZoomTransitionDriver__performZoomTransition__block_invoke_6(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  __int128 v8;
  _OWORD v10[3];
  _OWORD v11[3];

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "destinationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCenter:", v2, v3);

  v5 = *(_OWORD *)(a1 + 72);
  v11[0] = *(_OWORD *)(a1 + 56);
  v11[1] = v5;
  v11[2] = *(_OWORD *)(a1 + 88);
  objc_msgSend(*(id *)(a1 + 32), "destinationView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTransform:", v11);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "setCenter:", *(double *)(a1 + 104), *(double *)(a1 + 112));
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 288);
  v8 = *(_OWORD *)(a1 + 136);
  v10[0] = *(_OWORD *)(a1 + 120);
  v10[1] = v8;
  v10[2] = *(_OWORD *)(a1 + 152);
  return objc_msgSend(v7, "setTransform:", v10);
}

- (void)tearDown
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  -[UIView removeFromSuperview](self->_uncroppedView, "removeFromSuperview");
  v3 = -[QLTransitionDriver transitionContainerMasksToBounds](self, "transitionContainerMasksToBounds");
  -[QLTransitionDriver transitionContainer](self, "transitionContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMasksToBounds:", v3);

  -[QLTransitionDriver transitionContainerOriginalFrame](self, "transitionContainerOriginalFrame");
  v7 = v6;
  -[QLTransitionDriver transitionContainerOriginalFrame](self, "transitionContainerOriginalFrame");
  v9 = v8;
  -[QLTransitionDriver transitionContainer](self, "transitionContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBounds:", 0.0, 0.0, v7, v9);

  -[QLTransitionDriver transitionContainerOriginalFrame](self, "transitionContainerOriginalFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[QLTransitionDriver transitionContainer](self, "transitionContainer");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

}

+ (void)cropView:(id)a3 toAvoidNavigationOffset:(double)a4 presenting:(BOOL)a5 animationDuration:(double)a6
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;

  v6 = a5;
  v8 = a3;
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v8, "bounds");
  v18 = v17;
  objc_msgSend(v8, "bounds");
  v20 = v19 + a4;
  objc_msgSend(v8, "bounds");
  v22 = v21;
  objc_msgSend(v8, "bounds");
  v24 = v23;
  if (v6)
  {
    objc_msgSend(v8, "setBounds:", v18, v20, v22, v23);
    objc_msgSend(v8, "setFrame:", v18, v20, v22, v24);
  }
  v25 = (void *)MEMORY[0x24BEBDB00];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __88__QLZoomTransitionDriver_cropView_toAvoidNavigationOffset_presenting_animationDuration___block_invoke;
  v28[3] = &unk_24C726428;
  v38 = v6;
  v29 = v8;
  v30 = v18;
  v31 = v20;
  v32 = v22;
  v33 = v24;
  v34 = v10;
  v35 = v12;
  v36 = v14;
  v37 = v16;
  v26 = v8;
  objc_msgSend(v25, "animateWithDuration:animations:", v28, a6);

}

uint64_t __88__QLZoomTransitionDriver_cropView_toAvoidNavigationOffset_presenting_animationDuration___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  double *v4;
  double *v5;
  double *v6;
  double *v7;

  v2 = *(unsigned __int8 *)(a1 + 104);
  v3 = *(void **)(a1 + 32);
  if (v2)
    v4 = (double *)(a1 + 96);
  else
    v4 = (double *)(a1 + 64);
  if (v2)
    v5 = (double *)(a1 + 72);
  else
    v5 = (double *)(a1 + 40);
  if (v2)
    v6 = (double *)(a1 + 80);
  else
    v6 = (double *)(a1 + 48);
  if (v2)
    v7 = (double *)(a1 + 88);
  else
    v7 = (double *)(a1 + 56);
  objc_msgSend(v3, "setBounds:", *v5, *v6, *v7, *v4);
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *v5, *v6, *v7, *v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uncroppedView, 0);
}

@end
