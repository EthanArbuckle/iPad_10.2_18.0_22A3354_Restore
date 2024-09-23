@implementation EDColorAnalyzer

- (EDColorAnalyzer)init
{
  EDColorAnalyzer *v2;
  uint64_t v3;
  NSMutableDictionary *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EDColorAnalyzer;
  v2 = -[EDColorAnalyzer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)clearCache
{
  -[NSMutableDictionary removeAllObjects](self->_cache, "removeAllObjects");
}

- (id)colorsSuggestionsForSurface:(__IOSurface *)a3 maxSuggestions:(int64_t)a4 clipToCircle:(BOOL)a5 clipedToRect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v10;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = a5;
  IOSurfaceLock(a3, 1u, 0);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDColorAnalyzer colorAtCenterOfSurface:offset:](self, "colorAtCenterOfSurface:offset:", a3, -1.0, -1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v15);

  -[EDColorAnalyzer colorsInSurface:offset:clipToCircle:clipedToRect:](self, "colorsInSurface:offset:clipToCircle:clipedToRect:", a3, v10, -1.0, -1.0, x, y, width, height);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDColorAnalyzer kmeansForColors:clusters:](self, "kmeansForColors:clusters:", v16, a4 - 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v17);

  -[EDColorAnalyzer removeSimilarColors:minDistance:](self, "removeSimilarColors:minDistance:", v14, 0.1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  IOSurfaceUnlock(a3, 1u, 0);
  return v19;
}

- (id)removeSimilarColors:(id)a3 minDistance:(double)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  char v26;
  unint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  BOOL v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v55 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithColor:", ColorMakeWithColor(*(void **)(*((_QWORD *)&v54 + 1) + 8 * i)));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v9);
  }
  v45 = v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v51 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        objc_msgSend(v19, "colorValue");
        v21 = v20;
        v23 = v22;
        v25 = v24;
        if (!objc_msgSend(v13, "count"))
          goto LABEL_17;
        v26 = 0;
        v27 = 0;
        do
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "colorValue");
          v32 = ColorDistanceToColor(v21, v23, v25, v29, v30, v31) < a4;

          v26 |= v32;
          ++v27;
        }
        while (v27 < objc_msgSend(v13, "count"));
        if ((v26 & 1) == 0)
