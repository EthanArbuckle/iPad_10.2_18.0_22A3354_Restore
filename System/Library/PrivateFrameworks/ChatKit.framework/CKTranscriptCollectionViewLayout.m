@implementation CKTranscriptCollectionViewLayout

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

  -[CKTranscriptCollectionViewLayout decorationLayoutAttributes](self, "decorationLayoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[CKTranscriptCollectionViewLayout translateLayoutIndexToEffectIndex:](CKTranscriptCollectionViewLayout, "translateLayoutIndexToEffectIndex:", objc_msgSend(v5, "zIndex"));

  return v6;
}

- (CKTranscriptCollectionViewLayout)init
{
  CKTranscriptCollectionViewLayout *v2;
  CKTranscriptCollectionViewLayout *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *initialParentLayoutAttributes;
  NSMutableDictionary *v6;
  NSMutableDictionary *finalParentVerticalOffsets;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKTranscriptCollectionViewLayout;
  v2 = -[CKTranscriptCollectionViewLayout init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isResting = 1;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    initialParentLayoutAttributes = v3->_initialParentLayoutAttributes;
    v3->_initialParentLayoutAttributes = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    finalParentVerticalOffsets = v3->_finalParentVerticalOffsets;
    v3->_finalParentVerticalOffsets = v6;

    v3->_useFastQuanta = 0;
    v3->_coalesceInvalidations = 1;
    v8 = objc_opt_class();
    +[CKFullscreenEffectDecorationView decorationViewKind](CKFullscreenEffectDecorationView, "decorationViewKind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptCollectionViewLayout registerClass:forDecorationViewOfKind:](v3, "registerClass:forDecorationViewOfKind:", v8, v9);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_sizeCategoryIsAccessibilitySizeCategory = objc_msgSend(v10, "isAccessibilityPreferredContentSizeCategory");

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D36AC8]), "initWithTarget:action:", v3, sel__kickDynamicsIfNeeded);
    -[CKTranscriptCollectionViewLayout setDynamicsUpdater:](v3, "setDynamicsUpdater:", v11);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v3, sel_sizeCategoryDidChange_, *MEMORY[0x1E0CEB3F0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v3, sel_reduceMotionSettingChanged_, *MEMORY[0x1E0CEB090], 0);

  }
  return v3;
}

- (void)_kickDynamicsIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  NSDate *lastTouchTime;
  id v8;

  if (!self->_displayLink)
  {
    objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isInBackground");

    if ((v4 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel_displayLinkFired_);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addToRunLoop:forMode:", v5, *MEMORY[0x1E0C99860]);

      objc_msgSend(v8, "maximumRefreshRate");
      self->_useFastQuanta = CKFloatApproximatelyEqualToFloatWithTolerance(v6, 0.00833333377, 0.00000999999975);
      -[CKTranscriptCollectionViewLayout setDisplayLink:]((uint64_t)self, v8);
      lastTouchTime = self->_lastTouchTime;
      self->_lastTouchTime = 0;

    }
  }
}

- (void)setDisplayLink:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 360), a2);
}

- (void)beginHoldingDynamicsUpdatesForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKTranscriptCollectionViewLayout dynamicsUpdater](self, "dynamicsUpdater");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginHoldingUpdatesForKey:", v4);

}

- (void)endHoldingDynamicsUpdatesForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKTranscriptCollectionViewLayout dynamicsUpdater](self, "dynamicsUpdater");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endHoldingUpdatesForKey:", v4);

}

- (void)setNeedsDynamicsUpdate
{
  id v2;

  -[CKTranscriptCollectionViewLayout dynamicsUpdater](self, "dynamicsUpdater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdate");

}

- (void)dealloc
{
  objc_super v3;

  -[CKTranscriptCollectionViewLayout _dealloc](self, "_dealloc");
  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptCollectionViewLayout;
  -[CKTranscriptCollectionViewLayout dealloc](&v3, sel_dealloc);
}

- (void)_dealloc
{
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  -[IMScheduledUpdater invalidate](self->_dynamicsUpdater, "invalidate");
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
  CKTranscriptCollectionViewLayout *v162;
  id v163;
  uint64_t v164;
  void *v165;
  id v166;
  double v167;
  CKTranscriptCollectionViewLayout *v168;
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
  -[CKTranscriptCollectionViewLayout collectionView](self, "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v168 = self;
  -[CKTranscriptCollectionViewLayout layoutAttributes](self, "layoutAttributes");
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
  v19 = objc_msgSend(v4, "indexOfObjectWithOptions:passingTest:", 2, &__block_literal_global_264);
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
  v171 = -[CKTranscriptCollectionViewLayout hasLoadMore](v168, "hasLoadMore");
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
    v71 = &CKMainScreenScale_sMainScreenScale_98;
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
      if (CKMainScreenScale_once_102 != -1)
      {
        dispatch_once(&CKMainScreenScale_once_102, &__block_literal_global_360_0);
        v70 = 0.5;
      }
      v81 = v79 - v80 * v70 - (v75 + v76 * v70);
      if (v78 >= 0.25)
        v82 = v78;
      else
        v82 = 0.25;
      v83 = v76 * v82;
      v84 = *((double *)v71 + 4);
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
      v99 = *((double *)v71 + 4);
      if (v99 == 0.0)
        v99 = 1.0;
      v100 = v86 - round(v98 * v99) / v99;
      v101 = *(double *)(*(_QWORD *)&v73 + 608);
      if (v101 < 0.25)
        v101 = 0.25;
      v102 = v101 * *(double *)(*(_QWORD *)&v73 + 600);
      v103 = *((double *)v71 + 4);
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
      v71 = &CKMainScreenScale_sMainScreenScale_98;
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
    v112 = &CKMainScreenScale_sMainScreenScale_98;
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
      if (CKMainScreenScale_once_102 != -1)
      {
        dispatch_once(&CKMainScreenScale_once_102, &__block_literal_global_360_0);
        v117 = v120;
      }
      v121 = v113 - v116 * 0.5 - (v118 + v119 * 0.5);
      if (v115 >= 0.25)
        v122 = v115;
      else
        v122 = 0.25;
      v123 = v116 * v122;
      v124 = *((double *)v112 + 4);
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
      v142 = *((double *)v112 + 4);
      if (v142 == 0.0)
        v142 = 1.0;
      v143 = v127 + round(v141 * v142) / v142;
      v144 = v117[76];
      if (v144 < 0.25)
        v144 = 0.25;
      v145 = v144 * v117[75];
      v146 = *((double *)v112 + 4);
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
      v112 = &CKMainScreenScale_sMainScreenScale_98;
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
  -[CKTranscriptCollectionViewLayout _configureThreadGroupsForAttributes:outMaxYAnchorAttribute:forVisibleBounds:](v168, "_configureThreadGroupsForAttributes:outMaxYAnchorAttribute:forVisibleBounds:", v165, &v183);
  v163 = v183;
  -[CKTranscriptCollectionViewLayout _visibleRectInsectsForMaxYAnchorLayoutAttribute:forVisibleBounds:](v162, "_visibleRectInsectsForMaxYAnchorLayoutAttribute:forVisibleBounds:", v163, v155, v157, v159, v161);
  objc_msgSend(v3, "_setVisibleRectEdgeInsets:");

LABEL_165:
}

uint64_t __71__CKTranscriptCollectionViewLayout_prepareLayoutForRotisserieScrolling__block_invoke(uint64_t a1, void *a2)
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
  CKTranscriptCollectionViewLayout *v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  CGFloat x;
  double y;
  CGFloat height;
  double width;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  BOOL v31;
  _BOOL4 v32;
  CADisplayLink *v33;
  double prevTimestamp;
  id v35;
  double v36;
  double v37;
  void *v38;
  char v39;
  void *v40;
  double v41;
  NSDate *lastTouchTime;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  _BOOL4 easingUp;
  double v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  int v53;
  double v54;
  uint64_t v55;
  size_t v56;
  char *v57;
  uint64_t v58;
  double *v59;
  double v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  long double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  CGFloat v81;
  double v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  double v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t j;
  double *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  id v102;
  id v103;
  double v104;
  int v105;
  void *v106;
  uint64_t v107;
  id v108;
  double v109;
  double v110;
  double v111;
  id v112;
  void *v113;
  double v114;
  CGFloat v115;
  CGFloat v116;
  uint64_t v117;
  double v118;
  double v119;
  char *v120;
  uint64_t v121;
  _BOOL4 v122;
  CKTranscriptCollectionViewLayout *v123;
  double v124;
  long double v125;
  double v126;
  double v127;
  double *v128;
  int v129;
  id v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  objc_super v139;
  _BYTE v140[128];
  _QWORD v141[18];
  CGRect v142;

  v2 = self;
  v141[16] = *MEMORY[0x1E0C80C00];
  v139.receiver = self;
  v139.super_class = (Class)CKTranscriptCollectionViewLayout;
  -[CKTranscriptCollectionViewLayout prepareLayout](&v139, sel_prepareLayout);
  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInBackground");

  -[CKTranscriptCollectionViewLayout collectionView](v2, "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptCollectionViewLayout layoutAttributes](v2, "layoutAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    x = v2->_visibleBounds.origin.x;
    y = v2->_visibleBounds.origin.y;
    width = v2->_visibleBounds.size.width;
    height = v2->_visibleBounds.size.height;
  }
  else
  {
    y = 0.0;
    width = 0.0;
    height = 0.0;
    x = 0.0;
  }
  v11 = y;
  v12 = width;
  if (CGRectEqualToRect(*MEMORY[0x1E0C9D648], *(CGRect *)&x))
  {
    objc_msgSend(v5, "bounds");
    y = v13;
    width = v14;
  }
  objc_msgSend(v5, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v23, "shouldUseDynamicScrolling") ^ 1 | v4) & 1) != 0
    || (objc_msgSend(v5, "dynamicsDisabled") & 1) != 0
    || (-[IMScheduledUpdater isHoldingUpdates](v2->_dynamicsUpdater, "isHoldingUpdates") & 1) != 0)
  {

LABEL_9:
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "shouldUseRotisserieScrolling");

    if (v25)
    {
      -[CKTranscriptCollectionViewLayout prepareLayoutForRotisserieScrolling](v2, "prepareLayoutForRotisserieScrolling");
    }
    else
    {
      v137 = 0u;
      v138 = 0u;
      v135 = 0u;
      v136 = 0u;
      v26 = v6;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v135, v141, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v136;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v136 != v29)
              objc_enumerationMutation(v26);
            *(double *)(*(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * i) + 400) = v20;
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v135, v141, 16);
        }
        while (v28);
      }

    }
    if (v20 != width)
      -[CKTranscriptCollectionViewLayout updateContentSize](v2, "updateContentSize");
    if (v2)
    {
      v2->_visibleBounds.origin.x = v16;
      v2->_visibleBounds.origin.y = v18;
      v2->_visibleBounds.size.width = v20;
      v2->_visibleBounds.size.height = v22;
    }
    goto LABEL_23;
  }
  if (-[CKTranscriptCollectionViewLayout disableDynamicsWhileScrolling](v2, "disableDynamicsWhileScrolling"))
  {
    v31 = -[CKTranscriptCollectionViewLayout isResting](v2, "isResting");

    if (v31)
      goto LABEL_9;
  }
  else
  {

  }
  v117 = 281;
  v32 = !v2->_useFastQuanta;
  v33 = v2->_displayLink;
  prevTimestamp = v2->_prevTimestamp;
  v114 = v18;
  if (prevTimestamp == 0.0)
  {
    v37 = dbl_18E7CC2F0[v32];
    v35 = v33;
  }
  else
  {
    v35 = v33;
    if (v33)
    {
      -[CADisplayLink timestamp](v33, "timestamp");
      v37 = v36 - v2->_prevTimestamp;
      v126 = v114 - y;
      v119 = vabdd_f64(v114, y);
      goto LABEL_38;
    }
    v37 = CACurrentMediaTime() - v2->_prevTimestamp;
  }
  v119 = vabdd_f64(v114, y);
  v126 = v114 - y;
  if (v114 - y != 0.0 && !v35)
  {
    objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "isInBackground");

    if ((v39 & 1) != 0)
    {
      v35 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", v2, sel_displayLinkFired_);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addToRunLoop:forMode:", v40, *MEMORY[0x1E0C99860]);

      objc_msgSend(v35, "maximumRefreshRate");
      *((_BYTE *)&v2->super.super.isa + v117) = CKFloatApproximatelyEqualToFloatWithTolerance(v41, 0.00833333377, 0.00000999999975);
      -[CKTranscriptCollectionViewLayout setDisplayLink:]((uint64_t)v2, v35);
      lastTouchTime = v2->_lastTouchTime;
      v2->_lastTouchTime = 0;

    }
  }
