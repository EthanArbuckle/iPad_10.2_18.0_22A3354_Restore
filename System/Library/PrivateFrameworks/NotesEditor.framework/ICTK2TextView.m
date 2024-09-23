@implementation ICTK2TextView

- (id)textStorage
{
  void *v2;
  void *v3;

  -[ICTK2TextView textContentStorage](self, "textContentStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ICTTTextContentStorage)textContentStorage
{
  return (ICTTTextContentStorage *)objc_loadWeakRetained((id *)&self->_textContentStorage);
}

void __100__ICTK2TextView_swizzleTextLayoutCanvasViewTextViewportLayoutControllerDidLayoutTextViewportElement__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a4;
  objc_opt_class();
  objc_msgSend(v5, "textContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_opt_class();
    ICDynamicCast();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textLineFragments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
          objc_msgSend(v8, "tk2TextView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "renderingAttributesProvider");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setRenderingAttributesProvider:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

  }
}

- (id)renderingAttributesProvider
{
  return objc_getProperty(self, a2, 3352, 1);
}

void __27__ICTK2TextView_initialize__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "swizzleLayoutFragmentPointInside");
  objc_msgSend(*(id *)(a1 + 32), "swizzleTextLayoutCanvasViewTextViewportLayoutControllerDidLayoutTextViewportElement");
  objc_msgSend(MEMORY[0x1E0DC12B0], "registerTextAttachmentViewProviderClass:forFileType:", objc_opt_class(), *MEMORY[0x1E0D649E8]);
  objc_msgSend(MEMORY[0x1E0DC12B0], "registerTextAttachmentViewProviderClass:forFileType:", objc_opt_class(), *MEMORY[0x1E0D63868]);
  objc_msgSend(MEMORY[0x1E0DC12B0], "registerTextAttachmentViewProviderClass:forFileType:", objc_opt_class(), *MEMORY[0x1E0D63880]);
  objc_msgSend(MEMORY[0x1E0DC12B0], "registerTextAttachmentViewProviderClass:forFileType:", objc_opt_class(), *MEMORY[0x1E0D63878]);
  objc_msgSend(MEMORY[0x1E0DC12B0], "registerTextAttachmentViewProviderClass:forFileType:", objc_opt_class(), *MEMORY[0x1E0D63840]);
  objc_msgSend(MEMORY[0x1E0DC12B0], "registerTextAttachmentViewProviderClass:forFileType:", objc_opt_class(), *MEMORY[0x1E0D63838]);
  objc_msgSend(MEMORY[0x1E0DC12B0], "registerTextAttachmentViewProviderClass:forFileType:", objc_opt_class(), *MEMORY[0x1E0D636C0]);
  if (ICInternalSettingsIsEmphasisEnabled())
  {
    if (AAJSONErrorDomain_block_invoke_onceToken[0] != -1)
      dispatch_once(AAJSONErrorDomain_block_invoke_onceToken, &__block_literal_global_32);
  }
}

- (ICTK2TextController)tk2TextController
{
  return self->_tk2TextController;
}

- (void)textViewportLayoutControllerDidLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "textLayoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTK2TextView textLayoutManager](self, "textLayoutManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    -[ICTK2TextView textStorage](self, "textStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "ic_range");
    -[ICBaseTextView updateStyleLayersInRange:](self, "updateStyleLayersInRange:", v9, v10);

  }
  if (-[ICBaseTextView needsStylingRefreshOnNextLayout](self, "needsStylingRefreshOnNextLayout"))
  {
    objc_opt_class();
    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "styler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "refreshTextStylingForTextStorage:withTextController:", v14, v13);

    -[ICBaseTextView setNeedsStylingRefreshOnNextLayout:](self, "setNeedsStylingRefreshOnNextLayout:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postNotificationName:object:", CFSTR("ICTextViewLayoutDidChangeNotification"), self);

}

- (void)setRenderingAttributesProvider:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 3352);
}

