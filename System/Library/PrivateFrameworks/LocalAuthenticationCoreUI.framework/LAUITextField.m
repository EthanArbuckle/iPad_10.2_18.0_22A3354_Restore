@implementation LAUITextField

- (CGRect)caretRectForPosition:(id)a3
{
  id v4;
  double v5;
  double v6;
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
  objc_super v17;
  CGRect result;

  v4 = a3;
  if (-[LAUITextField shouldHideSelectionRects](self, "shouldHideSelectionRects"))
  {
    v5 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)LAUITextField;
    -[LAUITextField caretRectForPosition:](&v17, sel_caretRectForPosition_, v4);
    v5 = v9;
    v6 = v10;
    v7 = v11;
    v8 = v12;
  }

  v13 = v5;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if (-[LAUITextField shouldHideSelectionRects](self, "shouldHideSelectionRects"))
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)LAUITextField;
    -[LAUITextField selectionRectsForRange:](&v7, sel_selectionRectsForRange_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a4;
  if (-[LAUITextField shouldHideEditMenu](self, "shouldHideEditMenu"))
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)LAUITextField;
    v7 = -[LAUITextField canPerformAction:withSender:](&v9, sel_canPerformAction_withSender_, a3, v6);
  }

  return v7;
}

- (id)inputAssistantItem
{
  void *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LAUITextField;
  -[LAUITextField inputAssistantItem](&v5, sel_inputAssistantItem);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDBD1A8];
  objc_msgSend(v2, "setLeadingBarButtonGroups:", MEMORY[0x24BDBD1A8]);
  objc_msgSend(v2, "setTrailingBarButtonGroups:", v3);
  return v2;
}

- (BOOL)shouldHideSelectionRects
{
  return self->_shouldHideSelectionRects;
}

- (void)setShouldHideSelectionRects:(BOOL)a3
{
  self->_shouldHideSelectionRects = a3;
}

- (BOOL)shouldHideEditMenu
{
  return self->_shouldHideEditMenu;
}

- (void)setShouldHideEditMenu:(BOOL)a3
{
  self->_shouldHideEditMenu = a3;
}

@end
