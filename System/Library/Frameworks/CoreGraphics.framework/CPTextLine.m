@implementation CPTextLine

- (CPTextLine)init
{
  CPTextLine *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPTextLine;
  result = -[CPChunk init](&v3, sel_init);
  if (result)
  {
    result->hasTabs = 0;
    result->baseLineIsNull = 1;
    result->normalizedBounds = CGRectNull;
    result->hasBeenProcessed = 0;
    result->hasBeenSplit = 0;
    result->levels = 0;
    result->maximumLetterGap = 0.0;
    result->maximumWordGap = 0.0;
    result->tabsBefore = 0;
    result->irregular = 0;
    result->wordArray = 0;
    result->wordCount = 0;
  }
  return result;
}

- (void)dispose
{
  CPInlineContainer *inlineList;
  CPInlineContainer *var2;

  if (!self->disposed)
  {
    -[CPCharSequence dispose](self->charSequence, "dispose");
    free(self->wordArray);
    inlineList = self->inlineList;
    if (inlineList)
    {
      do
      {
        var2 = inlineList->var2;
        free(inlineList);
        self->inlineList = var2;
        inlineList = var2;
      }
      while (var2);
    }
    free(self->spacesBefore);
    self->disposed = 1;
  }
}

- (void)finalize
{
  objc_super v3;

  -[CPTextLine dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPTextLine;
  -[CPTextLine finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  objc_super v3;

  -[CPTextLine dispose](self, "dispose");

  v3.receiver = self;
  v3.super_class = (Class)CPTextLine;
  -[CPObject dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t wordCount;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CPTextLine;
  v5 = -[CPChunk copyWithZone:](&v10, sel_copyWithZone_);
  v6 = v5;
  if (v5)
  {
    v5[1] = 0;
    v5[28] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", self->columnBreaks);
    v6[16] = -[CPCharSequence copyWithZone:](self->charSequence, "copyWithZone:", a3);
    wordCount = self->wordCount;
    if ((_DWORD)wordCount)
    {
      v8 = malloc_type_malloc(48 * wordCount, 0x1000040EED21634uLL);
      v6[17] = v8;
      memcpy(v8, self->wordArray, 48 * self->wordCount);
    }
  }
  return v6;
}

- (void)setCharSequence:(id)a3
{
  CPCharSequence *charSequence;

  charSequence = self->charSequence;
  if (charSequence != a3)
  {

    self->charSequence = (CPCharSequence *)a3;
  }
}

- (id)charSequence
{
  return self->charSequence;
}

- ($F82BA7CF80F7A1221027BFFB2739E57F)wordArray
{
  return self->wordArray;
}

- ($F82BA7CF80F7A1221027BFFB2739E57F)wordArrayOfSize:(unsigned int)a3
{
  $F82BA7CF80F7A1221027BFFB2739E57F *result;

  result = self->wordArray;
  if (!result)
  {
    if (!a3)
    {
      result = 0;
      goto LABEL_8;
    }
    result = ($F82BA7CF80F7A1221027BFFB2739E57F *)malloc_type_malloc(48 * a3, 0x1000040EED21634uLL);
    goto LABEL_6;
  }
  if (self->wordCount < a3)
  {
    result = ($F82BA7CF80F7A1221027BFFB2739E57F *)malloc_type_realloc(result, 48 * a3, 0x1000040EED21634uLL);
LABEL_6:
    self->wordArray = result;
  }
LABEL_8:
  self->wordCount = a3;
  return result;
}

- (unsigned)wordCount
{
  return self->wordCount;
}

- (CGRect)boundsOfWordAtIndex:(unsigned int)a3
{
  $F82BA7CF80F7A1221027BFFB2739E57F *v3;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (self->wordCount <= a3)
    __assert_rtn("-[CPTextLine boundsOfWordAtIndex:]", "CPTextLine.m", 160, "index < wordCount");
  v3 = &self->wordArray[a3];
  x = v3->var4.origin.x;
  y = v3->var4.origin.y;
  width = v3->var4.size.width;
  height = v3->var4.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- ($F82BA7CF80F7A1221027BFFB2739E57F)wordAtIndex:(unsigned int)a3
{
  if (self->wordCount <= a3)
    __assert_rtn("-[CPTextLine wordAtIndex:]", "CPTextLine.m", 166, "index < wordCount");
  return &self->wordArray[a3];
}

- ($F82BA7CF80F7A1221027BFFB2739E57F)firstWord
{
  if (self->wordCount)
    return self->wordArray;
  else
    return 0;
}

- ($F82BA7CF80F7A1221027BFFB2739E57F)lastWord
{
  unsigned int wordCount;

  wordCount = self->wordCount;
  if (wordCount)
    return &self->wordArray[wordCount - 1];
  else
    return 0;
}

- (unsigned)inlineCount
{
  CPInlineContainer *inlineList;
  unsigned int result;

  inlineList = self->inlineList;
  if (!inlineList)
    return 0;
  result = 0;
  do
  {
    inlineList = inlineList->var2;
    ++result;
  }
  while (inlineList);
  return result;
}

- (CPInlineContainer)inlineList
{
  return self->inlineList;
}

- (void)anchorChunk:(id)a3 atWordIndex:(unsigned int)a4
{
  CPInlineContainer *v7;
  double v8;
  double v9;
  CPInlineContainer **p_inlineList;
  CPInlineContainer *var2;
  unsigned int var0;
  double v13;
  double v14;
  CPInlineContainer *v15;
  CPInlineContainer *v16;
  double v17;
  BOOL v18;
  double v19;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(a3, "anchoringTextLine"))
      return;
    objc_msgSend(a3, "setAnchoringTextLine:", self);
  }
  v7 = (CPInlineContainer *)malloc_type_malloc(0x18uLL, 0x10A0040C385777EuLL);
  v7->var0 = a4;
  v7->var1 = a3;
  v7->var2 = 0;
  objc_msgSend(a3, "anchor");
  p_inlineList = &self->inlineList;
  var2 = *p_inlineList;
  if (*p_inlineList)
  {
    var0 = var2->var0;
    if (var2->var0 <= a4)
    {
      v13 = v8;
      v14 = v9;
      v15 = 0;
      while (1)
      {
        v16 = var2;
        if (var0 == a4)
        {
          objc_msgSend(var2->var1, "anchor");
          v18 = v13 == v17;
          if (v14 <= v19)
            v18 = 0;
          if (v13 < v17 || v18)
            break;
        }
        var2 = v16->var2;
        if (var2)
        {
          var0 = var2->var0;
          v15 = v16;
          if (var2->var0 <= a4)
            continue;
        }
        v7->var2 = var2;
        v15 = v16;
LABEL_17:
        p_inlineList = &v15->var2;
        goto LABEL_18;
      }
      v7->var2 = v16;
      if (v15)
        goto LABEL_17;
    }
    else
    {
      v7->var2 = var2;
    }
  }
  else
  {
    v7->var2 = 0;
  }
LABEL_18:
  *p_inlineList = v7;
}

- (int64_t)zOrder
{
  int64_t *p_zOrder;

  self->super.super.super.zOrder = 0;
  p_zOrder = &self->super.super.super.zOrder;
  -[CPCharSequence map:passing:](self->charSequence, "map:passing:", maxInsertionOrder, &self->super.super.super.zOrder);
  return *p_zOrder;
}

- (int)align
{
  $F82BA7CF80F7A1221027BFFB2739E57F *v3;
  $F82BA7CF80F7A1221027BFFB2739E57F *v4;
  int v5;
  int v6;

  v3 = -[CPTextLine firstWord](self, "firstWord");
  v4 = -[CPTextLine lastWord](self, "lastWord");
  if (!v3)
  {
    v5 = 0;
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v6 | v5;
  }
  v5 = v3->var3 & 0x55;
  if (!v4)
    goto LABEL_5;
LABEL_3:
  v6 = v4->var3 & 0xAA;
  return v6 | v5;
}

- (BOOL)hasJustifiedAlignment
{
  char v2;

  v2 = -[CPTextLine align](self, "align");
  return (v2 & 0xA) != 0 && (v2 & 5) != 0;
}

- (BOOL)changesFontAt:(id)a3
{
  unsigned int v5;
  int v6;
  BOOL v7;
  CPPDFChar *v8;
  uint64_t v9;
  CPPDFStyle *var7;
  CPPDFStyle *v11;
  id var10;
  BOOL result;

  v5 = -[CPCharSequence length](self->charSequence, "length");
  v6 = objc_msgSend(*((id *)a3 + 16), "length");
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  result = 0;
  if (!v7)
  {
    v8 = -[CPCharSequence charAtIndex:](self->charSequence, "charAtIndex:", v5 - 1);
    v9 = objc_msgSend(*((id *)a3 + 16), "charAtIndex:", 0);
    var7 = v8->var7;
    v11 = *(CPPDFStyle **)(v9 + 160);
    if (var7 != v11)
    {
      if (!var7 || v11 == 0)
        return 1;
      var10 = var7->var10;
      if (var10 != v11->var10 && !objc_msgSend(var10, "isSameFontAs:"))
        return 1;
    }
  }
  return result;
}

- (id)newTextLineFromWordAt:(unsigned int)a3 lengthInWords:(unsigned int)a4
{
  uint64_t v4;
  CPTextLine *v7;
  id v8;
  $F82BA7CF80F7A1221027BFFB2739E57F *v9;
  unsigned int var0;
  uint64_t v11;
  $F82BA7CF80F7A1221027BFFB2739E57F *v12;
  CGSize size;
  __int128 v14;

  if (!self->wordArray)
    return 0;
  v4 = *(_QWORD *)&a4;
  v7 = objc_alloc_init(CPTextLine);
  -[CPObject setPage:](v7, "setPage:", self->super.super.super.page);
  v8 = -[CPCharSequence newSubsequenceFrom:length:](self->charSequence, "newSubsequenceFrom:length:");
  -[CPTextLine setCharSequence:](v7, "setCharSequence:", v8);

  v9 = -[CPTextLine wordArrayOfSize:](v7, "wordArrayOfSize:", v4);
  if ((_DWORD)v4)
  {
    var0 = self->wordArray[a3].var0;
    v11 = v4;
    do
    {
      v12 = &self->wordArray[a3];
      size = v12->var4.size;
      v14 = *(_OWORD *)&v12->var0;
      v9->var4.origin = v12->var4.origin;
      v9->var4.size = size;
      *(_OWORD *)&v9->var0 = v14;
      v9->var0 -= var0;
      ++v9;
      ++a3;
      --v11;
    }
    while (v11);
  }
  v7->leftSpacerIndex = self->leftSpacerIndex;
  v7->rightSpacerIndex = self->rightSpacerIndex;
  v7->uniformStyle = self->uniformStyle;
  v7->uniformStyleFlags = self->uniformStyleFlags;
  v7->monospaceWidth = self->monospaceWidth;
  -[CPTextLine recomputeLevels](v7, "recomputeLevels");
  return v7;
}

- (BOOL)removeTextLines:(id)a3 whereTrue:(void *)a4 passing:(void *)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  id v18;
  void *v19;
  unsigned int wordCount;
  id v21;
  void *v22;
  $F82BA7CF80F7A1221027BFFB2739E57F *wordArray;

  if (self->wordCount < 2)
    return 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 1;
  do
  {
    v13 = v11;
    v14 = v10;
    v15 = v9;
    v16 = v8 + 1;
    v17 = ((uint64_t (*)($F82BA7CF80F7A1221027BFFB2739E57F *, $F82BA7CF80F7A1221027BFFB2739E57F *, void *))a4)(&self->wordArray[v12 - 1], &self->wordArray[v12], a5);
    v11 = v17 | v13;
    if (v17)
      v10 = v16;
    else
      v10 = v14;
    if (v17)
      v9 = v16;
    else
      v9 = v9;
    if (v17 && (v13 & 1) != 0)
    {
      v18 = -[CPTextLine newTextLineFromWordAt:lengthInWords:](self, "newTextLineFromWordAt:lengthInWords:", v14, (v8 - v14 + 1));
      if (v18)
      {
        v19 = v18;
        objc_msgSend(a3, "addObject:", v18);
        objc_msgSend(v19, "recomputeBaseline");

      }
      v11 = 1;
      v10 = v8 + 1;
      v9 = v15;
    }
    wordCount = self->wordCount;
    ++v12;
    ++v8;
  }
  while (v16 < wordCount - 1);
  if ((v11 & 1) == 0)
    return 0;
  v21 = -[CPTextLine newTextLineFromWordAt:lengthInWords:](self, "newTextLineFromWordAt:lengthInWords:", v10, wordCount - v10);
  if (v21)
  {
    v22 = v21;
    objc_msgSend(a3, "addObject:", v21);
    objc_msgSend(v22, "recomputeBaseline");

  }
  wordArray = self->wordArray;
  if (!wordArray)
    __assert_rtn("-[CPTextLine removeTextLines:whereTrue:passing:]", "CPTextLine.m", 365, "wordArray");
  -[CPCharSequence removeFrom:](self->charSequence, "removeFrom:", wordArray[v9].var0);
  self->wordCount = v9;
  self->super.super.bounds = CGRectNull;
  self->normalizedBounds = CGRectNull;
  -[CPTextLine recomputeLevels](self, "recomputeLevels");
  return 1;
}

- (BOOL)mapToWords:(void *)a3 passing:(void *)a4
{
  unsigned int wordCount;
  $F82BA7CF80F7A1221027BFFB2739E57F *wordArray;
  $F82BA7CF80F7A1221027BFFB2739E57F *v9;
  int v10;
  BOOL v11;

  wordCount = self->wordCount;
  if (wordCount)
  {
    wordArray = self->wordArray;
    v9 = &wordArray[wordCount];
    do
    {
      v10 = ((uint64_t (*)($F82BA7CF80F7A1221027BFFB2739E57F *, CPCharSequence *, void *))a3)(wordArray++, self->charSequence, a4);
      if (v10)
        v11 = wordArray >= v9;
      else
        v11 = 1;
    }
    while (!v11);
  }
  else
  {
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (BOOL)mapToWordsWithIndex:(void *)a3 passing:(void *)a4
{
  uint64_t v7;
  $F82BA7CF80F7A1221027BFFB2739E57F *wordArray;
  int v9;

  if (self->wordCount)
  {
    v7 = 0;
    wordArray = self->wordArray;
    do
    {
      v9 = ((uint64_t (*)(uint64_t, $F82BA7CF80F7A1221027BFFB2739E57F *, CPCharSequence *, void *))a3)(v7, wordArray, self->charSequence, a4);
      if (!v9)
        break;
      ++wordArray;
      v7 = (v7 + 1);
    }
    while (v7 < self->wordCount);
  }
  else
  {
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (BOOL)mapToWordPairs:(void *)a3 passing:(void *)a4
{
  unsigned int wordCount;
  int v5;
  $F82BA7CF80F7A1221027BFFB2739E57F *wordArray;
  unint64_t v10;
  BOOL v11;

  wordCount = self->wordCount;
  if (wordCount >= 2)
  {
    wordArray = self->wordArray;
    v10 = (unint64_t)&wordArray[wordCount];
    do
    {
      v5 = ((uint64_t (*)($F82BA7CF80F7A1221027BFFB2739E57F *, $F82BA7CF80F7A1221027BFFB2739E57F *, CPCharSequence *, void *))a3)(wordArray, &wordArray[1], self->charSequence, a4);
      if (v5)
        v11 = (unint64_t)&wordArray[2] >= v10;
      else
        v11 = 1;
      ++wordArray;
    }
    while (!v11);
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)mapToWordPairsWithIndex:(void *)a3 passing:(void *)a4
{
  unsigned int wordCount;
  int v5;
  uint64_t v9;
  $F82BA7CF80F7A1221027BFFB2739E57F *wordArray;
  unint64_t v11;
  BOOL v12;

  wordCount = self->wordCount;
  if (wordCount >= 2)
  {
    v9 = 0;
    wordArray = self->wordArray;
    v11 = (unint64_t)&wordArray[wordCount];
    do
    {
      v5 = ((uint64_t (*)(uint64_t, $F82BA7CF80F7A1221027BFFB2739E57F *, $F82BA7CF80F7A1221027BFFB2739E57F *, CPCharSequence *, void *))a3)(v9, wordArray, &wordArray[1], self->charSequence, a4);
      v9 = (v9 + 1);
      if (v5)
        v12 = (unint64_t)&wordArray[2] >= v11;
      else
        v12 = 1;
      ++wordArray;
    }
    while (!v12);
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (id)properties
{
  return CFSTR("Hello");
}

- (void)setHasBeenSplit:(BOOL)a3
{
  self->hasBeenSplit = a3;
}

- (BOOL)hasBeenSplit
{
  return self->hasBeenSplit;
}

- (void)setHasBeenProcessed:(BOOL)a3
{
  self->hasBeenProcessed = a3;
}

- (BOOL)hasBeenProcessed
{
  return self->hasBeenProcessed;
}

- (id)columnBreaks
{
  return self->columnBreaks;
}

- (void)setColumnBreaks:(id)a3
{
  NSArray *columnBreaks;

  columnBreaks = self->columnBreaks;
  if (columnBreaks != a3)
  {

    self->columnBreaks = (NSArray *)a3;
  }
}

- (void)accept:(id)a3
{
  objc_msgSend(a3, "visitTextLine:", self);
}

- (void)setHasTabs:(BOOL)a3
{
  self->hasTabs = a3;
}

- (BOOL)hasTabs
{
  return self->hasTabs;
}

- (void)setTabsBefore:(int)a3
{
  self->tabsBefore = a3;
}

- (int)tabsBefore
{
  return self->tabsBefore;
}

- (CGRect)bounds
{
  CGRect *p_bounds;
  double x;
  double y;
  uint64_t wordCount;
  CGFloat *p_height;
  double width;
  double height;
  CGRect result;

  p_bounds = &self->super.super.bounds;
  x = self->super.super.bounds.origin.x;
  y = self->super.super.bounds.origin.y;
  if (x == INFINITY || y == INFINITY)
  {
    wordCount = self->wordCount;
    width = self->super.super.bounds.size.width;
    height = self->super.super.bounds.size.height;
    if ((_DWORD)wordCount)
    {
      p_height = &self->wordArray->var4.size.height;
      do
      {
        *(CGRect *)&x = CGRectUnion(*(CGRect *)&x, *(CGRect *)(p_height - 3));
        p_bounds->origin.x = x;
        p_bounds->origin.y = y;
        p_bounds->size.width = width;
        p_bounds->size.height = height;
        p_height += 6;
        --wordCount;
      }
      while (wordCount);
    }
  }
  else
  {
    width = self->super.super.bounds.size.width;
    height = self->super.super.bounds.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)baseLineAscending:(id)a3
{
  double v4;
  double v5;
  double v6;
  int64_t v7;

  -[CPTextLine baseline](self, "baseline");
  v5 = v4;
  objc_msgSend(a3, "baseline");
  v7 = -1;
  if (v5 >= v6)
    v7 = 1;
  if (v5 == v6)
    return 0;
  else
    return v7;
}

- (int64_t)baseLineDescending:(id)a3
{
  double v4;
  double v5;
  double v6;
  int64_t v7;

  -[CPTextLine baseline](self, "baseline");
  v5 = v4;
  objc_msgSend(a3, "baseline");
  v7 = -1;
  if (v5 < v6)
    v7 = 1;
  if (v5 == v6)
    return 0;
  else
    return v7;
}

- (int64_t)baseLineDescendingApprox:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v17;
  double v18;

  -[CPChunk bounds](self->super.super.super.page, "bounds");
  v6 = v5;
  -[CPTextLine baseline](self, "baseline");
  v8 = v7;
  objc_msgSend(a3, "baseline");
  if (vabdd_f64(v8, v9) >= v6 * 0.005)
  {
    if (v8 < v9)
      return 1;
    else
      return -1;
  }
  else
  {
    -[CPTextLine normalizedBounds](self, "normalizedBounds");
    v14 = v10;
    if (v12 < 0.0 || v13 < 0.0)
      *(_QWORD *)&v14 = (unint64_t)CGRectStandardize(*(CGRect *)&v10);
    objc_msgSend(a3, "normalizedBounds");
    if (v17 < 0.0 || v18 < 0.0)
      *(_QWORD *)&v15 = (unint64_t)CGRectStandardize(*(CGRect *)&v15);
    if (v14 >= v15)
      return 1;
    else
      return -1;
  }
}

- (BOOL)overlapsWith:(id)a3
{
  objc_msgSend(a3, "bounds");
  return -[CPTextLine overlapsHorizontally:](self, "overlapsHorizontally:");
}

- (BOOL)overlapsHorizontally:(CGRect)a3
{
  double height;
  double width;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  _BOOL4 v14;
  double v15;
  _BOOL4 v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  CGFloat rect;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  rect = a3.origin.y;
  x = a3.origin.x;
  -[CPTextLine bounds](self, "bounds");
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v9 < 0.0 || v8 < 0.0;
  if (v14)
    *(CGRect *)&v6 = CGRectStandardize(*(CGRect *)&v6);
  v15 = v6 + v8;
  v16 = height < 0.0 || width < 0.0;
  v17 = x;
  if (v16)
  {
    v18 = rect;
    v19 = width;
    v20 = height;
    *(_QWORD *)&v17 = (unint64_t)CGRectStandardize(*(CGRect *)&v17);
  }
  if (v15 < v17)
    return 0;
  if (v14)
  {
    v23.origin.x = v10;
    v23.origin.y = v11;
    v23.size.width = v12;
    v23.size.height = v13;
    *(_QWORD *)&v10 = (unint64_t)CGRectStandardize(v23);
  }
  if (v16)
  {
    v24.origin.x = x;
    v24.origin.y = rect;
    v24.size.width = width;
    v24.size.height = height;
    v25 = CGRectStandardize(v24);
    x = v25.origin.x;
    width = v25.size.width;
  }
  return v10 <= x + width;
}

- (CGPoint)anchor
{
  CPPDFChar *v2;
  const CGPoint *p_var4;
  CGFloat *p_y;
  double v5;
  double x;
  CGPoint result;

  if (self->wordCount)
  {
    v2 = -[CPCharSequence charAtIndex:](self->charSequence, "charAtIndex:", self->wordArray->var0);
    p_var4 = &v2->var4;
    p_y = &v2->var4.y;
  }
  else
  {
    p_var4 = &CGPointZero;
    p_y = &CGPointZero.y;
  }
  v5 = *p_y;
  x = p_var4->x;
  result.y = v5;
  result.x = x;
  return result;
}

- (BOOL)hyphenated
{
  return 0;
}

- (double)baseline
{
  unsigned int v3;
  _QWORD *v4;
  uint64_t i;
  double v6;

  if (self->baseLineIsNull)
  {
    v3 = -[CPCharSequence length](self->charSequence, "length");
    v4 = malloc_type_malloc(8 * v3, 0x100004000313F17uLL);
    if (v3)
    {
      for (i = 0; i != v3; ++i)
        v4[i] = (_QWORD)-[CPCharSequence charAtIndex:](self->charSequence, "charAtIndex:", i)[104];
      v6 = medianDouble((uint64_t)v4, v3);
    }
    else
    {
      v6 = 0.0;
    }
    self->baseline = v6;
    self->baseLineIsNull = 0;
    free(v4);
  }
  return self->baseline;
}

- (void)setBaseline:(double)a3
{
  self->baseLineIsNull = 1;
  self->baseline = a3;
}

- (void)setBaselineToNull
{
  self->baseLineIsNull = 1;
}

- (BOOL)isIndivisible
{
  return 1;
}

- (void)translateObjectYBy:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPTextLine;
  -[CPTextObject translateObjectYBy:](&v5, sel_translateObjectYBy_);
  self->baseline = self->baseline + a3;
}

- (void)recomputeBaseline
{
  unsigned int wordCount;
  double v4;
  CPPDFChar *v5;
  uint64_t v6;
  unint64_t v7;
  double y;
  unsigned int v9;
  unint64_t v10;

  wordCount = self->wordCount;
  if (wordCount)
  {
    v4 = (double)-[CPCharSequence charAtIndex:](self->charSequence, "charAtIndex:", self->wordArray->var0)[104];
    if (wordCount >= 3)
    {
      v5 = -[CPCharSequence charAtIndex:](self->charSequence, "charAtIndex:", self->wordArray[1].var0);
      if (v4 == self->baseline)
        return;
      if (self->wordCount)
      {
        v6 = 0;
        v7 = 0;
        y = v5->var4.y;
        v9 = 1;
        do
        {
          if (vabdd_f64(v4, (double)-[CPCharSequence charAtIndex:](self->charSequence, "charAtIndex:", self->wordArray[v6].var0)[104]) < 2.0)++v9;
          ++v7;
          v10 = self->wordCount;
          ++v6;
        }
        while (v7 < v10);
        if (v9 <= v10 >> 1)
          v4 = y;
      }
    }
    -[CPTextLine setBaseline:](self, "setBaseline:", v4);
  }
}

- (BOOL)styleIsUniform:(CPPDFStyle *)a3 styleFlags:(unsigned __int16)a4
{
  CPPDFStyle *uniformStyle;
  CPPDFStyle *v7;
  BOOL result;
  CPPDFStyle *v9;
  uint64_t v10;

  uniformStyle = self->uniformStyle;
  if (uniformStyle && self->uniformStyleFlags == a4)
  {
    if (a3)
      *a3 = uniformStyle;
    return 1;
  }
  self->uniformStyleFlags = a4;
  if (!-[CPCharSequence length](self->charSequence, "length"))
  {
    self->uniformStyle = 0;
    if (a3)
      *a3 = 0;
    return 1;
  }
  v7 = (CPPDFStyle *)-[CPCharSequence charAtIndex:](self->charSequence, "charAtIndex:", 0)[160];
  self->uniformStyle = v7;
  v9 = v7;
  v10 = 0;
  LOWORD(v10) = self->uniformStyleFlags;
  result = -[CPCharSequence map:passing:](self->charSequence, "map:passing:", sameStyle, &v9);
  if (!result)
    self->uniformStyle = 0;
  if (a3)
    *a3 = self->uniformStyle;
  return result;
}

- (BOOL)isMonospaced
{
  double v2;

  -[CPTextLine monospaceWidth](self, "monospaceWidth");
  return v2 != 0.0;
}

- (double)monospaceWidth
{
  double monospaceWidth;
  unsigned int v4;
  uint64_t wordCount;
  double v6;
  CGSize *p_size;
  double width;
  double v9;
  double v10;
  double v11;
  CPPDFChar *v12;
  double v13;
  _QWORD v15[4];

  monospaceWidth = self->monospaceWidth;
  if (monospaceWidth == 0.0)
  {
    v4 = -[CPCharSequence length](self->charSequence, "length");
    monospaceWidth = 0.0;
    if (v4)
    {
      wordCount = self->wordCount;
      v6 = self->monospaceWidth;
      if ((_DWORD)wordCount)
      {
        p_size = &self->wordArray->var4.size;
        do
        {
          width = p_size->width;
          p_size += 3;
          v6 = width + v6;
          self->monospaceWidth = v6;
          --wordCount;
        }
        while (wordCount);
      }
      v9 = v6 / (double)v4;
      self->monospaceWidth = v9;
      if (v9 < 4.0)
        goto LABEL_9;
      v10 = v9 * 0.0625;
      v11 = (v10 + v10) / (double)v4;
      v12 = -[CPCharSequence charAtIndex:](self->charSequence, "charAtIndex:", 0);
      v13 = self->monospaceWidth;
      v15[0] = *(_QWORD *)&v12->var0.var0.origin.x;
      *(double *)&v15[1] = v13;
      *(double *)&v15[2] = v10;
      *(double *)&v15[3] = v11;
      if (-[CPCharSequence map:passing:](self->charSequence, "map:passing:", isAtWidthMultiple, v15))
        return self->monospaceWidth;
      else
LABEL_9:
        self->monospaceWidth = 0.0;
    }
  }
  return monospaceWidth;
}

- (unsigned)spacesBeforeWordAtIndex:(unsigned int)a3
{
  unsigned int *spacesBefore;

  if (self->wordCount <= a3)
    return 0;
  spacesBefore = self->spacesBefore;
  if (spacesBefore)
    return spacesBefore[a3];
  else
    return a3 != 0;
}

- (void)setSpaces:(unsigned int)a3 beforeWordAtIndex:(unsigned int)a4
{
  uint64_t wordCount;
  BOOL v7;
  unsigned int v8;
  unsigned int *spacesBefore;
  BOOL v10;
  char v11;
  unint64_t v12;

  wordCount = self->wordCount;
  if (wordCount > a4)
  {
    if (a4)
      v7 = a3 == 0;
    else
      v7 = 0;
    if (v7)
      v8 = 1;
    else
      v8 = a3;
    spacesBefore = self->spacesBefore;
    if (spacesBefore)
      goto LABEL_9;
    if (a4)
      v10 = v8 == 1;
    else
      v10 = 0;
    v11 = v10;
    if (v8 | a4 && (v11 & 1) == 0)
    {
      spacesBefore = (unsigned int *)malloc_type_malloc(4 * wordCount, 0x100004052888210uLL);
      self->spacesBefore = spacesBefore;
      *spacesBefore = 0;
      if (self->wordCount >= 2)
      {
        v12 = 1;
        do
          spacesBefore[v12++] = 1;
        while (v12 < self->wordCount);
      }
LABEL_9:
      spacesBefore[a4] = v8;
    }
  }
}

- (int)levels
{
  return self->levels;
}

- (void)setLevels:(int)a3
{
  self->levels = a3;
}

- (void)recomputeLevels
{
  int v3;

  if (self->wordCount)
  {
    v3 = 0;
    -[CPTextLine mapToWordsWithIndex:passing:](self, "mapToWordsWithIndex:passing:", getMaxLevel, &v3);
    self->levels = v3 + 1;
  }
  else
  {
    self->levels = 0;
  }
}

- (float)maximumLetterGap
{
  return self->maximumLetterGap;
}

- (void)setMaximumLetterGap:(float)a3
{
  self->maximumLetterGap = a3;
}

- (float)maximumWordGap
{
  return self->maximumWordGap;
}

- (void)setMaximumWordGap:(float)a3
{
  self->maximumWordGap = a3;
}

- (BOOL)irregular
{
  return self->irregular;
}

- (void)setIrregular:(BOOL)a3
{
  self->irregular = a3;
}

- (id)attributes
{
  return CFSTR("result");
}

- (int64_t)topIsAbove:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;

  -[CPCharSequence bounds](self->charSequence, "bounds");
  v8 = v5;
  v9 = v7;
  if (v6 < 0.0 || v7 < 0.0)
  {
    *(CGRect *)&v4 = CGRectStandardize(*(CGRect *)&v4);
    v8 = v10;
    v9 = v11;
  }
  objc_msgSend(*((id *)a3 + 16), "bounds", v4);
  if (v14 < 0.0 || v15 < 0.0)
    *(CGRect *)(&v13 - 1) = CGRectStandardize(*(CGRect *)&v12);
  v16 = v13 + v15;
  if (v8 + v9 > v16)
    return -1;
  else
    return v8 + v9 < v16;
}

- (BOOL)hasDropCap
{
  $F82BA7CF80F7A1221027BFFB2739E57F *v3;
  BOOL result;
  CPPDFChar *v5;
  CPPDFChar *v6;
  double var11;
  double v8;

  if (!self->wordCount)
    return 0;
  v3 = -[CPTextLine wordAtIndex:](self, "wordAtIndex:", 0);
  result = 0;
  if (v3->var1 != 1)
  {
    v5 = -[CPCharSequence charAtIndex:](self->charSequence, "charAtIndex:", v3->var0);
    v6 = -[CPCharSequence charAtIndex:](self->charSequence, "charAtIndex:", v3->var0 + 1);
    var11 = v5->var7->var11;
    v8 = v6->var7->var11;
    return var11 > v8 + v8 || v8 > var11 + var11;
  }
  return result;
}

- (double)medianFontSize
{
  unsigned int v3;
  unsigned int v4;
  float *v5;
  uint64_t i;
  float v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  int v19;
  float v20;
  double v21;
  float v22;
  float v23;
  float v24;

  v3 = -[CPCharSequence length](self->charSequence, "length");
  if (!v3)
    return 0.0;
  v4 = v3;
  v5 = (float *)malloc_type_malloc(4 * v3, 0x100004052888210uLL);
  for (i = 0; i != v4; v5[i++] = v7)
    v7 = *(double *)((_QWORD)-[CPCharSequence charAtIndex:](self->charSequence, "charAtIndex:", i)[160] + 72);
  v8 = v4 - 1;
  v9 = (v4 - 1) >> 1;
  if (v4 - 1 < 2)
  {
    v10 = 0;
  }
  else
  {
    v10 = 0;
    LODWORD(v11) = 1;
    do
    {
      v12 = (v8 + v10) >> 1;
      v13 = v5[v12];
      v14 = v5[v8];
      if (v13 <= v14)
      {
        v13 = v5[v8];
      }
      else
      {
        v5[v12] = v14;
        v5[v8] = v13;
      }
      v15 = v5[v10];
      if (v15 > v13)
      {
        v5[v10] = v13;
        v5[v8] = v15;
        v15 = v5[v10];
      }
      v16 = v5[v12];
      if (v16 > v15)
      {
        v5[v12] = v15;
        v5[v10] = v16;
        v16 = v5[v12];
      }
      v5[v12] = v5[v11];
      v5[v11] = v16;
      v17 = v5[v10];
      LODWORD(v12) = v8;
      while (1)
      {
        do
        {
          v11 = (v11 + 1);
          v18 = v5[v11];
        }
        while (v18 < v17);
        do
        {
          v19 = v12;
          v12 = (v12 - 1);
          v20 = v5[v12];
        }
        while (v20 > v17);
        if (v12 < v11)
          break;
        v5[v11] = v20;
        v5[v12] = v18;
      }
      v5[v10] = v20;
      v5[v12] = v17;
      if (v12 <= v9)
        v10 = v11;
      if (v12 >= v9)
        v8 = v19 - 2;
      LODWORD(v11) = v10 + 1;
    }
    while (v8 > v10 + 1);
  }
  if (v8 <= v10)
  {
    v24 = v5[v9];
  }
  else
  {
    v22 = v5[v10];
    v23 = v5[v8];
    if (v22 > v23)
    {
      v5[v10] = v23;
      v5[v8] = v22;
      v23 = v22;
      v22 = v5[v10];
    }
    v24 = (float)(v22 + v23) * 0.5;
  }
  v21 = v24;
  free(v5);
  return v21;
}

- (double)rotationAngle
{
  double result;

  -[CPCharSequence averageRotation](self->charSequence, "averageRotation");
  return result;
}

- (CGRect)normalizedBounds
{
  CGRect *p_normalizedBounds;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  p_normalizedBounds = &self->normalizedBounds;
  x = self->normalizedBounds.origin.x;
  y = self->normalizedBounds.origin.y;
  if (x == INFINITY || y == INFINITY)
  {
    -[CPCharSequence normalizedBounds](self->charSequence, "normalizedBounds");
    p_normalizedBounds->origin.x = x;
    p_normalizedBounds->origin.y = y;
    p_normalizedBounds->size.width = width;
    p_normalizedBounds->size.height = height;
  }
  else
  {
    width = self->normalizedBounds.size.width;
    height = self->normalizedBounds.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unsigned)leftSpacerIndex
{
  return self->leftSpacerIndex;
}

- (void)setLeftSpacerIndex:(unsigned int)a3
{
  self->leftSpacerIndex = a3;
}

- (unsigned)rightSpacerIndex
{
  return self->rightSpacerIndex;
}

- (void)setRightSpacerIndex:(unsigned int)a3
{
  self->rightSpacerIndex = a3;
}

- (BOOL)isListItem
{
  return self->isListItem;
}

- (void)setIsListItem:(BOOL)a3
{
  self->isListItem = a3;
}

- (unsigned)listSpacerIndex
{
  return self->listSpacerIndex;
}

- (void)setListSpacerIndex:(unsigned int)a3
{
  self->listSpacerIndex = a3;
}

- (BOOL)lineBreakAfter
{
  return self->lineBreakAfter;
}

- (void)setLineBreakAfter:(BOOL)a3
{
  self->lineBreakAfter = a3;
}

@end
