@implementation EQKitLayoutElementaryStackDigitRow

- (EQKitLayoutElementaryStackDigitRow)initWithChildren:(id)a3 decimalPoint:(unint64_t)a4 position:(int64_t)a5 followingSpace:(double)a6
{
  EQKitLayoutElementaryStackDigitRow *v10;
  NSArray *v11;
  unint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)EQKitLayoutElementaryStackDigitRow;
  v10 = -[EQKitLayoutElementaryStackDigitRow init](&v14, sel_init);
  if (v10)
  {
    v11 = (NSArray *)a3;
    v10->mFollowingSpace = a6;
    v12 = v10->mAlignmentShift - (a5 + a4);
    v10->mColumnBoxes = v11;
    v10->mAlignmentShift = v12;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitLayoutElementaryStackDigitRow;
  -[EQKitLayoutElementaryStackDigitRow dealloc](&v3, sel_dealloc);
}

- (unint64_t)columnCount
{
  return -[NSArray count](self->mColumnBoxes, "count");
}

- (void)populateMaxColumnWidths:(__wrap_iter<double *>)a3
{
  NSArray *mColumnBoxes;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  mColumnBoxes = self->mColumnBoxes;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](mColumnBoxes, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(mColumnBoxes);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "width");
        if (*a3.var0 >= v9)
          v9 = *a3.var0;
        *a3.var0 = v9;
        a3.var0 += 8;
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](mColumnBoxes, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
}

- (BOOL)spansStack
{
  return 0;
}

- (id)p_crossoutDigitBox:(id)a3 crossout:(int)a4 layoutManager:(const void *)a5
{
  EQKitOverlayBox *v5;
  double v8;
  double v9;
  int v10;
  CGPath *PathForNotation;
  EQKitPathBox *v12;
  double v13;
  double v14;
  uint64_t v15;
  unint64_t v16;
  __n128 v17;
  unint64_t v18;
  uint64_t v19;
  EQKitPathBox *v20;

  v5 = (EQKitOverlayBox *)a3;
  if (a4)
  {
    objc_msgSend(a3, "width");
    if (v8 != 0.0)
    {
      -[EQKitOverlayBox height](v5, "height");
      if (v9 != 0.0)
      {
        if ((a4 - 2) >= 3)
          v10 = 1;
        else
          v10 = a4;
        PathForNotation = EQKitLayoutManager::createPathForNotation(a5, v5, v10);
        v12 = [EQKitPathBox alloc];
        -[EQKitOverlayBox height](v5, "height");
        v14 = v13;
        v15 = *(_QWORD *)(EQKitLayoutManager::layoutContext((EQKitLayoutManager *)a5) + 112);
        v16 = EQKitLayoutManager::layoutContext((EQKitLayoutManager *)a5);
        v18 = v16;
        v19 = *(_QWORD *)(v16 + 88);
        if ((*(_BYTE *)(v16 + 120) & 1) != 0)
          v17.n128_u64[0] = *(_QWORD *)(v16 + 128);
        else
          v17.n128_f64[0] = EQKitLayoutContext::pComputeRuleThickness((EQKitLayoutContext *)v16);
        v20 = -[EQKitPathBox initWithCGPath:height:cgColor:drawingMode:lineWidth:](v12, "initWithCGPath:height:cgColor:drawingMode:lineWidth:", PathForNotation, v15, 2, v14, (*(double (**)(uint64_t, uint64_t, unint64_t, __n128))(*(_QWORD *)v19 + 56))(v19, 23, v18 + 8, v17));
        v5 = -[EQKitOverlayBox initWithBox:overlayBox:]([EQKitOverlayBox alloc], "initWithBox:overlayBox:", v5, v20);

        CGPathRelease(PathForNotation);
      }
    }
  }
  return v5;
}

- (id)newBoxWithStackWidth:(double)a3 columnWidthIter:(__wrap_iter<double *>)a4 iterMax:(__wrap_iter<double *>)a5 previousRow:(id)a6 layoutManager:(const void *)a7
{
  id v10;
  unint64_t mFirstColumnIndex;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  double v18;
  EQKitHSpace *v19;
  double v20;
  EQKitHSpace *v21;
  EQKitHSpace *v22;
  double v23;
  EQKitHSpace *v24;
  EQKitHBox *v25;
  EQKitLayoutElementaryStackDigitRow *v27;
  NSArray *obj;
  unint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    a6 = 0;
  mFirstColumnIndex = self->mFirstColumnIndex;
  v12 = objc_msgSend(a6, "firstColumnIndex");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v27 = self;
  obj = self->mColumnBoxes;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v13)
  {
    v14 = v13;
    v30 = mFirstColumnIndex - v12;
    v15 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(obj);
        v17 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * i);
        v18 = *a4.var0;
        if (a6 && ((v30 + i) & 0x8000000000000000) == 0)
          v17 = -[EQKitLayoutElementaryStackDigitRow p_crossoutDigitBox:crossout:layoutManager:](v27, "p_crossoutDigitBox:crossout:layoutManager:", v17, objc_msgSend(a6, "crossoutAtColumnIndex:"), a7);
        v19 = [EQKitHSpace alloc];
        objc_msgSend(v17, "width");
        v21 = -[EQKitHSpace initWithWidth:](v19, "initWithWidth:", (v18 - v20) * 0.5);
        v22 = [EQKitHSpace alloc];
        objc_msgSend(v17, "width");
        v24 = -[EQKitHSpace initWithWidth:](v22, "initWithWidth:", (v18 - v23) * 0.5);
        objc_msgSend(v10, "addObject:", v21);
        objc_msgSend(v10, "addObject:", v17);
        objc_msgSend(v10, "addObject:", v24);

        a4.var0 += 8;
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      v30 += i;
    }
    while (v14);
  }
  v25 = -[EQKitCompoundBox initWithChildBoxes:]([EQKitHBox alloc], "initWithChildBoxes:", v10);

  return v25;
}

- (int64_t)alignmentShift
{
  return self->mAlignmentShift;
}

- (unint64_t)firstColumnIndex
{
  return self->mFirstColumnIndex;
}

- (void)setFirstColumnIndex:(unint64_t)a3
{
  self->mFirstColumnIndex = a3;
}

- (double)followingSpace
{
  return self->mFollowingSpace;
}

@end
