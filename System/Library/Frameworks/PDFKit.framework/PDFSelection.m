@implementation PDFSelection

- (PDFSelection)initWithDocument:(PDFDocument *)document
{
  PDFDocument *v4;
  PDFSelection *v5;
  PDFSelection *v6;
  NSMutableArray *v7;
  NSMutableArray *pageRanges;
  NSMutableArray *pages;
  uint64_t v10;
  NSUUID *pdfSelectionUUID;
  objc_super v13;

  v4 = document;
  v13.receiver = self;
  v13.super_class = (Class)PDFSelection;
  v5 = -[PDFSelection init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_document, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pageRanges = v6->_pageRanges;
    v6->_pageRanges = v7;

    v6->_forceBreaks = 0;
    pages = v6->_pages;
    v6->_cgSelections = 0;
    v6->_pages = 0;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    pdfSelectionUUID = v6->_pdfSelectionUUID;
    v6->_pdfSelectionUUID = (NSUUID *)v10;

  }
  return v6;
}

- (PDFSelection)initWithPage:(id)a3
{
  id v4;
  PDFSelection *v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *pageRanges;
  uint64_t v9;
  NSMutableArray *pages;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PDFSelection;
  v5 = -[PDFSelection init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_document, v6);

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pageRanges = v5->_pageRanges;
    v5->_pageRanges = v7;

    v5->_forceBreaks = 0;
    v5->_cgSelections = 0;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v4, 0);
    pages = v5->_pages;
    v5->_pages = (NSMutableArray *)v9;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id WeakRetained;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __CFArray *cgSelections;
  CFIndex Count;
  CFIndex v17;
  CFIndex j;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  v6 = (_QWORD *)objc_msgSend(v4, "initWithDocument:", WeakRetained);

  v7 = -[NSMutableArray count](self->_pageRanges, "count");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      -[NSMutableArray objectAtIndex:](self->_pageRanges, "objectAtIndex:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "range");
      v13 = v12;
      objc_msgSend(v10, "page");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSelectionRange:page:normalize:", v11, v13, v14, 0);

    }
  }
  cgSelections = self->_cgSelections;
  if (cgSelections)
  {
    Count = CFArrayGetCount(cgSelections);
    if (Count)
    {
      v17 = Count;
      for (j = 0; j != v17; ++j)
      {
        CFArrayGetValueAtIndex(self->_cgSelections, j);
        v19 = CGPDFSelectionCreateFromSelection();
        -[NSMutableArray objectAtIndex:](self->_pages, "objectAtIndex:", j);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addCGSelection:forPage:", v19, v20);
        CGPDFSelectionRelease();

      }
    }
  }
  -[PDFSelection color](self, "color");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColor:", v21);

  objc_msgSend(v6, "setForceBreaks:", -[PDFSelection forceBreaks](self, "forceBreaks"));
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v6[7];
  v6[7] = v22;

  return v6;
}

- (NSArray)pages
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;

  if (self->_pages)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", self->_pages);
  }
  else
  {
    v4 = -[NSMutableArray count](self->_pageRanges, "count");
    if (v4 < 1)
    {
      v3 = (void *)MEMORY[0x24BDBD1A8];
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndex:](self->_pageRanges, "objectAtIndex:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "page");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

      if (v4 != 1)
      {
        v8 = v4;
        for (i = 1; i != v8; ++i)
        {
          -[NSMutableArray objectAtIndex:](self->_pageRanges, "objectAtIndex:", i);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "page");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v5, "containsObject:", v11) & 1) == 0)
            objc_msgSend(v5, "addObject:", v11);

        }
      }
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return (NSArray *)v3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(UIColor *)color
{
  UIColor *v4;
  UIColor *v5;
  id v6;

  v4 = (UIColor *)-[UIColor copy](color, "copy");
  v5 = self->_color;
  self->_color = v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("PDFSelectionChangedColor"), self, 0);

}

- (NSString)string
{
  __CFArray *cgSelections;
  CFIndex Count;
  unint64_t v5;
  void *v6;
  CFIndex v7;
  uint64_t String;
  void *v9;

  cgSelections = self->_cgSelections;
  if (cgSelections && (Count = CFArrayGetCount(cgSelections)) != 0)
  {
    v5 = Count;
    v6 = 0;
    v7 = 0;
    do
    {
      if (!v6)
      {
        objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 16);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      CFArrayGetValueAtIndex(self->_cgSelections, v7);
      String = CGPDFSelectionCreateString();
      if (String)
      {
        v9 = (void *)String;
        objc_msgSend(v6, "appendString:", String);

      }
      if (++v7 < v5)
        objc_msgSend(v6, "appendString:", CFSTR("\n"));
    }
    while (v5 != v7);
  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (NSAttributedString)attributedString
{
  return (NSAttributedString *)-[PDFSelection attributedStringScaled:](self, "attributedStringScaled:", 1.0);
}

- (CGRect)boundsForPage:(PDFPage *)page
{
  PDFPage *v4;
  double y;
  double x;
  double height;
  double width;
  __CFArray *cgSelections;
  CFIndex Count;
  CFIndex v11;
  CFIndex i;
  PDFPage *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect result;
  CGRect v32;

  v4 = page;
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  cgSelections = self->_cgSelections;
  if (cgSelections)
  {
    Count = CFArrayGetCount(cgSelections);
    if (Count)
    {
      v11 = Count;
      for (i = 0; i != v11; ++i)
      {
        -[NSMutableArray objectAtIndex:](self->_pages, "objectAtIndex:", i);
        v13 = (PDFPage *)objc_claimAutoreleasedReturnValue();

        if (v13 == v4)
        {
          CFArrayGetValueAtIndex(self->_cgSelections, i);
          CGPDFSelectionGetBounds();
          v32.origin.x = v14;
          v32.origin.y = v15;
          v32.size.width = v16;
          v32.size.height = v17;
          v29.origin.x = x;
          v29.origin.y = y;
          v29.size.width = width;
          v29.size.height = height;
          v30 = CGRectUnion(v29, v32);
          x = v30.origin.x;
          y = v30.origin.y;
          width = v30.size.width;
          height = v30.size.height;
        }
      }
    }
  }
  v18 = PDFRectFromCGRect(x, y, width, height);
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = v18;
  v26 = v20;
  v27 = v22;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (BOOL)containsPoint:(CGPoint)a3 onPage:(id)a4
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;
  CGPoint v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  v18 = *MEMORY[0x24BDAC8D0];
  -[PDFSelection boundsArrayForPage:](self, "boundsArrayForPage:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "PDFKitPDFRectValue", (_QWORD)v13);
          v19.x = x;
          v19.y = y;
          if (PDFRectContainsPoint(v20, v19))
          {
            LOBYTE(v9) = 1;
            goto LABEL_14;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (CGRect)spanBoundsForPage:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  CGFloat height;
  double width;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGPoint v35;
  CGRect v36;
  CGRect result;

  y = a4.y;
  x = a4.x;
  v34 = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BDBF090];
  v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
  width = *(double *)(MEMORY[0x24BDBF090] + 16);
  height = *(double *)(MEMORY[0x24BDBF090] + 24);
  -[PDFSelection boundsArrayForPage:](self, "boundsArrayForPage:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && objc_msgSend(v10, "count"))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      v16 = 1.79769313e308;
LABEL_5:
      v25 = v6;
      v26 = v7;
      v27 = width;
      v28 = height;
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v17), "PDFKitPDFRectValue");
        v6 = v36.origin.x;
        v7 = v36.origin.y;
        width = v36.size.width;
        height = v36.size.height;
        v35.x = x;
        v35.y = y;
        if (PDFRectContainsPoint(v36, v35))
          break;
        v18 = x - PDFRectGetCenterPoint(v6, v7, width);
        PDFRectGetCenterPoint(v6, v7, width);
        v20 = sqrt((y - v19) * 1000.0 * ((y - v19) * 1000.0) + v18 * v18);
        if (v20 < v16)
        {
          v16 = v20;
          v27 = width;
          v28 = height;
          v25 = v6;
          v26 = v7;
        }
        if (v14 == ++v17)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          width = v27;
          height = v28;
          v6 = v25;
          v7 = v26;
          if (v14)
            goto LABEL_5;
          break;
        }
      }
    }

  }
  v21 = v6;
  v22 = v7;
  v23 = width;
  v24 = height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)firstSpanBoundsForPage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[PDFSelection boundsArrayForPage:](self, "boundsArrayForPage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "PDFKitPDFRectValue");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v7 = *MEMORY[0x24BDBF090];
    v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)lastSpanBoundsForPage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[PDFSelection boundsArrayForPage:](self, "boundsArrayForPage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "PDFKitPDFRectValue");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v7 = *MEMORY[0x24BDBF090];
    v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)pdfSelectionUUID
{
  return self->_pdfSelectionUUID;
}

