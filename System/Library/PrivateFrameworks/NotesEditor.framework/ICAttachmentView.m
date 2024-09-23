@implementation ICAttachmentView

- (void)willMoveToSuperview:(id)a3
{
  void *v5;
  ICAttachmentView *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICAttachmentView;
  -[ICAttachmentView willMoveToSuperview:](&v8, sel_willMoveToSuperview_);
  if (!a3)
  {
    -[ICAttachmentView textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nextResponderOverride");
    v6 = (ICAttachmentView *)objc_claimAutoreleasedReturnValue();

    if (v6 == self)
    {
      -[ICAttachmentView textView](self, "textView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setNextResponderOverride:", 0);

    }
  }
}

- (BOOL)shouldAddTapGesture
{
  return 1;
}

- (BOOL)shouldAddPanGesture
{
  return 0;
}

- (BOOL)shouldAddMenuLongPressGesture
{
  return 1;
}

- (void)sharedInit:(BOOL)a3
{
  -[ICAttachmentView setForegroundAlpha:](self, "setForegroundAlpha:", a3, 1.0);
}

- (void)setupEventHandling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (-[ICAttachmentView shouldAddTapGesture](self, "shouldAddTapGesture"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_respondToTapGesture_);
    objc_msgSend(v3, "setDelegate:", self);
    objc_msgSend(v3, "setNumberOfTapsRequired:", 1);
    -[ICAttachmentView addGestureRecognizer:](self, "addGestureRecognizer:", v3);

  }
  if (-[ICAttachmentView shouldAddMenuLongPressGesture](self, "shouldAddMenuLongPressGesture"))
  {
    -[ICAttachmentView contextInteraction](self, "contextInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", self);
      -[ICAttachmentView setContextInteraction:](self, "setContextInteraction:", v5);

      -[ICAttachmentView contextInteraction](self, "contextInteraction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachmentView addInteraction:](self, "addInteraction:", v6);

      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel_respondToLongPressGesture_);
      -[ICAttachmentView addGestureRecognizer:](self, "addGestureRecognizer:", v7);

    }
  }
  if (-[ICAttachmentView shouldAddPanGesture](self, "shouldAddPanGesture"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel_respondToPanGesture_);
    objc_msgSend(v8, "setMaximumNumberOfTouches:", 1);
    objc_msgSend(v8, "setDelegate:", self);
    -[ICAttachmentView addGestureRecognizer:](self, "addGestureRecognizer:", v8);
    -[ICAttachmentView setPanGestureRecognizer:](self, "setPanGestureRecognizer:", v8);

  }
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", self);
  -[ICAttachmentView addInteraction:](self, "addInteraction:", v9);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setContextInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_contextInteraction, a3);
}

- (ICAttachmentView)initWithTextAttachment:(id)a3 textContainer:(id)a4 forManualRendering:(BOOL)a5
{
  return -[ICAttachmentView initWithFrame:textAttachment:textContainer:forManualRendering:](self, "initWithFrame:textAttachment:textContainer:forManualRendering:", a3, a4, a5, 0.0, 0.0, 300.0, 100.0);
}

- (ICAttachmentView)initWithFrame:(CGRect)a3 textAttachment:(id)a4 textContainer:(id)a5 forManualRendering:(BOOL)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  ICAttachmentView *v15;
  ICAttachmentView *v16;
  void *v17;
  void *v18;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v14 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ICAttachmentView;
  v15 = -[ICAttachmentView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_textContainer, v14);
    v16->_finishedInit = 1;
    v16->_forManualRendering = a6;
    objc_msgSend(v13, "attachment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentView sharedInit:](v16, "sharedInit:", objc_msgSend(v17, "preferredViewSize") == 1);

    -[ICAttachmentView setupEventHandling](v16, "setupEventHandling");
    -[ICAttachmentView setupConstraints](v16, "setupConstraints");
    -[ICAttachmentView setTextAttachment:](v16, "setTextAttachment:", v13);
    objc_msgSend(v13, "attachment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentView setAttachment:](v16, "setAttachment:", v18);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ICAttachmentView app_updateViewAnnotation](v16, "app_updateViewAnnotation");
  }

  return v16;
}

- (BOOL)forManualRendering
{
  return self->_forManualRendering;
}

- (UIContextMenuInteraction)contextInteraction
{
  return self->_contextInteraction;
}

- (NSString)icaxHintString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Double tap to expand"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)icaxIsTextRangeSelected
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v9;

  v3 = -[ICAttachmentView textRangeInNote](self, "textRangeInNote");
  v5 = v4;
  -[ICAttachmentView _icaxParentTextView](self, "_icaxParentTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3 == objc_msgSend(v6, "selectedRange") && v5 == v7;

  return v9;
}

- (NSArray)supportedRotorTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("ICAccessibilityRotorTypeAttachments");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (_NSRange)textRangeInNote
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  -[ICAttachmentView attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentView attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "rangeForAttachment:", v5);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityContainer
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICAttachmentView;
  -[ICAttachmentView accessibilityContainer](&v7, sel_accessibilityContainer);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    while (!objc_msgSend(v4, "conformsToProtocol:", &unk_1F04A7230))
    {
      objc_msgSend(v4, "accessibilityContainer");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v5;
      if (!v5)
        goto LABEL_8;
    }
    v4 = v4;

    v3 = v4;
  }
  else
  {
    v4 = 0;
  }
LABEL_8:

  return v3;
}

