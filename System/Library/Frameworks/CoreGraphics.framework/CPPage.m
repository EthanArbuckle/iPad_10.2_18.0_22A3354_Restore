@implementation CPPage

- (CPPage)init
{
  CPPage *v2;
  CPPage *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPPage;
  v2 = -[CPChunk init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->hasTextLines = 0;
    v2->isStartOfSection = 0;
    v2->complexity = 0.0;
    v2->shapesOnPage = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v3->imagesOnPage = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v3->annotationsOnPage = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v3->graphicsOnPage = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v3->textLinesOnPage = 0;
    v3->pdfContext = 0;
    v3->pdfPage = 0;
    v3->_layout = 0;
    v3->columnsOnPage = 0;
    v3->reconstructed = 0;
    v3->hitTest = 0;
  }
  return v3;
}

- (CPPage)initWithPDFPage:(CGPDFPage *)a3
{
  CPPage *v4;
  CPPage *v5;
  CGPDFPage *pdfPage;

  v4 = -[CPPage init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->pdfPage = a3;
    if (a3)
    {
      CFRetain(a3);
      pdfPage = v5->pdfPage;
      if (pdfPage)
        LODWORD(pdfPage) = *(_DWORD *)(*((_QWORD *)pdfPage + 5) + 8);
    }
    else
    {
      LODWORD(pdfPage) = 0;
    }
    v5->pageNumber = (int)pdfPage;
    pthread_mutex_init(&v5->mutex, 0);
  }
  return v5;
}

- (void)dispose
{
  CPPDFContext *pdfContext;
  void *layout;
  CGPDFPage *pdfPage;

  if (self->pdfPage)
  {
    -[CPObject disposeDescendants](self, "disposeDescendants");
    pdfContext = self->pdfContext;
    if (pdfContext && self->contextOwner)
    {
      CPPDFContextRelease((uint64_t)pdfContext);
      self->pdfContext = 0;
    }
    layout = self->_layout;
    if (layout)
    {
      CFRelease(layout);
      self->_layout = 0;
    }
    pdfPage = self->pdfPage;
    if (pdfPage)
      CFRelease(pdfPage);
    pthread_mutex_destroy(&self->mutex);
    self->pdfPage = 0;
  }
}

