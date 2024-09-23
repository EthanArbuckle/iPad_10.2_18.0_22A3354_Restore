@implementation CPCompoundGraphicMaker

- (CPCompoundGraphicMaker)initWithGraphicsIn:(id)a3 ofClass:(Class)a4
{
  CPCompoundGraphicMaker *v6;
  CPCompoundGraphicMaker *v7;
  unsigned int v8;
  id v9;
  uint64_t *shapes;
  uint64_t shapeCount;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CPCompoundGraphicMaker;
  v6 = -[CPCompoundGraphicMaker init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->parentChunk = (CPChunk *)a3;
    v6->shapesAreVectorGraphics = objc_opt_class() == (_QWORD)a4;
    v8 = -[CPObject countOfClass:](v7->parentChunk, "countOfClass:", a4);
    v7->shapeCount = v8;
    if (v8)
    {
      v7->shapes = (id *)malloc_type_malloc(8 * v8, 0x80040B8603338uLL);
      v9 = -[CPObject children](v7->parentChunk, "children");
      shapes = (uint64_t *)v7->shapes;
      shapeCount = v7->shapeCount;
      v12 = objc_msgSend(v9, "count");
      if (v12)
      {
        v13 = 0;
        v14 = &shapes[shapeCount];
        do
        {
          v15 = objc_msgSend(v9, "objectAtIndex:", v13);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            *shapes++ = v15;
            if (shapes == v14)
              break;
          }
          ++v13;
        }
        while (v12 != v13);
      }
      qsort(v7->shapes, v7->shapeCount, 8uLL, (int (__cdecl *)(const void *, const void *))compareZOrder);
    }
  }
  return v7;
}

- (void)dispose
{
  if (!self->disposed)
  {
    -[CPCluster dispose](self->cluster, "dispose");
    free(self->groupInfoArray);
    free(self->shapes);
    self->disposed = 1;
  }
}

- (void)finalize
{
  objc_super v3;

  -[CPCompoundGraphicMaker dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPCompoundGraphicMaker;
  -[CPCompoundGraphicMaker finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  objc_super v3;

  -[CPCompoundGraphicMaker dispose](self, "dispose");

  v3.receiver = self;
  v3.super_class = (Class)CPCompoundGraphicMaker;
  -[CPCompoundGraphicMaker dealloc](&v3, sel_dealloc);
}

- (BOOL)findClusterLevel
{
  double v3;
  double v4;
  unsigned int v5;
  unsigned int v6;
  char v7;
  uint64_t v8;
  CPCluster *cluster;
  double v10;
  double v11;
  BOOL v12;
  CPCluster *v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  int v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->shapesAreVectorGraphics)
    v3 = 0.4;
  else
    v3 = 0.75;
  if (self->shapesAreVectorGraphics)
    v4 = 0.2;
  else
    v4 = 0.5;
  v5 = -[CPCluster levels](self->cluster, "levels");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    while (1)
    {
      v19 = 0u;
      v20 = 0u;
      cluster = self->cluster;
      if (cluster)
      {
        -[CPCluster differenceClusterStatisticsAtIndex:](cluster, "differenceClusterStatisticsAtIndex:", v8);
        v11 = *((double *)&v19 + 1);
        v10 = *(double *)&v20;
      }
      else
      {
        v10 = 0.0;
        v11 = 0.0;
      }
      v12 = v10 > v3 && v11 < v4;
      v7 |= v12;
      if (v11 >= v4 || v10 > v3)
        break;
      v8 = (v8 + 1);
      if (v6 == (_DWORD)v8)
      {
        LODWORD(v8) = v6;
        break;
      }
    }
    if ((v7 & 1) != 0)
    {
      LODWORD(v19) = 1;
      *((double *)&v19 + 1) = v4;
      *(double *)&v20 = v4;
      *((double *)&v20 + 1) = v4;
      v21 = 1;
      v22 = v3;
      v23 = v3;
      v24 = v3;
      LODWORD(v8) = v8
                  + -[CPCluster applyDifferenceHints:count:](self->cluster, "applyDifferenceHints:count:", &v19, 2);
    }
    else if (v8 >= 2)
    {
      v14 = self->cluster;
      if (v14)
      {
        -[CPCluster differenceClusterStatisticsAtIndex:](v14, "differenceClusterStatisticsAtIndex:", (v8 - 1));
        v15 = *(double *)&v18;
        v14 = self->cluster;
      }
      else
      {
        v17 = 0u;
        v18 = 0u;
        v15 = 0.0;
      }
      LODWORD(v8) = 1;
      LODWORD(v19) = 1;
      if (v15 < v4)
        v15 = v4;
      *((double *)&v19 + 1) = v15;
      *(double *)&v20 = v15;
      *((double *)&v20 + 1) = v15;
      -[CPCluster applyDifferenceHints:count:](v14, "applyDifferenceHints:count:", &v19, 1, v17, v18);
    }
  }
  else
  {
    LODWORD(v8) = 0;
  }
  return (_DWORD)v8 != 0;
}

