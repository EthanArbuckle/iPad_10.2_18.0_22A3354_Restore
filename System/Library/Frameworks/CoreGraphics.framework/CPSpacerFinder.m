@implementation CPSpacerFinder

- (CPSpacerFinder)initWithContentZone:(id)a3
{
  CPSpacerFinder *v4;
  CPSpacerFinder *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  objc_super v15;
  CGRect v16;

  v15.receiver = self;
  v15.super_class = (Class)CPSpacerFinder;
  v4 = -[CPSpacerFinder init](&v15, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->contentZone = (CPZone *)a3;
    objc_msgSend(a3, "zoneBounds");
    v5->zoneBounds.origin.x = v6;
    v5->zoneBounds.origin.y = v7;
    v5->zoneBounds.size.width = v8;
    v5->zoneBounds.size.height = v9;
    if ((objc_msgSend(a3, "hasBorders") & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(a3, "charactersInZone"), "bounds");
      v16.origin.x = v10;
      v16.origin.y = v11;
      v16.size.width = v12;
      v16.size.height = v13;
      v5->zoneBounds = CGRectUnion(v5->zoneBounds, v16);
    }
    v5->textBounds = CGRectNull;
  }
  return v5;
}

- (void)dispose
{
  unint64_t v3;
  $54B00B245656622C10B7392301C15C5B *segmentations;
  uint64_t var1;
  uint64_t v6;
  uint64_t v7;
  const void *v8;

  if (self->contentZone)
  {
    free(self->qualityEntries);
    if (self->segmentationCount)
    {
      v3 = 0;
      do
      {
        segmentations = self->segmentations;
        var1 = segmentations[v3].var1;
        if ((_DWORD)var1)
        {
          v6 = 0;
          v7 = 72 * var1;
          do
          {
            v8 = *(const void **)((char *)self->segmentations[v3].var2 + v6 + 56);
            if (v8)
              CFRelease(v8);
            v6 += 72;
          }
          while (v7 != v6);
          segmentations = self->segmentations;
        }
        free(segmentations[v3++].var2);
      }
      while (v3 < self->segmentationCount);
    }
    free(self->segmentations);
    free(self->spacerSequence.ordered);
    free(self->spacerSequence.stats);
    self->contentZone = 0;
  }
}

- (void)finalize
{
  objc_super v3;

  -[CPSpacerFinder dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPSpacerFinder;
  -[CPSpacerFinder finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  objc_super v3;

  -[CPSpacerFinder dispose](self, "dispose");

  v3.receiver = self;
  v3.super_class = (Class)CPSpacerFinder;
  -[CPSpacerFinder dealloc](&v3, sel_dealloc);
}

- (void)initializeSegmentations
{
  id v3;
  unsigned int v4;
  $54B00B245656622C10B7392301C15C5B *segmentations;
  uint64_t v6;
  size_t v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  size_t segmentationCount;
  CGRect v14;

  v3 = -[CPZone textLinesInZone](self->contentZone, "textLinesInZone");
  v4 = objc_msgSend(v3, "count");
  self->segmentationCount = v4;
  if (v4)
  {
    segmentations = ($54B00B245656622C10B7392301C15C5B *)malloc_type_calloc(v4, 0x18uLL, 0x10A00406B6A53AFuLL);
    self->segmentations = segmentations;
    if (self->segmentationCount)
    {
      v6 = 0;
      v7 = 0;
      do
      {
        v8 = (void *)objc_msgSend(v3, "objectAtIndex:", v7);
        self->segmentations[v6].var0 = v8;
        objc_msgSend(v8, "bounds");
        v14.origin.x = v9;
        v14.origin.y = v10;
        v14.size.width = v11;
        v14.size.height = v12;
        self->textBounds = CGRectUnion(self->textBounds, v14);
        ++v7;
        segmentationCount = self->segmentationCount;
        ++v6;
      }
      while (v7 < segmentationCount);
      segmentations = self->segmentations;
    }
    else
    {
      segmentationCount = 0;
    }
    qsort(segmentations, segmentationCount, 0x18uLL, (int (__cdecl *)(const void *, const void *))compareSegmentationsBottomAscendingLeftDescending);
  }
}

- (void)initializeJunctions
{
  unsigned int segmentationCount;
  uint64_t v4;
  unint64_t v5;
  $54B00B245656622C10B7392301C15C5B *segmentations;
  uint64_t v7;
  id var0;
  uint64_t *p_p_var1;
  void *v10;
  $54B00B245656622C10B7392301C15C5B *v11;
  size_t var1;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  unsigned int v14;
  unsigned int v17;
  uint64_t p_var1;
  uint64_t v19;

  segmentationCount = self->segmentationCount;
  self->spacerSequence.allocatedSize = segmentationCount;
  if (segmentationCount)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      segmentations = self->segmentations;
      if (objc_msgSend(segmentations[v4].var0, "isMonospaced"))
      {
        p_var1 = (uint64_t)&segmentations[v4].var1;
        v19 = 0;
        objc_msgSend(segmentations[v4].var0, "monospaceWidth", p_var1, 0);
        v19 = v7;
        var0 = segmentations[v4].var0;
        p_p_var1 = &p_var1;
        v10 = countJunctionsMonospaced;
      }
      else
      {
        p_p_var1 = (uint64_t *)&segmentations[v4].var1;
        var0 = segmentations[v4].var0;
        v10 = countJunctions;
      }
      objc_msgSend(var0, "mapToWordPairs:passing:", v10, p_p_var1);
      v11 = &segmentations[v4];
      var1 = v11->var1;
      if ((_DWORD)var1)
      {
        v13 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_calloc(var1, 0x48uLL, 0x102004029F24FBBuLL);
        v14 = v11->var1;
      }
      else
      {
        v14 = 0;
        v13 = 0;
      }
      v11->var2 = v13;
      segmentationCount = self->spacerSequence.allocatedSize + v14;
      self->spacerSequence.allocatedSize = segmentationCount;
      ++v5;
      ++v4;
    }
    while (v5 < self->segmentationCount);
  }
  if (self->textBounds.origin.x != INFINITY
    && self->textBounds.origin.y != INFINITY
    && self->zoneBounds.origin.x != INFINITY
    && self->zoneBounds.origin.y != INFINITY)
  {
    self->spacerSequence.allocatedSize = ++segmentationCount;
  }
  if (segmentationCount)
  {
    v17 = 2 * segmentationCount;
    self->spacerSequence.allocatedSize = v17;
    self->spacerSequence.stats = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc((unint64_t)v17 << 6, 0x10A00403DB86E81uLL);
    self->spacerSequence.ordered = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)malloc_type_calloc(self->spacerSequence.allocatedSize, 8uLL, 0x2004093837F09uLL);
  }
}

