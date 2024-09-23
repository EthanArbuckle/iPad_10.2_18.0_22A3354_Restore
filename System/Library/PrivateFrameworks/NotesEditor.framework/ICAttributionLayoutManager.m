@implementation ICAttributionLayoutManager

- (NSArray)visibleConfigurations
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttributionLayoutManager currentTextViewOffset](self, "currentTextViewOffset");
  v5 = v4;
  -[ICAttributionLayoutManager viewConfigurations](self, "viewConfigurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__ICAttributionLayoutManager_visibleConfigurations__block_invoke;
  v10[3] = &unk_1EA7E1550;
  v12 = v5;
  v10[4] = self;
  v11 = v3;
  v7 = v3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  v8 = (void *)objc_msgSend(v7, "copy");
  return (NSArray *)v8;
}

- (NSArray)viewConfigurations
{
  return self->_viewConfigurations;
}

- (id)updatedConfigurationHandler
{
  return self->_updatedConfigurationHandler;
}

- (void)updateViewConfigurationsForTextViewOffset
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
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
  double v31;
  double v32;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void (**v44)(_QWORD, _QWORD);
  void *v45;
  void *v46;
  void *v47;
  id obj;
  uint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttributionLayoutManager visibleConfigurations](self, "visibleConfigurations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttributionLayoutManager currentTextViewOffset](self, "currentTextViewOffset");
  v6 = v5;
  objc_msgSend(v4, "firstObject");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    if ((unint64_t)objc_msgSend(v4, "count") < 2)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v47 = v4;
    objc_msgSend(v50, "adjustedFrame");
    v9 = v8;
    objc_msgSend(v50, "associatedTextFrame");
    v11 = v10;
    v13 = v12;
    objc_msgSend(v50, "frame");
    if (v6 >= v14)
    {
      v15 = v6 + v9;
      if (v15 < v11 + v13)
      {
        if (!v7 || (objc_msgSend(v7, "frame"), v15 < v16))
        {
          objc_msgSend(v50, "adjustedFrame");
          objc_msgSend(v50, "setAdjustedFrame:");
          objc_msgSend(v3, "addObject:", v50);
        }
      }
    }
    v46 = v7;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    -[ICAttributionLayoutManager viewConfigurations](self, "viewConfigurations");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (v17)
    {
      v18 = v17;
      v49 = *(_QWORD *)v56;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v56 != v49)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v19);
          -[ICAttributionLayoutManager preferredHighlightValue](self, "preferredHighlightValue");
          objc_msgSend(v20, "setPreferredHighlightValue:");
          objc_msgSend(v20, "frame");
          v22 = v21;
          if (objc_msgSend(v20, "isEqualToAttributionViewConfiguration:", v50))
            objc_msgSend(v20, "adjustedFrame");
          else
            objc_msgSend(v20, "frame");
          v24 = v23;
          objc_msgSend(v20, "frame");
          v26 = v25;
          objc_msgSend(v20, "frame");
          v28 = v27;
          -[ICAttributionLayoutManager appliedHorizontalAdjustment](self, "appliedHorizontalAdjustment");
          v30 = v22 + v29;
          objc_msgSend(v20, "adjustedFrame");
          if (v30 != v32 || v24 != v31)
          {
            objc_msgSend(v20, "setAdjustedFrame:", v30, v24, v26, v28);
            -[ICAttributionLayoutManager appliedHorizontalAdjustmentRatio](self, "appliedHorizontalAdjustmentRatio");
            objc_msgSend(v20, "setAppliedHorizontalAdjustmentRatio:");
            objc_msgSend(v3, "addObject:", v20);
          }
          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          objc_msgSend(v20, "highlightConfigurations");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
          if (v35)
          {
            v36 = v35;
            v37 = *(_QWORD *)v52;
            do
            {
              v38 = 0;
              do
              {
                if (*(_QWORD *)v52 != v37)
                  objc_enumerationMutation(v34);
                v39 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v38);
                v40 = 0.0;
                if ((objc_msgSend(v20, "isBlurred") & 1) == 0)
                {
                  -[ICAttributionLayoutManager preferredHighlightValue](self, "preferredHighlightValue");
                  v40 = v41;
                }
                objc_msgSend(v39, "alpha");
                if (v42 != v40)
                {
                  objc_msgSend(v39, "setAlpha:", v40);
                  objc_msgSend(v3, "addObject:", v20);
                }
                ++v38;
              }
              while (v36 != v38);
              v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
            }
            while (v36);
          }

          if ((objc_msgSend(v20, "isStatusImageHidden") & 1) == 0)
            objc_msgSend(v3, "addObject:", v20);
          ++v19;
        }
        while (v19 != v18);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      }
      while (v18);
    }

    v4 = v47;
  }
  -[ICAttributionLayoutManager updatedConfigurationHandler](self, "updatedConfigurationHandler");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    -[ICAttributionLayoutManager updatedConfigurationHandler](self, "updatedConfigurationHandler");
    v44 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allObjects");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v44)[2](v44, v45);

  }
}

