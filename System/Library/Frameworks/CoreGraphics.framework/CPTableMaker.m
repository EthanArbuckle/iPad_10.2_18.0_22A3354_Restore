@implementation CPTableMaker

- (CPTableMaker)initWithZone:(id)a3
{
  CPTableMaker *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPTableMaker;
  v4 = -[CPTableMaker init](&v6, sel_init);
  if (v4)
    v4->tableZone = (CPZone *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPTableMaker;
  -[CPTableMaker dealloc](&v3, sel_dealloc);
}

- (id)newBackgroundGraphicArrayFromRectangularZone:(id)a3
{
  id v4;
  int v5;
  int v6;
  unsigned int v7;
  int v8;
  int v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  CGRect v46;
  CGRect v47;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v44 = 0;
  v45 = 0;
  v42 = 0;
  v43 = 0;
  if (objc_msgSend(a3, "rectangleBordersAtLeft:top:right:bottom:", &v45, &v44, &v43, &v42))
  {
    v5 = objc_msgSend(v45, "neighborCount");
    v6 = objc_msgSend(v44, "neighborCount");
    v7 = objc_msgSend(v43, "neighborCount");
    v8 = objc_msgSend(v42, "neighborCount");
    if (v5)
    {
      if (v6)
      {
        if (v7)
        {
          v9 = v8;
          if (v8)
          {
            v41 = v4;
            objc_msgSend(a3, "zoneBounds");
            v11 = v10;
            v13 = v12;
            v15 = v14;
            v17 = v16;
            v18 = 0;
            do
            {
              v19 = (void *)objc_msgSend(v45, "neighborAtIndex:", v18);
              v20 = (void *)objc_msgSend(v19, "neighborShape");
              v21 = objc_msgSend(v20, "fillColor");
              if (v21)
              {
                v29 = v21 < 0
                    ? CGTaggedColorGetAlpha(v21, v22, v23, v24, v25, v26, v27, v28)
                    : *(double *)(v21 + 8 * *(_QWORD *)(v21 + 56) + 56);
                if (v29 != 0.0)
                {
                  objc_msgSend(v20, "renderedBounds");
                  v47.origin.x = v30;
                  v47.origin.y = v31;
                  v47.size.width = v32;
                  v47.size.height = v33;
                  v46.origin.x = v11;
                  v46.origin.y = v13;
                  v46.size.width = v15;
                  v46.size.height = v17;
                  if (CGRectIntersectsRect(v46, v47) && objc_msgSend(v19, "shapeSide") == 2)
                  {
                    v34 = 0;
                    while (1)
                    {
                      v35 = (void *)objc_msgSend(v44, "neighborAtIndex:", v34);
                      if ((void *)objc_msgSend(v35, "neighborShape") == v20
                        && objc_msgSend(v35, "shapeSide") == 3)
                      {
                        break;
                      }
LABEL_25:
                      v34 = (v34 + 1);
                      if ((_DWORD)v34 == v6)
                        goto LABEL_28;
                    }
                    v36 = 0;
                    while (1)
                    {
                      v37 = (void *)objc_msgSend(v43, "neighborAtIndex:", v36);
                      if ((void *)objc_msgSend(v37, "neighborShape") == v20
                        && objc_msgSend(v37, "shapeSide") == 4)
                      {
                        break;
                      }
LABEL_24:
                      v36 = (v36 + 1);
                      if (v36 >= v7)
                        goto LABEL_25;
                    }
                    v38 = 0;
                    while (1)
                    {
                      v39 = (void *)objc_msgSend(v42, "neighborAtIndex:", v38);
                      if ((void *)objc_msgSend(v39, "neighborShape") == v20
                        && objc_msgSend(v39, "shapeSide") == 1)
                      {
                        break;
                      }
                      v38 = (v38 + 1);
                      if (v9 == (_DWORD)v38)
                        goto LABEL_24;
                    }
                    objc_msgSend(v41, "addObject:", v20);
                  }
                }
              }
LABEL_28:
              v18 = (v18 + 1);
            }
            while ((_DWORD)v18 != v5);
            v4 = v41;
            objc_msgSend(v41, "sortUsingSelector:", sel_compareZ_);
          }
        }
      }
    }
  }
  return v4;
}

- (id)newTableCellFromZone:(id)a3
{
  CPTableCell *v5;
  CPTableCell *v6;
  id v7;
  uint64_t i;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  $F24F406B2B787EFB06265DBA3D28CBD5 *rowYIntervals;
  unsigned int v21;
  $F24F406B2B787EFB06265DBA3D28CBD5 *columnXIntervals;
  unsigned int v23;
  double *p_var0;
  uint64_t v25;
  uint64_t j;
  void *v27;
  int v28;
  int v29;
  uint64_t v30;
  _BYTE v32[32];
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v5 = [CPTableCell alloc];
  objc_msgSend(a3, "zoneBounds");
  v6 = -[CPTableCell initWithBounds:](v5, "initWithBounds:");
  v7 = -[CPTableMaker newBackgroundGraphicArrayFromRectangularZone:](self, "newBackgroundGraphicArrayFromRectangularZone:", a3);
  -[CPTableCell setBackgroundGraphics:](v6, "setBackgroundGraphics:", v7);

  if (objc_msgSend(a3, "rectangleBordersAtLeft:top:right:bottom:", v35, v32, &v33, &v34))
  {
    for (i = 0; i != 4; ++i)
    {
      objc_msgSend(*(id *)&v32[8 * i], "bounds");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v17 = (void *)objc_msgSend(*(id *)&v32[8 * i], "graphicObjects");
      -[CPTableCell setBorder:bounds:graphics:](v6, "setBorder:bounds:graphics:", i, objc_msgSend(v17, "sortedArrayUsingSelector:", sel_compareZ_), v10, v12, v14, v16);
      v18 = v10 + -2.0;
      v19 = v12 + -2.0;
      switch((int)i)
      {
        case 0:
          rowYIntervals = self->rowYIntervals;
          v21 = (2 * self->cellIndex) | 1;
          goto LABEL_7;
        case 1:
          columnXIntervals = self->columnXIntervals;
          v23 = (2 * self->cellIndex) | 1;
          goto LABEL_9;
        case 2:
          rowYIntervals = self->rowYIntervals;
          v21 = 2 * self->cellIndex;
LABEL_7:
          p_var0 = &rowYIntervals[v21].var0;
          *p_var0 = v19;
          goto LABEL_10;
        case 3:
          columnXIntervals = self->columnXIntervals;
          v23 = 2 * self->cellIndex;
LABEL_9:
          p_var0 = &columnXIntervals[v23].var0;
          *p_var0 = v18;
          v16 = v14;
LABEL_10:
          v18 = v16 + 4.0;
          p_var0[1] = v16 + 4.0;
          break;
        default:
          break;
      }
      v25 = objc_msgSend(v17, "count", v18, v19);
      if (v25)
      {
        for (j = 0; j != v25; ++j)
        {
          v27 = (void *)objc_msgSend(v17, "objectAtIndex:", j);
          if (objc_msgSend(v27, "parent"))
            objc_msgSend(v27, "setUser:", self->table);
        }
      }
      v28 = objc_msgSend(*(id *)&v32[8 * i], "neighborCount");
      if (v28)
      {
        v29 = v28;
        v30 = 0;
        do
        {
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)&v32[8 * i], "neighborAtIndex:", v30), "neighborShape"), "setUser:", self->table);
          v30 = (v30 + 1);
        }
        while (v29 != (_DWORD)v30);
      }
    }
  }
  else
  {
    self->rowYIntervals[2 * self->cellIndex] = ($F24F406B2B787EFB06265DBA3D28CBD5)CGIntervalNull;
    self->rowYIntervals[(2 * self->cellIndex) | 1] = ($F24F406B2B787EFB06265DBA3D28CBD5)CGIntervalNull;
    self->columnXIntervals[2 * self->cellIndex] = ($F24F406B2B787EFB06265DBA3D28CBD5)CGIntervalNull;
    self->columnXIntervals[(2 * self->cellIndex) | 1] = ($F24F406B2B787EFB06265DBA3D28CBD5)CGIntervalNull;
  }
  return v6;
}

