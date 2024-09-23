@implementation CKMessageAcknowledgmentPickerBarViewController

- (CKMessageAcknowledgmentPickerBarViewController)initWithChatItem:(id)a3
{
  id v5;
  CKMessageAcknowledgmentPickerBarViewController *v6;
  CKMessageAcknowledgmentPickerBarViewController *v7;

  v5 = a3;
  v6 = -[CKMessageAcknowledgmentPickerBarViewController init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_chatItem, a3);
    v7->_balloonAnchorVerticalOrientation = 0;
  }

  return v7;
}

- (void)loadView
{
  objc_class *v3;
  char forcedOrientation;
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  if (self->_useForcedOrientation)
    forcedOrientation = self->_forcedOrientation;
  else
    forcedOrientation = -[CKMessagePartChatItem isFromMe](self->_chatItem, "isFromMe");
  v5 = [v3 alloc];
  -[CKMessagePartChatItem votingCounts](self->_chatItem, "votingCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CKMessagePartChatItem selectedType](self->_chatItem, "selectedType");
  -[CKMessagePartChatItem serviceName](self->_chatItem, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithGroupCounts:selectedType:orientation:serviceName:", v6, v7, forcedOrientation, v8);

  -[CKMessageAcknowledgmentPickerBarViewController setView:](self, "setView:", v9);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v9, "acknowledgmentViews", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "setDelegate:", self);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)pickerBarItemViewSelectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _QWORD v22[4];
  void (**v23)(_QWORD);
  _QWORD aBlock[5];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[CKMessageAcknowledgmentPickerBarViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acknowledgmentViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * v10);
        if (v11 != v4)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v10), "itemButton");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setEnabled:", 0);

          objc_msgSend(v11, "setSelected:", 0);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }

  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__CKMessageAcknowledgmentPickerBarViewController_pickerBarItemViewSelectionDidChange___block_invoke;
  aBlock[3] = &unk_1E274A108;
  aBlock[4] = self;
  v14 = v4;
  v25 = v14;
  v15 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((unint64_t)(objc_msgSend(v14, "messageAcknowledgmentType") - 2000) > 5)
  {
    v15[2](v15);
  }
  else
  {
    objc_msgSend(v14, "acknowledgmentGlyphView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertTime:fromLayer:", 0, CACurrentMediaTime());
    v19 = v18;

    objc_msgSend(v16, "animationDuration");
    v21 = v20 * 0.5;
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __86__CKMessageAcknowledgmentPickerBarViewController_pickerBarItemViewSelectionDidChange___block_invoke_2;
    v22[3] = &unk_1E274AED0;
    v23 = v15;
    objc_msgSend(v16, "animateWithBeginTime:completionDelay:completion:", v22, v19, v21);

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

void __86__CKMessageAcknowledgmentPickerBarViewController_pickerBarItemViewSelectionDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageAcknowledgmentPickerViewController:didPickAcknowledgment:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "messageAcknowledgmentType"));

  }
}

uint64_t __86__CKMessageAcknowledgmentPickerBarViewController_pickerBarItemViewSelectionDidChange___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)adjustTailRelativeSiblingViewFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKMessageAcknowledgmentPickerBarViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[CKMessageAcknowledgmentPickerBarViewController adjustTailRelativeSiblingViewFrame:pickerFrame:](self, "adjustTailRelativeSiblingViewFrame:pickerFrame:", x, y, width, height, v10, v12, v14, v16);
}

- (void)adjustTailRelativeSiblingViewFrame:(CGRect)a3 pickerFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  _BOOL4 v13;
  BOOL v14;
  double MinX;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double MaxX;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  id v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v13 = -[CKMessageAcknowledgmentPickerBarViewController isAnchoredToTop](self, "isAnchoredToTop");
  v14 = -[CKMessagePartChatItem isFromMe](self->_chatItem, "isFromMe");
  if (v13)
  {
    if (v14 || self->_useForcedOrientation && self->_forcedOrientation == 1)
    {
      v34.origin.x = v11;
      v34.origin.y = v10;
      v34.size.width = v9;
      v34.size.height = v8;
      MinX = CGRectGetMinX(v34);
      v35.origin.x = x;
      v35.origin.y = y;
      v35.size.width = width;
      v35.size.height = height;
      v16 = MinX - CGRectGetMinX(v35);
      -[CKMessageAcknowledgmentPickerBarViewController pickerView](self, "pickerView");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "messageAcknowledgmentAnchorBubbleOffset");
      v19 = v16 - v18;
    }
    else
    {
      v38.origin.x = v11;
      v38.origin.y = v10;
      v38.size.width = v9;
      v38.size.height = v8;
      MaxX = CGRectGetMaxX(v38);
      v39.origin.x = x;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = height;
      v25 = MaxX - CGRectGetMinX(v39);
      -[CKMessageAcknowledgmentPickerBarViewController pickerView](self, "pickerView");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "messageAcknowledgmentAnchorBubbleOffset");
      v19 = v25 + v26;
    }
    objc_msgSend(v33, "setAnchorBubblePosition:", v19, 0.0);
  }
  else
  {
    if (v14 || self->_useForcedOrientation && self->_forcedOrientation == 1)
    {
      v36.origin.x = v11;
      v36.origin.y = v10;
      v36.size.width = v9;
      v36.size.height = v8;
      v20 = CGRectGetMinX(v36);
      v37.origin.x = x;
      v37.origin.y = y;
      v37.size.width = width;
      v37.size.height = height;
      v21 = v20 - CGRectGetMinX(v37);
      -[CKMessageAcknowledgmentPickerBarViewController pickerView](self, "pickerView");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "messageAcknowledgmentAnchorBubbleOffset");
      v23 = v21 - v22;
    }
    else
    {
      v40.origin.x = v11;
      v40.origin.y = v10;
      v40.size.width = v9;
      v40.size.height = v8;
      v27 = CGRectGetMaxX(v40);
      v41.origin.x = x;
      v41.origin.y = y;
      v41.size.width = width;
      v41.size.height = height;
      v28 = v27 - CGRectGetMinX(v41);
      -[CKMessageAcknowledgmentPickerBarViewController pickerView](self, "pickerView");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "messageAcknowledgmentAnchorBubbleOffset");
      v23 = v28 + v29;
    }
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    v30 = CGRectGetHeight(v42);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "messageAcknowledgmentAnchorBubbleOffset");
    objc_msgSend(v33, "setAnchorBubblePosition:", v23, v30 - v32);

  }
}

