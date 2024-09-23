@implementation ICNotePreviewController

- (ICNotePreviewController)initWithNote:(id)a3 searchResult:(id)a4
{
  id v7;
  id v8;
  ICNotePreviewController *v9;
  ICNotePreviewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICNotePreviewController;
  v9 = -[ICNotePreviewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_note, a3);
    objc_storeStrong((id *)&v10->_searchResult, a4);
  }

  return v10;
}

- (ICNotePreviewController)initWithNote:(id)a3
{
  return -[ICNotePreviewController initWithNote:searchResult:](self, "initWithNote:searchResult:", a3, 0);
}

- (void)viewDidLoad
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICNotePreviewController;
  -[ICNotePreviewController viewDidLoad](&v4, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x1E0D64DF8]);
  -[ICNotePreviewController setView:](self, "setView:", v3);

  -[ICNotePreviewController registerForTraitChanges](self, "registerForTraitChanges");
}

- (void)setupPreview
{
  -[ICNotePreviewController setupPreviewWithInitialFrame:](self, "setupPreviewWithInitialFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)setupPreviewWithInitialFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  ICTK2TextView *v14;
  void *v15;
  ICTK2TextView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    -[ICNotePreviewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFrame:", x, y, width, height);

  }
  -[ICNotePreviewController note](self, "note");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isPasswordProtectedAndLocked");

  if (v10)
  {
    -[ICNotePreviewController addPasswordEntryViewController](self, "addPasswordEntryViewController");
  }
  else
  {
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      -[ICNotePreviewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      v13 = v12;

      v14 = [ICTK2TextView alloc];
      -[ICNotePreviewController note](self, "note");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[ICTK2TextView initWithNote:size:insideSystemPaper:linkDelegate:insideSiriSnippet:](v14, "initWithNote:size:insideSystemPaper:linkDelegate:insideSiriSnippet:", v15, 0, 0, 0, v13, 1.79769313e308);
      -[ICNotePreviewController setTextView:](self, "setTextView:", v16);

      -[ICNotePreviewController textView](self, "textView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setDelegate:", self);

      -[ICNotePreviewController textView](self, "textView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dateView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setHidden:", 1);

      objc_opt_class();
      -[ICNotePreviewController textView](self, "textView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "textLayoutManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "textContainer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "setWidthTracksTextView:", 1);
      objc_msgSend(v23, "setInPreviewMode:", 1);
    }
    else
    {
      v24 = objc_alloc_init(MEMORY[0x1E0D64DB0]);
      -[ICNotePreviewController setTextController:](self, "setTextController:", v24);

      -[ICNotePreviewController textController](self, "textController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNotePreviewController createTextViewUsingTextController:stylingTextUsingSeparateTextStorageForRendering:](self, "createTextViewUsingTextController:stylingTextUsingSeparateTextStorageForRendering:", v25, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNotePreviewController setTextView:](self, "setTextView:", v26);

      -[ICNotePreviewController textView](self, "textView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setDelegate:", self);
    }

    v27 = objc_msgSend(MEMORY[0x1E0D64D30], "isEnabled");
    -[ICNotePreviewController textView](self, "textView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v27)
      objc_msgSend(v28, "setPaperEnabled:", 1);
    else
      objc_msgSend(v28, "setStylusDrawingEnabled:", 1);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNotePreviewController textView](self, "textView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setBackgroundColor:", v30);

    -[ICNotePreviewController note](self, "note");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "ic_hasLightBackground");

    objc_msgSend(MEMORY[0x1E0DC3658], "ic_notePreviewBackgroundLightContent:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNotePreviewController backgroundView](self, "backgroundView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setBackgroundColor:", v34);

    -[ICNotePreviewController backgroundView](self, "backgroundView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNotePreviewController textView](self, "textView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setContentView:useSafeAreaLayoutGuide:topMargin:bottomMargin:leadingMargin:trailingMargin:standalone:force:", v37, 0, 0, 0, 12.0, 0.0, 0.0, 0.0);

    -[ICNotePreviewController textView](self, "textView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setDataDetectorTypes:", -1);

    -[ICNotePreviewController textView](self, "textView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICNotePreviewController textView](self, "textView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "textStorage");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "fixupAfterEditing");

    -[ICNotePreviewController backgroundView](self, "backgroundView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNotePreviewController ic_safeAreaLayoutGuide](self, "ic_safeAreaLayoutGuide");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNotePreviewController backgroundView](self, "backgroundView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addConstraintsForSafeAreaLayoutGuide:toContainer:", v43, v44);

    -[ICNotePreviewController textView](self, "textView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setUserInteractionEnabled:", 0);

  }
  -[ICNotePreviewController scrollToSearchResultIfNeeded](self, "scrollToSearchResultIfNeeded");
  -[ICNotePreviewController updateForceLightContentIfNecessary](self, "updateForceLightContentIfNecessary");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v46 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive_, *MEMORY[0x1E0DC4750], 0);

}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)-[ICNotePreviewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v3, sel_updateForceLightContentIfNecessary);

}

- (NotesBackgroundView)backgroundView
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ICNotePreviewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NotesBackgroundView *)v4;
}

