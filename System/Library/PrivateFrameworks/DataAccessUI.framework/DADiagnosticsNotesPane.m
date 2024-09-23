@implementation DADiagnosticsNotesPane

- (DADiagnosticsNotesPane)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  DADiagnosticsNotesPane *v7;
  uint64_t v8;
  UITextView *notesView;
  UITextView *v10;
  void *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)DADiagnosticsNotesPane;
  v7 = -[PSEditingPane initWithFrame:](&v13, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6EF8]), "initWithFrame:", x, y, width, height);
    notesView = v7->_notesView;
    v7->_notesView = (UITextView *)v8;

    -[UITextView setAutoresizingMask:](v7->_notesView, "setAutoresizingMask:", 18);
    -[UITextView setEditable:](v7->_notesView, "setEditable:", 1);
    -[UITextView setSelectedRange:](v7->_notesView, "setSelectedRange:", 0, 0);
    -[UITextView setKeyboardType:](v7->_notesView, "setKeyboardType:", 0);
    v10 = v7->_notesView;
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 16.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v10, "setFont:", v11);

    -[UITextView setBounces:](v7->_notesView, "setBounces:", 1);
    -[DADiagnosticsNotesPane addSubview:](v7, "addSubview:", v7->_notesView);
  }
  return v7;
}

- (BOOL)becomeFirstResponder
{
  return -[UITextView becomeFirstResponder](self->_notesView, "becomeFirstResponder");
}

- (id)preferenceValue
{
  return -[UITextView text](self->_notesView, "text");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notesView, 0);
}

@end
