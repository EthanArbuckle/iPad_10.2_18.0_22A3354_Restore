@implementation PKFakeNotesDelegate

- (PKFakeNotesDelegate)initWithTextView:(id)a3
{
  id v4;
  PKFakeNotesDelegate *v5;
  PKFakeNotesDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKFakeNotesDelegate;
  v5 = -[PKFakeNotesDelegate init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_textView, v4);

  return v6;
}

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "setEditable:", 1);

}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  id WeakRetained;
  void *v5;
  void *v6;
  char v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "ink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_isHandwritingInk");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textView);
}

@end
