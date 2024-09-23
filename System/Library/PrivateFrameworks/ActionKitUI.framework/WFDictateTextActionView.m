@implementation WFDictateTextActionView

- (WFDictateTextActionView)initWithFrame:(CGRect)a3
{
  return -[WFDictateTextActionView initWithFrame:padded:](self, "initWithFrame:padded:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (WFDictateTextActionView)initWithFrame:(CGRect)a3 padded:(BOOL)a4
{
  _BOOL4 v4;
  WFDictateTextActionView *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  WFDictateTextActionView *v26;
  objc_super v28;
  uint64_t v29;
  _QWORD v30[2];

  v4 = a4;
  v30[1] = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)WFDictateTextActionView;
  v5 = -[WFDictateTextActionView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BEBDA88]);
    objc_msgSend(v6, "setEditable:", 0);
    v7 = objc_alloc(MEMORY[0x24BDD1458]);
    WFLocalizedString(CFSTR("Now listening…"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x24BEBB368];
    objc_msgSend(MEMORY[0x24BEBD4B8], "placeholderTextColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "initWithString:attributes:", v8, v10);
    objc_msgSend(v6, "setAttributedPlaceholder:", v11);

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v12);

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v13);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v14);

    objc_msgSend(v6, "setTextContainerInset:", 8.0, 8.0, 8.0, 8.0);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFDictateTextActionView addSubview:](v5, "addSubview:", v6);
    -[WFDictateTextActionView setTextView:](v5, "setTextView:", v6);
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v15, "addTarget:action:forControlEvents:", v5, sel_stopButtonTapped, 64);
    objc_msgSend(v15, "setRecording:animated:", 1, 0);
    -[WFDictateTextActionView addSubview:](v5, "addSubview:", v15);
    -[WFDictateTextActionView setStopButton:](v5, "setStopButton:", v15);
    v16 = !v4;
    if (v4)
      v17 = CFSTR("H:|-8-[textView]-8-|");
    else
      v17 = CFSTR("H:|[textView]|");
    v18 = CFSTR("V:|[textView]-10-[stopButton(50)]-|");
    if (!v16)
      v18 = CFSTR("V:|-8-[textView]-10-[stopButton(50)]-16-|");
    v19 = v18;
    v20 = v17;
    _NSDictionaryOfVariableBindings(CFSTR("textView, stopButton"), v6, v15, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", v19, 512, 0, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "addObjectsFromArray:", v23);
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", v20, 0, 0, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "addObjectsFromArray:", v24);
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 7, 0, 0, 0, 1.0, 50.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v25);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v22);
    v26 = v5;

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDB1728], 0);

  v4.receiver = self;
  v4.super_class = (Class)WFDictateTextActionView;
  -[WFDictateTextActionView dealloc](&v4, sel_dealloc);
}

- (void)stopButtonTapped
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  -[WFDictateTextActionView stopButton](self, "stopButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  -[WFDictateTextActionView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFDictateTextActionView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictateTextActionViewDidTapStopButton:", self);

  }
}

- (void)updateWithTranscription:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[WFDictateTextActionView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[WFDictateTextActionView textView](self, "textView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "length");

  objc_msgSend(v7, "scrollRangeToVisible:", v6, 0);
}

- (WFDictateTextActionViewDelegate)delegate
{
  return (WFDictateTextActionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITextView)textView
{
  return (UITextView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (void)setTextView:(id)a3
{
  objc_storeWeak((id *)&self->_textView, a3);
}

- (WFDictateTextActionStopButton)stopButton
{
  return (WFDictateTextActionStopButton *)objc_loadWeakRetained((id *)&self->_stopButton);
}

- (void)setStopButton:(id)a3
{
  objc_storeWeak((id *)&self->_stopButton, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stopButton);
  objc_destroyWeak((id *)&self->_textView);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