LABEL_38:
  v43 = 1.0;
  if (v2->_prevTimestamp != 0.0)
  {
    objc_msgSend(v35, "duration");
    v45 = v37 / v44;
    v43 = v45 >= 1.0 ? v45 : 1.0;
    if (vabdd_f64(1.0, v43) < 0.0500000007)
      v43 = 1.0;
  }
  v125 = v43;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "scale");
  v124 = v47;

  if (v126 == 0.0)
    easingUp = v2->_easingUp;
  else
    easingUp = v126 > 0.0;
  v49 = v114;
  v2->_easingUp = easingUp;
  v50 = objc_msgSend(v6, "count");
  v113 = v6;
  if (!v50)
  {
    v59 = 0;
LABEL_102:
    -[CKTranscriptCollectionViewLayout invalidateDisplayLink](v2, "invalidateDisplayLink");

    v105 = 1;
    goto LABEL_103;
  }
  v51 = v50;
  v108 = v35;
  v109 = v16;
  v110 = v22;
  v111 = width;
  v112 = v5;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 1;
  objc_msgSend(v52, "balloonBalloonTranscriptSpace:", 1);
  v118 = v54;

  v107 = (uint64_t)&v107;
  MEMORY[0x1E0C80A78](v55);
  v57 = (char *)&v107 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v57, v56);
  v120 = v57;
  objc_msgSend(v6, "getObjects:range:", v57, 0, v51);
  v58 = 0;
  v59 = 0;
  v60 = 1.0;
  v123 = v2;
  v61 = v119;
  v122 = easingUp;
  v121 = v51;
  do
  {
    v62 = v51 + ~v58;
    if (!easingUp)
      v62 = v58;
    v63 = *(_QWORD *)&v120[8 * v62];
    v64 = *(_QWORD *)(v63 + 384);
    v65 = *(double *)(v63 + 408);
    v66 = *(double *)(v63 + 416);
    v67 = *(double *)(v63 + 360);
    v68 = *(double *)(v63 + 424);
    v69 = v126 + *(double *)(v63 + 392);
    v127 = v66;
    if (v125 > 0.0)
    {
      v70 = v60 - v66;
      v71 = (v67 - v69) / v125 * (v60 - v66);
      if (v60 - v66 < v60)
      {
        v72 = pow(v60 - v66, v125);
        v60 = 1.0;
        v71 = v71 * ((1.0 - v72) / (1.0 - v70));
      }
      v61 = v119;
      v73 = v71 * 0.5;
      if (!*((_BYTE *)&v2->super.super.isa + v117))
        v73 = v71;
      v69 = v69 + v73;
    }
    if (v61 > 2.5)
    {
      if (CKMainScreenScale_once_102 != -1)
      {
        dispatch_once(&CKMainScreenScale_once_102, &__block_literal_global_360_0);
        v60 = 1.0;
      }
      v74 = *(double *)&CKMainScreenScale_sMainScreenScale_102;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_102 == 0.0)
        v74 = v60;
      v69 = round(v69 * v74) / v74;
    }
    v75 = 2.0;
    if (!v2->_inlineAnimatingOut)
      v75 = 0.25;
    if (vabdd_f64(v69, v67) < v75 / v124)
    {
      v76 = v67;
    }
    else
    {
      v53 = 0;
      v76 = v69;
    }
    v129 = v53;
    v128 = v59;
    if (v59)
    {
      v77 = v59[49];
      v78 = v59[45];
      if (easingUp)
      {
        v79 = v77 - v118 - v65;
        if (v79 >= v76)
          v79 = v76;
        if (v77 >= v76)
          v80 = v76;
        else
          v80 = v59[49];
        if (v67 - (v78 - v118 - v65) > 0.00000011920929)
          v76 = v80;
        else
          v76 = v79;
      }
      else
      {
        v81 = v59[48];
        v82 = v59[51];
        v115 = v59[50];
        v116 = v82;
        v83 = *((_QWORD *)v59 + 46);
        v84 = *((_QWORD *)v59 + 47);
        v85 = *((_QWORD *)v59 + 44);
        if (v118 + CGRectGetMaxY(*(CGRect *)(&v78 - 1)) - v67 <= 0.00000011920929)
        {
          v142.origin.x = v81;
          v142.origin.y = v77;
          v142.size.width = v115;
          v142.size.height = v116;
          v86 = v118;
          v87 = v86 + CGRectGetMaxY(v142);
          if (v87 >= v76)
            v76 = v87;
        }
        else if (v77 >= v76)
        {
          v76 = v77;
        }
        v61 = v119;
      }
    }
    *(_QWORD *)(v63 + 384) = v64;
    *(double *)(v63 + 392) = v76;
    *(double *)(v63 + 400) = v20;
    *(double *)(v63 + 408) = v65;
    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    v88 = *(id *)(v63 + 632);
    v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v131, v140, 16);
    if (v89)
    {
      v90 = v89;
      v91 = *(_QWORD *)v132;
      do
      {
        for (j = 0; j != v90; ++j)
        {
          if (*(_QWORD *)v132 != v91)
            objc_enumerationMutation(v88);
          v93 = *(double **)(*((_QWORD *)&v131 + 1) + 8 * j);
          v93[49] = *(double *)(v63 + 392) + v93[45] - *(double *)(v63 + 360);
          objc_msgSend(v93, "setFrame:", v93[48], v93[49], v93[50], v93[51]);
        }
        v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v131, v140, 16);
      }
      while (v90);
    }

    v2 = v123;
    if (v61 > 2.0 && v127 != v68)
      *(double *)(v63 + 416) = v68;
    v59 = (double *)(id)v63;

    ++v58;
    v51 = v121;
    v53 = v129;
    easingUp = v122;
    v60 = 1.0;
  }
  while (v58 != v121);
  v5 = v112;
  objc_msgSend(v112, "bounds");
  v95 = v94;
  v97 = v96;
  v99 = v98;
  v101 = v100;
  v130 = 0;
  -[CKTranscriptCollectionViewLayout _configureThreadGroupsForAttributes:outMaxYAnchorAttribute:forVisibleBounds:](v2, "_configureThreadGroupsForAttributes:outMaxYAnchorAttribute:forVisibleBounds:", v113, &v130);
  v102 = v130;
  -[CKTranscriptCollectionViewLayout _visibleRectInsectsForMaxYAnchorLayoutAttribute:forVisibleBounds:](v2, "_visibleRectInsectsForMaxYAnchorLayoutAttribute:forVisibleBounds:", v102, v95, v97, v99, v101);
  objc_msgSend(v5, "_setVisibleRectEdgeInsets:");

  if ((v53 & 1) != 0)
  {
    v22 = v110;
    width = v111;
    v49 = v114;
    v16 = v109;
    v35 = v108;
    goto LABEL_102;
  }
  v22 = v110;
  width = v111;
  v49 = v114;
  v16 = v109;
  v103 = v108;
  if (v108)
  {
    objc_msgSend(v108, "timestamp");
    v105 = 0;
    if (!v2)
      goto LABEL_105;
    goto LABEL_104;
  }
  v105 = 0;
LABEL_103:
  v103 = 0;
  v104 = 0.0;
  if (v2)
LABEL_104:
    v2->_prevTimestamp = v104;
LABEL_105:
  if (v20 != width)
    -[CKTranscriptCollectionViewLayout updateContentSize](v2, "updateContentSize", v104);
  if (v2)
  {
    v2->_visibleBounds.origin.x = v16;
    v2->_visibleBounds.origin.y = v49;
    v2->_visibleBounds.size.width = v20;
    v2->_visibleBounds.size.height = v22;
  }
  if (v2->_isResting != v105)
  {
    v2->_isResting = v105;
    objc_msgSend(v5, "delegate");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "collectionViewLayoutRestingDidChange:", v2);

  }
  v6 = v113;
