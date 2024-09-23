@implementation ICSharedScrollClampingController

void __74__ICSharedScrollClampingController_textStorageWillEndEditingNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  const char *v16;
  const __CFString *v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v4 && objc_msgSend(*(id *)(a1 + 40), "scrollClampingTopTextIndex") >= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D64E68]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "rangeValue");

    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D64E58]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D64E60]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    if ((v10 & 2) == 0 || v6 >= objc_msgSend(*(id *)(a1 + 40), "scrollClampingTopTextIndex"))
      goto LABEL_13;
    objc_msgSend(*(id *)(a1 + 40), "setScrollClampingTopTextIndex:", objc_msgSend(*(id *)(a1 + 40), "scrollClampingTopTextIndex") + v8);
    if (v8 < 1)
    {
      if ((v8 & 0x8000000000000000) == 0 || objc_msgSend(*(id *)(a1 + 40), "scrollClampingTopTextIndex") >= -v8)
        goto LABEL_13;
      v15 = (void *)MEMORY[0x1E0D641A0];
      v16 = "self.scrollClampingTopTextIndex >= ({ __typeof__(changeInLength) __a378 = (changeInLength); (__a378 < 0) ? -"
            " __a378 : __a378; })";
      v17 = CFSTR("scroll-clamping text index reduced to negative");
    }
    else
    {
      v11 = objc_msgSend(*(id *)(a1 + 40), "scrollClampingTopTextIndex");
      objc_msgSend(*(id *)(a1 + 40), "textView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textStorage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v11 <= v14)
      {
LABEL_13:

        return;
      }
      v15 = (void *)MEMORY[0x1E0D641A0];
      v16 = "self.scrollClampingTopTextIndex <= self.textView.textStorage.length";
      v17 = CFSTR("scroll-clamping text index out of bounds");
    }
    objc_msgSend(v15, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", v16, "-[ICSharedScrollClampingController textStorageWillEndEditingNotification:]_block_invoke", 1, 0, v17);
    goto LABEL_13;
  }
}

- (ICTextView)textView
{
  return (ICTextView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (void)textStorageWillEndEditingNotification:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  performBlockOnMainThread();

}

- (void)setScrollClampingTopTextIndex:(int64_t)a3
{
  self->_scrollClampingTopTextIndex = a3;
}

- (void)setScrollClampingTopOffsetLineFragmentHeight:(double)a3
{
  self->_scrollClampingTopOffsetLineFragmentHeight = a3;
}

- (void)setScrollClampingTopOffsetFactor:(double)a3
{
  self->_scrollClampingTopOffsetFactor = a3;
}

- (void)setScrollClampingStack:(int64_t)a3
{
  self->_scrollClampingStack = a3 & ~(a3 >> 63);
}

- (int64_t)scrollClampingTopTextIndex
{
  return self->_scrollClampingTopTextIndex;
}

- (BOOL)isClamped
{
  unint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (-[ICSharedScrollClampingController scrollClampingTopTextIndex](self, "scrollClampingTopTextIndex") < 0)
    return 0;
  v3 = -[ICSharedScrollClampingController scrollClampingTopTextIndex](self, "scrollClampingTopTextIndex");
  -[ICSharedScrollClampingController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 < objc_msgSend(v5, "length");

  return v6;
}

- (ICSharedScrollClampingController)initWithTextView:(id)a3 listensToMergeNotifications:(BOOL)a4 clampingTurnOffDelay:(double)a5
{
  ICSharedScrollClampingController *result;

  result = -[ICSharedScrollClampingController initWithTextView:listensToMergeNotifications:](self, "initWithTextView:listensToMergeNotifications:", a3, a4);
  if (a5 > 0.0 && result != 0)
    result->_scrollClampingTurnOffDelay = a5;
  return result;
}

- (ICSharedScrollClampingController)initWithTextView:(id)a3 listensToMergeNotifications:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  ICSharedScrollClampingController *v7;
  ICSharedScrollClampingController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a4;
  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICSharedScrollClampingController;
  v7 = -[ICSharedScrollClampingController init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    -[ICSharedScrollClampingController setScrollClampingTopTextIndex:](v7, "setScrollClampingTopTextIndex:", -1);
    -[ICSharedScrollClampingController setScrollClampingTopOffsetFactor:](v8, "setScrollClampingTopOffsetFactor:", 0.0);
    -[ICSharedScrollClampingController setScrollClampingTopOffsetLineFragmentHeight:](v8, "setScrollClampingTopOffsetLineFragmentHeight:", 0.0);
    -[ICSharedScrollClampingController setScrollClampingStack:](v8, "setScrollClampingStack:", 0);
    objc_storeWeak((id *)&v8->_textView, v6);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", v8, sel_mergeRelatedOperationsWillBegin_, *MEMORY[0x1E0D637E8], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", v8, sel_mergeRelatedOperationsDidEnd_, *MEMORY[0x1E0D637E0], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", v8, sel_contextWillSaveUserInitiatedChange_, *MEMORY[0x1E0D637A0], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", v8, sel_contextDidSaveUserInitiatedChange_, *MEMORY[0x1E0D63798], 0);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v8, sel_textStorageWillEndEditingNotification_, *MEMORY[0x1E0D64AA0], 0);

  }
  return v8;
}