- (ICBaseTextView)textView
{
  return (ICBaseTextView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (void)setVisiblePanelWidth:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  double v11;

  if (vabdd_f64(a3, self->_visiblePanelWidth) >= 0.00999999978)
  {
    self->_visiblePanelWidth = a3;
    -[ICAttributionLayoutManager visiblePanelWidth](self, "visiblePanelWidth");
    v6 = v5;
    -[ICAttributionLayoutManager previewPanelWidth](self, "previewPanelWidth");
    v8 = v6 / v7;
    if (v8 > 1.0)
      v8 = 1.0;
    if (v8 < 0.0)
      v8 = 0.0;
    self->_preferredHighlightValue = v8;
    -[ICAttributionLayoutManager textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "ic_isRTL");
    if (a3 >= 16.0)
      v11 = 16.0;
    else
      v11 = a3;
    if (v10)
      v11 = -v11;
    self->_appliedHorizontalAdjustment = v11;

    self->_appliedHorizontalAdjustmentRatio = self->_appliedHorizontalAdjustment / 16.0;
    -[ICAttributionLayoutManager updateViewConfigurationsForTextViewOffset](self, "updateViewConfigurationsForTextViewOffset");
  }
}

- (void)setUpdatedConfigurationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setPreviewPanelWidth:(double)a3
{
  self->_previewPanelWidth = a3;
}

- (void)setPanelWidth:(double)a3
{
  self->_panelWidth = a3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  objc_super v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  if ((-[ICAttributionLayoutManager ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/Common/Author Attributions/Layout/ICAttributionLayoutManager.m") & 1) != 0)
  {
    v13 = -[ICAttributionLayoutManager ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v10, v11, v12);

    if (a6 == &compoundliteral_9 && (v13 & 1) == 0)
      -[ICAttributionLayoutManager updateViewConfigurationsForTextViewOffset](self, "updateViewConfigurationsForTextViewOffset");
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICAttributionLayoutManager;
    -[ICAttributionLayoutManager observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v12, v11, v10, a6);

  }
}

- (ICAttributionLayoutManager)initWithTextView:(id)a3 managedObjectContext:(id)a4 panelWidth:(double)a5 previewPanelWidth:(double)a6
{
  id v10;
  id v11;
  ICAttributionLayoutManager *v12;
  ICAttributionLayoutManager *v13;
  NSArray *viewConfigurations;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDate *noteLastOpenedDate;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ICAttributionLayoutManager;
  v12 = -[ICAttributionLayoutManager init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_textView, v10);
    objc_storeStrong((id *)&v13->_managedObjectContext, a4);
    v13->_panelWidth = a5;
    v13->_previewPanelWidth = a6;
    viewConfigurations = v13->_viewConfigurations;
    v13->_viewConfigurations = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_msgSend(v10, "editorController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "note");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastOpenedDate");
    v17 = objc_claimAutoreleasedReturnValue();
    noteLastOpenedDate = v13->_noteLastOpenedDate;
    v13->_noteLastOpenedDate = (NSDate *)v17;

    -[ICAttributionLayoutManager addObservers](v13, "addObservers");
  }

  return v13;
}

- (double)currentTextViewOffset
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[ICAttributionLayoutManager textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  -[ICAttributionLayoutManager textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editorController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_safeAreaDistanceFromTop");
  v9 = v5 + v8 + 0.0;

  return v9;
}

- (void)addObservers
{
  id v3;

  -[ICAttributionLayoutManager textView](self, "textView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_addObserver:forKeyPath:context:", self, CFSTR("contentOffset"), &compoundliteral_9);

}

+ (OS_dispatch_queue)reloadQueue
{
  if (reloadQueue_token != -1)
    dispatch_once(&reloadQueue_token, &__block_literal_global_29);
  return (OS_dispatch_queue *)(id)reloadQueue_reloadQueue;
}

void __41__ICAttributionLayoutManager_reloadQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.notes.attribution.layout.manager.reload-queue", attr);
  v2 = (void *)reloadQueue_reloadQueue;
  reloadQueue_reloadQueue = (uint64_t)v1;

}

- (void)dealloc
{
  objc_super v3;

  -[ICAttributionLayoutManager removeObservers](self, "removeObservers");
  v3.receiver = self;
  v3.super_class = (Class)ICAttributionLayoutManager;
  -[ICAttributionLayoutManager dealloc](&v3, sel_dealloc);
}

- (void)reloadViewConfigurationsSynchronously
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ICAttributionViewConfigurationSharedState *v7;
  void *v8;
  ICAttributionViewConfigurationSharedState *v9;
  uint64_t v10;
  uint64_t v11;
  ICAttributionViewConfiguration *v12;
  uint64_t v13;
  uint64_t v14;
  ICAttributionViewConfiguration *v15;
  void *v16;
  ICAttributionViewConfiguration *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  char v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  ICAttributionViewConfiguration *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  void *v67;
  void *v68;
  id obj;
  void *v70;
  uint64_t v71;
  ICAttributionViewConfigurationSharedState *v72;
  _QWORD block[5];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  uint64_t v84;
  void (*v85)(uint64_t);
  void *v86;
  ICAttributionViewConfigurationSharedState *v87;
  ICAttributionLayoutManager *v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  _QWORD v96[7];
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  id v102;
  _QWORD v103[5];
  id v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t (*v109)(uint64_t, uint64_t);
  void (*v110)(uint64_t);
  id v111;
  _BYTE v112[128];
  uint64_t v113;
  _BYTE v114[128];
  uint64_t v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;

  v115 = *MEMORY[0x1E0C80C00];
  -[ICAttributionLayoutManager textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v68)
  {
    -[ICAttributionLayoutManager setViewConfigurations:](self, "setViewConfigurations:", MEMORY[0x1E0C9AA60]);
    goto LABEL_42;
  }
  v106 = 0;
  v107 = &v106;
  v108 = 0x3032000000;
  v109 = __Block_byref_object_copy__25;
  v110 = __Block_byref_object_dispose__25;
  v111 = 0;
  -[ICAttributionLayoutManager managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = MEMORY[0x1E0C809B0];
  v103[1] = 3221225472;
  v103[2] = __67__ICAttributionLayoutManager_reloadViewConfigurationsSynchronously__block_invoke;
  v103[3] = &unk_1EA7E1498;
  v105 = &v106;
  v103[4] = self;
  v104 = v68;
  objc_msgSend(v5, "performBlockAndWait:", v103);

  if (!v107[5])
    goto LABEL_40;
  v97 = 0;
  v98 = &v97;
  v99 = 0x3032000000;
  v100 = __Block_byref_object_copy__25;
  v101 = __Block_byref_object_dispose__25;
  v102 = 0;
  -[ICAttributionLayoutManager managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v96[0] = MEMORY[0x1E0C809B0];
  v96[1] = 3221225472;
  v96[2] = __67__ICAttributionLayoutManager_reloadViewConfigurationsSynchronously__block_invoke_2;
  v96[3] = &unk_1EA7E14C0;
  v96[4] = self;
  v96[5] = &v106;
  v96[6] = &v97;
  objc_msgSend(v6, "performBlockAndWait:", v96);

  v7 = [ICAttributionViewConfigurationSharedState alloc];
  -[ICAttributionLayoutManager textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICAttributionViewConfigurationSharedState initWithTextView:note:](v7, "initWithTextView:note:", v8, v107[5]);

  v90 = 0;
  v91 = &v90;
  v92 = 0x3032000000;
  v93 = __Block_byref_object_copy__25;
  v94 = __Block_byref_object_dispose__25;
  v95 = 0;
  v83 = MEMORY[0x1E0C809B0];
  v84 = 3221225472;
  v85 = __67__ICAttributionLayoutManager_reloadViewConfigurationsSynchronously__block_invoke_3;
  v86 = &unk_1EA7E14E8;
  v87 = v9;
  v88 = self;
  v89 = &v90;
  performBlockOnMainThreadAndWait();
  -[ICAttributionViewConfigurationSharedState synchronouslyLoadDataForEditGroups:](v87, "synchronouslyLoadDataForEditGroups:", v98[5]);
  v72 = v87;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = (id)v98[5];
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v114, 16);
  v70 = (void *)v10;
  v12 = 0;
  if (!v11)
    goto LABEL_32;
  v71 = *(_QWORD *)v80;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v80 != v71)
        objc_enumerationMutation(obj);
      v14 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * v13);
      v15 = [ICAttributionViewConfiguration alloc];
      v113 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v113, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[ICAttributionViewConfiguration initWithSharedState:editGroups:parentConfiguration:](v15, "initWithSharedState:editGroups:parentConfiguration:", v72, v16, 0);

      objc_msgSend((id)v91[5], "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], -[ICAttributionViewConfiguration range](v17, "range"), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
        goto LABEL_12;
      objc_msgSend((id)v91[5], "outlineController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isUUIDHidden:", v21);

      if (v22)
      {
        -[ICAttributionViewConfiguration frame](v12, "frame");
        -[ICAttributionViewConfiguration setFrame:](v17, "setFrame:");
        v23 = 1;
        if (!v12)
          goto LABEL_14;
      }
      else
      {
LABEL_12:
        v23 = 0;
        if (!v12)
          goto LABEL_14;
      }
      -[ICAttributionViewConfiguration frame](v12, "frame");
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;
      -[ICAttributionViewConfiguration frame](v17, "frame");
      v118.origin.x = v32;
      v118.origin.y = v33;
      v118.size.width = v34;
      v118.size.height = v35;
      v116.origin.x = v25;
      v116.origin.y = v27;
      v116.size.width = v29;
      v116.size.height = v31;
      v117 = CGRectIntersection(v116, v118);
      if (CGRectIsNull(v117))
        goto LABEL_14;
      -[ICAttributionViewConfiguration frame](v12, "frame");
      v38 = v37;
      -[ICAttributionViewConfiguration formattedTimestampFrame](v12, "formattedTimestampFrame");
      v40 = v39;
      -[ICAttributionViewConfiguration formattedTimestampFrame](v12, "formattedTimestampFrame");
      v42 = v41;
      -[ICAttributionViewConfiguration frame](v17, "frame");
      v43 = v38 + v40;
      if (v44 > v43)
      {
        -[ICAttributionViewConfiguration frame](v17, "frame");
        if (v45 < v43 + v42 && !-[ICAttributionViewConfiguration isTimestampHidden](v12, "isTimestampHidden"))
        {
          -[ICAttributionViewConfiguration setForcesTimestampHidden:](v12, "setForcesTimestampHidden:", 1);
          goto LABEL_14;
        }
      }
      v46 = -[ICAttributionViewConfiguration range](v12, "range");
      v48 = v47;
      if (v46 == -[ICAttributionViewConfiguration range](v17, "range") && v48 == v49)
        v51 = 1;
      else
        v51 = v23;
      -[ICAttributionViewConfiguration frame](v12, "frame");
      v53 = v52;
      v55 = v54;
      -[ICAttributionViewConfiguration associatedTextFrame](v17, "associatedTextFrame");
      v57 = v56;
      v59 = v58;
      -[ICAttributionViewConfiguration frame](v17, "frame");
      if ((v51 & 1) == 0)
      {
        v61 = v53 + v55 + v60;
        if (v61 <= v57 + v59)
        {
          -[ICAttributionViewConfiguration frame](v17, "frame", v57 + v59, v61);
          -[ICAttributionViewConfiguration setFrame:](v17, "setFrame:");
LABEL_14:
          -[ICAttributionLayoutManager appliedHorizontalAdjustmentRatio](self, "appliedHorizontalAdjustmentRatio");
          -[ICAttributionViewConfiguration setAppliedHorizontalAdjustmentRatio:](v17, "setAppliedHorizontalAdjustmentRatio:");
          -[ICAttributionLayoutManager preferredHighlightValue](self, "preferredHighlightValue");
          -[ICAttributionViewConfiguration setPreferredHighlightValue:](v17, "setPreferredHighlightValue:");
          objc_msgSend(v70, "addObject:", v17);
          v36 = v17;

          v12 = v36;
          goto LABEL_27;
        }
      }
      -[ICAttributionViewConfiguration addEditGroup:](v12, "addEditGroup:", v14);
LABEL_27:

      ++v13;
    }
    while (v11 != v13);
    v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v114, 16);
    v11 = v62;
  }
  while (v62);