- (void)finalize
{
  objc_super v3;

  -[CPPage dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPPage;
  -[CPPage finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  objc_super v3;

  -[CPPage dispose](self, "dispose");

  v3.receiver = self;
  v3.super_class = (Class)CPPage;
  -[CPObject dealloc](&v3, sel_dealloc);
}

- (CGPDFPage)pdfPage
{
  return self->pdfPage;
}

- (void)reconstruct
{
  _opaque_pthread_mutex_t *p_mutex;
  CGPDFPage *pdfPage;
  double x;
  double y;
  double width;
  double v8;
  double height;
  int32x2_t *v11;
  __int32 v12;
  CGPDFOperatorTable *v13;
  CGPDFContentStream *v14;
  uint64_t v15;
  CGPDFScanner *v16;
  int32x2_t v17;
  int32x2_t i;
  CPImage *v19;
  int32x2_t v20;
  int32x2_t v21;
  int v22;
  const CGPath *v23;
  uint64_t v24;
  CPShape *v25;
  _OWORD *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  const CGPath **v37;
  const CGPath *v38;
  uint64_t v39;
  const CGPath **v40;
  const CGPath *v41;
  CPShape *v42;
  const void *v43;
  CGPDFPage *v44;
  void *v45;
  CPZoneMaker *v46;
  id v47;
  id v48;
  CPBuilder *v49;
  uint64_t info;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t, uint64_t);
  unint64_t v53;
  uint64_t v54;
  CGRect BoxRect;

  if (self->pdfPage)
  {
    p_mutex = &self->mutex;
    pthread_mutex_lock(&self->mutex);
    if (!self->reconstructed)
    {
      pdfPage = self->pdfPage;
      BoxRect = CGPDFPageGetBoxRect(pdfPage, kCGPDFCropBox);
      x = BoxRect.origin.x;
      y = BoxRect.origin.y;
      width = BoxRect.size.width;
      v8 = fabs(BoxRect.size.height);
      if (fabs(BoxRect.size.width) >= 1.0 && v8 >= 1.0)
      {
        height = BoxRect.size.height;
        -[CPPage setRotation:](self, "setRotation:", CGPDFPageGetRotationAngle(pdfPage));
        -[CPPage setPageCropBox:](self, "setPageCropBox:", x, y, width, height);
        if (pdfPage)
        {
          v11 = CPPDFContextCreate();
          if (v11)
          {
            *(CGRect *)v11->i8 = CGPDFPageGetBoxRect(pdfPage, kCGPDFCropBox);
            pthread_mutex_lock((pthread_mutex_t *)((char *)pdfPage + 216));
            v12 = *((_DWORD *)pdfPage + 12);
            pthread_mutex_unlock((pthread_mutex_t *)((char *)pdfPage + 216));
            v11[285].i32[1] = v12;
            v11[286] = (int32x2_t)pdfPage;
            v11[293] = 0;
            v13 = CGPDFOperatorTableCreate();
            AddPdfOperators(v13);
            v14 = (CGPDFContentStream *)CGPDFContentStreamCreate(*((_QWORD *)pdfPage + 5));
            v15 = v11[257].u32[0];
            v11[257].i32[0] = v15 + 1;
            v11[v15 + 7] = (int32x2_t)v14;
            v16 = CGPDFScannerCreate(v14, v13, v11);
            *(_BYTE *)(*(_QWORD *)&v11[5] + 8) = 1;
            CPPDFContextSaveGState((uint64_t)v11);
            *(_BYTE *)(*(_QWORD *)&v11[5] + 8) = 0;
            CGPDFScannerScan(v16);
            CPPDFContextRestoreGState((uint64_t)v11);
            v17 = v11[5];
            if (v17)
              *(_BYTE *)(*(_QWORD *)&v17 + 8) = 0;
            if (v14)
              CFRelease(v14);
            if (v16)
              CFRelease(v16);
            if (v13)
              CFRelease(v13);
          }
        }
        else
        {
          v11 = 0;
        }
        -[CPPage setPDFContext:](self, "setPDFContext:", v11);
        for (i = v11[270]; *(_QWORD *)&i < *(_QWORD *)&v11[271]; *(_QWORD *)&i += 184)
        {
          v19 = -[CPImage initWithPDFImage:]([CPImage alloc], "initWithPDFImage:", *(_QWORD *)&i);
          -[CPGraphicObject setClipIndex:](v19, "setClipIndex:", *(unsigned int *)(*(_QWORD *)&i + 64));
          -[CPPage addImage:](self, "addImage:", v19);

        }
        v20 = v11[264];
        v21 = v11[265];
        if (*(_QWORD *)&v20 < *(_QWORD *)&v21)
        {
          while (1)
          {
            v22 = *(_DWORD *)(*(_QWORD *)&v20 + 88);
            if (v22 != 4)
              break;
LABEL_36:
            *(_QWORD *)&v20 += 216;
            if (*(_QWORD *)&v20 >= *(_QWORD *)&v21)
              goto LABEL_37;
          }
          v23 = *(const CGPath **)(*(_QWORD *)&v20 + 96);
          if (v23)
          {
            info = 0x100000000;
            CGPathApply(v23, &info, (CGPathApplierFunction)countSubpaths);
            v24 = info;
            if ((_DWORD)info == 1 || (*(_DWORD *)(*(_QWORD *)&v20 + 88) & 1) != 0)
              goto LABEL_26;
          }
          else
          {
            v24 = 0;
            if ((v22 & 1) != 0)
            {
LABEL_26:
              v25 = -[CPShape initWithPDFShape:]([CPShape alloc], "initWithPDFShape:", *(_QWORD *)&v20);
              -[CPGraphicObject setClipIndex:](v25, "setClipIndex:", *(unsigned int *)(*(_QWORD *)&v20 + 64));
              -[CPPage addShape:](self, "addShape:", v25);

LABEL_35:
              v21 = v11[265];
              goto LABEL_36;
            }
          }
          v26 = malloc_type_malloc(0xD8uLL, 0x1060040AFBA4986uLL);
          v27 = *(_OWORD *)(*(_QWORD *)&v20 + 16);
          *v26 = *(_OWORD *)*(_QWORD *)&v20;
          v26[1] = v27;
          v28 = *(_OWORD *)(*(_QWORD *)&v20 + 80);
          v30 = *(_OWORD *)(*(_QWORD *)&v20 + 32);
          v29 = *(_OWORD *)(*(_QWORD *)&v20 + 48);
          v26[4] = *(_OWORD *)(*(_QWORD *)&v20 + 64);
          v26[5] = v28;
          v26[2] = v30;
          v26[3] = v29;
          v31 = *(_OWORD *)(*(_QWORD *)&v20 + 144);
          v33 = *(_OWORD *)(*(_QWORD *)&v20 + 96);
          v32 = *(_OWORD *)(*(_QWORD *)&v20 + 112);
          v26[8] = *(_OWORD *)(*(_QWORD *)&v20 + 128);
          v26[9] = v31;
          v26[6] = v33;
          v26[7] = v32;
          v35 = *(_OWORD *)(*(_QWORD *)&v20 + 176);
          v34 = *(_OWORD *)(*(_QWORD *)&v20 + 192);
          v36 = *(_OWORD *)(*(_QWORD *)&v20 + 160);
          *((_QWORD *)v26 + 26) = *(_QWORD *)(*(_QWORD *)&v20 + 208);
          v26[11] = v35;
          v26[12] = v34;
          v26[10] = v36;
          v37 = (const CGPath **)malloc_type_malloc(8 * v24, 0x2004093837F09uLL);
          v38 = *(const CGPath **)(*(_QWORD *)&v20 + 96);
          if (v38)
          {
            v54 = 1;
            info = (uint64_t)v37;
            v51 = 0;
            v52 = 0;
            v53 = v24;
            CGPathApply(v38, &info, (CGPathApplierFunction)createSubpaths);
            v39 = HIDWORD(v53);
            if (HIDWORD(v53))
            {
              v40 = v37;
              do
              {
                v41 = *v40;
                *((_QWORD *)v26 + 12) = *v40;
                *(CGRect *)v26 = CGPathGetPathBoundingBox(v41);
                v42 = -[CPShape initWithPDFShape:]([CPShape alloc], "initWithPDFShape:", v26);
                v43 = (const void *)*((_QWORD *)v26 + 12);
                if (v43)
                  CFRelease(v43);
                -[CPGraphicObject setClipIndex:](v42, "setClipIndex:", *((unsigned int *)v26 + 16));
                -[CPPage addShape:](self, "addShape:", v42);

                ++v40;
                --v39;
              }
              while (v39);
            }
          }
          free(v37);
          free(v26);
          goto LABEL_35;
        }
LABEL_37:
        v44 = -[CPPage pdfPage](self, "pdfPage");
        info = MEMORY[0x1E0C809B0];
        v51 = 3221225472;
        v52 = __MapContextToPage_block_invoke;
        v53 = (unint64_t)&unk_1E1644FC8;
        v54 = (uint64_t)self;
        CGPDFPageEnumerateAnnotations((uint64_t)v44, (uint64_t)&info);
        v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", -[CPPage graphicsOnPage](self, "graphicsOnPage"));
        -[CPChunk setChildren:](self, "setChildren:", v45);

      }
      v46 = objc_alloc_init(CPZoneMaker);
      -[CPZoneMaker makeZonesIn:](v46, "makeZonesIn:", self);

      v47 = -[CPPage bodyZone](self, "bodyZone");
      if (v47)
      {
        v48 = v47;
        v49 = objc_alloc_init(CPBuilder);
        -[CPBuilder prepareZone:](v49, "prepareZone:", v48);

      }
      ReconstructZone(-[CPPage bodyZone](self, "bodyZone"));
      +[CPListMaker makeListsInPage:](CPListMaker, "makeListsInPage:", self);
      +[CPLineBreaker breakLinesInPage:](CPLineBreaker, "breakLinesInPage:", self);
      +[CPPreformatter preformatInPage:](CPPreformatter, "preformatInPage:", self);
      +[CPTableMaker makeTablesInPage:](CPTableMaker, "makeTablesInPage:", self);
      +[CPZoneFilter filterZonesInPage:](CPZoneFilter, "filterZonesInPage:", self);
      -[CPPage layDownObjectsOnPage](self, "layDownObjectsOnPage");
      -[CPPage sortByReadingOrder](self, "sortByReadingOrder");
      self->reconstructed = 1;
    }
    pthread_mutex_unlock(p_mutex);
  }
}

- (void)setPDFContext:(CPPDFContext *)a3
{
  self->pdfContext = a3;
  self->contextOwner = 1;
}

- (CPPDFContext)PDFContext
{
  return self->pdfContext;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  _QWORD *v5;
  CGPDFPage *pdfPage;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPPage;
  v4 = -[CPChunk copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    v4[3] = self->super.super.document;
    pdfPage = self->pdfPage;
    if (pdfPage)
      CFRetain(self->pdfPage);
    v5[28] = pdfPage;
    v5[26] = self->pdfContext;
    *((_BYTE *)v5 + 216) = 0;
    v5[19] = -[CPChunk copy](self->background, "copy");
    v5[21] = -[NSMutableArray mutableCopy](self->shapesOnPage, "mutableCopy");
    v5[22] = -[NSMutableArray mutableCopy](self->imagesOnPage, "mutableCopy");
    v5[25] = -[NSMutableArray mutableCopy](self->annotationsOnPage, "mutableCopy");
    v5[23] = -[NSMutableArray mutableCopy](self->graphicsOnPage, "mutableCopy");
    v5[29] = -[NSMutableArray mutableCopy](self->textLinesOnPage, "mutableCopy");
    v5[31] = self->hitTest;
  }
  return v5;
}

- (void)setPageCropBox:(CGRect)a3
{
  self->pageCropBox = a3;
}

- (CGRect)pageCropBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->pageCropBox.origin.x;
  y = self->pageCropBox.origin.y;
  width = self->pageCropBox.size.width;
  height = self->pageCropBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)accept:(id)a3
{
  objc_msgSend(a3, "visitPage:", self);
}

