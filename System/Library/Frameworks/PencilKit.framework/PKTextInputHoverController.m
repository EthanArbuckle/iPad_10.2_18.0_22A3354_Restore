@implementation PKTextInputHoverController

- (id)initWithDelegate:(id *)a1
{
  id v3;
  id *v4;
  void *v5;
  int64x2_t *v6;
  id v7;
  void *v8;
  char v9;
  _BYTE *v10;
  __int128 v11;
  objc_super v13;

  v3 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)PKTextInputHoverController;
    v4 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak(v4 + 2, v3);
      objc_msgSend(v3, "hoverControllerContainerView:", a1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PKHoverController initWithDelegate:view:]((int64x2_t *)[PKHoverController alloc], a1, v5);
      v7 = a1[3];
      a1[3] = v6;

      +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "showDebugLayer");
      v10 = a1[3];
      if (v10)
        v10[424] = v9;

      v11 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
      *((_OWORD *)a1 + 10) = *MEMORY[0x1E0C9D648];
      *((_OWORD *)a1 + 11) = v11;

    }
  }

  return a1;
}

- (void)didReceiveNormalTouch:(uint64_t *)a1
{
  void *v3;
  id v4;

  if (a1)
  {
    v3 = (void *)MEMORY[0x1E0DE7910];
    v4 = a2;
    objc_msgSend(v3, "cancelPreviousPerformRequestsWithTarget:selector:object:", a1, sel_unhidePlaceholderElementIfNecessary, 0);
    objc_msgSend(a1, "performSelector:withObject:afterDelay:", sel_unhidePlaceholderElementIfNecessary, 0, 1.0);
    -[PKHoverController didReceiveNormalTouch:](a1[3], v4);

  }
}

- (id)view
{
  id v1;
  id WeakRetained;

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 2);
    objc_msgSend(WeakRetained, "hoverControllerContainerView:", v1);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (id)_cursorController
{
  id v1;
  id WeakRetained;

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 2);
    objc_msgSend(WeakRetained, "hoverControllerCursorController:", v1);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (void)hoverController:(id)a3 didBegin:(id *)a4
{
  _BYTE *v6;
  void *v7;
  char v8;
  CAShapeLayer *hoverDebugLayer;
  id v10;
  id v11;
  uint64_t v12;
  CAShapeLayer *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[8];

  v6 = a3;
  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "showDebugLayer");
  if (!v6)
  {

    goto LABEL_11;
  }
  v6[424] = v8;

  if (v6[424])
  {
    if (self)
    {
      hoverDebugLayer = self->__hoverDebugLayer;
      if (hoverDebugLayer)
      {
LABEL_10:
        v17 = *(_OWORD *)&a4->var9;
        v21[4] = *(_OWORD *)&a4->var7;
        v21[5] = v17;
        v18 = *(_OWORD *)&a4->var13;
        v21[6] = *(_OWORD *)&a4->var11;
        v21[7] = v18;
        v19 = *(_OWORD *)&a4->var1;
        v21[0] = a4->var0;
        v21[1] = v19;
        v20 = *(_OWORD *)&a4->var5;
        v21[2] = *(_OWORD *)&a4->var3;
        v21[3] = v20;
        -[PKHoverController updateShapeLayer:inputPoint:](v6, hoverDebugLayer, (double *)v21);
        goto LABEL_11;
      }
      v10 = objc_alloc_init(MEMORY[0x1E0CD2840]);
      objc_storeStrong((id *)&self->__hoverDebugLayer, v10);
    }
    else
    {
      v10 = objc_alloc_init(MEMORY[0x1E0CD2840]);
    }

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "CGColor");
    if (self)
    {
      -[CAShapeLayer setFillColor:](self->__hoverDebugLayer, "setFillColor:", v12);

      v13 = self->__hoverDebugLayer;
    }
    else
    {
      objc_msgSend(0, "setFillColor:", v12);

      v13 = 0;
    }
    -[CAShapeLayer setAllowsHitTesting:](v13, "setAllowsHitTesting:", 0);
    -[PKTextInputHoverController view]((id *)&self->super.isa);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (self)
    {
      objc_msgSend(v15, "addSublayer:", self->__hoverDebugLayer);

      hoverDebugLayer = self->__hoverDebugLayer;
    }
    else
    {
      objc_msgSend(v15, "addSublayer:", 0);

      hoverDebugLayer = 0;
    }
    goto LABEL_10;
  }
LABEL_11:

}

- (void)hoverController:(id)a3 didUpdate:(id *)a4
{
  id v6;
  void *v7;
  CAShapeLayer *hoverDebugLayer;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  NSArray *hoverFlashElements;
  CGFloat x;
  CGFloat y;
  NSArray *v16;
  NSArray *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  _QWORD *v23;
  UIView *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  CGFloat v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  NSArray *v64;
  _QWORD *v65;
  UIView *currentHoverFlashElementView;
  UIView **p_currentHoverFlashElementView;
  UIView *v68;
  void *v69;
  id v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  uint64_t v89;
  NSArray *v90;
  id v91;
  dispatch_time_t v92;
  double v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  id v101;
  CGFloat v102;
  void *v103;
  double v104;
  double v105;
  void *v106;
  id v107;
  id v108;
  double v109;
  double v110;
  void *v111;
  void *v112;
  double v113;
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
  BOOL v125;
  void *v126;
  void *v127;
  double v128;
  double v129;
  double v130;
  PKTextInputElementContent *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  PKTextInputElementContent *v135;
  void *v136;
  double v137;
  CGFloat v138;
  double v139;
  CGFloat v140;
  double v141;
  CGFloat v142;
  double v143;
  CGFloat v144;
  double v145;
  double v146;
  PKTextInputElementContent *v147;
  void *v148;
  double v149;
  double v150;
  CGFloat v151;
  double v152;
  double v153;
  CGFloat v154;
  double v155;
  CGFloat v156;
  double v157;
  double v158;
  CGFloat v159;
  PKTextInputElementContent *v160;
  void *v161;
  double v162;
  double v163;
  CGFloat v164;
  double v165;
  CGFloat v166;
  double v167;
  PKTextInputElementContent *v168;
  void *v169;
  _BOOL4 v170;
  CGSize v171;
  id v172;
  void *v173;
  _BOOL4 v174;
  uint64_t v175;
  _BOOL4 v176;
  uint64_t v177;
  _BOOL4 v178;
  double v179;
  uint64_t v180;
  void *v181;
  uint64_t v182;
  void *v183;
  double v184;
  double v185;
  PKTextInputElementContent *v186;
  void *v187;
  double v188;
  CGFloat v189;
  double v190;
  double v191;
  double v192;
  CGFloat v193;
  double v194;
  CGFloat v195;
  double v196;
  void *v197;
  uint64_t v198;
  void *v199;
  PKTextInputElementContent *v200;
  void *v201;
  double v202;
  CGFloat v203;
  double v204;
  double v205;
  double v206;
  CGFloat v207;
  double v208;
  CGFloat v209;
  double v210;
  double v211;
  CGFloat width;
  CGSize v213;
  id v214;
  double v215;
  double MaxX;
  double v217;
  _BOOL4 IsEmpty;
  BOOL v219;
  double v220;
  CGColor *v221;
  id v222;
  CGColor *v223;
  id v224;
  void *v225;
  double v226;
  CGFloat v227;
  CGFloat v228;
  CGFloat v229;
  double v230;
  CGFloat v231;
  double v232;
  double v233;
  double v234;
  CGFloat v235;
  double v236;
  CGFloat v237;
  double v238;
  double rect;
  double recta;
  double rectb;
  $9076B28992D74D3AA2059476C2B9E2A9 var0;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  uint64_t block;
  uint64_t v251;
  void (*v252)(uint64_t);
  void *v253;
  NSArray *v254;
  id location[2];
  CGRect v256;
  CGRect v257;
  CGRect v258;
  CGRect v259;
  CGRect v260;
  CGRect v261;
  CGRect v262;
  CGRect v263;
  CGRect v264;
  CGRect v265;

  v6 = a3;
  v7 = v6;
  if (!self)
    goto LABEL_56;
  hoverDebugLayer = self->__hoverDebugLayer;
  if (hoverDebugLayer)
  {
    v9 = *(_OWORD *)&a4->var9;
    v246 = *(_OWORD *)&a4->var7;
    v247 = v9;
    v10 = *(_OWORD *)&a4->var13;
    v248 = *(_OWORD *)&a4->var11;
    v249 = v10;
    v11 = *(_OWORD *)&a4->var1;
    var0 = a4->var0;
    v243 = v11;
    v12 = *(_OWORD *)&a4->var5;
    v244 = *(_OWORD *)&a4->var3;
    v245 = v12;
    -[PKHoverController updateShapeLayer:inputPoint:](v6, hoverDebugLayer, &var0.var0.x);
  }
  hoverFlashElements = self->__hoverFlashElements;
  if (hoverFlashElements)
  {
    x = a4->var0.var0.x;
    y = a4->var0.var0.y;
    v16 = hoverFlashElements;
    if (!-[NSArray count](v16, "count"))
    {
LABEL_23:

      goto LABEL_24;
    }
    v17 = self->__hoverFlashElements;
    v18 = -[NSArray count](v17, "count");
    -[UIView subviews](self->__hoverFlashElementsView, "subviews");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v18 == v20)
    {
      if (-[NSArray count](self->__hoverFlashElements, "count"))
      {
        v228 = y;
        v231 = x;
        v16 = 0;
        v21 = 0;
        v22 = 0;
        rect = 1.79769313e308;
        v226 = 1.79769313e308;
        do
        {
          -[NSArray objectAtIndexedSubscript:](self->__hoverFlashElements, "objectAtIndexedSubscript:", v22);
          v23 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          v24 = self->__hoverFlashElementsView;
          -[UIView subviews](v24, "subviews");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectAtIndexedSubscript:", v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = -[PKTextInputElement frame]((uint64_t)v23);
          v29 = v28;
          v31 = v30;
          v33 = v32;
          -[PKTextInputElement coordinateSpace]((uint64_t)v23);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKTextInputHoverController view]((id *)&self->super.isa);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v34, v35, v27, v29, v31, v33);
          v38 = v37;
          v40 = v39;
          v42 = v41;

          v256.origin.x = v36;
          v256.origin.y = v38;
          v256.size.width = v40;
          v256.size.height = v42;
          v257 = CGRectInset(v256, -4.0, -4.0);
          objc_msgSend(v26, "setFrame:", v257.origin.x, v257.origin.y, v257.size.width, v257.size.height);
          v43 = -[PKTextInputElement frame]((uint64_t)v23);
          v47 = -[PKTextInputElement hitToleranceFrameFromElementFrame:](v23, v43, v44, v45, v46);
          v49 = v48;
          v51 = v50;
          v53 = v52;
          -[PKTextInputElement coordinateSpace]((uint64_t)v23);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKTextInputHoverController view]((id *)&self->super.isa);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v54, v55, v47, v49, v51, v53);
          v58 = v57;
          v235 = v60;
          v237 = v59;

          distanceToRect(v231, v228, v36, v38, v40, v42);
          v62 = v61;
          if (v61 < rect)
          {
            distanceToRect(v231, v228, v56, v58, v237, v235);
            v226 = v63;
            v64 = v26;

            v65 = v23;
            v21 = v65;
            v16 = v64;
            rect = v62;
          }

          ++v22;
        }
        while (v22 < -[NSArray count](self->__hoverFlashElements, "count"));
        if (v226 <= 0.0)
          goto LABEL_16;
      }
      else
      {
        v16 = 0;
        v21 = 0;
      }

      v21 = 0;
      v16 = 0;