- (BOOL)_accessibilityShouldUseViewHierarchyForFindingScrollParent
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("attachment"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityHint
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  -[ICAttachmentView attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "note");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

    goto LABEL_5;
  }
  v5 = (void *)v4;
  -[ICAttachmentView attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEditable");

  if (!v8)
  {
LABEL_5:
    v9 = 0;
    return v9;
  }
  -[ICAttachmentView icaxHintString](self, "icaxHintString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  return v9;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[ICAttachmentView attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  -[ICAttachmentView _icaxParentTextView](self, "_icaxParentTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentView attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "note");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_4;
  v6 = (void *)v5;
  -[ICAttachmentView attachment](self, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEditable") & 1) != 0)
  {

LABEL_4:
    goto LABEL_5;
  }
  -[ICAttachmentView attachment](self, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "note");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isDeletedOrInTrash");

  if (v11)
  {
    objc_msgSend(v3, "editorController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "showRecoverNoteAlert");
LABEL_11:

    goto LABEL_12;
  }
LABEL_5:
  if ((objc_msgSend(v3, "isFirstResponder") & 1) == 0
    && !-[ICAttachmentView accessibilityElementIsFocused](self, "accessibilityElementIsFocused"))
  {
    -[ICAttachmentView attachment](self, "attachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "icaxBeginEditingAtAttachment:", v12);
    goto LABEL_11;
  }
  -[ICAttachmentView icaxActivate](self, "icaxActivate");
LABEL_12:

  return 1;
}

- (id)_accessibilityTextOperations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)ICAttachmentView;
  -[ICAttachmentView _accessibilityTextOperations](&v9, sel__accessibilityTextOperations);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  if (-[ICAttachmentView canPerformAction:withSender:](self, "canPerformAction:withSender:", sel_share_, 0))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Share Attachment"), &stru_1EA7E9860, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (BOOL)_accessibilityTextOperationAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Share Attachment"), &stru_1EA7E9860, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
  {
    -[ICAttachmentView share:](self, "share:", 0);
    v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ICAttachmentView;
    v8 = -[ICAttachmentView _accessibilityTextOperationAction:](&v10, sel__accessibilityTextOperationAction_, v4);
  }

  return v8;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)ICAttachmentView;
  -[ICAttachmentView accessibilityCustomActions](&v11, sel_accessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  if (!-[ICAttachmentView icaxIsTextRangeSelected](self, "icaxIsTextRangeSelected"))
  {
    v5 = objc_alloc(MEMORY[0x1E0DC33F0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Select"), &stru_1EA7E9860, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithName:target:selector:", v7, self, sel_icaxSelectAttachmentTextRangeAction);

    objc_msgSend(v3, "addObject:", v8);
  }
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (id)accessibilityCustomRotors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICAttachmentView _icaxParentTextView](self, "_icaxParentTextView");
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

- (id)_icaxParentTextView
{
  void *v2;
  void *v3;

  -[ICAttachmentView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v2, "superview");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v3;
      if (!v3)
        goto LABEL_7;
    }
    objc_opt_class();
    ICDynamicCast();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
LABEL_7:

  return v3;
}

- (id)accessibilityDragSourceDescriptors
{
  void *v2;
  void *v3;

  -[ICAttachmentView _icaxParentTextView](self, "_icaxParentTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityDragSourceDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityDropPointDescriptors
{
  void *v2;
  void *v3;

  -[ICAttachmentView _icaxParentTextView](self, "_icaxParentTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityDropPointDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)icaxSelectAttachmentTextRangeAction
{
  -[ICAttachmentView icaxSelectAttachmentTextRange:](self, "icaxSelectAttachmentTextRange:", 1);
  return 1;
}

- (void)icaxSelectAttachmentTextRange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = a3;
  -[ICAttachmentView _icaxParentTextView](self, "_icaxParentTextView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "editorController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICAttachmentView textRangeInNote](self, "textRangeInNote");
  v8 = v7;
  _UIAccessibilityBlockPostingOfAllNotifications();
  if (v5)
  {
    if ((objc_msgSend(v5, "isEditing") & 1) == 0)
    {
      objc_msgSend(v5, "note");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEditable");

      if (v10)
        objc_msgSend(v5, "startEditing");
    }
  }
  objc_msgSend(v16, "select:", v16);
  objc_msgSend(v16, "setSelectedRange:", v6, v8);
  objc_msgSend(v16, "scrollRangeToVisible:", v6, v8);
  _UIAccessibilityUnblockPostingOfAllNotifications();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Selected %@. Use the actions rotor to start dragging."), &stru_1EA7E9860, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CB3940];
    -[ICAttachmentView accessibilityLabel](self, "accessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    UIAccessibilityPostNotification(*MEMORY[0x1E0DC44C8], v15);
  }

}

- (NSString)icaxAttachmentViewTypeDescription
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  -[ICAttachmentView textAttachment](self, "textAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsMultiplePresentationSizes");

  if (v4)
  {
    -[ICAttachmentView attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "preferredViewSize");

    switch(v6)
    {
      case 2:
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("medium");
        goto LABEL_9;
      case 1:
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("thumbnail");
        goto LABEL_9;
      case 0:
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("large");
LABEL_9:
        objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1EA7E9860, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        return (NSString *)v10;
    }
  }
  v10 = 0;
  return (NSString *)v10;
}

- (BOOL)insideSystemPaper
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ICAttachmentView textContainer](self, "textContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "insideSystemPaper");
  return (char)v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICAttachmentView;
  -[ICAttachmentView dealloc](&v4, sel_dealloc);
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)ICAttachmentView;
  -[ICAttachmentView didMoveToWindow](&v4, sel_didMoveToWindow);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_notifyDidMoveToWindow, 0);
  v5[0] = *MEMORY[0x1E0C99860];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentView performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel_notifyDidMoveToWindow, 0, v3, 0.0);

}