- (float)complexity
{
  return self->complexity;
}

- (void)setComplexity:(float)a3
{
  self->complexity = a3;
}

- (int)pageNumber
{
  return self->pageNumber;
}

- (void)setPageNumber:(int)a3
{
  self->pageNumber = a3;
}

- (id)parent
{
  return 0;
}

- (void)addShape:(id)a3
{
  -[NSMutableArray addObject:](self->graphicsOnPage, "addObject:");
  -[NSMutableArray addObject:](self->shapesOnPage, "addObject:", a3);
}

- (id)shapesOnPage
{
  return self->shapesOnPage;
}

- (void)addImage:(id)a3
{
  -[NSMutableArray addObject:](self->graphicsOnPage, "addObject:");
  -[NSMutableArray addObject:](self->imagesOnPage, "addObject:", a3);
}

- (id)imagesOnPage
{
  return self->imagesOnPage;
}

- (void)addAnnotation:(id)a3
{
  -[NSMutableArray addObject:](self->graphicsOnPage, "addObject:");
  -[NSMutableArray addObject:](self->annotationsOnPage, "addObject:", a3);
}

- (id)annotationsOnPage
{
  return self->annotationsOnPage;
}

- (id)graphicsOnPage
{
  return self->graphicsOnPage;
}

- (void)setHasZones:(BOOL)a3
{
  self->hasZones = a3;
}

