@implementation ICDocCamThumbnailCollectionViewLayout

- (ICDocCamThumbnailCollectionViewLayout)init
{
  ICDocCamThumbnailCollectionViewLayout *v2;
  ICDocCamThumbnailCollectionViewLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICDocCamThumbnailCollectionViewLayout;
  v2 = -[ICDocCamThumbnailCollectionViewLayout init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ICDocCamThumbnailCollectionViewLayout setup](v2, "setup");
  return v3;
}

- (ICDocCamThumbnailCollectionViewLayout)initWithCoder:(id)a3
{
  ICDocCamThumbnailCollectionViewLayout *v3;
  ICDocCamThumbnailCollectionViewLayout *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICDocCamThumbnailCollectionViewLayout;
  v3 = -[ICDocCamThumbnailCollectionViewLayout init](&v6, sel_init, a3);
  v4 = v3;
  if (v3)
    -[ICDocCamThumbnailCollectionViewLayout setup](v3, "setup");
  return v4;
}

- (void)setup
{
  CGRect v3;
  CGRect v4;

  v3.size.width = 46.3636364;
  v3.size.height = 60.0;
  v3.origin.x = 0.0;
  v3.origin.y = 0.0;
  v4 = CGRectIntegral(v3);
  -[ICDocCamThumbnailCollectionViewLayout setItemSize:](self, "setItemSize:", v4.size.width, v4.size.height);
  -[ICDocCamThumbnailCollectionViewLayout registerClass:forDecorationViewOfKind:](self, "registerClass:forDecorationViewOfKind:", objc_opt_class(), CFSTR("DecorationIdentifier"));
}

- (void)prepareLayout
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom") == 0;

  -[ICDocCamThumbnailCollectionViewLayout setCompactLayout:](self, "setCompactLayout:", v4);
  -[ICDocCamThumbnailCollectionViewLayout prepareLayout:](self, "prepareLayout:", -[ICDocCamThumbnailCollectionViewLayout compactLayout](self, "compactLayout"));
}

- (void)prepareLayout:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _BOOL8 v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  _BOOL4 v55;

  v55 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v52 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfSections");

  v53 = v5;
  if (v5 >= 1)
  {
    v6 = 0;
    v7 = 0x24BDD1000uLL;
    v8 = v54;
    do
    {
      -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "numberOfItemsInSection:", v6);

      v11 = v10 - 1;
      if (v10 >= 1)
      {
        for (i = 0; i != v10; ++i)
        {
          objc_msgSend(*(id *)(v7 + 1496), "indexPathForItem:inSection:", i, v6);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:](ICDocCamThumbnailViewLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          objc_opt_isKindOfClass();
          if (v55)
          {
            objc_msgSend(*(id *)(v7 + 1496), "indexPathForItem:inSection:", v10 - 1, v6);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICDocCamThumbnailCollectionViewLayout delegate](self, "delegate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "collectionView:imageSizeAtIndex:", v17, objc_msgSend(v15, "item"));
            v19 = v18;
            v21 = v20;

            v8 = v54;
            -[ICDocCamThumbnailCollectionViewLayout frameSizeForImageSize:](self, "frameSizeForImageSize:", v19, v21);
            v23 = v22;
            v25 = v24;
            -[ICDocCamThumbnailCollectionViewLayout compactFrameForThumbnailAtIndexPath:withSize:](self, "compactFrameForThumbnailAtIndexPath:withSize:", v13);
            objc_msgSend(v14, "setFrame:");
            objc_msgSend(v14, "setImageWidth:", v23);
            objc_msgSend(v14, "setImageHeight:", v25);
            v26 = v10 - 2 != i && v11 != i;
            objc_msgSend(v14, "setRenderShadow:", v11 == i);
            v27 = v26;
            v7 = 0x24BDD1000;
            objc_msgSend(v14, "setHidden:", v27);

          }
          else
          {
            -[ICDocCamThumbnailCollectionViewLayout delegate](self, "delegate");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "collectionView:imageSizeAtIndex:", v29, objc_msgSend(v13, "item"));
            v31 = v30;
            v33 = v32;

            v7 = 0x24BDD1000;
            -[ICDocCamThumbnailCollectionViewLayout frameSizeForImageSize:](self, "frameSizeForImageSize:", v31, v33);
            v35 = v34;
            v37 = v36;
            -[ICDocCamThumbnailCollectionViewLayout frameForThumbnailAtIndexPath:](self, "frameForThumbnailAtIndexPath:", v13);
            objc_msgSend(v14, "setFrame:");
            objc_msgSend(v14, "setImageWidth:", v35);
            objc_msgSend(v14, "setImageHeight:", v37);
            objc_msgSend(v14, "setRenderShadow:", 1);
            objc_msgSend(v14, "setHidden:", 0);
          }
          objc_msgSend(v14, "setZIndex:", objc_msgSend(v13, "item"));
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v13);

        }
      }
      ++v6;
    }
    while (v6 != v53);
    if (!v55 && v53 >= 1)
    {
      v38 = 0;
      while (2)
      {
        -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "numberOfItemsInSection:", v38);

        v41 = v40 - 2;
        if (v40 >= 2)
        {
          v42 = 0;
          do
          {
            objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v42, v38);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", ++v42, v38);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "objectForKeyedSubscript:", v43);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "objectForKeyedSubscript:", v44);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "frame");
            v48 = v47;
            objc_msgSend(v46, "frame");
            v50 = v48 - v49;
            if (v50 < 0.0)
              v50 = -v50;
            if (v50 < 8.0)
            {
              -[ICDocCamThumbnailCollectionViewLayout setCompactLayout:](self, "setCompactLayout:", 1);
              -[ICDocCamThumbnailCollectionViewLayout prepareLayout:](self, "prepareLayout:", 1);

              v51 = v54;
              goto LABEL_25;
            }

          }
          while (v42 - 1 != v41);
          if (++v38 != v53)
            continue;
        }
        break;
      }
    }
  }
  v51 = v54;
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v54, CFSTR("ICDocCamThumbnailCellKind"));
  -[ICDocCamThumbnailCollectionViewLayout setLayoutInfo:](self, "setLayoutInfo:", v52);
