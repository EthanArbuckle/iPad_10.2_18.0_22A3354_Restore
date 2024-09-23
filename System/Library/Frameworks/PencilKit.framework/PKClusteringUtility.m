@implementation PKClusteringUtility

+ (id)horizontalDistanceBetweenStrokes:(id)a3 lineHeight:(double)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t j;
  void *v19;
  double MidY;
  double MidX;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  id v40;
  double v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v12 = v6;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        v14 = v12;
        if (!v13)
          goto LABEL_26;
        v15 = v13;
        v16 = *(_QWORD *)v43;
        v17 = 1.79769313e308;
        v41 = 1.79769313e308;
        do
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v43 != v16)
              objc_enumerationMutation(v12);
            v19 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
            if (v11 != v19)
            {
              objc_msgSend(v11, "_bounds");
              MidY = CGRectGetMidY(v53);
              objc_msgSend(v19, "_bounds");
              if (vabdd_f64(CGRectGetMidY(v54), MidY) < a4)
              {
                objc_msgSend(v19, "_bounds");
                MidX = CGRectGetMidX(v55);
                objc_msgSend(v11, "_bounds");
                v22 = CGRectGetMidX(v56);
                objc_msgSend(v11, "_bounds");
                v24 = v23;
                v26 = v25;
                v28 = v27;
                v30 = v29;
                objc_msgSend(v19, "_bounds");
                v35 = DKDDistanceToRectFromRect(v24, v26, v28, v30, v31, v32, v33, v34);
                if (MidX <= v22)
                {
                  v36 = v41;
                  if (v35 < v41)
                    v36 = v35;
                  v41 = v36;
                }
                else if (v35 < v17)
                {
                  v17 = v35;
                }
              }
            }
          }
          v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        }
        while (v15);

        if (v17 != 1.79769313e308)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v37);

        }
        v38 = v41;
        if (v41 != 1.79769313e308)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v41);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v14);
LABEL_26:

          continue;
        }
      }
      v8 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v51, 16, v38);
    }
    while (v8);
  }

  return v40;
}

+ (double)estimatedWordDistanceForStrokes:(id)a3 lineHeight:(double)a4
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  void *v11;
  float v12;
  double v13;

  +[PKClusteringUtility horizontalDistanceBetweenStrokes:lineHeight:](PKClusteringUtility, "horizontalDistanceBetweenStrokes:lineHeight:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 7.0;
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    objc_msgSend((id)objc_opt_class(), "kMeansCluster:values:clusterError:maxIterations:", 2, v4, 500, 0.5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortUsingSelector:", sel_compare_);
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v10 = v9;

    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v13 = v12;

    v5 = (v10 + v13) * 0.5;
  }

  return v5;
}

+ (id)kMeansCluster:(int)a3 values:(id)a4 clusterError:(double)a5 maxIterations:(int)a6
{
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  double v23;
  float v24;
  float v25;
  void *v26;
  float v27;
  double v28;
  void *v29;
  uint64_t v30;
  unsigned __int8 v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  float v36;
  BOOL v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v44;
  id v45;
  int v47;
  id obj;
  uint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v7 = *(_QWORD *)&a3;
  v56 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (objc_msgSend(v8, "count") >= (unint64_t)(int)v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v7;
    if ((int)v7 >= 1)
    {
      v12 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v13);

        objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:atIndexedSubscript:", v14, v12);

        ++v12;
      }
      while (v7 != v12);
    }
    v47 = 0;
    v44 = v10;
    v45 = v8;
    v15 = v10;
    while (1)
    {
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      obj = v8;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      if (v16)
      {
        v17 = v16;
        v49 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v52 != v49)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            v20 = v7;
            if ((int)v7 < 1)
            {
              v22 = 0;
            }
            else
            {
              v21 = 0;
              v22 = 0;
              v23 = 1.79769313e308;
              do
              {
                objc_msgSend(v19, "floatValue");
                v25 = v24;
                objc_msgSend(v9, "objectAtIndexedSubscript:", v21);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "floatValue");
                v28 = vabds_f32(v25, v27);

                if (v23 > v28)
                {
                  v22 = v21;
                  v23 = v28;
                }
                ++v21;
              }
              while (v11 != v21);
            }
            objc_msgSend(v15, "objectAtIndexedSubscript:", v22);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v19);

            v7 = v20;
          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        }
        while (v17);
      }

      if ((int)v7 < 1)
      {
        v42 = v44;
        v8 = v45;
        goto LABEL_30;
      }
      v50 = v15;
      v30 = 0;
      v31 = 0;
      do
      {
        objc_msgSend(v50, "objectAtIndexedSubscript:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKClusteringUtility arrayAverage:](PKClusteringUtility, "arrayAverage:", v32);
        v34 = v33;

        objc_msgSend(v9, "objectAtIndexedSubscript:", v30);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "floatValue");
        v37 = vabdd_f64(v34, v36) < a5;

        v31 |= v37;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v34);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "replaceObjectAtIndex:withObject:", v30, v38);

        ++v30;
      }
      while (v11 != v30);
      if ((v31 & (v47 < a6)) == 0)
        break;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = v7;
      do
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addObject:", v41);

        --v40;
      }
      while (v40);
      ++v47;
      v15 = v39;
      v8 = v45;
    }
    v42 = v50;
    v8 = v45;