- (id)createTextViewUsingTextController:(id)a3 stylingTextUsingSeparateTextStorageForRendering:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  ICLayoutManager *v10;
  void *v11;
  void *v12;
  ICTextView *v13;
  ICTextView *v14;
  void *v15;
  void *v16;

  v4 = a4;
  v6 = a3;
  -[ICNotePreviewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;

  v10 = objc_alloc_init(ICLayoutManager);
  -[ICLayoutManager setAllowsNonContiguousLayout:](v10, "setAllowsNonContiguousLayout:", 1);
  -[ICNotePreviewController note](self, "note");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNote:stylingTextUsingSeparateTextStorageForRendering:withLayoutManager:", v11, v4, v10);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64DA8]), "initWithSize:", v9, 1.79769313e308);
  objc_msgSend(v12, "setInPreviewMode:", 1);
  objc_msgSend(v12, "setWidthTracksTextView:", 1);
  -[ICLayoutManager addTextContainer:](v10, "addTextContainer:", v12);
  v13 = [ICTextView alloc];
  v14 = -[ICTextView initWithFrame:textContainer:](v13, "initWithFrame:textContainer:", v12, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[ICBaseLayoutManager setTextView:](v10, "setTextView:", v14);
  -[ICNotePreviewController note](self, "note");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextView dateView](v14, "dateView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNote:", v15);

  return v14;
}

- (void)addPasswordEntryViewController
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = objc_alloc(MEMORY[0x1E0D64CF0]);
  -[ICNotePreviewController note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v3, "initWithNibName:bundle:note:intent:", 0, 0, v4, 0);

  objc_msgSend(v19, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 18);

  objc_msgSend(v19, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  -[ICNotePreviewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v19, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  -[ICNotePreviewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v18);

  -[ICNotePreviewController addChildViewController:](self, "addChildViewController:", v19);
}

- (void)scrollToSearchResultIfNeeded
{
  void *v2;

  -[ICNotePreviewController searchResult](self, "searchResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    performBlockOnMainThreadAndWait();
}

void __55__ICNotePreviewController_scrollToSearchResultIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "searchResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x3010000000;
  v24 = 0;
  v25 = 0;
  v23 = &unk_1DDA28851;
  if (v4)
  {
    objc_msgSend(v4, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "length");
    v8 = *MEMORY[0x1E0DC10F8];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __55__ICNotePreviewController_scrollToSearchResultIfNeeded__block_invoke_2;
    v17[3] = &unk_1EA7DF268;
    v18 = v4;
    v19 = &v20;
    objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v7, 0, v17);
    v9 = v18;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "searchResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstMatchingRangeInNote");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "searchResult");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstMatchingRangeInNote");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "rangeValue");
      v13 = v21;
      v21[4] = v12;
      v13[5] = v14;

    }
    else
    {
      v15 = v21;
      v21[4] = 0;
      v15[5] = 0;
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "textView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ic_scrollRangeToVisible:consideringInsets:animated:", v21[4], v21[5], 1, 0);

  _Block_object_dispose(&v20, 8);
}

void __55__ICNotePreviewController_scrollToSearchResultIfNeeded__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);

    if (v9 == v10)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      *(_QWORD *)(v11 + 32) = a3;
      *(_QWORD *)(v11 + 40) = a4;
      *a5 = 1;
    }
  }

}

- (BOOL)shouldForceLightContent
{
  void *v2;
  char v3;

  -[ICNotePreviewController note](self, "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "prefersLightBackground");

  if ((v3 & 1) != 0)
    return 1;
  else
    return objc_msgSend(MEMORY[0x1E0DC3E88], "ic_alwaysShowLightContent");
}

- (void)updateForceLightContentIfNecessary
{
  _BOOL4 v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v3 = -[ICNotePreviewController shouldForceLightContent](self, "shouldForceLightContent");
  v4 = v3;
  -[ICNotePreviewController traitOverrides](self, "traitOverrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setUserInterfaceStyle:", v3);
LABEL_5:

    goto LABEL_6;
  }
  v7 = objc_msgSend(v5, "containsTrait:", objc_opt_class());

  if (v7)
  {
    -[ICNotePreviewController traitOverrides](self, "traitOverrides");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeTrait:", objc_opt_class());
    goto LABEL_5;
  }
LABEL_6:
  -[ICNotePreviewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOverrideUserInterfaceStyle:", v4);

  -[ICNotePreviewController textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOverrideUserInterfaceStyle:", v4);

  -[ICNotePreviewController textView](self, "textView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsDisplay");

}

- (ICTextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (ICTextController)textController
{
  return self->_textController;
}

- (void)setTextController:(id)a3
{
  objc_storeStrong((id *)&self->_textController, a3);
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (ICSearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_searchResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_textController, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
