@implementation PKSelectionGlowRenderer

- (id)setKnobsVisible:(id *)result
{
  uint64_t v2;
  uint64_t v3;
  CGColor *v4;
  CGColor *v5;

  if (result)
  {
    v2 = (uint64_t)result;
    v3 = a2 ^ 1u;
    objc_msgSend(result[3], "setHidden:", v3);
    objc_msgSend(*(id *)(v2 + 32), "setHidden:", v3);
    v4 = (CGColor *)-[PKSelectionGlowRenderer _highlightColor](v2);
    -[PKSelectionModificationKnob setKnobColor:](*(id **)(v2 + 24), v4);
    v5 = (CGColor *)-[PKSelectionGlowRenderer _highlightColor](v2);
    return -[PKSelectionModificationKnob setKnobColor:](*(id **)(v2 + 32), v5);
  }
  return result;
}

- (id)initForLiveSelectionWithRenderingDelegate:(id)a3
{
  id v4;
  PKSelectionGlowRenderer *v5;
  PKSelectionGlowRenderer *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *tiles;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKSelectionGlowRenderer;
  v5 = -[PKSelectionGlowRenderer init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_renderingDelegate, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tiles = v6->_tiles;
    v6->_tiles = v7;

    -[PKSelectionGlowRenderer _setupHighlightIfNecessary]((uint64_t)v6);
  }

  return v6;
}

- (id)adornmentLayer
{
  return self->_highlightLayer;
}

- (void)_setupHighlightIfNecessary
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  PKSelectionModificationKnob *v10;
  void *v11;
  PKSelectionModificationKnob *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;

  if (a1 && !*(_QWORD *)(a1 + 8))
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v2;

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v4;

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(*(id *)(a1 + 80), "drawing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "scaleForDrawing:", v7);
    v9 = v8;

    objc_msgSend(*(id *)(a1 + 8), "setContentsScale:", v9);
    objc_msgSend(*(id *)(a1 + 8), "addSublayer:", *(_QWORD *)(a1 + 16));
    if (!*(_QWORD *)(a1 + 24))
    {
      v10 = -[PKSelectionGlowRenderer _newKnobWithLocation:](a1, 0);
      v11 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v10;

      objc_msgSend(*(id *)(a1 + 8), "addSublayer:", *(_QWORD *)(a1 + 24));
    }
    if (!*(_QWORD *)(a1 + 32))
    {
      v12 = -[PKSelectionGlowRenderer _newKnobWithLocation:](a1, 1);
      v13 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v12;

      objc_msgSend(*(id *)(a1 + 8), "addSublayer:", *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(*(id *)(a1 + 80), "strokes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionGlowRenderer setKnobsVisible:]((id *)a1, objc_msgSend(v14, "count") != 0);

    v15 = *(void **)(a1 + 80);
    if (v15)
    {
      objc_msgSend(v15, "bounds");
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", 0.0, 0.0, v9 * v16, v9 * v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v18;
      v20 = v18;

      objc_msgSend(*(id *)(a1 + 80), "strokes");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 80), "drawing");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKSelectionGlowRenderer _createPathAroundStrokes:inDrawing:isLive:liveScrollOffset:](a1, v22, v21, 0);
    }
  }
}

- (PKSelectionModificationKnob)_newKnobWithLocation:(uint64_t)a1
{
  PKSelectionModificationKnob *v4;
  CGColor *v5;
  id WeakRetained;
  char v7;
  BOOL v8;
  PKSelectionModificationKnob *v9;
  double v10;
  uint64_t v11;
  CALayer *knobLayer;
  uint64_t v13;
  CALayer *knobTailLayer;
  void *v15;
  double v16;
  void *v17;
  objc_super v19;

  v4 = [PKSelectionModificationKnob alloc];
  v5 = (CGColor *)-[PKSelectionGlowRenderer _highlightColor](a1);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v7 = objc_msgSend(WeakRetained, "isRTL");
  if (v4)
  {
    v8 = v7;
    v19.receiver = v4;
    v19.super_class = (Class)PKSelectionModificationKnob;
    v9 = (PKSelectionModificationKnob *)objc_msgSendSuper2(&v19, sel_init);
    v4 = v9;
    if (v9)
    {
      LODWORD(v10) = 1.0;
      -[PKSelectionModificationKnob setOpacity:](v9, "setOpacity:", v10);
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v11 = objc_claimAutoreleasedReturnValue();
      knobLayer = v4->_knobLayer;
      v4->_knobLayer = (CALayer *)v11;

      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v13 = objc_claimAutoreleasedReturnValue();
      knobTailLayer = v4->_knobTailLayer;
      v4->_knobTailLayer = (CALayer *)v13;

      v4->_knobColor = CGColorRetain(v5);
      -[PKSelectionModificationKnob _updateKnobAppearance]((id *)&v4->super.super.isa);
      v4->_isRTL = v8;
      v4->_knobLocation = a2;
      -[PKSelectionModificationKnob addSublayer:](v4, "addSublayer:", v4->_knobLayer);
      -[PKSelectionModificationKnob addSublayer:](v4, "addSublayer:", v4->_knobTailLayer);
      -[PKSelectionModificationKnob setIsAccessibilityElement:](v4, "setIsAccessibilityElement:", 1);
    }
  }

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "userInterfaceIdiom") == 1)
    v16 = 14.0;
  else
    v16 = 13.0;

  -[PKSelectionModificationKnob setFrame:](v4, "setFrame:", 0.0, 0.0, v16, v16 + v16);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  -[PKSelectionModificationKnob setContentsScale:](v4, "setContentsScale:");

  return v4;
}