LABEL_23:

}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;
  CGPoint v14;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptCollectionViewLayout;
  -[CKTranscriptCollectionViewLayout invalidateLayoutWithContext:](&v8, sel_invalidateLayoutWithContext_, v4);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "valueForKey:", CFSTR("_intent"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentOffsetAdjustment");
      NSStringFromCGPoint(v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Layout invalidated with context intent:%@, and contentOffsetAdjustment: %@", buf, 0x16u);

    }
  }

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
  if (-[CKTranscriptCollectionViewLayout isUsingInitialLayoutAttributesForRotation](self, "isUsingInitialLayoutAttributesForRotation"))
  {
    -[CKTranscriptCollectionViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "section") == 1)
  {
    -[CKTranscriptCollectionViewLayout associatedLayoutAttributes](self, "associatedLayoutAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    if (v7 <= objc_msgSend(v4, "item"))
    {

    }
    else
    {
      -[CKTranscriptCollectionViewLayout associatedLayoutAttributes](self, "associatedLayoutAttributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v4, "item"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[CKTranscriptCollectionViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (void *)objc_msgSend(v10, "copy");

        objc_msgSend(v5, "setAlphaOrFilterLevel:", 1.0);
        -[CKTranscriptCollectionViewLayout insertedAssociatedLayoutAttributes](self, "insertedAssociatedLayoutAttributes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsIndex:", objc_msgSend(v4, "row"));

        if (v12)
        {
          objc_msgSend(v5, "frame");
          objc_msgSend(v5, "setFrame:");
          -[CKTranscriptCollectionViewLayout insertedAssociatedLayoutAttributes](self, "insertedAssociatedLayoutAttributes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeIndex:", objc_msgSend(v4, "row"));

        }
        goto LABEL_13;
      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)CKTranscriptCollectionViewLayout;
  -[CKTranscriptCollectionViewLayout initialLayoutAttributesForAppearingItemAtIndexPath:](&v19, sel_initialLayoutAttributesForAppearingItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptCollectionViewLayout indicesOfChatItemsToBeInsertedWithoutFading](self, "indicesOfChatItemsToBeInsertedWithoutFading");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsIndex:", objc_msgSend(v4, "item"));

  if (v15)
    objc_msgSend(v5, "setAlphaOrFilterLevel:", 1.0);
  -[CKTranscriptCollectionViewLayout indicesOfReplyChatItemsToBeInserted](self, "indicesOfReplyChatItemsToBeInserted");
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
  void *v5;
  NSMutableDictionary *finalParentVerticalOffsets;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  objc_super v14;
  objc_super v15;

  v4 = a3;
  if (-[CKTranscriptCollectionViewLayout isUsingInitialLayoutAttributesForRotation](self, "isUsingInitialLayoutAttributesForRotation"))
  {
    -[CKTranscriptCollectionViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "section") == 1)
  {
    v15.receiver = self;
    v15.super_class = (Class)CKTranscriptCollectionViewLayout;
    -[CKTranscriptCollectionViewLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](&v15, sel_finalLayoutAttributesForDisappearingItemAtIndexPath_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
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
    v14.receiver = self;
    v14.super_class = (Class)CKTranscriptCollectionViewLayout;
    -[CKTranscriptCollectionViewLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](&v14, sel_finalLayoutAttributesForDisappearingItemAtIndexPath_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptCollectionViewLayout indicesOfChatItemsToBeRemovedWithoutFading](self, "indicesOfChatItemsToBeRemovedWithoutFading");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsIndex:", objc_msgSend(v4, "item"));

    if (v12)
      objc_msgSend(v5, "setAlphaOrFilterLevel:", 0.0);
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
  CKTranscriptCollectionViewLayout *v97;
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
  -[CKTranscriptCollectionViewLayout layoutAttributes](self, "layoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldUseRotisserieScrolling");

  v97 = self;
  -[CKTranscriptCollectionViewLayout collectionView](self, "collectionView");
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
  -[CKTranscriptCollectionViewLayout associatedLayoutAttributes](v97, "associatedLayoutAttributes");
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

  -[CKTranscriptCollectionViewLayout decorationLayoutAttributes](v97, "decorationLayoutAttributes");
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
        -[CKTranscriptCollectionViewLayout collectionView](v97, "collectionView");
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
  unint64_t v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "section"))
    -[CKTranscriptCollectionViewLayout associatedLayoutAttributes](self, "associatedLayoutAttributes");
  else
    -[CKTranscriptCollectionViewLayout layoutAttributes](self, "layoutAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") && (v6 = objc_msgSend(v4, "item"), v6 < objc_msgSend(v5, "count")))
  {
    objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "item"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  -[CKTranscriptCollectionViewLayout decorationLayoutAttributes](self, "decorationLayoutAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "section");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGSize)collectionViewContentSize
{
  id v3;
  double width;
  double height;
  CGSize result;

  v3 = -[CKTranscriptCollectionViewLayout layoutAttributes](self, "layoutAttributes");
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
  void *v18;
  char v19;
  BOOL v20;
  char v21;
  void *v22;
  char v23;
  NSDate *v24;
  NSDate *lastTouchTime;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[CKTranscriptCollectionViewLayout isHoldingBoundsInvalidation](self, "isHoldingBoundsInvalidation", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    -[CKTranscriptCollectionViewLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;

    -[CKTranscriptCollectionViewLayout collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentEffectForCollectionView:layout:", v15, self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "shouldUseDynamicScrolling");
    v20 = y - v12 < 0.0;
    if (y - v12 > 0.0)
      v20 = 1;
    v21 = v19 & v20;

    if (self->_coalesceInvalidations)
    {
      if (v17)
        goto LABEL_16;
    }
    else
    {
      if (self->_displayLink)
        v21 = 0;
      if (v17)
        goto LABEL_16;
    }
    if ((v21 & 1) == 0)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "shouldUseRotisserieScrolling");

      if ((v23 & 1) == 0 && v14 == width && v10 == x)
      {
        v7 = 0;
LABEL_19:

        return v7;
      }
    }
LABEL_16:
    if (self->_coalesceInvalidations)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v24 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastTouchTime = self->_lastTouchTime;
      self->_lastTouchTime = v24;

      kdebug_trace();
    }
    v7 = 1;
    goto LABEL_19;
  }
  return 0;
}

- (void)reloadData
{
  void *v3;

  -[CKTranscriptCollectionViewLayout setLayoutAttributes:](self, "setLayoutAttributes:", 0);
  -[CKTranscriptCollectionViewLayout associatedLayoutAttributes](self, "associatedLayoutAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptCollectionViewLayout setOldAssociatedLayoutAttributes:](self, "setOldAssociatedLayoutAttributes:", v3);

  -[CKTranscriptCollectionViewLayout setAssociatedLayoutAttributes:](self, "setAssociatedLayoutAttributes:", 0);
  -[CKTranscriptCollectionViewLayout setDecorationLayoutAttributes:](self, "setDecorationLayoutAttributes:", 0);
}

- (void)updateAssociatedLayoutAttributesIfNecessary
{
  id v2;

  v2 = -[CKTranscriptCollectionViewLayout layoutAttributes](self, "layoutAttributes");
}

- (void)invalidateDisplayLink
{
  if (self)
  {
    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    -[CKTranscriptCollectionViewLayout setDisplayLink:]((uint64_t)self, 0);
    self->_prevTimestamp = 0.0;
  }
  else
  {
    objc_msgSend(0, "invalidate");
    -[CKTranscriptCollectionViewLayout setDisplayLink:](0, 0);
  }
  -[CKTranscriptCollectionViewLayout setLastTouchTime:](self, "setLastTouchTime:", 0);
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

- (void)reloadLayout
{
  -[CKTranscriptCollectionViewLayout reloadData](self, "reloadData");
  -[CKTranscriptCollectionViewLayout invalidateLayout](self, "invalidateLayout");
}

- (NSArray)layoutAttributes
{
  CKTranscriptCollectionViewLayout *v2;
  NSArray **p_layoutAttributes;
  NSArray *layoutAttributes;
  void *v5;
  void *v6;
  uint64_t v7;
  NSArray *v8;
  NSArray *v9;
  uint64_t v10;
  void *v11;
  id *v12;
  void *v13;
  void *v14;
  CKTranscriptCollectionViewLayout *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  NSMutableDictionary *initialParentLayoutAttributes;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  CKTranscriptCollectionViewLayout *v32;
  void *v33;
  _QWORD *v34;
  NSMutableDictionary *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  BOOL v41;
  uint64_t v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  NSArray *decorationLayoutAttributes;
  void *v64;
  void *v65;
  NSArray *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  CKTranscriptCollectionViewLayout *v71;
  NSArray *associatedLayoutAttributes;
  NSArray *v73;
  id *location;
  CKTranscriptCollectionViewLayout *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  id obj;
  void *v82;
  id *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  NSArray *v87;
  NSArray *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  uint64_t v94;

  v2 = self;
  v94 = *MEMORY[0x1E0C80C00];
  p_layoutAttributes = &self->_layoutAttributes;
  layoutAttributes = self->_layoutAttributes;
  if (!layoutAttributes)
  {
    location = (id *)p_layoutAttributes;
    -[CKTranscriptCollectionViewLayout collectionView](v2, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = (void *)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass");
    v79 = v6;
    v80 = v5;
    v7 = objc_msgSend(v6, "collectionView:numberOfItemsInSection:", v5, 0);
    obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
    v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v88 = v8;
    v77 = v7;
    if (v7)
    {
      v9 = v8;
      v10 = 0;
      v76 = v2;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v10, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "layoutAttributesForCellWithIndexPath:", v11);
        v12 = (id *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "collectionView:layout:chatItemForItemAtIndexPath:", v80, v2, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setChatItem:", v13);
        objc_msgSend(obj, "addObject:", v12);
        if (!v10)
        {
          objc_opt_class();
          -[CKTranscriptCollectionViewLayout setHasLoadMore:](v2, "setHasLoadMore:", objc_opt_isKindOfClass() & 1);
        }
        objc_msgSend(v13, "visibleAssociatedMessageChatItems");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = v14;
        if (v14)
        {
          v82 = v13;
          v83 = v12;
          v84 = v11;
          v85 = v10;
          v15 = v2;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = 0u;
          v90 = 0u;
          v91 = 0u;
          v92 = 0u;
          v17 = v14;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v90;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v90 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * i);
                v23 = -[NSArray count](v9, "count");
                objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v23, 1);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:](CKTranscriptCollectionViewLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v24);
                v25 = (_QWORD *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "setChatItem:", v22);
                initialParentLayoutAttributes = v15->_initialParentLayoutAttributes;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary objectForKey:](initialParentLayoutAttributes, "objectForKey:", v27);
                v28 = objc_claimAutoreleasedReturnValue();
                v29 = (void *)v25[80];
                v25[80] = v28;

                v9 = v88;
                objc_msgSend(v16, "addObject:", v25);
                -[NSArray addObject:](v88, "addObject:", v25);

              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
            }
            while (v19);
          }

          v2 = v15;
          v11 = v84;
          v10 = v85;
          v13 = v82;
          v12 = v83;
          v14 = v86;
        }
        else
        {
          v16 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v13, "messageHighlightChatItem");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            v31 = -[NSArray count](v9, "count");
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v31, 1);
            v32 = v2;
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:](CKTranscriptCollectionViewLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v33);
            v34 = (_QWORD *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setChatItem:", v30);
            v35 = v32->_initialParentLayoutAttributes;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKey:](v35, "objectForKey:", v36);
            v37 = objc_claimAutoreleasedReturnValue();
            v38 = (void *)v34[80];
            v34[80] = v37;

            v9 = v88;
            -[NSArray addObject:](v88, "addObject:", v34);
            if (!v16)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v16, "addObject:", v34);

            v14 = v86;
            v2 = v76;
          }

        }
        if (v16)
          objc_storeStrong(v12 + 79, v16);

        ++v10;
      }
      while (v10 != v77);
    }
    -[CKTranscriptCollectionViewLayout _configureThreadGroupsForAttributes:outMaxYAnchorAttribute:forVisibleBounds:](v2, "_configureThreadGroupsForAttributes:outMaxYAnchorAttribute:forVisibleBounds:", obj, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v79, "currentEffectForCollectionView:layout:", v80, v2);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v39;
    if (v2->_decorationLayoutAttributes)
      v41 = 1;
    else
      v41 = v39 == 0;
    if (!v41)
    {
      v87 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v42 = objc_msgSend(v40, "layerCount");
      v43 = objc_msgSend(v40, "shouldDrawOverNavigationBar");
      if (v42)
        v44 = v43;
      else
        v44 = 0;
      v45 = v42 - v44;
      if (v42 != v44)
      {
        v46 = 0;
        do
        {
          if (objc_msgSend(v40, "effectViewClass"))
          {
            v47 = (void *)MEMORY[0x1E0CEA460];
            +[CKFullscreenEffectDecorationView decorationViewKind](CKFullscreenEffectDecorationView, "decorationViewKind");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v46);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "layoutAttributesForDecorationViewOfKind:withIndexPath:", v48, v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            -[CKTranscriptCollectionViewLayout collectionView](v2, "collectionView");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "bounds");
            v53 = v52;
            v55 = v54;
            v57 = v56;
            v59 = v58;

            objc_msgSend(v50, "setFrame:", v53, v55, v57, v59);
            v60 = objc_msgSend(v40, "isForegroundEffect");
            v61 = 1000;
            if (v45 - 1 == v46)
              v61 = 3000;
            if (!v46)
              v61 = -2000;
            if ((v60 & 1) != 0)
              v62 = 3000;
            else
              v62 = v61;
            objc_msgSend(v50, "setZIndex:", v62);
            -[NSArray addObject:](v87, "addObject:", v50);

          }
          ++v46;
        }
        while (v45 != v46);
      }
      decorationLayoutAttributes = v2->_decorationLayoutAttributes;
      v2->_decorationLayoutAttributes = v87;

    }
    objc_storeStrong(location, obj);
    -[CKTranscriptCollectionViewLayout oldAssociatedLayoutAttributes](v2, "oldAssociatedLayoutAttributes");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
      -[CKTranscriptCollectionViewLayout oldAssociatedLayoutAttributes](v2, "oldAssociatedLayoutAttributes");
    else
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = v88;
    if (!v88)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v66 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    -[NSArray differenceFromArray:withOptions:usingEquivalenceTest:](v66, "differenceFromArray:withOptions:usingEquivalenceTest:", v65, 0, &__block_literal_global_61_1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    IMIndexesFromOrderedCollectionDifference();
    v68 = 0;
    v69 = 0;
    v70 = (void *)objc_msgSend(v68, "mutableCopy");
    -[CKTranscriptCollectionViewLayout setInsertedAssociatedLayoutAttributes:](v2, "setInsertedAssociatedLayoutAttributes:", v70);

    -[CKTranscriptCollectionViewLayout setOldAssociatedLayoutAttributes:](v2, "setOldAssociatedLayoutAttributes:", 0);
    v71 = v2;
    associatedLayoutAttributes = v2->_associatedLayoutAttributes;
    v71->_associatedLayoutAttributes = v66;
    v73 = v66;

    -[CKTranscriptCollectionViewLayout updateFrames](v71, "updateFrames");
    -[CKTranscriptCollectionViewLayout updateContentSize](v71, "updateContentSize");

    layoutAttributes = (NSArray *)*location;
  }
  return layoutAttributes;
}

