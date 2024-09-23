@implementation FATableViewDecorator

- (FATableViewDecorator)initWithTableView:(id)a3
{
  id v5;
  FATableViewDecorator *v6;
  FATableViewDecorator *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FATableViewDecorator;
  v6 = -[FATableViewDecorator init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tableView, a3);
    objc_msgSend(v5, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v7->_dataSource, v8);

    objc_msgSend(v5, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v7->_delegate, v9);

    -[FATableViewProtocol setDelegate:](v7->_tableView, "setDelegate:", v7);
    -[FATableViewProtocol setDataSource:](v7->_tableView, "setDataSource:", v7);
  }

  return v7;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  UITableViewDataSource **p_dataSource;
  id WeakRetained;
  char v6;
  id v7;
  char v8;
  id v9;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0
    || (p_dataSource = &self->_delegate,
        v7 = objc_loadWeakRetained((id *)&self->_delegate),
        v8 = objc_opt_respondsToSelector(),
        v7,
        (v8 & 1) != 0))
  {
    v9 = objc_loadWeakRetained((id *)p_dataSource);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  id v4;
  char v5;
  char v6;
  id WeakRetained;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FATableViewDecorator;
  if (-[FATableViewDecorator respondsToSelector:](&v9, sel_respondsToSelector_)
    || (v4 = objc_loadWeakRetained((id *)&self->_dataSource),
        v5 = objc_opt_respondsToSelector(),
        v4,
        (v5 & 1) != 0))
  {
    v6 = 1;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

  }
  return v6 & 1;
}

- (void)reloadData
{
  -[FATableViewProtocol reloadData](self->_tableView, "reloadData");
}

- (void)reloadRowsAtIndexPaths:(id)a3 withRowAnimation:(int64_t)a4
{
  -[FATableViewProtocol reloadRowsAtIndexPaths:withRowAnimation:](self->_tableView, "reloadRowsAtIndexPaths:withRowAnimation:", a3, a4);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  UITableViewDataSource **p_dataSource;
  id v6;
  id WeakRetained;
  int64_t v8;

  p_dataSource = &self->_dataSource;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  v8 = objc_msgSend(WeakRetained, "tableView:numberOfRowsInSection:", v6, a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  UITableViewDataSource **p_dataSource;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  p_dataSource = &self->_dataSource;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(WeakRetained, "tableView:cellForRowAtIndexPath:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (UITableViewDataSource)dataSource
{
  return (UITableViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (UITableViewDelegate)delegate
{
  return (UITableViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FATableViewProtocol)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
