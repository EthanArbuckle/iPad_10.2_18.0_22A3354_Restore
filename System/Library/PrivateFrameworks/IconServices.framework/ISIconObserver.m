@implementation ISIconObserver

- (ISIconObserver)initWithDelegate:(id)a3
{
  id v4;
  ISIconObserver *v5;
  ISIconObserver *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISIconObserver;
  v5 = -[ISIconObserver init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_delegate, v4);
    +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:", v6);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ISIconObserver;
  -[ISIconObserver dealloc](&v4, sel_dealloc);
}

- (void)iconManager:(id)a3 didInvalidateIcons:(id)a4
{
  id *p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(p_delegate);
  objc_msgSend(WeakRetained, "iconObserver:didInvalidateIcons:", self, v6);

}

- (ISIconObserverDelegate)delegate
{
  return (ISIconObserverDelegate *)objc_loadWeakRetained(&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
}

@end
