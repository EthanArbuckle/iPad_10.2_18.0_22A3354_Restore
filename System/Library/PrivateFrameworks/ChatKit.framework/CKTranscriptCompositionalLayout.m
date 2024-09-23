@implementation CKTranscriptCompositionalLayout

+ (int64_t)translateLayoutIndexToEffectIndex:(int64_t)a3
{
  int64_t v3;

  v3 = 2;
  if (a3 != 3000)
    v3 = a3 == 1000;
  if (a3 == 5000)
    return 3;
  else
    return v3;
}

- (int64_t)effectIndexForDecorationViewAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[CKTranscriptCompositionalLayout decorationLayoutAttributes](self, "decorationLayoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[CKTranscriptCompositionalLayout translateLayoutIndexToEffectIndex:](CKTranscriptCompositionalLayout, "translateLayoutIndexToEffectIndex:", objc_msgSend(v5, "zIndex"));

  return v6;
}

- (CKTranscriptCompositionalLayout)initWithSectionProvider:(id)a3
{
  CKTranscriptCompositionalLayout *v3;
  CKTranscriptCompositionalLayout *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *initialParentLayoutAttributes;
  NSMutableDictionary *v7;
  NSMutableDictionary *finalParentVerticalOffsets;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKTranscriptCompositionalLayout;
  v3 = -[CKTranscriptCompositionalLayout initWithSectionProvider:](&v16, sel_initWithSectionProvider_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_isResting = 1;
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    initialParentLayoutAttributes = v4->_initialParentLayoutAttributes;
    v4->_initialParentLayoutAttributes = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    finalParentVerticalOffsets = v4->_finalParentVerticalOffsets;
    v4->_finalParentVerticalOffsets = v7;

    v4->_dynamicsUpdateSequenceItem = 0;
    v9 = objc_opt_class();
    +[CKFullscreenEffectDecorationView decorationViewKind](CKFullscreenEffectDecorationView, "decorationViewKind");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptCompositionalLayout registerClass:forDecorationViewOfKind:](v4, "registerClass:forDecorationViewOfKind:", v9, v10);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_sizeCategoryIsAccessibilitySizeCategory = objc_msgSend(v11, "isAccessibilityPreferredContentSizeCategory");

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D36AC8]), "initWithTarget:action:", v4, sel__kickDynamicsIfNeeded);
    -[CKTranscriptCompositionalLayout setDynamicsUpdater:](v4, "setDynamicsUpdater:", v12);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v4, sel_sizeCategoryDidChange_, *MEMORY[0x1E0CEB3F0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v4, sel_reduceMotionSettingChanged_, *MEMORY[0x1E0CEB090], 0);

  }
  return v4;
}

- (void)_sceneActivationStateDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v7 == v9)
  {
    -[CKTranscriptCompositionalLayout _kickDynamicsIfNeeded](self, "_kickDynamicsIfNeeded");
    v8 = v9;
  }

}

- (BOOL)isInBackground
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInBackground");

  return v3;
}

- (void)_configureDisplayLink
{
  void *v3;
  id v4;

  if ((_UIUpdateCycleEnabled() & 1) == 0 && !self->_displayLink)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel_displayLinkFired_);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addToRunLoop:forMode:", v3, *MEMORY[0x1E0C99860]);

    -[CKTranscriptCompositionalLayout setDisplayLink:]((uint64_t)self, v4);
  }
}

- (void)setDisplayLink:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 656), a2);
}

- (void)_configureUpdateSequenceItem
{
  if (!self->_dynamicsUpdateSequenceItem)
  {
    self->_dynamicsUpdateSequenceItem = (_UIUpdateSequenceItemInternal *)_UIUpdateSequenceInsertItem();
    _UIUpdateRequestActivate();
  }
}

void __63__CKTranscriptCompositionalLayout__configureUpdateSequenceItem__block_invoke(uint64_t a1, double a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  kdebug_trace();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4
    && (*(_BYTE *)(v4 + 511) = 1, (v5 = *(_QWORD *)(a1 + 32)) != 0)
    && (*(double *)(v5 + 600) = a2, (v6 = *(_QWORD *)(a1 + 32)) != 0)
    && (*(double *)(v6 + 608) != 0.0 || (*(_QWORD *)(v6 + 608) = *(_QWORD *)(v6 + 600), (v6 = *(_QWORD *)(a1 + 32)) != 0)))
  {
    *(_QWORD *)(v6 + 616) = 0x405E000000000000;
    v7 = *(void **)(a1 + 32);
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v7, "_invalidationContextForRefreshingVisibleElementAttributes");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateLayoutWithContext:", v8);

}

- (void)_kickDynamicsIfNeeded
{
  if (-[CKTranscriptCompositionalLayout isInBackground](self, "isInBackground"))
  {
    -[CKTranscriptCompositionalLayout invalidateDisplayLink](self, "invalidateDisplayLink");
  }
  else if (_UIUpdateCycleEnabled())
  {
    -[CKTranscriptCompositionalLayout _configureUpdateSequenceItem](self, "_configureUpdateSequenceItem");
  }
  else
  {
    -[CKTranscriptCompositionalLayout _configureDisplayLink](self, "_configureDisplayLink");
  }
}

- (void)beginHoldingDynamicsUpdatesForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKTranscriptCompositionalLayout dynamicsUpdater](self, "dynamicsUpdater");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginHoldingUpdatesForKey:", v4);

}

- (void)endHoldingDynamicsUpdatesForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKTranscriptCompositionalLayout dynamicsUpdater](self, "dynamicsUpdater");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endHoldingUpdatesForKey:", v4);

}

- (void)setNeedsDynamicsUpdate
{
  id v2;

  -[CKTranscriptCompositionalLayout dynamicsUpdater](self, "dynamicsUpdater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdate");

}

- (void)dealloc
{
  objc_super v3;

  -[CKTranscriptCompositionalLayout _dealloc](self, "_dealloc");
  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptCompositionalLayout;
  -[CKTranscriptCompositionalLayout dealloc](&v3, sel_dealloc);
}

- (void)_dealloc
{
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  -[IMScheduledUpdater invalidate](self->_dynamicsUpdater, "invalidate");
  -[CKTranscriptCompositionalLayout removeUpdateSequenceItem](self, "removeUpdateSequenceItem");
}

- (void)prepareLayoutForRotisserieScrolling
{
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGFloat width;
  double v10;
  double v11;
  CGFloat x;
  CGFloat y;
  double height;
  double MidY;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  CGRect *v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  uint64_t v28;
  unint64_t v29;
  size_t v30;
  char *v31;
  unint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  _BOOL4 v40;
  double v41;
  unint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  unint64_t v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  _BOOL4 v58;
  double v59;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  uint64_t v67;
  double v68;
  double *v69;
  double v70;
  uint64_t *v71;
  uint64_t v72;
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
  BOOL v87;
  double v88;
  double v89;
  _BOOL4 v90;
  double v92;
  double v93;
  double v94;
  _BOOL4 v95;
  double v96;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t i;
  uint64_t v109;
  unint64_t v110;
  double v111;
  uint64_t *v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double *v117;
  double v118;
  double v119;
  double *v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  _BOOL4 v131;
  char v133;
  double v134;
  double v135;
  double v136;
  double v137;
  _BOOL4 v138;
  BOOL v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  double *v152;
  uint64_t v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  CKTranscriptCompositionalLayout *v162;
  id v163;
  uint64_t v164;
  void *v165;
  id v166;
  double v167;
  CKTranscriptCompositionalLayout *v168;
  CGFloat v169;
  double v170;
  _BOOL4 v171;
  CGFloat v172;
  unint64_t v173;
  double MaxY;
  double v175;
  double v176;
  unint64_t v177;
  double MinY;
  double v179;
  double v180;
  char *v181;
  double v182;
  id v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  _BYTE v200[128];
  _BYTE v201[128];
  _BYTE v202[128];
  _QWORD v203[19];
  CGRect v204;
  CGRect v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;

  v203[16] = *MEMORY[0x1E0C80C00];
  -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v168 = self;
  -[CKTranscriptCompositionalLayout layoutAttributes](self, "layoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v6 = v5;
  v8 = v7;
  width = v204.size.width;
  v11 = v10;
  v204.origin.x = v5 + 0.0;
  x = v204.origin.x;
  v204.origin.y = v7 + 15.0;
  y = v204.origin.y;
  v204.size.height = v10 + -30.0;
  height = v204.size.height;
  MinY = CGRectGetMinY(v204);
  v205.origin.x = x;
  v205.origin.y = y;
  v205.size.width = width;
  v205.size.height = height;
  MidY = CGRectGetMidY(v205);
  v206.origin.x = x;
  v206.origin.y = y;
  v206.size.width = width;
  v206.size.height = height;
  MaxY = CGRectGetMaxY(v206);
  v207.origin.x = x;
  v207.origin.y = y;
  v207.size.width = width;
  v207.size.height = height;
  v180 = CGRectGetHeight(v207);
  objc_msgSend(v3, "__ck_bottomOffset");
  v182 = v16;
  v18 = v17;
  v208.origin.x = v6;
  v208.origin.y = v8;
  v208.size.width = width;
  v208.size.height = v11;
  v175 = CGRectGetMaxY(v208);
  v19 = objc_msgSend(v4, "indexOfObjectWithOptions:passingTest:", 2, &__block_literal_global_170);
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v20 = v18 - v11;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", v19);
    v21 = (CGRect *)objc_claimAutoreleasedReturnValue();
    v22 = CGRectGetMaxY(v21[11]) - v11;

    v175 = v22;
    v20 = v22;
  }
  v209.origin.x = v182 + 0.0;
  v209.origin.y = v20 + 15.0;
  v209.size.width = width;
  v209.size.height = height;
  v23 = CGRectGetMinY(v209);
  objc_msgSend(v3, "__ck_scrollToTopContentOffset");
  v210.origin.x = v26 + 0.0;
  v24 = v210.origin.x;
  v210.origin.y = v27 + 15.0;
  v25 = v210.origin.y;
  v210.size.width = width;
  v210.size.height = height;
  v169 = CGRectGetMinY(v210);
  v211.origin.x = v24;
  v211.origin.y = v25;
  v211.size.width = width;
  v211.size.height = height;
  v172 = CGRectGetMaxY(v211);
  v171 = -[CKTranscriptCompositionalLayout hasLoadMore](v168, "hasLoadMore");
  v28 = objc_msgSend(v4, "count");
  if (!v28)
    goto LABEL_165;
  v29 = v28;
  v164 = (uint64_t)&v164;
  MEMORY[0x1E0C80A78](v28);
  v31 = (char *)&v164 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v31, v30);
  v181 = v31;
  objc_msgSend(v4, "getObjects:range:", v31, 0, v29);
  v32 = v29 - 1;
  v165 = v4;
  v166 = v3;
  v33 = MinY;
  v173 = v29;
  while (1)
  {
    v34 = *(double *)&v181[8 * v32];
    v35 = *(double *)(*(_QWORD *)&v34 + 584);
    v36 = *(double *)(*(_QWORD *)&v34 + 600) * 0.5;
    if (v35 - v36 < MidY)
      break;
    if (--v32 == -1)
      goto LABEL_30;
  }
  v37 = v35 + v36;
  v38 = 0.5;
  if (v37 >= MidY || (v38 = (v37 - MinY) / v180, v38 < 0.0) || v38 >= 0.4)
  {
    v40 = v38 < 0.4;
    if (v38 > 0.6)
      v40 = 1;
    v41 = 1.0;
    if (v38 > 1.0)
      goto LABEL_22;
    if (v38 <= 0.6 || !v40)
      goto LABEL_22;
    v39 = v38 + -0.6;
  }
  else
  {
    v39 = 0.4 - v38;
  }
  v41 = sqrt(0.16 - v39 * v39) / 0.4;
