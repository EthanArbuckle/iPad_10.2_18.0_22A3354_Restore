@implementation AEMessagesShelfLayout

- (void)dealloc
{
  CGRect *itemFramesForCurrentDataSource;
  objc_super v4;

  itemFramesForCurrentDataSource = self->_itemFramesForCurrentDataSource;
  if (itemFramesForCurrentDataSource)
  {
    free(itemFramesForCurrentDataSource);
    self->_itemFramesForCurrentDataSource = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AEMessagesShelfLayout;
  -[AEMessagesShelfLayout dealloc](&v4, sel_dealloc);
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
    v9.super_class = (Class)AEMessagesShelfLayout;
    -[PXTilingLayout setReferenceSize:](&v9, sel_setReferenceSize_, width, height);
    -[PXTilingLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (CGRect)contentBounds
{
  double currentContentWidth;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  currentContentWidth = self->_currentContentWidth;
  -[PXTilingLayout referenceSize](self, "referenceSize");
  v4 = v3;
  v5 = 0.0;
  v6 = 0.0;
  v7 = currentContentWidth;
  result.size.height = v4;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double x;
  double y;
  double width;
  double height;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(_QWORD *, __int128 *, __int128 *, _QWORD, _QWORD, _BYTE *);
  void *v26;
  int v27;
  uint64_t v28;
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
  uint64_t v39;
  void (*v40)(_QWORD *, __int128 *, __int128 *, _QWORD, _QWORD, _BYTE *);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(_QWORD *, __int128 *, __int128 *, _QWORD, void *, _BYTE *);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(_QWORD *, __int128 *, __int128 *, _QWORD, _QWORD, _BYTE *);
  void *v71;
  int v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(_QWORD *, __int128 *, __int128 *, _QWORD, _QWORD, _BYTE *);
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void (*v101)(_QWORD *, __int128 *, __int128 *, uint64_t, _QWORD, _BYTE *);
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void (*v107)(_QWORD *, __int128 *, __int128 *, uint64_t, _QWORD, _BYTE *);
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void (*v121)(_QWORD *, __int128 *, __int128 *, _QWORD, _QWORD, _BYTE *);
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void (*v137)(_QWORD *, __int128 *, __int128 *, uint64_t, _QWORD, _BYTE *);
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void (*v153)(_QWORD *, __int128 *, __int128 *, uint64_t, _QWORD, _BYTE *);
  uint64_t v154;
  void *v155;
  uint64_t v156;
  int v157;
  __int128 v158;
  int v159;
  uint64_t v160;
  int v161;
  id v162;
  _QWORD *v163;
  double v165;
  double v166;
  void *v167;
  void *v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  _BYTE v183[48];
  __int128 v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  _QWORD v188[6];
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  _OWORD v197[4];
  _BYTE v198[17];
  CGRect v199;

  v162 = a4;
  v7 = a5;
  -[PXAssetsTilingLayout dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "identifier");

  v10 = -[PXTilingLayout coordinateSpaceIdentifier](self, "coordinateSpaceIdentifier");
  -[AEMessagesShelfLayout delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = objc_msgSend(v11, "layoutShouldShowVideoDuration:", self);
  v167 = v11;
  v161 = objc_msgSend(v11, "layoutShouldShowCancelButtons:", self);
  v198[0] = 0;
  -[PXAssetsTilingLayout dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "numberOfSections");

  if (v13 >= 1)
  {
    v14 = 0;
    v160 = *MEMORY[0x24BE727F0];
    v158 = xmmword_21E25A200;
    v168 = v10;
    v163 = v7;
    do
    {
      -[PXAssetsTilingLayout dataSource](self, "dataSource", v158);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "numberOfItemsInSection:", v14);

      if (v16 >= 1 && !v198[0])
      {
        v17 = 1;
        do
        {
          *(_QWORD *)&v189 = v9;
          *((_QWORD *)&v189 + 1) = v14;
          *(_QWORD *)&v190 = v17 - 1;
          *((_QWORD *)&v190 + 1) = 0x7FFFFFFFFFFFFFFFLL;
          -[AEMessagesShelfLayout _frameForGridItemAtIndexPath:](self, "_frameForGridItemAtIndexPath:", &v189);
          x = v199.origin.x;
          y = v199.origin.y;
          width = v199.size.width;
          height = v199.size.height;
          if (CGRectIntersectsRect(v199, a3))
          {
            memset(v197, 0, sizeof(v197));
            v195 = 0u;
            v196 = 0u;
            v193 = 0u;
            v194 = 0u;
            v191 = 0u;
            v192 = 0u;
            *(double *)&v189 = x;
            *((double *)&v189 + 1) = y;
            *(double *)&v190 = width;
            *((double *)&v190 + 1) = height;
            PXRectGetCenter();
            *(_QWORD *)&v191 = v22;
            *((_QWORD *)&v191 + 1) = v23;
            *(double *)&v192 = width;
            *((double *)&v192 + 1) = height;
            v172 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
            v173 = *MEMORY[0x24BDBD8B8];
            v193 = *MEMORY[0x24BDBD8B8];
            v194 = v172;
            v171 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
            v195 = v171;
            LOBYTE(v197[0]) = 0;
            v196 = xmmword_21E25A1D0;
            *(_OWORD *)((char *)v197 + 8) = v192;
            v169 = *(_OWORD *)(MEMORY[0x24BE72850] + 16);
            v170 = *MEMORY[0x24BE72850];
            *(_OWORD *)((char *)&v197[1] + 8) = *MEMORY[0x24BE72850];
            *(_OWORD *)((char *)&v197[2] + 8) = v169;
            *((_QWORD *)&v197[3] + 1) = v168;
            *(_QWORD *)&v174 = v9;
            *((_QWORD *)&v174 + 1) = v14;
            *(_QWORD *)&v175 = v17 - 1;
            *((_QWORD *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
            -[AEMessagesShelfLayout _zPositionForShelfTileKind:atIndexPath:](self, "_zPositionForShelfTileKind:atIndexPath:", v160, &v174);
            *((_QWORD *)&v196 + 1) = v24;
            v25 = (void (*)(_QWORD *, __int128 *, __int128 *, _QWORD, _QWORD, _BYTE *))v7[2];
            *(_QWORD *)&v184 = 5;
            *((_QWORD *)&v184 + 1) = v160;
            v185 = v9;
            v186 = v14;
            v187 = v17 - 1;
            v188[0] = 0x7FFFFFFFFFFFFFFFLL;
            memset(&v188[1], 0, 40);
            v182 = v197[0];
            *(_OWORD *)v183 = v197[1];
            *(_OWORD *)&v183[16] = v197[2];
            *(_OWORD *)&v183[32] = v197[3];
            v178 = v193;
            v179 = v194;
            v180 = v195;
            v181 = v196;
            v174 = v189;
            v175 = v190;
            v26 = v168;
            v176 = v191;
            v177 = v192;
            v25(v7, &v184, &v174, 0, 0, v198);
            *(_QWORD *)&v174 = v9;
            *((_QWORD *)&v174 + 1) = v14;
            *(_QWORD *)&v175 = v17 - 1;
            *((_QWORD *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
            v27 = objc_msgSend(v167, "layout:itemAtIndexPathIsVideo:", self, &v174);
            v165 = y;
            v166 = x;
            if (v27)
            {
              -[AEMessagesShelfLayout _videoBadgeFrameForItemFrame:](self, "_videoBadgeFrameForItemFrame:", x, y, width, height);
              v29 = v28;
              v31 = v30;
              v33 = v32;
              v35 = v34;
              PXRectGetCenter();
              v37 = v36;
              v39 = v38;
              *(_QWORD *)&v174 = v9;
              *((_QWORD *)&v174 + 1) = v14;
              *(_QWORD *)&v175 = v17 - 1;
              *((_QWORD *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
              -[AEMessagesShelfLayout _zPositionForShelfTileKind:atIndexPath:](self, "_zPositionForShelfTileKind:atIndexPath:", 1500001336, &v174);
              v40 = (void (*)(_QWORD *, __int128 *, __int128 *, _QWORD, _QWORD, _BYTE *))v7[2];
              v184 = xmmword_21E25A1F0;
              v185 = v9;
              v186 = v14;
              v187 = v17 - 1;
              memset(v188, 0, sizeof(v188));
              *(_QWORD *)&v174 = v29;
              *((_QWORD *)&v174 + 1) = v31;
              *(_QWORD *)&v175 = v33;
              *((_QWORD *)&v175 + 1) = v35;
              *(_QWORD *)&v176 = v37;
              *((_QWORD *)&v176 + 1) = v39;
              *(_QWORD *)&v177 = v33;
              *((_QWORD *)&v177 + 1) = v35;
              v178 = v173;
              v179 = v172;
              v180 = v171;
              *(_QWORD *)&v181 = 0x3FF0000000000000;
              *((_QWORD *)&v181 + 1) = v41;
              *(_QWORD *)&v182 = 0;
              *((_QWORD *)&v182 + 1) = v33;
              *(_QWORD *)v183 = v35;
              y = v165;
              x = v166;
              *(_OWORD *)&v183[8] = v170;
              *(_OWORD *)&v183[24] = v169;
              *(_QWORD *)&v183[40] = v168;
              v40(v7, &v184, &v174, 0, 0, v198);
              if (v159)
              {
                -[AEMessagesShelfLayout _videoDurationFrameForItemFrame:](self, "_videoDurationFrameForItemFrame:", v166, v165, width, height);
                v43 = v42;
                v45 = v44;
                v47 = v46;
                v49 = v48;
                v50 = (void *)MEMORY[0x24BDD16E0];
                *(_QWORD *)&v174 = v9;
                *((_QWORD *)&v174 + 1) = v14;
                *(_QWORD *)&v175 = v17 - 1;
                *((_QWORD *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
                objc_msgSend(v167, "layout:itemAtIndexPathDuration:", self, &v174);
                objc_msgSend(v50, "numberWithDouble:");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                PXRectGetCenter();
                v53 = v52;
                v55 = v54;
                *(_QWORD *)&v174 = v9;
                *((_QWORD *)&v174 + 1) = v14;
                *(_QWORD *)&v175 = v17 - 1;
                *((_QWORD *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
                -[AEMessagesShelfLayout _zPositionForShelfTileKind:atIndexPath:](self, "_zPositionForShelfTileKind:atIndexPath:", 1215219281, &v174);
                v56 = (void (*)(_QWORD *, __int128 *, __int128 *, _QWORD, void *, _BYTE *))v7[2];
                v184 = v158;
                v185 = v9;
                v186 = v14;
                v187 = v17 - 1;
                v188[0] = 0x7FFFFFFFFFFFFFFFLL;
                memset(&v188[1], 0, 40);
                *(_QWORD *)&v174 = v43;
                *((_QWORD *)&v174 + 1) = v45;
                *(_QWORD *)&v175 = v47;
                *((_QWORD *)&v175 + 1) = v49;
                *(_QWORD *)&v176 = v53;
                *((_QWORD *)&v176 + 1) = v55;
                *(_QWORD *)&v177 = v47;
                *((_QWORD *)&v177 + 1) = v49;
                v178 = v173;
                v179 = v172;
                v180 = v171;
                *(_QWORD *)&v181 = 0x3FF0000000000000;
                *((_QWORD *)&v181 + 1) = v57;
                *(_QWORD *)&v182 = 0;
                *((_QWORD *)&v182 + 1) = v47;
                *(_QWORD *)v183 = v49;
                y = v165;
                x = v166;
                *(_OWORD *)&v183[8] = v170;
                *(_OWORD *)&v183[24] = v169;
                *(_QWORD *)&v183[40] = v168;
                v56(v7, &v184, &v174, 0, v51, v198);

                v26 = v168;
              }
            }
            if (enumerateTilesInRect_withOptions_usingBlock__onceToken != -1)
              dispatch_once(&enumerateTilesInRect_withOptions_usingBlock__onceToken, &__block_literal_global_639);
            if (enumerateTilesInRect_withOptions_usingBlock__canShowLoopBadges
              && (*(_QWORD *)&v174 = v9,
                  *((_QWORD *)&v174 + 1) = v14,
                  *(_QWORD *)&v175 = v17 - 1,
                  *((_QWORD *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL,
                  objc_msgSend(v167, "layout:itemAtIndexPathIsLoop:", self, &v174)))
            {
              -[AEMessagesShelfLayout _loopBadgeFrameForItemFrame:](self, "_loopBadgeFrameForItemFrame:", x, y, width, height);
              v59 = v58;
              v61 = v60;
              v63 = v62;
              v65 = v64;
              PXRectGetCenter();
              v67 = v66;
              v69 = v68;
              *(_QWORD *)&v174 = v9;
              *((_QWORD *)&v174 + 1) = v14;
              *(_QWORD *)&v175 = v17 - 1;
              *((_QWORD *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
              -[AEMessagesShelfLayout _zPositionForShelfTileKind:atIndexPath:](self, "_zPositionForShelfTileKind:atIndexPath:", 1500001337, &v174);
              v70 = (void (*)(_QWORD *, __int128 *, __int128 *, _QWORD, _QWORD, _BYTE *))v7[2];
              v184 = xmmword_21E25A1F0;
              v185 = v9;
              v186 = v14;
              v71 = v26;
              v72 = 1;
              v187 = v17 - 1;
              v188[0] = 1;
              memset(&v188[1], 0, 40);
              *(_QWORD *)&v174 = v59;
              *((_QWORD *)&v174 + 1) = v61;
              *(_QWORD *)&v175 = v63;
              *((_QWORD *)&v175 + 1) = v65;
              *(_QWORD *)&v176 = v67;
              *((_QWORD *)&v176 + 1) = v69;
              *(_QWORD *)&v177 = v63;
              *((_QWORD *)&v177 + 1) = v65;
              v178 = v173;
              v179 = v172;
              v180 = v171;
              *(_QWORD *)&v181 = 0x3FF0000000000000;
              *((_QWORD *)&v181 + 1) = v73;
              *(_QWORD *)&v182 = 0;
              *((_QWORD *)&v182 + 1) = v63;
              *(_QWORD *)v183 = v65;
              y = v165;
              x = v166;
              *(_OWORD *)&v183[8] = v170;
              *(_OWORD *)&v183[24] = v169;
              *(_QWORD *)&v183[40] = v71;
              v70(v7, &v184, &v174, 0, 0, v198);
            }
            else
            {
              v72 = 0;
            }
            *(_QWORD *)&v174 = v9;
            *((_QWORD *)&v174 + 1) = v14;
            *(_QWORD *)&v175 = v17 - 1;
            *((_QWORD *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
            v74 = objc_msgSend(v167, "layout:itemAtIndexPathIsSpatial:", self, &v174);
            if (v74)
            {
              -[AEMessagesShelfLayout _spatialBadgeFrameForItemFrame:](self, "_spatialBadgeFrameForItemFrame:", x, y, width, height);
              v76 = v75;
              v78 = v77;
              v80 = v79;
              v82 = v81;
              PXRectGetCenter();
              v84 = v83;
              v86 = v85;
              *(_QWORD *)&v174 = v9;
              *((_QWORD *)&v174 + 1) = v14;
              *(_QWORD *)&v175 = v17 - 1;
              *((_QWORD *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
              -[AEMessagesShelfLayout _zPositionForShelfTileKind:atIndexPath:](self, "_zPositionForShelfTileKind:atIndexPath:", 1500001338, &v174);
              v87 = (void (*)(_QWORD *, __int128 *, __int128 *, _QWORD, _QWORD, _BYTE *))v163[2];
              v184 = xmmword_21E25A1F0;
              v185 = v9;
              v186 = v14;
              v187 = v17 - 1;
              v188[0] = 7;
              memset(&v188[1], 0, 40);
              *(_QWORD *)&v174 = v76;
              *((_QWORD *)&v174 + 1) = v78;
              *(_QWORD *)&v175 = v80;
              *((_QWORD *)&v175 + 1) = v82;
              *(_QWORD *)&v176 = v84;
              *((_QWORD *)&v176 + 1) = v86;
              *(_QWORD *)&v177 = v80;
              *((_QWORD *)&v177 + 1) = v82;
              v178 = v173;
              v179 = v172;
              v180 = v171;
              *(_QWORD *)&v181 = 0x3FF0000000000000;
              *((_QWORD *)&v181 + 1) = v88;
              *(_QWORD *)&v182 = 0;
              *((_QWORD *)&v182 + 1) = v80;
              *(_QWORD *)v183 = v82;
              y = v165;
              x = v166;
              *(_OWORD *)&v183[8] = v170;
              *(_OWORD *)&v183[24] = v169;
              *(_QWORD *)&v183[40] = v168;
              v87(v163, &v184, &v174, 0, 0, v198);
            }
            *(_QWORD *)&v174 = v9;
            *((_QWORD *)&v174 + 1) = v14;
            *(_QWORD *)&v175 = v17 - 1;
            *((_QWORD *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
            v7 = v163;
            -[PXAssetsTilingLayout enumerateAccessoryTilesForContentTileWithIndexPath:geometry:withOptions:usingBlock:](self, "enumerateAccessoryTilesForContentTileWithIndexPath:geometry:withOptions:usingBlock:", &v174, &v189, v162, v163);
            if ((v27 | v72) == 1)
            {
              -[AEMessagesShelfLayout _gradientShadowFrameForItemFrame:](self, "_gradientShadowFrameForItemFrame:", x, y, width, height);
              v90 = v89;
              v92 = v91;
              v94 = v93;
              v96 = v95;
              PXRectGetCenter();
              v98 = v97;
              v100 = v99;
              *(_QWORD *)&v174 = v9;
              *((_QWORD *)&v174 + 1) = v14;
              *(_QWORD *)&v175 = v17 - 1;
              *((_QWORD *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
              -[AEMessagesShelfLayout _zPositionForShelfTileKind:atIndexPath:](self, "_zPositionForShelfTileKind:atIndexPath:", 795209432, &v174);
              v101 = (void (*)(_QWORD *, __int128 *, __int128 *, uint64_t, _QWORD, _BYTE *))v163[2];
              v184 = xmmword_21E25A1F0;
              v185 = v9;
              v186 = v14;
              v187 = v17 - 1;
              v188[0] = 3;
              memset(&v188[1], 0, 40);
              *(_QWORD *)&v174 = v90;
              *((_QWORD *)&v174 + 1) = v92;
              *(_QWORD *)&v175 = v94;
              *((_QWORD *)&v175 + 1) = v96;
              *(_QWORD *)&v176 = v98;
              *((_QWORD *)&v176 + 1) = v100;
              *(_QWORD *)&v177 = v94;
              *((_QWORD *)&v177 + 1) = v96;
              v178 = v173;
              v179 = v172;
              v180 = v171;
              *(_QWORD *)&v181 = 0x3FF0000000000000;
              *((_QWORD *)&v181 + 1) = v102;
              *(_QWORD *)&v182 = 0;
              *((_QWORD *)&v182 + 1) = v94;
              *(_QWORD *)v183 = v96;
              y = v165;
              x = v166;
              *(_OWORD *)&v183[8] = v170;
              *(_OWORD *)&v183[24] = v169;
              *(_QWORD *)&v183[40] = v168;
              v101(v163, &v184, &v174, 136507, 0, v198);
            }
            if (v74)
            {
              PXRectGetCenter();
              v104 = v103;
              v106 = v105;
              *(_QWORD *)&v174 = v9;
              *((_QWORD *)&v174 + 1) = v14;
              *(_QWORD *)&v175 = v17 - 1;
              *((_QWORD *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
              -[AEMessagesShelfLayout _zPositionForShelfTileKind:atIndexPath:](self, "_zPositionForShelfTileKind:atIndexPath:", 795209433, &v174);
              v107 = (void (*)(_QWORD *, __int128 *, __int128 *, uint64_t, _QWORD, _BYTE *))v163[2];
              v184 = xmmword_21E25A1F0;
              v185 = v9;
              v186 = v14;
              v187 = v17 - 1;
              v188[0] = 4;
              memset(&v188[1], 0, 40);
              *(double *)&v174 = x;
              *((double *)&v174 + 1) = y;
              *(double *)&v175 = width;
              *((double *)&v175 + 1) = height;
              *(_QWORD *)&v176 = v104;
              *((_QWORD *)&v176 + 1) = v106;
              *(double *)&v177 = width;
              *((double *)&v177 + 1) = height;
              v178 = v173;
              v179 = v172;
              v180 = v171;
              *(_QWORD *)&v181 = 0x3FF0000000000000;
              *((_QWORD *)&v181 + 1) = v108;
              *(_QWORD *)&v182 = 0;
              *((double *)&v182 + 1) = width;
              *(double *)v183 = height;
              *(_OWORD *)&v183[8] = v170;
              *(_OWORD *)&v183[24] = v169;
              *(_QWORD *)&v183[40] = v168;
              v107(v163, &v184, &v174, 136507, 0, v198);
            }
            if (v161)
            {
              -[AEMessagesShelfLayout _cancelButtonFrameForGridFrame:](self, "_cancelButtonFrameForGridFrame:", x, y, width, height);
              v110 = v109;
              v112 = v111;
              v114 = v113;
              v116 = v115;
              PXRectGetCenter();
              v118 = v117;
              v120 = v119;
              *(_QWORD *)&v174 = v9;
              *((_QWORD *)&v174 + 1) = v14;
              *(_QWORD *)&v175 = v17 - 1;
              *((_QWORD *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
              -[AEMessagesShelfLayout _zPositionForShelfTileKind:atIndexPath:](self, "_zPositionForShelfTileKind:atIndexPath:", 1313817680, &v174);
              v121 = (void (*)(_QWORD *, __int128 *, __int128 *, _QWORD, _QWORD, _BYTE *))v163[2];
              v184 = xmmword_21E25A210;
              v185 = v9;
              v186 = v14;
              v187 = v17 - 1;
              v188[0] = 0x7FFFFFFFFFFFFFFFLL;
              memset(&v188[1], 0, 40);
              *(_QWORD *)&v174 = v110;
              *((_QWORD *)&v174 + 1) = v112;
              *(_QWORD *)&v175 = v114;
              *((_QWORD *)&v175 + 1) = v116;
              *(_QWORD *)&v176 = v118;
              *((_QWORD *)&v176 + 1) = v120;
              *(_QWORD *)&v177 = v114;
              *((_QWORD *)&v177 + 1) = v116;
              v178 = v173;
              v179 = v172;
              v180 = v171;
              *(_QWORD *)&v181 = 0x3FF0000000000000;
              *((_QWORD *)&v181 + 1) = v122;
              *(_QWORD *)&v182 = 0;
              *((_QWORD *)&v182 + 1) = v114;
              *(_QWORD *)v183 = v116;
              y = v165;
              x = v166;
              *(_OWORD *)&v183[8] = v170;
              *(_OWORD *)&v183[24] = v169;
              *(_QWORD *)&v183[40] = v168;
              v121(v163, &v184, &v174, 0, 0, v198);
            }
            *(_QWORD *)&v174 = v9;
            *((_QWORD *)&v174 + 1) = v14;
            *(_QWORD *)&v175 = v17 - 1;
            *((_QWORD *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
            v123 = objc_msgSend(v167, "layout:irisToggleStateForItemAtIndexPath:", self, &v174);
            if (v123)
            {
              v124 = v123;
              -[AEMessagesShelfLayout _irisToggleFrameForGridFrame:](self, "_irisToggleFrameForGridFrame:", x, y, width, height);
              v126 = v125;
              v128 = v127;
              v130 = v129;
              v132 = v131;
              PXRectGetCenter();
              v134 = v133;
              v136 = v135;
              *(_QWORD *)&v174 = v9;
              *((_QWORD *)&v174 + 1) = v14;
              *(_QWORD *)&v175 = v17 - 1;
              *((_QWORD *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
              -[AEMessagesShelfLayout _zPositionForShelfTileKind:atIndexPath:](self, "_zPositionForShelfTileKind:atIndexPath:", 1295210292, &v174);
              v137 = (void (*)(_QWORD *, __int128 *, __int128 *, uint64_t, _QWORD, _BYTE *))v163[2];
              v184 = xmmword_21E25A220;
              v185 = v9;
              v186 = v14;
              v187 = v17 - 1;
              v188[0] = v124;
              memset(&v188[1], 0, 40);
              *(_QWORD *)&v174 = v126;
              *((_QWORD *)&v174 + 1) = v128;
              *(_QWORD *)&v175 = v130;
              *((_QWORD *)&v175 + 1) = v132;
              *(_QWORD *)&v176 = v134;
              *((_QWORD *)&v176 + 1) = v136;
              *(_QWORD *)&v177 = v130;
              *((_QWORD *)&v177 + 1) = v132;
              v178 = v173;
              v179 = v172;
              v180 = v171;
              *(_QWORD *)&v181 = 0x3FF0000000000000;
              *((_QWORD *)&v181 + 1) = v138;
              *(_QWORD *)&v182 = 0;
              *((_QWORD *)&v182 + 1) = v130;
              *(_QWORD *)v183 = v132;
              y = v165;
              x = v166;
              *(_OWORD *)&v183[8] = v170;
              *(_OWORD *)&v183[24] = v169;
              *(_QWORD *)&v183[40] = v168;
              v137(v163, &v184, &v174, 2295210291, 0, v198);
            }
            *(_QWORD *)&v174 = v9;
            *((_QWORD *)&v174 + 1) = v14;
            *(_QWORD *)&v175 = v17 - 1;
            *((_QWORD *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
            v139 = objc_msgSend(v167, "layout:generationStateForItemAtIndexPath:", self, &v174);
            if (v139)
            {
              v140 = v139;
              -[AEMessagesShelfLayout _generationButtonFrameForGridFrame:](self, "_generationButtonFrameForGridFrame:", x, y, width, height);
              v142 = v141;
              v144 = v143;
              v146 = v145;
              v148 = v147;
              PXRectGetCenter();
              v150 = v149;
              v152 = v151;
              *(_QWORD *)&v174 = v9;
              *((_QWORD *)&v174 + 1) = v14;
              *(_QWORD *)&v175 = v17 - 1;
              *((_QWORD *)&v175 + 1) = 0x7FFFFFFFFFFFFFFFLL;
              -[AEMessagesShelfLayout _zPositionForShelfTileKind:atIndexPath:](self, "_zPositionForShelfTileKind:atIndexPath:", 1277777777, &v174);
              v153 = (void (*)(_QWORD *, __int128 *, __int128 *, uint64_t, _QWORD, _BYTE *))v163[2];
              v184 = xmmword_21E25A230;
              v185 = v9;
              v186 = v14;
              v187 = v17 - 1;
              v188[0] = v140;
              memset(&v188[1], 0, 40);
              *(_QWORD *)&v174 = v142;
              *((_QWORD *)&v174 + 1) = v144;
              *(_QWORD *)&v175 = v146;
              *((_QWORD *)&v175 + 1) = v148;
              *(_QWORD *)&v176 = v150;
              *((_QWORD *)&v176 + 1) = v152;
              *(_QWORD *)&v177 = v146;
              *((_QWORD *)&v177 + 1) = v148;
              v178 = v173;
              v179 = v172;
              v180 = v171;
              *(_QWORD *)&v181 = 0x3FF0000000000000;
              *((_QWORD *)&v181 + 1) = v154;
              *(_QWORD *)&v182 = 0;
              *((_QWORD *)&v182 + 1) = v146;
              *(_QWORD *)v183 = v148;
              *(_OWORD *)&v183[8] = v170;
              *(_OWORD *)&v183[24] = v169;
              *(_QWORD *)&v183[40] = v168;
              v153(v163, &v184, &v174, 2555555555, 0, v198);
            }
          }
          if (v17 >= v16)
            break;
          ++v17;
        }
        while (!v198[0]);
      }
      ++v14;
      -[PXAssetsTilingLayout dataSource](self, "dataSource");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      v156 = objc_msgSend(v155, "numberOfSections");
      v157 = v198[0];

    }
    while (v14 < v156 && !v157);
  }

}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  void *v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;
  unint64_t v19;
  id *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  char v29;
  void *v30;
  char v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  unint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  unint64_t v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  AEMessagesShelfLayout *v64;
  uint64_t v65;
  double v66;
  double v67;
  double v68;
  double v69;
  unint64_t v70;
  double v71;
  double v72;
  void *v73;
  CGFloat v74;
  CGFloat v75;
  uint64_t v76;
  __int128 v77;
  uint64_t v78;
  CGPoint v79;
  BOOL v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  uint64_t v86;
  unint64_t v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  __int128 v94;
  __int128 v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  PXTileGeometry *v101;
  PXTileGeometry *v102;
  unint64_t *v103;
  unint64_t *v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  unint64_t v111;
  objc_super v112;

  -[AEMessagesShelfLayout delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "layoutShouldShowVideoDuration:", self);
  v14 = a6->var1[1];
  v13 = a6->var1[2];
  v15 = a6->var1[3];
  *((_QWORD *)&v105 + 1) = a6->var1[4];
  v16 = a6->var1[0];
  if (v16 == *MEMORY[0x24BE727F0] && a6->var0 == 5)
    goto LABEL_13;
  if (v16 > 1295210291)
  {
    if (v16 != 1295210292 && v16 != 1500001338)
    {
      v18 = 1313817680;
LABEL_12:
      if (v16 == v18)
        goto LABEL_13;
LABEL_62:
      v112.receiver = self;
      v112.super_class = (Class)AEMessagesShelfLayout;
      v94 = *(_OWORD *)&a6->var1[5];
      v108 = *(_OWORD *)&a6->var1[3];
      v109 = v94;
      v110 = *(_OWORD *)&a6->var1[7];
      v111 = a6->var1[9];
      v95 = *(_OWORD *)&a6->var1[1];
      v106 = *(_OWORD *)&a6->var0;
      v107 = v95;
      v80 = -[PXAssetsTilingLayout getGeometry:group:userData:forTileWithIdentifier:](&v112, sel_getGeometry_group_userData_forTileWithIdentifier_, a3, a4, a5, &v106);
      v44 = 0;
      goto LABEL_60;
    }
LABEL_13:
    v101 = a3;
    v103 = a4;
    v19 = a6->var1[2];
    v20 = a5;
    v21 = v11;
    *(_QWORD *)&v105 = a6->var1[3];
    -[PXAssetsTilingLayout dataSource](self, "dataSource", v101, v103);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "numberOfItemsInSection:", 0);

    if ((uint64_t)v105 < v23 && v16 == 1295210292)
    {
      *(_QWORD *)&v106 = v14;
      *((_QWORD *)&v106 + 1) = v19;
      v24 = v19;
      v25 = *((_QWORD *)&v105 + 1);
      v107 = v105;
      v11 = v21;
      v26 = v21;
      v27 = v105;
      if (objc_msgSend(v26, "layout:irisToggleStateForItemAtIndexPath:", self, &v106) != *((_QWORD *)&v105 + 1))
        goto LABEL_59;
    }
    else
    {
      v28 = (uint64_t)v105 < v23 && v16 == 1215219281;
      v29 = !v28;
      v11 = v21;
      if (!v28 || ((v12 ^ 1) & 1) != 0)
      {
        v31 = v29 ^ 1;
        if ((uint64_t)v105 >= v23)
          v31 = 1;
        v27 = v105;
        v24 = v19;
        v25 = *((_QWORD *)&v105 + 1);
        if ((v31 & 1) != 0)
          goto LABEL_59;
      }
      else
      {
        *(_QWORD *)&v106 = v14;
        *((_QWORD *)&v106 + 1) = v19;
        v24 = v19;
        v25 = *((_QWORD *)&v105 + 1);
        v107 = v105;
        v30 = v21;
        v27 = v105;
        if ((objc_msgSend(v30, "layout:itemAtIndexPathIsVideo:", self, &v106) & 1) == 0)
          goto LABEL_59;
      }
    }
    *(_QWORD *)&v106 = v14;
    *((_QWORD *)&v106 + 1) = v24;
    *(_QWORD *)&v107 = v27;
    *((_QWORD *)&v107 + 1) = v25;
    -[AEMessagesShelfLayout _frameForGridItemAtIndexPath:](self, "_frameForGridItemAtIndexPath:", &v106);
    v36 = v32;
    v37 = v33;
    v38 = v34;
    v39 = v35;
    a5 = v20;
    if (v16 == 1313817680)
    {
      -[AEMessagesShelfLayout _cancelButtonFrameForGridFrame:](self, "_cancelButtonFrameForGridFrame:", v32, v33, v34, v35);
      v36 = v40;
      v37 = v41;
      v38 = v42;
      v39 = v43;
      v44 = 0;
      v45 = 0;
      a4 = v104;
      v46 = v105;
      a3 = v102;
    }
    else
    {
      a3 = v102;
      a4 = v104;
      if (v16 == 1295210292)
      {
        -[AEMessagesShelfLayout _irisToggleFrameForGridFrame:](self, "_irisToggleFrameForGridFrame:", v32, v33, v34, v35);
        v36 = v47;
        v37 = v48;
        v38 = v49;
        v39 = v50;
        v44 = 0;
        v45 = 2295210291;
      }
      else if (v16 == 1277777777)
      {
        -[AEMessagesShelfLayout _generationButtonFrameForGridFrame:](self, "_generationButtonFrameForGridFrame:", v32, v33, v34, v35);
        v36 = v51;
        v37 = v52;
        v38 = v53;
        v39 = v54;
        v44 = 0;
        v45 = 2555555555;
      }
      else
      {
        if (v16 == 1215219281)
        {
          -[AEMessagesShelfLayout _videoDurationFrameForItemFrame:](self, "_videoDurationFrameForItemFrame:", v32, v33, v34, v35);
          v36 = v81;
          v37 = v82;
          v38 = v83;
          v39 = v84;
          v85 = (void *)MEMORY[0x24BDD16E0];
          *(_QWORD *)&v106 = v14;
          *((_QWORD *)&v106 + 1) = v24;
          v107 = v105;
          objc_msgSend(v11, "layout:itemAtIndexPathDuration:", self, &v106);
          objc_msgSend(v85, "numberWithDouble:");
          v86 = objc_claimAutoreleasedReturnValue();
          v46 = v105;
          v44 = (id)v86;
          v45 = 0;
          goto LABEL_48;
        }
        if (v16 == 1500001338)
        {
          -[AEMessagesShelfLayout _spatialBadgeFrameForItemFrame:](self, "_spatialBadgeFrameForItemFrame:", v32, v33, v34, v35);
          v36 = v66;
          v37 = v67;
          v38 = v68;
          v39 = v69;
        }
        v44 = 0;
        v45 = 0;
      }
      v46 = v105;
    }
LABEL_48:
    v70 = a6->var1[0];
    *(_QWORD *)&v106 = v14;
    *((_QWORD *)&v106 + 1) = v24;
    *(_QWORD *)&v107 = v46;
    *((_QWORD *)&v107 + 1) = *((_QWORD *)&v105 + 1);
    -[AEMessagesShelfLayout _zPositionForShelfTileKind:atIndexPath:](self, "_zPositionForShelfTileKind:atIndexPath:", v70, &v106);
    v72 = v71;
    goto LABEL_49;
  }
  if (v16 != 795209731)
  {
    if (v16 != 1215219281)
    {
      v18 = 1277777777;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (!*((_QWORD *)&v105 + 1))
  {
LABEL_40:
    *(_QWORD *)&v106 = a6->var1[1];
    *((_QWORD *)&v106 + 1) = v13;
    *(_QWORD *)&v107 = v15;
    *((_QWORD *)&v107 + 1) = 0x7FFFFFFFFFFFFFFFLL;
    v55 = v15;
    if (!objc_msgSend(v11, "layout:itemAtIndexPathIsVideo:", self, &v106))
    {
      v80 = 0;
      v44 = 0;
      goto LABEL_60;
    }
    *(_QWORD *)&v106 = v14;
    *((_QWORD *)&v106 + 1) = v13;
    *(_QWORD *)&v107 = v55;
    *((_QWORD *)&v107 + 1) = 0x7FFFFFFFFFFFFFFFLL;
    -[AEMessagesShelfLayout _frameForGridItemAtIndexPath:](self, "_frameForGridItemAtIndexPath:", &v106);
    if (*((_QWORD *)&v105 + 1))
    {
      -[AEMessagesShelfLayout _gradientShadowFrameForItemFrame:](self, "_gradientShadowFrameForItemFrame:", v56, v57, v58, v59);
      v36 = v60;
      v37 = v61;
      v38 = v62;
      v39 = v63;
      *(_QWORD *)&v106 = v14;
      *((_QWORD *)&v106 + 1) = v13;
      *(_QWORD *)&v107 = v55;
      *((_QWORD *)&v107 + 1) = 3;
      v64 = self;
      v65 = 795209432;
    }
    else
    {
      -[AEMessagesShelfLayout _videoBadgeFrameForItemFrame:](self, "_videoBadgeFrameForItemFrame:", v56, v57, v58, v59);
      v36 = v96;
      v37 = v97;
      v38 = v98;
      v39 = v99;
      *(_QWORD *)&v106 = v14;
      *((_QWORD *)&v106 + 1) = v13;
      v107 = v55;
      v64 = self;
      v65 = 1500001336;
    }
    -[AEMessagesShelfLayout _zPositionForShelfTileKind:atIndexPath:](v64, "_zPositionForShelfTileKind:atIndexPath:", v65, &v106);
    v72 = v100;
    v45 = 0;
    v44 = 0;
    goto LABEL_49;
  }
  if (*((_QWORD *)&v105 + 1) != 4)
  {
    if (*((_QWORD *)&v105 + 1) != 3)
      goto LABEL_62;
    goto LABEL_40;
  }
  *(_QWORD *)&v106 = a6->var1[1];
  *((_QWORD *)&v106 + 1) = v13;
  *(_QWORD *)&v107 = v15;
  *((_QWORD *)&v107 + 1) = 0x7FFFFFFFFFFFFFFFLL;
  v87 = v15;
  if (!objc_msgSend(v11, "layout:itemAtIndexPathIsSpatial:", self, &v106))
  {
LABEL_59:
    v44 = 0;
    v80 = 0;
    goto LABEL_60;
  }
  *(_QWORD *)&v106 = v14;
  *((_QWORD *)&v106 + 1) = v13;
  *(_QWORD *)&v107 = v87;
  *((_QWORD *)&v107 + 1) = 0x7FFFFFFFFFFFFFFFLL;
  -[AEMessagesShelfLayout _frameForGridItemAtIndexPath:](self, "_frameForGridItemAtIndexPath:", &v106);
  v36 = v88;
  v37 = v89;
  v38 = v90;
  v39 = v91;
  *(_QWORD *)&v106 = v14;
  *((_QWORD *)&v106 + 1) = v13;
  *(_QWORD *)&v107 = v87;
  *((_QWORD *)&v107 + 1) = 4;
  -[AEMessagesShelfLayout _zPositionForShelfTileKind:atIndexPath:](self, "_zPositionForShelfTileKind:atIndexPath:", 795209433, &v106);
  v72 = v92;
  v45 = 0;
  v44 = 0;
LABEL_49:
  if (a3)
  {
    v73 = -[PXTilingLayout coordinateSpaceIdentifier](self, "coordinateSpaceIdentifier");
    PXRectGetCenter();
    a3->var0.origin.x = v36;
    a3->var0.origin.y = v37;
    a3->var0.size.width = v38;
    a3->var0.size.height = v39;
    a3->var1.x = v74;
    a3->var1.y = v75;
    a3->var2.width = v38;
    a3->var2.height = v39;
    v76 = MEMORY[0x24BDBD8B8];
    v77 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&a3->var3.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&a3->var3.c = v77;
    *(_OWORD *)&a3->var3.tx = *(_OWORD *)(v76 + 32);
    a3->var4 = 1.0;
    a3->var5 = v72;
    *(_QWORD *)&a3->var6 = 0;
    v78 = MEMORY[0x24BE72850];
    a3->var7.width = v38;
    a3->var7.height = v39;
    v79 = *(CGPoint *)v78;
    a3->var8.size = *(CGSize *)(v78 + 16);
    a3->var8.origin = v79;
    a3->var9 = v73;
  }
  if (a4)
    *a4 = v45;
  if (a5)
  {
    v44 = objc_retainAutorelease(v44);
    *a5 = v44;
  }
  v80 = 1;
LABEL_60:

  return v80;
}

- (void)prepareLayout
{
  CGRect *itemFramesForCurrentDataSource;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  CGFloat v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double currentContentWidth;
  CGFloat v14;
  CGRect *v15;
  _QWORD v16[4];
  objc_super v17;

  self->_wasPreparedAtLeastOnce = 1;
  v17.receiver = self;
  v17.super_class = (Class)AEMessagesShelfLayout;
  -[PXTilingLayout prepareLayout](&v17, sel_prepareLayout);
  itemFramesForCurrentDataSource = self->_itemFramesForCurrentDataSource;
  if (itemFramesForCurrentDataSource)
  {
    free(itemFramesForCurrentDataSource);
    self->_itemFramesForCurrentDataSource = 0;
  }
  -[PXAssetsTilingLayout dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEMessagesShelfLayout delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "numberOfItemsInSection:", 0);
  self->_itemFramesForCurrentDataSource = (CGRect *)malloc_type_malloc(32 * v6, 0x1000040E0EAB150uLL);
  v7 = objc_msgSend(v4, "identifier");
  -[PXTilingLayout referenceSize](self, "referenceSize");
  UIRoundToViewScale();
  v9 = v8;
  v10 = 0.0;
  if (v6)
    v10 = 6.0;
  self->_currentContentWidth = v10;
  if (v6 >= 1)
  {
    v11 = 0;
    v12 = 0;
    do
    {
      v16[0] = v7;
      v16[1] = 0;
      v16[2] = v12;
      v16[3] = 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend(v5, "layout:aspectRatioForItemAtIndexPath:", self, v16);
      UIRoundToViewScale();
      currentContentWidth = self->_currentContentWidth;
      self->_currentContentWidth = v14 + currentContentWidth + 6.0;
      v15 = &self->_itemFramesForCurrentDataSource[v11];
      v15->origin.x = currentContentWidth;
      ++v12;
      v15->origin.y = 0.0;
      v15->size.width = v14;
      v15->size.height = v9;
      ++v11;
    }
    while (v6 != v12);
  }

}

- (double)_zPositionForShelfTileKind:(unint64_t)a3 atIndexPath:(PXSimpleIndexPath *)a4
{
  double result;

  result = 0.0;
  if ((uint64_t)a3 <= 1313817679)
  {
    if (a3 != 1215219281 && a3 != 1277777777 && a3 != 1295210292)
      return result;
    return 10.0;
  }
  if (a3 - 1500001336 < 3 || a3 == 1313817680)
    return 10.0;
  if (a3 == 1500001007)
    return 0.5;
  return result;
}

- (CGRect)_frameForGridItemAtIndexPath:(PXSimpleIndexPath *)a3
{
  CGRect *itemFramesForCurrentDataSource;
  double *p_x;
  NSObject *v6;
  const __CFString *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;
  CGRect result;

  v14 = *MEMORY[0x24BDAC8D0];
  itemFramesForCurrentDataSource = self->_itemFramesForCurrentDataSource;
  if (itemFramesForCurrentDataSource)
  {
    p_x = &itemFramesForCurrentDataSource[a3->item].origin.x;
  }
  else
  {
    PLAssetExplorerGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      if (self->_wasPreparedAtLeastOnce)
        v7 = CFSTR("was");
      else
        v7 = CFSTR("WAS NOT");
      v12 = 138412290;
      v13 = v7;
      _os_log_impl(&dword_21E23A000, v6, OS_LOG_TYPE_ERROR, "<Shelf layout> Precomputed item frames unavailable, layout %@ prepared at least once", (uint8_t *)&v12, 0xCu);
    }

    p_x = (double *)MEMORY[0x24BDBF090];
  }
  v8 = p_x[2];
  v9 = p_x[3];
  v10 = *p_x;
  v11 = p_x[1];
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)_cancelButtonFrameForGridFrame:(CGRect)a3
{
  double width;
  CGFloat y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[AEMessagesShelfRoundButton preferredTapRegionSizeForStyle:](AEMessagesShelfRoundButton, "preferredTapRegionSizeForStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6;
  v9 = v8;
  v10 = x + width - v6;
  v11 = y;
  result.size.height = v9;
  result.size.width = v7;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)_irisToggleFrameForGridFrame:(CGRect)a3
{
  CGFloat y;
  CGFloat x;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  y = a3.origin.y;
  x = a3.origin.x;
  +[AEMessagesShelfRoundButton preferredTapRegionSizeForStyle:](AEMessagesShelfRoundButton, "preferredTapRegionSizeForStyle:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  v8 = v7;
  v9 = x;
  v10 = y;
  result.size.height = v8;
  result.size.width = v6;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)_generationButtonFrameForGridFrame:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = a3.origin.x + 4.0;
  v4 = a3.origin.y + a3.size.height + -26.0 + -4.0;
  v5 = 26.0;
  v6 = 26.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_gradientShadowFrameForItemFrame:(CGRect)result
{
  double v3;
  double v4;

  v3 = result.origin.y + result.size.height + -39.0;
  v4 = 39.0;
  result.size.height = v4;
  result.origin.y = v3;
  return result;
}

- (CGRect)_loopBadgeFrameForItemFrame:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = a3.origin.x + 12.0;
  v4 = a3.origin.y + a3.size.height + -15.0 + -12.0;
  v5 = 19.0;
  v6 = 15.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_spatialBadgeFrameForItemFrame:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = a3.origin.x + 8.0;
  v4 = a3.origin.y + 8.0;
  v5 = 20.0;
  v6 = 20.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_videoBadgeFrameForItemFrame:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = a3.origin.x + 12.0;
  v4 = a3.origin.y + a3.size.height + -12.0 + -12.0;
  v5 = 20.0;
  v6 = 12.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_videoDurationFrameForItemFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AEMessagesShelfLayout _videoBadgeFrameForItemFrame:](self, "_videoBadgeFrameForItemFrame:");
  v9 = v7 + v8;
  v10 = width + -12.0 + x - v9;
  v11 = y + height + -12.0 + -12.0;
  v12 = 12.0;
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v11;
  result.origin.x = v9;
  return result;
}

- (AEMessagesShelfLayoutDelegate)delegate
{
  return (AEMessagesShelfLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __69__AEMessagesShelfLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke()
{
  void *v0;
  char v1;
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("AssetExplorer_ShowLoopBadges"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
    v1 = objc_msgSend(v11, "BOOLValue");
  else
    v1 = enumerateTilesInRect_withOptions_usingBlock__canShowLoopBadges != 0;
  enumerateTilesInRect_withOptions_usingBlock__canShowLoopBadges = v1;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("AssetExplorer_ShowLoopVideos"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = enumerateTilesInRect_withOptions_usingBlock__canShowLoopOverlays != 0;
  enumerateTilesInRect_withOptions_usingBlock__canShowLoopOverlays = v4;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("AssetExplorer_ShowVideos"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "BOOLValue");
  else
    v7 = enumerateTilesInRect_withOptions_usingBlock__canShowVideoOverlays != 0;
  enumerateTilesInRect_withOptions_usingBlock__canShowVideoOverlays = v7;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("AssetExplorer_ShowAnimatedImages"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v9, "BOOLValue");
  else
    v10 = enumerateTilesInRect_withOptions_usingBlock__canShowAnimatedImageOverlays != 0;
  enumerateTilesInRect_withOptions_usingBlock__canShowAnimatedImageOverlays = v10;

}

@end