- (void)setAttributionSidebarWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_attributionSidebarWidthConstraint, a3);
}

- (void)setAttributionSidebarLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_attributionSidebarLeadingConstraint, a3);
}

- (void)setAttachmentViewDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_opt_class();
  -[ICTK2TextView textLayoutManager](self, "textLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAttachmentViewDelegate:", v4);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;
  _QWORD v32[6];

  v32[4] = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)ICTK2TextView;
  -[ICTextView layoutSubviews](&v31, sel_layoutSubviews);
  -[ICTK2TextView attributionSidebarView](self, "attributionSidebarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fullContentWidth");
  v5 = v4;

  -[ICTK2TextView attributionSidebarView](self, "attributionSidebarView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ICTK2TextView attributionSidebarLeadingConstraint](self, "attributionSidebarLeadingConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConstant:", -v5);

    -[ICTK2TextView attributionSidebarWidthConstraint](self, "attributionSidebarWidthConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConstant:", v5);
  }
  else
  {
    -[ICTK2TextView containerViewForAttachments](self, "containerViewForAttachments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2TextView attributionSidebarView](self, "attributionSidebarView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertSubview:atIndex:", v11, 0);

    v23 = (void *)MEMORY[0x1E0CB3718];
    -[ICTK2TextView attributionSidebarView](self, "attributionSidebarView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2TextView containerViewForAttachments](self, "containerViewForAttachments");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v27;
    -[ICTK2TextView attributionSidebarView](self, "attributionSidebarView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2TextView containerViewForAttachments](self, "containerViewForAttachments");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v21;
    -[ICTK2TextView attributionSidebarView](self, "attributionSidebarView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2TextView containerViewForAttachments](self, "containerViewForAttachments");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, -v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2TextView setAttributionSidebarLeadingConstraint:](self, "setAttributionSidebarLeadingConstraint:", v16);
    v32[2] = v16;
    -[ICTK2TextView attributionSidebarView](self, "attributionSidebarView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToConstant:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2TextView setAttributionSidebarWidthConstraint:](self, "setAttributionSidebarWidthConstraint:", v19);
    v32[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateConstraints:", v20);

  }
}

- (NSLayoutConstraint)attributionSidebarWidthConstraint
{
  return self->_attributionSidebarWidthConstraint;
}

- (ICAttributionSidebarView)attributionSidebarView
{
  return self->_attributionSidebarView;
}

- (NSLayoutConstraint)attributionSidebarLeadingConstraint
{
  return self->_attributionSidebarLeadingConstraint;
}

+ (void)swizzleTextLayoutCanvasViewTextViewportLayoutControllerDidLayoutTextViewportElement
{
  objc_class *v2;
  id v3;
  const char *v4;
  void (*v5)(void);

  v2 = NSClassFromString(CFSTR("_UITextLayoutCanvasView"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s%s%s%s%s"), "v", "@", ":", "@", "@");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "UTF8String");

  v5 = imp_implementationWithBlock(&__block_literal_global_32);
  class_addMethod(v2, sel_textViewportLayoutController_didLayoutTextViewportElement_, v5, v4);
}

+ (void)swizzleLayoutFragmentPointInside
{
  objc_class *v2;
  id v3;
  const char *v4;
  void (*v5)(void);

  v2 = NSClassFromString(CFSTR("_UITextLayoutFragmentView"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s%s%s%s%s"), "B", "@", ":", "{CGPoint=dd}", "@");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "UTF8String");

  v5 = imp_implementationWithBlock(&__block_literal_global_24);
  class_addMethod(v2, sel_pointInside_withEvent_, v5, v4);
}

+ (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__ICTK2TextView_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, block);
}

void __27__ICTK2TextView_initialize__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D64968];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ic_currentEmphasisColorTypeDefault());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "registerDefaults:", v2);

}

uint64_t __49__ICTK2TextView_swizzleLayoutFragmentPointInside__block_invoke(double a1, double a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  id v17;
  double v18;
  double v19;

  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "subviews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__ICTK2TextView_swizzleLayoutFragmentPointInside__block_invoke_2;
  v15[3] = &unk_1EA7E1768;
  v18 = a1;
  v19 = a2;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = objc_msgSend(v10, "ic_containsObjectPassingTest:", v15);

  return v13;
}

uint64_t __49__ICTK2TextView_swizzleLayoutFragmentPointInside__block_invoke_2(double *a1, void *a2)
{
  uint64_t v3;
  double v4;
  double v5;
  id v6;
  uint64_t v7;

  v3 = *((_QWORD *)a1 + 4);
  v4 = a1[6];
  v5 = a1[7];
  v6 = a2;
  objc_msgSend(v6, "convertPoint:fromView:", v3, v4, v5);
  v7 = objc_msgSend(v6, "pointInside:withEvent:", *((_QWORD *)a1 + 5));

  return v7;
}

- (ICTK2TextView)initWithNote:(id)a3 size:(CGSize)a4 insideSystemPaper:(BOOL)a5 linkDelegate:(id)a6 insideSiriSnippet:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v9;
  double height;
  double width;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  ICTK2TextLayoutManager *v19;
  ICTK2TextLayoutManagerDelegate *v20;
  ICTK2TextContainer *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  ICTK2TextView *v29;
  ICTK2TextView *v30;
  ICOutlineRenderer *v31;
  ICOutlineRenderer *outlineRenderer;
  ICAttributionSidebarView *v33;
  ICAttributionSidebarView *attributionSidebarView;
  void *v35;
  void *v36;
  ICTextContentStorageDelegate *v40;
  objc_super v41;

  v7 = a7;
  v9 = a5;
  height = a4.height;
  width = a4.width;
  v12 = a3;
  v13 = a6;
  v14 = v12;
  objc_msgSend(v12, "textContentStorageCreateIfNeeded");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    v17 = v15;
  else
    v17 = objc_alloc_init(MEMORY[0x1E0D64D58]);
  v18 = v17;

  v40 = objc_alloc_init(ICTextContentStorageDelegate);
  objc_msgSend(v18, "setDelegate:");
  v19 = objc_alloc_init(ICTK2TextLayoutManager);
  v20 = objc_alloc_init(ICTK2TextLayoutManagerDelegate);
  -[ICTK2TextLayoutManager setDelegate:](v19, "setDelegate:");
  objc_msgSend(v18, "addTextLayoutManager:", v19);
  v21 = -[ICTK2TextContainer initWithSize:]([ICTK2TextContainer alloc], "initWithSize:", width, height);
  -[ICTK2TextContainer setLinkDelegate:](v21, "setLinkDelegate:", v13);

  -[ICTK2TextContainer setInsideSystemPaper:](v21, "setInsideSystemPaper:", v9);
  -[ICTK2TextLayoutManager setTextContainer:](v19, "setTextContainer:", v21);
  -[ICTK2TextContainer setInsideSiriSnippet:](v21, "setInsideSiriSnippet:", v7);
  objc_opt_class();
  objc_msgSend(v18, "textStorage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "styler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
    v26 = v24;
  else
    v26 = objc_alloc_init(MEMORY[0x1E0D64D48]);
  v27 = v26;

  objc_msgSend(v27, "setNote:firstVisibleLocation:", v14, 0);
  objc_msgSend(v27, "setIsForSiri:", v7);
  objc_msgSend(v18, "textStorage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setStyler:", v27);

  v41.receiver = self;
  v41.super_class = (Class)ICTK2TextView;
  v29 = -[ICTextView initWithFrame:textContainer:](&v41, sel_initWithFrame_textContainer_, v21, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_note, a3);
    objc_storeWeak((id *)&v30->_textContentStorage, v18);
    objc_storeStrong((id *)&v30->_textLayoutManagerDelegate, v20);
    objc_storeStrong((id *)&v30->_textContentStorageDelegate, v40);
    objc_storeStrong((id *)&v30->_tk2TextController, v27);
    v31 = -[ICOutlineRenderer initWithTextView:]([ICOutlineRenderer alloc], "initWithTextView:", v30);
    outlineRenderer = v30->_outlineRenderer;
    v30->_outlineRenderer = v31;

    v30->_hoveredCharacterIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[ICTK2TextContainer setTk2TextView:](v21, "setTk2TextView:", v30);
    -[ICTK2TextView setClipsToBounds:](v30, "setClipsToBounds:", 0);
    -[ICTK2TextView setCanCancelContentTouches:](v30, "setCanCancelContentTouches:", 1);
    -[ICTK2TextView setDelaysContentTouches:](v30, "setDelaysContentTouches:", 0);
    -[ICTK2TextView setKeyboardDismissMode:](v30, "setKeyboardDismissMode:", 4);
    -[ICTK2TextView setAlwaysBounceVertical:](v30, "setAlwaysBounceVertical:", 1);
    -[ICTK2TextView setFindInteractionEnabled:](v30, "setFindInteractionEnabled:", 1);
    -[ICTK2TextView setWritingToolsAllowedInputOptions:](v30, "setWritingToolsAllowedInputOptions:", 15);
    v33 = objc_alloc_init(ICAttributionSidebarView);
    attributionSidebarView = v30->_attributionSidebarView;
    v30->_attributionSidebarView = v33;

    -[ICAttributionSidebarView setTranslatesAutoresizingMaskIntoConstraints:](v30->_attributionSidebarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ICAttributionSidebarView setTextView:](v30->_attributionSidebarView, "setTextView:", v30);
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3858]), "initWithTarget:action:", v30, sel_handleHover_);
    -[ICTK2TextView addGestureRecognizer:](v30, "addGestureRecognizer:", v35);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", v30, sel_textViewportLayoutControllerDidLayout_, *MEMORY[0x1E0DC5A38], 0);

    -[ICTK2TextView ic_addObserver:forKeyPath:context:](v30, "ic_addObserver:forKeyPath:context:", v30, CFSTR("hoveredCharacterIndex"), compoundliteral_10);
  }

  return v30;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  objc_super v7;

  objc_opt_class();
  -[ICTK2TextView textLayoutManager](self, "textLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textContentStorage);
    objc_msgSend(WeakRetained, "removeTextLayoutManager:", v4);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5A38], 0);

  -[ICTK2TextView ic_removeObserver:forKeyPath:context:](self, "ic_removeObserver:forKeyPath:context:", self, CFSTR("hoveredCharacterIndex"), compoundliteral_10);
  v7.receiver = self;
  v7.super_class = (Class)ICTK2TextView;
  -[ICTextView dealloc](&v7, sel_dealloc);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  objc_super v18;
  CGPoint v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ICTK2TextView;
  -[ICTextView hitTest:withEvent:](&v18, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[ICTK2TextView attributionSidebarView](self, "attributionSidebarView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
    v11 = v10;
    v13 = v12;

    -[ICTK2TextView attributionSidebarView](self, "attributionSidebarView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v19.x = v11;
    v19.y = v13;
    v15 = CGRectContainsPoint(v20, v19);

    if (v15)
    {
      -[ICTK2TextView attributionSidebarView](self, "attributionSidebarView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hitTest:withEvent:", v7, v11, v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICTK2TextView;
  -[ICTK2TextView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[ICTextView updateLayoutMargins](self, "updateLayoutMargins");
}

- (void)scrollRangeToVisible:(_NSRange)a3
{
  -[ICTK2TextView scrollRangeToVisible:withHeightPercentageAdjustment:forceTop:](self, "scrollRangeToVisible:withHeightPercentageAdjustment:forceTop:", a3.location, a3.length, 0, 0.0);
}

- (void)scrollRangeToVisible:(_NSRange)a3 withHeightPercentageAdjustment:(double)a4 forceTop:(BOOL)a5
{
  _BOOL4 v5;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  CGPoint v24;
  CGRect v25;

  v5 = a5;
  -[ICTK2TextView scrollOffsetForRange:withHeightPercentageAdjustment:](self, "scrollOffsetForRange:withHeightPercentageAdjustment:", a3.location, a3.length, a4);
  v8 = v7;
  v10 = v9;
  if (v5)
    goto LABEL_3;
  -[ICTK2TextView textLayoutManager](self, "textLayoutManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textViewportLayoutController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewportBounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[ICTK2TextView keyboardLayoutGuide](self, "keyboardLayoutGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layoutFrame");
  v23 = v22;

  v25.size.height = v20 - v23;
  v25.origin.x = v14;
  v25.origin.y = v16;
  v25.size.width = v18;
  v24.x = v8;
  v24.y = v10;
  if (!CGRectContainsPoint(v25, v24))
LABEL_3:
    -[ICTextView setContentOffset:](self, "setContentOffset:", v8, v10);
}

- (NSLayoutManager)layoutManager
{
  return 0;
}

- (id)attachmentViewDelegate
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[ICTK2TextView textLayoutManager](self, "textLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "attachmentViewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)handleHover:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  v7 = v6;
  -[ICBaseTextView icTextLayoutManager](self, "icTextLayoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "characterIndexForPoint:", v5, v7);

  if (-[ICTK2TextView hoveredCharacterIndex](self, "hoveredCharacterIndex") != v9)
    -[ICTK2TextView setHoveredCharacterIndex:](self, "setHoveredCharacterIndex:", v9);
}

- (CGPoint)scrollOffsetForRange:(_NSRange)a3 withHeightPercentageAdjustment:(double)a4
{
  NSUInteger length;
  NSUInteger location;
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
  void *v19;
  double v20;
  double v21;
  double v22;
  double *v23;
  double v24;
  double v25;
  double v26;
  _QWORD v27[7];
  uint64_t v28;
  double *v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  CGPoint result;

  length = a3.length;
  location = a3.location;
  -[ICTK2TextView textLayoutManager](self, "textLayoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "documentRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTK2TextView textLayoutManager](self, "textLayoutManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "locationFromLocation:withOffset:", v11, location);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x1E0DC1318]);
  objc_msgSend(v9, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithLocation:endLocation:", v14, v12);

  -[ICTK2TextView textLayoutManager](self, "textLayoutManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ensureLayoutForRange:", v15);

  -[ICTK2TextView layoutIfNeeded](self, "layoutIfNeeded");
  -[ICTextView _updateContentSize](self, "_updateContentSize");
  v28 = 0;
  v29 = (double *)&v28;
  v30 = 0x3010000000;
  v31 = &unk_1DDA28851;
  v32 = *MEMORY[0x1E0C9D538];
  -[ICTK2TextView textLayoutManager](self, "textLayoutManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ic_textRangeForRange:", location, length);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTK2TextView textLayoutManager](self, "textLayoutManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __69__ICTK2TextView_scrollOffsetForRange_withHeightPercentageAdjustment___block_invoke;
  v27[3] = &unk_1EA7E17D0;
  v27[4] = self;
  v27[5] = &v28;
  *(double *)&v27[6] = a4;
  objc_msgSend(v19, "enumerateTextSegmentsInRange:type:options:usingBlock:", v18, 0, 0, v27);

  -[ICTK2TextView safeAreaInsets](self, "safeAreaInsets");
  v29[5] = v29[5] - v20;
  -[ICTK2TextView contentOffset](self, "contentOffset");
  v22 = v21;
  v23 = v29;
  v29[4] = v21;
  v24 = v23[5];

  _Block_object_dispose(&v28, 8);
  v25 = v22;
  v26 = v24;
  result.y = v26;
  result.x = v25;
  return result;
}

uint64_t __69__ICTK2TextView_scrollOffsetForRange_withHeightPercentageAdjustment___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "containerViewForAttachments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:toView:", *(_QWORD *)(a1 + 32), a2, a3);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v10 + 32) = v11;
  *(_QWORD *)(v10 + 40) = v12;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 40)
                                                              + a5 * *(double *)(a1 + 48);

  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  char v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;

  v9 = a5;
  if (a6 == compoundliteral_10)
  {
    v32 = v9;
    v10 = objc_msgSend(a3, "isEqualToString:", CFSTR("hoveredCharacterIndex"));
    v9 = v32;
    if (v10)
    {
      objc_opt_class();
      objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICBaseTextView editorController](self, "editorController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "calculateRecognitionController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "previewBehavior");

      if (!ICInternalSettingsIsScrubbingEnabled() || v17 == 1)
        goto LABEL_24;
      -[ICBaseTextView editorController](self, "editorController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "note");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "isSharedReadOnly") & 1) != 0)
        goto LABEL_23;
      -[ICTK2TextView note](self, "note");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "isDeletedOrInTrash") & 1) == 0)
      {
        v21 = (void *)*MEMORY[0x1E0C9B0D0];
        v22 = (void *)*MEMORY[0x1E0C9B0D0] == v12 ? 0 : v12;
        v23 = v22;
        v24 = v21 == v14 ? 0 : v14;
        v25 = v24;
        if (v23 | v25)
        {
          v26 = (void *)v25;
          if (v23 && v25)
          {
            v27 = objc_msgSend((id)v23, "isEqual:", v25);

            if ((v27 & 1) != 0)
              goto LABEL_24;
          }
          else
          {

          }
          -[ICTK2TextView note](self, "note");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "calculateDocumentController");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "numberLiteralAtLocation:", objc_msgSend(v14, "integerValue"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "range") == 0x7FFFFFFFFFFFFFFFLL || (v29 = objc_msgSend(v14, "intValue"), v29 < 1))
          {
LABEL_23:

LABEL_24:
            v9 = v32;
            goto LABEL_25;
          }
          v30 = v29;
          -[ICBaseTextView editorController](self, "editorController");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "calculateScrubberController");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setHoveredCharacterIndex:", v30);

        }
      }

      goto LABEL_23;
    }
  }