LABEL_16:
      p_currentHoverFlashElementView = &self->__currentHoverFlashElementView;
      currentHoverFlashElementView = self->__currentHoverFlashElementView;
      if (v16 != (NSArray *)currentHoverFlashElementView)
      {
        v68 = currentHoverFlashElementView;
        -[UIView subviews](v68, "subviews");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "makeObjectsPerformSelector:", sel_removeFromSuperview);

        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v70 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v71 = objc_msgSend(v70, "CGColor");
        -[UIView layer](*p_currentHoverFlashElementView, "layer");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setBorderColor:", v71);

        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](*p_currentHoverFlashElementView, "setBackgroundColor:", v73);

        objc_storeStrong((id *)&self->__currentHoverFlashElementView, v16);
        if (v16)
        {
          -[PKTextInputElement referenceView]((id *)v21);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "tintColor");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = v75;
          if (v75)
          {
            v77 = v75;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
            v77 = (id)objc_claimAutoreleasedReturnValue();
          }
          v78 = v77;

          objc_msgSend(v78, "colorWithAlphaComponent:", 0.2);
          v79 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
          v80 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v81 = objc_msgSend(v80, "CGColor");
          -[NSArray layer](v16, "layer");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "setBorderColor:", v81);

          -[PKTextInputHoverController view]((id *)&self->super.isa);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "_screen");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "scale");
          v86 = 1.0 / v85;
          -[NSArray layer](v16, "layer");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "setBorderWidth:", v86);

          v88 = (void *)MEMORY[0x1E0DC3F10];
          v89 = MEMORY[0x1E0C809B0];
          *(_QWORD *)&var0.var0.x = MEMORY[0x1E0C809B0];
          *(_QWORD *)&var0.var0.y = 3221225472;
          *(_QWORD *)&v243 = __69__PKTextInputHoverController__updateFlashElementsForHoverInputPoint___block_invoke;
          *((_QWORD *)&v243 + 1) = &unk_1E7777C20;
          v90 = v16;
          *(_QWORD *)&v244 = v90;
          *((_QWORD *)&v244 + 1) = v79;
          v91 = v79;
          objc_msgSend(v88, "animateWithDuration:animations:", &var0, 0.2);
          v92 = dispatch_time(0, 500000000);
          block = v89;
          v251 = 3221225472;
          v252 = __69__PKTextInputHoverController__updateFlashElementsForHoverInputPoint___block_invoke_2;
          v253 = &unk_1E7778020;
          v254 = v90;
          dispatch_after(v92, MEMORY[0x1E0C80D38], &block);

        }
      }

      goto LABEL_23;
    }
  }