- (NSUInteger)numberOfTextRangesOnPage:(PDFPage *)page
{
  PDFPage *v4;
  __CFArray *cgSelections;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  PDFPage *v9;
  NSUInteger NumberOfStringRanges;

  v4 = page;
  if (v4 && (cgSelections = self->_cgSelections) != 0 && (Count = CFArrayGetCount(cgSelections)) != 0)
  {
    v7 = Count;
    v8 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->_pages, "objectAtIndex:", v8);
      v9 = (PDFPage *)objc_claimAutoreleasedReturnValue();

      if (v9 == v4)
        break;
      if (v7 == ++v8)
        goto LABEL_7;
    }
    CFArrayGetValueAtIndex(self->_cgSelections, v8);
    NumberOfStringRanges = CGPDFSelectionGetNumberOfStringRanges();
  }
  else
  {
LABEL_7:
    NumberOfStringRanges = 0;
  }

  return NumberOfStringRanges;
}

- (NSRange)rangeAtIndex:(NSUInteger)index onPage:(PDFPage *)page
{
  PDFPage *v5;
  __CFArray *cgSelections;
  CFIndex Count;
  CFIndex v8;
  CFIndex v9;
  PDFPage *v10;
  NSUInteger v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t StringRange;
  NSUInteger v16;
  NSRange result;

  v5 = page;
  if (v5 && (cgSelections = self->_cgSelections) != 0 && (Count = CFArrayGetCount(cgSelections)) != 0)
  {
    v8 = Count;
    v9 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->_pages, "objectAtIndex:", v9);
      v10 = (PDFPage *)objc_claimAutoreleasedReturnValue();

      if (v10 == v5)
        break;
      if (v8 == ++v9)
        goto LABEL_7;
    }
    CFArrayGetValueAtIndex(self->_cgSelections, v9);
    StringRange = CGPDFSelectionGetStringRange();
    if (StringRange == -1)
      v11 = 0;
    else
      v11 = v16;
    if (StringRange == -1)
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v12 = StringRange;
  }
  else
  {
LABEL_7:
    v11 = 0;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v13 = v12;
  v14 = v11;
  result.length = v14;
  result.location = v13;
  return result;
}

- (NSArray)selectionsByLine
{
  id v3;
  id v4;
  CFIndex v5;
  const __CFArray *SelectionsByLine;
  const __CFArray *v7;
  CFIndex v8;
  CFIndex v9;
  CFIndex i;
  PDFSelection *v11;
  void *v12;
  PDFSelection *v13;
  const void *ValueAtIndex;
  void *v15;
  void *v16;
  CFIndex Count;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (!self->_cgSelections)
    goto LABEL_10;
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);

  Count = CFArrayGetCount(self->_cgSelections);
  if (!Count)
  {
LABEL_9:
    v3 = v4;
LABEL_10:
    v4 = v3;
    v16 = v4;
    goto LABEL_11;
  }
  v5 = 0;
  while (1)
  {
    CFArrayGetValueAtIndex(self->_cgSelections, v5);
    SelectionsByLine = (const __CFArray *)CGPDFSelectionCreateSelectionsByLine();
    if (!SelectionsByLine)
      break;
    v7 = SelectionsByLine;
    v8 = CFArrayGetCount(SelectionsByLine);
    if (v8)
    {
      v9 = v8;
      for (i = 0; i != v9; ++i)
      {
        v11 = [PDFSelection alloc];
        -[PDFSelection document](self, "document");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[PDFSelection initWithDocument:](v11, "initWithDocument:", v12);

        ValueAtIndex = CFArrayGetValueAtIndex(v7, i);
        -[NSMutableArray objectAtIndex:](self->_pages, "objectAtIndex:", v5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFSelection addCGSelection:forPage:](v13, "addCGSelection:forPage:", ValueAtIndex, v15);

        objc_msgSend(v4, "addObject:", v13);
      }
    }
    CFRelease(v7);
    if (++v5 == Count)
      goto LABEL_9;
  }
  v16 = (void *)MEMORY[0x24BDBD1A8];
LABEL_11:

  return (NSArray *)v16;
}

- (void)enumerateRectsAndTransformsForPage:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  __CFArray *cgSelections;
  CFIndex Count;
  uint64_t v10;
  void *v11;
  CFIndex i;
  uint64_t Page;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  cgSelections = self->_cgSelections;
  if (cgSelections)
  {
    Count = CFArrayGetCount(cgSelections);
    if (Count)
    {
      v10 = Count;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __62__PDFSelection_enumerateRectsAndTransformsForPage_usingBlock___block_invoke;
      v14[3] = &unk_24C25E148;
      v15 = v7;
      v11 = (void *)MEMORY[0x20BD1AEB4](v14);
      if (v10 >= 1)
      {
        for (i = 0; i != v10; ++i)
        {
          CFArrayGetValueAtIndex(self->_cgSelections, i);
          Page = CGPDFSelectionGetPage();
          if (Page == objc_msgSend(v6, "pageRef"))
            CGPDFSelectionEnumerateRectsAndTransforms();
        }
      }

    }
  }

}

uint64_t __62__PDFSelection_enumerateRectsAndTransformsForPage_usingBlock___block_invoke(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t (*v7)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t);
  __int128 v8;
  _OWORD v10[3];

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16);
  v8 = a2[1];
  v10[0] = *a2;
  v10[1] = v8;
  v10[2] = a2[2];
  return v7(v6, v10, a3, a4, a5, a6);
}

- (void)addSelection:(PDFSelection *)selection
{
  -[PDFSelection addSelectionCore:normalize:](self, "addSelectionCore:normalize:", selection, 1);
}

