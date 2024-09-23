@implementation NTKUpNextCollectionViewFlowLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (NTKUpNextCollectionViewFlowLayout)init
{
  NTKUpNextCollectionViewFlowLayout *v2;
  void *v3;
  uint64_t v4;
  CLKDevice *device;
  uint64_t v6;
  NSIndexPath *topElementIndexPath;
  uint64_t v8;
  NSSet *previousSectionsWithHeaders;
  uint64_t v10;
  NSSet *sectionsWithHeaders;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
  v2 = -[UICollectionViewFlowLayout init](&v13, sel_init);
  if (v2)
  {
    +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "device");
    v4 = objc_claimAutoreleasedReturnValue();
    device = v2->_device;
    v2->_device = (CLKDevice *)v4;

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    topElementIndexPath = v2->_topElementIndexPath;
    v2->_topElementIndexPath = (NSIndexPath *)v6;

    v2->_needsInsetsUpdate = 1;
    v8 = objc_opt_new();
    previousSectionsWithHeaders = v2->_previousSectionsWithHeaders;
    v2->_previousSectionsWithHeaders = (NSSet *)v8;

    v10 = objc_opt_new();
    sectionsWithHeaders = v2->_sectionsWithHeaders;
    v2->_sectionsWithHeaders = (NSSet *)v10;

    v2->_maximumDarkeningAmount = 0.5;
  }
  return v2;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (void)setTopItemsAlpha:(double)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t j;
  void *v12;
  void *v13;
  id v14;

  if (vabdd_f64(self->_topItemsAlpha, a3) > 2.22044605e-16)
  {
    self->_topItemsAlpha = a3;
    -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfSections");

    v14 = (id)objc_opt_new();
    v6 = (void *)objc_opt_new();
    if (v5 >= 1)
    {
      for (i = 0; i != v5; ++i)
      {
        -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "numberOfItemsInSection:", i);

        if (-[NTKUpNextCollectionViewFlowLayout _hasHeaderForSection:](self, "_hasHeaderForSection:", i))
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, i);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v10);

        }
        if (v9 >= 1)
        {
          for (j = 0; j != v9; ++j)
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", j, i);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "compare:", self->_topElementIndexPath) == -1
              || objc_msgSend(v12, "compare:", self->_bottomElementIndexPath) == 1)
            {
              objc_msgSend(v14, "addObject:", v12);
            }

          }
        }
      }
    }
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "invalidateItemsAtIndexPaths:", v14);
    objc_msgSend(v13, "invalidateSupplementaryElementsOfKind:atIndexPaths:", *MEMORY[0x1E0DC48A8], v6);
    objc_msgSend(v13, "setInvalidateFlowLayoutAttributes:", 0);
    objc_msgSend(v13, "setInvalidateFlowLayoutDelegateMetrics:", 0);
    -[NTKUpNextCollectionViewFlowLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v13);

  }
}

- (void)setHeaderAlpha:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  if (vabdd_f64(self->_headerAlpha, a3) > 2.22044605e-16)
  {
    self->_headerAlpha = a3;
    -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfSections");

    v9 = (id)objc_opt_new();
    if (v5 >= 1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (-[NTKUpNextCollectionViewFlowLayout _hasHeaderForSection:](self, "_hasHeaderForSection:", i))
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, i);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v7);

        }
      }
    }
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "invalidateSupplementaryElementsOfKind:atIndexPaths:", *MEMORY[0x1E0DC48A8], v9);
    objc_msgSend(v8, "setInvalidateFlowLayoutAttributes:", 0);
    objc_msgSend(v8, "setInvalidateFlowLayoutDelegateMetrics:", 0);
    -[NTKUpNextCollectionViewFlowLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v8);

  }
}

- (void)setTopOffsetForSnapping:(double)a3
{
  if (vabdd_f64(self->_topOffsetForSnapping, a3) > 2.22044605e-16)
  {
    self->_topOffsetForSnapping = a3;
    self->_needsInsetsUpdate = 1;
  }
}

- (void)setTopOffsetForScrolling:(double)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  id v13;

  if (vabdd_f64(self->_topOffsetForScrolling, a3) > 2.22044605e-16)
  {
    self->_topOffsetForScrolling = a3;
    -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfSections");

    v13 = (id)objc_opt_new();
    v6 = (void *)objc_opt_new();
    if (v5 >= 1)
    {
      for (i = 0; i != v5; ++i)
      {
        -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "numberOfItemsInSection:", i);

        if (v9 >= 1)
        {
          for (j = 0; j != v9; ++j)
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", j, i);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (!j)
            {
              if (-[NTKUpNextCollectionViewFlowLayout _hasHeaderForSection:](self, "_hasHeaderForSection:", i))
                objc_msgSend(v6, "addObject:", v11);
            }
            objc_msgSend(v13, "addObject:", v11);

          }
        }
      }
    }
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "invalidateItemsAtIndexPaths:", v13);
    objc_msgSend(v12, "invalidateSupplementaryElementsOfKind:atIndexPaths:", *MEMORY[0x1E0DC48A8], v6);
    objc_msgSend(v12, "setInvalidateFlowLayoutAttributes:", 0);
    objc_msgSend(v12, "setInvalidateFlowLayoutDelegateMetrics:", 0);
    -[NTKUpNextCollectionViewFlowLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v12);

  }
}