LABEL_24:
  if (self->__lineBreakTimestamp > 0.0)
  {
    self->__lineBreakPosition = (CGPoint)a4->var0;
    if (!self->__lineBreakWaitingForElement)
    {
      v93 = CACurrentMediaTime();
      if (self->__lineBreakTimestamp + 0.1 <= v93)
      {
        self->__lineBreakWaitingForElement = 1;
        -[PKTextInputHoverController view]((id *)&self->super.isa);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "window");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "windowScene");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "_visibleWindows");
        v97 = objc_claimAutoreleasedReturnValue();
        v98 = (void *)v97;
        v99 = (void *)MEMORY[0x1E0C9AA60];
        if (v97)
          v99 = (void *)v97;
        v100 = v99;

        v101 = -[PKTextInputElementsFinder initWithWindowsToSearch:]([PKTextInputSingleElementFinder alloc], v100);
        objc_initWeak(location, self);
        v102 = MEMORY[0x1E0C809B0];
        block = MEMORY[0x1E0C809B0];
        v251 = 3221225472;
        v252 = __63__PKTextInputHoverController__checklineBreakGestureIfNecessary__block_invoke;
        v253 = &unk_1E7777588;
        objc_copyWeak((id *)&v254, location);
        v103 = _Block_copy(&block);
        v104 = self->__lineBreakPosition.x;
        v105 = self->__lineBreakPosition.y;
        -[PKTextInputHoverController view]((id *)&self->super.isa);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        var0.var0.x = v102;
        *(_QWORD *)&var0.var0.y = 3221225472;
        *(_QWORD *)&v243 = __63__PKTextInputHoverController__checklineBreakGestureIfNecessary__block_invoke_2;
        *((_QWORD *)&v243 + 1) = &unk_1E777BCC8;
        v107 = v101;
        *((double *)&v245 + 1) = v104;
        *(double *)&v246 = v105;
        *(_QWORD *)&v244 = v107;
        *((_QWORD *)&v244 + 1) = self;
        *((double *)&v246 + 1) = v93;
        v108 = v103;
        *(_QWORD *)&v245 = v108;
        objc_msgSend(v107, "findSingleElementAtPosition:coordinateSpace:completion:", v106, &var0, v104, v105);

        objc_destroyWeak((id *)&v254);
        objc_destroyWeak(location);

      }
    }
  }
  if (self->__ibeamElement)
  {
    v109 = a4->var0.var0.x;
    v110 = a4->var0.var0.y;
    -[PKTextInputHoverController view]((id *)&self->super.isa);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputElement coordinateSpace]((uint64_t)self->__ibeamElement);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = *MEMORY[0x1E0C9D820];
    v114 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v115 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v111, v112, v109, v110, *MEMORY[0x1E0C9D820], v114);
    v117 = v116;

    v118 = -[PKTextInputElement frame]((uint64_t)self->__ibeamElement);
    v122 = v118;
    v123 = v119;
    if (v115 >= v118)
    {
      v124 = v118 + v120;
      v125 = v115 <= v122 + v120;
      v122 = v115;
      if (!v125)
        v122 = v124;
    }
    if (v117 >= v119)
    {
      v123 = v117;
      if (v117 > v119 + v121)
        v123 = v119 + v121;
    }
    -[PKTextInputElement coordinateSpace]((uint64_t)self->__ibeamElement);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputHoverController view]((id *)&self->super.isa);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v126, v127, v122, v123, v113, v114);
    v130 = v129;

    v131 = self->__ibeamElementContent;
    -[PKTextInputHoverController view]((id *)&self->super.isa);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = v132;
    if (v131)
    {
      v134 = -[PKTextInputElementContent characterIndexClosestToPoint:inCoordinateSpace:forInsertingText:adjustForLastCharacter:]((id *)&v131->super.isa, v132, 1, 1, v128, v130);

      if (v134 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_49:
        -[PKTextInputHoverController hideIBeamLayer]((uint64_t)self);
        goto LABEL_56;
      }
    }
    else
    {

      v134 = 0;
    }
    if (-[PKTextInputElementContent contentLength]((uint64_t)self->__ibeamElementContent))
    {
      v135 = self->__ibeamElementContent;
      -[PKTextInputHoverController view]((id *)&self->super.isa);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputElementContent firstRectForRange:inCoordinateSpace:]((id *)&v135->super.isa, v134, 1uLL, v136);
      v138 = v137;
      v140 = v139;
      v142 = v141;
      v144 = v143;

      DKDDistanceToRect(v128, v130, v138, v140, v142, v144);
      v236 = v130;
      v238 = v128;
      if (v134 < 1)
      {
        v159 = v144;
        v158 = v145;
      }
      else
      {
        v146 = v145;
        v147 = self->__ibeamElementContent;
        -[PKTextInputHoverController view]((id *)&self->super.isa);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTextInputElementContent firstRectForRange:inCoordinateSpace:]((id *)&v147->super.isa, v134 - 1, 1uLL, v148);
        v149 = v142;
        v151 = v150;
        v229 = v152;
        v232 = v138;
        recta = v140;
        v154 = v153;
        v156 = v155;

        DKDDistanceToRect(v128, v130, v151, v229, v154, v156);
        if (v157 < v146)
          v158 = v157;
        else
          v158 = v146;
        if (v157 < v146)
        {
          v144 = v156;
          v149 = v154;
        }
        v138 = v232;
        v140 = recta;
        if (v157 < v146)
        {
          v140 = v229;
          v138 = v151;
          --v134;
        }
        v142 = v149;
        v159 = v144;
      }
      v160 = self->__ibeamElementContent;
      -[PKTextInputHoverController view]((id *)&self->super.isa);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      v162 = -[PKTextInputElementContent caretRectForCharacterIndex:inCoordinateSpace:]((uint64_t)v160, v134, v161);
      v164 = v163;
      v166 = v165;
      rectb = v167;

      if (v158 > 20.0)
        goto LABEL_54;
      v258.origin.x = v162;
      v258.origin.y = v164;
      v258.size.width = v166;
      v258.size.height = rectb;
      if (CGRectIsNull(v258)
        || (v168 = self->__ibeamElementContent,
            -[PKTextInputHoverController view]((id *)&self->super.isa),
            v169 = (void *)objc_claimAutoreleasedReturnValue(),
            v170 = -[PKTextInputElementContent hasLinkAtCharacterIndex:location:coordinateSpace:]((uint64_t)v168, v134, v169, v238, v236), v168, v169, v170))
      {
LABEL_54:
        v171 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
        self->__ibeamFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
        self->__ibeamFrame.size = v171;
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v172 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        -[CALayer setBackgroundColor:](self->__ibeamLayer, "setBackgroundColor:", objc_msgSend(v172, "CGColor"));
LABEL_55:

        goto LABEL_56;
      }
      -[PKTextInputHoverController _ibeamLayerCreateIfNecessary]((id *)&self->super.isa);
      v172 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      v174 = v134 == 0;
      v175 = -[PKTextInputElementContent contentLength]((uint64_t)self->__ibeamElementContent) - 1;
      v176 = v134 >= v175;
      v177 = v134 - 1;
      v227 = v142;
      v230 = v159;
      if (v134 < 1)
      {
        v179 = v164;
        v185 = v236;
        v184 = v238;
LABEL_82:
        v261.origin.x = v138;
        v261.origin.y = v140;
        v261.size.width = v227;
        v261.size.height = v230;
        v262 = CGRectInset(v261, -1.0, 0.0);
        v211 = v262.origin.x;
        width = v262.size.width;
        v262.origin.y = v179;
        v262.size.height = rectb;
        if (v185 <= CGRectGetMaxY(v262)
          || v184 >= v211
          && (v263.origin.x = v211,
              v263.origin.y = v179,
              v263.size.width = width,
              v263.size.height = rectb,
              v184 <= CGRectGetMaxX(v263)))
        {
          if (v211 >= v184)
            v215 = v211;
          else
            v215 = v184;
          if (v174)
            v184 = v215;
          if (v176)
          {
            v264.origin.x = v211;
            v264.origin.y = v179;
            v264.size.width = width;
            v264.size.height = rectb;
            MaxX = CGRectGetMaxX(v264);
            if (MaxX < v184)
              v184 = MaxX;
          }
          v265.origin.x = self->__ibeamFrame.origin.x;
          v217 = self->__ibeamFrame.origin.y;
          v265.size.width = self->__ibeamFrame.size.width;
          v265.size.height = self->__ibeamFrame.size.height;
          v265.origin.y = v217;
          IsEmpty = CGRectIsEmpty(v265);
          v219 = IsEmpty;
          if (IsEmpty)
            v220 = v179;
          else
            v220 = (v179 + v217 * 3.0) * 0.25;
          objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
          objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
          objc_msgSend(v172, "setFrame:", v184, v220, 2.0, rectb);
          if (v219)
          {
            objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
            v221 = (CGColor *)objc_msgSend(v172, "backgroundColor");
            v222 = objc_retainAutorelease(v173);
            if (!CGColorEqualToColor(v221, (CGColorRef)objc_msgSend(v222, "CGColor")))
              objc_msgSend(v172, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v222), "CGColor"));
          }
          else
          {
            v223 = (CGColor *)objc_msgSend(v172, "backgroundColor");
            v224 = objc_retainAutorelease(v173);
            if (!CGColorEqualToColor(v223, (CGColorRef)objc_msgSend(v224, "CGColor")))
              objc_msgSend(v172, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v224), "CGColor"));
            objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
          }
          self->__ibeamFrame.origin.x = v184;
          self->__ibeamFrame.origin.y = v220;
          self->__ibeamFrame.size.width = 2.0;
          self->__ibeamFrame.size.height = rectb;
          self->__ibeamLastTimestamp = CACurrentMediaTime();
        }
        else
        {
          v213 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
          self->__ibeamFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
          self->__ibeamFrame.size = v213;
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v214 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          -[CALayer setBackgroundColor:](self->__ibeamLayer, "setBackgroundColor:", objc_msgSend(v214, "CGColor"));

        }
        goto LABEL_55;
      }
      v178 = v134 >= v175;
      v225 = v173;
      v179 = v164;
      if (v134 >= -[PKTextInputElementContent contentLength]((uint64_t)self->__ibeamElementContent) - 1)
      {
        v185 = v236;
        v184 = v238;
LABEL_74:
        v174 = 1;
        -[PKTextInputElementContent stringInRange:]((uint64_t)self->__ibeamElementContent, v177, 1);
        v197 = (void *)objc_claimAutoreleasedReturnValue();
        v198 = objc_msgSend(v197, "characterAtIndex:", 0);
        objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v198) = objc_msgSend(v199, "characterIsMember:", v198);

        if ((v198 & 1) == 0)
        {
          v234 = v138;
          v200 = self->__ibeamElementContent;
          -[PKTextInputHoverController view]((id *)&self->super.isa);
          v201 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKTextInputElementContent firstRectForRange:inCoordinateSpace:]((id *)&v200->super.isa, v177, 1uLL, v201);
          v203 = v202;
          v205 = v204;
          v207 = v206;
          v209 = v208;

          v260.origin.x = v203;
          v260.origin.y = v205;
          v260.size.width = v207;
          v260.size.height = v209;
          if (CGRectIsNull(v260))
          {
            v174 = 0;
          }
          else
          {
            v210 = v205 - v140;
            if (v205 - v140 < 0.0)
              v210 = -(v205 - v140);
            v174 = v210 > v230 * 0.5;
          }
          v138 = v234;
        }

        v176 = v178;
        v173 = v225;
        goto LABEL_82;
      }
      v180 = v134 + 1;
      -[PKTextInputElementContent stringInRange:]((uint64_t)self->__ibeamElementContent, v134 + 1, 1);
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v181, "length") == 1)
      {
        v182 = objc_msgSend(v181, "characterAtIndex:", 0);
        objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v182) = objc_msgSend(v183, "characterIsMember:", v182);

        v178 = 1;
        v185 = v236;
        v184 = v238;
        if ((v182 & 1) != 0 || v134 >= v175)
          goto LABEL_73;
      }
      else
      {
        v185 = v236;
        v184 = v238;
        if (v134 >= v175)
        {
          v178 = 1;
LABEL_73:

          goto LABEL_74;
        }
      }
      v233 = v138;
      v186 = self->__ibeamElementContent;
      -[PKTextInputHoverController view]((id *)&self->super.isa);
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputElementContent firstRectForRange:inCoordinateSpace:]((id *)&v186->super.isa, v180, 1uLL, v187);
      v189 = v188;
      v191 = v190;
      v193 = v192;
      v195 = v194;

      v259.origin.x = v189;
      v259.origin.y = v191;
      v259.size.width = v193;
      v259.size.height = v195;
      if (CGRectIsNull(v259))
      {
        v178 = 0;
      }
      else
      {
        v196 = v191 - v140;
        if (v191 - v140 < 0.0)
          v196 = -(v191 - v140);
        v178 = v196 > v230 * 0.5;
      }
      v138 = v233;
      goto LABEL_73;
    }
    goto LABEL_49;
  }