- (BOOL)hasZones
{
  return self->hasZones;
}

- (id)bodyZone
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = -[NSMutableArray count](self->super.super.children, "count");
  if (v3 < 1)
    return 0;
  v4 = 0;
  v5 = v3;
  while (1)
  {
    v6 = (void *)-[NSMutableArray objectAtIndex:](self->super.super.children, "objectAtIndex:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    if (v5 == ++v4)
      return 0;
  }
  return v6;
}

- (BOOL)hasTextLines
{
  return self->hasTextLines;
}

- (void)setHasTextLines:(BOOL)a3
{
  self->hasTextLines = a3;
}

- (BOOL)isStartOfSection
{
  return self->isStartOfSection;
}

- (void)setIsStartOfSection:(BOOL)a3
{
  self->isStartOfSection = a3;
}

- (int)rotation
{
  return self->rotation;
}

- (void)setRotation:(int)a3
{
  int v3;
  int v4;

  if (a3 / -90 >= 0)
    v3 = -((a3 / -90) & 3);
  else
    v3 = (a3 / 90) & 3;
  if (v3 >= 0)
    v4 = 90 * v3;
  else
    v4 = 90 * v3 + 360;
  self->rotation = v4;
}

- (id)background
{
  return self->background;
}

- (void)setBackground:(id)a3
{
  CPChunk *background;

  background = self->background;
  if (background != a3)
  {

    self->background = (CPChunk *)a3;
  }
}