- (void)setMaximumDarkeningAmount:(double)a3
{
  id v4;

  if (vabdd_f64(self->_maximumDarkeningAmount, a3) > 2.22044605e-16)
  {
    self->_maximumDarkeningAmount = a3;
    v4 = (id)objc_opt_new();
    objc_msgSend(v4, "setInvalidateFlowLayoutAttributes:", 1);
    objc_msgSend(v4, "setInvalidateFlowLayoutDelegateMetrics:", 0);
    -[NTKUpNextCollectionViewFlowLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

  }
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
  -[UICollectionViewFlowLayout invalidateLayoutWithContext:](&v5, sel_invalidateLayoutWithContext_, v4);
  if ((objc_msgSend(v4, "invalidateEverything") & 1) != 0
    || objc_msgSend(v4, "invalidateDataSourceCounts"))
  {
    self->_needsInsetsUpdate = 1;
    self->_needsHeaderUpdate = 1;
  }

}

- (void)prepareLayout
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  NSInteger v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double x;
  double y;
  double width;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  uint64_t v38;
  uint64_t v39;
  CGFloat v40;
  CGFloat v41;
  void *v42;
  void *v43;
  void *v44;
  double topItemsAlpha;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  _BOOL4 v51;
  double v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double MinY;
  double MaxY;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  __int128 v76;
  double height;
  unint64_t v78;
  double v79;
  double v80;
  NSDictionary *v81;
  NSDictionary *layoutInfo;
  NSSet *v83;
  NSSet *dwellIndexPathes;
  uint64_t v85;
  CGFloat v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  double v94;
  double MinX;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  double v105;
  CGFloat v106;
  double v107;
  double v108;
  double v109;
  double v110;
  CGFloat v111;
  __int128 v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  CGFloat v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  void *v124;
  double v125;
  CGFloat v126;
  double v127;
  CGFloat v128;
  double v129;
  CGFloat v130;
  double v131;
  CGFloat v132;
  void *v133;
  double v134;
  CGFloat v135;
  double v136;
  double v137;
  CGFloat v138;
  double v139;
  CGFloat v140;
  double v141;
  void *v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  void *v148;
  void *v149;
  NTKUpNextCollectionViewFlowLayoutAttributes *v150;
  NTKUpNextCollectionViewFlowLayoutAttributes *decorationLayoutInfo;
  NTKUpNextCollectionViewFlowLayoutAttributes *v152;
  double v153;
  NTKUpNextCollectionViewFlowLayoutAttributes *v154;
  uint64_t v155;
  id obj;
  uint64_t v157;
  double v158;
  CGRect v159;
  void *v160;
  CGFloat v161;
  CGFloat v162;
  CGFloat v163;
  CGFloat rect1;
  CGFloat v165;
  CGFloat v166;
  CGFloat v167;
  CGFloat v168;
  CGFloat v169;
  CGFloat v170;
  CGFloat v171;
  CGFloat v172;
  void *v173;
  double v174;
  CGFloat v175;
  CGFloat v176;
  double v177;
  CGFloat v178;
  CGFloat v179;
  CGFloat rect;
  CGFloat v181;
  CGFloat v182;
  CGFloat v183;
  uint64_t v184;
  double v185;
  CGFloat v186;
  double v187;
  CGFloat tz;
  CGFloat tza;
  CGFloat tzb;
  CATransform3D v191;
  objc_super v192;
  CATransform3D v193;
  CATransform3D m;
  CATransform3D v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  objc_super v199;
  objc_super v200;
  objc_super v201;
  CGRect v202;
  CGRect v203;
  CGRect v204;
  CGRect v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;
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
  CGRect v244;
  CGRect v245;
  CGRect v246;
  CGRect v247;

  v201.receiver = self;
  v201.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
  -[UICollectionViewFlowLayout prepareLayout](&v201, sel_prepareLayout);
  -[NTKUpNextCollectionViewFlowLayout _updateContentInsetsIfNeeded](self, "_updateContentInsetsIfNeeded");
  -[NTKUpNextCollectionViewFlowLayout _updateSectionHeaderListIfNeeded](self, "_updateSectionHeaderListIfNeeded");
  -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v167 = v9;
  v168 = v8;

  if (self->_indexPathToSnapTo)
  {
    -[NTKUpNextCollectionViewFlowLayout flowLayoutAttributesForItemAtIndexPath:](self, "flowLayoutAttributesForItemAtIndexPath:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    -[NTKUpNextCollectionViewFlowLayout targetContentOffsetForProposedContentOffset:](self, "targetContentOffsetForProposedContentOffset:");
    v5 = v11;
    v7 = v12 + self->_snappingOffset;

  }
  v160 = (void *)objc_opt_new();
  obj = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "numberOfSections");

  v15 = 0.0;
  v165 = v7;
  v166 = v5;
  UIRectInset();
  v181 = v17;
  v183 = v16;
  v178 = v19;
  rect = v18;
  v157 = v14;
  if (v14 >= 1)
  {
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v24 = *MEMORY[0x1E0C9D648];
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v155 = *MEMORY[0x1E0DC48A8];
    v174 = *MEMORY[0x1E0C9D538];
    x = *MEMORY[0x1E0C9D648];
    y = v23;
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    rect1 = v25;
    v171 = v23;
    v172 = *MEMORY[0x1E0C9D648];
    v169 = v25;
    v170 = width;
    tz = width;
    do
    {
      -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "numberOfItemsInSection:", v22);

      v159.size.width = v170;
      v159.size.height = v169;
      v159.origin.x = v172;
      v159.origin.y = v171;
      if (-[NTKUpNextCollectionViewFlowLayout _hasHeaderForSection:](self, "_hasHeaderForSection:", v22))
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v22);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v200.receiver = self;
        v200.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
        -[UICollectionViewFlowLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](&v200, sel_layoutAttributesForSupplementaryViewOfKind_atIndexPath_, v155, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v32, "copy");

        objc_msgSend(v33, "frame");
        v159.origin.x = v34;
        v159.origin.y = v35;
        v159.size.width = v36;
        v159.size.height = v37;

      }
      if (v30 >= 1)
      {
        v158 = v15;
        v38 = 0;
        v39 = -v20;
        do
        {
          v161 = width;
          v162 = y;
          v40 = v25;
          v41 = tz;
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v38, v22);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v199.receiver = self;
          v199.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
          -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v199, sel_layoutAttributesForItemAtIndexPath_, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = (void *)objc_msgSend(v43, "copy");

          if (objc_msgSend(v42, "compare:", self->_topElementIndexPath) == -1
            || (topItemsAlpha = 1.0, objc_msgSend(v42, "compare:", self->_bottomElementIndexPath) == 1))
          {
            topItemsAlpha = self->_topItemsAlpha;
          }
          objc_msgSend(v44, "frame");
          v47 = v46;
          v186 = v48;
          tz = v49;
          v25 = v50;
          v202.origin.x = v24;
          v202.origin.y = v23;
          v202.size.width = v41;
          v202.size.height = v40;
          v245.origin.y = v171;
          v245.origin.x = v172;
          v245.size.height = v169;
          v245.size.width = v170;
          v51 = CGRectEqualToRect(v202, v245);
          v185 = v47;
          v177 = topItemsAlpha;
          v163 = x;
          if (v38 || !v51)
          {
            v203.origin.x = v47;
            v52 = v186;
            v53 = tz;
            v203.origin.y = v186;
            v203.size.width = tz;
            v203.size.height = v25;
            CGRectGetMinY(v203);
            v204.origin.x = v24;
            v204.origin.y = v23;
            v204.size.width = v41;
            v204.size.height = v40;
            CGRectGetMaxY(v204);
            -[UICollectionViewFlowLayout minimumLineSpacing](self, "minimumLineSpacing");
          }
          else
          {
            CGRectGetHeight(v159);
            v52 = v186;
            v53 = tz;
          }
          UIRectInset();
          v175 = v54;
          v176 = v55;
          v57 = v56;
          v59 = v58;
          v205.origin.y = v181;
          v205.origin.x = v183;
          v205.size.height = v178;
          v205.size.width = rect;
          MinY = CGRectGetMinY(v205);
          v206.origin.x = v47;
          v206.origin.y = v52;
          v206.size.width = v53;
          v206.size.height = v25;
          MaxY = CGRectGetMaxY(v206);
          -[UICollectionViewFlowLayout minimumLineSpacing](self, "minimumLineSpacing");
          v63 = MaxY + v62;
          v64 = 1.0;
          if (MinY >= v63)
          {
LABEL_31:
            v66 = tz;
          }
          else
          {
            switch(v21)
            {
              case 0:
                v207.origin.x = v47;
                v207.origin.y = v186;
                v207.size.width = tz;
                v207.size.height = v25;
                v65 = CGRectGetMinY(v207);
                v208.origin.y = v181;
                v208.origin.x = v183;
                v208.size.height = v178;
                v208.size.width = rect;
                if (v65 <= CGRectGetMinY(v208))
                {
                  objc_msgSend(v44, "setLayoutMode:", 0);
                  v52 = v186;
                  v21 = 1;
                  goto LABEL_31;
                }
                v209.origin.y = v162;
                v209.origin.x = v163;
                v209.size.width = v161;
                v209.size.height = rect1;
                v246.origin.y = v171;
                v246.origin.x = v172;
                v246.size.height = v169;
                v246.size.width = v170;
                if (CGRectEqualToRect(v209, v246))
                {
                  v210.origin.x = v175;
                  v210.origin.y = v176;
                  v210.size.width = v57;
                  v210.size.height = v59;
                  -[UICollectionViewFlowLayout minimumLineSpacing](self, "minimumLineSpacing", CGRectGetHeight(v210));
                }
LABEL_21:
                objc_msgSend(v44, "setLayoutMode:", 1);
                v211.origin.y = v181;
                v211.origin.x = v183;
                v211.size.height = v178;
                v211.size.width = rect;
                CGRectGetMinY(v211);
                v212.origin.x = v175;
                v212.origin.y = v176;
                v212.size.width = v57;
                v212.size.height = v59;
                CGRectGetHeight(v212);
                -[UICollectionViewFlowLayout minimumLineSpacing](self, "minimumLineSpacing");
                v213.origin.x = v47;
                v52 = v186;
                v66 = tz;
                v213.origin.y = v186;
                v213.size.width = tz;
                v213.size.height = v25;
                CGRectGetMinY(v213);
                CLKReverseInterpolateFromFloats();
                v68 = v67;
                v214.origin.x = v175;
                v214.origin.y = v176;
                v214.size.width = v57;
                v214.size.height = v59;
                CGRectGetHeight(v214);
                if (v68 < 1.0)
                {
                  CLKInterpolateBetweenFloatsClipped();
                  v52 = v69;
                }
                CLKInterpolateBetweenFloatsClipped();
                objc_msgSend(v44, "setDarkeningAlphaUniform:");
                v158 = v68;
                CLKInterpolateBetweenFloatsClipped();
                v64 = v70;
                v21 = 2;
                break;
              case 1:
                goto LABEL_21;
              case 2:
                objc_msgSend(v44, "setLayoutMode:", 2);
                if (self->_useFixedLowTransitionLayout)
                {
                  v215.origin.y = v181;
                  v215.origin.x = v183;
                  v215.size.height = v178;
                  v215.size.width = rect;
                  v71 = CGRectGetMaxY(v215);
                  v216.origin.x = v47;
                  v216.origin.y = v186;
                  v66 = tz;
                  v216.size.width = tz;
                  v216.size.height = v25;
                  v52 = v71 - CGRectGetHeight(v216) - self->_highTransitionBottomOffset;
                }
                else
                {
                  v224.origin.x = v183;
                  v224.origin.y = v181;
                  v224.size.width = rect;
                  v224.size.height = v178;
                  CGRectGetMinY(v224);
                  v225.origin.x = v175;
                  v225.origin.y = v176;
                  v225.size.width = v57;
                  v225.size.height = v59;
                  CGRectGetHeight(v225);
                  v226.origin.x = v183;
                  v226.origin.y = v181;
                  v226.size.width = rect;
                  v226.size.height = v178;
                  CGRectGetMaxY(v226);
                  v227.origin.x = v47;
                  v227.origin.y = v186;
                  v66 = tz;
                  v227.size.width = tz;
                  v227.size.height = v25;
                  CGRectGetHeight(v227);
                  CLKInterpolateBetweenFloatsClipped();
                  v52 = v79;
                }
                CLKInterpolateBetweenFloatsClipped();
                v64 = v80;
                CLKInterpolateBetweenFloatsClipped();
                objc_msgSend(v44, "setDarkeningAlphaUniform:");
                v21 = 3;
                break;
              case 3:
                objc_msgSend(v44, "setLayoutMode:", 3);
                objc_msgSend(v44, "setDarkeningAlphaUniform:", self->_maximumDarkeningAmount);
                CLKInterpolateBetweenFloatsClipped();
                v217.size.height = v178;
                v177 = v177 * v72;
                v217.origin.y = v181;
                v217.origin.x = v183;
                v217.size.width = rect;
                CGRectGetMaxY(v217);
                v218.origin.x = v47;
                v218.origin.y = v186;
                v66 = tz;
                v218.size.width = tz;
                v218.size.height = v25;
                CGRectGetHeight(v218);
                CLKInterpolateBetweenFloatsClipped();
                v52 = v73;
                CLKInterpolateBetweenFloatsClipped();
                v64 = v74;
                goto LABEL_29;
              case 4:
                objc_msgSend(v44, "setLayoutMode:", 4);
                v219.origin.y = v181;
                v219.origin.x = v183;
                v219.size.height = v178;
                v219.size.width = rect;
                v75 = CGRectGetMaxY(v219);
                v220.origin.x = v47;
                v220.origin.y = v186;
                v66 = tz;
                v220.size.width = tz;
                v220.size.height = v25;
                v52 = v75 - CGRectGetHeight(v220) - self->_lowTransitionShift;
                v177 = 0.0;
                v64 = 0.4;
LABEL_29:
                v21 = 4;
                break;
              default:
                v52 = v186;
                goto LABEL_31;
            }
          }
          if (v22 < -[NSIndexPath section](self->_topElementIndexPath, "section"))
            v52 = v52 - self->_topItemsShift;
          MEMORY[0x1BCCA72B8](v47, v52, v66, v25);
          v76 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
          v196 = *MEMORY[0x1E0C9BAA8];
          v197 = v76;
          v198 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
          if (fabs(v64 + -1.0) >= 0.00000011920929)
          {
            NTKUpNextMakeScaleTransformWithBoundsAndScale((uint64_t)&v196, v174, v64);
            objc_msgSend(v44, "setScale:", v64);
          }
          objc_msgSend(v44, "setAlpha:", v177);
          objc_msgSend(v44, "setFrame:", v47, v52, v66, v25);
          memset(&v195, 0, sizeof(v195));
          *(_OWORD *)&m.m11 = v196;
          *(_OWORD *)&m.m13 = v197;
          *(_OWORD *)&m.m21 = v198;
          CATransform3DMakeAffineTransform(&v195, (CGAffineTransform *)&m);
          v193 = v195;
          CATransform3DTranslate(&m, &v193, 0.0, 0.0, (double)v39);
          v195 = m;
          objc_msgSend(v44, "setTransform3D:", &m);
          *(_OWORD *)&m.m11 = v196;
          *(_OWORD *)&m.m13 = v197;
          *(_OWORD *)&m.m21 = v198;
          CLKFrameFromCenterBoundsAndTransform();
          x = v221.origin.x;
          y = v221.origin.y;
          width = v221.size.width;
          height = v221.size.height;
          v247.origin.y = v181;
          v247.origin.x = v183;
          v247.size.height = v178;
          v247.size.width = rect;
          v222 = CGRectIntersection(v221, v247);
          CGRectGetHeight(v222);
          v223.origin.x = x;
          v223.origin.y = y;
          v223.size.width = width;
          v223.size.height = height;
          CGRectGetHeight(v223);
          CLKInterpolateBetweenFloatsClipped();
          objc_msgSend(v44, "setShadowAlpha:");
          objc_msgSend(v44, "setComputedFrame:", x, y, width, height);
          rect1 = height;
          objc_msgSend(v44, "setUnitFrameOnScreen:", NTKUpNextUnitRectForFrameInBounds(x, y, width, height, v166, v165, v168, v167));
          -[NTKUpNextCollectionViewFlowLayout _updateVisibilityForLayoutAttributes:inBounds:](self, "_updateVisibilityForLayoutAttributes:inBounds:", v44, v166, v165, v168, v167);
          objc_msgSend(v160, "setObject:forKeyedSubscript:", v44, v42);
          v78 = objc_msgSend(v173, "count");
          if (v78 < NTKUpNextMaximumNumberOfDwellItems && objc_msgSend(v44, "fullyVisibleToUser"))
            objc_msgSend(v173, "addObject:", v42);

          ++v38;
          --v39;
          v24 = v185;
          v23 = v186;
        }
        while (v30 != v38);
        v20 = -v39;
        v15 = v158;
      }
      ++v22;
    }
    while (v22 != v157);
  }
  v81 = (NSDictionary *)objc_msgSend(v160, "copy");
  layoutInfo = self->_layoutInfo;
  self->_layoutInfo = v81;

  v83 = (NSSet *)objc_msgSend(v173, "copy");
  dwellIndexPathes = self->_dwellIndexPathes;
  self->_dwellIndexPathes = v83;

  if (v157 < 1)
  {
    v148 = obj;
    objc_storeStrong((id *)&self->_headerLayoutInfo, obj);
    goto LABEL_67;
  }
  v85 = 0;
  v184 = *MEMORY[0x1E0DC48A8];
  v187 = *MEMORY[0x1E0C9D538];
  v86 = v166;
  do
  {
    if (!-[NTKUpNextCollectionViewFlowLayout _hasHeaderForSection:](self, "_hasHeaderForSection:", v85))
      goto LABEL_62;
    -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "numberOfItemsInSection:", v85);

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v88 - 1, v85);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v85);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v192.receiver = self;
    v192.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
    -[UICollectionViewFlowLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](&v192, sel_layoutAttributesForSupplementaryViewOfKind_atIndexPath_, v184, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = (void *)objc_msgSend(v92, "copy");

    objc_msgSend(v93, "frame");
    MinX = v94;
    v97 = v96;
    v99 = v98;
    v101 = v100;
    v228.origin.x = v86;
    v228.origin.y = v165;
    v228.size.height = v167;
    v228.size.width = v168;
    v102 = CGRectGetMinY(v228);
    v229.origin.x = MinX;
    v229.origin.y = v97;
    v229.size.width = v99;
    v229.size.height = v101;
    v103 = v102 + CGRectGetHeight(v229);
    -[NTKUpNextCollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v91);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "computedFrame");
    v106 = v105;
    tza = v107;
    v109 = v108;
    v111 = v110;
    v112 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v196 = *MEMORY[0x1E0C9BAA8];
    v197 = v112;
    v198 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v113 = MinX;
    *(double *)&v112 = v97;
    v114 = v99;
    v115 = v101;
    if (CGRectGetMaxY(*(CGRect *)((char *)&v112 - 8)) >= v103)
    {
      v179 = v109;
      objc_msgSend(v104, "scale");
      v118 = v117;
      objc_msgSend(v104, "alpha");
      objc_msgSend(v93, "setAlpha:", v119 * self->_headerAlpha);
      objc_msgSend(v93, "setHidden:", objc_msgSend(v104, "isHidden"));
      if (fabs(v118 + -1.0) >= 0.00000011920929)
      {
        v120 = tza;
        if (objc_msgSend(v104, "layoutMode"))
        {
          v241.size.height = v111;
          v241.origin.x = v106;
          v241.origin.y = tza;
          v241.size.width = v179;
          v147 = CGRectGetMinY(v241);
          v242.origin.x = MinX;
          v242.origin.y = v97;
          v242.size.width = v99;
          v242.size.height = v101;
          v97 = v147 - CGRectGetHeight(v242);
          NTKUpNextMakeScaleTransformWithBoundsAndScale((uint64_t)&v196, v187, v118);
        }
        goto LABEL_53;
      }
    }
    else
    {
      objc_msgSend(v90, "computedFrame");
      v116 = CGRectGetMaxY(v230);
      if (v116 < v103)
        v103 = v116;
      v231.origin.x = MinX;
      v231.origin.y = v97;
      v231.size.width = v99;
      v231.size.height = v101;
      v97 = v103 - CGRectGetHeight(v231);
      objc_msgSend(v93, "setAlpha:", self->_headerAlpha);
    }
    v120 = tza;
