@implementation ICPencilKitAttachmentAccessibilityElement

- (ICPencilKitAttachmentAccessibilityElement)initWithTextAttachment:(id)a3 textView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  ICPencilKitAttachmentAccessibilityElement *v10;
  ICPencilKitAttachmentAccessibilityElement *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "accessibilityContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICAccessibilityFindReparentingTarget(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v13.receiver = self;
    v13.super_class = (Class)ICPencilKitAttachmentAccessibilityElement;
    v10 = -[ICPencilKitAttachmentAccessibilityElement initWithAccessibilityContainer:](&v13, sel_initWithAccessibilityContainer_, v9);
    v11 = v10;
    if (v10)
    {
      objc_storeWeak((id *)&v10->_textAttachment, v6);
      objc_storeWeak((id *)&v11->_textView, v7);
    }
  }
  else
  {

    v11 = 0;
  }

  return v11;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("handwriting attachment"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[ICPencilKitAttachmentAccessibilityElement textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editorController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calculateAccessibilityController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICPencilKitAttachmentAccessibilityElement rangeInTextStorage](self, "rangeInTextStorage");
  objc_msgSend(v6, "getValueForPencilKitAttachmentAtRange:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Handwritten math: %@"), &stru_1EA7E9860, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICPencilKitAttachmentAccessibilityElement textAttachment](self, "textAttachment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "attachment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handwritingSummary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Possible handwriting: %@"), &stru_1EA7E9860, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v16, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;

  if (-[ICPencilKitAttachmentAccessibilityElement showingResizeHandles](self, "showingResizeHandles"))
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Double tap to show resize handles."), &stru_1EA7E9860, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  UIAccessibilityNotifications v9;
  void *v10;
  void *v11;

  -[ICPencilKitAttachmentAccessibilityElement attachmentDrawingView](self, "attachmentDrawingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFirstResponder");

  if ((v4 & 1) == 0)
  {
    _UIAccessibilityBlockPostingOfNotification();
    -[ICPencilKitAttachmentAccessibilityElement attachmentDrawingView](self, "attachmentDrawingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "becomeFirstResponder");

    _UIAccessibilityUnblockPostingOfNotification();
    -[ICPencilKitAttachmentAccessibilityElement resizeHandleElements](self, "resizeHandleElements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEnabled");

    if (v8)
    {
      v9 = *MEMORY[0x1E0DC4578];
      -[ICPencilKitAttachmentAccessibilityElement resizeHandleElements](self, "resizeHandleElements");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v9, v11);

    }
  }
  return v4 ^ 1;
}

- (CGRect)accessibilityFrame
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
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect result;
  CGRect v29;

  -[ICPencilKitAttachmentAccessibilityElement attachmentDrawingView](self, "attachmentDrawingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[ICPencilKitAttachmentAccessibilityElement attachmentDrawingView](self, "attachmentDrawingView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v29.origin.x = v14;
  v29.origin.y = v15;
  v29.size.width = v16;
  v29.size.height = v17;
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  v27 = CGRectIntersection(v26, v29);
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;

  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  double v3;
  BOOL IsVoiceOverRunning;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGPoint result;

  v3 = -1.0;
  IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  v5 = -1.0;
  if (!IsVoiceOverRunning)
  {
    v8.receiver = self;
    v8.super_class = (Class)ICPencilKitAttachmentAccessibilityElement;
    -[ICPencilKitAttachmentAccessibilityElement accessibilityActivationPoint](&v8, sel_accessibilityActivationPoint, -1.0);
    v3 = v6;
  }
  v7 = v3;
  result.y = v7;
  result.x = v5;
  return result;
}

