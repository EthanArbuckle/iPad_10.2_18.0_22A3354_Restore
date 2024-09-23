@implementation UIViewWindowNotifier

- (void)willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIViewWindowNotifier;
  v4 = a3;
  -[UIViewWindowNotifier willMoveToWindow:](&v6, sel_willMoveToWindow_, v4);
  -[UIViewWindowNotifier windowListener](self, "windowListener", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view:willMoveToWindow:", self, v4);

}

- (UIViewWindowListener)windowListener
{
  return (UIViewWindowListener *)objc_loadWeakRetained((id *)&self->_windowListener);
}

- (void)setWindowListener:(id)a3
{
  objc_storeWeak((id *)&self->_windowListener, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowListener);
}

@end