LABEL_25:

}

- (CGSize)frameSizeForImageSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[ICDocCamThumbnailCollectionViewLayout itemSize](self, "itemSize");
  v8 = v7;
  if (width > height)
  {
    -[ICDocCamThumbnailCollectionViewLayout itemSize](self, "itemSize");
    v10 = v9;
    v6 = v8;
    v8 = v10;
  }
  v11 = v8;
  result.height = v11;
  result.width = v6;
  return result;
}

- (CGRect)compactFrameForThumbnailAtIndexPath:(id)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a4.height;
  width = a4.width;
  v7 = 0.0;
  if (objc_msgSend(MEMORY[0x24BDF6750], "dc_isRTL", a3))
  {
    -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;

    v7 = v10 - width;
  }
  -[ICDocCamThumbnailCollectionViewLayout itemSize](self, "itemSize");
  v12 = v11 - height + 0.0;
  v13 = v7;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v12;
  result.origin.x = v13;
  return result;
}

- (CGRect)frameForThumbnailAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
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
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  uint64_t v48;
  double *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double *v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i;
  double v81;
  uint64_t v82;
  uint64_t v83;
  double *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  double *v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  uint64_t v96;
  double v97;
  double *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  double *v102;
  void *v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  uint64_t v110;
  double v111;
  uint64_t v112;
  void *v113;
  double v114;
  double v115;
  uint64_t v116;
  uint64_t v117;
  double v118;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  double v123;
  double *v124;
  double v125;
  double v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  double *v132;
  double v133;
  uint64_t v134;
  uint64_t v135;
  double v136;
  uint64_t v137;
  uint64_t v138;
  double v139;
  void *v140;
  double v141;
  double v142;
  double v143;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  double v148;
  double v149;
  double v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t j;
  double v156;
  uint64_t v157;
  uint64_t v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  uint64_t v164;
  void *v165;
  uint64_t *v166;
  uint64_t v167;
  CGRect result;

  v167 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfItemsInSection:", 0);

  if (v6)
  {
    -[ICDocCamThumbnailCollectionViewLayout delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionView:imageSizeAtIndex:", v8, objc_msgSend(v4, "item"));
    v10 = v9;
    v12 = v11;

    -[ICDocCamThumbnailCollectionViewLayout frameSizeForImageSize:](self, "frameSizeForImageSize:", v10, v12);
    v14 = v13;
    v16 = v15;
    -[ICDocCamThumbnailCollectionViewLayout delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "rootView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "frame");
    v20 = v19 * 0.5;
    v22 = v21 * 0.5;
    -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "convertPoint:toView:", v23, v20, v22);
    v25 = v24;

    if (objc_msgSend(MEMORY[0x24BDF6750], "dc_isRTL"))
    {
      -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "frame");
      v28 = v27;

      if ((DCDebugInterfaceEnabled() & 1) != 0
        || (objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"),
            v29 = (void *)objc_claimAutoreleasedReturnValue(),
            v30 = objc_msgSend(v29, "userInterfaceIdiom"),
            v29,
            v30 == 1))
      {
        MEMORY[0x24BDAC7A8]();
        v31 = (double *)(&v164 - 2 * v6);
        v32 = v6 - 1;
        if (v6 < 1)
        {
          v44 = 0.0;
        }
        else
        {
          v165 = v18;
          v166 = &v164;
          v33 = 0;
          v34 = 0;
          v35 = v31 + 1;
          do
          {
            -[ICDocCamThumbnailCollectionViewLayout delegate](self, "delegate");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "collectionView:imageSizeAtIndex:", v37, v34);
            v39 = v38;
            v41 = v40;

            -[ICDocCamThumbnailCollectionViewLayout frameSizeForImageSize:](self, "frameSizeForImageSize:", v39, v41);
            *(v35 - 1) = v42;
            *(_QWORD *)v35 = v43;
            v33 = (uint64_t)(v42 + (double)v33);
            ++v34;
            v35 += 2;
          }
          while (v6 != v34);
          v44 = (double)v33;
          v18 = v165;
        }
        -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "frame");
        v65 = v64;

        v66 = fmin((v65 - v44) / (double)v32, 10.0);
        v46 = v25 + (double)((uint64_t)(v44 + v66 * (double)v32) / 2) - *v31;
        v67 = objc_msgSend(v4, "item");
        if (v67 >= v32)
          v68 = v32;
        else
          v68 = v67;
        if (v68 >= 1)
        {
          v69 = 0;
          v70 = v31 + 2;
          do
          {
            v71 = *v70;
            v70 += 2;
            v46 = v46 - (v66 + v71);
            v72 = objc_msgSend(v4, "item");
            if (v72 >= v32)
              v73 = v32;
            else
              v73 = v72;
            ++v69;
          }
          while (v69 < v73);
        }
      }
      else
      {
        v166 = &v164;
        MEMORY[0x24BDAC7A8]();
        v84 = (double *)(&v164 - 2 * v6);
        v85 = v6 - 1;
        if (v6 < 1)
        {
          v97 = 0.0;
        }
        else
        {
          v165 = v18;
          v86 = 0;
          v87 = 0;
          v88 = v84 + 1;
          do
          {
            -[ICDocCamThumbnailCollectionViewLayout delegate](self, "delegate");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "collectionView:imageSizeAtIndex:", v90, v87);
            v92 = v91;
            v94 = v93;

            -[ICDocCamThumbnailCollectionViewLayout frameSizeForImageSize:](self, "frameSizeForImageSize:", v92, v94);
            *(v88 - 1) = v95;
            *(_QWORD *)v88 = v96;
            v86 = (uint64_t)(v95 + (double)v86);
            ++v87;
            v88 += 2;
          }
          while (v6 != v87);
          v97 = (double)v86;
          v18 = v165;
        }
        v112 = (uint64_t)(v97 + (double)v85 * 10.0);
        -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "frame");
        v115 = v114;

        if (v112 >= 0)
          v116 = v112;
        else
          v116 = v112 + 1;
        v117 = v116 >> 1;
        v118 = v25 + (double)v117;
        if (v25 - (double)v117 >= 0.0 && v118 <= v115)
        {
          v46 = v118 - *v84;
          v129 = objc_msgSend(v4, "item");
          if (v129 >= v85)
            v130 = v85;
          else
            v130 = v129;
          if (v130 >= 1)
          {
            v131 = 0;
            v132 = v84 + 2;
            do
            {
              v133 = *v132;
              v132 += 2;
              v46 = v46 - (v133 + 10.0);
              v134 = objc_msgSend(v4, "item");
              if (v134 >= v85)
                v135 = v85;
              else
                v135 = v134;
              ++v131;
            }
            while (v131 < v135);
          }
        }
        else
        {
          v46 = v28 - *v84;
          v120 = objc_msgSend(v4, "item");
          if (v120 >= v85)
            v121 = v85;
          else
            v121 = v120;
          if (v121 >= 1)
          {
            v122 = 0;
            v123 = fmin((v115 - (double)(uint64_t)((double)v112 - (double)v85 * 10.0)) / (double)v85, 10.0);
            v124 = v84 + 2;
            do
            {
              v125 = *v124;
              v124 += 2;
              v126 = v46 - (v123 + v125);
              if (v126 <= (double)(uint64_t)v46)
                v46 = v126;
              else
                v46 = (double)(uint64_t)v46;
              v127 = objc_msgSend(v4, "item");
              if (v127 >= v85)
                v128 = v85;
              else
                v128 = v127;
              ++v122;
            }
            while (v122 < v128);
          }
        }
      }
    }
    else if ((DCDebugInterfaceEnabled() & 1) != 0
           || (objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"),
               v47 = (void *)objc_claimAutoreleasedReturnValue(),
               v48 = objc_msgSend(v47, "userInterfaceIdiom"),
               v47,
               v48 == 1))
    {
      MEMORY[0x24BDAC7A8]();
      v49 = (double *)(&v164 - 2 * v6);
      v50 = v6 - 1;
      if (v6 < 1)
      {
        v62 = 0.0;
      }
      else
      {
        v165 = v18;
        v166 = &v164;
        v51 = 0;
        v52 = 0;
        v53 = v49 + 1;
        do
        {
          -[ICDocCamThumbnailCollectionViewLayout delegate](self, "delegate");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "collectionView:imageSizeAtIndex:", v55, v51);
          v57 = v56;
          v59 = v58;

          -[ICDocCamThumbnailCollectionViewLayout frameSizeForImageSize:](self, "frameSizeForImageSize:", v57, v59);
          *(v53 - 1) = v60;
          *(_QWORD *)v53 = v61;
          v52 = (uint64_t)(v60 + (double)v52);
          ++v51;
          v53 += 2;
        }
        while (v6 != v51);
        v62 = (double)v52;
        v18 = v165;
      }
      -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "frame");
      v76 = v75;

      v77 = fmin((v76 - v62) / (double)v50, 10.0);
      v46 = v25 - (double)((uint64_t)(v62 + v77 * (double)v50) / 2);
      v78 = objc_msgSend(v4, "item");
      if (v78 >= v6)
        v79 = v6;
      else
        v79 = v78;
      if (v79 >= 1)
      {
        for (i = 0; i < v83; ++i)
        {
          v81 = *v49;
          v49 += 2;
          v46 = v46 + v77 + v81;
          v82 = objc_msgSend(v4, "item");
          if (v82 >= v6)
            v83 = v6;
          else
            v83 = v82;
        }
      }
    }
    else
    {
      v166 = &v164;
      MEMORY[0x24BDAC7A8]();
      v98 = (double *)(&v164 - 2 * v6);
      v99 = v6 - 1;
      if (v6 < 1)
      {
        v111 = 0.0;
      }
      else
      {
        v165 = v18;
        v100 = 0;
        v101 = 0;
        v102 = v98 + 1;
        do
        {
          -[ICDocCamThumbnailCollectionViewLayout delegate](self, "delegate");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "collectionView:imageSizeAtIndex:", v104, v100);
          v106 = v105;
          v108 = v107;

          -[ICDocCamThumbnailCollectionViewLayout frameSizeForImageSize:](self, "frameSizeForImageSize:", v106, v108);
          *(v102 - 1) = v109;
          *(_QWORD *)v102 = v110;
          v101 = (uint64_t)(v109 + (double)v101);
          ++v100;
          v102 += 2;
        }
        while (v6 != v100);
        v111 = (double)v101;
        v18 = v165;
      }
      v136 = v111 + (double)v99 * 10.0;
      v137 = (uint64_t)v136;
      if ((uint64_t)v136 >= 0)
        v138 = (uint64_t)v136;
      else
        v138 = v137 + 1;
      v139 = (double)(v138 >> 1);
      v46 = v25 - v139;
      -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "frame");
      v142 = v141;

      v143 = v25 + v139;
      if (v25 - v139 >= 0.0 && v143 <= v142)
      {
        v153 = objc_msgSend(v4, "item", v143);
        if (v153 >= v6)
          v154 = v6;
        else
          v154 = v153;
        if (v154 >= 1)
        {
          for (j = 0; j < v158; ++j)
          {
            v156 = *v98;
            v98 += 2;
            v46 = v46 + v156 + 10.0;
            v157 = objc_msgSend(v4, "item");
            if (v157 >= v6)
              v158 = v6;
            else
              v158 = v157;
          }
        }
      }
      else
      {
        v145 = objc_msgSend(v4, "item", v143);
        if (v145 >= v6)
          v146 = v6;
        else
          v146 = v145;
        if (v146 < 1)
        {
          v46 = 0.0;
        }
        else
        {
          v147 = 0;
          v148 = fmin((v142 - (double)(uint64_t)((double)v137 - (double)v99 * 10.0)) / (double)v99, 10.0);
          v46 = 0.0;
          do
          {
            v149 = *v98;
            v98 += 2;
            v150 = v46 + v148 + v149;
            if (v150 >= (double)(uint64_t)v46)
              v46 = v150;
            else
              v46 = (double)(uint64_t)v46;
            v151 = objc_msgSend(v4, "item");
            if (v151 >= v6)
              v152 = v6;
            else
              v152 = v151;
            ++v147;
          }
          while (v147 < v152);
        }
      }
    }
    -[ICDocCamThumbnailCollectionViewLayout itemSize](self, "itemSize");
    v45 = v159 - v16 + 0.0;

  }
  else
  {
    v46 = *MEMORY[0x24BDBF090];
    v45 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v16 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v160 = v46;
  v161 = v45;
  v162 = v14;
  v163 = v16;
  result.size.height = v163;
  result.size.width = v162;
  result.origin.y = v161;
  result.origin.x = v160;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[9];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6;
  v24 = __Block_byref_object_dispose__6;
  v8 = (void *)MEMORY[0x24BDBCEB8];
  -[ICDocCamThumbnailCollectionViewLayout layoutInfo](self, "layoutInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v25 = (id)objc_claimAutoreleasedReturnValue();

  -[ICDocCamThumbnailCollectionViewLayout layoutInfo](self, "layoutInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __75__ICDocCamThumbnailCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v19[3] = &unk_24C5B9088;
  *(CGFloat *)&v19[5] = x;
  *(CGFloat *)&v19[6] = y;
  *(CGFloat *)&v19[7] = width;
  *(CGFloat *)&v19[8] = height;
  v19[4] = &v20;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v19);

  -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "numberOfItemsInSection:", 0);

  v13 = -[ICDocCamThumbnailCollectionViewLayout compactLayout](self, "compactLayout");
  if (v12 > 1 && v13)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v12 - 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamThumbnailCollectionViewLayout layoutAttributesForDecorationViewOfKind:atIndexPath:](self, "layoutAttributesForDecorationViewOfKind:atIndexPath:", CFSTR("DecorationIdentifier"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      objc_msgSend((id)v21[5], "addObject:", v16);

  }
  v17 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v17;
}

