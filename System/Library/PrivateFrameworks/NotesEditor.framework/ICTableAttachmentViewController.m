@implementation ICTableAttachmentViewController

- (ICTableAttachmentViewController)initWithTextAttachment:(id)a3 forManualRendering:(BOOL)a4 layoutManager:(id)a5
{
  _BOOL8 v5;
  id v8;
  ICTableAttachmentViewController *v9;
  void *v10;
  objc_super v12;

  v5 = a4;
  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)ICTableAttachmentViewController;
  v9 = -[ICAttachmentViewController initWithTextAttachment:forManualRendering:layoutManager:](&v12, sel_initWithTextAttachment_forManualRendering_layoutManager_, a3, v5, v8);
  if (v9)
  {
    objc_opt_class();
    ICCheckedDynamicCast();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v9->_noteLayoutManager, v10);

  }
  return v9;
}

- (ICTableAttachmentViewController)initWithTextAttachment:(id)a3 forManualRendering:(BOOL)a4 textLayoutManager:(id)a5
{
  _BOOL8 v5;
  id v8;
  ICTableAttachmentViewController *v9;
  void *v10;
  objc_super v12;

  v5 = a4;
  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)ICTableAttachmentViewController;
  v9 = -[ICAttachmentViewController initWithTextAttachment:forManualRendering:textLayoutManager:](&v12, sel_initWithTextAttachment_forManualRendering_textLayoutManager_, a3, v5, v8);
  if (v9)
  {
    objc_opt_class();
    ICCheckedDynamicCast();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v9->_noteTextLayoutManager, v10);

    -[ICTableAttachmentViewController initializeTableLayout](v9, "initializeTableLayout");
  }

  return v9;
}

- (ICTable)table
{
  ICTableAttachmentProvider *tableAttachmentProvider;
  void *v4;
  void *v5;
  ICTableAttachmentProvider *v6;
  ICTableAttachmentProvider *v7;
  NSMapTable *v8;
  NSMapTable *coalescingUndoGroupForStringDelegate;

  tableAttachmentProvider = self->_tableAttachmentProvider;
  if (!tableAttachmentProvider)
  {
    v4 = (void *)MEMORY[0x1E0D63CD0];
    -[ICAttachmentViewController attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sharedProviderForAttachment:", v5);
    v6 = (ICTableAttachmentProvider *)objc_claimAutoreleasedReturnValue();
    v7 = self->_tableAttachmentProvider;
    self->_tableAttachmentProvider = v6;

    -[ICTableAttachmentProvider setDelegate:](self->_tableAttachmentProvider, "setDelegate:", self);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    coalescingUndoGroupForStringDelegate = self->_coalescingUndoGroupForStringDelegate;
    self->_coalescingUndoGroupForStringDelegate = v8;

    tableAttachmentProvider = self->_tableAttachmentProvider;
  }
  return (ICTable *)-[ICTableAttachmentProvider table](tableAttachmentProvider, "table");
}

- (CGSize)intrinsicSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  if (!-[ICTableAttachmentViewController performedInitialLayout](self, "performedInitialLayout"))
    -[ICTableAttachmentViewController performInitialLayoutIfNeeded](self, "performInitialLayoutIfNeeded");
  if (ICInternalSettingsIsTextKit2Enabled())
    -[ICTableAttachmentViewController updateAvailableWidth](self, "updateAvailableWidth");
  -[ICTableAttachmentViewController columnWidthCache](self, "columnWidthCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sum");
  v5 = v4;

  -[ICTableAttachmentViewController rowHeightCache](self, "rowHeightCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sum");
  v8 = v7;

  if (v5 == 0.0)
  {
    -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "columnWidthManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "singleColumnTableWidth");
    v5 = v11;

  }
  if (v8 == 0.0)
  {
    -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "emptyCellHeight");
    v8 = v13;

  }
  v14 = v5;
  v15 = v8;
  result.height = v15;
  result.width = v14;
  return result;
}

- (NSUndoManager)undoManager
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ICAttachmentViewController attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUndoManager *)v5;
}

- (ICBaseTextView)noteTextView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    -[ICTableAttachmentViewController noteTextLayoutManager](self, "noteTextLayoutManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v5, "tk2TextView");
  }
  else
  {
    objc_opt_class();
    -[ICTableAttachmentViewController noteLayoutManager](self, "noteLayoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textView");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICBaseTextView *)v7;
}

- (BOOL)isNoteEditable
{
  void *v2;
  void *v3;
  char v4;

  -[ICAttachmentViewController attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditable");

  return v4;
}

- (void)loadView
{
  ICTableScrollView *v3;
  void *v4;
  ICTableScrollView *v5;
  void *v6;
  void *v7;
  ICTableContentView *v8;
  ICTableContentView *v9;
  ICTableContentView *tableContentView;
  void *v11;
  void *v12;
  ICTableClipView *v13;
  void *v14;
  ICTableClipView *v15;
  ICTableClipView *headerClipView;
  void *v17;
  void *v18;
  ICTableAttachmentSelection *v19;
  ICTableAttachmentSelection *tableSelection;
  ICTableTextViewManager *v21;
  void *v22;
  void *v23;
  ICTableTextViewManager *v24;
  ICTableTextViewManager *textViewManager;
  ICTableSelectionView *v26;
  ICTableSelectionView *selectionHighlightView;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  ICTableUndoTarget *v39;
  void *v40;
  ICTableUndoTarget *v41;
  ICTableUndoTarget *undoTarget;
  NSMutableArray *v43;
  NSMutableArray *undoCommands;
  ICTableSelectionKnob *v45;
  ICTableSelectionKnob *startKnob;
  ICTableSelectionKnob *v47;
  ICTableSelectionKnob *endKnob;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSMutableSet *v53;
  NSMutableSet *columnsNeedingWidthUpdate;
  objc_super v55;

  v55.receiver = self;
  v55.super_class = (Class)ICTableAttachmentViewController;
  -[ICAttachmentViewController loadView](&v55, sel_loadView);
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    -[ICTableAttachmentViewController initializeTableLayout](self, "initializeTableLayout");
  v3 = [ICTableScrollView alloc];
  -[ICTableAttachmentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[ICTableScrollView initWithFrame:](v3, "initWithFrame:");
  -[ICTableAttachmentViewController setScrollView:](self, "setScrollView:", v5);

  -[ICTableAttachmentViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  v8 = [ICTableContentView alloc];
  v9 = -[ICTableContentView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  tableContentView = self->_tableContentView;
  self->_tableContentView = v9;

  -[ICTableAttachmentViewController scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  v13 = [ICTableClipView alloc];
  -[ICTableAttachmentViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v15 = -[ICTableClipView initWithFrame:](v13, "initWithFrame:", 0.0, -30.0);
  headerClipView = self->_headerClipView;
  self->_headerClipView = v15;

  -[ICTableAttachmentViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController headerClipView](self, "headerClipView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v18);

  v19 = (ICTableAttachmentSelection *)objc_alloc_init(MEMORY[0x1E0D64D68]);
  tableSelection = self->_tableSelection;
  self->_tableSelection = v19;

  v21 = [ICTableTextViewManager alloc];
  -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[ICTableTextViewManager initWithTableLayoutManager:view:cachedWidths:cachedRowHeights:cachedCellHeights:](v21, "initWithTableLayoutManager:view:cachedWidths:cachedRowHeights:cachedCellHeights:", v22, v23, self->_columnWidthCache, self->_rowHeightCache, self->_cellHeightCache);
  textViewManager = self->_textViewManager;
  self->_textViewManager = v24;

  -[ICTableTextViewManager setDelegate:](self->_textViewManager, "setDelegate:", self);
  -[ICTableTextViewManager updateAuthorHighlights](self->_textViewManager, "updateAuthorHighlights");
  -[ICTableTextViewManager restyleCells](self->_textViewManager, "restyleCells");
  v26 = objc_alloc_init(ICTableSelectionView);
  selectionHighlightView = self->_selectionHighlightView;
  self->_selectionHighlightView = v26;

  -[ICTableSelectionView setDelegate:](self->_selectionHighlightView, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *MEMORY[0x1E0D63988];
  -[ICTableAttachmentViewController tableAttachmentProvider](self, "tableAttachmentProvider");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObserver:selector:name:object:", self, sel_tableAttachmentProviderWillMergeTable_, v29, v30);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *MEMORY[0x1E0D63980];
  -[ICTableAttachmentViewController tableAttachmentProvider](self, "tableAttachmentProvider");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObserver:selector:name:object:", self, sel_tableAttachmentProviderDidMergeTable_, v32, v33);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController table](self, "table");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addObserver:selector:name:object:", self, sel_tableAttachmentViewControllerDidChange_, CFSTR("ICTableAttachmentViewControllerDidChangeNotification"), v35);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = *MEMORY[0x1E0D64AA8];
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addObserver:selector:name:object:", self, sel_tableAttachmentSelectionDidChange_, v37, v38);

  v39 = [ICTableUndoTarget alloc];
  -[ICTableAttachmentViewController tableAttachmentProvider](self, "tableAttachmentProvider");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[ICTableUndoTarget initWithProvider:viewController:](v39, "initWithProvider:viewController:", v40, self);
  undoTarget = self->_undoTarget;
  self->_undoTarget = v41;

  v43 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  undoCommands = self->_undoCommands;
  self->_undoCommands = v43;

  v45 = -[ICTableSelectionKnob initWithTableAttachmentViewController:]([ICTableSelectionKnob alloc], "initWithTableAttachmentViewController:", self);
  startKnob = self->_startKnob;
  self->_startKnob = v45;

  v47 = -[ICTableSelectionKnob initWithTableAttachmentViewController:]([ICTableSelectionKnob alloc], "initWithTableAttachmentViewController:", self);
  endKnob = self->_endKnob;
  self->_endKnob = v47;

  -[ICTableAttachmentViewController view](self, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "outsideViews");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObject:", self->_startKnob);

  -[ICTableAttachmentViewController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "outsideViews");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addObject:", self->_endKnob);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v53 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  columnsNeedingWidthUpdate = self->_columnsNeedingWidthUpdate;
  self->_columnsNeedingWidthUpdate = v53;

  -[ICTableAttachmentViewController setupEventHandling](self, "setupEventHandling");
}

- (void)removeFromParentViewController
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICTableAttachmentViewController;
  -[ICTableAttachmentViewController removeFromParentViewController](&v3, sel_removeFromParentViewController);
  -[ICTableAttachmentViewController hideColumnRowButtons](self, "hideColumnRowButtons");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[ICTableAttachmentProvider table](self->_tableAttachmentProvider, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellChangeNotifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)ICTableAttachmentViewController;
  -[ICTableAttachmentViewController dealloc](&v6, sel_dealloc);
}

- (BOOL)isInResponderChain
{
  void *v2;
  BOOL v3;

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type") != 0;

  return v3;
}

- (void)prepareForPrinting
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ICTableAttachmentViewController;
  -[ICAbstractAttachmentViewController prepareForPrinting](&v2, sel_prepareForPrinting);
}

- (void)zoomFactorOrInsetsDidChange
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  CGRect v23;
  CGRect v24;

  if (-[ICTableAttachmentViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "restyleCells");

    -[ICTableAttachmentViewController viewport](self, "viewport");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "boundingRect");
    v24.origin.x = v13;
    v24.origin.y = v14;
    v24.size.width = v15;
    v24.size.height = v16;
    v23.origin.x = v5;
    v23.origin.y = v7;
    v23.size.width = v9;
    v23.size.height = v11;
    v17 = CGRectIntersectsRect(v23, v24);

    if (v17)
    {
      -[ICTableAttachmentViewController updateAllColumnWidthsAndRedraw](self, "updateAllColumnWidthsAndRedraw");
    }
    else
    {
      -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "columnWidthManager");
      v22 = (id)objc_claimAutoreleasedReturnValue();

      -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "columnIDs");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (id)objc_msgSend(v22, "invalidateWidthForColumns:", v20);

    }
  }
}

- (CGRect)viewport
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect v8;
  CGRect result;

  if (-[ICAttachmentViewController forManualRendering](self, "forManualRendering"))
  {
    -[ICTableAttachmentViewController availableWidth](self, "availableWidth");
    v4 = v3;
    v5 = 0.0;
    v6 = 1.79769313e308;
    v7 = 0.0;
  }
  else
  {
    -[ICTableAttachmentViewController transitionViewport](self, "transitionViewport");
    if (CGRectIsEmpty(v8))
      -[ICTableAttachmentViewController editingViewport](self, "editingViewport");
    else
      -[ICTableAttachmentViewController transitionViewport](self, "transitionViewport");
  }
  result.size.height = v6;
  result.size.width = v4;
  result.origin.y = v7;
  result.origin.x = v5;
  return result;
}

- (void)updateTiles
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  if (!-[ICTableAttachmentViewController isUpdatingTiles](self, "isUpdatingTiles"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__ICTableAttachmentViewController_updateTiles__block_invoke;
    v12[3] = &unk_1EA7DF690;
    v12[4] = &v13;
    objc_msgSend(v3, "enumerateTextViewsWithBlock:", v12);

    if (*((_BYTE *)v14 + 24))
    {
      v11[0] = v4;
      v11[1] = 3221225472;
      v11[2] = __46__ICTableAttachmentViewController_updateTiles__block_invoke_2;
      v11[3] = &unk_1EA7DD2D8;
      v11[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], v11);
    }
    else
    {
      -[ICTableAttachmentViewController setUpdatingTiles:](self, "setUpdatingTiles:", 1);
      -[ICTableAttachmentViewController setShouldPreventUndoCommands:](self, "setShouldPreventUndoCommands:", 1);
      -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableAttachmentViewController viewport](self, "viewport");
      objc_msgSend(v5, "updateTilesWithViewport:redrawAll:", 0);
      v7 = v6;
      v9 = v8;

      if (v7 != *MEMORY[0x1E0C9D538] || v9 != *(double *)(MEMORY[0x1E0C9D538] + 8))
        -[ICTableAttachmentViewController adjustScrollPositionByOffset:](self, "adjustScrollPositionByOffset:", v7, v9);
      -[ICTableAttachmentViewController updateContentSize](self, "updateContentSize");
      -[ICTableAttachmentViewController updateChrome](self, "updateChrome");
      -[ICTableAttachmentViewController setShouldPreventUndoCommands:](self, "setShouldPreventUndoCommands:", 0);
      -[ICTableAttachmentViewController setUpdatingTiles:](self, "setUpdatingTiles:", 0);
    }
    _Block_object_dispose(&v13, 8);
  }
}

void __46__ICTableAttachmentViewController_updateTiles__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  int v7;

  objc_msgSend(a2, "layoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_isEditing");

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

uint64_t __46__ICTableAttachmentViewController_updateTiles__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateTiles");
}

- (void)updateContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  id v41;

  -[ICTableAttachmentViewController intrinsicSize](self, "intrinsicSize");
  v4 = v3;
  v6 = v5;
  -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v8 = TSDNearlyEqualSizes();

  if ((v8 & 1) == 0)
  {
    objc_opt_class();
    -[ICTableAttachmentViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v41 = (id)objc_claimAutoreleasedReturnValue();

    if (!-[ICTableAttachmentViewController isPerformingInitialLayout](self, "isPerformingInitialLayout"))
      objc_msgSend(v41, "didChangeSize");
    -[ICAttachmentViewController textAttachment](self, "textAttachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attachmentSizeForTextContainer:", v12);
    v14 = v13;

    objc_msgSend(v41, "frame");
    objc_msgSend(v41, "frame");
    TSDSanitizeRect();
    objc_msgSend(v41, "setFrame:");
    objc_msgSend(v41, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[ICTableAttachmentViewController scrollerOutset](self, "scrollerOutset");
    v24 = v23 + v22;
    -[ICTableAttachmentViewController scrollView](self, "scrollView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", v16, v18, v20, v24);

    if (vabdd_f64(v14, v4) >= 0.00999999978)
    {
      TSDSanitizeRect();
      v33 = v32;
      v35 = v34;
      v37 = v36;
      v39 = v38;
      -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      v28 = v33;
      v29 = v35;
      v30 = v37;
      v31 = v39;
    }
    else
    {
      -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      v28 = 0.0;
      v29 = 0.0;
      v30 = v14;
      v31 = v6;
    }
    objc_msgSend(v26, "setFrame:", v28, v29, v30, v31);

    -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "ic_setNeedsLayout");

    -[ICTableAttachmentViewController didUpdateContentSize](self, "didUpdateContentSize");
  }
}

- (void)redraw
{
  void *v3;

  -[ICTableAttachmentViewController setShouldPreventUndoCommands:](self, "setShouldPreventUndoCommands:", 1);
  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController viewport](self, "viewport");
  objc_msgSend(v3, "redrawAllWithViewport:");

  -[ICTableAttachmentViewController updateContentSize](self, "updateContentSize");
  -[ICTableAttachmentViewController updateChrome](self, "updateChrome");
  -[ICTableAttachmentViewController setShouldPreventUndoCommands:](self, "setShouldPreventUndoCommands:", 0);
}

- (void)redrawAndSave
{
  -[ICTableAttachmentViewController redraw](self, "redraw");
  -[ICTableAttachmentViewController save](self, "save");
}

- (void)updateHeightCacheForColumn:(id)a3 row:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if (v9)
  {
    -[ICTableAttachmentViewController cellHeightCache](self, "cellHeightCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63AE0]), "initWithComparator:", &__block_literal_global_14);
      -[ICTableAttachmentViewController cellHeightCache](self, "cellHeightCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v11, v6);

    }
    if (v15)
    {
      -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "columnLayoutManagerForColumn:", v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "heightOfCellAtRowID:", v6);
      objc_msgSend(v11, "setDimension:forKey:", v15);

    }
  }

}

uint64_t __66__ICTableAttachmentViewController_updateHeightCacheForColumn_row___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)performInitialLayoutIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  if (!-[ICTableAttachmentViewController performedInitialLayout](self, "performedInitialLayout"))
  {
    if (-[ICTableAttachmentViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[ICTableAttachmentViewController setPerformedInitialLayout:](self, "setPerformedInitialLayout:", 1);
      -[ICTableAttachmentViewController setIsPerformingInitialLayout:](self, "setIsPerformingInitialLayout:", 1);
      -[ICTableAttachmentViewController updateAvailableWidth](self, "updateAvailableWidth");
      -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableAttachmentViewController viewport](self, "viewport");
      objc_msgSend(v3, "initialScrollPointForViewport:");
      v5 = v4;
      v7 = v6;

      -[ICTableAttachmentViewController updateContentSize](self, "updateContentSize");
      -[ICTableAttachmentViewController scrollView](self, "scrollView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setContentOffset:", v5, v7);

      -[ICTableAttachmentViewController setIsPerformingInitialLayout:](self, "setIsPerformingInitialLayout:", 0);
    }
  }
}

- (double)scrollerOutset
{
  return 0.0;
}

- (void)tableValueDidChangeAtColumnID:(id)a3 rowID:(id)a4 delta:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a4;
  -[ICTableAttachmentViewController columnsNeedingWidthUpdate](self, "columnsNeedingWidthUpdate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v8);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__ICTableAttachmentViewController_tableValueDidChangeAtColumnID_rowID_delta___block_invoke;
  v13[3] = &unk_1EA7DF6F8;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

uint64_t __77__ICTableAttachmentViewController_tableValueDidChangeAtColumnID_rowID_delta___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1 < 0)
    v1 = -v1;
  return objc_msgSend(*(id *)(a1 + 32), "updateCellSizeAtColumn:row:immediateWidthUpdate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (unint64_t)v1 > 2);
}

- (void)updateCellSizeAtColumn:(id)a3 row:(id)a4 immediateWidthUpdate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;

  v5 = a5;
  v21 = a3;
  v8 = a4;
  -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "columnID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v21);

  if (v11)
  {
    if (v5)
      -[ICTableAttachmentViewController updateColumnWidthForColumn:](self, "updateColumnWidthForColumn:", v21);
    else
      -[ICTableAttachmentViewController updateEditedColumnWidthsAfterDelay](self, "updateEditedColumnWidthsAfterDelay");
  }
  else
  {
    -[ICTableAttachmentViewController updateEditedColumnWidths](self, "updateEditedColumnWidths");
  }
  -[ICTableAttachmentViewController updateHeightCacheForColumn:row:](self, "updateHeightCacheForColumn:row:", v21, v8);
  -[ICTableAttachmentViewController rowHeightCache](self, "rowHeightCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dimensionForKey:", v8);
  v14 = v13;

  -[ICTableAttachmentViewController cellHeightCache](self, "cellHeightCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "max");
  v18 = v17;

  if (v14 != v18)
  {
    -[ICTableAttachmentViewController rowHeightCache](self, "rowHeightCache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDimension:forKey:", v8, v18);

    -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "heightChangedForRow:by:", v8, v18 - v14);

    -[ICTableAttachmentViewController updateContentSize](self, "updateContentSize");
  }

}

- (void)textStorage:(id)a3 didProcessEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  void *v12;
  id v13;

  length = a5.length;
  location = a5.location;
  v11 = a3;
  objc_opt_class();
  ICDynamicCast();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentViewController attachment](self, "attachment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "filterInlineAttachmentsInTableColumnTextStorage:range:", v13, location, length);

  objc_msgSend(v13, "textStorage:didProcessEditing:range:changeInLength:", v11, a4, location, length, a6);
}

- (void)textStorage:(id)a3 didReplace:(id)a4 with:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  if (objc_msgSend(v12, "length"))
  {
    -[ICAttachmentViewController attachment](self, "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "markBlockAndInlineAttachmentsForDeletion:inAttributedString:", 1, v12);

  }
  if (objc_msgSend(v7, "length"))
  {
    -[ICAttachmentViewController attachment](self, "attachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "note");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "markBlockAndInlineAttachmentsForDeletion:inAttributedString:", 0, v7);

  }
}

- (void)tappedTableAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  int v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;

  y = a3.y;
  x = a3.x;
  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = 0;
  v7 = objc_msgSend(v6, "cellContainingPoint:columnID:rowID:", &v23, &v22, x, y);
  v8 = v23;
  v9 = v22;

  if (v7)
  {
    -[ICTableAttachmentViewController beginEditingCellWithColumnID:andRowID:touchPoint:](self, "beginEditingCellWithColumnID:andRowID:touchPoint:", v8, v9, x, y);
    goto LABEL_14;
  }
  -[ICTableAttachmentViewController table](self, "table");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_6;
  v11 = (void *)v10;
  -[ICTableAttachmentViewController table](self, "table");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "columnCount"))
  {

    goto LABEL_10;
  }
  -[ICTableAttachmentViewController table](self, "table");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "rowCount");

  if (!v14)
  {
LABEL_10:
    -[ICTableAttachmentViewController table](self, "table");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "columnCount");

    -[ICTableAttachmentViewController table](self, "table");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
      v20 = (id)objc_msgSend(v18, "insertRowAtIndex:", 0);
    else
      v21 = (id)objc_msgSend(v18, "insertColumnAtIndex:", 0);

    -[ICTableAttachmentViewController redrawAndSave](self, "redrawAndSave");
    -[ICTableAttachmentViewController tappedTableAtLocation:](self, "tappedTableAtLocation:", x, y);
    goto LABEL_14;
  }
LABEL_6:
  v15 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[ICTableAttachmentViewController tappedTableAtLocation:].cold.1(self, v15);

LABEL_14:
}

- (void)beginEditingCellWithColumnID:(id)a3 andRowID:(id)a4 touchPoint:(CGPoint)a5
{
  _QWORD v5[5];
  CGPoint v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__ICTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_touchPoint___block_invoke;
  v5[3] = &unk_1EA7DF720;
  v5[4] = self;
  v6 = a5;
  -[ICTableAttachmentViewController beginEditingCellWithColumnID:andRowID:textRange:](self, "beginEditingCellWithColumnID:andRowID:textRange:", a3, a4, v5);
}

uint64_t __84__ICTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_touchPoint___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "tableContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertPoint:fromView:", v5, *(double *)(a1 + 40), *(double *)(a1 + 48));
  v6 = objc_msgSend(v3, "cursorPositionForLocation:inTextView:", v4);

  return v6;
}

- (void)beginEditingCellWithColumnID:(id)a3 andRowID:(id)a4 location:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __82__ICTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_location___block_invoke;
  v14 = &unk_1EA7DF748;
  v15 = v8;
  v16 = a5;
  v9 = v8;
  -[ICTableAttachmentViewController beginEditingCellWithColumnID:andRowID:textRange:](self, "beginEditingCellWithColumnID:andRowID:textRange:", a3, v9, &v11);
  -[ICTableAttachmentViewController tableAXController](self, "tableAXController", v11, v12, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tableRowOrColumnSelectionDidChange");

}

uint64_t __82__ICTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_location___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "characterRangeForRowID:", *(_QWORD *)(a1 + 32));
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    v9 = 0;
  else
    v9 = v6;
  if (v8 == 1)
    v9 = v6;
  if (v8 == 2)
    v10 = v6 + v7;
  else
    v10 = v9;

  return v10;
}

- (void)beginEditingInitialCell
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[ICTableAttachmentViewController table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForColumnIndex:rowIndex:", 0, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v9, "length") != 0;
  -[ICTableAttachmentViewController table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifierForColumnAtIndex:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController table](self, "table");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifierForRowAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController beginEditingCellWithColumnID:andRowID:location:](self, "beginEditingCellWithColumnID:andRowID:location:", v6, v8, 2);
}

- (void)beginEditingSelectedRangeInTextView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "rowAtIndex:rowRange:", objc_msgSend(v4, "selectedRange"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "columnID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController beginEditingCellWithColumnID:andRowID:textRange:](self, "beginEditingCellWithColumnID:andRowID:textRange:", v7, v6, &__block_literal_global_60);
}

uint64_t __71__ICTableAttachmentViewController_beginEditingSelectedRangeInTextView___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "selectedRange");
}

- (void)beginEditingCellWithColumnID:(id)a3 andRowID:(id)a4 textRange:(id)a5
{
  id v8;
  uint64_t (**v9)(id, void *);
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v16 = a3;
  v8 = a4;
  v9 = (uint64_t (**)(id, void *))a5;
  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textViewForColumn:createIfNeeded:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[ICTableAttachmentViewController setPreventScrolling:](self, "setPreventScrolling:", 1);
    -[ICTableAttachmentViewController setDidRecentlyAutoAddRow:](self, "setDidRecentlyAutoAddRow:", 0);
    -[ICTableAttachmentViewController willBeginEditingWithTextView:](self, "willBeginEditingWithTextView:", v11);
    v12 = v9[2](v9, v11);
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v11, "setSelectedRange:", v12, v13);
    -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ensureCellPositionForColumn:andRow:", v16, v8);

    if ((objc_msgSend(v11, "ic_isFirstResponder") & 1) == 0)
    {
      -[ICTableAttachmentViewController setMakingCellFirstResponder:](self, "setMakingCellFirstResponder:", 1);
      v15 = (void *)MEMORY[0x1E0DC3F10];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __83__ICTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_textRange___block_invoke;
      v17[3] = &unk_1EA7DD498;
      v17[4] = self;
      v18 = v11;
      objc_msgSend(v15, "ic_performWithoutAnimation:", v17);
      -[ICTableAttachmentViewController setMakingCellFirstResponder:](self, "setMakingCellFirstResponder:", 0);

    }
    -[ICTableAttachmentViewController didBeginEditingWithTextView:](self, "didBeginEditingWithTextView:", v11);
  }

}

uint64_t __83__ICTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_textRange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ic_makeFirstResponder:", *(_QWORD *)(a1 + 40));
}

- (void)moveIntoTableWithDirection:(unint64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ICTableAttachmentViewController *v13;
  id v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  id v20;

  -[ICTableAttachmentViewController table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 != 1)
  {
    v17 = objc_msgSend(v5, "isRightToLeft");

    if (!v17)
      goto LABEL_3;
LABEL_5:
    -[ICTableAttachmentViewController table](self, "table");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifierForColumnAtIndex:", 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    -[ICTableAttachmentViewController table](self, "table");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifierForRowAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = self;
    v14 = v20;
    v15 = v12;
    v16 = 0;
    goto LABEL_6;
  }
  v7 = objc_msgSend(v5, "isLeftToRight");

  if ((v7 & 1) != 0)
    goto LABEL_5;
LABEL_3:
  -[ICTableAttachmentViewController table](self, "table");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController table](self, "table");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifierForColumnAtIndex:", objc_msgSend(v9, "columnCount") - 1);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController table](self, "table");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController table](self, "table");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifierForRowAtIndex:", objc_msgSend(v11, "rowCount") - 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = self;
  v14 = v20;
  v15 = v12;
  v16 = 2;
LABEL_6:
  -[ICTableAttachmentViewController beginEditingCellWithColumnID:andRowID:location:](v13, "beginEditingCellWithColumnID:andRowID:location:", v14, v15, v16);

}

- (void)willBeginEditingWithTextView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICTableAttachmentViewController auxiliaryTextViewHost](self, "auxiliaryTextViewHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAuxiliaryResponder:", v4);

  objc_msgSend(v4, "TTTextStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "breakUndoCoalescing");
  -[ICTableAttachmentViewController updateEditedColumnWidths](self, "updateEditedColumnWidths");
}

- (void)didBeginEditingWithTextView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEditable"))
  {
    objc_opt_class();
    objc_msgSend(v4, "textStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "columnID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rowAtIndex:rowRange:", objc_msgSend(v4, "selectedRange"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0D64D68]);
    objc_msgSend(v9, "selectCellAtColumn:row:", v7, v8);
    -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextSelectionHidden:", 0);

    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", v9);

    if ((v12 & 1) != 0)
    {
LABEL_8:
      -[ICTableAttachmentViewController setTypingAttributesForTextView:](self, "setTypingAttributesForTextView:", v4);
      -[ICTableAttachmentViewController updateChrome](self, "updateChrome");

      goto LABEL_9;
    }
    -[ICTableAttachmentViewController undoTarget](self, "undoTarget");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOverrideUndoTarget:", v13);

    -[ICTableAttachmentViewController setCurrentlyEditingTextView:](self, "setCurrentlyEditingTextView:", v4);
    -[ICTableAttachmentViewController setCurrentlyEditingTextStorage:](self, "setCurrentlyEditingTextStorage:", v6);
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "selectCellAtColumn:row:", v7, v8);

    -[ICTableAttachmentViewController cellFirstResponderChanged](self, "cellFirstResponderChanged");
    v23[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController showButtonsAtColumns:rows:](self, "showButtonsAtColumns:rows:", v15, v16);

    -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "selectedRange");
    if (v18)
    {
      objc_msgSend(v4, "window");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
LABEL_7:
        -[ICTableAttachmentViewController setTypingAttributesForTextView:](self, "setTypingAttributesForTextView:", v4);
        goto LABEL_8;
      }
      -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v17, "selectedRange");
      -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setSelectedRange:", v20, 0);

    }
    goto LABEL_7;
  }
LABEL_9:

}

- (void)endCellEditingSessionWithTextView:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (objc_msgSend(v13, "ic_isFirstResponder"))
    -[ICTableAttachmentViewController ic_resignFirstResponder:](self, "ic_resignFirstResponder:", v13);
  -[ICTableAttachmentViewController cellFirstResponderChanged](self, "cellFirstResponderChanged");
  -[ICTableAttachmentViewController setCurrentlyEditingTextView:](self, "setCurrentlyEditingTextView:", 0);
  -[ICTableAttachmentViewController setCurrentlyEditingTextStorage:](self, "setCurrentlyEditingTextStorage:", 0);
  -[ICTableAttachmentViewController tableAttachmentProvider](self, "tableAttachmentProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateTableFromMOC");

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRangeOrSpanningSelection");

  if ((v6 & 1) == 0)
    -[ICTableAttachmentViewController hideColumnRowButtons](self, "hideColumnRowButtons");
  -[ICTableAttachmentViewController auxiliaryTextViewHost](self, "auxiliaryTextViewHost");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "auxiliaryResponder");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v13)
  {
    -[ICTableAttachmentViewController auxiliaryTextViewHost](self, "auxiliaryTextViewHost");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAuxiliaryResponder:", 0);

  }
  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "columnID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textViewForColumn:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "ic_setNeedsDisplay");
}

- (void)setTypingAttributesForTextView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_opt_class();
  objc_msgSend(v12, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "styler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v12, "selectedRange");
    v9 = v8;
    objc_msgSend(v12, "typingAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "typingAttributesForRange:forSelectionChange:currentTypingAttributes:inTextStorage:", v7, v9, 1, v10, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTypingAttributes:", v11);

  }
}

- (BOOL)containedInNoteSelection
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  NSRange v23;
  NSRange v24;

  v22 = *MEMORY[0x1E0C80C00];
  if (!-[ICTableAttachmentViewController performedInitialLayout](self, "performedInitialLayout")
    || -[ICTableAttachmentViewController shouldBeginInitialEditing](self, "shouldBeginInitialEditing"))
  {
    return 0;
  }
  -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    objc_msgSend(v4, "textLayoutManager");
  }
  else
  {
    objc_opt_class();
    objc_msgSend(v4, "layoutManager");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentViewController attachment](self, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "rangeForAttachment:withTextAttachment:", v7, 0);
  v10 = v9;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "ic_selectedRanges", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v23.location = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "rangeValue");
        v24.location = v8;
        v24.length = v10;
        if (NSIntersectionRange(v23, v24).length)
        {
          v3 = 1;
          goto LABEL_17;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v13)
        continue;
      break;
    }
  }
  v3 = 0;
LABEL_17:

  return v3;
}

- (BOOL)acceptsKeystrokes
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "moving") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[ICAttachmentViewController attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isEditable");

  }
  return v4;
}

- (BOOL)cursorPrefersWordBoundary
{
  return 0;
}

- (unint64_t)cursorPositionForLocation:(CGPoint)a3 inTextView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  objc_msgSend(v7, "closestPositionToPoint:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginningOfDocument");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "offsetFromPosition:toPosition:", v9, v8);

  if (-[ICTableAttachmentViewController cursorPrefersWordBoundary](self, "cursorPrefersWordBoundary"))
  {
    objc_msgSend(v7, "textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", v10 - 1)))
      {
LABEL_7:

        goto LABEL_14;
      }
    }
    if (objc_msgSend(v12, "length") <= v10 + 1)
    {
      v14 = (unint64_t)objc_msgSend(v12, "length") > 1;
      if (!v10)
        goto LABEL_12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", v10 + 1)) & 1) != 0)
      {

        if (!v10)
          goto LABEL_14;
        goto LABEL_7;
      }
      v14 = (unint64_t)objc_msgSend(v12, "length") > 1;

      if (!v10)
      {
LABEL_12:
        if (v14)
        {
          v10 = 0;
LABEL_16:

          goto LABEL_17;
        }
LABEL_14:
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v12, "rangeOfCharacterFromSet:options:range:", v15, 0, v10, objc_msgSend(v12, "length") - v10);

        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          v10 = objc_msgSend(v12, "length");
        goto LABEL_16;
      }
    }

    if (v14)
      goto LABEL_16;
    goto LABEL_14;
  }
LABEL_17:

  return v10;
}

- (void)scrollToSelectionInTextView:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
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
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double Width;
  double MinY;
  double MinX;
  id v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v5 = a4;
  v39 = a5;
  v8 = a3;
  objc_msgSend(v8, "selectionRect");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "convertRect:fromView:", v8, v10, v12, v14, v16);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "columnID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "frameOfColumn:", v27);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;

  v40.origin.x = v29;
  v40.origin.y = v31;
  v40.size.width = v33;
  v40.size.height = v35;
  MinX = CGRectGetMinX(v40);
  v41.origin.x = v19;
  v41.origin.y = v21;
  v41.size.width = v23;
  v41.size.height = v25;
  MinY = CGRectGetMinY(v41);
  v42.origin.x = v29;
  v42.origin.y = v31;
  v42.size.width = v33;
  v42.size.height = v35;
  Width = CGRectGetWidth(v42);
  v43.origin.x = v19;
  v43.origin.y = v21;
  v43.size.width = v23;
  v43.size.height = v25;
  -[ICTableAttachmentViewController scrollToRect:animated:completion:](self, "scrollToRect:animated:completion:", v5, v39, MinX, MinY, Width, CGRectGetHeight(v43));

}

- (void)beginEditingNoteAtOffset:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v11;

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unselect");

  -[ICAttachmentViewController attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentViewController attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "rangeForAttachment:", v8);

  if (v9 <= -a3 && a3 <= 0)
    v11 = 0;
  else
    v11 = v9 + a3;
  -[ICTableAttachmentViewController beginEditingNoteAtRange:](self, "beginEditingNoteAtRange:", v11, 0);
}

- (void)selectTable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unselect");

  -[ICAttachmentViewController attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentViewController attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "rangeForAttachment:", v6);
  v9 = v8;

  -[ICTableAttachmentViewController beginEditingNoteAtRange:](self, "beginEditingNoteAtRange:", v7, v9);
}

- (id)dragSnapshotFromRect:(CGRect)a3 afterScreenUpdates:(BOOL)a4
{
  return objc_alloc_init(MEMORY[0x1E0DC3F10]);
}

- (unint64_t)preferredNavigationSelection
{
  return 0;
}

- (id)account
{
  void *v2;
  void *v3;
  void *v4;

  -[ICAttachmentViewController attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)note
{
  void *v2;
  void *v3;

  -[ICAttachmentViewController attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)frameOfCellForColumnTextView:(id)a3 row:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
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
  double v29;
  double v30;
  CGRect result;

  v6 = a4;
  v7 = a3;
  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "columnID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frameOfCellAtColumn:row:", v9, v6);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  objc_msgSend(v7, "superview");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "convertRect:toView:", v7, v11, v13, v15, v17);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v27 = v20;
  v28 = v22;
  v29 = v24;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (void)movePrevCell
{
  -[ICTableAttachmentViewController movePrevCellAtLocation:](self, "movePrevCellAtLocation:", -[ICTableAttachmentViewController preferredNavigationSelection](self, "preferredNavigationSelection"));
}