LABEL_53:
    v232.origin.x = MinX;
    v232.origin.y = v97;
    v232.size.width = v99;
    v232.size.height = v101;
    v121 = CGRectGetMinY(v232);
    v233.origin.y = v165;
    v233.origin.x = v166;
    v233.size.height = v167;
    v233.size.width = v168;
    if (v121 >= CGRectGetMinY(v233) + self->_statusBarDecorationHeight)
      v122 = -v120;
    else
      v122 = 11.0;
    tzb = v122;
    if (-[CLKDevice deviceCategory](self->_device, "deviceCategory") != 1)
    {
      v234.origin.x = MinX;
      v234.origin.y = v97;
      v234.size.width = v99;
      v234.size.height = v101;
      v123 = CGRectGetHeight(v234);
      -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 2, 1, MinX, v97, v123, v101);
      v126 = v125;
      v128 = v127;
      v130 = v129;
      v132 = v131;

      v235.origin.x = v126;
      v235.origin.y = v128;
      v235.size.width = v130;
      v235.size.height = v132;
      if (!CGRectIsNull(v235))
        goto LABEL_60;
      -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "bounds");
      v135 = v134;
      v182 = v136;
      v138 = v137;
      v140 = v139;

      v236.origin.x = MinX;
      v236.origin.y = v97;
      v236.size.width = v99;
      v236.size.height = v101;
      v141 = CGRectGetMinY(v236);
      v237.origin.x = v135;
      v237.origin.y = v182;
      v237.size.width = v138;
      v237.size.height = v140;
      if (v141 < CGRectGetMinY(v237))
      {
        -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        v238.origin.x = v135;
        v238.origin.y = v182;
        v238.size.width = v138;
        v238.size.height = v140;
        objc_msgSend(v142, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 2, 1, 0.0, CGRectGetMinY(v238), 50.0, 50.0);
        v126 = v143;
        v128 = v144;
        v130 = v145;
        v132 = v146;

        v239.origin.x = v126;
        v239.origin.y = v128;
        v239.size.width = v130;
        v239.size.height = v132;
        if (!CGRectIsNull(v239))
        {
LABEL_60:
          v240.origin.x = v126;
          v240.origin.y = v128;
          v240.size.width = v130;
          v240.size.height = v132;
          MinX = CGRectGetMinX(v240);
        }
      }
    }
    MEMORY[0x1BCCA72B8](MinX, v97, v99, v101);
    objc_msgSend(v93, "setFrame:", MinX, v97, v99, v101);
    memset(&v195, 0, sizeof(v195));
    *(_OWORD *)&m.m11 = v196;
    *(_OWORD *)&m.m13 = v197;
    *(_OWORD *)&m.m21 = v198;
    CATransform3DMakeAffineTransform(&v195, (CGAffineTransform *)&m);
    v193 = v195;
    CATransform3DTranslate(&m, &v193, 0.0, 0.0, tzb);
    v195 = m;
    objc_msgSend(v93, "setTransform3D:", &m);
    *(_OWORD *)&m.m11 = v196;
    *(_OWORD *)&m.m13 = v197;
    *(_OWORD *)&m.m21 = v198;
    CLKFrameFromCenterBoundsAndTransform();
    objc_msgSend(v93, "setComputedFrame:");
    objc_msgSend(obj, "setObject:forKeyedSubscript:", v93, v91);

    v86 = v166;