LABEL_22:
  *(double *)(*(_QWORD *)&v34 + 608) = v41;
  v177 = v32;
  v43 = v32 + 0x8000000000000000;
  *(_QWORD *)(*(_QWORD *)&v34 + 592) = *(_QWORD *)(*(_QWORD *)&v34 + 584);
  *(_BYTE *)(*(_QWORD *)&v34 + 616) = 0;
  v198 = 0u;
  v199 = 0u;
  v196 = 0u;
  v197 = 0u;
  v182 = v34;
  v44 = *(id *)(*(_QWORD *)&v34 + 632);
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v196, v203, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v197;
    do
    {
      v48 = 0;
      v49 = v182;
      do
      {
        if (*(_QWORD *)v197 != v47)
        {
          objc_enumerationMutation(v44);
          v49 = v182;
        }
        v50 = *(_QWORD *)(*((_QWORD *)&v196 + 1) + 8 * v48);
        *(_QWORD *)(v50 + 608) = *(_QWORD *)(*(_QWORD *)&v49 + 608);
        *(_BYTE *)(v50 + 616) = *(_BYTE *)(*(_QWORD *)&v49 + 616);
        *(_QWORD *)(v50 + 592) = *(_QWORD *)(*(_QWORD *)&v49 + 592);
        ++v48;
      }
      while (v46 != v48);
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v196, v203, 16);
    }
    while (v46);
  }

  v51 = v177;
  v29 = v173;
  if (v43 == -1)
  {
LABEL_30:
    v52 = *(double *)v181;
    v53 = *(double *)(*(_QWORD *)v181 + 584);
    v54 = 0.5;
    v55 = *(double *)(*(_QWORD *)v181 + 600) * 0.5;
    v56 = v53 - v55;
    if (v53 - v55 <= MidY && (v56 = v53 + v55, v53 + v55 >= MidY)
      || (v54 = (v56 - v33) / v180, v54 < 0.0)
      || v54 >= 0.4)
    {
      v58 = v54 < 0.4;
      if (v54 > 0.6)
        v58 = 1;
      v59 = 1.0;
      if (v54 > 1.0)
        goto LABEL_44;
      if (v54 <= 0.6 || !v58)
        goto LABEL_44;
      v57 = v54 + -0.6;
    }
    else
    {
      v57 = 0.4 - v54;
    }
    v59 = sqrt(0.16 - v57 * v57) / 0.4;
LABEL_44:
    *(double *)(*(_QWORD *)&v52 + 608) = v59;
    *(_QWORD *)(*(_QWORD *)&v52 + 592) = *(_QWORD *)(*(_QWORD *)&v52 + 584);
    *(_BYTE *)(*(_QWORD *)&v52 + 616) = 0;
    v194 = 0u;
    v195 = 0u;
    v192 = 0u;
    v193 = 0u;
    v182 = v52;
    v61 = *(id *)(*(_QWORD *)&v52 + 632);
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v192, v202, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v193;
      do
      {
        v65 = 0;
        v66 = v182;
        do
        {
          if (*(_QWORD *)v193 != v64)
          {
            objc_enumerationMutation(v61);
            v66 = v182;
          }
          v67 = *(_QWORD *)(*((_QWORD *)&v192 + 1) + 8 * v65);
          *(_QWORD *)(v67 + 608) = *(_QWORD *)(*(_QWORD *)&v66 + 608);
          *(_BYTE *)(v67 + 616) = *(_BYTE *)(*(_QWORD *)&v66 + 616);
          *(_QWORD *)(v67 + 592) = *(_QWORD *)(*(_QWORD *)&v66 + 592);
          ++v65;
        }
        while (v63 != v65);
        v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v192, v202, 16);
      }
      while (v63);
    }

    v51 = 0;
  }
  v176 = v23;
  v177 = v51;
  *(_QWORD *)&v68 = v51 + 1;
  v69 = *(double **)&v182;
  if (v51 + 1 < v29)
  {
    v70 = 0.5;
    v71 = &OBJC_IVAR___CKSendMenuViewController_plusButtonPortalViewShouldUsePlusLFilter;
    *(double *)&v72 = 0.4;
    v170 = 0.16;
    v167 = -0.6;
    v73 = v182;
    while (1)
    {
      v74 = *(double *)&v72;
      v75 = *(double *)(*(_QWORD *)&v73 + 584);
      v76 = *(double *)(*(_QWORD *)&v73 + 600);
      v77 = *(double *)(*(_QWORD *)&v73 + 592);
      v78 = *(double *)(*(_QWORD *)&v73 + 608);
      v73 = *(double *)&v181[8 * *(_QWORD *)&v68];
      v79 = *(double *)(*(_QWORD *)&v73 + 584);
      v80 = *(double *)(*(_QWORD *)&v73 + 600);
      if (CKMainScreenScale_once_67 != -1)
      {
        dispatch_once(&CKMainScreenScale_once_67, &__block_literal_global_402_0);
        v70 = 0.5;
      }
      v81 = v79 - v80 * v70 - (v75 + v76 * v70);
      if (v78 >= 0.25)
        v82 = v78;
      else
        v82 = 0.25;
      v83 = v76 * v82;
      v84 = *((double *)v71 + 481);
      v85 = 1.0;
      if (v84 == 0.0)
        v84 = 1.0;
      v86 = v81 + v77 + ceil(v83 * v84) / v84 * v70;
      v87 = v86 >= MaxY;
      *(double *)&v72 = v74;
      if (v86 >= MaxY)
        goto LABEL_90;
      v88 = (v86 - MinY) / v180;
      if (v88 >= 0.0 && v88 < v74)
        break;
      v90 = v88 < v74;
      if (v88 > 0.6)
        v90 = 1;
      if (v88 <= 1.0 && v88 > 0.6 && v90)
      {
        v89 = v88 + v167;
        goto LABEL_73;
      }
LABEL_74:
      if (v86 < v176)
        goto LABEL_90;
      v92 = (v86 - v176) / v180;
      if (v92 < v70)
        v92 = v70;
      v93 = fmin(v92, 1.0);
      if (v93 < 0.0 || v93 >= v74)
      {
        v95 = v93 < v74;
        if (v93 > 0.6)
          v95 = 1;
        v96 = 1.0;
        if (v93 > 1.0)
          goto LABEL_89;
        if (v93 <= 0.6 || !v95)
          goto LABEL_89;
        v94 = v93 + v167;
      }
      else
      {
        v94 = v74 - v93;
      }
      v96 = sqrt(v170 - v94 * v94) / v74;
LABEL_89:
      v85 = fmin(v85 + 1.0 - v96, 1.0);
LABEL_90:
      v179 = v68;
      if (v86 < v175 && (v86 - v176) / v180 >= 1.0)
        v87 = 0;
      *(double *)(*(_QWORD *)&v73 + 608) = v85;
      *(_BYTE *)(*(_QWORD *)&v73 + 616) = v87;
      v98 = v81 * (1.0 - v85);
      v99 = *((double *)v71 + 481);
      if (v99 == 0.0)
        v99 = 1.0;
      v100 = v86 - round(v98 * v99) / v99;
      v101 = *(double *)(*(_QWORD *)&v73 + 608);
      if (v101 < 0.25)
        v101 = 0.25;
      v102 = v101 * *(double *)(*(_QWORD *)&v73 + 600);
      v103 = *((double *)v71 + 481);
      if (v103 == 0.0)
        v103 = 1.0;
      *(double *)(*(_QWORD *)&v73 + 592) = v100 + ceil(v102 * v103) / v103 * v70;
      v190 = 0u;
      v191 = 0u;
      v188 = 0u;
      v189 = 0u;
      v104 = *(id *)(*(_QWORD *)&v73 + 632);
      v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v188, v201, 16);
      if (v105)
      {
        v106 = v105;
        v107 = *(_QWORD *)v189;
        do
        {
          for (i = 0; i != v106; ++i)
          {
            if (*(_QWORD *)v189 != v107)
              objc_enumerationMutation(v104);
            v109 = *(_QWORD *)(*((_QWORD *)&v188 + 1) + 8 * i);
            *(double *)(v109 + 608) = v85;
            *(_BYTE *)(v109 + 616) = v87;
            *(_QWORD *)(v109 + 592) = *(_QWORD *)(*(_QWORD *)&v73 + 592);
          }
          v106 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v188, v201, 16);
        }
        while (v106);
      }

      *(_QWORD *)&v68 = *(_QWORD *)&v179 + 1;
      v69 = *(double **)&v182;
      v71 = &OBJC_IVAR___CKSendMenuViewController_plusButtonPortalViewShouldUsePlusLFilter;
      v70 = 0.5;
      if (*(_QWORD *)&v179 + 1 == v173)
        goto LABEL_107;
    }
    v89 = v74 - v88;
LABEL_73:
    v85 = sqrt(v170 - v89 * v89) / v74;
    goto LABEL_74;
  }
LABEL_107:
  v110 = v177;
  if (v177)
  {
    v111 = 0.0;
    v112 = &OBJC_IVAR___CKSendMenuViewController_plusButtonPortalViewShouldUsePlusLFilter;
    v179 = 0.16;
    v175 = -0.6;
    while (1)
    {
      v182 = v111;
      v113 = v69[73];
      v114 = v69[74];
      v115 = v69[76];
      v116 = v69[75];
      v117 = *(double **)&v181[8 * v110 + 8 * ~*(_QWORD *)&v111];
      v118 = v117[73];
      v119 = v117[75];
      v120 = v117;
      if (CKMainScreenScale_once_67 != -1)
      {
        dispatch_once(&CKMainScreenScale_once_67, &__block_literal_global_402_0);
        v117 = v120;
      }
      v121 = v113 - v116 * 0.5 - (v118 + v119 * 0.5);
      if (v115 >= 0.25)
        v122 = v115;
      else
        v122 = 0.25;
      v123 = v116 * v122;
      v124 = *((double *)v112 + 481);
      v125 = 1.0;
      if (v124 == 0.0)
        v124 = 1.0;
      v126 = v114 + ceil(v123 * v124) / v124 * -0.5;
      v127 = v126 - v121;
      v128 = MinY;
      if (v126 - v121 <= MinY)
        goto LABEL_150;
      v129 = (v127 - MinY) / v180;
      if (v129 >= 0.0 && v129 < 0.4)
        break;
      v131 = v129 < 0.4;
      if (v129 > 0.6)
        v131 = 1;
      if (v129 <= 1.0 && v129 > 0.6 && v131)
      {
        v130 = v129 + v175;
        goto LABEL_128;
      }
LABEL_129:
      v133 = v171;
      if (v127 > v172)
        v133 = 1;
      if ((v133 & 1) == 0)
      {
        v134 = fmin((v127 - v169) / v180, 0.5);
        goto LABEL_137;
      }
      if (v126 >= v176)
      {
        v134 = (v126 - v176) / v180;
        if (v134 < 0.5)
          v134 = 0.5;
LABEL_137:
        v135 = 1.0;
        v136 = fmin(v134, 1.0);
        if (v136 >= 0.0 && v136 < 0.4)
        {
          v137 = 0.4 - v136;
          goto LABEL_148;
        }
        v138 = v136 < 0.4;
        if (v136 > 0.6)
          v138 = 1;
        if (v136 <= 1.0 && v136 > 0.6 && v138)
        {
          v137 = v136 + v175;
LABEL_148:
          v135 = sqrt(v179 - v137 * v137) / 0.4;
        }
        v125 = fmin(v125 + 1.0 - v135, 1.0);
      }
LABEL_150:
      v117[76] = v125;
      v140 = v127 <= v128;
      *((_BYTE *)v117 + 616) = v127 <= v128;
      v141 = v121 * (1.0 - v125);
      v142 = *((double *)v112 + 481);
      if (v142 == 0.0)
        v142 = 1.0;
      v143 = v127 + round(v141 * v142) / v142;
      v144 = v117[76];
      if (v144 < 0.25)
        v144 = 0.25;
      v145 = v144 * v117[75];
      v146 = *((double *)v112 + 481);
      if (v146 == 0.0)
        v146 = 1.0;
      v117[74] = v143 + ceil(v145 * v146) / v146 * -0.5;
      v186 = 0u;
      v187 = 0u;
      v184 = 0u;
      v185 = 0u;
      v147 = *((id *)v117 + 79);
      v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v184, v200, 16);
      if (v148)
      {
        v149 = v148;
        v150 = *(_QWORD *)v185;
        do
        {
          v151 = 0;
          v152 = v120;
          do
          {
            if (*(_QWORD *)v185 != v150)
            {
              objc_enumerationMutation(v147);
              v152 = v120;
            }
            v153 = *(_QWORD *)(*((_QWORD *)&v184 + 1) + 8 * v151);
            *(double *)(v153 + 608) = v125;
            *(_BYTE *)(v153 + 616) = v140;
            *(double *)(v153 + 592) = v152[74];
            ++v151;
          }
          while (v149 != v151);
          v149 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v184, v200, 16);
        }
        while (v149);
      }

      *(_QWORD *)&v111 = *(_QWORD *)&v182 + 1;
      v110 = v177;
      v69 = v120;
      v112 = &OBJC_IVAR___CKSendMenuViewController_plusButtonPortalViewShouldUsePlusLFilter;
      if (*(_QWORD *)&v182 + 1 == v177)
        goto LABEL_164;
    }
    v130 = 0.4 - v129;
LABEL_128:
    v125 = sqrt(v179 - v130 * v130) / 0.4;
    goto LABEL_129;
  }
LABEL_164:
  v3 = v166;
  objc_msgSend(v166, "bounds");
  v155 = v154;
  v157 = v156;
  v159 = v158;
  v161 = v160;
  v183 = 0;
  v162 = v168;
  v4 = v165;
  -[CKTranscriptCompositionalLayout _configureThreadGroupsForAttributes:outMaxYAnchorAttribute:forVisibleBounds:](v168, "_configureThreadGroupsForAttributes:outMaxYAnchorAttribute:forVisibleBounds:", v165, &v183);
  v163 = v183;
  -[CKTranscriptCompositionalLayout _visibleRectInsectsForMaxYAnchorLayoutAttribute:forVisibleBounds:](v162, "_visibleRectInsectsForMaxYAnchorLayoutAttribute:forVisibleBounds:", v163, v155, v157, v159, v161);
  objc_msgSend(v3, "_setVisibleRectEdgeInsets:");

LABEL_165:
}

uint64_t __70__CKTranscriptCompositionalLayout_prepareLayoutForRotisserieScrolling__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "chatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)prepareLayout
{
  int v2;
  uint64_t v3;
  __int16 v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218240;
  v3 = 0x4024000000000000;
  v4 = 2048;
  v5 = a2;
  _os_log_fault_impl(&dword_18DFCD000, log, OS_LOG_TYPE_FAULT, "Display driven transcriptDynamics has been running for more than  > %.2f (%.2f), invoking displayLink watchdog", (uint8_t *)&v2, 0x16u);
}

