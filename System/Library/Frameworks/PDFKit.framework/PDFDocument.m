@implementation PDFDocument

- (void)_commonInit
{
  int16x8_t v3;
  CGPDFDocument *document;
  CGPDFAccessPermissions AccessPermissions;
  _BOOL4 v6;
  int v7;
  NSString *ownerPassword;
  NSString *userPassword;
  NSDictionary *attributes;
  PDFOutline *outline;
  OS_dispatch_queue *textExtractionQueue;
  PDFForm *formData;
  NSArray *findStrings;
  PDFSelection *findInstance;
  NSMutableArray *v16;
  NSMutableArray *findResults;
  NSIndexSet *v18;
  NSIndexSet *initialBookmarkedPageIndices;
  NSMutableIndexSet *v20;
  NSMutableIndexSet *bookmarkedPages;
  uint64_t v22;
  NSMutableArray *v23;
  NSMutableArray *pages;
  NSMutableDictionary *v25;
  NSMutableDictionary *pageIndices;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  NSMutableDictionary *v30;
  void *v31;
  void *v32;
  NSOrderedSet *v33;
  NSOrderedSet *pagesOrderedSet;
  NSMutableDictionary *v35;
  NSMutableDictionary *pageDictionaryIndices;
  NSMutableIndexSet *v37;
  NSMutableIndexSet *preloadingPageIndexes;
  int64_t v39;
  NSArray *documentCatalogMetadata;
  NSString *xmpNameSpace;
  NSString *xmpPrefix;
  NSString *xmpRootPath;
  id v44;
  PDFRenderingProperties *v45;
  PDFRenderingProperties *renderingProperties;
  OS_dispatch_queue *asyncSearchQueue;
  OS_dispatch_queue *formFillingQueue;
  NSArray *accessibilityPageElements;
  int minorVersion[2];

  self->_pageCount = CGPDFDocumentGetNumberOfPages(self->_document);
  document = self->_document;
  if (document)
  {
    self->_isEncrypted = CGPDFDocumentIsEncrypted(document);
    self->_isUnlocked = CGPDFDocumentIsUnlocked(self->_document);
    AccessPermissions = CGPDFDocumentGetAccessPermissions(self->_document);
    self->_accessPermissions = AccessPermissions;
    self->_allowsPrinting = (AccessPermissions & 3) != 0;
    self->_allowsCopying = (AccessPermissions & 0x10) != 0;
    v3.i64[0] = *(_QWORD *)&vshl_u16((uint16x4_t)(*(_QWORD *)&vdup_n_s16(AccessPermissions) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFAFFFBFFFDFFFELL) & 0xFF01FF01FF01FF01;
    v6 = (AccessPermissions >> 7) & 1;
    document = self->_document;
  }
  else
  {
    *(_WORD *)&self->_isEncrypted = 256;
    *(_WORD *)&self->_allowsPrinting = 257;
    self->_accessPermissions = 255;
    v3.i64[0] = 0x1000100010001;
    LOBYTE(v6) = 1;
  }
  *(_DWORD *)&self->_allowsDocumentChanges = vmovn_s16(v3).u32[0];
  self->_allowsFormFieldEntry = v6;
  *(_QWORD *)minorVersion = 0;
  CGPDFDocumentGetVersion(document, &minorVersion[1], minorVersion);
  v7 = minorVersion[0];
  self->_majorVersion = minorVersion[1];
  self->_minorVersion = v7;
  ownerPassword = self->_ownerPassword;
  self->_ownerPassword = 0;

  userPassword = self->_userPassword;
  self->_userPassword = 0;

  attributes = self->_attributes;
  self->_attributes = 0;

  outline = self->_outline;
  self->_outline = 0;

  textExtractionQueue = self->_textExtractionQueue;
  self->_textExtractionQueue = 0;

  formData = self->_formData;
  self->_formData = 0;

  self->_formDataLoaded = 0;
  self->_finding = 0;
  self->_findModel = 0;
  findStrings = self->_findStrings;
  self->_findStrings = 0;

  findInstance = self->_findInstance;
  self->_findInstance = 0;

  self->_findOptions = 0;
  self->_findPageIndex = 0;
  *(_OWORD *)&self->_findCharIndex = xmmword_209DC0800;
  self->_lastFindCharIndex = -1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
  v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  findResults = self->_findResults;
  self->_findResults = v16;

  *(_WORD *)&self->_documentChanged = 0;
  self->_documentRedactionCount = 0;
  *(unint64_t *)((char *)&self->_documentRedactionCount + 5) = 0;
  v18 = (NSIndexSet *)objc_alloc_init(MEMORY[0x24BDD15E0]);
  initialBookmarkedPageIndices = self->_initialBookmarkedPageIndices;
  self->_initialBookmarkedPageIndices = v18;

  v20 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
  bookmarkedPages = self->_bookmarkedPages;
  self->_bookmarkedPages = v20;

  -[PDFDocument setDelegate:](self, "setDelegate:", 0);
  v22 = +[PDFDocument instanceMethodForSelector:](PDFDocument, "instanceMethodForSelector:", sel_pageAtIndex_);
  self->_subclassOverridesPageAtIndex = v22 != -[PDFDocument methodForSelector:](self, "methodForSelector:", sel_pageAtIndex_);
  v23 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", self->_pageCount);
  pages = self->_pages;
  self->_pages = v23;

  v25 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", self->_pageCount);
  pageIndices = self->_pageIndices;
  self->_pageIndices = v25;

  if (self->_pageCount)
  {
    v27 = 0;
    do
    {
      v28 = v27 + 1;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v27 + 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_pages, "addObject:", v29);
      v30 = self->_pageIndices;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v27);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v30, "setObject:forKey:", v31, v32);

      v27 = v28;
    }
    while (self->_pageCount > v28);
  }
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", self->_pages);
  v33 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
  pagesOrderedSet = self->_pagesOrderedSet;
  self->_pagesOrderedSet = v33;

  v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  pageDictionaryIndices = self->_pageDictionaryIndices;
  self->_pageDictionaryIndices = v35;

  v37 = (NSMutableIndexSet *)objc_opt_new();
  preloadingPageIndexes = self->_preloadingPageIndexes;
  self->_preloadingPageIndexes = v37;

  if (self->_isEncrypted)
  {
    if (!self->_isUnlocked)
    {
      self->_permission = 0;
      goto LABEL_13;
    }
    v39 = 1;
  }
  else
  {
    v39 = 2;
  }
  self->_permission = v39;
LABEL_13:
  documentCatalogMetadata = self->_documentCatalogMetadata;
  self->_documentCatalogMetadata = 0;

  xmpNameSpace = self->_xmpNameSpace;
  self->_xmpNameSpace = 0;

  xmpPrefix = self->_xmpPrefix;
  self->_xmpPrefix = 0;

  xmpRootPath = self->_xmpRootPath;
  self->_xmpRootPath = 0;

  if (!-[PDFDocument isLinearized](self, "isLinearized")
    || !-[PDFDocument hasHighLatencyDataProvider](self, "hasHighLatencyDataProvider"))
  {
    v44 = -[PDFDocument _documentCatalogMetadataForRootPath:withKeys:](self, "_documentCatalogMetadataForRootPath:withKeys:", CFSTR("apple-preview:Bookmarks"), &unk_24C27DBC0);
  }
  self->_limitedSearch = 0;
  v45 = objc_alloc_init(PDFRenderingProperties);
  renderingProperties = self->_renderingProperties;
  self->_renderingProperties = v45;

  asyncSearchQueue = self->_asyncSearchQueue;
  self->_asyncSearchQueue = 0;

  formFillingQueue = self->_formFillingQueue;
  self->_formFillingQueue = 0;

  self->_dataDetectorsEnabled = 1;
  accessibilityPageElements = self->_accessibilityPageElements;
  self->_accessibilityPageElements = 0;

}

- (void)setupAKDocumentAdaptorIfNecessaryWithView:(id)a3
{
  void *v4;
  PDFAKDocumentAdaptor *v5;
  PDFAKPageOverlayViewProvider *v6;
  void *v7;
  PDFAKPageOverlayViewProvider *v8;
  PDFAKPageOverlayViewProvider *akPageOverlayViewProvider;
  id WeakRetained;
  NSMutableArray *v11;
  NSUInteger v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  if (self->_akDocumentAdaptor)
  {
    -[PDFDocument akDocumentAdaptor](self, "akDocumentAdaptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPdfView:", v15);

    objc_msgSend(v15, "setPageOverlayViewProvider:", self->_akPageOverlayViewProvider);
  }
  else
  {
    v5 = -[PDFAKDocumentAdaptor initWithPDFDocument:andView:]([PDFAKDocumentAdaptor alloc], "initWithPDFDocument:andView:", self, v15);
    objc_storeStrong((id *)&self->_akDocumentAdaptor, v5);
    v6 = [PDFAKPageOverlayViewProvider alloc];
    -[PDFAKDocumentAdaptor akMainController](v5, "akMainController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PDFAKPageOverlayViewProvider initWithPDFDocument:pdfView:andAKController:](v6, "initWithPDFDocument:pdfView:andAKController:", self, v15, v7);
    akPageOverlayViewProvider = self->_akPageOverlayViewProvider;
    self->_akPageOverlayViewProvider = v8;

    objc_msgSend(v15, "setPageOverlayViewProvider:", self->_akPageOverlayViewProvider);
    WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegateForDeferredSetup);
    if (WeakRetained)
    {
      -[PDFAKDocumentAdaptor setPDFAKControllerDelegate:](v5, "setPDFAKControllerDelegate:", WeakRetained);
      objc_storeWeak((id *)&self->_pdfAKControllerDelegateForDeferredSetup, 0);
    }
    v11 = self->_pages;
    objc_sync_enter(v11);
    v12 = -[PDFDocument pageCount](self, "pageCount");
    if (v12)
    {
      v13 = 0;
      do
      {
        -[PDFDocument _rawPageAtIndex:](self, "_rawPageAtIndex:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "setupAKPageAdaptorIfNecessary");
          -[PDFAKDocumentAdaptor pdfDocument:didInsertPage:atIndex:](v5, "pdfDocument:didInsertPage:atIndex:", self, v14, v13);
        }

        ++v13;
      }
      while (v12 != v13);
    }
    objc_sync_exit(v11);

  }
}

- (BOOL)_isCommonlyMappedToNothing:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("­")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("­")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("᠆")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("᠋")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("᠌")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("᠍")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("​")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("‌")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("‍")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("⁠")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("︀")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("︁")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("︂")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("︃")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("︄")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("︅")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("︆")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("︇")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("︈")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("︉")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("︊")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("︋")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("︌")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("︍")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("︎")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("️")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("﻿"));
  }

  return v4;
}

- (BOOL)_isNonAsciiSpace:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR(" ")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR(" ")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR(" ")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR(" ")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR(" ")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR(" ")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR(" ")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR(" ")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR(" ")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR(" ")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR(" ")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR(" ")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("​")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR(" ")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR(" ")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("　"));
  }

  return v4;
}

- (id)_SASLSanitize:(id)a3
{
  id v4;
  unint64_t v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = 0;
    v6 = &stru_24C25F170;
    do
    {
      v7 = objc_msgSend(v4, "rangeOfComposedCharacterSequenceAtIndex:", v5);
      if (!v8)
        break;
      objc_msgSend(v4, "substringWithRange:", v7, v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!-[PDFDocument _isCommonlyMappedToNothing:](self, "_isCommonlyMappedToNothing:", v9))
      {
        if (-[PDFDocument _isNonAsciiSpace:](self, "_isNonAsciiSpace:", v9))
        {
          v10 = v6;
          v11 = CFSTR(" ");
        }
        else
        {
          v10 = v6;
          v11 = v9;
        }
        -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", v11);
        v12 = objc_claimAutoreleasedReturnValue();

        v6 = (__CFString *)v12;
      }

      ++v5;
    }
    while (objc_msgSend(v4, "length") > v5);
  }
  else
  {
    v6 = &stru_24C25F170;
  }
  -[__CFString decomposedStringWithCompatibilityMapping](v6, "decomposedStringWithCompatibilityMapping");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_getNearestOutline:(id)a3 forDestination:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  id v23;
  void *v25;
  id v26;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v7;
  if (!v6)
  {
    v23 = v7;
    goto LABEL_15;
  }
  v26 = v6;
  objc_msgSend(v6, "page");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "document");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v9;
  v11 = objc_msgSend(v10, "indexForPage:", v9);

  v12 = objc_msgSend(v8, "numberOfChildren");
  v13 = v8;
  if (!v12)
    goto LABEL_14;
  v14 = v12;
  v15 = 0;
  v13 = v8;
  while (1)
  {
    objc_msgSend(v8, "childAtIndex:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      break;
LABEL_10:
    if (v14 == ++v15)
      goto LABEL_14;
  }
  v17 = v16;
  objc_msgSend(v16, "destination");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v19 = v17;
    goto LABEL_9;
  }
  v19 = v18;
  objc_msgSend(v18, "page");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "document");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "indexForPage:", v20);

  if (v22 <= v11)
  {

    v13 = v17;
LABEL_9:

    goto LABEL_10;
  }

LABEL_14:
  v23 = v13;

  v6 = v26;
LABEL_15:

  return v23;
}

- (id)_dataFromXMP:(__CFData *)a3 withRootPath:(id)a4 keys:(id)a5
{
  __CFString *v8;
  id v9;
  CGImageMetadataRef v10;
  const CGImageMetadata *v11;
  id v12;
  void *v13;
  NSMutableIndexSet *v14;
  id v15;
  NSIndexSet *v16;
  NSIndexSet *initialBookmarkedPageIndices;
  NSMutableIndexSet *bookmarkedPages;
  NSMutableIndexSet *v19;
  void *v20;
  id v21;
  _QWORD block[4];
  id v24;
  PDFDocument *v25;
  NSMutableIndexSet *v26;
  id v27;
  const CGImageMetadata *v28;

  v8 = (__CFString *)a4;
  v9 = a5;
  v10 = CGImageMetadataCreateFromXMPData(a3);
  if (v10)
  {
    v11 = v10;
    v12 = objc_alloc_init(MEMORY[0x24BDD1698]);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__PDFDocument__dataFromXMP_withRootPath_keys___block_invoke;
    block[3] = &unk_24C25DAD8;
    v28 = v11;
    v24 = v9;
    v25 = self;
    v14 = (NSMutableIndexSet *)v12;
    v26 = v14;
    v15 = v13;
    v27 = v15;
    CGImageMetadataEnumerateTagsUsingBlock(v11, v8, 0, block);
    v16 = (NSIndexSet *)-[NSMutableIndexSet copy](v14, "copy");
    initialBookmarkedPageIndices = self->_initialBookmarkedPageIndices;
    self->_initialBookmarkedPageIndices = v16;

    bookmarkedPages = self->_bookmarkedPages;
    self->_bookmarkedPages = v14;
    v19 = v14;

    CFRelease(v11);
    v20 = v27;
    v21 = v15;

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

uint64_t __46__PDFDocument__dataFromXMP_withRootPath_keys___block_invoke(uint64_t a1, uint64_t a2, CGImageMetadataTag *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __CFString *v11;
  CFStringRef v12;
  __CFString *v13;
  unsigned int v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(__CFString **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = CGImageMetadataCopyStringValueWithPath(*(CGImageMetadataRef *)(a1 + 64), a3, v11);
        if (v12)
        {
          v13 = (__CFString *)v12;
          objc_msgSend(v5, "setObject:forKey:", v12, v11, (_QWORD)v17);
          if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("PageIndex")))
          {
            v14 = -[__CFString integerValue](v13, "integerValue");
            if ((v14 & 0x80000000) == 0)
            {
              v15 = v14;
              if (v14 < (unint64_t)objc_msgSend(*(id *)(a1 + 40), "pageCount"))
                objc_msgSend(*(id *)(a1 + 48), "addIndex:", v15);
            }
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);
  return 1;
}

- (id)renderingProperties
{
  return self->_renderingProperties;
}

- (void)setRenderingProperties:(id)a3
{
  objc_storeStrong((id *)&self->_renderingProperties, a3);
}

+ (id)_getDocumentID:(CGPDFDocument *)a3
{
  void *v4;
  CGPDFArray *ID;
  size_t v6;
  char v7;
  char v8;
  size_t Length;
  const unsigned __int8 *BytePtr;
  BOOL v11;
  void *v12;
  CGPDFStringRef value;

  if (a3)
  {
    v4 = (void *)objc_opt_new();
    ID = CGPDFDocumentGetID(a3);
    if (CGPDFArrayGetCount(ID) == 2)
    {
      v6 = 0;
      v7 = 1;
      do
      {
        v8 = v7;
        value = 0;
        if (CGPDFArrayGetString(ID, v6, &value))
        {
          Length = CGPDFStringGetLength(value);
          BytePtr = CGPDFStringGetBytePtr(value);
          if (Length)
            v11 = BytePtr == 0;
          else
            v11 = 1;
          if (!v11)
          {
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", BytePtr, Length);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v12);

          }
        }
        v7 = 0;
        v6 = 1;
      }
      while ((v8 & 1) != 0);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_addEncryptionFromOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t EncryptMetadata;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSString *ownerPassword;
  NSString *userPassword;
  void *v21;
  NSString *v22;
  void **v23;
  uint64_t RawPermissions;
  void *v25;

  v4 = a3;
  if (!-[PDFDocument isEncrypted](self, "isEncrypted"))
    goto LABEL_6;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBF4B0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBF478]),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(v4, "objectForKey:", CFSTR("PDFDocumentUserPasswordOption")),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_6:
    v6 = v4;
    goto LABEL_7;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("PDFDocumentOwnerPasswordOption"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (CGPDFDocumentGetEncryptionVersion() > 4)
  {
    ownerPassword = self->_ownerPassword;
    if (ownerPassword)
      objc_msgSend(v9, "setObject:forKey:", ownerPassword, CFSTR("PDFDocumentOwnerPasswordOption"));
    userPassword = self->_userPassword;
    if (userPassword)
    {
      objc_msgSend(v9, "setObject:forKey:", userPassword, CFSTR("PDFDocumentUserPasswordOption"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_accessPermissions);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v21, CFSTR("PDFDocumentAccessPermissionsOption"));

    }
    else
    {
      v22 = self->_ownerPassword;
      if (v22)
        objc_msgSend(v9, "setObject:forKey:", v22, CFSTR("PDFDocumentUserPasswordOption"));
    }
  }
  else
  {
    v10 = (void *)CGPDFDocumentCopyHashedOwnerPassword();
    v11 = (void *)CGPDFDocumentCopyHashedUserPassword();
    v12 = (void *)CGPDFDocumentCopyEncryptionKey();
    EncryptMetadata = CGPDFDocumentGetEncryptMetadata();
    if (v10 && v11 && v12)
    {
      v14 = EncryptMetadata;
      objc_msgSend((id)objc_opt_class(), "_getDocumentID:", self->_document);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count") == 2)
      {
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDBF408]);
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDBF438]);
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDBF440]);
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDBF448]);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BDBF410]);

        switch(CGPDFDocumentGetEncryptionVersion())
        {
          case 1:
            objc_msgSend(v9, "setObject:forKeyedSubscript:", *MEMORY[0x24BDBF430], *MEMORY[0x24BDBF418]);
            v17 = *MEMORY[0x24BDBF450];
            v18 = &unk_24C27D880;
            goto LABEL_27;
          case 2:
            objc_msgSend(v9, "setObject:forKeyedSubscript:", *MEMORY[0x24BDBF430], *MEMORY[0x24BDBF418]);
            v17 = *MEMORY[0x24BDBF450];
            v18 = &unk_24C27D898;
            goto LABEL_27;
          case 4:
            v23 = (void **)MEMORY[0x24BDBF420];
            goto LABEL_26;
          case 5:
            v23 = (void **)MEMORY[0x24BDBF428];
LABEL_26:
            v18 = *v23;
            v17 = *MEMORY[0x24BDBF418];
LABEL_27:
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, v17);
            RawPermissions = CGPDFDocumentGetRawPermissions();
            if ((_DWORD)RawPermissions)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", RawPermissions);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v25, *MEMORY[0x24BDBF458]);

            }
            break;
          default:

            v6 = 0;
            goto LABEL_32;
        }
      }

    }
  }
  v6 = v9;
LABEL_32:

LABEL_7:
  return v6;
}