uint64_t __52__CKTranscriptCollectionViewLayout_layoutAttributes__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_configureThreadGroupsForAttributes:(id)a3 outMaxYAnchorAttribute:(id *)a4 forVisibleBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id *v15;
  id *v16;
  id v17;
  int isKindOfClass;
  void *v19;
  void *v20;
  char v21;
  int v22;
  int v23;
  char v24;
  BOOL v25;
  int v26;
  id v27;
  void *v28;
  id *v29;
  id v30;
  void (**v31)(void *, id *, id);
  void (**v32)(void);
  int v33;
  void *v34;
  unsigned int v35;
  uint64_t v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[11];
  _QWORD aBlock[7];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  id *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  _QWORD v56[5];
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _BYTE v64[128];
  uint64_t v65;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v65 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (-[CKTranscriptCollectionViewLayout isUsingOverlayLayout](self, "isUsingOverlayLayout"))
    goto LABEL_43;
  v29 = a4;
  v30 = v11;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__79;
  v62 = __Block_byref_object_dispose__79;
  v63 = 0;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = __Block_byref_object_copy__79;
  v56[4] = __Block_byref_object_dispose__79;
  v57 = 0;
  v50 = 0;
  v51 = (id *)&v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__79;
  v54 = __Block_byref_object_dispose__79;
  v55 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__79;
  v48 = __Block_byref_object_dispose__79;
  v49 = 0;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __112__CKTranscriptCollectionViewLayout__configureThreadGroupsForAttributes_outMaxYAnchorAttribute_forVisibleBounds___block_invoke;
  aBlock[3] = &unk_1E2757668;
  aBlock[4] = &v58;
  aBlock[5] = &v50;
  aBlock[6] = v56;
  v31 = (void (**)(void *, id *, id))_Block_copy(aBlock);
  v42[0] = v12;
  v42[1] = 3221225472;
  v42[2] = __112__CKTranscriptCollectionViewLayout__configureThreadGroupsForAttributes_outMaxYAnchorAttribute_forVisibleBounds___block_invoke_2;
  v42[3] = &unk_1E2757690;
  v42[4] = &v58;
  v42[5] = &v50;
  *(CGFloat *)&v42[7] = x;
  *(CGFloat *)&v42[8] = y;
  *(CGFloat *)&v42[9] = width;
  *(CGFloat *)&v42[10] = height;
  v42[6] = &v44;
  v32 = (void (**)(void))_Block_copy(v42);
  v35 = -[CKTranscriptCollectionViewLayout chatStyle](self, "chatStyle");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v11;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v64, 16);
  if (!v13)
    goto LABEL_40;
  v36 = *(_QWORD *)v39;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v39 != v36)
        objc_enumerationMutation(obj);
      v15 = *(id **)(*((_QWORD *)&v38 + 1) + 8 * i);
      objc_msgSend(obj, "lastObject");
      v16 = (id *)objc_claimAutoreleasedReturnValue();

      v17 = v15[82];
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      objc_opt_class();
      if (((objc_opt_isKindOfClass() | isKindOfClass) & 1) != 0)
      {
        objc_msgSend(v17, "IMChatItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "itemIsReplyContextPreview") & 1) != 0
          || (objc_msgSend(v19, "itemIsThreadOriginator") & 1) != 0)
        {
          v20 = (void *)v59[5];
          if ((v20 != 0) | isKindOfClass & 1)
          {
            v33 = isKindOfClass ^ 1;
            goto LABEL_14;
          }
          v31[2](v31, v15, v17);
LABEL_34:

          goto LABEL_35;
        }
        v33 = 0;
        v20 = (void *)v59[5];
LABEL_14:
        if (!objc_msgSend(v20, "count"))
          goto LABEL_34;
        objc_msgSend(v19, "threadGroupIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = IMMessageThreadIdentifierOriginatorGUIDAndPartMatch();
        v22 = objc_msgSend(v19, "isFromMe");
        v23 = objc_msgSend(v19, "itemIsReply");
        if (v35 == 45)
          v24 = v22;
        else
          v24 = 1;
        if ((v24 & 1) != 0)
        {
          v25 = 0;
LABEL_22:
          if (!((v25 || (v21 & 1) == 0) | isKindOfClass & 1))
          {
            objc_msgSend((id)v59[5], "addObject:", v15);
            objc_storeStrong(v51 + 5, v15);
          }
        }
        else if (objc_msgSend(v19, "contiguousType") != 2)
        {
          v25 = objc_msgSend(v19, "contiguousType") == 3;
          goto LABEL_22;
        }
        if (objc_msgSend(v17, "chatItemReplyLineContiguousTypeForChatStyle:", v35))
          v26 = v22;
        else
          v26 = 1;
        if (isKindOfClass & 1 | ((v23 & v26 & 1) == 0))
        {
          if ((unint64_t)objc_msgSend((id)v59[5], "count") >= 2)
            v32[2]();
          v27 = v51[5];
          v51[5] = 0;

          v28 = (void *)v59[5];
          v59[5] = 0;

          if (v15 != v16 && !(isKindOfClass & 1 | (((v23 | v33) & 1) == 0)))
            v31[2](v31, v15, v17);
        }

        goto LABEL_34;
      }
LABEL_35:
      if (v15 == v16 && (unint64_t)objc_msgSend((id)v59[5], "count") >= 2)
        v32[2]();

    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v64, 16);
  }
  while (v13);
LABEL_40:

  if (v29)
    *v29 = objc_retainAutorelease((id)v45[5]);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(v56, 8);
  _Block_object_dispose(&v58, 8);

  v11 = v30;
LABEL_43:

}

void __112__CKTranscriptCollectionViewLayout__configureThreadGroupsForAttributes_outMaxYAnchorAttribute_forVisibleBounds___block_invoke(_QWORD *a1, void *a2, void *a3)
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

void __112__CKTranscriptCollectionViewLayout__configureThreadGroupsForAttributes_outMaxYAnchorAttribute_forVisibleBounds___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double MaxY;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);

  if (v2 == v3)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "removeLastObject");
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v6 = *(void **)(v5 + 648);
  *(_QWORD *)(v5 + 648) = v4;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(v7);
      if (CGRectIntersectsRect(*(CGRect *)(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11) + 384), *(CGRect *)(a1 + 56)))
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          goto LABEL_5;
        goto LABEL_16;
      }
    }

    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(_QWORD *)(v12 + 40))
    {
      MaxY = CGRectGetMaxY(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 384));
      if (MaxY <= CGRectGetMaxY(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 384)))
        return;
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    }
    v14 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = *(id *)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v14;
  }
LABEL_16:

}