LABEL_56:

}

- (void)hoverControllerDidEnd:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  dispatch_time_t v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[PKTextInputHoverController hideIBeamLayer]((uint64_t)self);
  -[PKTextInputHoverController _cursorController]((id *)&self->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForceVisible:", 0);

  if (self)
  {
    self->__lineBreakTimestamp = 0.0;
    -[CAShapeLayer removeFromSuperlayer](self->__hoverDebugLayer, "removeFromSuperlayer");
    objc_storeStrong((id *)&self->__hoverDebugLayer, 0);
    -[UIView removeFromSuperview](self->__hoverFlashElementsView, "removeFromSuperview");
    objc_storeStrong((id *)&self->__hoverFlashElementsView, 0);
    objc_storeStrong((id *)&self->__currentHoverFlashElementView, 0);
    self->__shouldMakeCursorStrong = 0;
  }
  else
  {
    objc_msgSend(0, "removeFromSuperlayer");
    objc_msgSend(0, "removeFromSuperview");
  }
  -[PKTextInputHoverController _cursorController]((id *)&self->super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "forceStrong");

  if (v6)
  {
    objc_initWeak(&location, self);
    v7 = dispatch_time(0, 2000000000);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__PKTextInputHoverController_hoverControllerDidEnd___block_invoke;
    v8[3] = &unk_1E7777588;
    objc_copyWeak(&v9, &location);
    dispatch_after(v7, MEMORY[0x1E0C80D38], v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  if (self)
  {
    if (self->__hidePlaceholderElement)
    {
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_unhidePlaceholderElementIfNecessary, 0);
      -[PKTextInputHoverController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_unhidePlaceholderElementIfNecessary, 0, 1.0);
    }
  }
}

- (void)hideIBeamLayer
{
  __int128 v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v2 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(a1 + 160) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(a1 + 176) = v2;
    v3 = *(void **)(a1 + 112);
    *(_QWORD *)(a1 + 112) = 0;

    v4 = *(void **)(a1 + 120);
    *(_QWORD *)(a1 + 120) = 0;

    objc_msgSend(*(id *)(a1 + 128), "removeFromSuperlayer");
    v5 = *(void **)(a1 + 128);
    *(_QWORD *)(a1 + 128) = 0;

  }
}

void __52__PKTextInputHoverController_hoverControllerDidEnd___block_invoke(uint64_t a1)
{
  void *v1;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[PKTextInputHoverController _cursorController](WeakRetained);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setForceStrong:", 0);

}

- (void)unhidePlaceholderElementIfNecessary
{
  PKTextInputElement *hidePlaceholderElement;
  PKHoverController *hoverController;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  PKHoverController *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  CGFloat *p_y;
  double *p_force;
  double *v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  PKTextInputHoverController *v25;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_unhidePlaceholderElementIfNecessary, 0);
  if (self)
  {
    hidePlaceholderElement = self->__hidePlaceholderElement;
    if (hidePlaceholderElement)
    {
      hoverController = self->__hoverController;
      if (hoverController && LOBYTE(hoverController->_waitingForHoverHoldTimestamp))
      {
        -[PKTextInputHoverController view]((id *)&self->super.isa);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "window");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "windowScene");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_visibleWindows");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        v10 = (void *)MEMORY[0x1E0C9AA60];
        if (v8)
          v10 = (void *)v8;
        v11 = v10;

        v12 = -[PKTextInputElementsFinder initWithWindowsToSearch:]([PKTextInputSingleElementFinder alloc], v11);
        v13 = self->__hoverController;
        if (v13)
        {
          end = v13->_inputPoints.__end_;
          value = v13->_inputPoints.__end_cap_.__value_;
          p_y = &v13->_cachedLatestInputPoint.var0.point.y;
          p_force = &v13->_cachedLatestInputPoint.force;
          if (value == end)
          {
            v18 = p_y;
          }
          else
          {
            p_force = (double *)((char *)end + 8);
            v18 = (double *)end;
          }
          v19 = *v18;
          v20 = *p_force;
        }
        else
        {
          v19 = 0.0;
          v20 = 0.0;
        }
        -[PKTextInputHoverController view]((id *)&self->super.isa);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __65__PKTextInputHoverController_unhidePlaceholderElementIfNecessary__block_invoke;
        v23[3] = &unk_1E7777C20;
        v24 = v12;
        v25 = self;
        v22 = v12;
        objc_msgSend(v22, "findSingleElementAtPosition:coordinateSpace:completion:", v21, v23, v19, v20);

      }
      else
      {
        -[PKTextInputElement endSuppressingPlaceholderIfNecessary](hidePlaceholderElement, "endSuppressingPlaceholderIfNecessary");
        -[PKTextInputHoverController set_hidePlaceholderElement:]((uint64_t)self, 0);
      }
    }
  }
}

void __65__PKTextInputHoverController_unhidePlaceholderElementIfNecessary__block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  _QWORD *v6;
  void *v7;
  id *v8;

  objc_msgSend(*(id *)(a1 + 32), "foundElement");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v4 = *(void **)(v3 + 104);
    if (v4)
    {
      v8 = v2;
      v5 = -[PKTextInputElement isEquivalentToElement:](v2, v4);
      v6 = *(_QWORD **)(a1 + 40);
      if ((v5 & 1) == 0)
      {
        if (v6)
          v7 = (void *)v6[13];
        else
          v7 = 0;
        objc_msgSend(v7, "endSuppressingPlaceholderIfNecessary");
        -[PKTextInputHoverController set_hidePlaceholderElement:](*(_QWORD *)(a1 + 40), 0);
        goto LABEL_9;
      }
      v2 = v8;
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", v6, sel_unhidePlaceholderElementIfNecessary, 0);
        objc_msgSend(v6, "performSelector:withObject:afterDelay:", sel_unhidePlaceholderElementIfNecessary, 0, 1.0);
LABEL_9:
        v2 = v8;
      }
    }
  }

}

- (void)set_hidePlaceholderElement:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 104), a2);
}

- (void)hoverControllerDidLift:(id)a3
{
  id WeakRetained;
  PKTextInputElement *hidePlaceholderElement;
  id v6;

  v6 = a3;
  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "hoverControllerDidLift:", self);

    hidePlaceholderElement = self->__hidePlaceholderElement;
    if (hidePlaceholderElement)
    {
      -[PKTextInputElement endSuppressingPlaceholderIfNecessary](hidePlaceholderElement, "endSuppressingPlaceholderIfNecessary");
      -[PKTextInputHoverController set_hidePlaceholderElement:]((uint64_t)self, 0);
    }
  }
  else
  {
    objc_msgSend(0, "hoverControllerDidLift:", 0);
  }

}