LABEL_62:
    ++v85;
  }
  while (v157 != v85);
  v148 = obj;
  objc_storeStrong((id *)&self->_headerLayoutInfo, obj);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:withIndexPath:](NTKUpNextCollectionViewFlowLayoutAttributes, "layoutAttributesForDecorationViewOfKind:withIndexPath:", CFSTR("NTKUpNextCollectionViewFlowLayoutStatusBarDecorationKind"), v149);
  v150 = (NTKUpNextCollectionViewFlowLayoutAttributes *)objc_claimAutoreleasedReturnValue();
  decorationLayoutInfo = self->_decorationLayoutInfo;
  self->_decorationLayoutInfo = v150;

  v152 = self->_decorationLayoutInfo;
  v243.origin.x = v86;
  v243.origin.y = v165;
  v243.size.width = v168;
  v243.size.height = v167;
  v153 = CGRectGetMinY(v243);
  v244.origin.x = v86;
  v244.origin.y = v165;
  v244.size.width = v168;
  v244.size.height = v167;
  -[UICollectionViewLayoutAttributes setFrame:](v152, "setFrame:", 0.0, v153, CGRectGetWidth(v244), self->_statusBarDecorationHeight);
  -[UICollectionViewLayoutAttributes setAlpha:](self->_decorationLayoutInfo, "setAlpha:", self->_topItemsAlpha);
  v154 = self->_decorationLayoutInfo;
  CATransform3DMakeTranslation(&v191, 0.0, 0.0, 10.0);
  -[UICollectionViewLayoutAttributes setTransform3D:](v154, "setTransform3D:", &v191);