- (void)notifyDidMoveToWindow
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("ICAttachmentViewDidMoveToWindowNotification"), self);

}

- (ICAttachmentView)initWithAttachment:(id)a3 textContainer:(id)a4 actionWindow:(id)a5
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  ICAttachmentView *v13;

  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D64D98];
  v11 = a4;
  objc_msgSend(v10, "textAttachmentWithAttachment:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ICAttachmentView initWithFrame:textAttachment:textContainer:forManualRendering:](self, "initWithFrame:textAttachment:textContainer:forManualRendering:", v12, v11, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  if (v13)
    objc_storeStrong((id *)&v13->_actionWindow, a5);

  return v13;
}

- (ICAttachmentView)initWithCoder:(id)a3
{
  return -[ICAttachmentView initWithTextAttachment:textContainer:forManualRendering:](self, "initWithTextAttachment:textContainer:forManualRendering:", 0, 0, 0);
}

- (UIWindow)actionWindow
{
  UIWindow *actionWindow;

  actionWindow = self->_actionWindow;
  if (actionWindow)
    return actionWindow;
  -[ICAttachmentView window](self, "window");
  return (UIWindow *)(id)objc_claimAutoreleasedReturnValue();
}

- (ICTextView)textView
{
  void *v3;
  void *v4;
  void *v5;

  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    -[ICAttachmentView textContainer](self, "textContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tk2TextView");
  }
  else
  {
    objc_opt_class();
    -[ICAttachmentView superview](self, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTextView *)v5;
}

- (void)didTapAttachment:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];

  if (-[ICAttachmentView alertAboutUnsupportedAttachmentIfNecessary](self, "alertAboutUnsupportedAttachmentIfNecessary", a3))
  {
    return;
  }
  -[ICAttachmentView attachment](self, "attachment");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "hasFallbackPDF"))
  {

LABEL_6:
    -[ICAttachmentView attachment](self, "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "media");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isPasswordProtected"))
    {
      dispatch_get_global_queue(2, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37__ICAttachmentView_didTapAttachment___block_invoke;
      block[3] = &unk_1EA7DD2D8;
      block[4] = self;
      dispatch_async(v10, block);

    }
    else
    {
      -[ICAttachmentView openAttachment](self, "openAttachment");
    }

    return;
  }
  -[ICAttachmentView attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isReadyToPresent") & 1) == 0)
  {

    return;
  }
  -[ICAttachmentView attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isUnsupported");

  if ((v7 & 1) == 0)
    goto LABEL_6;
}

void __37__ICAttachmentView_didTapAttachment___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ICAttachmentView_didTapAttachment___block_invoke_2;
  block[3] = &unk_1EA7DD2D8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __37__ICAttachmentView_didTapAttachment___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openAttachment");
}

- (BOOL)alertAboutUnsupportedAttachmentIfNecessary
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
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

  -[ICAttachmentView attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUnsupported");
  if (!v4)
  {
LABEL_10:

    return v4;
  }
  -[ICAttachmentView attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isPasswordProtected"))
  {

LABEL_6:
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (v9 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("iPadOS"), &stru_1EA7E9860, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "systemName");
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Unsupported Attachment"), &stru_1EA7E9860, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Editing this attachment is not supported on this device. To edit it, upgrade to the latest version of %@."), &stru_1EA7E9860, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v15, v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0DC3450];
    -[ICAttachmentView window](self, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "rootViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ic_showAlertWithTitle:message:viewController:", v12, v16, v19);

    goto LABEL_10;
  }
  -[ICAttachmentView attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasFallbackPDF");

  if ((v7 & 1) == 0)
    goto LABEL_6;
  LOBYTE(v4) = 0;
  return v4;
}

- (void)openAttachment
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t buf[16];

  -[ICAttachmentView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICAttachmentView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentView attachment](self, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attachmentView:shouldPresentAttachment:", self, v4);

  }
  else
  {
    v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD7B0000, v5, OS_LOG_TYPE_INFO, "Trying to present attachment for attachment view without a delegate", buf, 2u);
    }

  }
}

- (void)updatePreferredAttachmentViewSize:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[ICAttachmentView attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredViewSize:", v3);

  -[ICAttachmentView attachment](self, "attachment");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_save");

}

- (BOOL)showRecoverNoteAlertIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[ICAttachmentView attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(v4, "isEditable") & 1) == 0 && objc_msgSend(v4, "isDeletedOrInTrash"))
  {
    -[ICAttachmentView textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "editorController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "showRecoverNoteAlert");

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)requestEditorFirstResponder
{
  if (-[ICAttachmentView isFirstResponder](self, "isFirstResponder"))
    -[ICAttachmentView updateFirstResponder](self, "updateFirstResponder");
}

- (void)updateFirstResponder
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  -[ICAttachmentView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editorController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canBecomeFirstResponder");

  if (v5)
  {
    -[ICAttachmentView textView](self, "textView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "editorController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "becomeFirstResponder");

  }
}

- (void)rename:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0D1D840]);
  -[ICAttachmentView attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithExistingTitle:", v7);

  -[ICAttachmentView actionWindow](self, "actionWindow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rootViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __27__ICAttachmentView_rename___block_invoke;
  v11[3] = &unk_1EA7E1370;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v8, "showFromViewController:completion:", v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __27__ICAttachmentView_rename___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  ICDocCamScannedDocumentEditor *v4;
  id WeakRetained;
  void *v6;
  ICDocCamScannedDocumentEditor *v7;
  id v8;

  if (a2)
  {
    v3 = a2;
    v4 = [ICDocCamScannedDocumentEditor alloc];
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ICDocCamScannedDocumentEditor initWithGalleryAttachment:](v4, "initWithGalleryAttachment:", v6);

    -[ICDocCamScannedDocumentEditor updateDocumentTitle:isUserDefined:](v7, "updateDocumentTitle:isUserDefined:", v3, 1);
  }
  v8 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v8, "updateFirstResponder");

}