- (void)hoverController:(id)a3 holdGestureMeanInputPoint:(id *)a4 latestInputPoint:(id *)a5
{
  id v8;
  double x;
  double y;
  id WeakRetained;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  CAShapeLayer *hoverDebugLayer;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  _WORD *v32;
  int v33;
  void *v34;
  _BOOL4 v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  _WORD *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[4];
  id v69;
  PKTextInputHoverController *v70;
  double v71;
  double v72;
  _QWORD v73[4];
  id v74;
  PKTextInputHoverController *v75;
  double v76;
  double v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;

  v8 = a3;
  if (self)
  {
    x = a4->var0.var0.x;
    y = a4->var0.var0.y;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "hoverController:topLevelHitViewAt:", self, x, y);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  v13 = +[PKTextInputElementsFinder isResponderEditableTextInput:]((uint64_t)PKTextInputElementsFinder, v12);
  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "tooltipsActive");

  if (v15)
  {
    objc_msgSend(v12, "pk_hoverLabelAttributedString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v58 = (void *)MEMORY[0x1E0DC3F10];
      v59 = v8;
      v17 = v12;
      v18 = v17;
      if (!self)
        goto LABEL_7;
      objc_msgSend(v17, "window");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputHoverController view]((id *)&self->super.isa);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "window");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19 == v21)
      {
        objc_msgSend(v18, "accessibilityLabel");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v58;
        v8 = v59;
        if (!v22)
        {
          objc_msgSend(v18, "accessibilityHint");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
LABEL_7:
        v22 = 0;
        v23 = v58;
        v8 = v59;
      }

      objc_msgSend(v23, "pk_hoverAttributedStringFromString:", v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v16, "length", v58))
      -[PKHoverController showAttributedLabel:atLocation:]((uint64_t)self->__hoverController, v16, a5->var0.var0.x, a5->var0.var0.y);

  }
  -[PKHoverController hoverDebugLayerColor](v8);
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v25 = objc_msgSend(v24, "CGColor");
  if (self)
    hoverDebugLayer = self->__hoverDebugLayer;
  else
    hoverDebugLayer = 0;
  -[CAShapeLayer setFillColor:](hoverDebugLayer, "setFillColor:", v25);

  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "scribbleLineBreakHandling") & v13;

  if (v28 == 1)
  {
    if (self)
    {
      if (!self->__lineBreakWaitingForElement && self->__lineBreakTimestamp == 0.0)
      {
        self->__lineBreakTimestamp = CACurrentMediaTime();
        self->__lineBreakPosition = (CGPoint)a4->var0;
      }
    }
    else
    {
      CACurrentMediaTime();
    }
  }
  else
  {
    +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "scribbleFlashCursorActive");

    if (v30)
    {
      -[PKTextInputHoverController _cursorController]((id *)&self->super.isa);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "flashCursor");

    }
  }
  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v32 = (_WORD *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "scribbleIBeamActive");
  v34 = (void *)MEMORY[0x1E0C9AA60];
  if (!v33)
    goto LABEL_36;
  v35 = +[PKTextInputElementsFinder isResponderNonEditableTextInput:]((uint64_t)PKTextInputElementsFinder, v12);

  if (!v35)
    goto LABEL_37;
  if (!self)
  {
LABEL_30:
    -[PKTextInputHoverController view]((id *)&self->super.isa);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "window");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "windowScene");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "_visibleWindows");
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v41;
    if (v41)
      v43 = (void *)v41;
    else
      v43 = v34;
    v60 = v43;

    v44 = -[PKTextInputElementsFinder initWithWindowsToSearch:]([PKTextInputSingleElementFinder alloc], v60);
    if (v44)
      v44[4] = 257;
    v45 = a5->var0.var0.x;
    v46 = a5->var0.var0.y;
    -[PKTextInputHoverController view]((id *)&self->super.isa);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __89__PKTextInputHoverController_hoverController_holdGestureMeanInputPoint_latestInputPoint___block_invoke;
    v68[3] = &unk_1E777BBD8;
    v71 = v45;
    v72 = v46;
    v69 = v44;
    v70 = self;
    v32 = v44;
    objc_msgSend(v32, "findSingleElementAtPosition:coordinateSpace:completion:", v47, v68, v45, v46);

LABEL_36:
LABEL_37:
    v36 = a5->var0.var0.x;
    v37 = a5->var0.var0.y;
    v65 = *(_OWORD *)&a5->var9;
    v66 = *(_OWORD *)&a5->var11;
    v67 = *(_OWORD *)&a5->var13;
    v61 = *(_OWORD *)&a5->var1;
    v62 = *(_OWORD *)&a5->var3;
    v63 = *(_OWORD *)&a5->var5;
    v64 = *(_OWORD *)&a5->var7;
    if (!self)
      goto LABEL_42;
    goto LABEL_38;
  }
  if (!self->__iBeamWaitingForElement && !self->__ibeamElement)
  {
    self->__iBeamWaitingForElement = 1;
    goto LABEL_30;
  }
  v36 = a5->var0.var0.x;
  v37 = a5->var0.var0.y;
  v65 = *(_OWORD *)&a5->var9;
  v66 = *(_OWORD *)&a5->var11;
  v67 = *(_OWORD *)&a5->var13;
  v61 = *(_OWORD *)&a5->var1;
  v62 = *(_OWORD *)&a5->var3;
  v63 = *(_OWORD *)&a5->var5;
  v64 = *(_OWORD *)&a5->var7;
LABEL_38:
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_unhidePlaceholderElementIfNecessary, 0);
  -[PKTextInputHoverController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_unhidePlaceholderElementIfNecessary, 0, 1.0);
  -[PKTextInputHoverController view]((id *)&self->super.isa);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "window");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "windowScene");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "_visibleWindows");
  v51 = objc_claimAutoreleasedReturnValue();
  v52 = (void *)v51;
  if (v51)
    v53 = (void *)v51;
  else
    v53 = v34;
  v54 = v53;

  v55 = -[PKTextInputElementsFinder initWithWindowsToSearch:]([PKTextInputSingleElementFinder alloc], v54);
  -[PKTextInputHoverController view]((id *)&self->super.isa);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v73[2] = __47__PKTextInputHoverController__handleHoverHold___block_invoke;
  v73[3] = &unk_1E777BC78;
  v74 = v55;
  v75 = self;
  v76 = v36;
  v77 = v37;
  v82 = v65;
  v83 = v66;
  v84 = v67;
  v78 = v61;
  v79 = v62;
  v81 = v64;
  v80 = v63;
  v57 = v55;
  objc_msgSend(v57, "findSingleElementAtPosition:coordinateSpace:completion:", v56, v73, v36, v37);

LABEL_42:
}

void __89__PKTextInputHoverController_hoverController_holdGestureMeanInputPoint_latestInputPoint___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "foundElement");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    -[PKTextInputHoverController view](*(id **)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PKTextInputElement containsPoint:inCoordinateSpace:]((_BOOL8)v2, v3, *(double *)(a1 + 48), *(double *)(a1 + 56));

    if (v4)
    {
      if ((-[PKTextInputElement isEditableElement]((uint64_t)v2) & 1) == 0)
      {
        -[PKTextInputElement coordinateSpace]((uint64_t)v2);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTextInputHoverController view](*(id **)(a1 + 40));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "convertPoint:fromCoordinateSpace:", v6, *(double *)(a1 + 48), *(double *)(a1 + 56));
        v8 = v7;
        v10 = v9;

        v11 = -[PKTextInputElement frame]((uint64_t)v2);
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __89__PKTextInputHoverController_hoverController_holdGestureMeanInputPoint_latestInputPoint___block_invoke_2;
        v19[3] = &unk_1E777BBB0;
        v19[4] = *(_QWORD *)(a1 + 40);
        v2 = v2;
        v20 = v2;
        -[PKTextInputElement loadContentFocusingIfNeededWithReferencePoint:alwaysSetSelectionFromReferencePoint:rectOfInterest:completion:]((uint64_t)v2, 0, v19, v8, v10, v11, v13, v15, v17);

        goto LABEL_8;
      }
    }
    else
    {

      v2 = 0;
    }
  }
  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    *(_BYTE *)(v18 + 12) = 0;
LABEL_8:

}

void __89__PKTextInputHoverController_hoverController_holdGestureMeanInputPoint_latestInputPoint___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = a2;
  if (v5)
    objc_storeStrong((id *)(v5 + 112), v4);
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    objc_storeStrong((id *)(v7 + 120), a2);

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    *(_BYTE *)(v8 + 12) = 0;
}

- (void)hoverControllerHoldGestureEnded:(id)a3
{
  id v4;
  uint64_t v5;
  CAShapeLayer *hoverDebugLayer;

  if (self)
    self->__shouldMakeCursorStrong = 0;
  -[PKSqueezePaletteViewContext setSelectedColor:]((uint64_t)self, 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "CGColor");
  if (self)
    hoverDebugLayer = self->__hoverDebugLayer;
  else
    hoverDebugLayer = 0;
  -[CAShapeLayer setFillColor:](hoverDebugLayer, "setFillColor:", v5);

  -[PKHoverController hideLabel](self->__hoverController, "hideLabel");
  self->__shouldHoverFlashElements = 0;
}

void __52__PKTextInputHoverController__flashElementsForHover__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  unsigned __int8 *WeakRetained;
  int v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;
  CGRect v51;
  CGRect v52;

  v50 = *MEMORY[0x1E0C80C00];
  v44 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    if (objc_msgSend(v44, "count"))
    {
      v3 = (id *)(a1 + 40);
      WeakRetained = (unsigned __int8 *)objc_loadWeakRetained(v3);
      if (WeakRetained)
      {
        v5 = WeakRetained[8];

        if (v5)
        {
          v6 = objc_loadWeakRetained(v3);
          if (v6)
          {
            objc_msgSend(v44, "allObjects");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            *((_BYTE *)v6 + 8) = 0;
            objc_storeStrong((id *)v6 + 7, v7);
            -[PKTextInputHoverController view]((id *)v6);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "bounds");
            v10 = v9;
            v12 = v11;
            v14 = v13;
            v16 = v15;

            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v10, v12, v14, v16);
            objc_msgSend(v17, "setUserInteractionEnabled:", 0);
            -[PKTextInputHoverController view]((id *)v6);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addSubview:", v17);

            v47 = 0u;
            v48 = 0u;
            v45 = 0u;
            v46 = 0u;
            v19 = v7;
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v46;
              do
              {
                for (i = 0; i != v21; ++i)
                {
                  if (*(_QWORD *)v46 != v22)
                    objc_enumerationMutation(v19);
                  v24 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
                  v25 = -[PKTextInputElement frame](v24);
                  v27 = v26;
                  v29 = v28;
                  v31 = v30;
                  -[PKTextInputElement coordinateSpace](v24);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PKTextInputHoverController view]((id *)v6);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v32, v33, v25, v27, v29, v31);
                  v36 = v35;
                  v38 = v37;
                  v40 = v39;

                  v51.origin.x = v34;
                  v51.origin.y = v36;
                  v51.size.width = v38;
                  v51.size.height = v40;
                  v52 = CGRectInset(v51, -4.0, -4.0);
                  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v52.origin.x, v52.origin.y, v52.size.width, v52.size.height);
                  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "setBackgroundColor:", v42);

                  objc_msgSend(v41, "_setContinuousCornerRadius:", 4.0);
                  objc_msgSend(v41, "setClipsToBounds:", 1);
                  objc_msgSend(v41, "setUserInteractionEnabled:", 0);
                  objc_msgSend(v17, "addSubview:", v41);

                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
              }
              while (v21);
            }

            v43 = (void *)*((_QWORD *)v6 + 6);
            *((_QWORD *)v6 + 6) = v17;

          }
        }
      }
    }
  }

}