- (void)findSpacers
{
  double y;
  double x;
  BOOL v5;
  double v6;
  BOOL v7;
  unsigned int v8;
  CGFloat height;
  double v10;
  unsigned int segmentationCount;
  unint64_t v12;
  $54B00B245656622C10B7392301C15C5B *v13;
  uint64_t v14;
  __int128 v15;
  int v16;
  id var0;
  uint64_t v18;
  uint64_t v19;
  uint64_t count;
  uint64_t v21;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **ordered;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v28;
  double v29;
  uint64_t v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  id v38;
  __int128 v39;
  double v40;
  $4456F195E26435C2C968A1EC1E69351F *p_spacerSequence;
  _BYTE v42[32];
  __int128 v43;
  __int128 v44;
  __int128 v45;

  -[CPSpacerFinder initializeSegmentations](self, "initializeSegmentations");
  -[CPSpacerFinder initializeJunctions](self, "initializeJunctions");
  x = self->textBounds.origin.x;
  y = self->textBounds.origin.y;
  v5 = x == INFINITY || y == INFINITY;
  if (v5
    || ((v6 = self->zoneBounds.origin.x, v6 != INFINITY) ? (v7 = self->zoneBounds.origin.y == INFINITY) : (v7 = 1), v7))
  {
    v8 = 0;
  }
  else
  {
    height = self->textBounds.size.height;
    v10 = x - v6;
    if (x - v6 > 0.0)
      x = self->zoneBounds.origin.x;
    v42[27] = 0;
    *(_WORD *)&v42[25] = 0;
    segmentationCount = self->segmentationCount;
    *(double *)&v39 = x;
    *((double *)&v39 + 1) = y;
    v40 = fmax(v10, 0.0);
    p_spacerSequence = *($4456F195E26435C2C968A1EC1E69351F **)&height;
    *(_DWORD *)v42 = segmentationCount;
    memset(&v42[4], 0, 20);
    v8 = 1;
    v42[24] = 1;
    *(_DWORD *)&v42[28] = 0;
    addSpacer((uint64_t)&self->spacerSequence, 0, &v39);
  }
  if (self->segmentationCount)
  {
    v12 = 0;
    do
    {
      v13 = &self->segmentations[v12];
      if (objc_msgSend(v13->var0, "wordCount", y))
      {
        v14 = objc_msgSend(v13->var0, "firstWord");
        v15 = *(_OWORD *)(v14 + 32);
        v44 = *(_OWORD *)(v14 + 16);
        v45 = v15;
        v40 = 0.0;
        *(_QWORD *)&v42[8] = 0;
        *(_QWORD *)&v39 = v12;
        *((_QWORD *)&v39 + 1) = v13;
        p_spacerSequence = &self->spacerSequence;
        *(_QWORD *)v42 = v8;
        *(_OWORD *)&v42[16] = v44;
        v43 = v15;
        v16 = objc_msgSend(v13->var0, "wordCount", v12, v13, 0, &self->spacerSequence);
        var0 = v13->var0;
        if (v16 == 1)
        {
          v18 = objc_msgSend(var0, "firstWord");
          objc_msgSend(v13->var0, "charSequence");
          segmentTextLine(0, v18, 0, v19, (uint64_t)&v39);
        }
        else
        {
          objc_msgSend(var0, "mapToWordPairsWithIndex:passing:", segmentTextLine, &v39);
        }
        count = self->spacerSequence.count;
        if (*(_DWORD *)v42 < count)
        {
          v21 = count - *(unsigned int *)v42;
          v22 = &self->spacerSequence.ordered[*(unsigned int *)v42];
          do
          {
            if (!*((_BYTE *)*v22 + 56))
              ++*((_DWORD *)*v22 + 8);
            ++v22;
            --v21;
          }
          while (v21);
        }
      }
      ++v12;
    }
    while (v12 < self->segmentationCount);
    objc_msgSend(v13->var0, "bounds");
    v25 = self->spacerSequence.count;
    if ((_DWORD)v25)
    {
      v26 = v23 + v24;
      ordered = self->spacerSequence.ordered;
      do
      {
        v28 = *ordered;
        if (*ordered && !*((_BYTE *)v28 + 56))
        {
          v29 = v26 - *((double *)v28 + 1);
          if (*((double *)v28 + 3) < v29)
            *((double *)v28 + 3) = v29;
          *((_BYTE *)v28 + 56) = 1;
        }
        ++ordered;
        --v25;
      }
      while (v25);
    }
  }
  if (v8)
  {
    v30 = self->spacerSequence.count;
    v31 = self->textBounds.origin.y;
    v32 = self->textBounds.size.height;
    v33 = self->textBounds.origin.x + self->textBounds.size.width;
    v34 = fmax(self->zoneBounds.origin.x + self->zoneBounds.size.width - v33, 0.0);
    v42[27] = 0;
    *(_WORD *)&v42[25] = 0;
    v35 = self->segmentationCount;
    *(CGFloat *)&v39 = v33;
    *((CGFloat *)&v39 + 1) = v31;
    v40 = v34;
    p_spacerSequence = *($4456F195E26435C2C968A1EC1E69351F **)&v32;
    *(_DWORD *)v42 = v35;
    memset(&v42[4], 0, 20);
    v42[24] = 1;
    *(_DWORD *)&v42[28] = 0;
    addSpacer((uint64_t)&self->spacerSequence, v30, &v39);
    if (self->segmentationCount)
    {
      v36 = 0;
      v37 = 0;
      do
      {
        v38 = self->segmentations[v36].var0;
        objc_msgSend(v38, "setLeftSpacerIndex:", 0);
        objc_msgSend(v38, "setRightSpacerIndex:", v30);
        ++v37;
        ++v36;
      }
      while (v37 < self->segmentationCount);
    }
  }
}