LABEL_17:
          objc_msgSend(v13, "addObject:", v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v34 = v13;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v47;
    do
    {
      for (k = 0; k != v36; ++k)
      {
        if (*(_QWORD *)v47 != v37)
          objc_enumerationMutation(v34);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * k), "colorValue");
        ColorUIColor(v39, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v42);

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    }
    while (v36);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v33);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (id)kmeansColorsForColors:(id)a3 clusters:(int64_t)a4
{
  id v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  uint64_t m;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t n;
  void *v66;
  id v67;
  uint64_t v68;
  double v69;
  double v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t ii;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t jj;
  double v96;
  double v97;
  double v98;
  void *v99;
  void *v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  EDColorAnalyzer *v105;
  id obj;
  double v107;
  double v108;
  __int128 v109;
  __int128 v110;
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
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  uint64_t v144;

  v144 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = 0.0;
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v133, v143, 16);
  v9 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  if (v8)
  {
    v12 = v8;
    v13 = *(_QWORD *)v134;
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v134 != v13)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v133 + 1) + 8 * i), "colorValue");
        v11 = ColorCombineColors(v11, v10, v9, v15);
        v10 = v16;
        v9 = v17;
      }
      v12 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v133, v143, 16);
    }
    while (v12);
  }
  v18 = ColorMake((double)a4, (double)a4, (double)a4);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithColor:", ColorCombineColors(v11, v10, v9, v18));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v101 = v19;
    -[EDColorAnalyzer getRandomColors:from:](self, "getRandomColors:from:", a4, v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "mutableCopy");

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[EDColorAnalyzer kmeansShouldStopWithPreviousColors:newColors:iterations:](self, "kmeansShouldStopWithPreviousColors:newColors:iterations:", v24, v23, 0))
    {
      v25 = v24;
    }
    else
    {
      v26 = 0;
      v102 = v6;
      v105 = self;
      do
      {
        v103 = v26;
        v104 = objc_msgSend(v23, "mutableCopy");

        v27 = (void *)objc_opt_new();
        v129 = 0u;
        v130 = 0u;
        v131 = 0u;
        v132 = 0u;
        v28 = v23;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v129, v142, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v130;
          do
          {
            for (j = 0; j != v30; ++j)
            {
              if (*(_QWORD *)v130 != v31)
                objc_enumerationMutation(v28);
              v33 = *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setObject:forKeyedSubscript:", v34, v33);

            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v129, v142, 16);
          }
          while (v30);
        }

        v127 = 0u;
        v128 = 0u;
        v125 = 0u;
        v126 = 0u;
        obj = v6;
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v141, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v126;
          do
          {
            for (k = 0; k != v36; ++k)
            {
              if (*(_QWORD *)v126 != v37)
                objc_enumerationMutation(obj);
              v39 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * k);
              objc_msgSend(v39, "colorValue");
              v41 = v40;
              v43 = v42;
              v45 = v44;
              v121 = 0u;
              v122 = 0u;
              v123 = 0u;
              v124 = 0u;
              v46 = v28;
              v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v121, v140, 16);
              v107 = 0.0;
              v108 = 0.0;
              if (v47)
              {
                v48 = v47;
                v49 = *(_QWORD *)v122;
                v50 = 1.79769313e308;
                v7 = 0.0;
                v107 = 0.0;
                v108 = 0.0;
                do
                {
                  for (m = 0; m != v48; ++m)
                  {
                    if (*(_QWORD *)v122 != v49)
                      objc_enumerationMutation(v46);
                    objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * m), "colorValue");
                    v53 = v52;
                    v55 = v54;
                    v57 = v56;
                    v58 = ColorDistanceToColor(v52, v54, v56, v41, v43, v45);
                    if (v58 < v50)
                    {
                      v107 = v55;
                      v108 = v57;
                      v7 = v53;
                      v50 = v58;
                    }
                  }
                  v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v121, v140, 16);
                }
                while (v48);
              }

              objc_msgSend(MEMORY[0x24BDD1968], "valueWithColor:", v7, v107, v108);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "objectForKeyedSubscript:", v59);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "addObject:", v39);

              v7 = 0.0;
            }
            v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v141, 16);
          }
          while (v36);
        }

        objc_msgSend(v28, "removeAllObjects");
        v119 = 0u;
        v120 = 0u;
        v117 = 0u;
        v118 = 0u;
        objc_msgSend(v27, "allValues");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v117, v139, 16);
        if (v62)
        {
          v63 = v62;
          v64 = *(_QWORD *)v118;
          do
          {
            for (n = 0; n != v63; ++n)
            {
              if (*(_QWORD *)v118 != v64)
                objc_enumerationMutation(v61);
              v66 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * n);
              v113 = 0u;
              v114 = 0u;
              v115 = 0u;
              v116 = 0u;
              v67 = v66;
              v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v113, v138, 16);
              v69 = 0.0;
              v70 = 0.0;
              v71 = 0.0;
              if (v68)
              {
                v72 = v68;
                v73 = *(_QWORD *)v114;
                v69 = 0.0;
                v70 = 0.0;
                v71 = 0.0;
                do
                {
                  for (ii = 0; ii != v72; ++ii)
                  {
                    if (*(_QWORD *)v114 != v73)
                      objc_enumerationMutation(v67);
                    objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * ii), "colorValue");
                    v69 = ColorCombineColors(v69, v70, v71, v75);
                    v70 = v76;
                    v71 = v77;
                  }
                  v72 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v113, v138, 16);
                }
                while (v72);
              }

              if (objc_msgSend(v67, "count"))
              {
                v78 = ColorDivide(v69, v70, v71, (double)(unint64_t)objc_msgSend(v67, "count"));
                v80 = v79;
                v82 = v81;
              }
              else
              {
                -[EDColorAnalyzer getRandomColors:from:](v105, "getRandomColors:from:", 1, obj);
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "firstObject");
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v84, "colorValue");
                v78 = v85;
                v80 = v86;
                v82 = v87;

              }
              objc_msgSend(MEMORY[0x24BDD1968], "valueWithColor:", v78, v80, v82);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "addObject:", v88);

            }
            v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v117, v139, 16);
          }
          while (v63);
        }
        v26 = v103 + 1;

        objc_msgSend(v28, "sortedArrayUsingComparator:", &__block_literal_global_1);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v89, "mutableCopy");

        v25 = (void *)v104;
        self = v105;
        v24 = (void *)v104;
        v6 = v102;
      }
      while (!-[EDColorAnalyzer kmeansShouldStopWithPreviousColors:newColors:iterations:](v105, "kmeansShouldStopWithPreviousColors:newColors:iterations:", v104, v23, v103 + 1));
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    v91 = v23;
    v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v109, v137, 16);
    if (v92)
    {
      v93 = v92;
      v94 = *(_QWORD *)v110;
      do
      {
        for (jj = 0; jj != v93; ++jj)
        {
          if (*(_QWORD *)v110 != v94)
            objc_enumerationMutation(v91);
          objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * jj), "colorValue");
          ColorUIColor(v96, v97, v98);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "addObject:", v99);

        }
        v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v109, v137, 16);
      }
      while (v93);
    }

    v19 = v101;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", v90, v101);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v90);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v21;
}