LABEL_30:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (double)arrayAverage:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  float v10;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      v8 = 0.0;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "floatValue", (_QWORD)v13);
          v8 = v8 + v10;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0.0;
    }

    v11 = v8 / (double)(unint64_t)objc_msgSend(v4, "count");
  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

+ (CGRect)constrainRect:(CGRect)result
{
  double v3;
  double v4;

  v3 = fmax(result.size.width, 10.0);
  v4 = fmax(result.size.height, 10.0);
  result.size.height = v4;
  result.size.width = v3;
  return result;
}

+ (void)_fetchIntersectedStrokesForGeometricBasedStrokeClusteringBetweenPoint:(CGPoint)a3 otherPoint:(CGPoint)a4 visibleStrokes:(id)a5 completion:(id)a6
{
  double y;
  double x;
  double v9;
  double v10;
  id v11;
  void (**v12)(id, void *);
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  void *v29;
  uint64_t i;
  void *v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double v38;
  id v39;
  double v40;
  id v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  double v64;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t k;
  void *v75;
  double v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t m;
  void *v82;
  double v83;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  double v88;
  CGFloat v89;
  double v90;
  double v91;
  double v92;
  CGFloat v93;
  double v94;
  CGFloat v95;
  double v96;
  CGFloat v97;
  double v98;
  CGFloat v99;
  double v100;
  void *v101;
  void (**v102)(id, void *);
  double v103;
  double v104;
  double v105;
  double v106;
  void *v107;
  double v108;
  void *v109;
  double v110;
  void *v111;
  double v112;
  id v113;
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
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  uint64_t v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;

  y = a4.y;
  x = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  v134 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = (void (**)(id, void *))a6;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 >= y)
    v13 = y;
  else
    v13 = v9;
  if (v9 >= y)
    v14 = x;
  else
    v14 = v10;
  v104 = v13;
  v105 = v14;
  if (v9 >= y)
    v15 = v9;
  else
    v15 = y;
  v103 = v15;
  v126 = 0u;
  v127 = 0u;
  if (v9 >= y)
    v16 = v10;
  else
    v16 = x;
  v106 = v16;
  v128 = 0uLL;
  v129 = 0uLL;
  v17 = v11;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v126, v133, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = 0;
    if (v9 >= y)
      v22 = v10;
    else
      v22 = x;
    if (v9 >= y)
      v23 = v9;
    else
      v23 = y;
    v110 = v23;
    v112 = v22;
    if (v9 >= y)
      v24 = x;
    else
      v24 = v10;
    v108 = v24;
    if (v9 >= y)
      v25 = y;
    else
      v25 = v9;
    v26 = *(_QWORD *)v127;
    v27 = 1.79769313e308;
    v28 = 1.79769313e308;
    v29 = v107;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v127 != v26)
          objc_enumerationMutation(v17);
        v31 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * i);
        objc_msgSend(v31, "_bounds");
        v32 = v135.origin.x;
        v33 = v135.origin.y;
        width = v135.size.width;
        height = v135.size.height;
        MidX = CGRectGetMidX(v135);
        v136.origin.x = v32;
        v136.origin.y = v33;
        v136.size.width = width;
        v136.size.height = height;
        MidY = CGRectGetMidY(v136);
        v38 = sqrt((MidY - v25) * (MidY - v25) + (MidX - v108) * (MidX - v108));
        if (v38 < v28)
        {
          v39 = v31;

          v28 = v38;
          v21 = (unint64_t)v39;
        }
        v40 = sqrt((MidY - v110) * (MidY - v110) + (MidX - v112) * (MidX - v112));
        if (v40 < v27)
        {
          v41 = v31;

          v27 = v40;
          v20 = (unint64_t)v41;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v126, v133, 16);
    }
    while (v19);
  }
  else
  {
    v20 = 0;
    v21 = 0;
    v29 = v107;
  }

  if (!(v21 | v20))
  {
    v12[2](v12, v29);
    goto LABEL_81;
  }
  v102 = v12;
  if (v21 || !v20)
  {
    v43 = v105;
    v42 = v106;
    v45 = v103;
    v44 = v104;
    if (v20 || !v21)
      goto LABEL_46;
  }
  else
  {
    v21 = v20;
    v43 = v105;
    v42 = v106;
    v45 = v103;
    v44 = v104;
  }
  v20 = (unint64_t)(id)v21;
  v21 = v20;