- (void)assessQuality
{
  unsigned int count;
  CPSpacerFinder *v3;
  uint64_t v4;
  $54B00B245656622C10B7392301C15C5B *segmentations;
  $54B00B245656622C10B7392301C15C5B *v6;
  uint64_t v7;
  unint64_t var1;
  uint64_t v9;
  unint64_t v10;
  int v11;
  int v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  unsigned int *v14;
  unsigned int v15;
  int v16;
  int v17;
  uint64_t v18;
  unsigned int v19;
  char v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  unsigned int *p_var13;
  char v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  $0E7C6181E695A4EE4B83C13AD15AF82E *v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  int8x16_t v47;
  unsigned int v48;
  unsigned int v49;
  int v50;
  $0E7C6181E695A4EE4B83C13AD15AF82E *qualityEntries;
  CGSize v52;
  double *v53;
  $0E7C6181E695A4EE4B83C13AD15AF82E *v54;
  int v55;
  uint64_t v56;
  $0E7C6181E695A4EE4B83C13AD15AF82E *v57;
  double *v58;
  $0E7C6181E695A4EE4B83C13AD15AF82E *v59;
  int v60;
  uint64_t v61;
  $0E7C6181E695A4EE4B83C13AD15AF82E *v62;
  _BOOL4 v63;
  uint64_t v64;
  _BOOL4 v65;
  $0E7C6181E695A4EE4B83C13AD15AF82E *v66;
  double var0;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  int v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  uint64_t v88;
  CPSpacerFinder *v89;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **p_var2;
  id *p_var0;
  unsigned int *p_var1;
  uint64_t v93;
  unint64_t v94;
  int v95;
  int v96;
  double *v97;
  double v98;
  int v99;
  int v100;
  int v101;
  uint64_t v102;
  int v103;
  float64_t height;
  float64_t width;
  CGRect v106;
  CGRect v107;

  count = self->spacerSequence.count;
  if (count)
  {
    v3 = self;
    self->qualityEntries = ($0E7C6181E695A4EE4B83C13AD15AF82E *)malloc_type_malloc(176 * count, 0x10000401EC9425BuLL);
    if (v3->segmentationCount)
    {
      v4 = 0;
      v103 = 0;
      v89 = v3;
      while (1)
      {
        segmentations = v3->segmentations;
        v6 = &segmentations[v4];
        v7 = objc_msgSend(v6->var0, "wordArray");
        p_var0 = &v6->var0;
        var1 = v6->var1;
        p_var1 = &v6->var1;
        v88 = v4;
        if (v6->var1)
          break;
LABEL_120:
        v4 = v88 + 1;
        if (v88 + 1 >= (unint64_t)v3->segmentationCount)
          return;
      }
      v9 = v7;
      v10 = 0;
      v11 = 0;
      p_var2 = &segmentations[v4].var2;
      v12 = *(_DWORD *)*p_var2 + 1;
      v93 = v7;
      while (1)
      {
        v13 = *p_var2;
        v14 = (unsigned int *)((char *)*p_var2 + 72 * v10);
        v15 = *v14;
        v16 = v10 + 1 >= var1 ? objc_msgSend(*p_var0, "wordCount") : v14[18] + 1;
        v102 = v9 + 48 * v15;
        v17 = v12 - v11;
        v96 = v16;
        v94 = v10 + 1;
        if (v12 - v11 == 1)
        {
          v18 = objc_msgSend(*p_var0, "charSequence");
          v19 = *(_DWORD *)(v9 + 48 * v15 + 4);
          if (v19 < 5)
          {
LABEL_17:
            v20 = 1;
          }
          else if (v19 <= 7)
          {
            v21 = (void *)v18;
            v22 = v19 - 1;
            while (1)
            {
              v20 = v22 != -1;
              if (v22 == -1)
                break;
              v23 = objc_msgSend(v21, "charAtIndex:", v22 + *(_DWORD *)v102);
              --v22;
              if (*(unsigned __int16 *)(v23 + 72) <= 0x30u)
                goto LABEL_17;
            }
          }
          else
          {
            v20 = 0;
          }
          v16 = v96;
        }
        else
        {
          v20 = 0;
        }
        v24 = v16 - v12;
        LOBYTE(v25) = v16 - v12 == 1 && *(_DWORD *)(v102 + 52) < 5u;
        v26 = *((_QWORD *)v13 + 9 * v10 + 5);
        v95 = v12;
        if (v26)
          break;
        v3 = v89;
LABEL_119:
        v9 = v93;
        var1 = *p_var1;
        v10 = v94;
        v11 = v95;
        v12 = v96;
        if (v94 >= var1)
          goto LABEL_120;
      }
      p_var13 = 0;
      v28 = 0;
      v29 = v93 + 48 * v15;
      v101 = *(_DWORD *)(v29 + 12) & 0xA;
      v99 = *(_DWORD *)(v102 + 56);
      v100 = *(_DWORD *)(v102 + 60) & 5;
      v30 = *(double *)(v29 + 16);
      v31 = v30 + *(double *)(v29 + 32);
      v32 = *(double *)(v102 + 64);
      v33 = v32 + *(double *)(v102 + 80);
      if (v17 == 1)
        v34 = *(double *)(v29 + 16);
      else
        v34 = v30 + *(double *)(v29 + 32);
      v98 = v34;
      v35 = (uint64_t)v13 + 72 * v10 + 8;
      v97 = (double *)(v93 + 48 * v15 + 40);
      if (v24 == 1)
        v36 = v32 + *(double *)(v102 + 80);
      else
        v36 = *(double *)(v102 + 64);
      v3 = v89;
      while (1)
      {
        v37 = *(double *)v35;
        v38 = *(double *)(v35 + 8);
        v106.size.width = *(CGFloat *)(v35 + 16);
        v106.size.height = *(CGFloat *)(v35 + 24);
        v106.origin.x = *(CGFloat *)v35;
        v106.origin.y = v38;
        height = v106.size.height;
        width = v106.size.width;
        if (CGRectIntersectsRect(v106, *(CGRect *)v26))
          break;
LABEL_116:
        v26 = *(_QWORD *)(v26 + 40);
        if (!v26)
          goto LABEL_119;
      }
      v39 = *($0E7C6181E695A4EE4B83C13AD15AF82E **)(v26 + 48);
      if (!v39)
      {
        qualityEntries = v89->qualityEntries;
        v39 = &qualityEntries[v103];
        *(_QWORD *)(v26 + 48) = v39;
        v52 = *(CGSize *)(v35 + 16);
        v39->var0.origin = *(CGPoint *)v35;
        v39->var0.size = v52;
        v39->var1 = 1;
        v39->var2 = v17 == 1;
        v39->var3 = v24 == 1;
        v53 = &v39->var14.var0;
        if ((v20 & 1) != 0)
        {
          *v53 = v30;
          v54 = &qualityEntries[v103];
          v54->var14.var1 = 0.0;
          v54->var15.var0 = v31;
          v54->var15.var1 = 0.0;
          v55 = 1;
          v56 = 1;
        }
        else
        {
          v55 = 0;
          *(_OWORD *)v53 = CGIntervalNull;
          qualityEntries[v103].var15 = ($F24F406B2B787EFB06265DBA3D28CBD5)CGIntervalNull;
          v56 = 0;
        }
        *(_QWORD *)&v39->var4 = v56;
        v39->var6 = v55;
        v57 = &qualityEntries[v103];
        v58 = &v57->var16.var0;
        if ((v25 & 1) != 0)
        {
          *v58 = v32;
          v59 = &qualityEntries[v103];
          v59->var16.var1 = 0.0;
          v59->var17.var0 = v33;
          v59->var17.var1 = 0.0;
          v60 = 1;
          v61 = 1;
        }
        else
        {
          v60 = 0;
          *(_OWORD *)v58 = CGIntervalNull;
          qualityEntries[v103].var17 = ($F24F406B2B787EFB06265DBA3D28CBD5)CGIntervalNull;
          v61 = 0;
        }
        *(_QWORD *)&v57->var7 = v61;
        v57->var9 = v60;
        v62 = &qualityEntries[v103];
        v62->var18 = v98;
        v62->var19 = v36;
        v62->var10 = v99 > 1;
        if (v101)
          v63 = 1;
        else
          v63 = *(double *)v26 - v31 <= *v97 * 0.1;
        qualityEntries[v103].var11 = v63;
        if (v100)
          v65 = 1;
        else
          v65 = v32 - (*(double *)v26 + *(double *)(v26 + 16)) <= *(double *)(v102 + 88) * 0.1;
        v66 = &qualityEntries[v103];
        v66->var12 = v65;
        v66->var13 = v28 & 1;
        ++v103;
        *(_WORD *)&v66->var20 = 0;
        v66->var22 = 1;
        if ((v28 & 1) == 0)
          goto LABEL_114;
        if (!p_var13)
          goto LABEL_115;
LABEL_113:
        ++*p_var13;
        v28 = 1;
        p_var13 = 0;
        goto LABEL_116;
      }
      if (v24 == 1 && *(_DWORD *)(v102 + 52) <= 4u)
      {
        v64 = *(_QWORD *)(v26 + 40);
        if (!v64)
        {
LABEL_54:
          v25 = 1;
          goto LABEL_35;
        }
        while (1)
        {
          v107.origin.x = v37;
          v107.origin.y = v38;
          v107.size.height = height;
          v107.size.width = width;
          if (CGRectIntersectsRect(v107, *(CGRect *)v64))
          {
            if (*(_QWORD *)(v64 + 48))
              break;
          }
          v64 = *(_QWORD *)(v64 + 40);
          if (!v64)
            goto LABEL_54;
        }
      }
      v25 = 0;
LABEL_35:
      v40.f64[0] = width;
      v41.f64[0] = *(float64_t *)v35;
      v41.f64[1] = v39->var0.origin.y;
      v40.f64[1] = v39->var0.size.height;
      v42.f64[0] = v39->var0.size.width;
      v43.f64[0] = v39->var0.origin.x;
      v43.f64[1] = *(float64_t *)(v35 + 8);
      v42.f64[1] = height;
      v44 = vaddq_f64(v41, v40);
      v45 = vaddq_f64(v43, v42);
      v46 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v41, v43), *(int8x16_t *)v35, (int8x16_t)v39->var0.origin);
      v47 = (int8x16_t)vcgtq_f64(v45, v44);
      v41.f64[0] = v44.f64[0];
      v41.f64[1] = v45.f64[1];
      v45.f64[1] = v44.f64[1];
      v39->var0.origin = (CGPoint)v46;
      v39->var0.size = (CGSize)vsubq_f64((float64x2_t)vbslq_s8(v47, (int8x16_t)v41, (int8x16_t)v45), v46);
      v48 = v39->var1;
      v49 = v48 + 1;
      v39->var1 = v48 + 1;
      if (v17 == 1)
        ++v39->var2;
      if (v24 == 1)
        ++v39->var3;
      v20 &= v28 ^ 1;
      if ((v20 & 1) != 0)
      {
        ++v39->var4;
        if (v39->var6)
        {
          v50 = v49 - v39->var5;
        }
        else
        {
          v39->var5 = v48;
          v50 = 1;
        }
        v39->var6 = v50;
        var0 = v39->var14.var0;
        v68 = 0.0;
        v69 = v30;
        v70 = 0.0;
        if (fabs(var0) != INFINITY)
        {
          v71 = v39->var14.var1;
          v70 = -v71;
          if (v71 >= 0.0)
          {
            v70 = v39->var14.var1;
            v71 = -0.0;
          }
          v69 = var0 + v71;
          v72 = v70 + v69;
          if (v69 <= v30)
          {
            if (v72 < v30)
              v70 = v30 - v69;
          }
          else
          {
            v70 = v72 - v30;
            v69 = v30;
          }
        }
        v39->var14.var0 = v69;
        v39->var14.var1 = v70;
        v73 = v39->var15.var0;
        v74 = v31;
        if (fabs(v73) != INFINITY)
        {
          v75 = v39->var15.var1;
          v68 = -v75;
          if (v75 >= 0.0)
          {
            v68 = v39->var15.var1;
            v75 = -0.0;
          }
          v74 = v73 + v75;
          v76 = v68 + v74;
          if (v74 <= v31)
          {
            if (v76 < v31)
              v68 = v31 - v74;
          }
          else
          {
            v68 = v76 - v31;
            v74 = v31;
          }
        }
        v39->var15.var0 = v74;
        v39->var15.var1 = v68;
      }
      if (v25)
      {
        ++v39->var7;
        if (v39->var9)
        {
          v77 = v49 - v39->var8;
        }
        else
        {
          v39->var8 = v48;
          v77 = 1;
        }
        v39->var9 = v77;
        v78 = v39->var16.var0;
        v79 = 0.0;
        v80 = v32;
        v81 = 0.0;
        if (fabs(v78) != INFINITY)
        {
          v82 = v39->var16.var1;
          v81 = -v82;
          if (v82 >= 0.0)
          {
            v81 = v39->var16.var1;
            v82 = -0.0;
          }
          v80 = v78 + v82;
          v83 = v81 + v80;
          if (v80 <= v32)
          {
            if (v83 < v32)
              v81 = v32 - v80;
          }
          else
          {
            v81 = v83 - v32;
            v80 = v32;
          }
        }
        v39->var16.var0 = v80;
        v39->var16.var1 = v81;
        v84 = v39->var17.var0;
        v85 = v33;
        if (fabs(v84) != INFINITY)
        {
          v86 = v39->var17.var1;
          v79 = -v86;
          if (v86 >= 0.0)
          {
            v79 = v39->var17.var1;
            v86 = -0.0;
          }
          v85 = v84 + v86;
          v87 = v79 + v85;
          if (v85 <= v33)
          {
            if (v87 < v33)
              v79 = v33 - v85;
          }
          else
          {
            v79 = v87 - v33;
            v85 = v33;
          }
        }
        v39->var17.var0 = v85;
        v39->var17.var1 = v79;
      }
      if (v17 != 1 && v39->var18 < v31)
        v39->var18 = v31;
      if (v24 != 1 && v39->var19 > v32)
        v39->var19 = v32;
      if (v99 >= 2)
        ++v39->var10;
      if (v101 || *(double *)v26 - v31 <= *v97 * 0.1)
        ++v39->var11;
      if (v100 || v32 - (*(double *)v26 + *(double *)(v26 + 16)) <= *(double *)(v102 + 88) * 0.1)
        ++v39->var12;
      if ((v28 & 1) == 0)
      {
LABEL_114:
        p_var13 = &v39->var13;
LABEL_115:
        v28 = 1;
        goto LABEL_116;
      }
      ++v39->var13;
      if (!p_var13)
        goto LABEL_115;
      goto LABEL_113;
    }
  }
}