- (void)createImage:(id)a3
{
  void *v4;
  id v5;

  if (ICInternalSettingsIsGenerationToolEnabled())
  {
    -[ICAttachmentView textView](self, "textView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "editorController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createImage:", self);

  }
}

- (void)share:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v12 = a3;
  -[ICAttachmentView attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "attachmentType") != 8)
    goto LABEL_8;
  -[ICAttachmentView attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isiTunes") & 1) != 0)
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  -[ICAttachmentView attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isAppStore") & 1) != 0)
  {
LABEL_6:

    goto LABEL_7;
  }
  -[ICAttachmentView attachment](self, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isMap") & 1) != 0)
  {

    goto LABEL_6;
  }
  -[ICAttachmentView attachment](self, "attachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isNews");

  if ((v11 & 1) == 0)
  {
    -[ICAttachmentView shareWebLink:](self, "shareWebLink:", v12);
    goto LABEL_10;
  }
LABEL_9:
  -[ICAttachmentView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentView attachment](self, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attachmentView:shouldShareAttachment:", self, v9);

LABEL_10:
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  int v8;
  ICAttachmentView *v9;
  void *v14;
  int v15;

  v6 = a4;
  -[ICAttachmentView attachment](self, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isUnsupported");

  if (v8)
  {
    if (sel_delete_ != a3)
    {
LABEL_3:
      v9 = 0;
      goto LABEL_13;
    }
LABEL_12:
    v9 = self;
    goto LABEL_13;
  }
  if (sel_cut_ == a3 || sel_copy_ == a3 || sel_delete_ == a3)
    goto LABEL_12;
  if (sel_share_ == a3 || sel_rename_ == a3)
  {
    if (!-[ICAttachmentView canPerformAction:withSender:](self, "canPerformAction:withSender:", a3, v6))
      goto LABEL_3;
    goto LABEL_12;
  }
  -[ICAttachmentView textAttachment](self, "textAttachment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "supportsMultiplePresentationSizes");

  v9 = 0;
  if (v15 && sel_updatePreferredAttachmentViewSize_ == a3)
    goto LABEL_12;
LABEL_13:

  return v9;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  void *v4;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;

  -[ICAttachmentView attachment](self, "attachment", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isUnsupported");
  if (v8)
  {
    -[ICAttachmentView attachment](self, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "hasFallbackPDF") & 1) == 0)
    {

      goto LABEL_21;
    }
  }
  -[ICAttachmentView attachment](self, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "needsInitialFetchFromCloud");

  if (v8)
  {

    if ((v10 & 1) != 0)
    {
LABEL_21:
      if (sel_delete_ != a3)
      {
LABEL_22:
        isKindOfClass = 0;
        return isKindOfClass & 1;
      }
LABEL_35:
      -[ICAttachmentView attachment](self, "attachment");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_msgSend(v20, "isSharedReadOnly") ^ 1;

      return isKindOfClass & 1;
    }
  }
  else
  {

    if (v10)
      goto LABEL_21;
  }
  if ((sel_cut_ == a3 || sel_delete_ == a3) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[ICAttachmentView attachment](self, "attachment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_msgSend(v11, "isSharedReadOnly") ^ 1;

  }
  else
  {
    isKindOfClass = 0;
  }
  if (sel_copy_ == a3)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    return isKindOfClass & 1;
  }
  if (sel_share_ == a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      isKindOfClass = -[ICAttachmentView ic_isInSecureWindow](self, "ic_isInSecureWindow") ^ 1;
      return isKindOfClass & 1;
    }
    goto LABEL_22;
  }
  if (sel_rename_ == a3)
  {
    -[ICAttachmentView attachment](self, "attachment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "supportsRenaming"))
    {
      -[ICAttachmentView attachment](self, "attachment");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "attachmentType") == 11)
      {
        isKindOfClass = 1;
      }
      else
      {
        -[ICAttachmentView attachment](self, "attachment");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        isKindOfClass = objc_msgSend(v21, "attachmentType") == 4;

      }
LABEL_39:

      goto LABEL_40;
    }
LABEL_29:
    isKindOfClass = 0;
LABEL_40:

    return isKindOfClass & 1;
  }
  if (ICInternalSettingsIsGenerationToolEnabled() && sel_createImage_ == a3)
  {
    -[ICAttachmentView attachment](self, "attachment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "attachmentType") == 3)
    {
      -[ICAttachmentView attachment](self, "attachment");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "note");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isSharedReadOnly") & 1) != 0)
        isKindOfClass = 0;
      else
        isKindOfClass = -[ICAttachmentView ic_isInSecureWindow](self, "ic_isInSecureWindow") ^ 1;

      goto LABEL_39;
    }
    goto LABEL_29;
  }
  -[ICAttachmentView textView](self, "textView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "editorController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isEditingOnSystemPaper") & 1) != 0)
  {
    v18 = 0;
  }
  else
  {
    -[ICAttachmentView textAttachment](self, "textAttachment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v19, "supportsMultiplePresentationSizes");

  }
  if (v18 && sel_updatePreferredAttachmentViewSize_ == a3)
    goto LABEL_35;
  return isKindOfClass & 1;
}

- (void)editAttachmentWithBlock:(id)a3
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
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(id, void *);

  v18 = (void (**)(id, void *))a3;
  -[ICAttachmentView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "undoManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentView attachment](self, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "note");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentView attachment](self, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "rangeForAttachment:", v9);
    v12 = v11;

    objc_msgSend(v6, "beginUndoGrouping");
    objc_msgSend(v5, "editorController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerUndoWithTarget:selector:object:", v13, sel_updateSelectionOnUndo_, v14);

    v15 = objc_msgSend(v5, "selectedRange");
    v17 = v16;
    objc_msgSend(v5, "setSelectedRange:", v10, v12);
    v18[2](v18, v5);
    objc_msgSend(v5, "setSelectedRange:", v15, v17);
    objc_msgSend(v6, "endUndoGrouping");

  }
}

- (void)cut:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__ICAttachmentView_cut___block_invoke;
  v6[3] = &unk_1EA7E1398;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ICAttachmentView editAttachmentWithBlock:](self, "editAttachmentWithBlock:", v6);

}

void __24__ICAttachmentView_cut___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __24__ICAttachmentView_cut___block_invoke_2;
  v2[3] = &unk_1EA7DE8D0;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "copyWithCompletionBlock:", v2);

}