- (void)addGroupInfoWithIndex:(unsigned int)a3 bounds:(CGRect)a4
{
  $DEE827FB4129A4F8C30FAEB1E954309B *groupInfoArray;
  unsigned int groupInfoCount;

  groupInfoArray = self->groupInfoArray;
  groupInfoArray[self->groupInfoCount].var0 = a3;
  groupInfoCount = self->groupInfoCount;
  groupInfoArray[groupInfoCount].var1 = a4;
  self->groupInfoCount = groupInfoCount + 1;
}

- (void)makeCompoundGraphicFromShapesAtIndex:(unsigned int)a3 count:(unsigned int)a4
{
  unsigned int v7;
  char v8;
  uint64_t v9;
  int v10;
  id v11;
  CPCompoundGraphic *v12;

  v12 = objc_alloc_init(CPCompoundGraphic);
  v7 = a4 + a3;
  if (v7 > a3)
  {
    v8 = 0;
    v9 = a3;
LABEL_3:
    v10 = v7 - v9;
    do
    {
      v11 = self->shapes[v9];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[CPChunk addChildrenOf:](v12, "addChildrenOf:", v11);
        objc_msgSend(v11, "remove");
        ++v9;
        v8 = 1;
        if (v7 != (_DWORD)v9)
          goto LABEL_3;
        goto LABEL_10;
      }
      -[CPChunk add:](v12, "add:", v11);
      ++v9;
      --v10;
    }
    while (v10);
    if ((v8 & 1) == 0)
      goto LABEL_11;
LABEL_10:
    -[CPChunk sortUsingSelector:](v12, "sortUsingSelector:", sel_compareZ_);
  }
LABEL_11:
  -[CPChunk add:](self->parentChunk, "add:", v12);

}

- (void)coalesceShapeGroups
{
  unsigned int groupInfoCount;
  $DEE827FB4129A4F8C30FAEB1E954309B *groupInfoArray;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  unsigned int i;
  double *p_var0;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  unsigned int v15;
  unsigned int v16;
  double *v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  groupInfoCount = self->groupInfoCount;
  if (groupInfoCount >= 2)
  {
    groupInfoArray = self->groupInfoArray;
    width = groupInfoArray->var1.size.width;
    height = groupInfoArray->var1.size.height;
    x = groupInfoArray->var1.origin.x;
    y = groupInfoArray->var1.origin.y;
    for (i = 1; i < groupInfoCount; ++i)
    {
      p_var0 = (double *)&groupInfoArray[i].var0;
      v11 = p_var0[1];
      v12 = p_var0[2];
      v13 = p_var0[3];
      v14 = p_var0[4];
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      v20.origin.x = v11;
      v20.origin.y = v12;
      v20.size.width = v13;
      v20.size.height = v14;
      if (CGRectIntersectsRect(v18, v20))
      {
        v15 = groupInfoCount - 1;
        self->groupInfoCount = groupInfoCount - 1;
        groupInfoCount = i;
        v16 = v15 - i;
        if (v16)
        {
          memmove(&groupInfoArray[i], p_var0 + 5, 40 * v16);
          groupInfoArray = self->groupInfoArray;
          groupInfoCount = self->groupInfoCount;
        }
        v19.origin.x = x;
        v19.origin.y = y;
        v19.size.width = width;
        v19.size.height = height;
        v21.origin.x = v11;
        v21.origin.y = v12;
        v21.size.width = v13;
        v21.size.height = v14;
        groupInfoArray[i - 1].var1 = CGRectUnion(v19, v21);
        if (i == 1)
          i = 0;
        else
          i -= 2;
        v17 = (double *)&groupInfoArray[i].var0;
        x = v17[1];
        y = v17[2];
        width = v17[3];
        height = v17[4];
      }
      else
      {
        height = v14;
        width = v13;
        y = v12;
        x = v11;
      }
    }
  }
}

