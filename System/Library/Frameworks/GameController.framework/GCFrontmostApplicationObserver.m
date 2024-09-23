@implementation GCFrontmostApplicationObserver

- (GCFrontmostApplicationObserver)initWithDelegate:(id)a3
{
  id v4;
  GCFrontmostApplicationObserver *v5;
  GCFrontmostApplicationObserver *v6;

  v4 = a3;
  v5 = -[GCFrontmostApplicationObserver init](self, "init");
  v6 = v5;
  if (v5)
    -[GCFrontmostApplicationObserver setDelegate:](v5, "setDelegate:", v4);

  return v6;
}

- (GCFrontmostApplicationObserverDelegate)delegate
{
  return (GCFrontmostApplicationObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