LABEL_67:

}

- (void)finalizeCollectionViewUpdates
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
  -[NTKUpNextCollectionViewFlowLayout finalizeCollectionViewUpdates](&v14, sel_finalizeCollectionViewUpdates);
  if (self->_indexPathToSnapTo)
  {
    -[NTKUpNextCollectionViewFlowLayout flowLayoutAttributesForItemAtIndexPath:](self, "flowLayoutAttributesForItemAtIndexPath:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    -[NTKUpNextCollectionViewFlowLayout targetContentOffsetForProposedContentOffset:](self, "targetContentOffsetForProposedContentOffset:");
    v5 = v4;
    v7 = v6 + self->_snappingOffset;
    -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;

    -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBounds:", v5, v7, v10, v12);

  }
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
  -[UICollectionViewFlowLayout invalidationContextForBoundsChange:](&v5, sel_invalidationContextForBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvalidateFlowLayoutAttributes:", 0);
  objc_msgSend(v3, "setInvalidateFlowLayoutDelegateMetrics:", 0);
  return v3;
}

- (id)flowLayoutAttributesForItemAtIndexPath:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
  -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v4, sel_layoutAttributesForItemAtIndexPath_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_layoutInfo, "objectForKeyedSubscript:", a3);
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return -[NSDictionary objectForKeyedSubscript:](self->_headerLayoutInfo, "objectForKeyedSubscript:", a4);
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return self->_decorationLayoutInfo;
}