- (void)determineValidity
{
  CPSpacerFinder *v2;
  uint64_t v3;
  $54B00B245656622C10B7392301C15C5B *segmentations;
  $54B00B245656622C10B7392301C15C5B *v5;
  uint64_t v6;
  unint64_t var1;
  unint64_t v8;
  int v9;
  int v10;
  $54B00B245656622C10B7392301C15C5B *v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var2;
  double *v13;
  int v14;
  char v15;
  int v16;
  int v17;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v18;
  unsigned int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CGRect *v25;
  uint64_t v26;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double height;
  uint64_t v32;
  uint64_t v33;
  id v34;
  unint64_t v35;
  uint64_t v36;
  double v37;
  BOOL v38;
  void *v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  BOOL v48;
  double v49;
  BOOL v50;
  float v51;
  float v52;
  double v53;
  double v54;
  CGFloat v55;
  double v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  __CFArray *Mutable;
  double v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  unsigned int v82;
  uint64_t v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  unsigned int v89;
  double v90;
  uint64_t v91;
  double *v92;
  double v93;
  double v94;
  double v95;
  uint64_t v96;
  unsigned int v97;
  BOOL v98;
  unsigned int v99;
  uint64_t v100;
  uint64_t v101;
  double v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  _BOOL4 v106;
  BOOL v107;
  uint64_t v108;
  const __CFAllocator *allocator;
  int v110;
  unsigned int v111;
  double v112;
  float v113;
  $4456F195E26435C2C968A1EC1E69351F *p_spacerSequence;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **p_var2;
  uint64_t v116;
  unsigned int *p_var1;
  double *v118;
  double *v119;
  CGFloat *v120;
  uint64_t v121;
  char v122;
  double *v123;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v124;
  unint64_t v125;
  unint64_t v126;
  int v127;
  int v128;
  CFTypeRef *v129;
  id *p_var0;
  CGFloat v131;
  CGFloat v132;
  double v134;
  double v135;
  uint64_t v136;
  double v137;
  double v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;

  if (self->segmentationCount)
  {
    v2 = self;
    v3 = 0;
    allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    p_spacerSequence = &self->spacerSequence;
    do
    {
      segmentations = v2->segmentations;
      v108 = v3;
      v5 = &segmentations[v3];
      v6 = objc_msgSend(v5->var0, "wordArray");
      p_var0 = &v5->var0;
      var1 = v5->var1;
      v116 = v6;
      p_var1 = &v5->var1;
      if (!v5->var1)
        goto LABEL_143;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = &segmentations[v108];
      var2 = v11->var2;
      p_var2 = &v11->var2;
      v13 = 0;
      v14 = *(_DWORD *)var2 + 1;
      v15 = 1;
      do
      {
        v123 = v13;
        v122 = v15;
        v16 = v9;
        v17 = v14;
        v18 = *p_var2;
        v19 = (unsigned int *)((char *)*p_var2 + 72 * v8);
        v126 = v8 + 1;
        if (v8 + 1 >= var1)
          v127 = objc_msgSend(*p_var0, "wordCount");
        else
          v127 = v19[18] + 1;
        v128 = v17;
        v20 = (v17 - v16);
        v121 = v116 + 48 * *v19;
        v21 = *((_QWORD *)v18 + 9 * v8 + 5);
        v124 = v18;
        v125 = v8;
        if (!v21)
        {
          if ((_DWORD)v20 == 1)
            objc_msgSend(*p_var0, "charSequence");
          LODWORD(v23) = 0;
          v22 = 0;
LABEL_73:
          v14 = v127;
          v9 = v128;
          v75 = v126;
          goto LABEL_76;
        }
        v111 = *v19;
        v110 = v10;
        v22 = 0;
        v23 = 0;
        v24 = (uint64_t)v18 + 72 * v8;
        v25 = (CGRect *)(v24 + 8);
        v129 = (CFTypeRef *)(v24 + 56);
        v119 = (double *)(v24 + 24);
        v120 = (CGFloat *)(v24 + 16);
        v118 = (double *)(v24 + 32);
        do
        {
          v26 = *(_QWORD *)(v21 + 48);
          if (v26 && *(_BYTE *)(v26 + 170))
          {
            v139 = CGRectIntersection(*v25, *(CGRect *)v21);
            x = v139.origin.x;
            if (v139.origin.x != INFINITY && v139.origin.y != INFINITY)
            {
              y = v139.origin.y;
              width = v139.size.width;
              height = v139.size.height;
              v32 = v20;
              v33 = v23;
              v34 = -[CPZone graphicsInZone](v2->contentZone, "graphicsInZone");
              v35 = objc_msgSend(v34, "count");
              if (!v35)
                goto LABEL_57;
              v136 = v22;
              v36 = 0;
              v37 = height * 0.05;
              v137 = height * 0.01;
              v38 = 1;
              do
              {
                v39 = (void *)objc_msgSend(v34, "objectAtIndex:", v36);
                objc_msgSend(v39, "renderedBounds");
                if (v43 < height + height)
                {
                  v146.origin.x = v40;
                  v146.origin.y = v41;
                  v44 = v42;
                  v45 = v43;
                  v140.origin.x = x;
                  v140.origin.y = y;
                  v140.size.width = width;
                  v140.size.height = height;
                  v146.size.width = v44;
                  v146.size.height = v45;
                  v141 = CGRectIntersection(v140, v146);
                  if (v141.origin.x != INFINITY && v141.origin.y != INFINITY && (v45 <= v37 || v141.size.height > v37))
                  {
                    v48 = v44 > v137 && v141.size.width <= v137;
                    v49 = v44 * 0.5;
                    v50 = v48 || v141.size.width < v49;
                    if (!v50
                      && (objc_msgSend(v39, "isVisible", v49, v141.origin.y, v141.size.width, v141.size.height) & 1) != 0)
                    {
                      break;
                    }
                  }
                }
                v38 = ++v36 < v35;
              }
              while (v35 != v36);
              v2 = self;
              v22 = v136;
              if (!v38)
                goto LABEL_57;
              objc_msgSend(*p_var0, "maximumWordGap");
              v52 = v51;
              objc_msgSend(*p_var0, "medianFontSize");
              if (*v129)
                goto LABEL_38;
              v112 = v53;
              v113 = v52;
              v54 = v25->origin.x;
              v55 = *v120;
              v138 = *v119;
              v56 = *v118;
              v57 = -[CPZone graphicsInZone](self->contentZone, "graphicsInZone");
              v58 = objc_msgSend(v57, "count");
              if (v58)
              {
                v59 = 0;
                v132 = 0.0;
                v134 = 0.0;
                v131 = INFINITY;
                v135 = INFINITY;
                do
                {
                  v60 = (void *)objc_msgSend(v57, "objectAtIndex:", v59);
                  objc_msgSend(v60, "renderedBounds");
                  if (v64 < v56 + v56)
                  {
                    v147.origin.x = v61;
                    v147.origin.y = v62;
                    v147.size.width = v63;
                    v147.size.height = v64;
                    v142.origin.x = v54;
                    v142.origin.y = v55;
                    v142.size.width = v138;
                    v142.size.height = v56;
                    v143 = CGRectIntersection(v142, v147);
                    v65 = v143.origin.x;
                    if (v143.origin.x != INFINITY && v143.origin.y != INFINITY)
                    {
                      v67 = v143.origin.y;
                      v68 = v143.size.width;
                      v69 = v143.size.height;
                      if (objc_msgSend(v60, "isVisible"))
                      {
                        Mutable = (__CFArray *)*v129;
                        if (!*v129)
                        {
                          Mutable = CFArrayCreateMutable(allocator, 0, 0);
                          *v129 = Mutable;
                        }
                        CFArrayAppendValue(Mutable, v60);
                        v144.size.width = v134;
                        v144.origin.x = v135;
                        v144.origin.y = v131;
                        v144.size.height = v132;
                        v148.origin.x = v65;
                        v148.origin.y = v67;
                        v148.size.width = v68;
                        v148.size.height = v69;
                        v145 = CGRectUnion(v144, v148);
                        v135 = v145.origin.x;
                        v131 = v145.origin.y;
                        v134 = v145.size.width;
                        v132 = v145.size.height;
                      }
                    }
                  }
                  ++v59;
                }
                while (v58 != v59);
              }
              else
              {
                v134 = 0.0;
                v135 = INFINITY;
              }
              v2 = self;
              v22 = v136;
              if (*v129)
              {
                v71 = v112 * v113 + v112 * v113;
                if (v135 > v71 + v54 || v135 + v134 < v54 + v138 - v71)
                {
                  CFRelease(*v129);
                  *v129 = 0;
                  goto LABEL_57;
                }
LABEL_38:
                excludeSpacerFromBounds((uint64_t)p_spacerSequence, v21, v25->origin.x, v25->origin.y, v25->size.width, v25->size.height);
                v23 = v33;
              }
              else
              {
LABEL_57:
                v23 = (v33 + 1);
                v22 = preferredSpacer(v22, v21);
              }
              v20 = v32;
            }
          }
          v21 = *(_QWORD *)(v21 + 40);
        }
        while (v21);
        if ((_DWORD)v20 != 1)
          goto LABEL_73;
        v72 = v23;
        v73 = objc_msgSend(*p_var0, "charSequence");
        if (!v22)
        {
          v14 = v127;
          v9 = v128;
          v75 = v126;
          goto LABEL_75;
        }
        v74 = *(_QWORD *)(v22 + 48);
        v14 = v127;
        v9 = v128;
        v75 = v126;
        if (!v74)
          goto LABEL_75;
        if (!*(_DWORD *)(v74 + 44))
          goto LABEL_75;
        v76 = (void *)v73;
        v77 = *(double *)(v74 + 88);
        v78 = *(double *)(v74 + 96);
        v79 = *(double *)(v74 + 104);
        v80 = *(double *)(v74 + 112);
        if (fabs(CGIntervalIntersection(v77, v78, v79, v80)) != INFINITY)
          goto LABEL_75;
        v81 = *(double *)(v74 + 152);
        if (v81 >= v79 + v80)
          goto LABEL_75;
        v82 = *(_DWORD *)(v116 + 48 * v111 + 4);
        if (v82 >= 5)
        {
          if (v82 <= 7)
          {
            v99 = v82 - 1;
            while (v99 != -1)
            {
              v100 = objc_msgSend(v76, "charAtIndex:", v99 + *(_DWORD *)v121);
              --v99;
              if (*(unsigned __int16 *)(v100 + 72) <= 0x30u)
                goto LABEL_117;
            }
          }
          if (!isConsistentWithNarrowWordsCommon((double *)v121, v77, v78, v79, v80))
          {
LABEL_75:
            LODWORD(v23) = v72;
            goto LABEL_76;
          }
        }
LABEL_117:
        if (v72 != 1)
        {
          LODWORD(v23) = v72;
          if (v72 && v110 == 1)
            excludeSpacerFromBounds((uint64_t)p_spacerSequence, (uint64_t)v123, *(double *)v22, *(double *)(v22 + 8), *(double *)(v22 + 16), *(double *)(v22 + 24));
          goto LABEL_76;
        }
        v101 = *(_QWORD *)(v22 + 48);
        LODWORD(v81) = *(_DWORD *)(v101 + 44);
        v102 = (double)*(unint64_t *)&v81;
        v103 = *(_DWORD *)(v101 + 36);
        if ((double)v103 * 0.5 <= v102
          && (v104 = *(_DWORD *)(v101 + 80) + v103, v105 = *(_DWORD *)(v101 + 32), v104 >= v105))
        {
          LODWORD(v102) = *(_DWORD *)(v101 + 76);
          v102 = (double)*(unint64_t *)&v102;
          v106 = (double)v105 * 0.75 > v102;
        }
        else
        {
          v106 = 1;
        }
        if (v110 != 1)
        {
          if (v110)
            v107 = 1;
          else
            v107 = v125 == 0;
          if (!v107)
            LOBYTE(v106) = 1;
          if (v106)
          {
            LODWORD(v23) = 1;
          }
          else
          {
            *(_BYTE *)(v101 + 168) = 1;
            excludeSpacerFromBounds((uint64_t)p_spacerSequence, v22, v25->origin.x, v25->origin.y, v25->size.width, v25->size.height);
            LODWORD(v23) = 0;
            v22 = 0;
          }
          goto LABEL_76;
        }
        if (!v106)
        {
          if (preferredSpacer((uint64_t)v123, v22) == v22)
            goto LABEL_140;
          *(_BYTE *)(v101 + 168) = 1;
LABEL_139:
          excludeSpacerFromBounds((uint64_t)p_spacerSequence, v22, *v123, v123[1], v123[2], v123[3]);
          LODWORD(v23) = 0;
          v22 = 0;
          goto LABEL_76;
        }
        if ((canSeparateWordRight((uint64_t)v123, v102) & 1) != 0)
          goto LABEL_141;
        if (preferredSpacer((uint64_t)v123, v22) != v22)
          goto LABEL_139;
LABEL_140:
        excludeSpacerFromBounds((uint64_t)p_spacerSequence, (uint64_t)v123, *(double *)v22, *(double *)(v22 + 8), *(double *)(v22 + 16), *(double *)(v22 + 24));
LABEL_141:
        LODWORD(v23) = 1;
LABEL_76:
        if (v14 - v9 != 1)
        {
          if (!v22)
          {
LABEL_95:
            v15 = 0;
            goto LABEL_112;
          }
LABEL_89:
          if ((_DWORD)v23 == 1)
          {
            v83 = *(_QWORD *)(v22 + 48);
            if (!v83)
              __assert_rtn("canSplitJunctionWithSpacer", "CPSpacerFinder.m", 741, "stats->quality");
            goto LABEL_91;
          }
          goto LABEL_111;
        }
        if (!v22)
          goto LABEL_95;
        v83 = *(_QWORD *)(v22 + 48);
        if (!v83)
          goto LABEL_89;
        if (!*(_DWORD *)(v83 + 56))
          goto LABEL_89;
        v84 = *(double *)(v83 + 120);
        v85 = *(double *)(v83 + 128);
        v86 = *(double *)(v83 + 136);
        v87 = *(double *)(v83 + 144);
        if (fabs(CGIntervalIntersection(v84, v85, v86, v87)) != INFINITY)
          goto LABEL_89;
        v88 = *(double *)(v83 + 160);
        if (v88 <= v84
          || *(_DWORD *)(v121 + 52) >= 5u
          && !isConsistentWithNarrowWordsCommon((double *)(v121 + 48), v84, v85, v86, v87))
        {
          goto LABEL_89;
        }
        if (v75 != *p_var1 || (_DWORD)v23 != 1)
          goto LABEL_89;
        if ((canSeparateWordRight(v22, v88) & 1) == 0)
        {
          excludeSpacerFromBounds((uint64_t)p_spacerSequence, v22, *((double *)v124 + 9 * v125 + 1), *((double *)v124 + 9 * v125 + 2), *((double *)v124 + 9 * v125 + 3), *((double *)v124 + 9 * v125 + 4));
          v22 = 0;
          LODWORD(v23) = 0;
          goto LABEL_95;
        }
LABEL_91:
        v89 = *(_DWORD *)(v83 + 32);
        if (v89 < 4)
        {
          v96 = (uint64_t)v124 + 72 * v125;
          v92 = (double *)(v96 + 24);
          v93 = *(double *)(v96 + 32);
          v94 = 1.0;
          v90 = 0.0;
          if (v93 > 0.0)
            goto LABEL_97;
        }
        else
        {
          v90 = ((double)v89 + -3.0) / 5.0;
          v91 = (uint64_t)v124 + 72 * v125;
          v92 = (double *)(v91 + 24);
          v93 = *(double *)(v91 + 32);
          v94 = 1.0;
          if (v93 > 0.0)
          {
            if (v90 >= 1.0)
            {
              v95 = *(double *)(v22 + 16);
              goto LABEL_98;
            }
LABEL_97:
            v95 = v90 * *(double *)(v22 + 16) + (v94 - v90) * *v92;
LABEL_98:
            v94 = v95 / (v93 * 0.5);
          }
        }
        v97 = *(_DWORD *)(v22 + 32);
        if ((v97 < 2
           || (v97 < 6 ? (v98 = v89 >= 3) : (v98 = 1), !v98 || v90 + v94 < 1.0 || *(double *)(v22 + 24) < v93 + v93))
          && *v92 < v93 * 100.0
          || (LODWORD(v23) = 1, !((v123 == 0) | v122 & 1)) && v89 == 1)
        {
          v15 = 0;
          *(_BYTE *)(v83 + 170) = 0;
          LODWORD(v23) = 1;
          goto LABEL_112;
        }
LABEL_111:
        v15 = 1;
LABEL_112:
        var1 = *p_var1;
        v13 = (double *)v22;
        v8 = v75;
        v10 = v23;
      }
      while (v75 < var1);
LABEL_143:
      v3 = v108 + 1;
    }
    while (v108 + 1 < (unint64_t)v2->segmentationCount);
  }
}