void __47__PKTextInputHoverController__handleHoverHold___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id *v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  void *v35;
  CGFloat MidX;
  CGFloat MidY;
  id v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  id *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  dispatch_time_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  double v63;
  dispatch_time_t v64;
  _QWORD v65[4];
  id v66;
  _QWORD block[4];
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id from[4];
  id v78;
  id v79;
  id location;
  CGRect v81;
  CGRect v82;

  objc_msgSend(*(id *)(a1 + 32), "foundElement");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      v4 = *(_QWORD *)(v3 + 24);
      if (v4)
      {
        if (*(_BYTE *)(v4 + 56))
        {
          v5 = *(id *)(v3 + 104);
          if (v5)
          {
            v6 = v5;
            v7 = *(_QWORD *)(a1 + 40);
            v8 = v7 ? *(id **)(v7 + 104) : 0;
            v9 = -[PKTextInputElement isEquivalentToElement:](v8, v2);

            if ((v9 & 1) == 0)
              objc_msgSend(*(id *)(a1 + 40), "unhidePlaceholderElementIfNecessary");
          }
          -[PKTextInputHoverController set_hidePlaceholderElement:](*(_QWORD *)(a1 + 40), v2);
          v10 = *(_QWORD *)(a1 + 40);
          if (v10)
            v11 = *(void **)(v10 + 104);
          else
            v11 = 0;
          objc_msgSend(v11, "beginSuppressingPlaceholderIfNecessary");
          +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "scribbleShowWritableElementsActive");

          if (v13)
          {
            v14 = *(_QWORD *)(a1 + 40);
            if (v14)
            {
              +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "scribbleShowWritableElementsActive");

              if (v16)
              {
                v17 = *(id *)(v14 + 48);
                if (v17)
                {

                }
                else if (!*(_BYTE *)(v14 + 8))
                {
                  *(_BYTE *)(v14 + 8) = 1;
                  -[PKTextInputHoverController view]((id *)v14);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "window");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "windowScene");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "_visibleWindows");
                  v21 = objc_claimAutoreleasedReturnValue();
                  v22 = (void *)v21;
                  v23 = (void *)MEMORY[0x1E0C9AA60];
                  if (v21)
                    v23 = (void *)v21;
                  v24 = v23;

                  v25 = -[PKTextInputElementsFinder initWithWindowsToSearch:]([PKTextInputElementsFinder alloc], v24);
                  -[PKTextInputHoverController view]((id *)v14);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "bounds");
                  v28 = v27;
                  v30 = v29;
                  v32 = v31;
                  v34 = v33;

                  objc_initWeak(&location, (id)v14);
                  -[PKTextInputHoverController view]((id *)v14);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v81.origin.x = v28;
                  v81.origin.y = v30;
                  v81.size.width = v32;
                  v81.size.height = v34;
                  MidX = CGRectGetMidX(v81);
                  v82.origin.x = v28;
                  v82.origin.y = v30;
                  v82.size.width = v32;
                  v82.size.height = v34;
                  MidY = CGRectGetMidY(v82);
                  from[0] = (id)MEMORY[0x1E0C809B0];
                  from[1] = (id)3221225472;
                  from[2] = __52__PKTextInputHoverController__flashElementsForHover__block_invoke;
                  from[3] = &unk_1E777BC00;
                  v38 = v25;
                  v78 = v38;
                  objc_copyWeak(&v79, &location);
                  if (v38)
                    -[PKTextInputElementsFinder _findAvailableTextInputElementsWithReusableElements:referenceHitPoint:referenceSearchArea:referenceCoordSpace:nearPointOnly:completion:]((uint64_t)v38, 0, v35, 0, from, MidX, MidY, v28, v30, v32, v34);

                  objc_destroyWeak(&v79);
                  objc_destroyWeak(&location);

                }
              }
            }
          }
          if ((-[PKTextInputElement isFocused]((uint64_t)v2) & 1) != 0
            || !-[PKTextInputElement shouldPostponeFocusing](v2))
          {
            if (-[PKTextInputElement isFocused]((uint64_t)v2))
            {
              +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v54, "scribbleHoverStrongActive") & 1) != 0)
              {
                -[PKTextInputHoverController _cursorController](*(id **)(a1 + 40));
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                if (!objc_msgSend(v55, "forceStrong"))
                {
                  v56 = *(_QWORD *)(a1 + 40);
                  if (v56)
                  {
                    v57 = *(unsigned __int8 *)(v56 + 9);

                    if (v57)
                      goto LABEL_42;
                  }
                  else
                  {

                  }
                  v58 = *(_QWORD *)(a1 + 40);
                  if (v58)
                    v59 = *(void **)(v58 + 24);
                  else
                    v59 = 0;
                  -[PKHoverController showLabel:atLocation:](v59, CFSTR("Lock Cursor"), *(double *)(a1 + 48), *(double *)(a1 + 56));
                  v60 = *(_QWORD *)(a1 + 40);
                  if (v60)
                  {
                    *(_BYTE *)(v60 + 9) = 1;
                    v61 = *(void **)(a1 + 40);
                  }
                  else
                  {
                    v61 = 0;
                  }
                  objc_initWeak(from, v61);
                  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "hoverAndHoldActionTimeInterval");
                  v64 = dispatch_time(0, (uint64_t)(v63 * 1000000000.0));
                  v65[0] = MEMORY[0x1E0C809B0];
                  v65[1] = 3221225472;
                  v65[2] = __47__PKTextInputHoverController__handleHoverHold___block_invoke_4;
                  v65[3] = &unk_1E7777588;
                  objc_copyWeak(&v66, from);
                  dispatch_after(v64, MEMORY[0x1E0C80D38], v65);

                  v53 = &v66;
                  goto LABEL_41;
                }

              }
            }
          }
          else
          {
            +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "scribbleFocusActive");

            if (v40)
            {
              -[PKSqueezePaletteViewContext setSelectedColor:](*(_QWORD *)(a1 + 40), v2);
              v41 = *(_QWORD *)(a1 + 40);
              if (v41)
                v42 = *(void **)(v41 + 24);
              else
                v42 = 0;
              v44 = *(double *)(a1 + 48);
              v45 = *(double *)(a1 + 56);
              v43 = (id *)(a1 + 48);
              -[PKHoverController showLabel:atLocation:](v42, CFSTR("Hold to Focus"), v44, v45);
              objc_initWeak(from, *(v43 - 1));
              +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "hoverAndHoldActionTimeInterval");
              v48 = dispatch_time(0, (uint64_t)(v47 * 1000000000.0));
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __47__PKTextInputHoverController__handleHoverHold___block_invoke_2;
              block[3] = &unk_1E777BC50;
              objc_copyWeak(&v68, from);
              v49 = *((_OWORD *)v43 + 5);
              v73 = *((_OWORD *)v43 + 4);
              v74 = v49;
              v50 = *((_OWORD *)v43 + 7);
              v75 = *((_OWORD *)v43 + 6);
              v76 = v50;
              v51 = *((_OWORD *)v43 + 1);
              v69 = *(_OWORD *)v43;
              v70 = v51;
              v52 = *((_OWORD *)v43 + 3);
              v71 = *((_OWORD *)v43 + 2);
              v72 = v52;
              dispatch_after(v48, MEMORY[0x1E0C80D38], block);

              v53 = &v68;
LABEL_41:
              objc_destroyWeak(v53);
              objc_destroyWeak(from);
            }
          }
        }
      }
    }
  }
LABEL_42:

}

void __47__PKTextInputHoverController__handleHoverHold___block_invoke_2(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    WeakRetained = (_QWORD *)WeakRetained[3];
  objc_msgSend(WeakRetained, "hideLabel");

  v5 = objc_loadWeakRetained(v2);
  v6 = v5;
  if (v5)
    v7 = (void *)*((_QWORD *)v5 + 5);
  else
    v7 = 0;
  v8 = v7;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__PKTextInputHoverController__handleHoverHold___block_invoke_3;
  v9[3] = &unk_1E777BC28;
  objc_copyWeak(&v10, v2);
  -[PKTextInputElement focusElementIfNeededWithReferencePoint:alwaysSetSelectionFromReferencePoint:completion:]((uint64_t)v8, 1, v9, *(double *)(a1 + 40), *(double *)(a1 + 48));

  objc_destroyWeak(&v10);
}