- (UIEdgeInsets)_visibleRectInsectsForMaxYAnchorLayoutAttribute:(id)a3 forVisibleBounds:(CGRect)a4
{
  CGFloat x;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxY;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  UIEdgeInsets result;

  x = a4.origin.x;
  v5 = *MEMORY[0x1E0CEB4B0];
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v8 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v7 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  if (a3)
  {
    v17 = *MEMORY[0x1E0CEB4B0];
    y = a4.origin.y;
    width = a4.size.width;
    height = a4.size.height;
    MaxY = CGRectGetMaxY(*((CGRect *)a3 + 12));
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v13 = CGRectGetMaxY(v18) - MaxY;
    if (v13 < 0.0)
      v8 = v13;
    v5 = v17;
  }
  v14 = v6;
  v15 = v8;
  v16 = v7;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v5;
  return result;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  objc_super v19;

  v4 = a3;
  if (-[CKTranscriptCompositionalLayout isUsingInitialLayoutAttributesForRotation](self, "isUsingInitialLayoutAttributesForRotation"))
  {
    -[CKTranscriptCompositionalLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "section") == 1)
  {
    -[CKTranscriptCompositionalLayout associatedLayoutAttributes](self, "associatedLayoutAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    if (v7 <= objc_msgSend(v4, "item"))
    {

    }
    else
    {
      -[CKTranscriptCompositionalLayout associatedLayoutAttributes](self, "associatedLayoutAttributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v4, "item"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[CKTranscriptCompositionalLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (void *)objc_msgSend(v10, "copy");

        objc_msgSend(v5, "setAlphaOrFilterLevel:", 1.0);
        -[CKTranscriptCompositionalLayout insertedAssociatedLayoutAttributes](self, "insertedAssociatedLayoutAttributes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsIndex:", objc_msgSend(v4, "row"));

        if (v12)
        {
          objc_msgSend(v5, "frame");
          objc_msgSend(v5, "setFrame:");
          -[CKTranscriptCompositionalLayout insertedAssociatedLayoutAttributes](self, "insertedAssociatedLayoutAttributes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeIndex:", objc_msgSend(v4, "row"));

        }
        goto LABEL_13;
      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)CKTranscriptCompositionalLayout;
  -[CKTranscriptCompositionalLayout initialLayoutAttributesForAppearingItemAtIndexPath:](&v19, sel_initialLayoutAttributesForAppearingItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptCompositionalLayout indicesOfChatItemsToBeInsertedWithoutFading](self, "indicesOfChatItemsToBeInsertedWithoutFading");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsIndex:", objc_msgSend(v4, "item"));

  if (v15)
    objc_msgSend(v5, "setAlphaOrFilterLevel:", 1.0);
  -[CKTranscriptCompositionalLayout indicesOfReplyChatItemsToBeInserted](self, "indicesOfReplyChatItemsToBeInserted");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsIndex:", objc_msgSend(v4, "item"));

  if (v17)
  {
    objc_msgSend(v5, "setInsertingReply:", 1);
    objc_msgSend(v5, "setAlphaOrFilterLevel:", 1.0);
  }
LABEL_13:

  return v5;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4;
  id v5;
  NSMutableDictionary *finalParentVerticalOffsets;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  void *v13;
  objc_super v15;
  objc_super v16;

  v4 = a3;
  if (-[CKTranscriptCompositionalLayout isUsingInitialLayoutAttributesForRotation](self, "isUsingInitialLayoutAttributesForRotation"))
  {
    -[CKTranscriptCompositionalLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "section") == 1)
  {
    v16.receiver = self;
    v16.super_class = (Class)CKTranscriptCompositionalLayout;
    -[CKTranscriptCompositionalLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](&v16, sel_finalLayoutAttributesForDisappearingItemAtIndexPath_, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    finalParentVerticalOffsets = self->_finalParentVerticalOffsets;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "item"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](finalParentVerticalOffsets, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;

    if (v10 != 0.0)
    {
      objc_msgSend(v5, "frame");
      objc_msgSend(v5, "setFrame:");
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CKTranscriptCompositionalLayout;
    -[CKTranscriptCompositionalLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](&v15, sel_finalLayoutAttributesForDisappearingItemAtIndexPath_, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptCompositionalLayout indicesOfChatItemsToBeRemovedWithoutFading](self, "indicesOfChatItemsToBeRemovedWithoutFading");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsIndex:", objc_msgSend(v4, "item"));

    if (v12)
      objc_msgSend(v5, "setAlphaOrFilterLevel:", 0.0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v5;
      objc_msgSend(v5, "chatItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEditedMessageHistory"))
        objc_msgSend(v5, "setZIndex:", -1000);

    }
  }

  return v5;
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  id v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  _OWORD *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  uint64_t v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  double MidY;
  uint64_t v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  double v64;
  _OWORD *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  CGFloat v70;
  CGFloat v71;
  double v72;
  double v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t k;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  void *v96;
  CKTranscriptCompositionalLayout *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  CGFloat v101;
  CGFloat v102;
  uint64_t v103;
  int v104;
  char *obj;
  id obja;
  uint64_t v107;
  void *v108;
  double v109;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  CATransform3D v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;

  v127 = *MEMORY[0x1E0C80C00];
  -[CKTranscriptCompositionalLayout layoutAttributes](self, "layoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldUseRotisserieScrolling");

  v97 = self;
  -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8 * 0.5;
  v96 = v7;
  objc_msgSend(v7, "bounds");
  v109 = v9 + v10;
  v11 = objc_msgSend(v4, "count");
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v98 = v4;
  obj = (char *)v11;
  if (v11)
  {
    v11 = 0;
    v13 = 0;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      v107 = v14;
      objc_msgSend(v4, "objectAtIndex:", v13);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v6)
      {
        if (!*(_BYTE *)(v15 + 616))
        {
          objc_msgSend((id)v15, "setCenter:", v109, *(double *)(v15 + 592));
          objc_msgSend((id)v16, "setAlphaOrFilterLevel:", *(double *)(v16 + 608));
          v17 = *(double *)(v16 + 608);
          v99 = v11;
          if (v17 == 1.0)
          {
            v18 = (_OWORD *)MEMORY[0x1E0CD2610];
            v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
            *(_OWORD *)(v16 + 520) = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
            *(_OWORD *)(v16 + 536) = v19;
            v20 = v18[7];
            *(_OWORD *)(v16 + 552) = v18[6];
            *(_OWORD *)(v16 + 568) = v20;
            v21 = v18[1];
            *(_OWORD *)(v16 + 456) = *v18;
            *(_OWORD *)(v16 + 472) = v21;
            v22 = v18[3];
            *(_OWORD *)(v16 + 488) = v18[2];
            *(_OWORD *)(v16 + 504) = v22;
          }
          else
          {
            if (v17 < 0.25)
              v17 = 0.25;
            CATransform3DMakeScale(&v123, v17, v17, 1.0);
            v30 = *(_OWORD *)&v123.m11;
            v31 = *(_OWORD *)&v123.m13;
            v32 = *(_OWORD *)&v123.m23;
            *(_OWORD *)(v16 + 488) = *(_OWORD *)&v123.m21;
            *(_OWORD *)(v16 + 504) = v32;
            *(_OWORD *)(v16 + 456) = v30;
            *(_OWORD *)(v16 + 472) = v31;
            v33 = *(_OWORD *)&v123.m31;
            v34 = *(_OWORD *)&v123.m33;
            v35 = *(_OWORD *)&v123.m43;
            *(_OWORD *)(v16 + 552) = *(_OWORD *)&v123.m41;
            *(_OWORD *)(v16 + 568) = v35;
            *(_OWORD *)(v16 + 520) = v33;
            *(_OWORD *)(v16 + 536) = v34;
          }
          v121 = 0u;
          v122 = 0u;
          v119 = 0u;
          v120 = 0u;
          v36 = *(id *)(v16 + 632);
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v119, v126, 16);
          if (v37)
          {
            v38 = v37;
            v39 = *(_QWORD *)v120;
            do
            {
              for (i = 0; i != v38; ++i)
              {
                if (*(_QWORD *)v120 != v39)
                  objc_enumerationMutation(v36);
                v41 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * i);
                v42 = *(_OWORD *)(v16 + 568);
                v44 = *(_OWORD *)(v16 + 520);
                v43 = *(_OWORD *)(v16 + 536);
                *(_OWORD *)(v41 + 552) = *(_OWORD *)(v16 + 552);
                *(_OWORD *)(v41 + 568) = v42;
                *(_OWORD *)(v41 + 520) = v44;
                *(_OWORD *)(v41 + 536) = v43;
                v45 = *(_OWORD *)(v16 + 456);
                v46 = *(_OWORD *)(v16 + 472);
                v47 = *(_OWORD *)(v16 + 504);
                *(_OWORD *)(v41 + 488) = *(_OWORD *)(v16 + 488);
                *(_OWORD *)(v41 + 504) = v47;
                *(_OWORD *)(v41 + 456) = v45;
                *(_OWORD *)(v41 + 472) = v46;
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v16);
              }
              v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v119, v126, 16);
            }
            while (v38);
          }

          v4 = v98;
          v11 = v99;
          goto LABEL_23;
        }
      }
      else
      {
        v24 = *(double *)(v15 + 384);
        v23 = *(double *)(v15 + 392);
        v25 = *(double *)(v15 + 400);
        v26 = *(double *)(v15 + 408);
        v28 = *(double *)(v15 + 352);
        v27 = *(double *)(v15 + 360);
        v101 = *(double *)(v15 + 376);
        v102 = *(double *)(v15 + 368);
        v128.origin.x = v24;
        v128.origin.y = v23;
        v128.size.width = v25;
        v128.size.height = v26;
        if (CGRectIntersectsRect(v128, a3)
          || (v129.origin.x = v28,
              v129.origin.y = v27,
              v129.size.height = v101,
              v129.size.width = v102,
              CGRectIntersectsRect(v129, a3)))
        {
          v130.origin.x = v24;
          v130.origin.y = v23;
          v130.size.width = v25;
          v130.size.height = v26;
          CGRectGetMidX(v130);
          v131.origin.x = v24;
          v131.origin.y = v23;
          v131.size.width = v25;
          v131.size.height = v26;
          objc_msgSend((id)v16, "setCenter:", v109, CGRectGetMidY(v131));
          objc_msgSend((id)v16, "setSize:", v25, v26);
LABEL_23:
          if (v107 == 0x7FFFFFFFFFFFFFFFLL)
            v29 = (uint64_t)v13;
          else
            v29 = v107;
          ++v11;
          goto LABEL_27;
        }
      }
      v29 = 0x7FFFFFFFFFFFFFFFLL;
      if (v107 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v29 = v107;

        goto LABEL_30;
      }
LABEL_27:
      ++v13;

      v14 = v29;
      if (v13 == obj)
        goto LABEL_30;
    }
  }
  v29 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_30:
  v103 = v29;
  v100 = v11;
  -[CKTranscriptCompositionalLayout associatedLayoutAttributes](v97, "associatedLayoutAttributes");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v48, "count"));
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  obja = v48;
  v49 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v115, v125, 16);
  if (!v49)
    goto LABEL_49;
  v50 = v49;
  v51 = *(_QWORD *)v116;
  v104 = v6;
  do
  {
    for (j = 0; j != v50; ++j)
    {
      if (*(_QWORD *)v116 != v51)
        objc_enumerationMutation(obja);
      v53 = *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * j);
      if (v6)
      {
        if (*(_BYTE *)(v53 + 616))
          continue;
        v54 = *(double *)(v53 + 384);
        v55 = *(double *)(v53 + 392);
        v56 = *(double *)(v53 + 400);
        v57 = *(double *)(v53 + 408);
        v132.origin.x = v54;
        v132.origin.y = v55;
        v132.size.width = v56;
        v132.size.height = v57;
        CGRectGetMidX(v132);
        v133.origin.x = v54;
        v133.origin.y = v55;
        v133.size.width = v56;
        v133.size.height = v57;
        MidY = CGRectGetMidY(v133);
        objc_msgSend(v12, "objectForKeyedSubscript:", v53);
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = *(double *)(v59 + 384);
        v61 = *(double *)(v59 + 392);
        v62 = *(double *)(v59 + 400);
        v63 = *(double *)(v59 + 408);
        v134.origin.x = v60;
        v134.origin.y = v61;
        v134.size.width = v62;
        v134.size.height = v63;
        CGRectGetMidX(v134);
        v135.origin.x = v60;
        v135.origin.y = v61;
        v135.size.width = v62;
        v135.size.height = v63;
        objc_msgSend((id)v53, "setCenter:", v109, *(double *)(v59 + 592) - (CGRectGetMidY(v135) - MidY) * *(double *)(v53 + 608));
        objc_msgSend((id)v53, "setAlphaOrFilterLevel:", *(double *)(v53 + 608));
        v64 = *(double *)(v53 + 608);
        if (v64 == 1.0)
        {
          v65 = (_OWORD *)MEMORY[0x1E0CD2610];
          v66 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
          *(_OWORD *)(v53 + 520) = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
          *(_OWORD *)(v53 + 536) = v66;
          v67 = v65[7];
          *(_OWORD *)(v53 + 552) = v65[6];
          *(_OWORD *)(v53 + 568) = v67;
          v68 = v65[1];
          *(_OWORD *)(v53 + 456) = *v65;
          *(_OWORD *)(v53 + 472) = v68;
          v69 = v65[3];
          *(_OWORD *)(v53 + 488) = v65[2];
          *(_OWORD *)(v53 + 504) = v69;
        }
        else
        {
          if (v64 < 0.25)
            v64 = 0.25;
          CATransform3DMakeScale(&v123, v64, v64, 1.0);
          v78 = *(_OWORD *)&v123.m11;
          v79 = *(_OWORD *)&v123.m13;
          v80 = *(_OWORD *)&v123.m23;
          *(_OWORD *)(v53 + 488) = *(_OWORD *)&v123.m21;
          *(_OWORD *)(v53 + 504) = v80;
          *(_OWORD *)(v53 + 456) = v78;
          *(_OWORD *)(v53 + 472) = v79;
          v81 = *(_OWORD *)&v123.m31;
          v82 = *(_OWORD *)&v123.m33;
          v83 = *(_OWORD *)&v123.m43;
          *(_OWORD *)(v53 + 552) = *(_OWORD *)&v123.m41;
          *(_OWORD *)(v53 + 568) = v83;
          *(_OWORD *)(v53 + 520) = v81;
          *(_OWORD *)(v53 + 536) = v82;
        }

        v6 = v104;
        goto LABEL_46;
      }
      v71 = *(double *)(v53 + 384);
      v70 = *(double *)(v53 + 392);
      v72 = *(double *)(v53 + 400);
      v73 = *(double *)(v53 + 408);
      v74 = *(double *)(v53 + 352);
      v75 = *(double *)(v53 + 360);
      v76 = *(double *)(v53 + 368);
      v77 = *(double *)(v53 + 376);
      v136.origin.x = v71;
      v136.origin.y = v70;
      v136.size.width = v72;
      v136.size.height = v73;
      if (!CGRectIntersectsRect(v136, a3))
      {
        v137.origin.x = v74;
        v137.origin.y = v75;
        v137.size.width = v76;
        v137.size.height = v77;
        if (!CGRectIntersectsRect(v137, a3))
          continue;
      }
      v138.origin.x = v71;
      v138.origin.y = v70;
      v138.size.width = v72;
      v138.size.height = v73;
      CGRectGetMidX(v138);
      v139.origin.x = v71;
      v139.origin.y = v70;
      v139.size.width = v72;
      v139.size.height = v73;
      objc_msgSend((id)v53, "setCenter:", v109, CGRectGetMidY(v139));
      objc_msgSend((id)v53, "setSize:", v72, v73);
LABEL_46:
      objc_msgSend(v108, "addObject:", v53);
      continue;
    }
    v50 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v115, v125, 16);
  }
  while (v50);