uint64_t __24__ICAttachmentView_cut___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "delete:", *(_QWORD *)(result + 40));
  return result;
}

- (void)copy:(id)a3
{
  -[ICAttachmentView copyWithCompletionBlock:](self, "copyWithCompletionBlock:", 0);
}

- (void)copyWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D64BE0];
  -[ICAttachmentView attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentView actionWindow](self, "actionWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentView actionWindow](self, "actionWindow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rootViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ic_topViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__ICAttachmentView_copyWithCompletionBlock___block_invoke;
  v13[3] = &unk_1EA7E13C0;
  v13[4] = self;
  v14 = v4;
  v12 = v4;
  objc_msgSend(v5, "generatePDFsIfNecessaryForGalleryAttachments:displayWindow:presentingViewController:completionHandler:", v7, v8, v11, v13);

}

uint64_t __44__ICAttachmentView_copyWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if ((_DWORD)a2)
    objc_msgSend(*(id *)(a1 + 32), "_copy");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (int64_t)dataOwnerForAttachment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[ICAttachmentView attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "folder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isManaged");

  if (v6)
    return 2;
  else
    return 1;
}

- (void)_copy
{
  void *v3;
  int64_t v4;
  _QWORD v5[5];

  v3 = (void *)MEMORY[0x1E0DC3AC0];
  v4 = -[ICAttachmentView dataOwnerForAttachment](self, "dataOwnerForAttachment");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__ICAttachmentView__copy__block_invoke;
  v5[3] = &unk_1EA7DD2D8;
  v5[4] = self;
  objc_msgSend(v3, "_performAsDataOwner:block:", v4, v5);
}

void __25__ICAttachmentView__copy__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  UIImage *v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
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
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "attachmentType");

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != 3)
  {
    objc_msgSend(v5, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_8;
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
    -[UIImage URL](v7, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id *)MEMORY[0x1E0CEC618];
    goto LABEL_6;
  }
  objc_msgSend(v5, "image");
  v7 = (UIImage *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    UIImagePNGRepresentation(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id *)MEMORY[0x1E0CEC580];
LABEL_6:
    objc_msgSend(*v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, v11);

  }
LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "attachmentType");

  if (v13 == 11)
  {
    v14 = (void *)MEMORY[0x1E0D64BE0];
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pdfURLForAttachment:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC570], "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "ic_setNonNilObject:forKey:", v17, v18);

  }
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "pasteboardData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "persistenceData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_setNonNilObject:forKey:", v21, *MEMORY[0x1E0D637F0]);

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setItems:", v23);

  }
}

