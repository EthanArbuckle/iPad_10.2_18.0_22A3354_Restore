@implementation CPGuideFinder

- (CPGuideFinder)initWithContentZone:(id)a3
{
  CPGuideFinder *v4;
  CPGuideFinder *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPGuideFinder;
  v4 = -[CPGuideFinder init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->contentZone = (CPZone *)a3;
    v4->gutters = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5->leftGuides = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5->rightGuides = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v5;
}

- (void)dispose
{
  if (self->contentZone)
  {
    -[CPCluster dispose](self->anchors, "dispose");
    -[CPCluster dispose](self->rightHandSides, "dispose");
    free(self->anchorArray);
    free(self->rightHandSideArray);
    free(self->crossingWordArray);
    self->contentZone = 0;
  }
}

- (void)finalize
{
  objc_super v3;

  -[CPGuideFinder dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPGuideFinder;
  -[CPGuideFinder finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  objc_super v3;

  -[CPGuideFinder dispose](self, "dispose");

  v3.receiver = self;
  v3.super_class = (Class)CPGuideFinder;
  -[CPGuideFinder dealloc](&v3, sel_dealloc);
}

- (double)medianFontSizeOfFirstCharacter
{
  return self->medianFontSizeOfFirstCharacter;
}

- (double)medianFontSizeOfLastCharacter
{
  return self->medianFontSizeOfLastCharacter;
}

- (void)getWordEdges
{
  unsigned int v3;
  void *v4;
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;

  v3 = -[CPZone wordCount](self->contentZone, "wordCount");
  self->countOfWordsInZone = v3;
  if (v3)
  {
    self->anchorArray = (double *)malloc_type_malloc(8 * v3, 0x100004000313F17uLL);
    self->rightHandSideArray = (double *)malloc_type_malloc(8 * self->countOfWordsInZone, 0x100004000313F17uLL);
    v4 = malloc_type_malloc(8 * self->countOfWordsInZone, 0x100004000313F17uLL);
    v5 = malloc_type_malloc(8 * self->countOfWordsInZone, 0x100004000313F17uLL);
    v6 = *(_OWORD *)&self->anchorArray;
    v7 = v4;
    v8 = v5;
    -[CPZone mapToWordsWithIndex:passing:](self->contentZone, "mapToWordsWithIndex:passing:", accumulateWordAlignmentData, &v6);
    qsort(self->anchorArray, self->countOfWordsInZone, 8uLL, (int (__cdecl *)(const void *, const void *))compareDouble);
    qsort(self->rightHandSideArray, self->countOfWordsInZone, 8uLL, (int (__cdecl *)(const void *, const void *))compareDouble);
    self->medianFontSizeOfFirstCharacter = medianDouble((uint64_t)v4, self->countOfWordsInZone);
    self->medianFontSizeOfLastCharacter = medianDouble((uint64_t)v5, self->countOfWordsInZone);
    free(v5);
    free(v4);
  }
}

- (BOOL)addStripTo:(id)a3 bottom:(double)a4 left:(double)a5 top:(double)a6 right:(double)a7
{
  char v7;
  void *v9;
  double v11;
  double v12;
  double v13;
  double v14;

  v11 = a5;
  v12 = a4;
  v13 = a7 - a5;
  v14 = a6 - a4;
  v7 = (vabdd_f64(a6, a4) == INFINITY) | (fabs(a4) == INFINITY) | (fabs(a5) == INFINITY) | (vabdd_f64(a7, a5) == INFINITY);
  if ((v7 & 1) == 0)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B18]), "initWithBytes:objCType:", &v11, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    objc_msgSend(a3, "addObject:", v9, *(_QWORD *)&v11, *(_QWORD *)&v12, *(_QWORD *)&v13, *(_QWORD *)&v14);

  }
  return v7 ^ 1;
}

- (void)setAlignForWordWithExtent:(id *)a3 stripArray:(id)a4 stripMax:(double)a5
{
  int v5;

  if (self->leftGuides == a4)
  {
    v5 = 1;
  }
  else if (self->rightGuides == a4)
  {
    v5 = 2;
  }
  else if (a3->var0 >= a5)
  {
    v5 = 4;
  }
  else
  {
    v5 = 8;
  }
  *a3->var5 |= v5;
}