LABEL_49:

  -[CKTranscriptCompositionalLayout decorationLayoutAttributes](v97, "decorationLayoutAttributes");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v111, v124, 16);
  if (v85)
  {
    v86 = v85;
    v87 = *(_QWORD *)v112;
    do
    {
      for (k = 0; k != v86; ++k)
      {
        if (*(_QWORD *)v112 != v87)
          objc_enumerationMutation(v84);
        v89 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * k);
        -[CKTranscriptCompositionalLayout collectionView](v97, "collectionView");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "bounds");
        objc_msgSend(v89, "setFrame:");

      }
      v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v111, v124, 16);
    }
    while (v86);
  }
  if (v103 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v91 = 0;
    v92 = v98;
  }
  else
  {
    v92 = v98;
    objc_msgSend(v98, "subarrayWithRange:", v103, v100);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v108)
  {
    objc_msgSend(v91, "arrayByAddingObjectsFromArray:", v108);
    v93 = objc_claimAutoreleasedReturnValue();

    v91 = (void *)v93;
  }
  if (v84)
  {
    objc_msgSend(v91, "arrayByAddingObjectsFromArray:", v84);
    v94 = objc_claimAutoreleasedReturnValue();

    v91 = (void *)v94;
  }

  return v91;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;

  v4 = a3;
  -[CKTranscriptCompositionalLayout layoutAttributes](self, "layoutAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptCompositionalLayout associatedLayoutAttributes](self, "associatedLayoutAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "section"))
    v7 = v6;
  else
    v7 = v5;
  v8 = v7;
  if (objc_msgSend(v8, "count") && (v9 = objc_msgSend(v4, "item"), v9 < objc_msgSend(v8, "count")))
  {
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v4, "item"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  -[CKTranscriptCompositionalLayout decorationLayoutAttributes](self, "decorationLayoutAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "section");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGSize)collectionViewContentSize
{
  double width;
  double height;
  CGSize result;

  if (self)
  {
    width = self->_contentSize.width;
    height = self->_contentSize.height;
  }
  else
  {
    height = 0.0;
    width = 0.0;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void)applyDynamicScrollResistanceToItemsForScrollDeltaY:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  size_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[CKTranscriptCompositionalLayout layoutAttributes](self, "layoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  MEMORY[0x1E0C80A78](v5);
  v7 = (_QWORD *)((char *)v10 - v6);
  bzero((char *)v10 - v6, v8);
  objc_msgSend(v4, "getObjects:range:", v7, 0, v5);
  for (; v5; --v5)
  {
    v9 = *v7++;
    *(double *)(v9 + 392) = *(double *)(v9 + 392) + a3;
  }

}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double width;
  double y;
  double x;
  BOOL v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  char v20;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  kdebug_trace();
  if (-[CKTranscriptCompositionalLayout isHoldingBoundsInvalidation](self, "isHoldingBoundsInvalidation"))
    return 0;
  -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentEffectForCollectionView:layout:", v15, self);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKTranscriptCompositionalLayout _dynamicsAreEnabled](self, "_dynamicsAreEnabled"))
  {
    v18 = y - v12;
    if (y - v12 != 0.0)
    {
      if (self)
        self->_displayDrivenDynamicsInitializationTime = 0.0;
      -[CKTranscriptCompositionalLayout applyDynamicScrollResistanceToItemsForScrollDeltaY:](self, "applyDynamicScrollResistanceToItemsForScrollDeltaY:", v18);
      -[CKTranscriptCompositionalLayout _kickDynamicsIfNeeded](self, "_kickDynamicsIfNeeded");
    }
  }
  if (v17
    || (+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", v18),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "shouldUseRotisserieScrolling"),
        v19,
        (v20 & 1) != 0)
    || v14 != width
    || v10 != x)
  {
    kdebug_trace();
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_dynamicsAreEnabled
{
  void *v3;
  int v4;
  BOOL v5;
  void *v6;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldUseDynamicScrolling");

  if (!v4 || -[CKTranscriptCompositionalLayout isInBackground](self, "isInBackground"))
    return 0;
  -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_msgSend(v6, "dynamicsDisabled") & 1) == 0
    && (-[IMScheduledUpdater isHoldingUpdates](self->_dynamicsUpdater, "isHoldingUpdates") & 1) == 0
    && (!-[CKTranscriptCompositionalLayout disableDynamicsWhileScrolling](self, "disableDynamicsWhileScrolling")
     || !-[CKTranscriptCompositionalLayout isResting](self, "isResting"));

  return v5;
}

- (void)reloadData
{
  void *v3;

  -[CKTranscriptCompositionalLayout setLayoutAttributes:](self, "setLayoutAttributes:", 0);
  -[CKTranscriptCompositionalLayout associatedLayoutAttributes](self, "associatedLayoutAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptCompositionalLayout setOldAssociatedLayoutAttributes:](self, "setOldAssociatedLayoutAttributes:", v3);

  -[CKTranscriptCompositionalLayout setAssociatedLayoutAttributes:](self, "setAssociatedLayoutAttributes:", 0);
  -[CKTranscriptCompositionalLayout setDecorationLayoutAttributes:](self, "setDecorationLayoutAttributes:", 0);
}

- (void)updateAssociatedLayoutAttributesIfNecessary
{
  id v2;

  v2 = -[CKTranscriptCompositionalLayout layoutAttributes](self, "layoutAttributes");
}

- (void)invalidateDisplayLink
{
  if (self)
  {
    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    -[CKTranscriptCompositionalLayout setDisplayLink:]((uint64_t)self, 0);
    self->_previousFrameTimestamp = 0.0;
    self->_currentFrameTimestamp = 0.0;
    self->_displayDrivenDynamicsInitializationTime = 0.0;
  }
  else
  {
    objc_msgSend(0, "invalidate");
    -[CKTranscriptCompositionalLayout setDisplayLink:](0, 0);
  }
  -[CKTranscriptCompositionalLayout removeUpdateSequenceItem](self, "removeUpdateSequenceItem");
}

- (void)removeUpdateSequenceItem
{
  if (_UIUpdateCycleEnabled())
  {
    if (self->_dynamicsUpdateSequenceItem)
    {
      _UIUpdateSequenceRemoveItem();
      self->_dynamicsUpdateSequenceItem = 0;
      _UIUpdateRequestDeactivate();
    }
  }
}

- (void)reloadLayout
{
  -[CKTranscriptCompositionalLayout reloadData](self, "reloadData");
  -[CKTranscriptCompositionalLayout invalidateLayout](self, "invalidateLayout");
}

- (void)setInitialIndex:(unint64_t)a3 forParentOfAssociatedItemInsertedAtIndex:(unint64_t)a4
{
  NSArray *layoutAttributes;
  NSMutableDictionary *initialParentLayoutAttributes;
  void *v9;
  id v10;

  layoutAttributes = self->_layoutAttributes;
  if (layoutAttributes)
  {
    if (-[NSArray count](layoutAttributes, "count") > a3)
    {
      initialParentLayoutAttributes = self->_initialParentLayoutAttributes;
      -[NSArray objectAtIndex:](self->_layoutAttributes, "objectAtIndex:", a3);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](initialParentLayoutAttributes, "setObject:forKey:", v10, v9);

    }
  }
}

- (void)setVerticalOffset:(double)a3 forParentOfAssociatedItemDeletedAtIndex:(unint64_t)a4
{
  NSMutableDictionary *finalParentVerticalOffsets;
  void *v6;
  id v7;

  finalParentVerticalOffsets = self->_finalParentVerticalOffsets;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](finalParentVerticalOffsets, "setObject:forKey:", v7, v6);

}

- (void)clearParentInitialIndexesAndFinalOffsets
{
  -[NSMutableDictionary removeAllObjects](self->_initialParentLayoutAttributes, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_finalParentVerticalOffsets, "removeAllObjects");
}

- (NSArray)layoutAttributes
{
  CKTranscriptCompositionalLayout *v2;
  NSArray **p_layoutAttributes;
  NSArray *layoutAttributes;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  uint64_t v36;
  NSArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  uint64_t v42;
  void *v43;
  _QWORD *v44;
  CKTranscriptCompositionalLayout *v45;
  _QWORD *v46;
  NSMutableDictionary *initialParentLayoutAttributes;
  void *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  _QWORD *v59;
  _QWORD *v60;
  NSMutableDictionary *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  NSArray *v74;
  uint64_t v75;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  NSArray *decorationLayoutAttributes;
  void *v97;
  void *v98;
  NSArray *v99;
  void *v100;
  id v101;
  id v102;
  void *v103;
  NSArray *associatedLayoutAttributes;
  NSArray *v105;
  id *location;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  id v112;
  id v113;
  void *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  uint64_t v122;
  NSArray *v123;
  id obj;
  CKTranscriptCompositionalLayout *v125;
  objc_super v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  objc_super v131;
  uint8_t v132[128];
  uint8_t buf[4];
  const char *v134;
  __int16 v135;
  void *v136;
  __int16 v137;
  id v138;
  uint64_t v139;

  v2 = self;
  v139 = *MEMORY[0x1E0C80C00];
  p_layoutAttributes = &self->_layoutAttributes;
  layoutAttributes = self->_layoutAttributes;
  if (!layoutAttributes)
  {
    location = (id *)p_layoutAttributes;
    -[CKTranscriptCompositionalLayout collectionView](v2, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentEffectForCollectionView:layout:", v5, v2);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isDiffableTranscriptDataSourceEnabled");

    if (v8)
      v9 = objc_msgSend(v5, "numberOfItemsInSection:", 0);
    else
      v9 = objc_msgSend(v6, "collectionView:numberOfItemsInSection:", v5, 0);
    v10 = v9;
    v113 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
    v123 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v108 = v5;
    v118 = v6;
    v125 = v2;
    if (v10)
    {
      v11 = 0;
      v122 = *MEMORY[0x1E0C99750];
      v109 = v10;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v11, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v11, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v131.receiver = v2;
        v131.super_class = (Class)CKTranscriptCompositionalLayout;
        -[CKTranscriptCompositionalLayout layoutAttributesForItemAtIndexPath:](&v131, sel_layoutAttributesForItemAtIndexPath_, v13);
        v14 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v118, "collectionView:layout:chatItemForItemAtIndexPath:", v5, v2, v12);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v14)
        {
          objc_msgSend((id)v14, "setChatItem:", v15);
          v121 = v16;
          objc_msgSend((id)v14, "frame");
          *(_QWORD *)(v14 + 352) = v17;
          *(_QWORD *)(v14 + 360) = v18;
          *(_QWORD *)(v14 + 368) = v19;
          *(_QWORD *)(v14 + 376) = v20;
          objc_msgSend((id)v14, "frame");
          *(_QWORD *)(v14 + 384) = v21;
          *(_QWORD *)(v14 + 392) = v22;
          *(_QWORD *)(v14 + 400) = v23;
          *(_QWORD *)(v14 + 408) = v24;
          objc_msgSend((id)v14, "center");
          *(_QWORD *)(v14 + 592) = v25;
          objc_msgSend((id)v14, "center");
          *(_QWORD *)(v14 + 584) = v26;
          *(_QWORD *)(v14 + 608) = 0x3FF0000000000000;
          *(_BYTE *)(v14 + 616) = 0;
          objc_msgSend((id)v14, "frame");
          *(_QWORD *)(v14 + 600) = v27;
          objc_msgSend(v113, "addObject:", v14);
          if (!v11)
          {
            objc_opt_class();
            -[CKTranscriptCompositionalLayout setHasLoadMore:](v2, "setHasLoadMore:", objc_opt_isKindOfClass() & 1);
          }
          v28 = v16;
          objc_opt_class();
          v29 = v28;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v28, "previousPluginChatItem");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v30;
            v29 = v28;
            if (v30)
            {
              v29 = v30;

            }
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v29, "isAppearing"))
            objc_msgSend((id)v14, "setAlphaOrFilterLevel:", 0.0);
          v119 = v29;
          -[CKTranscriptCompositionalLayout _updateAttributeZIndex:forEffect:](v2, "_updateAttributeZIndex:forEffect:", v14, v120);
          objc_msgSend(v28, "visibleAssociatedMessageChatItems");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          +[CKPrintController sharedInstance](CKPrintController, "sharedInstance");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "isPrinting");

          obj = 0;
          if (v32 && (v34 & 1) == 0)
          {
            v111 = v12;
            v112 = v28;
            v110 = v14;
            v116 = v11;
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            obj = (id)objc_claimAutoreleasedReturnValue();
            v127 = 0u;
            v128 = 0u;
            v129 = 0u;
            v130 = 0u;
            v114 = v32;
            v35 = v32;
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v127, v132, 16);
            v37 = v123;
            if (v36)
            {
              v38 = v36;
              v39 = *(_QWORD *)v128;
              do
              {
                for (i = 0; i != v38; ++i)
                {
                  if (*(_QWORD *)v128 != v39)
                    objc_enumerationMutation(v35);
                  v41 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * i);
                  v42 = -[NSArray count](v37, "count");
                  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v42, 1);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  v126.receiver = v2;
                  v126.super_class = (Class)CKTranscriptCompositionalLayout;
                  -[CKTranscriptCompositionalLayout layoutAttributesForItemAtIndexPath:](&v126, sel_layoutAttributesForItemAtIndexPath_, v43);
                  v44 = (_QWORD *)objc_claimAutoreleasedReturnValue();
                  v45 = v2;
                  v46 = v44;
                  if (v44)
                  {
                    objc_msgSend(v44, "setChatItem:", v41);
                    initialParentLayoutAttributes = v45->_initialParentLayoutAttributes;
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v42);
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSMutableDictionary objectForKey:](initialParentLayoutAttributes, "objectForKey:", v48);
                    v49 = objc_claimAutoreleasedReturnValue();
                    v50 = (void *)v46[80];
                    v46[80] = v49;

                    objc_msgSend(obj, "addObject:", v46);
                    -[NSArray addObject:](v37, "addObject:", v46);
                  }
                  else
                  {
                    IMLogHandleForCategory();
                    v51 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315650;
                      v134 = "-[CKTranscriptCompositionalLayout layoutAttributes]";
                      v135 = 2112;
                      v136 = v43;
                      v137 = 2112;
                      v138 = v41;
                      _os_log_error_impl(&dword_18DFCD000, v51, OS_LOG_TYPE_ERROR, "%s (associatedLayoutAttributes) got nil attribute for %@ item %@", buf, 0x20u);
                    }

                    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v122, CFSTR("CKTranscriptCompositionalLayout's super implementation is out of sync with CKTranscriptCompositionalLayout. Got nil layout attributes for associated item. If allowed to continue, this would be a fatal crash. Please file a radar."), 0);
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    IMLogSimulateCrashForException();

                    v37 = v123;
                  }

                  v2 = v125;
                }
                v38 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v127, v132, 16);
              }
              while (v38);
            }

            v5 = v108;
            v10 = v109;
            v32 = v114;
            v11 = v116;
            v14 = v110;
            v12 = v111;
            v28 = v112;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v53 = v14;
            v54 = v5;
            v55 = v12;
            objc_msgSend(v28, "messageHighlightChatItem");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            if (v56)
            {
              v117 = v11;
              v57 = -[NSArray count](v123, "count");
              objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v57, 1);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:](CKTranscriptCollectionViewLayoutAttributes, "layoutAttributesForCellWithIndexPath:");
              v59 = (_QWORD *)objc_claimAutoreleasedReturnValue();
              v60 = v59;
              if (v59)
              {
                v115 = v32;
                objc_msgSend(v59, "setChatItem:", v56);
                v61 = v2->_initialParentLayoutAttributes;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v57);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary objectForKey:](v61, "objectForKey:", v62);
                v63 = objc_claimAutoreleasedReturnValue();
                v64 = (void *)v60[80];
                v60[80] = v63;

                -[NSArray addObject:](v123, "addObject:", v60);
                v65 = obj;
                if (!obj)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                }
                obj = v65;
                objc_msgSend(v65, "addObject:", v60);
                v66 = v121;
                v32 = v115;
              }
              else
              {
                IMLogHandleForCategory();
                v70 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v134 = "-[CKTranscriptCompositionalLayout layoutAttributes]";
                  v135 = 2112;
                  v136 = v58;
                  v137 = 2112;
                  v138 = v28;
                  _os_log_error_impl(&dword_18DFCD000, v70, OS_LOG_TYPE_ERROR, "%s (highlightChatItem) got nil attribute for %@ item %@", buf, 0x20u);
                }

                objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v122, CFSTR("CKTranscriptCompositionalLayout's super implementation is out of sync with CKTranscriptCompositionalLayout. Got nil layout attributes for highlight item. If allowed to continue, this would be a fatal crash. Please file a radar."), 0);
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                IMLogSimulateCrashForException();

                v66 = v121;
              }

              v10 = v109;
              v11 = v117;
            }
            else
            {
              v66 = v121;
            }

            v12 = v55;
            v5 = v54;
            v14 = v53;
          }
          else
          {
            v66 = v121;
          }
          v72 = obj;
          if (obj)
          {
            objc_storeStrong((id *)(v14 + 632), obj);
            -[CKTranscriptCompositionalLayout _updateAssociatedAttributeFramesForPrimaryAttribute:](v2, "_updateAssociatedAttributeFramesForPrimaryAttribute:", v14);
            v72 = obj;
          }

          v69 = v119;
        }
        else
        {
          v67 = (void *)v15;
          IMLogHandleForCategory();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v134 = "-[CKTranscriptCompositionalLayout layoutAttributes]";
            v135 = 2112;
            v136 = v12;
            v137 = 2112;
            v138 = v67;
            _os_log_error_impl(&dword_18DFCD000, v68, OS_LOG_TYPE_ERROR, "%s (compAttributes) got nil attribute for %@ item %@", buf, 0x20u);
          }

          objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v122, CFSTR("CKTranscriptCompositionalLayout's super implementation is out of sync with CKTranscriptCompositionalLayout. Got nil layout attributes. If allowed to continue, this would be a fatal crash. Please file a radar."), 0);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          IMLogSimulateCrashForException();
          v66 = v67;
        }

        ++v11;
      }
      while (v11 != v10);
    }
    -[CKTranscriptCompositionalLayout _configureThreadGroupsForAttributes:outMaxYAnchorAttribute:forVisibleBounds:](v2, "_configureThreadGroupsForAttributes:outMaxYAnchorAttribute:forVisibleBounds:", v113, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v73 = v120;
    if (!v2->_decorationLayoutAttributes && v120)
    {
      v74 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v75 = objc_msgSend(v120, "layerCount");
      v76 = objc_msgSend(v120, "shouldDrawOverNavigationBar");
      if (v75)
        v77 = v76;
      else
        v77 = 0;
      v78 = v75 - v77;
      if (v75 != v77)
      {
        v79 = 0;
        do
        {
          if (objc_msgSend(v73, "effectViewClass"))
          {
            v80 = (void *)MEMORY[0x1E0CEA460];
            +[CKFullscreenEffectDecorationView decorationViewKind](CKFullscreenEffectDecorationView, "decorationViewKind");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v79);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "layoutAttributesForDecorationViewOfKind:withIndexPath:", v81, v82);
            v83 = (void *)objc_claimAutoreleasedReturnValue();

            v2 = v125;
            -[CKTranscriptCompositionalLayout collectionView](v125, "collectionView");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "bounds");
            v86 = v85;
            v88 = v87;
            v90 = v89;
            v92 = v91;

            objc_msgSend(v83, "setFrame:", v86, v88, v90, v92);
            v93 = objc_msgSend(v120, "isForegroundEffect");
            if (v78 - 1 == v79)
              v94 = 3000;
            else
              v94 = 1000;
            if (!v79)
              v94 = -2000;
            if ((v93 & 1) != 0)
              v95 = 3000;
            else
              v95 = v94;
            objc_msgSend(v83, "setZIndex:", v95);
            -[NSArray addObject:](v74, "addObject:", v83);

            v73 = v120;
          }
          ++v79;
        }
        while (v78 != v79);
      }
      decorationLayoutAttributes = v2->_decorationLayoutAttributes;
      v2->_decorationLayoutAttributes = v74;

      v5 = v108;
    }
    objc_storeStrong(location, v113);
    -[CKTranscriptCompositionalLayout oldAssociatedLayoutAttributes](v2, "oldAssociatedLayoutAttributes");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (v97)
      -[CKTranscriptCompositionalLayout oldAssociatedLayoutAttributes](v2, "oldAssociatedLayoutAttributes");
    else
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    v99 = v123;
    if (!v123)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v99 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    -[NSArray differenceFromArray:withOptions:usingEquivalenceTest:](v99, "differenceFromArray:withOptions:usingEquivalenceTest:", v98, 0, &__block_literal_global_99_3);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    IMIndexesFromOrderedCollectionDifference();
    v101 = 0;
    v102 = 0;
    v103 = (void *)objc_msgSend(v101, "mutableCopy");
    -[CKTranscriptCompositionalLayout setInsertedAssociatedLayoutAttributes:](v125, "setInsertedAssociatedLayoutAttributes:", v103);

    -[CKTranscriptCompositionalLayout setOldAssociatedLayoutAttributes:](v125, "setOldAssociatedLayoutAttributes:", 0);
    associatedLayoutAttributes = v125->_associatedLayoutAttributes;
    v125->_associatedLayoutAttributes = v99;
    v105 = v99;

    -[CKTranscriptCompositionalLayout updateContentSize](v125, "updateContentSize");
    -[CKTranscriptCompositionalLayout _applyTargetFrameOffsetsForLayoutAttributesIfNeeded:](v125, "_applyTargetFrameOffsetsForLayoutAttributesIfNeeded:", *location);
    -[CKTranscriptCompositionalLayout _applyCurrentFrameOffsetsForLayoutAttributesIfNeeded:](v125, "_applyCurrentFrameOffsetsForLayoutAttributesIfNeeded:", *location);

    layoutAttributes = (NSArray *)*location;
  }
  return layoutAttributes;
}

