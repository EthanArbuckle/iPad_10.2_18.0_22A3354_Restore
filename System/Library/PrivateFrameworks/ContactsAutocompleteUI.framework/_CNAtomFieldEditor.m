@implementation _CNAtomFieldEditor

- (_CNAtomFieldEditor)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  _CNAtomFieldEditor *v4;
  _CNAtomFieldEditor *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_CNAtomFieldEditor;
  v4 = -[_CNAtomFieldEditor initWithFrame:textContainer:](&v9, sel_initWithFrame_textContainer_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[_CNAtomFieldEditor setClipsToBounds:](v4, "setClipsToBounds:", 0);
    -[_CNAtomFieldEditor textContainer](v5, "textContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLineFragmentPadding:", 3.0);

    -[_CNAtomFieldEditor textContainer](v5, "textContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMaximumNumberOfLines:", 1);

    -[_CNAtomFieldEditor setTextContainerInset:](v5, "setTextContainerInset:", 3.0, 0.0, 3.0, 0.0);
  }
  return v5;
}

- (id)_enclosingScrollView
{
  void *v2;
  uint64_t v3;

  -[_CNAtomFieldEditor superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v2, "superview");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (id)textInputTraits
{
  void *v2;
  void *v3;

  -[_CNAtomFieldEditor _hostView](self, "_hostView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)convertGlyphRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_CNAtomFieldEditor textContainerInset](self, "textContainerInset");
  v9 = x + v8;
  -[_CNAtomFieldEditor textContainerInset](self, "textContainerInset");
  v11 = y + v10;
  v12 = v9;
  v13 = width;
  v14 = height;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v11;
  result.origin.x = v12;
  return result;
}

- (id)undoManager
{
  void *v2;
  void *v3;

  -[_CNAtomFieldEditor _hostView](self, "_hostView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  objc_super v14;

  v6 = a4;
  if (sel_paste_ == a3)
  {
    objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CNAtomFieldEditor _hostView](self, "_hostView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_supportedPasteboardTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v9, "containsPasteboardTypes:inItemSet:", v11, 0);
  }
  else if (sel__define_ == a3 || sel__share_ == a3 || sel__lookup_ == a3)
  {
    v12 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_CNAtomFieldEditor;
    v12 = -[_CNAtomFieldEditor canPerformAction:withSender:](&v14, sel_canPerformAction_withSender_, a3, v6);
  }

  return v12;
}

- (void)cut:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  -[_CNAtomFieldEditor copy:](self, "copy:", a3);
  -[_CNAtomFieldEditor _hostView](self, "_hostView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[_CNAtomFieldEditor selectedRange](self, "selectedRange");
  objc_msgSend(v6, "_removeRepresentedObjectsInCharacterRange:", v4, v5);

}

- (void)copy:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[_CNAtomFieldEditor _hostView](self, "_hostView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedRepresentedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_storeRepresentedObjects:onPasteboard:", v3, v4);

  }
}

- (void)paste:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  -[_CNAtomFieldEditor _hostView](self, "_hostView", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_representedObjectsFromPasteboard:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = -[_CNAtomFieldEditor selectedRange](self, "selectedRange");
    objc_msgSend(v8, "_insertRepresentedObjects:atCharacterRange:", v5, v6, v7);
  }

}

- (id)selectionRectsForRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  objc_super v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNAtomFieldEditor beginningOfDocument](self, "beginningOfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_CNAtomFieldEditor offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v6, v7);
  objc_msgSend(v4, "start");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_CNAtomFieldEditor offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v9, v10);

  v12 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __45___CNAtomFieldEditor_selectionRectsForRange___block_invoke;
  v27[3] = &unk_1E62BF528;
  v13 = v5;
  v28 = v13;
  v14 = (void *)MEMORY[0x1B5E16810](v27);
  -[_CNAtomFieldEditor textStorage](self, "textStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __45___CNAtomFieldEditor_selectionRectsForRange___block_invoke_2;
  v22[3] = &unk_1E62BF590;
  v25 = v8;
  v26 = v11;
  v22[4] = self;
  v16 = v14;
  v24 = v16;
  v17 = v13;
  v23 = v17;
  objc_msgSend(v15, "enumerateAttributesInRange:options:usingBlock:", v8, v11, 0, v22);

  if (objc_msgSend(v17, "count"))
  {
    v18 = v17;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)_CNAtomFieldEditor;
    -[_CNAtomFieldEditor selectionRectsForRange:](&v21, sel_selectionRectsForRange_, v4);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;

  return v19;
}

- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  id v10;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_CNAtomFieldEditor _enclosingScrollView](self, "_enclosingScrollView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertRect:fromView:", self, x, y, width, height);
  objc_msgSend(v10, "scrollRectToVisible:animated:", v4);

}

- (CGRect)_rectForScrollToVisible:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect result;
  CGRect v30;

  length = a3.length;
  location = a3.location;
  -[_CNAtomFieldEditor layoutManager](self, "layoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNAtomFieldEditor textContainer](self, "textContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNAtomFieldEditor textStorage](self, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (location + length > v9)
  {
    -[_CNAtomFieldEditor textStorage](self, "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    location = objc_msgSend(v10, "length") - 1;
    length = 1;

  }
  v11 = objc_msgSend(v6, "glyphRangeForCharacterRange:actualCharacterRange:", location, length, 0);
  objc_msgSend(v6, "boundingRectForGlyphRange:inTextContainer:", v11, v12, v7);
  -[_CNAtomFieldEditor textContainerInset](self, "textContainerInset");
  -[UIView cnaui_currentScreenScale](self, "cnaui_currentScreenScale");
  UIRectIntegralWithScale();
  v26 = CGRectInset(v25, -5.0, 0.0);
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  -[_CNAtomFieldEditor bounds](self, "bounds");
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v28 = CGRectIntersection(v27, v30);
  v17 = v28.origin.x;
  v18 = v28.origin.y;
  v19 = v28.size.width;
  v20 = v28.size.height;

  v21 = v17;
  v22 = v18;
  v23 = v19;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

@end
