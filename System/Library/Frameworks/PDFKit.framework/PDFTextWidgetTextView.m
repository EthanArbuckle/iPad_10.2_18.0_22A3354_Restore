@implementation PDFTextWidgetTextView

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", CFSTR("\t"), 0, sel_handleTab);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", CFSTR("\t"), 0x20000, sel_handleBackTab);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)handleTab
{
  id v2;

  -[PDFTextWidgetTextView delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "handleTab");

}

- (void)handleBackTab
{
  id v2;

  -[PDFTextWidgetTextView delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "handleBackTab");

}

- (void)insertTextSuggestion:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  const void *v10;
  _QWORD *v11;
  id v12;
  id v13;
  __CFRunLoop *Main;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __64__PDFTextWidgetTextView_insertTextSuggestion_completionHandler___block_invoke;
  v15[3] = &unk_24C25D438;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v9 = v15;
  v10 = (const void *)*MEMORY[0x24BDBD598];
  v11 = v9;
  v12 = v7;
  v13 = v6;
  Main = CFRunLoopGetMain();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __PDFMainRunLoopPerformBlockInModes_block_invoke;
  block[3] = &unk_24C25D4B0;
  v19 = v11;
  CFRunLoopPerformBlock(Main, v10, block);
  if (CFRunLoopGetCurrent() != Main)
    CFRunLoopWakeUp(Main);

}

void __64__PDFTextWidgetTextView_insertTextSuggestion_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "insertTextSuggestion:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)autoFillDidInsertWithExplicitInvocationMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PDFTextWidgetTextView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "autoFillDidInsertWithExplicitInvocationMode:", v3);

}

- (id)accessibilityParent
{
  void *v2;
  void *v3;

  -[PDFTextWidgetTextView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "accessibilityParent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PDFTextWidgetTextView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "accessibilityLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)accessibilityTitleUIElement
{
  void *v2;
  void *v3;

  -[PDFTextWidgetTextView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "accessibilityTitleUIElement");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
