@implementation AESceneGroupedTilingLayout

- (AESceneGroupedTilingLayout)initWithDataSource:(id)a3 layoutStyle:(int64_t)a4 gradientTileInfo:(id)a5 orientation:(int64_t)a6
{
  id v11;
  AESceneGroupedTilingLayout *v12;
  objc_super v14;

  v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AESceneGroupedTilingLayout;
  v12 = -[PXAssetsTilingLayout initWithDataSource:](&v14, sel_initWithDataSource_, a3);
  if (v12)
  {
    v12->_sectionBounds = (CGRect *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
    v12->_layoutStyle = a4;
    v12->_portraitOrientation = (unint64_t)(a6 - 1) < 2;
    objc_storeStrong((id *)&v12->__gradientTileLayoutInfo, a5);
    -[PXAssetsTilingLayout setSelectionBadgeOptions:](v12, "setSelectionBadgeOptions:", 1);
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_sectionBounds);
  v3.receiver = self;
  v3.super_class = (Class)AESceneGroupedTilingLayout;
  -[AESceneGroupedTilingLayout dealloc](&v3, sel_dealloc);
}

- (CGRect)contentBounds
{
  CGFloat v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v2 = self->_sectionBounds->origin.x + self->_sectionBounds->size.width;
  -[AESceneGroupedTilingLayout _safeReferenceSize](self, "_safeReferenceSize");
  v4 = v3;
  v5 = 0.0;
  v6 = 0.0;
  v7 = v2;
  result.size.height = v4;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)prepareLayout
{
  void *v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGRect *sectionBounds;
  id v12;

  -[AESceneGroupedTilingLayout _gradientTileLayoutInfo](self, "_gradientTileLayoutInfo");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PXAssetsTilingLayout dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = ceil((double)objc_msgSend(v3, "numberOfItemsInSection:", 0)/ (double)-[AESceneGroupedTilingLayout _thumbnailRowsForCurrentLayoutStyle](self, "_thumbnailRowsForCurrentLayoutStyle"));
  -[AESceneGroupedTilingLayout _safeReferenceSize](self, "_safeReferenceSize");
  v6 = v5;
  -[AESceneGroupedTilingLayout layoutStyle](self, "layoutStyle");
  UIRoundToViewScale();
  v8 = v7;
  objc_msgSend(v12, "tileSystemLayoutSizeFittingSize:");
  self->_cachedGradientOverlaySize.width = v9;
  self->_cachedGradientOverlaySize.height = v10;
  sectionBounds = self->_sectionBounds;
  sectionBounds->origin.x = 0.0;
  sectionBounds->origin.y = 0.0;
  sectionBounds->size.width = (double)(uint64_t)v4 * (v8 + 1.0) + -1.0;
  sectionBounds->size.height = v6;

}

- (int64_t)_thumbnailRowsForCurrentLayoutStyle
{
  AEGridEnvironment *v3;
  double v4;
  void *v5;
  int64_t v6;

  v3 = objc_alloc_init(AEGridEnvironment);
  -[AESceneGroupedTilingLayout _safeReferenceSize](self, "_safeReferenceSize");
  -[AEGridEnvironment setCompactExtensionHeight:](v3, "setCompactExtensionHeight:", v4);
  -[AEGridEnvironment setMinimumTileHeight:](v3, "setMinimumTileHeight:", dbl_21E25A1C0[(unint64_t)(-[AESceneGroupedTilingLayout layoutStyle](self, "layoutStyle") - 1) < 2]);
  +[AEGridConfiguration configurationForEnvironment:](AEGridConfiguration, "configurationForEnvironment:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rowCount");

  return v6;
}

- (void)setReferenceSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  -[PXTilingLayout referenceSize](self, "referenceSize");
  if (v7 != width || v6 != height)
  {
    v9.receiver = self;
    v9.super_class = (Class)AESceneGroupedTilingLayout;
    -[PXTilingLayout setReferenceSize:](&v9, sel_setReferenceSize_, width, height);
    -[PXTilingLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setPortraitOrientation:(BOOL)a3
{
  if (self->_portraitOrientation != a3)
  {
    self->_portraitOrientation = a3;
    -[PXTilingLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setVisibleOrigin:(CGPoint)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AESceneGroupedTilingLayout;
  -[PXTilingLayout setVisibleOrigin:](&v5, sel_setVisibleOrigin_, a3.x, a3.y);
  v4 = objc_alloc_init(MEMORY[0x24BE727B8]);
  objc_msgSend(v4, "invalidateTilesInGroup:", 1111633208);
  -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  id v8;
  objc_super v9;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[PXTilingLayout contentInset](self, "contentInset");
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)AESceneGroupedTilingLayout;
    -[PXTilingLayout setContentInset:](&v9, sel_setContentInset_, top, left, bottom, right);
    v8 = objc_alloc_init(MEMORY[0x24BE727B8]);
    objc_msgSend(v8, "invalidateEverything");
    -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v8);

  }
}

- (void)setProgressSnapshot:(id)a3
{
  AEProgressViewModelSnapshot *v5;
  id v6;
  AEProgressViewModelSnapshot *v7;

  v5 = (AEProgressViewModelSnapshot *)a3;
  if (self->_progressSnapshot != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_progressSnapshot, a3);
    v6 = objc_alloc_init(MEMORY[0x24BE727B8]);
    objc_msgSend(v6, "invalidateAllTiles");
    -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v6);

    v5 = v7;
  }

}