- (void)updateContentSize
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  CGRect *v7;
  double MaxY;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v20;
  void *v21;
  double v22;
  CGRect *v23;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[CKTranscriptCollectionViewLayout layoutAttributes](self, "layoutAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v23 = (CGRect *)objc_claimAutoreleasedReturnValue();

  -[CKTranscriptCollectionViewLayout associatedLayoutAttributes](self, "associatedLayoutAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (CGRect *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    MaxY = CGRectGetMaxY(v23[11]);
    if (v7)
    {
      v9 = CGRectGetMaxY(v7[11]);
      if (MaxY < v9)
        MaxY = v9;
    }
    -[CKTranscriptCollectionViewLayout collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayScale");
    if (v12 == 0.0)
    {
      if (CKMainScreenScale_once_102 != -1)
        dispatch_once(&CKMainScreenScale_once_102, &__block_literal_global_360_0);
      v12 = *(double *)&CKMainScreenScale_sMainScreenScale_102;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_102 == 0.0)
        v12 = 1.0;
    }
    v13 = ceil(MaxY * v12) / v12;

    -[CKTranscriptCollectionViewLayout collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15;

    -[CKTranscriptCollectionViewLayout sizeForRotation](self, "sizeForRotation");
    if (v18 == v3 && v17 == v4)
    {
      v3 = v16;
    }
    else
    {
      -[CKTranscriptCollectionViewLayout sizeForRotation](self, "sizeForRotation");
      v3 = v20;
    }
    -[CGRect chatItem](v23, "chatItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "bottomTranscriptSpaceWithLastChatItem:", v21);
    v4 = v13 + v22;

  }
  -[CKTranscriptCollectionViewLayout setContentSize:]((double *)self, v3, v4);

}

- (void)setContentSize:(double)a3
{
  void *v5;
  id v6;

  if (a1)
  {
    if (a1[55] != a2 || a1[56] != a3)
    {
      a1[55] = a2;
      a1[56] = a3;
      objc_msgSend(a1, "collectionView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "collectionViewLayout:sizeDidChange:", a1, a1[55], a1[56]);
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
  id obj;
  uint8_t buf[16];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKTranscriptCollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)v34;
    do
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(obj);
        v13 = *(double **)(*((_QWORD *)&v33 + 1) + 8 * v11);
        objc_msgSend(v13, "setFrame:", v13[48], v13[49], v13[50], v13[51]);
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
              v20 = 0.00499999989;
            else
              v20 = 0.0;
          }
          objc_msgSend(v13, "bounds");
          v22 = v21;
          objc_msgSend(v13, "center");
          v24 = v23;
          -[CKTranscriptCollectionViewLayout anchorYPosition](self, "anchorYPosition");
          v26 = vabdd_f64(v24, v25);
          v27 = 0.0;
          for (i = -1; i != 2; ++i)
          {
            v29 = (v26 + v22 * (double)i * 0.5) / v7;
            if (v29 > 1.0)
              v29 = 1.0;
            -[CKTranscriptCollectionViewLayout bezierPointForPercentage:anchor1:anchor2:control1:control2:](self, "bezierPointForPercentage:anchor1:anchor2:control1:control2:", fmax(v29, 0.0), v20, v20 + 0.75, v20 + 0.75, v20 + 0.75);
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
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
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
  -[CKTranscriptCollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  -[CKTranscriptCollectionViewLayout anchorYPosition](self, "anchorYPosition");
  v39 = v8;
  -[CKTranscriptCollectionViewLayout targetContentOffset](self, "targetContentOffset");
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
            -[CKTranscriptCollectionViewLayout bezierPointForPercentage:anchor1:anchor2:control1:control2:](self, "bezierPointForPercentage:anchor1:anchor2:control1:control2:", fmax(v36, 0.0), v32, v33, v32, v32);
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
    -[CKTranscriptCollectionViewLayout layoutAttributes](self, "layoutAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptCollectionViewLayout updateAttributesForAnchorYChangeWithAttributes:](self, "updateAttributesForAnchorYChangeWithAttributes:", v4);

    -[CKTranscriptCollectionViewLayout associatedLayoutAttributes](self, "associatedLayoutAttributes");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptCollectionViewLayout updateAttributesForAnchorYChangeWithAttributes:](self, "updateAttributesForAnchorYChangeWithAttributes:", v5);

  }
}

- (void)setTargetContentOffset:(CGPoint)a3
{
  void *v5;
  id v6;

  if (a3.x != self->_targetContentOffset.x || a3.y != self->_targetContentOffset.y)
  {
    -[CKTranscriptCollectionViewLayout layoutAttributes](self, "layoutAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptCollectionViewLayout updateAttributesForTargetContentOffsetChangeWithAttributes:](self, "updateAttributesForTargetContentOffsetChangeWithAttributes:", v5);

    -[CKTranscriptCollectionViewLayout associatedLayoutAttributes](self, "associatedLayoutAttributes");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptCollectionViewLayout updateAttributesForTargetContentOffsetChangeWithAttributes:](self, "updateAttributesForTargetContentOffsetChangeWithAttributes:", v6);

  }
}

- (double)bezierPointForPercentage:(double)a3 anchor1:(double)a4 anchor2:(double)a5 control1:(double)a6 control2:(double)a7
{
  return a3 * a3 * 3.0 * (a4 + a6 * -2.0 + a7) + pow(a3, 3.0) * (a5 + (a6 - a7) * 3.0 - a4) + a3 * 3.0 * (a6 - a4) + a4;
}

- (void)displayLinkFired:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;

  kdebug_trace();
  if (!self->_coalesceInvalidations || !self->_lastTouchTime)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", self->_lastTouchTime);
  v6 = v5;

  v7 = dbl_18E7CC300[!self->_useFastQuanta];
  if (v6 > v7 || CKFloatApproximatelyEqualToFloatWithTolerance(v6, v7, 0.00000999999975))
  {
    kdebug_trace();
LABEL_6:
    -[CKTranscriptCollectionViewLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)updateFrames
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v27;
  CGFloat *v28;
  int *v29;
  __objc2_class **v30;
  double v31;
  uint64_t v32;
  CGFloat *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int isKindOfClass;
  char v40;
  char v41;
  char v42;
  void *v43;
  char v44;
  int v45;
  char v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  double v55;
  double v56;
  int v57;
  double v58;
  int v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  uint64_t v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  int v74;
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
  void *v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  id v94;
  CGFloat *v95;
  CKTranscriptCollectionViewLayout *v96;
  int *v97;
  __objc2_class **v98;
  void *v99;
  void *v100;
  char v101;
  uint64_t v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t i;
  uint64_t v108;
  void *v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double MaxY;
  void *v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double MidX;
  double MidY;
  void *v126;
  double v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  char v131;
  char v132;
  int v133;
  BOOL v134;
  BOOL v135;
  uint64_t v136;
  double v137;
  uint64_t v138;
  double v139;
  void *v140;
  double x;
  double y;
  double width;
  double height;
  double MinY;
  double v146;
  void *v147;
  void *v148;
  void *v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  int v155;
  int v156;
  _BOOL4 v157;
  double v161;
  int v162;
  BOOL v163;
  CGFloat v164;
  double v165;
  double v166;
  double v167;
  CGFloat v168;
  double v169;
  double v170;
  void *v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  id v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t j;
  CGFloat *v183;
  double v184;
  CGFloat v185;
  double v186;
  CGFloat v187;
  double v188;
  CGFloat v189;
  double v190;
  CGFloat v191;
  double v192;
  double v193;
  double v194;
  CGFloat v195;
  double v196;
  CGFloat v197;
  double v198;
  CGFloat v199;
  double v200;
  CGFloat v201;
  double v202;
  double v203;
  id v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t k;
  uint64_t v209;
  void *v210;
  double v211;
  double v212;
  double v213;
  void *v214;
  double v215;
  double v216;
  double v217;
  double v218;
  _BOOL4 v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  double v227;
  double v228;
  uint64_t v229;
  double v230;
  double v231;
  double v232;
  double v233;
  id obj;
  double v235;
  double v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  uint64_t v240;
  void *v241;
  void *v242;
  CGFloat v243;
  void *v244;
  CGFloat *v245;
  uint64_t v246;
  int v247;
  double v248;
  CGFloat rect;
  CKTranscriptCollectionViewLayout *v250;
  uint64_t v251;
  void *v252;
  void *v253;
  uint64_t v254;
  int v255;
  double v256;
  int v257;
  double v258;
  char v259;
  id v260;
  int v261;
  double v262;
  char v263;
  double v264;
  BOOL v265;
  int v266;
  double v267;
  BOOL v268;
  char v269;
  double v270;
  double v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  _QWORD v284[5];
  _OWORD v285[3];
  uint64_t v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  uint64_t v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  _BYTE v299[128];
  _BYTE v300[128];
  _BYTE v301[128];
  _BYTE v302[128];
  _BYTE v303[128];
  uint64_t v304;
  CGRect v305;
  CGRect v306;
  CGRect v307;
  CGRect v308;
  CGRect v309;
  CGRect v310;
  CGRect v311;
  CGRect v312;
  CGRect v313;
  CGRect v314;
  CGRect v315;
  CGRect v316;
  CGRect v317;
  CGRect v318;
  CGRect v319;
  CGRect v320;
  CGRect v321;

  v304 = *MEMORY[0x1E0C80C00];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "smallTranscriptSpace");
  v232 = v4;
  objc_msgSend(v3, "mediumTranscriptSpace");
  v231 = v5;
  objc_msgSend(v3, "largeTranscriptSpace");
  v233 = v6;
  objc_msgSend(v3, "extraLargeTranscriptSpace");
  v230 = v7;
  objc_msgSend(v3, "topTranscriptSpace");
  v9 = v8;
  -[CKTranscriptCollectionViewLayout collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v248 = round(v9 * v12) / v12;

  -[CKTranscriptCollectionViewLayout layoutAttributes](self, "layoutAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "chatItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "balloonBalloonTranscriptSpace:", objc_msgSend(v15, "contiguousType"));
      v248 = v16;
    }

  }
  -[CKTranscriptCollectionViewLayout collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v19 = v18;
  v239 = v17;
  objc_msgSend(v17, "marginInsets");
  v21 = v20;
  v23 = v22;
  -[CKTranscriptCollectionViewLayout sizeForRotation](self, "sizeForRotation");
  if (v25 != *MEMORY[0x1E0C9D820] || v24 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[CKTranscriptCollectionViewLayout sizeForRotation](self, "sizeForRotation");
    v19 = v27;
  }
  v297 = 0u;
  v298 = 0u;
  v295 = 0u;
  v296 = 0u;
  obj = v13;
  v240 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v295, v303, 16);
  if (v240)
  {
    v244 = v3;
    v251 = 0;
    v28 = 0;
    v29 = &OBJC_IVAR___CKTranscriptCollectionViewLayoutAttributes__associatedLayoutAttributes;
    v30 = off_1E2733000;
    v238 = *(_QWORD *)v296;
    v31 = *MEMORY[0x1E0C9D648];
    rect = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v235 = v23;
    v236 = v21;
    v243 = v19;
    v250 = self;
    while (1)
    {
      v32 = 0;
      v33 = v28;
      do
      {
        if (*(_QWORD *)v296 != v238)
          objc_enumerationMutation(obj);
        v34 = *(_QWORD *)(*((_QWORD *)&v295 + 1) + 8 * v32);
        objc_msgSend((id)v34, "chatItem");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        __48__CKTranscriptCollectionViewLayout_updateFrames__block_invoke((uint64_t)v35, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        -[CGFloat chatItem](v33, "chatItem");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        __48__CKTranscriptCollectionViewLayout_updateFrames__block_invoke((uint64_t)v37, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        v253 = v36;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v247 = objc_msgSend(v36, "isAppearing");
        else
          v247 = 0;
        v252 = v38;
        v245 = v33;
        v246 = v32;
        if (v38)
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          objc_opt_class();
          v40 = objc_opt_isKindOfClass();
          objc_opt_class();
          v41 = objc_opt_isKindOfClass();
          v42 = 1;
          v266 = isKindOfClass;
          if ((v41 & 1) != 0)
          {
            v43 = v244;
          }
          else
          {
            v43 = v244;
            if ((v40 & 1) == 0)
            {
              objc_opt_class();
              v42 = objc_opt_isKindOfClass();
            }
          }
          v269 = v42;
          objc_opt_class();
          v263 = objc_opt_isKindOfClass();
          objc_opt_class();
          v259 = objc_opt_isKindOfClass();
          objc_opt_class();
          v44 = objc_opt_isKindOfClass();
          v255 = objc_msgSend(v38, "itemIsReplyContextPreview");
          v45 = objc_msgSend(v38, "itemIsThreadOriginator");
          v261 = objc_msgSend(v38, "itemIsReplyCount");
          v257 = objc_msgSend(v38, "itemIsReply");
          objc_opt_class();
          v46 = objc_opt_isKindOfClass();
          objc_opt_class();
          v47 = objc_opt_isKindOfClass();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if ((v40 & 1) != 0)
            {
              objc_msgSend(v253, "IMChatItem");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "dataSource");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "messageGUID");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "IMChatItem");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "dataSource");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "messageGUID");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = objc_msgSend(v50, "isEqualToString:", v53);

              if (v54)
              {
                v55 = v232 + v248;
                v38 = v252;
                self = v250;
                if (objc_msgSend(v252, "hasTail"))
                {
                  objc_msgSend(v43, "balloonMaskTailSizeForTailShape:", 1);
                  v55 = v55 + v56;
                }
                v248 = v55;
LABEL_35:
                v29 = &OBJC_IVAR___CKTranscriptCollectionViewLayoutAttributes__associatedLayoutAttributes;
                v33 = v245;
                v32 = v246;
LABEL_48:
                v30 = off_1E2733000;
LABEL_124:
                if ((v269 & 1) == 0)
                  goto LABEL_127;
LABEL_125:
                if (objc_msgSend(v38, "hasTail"))
                {
                  objc_msgSend(v244, "balloonMaskTailSizeForTailShape:", 1);
                  v248 = v248 - v78;
                }
                goto LABEL_127;
              }
            }
            objc_opt_class();
            v38 = v252;
            self = v250;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v248 = v233 + v248;
              goto LABEL_35;
            }
            v29 = &OBJC_IVAR___CKTranscriptCollectionViewLayoutAttributes__associatedLayoutAttributes;
            v32 = v246;
            v30 = off_1E2733000;
            if ((v266 & 1) != 0)
            {
              v248 = v233 + v248;
              v33 = v245;
              goto LABEL_124;
            }
            v33 = v245;
            if ((v263 & 1) != 0)
            {
              v59 = objc_msgSend(v253, "transcriptOrientation");
              v58 = v232;
              if (v59 == 1)
                v58 = v233;
              goto LABEL_69;
            }
            if ((v269 & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                goto LABEL_76;
              if ((v259 & 1) == 0)
                goto LABEL_116;
              v71 = v231;
LABEL_100:
              v72 = v71 + v248;
              goto LABEL_118;
            }
            v64 = v233;
LABEL_66:
            v61 = v248;
LABEL_103:
            v73 = v64 + v61;
LABEL_104:
            v248 = v73;
            goto LABEL_125;
          }
          objc_opt_class();
          v29 = &OBJC_IVAR___CKTranscriptCollectionViewLayoutAttributes__associatedLayoutAttributes;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if (v46 & 1 | ((objc_opt_isKindOfClass() & v266 & 1) == 0))
            {
              objc_opt_class();
              v32 = v246;
              v30 = off_1E2733000;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v248 = v232 + v248;
                v33 = v245;
                goto LABEL_123;
              }
              objc_opt_class();
              v33 = v245;
              self = v250;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v60 = v233;
                goto LABEL_55;
              }
              v61 = v248;
              if ((v266 & 1) != 0)
              {
LABEL_71:
                v60 = v232;
              }
              else
              {
                if ((v263 & 1) == 0)
                {
                  if ((v269 & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      goto LABEL_116;
LABEL_76:
                    objc_msgSend(v244, "balloonBalloonTranscriptSpace:", objc_msgSend(v38, "contiguousType"));
LABEL_117:
                    v72 = v248 + v68;
LABEL_118:
                    v248 = v72;
                    goto LABEL_127;
                  }
                  v64 = v233;
                  goto LABEL_103;
                }
                v60 = v233;
              }
LABEL_94:
              v66 = v60 + v61;
LABEL_95:
              v248 = v66;
              goto LABEL_124;
            }
LABEL_46:
            v248 = v233 + v248;
            v33 = v245;
            v32 = v246;
LABEL_47:
            self = v250;
            goto LABEL_48;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v32 = v246;
            v30 = off_1E2733000;
            if (v261)
            {
              v57 = objc_msgSend(v253, "itemIsFromMe");
              v33 = v245;
              self = v250;
              if (v57 == objc_msgSend(v38, "itemIsFromMe"))
              {
                v65 = objc_msgSend(v38, "replyCount");
                v58 = v231;
                if (v65 == 1)
                  objc_msgSend(v244, "xsTranscriptSpace", v231);
              }
              else
              {
                objc_msgSend(v244, "minTranscriptSpace");
              }
LABEL_69:
              v66 = v248 + v58;
              goto LABEL_95;
            }
            v61 = v248;
            v33 = v245;
            self = v250;
            if ((v266 & 1) == 0 && (v263 & 1) == 0)
            {
              if ((v269 & 1) == 0)
                goto LABEL_242;
              v64 = v231;
              goto LABEL_103;
            }
LABEL_58:
            v60 = v231;
            goto LABEL_94;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v47 & 1 | ((v266 & 1) == 0))
            {
              v30 = off_1E2733000;
              if ((v266 & 1) == 0)
              {
                self = v250;
                if (-[CKTranscriptCollectionViewLayout nextItemIsOriginatorWithRepliesForIndex:](v250, "nextItemIsOriginatorWithRepliesForIndex:", v251))
                {
                  v69 = v230;
                  v70 = v248;
                }
                else
                {
                  v70 = v248;
                  if ((v263 & 1) != 0)
                  {
                    v69 = v231;
                  }
                  else
                  {
                    if (!v257)
                    {
                      if ((v269 & 1) == 0)
                      {
                        if ((v44 & 1) != 0)
                        {
                          v248 = v231 + v248;
                        }
                        else
                        {
                          -[CKTranscriptCollectionViewLayout handleInvalidCaseForChatItem:withPrevChatItem:](v250, "handleInvalidCaseForChatItem:withPrevChatItem:", v253, v38);
                          v248 = v248 + v226;
                        }
                        v33 = v245;
                        v32 = v246;
                        goto LABEL_127;
                      }
                      v248 = v231 + v248;
                      v33 = v245;
                      v32 = v246;
                      goto LABEL_125;
                    }
                    v69 = v230;
                  }
                }
                v248 = v69 + v70;
                v33 = v245;
                v32 = v246;
                goto LABEL_124;
              }
              v248 = v231 + v248;
              v33 = v245;
              v32 = v246;
LABEL_123:
              self = v250;
              goto LABEL_124;
            }
            goto LABEL_46;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v32 = v246;
            v30 = off_1E2733000;
            if ((v269 & 1) == 0)
            {
              v33 = v245;
              if ((v263 & 1) != 0)
              {
                v248 = v232 + v248;
                self = v250;
                goto LABEL_127;
              }
              objc_opt_class();
              self = v250;
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
LABEL_116:
                -[CKTranscriptCollectionViewLayout handleInvalidCaseForChatItem:withPrevChatItem:](self, "handleInvalidCaseForChatItem:withPrevChatItem:", v253, v38);
                goto LABEL_117;
              }
              v71 = v233;
              goto LABEL_100;
            }
            v62 = v232 + v248;
            v33 = v245;
            if (objc_msgSend(v38, "hasTail"))
            {
              objc_msgSend(v244, "balloonMaskTailSizeForTailShape:", 1);
              v62 = v62 + v63;
            }
            v248 = v62;
            self = v250;
            goto LABEL_125;
          }
          v32 = v246;
          if (objc_msgSend(v253, "itemIsReplyContextPreview"))
          {
            v33 = v245;
            if ((v266 & 1) != 0)
            {
              v67 = v230;
LABEL_88:
              v248 = v67 + v248;
              goto LABEL_47;
            }
            objc_opt_class();
            v30 = off_1E2733000;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v61 = v248;
              self = v250;
              if ((v263 & 1) == 0)
              {
                if ((v269 & 1) == 0)
                {
LABEL_242:
                  v215 = v61;
                  -[CKTranscriptCollectionViewLayout handleInvalidCaseForChatItem:withPrevChatItem:](self, "handleInvalidCaseForChatItem:withPrevChatItem:", v253, v38);
                  v248 = v215 + v216;
                  goto LABEL_127;
                }
                v64 = v230;
                goto LABEL_103;
              }
              goto LABEL_93;
            }