LABEL_32:

  objc_msgSend(v70, "sortUsingComparator:", &__block_literal_global_19);
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v63 = v70;
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v75, v112, 16);
  if (v64)
  {
    v65 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v64; ++i)
      {
        if (*(_QWORD *)v76 != v65)
          objc_enumerationMutation(v63);
        objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * i), "synchronouslyLoadData");
      }
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v75, v112, 16);
    }
    while (v64);
  }

  v67 = (void *)objc_msgSend(v63, "copy");
  -[ICAttributionLayoutManager setViewConfigurations:](self, "setViewConfigurations:", v67);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__ICAttributionLayoutManager_reloadViewConfigurationsSynchronously__block_invoke_5;
  block[3] = &unk_1EA7DD2D8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(&v90, 8);
  _Block_object_dispose(&v97, 8);

LABEL_40:
  _Block_object_dispose(&v106, 8);

LABEL_42:
}

void __67__ICAttributionLayoutManager_reloadViewConfigurationsSynchronously__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_existingObjectWithID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __67__ICAttributionLayoutManager_reloadViewConfigurationsSynchronously__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "editGrouper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setEditGrouper:", v2);
  }
  else
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63CB8]), "initWithNote:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 32), "setEditGrouper:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v5 = objc_alloc_init(MEMORY[0x1E0D63CA8]);
  objc_msgSend(*(id *)(a1 + 32), "editGrouper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFilter:", v5);

  if (!v4)
  objc_msgSend(*(id *)(a1 + 32), "editGrouper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsMissingUsers:", 0);

  objc_msgSend(*(id *)(a1 + 32), "editGrouper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIncludesTableEdits:", 1);

  objc_msgSend(*(id *)(a1 + 32), "editGrouper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIncludesCheckmarkEdits:", 1);

  objc_msgSend(*(id *)(a1 + 32), "editGrouper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setJoinsTextGaps:", 1);

  objc_msgSend(*(id *)(a1 + 32), "editGrouper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setJoinsWhitespaceAndNewlineGaps:", 1);

  objc_msgSend(*(id *)(a1 + 32), "editGrouper");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "groupedEdits");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