- (BOOL)makeCompoundGraphicsFromShapeGroups
{
  unint64_t groupInfoCount;
  uint64_t v4;
  BOOL v5;
  unint64_t i;
  $DEE827FB4129A4F8C30FAEB1E954309B *groupInfoArray;

  if (self->shapesAreVectorGraphics)
    -[CPCompoundGraphicMaker coalesceShapeGroups](self, "coalesceShapeGroups");
  groupInfoCount = self->groupInfoCount;
  if (groupInfoCount < 2)
    return 0;
  v4 = 0;
  v5 = 0;
  for (i = 1; i < groupInfoCount; ++i)
  {
    groupInfoArray = self->groupInfoArray;
    if (groupInfoArray[v4 + 1].var0 - groupInfoArray[v4].var0 >= 2
      && (!self->shapesAreVectorGraphics
       || groupInfoArray[v4].var1.size.width + groupInfoArray[v4].var1.size.height <= self->pageSpread * 0.4))
    {
      -[CPCompoundGraphicMaker makeCompoundGraphicFromShapesAtIndex:count:](self, "makeCompoundGraphicFromShapesAtIndex:count:");
      groupInfoCount = self->groupInfoCount;
      v5 = 1;
    }
    ++v4;
  }
  return v5;
}

- (BOOL)groupOverlappingGraphics
{
  CPCluster *cluster;
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  CPCluster *v10;
  unsigned int v11;
  unsigned int v12;
  id v13;
  uint64_t v14;
  uint64_t v16;
  double width;
  int v18;
  double x;
  uint64_t v20;
  double y;
  double height;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  unsigned int v36;
  unsigned int v37;
  int v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  cluster = self->cluster;
  if (cluster)
  {
    -[CPCluster largestClusterStatistics](cluster, "largestClusterStatistics");
    v4 = 40 * (v38 + 2);
  }
  else
  {
    v4 = 80;
  }
  self->groupInfoArray = ($DEE827FB4129A4F8C30FAEB1E954309B *)malloc_type_malloc(v4, 0x1000040B4E0BC51uLL);
  v5 = -[CPCluster clusterCount](self->cluster, "clusterCount");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v36 = v5;
    while (1)
    {
      v10 = self->cluster;
      if (!v10)
      {
        v11 = 0;
        v37 = 0;
        goto LABEL_31;
      }
      -[CPCluster clusterStatisticsAtIndex:](v10, "clusterStatisticsAtIndex:", v9);
      v11 = v37;
      if (v37 >= 2)
      {
        v12 = v37 + v8;
        v13 = self->shapes[v8];
        self->groupInfoCount = 0;
        v14 = (v8 + 1);
        if (v14 <= v37 + v8 && v13 != 0)
          break;
      }
LABEL_31:
      v8 = v11 + v8;
      v9 = (v9 + 1);
      if ((_DWORD)v9 == v6)
        return v7 & 1;
    }
    v16 = 0;
    width = 0.0;
    v18 = 1;
    x = INFINITY;
    v20 = v8;
    y = INFINITY;
    height = 0.0;
    while (1)
    {
      if (v18 == 1)
      {
        objc_msgSend(v13, "renderedBounds");
        x = v23;
        y = v24;
        width = v25;
        height = v26;
        v16 = objc_msgSend(v13, "zOrder");
      }
      if (v14 >= v12)
        break;
      v13 = self->shapes[v14];
      if (!v13)
        goto LABEL_23;
      if (!self->shapesAreVectorGraphics)
        goto LABEL_21;
      if (objc_msgSend(v13, "zOrder") > v16 + 1)
        goto LABEL_23;
      if (!self->shapesAreVectorGraphics)
        goto LABEL_21;
      objc_msgSend(v13, "renderedBounds");
      v42.origin.x = v27;
      v42.origin.y = v28;
      v42.size.width = v29;
      v42.size.height = v30;
      v39.origin.x = x;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = height;
      if (CGRectIntersectsRect(v39, v42))
      {
LABEL_21:
        objc_msgSend(v13, "renderedBounds");
        v43.origin.x = v31;
        v43.origin.y = v32;
        v43.size.width = v33;
        v43.size.height = v34;
        v40.origin.x = x;
        v40.origin.y = y;
        v40.size.width = width;
        v40.size.height = height;
        v41 = CGRectUnion(v40, v43);
        x = v41.origin.x;
        y = v41.origin.y;
        width = v41.size.width;
        height = v41.size.height;
        ++v18;
        v16 = objc_msgSend(v13, "zOrder");
        goto LABEL_25;
      }
      -[CPCompoundGraphicMaker addGroupInfoWithIndex:bounds:](self, "addGroupInfoWithIndex:bounds:", v20, x, y, width, height);
LABEL_24:
      v18 = 1;
      v20 = v14;
LABEL_25:
      v14 = (v20 + v18);
      if (v14 > v12 || !v13)
      {
        v6 = v36;
        v11 = v37;
        goto LABEL_31;
      }
    }
    v13 = 0;
LABEL_23:
    -[CPCompoundGraphicMaker addGroupInfoWithIndex:bounds:](self, "addGroupInfoWithIndex:bounds:", v20, x, y, width, height);
    -[CPCompoundGraphicMaker addGroupInfoWithIndex:bounds:](self, "addGroupInfoWithIndex:bounds:", v14, INFINITY, INFINITY, 0.0, 0.0);
    v7 |= -[CPCompoundGraphicMaker makeCompoundGraphicsFromShapeGroups](self, "makeCompoundGraphicsFromShapeGroups");
    self->groupInfoCount = 0;
    goto LABEL_24;
  }
  LOBYTE(v7) = 0;
  return v7 & 1;
}

