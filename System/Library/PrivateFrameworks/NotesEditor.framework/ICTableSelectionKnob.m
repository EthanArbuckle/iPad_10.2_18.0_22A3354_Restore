@implementation ICTableSelectionKnob

- (ICTableSelectionKnob)initWithTableAttachmentViewController:(id)a3
{
  id v4;
  ICTableSelectionKnob *v5;
  ICTableSelectionKnob *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICTableSelectionKnob;
  v5 = -[ICTableSelectionKnob init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_tableAttachmentViewController, v4);

  return v6;
}

- (ICTableSelectionKnob)initWithFrame:(CGRect)a3
{
  ICTableSelectionKnob *v3;
  uint64_t v4;
  UIPointerInteraction *pointerInteraction;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICTableSelectionKnob;
  v3 = -[ICTableSelectionKnob initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v3);
    pointerInteraction = v3->_pointerInteraction;
    v3->_pointerInteraction = (UIPointerInteraction *)v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableSelectionKnob setBackgroundColor:](v3, "setBackgroundColor:", v6);

    -[ICTableSelectionKnob pointerInteraction](v3, "pointerInteraction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableSelectionKnob addInteraction:](v3, "addInteraction:", v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel_accessibilityDarkerSystemColorsStatusDidChange_, *MEMORY[0x1E0DC4508], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICTableSelectionKnob;
  -[ICTableSelectionKnob dealloc](&v4, sel_dealloc);
}

- (void)setFrame:(CGRect)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICTableSelectionKnob;
  -[ICTableSelectionKnob setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[ICTableSelectionKnob pointerInteraction](self, "pointerInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (CGRect)circleRect
{
  double v3;
  CGFloat v4;
  double v5;
  CGRect v6;

  -[ICTableSelectionKnob bounds](self, "bounds");
  v4 = v3 * 0.5;
  -[ICTableSelectionKnob bounds](self, "bounds");
  v6.origin.y = v5 * 0.5;
  v6.size.width = 0.0;
  v6.size.height = 0.0;
  v6.origin.x = v4;
  return CGRectInset(v6, -*MEMORY[0x1E0D64A60], -*MEMORY[0x1E0D64A60]);
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  void *v5;
  _BOOL4 v6;
  id v7;
  id v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;

  CurrentContext = UIGraphicsGetCurrentContext();
  -[ICTableSelectionKnob tintColor](self, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICTableSelectionKnob isHovering](self, "isHovering");
  -[ICTableSelectionKnob circleRect](self, "circleRect");
  CGContextAddEllipseInRect(CurrentContext, v9);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v7, "CGColor"));

    CGContextFillPath(CurrentContext);
    -[ICTableSelectionKnob circleRect](self, "circleRect");
    v11 = CGRectInset(v10, 1.0, 1.0);
    CGContextAddEllipseInRect(CurrentContext, v11);
  }
  v8 = objc_retainAutorelease(v5);
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v8, "CGColor"));
  CGContextFillPath(CurrentContext);

}