- (void)subdivideStripInto:(id)a3 from:(double)a4 to:(double)a5 borderedBy:(id *)a6 ofCount:(unsigned int)a7 crossedBy:(id *)a8 ofCount:(unsigned int)a9
{
  unsigned int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  CPPDFStyle *var6;
  double v22;
  double v23;
  double v24;
  unsigned int v25;
  uint64_t v26;
  $8F0B7056700046E0BB8E7B3C5F77D73E *v27;
  unsigned int v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t v32;
  $8F0B7056700046E0BB8E7B3C5F77D73E *v33;
  double var2;
  double var3;
  double var1;
  double var0;
  BOOL v38;
  int v39;
  int var4;
  int v41;
  char v42;
  uint64_t v43;
  unint64_t v44;
  $8F0B7056700046E0BB8E7B3C5F77D73E *v45;
  uint64_t v46;
  unint64_t v47;
  $8F0B7056700046E0BB8E7B3C5F77D73E *v48;
  uint64_t v49;
  double *v50;
  int v51;
  int v52;
  unint64_t v53;
  int v54;
  $8F0B7056700046E0BB8E7B3C5F77D73E *v55;
  double *p_var3;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;

  qsort(a6, a7, 0x38uLL, (int (__cdecl *)(const void *, const void *))compareWordExtentBottomAscendingLeftDescending);
  v59 = a9;
  qsort(a8, a9, 0x38uLL, (int (__cdecl *)(const void *, const void *))compareWordExtentBottomAscendingLeftDescending);
  if (a7)
  {
    v16 = a7;
    v17 = 0;
    v18 = 0;
    LODWORD(v19) = 0;
    v20 = 0;
    var6 = 0;
    v22 = 0.0;
    v23 = 0.0;
    v55 = a8;
    p_var3 = &a8->var3;
    v24 = 0.0;
    v58 = v16;
    v25 = a9;
    do
    {
      v26 = (int)v20;
      v27 = &a6[v20];
      if (v16 <= v20 + 1)
        v28 = v20 + 1;
      else
        v28 = v16;
      v57 = v28;
      v29 = v18;
      v30 = v23;
      v31 = v24;
      while (1)
      {
        v24 = v31;
        v23 = v30;
        v18 = v29;
        v32 = v26;
        v33 = &a6[v26];
        var2 = v33->var2;
        var3 = v33->var3;
        var0 = v33->var0;
        var1 = v33->var1;
        if ((int)v18 < 1)
          goto LABEL_44;
        if ((_DWORD)v19 != v25 && var3 > v22)
          break;
        v38 = v18 <= 1 && v17 <= 0;
        v39 = !v38;
        var4 = a6[v26].var4;
        if ((var4 & 2) != 0 && var1 <= a5)
          v41 = 1;
        else
          v41 = var4 & (var0 >= a4);
        if (self->gutters == a3
          || (v41 & v39 & 1) != 0
          || (v42 = CPPDFStyleEqual((uint64_t)var6, (uint64_t)a6[v32].var6, 0xFFFF), v16 = v58, v25 = v59, (v42 & 1) != 0))
        {
          if (var3 <= v23)
            v30 = v23;
          else
            v30 = var3;
          v29 = (v18 + 1);
          v31 = v24;
        }
        else
        {
          v29 = 1;
          if (v18 < 5)
          {
            v17 = 0;
            v31 = var2;
            v30 = var3;
          }
          else
          {
            v31 = var2;
            v30 = var3;
            v38 = v17 < 1;
            v17 = 0;
            if (!v38)
            {
              if (-[CPGuideFinder addStripTo:bottom:left:top:right:](self, "addStripTo:bottom:left:top:right:", a3, v24, a4, v23, a5))
              {
                v43 = v18;
                v44 = v18 + 1;
                v45 = &v27[-v43];
                do
                {
                  -[CPGuideFinder setAlignForWordWithExtent:stripArray:stripMax:](self, "setAlignForWordWithExtent:stripArray:stripMax:", v45, a3, a5);
                  --v44;
                  ++v45;
                }
                while (v44 > 1);
              }
              v17 = 0;
              v29 = 1;
              v31 = var2;
              v30 = var3;
              v16 = v58;
              v25 = v59;
            }
          }
        }
        v17 += v41;
        var6 = a6[v32].var6;
        v26 = v32 + 1;
        ++v27;
        if ((int)v32 + 1 >= v16)
        {
          v24 = v31;
          v23 = v30;
          v18 = v29;
          v20 = v57;
          goto LABEL_45;
        }
      }
      if (v18 < 5 || v17 < 1)
      {
        v17 = 0;
LABEL_44:
        v20 = v26;
        goto LABEL_45;
      }
      if (-[CPGuideFinder addStripTo:bottom:left:top:right:](self, "addStripTo:bottom:left:top:right:", a3, v31, a4, v30, a5))
      {
        v46 = v18;
        v47 = v18 + 1;
        v48 = &v27[-v46];
        do
        {
          -[CPGuideFinder setAlignForWordWithExtent:stripArray:stripMax:](self, "setAlignForWordWithExtent:stripArray:stripMax:", v48, a3, a5);
          --v47;
          ++v48;
        }
        while (v47 > 1);
        v18 = 0;
      }
      v17 = 0;
      v20 = v32;
      v16 = v58;
      v25 = v59;
LABEL_45:
      if (v20 == v16)
        break;
      if (v19 < v25)
      {
        v49 = ~(_DWORD)v19 + v25 + (uint64_t)(int)v19;
        v50 = &p_var3[7 * (int)v19];
        v19 = (int)v19;
        while (*v50 <= var2)
        {
          ++v19;
          v50 += 7;
          if (v19 >= v25)
          {
            v22 = v55[v49].var2;
            LODWORD(v19) = v25;
            goto LABEL_60;
          }
        }
        v22 = v55[v19].var2;
        if (var3 <= v22)
        {
          v51 = a6[v32].var4;
          if ((v51 & 2) != 0 && var1 <= a5 || (v51 & 1) != 0 && var0 >= a4)
            v17 = 1;
          var6 = a6[v32].var6;
          v18 = 1;
          v24 = var2;
          v23 = var3;
        }
        ++v20;
      }
      if ((_DWORD)v19 == v25)
      {
LABEL_60:
        v52 = a6[v32].var4;
        if ((v52 & 2) != 0 && var1 <= a5 || (v52 & 1) != 0 && var0 >= a4)
          v17 = 1;
        var6 = a6[v32].var6;
        ++v20;
        v18 = 1;
        v24 = var2;
        v23 = var3;
      }
    }
    while (v20 < v16 && v19 <= v25);
    if ((int)v18 >= 5
      && v17 >= 1
      && -[CPGuideFinder addStripTo:bottom:left:top:right:](self, "addStripTo:bottom:left:top:right:", a3, v24, a4, v23, a5))
    {
      v53 = v18 + 1;
      v54 = v58 - v18;
      do
      {
        -[CPGuideFinder setAlignForWordWithExtent:stripArray:stripMax:](self, "setAlignForWordWithExtent:stripArray:stripMax:", &a6[v54], a3, a5);
        --v53;
        ++v54;
      }
      while (v53 > 1);
    }
  }
}