- (void)setSelectedIndexPaths:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[AESceneGroupedTilingLayout _invalidateBadgeDecorations](self, "_invalidateBadgeDecorations");
  v5.receiver = self;
  v5.super_class = (Class)AESceneGroupedTilingLayout;
  -[PXAssetsTilingLayout setSelectedIndexPaths:](&v5, sel_setSelectedIndexPaths_, v4);

}

- (CGSize)_safeReferenceSize
{
  double v3;
  double v4;
  CGSize result;

  -[PXTilingLayout referenceSize](self, "referenceSize");
  -[PXTilingLayout contentInset](self, "contentInset");
  PXEdgeInsetsInsetSize();
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_invalidateBadgeDecorations
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BE727B8]);
  objc_msgSend(v3, "invalidateTilesInGroup:", 855060);
  objc_msgSend(v3, "invalidateTilesInGroup:", 136507);
  -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v3);

}

- (PXTileGeometry)_geometryWithFrame:(SEL)a3 alpha:(CGRect)a4 zPosition:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v13;
  PXTileGeometry *result;
  CGFloat v15;
  CGFloat v16;
  uint64_t v17;
  __int128 v18;
  CGSize v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  *(_OWORD *)&retstr->var8.origin.y = 0u;
  *(_OWORD *)&retstr->var8.size.height = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var7.height = 0u;
  *(_OWORD *)&retstr->var3.tx = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var3.a = 0u;
  *(_OWORD *)&retstr->var3.c = 0u;
  retstr->var1 = 0u;
  retstr->var2 = 0u;
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  v13 = -[PXTilingLayout coordinateSpaceIdentifier](self, "coordinateSpaceIdentifier");
  retstr->var1 = 0u;
  retstr->var2 = 0u;
  *(_OWORD *)&retstr->var3.a = 0u;
  *(_OWORD *)&retstr->var3.c = 0u;
  *(_OWORD *)&retstr->var3.tx = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var7.height = 0u;
  *(_OWORD *)&retstr->var8.origin.y = 0u;
  *(_OWORD *)&retstr->var8.size.height = 0u;
  retstr->var0.origin.x = x;
  retstr->var0.origin.y = y;
  retstr->var0.size.width = width;
  retstr->var0.size.height = height;
  result = (PXTileGeometry *)PXRectGetCenter();
  retstr->var1.x = v15;
  retstr->var1.y = v16;
  retstr->var2.width = width;
  retstr->var2.height = height;
  v17 = MEMORY[0x24BDBD8B8];
  v18 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->var3.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->var3.c = v18;
  *(_OWORD *)&retstr->var3.tx = *(_OWORD *)(v17 + 32);
  retstr->var6 = 0;
  retstr->var7 = retstr->var2;
  v19 = *(CGSize *)(MEMORY[0x24BE72850] + 16);
  retstr->var8.origin = (CGPoint)*MEMORY[0x24BE72850];
  retstr->var8.size = v19;
  retstr->var9 = v13;
  retstr->var4 = a5;
  retstr->var5 = a6;
  return result;
}