LABEL_110:
            v77 = v232;
LABEL_111:
            v248 = v77 + v248;
            goto LABEL_123;
          }
          v33 = v245;
          if (objc_msgSend(v253, "itemIsThreadOriginator"))
          {
            if ((v266 & 1) != 0)
            {
              v67 = v231;
              goto LABEL_88;
            }
            objc_opt_class();
            v30 = off_1E2733000;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              self = v250;
              if ((v263 & 1) != 0)
              {
                v219 = -[CKTranscriptCollectionViewLayout nextMessageIsReplyForIndex:](v250, "nextMessageIsReplyForIndex:", v251);
                v220 = v232 + v248;
                if (v219)
                  v220 = v230 + v248;
                v248 = v220;
                goto LABEL_124;
              }
              if ((v269 & 1) == 0)
                goto LABEL_116;
              if (-[CKTranscriptCollectionViewLayout nextMessageIsReplyForIndex:](v250, "nextMessageIsReplyForIndex:", v251))
              {
                v64 = v230;
                goto LABEL_66;
              }
              objc_msgSend(v244, "balloonBalloonTranscriptSpace:", objc_msgSend(v38, "contiguousType"));
              v73 = v248 + v228;
              goto LABEL_104;
            }
            goto LABEL_110;
          }
          if (objc_msgSend(v253, "itemIsReply"))
          {
            if (v261)
            {
              v74 = objc_msgSend(v253, "itemIsFromMe");
              self = v250;
              if (v74 != objc_msgSend(v38, "itemIsFromMe"))
              {
                objc_msgSend(v244, "xsTranscriptSpace");
                v76 = v248 + v75;
LABEL_272:
                v248 = v76;
                goto LABEL_48;
              }
              v30 = off_1E2733000;
              if (-[CKTranscriptCollectionViewLayout needsAdditionalBracketPaddingForChatItem:prevChatItem:](v250, "needsAdditionalBracketPaddingForChatItem:prevChatItem:", v253, v38))
              {
                objc_msgSend(v244, "replyLineBracketRadius");
                v222 = v221;
                objc_msgSend(v244, "replyLineViewVerticalPadding");
                v224 = v222 + v223 * 2.0;
                objc_msgSend(v244, "textBalloonMinHeight");
                v58 = v224 + v225 * -0.5;
                goto LABEL_69;
              }
LABEL_268:
              objc_msgSend(v244, "balloonBalloonTranscriptSpace:", objc_msgSend(v38, "contiguousType"));
              goto LABEL_69;
            }
            self = v250;
            if ((v266 & 1) != 0)
            {
              v217 = v231;
              v218 = v248;
LABEL_271:
              v76 = v217 + v218;
              goto LABEL_272;
            }
            v218 = v248;
            if ((v263 & 1) != 0)
            {
              v217 = v232;
              goto LABEL_271;
            }
            if ((v255 | v45) == 1)
            {
              v217 = v231;
              goto LABEL_271;
            }
            objc_opt_class();
            v30 = off_1E2733000;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
LABEL_277:
              v60 = v232;
LABEL_55:
              v61 = v248;
              goto LABEL_94;
            }
            if (v257)
              goto LABEL_268;
          }
          else
          {
            objc_opt_class();
            v30 = off_1E2733000;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  -[CKTranscriptCollectionViewLayout handleInvalidCaseForChatItem:withPrevChatItem:](v250, "handleInvalidCaseForChatItem:withPrevChatItem:", v253, v38);
                  v248 = v248 + v227;
                  self = v250;
                  goto LABEL_124;
                }
              }
            }
            if ((v247 & 1) != 0)
              goto LABEL_123;
            if ((v266 & 1) != 0)
            {
              v77 = v231;
              goto LABEL_111;
            }
            objc_opt_class();
            self = v250;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              goto LABEL_277;
            v61 = v248;
            if (v261)
              goto LABEL_58;
            if ((v263 & 1) != 0)
              goto LABEL_71;
            if (v257)
            {
LABEL_93:
              v60 = v230;
              goto LABEL_94;
            }
            if (!(v255 & 1 | ((v269 & 1) == 0)))
              goto LABEL_268;
          }
          -[CKTranscriptCollectionViewLayout handleInvalidCaseForChatItem:withPrevChatItem:](self, "handleInvalidCaseForChatItem:withPrevChatItem:", v253, v38);
          goto LABEL_69;
        }
LABEL_127:
        objc_msgSend(v253, "size");
        v80 = v79;
        objc_msgSend(v253, "contentInsets");
        v83 = v80 + v21 + v81 + v23 + v82;
        objc_msgSend(v253, "transcriptTextAlignmentInsets");
        v85 = v84;
        v87 = v248 - v86;
        -[CKTranscriptCollectionViewLayout collectionView](self, "collectionView");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "traitCollection");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "displayScale");
        v91 = round(v87 * v90) / v90;

        v262 = v83;
        if (v247)
        {
          objc_msgSend((id)v34, "setAlphaOrFilterLevel:", 0.0);
        }
        else
        {
          v305.origin.x = v31;
          v305.origin.y = v91;
          v305.size.width = v19;
          v305.size.height = v83;
          v248 = CGRectGetMaxY(v305) - v85;
        }
        objc_msgSend((id)v34, "setZIndex:", 0);
        objc_msgSend(v239, "delegate");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "currentEffectForCollectionView:layout:", v239, self);
        v93 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v93, "layerCount"))
          goto LABEL_138;
        objc_msgSend((id)v34, "chatItem");
        v94 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v95 = v33;
          v96 = self;
          v97 = v29;
          v98 = v30;
          v99 = v93;
          objc_msgSend(v93, "triggeringChatItem");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = objc_msgSend(v94, "isEqual:", v100);

          if ((v101 & 1) != 0)
          {
            v102 = 4000;
            v30 = v98;
            v29 = v97;
            self = v96;
            v33 = v95;
            v93 = v99;
            v38 = v252;
            v32 = v246;
LABEL_136:
            objc_msgSend((id)v34, "setZIndex:", v102);
            goto LABEL_137;
          }
          v30 = v98;
          v29 = v97;
          self = v96;
          v33 = v95;
          v93 = v99;
          v38 = v252;
          v32 = v246;
          if (objc_msgSend(v94, "isFromMe"))
          {
            v102 = 2000;
            goto LABEL_136;
          }
        }
LABEL_137:

LABEL_138:
        if (!*(_QWORD *)(v34 + *v29))
          goto LABEL_235;
        v242 = v93;
        v260 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v291 = 0u;
        v292 = 0u;
        v293 = 0u;
        v294 = 0u;
        v103 = *(id *)(v34 + *v29);
        v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v291, v302, 16);
        if (v104)
        {
          v105 = v104;
          v106 = *(_QWORD *)v292;
          do
          {
            for (i = 0; i != v105; ++i)
            {
              if (*(_QWORD *)v292 != v106)
                objc_enumerationMutation(v103);
              v108 = *(_QWORD *)(*((_QWORD *)&v291 + 1) + 8 * i);
              objc_msgSend((id)v108, "chatItem");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "size");
              v111 = v110;
              objc_msgSend(v109, "contentInsets");
              v290 = 0;
              v288 = 0u;
              v289 = 0u;
              v114 = v111 + v21 + v112 + v23 + v113;
              v287 = 0u;
              if (!v109)
              {
LABEL_148:
                objc_msgSend(v109, "adjustedParentFrameForPositioning:", v31, v91, v19, v262);
                v285[0] = v287;
                v285[1] = v288;
                v285[2] = v289;
                v286 = v290;
                +[CKAssociatedMessageChatItem verticalOriginForAssociatedMessageItemSize:parentFrame:geometryDescriptor:](CKAssociatedMessageChatItem, "verticalOriginForAssociatedMessageItemSize:parentFrame:geometryDescriptor:", v285, v19, v114, v118, v119, v120, v121);
                v123 = v122;
                goto LABEL_151;
              }
              objc_msgSend(v109, "geometryDescriptor");
              if ((_QWORD)v287 == 11)
              {
                v307.origin.x = v31;
                v307.origin.y = v91;
                v307.size.width = v19;
                v307.size.height = v262;
                MaxY = CGRectGetMaxY(v307);
                +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v116, "messageHighlightTranscriptBalloonRelativePosition");
              }
              else
              {
                if ((_QWORD)v287 != 10)
                  goto LABEL_148;
                v306.origin.x = v31;
                v306.origin.y = rect;
                v306.size.width = v19;
                v306.size.height = v114;
                MaxY = v91 - CGRectGetHeight(v306);
                +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v116, "messageAcknowledgmentTranscriptBalloonRelativePosition");
              }
              v123 = MaxY - v117;