- (void)subdivideGutterFrom:(unsigned int)a3 to:(unsigned int)a4
{
  uint64_t v4;
  __int128 v6;
  CPCluster *rightHandSides;
  CPCluster *anchors;
  int v9;
  void *v10;
  $8F0B7056700046E0BB8E7B3C5F77D73E *crossingWordArray;
  _QWORD v12[2];
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[32];
  _OWORD v17[2];

  v4 = *(_QWORD *)&a4;
  v6 = 0uLL;
  memset(v17, 0, sizeof(v17));
  rightHandSides = self->rightHandSides;
  if (rightHandSides)
  {
    -[CPCluster clusterStatisticsAtIndex:](rightHandSides, "clusterStatisticsAtIndex:", *(_QWORD *)&a3);
    v6 = 0uLL;
  }
  *(_OWORD *)v16 = v6;
  *(_OWORD *)&v16[16] = v6;
  anchors = self->anchors;
  if (anchors)
  {
    -[CPCluster clusterStatisticsAtIndex:](anchors, "clusterStatisticsAtIndex:", v4);
    v9 = *(_DWORD *)v16;
  }
  else
  {
    v9 = 0;
  }
  v10 = malloc_type_malloc(56 * (v9 + LODWORD(v17[0])), 0x1030040FAAEECD9uLL);
  crossingWordArray = self->crossingWordArray;
  v12[0] = v10;
  v12[1] = crossingWordArray;
  v13 = 0;
  LODWORD(v13) = self->countOfWordsInZone;
  v14 = *(_OWORD *)((char *)v17 + 8);
  v15 = *(_OWORD *)&v16[8];
  -[CPZone mapToWordPairsWithIndex:passing:](self->contentZone, "mapToWordPairsWithIndex:passing:", accumulateGutterIntersections, v12);
  if (*(_DWORD *)v16 + LODWORD(v17[0]) < -1227133513 * ((v12[0] - (_QWORD)v10) >> 3))
    __assert_rtn("-[CPGuideFinder subdivideGutterFrom:to:]", "CPGuideFinder.m", 642, "borderWordCount <= rhsStats.count + anchorStats.count");
  -[CPGuideFinder subdivideStripInto:from:to:borderedBy:ofCount:crossedBy:ofCount:](self, "subdivideStripInto:from:to:borderedBy:ofCount:crossedBy:ofCount:", self->gutters, v10, *((double *)&v14 + 1), *(double *)&v15);
  free(v10);
}