- (id)accessibilityContainer
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICPencilKitAttachmentAccessibilityElement;
  -[ICPencilKitAttachmentAccessibilityElement accessibilityContainer](&v5, sel_accessibilityContainer);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICAccessibilityFindReparentingTarget(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v12.receiver = self;
  v12.super_class = (Class)ICPencilKitAttachmentAccessibilityElement;
  -[ICPencilKitAttachmentAccessibilityElement accessibilityCustomActions](&v12, sel_accessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[ICPencilKitAttachmentAccessibilityElement isSelected](self, "isSelected"))
  {
    v6 = objc_alloc(MEMORY[0x1E0DC33F0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Select"), &stru_1EA7E9860, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithName:target:selector:", v8, self, sel_selectTextRangeAction);

    objc_msgSend(v5, "addObject:", v9);
  }
  v10 = (void *)objc_msgSend(v5, "copy");

  return v10;
}

- (id)accessibilityCustomRotors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICPencilKitAttachmentAccessibilityElement textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAccessibilityCustomRotorController sharedInstance](ICAccessibilityCustomRotorController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNoteEditorViewController:", v3);

  +[ICAccessibilityCustomRotorController sharedInstance](ICAccessibilityCustomRotorController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharedTextViewRotors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessibilityDragSourceDescriptors
{
  void *v3;
  void *v4;

  if (-[ICPencilKitAttachmentAccessibilityElement isSelected](self, "isSelected"))
  {
    -[ICPencilKitAttachmentAccessibilityElement textView](self, "textView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityDragSourceDescriptors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (UIView)attachmentDrawingView
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = -[ICPencilKitAttachmentAccessibilityElement rangeInTextStorage](self, "rangeInTextStorage");
  -[ICPencilKitAttachmentAccessibilityElement textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (v5 && v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      -[ICPencilKitAttachmentAccessibilityElement textView](self, "textView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICPencilKitAttachmentAccessibilityElement textAttachment](self, "textAttachment");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_pk_viewProviderForAttachment:atCharacterIndex:createIfNeeded:", v8, v3, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[ICPencilKitAttachmentAccessibilityElement textAttachment](self, "textAttachment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICPencilKitAttachmentAccessibilityElement textView](self, "textView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICPencilKitAttachmentAccessibilityElement textView](self, "textView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "layoutManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "viewProviderForParentView:characterIndex:layoutManager:", v8, v3, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return (UIView *)v6;
}

- (_NSRange)rangeInTextStorage
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  _NSRange result;

  -[ICPencilKitAttachmentAccessibilityElement textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v13 = &v12;
  v14 = 0x3010000000;
  v15 = &unk_1DDA28851;
  v16 = xmmword_1DD9E6F90;
  v5 = objc_msgSend(v4, "length");
  v6 = *MEMORY[0x1E0DC10F8];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__ICPencilKitAttachmentAccessibilityElement_rangeInTextStorage__block_invoke;
  v11[3] = &unk_1EA7DE008;
  v11[4] = self;
  v11[5] = &v12;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v5, 0, v11);
  v7 = v13[4];
  v8 = v13[5];
  _Block_object_dispose(&v12, 8);

  v9 = v7;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

void __63__ICPencilKitAttachmentAccessibilityElement_rangeInTextStorage__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v9;
  id v10;
  id v11;
  uint64_t v12;

  v9 = *(void **)(a1 + 32);
  v10 = a2;
  objc_msgSend(v9, "textAttachment");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v10)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v12 + 32) = a3;
    *(_QWORD *)(v12 + 40) = a4;
    *a5 = 1;
  }
}

- (NSArray)resizeHandleElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  ICPencilKitAttachmentResizeHandleAccessibilityElement *v22;
  ICPencilKitAttachmentResizeHandleAccessibilityElement *v23;
  void *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[ICPencilKitAttachmentAccessibilityElement cachedResizeHandleElements](self, "cachedResizeHandleElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_31;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPencilKitAttachmentAccessibilityElement attachmentDrawingView](self, "attachmentDrawingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPencilKitAttachmentAccessibilityElement textAttachment](self, "textAttachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v26 = v5;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v5, "subviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = 0;
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v8);
          objc_opt_class();
          ICDynamicCast();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            v17 = objc_msgSend(v15, "top");
            v18 = v16;
            if (v17)
              v19 = v12;
            else
              v19 = v11;
            if (v17)
              v12 = v18;
            else
              v11 = v18;

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }

    v5 = v26;
    goto LABEL_24;
  }
  -[ICPencilKitAttachmentAccessibilityElement textAttachment](self, "textAttachment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v21 = objc_opt_isKindOfClass();

  if ((v21 & 1) != 0)
  {
    objc_msgSend(v5, "safeValueForKey:", CFSTR("topResizeView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("bottomResizeView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
    if (v12)
    {
      v22 = -[ICPencilKitAttachmentResizeHandleAccessibilityElement initWithAttachmentAccessibilityElement:drawingResizeView:]([ICPencilKitAttachmentResizeHandleAccessibilityElement alloc], "initWithAttachmentAccessibilityElement:drawingResizeView:", self, v12);
      objc_msgSend(v4, "addObject:", v22);

    }
    if (v11)
    {
      v23 = -[ICPencilKitAttachmentResizeHandleAccessibilityElement initWithAttachmentAccessibilityElement:drawingResizeView:]([ICPencilKitAttachmentResizeHandleAccessibilityElement alloc], "initWithAttachmentAccessibilityElement:drawingResizeView:", self, v11);
      objc_msgSend(v4, "addObject:", v23);

    }
    goto LABEL_28;
  }
  v11 = 0;
  v12 = 0;
LABEL_28:
  if (objc_msgSend(v4, "count"))
  {
    v24 = (void *)objc_msgSend(v4, "copy");
    -[ICPencilKitAttachmentAccessibilityElement setCachedResizeHandleElements:](self, "setCachedResizeHandleElements:", v24);

  }
LABEL_31:
  -[ICPencilKitAttachmentAccessibilityElement cachedResizeHandleElements](self, "cachedResizeHandleElements");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)showingResizeHandles
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[ICPencilKitAttachmentAccessibilityElement resizeHandleElements](self, "resizeHandleElements");
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isAccessibilityElement", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)selectTextRangeAction
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _UIAccessibilityBlockPostingOfAllNotifications();
  -[ICPencilKitAttachmentAccessibilityElement textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPencilKitAttachmentAccessibilityElement textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "select:", v4);

  -[ICPencilKitAttachmentAccessibilityElement textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICPencilKitAttachmentAccessibilityElement textRangeInNote](self, "textRangeInNote");
  objc_msgSend(v5, "setSelectedRange:", v6, v7);

  -[ICPencilKitAttachmentAccessibilityElement textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICPencilKitAttachmentAccessibilityElement textRangeInNote](self, "textRangeInNote");
  objc_msgSend(v8, "scrollRangeToVisible:", v9, v10);

  _UIAccessibilityUnblockPostingOfAllNotifications();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Selected %@. Use the actions rotor to start dragging."), &stru_1EA7E9860, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3940];
  -[ICPencilKitAttachmentAccessibilityElement accessibilityLabel](self, "accessibilityLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringWithFormat:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification(*MEMORY[0x1E0DC44C8], v15);
  return 1;
}

- (NSArray)supportedRotorTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("ICAccessibilityRotorTypeAttachments");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isSelected
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v9;

  v3 = -[ICPencilKitAttachmentAccessibilityElement textRangeInNote](self, "textRangeInNote");
  v5 = v4;
  -[ICPencilKitAttachmentAccessibilityElement textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3 == objc_msgSend(v6, "selectedRange") && v5 == v7;

  return v9;
}

- (ICInlineCanvasTextAttachment)textAttachment
{
  return (ICInlineCanvasTextAttachment *)objc_loadWeakRetained((id *)&self->_textAttachment);
}

- (void)setTextAttachment:(id)a3
{
  objc_storeWeak((id *)&self->_textAttachment, a3);
}

- (ICBaseTextView)textView
{
  return (ICBaseTextView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (void)setTextView:(id)a3
{
  objc_storeWeak((id *)&self->_textView, a3);
}

- (NSArray)cachedResizeHandleElements
{
  return self->_cachedResizeHandleElements;
}

- (void)setCachedResizeHandleElements:(id)a3
{
  objc_storeStrong((id *)&self->_cachedResizeHandleElements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedResizeHandleElements, 0);
  objc_destroyWeak((id *)&self->_textView);
  objc_destroyWeak((id *)&self->_textAttachment);
}

@end
