@implementation EMKOverlayView

- (EMKOverlayView)initWithView:(id)a3 anchorRect:(CGRect)a4 emojiTokenList:(id)a5 selectionHandler:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  EMKOverlayView *v29;
  double v30;
  double v31;
  unint64_t v32;
  unint64_t v33;
  EMKEmojiTokenList *v34;
  EMKEmojiTokenList *emojiTokenList;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  void *v39;
  id selectionHandler;
  void *v41;
  objc_super v43;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = v13;
  objc_msgSend(v16, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v16;
  if (v17)
  {
    v19 = v16;
    do
    {
      objc_msgSend(v19, "superview");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "superview");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v18;
    }
    while (v20);
  }
  objc_msgSend(v18, "convertRect:fromView:", v16, x, y, width, height);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v18, "bounds");
    v43.receiver = self;
    v43.super_class = (Class)EMKOverlayView;
    v29 = -[EMKOverlayView initWithFrame:](&v43, sel_initWithFrame_);
    self = v29;
    if (v29)
    {
      -[EMKOverlayView bounds](v29, "bounds");
      v31 = v30;
      v32 = objc_msgSend(v14, "count");
      v33 = vcvtmd_u64_f64((v31 + -4.0 + -20.0 + -32.0) / 40.0);
      if ((double)v32 * 36.0 + 20.0 + (double)(v32 + 1) * 4.0 + 32.0 <= v31)
        v33 = v32;
      if (v33 <= 1)
        v33 = 1;
      if (v33 >= v32)
        v33 = v32;
      if (v33 >= 8)
        v33 = 8;
      self->_numEmojiToShow = v33;
      v34 = (EMKEmojiTokenList *)objc_msgSend(v14, "copy");
      emojiTokenList = self->_emojiTokenList;
      self->_emojiTokenList = v34;

      self->_overlayRect.origin.x = overlayRectRelativeToRect(self->_numEmojiToShow, v22, v24, v26, v28, v31);
      self->_overlayRect.origin.y = v36;
      self->_overlayRect.size.width = v37;
      self->_overlayRect.size.height = v38;
      self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
      v39 = (void *)objc_msgSend(v15, "copy");
      selectionHandler = self->_selectionHandler;
      self->_selectionHandler = v39;

      objc_msgSend(v16, "traitCollection");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      self->_interfaceStyle = objc_msgSend(v41, "userInterfaceStyle");

      -[EMKOverlayView setOpaque:](self, "setOpaque:", 0);
      objc_msgSend(v18, "addSubview:", self);
      objc_msgSend(v18, "bringSubviewToFront:", self);
    }
  }

  return self;
}

- (void)setView:(id)a3 anchorRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t numEmojiToShow;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  id v23;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[EMKOverlayView superview](self, "superview");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "convertRect:fromView:", v9, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  objc_msgSend(v23, "bounds");
  -[EMKOverlayView setFrame:](self, "setFrame:");
  numEmojiToShow = self->_numEmojiToShow;
  -[EMKOverlayView bounds](self, "bounds");
  self->_overlayRect.origin.x = overlayRectRelativeToRect(numEmojiToShow, v11, v13, v15, v17, v19);
  self->_overlayRect.origin.y = v20;
  self->_overlayRect.size.width = v21;
  self->_overlayRect.size.height = v22;
  -[EMKOverlayView setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)drawBackground:(CGRect)a3
{
  CGContext *CurrentContext;
  void *v5;
  void *v6;
  unint64_t selectedIndex;
  void *v8;
  id v9;
  CGSize v10;
  CGSize v11;

  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", self->_overlayRect.origin.x, self->_overlayRect.origin.y, self->_overlayRect.size.width, self->_overlayRect.size.height, 9.0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLineWidth:", 0.2);
  v10.width = 0.0;
  v10.height = 5.0;
  CGContextSetShadow(CurrentContext, v10, 7.0);
  if (self->_interfaceStyle == 2)
    darkBackgroundColor();
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set");

  objc_msgSend(v9, "fill");
  v11.width = 0.0;
  v11.height = 0.0;
  CGContextSetShadowWithColor(CurrentContext, v11, 0.0, 0);
  if (self->_interfaceStyle == 2)
    darkBackgroundColor();
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "lightGrayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set");

  objc_msgSend(v9, "stroke");
  selectedIndex = self->_selectedIndex;
  if (selectedIndex < self->_numEmojiToShow)
  {
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", (double)selectedIndex * 36.0 + 10.0 + (double)(selectedIndex + 1) * 4.0 + self->_overlayRect.origin.x, self->_overlayRect.origin.y + 6.0, 36.0, 43.0, 6.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (selectionColor_onceToken != -1)
      dispatch_once(&selectionColor_onceToken, &__block_literal_global_33);
    objc_msgSend((id)selectionColor_color, "set");
    objc_msgSend(v8, "fill");

  }
}