- (CGRect)calculateFrameRelativeToSiblingViewFrame:(CGRect)a3 withinBounds:(CGRect)a4
{
  CGFloat v4;
  CGFloat width;
  CGFloat v6;
  double v7;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double MaxX;
  double v28;
  void *v29;
  double v30;
  double v31;
  _BOOL4 v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat height;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat x;
  CGFloat y;
  CGFloat rect;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect result;

  height = a4.size.height;
  y = a4.origin.y;
  rect = a4.size.width;
  x = a4.origin.x;
  v4 = a3.size.height;
  width = a3.size.width;
  v6 = a3.origin.y;
  v7 = a3.origin.x;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageAcknowledgmentPickerBarOffsetFromBalloon");
  v11 = v10;
  v42 = v12;

  -[CKMessageAcknowledgmentPickerBarViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v43 = v6;
  v44 = width;
  if (-[CKMessagePartChatItem isFromMe](self->_chatItem, "isFromMe")
    || self->_useForcedOrientation && self->_forcedOrientation == 1)
  {
    v48.origin.x = v7;
    v48.origin.y = v6;
    v48.size.width = width;
    v20 = v4;
    v48.size.height = v4;
    v21 = CGRectGetMaxX(v48) - v17;
    if (v21 >= v7 - v11)
      v22 = v7 - v11;
    else
      v22 = v21;
  }
  else
  {
    v49.origin.x = v7;
    v49.origin.y = v6;
    v49.size.width = width;
    v20 = v4;
    v49.size.height = v4;
    v23 = v11 + CGRectGetMaxX(v49) - v17;
    if (v23 >= v7)
      v22 = v23;
    else
      v22 = v7;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "messageAcknowledgmentPickerMinHorizontalMargin");
  v26 = fmax(v22, v25);

  v50.origin.x = v26;
  v50.origin.y = v15;
  v50.size.width = v17;
  v50.size.height = v19;
  MaxX = CGRectGetMaxX(v50);
  v51.origin.x = x;
  v51.origin.y = y;
  v51.size.width = rect;
  v51.size.height = height;
  v28 = CGRectGetMaxX(v51);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "messageAcknowledgmentPickerMinHorizontalMargin");
  v31 = v30;

  v32 = -[CKMessageAcknowledgmentPickerBarViewController isAnchoredToTop](self, "isAnchoredToTop");
  v33 = v7;
  v34 = v43;
  v35 = v44;
  v36 = v20;
  if (v32)
    v37 = v42 + CGRectGetMaxY(*(CGRect *)&v33);
  else
    v37 = v42 + CGRectGetMinY(*(CGRect *)&v33) - v19;
  v38 = v26 - fmax(MaxX - (v28 - v31), 0.0);
  v39 = v17;
  v40 = v19;
  result.size.height = v40;
  result.size.width = v39;
  result.origin.y = v37;
  result.origin.x = v38;
  return result;
}

- (void)performShowAnimation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKMessageAcknowledgmentPickerBarViewController pickerView](self, "pickerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performShowAnimation:", v4);

}

- (void)performSendAnimation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKMessageAcknowledgmentPickerBarViewController pickerView](self, "pickerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performSendAnimation:", v4);

}

- (void)performCancelAnimation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKMessageAcknowledgmentPickerBarViewController pickerView](self, "pickerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performCancelAnimation:", v4);

}

- (BOOL)isAnchoredToTop
{
  return -[CKMessageAcknowledgmentPickerBarViewController balloonAnchorVerticalOrientation](self, "balloonAnchorVerticalOrientation") == 1;
}

- (void)setBalloonAnchorVerticalOrientation:(char)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v3 = a3;
  self->_balloonAnchorVerticalOrientation = a3;
  if (a3 == 1)
  {
    self->_useForcedOrientation = 1;
    self->_forcedOrientation = 0;
  }
  -[CKMessageAcknowledgmentPickerBarViewController pickerView](self, "pickerView");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[CKMessageAcknowledgmentPickerBarViewController pickerView](self, "pickerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[CKMessageAcknowledgmentPickerBarViewController pickerView](self, "pickerView");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAnchorVerticalOrientation:", v3);

    }
  }
}

- (CKMessageAcknowledgmentPickerBarDelegate)delegate
{
  return (CKMessageAcknowledgmentPickerBarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKMessagePartChatItem)chatItem
{
  return self->_chatItem;
}

- (void)setChatItem:(id)a3
{
  objc_storeStrong((id *)&self->_chatItem, a3);
}

- (char)forcedOrientation
{
  return self->_forcedOrientation;
}

- (void)setForcedOrientation:(char)a3
{
  self->_forcedOrientation = a3;
}

- (BOOL)useForcedOrientation
{
  return self->_useForcedOrientation;
}

- (void)setUseForcedOrientation:(BOOL)a3
{
  self->_useForcedOrientation = a3;
}

- (char)balloonAnchorVerticalOrientation
{
  return self->_balloonAnchorVerticalOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