- (void)addSelections:(NSArray *)selections
{
  NSArray *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  NSArray *v11;

  v4 = selections;
  if (v4)
  {
    v11 = v4;
    v5 = -[NSArray count](v4, "count");
    if (v5 < 2)
    {
      v9 = v5 == 1;
      v4 = v11;
      if (!v9)
        goto LABEL_10;
      v7 = 0;
    }
    else
    {
      v6 = 0;
      v7 = v5 - 1;
      do
      {
        -[NSArray objectAtIndex:](v11, "objectAtIndex:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFSelection addSelectionCore:normalize:](self, "addSelectionCore:normalize:", v8, 0);

        ++v6;
      }
      while (v7 != v6);
    }
    -[NSArray objectAtIndex:](v11, "objectAtIndex:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFSelection addSelectionCore:normalize:](self, "addSelectionCore:normalize:", v10, 1);

    v4 = v11;
  }
LABEL_10:

}

- (void)extendSelectionAtEnd:(NSInteger)succeed
{
  void *v5;
  __CFArray *cgSelections;
  __CFArray *v7;
  CFIndex Count;
  uint64_t v9;
  __CFArray *v10;
  CFIndex v11;
  __CFArray *v12;
  CFIndex v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  __CFArray *v28;
  CFIndex v29;
  __CFArray *v30;
  CFIndex v31;
  unint64_t v32;
  __CFArray *v33;
  CFIndex v34;
  __CFArray *v35;
  CFIndex v36;
  __CFArray *v37;
  CFIndex v38;

  if (succeed)
  {
    -[PDFSelection document](self, "document");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      cgSelections = self->_cgSelections;
      if (cgSelections)
      {
        if (CFArrayGetCount(cgSelections))
        {
          v7 = self->_cgSelections;
          Count = CFArrayGetCount(v7);
          CFArrayGetValueAtIndex(v7, Count - 1);
          v9 = CGPDFSelectionExtendAtEnd();
          if (succeed < 0)
          {
            v10 = self->_cgSelections;
            v11 = CFArrayGetCount(v10);
            CFArrayGetValueAtIndex(v10, v11 - 1);
            if (CGPDFSelectionIsEmpty())
            {
              v12 = self->_cgSelections;
              v13 = CFArrayGetCount(v12);
              CFArrayRemoveValueAtIndex(v12, v13 - 1);
              -[NSMutableArray removeLastObject](self->_pages, "removeLastObject");
            }
          }
          if (-[NSMutableArray count](self->_pages, "count"))
          {
            if (succeed < 1 || (v14 = succeed - v9, succeed <= v9))
            {
              if (succeed < 0 && succeed < v9)
              {
                v28 = self->_cgSelections;
                v29 = CFArrayGetCount(v28);
                CFArrayGetValueAtIndex(v28, v29 - 1);
                if (CGPDFSelectionIsEmpty())
                {
                  v30 = self->_cgSelections;
                  v31 = CFArrayGetCount(v30);
                  CFArrayRemoveValueAtIndex(v30, v31 - 1);
                  -[NSMutableArray removeLastObject](self->_pages, "removeLastObject");
                }
                if (CFArrayGetCount(self->_cgSelections) >= 1)
                {
                  do
                  {
                    v32 = succeed - v9;
                    v33 = self->_cgSelections;
                    v34 = CFArrayGetCount(v33);
                    CFArrayGetValueAtIndex(v33, v34 - 1);
                    v9 = CGPDFSelectionExtendAtEnd();
                    v35 = self->_cgSelections;
                    v36 = CFArrayGetCount(v35);
                    CFArrayGetValueAtIndex(v35, v36 - 1);
                    if (CGPDFSelectionIsEmpty())
                    {
                      v37 = self->_cgSelections;
                      v38 = CFArrayGetCount(v37);
                      CFArrayRemoveValueAtIndex(v37, v38 - 1);
                      -[NSMutableArray removeLastObject](self->_pages, "removeLastObject");
                    }
                  }
                  while (v9 > v32 && CFArrayGetCount(self->_cgSelections) > 0);
                }
              }
            }
            else
            {
              -[PDFSelection document](self, "document");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray lastObject](self->_pages, "lastObject");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v15, "indexForPage:", v16);

              -[PDFSelection document](self, "document");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "pageCount");

              if (v17 + 1 < v19 && v14)
              {
                v20 = v17 + 2;
                do
                {
                  -[PDFSelection document](self, "document");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "pageAtIndex:", v20 - 1);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = objc_msgSend(v22, "numberOfCharacters");

                  if (v23)
                  {
                    if (v14 >= v23)
                      v24 = v14 - v23;
                    else
                      v24 = 0;
                    if (v14 <= v23)
                      v23 = v14;
                    -[PDFSelection document](self, "document");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "pageAtIndex:", v20 - 1);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "selectionForRange:", 0, v23);
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PDFSelection addSelectionCore:normalize:](self, "addSelectionCore:normalize:", v27, 1);

                    v14 = v24;
                  }
                  if (v20 >= v19)
                    break;
                  ++v20;
                }
                while (v14);
              }
            }
          }
        }
      }
    }
  }
}

- (void)extendSelectionAtStart:(NSInteger)precede
{
  void *v5;
  __CFArray *cgSelections;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  unint64_t v23;
  __CFArray *v24;
  CFIndex Count;

  if (precede)
  {
    -[PDFSelection document](self, "document");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      cgSelections = self->_cgSelections;
      if (cgSelections)
      {
        if (CFArrayGetCount(cgSelections))
        {
          CFArrayGetValueAtIndex(self->_cgSelections, 0);
          v7 = CGPDFSelectionExtendAtStart();
          v8 = v7;
          if (precede < 0)
          {
            CFArrayGetValueAtIndex(self->_cgSelections, 0);
            if (CGPDFSelectionIsEmpty())
            {
              CFArrayRemoveValueAtIndex(self->_cgSelections, 0);
              -[NSMutableArray removeObjectAtIndex:](self->_pages, "removeObjectAtIndex:", 0);
            }
            if (precede < v8)
            {
              CFArrayGetValueAtIndex(self->_cgSelections, 0);
              if (CGPDFSelectionIsEmpty())
              {
                CFArrayRemoveValueAtIndex(self->_cgSelections, 0);
                -[NSMutableArray removeObjectAtIndex:](self->_pages, "removeObjectAtIndex:", 0);
              }
              if (CFArrayGetCount(self->_cgSelections) >= 1)
              {
                do
                {
                  v23 = precede - v8;
                  v24 = self->_cgSelections;
                  Count = CFArrayGetCount(v24);
                  CFArrayGetValueAtIndex(v24, Count - 1);
                  v8 = CGPDFSelectionExtendAtStart();
                  CFArrayGetValueAtIndex(self->_cgSelections, 0);
                  if (CGPDFSelectionIsEmpty())
                  {
                    CFArrayRemoveValueAtIndex(self->_cgSelections, 0);
                    -[NSMutableArray removeObjectAtIndex:](self->_pages, "removeObjectAtIndex:", 0);
                  }
                }
                while (v8 > v23 && CFArrayGetCount(self->_cgSelections) > 0);
              }
            }
          }
          else
          {
            v9 = precede - v7;
            if (precede > v7)
            {
              -[PDFSelection document](self, "document");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray objectAtIndex:](self->_pages, "objectAtIndex:", 0);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v10, "indexForPage:", v11);

              if (v12)
              {
                v13 = v12 - 1;
                do
                {
                  -[PDFSelection document](self, "document");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "pageAtIndex:", v13);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  v16 = objc_msgSend(v15, "numberOfCharacters");

                  if (v16)
                  {
                    if (v16 >= v9)
                      v17 = v16 - v9;
                    else
                      v17 = 0;
                    if (v9 >= v16)
                      v18 = v9 - v16;
                    else
                      v18 = 0;
                    if (v9 < v16)
                      v16 = v9;
                    -[PDFSelection document](self, "document");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "pageAtIndex:", v13);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "selectionForRange:", v17, v16);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PDFSelection addSelectionCore:normalize:](self, "addSelectionCore:normalize:", v21, 1);

                    v9 = v18;
                  }
                  v22 = v13-- != 0;
                }
                while (v22 && (uint64_t)v9 > 0);
              }
            }
          }
        }
      }
    }
  }
}