- (void)restoreBackGroundObjectToPage
{
  CPChunk *background;

  background = self->background;
  if (background)
    -[CPChunk add:atIndex:](self, "add:atIndex:", background, 0);
}

- (id)children
{
  return self->super.super.children;
}

- (unsigned)traverse:(id)a3 ordinal:(unsigned int)a4
{
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;

  v6 = a4 + 1;
  objc_msgSend(a3, "setChunkPosition:", *(_QWORD *)&a4);
  v7 = objc_msgSend(a3, "count");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    do
    {
      v6 = -[CPPage traverse:ordinal:](self, "traverse:ordinal:", objc_msgSend(a3, "childAtIndex:", v9), v6);
      v9 = (v9 + 1);
    }
    while (v8 != (_DWORD)v9);
  }
  return v6;
}

- (unsigned)setPositionsOf:(id)a3 from:(unsigned int)a4
{
  uint64_t v4;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v4 = *(_QWORD *)&a4;
  v6 = objc_msgSend(a3, "count");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    do
    {
      v9 = (void *)objc_msgSend(a3, "childAtIndex:", v8);
      v10 = objc_msgSend(v9, "count");
      if (v10)
      {
        v11 = v10;
        v12 = 0;
        do
        {
          objc_msgSend((id)objc_msgSend(v9, "childAtIndex:", v12), "setChunkPosition:", (v4 + v12));
          v12 = (v12 + 1);
        }
        while (v11 != (_DWORD)v12);
        v4 = (v4 + v12);
      }
      v13 = (v4 + 1);
      objc_msgSend(v9, "setChunkPosition:", v4);
      v8 = (v8 + 1);
      v4 = v13;
    }
    while ((_DWORD)v8 != v7);
  }
  else
  {
    v13 = v4;
  }
  objc_msgSend(a3, "setChunkPosition:", v13);
  return v13 + 1;
}

- (unsigned)setCellPositionsOf:(id)a3 from:(unsigned int)a4
{
  uint64_t v4;
  int v7;
  int v8;
  uint64_t v9;

  v4 = *(_QWORD *)&a4;
  v7 = objc_msgSend(a3, "count");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    do
    {
      v4 = -[CPPage setReadingOrder:from:](self, "setReadingOrder:from:", objc_msgSend(a3, "childAtIndex:", v9), v4);
      v9 = (v9 + 1);
    }
    while (v8 != (_DWORD)v9);
  }
  objc_msgSend(a3, "setChunkPosition:", v4);
  return v4 + 1;
}

- (unsigned)setGraphicPositions:(id)a3 from:(unsigned int)a4
{
  uint64_t v4;
  int v7;
  int v8;
  uint64_t v9;

  v4 = *(_QWORD *)&a4;
  v7 = objc_msgSend(a3, "count");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    do
    {
      v4 = -[CPPage setGraphicPositions:from:](self, "setGraphicPositions:from:", objc_msgSend(a3, "childAtIndex:", v9), v4);
      v9 = (v9 + 1);
    }
    while (v8 != (_DWORD)v9);
  }
  objc_msgSend(a3, "setChunkPosition:", v4);
  return v4 + 1;
}

- (unsigned)setReadingOrder:(id)a3 from:(unsigned int)a4
{
  uint64_t v4;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = *(_QWORD *)&a4;
  v27 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  v21 = a3;
  v8 = objc_msgSend(a3, "count");
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    do
    {
      v11 = objc_msgSend(a3, "childAtIndex:", v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v7, "addObject:", v11);
      }
      v10 = (v10 + 1);
    }
    while (v9 != (_DWORD)v10);
  }
  if ((objc_msgSend(v7, "count") & 0xFFFFFFFELL) != 0)
    objc_msgSend(v7, "sortUsingFunction:context:", compareKeyOrder, 0);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v7);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v15);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = -[CPPage setReadingOrder:from:](self, "setReadingOrder:from:", v16, v4);