- (void)delete:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  -[ICAttachmentView textView](self, "textView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v20 = v4;
    v5 = -[ICAttachmentView isFirstResponder](self, "isFirstResponder");
    objc_msgSend(v20, "undoManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentView attachment](self, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "note");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentView attachment](self, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "rangeForAttachment:", v9);
    v12 = v11;

    objc_msgSend(v6, "beginUndoGrouping");
    objc_msgSend(v20, "editorController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerUndoWithTarget:selector:object:", v13, sel_updateSelectionOnUndo_, v14);

    v15 = objc_msgSend(v20, "selectedRange");
    v17 = v16;
    objc_msgSend(v20, "setSelectedRange:", v10, v12);
    objc_msgSend(v20, "textStorage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "deleteCharactersInRange:", v10, v12);

    objc_msgSend(v20, "setSelectedRange:", v15, v17);
    objc_msgSend(v6, "endUndoGrouping");
    objc_msgSend(v20, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "textViewDidChange:", v20);

    if (v5)
      objc_msgSend(v20, "becomeFirstResponder");

    v4 = v20;
  }

}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  -[ICAttachmentView textView](self, "textView", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFindNavigatorVisible");

  if (v8)
  {
    -[ICAttachmentView textView](self, "textView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "findInteraction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissFindNavigator");

  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
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
  _BOOL4 v17;
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
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
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
  void *v52;
  uint64_t v53;
  _BOOL4 v54;
  _BOOL4 v55;
  void *v56;
  char IsExtension;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  void *v64;
  id v65;
  unsigned int v66;
  void *v67;
  void *v68;
  id v69;
  _QWORD v70[5];
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  id v80;
  _QWORD v81[4];
  id v82;
  _QWORD v83[4];
  id v84;
  _QWORD v85[4];
  id v86;
  _QWORD v87[4];
  id v88;
  id location;
  void *v90;
  _QWORD v91[3];

  v91[1] = *MEMORY[0x1E0C80C00];
  v69 = a3;
  if (!-[ICAttachmentView shouldAddMenuLongPressGesture](self, "shouldAddMenuLongPressGesture"))
  {
    v15 = 0;
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  if (-[ICAttachmentView canPerformAction:withSender:](self, "canPerformAction:withSender:", sel_copy_, self))
  {
    v5 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Copy"), &stru_1EA7E9860, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v87[3] = &unk_1EA7DF3F8;
    objc_copyWeak(&v88, &location);
    objc_msgSend(v5, "ic_actionWithTitle:imageName:handler:", v7, CFSTR("doc.on.doc"), v87);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v68, "addObject:", v8);
    objc_destroyWeak(&v88);
  }
  if (-[ICAttachmentView canPerformAction:withSender:](self, "canPerformAction:withSender:", sel_share_, self)
    && (-[ICAttachmentView ic_isInSecureWindow](self, "ic_isInSecureWindow") & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Share"), &stru_1EA7E9860, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
    v85[3] = &unk_1EA7DF3F8;
    objc_copyWeak(&v86, &location);
    objc_msgSend(v9, "ic_actionWithTitle:imageName:handler:", v11, CFSTR("square.and.arrow.up"), v85);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v68, "addObject:", v12);
    objc_destroyWeak(&v86);
  }
  if (-[ICAttachmentView canPerformAction:withSender:](self, "canPerformAction:withSender:", sel_rename_, self))
  {
    -[ICAttachmentView attachment](self, "attachment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "supportsRenaming") & 1) != 0)
    {
      -[ICAttachmentView attachment](self, "attachment");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "attachmentType") == 11)
      {

LABEL_14:
        v18 = (void *)MEMORY[0x1E0DC3428];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Rename"), &stru_1EA7E9860, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v83[0] = MEMORY[0x1E0C809B0];
        v83[1] = 3221225472;
        v83[2] = __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
        v83[3] = &unk_1EA7DF3F8;
        objc_copyWeak(&v84, &location);
        objc_msgSend(v18, "ic_actionWithTitle:imageName:handler:", v20, CFSTR("square.and.pencil"), v83);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v68, "addObject:", v21);
        objc_destroyWeak(&v84);
        goto LABEL_15;
      }
      -[ICAttachmentView attachment](self, "attachment");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "attachmentType") == 4;

      if (v17)
        goto LABEL_14;
    }
    else
    {

    }
  }
LABEL_15:
  if (-[ICAttachmentView canPerformAction:withSender:](self, "canPerformAction:withSender:", sel_updatePreferredAttachmentViewSize_, self))
  {
    -[ICAttachmentView textView](self, "textView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "editorController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "attachmentInsertionController");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64C60]), "initWithInsertionController:", v67);
    -[ICAttachmentView attachment](self, "attachment");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v24, "canConvertAttachmentToLink:", v25);

    v65 = objc_alloc(MEMORY[0x1E0D64B08]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("View As"), &stru_1EA7E9860, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("rectangle.3.group"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentView attachment](self, "attachment");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "preferredViewSize");
    -[ICAttachmentView textAttachment](self, "textAttachment");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "supportedPresentationSizes");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4;
    v81[3] = &unk_1EA7E13E8;
    objc_copyWeak(&v82, &location);
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_5;
    v78[3] = &unk_1EA7DDD98;
    objc_copyWeak(&v80, &location);
    v33 = v24;
    v79 = v33;
    v34 = (void *)objc_msgSend(v65, "initWithTitle:image:preferredViewSize:supportedSizes:supportsPlainLink:isOverrideVariant:selectedSizeHandler:plainLinkHandler:", v27, v28, v30, v32, v66, 0, v81, v78);

    objc_msgSend(v34, "createMenu");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "addObject:", v35);

    objc_destroyWeak(&v80);
    objc_destroyWeak(&v82);

  }
  if (ICInternalSettingsIsGenerationToolEnabled())
  {
    if (-[ICAttachmentView canPerformAction:withSender:](self, "canPerformAction:withSender:", sel_createImage_, self))
    {
      if ((-[ICAttachmentView ic_isInSecureWindow](self, "ic_isInSecureWindow") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CD1180], "sharedInstance");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "isGenerationModelAvailable");

        if (v37)
        {
          v38 = (void *)MEMORY[0x1E0DC3428];
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("Create Image"), &stru_1EA7E9860, 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3870], "ic_generativePlaygroundImage");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v76[0] = MEMORY[0x1E0C809B0];
          v76[1] = 3221225472;
          v76[2] = __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_6;
          v76[3] = &unk_1EA7DF3F8;
          objc_copyWeak(&v77, &location);
          objc_msgSend(v38, "actionWithTitle:image:identifier:handler:", v40, v41, 0, v76);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          v43 = (void *)MEMORY[0x1E0DC39D0];
          v91[0] = v42;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "menuWithTitle:image:identifier:options:children:", &stru_1EA7E9860, 0, 0, 1, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v68, "addObject:", v45);
          objc_destroyWeak(&v77);
        }
      }
    }
  }
  if (-[ICAttachmentView canPerformAction:withSender:](self, "canPerformAction:withSender:", sel_delete_, self))
  {
    v46 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("Delete"), &stru_1EA7E9860, 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_7;
    v74[3] = &unk_1EA7DF3F8;
    objc_copyWeak(&v75, &location);
    objc_msgSend(v46, "ic_actionWithTitle:imageName:attributes:handler:", v48, CFSTR("trash"), 2, v74);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v68, "addObject:", v49);
    objc_destroyWeak(&v75);
  }
  -[ICAttachmentView attachment](self, "attachment");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v50, "attachmentType") == 11)
  {
    objc_opt_class();
    objc_msgSend(v50, "attachmentModel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v52, "firstSubAttachment");
      v53 = objc_claimAutoreleasedReturnValue();

      v50 = (void *)v53;
    }

  }
  v54 = -[ICAttachmentView wantsContextMenuPreview](self, "wantsContextMenuPreview");
  if (v50)
    v55 = v54;
  else
    v55 = 0;
  if (v55)
  {
    -[ICAttachmentView contextMenuPreviewController](self, "contextMenuPreviewController");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v56)
    {
      IsExtension = _UIApplicationIsExtension();
      if ((IsExtension & 1) != 0)
      {
        v58 = 0;
      }
      else
      {
        -[ICAttachmentView ic_viewControllerManager](self, "ic_viewControllerManager");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v90 = v50;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v90, 1);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICAttachmentPresenter previewViewControllerWithViewControllerManager:attachments:startingAtIndex:delegate:editable:isFromAttachmentBrowser:](ICAttachmentPresenter, "previewViewControllerWithViewControllerManager:attachments:startingAtIndex:delegate:editable:isFromAttachmentBrowser:", v58, v64, 0, 0, 0, 0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if ((IsExtension & 1) == 0)
    }
  }
  else
  {
    v56 = 0;
  }
  v59 = (void *)MEMORY[0x1E0DC36B8];
  v60 = MEMORY[0x1E0C809B0];
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_8;
  v72[3] = &unk_1EA7DECA8;
  v61 = v56;
  v73 = v61;
  v70[0] = v60;
  v70[1] = 3221225472;
  v70[2] = __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_9;
  v70[3] = &unk_1EA7E1410;
  v70[4] = self;
  v62 = v68;
  v71 = v62;
  objc_msgSend(v59, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v72, v70);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&location);