- (void)extendSelectionForLineBoundaries
{
  __CFArray *cgSelections;
  int Count;
  id WeakRetained;
  id v6;
  CFIndex i;
  int NumberOfRectsAndTransforms;
  char v9;
  char v10;
  char v11;
  float64x2_t v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;

  cgSelections = self->_cgSelections;
  if (cgSelections)
  {
    Count = CFArrayGetCount(cgSelections);
    WeakRetained = objc_loadWeakRetained((id *)&self->_document);

    if (WeakRetained)
    {
      if (Count >= 1)
      {
        v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        for (i = 0; i != Count; ++i)
        {
          CFArrayGetValueAtIndex(self->_cgSelections, i);
          NumberOfRectsAndTransforms = CGPDFSelectionGetNumberOfRectsAndTransforms();
          if (NumberOfRectsAndTransforms >= 1)
          {
            v9 = 0;
            v10 = 1;
            do
            {
              v11 = v10;
              if ((v9 & 1) != 0 && NumberOfRectsAndTransforms == 1)
                break;
              CGPDFSelectionGetRectAndTransform();
              v12 = vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, 0.0 * 0.5 + 0.0), (float64x2_t)0, 0.0 * 0.5 + 0.0));
              v13 = PDFPointFromCGPoint(v12.f64[0], v12.f64[1]);
              v15 = v14;
              CGPDFSelectionGetClientProperty();
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "selectionForLineAtPoint:", v13, v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
                objc_msgSend(v6, "addObject:", v17);

              v10 = 0;
              v9 = 1;
            }
            while ((v11 & 1) != 0);
          }
        }
        -[PDFSelection addSelections:](self, "addSelections:", v6);

      }
    }
  }
}

- (void)drawForPage:(PDFPage *)page active:(BOOL)active
{
  -[PDFSelection drawForPage:withBox:active:](self, "drawForPage:withBox:active:", page, 1, active);
}

- (void)drawForPage:(PDFPage *)page withBox:(PDFDisplayBox)box active:(BOOL)active
{
  -[PDFSelection drawForPage:withBox:active:inContext:](self, "drawForPage:withBox:active:inContext:", page, box, active, 0);
}

- (void)dealloc
{
  __CFArray *cgSelections;
  objc_super v4;

  cgSelections = self->_cgSelections;
  if (cgSelections)
    CFRelease(cgSelections);
  v4.receiver = self;
  v4.super_class = (Class)PDFSelection;
  -[PDFSelection dealloc](&v4, sel_dealloc);
}

- (id)document
{
  return objc_loadWeakRetained((id *)&self->_document);
}

- (id)asDestination
{
  void *v3;
  void *v4;
  const __CFArray *SelectionsByLine;
  const __CFArray *v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  PDFDestination *v11;
  PDFDestination *v12;
  double MinX;
  double MidY;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  -[PDFSelection pages](self, "pages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    v4 = 0;
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_9;
  CFArrayGetValueAtIndex(self->_cgSelections, 0);
  SelectionsByLine = (const __CFArray *)CGPDFSelectionCreateSelectionsByLine();
  if (!SelectionsByLine)
    goto LABEL_9;
  v6 = SelectionsByLine;
  if (!CFArrayGetCount(SelectionsByLine))
    goto LABEL_9;
  CFArrayGetValueAtIndex(v6, 0);
  CGPDFSelectionGetBounds();
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  v11 = 0;
  if (!CGRectEqualToRect(v16, *MEMORY[0x24BDBF070]))
  {
    v12 = [PDFDestination alloc];
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    MinX = CGRectGetMinX(v17);
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    MidY = CGRectGetMidY(v18);
    v11 = -[PDFDestination initWithPage:atPoint:](v12, "initWithPage:atPoint:", v4, PDFPointMake(MinX, MidY));
  }
  CFRelease(v6);
LABEL_10:

  return v11;
}

- (BOOL)isEmpty
{
  __CFArray *cgSelections;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  int IsEmpty;
  BOOL v8;

  cgSelections = self->_cgSelections;
  if (cgSelections && (Count = CFArrayGetCount(cgSelections), v5 = Count - 1, Count >= 1))
  {
    v6 = 0;
    do
    {
      CFArrayGetValueAtIndex(self->_cgSelections, v6);
      IsEmpty = CGPDFSelectionIsEmpty();
      if (IsEmpty)
        v8 = v5 == v6;
      else
        v8 = 1;
      ++v6;
    }
    while (!v8);
  }
  else
  {
    LOBYTE(IsEmpty) = 1;
  }
  return IsEmpty;
}

- (BOOL)isEqualToSelection:(id)a3
{
  CFArrayRef *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  char v8;
  BOOL v9;

  v4 = (CFArrayRef *)a3;
  if (!v4)
    goto LABEL_9;
  Count = CFArrayGetCount(self->_cgSelections);
  if (CFArrayGetCount(v4[5]) != Count)
    goto LABEL_9;
  if (Count < 1)
  {
    v9 = 1;
    goto LABEL_10;
  }
  CFArrayGetValueAtIndex(self->_cgSelections, 0);
  CFArrayGetValueAtIndex(v4[5], 0);
  if (CGPDFSelectionEqualToSelection())
  {
    v6 = 1;
    do
    {
      v7 = v6;
      if (Count == v6)
        break;
      CFArrayGetValueAtIndex(self->_cgSelections, v6);
      CFArrayGetValueAtIndex(v4[5], v7);
      v8 = CGPDFSelectionEqualToSelection();
      v6 = v7 + 1;
    }
    while ((v8 & 1) != 0);
    v9 = v7 >= Count;
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
LABEL_10:

  return v9;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v4 = a3;
  v5 = v4;
  if (!v4
    || (objc_msgSend(v4, "document"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[PDFSelection document](self, "document"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v6 != v7))
  {
    v8 = 0;
LABEL_4:
    v9 = 0;
LABEL_5:
    v10 = 0;
    v11 = -1;
    goto LABEL_6;
  }
  -[PDFSelection pages](self, "pages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (!v13 || !objc_msgSend(v13, "count"))
    goto LABEL_4;
  objc_msgSend(v8, "objectAtIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v8 = 0;
    goto LABEL_5;
  }
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFSelection document](self, "document");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "indexForPage:", v9);

    objc_msgSend(v5, "document");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "indexForPage:", v10);

    v11 = -1;
    if (v18 != 0x7FFFFFFFFFFFFFFFLL && v16 >= v18)
    {
      if (v18 >= v16)
      {
        v19 = -[PDFSelection pdfKitIndexOfFirstCharacterOnPage:](self, "pdfKitIndexOfFirstCharacterOnPage:", v9);
        v20 = objc_msgSend(v5, "pdfKitIndexOfFirstCharacterOnPage:", v10);
        if (v19 >= v20)
          v11 = v20 < v19;
      }
      else
      {
        v11 = 1;
      }
    }
  }
  else
  {
    v10 = 0;
    v11 = -1;
  }
  v8 = v14;
LABEL_6:

  return v11;
}

- (id)boundsArrayForPage:(id)a3
{
  id v4;
  __CFArray *cgSelections;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  void *v9;
  id v10;
  uint64_t NumberOfRectsAndTransforms;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v17;
  CGAffineTransform v18;
  _BYTE v19[80];
  CGRect v20;

  v4 = a3;
  cgSelections = self->_cgSelections;
  if (cgSelections && (Count = CFArrayGetCount(cgSelections)) != 0)
  {
    v7 = Count;
    v8 = 0;
    v9 = 0;
    v17 = v4;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_pages, "objectAtIndex:", v8);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v10 == v4)
      {
        memset(v19, 0, sizeof(v19));
        CFArrayGetValueAtIndex(self->_cgSelections, v8);
        NumberOfRectsAndTransforms = CGPDFSelectionGetNumberOfRectsAndTransforms();
        if (NumberOfRectsAndTransforms >= 1)
        {
          v12 = NumberOfRectsAndTransforms;
          for (i = 0; i != v12; ++i)
          {
            if (!v9)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
            }
            CGPDFSelectionGetRectAndTransform();
            v14 = (void *)MEMORY[0x24BDD1968];
            v18 = *(CGAffineTransform *)&v19[32];
            v20 = CGRectApplyAffineTransform(*(CGRect *)v19, &v18);
            objc_msgSend(v14, "PDFKitValueWithPDFRect:", PDFRectFromCGRect(v20.origin.x, v20.origin.y, v20.size.width, v20.size.height));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v15);

          }
        }
        v4 = v17;
      }
      ++v8;
    }
    while (v8 != v7);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)addCGSelection:(CGPDFSelection *)a3 forPage:(id)a4
{
  id v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *pages;
  id v10;

  v6 = a4;
  v7 = v6;
  if (a3)
  {
    if ((v10 = v6, self->_cgSelections) && self->_pages
      || (self->_cgSelections = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]),
          v8 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3),
          pages = self->_pages,
          self->_pages = v8,
          pages,
          v7 = v10,
          self->_cgSelections))
    {
      if (self->_pages)
      {
        CGPDFSelectionSetClientProperty();
        CFArrayAppendValue(self->_cgSelections, a3);
        -[NSMutableArray addObject:](self->_pages, "addObject:", v10);
        v7 = v10;
      }
    }
  }

}