- (void)subdivideLeftGuideAt:(unsigned int)a3
{
  size_t anchors;
  void *v5;
  $8F0B7056700046E0BB8E7B3C5F77D73E *crossingWordArray;
  _QWORD v7[2];
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  __int128 v13;
  __int128 v14;

  v13 = 0u;
  v14 = 0u;
  anchors = (size_t)self->anchors;
  if (anchors)
  {
    objc_msgSend((id)anchors, "clusterStatisticsAtIndex:", *(_QWORD *)&a3);
    anchors = 56 * v13;
  }
  v5 = malloc_type_malloc(anchors, 0x1030040FAAEECD9uLL);
  crossingWordArray = self->crossingWordArray;
  v7[0] = v5;
  v7[1] = crossingWordArray;
  v8 = 0;
  LODWORD(v8) = self->countOfWordsInZone;
  v9 = *((_QWORD *)&v13 + 1);
  v10 = v14;
  v11 = *((double *)&v13 + 1);
  v12 = *(double *)&v14;
  -[CPZone mapToWordPairsWithIndex:passing:](self->contentZone, "mapToWordPairsWithIndex:passing:", accumulateLeftGuideIntersections, v7);
  if (v13 < -1227133513 * ((v7[0] - (_QWORD)v5) >> 3))
    __assert_rtn("-[CPGuideFinder subdivideLeftGuideAt:]", "CPGuideFinder.m", 669, "borderWordCount <= anchorStats.count");
  -[CPGuideFinder subdivideStripInto:from:to:borderedBy:ofCount:crossedBy:ofCount:](self, "subdivideStripInto:from:to:borderedBy:ofCount:crossedBy:ofCount:", self->leftGuides, v5, v11, v12);
  free(v5);
}

- (void)subdivideRightGuideAt:(unsigned int)a3
{
  size_t rightHandSides;
  void *v5;
  $8F0B7056700046E0BB8E7B3C5F77D73E *crossingWordArray;
  _QWORD v7[2];
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;

  v13 = 0u;
  v14 = 0u;
  rightHandSides = (size_t)self->rightHandSides;
  if (rightHandSides)
  {
    objc_msgSend((id)rightHandSides, "clusterStatisticsAtIndex:", *(_QWORD *)&a3);
    rightHandSides = 56 * v13;
  }
  v5 = malloc_type_malloc(rightHandSides, 0x1030040FAAEECD9uLL);
  crossingWordArray = self->crossingWordArray;
  v7[0] = v5;
  v7[1] = crossingWordArray;
  v8 = 0;
  LODWORD(v8) = self->countOfWordsInZone;
  v9 = *((double *)&v13 + 1);
  v10 = *(double *)&v14;
  v11 = *((_QWORD *)&v13 + 1);
  v12 = v14;
  -[CPZone mapToWordPairsWithIndex:passing:](self->contentZone, "mapToWordPairsWithIndex:passing:", accumulateRightGuideIntersections, v7);
  if (v13 < -1227133513 * ((v7[0] - (_QWORD)v5) >> 3))
    __assert_rtn("-[CPGuideFinder subdivideRightGuideAt:]", "CPGuideFinder.m", 696, "borderWordCount <= rhsStats.count");
  -[CPGuideFinder subdivideStripInto:from:to:borderedBy:ofCount:crossedBy:ofCount:](self, "subdivideStripInto:from:to:borderedBy:ofCount:crossedBy:ofCount:", self->rightGuides, v5, v9, v10);
  free(v5);
}