- (CGPoint)_boundedVisibleOrigin
{
  double v2;
  double v3;
  CGPoint result;

  -[PXTilingLayout visibleOrigin](self, "visibleOrigin");
  if (v2 < 0.0)
    v2 = 0.0;
  if (v3 < 0.0)
    v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  void (*v26)(_QWORD *, __int128 *, __int128 *, uint64_t, _QWORD, _BYTE *);
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(_QWORD *, __int128 *, __int128 *, uint64_t, _QWORD, _BYTE *);
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  AEGridOverlayConfiguration *v60;
  void (*v61)(_QWORD *, __int128 *, __int128 *, uint64_t, AEGridOverlayConfiguration *, _BYTE *);
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  void *v77;
  _QWORD *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[48];
  __int128 v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _OWORD v105[4];
  _BYTE v106[17];
  CGRect v107;
  CGRect v108;
  CGRect v109;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v78 = a5;
  -[PXAssetsTilingLayout dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "identifier");

  v77 = -[PXTilingLayout coordinateSpaceIdentifier](self, "coordinateSpaceIdentifier");
  v106[0] = 0;
  v71 = v11;
  objc_msgSend(v11, "tileGroups");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v108.origin.x = x;
  v108.origin.y = y;
  v108.size.width = width;
  v108.size.height = height;
  if (CGRectIntersectsRect(*self->_sectionBounds, v108))
  {
    -[PXAssetsTilingLayout dataSource](self, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "numberOfItemsInSection:", 0);

    if (v16 >= 1)
    {
      v65 = *MEMORY[0x24BE727F0];
      v17 = 1;
      v62 = xmmword_21E25A1E0;
      v68 = width;
      v69 = height;
      v66 = x;
      v67 = y;
      v70 = v16;
      do
      {
        -[AESceneGroupedTilingLayout _frameForGridTile:inSection:](self, "_frameForGridTile:inSection:", v17 - 1, 0, v62);
        v18 = v107.origin.x;
        v19 = v107.origin.y;
        v20 = v107.size.width;
        v21 = v107.size.height;
        v109.origin.x = x;
        v109.origin.y = y;
        v109.size.width = width;
        v109.size.height = height;
        if (CGRectIntersectsRect(v107, v109))
        {
          memset(v105, 0, sizeof(v105));
          v103 = 0u;
          v104 = 0u;
          v101 = 0u;
          v102 = 0u;
          v99 = 0u;
          v100 = 0u;
          *(double *)&v97 = v18;
          *((double *)&v97 + 1) = v19;
          *(double *)&v98 = v20;
          *((double *)&v98 + 1) = v21;
          PXRectGetCenter();
          *(_QWORD *)&v99 = v22;
          *((_QWORD *)&v99 + 1) = v23;
          *(double *)&v100 = v20;
          *((double *)&v100 + 1) = v21;
          v24 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
          v76 = *MEMORY[0x24BDBD8B8];
          v101 = *MEMORY[0x24BDBD8B8];
          v102 = v24;
          v73 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
          v74 = v24;
          v103 = v73;
          v104 = xmmword_21E25A1D0;
          *(_OWORD *)((char *)v105 + 8) = v100;
          v25 = *(_OWORD *)(MEMORY[0x24BE72850] + 16);
          v75 = *MEMORY[0x24BE72850];
          *(_OWORD *)((char *)&v105[1] + 8) = *MEMORY[0x24BE72850];
          *(_OWORD *)((char *)&v105[2] + 8) = v25;
          v72 = v25;
          *((_QWORD *)&v105[3] + 1) = v77;
          if (!v14 || objc_msgSend(v14, "containsIndex:", 66059))
          {
            v26 = (void (*)(_QWORD *, __int128 *, __int128 *, uint64_t, _QWORD, _BYTE *))v78[2];
            *(_QWORD *)&v89 = 5;
            *((_QWORD *)&v89 + 1) = v65;
            v90 = v13;
            v91 = 0;
            v92 = v17 - 1;
            v93 = 0x7FFFFFFFFFFFFFFFLL;
            v94 = 0u;
            v95 = 0u;
            v96 = 0;
            v87 = v105[0];
            *(_OWORD *)v88 = v105[1];
            *(_OWORD *)&v88[16] = v105[2];
            *(_OWORD *)&v88[32] = v105[3];
            v83 = v101;
            v84 = v102;
            v85 = v103;
            v86 = v104;
            v79 = v97;
            v80 = v98;
            v81 = v99;
            v82 = v100;
            v26(v78, &v89, &v79, 66059, 0, v106);
            if (!v14)
              goto LABEL_9;
          }
          if (objc_msgSend(v14, "containsIndex:", 855060))
          {
LABEL_9:
            -[AESceneGroupedTilingLayout progressSnapshot](self, "progressSnapshot");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v79 = (unint64_t)v13;
            *(_QWORD *)&v80 = v17 - 1;
            *((_QWORD *)&v80 + 1) = 0x7FFFFFFFFFFFFFFFLL;
            v28 = objc_msgSend(v27, "hasProgressForIndexPath:", &v79);

            if (v28)
            {
              -[AESceneGroupedTilingLayout _progressFrameForGridTileFrame:](self, "_progressFrameForGridTileFrame:", v18, v19, v20, v21);
              v30 = v29;
              v32 = v31;
              v34 = v33;
              v36 = v35;
              PXRectGetCenter();
              v63 = v38;
              v64 = v37;
              -[AESceneGroupedTilingLayout _zPositionForDecorativeTileSubitem:](self, "_zPositionForDecorativeTileSubitem:", 5);
              v39 = (void (*)(_QWORD *, __int128 *, __int128 *, uint64_t, _QWORD, _BYTE *))v78[2];
              v89 = v62;
              v90 = v13;
              v91 = 0;
              v92 = v17 - 1;
              v93 = 0x7FFFFFFFFFFFFFFFLL;
              v94 = 0u;
              v95 = 0u;
              v96 = 0;
              *(_QWORD *)&v79 = v30;
              *((_QWORD *)&v79 + 1) = v32;
              width = v68;
              height = v69;
              *(_QWORD *)&v80 = v34;
              *((_QWORD *)&v80 + 1) = v36;
              *(_QWORD *)&v81 = v64;
              *((_QWORD *)&v81 + 1) = v63;
              *(_QWORD *)&v82 = v34;
              *((_QWORD *)&v82 + 1) = v36;
              v83 = v76;
              v84 = v74;
              v85 = v73;
              *(_QWORD *)&v86 = 0x3FF0000000000000;
              *((_QWORD *)&v86 + 1) = v40;
              *(_QWORD *)&v87 = 0;
              *((_QWORD *)&v87 + 1) = v34;
              *(_QWORD *)v88 = v36;
              x = v66;
              y = v67;
              *(_OWORD *)&v88[8] = v75;
              *(_OWORD *)&v88[24] = v72;
              *(_QWORD *)&v88[40] = v77;
              v39(v78, &v89, &v79, 855060, 0, v106);
            }
          }
          v79 = (unint64_t)v13;
          *(_QWORD *)&v80 = v17 - 1;
          *((_QWORD *)&v80 + 1) = 0x7FFFFFFFFFFFFFFFLL;
          -[PXAssetsTilingLayout enumerateAccessoryTilesForContentTileWithIndexPath:geometry:withOptions:usingBlock:](self, "enumerateAccessoryTilesForContentTileWithIndexPath:geometry:withOptions:usingBlock:", &v79, &v97, v71, v78);
          -[AESceneGroupedTilingLayout delegate](self, "delegate");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = (unint64_t)v13;
          *(_QWORD *)&v80 = v17 - 1;
          *((_QWORD *)&v80 + 1) = 0x7FFFFFFFFFFFFFFFLL;
          v42 = objc_msgSend(v41, "layout:shouldShowVideoDecorationAtIndexPath:", self, &v79);
          v79 = (unint64_t)v13;
          *(_QWORD *)&v80 = v17 - 1;
          *((_QWORD *)&v80 + 1) = 0x7FFFFFFFFFFFFFFFLL;
          v43 = objc_msgSend(v41, "layout:shouldShowCloudDecorationAtIndexPath:", self, &v79);
          v79 = (unint64_t)v13;
          *(_QWORD *)&v80 = v17 - 1;
          *((_QWORD *)&v80 + 1) = 0x7FFFFFFFFFFFFFFFLL;
          v44 = objc_msgSend(v41, "layout:shouldShowLoopDecorationAtIndexPath:", self, &v79);
          v45 = v44;
          if ((v43 & 1) != 0 || (v42 & 1) != 0 || (_DWORD)v44)
          {
            -[AESceneGroupedTilingLayout _gradientShadowFrameForItemFrame:](self, "_gradientShadowFrameForItemFrame:", v18, v19, v20, v21);
            v47 = v46;
            v49 = v48;
            v51 = v50;
            v53 = v52;
            PXRectGetCenter();
            v55 = v54;
            v57 = v56;
            -[AESceneGroupedTilingLayout _zPositionForDecorativeTileSubitem:](self, "_zPositionForDecorativeTileSubitem:", 5);
            v59 = v58;
            v60 = -[AEGridOverlayConfiguration initWithShowCloudDecoration:showVideoDecoration:showLoopDecoration:]([AEGridOverlayConfiguration alloc], "initWithShowCloudDecoration:showVideoDecoration:showLoopDecoration:", v43, v42, v45);
            v61 = (void (*)(_QWORD *, __int128 *, __int128 *, uint64_t, AEGridOverlayConfiguration *, _BYTE *))v78[2];
            v89 = xmmword_21E25A1F0;
            v90 = v13;
            v91 = 0;
            v92 = v17 - 1;
            v93 = 5;
            v94 = 0u;
            v95 = 0u;
            v96 = 0;
            *(_QWORD *)&v79 = v47;
            *((_QWORD *)&v79 + 1) = v49;
            width = v68;
            height = v69;
            *(_QWORD *)&v80 = v51;
            *((_QWORD *)&v80 + 1) = v53;
            *(_QWORD *)&v81 = v55;
            *((_QWORD *)&v81 + 1) = v57;
            *(_QWORD *)&v82 = v51;
            *((_QWORD *)&v82 + 1) = v53;
            v83 = v76;
            v84 = v74;
            v85 = v73;
            *(_QWORD *)&v86 = 0x3FF0000000000000;
            *((_QWORD *)&v86 + 1) = v59;
            *(_QWORD *)&v87 = 0;
            *((_QWORD *)&v87 + 1) = v51;
            *(_QWORD *)v88 = v53;
            x = v66;
            y = v67;
            *(_OWORD *)&v88[8] = v75;
            *(_OWORD *)&v88[24] = v72;
            *(_QWORD *)&v88[40] = v77;
            v61(v78, &v89, &v79, 136507, v60, v106);

          }
          v16 = v70;
        }
        if (v17 >= v16)
          break;
        ++v17;
      }
      while (!v106[0]);
    }
  }

}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  unint64_t v11;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  AEGridOverlayConfiguration *v24;
  double v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  CGSize v60;
  CGSize v61;
  BOOL v62;
  CGSize v63;
  CGSize v64;
  unsigned int v66;
  unint64_t *v67;
  objc_super v68;
  CGPoint v69;
  CGSize v70;
  CGPoint v71;
  CGSize v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;

  v11 = a6->var1[0];
  if (a6->var0 == 5 && v11 == *MEMORY[0x24BE727F0])
  {
    v13 = a6->var1[1];
    -[PXAssetsTilingLayout dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "identifier");

    if (v13 == v15)
    {
      -[AESceneGroupedTilingLayout _frameForGridTile:inSection:](self, "_frameForGridTile:inSection:", a6->var1[3], a6->var1[2]);
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v24 = 0;
      v25 = 0.0;
      v26 = 66059;
      if (!a3)
        goto LABEL_19;
      goto LABEL_18;
    }
    v11 = a6->var1[0];
  }
  if (v11 != 795209731)
  {
    if (v11 != 112112321)
    {
LABEL_26:
      v68.receiver = self;
      v68.super_class = (Class)AESceneGroupedTilingLayout;
      v63 = *(CGSize *)&a6->var1[5];
      v71 = *(CGPoint *)&a6->var1[3];
      v72 = v63;
      v73 = *(_OWORD *)&a6->var1[7];
      *(_QWORD *)&v74 = a6->var1[9];
      v64 = *(CGSize *)&a6->var1[1];
      v69 = *(CGPoint *)&a6->var0;
      v70 = v64;
      v62 = -[PXAssetsTilingLayout getGeometry:group:userData:forTileWithIdentifier:](&v68, sel_getGeometry_group_userData_forTileWithIdentifier_, a3, a4, a5, &v69);
      v24 = 0;
      goto LABEL_27;
    }
    v27 = a6->var1[1];
    v28 = a6->var1[2];
    v29 = a6->var1[3];
    v30 = a6->var1[4];
    -[AESceneGroupedTilingLayout progressSnapshot](self, "progressSnapshot");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v69.x = v27;
    *(_QWORD *)&v69.y = v28;
    *(_QWORD *)&v70.width = v29;
    *(_QWORD *)&v70.height = v30;
    if (objc_msgSend(v31, "hasProgressForIndexPath:", &v69))
    {
      -[AESceneGroupedTilingLayout _frameForGridTile:inSection:](self, "_frameForGridTile:inSection:", v29, v28);
      -[AESceneGroupedTilingLayout _progressFrameForGridTileFrame:](self, "_progressFrameForGridTileFrame:");
      v17 = v32;
      v19 = v33;
      v21 = v34;
      v23 = v35;
      -[AESceneGroupedTilingLayout _zPositionForDecorativeTileSubitem:](self, "_zPositionForDecorativeTileSubitem:", 5);
      v25 = v36;

      v24 = 0;
      v26 = 855060;
      if (!a3)
        goto LABEL_19;
      goto LABEL_18;
    }
LABEL_25:

    goto LABEL_26;
  }
  v67 = a4;
  v37 = a6->var1[3];
  v38 = a6->var1[4];
  v39 = a6->var1[2];
  -[AESceneGroupedTilingLayout _frameForGridTile:inSection:](self, "_frameForGridTile:inSection:", v37, v39);
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v48 = a6->var1[1];
  -[AESceneGroupedTilingLayout delegate](self, "delegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v69.x = v48;
  *(_QWORD *)&v69.y = v39;
  *(_QWORD *)&v70.width = v37;
  v70.height = NAN;
  v66 = objc_msgSend(v31, "layout:shouldShowVideoDecorationAtIndexPath:", self, &v69);
  *(_QWORD *)&v69.x = v48;
  *(_QWORD *)&v69.y = v39;
  *(_QWORD *)&v70.width = v37;
  v70.height = NAN;
  v49 = objc_msgSend(v31, "layout:shouldShowCloudDecorationAtIndexPath:", self, &v69);
  *(_QWORD *)&v69.x = v48;
  *(_QWORD *)&v69.y = v39;
  *(_QWORD *)&v70.width = v37;
  v70.height = NAN;
  v50 = objc_msgSend(v31, "layout:shouldShowLoopDecorationAtIndexPath:", self, &v69);
  -[AESceneGroupedTilingLayout _zPositionForDecorativeTileSubitem:](self, "_zPositionForDecorativeTileSubitem:", v38);
  if (v38 != 5 || !(v49 | v66))
  {
    a4 = v67;
    goto LABEL_25;
  }
  v25 = v51;
  -[AESceneGroupedTilingLayout _gradientShadowFrameForItemFrame:](self, "_gradientShadowFrameForItemFrame:", v41, v43, v45, v47);
  v17 = v52;
  v19 = v53;
  v21 = v54;
  v23 = v55;
  v24 = -[AEGridOverlayConfiguration initWithShowCloudDecoration:showVideoDecoration:showLoopDecoration:]([AEGridOverlayConfiguration alloc], "initWithShowCloudDecoration:showVideoDecoration:showLoopDecoration:", v49, v66, v50);

  v26 = 136507;
  a4 = v67;
  if (a3)
  {
LABEL_18:
    -[AESceneGroupedTilingLayout _geometryWithFrame:alpha:zPosition:](self, "_geometryWithFrame:alpha:zPosition:", v17, v19, v21, v23, 1.0, v25);
    v56 = v78;
    *(_OWORD *)&a3->var6 = v77;
    *(_OWORD *)&a3->var7.height = v56;
    v57 = v80;
    *(_OWORD *)&a3->var8.origin.y = v79;
    *(_OWORD *)&a3->var8.size.height = v57;
    v58 = v74;
    *(_OWORD *)&a3->var3.a = v73;
    *(_OWORD *)&a3->var3.c = v58;
    v59 = v76;
    *(_OWORD *)&a3->var3.tx = v75;
    *(_OWORD *)&a3->var4 = v59;
    v60 = v70;
    a3->var0.origin = v69;
    a3->var0.size = v60;
    v61 = v72;
    a3->var1 = v71;
    a3->var2 = v61;
  }
LABEL_19:
  if (a4)
    *a4 = v26;
  if (a5)
  {
    v24 = objc_retainAutorelease(v24);
    *a5 = v24;
  }
  v62 = 1;
LABEL_27:

  return v62;
}