- (__CFArray)cgSelections
{
  return self->_cgSelections;
}

- (id)cgSelectionPages
{
  return self->_pages;
}

- (CGPDFSelection)cgSelectionForPage:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  CFIndex v7;
  id v8;
  CGPDFSelection *ValueAtIndex;

  v4 = a3;
  if (v4
    && self->_cgSelections
    && ((v5 = -[NSMutableArray count](self->_pages, "count"), CFArrayGetCount(self->_cgSelections) == v5)
      ? (v6 = v5 == 0)
      : (v6 = 1),
        !v6))
  {
    v7 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->_pages, "objectAtIndex:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8 == v4)
        break;
      if (v5 == ++v7)
        goto LABEL_10;
    }
    ValueAtIndex = (CGPDFSelection *)CFArrayGetValueAtIndex(self->_cgSelections, v7);
  }
  else
  {
LABEL_10:
    ValueAtIndex = 0;
  }

  return ValueAtIndex;
}

- (void)addSelectionNoNormalize:(id)a3
{
  -[PDFSelection addSelectionCore:normalize:](self, "addSelectionCore:normalize:", a3, 0);
}

- (void)addSelectionCore:(id)a3 normalize:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFArray *v10;
  NSMutableArray *v11;
  NSMutableArray *pages;
  CFIndex Count;
  void *v14;
  uint64_t v15;
  CFIndex i;
  const void *v17;
  NSMutableArray *v18;
  void *v19;
  id v20;

  v4 = a4;
  v20 = a3;
  if (!v20)
    goto LABEL_5;
  -[PDFSelection document](self, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_5;
  -[PDFSelection document](self, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("addSelection: selection document mismatch"));
    goto LABEL_5;
  }
  v9 = objc_msgSend(v20, "cgSelections");
  if (!v9)
    goto LABEL_18;
  v10 = (const __CFArray *)v9;
  if (!self->_cgSelections)
    self->_cgSelections = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  if (!self->_pages)
  {
    v11 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
    pages = self->_pages;
    self->_pages = v11;

  }
  Count = CFArrayGetCount(v10);
  objc_msgSend(v20, "cgSelectionPages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (Count == v15)
  {
    if (Count)
    {
      for (i = 0; i != Count; ++i)
      {
        CFArrayGetValueAtIndex(v10, i);
        v17 = (const void *)CGPDFSelectionCreateFromSelection();
        if (v17)
          CFArrayAppendValue(self->_cgSelections, v17);
        CGPDFSelectionRelease();
      }
    }
    v18 = self->_pages;
    objc_msgSend(v20, "cgSelectionPages");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](v18, "addObjectsFromArray:", v19);

LABEL_18:
    if (v4)
      -[PDFSelection normalize](self, "normalize");
  }
LABEL_5:

}

- (void)addSelectionRange:(_NSRange)a3 page:(id)a4 normalize:(BOOL)a5
{
  _BOOL4 v5;
  NSUInteger length;
  NSUInteger location;
  void *v9;
  PDFPageRange *v10;
  id v11;

  v5 = a5;
  length = a3.length;
  location = a3.location;
  v11 = a4;
  -[PDFSelection document](self, "document");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (v9)
  {
    if (length)
    {
      v10 = -[PDFPageRange initWithPage:range:]([PDFPageRange alloc], "initWithPage:range:", v11, location, length);
      -[NSMutableArray addObject:](self->_pageRanges, "addObject:", v10);
      if (v5)
        -[PDFSelection normalize](self, "normalize");
    }
  }

}