- (void)moveNextCell
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1DD7B0000, v0, v1, "moveNextCell: column or row index not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)moveShiftReturnCell
{
  -[ICTableAttachmentViewController moveUpCellAtLocation:](self, "moveUpCellAtLocation:", -[ICTableAttachmentViewController preferredNavigationSelection](self, "preferredNavigationSelection"));
}

- (void)moveReturnCell
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1DD7B0000, v0, v1, "moveReturnCell: row index not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)moveUpCell
{
  -[ICTableAttachmentViewController moveUpCellAtLocation:](self, "moveUpCellAtLocation:", 2);
}

- (void)moveDownCell
{
  -[ICTableAttachmentViewController moveDownCellAtLocation:](self, "moveDownCellAtLocation:", 0);
}

- (void)moveLeftCell
{
  void *v3;
  int v4;

  -[ICTableAttachmentViewController table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLeftToRight");

  if (v4)
    -[ICTableAttachmentViewController movePrevCellAtLocation:](self, "movePrevCellAtLocation:", 2);
  else
    -[ICTableAttachmentViewController moveNextCellAtLocation:](self, "moveNextCellAtLocation:", 0);
}

- (void)moveRightCell
{
  void *v3;
  int v4;

  -[ICTableAttachmentViewController table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLeftToRight");

  if (v4)
    -[ICTableAttachmentViewController moveNextCellAtLocation:](self, "moveNextCellAtLocation:", 0);
  else
    -[ICTableAttachmentViewController movePrevCellAtLocation:](self, "movePrevCellAtLocation:", 2);
}

- (BOOL)pasteCellRange
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;

  -[ICTableAttachmentViewController icTableFromPasteboard](self, "icTableFromPasteboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICTableAttachmentViewController table](self, "table");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "type");
    v7 = v6 != 0;

    if (v6)
    {
      -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rows");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((selectedRow) != nil)", "-[ICTableAttachmentViewController pasteCellRange]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "selectedRow");
      v11 = objc_msgSend(v4, "rowIndexForIdentifier:", v10);
      -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "columns");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((selectedColumn) != nil)", "-[ICTableAttachmentViewController pasteCellRange]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "selectedColumn");
      v15 = objc_msgSend(v4, "columnIndexForIdentifier:", v14);
      if (-[ICTableAttachmentViewController makeSpaceToPasteSourceTable:](self, "makeSpaceToPasteSourceTable:", v3))
      {
        -[ICTableAttachmentViewController pasteTable:atColumnIndex:rowIndex:shouldSetSelectionToPastedRange:](self, "pasteTable:atColumnIndex:rowIndex:shouldSetSelectionToPastedRange:", v3, v15, v11, 0);
      }
      else
      {
        objc_msgSend(v3, "joinedAttributedStringForColumns:rows:", 0, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAttachmentViewController attachment](self, "attachment");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "managedObjectContext");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "ic_attributedStringByFlatteningUnsupportedInlineAttachmentsWithContext:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICAttachmentViewController attachment](self, "attachment");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "managedObjectContext");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "ic_attributedStringByCopyingInlineAttachmentsAndUpdatingChangeCountWithContext:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "ic_selectedRanges");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICTableAttachmentViewController currentlyEditingTextStorage](self, "currentlyEditingTextStorage");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setIsReadingSelectionFromPasteboard:", 1);

        -[ICTableAttachmentViewController currentlyEditingTextStorage](self, "currentlyEditingTextStorage");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "firstObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "rangeValue");
        objc_msgSend(v25, "replaceCharactersInRange:withAttributedString:", v27, v28, v22);

        -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setSelectedRange:", objc_msgSend(v30, "selectedRange") + objc_msgSend(v22, "length"), 0);

        -[ICTableAttachmentViewController currentlyEditingTextStorage](self, "currentlyEditingTextStorage");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setIsReadingSelectionFromPasteboard:", 0);

        -[ICTableAttachmentViewController save](self, "save");
        -[ICTableAttachmentViewController updateCellSizeAtColumn:row:immediateWidthUpdate:](self, "updateCellSizeAtColumn:row:immediateWidthUpdate:", v14, v10, 1);

      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)didPasteOrDropTextForTableColumnTextView:(id)a3
{
  void *v4;

  objc_msgSend(a3, "columnID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController updateColumnWidthForColumn:](self, "updateColumnWidthForColumn:", v4);

  -[ICTableAttachmentViewController save](self, "save");
}

- (void)moveNextLineAtLocation:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICTableAttachmentViewController table](self, "table");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rows");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "rowIndexForIdentifier:", v9);

    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[ICTableAttachmentViewController moveNextLineAtLocation:].cold.1();

    }
    else
    {
      -[ICTableAttachmentViewController table](self, "table");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "rowCount") - 1;

      if (v10 < v13)
      {
        -[ICTableAttachmentViewController table](self, "table");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifierForRowAtIndex:", v10 + 1);
        v17 = (id)objc_claimAutoreleasedReturnValue();

        -[ICTableAttachmentViewController table](self, "table");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifierForColumnAtIndex:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICTableAttachmentViewController beginEditingCellWithColumnID:andRowID:location:](self, "beginEditingCellWithColumnID:andRowID:location:", v16, v17, a3);
        -[ICTableAttachmentViewController speakAccessibilityAnnouncementForMoveToCellWithColumnID:rowID:](self, "speakAccessibilityAnnouncementForMoveToCellWithColumnID:rowID:", v16, v17);

      }
    }
  }
}

- (void)moveUpCellAtLocation:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;

  -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICTableAttachmentViewController table](self, "table");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "columns");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "columnIndexForIdentifier:", v9);

    -[ICTableAttachmentViewController table](self, "table");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rows");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "rowIndexForIdentifier:", v14);

    if (v10 == 0x7FFFFFFFFFFFFFFFLL || v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[ICTableAttachmentViewController moveUpCellAtLocation:].cold.1();

    }
    else if (v15)
    {
      -[ICTableAttachmentViewController table](self, "table");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifierForColumnAtIndex:", v10);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      -[ICTableAttachmentViewController table](self, "table");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifierForRowAtIndex:", v15 - 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICTableAttachmentViewController beginEditingCellWithColumnID:andRowID:location:](self, "beginEditingCellWithColumnID:andRowID:location:", v20, v18, a3);
      -[ICTableAttachmentViewController speakAccessibilityAnnouncementForMoveToCellWithColumnID:rowID:](self, "speakAccessibilityAnnouncementForMoveToCellWithColumnID:rowID:", v20, v18);

    }
    else
    {
      -[ICTableAttachmentViewController beginEditingNoteAtOffset:](self, "beginEditingNoteAtOffset:", -1);
    }
  }
}

- (void)moveDownCellAtLocation:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;

  -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICTableAttachmentViewController table](self, "table");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "columns");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "columnIndexForIdentifier:", v9);

    -[ICTableAttachmentViewController table](self, "table");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rows");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "rowIndexForIdentifier:", v14);

    if (v10 == 0x7FFFFFFFFFFFFFFFLL || v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[ICTableAttachmentViewController moveDownCellAtLocation:].cold.1();

    }
    else
    {
      -[ICTableAttachmentViewController table](self, "table");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "rowCount") - 1;

      if (v15 >= v17)
      {
        -[ICTableAttachmentViewController beginEditingNoteAtOffset:](self, "beginEditingNoteAtOffset:", 2);
      }
      else
      {
        -[ICTableAttachmentViewController table](self, "table");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifierForColumnAtIndex:", v10);
        v22 = (id)objc_claimAutoreleasedReturnValue();

        -[ICTableAttachmentViewController table](self, "table");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identifierForRowAtIndex:", v15 + 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICTableAttachmentViewController beginEditingCellWithColumnID:andRowID:location:](self, "beginEditingCellWithColumnID:andRowID:location:", v22, v20, a3);
        -[ICTableAttachmentViewController speakAccessibilityAnnouncementForMoveToCellWithColumnID:rowID:](self, "speakAccessibilityAnnouncementForMoveToCellWithColumnID:rowID:", v22, v20);

      }
    }
  }
}

- (void)movePrevCellAtLocation:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;

  -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICTableAttachmentViewController table](self, "table");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "columns");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "columnIndexForIdentifier:", v9);

    -[ICTableAttachmentViewController table](self, "table");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rows");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "rowIndexForIdentifier:", v14);

    if (v10 == 0x7FFFFFFFFFFFFFFFLL || v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[ICTableAttachmentViewController movePrevCellAtLocation:].cold.1();

    }
    else if (v10 | v15)
    {
      if (!v10)
      {
        -[ICTableAttachmentViewController table](self, "table");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v16, "columnCount");

        --v15;
      }
      -[ICTableAttachmentViewController table](self, "table");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifierForColumnAtIndex:", v10 - 1);
      v21 = (id)objc_claimAutoreleasedReturnValue();

      -[ICTableAttachmentViewController table](self, "table");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifierForRowAtIndex:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICTableAttachmentViewController beginEditingCellWithColumnID:andRowID:location:](self, "beginEditingCellWithColumnID:andRowID:location:", v21, v19, a3);
      -[ICTableAttachmentViewController speakAccessibilityAnnouncementForMoveToCellWithColumnID:rowID:](self, "speakAccessibilityAnnouncementForMoveToCellWithColumnID:rowID:", v21, v19);

    }
    else
    {
      -[ICTableAttachmentViewController beginEditingNoteAtOffset:](self, "beginEditingNoteAtOffset:", 0);
    }
  }
}

- (void)moveNextCellAtLocation:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICTableAttachmentViewController table](self, "table");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "columns");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "columnIndexForIdentifier:", v9);

    -[ICTableAttachmentViewController table](self, "table");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rows");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "rowIndexForIdentifier:", v14);

    if (v10 == 0x7FFFFFFFFFFFFFFFLL || v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[ICTableAttachmentViewController moveNextCellAtLocation:].cold.1();

    }
    else
    {
      -[ICTableAttachmentViewController table](self, "table");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 >= objc_msgSend(v16, "columnCount") - 1)
      {
        -[ICTableAttachmentViewController table](self, "table");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "rowCount") - 1;

        if (v15 >= v19)
        {
          -[ICTableAttachmentViewController beginEditingNoteAtOffset:](self, "beginEditingNoteAtOffset:", 1);
          return;
        }
      }
      else
      {

      }
      -[ICTableAttachmentViewController table](self, "table");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "columnCount") - 1;

      if (v10 < v21)
      {
        v22 = v10 + 1;
      }
      else
      {
        ++v15;
        v22 = 0;
      }
      -[ICTableAttachmentViewController table](self, "table");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifierForColumnAtIndex:", v22);
      v26 = (id)objc_claimAutoreleasedReturnValue();

      -[ICTableAttachmentViewController table](self, "table");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifierForRowAtIndex:", v15);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICTableAttachmentViewController beginEditingCellWithColumnID:andRowID:location:](self, "beginEditingCellWithColumnID:andRowID:location:", v26, v25, a3);
      -[ICTableAttachmentViewController speakAccessibilityAnnouncementForMoveToCellWithColumnID:rowID:](self, "speakAccessibilityAnnouncementForMoveToCellWithColumnID:rowID:", v26, v25);

    }
  }
}

- (BOOL)makeSpaceToPasteSourceTable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  BOOL v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  BOOL v21;
  id v22;
  unint64_t v23;
  void *v24;
  id v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  _BOOL4 v29;
  void *v30;
  id v31;
  unint64_t v32;
  int v33;
  unint64_t v34;
  id v35;
  void *v37;
  void *v38;
  ICTableAttachmentViewController *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v4 = a3;
  -[ICTableAttachmentViewController beginEditing](self, "beginEditing");
  -[ICTableAttachmentViewController table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "type") != 1)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "ICTableAttachmentSelectionTypeCell == tableSelection.type", "-[ICTableAttachmentViewController makeSpaceToPasteSourceTable:]", 1, 0, CFSTR("Expected a cell editing selection when pasting a cell range"));
  objc_msgSend(v6, "columns");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "columnIndexesForIdentifiers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") != 1)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "1 == selectedColumnIndexes.count", "-[ICTableAttachmentViewController makeSpaceToPasteSourceTable:]", 1, 0, CFSTR("Expected a single column in this selection"));
  objc_msgSend(v6, "rows");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowIndexesForIdentifiers:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count") != 1)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "1 == selectedRowIndexes.count", "-[ICTableAttachmentViewController makeSpaceToPasteSourceTable:]", 1, 0, CFSTR("Expected a single row in this selection"));
  v11 = objc_msgSend(v8, "firstIndex");
  v42 = v10;
  v12 = objc_msgSend(v10, "firstIndex");
  v13 = objc_msgSend(v4, "columnCount");
  v14 = objc_msgSend(v4, "rowCount");
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "selectedColumnIndex >= 0 && selectedColumnIndex != NSNotFound", "-[ICTableAttachmentViewController makeSpaceToPasteSourceTable:]", 1, 0, CFSTR("Expected valid selected column index, got %lu."), 0x7FFFFFFFFFFFFFFFLL);
  v43 = v4;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "selectedRowIndex >= 0 && selectedRowIndex != NSNotFound", "-[ICTableAttachmentViewController makeSpaceToPasteSourceTable:]", 1, 0, CFSTR("Expected valid selected row index, got %lu."), 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v11, v13);
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v12, v14);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)v15;
  if ((objc_msgSend(v5, "isEmptyAtColumnIndexes:rowIndexes:", v15) & 1) == 0)
  {
    v39 = self;
    v17 = objc_msgSend(v5, "rowCount");
    v18 = objc_msgSend(v5, "columnCount");
    if (objc_msgSend(v5, "rowIsEmptyAtIndex:", v12))
    {
      v37 = v8;
      v38 = v6;
      v19 = 1;
      while (1)
      {
        v20 = v14 - v19;
        v21 = v14 != v19;
        if (v14 == v19 || v12 + v19 >= v17)
          break;
        ++v19;
        if ((objc_msgSend(v5, "rowIsEmptyAtIndex:") & 1) == 0)
        {
          v21 = 1;
          break;
        }
      }
      v22 = (id)objc_msgSend(v5, "insertRows:atIndex:", v20, v12);
      if (v13 >= v18 - v11)
        v23 = v13 - (v18 - v11);
      else
        v23 = 0;
      -[ICTableAttachmentViewController table](v39, "table");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 != v24)
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "destinationTable == self.table", "-[ICTableAttachmentViewController makeSpaceToPasteSourceTable:]", 1, 0, CFSTR("destination table should be self.table"));
      self = v39;
      v25 = -[ICTableAttachmentViewController insertColumns:atIndex:](v39, "insertColumns:atIndex:", v23, v18);
      v26 = v13 > v18 - v11 || v21;
      if ((v26 & 1) == 0)
        goto LABEL_29;
    }
    else
    {
      if (!objc_msgSend(v5, "columnIsEmptyAtIndex:", v11))
      {
        v16 = 0;
        self = v39;
        goto LABEL_47;
      }
      v37 = v8;
      v38 = v6;
      v27 = 1;
      while (1)
      {
        v28 = v13 - v27;
        v29 = v13 != v27;
        if (v13 == v27 || v11 + v27 >= v18)
          break;
        ++v27;
        if ((objc_msgSend(v5, "rowIsEmptyAtIndex:") & 1) == 0)
        {
          v29 = 1;
          break;
        }
      }
      -[ICTableAttachmentViewController table](v39, "table");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 != v30)
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "destinationTable == self.table", "-[ICTableAttachmentViewController makeSpaceToPasteSourceTable:]", 1, 0, CFSTR("destination table should be self.table"));
      v31 = -[ICTableAttachmentViewController insertColumns:atIndex:](v39, "insertColumns:atIndex:", v28, v11);
      if (v14 >= v17 - v12)
        v32 = v14 - (v17 - v12);
      else
        v32 = 0;
      v33 = v14 > v17 - v12 || v29;
      v34 = v17;
      self = v39;
      v35 = (id)objc_msgSend(v5, "insertRows:atIndex:", v32, v34);
      if (v33 != 1)
        goto LABEL_29;
    }
    -[ICTableAttachmentViewController postChangeNotification:columnOrRowUUIDs:](self, "postChangeNotification:columnOrRowUUIDs:", 2, 0);
    -[ICTableAttachmentViewController redrawAndSave](self, "redrawAndSave");
LABEL_29:
    v16 = 1;
    v8 = v37;
    v6 = v38;
    goto LABEL_47;
  }
  v16 = 1;
LABEL_47:
  -[ICTableAttachmentViewController endEditing](self, "endEditing");

  return v16;
}

- (void)beginEditing
{
  -[ICTableAttachmentViewController setEditingCount:](self, "setEditingCount:", -[ICTableAttachmentViewController editingCount](self, "editingCount") + 1);
}

- (void)endEditing
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  if (-[ICTableAttachmentViewController editingCount](self, "editingCount"))
    -[ICTableAttachmentViewController setEditingCount:](self, "setEditingCount:", -[ICTableAttachmentViewController editingCount](self, "editingCount") - 1);
  if (!-[ICTableAttachmentViewController editingCount](self, "editingCount"))
  {
    -[ICTableAttachmentViewController undoCommands](self, "undoCommands");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      -[ICTableAttachmentViewController undoCommands](self, "undoCommands");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "copy");

      -[ICTableAttachmentViewController undoTarget](self, "undoTarget");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableAttachmentViewController undoManager](self, "undoManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __45__ICTableAttachmentViewController_endEditing__block_invoke;
      v15 = &unk_1EA7DF7B0;
      v16 = v7;
      v17 = v6;
      v9 = v6;
      v10 = v7;
      objc_msgSend(v8, "registerUndoWithTarget:handler:", v10, &v12);

      -[ICTableAttachmentViewController undoCommands](self, "undoCommands", v12, v13, v14, v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeAllObjects");

    }
  }
}

void __45__ICTableAttachmentViewController_endEditing__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "tableAttachmentViewControllerForUndo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableAttachmentWillChange");
  objc_msgSend(v2, "beginEditing");
  objc_msgSend(v2, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "reverseObjectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  objc_msgSend(v2, "endEditing");
  objc_msgSend(v2, "tableAttachmentDidChange");
  objc_msgSend(v2, "save");

}

- (unint64_t)selectedStyleBIUS
{
  id v2;
  unint64_t v4;

  v4 = 0;
  v2 = -[ICTableAttachmentViewController namedStylesForCurrentSelectionAndBIUS:](self, "namedStylesForCurrentSelectionAndBIUS:", &v4);
  return v4;
}

- (NSIndexSet)selectedStyles
{
  return (NSIndexSet *)-[ICTableAttachmentViewController namedStylesForCurrentSelectionAndBIUS:](self, "namedStylesForCurrentSelectionAndBIUS:", 0);
}

- (BOOL)canIndent
{
  return 0;
}

- (BOOL)canOutdent
{
  return 0;
}

- (BOOL)canStyleText
{
  return 0;
}

- (BOOL)canToggleTodo
{
  return 0;
}

- (BOOL)canIndentByamount:(int64_t)a3
{
  return 0;
}

- (void)toggleTodoStyle:(id)a3
{
  void *v4;
  int v5;
  uint64_t v6;

  -[ICTableAttachmentViewController selectedStyles](self, "selectedStyles", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsIndex:", 103);

  if (v5)
    v6 = 3;
  else
    v6 = 103;
  -[ICTableAttachmentViewController setSelectionNamedStyle:](self, "setSelectionNamedStyle:", v6);
}

- (void)disableBoldface:(id)a3
{
  -[ICTableAttachmentViewController setSelectionBIUSStyle:toggleOn:](self, "setSelectionBIUSStyle:toggleOn:", 1, 0);
}

- (void)disableItalics:(id)a3
{
  -[ICTableAttachmentViewController setSelectionBIUSStyle:toggleOn:](self, "setSelectionBIUSStyle:toggleOn:", 2, 0);
}

- (void)disableStrikethrough:(id)a3
{
  -[ICTableAttachmentViewController setSelectionBIUSStyle:toggleOn:](self, "setSelectionBIUSStyle:toggleOn:", 8, 0);
}

- (void)disableUnderline:(id)a3
{
  -[ICTableAttachmentViewController setSelectionBIUSStyle:toggleOn:](self, "setSelectionBIUSStyle:toggleOn:", 4, 0);
}

- (void)enableBoldface:(id)a3
{
  -[ICTableAttachmentViewController setSelectionBIUSStyle:toggleOn:](self, "setSelectionBIUSStyle:toggleOn:", 1, 1);
}

- (void)enableItalics:(id)a3
{
  -[ICTableAttachmentViewController setSelectionBIUSStyle:toggleOn:](self, "setSelectionBIUSStyle:toggleOn:", 2, 1);
}

- (void)enableStrikethrough:(id)a3
{
  -[ICTableAttachmentViewController setSelectionBIUSStyle:toggleOn:](self, "setSelectionBIUSStyle:toggleOn:", 8, 1);
}

- (void)enableUnderline:(id)a3
{
  -[ICTableAttachmentViewController setSelectionBIUSStyle:toggleOn:](self, "setSelectionBIUSStyle:toggleOn:", 4, 1);
}

- (void)toggleBoldface:(id)a3
{
  -[ICTableAttachmentViewController toggleBIUS:](self, "toggleBIUS:", 1);
}

- (void)toggleItalics:(id)a3
{
  -[ICTableAttachmentViewController toggleBIUS:](self, "toggleBIUS:", 2);
}

- (void)toggleUnderline:(id)a3
{
  -[ICTableAttachmentViewController toggleBIUS:](self, "toggleBIUS:", 4);
}

- (void)toggleStrikethrough:(id)a3
{
  -[ICTableAttachmentViewController toggleBIUS:](self, "toggleBIUS:", 8);
}

- (void)toggleEmphasis:(id)a3
{
  -[ICTableAttachmentViewController toggleBIUS:](self, "toggleBIUS:", 16);
}

- (void)toggleBIUS:(unint64_t)a3
{
  id v5;
  uint64_t v6;

  v6 = 0;
  v5 = -[ICTableAttachmentViewController namedStylesForCurrentSelectionAndBIUS:](self, "namedStylesForCurrentSelectionAndBIUS:", &v6);
  -[ICTableAttachmentViewController setSelectionBIUSStyle:toggleOn:](self, "setSelectionBIUSStyle:toggleOn:", a3, (a3 & ~v6) != 0);
}

- (BOOL)becomeFirstResponderForAuxStyling
{
  return 0;
}

- (BOOL)resignFirstResponderForAuxStyling
{
  return 0;
}

- (void)copyTable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v4 = a3;
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v5, "copy");

  v6 = (void *)MEMORY[0x1E0C99DE8];
  -[ICTableAttachmentViewController table](self, "table");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "columnCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController table](self, "table");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __45__ICTableAttachmentViewController_copyTable___block_invoke;
  v22[3] = &unk_1EA7DF7D8;
  v23 = v8;
  v11 = v8;
  objc_msgSend(v9, "enumerateColumnsWithBlock:", v22);

  v12 = (void *)MEMORY[0x1E0C99DE8];
  -[ICTableAttachmentViewController table](self, "table");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "rowCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController table](self, "table");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __45__ICTableAttachmentViewController_copyTable___block_invoke_2;
  v20[3] = &unk_1EA7DF7D8;
  v21 = v14;
  v16 = v14;
  objc_msgSend(v15, "enumerateRowsWithBlock:", v20);

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "selectCellRangeAtColumns:rows:", v11, v16);

  -[ICTableAttachmentViewController copySelection:](self, "copySelection:", v4);
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSelectionEqualTo:", v19);

}

uint64_t __45__ICTableAttachmentViewController_copyTable___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __45__ICTableAttachmentViewController_copyTable___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)convertTableToText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;

  -[ICTableAttachmentViewController table](self, "table", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentViewController attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "joinedAttributedStringForColumns:rows:deepCopyInlineAttachments:note:parentAttachment:", 0, 0, 1, v6, 0);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLayoutManager");
  }
  else
  {
    objc_opt_class();
    -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutManager");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentViewController attachment](self, "attachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "rangeForAttachment:withTextAttachment:", v10, 0);
  v13 = v12;

  -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "beginEditing");

  -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "textStorage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "replaceCharactersInRange:withAttributedString:", v11, v13, v25);

  -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "textStorage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "endEditing");

  -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "textViewDidChange:", v22);

  v23 = objc_msgSend(v25, "length");
  -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSelectedRange:", v11, v23);

}

- (void)updateTableColumnDirectionForWritingDirection:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[ICTableAttachmentViewController table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRightToLeft");

  if (a3 == 1)
  {
    if ((v6 & 1) != 0)
      return;
  }
  else if (!v6)
  {
    return;
  }
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "columns");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rows");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "count"))
  {
    -[ICTableAttachmentViewController table](self, "table");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifierForRowAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  -[ICTableAttachmentViewController hideColumnRowButtons](self, "hideColumnRowButtons");
  -[ICTableAttachmentViewController table](self, "table");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reverseColumnDirection");

  -[ICTableAttachmentViewController updateTableCellsWithDirection:columnIndexes:rowIndexes:](self, "updateTableCellsWithDirection:columnIndexes:rowIndexes:", a3, 0, 0);
  -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[ICTableAttachmentViewController setRowButton:](self, "setRowButton:", 0);
    -[ICTableAttachmentViewController setColumnButton:](self, "setColumnButton:", 0);
    -[ICTableAttachmentViewController showButtonsAtColumns:rows:](self, "showButtonsAtColumns:rows:", v8, v10);
  }
  -[ICTableAttachmentViewController redrawAndSave](self, "redrawAndSave");
  -[ICTableAttachmentViewController updateAttachmentParagraphForWritingDirection:](self, "updateAttachmentParagraphForWritingDirection:", a3);

}

- (void)reverseTableColumnDirection:(id)a3
{
  void *v4;
  uint64_t v5;

  -[ICTableAttachmentViewController table](self, "table", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isRightToLeft"))
    v5 = -1;
  else
    v5 = 1;

  -[ICTableAttachmentViewController updateTableColumnDirectionForWritingDirection:](self, "updateTableColumnDirectionForWritingDirection:", v5);
}

- (void)updateAttachmentParagraphForWritingDirection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  -[ICAttachmentViewController attachment](self, "attachment");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v6, "styler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v17, "rangeInNote");
  v11 = v10;
  objc_msgSend(v6, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "paragraphRangeForRange:", v9, v11);
  v15 = v14;

  -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setParagraphWritingDirectionInRange:toDirection:inTextView:", v13, v15, a3, v16);

}

- (void)applyUndoGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD);
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD aBlock[5];
  id v44;
  id v45;
  id v46;
  id v47;

  v4 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "columnID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController table](self, "table");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "containsColumn:", v6) && objc_msgSend(v8, "containsRow:", v7))
  {
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textViewForColumn:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v38 = v11;
    objc_msgSend(v11, "textStorage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__ICTableAttachmentViewController_applyUndoGroup___block_invoke;
    aBlock[3] = &unk_1EA7DF800;
    aBlock[4] = self;
    v39 = v6;
    v44 = v39;
    v36 = v7;
    v45 = v36;
    v37 = v13;
    v46 = v37;
    v47 = v4;
    v14 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v5, "tableSelection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "type");

    if (v16 != 1)
    {
      -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTableAttachmentViewController endCellEditingSessionWithTextView:](self, "endCellEditingSessionWithTextView:", v20);

      }
      v14[2](v14);
      -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tableSelection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setSelectionEqualTo:", v22);

      -[ICTableAttachmentViewController updateChrome](self, "updateChrome");
      objc_msgSend(v5, "tableSelection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v23, "type"))
      {
        -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v30, "isEditable");

        v29 = v37;
        if (v34)
        {
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __50__ICTableAttachmentViewController_applyUndoGroup___block_invoke_3;
          v40[3] = &unk_1EA7DF828;
          v41 = v37;
          v42 = v36;
          -[ICTableAttachmentViewController beginEditingCellWithColumnID:andRowID:textRange:](self, "beginEditingCellWithColumnID:andRowID:textRange:", v39, v42, v40);

        }
        goto LABEL_18;
      }

LABEL_17:
      v29 = v37;
LABEL_18:
      -[ICTableAttachmentViewController updateColumnWidthForColumn:](self, "updateColumnWidthForColumn:", v39);
      -[ICTableAttachmentViewController save](self, "save");

      goto LABEL_19;
    }
    if (objc_msgSend(v9, "type") == 1)
    {
      objc_msgSend(v9, "columns");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "isEqual:", v18))
      {
        objc_msgSend(v9, "rows");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v36, "isEqual:") & 1) != 0)
        {

          goto LABEL_14;
        }
        v31 = objc_msgSend(v38, "isEditable");

        if ((v31 & 1) == 0)
        {
LABEL_14:
          -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "type");

          if (v25 == 1)
          {
            v14[2](v14);
          }
          else
          {
            -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "tableSelection");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setSelectionEqualTo:", v27);

            v14[2](v14);
            -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "unselect");

          }
          goto LABEL_17;
        }
      }
      else
      {
        v35 = objc_msgSend(v38, "isEditable");

        if (!v35)
          goto LABEL_14;
      }
    }
    else if ((objc_msgSend(v38, "isEditable") & 1) == 0)
    {
      goto LABEL_14;
    }
    -[ICTableAttachmentViewController beginEditingCellWithColumnID:andRowID:location:](self, "beginEditingCellWithColumnID:andRowID:location:", v39, v36, 0);
    goto LABEL_14;
  }
LABEL_19:

}

void __50__ICTableAttachmentViewController_applyUndoGroup___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "table");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergeableStringForColumnID:rowID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__ICTableAttachmentViewController_applyUndoGroup___block_invoke_2;
  v6[3] = &unk_1EA7DD498;
  v7 = v3;
  v4 = *(void **)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  v5 = v3;
  objc_msgSend(v4, "applyUndoWithBlock:", v6);

}

uint64_t __50__ICTableAttachmentViewController_applyUndoGroup___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyUndoCommand:", *(_QWORD *)(a1 + 40));
}

uint64_t __50__ICTableAttachmentViewController_applyUndoGroup___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "characterRangeForRowID:", *(_QWORD *)(a1 + 40));
  return v1 + v2;
}

- (void)addUndoCommandsForObject:(id)a3 block:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[ICTableAttachmentViewController beginEditing](self, "beginEditing");
  -[ICTableAttachmentViewController undoCommands](self, "undoCommands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _Block_copy(v5);

  objc_msgSend(v6, "addObject:", v7);
  -[ICTableAttachmentViewController endEditing](self, "endEditing");
}

- (BOOL)wantsUndoCommands
{
  return 1;
}

- (id)icTableDataFromPasteboard
{
  return 0;
}

- (id)soloPlainTextStringFromPasteboard
{
  return 0;
}

- (id)notesDataFromPasteboard
{
  return 0;
}

- (id)attributedStringFromPasteboard
{
  void *v3;
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

  -[ICTableAttachmentViewController notesDataFromPasteboard](self, "notesDataFromPasteboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0D63BD8], "pasteboardDataFromPersistenceData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CB3498];
  objc_msgSend(v4, "attributedStringData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataPersister");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentViewController attachment](self, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "note");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentViewController attachment](self, "attachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_attributedStringWithData:dataPersister:createNewAttachmentsInNote:forParentAttachment:error:", v7, v8, v10, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_4:
    -[ICTableAttachmentViewController soloPlainTextStringFromPasteboard](self, "soloPlainTextStringFromPasteboard");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v13);
    else
      v12 = 0;

  }
  return v12;
}

- (id)icTableFromPasteboard
{
  void *v3;
  id v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  -[ICTableAttachmentViewController icTableDataFromPasteboard](self, "icTableDataFromPasteboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_6;
  v4 = objc_alloc(MEMORY[0x1E0D63CD8]);
  -[ICTableAttachmentViewController table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replica");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(v4, "initWithData:replicaID:", v3, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v4, "initWithData:replicaID:", v3, v9);

  }
  objc_msgSend(v8, "table");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_6:
    -[ICTableAttachmentViewController attributedStringFromPasteboard](self, "attributedStringFromPasteboard");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentViewController attachment](self, "attachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ic_attributedStringByFlatteningCalculateAttachmentsWithContext:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0D63A48];
    -[ICAttachmentViewController attachment](self, "attachment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "managedObjectContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController table](self, "table");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "document");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "replica");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v15, "tableFromAttributedString:managedObjectContext:replicaID:", v14, v17, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "tableFromAttributedString:managedObjectContext:replicaID:", v14, v17, v22);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v21, "table");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)icTableDataForSelection
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v28;

  -[ICTableAttachmentViewController table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");
  v6 = v5;
  if (v5 == 4 || v5 == 2)
  {
    objc_msgSend(v4, "columns");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "columnIndexesForIdentifiers:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  if ((unint64_t)(v6 - 3) > 1)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v4, "rows");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rowIndexesForIdentifiers:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v28 = v3;
  v11 = objc_alloc(MEMORY[0x1E0D63A70]);
  -[ICTableAttachmentViewController table](self, "table");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "document");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "replica");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithReplica:", v14);

  -[ICTableAttachmentViewController table](self, "table");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "subtableWithDocument:forSelectionContainingColumnIndices:rowIndices:", v15, v8, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setRootObject:", v17);
  v18 = objc_alloc(MEMORY[0x1E0D63CD8]);
  -[ICTableAttachmentViewController table](self, "table");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "document");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "replica");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)objc_msgSend(v18, "initWithData:replicaID:", 0, v21);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v18, "initWithData:replicaID:", 0, v23);

  }
  v24 = objc_msgSend(MEMORY[0x1E0D63CD8], "serializationVersion");
  objc_msgSend(v15, "archivedData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "mergeVersion:fromData:", v24, v25);

  objc_msgSend(v22, "serialize");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)attributedStringForTableSelectionInContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v4 = (void *)MEMORY[0x1E0D639F0];
  v5 = (void *)MEMORY[0x1E0CB3A28];
  v6 = a3;
  objc_msgSend(v5, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "newObjectWithIdentifier:context:", v8, v6);

  objc_msgSend(v9, "setTypeUTI:", *MEMORY[0x1E0D636B8]);
  -[ICTableAttachmentViewController icTableDataForSelection](self, "icTableDataForSelection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMergeableData:", v10);

  objc_msgSend(MEMORY[0x1E0D64D98], "textAttachmentWithAttachment:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x1E0DC10F8], v11, 0, objc_msgSend(v13, "length"));
  objc_msgSend(MEMORY[0x1E0D63C90], "paragraphStyleNamed:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController table](self, "table");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWritingDirection:", objc_msgSend(v15, "isRightToLeft"));

  v16 = *MEMORY[0x1E0D63928];
  v17 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v13, "addAttribute:value:range:", v16, v17, 0, objc_msgSend(v13, "length"));

  v18 = (void *)objc_msgSend(v13, "copy");
  return v18;
}

- (id)plainTextDataForSelection
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0DC1180];
  v4 = *MEMORY[0x1E0DC1110];
  v8[0] = *MEMORY[0x1E0DC1120];
  v8[1] = v4;
  v9[0] = v3;
  v9[1] = &unk_1EA821E50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController dataForSelectionWithDocumentAttributes:](self, "dataForSelectionWithDocumentAttributes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)htmlDataForSelection
{
  return -[ICTableAttachmentViewController dataForSelectionOfType:](self, "dataForSelectionOfType:", *MEMORY[0x1E0DC1148]);
}

- (id)webArchiveDataForSelection
{
  void *v3;
  void *v4;

  objc_msgSend((id)*MEMORY[0x1E0CEC658], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController dataForSelectionOfType:](self, "dataForSelectionOfType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)RTFDataForSelection
{
  return -[ICTableAttachmentViewController dataForSelectionOfType:](self, "dataForSelectionOfType:", *MEMORY[0x1E0DC1188]);
}

- (id)dataForSelectionOfType:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0DC1120];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController dataForSelectionWithDocumentAttributes:](self, "dataForSelectionWithDocumentAttributes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dataForSelectionWithDocumentAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__10;
  v19 = __Block_byref_object_dispose__10;
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshotManagedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__ICTableAttachmentViewController_dataForSelectionWithDocumentAttributes___block_invoke;
  v11[3] = &unk_1EA7DDC40;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  v8 = v4;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v7, "performBlockAndWait:", v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __74__ICTableAttachmentViewController_dataForSelectionWithDocumentAttributes___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "attributedStringForTableSelectionInContext:", *(_QWORD *)(a1 + 40));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x1E0D64D60]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "initWithAttributedString:replicaID:", v10, v3);

  objc_msgSend(v4, "setFilterSubstringAttributes:", 1);
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0DC1120]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC1180]);

  if (v6)
    objc_msgSend(v4, "setFilterSubstringAttributesForPlainText:", 1);
  objc_msgSend(v4, "dataFromRange:documentAttributes:error:", 0, objc_msgSend(v4, "length"), *(_QWORD *)(a1 + 48), 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)customPasteboardDataForSelection
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  ICTableAttachmentViewController *v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__10;
  v26 = __Block_byref_object_dispose__10;
  v27 = 0;
  v3 = objc_alloc(MEMORY[0x1E0D63AC8]);
  -[ICAttachmentViewController attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithObjectIdentifier:forPasteboard:", v5, 1);

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "snapshotManagedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __67__ICTableAttachmentViewController_customPasteboardDataForSelection__block_invoke;
  v17 = &unk_1EA7DDAE0;
  v18 = self;
  v9 = v8;
  v19 = v9;
  v21 = &v22;
  v10 = v6;
  v20 = v10;
  objc_msgSend(v9, "performBlockAndWait:", &v14);
  if (v23[5])
  {
    v11 = objc_alloc(MEMORY[0x1E0D63BD8]);
    v12 = (void *)objc_msgSend(v11, "initWithAttributedStringData:dataPersister:", v23[5], v10, v14, v15, v16, v17, v18, v19);
  }
  else
  {
    v12 = 0;
  }

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __67__ICTableAttachmentViewController_customPasteboardDataForSelection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "attributedStringForTableSelectionInContext:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_serializeWithFlags:dataPersister:managedObjectContext:error:", 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)pasteboardItemsForSelection
{
  void *v3;
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
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController webArchiveDataForSelection](self, "webArchiveDataForSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC658], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, v5);

  }
  -[ICTableAttachmentViewController htmlDataForSelection](self, "htmlDataForSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v7);

  }
  -[ICTableAttachmentViewController RTFDataForSelection](self, "RTFDataForSelection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC4E8], "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v9);

  }
  -[ICTableAttachmentViewController plainTextDataForSelection](self, "plainTextDataForSelection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);

  }
  -[ICTableAttachmentViewController icTableDataForSelection](self, "icTableDataForSelection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("com.apple.notes.table"));

  -[ICTableAttachmentViewController customPasteboardDataForSelection](self, "customPasteboardDataForSelection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "persistenceData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D637F0]);

  }
  v16 = (void *)objc_msgSend(v3, "copy");

  return v16;
}