- (id)clampedYValue
{
  unint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  int IsTextKit2Enabled;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;

  if (-[ICSharedScrollClampingController scrollClampingTopTextIndex](self, "scrollClampingTopTextIndex") < 0)
    goto LABEL_8;
  v3 = -[ICSharedScrollClampingController scrollClampingTopTextIndex](self, "scrollClampingTopTextIndex");
  -[ICSharedScrollClampingController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v3 >= v6)
    goto LABEL_8;
  IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  -[ICSharedScrollClampingController textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (IsTextKit2Enabled)
  {
    objc_msgSend(v8, "textLayoutManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "documentRange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationFromLocation:withOffset:", v12, -[ICSharedScrollClampingController scrollClampingTopTextIndex](self, "scrollClampingTopTextIndex"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "textLayoutFragmentForLocation:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutFragmentFrame");
    v16 = v15;
    v18 = v17;

  }
  else
  {
    objc_msgSend(v8, "layoutManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "glyphIndexForCharacterAtIndex:", -[ICSharedScrollClampingController scrollClampingTopTextIndex](self, "scrollClampingTopTextIndex"));

    -[ICSharedScrollClampingController textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v20, 0);
    v16 = v21;
    v18 = v22;
  }

  -[ICSharedScrollClampingController scrollClampingTopOffsetLineFragmentHeight](self, "scrollClampingTopOffsetLineFragmentHeight");
  if (v18 != v23)
  {
LABEL_8:
    v25 = 0;
  }
  else
  {
    -[ICSharedScrollClampingController scrollClampingTopOffsetFactor](self, "scrollClampingTopOffsetFactor");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 + v24 * v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v25;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICSharedScrollClampingController;
  -[ICSharedScrollClampingController dealloc](&v4, sel_dealloc);
}

- (void)topTextIndex:(unint64_t *)a3 topTextOffset:(double *)a4 topTextFragmentHeight:(double *)a5
{
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double MinX;
  double MinY;
  double MaxX;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  char IsTextKit2Enabled;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  id v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  -[ICSharedScrollClampingController textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "visibleTextRect");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v52.origin.x = v11;
  v52.origin.y = v13;
  v52.size.width = v15;
  v52.size.height = v17;
  MinX = CGRectGetMinX(v52);
  v53.origin.x = v11;
  v53.origin.y = v13;
  v53.size.width = v15;
  v53.size.height = v17;
  MinY = CGRectGetMinY(v53);
  v54.origin.x = v11;
  v54.origin.y = v13;
  v54.size.width = v15;
  v54.size.height = v17;
  MaxX = CGRectGetMaxX(v54);
  v55.origin.x = v11;
  v55.origin.y = v13;
  v55.size.width = v15;
  v55.size.height = v17;
  v21 = CGRectGetMinY(v55);
  -[ICSharedScrollClampingController textView](self, "textView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "closestPositionToPoint:", MinX, MinY);
  v51 = (id)objc_claimAutoreleasedReturnValue();

  -[ICSharedScrollClampingController textView](self, "textView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "closestPositionToPoint:", MaxX, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICSharedScrollClampingController textView](self, "textView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSharedScrollClampingController textView](self, "textView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "beginningOfDocument");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v25, "offsetFromPosition:toPosition:", v27, v51);

  -[ICSharedScrollClampingController textView](self, "textView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSharedScrollClampingController textView](self, "textView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "beginningOfDocument");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v29, "offsetFromPosition:toPosition:", v31, v24);

  -[ICSharedScrollClampingController textView](self, "textView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "textStorage");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "length");

  if (v28 < v35 && v32 < v35)
  {
    if (v28 >= v32)
      v36 = v32;
    else
      v36 = v28;
    *a3 = v36;
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      v37 = *a3;
    }
    else
    {
      -[ICSharedScrollClampingController textView](self, "textView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "layoutManager");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v39, "glyphIndexForCharacterAtIndex:", *a3);

    }
    IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
    -[ICSharedScrollClampingController textView](self, "textView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if ((IsTextKit2Enabled & 1) != 0)
    {
      objc_msgSend(v41, "ic_rectForRange:", v37, 0);
      v44 = v43;
      v46 = v45;
    }
    else
    {
      objc_msgSend(v41, "layoutManager");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v37, 0);
      v44 = v48;
      v46 = v49;

    }
    v50 = 1.0;
    if (v46 >= 1.0)
      v50 = v46;
    *a4 = (v13 - v44) / v50;
    *a5 = v46;
  }

}

- (void)mergeRelatedOperationsWillBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int64_t userInitiatedSaveCount;
  id v10;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[ICSharedScrollClampingController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editorController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "note");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v8)
  {
    userInitiatedSaveCount = self->_userInitiatedSaveCount;
    if (userInitiatedSaveCount <= 0)
    {
      if (userInitiatedSaveCount)
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "_userInitiatedSaveCount == 0", "-[ICSharedScrollClampingController mergeRelatedOperationsWillBegin:]", 1, 0, CFSTR("userInitiatedSaveCount should not be negative"));
      -[ICSharedScrollClampingController clamp](self, "clamp");
    }
  }

}

- (void)mergeRelatedOperationsDidEnd:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  id v13;

  v13 = a3;
  objc_opt_class();
  objc_msgSend(v13, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICSharedScrollClampingController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editorController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v8)
  {
    objc_opt_class();
    objc_msgSend(v13, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D63770]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v12 = objc_msgSend(v11, "unsignedIntegerValue") == 2;
    else
      v12 = 1;
    -[ICSharedScrollClampingController unclampWithMergeUpdates:](self, "unclampWithMergeUpdates:", v12);

  }
}

- (void)contextWillSaveUserInitiatedChange:(id)a3
{
  _QWORD v4[4];
  id v5;
  id location;

  if (-[ICSharedScrollClampingController notificationObjectMatchesTextViewNote:](self, "notificationObjectMatchesTextViewNote:", a3))
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __71__ICSharedScrollClampingController_contextWillSaveUserInitiatedChange___block_invoke;
    v4[3] = &unk_1EA7DD6B8;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __71__ICSharedScrollClampingController_contextWillSaveUserInitiatedChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setUserInitiatedSaveCount:", objc_msgSend(WeakRetained, "userInitiatedSaveCount") + 1);

}

- (void)contextDidSaveUserInitiatedChange:(id)a3
{
  _QWORD v4[4];
  id v5;
  id location;

  if (-[ICSharedScrollClampingController notificationObjectMatchesTextViewNote:](self, "notificationObjectMatchesTextViewNote:", a3))
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __70__ICSharedScrollClampingController_contextDidSaveUserInitiatedChange___block_invoke;
    v4[3] = &unk_1EA7DD6B8;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __70__ICSharedScrollClampingController_contextDidSaveUserInitiatedChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setUserInitiatedSaveCount:", objc_msgSend(WeakRetained, "userInitiatedSaveCount") - 1);

}

- (BOOL)notificationObjectMatchesTextViewNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICCheckedDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICSharedScrollClampingController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "editorController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "note");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v6, "isEqual:", v10);
  return (char)v7;
}

- (void)clamp
{
  double v3;
  double v4;
  uint64_t v5;

  if (!-[ICSharedScrollClampingController scrollClampingStack](self, "scrollClampingStack"))
  {
    v4 = 0.0;
    v5 = 0;
    v3 = 0.0;
    -[ICSharedScrollClampingController topTextIndex:topTextOffset:topTextFragmentHeight:](self, "topTextIndex:topTextOffset:topTextFragmentHeight:", &v5, &v4, &v3);
    -[ICSharedScrollClampingController setScrollClampingTopTextIndex:](self, "setScrollClampingTopTextIndex:", v5);
    -[ICSharedScrollClampingController setScrollClampingTopOffsetFactor:](self, "setScrollClampingTopOffsetFactor:", v4);
    -[ICSharedScrollClampingController setScrollClampingTopOffsetLineFragmentHeight:](self, "setScrollClampingTopOffsetLineFragmentHeight:", v3);
  }
  -[ICSharedScrollClampingController setScrollClampingStack:](self, "setScrollClampingStack:", -[ICSharedScrollClampingController scrollClampingStack](self, "scrollClampingStack") + 1);
}

- (void)unclamp
{
  -[ICSharedScrollClampingController unclampWithMergeUpdates:](self, "unclampWithMergeUpdates:", 1);
}

- (void)unclampWithMergeUpdates:(BOOL)a3
{
  void (**v5)(_QWORD);
  double v6;
  double v7;
  dispatch_time_t v8;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__ICSharedScrollClampingController_unclampWithMergeUpdates___block_invoke;
  aBlock[3] = &unk_1EA7DD2D8;
  aBlock[4] = self;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[ICSharedScrollClampingController scrollClampingTurnOffDelay](self, "scrollClampingTurnOffDelay");
  if (v6 > 0.0 && a3)
  {
    -[ICSharedScrollClampingController scrollClampingTurnOffDelay](self, "scrollClampingTurnOffDelay");
    v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    dispatch_after(v8, MEMORY[0x1E0C80D38], v5);
  }
  else
  {
    v5[2](v5);
  }

}

void __60__ICSharedScrollClampingController_unclampWithMergeUpdates___block_invoke(uint64_t a1)
{
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 32), "setScrollClampingStack:", objc_msgSend(*(id *)(a1 + 32), "scrollClampingStack") - 1);
  if (!objc_msgSend(*(id *)(a1 + 32), "scrollClampingStack"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setScrollClampingTopTextIndex:", -1);
    objc_msgSend(*(id *)(a1 + 32), "setScrollClampingTopOffsetFactor:", 0.0);
  }
  objc_sync_exit(obj);

}

- (double)scrollClampingTopOffsetFactor
{
  return self->_scrollClampingTopOffsetFactor;
}

- (int64_t)scrollClampingStack
{
  return self->_scrollClampingStack;
}

- (double)scrollClampingTurnOffDelay
{
  return self->_scrollClampingTurnOffDelay;
}

- (double)scrollClampingTopOffsetLineFragmentHeight
{
  return self->_scrollClampingTopOffsetLineFragmentHeight;
}

- (int64_t)userInitiatedSaveCount
{
  return self->_userInitiatedSaveCount;
}

- (void)setUserInitiatedSaveCount:(int64_t)a3
{
  self->_userInitiatedSaveCount = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textView);
}

@end