- (uint64_t)_highlightColor
{
  id *v1;
  id WeakRetained;
  uint64_t v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;

  if (!a1)
    return 0;
  v1 = (id *)(a1 + 88);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v3 = objc_msgSend(WeakRetained, "selectionColor");

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("internalSettings.drawing.enableLassolessSelectionDebugColors"));

  if (!v5)
    return v3;
  v6 = objc_loadWeakRetained(v1);
  v7 = objc_msgSend(v6, "currentIntersectionAlgorithm");

  switch(v7)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v3;
  }
  v9 = objc_retainAutorelease(v8);
  v10 = objc_msgSend(v9, "CGColor");

  return v10;
}

- (PKSelectionGlowRenderer)initWithStrokeSelection:(id)a3 renderingDelegate:(id)a4
{
  id v7;
  id v8;
  PKSelectionGlowRenderer *v9;
  PKSelectionGlowRenderer *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *tiles;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKSelectionGlowRenderer;
  v9 = -[PKSelectionGlowRenderer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_strokeSelection, a3);
    objc_storeWeak((id *)&v10->_renderingDelegate, v8);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tiles = v10->_tiles;
    v10->_tiles = v11;

  }
  return v10;
}

+ (id)sharedStrokePathCache
{
  objc_opt_self();
  if (_MergedGlobals_110 != -1)
    dispatch_once(&_MergedGlobals_110, &__block_literal_global_2);
  return (id)qword_1ECEE6080;
}

void __48__PKSelectionGlowRenderer_sharedStrokePathCache__block_invoke()
{
  PKLRUCache *v0;
  void *v1;

  v0 = objc_alloc_init(PKLRUCache);
  v1 = (void *)qword_1ECEE6080;
  qword_1ECEE6080 = (uint64_t)v0;

  if (qword_1ECEE6080)
    *(_QWORD *)(qword_1ECEE6080 + 64) = 0x4000000;
}

+ (void)invalidateSharedStrokePathCache
{
  id v0;

  objc_opt_self();
  +[PKSelectionGlowRenderer sharedStrokePathCache]();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  -[PKLRUCache removeAllObjects]((uint64_t)v0);

}

- (id)lassoPath
{
  return self->_lassoPath;
}

- (id)_affordanceForLocationInSelectionView:(double)a3 inputType:(double)a4
{
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  void *i;
  void *v13;
  CGFloat x;
  CGFloat y;
  double width;
  CGFloat height;
  double MidX;
  double MidY;
  double v20;
  double v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[3];
  CGRect v29;
  CGRect v30;

  v28[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v28[0] = *(_QWORD *)(a1 + 24);
    v28[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v24;
      if (a2)
        v11 = 20.0;
      else
        v11 = 40.0;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          if (v13)
          {
            v29.origin.x = -[PKSelectionModificationKnob _rectForKnob](*(_QWORD *)(*((_QWORD *)&v23 + 1)
                                                                                 + 8 * (_QWORD)i));
            x = v29.origin.x;
            y = v29.origin.y;
            width = v29.size.width;
            height = v29.size.height;
            MidX = CGRectGetMidX(v29);
            v30.origin.x = x;
            v30.origin.y = y;
            v30.size.width = width;
            v30.size.height = height;
            MidY = CGRectGetMidY(v30);
            objc_msgSend(v13, "frame", (_QWORD)v23);
            if (sqrt((a4 - (MidY + v21)) * (a4 - (MidY + v21)) + (a3 - (MidX + v20)) * (a3 - (MidX + v20))) < v11 + width * 0.5
              && !objc_msgSend(v13, "isHidden"))
            {
              v9 = v13;
              goto LABEL_16;
            }
          }
        }
        v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_16:

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)_didBeginDraggingSelection
{
  double v2;

  LODWORD(v2) = 0;
  -[CALayer setOpacity:](self->_highlightLayer, "setOpacity:", v2);
}

- (void)_didEndDraggingSelection
{
  double v2;

  LODWORD(v2) = 1.0;
  -[CALayer setOpacity:](self->_highlightLayer, "setOpacity:", v2);
}

- (CGPoint)editMenuLocation
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)_renderLiveSelectionPath:(CGPath *)a3 forStrokes:(id)a4 inDrawing:(id)a5 liveScrollOffset:(CGPoint)a6
{
  id v8;
  int v9;
  id v10;

  v10 = a4;
  v8 = a5;
  v9 = -[PKSelectionModificationKnob isHidden](self->_leftKnob, "isHidden");
  if (v10 && v8)
  {
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      -[PKSelectionGlowRenderer _setupHighlightIfNecessary]((uint64_t)self);
      -[PKSelectionGlowRenderer _createPathAroundStrokes:inDrawing:isLive:liveScrollOffset:]((uint64_t)self, v10, v8, 1);
      -[PKSelectionGlowRenderer setKnobsVisible:]((id *)&self->super.isa, 1);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
    else
    {
      -[PKSelectionGlowRenderer _setupHighlightIfNecessary]((uint64_t)self);
      -[PKSelectionGlowRenderer _createPathAroundStrokes:inDrawing:isLive:liveScrollOffset:]((uint64_t)self, v10, v8, 1);
      -[PKSelectionGlowRenderer setKnobsVisible:]((id *)&self->super.isa, 1);
    }
  }
  else
  {
    -[PKSelectionGlowRenderer setKnobsVisible:]((id *)&self->super.isa, 0);
    -[CALayer setSublayers:](self->_strokePathsTilesLayer, "setSublayers:", 0);
    -[NSMutableDictionary removeAllObjects](self->_tiles, "removeAllObjects");
  }

}