void __47__PKTextInputHoverController__handleHoverHold___block_invoke_3(uint64_t a1)
{
  void *v1;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[PKTextInputHoverController _cursorController](WeakRetained);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flashCursor");

}

void __47__PKTextInputHoverController__handleHoverHold___block_invoke_4(uint64_t a1)
{
  id *v1;
  _QWORD *WeakRetained;
  void *v3;
  unsigned __int8 *v4;
  int v5;
  void *v6;
  id *v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
    WeakRetained = (_QWORD *)WeakRetained[3];
  objc_msgSend(WeakRetained, "hideLabel");

  v4 = (unsigned __int8 *)objc_loadWeakRetained(v1);
  if (v4)
  {
    v5 = v4[9];

    if (v5)
    {
      v7 = (id *)objc_loadWeakRetained(v1);
      -[PKTextInputHoverController _cursorController](v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setForceStrong:", 1);

    }
  }
}

uint64_t __69__PKTextInputHoverController__updateFlashElementsForHoverInputPoint___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

void __69__PKTextInputHoverController__updateFlashElementsForHoverInputPoint___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v2, "CGColor");
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBorderColor:", v3);

  v5 = (void *)MEMORY[0x1E0DC3F10];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__PKTextInputHoverController__updateFlashElementsForHoverInputPoint___block_invoke_3;
  v7[3] = &unk_1E7778020;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v5, "animateWithDuration:animations:", v7, 0.2);
  objc_msgSend(*(id *)(a1 + 32), "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "makeObjectsPerformSelector:", sel_removeFromSuperview);

}

void __69__PKTextInputHoverController__updateFlashElementsForHoverInputPoint___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v2);

}

void __63__PKTextInputHoverController__checklineBreakGestureIfNecessary__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[12])
  {
    v3 = WeakRetained;
    -[PKTextInputHoverController hideIBeamLayer]((uint64_t)WeakRetained);
    -[PKTextInputHoverController _cursorController](v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setForceVisible:", 0);

    WeakRetained = v3;
    *((_BYTE *)v3 + 11) = 0;
    v3[9] = 0;
  }

}

void __63__PKTextInputHoverController__checklineBreakGestureIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;
  __int128 v16;

  objc_msgSend(*(id *)(a1 + 32), "foundElement");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2 && -[PKTextInputElement isFocused](v2))
  {
    -[PKTextInputElement coordinateSpace]((uint64_t)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputHoverController view](*(id **)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "convertPoint:fromCoordinateSpace:", v5, *(double *)(a1 + 56), *(double *)(a1 + 64));
    v7 = v6;
    v9 = v8;

    -[PKTextInputHoverController _cursorController](*(id **)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v10, "isCursorWeak");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__PKTextInputHoverController__checklineBreakGestureIfNecessary__block_invoke_3;
    v12[3] = &unk_1E777BCA0;
    v12[4] = *(_QWORD *)(a1 + 40);
    v13 = v3;
    v15 = *(_QWORD *)(a1 + 72);
    v16 = *(_OWORD *)(a1 + 56);
    v14 = *(id *)(a1 + 48);
    -[PKTextInputElement evaluateLineBreakForTapAtLocation:weakCursor:allowTrailingWhitespace:completion:]((uint64_t)v13, (char)v5, 1, v12, v7, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      *(_BYTE *)(v11 + 10) = 0;
  }

}

void __63__PKTextInputHoverController__checklineBreakGestureIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  id *v23;
  id *v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  BOOL v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  uint64_t NonWhitespace;
  void *v47;
  uint64_t v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  double v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  void *v67;
  CGColor *v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  CGFloat v76;
  double v77;
  double v78;
  uint64_t v79;
  void *v80;
  double v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  double v88;
  CGFloat v89;
  double Height;
  double MinY;
  void *v92;
  int v93;
  uint64_t v94;
  void *v95;
  void *v96;
  double v97;
  _BOOL4 IsEmpty;
  BOOL v99;
  double v100;
  CGColor *v101;
  id v102;
  CGColor *v103;
  id v104;
  void *v105;
  uint64_t v106;
  void *v107;
  CGFloat width;
  CGFloat v109;
  CGFloat v110;
  CGFloat v111;
  CGFloat v112;
  double v113;
  id v114;
  uint64_t v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    *(_BYTE *)(v4 + 10) = 0;
  v114 = v3;
  if (v3 && -[PKTextInputElementContent contentLength]((uint64_t)v3) >= 1)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v5
      && (objc_storeStrong((id *)(v5 + 96), *(id *)(a1 + 40)), (v6 = *(_QWORD *)(a1 + 32)) != 0)
      && (*(_BYTE *)(v6 + 11) = 1, (v7 = *(_QWORD *)(a1 + 32)) != 0))
    {
      *(_QWORD *)(v7 + 88) = *(_QWORD *)(a1 + 56);
      v8 = *(id **)(a1 + 32);
    }
    else
    {
      v8 = 0;
    }
    -[PKTextInputHoverController _cursorController](v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isCursorWeak");

    if (v10)
    {
      -[PKTextInputHoverController _cursorController](*(id **)(a1 + 32));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setForceVisible:", 1);

    }
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      *(_QWORD *)(v12 + 80) = 1;
    +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "scribbleLineBreakMultiLineEnabled") & 1) != 0)
    {
      v14 = *(_QWORD *)(a1 + 32);
      if (v14)
        v15 = *(double *)(v14 + 72);
      else
        v15 = 0.0;
      v16 = *(double *)(a1 + 56) - v15;
      +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scribbleLineBreakMultiLineDelay");
      v19 = v18;

      if (v16 > v19)
      {
        v20 = *(_QWORD *)(a1 + 32);
        v21 = *(double *)(a1 + 64);
        v22 = *(double *)(a1 + 72);
        v23 = (id *)v114;
        v24 = v23;
        if (!v20)
        {
LABEL_63:

          goto LABEL_64;
        }
        v25 = v23[1];
        -[PKTextInputHoverController view]((id *)v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTextInputElement coordinateSpace]((uint64_t)v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *MEMORY[0x1E0C9D820];
        v29 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        v30 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v26, v27, v21, v22, *MEMORY[0x1E0C9D820], v29);
        v32 = v31;

        v33 = -[PKTextInputElement frame]((uint64_t)v25);
        v37 = v33;
        v38 = v34;
        if (v30 >= v33)
        {
          v39 = v33 + v35;
          v40 = v30 <= v37 + v35;
          v37 = v30;
          if (!v40)
            v37 = v39;
        }
        if (v32 >= v34)
        {
          v38 = v32;
          if (v32 > v34 + v36)
            v38 = v34 + v36;
        }
        -[PKTextInputElement coordinateSpace]((uint64_t)v25);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTextInputHoverController view]((id *)v20);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v41, v42, v37, v38, v28, v29);
        v45 = v44;

        NonWhitespace = -[PKTextInputElementContent indexOfLastNonWhitespaceCharacter]((uint64_t)v24);
        -[PKTextInputHoverController view]((id *)v20);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = -[PKTextInputElementContent characterIndexClosestToPoint:inCoordinateSpace:forInsertingText:adjustForLastCharacter:](v24, v47, 1, 0, v43, v45);

        if (NonWhitespace != 0x7FFFFFFFFFFFFFFFLL
          && v48 != 0x7FFFFFFFFFFFFFFFLL
          && v48 < -[PKTextInputElementContent contentLength]((uint64_t)v24)
          && v48 > NonWhitespace)
        {
          -[PKTextInputHoverController view]((id *)v20);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = -[PKTextInputElementContent caretRectForCharacterIndex:inCoordinateSpace:]((uint64_t)v24, v48, v49);
          v52 = v51;
          v54 = v53;
          v56 = v55;

          *(_QWORD *)(v20 + 80) = 0;
LABEL_52:
          -[PKTextInputHoverController _ibeamLayerCreateIfNecessary]((id *)v20);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "colorWithAlphaComponent:", 0.5);
          v96 = (void *)objc_claimAutoreleasedReturnValue();

          v124.origin.x = *(CGFloat *)(v20 + 160);
          v97 = *(double *)(v20 + 168);
          v124.size.width = *(CGFloat *)(v20 + 176);
          v124.size.height = *(CGFloat *)(v20 + 184);
          v124.origin.y = v97;
          IsEmpty = CGRectIsEmpty(v124);
          v99 = IsEmpty;
          if (IsEmpty)
            v100 = v52;
          else
            v100 = (v52 + v97 * 3.0) * 0.25;
          objc_msgSend(MEMORY[0x1E0CD28B0], "begin", *(_QWORD *)&width, *(_QWORD *)&v109, *(_QWORD *)&v110, *(_QWORD *)&v111);
          objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
          objc_msgSend(v71, "setFrame:", v50, v100, v54, v56);
          if (v99)
          {
            objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
            v101 = (CGColor *)objc_msgSend(v71, "backgroundColor");
            v102 = objc_retainAutorelease(v96);
            if (!CGColorEqualToColor(v101, (CGColorRef)objc_msgSend(v102, "CGColor")))
              objc_msgSend(v71, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v102), "CGColor"));
          }
          else
          {
            v103 = (CGColor *)objc_msgSend(v71, "backgroundColor");
            v104 = objc_retainAutorelease(v96);
            if (!CGColorEqualToColor(v103, (CGColorRef)objc_msgSend(v104, "CGColor")))
              objc_msgSend(v71, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v104), "CGColor"));
            objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
          }
          *(double *)(v20 + 160) = v50;
          *(double *)(v20 + 168) = v100;
          *(double *)(v20 + 176) = v54;
          *(double *)(v20 + 184) = v56;
          *(CFTimeInterval *)(v20 + 136) = CACurrentMediaTime();
          -[PKTextInputHoverController _cursorController]((id *)v20);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = objc_msgSend(v105, "isCursorWeak");
          -[PKTextInputHoverController _cursorController]((id *)v20);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "setForceVisible:", v106);