LABEL_37:

  return v15;
}

void __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "copy:", WeakRetained);

}

void __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "share:", WeakRetained);

}

void __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "rename:", WeakRetained);

}

void __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updatePreferredAttachmentViewSize:", a2);

}

void __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "convertAttachmentToLink:", v4);

  }
}

void __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "createImage:", WeakRetained);

}

void __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_7(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delete:", WeakRetained);

}

id __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_8(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_9(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "contextualMenuElementsFromProposedActions:", *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1EA7E9860, 0, 0, 0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)contextualMenuElementsFromProposedActions:(id)a3
{
  return a3;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  if (-[ICAttachmentView wantsContextMenuPreview](self, "wantsContextMenuPreview", a3, a4, a5)
    || (-[ICAttachmentView attachment](self, "attachment"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "preferredViewSize"),
        v6,
        v7))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentView traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resolvedColorWithTraitCollection:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v11);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", self, v8);
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v8 = (id)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v14 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
    v15 = objc_alloc(MEMORY[0x1E0DC3B88]);
    -[ICAttachmentView center](self, "center");
    v16 = (void *)objc_msgSend(v15, "initWithContainer:center:", self);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:target:", v8, v14, v16);

  }
  return v12;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __101__ICAttachmentView_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
  v5[3] = &unk_1EA7DD2D8;
  v5[4] = self;
  objc_msgSend(a5, "addCompletion:", v5, a4);
}

uint64_t __101__ICAttachmentView_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didTapAttachment:", *(_QWORD *)(a1 + 32));
}