LABEL_46:
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithObject:", v21);
  v46 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithObject:", v20);
  v47 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v21, "_bounds");
  v49 = v48;
  objc_msgSend((id)v21, "_bounds");
  v111 = (void *)v46;
  +[PKClusteringUtility _clusteredStrokesWithInitialStrokes:selectionType:visibleStrokes:approximateLineHeight:approximateLineCenter:](PKClusteringUtility, "_clusteredStrokesWithInitialStrokes:selectionType:visibleStrokes:approximateLineHeight:approximateLineCenter:", v46, 3, v17, v49, CGRectGetMidY(v137));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v20, "_bounds");
  v52 = v51;
  objc_msgSend((id)v20, "_bounds");
  v109 = (void *)v47;
  +[PKClusteringUtility _clusteredStrokesWithInitialStrokes:selectionType:visibleStrokes:approximateLineHeight:approximateLineCenter:](PKClusteringUtility, "_clusteredStrokesWithInitialStrokes:selectionType:visibleStrokes:approximateLineHeight:approximateLineCenter:", v47, 3, v17, v52, CGRectGetMidY(v138));
  v53 = objc_claimAutoreleasedReturnValue();
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v113 = v17;
  v54 = v17;
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v122, v132, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v123;
    do
    {
      for (j = 0; j != v56; ++j)
      {
        if (*(_QWORD *)v123 != v57)
          objc_enumerationMutation(v54);
        v59 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * j);
        objc_msgSend(v59, "_bounds");
        v60 = v139.origin.x;
        v61 = v139.origin.y;
        v62 = v139.size.width;
        v63 = v139.size.height;
        CGRectGetMidX(v139);
        v140.origin.x = v60;
        v140.origin.y = v61;
        v140.size.width = v62;
        v140.size.height = v63;
        v64 = CGRectGetMidY(v140);
        if (v64 > v44 && v64 < v45)
          objc_msgSend(v29, "addObject:", v59);
      }
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v122, v132, 16);
    }
    while (v56);
  }

  objc_msgSend(v29, "minusOrderedSet:", v50);
  v66 = v29;
  v67 = (void *)v53;
  objc_msgSend(v66, "minusOrderedSet:", v53);
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v70 = v50;
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v118, v131, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v119;
    do
    {
      for (k = 0; k != v72; ++k)
      {
        if (*(_QWORD *)v119 != v73)
          objc_enumerationMutation(v70);
        v75 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * k);
        objc_msgSend(v75, "_bounds");
        if (v76 > v43)
          objc_msgSend(v68, "addObject:", v75);
      }
      v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v118, v131, 16);
    }
    while (v72);
  }

  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v77 = v67;
  v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v114, v130, 16);
  if (v78)
  {
    v79 = v78;
    v80 = *(_QWORD *)v115;
    do
    {
      for (m = 0; m != v79; ++m)
      {
        if (*(_QWORD *)v115 != v80)
          objc_enumerationMutation(v77);
        v82 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * m);
        objc_msgSend(v82, "_bounds");
        if (v83 < v42)
          objc_msgSend(v69, "addObject:", v82);
      }
      v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v114, v130, 16);
    }
    while (v79);
  }

  +[PKDrawing _boundingBoxForStrokes:](PKDrawing, "_boundingBoxForStrokes:", v68);
  v85 = v84;
  v87 = v86;
  v89 = v88;
  v91 = v90;
  +[PKDrawing _boundingBoxForStrokes:](PKDrawing, "_boundingBoxForStrokes:", v69);
  v93 = v92;
  v95 = v94;
  v97 = v96;
  v99 = v98;
  v141.origin.x = v85;
  v141.origin.y = v87;
  v141.size.width = v89;
  v141.size.height = v91;
  CGRectGetMidX(v141);
  v142.origin.x = v85;
  v142.origin.y = v87;
  v142.size.width = v89;
  v142.size.height = v91;
  v100 = CGRectGetMidY(v142);
  v143.origin.x = v93;
  v143.origin.y = v95;
  v143.size.width = v97;
  v143.size.height = v99;
  CGRectGetMidX(v143);
  v144.origin.x = v93;
  v144.origin.y = v95;
  v144.size.width = v97;
  v144.size.height = v99;
  if (vabdd_f64(v100, CGRectGetMidY(v144)) >= v91)
  {
    v29 = v107;
    objc_msgSend(v107, "unionOrderedSet:", v68);
    v101 = v69;
    v12 = v102;
  }
  else
  {
    objc_msgSend(v68, "intersectOrderedSet:", v69);
    v101 = v68;
    v12 = v102;
    v29 = v107;
  }
  objc_msgSend(v29, "unionOrderedSet:", v101);
  v12[2](v12, v29);

  v17 = v113;
