@implementation AVVisualAnalysisView

- (AVVisualAnalysisView)initWithFrame:(CGRect)a3
{
  AVVisualAnalysisView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVVisualAnalysisView;
  v3 = -[AVVisualAnalysisView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_subjectLiftGestureEnabled = objc_msgSend(v4, "subjectLiftGestureEnabled");

  }
  return v3;
}

- (void)setAnalysis:(id)a3
{
  VKCImageAnalysis *v5;
  VKCImageAnalysis **p_analysis;
  void *v7;
  void *v8;
  VKCImageAnalysis *v9;

  v5 = (VKCImageAnalysis *)a3;
  p_analysis = &self->_analysis;
  if (self->_analysis != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_analysis, a3);
    -[AVVisualAnalysisView _addInteractionIfNeeded](self, "_addInteractionIfNeeded");
    -[AVVisualAnalysisView imageAnalysisInteraction](self, "imageAnalysisInteraction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAnalysis:", v9);

    -[AVVisualAnalysisView _updateActionInfoViewHiddenStateIfNeeded](self);
    -[VKImageAnalysisInteraction updateActionInfoLayout](self->_imageAnalysisInteraction, "updateActionInfoLayout");
    -[AVVisualAnalysisView setHasVisualLookupResults:](self, "setHasVisualLookupResults:", -[VKCImageAnalysis hasResultsForAnalysisTypes:](*p_analysis, "hasResultsForAnalysisTypes:", 16));
    if ((self->_analysisTypes & 4) != 0 && *p_analysis)
    {
      -[VKImageAnalysisInteraction beginImageSubjectAnalysisIfNecessary](self->_imageAnalysisInteraction, "beginImageSubjectAnalysisIfNecessary");
    }
    else
    {
      -[AVVisualAnalysisView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "visualAnalysisViewDidUpdateSubjectAvailability:", self);

    }
    v5 = v9;
  }

}

- (void)setAnalysisButtonBottomInset:(double)a3
{
  void *v5;
  id v6;

  if (self->_analysisButtonBottomInset != a3)
  {
    self->_analysisButtonBottomInset = a3;
    -[AVVisualAnalysisView imageAnalysisInteraction](self, "imageAnalysisInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActionInfoEdgeInsets:", 8.0, 8.0, a3, 8.0);

    -[AVVisualAnalysisView imageAnalysisInteraction](self, "imageAnalysisInteraction");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateActionInfoLayout");

  }
}

- (VKImageAnalysisInteraction)imageAnalysisInteraction
{
  VKImageAnalysisInteraction *imageAnalysisInteraction;
  void *v4;
  objc_class *v5;
  VKImageAnalysisInteraction *v6;
  VKImageAnalysisInteraction *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  imageAnalysisInteraction = self->_imageAnalysisInteraction;
  if (!imageAnalysisInteraction)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getVKCImageAnalysisInteractionClass_softClass;
    v13 = getVKCImageAnalysisInteractionClass_softClass;
    if (!getVKCImageAnalysisInteractionClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getVKCImageAnalysisInteractionClass_block_invoke;
      v9[3] = &unk_1E5BB4748;
      v9[4] = &v10;
      __getVKCImageAnalysisInteractionClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (VKImageAnalysisInteraction *)objc_alloc_init(v5);
    v7 = self->_imageAnalysisInteraction;
    self->_imageAnalysisInteraction = v6;

    -[VKImageAnalysisInteraction setActionInfoLiveTextButtonDisabled:](self->_imageAnalysisInteraction, "setActionInfoLiveTextButtonDisabled:", 0);
    -[VKImageAnalysisInteraction setActionInfoQuickActionsDisabled:](self->_imageAnalysisInteraction, "setActionInfoQuickActionsDisabled:", 0);
    -[VKImageAnalysisInteraction setActionInfoViewHidden:](self->_imageAnalysisInteraction, "setActionInfoViewHidden:", 1);
    -[VKImageAnalysisInteraction setAnalysisButtonRequiresVisibleContentGating:](self->_imageAnalysisInteraction, "setAnalysisButtonRequiresVisibleContentGating:", 0);
    -[VKImageAnalysisInteraction setAutomaticallyShowVisualSearchResults:](self->_imageAnalysisInteraction, "setAutomaticallyShowVisualSearchResults:", 1);
    -[VKImageAnalysisInteraction setDelegate:](self->_imageAnalysisInteraction, "setDelegate:", self);
    -[AVVisualAnalysisView _updateInteractionAnalysisTypes]((uint64_t)self);
    imageAnalysisInteraction = self->_imageAnalysisInteraction;
  }
  return imageAnalysisInteraction;
}

- (void)_addInteractionIfNeeded
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  -[AVVisualAnalysisView interactions](self, "interactions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVVisualAnalysisView imageAnalysisInteraction](self, "imageAnalysisInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if ((v5 & 1) == 0)
  {
    -[AVVisualAnalysisView imageAnalysisInteraction](self, "imageAnalysisInteraction");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[AVVisualAnalysisView addInteraction:](self, "addInteraction:", v6);

  }
}