- (void)_createPathAroundStrokes:(uint64_t)a1 inDrawing:(void *)a2 isLive:(void *)a3 liveScrollOffset:(int)a4
{
  id v7;
  id v8;
  id v9;
  __int128 v10;
  id WeakRetained;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  double v19;
  CGFloat v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id *v26;
  id *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t k;
  uint64_t v68;
  PKSelectionTileProperties *v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t m;
  uint64_t v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t n;
  void *v84;
  PKSelectionTile *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t ii;
  void *v92;
  char *v93;
  void *v94;
  void *v95;
  const CGPath *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  double v101;
  CGFloat v102;
  double v103;
  const CGPath *v104;
  void *v105;
  void *v106;
  double v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  id v114;
  id v115;
  void *v116;
  id v117;
  void *v118;
  double v119;
  CGFloat v120;
  double v121;
  CGFloat v122;
  double v123;
  CGFloat v124;
  double v125;
  CGFloat v126;
  double v127;
  double v128;
  double v129;
  CGFloat v130;
  double v131;
  CGFloat v132;
  double MaxY;
  double MinX;
  id v135;
  uint64_t v136;
  double v137;
  CGFloat v138;
  double v139;
  CGFloat v140;
  double MinY;
  double MaxX;
  CGFloat v143;
  CGFloat v144;
  double v145;
  double v146;
  double v147;
  double v148;
  id v149;
  int v150;
  double v151;
  double v152;
  double v153;
  id v154;
  id *location;
  void *v156;
  int v157;
  double v158;
  id *v159;
  id v160;
  id v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  double v166;
  id obj;
  uint64_t v168;
  CGFloat v169;
  uint64_t v170;
  CGFloat v171;
  uint64_t v172;
  double tx;
  double (**v174)(void *, _QWORD);
  id v175;
  double c;
  CGFloat v177;
  uint64_t v178;
  double ty;
  CGFloat v180;
  uint64_t v181;
  uint64_t v182;
  double d;
  CGFloat v184;
  uint64_t v185;
  double a;
  CGFloat r2;
  double r2a;
  void *r2b;
  double r2c;
  CGAffineTransform v191;
  CGAffineTransform v192;
  CGAffineTransform v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  _QWORD aBlock[5];
  CGAffineTransform v219;
  CGAffineTransform v220;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v223;
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  _BYTE v229[128];
  uint64_t v230;
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
  CGRect v244;
  CGRect v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;
  CGRect v250;
  CGRect v251;

  v230 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    if (v7 && objc_msgSend(v7, "count"))
    {
      v160 = v8;
      v9 = v8;
      v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v220.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v220.c = v10;
      *(_OWORD *)&v220.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      if (a4)
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
        v12 = WeakRetained;
        if (WeakRetained)
          objc_msgSend(WeakRetained, "transformFromStrokeSpaceToViewInDrawing:", v9);
        else
          memset(&v223, 0, sizeof(v223));
        v220 = v223;

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 80), "bounds");
        v14 = v13;
        v16 = v15;
        v17 = objc_loadWeakRetained((id *)(a1 + 88));
        objc_msgSend(*(id *)(a1 + 80), "drawing");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "scaleForDrawing:", v18);
        v20 = v19;

        memset(&v223, 0, sizeof(v223));
        CGAffineTransformMakeTranslation(&v223, -v14, -v16);
        CGAffineTransformMakeScale(&t2, v20, v20);
        t1 = v223;
        CGAffineTransformConcat(&v220, &t1, &t2);
      }

      aBlock[1] = 3221225472;
      v219 = v220;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[2] = __86__PKSelectionGlowRenderer__createPathAroundStrokes_inDrawing_isLive_liveScrollOffset___block_invoke;
      aBlock[3] = &unk_1E7777BA8;
      aBlock[4] = a1;
      v174 = (double (**)(void *, _QWORD))_Block_copy(aBlock);
      v21 = objc_loadWeakRetained((id *)(a1 + 88));
      objc_msgSend(v21, "attachmentBoundsForDrawing:", v9);
      v184 = v23;
      r2 = v22;
      v177 = v25;
      v180 = v24;

      location = (id *)(a1 + 88);
      v26 = (id *)objc_loadWeakRetained((id *)(a1 + 88));
      v27 = v26;
      if (v26)
        v28 = objc_loadWeakRetained(v26 + 14);
      else
        v28 = 0;
      objc_msgSend(v9, "uuid");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "_attachmentForUUID:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4 && objc_msgSend(v30, "isExternalAttachment"))
      {
        objc_msgSend(v30, "viewRep");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "frame");
        v184 = v33;
        r2 = v32;
        v177 = v35;
        v180 = v34;

      }
      v162 = v30;
      v37 = *MEMORY[0x1E0C9D628];
      v36 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v39 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v38 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      v216 = 0u;
      v217 = 0u;
      v214 = 0u;
      v215 = 0u;
      v40 = v7;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v214, v229, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v215;
        do
        {
          for (i = 0; i != v42; ++i)
          {
            if (*(_QWORD *)v215 != v43)
              objc_enumerationMutation(v40);
            v231.origin.x = v174[2](v174, *(_QWORD *)(*((_QWORD *)&v214 + 1) + 8 * i));
            x = v231.origin.x;
            y = v231.origin.y;
            width = v231.size.width;
            height = v231.size.height;
            v247.origin.y = v184;
            v247.origin.x = r2;
            v247.size.height = v177;
            v247.size.width = v180;
            if (CGRectIntersectsRect(v231, v247))
            {
              v232.origin.x = x;
              v232.origin.y = y;
              v232.size.width = width;
              v232.size.height = height;
              v248.origin.x = v37;
              v248.origin.y = v36;
              v248.size.width = v39;
              v248.size.height = v38;
              v233 = CGRectUnion(v232, v248);
              v37 = v233.origin.x;
              v36 = v233.origin.y;
              v39 = v233.size.width;
              v38 = v233.size.height;
            }
          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v214, v229, 16);
        }
        while (v42);
      }
      v157 = a4;
      v154 = v9;
      v159 = v27;
      v161 = v7;
      v165 = v40;

      v234.origin.y = v184;
      v234.origin.x = r2;
      v234.size.height = v177;
      v234.size.width = v180;
      v249.origin.x = v37;
      v249.origin.y = v36;
      v249.size.width = v39;
      v249.size.height = v38;
      v235 = CGRectUnion(v234, v249);
      v49 = v235.origin.x;
      v50 = v235.origin.y;
      r2a = v235.size.width;
      v51 = v235.size.height;
      v52 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(*(id *)(a1 + 64), "allKeys");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setWithArray:", v53);
      v163 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v54) = 1050253722;
      objc_msgSend(*(id *)(a1 + 16), "setOpacity:", v54);
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      v181 = vcvtpd_s64_f64(v51 * 0.00390625);
      v185 = a1;
      if (v181 >= 1)
      {
        v55 = 0;
        v56 = vcvtpd_s64_f64(r2a * 0.00390625);
        do
        {
          if (v56 >= 1)
          {
            for (j = 0; j != v56; ++j)
            {
              v236.size.width = 256.0;
              v236.origin.x = v49 + (double)j * 256.0;
              v236.origin.y = v50 + (double)v55 * 256.0;
              v236.size.height = 256.0;
              v250.origin.x = v49;
              v250.origin.y = v50;
              v250.size.width = r2a;
              v250.size.height = v51;
              v237 = CGRectIntersection(v236, v250);
              v58 = v237.origin.x;
              v59 = v237.origin.y;
              v60 = v237.size.width;
              v61 = v237.size.height;
              if (!CGRectIsNull(v237))
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                v210 = 0u;
                v211 = 0u;
                v212 = 0u;
                v213 = 0u;
                v63 = v40;
                v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v210, v228, 16);
                if (v64)
                {
                  v65 = v64;
                  v66 = *(_QWORD *)v211;
                  do
                  {
                    for (k = 0; k != v65; ++k)
                    {
                      if (*(_QWORD *)v211 != v66)
                        objc_enumerationMutation(v63);
                      v68 = *(_QWORD *)(*((_QWORD *)&v210 + 1) + 8 * k);
                      v238.origin.x = v174[2](v174, v68);
                      v251.origin.x = v58;
                      v251.origin.y = v59;
                      v251.size.width = v60;
                      v251.size.height = v61;
                      if (CGRectIntersectsRect(v238, v251))
                        objc_msgSend(v62, "addObject:", v68);
                    }
                    v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v210, v228, 16);
                  }
                  while (v65);
                }

                if (objc_msgSend(v62, "count"))
                {
                  v69 = -[PKSelectionTileProperties initWithFrame:strokes:]([PKSelectionTileProperties alloc], "initWithFrame:strokes:", v62, v58, v59, v60, v61);
                  objc_msgSend(v164, "addObject:", v69);

                }
                a1 = v185;
              }
            }
          }
          ++v55;
        }
        while (v55 != v181);
      }
      v70 = (void *)objc_msgSend(v164, "mutableCopy");
      objc_msgSend(v70, "minusSet:", v163);
      v71 = (void *)objc_msgSend(v163, "mutableCopy");
      objc_msgSend(v71, "minusSet:", v164);
      v208 = 0u;
      v209 = 0u;
      v206 = 0u;
      v207 = 0u;
      v72 = v71;
      v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v206, v227, 16);
      if (v73)
      {
        v74 = v73;
        v75 = *(_QWORD *)v207;
        do
        {
          for (m = 0; m != v74; ++m)
          {
            if (*(_QWORD *)v207 != v75)
              objc_enumerationMutation(v72);
            v77 = *(_QWORD *)(*((_QWORD *)&v206 + 1) + 8 * m);
            objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v77);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "removeFromSuperlayer");
            objc_msgSend(*(id *)(a1 + 64), "removeObjectForKey:", v77);

          }
          v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v206, v227, 16);
        }
        while (v74);
      }
      v156 = v72;

      v204 = 0u;
      v205 = 0u;
      v202 = 0u;
      v203 = 0u;
      v79 = v70;
      v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v202, v226, 16);
      if (v80)
      {
        v81 = v80;
        v82 = *(_QWORD *)v203;
        do
        {
          for (n = 0; n != v81; ++n)
          {
            if (*(_QWORD *)v203 != v82)
              objc_enumerationMutation(v79);
            v84 = *(void **)(*((_QWORD *)&v202 + 1) + 8 * n);
            v85 = -[PKSelectionTile initWithProperties:]([PKSelectionTile alloc], "initWithProperties:", v84);
            objc_msgSend(v84, "frame");
            -[PKSelectionTile setFrame:](v85, "setFrame:");
            objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v85, v84);
            objc_msgSend(*(id *)(a1 + 16), "addSublayer:", v85);

          }
          v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v202, v226, 16);
        }
        while (v81);
      }

      v200 = 0u;
      v201 = 0u;
      v198 = 0u;
      v199 = 0u;
      obj = v79;
      v170 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v198, v225, 16);
      if (v170)
      {
        v168 = *(_QWORD *)v199;
        v182 = *MEMORY[0x1E0CD3010];
        v178 = *MEMORY[0x1E0CD3030];
        do
        {
          v86 = 0;
          do
          {
            if (*(_QWORD *)v199 != v168)
              objc_enumerationMutation(obj);
            v172 = v86;
            v87 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * v86);
            objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v87);
            r2b = (void *)objc_claimAutoreleasedReturnValue();
            v194 = 0u;
            v195 = 0u;
            v196 = 0u;
            v197 = 0u;
            objc_msgSend(v87, "strokes");
            v175 = (id)objc_claimAutoreleasedReturnValue();
            v88 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v194, v224, 16);
            if (v88)
            {
              v89 = v88;
              v90 = *(_QWORD *)v195;
              do
              {
                for (ii = 0; ii != v89; ++ii)
                {
                  if (*(_QWORD *)v195 != v90)
                    objc_enumerationMutation(v175);
                  v92 = *(void **)(*((_QWORD *)&v194 + 1) + 8 * ii);
                  +[PKSelectionGlowRenderer sharedStrokePathCache]();
                  v93 = (char *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v92, "_strokeUUID");
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PKLRUCache objectForKey:](v93, v94);
                  v95 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v95)
                  {
                    v96 = CGPathRetain((CGPathRef)objc_msgSend(objc_retainAutorelease(v95), "CGPath"));
                  }
                  else
                  {
                    LODWORD(v223.a) = 0;
                    v96 = (const CGPath *)objc_msgSend(v92, "newSelectionPathRepresentationWithPointsCount:", &v223);
                    +[PKSelectionGlowRenderer sharedStrokePathCache]();
                    v97 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithCGPath:", v96);
                    v98 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v92, "_strokeUUID");
                    v99 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PKLRUCache setObject:forKey:cost:]((uint64_t)v97, v98, v99, 16 * SLODWORD(v223.a));

                  }
                  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  memset(&v223, 0, sizeof(v223));
                  objc_msgSend(v87, "frame");
                  v102 = -v101;
                  objc_msgSend(v87, "frame");
                  CGAffineTransformMakeTranslation(&v223, v102, -v103);
                  memset(&t2, 0, sizeof(t2));
                  if (v92)
                    objc_msgSend(v92, "_transform");
                  else
                    memset(&v193, 0, sizeof(v193));
                  t1 = v220;
                  CGAffineTransformConcat(&t2, &v193, &t1);
                  v192 = t2;
                  v191 = v223;
                  CGAffineTransformConcat(&t1, &v192, &v191);
                  t2 = t1;
                  v104 = CGPathCreateMutableCopyByTransformingPath(v96, &t2);
                  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
                  v105 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v105, "scale");
                  objc_msgSend(v100, "setContentsScale:");

                  objc_msgSend(v100, "setPath:", v104);
                  objc_msgSend(v92, "_strokeMask");
                  v106 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v106)
                  {
                    a1 = v185;
                    objc_msgSend(v100, "setFillColor:", -[PKSelectionGlowRenderer _highlightColor](v185));
                    v107 = 10.0;
                  }
                  else
                  {
                    objc_msgSend(v100, "setFillColor:", 0);
                    a1 = v185;
                    v107 = -[PKSelectionGlowRenderer _widthForStroke:](v185, v92) + 10.0;
                  }
                  objc_msgSend(v100, "setLineWidth:", v107);
                  objc_msgSend(v100, "setLineCap:", v182);
                  objc_msgSend(v100, "setLineJoin:", v178);
                  objc_msgSend(v100, "setStrokeColor:", -[PKSelectionGlowRenderer _highlightColor](a1));
                  CGPathRelease(v96);
                  CGPathRelease(v104);
                  objc_msgSend(r2b, "addSublayer:", v100);

                }
                v89 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v194, v224, 16);
              }
              while (v89);
            }

            v86 = v172 + 1;
          }
          while (v172 + 1 != v170);
          v170 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v198, v225, 16);
        }
        while (v170);
      }

      v7 = v161;
      v108 = v162;
      if (v157 && v162 && objc_msgSend(v162, "isExternalAttachment"))
      {
        objc_msgSend((id)a1, "adornmentLayer");
        v109 = objc_claimAutoreleasedReturnValue();
        v110 = (void *)v109;
        if (v159 && v109 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v162, "contentWindowCoordinateSpace");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v162, "contentScaledCoordinateSpace");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          v113 = objc_loadWeakRetained(v159 + 14);
          objc_msgSend(v113, "frame");
          objc_msgSend(v111, "convertRect:toCoordinateSpace:", v112);
          objc_msgSend(v110, "setFrame:");

          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v159, "updateLiveSelectionForStrokesInLayer:inDrawing:", v110, v154);

          v108 = v162;
        }

      }
      if (!*(_BYTE *)(a1 + 48))
      {
        a = v220.a;
        r2c = v220.b;
        d = v220.d;
        tx = v220.tx;
        c = v220.c;
        ty = v220.ty;
        v114 = v165;
        v115 = objc_loadWeakRetained(location);
        objc_msgSend(v115, "_firstStrokesInStrokes:", v114);
        v116 = (void *)objc_claimAutoreleasedReturnValue();

        v117 = objc_loadWeakRetained(location);
        objc_msgSend(v117, "_lastStrokesInStrokes:", v114);
        v118 = (void *)objc_claimAutoreleasedReturnValue();

        +[PKDrawing _boundingBoxForStrokeArray:](PKDrawing, "_boundingBoxForStrokeArray:", v116);
        v120 = v119;
        v122 = v121;
        v124 = v123;
        v126 = v125;
        +[PKDrawing _boundingBoxForStrokeArray:](PKDrawing, "_boundingBoxForStrokeArray:", v118);
        v169 = v127;
        v171 = v128;
        v130 = v129;
        v132 = v131;
        MinX = *MEMORY[0x1E0C9D538];
        MaxY = *(double *)(MEMORY[0x1E0C9D538] + 8);
        v135 = objc_loadWeakRetained(location);
        LOBYTE(v117) = objc_msgSend(v135, "isRTL");

        v136 = objc_msgSend(v116, "count");
        v166 = MinX;
        v158 = MaxY;
        if ((v117 & 1) != 0)
        {
          v137 = MinX;
          v138 = v130;
          v139 = MaxY;
          v140 = v132;
          MinY = v139;
          MaxX = v137;
          if (v136)
          {
            v239.origin.x = v120;
            v239.origin.y = v122;
            v239.size.width = v124;
            v239.size.height = v126;
            MaxX = CGRectGetMaxX(v239);
            v240.origin.x = v120;
            v240.origin.y = v122;
            v240.size.width = v124;
            v240.size.height = v126;
            MinY = CGRectGetMinY(v240);
          }
          if (objc_msgSend(v118, "count"))
          {
            v241.origin.x = v169;
            v241.origin.y = v171;
            v143 = v138;
            v241.size.width = v138;
            v241.size.height = v140;
            MinX = CGRectGetMinX(v241);
            v242.origin.x = v169;
            v242.origin.y = v171;
            v242.size.width = v143;
            v242.size.height = v140;
            MaxY = CGRectGetMaxY(v242);
          }
          else
          {
            MaxY = v158;
            MinX = v166;
          }
        }
        else
        {
          if (v136)
          {
            v243.origin.x = v120;
            v243.origin.y = v122;
            v243.size.width = v124;
            v243.size.height = v126;
            MinX = CGRectGetMinX(v243);
            v244.origin.x = v120;
            v244.origin.y = v122;
            v244.size.width = v124;
            v244.size.height = v126;
            MaxY = CGRectGetMinY(v244);
          }
          if (objc_msgSend(v118, "count"))
          {
            v245.origin.x = v169;
            v245.origin.y = v171;
            v245.size.width = v130;
            v245.size.height = v132;
            v144 = CGRectGetMaxX(v245);
            v246.size.width = v130;
            MaxX = v144;
            v246.origin.x = v169;
            v246.origin.y = v171;
            v246.size.height = v132;
            MinY = CGRectGetMaxY(v246);
          }
          else
          {
            MinY = v158;
            MaxX = v166;
          }
        }
        v145 = tx + c * MaxY + a * MinX;
        v146 = ty + d * MaxY + r2c * MinX;
        v147 = tx + c * MinY + a * MaxX;
        v148 = ty + d * MinY + r2c * MaxX;
        v149 = objc_loadWeakRetained(location);
        v150 = objc_msgSend(v149, "isRTL");

        if (v150)
          v151 = -1.0;
        else
          v151 = 1.0;
        v152 = v146 - v151;
        v153 = v148 + v151;
        objc_msgSend(*(id *)(a1 + 24), "setPosition:", v145 + -1.0, v152);
        objc_msgSend(*(id *)(a1 + 32), "setPosition:", v147 + 1.0, v153);

        v108 = v162;
      }

      v8 = v160;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 16), "setSublayers:", 0);
      objc_msgSend(*(id *)(a1 + 64), "removeAllObjects");
    }
  }

}