- (id)_convertWriteOptions:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v3, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v40;
    v27 = (void *)*MEMORY[0x24BDBF490];
    v28 = (void *)*MEMORY[0x24BDBF498];
    v29 = (void *)*MEMORY[0x24BDBF3C0];
    v30 = (void *)*MEMORY[0x24BDBF4B0];
    v31 = (void *)*MEMORY[0x24BDBF478];
    v32 = (void *)*MEMORY[0x24BDBF468];
    v33 = (void *)*MEMORY[0x24BDBF4C0];
    v34 = (void *)*MEMORY[0x24BDBF4B8];
    v35 = (void *)*MEMORY[0x24BDBF4C8];
    v36 = (void *)*MEMORY[0x24BDBF3F0];
    v37 = (void *)*MEMORY[0x24BDBF4A0];
    v8 = (void *)*MEMORY[0x24BDBF3D8];
    v9 = (void *)*MEMORY[0x24BDBF4A8];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v11, v27);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", CFSTR("Title"));
        v14 = v9;
        if ((v13 & 1) == 0)
        {
          v15 = objc_msgSend(v11, "isEqual:", CFSTR("Author"), v9);
          v14 = v8;
          if ((v15 & 1) == 0)
          {
            v16 = objc_msgSend(v11, "isEqual:", CFSTR("Subject"), v8);
            v14 = v37;
            if ((v16 & 1) == 0)
            {
              v17 = objc_msgSend(v11, "isEqual:", CFSTR("Creator"), v37);
              v14 = v36;
              if ((v17 & 1) == 0)
              {
                v18 = objc_msgSend(v11, "isEqual:", CFSTR("Producer"), v36);
                v14 = v35;
                if ((v18 & 1) == 0)
                {
                  v19 = objc_msgSend(v11, "isEqual:", CFSTR("CreationDate"), v35);
                  v14 = v34;
                  if ((v19 & 1) == 0)
                  {
                    v20 = objc_msgSend(v11, "isEqual:", CFSTR("ModDate"), v34);
                    v14 = v33;
                    if ((v20 & 1) == 0)
                    {
                      v21 = objc_msgSend(v11, "isEqual:", CFSTR("Keywords"), v33);
                      v14 = v32;
                      if ((v21 & 1) == 0)
                      {
                        v22 = objc_msgSend(v11, "isEqual:", CFSTR("PDFDocumentOwnerPasswordOption"), v32);
                        v14 = v31;
                        if ((v22 & 1) == 0)
                        {
                          v23 = objc_msgSend(v11, "isEqual:", CFSTR("PDFDocumentUserPasswordOption"), v31);
                          v14 = v30;
                          if ((v23 & 1) == 0)
                          {
                            v24 = objc_msgSend(v11, "isEqual:", CFSTR("PDFDocumentAccessPermissionsOption"), v30);
                            v14 = v29;
                            if ((v24 & 1) == 0)
                            {
                              v25 = objc_msgSend(v11, "isEqual:", CFSTR("PDFDocumentSaveImagesAsJPEGOption"), v29);
                              v14 = v28;
                              if ((v25 & 1) == 0)
                              {
                                if (objc_msgSend(v11, "isEqual:", CFSTR("PDFDocumentOptimizeImagesForScreenOption"), v28))v14 = v27;
                                else
                                  v14 = v11;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        objc_msgSend(v4, "setObject:forKey:", v12, v14);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v6);
  }

  return v4;
}

- (BOOL)writeToConsumer:(CGDataConsumer *)a3 withOptions:(id)a4
{
  PDFAKDocumentAdaptor *akDocumentAdaptor;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  PDFDocument *v12;
  uint64_t v13;
  void *v14;
  CGContextRef v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  const void *v24;
  const void *v25;
  void *v26;
  uint64_t v27;
  NSIndexSet *initialBookmarkedPageIndices;
  const __CFData *v29;
  CGPDFDictionary *Catalog;
  void *v31;
  uint64_t v32;
  CFNumberRef v33;
  CGPDFDictionaryRef v34;
  CGPDFDictionary *Dictionary;
  CFNumberRef v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL8 v41;
  dispatch_semaphore_t v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  objc_class *v47;
  objc_class *v48;
  objc_class *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  void *v58;
  void *v59;
  void *v60;
  BOOL v61;
  const __CFDictionary *v62;
  __CFDictionary *MutableCopy;
  CFNumberRef v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _BOOL4 v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  BOOL v77;
  void *v78;
  id v79;
  void *key;
  char v81;
  uint64_t v82;
  uint64_t v83;
  const CGPath *path;
  PDFDocument *v85;
  __CFDictionary *theDict;
  void *v87;
  CGContext *context;
  uint64_t ObjectReference;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[4];
  char v95;
  _QWORD v96[4];
  NSObject *v97;
  _QWORD v98[5];
  CGPDFDictionaryRef value;
  CGPDFDictionaryRef *p_value;
  uint64_t v101;
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;
  CGPDFDictionaryRef v105;
  CGPDFDictionaryRef valuePtr;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  const __CFString *v112;
  void *v113;
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v79 = a4;
  if (!-[PDFDocument isLocked](self, "isLocked"))
  {
    akDocumentAdaptor = self->_akDocumentAdaptor;
    v85 = self;
    if (akDocumentAdaptor)
    {
      -[PDFAKDocumentAdaptor akMainController](akDocumentAdaptor, "akMainController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "commitEditing");

      self = v85;
    }
    -[PDFDocument _addEncryptionFromOptions:](self, "_addEncryptionFromOptions:", v79);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFDocument _convertWriteOptions:](v85, "_convertWriteOptions:", v76);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v78;
    if (-[PDFDocument canSaveWithAppendModeUsingOptions:](v85, "canSaveWithAppendModeUsingOptions:", v78))
    {
      if (-[PDFDocument _writeAppendMode:](v85, "_writeAppendMode:", a3))
      {
        v77 = 1;
LABEL_84:

        goto LABEL_85;
      }
      NSLog(CFSTR("Failed to execute append-mode write"));
      v8 = v78;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("PDFDocumentBurnInAnnotationsOption"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");
    v11 = (void *)objc_opt_new();
    v12 = v85;
    v13 = -[PDFDocument _createInfoDictionary](v85, "_createInfoDictionary");
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v11, "addEntriesFromDictionary:", v13);

    }
    objc_msgSend(v11, "addEntriesFromDictionary:", v78);
    v72 = v11;
    v15 = CGPDFContextCreate(a3, 0, (CFDictionaryRef)v11);
    v77 = v15 != 0;
    context = v15;
    if (v15)
    {
      v82 = -[PDFDocument pageCount](v85, "pageCount");
      if (v82)
      {
        for (i = 0; i != v82; ++i)
        {
          -[PDFDocument pageAtIndex:](v12, "pageAtIndex:", i);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "annotations");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            v109 = 0u;
            v110 = 0u;
            v107 = 0u;
            v108 = 0u;
            v19 = v18;
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v107, v114, 16);
            if (v20)
            {
              v21 = *(_QWORD *)v108;
              do
              {
                for (j = 0; j != v20; ++j)
                {
                  if (*(_QWORD *)v108 != v21)
                    objc_enumerationMutation(v19);
                  v23 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * j);
                  objc_msgSend(v23, "setDictionaryRef:", 0);
                  objc_msgSend(v23, "setShouldHideInteractiveBackgroundColor:", 1);
                }
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v107, v114, 16);
              }
              while (v20);
            }

          }
          v12 = v85;
        }
      }
      -[PDFDocument formData](v12, "formData");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (v73)
      {
        v24 = (const void *)objc_msgSend(v73, "createDictionaryRef");
        if (v24)
        {
          CGPDFContextAddCatalogEntry();
          CFRelease(v24);
        }
      }
      -[PDFDocument outlineRoot](v85, "outlineRoot");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      if (v75)
      {
        objc_msgSend(v75, "invalidateDictionaryRef");
        v25 = (const void *)objc_msgSend(v75, "createDictionaryRef");
        if (v25)
        {
          CGPDFContextAddCatalogEntry();
          CFRelease(v25);
        }
      }
      if (-[PDFDocument bookmarksChanged](v85, "bookmarksChanged")
        && -[PDFDocument allowsDocumentAssembly](v85, "allowsDocumentAssembly"))
      {
        -[PDFDocument updateBookmarksInPDFDocument](v85, "updateBookmarksInPDFDocument");
        -[PDFDocument bookmarkedPages](v85, "bookmarkedPages");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "copy");
        initialBookmarkedPageIndices = v85->_initialBookmarkedPageIndices;
        v85->_initialBookmarkedPageIndices = (NSIndexSet *)v27;

      }
      v29 = -[PDFDocument newXMPFromData:preserveExistingXMPMetadata:](v85, "newXMPFromData:preserveExistingXMPMetadata:", v85->_documentCatalogMetadata, 1);
      if (v29)
      {
        CGPDFContextAddDocumentMetadata(context, v29);
        CFRelease(v29);
      }
      Catalog = CGPDFDocumentGetCatalog(v85->_document);
      if (Catalog)
      {
        value = 0;
        CGPDFDictionaryGetDictionary(Catalog, "StructTreeRoot", &value);
        if (value)
        {
          *(double *)&valuePtr = 0.0;
          if (CGPDFDictionaryGetDictionary(value, "ParentTree", &valuePtr))
            CGPDFContextSetParentTree();
          v105 = 0;
          if (CGPDFDictionaryGetDictionary(value, "IDTree", &v105))
            CGPDFContextSetIDTree();
        }
      }
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "postNotificationName:object:", CFSTR("PDFDidBeginDocumentWrite"), v85);

      v71 = +[PDFPage isNativeRotationDrawingEnabledForThisThread](PDFPage, "isNativeRotationDrawingEnabledForThisThread");
      +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", 1);
      objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("PDFDocumentSaveTextFromOCROption"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      if (v74)
        v81 = objc_msgSend(v74, "BOOLValue");
      else
        v81 = 0;
      if (v82)
      {
        v32 = 0;
        key = (void *)*MEMORY[0x24BDBF480];
        do
        {
          v83 = v32;
          -[PDFDocument pageAtIndex:](v85, "pageAtIndex:");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          theDict = (__CFDictionary *)objc_msgSend(v87, "gcCreateBoxDictionary");
          *(double *)&valuePtr = 0.0;
          *(double *)&valuePtr = (double)objc_msgSend(v87, "rotation");
          v33 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
          if (v33)
          {
            CFDictionaryAddValue(theDict, CFSTR("Rotate"), v33);
            CFRelease(v33);
          }
          value = 0;
          p_value = &value;
          v101 = 0x3032000000;
          v102 = __Block_byref_object_copy__4;
          v103 = __Block_byref_object_dispose__4;
          v104 = 0;
          v98[0] = MEMORY[0x24BDAC760];
          v98[1] = 3221225472;
          v98[2] = __43__PDFDocument_writeToConsumer_withOptions___block_invoke;
          v98[3] = &unk_24C25DB00;
          v98[4] = &value;
          objc_msgSend(v87, "enumerateApplicationDataUsingBlock:", v98);
          v34 = p_value[5];
          if (v34)
            CFDictionaryAddValue(theDict, key, v34);
          Dictionary = CGPDFPageGetDictionary((CGPDFPageRef)objc_msgSend(v87, "pageRef"));
          v105 = 0;
          if (CGPDFDictionaryGetInteger(Dictionary, "StructParents", (CGPDFInteger *)&v105))
          {
            v36 = CFNumberCreate(0, kCFNumberLongType, &v105);
            CFDictionaryAddValue(theDict, CFSTR("StructParents"), v36);
            CFRelease(v36);
          }
          CGPDFContextBeginPage(context, theDict);
          path = (const CGPath *)objc_msgSend(v87, "createRedactionPath");
          CGPDFContextSetRedactionPath();
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)MEMORY[0x24BDBCE70];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v83);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "dictionaryWithObject:forKey:", v39, CFSTR("PDFDocumentPageIndex"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "postNotificationName:object:userInfo:", CFSTR("PDFDidBeginPageWrite"), v85, v40);

          v41 = +[PDFPage shouldHideAnnotationsForThisThread](PDFPage, "shouldHideAnnotationsForThisThread");
          +[PDFPage setShouldHideAnnotationsForThisThread:](PDFPage, "setShouldHideAnnotationsForThisThread:", 1);
          if ((v81 & 1) != 0 || objc_msgSend(v87, "requestedOCR"))
          {
            if ((objc_msgSend(v87, "isTextFromOCR") & 1) == 0
              && +[PDFPageEvaluator isPageCandidateForOCR:](PDFPageEvaluator, "isPageCandidateForOCR:", v87))
            {
              v42 = dispatch_semaphore_create(0);
              +[PDFPageAnalyzer sharedInstance](PDFPageAnalyzer, "sharedInstance");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v96[0] = MEMORY[0x24BDAC760];
              v96[1] = 3221225472;
              v96[2] = __43__PDFDocument_writeToConsumer_withOptions___block_invoke_2;
              v96[3] = &unk_24C25DB28;
              v44 = v42;
              v97 = v44;
              objc_msgSend(v43, "analyzePage:analysisTypes:completionQueue:completionBlock:", v87, 1, 0, v96);

              dispatch_semaphore_wait(v44, 0xFFFFFFFFFFFFFFFFLL);
            }
            v45 = 1;
          }
          else
          {
            v45 = 0;
          }
          objc_opt_self();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = (objc_class *)objc_opt_class();
          if (PDFSubclassOverridesSelector((objc_class *)v46, v47, sel_drawWithBox_toContext_))
          {

          }
          else
          {
            objc_opt_self();
            v48 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v49 = (objc_class *)objc_opt_class();
            v50 = PDFSubclassOverridesSelector(v48, v49, sel_drawWithBox_);

            if (!v50)
            {
              v112 = CFSTR("PDFPageDrawWithBoxOption_RenderExtraContentStream");
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v45);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v113 = v51;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "drawWithBox:inContext:withOptions:", 0, context, v52);

              goto LABEL_65;
            }
          }
          objc_msgSend(v87, "drawWithBox:toContext:", 0, context);
LABEL_65:
          +[PDFPage setShouldHideAnnotationsForThisThread:](PDFPage, "setShouldHideAnnotationsForThisThread:", v41);
          CGPDFContextSetRedactionPath();
          v94[0] = MEMORY[0x24BDAC760];
          v94[1] = 3221225472;
          v94[2] = __43__PDFDocument_writeToConsumer_withOptions___block_invoke_3;
          v94[3] = &__block_descriptor_33_e23_B16__0__PDFAnnotation_8l;
          v95 = v10;
          objc_msgSend(v87, "drawAnnotationsWithBox:inContext:passingTest:", 0, context, v94);
          CGPDFContextSetRedactionPath();
          objc_msgSend(v87, "annotations");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          v54 = v53;
          v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v90, v111, 16);
          if (v55)
          {
            v56 = *(_QWORD *)v91;
            do
            {
              for (k = 0; k != v55; ++k)
              {
                if (*(_QWORD *)v91 != v56)
                  objc_enumerationMutation(v54);
                if ((v10 & 1) == 0)
                {
                  v58 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * k);
                  if ((objc_msgSend(v58, "shouldBurnIn") & 1) == 0
                    && (objc_msgSend(v58, "intersectsWithRedactionPath") & 1) == 0)
                  {
                    objc_msgSend(v58, "valueForAnnotationKey:", CFSTR("/AAPL:SFF"));
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v59
                      || (objc_msgSend(v58, "contents"),
                          v60 = (void *)objc_claimAutoreleasedReturnValue(),
                          v61 = objc_msgSend(v60, "length") == 0,
                          v60,
                          v59,
                          !v61))
                    {
                      objc_msgSend(v58, "setShouldHideInteractiveBackgroundColor:", 1);
                      v62 = (const __CFDictionary *)objc_msgSend(v58, "dictionaryRef");
                      objc_msgSend(v58, "setShouldHideInteractiveBackgroundColor:", 0);
                      if (v62)
                      {
                        objc_msgSend(v58, "sourceDictionary");
                        CGPDFDictionaryGetObjectReference();
                        ObjectReference = 0;
                        objc_msgSend(v58, "sourceDictionary");
                        ObjectReference = CGPDFDictionaryGetObjectReference();
                        MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v62);
                        v64 = CFNumberCreate(0, kCFNumberLongType, &ObjectReference);
                        CFDictionaryAddValue(MutableCopy, CFSTR("ObjectNumber"), v64);
                        CFRelease(v64);
                        CGPDFContextAddAnnotation();
                        CFRelease(MutableCopy);
                      }
                    }
                  }
                }
              }
              v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v90, v111, 16);
            }
            while (v55);
          }

          CGPDFContextEndPage(context);
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = (void *)MEMORY[0x24BDBCE70];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v83);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "dictionaryWithObject:forKey:", v67, CFSTR("PDFDocumentPageIndex"));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "postNotificationName:object:userInfo:", CFSTR("PDFDidEndPageWrite"), v85, v68);

          CGPDFContextSetRedactionPath();
          CGPathRelease(path);
          if (theDict)
            CFRelease(theDict);

          _Block_object_dispose(&value, 8);
          v32 = v83 + 1;
        }
        while (v83 + 1 != v82);
      }
      +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", v71);
      CGPDFContextClose(context);
      CGContextRelease(context);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "postNotificationName:object:", CFSTR("PDFDidEndDocumentWrite"), v85);

    }
    else
    {
      v74 = v9;
    }

    v8 = v78;
    goto LABEL_84;
  }
  v77 = 0;
LABEL_85:

  return v77;
}

void __43__PDFDocument_writeToConsumer_withOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v6)
  {
    v7 = objc_opt_new();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v10);

}

intptr_t __43__PDFDocument_writeToConsumer_withOptions___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __43__PDFDocument_writeToConsumer_withOptions___block_invoke_3(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(a1 + 32))
    return 1;
  else
    return objc_msgSend(a2, "shouldBurnIn");
}

- (BOOL)canSaveWithAppendModeUsingOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  BOOL v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  if (GetDefaultsWriteUseAppendMode()
    && !-[PDFDocument isEncrypted](self, "isEncrypted")
    && -[PDFDocument allowsPrinting](self, "allowsPrinting"))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("PDFDocumentWriteOption_UseAppendMode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
      goto LABEL_16;
    if (!objc_msgSend(v5, "BOOLValue"))
      goto LABEL_16;
    objc_msgSend(v4, "objectForKey:", CFSTR("QuartzFilter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_16;
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBF4B0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBF478]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v12 != 0;

    }
    if (((v8, -[PDFDocument isEncrypted](self, "isEncrypted")) || !v9)
      && (!-[PDFDocument isEncrypted](self, "isEncrypted") || v9)
      && !self->_documentHasBurnInAnnotations)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("PDFDocumentBurnInAnnotationsOption"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "BOOLValue") & 1) != 0
        || self->_documentHasPageWithApplicationData
        || self->_documentRedactionCount
        || self->_pagesChanged.pagesRemoved
        || self->_pagesChanged.pagesExchanged
        || self->_pagesChanged.blankPagesAdded)
      {
        v10 = 0;
      }
      else
      {
        objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBF3E8]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14 && (objc_msgSend(v14, "BOOLValue") & 1) != 0)
        {
          v10 = 0;
        }
        else
        {
          objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBF3E0]);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16 && (objc_msgSend(v16, "BOOLValue") & 1) != 0)
          {
            v10 = 0;
          }
          else
          {
            objc_msgSend(v4, "objectForKey:", CFSTR("PDFDocumentSaveTextFromOCROption"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18;
            if (v18 && (objc_msgSend(v18, "BOOLValue") & 1) != 0)
            {
              v10 = 0;
            }
            else
            {
              -[PDFDocument formData](self, "formData");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = v20 == 0;

            }
          }

        }
      }

    }
    else
    {
LABEL_16:
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)canSaveWithTextFromOCR
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = self->_pages;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v6)
        objc_enumerationMutation(v3);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v7), "isTextFromOCR") & 1) != 0)
        goto LABEL_18;
      if (v5 == ++v7)
      {
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_pages;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
LABEL_11:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v9)
        objc_enumerationMutation(v3);
      if (+[PDFPageEvaluator isPageCandidateForOCR:](PDFPageEvaluator, "isPageCandidateForOCR:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (_QWORD)v12))
      {
        break;
      }
      if (v8 == ++v10)
      {
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
        if (v8)
          goto LABEL_11;
        goto LABEL_19;
      }
    }
LABEL_18:
    LOBYTE(v8) = 1;
  }
LABEL_19:

  return v8;
}

- (BOOL)isSimpleSelectionEnabled
{
  CGPDFDocument *document;

  document = self->_document;
  if (document)
    LOBYTE(document) = CGPDFDocumentIsSimpleSelectionEnabled();
  return (char)document;
}

- (BOOL)_writeAppendMode:(CGDataConsumer *)a3
{
  PDFDocument *v3;
  NSUInteger v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  BOOL v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  const void *v36;
  const void *v37;
  const void *v38;
  uint64_t v39;
  __CFArray *Mutable;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  uint64_t v47;
  const void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  uint64_t v80;
  const void *v81;
  void *v82;
  uint64_t v83;
  NSIndexSet *initialBookmarkedPageIndices;
  uint64_t v85;
  NSDictionary *appendedAttributes;
  char v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  BOOL v96;
  void *v97;
  _BOOL4 v99;
  _BOOL4 v100;
  const __CFAllocator *allocator;
  void *v102;
  NSUInteger v103;
  uint64_t v104;
  void *v105;
  id v106;
  CGPDFPage *page;
  PDFDocument *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  uint64_t v129;
  CGRect BoxRect;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;

  v3 = self;
  v129 = *MEMORY[0x24BDAC8D0];
  v4 = -[PDFDocument pageCount](self, "pageCount");
  v5 = (void *)objc_opt_new();
  v103 = v4;
  if (!v4)
  {
LABEL_5:
    v100 = +[PDFDocument pdfDocumentAppendModeActiveForThisThread](PDFDocument, "pdfDocumentAppendModeActiveForThisThread");
    +[PDFDocument setPDFDocumentAppendModeActiveForThisThread:](PDFDocument, "setPDFDocumentAppendModeActiveForThisThread:", 1);
    v99 = +[PDFPage isNativeRotationDrawingEnabledForThisThread](PDFPage, "isNativeRotationDrawingEnabledForThisThread");
    +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", 1);
    v106 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v102 = v5;
    if (!v103)
      goto LABEL_78;
    v10 = 0;
    allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v108 = v3;
    while (1)
    {
      -[PDFDocument pageAtIndex:](v3, "pageAtIndex:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "pageRef");
      objc_msgSend(v11, "rotation");
      page = (CGPDFPage *)v12;
      CGPDFPageSetRotationAngle();
      for (i = 0; i != 5; ++i)
      {
        v14 = PDFRectToCGRect(objc_msgSend(v11, "boundsForBox:", i));
        v16 = v15;
        v18 = v17;
        v20 = v19;
        BoxRect = CGPDFPageGetBoxRect(page, (CGPDFBox)i);
        if (v18 > 0.0 && v20 > 0.0)
        {
          v138 = BoxRect;
          v131.origin.x = v14;
          v131.origin.y = v16;
          v131.size.width = v18;
          v131.size.height = v20;
          if (!CGRectEqualToRect(v131, v138))
            CGPDFPageSetBoxRect();
        }
      }
      v104 = v10;
      v105 = v11;
      objc_msgSend(v5, "objectAtIndex:", v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = 0u;
      v122 = 0u;
      v123 = 0u;
      v124 = 0u;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v121, v128, 16);
      if (v22)
      {
        v23 = v22;
        v24 = 0;
        v25 = *(_QWORD *)v122;
        while (1)
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v122 != v25)
              objc_enumerationMutation(v21);
            v27 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * v26);
            objc_msgSend(v27, "annotation");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setShouldHideInteractiveBackgroundColor:", 1);
            if (!objc_msgSend(v27, "changeType"))
            {
              objc_msgSend(v28, "valueForAnnotationKey:", CFSTR("/AAPL:SFF"));
              v30 = objc_claimAutoreleasedReturnValue();
              if (v30)
              {
                v31 = (void *)v30;
                objc_msgSend(v28, "contents");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v32, "length");

                if (!v33)
                  goto LABEL_32;
              }
              goto LABEL_30;
            }
            if (objc_msgSend(v27, "changeType") == 1
              || objc_msgSend(v27, "changeType") == 4)
            {
              if (objc_msgSend(v28, "CGPDFAnnotation")
                || (objc_msgSend(v28, "valueForAnnotationKey:", CFSTR("/AAPL:SFF")),
                    v34 = (void *)objc_claimAutoreleasedReturnValue(),
                    v34,
                    !v34))
              {
                if (objc_msgSend(v27, "changeType") == 1)
                  objc_msgSend(v28, "setDictionaryRef:", 0);
                -[PDFDocument _sanitizeAnnotationDictionary:](v108, "_sanitizeAnnotationDictionary:", objc_msgSend(v28, "dictionaryRefExcludingParentOrPopup"));
                CGPDFPageSubstituteAnnotationDictionary();
                v29 = objc_msgSend(v27, "changeType") == 4;
                goto LABEL_25;
              }
LABEL_30:
              v35 = -[PDFDocument _createCGPDFAnnotationForAnnotation:](v108, "_createCGPDFAnnotationForAnnotation:", v28);
              if (v35)
              {
                v36 = (const void *)v35;
                CGPDFPageAddAnnotation();
                CFRelease(v36);
                v24 = 1;
              }
              goto LABEL_32;
            }
            if (objc_msgSend(v27, "changeType") == 2)
            {
              v37 = (const void *)objc_msgSend(v28, "CGPDFAnnotation");
              if (v37)
              {
                v38 = v37;
                CFRetain(v37);
                CGPDFPageRemoveAnnotation();
                objc_msgSend(v28, "setCGPDFAnnotation:", 0);
                CFRelease(v38);
              }
            }
            else if (objc_msgSend(v27, "changeType") == 3)
            {
              v29 = objc_msgSend(v28, "CGPDFAnnotation") != 0;
LABEL_25:
              v24 |= v29;
            }
LABEL_32:
            objc_msgSend(v28, "setShouldHideInteractiveBackgroundColor:", 0);

            ++v26;
          }
          while (v23 != v26);
          v39 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v121, v128, 16);
          v23 = v39;
          if (!v39)
          {
            v5 = v102;
            if ((v24 & 1) != 0)
            {
              Mutable = CFArrayCreateMutable(allocator, 0, MEMORY[0x24BDBD690]);
              objc_msgSend(v105, "annotations");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v117 = 0u;
              v118 = 0u;
              v119 = 0u;
              v120 = 0u;
              v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v117, v127, 16);
              if (v42)
              {
                v43 = v42;
                v44 = *(_QWORD *)v118;
                do
                {
                  for (j = 0; j != v43; ++j)
                  {
                    if (*(_QWORD *)v118 != v44)
                      objc_enumerationMutation(v41);
                    v46 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * j);
                    v47 = objc_msgSend(v46, "CGPDFAnnotation");
                    if (v47)
                    {
                      v48 = (const void *)v47;
                      if ((objc_msgSend(v46, "shouldBurnIn") & 1) == 0)
                        CFArrayAppendValue(Mutable, v48);
                    }
                  }
                  v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v117, v127, 16);
                }
                while (v43);
              }
              if (objc_msgSend(v105, "pageRef") && CFArrayGetCount(Mutable) >= 1)
                CGPDFPageSortAnnotations();
              CFRelease(Mutable);

            }
            break;
          }
        }
      }
      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v49 = v21;
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v113, v126, 16);
      if (!v50)
        goto LABEL_69;
      v51 = v50;
      v52 = *(_QWORD *)v114;
      do
      {
        for (k = 0; k != v51; ++k)
        {
          if (*(_QWORD *)v114 != v52)
            objc_enumerationMutation(v49);
          objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * k), "annotation");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v54, "CGPDFAnnotation"))
          {
            objc_msgSend(v54, "popup");
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            if (v55)
            {
              objc_msgSend(v54, "popup");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v54, "parent");
              v57 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v57)
                goto LABEL_67;
              objc_msgSend(v54, "parent");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v58 = objc_msgSend(v56, "CGPDFAnnotation");

            if (v58)
            {
              CGPDFAnnotationSetAnnotationForKey();
              objc_msgSend(v106, "addObject:", v54);
            }
          }