- (void)determineRowsAndColumns:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  char *v6;
  size_t v7;
  unsigned int *v8;
  unsigned int *v9;
  uint64_t i;
  double *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  unsigned int v16;
  double *v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  unint64_t v22;
  int v23;
  int v24;
  int v25;
  double v26;
  double *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  unsigned int v33;
  CPTable *table;
  uint64_t v35;
  double *v36;
  double *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t v42;
  double *v43;
  double v44;
  double v45;
  uint64_t v46;
  double v47;
  double v48;
  double *v49;
  unint64_t v50;
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  int v54;
  unsigned int *v55;
  char v56;
  unsigned int v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unsigned int v68;
  size_t v69;
  _DWORD *v70;

  v3 = a3;
  v5 = 40;
  if (a3)
    v5 = 32;
  v6 = *(char **)((char *)&self->super.isa + v5);
  v7 = 2 * -[CPObject count](self->table, "count");
  if ((_DWORD)v7)
  {
    v8 = (unsigned int *)malloc_type_malloc(4 * v7, 0x100004052888210uLL);
    v9 = v8;
    for (i = 0; i != v7; ++i)
      v8[i] = i;
    qsort_r(v8, v7, 4uLL, v6, (int (__cdecl *)(void *, const void *, const void *))compareIntervalIndirect);
    v69 = v7;
    v70 = malloc_type_malloc(4 * v7, 0x100004052888210uLL);
    *v70 = 0;
    v11 = (double *)&v6[16 * *v9];
    v12 = *v11;
    v13 = v11[1];
    v14 = *v11 + v13 * 0.5;
    v15 = 1;
    v16 = 1;
    do
    {
      v17 = (double *)&v6[16 * v9[v15]];
      v18 = *v17;
      v19 = v17[1];
      v12 = CGIntervalIntersection(v12, v13, *v17, v19);
      if (fabs(v12) == INFINITY || (v20 = v15 + 1, v15 + 1 == v7) && v16 == 1)
      {
        v21 = v18 + v19 * 0.5;
        v22 = v70[v16 - 1];
        if (v15 - 1 <= v22)
        {
          v25 = v15;
        }
        else
        {
          v23 = v15 - 2;
          if (v22 < (int)v15 - 2)
            v23 = v70[v16 - 1];
          v24 = v23 + 1;
          v25 = v15;
          v26 = v18 + v19 * 0.5;
          do
          {
            v27 = (double *)&v6[16 * v9[v25 - 1]];
            v28 = *v27;
            v29 = v27[1];
            v30 = CGIntervalIntersection(v18, v19, *v27, v29);
            if (fabs(v30) == INFINITY || v28 + v29 * 0.5 - v14 <= v21 - (v28 + v29 * 0.5))
            {
              v21 = v26;
              goto LABEL_22;
            }
            v33 = v25 - 2;
            --v25;
            v19 = v31;
            v18 = v30;
            v26 = v28 + v29 * 0.5;
          }
          while (v33 > v22);
          v25 = v24;
          v21 = v28 + v29 * 0.5;
          v18 = v30;
          v19 = v31;
LABEL_22:
          v7 = v69;
        }
        v70[v16++] = v25;
        v20 = v15 + 1;
        v12 = v18;
        v13 = v19;
        v14 = v21;
      }
      v15 = v20;
    }
    while (v20 != v7);
    table = self->table;
    v35 = v16 - 1;
    if (v3)
    {
      -[CPTable setRowCount:](table, "setRowCount:", v35, v12, v13);
      v36 = -[CPTable rowY](self->table, "rowY");
    }
    else
    {
      -[CPTable setColumnCount:](table, "setColumnCount:", v35, v12, v13);
      v36 = -[CPTable columnX](self->table, "columnX");
    }
    v37 = v36;
    v68 = v16;
    if (v16)
    {
      v38 = 0;
      v39 = v68;
      do
      {
        v40 = v38 + 1;
        v41 = v7;
        if (v38 + 1 < v39)
          v41 = v70[v40];
        v42 = v70[v38];
        v43 = (double *)&v6[16 * v9[v42]];
        v44 = *v43;
        v45 = v43[1];
        v46 = (v42 + 1);
        do
        {
          v47 = v45;
          v48 = v44;
          if (v46 >= v41)
            break;
          v49 = (double *)&v6[16 * v9[v46]];
          v44 = CGIntervalIntersection(v44, v45, *v49, v49[1]);
          ++v46;
        }
        while (fabs(v44) != INFINITY);
        v37[v38++] = v48 + v47 * 0.5;
        v39 = v68;
        LODWORD(v7) = v69;
      }
      while (v40 != v68);
      v50 = 0;
      do
      {
        v51 = v50++;
        v52 = v7;
        if (v50 < v39)
          v52 = v70[v50];
        v53 = v70[v51];
        if (v52 > v53)
        {
          v54 = v52 - v53;
          v55 = &v9[v53];
          do
          {
            v57 = *v55++;
            v56 = v57;
            v58 = -[CPObject childAtIndex:](self->table, "childAtIndex:", v57 >> 1);
            v59 = v58;
            if (v3)
            {
              v60 = objc_msgSend(v58, "rowSpan");
              if ((v56 & 1) != 0)
                v62 = v68 + ~(_DWORD)v51;
              else
                v62 = v51;
              if ((v56 & 1) != 0)
                v63 = v51 - v60;
              else
                v63 = v61;
              objc_msgSend(v59, "setRowSpan:", v62, v63);
            }
            else
            {
              v64 = objc_msgSend(v58, "columnSpan");
              if ((v56 & 1) != 0)
                v66 = v64;
              else
                v66 = v51;
              if ((v56 & 1) != 0)
                v67 = v51 - v64;
              else
                v67 = v65;
              objc_msgSend(v59, "setColumnSpan:", v66, v67);
            }
            --v54;
          }
          while (v54);
        }
        v39 = v68;
        LODWORD(v7) = v69;
      }
      while (v50 != v68);
    }
    free(v70);
    free(v9);
  }
}