- (void)tableDidCreateColumnTextStorage:(id)a3
{
  objc_msgSend(a3, "setDelegate:", self);
}

- (void)tableDidPopulateCellAtColumnIndex:(unint64_t)a3 rowIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];

  -[ICTableAttachmentViewController table](self, "table");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifierForColumnAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController table](self, "table");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifierForRowAtIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController table](self, "table");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textStorageForColumn:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEditing");

  if (v13)
  {
    v14 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1DD7B0000, v14, OS_LOG_TYPE_INFO, "Not ensuring cell exists in column layout manager because its text storage is editing", v17, 2u);
    }

  }
  else
  {
    -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "columnLayoutManagerForColumn:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "ensureCellExistsAtRowID:", v10);
  }

}

- (void)tableWillRemoveColumnID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[ICTableAttachmentViewController table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textStorageForColumn:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((storage) != nil)", "-[ICTableAttachmentViewController tableWillRemoveColumnID:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "storage");
  -[ICAttachmentViewController attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "markBlockAndInlineAttachmentsForDeletion:inAttributedString:", 1, v8);

}

- (void)tableDidInsertColumnID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[ICTableAttachmentViewController table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textStorageForColumn:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((storage) != nil)", "-[ICTableAttachmentViewController tableDidInsertColumnID:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "storage");
  -[ICAttachmentViewController attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "markBlockAndInlineAttachmentsForDeletion:inAttributedString:", 0, v8);

}

- (void)showColumnRowButtons
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  -[ICAttachmentViewController attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEditable");

  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "setHidden:", 0);

    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "setHidden:", 1);

    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    v9 = 1;
  }
  objc_msgSend(v8, "setHidden:", v9);

}

- (void)hideColumnRowButtons
{
  void *v3;
  void *v4;
  void *v5;

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unselect");

  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[ICTableAttachmentViewController unselectColumnRow](self, "unselectColumnRow");
}

- (CGRect)selectionFrameFromContentFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect result;
  CGRect v34;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "borderWidth");
  v11 = v10 * -0.5;

  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v30 = CGRectInset(v29, v11, v11);
  v12 = v30.origin.x;
  v13 = v30.origin.y;
  v14 = v30.size.width;
  v15 = v30.size.height;
  -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v34.origin.x = v17;
  v34.origin.y = v18;
  v34.size.width = v19;
  v34.size.height = v20;
  v31.origin.x = v12;
  v31.origin.y = v13;
  v31.size.width = v14;
  v31.size.height = v15;
  v32 = CGRectIntersection(v31, v34);
  v21 = v32.origin.x;
  v22 = v32.origin.y;
  v23 = v32.size.width;
  v24 = v32.size.height;

  v25 = v21;
  v26 = v22;
  v27 = v23;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (void)updateChrome
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  double v88;
  CGFloat v89;
  void *v90;
  double v91;
  CGFloat v92;
  double v93;
  CGFloat v94;
  double v95;
  CGFloat v96;
  double v97;
  CGFloat v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  void *v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  double v128;
  void *v129;
  void *v130;
  double v131;
  double v132;
  double v133;
  double v134;
  void *v135;
  void *v136;
  double v137;
  double v138;
  double v139;
  CGFloat v140;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v145;
  int v146;
  CGFloat v147;
  CGFloat v148;
  CGFloat v149;
  CGFloat v150;
  double MinX;
  double MinY;
  double MaxX;
  void *v154;
  double v155;
  CGFloat v156;
  double v157;
  CGFloat v158;
  double v159;
  CGFloat v160;
  double v161;
  CGFloat v162;
  void *v163;
  double v164;
  CGFloat v165;
  double v166;
  CGFloat v167;
  double v168;
  CGFloat v169;
  double v170;
  CGFloat v171;
  double v172;
  double v173;
  double v174;
  double v175;
  void *v176;
  void *v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  void *v186;
  uint64_t v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  uint64_t v196;
  void *v197;
  uint64_t v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  uint64_t v204;
  void *v205;
  uint64_t v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  double v216;
  void *v217;
  void *v218;
  double v219;
  double v220;
  double v221;
  double v222;
  void *v223;
  void *v224;
  double v225;
  double v226;
  double v227;
  CGFloat v228;
  CGFloat v229;
  CGFloat v230;
  CGFloat v231;
  CGFloat v232;
  double v233;
  double v234;
  double v235;
  double v236;
  void *v237;
  int v238;
  double v239;
  double v240;
  double v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  double v246;
  double v247;
  double v248;
  double v249;
  double v250;
  double v251;
  double v252;
  double v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  double v258;
  double v259;
  double v260;
  double v261;
  double v262;
  double v263;
  double v264;
  double v265;
  void *v266;
  void *v267;
  double v268;
  void *v269;
  double v270;
  double v271;
  _BOOL8 v272;
  void *v273;
  void *v274;
  double v275;
  double v276;
  double v277;
  _BOOL8 v278;
  void *v279;
  double v280;
  CGFloat v281;
  double v282;
  void *v283;
  void *v284;
  void *v285;
  double v286;
  double v287;
  double v288;
  double v289;
  double v290;
  double v291;
  double v292;
  double v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  double v298;
  double v299;
  double v300;
  double v301;
  double v302;
  double v303;
  double v304;
  double v305;
  void *v306;
  void *v307;
  double MidX;
  double v309;
  double v310;
  _BOOL8 v311;
  void *v312;
  void *v313;
  double v314;
  double v315;
  double v316;
  _BOOL8 v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  _QWORD v326[2];
  CGRect v327;
  CGRect v328;
  CGRect v329;
  CGRect v330;
  CGRect v331;
  CGRect v332;
  CGRect v333;
  CGRect v334;
  CGRect v335;
  CGRect v336;
  CGRect v337;
  CGRect v338;
  CGRect v339;
  CGRect v340;
  CGRect v341;
  CGRect v342;
  CGRect v343;
  CGRect v344;
  CGRect v345;
  CGRect v346;
  CGRect v347;
  CGRect v348;
  CGRect v349;
  CGRect v350;
  CGRect v351;
  CGRect v352;
  CGRect v353;
  CGRect v354;
  CGRect v355;
  CGRect v356;
  CGRect v357;
  CGRect v358;
  CGRect v359;

  v326[1] = *MEMORY[0x1E0C80C00];
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if ((unint64_t)(v6 - 2) >= 2)
  {
    if (v6 == 4)
    {
      -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "columns");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v63, "count"))
      {
        -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "rows");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v65, "count");

        if (!v66)
          goto LABEL_92;
        -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "superview");
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v68)
        {
          -[ICTableAttachmentViewController scrollView](self, "scrollView");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "addSubview:", v70);

        }
        -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "columns");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "firstObject");
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "rows");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "firstObject");
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "columns");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "lastObject");
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "rows");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "lastObject");
        v80 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "frameOfCellAtColumn:row:", v62, v63);
        v83 = v82;
        v85 = v84;
        v87 = v86;
        v89 = v88;

        -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "frameOfCellAtColumn:row:", v77, v80);
        v92 = v91;
        v94 = v93;
        v96 = v95;
        v98 = v97;

        v329.origin.x = v83;
        v329.origin.y = v85;
        v329.size.width = v87;
        v329.size.height = v89;
        v358.origin.x = v92;
        v358.origin.y = v94;
        v358.size.width = v96;
        v358.size.height = v98;
        v330 = CGRectUnion(v329, v358);
        v331 = CGRectIntegral(v330);
        -[ICTableAttachmentViewController selectionFrameFromContentFrame:](self, "selectionFrameFromContentFrame:", v331.origin.x, v331.origin.y, v331.size.width, v331.size.height);
        v100 = v99;
        v102 = v101;
        v104 = v103;
        v106 = v105;
        -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTableAttachmentViewController scrollView](self, "scrollView");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "convertRect:toView:", v108, v100, v102, v104, v106);
        v110 = v109;
        v112 = v111;
        v114 = v113;
        v116 = v115;
        -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "setFrame:", v110, v112, v114, v116);

        -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "layer");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "setMaskedCorners:", 15);

        -[ICTableAttachmentViewController startKnob](self, "startKnob");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "superview");
        v121 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v121)
        {
          -[ICTableAttachmentViewController view](self, "view");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICTableAttachmentViewController startKnob](self, "startKnob");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "addSubview:", v123);

        }
        -[ICTableAttachmentViewController endKnob](self, "endKnob");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "superview");
        v125 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v125)
        {
          -[ICTableAttachmentViewController view](self, "view");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICTableAttachmentViewController endKnob](self, "endKnob");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "addSubview:", v127);

        }
        v128 = *MEMORY[0x1E0D64A68];
        -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "layer");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "borderWidth");
        v132 = v131;

        if (v132 >= v104)
          v133 = v104;
        else
          v133 = v132;
        v134 = v133 * 0.5;
        -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "layer");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "borderWidth");
        v138 = v137;

        if (v138 >= v106)
          v139 = v106;
        else
          v139 = v138;
        v140 = v139 * 0.5;
        v332.origin.x = v100;
        v332.origin.y = v102;
        v332.size.width = v104;
        v332.size.height = v106;
        v333 = CGRectInset(v332, v134, v140);
        x = v333.origin.x;
        y = v333.origin.y;
        width = v333.size.width;
        height = v333.size.height;
        -[ICTableAttachmentViewController table](self, "table");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v146 = objc_msgSend(v145, "isLeftToRight");

        v147 = x;
        v148 = y;
        v149 = width;
        v150 = height;
        if (v146)
        {
          MinX = CGRectGetMinX(*(CGRect *)&v147);
          v334.origin.x = x;
          v334.origin.y = y;
          v334.size.width = width;
          v334.size.height = height;
          MinY = CGRectGetMinY(v334);
          v335.origin.x = x;
          v335.origin.y = y;
          v335.size.width = width;
          v335.size.height = height;
          MaxX = CGRectGetMaxX(v335);
        }
        else
        {
          MinX = CGRectGetMaxX(*(CGRect *)&v147);
          v350.origin.x = x;
          v350.origin.y = y;
          v350.size.width = width;
          v350.size.height = height;
          MinY = CGRectGetMinY(v350);
          v351.origin.x = x;
          v351.origin.y = y;
          v351.size.width = width;
          v351.size.height = height;
          MaxX = CGRectGetMinX(v351);
        }
        v280 = MaxX;
        v352.origin.x = x;
        v352.origin.y = y;
        v352.size.width = width;
        v352.size.height = height;
        v281 = CGRectGetMaxY(v352) - v128;
        v282 = v280 - v128;
        -[ICTableAttachmentViewController startKnob](self, "startKnob");
        v283 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v283, "superview");
        v284 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
        v285 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v284, "convertRect:fromView:", v285, MinX - v128, MinY - v128, v128 + v128, v128 + v128);
        v287 = v286;
        v289 = v288;
        v291 = v290;
        v293 = v292;
        -[ICTableAttachmentViewController startKnob](self, "startKnob");
        v294 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v294, "setFrame:", v287, v289, v291, v293);

        -[ICTableAttachmentViewController endKnob](self, "endKnob");
        v295 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v295, "superview");
        v296 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
        v297 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v296, "convertRect:fromView:", v297, v282, v281, v128 + v128, v128 + v128);
        v299 = v298;
        v301 = v300;
        v303 = v302;
        v305 = v304;
        -[ICTableAttachmentViewController endKnob](self, "endKnob");
        v306 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v306, "setFrame:", v299, v301, v303, v305);

        -[ICTableAttachmentViewController startKnob](self, "startKnob");
        v307 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v307, "frame");
        MidX = CGRectGetMidX(v353);
        if (MidX < 0.0)
        {
          v311 = 1;
        }
        else
        {
          -[ICTableAttachmentViewController startKnob](self, "startKnob");
          v296 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v296, "frame");
          v309 = CGRectGetMidX(v354);
          -[ICTableAttachmentViewController view](self, "view");
          v297 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v297, "bounds");
          v311 = v309 > v310;
        }
        -[ICTableAttachmentViewController startKnob](self, "startKnob");
        v312 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v312, "setHidden:", v311);

        if (MidX >= 0.0)
        {

        }
        -[ICTableAttachmentViewController endKnob](self, "endKnob");
        v313 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v313, "frame");
        v314 = CGRectGetMidX(v355);
        if (v314 < 0.0)
        {
          v317 = 1;
        }
        else
        {
          -[ICTableAttachmentViewController endKnob](self, "endKnob");
          v296 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v296, "frame");
          v315 = CGRectGetMidX(v356);
          -[ICTableAttachmentViewController view](self, "view");
          v297 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v297, "bounds");
          v317 = v315 > v316;
        }
        -[ICTableAttachmentViewController endKnob](self, "endKnob");
        v318 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v318, "setHidden:", v317);

        if (v314 >= 0.0)
        {

        }
        -[ICTableAttachmentViewController columnButton](self, "columnButton");
        v319 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v319, "setHidden:", 1);

        -[ICTableAttachmentViewController rowButton](self, "rowButton");
        v320 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v320, "setHidden:", 1);

      }
    }
    else
    {
      -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v189, "removeFromSuperview");

      -[ICTableAttachmentViewController startKnob](self, "startKnob");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "removeFromSuperview");

      -[ICTableAttachmentViewController endKnob](self, "endKnob");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "removeFromSuperview");
    }

    goto LABEL_92;
  }
  -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[ICTableAttachmentViewController scrollView](self, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

  }
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "columns");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rows");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "columns");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lastObject");
  v19 = objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rows");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lastObject");
  v22 = objc_claimAutoreleasedReturnValue();

  v323 = (void *)v22;
  v324 = (void *)v16;
  if (v4 == 2)
  {
    -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frameOfColumn:", v13);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;

    -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "frameOfColumn:", v19);
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;

    v327.origin.x = v25;
    v327.origin.y = v27;
    v327.size.width = v29;
    v327.size.height = v31;
    v357.origin.x = v34;
    v357.origin.y = v36;
    v357.size.width = v38;
    v357.size.height = v40;
    v328 = CGRectUnion(v327, v357);
    -[ICTableAttachmentViewController selectionFrameFromContentFrame:](self, "selectionFrameFromContentFrame:", v328.origin.x, v328.origin.y, v328.size.width, v328.size.height);
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v48 = v47;
    -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController scrollView](self, "scrollView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "convertRect:toView:", v50, v42, v44, v46, v48);
    v52 = v51;
    v54 = v53;
    v56 = v55;
    v58 = v57;
    -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setFrame:", v52, v54, v56, v58);

    -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "layer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setMaskedCorners:", 12);
LABEL_28:

    goto LABEL_31;
  }
  if (v4 == 3)
  {
    -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "frameOfRow:", v16);
    v156 = v155;
    v158 = v157;
    v160 = v159;
    v162 = v161;

    -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "frameOfRow:", v22);
    v165 = v164;
    v167 = v166;
    v169 = v168;
    v171 = v170;

    v336.origin.x = v156;
    v336.origin.y = v158;
    v336.size.width = v160;
    v336.size.height = v162;
    v359.origin.x = v165;
    v359.origin.y = v167;
    v359.size.width = v169;
    v359.size.height = v171;
    v337 = CGRectUnion(v336, v359);
    -[ICTableAttachmentViewController selectionFrameFromContentFrame:](self, "selectionFrameFromContentFrame:", v337.origin.x, v337.origin.y, v337.size.width, v337.size.height);
    v42 = v172;
    v44 = v173;
    v46 = v174;
    v48 = v175;
    -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController scrollView](self, "scrollView");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "convertRect:toView:", v177, v42, v44, v46, v48);
    v179 = v178;
    v181 = v180;
    v183 = v182;
    v185 = v184;
    -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v186, "setFrame:", v179, v181, v183, v185);

    -[ICTableAttachmentViewController table](self, "table");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v60, "isLeftToRight"))
      v187 = 10;
    else
      v187 = 5;
    -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "layer");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "setMaskedCorners:", v187);

    goto LABEL_28;
  }
  v46 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v48 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v42 = *MEMORY[0x1E0C9D648];
  v44 = *(double *)(MEMORY[0x1E0C9D648] + 8);
LABEL_31:
  -[ICTableAttachmentViewController table](self, "table");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "columns");
  v193 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v193, "count"))
    goto LABEL_37;
  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "columnOrRowIdentifiers");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v196 = objc_msgSend(v195, "count");

  if (v196)
  {
    -[ICTableAttachmentViewController columnButton](self, "columnButton");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v197, "columnOrRowIdentifiers");
    v198 = objc_claimAutoreleasedReturnValue();
LABEL_36:
    v199 = (void *)v198;

    v193 = v199;
    goto LABEL_37;
  }
  if (objc_msgSend(v191, "columnCount"))
  {
    objc_msgSend(v191, "identifierForColumnAtIndex:", 0);
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    v326[0] = v197;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v326, 1);
    v198 = objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }

  v193 = 0;
LABEL_37:
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v200, "rows");
  v201 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v201, "count"))
  {
LABEL_43:
    if (v193 && v201)
      -[ICTableAttachmentViewController showButtonsAtColumns:rows:](self, "showButtonsAtColumns:rows:", v193, v201);
    goto LABEL_46;
  }
  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "columnOrRowIdentifiers");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v204 = objc_msgSend(v203, "count");

  if (v204)
  {
    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v205, "columnOrRowIdentifiers");
    v206 = objc_claimAutoreleasedReturnValue();
LABEL_42:
    v207 = (void *)v206;

    v201 = v207;
    goto LABEL_43;
  }
  if (objc_msgSend(v191, "rowCount"))
  {
    objc_msgSend(v191, "identifierForRowAtIndex:", 0);
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    v325 = v205;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v325, 1);
    v206 = objc_claimAutoreleasedReturnValue();
    goto LABEL_42;
  }

  v201 = 0;
LABEL_46:
  -[ICTableAttachmentViewController startKnob](self, "startKnob");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "superview");
  v209 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v209)
  {
    -[ICTableAttachmentViewController view](self, "view");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController startKnob](self, "startKnob");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v210, "addSubview:", v211);

  }
  -[ICTableAttachmentViewController endKnob](self, "endKnob");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v212, "superview");
  v213 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v213)
  {
    -[ICTableAttachmentViewController view](self, "view");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController endKnob](self, "endKnob");
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v214, "addSubview:", v215);

  }
  v216 = *MEMORY[0x1E0D64A68];
  -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v217, "layer");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v218, "borderWidth");
  v220 = v219;

  if (v220 >= v46)
    v221 = v46;
  else
    v221 = v220;
  v222 = v221 * 0.5;
  -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v223, "layer");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v224, "borderWidth");
  v226 = v225;

  if (v226 >= v48)
    v227 = v48;
  else
    v227 = v226;
  v228 = v227 * 0.5;
  v338.origin.x = v42;
  v338.origin.y = v44;
  v338.size.width = v46;
  v338.size.height = v48;
  v339 = CGRectInset(v338, v222, v228);
  v229 = v339.origin.x;
  v230 = v339.origin.y;
  v231 = v339.size.width;
  v232 = v339.size.height;
  v321 = v191;
  if (v4 == 2)
  {
    v233 = CGRectGetMinX(v339) - v216;
    v340.origin.x = v229;
    v340.origin.y = v230;
    v340.size.width = v231;
    v340.size.height = v232;
    v234 = CGRectGetMidY(v340) - v216;
    v341.origin.x = v229;
    v341.origin.y = v230;
    v341.size.width = v231;
    v341.size.height = v232;
    v235 = CGRectGetMaxX(v341) - v216;
    v342.origin.x = v229;
    v342.origin.y = v230;
    v342.size.width = v231;
    v342.size.height = v232;
    v236 = CGRectGetMidY(v342) - v216;
    -[ICTableAttachmentViewController table](self, "table", v191, v323, v324);
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    v238 = objc_msgSend(v237, "isLeftToRight");

    if (v238)
      v239 = v236;
    else
      v239 = v234;
    if (v238)
      v240 = v235;
    else
      v240 = v233;
    if (!v238)
    {
      v234 = v236;
      v233 = v235;
    }
    v241 = v240;
  }
  else
  {
    v233 = CGRectGetMidX(v339) - v216;
    v343.origin.x = v229;
    v343.origin.y = v230;
    v343.size.width = v231;
    v343.size.height = v232;
    v234 = CGRectGetMinY(v343) - v216;
    v344.origin.x = v229;
    v344.origin.y = v230;
    v344.size.width = v231;
    v344.size.height = v232;
    v241 = CGRectGetMidX(v344) - v216;
    v345.origin.x = v229;
    v345.origin.y = v230;
    v345.size.width = v231;
    v345.size.height = v232;
    v239 = CGRectGetMaxY(v345) - v216;
  }
  v242 = (void *)v19;
  -[ICTableAttachmentViewController startKnob](self, "startKnob", v321);
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v243, "superview");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v244, "convertRect:fromView:", v245, v233, v234, v216 + v216, v216 + v216);
  v247 = v246;
  v249 = v248;
  v251 = v250;
  v253 = v252;
  -[ICTableAttachmentViewController startKnob](self, "startKnob");
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v254, "setFrame:", v247, v249, v251, v253);

  -[ICTableAttachmentViewController endKnob](self, "endKnob");
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v255, "superview");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v256, "convertRect:fromView:", v257, v241, v239, v216 + v216, v216 + v216);
  v259 = v258;
  v261 = v260;
  v263 = v262;
  v265 = v264;
  -[ICTableAttachmentViewController endKnob](self, "endKnob");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v266, "setFrame:", v259, v261, v263, v265);

  -[ICTableAttachmentViewController startKnob](self, "startKnob");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v267, "frame");
  v268 = CGRectGetMidX(v346);
  v269 = (void *)v13;
  if (v268 < 0.0)
  {
    v272 = 1;
  }
  else
  {
    -[ICTableAttachmentViewController startKnob](self, "startKnob");
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v266, "frame");
    v270 = CGRectGetMidX(v347);
    -[ICTableAttachmentViewController view](self, "view");
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v255, "bounds");
    v272 = v270 > v271;
  }
  -[ICTableAttachmentViewController startKnob](self, "startKnob");
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v273, "setHidden:", v272);

  if (v268 >= 0.0)
  {

  }
  -[ICTableAttachmentViewController endKnob](self, "endKnob");
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v274, "frame");
  v275 = CGRectGetMidX(v348);
  if (v275 < 0.0)
  {
    v278 = 1;
  }
  else
  {
    -[ICTableAttachmentViewController endKnob](self, "endKnob");
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v266, "frame");
    v276 = CGRectGetMidX(v349);
    -[ICTableAttachmentViewController view](self, "view");
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v255, "bounds");
    v278 = v276 > v277;
  }
  -[ICTableAttachmentViewController endKnob](self, "endKnob");
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v279, "setHidden:", v278);

  if (v275 >= 0.0)
  {

  }
LABEL_92:
  -[ICTableAttachmentViewController updateButtonFrames](self, "updateButtonFrames");
}

- (void)updateButtonFrames
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  void *v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double width;
  double MinX;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  double v74;
  CGFloat v75;
  double v76;
  CGFloat v77;
  double v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  void *v82;
  double v83;
  CGFloat v84;
  double v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  double v89;
  CGFloat v90;
  double v91;
  CGFloat v92;
  double v93;
  CGFloat v94;
  double v95;
  CGFloat v96;
  double v97;
  double v98;
  void *v99;
  int v100;
  double v101;
  double v102;
  double MinY;
  void *v104;
  void *v105;
  double v106;
  CGFloat v107;
  double v108;
  CGFloat v109;
  double v110;
  CGFloat v111;
  double v112;
  CGFloat v113;
  double v114;
  double v115;
  void *v116;
  double v117;
  double v118;
  double v119;
  double MaxX;
  double v121;
  double v122;
  void *v123;
  void *v124;
  double v125;
  CGFloat v126;
  double v127;
  CGFloat v128;
  double v129;
  CGFloat v130;
  double v131;
  double v132;
  double v133;
  double v134;
  CGFloat v135;
  CGFloat v136;
  CGFloat v137;
  CGFloat v138;
  id v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "columns");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v139 = v5;
  }
  else
  {
    -[ICTableAttachmentViewController columnButton](self, "columnButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "columnOrRowIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v139 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "columns");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    -[ICTableAttachmentViewController columnButton](self, "columnButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "columnOrRowIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastObject");
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!v139)
    goto LABEL_12;
  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isHidden"))
  {

LABEL_12:
    -[ICTableAttachmentViewController headerClipView](self, "headerClipView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bounds");
    v54 = v53;
    -[ICTableAttachmentViewController columnButton](self, "columnButton");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setFrame:", v54, 0.0, 0.0, 0.0);
    goto LABEL_13;
  }
  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "columnIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "containsObject:", v139);

  if (!v19)
    goto LABEL_12;
  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frameOfColumn:", v139);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "frameOfColumn:", v13);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;

  v140.origin.x = v22;
  v140.origin.y = v24;
  v140.size.width = v26;
  v140.size.height = v28;
  v152.origin.x = v31;
  v152.origin.y = v33;
  v152.size.width = v35;
  v152.size.height = v37;
  v141 = CGRectUnion(v140, v152);
  -[ICTableAttachmentViewController selectionFrameFromContentFrame:](self, "selectionFrameFromContentFrame:", v141.origin.x, v141.origin.y, v141.size.width, v141.size.height);
  width = v142.size.width;
  MinX = CGRectGetMinX(v142);
  v40 = *MEMORY[0x1E0D64A18];
  v41 = -*MEMORY[0x1E0D64A18];
  -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController headerClipView](self, "headerClipView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "convertRect:toView:", v43, MinX, v41, width, v40);
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;
  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setFrame:", v45, v47, v49, v51);

LABEL_13:
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "rows");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "firstObject");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v57;
  if (v57)
  {
    v59 = v57;
  }
  else
  {
    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "columnOrRowIdentifiers");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "firstObject");
    v59 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "rows");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "lastObject");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v64;
  if (v64)
  {
    v66 = v64;
  }
  else
  {
    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "columnOrRowIdentifiers");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "lastObject");
    v66 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v59)
  {
    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v69, "isHidden") & 1) != 0)
    {
LABEL_32:

      goto LABEL_33;
    }
    -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "rowIDs");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "containsObject:", v59);

    if (v72)
    {
      -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "frameOfRow:", v59);
      v75 = v74;
      v77 = v76;
      v79 = v78;
      v81 = v80;

      -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "frameOfRow:", v66);
      v84 = v83;
      v86 = v85;
      v88 = v87;
      v90 = v89;

      v143.origin.x = v75;
      v143.origin.y = v77;
      v143.size.width = v79;
      v143.size.height = v81;
      v153.origin.x = v84;
      v153.origin.y = v86;
      v153.size.width = v88;
      v153.size.height = v90;
      v144 = CGRectUnion(v143, v153);
      -[ICTableAttachmentViewController selectionFrameFromContentFrame:](self, "selectionFrameFromContentFrame:", v144.origin.x, v144.origin.y, v144.size.width, v144.size.height);
      v92 = v91;
      v94 = v93;
      v96 = v95;
      v98 = v97;
      -[ICTableAttachmentViewController table](self, "table");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = objc_msgSend(v99, "isLeftToRight");

      if (v100)
      {
        v101 = *MEMORY[0x1E0D64A18];
        v102 = -*MEMORY[0x1E0D64A18];
        v145.origin.x = v92;
        v145.origin.y = v94;
        v145.size.width = v96;
        v145.size.height = v98;
        MinY = CGRectGetMinY(v145);
        -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTableAttachmentViewController view](self, "view");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "convertRect:toView:", v105, v102, MinY, v101, v98);
        v107 = v106;
        v109 = v108;
        v111 = v110;
        v113 = v112;

        v136 = v109;
        v138 = v107;
        v146.origin.x = v107;
        v146.origin.y = v109;
        v146.size.width = v111;
        v146.size.height = v113;
        v114 = CGRectGetMinX(v146);
        v147.origin.x = v102;
        v147.origin.y = MinY;
        v147.size.width = v101;
        v147.size.height = v98;
        v115 = CGRectGetMinX(v147);
        -[ICTableAttachmentViewController rowButton](self, "rowButton");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v116;
        if (v114 > v115)
        {
          v118 = v136;
          v117 = v138;
          v119 = v111;
LABEL_27:
          v134 = v113;
LABEL_31:
          objc_msgSend(v116, "setFrame:", v117, v118, v119, v134, *(_QWORD *)&v135);
          goto LABEL_32;
        }
        v117 = v102;
        v118 = MinY;
        v119 = v101;
      }
      else
      {
        v148.origin.x = v92;
        v148.origin.y = v94;
        v148.size.width = v96;
        v148.size.height = v98;
        MaxX = CGRectGetMaxX(v148);
        v149.origin.x = v92;
        v149.origin.y = v94;
        v149.size.width = v96;
        v149.size.height = v98;
        v121 = CGRectGetMinY(v149);
        v122 = *MEMORY[0x1E0D64A18];
        -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTableAttachmentViewController view](self, "view");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "convertRect:toView:", v124, MaxX, v121, v122, v98);
        v126 = v125;
        v128 = v127;
        v130 = v129;
        v113 = v131;

        v135 = v130;
        v137 = v126;
        v150.origin.x = v126;
        v150.origin.y = v128;
        v150.size.width = v130;
        v150.size.height = v113;
        v132 = CGRectGetMaxX(v150);
        v151.origin.x = MaxX;
        v151.origin.y = v121;
        v151.size.width = v122;
        v151.size.height = v98;
        v133 = CGRectGetMaxX(v151);
        -[ICTableAttachmentViewController rowButton](self, "rowButton");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v116;
        if (v132 < v133)
        {
          v119 = v135;
          v117 = v137;
          v118 = v128;
          goto LABEL_27;
        }
        v117 = MaxX;
        v118 = v121;
        v119 = v122;
      }
      v134 = v98;
      goto LABEL_31;
    }
  }
LABEL_33:

}

- (void)addColumnLeftOfSelection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "columns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController table](self, "table");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "columnIndexForIdentifier:", v8);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    -[ICTableAttachmentViewController addColumnAtIndex:](self, "addColumnAtIndex:", v7);

}

- (void)addColumnRightOfSelection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "columns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController table](self, "table");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "columnIndexForIdentifier:", v8);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    -[ICTableAttachmentViewController addColumnAtIndex:](self, "addColumnAtIndex:", v7 + 1);

}

- (void)addColumnBeforeSelection:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  -[ICTableAttachmentViewController table](self, "table");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLeftToRight");

  if (v5)
    -[ICTableAttachmentViewController addColumnLeftOfSelection:](self, "addColumnLeftOfSelection:", v6);
  else
    -[ICTableAttachmentViewController addColumnRightOfSelection:](self, "addColumnRightOfSelection:", v6);

}

- (void)addColumnAfterSelection:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  -[ICTableAttachmentViewController table](self, "table");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLeftToRight");

  if (v5)
    -[ICTableAttachmentViewController addColumnRightOfSelection:](self, "addColumnRightOfSelection:", v6);
  else
    -[ICTableAttachmentViewController addColumnLeftOfSelection:](self, "addColumnLeftOfSelection:", v6);

}

- (id)insertColumns:(unint64_t)a3 atIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[ICTableAttachmentViewController table](self, "table");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertColumns:atIndex:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13);
        -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager", (_QWORD)v26);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "columnWidthManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (id)objc_msgSend(v16, "invalidateWidthForColumns:", v17);

        -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "columnWidthManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "widthOfColumn:", v14);
        v22 = v21;

        -[ICTableAttachmentViewController columnWidthCache](self, "columnWidthCache");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setDimension:forKey:", v14, v22);

        v30 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTableAttachmentViewController postChangeNotification:columnOrRowUUIDs:](self, "postChangeNotification:columnOrRowUUIDs:", 0, v24);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v11);
  }

  return v9;
}

- (void)addColumnAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[ICTableAttachmentViewController beginEditing](self, "beginEditing");
  -[ICTableAttachmentViewController insertColumns:atIndex:](self, "insertColumns:atIndex:", 1, a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController redrawAndSave](self, "redrawAndSave");
  -[ICTableAttachmentViewController table](self, "table");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifierForRowAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController beginEditingCellWithColumnID:andRowID:location:](self, "beginEditingCellWithColumnID:andRowID:location:", v5, v7, 0);
  -[ICTableAttachmentViewController endEditing](self, "endEditing");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ADD_COLUMN_UNDO_STRING"), CFSTR("Add Column"), CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController undoManager](self, "undoManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActionName:", v9);

}

- (void)addRowAboveSelection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController table](self, "table");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rowIndexForIdentifier:", v8);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    -[ICTableAttachmentViewController addRowAtIndex:](self, "addRowAtIndex:", v7);

}

- (void)addRowBelowSelection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController table](self, "table");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rowIndexForIdentifier:", v8);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    -[ICTableAttachmentViewController addRowAtIndex:](self, "addRowAtIndex:", v7 + 1);

}

- (void)addRowAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[ICTableAttachmentViewController willAddRow](self, "willAddRow");
  -[ICTableAttachmentViewController beginEditing](self, "beginEditing");
  -[ICTableAttachmentViewController table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertRowAtIndex:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController redrawAndSave](self, "redrawAndSave");
  -[ICTableAttachmentViewController postChangeNotification:columnOrRowUUIDs:](self, "postChangeNotification:columnOrRowUUIDs:", 1, 0);
  -[ICTableAttachmentViewController table](self, "table");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifierForColumnAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController beginEditingCellWithColumnID:andRowID:location:](self, "beginEditingCellWithColumnID:andRowID:location:", v7, v11, 0);
  -[ICTableAttachmentViewController endEditing](self, "endEditing");
  -[ICTableAttachmentViewController undoManager](self, "undoManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Add Row"), &stru_1EA7E9860, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActionName:", v10);

}

- (void)deleteTable:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unselect");

  -[ICAttachmentViewController attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentViewController attachment](self, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "rangeForAttachment:", v7);
  v10 = v9;

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v11, "setSelectedRange:", v8, 0);

    LOBYTE(v11) = ICInternalSettingsIsTextKit2Enabled();
    objc_opt_class();
    if ((v11 & 1) != 0)
    {
      objc_opt_class();
      -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textLayoutManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textContentStorage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textStorage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v20 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "layoutManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "textStorage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v20, "beginEditing");
    objc_msgSend(v20, "replaceCharactersInRange:withString:", v8, v10, &stru_1EA7E9860);
    objc_msgSend(v20, "endEditing");
    -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textViewDidChange:", v19);

  }
}

- (void)deleteColumns:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t i;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICTableAttachmentViewController table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "columnsIntersectingWithColumns:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  v8 = objc_msgSend(v5, "columnCount");
  if (v7 && v7 < v8)
  {
    -[ICTableAttachmentViewController beginEditing](self, "beginEditing");
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v32 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v34;
      v13 = -1;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(v9);
          v15 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          v16 = objc_msgSend(v5, "columnIndexForIdentifier:", v15);
          objc_msgSend(v5, "removeColumnAtIndex:", v16);
          -[ICTableAttachmentViewController cleanDeletedColumn:](self, "cleanDeletedColumn:", v15);
          if (v13 >= v16)
            v13 = v16;
          -[ICTableAttachmentViewController tableAXController](self, "tableAXController");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "invalidateAXElementsForColumnID:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v11);
    }
    else
    {
      v13 = -1;
    }

    -[ICTableAttachmentViewController postChangeNotification:columnOrRowUUIDs:](self, "postChangeNotification:columnOrRowUUIDs:", 3, v9);
    -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "columnWidthManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v19, "invalidateWidthForColumns:", v9);

    -[ICTableAttachmentViewController hideColumnRowButtons](self, "hideColumnRowButtons");
    -[ICTableAttachmentViewController redrawAndSave](self, "redrawAndSave");
    if (objc_msgSend(v5, "columnCount") && objc_msgSend(v5, "rowCount"))
    {
      v21 = objc_msgSend(v5, "columnCount");
      if (v13 >= v21 - 1)
        v22 = v21 - 1;
      else
        v22 = v13;
      objc_msgSend(v5, "identifierForColumnAtIndex:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableAttachmentViewController rowButton](self, "rowButton");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "columnOrRowIdentifiers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICTableAttachmentViewController beginEditingCellWithColumnID:andRowID:location:](self, "beginEditingCellWithColumnID:andRowID:location:", v23, v26, 2);
    }
    -[ICTableAttachmentViewController endEditing](self, "endEditing");
    -[ICTableAttachmentViewController undoManager](self, "undoManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Delete %lu Column"), &stru_1EA7E9860, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringWithFormat:", v30, v7);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActionName:", v31);

    v6 = v32;
  }
  else if (v7 == objc_msgSend(v5, "columnCount"))
  {
    -[ICTableAttachmentViewController deleteTable:](self, "deleteTable:", self);
  }

}

- (void)deleteSelectedColumns:(id)a3
{
  void *v4;
  id v5;

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "columns");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController deleteColumns:](self, "deleteColumns:", v5);
}