- (double)_zPositionForDecorativeTileSubitem:(unint64_t)a3
{
  double result;

  if (a3 == 5)
    return 1.0;
  result = 0.0;
  if (a3 == 6)
    abort();
  return result;
}

- (CGRect)_gradientShadowFrameForItemFrame:(CGRect)result
{
  double v3;
  double height;

  v3 = result.origin.y + result.size.height - self->_cachedGradientOverlaySize.height;
  height = self->_cachedGradientOverlaySize.height;
  result.size.height = height;
  result.origin.y = v3;
  return result;
}

- (CGRect)_frameForGridTile:(int64_t)a3 inSection:(int64_t)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[AESceneGroupedTilingLayout _thumbnailRowsForCurrentLayoutStyle](self, "_thumbnailRowsForCurrentLayoutStyle", a3, a4);
  -[AESceneGroupedTilingLayout _safeReferenceSize](self, "_safeReferenceSize");
  -[AESceneGroupedTilingLayout layoutStyle](self, "layoutStyle");
  UIRoundToViewScale();
  v6 = v5;
  UIRoundToViewScale();
  v8 = v7;
  UIRoundToViewScale();
  v10 = v9;
  v11 = v8;
  v12 = v6;
  v13 = v6;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v10;
  result.origin.x = v11;
  return result;
}