LABEL_67:

        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v113, v126, 16);
      }
      while (v51);
LABEL_69:

      objc_msgSend(v105, "akPageAdaptor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v59;
      if (v59)
      {
        objc_msgSend(v59, "akPageModelController");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "cropAnnotation");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v62;
        if (v62)
        {
          if (objc_msgSend(v62, "cropApplied"))
          {
            v132 = CGPDFPageGetBoxRect(page, kCGPDFCropBox);
            v133 = CGRectIntegral(v132);
            x = v133.origin.x;
            y = v133.origin.y;
            width = v133.size.width;
            height = v133.size.height;
            objc_msgSend(v63, "rectangle");
            v69 = v68;
            v71 = v70;
            v73 = v72;
            v75 = v74;
            v139 = CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
            v134.origin.x = v69;
            v134.origin.y = v71;
            v134.size.width = v73;
            v134.size.height = v75;
            v135 = CGRectIntersection(v134, v139);
            v136 = CGRectIntegral(v135);
            if (v136.size.width > 0.0)
            {
              v76 = v136.size.height;
              if (v136.size.height > 0.0)
              {
                v77 = v136.origin.x;
                v78 = v136.origin.y;
                v79 = v136.size.width;
                v137.origin.x = x;
                v137.origin.y = y;
                v137.size.width = width;
                v137.size.height = height;
                v140.origin.x = v77;
                v140.origin.y = v78;
                v140.size.width = v79;
                v140.size.height = v76;
                if (!CGRectEqualToRect(v137, v140))
                  CGPDFPageSetBoxRect();
              }
            }
          }
        }

      }
      objc_msgSend(v105, "clearAnnotationChanges");

      v10 = v104 + 1;
      v3 = v108;
      if (v104 + 1 == v103)
      {
LABEL_78:
        if (-[PDFDocument bookmarksChanged](v3, "bookmarksChanged")
          && -[PDFDocument allowsDocumentAssembly](v3, "allowsDocumentAssembly"))
        {
          -[PDFDocument updateBookmarksInPDFDocument](v3, "updateBookmarksInPDFDocument");
          v80 = -[PDFDocument newXMPFromData:preserveExistingXMPMetadata:](v3, "newXMPFromData:preserveExistingXMPMetadata:", v3->_documentCatalogMetadata, 1);
          if (v80)
          {
            v81 = (const void *)v80;
            CGPDFDocumentAppendMetadata();
            CFRelease(v81);
          }
          -[PDFDocument bookmarkedPages](v3, "bookmarkedPages");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = objc_msgSend(v82, "copy");
          initialBookmarkedPageIndices = v3->_initialBookmarkedPageIndices;
          v3->_initialBookmarkedPageIndices = (NSIndexSet *)v83;

        }
        if (v3->_attributes
          && (!v3->_appendedAttributes || !-[NSDictionary isEqualToDictionary:](v3->_attributes, "isEqualToDictionary:")))
        {
          CGPDFDocumentAppendDocumentInfo();
          v85 = -[NSDictionary copy](v3->_attributes, "copy");
          appendedAttributes = v3->_appendedAttributes;
          v3->_appendedAttributes = (NSDictionary *)v85;

        }
        +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", v99);
        +[PDFDocument setPDFDocumentAppendModeActiveForThisThread:](PDFDocument, "setPDFDocumentAppendModeActiveForThisThread:", v100);
        v87 = CGPDFDocumentCopyToConsumerWithChanges();
        v109 = 0u;
        v110 = 0u;
        v111 = 0u;
        v112 = 0u;
        v88 = v106;
        v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v109, v125, 16);
        if (!v89)
        {
LABEL_100:

          v5 = v102;
          goto LABEL_102;
        }
        v90 = v89;
        v91 = *(_QWORD *)v110;
        while (2)
        {
          v92 = 0;
LABEL_90:
          if (*(_QWORD *)v110 != v91)
            objc_enumerationMutation(v88);
          v93 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v92);
          v94 = objc_msgSend(v93, "CGPDFAnnotation");
          objc_msgSend(v93, "popup");
          v95 = (void *)objc_claimAutoreleasedReturnValue();

          if (v95)
          {
            v96 = 0;
            if (!v94)
              goto LABEL_98;
          }
          else
          {
            objc_msgSend(v93, "parent");
            v97 = (void *)objc_claimAutoreleasedReturnValue();

            v96 = v97 == 0;
            if (!v94)
              goto LABEL_98;
          }
          if (!v96)
            CGPDFAnnotationSetAnnotationForKey();
LABEL_98:
          if (v90 == ++v92)
          {
            v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v109, v125, 16);
            if (!v90)
              goto LABEL_100;
            continue;
          }
          goto LABEL_90;
        }
      }
    }
  }
  v6 = 0;
  while (1)
  {
    -[PDFDocument pageAtIndex:](v3, "pageAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "annotationChanges");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
      break;
    v9 = (void *)v8;
    objc_msgSend(v5, "insertObject:atIndex:", v8, v6);

    if (v103 == ++v6)
      goto LABEL_5;
  }

  v87 = 0;
LABEL_102:

  return v87;
}

- (CGPDFAnnotation)_createCGPDFAnnotationForAnnotation:(id)a3
{
  id v4;
  CGPDFAnnotation *v5;

  v4 = a3;
  -[PDFDocument _sanitizeAnnotationDictionary:](self, "_sanitizeAnnotationDictionary:", objc_msgSend(v4, "dictionaryRefExcludingParentOrPopup"));
  v5 = (CGPDFAnnotation *)CGPDFAnnotationCreate();
  if (v5)
  {
    if (objc_msgSend(v4, "shouldBurnIn"))
      CGPDFAnnotationSetBurnIn();
    objc_msgSend(v4, "setCGPDFAnnotation:", v5);
  }
  else
  {
    NSLog(CFSTR("Failed to create CGPDFAnnotation for new PDFAnnotation."));
  }

  return v5;
}

- (CGPDFName)_convertCFStringToCGPDFName:(void *)a3 forKey:(__CFString *)a4
{
  CFTypeID v6;
  void *v7;
  char v8;
  CFIndex Length;
  CFIndex v10;
  char *v11;
  char *v12;
  CGPDFName *v13;

  v6 = CFGetTypeID(a3);
  if (v6 != CFStringGetTypeID())
    return 0;
  if (a4)
  {
    +[PDFAnnotation PDFAnnotationKeysWithStringValues](PDFAnnotation, "PDFAnnotationKeysWithStringValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", a4);

    if ((v8 & 1) != 0)
      return 0;
  }
  if (!CFStringHasPrefix((CFStringRef)a3, CFSTR("/")))
    return 0;
  Length = CFStringGetLength((CFStringRef)a3);
  v10 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v11 = (char *)malloc_type_malloc(v10, 0x100004077774924uLL);
  if (!v11)
    return 0;
  v12 = v11;
  if (CFStringGetCString((CFStringRef)a3, v11, v10, 0x8000100u))
    v13 = (CGPDFName *)CGPDFNameCreate();
  else
    v13 = 0;
  free(v12);
  return v13;
}

- (void)_sanitizeAnnotationDictionary:(__CFDictionary *)a3
{
  CFIndex Count;
  const void **v6;
  const void **v7;
  const __CFAllocator *v8;
  const void **v9;
  const void **v10;
  CGPDFName *v11;
  const void *v12;
  CGPDFName *v13;
  CGPDFName *v14;
  CGPDFName *v15;
  CGPDFName *v16;
  CFMutableArrayRef v17;
  CFTypeID v18;
  CFMutableArrayRef MutableCopy;
  CFTypeID v20;
  const void **v21;

  Count = CFDictionaryGetCount(a3);
  v6 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
  v7 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
  v21 = v6;
  CFDictionaryGetKeysAndValues(a3, v6, v7);
  if (Count)
  {
    v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v9 = v21;
    v10 = v7;
    while (1)
    {
      v11 = (CGPDFName *)*v9;
      v12 = *v10;
      v13 = -[PDFDocument _convertCFStringToCGPDFName:forKey:](self, "_convertCFStringToCGPDFName:forKey:", *v9, 0);
      if (v13)
      {
        v14 = v13;
        CFRetain(v12);
        CFDictionaryRemoveValue(a3, v11);
        CFDictionarySetValue(a3, v14, v12);
        CFRelease(v12);
        CFRelease(v14);
        v11 = v14;
      }
      v15 = -[PDFDocument _convertCFStringToCGPDFName:forKey:](self, "_convertCFStringToCGPDFName:forKey:", v12, *v9);
      if (v15)
        break;
      v18 = CFGetTypeID(v12);
      if (v18 == CFArrayGetTypeID())
      {
        MutableCopy = CFArrayCreateMutableCopy(v8, 0, (CFArrayRef)v12);
        -[PDFDocument _sanitizeAnnotationArray:](self, "_sanitizeAnnotationArray:", MutableCopy);
        goto LABEL_11;
      }
      v20 = CFGetTypeID(v12);
      if (v20 == CFDictionaryGetTypeID())
      {
        MutableCopy = CFDictionaryCreateMutableCopy(v8, 0, (CFDictionaryRef)v12);
        -[PDFDocument _sanitizeAnnotationDictionary:](self, "_sanitizeAnnotationDictionary:", MutableCopy);
LABEL_11:
        CFDictionarySetValue(a3, v11, MutableCopy);
        v17 = MutableCopy;
LABEL_12:
        CFRelease(v17);
      }
      ++v10;
      ++v9;
      if (!--Count)
        goto LABEL_14;
    }
    v16 = v15;
    CFDictionarySetValue(a3, v11, v15);
    v17 = (CFMutableArrayRef)v16;
    goto LABEL_12;
  }
LABEL_14:
  free(v21);
  free(v7);
}

- (void)_sanitizeAnnotationArray:(__CFArray *)a3
{
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  const __CFAllocator *v8;
  const void *ValueAtIndex;
  CGPDFName *v10;
  CGPDFName *v11;
  CFMutableArrayRef v12;
  CFTypeID v13;
  CFMutableArrayRef MutableCopy;
  CFTypeID v15;

  Count = CFArrayGetCount(a3);
  if (Count >= 1)
  {
    v6 = Count;
    v7 = 0;
    v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a3, v7);
      v10 = -[PDFDocument _convertCFStringToCGPDFName:forKey:](self, "_convertCFStringToCGPDFName:forKey:", ValueAtIndex, 0);
      if (v10)
        break;
      v13 = CFGetTypeID(ValueAtIndex);
      if (v13 == CFArrayGetTypeID())
      {
        MutableCopy = CFArrayCreateMutableCopy(v8, 0, (CFArrayRef)ValueAtIndex);
        -[PDFDocument _sanitizeAnnotationArray:](self, "_sanitizeAnnotationArray:", MutableCopy);
        goto LABEL_9;
      }
      v15 = CFGetTypeID(ValueAtIndex);
      if (v15 == CFDictionaryGetTypeID())
      {
        MutableCopy = CFDictionaryCreateMutableCopy(v8, 0, (CFDictionaryRef)ValueAtIndex);
        -[PDFDocument _sanitizeAnnotationDictionary:](self, "_sanitizeAnnotationDictionary:", MutableCopy);
LABEL_9:
        CFArraySetValueAtIndex(a3, v7, MutableCopy);
        v12 = MutableCopy;
LABEL_10:
        CFRelease(v12);
      }
      if (v6 == ++v7)
        return;
    }
    v11 = v10;
    CFArraySetValueAtIndex(a3, v7, v10);
    v12 = (CFMutableArrayRef)v11;
    goto LABEL_10;
  }
}

- (id)_documentCatalogMetadataForRootPath:(id)a3 withKeys:(id)a4
{
  id v6;
  id v7;
  NSArray *documentCatalogMetadata;
  CGPDFDictionary *Catalog;
  CFDataRef v10;
  CFDataRef v11;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  CGPDFDataFormat format;
  CGPDFStreamRef value;

  v6 = a3;
  v7 = a4;
  if (!self->_isUnlocked)
    goto LABEL_9;
  documentCatalogMetadata = self->_documentCatalogMetadata;
  if (!documentCatalogMetadata)
  {
    Catalog = CGPDFDocumentGetCatalog(self->_document);
    if (Catalog)
    {
      value = 0;
      if (CGPDFDictionaryGetStream(Catalog, "Metadata", &value))
      {
        format = CGPDFDataFormatRaw;
        v10 = CGPDFStreamCopyData(value, &format);
        if (v10)
        {
          v11 = v10;
          -[PDFDocument _dataFromXMP:withRootPath:keys:](self, "_dataFromXMP:withRootPath:keys:", v10, v6, v7);
          v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v13 = self->_documentCatalogMetadata;
          self->_documentCatalogMetadata = v12;

          CFRelease(v11);
        }
      }
      documentCatalogMetadata = self->_documentCatalogMetadata;
      goto LABEL_8;
    }
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
LABEL_8:
  v14 = documentCatalogMetadata;
LABEL_10:

  return v14;
}

- (void)_setDocumentCatalogMetadata:(id)a3 withNSpace:(id)a4 prefix:(id)a5 rootPath:(id)a6
{
  NSString *v10;
  NSString *v11;
  NSString *v12;
  PDFDocument *v13;
  uint64_t v14;
  NSString *xmpNameSpace;
  uint64_t v16;
  NSString *xmpPrefix;
  uint64_t v18;
  NSString *xmpRootPath;
  uint64_t v20;
  NSArray *documentCatalogMetadata;
  NSArray *v22;

  v22 = (NSArray *)a3;
  v10 = (NSString *)a4;
  v11 = (NSString *)a5;
  v12 = (NSString *)a6;
  v13 = self;
  objc_sync_enter(v13);
  if (v13->_xmpNameSpace != v10)
  {
    v14 = -[NSString copy](v10, "copy");
    xmpNameSpace = v13->_xmpNameSpace;
    v13->_xmpNameSpace = (NSString *)v14;

  }
  if (v13->_xmpPrefix != v11)
  {
    v16 = -[NSString copy](v11, "copy");
    xmpPrefix = v13->_xmpPrefix;
    v13->_xmpPrefix = (NSString *)v16;

  }
  if (v13->_xmpRootPath != v12)
  {
    v18 = -[NSString copy](v12, "copy");
    xmpRootPath = v13->_xmpRootPath;
    v13->_xmpRootPath = (NSString *)v18;

  }
  if (v13->_documentCatalogMetadata != v22)
  {
    v20 = -[NSArray copy](v22, "copy");
    documentCatalogMetadata = v13->_documentCatalogMetadata;
    v13->_documentCatalogMetadata = (NSArray *)v20;

  }
  objc_sync_exit(v13);

}

- (__CFData)newXMPFromData:(id)a3 preserveExistingXMPMetadata:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CGPDFDictionary *Catalog;
  const __CFData *v8;
  CFDataRef XMPData;
  const CGImageMetadata *v10;
  CGMutableImageMetadataRef MutableCopy;
  CGImageMetadata *v12;
  char v13;
  CGMutableImageMetadataRef Mutable;
  const __CFString *xmpNameSpace;
  const __CFString *xmpPrefix;
  PDFDocument *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  char v30;
  const CGImageMetadata *v31;
  id v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD block[6];
  CGPDFDataFormat format;
  CGPDFStreamRef value;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v4 = a4;
  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!v4)
    goto LABEL_8;
  Catalog = CGPDFDocumentGetCatalog(self->_document);
  value = 0;
  if (!CGPDFDictionaryGetStream(Catalog, "Metadata", &value))
    goto LABEL_8;
  format = CGPDFDataFormatRaw;
  v8 = CGPDFStreamCopyData(value, &format);
  if (!v8)
    goto LABEL_8;
  XMPData = v8;
  if (!v6)
    goto LABEL_34;
  v10 = CGImageMetadataCreateFromXMPData(v8);
  CFRelease(XMPData);
  if (v10)
  {
    MutableCopy = CGImageMetadataCreateMutableCopy(v10);
    if (!MutableCopy)
    {
      XMPData = 0;
LABEL_32:
      CFRelease(v10);
      goto LABEL_34;
    }
    v12 = MutableCopy;
    v13 = 0;
  }
  else
  {
LABEL_8:
    Mutable = CGImageMetadataCreateMutable();
    v10 = 0;
    if (!Mutable)
    {
      XMPData = 0;
      goto LABEL_34;
    }
    v12 = Mutable;
    v13 = 1;
  }
  xmpNameSpace = (const __CFString *)self->_xmpNameSpace;
  if (xmpNameSpace)
  {
    xmpPrefix = (const __CFString *)self->_xmpPrefix;
    if (xmpPrefix)
    {
      if (v6 && self->_xmpRootPath)
      {
        CGImageMetadataRegisterNamespaceForPrefix(v12, xmpNameSpace, xmpPrefix, 0);
        v30 = v13;
        if ((v13 & 1) == 0)
        {
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __58__PDFDocument_newXMPFromData_preserveExistingXMPMetadata___block_invoke;
          block[3] = &unk_24C25DB70;
          block[4] = self;
          block[5] = v12;
          CGImageMetadataEnumerateTagsUsingBlock(v10, 0, 0, block);
        }
        v31 = v10;
        v32 = v6;
        v17 = self;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        obj = v6;
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        if (v35)
        {
          v18 = 0;
          v34 = *(_QWORD *)v42;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v42 != v34)
                objc_enumerationMutation(obj);
              v36 = v19;
              v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v19);
              v37 = 0u;
              v38 = 0u;
              v39 = 0u;
              v40 = 0u;
              v21 = v20;
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
              if (v22)
              {
                v23 = v22;
                v24 = *(_QWORD *)v38;
                do
                {
                  for (i = 0; i != v23; ++i)
                  {
                    if (*(_QWORD *)v38 != v24)
                      objc_enumerationMutation(v21);
                    v26 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
                    objc_msgSend(v21, "valueForKey:", v26);
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@[%d].%@"), v17->_xmpRootPath, v18, v26);
                    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    CGImageMetadataSetValueWithPath(v12, 0, v28, v27);

                  }
                  v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
                }
                while (v23);
              }

              v18 = (v18 + 1);
              v19 = v36 + 1;
            }
            while (v36 + 1 != v35);
            v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          }
          while (v35);
        }

        v10 = v31;
        v6 = v32;
        v13 = v30;
      }
    }
  }
  XMPData = CGImageMetadataCreateXMPData(v12, 0);
  CFRelease(v12);
  if ((v13 & 1) == 0)
    goto LABEL_32;
LABEL_34:

  return XMPData;
}

uint64_t __58__PDFDocument_newXMPFromData_preserveExistingXMPMetadata___block_invoke(uint64_t a1, const __CFString *a2, CGImageMetadataTagRef tag)
{
  const __CFString *v5;

  v5 = CGImageMetadataTagCopyPrefix(tag);
  if (CFStringCompare(v5, *(CFStringRef *)(*(_QWORD *)(a1 + 32) + 312), 0) == kCFCompareEqualTo)
    CGImageMetadataRemoveTagWithPath(*(CGMutableImageMetadataRef *)(a1 + 40), 0, a2);
  CFRelease(v5);
  return 1;
}

- (id)akDocumentAdaptor
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (GetDefaultsWriteAKEnabled() && !self->_akDocumentAdaptor)
    _PDFLog(OS_LOG_TYPE_DEFAULT, (uint64_t)"PDFDocument", (uint64_t)"%s: Called when the document adaptor wasn't set up yet.", v3, v4, v5, v6, v7, (uint64_t)"-[PDFDocument akDocumentAdaptor]");
  return self->_akDocumentAdaptor;
}

- (void)setPDFAKControllerDelegate:(id)a3
{
  PDFAKDocumentAdaptor *akDocumentAdaptor;

  akDocumentAdaptor = self->_akDocumentAdaptor;
  if (akDocumentAdaptor)
  {
    -[PDFAKDocumentAdaptor setPDFAKControllerDelegate:](akDocumentAdaptor, "setPDFAKControllerDelegate:", a3);
    a3 = 0;
  }
  objc_storeWeak((id *)&self->_pdfAKControllerDelegateForDeferredSetup, a3);
}

- (id)PDFAKControllerDelegate
{
  void *akDocumentAdaptor;

  akDocumentAdaptor = self->_akDocumentAdaptor;
  if (akDocumentAdaptor)
  {
    objc_msgSend(akDocumentAdaptor, "PDFAKControllerDelegate");
    akDocumentAdaptor = (void *)objc_claimAutoreleasedReturnValue();
  }
  return akDocumentAdaptor;
}

- (void)_notifyAKAdaptorPagePlaceholder:(id)a3 wasReplacedWithPage:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v8 = a3;
  v9 = a4;
  if (self->_akDocumentAdaptor)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      objc_msgSend(v9, "setupAKPageAdaptorIfNecessary");
      -[PDFAKDocumentAdaptor pdfDocument:didReplacePagePlaceholder:atIndex:withPage:](self->_akDocumentAdaptor, "pdfDocument:didReplacePagePlaceholder:atIndex:withPage:", self, v8, a5, v9);
      objc_msgSend(v9, "setAKDidSetupRealPageModelController:", 1);
    }
    else
    {
      v17[0] = 0;
      v17[1] = v17;
      v17[2] = 0x3042000000;
      v17[3] = __Block_byref_object_copy__251;
      v17[4] = __Block_byref_object_dispose__252;
      objc_initWeak(&v18, self);
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x3042000000;
      v15[3] = __Block_byref_object_copy__251;
      v15[4] = __Block_byref_object_dispose__252;
      objc_initWeak(&v16, v9);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __75__PDFDocument__notifyAKAdaptorPagePlaceholder_wasReplacedWithPage_atIndex___block_invoke;
      v10[3] = &unk_24C25DB98;
      v13 = v17;
      v14 = v15;
      v11 = v8;
      v12 = v9;
      dispatch_async(MEMORY[0x24BDAC9B8], v10);

      _Block_object_dispose(v15, 8);
      objc_destroyWeak(&v16);
      _Block_object_dispose(v17, 8);
      objc_destroyWeak(&v18);
    }
  }

}