- (void)findWordEdgeClusters
{
  uint64_t v3;
  double v4;
  double v5;
  uint64_t countOfWordsInZone;

  if (!self->anchors)
  {
    -[CPGuideFinder getWordEdges](self, "getWordEdges");
    self->anchors = -[CPCluster initWithProfile:]([CPCluster alloc], "initWithProfile:", &kCPClusterProfileWordAlignment);
    self->rightHandSides = -[CPCluster initWithProfile:]([CPCluster alloc], "initWithProfile:", &kCPClusterProfileWordAlignment);
    v3 = (uint64_t)rint(fmax((double)objc_msgSend(-[CPZone textLinesInZone](self->contentZone, "textLinesInZone"), "count")* 0.05, 5.0));
    v4 = self->medianFontSizeOfFirstCharacter * 0.05;
    v5 = self->medianFontSizeOfLastCharacter * 0.2;
    -[CPCluster setMinimumClusterSize:](self->anchors, "setMinimumClusterSize:", v3);
    -[CPCluster setMaximumClusterSpread:](self->anchors, "setMaximumClusterSpread:", v4);
    -[CPCluster setMinimumClusterSize:](self->rightHandSides, "setMinimumClusterSize:", v3);
    -[CPCluster setMaximumClusterSpread:](self->rightHandSides, "setMaximumClusterSpread:", v5);
    -[CPCluster findDensityClusters:count:](self->anchors, "findDensityClusters:count:", self->anchorArray, self->countOfWordsInZone);
    -[CPCluster findDensityClusters:count:](self->rightHandSides, "findDensityClusters:count:", self->rightHandSideArray, self->countOfWordsInZone);
    if (-[CPCluster clusterCount](self->anchors, "clusterCount")
      || -[CPCluster clusterCount](self->rightHandSides, "clusterCount"))
    {
      countOfWordsInZone = self->countOfWordsInZone;
      if ((_DWORD)countOfWordsInZone)
        self->crossingWordArray = ($8F0B7056700046E0BB8E7B3C5F77D73E *)malloc_type_malloc(56 * countOfWordsInZone, 0x1030040FAAEECD9uLL);
    }
  }
}

- (void)findGutters
{
  double medianFontSizeOfFirstCharacter;
  double medianFontSizeOfLastCharacter;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  CPCluster *anchors;
  double v14;
  char v15;
  uint64_t v16;
  CPCluster *rightHandSides;
  double v18;
  double v19;
  __int128 v20;

  -[NSMutableArray removeAllObjects](self->gutters, "removeAllObjects");
  -[CPGuideFinder findWordEdgeClusters](self, "findWordEdgeClusters");
  medianFontSizeOfFirstCharacter = self->medianFontSizeOfFirstCharacter;
  medianFontSizeOfLastCharacter = self->medianFontSizeOfLastCharacter;
  v5 = -[CPCluster clusterCount](self->anchors, "clusterCount");
  v6 = -[CPCluster clusterCount](self->rightHandSides, "clusterCount");
  if (v5)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = medianFontSizeOfLastCharacter * 0.2 + medianFontSizeOfFirstCharacter * 0.05;
    do
    {
      anchors = self->anchors;
      if (anchors)
      {
        -[CPCluster clusterStatisticsAtIndex:](anchors, "clusterStatisticsAtIndex:", v8);
        v14 = *((double *)&v20 + 1);
      }
      else
      {
        v20 = 0u;
        v14 = 0.0;
      }
      if (v9 >= v7)
      {
        v16 = v9;
      }
      else
      {
        v15 = 0;
        while (1)
        {
          v16 = v9;
          rightHandSides = self->rightHandSides;
          if (rightHandSides)
          {
            -[CPCluster clusterStatisticsAtIndex:](rightHandSides, "clusterStatisticsAtIndex:", v9);
            v18 = v19;
          }
          else
          {
            v19 = 0.0;
            v18 = 0.0;
          }
          if (v12 + v18 >= v14)
            break;
          v9 = (v9 + 1);
          v15 = 1;
          v10 = v16;
          v11 = v8;
          if (v7 == (_DWORD)v9)
          {
            -[CPGuideFinder subdivideGutterFrom:to:](self, "subdivideGutterFrom:to:", v16, v8);
            return;
          }
        }
        if ((v15 & 1) != 0)
          -[CPGuideFinder subdivideGutterFrom:to:](self, "subdivideGutterFrom:to:", v10, v11);
      }
      v8 = (v8 + 1);
      v9 = v16;
    }
    while ((_DWORD)v8 != v5);
  }
}

- (void)findGuides
{
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  -[NSMutableArray removeAllObjects](self->leftGuides, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->rightGuides, "removeAllObjects");
  -[CPGuideFinder findWordEdgeClusters](self, "findWordEdgeClusters");
  v3 = -[CPCluster clusterCount](self->anchors, "clusterCount");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    do
    {
      -[CPGuideFinder subdivideLeftGuideAt:](self, "subdivideLeftGuideAt:", v5);
      v5 = (v5 + 1);
    }
    while (v4 != (_DWORD)v5);
  }
  v6 = -[CPCluster clusterCount](self->rightHandSides, "clusterCount");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    do
    {
      -[CPGuideFinder subdivideRightGuideAt:](self, "subdivideRightGuideAt:", v8);
      v8 = (v8 + 1);
    }
    while (v7 != (_DWORD)v8);
  }
}