void __67__ICAttributionLayoutManager_reloadViewConfigurationsSynchronously__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 40), "panelWidth");
  objc_msgSend(*(id *)(a1 + 32), "setPanelWidth:");
  objc_msgSend(*(id *)(a1 + 40), "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setIsRTL:", objc_msgSend(v2, "ic_isRTL"));

  objc_msgSend(*(id *)(a1 + 40), "noteLastOpenedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setNoteLastOpenedDate:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setTopTextViewInset:", 7.0);
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textContentManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v11, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

uint64_t __67__ICAttributionLayoutManager_reloadViewConfigurationsSynchronously__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "frame");
  objc_msgSend(v4, "numberWithDouble:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "frame");
  v10 = v9;

  objc_msgSend(v8, "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "compare:", v11);

  return v12;
}

uint64_t __67__ICAttributionLayoutManager_reloadViewConfigurationsSynchronously__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateViewConfigurationsForTextViewOffset");
}

- (void)reloadConfigurationsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "reloadQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__ICAttributionLayoutManager_reloadConfigurationsWithCompletion___block_invoke;
  v7[3] = &unk_1EA7DFD40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __65__ICAttributionLayoutManager_reloadConfigurationsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "reloadViewConfigurationsSynchronously");
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewConfigurations");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

- (void)removeObservers
{
  id v3;

  -[ICAttributionLayoutManager textView](self, "textView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_removeObserver:forKeyPath:context:", self, CFSTR("contentOffset"), &compoundliteral_9);

}