- (CGPoint)firstCharCenter
{
  double MidX;
  double v3;
  double v4;
  double v5;
  double v6;
  CGPoint result;
  CGRect v8;
  CGRect v9;

  if (CFArrayGetValueAtIndex(self->_cgSelections, 0))
  {
    CGPDFSelectionGetRectAndTransform();
    v8.origin = 0u;
    v8.size = 0u;
    MidX = CGRectGetMidX(v8);
    v9.origin = 0u;
    v9.size = 0u;
    v3 = CGRectGetMidY(v9) * 0.0 + 0.0 * MidX + 0.0;
    v4 = v3;
  }
  else
  {
    v3 = *MEMORY[0x24BDBEFB0];
    v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  v5 = PDFPointFromCGPoint(v3, v4);
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)leftMostCharCenter
{
  double MinX;
  double v3;
  double v4;
  double v5;
  double v6;
  CGPoint result;
  CGRect v8;
  CGRect v9;

  if (CFArrayGetValueAtIndex(self->_cgSelections, 0))
  {
    CGPDFSelectionGetRectAndTransform();
    v8.origin = 0u;
    v8.size = 0u;
    MinX = CGRectGetMinX(v8);
    v9.origin = 0u;
    v9.size = 0u;
    v3 = CGRectGetMidY(v9) * 0.0 + 0.0 * MinX + 0.0;
    v4 = v3;
  }
  else
  {
    v3 = *MEMORY[0x24BDBEFB0];
    v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  v5 = PDFPointFromCGPoint(v3, v4);
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)rightMostCharCenter
{
  CFIndex Count;
  double MaxX;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;
  CGRect v10;
  CGRect v11;

  Count = CFArrayGetCount(self->_cgSelections);
  if (CFArrayGetValueAtIndex(self->_cgSelections, Count - 1))
  {
    CGPDFSelectionGetNumberOfRectsAndTransforms();
    CGPDFSelectionGetRectAndTransform();
    v10.origin = 0u;
    v10.size = 0u;
    MaxX = CGRectGetMaxX(v10);
    v11.origin = 0u;
    v11.size = 0u;
    v5 = CGRectGetMidY(v11) * 0.0 + 0.0 * MaxX + 0.0;
    v6 = v5;
  }
  else
  {
    v5 = *MEMORY[0x24BDBEFB0];
    v6 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  v7 = PDFPointFromCGPoint(v5, v6);
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)firstPage
{
  void *v3;

  if (-[PDFSelection isEmpty](self, "isEmpty"))
  {
    v3 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_pages, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)lastPage
{
  void *v3;

  if (-[PDFSelection isEmpty](self, "isEmpty"))
  {
    v3 = 0;
  }
  else
  {
    -[NSMutableArray lastObject](self->_pages, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (unint64_t)indexOfFirstCharacterOnPage:(id)a3
{
  if (a3)
    return -[PDFSelection previewRangeAtIndex:onPage:](self, "previewRangeAtIndex:onPage:", 0, a3);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)indexOfLastCharacterOnPage:(id)a3
{
  unint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
  {
    v5 = a3;
    v6 = -[PDFSelection previewRangeAtIndex:onPage:](self, "previewRangeAtIndex:onPage:", -[PDFSelection numberOfTextRangesOnPage:](self, "numberOfTextRangesOnPage:", v5) - 1, v5);
    v8 = v7;

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      return 0x7FFFFFFFFFFFFFFFLL;
    else
      return v8 + v6 - 1;
  }
  return v3;
}

- (unint64_t)pdfKitIndexOfFirstCharacterOnPage:(id)a3
{
  if (a3)
    return -[PDFSelection rangeAtIndex:onPage:](self, "rangeAtIndex:onPage:", 0, a3);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)pdfKitIndexOfLastCharacterOnPage:(id)a3
{
  unint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
  {
    v5 = a3;
    v6 = -[PDFSelection rangeAtIndex:onPage:](self, "rangeAtIndex:onPage:", -[PDFSelection numberOfTextRangesOnPage:](self, "numberOfTextRangesOnPage:", v5) - 1, v5);
    v8 = v7;

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      return 0x7FFFFFFFFFFFFFFFLL;
    else
      return v8 + v6 - 1;
  }
  return v3;
}

- (id)createAttributedStringForCGSelection:(CGPDFSelection *)a3 scaled:(double)a4
{
  void *v5;
  int v6;
  void *AttributedString;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  CFStringRef String;
  const __CFString *v13;
  CFIndex v14;
  uint64_t v15;
  const void **v16;
  CFDictionaryRef Attributes;
  const __CFDictionary *v18;
  void *v19;
  const __CFData *Value;
  const __CFData *v21;
  BOOL v22;
  const __CFData *v23;
  double v24;
  void *v25;
  const void *v26;
  void *v27;
  const __CFData *v28;
  double v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  UInt8 v34[8];
  UInt8 buffer[8];
  CFRange effectiveRange;
  _QWORD v37[4];
  id v38;
  double v39;
  CFRange v40;
  CFRange v41;
  CFRange v42;

  -[PDFSelection document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSimpleSelectionEnabled");
  AttributedString = (void *)CGPDFSelectionCreateAttributedString();
  v8 = AttributedString;
  if (v6)
  {
    v9 = (void *)objc_msgSend(AttributedString, "mutableCopy");
    v10 = objc_msgSend(v9, "length");
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __60__PDFSelection_createAttributedStringForCGSelection_scaled___block_invoke;
    v37[3] = &unk_24C25E170;
    v39 = a4;
    v11 = v9;
    v38 = v11;
    objc_msgSend(v11, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v37);

    goto LABEL_26;
  }
  if (!AttributedString)
  {
LABEL_25:
    v11 = 0;
    goto LABEL_26;
  }
  String = CFAttributedStringGetString((CFAttributedStringRef)AttributedString);
  if (!String)
  {
    CFRelease(v8);
    goto LABEL_25;
  }
  v13 = String;
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", String);
  if (CFStringGetLength(v13) >= 1)
  {
    v14 = 0;
    v32 = *MEMORY[0x24BDF65F8];
    v33 = *MEMORY[0x24BDF6600];
    v15 = *MEMORY[0x24BDF65D8];
    v16 = (const void **)MEMORY[0x24BE1FA40];
    do
    {
      effectiveRange.location = 0;
      effectiveRange.length = 0;
      Attributes = CFAttributedStringGetAttributes((CFAttributedStringRef)v8, v14, &effectiveRange);
      if (Attributes)
      {
        v18 = Attributes;
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
        Value = (const __CFData *)CFDictionaryGetValue(v18, (const void *)*MEMORY[0x24BE1FA50]);
        v21 = (const __CFData *)CFDictionaryGetValue(v18, (const void *)*MEMORY[0x24BE1FA58]);
        if (Value)
          v22 = v21 == 0;
        else
          v22 = 1;
        if (!v22)
        {
          v23 = v21;
          *(double *)v34 = 0.0;
          *(double *)buffer = 0.0;
          v40.location = 0;
          v40.length = 8;
          CFDataGetBytes(Value, v40, buffer);
          v41.location = 0;
          v41.length = 8;
          CFDataGetBytes(v23, v41, v34);
          v24 = *(double *)v34 * a4;
          *(float *)&v24 = *(double *)v34 * a4;
          +[PDFPage fontWithPDFFont:size:](PDFPage, "fontWithPDFFont:size:", *(_QWORD *)buffer, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            objc_msgSend(v19, "setObject:forKey:", v25, v32);

        }
        v26 = CFDictionaryGetValue(v18, (const void *)*MEMORY[0x24BE1FA48]);
        if (v26)
        {
          objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
            objc_msgSend(v19, "setObject:forKey:", v27, v33);

        }
        v28 = (const __CFData *)CFDictionaryGetValue(v18, *v16);
        if (v28)
        {
          *(double *)buffer = 0.0;
          v42.location = 0;
          v42.length = 8;
          CFDataGetBytes(v28, v42, buffer);
          HIDWORD(v29) = *(_DWORD *)&buffer[4];
          *(float *)&v29 = *(double *)buffer;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKey:", v30, v15);

        }
        objc_msgSend(v11, "setAttributes:range:", v19, effectiveRange.location, effectiveRange.length, v32);

      }
      v14 = effectiveRange.length + effectiveRange.location;
    }
    while (v14 < CFStringGetLength(v13));
  }
  CFRelease(v8);
LABEL_26:

  return v11;
}

void __60__PDFSelection_createAttributedStringForCGSelection_scaled___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = (void *)objc_msgSend(v14, "mutableCopy");
  objc_msgSend(v14, "valueForKey:", *MEMORY[0x24BDC4C28]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "pointSize");
    objc_msgSend(v9, "fontWithSize:", v10 * *(double *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v11, *MEMORY[0x24BDF65F8]);

  }
  v12 = objc_msgSend(v14, "valueForKey:", *MEMORY[0x24BDBF4E8]);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v13, *MEMORY[0x24BDF6600]);

  }
  objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v7, a3, a4);

}

- (id)attributedStringScaled:(double)a3
{
  void *v5;
  CFIndex Count;
  unint64_t v7;
  CFIndex v8;
  void *v9;
  void *v10;

  if (self->_cgSelections)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR("\n"));
    Count = CFArrayGetCount(self->_cgSelections);
    if (Count)
    {
      v7 = Count;
      v8 = 0;
      v9 = 0;
      do
      {
        -[PDFSelection createAttributedStringForCGSelection:scaled:](self, "createAttributedStringForCGSelection:scaled:", CFArrayGetValueAtIndex(self->_cgSelections, v8), a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          if (!v9)
            v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", &stru_24C25F170);
          objc_msgSend(v9, "appendAttributedString:", v10);
          if (++v8 < v7 && -[PDFSelection forceBreaks](self, "forceBreaks"))
            objc_msgSend(v9, "appendAttributedString:", v5);
        }
        else
        {
          ++v8;
        }

      }
      while (v8 != v7);
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
    v5 = 0;
  }

  return v9;
}

- (id)html
{
  CFIndex Count;
  CFIndex v4;
  CFIndex i;
  void *v6;

  if (self->_cgSelections)
  {
    if (!CGPDFArchiveCreate())
    {
      v6 = 0;
      return v6;
    }
    Count = CFArrayGetCount(self->_cgSelections);
    if (Count >= 1)
    {
      v4 = Count;
      for (i = 0; i != v4; ++i)
      {
        CFArrayGetValueAtIndex(self->_cgSelections, i);
        CGPDFArchiveAddSelection();
      }
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", CGPDFArchiveGetHTML());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  CGPDFArchiveRelease();
  return v6;
}

- (id)webArchive
{
  CFIndex Count;
  CFIndex v4;
  CFIndex i;
  void *v6;

  if (self->_cgSelections)
  {
    if (!CGPDFArchiveCreate())
    {
      v6 = 0;
      return v6;
    }
    Count = CFArrayGetCount(self->_cgSelections);
    if (Count >= 1)
    {
      v4 = Count;
      for (i = 0; i != v4; ++i)
      {
        CFArrayGetValueAtIndex(self->_cgSelections, i);
        CGPDFArchiveAddSelection();
      }
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", CGPDFArchiveGetWebArchiveData());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  CGPDFArchiveRelease();
  return v6;
}

- (id)rtfdData
{
  return 0;
}

+ (id)defaultActiveColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.698, 0.843, 1.0, 0.5);
}

+ (id)defaultInactiveColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.698, 0.843, 1.0, 0.5);
}

- (BOOL)forceBreaks
{
  return self->_forceBreaks;
}

- (void)setForceBreaks:(BOOL)a3
{
  self->_forceBreaks = a3;
}

- (void)drawForPage:(id)a3 withBox:(int)a4 active:(BOOL)a5 inContext:(CGContext *)a6
{
  id v10;
  __CFArray *cgSelections;
  CFIndex Count;
  uint64_t v13;
  void *v14;
  id v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MinY;
  CGFloat v27;
  CFIndex i;
  uint64_t Page;
  uint64_t NumberOfRectsAndTransforms;
  uint64_t v31;
  uint64_t j;
  CGFloat rect;
  double rect_8;
  CGFloat rect_16;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v10 = a3;
  if (a4 <= 4)
  {
    cgSelections = self->_cgSelections;
    if (cgSelections)
    {
      Count = CFArrayGetCount(cgSelections);
      if (a6)
      {
        v13 = Count;
        if (Count)
        {
          -[PDFSelection color](self, "color");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            if (a5)
              +[PDFSelection defaultActiveColor](PDFSelection, "defaultActiveColor");
            else
              +[PDFSelection defaultInactiveColor](PDFSelection, "defaultInactiveColor");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v15 = objc_retainAutorelease(v14);
          CGContextSetFillColorWithColor(a6, (CGColorRef)objc_msgSend(v15, "CGColor"));
          CGContextSaveGState(a6);
          rect = PDFRectToCGRect(objc_msgSend(v10, "boundsForBox:", 0));
          v17 = v16;
          v19 = v18;
          rect_16 = v20;
          v36.origin.x = PDFRectToCGRect(objc_msgSend(v10, "boundsForBox:", a4));
          x = v36.origin.x;
          y = v36.origin.y;
          width = v36.size.width;
          height = v36.size.height;
          MinX = CGRectGetMinX(v36);
          v37.origin.x = rect;
          v37.origin.y = v17;
          v37.size.width = v19;
          v37.size.height = rect_16;
          rect_8 = MinX - CGRectGetMinX(v37);
          v38.origin.x = x;
          v38.origin.y = y;
          v38.size.width = width;
          v38.size.height = height;
          MinY = CGRectGetMinY(v38);
          v39.origin.x = rect;
          v39.origin.y = v17;
          v39.size.width = v19;
          v39.size.height = rect_16;
          v27 = CGRectGetMinY(v39);
          CGContextTranslateCTM(a6, -rect_8, -(MinY - v27));
          CGContextSetCompositeOperation();
          if (v13 >= 1)
          {
            for (i = 0; i != v13; ++i)
            {
              CFArrayGetValueAtIndex(self->_cgSelections, i);
              Page = CGPDFSelectionGetPage();
              if (Page == objc_msgSend(v10, "pageRef"))
              {
                CGContextBeginPath(a6);
                NumberOfRectsAndTransforms = CGPDFSelectionGetNumberOfRectsAndTransforms();
                if (NumberOfRectsAndTransforms >= 1)
                {
                  v31 = NumberOfRectsAndTransforms;
                  for (j = 0; j != v31; ++j)
                  {
                    CGPDFSelectionGetRectAndTransform();
                    CGContextMoveToPoint(a6, 0.0 * 0.0 + 0.0 * 0.0 + 0.0, 0.0 * 0.0 + 0.0 * 0.0 + 0.0);
                    CGContextAddLineToPoint(a6, (0.0 + 0.0) * 0.0 + 0.0 * 0.0 + 0.0, (0.0 + 0.0) * 0.0 + 0.0 * 0.0 + 0.0);
                    CGContextAddLineToPoint(a6, (0.0 + 0.0) * 0.0 + 0.0 * (0.0 + 0.0) + 0.0, (0.0 + 0.0) * 0.0 + 0.0 * (0.0 + 0.0) + 0.0);
                    CGContextAddLineToPoint(a6, 0.0 * 0.0 + 0.0 * (0.0 + 0.0) + 0.0, 0.0 * 0.0 + 0.0 * (0.0 + 0.0) + 0.0);
                    CGContextAddLineToPoint(a6, 0.0 * 0.0 + 0.0 * 0.0 + 0.0, 0.0 * 0.0 + 0.0 * 0.0 + 0.0);
                  }
                }
                CGContextFillPath(a6);
              }
            }
          }
          CGContextRestoreGState(a6);

        }
      }
    }
  }

}

- (void)normalize
{
  uint64_t v3;
  unint64_t v4;
  CFIndex v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  CFIndex i;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t j;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  unint64_t v36;

  if (self->_cgSelections)
  {
    v3 = -[NSMutableArray count](self->_pages, "count");
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = 0;
      do
      {
        v7 = v6;
        -[NSMutableArray objectAtIndex:](self->_pages, "objectAtIndex:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = v5 + 1;
        if (v5 + 1 < v4)
        {
          v9 = v5 + 1;
          do
          {
            -[NSMutableArray objectAtIndex:](self->_pages, "objectAtIndex:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            if (v10 == v6)
            {
              CFArrayGetValueAtIndex(self->_cgSelections, v5);
              CFArrayGetValueAtIndex(self->_cgSelections, v9);
              CGPDFSelectionAddSelection();
              CFArrayRemoveValueAtIndex(self->_cgSelections, v9);
              -[NSMutableArray removeObjectAtIndex:](self->_pages, "removeObjectAtIndex:", v9);
              --v4;
            }
            else
            {
              ++v9;
            }
          }
          while (v9 < v4);
        }
        ++v5;
      }
      while (v8 < v4);
      -[__CFArray sortUsingFunction:context:](self->_cgSelections, "sortUsingFunction:context:", _sortCGSelections, 0);
      -[NSMutableArray removeAllObjects](self->_pages, "removeAllObjects");
      if (v4)
      {
        for (i = 0; i != v4; ++i)
        {
          CFArrayGetValueAtIndex(self->_cgSelections, i);
          CGPDFSelectionGetClientProperty();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            -[NSMutableArray addObject:](self->_pages, "addObject:", v12);
          else
            NSLog(CFSTR("[PDFSelection normalize] - no client property"));

        }
      }

    }
  }
  if ((unint64_t)-[NSMutableArray count](self->_pageRanges, "count") < 2)
  {

    return;
  }
  -[NSMutableArray sortUsingFunction:context:](self->_pageRanges, "sortUsingFunction:context:", _sortPageRanges, 0);
  -[PDFSelection pages](self, "pages");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v34, "count");
  if (!v33)
    goto LABEL_39;
  v13 = 0;
  do
  {
    v35 = v13;
    objc_msgSend(v34, "objectAtIndex:", v33);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_pageRanges, "objectAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "page");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 != v14)
      {
        v18 = v15 + 1;
        goto LABEL_37;
      }
      -[NSMutableArray objectAtIndex:](self->_pageRanges, "objectAtIndex:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "range");
      v22 = v21;

      v18 = v15 + 1;
      if (v15 + 1 < -[NSMutableArray count](self->_pageRanges, "count"))
      {
        v36 = v22;
        v23 = v20 + v22;
        for (j = v15 + 1; j < -[NSMutableArray count](self->_pageRanges, "count"); ++j)
        {
          -[NSMutableArray objectAtIndex:](self->_pageRanges, "objectAtIndex:", j);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "page");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26 == v14)
          {
            -[NSMutableArray objectAtIndex:](self->_pageRanges, "objectAtIndex:", j);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "range");
            v30 = v29;

            if (v28 == v20)
            {
              if (v30 > v36)
                continue;
            }
            else
            {
              if (v28 <= v20 || v28 > v23)
                continue;
              if (v28 + v30 > v23)
              {
                v31 = v28 + v30 - v20;
                -[NSMutableArray objectAtIndex:](self->_pageRanges, "objectAtIndex:", v15);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "setRange:", v20, v31);

              }
            }
            -[NSMutableArray removeObjectAtIndex:](self->_pageRanges, "removeObjectAtIndex:", j);
          }
        }
      }
LABEL_37:
      v15 = v18;
    }
    while (v18 < -[NSMutableArray count](self->_pageRanges, "count"));

    v13 = v35 + 1;
  }
  while (v35 + 1 != v33);
LABEL_39:

}