- (void)_updateVisibilityForLayoutAttributes:(id)a3 inBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MaxY;
  CGFloat v9;
  double v10;
  _BOOL4 v11;
  double MinY;
  uint64_t v14;
  uint64_t v15;
  id v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v16 = a3;
  objc_msgSend(v16, "computedFrame");
  MaxY = CGRectGetMaxY(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v9 = CGRectGetMinY(v18) + self->_statusBarDecorationHeight;
  -[UICollectionViewFlowLayout minimumLineSpacing](self, "minimumLineSpacing");
  v11 = MaxY < v9 + v10 + 0.5;
  objc_msgSend(v16, "computedFrame");
  MinY = CGRectGetMinY(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  LODWORD(self) = MinY >= CGRectGetMinY(v20) + self->_statusBarDecorationHeight + -0.5;
  v14 = objc_msgSend(v16, "layoutMode");
  v15 = v14 == 4 || v11;
  if (v14 == 4)
    self = 0;
  else
    self = (NTKUpNextCollectionViewFlowLayout *)self;
  objc_msgSend(v16, "setNotVisibleToUser:", v15);
  objc_msgSend(v16, "setFullyVisibleToUser:", self);

}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  _BOOL4 showingAllAttributes;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v42 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_opt_new();
  showingAllAttributes = self->_showingAllAttributes;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[NSDictionary allValues](self->_layoutInfo, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if (showingAllAttributes)
          goto LABEL_7;
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "computedFrame");
        v45.origin.x = v16;
        v45.origin.y = v17;
        v45.size.width = v18;
        v45.size.height = v19;
        v43.origin.x = x;
        v43.origin.y = y;
        v43.size.width = width;
        v43.size.height = height;
        if (CGRectIntersectsRect(v43, v45))
        {
          objc_msgSend(v15, "alpha");
          if (fabs(v20) >= 0.00000011920929)
LABEL_7:
            objc_msgSend(v8, "addObject:", v15);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v12);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[NSDictionary allValues](self->_headerLayoutInfo, "allValues", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
        if (showingAllAttributes)
          goto LABEL_19;
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "computedFrame");
        v46.origin.x = v27;
        v46.origin.y = v28;
        v46.size.width = v29;
        v46.size.height = v30;
        v44.origin.x = x;
        v44.origin.y = y;
        v44.size.width = width;
        v44.size.height = height;
        if (CGRectIntersectsRect(v44, v46))
LABEL_19:
          objc_msgSend(v8, "addObject:", v26);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v23);
  }

  if (self->_decorationLayoutInfo)
    objc_msgSend(v8, "addObject:");
  return v8;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[NTKUpNextCollectionViewFlowLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](self, "targetContentOffsetForProposedContentOffset:withScrollingVelocity:", a3.x, a3.y, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y;
  CGFloat x;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  double v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t k;
  void *v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  double height;
  double v51;
  double v52;
  void *v53;
  char v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  objc_super v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;
  CGPoint result;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  y = a3.y;
  x = a3.x;
  v76 = *MEMORY[0x1E0C80C00];
  if (self->_snappingEnabled)
  {
    -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView", a3.x, a3.y, a4.x, a4.y);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfSections");

    if (v8 < 1)
    {
      v10 = 0;
    }
    else
    {
      v10 = 0;
      for (i = 0; i != v8; ++i)
      {
        -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "numberOfItemsInSection:", i);

        v9 = v13 - 1;
        if (v13 >= 1)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9, i);
          v14 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v14;
        }
      }
    }
    -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView", v9, *(_QWORD *)&x);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;

    UIRectInsetEdges();
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v73.receiver = self;
    v73.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
    -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v73, sel_layoutAttributesForElementsInRect_, v17, y, v19, v21);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_opt_new();
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v32 = v30;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v70;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v70 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
          objc_msgSend(v37, "frame");
          v81.origin.x = v23;
          v81.origin.y = v25;
          v81.size.width = v27;
          v81.size.height = v29;
          if (CGRectIntersectsRect(v78, v81) && !objc_msgSend(v37, "representedElementCategory"))
            objc_msgSend(v31, "addObject:", v37);
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
      }
      while (v34);
    }
    v63 = y;

    v38 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v64 = *MEMORY[0x1E0C9D538];
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v39 = v31;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v66;
      v43 = 0.0;
      while (2)
      {
        for (k = 0; k != v41; ++k)
        {
          if (*(_QWORD *)v66 != v42)
            objc_enumerationMutation(v39);
          v45 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * k);
          objc_msgSend(v45, "frame");
          v82.origin.x = v46;
          v82.origin.y = v47;
          v82.size.width = v48;
          v82.size.height = v49;
          v79.origin.x = v23;
          v79.origin.y = v25;
          v79.size.width = v27;
          v79.size.height = v29;
          v80 = CGRectIntersection(v79, v82);
          height = v80.size.height;
          objc_msgSend(v45, "frame", v80.origin.x, v80.origin.y, v80.size.width);
          v52 = height / v51;
          if (v52 > 0.449999988
            || (objc_msgSend(v45, "indexPath"),
                v53 = (void *)objc_claimAutoreleasedReturnValue(),
                v54 = objc_msgSend(v53, "isEqual:", v10),
                v53,
                (v54 & 1) != 0))
          {
            objc_msgSend(v45, "frame");
            x = v57;
            y = v58 - self->_topOffsetForSnapping;

            goto LABEL_35;
          }
          if (v52 > v43)
          {
            objc_msgSend(v45, "frame");
            v64 = v55;
            v38 = v56;
            v43 = v52;
          }
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
        if (v41)
          continue;
        break;
      }
    }
    else
    {
      v43 = 0.0;
    }

    v59 = fabs(v43);
    x = v62;
    y = v63;
    if (v59 >= 0.00000011920929)
    {
      y = v38 - self->_topOffsetForSnapping;
      x = v64;
    }