- (BOOL)isStart
{
  void *v3;
  void *v4;
  ICTableSelectionKnob *v5;
  BOOL v6;

  -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startKnob");
    v5 = (ICTableSelectionKnob *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == self;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEnd
{
  void *v3;
  void *v4;
  ICTableSelectionKnob *v5;
  BOOL v6;

  -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endKnob");
    v5 = (ICTableSelectionKnob *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == self;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  CGRect v6;
  CGRect v7;

  -[ICTableSelectionKnob circleRect](self, "circleRect", a3, a4, a5);
  v7 = CGRectInset(v6, -4.0, -4.0);
  return (id)objc_msgSend(MEMORY[0x1E0DC3B28], "regionWithRect:identifier:", 0, v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  -[ICTableSelectionKnob setHovering:](self, "setHovering:", 1, a4, a5);
  -[ICTableSelectionKnob setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  -[ICTableSelectionKnob setHovering:](self, "setHovering:", 0, a4, a5);
  -[ICTableSelectionKnob setNeedsDisplay](self, "setNeedsDisplay");
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableSelectionKnob frame](self, "frame");
  v8 = v7;
  -[ICTableSelectionKnob circleRect](self, "circleRect");
  v10 = v8 + v9;
  -[ICTableSelectionKnob frame](self, "frame");
  v12 = v11;
  -[ICTableSelectionKnob circleRect](self, "circleRect");
  v14 = v12 + v13;
  -[ICTableSelectionKnob circleRect](self, "circleRect");
  v16 = v15;
  -[ICTableSelectionKnob circleRect](self, "circleRect");
  objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:cornerRadius:", v10, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v6, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (ICTableAttachmentViewController)tableAttachmentViewController
{
  return (ICTableAttachmentViewController *)objc_loadWeakRetained((id *)&self->_tableAttachmentViewController);
}

- (void)setTableAttachmentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_tableAttachmentViewController, a3);
}

- (BOOL)isHovering
{
  return self->_hovering;
}

- (void)setHovering:(BOOL)a3
{
  self->_hovering = a3;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_destroyWeak((id *)&self->_tableAttachmentViewController);
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[ICTableSelectionKnob superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (-[ICTableSelectionKnob isStart](self, "isStart"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("Start selection handle");
  }
  else
  {
    if (!-[ICTableSelectionKnob isEnd](self, "isEnd"))
    {
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICTableSelectionKnob(ICAccessibility_iOS) accessibilityLabel]", 1, 0, CFSTR("Couldn't determine AX label for %@, make sure we have a tableAttachmentViewController set"), self);
      v6 = 0;
      return v6;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("End selection handle");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1EA7E9860, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Double tap and hold, then drag to modify selected cell range."), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICTableSelectionKnob;
  return *MEMORY[0x1E0DC1098] | -[ICTableSelectionKnob accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityContainer
{
  void *v2;
  void *v3;
  void *v4;

  -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableAXController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC33F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Speak current selection"), &stru_1EA7E9860, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:target:selector:", v5, self, sel_speakCurrentSelectionAXAction);

  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_accessibilityHasTextOperations
{
  return 1;
}

- (id)_accessibilityTextOperations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  unsigned __int8 v22;
  __int16 v23;
  __int16 v24;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v23 = 0;
  v22 = 0;
  -[ICTableSelectionKnob getBoldForSelection:italic:underline:strikethrough:rightToLeft:](self, "getBoldForSelection:italic:underline:strikethrough:rightToLeft:", (char *)&v24 + 1, &v24, (char *)&v23 + 1, &v23, &v22);
  if (HIBYTE(v24))
    -[ICTableSelectionKnob axMakeNotBoldString](self, "axMakeNotBoldString");
  else
    -[ICTableSelectionKnob axMakeBoldString](self, "axMakeBoldString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_BYTE)v24)
    -[ICTableSelectionKnob axMakeNotItalicString](self, "axMakeNotItalicString");
  else
    -[ICTableSelectionKnob axMakeItalicString](self, "axMakeItalicString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (HIBYTE(v23))
    -[ICTableSelectionKnob axMakeNotUnderlinedString](self, "axMakeNotUnderlinedString");
  else
    -[ICTableSelectionKnob axMakeUnderlinedString](self, "axMakeUnderlinedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_BYTE)v23)
    -[ICTableSelectionKnob axMakeNotStrikethroughString](self, "axMakeNotStrikethroughString");
  else
    -[ICTableSelectionKnob axMakeStrikethroughString](self, "axMakeStrikethroughString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    -[ICTableSelectionKnob axLeftToRightString](self, "axLeftToRightString");
  else
    -[ICTableSelectionKnob axRightToLeftString](self, "axRightToLeftString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "canPerformAction:withSender:", sel_cut_, self);

  if (v10)
  {
    -[ICTableSelectionKnob axCutString](self, "axCutString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "canPerformAction:withSender:", sel_copy_, self);

  if (v13)
  {
    -[ICTableSelectionKnob axCopyString](self, "axCopyString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "canPerformAction:withSender:", sel_paste_, self);

  if (v16)
  {
    -[ICTableSelectionKnob axPasteString](self, "axPasteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  objc_msgSend(v3, "addObject:", v4);
  objc_msgSend(v3, "addObject:", v5);
  objc_msgSend(v3, "addObject:", v6);
  objc_msgSend(v3, "addObject:", v7);
  v17 = v22;
  if (!v22)
    goto LABEL_28;
  -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "canPerformAction:withSender:", sel_makeTextWritingDirectionLeftToRight_, 0))
  {

    goto LABEL_30;
  }
  if (v22)
  {

  }
  else
  {
LABEL_28:
    -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "canPerformAction:withSender:", sel_makeTextWritingDirectionRightToLeft_, 0);

    if (!v17)
    {
      if (!v19)
        goto LABEL_31;
      goto LABEL_30;
    }

    if ((v19 & 1) != 0)
LABEL_30:
      objc_msgSend(v3, "addObject:", v8);
  }
LABEL_31:
  v20 = (void *)objc_msgSend(v3, "copy");

  return v20;
}

- (void)_accessibilityTextOperationAction:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  id v27;

  v27 = a3;
  -[ICTableSelectionKnob axCutString](self, "axCutString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v27, "isEqualToString:", v4);

  if (v5)
  {
    -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cut:", self);
    goto LABEL_23;
  }
  -[ICTableSelectionKnob axCopyString](self, "axCopyString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v27, "isEqualToString:", v7);

  if (v8)
  {
    -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "copy:", self);
    goto LABEL_23;
  }
  -[ICTableSelectionKnob axPasteString](self, "axPasteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v27, "isEqualToString:", v9);

  if (v10)
  {
    -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paste:", self);
    goto LABEL_23;
  }
  -[ICTableSelectionKnob axMakeNotBoldString](self, "axMakeNotBoldString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "isEqualToString:", v11))
  {

LABEL_10:
    -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toggleBoldface:", self);
    goto LABEL_23;
  }
  -[ICTableSelectionKnob axMakeBoldString](self, "axMakeBoldString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v27, "isEqualToString:", v12);

  if (v13)
    goto LABEL_10;
  -[ICTableSelectionKnob axMakeNotItalicString](self, "axMakeNotItalicString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "isEqualToString:", v14))
  {

LABEL_14:
    -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toggleItalics:", self);
    goto LABEL_23;
  }
  -[ICTableSelectionKnob axMakeItalicString](self, "axMakeItalicString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v27, "isEqualToString:", v15);

  if (v16)
    goto LABEL_14;
  -[ICTableSelectionKnob axMakeNotUnderlinedString](self, "axMakeNotUnderlinedString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "isEqualToString:", v17))
  {

LABEL_18:
    -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toggleUnderline:", self);
    goto LABEL_23;
  }
  -[ICTableSelectionKnob axMakeUnderlinedString](self, "axMakeUnderlinedString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v27, "isEqualToString:", v18);

  if (v19)
    goto LABEL_18;
  -[ICTableSelectionKnob axMakeNotStrikethroughString](self, "axMakeNotStrikethroughString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "isEqualToString:", v20))
  {

LABEL_22:
    -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toggleStrikethrough:", self);
    goto LABEL_23;
  }
  -[ICTableSelectionKnob axMakeStrikethroughString](self, "axMakeStrikethroughString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v27, "isEqualToString:", v21);

  if (v22)
    goto LABEL_22;
  -[ICTableSelectionKnob axLeftToRightString](self, "axLeftToRightString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v27, "isEqualToString:", v23);

  if (v24)
  {
    -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "makeTextWritingDirectionLeftToRight:", self);
  }
  else
  {
    -[ICTableSelectionKnob axRightToLeftString](self, "axRightToLeftString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v27, "isEqualToString:", v25);

    if (!v26)
      goto LABEL_24;
    -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "makeTextWritingDirectionRightToLeft:", self);
  }
LABEL_23:

LABEL_24:
}

- (void)getBoldForSelection:(BOOL *)a3 italic:(BOOL *)a4 underline:(BOOL *)a5 strikethrough:(BOOL *)a6 rightToLeft:(BOOL *)a7
{
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD v19[5];

  -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "auxiliaryStylingController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "selectedStyleBIUS");

  *a3 = v15 & 1;
  *a4 = (v15 & 2) != 0;
  *a5 = (v15 & 4) != 0;
  *a6 = (v15 & 8) != 0;
  -[ICTableSelectionKnob aggregatedAttributedTextForCellRangeSelection](self, "aggregatedAttributedTextForCellRangeSelection");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  *a7 = 1;
  v16 = *MEMORY[0x1E0D63928];
  v17 = objc_msgSend(v18, "length");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __108__ICTableSelectionKnob_ICAccessibility_iOS__getBoldForSelection_italic_underline_strikethrough_rightToLeft___block_invoke;
  v19[3] = &__block_descriptor_40_e27_v40__0_8__NSRange_QQ_16_B32l;
  v19[4] = a7;
  objc_msgSend(v18, "enumerateAttribute:inRange:options:usingBlock:", v16, 0, v17, 0, v19);

}

void __108__ICTableSelectionKnob_ICAccessibility_iOS__getBoldForSelection_italic_underline_strikethrough_rightToLeft___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  id v8;

  if (a2)
  {
    v7 = a2;
    objc_opt_class();
    ICDynamicCast();
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "writingDirection") != 1)
    {
      **(_BYTE **)(a1 + 32) = 0;
      *a5 = 1;
    }

  }
}

- (id)aggregatedAttributedTextForCellRangeSelection
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "columns");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tableSelection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rows");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v8;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v25)
  {
    v23 = *(_QWORD *)v32;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(obj);
        v26 = v9;
        v10 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v9);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v11 = v24;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v28;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v28 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v15);
              -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "tableAXController");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "attributedContentStringForColumnID:rowID:", v16, v10);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v19, "length"))
                objc_msgSend(v3, "appendAttributedString:", v19);

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v13);
        }

        v9 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v25);
  }

  v20 = (void *)objc_msgSend(v3, "copy");
  return v20;
}

- (BOOL)speakCurrentSelectionAXAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableAXController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableSelectionKnob tableAttachmentViewController](self, "tableAttachmentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speakCellRangeSelection:", v6);

  return 1;
}

- (id)axCutString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Cut"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)axCopyString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Copy"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)axPasteString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Paste"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)axRightToLeftString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Set right to left"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)axLeftToRightString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("set left to right"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)axMakeBoldString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Set bold"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)axMakeNotBoldString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Set not bold"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)axMakeItalicString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Set italic"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)axMakeNotItalicString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Set not italic"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)axMakeUnderlinedString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Set underline"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)axMakeNotUnderlinedString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Set not underline"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)axMakeStrikethroughString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Set strike-through"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)axMakeNotStrikethroughString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Set not strike-through"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