void __51__ICAttributionLayoutManager_visibleConfigurations__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  id v17;

  v17 = a2;
  objc_msgSend(v17, "associatedTextFrame");
  v4 = v3;
  v6 = v5;
  v7 = *(double *)(a1 + 48);
  objc_msgSend(v17, "frame");
  v10 = v8 + v9;
  v11 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "textView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v11 + v13;

  v15 = v4 + v6;
  if (v10 < v14 && v15 > v7)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v17, v15);

}

- (NSDate)noteLastOpenedDate
{
  return self->_noteLastOpenedDate;
}

- (ICTTTextEditFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setViewConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)panelWidth
{
  return self->_panelWidth;
}

- (double)previewPanelWidth
{
  return self->_previewPanelWidth;
}

- (double)visiblePanelWidth
{
  return self->_visiblePanelWidth;
}

- (NSNumber)overrideZoomFactor
{
  return self->_overrideZoomFactor;
}

- (void)setOverrideZoomFactor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)appliedHorizontalAdjustmentRatio
{
  return self->_appliedHorizontalAdjustmentRatio;
}

- (double)preferredHighlightValue
{
  return self->_preferredHighlightValue;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContext, a3);
}

- (ICTTTextEditGrouper)editGrouper
{
  return self->_editGrouper;
}

- (void)setEditGrouper:(id)a3
{
  objc_storeStrong((id *)&self->_editGrouper, a3);
}

- (void)setCurrentTextViewOffset:(double)a3
{
  self->_currentTextViewOffset = a3;
}

- (double)appliedHorizontalAdjustment
{
  return self->_appliedHorizontalAdjustment;
}

- (void)setAppliedHorizontalAdjustment:(double)a3
{
  self->_appliedHorizontalAdjustment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editGrouper, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong(&self->_updatedConfigurationHandler, 0);
  objc_storeStrong((id *)&self->_overrideZoomFactor, 0);
  objc_storeStrong((id *)&self->_viewConfigurations, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_destroyWeak((id *)&self->_textView);
  objc_storeStrong((id *)&self->_noteLastOpenedDate, 0);
}

@end