void __75__PDFDocument__notifyAKAdaptorPagePlaceholder_wasReplacedWithPage_atIndex___block_invoke(uint64_t a1)
{
  id v2;
  BOOL v3;
  id v4;
  uint64_t v5;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v2 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  if (v2)
    v3 = WeakRetained == 0;
  else
    v3 = 1;
  if (!v3 && WeakRetained[48])
  {
    v4 = WeakRetained[4];
    objc_sync_enter(v4);
    v5 = objc_msgSend(WeakRetained[4], "indexOfObjectIdenticalTo:", v2);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v2, "setupAKPageAdaptorIfNecessary");
      objc_msgSend(WeakRetained[48], "pdfDocument:didReplacePagePlaceholder:atIndex:withPage:", WeakRetained, *(_QWORD *)(a1 + 32), v5, v2);
      objc_msgSend(*(id *)(a1 + 40), "setAKDidSetupRealPageModelController:", 1);
    }
    objc_sync_exit(v4);

  }
}

- (void)enableDocumentMRUMode:(BOOL)a3
{
  if (self->_document)
    CGPDFDocumentEnableMRUMode();
}

- (BOOL)isLinearized
{
  CGPDFDocument *document;

  document = self->_document;
  if (document)
    LOBYTE(document) = CGPDFDocumentIsLinearized();
  return (char)document;
}

- (BOOL)hasHighLatencyDataProvider
{
  const __CFBoolean *document;
  const __CFBoolean *v3;
  CFTypeID v4;

  document = self->_document;
  if (document)
  {
    document = (const __CFBoolean *)CGPDFDocumentGetDataProvider();
    if (document)
    {
      document = (const __CFBoolean *)CGDataProviderGetProperty();
      if (document)
      {
        v3 = document;
        v4 = CFGetTypeID(document);
        LOBYTE(document) = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) != 0;
      }
    }
  }
  return (char)document;
}

- (void)setHasHighLatencyDataProvider:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (-[PDFDocument hasHighLatencyDataProvider](self, "hasHighLatencyDataProvider") != a3)
  {
    CGPDFDocumentGetDataProvider();
    CGDataProviderSetProperty();
    if (!a3)
    {
      objc_initWeak(&location, self);
      -[PDFDocument textExtractionQueue](self, "textExtractionQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __45__PDFDocument_setHasHighLatencyDataProvider___block_invoke;
      v6[3] = &unk_24C25D090;
      objc_copyWeak(&v7, &location);
      dispatch_async(v5, v6);

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

void __45__PDFDocument_setHasHighLatencyDataProvider___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;
  _QWORD v4[4];
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[4];
    v4[1] = 3221225472;
    v4[2] = __45__PDFDocument_setHasHighLatencyDataProvider___block_invoke_2;
    v4[3] = &unk_24C25DBC0;
    v3 = WeakRetained;
    v4[0] = MEMORY[0x24BDAC760];
    v5 = WeakRetained;
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

    WeakRetained = v3;
  }

}

void __45__PDFDocument_setHasHighLatencyDataProvider___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  size_t v8;
  CGPDFPageRef Page;
  id v10;

  v10 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v10, "pageRef"))
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue") + 1;

    Page = CGPDFDocumentGetPage(*(CGPDFDocumentRef *)(*(_QWORD *)(a1 + 32) + 8), v8);
    if (Page)
      objc_msgSend(v10, "setPageRef:", Page);
  }

}

- (BOOL)createdWithWithHighLatencyDataProvider
{
  return self->_createdWithHighLatencyDataProvider;
}

- (void)preloadDataOfPagesInRange:(_NSRange)a3 onQueue:(id)a4 completion:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  NSObject *v9;
  id v10;
  NSRange v11;
  NSUInteger v12;
  void *v13;
  NSMutableDictionary *pageIndices;
  void *v15;
  void *v16;
  uint64_t DataProvider;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  NSMutableIndexSet *obj;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[5];
  NSObject *v34;
  NSObject *v35;
  _QWORD block[4];
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  void **v43;
  void *v44;
  void *v45[6];
  NSRange v46;
  NSRange v47;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  v10 = a5;
  if (-[PDFDocument isLinearized](self, "isLinearized"))
  {
    if (-[PDFDocument hasHighLatencyDataProvider](self, "hasHighLatencyDataProvider"))
    {
      v47.length = -[PDFDocument pageCount](self, "pageCount");
      v46.location = location;
      v46.length = length;
      v47.location = 0;
      v11 = NSIntersectionRange(v46, v47);
      if (v11.length)
      {
        v12 = v11.location;
        v29 = (void *)objc_opt_new();
        v13 = (void *)objc_opt_new();
        obj = self->_preloadingPageIndexes;
        objc_sync_enter(obj);
        if (v12 < v12 + v11.length)
        {
          do
          {
            pageIndices = self->_pageIndices;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12, obj);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKey:](pageIndices, "objectForKey:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "integerValue");

            if ((-[NSMutableIndexSet containsIndex:](self->_preloadingPageIndexes, "containsIndex:", v12) & 1) == 0
              && !CGPDFDocumentGetPageNoCreate())
            {
              -[NSMutableIndexSet addIndex:](self->_preloadingPageIndexes, "addIndex:", v12);
              objc_msgSend(v29, "addIndex:", v12);
              v45[0] = 0;
              v45[4] = 0;
              if (CGPDFDocumentCreateLinearizedRangesForPage())
                free(v45[0]);
            }
            ++v12;
          }
          while (v12 != v11.location + v11.length);
        }
        objc_sync_exit(obj);

        DataProvider = CGPDFDocumentGetDataProvider();
        v18 = objc_msgSend(v13, "rangeCount");
        v19 = malloc_type_malloc(16 * v18, 0x1000040451B5BE8uLL);
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v18);
        v45[0] = 0;
        v45[1] = v45;
        v45[2] = (void *)0x2020000000;
        v45[3] = 0;
        v21 = MEMORY[0x24BDAC760];
        v41[0] = MEMORY[0x24BDAC760];
        v41[1] = 3221225472;
        v41[2] = __60__PDFDocument_preloadDataOfPagesInRange_onQueue_completion___block_invoke;
        v41[3] = &unk_24C25DBE8;
        v43 = v45;
        v44 = v19;
        v22 = v20;
        v42 = v22;
        objc_msgSend(v13, "enumerateRangesUsingBlock:", v41);
        v23 = dispatch_group_create();
        block[0] = v21;
        block[1] = 3221225472;
        block[2] = __60__PDFDocument_preloadDataOfPagesInRange_onQueue_completion___block_invoke_2;
        block[3] = &unk_24C25DC10;
        v38 = DataProvider;
        v24 = v22;
        v37 = v24;
        v39 = v19;
        v40 = v18;
        dispatch_group_async(v23, v9, block);
        v33[0] = v21;
        v33[1] = 3221225472;
        v33[2] = __60__PDFDocument_preloadDataOfPagesInRange_onQueue_completion___block_invoke_3;
        v33[3] = &unk_24C25DC60;
        v33[4] = self;
        v25 = v23;
        v34 = v25;
        v26 = v9;
        v35 = v26;
        objc_msgSend(v29, "enumerateIndexesUsingBlock:", v33);
        v30[0] = v21;
        v30[1] = 3221225472;
        v30[2] = __60__PDFDocument_preloadDataOfPagesInRange_onQueue_completion___block_invoke_5;
        v30[3] = &unk_24C25CC38;
        v31 = v29;
        v32 = v10;
        v27 = v29;
        dispatch_group_notify(v25, v26, v30);

        _Block_object_dispose(v45, 8);
      }
    }
  }

}

void __60__PDFDocument_preloadDataOfPagesInRange_onQueue_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(v4 + 16 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)) = a2;
  *(_QWORD *)(v4 + 16 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 8) = a3;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __60__PDFDocument_preloadDataOfPagesInRange_onQueue_completion___block_invoke_2(uint64_t a1)
{
  CGDataProviderGetBytesInRanges();
  free(*(void **)(a1 + 48));
}

void __60__PDFDocument_preloadDataOfPagesInRange_onQueue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD block[5];
  id v12[3];
  id location;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)(objc_msgSend(v6, "integerValue") + 1);

  if (!CGPDFDocumentGetPageNoCreate())
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v8 = *(NSObject **)(a1 + 40);
    v9 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__PDFDocument_preloadDataOfPagesInRange_onQueue_completion___block_invoke_4;
    block[3] = &unk_24C25DC38;
    objc_copyWeak(v12, &location);
    v10 = *(_QWORD *)(a1 + 32);
    v12[1] = v7;
    v12[2] = a2;
    block[4] = v10;
    dispatch_group_async(v8, v9, block);
    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
}

void __60__PDFDocument_preloadDataOfPagesInRange_onQueue_completion___block_invoke_4(uint64_t a1)
{
  CGPDFPageRef Page;
  CGPDFPageRef v3;
  void *v4;
  CGPDFDocumentRef *WeakRetained;

  WeakRetained = (CGPDFDocumentRef *)objc_loadWeakRetained((id *)(a1 + 40));
  Page = CGPDFDocumentGetPage(WeakRetained[1], *(_QWORD *)(a1 + 48));
  if (Page)
  {
    v3 = Page;
    objc_msgSend(*(id *)(a1 + 32), "pageAtIndex:", *(_QWORD *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPageRef:", v3);
    if (*(_QWORD *)(a1 + 48) == 1)
      objc_msgSend(v4, "ensureDisplayList");

  }
}

uint64_t __60__PDFDocument_preloadDataOfPagesInRange_onQueue_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (id)linearizedRangesForPage:(id)a3
{
  if (a3 && self->_document)
  {
    objc_msgSend(a3, "pageNumber");
    CGPDFDocumentCreateLinearizedRangesForPage();
  }
  return 0;
}

+ (BOOL)isValidPassword:(id)a3
{
  return CGPDFContextIsValidPassword();
}

- (PDFDocument)init
{
  PDFDocument *v2;
  PDFDocument *v3;
  PDFForm *v4;
  PDFForm *formData;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PDFDocument;
  v2 = -[PDFDocument init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_document = 0;
    -[PDFDocument _commonInit](v2, "_commonInit");
    v4 = -[PDFForm initWithDocument:]([PDFForm alloc], "initWithDocument:", v3);
    formData = v3->_formData;
    v3->_formData = v4;

  }
  return v3;
}

- (PDFDocument)initWithURL:(NSURL *)url
{
  NSURL *v5;
  PDFDocument *v6;
  PDFDocument *v7;
  CGPDFDocument *v8;
  PDFDocument *v9;
  objc_super v11;

  v5 = url;
  v11.receiver = self;
  v11.super_class = (Class)PDFDocument;
  v6 = -[PDFDocument init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_documentURL, url);
    v8 = CGPDFDocumentCreateWithURL((CFURLRef)v5);
    -[PDFDocument setDocument:](v7, "setDocument:", v8);
    CGPDFDocumentRelease(v8);
    if (!v7->_document)
    {
      v9 = 0;
      goto LABEL_6;
    }
    -[PDFDocument _commonInit](v7, "_commonInit");
  }
  v9 = v7;
LABEL_6:

  return v9;
}

- (PDFDocument)initWithData:(NSData *)data
{
  NSData *v4;
  PDFDocument *v5;
  CGDataProvider *v6;
  PDFDocument *v7;
  objc_super v9;

  v4 = data;
  v9.receiver = self;
  v9.super_class = (Class)PDFDocument;
  v5 = -[PDFDocument init](&v9, sel_init);
  if (v5)
  {
    v6 = CGDataProviderCreateWithCFData((CFDataRef)v4);
    -[PDFDocument _createDocumentWithDataProvider:](v5, "_createDocumentWithDataProvider:", v6);
    CGDataProviderRelease(v6);
    if (!v5->_document)
    {
      v7 = 0;
      goto LABEL_6;
    }
    -[PDFDocument _commonInit](v5, "_commonInit");
  }
  v7 = v5;
LABEL_6:

  return v7;
}

- (PDFDocument)initWithProvider:(CGDataProvider *)a3
{
  CGDataProvider *v3;
  PDFDocument *v4;
  PDFDocument *v5;
  objc_super v7;

  v3 = a3;
  v4 = self;
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)PDFDocument;
    v5 = -[PDFDocument init](&v7, sel_init);
    v4 = v5;
    if (v5)
    {
      -[PDFDocument _createDocumentWithDataProvider:](v5, "_createDocumentWithDataProvider:", v3);
      if (!v4->_document)
      {
        v3 = 0;
        goto LABEL_7;
      }
      -[PDFDocument _commonInit](v4, "_commonInit");
    }
    v4 = v4;
    v3 = (CGDataProvider *)v4;
  }
LABEL_7:

  return (PDFDocument *)v3;
}

- (void)_createDocumentWithDataProvider:(CGDataProvider *)a3
{
  CGPDFDocument *v4;

  v4 = CGPDFDocumentCreateWithProvider(a3);
  -[PDFDocument setDocument:](self, "setDocument:", v4);
  CGPDFDocumentRelease(v4);
  self->_createdWithHighLatencyDataProvider = -[PDFDocument hasHighLatencyDataProvider](self, "hasHighLatencyDataProvider");
}

- (void)setDocument:(CGPDFDocument *)a3
{
  CGPDFDocument *document;
  BOOL IsEncrypted;
  size_t NumberOfPages;
  uint64_t SizeOfData;
  uint64_t v9;
  CGPDFDocument *v10;
  int64_t v11;
  CGDataProvider *v12;
  CGDataProvider *v13;
  PDFForm *formData;

  document = self->_document;
  if (document != a3)
  {
    if (document)
    {
      CGPDFDocumentRelease(document);
      self->_document = 0;
    }
    IsEncrypted = CGPDFDocumentIsEncrypted(a3);
    NumberOfPages = CGPDFDocumentGetNumberOfPages(a3);
    CGPDFDocumentGetDataProvider();
    SizeOfData = CGDataProviderGetSizeOfData();
    v9 = SizeOfData + 15;
    if (SizeOfData >= 0)
      v9 = SizeOfData;
    if (NumberOfPages && NumberOfPages > v9 >> 4)
    {
      NSLog(CFSTR("Error: Given CGPDFDocumentRef to PDFDocument is returning an unreasonable number of pages for the file size."));
      return;
    }
    if (IsEncrypted)
    {
      if (NumberOfPages || (v12 = CGDataProviderCreateWithURL((CFURLRef)self->_documentURL)) == 0)
      {
        v10 = CGPDFDocumentRetain(a3);
        self->_document = v10;
        if (v10)
        {
LABEL_18:
          if (!CGPDFDocumentIsUnlocked(v10))
          {
            self->_permission = 0;
            goto LABEL_22;
          }
          v11 = 1;
LABEL_20:
          self->_permission = v11;
LABEL_22:
          formData = self->_formData;
          self->_formData = 0;

        }
      }
      else
      {
        v13 = v12;
        self->_document = CGPDFDocumentCreateWithProvider(v12);
        CGDataProviderRelease(v13);
        v10 = self->_document;
        if (v10)
          goto LABEL_18;
      }
    }
    else if (NumberOfPages)
    {
      self->_document = CGPDFDocumentRetain(a3);
      v11 = 2;
      goto LABEL_20;
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t DataProvider;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  NSArray *findStrings;
  PDFSelection *findInstance;
  NSMutableArray *v23;
  NSMutableArray *findResults;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  PDFForm *formData;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    DataProvider = CGPDFDocumentGetDataProvider();
    if (DataProvider)
    {
      v7 = DataProvider;
      v8 = -[NSURL copyWithZone:](self->_documentURL, "copyWithZone:", a3);
      v9 = *(void **)(v5 + 16);
      *(_QWORD *)(v5 + 16) = v8;

      objc_msgSend((id)v5, "_createDocumentWithDataProvider:", v7);
    }
    else
    {
      v10 = *(void **)(v5 + 16);
      *(_QWORD *)(v5 + 16) = 0;

      *(_QWORD *)(v5 + 8) = 0;
    }
    v11 = -[NSString copyWithZone:](self->_ownerPassword, "copyWithZone:", a3);
    v12 = *(void **)(v5 + 152);
    *(_QWORD *)(v5 + 152) = v11;

    v13 = -[NSString copyWithZone:](self->_userPassword, "copyWithZone:", a3);
    v14 = *(void **)(v5 + 160);
    *(_QWORD *)(v5 + 160) = v13;

    if (self->_permission)
    {
      -[PDFDocument passwordUsedForUnlocking](self, "passwordUsedForUnlocking");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v5, "unlockWithPassword:", v15);

    }
    *(_QWORD *)(v5 + 112) = self->_pageCount;
    *(_DWORD *)(v5 + 120) = self->_majorVersion;
    *(_DWORD *)(v5 + 124) = self->_minorVersion;
    *(_BYTE *)(v5 + 128) = self->_isEncrypted;
    *(_BYTE *)(v5 + 129) = self->_isUnlocked;
    *(_DWORD *)(v5 + 132) = self->_accessPermissions;
    *(_BYTE *)(v5 + 136) = self->_allowsPrinting;
    *(_BYTE *)(v5 + 137) = self->_allowsCopying;
    *(_BYTE *)(v5 + 138) = self->_allowsDocumentChanges;
    *(_BYTE *)(v5 + 139) = self->_allowsDocumentAssembly;
    *(_BYTE *)(v5 + 140) = self->_allowsContentAccessibility;
    *(_BYTE *)(v5 + 141) = self->_allowsCommenting;
    *(_BYTE *)(v5 + 142) = self->_allowsFormFieldEntry;
    *(_QWORD *)(v5 + 144) = self->_permission;
    v16 = -[NSDictionary copyWithZone:](self->_attributes, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 168);
    *(_QWORD *)(v5 + 168) = v16;

    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    objc_storeWeak((id *)(v5 + 88), WeakRetained);

    *(_BYTE *)(v5 + 96) = self->_respondsToDidUnlock;
    *(_BYTE *)(v5 + 97) = self->_respondsToDidFindMatch;
    *(_BYTE *)(v5 + 98) = self->_respondsToDidBeginDocumentFind;
    *(_BYTE *)(v5 + 99) = self->_respondsToDidEndDocumentFind;
    *(_BYTE *)(v5 + 100) = self->_respondsToDidBeginPageFind;
    *(_BYTE *)(v5 + 101) = self->_respondsToDidEndPageFind;
    *(_BYTE *)(v5 + 102) = self->_respondsToDidMatchString;
    *(_BYTE *)(v5 + 103) = self->_respondsToPrintJobTitle;
    *(_BYTE *)(v5 + 104) = self->_respondsToClassForPage;
    *(_BYTE *)(v5 + 105) = self->_respondsToClassForAnnotationType;
    *(_BYTE *)(v5 + 106) = self->_respondsToClassForAnnotationClass;
    *(_BYTE *)(v5 + 107) = self->_respondsToShouldReadAKInkAnnotations;
    v19 = *(void **)(v5 + 184);
    *(_QWORD *)(v5 + 184) = 0;

    v20 = *(void **)(v5 + 192);
    *(_QWORD *)(v5 + 192) = 0;

    self->_finding = 0;
    self->_findModel = 0;
    findStrings = self->_findStrings;
    self->_findStrings = 0;

    findInstance = self->_findInstance;
    self->_findInstance = 0;

    self->_findOptions = 0;
    self->_findPageIndex = 0;
    *(_OWORD *)&self->_findCharIndex = xmmword_209DC0800;
    self->_lastFindCharIndex = -1;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
    v23 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    findResults = self->_findResults;
    self->_findResults = v23;

    v25 = -[NSArray copyWithZone:](self->_documentCatalogMetadata, "copyWithZone:", a3);
    v26 = *(void **)(v5 + 296);
    *(_QWORD *)(v5 + 296) = v25;

    v27 = -[NSString copyWithZone:](self->_xmpNameSpace, "copyWithZone:", a3);
    v28 = *(void **)(v5 + 304);
    *(_QWORD *)(v5 + 304) = v27;

    v29 = -[NSString copyWithZone:](self->_xmpPrefix, "copyWithZone:", a3);
    v30 = *(void **)(v5 + 312);
    *(_QWORD *)(v5 + 312) = v29;

    v31 = -[NSString copyWithZone:](self->_xmpRootPath, "copyWithZone:", a3);
    v32 = *(void **)(v5 + 320);
    *(_QWORD *)(v5 + 320) = v31;

    v33 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", self->_pageCount);
    v34 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v33;

    v35 = objc_alloc(MEMORY[0x24BDBCED8]);
    v36 = (void *)-[NSMutableDictionary copyWithZone:](self->_pageIndices, "copyWithZone:", a3);
    v37 = objc_msgSend(v35, "initWithDictionary:", v36);
    v38 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v37;

    *(_BYTE *)(v5 + 336) = self->_documentChanged;
    *(_BYTE *)(v5 + 337) = self->_documentHasBurnInAnnotations;
    *(_BYTE *)(v5 + 352) = self->_documentHasPageWithApplicationData;
    *(_QWORD *)(v5 + 344) = self->_documentRedactionCount;
    *($28735FA612DDC04BCD4AE5F2EEDE052B *)(v5 + 353) = self->_pagesChanged;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v39 = self->_pages;
    v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v55;
      do
      {
        v43 = 0;
        do
        {
          if (*(_QWORD *)v55 != v42)
            objc_enumerationMutation(v39);
          v44 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v43), "copyWithZone:", a3, (_QWORD)v54);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v44, "setDocument:", v5);
          objc_msgSend(*(id *)(v5 + 32), "addObject:", v44);

          ++v43;
        }
        while (v41 != v43);
        v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      }
      while (v41);
    }

    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", *(_QWORD *)(v5 + 32));
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v45;

    formData = self->_formData;
    if (formData)
    {
      -[PDFForm fieldNames](formData, "fieldNames");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "count");

      if (v49)
      {
        v50 = *(void **)(v5 + 280);
        *(_QWORD *)(v5 + 280) = 0;

        v51 = -[PDFForm copyWithZone:](self->_formData, "copyWithZone:", a3);
        v52 = *(void **)(v5 + 280);
        *(_QWORD *)(v5 + 280) = v51;

        *(_BYTE *)(v5 + 288) = 1;
        objc_msgSend(*(id *)(v5 + 280), "setDocument:", v5);
      }
    }
  }
  return (id)v5;
}

- (void)dealloc
{
  PDFAKDocumentAdaptor *akDocumentAdaptor;
  objc_super v4;

  -[PDFAKDocumentAdaptor teardown](self->_akDocumentAdaptor, "teardown");
  akDocumentAdaptor = self->_akDocumentAdaptor;
  self->_akDocumentAdaptor = 0;

  CGPDFDocumentRelease(self->_document);
  self->_document = 0;
  v4.receiver = self;
  v4.super_class = (Class)PDFDocument;
  -[PDFDocument dealloc](&v4, sel_dealloc);
}

- (NSURL)documentURL
{
  return self->_documentURL;
}

- (CGPDFDocumentRef)documentRef
{
  return self->_document;
}

