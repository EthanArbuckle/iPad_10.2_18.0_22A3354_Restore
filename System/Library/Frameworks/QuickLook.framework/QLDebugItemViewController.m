@implementation QLDebugItemViewController

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject **v11;
  NSObject *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *selectorToCount;
  UITextView *v15;
  UITextView *logTextView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *topConstraint;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *bottomConstraint;
  void *v32;
  void *v33;
  UITextView *v34;
  void *v35;
  void *v36;
  void *v37;
  int IsExtension;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  UITextView *v42;
  uint8_t buf[4];
  QLDebugItemViewController *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = (NSObject **)MEMORY[0x24BE7BF48];
  v12 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v12 = *v11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v44 = self;
    _os_log_impl(&dword_20D4F5000, v12, OS_LOG_TYPE_DEFAULT, "A Debug Item View Controller was instantiated: %p #DebugItemViewController", buf, 0xCu);
  }
  v13 = (NSMutableDictionary *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  selectorToCount = self->_selectorToCount;
  self->_selectorToCount = v13;

  v15 = (UITextView *)objc_opt_new();
  logTextView = self->_logTextView;
  self->_logTextView = v15;

  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_logTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextView setEditable:](self->_logTextView, "setEditable:", 0);
  -[UITextView setSelectable:](self->_logTextView, "setSelectable:", 1);
  -[UITextView setScrollEnabled:](self->_logTextView, "setScrollEnabled:", 1);
  -[QLDebugItemViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", self->_logTextView);

  -[UITextView topAnchor](self->_logTextView, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLDebugItemViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLItemViewController appearance](self, "appearance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topInset");
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ql_activatedConstraint");
  v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topConstraint = self->_topConstraint;
  self->_topConstraint = v23;

  -[QLDebugItemViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView bottomAnchor](self->_logTextView, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLItemViewController appearance](self, "appearance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomInset");
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "ql_activatedConstraint");
  v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  bottomConstraint = self->_bottomConstraint;
  self->_bottomConstraint = v30;

  -[QLDebugItemViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x24BDD1628];
  v34 = self->_logTextView;
  v41 = CFSTR("textView");
  v42 = v34;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[textView]|"), 0, 0, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addConstraints:", v36);

  v37 = (void *)MEMORY[0x24BDD17C8];
  IsExtension = _UIApplicationIsExtension();
  v39 = CFSTR("NO");
  if (IsExtension)
    v39 = CFSTR("YES");
  objc_msgSend(v37, "stringWithFormat:", CFSTR("Running remote: %@"), v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLDebugItemViewController _addLog:logLevel:](self, "_addLog:logLevel:", v40, 3);

  v10[2](v10, 0);
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD aBlock[5];
  objc_super v19;

  v4 = a4;
  v19.receiver = self;
  v19.super_class = (Class)QLDebugItemViewController;
  v7 = a3;
  -[QLItemViewController setAppearance:animated:](&v19, sel_setAppearance_animated_, v7, v4);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__QLDebugItemViewController_setAppearance_animated___block_invoke;
  aBlock[3] = &unk_24C724B00;
  aBlock[4] = self;
  v8 = _Block_copy(aBlock);
  v9 = v8;
  if (v4)
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v8, 0.2);
  else
    (*((void (**)(void *))v8 + 2))(v8);
  v10 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topInset");
  v13 = v12;
  objc_msgSend(v7, "bottomInset");
  v15 = v14;
  v16 = objc_msgSend(v7, "presentationMode");

  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: %f, %f, %ld"), v11, v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLDebugItemViewController _addLog:logLevel:](self, "_addLog:logLevel:", v17, 0);

}

void __52__QLDebugItemViewController_setAppearance_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "appearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topInset");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "setConstant:");

  objc_msgSend(*(id *)(a1 + 32), "appearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomInset");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "setConstant:");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (BOOL)canSwipeToDismiss
{
  return 0;
}

- (BOOL)canPinchToDismiss
{
  return 0;
}

- (BOOL)canEnterFullScreen
{
  return 0;
}

- (void)previewWillAppear:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)QLDebugItemViewController;
  -[QLItemViewController previewWillAppear:](&v8, sel_previewWillAppear_, a3);
  -[QLDebugItemViewController _encounterMethodCall:](self, "_encounterMethodCall:", a2);
  v9 = CFSTR("previewItemName");
  -[QLItemViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  QLNotifySelector(a2, v7);

}