- (void)func:(id)a3 and:(id)a4 and:(unsigned int)a5 and:(unsigned int)a6
{
  uint64_t v7;
  int v10;
  uint64_t v11;
  id v12;
  void *v13;
  BOOL v14;
  int v15;

  LODWORD(v7) = a5;
  v10 = objc_msgSend(a4, "hasJustifiedAlignment");
  if (a6 <= v7 || (v10 & 1) != 0)
  {
LABEL_8:
    if (!v10)
      return;
  }
  else
  {
    v11 = v7;
    v12 = a4;
    while (1)
    {
      v13 = (void *)objc_msgSend(a3, "objectAtIndex:", v11);
      if ((objc_msgSend(v13, "hasJustifiedAlignment") & 1) != 0
        || +[CPGuideFinder gutterSeparates:from:](CPGuideFinder, "gutterSeparates:from:", v12, v13))
      {
        break;
      }
      v10 = objc_msgSend(v12, "changesFontAt:", v13);
      if (++v11 < (unint64_t)a6)
      {
        v12 = v13;
        if (!v10)
          continue;
      }
      goto LABEL_8;
    }
  }
  +[CPGuideFinder reclusterPreservingAlignment:](CPGuideFinder, "reclusterPreservingAlignment:", a4);
  v14 = a6 >= v7;
  v15 = a6 - v7;
  if (v15 != 0 && v14)
  {
    v7 = v7;
    do
    {
      +[CPGuideFinder reclusterPreservingAlignment:](CPGuideFinder, "reclusterPreservingAlignment:", objc_msgSend(a3, "objectAtIndex:", v7++));
      --v15;
    }
    while (v15);
  }
}

- (void)splitTextLinesAtBorderWords
{
  int v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  if (-[CPGuideFinder hasGutters](self, "hasGutters"))
  {
    v3 = 0;
  }
  else if (-[CPGuideFinder hasLeftGuides](self, "hasLeftGuides"))
  {
    v3 = !-[CPGuideFinder hasRightGuides](self, "hasRightGuides");
  }
  else
  {
    v3 = 1;
  }
  v4 = -[CPZone textLinesInZone](self->contentZone, "textLinesInZone");
  v5 = objc_msgSend(v4, "count");
  v6 = v5;
  if ((_DWORD)v5)
  {
    v7 = 0;
    v8 = v5;
    do
    {
      v9 = (void *)objc_msgSend(v4, "objectAtIndex:", v7);
      v11[1] = objc_msgSend(v9, "lastWord", objc_msgSend(v9, "firstWord", 0, 0));
      if (((v3 | objc_msgSend(v9, "removeTextLines:whereTrue:passing:", v4, isAlignedWithGuide, v11) ^ 1) & 1) == 0)
      {
        v10 = objc_msgSend(v4, "count");
        -[CPGuideFinder func:and:and:and:](self, "func:and:and:and:", v4, v9, v6, v10);
        v6 = v10;
      }
      ++v7;
    }
    while (v8 != v7);
  }
}

- (void)splitTextLinesBetweenBorderWords
{
  int v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  if (-[CPGuideFinder hasGutters](self, "hasGutters", self->gutters, self->leftGuides, self->rightGuides))
  {
    v3 = 0;
  }
  else if (-[CPGuideFinder hasLeftGuides](self, "hasLeftGuides"))
  {
    v3 = !-[CPGuideFinder hasRightGuides](self, "hasRightGuides");
  }
  else
  {
    v3 = 1;
  }
  v4 = -[CPZone textLinesInZone](self->contentZone, "textLinesInZone");
  v5 = objc_msgSend(v4, "count");
  v6 = v5;
  if ((_DWORD)v5)
  {
    v7 = 0;
    v12 = 0;
    v13 = 0;
    v8 = v5;
    do
    {
      v9 = (void *)objc_msgSend(v4, "objectAtIndex:", v7);
      if ((int)objc_msgSend(v9, "levels") >= 3)
      {
        v12 = objc_msgSend(v9, "firstWord");
        v13 = objc_msgSend(v9, "lastWord");
        if (((v3 | objc_msgSend(v9, "removeTextLines:whereTrue:passing:", v4, isSplitByGuide, &v11) ^ 1) & 1) == 0)
        {
          v10 = objc_msgSend(v4, "count");
          -[CPGuideFinder func:and:and:and:](self, "func:and:and:and:", v4, v9, v6, v10);
          v6 = v10;
        }
      }
      ++v7;
    }
    while (v8 != v7);
  }
}