- (void)_removeInteractionIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  -[AVVisualAnalysisView interactions](self, "interactions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVVisualAnalysisView imageAnalysisInteraction](self, "imageAnalysisInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if (v5)
  {
    -[AVVisualAnalysisView imageAnalysisInteraction](self, "imageAnalysisInteraction");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[AVVisualAnalysisView removeInteraction:](self, "removeInteraction:", v6);

  }
}

- (void)setWantsAnalysisButtonVisible:(BOOL)a3
{
  if (self->_wantsAnalysisButtonVisible != a3)
  {
    self->_wantsAnalysisButtonVisible = a3;
    -[AVVisualAnalysisView _updateActionInfoViewHiddenStateIfNeeded](self);
  }
}

- (void)setHighlightsInteractableAreas:(BOOL)a3
{
  id v3;

  -[AVVisualAnalysisView analysisButton](self, "analysisButton", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendActionsForControlEvents:", 64);

}

- (BOOL)hasProminentText
{
  return -[VKImageAnalysisInteraction liveTextButtonVisible](self->_imageAnalysisInteraction, "liveTextButtonVisible");
}

- (BOOL)hasSubjectToCopy
{
  int v3;
  CGRect v5;

  v3 = -[VKImageAnalysisInteraction isSubjectAnalysisComplete](self->_imageAnalysisInteraction, "isSubjectAnalysisComplete");
  if (v3)
  {
    -[VKImageAnalysisInteraction subjectFrame](self->_imageAnalysisInteraction, "subjectFrame");
    LOBYTE(v3) = !CGRectEqualToRect(v5, *MEMORY[0x1E0C9D628]);
  }
  return v3;
}

- (void)setInteractionInProgress:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_interactionInProgress != a3)
  {
    v3 = a3;
    self->_interactionInProgress = a3;
    -[AVVisualAnalysisView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visualAnalysisViewDidBeginInteraction:", v3);

  }
}

- (void)setAnalysisTypes:(unint64_t)a3
{
  if (self->_analysisTypes != a3)
  {
    self->_analysisTypes = a3;
    -[AVVisualAnalysisView setHasVisualLookupResults:](self, "setHasVisualLookupResults:", -[VKCImageAnalysis hasResultsForAnalysisTypes:](self->_analysis, "hasResultsForAnalysisTypes:", 16));
    -[AVVisualAnalysisView _updateInteractionAnalysisTypes]((uint64_t)self);
  }
}

- (void)setHasVisualLookupResults:(BOOL)a3
{
  id v4;

  if (self->_hasVisualLookupResults != a3)
  {
    self->_hasVisualLookupResults = a3;
    -[AVVisualAnalysisView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visualAnalysisViewDidUpdateVisualLookupAvailability:", self);

  }
}

- (id)analysisButton
{
  return (id)-[VKImageAnalysisInteraction analysisButton](self->_imageAnalysisInteraction, "analysisButton");
}

- (BOOL)highlightsSelectableItems
{
  return -[VKImageAnalysisInteraction highlightSelectableItems](self->_imageAnalysisInteraction, "highlightSelectableItems");
}

- (BOOL)hasActiveTextSelection
{
  return -[VKImageAnalysisInteraction hasActiveTextSelection](self->_imageAnalysisInteraction, "hasActiveTextSelection");
}

- (void)resetSelection
{
  if (-[AVVisualAnalysisView hasActiveTextSelection](self, "hasActiveTextSelection"))
    -[VKImageAnalysisInteraction resetSelection](self->_imageAnalysisInteraction, "resetSelection");
}

- (void)copySubject
{
  VKImageAnalysisInteraction *imageAnalysisInteraction;
  id v4;

  if (-[AVVisualAnalysisView hasSubjectToCopy](self, "hasSubjectToCopy"))
  {
    imageAnalysisInteraction = self->_imageAnalysisInteraction;
    -[VKImageAnalysisInteraction allSubjectIndexes](imageAnalysisInteraction, "allSubjectIndexes");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[VKImageAnalysisInteraction loadImageSubjectWithIndexes:completion:](imageAnalysisInteraction, "loadImageSubjectWithIndexes:completion:", v4, &__block_literal_global_19887);

  }
}

- (AVVisualAnalysisViewDelegate)delegate
{
  return (AVVisualAnalysisViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VKCImageAnalysis)analysis
{
  return self->_analysis;
}

- (BOOL)wantsAnalysisButtonVisible
{
  return self->_wantsAnalysisButtonVisible;
}

- (double)analysisButtonBottomInset
{
  return self->_analysisButtonBottomInset;
}

- (BOOL)isInteractionInProgress
{
  return self->_interactionInProgress;
}

- (BOOL)hasVisualLookupResults
{
  return self->_hasVisualLookupResults;
}

- (unint64_t)analysisTypes
{
  return self->_analysisTypes;
}

- (void)setImageAnalysisInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_imageAnalysisInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAnalysisInteraction, 0);
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __35__AVVisualAnalysisView_copySubject__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  if (a2)
  {
    v2 = (void *)MEMORY[0x1E0DC3AC0];
    v3 = a2;
    objc_msgSend(v2, "generalPasteboard");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", v3);

  }
}