LABEL_151:
              objc_msgSend((id)v108, "setFrame:", v31, v123, v19, v114);
              *(double *)(v108 + 384) = v31;
              *(double *)(v108 + 392) = v123;
              *(double *)(v108 + 400) = v19;
              *(double *)(v108 + 408) = v114;
              *(double *)(v108 + 352) = v31;
              *(double *)(v108 + 360) = v123;
              *(double *)(v108 + 368) = v19;
              *(double *)(v108 + 376) = v114;
              v308.origin.x = v31;
              v308.origin.y = v123;
              v308.size.width = v19;
              v308.size.height = v114;
              MidX = CGRectGetMidX(v308);
              v309.origin.x = v31;
              v309.origin.y = v123;
              v309.size.width = v19;
              v309.size.height = v114;
              MidY = CGRectGetMidY(v309);
              objc_msgSend((id)v108, "setCenter:", MidX, MidY);
              *(double *)(v108 + 584) = MidY;
              *(double *)(v108 + 592) = MidY;
              *(_QWORD *)(v108 + 608) = *(_QWORD *)(v34 + 608);
              *(_BYTE *)(v108 + 616) = *(_BYTE *)(v34 + 616);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v260, "addObject:", v108);
              else
                objc_msgSend((id)v108, "setZIndex:", objc_msgSend((id)v34, "zIndex") + 1);
              objc_msgSend(v253, "size");
              objc_msgSend((id)v108, "setParentChatItemSize:");

            }
            v105 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v291, v302, 16);
          }
          while (v105);
        }

        objc_msgSend(v260, "sortedArrayUsingComparator:", &__block_literal_global_84_6);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v284[0] = MEMORY[0x1E0C809B0];
        v284[1] = 3221225472;
        v284[2] = __48__CKTranscriptCollectionViewLayout_updateFrames__block_invoke_3;
        v284[3] = &unk_1E2757640;
        v284[4] = v34;
        v241 = v126;
        objc_msgSend(v126, "enumerateObjectsUsingBlock:", v284);
        *(_QWORD *)&v285[0] = 0;
        objc_msgSend(v244, "balloonBalloonTranscriptSpace:", 0);
        v267 = v127;
        v280 = 0u;
        v281 = 0u;
        v282 = 0u;
        v283 = 0u;
        v29 = &OBJC_IVAR___CKTranscriptCollectionViewLayoutAttributes__associatedLayoutAttributes;
        v128 = *(id *)(v34 + 632);
        v129 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v280, v301, 16);
        v270 = v91;
        if (!v129)
        {

          v174 = 0.0;
          v167 = 0.0;
          v33 = v245;
          goto LABEL_225;
        }
        v130 = v129;
        v237 = v34;
        v131 = 0;
        v132 = 0;
        v133 = 0;
        v134 = 0;
        v135 = 0;
        v136 = *(_QWORD *)v281;
        v264 = 0.0;
        v137 = 0.0;
        do
        {
          v138 = 0;
          v254 = v130;
          do
          {
            v139 = v31;
            if (*(_QWORD *)v281 != v136)
              objc_enumerationMutation(v128);
            v140 = *(void **)(*((_QWORD *)&v280 + 1) + 8 * v138);
            objc_msgSend(v140, "frame");
            x = v310.origin.x;
            y = v310.origin.y;
            width = v310.size.width;
            height = v310.size.height;
            MinY = CGRectGetMinY(v310);
            v311.origin.x = x;
            v311.origin.y = y;
            v311.size.width = width;
            v311.size.height = height;
            v146 = CGRectGetMaxY(v311);
            objc_msgSend(v140, "chatItem");
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            v148 = v147;
            v290 = 0;
            v288 = 0u;
            v289 = 0u;
            v287 = 0u;
            if (!v147)
              goto LABEL_183;
            objc_msgSend(v147, "geometryDescriptor");
            if ((_QWORD)v287 == 11)
              goto LABEL_187;
            if ((_QWORD)v287 == 10)
            {
              v258 = v137;
              +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v149, "messageAcknowledgmentTranscriptBalloonRelativePosition");
              v151 = v150;

              objc_msgSend(v252, "size");
              v256 = v152;
              objc_msgSend(v253, "size");
              v154 = v153 - v151;
              v155 = objc_msgSend(v252, "transcriptOrientation");
              v156 = objc_msgSend(v253, "transcriptOrientation");
              v157 = -[CKTranscriptCollectionViewLayout previousReplyCount:isOccludedForAssociatedFrame:outMaxY:](v250, "previousReplyCount:isOccludedForAssociatedFrame:outMaxY:", v251, v285, x, y, width, height);
              if (v256 <= v154 && v252 != 0 && v155 == v156 && !v157)
              {
                v134 = 0;
                v135 = 0;
                v31 = v139;
                v164 = v270;
              }
              else
              {
                v134 = v157;
                v161 = v264;
                if (MinY >= v264)
                {
                  v162 = v133;
                }
                else
                {
                  v161 = MinY;
                  v162 = 1;
                }
                v163 = (v131 & 1) == 0;
                v131 = 1;
                if (v163)
                  v161 = MinY;
                v264 = v161;
                if (v163)
                  v133 = 1;
                else
                  v133 = v162;
                v31 = v139;
                v164 = v270;
                v135 = v256 > v154;
              }
              v137 = v258;
              v130 = v254;
            }
            else
            {
LABEL_183:
              if ((v131 & 1) == 0)
              {
                v133 = 0;
                v131 = 1;
                v264 = v267 + MinY;
LABEL_187:
                v31 = v139;
                v164 = v270;
                goto LABEL_191;
              }
              v31 = v139;
              v164 = v270;
              if (v267 + MinY >= v264)
              {
                v131 = 1;
              }
              else
              {
                v133 = 0;
                v131 = 1;
                v264 = v267 + MinY;
              }
            }
LABEL_191:
            v165 = v146 - v267;
            if ((v132 & 1) != 0)
            {
              if (v165 > v137 && v165 >= v137)
                v137 = v146 - v267;
            }
            else
            {
              v137 = v146 - v267;
            }

            ++v138;
            v132 = 1;
          }
          while (v130 != v138);
          v130 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v280, v301, 16);
        }
        while (v130);
        v166 = v137;

        v167 = 0.0;
        v34 = v237;
        v21 = v236;
        if ((v131 & 1) != 0)
        {
          v312.origin.x = v31;
          v312.origin.y = v164;
          v312.size.width = v243;
          v312.size.height = v262;
          v168 = CGRectGetMinY(v312);
          v169 = 0.0;
          if (v168 > v264)
          {
            if (v134)
            {
              v170 = *(double *)v285;
              +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v171, "smallTranscriptSpace");
              v173 = v170 + v172;

            }
            else
            {
              v313.origin.x = v31;
              v313.origin.y = v164;
              v313.size.width = v243;
              v313.size.height = v262;
              v173 = CGRectGetMinY(v313);
            }
            v175 = 0.0;
            if ((v133 & 1) == 0)
              v175 = v267;
            v169 = v173 - v264 - v175;
          }
          v176 = fabs(v264 + v169);
          v177 = -0.0;
          if (v264 + v169 < 0.0)
            v177 = v176;
          v167 = v169 + v177;
        }
        v268 = v134;
        v314.origin.x = v31;
        v314.origin.y = v164;
        v314.size.width = v243;
        v314.size.height = v262;
        v174 = v167;
        if (v166 > CGRectGetMaxY(v314))
        {
          v315.origin.x = v31;
          v315.origin.y = v270;
          v315.size.width = v243;
          v315.size.height = v262;
          v174 = v167 + v166 - CGRectGetMaxY(v315);
        }
        v29 = &OBJC_IVAR___CKTranscriptCollectionViewLayoutAttributes__associatedLayoutAttributes;
        v33 = v245;
        if (v167 != 0.0)
        {
          v265 = v135;
          v278 = 0u;
          v279 = 0u;
          v276 = 0u;
          v277 = 0u;
          v178 = *(id *)(v237 + 632);
          v179 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v276, v300, 16);
          if (v179)
          {
            v180 = v179;
            v181 = *(_QWORD *)v277;
            do
            {
              for (j = 0; j != v180; ++j)
              {
                if (*(_QWORD *)v277 != v181)
                  objc_enumerationMutation(v178);
                v183 = *(CGFloat **)(*((_QWORD *)&v276 + 1) + 8 * j);
                -[CGFloat frame](v183, "frame");
                v185 = v184;
                v187 = v186;
                v189 = v188;
                v191 = v167 + v190;
                -[CGFloat setFrame:](v183, "setFrame:");
                v183[48] = v185;
                v183[49] = v191;
                v183[50] = v187;
                v183[51] = v189;
                v183[44] = v185;
                v183[45] = v191;
                v183[46] = v187;
                v183[47] = v189;
                v316.origin.x = v185;
                v316.origin.y = v191;
                v316.size.width = v187;
                v316.size.height = v189;
                v192 = CGRectGetMidX(v316);
                v317.origin.x = v185;
                v317.origin.y = v191;
                v317.size.width = v187;
                v317.size.height = v189;
                v193 = CGRectGetMidY(v317);
                -[CGFloat setCenter:](v183, "setCenter:", v192, v193);
                v183[73] = v193;
                v183[74] = v193;
              }
              v180 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v276, v300, 16);
            }
            while (v180);
          }

          if (v268)
          {
            objc_opt_class();
            if (!(v265 | ((objc_opt_isKindOfClass() & 1) == 0)))
            {
              -[CGFloat frame](v245, "frame");
              v195 = v194;
              v197 = v196;
              v199 = v198;
              v201 = v167 + v200;
              -[CGFloat setFrame:](v245, "setFrame:");
              v245[48] = v195;
              v245[49] = v201;
              v245[50] = v197;
              v245[51] = v199;
              v245[44] = v195;
              v245[45] = v201;
              v245[46] = v197;
              v245[47] = v199;
              v318.origin.x = v195;
              v318.origin.y = v201;
              v318.size.width = v197;
              v318.size.height = v199;
              v202 = CGRectGetMidX(v318);
              v319.origin.x = v195;
              v319.origin.y = v201;
              v319.size.width = v197;
              v319.size.height = v199;
              v203 = CGRectGetMidY(v319);
              -[CGFloat setCenter:](v245, "setCenter:", v202, v203);
              v245[73] = v203;
              v245[74] = v203;
            }
          }
          v21 = v236;
        }
LABEL_225:
        v271 = v270 + v167;
        v274 = 0u;
        v275 = 0u;
        v272 = 0u;
        v273 = 0u;
        v204 = *(id *)(v34 + 632);
        v205 = objc_msgSend(v204, "countByEnumeratingWithState:objects:count:", &v272, v299, 16);
        v19 = v243;
        v23 = v235;
        if (v205)
        {
          v206 = v205;
          v207 = *(_QWORD *)v273;
          do
          {
            for (k = 0; k != v206; ++k)
            {
              if (*(_QWORD *)v273 != v207)
                objc_enumerationMutation(v204);
              v209 = *(_QWORD *)(*((_QWORD *)&v272 + 1) + 8 * k);
              v210 = *(void **)(v209 + 640);
              if (v210)
              {
                objc_msgSend(v210, "frame");
                *(double *)(v209 + 624) = v271 - v211;
              }
            }
            v206 = objc_msgSend(v204, "countByEnumeratingWithState:objects:count:", &v272, v299, 16);
          }
          while (v206);
        }
        v248 = v248 + v174;

        v30 = off_1E2733000;
        v32 = v246;
        v38 = v252;
        self = v250;
        v91 = v271;
        v93 = v242;
LABEL_235:
        *(double *)(v34 + 352) = v31;
        *(double *)(v34 + 360) = v91;
        *(double *)(v34 + 368) = v19;
        *(double *)(v34 + 376) = v262;
        *(double *)(v34 + 384) = v31;
        *(double *)(v34 + 392) = v91;
        *(double *)(v34 + 400) = v19;
        *(double *)(v34 + 408) = v262;
        objc_msgSend((id)v34, "setSize:", v19, v262);
        v320.origin.x = v31;
        v320.origin.y = v91;
        v320.size.width = v19;
        v320.size.height = v262;
        v212 = CGRectGetMidX(v320);
        v321.origin.x = v31;
        v321.origin.y = v91;
        v321.size.width = v19;
        v321.size.height = v262;
        v213 = CGRectGetMidY(v321);
        objc_msgSend((id)v34, "setCenter:", v212, v213);
        *(_QWORD *)(v34 + 608) = 0x3FF0000000000000;
        *(_BYTE *)(v34 + 616) = 0;
        *(double *)(v34 + 600) = v262;
        *(double *)(v34 + 584) = v213;
        *(double *)(v34 + 592) = v213;
        if (v247)
          v214 = 0;
        else
          v214 = (void *)v34;
        v28 = v214;

        ++v251;
        ++v32;
        v33 = v28;
      }
      while (v32 != v240);
      v229 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v295, v303, 16);
      v240 = v229;
      if (!v229)
      {

        v3 = v244;
        break;
      }
    }
  }

  -[CKTranscriptCollectionViewLayout _applyTargetFrameOffsetsForLayoutAttributesIfNeeded:](self, "_applyTargetFrameOffsetsForLayoutAttributesIfNeeded:", obj);
  -[CKTranscriptCollectionViewLayout _applyCurrentFrameOffsetsForLayoutAttributesIfNeeded:](self, "_applyCurrentFrameOffsetsForLayoutAttributesIfNeeded:", obj);

}