- (BOOL)makeCompoundGraphics
{
  BOOL v2;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  char *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  uint64_t i;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  char isKindOfClass;
  char v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CPCluster *v50;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  if (self->shapeCount < 2)
    return 0;
  objc_msgSend(-[CPObject page](self->parentChunk, "page"), "pageCropBox");
  v6 = v4 + v5;
  if (v4 + v5 <= 0.0)
    v6 = 1.0;
  self->pageSpread = v6;
  v7 = self->shapeCount - 1;
  v8 = (char *)malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
  objc_msgSend(*self->shapes, "renderedBounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (self->shapesAreVectorGraphics)
  {
    if ((_DWORD)v7)
    {
      v17 = 0;
      do
      {
        objc_msgSend(self->shapes[v17 + 1], "renderedBounds");
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v52.origin.x = v10;
        v52.origin.y = v12;
        v52.size.width = v14;
        v52.size.height = v16;
        v56.origin.x = v19;
        v56.origin.y = v21;
        v56.size.width = v23;
        v56.size.height = v25;
        v53 = CGRectUnion(v52, v56);
        *(double *)&v8[v17 * 8] = (v53.size.width + v53.size.height) / self->pageSpread;
        ++v17;
        v16 = v25;
        v14 = v23;
        v12 = v21;
        v10 = v19;
      }
      while (v7 != v17);
    }
    goto LABEL_29;
  }
  if ((_DWORD)v7)
  {
    for (i = 0; v7 != i; ++i)
    {
      v27 = v10;
      v28 = v12;
      v29 = v14;
      v30 = v16;
      objc_msgSend(self->shapes[i + 1], "renderedBounds");
      v10 = v31;
      v12 = v32;
      v14 = v33;
      v16 = v34;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      objc_opt_class();
      v36 = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        if ((v36 & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_22;
LABEL_20:
          v37 = v10;
          v38 = v12;
          v39 = v14;
          v40 = v16;
          v41 = v27;
          v42 = v28;
          v43 = v29;
          v44 = v30;
          goto LABEL_21;
        }
        if (fabs(v29 * v30) >= fabs(v14 * v16))
          goto LABEL_20;
      }
      else if ((v36 & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
LABEL_22:
        v54.origin.x = v27;
        v54.origin.y = v28;
        v54.size.width = v29;
        v54.size.height = v30;
        v57.origin.x = v10;
        v57.origin.y = v12;
        v57.size.width = v14;
        v57.size.height = v16;
        v55 = CGRectIntersection(v54, v57);
        v46 = fabs(v55.size.width * v55.size.height);
        v47 = fabs(v29 * v30) + fabs(v14 * v16) - v46;
        if (v47 >= v46)
          v48 = v47;
        else
          v48 = v46;
        v49 = 1.0;
        if (v48 > 0.0)
          v49 = 1.0 - v46 / v48;
        *(double *)&v8[i * 8] = v49;
        continue;
      }
      v37 = v27;
      v38 = v28;
      v39 = v29;
      v40 = v30;
      v41 = v10;
      v42 = v12;
      v43 = v14;
      v44 = v16;
LABEL_21:
      nonOverlapOfFirst(v37, v38, v39, v40, v41, v42, v43, v44);
      *(_QWORD *)&v8[i * 8] = v45;
    }
  }
LABEL_29:
  v50 = -[CPCluster initWithProfile:]([CPCluster alloc], "initWithProfile:", &kCPClusterProfileCompoundGraphic);
  self->cluster = v50;
  -[CPCluster findClustersFromDifferences:count:](v50, "findClustersFromDifferences:count:", v8, v7);
  if (-[CPCompoundGraphicMaker findClusterLevel](self, "findClusterLevel"))
    v2 = -[CPCompoundGraphicMaker groupOverlappingGraphics](self, "groupOverlappingGraphics");
  else
    v2 = 0;
  free(v8);
  return v2;
}

+ (BOOL)makeCompoundGraphicsInZonesOf:(id)a3
{
  CPCompoundGraphicMaker *v4;
  _BOOL4 v5;
  CPCompoundGraphicMaker *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;

  v4 = -[CPCompoundGraphicMaker initWithGraphicsIn:ofClass:]([CPCompoundGraphicMaker alloc], "initWithGraphicsIn:ofClass:", a3, objc_opt_class());
  v5 = -[CPCompoundGraphicMaker makeCompoundGraphics](v4, "makeCompoundGraphics");
  -[CPCompoundGraphicMaker dispose](v4, "dispose");

  v6 = -[CPCompoundGraphicMaker initWithGraphicsIn:ofClass:]([CPCompoundGraphicMaker alloc], "initWithGraphicsIn:ofClass:", a3, objc_opt_class());
  v7 = -[CPCompoundGraphicMaker makeCompoundGraphics](v6, "makeCompoundGraphics") || v5;
  -[CPCompoundGraphicMaker dispose](v6, "dispose");

  v8 = (void *)objc_msgSend(a3, "children");
  v9 = objc_msgSend(v8, "count");
  if (v9)
  {
    for (i = 0; i != v9; ++i)
    {
      v11 = objc_msgSend(v8, "objectAtIndex:", i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 |= +[CPCompoundGraphicMaker makeCompoundGraphicsInZonesOf:](CPCompoundGraphicMaker, "makeCompoundGraphicsInZonesOf:", v11);
    }
  }
  return v7 & 1;
}

@end