- (void)drawForeground:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 32.0, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set");

  if (self->_numEmojiToShow)
  {
    v7 = 0;
    do
    {
      v8 = v7 + 1;
      v9 = (double)v7 * 36.0 + 10.0 + (double)(v7 + 1) * 4.0 + self->_overlayRect.origin.x + 1.0;
      v10 = self->_overlayRect.origin.y + 6.0 + 2.0;
      -[EMKEmojiTokenList emojiTokenAtIndex:](self->_emojiTokenList, "emojiTokenAtIndex:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "string");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "drawInRect:withAttributes:", v5, v9, v10, 36.0, 43.0);

      v7 = v8;
    }
    while (v8 < self->_numEmojiToShow);
  }

}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[EMKOverlayView drawBackground:](self, "drawBackground:");
  -[EMKOverlayView drawForeground:](self, "drawForeground:", x, y, width, height);
}

- (void)dismissWithSelectedEmojiToken:(id)a3
{
  (*((void (**)(void))self->_selectionHandler + 2))();
  -[EMKOverlayView removeFromSuperview](self, "removeFromSuperview");
}

- (void)dismiss
{
  -[EMKOverlayView dismissWithSelectedEmojiToken:](self, "dismissWithSelectedEmojiToken:", 0);
}

- (void)selectWithEvent:(id)a3
{
  void *v4;
  void *v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  unint64_t v9;
  id v10;
  CGPoint v11;

  objc_msgSend(a3, "touchesForView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v10;
  if (v10)
  {
    objc_msgSend(v10, "locationInView:", self);
    v7 = v6;
    v11.y = v8;
    self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    v11.x = v6;
    if (CGRectContainsPoint(self->_overlayRect, v11))
    {
      v9 = vcvtmd_u64_f64((v7 - self->_overlayRect.origin.x + -10.0 + -2.0) / 40.0);
      if ((v9 & 0x8000000000000000) == 0 && self->_numEmojiToShow > v9)
        self->_selectedIndex = v9;
    }
    -[EMKOverlayView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v10;
  }

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[EMKOverlayView selectWithEvent:](self, "selectWithEvent:", a4);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  -[EMKOverlayView selectWithEvent:](self, "selectWithEvent:", a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  unint64_t v9;
  void *v10;
  id v11;
  CGPoint v12;

  objc_msgSend(a4, "touchesForView:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "locationInView:", self);
  v7 = v6;
  v12.y = v8;
  v12.x = v6;
  if (!CGRectContainsPoint(self->_overlayRect, v12)
    || (v9 = vcvtmd_u64_f64((v7 - self->_overlayRect.origin.x + -10.0 + -2.0) / 40.0), (v9 & 0x8000000000000000) != 0)
    || self->_numEmojiToShow <= v9)
  {
    v10 = 0;
  }
  else
  {
    -[EMKEmojiTokenList emojiTokenAtIndex:](self->_emojiTokenList, "emojiTokenAtIndex:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[EMKOverlayView dismissWithSelectedEmojiToken:](self, "dismissWithSelectedEmojiToken:", v10);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_emojiTokenList, 0);
}

@end