- (void)deleteRows:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t i;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICTableAttachmentViewController table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowsIntersectingWithRows:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  v8 = objc_msgSend(v5, "rowCount");
  if (v7 && v7 < v8)
  {
    -[ICTableAttachmentViewController beginEditing](self, "beginEditing");
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v29 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v31;
      v13 = -1;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(v9);
          v15 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          v16 = objc_msgSend(v5, "rowIndexForIdentifier:", v15);
          objc_msgSend(v5, "removeRowAtIndex:", v16);
          -[ICTableAttachmentViewController cleanDeletedRow:](self, "cleanDeletedRow:", v15);
          if (v13 >= v16)
            v13 = v16;
          -[ICTableAttachmentViewController tableAXController](self, "tableAXController");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "invalidateAXElementsForRowID:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v11);
    }
    else
    {
      v13 = -1;
    }

    -[ICTableAttachmentViewController postChangeNotification:columnOrRowUUIDs:](self, "postChangeNotification:columnOrRowUUIDs:", 4, v9);
    -[ICTableAttachmentViewController hideColumnRowButtons](self, "hideColumnRowButtons");
    -[ICTableAttachmentViewController redrawAndSave](self, "redrawAndSave");
    v18 = objc_msgSend(v5, "rowCount");
    if (v13 >= v18 - 1)
      v19 = v18 - 1;
    else
      v19 = v13;
    objc_msgSend(v5, "identifierForRowAtIndex:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "columnCount") && objc_msgSend(v5, "rowCount"))
    {
      -[ICTableAttachmentViewController columnButton](self, "columnButton");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "columnOrRowIdentifiers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICTableAttachmentViewController beginEditingCellWithColumnID:andRowID:location:](self, "beginEditingCellWithColumnID:andRowID:location:", v23, v20, 2);
    }
    -[ICTableAttachmentViewController endEditing](self, "endEditing");
    -[ICTableAttachmentViewController undoManager](self, "undoManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Delete %lu Row"), &stru_1EA7E9860, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringWithFormat:", v27, v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setActionName:", v28);

    v6 = v29;
  }
  else if (v7 == objc_msgSend(v5, "rowCount"))
  {
    -[ICTableAttachmentViewController deleteTable:](self, "deleteTable:", self);
  }

}

- (void)deleteSelectedRows:(id)a3
{
  void *v4;
  id v5;

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rows");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController deleteRows:](self, "deleteRows:", v5);
}

- (void)cleanDeletedColumn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICTableAttachmentViewController columnWidthCache](self, "columnWidthCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeDimensionForKey:", v4);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ICTableAttachmentViewController cellHeightCache](self, "cellHeightCache", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11++), "removeDimensionForKey:", v4);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeColumnLayoutManagerForColumn:", v4);

  -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setVerticalLinePosition:forKey:", 0, v4);

  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeColumn:", v4);

}

- (void)cleanDeletedRow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  -[ICTableAttachmentViewController rowHeightCache](self, "rowHeightCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeDimensionForKey:", v18);

  -[ICTableAttachmentViewController cellHeightCache](self, "cellHeightCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v18);

  -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowPositions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v18);

  -[ICTableAttachmentViewController table](self, "table");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "columnCount");

  if (v9)
  {
    v10 = 0;
    do
    {
      -[ICTableAttachmentViewController table](self, "table");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifierForColumnAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "columnLayoutManagerForColumn:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "removeRow:", v18);
      ++v10;
      -[ICTableAttachmentViewController table](self, "table");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "columnCount");

    }
    while (v10 < v16);
  }
  -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHorizontalLinePosition:forKey:", 0, v18);

}

- (void)dragBeganOnColumnOrRow:(BOOL)a3 atLocation:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  _QWORD v10[7];
  BOOL v11;

  y = a4.y;
  x = a4.x;
  objc_msgSend(MEMORY[0x1E0D639E8], "currentInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController setDraggingAppearance:](self, "setDraggingAppearance:", v8);

  -[ICTableAttachmentViewController draggingAppearance](self, "draggingAppearance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__ICTableAttachmentViewController_dragBeganOnColumnOrRow_atLocation___block_invoke;
  v10[3] = &unk_1EA7DF850;
  v10[4] = self;
  v11 = a3;
  *(CGFloat *)&v10[5] = x;
  *(CGFloat *)&v10[6] = y;
  objc_msgSend(v9, "performAsDefaultAppearance:", v10);

}

void __69__ICTableAttachmentViewController_dragBeganOnColumnOrRow_atLocation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double x;
  double y;
  double width;
  double height;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  void *v46;
  void *v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  CGPath *Mutable;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  double v113;
  id v114;
  void *v115;
  const CGPath *v116;
  void *v117;
  void *v118;
  ICTableAutoScroller *v119;
  void *v120;
  void *v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t i;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t j;
  void *v136;
  CGFloat v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  const __CFString *v151;
  void *v152;
  void *v153;
  _QWORD v154[5];
  char v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  _BYTE v164[128];
  _BYTE v165[128];
  uint64_t v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;

  v166 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "tableSelection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMoving:", 1);

  objc_msgSend(*(id *)(a1 + 32), "currentlyEditingTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextSelectionHidden:", 1);

  LODWORD(v3) = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "tableSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((_DWORD)v3)
  {
    objc_msgSend(v4, "columns");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "textViewManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frameOfColumn:", v8);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    objc_msgSend(*(id *)(a1 + 32), "textViewManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frameOfColumn:", v18);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    v167.origin.x = v10;
    v167.origin.y = v12;
    v167.size.width = v14;
    v167.size.height = v16;
    v177.origin.x = v20;
    v177.origin.y = v22;
    v177.size.width = v24;
    v177.size.height = v26;
    v168 = CGRectUnion(v167, v177);
    x = v168.origin.x;
    y = v168.origin.y;
    width = v168.size.width;
    height = v168.size.height;
    objc_msgSend(*(id *)(a1 + 32), "rowButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setHidden:", 1);

    objc_msgSend(*(id *)(a1 + 32), "table");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCurrentDragIndex:", objc_msgSend(v32, "columnIndexForIdentifier:", v33));

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "textViewManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setDraggedColumns:", v34);
  }
  else
  {
    objc_msgSend(v4, "rows");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "textViewManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "frameOfRow:", v37);
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v44;

    objc_msgSend(*(id *)(a1 + 32), "textViewManager");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "frameOfRow:", v47);
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v55 = v54;

    v169.origin.x = v39;
    v169.origin.y = v41;
    v169.size.width = v43;
    v169.size.height = v45;
    v178.origin.x = v49;
    v178.origin.y = v51;
    v178.size.width = v53;
    v178.size.height = v55;
    v170 = CGRectUnion(v169, v178);
    x = v170.origin.x;
    y = v170.origin.y;
    width = v170.size.width;
    height = v170.size.height;
    objc_msgSend(*(id *)(a1 + 32), "columnButton");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setHidden:", 1);

    objc_msgSend(*(id *)(a1 + 32), "table");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCurrentDragIndex:", objc_msgSend(v57, "rowIndexForIdentifier:", v58));

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "textViewManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setDraggedRows:", v34);
  }

  objc_msgSend(*(id *)(a1 + 32), "tableSelection");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v59, "type") == 2)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "tableSelection");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "type");

    if (v61 != 3)
      goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "selectionFrameFromContentFrame:", x, y, width, height);
  x = v62;
  y = v63;
  width = v64;
  height = v65;
LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "dragSnapshotFromRect:afterScreenUpdates:", 1, x, y, width, height);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDragView:", v66);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tableContentView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "convertRect:fromView:", v68, x, y, width, height);
  v70 = v69;
  v72 = v71;
  v74 = v73;
  v76 = v75;
  objc_msgSend(*(id *)(a1 + 32), "dragView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setFrame:", v70, v72, v74, v76);

  objc_msgSend(*(id *)(a1 + 32), "dragView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "layer");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setMasksToBounds:", 1);

  objc_msgSend(*(id *)(a1 + 32), "tableContentView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "innerBorderWidth");
  v82 = v81;
  objc_msgSend(*(id *)(a1 + 32), "dragView");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "layer");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setBorderWidth:", v82);

  objc_msgSend(*(id *)(a1 + 32), "tableContentView");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "innerBorderColor");
  v86 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v87 = objc_msgSend(v86, "CGColor");
  objc_msgSend(*(id *)(a1 + 32), "dragView");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "layer");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setBorderColor:", v87);

  objc_msgSend(*(id *)(a1 + 32), "tableSelection");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v90, "type") == 2)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "tableSelection");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v91, "type");

    if (v92 != 3)
      goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "dragView");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "layer");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setBorderWidth:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "selectionHighlightView");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "layer");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "cornerRadius");
  v98 = v97;
  objc_msgSend(*(id *)(a1 + 32), "dragView");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "layer");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setCornerRadius:", v98);

  objc_msgSend(*(id *)(a1 + 32), "selectionHighlightView");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "layer");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = objc_msgSend(v102, "maskedCorners");
  objc_msgSend(*(id *)(a1 + 32), "dragView");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "layer");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setMaskedCorners:", v103);

LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "view");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dragView");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "addSubview:", v107);

  Mutable = CGPathCreateMutable();
  objc_msgSend(*(id *)(a1 + 32), "dragView");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "bounds");
  v172 = CGRectInset(v171, -20.0, -20.0);
  CGPathAddRect(Mutable, 0, v172);

  objc_msgSend(*(id *)(a1 + 32), "dragView");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "bounds");
  CGPathAddRect(Mutable, 0, v173);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setPath:", Mutable);
  objc_msgSend(v111, "setFillRule:", *MEMORY[0x1E0CD2B70]);
  CGPathRelease(Mutable);
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setMask:", v111);
  objc_msgSend(v112, "setShadowRadius:", *MEMORY[0x1E0D64A58]);
  objc_msgSend(v112, "setShadowOffset:", *MEMORY[0x1E0D64A48], *(double *)(MEMORY[0x1E0D64A48] + 8));
  v113 = *MEMORY[0x1E0D64A50];
  *(float *)&v113 = *MEMORY[0x1E0D64A50];
  objc_msgSend(v112, "setShadowOpacity:", v113);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v114 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v112, "setShadowColor:", objc_msgSend(v114, "CGColor"));

  objc_msgSend(*(id *)(a1 + 32), "dragView");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "bounds");
  v116 = CGPathCreateWithRect(v174, 0);

  objc_msgSend(v112, "setShadowPath:", v116);
  CGPathRelease(v116);
  objc_msgSend(*(id *)(a1 + 32), "dragView");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "layer");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "addSublayer:", v112);

  v119 = -[ICTableAutoScroller initWithTableAttachmentViewController:scrollDirectionMode:]([ICTableAutoScroller alloc], "initWithTableAttachmentViewController:scrollDirectionMode:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setTableAutoScroller:", v119);

  v120 = *(void **)(a1 + 32);
  objc_msgSend(v120, "tableAutoScroller");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "setDelegate:", v120);

  if (*(_BYTE *)(a1 + 56))
  {
    v162 = 0u;
    v163 = 0u;
    v160 = 0u;
    v161 = 0u;
    v122 = v6;
    v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v160, v165, 16);
    if (v123)
    {
      v124 = v123;
      v125 = *(_QWORD *)v161;
      do
      {
        for (i = 0; i != v124; ++i)
        {
          if (*(_QWORD *)v161 != v125)
            objc_enumerationMutation(v122);
          objc_msgSend(*(id *)(a1 + 32), "setHidden:forColumn:", 1, *(_QWORD *)(*((_QWORD *)&v160 + 1) + 8 * i));
        }
        v124 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v160, v165, 16);
      }
      while (v124);
    }

    objc_msgSend(*(id *)(a1 + 32), "headerClipView");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "layer");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = v128;
    v130 = 0;
  }
  else
  {
    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    v131 = v6;
    v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v156, v164, 16);
    if (v132)
    {
      v133 = v132;
      v134 = *(_QWORD *)v157;
      do
      {
        for (j = 0; j != v133; ++j)
        {
          if (*(_QWORD *)v157 != v134)
            objc_enumerationMutation(v131);
          objc_msgSend(*(id *)(a1 + 32), "setHidden:forRow:", 1, *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * j));
        }
        v133 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v156, v164, 16);
      }
      while (v133);
    }

    objc_msgSend(*(id *)(a1 + 32), "headerClipView");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "layer");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = v128;
    v130 = 1;
  }
  objc_msgSend(v128, "setMasksToBounds:", v130);

  objc_msgSend(*(id *)(a1 + 32), "dragView");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "frame");
  v137 = CGRectGetMidX(v175) - *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "dragView");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "frame");
  objc_msgSend(*(id *)(a1 + 32), "setInitialDragOffset:", v137, CGRectGetMidY(v176) - *(double *)(a1 + 48));

  v154[0] = MEMORY[0x1E0C809B0];
  v154[1] = 3221225472;
  v154[2] = __69__ICTableAttachmentViewController_dragBeganOnColumnOrRow_atLocation___block_invoke_2;
  v154[3] = &unk_1EA7DE660;
  v155 = *(_BYTE *)(a1 + 56);
  v154[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3F10], "ic_animateWithDuration:animations:completion:", v154, 0, 0.1);
  objc_msgSend(*(id *)(a1 + 32), "selectionHighlightView");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "ic_setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "startKnob");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "endKnob");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "currentlyEditingTextStorage");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "savedSelectionWithSelectionAffinity:", 0);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setStringSelectionBeforeDrag:", v143);

  v144 = objc_alloc(MEMORY[0x1E0DC4110]);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = (void *)objc_msgSend(v144, "initWithCoordinateSpace:", v145);
  objc_msgSend(*(id *)(a1 + 32), "setFeedbackGenerator:", v146);

  objc_msgSend(*(id *)(a1 + 32), "feedbackGenerator");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "userInteractionStarted");

  objc_msgSend(*(id *)(a1 + 32), "feedbackGenerator");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "draggedObjectLifted");

  LODWORD(v145) = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = v149;
  if ((_DWORD)v145)
    v151 = CFSTR("Reordering column %lu");
  else
    v151 = CFSTR("Reordering row %lu");
  objc_msgSend(v149, "localizedStringForKey:value:table:", v151, &stru_1EA7E9860, 0);
  v152 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v152, objc_msgSend(*(id *)(a1 + 32), "currentDragIndex") + 1);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x1E0DC44C8], v153);
  objc_msgSend(*(id *)(a1 + 32), "setLastDraggedOverColumnOrRowIndex:", objc_msgSend(*(id *)(a1 + 32), "currentDragIndex"));

}

void __69__ICTableAttachmentViewController_dragBeganOnColumnOrRow_atLocation___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  double x;
  double y;
  double width;
  double height;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  id v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "dragView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  if (v2)
  {
    v38 = CGRectOffset(*(CGRect *)&v4, 0.0, -5.0);
    x = v38.origin.x;
    y = v38.origin.y;
    width = v38.size.width;
    height = v38.size.height;
    objc_msgSend(*(id *)(a1 + 32), "dragView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ic_animator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", x, y, width, height);

    objc_msgSend(*(id *)(a1 + 32), "columnButton");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "frame");
    v40 = CGRectOffset(v39, 0.0, -5.0);
    v14 = v40.origin.x;
    v15 = v40.origin.y;
    v16 = v40.size.width;
    v17 = v40.size.height;
    objc_msgSend(*(id *)(a1 + 32), "columnButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ic_animator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFrame:", v14, v15, v16, v17);

  }
  else
  {
    v41 = CGRectOffset(*(CGRect *)&v4, -5.0, 0.0);
    v20 = v41.origin.x;
    v21 = v41.origin.y;
    v22 = v41.size.width;
    v23 = v41.size.height;
    objc_msgSend(*(id *)(a1 + 32), "dragView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "ic_animator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", v20, v21, v22, v23);

    objc_msgSend(*(id *)(a1 + 32), "rowButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frame");
    v43 = CGRectOffset(v42, -5.0, 0.0);
    v27 = v43.origin.x;
    v28 = v43.origin.y;
    v29 = v43.size.width;
    v30 = v43.size.height;
    objc_msgSend(*(id *)(a1 + 32), "rowButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "ic_animator");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFrame:", v27, v28, v29, v30);

    objc_msgSend(*(id *)(a1 + 32), "tableContentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "convertPoint:toView:", v34, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    v36 = v35;

    if (v36 >= -1.0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "rowButton");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "ic_animator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ic_setAlpha:", 0.0);
  }

}

- (void)dragMovedOnColumnOrRow:(BOOL)a3 atLocation:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  void *v8;
  _QWORD v9[7];
  BOOL v10;

  y = a4.y;
  x = a4.x;
  -[ICTableAttachmentViewController draggingAppearance](self, "draggingAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke;
  v9[3] = &unk_1EA7DF850;
  v9[4] = self;
  *(CGFloat *)&v9[5] = x;
  *(CGFloat *)&v9[6] = y;
  v10 = a3;
  objc_msgSend(v8, "performAsDefaultAppearance:", v9);

}

void __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  CGFloat v90;
  double v91;
  CGFloat v92;
  double v93;
  CGFloat v94;
  double v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  double v101;
  void *v102;
  void *v103;
  uint64_t v104;
  double MinX;
  void *v109;
  void *v110;
  void *v111;
  double v112;
  CGFloat v113;
  double v114;
  CGFloat v115;
  double v116;
  CGFloat v117;
  double v118;
  CGFloat v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  double v124;
  CGFloat v125;
  double v126;
  CGFloat v127;
  double v128;
  CGFloat v129;
  double v130;
  CGFloat v131;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidY;
  void *v137;
  void *v138;
  double MidX;
  void *v140;
  uint64_t v141;
  double MinY;
  double v146;
  void *v147;
  double v148;
  void *v149;
  double v150;
  double v151;
  void *v152;
  double v153;
  CGFloat v154;
  double v155;
  CGFloat v156;
  double v157;
  CGFloat v158;
  double v159;
  CGFloat v160;
  double v161;
  CGFloat v162;
  CGFloat v163;
  CGFloat v164;
  CGFloat v165;
  double MaxX;
  void *v167;
  uint64_t v168;
  uint64_t v169;
  double v170;
  void *v171;
  double v172;
  double v173;
  void *v174;
  double v175;
  CGFloat v176;
  double v177;
  CGFloat v178;
  double v179;
  CGFloat v180;
  double v181;
  CGFloat v182;
  double v183;
  double MaxY;
  BOOL v185;
  void *v186;
  void *v187;
  unint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  uint64_t v193;
  void *v194;
  int v195;
  char v196;
  uint64_t v197;
  char v198;
  void *v199;
  void *v200;
  char v201;
  void *v202;
  void *v203;
  char v204;
  void *v205;
  id v206;
  id v207;
  void *v208;
  void *v209;
  double v210;
  double v211;
  void *v212;
  double v213;
  char v214;
  double v215;
  void *v216;
  char v217;
  void *v218;
  unint64_t v219;
  void *v220;
  unint64_t v221;
  void *v222;
  id v223;
  void *v224;
  char v225;
  void *v226;
  double v227;
  double v228;
  void *v229;
  double v230;
  char v231;
  double v232;
  void *v233;
  char v234;
  void *v235;
  uint64_t v236;
  id v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t n;
  uint64_t v241;
  void *v242;
  double v243;
  double v244;
  id v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t i;
  uint64_t v249;
  void *v250;
  double v251;
  double v252;
  void *v253;
  void *v254;
  double v255;
  double v256;
  void *v257;
  double v258;
  char v259;
  double v260;
  void *v261;
  char v262;
  void *v263;
  unint64_t v264;
  void *v265;
  void *v266;
  unint64_t v267;
  uint64_t v268;
  void *v269;
  int v270;
  uint64_t v271;
  id v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t ii;
  uint64_t v276;
  void *v277;
  double v278;
  double v279;
  void *v280;
  double v281;
  double v282;
  void *v283;
  double v284;
  char v285;
  double v286;
  void *v287;
  char v288;
  void *v289;
  unint64_t v290;
  void *v291;
  char v292;
  char v293;
  void *v294;
  uint64_t v295;
  void *v296;
  unint64_t v297;
  uint64_t v298;
  void *v299;
  void *v300;
  unint64_t v301;
  uint64_t v302;
  unsigned int v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  unint64_t v309;
  _BOOL4 v310;
  uint64_t v311;
  uint64_t v312;
  void *v313;
  id v314;
  uint64_t v315;
  double v316;
  double v317;
  double v318;
  double v319;
  uint64_t v320;
  uint64_t j;
  uint64_t v322;
  void *v323;
  double v324;
  CGFloat v325;
  double v326;
  CGFloat v327;
  double v328;
  CGFloat v329;
  double v330;
  CGFloat v331;
  void *v332;
  void *v333;
  void *v334;
  id v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t k;
  void *v339;
  void *v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  id v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t jj;
  uint64_t v357;
  void *v358;
  double v359;
  double v360;
  void *v361;
  void *v362;
  unint64_t v363;
  void *v364;
  char v365;
  uint64_t v366;
  int v367;
  void *v368;
  void *v369;
  void *v370;
  unint64_t v371;
  _BOOL4 v372;
  uint64_t v373;
  uint64_t v374;
  void *v375;
  id v376;
  uint64_t v377;
  double v378;
  double v379;
  double v380;
  double v381;
  uint64_t v382;
  uint64_t kk;
  uint64_t v384;
  void *v385;
  double v386;
  CGFloat v387;
  double v388;
  CGFloat v389;
  double v390;
  CGFloat v391;
  double v392;
  CGFloat v393;
  void *v394;
  double v395;
  double v396;
  void *v397;
  void *v398;
  id v399;
  uint64_t v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  id v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t mm;
  void *v409;
  void *v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  id v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t nn;
  uint64_t v427;
  void *v428;
  void *v429;
  double v430;
  double v431;
  double v432;
  double v433;
  double v434;
  CGFloat v435;
  void *v436;
  void *v437;
  void *v438;
  uint64_t v439;
  _QWORD *v440;
  id v441;
  id *p_y;
  id v443;
  id v444;
  id v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t m;
  uint64_t v449;
  void *v450;
  void *v451;
  void *v452;
  double v453;
  double v454;
  void *v455;
  CGFloat v456;
  void *v457;
  void *v458;
  CGFloat v459;
  void *v460;
  id v461;
  id v462;
  uint64_t v463;
  void *v464;
  BOOL v465;
  int v466;
  void *v467;
  void *v468;
  const __CFString *v469;
  void *v470;
  void *v471;
  void *v472;
  void *v473;
  uint64_t v474;
  unint64_t v475;
  unsigned int v476;
  CGFloat rect;
  void *recta;
  CGFloat v479;
  void *v480;
  CGFloat v481;
  id v482;
  CGRect v484;
  void *v485;
  id v486;
  id v487;
  id v488;
  id v489;
  _QWORD v490[6];
  __int128 v491;
  __int128 v492;
  __int128 v493;
  __int128 v494;
  _QWORD v495[5];
  id v496;
  uint64_t *v497;
  _QWORD v498[5];
  id v499;
  uint64_t *v500;
  __int128 v501;
  __int128 v502;
  __int128 v503;
  __int128 v504;
  __int128 v505;
  __int128 v506;
  __int128 v507;
  __int128 v508;
  __int128 v509;
  __int128 v510;
  __int128 v511;
  __int128 v512;
  __int128 v513;
  __int128 v514;
  __int128 v515;
  __int128 v516;
  _QWORD v517[8];
  _QWORD v518[6];
  __int128 v519;
  __int128 v520;
  __int128 v521;
  __int128 v522;
  _QWORD v523[5];
  id v524;
  uint64_t *v525;
  _QWORD v526[5];
  id v527;
  uint64_t *v528;
  uint64_t v529;
  uint64_t *v530;
  uint64_t v531;
  CGFloat v532;
  __int128 v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  __int128 v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  __int128 v541;
  __int128 v542;
  __int128 v543;
  __int128 v544;
  __int128 v545;
  __int128 v546;
  __int128 v547;
  __int128 v548;
  _BYTE v549[128];
  _BYTE v550[128];
  _BYTE v551[128];
  _BYTE v552[128];
  _BYTE v553[128];
  _BYTE v554[128];
  _BYTE v555[128];
  _BYTE v556[128];
  _BYTE v557[128];
  _BYTE v558[128];
  uint64_t v559;
  CGRect v560;
  CGRect v561;
  CGRect v562;
  CGRect v563;
  CGRect v564;
  CGRect v565;
  CGRect v566;
  CGRect v567;
  CGRect v568;
  CGRect v569;
  CGRect v570;
  CGRect v571;
  CGRect v572;
  CGRect v573;
  CGRect v574;
  CGRect v575;
  CGRect v576;
  CGRect v577;
  CGRect v578;
  CGRect v579;
  CGRect v580;
  CGRect v581;
  CGRect v582;
  CGRect v583;
  CGRect v584;
  CGRect v585;
  CGRect v586;
  CGRect v587;
  CGRect v588;
  CGRect v589;

  v559 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentDragGestureLocation:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(*v1, "dragView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;

  if (*(_BYTE *)(a1 + 56))
  {
    v7 = *(double *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "initialDragOffset");
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 32), "dragView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 32), "dragView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v7 + v9 + v4 * -0.5, v12, v4, v6);

    objc_msgSend(*(id *)(a1 + 32), "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "columnButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "convertPoint:toView:", v16, *(double *)(a1 + 40), *(double *)(a1 + 48));
    v18 = v17;
    objc_msgSend(*(id *)(a1 + 32), "initialDragOffset");
    v20 = v19;
    objc_msgSend(*(id *)(a1 + 32), "columnButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v23 = v22;
    objc_msgSend(*(id *)(a1 + 32), "columnButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    v26 = v25;
    objc_msgSend(*(id *)(a1 + 32), "columnButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "frame");
    v29 = v28;
    objc_msgSend(*(id *)(a1 + 32), "columnButton");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "frame");
    v32 = v31;
    objc_msgSend(*(id *)(a1 + 32), "columnButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v18 + v20 + v23 * -0.5;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "dragView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "frame");
    v37 = v36;
    v38 = *(double *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "initialDragOffset");
    v40 = v39;
    objc_msgSend(*(id *)(a1 + 32), "dragView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setFrame:", v37, v38 + v40 + v6 * -0.5, v4, v6);

    objc_msgSend(*(id *)(a1 + 32), "rowButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v34 = v42;
    objc_msgSend(*(id *)(a1 + 32), "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "rowButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "superview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "convertPoint:toView:", v21, *(double *)(a1 + 40), *(double *)(a1 + 48));
    v44 = v43;
    objc_msgSend(*(id *)(a1 + 32), "initialDragOffset");
    v46 = v45;
    objc_msgSend(*(id *)(a1 + 32), "rowButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    v48 = v47;
    objc_msgSend(*(id *)(a1 + 32), "rowButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "frame");
    v29 = v49;
    objc_msgSend(*(id *)(a1 + 32), "rowButton");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "frame");
    v32 = v50;
    objc_msgSend(*(id *)(a1 + 32), "rowButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v44 + v46 + v48 * -0.5;
  }
  objc_msgSend(v33, "setFrame:", v34, v26, v29, v32);

  objc_msgSend(*(id *)(a1 + 32), "tableContentView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dragView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "frame");
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v60 = v59;
  objc_msgSend(*(id *)(a1 + 32), "dragView");
  v61 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v61, "superview");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "convertRect:fromView:", v62, v54, v56, v58, v60);
  v64 = v63;
  v66 = v65;
  v68 = v67;
  v70 = v69;

  objc_msgSend(*(id *)(a1 + 32), "tableAutoScroller");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setTargetFrame:", v64, v66, v68, v70);

  LOBYTE(v61) = *(_BYTE *)(a1 + 56) == 0;
  objc_msgSend(*(id *)(a1 + 32), "textViewManager");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = *(void **)(a1 + 32);
  v484.origin.x = v64;
  v479 = v68;
  v481 = v66;
  rect = v70;
  if ((v61 & 1) != 0)
  {
    objc_msgSend(v73, "rowButton");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "columnOrRowIdentifiers");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "firstObject");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "frameOfRow:", v111);
    v113 = v112;
    v115 = v114;
    v117 = v116;
    v119 = v118;

    objc_msgSend(*v1, "textViewManager");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v1, "rowButton");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "columnOrRowIdentifiers");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "lastObject");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "frameOfRow:", v123);
    v125 = v124;
    v127 = v126;
    v129 = v128;
    v131 = v130;

    v563.origin.x = v113;
    v563.origin.y = v115;
    v563.size.width = v117;
    v563.size.height = v119;
    v587.origin.x = v125;
    v587.origin.y = v127;
    v587.size.width = v129;
    v587.size.height = v131;
    v564 = CGRectUnion(v563, v587);
    x = v564.origin.x;
    y = v564.origin.y;
    width = v564.size.width;
    height = v564.size.height;
    v564.origin.x = v484.origin.x;
    v564.size.width = v479;
    v564.origin.y = v481;
    v564.size.height = rect;
    MidY = CGRectGetMidY(v564);
    v565.origin.x = x;
    v565.origin.y = y;
    v565.size.width = width;
    v565.size.height = height;
    v476 = MidY < CGRectGetMidY(v565);
    objc_msgSend(*v1, "tableContentView");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v1, "dragView");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "frame");
    MidX = CGRectGetMidX(v566);
    objc_msgSend(*v1, "dragView");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "frame");
    if (v476)
      MinY = CGRectGetMinY(*(CGRect *)&v141);
    else
      MinY = CGRectGetMaxY(*(CGRect *)&v141);
    v170 = MinY;
    objc_msgSend(*v1, "view");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "convertPoint:fromView:", v171, MidX, v170);
    v173 = v172;

    objc_msgSend(*v1, "textViewManager");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "boundingRect");
    v176 = v175;
    v178 = v177;
    v180 = v179;
    v182 = v181;

    v570.origin.x = v176;
    v570.origin.y = v178;
    v570.size.width = v180;
    v570.size.height = v182;
    v183 = CGRectGetMinY(v570);
    if (v183 >= v173)
      v173 = v183;
    v571.origin.x = v176;
    v162 = v484.origin.x;
    v571.origin.y = v178;
    v571.size.width = v180;
    v164 = v479;
    v163 = v481;
    v571.size.height = v182;
    v165 = rect;
    MaxY = CGRectGetMaxY(v571);
    if (v173 >= MaxY)
      v173 = MaxY;
    objc_msgSend(*v1, "textViewManager");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "rowContainingY:", v173);
    v169 = 0;
    v168 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v73, "columnButton");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "columnOrRowIdentifiers");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "firstObject");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "frameOfColumn:", v76);
    v78 = v77;
    v80 = v79;
    v82 = v81;
    v84 = v83;

    objc_msgSend(*v1, "textViewManager");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v1, "columnButton");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "columnOrRowIdentifiers");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "lastObject");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "frameOfColumn:", v88);
    v90 = v89;
    v92 = v91;
    v94 = v93;
    v96 = v95;

    v560.origin.x = v78;
    v560.origin.y = v80;
    v560.size.width = v82;
    v560.size.height = v84;
    v586.origin.x = v90;
    v586.origin.y = v92;
    v586.size.width = v94;
    v586.size.height = v96;
    v561 = CGRectUnion(v560, v586);
    v97 = v561.origin.x;
    v98 = v561.origin.y;
    v99 = v561.size.width;
    v100 = v561.size.height;
    v561.origin.x = v484.origin.x;
    v561.size.width = v479;
    v561.origin.y = v481;
    v561.size.height = rect;
    v101 = CGRectGetMidX(v561);
    v562.origin.x = v97;
    v562.origin.y = v98;
    v562.size.width = v99;
    v562.size.height = v100;
    v476 = v101 < CGRectGetMidX(v562);
    objc_msgSend(*v1, "tableContentView");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v1, "dragView");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "frame");
    if (v476)
      MinX = CGRectGetMinX(*(CGRect *)&v104);
    else
      MinX = CGRectGetMaxX(*(CGRect *)&v104);
    v146 = MinX;
    objc_msgSend(*v1, "dragView");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "frame");
    v148 = CGRectGetMidY(v567);
    objc_msgSend(*v1, "view");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "convertPoint:fromView:", v149, v146, v148);
    v151 = v150;

    objc_msgSend(*v1, "textViewManager");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "boundingRect");
    v154 = v153;
    v156 = v155;
    v158 = v157;
    v160 = v159;

    v568.origin.x = v154;
    v568.origin.y = v156;
    v568.size.width = v158;
    v568.size.height = v160;
    v161 = CGRectGetMinX(v568);
    if (v161 >= v151)
      v151 = v161;
    v569.origin.x = v154;
    v162 = v484.origin.x;
    v569.origin.y = v156;
    v569.size.width = v158;
    v164 = v479;
    v163 = v481;
    v569.size.height = v160;
    v165 = rect;
    MaxX = CGRectGetMaxX(v569);
    if (v151 >= MaxX)
      v151 = MaxX;
    objc_msgSend(*v1, "textViewManager");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "columnContainingX:", v151);
    v168 = 0;
    v169 = objc_claimAutoreleasedReturnValue();
  }

  v480 = (void *)v169;
  if (!(v169 | v168))
    goto LABEL_250;
  recta = (void *)v168;
  v185 = *(_BYTE *)(a1 + 56) == 0;
  objc_msgSend(*(id *)(a1 + 32), "table");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = v186;
  if (v185)
  {
    v188 = objc_msgSend(v186, "rowIndexForIdentifier:", v168);

    objc_msgSend(*v1, "table");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v1, "rowButton");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "columnOrRowIdentifiers");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "firstObject");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    v193 = objc_msgSend(v189, "rowIndexForIdentifier:", v192);
  }
  else
  {
    v188 = objc_msgSend(v186, "columnIndexForIdentifier:", v480);

    objc_msgSend(*v1, "table");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v1, "columnButton");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "columnOrRowIdentifiers");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "firstObject");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    v193 = objc_msgSend(v189, "columnIndexForIdentifier:", v192);
  }
  v475 = v193;

  if (*(_BYTE *)(a1 + 56)
    && (objc_msgSend(*v1, "table"),
        v194 = (void *)objc_claimAutoreleasedReturnValue(),
        v195 = objc_msgSend(v194, "isRightToLeft"),
        v194,
        v195))
  {
    if (v188 < v475)
      v196 = v476;
    else
      v196 = 0;
    if ((v196 & 1) != 0)
      v197 = 1;
    else
      v197 = (uint64_t)((unint64_t)((v188 > v475) & ~v476) << 63) >> 63;
  }
  else
  {
    if (v188 > v475)
      v198 = v476;
    else
      v198 = 0;
    if ((v198 & 1) != 0)
      v197 = -1;
    else
      v197 = (v188 < v475) & ~v476;
  }
  if (objc_msgSend(*v1, "currentDragIndex") == v188 + v197)
    goto LABEL_238;
  if (!*(_BYTE *)(a1 + 56))
  {
LABEL_43:
    objc_msgSend(*v1, "rowButton");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v202, "columnOrRowIdentifiers");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    v204 = objc_msgSend(v203, "containsObject:", recta);

    if ((v204 & 1) != 0)
      goto LABEL_238;
    objc_msgSend(*v1, "rowButton");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v205, "columnOrRowIdentifiers");
    v482 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v206 = (id)objc_claimAutoreleasedReturnValue();
    v207 = recta;
    objc_msgSend(*v1, "textViewManager");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    if (v476)
    {
      objc_msgSend(v482, "firstObject");
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v208, "frameOfRow:", v209);
      v211 = v210;
      while (1)
      {

        objc_msgSend(*v1, "textViewManager");
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v212, "frameOfRow:", v207);
        if (v213 >= v211)
        {
          v214 = objc_msgSend(v482, "containsObject:", v207);

          if ((v214 & 1) == 0)
            break;
        }
        else
        {

        }
        v572.origin.x = v162;
        v572.origin.y = v163;
        v572.size.width = v164;
        v572.size.height = v165;
        v215 = CGRectGetMinY(v572);
        objc_msgSend(*v1, "textViewManager");
        v216 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v216, "frameOfRow:", v207);
        if (v215 >= CGRectGetMidY(v573))
        {

        }
        else
        {
          v217 = objc_msgSend(v482, "containsObject:", v207);

          if ((v217 & 1) == 0)
            objc_msgSend(v206, "addObject:", v207);
        }
        objc_msgSend(*v1, "table");
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        v219 = objc_msgSend(v218, "rowIndexForIdentifier:", v207);

        objc_msgSend(*v1, "table");
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        v221 = objc_msgSend(v220, "rowCount") - 1;

        if (v219 >= v221)
          break;
        objc_msgSend(*v1, "table");
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v208, "identifierForRowAtIndex:", v219 + 1);
        v209 = v207;
        v207 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (objc_msgSend(v206, "count"))
      {
        v515 = 0u;
        v516 = 0u;
        v513 = 0u;
        v514 = 0u;
        v245 = v482;
        v246 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", &v513, v553, 16);
        if (v246)
        {
          v247 = *(_QWORD *)v514;
          v484.origin.x = 0.0;
          do
          {
            for (i = 0; i != v246; ++i)
            {
              if (*(_QWORD *)v514 != v247)
                objc_enumerationMutation(v245);
              v249 = *(_QWORD *)(*((_QWORD *)&v513 + 1) + 8 * i);
              objc_msgSend(*v1, "rowHeightCache");
              v250 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v250, "dimensionForKey:", v249);
              v252 = v251;

              v484.origin.x = v484.origin.x + v252;
            }
            v246 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", &v513, v553, 16);
          }
          while (v246);
          goto LABEL_134;
        }
LABEL_133:
        v484.origin.x = 0.0;
LABEL_134:

LABEL_135:
        objc_msgSend(*v1, "table");
        v299 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v206, "firstObject");
        v300 = (void *)objc_claimAutoreleasedReturnValue();
        v301 = objc_msgSend(v299, "rowIndexForIdentifier:", v300);

        v302 = 0x7FFFFFFFFFFFFFFFLL;
        if (v301 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v301 > v475)
            v303 = v476;
          else
            v303 = 0;
          if (v303 == 1)
            v302 = v301 - 1;
          else
            v302 = v301 + ((v301 < v475) & ~v476);
        }
        v474 = v302;
        objc_msgSend(*v1, "textViewManager");
        v304 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v304, "rowIDs");
        v305 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*v1, "rowButton");
        v306 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v306, "columnOrRowIdentifiers");
        v307 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v307, "firstObject");
        v308 = (void *)objc_claimAutoreleasedReturnValue();
        v309 = objc_msgSend(v305, "indexOfObject:", v308);

        if (v476)
        {
          v310 = v309 >= objc_msgSend(v206, "count");
        }
        else
        {
          v311 = objc_msgSend(v482, "count");
          v312 = objc_msgSend(v206, "count");
          objc_msgSend(*v1, "table");
          v313 = (void *)objc_claimAutoreleasedReturnValue();
          v310 = v309 + v311 + v312 - 1 <= objc_msgSend(v313, "rowCount");

        }
        if (objc_msgSend(v206, "count")
          && objc_msgSend(*v1, "currentDragIndex") != v474
          && v309 != 0x7FFFFFFFFFFFFFFFLL
          && v310)
        {
          v507 = 0u;
          v508 = 0u;
          v505 = 0u;
          v506 = 0u;
          v314 = v206;
          v315 = objc_msgSend(v314, "countByEnumeratingWithState:objects:count:", &v505, v551, 16);
          v316 = *MEMORY[0x1E0C9D648];
          v317 = *(double *)(MEMORY[0x1E0C9D648] + 8);
          v318 = *(double *)(MEMORY[0x1E0C9D648] + 16);
          v319 = *(double *)(MEMORY[0x1E0C9D648] + 24);
          if (v315)
          {
            v320 = *(_QWORD *)v506;
            do
            {
              for (j = 0; j != v315; ++j)
              {
                if (*(_QWORD *)v506 != v320)
                  objc_enumerationMutation(v314);
                v322 = *(_QWORD *)(*((_QWORD *)&v505 + 1) + 8 * j);
                objc_msgSend(*v1, "textViewManager");
                v323 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v323, "frameOfRow:", v322);
                v325 = v324;
                v327 = v326;
                v329 = v328;
                v331 = v330;

                v580.origin.x = v316;
                v580.origin.y = v317;
                v580.size.width = v318;
                v580.size.height = v319;
                if (CGRectIsEmpty(v580))
                {
                  v316 = v325;
                  v317 = v327;
                  v318 = v329;
                  v319 = v331;
                }
                else
                {
                  v581.origin.x = v316;
                  v581.origin.y = v317;
                  v581.size.width = v318;
                  v581.size.height = v319;
                  v588.origin.x = v325;
                  v588.origin.y = v327;
                  v588.size.width = v329;
                  v588.size.height = v331;
                  v582 = CGRectUnion(v581, v588);
                  v316 = v582.origin.x;
                  v317 = v582.origin.y;
                  v318 = v582.size.width;
                  v319 = v582.size.height;
                }
              }
              v315 = objc_msgSend(v314, "countByEnumeratingWithState:objects:count:", &v505, v551, 16);
            }
            while (v315);
          }

          objc_msgSend(*v1, "dragSnapshotFromRect:afterScreenUpdates:", 0, v316, v317, v318, v319);
          v472 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*v1, "scrollView");
          v332 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*v1, "tableContentView");
          v333 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v332, "convertRect:fromView:", v333, v316, v317, v318, v319);
          objc_msgSend(v472, "setFrame:");

          objc_msgSend(*v1, "scrollView");
          v334 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v334, "addSubview:", v472);

          v503 = 0u;
          v504 = 0u;
          v501 = 0u;
          v502 = 0u;
          v335 = v314;
          v336 = objc_msgSend(v335, "countByEnumeratingWithState:objects:count:", &v501, v550, 16);
          if (v336)
          {
            v337 = *(_QWORD *)v502;
            do
            {
              for (k = 0; k != v336; ++k)
              {
                if (*(_QWORD *)v502 != v337)
                  objc_enumerationMutation(v335);
                objc_msgSend(*v1, "setHidden:forRow:", 1, *(_QWORD *)(*((_QWORD *)&v501 + 1) + 8 * k));
              }
              v336 = objc_msgSend(v335, "countByEnumeratingWithState:objects:count:", &v501, v550, 16);
            }
            while (v336);
          }

          objc_msgSend(*v1, "textViewManager");
          v339 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v335, "firstObject");
          v340 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v339, "frameOfRow:", v340);
          v342 = v341;
          v344 = v343;
          v346 = v345;
          v348 = v347;

          v529 = 0;
          v530 = &v529;
          v531 = 0x2020000000;
          v532 = 0.0;
          v349 = v342;
          v350 = v344;
          v351 = v346;
          v352 = v348;
          if (v476)
          {
            v532 = CGRectGetMinY(*(CGRect *)&v349);
            v498[0] = MEMORY[0x1E0C809B0];
            v498[1] = 3221225472;
            v498[2] = __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_6;
            v498[3] = &unk_1EA7DF878;
            v498[4] = *v1;
            v500 = &v529;
            v499 = v335;
            objc_msgSend(v482, "enumerateObjectsWithOptions:usingBlock:", 0, v498);

          }
          else
          {
            v532 = CGRectGetMaxY(*(CGRect *)&v349);
            v495[0] = MEMORY[0x1E0C809B0];
            v495[1] = 3221225472;
            v495[2] = __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_7;
            v495[3] = &unk_1EA7DF878;
            v495[4] = *v1;
            v497 = &v529;
            v496 = v335;
            objc_msgSend(v482, "enumerateObjectsWithOptions:usingBlock:", 2, v495);

          }
          _Block_object_dispose(&v529, 8);
          v493 = 0u;
          v494 = 0u;
          v491 = 0u;
          v492 = 0u;
          v445 = v335;
          v446 = objc_msgSend(v445, "countByEnumeratingWithState:objects:count:", &v491, v549, 16);
          if (v446)
          {
            v447 = *(_QWORD *)v492;
            do
            {
              for (m = 0; m != v446; ++m)
              {
                if (*(_QWORD *)v492 != v447)
                  objc_enumerationMutation(v445);
                v449 = *(_QWORD *)(*((_QWORD *)&v491 + 1) + 8 * m);
                objc_msgSend(*v1, "tableLayoutManager");
                v450 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v450, "rowPositions");
                v451 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v451, "objectForKey:", v449);
                v452 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v452, "doubleValue");
                v454 = v453;

                objc_msgSend(*v1, "tableLayoutManager");
                v455 = (void *)objc_claimAutoreleasedReturnValue();
                v456 = v484.origin.x + v454;
                objc_msgSend(v455, "setYPosition:forRow:shouldInvalidate:", v449, 1, v456);

                objc_msgSend(*v1, "tableContentView");
                v457 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v456);
                v458 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v457, "setHorizontalLinePosition:forKey:", v458, v449);

              }
              v446 = objc_msgSend(v445, "countByEnumeratingWithState:objects:count:", &v491, v549, 16);
            }
            while (v446);
          }

          v459 = MEMORY[0x1E0C809B0];
          v460 = (void *)MEMORY[0x1E0DC3F10];
          v490[0] = MEMORY[0x1E0C809B0];
          v490[1] = 3221225472;
          v490[2] = __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_8;
          v490[3] = &unk_1EA7DE8A8;
          v440 = v490;
          v461 = v472;
          v490[4] = v461;
          v490[5] = *(_QWORD *)&v484.origin.x;
          v484.origin.y = v459;
          *(_QWORD *)&v484.size.width = 3221225472;
          *(_QWORD *)&v484.size.height = __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_9;
          v485 = &unk_1EA7DDEA8;
          p_y = (id *)&v484.origin.y;
          v206 = v445;
          v462 = *v1;
          v486 = v206;
          v487 = v462;
          v488 = v461;
          v482 = v482;
          v489 = v482;
          v444 = v461;
          objc_msgSend(v460, "ic_animateWithDuration:animations:completion:", v490, &v484.origin.y, 0.2);
          goto LABEL_236;
        }
        goto LABEL_237;
      }
    }
    else
    {
      objc_msgSend(v482, "lastObject");
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v208, "frameOfRow:", v226);
      v228 = v227;
      while (1)
      {

        objc_msgSend(*v1, "textViewManager");
        v229 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v229, "frameOfRow:", v207);
        if (v230 <= v228)
        {
          v231 = objc_msgSend(v482, "containsObject:", v207);

          if ((v231 & 1) == 0)
            break;
        }
        else
        {

        }
        v574.origin.x = v162;
        v574.origin.y = v163;
        v574.size.width = v164;
        v574.size.height = v165;
        v232 = CGRectGetMaxY(v574);
        objc_msgSend(*v1, "textViewManager");
        v233 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v233, "frameOfRow:", v207);
        if (v232 <= CGRectGetMidY(v575))
        {

        }
        else
        {
          v234 = objc_msgSend(v482, "containsObject:", v207);

          if ((v234 & 1) == 0)
            objc_msgSend(v206, "addObject:", v207);
        }
        objc_msgSend(*v1, "table");
        v235 = (void *)objc_claimAutoreleasedReturnValue();
        v236 = objc_msgSend(v235, "rowIndexForIdentifier:", v207);

        if (!v236)
          break;
        objc_msgSend(*v1, "table");
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v208, "identifierForRowAtIndex:", v236 - 1);
        v226 = v207;
        v207 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (objc_msgSend(v206, "count"))
      {
        v511 = 0u;
        v512 = 0u;
        v509 = 0u;
        v510 = 0u;
        v237 = v482;
        v238 = objc_msgSend(v237, "countByEnumeratingWithState:objects:count:", &v509, v552, 16);
        if (v238)
        {
          v239 = *(_QWORD *)v510;
          v484.origin.x = 0.0;
          do
          {
            for (n = 0; n != v238; ++n)
            {
              if (*(_QWORD *)v510 != v239)
                objc_enumerationMutation(v237);
              v241 = *(_QWORD *)(*((_QWORD *)&v509 + 1) + 8 * n);
              objc_msgSend(*v1, "rowHeightCache");
              v242 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v242, "dimensionForKey:", v241);
              v244 = v243;

              v484.origin.x = v484.origin.x - v244;
            }
            v238 = objc_msgSend(v237, "countByEnumeratingWithState:objects:count:", &v509, v552, 16);
          }
          while (v238);
          goto LABEL_134;
        }
        goto LABEL_133;
      }
    }
    v484.origin.x = 0.0;
    goto LABEL_135;
  }
  objc_msgSend(*v1, "columnButton");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "columnOrRowIdentifiers");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v201 = objc_msgSend(v200, "containsObject:", v480);

  if ((v201 & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 56))
      goto LABEL_238;
    goto LABEL_43;
  }
  objc_msgSend(*v1, "columnButton");
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v222, "columnOrRowIdentifiers");
  v482 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v206 = (id)objc_claimAutoreleasedReturnValue();
  v223 = v480;
  objc_msgSend(*v1, "table");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  v225 = objc_msgSend(v224, "isLeftToRight");
  if (v476)
  {
    if ((v225 & 1) != 0)
      objc_msgSend(v482, "firstObject");
    else
      objc_msgSend(v482, "lastObject");
    v253 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*v1, "textViewManager");
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v254, "frameOfColumn:", v253);
    v256 = v255;
    while (1)
    {

      objc_msgSend(*v1, "textViewManager");
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v257, "frameOfColumn:", v223);
      if (v258 >= v256)
      {
        v259 = objc_msgSend(v482, "containsObject:", v223);

        if ((v259 & 1) == 0)
          goto LABEL_106;
      }
      else
      {

      }
      v576.origin.x = v162;
      v576.origin.y = v163;
      v576.size.width = v164;
      v576.size.height = v165;
      v260 = CGRectGetMinX(v576);
      objc_msgSend(*v1, "textViewManager");
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v261, "frameOfColumn:", v223);
      if (v260 >= CGRectGetMidX(v577))
      {

      }
      else
      {
        v262 = objc_msgSend(v482, "containsObject:", v223);

        if ((v262 & 1) == 0)
          objc_msgSend(v206, "addObject:", v223);
      }
      objc_msgSend(*v1, "table");
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      v264 = objc_msgSend(v263, "columnIndexForIdentifier:", v223);

      objc_msgSend(*v1, "table");
      v265 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v265, "isLeftToRight") & 1) != 0)
      {
        objc_msgSend(*v1, "table");
        v266 = (void *)objc_claimAutoreleasedReturnValue();
        v267 = objc_msgSend(v266, "columnCount") - 1;

        if (v264 < v267)
        {
          v268 = 1;
          goto LABEL_105;
        }
      }
      else
      {

      }
      objc_msgSend(*v1, "table");
      v269 = (void *)objc_claimAutoreleasedReturnValue();
      v270 = objc_msgSend(v269, "isRightToLeft");

      if (!v270 || !v264)
      {
LABEL_106:
        if (objc_msgSend(v206, "count"))
        {
          v548 = 0u;
          v547 = 0u;
          v546 = 0u;
          v545 = 0u;
          v272 = v482;
          v273 = objc_msgSend(v272, "countByEnumeratingWithState:objects:count:", &v545, v558, 16);
          if (v273)
          {
            v274 = *(_QWORD *)v546;
            v484.origin.x = 0.0;
            do
            {
              for (ii = 0; ii != v273; ++ii)
              {
                if (*(_QWORD *)v546 != v274)
                  objc_enumerationMutation(v272);
                v276 = *(_QWORD *)(*((_QWORD *)&v545 + 1) + 8 * ii);
                objc_msgSend(*v1, "columnWidthCache");
                v277 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v277, "dimensionForKey:", v276);
                v279 = v278;

                v484.origin.x = v484.origin.x + v279;
              }
              v273 = objc_msgSend(v272, "countByEnumeratingWithState:objects:count:", &v545, v558, 16);
            }
            while (v273);
            goto LABEL_180;
          }
LABEL_179:
          v484.origin.x = 0.0;
          goto LABEL_180;
        }
LABEL_178:
        v484.origin.x = 0.0;
        goto LABEL_181;
      }
      v268 = -1;
LABEL_105:
      objc_msgSend(*v1, "table");
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v254, "identifierForColumnAtIndex:", v264 + v268);
      v271 = objc_claimAutoreleasedReturnValue();

      v223 = (id)v271;
    }
  }
  if ((v225 & 1) != 0)
    objc_msgSend(v482, "lastObject");
  else
    objc_msgSend(v482, "firstObject");
  v253 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*v1, "textViewManager");
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v280, "frameOfColumn:", v253);
  v282 = v281;
  while (1)
  {

    objc_msgSend(*v1, "textViewManager");
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v283, "frameOfColumn:", v223);
    if (v284 <= v282)
    {
      v285 = objc_msgSend(v482, "containsObject:", v223);

      if ((v285 & 1) == 0)
        goto LABEL_169;
    }
    else
    {

    }
    v578.origin.x = v162;
    v578.origin.y = v163;
    v578.size.width = v164;
    v578.size.height = v165;
    v286 = CGRectGetMaxX(v578);
    objc_msgSend(*v1, "textViewManager");
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v287, "frameOfColumn:", v223);
    if (v286 <= CGRectGetMidX(v579))
    {

    }
    else
    {
      v288 = objc_msgSend(v482, "containsObject:", v223);

      if ((v288 & 1) == 0)
        objc_msgSend(v206, "addObject:", v223);
    }
    objc_msgSend(*v1, "table");
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    v290 = objc_msgSend(v289, "columnIndexForIdentifier:", v223);

    objc_msgSend(*v1, "table");
    v291 = (void *)objc_claimAutoreleasedReturnValue();
    v292 = objc_msgSend(v291, "isLeftToRight");
    if (v290)
      v293 = v292;
    else
      v293 = 0;

    objc_msgSend(*v1, "table");
    v294 = (void *)objc_claimAutoreleasedReturnValue();
    v280 = v294;
    if ((v293 & 1) != 0)
    {
      v295 = -1;
      goto LABEL_132;
    }
    if ((objc_msgSend(v294, "isRightToLeft") & 1) == 0)
      break;
    objc_msgSend(*v1, "table");
    v296 = (void *)objc_claimAutoreleasedReturnValue();
    v297 = objc_msgSend(v296, "columnCount") - 1;

    if (v290 >= v297)
      goto LABEL_169;
    objc_msgSend(*v1, "table");
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    v295 = 1;
LABEL_132:
    objc_msgSend(v280, "identifierForColumnAtIndex:", v290 + v295);
    v298 = objc_claimAutoreleasedReturnValue();

    v223 = (id)v298;
  }

LABEL_169:
  if (!objc_msgSend(v206, "count"))
    goto LABEL_178;
  v544 = 0u;
  v543 = 0u;
  v542 = 0u;
  v541 = 0u;
  v353 = v482;
  v354 = objc_msgSend(v353, "countByEnumeratingWithState:objects:count:", &v541, v557, 16);
  if (!v354)
    goto LABEL_179;
  v355 = *(_QWORD *)v542;
  v484.origin.x = 0.0;
  do
  {
    for (jj = 0; jj != v354; ++jj)
    {
      if (*(_QWORD *)v542 != v355)
        objc_enumerationMutation(v353);
      v357 = *(_QWORD *)(*((_QWORD *)&v541 + 1) + 8 * jj);
      objc_msgSend(*v1, "columnWidthCache");
      v358 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v358, "dimensionForKey:", v357);
      v360 = v359;

      v484.origin.x = v484.origin.x - v360;
    }
    v354 = objc_msgSend(v353, "countByEnumeratingWithState:objects:count:", &v541, v557, 16);
  }
  while (v354);
LABEL_180:

LABEL_181:
  objc_msgSend(*v1, "table");
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "firstObject");
  v362 = (void *)objc_claimAutoreleasedReturnValue();
  v363 = objc_msgSend(v361, "columnIndexForIdentifier:", v362);

  objc_msgSend(*v1, "table");
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v361) = objc_msgSend(v364, "isLeftToRight");

  if ((_DWORD)v361)
  {
    if (v363 > v475)
      v365 = v476;
    else
      v365 = 0;
    if ((v365 & 1) == 0)
    {
      v366 = (v363 < v475) & ~v476;
      goto LABEL_195;
    }
  }
  else
  {
    if (v363 <= v475)
      v367 = 1;
    else
      v367 = v476;
    if (v367 == 1)
    {
      if (v363 < v475)
        v366 = v476;
      else
        v366 = 0;
      goto LABEL_195;
    }
  }
  v366 = -1;
LABEL_195:
  objc_msgSend(*v1, "textViewManager");
  v368 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v368, "columnIDs");
  v369 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v482, "firstObject");
  v370 = (void *)objc_claimAutoreleasedReturnValue();
  v371 = objc_msgSend(v369, "indexOfObject:", v370);

  if (v476)
  {
    v372 = v371 >= objc_msgSend(v206, "count");
  }
  else
  {
    v373 = objc_msgSend(v482, "count");
    v374 = objc_msgSend(v206, "count");
    objc_msgSend(*v1, "table");
    v375 = (void *)objc_claimAutoreleasedReturnValue();
    v372 = v371 + v373 + v374 - 1 <= objc_msgSend(v375, "columnCount");

  }
  if (objc_msgSend(v206, "count")
    && objc_msgSend(*v1, "currentDragIndex") != v363 + v366
    && v371 != 0x7FFFFFFFFFFFFFFFLL
    && v372)
  {
    v474 = v363 + v366;
    v540 = 0u;
    v539 = 0u;
    v537 = 0u;
    v538 = 0u;
    v376 = v206;
    v377 = objc_msgSend(v376, "countByEnumeratingWithState:objects:count:", &v537, v556, 16);
    v378 = *MEMORY[0x1E0C9D628];
    v379 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v380 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v381 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    if (v377)
    {
      v382 = *(_QWORD *)v538;
      do
      {
        for (kk = 0; kk != v377; ++kk)
        {
          if (*(_QWORD *)v538 != v382)
            objc_enumerationMutation(v376);
          v384 = *(_QWORD *)(*((_QWORD *)&v537 + 1) + 8 * kk);
          objc_msgSend(*v1, "textViewManager");
          v385 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v385, "frameOfColumn:", v384);
          v387 = v386;
          v389 = v388;
          v391 = v390;
          v393 = v392;

          v583.origin.x = v378;
          v583.origin.y = v379;
          v583.size.width = v380;
          v583.size.height = v381;
          v589.origin.x = v387;
          v589.origin.y = v389;
          v589.size.width = v391;
          v589.size.height = v393;
          v584 = CGRectUnion(v583, v589);
          v378 = v584.origin.x;
          v379 = v584.origin.y;
          v380 = v584.size.width;
          v381 = v584.size.height;
        }
        v377 = objc_msgSend(v376, "countByEnumeratingWithState:objects:count:", &v537, v556, 16);
      }
      while (v377);
    }

    objc_msgSend(*v1, "dragSnapshotFromRect:afterScreenUpdates:", 0, v378, v379, v380, v381);
    v473 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v1, "tableContentView");
    v394 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v394, "innerBorderWidth");
    v396 = v395;
    objc_msgSend(v473, "layer");
    v397 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v397, "setBorderWidth:", v396);

    objc_msgSend(*v1, "tableContentView");
    v398 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v398, "innerBorderColor");
    v399 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v400 = objc_msgSend(v399, "CGColor");
    objc_msgSend(v473, "layer");
    v401 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v401, "setBorderColor:", v400);

    objc_msgSend(*v1, "scrollView");
    v402 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v1, "tableContentView");
    v403 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v402, "convertRect:fromView:", v403, v378, v379, v380, v381);
    objc_msgSend(v473, "setFrame:");

    objc_msgSend(*v1, "scrollView");
    v404 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v404, "addSubview:", v473);

    v535 = 0u;
    v536 = 0u;
    v533 = 0u;
    v534 = 0u;
    v405 = v376;
    v406 = objc_msgSend(v405, "countByEnumeratingWithState:objects:count:", &v533, v555, 16);
    if (v406)
    {
      v407 = *(_QWORD *)v534;
      do
      {
        for (mm = 0; mm != v406; ++mm)
        {
          if (*(_QWORD *)v534 != v407)
            objc_enumerationMutation(v405);
          objc_msgSend(*v1, "setHidden:forColumn:", 1, *(_QWORD *)(*((_QWORD *)&v533 + 1) + 8 * mm));
        }
        v406 = objc_msgSend(v405, "countByEnumeratingWithState:objects:count:", &v533, v555, 16);
      }
      while (v406);
    }

    objc_msgSend(*v1, "textViewManager");
    v409 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v405, "firstObject");
    v410 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v409, "frameOfColumn:", v410);
    v412 = v411;
    v414 = v413;
    v416 = v415;
    v418 = v417;

    v529 = 0;
    v530 = &v529;
    v531 = 0x2020000000;
    v532 = 0.0;
    v419 = v412;
    v420 = v414;
    v421 = v416;
    v422 = v418;
    if (v476)
    {
      v532 = CGRectGetMinX(*(CGRect *)&v419);
      v526[0] = MEMORY[0x1E0C809B0];
      v526[1] = 3221225472;
      v526[2] = __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_2;
      v526[3] = &unk_1EA7DF878;
      v526[4] = *v1;
      v528 = &v529;
      v527 = v405;
      objc_msgSend(v482, "enumerateObjectsWithOptions:usingBlock:", 0, v526);

    }
    else
    {
      v532 = CGRectGetMaxX(*(CGRect *)&v419);
      v523[0] = MEMORY[0x1E0C809B0];
      v523[1] = 3221225472;
      v523[2] = __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_3;
      v523[3] = &unk_1EA7DF878;
      v523[4] = *v1;
      v525 = &v529;
      v524 = v405;
      objc_msgSend(v482, "enumerateObjectsWithOptions:usingBlock:", 2, v523);

    }
    _Block_object_dispose(&v529, 8);
    v521 = 0u;
    v522 = 0u;
    v519 = 0u;
    v520 = 0u;
    v423 = v405;
    v424 = objc_msgSend(v423, "countByEnumeratingWithState:objects:count:", &v519, v554, 16);
    if (v424)
    {
      v425 = *(_QWORD *)v520;
      do
      {
        for (nn = 0; nn != v424; ++nn)
        {
          if (*(_QWORD *)v520 != v425)
            objc_enumerationMutation(v423);
          v427 = *(_QWORD *)(*((_QWORD *)&v519 + 1) + 8 * nn);
          objc_msgSend(*v1, "textViewManager");
          v428 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v428, "textViewForColumn:", v427);
          v429 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v429, "frame");
          v430 = CGRectGetMinX(v585);
          objc_msgSend(v429, "frame");
          v432 = v431;
          objc_msgSend(v429, "frame");
          v434 = v433;
          objc_msgSend(v429, "frame");
          v435 = v484.origin.x + v430;
          objc_msgSend(v429, "setFrame:", v435, v432, v434);
          objc_msgSend(*v1, "tableContentView");
          v436 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v435);
          v437 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v436, "setVerticalLinePosition:forKey:", v437, v427);

        }
        v424 = objc_msgSend(v423, "countByEnumeratingWithState:objects:count:", &v519, v554, 16);
      }
      while (v424);
    }

    v438 = (void *)MEMORY[0x1E0DC3F10];
    v439 = MEMORY[0x1E0C809B0];
    v518[0] = MEMORY[0x1E0C809B0];
    v518[1] = 3221225472;
    v518[2] = __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_4;
    v518[3] = &unk_1EA7DE8A8;
    v440 = v518;
    v441 = v473;
    v518[4] = v441;
    v518[5] = *(_QWORD *)&v484.origin.x;
    v517[0] = v439;
    v517[1] = 3221225472;
    v517[2] = __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_5;
    v517[3] = &unk_1EA7DDEA8;
    p_y = (id *)v517;
    v206 = v423;
    v443 = *v1;
    v517[4] = v206;
    v517[5] = v443;
    v517[6] = v441;
    v482 = v482;
    v517[7] = v482;
    v444 = v441;
    objc_msgSend(v438, "ic_animateWithDuration:animations:completion:", v518, v517, 0.2);
LABEL_236:
    objc_msgSend(*v1, "setCurrentDragIndex:", v474);

  }
LABEL_237:

LABEL_238:
  v463 = objc_msgSend(*v1, "lastDraggedOverColumnOrRowIndex");
  if (v463 != objc_msgSend(*v1, "currentDragIndex"))
  {
    objc_msgSend(*(id *)(a1 + 32), "feedbackGenerator");
    v464 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v464, "dropTargetUpdated");

    v465 = v475 == objc_msgSend(*(id *)(a1 + 32), "currentDragIndex");
    v466 = *(unsigned __int8 *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v467 = (void *)objc_claimAutoreleasedReturnValue();
    v468 = v467;
    if (v465)
    {
      if (v466)
        objc_msgSend(v467, "localizedStringForKey:value:table:", CFSTR("Cancel reorder column"), &stru_1EA7E9860, 0);
      else
        objc_msgSend(v467, "localizedStringForKey:value:table:", CFSTR("Cancel reorder row"), &stru_1EA7E9860, 0);
      v471 = (void *)objc_claimAutoreleasedReturnValue();
      v470 = v468;
    }
    else
    {
      if (v466)
        v469 = CFSTR("Column %lu");
      else
        v469 = CFSTR("Row %lu");
      objc_msgSend(v467, "localizedStringForKey:value:table:", v469, &stru_1EA7E9860, 0);
      v470 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v470, objc_msgSend(*v1, "currentDragIndex") + 1);
      v471 = (void *)objc_claimAutoreleasedReturnValue();
    }

    UIAccessibilityPostNotification(*MEMORY[0x1E0DC44C8], v471);
  }
  objc_msgSend(*v1, "setLastDraggedOverColumnOrRowIndex:", objc_msgSend(*v1, "currentDragIndex"));
  v168 = (uint64_t)recta;
LABEL_250:

}

void __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  id v18;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "textViewManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textViewForColumn:", v4);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(v18, "frame");
  v8 = v7;
  objc_msgSend(v18, "frame");
  v10 = v9;
  objc_msgSend(v18, "frame");
  objc_msgSend(v18, "setFrame:", v6, v8, v10);
  objc_msgSend(*(id *)(a1 + 32), "tableContentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setVerticalLinePosition:forKey:", v12, v4);

  objc_msgSend(*(id *)(a1 + 32), "textViewManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "columnIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "indexOfObject:", v4);

  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "textViewManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "moveColumnAtIndex:toIndex:", v15, v15 - objc_msgSend(*(id *)(a1 + 40), "count"));

  }
  objc_msgSend(v18, "frame");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v17
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24);

}

void __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "textViewManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textViewForColumn:", v4);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "frame");
  v7 = v6;
  v8 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) - v6;
  objc_msgSend(v19, "frame");
  v10 = v9;
  objc_msgSend(v19, "frame");
  v12 = v11;
  objc_msgSend(v19, "frame");
  objc_msgSend(v19, "setFrame:", v8, v10, v12);
  objc_msgSend(*(id *)(a1 + 32), "tableContentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) - v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setVerticalLinePosition:forKey:", v14, v4);

  objc_msgSend(*(id *)(a1 + 32), "textViewManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "columnIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "indexOfObject:", v4);

  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "textViewManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "moveColumnAtIndex:toIndex:", v17, objc_msgSend(*(id *)(a1 + 40), "count") + v17);

  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24)
                                                              - v7;

}

void __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_4(uint64_t a1)
{
  double x;
  double y;
  double width;
  double height;
  id v6;
  CGRect v7;
  CGRect v8;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  v8 = CGRectOffset(v7, *(CGFloat *)(a1 + 40), 0.0);
  x = v8.origin.x;
  y = v8.origin.y;
  width = v8.size.width;
  height = v8.size.height;
  objc_msgSend(*(id *)(a1 + 32), "ic_animator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", x, y, width, height);

}

void __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_5(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(a1[5], "setHidden:forColumn:", 0, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

  objc_msgSend(a1[6], "removeFromSuperview");
  objc_msgSend(a1[5], "tableSelection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "moving");

  if (v8)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = a1[7];
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(a1[5], "setHidden:forColumn:", 1, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v11);
    }

  }
}

void __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "tableLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setYPosition:forRow:shouldInvalidate:", v12, 1, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

  objc_msgSend(*(id *)(a1 + 32), "tableContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHorizontalLinePosition:forKey:", v5, v12);

  objc_msgSend(*(id *)(a1 + 32), "textViewManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v12);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "textViewManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "moveRowAtIndex:toIndex:", v8, v8 - objc_msgSend(*(id *)(a1 + 40), "count"));

  }
  objc_msgSend(*(id *)(a1 + 32), "rowHeightCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dimensionForKey:", v12);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24);

}

double __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double result;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "rowHeightCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dimensionForKey:", v4);
  v7 = v6;

  objc_msgSend(*(id *)(a1 + 32), "tableLayoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setYPosition:forRow:shouldInvalidate:", v4, 1, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) - v7);

  objc_msgSend(*(id *)(a1 + 32), "tableContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) - v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHorizontalLinePosition:forKey:", v10, v4);

  objc_msgSend(*(id *)(a1 + 32), "textViewManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rowIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "indexOfObject:", v4);

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "textViewManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "moveRowAtIndex:toIndex:", v13, objc_msgSend(*(id *)(a1 + 40), "count") + v13);

  }
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  result = *(double *)(v15 + 24) - v7;
  *(double *)(v15 + 24) = result;
  return result;
}

void __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_8(uint64_t a1)
{
  double x;
  double y;
  double width;
  double height;
  id v6;
  CGRect v7;
  CGRect v8;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  v8 = CGRectOffset(v7, 0.0, *(CGFloat *)(a1 + 40));
  x = v8.origin.x;
  y = v8.origin.y;
  width = v8.size.width;
  height = v8.size.height;
  objc_msgSend(*(id *)(a1 + 32), "ic_animator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", x, y, width, height);

}

void __69__ICTableAttachmentViewController_dragMovedOnColumnOrRow_atLocation___block_invoke_9(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(a1[5], "setHidden:forRow:", 0, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

  objc_msgSend(a1[6], "removeFromSuperview");
  objc_msgSend(a1[5], "tableSelection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "moving");

  if (v8)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = a1[7];
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(a1[5], "setHidden:forRow:", 1, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v11);
    }

  }
}

- (void)dragEndedOnColumnOrRow:(BOOL)a3 atLocation:(CGPoint)a4
{
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  -[ICTableAttachmentViewController draggingAppearance](self, "draggingAppearance", a4.x, a4.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__ICTableAttachmentViewController_dragEndedOnColumnOrRow_atLocation___block_invoke;
  v7[3] = &unk_1EA7DE660;
  v7[4] = self;
  v8 = a3;
  objc_msgSend(v6, "performAsDefaultAppearance:", v7);

  -[ICTableAttachmentViewController setDraggingAppearance:](self, "setDraggingAppearance:", 0);
}

uint64_t __69__ICTableAttachmentViewController_dragEndedOnColumnOrRow_atLocation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "moveCurrentColumnOrRow:toIndex:", *(unsigned __int8 *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "currentDragIndex"));
}

- (void)moveCurrentColumnOrRow:(BOOL)a3 toIndex:(unint64_t)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t j;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  double v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  void *v89;
  void *v90;
  unint64_t v91;
  void *v92;
  unint64_t v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t k;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  BOOL v113;
  unint64_t v114;
  id obj;
  unint64_t v116;
  _QWORD v117[7];
  BOOL v118;
  _QWORD v119[9];
  BOOL v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _QWORD v133[7];
  _QWORD v134[7];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  uint64_t v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;

  v5 = a3;
  v138 = *MEMORY[0x1E0C80C00];
  -[ICTableAttachmentViewController table](self, "table");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ICTableAttachmentViewController columnButton](self, "columnButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "columnOrRowIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "columnIndexForIdentifier:", v10);
  }
  else
  {
    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "columnOrRowIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "rowIndexForIdentifier:", v10);
  }
  v116 = v11;

  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDraggedColumns:", 0);

  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDraggedRows:", 0);

  v14 = MEMORY[0x1E0C809B0];
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || v116 == a4)
  {
    -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController viewport](self, "viewport");
    objc_msgSend(v20, "redrawAllWithViewport:");

    if (v5)
      goto LABEL_9;
  }
  else
  {
    v15 = 2 * (v116 < a4);
    if (v5)
    {
      -[ICTableAttachmentViewController columnButton](self, "columnButton");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "columnOrRowIdentifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v134[0] = v14;
      v134[1] = 3221225472;
      v134[2] = __66__ICTableAttachmentViewController_moveCurrentColumnOrRow_toIndex___block_invoke;
      v134[3] = &unk_1EA7DF8A0;
      v134[4] = self;
      v134[5] = a4;
      v134[6] = v116;
      objc_msgSend(v17, "enumerateObjectsWithOptions:usingBlock:", v15, v134);

      -[ICTableAttachmentViewController redrawAndSave](self, "redrawAndSave");
      -[ICTableAttachmentViewController columnButton](self, "columnButton");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "columnOrRowIdentifiers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableAttachmentViewController postChangeNotification:columnOrRowUUIDs:](self, "postChangeNotification:columnOrRowUUIDs:", 5, v19);

LABEL_9:
      v131 = 0u;
      v132 = 0u;
      v129 = 0u;
      v130 = 0u;
      -[ICTableAttachmentViewController columnButton](self, "columnButton");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "columnOrRowIdentifiers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v129, v137, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v130;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v130 != v25)
              objc_enumerationMutation(v22);
            -[ICTableAttachmentViewController setHidden:forColumn:](self, "setHidden:forColumn:", 1, *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * i));
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v129, v137, 16);
        }
        while (v24);
      }

      -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableAttachmentViewController columnButton](self, "columnButton");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "columnOrRowIdentifiers");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "frameOfColumn:", v30);
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;

      -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableAttachmentViewController columnButton](self, "columnButton");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "columnOrRowIdentifiers");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "lastObject");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "frameOfColumn:", v42);
      v44 = v43;
      v46 = v45;
      v48 = v47;
      v50 = v49;

      v139.origin.x = v32;
      v139.origin.y = v34;
      v139.size.width = v36;
      v139.size.height = v38;
      v143.origin.x = v44;
      v143.origin.y = v46;
      v143.size.width = v48;
      v143.size.height = v50;
      v140 = CGRectUnion(v139, v143);
      x = v140.origin.x;
      y = v140.origin.y;
      width = v140.size.width;
      height = v140.size.height;
      goto LABEL_36;
    }
    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "columnOrRowIdentifiers");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v133[0] = v14;
    v133[1] = 3221225472;
    v133[2] = __66__ICTableAttachmentViewController_moveCurrentColumnOrRow_toIndex___block_invoke_2;
    v133[3] = &unk_1EA7DF8A0;
    v133[4] = self;
    v133[5] = a4;
    v133[6] = v116;
    objc_msgSend(v56, "enumerateObjectsWithOptions:usingBlock:", v15, v133);

    -[ICTableAttachmentViewController redrawAndSave](self, "redrawAndSave");
    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "columnOrRowIdentifiers");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController postChangeNotification:columnOrRowUUIDs:](self, "postChangeNotification:columnOrRowUUIDs:", 6, v58);

  }
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "columnOrRowIdentifiers");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v125, v136, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v126;
    do
    {
      for (j = 0; j != v62; ++j)
      {
        if (*(_QWORD *)v126 != v63)
          objc_enumerationMutation(v60);
        -[ICTableAttachmentViewController setHidden:forColumn:](self, "setHidden:forColumn:", 1, *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * j));
      }
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v125, v136, 16);
    }
    while (v62);
  }

  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "columnOrRowIdentifiers");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "firstObject");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "frameOfRow:", v68);
  v70 = v69;
  v72 = v71;
  v74 = v73;
  v76 = v75;

  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "columnOrRowIdentifiers");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "lastObject");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "frameOfRow:", v80);
  v82 = v81;
  v84 = v83;
  v86 = v85;
  v88 = v87;

  v141.origin.x = v70;
  v141.origin.y = v72;
  v141.size.width = v74;
  v141.size.height = v76;
  v144.origin.x = v82;
  v144.origin.y = v84;
  v144.size.width = v86;
  v144.size.height = v88;
  v142 = CGRectUnion(v141, v144);
  x = v142.origin.x;
  y = v142.origin.y;
  width = v142.size.width;
  height = v142.size.height;
  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "columnOrRowIdentifiers");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v90, "count") + v116;
  -[ICTableAttachmentViewController table](self, "table");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v92, "rowCount");

  if (v91 < v93)
  {
    v113 = v5;
    v114 = a4;
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "columnIDs");
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v95;
    v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v121, v135, 16);
    if (v96)
    {
      v97 = v96;
      v98 = *(_QWORD *)v122;
      do
      {
        for (k = 0; k != v97; ++k)
        {
          if (*(_QWORD *)v122 != v98)
            objc_enumerationMutation(obj);
          v100 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * k);
          -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "textViewForColumn:", v100);
          v102 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          objc_msgSend(v102, "textStorage");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          ICDynamicCast();
          v104 = (void *)objc_claimAutoreleasedReturnValue();

          -[ICTableAttachmentViewController table](self, "table");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICTableAttachmentViewController rowButton](self, "rowButton");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "columnOrRowIdentifiers");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "identifierForRowAtIndex:", objc_msgSend(v107, "count") + v116);
          v108 = (void *)objc_claimAutoreleasedReturnValue();

          v109 = objc_msgSend(v104, "characterRangeForRowID:", v108);
          if (v109 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v110 = v109;
            objc_msgSend(v102, "layoutManager");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "invalidateLayoutForCharacterRange:actualCharacterRange:", v110, 1, 0);

          }
        }
        v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v135, 16);
      }
      while (v97);
    }

    a4 = v114;
    LOBYTE(v5) = v113;
    v14 = MEMORY[0x1E0C809B0];
  }