LABEL_81:

}

+ (id)_geometricBasedStrokeClusteringFromPoint:(CGPoint)a3 visibleStrokes:(id)a4 selectionType:(int64_t)a5 inputType:(int64_t)a6
{
  double y;
  double x;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  uint64_t i;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  id v35;
  void *v36;
  id v38;
  int64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;
  CGRect v51;

  y = a3.y;
  x = a3.x;
  v50 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v45;
    if (a6)
      v17 = 10.0;
    else
      v17 = 20.0;
    v18 = 0.0;
    v19 = 0.0;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v45 != v16)
          objc_enumerationMutation(v13);
        v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if (objc_msgSend(v21, "intersectsPoint:boundsOutset:minimumStrokeThreshold:", x, y, v17, v17))
        {
          objc_msgSend(v11, "addObject:", v21);
          objc_msgSend(v21, "_bounds");
          v19 = v19 + v22;
          objc_msgSend(v21, "_bounds");
          v18 = v18 + CGRectGetMidY(v51);
          objc_msgSend(v21, "_groupID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(v21, "_groupID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v24);

          }
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v15);
  }
  else
  {
    v18 = 0.0;
    v19 = 0.0;
  }

  if (objc_msgSend(v12, "count"))
  {
    v38 = v13;
    v39 = a5;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v25 = v13;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v41 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
          objc_msgSend(v30, "_groupID", v38, v39, (_QWORD)v40);
          v31 = objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            v32 = (void *)v31;
            objc_msgSend(v30, "_groupID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v12, "containsObject:", v33);

            if (v34)
              objc_msgSend(v11, "addObject:", v30);
          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v27);
    }

    v13 = v38;
    a5 = v39;
  }
  if (objc_msgSend(v11, "count", v38, v39))
  {
    +[PKClusteringUtility _clusteredStrokesWithInitialStrokes:selectionType:visibleStrokes:approximateLineHeight:approximateLineCenter:](PKClusteringUtility, "_clusteredStrokesWithInitialStrokes:selectionType:visibleStrokes:approximateLineHeight:approximateLineCenter:", v11, a5, v13, v19 / (double)(unint64_t)objc_msgSend(v11, "count"), v18 / (double)(unint64_t)objc_msgSend(v11, "count"));
    v35 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = v11;
  }
  v36 = v35;

  return v36;
}