- (void)splitTextLines
{
  id v3;
  uint64_t v4;
  unsigned int *p_var1;
  unint64_t v6;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v7;
  uint64_t v8;
  uint64_t v9;
  CGRect *v10;
  _BYTE *v11;
  _DWORD *v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  double v16;
  double v17;
  void *v18;
  int v19;
  $54B00B245656622C10B7392301C15C5B *v20;
  $54B00B245656622C10B7392301C15C5B *segmentations;
  uint64_t v22;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **p_var2;
  CGRect v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  -[CPSpacerFinder spacers](self, "spacers");
  -[CPSpacerFinder assessQuality](self, "assessQuality");
  -[CPSpacerFinder determineValidity](self, "determineValidity");
  v3 = -[CPZone textLinesInZone](self->contentZone, "textLinesInZone");
  v19 = -[NSMutableArray count](self->spacers, "count");
  if (!self->segmentationCount)
    return;
  v4 = 0;
  v18 = v3;
  do
  {
    segmentations = self->segmentations;
    v22 = v4;
    v20 = &segmentations[v4];
    p_var1 = &v20->var1;
    if (!v20->var1)
      goto LABEL_18;
    v6 = 0;
    p_var2 = &segmentations[v4].var2;
    do
    {
      v7 = *p_var2;
      v8 = *((_QWORD *)*p_var2 + 9 * v6 + 5);
      if (!v8)
        goto LABEL_17;
      v9 = (uint64_t)v7 + 72 * v6;
      v10 = (CGRect *)(v9 + 8);
      v11 = (_BYTE *)(v9 + 48);
      v12 = (_DWORD *)(v9 + 52);
      while (1)
      {
        v13 = *(_QWORD *)(v8 + 48);
        if (v13)
        {
          if (*(_BYTE *)(v13 + 170))
            break;
        }
LABEL_14:
        v8 = *(_QWORD *)(v8 + 40);
        if (!v8)
          goto LABEL_17;
      }
      if (!CGRectIntersectsRect(*v10, *(CGRect *)v8))
      {
        if (*(_BYTE *)(v13 + 168))
        {
          if (*(_BYTE *)(v8 + 56))
          {
            v24 = CGRectNull;
            objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->spacers, "objectAtIndex:", *(unsigned int *)(v8 + 60)), "getValue:", &v24);
            if (CGRectIntersectsRect(*v10, v24))
            {
              *v11 = 1;
              *v12 = *(_DWORD *)(v8 + 60);
            }
          }
        }
        goto LABEL_14;
      }
      *((_BYTE *)v7 + 72 * v6 + 64) = 1;
      *v11 = 0;
      *v12 = *(_DWORD *)(v8 + 60);
LABEL_17:
      ++v6;
    }
    while (v6 < *p_var1);