- (double)_widthForStroke:(uint64_t)a1
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  id WeakRetained;
  void *v18;
  double v19;
  double v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "_maxWidthForStroke");
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userInterfaceIdiom");

    if (v4)
    {
      objc_msgSend(v4, "transform");
      v8 = *((double *)&v22 + 1);
      v9 = *(double *)&v22;
    }
    else
    {
      v23 = 0u;
      v24 = 0u;
      v22 = 0u;
      v8 = 0.0;
      v9 = 0.0;
    }
    v10 = sqrt(v8 * v8 + v9 * v9);
    objc_msgSend(v4, "ink", v22, v23, v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "behavior");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "renderingDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "type");
    v15 = 0.0;
    if (!v14)
      v15 = 2.0;
    v16 = v15 + v6 * v10;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(*(id *)(a1 + 80), "drawing");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "scaleForDrawing:", v18);
    v20 = v16 * v19;

  }
  else
  {
    v20 = 0.0;
  }

  return v20;
}

void __86__PKSelectionGlowRenderer__createPathAroundStrokes_inDrawing_isLive_liveScrollOffset___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  __int128 v13;
  CGAffineTransform v14;
  CGRect v15;
  CGRect v16;

  v3 = a2;
  objc_msgSend(v3, "renderBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = -[PKSelectionGlowRenderer _widthForStroke:](*(_QWORD *)(a1 + 32), v3);

  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  v16 = CGRectInset(v15, -(v12 + 10.0), -(v12 + 10.0));
  v13 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v14.a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&v14.c = v13;
  *(_OWORD *)&v14.tx = *(_OWORD *)(a1 + 72);
  CGRectApplyAffineTransform(v16, &v14);
}