LABEL_22:
          v4 = v17;
          goto LABEL_23;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = -[CPPage setPositionsOf:from:](self, "setPositionsOf:from:", v16, v4);
          goto LABEL_22;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v17 = -[CPPage setCellPositionsOf:from:](self, "setCellPositionsOf:from:", v16, v4);
          else
            v17 = -[CPPage setGraphicPositions:from:](self, "setGraphicPositions:from:", v16, v4);
          goto LABEL_22;
        }
        v18 = -[CPPage setPositionsOf:from:](self, "setPositionsOf:from:", objc_msgSend(v16, "firstChild"), v4);
        v4 = (v18 + 1);
        objc_msgSend(v16, "setChunkPosition:", v18);
LABEL_23:
        ++v15;
      }
      while (v13 != v15);
      v19 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v13 = v19;
    }
    while (v19);
  }
  objc_msgSend(v21, "setChunkPosition:", v4);

  return v4 + 1;
}

- (void)layDownObjectsOnPage
{
  -[CPPage setReadingOrder:from:](self, "setReadingOrder:from:", -[CPPage bodyZone](self, "bodyZone"), 0);
}

- (void)sortByReadingOrder
{
  +[CPPage sortByReadingOrder:](CPPage, "sortByReadingOrder:", self);
}

- (void)layDownObjectsOnPageOld
{
  int v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  -[CPObject descendantsOfClass:to:](self, "descendantsOfClass:to:", objc_opt_class(), obj);
  v3 = objc_msgSend(obj, "count");
  v4 = (v3 - 1);
  if (v3 - 1 >= 0)
  {
    do
    {
      v5 = (void *)objc_msgSend(obj, "objectAtIndex:", v4);
      v6 = objc_msgSend(v5, "count");
      v7 = 0;
      if (v6)
      {
        while (1)
        {
          objc_msgSend(v5, "childAtIndex:", v7);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          v7 = (v7 + 1);
          if (v6 == (_DWORD)v7)
            goto LABEL_8;
        }
      }
      if ((_DWORD)v7 == v6)
LABEL_8:
        objc_msgSend(obj, "removeObjectAtIndex:", v4);
    }
    while (v4-- > 0);
  }
  if (objc_msgSend(obj, "count"))
  {
    objc_msgSend(obj, "sortUsingFunction:context:", compareZoneReadingOrder, 0);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (!v24)
      goto LABEL_33;
    v10 = 0;
    v23 = *(_QWORD *)v30;
    while (1)
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v12, "setChunkPosition:", v10);
        v13 = objc_msgSend(v12, "count");
        if (v13)
        {
          v14 = v13;
          v15 = 0;
          while (1)
          {
            v16 = (void *)objc_msgSend(v12, "childAtIndex:", v15);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              break;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              goto LABEL_22;
LABEL_23:
            v15 = (v15 + 1);
            if (v14 == (_DWORD)v15)
              goto LABEL_24;
          }
          v16 = (void *)objc_msgSend(v16, "firstChild");
LABEL_22:
          objc_msgSend(v9, "addObject:", v16);
          goto LABEL_23;
        }
LABEL_24:
        v10 = (v10 + 1);
        objc_msgSend(v9, "sortUsingFunction:context:", compareLayoutReadingOrder, 0);
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v17 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v26 != v19)
                objc_enumerationMutation(v9);
              v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
              objc_msgSend(v21, "setChunkPosition:", v10);
              v10 = -[CPPage setPositionsOf:from:](self, "setPositionsOf:from:", v21, (v10 + 1));
            }
            v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v18);
        }
        objc_msgSend(v9, "removeAllObjects");
      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (!v24)
      {
LABEL_33:

        return;
      }
    }
  }

}

- (id)textLinesOnPage
{
  id result;

  result = self->textLinesOnPage;
  if (!result)
  {
    self->textLinesOnPage = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    -[CPObject descendantsOfClass:to:](self, "descendantsOfClass:to:", objc_opt_class(), self->textLinesOnPage);
    return self->textLinesOnPage;
  }
  return result;
}

- (id)columnsOnPage
{
  return self->columnsOnPage;
}