LABEL_18:
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v25 = 0u;
    memset(&v24, 0, sizeof(v24));
    *(_QWORD *)&v24.origin.y = segmentations[v22].var2;
    HIDWORD(v24.size.width) = *p_var1;
    BYTE8(v25) = 0;
    v24.size.height = 0.0;
    *(_QWORD *)&v25 = 0;
    *(_QWORD *)&v26 = v18;
    *((_QWORD *)&v26 + 1) = v20->var0;
    v28 = 0u;
    v29 = 0u;
    v27 = 0u;
    objc_msgSend(*((id *)&v26 + 1), "removeTextLines:whereTrue:passing:", v18, isSplitBySpacer, &v24);
    v14 = objc_msgSend(v18, "count");
    v15 = v14;
    if (BYTE8(v25) && v14 >= 2)
      *((_QWORD *)&v26 + 1) = objc_msgSend(v18, "objectAtIndex:", v14 - 2);
    *(_QWORD *)&v16 = recordPreviousInlineInfo((uint64_t)&v24).n128_u64[0];
    if (*(_QWORD *)&v24.size.height && v15)
      *((_QWORD *)&v26 + 1) = objc_msgSend(v18, "objectAtIndex:", v15 - 1, v16);
    *(_QWORD *)&v17 = recordPreviousInlineInfo((uint64_t)&v24).n128_u64[0];
    if (v19)
      objc_msgSend(*((id *)&v26 + 1), "setRightSpacerIndex:", (v19 - 1), v17);
    v4 = v22 + 1;
  }
  while (v22 + 1 < (unint64_t)self->segmentationCount);
}

- (id)spacers
{
  id result;
  unint64_t count;
  unint64_t v5;
  int v6;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v7;
  void *v8;

  result = self->spacers;
  if (!result)
  {
    result = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->spacers = (NSMutableArray *)result;
    count = self->spacerSequence.count;
    if ((_DWORD)count)
    {
      v5 = 0;
      v6 = 0;
      do
      {
        v7 = self->spacerSequence.ordered[v5];
        if (*((_BYTE *)v7 + 56))
        {
          v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B18]), "initWithBytes:objCType:", v7, "{CGRect={CGPoint=dd}{CGSize=dd}}");
          -[NSMutableArray addObject:](self->spacers, "addObject:", v8);

          *((_DWORD *)v7 + 15) = v6++;
          count = self->spacerSequence.count;
        }
        ++v5;
      }
      while (v5 < count);
      return self->spacers;
    }
  }
  return result;
}

@end