LABEL_35:

  }
  v60 = x;
  v61 = y;
  result.y = v61;
  result.x = v60;
  return result;
}

- (id)indexPathsToDeleteForSupplementaryViewOfKind:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC48A8]))
  {
    v5 = (void *)-[NSSet mutableCopy](self->_previousSectionsWithHeaders, "mutableCopy");
    objc_msgSend(v5, "minusSet:", self->_sectionsWithHeaders);
    v20.receiver = self;
    v20.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
    -[NTKUpNextCollectionViewFlowLayout indexPathsToDeleteForSupplementaryViewOfKind:](&v20, sel_indexPathsToDeleteForSupplementaryViewOfKind_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "integerValue"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
    -[NTKUpNextCollectionViewFlowLayout indexPathsToDeleteForSupplementaryViewOfKind:](&v15, sel_indexPathsToDeleteForSupplementaryViewOfKind_, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)_updateSectionHeaderListIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  NSSet *v7;
  NSSet *sectionsWithHeaders;
  id v9;

  if (self->_needsHeaderUpdate)
  {
    self->_needsHeaderUpdate = 0;
    objc_storeStrong((id *)&self->_previousSectionsWithHeaders, self->_sectionsWithHeaders);
    v9 = (id)objc_opt_new();
    -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "numberOfSections");

    if (v4 >= 1)
    {
      for (i = 0; i != v4; ++i)
      {
        if (-[NTKUpNextCollectionViewFlowLayout _hasHeaderForSection:](self, "_hasHeaderForSection:", i))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v6);

        }
      }
    }
    v7 = (NSSet *)objc_msgSend(v9, "copy");
    sectionsWithHeaders = self->_sectionsWithHeaders;
    self->_sectionsWithHeaders = v7;

  }
}