- (BOOL)isStandaloneGraphic
{
  CFIndex Count;
  unint64_t v4;
  CFIndex v5;
  BOOL v6;

  Count = CFArrayGetCount(self->_cgSelections);
  if (!Count)
    return 0;
  v4 = Count;
  CFArrayGetValueAtIndex(self->_cgSelections, 0);
  CGPDFSelectionCreateFromSelection();
  if (CGPDFSelectionIsStandaloneGraphic())
  {
    v5 = 1;
    while (1)
    {
      CGPDFSelectionRelease();
      if (v4 == v5)
        return 1;
      CFArrayGetValueAtIndex(self->_cgSelections, v5);
      CGPDFSelectionCreateFromSelection();
      ++v5;
      if ((CGPDFSelectionIsStandaloneGraphic() & 1) == 0)
      {
        v6 = v5 - 1 >= v4;
        goto LABEL_9;
      }
    }
  }
  else
  {
    v6 = 0;
LABEL_9:
    CGPDFSelectionRelease();
  }
  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;

  if (-[PDFSelection isEmpty](self, "isEmpty") || !self->_cgSelections)
  {
    v7 = CFSTR("<empty selection>");
  }
  else
  {
    -[PDFSelection string](self, "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v3, "length") >= 0x19)
    {
      v4 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v3, "substringWithRange:", 0, 24);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@..."), v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v6;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Page count=%ld, \"%@\"), CFArrayGetCount(self->_cgSelections), v3);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (_NSRange)previewRangeAtIndex:(unint64_t)a3 onPage:(id)a4
{
  id v5;
  __CFArray *cgSelections;
  CFIndex Count;
  CFIndex v8;
  CFIndex v9;
  id v10;
  NSUInteger v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t TextRange;
  NSUInteger v16;
  _NSRange result;

  v5 = a4;
  if (v5 && (cgSelections = self->_cgSelections) != 0 && (Count = CFArrayGetCount(cgSelections)) != 0)
  {
    v8 = Count;
    v9 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->_pages, "objectAtIndex:", v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v10 == v5)
        break;
      if (v8 == ++v9)
        goto LABEL_7;
    }
    CFArrayGetValueAtIndex(self->_cgSelections, v9);
    TextRange = CGPDFSelectionGetTextRange();
    if (TextRange == -1)
      v11 = 0;
    else
      v11 = v16;
    if (TextRange == -1)
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v12 = TextRange;
  }
  else
  {
LABEL_7:
    v11 = 0;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v13 = v12;
  v14 = v11;
  result.length = v14;
  result.location = v13;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdfSelectionUUID, 0);
  objc_storeStrong((id *)&self->_pages, 0);
  objc_storeStrong((id *)&self->_pageRanges, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_destroyWeak((id *)&self->_document);
}

@end
