@implementation AXVisualElementGrouper

- (AXVisualElementGrouper)initWithHeuristics:(int64_t)a3
{
  AXVisualElementGrouper *v4;
  AXVisualElementGrouper *v5;
  BOOL v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXVisualElementGrouper;
  v4 = -[AXElementGrouper initWithHeuristics:](&v9, sel_initWithHeuristics_);
  v5 = v4;
  if (v4)
    v6 = (unint64_t)a3 > 2;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = dbl_1B54F0270[a3];
    -[AXVisualElementGrouper setMaximumNeighbourDistance:](v4, "setMaximumNeighbourDistance:", dbl_1B54F0258[a3]);
    -[AXVisualElementGrouper setMaximumDistanceForAligningEdges:](v5, "setMaximumDistanceForAligningEdges:", v7);
  }
  return v5;
}

- (id)_groupablesForItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGFloat x;
  CGFloat y;
  double v11;
  CGFloat v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat Height;
  CGFloat v26;
  double v27;
  double Width;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double MaxY;
  double v35;
  _BOOL4 v36;
  _BOOL4 v37;
  CGFloat v38;
  CGFloat v39;
  double v41;
  double v42;
  double v43;
  double v44;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  id obj;
  CGFloat v62;
  double v63;
  double v64;
  CGFloat v65;
  double v66;
  double v67;
  double MinX;
  double MaxX;
  double MinY;
  double v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  double r1;
  objc_super v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  objc_super v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;

  v90 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
  if (!v6)
  {
    v14 = v60;
    goto LABEL_55;
  }
  v7 = v6;
  v8 = 0;
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v13 = *(_QWORD *)v85;
  v72 = v11;
  v73 = v12;
  v74 = y;
  v75 = *MEMORY[0x1E0C9D628];
  v14 = v60;
  do
  {
    v15 = 0;
    do
    {
      r1 = v12;
      if (*(_QWORD *)v85 != v13)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v15);
      objc_msgSend(v16, "frame");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v91.origin.x = x;
      v91.origin.y = y;
      v91.size.width = v12;
      v91.size.height = v11;
      v110.origin.y = v74;
      v110.origin.x = v75;
      v110.size.height = v72;
      v110.size.width = v73;
      if (CGRectEqualToRect(v91, v110))
      {
        objc_msgSend(v5, "addObject:", v16);
        v11 = v24;
        v12 = v22;
        y = v20;
        x = v18;
        goto LABEL_49;
      }
      v92.origin.x = v18;
      v65 = v20;
      v92.origin.y = v20;
      v92.size.width = v22;
      v92.size.height = v24;
      Height = CGRectGetHeight(v92);
      v26 = v18;
      v76 = v18;
      v27 = Height;
      v93.origin.x = v26;
      v93.origin.y = v20;
      v93.size.width = v22;
      v93.size.height = v24;
      Width = CGRectGetWidth(v93);
      if (v27 >= Width)
        v29 = Width;
      else
        v29 = v27;
      v94.origin.x = x;
      v94.origin.y = y;
      v94.size.width = v12;
      v94.size.height = v11;
      v30 = CGRectGetHeight(v94);
      v95.origin.x = x;
      v95.origin.y = y;
      v95.size.width = v12;
      v95.size.height = v11;
      v31 = CGRectGetWidth(v95);
      if (v30 < v31)
        v31 = v30;
      v32 = (v29 + v31) * 0.5;
      -[AXVisualElementGrouper maximumDistanceForAligningEdges](self, "maximumDistanceForAligningEdges");
      if (v33 >= v32)
        v33 = v32;
      v67 = v33;
      v96.origin.x = x;
      v96.origin.y = y;
      v96.size.width = v12;
      v96.size.height = v11;
      MinX = CGRectGetMinX(v96);
      v97.origin.x = v76;
      v97.origin.y = v65;
      v97.size.width = v22;
      v97.size.height = v24;
      v66 = vabdd_f64(MinX, CGRectGetMinX(v97));
      v98.origin.x = x;
      v98.origin.y = y;
      v98.size.width = v12;
      v98.size.height = v11;
      MaxX = CGRectGetMaxX(v98);
      v99.origin.x = v76;
      v99.origin.y = v65;
      v99.size.width = v22;
      v99.size.height = v24;
      v64 = vabdd_f64(MaxX, CGRectGetMaxX(v99));
      v100.origin.x = x;
      v100.origin.y = y;
      v100.size.width = v12;
      v100.size.height = v11;
      MinY = CGRectGetMinY(v100);
      v101.origin.x = v76;
      v101.origin.y = v65;
      v101.size.width = v22;
      v101.size.height = v24;
      v62 = v11;
      v63 = vabdd_f64(MinY, CGRectGetMinY(v101));
      v71 = x;
      v102.origin.x = x;
      v102.origin.y = y;
      v102.size.width = v12;
      v102.size.height = v11;
      MaxY = CGRectGetMaxY(v102);
      v103.origin.x = v76;
      v103.origin.y = v65;
      v103.size.width = v22;
      v103.size.height = v24;
      v35 = vabdd_f64(MaxY, CGRectGetMaxY(v103));
      v36 = v64 < v67 && v66 < v67;
      v37 = v35 < v67 && v63 < v67;
      if (objc_msgSend(v16, "isGroup"))
      {
        v38 = v71;
        v39 = v76;
        if (!objc_msgSend(v16, "canBeGroupedWithOtherGroupables") || !v36 && !v37)
          goto LABEL_46;
      }
      else
      {
        v38 = v71;
        v39 = v76;
        if (!v36 && !v37)
          goto LABEL_46;
      }
      if (v8 != 2 && v37)
      {
        -[AXVisualElementGrouper maximumNeighbourDistance](self, "maximumNeighbourDistance");
        if (v41 >= v22 + v22)
          v42 = v22 + v22;
        else
          v42 = v41;
        v104.origin.x = v38;
        v104.origin.y = y;
        v104.size.height = v62;
        v104.size.width = r1;
        v111.origin.x = v39;
        v111.origin.y = v65;
        v111.size.width = v22;
        v111.size.height = v24;
        v105 = CGRectUnion(v104, v111);
        v43 = vabdd_f64(v105.size.width, r1);
        v44 = v22 + v42;
      }
      else
      {
        if (v8 == 1 || !v36)
        {
LABEL_46:
          if (objc_msgSend(v5, "count"))
            objc_msgSend(v60, "addObject:", v5);
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v16);
          v48 = objc_claimAutoreleasedReturnValue();

          v8 = 0;
          v5 = (void *)v48;
          v11 = v24;
          v12 = v22;
          y = v65;
          x = v39;
          goto LABEL_49;
        }
        -[AXVisualElementGrouper maximumNeighbourDistance](self, "maximumNeighbourDistance");
        if (v46 >= v24 + v24)
          v47 = v24 + v24;
        else
          v47 = v46;
        v106.origin.x = v38;
        v106.origin.y = y;
        v106.size.width = r1;
        v106.size.height = v11;
        v112.origin.x = v39;
        v112.origin.y = v65;
        v112.size.width = v22;
        v112.size.height = v24;
        v107 = CGRectUnion(v106, v112);
        v43 = vabdd_f64(v107.size.height, v11);
        v44 = v24 + v47;
      }
      if (v43 >= v44)
        goto LABEL_46;
      v108.origin.x = v38;
      v108.origin.y = y;
      v108.size.height = v62;
      v108.size.width = r1;
      v113.origin.x = v39;
      v113.origin.y = v65;
      v113.size.width = v22;
      v113.size.height = v24;
      v109 = CGRectUnion(v108, v113);
      x = v109.origin.x;
      y = v109.origin.y;
      v12 = v109.size.width;
      v11 = v109.size.height;
      objc_msgSend(v5, "addObject:", v16);
      if (!v8)
      {
        if (!v36 || v37)
          v8 = v37 && !v36;
        else
          v8 = 2;
      }