- (NSDictionary)documentAttributes
{
  NSDictionary *attributes;
  CGPDFDictionary *Info;
  uint64_t i;
  id v7;
  int v8;
  int v9;
  id v10;
  CFDateRef v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  NSDictionary *v15;
  NSDictionary *v16;
  NSDictionary *v17;
  uint64_t j;
  id v19;
  CGPDFStringRef value;
  _OWORD v21[4];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (!self->_isUnlocked)
    return (NSDictionary *)0;
  attributes = self->_attributes;
  if (attributes)
    return attributes;
  v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v21[0] = xmmword_24C25DC80;
  v21[1] = *(_OWORD *)&off_24C25DC90;
  v21[2] = xmmword_24C25DCA0;
  v21[3] = *(_OWORD *)off_24C25DCB0;
  Info = CGPDFDocumentGetInfo(self->_document);
  for (i = 0; i != 64; i += 8)
  {
    v7 = *(id *)((char *)v21 + i);
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Keywords"));
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CreationDate")) & 1) != 0)
      v9 = 1;
    else
      v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("ModDate"));
    value = 0;
    v10 = objc_retainAutorelease(v7);
    if (CGPDFDictionaryGetString(Info, (const char *)objc_msgSend(v10, "cStringUsingEncoding:", 1), &value))
    {
      if (v9)
      {
        v11 = CGPDFStringCopyDate(value);
        if (!v11)
          goto LABEL_19;
        v12 = v11;
        goto LABEL_17;
      }
      v13 = CGPDFStringCopyTextString(value);
      if (v13)
      {
        v12 = (void *)v13;
        if (CFStringGetLength(v13) >= 1)
        {
          if (v8)
          {
            objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(", "));
            v14 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "setObject:forKey:", v14, v10);
            v12 = (void *)v14;
LABEL_18:

            goto LABEL_19;
          }
LABEL_17:
          objc_msgSend(v19, "setObject:forKey:", v12, v10, v19);
          goto LABEL_18;
        }
      }
    }
LABEL_19:

  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v19);
  v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v16 = self->_attributes;
  self->_attributes = v15;

  v17 = self->_attributes;
  for (j = 56; j != -8; j -= 8)

  return v17;
}

- (void)setDocumentAttributes:(NSDictionary *)documentAttributes
{
  NSDictionary *v4;
  NSDictionary *attributes;
  PDFDocumentPermissions v6;
  const __CFString *v7;
  NSDictionary *v8;

  v8 = documentAttributes;
  if (-[PDFDocument allowsDocumentChanges](self, "allowsDocumentChanges"))
  {
    v4 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
    attributes = self->_attributes;
    self->_attributes = v4;

  }
  else
  {
    v6 = -[PDFDocument permissionsStatus](self, "permissionsStatus");
    v7 = CFSTR("user");
    if (v6 == kPDFDocumentPermissionsOwner)
      v7 = CFSTR("owner");
    NSLog(CFSTR("PDFDocument's setDocumentAttributes: failed. PDF document's %@ permissions does not allow document changes."), v7);
  }

}

- (NSInteger)majorVersion
{
  return self->_majorVersion;
}

- (NSInteger)minorVersion
{
  return self->_minorVersion;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (BOOL)isLocked
{
  return !self->_isUnlocked;
}

- (BOOL)unlockWithPassword:(NSString *)password
{
  NSString *v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  NSString *v9;
  NSString *ownerPassword;
  __CFString *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *userPassword;
  CGPDFAccessPermissions AccessPermissions;
  unsigned int v17;
  uint64_t v18;
  int16x8_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  PDFAKDocumentAdaptor *akDocumentAdaptor;
  NSMutableArray *v28;
  NSMutableArray *pages;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  NSMutableDictionary *pageIndices;
  void *v34;
  void *v35;
  NSOrderedSet *v36;
  NSOrderedSet *pagesOrderedSet;
  size_t v38;
  void *v39;
  CGPDFDocument *document;
  id v41;
  void *v42;
  id WeakRetained;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = password;
  if (self->_permission != 2)
  {
    -[PDFDocument _SASLSanitize:](self, "_SASLSanitize:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (self->_permission != 2)
    {
      v8 = objc_retainAutorelease(v6);
      objc_msgSend(v8, "UTF8String");
      if (CGPDFDocumentAuthenticateOwnerPassword())
      {
        -[PDFDocument willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("permissionsStatus"));
        self->_permission = 2;
        v9 = (NSString *)-[NSString copy](v4, "copy");
        ownerPassword = self->_ownerPassword;
        self->_ownerPassword = v9;

        -[PDFDocument didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("permissionsStatus"));
        objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
        if (CGPDFDocumentAuthenticateUserPassword())
        {
          v11 = (__CFString *)v4;
        }
        else
        {
          objc_msgSend(&stru_24C25F170, "UTF8String");
          if (!CGPDFDocumentAuthenticateUserPassword())
          {
LABEL_13:
            if (!CGPDFDocumentUnlockWithPassword(self->_document, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String")))
            {
              v5 = 0;
              goto LABEL_47;
            }
            AccessPermissions = CGPDFDocumentGetAccessPermissions(self->_document);
            self->_accessPermissions = AccessPermissions;
            if (self->_permission == 2)
              v17 = 255;
            else
              v17 = AccessPermissions;
            v50 = 0u;
            v51 = 0u;
            v52 = 0u;
            v53 = 0u;
            v18 = objc_msgSend(&unk_24C27DBD8, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
            if (v18)
            {
              v20 = v18;
              v21 = *(_QWORD *)v51;
              do
              {
                for (i = 0; i != v20; ++i)
                {
                  if (*(_QWORD *)v51 != v21)
                    objc_enumerationMutation(&unk_24C27DBD8);
                  -[PDFDocument willChangeValueForKey:](self, "willChangeValueForKey:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
                }
                v20 = objc_msgSend(&unk_24C27DBD8, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
              }
              while (v20);
            }
            self->_allowsPrinting = (v17 & 3) != 0;
            v19.i64[0] = *(_QWORD *)&vshl_u16((uint16x4_t)(*(_QWORD *)&vdup_n_s16(v17) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFBFFFDFFFEFFFCLL) & 0xFF01FF01FF01FF01;
            *(_DWORD *)&self->_allowsCopying = vmovn_s16(v19).u32[0];
            self->_allowsCommenting = (v17 & 0x40) != 0;
            self->_allowsFormFieldEntry = (v17 & 0x80) != 0;
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            v23 = objc_msgSend(&unk_24C27DBD8, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v47;
              do
              {
                for (j = 0; j != v24; ++j)
                {
                  if (*(_QWORD *)v47 != v25)
                    objc_enumerationMutation(&unk_24C27DBD8);
                  -[PDFDocument didChangeValueForKey:](self, "didChangeValueForKey:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
                }
                v24 = objc_msgSend(&unk_24C27DBD8, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
              }
              while (v24);
            }
            if (!self->_isUnlocked)
            {
              self->_isUnlocked = CGPDFDocumentIsUnlocked(self->_document);
              self->_pageCount = CGPDFDocumentGetNumberOfPages(self->_document);
              akDocumentAdaptor = self->_akDocumentAdaptor;
              if (akDocumentAdaptor)
                -[PDFAKDocumentAdaptor pdfDocumentDidRemoveAllPagesOrPlaceholders:](akDocumentAdaptor, "pdfDocumentDidRemoveAllPagesOrPlaceholders:", self);
              v28 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", self->_pageCount);
              pages = self->_pages;
              self->_pages = v28;

              if (self->_pageCount)
              {
                v30 = 0;
                do
                {
                  v31 = v30 + 1;
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v30 + 1);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableArray addObject:](self->_pages, "addObject:", v32);
                  pageIndices = self->_pageIndices;
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v30);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v30);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableDictionary setObject:forKey:](pageIndices, "setObject:forKey:", v34, v35);

                  v30 = v31;
                }
                while (self->_pageCount > v31);
              }
              objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", self->_pages);
              v36 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
              pagesOrderedSet = self->_pagesOrderedSet;
              self->_pagesOrderedSet = v36;

              if (self->_pageCount)
              {
                v38 = 0;
                do
                {
                  -[NSMutableArray objectAtIndex:](self->_pages, "objectAtIndex:", v38);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    document = self->_document;
                    ++v38;
                    v41 = v39;
                    objc_msgSend(v41, "setPageRef:", CGPDFDocumentGetPage(document, v38));

                  }
                  else
                  {
                    ++v38;
                  }

                }
                while (v38 < self->_pageCount);
              }
            }
            objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "postNotificationName:object:", CFSTR("PDFDocumentDidUnlock"), self);

            if (self->_respondsToDidUnlock)
            {
              WeakRetained = objc_loadWeakRetained(&self->_delegate);
              objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("PDFDocumentDidUnlock"), self);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(WeakRetained, "documentDidUnlock:", v44);

            }
LABEL_45:
            v5 = 1;
LABEL_47:

            goto LABEL_48;
          }
          v11 = &stru_24C25F170;
        }
        v14 = (NSString *)-[__CFString copy](v11, "copy");
        userPassword = self->_userPassword;
        self->_userPassword = v14;

        goto LABEL_13;
      }
      if (self->_permission == 1)
        goto LABEL_45;
    }
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    if (CGPDFDocumentAuthenticateUserPassword())
    {
      -[PDFDocument willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("permissionsStatus"));
      self->_permission = 1;
      v12 = (NSString *)-[NSString copy](v4, "copy");
      v13 = self->_userPassword;
      self->_userPassword = v12;

      -[PDFDocument didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("permissionsStatus"));
    }
    goto LABEL_13;
  }
  v5 = 1;
LABEL_48:

  return v5;
}

- (id)passwordUsedForUnlocking
{
  int64_t permission;
  uint64_t v3;

  permission = self->_permission;
  if (permission == 2)
  {
    v3 = 152;
    return *(id *)((char *)&self->super.isa + v3);
  }
  if (permission == 1)
  {
    v3 = 160;
    return *(id *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (void)requirePasswordsIfNeededUsingPresentingViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t permission;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  id location;
  _QWORD v32[4];
  id v33;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  permission = self->_permission;
  if (permission == 1)
  {
    v10 = CFSTR("Owner password");
    v11 = CFSTR("Enter the owner password to unlock saving.");
    v12 = CFSTR("Without the owner password, you do not have permission to save this document.");
    goto LABEL_9;
  }
  if (permission == 2 && !self->_userPassword && self->_accessPermissions < 0xFF)
  {
    v10 = CFSTR("User password");
    v11 = CFSTR("Enter the user password to preserve those permissions.");
    v12 = CFSTR("This document has custom access permissions for the user password");
LABEL_9:
    PDFKitLocalizedString(v12);
    v13 = objc_claimAutoreleasedReturnValue();
    PDFKitLocalizedString(v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PDFKitLocalizedString(v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)v13;
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v13, v14, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __80__PDFDocument_requirePasswordsIfNeededUsingPresentingViewController_completion___block_invoke;
    v32[3] = &unk_24C25DCC8;
    v18 = v15;
    v33 = v18;
    objc_msgSend(v16, "addTextFieldWithConfigurationHandler:", v32);
    objc_initWeak(&location, v16);
    PDFKitLocalizedString(CFSTR("Unlock Document"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v17;
    v29[1] = 3221225472;
    v29[2] = __80__PDFDocument_requirePasswordsIfNeededUsingPresentingViewController_completion___block_invoke_2;
    v29[3] = &unk_24C25CC38;
    v20 = v8;
    v29[4] = self;
    v30 = v20;
    v27[0] = v17;
    v27[1] = 3221225472;
    v27[2] = __80__PDFDocument_requirePasswordsIfNeededUsingPresentingViewController_completion___block_invoke_3;
    v27[3] = &unk_24C25DCF0;
    objc_copyWeak(&v28, &location);
    v27[4] = self;
    objc_msgSend(v16, "_addActionWithTitle:style:handler:shouldDismissHandler:", v19, 0, v29, v27);

    v21 = (void *)MEMORY[0x24BDF67E8];
    PDFKitLocalizedString(CFSTR("Cancel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v17;
    v25[1] = 3221225472;
    v25[2] = __80__PDFDocument_requirePasswordsIfNeededUsingPresentingViewController_completion___block_invoke_4;
    v25[3] = &unk_24C25DD18;
    v26 = v20;
    objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 1, v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "addAction:", v23);
    objc_msgSend(v6, "presentViewController:animated:completion:", v16, 1, 0);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

    goto LABEL_10;
  }
  if (v7)
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 2);
LABEL_10:

}

void __80__PDFDocument_requirePasswordsIfNeededUsingPresentingViewController_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setPlaceholder:", v2);
  objc_msgSend(v3, "setSecureTextEntry:", 1);

}

uint64_t __80__PDFDocument_requirePasswordsIfNeededUsingPresentingViewController_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "_canSaveWithEncryption");
    if ((_DWORD)result)
      return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __80__PDFDocument_requirePasswordsIfNeededUsingPresentingViewController_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "textFields");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(_QWORD **)(a1 + 32);
    if (v7[18] == 2)
    {
      objc_msgSend(v7, "_SASLSanitize:", v6);
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v8, "UTF8String");
      if (CGPDFDocumentAuthenticateUserPassword())
      {
        v9 = objc_msgSend(v6, "copy");
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(v10 + 160);
        *(_QWORD *)(v10 + 160) = v9;

      }
    }
    else
    {
      objc_msgSend(v7, "unlockWithPassword:", v6);
    }
    v12 = objc_msgSend(*(id *)(a1 + 32), "_canSaveWithEncryption");
    if ((v12 & 1) == 0)
    {
      objc_msgSend(v3, "textFields");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setText:", 0);

      v15 = objc_alloc(MEMORY[0x24BDD1458]);
      PDFKitLocalizedString(CFSTR("Invalid Password"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = *MEMORY[0x24BDF6600];
      objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v17;
      v23[1] = *MEMORY[0x24BDF65F8];
      v18 = (void *)MEMORY[0x24BDF6A70];
      objc_msgSend(MEMORY[0x24BDF6A70], "smallSystemFontSize");
      objc_msgSend(v18, "systemFontOfSize:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v15, "initWithString:attributes:", v16, v20);
      objc_msgSend(v3, "_setAttributedMessage:", v21);

    }
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

uint64_t __80__PDFDocument_requirePasswordsIfNeededUsingPresentingViewController_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (BOOL)_canSaveWithEncryption
{
  return !-[PDFDocument isEncrypted](self, "isEncrypted")
      || self->_permission == 2 && (self->_accessPermissions > 0xFE || self->_userPassword);
}

- (BOOL)allowsPrinting
{
  return self->_allowsPrinting;
}

- (BOOL)allowsCopying
{
  return self->_allowsCopying;
}

- (BOOL)allowsDocumentChanges
{
  return self->_allowsDocumentChanges;
}

- (BOOL)allowsDocumentAssembly
{
  return self->_allowsDocumentAssembly;
}

- (BOOL)allowsContentAccessibility
{
  return self->_allowsContentAccessibility;
}

- (BOOL)allowsCommenting
{
  return self->_allowsCommenting;
}

- (BOOL)allowsFormFieldEntry
{
  return self->_allowsFormFieldEntry;
}

- (PDFDocumentPermissions)permissionsStatus
{
  return self->_permission;
}

- (PDFAccessPermissions)accessPermissions
{
  return (unint64_t)LOBYTE(self->_accessPermissions);
}

- (NSString)string
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;

  if (self->_isUnlocked)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    if (self->_pageCount)
    {
      v4 = 0;
      do
      {
        -[PDFDocument pageAtIndex:](self, "pageAtIndex:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "string");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          objc_msgSend(v3, "appendString:", v6);
          if (self->_pageCount - 1 > v4)
            objc_msgSend(v3, "appendString:", CFSTR("\n"));
        }

        ++v4;
      }
      while (self->_pageCount > v4);
    }
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setDelegate:(id)delegate
{
  void *v4;
  char v5;
  id v6;

  v6 = delegate;
  objc_storeWeak(&self->_delegate, v6);
  v4 = v6;
  if (v6)
  {
    self->_respondsToDidUnlock = objc_opt_respondsToSelector() & 1;
    self->_respondsToDidFindMatch = objc_opt_respondsToSelector() & 1;
    self->_respondsToDidBeginDocumentFind = objc_opt_respondsToSelector() & 1;
    self->_respondsToDidEndDocumentFind = objc_opt_respondsToSelector() & 1;
    self->_respondsToDidBeginPageFind = objc_opt_respondsToSelector() & 1;
    self->_respondsToDidEndPageFind = objc_opt_respondsToSelector() & 1;
    self->_respondsToDidMatchString = objc_opt_respondsToSelector() & 1;
    self->_respondsToClassForPage = objc_opt_respondsToSelector() & 1;
    self->_respondsToClassForAnnotationType = objc_opt_respondsToSelector() & 1;
    self->_respondsToClassForAnnotationClass = 0;
    self->_respondsToShouldReadAKInkAnnotations = objc_opt_respondsToSelector() & 1;
    self->_respondsToHandleTabFrom = objc_opt_respondsToSelector() & 1;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
  }
  else
  {
    v5 = 0;
    *(_DWORD *)&self->_respondsToDidEndDocumentFind = 0;
    *(_DWORD *)&self->_respondsToDidUnlock = 0;
    *(_DWORD *)&self->_respondsToClassForPage = 0;
    self->_respondsToHandleTabFrom = 0;
  }
  self->_respondsToDidReceiveAnalysis = v5 & 1;

}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (NSData)dataRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFDocument dataRepresentationWithOptions:](self, "dataRepresentationWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (NSData)dataRepresentationWithOptions:(NSDictionary *)options
{
  const __CFAllocator *v4;
  NSDictionary *v5;
  __CFData *Mutable;
  CGDataConsumer *v7;
  BOOL v8;

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = options;
  Mutable = CFDataCreateMutable(v4, 0);
  v7 = CGDataConsumerCreateWithCFData(Mutable);
  v8 = -[PDFDocument writeToConsumer:withOptions:](self, "writeToConsumer:withOptions:", v7, v5);

  if (v7)
    CGDataConsumerRelease(v7);
  if (!v8 && Mutable)
  {
    CFRelease(Mutable);
    Mutable = 0;
  }
  return (NSData *)Mutable;
}

- (BOOL)writeToFile:(NSString *)path
{
  return -[PDFDocument writeToFile:withOptions:](self, "writeToFile:withOptions:", path, 0);
}

- (BOOL)writeToFile:(NSString *)path withOptions:(NSDictionary *)options
{
  void *v6;
  NSDictionary *v7;
  void *v8;

  v6 = (void *)MEMORY[0x24BDBCF48];
  v7 = options;
  objc_msgSend(v6, "fileURLWithPath:", path);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PDFDocument writeToURL:withOptions:](self, "writeToURL:withOptions:", v8, v7);

  return (char)self;
}

- (BOOL)writeToURL:(NSURL *)url
{
  return -[PDFDocument writeToURL:withOptions:](self, "writeToURL:withOptions:", url, 0);
}

- (BOOL)writeToURL:(NSURL *)url withOptions:(NSDictionary *)options
{
  NSURL *v6;
  void *v7;
  NSDictionary *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFURL *v18;
  CGDataConsumer *v19;
  int v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v6 = url;
  v7 = (void *)MEMORY[0x24BDD1580];
  v8 = options;
  objc_msgSend(v7, "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](v6, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDBCF48];
    NSTemporaryDirectory();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fileURLWithPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BDD17C8];
    -[NSURL lastPathComponent](v6, "lastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR(".%@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLByAppendingPathComponent:", v17);
    v18 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = v6;
  }
  v19 = CGDataConsumerCreateWithURL(v18);
  v20 = -[PDFDocument writeToConsumer:withOptions:](self, "writeToConsumer:withOptions:", v19, v8);

  if ((v11 & v20) == 1)
  {
    v32 = 0;
    v21 = *MEMORY[0x24BDBCE00];
    -[NSURL getResourceValue:forKey:error:](v6, "getResourceValue:forKey:error:", &v32, *MEMORY[0x24BDBCE00], 0);
    v22 = v32;
    v31 = 0;
    -[__CFURL getResourceValue:forKey:error:](v18, "getResourceValue:forKey:error:", &v31, v21, 0);
    v23 = v31;
    v24 = v23;
    if (v22 && v23 && (objc_msgSend(v22, "isEqualToString:", v23) & 1) == 0)
    {
      v30 = 0;
      objc_msgSend(v9, "removeItemAtURL:error:", v6, &v30);
      v26 = v30;
      v29 = v26;
      LOBYTE(v20) = objc_msgSend(v9, "copyItemAtURL:toURL:error:", v18, v6, &v29);
      v25 = v29;

    }
    else
    {
      v28 = 0;
      LOBYTE(v20) = objc_msgSend(v9, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v6, v18, 0, 0, 0, &v28);
      v25 = v28;
    }

  }
  if (v19)
    CGDataConsumerRelease(v19);

  return v20;
}

- (PDFOutline)outlineRoot
{
  PDFDocument *v2;
  PDFOutline *outline;
  PDFOutline *v4;
  CGPDFDocument *document;
  CGPDFDictionary *Catalog;
  PDFOutline *v7;
  uint64_t v8;
  PDFOutline *v9;
  PDFOutline *v10;
  CGPDFDictionaryRef value;

  v2 = self;
  objc_sync_enter(v2);
  outline = v2->_outline;
  if (!outline)
  {
    document = v2->_document;
    if (!document || !v2->_isUnlocked)
    {
      v4 = 0;
      goto LABEL_11;
    }
    Catalog = CGPDFDocumentGetCatalog(document);
    if (Catalog)
    {
      value = 0;
      if (CGPDFDictionaryGetDictionary(Catalog, "Outlines", &value))
      {
        v7 = [PDFOutline alloc];
        v8 = -[PDFOutline initWithDictionary:forDocument:parent:](v7, "initWithDictionary:forDocument:parent:", value, v2, 0);
        v9 = v2->_outline;
        v2->_outline = (PDFOutline *)v8;

        if (!-[PDFOutline numberOfChildren](v2->_outline, "numberOfChildren"))
        {
          v10 = v2->_outline;
          v2->_outline = 0;

        }
      }
    }
    outline = v2->_outline;
  }
  v4 = outline;
LABEL_11:
  objc_sync_exit(v2);

  return v4;
}

- (void)setOutlineRoot:(PDFOutline *)outlineRoot
{
  PDFOutline *v4;
  PDFOutline *outline;
  PDFDocument *obj;

  v4 = outlineRoot;
  obj = self;
  objc_sync_enter(obj);
  outline = obj->_outline;
  obj->_outline = v4;

  objc_sync_exit(obj);
}

- (PDFOutline)outlineItemForSelection:(PDFSelection *)selection
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  if (selection)
  {
    -[PDFSelection asDestination](selection, "asDestination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[PDFDocument outlineRoot](self, "outlineRoot");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        v7 = v5;
        v8 = 0;
        do
        {
          v9 = v8;
          v8 = v7;

          -[PDFDocument _getNearestOutline:forDestination:](self, "_getNearestOutline:forDestination:", v8, v4);
          v7 = (id)objc_claimAutoreleasedReturnValue();

        }
        while (v7 != v8);

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return (PDFOutline *)v8;
}

- (NSUInteger)pageCount
{
  return self->_pageCount;
}

- (PDFPage)pageAtIndex:(NSUInteger)index
{
  NSMutableArray *v5;
  void *v6;
  NSMutableDictionary *pageIndices;
  void *v8;
  void *v9;
  _BOOL4 v10;
  double x;
  double y;
  double width;
  double height;
  uint64_t v15;
  CGPDFPage *Page;
  CGPDFPage *RotationAngle;
  id v18;
  void *v19;
  objc_class *v20;
  id v21;
  NSOrderedSet *v22;
  NSOrderedSet *pagesOrderedSet;
  CGRect BoxRect;
  CGRect v26;

  v5 = self->_pages;
  objc_sync_enter(v5);
  if (self->_pageCount > index)
  {
    -[NSMutableArray objectAtIndex:](self->_pages, "objectAtIndex:", index);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18 = v6;
      if ((objc_msgSend(v18, "akDidSetupRealPageModelController") & 1) == 0)
        -[PDFDocument _notifyAKAdaptorPagePlaceholder:wasReplacedWithPage:atIndex:](self, "_notifyAKAdaptorPagePlaceholder:wasReplacedWithPage:atIndex:", 0, v18, index);
      goto LABEL_25;
    }
    pageIndices = self->_pageIndices;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", index);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](pageIndices, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[PDFDocument isLinearized](self, "isLinearized");
    x = *MEMORY[0x24BDBF070];
    y = *(double *)(MEMORY[0x24BDBF070] + 8);
    width = *(double *)(MEMORY[0x24BDBF070] + 16);
    height = *(double *)(MEMORY[0x24BDBF070] + 24);
    if (v10 && -[PDFDocument hasHighLatencyDataProvider](self, "hasHighLatencyDataProvider"))
    {
      objc_msgSend(v9, "intValue");
      v15 = CGPDFDocumentGetPageNoCreate();
      if (!v15)
      {
        Page = CGPDFDocumentGetPage(self->_document, 1uLL);
        RotationAngle = Page;
        if (Page)
        {
          BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
          x = BoxRect.origin.x;
          y = BoxRect.origin.y;
          width = BoxRect.size.width;
          height = BoxRect.size.height;
          v15 = 0;
          RotationAngle = (CGPDFPage *)CGPDFPageGetRotationAngle(RotationAngle);
        }
        else
        {
          v15 = 0;
        }
LABEL_13:
        if (self->_respondsToClassForPage)
        {
          -[PDFDocument delegate](self, "delegate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (objc_class *)objc_msgSend(v19, "classForPage");

          if (v15)
          {
LABEL_15:
            v21 = (id)objc_msgSend([v20 alloc], "initWithPageRef:", v15);
LABEL_20:
            v18 = v21;
            objc_msgSend(v21, "setDocument:", self);
            -[NSMutableArray replaceObjectAtIndex:withObject:](self->_pages, "replaceObjectAtIndex:withObject:", index, v18);
            if (self->_pagesOrderedSet)
            {
              objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", self->_pages);
              v22 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
              pagesOrderedSet = self->_pagesOrderedSet;
              self->_pagesOrderedSet = v22;

            }
            -[PDFDocument _notifyAKAdaptorPagePlaceholder:wasReplacedWithPage:atIndex:](self, "_notifyAKAdaptorPagePlaceholder:wasReplacedWithPage:atIndex:", v6, v18, index);
            if (-[NSMutableIndexSet containsIndex:](self->_bookmarkedPages, "containsIndex:", (int)objc_msgSend(v9, "intValue")))objc_msgSend(v18, "setBookmarked:updateBookmarks:", 1, 0);

LABEL_25:
            goto LABEL_26;
          }
        }
        else
        {
          v20 = -[PDFDocument pageClass](self, "pageClass");
          if (v15)
            goto LABEL_15;
        }
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        if (CGRectIsNull(v26))
          v21 = objc_alloc_init(v20);
        else
          v21 = (id)objc_msgSend([v20 alloc], "initWithPageNumber:pageRect:rotation:", (int)(objc_msgSend(v9, "intValue") + 1), RotationAngle, x, y, width, height);
        goto LABEL_20;
      }
    }
    else
    {
      v15 = (uint64_t)CGPDFDocumentGetPage(self->_document, (int)(objc_msgSend(v9, "intValue") + 1));
    }
    RotationAngle = 0;
    goto LABEL_13;
  }
  v18 = 0;
LABEL_26:
  objc_sync_exit(v5);

  return (PDFPage *)v18;
}

- (id)_rawPageAtIndex:(unint64_t)a3
{
  void *v5;
  NSMutableArray *v6;

  if (!self->_subclassOverridesPageAtIndex)
  {
    if (self->_pageCount > a3)
    {
      v6 = self->_pages;
      objc_sync_enter(v6);
      -[NSMutableArray objectAtIndex:](self->_pages, "objectAtIndex:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_exit(v6);

      return v5;
    }
LABEL_6:
    v5 = 0;
    return v5;
  }
  if (-[PDFDocument pageCount](self, "pageCount") <= a3)
    goto LABEL_6;
  -[PDFDocument pageAtIndex:](self, "pageAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (NSUInteger)indexForPage:(PDFPage *)page
{
  PDFPage *v4;
  NSMutableArray *v5;
  NSUInteger v6;

  v4 = page;
  v5 = self->_pages;
  objc_sync_enter(v5);
  v6 = -[NSOrderedSet indexOfObject:](self->_pagesOrderedSet, "indexOfObject:", v4);
  objc_sync_exit(v5);

  return v6;
}

- (void)insertPage:(PDFPage *)page atIndex:(NSUInteger)index
{
  PDFPage *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSOrderedSet *v14;
  NSOrderedSet *pagesOrderedSet;
  void *v16;
  unint64_t pageCount;
  int v18;
  NSMutableDictionary *pageIndices;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  NSMutableDictionary *v24;
  void *v25;
  PDFDocumentPermissions v26;
  const __CFString *v27;
  void *v28;
  NSMutableArray *obj;
  void *v30;
  id WeakRetained;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = page;
  if (v6)
  {
    if (-[PDFDocument allowsDocumentAssembly](self, "allowsDocumentAssembly"))
    {
      if (-[PDFDocument isFinding](self, "isFinding"))
        -[PDFDocument cancelFindString](self, "cancelFindString");
      WeakRetained = objc_loadWeakRetained((id *)&self->_pageChangeDelegate);
      obj = self->_pages;
      objc_sync_enter(obj);
      v7 = (void *)objc_opt_class();
      objc_msgSend(v7, "_getDocumentID:", CGPDFPageGetDocument(-[PDFPage pageRef](v6, "pageRef")));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_getDocumentID:", -[PDFDocument documentRef](self, "documentRef"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v30 && v8 && (objc_msgSend(v30, "isEqual:", v8) & 1) == 0)
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        -[PDFPage annotations](v6, "annotations");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v33 != v12)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "clearFormData");
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          }
          while (v11);
        }

      }
      if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "willInsertPage:atIndex:", v6, index);
      -[NSMutableArray insertObject:atIndex:](self->_pages, "insertObject:atIndex:", v6, index);
      objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", self->_pages);
      v14 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
      pagesOrderedSet = self->_pagesOrderedSet;
      self->_pagesOrderedSet = v14;

      -[PDFPage setDocument:](v6, "setDocument:", self);
      v16 = v9;
      pageCount = self->_pageCount;
      if (pageCount && (int)pageCount > (int)index)
      {
        do
        {
          v18 = pageCount - 1;
          pageIndices = self->_pageIndices;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (pageCount - 1));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](pageIndices, "objectForKey:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            v22 = self->_pageIndices;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (pageCount - 1));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary removeObjectForKey:](v22, "removeObjectForKey:", v23);

            v24 = self->_pageIndices;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", pageCount);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v21, v25);

          }
          pageCount = (pageCount - 1);
        }
        while (v18 > (int)index);
        pageCount = self->_pageCount;
        v16 = v9;
      }
      self->_pageCount = pageCount + 1;
      if (self->_akDocumentAdaptor)
      {
        -[PDFPage setupAKPageAdaptorIfNecessary](v6, "setupAKPageAdaptorIfNecessary");
        -[PDFAKDocumentAdaptor pdfDocument:didInsertPage:atIndex:](self->_akDocumentAdaptor, "pdfDocument:didInsertPage:atIndex:", self, v6, index);
      }
      if (self->_document)
      {
        if (-[PDFPage pageRef](v6, "pageRef"))
          CGPDFDocumentInsertPageAtIndex();
        else
          self->_pagesChanged.blankPagesAdded = 1;
      }

      objc_sync_exit(obj);
      if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "didInsertPage:atIndex:", v6, index);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "postNotificationName:object:", CFSTR("PDFDocumentDidMutate"), self);

      self->_documentChanged = 1;
      self->_pagesChanged.pagesAdded = 1;

    }
    else
    {
      v26 = -[PDFDocument permissionsStatus](self, "permissionsStatus");
      v27 = CFSTR("user");
      if (v26 == kPDFDocumentPermissionsOwner)
        v27 = CFSTR("owner");
      NSLog(CFSTR("PDFDocument's insertPage:atIndex: failed. PDF document's %@ permissions does not allow document assembly."), v27);
    }
  }

}