LABEL_36:
  -[ICTableAttachmentViewController tableAutoScroller](self, "tableAutoScroller");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "stopAndInvalidate");

  -[ICTableAttachmentViewController setTableAutoScroller:](self, "setTableAutoScroller:", 0);
  v119[0] = v14;
  v119[1] = 3221225472;
  v119[2] = __66__ICTableAttachmentViewController_moveCurrentColumnOrRow_toIndex___block_invoke_3;
  v119[3] = &unk_1EA7DF8C8;
  v119[4] = self;
  *(CGFloat *)&v119[5] = x;
  *(CGFloat *)&v119[6] = y;
  *(CGFloat *)&v119[7] = width;
  *(CGFloat *)&v119[8] = height;
  v120 = v5;
  v117[0] = v14;
  v117[1] = 3221225472;
  v117[2] = __66__ICTableAttachmentViewController_moveCurrentColumnOrRow_toIndex___block_invoke_4;
  v117[3] = &unk_1EA7DF850;
  v118 = v5;
  v117[4] = self;
  v117[5] = v116;
  v117[6] = a4;
  objc_msgSend(MEMORY[0x1E0DC3F10], "ic_animateWithDuration:animations:completion:", v119, v117, 0.2);
  -[ICTableAttachmentViewController setLastDraggedOverColumnOrRowIndex:](self, "setLastDraggedOverColumnOrRowIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

void __66__ICTableAttachmentViewController_moveCurrentColumnOrRow_toIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "table");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "columnIndexForIdentifier:", v6);

  v9 = *(_QWORD *)(a1 + 40);
  v10 = v9 + a3;
  if (v9 > *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "columnButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "columnOrRowIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v10 - objc_msgSend(v12, "count") + 1;

  }
  objc_msgSend(*(id *)(a1 + 32), "table");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moveColumnAtIndex:toIndex:", v8, (unint64_t)(double)(unint64_t)v10);

}

void __66__ICTableAttachmentViewController_moveCurrentColumnOrRow_toIndex___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rowIndexForIdentifier:", v13);

  v7 = *(_QWORD *)(a1 + 40);
  v8 = v7 + a3;
  if (v7 > *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "rowButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "columnOrRowIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v8 - objc_msgSend(v10, "count") + 1;

  }
  objc_msgSend(*(id *)(a1 + 32), "table");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "moveRowAtIndex:toIndex:", v6, (unint64_t)(double)(unint64_t)v8);

  objc_msgSend(*(id *)(a1 + 32), "tableLayoutManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateForMovedRow:", v13);

}

void __66__ICTableAttachmentViewController_moveCurrentColumnOrRow_toIndex___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double MidX;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double MidY;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  id v43;
  CGRect v44;
  CGRect v45;

  objc_msgSend(*(id *)(a1 + 32), "dragView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tableContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertRect:fromView:", v4, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "dragView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ic_animator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);

  v15 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(v15, "columnButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "tableContentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertRect:fromView:", v18, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    MidX = CGRectGetMidX(v44);

    objc_msgSend(*(id *)(a1 + 32), "columnButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v22 = v21;
    v24 = v23;

    objc_msgSend(*(id *)(a1 + 32), "columnButton");
    v43 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "frame");
    v26 = v25 + 5.0;
    objc_msgSend(*(id *)(a1 + 32), "columnButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "ic_animator");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFrame:", MidX + v22 * -0.5, v26, v22, v24);

  }
  else
  {
    objc_msgSend(v15, "rowButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "superview");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "tableContentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "convertRect:fromView:", v31, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    MidY = CGRectGetMidY(v45);

    objc_msgSend(*(id *)(a1 + 32), "rowButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "frame");
    v35 = v34;
    v37 = v36;

    objc_msgSend(*(id *)(a1 + 32), "rowButton");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "frame");
    v40 = v39 + 5.0;
    objc_msgSend(*(id *)(a1 + 32), "rowButton");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "ic_animator");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setFrame:", v40, MidY + v37 * -0.5, v35, v37);

    objc_msgSend(*(id *)(a1 + 32), "rowButton");
    v43 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "ic_animator");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "ic_setAlpha:", 1.0);
  }

}

void __66__ICTableAttachmentViewController_moveCurrentColumnOrRow_toIndex___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  const __CFString *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  UIAccessibilityNotifications v42;
  void *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  void *v54;
  void *v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "tableSelection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMoving:", 0);

  objc_msgSend(*(id *)(a1 + 32), "dragView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setDragView:", 0);
  objc_msgSend(*(id *)(a1 + 32), "selectionHighlightView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "updateChrome");
  objc_msgSend(*(id *)(a1 + 32), "headerClipView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMasksToBounds:", 1);

  if (*(_BYTE *)(a1 + 56))
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "columnButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "columnOrRowIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v51 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(a1 + 32), "setHidden:forColumn:", 0, *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
      }
      while (v10);
    }
  }
  else
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "rowButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "columnOrRowIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v47 != v16)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(a1 + 32), "setHidden:forRow:", 0, *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
        }
        v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      }
      while (v15);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "currentlyEditingTextView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 32), "columnButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "columnOrRowIdentifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "rowButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "columnOrRowIdentifiers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "beginEditingCellWithColumnID:andRowID:location:", v21, v24, 2);
    v25 = *(void **)(a1 + 32);
    v55 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "showButtonsAtColumns:rows:", v26, v27);

    objc_msgSend(*(id *)(a1 + 32), "currentlyEditingTextStorage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stringSelectionBeforeDrag");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "restoreSelection:", v29);

  }
  objc_msgSend(*(id *)(a1 + 32), "currentlyEditingTextView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setTextSelectionHidden:", 0);

  v31 = *(_QWORD *)(a1 + 40);
  v32 = *(_QWORD *)(a1 + 48);
  v33 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v31 == v32)
  {
    if (v33)
      v36 = CFSTR("Canceled reordering column");
    else
      v36 = CFSTR("Canceled reordering row");
    objc_msgSend(v34, "localizedStringForKey:value:table:", v36, &stru_1EA7E9860, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v33)
      v37 = CFSTR("Moved column %lu to position %lu");
    else
      v37 = CFSTR("Moved row %lu to position %lu");
    objc_msgSend(v34, "localizedStringForKey:value:table:", v37, &stru_1EA7E9860, 0);
    v38 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v38, *(_QWORD *)(a1 + 40) + 1, *(_QWORD *)(a1 + 48) + 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)v38;
  }

  objc_msgSend(*(id *)(a1 + 32), "feedbackGenerator");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "draggedObjectLanded");

  objc_msgSend(*(id *)(a1 + 32), "feedbackGenerator");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "userInteractionEnded");

  objc_msgSend(*(id *)(a1 + 32), "setFeedbackGenerator:", 0);
  v42 = *MEMORY[0x1E0DC4578];
  v43 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(v43, "columnButton");
  else
    objc_msgSend(v43, "rowButton");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v42, v44);

  v45 = v39;
  dispatchMainAfterDelay();

}

void __66__ICTableAttachmentViewController_moveCurrentColumnOrRow_toIndex___block_invoke_5(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x1E0DC44C8], *(id *)(a1 + 32));
}

- (void)setHidden:(BOOL)a3 forColumn:(id)a4
{
  unsigned int v4;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double x;
  double v11;
  double y;
  double v13;
  double width;
  double v15;
  double height;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  id v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v4 = a3;
  v27 = a4;
  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textViewForColumn:", v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v4 ^= 1u;
  objc_msgSend(v7, "ic_setAlpha:", (double)v4);
  if ((v4 & 1) != 0)
  {
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frameOfColumn:", v27);
    x = v9;
    y = v11;
    width = v13;
    height = v15;

    -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "exclusionRect");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    v28.origin.x = v19;
    v28.origin.y = v21;
    v28.size.width = v23;
    v28.size.height = v25;
    if (!CGRectIsEmpty(v28))
    {
      v29.origin.x = v19;
      v29.origin.y = v21;
      v29.size.width = v23;
      v29.size.height = v25;
      v31.origin.x = x;
      v31.origin.y = y;
      v31.size.width = width;
      v31.size.height = height;
      v30 = CGRectUnion(v29, v31);
      x = v30.origin.x;
      y = v30.origin.y;
      width = v30.size.width;
      height = v30.size.height;
    }
  }
  -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setExclusionRect:", x, y, width, height);

}

- (void)setHidden:(BOOL)a3 forRow:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  double x;
  double v24;
  double y;
  double v26;
  double width;
  double v28;
  double height;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v4 = a3;
  v59 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v4)
  {
    v55 = 0uLL;
    v56 = 0uLL;
    v53 = 0uLL;
    v54 = 0uLL;
    -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "columnIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v54 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
          -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "columnLayoutManagerForColumn:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "hiddenRows");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v16, "mutableCopy");
          v18 = v17;
          if (v17)
          {
            v19 = v17;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v19 = (id)objc_claimAutoreleasedReturnValue();
          }
          v20 = v19;

          objc_msgSend(v20, "addObject:", v6);
          objc_msgSend(v15, "setHiddenRows:", v20);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v10);
    }

    -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frameOfRow:", v6);
    x = v22;
    y = v24;
    width = v26;
    height = v28;

    -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "exclusionRect");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;

    v60.origin.x = v32;
    v60.origin.y = v34;
    v60.size.width = v36;
    v60.size.height = v38;
    if (!CGRectIsEmpty(v60))
    {
      v61.origin.x = v32;
      v61.origin.y = v34;
      v61.size.width = v36;
      v61.size.height = v38;
      v63.origin.x = x;
      v63.origin.y = y;
      v63.size.width = width;
      v63.size.height = height;
      v62 = CGRectUnion(v61, v63);
      x = v62.origin.x;
      y = v62.origin.y;
      width = v62.size.width;
      height = v62.size.height;
    }
  }
  else
  {
    v51 = 0uLL;
    v52 = 0uLL;
    *((_QWORD *)&v49 + 1) = 0;
    v50 = 0uLL;
    -[ICTableAttachmentViewController textViewManager](self, "textViewManager", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "columnIDs");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v50 != v43)
            objc_enumerationMutation(v40);
          v45 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
          -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "columnLayoutManagerForColumn:", v45);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v47, "setHiddenRows:", 0);
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v42);
    }

    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setExclusionRect:", x, y, width, height);

}

- (void)tableAutoScroller:(id)a3 scrollOffsetDelta:(CGPoint)a4
{
  double y;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  y = a4.y;
  v6 = objc_msgSend(a3, "scrollDirectionMode", a4.x);
  -[ICTableAttachmentViewController currentDragGestureLocation](self, "currentDragGestureLocation");
  if (v6 == 1)
  {
    v9 = v7;
  }
  else
  {
    -[ICTableAttachmentViewController currentDragGestureLocation](self, "currentDragGestureLocation");
    v9 = v10;
    -[ICTableAttachmentViewController currentDragGestureLocation](self, "currentDragGestureLocation");
    v8 = y + v11;
  }
  -[ICTableAttachmentViewController dragMovedOnColumnOrRow:atLocation:](self, "dragMovedOnColumnOrRow:atLocation:", v6 == 1, v9, v8);
}

- (void)textRangeDraggedAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  _QWORD v34[2];
  CGPoint v35;
  CGPoint v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  y = a3.y;
  x = a3.x;
  v34[1] = *MEMORY[0x1E0C80C00];
  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "columnOrRowIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "columnOrRowIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frameOfCellAtColumn:row:", v8, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDraggingText:", 1);

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "type");

  if (v23 == 1)
  {
    v37.origin.x = v14;
    v37.origin.y = v16;
    v37.size.width = v18;
    v37.size.height = v20;
    v38 = CGRectInset(v37, -*MEMORY[0x1E0D64A28], -*MEMORY[0x1E0D64A28]);
    v35.x = x;
    v35.y = y;
    if (!CGRectContainsPoint(v38, v35))
    {
      -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTextSelectionHidden:", 1);

      v25 = v11;
      v26 = v8;
      -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "selectCellRangeAtColumns:rows:", v28, v29);

      -[ICTableAttachmentViewController setRangeSelectionAnchorColumn:](self, "setRangeSelectionAnchorColumn:", v26);
      -[ICTableAttachmentViewController setRangeSelectionAnchorRow:](self, "setRangeSelectionAnchorRow:", v25);
LABEL_7:

      -[ICTableAttachmentViewController updateChrome](self, "updateChrome");
    }
  }
  else
  {
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "type");

    if (v31 == 4)
    {
      v39.origin.x = v14;
      v39.origin.y = v16;
      v39.size.width = v18;
      v39.size.height = v20;
      v36.x = x;
      v36.y = y;
      if (!CGRectContainsPoint(v39, v36))
      {
        -[ICTableAttachmentViewController cellRangeDraggedAtLocation:](self, "cellRangeDraggedAtLocation:", x, y);
        goto LABEL_9;
      }
      -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "selectCellAtColumn:row:", v8, v11);

      -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setTextSelectionHidden:", 0);
      goto LABEL_7;
    }
  }
LABEL_9:

}

- (void)textRangeDragEnded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextSelectionHidden:", 0);

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 == 4)
  {
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "columns");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rows");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

    -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController endCellEditingSessionWithTextView:](self, "endCellEditingSessionWithTextView:", v11);

    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectCellRangeAtColumns:rows:", v7, v9);

    -[ICTableAttachmentViewController updateChrome](self, "updateChrome");
    -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController ic_makeFirstResponder:](self, "ic_makeFirstResponder:", v13);

  }
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDraggingText:", 0);

}

- (void)cellRangeDragBeganOnView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v37 = a3;
  -[ICTableAttachmentViewController startKnob](self, "startKnob");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v37)
  {

  }
  else
  {
    -[ICTableAttachmentViewController endKnob](self, "endKnob");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v37;
    if (v5 != v37)
      goto LABEL_26;
  }
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");

  if (v8 != 4)
  {
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "type");

    if (v18 == 2)
    {
      -[ICTableAttachmentViewController startKnob](self, "startKnob");
      v19 = (id)objc_claimAutoreleasedReturnValue();

      if (v19 == v37)
      {
        -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "columns");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lastObject");
        v23 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[ICTableAttachmentViewController endKnob](self, "endKnob");
        v20 = (id)objc_claimAutoreleasedReturnValue();

        if (v20 != v37)
        {
LABEL_21:
          -[ICTableAttachmentViewController setRangeSelectionAnchorRow:](self, "setRangeSelectionAnchorRow:", 0);
          goto LABEL_25;
        }
        -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "columns");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "firstObject");
        v23 = objc_claimAutoreleasedReturnValue();
      }
      v35 = (void *)v23;
      -[ICTableAttachmentViewController setRangeSelectionAnchorColumn:](self, "setRangeSelectionAnchorColumn:", v23);

      goto LABEL_21;
    }
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "type");

    v6 = v37;
    if (v25 != 3)
      goto LABEL_26;
    -[ICTableAttachmentViewController startKnob](self, "startKnob");
    v26 = (id)objc_claimAutoreleasedReturnValue();

    if (v26 == v37)
    {
      -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "rows");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "lastObject");
      v30 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[ICTableAttachmentViewController endKnob](self, "endKnob");
      v27 = (id)objc_claimAutoreleasedReturnValue();

      if (v27 != v37)
      {
LABEL_24:
        -[ICTableAttachmentViewController setRangeSelectionAnchorColumn:](self, "setRangeSelectionAnchorColumn:", 0);
        goto LABEL_25;
      }
      -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "rows");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "firstObject");
      v30 = objc_claimAutoreleasedReturnValue();
    }
    v36 = (void *)v30;
    -[ICTableAttachmentViewController setRangeSelectionAnchorRow:](self, "setRangeSelectionAnchorRow:", v30);

    goto LABEL_24;
  }
  -[ICTableAttachmentViewController startKnob](self, "startKnob");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v37)
  {
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "columns");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "lastObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController setRangeSelectionAnchorColumn:](self, "setRangeSelectionAnchorColumn:", v33);

    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rows");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastObject");
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  -[ICTableAttachmentViewController endKnob](self, "endKnob");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v37;
  if (v10 == v37)
  {
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "columns");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController setRangeSelectionAnchorColumn:](self, "setRangeSelectionAnchorColumn:", v13);

    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rows");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v34 = (void *)v16;
    -[ICTableAttachmentViewController setRangeSelectionAnchorRow:](self, "setRangeSelectionAnchorRow:", v16);

LABEL_25:
    v6 = v37;
  }
LABEL_26:

}

- (void)cellRangeDraggedAtLocation:(CGPoint)a3
{
  double y;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  id v45;
  id v46;
  id v47;

  y = a3.y;
  v5 = fmax(a3.x, 0.0);
  -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7 + -1.0;

  if (v5 >= v8)
    v5 = v8;
  v9 = fmax(y, 0.0);
  -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11 + -1.0;

  if (v9 >= v12)
    v9 = v12;
  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v47 = 0;
  v14 = objc_msgSend(v13, "cellContainingPoint:columnID:rowID:", &v47, &v46, v5, v9);
  v15 = v47;
  v16 = v46;

  -[ICTableAttachmentViewController table](self, "table");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[ICTableAttachmentViewController rangeSelectionAnchorColumn](self, "rangeSelectionAnchorColumn");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[ICTableAttachmentViewController rangeSelectionAnchorColumn](self, "rangeSelectionAnchorColumn");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v17, "columnIndexForIdentifier:", v19);

    }
    else
    {
      v20 = 0;
    }

    -[ICTableAttachmentViewController rangeSelectionAnchorRow](self, "rangeSelectionAnchorRow");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[ICTableAttachmentViewController rangeSelectionAnchorRow](self, "rangeSelectionAnchorRow");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v17, "rowIndexForIdentifier:", v22);

    }
    else
    {
      v23 = 0;
    }

    v24 = objc_msgSend(v17, "columnIndexForIdentifier:", v15);
    v25 = objc_msgSend(v17, "rowIndexForIdentifier:", v16);
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "type");

    if (v27 == 4)
    {
      v45 = v15;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 >= v24)
        v30 = v24;
      else
        v30 = v20;
      if (v20 > v24)
        v24 = v20;
      do
      {
        objc_msgSend(v17, "identifierForColumnAtIndex:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v31);

        ++v30;
      }
      while (v30 <= v24);
      if (v23 >= v25)
        v32 = v25;
      else
        v32 = v23;
      if (v23 <= v25)
        v33 = v25;
      else
        v33 = v23;
      do
      {
        objc_msgSend(v17, "identifierForRowAtIndex:", v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v34);

        ++v32;
      }
      while (v32 <= v33);
      -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "selectCellRangeAtColumns:rows:", v28, v29);

      -[ICTableAttachmentViewController announceCellRangeSelectionChangeForAccessibilityIfNecessary](self, "announceCellRangeSelectionChangeForAccessibilityIfNecessary");
      goto LABEL_44;
    }
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "type");

    if (v37 == 2)
    {
      v45 = v15;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 >= v24)
        v38 = v24;
      else
        v38 = v20;
      if (v20 <= v24)
        v20 = v24;
      do
      {
        objc_msgSend(v17, "identifierForColumnAtIndex:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v39);

        ++v38;
      }
      while (v38 <= v20);
      -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "selectColumns:", v28);
      goto LABEL_44;
    }
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "type");

    if (v41 == 3)
    {
      v45 = v15;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23 >= v25)
        v42 = v25;
      else
        v42 = v23;
      if (v23 <= v25)
        v43 = v25;
      else
        v43 = v23;
      do
      {
        objc_msgSend(v17, "identifierForRowAtIndex:", v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v44);

        ++v42;
      }
      while (v42 <= v43);
      -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "selectRows:", v28);
LABEL_44:

      v15 = v45;
    }
  }
  -[ICTableAttachmentViewController updateChrome](self, "updateChrome");

}

- (id)namedStylesForCurrentSelectionAndBIUS:(unint64_t *)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  ICTableAttachmentViewController *v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[ICTableAttachmentViewController table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if (objc_msgSend(v22, "type")
    || -[ICTableAttachmentViewController containedInNoteSelection](self, "containedInNoteSelection"))
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v22, "columns");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v37;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v37 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v8);
          if (!v5)
          {
            objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v10 = objc_msgSend(v3, "columnIndexForIdentifier:", v9);
          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v5, "addIndex:", v10);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v6);
    }

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v22, "rows");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v33;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v33 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v15);
          if (!v12)
          {
            objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v17 = objc_msgSend(v3, "rowIndexForIdentifier:", v16);
          if (v17 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v12, "addIndex:", v17);
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v13);
    }

    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __73__ICTableAttachmentViewController_namedStylesForCurrentSelectionAndBIUS___block_invoke;
    v23[3] = &unk_1EA7DF8F0;
    v24 = v22;
    v25 = self;
    v26 = v20;
    v27 = &v28;
    objc_msgSend(v3, "enumerateCellObjectsInCellSelectionContainingColumnIndices:rowIndices:copyItems:usingBlock:", v5, v12, 0, v23);
    if (a3)
      *a3 = v29[3];

    _Block_object_dispose(&v28, 8);
  }

  return v20;
}

uint64_t __73__ICTableAttachmentViewController_namedStylesForCurrentSelectionAndBIUS___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  ICBaseTextView *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  ICBaseTextView *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;

  objc_msgSend(a2, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "type") == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "currentlyEditingTextView");
    v7 = (ICBaseTextView *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "table");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifierForRowAtIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "currentlyEditingTextStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "characterRangeForRowID:", v9);
    objc_msgSend(*(id *)(a1 + 40), "currentlyEditingTextView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "selectedRange") - v12;
    objc_msgSend(*(id *)(a1 + 40), "currentlyEditingTextView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "selectedRange");
    v17 = v16;

  }
  else
  {
    if (!v6)
    {
      v14 = 0;
      v17 = 0;
      goto LABEL_8;
    }
    v18 = objc_alloc(MEMORY[0x1E0D64D60]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v18, "initWithAttributedString:replicaID:", v6, v19);

    v11 = objc_alloc_init(MEMORY[0x1E0DC12C0]);
    v13 = objc_alloc_init(MEMORY[0x1E0DC1280]);
    objc_msgSend(v9, "addLayoutManager:", v13);
    objc_msgSend(v11, "replaceLayoutManager:", v13);
    v20 = [ICBaseTextView alloc];
    v7 = -[ICBaseTextView initWithFrame:textContainer:](v20, "initWithFrame:textContainer:", v11, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[ICBaseTextView textStorage](v7, "textStorage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBaseTextView setSelectedRange:](v7, "setSelectedRange:", 0, objc_msgSend(v21, "length"));

    v14 = -[ICBaseTextView selectedRange](v7, "selectedRange");
    v17 = v22;
  }

  if (v7)
  {
    -[ICBaseTextView ic_selectedStyles](v7, "ic_selectedStyles");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addIndexes:", v23);

  }
LABEL_8:
  if (objc_msgSend(v6, "length"))
  {
    if (v14 >= objc_msgSend(v6, "length"))
    {
      v14 = objc_msgSend(v6, "length") - 1;
      v17 = 1;
    }
    objc_msgSend(v6, "attributesAtIndex:longestEffectiveRange:inRange:", v14, 0, v14, v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0D63918]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "intValue");

    if ((v26 & 1) != 0)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= 1uLL;
    if ((v26 & 2) != 0)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= 2uLL;
    objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0D63948]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "BOOLValue");

    if (v28)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= 4uLL;
    objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0D63930]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "BOOLValue");

    if (v30)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= 8uLL;
    objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0D63908]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "intValue");

    if (ICEmphasisColorTypeForTag())
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= 0x10uLL;

  }
  return 0;
}

- (void)setSelectionBIUSStyle:(unint64_t)a3 toggleOn:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "columns");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rows");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController setSelectionBIUSStyle:toggleOn:withColumns:rows:](self, "setSelectionBIUSStyle:toggleOn:withColumns:rows:", a3, v4, v10, v9);
}

- (void)setSelectionBIUSStyle:(unint64_t)a3 toggleOn:(BOOL)a4 withColumns:(id)a5 rows:(id)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  ICTableAttachmentViewController *v32;
  _QWORD v33[6];
  BOOL v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v30 = a3;
  v45 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a6;
  v32 = self;
  -[ICTableAttachmentViewController table](self, "table");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v14, "addIndex:", objc_msgSend(v10, "columnIndexForIdentifier:", v17, v30));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v18 = v9;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v19)
  {
    v20 = v19;
    v21 = 0;
    v22 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(v18);
        v24 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
        if (!v21)
        {
          objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v21, "addIndex:", objc_msgSend(v10, "rowIndexForIdentifier:", v24, v30));
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v20);
  }
  else
  {
    v21 = 0;
  }

  -[ICTableAttachmentViewController undoTarget](v32, "undoTarget");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController undoManager](v32, "undoManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __83__ICTableAttachmentViewController_setSelectionBIUSStyle_toggleOn_withColumns_rows___block_invoke;
  v33[3] = &unk_1EA7DF940;
  v33[4] = v32;
  v33[5] = v30;
  v34 = a4;
  objc_msgSend(v10, "enumerateTextStoragesForColumnIndexes:rowIndexes:undoTarget:undoManager:usingBlock:", v14, v21, v25, v26, v33);

  -[ICTableAttachmentViewController save](v32, "save");
  -[ICTableAttachmentViewController undoManager](v32, "undoManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Styling"), &stru_1EA7E9860, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActionName:", v29);

}

void __83__ICTableAttachmentViewController_setSelectionBIUSStyle_toggleOn_withColumns_rows___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  char v18;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "table");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifierForColumnAtIndex:", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "tableLayoutManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "columnLayoutManagerForColumn:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "beginEditing");
  v11 = objc_msgSend(v5, "length");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__ICTableAttachmentViewController_setSelectionBIUSStyle_toggleOn_withColumns_rows___block_invoke_2;
  v15[3] = &unk_1EA7DF918;
  v12 = *(_QWORD *)(a1 + 40);
  v18 = *(_BYTE *)(a1 + 48);
  v16 = v5;
  v17 = v12;
  v13 = v5;
  objc_msgSend(v13, "enumerateAttributesInRange:options:usingBlock:", 0, v11, 0, v15);
  objc_msgSend(v10, "endEditing");

}

void __83__ICTableAttachmentViewController_setSelectionBIUSStyle_toggleOn_withColumns_rows___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
  uint64_t *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  id v21;

  v7 = a2;
  v21 = v7;
  if (v7)
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if ((v10 & 1) != 0)
  {
    v13 = (uint64_t *)MEMORY[0x1E0D63918];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63918]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "intValue");

    v16 = (void *)MEMORY[0x1E0CB37E8];
    if (*(_BYTE *)(a1 + 48))
      v17 = v15 | 1u;
    else
      v17 = v15 & 0xFFFFFFFE;
    goto LABEL_18;
  }
  if ((v10 & 2) != 0)
  {
    v13 = (uint64_t *)MEMORY[0x1E0D63918];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63918]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "intValue");

    v16 = (void *)MEMORY[0x1E0CB37E8];
    if (*(_BYTE *)(a1 + 48))
      v17 = v19 | 2u;
    else
      v17 = v19 & 0xFFFFFFFD;
LABEL_18:
    objc_msgSend(v16, "numberWithUnsignedInt:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *v13;
LABEL_21:
    objc_msgSend(v9, "setObject:forKey:", v11, v20);

    goto LABEL_22;
  }
  if ((v10 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (uint64_t *)MEMORY[0x1E0D63948];
LABEL_20:
    v20 = *v12;
    goto LABEL_21;
  }
  if ((v10 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (uint64_t *)MEMORY[0x1E0D63930];
    goto LABEL_20;
  }
  if ((v10 & 0x10) != 0)
  {
    if (!*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(v8, "removeObjectForKey:", *MEMORY[0x1E0D63908]);
      objc_msgSend(v9, "removeObjectForKey:", *MEMORY[0x1E0D63920]);
      objc_msgSend(v9, "removeObjectForKey:", *MEMORY[0x1E0D63D50]);
      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ic_currentEmphasisColorTypeDefault());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (uint64_t *)MEMORY[0x1E0D63908];
    goto LABEL_20;
  }
LABEL_22:
  objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v9, a3, a4);

}

- (void)setSelectionNamedStyle:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "columns");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController setSelectionNamedStyle:withColumns:rows:](self, "setSelectionNamedStyle:withColumns:rows:", v3, v8, v7);
}

- (void)setSelectionNamedStyle:(unsigned int)a3 withColumns:(id)a4 rows:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  ICTableAttachmentViewController *v32;
  _QWORD v33[5];
  id v34;
  unsigned int v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v32 = self;
  -[ICTableAttachmentViewController table](self, "table");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v41 != v14)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v13, "addIndex:", objc_msgSend(v9, "columnIndexForIdentifier:", v16));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v17 = v8;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v37 != v21)
          objc_enumerationMutation(v17);
        v23 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
        if (!v20)
        {
          objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v20, "addIndex:", objc_msgSend(v9, "rowIndexForIdentifier:", v23));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v19);
  }
  else
  {
    v20 = 0;
  }

  objc_msgSend(MEMORY[0x1E0D63C98], "paragraphStyleNamed:", a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController undoTarget](v32, "undoTarget");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController undoManager](v32, "undoManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __75__ICTableAttachmentViewController_setSelectionNamedStyle_withColumns_rows___block_invoke;
  v33[3] = &unk_1EA7DF990;
  v35 = a3;
  v33[4] = v32;
  v34 = v24;
  v27 = v24;
  objc_msgSend(v9, "enumerateTextStoragesForColumnIndexes:rowIndexes:undoTarget:undoManager:usingBlock:", v13, v20, v25, v26, v33);

  -[ICTableAttachmentViewController save](v32, "save");
  -[ICTableAttachmentViewController undoManager](v32, "undoManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Styling"), &stru_1EA7E9860, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActionName:", v30);

}

void __75__ICTableAttachmentViewController_setSelectionNamedStyle_withColumns_rows___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;
  id v22;
  id v23;
  int v24;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "table");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifierForColumnAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "tableLayoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "columnLayoutManagerForColumn:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "beginEditing");
  objc_msgSend(v5, "attributedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "length");
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __75__ICTableAttachmentViewController_setSelectionNamedStyle_withColumns_rows___block_invoke_2;
  v20 = &unk_1EA7DF968;
  v21 = v12;
  v24 = *(_DWORD *)(a1 + 48);
  v22 = *(id *)(a1 + 40);
  v23 = v5;
  v15 = v5;
  v16 = v12;
  objc_msgSend(v13, "ic_enumerateParagraphsInRange:usingBlock:", 0, v14, &v17);

  objc_msgSend(v11, "endEditing", v17, v18, v19, v20);
}

void __75__ICTableAttachmentViewController_setSelectionNamedStyle_withColumns_rows___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  objc_msgSend(*(id *)(a1 + 32), "attributesAtIndex:effectiveRange:", a2, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  v7 = (_QWORD *)MEMORY[0x1E0D63928];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8 || objc_msgSend(v8, "style") != *(_DWORD *)(a1 + 56))
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *v7);
  objc_msgSend(*(id *)(a1 + 48), "setAttributes:range:", v6, v10, v11);

}

- (int64_t)textAlignmentForCurrentSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int64_t v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController table](self, "table");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isRangeOrSpanningSelection")
    && objc_msgSend(v4, "columnCount")
    && objc_msgSend(v4, "rowCount"))
  {
    objc_msgSend(v3, "columns");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v4, "identifierForColumnAtIndex:", 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v8;

    objc_msgSend(v3, "rows");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(v4, "identifierForRowAtIndex:", 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;

    objc_msgSend(v4, "stringForColumnID:rowID:", v11, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "length"))
    {
      objc_msgSend(v17, "attributesAtIndex:effectiveRange:", 0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0D63928]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v19, "alignment");

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setSelectionAlignment:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  ICTableAttachmentViewController *v30;
  int64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[ICTableAttachmentViewController table](self, "table");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "columns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        if (!v9)
        {
          objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v9, "addIndex:", objc_msgSend(v4, "columnIndexForIdentifier:", v12));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rows");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v14);
        v20 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
        if (!v17)
        {
          objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v17, "addIndex:", objc_msgSend(v4, "rowIndexForIdentifier:", v20));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

  -[ICTableAttachmentViewController undoTarget](self, "undoTarget");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController undoManager](self, "undoManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __57__ICTableAttachmentViewController_setSelectionAlignment___block_invoke;
  v28[3] = &unk_1EA7DF9E0;
  v29 = v4;
  v30 = self;
  v31 = a3;
  v23 = v4;
  objc_msgSend(v23, "enumerateTextStoragesForColumnIndexes:rowIndexes:undoTarget:undoManager:usingBlock:", v9, v17, v21, v22, v28);

  -[ICTableAttachmentViewController save](self, "save");
  -[ICTableAttachmentViewController undoManager](self, "undoManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Format"), &stru_1EA7E9860, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActionName:", v26);

}

void __57__ICTableAttachmentViewController_setSelectionAlignment___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifierForColumnAtIndex:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "tableLayoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "columnLayoutManagerForColumn:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "beginEditing");
  v10 = objc_msgSend(v5, "length");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__ICTableAttachmentViewController_setSelectionAlignment___block_invoke_2;
  v14[3] = &unk_1EA7DF9B8;
  v11 = *(_QWORD *)(a1 + 48);
  v15 = v5;
  v16 = v11;
  v12 = v5;
  objc_msgSend(v12, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v14);
  objc_msgSend(v9, "endEditing");

}

void __57__ICTableAttachmentViewController_setSelectionAlignment___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a2;
  v15 = v7;
  if (v7)
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = (_QWORD *)MEMORY[0x1E0D63928];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0D63C98], "defaultParagraphStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v13, "mutableCopy");

  }
  objc_msgSend(v12, "setAlignment:", *(_QWORD *)(a1 + 40));
  v14 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, *v10);

  objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v9, a3, a4);
}

- (int64_t)textDirectionForCurrentSelection
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = objc_msgSend(MEMORY[0x1E0DC1290], "defaultWritingDirectionForLanguage:", 0);
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isRangeOrSpanningSelection")
    && objc_msgSend(v5, "columnCount")
    && objc_msgSend(v5, "rowCount"))
  {
    objc_msgSend(v4, "columns");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v5, "identifierForColumnAtIndex:", 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    objc_msgSend(v4, "rows");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v5, "identifierForRowAtIndex:", 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    objc_msgSend(v5, "stringForColumnID:rowID:", v10, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
    {
      objc_msgSend(v16, "attributesAtIndex:effectiveRange:", 0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0D63928]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v18, "writingDirection");

    }
  }

  return v3;
}

- (void)setSelectionDirection:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
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
  -[ICTableAttachmentViewController table](self, "table");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "columns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (!v9)
        {
          objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v9, "addIndex:", objc_msgSend(v4, "columnIndexForIdentifier:", v12));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rows");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v14);
        v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
        if (!v17)
        {
          objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v17, "addIndex:", objc_msgSend(v4, "rowIndexForIdentifier:", v20));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

  -[ICTableAttachmentViewController updateTableCellsWithDirection:columnIndexes:rowIndexes:](self, "updateTableCellsWithDirection:columnIndexes:rowIndexes:", a3, v9, v17);
  -[ICTableAttachmentViewController save](self, "save");
  -[ICTableAttachmentViewController undoManager](self, "undoManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Format"), &stru_1EA7E9860, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActionName:", v23);

}

- (void)updateTableCellsWithDirection:(int64_t)a3 columnIndexes:(id)a4 rowIndexes:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  ICTableAttachmentViewController *v16;
  int64_t v17;

  v8 = a5;
  v9 = a4;
  -[ICTableAttachmentViewController table](self, "table");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController undoTarget](self, "undoTarget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController undoManager](self, "undoManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __90__ICTableAttachmentViewController_updateTableCellsWithDirection_columnIndexes_rowIndexes___block_invoke;
  v14[3] = &unk_1EA7DF9E0;
  v15 = v10;
  v16 = self;
  v17 = a3;
  v13 = v10;
  objc_msgSend(v13, "enumerateTextStoragesForColumnIndexes:rowIndexes:undoTarget:undoManager:usingBlock:", v9, v8, v11, v12, v14);

}

void __90__ICTableAttachmentViewController_updateTableCellsWithDirection_columnIndexes_rowIndexes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifierForColumnAtIndex:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "tableLayoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "columnLayoutManagerForColumn:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "beginEditing");
  v10 = objc_msgSend(v5, "length");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __90__ICTableAttachmentViewController_updateTableCellsWithDirection_columnIndexes_rowIndexes___block_invoke_2;
  v14[3] = &unk_1EA7DF9B8;
  v11 = *(_QWORD *)(a1 + 48);
  v15 = v5;
  v16 = v11;
  v12 = v5;
  objc_msgSend(v12, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v14);
  objc_msgSend(v9, "endEditing");

}

void __90__ICTableAttachmentViewController_updateTableCellsWithDirection_columnIndexes_rowIndexes___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a2;
  v15 = v7;
  if (v7)
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = (_QWORD *)MEMORY[0x1E0D63928];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0D63C98], "defaultParagraphStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v13, "mutableCopy");

  }
  objc_msgSend(v12, "setWritingDirection:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v12, "setAlignment:", 4);
  v14 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, *v10);

  objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v9, a3, a4);
}