uint64_t __51__CKTranscriptCompositionalLayout_layoutAttributes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "chatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chatItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqual:", v6);
  return v7;
}

- (void)_updateAttributeZIndex:(id)a3 forEffect:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  v6 = a4;
  objc_msgSend(v20, "chatItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "layerCount"))
  {
    v8 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "triggeringChatItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if ((v10 & 1) != 0)
      {
        v11 = 4000;
LABEL_7:
        objc_msgSend(v20, "setZIndex:", v11);
        goto LABEL_8;
      }
      if (objc_msgSend(v8, "isFromMe"))
      {
        v11 = 2000;
        goto LABEL_7;
      }
    }
LABEL_8:

  }
  if (objc_msgSend(v7, "isEditedMessageHistory"))
    objc_msgSend(v20, "setZIndex:", -1000);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isExpressiveTextEnabled");

  if (v13)
  {
    -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "indexPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "collectionViewLayout:hasPlayingOrPausedTextEffectForChatItem:indexPath:", self, v7, v16);

    if (v17)
    {
      v18 = objc_msgSend(v20, "zIndex");
      if (v18 <= 3000)
        v19 = 3000;
      else
        v19 = v18;
      objc_msgSend(v20, "setZIndex:", v19);
    }

  }
}

- (void)_updateAssociatedAttributeFramesForPrimaryAttribute:(id)a3
{
  id *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  double v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double MaxY;
  void *v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double MidX;
  double MidY;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t j;
  uint64_t v92;
  void *v93;
  double v94;
  void *v95;
  id v96;
  CGFloat v97;
  id v98;
  uint64_t v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double rect;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD v111[4];
  id *v112;
  CGAffineTransform v113;
  uint64_t v114;
  CGAffineTransform v115;
  uint64_t v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;

  v123 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v95 = v5;
  objc_msgSend(v5, "marginInsets");
  v103 = v9;
  v104 = v8;
  v10 = v4[82];
  objc_msgSend(v4, "frame");
  v102 = v11;
  v13 = v12;
  rect = v14;
  v16 = v15;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v17 = v4[79];
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v117, v122, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v99 = 0;
    v21 = *(_QWORD *)v118;
    v22 = *MEMORY[0x1E0C9D648];
    v97 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v105 = *MEMORY[0x1E0C9D538];
    v100 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v101 = v13;
    v98 = v17;
    while (1)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v118 != v21)
          objc_enumerationMutation(v17);
        v24 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * i);
        objc_msgSend((id)v24, "chatItem");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "size");
        v27 = v26;
        objc_msgSend(v25, "contentInsets");
        v116 = 0;
        v30 = v27 + v104 + v28 + v103 + v29;
        memset(&v115, 0, sizeof(v115));
        if (!v25)
          goto LABEL_18;
        objc_msgSend(v25, "geometryDescriptor");
        if (*(_QWORD *)&v115.a == 11)
        {
          v124.origin.x = v102;
          v124.origin.y = v13;
          v124.size.width = rect;
          v124.size.height = v16;
          MaxY = CGRectGetMaxY(v124);
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "messageHighlightTranscriptBalloonRelativePosition");
          v58 = MaxY - v62;

          v32 = v105;
          goto LABEL_32;
        }
        if (*(_QWORD *)&v115.a == 10)
        {
          objc_opt_class();
          v31 = v100;
          v32 = v105;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v96 = v20;
            v33 = v10;
            objc_msgSend(v33, "layoutRecipe");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "size");
            v37 = rect / v35;
            if (v35 == 0.0)
              v37 = 0.0;
            v38 = v16 / v36;
            if (v36 == 0.0)
              v38 = 0.0;
            v39 = fmin(v37, v38);
            v40 = v35 * v39;
            v41 = v36 * v39 * -0.5;
            if (objc_msgSend(v33, "transcriptOrientation"))
            {
              if (objc_msgSend(v33, "transcriptOrientation") == 2)
              {
                v42 = v40 * -0.5;
              }
              else
              {
                v41 = v100;
                v42 = v105;
              }
            }
            else
            {
              v42 = v40 * 0.5;
            }
            memset(&v113, 0, sizeof(v113));
            objc_msgSend(v34, "rotation");
            CGAffineTransformMakeRotation(&v113, v63 * 3.14159265 / 180.0);
            v64 = v113.tx + v41 * v113.c + v113.a * v42 - v42;
            v65 = v113.ty + v41 * v113.d + v113.b * v42 - v41;
            +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "messageAcknowledgmentTranscriptOrganicBalloonAdditionalOffset");
            v68 = v67;
            v70 = v69;

            v31 = v70 - v65;
            if (objc_msgSend(v33, "transcriptOrientation"))
            {
              if (objc_msgSend(v33, "transcriptOrientation") == 2)
              {
                v32 = v64 + v68;
              }
              else
              {
                v31 = v100;
                v32 = v105;
              }
            }
            else
            {
              v32 = v64 - v68;
            }
            v17 = v98;

            v13 = v101;
            v20 = v96;
          }
          v125.origin.x = v22;
          v125.origin.y = v97;
          v125.size.width = v7;
          v125.size.height = v30;
          v71 = v13 - CGRectGetHeight(v125);
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "messageAcknowledgmentTranscriptBalloonRelativePosition");
          v58 = v71 - v73 - v31;

        }
        else
        {
LABEL_18:
          objc_msgSend(v25, "adjustedParentFrameForPositioning:", v102, v13, rect, v16);
          v44 = v43;
          v46 = v45;
          v48 = v47;
          v50 = v49;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v25, "isReaction"))
          {
            v51 = objc_msgSend(v10, "itemIsFromMe");
            objc_msgSend(v10, "stickerReactionInsets");
            v52 = v51;
            v17 = v98;
            +[CKAssociatedMessageChatItem locationForStickerReactionWithParentFrame:reactionIndex:parentIsFromMe:insets:](CKAssociatedMessageChatItem, "locationForStickerReactionWithParentFrame:reactionIndex:parentIsFromMe:insets:", v99, v52, v44, v46, v48, v50, v53, v54, v55, v56);
            v58 = v57;
            objc_msgSend(v25, "setStickerReactionIndex:", v99++);
          }
          else
          {
            v113 = v115;
            v114 = v116;
            +[CKAssociatedMessageChatItem verticalOriginForAssociatedMessageItemSize:parentFrame:geometryDescriptor:](CKAssociatedMessageChatItem, "verticalOriginForAssociatedMessageItemSize:parentFrame:geometryDescriptor:", &v113, v7, v30, v44, v46, v48, v50);
            v58 = v59;
          }
          v32 = v105;
          v13 = v101;
        }
LABEL_32:
        objc_msgSend((id)v24, "setFrame:", v22, v58, v7, v30);
        *(double *)(v24 + 384) = v22;
        *(double *)(v24 + 392) = v58;
        *(double *)(v24 + 400) = v7;
        *(double *)(v24 + 408) = v30;
        *(double *)(v24 + 352) = v22;
        *(double *)(v24 + 360) = v58;
        *(double *)(v24 + 368) = v7;
        *(double *)(v24 + 376) = v30;
        v126.origin.x = v22;
        v126.origin.y = v58;
        v126.size.width = v7;
        v126.size.height = v30;
        MidX = CGRectGetMidX(v126);
        v127.origin.x = v22;
        v127.origin.y = v58;
        v127.size.width = v7;
        v127.size.height = v30;
        MidY = CGRectGetMidY(v127);
        objc_msgSend((id)v24, "setCenter:", MidX, MidY);
        *(double *)(v24 + 584) = MidY;
        *(double *)(v24 + 592) = MidY;
        *(_QWORD *)(v24 + 608) = v4[76];
        *(_BYTE *)(v24 + 616) = *((_BYTE *)v4 + 616);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v20)
            v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v20, "addObject:", v24);
        }
        else
        {
          objc_msgSend((id)v24, "setZIndex:", objc_msgSend(v4, "zIndex") + 1);
        }
        objc_msgSend(v10, "size");
        v77 = v76;
        v79 = v78;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "layoutRecipe");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = v80;
          v82 = rect / v77;
          if (v77 == 0.0)
            v82 = 0.0;
          v83 = v16 / v79;
          if (v79 == 0.0)
            v83 = 0.0;
          v84 = fmin(v82, v83);
          v85 = v77 * v84;
          v79 = v79 * v84;
          objc_msgSend(v80, "offset");
          v77 = v85 + v86;

        }
        objc_msgSend((id)v24, "setParentChatItemSize:", v77, v79);
        objc_msgSend((id)v24, "setParentRotationOffset:", v32);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v117, v122, 16);
      if (!v19)
      {

        if (v20)
        {
          objc_msgSend(v20, "sortedArrayUsingComparator:", &__block_literal_global_104_2);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          v111[0] = MEMORY[0x1E0C809B0];
          v111[1] = 3221225472;
          v111[2] = __87__CKTranscriptCompositionalLayout__updateAssociatedAttributeFramesForPrimaryAttribute___block_invoke_2;
          v111[3] = &unk_1E2757640;
          v112 = v4;
          objc_msgSend(v17, "enumerateObjectsUsingBlock:", v111);

          goto LABEL_48;
        }
        goto LABEL_49;
      }
    }
  }
  v20 = 0;
LABEL_48:

LABEL_49:
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v87 = v4[79];
  v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v107, v121, 16);
  if (v88)
  {
    v89 = v88;
    v90 = *(_QWORD *)v108;
    do
    {
      for (j = 0; j != v89; ++j)
      {
        if (*(_QWORD *)v108 != v90)
          objc_enumerationMutation(v87);
        v92 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * j);
        v93 = *(void **)(v92 + 640);
        if (v93)
        {
          objc_msgSend(v93, "frame");
          *(double *)(v92 + 624) = v13 - v94;
        }
      }
      v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v107, v121, 16);
    }
    while (v89);
  }

}

uint64_t __87__CKTranscriptCompositionalLayout__updateAssociatedAttributeFramesForPrimaryAttribute___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "chatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chatItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "time");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "time");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  return v9;
}

void __87__CKTranscriptCompositionalLayout__updateAssociatedAttributeFramesForPrimaryAttribute___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v9 = a2;
  v6 = a3 + objc_msgSend(v5, "zIndex") + 2;
  v7 = objc_msgSend(*(id *)(a1 + 32), "zIndex");
  if (v6 >= v7 + 999)
    v8 = v7 + 999;
  else
    v8 = v6;
  objc_msgSend(v9, "setZIndex:", v8);

}