- (void)removePageAtIndex:(NSUInteger)index
{
  id WeakRetained;
  NSMutableArray *v6;
  NSOrderedSet *v7;
  NSOrderedSet *pagesOrderedSet;
  NSMutableDictionary *pageIndices;
  void *v10;
  unint64_t pageCount;
  NSUInteger v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  unint64_t v20;
  PDFAKDocumentAdaptor *akDocumentAdaptor;
  CGPDFDocument *document;
  void *v23;
  PDFDocumentPermissions v24;
  const __CFString *v25;
  id v26;

  if (-[PDFDocument allowsDocumentAssembly](self, "allowsDocumentAssembly"))
  {
    if (self->_pageCount > index)
    {
      if (-[PDFDocument isFinding](self, "isFinding"))
        -[PDFDocument cancelFindString](self, "cancelFindString");
      WeakRetained = objc_loadWeakRetained((id *)&self->_pageChangeDelegate);
      v6 = self->_pages;
      objc_sync_enter(v6);
      -[PDFDocument pageAtIndex:](self, "pageAtIndex:", index);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "willRemovePage:atIndex:", v26, index);
        -[NSMutableArray removeObjectAtIndex:](self->_pages, "removeObjectAtIndex:", index);
        objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", self->_pages);
        v7 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
        pagesOrderedSet = self->_pagesOrderedSet;
        self->_pagesOrderedSet = v7;

        objc_msgSend(v26, "setDocument:", 0);
        pageIndices = self->_pageIndices;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", index);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](pageIndices, "removeObjectForKey:", v10);

        pageCount = self->_pageCount;
        if (index + 1 < pageCount)
        {
          v12 = index;
          do
          {
            v13 = self->_pageIndices;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12 + 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKey:](v13, "objectForKey:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              v16 = self->_pageIndices;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12 + 1);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary removeObjectForKey:](v16, "removeObjectForKey:", v17);

              v18 = self->_pageIndices;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v15, v19);

            }
            pageCount = self->_pageCount;
            v20 = v12 + 2;
            ++v12;
          }
          while (v20 < pageCount);
        }
        self->_pageCount = pageCount - 1;
        akDocumentAdaptor = self->_akDocumentAdaptor;
        if (akDocumentAdaptor)
          -[PDFAKDocumentAdaptor pdfDocument:didRemovePage:atIndex:](akDocumentAdaptor, "pdfDocument:didRemovePage:atIndex:", self, v26, index);
        if (self->_document)
        {
          if (objc_msgSend(v26, "pageRef"))
          {
            document = self->_document;
            if (document == CGPDFPageGetDocument((CGPDFPageRef)objc_msgSend(v26, "pageRef")))
              CGPDFDocumentRemovePageAtIndex();
          }
        }
        objc_sync_exit(v6);

        if (WeakRetained)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(WeakRetained, "didRemovePage:atIndex:", v26, index);
        }
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "postNotificationName:object:", CFSTR("PDFDocumentDidMutate"), self);

        self->_documentChanged = 1;
        self->_pagesChanged.pagesRemoved = 1;
      }
      else
      {
        objc_sync_exit(v6);

      }
    }
  }
  else
  {
    v24 = -[PDFDocument permissionsStatus](self, "permissionsStatus");
    v25 = CFSTR("user");
    if (v24 == kPDFDocumentPermissionsOwner)
      v25 = CFSTR("owner");
    NSLog(CFSTR("PDFDocument's removePageAtIndex: failed. PDF document's %@ permissions does not allow document assembly."), v25);
  }
}

- (void)exchangePageAtIndex:(NSUInteger)indexA withPageAtIndex:(NSUInteger)indexB
{
  NSUInteger pageCount;
  id WeakRetained;
  NSMutableDictionary *pageIndices;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  NSOrderedSet *v21;
  NSOrderedSet *pagesOrderedSet;
  void *v23;
  PDFDocumentPermissions v24;
  const __CFString *v25;
  NSMutableArray *obj;
  id v27;

  if (-[PDFDocument allowsDocumentAssembly](self, "allowsDocumentAssembly"))
  {
    if (indexA != indexB)
    {
      pageCount = self->_pageCount;
      if (pageCount > indexA && pageCount > indexB)
      {
        if (-[PDFDocument isFinding](self, "isFinding"))
          -[PDFDocument cancelFindString](self, "cancelFindString");
        WeakRetained = objc_loadWeakRetained((id *)&self->_pageChangeDelegate);
        obj = self->_pages;
        objc_sync_enter(obj);
        pageIndices = self->_pageIndices;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", indexA);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](pageIndices, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = self->_pageIndices;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", indexB);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](v13, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableArray objectAtIndex:](self->_pages, "objectAtIndex:", indexA);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndex:](self->_pages, "objectAtIndex:", indexB);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "willSwapPage:atIndex:forPage:atIndex:", v27, indexA, v16, indexB);
        v17 = self->_pageIndices;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", indexB);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v12, v18);

        v19 = self->_pageIndices;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", indexA);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v15, v20);

        -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](self->_pages, "exchangeObjectAtIndex:withObjectAtIndex:", indexA, indexB);
        objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", self->_pages);
        v21 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
        pagesOrderedSet = self->_pagesOrderedSet;
        self->_pagesOrderedSet = v21;

        if (self->_akDocumentAdaptor)
        {
          objc_msgSend(v16, "setupAKPageAdaptorIfNecessary");
          -[PDFAKDocumentAdaptor pdfDocument:didExchangePage:atIndex:withPage:atIndex:](self->_akDocumentAdaptor, "pdfDocument:didExchangePage:atIndex:withPage:atIndex:", self, v27, indexA, v16, indexB);
        }
        if (self->_document)
          CGPDFDocumentExchangePagesAtIndices();

        objc_sync_exit(obj);
        if (WeakRetained)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(WeakRetained, "didSwapPage:atIndex:forPage:atIndex:", v27, indexA, v16, indexB);
        }
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "postNotificationName:object:", CFSTR("PDFDocumentDidMutate"), self);

        self->_documentChanged = 1;
        self->_pagesChanged.pagesExchanged = 1;

      }
    }
  }
  else
  {
    v24 = -[PDFDocument permissionsStatus](self, "permissionsStatus");
    v25 = CFSTR("user");
    if (v24 == kPDFDocumentPermissionsOwner)
      v25 = CFSTR("owner");
    NSLog(CFSTR("PDFDocument's exchangePageAtIndex:withPageAtIndex: failed. PDF document's %@ permissions does not allow document assembly."), v25);
  }
}

- (Class)pageClass
{
  return (Class)objc_opt_class();
}

- (NSArray)findString:(NSString *)string withOptions:(NSStringCompareOptions)options
{
  NSString *v6;
  NSString *v7;
  int64_t v8;
  NSMutableArray *v9;
  NSUInteger v10;

  v6 = string;
  v7 = v6;
  if (v6 && -[NSString length](v6, "length"))
  {
    self->_findModel = 0;
    if (-[PDFDocument isFinding](self, "isFinding"))
      -[PDFDocument cancelFindString](self, "cancelFindString");
    -[PDFDocument normalizeFindOptions:](self, "normalizeFindOptions:", options);
    if ((self->_findOptions & 4) != 0)
    {
      v10 = -[PDFDocument pageCount](self, "pageCount");
      v8 = 0;
      self->_findPageIndex = v10 - 1;
    }
    else
    {
      self->_findPageIndex = 0;
      v8 = -[PDFDocument pageCount](self, "pageCount") - 1;
    }
    self->_findCharIndex = -1;
    self->_lastFindPageIndex = v8;
    self->_lastFindCharIndex = -1;
    -[PDFDocument coreFindString:](self, "coreFindString:", v7);
    v9 = self->_findResults;
  }
  else
  {
    v9 = (NSMutableArray *)MEMORY[0x24BDBD1A8];
  }

  return (NSArray *)v9;
}

- (void)beginFindString:(NSString *)string withOptions:(NSStringCompareOptions)options
{
  NSString *v6;
  NSString *v7;
  uint64_t v8;
  void *v9;
  NSString *v10;

  v6 = string;
  v7 = v6;
  if (v6)
  {
    v10 = v6;
    v8 = -[NSString length](v6, "length");
    v7 = v10;
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFDocument beginFindStrings:withOptions:](self, "beginFindStrings:withOptions:", v9, options);

      v7 = v10;
    }
  }

}

- (void)beginFindStrings:(NSArray *)strings withOptions:(NSStringCompareOptions)options
{
  NSArray *v6;
  NSArray *v7;
  uint64_t v8;
  int64_t v9;
  NSUInteger v10;
  NSArray *v11;

  v6 = strings;
  v7 = v6;
  if (v6)
  {
    v11 = v6;
    v8 = -[NSArray count](v6, "count");
    v7 = v11;
    if (v8)
    {
      self->_findModel = 1;
      -[PDFDocument normalizeFindOptions:](self, "normalizeFindOptions:", options);
      if ((self->_findOptions & 4) != 0)
      {
        v10 = -[PDFDocument pageCount](self, "pageCount");
        v9 = 0;
        self->_findPageIndex = v10 - 1;
      }
      else
      {
        self->_findPageIndex = 0;
        v9 = -[PDFDocument pageCount](self, "pageCount") - 1;
      }
      self->_findCharIndex = -1;
      self->_lastFindPageIndex = v9;
      self->_lastFindCharIndex = -1;
      -[PDFDocument coreFindStrings:](self, "coreFindStrings:", v11);
      v7 = v11;
    }
  }

}

- (PDFSelection)findString:(NSString *)string fromSelection:(PDFSelection *)selection withOptions:(NSStringCompareOptions)options
{
  NSString *v8;
  PDFSelection *v9;
  void *v10;

  v8 = string;
  v9 = selection;
  if (v8 && -[NSString length](v8, "length"))
  {
    self->_findModel = 2;
    -[PDFDocument _findString:fromSelection:withOptions:](self, "_findString:fromSelection:withOptions:", v8, v9, options);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return (PDFSelection *)v10;
}

- (id)findStringPerPage:(id)a3 fromSelection:(id)a4 withOptions:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  if (v8 && objc_msgSend(v8, "length"))
  {
    self->_findModel = 3;
    -[PDFDocument _findString:fromSelection:withOptions:](self, "_findString:fromSelection:withOptions:", v8, v9, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_findString:(id)a3 fromSelection:(id)a4 withOptions:(unint64_t)a5
{
  id v8;
  id v9;
  int64_t v10;
  NSUInteger v11;
  int v12;
  int findModel;
  void *v14;
  void *v15;
  PDFDocument *v16;
  PDFSelection *findInstance;
  PDFSelection *v18;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  int64_t findPageIndex;
  int64_t v25;

  v8 = a3;
  v9 = a4;
  -[PDFDocument normalizeFindOptions:](self, "normalizeFindOptions:", a5);
  if ((self->_findOptions & 4) != 0)
  {
    v11 = -[PDFDocument pageCount](self, "pageCount");
    v10 = 0;
    self->_findPageIndex = v11 - 1;
  }
  else
  {
    self->_findPageIndex = 0;
    v10 = -[PDFDocument pageCount](self, "pageCount") - 1;
  }
  self->_findCharIndex = -1;
  self->_lastFindPageIndex = v10;
  self->_lastFindCharIndex = -1;
  if (!v9)
    goto LABEL_16;
  v12 = objc_msgSend(v9, "isEmpty");
  findModel = self->_findModel;
  if (v12)
  {
    if (findModel != 3)
      goto LABEL_16;
    goto LABEL_9;
  }
  if (findModel == 3)
  {
LABEL_9:
    objc_msgSend(v9, "pages");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  if ((self->_findOptions & 4) != 0)
    objc_msgSend(v9, "firstPage");
  else
    objc_msgSend(v9, "lastPage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
  objc_msgSend(v15, "document");
  v16 = (PDFDocument *)objc_claimAutoreleasedReturnValue();

  if (v16 == self)
  {
    self->_findPageIndex = -[PDFDocument indexForPage:](self, "indexForPage:", v15);
    if (objc_msgSend(v15, "numberOfCharacters"))
    {
      if ((self->_findOptions & 4) != 0)
      {
        v23 = objc_msgSend(v9, "pdfKitIndexOfFirstCharacterOnPage:", v15);
        self->_findCharIndex = v23 - 1;
        if (v23 - 1 < 0)
        {
          while (1)
          {
            findPageIndex = self->_findPageIndex;
            if (!findPageIndex)
              goto LABEL_29;
            self->_findPageIndex = findPageIndex - 1;
            -[PDFDocument pageAtIndex:](self, "pageAtIndex:");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v22, "numberOfCharacters"))
            {
              v25 = objc_msgSend(v22, "numberOfCharacters") - 1;
LABEL_32:
              self->_findCharIndex = v25;

              break;
            }

          }
        }
      }
      else
      {
        v20 = objc_msgSend(v9, "pdfKitIndexOfLastCharacterOnPage:", v15) + 1;
        self->_findCharIndex = v20;
        if (v20 >= objc_msgSend(v15, "numberOfCharacters"))
        {
          while (1)
          {
            v21 = self->_findPageIndex + 1;
            if (v21 >= -[PDFDocument pageCount](self, "pageCount"))
              break;
            ++self->_findPageIndex;
            -[PDFDocument pageAtIndex:](self, "pageAtIndex:");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v22, "numberOfCharacters"))
            {
              v25 = 0;
              goto LABEL_32;
            }

          }
LABEL_29:

          v18 = 0;
          goto LABEL_17;
        }
      }
    }
  }

LABEL_16:
  findInstance = self->_findInstance;
  self->_findInstance = 0;

  -[PDFDocument coreFindString:](self, "coreFindString:", v8);
  v18 = self->_findInstance;
LABEL_17:

  return v18;
}

- (void)didMatchString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[NSMutableArray addObject:](self->_findResults, "addObject:");
  if (self->_respondsToDidFindMatch)
  {
    -[PDFDocument delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD16C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v10, CFSTR("PDFDocumentFoundSelection"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notificationWithName:object:userInfo:", CFSTR("PDFDidFindMatch"), self, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "documentDidFindMatch:", v7);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v10, CFSTR("PDFDocumentFoundSelection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("PDFDidFindMatch"), self, v9);

}

- (BOOL)isFinding
{
  return self->_finding;
}

- (void)cancelFindString
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16D8], "defaultQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("pdfDocumentFindNext"), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueNotificationsMatching:coalesceMask:", v4, 0);

  -[PDFDocument cleanupFind](self, "cleanupFind");
}