- (CGRect)_progressFrameForGridTileFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CGRectGetMaxX(a3);
  UIRoundToViewScale();
  v8 = v7;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  CGRectGetMaxY(v14);
  UIRoundToViewScale();
  v10 = v9;
  v11 = 26.0;
  v12 = 26.0;
  v13 = v8;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v13;
  return result;
}

- (AEProgressViewModelSnapshot)progressSnapshot
{
  return self->_progressSnapshot;
}

- (AEBrowserLayoutDelegate)delegate
{
  return (AEBrowserLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (BOOL)isPortraitOrientation
{
  return self->_portraitOrientation;
}

- (AETileLayoutInfo)_gradientTileLayoutInfo
{
  return self->__gradientTileLayoutInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__gradientTileLayoutInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progressSnapshot, 0);
}

- (AESceneGroupedTilingLayout)initWithDataSource:(id)a3 layoutStyle:(int64_t)a4 orientation:(int64_t)a5
{
  id v8;
  void *v9;
  AESceneGroupedTilingLayout *v10;

  v8 = a3;
  +[AEGridOverlayView gridOverlayLayoutInfo](AEGridOverlayView, "gridOverlayLayoutInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AESceneGroupedTilingLayout initWithDataSource:layoutStyle:gradientTileInfo:orientation:](self, "initWithDataSource:layoutStyle:gradientTileInfo:orientation:", v8, a4, v9, a5);

  return v10;
}

@end