- (void)setHighlightColor:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[ICAbstractAttachmentViewController highlightColor](self, "highlightColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)ICTableAttachmentViewController;
    -[ICAbstractAttachmentViewController setHighlightColor:](&v9, sel_setHighlightColor_, v4);
    -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHighlightColor:", v4);

    -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ic_setNeedsLayout");

  }
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICTableAttachmentViewController;
  v4 = a3;
  -[ICAbstractAttachmentViewController setHighlightPatternRegexFinder:](&v6, sel_setHighlightPatternRegexFinder_, v4);
  -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlightPatternRegexFinder:", v4);

}

- (void)setupTableTextView:(id)a3
{
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  -[ICTableAttachmentViewController makeDelegateOfTextView:](self, "makeDelegateOfTextView:", v25);
  objc_msgSend(v25, "setCellDelegate:", self);
  objc_msgSend(v25, "setSelectionDelegate:", self);
  objc_opt_class();
  objc_msgSend(v25, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentViewController attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "undoManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUndoManager:", v9);

  -[ICTableAttachmentViewController undoTarget](self, "undoTarget");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOverrideUndoTarget:", v10);

  objc_msgSend(v5, "setUndoHelper:", self);
  objc_opt_class();
  objc_msgSend(v5, "styler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentViewController attachment](self, "attachment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "note");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNote:", v14);

  -[ICTableAttachmentViewController setTypingAttributesForTextView:](self, "setTypingAttributesForTextView:", v25);
  objc_opt_class();
  -[ICAttachmentViewController attachment](self, "attachment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "note");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "textStorage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "styler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((noteTextController) != nil)", "-[ICTableAttachmentViewController setupTableTextView:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "noteTextController");
  objc_opt_class();
  objc_msgSend(v25, "columnTextStorage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "styler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "authorHighlightsController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAuthorHighlightsController:", v23);

  objc_msgSend(v19, "zoomController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setZoomController:", v24);

}

- (BOOL)allowsNewTextLength:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[ICAttachmentViewController attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "allowsNewTextLength:", a3);

  return a3;
}

- (void)selectionWillBecomeFirstResponder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[ICTableAttachmentViewController lockSelection](self, "lockSelection"))
  {
    -[ICTableAttachmentViewController auxiliaryTextViewHost](self, "auxiliaryTextViewHost");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAuxiliaryResponder:", v5);

  }
}

- (void)selectionDidResignFirstResponder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[ICTableAttachmentViewController lockSelection](self, "lockSelection"))
  {
    -[ICTableAttachmentViewController hideColumnRowButtons](self, "hideColumnRowButtons");
    -[ICTableAttachmentViewController auxiliaryTextViewHost](self, "auxiliaryTextViewHost");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "auxiliaryResponder");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v7)
    {
      -[ICTableAttachmentViewController auxiliaryTextViewHost](self, "auxiliaryTextViewHost");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAuxiliaryResponder:", 0);

    }
  }

}

- (void)deleteSelection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  -[ICTableAttachmentViewController table](self, "table");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowsIntersectingWithRows:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "columns");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "columnsIntersectingWithColumns:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "type") != 4)
  {
    if (objc_msgSend(v5, "type") == 2)
    {
      if (objc_msgSend(v4, "isEmptyAtColumnIdentifiers:rowIdentifiers:", v9, 0))
      {
        -[ICTableAttachmentViewController deleteSelectedColumns:](self, "deleteSelectedColumns:", v15);
        goto LABEL_14;
      }
    }
    else
    {
      if (objc_msgSend(v5, "type") != 3)
        goto LABEL_14;
      if (objc_msgSend(v4, "isEmptyAtColumnIdentifiers:rowIdentifiers:", 0, v7))
      {
        -[ICTableAttachmentViewController deleteSelectedRows:](self, "deleteSelectedRows:", v15);
        goto LABEL_14;
      }
    }
LABEL_13:
    -[ICTableAttachmentViewController deleteSelectionCellContents](self, "deleteSelectionCellContents");
    goto LABEL_14;
  }
  v10 = objc_msgSend(v7, "count");
  v11 = objc_msgSend(v4, "rowCount");
  v12 = objc_msgSend(v9, "count");
  v13 = objc_msgSend(v4, "columnCount");
  v14 = v13;
  if (v10 != v11 && v12 != v13 || !objc_msgSend(v4, "isEmptyAtColumnIdentifiers:rowIdentifiers:", v9, v7))
    goto LABEL_13;
  if (v10 == v11)
  {
    -[ICTableAttachmentViewController deleteColumns:](self, "deleteColumns:", v9);
  }
  else if (v12 == v14)
  {
    -[ICTableAttachmentViewController deleteRows:](self, "deleteRows:", v7);
  }
LABEL_14:

}

- (void)cutSelection:(id)a3
{
  -[ICTableAttachmentViewController copySelection:](self, "copySelection:", self);
  -[ICTableAttachmentViewController deleteSelectionCellContents](self, "deleteSelectionCellContents");
}

- (void)pasteIntoSelection:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  id v31;
  unint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection", a3);
  v36 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "type") == 1)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "ICTableAttachmentSelectionTypeCell != tableSelection.type", "-[ICTableAttachmentViewController pasteIntoSelection:]", 1, 0, CFSTR("Not expecting a call to -pasteIntoSelection: when editing a cell."));
  -[ICTableAttachmentViewController icTableFromPasteboard](self, "icTableFromPasteboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[ICTableAttachmentViewController soloPlainTextStringFromPasteboard](self, "soloPlainTextStringFromPasteboard");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_31;
    v6 = (void *)v5;
    v7 = objc_alloc(MEMORY[0x1E0D63CD8]);
    -[ICTableAttachmentViewController table](self, "table");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "document");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "replica");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)objc_msgSend(v7, "initWithData:replicaID:", 0, v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v7, "initWithData:replicaID:", 0, v12);

    }
    objc_msgSend(v11, "table");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v4, "insertRowAtIndex:", 0);
    v14 = (id)objc_msgSend(v4, "insertColumnAtIndex:", 0);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v6);
    objc_msgSend(v4, "setAttributedString:columnIndex:rowIndex:", v15, 0, 0);

  }
  -[ICTableAttachmentViewController table](self, "table");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "columns");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(v36, "columns");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v16, "columnIndexForIdentifier:", v19);

  }
  else
  {
    v35 = 0;
  }

  objc_msgSend(v36, "rows");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "count"))
  {
    objc_msgSend(v36, "rows");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v16, "rowIndexForIdentifier:", v22);

  }
  else
  {
    v34 = 0;
  }

  v23 = objc_msgSend(v4, "columnCount");
  v24 = objc_msgSend(v4, "rowCount");
  objc_msgSend(v36, "columns");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");
  if (!v26)
    v26 = objc_msgSend(v16, "columnCount");

  objc_msgSend(v36, "rows");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");
  if (!v28)
    v28 = objc_msgSend(v16, "rowCount");

  if (v23 >= v26)
    v29 = v23 - v26;
  else
    v29 = 0;
  -[ICTableAttachmentViewController table](self, "table");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 != v30)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "destinationTable == self.table", "-[ICTableAttachmentViewController pasteIntoSelection:]", 1, 0, CFSTR("destination table should be self.table"));
  v31 = -[ICTableAttachmentViewController insertColumns:atIndex:](self, "insertColumns:atIndex:", v29, v26 + v35);
  if (v24 >= v28)
    v32 = v24 - v28;
  else
    v32 = 0;
  v33 = (id)objc_msgSend(v16, "insertRows:atIndex:", v32, v28 + v34);
  if (v23 > v26 || v24 > v28)
  {
    -[ICTableAttachmentViewController postChangeNotification:columnOrRowUUIDs:](self, "postChangeNotification:columnOrRowUUIDs:", 2, 0);
    -[ICTableAttachmentViewController redrawAndSave](self, "redrawAndSave");
  }
  -[ICTableAttachmentViewController pasteTable:atColumnIndex:rowIndex:shouldSetSelectionToPastedRange:](self, "pasteTable:atColumnIndex:rowIndex:shouldSetSelectionToPastedRange:", v4, v35, v34, 1);

LABEL_31:
}

- (void)deleteSelectionCellContents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[ICTableAttachmentViewController table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "columns");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v4, "addIndex:", objc_msgSend(v3, "columnIndexForIdentifier:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i)));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v9);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rows");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v5, "addIndex:", objc_msgSend(v3, "rowIndexForIdentifier:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j)));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v15);
  }

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "type");

  if (v19 == 2)
  {
    -[ICTableAttachmentViewController table](self, "table");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "rowCount");

    if (v21)
    {
      v22 = 0;
      do
      {
        objc_msgSend(v5, "addIndex:", v22++);
        -[ICTableAttachmentViewController table](self, "table");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "rowCount");

      }
      while (v22 < v24);
    }
  }
  else
  {
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "type");

    if (v26 == 3)
    {
      -[ICTableAttachmentViewController table](self, "table");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "columnCount");

      if (v28)
      {
        v29 = 0;
        do
        {
          objc_msgSend(v4, "addIndex:", v29++);
          -[ICTableAttachmentViewController table](self, "table");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "columnCount");

        }
        while (v29 < v31);
      }
    }
  }
  -[ICTableAttachmentViewController undoTarget](self, "undoTarget");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController undoManager](self, "undoManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateTextStoragesForColumnIndexes:rowIndexes:undoTarget:undoManager:usingBlock:", v4, v5, v32, v33, &__block_literal_global_179);

  -[ICTableAttachmentViewController save](self, "save");
}

void __62__ICTableAttachmentViewController_deleteSelectionCellContents__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "replaceCharactersInRange:withString:", 0, objc_msgSend(v2, "length"), &stru_1EA7E9860);

}

- (void)pasteTable:(id)a3 atColumnIndex:(unint64_t)a4 rowIndex:(unint64_t)a5 shouldSetSelectionToPastedRange:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 v27;
  _QWORD v28[4];
  id v29;
  ICTableAttachmentViewController *v30;
  unint64_t v31;
  unint64_t v32;

  v6 = a6;
  v10 = a3;
  if (v10)
  {
    -[ICTableAttachmentViewController beginEditing](self, "beginEditing");
    -[ICTableAttachmentViewController table](self, "table");
    v27 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "columnCount");
    v13 = objc_msgSend(v10, "rowCount");
    v25 = v12;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", a4, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v13;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", a5, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController undoTarget](self, "undoTarget");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController undoManager](self, "undoManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __101__ICTableAttachmentViewController_pasteTable_atColumnIndex_rowIndex_shouldSetSelectionToPastedRange___block_invoke;
    v28[3] = &unk_1EA7DFA48;
    v31 = a4;
    v32 = a5;
    v29 = v10;
    v30 = self;
    objc_msgSend(v11, "enumerateTextStoragesForColumnIndexes:rowIndexes:undoTarget:undoManager:usingBlock:", v14, v15, v16, v17, v28);

    -[ICTableAttachmentViewController endEditing](self, "endEditing");
    -[ICTableAttachmentViewController undoManager](self, "undoManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Paste"), &stru_1EA7E9860, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActionName:", v20);

    if (v27)
    {
      objc_msgSend(v11, "identifiersForColumnIndexes:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifiersForRowIndexes:", v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "selectCellRangeAtColumns:rows:", v21, v22);

      -[ICTableAttachmentViewController updateChrome](self, "updateChrome");
    }
    else
    {
      objc_msgSend(v11, "identifierForColumnAtIndex:", a4 + v25 - 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifierForRowAtIndex:", a5 + v26 - 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableAttachmentViewController beginEditingCellWithColumnID:andRowID:location:](self, "beginEditingCellWithColumnID:andRowID:location:", v21, v22, 2);
    }

    -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "updateAuthorHighlights");

    -[ICTableAttachmentViewController save](self, "save");
  }

}

void __101__ICTableAttachmentViewController_pasteTable_atColumnIndex_rowIndex_shouldSetSelectionToPastedRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a3 - *(_QWORD *)(a1 + 48);
  v6 = a4 - *(_QWORD *)(a1 + 56);
  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "stringForColumnIndex:rowIndex:", v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "attachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_attributedStringByFlatteningUnsupportedInlineAttachmentsWithContext:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "attachment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ic_attributedStringByCopyingInlineAttachmentsAndUpdatingChangeCountWithContext:", v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (!v15)
    v15 = objc_alloc_init(MEMORY[0x1E0CB3498]);
  objc_msgSend(v8, "setIsReadingSelectionFromPasteboard:", 1);
  objc_msgSend(v8, "replaceCharactersInRange:withAttributedString:", 0, objc_msgSend(v8, "length"), v15);
  objc_msgSend(v8, "setIsReadingSelectionFromPasteboard:", 0);

}

- (void)extendCellRangeSelectionInDirection:(unint64_t)a3 toEnd:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  char v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  unint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  unint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  unint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  unint64_t v76;
  void *v77;
  void *v78;
  char v79;
  void *v80;
  char v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  unint64_t v98;
  void *v99;
  unint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  unint64_t v107;
  void *v108;
  unint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  _QWORD v114[2];

  v4 = a4;
  v114[1] = *MEMORY[0x1E0C80C00];
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  if (objc_msgSend(v8, "type") != 4)
  {
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "columns");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rows");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11 || !v14)
    {
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICTableAttachmentViewController extendCellRangeSelectionInDirection:toEnd:]", 1, 0, CFSTR("We tried to extend an invalid selection"));

      goto LABEL_46;
    }
    -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeFromSuperview");

    -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController endCellEditingSessionWithTextView:](self, "endCellEditingSessionWithTextView:", v16);

    -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextSelectionHidden:", 1);

    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v114[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v113, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "selectCellRangeAtColumns:rows:", v19, v20);

  }
  objc_msgSend(v8, "columns");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22 == 1)
  {
    objc_msgSend(v8, "columns");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController setRangeSelectionAnchorColumn:](self, "setRangeSelectionAnchorColumn:", v24);

  }
  objc_msgSend(v8, "rows");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (v26 == 1)
  {
    objc_msgSend(v8, "rows");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController setRangeSelectionAnchorRow:](self, "setRangeSelectionAnchorRow:", v28);

  }
  -[ICTableAttachmentViewController table](self, "table");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController rangeSelectionAnchorColumn](self, "rangeSelectionAnchorColumn");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v29, "columnIndexForIdentifier:", v30);

  -[ICTableAttachmentViewController table](self, "table");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController rangeSelectionAnchorRow](self, "rangeSelectionAnchorRow");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v32, "rowIndexForIdentifier:", v33);

  switch(a3)
  {
    case 0uLL:
      -[ICTableAttachmentViewController table](self, "table");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isLeftToRight");

      if ((v36 & 1) != 0)
        goto LABEL_15;
      -[ICTableAttachmentViewController table](self, "table");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "isRightToLeft");

      if (v38)
        goto LABEL_24;
      goto LABEL_43;
    case 1uLL:
      -[ICTableAttachmentViewController table](self, "table");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isRightToLeft");

      if (v40)
      {
LABEL_15:
        if (v4)
        {
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v31 + 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
          -[ICTableAttachmentViewController table](self, "table");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "identifiersForColumnIndexes:", v41);
          v56 = objc_claimAutoreleasedReturnValue();
LABEL_27:
          v45 = (void *)v56;
LABEL_28:

          -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "rows");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v46;
          v49 = v45;
          goto LABEL_40;
        }
        -[ICTableAttachmentViewController table](self, "table");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "columns");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "lastObject");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v57, "columnIndexForIdentifier:", v59);

        if (v60 > v31)
        {
          objc_msgSend(v8, "columns");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)objc_msgSend(v61, "mutableCopy");

          objc_msgSend(v41, "removeLastObject");
          goto LABEL_38;
        }
        -[ICTableAttachmentViewController table](self, "table");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "columns");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "firstObject");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = objc_msgSend(v83, "columnIndexForIdentifier:", v85);

        if (v86)
        {
          -[ICTableAttachmentViewController table](self, "table");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "identifierForColumnAtIndex:", v86 - 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          v112 = v41;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v112, 1);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "columns");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "arrayByAddingObjectsFromArray:", v88);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_28;
        }
      }
      else
      {
        -[ICTableAttachmentViewController table](self, "table");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "isLeftToRight");

        if ((v52 & 1) == 0)
          goto LABEL_43;
LABEL_24:
        if (v4)
        {
          v53 = (void *)MEMORY[0x1E0CB36B8];
          -[ICTableAttachmentViewController table](self, "table");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "indexSetWithIndexesInRange:", v31, objc_msgSend(v54, "columnCount") - v31);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_26;
        }
        -[ICTableAttachmentViewController table](self, "table");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "columns");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "firstObject");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v73, "columnIndexForIdentifier:", v75);

        if (v76 < v31)
        {
          objc_msgSend(v8, "columns");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)objc_msgSend(v77, "mutableCopy");

          objc_msgSend(v41, "removeObjectAtIndex:", 0);
LABEL_38:
          -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)objc_msgSend(v41, "copy");
          objc_msgSend(v8, "rows");
          v72 = objc_claimAutoreleasedReturnValue();
LABEL_39:
          v47 = (void *)v72;
          v48 = v45;
          v49 = v46;
LABEL_40:
          v50 = v47;
LABEL_41:
          objc_msgSend(v48, "selectCellRangeAtColumns:rows:", v49, v50);
LABEL_42:

          goto LABEL_43;
        }
        -[ICTableAttachmentViewController table](self, "table");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "columns");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "lastObject");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = objc_msgSend(v104, "columnIndexForIdentifier:", v106);

        -[ICTableAttachmentViewController table](self, "table");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = objc_msgSend(v108, "columnCount") - 1;

        if (v107 < v109)
        {
          -[ICTableAttachmentViewController table](self, "table");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "identifierForColumnAtIndex:", v107 + 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "columns");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "arrayByAddingObject:", v41);
          v56 = objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        }
      }
LABEL_43:
      -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(v8, "isEqual:", v78);

      if ((v79 & 1) == 0)
      {
        -[ICTableAttachmentViewController announceCellRangeSelectionChangeForAccessibilityIfNecessary](self, "announceCellRangeSelectionChangeForAccessibilityIfNecessary");
        -[ICTableAttachmentViewController updateChrome](self, "updateChrome");
        -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend(v80, "ic_isFirstResponder");

        if ((v81 & 1) == 0)
        {
          -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICTableAttachmentViewController ic_makeFirstResponder:](self, "ic_makeFirstResponder:", v82);

        }
      }
      break;
    case 2uLL:
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v34 + 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      -[ICTableAttachmentViewController table](self, "table");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rows");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "lastObject");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v62, "rowIndexForIdentifier:", v64);

      if (v65 > v34)
      {
        objc_msgSend(v8, "rows");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(v66, "mutableCopy");

        objc_msgSend(v41, "removeLastObject");
        goto LABEL_35;
      }
      -[ICTableAttachmentViewController table](self, "table");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rows");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "firstObject");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend(v89, "rowIndexForIdentifier:", v91);

      if (!v92)
        goto LABEL_43;
      -[ICTableAttachmentViewController table](self, "table");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "identifierForRowAtIndex:", v92 - 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v111 = v41;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v111, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rows");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "arrayByAddingObjectsFromArray:", v94);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    case 3uLL:
      if (v4)
      {
        v42 = (void *)MEMORY[0x1E0CB36B8];
        -[ICTableAttachmentViewController table](self, "table");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "indexSetWithIndexesInRange:", v34, objc_msgSend(v43, "rowCount") - v34);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
        -[ICTableAttachmentViewController table](self, "table");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "identifiersForRowIndexes:", v41);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

        -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "columns");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v46;
        v49 = v47;
        v50 = v45;
        goto LABEL_41;
      }
      -[ICTableAttachmentViewController table](self, "table");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rows");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "firstObject");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v67, "rowIndexForIdentifier:", v69);

      if (v70 < v34)
      {
        objc_msgSend(v8, "rows");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(v71, "mutableCopy");

        objc_msgSend(v41, "removeObjectAtIndex:", 0);
LABEL_35:
        -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "columns");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v41, "copy");
        goto LABEL_39;
      }
      -[ICTableAttachmentViewController table](self, "table");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rows");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "lastObject");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend(v95, "rowIndexForIdentifier:", v97);

      -[ICTableAttachmentViewController table](self, "table");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = objc_msgSend(v99, "rowCount") - 1;

      if (v98 >= v100)
        goto LABEL_43;
      -[ICTableAttachmentViewController table](self, "table");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "identifierForRowAtIndex:", v98 + 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "rows");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "arrayByAddingObject:", v41);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "columns");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = (void *)objc_msgSend(v45, "copy");
      objc_msgSend(v46, "selectCellRangeAtColumns:rows:", v47, v103);

      goto LABEL_42;
    default:
      goto LABEL_43;
  }
LABEL_46:

}

- (void)saveAttachmentChanges
{
  -[ICTableAttachmentViewController saveAttachmentChangesInBackground:](self, "saveAttachmentChangesInBackground:", 1);
}

- (void)saveAttachmentChangesInBackground:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_save, 0);
  -[ICTableAttachmentViewController table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "archivedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController tableAttachmentProvider](self, "tableAttachmentProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v3)
    objc_msgSend(v8, "backgroundAttachment");
  else
    objc_msgSend(v8, "attachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __69__ICTableAttachmentViewController_saveAttachmentChangesInBackground___block_invoke;
  v19 = &unk_1EA7DD498;
  v11 = v10;
  v20 = v11;
  v21 = v7;
  v12 = v7;
  v13 = _Block_copy(&v16);
  objc_msgSend(v11, "managedObjectContext", v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v3)
    objc_msgSend(v14, "performBlock:", v13);
  else
    objc_msgSend(v14, "performBlockAndWait:", v13);

}

void __69__ICTableAttachmentViewController_saveAttachmentChangesInBackground___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "attachmentModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "updateAttachmentByMergingWithTableData:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v8, "regenerateTextContentInNote");
  if (objc_msgSend(*(id *)(a1 + 32), "isInNoteTitleOrSnippet"))
  {
    objc_msgSend(*(id *)(a1 + 32), "note");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "regenerateTitle:snippet:", 1, 1);

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "note");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "markShareDirtyIfNeededWithReason:", CFSTR("Updated title from table change"));

      objc_msgSend(*(id *)(a1 + 32), "note");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "updateChangeCountWithReason:", CFSTR("Updated title from table change"));

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_save");

}

- (void)tableAttachmentProviderWillMergeTable:(id)a3
{
  -[ICTableAttachmentViewController tableAttachmentWillChange](self, "tableAttachmentWillChange", a3);
  -[ICTableAttachmentViewController willFlashAuthorHighlights](self, "willFlashAuthorHighlights");
}

- (void)tableAttachmentProviderDidMergeTable:(id)a3
{
  -[ICTableAttachmentViewController tableAttachmentDidChange](self, "tableAttachmentDidChange", a3);
  -[ICTableAttachmentViewController flashAuthorHighlightsIfNeeded](self, "flashAuthorHighlightsIfNeeded");
}

- (void)tableAttachmentWillChange
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  ICTableAttachmentViewController *v26;
  id obj;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICTableAttachmentViewController tableAttachmentWillChange]", 1, 0, CFSTR("Unexpected call from background thread"));
  -[ICTableAttachmentViewController table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "columnCount"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v3, "identifierForColumnAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableAttachmentViewController columnsBeforeMerge](self, "columnsBeforeMerge");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ic_addNonNilObject:", v5);

      ++v4;
    }
    while (v4 < objc_msgSend(v3, "columnCount"));
  }
  if (objc_msgSend(v3, "rowCount"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(v3, "identifierForRowAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableAttachmentViewController rowsBeforeMerge](self, "rowsBeforeMerge");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ic_addNonNilObject:", v8);

      ++v7;
    }
    while (v7 < objc_msgSend(v3, "rowCount"));
  }
  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = self;
  -[ICTableAttachmentViewController visibleEmptyCellsBeforeMerge](self, "visibleEmptyCellsBeforeMerge");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v29 = v10;
  objc_msgSend(v10, "columnIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v37;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v37 != v28)
          objc_enumerationMutation(obj);
        v31 = v12;
        v13 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v12);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        objc_msgSend(v29, "rowIDs");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v33 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
              objc_msgSend(v3, "mergeableStringForColumnID:rowID:", v13, v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v20)
              {
                objc_msgSend(v11, "objectForKeyedSubscript:", v13);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v21)
                {
                  objc_msgSend(MEMORY[0x1E0C99E20], "set");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, v13);
                }
                objc_msgSend(v21, "ic_addNonNilObject:", v19);

              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v16);
        }

        v12 = v31 + 1;
      }
      while (v31 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v30);
  }

  -[ICTableAttachmentViewController tableSelection](v26, "tableSelection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copy");
  -[ICTableAttachmentViewController setTableSelectionBeforeMerge:](v26, "setTableSelectionBeforeMerge:", v23);

  -[ICTableAttachmentViewController currentlyEditingTextStorage](v26, "currentlyEditingTextStorage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "savedSelectionWithSelectionAffinity:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController setStringSelectionBeforeMerge:](v26, "setStringSelectionBeforeMerge:", v25);

}

- (void)tableAttachmentDidChange
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t m;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t n;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t ii;
  uint64_t v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  _QWORD v110[4];
  id v111;
  ICTableAttachmentViewController *v112;
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
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICTableAttachmentViewController tableAttachmentDidChange]", 1, 0, CFSTR("Unexpected call from background thread"));
  -[ICTableAttachmentViewController table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v3, "columnCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "columnCount"))
  {
    v5 = 0;
    do
    {
      objc_msgSend(v3, "identifierForColumnAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);

      ++v5;
    }
    while (v5 < objc_msgSend(v3, "columnCount"));
  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v3, "rowCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "rowCount"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(v3, "identifierForRowAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v9);

      ++v8;
    }
    while (v8 < objc_msgSend(v3, "rowCount"));
  }
  -[ICTableAttachmentViewController columnsBeforeMerge](self, "columnsBeforeMerge");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = v7;
  if ((objc_msgSend(v4, "isEqual:", v10) & 1) != 0)
  {
    -[ICTableAttachmentViewController rowsBeforeMerge](self, "rowsBeforeMerge");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "isEqual:", v11);

    if ((v12 & 1) != 0)
      goto LABEL_73;
  }
  else
  {

  }
  v105 = v3;
  -[ICTableAttachmentViewController columnsBeforeMerge](self, "columnsBeforeMerge");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  v106 = v4;
  objc_msgSend(v14, "minusOrderedSet:", v4);
  -[ICTableAttachmentViewController rowsBeforeMerge](self, "rowsBeforeMerge");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v16, "minusOrderedSet:", v7);
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v16;
  objc_msgSend(v16, "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController columnsBeforeMerge](self, "columnsBeforeMerge");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController rowsBeforeMerge](self, "rowsBeforeMerge");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v17, "removeColumns:rows:previousColumns:previousRows:", v18, v19, v21, v23);

  if ((v24 & 1) == 0)
    -[ICTableAttachmentViewController beginEditingNoteAtOffset:](self, "beginEditingNoteAtOffset:", 1);
  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  v25 = v14;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v133, v142, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v134;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v134 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * i);
        -[ICTableAttachmentViewController cleanDeletedColumn:](self, "cleanDeletedColumn:", v30);
        -[ICTableAttachmentViewController visibleEmptyCellsBeforeMerge](self, "visibleEmptyCellsBeforeMerge");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "removeObjectForKey:", v30);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v133, v142, 16);
    }
    while (v27);
  }

  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  v32 = v108;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v129, v141, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v130;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v130 != v35)
          objc_enumerationMutation(v32);
        -[ICTableAttachmentViewController cleanDeletedRow:](self, "cleanDeletedRow:", *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * j));
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v129, v141, 16);
    }
    while (v34);
  }
  v104 = v25;

  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  -[ICTableAttachmentViewController visibleEmptyCellsBeforeMerge](self, "visibleEmptyCellsBeforeMerge");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "allKeys");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v125, v140, 16);
  v109 = v32;
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v126;
    do
    {
      for (k = 0; k != v40; ++k)
      {
        if (*(_QWORD *)v126 != v41)
          objc_enumerationMutation(v38);
        v43 = *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * k);
        -[ICTableAttachmentViewController visibleEmptyCellsBeforeMerge](self, "visibleEmptyCellsBeforeMerge");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKeyedSubscript:", v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v123 = 0u;
        v124 = 0u;
        v121 = 0u;
        v122 = 0u;
        v46 = v32;
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v121, v139, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v122;
          do
          {
            for (m = 0; m != v48; ++m)
            {
              if (*(_QWORD *)v122 != v49)
                objc_enumerationMutation(v46);
              objc_msgSend(v45, "removeObject:", *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * m));
            }
            v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v121, v139, 16);
          }
          while (v48);
        }

        v32 = v109;
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v125, v140, 16);
    }
    while (v40);
  }

  if (objc_msgSend(v104, "count"))
  {
    objc_msgSend(v104, "array");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController postChangeNotification:columnOrRowUUIDs:](self, "postChangeNotification:columnOrRowUUIDs:", 3, v51);

  }
  if (objc_msgSend(v32, "count"))
  {
    objc_msgSend(v32, "array");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController postChangeNotification:columnOrRowUUIDs:](self, "postChangeNotification:columnOrRowUUIDs:", 4, v52);

  }
  v53 = (void *)objc_msgSend(v106, "mutableCopy");
  -[ICTableAttachmentViewController columnsBeforeMerge](self, "columnsBeforeMerge");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "minusOrderedSet:", v54);

  if (objc_msgSend(v53, "count"))
  {
    objc_msgSend(v53, "array");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController postChangeNotification:columnOrRowUUIDs:](self, "postChangeNotification:columnOrRowUUIDs:", 0, v55);

  }
  v56 = (void *)objc_msgSend(v107, "mutableCopy");
  -[ICTableAttachmentViewController rowsBeforeMerge](self, "rowsBeforeMerge");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "minusOrderedSet:", v57);

  if (objc_msgSend(v56, "count"))
  {
    objc_msgSend(v56, "array");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController postChangeNotification:columnOrRowUUIDs:](self, "postChangeNotification:columnOrRowUUIDs:", 1, v58);

  }
  -[ICTableAttachmentViewController columnsBeforeMerge](self, "columnsBeforeMerge");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "ic_objectsMovedFromOrderedSet:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v60, "count"))
  {
    objc_msgSend(v60, "allObjects");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController postChangeNotification:columnOrRowUUIDs:](self, "postChangeNotification:columnOrRowUUIDs:", 5, v61);

  }
  v102 = v60;
  v103 = v56;
  -[ICTableAttachmentViewController rowsBeforeMerge](self, "rowsBeforeMerge");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "ic_objectsMovedFromOrderedSet:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v63, "count"))
  {
    objc_msgSend(v63, "allObjects");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController postChangeNotification:columnOrRowUUIDs:](self, "postChangeNotification:columnOrRowUUIDs:", 6, v64);

    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v65 = v63;
    v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v117, v138, 16);
    if (v66)
    {
      v67 = v66;
      v68 = *(_QWORD *)v118;
      do
      {
        for (n = 0; n != v67; ++n)
        {
          if (*(_QWORD *)v118 != v68)
            objc_enumerationMutation(v65);
          v70 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * n);
          -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "updateForMovedRow:", v70);

        }
        v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v117, v138, 16);
      }
      while (v67);
    }

  }
  if (objc_msgSend(v53, "count") || objc_msgSend(v104, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v104, "count") + objc_msgSend(v53, "count"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "array");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "addObjectsFromArray:", v73);

    objc_msgSend(v104, "array");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "addObjectsFromArray:", v74);

    -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "columnWidthManager");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = (id)objc_msgSend(v76, "invalidateWidthForColumns:", v72);

  }
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v78 = v53;
  v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v113, v137, 16);
  if (v79)
  {
    v80 = v79;
    v81 = *(_QWORD *)v114;
    do
    {
      for (ii = 0; ii != v80; ++ii)
      {
        if (*(_QWORD *)v114 != v81)
          objc_enumerationMutation(v78);
        v83 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * ii);
        -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "columnWidthManager");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "widthOfColumn:", v83);
        v87 = v86;

        -[ICTableAttachmentViewController columnWidthCache](self, "columnWidthCache");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "setDimension:forKey:", v83, v87);

      }
      v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v113, v137, 16);
    }
    while (v80);
  }

  -[ICTableAttachmentViewController redraw](self, "redraw");
  v4 = v106;
  v7 = v107;
  v3 = v105;
LABEL_73:
  -[ICTableAttachmentViewController columnsBeforeMerge](self, "columnsBeforeMerge");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "removeAllObjects");

  -[ICTableAttachmentViewController rowsBeforeMerge](self, "rowsBeforeMerge");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "removeAllObjects");

  -[ICTableAttachmentViewController visibleEmptyCellsBeforeMerge](self, "visibleEmptyCellsBeforeMerge");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = MEMORY[0x1E0C809B0];
  v110[1] = 3221225472;
  v110[2] = __59__ICTableAttachmentViewController_tableAttachmentDidChange__block_invoke;
  v110[3] = &unk_1EA7DFA70;
  v111 = v3;
  v112 = self;
  v92 = v3;
  objc_msgSend(v91, "enumerateKeysAndObjectsUsingBlock:", v110);

  -[ICTableAttachmentViewController visibleEmptyCellsBeforeMerge](self, "visibleEmptyCellsBeforeMerge");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "removeAllObjects");

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController tableSelectionBeforeMerge](self, "tableSelectionBeforeMerge");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v94, "isEqual:", v95);

  if (v96)
  {
    -[ICTableAttachmentViewController stringSelectionBeforeMerge](self, "stringSelectionBeforeMerge");
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    if (v97)
    {
      -[ICTableAttachmentViewController currentlyEditingTextStorage](self, "currentlyEditingTextStorage");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableAttachmentViewController stringSelectionBeforeMerge](self, "stringSelectionBeforeMerge");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "restoreSelection:", v99);
LABEL_78:

      v7 = v107;
    }
  }
  else if (objc_msgSend(v94, "type") == 1)
  {
    objc_msgSend(v94, "columns");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "objectAtIndexedSubscript:", 0);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "rows");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "objectAtIndexedSubscript:", 0);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController beginEditingCellWithColumnID:andRowID:location:](self, "beginEditingCellWithColumnID:andRowID:location:", v99, v101, -[ICTableAttachmentViewController preferredNavigationSelection](self, "preferredNavigationSelection"));

    goto LABEL_78;
  }

}

void __59__ICTableAttachmentViewController_tableAttachmentDidChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)objc_msgSend(a3, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "mergeableStringForColumnID:rowID:", v5, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(*(id *)(a1 + 40), "tableLayoutManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "columnLayoutManagerForColumn:", v5);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "ensureCellExistsAtRowID:", v11);
          objc_msgSend(*(id *)(a1 + 40), "tableValueDidChangeAtColumnID:rowID:delta:", v5, v11, objc_msgSend(v12, "length"));

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (void)postChangeNotification:(unint64_t)a3 columnOrRowUUIDs:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13[0] = CFSTR("ICTableAttachmentViewControllerKey");
  v13[1] = CFSTR("ICTableAttachmentViewControllerChangeKindKey");
  v14[0] = self;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("ICTableAttachmentViewControllerColumnOrRowUUIDsKey"));
    v10 = objc_msgSend(v9, "copy");

    v8 = (void *)v10;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController table](self, "table");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("ICTableAttachmentViewControllerDidChangeNotification"), v12, v8);

}

- (void)tableAttachmentViewControllerDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ICTableAttachmentViewController *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t m;
  uint64_t v42;
  void *v43;
  void *v44;
  ICTableAttachmentViewController *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController table](self, "table");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ICTableAttachmentViewControllerKey"));
    v8 = (ICTableAttachmentViewController *)objc_claimAutoreleasedReturnValue();
    if (v8 != self)
    {
      v45 = v8;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ICTableAttachmentViewControllerChangeKindKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "unsignedIntegerValue");

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ICTableAttachmentViewControllerColumnOrRowUUIDsKey"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      switch(v10)
      {
        case 0:
          v44 = v7;
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v59;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v59 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
                -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "columnWidthManager");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "widthOfColumn:", v17);
                v21 = v20;

                -[ICTableAttachmentViewController columnWidthCache](self, "columnWidthCache");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setDimension:forKey:", v17, v21);

              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
            }
            while (v14);
          }
          -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
          v23 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "columnWidthManager");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (id)objc_msgSend(v24, "invalidateAvailableWidth");

          v7 = v44;
          goto LABEL_31;
        case 3:
          -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "removeColumns:rows:", v12, MEMORY[0x1E0C9AA60]);

          if ((v27 & 1) == 0)
            -[ICTableAttachmentViewController beginEditingNoteAtOffset:](self, "beginEditingNoteAtOffset:", 1);
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v23 = v12;
          v28 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v55;
            do
            {
              for (j = 0; j != v29; ++j)
              {
                if (*(_QWORD *)v55 != v30)
                  objc_enumerationMutation(v23);
                -[ICTableAttachmentViewController cleanDeletedColumn:](self, "cleanDeletedColumn:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j));
              }
              v29 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
            }
            while (v29);
          }
          goto LABEL_31;
        case 4:
          -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "removeColumns:rows:", MEMORY[0x1E0C9AA60], v12);

          if ((v33 & 1) == 0)
            -[ICTableAttachmentViewController beginEditingNoteAtOffset:](self, "beginEditingNoteAtOffset:", 1);
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          v23 = v12;
          v34 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v51;
            do
            {
              for (k = 0; k != v35; ++k)
              {
                if (*(_QWORD *)v51 != v36)
                  objc_enumerationMutation(v23);
                -[ICTableAttachmentViewController cleanDeletedRow:](self, "cleanDeletedRow:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k));
              }
              v35 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
            }
            while (v35);
          }