LABEL_49:
      ++v15;
    }
    while (v7 != v15);
    v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
    v7 = v49;
  }
  while (v49);
LABEL_55:

  if (objc_msgSend(v5, "count"))
    objc_msgSend(v14, "addObject:", v5);
  if (objc_msgSend(v14, "count") == 1)
  {
    objc_msgSend(v14, "lastObject");
    v50 = (id)objc_claimAutoreleasedReturnValue();
    v83.receiver = self;
    v83.super_class = (Class)AXVisualElementGrouper;
    -[AXElementGrouper _groupablesForItems:](&v83, sel__groupablesForItems_, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v50 = v14;
    v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v53; ++i)
        {
          if (*(_QWORD *)v80 != v54)
            objc_enumerationMutation(v50);
          v56 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
          if (objc_msgSend(v56, "count") == 1)
          {
            objc_msgSend(v56, "firstObject");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "addObject:", v57);
          }
          else
          {
            v78.receiver = self;
            v78.super_class = (Class)AXVisualElementGrouper;
            -[AXElementGrouper _groupablesForItems:](&v78, sel__groupablesForItems_, v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            +[AXElementGroup groupWithElements:](AXElementGroup, "groupWithElements:", v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "setUserDefinedScanningBehaviorTraits:", 16);
            objc_msgSend(v51, "addObject:", v58);

          }
        }
        v53 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
      }
      while (v53);
      v14 = v60;
    }
  }

  return v51;
}

- (double)maximumNeighbourDistance
{
  return self->_maximumNeighbourDistance;
}

- (void)setMaximumNeighbourDistance:(double)a3
{
  self->_maximumNeighbourDistance = a3;
}

- (double)maximumDistanceForAligningEdges
{
  return self->_maximumDistanceForAligningEdges;
}

- (void)setMaximumDistanceForAligningEdges:(double)a3
{
  self->_maximumDistanceForAligningEdges = a3;
}

@end