uint64_t __75__ICDocCamThumbnailCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __int128 v3;
  _QWORD v5[5];
  __int128 v6;
  __int128 v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __75__ICDocCamThumbnailCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_2;
  v5[3] = &unk_24C5B9060;
  v3 = *(_OWORD *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 40);
  v7 = v3;
  v5[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v5);
}

void __75__ICDocCamThumbnailCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  id v8;
  CGRect v9;

  v8 = a3;
  objc_msgSend(v8, "frame");
  v9.origin.x = v4;
  v9.origin.y = v5;
  v9.size.width = v6;
  v9.size.height = v7;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 40), v9))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v8);

}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ICDocCamThumbnailCollectionViewLayout layoutInfo](self, "layoutInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ICDocCamThumbnailCellKind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  double v23;

  v6 = a3;
  v7 = a4;
  -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfItemsInSection:", 0);

  v10 = 0;
  if (-[ICDocCamThumbnailCollectionViewLayout compactLayout](self, "compactLayout") && v9 >= 2)
  {
    objc_msgSend(MEMORY[0x24BDF6920], "layoutAttributesForDecorationViewOfKind:withIndexPath:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamThumbnailCollectionViewLayout layoutInfo](self, "layoutInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ICDocCamThumbnailCellKind"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "frame");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v22 = objc_msgSend(MEMORY[0x24BDF6750], "dc_isRTL");
    v23 = -2.0;
    if (v22)
      v23 = 2.0;
    objc_msgSend(v10, "setFrame:", v15 + v23, v17 + 2.0, v19, v21);
    objc_msgSend(v10, "setZIndex:", -1);

  }
  return v10;
}

- (CGSize)collectionViewContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  v9 = v5;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[ICDocCamThumbnailCollectionViewLayout transitioning](self, "transitioning"))
    return 1;
  -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v17 = CGRectGetWidth(v19);
  v20.origin.x = v10;
  v20.origin.y = v12;
  v20.size.width = v14;
  v20.size.height = v16;
  return v17 != CGRectGetWidth(v20);
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICDocCamThumbnailCollectionViewLayout;
  -[ICDocCamThumbnailCollectionViewLayout prepareForCollectionViewUpdates:](&v20, sel_prepareForCollectionViewUpdates_, v4);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamThumbnailCollectionViewLayout setDeleteIndexPaths:](self, "setDeleteIndexPaths:", v5);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamThumbnailCollectionViewLayout setInsertIndexPaths:](self, "setInsertIndexPaths:", v6);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "updateAction", (_QWORD)v16) == 1)
        {
          -[ICDocCamThumbnailCollectionViewLayout deleteIndexPaths](self, "deleteIndexPaths");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "indexPathBeforeUpdate");
          v14 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (objc_msgSend(v12, "updateAction"))
            continue;
          -[ICDocCamThumbnailCollectionViewLayout insertIndexPaths](self, "insertIndexPaths");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "indexPathAfterUpdate");
          v14 = objc_claimAutoreleasedReturnValue();
        }
        v15 = (void *)v14;
        objc_msgSend(v13, "addObject:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v9);
  }

}