- (void)_updateContentInsetsIfNeeded
{
  void *v3;
  uint64_t v4;
  NSInteger v5;
  NSInteger v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  void *v22;
  CGFloat v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  objc_super v41;
  CGRect v42;
  CGRect v43;

  if (self->_needsInsetsUpdate)
  {
    self->_needsInsetsUpdate = 0;
    -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "numberOfSections");

    v5 = -[NSIndexPath section](self->_topElementIndexPath, "section");
    if (v5 >= v4)
    {
      v12 = 0;
      v7 = 0;
    }
    else
    {
      v6 = v5;
      v7 = 0;
      v8 = 0;
      do
      {
        -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "numberOfItemsInSection:", v6);

        if (v10 < 1)
        {
          v12 = v8;
        }
        else
        {
          for (i = 0; i != v10; ++i)
          {
            v12 = v7;

            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, v6);
            v7 = (void *)objc_claimAutoreleasedReturnValue();

            v8 = v12;
          }
        }
        ++v6;
        v8 = v12;
      }
      while (v6 != v4);
    }
    -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentInset");
    v15 = v14;
    v17 = v16;
    v19 = v18;

    if (v12)
      v20 = v12;
    else
      v20 = v7;
    v21 = v20;
    if (v21)
    {
      v41.receiver = self;
      v41.super_class = (Class)NTKUpNextCollectionViewFlowLayout;
      -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v41, sel_layoutAttributesForItemAtIndexPath_, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "frame");
      v23 = CGRectGetMinY(v42) - self->_topOffsetForSnapping;
      -[UICollectionViewFlowLayout collectionViewContentSize](self, "collectionViewContentSize");
      v25 = v24 - v23;
      -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bounds");
      v27 = CGRectGetHeight(v43) - v25;

    }
    else
    {
      v27 = 0.0;
    }
    -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "contentInset");
    if (v17 == v32 && v15 == v29 && v19 == v31)
    {
      v33 = v30;

      if (v27 == v33)
      {
LABEL_25:

        return;
      }
    }
    else
    {

    }
    -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "contentOffset");
    v36 = v35;
    v38 = v37;

    -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setContentInset:", v15, v17, v27, v19);

    -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setContentOffset:animated:", 0, v36, v38);

    goto LABEL_25;
  }
}

- (BOOL)_hasHeaderForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUpNextCollectionViewFlowLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionView:layout:referenceSizeForHeaderInSection:", v7, self, a3);
  v9 = v8;
  v11 = v10;

  return v11 != *(double *)(MEMORY[0x1E0C9D820] + 8) || v9 != *MEMORY[0x1E0C9D820];
}

- (double)topItemsAlpha
{
  return self->_topItemsAlpha;
}

- (double)headerAlpha
{
  return self->_headerAlpha;
}

- (double)topItemsShift
{
  return self->_topItemsShift;
}

- (void)setTopItemsShift:(double)a3
{
  self->_topItemsShift = a3;
}

- (double)statusBarDecorationHeight
{
  return self->_statusBarDecorationHeight;
}

- (void)setStatusBarDecorationHeight:(double)a3
{
  self->_statusBarDecorationHeight = a3;
}

- (NSIndexPath)topElementIndexPath
{
  return self->_topElementIndexPath;
}

- (void)setTopElementIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_topElementIndexPath, a3);
}

- (NSIndexPath)bottomElementIndexPath
{
  return self->_bottomElementIndexPath;
}

- (void)setBottomElementIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_bottomElementIndexPath, a3);
}

- (double)topOffsetForSnapping
{
  return self->_topOffsetForSnapping;
}

- (double)topOffsetForScrolling
{
  return self->_topOffsetForScrolling;
}

- (double)lowTransitionScale
{
  return self->_lowTransitionScale;
}

- (void)setLowTransitionScale:(double)a3
{
  self->_lowTransitionScale = a3;
}

- (double)lowTransitionShift
{
  return self->_lowTransitionShift;
}

- (void)setLowTransitionShift:(double)a3
{
  self->_lowTransitionShift = a3;
}

- (double)highTransitionScale
{
  return self->_highTransitionScale;
}

- (void)setHighTransitionScale:(double)a3
{
  self->_highTransitionScale = a3;
}

- (double)highTransitionShift
{
  return self->_highTransitionShift;
}

- (void)setHighTransitionShift:(double)a3
{
  self->_highTransitionShift = a3;
}

- (BOOL)useFixedLowTransitionLayout
{
  return self->_useFixedLowTransitionLayout;
}

- (void)setUseFixedLowTransitionLayout:(BOOL)a3
{
  self->_useFixedLowTransitionLayout = a3;
}

- (double)maximumDarkeningAmount
{
  return self->_maximumDarkeningAmount;
}

- (double)highTransitionBottomOffset
{
  return self->_highTransitionBottomOffset;
}

- (void)setHighTransitionBottomOffset:(double)a3
{
  self->_highTransitionBottomOffset = a3;
}

- (BOOL)isSnappingEnabled
{
  return self->_snappingEnabled;
}

- (void)setSnappingEnabled:(BOOL)a3
{
  self->_snappingEnabled = a3;
}

- (BOOL)isShowingAllAttributes
{
  return self->_showingAllAttributes;
}

- (void)setShowingAllAttributes:(BOOL)a3
{
  self->_showingAllAttributes = a3;
}

- (NSIndexPath)indexPathToSnapTo
{
  return self->_indexPathToSnapTo;
}

- (void)setIndexPathToSnapTo:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathToSnapTo, a3);
}

- (double)snappingOffset
{
  return self->_snappingOffset;
}

- (void)setSnappingOffset:(double)a3
{
  self->_snappingOffset = a3;
}

- (NSSet)dwellIndexPathes
{
  return self->_dwellIndexPathes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dwellIndexPathes, 0);
  objc_storeStrong((id *)&self->_indexPathToSnapTo, 0);
  objc_storeStrong((id *)&self->_bottomElementIndexPath, 0);
  objc_storeStrong((id *)&self->_topElementIndexPath, 0);
  objc_storeStrong((id *)&self->_sectionsWithHeaders, 0);
  objc_storeStrong((id *)&self->_previousSectionsWithHeaders, 0);
  objc_storeStrong((id *)&self->_decorationLayoutInfo, 0);
  objc_storeStrong((id *)&self->_headerLayoutInfo, 0);
  objc_storeStrong((id *)&self->_layoutInfo, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