- (void)asyncFindStrings:(id)a3 withOptions:(unint64_t)a4 withDelegate:(id)a5 onQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  OS_dispatch_queue *v14;
  OS_dispatch_queue *asyncSearchQueue;
  id v16;
  void *v17;
  id v18;
  char IsOCREnabled;
  char v20;
  char v21;
  char v22;
  void *v23;
  char v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  _QWORD *v37;
  _QWORD *v38;
  id v39;
  id v40[2];
  char v41;
  char v42;
  char v43;
  char v44;
  _QWORD v45[4];
  int v46;
  id from;
  id location;
  _QWORD v49[3];
  NSUInteger v50;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!self->_asyncSearchQueue)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (OS_dispatch_queue *)dispatch_queue_create("PDFDocument.asyncFindString", v13);
    asyncSearchQueue = self->_asyncSearchQueue;
    self->_asyncSearchQueue = v14;

  }
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v50 = 0;
  v50 = -[PDFDocument pageCount](self, "pageCount");
  v16 = v12;
  v17 = v16;
  if (!v16)
  {
    v17 = (void *)MEMORY[0x24BDAC9B8];
    v18 = MEMORY[0x24BDAC9B8];
  }
  IsOCREnabled = PDFKitIsOCREnabled();
  v20 = objc_opt_respondsToSelector();
  v32 = (void *)a4;
  v21 = objc_opt_respondsToSelector();
  v22 = objc_opt_respondsToSelector();
  v29 = v10;
  v31 = v16;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v11);
  v30 = v11;
  v23 = (void *)objc_opt_new();
  v24 = v21 & 1;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2810000000;
  v45[3] = &unk_209DCC48F;
  v46 = 0;
  v25 = self->_asyncSearchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[2] = __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke;
  block[3] = &unk_24C25DE18;
  v37 = v49;
  block[1] = 3221225472;
  objc_copyWeak(&v39, &from);
  v41 = v20 & 1;
  objc_copyWeak(v40, &location);
  v42 = IsOCREnabled;
  v40[1] = v32;
  v43 = v24;
  v34 = v29;
  v35 = v17;
  v38 = v45;
  v36 = v23;
  v44 = v22 & 1;
  v26 = v23;
  v27 = v17;
  v28 = v29;
  dispatch_async(v25, block);

  objc_destroyWeak(v40);
  objc_destroyWeak(&v39);
  _Block_object_dispose(v45, 8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  _Block_object_dispose(v49, 8);

}

void __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke(uint64_t a1)
{
  size_t v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16[2];
  char v17;
  char v18;
  char v19;
  char v20;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_2;
  block[3] = &unk_24C25DDF0;
  objc_copyWeak(&v15, (id *)(a1 + 72));
  v17 = *(_BYTE *)(a1 + 96);
  objc_copyWeak(v16, (id *)(a1 + 80));
  v18 = *(_BYTE *)(a1 + 97);
  v3 = *(id *)(a1 + 32);
  v4 = *(void **)(a1 + 88);
  v10 = v3;
  v16[1] = v4;
  v19 = *(_BYTE *)(a1 + 98);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 64);
  v11 = v5;
  v13 = v6;
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v12 = v7;
  v14 = v8;
  v20 = *(_BYTE *)(a1 + 99);
  dispatch_apply(v2, 0, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&v15);
}

void __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_semaphore_t v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  uint64_t *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _QWORD v48[4];
  dispatch_semaphore_t v49;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v5 = WeakRetained;
  if (WeakRetained && (!*(_BYTE *)(a1 + 96) || (objc_msgSend(WeakRetained, "cancelFind") & 1) == 0))
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 80));
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "pageAtIndex:", a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (*(_BYTE *)(a1 + 97)
        && (objc_msgSend(v8, "isTextFromOCR") & 1) == 0
        && +[PDFPageEvaluator isPageCandidateForOCR:](PDFPageEvaluator, "isPageCandidateForOCR:", v9))
      {
        v10 = dispatch_semaphore_create(0);
        +[PDFPageAnalyzer sharedInstance](PDFPageAnalyzer, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = MEMORY[0x24BDAC760];
        v48[1] = 3221225472;
        v48[2] = __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_3;
        v48[3] = &unk_24C25DB28;
        v49 = v10;
        v12 = v10;
        objc_msgSend(v11, "analyzePage:analysisTypes:completionQueue:completionBlock:", v9, 1, 0, v48);

        v13 = dispatch_time(0, 3000000000);
        dispatch_semaphore_wait(v12, v13);

      }
      objc_msgSend(v9, "string");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v42 = 0;
      v43 = &v42;
      v44 = 0x3032000000;
      v45 = __Block_byref_object_copy__4;
      v46 = __Block_byref_object_dispose__4;
      v47 = 0;
      v38 = 0;
      v39 = &v38;
      v40 = 0x2020000000;
      v41 = 0;
      if (v14)
      {
        v16 = *(void **)(a1 + 32);
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_4;
        v32[3] = &unk_24C25DD40;
        v17 = v14;
        v18 = *(_QWORD *)(a1 + 88);
        v33 = v17;
        v35 = &v38;
        v36 = &v42;
        v37 = v18;
        v34 = v9;
        objc_msgSend(v16, "enumerateObjectsUsingBlock:", v32);
        v19 = *((int *)v39 + 6);
        if (objc_msgSend(*(id *)(a1 + 32), "count") > v19)
        {
          v20 = (void *)v43[5];
          v43[5] = 0;

        }
        if (v43[5] && (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 2)
          objc_msgSend((id)v43[5], "sortUsingComparator:", &__block_literal_global_14);

      }
      if (*(_BYTE *)(a1 + 98))
      {
        v21 = *(NSObject **)(a1 + 40);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_6;
        block[3] = &unk_24C25DD88;
        v29 = v5;
        v31 = &v42;
        v30 = v9;
        dispatch_async(v21, block);

      }
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
      if (v43[5])
        objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:");
      v22 = --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
      if (*(_BYTE *)(a1 + 99) && !v22)
      {
        objc_msgSend(*(id *)(a1 + 48), "sortWithOptions:usingComparator:", 16, &__block_literal_global_389);
        v23 = *(NSObject **)(a1 + 40);
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_8;
        v24[3] = &unk_24C25D110;
        v25 = v5;
        v26 = *(id *)(a1 + 48);
        v27 = v7;
        dispatch_async(v23, v24);

      }
      _Block_object_dispose(&v38, 8);
      _Block_object_dispose(&v42, 8);

    }
  }

}

intptr_t __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v19 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:range:", v19, *(_QWORD *)(a1 + 64), 0, objc_msgSend(*(id *)(a1 + 32), "length"));
  v8 = v7;
  if (v7)
  {
    v9 = v6;
    v10 = 1;
    v11 = v7;
    do
    {
      if ((v10 & 1) != 0)
        ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;

      }
      objc_msgSend(*(id *)(a1 + 40), "selectionForRange:", v9, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v15);
      v16 = v9 + v11;
      v17 = objc_msgSend(*(id *)(a1 + 32), "length") - v16;

      v9 = objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:range:", v19, *(_QWORD *)(a1 + 64), v16, v17);
      v11 = v18;
      v10 = 0;
    }
    while (v18);
  }
  *a4 = v8 == 0;

}

uint64_t __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void *__65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_6(_QWORD *a1)
{
  void *result;

  result = (void *)a1[4];
  if (result)
    return (void *)objc_msgSend(result, "foundResults:forPage:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5]);
  return result;
}

uint64_t __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(a2, "pages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexForPage:", v6);

  objc_msgSend(v4, "pages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "document");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexForPage:", v10);

  v13 = 1;
  if (v8 <= v12)
    v13 = -1;
  if (v8 < v12)
    v14 = -1;
  else
    v14 = v13;

  return v14;
}

void *__65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_8(_QWORD *a1)
{
  void *result;

  result = (void *)a1[4];
  if (result)
    return (void *)objc_msgSend(result, "foundResults:forDocument:", a1[5], a1[6]);
  return result;
}

- (void)asyncFindStrings:(id)a3 withDelegate:(id)a4 onQueue:(id)a5
{
  -[PDFDocument asyncFindStrings:withOptions:withDelegate:onQueue:](self, "asyncFindStrings:withOptions:withDelegate:onQueue:", a3, 1, a4, a5);
}

- (void)asyncFindString:(id)a3 withDelegate:(id)a4 onQueue:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PDFDocument asyncFindStrings:withOptions:withDelegate:onQueue:](self, "asyncFindStrings:withOptions:withDelegate:onQueue:", v12, 1, v10, v9, v13, v14);
}

- (PDFSelection)selectionForEntireDocument
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = -[PDFDocument pageCount](self, "pageCount");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    do
    {
      -[PDFDocument pageAtIndex:](self, "pageAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "selectionForAll");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v6)
      {
        objc_msgSend(v6, "addSelectionNoNormalize:", v8);

      }
      else
      {
        v6 = (void *)v8;
      }

      ++v5;
    }
    while (v4 != v5);
  }
  else
  {
    v6 = 0;
  }
  return (PDFSelection *)v6;
}

- (PDFSelection)selectionFromPage:(PDFPage *)startPage atPoint:(CGPoint)startPoint toPage:(PDFPage *)endPage atPoint:(CGPoint)endPoint
{
  return (PDFSelection *)-[PDFDocument selectionFromPage:atPoint:toPage:atPoint:type:](self, "selectionFromPage:atPoint:toPage:atPoint:type:", startPage, endPage, 0, startPoint.x, startPoint.y, endPoint.x, endPoint.y);
}

- (id)selectionFromPage:(id)a3 atPoint:(CGPoint)a4 toPage:(id)a5 atPoint:(CGPoint)a6 withGranularity:(unint64_t)a7
{
  uint64_t v7;

  if (a7 == 2)
    v7 = 2;
  else
    v7 = a7 == 1;
  return -[PDFDocument selectionFromPage:atPoint:toPage:atPoint:type:](self, "selectionFromPage:atPoint:toPage:atPoint:type:", a3, a5, v7, a4.x, a4.y, a6.x, a6.y);
}

- (PDFSelection)selectionFromPage:(PDFPage *)startPage atCharacterIndex:(NSUInteger)startCharacter toPage:(PDFPage *)endPage atCharacterIndex:(NSUInteger)endCharacter
{
  PDFPage *v10;
  PDFPage *v11;
  PDFDocument *v12;
  PDFDocument *v13;
  PDFDocument *v14;
  PDFPage *v15;
  PDFPage *v16;
  void *v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  PDFPage *v21;
  PDFPage *v22;
  NSUInteger v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  id v36;
  NSUInteger v38;
  PDFDocument *v39;

  v10 = startPage;
  v11 = endPage;
  -[PDFPage document](v10, "document");
  v12 = (PDFDocument *)objc_claimAutoreleasedReturnValue();
  -[PDFPage document](v11, "document");
  v13 = (PDFDocument *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  if (v12 == self && v13 == self)
  {
    if (v10 == v11)
    {
      -[PDFPage selectionForRange:](v10, "selectionForRange:", startCharacter, endCharacter - startCharacter + 1);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    v39 = v13;
    v18 = endCharacter;
    v19 = -[PDFDocument indexForPage:](self, "indexForPage:", v10);
    v20 = -[PDFDocument indexForPage:](self, "indexForPage:", v11);
    if (v19 >= v20)
      v21 = v11;
    else
      v21 = v10;
    if (v19 >= v20)
      v22 = v10;
    else
      v22 = v11;
    v38 = v18;
    if (v19 >= v20)
      v23 = v18;
    else
      v23 = startCharacter;
    v16 = v21;
    v15 = v22;
    -[PDFPage selectionForRange:](v16, "selectionForRange:", v23, -[PDFPage numberOfCharacters](v16, "numberOfCharacters") - v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFPage document](v16, "document");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "indexForPage:", v16);

    v26 = v25 + 1;
    -[PDFPage document](v15, "document");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "indexForPage:", v15);

    if (v26 < v28)
    {
      v29 = v26;
      do
      {
        -[PDFDocument pageAtIndex:](self, "pageAtIndex:", v29, v38);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v30)
        {
          objc_msgSend(v30, "selectionForAll");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addSelection:", v32);

        }
        ++v29;
        -[PDFPage document](v15, "document");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "indexForPage:", v15);

      }
      while (v29 < v34);
    }
    -[PDFPage selectionForRange:](v15, "selectionForRange:", 0, v38 + 1, v38);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSelection:", v35);

    v14 = v39;
  }
  v36 = v17;

LABEL_20:
  return (PDFSelection *)v36;
}

- (void)resetFormFields:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "fields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFDocument formData](self, "formData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4)
  {
    if (!v5)
      goto LABEL_9;
    v7 = 0;
    goto LABEL_8;
  }
  if (v5)
  {
    if (objc_msgSend(v8, "fieldsIncludedAreCleared"))
    {
      objc_msgSend(v6, "resetFormForFields:", v4);
      goto LABEL_9;
    }
    v5 = v6;
    v7 = v4;
LABEL_8:
    objc_msgSend(v5, "resetFormExcludingFields:", v7);
  }
LABEL_9:

}

- (void)setEnableDataDetectors:(BOOL)a3
{
  self->_dataDetectorsEnabled = a3;
}

- (BOOL)enableDataDetectors
{
  return self->_dataDetectorsEnabled;
}

- (BOOL)showsAnnotations
{
  return 1;
}

- (void)setBookmarked:(BOOL)a3 atPageIndex:(unint64_t)a4
{
  _BOOL4 v5;
  int v7;

  v5 = a3;
  if (-[PDFDocument pageCount](self, "pageCount") > a4)
  {
    v7 = -[NSMutableIndexSet containsIndex:](self->_bookmarkedPages, "containsIndex:", a4);
    if (v5)
    {
      if ((v7 & 1) == 0)
        -[NSMutableIndexSet addIndex:](self->_bookmarkedPages, "addIndex:", a4);
    }
    else if (v7)
    {
      -[NSMutableIndexSet removeIndex:](self->_bookmarkedPages, "removeIndex:", a4);
    }
  }
}

- (id)bookmarkedPages
{
  return (id)-[NSMutableIndexSet copy](self->_bookmarkedPages, "copy");
}

- (id)_bookmarksCatalog
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *obj;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  obj = self->_pages;
  objc_sync_enter(obj);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = self->_pages;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "isBookmarked"))
        {
          v19[0] = CFSTR("PageIndex");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), -[PDFDocument indexForPage:](self, "indexForPage:", v7));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v19[1] = CFSTR("UUID");
          v20[0] = v8;
          objc_msgSend(MEMORY[0x24BDD1880], "UUID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "UUIDString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v20[1] = v10;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "addObject:", v11);
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v4);
  }

  objc_sync_exit(obj);
  return v14;
}

- (void)updateBookmarksInPDFDocument
{
  id v3;

  -[PDFDocument _bookmarksCatalog](self, "_bookmarksCatalog");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFDocument _setDocumentCatalogMetadata:withNSpace:prefix:rootPath:](self, "_setDocumentCatalogMetadata:withNSpace:prefix:rootPath:", v3, CFSTR("http://ns.apple.com/Preview/1.0/"), CFSTR("apple-preview"), CFSTR("apple-preview:Bookmarks"));

}

- (BOOL)bookmarksChanged
{
  NSIndexSet *initialBookmarkedPageIndices;
  void *v3;

  initialBookmarkedPageIndices = self->_initialBookmarkedPageIndices;
  -[PDFDocument bookmarkedPages](self, "bookmarkedPages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(initialBookmarkedPageIndices) = -[NSIndexSet isEqual:](initialBookmarkedPageIndices, "isEqual:", v3) ^ 1;

  return (char)initialBookmarkedPageIndices;
}

+ (void)setPDFDocumentAppendModeActiveForThisThread:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("PDFKitDocumentAppendModeActiveKey"));

}

+ (BOOL)pdfDocumentAppendModeActiveForThisThread
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PDFKitDocumentAppendModeActiveKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)enableLimitedSearch
{
  self->_limitedSearch = 1;
}

- (id)namedDestination:(id)a3
{
  id v4;
  CGPDFDictionary *Catalog;
  CGPDFDictionary *v6;
  PDFDestination *v7;
  uint64_t v8;
  void *v9;
  CGPDFDictionaryRef dict;
  CGPDFDictionaryRef value;

  v4 = a3;
  Catalog = CGPDFDocumentGetCatalog(self->_document);
  if (!Catalog)
    goto LABEL_10;
  v6 = Catalog;
  value = 0;
  if (!CGPDFDictionaryGetDictionary(Catalog, "Dests", &value)
    || (dict = 0,
        !CGPDFDictionaryGetDictionary(value, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), &dict)))
  {
    dict = 0;
    if (CGPDFDictionaryGetDictionary(v6, "Names", &dict))
      CGPDFDictionaryGetDictionary(dict, "Dests", &value);
    if (value)
    {
      -[PDFDocument _namedDestination:forNameDictionary:](self, "_namedDestination:forNameDictionary:", v4);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  v7 = [PDFDestination alloc];
  v8 = -[PDFDestination initWithDictionary:forDocument:](v7, "initWithDictionary:forDocument:", dict, self);
LABEL_9:
  v9 = (void *)v8;
LABEL_11:

  return v9;
}

- (id)_namedDestination:(id)a3 forNameDictionary:(CGPDFDictionary *)a4
{
  id v6;
  void *v7;
  CFStringRef v8;
  uint64_t v9;
  CFStringRef v10;
  uint64_t v11;
  size_t v13;
  size_t v14;
  size_t v15;
  uint64_t v16;
  size_t Count;
  size_t v18;
  size_t v19;
  CFStringRef v20;
  uint64_t v21;
  PDFDestination *v22;
  CGPDFDictionaryRef v23;
  CGPDFStringRef v24;
  CGPDFDictionaryRef v25;
  CGPDFArrayRef array;
  CGPDFStringRef string;
  CGPDFArrayRef value;

  v6 = a3;
  value = 0;
  v7 = 0;
  if (CGPDFDictionaryGetArray(a4, "Limits", &value))
  {
    if (CGPDFArrayGetCount(value) != 2)
      goto LABEL_7;
    string = 0;
    v7 = 0;
    if (CGPDFArrayGetString(value, 0, &string))
    {
      v8 = CGPDFStringCopyTextString(string);
      v9 = objc_msgSend(v6, "compare:", v8);
      CFRelease(v8);
      if (v9 != -1 && CGPDFArrayGetString(value, 1uLL, &string))
      {
        v10 = CGPDFStringCopyTextString(string);
        v11 = objc_msgSend(v6, "compare:", v10);
        CFRelease(v10);
        if (v11 != 1)
        {
          array = 0;
          if (CGPDFDictionaryGetArray(a4, "Kids", &array) && (v13 = CGPDFArrayGetCount(array)) != 0)
          {
            v14 = v13;
            v15 = 0;
            while (1)
            {
              v25 = 0;
              if (CGPDFArrayGetDictionary(array, v15, &v25))
              {
                -[PDFDocument _namedDestination:forNameDictionary:](self, "_namedDestination:forNameDictionary:", v6, v25);
                v16 = objc_claimAutoreleasedReturnValue();
                if (v16)
                  break;
              }
              if (v14 == ++v15)
                goto LABEL_15;
            }
          }
          else
          {
LABEL_15:
            v25 = 0;
            v7 = 0;
            if (!CGPDFDictionaryGetArray(a4, "Names", &v25))
              goto LABEL_8;
            Count = CGPDFArrayGetCount(v25);
            if (!Count)
              goto LABEL_7;
            v18 = Count;
            v19 = 0;
            while (1)
            {
              v24 = 0;
              if (CGPDFArrayGetString(v25, v19, &v24))
              {
                v20 = CGPDFStringCopyTextString(v24);
                v21 = objc_msgSend(v6, "compare:", v20);
                CFRelease(v20);
                if (!v21)
                {
                  v23 = 0;
                  if (CGPDFArrayGetDictionary(v25, v19 + 1, &v23))
                  {
                    v22 = [PDFDestination alloc];
                    v16 = -[PDFDestination initWithDictionary:forDocument:](v22, "initWithDictionary:forDocument:", v23, self);
                    if (v16)
                      break;
                  }
                }
              }
              v19 += 2;
              if (v19 >= v18)
                goto LABEL_7;
            }
          }
          v7 = (void *)v16;
          goto LABEL_8;
        }
      }
LABEL_7:
      v7 = 0;
    }
  }
LABEL_8:

  return v7;
}

- (id)akController
{
  return -[PDFAKDocumentAdaptor akMainController](self->_akDocumentAdaptor, "akMainController");
}

- (void)undo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PDFDocument akController](self, "akController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "undo:", v4);

}

- (BOOL)validateUndo:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PDFDocument akController](self, "akController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "validateUndo:", v4);

  return v6;
}

- (void)redo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PDFDocument akController](self, "akController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "redo:", v4);

}

- (BOOL)validateRedo:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PDFDocument akController](self, "akController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "validateRedo:", v4);

  return v6;
}

- (void)revert
{
  if (-[PDFDocument validateUndo:](self, "validateUndo:", 0))
  {
    do
      -[PDFDocument undo:](self, "undo:", 0);
    while (-[PDFDocument validateUndo:](self, "validateUndo:", 0));
  }
}

- (BOOL)documentChanged
{
  uint64_t v2;
  NSMutableArray *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (self->_documentChanged)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v4 = self->_pages;
    objc_sync_enter(v4);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = self->_pages;
    v2 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v2)
    {
      v6 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v2; ++i)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v5);
          v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = v8;
            objc_msgSend(v9, "annotationChanges", (_QWORD)v13);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "count") == 0;

            if (!v11)
            {
              LOBYTE(v2) = 1;
              goto LABEL_14;
            }
          }
        }
        v2 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v2)
          continue;
        break;
      }
    }
LABEL_14:

    objc_sync_exit(v4);
  }
  return v2;
}

- (id)pageAnnotationChanges
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_pages;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          objc_msgSend(v10, "changedAnnotations", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count");

          if (v12)
            objc_msgSend(v3, "addObject:", v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)resetPageAnnotationChanges
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = self->_pages;
  objc_sync_enter(v3);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_pages;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          objc_msgSend(v9, "resetChangedAnnotations", (_QWORD)v10);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

- (void)beginBatchPageChanges
{
  NSOrderedSet *pagesOrderedSet;

  pagesOrderedSet = self->_pagesOrderedSet;
  self->_pagesOrderedSet = 0;

}

- (void)endBatchPageChanges
{
  NSOrderedSet *v3;
  NSOrderedSet *pagesOrderedSet;

  if (self->_pages)
  {
    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:");
    v3 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
    pagesOrderedSet = self->_pagesOrderedSet;
    self->_pagesOrderedSet = v3;
  }
  else
  {
    pagesOrderedSet = self->_pagesOrderedSet;
    self->_pagesOrderedSet = 0;
  }

}

- (BOOL)viewPreferenceRightToLeft
{
  CGPDFDocument *document;
  char *__s1;
  CGPDFDictionaryRef value;

  document = self->_document;
  if (document)
  {
    document = CGPDFDocumentGetCatalog(document);
    if (document)
    {
      value = 0;
      LOBYTE(document) = CGPDFDictionaryGetDictionary(document, "ViewerPreferences", &value)
                      && (__s1 = 0, CGPDFDictionaryGetName(value, "Direction", (const char **)&__s1))
                      && !strncmp(__s1, "R2L", 3uLL);
    }
  }
  return (char)document;
}

- (id)selectionFromPage:(id)a3 atPoint:(CGPoint)a4 toPage:(id)a5 atPoint:(CGPoint)a6 type:(int)a7
{
  uint64_t v7;
  double y;
  double x;
  double v11;
  double v12;
  id v14;
  id v15;
  PDFDocument *v16;
  PDFDocument *v17;
  PDFDocument *v18;
  id v19;
  NSUInteger v20;
  NSUInteger v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t i;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  unsigned int v39;

  v7 = *(_QWORD *)&a7;
  y = a6.y;
  x = a6.x;
  v11 = a4.y;
  v12 = a4.x;
  v14 = a3;
  v15 = a5;
  objc_msgSend(v14, "document");
  v16 = (PDFDocument *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "document");
  v17 = (PDFDocument *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  v19 = 0;
  if (v16 == self && v17 == self)
  {
    if (v14 == v15)
    {
      objc_msgSend(v14, "selectionFromPoint:toPoint:type:", v7, v12, v11, x, y);
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = -[PDFDocument indexForPage:](self, "indexForPage:", v14);
      v21 = -[PDFDocument indexForPage:](self, "indexForPage:", v15);
      if (v20 >= v21)
        v22 = v15;
      else
        v22 = v14;
      if (v20 >= v21)
        v23 = v14;
      else
        v23 = v15;
      if (v20 >= v21)
        v24 = v11;
      else
        v24 = y;
      if (v20 >= v21)
        v25 = v12;
      else
        v25 = x;
      if (v20 < v21)
      {
        x = v12;
        y = v11;
      }
      v26 = v22;
      v27 = v23;
      v39 = v7;
      objc_msgSend(v26, "selectionFromPointToBottom:type:", v7, x, y);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "document");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v26;
      v30 = objc_msgSend(v29, "indexForPage:", v26);

      for (i = v30 + 1; ; ++i)
      {
        objc_msgSend(v27, "document");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "indexForPage:", v27);

        if (i >= v33)
          break;
        -[PDFDocument pageAtIndex:](self, "pageAtIndex:", i);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "selectionForAll");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addSelectionCore:normalize:", v35, 0);

      }
      objc_msgSend(v27, "selectionFromTopToPoint:type:", v39, v25, v24);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addSelection:", v36);

      v19 = v28;
    }
  }

  return v19;
}