- (void)_configureThreadGroupsForAttributes:(id)a3 outMaxYAnchorAttribute:(id *)a4 forVisibleBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  uint64_t v14;
  uint64_t i;
  id *v16;
  id *v17;
  id v18;
  int isKindOfClass;
  void *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  void *v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  char v30;
  _BOOL4 v31;
  int v32;
  _BOOL4 v33;
  id v34;
  void *v35;
  int v36;
  id v37;
  void *v38;
  id *v39;
  id v40;
  void (**v41)(_QWORD);
  void (**v42)(void *, id *, id);
  void *v43;
  int v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[11];
  _QWORD aBlock[7];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  id *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  _QWORD v67[5];
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  _BYTE v75[128];
  uint64_t v76;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v76 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (!-[CKTranscriptCompositionalLayout isUsingOverlayLayout](self, "isUsingOverlayLayout"))
  {
    v39 = a4;
    v40 = v11;
    v69 = 0;
    v70 = &v69;
    v71 = 0x3032000000;
    v72 = __Block_byref_object_copy__53;
    v73 = __Block_byref_object_dispose__53;
    v74 = 0;
    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x3032000000;
    v67[3] = __Block_byref_object_copy__53;
    v67[4] = __Block_byref_object_dispose__53;
    v68 = 0;
    v61 = 0;
    v62 = (id *)&v61;
    v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__53;
    v65 = __Block_byref_object_dispose__53;
    v66 = 0;
    v55 = 0;
    v56 = &v55;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__53;
    v59 = __Block_byref_object_dispose__53;
    v60 = 0;
    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __111__CKTranscriptCompositionalLayout__configureThreadGroupsForAttributes_outMaxYAnchorAttribute_forVisibleBounds___block_invoke;
    aBlock[3] = &unk_1E2757668;
    aBlock[4] = &v69;
    aBlock[5] = &v61;
    aBlock[6] = v67;
    v42 = (void (**)(void *, id *, id))_Block_copy(aBlock);
    v53[0] = v12;
    v53[1] = 3221225472;
    v53[2] = __111__CKTranscriptCompositionalLayout__configureThreadGroupsForAttributes_outMaxYAnchorAttribute_forVisibleBounds___block_invoke_2;
    v53[3] = &unk_1E2757690;
    v53[4] = &v69;
    v53[5] = &v61;
    *(CGFloat *)&v53[7] = x;
    *(CGFloat *)&v53[8] = y;
    *(CGFloat *)&v53[9] = width;
    *(CGFloat *)&v53[10] = height;
    v53[6] = &v55;
    v13 = (void (**)(_QWORD))_Block_copy(v53);
    v45 = -[CKTranscriptCompositionalLayout chatStyle](self, "chatStyle");
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v11;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v75, 16);
    if (v14)
    {
      v46 = *(_QWORD *)v50;
      v41 = v13;
      do
      {
        v47 = v14;
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v50 != v46)
            objc_enumerationMutation(obj);
          v16 = *(id **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(obj, "lastObject");
          v17 = (id *)objc_claimAutoreleasedReturnValue();

          v18 = v16[82];
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          objc_opt_class();
          if (((objc_opt_isKindOfClass() | isKindOfClass) & 1) != 0)
          {
            objc_msgSend(v18, "IMChatItem");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v21 = objc_opt_isKindOfClass();
            v22 = objc_msgSend(v20, "itemIsThreadOriginator");
            v23 = isKindOfClass ^ 1;
            v24 = (objc_msgSend(v20, "itemIsReplyContextPreview") | v22 & v23) & (v21 ^ 1);
            v25 = (void *)v70[5];
            if (v25 || !v24)
            {
              if (objc_msgSend(v25, "count"))
              {
                v44 = v24;
                objc_msgSend(v20, "threadGroupIdentifier");
                v26 = objc_claimAutoreleasedReturnValue();
                v27 = IMMessageThreadIdentifierOriginatorGUIDAndPartMatch();
                v28 = objc_msgSend(v20, "isFromMe");
                v29 = objc_msgSend(v20, "itemIsReply");
                if (v45 == 45)
                  v30 = v28;
                else
                  v30 = 1;
                v43 = (void *)v26;
                if ((v30 & 1) != 0)
                  v31 = 0;
                else
                  v31 = objc_msgSend(v18, "contiguousType") == 2
                     || objc_msgSend(v18, "contiguousType") == 3;
                v32 = v27 ^ 1 | objc_msgSend(v18, "itemIsReplyContextPreview") | v31;
                v13 = v41;
                if ((v32 & 1) == 0)
                {
                  objc_msgSend((id)v70[5], "addObject:", v16);
                  objc_storeStrong(v62 + 5, v16);
                }
                v33 = objc_msgSend(v18, "chatItemReplyLineContiguousTypeForChatStyle:", v45) != 0;
                if (!v29 || (v33 & ~v28 & v23) != 0)
                {
                  if ((unint64_t)objc_msgSend((id)v70[5], "count") >= 2)
                    v41[2](v41);
                  v34 = v62[5];
                  v62[5] = 0;

                  v35 = (void *)v70[5];
                  v70[5] = 0;

                  if (v16 != v17 && v29 | v44)
                    v42[2](v42, v16, v18);
                }

              }
            }
            else
            {
              v42[2](v42, v16, v18);
            }

          }
          if (objc_msgSend((id)v70[5], "count"))
          {
            objc_opt_class();
            v36 = objc_opt_isKindOfClass();
            objc_opt_class();
            if ((v36 & ~objc_opt_isKindOfClass() & 1) != 0 || v16 == v17)
            {
              v13[2](v13);
              v37 = v62[5];
              v62[5] = 0;

              v38 = (void *)v70[5];
              v70[5] = 0;

            }
          }

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v75, 16);
      }
      while (v14);
    }

    if (v39)
      *v39 = objc_retainAutorelease((id)v56[5]);

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(&v61, 8);

    _Block_object_dispose(v67, 8);
    _Block_object_dispose(&v69, 8);

    v11 = v40;
  }

}

void __111__CKTranscriptCompositionalLayout__configureThreadGroupsForAttributes_outMaxYAnchorAttribute_forVisibleBounds___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = objc_opt_new();
  v8 = *(_QWORD *)(a1[4] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "addObject:", v5);
  v10 = *(_QWORD *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;
  v12 = v5;

  objc_msgSend(v6, "IMChatItem");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "threadGroupIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1[6] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

void __111__CKTranscriptCompositionalLayout__configureThreadGroupsForAttributes_outMaxYAnchorAttribute_forVisibleBounds___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double MaxY;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v2 = 0;
  v28 = *MEMORY[0x1E0C80C00];
  while (1)
  {
    v3 = v2;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "lastObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "lastObject");
      v5 = (id *)objc_claimAutoreleasedReturnValue();
      v6 = v5[82];

    }
    else
    {
      v6 = 0;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "removeLastObject");
    if (v2 == *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "lastObject");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
    if (!v2)
      goto LABEL_11;
  }

LABEL_11:
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);

  if (v10 == v11)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "removeLastObject");
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count"))
  {
    v12 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "copy");
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v14 = *(void **)(v13 + 648);
    *(_QWORD *)(v13 + 648) = v12;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
LABEL_16:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        if (CGRectIntersectsRect(*(CGRect *)(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19) + 384), *(CGRect *)(a1 + 56)))
        {
          break;
        }
        if (v17 == ++v19)
        {
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v17)
            goto LABEL_16;
          goto LABEL_27;
        }
      }

      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      if (*(_QWORD *)(v20 + 40))
      {
        MaxY = CGRectGetMaxY(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 384));
        if (MaxY <= CGRectGetMaxY(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 384)))
          return;
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      }
      v22 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v15 = *(id *)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v22;
    }
LABEL_27:

  }
}

- (void)updateContentSize
{
  CGRect *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double MaxY;
  CGRect *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[5];
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  CGSize v33;

  v32 = *MEMORY[0x1E0C80C00];
  -[NSArray lastObject](self->_layoutAttributes, "lastObject");
  v3 = (CGRect *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v3)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__53;
    v30 = __Block_byref_object_dispose__53;
    v31 = 0;
    -[CKTranscriptCompositionalLayout associatedLayoutAttributes](self, "associatedLayoutAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v31 = (id)objc_claimAutoreleasedReturnValue();

    -[CKTranscriptCompositionalLayout associatedLayoutAttributes](self, "associatedLayoutAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __52__CKTranscriptCompositionalLayout_updateContentSize__block_invoke;
    v26[3] = &unk_1E27576B8;
    v26[4] = &buf;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v26);

    MaxY = CGRectGetMaxY(v3[11]);
    v9 = *(CGRect **)(*((_QWORD *)&buf + 1) + 40);
    if (v9)
    {
      v10 = CGRectGetMaxY(v9[11]);
      if (MaxY < v10)
        MaxY = v10;
    }
    -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayScale");
    v14 = v13;
    if (v13 == 0.0)
    {
      if (CKMainScreenScale_once_67 != -1)
        dispatch_once(&CKMainScreenScale_once_67, &__block_literal_global_402_0);
      if (*(double *)&CKMainScreenScale_sMainScreenScale_67 == 0.0)
        v14 = 1.0;
      else
        v14 = *(double *)&CKMainScreenScale_sMainScreenScale_67;
    }

    -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;

    -[CKTranscriptCompositionalLayout sizeForRotation](self, "sizeForRotation");
    if (v19 == v4 && v18 == v5)
    {
      v4 = v17;
    }
    else
    {
      -[CKTranscriptCompositionalLayout sizeForRotation](self, "sizeForRotation");
      v4 = v20;
    }
    -[CGRect chatItem](v3, "chatItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "bottomTranscriptSpaceWithLastChatItem:", v21);
    v23 = v22;

    _Block_object_dispose(&buf, 8);
    v5 = ceil(MaxY * v14) / v14 + v23;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v33.width = v4;
      v33.height = v5;
      NSStringFromCGSize(v33);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "Updating content size to: %@", (uint8_t *)&buf, 0xCu);

    }
  }
  -[CKTranscriptCompositionalLayout setContentSize:]((double *)self, v4, v5);

}

void __52__CKTranscriptCompositionalLayout_updateContentSize__block_invoke(uint64_t a1, void *a2)
{
  double MaxY;
  CGRect *v5;

  v5 = a2;
  MaxY = CGRectGetMaxY(v5[11]);
  if (MaxY > CGRectGetMaxY(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 352)))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

- (void)setContentSize:(CGFloat)a3
{
  NSObject *v6;
  void *v7;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;
  CGSize v17;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v17.width = a2;
        v17.height = a3;
        NSStringFromCGSize(v17);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 136315394;
        v13 = "-[CKTranscriptCompositionalLayout setContentSize:]";
        v14 = 2112;
        v15 = v7;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Calling %s with size: %@", (uint8_t *)&v12, 0x16u);

      }
    }
    if (a1[87] != a2 || a1[88] != a3)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Content size has changed, we will call the delegate's collectionViewLayout:sizeDidChange:", (uint8_t *)&v12, 2u);
        }

      }
      a1[87] = a2;
      a1[88] = a3;
      objc_msgSend(a1, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "collectionViewLayout:sizeDidChange:", a1, a1[87], a1[88]);
    }
  }
}

+ (double)bottomTranscriptSpaceWithLastChatItem:(id)a3
{
  id v3;
  void *v4;
  double v5;
  char isKindOfClass;
  void *v7;
  double v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unavailabilityIndicatorBottomTranscriptSpace");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notifyAnywayBottomTranscriptSpace");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "satelliteAvailabilityIndicatorBottomTranscriptSpace");
      }
      else
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v7;
        if ((isKindOfClass & 1) != 0)
          objc_msgSend(v7, "satelliteSuppressedNotificationBottomTranscriptSpace");
        else
          objc_msgSend(v7, "bottomTranscriptSpace");
      }
    }
  }
  v8 = v5;

  return v8;
}

- (void)updateAttributesForAnchorYChangeWithAttributes:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;
  double *v12;
  double *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  int v17;
  NSObject *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t i;
  double v29;
  double v30;
  double v31;
  id obj;
  uint8_t buf[16];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)v35;
    v31 = 0.00499999989;
    do
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(obj);
        v13 = *(double **)(*((_QWORD *)&v34 + 1) + 8 * v11);
        objc_msgSend(v13, "setFrame:", v13[48], v13[49], v13[50], v13[51], *(_QWORD *)&v31);
        objc_msgSend(v13, "chatItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "attachmentContiguousType") & 0xFE;
        if (v12)
          v16 = (_DWORD)v15 == 2;
        else
          v16 = 0;
        v17 = v16;
        if (!v12 && (_DWORD)v15 == 2 && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Chat item is contiguous type middle/end, but it does not have a previous chat item to inherit target easing from! Possible chat item misconfiguration", buf, 2u);
          }

        }
        if (v17)
        {
          v19 = v12[53];
        }
        else
        {
          v20 = 0.00999999978;
          if (objc_msgSend(v14, "transcriptOrientation"))
          {
            if (objc_msgSend(v14, "transcriptOrientation") == 1)
              v20 = v31;
            else
              v20 = 0.0;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v20 = v20 + 0.0500000007;
          objc_msgSend(v13, "bounds");
          v22 = v21;
          objc_msgSend(v13, "center");
          v24 = v23;
          -[CKTranscriptCompositionalLayout anchorYPosition](self, "anchorYPosition");
          v26 = vabdd_f64(v24, v25);
          v27 = 0.0;
          for (i = -1; i != 2; ++i)
          {
            v29 = (v26 + v22 * (double)i * 0.5) / v7;
            if (v29 > 1.0)
              v29 = 1.0;
            -[CKTranscriptCompositionalLayout bezierPointForPercentage:anchor1:anchor2:control1:control2:](self, "bezierPointForPercentage:anchor1:anchor2:control1:control2:", fmax(v29, 0.0), v20, v20 + 0.75, v20 + 0.75, v20 + 0.75);
            v27 = v27 + v30;
          }
          v19 = v27 / 3.0;
        }
        v13[53] = v19;
        v9 = v13;

        ++v11;
        v12 = v9;
      }
      while (v11 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v8);

  }
}