LABEL_25:

}

- (ICNote)note
{
  return self->_note;
}

- (void)setAttributionSidebarView:(id)a3
{
  objc_storeStrong((id *)&self->_attributionSidebarView, a3);
}

- (ICOutlineRenderer)outlineRenderer
{
  return self->_outlineRenderer;
}

- (void)setOutlineRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_outlineRenderer, a3);
}

- (int64_t)hoveredCharacterIndex
{
  return self->_hoveredCharacterIndex;
}

- (void)setHoveredCharacterIndex:(int64_t)a3
{
  self->_hoveredCharacterIndex = a3;
}

- (ICTK2TextLayoutManagerDelegate)textLayoutManagerDelegate
{
  return self->_textLayoutManagerDelegate;
}

- (void)setTextLayoutManagerDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_textLayoutManagerDelegate, a3);
}

- (ICTextContentStorageDelegate)textContentStorageDelegate
{
  return self->_textContentStorageDelegate;
}

- (void)setTextContentStorageDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_textContentStorageDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionSidebarWidthConstraint, 0);
  objc_storeStrong((id *)&self->_attributionSidebarLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_textContentStorageDelegate, 0);
  objc_storeStrong((id *)&self->_textLayoutManagerDelegate, 0);
  objc_storeStrong(&self->_renderingAttributesProvider, 0);
  objc_storeStrong((id *)&self->_outlineRenderer, 0);
  objc_storeStrong((id *)&self->_attributionSidebarView, 0);
  objc_storeStrong((id *)&self->_tk2TextController, 0);
  objc_destroyWeak((id *)&self->_textContentStorage);
  objc_storeStrong((id *)&self->_note, 0);
}

@end