BOOL __50__EDColorAnalyzer_kmeansColorsForColors_clusters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
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

  v4 = a3;
  objc_msgSend(a2, "colorValue");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v4, "colorValue");
  v12 = v11;
  v14 = v13;
  v16 = v15;

  return v8 * 0.7152 + v6 * 0.2126 + v10 * 0.0722 > v14 * 0.7152 + v12 * 0.2126 + v16 * 0.0722;
}

- (BOOL)kmeansShouldStopWithPreviousColors:(id)a3 newColors:(id)a4 iterations:(int64_t)a5
{
  if (a5 <= 14)
    return objc_msgSend(a3, "isEqualToArray:", a4);
  else
    return 1;
}

- (id)colorsInSurface:(__IOSurface *)a3 offset:(CGPoint)a4 clipToCircle:(BOOL)a5 clipedToRect:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _BOOL4 v10;
  double v11;
  double v12;
  char *BaseAddress;
  OSType PixelFormat;
  size_t v16;
  size_t v17;
  void *v18;
  double MinY;
  void *v20;
  uint64_t v21;
  char *v22;
  double MinX;
  double v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v39;
  double v40;
  size_t BytesPerRow;
  double v42;
  double v43;
  double v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = a5;
  v11 = a4.y;
  v12 = a4.x;
  BaseAddress = (char *)IOSurfaceGetBaseAddress(a3);
  PixelFormat = IOSurfaceGetPixelFormat(a3);
  v16 = IOSurfaceGetWidth(a3);
  v17 = IOSurfaceGetHeight(a3);
  BytesPerRow = IOSurfaceGetBytesPerRow(a3);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  MinY = CGRectGetMinY(v45);
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  v40 = v11;
  v42 = (double)(uint64_t)MinY;
  if (v11 + CGRectGetMaxY(v46) > v42)
  {
    v39 = (double)((v17 >> 1) - 1);
    v43 = (double)(v16 >> 1);
    v44 = (double)((v16 >> 1) - 1);
    v21 = (uint64_t)MinY;
    v22 = &BaseAddress[BytesPerRow * (uint64_t)MinY];
    do
    {
      v47.origin.x = x;
      v47.origin.y = y;
      v47.size.width = width;
      v47.size.height = height;
      MinX = CGRectGetMinX(v47);
      v24 = (double)(uint64_t)MinX;
      v48.origin.x = x;
      v48.origin.y = y;
      v48.size.width = width;
      v48.size.height = height;
      if (v12 + CGRectGetMaxX(v48) > v24)
      {
        v26 = (uint64_t)MinX;
        v27 = *(_QWORD *)&v42;
        v28 = v39 - v42;
        v29 = v28 * v28;
        v30 = v26 + 1;
        v31 = 4 * v26;
        do
        {
          if (!v10
            || (v27 = *(_QWORD *)&v43, v28 = (double)(uint64_t)floor(sqrt(v29 + (v44 - v24) * (v44 - v24))), v28 <= v43))
          {
            if (PixelFormat == 1111970369)
            {
              LOBYTE(v28) = v22[v31 + 2];
              v34 = (double)*(unint64_t *)&v28 / 255.0;
              LOBYTE(v27) = v22[v31 + 1];
              v35 = (double)v27 / 255.0;
              LOBYTE(v25) = v22[v31];
              v33 = (void *)MEMORY[0x24BDD1968];
              v36 = (double)v25 / 255.0;
            }
            else
            {
              if (PixelFormat != 1999843442)
              {
                v20 = 0;
                goto LABEL_17;
              }
              v32 = *(_DWORD *)&v22[v31];
              v33 = (void *)MEMORY[0x24BDD1968];
              v34 = (float)((float)((float)((v32 >> 20) & 0x3FF) + -384.0) / 510.0);
              v35 = (float)((float)((float)((v32 >> 10) & 0x3FF) + -384.0) / 510.0);
              v36 = (float)((float)((float)(v32 & 0x3FF) + -384.0) / 510.0);
            }
            objc_msgSend(v33, "valueWithColor:", ColorMake(v34, v35, v36));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v37);

          }
          v24 = (double)v30;
          v49.origin.x = x;
          v49.origin.y = y;
          v49.size.width = width;
          v49.size.height = height;
          v28 = v12 + CGRectGetMaxX(v49);
          ++v30;
          v31 += 4;
        }
        while (v28 > v24);
      }
      ++v21;
      v50.origin.x = x;
      v50.origin.y = y;
      v50.size.width = width;
      v50.size.height = height;
      v22 += BytesPerRow;
      v42 = (double)v21;
    }
    while (v40 + CGRectGetMaxY(v50) > (double)v21);
  }
  v20 = (void *)objc_msgSend(v18, "copy", *(_QWORD *)&v39);