- (void)updateAttributesForTargetContentOffsetChangeWithAttributes:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double *v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  double *v17;
  double *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  int v24;
  NSObject *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  id obj;
  double v39;
  uint8_t buf[16];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  -[CKTranscriptCompositionalLayout anchorYPosition](self, "anchorYPosition");
  v39 = v8;
  -[CKTranscriptCompositionalLayout targetContentOffset](self, "targetContentOffset");
  v10 = v9;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v4;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v11)
  {
    v12 = 0;
    v13 = *(_QWORD *)v42;
    v14 = v7 + v10 - (v39 + v7);
    if (v10 < v39)
      v14 = v39 - v7 - v10;
    if (v14 >= v7 * 0.5)
      v15 = v14;
    else
      v15 = v7 * 0.5;
    while (1)
    {
      v16 = 0;
      v17 = v12;
      do
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(obj);
        v18 = *(double **)(*((_QWORD *)&v41 + 1) + 8 * v16);
        objc_msgSend(v18, "setFrame:", v18[48], v18[49], v18[50], v18[51]);
        objc_msgSend(v18, "center");
        v20 = v19;
        objc_msgSend(v18, "chatItem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "attachmentContiguousType") & 0xFE;
        if (v17)
          v23 = (_DWORD)v22 == 2;
        else
          v23 = 0;
        v24 = v23;
        if (!v17 && (_DWORD)v22 == 2 && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "Chat item is contiguous type middle/end, but it does not have a previous chat item to inherit target easing from! Possible chat item misconfiguration", buf, 2u);
          }

        }
        if (v24)
        {
          v26 = v17[53];
        }
        else
        {
          if (fabs(v20 - v39) <= v7)
            goto LABEL_35;
          v27 = 0.00999999978;
          if (objc_msgSend(v21, "transcriptOrientation"))
          {
            if (objc_msgSend(v21, "transcriptOrientation") == 1)
              v27 = 0.00499999989;
            else
              v27 = 0.0;
          }
          objc_msgSend(v18, "bounds");
          v29 = v28;
          objc_msgSend(v18, "center");
          v31 = vabdd_f64(v30, v39);
          v32 = v27 + 0.75;
          v33 = v27 + 0.899999976;
          v34 = -1;
          v35 = 0.0;
          do
          {
            v36 = (v31 + v29 * (double)v34 * 0.5 - v7) / v15;
            if (v36 > 1.0)
              v36 = 1.0;
            -[CKTranscriptCompositionalLayout bezierPointForPercentage:anchor1:anchor2:control1:control2:](self, "bezierPointForPercentage:anchor1:anchor2:control1:control2:", fmax(v36, 0.0), v32, v33, v32, v32);
            v35 = v35 + v37;
            ++v34;
          }
          while (v34 != 2);
          v26 = v35 / 3.0;
        }
        v18[53] = v26;
LABEL_35:
        v12 = v18;

        ++v16;
        v17 = v12;
      }
      while (v16 != v11);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (!v11)
      {

        break;
      }
    }
  }

}

- (void)setAnchorYPosition:(double)a3
{
  void *v4;
  id v5;

  if (self->_anchorYPosition != a3)
  {
    self->_anchorYPosition = a3;
    -[CKTranscriptCompositionalLayout layoutAttributes](self, "layoutAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptCompositionalLayout updateAttributesForAnchorYChangeWithAttributes:](self, "updateAttributesForAnchorYChangeWithAttributes:", v4);

    -[CKTranscriptCompositionalLayout associatedLayoutAttributes](self, "associatedLayoutAttributes");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptCompositionalLayout updateAttributesForAnchorYChangeWithAttributes:](self, "updateAttributesForAnchorYChangeWithAttributes:", v5);

  }
}

- (void)setTargetContentOffset:(CGPoint)a3
{
  void *v5;
  id v6;

  if (a3.x != self->_targetContentOffset.x || a3.y != self->_targetContentOffset.y)
  {
    -[CKTranscriptCompositionalLayout layoutAttributes](self, "layoutAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptCompositionalLayout updateAttributesForTargetContentOffsetChangeWithAttributes:](self, "updateAttributesForTargetContentOffsetChangeWithAttributes:", v5);

    -[CKTranscriptCompositionalLayout associatedLayoutAttributes](self, "associatedLayoutAttributes");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptCompositionalLayout updateAttributesForTargetContentOffsetChangeWithAttributes:](self, "updateAttributesForTargetContentOffsetChangeWithAttributes:", v6);

  }
}

- (double)bezierPointForPercentage:(double)a3 anchor1:(double)a4 anchor2:(double)a5 control1:(double)a6 control2:(double)a7
{
  return a3 * a3 * 3.0 * (a4 + a6 * -2.0 + a7) + pow(a3, 3.0) * (a5 + (a6 - a7) * 3.0 - a4) + a3 * 3.0 * (a6 - a4) + a4;
}

- (void)displayLinkFired:(id)a3
{
  double v4;
  float v5;
  void *v6;
  id v7;

  v7 = a3;
  kdebug_trace();
  if ((_UIUpdateCycleEnabled() & 1) == 0)
  {
    if (self)
    {
      self->_isDisplayDrivenLayoutInvalidation = 1;
      objc_msgSend(v7, "timestamp");
      self->_currentFrameTimestamp = v4;
      if (self->_displayDrivenDynamicsInitializationTime == 0.0)
        self->_displayDrivenDynamicsInitializationTime = v4;
      objc_msgSend(v7, "preferredFrameRateRange");
      self->_requestedFrameRate = v5;
    }
    else
    {
      objc_msgSend(v7, "timestamp");
      objc_msgSend(v7, "preferredFrameRateRange");
    }
    kdebug_trace();
    -[CKTranscriptCompositionalLayout _invalidationContextForRefreshingVisibleElementAttributes](self, "_invalidationContextForRefreshingVisibleElementAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptCompositionalLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v6);

  }
}

- (double)handleInvalidCaseForChatItem:(id)a3 withPrevChatItem:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Transcript: %@ shouldn't follow %@", (uint8_t *)&v12, 0x16u);
    }

  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "smallTranscriptSpace");
  v10 = v9;

  return v10;
}

- (BOOL)nextItemIsOriginatorWithRepliesForIndex:(unint64_t)a3
{
  unint64_t v4;
  NSArray *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3 + 1;
  v5 = self->_layoutAttributes;
  if (v4 >= -[NSArray count](v5, "count"))
  {
    v8 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](v5, "objectAtIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chatItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v8 = (objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(v7, "itemIsThreadOriginator")
      && -[CKTranscriptCompositionalLayout nextMessageIsReplyForIndex:](self, "nextMessageIsReplyForIndex:", v4);

  }
  return v8;
}

- (BOOL)nextMessageIsReplyForIndex:(unint64_t)a3
{
  NSArray *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = self->_layoutAttributes;
  v5 = a3 + 1;
  if (v5 >= -[NSArray count](v4, "count"))
  {
LABEL_4:
    v8 = 0;
  }
  else
  {
    while (1)
    {
      -[NSArray objectAtIndex:](v4, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "chatItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;

      if (++v5 >= -[NSArray count](v4, "count"))
        goto LABEL_4;
    }
    v8 = objc_msgSend(v7, "itemIsReply");

  }
  return v8;
}

- (BOOL)previousReplyCount:(unint64_t)a3 isOccludedForAssociatedFrame:(CGRect)a4 outMaxY:(double *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSArray *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  unint64_t v18;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  _BOOL4 v24;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = self->_layoutAttributes;
  -[NSArray objectAtIndex:](v11, "objectAtIndex:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "chatItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "itemIsReply"))
    v14 = (uint64_t)(a3 - 1) < 1;
  else
    v14 = 1;
  if (v14)
  {
LABEL_7:
    LOBYTE(v17) = 0;
  }
  else
  {
    while (1)
    {
      -[NSArray objectAtIndex:](v11, "objectAtIndex:", --a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "chatItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;

      if ((uint64_t)a3 <= 1)
        goto LABEL_7;
    }
    v18 = objc_msgSend(v16, "replyCount");
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    MinX = CGRectGetMinX(v26);
    objc_msgSend(v15, "frame");
    MaxX = CGRectGetMaxX(v27);
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    MinY = CGRectGetMinY(v28);
    objc_msgSend(v15, "frame");
    MaxY = CGRectGetMaxY(v29);
    v24 = MinX <= MaxX && v18 > 1;
    v17 = MinY <= MaxY && v24;
    if (v17)
    {
      objc_msgSend(v15, "frame");
      *a5 = CGRectGetMaxY(v30);
    }

  }
  return v17;
}

- (BOOL)needsAdditionalBracketPaddingForChatItem:(id)a3 prevChatItem:(id)a4
{
  id v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  BOOL v10;

  v5 = a3;
  if ((objc_msgSend(a4, "itemIsFromMe") & 1) != 0 || !objc_msgSend(v5, "itemIsFromMe"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v5, "size");
    v7 = v6;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textBalloonMinHeight");
    v10 = v7 <= v9;

  }
  return v10;
}

- (void)_applyAttributeUpdatesWithTargetMap:(id)a3 layoutAttributes:(id)a4 updateBlock:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  char v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  double x;
  double y;
  double width;
  double height;
  void *v32;
  double v33;
  _BOOL4 v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void (**v46)(id, uint64_t, _QWORD);
  void *v47;
  double MaxY;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  double *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  id v58;
  CKTranscriptCompositionalLayout *v59;
  id v60;
  id obj;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[4];
  id v68;
  _QWORD *v69;
  double v70;
  _QWORD v71[4];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  v78 = *MEMORY[0x1E0C80C00];
  v62 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  v59 = self;
  -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;

  -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_visibleRectEdgeInsets");
  v15 = v14;
  v17 = v16;

  v60 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v8;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
  if (v18)
  {
    v19 = 0;
    v20 = v12 - (v15 + v17);
    v21 = *(_QWORD *)v73;
    v22 = 0.0;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v73 != v21)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend(*(id *)(v24 + 656), "IMChatItem");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "guid");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectForKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          objc_msgSend(v27, "CGRectValue");
          x = v79.origin.x;
          y = v79.origin.y;
          width = v79.size.width;
          height = v79.size.height;
          if (CGRectGetMaxY(v79) < 0.0)
          {
            objc_msgSend(v60, "addObject:", v24);
            goto LABEL_16;
          }
          -[CKTranscriptCompositionalLayout collectionView](v59, "collectionView");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "frame");
          v34 = y - v33 > v20;

          if (v34)
          {
            objc_msgSend(v58, "addObject:", v24);
            goto LABEL_16;
          }
          -[CKTranscriptCompositionalLayout _convertScreenFrameToLocalFrame:](v59, "_convertScreenFrameToLocalFrame:", x, y, width, height);
          v36 = v35;
          v37 = *(double *)(v24 + 392);
          v9[2](v9, v24, 0);
          v22 = v36 - v37;
        }
        else
        {
          if ((v19 & 1) == 0)
          {
            objc_msgSend(v60, "addObject:", v24);
            v19 = 0;
            goto LABEL_16;
          }
          ((void (*)(void (**)(id, uint64_t, _QWORD), uint64_t, uint64_t, double, double, double, double))v9[2])(v9, v24, 1, *(double *)(v24 + 384), v22 + *(double *)(v24 + 392), *(double *)(v24 + 400), *(double *)(v24 + 408));
        }
        v19 = 1;
LABEL_16:

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
    }
    while (v18);
  }

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "smallTranscriptSpace");
  v40 = v39;

  -[CKTranscriptCompositionalLayout collectionView](v59, "collectionView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "superview");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptCompositionalLayout collectionView](v59, "collectionView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "convertPoint:toView:", v43, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v45 = v44;

  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x2020000000;
  v71[3] = v45;
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __100__CKTranscriptCompositionalLayout__applyAttributeUpdatesWithTargetMap_layoutAttributes_updateBlock___block_invoke;
  v67[3] = &unk_1E27576E0;
  v69 = v71;
  v70 = v40;
  v46 = v9;
  v68 = v46;
  objc_msgSend(v60, "enumerateObjectsWithOptions:usingBlock:", 2, v67);
  -[CKTranscriptCompositionalLayout collectionView](v59, "collectionView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bounds");
  MaxY = CGRectGetMaxY(v80);

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v49 = v58;
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
  if (v50)
  {
    v51 = *(_QWORD *)v64;
    do
    {
      for (j = 0; j != v50; ++j)
      {
        if (*(_QWORD *)v64 != v51)
          objc_enumerationMutation(v49);
        v53 = *(double **)(*((_QWORD *)&v63 + 1) + 8 * j);
        v54 = v53[48];
        v55 = v53[50];
        v56 = v53[51];
        v81.origin.x = v54;
        v81.origin.y = MaxY;
        v81.size.width = v55;
        v81.size.height = v56;
        v57 = CGRectGetMaxY(v81);
        ((void (*)(void (**)(id, uint64_t, _QWORD), double *, _QWORD, double, double, double, double))v46[2])(v46, v53, 0, v54, MaxY, v55, v56);
        MaxY = v40 + v57;
      }
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
    }
    while (v50);
  }

  -[CKTranscriptCompositionalLayout _kickDynamicsIfNeeded](v59, "_kickDynamicsIfNeeded");
  _Block_object_dispose(v71, 8);

}

void __100__CKTranscriptCompositionalLayout__applyAttributeUpdatesWithTargetMap_layoutAttributes_updateBlock___block_invoke(uint64_t a1, double *a2)
{
  double v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double v7;
  double *v8;
  CGRect v9;

  v3 = a2[48];
  v4 = a2[49];
  v5 = a2[50];
  v6 = a2[51];
  v7 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v8 = a2;
  v9.origin.x = v3;
  v9.origin.y = v4;
  v9.size.width = v5;
  v9.size.height = v6;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7 - CGRectGetHeight(v9) - *(double *)(a1 + 48);
  (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v3);

}

- (CGRect)_convertScreenFrameToLocalFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:toView:", v10, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)_applyTargetFrameOffsetsForLayoutAttributesIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  _QWORD aBlock[4];
  BOOL v11;

  v4 = a3;
  -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "overrideTargetFrameMapForLayout:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[CKTranscriptCompositionalLayout isInlineAnimatingOut](self, "isInlineAnimatingOut");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __87__CKTranscriptCompositionalLayout__applyTargetFrameOffsetsForLayoutAttributesIfNeeded___block_invoke;
    aBlock[3] = &__block_descriptor_33_e89_v52__0__CKTranscriptCollectionViewLayoutAttributes_8_CGRect__CGPoint_dd__CGSize_dd__16B48l;
    v11 = v8;
    v9 = _Block_copy(aBlock);
    -[CKTranscriptCompositionalLayout _applyAttributeUpdatesWithTargetMap:layoutAttributes:updateBlock:](self, "_applyAttributeUpdatesWithTargetMap:layoutAttributes:updateBlock:", v7, v4, v9);

  }
}