- (void)splitTextLines
{
  -[CPGuideFinder splitTextLinesAtBorderWords](self, "splitTextLinesAtBorderWords");
  -[CPGuideFinder splitTextLinesBetweenBorderWords](self, "splitTextLinesBetweenBorderWords");
}

- (void)markTextLines
{
  int v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  int v10;
  int v11;
  __int128 v12;
  NSMutableArray *rightGuides;
  uint64_t v14;
  uint64_t v15;

  v12 = *(_OWORD *)&self->gutters;
  rightGuides = self->rightGuides;
  if (-[CPGuideFinder hasGutters](self, "hasGutters"))
  {
    LOBYTE(v3) = 0;
  }
  else if (-[CPGuideFinder hasLeftGuides](self, "hasLeftGuides"))
  {
    v3 = !-[CPGuideFinder hasRightGuides](self, "hasRightGuides");
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  v4 = -[CPZone textLinesInZone](self->contentZone, "textLinesInZone");
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = 0;
    v14 = 0;
    v15 = 0;
    do
    {
      v7 = (void *)objc_msgSend(v4, "objectAtIndex:", v6);
      if ((int)objc_msgSend(v7, "levels") >= 3)
      {
        v14 = objc_msgSend(v7, "firstWord");
        v15 = objc_msgSend(v7, "lastWord");
        objc_msgSend(v7, "mapToWordPairs:passing:", markSplitByGuide, &v12);
        v8 = v14;
        v9 = v8 == objc_msgSend(v7, "firstWord") ? 1 : v3;
        if ((v9 & 1) == 0)
        {
          if ((v11 = 0, v10 = *(_DWORD *)(objc_msgSend(v7, "firstWord") + 12), v11 = v10, (v10 & 0x45) != 0)
            && (v10 & 0x8A) != 0
            || (objc_msgSend(v7, "mapToWordPairs:passing:", hasConsistentSpacing, &v11) & 1) == 0)
          {
            +[CPGuideFinder reclusterBetweenGuides:](CPGuideFinder, "reclusterBetweenGuides:", v7);
          }
        }
      }
      ++v6;
    }
    while (v5 != v6);
  }
}

- (BOOL)hasGutters
{
  NSMutableArray *gutters;

  gutters = self->gutters;
  if (gutters)
    LOBYTE(gutters) = -[NSMutableArray count](gutters, "count") != 0;
  return (char)gutters;
}

- (id)gutters
{
  return self->gutters;
}

- (BOOL)hasLeftGuides
{
  NSMutableArray *leftGuides;

  leftGuides = self->leftGuides;
  if (leftGuides)
    LOBYTE(leftGuides) = -[NSMutableArray count](leftGuides, "count") != 0;
  return (char)leftGuides;
}

- (id)leftGuides
{
  return self->leftGuides;
}

- (BOOL)hasRightGuides
{
  NSMutableArray *rightGuides;

  rightGuides = self->rightGuides;
  if (rightGuides)
    LOBYTE(rightGuides) = -[NSMutableArray count](rightGuides, "count") != 0;
  return (char)rightGuides;
}

- (id)rightGuides
{
  return self->rightGuides;
}

+ (BOOL)guideSeparates:(id)a3 from:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  BOOL result;

  v5 = objc_msgSend(a3, "lastWord");
  v6 = objc_msgSend(a4, "firstWord");
  result = 0;
  if (v5 && v6)
    return (*(_BYTE *)(v5 + 12) & 0xAA) != 0 || (*(_BYTE *)(v6 + 12) & 0x55) != 0;
  return result;
}

+ (BOOL)gutterSeparates:(id)a3 from:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  BOOL result;

  v5 = objc_msgSend(a3, "lastWord");
  v6 = objc_msgSend(a4, "firstWord");
  result = 0;
  if (v5 && v6)
    return (*(_BYTE *)(v5 + 12) & 0x88) != 0 || (*(_BYTE *)(v6 + 12) & 0x44) != 0;
  return result;
}