id __48__CKTranscriptCollectionViewLayout_updateFrames__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v2, "previousPluginChatItem"), (v3 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v3 = v2;
  }

  return v3;
}

uint64_t __48__CKTranscriptCollectionViewLayout_updateFrames__block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __48__CKTranscriptCollectionViewLayout_updateFrames__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
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
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3 + 1;
  -[CKTranscriptCollectionViewLayout layoutAttributes](self, "layoutAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 >= objc_msgSend(v5, "count"))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chatItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v8 = (objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(v7, "itemIsThreadOriginator")
      && -[CKTranscriptCollectionViewLayout nextMessageIsReplyForIndex:](self, "nextMessageIsReplyForIndex:", v4);

  }
  return v8;
}

- (BOOL)nextMessageIsReplyForIndex:(unint64_t)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;

  -[CKTranscriptCollectionViewLayout layoutAttributes](self, "layoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a3 + 1;
  if (v5 >= objc_msgSend(v4, "count"))
  {
LABEL_4:
    v8 = 0;
  }
  else
  {
    while (1)
    {
      objc_msgSend(v4, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "chatItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;

      if (++v5 >= objc_msgSend(v4, "count"))
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
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  unint64_t v17;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  _BOOL4 v23;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[CKTranscriptCollectionViewLayout layoutAttributes](self, "layoutAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "chatItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v14) = 0;
  if (objc_msgSend(v13, "itemIsReply") && (uint64_t)(a3 - 1) >= 1)
  {
    while (1)
    {
      objc_msgSend(v11, "objectAtIndex:", --a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "chatItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;

      if ((uint64_t)a3 <= 1)
      {
        LOBYTE(v14) = 0;
        goto LABEL_18;
      }
    }
    v17 = objc_msgSend(v16, "replyCount");
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    MinX = CGRectGetMinX(v25);
    objc_msgSend(v15, "frame");
    MaxX = CGRectGetMaxX(v26);
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    MinY = CGRectGetMinY(v27);
    objc_msgSend(v15, "frame");
    MaxY = CGRectGetMaxY(v28);
    v23 = MinX <= MaxX && v17 > 1;
    v14 = MinY <= MaxY && v23;
    if (v14)
    {
      objc_msgSend(v15, "frame");
      *a5 = CGRectGetMaxY(v29);
    }

  }
LABEL_18:

  return v14;
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
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void (**v40)(id, uint64_t, _QWORD);
  void *v41;
  double MaxY;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  double *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  id v52;
  CKTranscriptCollectionViewLayout *v53;
  id v54;
  id obj;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id v62;
  _QWORD *v63;
  double v64;
  _QWORD v65[4];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;
  CGRect v73;
  CGRect v74;

  v72 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  v53 = self;
  -[CKTranscriptCollectionViewLayout collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;

  -[CKTranscriptCollectionViewLayout collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_visibleRectEdgeInsets");
  v15 = v14;
  v17 = v16;

  v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v8;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
  if (v18)
  {
    v19 = 0;
    v20 = v12 - (v15 + v17);
    v21 = *(_QWORD *)v67;
    v22 = 0.0;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v67 != v21)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(*(id *)(v24 + 656), "IMChatItem");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "guid");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "objectForKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          objc_msgSend(v27, "CGRectValue");
          if (v28 < 0.0)
          {
            objc_msgSend(v54, "addObject:", v24);
            goto LABEL_16;
          }
          if (v28 > v20)
          {
            objc_msgSend(v52, "addObject:", v24);
            goto LABEL_16;
          }
          -[CKTranscriptCollectionViewLayout _convertScreenFrameToLocalFrame:](v53, "_convertScreenFrameToLocalFrame:");
          v30 = v29;
          v31 = *(double *)(v24 + 392);
          v9[2](v9, v24, 0);
          v22 = v30 - v31;
        }
        else
        {
          if ((v19 & 1) == 0)
          {
            objc_msgSend(v54, "addObject:", v24);
            v19 = 0;
            goto LABEL_16;
          }
          ((void (*)(void (**)(id, uint64_t, _QWORD), uint64_t, uint64_t, double, double, double, double))v9[2])(v9, v24, 1, *(double *)(v24 + 384), v22 + *(double *)(v24 + 392), *(double *)(v24 + 400), *(double *)(v24 + 408));
        }
        v19 = 1;
LABEL_16:

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    }
    while (v18);
  }

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "smallTranscriptSpace");
  v34 = v33;

  -[CKTranscriptCollectionViewLayout collectionView](v53, "collectionView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "superview");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptCollectionViewLayout collectionView](v53, "collectionView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "convertPoint:toView:", v37, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v39 = v38;

  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  v65[3] = v39;
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __101__CKTranscriptCollectionViewLayout__applyAttributeUpdatesWithTargetMap_layoutAttributes_updateBlock___block_invoke;
  v61[3] = &unk_1E27576E0;
  v63 = v65;
  v64 = v34;
  v40 = v9;
  v62 = v40;
  objc_msgSend(v54, "enumerateObjectsWithOptions:usingBlock:", 2, v61);
  -[CKTranscriptCollectionViewLayout collectionView](v53, "collectionView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bounds");
  MaxY = CGRectGetMaxY(v73);

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v43 = v52;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v58 != v45)
          objc_enumerationMutation(v43);
        v47 = *(double **)(*((_QWORD *)&v57 + 1) + 8 * j);
        v48 = v47[48];
        v49 = v47[50];
        v50 = v47[51];
        v74.origin.x = v48;
        v74.origin.y = MaxY;
        v74.size.width = v49;
        v74.size.height = v50;
        v51 = CGRectGetMaxY(v74);
        ((void (*)(void (**)(id, uint64_t, _QWORD), double *, _QWORD, double, double, double, double))v40[2])(v40, v47, 0, v48, MaxY, v49, v50);
        MaxY = v34 + v51;
      }
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    }
    while (v44);
  }

  _Block_object_dispose(v65, 8);
}

void __101__CKTranscriptCollectionViewLayout__applyAttributeUpdatesWithTargetMap_layoutAttributes_updateBlock___block_invoke(uint64_t a1, double *a2)
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
  -[CKTranscriptCollectionViewLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptCollectionViewLayout collectionView](self, "collectionView");
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
  -[CKTranscriptCollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "overrideTargetFrameMapForLayout:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[CKTranscriptCollectionViewLayout isInlineAnimatingOut](self, "isInlineAnimatingOut");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__CKTranscriptCollectionViewLayout__applyTargetFrameOffsetsForLayoutAttributesIfNeeded___block_invoke;
    aBlock[3] = &__block_descriptor_33_e89_v52__0__CKTranscriptCollectionViewLayoutAttributes_8_CGRect__CGPoint_dd__CGSize_dd__16B48l;
    v11 = v8;
    v9 = _Block_copy(aBlock);
    -[CKTranscriptCollectionViewLayout _applyAttributeUpdatesWithTargetMap:layoutAttributes:updateBlock:](self, "_applyAttributeUpdatesWithTargetMap:layoutAttributes:updateBlock:", v7, v4, v9);

  }
}

void __88__CKTranscriptCollectionViewLayout__applyTargetFrameOffsetsForLayoutAttributesIfNeeded___block_invoke(uint64_t a1, void *a2, int a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
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
  double v9;
  double v10;
  double height;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  double *v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKTranscriptCollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "overrideCurrentFrameMapForLayout:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CKTranscriptCollectionViewLayout _applyAttributeUpdatesWithTargetMap:layoutAttributes:updateBlock:](self, "_applyAttributeUpdatesWithTargetMap:layoutAttributes:updateBlock:", v7, v4, &__block_literal_global_88_3);
    -[CKTranscriptCollectionViewLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;

    v36 = v6;
    if (self)
      height = self->_contentSize.height;
    else
      height = 0.0;
    v12 = 0.5;
    if (height >= v10)
      v13 = v10;
    else
      v13 = v10 * 0.5;
    -[CKTranscriptCollectionViewLayout collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptCollectionViewLayout collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "convertPoint:toView:", v16, 0.0, v13);
    v37 = v17;

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v18 = v4;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v41 != v21)
            objc_enumerationMutation(v18);
          v23 = *(double **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v23, "bounds");
          v39 = v24;
          objc_msgSend(v23, "center");
          v38 = vabdd_f64(v25, v37);
          v26 = -1;
          v27 = 0.0;
          do
          {
            v28 = (v38 + v39 * (double)v26 * v12) / v10;
            if (v28 > 1.0)
              v28 = 1.0;
            v29 = v10;
            v30 = fmax(v28, 0.0);
            if (-[CKTranscriptCollectionViewLayout isInlineAnimatingOut](self, "isInlineAnimatingOut"))
              v31 = -0.0500000007;
            else
              v31 = 0.0;
            v32 = v31 + 0.889999986;
            v33 = v31 + 0.824999988;
            v34 = v30;
            v10 = v29;
            v12 = 0.5;
            -[CKTranscriptCollectionViewLayout bezierPointForPercentage:anchor1:anchor2:control1:control2:](self, "bezierPointForPercentage:anchor1:anchor2:control1:control2:", v34, v32, v33, v33, v33);
            v27 = v27 + v35;
            ++v26;
          }
          while (v26 != 2);
          v23[52] = v27 / 3.0;
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v20);
    }

    v6 = v36;
  }

}

void __89__CKTranscriptCollectionViewLayout__applyCurrentFrameOffsetsForLayoutAttributesIfNeeded___block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, void *a6)
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

- (void)sizeCategoryDidChange:(id)a3
{
  void *v4;
  uint64_t v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAccessibilityPreferredContentSizeCategory");

  if ((_DWORD)v5 != -[CKTranscriptCollectionViewLayout sizeCategoryIsAccessibilitySizeCategory](self, "sizeCategoryIsAccessibilitySizeCategory"))
  {
    -[CKTranscriptCollectionViewLayout setLayoutAttributes:](self, "setLayoutAttributes:", 0);
    -[CKTranscriptCollectionViewLayout invalidateLayout](self, "invalidateLayout");
    -[CKTranscriptCollectionViewLayout setSizeCategoryIsAccessibilitySizeCategory:](self, "setSizeCategoryIsAccessibilitySizeCategory:", v5);
  }
}

- (void)reduceMotionSettingChanged:(id)a3
{
  -[CKTranscriptCollectionViewLayout setLayoutAttributes:](self, "setLayoutAttributes:", 0);
  -[CKTranscriptCollectionViewLayout invalidateLayout](self, "invalidateLayout");
}

- (void)_setEasingUpForTesting:(BOOL)a3
{
  if (self)
    self->_easingUp = a3;
}

- (BOOL)_getEasingUpForTesting
{
  if (self)
    LOBYTE(self) = self->_easingUp;
  return (char)self;
}

- (void)_setVisibleBoundsForTesting:(CGRect)a3
{
  if (self)
    self->_visibleBounds = a3;
}

- (void)_setDisplayLinkForTesting:(id)a3
{
  -[CKTranscriptCollectionViewLayout setDisplayLink:]((uint64_t)self, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSArray)associatedLayoutAttributes
{
  return self->_associatedLayoutAttributes;
}

- (void)setAssociatedLayoutAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSArray)decorationLayoutAttributes
{
  return self->_decorationLayoutAttributes;
}

- (void)setDecorationLayoutAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSArray)oldAssociatedLayoutAttributes
{
  return self->_oldAssociatedLayoutAttributes;
}

- (void)setOldAssociatedLayoutAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSMutableIndexSet)insertedAssociatedLayoutAttributes
{
  return self->_insertedAssociatedLayoutAttributes;
}

- (void)setInsertedAssociatedLayoutAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_insertedAssociatedLayoutAttributes, a3);
}

- (NSDate)lastTouchTime
{
  return self->_lastTouchTime;
}

- (void)setLastTouchTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastTouchTime, a3);
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

- (BOOL)coalesceInvalidations
{
  return self->_coalesceInvalidations;
}

- (void)setCoalesceInvalidations:(BOOL)a3
{
  self->_coalesceInvalidations = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicsUpdater, 0);
  objc_storeStrong((id *)&self->_finalParentVerticalOffsets, 0);
  objc_storeStrong((id *)&self->_initialParentLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_lastTouchTime, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
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