void __87__CKTranscriptCompositionalLayout__applyTargetFrameOffsetsForLayoutAttributesIfNeeded___block_invoke(uint64_t a1, void *a2, int a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13;
  double v14;
  uint64_t v15;
  CGFloat MidY;
  id v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v36 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v15 = *((_QWORD *)v13 + 48);
  v14 = *((double *)v13 + 49);
  v34 = *((_OWORD *)v13 + 25);
  v37.origin.x = a4;
  v37.origin.y = a5;
  v37.size.width = a6;
  v37.size.height = a7;
  CGRectGetMidX(v37);
  v38.origin.x = a4;
  v38.origin.y = a5;
  v38.size.width = a6;
  v38.size.height = a7;
  MidY = CGRectGetMidY(v38);
  *((_QWORD *)v13 + 44) = v15;
  *((CGFloat *)v13 + 45) = a5;
  *((_OWORD *)v13 + 23) = v34;
  *((CGFloat *)v13 + 73) = MidY;
  if (*(_BYTE *)(a1 + 32) && a3)
    objc_msgSend(v13, "setAlpha:", 0.0);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v29 = v13;
  v17 = *((id *)v13 + 79);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = a5 - v14;
    v21 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(v17);
        v23 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v24 = *(double *)(v23 + 384);
        v25 = *(double *)(v23 + 400);
        v26 = *(double *)(v23 + 408);
        v27 = v20 + *(double *)(v23 + 392);
        v39.origin.x = v24;
        v39.origin.y = v27;
        v39.size.width = v25;
        v39.size.height = v26;
        CGRectGetMidX(v39);
        v40.origin.x = v24;
        v40.origin.y = v27;
        v40.size.width = v25;
        v40.size.height = v26;
        v28 = CGRectGetMidY(v40);
        *(CGFloat *)(v23 + 352) = v24;
        *(CGFloat *)(v23 + 360) = v27;
        *(CGFloat *)(v23 + 368) = v25;
        *(CGFloat *)(v23 + 376) = v26;
        *(CGFloat *)(v23 + 584) = v28;
        if (*(_QWORD *)(v23 + 640))
          *(double *)(v23 + 624) = v20 + *(double *)(v23 + 624);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v19);
  }

}

- (void)_applyCurrentFrameOffsetsForLayoutAttributesIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double height;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _BOOL4 v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  id v45;
  id obj;
  double v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "overrideCurrentFrameMapForLayout:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "balloonOffsetMapForLayout:resetsOffsetMapAfterUse:", self, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v44 = v7;
    -[CKTranscriptCompositionalLayout _applyAttributeUpdatesWithTargetMap:layoutAttributes:updateBlock:](self, "_applyAttributeUpdatesWithTargetMap:layoutAttributes:updateBlock:", v7, v4, &__block_literal_global_119_1);
    -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10;

    if (self)
      height = self->_contentSize.height;
    else
      height = 0.0;
    v13 = 0.5;
    if (height >= v11)
      v14 = v11;
    else
      v14 = v11 * 0.5;
    -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "convertPoint:toView:", v17, 0.0, v14);
    v47 = v18;

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v45 = v4;
    obj = v4;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v53 != v21)
            objc_enumerationMutation(obj);
          v23 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend((id)v23, "bounds");
          v25 = v24;
          objc_msgSend((id)v23, "center");
          v27 = vabdd_f64(v26, v47);
          v28 = -1;
          v29 = 0.0;
          do
          {
            v30 = (v27 + v25 * (double)v28 * v13) / v11;
            if (v30 > 1.0)
              v30 = 1.0;
            v31 = v11;
            v32 = fmax(v30, 0.0);
            v33 = -[CKTranscriptCompositionalLayout isInlineAnimatingOut](self, "isInlineAnimatingOut");
            v34 = -0.0500000007;
            if (!v33)
              v34 = 0.0;
            v35 = v34 + 0.889999986;
            v36 = v34 + 0.824999988;
            v37 = v32;
            v11 = v31;
            v13 = 0.5;
            -[CKTranscriptCompositionalLayout bezierPointForPercentage:anchor1:anchor2:control1:control2:](self, "bezierPointForPercentage:anchor1:anchor2:control1:control2:", v37, v35, v36, v36, v36);
            v29 = v29 + v38;
            ++v28;
          }
          while (v28 != 2);
          *(double *)(v23 + 416) = v29 / 3.0;
          *(double *)(v23 + 424) = v29 / 3.0;
          -[CKTranscriptCompositionalLayout _applyHorizontalOffsetFromMapping:toLayoutAttributes:](self, "_applyHorizontalOffsetFromMapping:toLayoutAttributes:", v8, v23);
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          v39 = *(id *)(v23 + 632);
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v49;
            do
            {
              for (j = 0; j != v41; ++j)
              {
                if (*(_QWORD *)v49 != v42)
                  objc_enumerationMutation(v39);
                -[CKTranscriptCompositionalLayout _applyHorizontalOffsetFromMapping:toLayoutAttributes:](self, "_applyHorizontalOffsetFromMapping:toLayoutAttributes:", v8, *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j));
              }
              v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
            }
            while (v41);
          }

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v20);
    }

    -[CKTranscriptCompositionalLayout _kickDynamicsIfNeeded](self, "_kickDynamicsIfNeeded");
    v4 = v45;
    v7 = v44;
  }

}

void __88__CKTranscriptCompositionalLayout__applyCurrentFrameOffsetsForLayoutAttributesIfNeeded___block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, void *a6)
{
  id v10;
  double v11;
  uint64_t v12;
  double MidX;
  double MidY;
  id v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v12 = *((_QWORD *)v10 + 48);
  v11 = *((double *)v10 + 49);
  v32 = *((_OWORD *)v10 + 25);
  v35.origin.x = a1;
  v35.origin.y = a2;
  v35.size.width = a3;
  v35.size.height = a4;
  MidX = CGRectGetMidX(v35);
  v36.origin.x = a1;
  v36.origin.y = a2;
  v36.size.width = a3;
  v36.size.height = a4;
  MidY = CGRectGetMidY(v36);
  *((_QWORD *)v10 + 48) = v12;
  *((CGFloat *)v10 + 49) = a2;
  *((_OWORD *)v10 + 25) = v32;
  objc_msgSend(v10, "setCenter:", MidX, MidY);
  *((double *)v10 + 74) = MidY;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v15 = *((id *)v10 + 79);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = a2 - v11;
    v19 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v15);
        v21 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        v22 = *(double *)(v21 + 384);
        v23 = *(double *)(v21 + 400);
        v24 = *(double *)(v21 + 408);
        v25 = v18 + *(double *)(v21 + 392);
        v37.origin.x = v22;
        v37.origin.y = v25;
        v37.size.width = v23;
        v37.size.height = v24;
        v26 = CGRectGetMidX(v37);
        v38.origin.x = v22;
        v38.origin.y = v25;
        v38.size.width = v23;
        v38.size.height = v24;
        v27 = CGRectGetMidY(v38);
        *(CGFloat *)(v21 + 384) = v22;
        *(CGFloat *)(v21 + 392) = v25;
        *(CGFloat *)(v21 + 400) = v23;
        *(CGFloat *)(v21 + 408) = v24;
        objc_msgSend((id)v21, "setCenter:", v26, v27, (_QWORD)v28);
        *(double *)(v21 + 592) = v27;
        if (*(_QWORD *)(v21 + 640))
          *(double *)(v21 + 624) = v18 + *(double *)(v21 + 624);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v17);
  }

}

- (void)_applyHorizontalOffsetFromMapping:(id)a3 toLayoutAttributes:(id)a4
{
  void *v5;
  double *v6;
  id v7;
  void *v8;
  void *v9;
  float v10;
  double v11;
  BOOL v12;
  double v13;
  id v14;

  v5 = (void *)*((_QWORD *)a4 + 82);
  v6 = (double *)a4;
  v7 = a3;
  objc_msgSend(v5, "IMChatItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "guid");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "floatValue");
  v11 = v10;
  v12 = v10 == 0.0;
  v13 = 0.0;
  if (!v12)
    v13 = v11;
  v6[55] = v13;
  v6[56] = v13;

}

- (void)_updateCurrentBalloonOffsetForLayoutAttributes:(id)a3
{
  double *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double *v13;

  v3 = (double *)a3;
  v4 = v3[73] - v3[74];
  if (v4 < 0.0)
    v4 = -v4;
  v5 = fmax(v4, 1.0);
  if (v5 >= 2.0)
  {
    v13 = v3;
    objc_msgSend(v3, "center");
    v8 = v7 - v13[74];
    if (v8 < 0.0)
      v8 = -v8;
    v9 = v8 / v5;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "curveValueForSwipeWithVelocity:t:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v9);
    v12 = v11;

    v3 = v13;
    v6 = fmax(v12 * v13[55], 0.0);
  }
  else
  {
    v6 = v3[56] + -6.0;
  }
  v3[56] = v6;

}

- (void)_resetHorizontalBalloonOffsetsForLayoutAttributes:(id)a3 includeAssociatedAttributes:(BOOL)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *((_QWORD *)a3 + 55) = 0;
  if (a4)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = *((id *)a3 + 79);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++) + 440) = 0;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)invalidateLayout
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptCompositionalLayout;
  -[CKTranscriptCompositionalLayout invalidateLayout](&v4, sel_invalidateLayout);
  -[CKTranscriptCompositionalLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsScrollIntentEnforced");

}

- (void)sizeCategoryDidChange:(id)a3
{
  void *v4;
  uint64_t v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAccessibilityPreferredContentSizeCategory");

  if ((_DWORD)v5 != -[CKTranscriptCompositionalLayout sizeCategoryIsAccessibilitySizeCategory](self, "sizeCategoryIsAccessibilitySizeCategory"))
  {
    -[CKTranscriptCompositionalLayout setLayoutAttributes:](self, "setLayoutAttributes:", 0);
    -[CKTranscriptCompositionalLayout invalidateLayout](self, "invalidateLayout");
    -[CKTranscriptCompositionalLayout setSizeCategoryIsAccessibilitySizeCategory:](self, "setSizeCategoryIsAccessibilitySizeCategory:", v5);
  }
}

- (void)reduceMotionSettingChanged:(id)a3
{
  -[CKTranscriptCompositionalLayout setLayoutAttributes:](self, "setLayoutAttributes:", 0);
  -[CKTranscriptCompositionalLayout invalidateLayout](self, "invalidateLayout");
}

- (double)anchorYPosition
{
  return self->_anchorYPosition;
}

- (CGPoint)targetContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_targetContentOffset.x;
  y = self->_targetContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)isHoldingBoundsInvalidation
{
  return self->_holdingBoundsInvalidation;
}

- (void)setHoldingBoundsInvalidation:(BOOL)a3
{
  self->_holdingBoundsInvalidation = a3;
}

- (BOOL)isUsingInitialLayoutAttributesForRotation
{
  return self->_useInitialLayoutAttributesForRotation;
}

- (void)setUseInitialLayoutAttributesForRotation:(BOOL)a3
{
  self->_useInitialLayoutAttributesForRotation = a3;
}

- (BOOL)isUsingOverlayLayout
{
  return self->_useOverlayLayout;
}

- (void)setUseOverlayLayout:(BOOL)a3
{
  self->_useOverlayLayout = a3;
}

- (BOOL)isInlineAnimatingOut
{
  return self->_inlineAnimatingOut;
}

- (void)setInlineAnimatingOut:(BOOL)a3
{
  self->_inlineAnimatingOut = a3;
}

- (unsigned)chatStyle
{
  return self->_chatStyle;
}

- (void)setChatStyle:(unsigned __int8)a3
{
  self->_chatStyle = a3;
}

- (BOOL)isResting
{
  return self->_isResting;
}

- (CGSize)sizeForRotation
{
  double width;
  double height;
  CGSize result;

  width = self->_sizeForRotation.width;
  height = self->_sizeForRotation.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSizeForRotation:(CGSize)a3
{
  self->_sizeForRotation = a3;
}

- (NSIndexSet)indicesOfChatItemsToBeRemovedWithoutFading
{
  return self->_indicesOfChatItemsToBeRemovedWithoutFading;
}

- (void)setIndicesOfChatItemsToBeRemovedWithoutFading:(id)a3
{
  objc_storeStrong((id *)&self->_indicesOfChatItemsToBeRemovedWithoutFading, a3);
}

- (NSIndexSet)indicesOfChatItemsToBeInsertedWithoutFading
{
  return self->_indicesOfChatItemsToBeInsertedWithoutFading;
}

- (void)setIndicesOfChatItemsToBeInsertedWithoutFading:(id)a3
{
  objc_storeStrong((id *)&self->_indicesOfChatItemsToBeInsertedWithoutFading, a3);
}

- (NSIndexSet)indicesOfReplyChatItemsToBeInserted
{
  return self->_indicesOfReplyChatItemsToBeInserted;
}

- (void)setIndicesOfReplyChatItemsToBeInserted:(id)a3
{
  objc_storeStrong((id *)&self->_indicesOfReplyChatItemsToBeInserted, a3);
}

- (BOOL)disableDynamicsWhileScrolling
{
  return self->_disableDynamicsWhileScrolling;
}

- (void)setDisableDynamicsWhileScrolling:(BOOL)a3
{
  self->_disableDynamicsWhileScrolling = a3;
}

- (void)setLayoutAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (NSArray)associatedLayoutAttributes
{
  return self->_associatedLayoutAttributes;
}

- (void)setAssociatedLayoutAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (NSArray)decorationLayoutAttributes
{
  return self->_decorationLayoutAttributes;
}

- (void)setDecorationLayoutAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (NSArray)oldAssociatedLayoutAttributes
{
  return self->_oldAssociatedLayoutAttributes;
}

- (void)setOldAssociatedLayoutAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (NSMutableIndexSet)insertedAssociatedLayoutAttributes
{
  return self->_insertedAssociatedLayoutAttributes;
}

- (void)setInsertedAssociatedLayoutAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_insertedAssociatedLayoutAttributes, a3);
}

- (BOOL)hasLoadMore
{
  return self->_hasLoadMore;
}

- (void)setHasLoadMore:(BOOL)a3
{
  self->_hasLoadMore = a3;
}

- (NSMutableDictionary)initialParentLayoutAttributes
{
  return self->_initialParentLayoutAttributes;
}

- (void)setInitialParentLayoutAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_initialParentLayoutAttributes, a3);
}

- (NSMutableDictionary)finalParentVerticalOffsets
{
  return self->_finalParentVerticalOffsets;
}

- (void)setFinalParentVerticalOffsets:(id)a3
{
  objc_storeStrong((id *)&self->_finalParentVerticalOffsets, a3);
}

- (BOOL)sizeCategoryIsAccessibilitySizeCategory
{
  return self->_sizeCategoryIsAccessibilitySizeCategory;
}

- (void)setSizeCategoryIsAccessibilitySizeCategory:(BOOL)a3
{
  self->_sizeCategoryIsAccessibilitySizeCategory = a3;
}

- (IMScheduledUpdater)dynamicsUpdater
{
  return self->_dynamicsUpdater;
}

- (void)setDynamicsUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicsUpdater, a3);
}

- (_UIUpdateSequenceItemInternal)dynamicsUpdateSequenceItem
{
  return self->_dynamicsUpdateSequenceItem;
}

- (void)setDynamicsUpdateSequenceItem:(_UIUpdateSequenceItemInternal *)a3
{
  self->_dynamicsUpdateSequenceItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_dynamicsUpdater, 0);
  objc_storeStrong((id *)&self->_finalParentVerticalOffsets, 0);
  objc_storeStrong((id *)&self->_initialParentLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_insertedAssociatedLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_oldAssociatedLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_decorationLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_associatedLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_indicesOfReplyChatItemsToBeInserted, 0);
  objc_storeStrong((id *)&self->_indicesOfChatItemsToBeInsertedWithoutFading, 0);
  objc_storeStrong((id *)&self->_indicesOfChatItemsToBeRemovedWithoutFading, 0);
}

@end