- (void)makeTable
{
  id v3;
  void *v4;
  CPTable *v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v3 = -[CPObject parent](self->tableZone, "parent");
  if (v3)
  {
    v4 = v3;
    v5 = [CPTable alloc];
    -[CPZone zoneBounds](self->tableZone, "zoneBounds");
    self->table = -[CPTable initWithBounds:](v5, "initWithBounds:");
    v6 = -[CPTableMaker newBackgroundGraphicArrayFromRectangularZone:](self, "newBackgroundGraphicArrayFromRectangularZone:", self->tableZone);
    -[CPTable setBackgroundGraphics:](self->table, "setBackgroundGraphics:", v6);

    self->cellIndex = 0;
    v7 = -[CPObject count](self->tableZone, "count");
    self->rowYIntervals = ($F24F406B2B787EFB06265DBA3D28CBD5 *)malloc_type_malloc(32 * v7, 0x1000040451B5BE8uLL);
    self->columnXIntervals = ($F24F406B2B787EFB06265DBA3D28CBD5 *)malloc_type_malloc(32 * v7, 0x1000040451B5BE8uLL);
    if (v7)
    {
      v8 = 0;
      do
      {
        v9 = -[CPObject childAtIndex:](self->tableZone, "childAtIndex:", v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[CPTableMaker makeTablesInZone:](CPTableMaker, "makeTablesInZone:", v9);
          v10 = -[CPTableMaker newTableCellFromZone:](self, "newTableCellFromZone:", v9);
          v11 = objc_msgSend(v9, "zOrder");
          v12 = (void *)objc_msgSend(v9, "newTakeChildren");
          objc_msgSend(v10, "setChildren:", v12);
          objc_msgSend(v10, "setZOrder:", v11);

          -[CPChunk add:](self->table, "add:", v10);
          ++self->cellIndex;
        }
        v8 = (v8 + 1);
      }
      while (v7 != (_DWORD)v8);
    }
    -[CPTableMaker determineRowsAndColumns:](self, "determineRowsAndColumns:", 1);
    -[CPTableMaker determineRowsAndColumns:](self, "determineRowsAndColumns:", 0);
    free(self->columnXIntervals);
    self->columnXIntervals = 0;
    free(self->rowYIntervals);
    self->rowYIntervals = 0;
    -[CPChunk sortUsingSelector:](self->table, "sortUsingSelector:", sel_compareCellOrdinal_);
    v13 = objc_msgSend(v4, "indexOf:", self->tableZone);
    -[CPObject remove](self->tableZone, "remove");
    objc_msgSend(v4, "add:atIndex:", self->table, v13);
  }
}