- (void)previewIsAppearingWithProgress:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLDebugItemViewController;
  -[QLItemViewController previewIsAppearingWithProgress:](&v5, sel_previewIsAppearingWithProgress_, a3);
  -[QLDebugItemViewController _encounterMethodCall:](self, "_encounterMethodCall:", a2);
}

- (void)previewWillFinishAppearing
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLDebugItemViewController;
  -[QLItemViewController previewWillFinishAppearing](&v4, sel_previewWillFinishAppearing);
  -[QLDebugItemViewController _encounterMethodCall:](self, "_encounterMethodCall:", a2);
}

- (void)previewDidAppear:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)QLDebugItemViewController;
  -[QLItemViewController previewDidAppear:](&v8, sel_previewDidAppear_, a3);
  -[QLDebugItemViewController _encounterMethodCall:](self, "_encounterMethodCall:", a2);
  v9 = CFSTR("previewItemName");
  -[QLItemViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  QLNotifySelector(a2, v7);

}

- (void)previewWillDisappear:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)QLDebugItemViewController;
  -[QLItemViewController previewWillDisappear:](&v8, sel_previewWillDisappear_, a3);
  -[QLDebugItemViewController _encounterMethodCall:](self, "_encounterMethodCall:", a2);
  v9 = CFSTR("previewItemName");
  -[QLItemViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  QLNotifySelector(a2, v7);

}

- (void)previewDidDisappear:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)QLDebugItemViewController;
  -[QLItemViewController previewDidDisappear:](&v8, sel_previewDidDisappear_, a3);
  -[QLDebugItemViewController _encounterMethodCall:](self, "_encounterMethodCall:", a2);
  -[QLDebugItemViewController _addLog:logLevel:](self, "_addLog:logLevel:", CFSTR("\n---\n"), 3);
  v9 = CFSTR("previewItemName");
  -[QLItemViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  QLNotifySelector(a2, v7);

}

- (void)_encounterMethodCall:(SEL)a3
{
  -[QLDebugItemViewController _encounterMethodCall:animatedValue:](self, "_encounterMethodCall:animatedValue:", a3, 0);
}

- (void)_encounterMethodCall:(SEL)a3 animatedValue:(unint64_t)a4
{
  void *v5;
  void *v6;
  unint64_t v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  id v11;

  NSStringFromSelector(a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_selectorToCount, "objectForKeyedSubscript:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &unk_24C749360;
  v7 = objc_msgSend(v5, "integerValue") + 1;
  v8 = v7 > 1;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_selectorToCount, "setObject:forKeyedSubscript:", v9, v11);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ #(%ld)"), v11, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLDebugItemViewController _addLog:logLevel:](self, "_addLog:logLevel:", v10, 2 * v8);

}

- (void)_addLog:(id)a3 logLevel:(unint64_t)a4
{
  UITextView *logTextView;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  logTextView = self->_logTextView;
  v7 = a3;
  -[UITextView attributedText](logTextView, "attributedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x24BDD1458]);
  -[QLDebugItemViewController _attributesForLogLevel:](self, "_attributesForLogLevel:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithString:attributes:", v9, v11);

  objc_msgSend(v13, "appendAttributedString:", v12);
  -[UITextView setAttributedText:](self->_logTextView, "setAttributedText:", v13);
  -[UITextView scrollRangeToVisible:](self->_logTextView, "scrollRangeToVisible:", objc_msgSend(v13, "length") - 1, 1);

}

- (id)_attributesForLogLevel:(unint64_t)a3
{
  void *v4;
  int v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v11[0] = *MEMORY[0x24BEBB368];
  switch(a3)
  {
    case 2uLL:
      objc_msgSend(MEMORY[0x24BEBD4B8], "redColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 0;
      v6 = 0;
      v7 = 0;
      break;
    case 3uLL:
      objc_msgSend(MEMORY[0x24BEBD4B8], "greenColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 0;
      v7 = 0;
      v6 = 1;
      break;
    case 1uLL:
      objc_msgSend(MEMORY[0x24BEBD4B8], "yellowColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      v7 = 0;
      v5 = 1;
      break;
    default:
      objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 0;
      v6 = 0;
      v7 = 1;
      break;
  }
  v12[0] = v4;
  v11[1] = *MEMORY[0x24BEBB360];
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {

    if (!v6)
    {
LABEL_10:
      if (!v5)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if (!v6)
  {
    goto LABEL_10;
  }

  if (v5)
LABEL_11:

LABEL_12:
  if (a3 == 2)

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_selectorToCount, 0);
  objc_storeStrong((id *)&self->_logTextView, 0);
}

@end
