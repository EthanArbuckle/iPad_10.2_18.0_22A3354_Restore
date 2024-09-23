@implementation SFDownloadsUnifiedBarItem

- (SFDownloadsUnifiedBarItem)initWithAction:(id)a3
{
  id v4;
  SFDownloadsUnifiedBarItem *v5;
  SFDownloadsUnifiedBarItemView *v6;
  SFDownloadsUnifiedBarItemView *view;
  SFDownloadsUnifiedBarItemView *v8;
  void *v9;
  void *v10;
  SFDownloadsUnifiedBarItem *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SFDownloadsUnifiedBarItem;
  v5 = -[SFDownloadsUnifiedBarItem init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(SFDownloadsUnifiedBarItemView);
    view = v5->_view;
    v5->_view = v6;

    objc_initWeak(&location, v5);
    v8 = v5->_view;
    v9 = (void *)MEMORY[0x1E0DC3428];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __44__SFDownloadsUnifiedBarItem_initWithAction___block_invoke;
    v13[3] = &unk_1E4AC80A8;
    objc_copyWeak(&v15, &location);
    v14 = v4;
    objc_msgSend(v9, "actionWithHandler:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDownloadsUnifiedBarItemView addAction:forControlEvents:](v8, "addAction:forControlEvents:", v10, 0x2000);

    v11 = v5;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __44__SFDownloadsUnifiedBarItem_initWithAction___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      v4 = WeakRetained;
      (*(void (**)(void))(v3 + 16))();
      WeakRetained = v4;
    }
  }

}

- (double)progress
{
  double result;

  -[SFDownloadsUnifiedBarItemView progress](self->_view, "progress");
  return result;
}

- (void)setProgress:(double)a3
{
  -[SFDownloadsUnifiedBarItemView setProgress:](self->_view, "setProgress:", a3);
}

- (void)pulse
{
  -[SFDownloadsUnifiedBarItemView pulse](self->_view, "pulse");
}

- (id)view
{
  return self->_view;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

@end