LABEL_31:

          break;
        case 6:
          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          v38 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
          if (v38)
          {
            v39 = v38;
            v40 = *(_QWORD *)v47;
            do
            {
              for (m = 0; m != v39; ++m)
              {
                if (*(_QWORD *)v47 != v40)
                  objc_enumerationMutation(v12);
                v42 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * m);
                -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "updateForMovedRow:", v42);

              }
              v39 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
            }
            while (v39);
          }
          break;
        default:
          break;
      }
      -[ICTableAttachmentViewController redraw](self, "redraw");

      v8 = v45;
    }

  }
}

- (void)willFlashAuthorHighlights
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  -[ICTableAttachmentViewController cellTimestampsBeforeMerge](self, "cellTimestampsBeforeMerge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E08];
    -[ICTableAttachmentViewController table](self, "table");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "columnCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICTableAttachmentViewController table](self, "table");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__ICTableAttachmentViewController_willFlashAuthorHighlights__block_invoke;
    v10[3] = &unk_1EA7DFA98;
    v10[4] = self;
    v11 = v6;
    v9 = v6;
    objc_msgSend(v7, "enumerateCellObjectsInCellSelectionContainingColumnIndices:rowIndices:copyItems:usingBlock:", 0, 0, 0, v10);

    v8 = (void *)objc_msgSend(v9, "copy");
    -[ICTableAttachmentViewController setCellTimestampsBeforeMerge:](self, "setCellTimestampsBeforeMerge:", v8);

  }
}

uint64_t __60__ICTableAttachmentViewController_willFlashAuthorHighlights__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "table");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifierForColumnAtIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "table");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifierForRowAtIndex:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v13, v10);
  }
  else
  {
    v14 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 32), "table");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "rowCount"));
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v16, v10);

  }
  objc_msgSend(v8, "timestamp");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v12);

  return 0;
}

- (void)flashAuthorHighlightsIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];
  _QWORD v12[3];
  uint64_t v13;

  -[ICTableAttachmentViewController cellTimestampsBeforeMerge](self, "cellTimestampsBeforeMerge");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[ICAttachmentViewController attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isSharedViaICloud");

    if (v7)
    {
      v12[0] = 0;
      v12[1] = v12;
      v12[2] = 0x2020000000;
      v13 = 0;
      -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "anchorColumn");

      v13 = v9;
      -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __64__ICTableAttachmentViewController_flashAuthorHighlightsIfNeeded__block_invoke;
      v11[3] = &unk_1EA7DFB38;
      v11[4] = self;
      v11[5] = v12;
      objc_msgSend(v10, "enumerateTextViewsWithBlock:", v11);

      -[ICTableAttachmentViewController setCellTimestampsBeforeMerge:](self, "setCellTimestampsBeforeMerge:", 0);
      _Block_object_dispose(v12, 8);
    }
  }
}

void __64__ICTableAttachmentViewController_flashAuthorHighlightsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  id v31;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __64__ICTableAttachmentViewController_flashAuthorHighlightsIfNeeded__block_invoke_2;
  v29[3] = &unk_1EA7DFAE8;
  v29[4] = *(_QWORD *)(a1 + 32);
  v23 = v3;
  v30 = v23;
  v8 = v4;
  v31 = v8;
  objc_msgSend(v5, "enumerateCellObjectsInCellSelectionContainingColumnIndices:rowIndices:copyItems:usingBlock:", v6, 0, 0, v29);

  if (objc_msgSend(v8, "count"))
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "note");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "styler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "authorHighlightsController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "TTTextStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "ic_range");
    v18 = v17;
    objc_msgSend(v23, "TTTextStorage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v7;
    v24[1] = 3221225472;
    v24[2] = __64__ICTableAttachmentViewController_flashAuthorHighlightsIfNeeded__block_invoke_4;
    v24[3] = &unk_1EA7DFB10;
    v25 = v8;
    v26 = v13;
    v20 = v23;
    v21 = *(_QWORD *)(a1 + 32);
    v27 = v20;
    v28 = v21;
    v22 = v13;
    objc_msgSend(v14, "performHighlightUpdatesForRange:inTextStorage:updates:", v16, v18, v19, v24);

  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

uint64_t __64__ICTableAttachmentViewController_flashAuthorHighlightsIfNeeded__block_invoke_2(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v7 = a1[4];
  v8 = a2;
  objc_msgSend(v7, "table");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifierForColumnAtIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "table");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifierForRowAtIndex:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "cellTimestampsBeforeMerge");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__ICTableAttachmentViewController_flashAuthorHighlightsIfNeeded__block_invoke_3;
  v18[3] = &unk_1EA7DFAC0;
  v19 = a1[5];
  v20 = v12;
  v21 = a1[6];
  v16 = v12;
  objc_msgSend(v8, "enumerateHighlightableRangesModifiedAfter:includingAttributes:usingBlock:", v15, 0, v18);

  return 0;
}

void __64__ICTableAttachmentViewController_flashAuthorHighlightsIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "columnTextStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "characterRangeForRowID:", *(_QWORD *)(a1 + 40));

  v8 = v7 + a2;
  v9 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v8, a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

}

void __64__ICTableAttachmentViewController_flashAuthorHighlightsIfNeeded__block_invoke_4(id *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = a1[4];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        objc_msgSend(a1[5], "authorHighlightsController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "rangeValue");
        v14 = v13;
        objc_msgSend(a1[6], "TTTextStorage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "extendHighlightsForRange:inTextStorage:", v12, v14, v15);

        objc_msgSend(a1[7], "note");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isSharedViaICloud"))
        {
          objc_msgSend(a1[7], "note");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isFastSyncSessionActive");

          if ((v18 & 1) != 0)
            goto LABEL_10;
          objc_msgSend(a1[5], "authorHighlightsController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[6], "TTTextStorage");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "flashHighlightsForRange:withDuration:inTextStorage:", a2, a3, 0, v19);

        }
LABEL_10:
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

}

- (double)availableWidth
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v12;

  -[ICAttachmentViewController textAttachment](self, "textAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((textAttachment) != nil)", "-[ICTableAttachmentViewController availableWidth]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "textAttachment");
  if (-[ICAttachmentViewController forManualRendering](self, "forManualRendering"))
  {
    objc_msgSend(v3, "lastAvailableWidth");
    v5 = v4;
  }
  else
  {
    -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_7;
    -[ICTableAttachmentViewController noteLayoutManager](self, "noteLayoutManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textContainers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
LABEL_7:
      objc_msgSend(v3, "availableWidthForTextContainer:", v7);
      v5 = v10;

    }
    else
    {
      objc_msgSend(v3, "lastAvailableWidth");
      if (v12 == 0.0)
        v5 = 42.0;
      else
        v5 = v12;
    }

  }
  return v5;
}

- (void)updateWidthsForChangeInColumn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "columnWidthManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "invalidateWidthForColumns:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
    -[ICTableAttachmentViewController redraw](self, "redraw");

}

- (void)updateColumnWidthForColumn:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ICTableAttachmentViewController columnsNeedingWidthUpdate](self, "columnsNeedingWidthUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[ICTableAttachmentViewController updateEditedColumnWidths](self, "updateEditedColumnWidths");
}

- (BOOL)updateAllColumnWidths
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  _QWORD v9[6];

  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "columnIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 <= *MEMORY[0x1E0D64A40])
    v6 = *MEMORY[0x1E0D64A40];
  else
    v6 = v5;
  -[ICTableAttachmentViewController table](self, "table");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__ICTableAttachmentViewController_updateAllColumnWidths__block_invoke;
  v9[3] = &unk_1EA7DFB60;
  v9[4] = self;
  v9[5] = v6;
  objc_msgSend(v7, "enumerateColumnsWithBlock:", v9);

  return -[ICTableAttachmentViewController updateEditedColumnWidths](self, "updateEditedColumnWidths");
}

void __56__ICTableAttachmentViewController_updateAllColumnWidths__block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "columnsNeedingWidthUpdate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

  if (*(_QWORD *)(a1 + 40) <= a3)
    *a4 = 1;
}

- (void)updateAllColumnWidthsAndRedraw
{
  if (!-[ICTableAttachmentViewController updateAllColumnWidths](self, "updateAllColumnWidths"))
    -[ICTableAttachmentViewController redraw](self, "redraw");
}

- (BOOL)updateEditedColumnWidths
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICTableAttachmentViewController updateEditedColumnWidths]", 1, 0, CFSTR("Unexpected call from background thread"));
  -[ICTableAttachmentViewController currentlyEditingTextStorage](self, "currentlyEditingTextStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditingOrConvertingMarkedText:", 0);

  if (v4)
  {
    -[ICTableAttachmentViewController updateEditedColumnWidthsAfterDelay](self, "updateEditedColumnWidthsAfterDelay");
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_updateEditedColumnWidths, 0);
  -[ICTableAttachmentViewController columnsNeedingWidthUpdate](self, "columnsNeedingWidthUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    return 0;
  -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "columnWidthManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController columnsNeedingWidthUpdate](self, "columnsNeedingWidthUpdate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidateWidthForColumns:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v11, "count"))
  {
    -[ICTableAttachmentViewController columnsNeedingWidthUpdate](self, "columnsNeedingWidthUpdate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeAllObjects");

    return 0;
  }
  -[ICTableAttachmentViewController redraw](self, "redraw");
  -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController scrollToCaretIfNeededForTextView:](self, "scrollToCaretIfNeededForTextView:", v13);

  }
  -[ICTableAttachmentViewController columnsNeedingWidthUpdate](self, "columnsNeedingWidthUpdate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAllObjects");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postNotificationName:object:", CFSTR("ICTextViewLayoutDidChangeNotification"), v16);

  return 1;
}

- (void)updateEditedColumnWidthsAfterDelay
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_updateEditedColumnWidths, 0);
  -[ICTableAttachmentViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_updateEditedColumnWidths, 0, *MEMORY[0x1E0D64A88]);
}

- (void)updateAvailableWidth
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  -[ICTableAttachmentViewController availableWidth](self, "availableWidth");
  v4 = v3;
  -[ICTableAttachmentViewController previousAvailableWidth](self, "previousAvailableWidth");
  if (v4 != v5)
  {
    -[ICTableAttachmentViewController setPreviousAvailableWidth:](self, "setPreviousAvailableWidth:", v4);
    -[ICTableAttachmentViewController tableLayoutManager](self, "tableLayoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "columnWidthManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "invalidateAvailableWidth");

    -[ICTableAttachmentViewController redraw](self, "redraw");
  }
}

- (void)saveOnMainThread
{
  -[ICTableAttachmentViewController saveAttachmentChangesInBackground:](self, "saveAttachmentChangesInBackground:", 0);
}

- (void)save
{
  void *v3;
  char v4;
  void *v5;
  int v6;

  -[ICAttachmentViewController attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isReadOnly");

  if ((v4 & 1) == 0)
  {
    -[ICTableAttachmentViewController currentlyEditingTextStorage](self, "currentlyEditingTextStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEditingOrConvertingMarkedText:", 0);

    if (v6)
      -[ICTableAttachmentViewController saveAfterDelay](self, "saveAfterDelay");
    else
      -[ICTableAttachmentViewController saveAttachmentChangesInBackground:](self, "saveAttachmentChangesInBackground:", 1);
  }
}

- (void)saveAfterDelay
{
  void *v3;
  void *v4;
  int v5;
  double *v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_save, 0);
  -[ICAttachmentViewController attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFastSyncSessionActive");
  v6 = (double *)MEMORY[0x1E0D64E50];
  if (!v5)
    v6 = (double *)MEMORY[0x1E0D64E48];
  v7 = *v6;

  -[ICTableAttachmentViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_save, 0, v7);
}

- (void)initializeTableAccessibilityControllerIfNecessary
{
  void *v3;
  ICTableAccessibilityController *v4;

  -[ICTableAttachmentViewController tableAXController](self, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[ICTableAccessibilityController initWithTableAttachmentViewController:]([ICTableAccessibilityController alloc], "initWithTableAttachmentViewController:", self);
    -[ICTableAttachmentViewController setTableAXController:](self, "setTableAXController:", v4);

  }
}

- (void)announceCellRangeSelectionChangeForAccessibilityIfNecessary
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController previousAXTableSelection](self, "previousAXTableSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[ICTableAttachmentViewController tableAXController](self, "tableAXController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "speakCellRangeSelection:", v7);

    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "copy");
    -[ICTableAttachmentViewController setPreviousAXTableSelection:](self, "setPreviousAXTableSelection:", v8);

  }
}

- (void)initializeTableLayout
{
  ICTableLayoutManager *v3;
  ICTableLayoutManager *tableLayoutManager;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t j;
  void *v13;
  void *v14;
  double v15;
  double v16;
  ICDimensionSumCache *v17;
  ICDimensionSumCache *columnWidthCache;
  ICDimensionSumCache *v19;
  ICDimensionSumCache *rowHeightCache;
  NSMutableDictionary *v21;
  NSMutableDictionary *cellHeightCache;
  NSMutableDictionary *v23;
  NSMutableDictionary *visibleEmptyCellsBeforeMerge;
  void *v25;
  void *v26;
  NSMutableOrderedSet *v27;
  NSMutableOrderedSet *columnsBeforeMerge;
  void *v29;
  void *v30;
  NSMutableOrderedSet *v31;
  NSMutableOrderedSet *rowsBeforeMerge;
  id v33;

  -[ICTableAttachmentViewController table](self, "table");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[ICTableLayoutManager initWithTable:delegate:]([ICTableLayoutManager alloc], "initWithTable:delegate:", v33, self);
  tableLayoutManager = self->_tableLayoutManager;
  self->_tableLayoutManager = v3;

  objc_msgSend(v33, "cellChangeNotifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", self);

  v6 = objc_msgSend(v33, "columnCount");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(v33, "identifierForColumnAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v9);

    }
  }
  v10 = objc_msgSend(v33, "rowCount");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    for (j = 0; j != v10; ++j)
    {
      objc_msgSend(v33, "identifierForRowAtIndex:", j);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v13);

    }
  }
  -[ICTableLayoutManager columnWidthManager](self->_tableLayoutManager, "columnWidthManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "singleColumnTableWidth");
  v16 = v15;

  v17 = (ICDimensionSumCache *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63AE8]), "initWithKeys:andEstimateDimension:", v7, v16);
  columnWidthCache = self->_columnWidthCache;
  self->_columnWidthCache = v17;

  v19 = (ICDimensionSumCache *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63AE8]), "initWithKeys:andEstimateDimension:", v11, 44.0);
  rowHeightCache = self->_rowHeightCache;
  self->_rowHeightCache = v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v33, "rowCount"));
  v21 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  cellHeightCache = self->_cellHeightCache;
  self->_cellHeightCache = v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v23 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  visibleEmptyCellsBeforeMerge = self->_visibleEmptyCellsBeforeMerge;
  self->_visibleEmptyCellsBeforeMerge = v23;

  v25 = (void *)MEMORY[0x1E0C99E10];
  -[ICTableAttachmentViewController table](self, "table");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "orderedSetWithCapacity:", objc_msgSend(v26, "columnCount"));
  v27 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
  columnsBeforeMerge = self->_columnsBeforeMerge;
  self->_columnsBeforeMerge = v27;

  v29 = (void *)MEMORY[0x1E0C99E10];
  -[ICTableAttachmentViewController table](self, "table");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "orderedSetWithCapacity:", objc_msgSend(v30, "rowCount"));
  v31 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
  rowsBeforeMerge = self->_rowsBeforeMerge;
  self->_rowsBeforeMerge = v31;

}

- (ICTableUndoTarget)undoTarget
{
  return self->_undoTarget;
}

- (NSMapTable)coalescingUndoGroupForStringDelegate
{
  return self->_coalescingUndoGroupForStringDelegate;
}

- (BOOL)preventScrolling
{
  return self->preventScrolling;
}

- (void)setPreventScrolling:(BOOL)a3
{
  self->preventScrolling = a3;
}

- (BOOL)lockSelection
{
  return self->_lockSelection;
}

- (void)setLockSelection:(BOOL)a3
{
  self->_lockSelection = a3;
}

- (ICTableAttachmentSelection)tableSelection
{
  return self->_tableSelection;
}

- (void)setTableSelection:(id)a3
{
  objc_storeStrong((id *)&self->_tableSelection, a3);
}

- (BOOL)isShowingTextStyleOptions
{
  return self->_showingTextStyleOptions;
}

- (ICTableTextViewManager)textViewManager
{
  return self->_textViewManager;
}

- (ICTableScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (ICTableColumnTextView)activeTextView
{
  return self->_activeTextView;
}

- (BOOL)shouldBeginInitialEditing
{
  return self->_shouldBeginInitialEditing;
}

- (void)setShouldBeginInitialEditing:(BOOL)a3
{
  self->_shouldBeginInitialEditing = a3;
}

- (ICTTTextStorage)currentlyEditingTextStorage
{
  return self->_currentlyEditingTextStorage;
}

- (void)setCurrentlyEditingTextStorage:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyEditingTextStorage, a3);
}

- (ICTableColumnTextView)currentlyEditingTextView
{
  return self->_currentlyEditingTextView;
}

- (void)setCurrentlyEditingTextView:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyEditingTextView, a3);
}

- (UIView)inputView
{
  return self->_inputView;
}

- (void)setInputView:(id)a3
{
  objc_storeStrong((id *)&self->_inputView, a3);
}

- (UIView)inputAccessoryView
{
  return self->_inputAccessoryView;
}

- (void)setInputAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_inputAccessoryView, a3);
}

- (ICTableAttachmentProvider)tableAttachmentProvider
{
  return self->_tableAttachmentProvider;
}

- (NSMutableDictionary)visibleEmptyCellsBeforeMerge
{
  return self->_visibleEmptyCellsBeforeMerge;
}

- (NSMutableOrderedSet)columnsBeforeMerge
{
  return self->_columnsBeforeMerge;
}

- (NSMutableOrderedSet)rowsBeforeMerge
{
  return self->_rowsBeforeMerge;
}

- (ICTableAttachmentSelection)tableSelectionBeforeMerge
{
  return self->_tableSelectionBeforeMerge;
}

- (void)setTableSelectionBeforeMerge:(id)a3
{
  objc_storeStrong((id *)&self->_tableSelectionBeforeMerge, a3);
}

- (NSArray)stringSelectionBeforeMerge
{
  return self->_stringSelectionBeforeMerge;
}

- (void)setStringSelectionBeforeMerge:(id)a3
{
  objc_storeStrong((id *)&self->_stringSelectionBeforeMerge, a3);
}

- (CGPoint)initialDragOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialDragOffset.x;
  y = self->_initialDragOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialDragOffset:(CGPoint)a3
{
  self->_initialDragOffset = a3;
}

- (unint64_t)currentDragIndex
{
  return self->_currentDragIndex;
}

- (void)setCurrentDragIndex:(unint64_t)a3
{
  self->_currentDragIndex = a3;
}

- (NSArray)stringSelectionBeforeDrag
{
  return self->_stringSelectionBeforeDrag;
}

- (void)setStringSelectionBeforeDrag:(id)a3
{
  objc_storeStrong((id *)&self->_stringSelectionBeforeDrag, a3);
}

- (NSMutableArray)undoCommands
{
  return self->_undoCommands;
}

- (void)setUndoCommands:(id)a3
{
  objc_storeStrong((id *)&self->_undoCommands, a3);
}

- (unint64_t)editingCount
{
  return self->_editingCount;
}

- (void)setEditingCount:(unint64_t)a3
{
  self->_editingCount = a3;
}

- (CGPoint)currentDragGestureLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentDragGestureLocation.x;
  y = self->_currentDragGestureLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCurrentDragGestureLocation:(CGPoint)a3
{
  self->_currentDragGestureLocation = a3;
}

- (NSMutableSet)columnsNeedingWidthUpdate
{
  return self->_columnsNeedingWidthUpdate;
}

- (BOOL)isUpdatingTiles
{
  return self->_updatingTiles;
}

- (void)setUpdatingTiles:(BOOL)a3
{
  self->_updatingTiles = a3;
}

- (BOOL)didRecentlyAutoAddRow
{
  return self->_didRecentlyAutoAddRow;
}

- (void)setDidRecentlyAutoAddRow:(BOOL)a3
{
  self->_didRecentlyAutoAddRow = a3;
}

- (unint64_t)lastDraggedOverColumnOrRowIndex
{
  return self->_lastDraggedOverColumnOrRowIndex;
}

- (void)setLastDraggedOverColumnOrRowIndex:(unint64_t)a3
{
  self->_lastDraggedOverColumnOrRowIndex = a3;
}

- (ICTableAttachmentSelection)previousAXTableSelection
{
  return self->_previousAXTableSelection;
}

- (void)setPreviousAXTableSelection:(id)a3
{
  objc_storeStrong((id *)&self->_previousAXTableSelection, a3);
}

- (BOOL)isPerformingInitialLayout
{
  return self->_isPerformingInitialLayout;
}

- (void)setIsPerformingInitialLayout:(BOOL)a3
{
  self->_isPerformingInitialLayout = a3;
}

- (ICLayoutManager)noteLayoutManager
{
  return (ICLayoutManager *)objc_loadWeakRetained((id *)&self->_noteLayoutManager);
}

- (void)setNoteLayoutManager:(id)a3
{
  objc_storeWeak((id *)&self->_noteLayoutManager, a3);
}

- (ICTK2TextLayoutManager)noteTextLayoutManager
{
  return (ICTK2TextLayoutManager *)objc_loadWeakRetained((id *)&self->_noteTextLayoutManager);
}

- (void)setNoteTextLayoutManager:(id)a3
{
  objc_storeWeak((id *)&self->_noteTextLayoutManager, a3);
}

- (double)previousAvailableWidth
{
  return self->_previousAvailableWidth;
}

- (void)setPreviousAvailableWidth:(double)a3
{
  self->_previousAvailableWidth = a3;
}

- (BOOL)shouldPreventUndoCommands
{
  return self->_shouldPreventUndoCommands;
}

- (void)setShouldPreventUndoCommands:(BOOL)a3
{
  self->_shouldPreventUndoCommands = a3;
}

- (NSDictionary)cellTimestampsBeforeMerge
{
  return self->_cellTimestampsBeforeMerge;
}

- (void)setCellTimestampsBeforeMerge:(id)a3
{
  objc_storeStrong((id *)&self->_cellTimestampsBeforeMerge, a3);
}

- (ICAppearanceInfo)draggingAppearance
{
  return self->_draggingAppearance;
}

- (void)setDraggingAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_draggingAppearance, a3);
}

- (_UIDragSnappingFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (CGRect)editingViewport
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_editingViewport.origin.x;
  y = self->_editingViewport.origin.y;
  width = self->_editingViewport.size.width;
  height = self->_editingViewport.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)transitionViewport
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_transitionViewport.origin.x;
  y = self->_transitionViewport.origin.y;
  width = self->_transitionViewport.size.width;
  height = self->_transitionViewport.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTransitionViewport:(CGRect)a3
{
  self->_transitionViewport = a3;
}

- (ICTableContentView)tableContentView
{
  return self->_tableContentView;
}

- (UIScrollView)noteScrollView
{
  return self->_noteScrollView;
}

- (ICTableLayoutManager)tableLayoutManager
{
  return self->_tableLayoutManager;
}

- (ICDimensionSumCache)columnWidthCache
{
  return self->_columnWidthCache;
}

- (void)setColumnWidthCache:(id)a3
{
  objc_storeStrong((id *)&self->_columnWidthCache, a3);
}

- (ICDimensionSumCache)rowHeightCache
{
  return self->_rowHeightCache;
}

- (void)setRowHeightCache:(id)a3
{
  objc_storeStrong((id *)&self->_rowHeightCache, a3);
}

- (NSMutableDictionary)cellHeightCache
{
  return self->_cellHeightCache;
}

- (ICTableClipView)headerClipView
{
  return self->_headerClipView;
}

- (ICTableColumnRowButton)columnButton
{
  return self->_columnButton;
}

- (void)setColumnButton:(id)a3
{
  objc_storeStrong((id *)&self->_columnButton, a3);
}

- (ICTableColumnRowButton)rowButton
{
  return self->_rowButton;
}

- (void)setRowButton:(id)a3
{
  objc_storeStrong((id *)&self->_rowButton, a3);
}

- (ICTableSelectionView)selectionHighlightView
{
  return self->_selectionHighlightView;
}

- (ICTableSelectionKnob)startKnob
{
  return self->_startKnob;
}

- (ICTableSelectionKnob)endKnob
{
  return self->_endKnob;
}

- (NSUUID)rangeSelectionAnchorColumn
{
  return self->_rangeSelectionAnchorColumn;
}

- (void)setRangeSelectionAnchorColumn:(id)a3
{
  objc_storeStrong((id *)&self->_rangeSelectionAnchorColumn, a3);
}

- (NSUUID)rangeSelectionAnchorRow
{
  return self->_rangeSelectionAnchorRow;
}

- (void)setRangeSelectionAnchorRow:(id)a3
{
  objc_storeStrong((id *)&self->_rangeSelectionAnchorRow, a3);
}

- (UIView)dragView
{
  return self->_dragView;
}

- (void)setDragView:(id)a3
{
  objc_storeStrong((id *)&self->_dragView, a3);
}

- (BOOL)performedInitialLayout
{
  return self->_performedInitialLayout;
}

- (void)setPerformedInitialLayout:(BOOL)a3
{
  self->_performedInitialLayout = a3;
}

- (BOOL)makingCellFirstResponder
{
  return self->_makingCellFirstResponder;
}

- (void)setMakingCellFirstResponder:(BOOL)a3
{
  self->_makingCellFirstResponder = a3;
}

- (CGRect)proposedLineFragmentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_proposedLineFragmentRect.origin.x;
  y = self->_proposedLineFragmentRect.origin.y;
  width = self->_proposedLineFragmentRect.size.width;
  height = self->_proposedLineFragmentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setProposedLineFragmentRect:(CGRect)a3
{
  self->_proposedLineFragmentRect = a3;
}

- (ICTableAccessibilityController)tableAXController
{
  return self->_tableAXController;
}

- (void)setTableAXController:(id)a3
{
  objc_storeStrong((id *)&self->_tableAXController, a3);
}

- (ICTableAutoScroller)tableAutoScroller
{
  return self->_tableAutoScroller;
}

- (void)setTableAutoScroller:(id)a3
{
  objc_storeStrong((id *)&self->_tableAutoScroller, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableAutoScroller, 0);
  objc_storeStrong((id *)&self->_tableAXController, 0);
  objc_storeStrong((id *)&self->_dragView, 0);
  objc_storeStrong((id *)&self->_rangeSelectionAnchorRow, 0);
  objc_storeStrong((id *)&self->_rangeSelectionAnchorColumn, 0);
  objc_storeStrong((id *)&self->_endKnob, 0);
  objc_storeStrong((id *)&self->_startKnob, 0);
  objc_storeStrong((id *)&self->_selectionHighlightView, 0);
  objc_storeStrong((id *)&self->_rowButton, 0);
  objc_storeStrong((id *)&self->_columnButton, 0);
  objc_storeStrong((id *)&self->_headerClipView, 0);
  objc_storeStrong((id *)&self->_cellHeightCache, 0);
  objc_storeStrong((id *)&self->_rowHeightCache, 0);
  objc_storeStrong((id *)&self->_columnWidthCache, 0);
  objc_storeStrong((id *)&self->_tableLayoutManager, 0);
  objc_storeStrong((id *)&self->_noteScrollView, 0);
  objc_storeStrong((id *)&self->_tableContentView, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_draggingAppearance, 0);
  objc_storeStrong((id *)&self->_cellTimestampsBeforeMerge, 0);
  objc_destroyWeak((id *)&self->_noteTextLayoutManager);
  objc_destroyWeak((id *)&self->_noteLayoutManager);
  objc_storeStrong((id *)&self->_previousAXTableSelection, 0);
  objc_storeStrong((id *)&self->_columnsNeedingWidthUpdate, 0);
  objc_storeStrong((id *)&self->_undoCommands, 0);
  objc_storeStrong((id *)&self->_stringSelectionBeforeDrag, 0);
  objc_storeStrong((id *)&self->_stringSelectionBeforeMerge, 0);
  objc_storeStrong((id *)&self->_tableSelectionBeforeMerge, 0);
  objc_storeStrong((id *)&self->_rowsBeforeMerge, 0);
  objc_storeStrong((id *)&self->_columnsBeforeMerge, 0);
  objc_storeStrong((id *)&self->_visibleEmptyCellsBeforeMerge, 0);
  objc_storeStrong((id *)&self->_tableAttachmentProvider, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
  objc_storeStrong((id *)&self->_currentlyEditingTextView, 0);
  objc_storeStrong((id *)&self->_currentlyEditingTextStorage, 0);
  objc_storeStrong((id *)&self->_activeTextView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_textViewManager, 0);
  objc_storeStrong((id *)&self->_tableSelection, 0);
  objc_storeStrong((id *)&self->_coalescingUndoGroupForStringDelegate, 0);
  objc_storeStrong((id *)&self->_undoTarget, 0);
}

- (_NSRange)characterRangeForRange:(_NSRange)a3 inString:(id)a4 forLayoutManager:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  _QWORD v19[2];
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "attribute:atIndex:effectiveRange:", CFSTR("SearchTableRow"), location, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController table](self, "table");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifierForRowAtIndex:", objc_msgSend(v11, "unsignedIntegerValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((ICInternalSettingsIsAsyncFindEnabled() & 1) == 0)
  {
    v19[0] = 0;
    v19[1] = 0;
    v14 = (id)objc_msgSend(v9, "attribute:atIndex:effectiveRange:", CFSTR("SearchTableColumn"), location, v19);
    location -= v19[0];
  }
  objc_msgSend(v10, "columnTextStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "characterRangeForRowID:", v13);

  v17 = v16 + location;
  v18 = length;
  result.length = v18;
  result.location = v17;
  return result;
}

- (_NSRange)columnGlyphRangeForRange:(_NSRange)a3 inString:(id)a4 forLayoutManager:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v9 = a5;
  v10 = -[ICTableAttachmentViewController characterRangeForRange:inString:forLayoutManager:](self, "characterRangeForRange:inString:forLayoutManager:", location, length, a4, v9);
  v12 = objc_msgSend(v9, "glyphRangeForCharacterRange:actualCharacterRange:", v10, v11, 0);
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.length = v16;
  result.location = v15;
  return result;
}

- (id)viewForRange:(_NSRange)a3 inFindableString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  if (location + length <= objc_msgSend(v7, "length"))
  {
    objc_msgSend(v7, "attribute:atIndex:effectiveRange:", CFSTR("SearchTableColumn"), location, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9
      && (v11 = objc_msgSend(v9, "unsignedIntegerValue"),
          -[ICTableAttachmentViewController table](self, "table"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "columnCount"),
          v12,
          v11 < v13))
    {
      -[ICTableAttachmentViewController table](self, "table");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifierForColumnAtIndex:", objc_msgSend(v10, "unsignedIntegerValue"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "textViewForColumn:createIfNeeded:", v15, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "attribute:atIndex:effectiveRange:", CFSTR("SearchTableRow"), location, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v19 = objc_msgSend(v17, "unsignedIntegerValue");
        -[ICTableAttachmentViewController table](self, "table");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "rowCount");

        if (v19 < v21)
        {
          -[ICTableAttachmentViewController table](self, "table");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "identifierForRowAtIndex:", objc_msgSend(v18, "unsignedIntegerValue"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "ensureCellPositionForColumn:andRow:", v15, v23);

        }
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICTableAttachmentViewController(Findable) viewForRange:inFindableString:]", 1, 0, CFSTR("No findable view found, since string lacks column attribute"));
      -[ICTableAttachmentViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)rectsForRange:(_NSRange)a3 inFindableString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  objc_opt_class();
  -[ICTableAttachmentViewController viewForRange:inFindableString:](self, "viewForRange:inFindableString:", location, length, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v9, "layoutManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[ICTableAttachmentViewController columnGlyphRangeForRange:inString:forLayoutManager:](self, "columnGlyphRangeForRange:inString:forLayoutManager:", location, length, v7, v11);
  v14 = v13;

  objc_msgSend(v11, "rectsForGlyphRange:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)scrollToRange:(_NSRange)a3 inFindableString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  double y;
  double x;
  double height;
  double width;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  length = a3.length;
  location = a3.location;
  v37 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_opt_class();
  -[ICTableAttachmentViewController viewForRange:inFindableString:](self, "viewForRange:inFindableString:", location, length, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    -[ICTableAttachmentViewController rectsForRange:inFindableString:](self, "rectsForRange:inFindableString:", location, length, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v33;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v18), "CGRectValue");
          v40.origin.x = v19;
          v40.origin.y = v20;
          v40.size.width = v21;
          v40.size.height = v22;
          v38.origin.x = x;
          v38.origin.y = y;
          v38.size.width = width;
          v38.size.height = height;
          v39 = CGRectUnion(v38, v40);
          x = v39.origin.x;
          y = v39.origin.y;
          width = v39.size.width;
          height = v39.size.height;
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v16);
    }
    -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "convertRect:fromView:", v9, x, y, width, height);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;

    -[ICTableAttachmentViewController scrollToRect:animated:completion:](self, "scrollToRect:animated:completion:", 0, 0, v25, v27, v29, v31);
  }

}

- (void)drawCharactersInRange:(_NSRange)a3 inFindableString:(id)a4 forContentView:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  id v19;

  length = a3.length;
  location = a3.location;
  v19 = a4;
  v9 = a5;
  objc_opt_class();
  ICDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v10, "layoutManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = -[ICTableAttachmentViewController columnGlyphRangeForRange:inString:forLayoutManager:](self, "columnGlyphRangeForRange:inString:forLayoutManager:", location, length, v19, v12);
    v15 = v14;
    objc_msgSend(v10, "textContainerInset");
    v17 = v16;
    objc_msgSend(v10, "textContainerInset");
    objc_msgSend(v12, "drawGlyphsForGlyphRange:atPoint:", v13, v15, v17, v18);
  }

}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4 inFindableString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  length = a3.length;
  location = a3.location;
  v9 = a5;
  v10 = a4;
  objc_opt_class();
  -[ICTableAttachmentViewController viewForRange:inFindableString:](self, "viewForRange:inFindableString:", location, length, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v18, "layoutManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[ICTableAttachmentViewController characterRangeForRange:inString:forLayoutManager:](self, "characterRangeForRange:inString:forLayoutManager:", location, length, v9, v13);
  v16 = v15;

  objc_msgSend(v18, "textStorage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "replaceCharactersInRange:withString:", v14, v16, v10);

  -[ICTableAttachmentViewController saveOnMainThread](self, "saveOnMainThread");
}

- (void)setSelectedRange:(_NSRange)a3 inFindableString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  objc_opt_class();
  -[ICTableAttachmentViewController viewForRange:inFindableString:](self, "viewForRange:inFindableString:", location, length, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v14, "layoutManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ICTableAttachmentViewController characterRangeForRange:inString:forLayoutManager:](self, "characterRangeForRange:inString:forLayoutManager:", location, length, v7, v10);
  v13 = v12;

  objc_msgSend(v14, "setSelectedRange:", v11, v13);
}

- (_NSRange)selectedRangeWithinRange:(_NSRange)a3 inFindableString:(id)a4
{
  NSUInteger location;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  NSUInteger length;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v48 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "columnIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v44;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v44 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v11);
        -[ICTableAttachmentViewController textViewManager](self, "textViewManager", length);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "textViewForColumn:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "selectedRange");
        if (v15)
        {
          v9 = v12;
          v38 = 0;
          v39 = 0;
          objc_msgSend(v14, "columnTextStorage");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "rowAtIndex:rowRange:", objc_msgSend(v14, "selectedRange"), &v38);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = objc_msgSend(v14, "selectedRange");
          v21 = v38;
          objc_msgSend(v14, "selectedRange");
          v17 = v22;

          v18 = v20 - v21;
          goto LABEL_11;
        }

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v9)
        continue;
      break;
    }
  }
  v16 = 0;
  v17 = 0;
  v18 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  v38 = 0;
  v39 = &v38;
  v40 = 0x3010000000;
  v41 = &unk_1DDA28851;
  v42 = xmmword_1DD9E6F90;
  if (v17)
  {
    -[ICTableAttachmentViewController table](self, "table");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __87__ICTableAttachmentViewController_Findable__selectedRangeWithinRange_inFindableString___block_invoke;
    v30[3] = &unk_1EA7E1118;
    v31 = v6;
    v24 = v23;
    v32 = v24;
    v33 = v9;
    v34 = v16;
    v35 = &v38;
    v36 = v18;
    v37 = v17;
    objc_msgSend(v31, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v30);

    v25 = v39[4];
    v26 = v39[5];
  }
  else
  {
    v26 = 0;
    v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  _Block_object_dispose(&v38, 8);

  v27 = v25;
  v28 = v26;
  result.length = v28;
  result.location = v27;
  return result;
}

void __87__ICTableAttachmentViewController_Findable__selectedRangeWithinRange_inFindableString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", CFSTR("SearchTableColumn"), a3, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", CFSTR("SearchTableRow"), a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifierForColumnAtIndex:", objc_msgSend(v13, "unsignedIntegerValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifierForRowAtIndex:", objc_msgSend(v8, "unsignedIntegerValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 48))
    && objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 56)))
  {
    v11 = *(_QWORD *)(a1 + 80);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    *(_QWORD *)(v12 + 32) = *(_QWORD *)(a1 + 72) + a3;
    *(_QWORD *)(v12 + 40) = v11;
    *a5 = 1;
  }

}

- (void)tappedTableAtLocation:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DD7B0000, a2, OS_LOG_TYPE_ERROR, "tappedTableAtLocation: Unable to find cell for tapped location in table: %@", (uint8_t *)&v4, 0xCu);

}

- (void)moveNextLineAtLocation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1DD7B0000, v0, v1, "moveNextLine: row index not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)moveUpCellAtLocation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1DD7B0000, v0, v1, "moveUp: column or row index not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)moveDownCellAtLocation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1DD7B0000, v0, v1, "moveDown: column or row index not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)movePrevCellAtLocation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1DD7B0000, v0, v1, "movePrev: column or row index not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)moveNextCellAtLocation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1DD7B0000, v0, v1, "moveNext: column or row index not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