- (BOOL)wantsContextMenuPreview
{
  void *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  double v8;
  double v9;

  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
  {
    -[ICAttachmentView ic_viewControllerManager](self, "ic_viewControllerManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "noteContainerViewMode");
    if (v5
      || (-[ICAttachmentView ic_viewControllerManager](self, "ic_viewControllerManager"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v2, "isMainSplitViewDisplayModeSecondaryOnly")))
    {
      -[ICAttachmentView ic_viewControllerManager](self, "ic_viewControllerManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "noteContainerViewMode") == 1;

      if (v5)
      {
LABEL_13:

        return v7;
      }
    }
    else
    {
      v7 = 1;
    }

    goto LABEL_13;
  }
  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isiPad"))
  {
    -[ICAttachmentView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v7 = v9 >= 800.0 && v8 >= 300.0;
    goto LABEL_13;
  }
  return 1;
}

- (id)contextMenuPreviewController
{
  return 0;
}

- (void)removeFromSuperview
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  -[ICAttachmentView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldAvoidBecomingFirstResponder");
  objc_msgSend(v3, "setShouldAvoidBecomingFirstResponder:", 1);
  v5.receiver = self;
  v5.super_class = (Class)ICAttachmentView;
  -[ICAttachmentView removeFromSuperview](&v5, sel_removeFromSuperview);
  objc_msgSend(v3, "setShouldAvoidBecomingFirstResponder:", v4);

}

- (void)respondToTapGesture:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  void *v10;
  NSUInteger location;
  NSUInteger length;
  void *v13;
  int v14;
  void *v15;
  id v16;
  NSRange v17;
  NSRange v18;

  v16 = a3;
  if (-[ICAttachmentView isUserInteractionEnabled](self, "isUserInteractionEnabled")
    && objc_msgSend(v16, "state") == 3)
  {
    -[ICAttachmentView attachment](self, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICAttachmentView attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "rangeForAttachment:", v6);
    v9 = v8;

    -[ICAttachmentView textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17.location = objc_msgSend(v10, "selectedRange");
    location = v17.location;
    length = v17.length;
    v18.location = v7;
    v18.length = v9;
    if (NSIntersectionRange(v17, v18).length)
    {
      objc_msgSend(v10, "setSelectedRange:", location + length, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isMenuVisible");

      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setMenuVisible:animated:", 0, 1);

        -[ICAttachmentView requestEditorFirstResponder](self, "requestEditorFirstResponder");
      }
      else if (!-[ICAttachmentView showRecoverNoteAlertIfNecessary](self, "showRecoverNoteAlertIfNecessary"))
      {
        -[ICAttachmentView didTapAttachment:](self, "didTapAttachment:", self);
      }
    }

  }
}

- (void)respondToPanGesture:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint8_t buf[16];

  -[ICAttachmentView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICAttachmentView delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentView attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attachmentView:shouldPresentAttachment:", self, v5);

  }
  else
  {
    v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD7B0000, v6, OS_LOG_TYPE_INFO, "respondToPanGesture: attachment view has no delegate", buf, 2u);
    }

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  uint64_t v12;
  double v14;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  CGPoint v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "locationInView:", self);
  v9 = v8;
  v11 = v10;
  -[ICAttachmentView bounds](self, "bounds");
  if (v14 > 32.0)
    *(CGRect *)&v12 = CGRectInset(*(CGRect *)&v12, 8.0, 0.0);
  v22.x = v9;
  v22.y = v11;
  if (CGRectContainsPoint(*(CGRect *)&v12, v22))
  {
    -[ICAttachmentView panGestureRecognizer](self, "panGestureRecognizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v6, "isEqual:", v16);

    if (v17)
    {
      -[ICAttachmentView delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachmentView attachment](self, "attachment");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "attachmentView:shouldRespondToPanGestureTouch:forAttachment:", self, v7, v19);

    }
    else
    {
      v20 = 1;
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)icaxActivate
{
  -[ICAttachmentView didTapAttachment:](self, "didTapAttachment:", 0);
}

- (void)shareWebLink:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[5];
  _QWORD v49[6];

  v4 = a3;
  -[ICAttachmentView attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "ic_isWebURL"))
  {
    -[ICAttachmentView attachment](self, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "urlString");
    v8 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  v45 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Open"), &stru_1EA7E9860, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __33__ICAttachmentView_shareWebLink___block_invoke;
  v49[3] = &unk_1EA7DE6D8;
  v49[4] = self;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v49);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v14);

  -[ICAttachmentView attachment](self, "attachment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v16, "ic_isWebURL");

  if ((_DWORD)v12)
  {
    v17 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Add to Reading List"), &stru_1EA7E9860, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v13;
    v48[1] = 3221225472;
    v48[2] = __33__ICAttachmentView_shareWebLink___block_invoke_2;
    v48[3] = &unk_1EA7DE6D8;
    v48[4] = self;
    objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 0, v48);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v20);

  }
  v21 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Copy"), &stru_1EA7E9860, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v13;
  v46[1] = 3221225472;
  v46[2] = __33__ICAttachmentView_shareWebLink___block_invoke_130;
  v46[3] = &unk_1EA7E1438;
  v46[4] = self;
  v47 = v4;
  v24 = v4;
  objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 0, v46);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v25);

  v26 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1EA7E9860, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "actionWithTitle:style:handler:", v28, 1, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v29);

  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
    v30 = -2;
  else
    v30 = 7;
  objc_msgSend(v9, "setModalPresentationStyle:", v30);
  -[ICAttachmentView actionWindow](self, "actionWindow");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rootViewController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "ic_topViewController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "presentViewController:animated:completion:", v9, 1, 0);

  objc_msgSend(v9, "popoverPresentationController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setSourceView:", self);

  -[ICAttachmentView bounds](self, "bounds");
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  objc_msgSend(v9, "popoverPresentationController");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setSourceRect:", v36, v38, v40, v42);

  objc_msgSend(v9, "popoverPresentationController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setPermittedArrowDirections:", 15);

}

void __33__ICAttachmentView_shareWebLink___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentView:shouldPresentAttachment:", v2, v3);

}

void __33__ICAttachmentView_shareWebLink___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  id v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v3 = a2;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v4 = (void *)getSSReadingListClass_softClass;
  v23 = getSSReadingListClass_softClass;
  if (!getSSReadingListClass_softClass)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __getSSReadingListClass_block_invoke;
    v19[3] = &unk_1EA7DECF8;
    v19[4] = &v20;
    __getSSReadingListClass_block_invoke((uint64_t)v19);
    v4 = (void *)v21[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v20, 8);
  objc_msgSend(v5, "defaultReadingList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E98];
  v9 = *(void **)(a1 + 32);
  v8 = (id *)(a1 + 32);
  objc_msgSend(v9, "attachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "urlString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLWithString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v8, "attachment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v15 = objc_msgSend(v6, "addReadingListItemWithURL:title:previewText:error:", v12, v14, 0, &v18);
  v16 = v18;

  if ((v15 & 1) == 0)
  {
    v17 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __33__ICAttachmentView_shareWebLink___block_invoke_2_cold_1(v8, (uint64_t)v16, v17);

  }
}

uint64_t __33__ICAttachmentView_shareWebLink___block_invoke_130(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "copy:", *(_QWORD *)(a1 + 40));
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return 0;
}

- (NSTextContainer)textContainer
{
  return (NSTextContainer *)objc_loadWeakRetained((id *)&self->_textContainer);
}

- (ICAttachmentViewDelegate)delegate
{
  return (ICAttachmentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)finishedInit
{
  return self->_finishedInit;
}

- (void)setFinishedInit:(BOOL)a3
{
  self->_finishedInit = a3;
}

- (void)setActionWindow:(id)a3
{
  objc_storeStrong((id *)&self->_actionWindow, a3);
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_contextInteraction, 0);
  objc_storeStrong((id *)&self->_actionWindow, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_textContainer);
}

void __33__ICAttachmentView_shareWebLink___block_invoke_2_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "urlString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1DD7B0000, a3, OS_LOG_TYPE_ERROR, "Unable to add %@ to reading list, error %@", (uint8_t *)&v7, 0x16u);

}

@end