- (void)finalizeCollectionViewUpdates
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICDocCamThumbnailCollectionViewLayout;
  -[ICDocCamThumbnailCollectionViewLayout finalizeCollectionViewUpdates](&v3, sel_finalizeCollectionViewUpdates);
  -[ICDocCamThumbnailCollectionViewLayout setDeleteIndexPaths:](self, "setDeleteIndexPaths:", 0);
  -[ICDocCamThumbnailCollectionViewLayout setInsertIndexPaths:](self, "setInsertIndexPaths:", 0);
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
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
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)ICDocCamThumbnailCollectionViewLayout;
  -[ICDocCamThumbnailCollectionViewLayout initialLayoutAttributesForAppearingItemAtIndexPath:](&v36, sel_initialLayoutAttributesForAppearingItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamThumbnailCollectionViewLayout insertIndexPaths](self, "insertIndexPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (v7)
  {
    if (!v5)
    {
      -[ICDocCamThumbnailCollectionViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "setAlpha:", 1.0);
    -[ICDocCamThumbnailCollectionViewLayout delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionView:imageSizeAtIndex:", v9, objc_msgSend(v4, "item"));
    v11 = v10;
    v13 = v12;

    -[ICDocCamThumbnailCollectionViewLayout delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "targetViewRect");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    objc_msgSend(MEMORY[0x24BDF6AC8], "dc_aspectFitImageFrameForViewWithFrame:imageSize:", v16, v18, v20, v22, v11, v13);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "superview");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "superview");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICDocCamThumbnailCollectionViewLayout collectionView](self, "collectionView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "convertRect:toView:", v34, v24, v26, v28, v30);
    objc_msgSend(v5, "setFrame:");

  }
  return v5;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  CATransform3D v9;
  CATransform3D v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICDocCamThumbnailCollectionViewLayout;
  -[ICDocCamThumbnailCollectionViewLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](&v11, sel_finalLayoutAttributesForDisappearingItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamThumbnailCollectionViewLayout deleteIndexPaths](self, "deleteIndexPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (v7)
  {
    if (!v5)
    {
      -[ICDocCamThumbnailCollectionViewLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "setAlpha:", 0.0);
    objc_msgSend(v5, "setCenter:", 0.0, 0.0);
    CATransform3DMakeScale(&v10, 0.1, 0.1, 1.0);
    v9 = v10;
    objc_msgSend(v5, "setTransform3D:", &v9);
  }

  return 0;
}

- (id)initialLayoutAttributesForAppearingDecorationElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  double v13;
  double v14;
  _OWORD v16[8];
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICDocCamThumbnailCollectionViewLayout;
  -[ICDocCamThumbnailCollectionViewLayout initialLayoutAttributesForAppearingDecorationElementOfKind:atIndexPath:](&v17, sel_initialLayoutAttributesForAppearingDecorationElementOfKind_atIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("DecorationIdentifier")))
  {
    if (!v8)
    {
      -[ICDocCamThumbnailCollectionViewLayout layoutAttributesForDecorationViewOfKind:atIndexPath:](self, "layoutAttributesForDecorationViewOfKind:atIndexPath:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "setAlpha:", 1.0);
    v9 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    v16[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v16[5] = v9;
    v10 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v16[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v16[7] = v10;
    v11 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    v16[0] = *MEMORY[0x24BDE5598];
    v16[1] = v11;
    v12 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    v16[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    v16[3] = v12;
    objc_msgSend(v8, "setTransform3D:", v16);
    objc_msgSend(v8, "frame");
    v14 = v13;
    objc_msgSend(v8, "frame");
    objc_msgSend(v8, "setFrame:", v14);
  }

  return 0;
}

- (id)finalLayoutAttributesForDisappearingDecorationElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  double v15;
  double v16;
  _OWORD v18[8];
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ICDocCamThumbnailCollectionViewLayout;
  -[ICDocCamThumbnailCollectionViewLayout finalLayoutAttributesForDisappearingDecorationElementOfKind:atIndexPath:](&v19, sel_finalLayoutAttributesForDisappearingDecorationElementOfKind_atIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamThumbnailCollectionViewLayout deleteIndexPaths](self, "deleteIndexPaths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v7);

  if (v10 && objc_msgSend(v6, "isEqualToString:", CFSTR("DecorationIdentifier")))
  {
    if (!v8)
    {
      -[ICDocCamThumbnailCollectionViewLayout layoutAttributesForDecorationViewOfKind:atIndexPath:](self, "layoutAttributesForDecorationViewOfKind:atIndexPath:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "setAlpha:", 0.0);
    v11 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    v18[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v18[5] = v11;
    v12 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v18[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v18[7] = v12;
    v13 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    v18[0] = *MEMORY[0x24BDE5598];
    v18[1] = v13;
    v14 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    v18[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    v18[3] = v14;
    objc_msgSend(v8, "setTransform3D:", v18);
    objc_msgSend(v8, "frame");
    v16 = v15;
    objc_msgSend(v8, "frame");
    objc_msgSend(v8, "setFrame:", v16);
  }

  return v8;
}

- (CGSize)itemSize
{
  double width;
  double height;
  CGSize result;

  width = self->_itemSize.width;
  height = self->_itemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setItemSize:(CGSize)a3
{
  self->_itemSize = a3;
}

- (ICDocCamThumbnailViewLayoutDelegate)delegate
{
  return (ICDocCamThumbnailViewLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)transitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (BOOL)compactLayout
{
  return self->_compactLayout;
}

- (void)setCompactLayout:(BOOL)a3
{
  self->_compactLayout = a3;
}

- (NSDictionary)layoutInfo
{
  return self->_layoutInfo;
}

- (void)setLayoutInfo:(id)a3
{
  objc_storeStrong((id *)&self->_layoutInfo, a3);
}

- (NSMutableArray)deleteIndexPaths
{
  return self->_deleteIndexPaths;
}

- (void)setDeleteIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_deleteIndexPaths, a3);
}

- (NSMutableArray)insertIndexPaths
{
  return self->_insertIndexPaths;
}

- (void)setInsertIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_insertIndexPaths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertIndexPaths, 0);
  objc_storeStrong((id *)&self->_deleteIndexPaths, 0);
  objc_storeStrong((id *)&self->_layoutInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
