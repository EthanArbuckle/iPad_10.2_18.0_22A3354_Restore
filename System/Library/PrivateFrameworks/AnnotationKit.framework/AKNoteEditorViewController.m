@implementation AKNoteEditorViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AKNoteEditorViewController;
  -[AKNoteEditorViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[AKNoteEditorViewController annotation](self, "annotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKNoteEditorViewController textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

    -[AKNoteEditorViewController annotation](self, "annotation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKNoteEditorViewController textView](self, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKNoteEditorViewController;
  -[AKNoteEditorViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[AKNoteEditorViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

  -[AKNoteEditorViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteEditorViewControllerDidBeginEditing:", self);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[AKNoteEditorViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteEditorViewControllerDidEndEditing:", self);

  v6.receiver = self;
  v6.super_class = (Class)AKNoteEditorViewController;
  -[AKNoteEditorViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (AKPopupAnnotation)annotation
{
  return (AKPopupAnnotation *)objc_getProperty(self, a2, 976, 1);
}

- (void)setAnnotation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 976);
}

- (AKNoteEditorViewControllerDelegate)delegate
{
  return (AKNoteEditorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