- (void)addColumns:(id)a3
{
  NSMutableArray *columnsOnPage;

  columnsOnPage = self->columnsOnPage;
  if (!columnsOnPage)
  {
    columnsOnPage = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    self->columnsOnPage = columnsOnPage;
  }
  -[NSMutableArray addObjectsFromArray:](columnsOnPage, "addObjectsFromArray:", a3);
}

+ (void)sortByReadingOrder:(id)a3
{
  int v4;
  int v5;
  uint64_t v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(a3, "sortUsingSelector:", sel_compareChunkPosition_);
      v4 = objc_msgSend(a3, "count");
      if (v4)
      {
        v5 = v4;
        v6 = 0;
        do
        {
          +[CPPage sortByReadingOrder:](CPPage, "sortByReadingOrder:", objc_msgSend(a3, "childAtIndex:", v6));
          v6 = (v6 + 1);
        }
        while (v5 != (_DWORD)v6);
      }
    }
  }
}

- (CPPDFClipBuffer)clipBuffer
{
  return &self->pdfContext->var9;
}

- (id)hitTest
{
  id result;

  result = self->hitTest;
  if (!result)
  {
    result = -[CPHitTest initWithPage:]([CPHitTest alloc], "initWithPage:", self);
    self->hitTest = result;
  }
  return result;
}

- (BOOL)populatePDFLayout:(CGPDFLayout *)a3
{
  int *v5;
  char v6;
  CFTypeRef cf;
  CFTypeRef v9;
  unsigned int v10;

  v10 = 0;
  cf = 0;
  v9 = 0;
  v5 = (int *)CGPDFNodeMakeFromCPChunk(self, (uint64_t)a3, 0, (CFDictionaryRef *)&v9, (CFDictionaryRef *)&cf);
  if (v5)
    v6 = CGPDFNodePopulateFromCPChunk(v5, self, (uint64_t)a3, &v10, (CFDictionaryRef *)&v9, (CFDictionaryRef *)&cf);
  else
    v6 = 0;
  if (cf)
    CFRelease(cf);
  if (v9)
    CFRelease(v9);
  return v6;
}

- (CGPDFLayout)layout
{
  CGPDFLayout *result;
  _BOOL8 v4;
  uint64_t Instance;
  uint64_t v6;
  void *v7;
  BOOL v8;

  result = (CGPDFLayout *)self->_layout;
  if (!result)
  {
    v4 = CGPDFCountElementsInCPChunk(self);
    if (!CGPDFLayoutGetTypeID_id)
      CGPDFLayoutGetTypeID_id = _CFRuntimeRegisterClass();
    Instance = _CFRuntimeCreateInstance();
    if (!Instance)
      goto LABEL_11;
    v6 = Instance;
    *(_QWORD *)(Instance + 16) = 0;
    if (v4 < 1)
      v7 = 0;
    else
      v7 = malloc_type_malloc(24 * v4, 0x1020040EDCEB4C7uLL);
    *(_QWORD *)(v6 + 24) = v7;
    *(_QWORD *)(v6 + 32) = 0;
    *(_QWORD *)(v6 + 40) = v4;
    *(_QWORD *)(v6 + 48) = 0;
    *(_QWORD *)(v6 + 56) = 0;
    *(_QWORD *)(v6 + 64) = 0;
    *(_BYTE *)(v6 + 72) = 0;
    *(_QWORD *)(v6 + 80) = 0;
    *(_QWORD *)(v6 + 88) = 0;
    *(_DWORD *)(v6 + 96) = 0;
    *(_QWORD *)(v6 + 104) = 0;
    *(_QWORD *)(v6 + 112) = 0;
    pthread_mutex_init((pthread_mutex_t *)(v6 + 120), 0);
    self->_layout = (void *)v6;
    *(_QWORD *)(v6 + 16) = -[CPPage pdfPage](self, "pdfPage");
    v8 = -[CPPage populatePDFLayout:](self, "populatePDFLayout:", self->_layout);
    result = (CGPDFLayout *)self->_layout;
    if (!v8)
    {
      if (result)
        CFRelease(result);
LABEL_11:
      result = 0;
      self->_layout = 0;
    }
  }
  return result;
}

@end