- (void)_willBeginDragKnobLocation:(unint64_t)a3 atPoint:(double)a4 knobDragMode:(double)a5
{
  double v10;
  uint64_t v11;
  CGColor *v12;
  id v13;

  if (a1)
  {
    *(_QWORD *)(a1 + 40) = a3;
    *(_QWORD *)(a1 + 56) = a2;
    *(_BYTE *)(a1 + 48) = 1;
    if (a3 <= 2)
    {
      -[PKSelectionModificationKnob didBeginBrushSelection](*(id **)(a1 + 32), a4);
      -[PKSelectionModificationKnob didBeginBrushSelection](*(id **)(a1 + 24), v10);
      -[PKSelectionGlowRenderer _updateKnobAppearanceForDragAtKnobLocation:point:knobDragMode:selectionType:touchType:](a1, a2, a3, 1, 2, a4, a5);
      v11 = 32;
      if (!a2)
        v11 = 24;
      v13 = *(id *)(a1 + v11);
      objc_msgSend(v13, "setHidden:", 0);
      v12 = (CGColor *)-[PKSelectionGlowRenderer _highlightColor](a1);
      -[PKSelectionModificationKnob setKnobColor:]((id *)v13, v12);

    }
  }
}

- (void)_updateKnobAppearanceForDragAtKnobLocation:(unint64_t)a3 point:(uint64_t)a4 knobDragMode:(uint64_t)a5 selectionType:(double)a6 touchType:(double)a7
{
  uint64_t v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CATransform3D v29;

  if (a1)
  {
    v13 = 32;
    if (!a2)
      v13 = 24;
    v14 = *(id *)(a1 + v13);
    if (a3 > 2)
    {
      -[PKSelectionGlowRenderer _resetKnobAppearance](a1, v15);
      objc_msgSend(v14, "frame");
      v26 = v25;
      v28 = v27;
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      objc_msgSend(v14, "setFrame:", a6 - v26 * 0.5, a7 - v28 * 0.5, v26, v28);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
    else
    {
      v16 = 5.75;
      if (a5 == 2)
        v16 = 3.5;
      v17 = 6.5;
      v18 = 5.0;
      if (a5 == 2)
      {
        v17 = 5.0;
        v18 = 2.0;
      }
      if (a4 == 1)
        v17 = v18;
      if (a4 != 2)
        v16 = v17;
      CATransform3DMakeScale(&v29, v16, v16, 1.0);
      objc_msgSend(v14, "setTransform:", &v29);
      objc_msgSend(v14, "frame");
      v20 = v19;
      v22 = v21;
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      objc_msgSend(v14, "setFrame:", a6 - v20 * 0.5, a7 - v22 * 0.5, v20, v22);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      v24 = *(id *)(a1 + 24);
      if (v24 == v14)
        v24 = *(id *)(a1 + 32);
      LODWORD(v23) = 0;
      objc_msgSend(v24, "setOpacity:", v23);
    }

  }
}

- (void)_updateKnobAppearanceForDragAtKnobLocation:(double)a3 point:(double)a4 otherKnobPoint:(double)a5 selectionType:(double)a6 touchType:
{
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;

  if (a1)
  {
    if (a2)
      v12 = 32;
    else
      v12 = 24;
    v13 = *(void **)(a1 + v12);
    if (a2)
      v14 = 24;
    else
      v14 = 32;
    v28 = v13;
    v15 = *(id *)(a1 + v14);
    -[PKSelectionGlowRenderer _resetKnobAppearance](a1, v16);
    v17 = 1.0;
    if (a2 == 1)
      v17 = -1.0;
    v18 = a5 + v17;
    v19 = a6 + v17;
    objc_msgSend(v28, "frame");
    v21 = v20;
    v23 = v22;
    objc_msgSend(v15, "frame");
    v25 = v24;
    v27 = v26;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    objc_msgSend(v28, "setFrame:", a3 - v21 * 0.5, a4 - v23 * 0.5, v21, v23);
    objc_msgSend(v15, "setFrame:", v18 - v25 * 0.5, v19 - v27 * 0.5, v25, v27);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  }
}

- (uint64_t)_resetKnobAppearance
{
  uint64_t v2;
  double v3;
  void *v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  if (result)
  {
    v2 = result;
    LODWORD(a2) = 1.0;
    objc_msgSend(*(id *)(result + 24), "setOpacity:", a2);
    LODWORD(v3) = 1.0;
    objc_msgSend(*(id *)(v2 + 32), "setOpacity:", v3);
    v4 = *(void **)(v2 + 24);
    v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v12 = v18;
    v19 = v13;
    v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v20 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v10 = v20;
    v21 = v11;
    v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v14 = *MEMORY[0x1E0CD2610];
    v8 = v14;
    v15 = v9;
    v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v16 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v6 = v16;
    v17 = v7;
    objc_msgSend(v4, "setTransform:", &v14);
    v5 = *(void **)(v2 + 32);
    v18 = v12;
    v19 = v13;
    v20 = v10;
    v21 = v11;
    v14 = v8;
    v15 = v9;
    v16 = v6;
    v17 = v7;
    return objc_msgSend(v5, "setTransform:", &v14);
  }
  return result;
}

- (uint64_t)_didEndDragKnobLocation:(uint64_t)a3 knobDragMode:(unint64_t)a4
{
  uint64_t v4;
  double v5;
  void *v6;
  double v7;

  if (result)
  {
    v4 = result;
    if (a4 <= 2)
    {
      -[PKSelectionModificationKnob didEndBrushSelection](*(id **)(result + 32), a2);
      -[PKSelectionModificationKnob didEndBrushSelection](*(id **)(v4 + 24), v5);
    }
    objc_msgSend(*(id *)(v4 + 80), "strokes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionGlowRenderer setKnobsVisible:]((id *)v4, objc_msgSend(v6, "count") != 0);

    *(_BYTE *)(v4 + 48) = 0;
    return -[PKSelectionGlowRenderer _resetKnobAppearance](v4, v7);
  }
  return result;
}

- (id)_accessibilityUserTestingChildren
{
  void *v3;
  void *v4;
  void *v5;
  PKSelectionModificationKnob *leftKnob;
  float v7;
  PKSelectionModificationKnob *rightKnob;
  float v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v11.receiver = self;
  v11.super_class = (Class)PKSelectionGlowRenderer;
  -[PKSelectionGlowRenderer _accessibilityUserTestingChildren](&v11, sel__accessibilityUserTestingChildren);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  leftKnob = self->_leftKnob;
  if (leftKnob)
  {
    -[PKSelectionModificationKnob opacity](leftKnob, "opacity");
    if (v7 > 0.0)
      objc_msgSend(v5, "addObject:", self->_leftKnob);
  }
  rightKnob = self->_rightKnob;
  if (rightKnob)
  {
    -[PKSelectionModificationKnob opacity](rightKnob, "opacity");
    if (v9 > 0.0)
      objc_msgSend(v5, "addObject:", self->_rightKnob);
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_renderingDelegate);
  objc_storeStrong((id *)&self->_strokeSelection, 0);
  objc_storeStrong((id *)&self->_lassoPath, 0);
  objc_storeStrong((id *)&self->_tiles, 0);
  objc_storeStrong((id *)&self->_rightKnob, 0);
  objc_storeStrong((id *)&self->_leftKnob, 0);
  objc_storeStrong((id *)&self->_strokePathsTilesLayer, 0);
  objc_storeStrong((id *)&self->_highlightLayer, 0);
}

@end
