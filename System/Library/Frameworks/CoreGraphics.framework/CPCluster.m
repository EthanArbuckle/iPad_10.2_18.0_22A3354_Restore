@implementation CPCluster

- (CPCluster)init
{
  return -[CPCluster initWithProfile:](self, "initWithProfile:", &kCPClusterProfileDefault);
}

- (CPCluster)initWithProfile:(id *)a3
{
  CPCluster *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPCluster;
  result = -[CPCluster init](&v5, sel_init);
  if (result)
  {
    result->profile = a3;
    result->maxClusterSpread = 1.79769313e308;
  }
  return result;
}

- (void)dispose
{
  if (self->profile)
  {
    free(self->dxStats);
    free(self->xStats);
    free(self->ddxOrderIndex);
    free(self->ddx);
    free(self->dxOrderIndex);
    if (self->ownData)
      free(self->x);
    if (self->ownDifferences)
      free(self->dx);
    self->profile = 0;
  }
}

- (void)finalize
{
  objc_super v3;

  -[CPCluster dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPCluster;
  -[CPCluster finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  objc_super v3;

  -[CPCluster dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPCluster;
  -[CPCluster dealloc](&v3, sel_dealloc);
}

- (void)computeDifferencesFromData
{
  unsigned int xCount;
  uint64_t v4;
  double *v5;
  double *v6;

  xCount = self->xCount;
  if (xCount >= 2 && self->x && !self->dx)
  {
    v4 = xCount - 1;
    v5 = (double *)malloc_type_malloc(8 * v4, 0x100004000313F17uLL);
    self->dx = v5;
    self->ownDifferences = 1;
    v6 = self->x + 1;
    do
    {
      *v5++ = *v6 - *(v6 - 1);
      ++v6;
      --v4;
    }
    while (v4);
  }
}

- (void)computeDataFromDifferences
{
  uint64_t xCount;
  double *v5;
  uint64_t v6;
  double *dx;
  double *v8;
  double v9;
  double v10;

  xCount = self->xCount;
  if ((_DWORD)xCount && !self->x && ((_DWORD)xCount == 1 || self->dx != 0))
  {
    v5 = (double *)malloc_type_malloc(8 * xCount, 0x100004000313F17uLL);
    self->x = v5;
    self->ownData = 1;
    *v5 = 0.0;
    v6 = self->xCount - 1;
    if (self->xCount != 1)
    {
      dx = self->dx;
      v8 = v5 + 1;
      v9 = 0.0;
      do
      {
        v10 = *dx++;
        v9 = v9 + v10;
        *v8++ = v9;
        --v6;
      }
      while (v6);
    }
  }
}

- (void)splitSecondDifferences
{
  unsigned int xCount;
  unsigned int v3;
  const $01F72CB2B2C87419F98A179C5B4417A2 *profile;
  double var0;
  unsigned int var1;
  double var2;
  double var3;
  unsigned int var4;
  double var5;
  double var6;
  uint64_t v13;
  double *v14;
  double *v15;
  uint64_t v16;
  double *ddx;
  unsigned int *ddxOrderIndex;
  unsigned int *v19;
  uint64_t v20;
  unsigned int v21;
  double v22;
  unsigned int *v23;
  uint64_t v24;
  double *v25;
  uint64_t v26;
  double *v27;
  unsigned int *v28;
  double v29;
  unsigned int v30;
  double v31;
  double v32;
  int v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  BOOL v38;
  BOOL v39;
  _BOOL4 v40;
  double minInterLevel2ndDiff;

  xCount = self->xCount;
  v3 = xCount - 4;
  if (xCount >= 4)
  {
    profile = self->profile;
    var0 = profile->var0;
    var1 = profile->var1;
    var2 = profile->var2;
    var3 = profile->var3;
    var4 = profile->var4;
    var5 = profile->var5;
    var6 = profile->var6;
    v13 = xCount - 3;
    v14 = (double *)malloc_type_malloc(8 * v13, 0x100004000313F17uLL);
    v15 = v14;
    v16 = 0;
    ddx = self->ddx;
    ddxOrderIndex = self->ddxOrderIndex;
    v21 = *ddxOrderIndex;
    v19 = ddxOrderIndex + 1;
    v20 = v21;
    do
    {
      v22 = ddx[v20];
      v20 = v19[v16];
      v14[v16++] = ddx[v20] - v22;
    }
    while (v13 != v16);
    v23 = +[CPCluster createOrderIndexFor:ofSize:](CPCluster, "createOrderIndexFor:ofSize:", v14, xCount - 3);
    v24 = xCount - 2;
    v25 = (double *)malloc_type_malloc(8 * v24, 0x100004000313F17uLL);
    v26 = 0;
    v27 = self->ddx;
    v28 = self->ddxOrderIndex;
    v29 = 0.0;
    do
    {
      v29 = v29 + v27[v28[v26]];
      v25[v26] = v29 / (double)(v26 + 1);
      ++v26;
    }
    while (v24 != v26);
    v30 = 0;
    v31 = v15[v23[v3]];
    v32 = v27[v28[v13]];
    v33 = v13 - 1;
    v34 = v13;
    while (1)
    {
      v35 = v23[v33];
      if (v35 >= v34)
        goto LABEL_32;
      if (var0 * (double)v24 > (double)(v35 + 2)
        || ((v36 = v28[v35 + 1], v37 = v27[v36], v37 >= var2 * v27[v28[v35]])
          ? (v38 = v13 >= v35 + var1)
          : (v38 = 1),
            v38 || (v37 > 0.0 ? (v39 = v37 < var3 * v25[v35]) : (v39 = 1), v39 || v37 < self->minInterLevel2ndDiff)))
      {
        v40 = 0;
        if (v30)
          goto LABEL_19;
      }
      else
      {
        v40 = self->dx[self->dxOrderIndex[(v36 + 1)]] >= self->minInterClusterDiff;
        if (v30)
        {
LABEL_19:
          minInterLevel2ndDiff = self->minInterLevel2ndDiff;
          if (minInterLevel2ndDiff != 0.0 || !v40)
          {
            if (minInterLevel2ndDiff == 0.0)
              LOBYTE(v40) = 0;
            if (!v40)
            {
LABEL_27:
              ++v30;
              goto LABEL_32;
            }
          }
          else if (v15[v35] < var5 * v31 || v27[v28[v35 + 1]] < var6 * v32)
          {
            goto LABEL_27;
          }
LABEL_30:
          v31 = v15[v35];
          v32 = v27[v28[v35]];
          v30 = 1;
          v34 = v23[v33];
          goto LABEL_32;
        }
      }
      if (v40)
        goto LABEL_30;
      v30 = 0;
LABEL_32:
      if (v33)
      {
        --v33;
        if (v30 <= var4)
          continue;
      }
      self->interLevelMinIndex = v34 + 1;
      free(v25);
      free(v23);
      free(v15);
      return;
    }
  }
}

- (void)assembleDifferenceStats
{
  unsigned int interLevelMinIndex;
  unsigned int xCount;
  unsigned int v5;
  _DWORD *v6;
  _DWORD *v7;
  unsigned int levels;
  uint64_t v9;
  unsigned int var0;
  $CAD616572B4749F850842224FCF53B5F *v11;
  unint64_t v12;
  unsigned int v13;
  double *dx;
  unsigned int *dxOrderIndex;
  uint64_t v16;
  unsigned int v17;
  $CAD616572B4749F850842224FCF53B5F *v18;
  uint64_t v19;
  double v20;

  if (!self->dxStats)
  {
    interLevelMinIndex = self->interLevelMinIndex;
    xCount = self->xCount;
    if (interLevelMinIndex + 1 >= xCount)
    {
      var0 = 0;
      self->levels = 0;
    }
    else
    {
      v5 = xCount + ~interLevelMinIndex;
      self->levels = v5;
      v6 = malloc_type_malloc(4 * v5, 0x100004052888210uLL);
      v7 = v6;
      levels = self->levels;
      v9 = levels - 1;
      if (levels == 1)
        v9 = 0;
      else
        memcpy(v6, &self->ddxOrderIndex[self->interLevelMinIndex], 4 * (levels - 1));
      v7[v9] = self->xCount - 2;
      qsort(v7, self->levels, 4uLL, (int (__cdecl *)(const void *, const void *))compareUnsigned);
      v11 = ($CAD616572B4749F850842224FCF53B5F *)malloc_type_malloc(32 * self->levels, 0x100004089CA3EB1uLL);
      self->dxStats = v11;
      if (self->levels)
      {
        v12 = 0;
        v13 = 0;
        dx = self->dx;
        dxOrderIndex = self->dxOrderIndex;
        do
        {
          v16 = v7[v12];
          v17 = v16 + 1 - v13;
          v18 = &v11[v12];
          v18->var0 = v17;
          v19 = dxOrderIndex[v16];
          v18->var1 = dx[dxOrderIndex[v13]];
          v18->var2 = dx[v19];
          v20 = 0.0;
          while (v13 <= v16)
            v20 = v20 + dx[dxOrderIndex[v13++]];
          v18->var3 = v20 / (double)v17;
          ++v12;
          v13 = v16 + 1;
        }
        while (v12 < self->levels);
      }
      free(v7);
      var0 = self->levels;
      if (var0)
        var0 = self->dxStats->var0;
    }
    self->interClusterMinIndex = var0;
  }
}

- (BOOL)joinLevelsFrom:(unsigned int)a3 to:(unsigned int)a4
{
  unsigned int levels;
  uint64_t v6;
  int v7;
  unsigned int v9;
  $CAD616572B4749F850842224FCF53B5F *dxStats;
  $CAD616572B4749F850842224FCF53B5F *v11;
  double v12;
  int v13;
  $CAD616572B4749F850842224FCF53B5F *v14;

  levels = self->levels;
  if (levels < 2)
    return 0;
  LODWORD(v6) = levels - 1;
  v6 = levels <= a4 ? v6 : a4;
  v7 = a3 - v6;
  if (a3 >= v6)
    return 0;
  v9 = 0;
  dxStats = self->dxStats;
  v11 = &dxStats[a3];
  v12 = 0.0;
  v13 = v6 + 1;
  do
  {
    v12 = v12 + v11->var3 * (double)v11->var0;
    v9 += v11->var0;
    --v13;
    ++v11;
  }
  while (a3 != v13);
  v14 = &dxStats[a3];
  v14->var0 = v9;
  v14->var2 = dxStats[v6].var2;
  v14->var3 = v12 / (double)v9;
  memmove(&dxStats[a3 + 1], &dxStats[(v6 + 1)], 32 * (self->levels + ~(_DWORD)v6));
  self->levels += v7;
  if (!a3)
    self->interClusterMinIndex = v9;
  return 1;
}

- (BOOL)joinClosestLevelPairFrom:(unsigned int)a3 to:(unsigned int)a4
{
  unsigned int levels;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  double *p_var1;
  unint64_t v10;
  double v11;
  double v12;
  BOOL v13;

  levels = self->levels;
  if (levels < 2)
    return 0;
  if (levels <= a4)
    v6 = levels - 1;
  else
    v6 = a4;
  if (v6 > a3)
  {
    v7 = 0;
    v8 = a3;
    p_var1 = &self->dxStats[a3 + 1].var1;
    v10 = a3 - (unint64_t)v6;
    v11 = 0.0;
    do
    {
      v12 = *(p_var1 - 3);
      v13 = *p_var1 - v12 < v11 || v7 == 0;
      if (v13)
        *(_QWORD *)&a3 = v8 + v7;
      else
        *(_QWORD *)&a3 = a3;
      if (v13)
        v11 = *p_var1 - v12;
      ++v7;
      p_var1 += 4;
    }
    while (v10 + v7);
  }
  return -[CPCluster joinLevelsFrom:to:](self, "joinLevelsFrom:to:", *(_QWORD *)&a3, a3 + 1);
}

- (BOOL)splitLevelAtIndex:(unsigned int)a3 betweenValue:(double)a4 andValue:(double)a5
{
  unsigned int levels;
  $CAD616572B4749F850842224FCF53B5F *dxStats;
  uint64_t v9;
  $CAD616572B4749F850842224FCF53B5F *v10;
  double var2;
  double var1;
  unsigned int xCount;
  double v14;
  double v15;
  uint64_t v16;
  char v17;
  unsigned int v18;
  double *dx;
  unsigned int *dxOrderIndex;
  uint64_t v21;
  unsigned int *v22;
  unsigned int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  unsigned int v28;
  double v29;
  double v30;
  _BOOL4 v31;
  uint64_t v32;
  BOOL v33;
  $CAD616572B4749F850842224FCF53B5F *v35;
  unint64_t v36;
  unsigned int v37;
  uint64_t v38;
  double v39;
  double v40;
  $CAD616572B4749F850842224FCF53B5F *v41;
  unsigned int var0;
  double v43;
  unsigned int v44;
  unsigned int v45;
  $CAD616572B4749F850842224FCF53B5F *v46;
  $CAD616572B4749F850842224FCF53B5F *v47;

  levels = self->levels;
  if (levels <= a3)
  {
    LOBYTE(v35) = 0;
  }
  else
  {
    dxStats = self->dxStats;
    v9 = a3;
    v10 = &dxStats[a3];
    var1 = v10->var1;
    var2 = v10->var2;
    if (var1 > a4)
      a4 = v10->var1;
    if (var2 < a5)
      a5 = v10->var2;
    xCount = self->xCount;
    v14 = a5;
    v15 = a4;
    if (xCount < 3)
      goto LABEL_30;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    dx = self->dx;
    dxOrderIndex = self->dxOrderIndex;
    v21 = xCount - 2;
    v23 = *dxOrderIndex;
    v22 = dxOrderIndex + 1;
    v24 = dx[v23];
    v25 = 0.0;
    v14 = a5;
    v15 = a4;
    v26 = 0.0;
    v27 = 0.0;
    v28 = 0;
LABEL_8:
    v29 = v24;
    do
    {
      v24 = dx[v22[v16]];
      if (v29 >= var1)
        ++v28;
      v30 = -0.0;
      if (v29 >= var1)
        v30 = v29;
      v31 = v24 <= a5;
      v32 = v16 + 1;
      v27 = v27 + v30;
      if (v26 == 0.0)
        v31 = 1;
      v33 = v29 < a4 || !v31;
      if (!v33 && v24 - v29 >= v26)
      {
        v17 = 1;
        v25 = v27;
        v18 = v28;
        v14 = dx[v22[v16]];
        v15 = v29;
        v26 = v24 - v29;
        v33 = v21 - 1 == v16++;
        if (v33)
          goto LABEL_43;
        goto LABEL_8;
      }
      v29 = dx[v22[v16++]];
    }
    while (v21 != v32);
    v29 = v15;
    v24 = v14;
    v28 = v18;
    v27 = v25;
    if ((v17 & 1) == 0)
    {
LABEL_30:
      v36 = 0;
      v37 = 0;
      if (xCount <= 1)
        xCount = 1;
      v38 = 4 * (xCount - 1);
      v39 = 0.0;
      do
      {
        v27 = v39;
        v28 = v37;
        if (v38 == v36)
        {
          v29 = var2;
          v24 = v14;
          goto LABEL_43;
        }
        v24 = self->dx[self->dxOrderIndex[v36 / 4]];
        v40 = v39 + v24;
        if (v24 >= var1)
        {
          ++v37;
          v39 = v39 + v24;
        }
        v36 += 4;
      }
      while (v24 < a4);
      if (v24 - a4 <= a5 - v24)
      {
        v29 = v24;
        v24 = v14;
        v28 = v37;
        v27 = v39;
      }
      else
      {
        if (v24 >= var1)
          v27 = v40 - v24;
        v29 = v15;
      }
    }
LABEL_43:
    v41 = &dxStats[v9];
    var0 = v41->var0;
    if (v28)
      var1 = v27 / (double)v28;
    v43 = var2;
    if (var0 >= v28)
      v44 = var0 - v28;
    else
      v44 = 0;
    if (var0 > v28)
      v43 = -(v27 - (double)var0 * v41->var3) / (double)v44;
    v35 = ($CAD616572B4749F850842224FCF53B5F *)malloc_type_realloc(dxStats, 32 * (levels + 1), 0x100004089CA3EB1uLL);
    if (v35)
    {
      self->dxStats = v35;
      v45 = self->levels;
      self->levels = v45 + 1;
      if (a3 + 2 < v45 + 1)
      {
        memmove(&v35[v9 + 2], &v35[v9 + 1], 32 * (v45 + ~a3));
        v35 = self->dxStats;
      }
      v46 = &v35[v9];
      v46->var0 = v28;
      v46->var2 = v29;
      v46->var3 = var1;
      v47 = &v35[a3 + 1];
      v47->var0 = v44;
      v47->var1 = v24;
      v47->var2 = var2;
      v47->var3 = v43;
      if (!a3)
        self->interClusterMinIndex = v28;
      LOBYTE(v35) = 1;
    }
  }
  return (char)v35;
}

- (BOOL)coalesceFrom:(unsigned int)a3 to:(unsigned int)a4
{
  unsigned int levels;
  unsigned int v5;
  const $01F72CB2B2C87419F98A179C5B4417A2 *profile;
  unint64_t v9;
  double var10;
  double var11;
  double var12;
  double var13;
  double var14;
  double var16;
  double var15;
  double var17;
  _DWORD *v18;
  double v19;
  _DWORD *v20;
  uint64_t v21;
  unsigned int v22;
  $CAD616572B4749F850842224FCF53B5F *dxStats;
  char v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;
  unint64_t v29;
  int v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  $CAD616572B4749F850842224FCF53B5F *v36;
  unint64_t v37;
  unsigned int var0;
  $CAD616572B4749F850842224FCF53B5F *v39;
  double var1;
  double v41;
  uint64_t v42;
  double *p_var0;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  BOOL v49;
  _BOOL4 var19;
  double v52;
  double var18;
  double v54;
  double var9;
  double var8;

  levels = self->levels;
  if (levels <= a4)
    v5 = levels - 1;
  else
    v5 = a4;
  if (v5 <= a3)
  {
    v24 = 0;
    return v24 & 1;
  }
  profile = self->profile;
  v9 = a3;
  var10 = profile->var10;
  var9 = profile->var9;
  var8 = profile->var8;
  var11 = profile->var11;
  var12 = profile->var12;
  var13 = profile->var13;
  var14 = profile->var14;
  var15 = profile->var15;
  var16 = profile->var16;
  var17 = profile->var17;
  var18 = profile->var18;
  var19 = profile->var19;
  v18 = malloc_type_malloc(4 * (v5 - a3 + 1), 0x100004052888210uLL);
  v20 = v18;
  v21 = 0;
  v22 = 0;
  dxStats = self->dxStats;
  do
  {
    v22 += dxStats[(v9 + v21)].var0;
    v18[v21++] = v22;
  }
  while ((int)v9 + (int)v21 <= v5);
  v24 = 0;
  v25 = 1.0;
  v26 = var18 + 1.0;
  v27 = 1.0 - var18;
  v28 = var18 < 0.0;
  if (var18 < 0.0)
    v27 = 1.0;
  v54 = v27;
  if (v28)
    v25 = v26;
  v52 = v25;
  v29 = v9;
  do
  {
    if ((_DWORD)v29 == a3)
    {
      v30 = 0;
      v31 = var8;
      v32 = var10;
      v33 = var12;
      v34 = var14;
      v35 = var16;
    }
    else
    {
      v30 = v20[v29 + ~a3];
      v31 = var9;
      v32 = var11;
      v33 = var13;
      v34 = var15;
      v35 = var17;
    }
    v36 = self->dxStats;
    v37 = (v29 + 1);
    LODWORD(v19) = v36[v37].var0;
    var0 = v36[v29].var0;
    if (v31 * (double)var0 < (double)*(unint64_t *)&v19)
    {
      if (v29 > a3)
      {
        v39 = &v36[v29];
        var1 = v39->var1;
        v41 = v36[v37].var1 - v39->var2;
        v42 = (v29 - 1);
        if (v52 * (var1 - v36[v42].var2) >= v54 * v41)
          v29 = v29;
        else
          v29 = v42;
        v37 = (v29 + 1);
      }
LABEL_31:
      if (-[CPCluster joinLevelsFrom:to:](self, "joinLevelsFrom:to:", v29, v37))
      {
        memmove(&v20[v29 - a3], &v20[v29 - a3 + 1], 4 * (v5 - v29));
        --v5;
        v37 = (__PAIR64__(v29, a3) - v29) >> 32;
        v24 = 1;
      }
      goto LABEL_33;
    }
    p_var0 = (double *)&v36[v29].var0;
    v44 = v36[v37].var1;
    v45 = p_var0[1];
    if (v45 > 0.0 || v44 >= self->minInterClusterDiff)
      v45 = 0.0;
    v46 = v44 - v45;
    v47 = v32 * (p_var0[2] - v45);
    v19 = p_var0[3] - v45;
    v48 = v33 * v19;
    v49 = v46 < v47 || v46 < v48;
    if (v49
      || v34 * (double)(v22 - v30) > (double)(var0 + 1)
      || v44 * (double)v22 < v35 * (v36[v5].var2 - v36[v9].var1)
      || v44 < self->minInterClusterDiff)
    {
      goto LABEL_31;
    }
LABEL_33:
    v29 = v37;
  }
  while (v37 < v5);
  if (var19 && v5 > a3 + 1)
    v24 |= -[CPCluster joinLevelsFrom:to:](self, "joinLevelsFrom:to:");
  free(v20);
  return v24 & 1;
}

- (void)resetAnalysis
{
  $CAD616572B4749F850842224FCF53B5F *v3;
  double *dx;

  self->interLevelMinIndex = 0;
  self->levels = 1;
  self->interClusterMinIndex = 1;
  v3 = ($CAD616572B4749F850842224FCF53B5F *)malloc_type_malloc(0x20uLL, 0x100004089CA3EB1uLL);
  self->dxStats = v3;
  v3->var0 = 1;
  dx = self->dx;
  v3->var1 = *dx;
  v3->var2 = *dx;
  v3->var3 = *dx;
}

- (void)analyzeDifferences
{
  unsigned int xCount;
  unsigned int v4;
  uint64_t v5;
  double *v6;
  uint64_t v7;
  double *dx;
  unsigned int *dxOrderIndex;
  unsigned int *v10;
  uint64_t v11;
  unsigned int v12;
  double v13;
  unsigned int levels;

  xCount = self->xCount;
  if (xCount >= 2)
  {
    self->dxOrderIndex = +[CPCluster createOrderIndexFor:ofSize:](CPCluster, "createOrderIndexFor:ofSize:", self->dx, xCount - 1);
    v4 = self->xCount;
    v5 = v4 - 2;
    if (v4 == 2)
    {
      -[CPCluster resetAnalysis](self, "resetAnalysis");
    }
    else
    {
      v6 = (double *)malloc_type_malloc(8 * (v4 - 2), 0x100004000313F17uLL);
      v7 = 0;
      self->ddx = v6;
      dx = self->dx;
      dxOrderIndex = self->dxOrderIndex;
      v12 = *dxOrderIndex;
      v10 = dxOrderIndex + 1;
      v11 = v12;
      do
      {
        v13 = dx[v11];
        v11 = v10[v7];
        v6[v7++] = dx[v11] - v13;
      }
      while (v5 != v7);
      self->ddxOrderIndex = +[CPCluster createOrderIndexFor:ofSize:](CPCluster, "createOrderIndexFor:ofSize:", v6, v5);
      -[CPCluster splitSecondDifferences](self, "splitSecondDifferences");
      -[CPCluster assembleDifferenceStats](self, "assembleDifferenceStats");
      if (self->profile->var7)
      {
        levels = self->levels;
        if (levels >= 2)
          -[CPCluster coalesceFrom:to:](self, "coalesceFrom:to:", 0, levels - 1);
      }
    }
  }
}

- (void)assembleDataStats
{
  unsigned int interClusterMinIndex;
  unsigned int xCount;
  unsigned int v5;
  _DWORD *v6;
  _DWORD *v7;
  unsigned int clusterCount;
  uint64_t v9;
  BOOL v10;
  $CAD616572B4749F850842224FCF53B5F *v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  double *x;
  double v20;
  double v21;
  $CAD616572B4749F850842224FCF53B5F *v22;
  BOOL v23;
  double v24;

  if (!self->xStats)
  {
    interClusterMinIndex = self->interClusterMinIndex;
    xCount = self->xCount;
    v23 = xCount >= interClusterMinIndex;
    v5 = xCount - interClusterMinIndex;
    if (v5 != 0 && v23)
    {
      self->clusterCount = v5;
      -[CPCluster computeDataFromDifferences](self, "computeDataFromDifferences");
      if (!self->x)
        __assert_rtn("-[CPCluster assembleDataStats]", "CPCluster.m", 720, "x");
      v6 = malloc_type_malloc(4 * self->clusterCount, 0x100004052888210uLL);
      v7 = v6;
      clusterCount = self->clusterCount;
      v9 = clusterCount - 1;
      if (clusterCount == 1)
        v9 = 0;
      else
        memcpy(v6, &self->dxOrderIndex[self->interClusterMinIndex], 4 * (clusterCount - 1));
      v7[v9] = self->xCount - 1;
      qsort(v7, self->clusterCount, 4uLL, (int (__cdecl *)(const void *, const void *))compareUnsigned);
      if (self->minClusterSize)
        v10 = 0;
      else
        v10 = self->maxClusterSpread == 1.79769313e308;
      v11 = ($CAD616572B4749F850842224FCF53B5F *)malloc_type_malloc(32 * self->clusterCount, 0x100004089CA3EB1uLL);
      self->xStats = v11;
      v12 = self->clusterCount;
      if ((_DWORD)v12)
      {
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = self->xCount;
        do
        {
          if (v15 >= v16)
            __assert_rtn("-[CPCluster assembleDataStats]", "CPCluster.m", 753, "minIndex<xCount");
          v17 = v7[v13];
          v18 = v17 + 1 - v15;
          x = self->x;
          v20 = x[v15];
          v21 = x[v17];
          if (v10 || v18 >= self->minClusterSize && v21 - v20 <= self->maxClusterSpread)
          {
            v22 = &v11[v14];
            v22->var0 = v18;
            v22->var1 = v20;
            v22->var2 = v21;
            v16 = self->xCount;
            v23 = v15 >= v16 || v17 >= v16;
            if (v23)
              __assert_rtn("-[CPCluster assembleDataStats]", "CPCluster.m", 764, "minIndex<xCount && maxIndex<xCount");
            v24 = 0.0;
            while (v15 <= v17)
              v24 = v24 + x[v15++];
            v11[v14++].var3 = v24 / (double)v18;
            v12 = self->clusterCount;
          }
          ++v13;
          v15 = v17 + 1;
        }
        while (v13 < v12);
      }
      else
      {
        v14 = 0;
      }
      self->clusterCount = v14;
      free(v7);
    }
  }
}

- (void)setMinimumClusterSize:(unsigned int)a3
{
  self->minClusterSize = a3;
}

- (void)setMaximumClusterSpread:(double)a3
{
  self->maxClusterSpread = a3;
}

- (void)setMinimumRecognizedInterClusterDifference:(double)a3
{
  self->minInterClusterDiff = a3;
}

- (void)setMinimumRecognizedInterLevel2ndDifference:(double)a3
{
  self->minInterLevel2ndDiff = a3;
}

- (void)assembleDensityDifferenceStats
{
  unsigned int v3;
  $CAD616572B4749F850842224FCF53B5F *v4;
  uint64_t interClusterMinIndex;
  double *dx;
  unsigned int *dxOrderIndex;
  uint64_t v8;
  double v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  double *v13;
  unsigned int *v14;
  uint64_t v15;
  unsigned int xCount;
  double v17;
  unsigned int v18;

  if (!self->dxStats)
  {
    v3 = self->interClusterMinIndex + 1 >= self->xCount ? 1 : 2;
    self->levels = v3;
    v4 = ($CAD616572B4749F850842224FCF53B5F *)malloc_type_malloc(32 * v3, 0x100004089CA3EB1uLL);
    self->dxStats = v4;
    v4->var0 = self->interClusterMinIndex;
    interClusterMinIndex = self->interClusterMinIndex;
    if ((_DWORD)interClusterMinIndex)
    {
      dx = self->dx;
      dxOrderIndex = self->dxOrderIndex;
      v8 = dxOrderIndex[(interClusterMinIndex - 1)];
      v4->var1 = dx[*dxOrderIndex];
      v4->var2 = dx[v8];
      v9 = 0.0;
      v10 = interClusterMinIndex;
      do
      {
        v11 = *dxOrderIndex++;
        v9 = v9 + dx[v11];
        --v10;
      }
      while (v10);
      v4->var3 = v9 / (double)interClusterMinIndex;
    }
    else
    {
      v4->var1 = 0.0;
      v4->var2 = 0.0;
      v4->var3 = 0.0;
    }
    if (self->levels >= 2)
    {
      v12 = self->xCount + ~(_DWORD)interClusterMinIndex;
      v4[1].var0 = v12;
      v13 = self->dx;
      v14 = self->dxOrderIndex;
      v15 = self->interClusterMinIndex;
      v4[1].var1 = v13[v14[v15]];
      xCount = self->xCount;
      v4[1].var2 = v13[v14[xCount - 2]];
      v17 = 0.0;
      if ((int)v15 + 1 < xCount)
      {
        v18 = xCount - 1;
        do
        {
          v17 = v17 + v13[v14[v15]];
          LODWORD(v15) = v15 + 1;
        }
        while (v18 != (_DWORD)v15);
      }
      v4[1].var3 = v17 / (double)v12;
    }
  }
}

- (void)analyzeDensities
{
  unsigned int xCount;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  double v7;
  unsigned int v8;
  double v9;
  unsigned int v10;
  uint64_t clusterCount;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  BOOL v17;
  unsigned __int8 v18;
  unsigned int v19;
  unsigned int minClusterSize;
  double v21;
  unsigned int *v22;
  uint64_t v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int interClusterMinIndex;

  if (!self->x)
    __assert_rtn("-[CPCluster analyzeDensities]", "CPCluster.m", 844, "x");
  xCount = self->xCount;
  if (xCount >= 2)
  {
    self->dxOrderIndex = +[CPCluster createOrderIndexFor:ofSize:](CPCluster, "createOrderIndexFor:ofSize:", self->dx, xCount - 1);
    v4 = self->xCount;
    if ((_DWORD)v4 == 2)
    {
      -[CPCluster resetAnalysis](self, "resetAnalysis");
      return;
    }
    v5 = (unsigned int *)malloc_type_malloc(4 * v4, 0x100004052888210uLL);
    *v5 = self->xCount - 1;
    v6 = self->xCount;
    v7 = self->dx[self->dxOrderIndex[v6 - 2]];
    self->interClusterMinIndex = v6 - 1;
    self->clusterCount = 0;
    if (v6)
    {
      v8 = 0;
      v9 = 0.0;
      while (1)
      {
        v10 = v6;
        while (1)
        {
          v6 = v10 - 1;
          clusterCount = self->clusterCount;
          LODWORD(v12) = clusterCount + 1;
          self->clusterCount = clusterCount + 1;
          if ((clusterCount + 1) < 2)
            break;
          if (v7 == 0.0)
            goto LABEL_43;
          v13 = self->dxOrderIndex[v6];
          if (*v5 <= v13)
            v14 = clusterCount;
          else
            v14 = 0;
          if (v14 >= 2)
          {
            v15 = 0;
            v14 = clusterCount;
            do
            {
              if (v5[(v14 + v15) >> 1] <= v13)
                v15 = (v14 + v15) >> 1;
              else
                v14 = (v14 + v15) >> 1;
            }
            while (v15 + 1 < v14);
          }
          v16 = clusterCount - v14;
          if ((_DWORD)clusterCount != v14)
          {
            clusterCount = v14;
            memmove(&v5[v14 + 1], &v5[v14], 4 * v16);
          }
          v5[clusterCount] = v13;
          if (v10 == 1
            || (v17 = self->dx[self->dxOrderIndex[v10 - 2]] < v7, v7 = self->dx[self->dxOrderIndex[v10 - 2]], v17))
          {
            if (v7 <= self->maxClusterSpread)
            {
              LODWORD(v12) = self->clusterCount;
              break;
            }
          }
          --v10;
          if (!v6)
            goto LABEL_43;
        }
        if (!(_DWORD)v12)
          break;
        v18 = 0;
        v19 = 0;
        minClusterSize = self->minClusterSize;
        v21 = 0.0;
        v22 = v5;
        v12 = v12;
        do
        {
          v24 = *v22++;
          v23 = v24;
          v25 = v24 + 1;
          v26 = v24 + 1 - v19;
          if (v26 >= minClusterSize && self->x[v23] - self->x[v19] <= self->maxClusterSpread)
          {
            v21 = v21 + (double)(v26 - minClusterSize) * (double)(v26 - minClusterSize);
            if (v26 <= v8)
            {
              v18 |= v26 == v8;
            }
            else
            {
              self->interClusterMinIndex = v6;
              v8 = v25 - v19;
            }
          }
          v19 = v25;
          --v12;
        }
        while (v12);
        if ((v18 & (v21 > v9)) == 0)
          goto LABEL_39;
        self->interClusterMinIndex = v6;
        interClusterMinIndex = v10 - 1;
LABEL_40:
        if (interClusterMinIndex == v6)
          v9 = v21;
        if (v10 == 1)
          goto LABEL_43;
      }
      v21 = 0.0;
LABEL_39:
      interClusterMinIndex = self->interClusterMinIndex;
      goto LABEL_40;
    }
LABEL_43:
    free(v5);
    -[CPCluster assembleDensityDifferenceStats](self, "assembleDensityDifferenceStats");
  }
}

- (void)findClusters:(double *)a3 count:(unsigned int)a4
{
  if (a4)
  {
    self->xCount = a4;
    self->x = a3;
    -[CPCluster computeDifferencesFromData](self, "computeDifferencesFromData");
    -[CPCluster analyzeDifferences](self, "analyzeDifferences");
  }
}

- (void)findClustersFromDifferences:(double *)a3 count:(unsigned int)a4
{
  self->xCount = a4 + 1;
  self->dx = a3;
  -[CPCluster analyzeDifferences](self, "analyzeDifferences");
}

- (void)findDensityClusters:(double *)a3 count:(unsigned int)a4
{
  if (a4)
  {
    self->xCount = a4;
    self->x = a3;
    -[CPCluster computeDifferencesFromData](self, "computeDifferencesFromData");
    -[CPCluster analyzeDensities](self, "analyzeDensities");
  }
}

- (BOOL)applyDifferenceHints:(id *)a3 count:(unsigned int)a4
{
  char v4;
  char v7;
  uint64_t v8;
  double *p_var2;
  double v10;
  uint64_t v11;
  unint64_t v12;
  _BOOL4 v13;
  unint64_t v14;
  char v15;
  int v16;
  double v17;
  $CAD616572B4749F850842224FCF53B5F *v18;
  double var1;
  unsigned int levels;
  $CAD616572B4749F850842224FCF53B5F *dxStats;
  uint64_t v22;
  uint64_t v23;
  double *v24;
  double var2;
  double *p_var1;
  double v27;
  double v28;
  $CAD616572B4749F850842224FCF53B5F *v29;
  double v30;
  double v31;
  unint64_t v32;
  _BOOL4 v33;
  BOOL v34;
  unint64_t v35;
  uint64_t v36;

  v4 = 0;
  if (a3 && a4 && self->levels)
  {
    v7 = 0;
    v8 = a4;
    p_var2 = &a3->var2;
    v10 = 0.0;
    v11 = a4;
    do
    {
      if (*((_DWORD *)p_var2 - 4))
      {
        if ((v7 & 1) != 0 && *(p_var2 - 1) <= v10)
        {
          v4 = 0;
          return v4 & 1;
        }
        v10 = *p_var2;
        v7 = 1;
      }
      p_var2 += 4;
      --v11;
    }
    while (v11);
    v12 = 0;
    LOBYTE(v13) = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v4 = 0;
    v17 = 0.0;
    do
    {
      if (a3[v12].var0)
      {
        v18 = &a3[v12];
        var1 = v18->var1;
        levels = self->levels;
        dxStats = self->dxStats;
        v22 = levels - 1;
        if (levels == 1)
        {
          LODWORD(v23) = 0;
        }
        else
        {
          v23 = 0;
          v24 = &dxStats->var2;
          while (*v24 < var1)
          {
            ++v23;
            v24 += 4;
            if (v22 == v23)
            {
              LODWORD(v23) = levels - 1;
              break;
            }
          }
        }
        var2 = v18->var2;
        p_var1 = &dxStats[v22].var1;
        do
        {
          if (!--levels)
            break;
          v27 = *p_var1;
          p_var1 -= 4;
        }
        while (v27 > var2);
        v28 = dxStats[v23].var1;
        v29 = &dxStats[levels];
        if (var1 >= v28)
          v30 = var1;
        else
          v30 = v28;
        if (var2 <= v29->var2)
          v31 = var2;
        else
          v31 = v29->var2;
        if (v12)
          v32 = v23;
        else
          v32 = 0;
        if (v32 < levels)
        {
          v13 = -[CPCluster joinLevelsFrom:to:](self, "joinLevelsFrom:to:", v32);
          if ((_DWORD)v32)
            v33 = 0;
          else
            v33 = v13;
          v16 |= v33;
        }
        if ((v15 & (v32 <= v14)) == 1)
        {
          v13 = -[CPCluster splitLevelAtIndex:betweenValue:andValue:](self, "splitLevelAtIndex:betweenValue:andValue:", v32, v17, v30);
          v34 = !v13;
          if (v13)
            v16 |= (_DWORD)v32 == 0;
          LOBYTE(v13) = v13;
          if (v34)
            v32 = v32;
          else
            v32 = (v32 + 1);
        }
        if (v12 < v32)
        {
          while (-[CPCluster joinClosestLevelPairFrom:to:](self, "joinClosestLevelPairFrom:to:", v14, v32))
          {
            v16 |= (_DWORD)v14 == 0;
            v32 = (v32 - 1);
            if (v32 <= v12)
            {
              LOBYTE(v13) = 1;
              v35 = v32;
              goto LABEL_47;
            }
          }
          LOBYTE(v13) = 0;
        }
        v35 = v32;
LABEL_47:
        if (v12 > v35)
        {
          v36 = (32 * v35) | 8;
          while (1)
          {
            v13 = -[CPCluster splitLevelAtIndex:betweenValue:andValue:](self, "splitLevelAtIndex:betweenValue:andValue:", v35, *(double *)((char *)&self->dxStats->var0 + v36), v30);
            if (!v13)
              break;
            v16 |= v35++ == 0;
            v36 += 32;
            if (v12 == v35)
            {
              v32 = v12;
              goto LABEL_53;
            }
          }
          v32 = v35;
        }
LABEL_53:
        v4 |= v13;
        v15 = 1;
        v14 = v32;
        v17 = v31;
      }
      ++v12;
    }
    while (v12 != v8);
    if ((v16 & 1) != 0)
    {
      free(self->xStats);
      self->xStats = 0;
    }
  }
  return v4 & 1;
}

- (unsigned)clusterCount
{
  unsigned int result;
  unsigned int interClusterMinIndex;
  unsigned int xCount;
  BOOL v6;
  unsigned int v7;

  if (self->minClusterSize || self->maxClusterSpread != 1.79769313e308)
  {
    -[CPCluster assembleDataStats](self, "assembleDataStats");
    return self->clusterCount;
  }
  else
  {
    interClusterMinIndex = self->interClusterMinIndex;
    xCount = self->xCount;
    v6 = xCount >= interClusterMinIndex;
    v7 = xCount - interClusterMinIndex;
    if (v6)
      result = v7;
    else
      result = 0;
    self->clusterCount = result;
  }
  return result;
}

- (unsigned)levels
{
  return self->levels;
}

- ($CAD616572B4749F850842224FCF53B5F)clusterStatisticsAtIndex:(SEL)a3
{
  $CAD616572B4749F850842224FCF53B5F *result;
  $CAD616572B4749F850842224FCF53B5F *xStats;
  $CAD616572B4749F850842224FCF53B5F *v9;
  __int128 v10;

  result = ($CAD616572B4749F850842224FCF53B5F *)-[CPCluster assembleDataStats](self, "assembleDataStats");
  xStats = self->xStats;
  if (xStats)
  {
    v9 = &xStats[a4];
    v10 = *(_OWORD *)&v9->var2;
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&v9->var0;
    *(_OWORD *)&retstr->var2 = v10;
  }
  else
  {
    *(_OWORD *)&retstr->var0 = 0u;
    *(_OWORD *)&retstr->var2 = 0u;
  }
  return result;
}

- ($CAD616572B4749F850842224FCF53B5F)differenceClusterStatisticsAtIndex:(SEL)a3
{
  uint64_t v4;
  _OWORD *v5;
  __int128 v6;

  v4 = *(_QWORD *)&self[4].var0;
  if (v4)
  {
    v5 = (_OWORD *)(v4 + 32 * a4);
    v6 = v5[1];
    *(_OWORD *)&retstr->var0 = *v5;
    *(_OWORD *)&retstr->var2 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->var0 = 0u;
    *(_OWORD *)&retstr->var2 = 0u;
  }
  return self;
}

- ($CAD616572B4749F850842224FCF53B5F)largestClusterStatistics
{
  $CAD616572B4749F850842224FCF53B5F *result;
  $CAD616572B4749F850842224FCF53B5F *xStats;
  uint64_t clusterCount;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  $CAD616572B4749F850842224FCF53B5F *v11;
  unsigned int v12;
  unsigned int var0;
  $CAD616572B4749F850842224FCF53B5F *v14;
  __int128 v15;

  result = ($CAD616572B4749F850842224FCF53B5F *)-[CPCluster assembleDataStats](self, "assembleDataStats");
  xStats = self->xStats;
  if (!xStats)
    goto LABEL_10;
  clusterCount = self->clusterCount;
  if (!(_DWORD)clusterCount)
    goto LABEL_10;
  v8 = 0;
  LODWORD(v9) = 0;
  v10 = 0;
  v11 = self->xStats;
  do
  {
    var0 = v11->var0;
    ++v11;
    v12 = var0;
    if (var0 <= v10)
    {
      v9 = v9;
    }
    else
    {
      v10 = v12;
      v9 = v8;
    }
    ++v8;
  }
  while (clusterCount != v8);
  if (v10)
  {
    v14 = &xStats[v9];
    v15 = *(_OWORD *)&v14->var2;
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&v14->var0;
    *(_OWORD *)&retstr->var2 = v15;
  }
  else
  {
LABEL_10:
    *(_OWORD *)&retstr->var0 = 0u;
    *(_OWORD *)&retstr->var2 = 0u;
  }
  return result;
}

+ (unsigned)createOrderIndexFor:(double *)a3 ofSize:(unsigned int)a4
{
  size_t v6;
  unsigned int *v7;
  unsigned int *v8;
  uint64_t v9;

  v6 = a4;
  v7 = (unsigned int *)malloc_type_malloc(4 * a4, 0x100004052888210uLL);
  v8 = v7;
  if (a4)
  {
    v9 = 0;
    do
    {
      v7[v9] = v9;
      ++v9;
    }
    while (v6 != v9);
  }
  qsort_r(v7, v6, 4uLL, a3, (int (__cdecl *)(void *, const void *, const void *))compareDoubleIndirect);
  return v8;
}

- (void)tryLevel0SplitBetween:(double)a3 and:(double)a4 usingHints:(id *)a5
{
  if (!a5->var0)
  {
    a5->var0 = 1;
    a5->var1 = a3;
    a5->var2 = a3;
    a5->var3 = a3;
    goto LABEL_5;
  }
  if (a5->var2 < a4)
  {
LABEL_5:
    a5[1].var0 = 1;
    a5[1].var1 = a4;
    a5[1].var2 = a4;
    a5[1].var3 = a4;
  }
}

- (void)findClustersFromCharacterSequence:(id)a3 withSpaceHint:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  double *v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  char v15;
  unsigned int v16;
  _BOOL4 v17;
  $CAD616572B4749F850842224FCF53B5F *v18;
  uint64_t v19;
  int v20;
  $CAD616572B4749F850842224FCF53B5F *dxStats;
  double var2;
  double v23;
  double var1;
  unsigned int levels;
  double v26;
  double var3;
  double v28;
  int v29;
  unsigned int v31;
  double v32;
  $CAD616572B4749F850842224FCF53B5F *v37;
  unsigned int v38;
  $CAD616572B4749F850842224FCF53B5F *v39;
  _QWORD v40[2];
  double v41;
  double v42;

  v4 = a4;
  v7 = objc_msgSend(a3, "length");
  v8 = v7;
  if (v7)
    v9 = v7 - 1;
  else
    v9 = 0;
  if (v7 < 2)
    v10 = 0;
  else
    v10 = (double *)malloc_type_malloc(8 * v9, 0x100004000313F17uLL);
  v11 = (double *)malloc_type_malloc(0x40uLL, 0x100004089CA3EB1uLL);
  v40[0] = v10;
  v40[1] = v11;
  v41 = 0.0;
  v42 = 0.0;
  objc_msgSend(a3, "mapToPairsWithIndex:passing:", assembleClusterGaps, v40);
  v12 = v41;
  v13 = v42;
  v14 = v41 / 5.0;
  -[CPCluster setMinimumRecognizedInterClusterDifference:](self, "setMinimumRecognizedInterClusterDifference:", v14 + v14 * 0.00000011920929 + 1.17549435e-38);
  -[CPCluster setMinimumRecognizedInterLevel2ndDifference:](self, "setMinimumRecognizedInterLevel2ndDifference:", v14 + v14 * 0.00000011920929 + 1.17549435e-38);
  -[CPCluster findClustersFromDifferences:count:](self, "findClustersFromDifferences:count:", v10, v9);
  v15 = 1;
  self->ownDifferences = 1;
  if (v8 >= 2 && v12 > 0.0 && !*((_DWORD *)v11 + 8))
  {
    dxStats = self->dxStats;
    var2 = dxStats->var2;
    if (var2 > v14 && dxStats->var3 <= 0.0 && (self->levels == 1 || dxStats[1].var1 >= v13 * 2.5))
    {
      -[CPCluster tryLevel0SplitBetween:and:usingHints:](self, "tryLevel0SplitBetween:and:usingHints:", v11, dxStats->var1);
      goto LABEL_10;
    }
    if (v4)
    {
      v23 = v12 * 0.5;
      var1 = dxStats->var1;
      levels = self->levels;
      if (levels < 2)
      {
        if (var1 > v23 || v12 * 0.85 > var2)
          goto LABEL_10;
      }
      else
      {
        v26 = dxStats[1].var1;
        var3 = dxStats[1].var3;
        if (var2 >= v23)
        {
          v29 = 0;
        }
        else
        {
          if (levels < 3 || dxStats[2].var2 >= v13 * 2.5)
          {
            v29 = 0;
          }
          else if (v26 <= v23)
          {
            v29 = 0;
            v14 = dxStats[1].var3;
          }
          else
          {
            v28 = dxStats[2].var3;
            v29 = 1;
            *((_DWORD *)v11 + 8) = 1;
            v11[5] = v28;
            v11[6] = v28;
            v11[7] = v28;
          }
          v31 = *(_DWORD *)v11;
          if (*(_DWORD *)v11)
          {
            if (v11[2] < v14)
            {
              *(_DWORD *)v11 = v31 + 1;
              v32 = (v14 + (double)v31 * v11[3]) / (double)(v31 + 1);
              v11[2] = v14;
              v11[3] = v32;
            }
          }
          else
          {
            *(_DWORD *)v11 = 1;
            v11[1] = v14;
            v11[2] = v14;
            v11[3] = v14;
          }
        }
        if (v12 < var1 + var1 || v26 < v13 + v13 || var3 < v13 * 5.0 || v29 != 0)
          goto LABEL_10;
        if (v12 * 0.85 > var2)
        {
          if (v12 >= var2 + var2 && dxStats[1].var0 <= 0xB)
          {
            v37 = ($CAD616572B4749F850842224FCF53B5F *)malloc_type_realloc(dxStats, 32 * (self->levels + 1), 0x100004089CA3EB1uLL);
            if (v37)
            {
              self->dxStats = v37;
              v38 = self->levels;
              self->levels = v38 + 1;
              memmove(&v37[2], &v37[1], 32 * (v38 - 1));
              v39 = self->dxStats;
              v39[1].var0 = 0;
              v39[1].var1 = v12;
              v39[1].var2 = v13;
              v39[1].var3 = (v12 + v13) * 0.5;
            }
          }
          goto LABEL_10;
        }
      }
      -[CPCluster tryLevel0SplitBetween:and:usingHints:](self, "tryLevel0SplitBetween:and:usingHints:", v11);
      v15 = 0;
    }
  }
LABEL_10:
  v16 = self->levels;
  v17 = -[CPCluster applyDifferenceHints:count:](self, "applyDifferenceHints:count:", v11, 2);
  if ((v15 & 1) == 0 && v17 && self->levels > v16)
  {
    if (v8 >= 2)
    {
      v18 = self->dxStats;
      if (v9 <= 1)
        v19 = 1;
      else
        v19 = v9;
      v20 = 2;
      do
      {
        if (*v10 <= v18->var2)
        {
          if (v20 == 1)
            goto LABEL_27;
          v20 = 0;
        }
        else if (*v10 <= v18[1].var2)
        {
          if (!v20)
            goto LABEL_27;
          v20 = 1;
        }
        else
        {
          v20 = 2;
        }
        ++v10;
        --v19;
      }
      while (v19);
    }
    -[CPCluster joinLevelsFrom:to:](self, "joinLevelsFrom:to:", 0, 1);
  }
LABEL_27:
  free(v11);
}

- (void)makeWords:(id *)a3 count:(unsigned int)a4 fromCharacterSequence:(id)a5 charOffset:(unsigned int)a6
{
  unsigned int v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t levels;
  uint64_t v15;
  double *p_var2;
  uint64_t v17;
  $F82BA7CF80F7A1221027BFFB2739E57F *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  __int128 v23;
  __int128 v24;

  v8 = a4;
  if (-[CPCluster clusterCount](self, "clusterCount") < a4)
    v8 = -[CPCluster clusterCount](self, "clusterCount");
  if (v8)
  {
    v11 = 0;
    v12 = 0;
    v13 = v8;
    while (1)
    {
      a3[v11].var0 = v12 + a6;
      if ((_DWORD)v12)
        break;
      a3[v11].var2 = -1;
      if (self)
        goto LABEL_15;
      v17 = 0;
      v23 = 0u;
      v24 = 0u;
LABEL_16:
      v18 = &a3[v11];
      v18->var1 = v17;
      objc_msgSend(a5, "boundsFrom:length:", v12, v17, v23, v24);
      v18->var4.origin.x = v19;
      v18->var4.origin.y = v20;
      v18->var4.size.width = v21;
      v18->var4.size.height = v22;
      v12 = (v17 + v12);
      ++v11;
      v18->var3 = 0;
      if (v11 == v13)
        return;
    }
    levels = self->levels;
    if ((_DWORD)levels)
    {
      v15 = 0;
      p_var2 = &self->dxStats->var2;
      while (self->dx[(v12 - 1)] > *p_var2)
      {
        ++v15;
        p_var2 += 4;
        if (levels == v15)
          goto LABEL_14;
      }
      LODWORD(levels) = v15;
    }
LABEL_14:
    a3[v11].var2 = levels;
LABEL_15:
    -[CPCluster clusterStatisticsAtIndex:](self, "clusterStatisticsAtIndex:", v11);
    v17 = v23;
    goto LABEL_16;
  }
}

+ (void)clusterTextLine:(id)a3 withCluster:(id)a4 atLevel:(unsigned int)a5 withMaximumWordGap:(double *)a6 andMaximumLetterGap:(double *)a7
{
  if (a4)
    objc_msgSend(a4, "differenceClusterStatisticsAtIndex:", 0);
  *a7 = fabs(0.0) * 0.00000011920929 + 1.17549435e-38 + 0.0;
  if (a5 >= 2)
  {
    if (a4)
    {
      objc_msgSend(a4, "differenceClusterStatisticsAtIndex:", 1);
      *a6 = fabs(0.0) * 0.00000011920929 + 1.17549435e-38 + 0.0;
    }
    else
    {
      *a6 = 1.17549435e-38;
    }
    objc_msgSend(a3, "setIrregular:", 1, (unsigned __int128)0);
  }
}

+ (void)clusterTextLine:(id)a3
{
  CPCluster *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v13 = 1.70141173e38;
  v14 = 1.70141173e38;
  v5 = -[CPCluster initWithProfile:]([CPCluster alloc], "initWithProfile:", &kCPClusterProfileCharAdvance);
  v6 = objc_msgSend(a3, "charSequence");
  -[CPCluster findClustersFromCharacterSequence:withSpaceHint:](v5, "findClustersFromCharacterSequence:withSpaceHint:", v6, objc_msgSend(a3, "hasJustifiedAlignment") ^ 1);
  v7 = -[CPCluster clusterCount](v5, "clusterCount");
  -[CPCluster makeWords:count:fromCharacterSequence:charOffset:](v5, "makeWords:count:fromCharacterSequence:charOffset:", objc_msgSend(a3, "wordArrayOfSize:", v7), v7, v6, 0);
  v8 = -[CPCluster levels](v5, "levels");
  if ((_DWORD)v8)
  {
    objc_msgSend(a1, "clusterTextLine:withCluster:atLevel:withMaximumWordGap:andMaximumLetterGap:", a3, v5, v8, &v13, &v14);
    if ((_DWORD)v8 == 1)
    {
      v10 = v13;
      v9 = v14;
      if (v13 < v14)
        v13 = v14;
    }
  }
  objc_msgSend(a3, "setLevels:", v8, v9, v10, *(_QWORD *)&v13);
  HIDWORD(v11) = HIDWORD(v14);
  *(float *)&v11 = v14;
  objc_msgSend(a3, "setMaximumLetterGap:", v11);
  HIDWORD(v12) = HIDWORD(v13);
  *(float *)&v12 = v13;
  objc_msgSend(a3, "setMaximumWordGap:", v12);
  -[CPCluster dispose](v5, "dispose");

}

+ (void)reclusterTextLine:(id)a3 fromWordIndex:(unsigned int)a4 count:(unsigned int *)a5
{
  unsigned int v8;
  unsigned int *v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  _BOOL4 v15;
  _BOOL8 v16;
  CPCluster *v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  int v25;
  unsigned int v26;
  double v27;
  float v28;
  double v29;
  double v30;
  float v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v37;
  double v38;

  if (a5 && *a5)
  {
    v8 = *a5 + a4;
    v9 = (unsigned int *)objc_msgSend(a3, "wordAtIndex:", *(_QWORD *)&a4);
    v10 = (_DWORD *)objc_msgSend(a3, "wordAtIndex:", v8 - 1);
    v11 = *v9;
    v12 = (*v10 - v11 + v10[1]);
    v37 = 1.70141173e38;
    v38 = 1.70141173e38;
    v13 = (void *)objc_msgSend((id)objc_msgSend(a3, "charSequence"), "newSubsequenceFrom:length:", v11, v12);
    v14 = v9[3];
    if ((v14 & 4) != 0)
    {
      v16 = 0;
    }
    else
    {
      v15 = (v14 & 1) == 0 || (v10[3] & 2) == 0;
      v16 = (v10[3] & 8) == 0 && v15;
    }
    v17 = -[CPCluster initWithProfile:]([CPCluster alloc], "initWithProfile:", &kCPClusterProfileCharAdvance);
    -[CPCluster findClustersFromCharacterSequence:withSpaceHint:](v17, "findClustersFromCharacterSequence:withSpaceHint:", v13, v16);
    v18 = -[CPCluster clusterCount](v17, "clusterCount");
    v19 = objc_msgSend(a3, "wordCount");
    v20 = objc_msgSend(a3, "wordArrayOfSize:", v19 + (_DWORD)v18 - *a5);
    v21 = v20;
    if (*a5 != (_DWORD)v18)
    {
      if (v19 > v8)
        memmove((void *)(v20 + 48 * a4 + 48 * v18), (const void *)(v20 + 48 * v8), 48 * (v19 - v8));
      *a5 = v18;
    }
    -[CPCluster makeWords:count:fromCharacterSequence:charOffset:](v17, "makeWords:count:fromCharacterSequence:charOffset:", v21 + 48 * a4, v18, v13, v11);
    v22 = -[CPCluster levels](v17, "levels");
    if (!a4)
      objc_msgSend(a3, "setIrregular:", 0);
    if ((_DWORD)v22)
    {
      objc_msgSend(a1, "clusterTextLine:withCluster:atLevel:withMaximumWordGap:andMaximumLetterGap:", a3, v17, v22, &v37, &v38);
      if ((_DWORD)v22 == 1)
      {
        v24 = v37;
        v23 = v38;
        if (v37 < v38)
        {
          v37 = v38;
          *(float *)&v23 = v38;
          objc_msgSend(a3, "setMaximumWordGap:", v23, v24);
        }
      }
    }
    if (a4)
    {
      v25 = objc_msgSend(a3, "levels", v23, v24);
      v26 = v25;
      if ((_DWORD)v22 && v25 >= 1)
      {
        v27 = v38;
        objc_msgSend(a3, "maximumLetterGap");
        if (v27 > v28)
        {
          HIDWORD(v29) = HIDWORD(v38);
          *(float *)&v29 = v38;
          objc_msgSend(a3, "setMaximumLetterGap:", v29);
        }
        if (v22 >= 2 && v26 >= 2)
        {
          v30 = v37;
          objc_msgSend(a3, "maximumWordGap");
          if (v30 > v31)
          {
            HIDWORD(v32) = HIDWORD(v37);
            *(float *)&v32 = v37;
            objc_msgSend(a3, "setMaximumWordGap:", v32);
          }
        }
      }
      if (v22 <= v26)
        goto LABEL_37;
      objc_msgSend(a3, "setLevels:", v22);
      if (v26 != 1)
      {
        if (v26)
          goto LABEL_37;
        HIDWORD(v33) = HIDWORD(v38);
        *(float *)&v33 = v38;
        objc_msgSend(a3, "setMaximumLetterGap:", v33);
        if (v22 < 2)
          goto LABEL_37;
      }
    }
    else
    {
      objc_msgSend(a3, "setLevels:", v22, v23, v24);
      HIDWORD(v34) = HIDWORD(v38);
      *(float *)&v34 = v38;
      objc_msgSend(a3, "setMaximumLetterGap:", v34);
    }
    HIDWORD(v35) = HIDWORD(v37);
    *(float *)&v35 = v37;
    objc_msgSend(a3, "setMaximumWordGap:", v35);
LABEL_37:
    -[CPCluster dispose](v17, "dispose");

    objc_msgSend(v13, "dispose");
  }
}

@end