+ (void)reclusterPreservingAlignment:(id)a3
{
  unsigned int v4;
  unsigned int v5;
  size_t v6;
  char *v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  _DWORD *v12;
  int v13;
  unsigned int v14;
  char *v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;

  v4 = objc_msgSend(a3, "wordCount");
  if (v4)
  {
    v5 = v4;
    v6 = 48 * v4;
    v7 = (char *)malloc_type_malloc(v6, 0xFC5354EAuLL);
    memcpy(v7, (const void *)objc_msgSend(a3, "wordArray"), v6);
    +[CPCluster clusterTextLine:](CPCluster, "clusterTextLine:", a3);
    v8 = objc_msgSend(a3, "wordCount");
    v9 = objc_msgSend(a3, "wordArray");
    if (v8)
    {
      v10 = 0;
      v11 = 0;
      do
      {
        v12 = (_DWORD *)(v9 + 48 * v10);
        v13 = *(_DWORD *)&v7[48 * v11];
        v14 = v12[1];
        if (*v12 == v13)
        {
          v15 = &v7[48 * v11];
          v16 = *((_DWORD *)v15 + 1);
          v17 = *((_DWORD *)v15 + 3);
          if (v14 == v16)
          {
            *(_DWORD *)(v9 + 48 * v10 + 12) = v17;
LABEL_9:
            ++v11;
            goto LABEL_13;
          }
          *(_DWORD *)(v9 + 48 * v10 + 12) |= v17 & 0x55;
          if (v14 > v16)
            goto LABEL_11;
        }
        else
        {
          v18 = v14 + *v12;
          v19 = *(_DWORD *)&v7[48 * v11 + 4] + v13;
          if (v18 == v19)
          {
            *(_DWORD *)(v9 + 48 * v10 + 12) |= *(_DWORD *)&v7[48 * v11 + 12] & 0xAA;
            goto LABEL_9;
          }
          if (v18 > v19)
          {
LABEL_11:
            ++v11;
            continue;
          }
        }
LABEL_13:
        ++v10;
      }
      while (v11 < v5 && v10 < v8);
    }
    free(v7);
  }
}

+ (void)reclusterBetweenGuides:(id)a3
{
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;

  if (objc_msgSend(a3, "wordCount"))
  {
    v4 = objc_msgSend(a3, "wordArray");
    v6 = *(_DWORD *)(v4 + 8);
    v5 = *(_DWORD *)(v4 + 12);
    v7 = v5 & 0x55;
    v22 = 0;
    v8 = v5 & 0xAA;
    if (objc_msgSend(a3, "wordCount") < 2)
    {
      v9 = 0;
      v10 = 1;
      v11 = v6;
    }
    else
    {
      v9 = 0;
      v10 = 1;
      v11 = v6;
      do
      {
        v12 = *(_DWORD *)(v4 + 48 * v10 + 12);
        v13 = v12 & 0x55;
        if (v8 | v13)
        {
          v22 = v10 - v9;
          +[CPCluster reclusterTextLine:fromWordIndex:count:](CPCluster, "reclusterTextLine:fromWordIndex:count:", a3, v9, &v22);
          v14 = objc_msgSend(a3, "wordArray");
          v4 = v14;
          v15 = v14 + 48 * v9;
          v16 = *(_DWORD *)(v15 + 12) | v7;
          *(_DWORD *)(v15 + 8) = v6;
          *(_DWORD *)(v15 + 12) = v16;
          v9 = (v22 + v9);
          if (v22)
            *(_DWORD *)(v14 + 48 * (v9 - 1) + 12) |= v8;
          v17 = v14 + 48 * v9;
          v6 = *(_DWORD *)(v17 + 8);
          v12 = *(_DWORD *)(v17 + 12);
          if (v11 <= v6)
            v11 = v6;
          v7 = v13;
          v10 = v9;
        }
        ++v10;
        v8 = v12 & 0xAA;
      }
      while (v10 < objc_msgSend(a3, "wordCount"));
    }
    v22 = v10 - v9;
    +[CPCluster reclusterTextLine:fromWordIndex:count:](CPCluster, "reclusterTextLine:fromWordIndex:count:", a3, v9, &v22);
    v18 = objc_msgSend(a3, "wordArray");
    v19 = v18 + 48 * v9;
    v20 = *(_DWORD *)(v19 + 12) | v7;
    *(_DWORD *)(v19 + 8) = v6;
    *(_DWORD *)(v19 + 12) = v20;
    if (v22)
    {
      v21 = v18 + 48 * (v9 + v22 - 1);
      *(_DWORD *)(v21 + 12) |= v8;
    }
    if ((int)objc_msgSend(a3, "levels") <= v11)
      objc_msgSend(a3, "setLevels:", (v11 + 1));
  }
}

@end