LABEL_62:
          goto LABEL_63;
        }
        if (-[PKTextInputElementContent contentLength]((uint64_t)v24) < 1)
          v57 = -[PKTextInputElementContent selectedRange]((uint64_t)v24);
        else
          v57 = -[PKTextInputElementContent contentLength]((uint64_t)v24);
        v58 = v57;
        -[PKTextInputHoverController view]((id *)v20);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = -[PKTextInputElementContent caretRectForCharacterIndex:inCoordinateSpace:]((uint64_t)v24, v58, v59);
        v62 = v61;
        v64 = v63;
        v66 = v65;

        v116.origin.x = v60;
        v116.origin.y = v62;
        v116.size.width = v64;
        v116.size.height = v66;
        if (CGRectIsNull(v116))
        {
          CGRectIsNull(*MEMORY[0x1E0C9D628]);
        }
        else
        {
          v115 = 0;
          -[PKTextInputHoverController view]((id *)v20);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = -[PKTextInputElementContent caretRectForStartOfLineFromCharacterIndex:coordinateSpace:outCharacterIndex:]((uint64_t)v24, v58, v72, &v115);
          v52 = v74;
          v76 = v75;
          v56 = v77;

          v50 = v73;
          v117.origin.x = v73;
          v117.origin.y = v52;
          v54 = v76;
          v117.size.width = v76;
          v117.size.height = v56;
          v78 = fmax(CGRectGetHeight(v117), 1.0);
          v79 = v115 - 1;
          if (v115 >= 1)
          {
            -[PKTextInputHoverController view]((id *)v20);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = -[PKTextInputElementContent caretRectForStartOfLineFromCharacterIndex:coordinateSpace:outCharacterIndex:]((uint64_t)v24, v79, v80, &v115);
            v83 = v82;
            v112 = v54;
            v113 = v45;
            v84 = v56;
            v85 = v50;
            v87 = v86;
            v89 = v88;

            v110 = v83;
            v111 = v81;
            v118.origin.x = v81;
            v118.origin.y = v83;
            v118.size.width = v87;
            v56 = v84;
            v45 = v113;
            width = v118.size.width;
            v109 = v89;
            v118.size.height = v89;
            Height = CGRectGetHeight(v118);
            v50 = v85;
            v119.origin.x = v85;
            v119.origin.y = v52;
            v54 = v112;
            v119.size.width = v112;
            v119.size.height = v56;
            if (vabdd_f64(Height, CGRectGetHeight(v119)) < 0.00999999978)
            {
              v120.origin.x = v50;
              v120.origin.y = v52;
              v120.size.width = v112;
              v120.size.height = v56;
              MinY = CGRectGetMinY(v120);
              v121.origin.y = v83;
              v121.origin.x = v111;
              v121.size.width = width;
              v121.size.height = v109;
              v78 = MinY - CGRectGetMinY(v121);
            }
          }
          v122.origin.x = v50;
          v122.origin.y = v52;
          v122.size.width = v54;
          v122.size.height = v56;
          if (!CGRectIsNull(v122) && v78 > 0.0)
          {
            +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = objc_msgSend(v92, "scribbleLineBreakMultiLineMaxLines");

            if (v93 < 1)
            {
              v94 = 0;
            }
            else
            {
              v94 = 0;
              while (1)
              {
                v123.origin.x = v50;
                v123.origin.y = v52;
                v123.size.width = v54;
                v123.size.height = v56;
                if (v45 <= CGRectGetMaxY(v123))
                  break;
                v52 = v78 + v52;
                if (v93 == ++v94)
                {
                  v94 = v93;
                  break;
                }
              }
            }
            *(_QWORD *)(v20 + 80) = v94;
            goto LABEL_52;
          }
        }
        v67 = *(void **)(v20 + 128);
        if (v67)
        {
          v68 = (CGColor *)objc_msgSend(v67, "backgroundColor");
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          LOBYTE(v68) = CGColorEqualToColor(v68, (CGColorRef)objc_msgSend(v69, "CGColor"));

          if ((v68 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
            v70 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(*(id *)(v20 + 128), "setBackgroundColor:", objc_msgSend(v70, "CGColor"));

          }
        }
        *(_QWORD *)(v20 + 80) = 0;
        -[PKTextInputHoverController _cursorController]((id *)v20);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setForceVisible:", 0);
        goto LABEL_62;
      }
    }
    else
    {

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
LABEL_64:

}

- (uint64_t)performLineBreakAfterTapIfPossibleForElement:(double)a3 location:(CGFloat)a4
{
  id v7;
  id *v8;
  int v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  char v16;
  _QWORD v18[5];

  v7 = a2;
  if (a1)
  {
    v8 = (id *)*(id *)(a1 + 96);
    v9 = *(unsigned __int8 *)(a1 + 11);
    v10 = *(_QWORD *)(a1 + 80);
    v11 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = 0;

    *(_BYTE *)(a1 + 11) = 0;
    *(_QWORD *)(a1 + 72) = 0;
    *(_QWORD *)(a1 + 80) = 0;
    -[PKTextInputHoverController hideIBeamLayer](a1);
    v12 = -[PKTextInputElement isEquivalentToElement:](v8, v7);
    if (v9)
      v13 = v12;
    else
      v13 = 0;
    if (v10 > 0)
      v14 = v13;
    else
      v14 = 0;
    if ((_DWORD)v14 == 1)
    {
      -[PKTextInputHoverController _cursorController]((id *)a1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isCursorWeak");
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __84__PKTextInputHoverController_performLineBreakAfterTapIfPossibleForElement_location___block_invoke;
      v18[3] = &__block_descriptor_40_e35_v16__0__PKTextInputElementContent_8l;
      v18[4] = v10;
      -[PKTextInputElement evaluateLineBreakForTapAtLocation:weakCursor:allowTrailingWhitespace:completion:]((uint64_t)v7, v16, 0, v18, a3, a4);

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __84__PKTextInputHoverController_performLineBreakAfterTapIfPossibleForElement_location___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = -[PKTextInputElementContent contentLength]((uint64_t)v3);
    v6 = (void *)objc_opt_new();
    if (*(uint64_t *)(a1 + 32) >= 1)
    {
      v7 = 0;
      do
      {
        objc_msgSend(v6, "appendString:", CFSTR("\n"));
        ++v7;
      }
      while (v7 < *(_QWORD *)(a1 + 32));
    }
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputElementContent insertTextsToCommit:withAlternatives:activePreviewText:replacingRange:completion:](v4, v8, &unk_1E77ECD90, 0, v5, 0, &__block_literal_global_61);

  }
}

- (id)_ibeamLayerCreateIfNecessary
{
  id *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = a1 + 16;
  v3 = a1[16];
  if (!v3)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    objc_msgSend(v3, "setAllowsHitTesting:", 0);
    objc_msgSend(v3, "setCornerRadius:", 1.0);
    -[PKTextInputHoverController view](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSublayer:", v3);

    objc_storeStrong(v2, v3);
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__ibeamLayer, 0);
  objc_storeStrong((id *)&self->__ibeamElementContent, 0);
  objc_storeStrong((id *)&self->__ibeamElement, 0);
  objc_storeStrong((id *)&self->__hidePlaceholderElement, 0);
  objc_storeStrong((id *)&self->__lineBreakElement, 0);
  objc_storeStrong((id *)&self->__currentHoverFlashElementView, 0);
  objc_storeStrong((id *)&self->__hoverFlashElements, 0);
  objc_storeStrong((id *)&self->__hoverFlashElementsView, 0);
  objc_storeStrong((id *)&self->__hoverElementToFocus, 0);
  objc_storeStrong((id *)&self->__hoverDebugLayer, 0);
  objc_storeStrong((id *)&self->__hoverController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