+ (id)_clusteredStrokesWithInitialStrokes:(id)a3 selectionType:(int64_t)a4 visibleStrokes:(id)a5 approximateLineHeight:(double)a6 approximateLineCenter:(double)a7
{
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  _BOOL4 v39;
  double v40;
  void *v42;
  uint64_t v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  int64_t v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD recta[5];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;

  v85 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithOrderedSet:", v12);
  v67 = (id)objc_claimAutoreleasedReturnValue();
  if (a4 != 1)
  {
    +[PKClusteringUtility estimatedWordDistanceForStrokes:lineHeight:](PKClusteringUtility, "estimatedWordDistanceForStrokes:lineHeight:", v13, a6);
    v15 = 3.0;
    v65 = a4;
    v66 = v12;
    if (a4 == 3)
    {
      v16 = -50.0;
    }
    else if (a4 == 2)
    {
      v16 = -v14;
    }
    else
    {
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
        a6 = a6 + a6;
      else
        a6 = 0.0;
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
        v15 = -10.0;
      else
        v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
        v16 = -50.0;
      else
        v16 = *MEMORY[0x1E0C9D538];
    }
    v68 = v13;
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v18 = v67;
      v70 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
      if (v70)
      {
        v69 = *(_QWORD *)v79;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v79 != v69)
              objc_enumerationMutation(v18);
            recta[0] = v19;
            v20 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v19);
            v74 = 0u;
            v75 = 0u;
            v76 = 0u;
            v77 = 0u;
            v21 = v13;
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v75;
              do
              {
                for (i = 0; i != v23; ++i)
                {
                  if (*(_QWORD *)v75 != v24)
                    objc_enumerationMutation(v21);
                  v26 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
                  if ((objc_msgSend(v18, "containsObject:", v26) & 1) == 0)
                  {
                    objc_msgSend(v20, "_bounds");
                    v87 = CGRectInset(v86, v16, v15);
                    +[PKClusteringUtility constrainRect:](PKClusteringUtility, "constrainRect:", v87.origin.x, v87.origin.y, v87.size.width, v87.size.height);
                    v28 = v27;
                    v30 = v29;
                    v32 = v31;
                    v34 = v33;
                    objc_msgSend(v26, "_bounds");
                    objc_msgSend(a1, "constrainRect:");
                    v92.origin.x = v35;
                    v92.origin.y = v36;
                    v92.size.width = v37;
                    v92.size.height = v38;
                    v88.origin.x = v28;
                    v88.origin.y = v30;
                    v88.size.width = v32;
                    v88.size.height = v34;
                    v39 = CGRectIntersectsRect(v88, v92);
                    objc_msgSend(v26, "_bounds");
                    v40 = vabdd_f64(a7, CGRectGetMidY(v89));
                    if (v39 && v40 < a6)
                      objc_msgSend(v17, "addObject:", v26, v40);
                  }
                }
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
              }
              while (v23);
            }

            v19 = recta[0] + 1;
            v13 = v68;
          }
          while (recta[0] + 1 != v70);
          v70 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
        }
        while (v70);
      }

      if (!objc_msgSend(v17, "count"))
        break;
      objc_msgSend(v17, "array");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObjectsFromArray:", v42);

    }
    if (v65 == 5)
      objc_msgSend(v18, "addObjectsFromArray:", v13);
    +[PKDrawing _boundingBoxForStrokes:](PKDrawing, "_boundingBoxForStrokes:", v18);
    recta[0] = v43;
    v45 = v44;
    v47 = v46;
    v49 = v48;
    memset(&recta[1], 0, 32);
    v72 = 0u;
    v73 = 0u;
    v50 = v13;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &recta[1], v82, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)recta[3];
      do
      {
        for (j = 0; j != v52; ++j)
        {
          if (*(_QWORD *)recta[3] != v53)
            objc_enumerationMutation(v50);
          v55 = *(void **)(recta[2] + 8 * j);
          objc_msgSend(v55, "_bounds");
          v57 = v56;
          v59 = v58;
          v61 = v60;
          v63 = v62;
          *(_QWORD *)&v90.origin.x = recta[0];
          v90.origin.y = v45;
          v90.size.width = v47;
          v90.size.height = v49;
          v91 = CGRectInset(v90, -0.01, -0.01);
          v93.origin.x = v57;
          v93.origin.y = v59;
          v93.size.width = v61;
          v93.size.height = v63;
          if (CGRectContainsRect(v91, v93))
            objc_msgSend(v18, "addObject:", v55);
        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &recta[1], v82, 16);
      }
      while (v52);
    }

    v12 = v66;
  }

  return v67;
}

@end