- (id)textExtractionQueue
{
  PDFDocument *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *textExtractionQueue;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_textExtractionQueue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("PDFKit.PDFDocument.textExtractionQueue", v4);
    textExtractionQueue = v2->_textExtractionQueue;
    v2->_textExtractionQueue = (OS_dispatch_queue *)v5;

  }
  objc_sync_exit(v2);

  return v2->_textExtractionQueue;
}

- (id)formFillingQueue
{
  PDFDocument *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *formFillingQueue;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_formFillingQueue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("PDFKit.PDFDocument.formFillingQueue", v4);
    formFillingQueue = v2->_formFillingQueue;
    v2->_formFillingQueue = (OS_dispatch_queue *)v5;

  }
  objc_sync_exit(v2);

  return v2->_formFillingQueue;
}

- (id)findStrings:(id)a3 withinSelection:(id)a4 withOptions:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *v14;
  int64_t v15;
  NSUInteger v16;
  void *v17;
  PDFDocument *v18;
  void *v19;
  unint64_t findOptions;
  int v21;
  uint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int v26;
  unint64_t v27;
  uint64_t v28;
  int64_t v29;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "infoDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("CFBundleName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_5;
  v13 = objc_msgSend(v8, "count");
  v14 = 0;
  if (v9 && v13)
  {
    if ((objc_msgSend(v9, "isEmpty") & 1) != 0)
    {
LABEL_5:
      v14 = 0;
      goto LABEL_44;
    }
    self->_findModel = 0;
    if (-[PDFDocument isFinding](self, "isFinding"))
      -[PDFDocument cancelFindString](self, "cancelFindString");
    -[PDFDocument normalizeFindOptions:](self, "normalizeFindOptions:", a5);
    if ((self->_findOptions & 4) != 0)
    {
      v16 = -[PDFDocument pageCount](self, "pageCount");
      v15 = 0;
      self->_findPageIndex = v16 - 1;
    }
    else
    {
      self->_findPageIndex = 0;
      v15 = -[PDFDocument pageCount](self, "pageCount") - 1;
    }
    self->_findCharIndex = -1;
    self->_lastFindPageIndex = v15;
    self->_lastFindCharIndex = -1;
    if ((self->_findOptions & 4) != 0)
      objc_msgSend(v9, "lastPage");
    else
      objc_msgSend(v9, "firstPage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "document");
    v18 = (PDFDocument *)objc_claimAutoreleasedReturnValue();
    if (v18 != self)
    {
      v19 = v17;
      goto LABEL_43;
    }
    self->_findPageIndex = -[PDFDocument indexForPage:](self, "indexForPage:", v17);
    if (objc_msgSend(v17, "numberOfCharacters"))
    {
      findOptions = self->_findOptions;
      v21 = objc_msgSend(v12, "isEqualToString:", CFSTR("Preview"));
      if ((findOptions & 4) != 0)
      {
        if (v21)
          v23 = objc_msgSend(v9, "indexOfLastCharacterOnPage:", v17);
        else
          v23 = objc_msgSend(v9, "pdfKitIndexOfLastCharacterOnPage:", v17);
        self->_findCharIndex = v23;
        if (v23 < objc_msgSend(v17, "numberOfCharacters"))
          goto LABEL_28;
        v24 = objc_msgSend(v17, "numberOfCharacters") - 1;
      }
      else
      {
        if (v21)
          v22 = objc_msgSend(v9, "indexOfFirstCharacterOnPage:", v17);
        else
          v22 = objc_msgSend(v9, "pdfKitIndexOfFirstCharacterOnPage:", v17);
        v24 = v22 & ~(v22 >> 63);
      }
      self->_findCharIndex = v24;
    }
LABEL_28:
    if ((self->_findOptions & 4) != 0)
      objc_msgSend(v9, "firstPage");
    else
      objc_msgSend(v9, "lastPage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    self->_lastFindPageIndex = -[PDFDocument indexForPage:](self, "indexForPage:", v19);
    if (!objc_msgSend(v19, "numberOfCharacters"))
      goto LABEL_43;
    v25 = self->_findOptions;
    v26 = objc_msgSend(v12, "isEqualToString:", CFSTR("Preview"));
    if ((v25 & 4) != 0)
    {
      if (v26)
        v28 = objc_msgSend(v9, "indexOfFirstCharacterOnPage:", v19);
      else
        v28 = objc_msgSend(v9, "pdfKitIndexOfFirstCharacterOnPage:", v19);
      v29 = v28 & ~(v28 >> 63);
    }
    else
    {
      if (v26)
        v27 = objc_msgSend(v9, "indexOfLastCharacterOnPage:", v19);
      else
        v27 = objc_msgSend(v9, "pdfKitIndexOfLastCharacterOnPage:", v19);
      self->_lastFindCharIndex = v27;
      if (v27 < objc_msgSend(v19, "numberOfCharacters"))
        goto LABEL_43;
      v29 = objc_msgSend(v19, "numberOfCharacters") - 1;
    }
    self->_lastFindCharIndex = v29;
LABEL_43:
    -[PDFDocument coreFindStrings:](self, "coreFindStrings:", v8);
    v14 = self->_findResults;

  }
LABEL_44:

  return v14;
}

- (void)normalizeFindOptions:(unint64_t)a3
{
  self->_findOptions = (a3 & 0x85 | (16 * ((a3 >> 1) & 1))) ^ 0x10;
}

- (void)coreFindString:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFDocument coreFindStrings:](self, "coreFindStrings:", v4);

}

- (void)coreFindStrings:(id)a3
{
  NSMutableArray *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int findModel;
  unint64_t v10;
  _BOOL4 v11;
  int64_t findPageIndex;
  int64_t lastFindPageIndex;
  int64_t v14;
  unint64_t v15;
  void *v16;
  PDFSelection *v17;
  PDFSelection *findInstance;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  if (!-[PDFDocument isFinding](self, "isFinding"))
  {
    v5 = self->_findResults;
    objc_sync_enter(v5);
    self->_finding = 1;
    objc_storeStrong((id *)&self->_findStrings, a3);
    -[NSMutableArray removeAllObjects](self->_findResults, "removeAllObjects");
    if (self->_respondsToDidBeginDocumentFind)
    {
      -[PDFDocument delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("PDFDidBeginDocumentFind"), self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "documentDidBeginDocumentFind:", v7);

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("PDFDidBeginDocumentFind"), self);

    findModel = self->_findModel;
    if (findModel > 3 || findModel == 1)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObserver:selector:name:object:", self, sel_scheduledFindOnPage_, CFSTR("pdfDocumentFindNext"), self);

      objc_msgSend(MEMORY[0x24BDD16D8], "defaultQueue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("pdfDocumentFindNext"), self);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "enqueueNotification:postingStyle:", v21, 1);

    }
    else
    {
      v10 = 0;
      while (1)
      {
        v11 = -[PDFDocument findOnPage](self, "findOnPage");
        self->_findCharIndex = -1;
        if (v11 && (self->_findModel & 0xFFFFFFFE) == 2)
          break;
        findPageIndex = self->_findPageIndex;
        lastFindPageIndex = self->_lastFindPageIndex;
        if (findPageIndex == lastFindPageIndex)
        {
          v14 = self->_findPageIndex;
        }
        else
        {
          if ((self->_findOptions & 4) != 0)
            v14 = findPageIndex - 1;
          else
            v14 = findPageIndex + 1;
          self->_findPageIndex = v14;
          ++v10;
        }
        if (self->_findModel == 3)
        {
          -[PDFDocument pageAtIndex:](self, "pageAtIndex:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[PDFSelection initWithPage:]([PDFSelection alloc], "initWithPage:", v16);
          findInstance = self->_findInstance;
          self->_findInstance = v17;

          break;
        }
        if (self->_limitedSearch)
        {
          v15 = -[NSMutableArray count](self->_findResults, "count", v14);
          if (findPageIndex == lastFindPageIndex || v15 > 0x3E7 || v10 >= 0x65)
            break;
        }
        else if (findPageIndex == lastFindPageIndex)
        {
          break;
        }
      }
      -[PDFDocument cleanupFind](self, "cleanupFind");
    }
    objc_sync_exit(v5);

  }
}

- (BOOL)findOnPage
{
  PDFDocument *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  CFIndex v18;
  CFIndex v19;
  const __CFString *v20;
  int64_t findCharIndex;
  int v22;
  int64_t lastFindPageIndex;
  CFStringCompareFlags findOptions;
  int64_t findPageIndex;
  int64_t lastFindCharIndex;
  CFRange v27;
  void *v28;
  int findModel;
  PDFSelection *v30;
  PDFSelection *findInstance;
  PDFDocument *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  CFIndex v43;
  NSUInteger v44;
  int v45;
  uint64_t v46;
  CFRange result;

  WeakRetained = (PDFDocument *)objc_loadWeakRetained(&self->_delegate);
  if (self->_respondsToDidBeginPageFind)
  {
    v4 = (void *)MEMORY[0x24BDD16C8];
    v5 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", self->_findPageIndex);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryWithObject:forKey:", v6, CFSTR("PDFDocumentPageIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationWithName:object:userInfo:", CFSTR("PDFDidBeginPageFind"), self, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFDocument documentDidBeginPageFind:](WeakRetained, "documentDidBeginPageFind:", v8);

  }
  result.location = 0;
  result.length = 0;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", self->_findPageIndex);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithObject:forKey:", v11, CFSTR("PDFDocumentPageIndex"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("PDFDidBeginPageFind"), self, v12);

  -[PDFDocument pageAtIndex:](self, "pageAtIndex:", self->_findPageIndex);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13 || (v15 = (const __CFString *)objc_msgSend(v13, "string")) == 0)
  {
    LOBYTE(v22) = 0;
    goto LABEL_49;
  }
  v16 = v15;
  CFRetain(v15);
  v17 = objc_msgSend(v14, "numberOfCharacters");
  if (!v17 || (v18 = v17, (v44 = -[NSArray count](self->_findStrings, "count")) == 0))
  {
    LOBYTE(v22) = 0;
    goto LABEL_45;
  }
  v45 = 0;
  v19 = 0;
  v46 = 0;
  while (2)
  {
    v20 = -[NSArray objectAtIndex:](self->_findStrings, "objectAtIndex:", v46, v43);
    findCharIndex = self->_findCharIndex;
    if ((self->_findOptions & 4) != 0)
    {
      if (findCharIndex == -1)
        result.location = v18;
      else
        result.location = self->_findCharIndex;
    }
    else if (findCharIndex == -1)
    {
      v19 = 0;
    }
    else
    {
      v19 = self->_findCharIndex;
    }
    v43 = v19;
    v22 = v45;
    while (1)
    {
      lastFindPageIndex = self->_lastFindPageIndex;
      findOptions = self->_findOptions;
      findPageIndex = self->_findPageIndex;
      if ((findOptions & 4) != 0)
        break;
      if (lastFindPageIndex != findPageIndex || (lastFindCharIndex = self->_lastFindCharIndex, lastFindCharIndex == -1))
        v27.length = v18 - v19;
      else
        v27.length = lastFindCharIndex - v19 + 1;
      v27.location = v19;
      if (!v20)
        goto LABEL_40;
LABEL_27:
      if (!CFStringFindWithOptions(v16, v20, v27, findOptions, &result))
        goto LABEL_41;
      objc_msgSend(v14, "selectionForRange:", result.location, result.length);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      findModel = self->_findModel;
      if (!findModel)
      {
        -[PDFDocument didMatchString:](self, "didMatchString:", v28);
        findModel = self->_findModel;
      }
      if ((findModel & 0xFFFFFFFE) == 2)
      {
        objc_msgSend(v14, "selectionForRange:", result.location, result.length);
        v30 = (PDFSelection *)objc_claimAutoreleasedReturnValue();
        findInstance = self->_findInstance;
        self->_findInstance = v30;

        goto LABEL_37;
      }
      if (self->_respondsToDidMatchString)
      {
        v32 = WeakRetained;
      }
      else
      {
        if (findModel != 1)
          goto LABEL_37;
        v32 = self;
      }
      -[PDFDocument didMatchString:](v32, "didMatchString:", v28, v43);
LABEL_37:
      if (!self->_finding)
      {
        LOBYTE(v22) = 1;
        goto LABEL_48;
      }
      v19 = result.length + result.location;
      v33 = self->_findModel & 0xFFFFFFFE;

      v22 = 1;
      if (v33 == 2)
        goto LABEL_45;
    }
    if (lastFindPageIndex != findPageIndex || (v27.location = self->_lastFindCharIndex, v27.location == -1))
      v27.location = 0;
    v27.length = result.location - v27.location + 1;
    if (v20)
      goto LABEL_27;
LABEL_40:
    v19 = v43;
    v22 = v45;
LABEL_41:
    v45 = v22;
    if (++v46 != v44)
      continue;
    break;
  }
LABEL_45:
  if (self->_respondsToDidEndPageFind)
  {
    v34 = (void *)MEMORY[0x24BDD16C8];
    v35 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", self->_findPageIndex);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "dictionaryWithObject:forKey:", v36, CFSTR("PDFDocumentPageIndex"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "notificationWithName:object:userInfo:", CFSTR("PDFDidEndPageFind"), self, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFDocument documentDidEndPageFind:](WeakRetained, "documentDidEndPageFind:", v38);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v43);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", self->_findPageIndex);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "dictionaryWithObject:forKey:", v40, CFSTR("PDFDocumentPageIndex"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "postNotificationName:object:userInfo:", CFSTR("PDFDidEndPageFind"), self, v41);

LABEL_48:
  CFRelease(v16);
LABEL_49:

  return v22 & 1;
}

- (void)cleanupFind
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *findStrings;
  id v7;

  self->_finding = 0;
  if (self->_findStrings)
  {
    if (self->_respondsToDidEndDocumentFind)
    {
      -[PDFDocument delegate](self, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("PDFDidEndDocumentFind"), self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "documentDidEndDocumentFind:", v4);

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("PDFDidEndDocumentFind"), self);

    findStrings = self->_findStrings;
    self->_findStrings = 0;

    self->_findPageIndex = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("pdfDocumentFindNext"), self);

}

- (void)scheduledFindOnPage:(id)a3
{
  int64_t findPageIndex;
  int64_t v5;
  void *v6;
  id v7;

  if (-[PDFDocument pageCount](self, "pageCount", a3)
    && (-[PDFDocument findOnPage](self, "findOnPage"),
        findPageIndex = self->_findPageIndex,
        findPageIndex != self->_lastFindPageIndex))
  {
    if ((self->_findOptions & 4) != 0)
      v5 = findPageIndex - 1;
    else
      v5 = findPageIndex + 1;
    self->_findPageIndex = v5;
    objc_msgSend(MEMORY[0x24BDD16D8], "defaultQueue");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("pdfDocumentFindNext"), self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enqueueNotification:postingStyle:", v6, 1);

  }
  else
  {
    -[PDFDocument cleanupFind](self, "cleanupFind");
  }
}

- (id)formData
{
  PDFForm *v3;
  PDFForm *v4;
  PDFForm *formData;

  if (-[PDFDocument isLocked](self, "isLocked"))
  {
    v3 = 0;
  }
  else
  {
    if (!self->_formDataLoaded)
    {
      v4 = -[PDFForm initWithDocument:]([PDFForm alloc], "initWithDocument:", self);
      formData = self->_formData;
      self->_formData = v4;

    }
    self->_formDataLoaded = 1;
    v3 = self->_formData;
  }
  return v3;
}

- (void)setFormData:(id)a3
{
  objc_storeStrong((id *)&self->_formData, a3);
}

- (id)annotationsForFieldName:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_pages;
  objc_sync_enter(v6);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_pages;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          objc_msgSend(v12, "annotationsForFieldName:", v4, (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v5, "addObjectsFromArray:", v13);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_sync_exit(v6);
  return v5;
}

- (__CFDictionary)_createInfoDictionary
{
  void *v2;
  __CFDictionary *Mutable;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PDFDocument documentAttributes](self, "documentAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      objc_msgSend(v2, "objectForKey:", CFSTR("Title"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDBF4A8], v4);
      objc_msgSend(v2, "objectForKey:", CFSTR("Author"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDBF3D8], v5);
      objc_msgSend(v2, "objectForKey:", CFSTR("Creator"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDBF3F0], v6);
      objc_msgSend(v2, "objectForKey:", CFSTR("Subject"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDBF4A0], v7);
      objc_msgSend(v2, "objectForKey:", CFSTR("Keywords"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDBF468], v8);

      }
    }
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

- (id)findPageWithCGPDFDictionaryPageRef:(CGPDFDictionary *)a3
{
  NSMutableArray *v4;
  uint64_t ObjectReference;
  NSMutableDictionary *pageDictionaryIndices;
  void *v7;
  void *v8;
  uint64_t PageNumberForPageDictionary;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = self->_pages;
  objc_sync_enter(v4);
  ObjectReference = CGPDFDictionaryGetObjectReference();
  pageDictionaryIndices = self->_pageDictionaryIndices;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", ObjectReference);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](pageDictionaryIndices, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    PageNumberForPageDictionary = objc_msgSend(v8, "unsignedLongValue");
  }
  else
  {
    PageNumberForPageDictionary = CGPDFDocumentGetPageNumberForPageDictionary();
    if (PageNumberForPageDictionary == -1)
    {
      v20 = 0;
      goto LABEL_18;
    }
    v10 = self->_pageDictionaryIndices;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", PageNumberForPageDictionary);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", ObjectReference);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v11, v12);

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = self->_pageIndices;
  v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v23;
    v16 = PageNumberForPageDictionary - 1;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (v18)
        {
          -[NSMutableDictionary objectForKey:](self->_pageIndices, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), (_QWORD)v22);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "unsignedIntegerValue") == v16)
          {
            -[PDFDocument pageAtIndex:](self, "pageAtIndex:", objc_msgSend(v18, "unsignedIntegerValue"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_17;
          }

        }
      }
      v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v14)
        continue;
      break;
    }
  }
  v20 = 0;
LABEL_17:

LABEL_18:
  objc_sync_exit(v4);

  return v20;
}

- (Class)annotationSubclassForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (self->_respondsToClassForAnnotationType)
  {
    v4 = a3;
    -[PDFDocument delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "classForAnnotationType:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (Class)v6;
}

- (BOOL)callShouldReadAKInkAnnotations
{
  void *v2;
  char v3;

  if (!self->_respondsToShouldReadAKInkAnnotations)
    return 0;
  -[PDFDocument delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldReadAKInkAnnotations");

  return v3;
}

- (void)setDocumentHasBurnInAnnotations:(BOOL)a3
{
  self->_documentHasBurnInAnnotations = a3;
}

- (void)setHasPageWithApplicationData:(BOOL)a3
{
  self->_documentHasPageWithApplicationData = a3;
}

- (void)incrementRedactionCount
{
  PDFDocument *obj;

  obj = self;
  objc_sync_enter(obj);
  ++obj->_documentRedactionCount;
  objc_sync_exit(obj);

}

- (void)decrementRedactionCount
{
  PDFDocument *obj;

  obj = self;
  objc_sync_enter(obj);
  --obj->_documentRedactionCount;
  objc_sync_exit(obj);

}

- (void)setPageChangeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pageChangeDelegate, a3);
}

- (BOOL)callDelegateHandleTabFrom:(id)a3 direction:(unint64_t)a4
{
  _BOOL4 respondsToHandleTabFrom;
  id *p_delegate;
  id v8;
  id WeakRetained;

  respondsToHandleTabFrom = self->_respondsToHandleTabFrom;
  if (self->_respondsToHandleTabFrom)
  {
    p_delegate = &self->_delegate;
    v8 = a3;
    WeakRetained = objc_loadWeakRetained(p_delegate);
    objc_msgSend(WeakRetained, "pdfDocument:handleTabFrom:direction:", self, v8, a4);

  }
  return respondsToHandleTabFrom;
}

- (void)callDelegateDidReceiveAnalysis:(id)a3 forPage:(id)a4
{
  id *p_delegate;
  id v7;
  id v8;
  id WeakRetained;

  if (self->_respondsToDidReceiveAnalysis)
  {
    p_delegate = &self->_delegate;
    v7 = a4;
    v8 = a3;
    WeakRetained = objc_loadWeakRetained(p_delegate);
    objc_msgSend(WeakRetained, "pdfDocument:didReceiveAnalysis:forPage:", self, v8, v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncSearchQueue, 0);
  objc_storeStrong((id *)&self->_renderingProperties, 0);
  objc_storeStrong((id *)&self->_akPageOverlayViewProvider, 0);
  objc_destroyWeak((id *)&self->_pdfAKControllerDelegateForDeferredSetup);
  objc_storeStrong((id *)&self->_akDocumentAdaptor, 0);
  objc_storeStrong((id *)&self->_bookmarkedPages, 0);
  objc_storeStrong((id *)&self->_initialBookmarkedPageIndices, 0);
  objc_storeStrong((id *)&self->_appendedAttributes, 0);
  objc_destroyWeak((id *)&self->_pageChangeDelegate);
  objc_storeStrong((id *)&self->_xmpRootPath, 0);
  objc_storeStrong((id *)&self->_xmpPrefix, 0);
  objc_storeStrong((id *)&self->_xmpNameSpace, 0);
  objc_storeStrong((id *)&self->_documentCatalogMetadata, 0);
  objc_storeStrong((id *)&self->_formData, 0);
  objc_storeStrong((id *)&self->_findResults, 0);
  objc_storeStrong((id *)&self->_findInstance, 0);
  objc_storeStrong((id *)&self->_findStrings, 0);
  objc_storeStrong((id *)&self->_formFillingQueue, 0);
  objc_storeStrong((id *)&self->_textExtractionQueue, 0);
  objc_storeStrong((id *)&self->_outline, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_userPassword, 0);
  objc_storeStrong((id *)&self->_ownerPassword, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_accessibilityPageElements, 0);
  objc_storeStrong((id *)&self->_preloadingPageIndexes, 0);
  objc_storeStrong((id *)&self->_pageDictionaryIndices, 0);
  objc_storeStrong((id *)&self->_pageIndices, 0);
  objc_storeStrong((id *)&self->_pagesOrderedSet, 0);
  objc_storeStrong((id *)&self->_pages, 0);
  objc_storeStrong((id *)&self->_documentURL, 0);
}

@end