- (uint64_t)_updateInteractionAnalysisTypes
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 456), "setActiveInteractionTypes:", (*(_QWORD *)(v1 + 448) >> 1) & 4 | (8 * ((*(_QWORD *)(v1 + 448) >> 2) & 1)) | ((*(_QWORD *)(v1 + 448) & 0x12) != 0));
    return -[AVVisualAnalysisView _updateInteractionProgressIfNeeded](v1);
  }
  return result;
}

- (uint64_t)_updateInteractionProgressIfNeeded
{
  if (result)
    return objc_msgSend((id)result, "setInteractionInProgress:", objc_msgSend((id)result, "hasActiveTextSelection") | objc_msgSend((id)result, "highlightsInteractableAreas") | (*(_QWORD *)(result + 448) >> 3) & 1 | objc_msgSend(*(id *)(result + 456), "subjectInteractionInProgress") | objc_msgSend(*(id *)(result + 456), "subjectHighlightActive"));
  return result;
}

- (void)_updateActionInfoViewHiddenStateIfNeeded
{
  _BOOL8 v2;
  id v3;

  if (a1)
  {
    v2 = (objc_msgSend(a1, "highlightsSelectableItems") & 1) == 0 && a1[417] == 0;
    objc_msgSend(a1, "imageAnalysisInteraction");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setActionInfoViewHidden:", v2);

  }
}

- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5
{
  double y;
  double x;
  id v8;
  _BOOL4 v9;
  char v10;
  int v11;
  void *v12;
  int v13;
  BOOL result;

  y = a4.y;
  x = a4.x;
  v8 = a3;
  v9 = -[AVVisualAnalysisView hasActiveTextSelection](self, "hasActiveTextSelection");
  v10 = objc_msgSend(v8, "interactableItemExistsAtPoint:", x, y);
  v11 = objc_msgSend(v8, "imageSubjectExistsAtPoint:", x, y);

  -[AVVisualAnalysisView delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "shouldBeginTouchInteractionForVisualAnalysisView:", self);

  if (v9)
    -[AVVisualAnalysisView resetSelection](self, "resetSelection");
  result = v10 | v9;
  if (v11 && (!v13 || !self->_subjectLiftGestureEnabled))
    return 0;
  return result;
}

- (void)imageAnalysisInteraction:(id)a3 imageAnalysisButtonPressed:(id)a4
{
  void *v5;
  char v6;
  void *v7;

  -[AVVisualAnalysisView delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AVVisualAnalysisView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visualAnalysisViewDidPressAnalysisButton:", self);

  }
  -[AVVisualAnalysisView _updateActionInfoViewHiddenStateIfNeeded](self);
  -[AVVisualAnalysisView _updateInteractionProgressIfNeeded]((uint64_t)self);
}

- (void)imageAnalysisInteraction:(id)a3 prepareForCalloutAction:(SEL)a4 competion:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  -[AVVisualAnalysisView delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visualAnalysisView:prepareForCalloutAction:completion:", self, a4, v7);

}

- (void)imageAnalysisInteraction:(id)a3 liveTextButtonDidChangeToVisible:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[AVVisualAnalysisView delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visualAnalysisView:didToggleAnalysisButtonVisibilityToVisible:", self, v4);

}

- (void)imageAnalysisInteraction:(id)a3 didRequestLiveTextButtonSelectedState:(BOOL)a4
{
  -[AVVisualAnalysisView _updateActionInfoViewHiddenStateIfNeeded](self);
  -[AVVisualAnalysisView _updateInteractionProgressIfNeeded]((uint64_t)self);
}

- (void)imageAnalysisInteraction:(id)a3 highlightSelectedItemsValueDidChange:(BOOL)a4
{
  -[AVVisualAnalysisView _updateActionInfoViewHiddenStateIfNeeded](self);
  -[AVVisualAnalysisView _updateInteractionProgressIfNeeded]((uint64_t)self);
}

- (void)imageAnalysisInteractionDidCompleteSubjectAnalysis:(id)a3
{
  id v4;

  -[AVVisualAnalysisView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visualAnalysisViewDidUpdateSubjectAvailability:", self);

}

- (void)imageAnalysisInteraction:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4
{
  id v5;

  -[AVVisualAnalysisView delegate](self, "delegate", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualAnalysisViewDidTapVisualLookupIndicator:", self);

}

- (id)presentingViewControllerForImageAnalysisInteraction:(id)a3
{
  void *v4;
  void *v5;

  -[AVVisualAnalysisView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewControllerForVisualAnalysisView:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