+ (BOOL)isTable:(id)a3
{
  int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_4:
    LOBYTE(v4) = 0;
    return v4;
  }
  v4 = objc_msgSend(a3, "isRectangular");
  if (v4)
  {
    v5 = objc_msgSend(a3, "count");
    if (v5 >= 2)
    {
      v6 = v5;
      v7 = 0;
      while (1)
      {
        v8 = (void *)objc_msgSend(a3, "childAtIndex:", v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_msgSend(v8, "isRectangular") & 1) == 0)
          break;
        v7 = (v7 + 1);
        if (v6 == (_DWORD)v7)
        {
          LOBYTE(v4) = objc_msgSend(a3, "firstDescendantOfClass:", objc_opt_class()) != 0;
          return v4;
        }
      }
    }
    goto LABEL_4;
  }
  return v4;
}

+ (void)makeTableFrom:(id)a3
{
  CPTableMaker *v3;

  v3 = -[CPTableMaker initWithZone:]([CPTableMaker alloc], "initWithZone:", a3);
  -[CPTableMaker makeTable](v3, "makeTable");

}

+ (void)makeTablesInZone:(id)a3
{
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend(a3, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    do
    {
      v7 = objc_msgSend(a3, "childAtIndex:", v6);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (+[CPTableMaker isTable:](CPTableMaker, "isTable:", v7))
          +[CPTableMaker makeTableFrom:](CPTableMaker, "makeTableFrom:", v7);
        else
          +[CPTableMaker makeTablesInZone:](CPTableMaker, "makeTablesInZone:", v7);
      }
      v6 = (v6 + 1);
    }
    while (v5 != (_DWORD)v6);
  }
}

+ (void)makeTablesInPage:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "firstDescendantOfClass:", objc_opt_class());
  if (v3)
    +[CPTableMaker makeTablesInZone:](CPTableMaker, "makeTablesInZone:", v3);
}

@end