LABEL_17:

  return v20;
}

- (id)colorAtCenterOfSurface:(__IOSurface *)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  void *BaseAddress;
  OSType PixelFormat;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unsigned int v15;
  double v16;
  double v17;
  double v18;
  _BYTE *v19;
  double v20;
  double v21;
  double v22;
  void *v23;

  y = a4.y;
  x = a4.x;
  BaseAddress = IOSurfaceGetBaseAddress(a3);
  PixelFormat = IOSurfaceGetPixelFormat(a3);
  v9 = (unint64_t)(x + (double)(IOSurfaceGetWidth(a3) >> 1));
  v10 = (unint64_t)(y + (double)(IOSurfaceGetHeight(a3) >> 1));
  v11 = (size_t)BaseAddress + IOSurfaceGetBytesPerRow(a3) * v10;
  if (PixelFormat == 1111970369)
  {
    v19 = (_BYTE *)(v11 + 4 * v9);
    LOBYTE(v12) = v19[2];
    v16 = (double)v12 / 255.0;
    LOBYTE(v13) = v19[1];
    v17 = (double)v13 / 255.0;
    LOBYTE(v14) = *v19;
    v18 = (double)v14 / 255.0;
  }
  else
  {
    if (PixelFormat != 1999843442)
    {
      v23 = 0;
      return v23;
    }
    v15 = *(_DWORD *)(v11 + 4 * v9);
    v16 = (float)((float)((float)((v15 >> 20) & 0x3FF) + -384.0) / 510.0);
    v17 = (float)((float)((float)((v15 >> 10) & 0x3FF) + -384.0) / 510.0);
    v18 = (float)((float)((float)(v15 & 0x3FF) + -384.0) / 510.0);
  }
  v20 = ColorMake(v16, v17, v18);
  ColorUIColor(v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  return v23;
}

- (id)getRandomColors:(int64_t)a3 from:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = a4;
  if (objc_msgSend(v5, "count") >= (unint64_t)a3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v9 = 0;
      do
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v10);

        ++v9;
      }
      while (v9 < objc_msgSend(v5, "count"));
    }
    while (objc_msgSend(v8, "count") && objc_msgSend(v7, "count") < (unint64_t)a3)
    {
      v11 = arc4random();
      v12 = v11 % objc_msgSend(v8, "count");
      objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");

      objc_msgSend(v8, "removeObjectAtIndex:", v12);
      objc_msgSend(v5, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v15);

    }
    objc_msgSend(v7, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
