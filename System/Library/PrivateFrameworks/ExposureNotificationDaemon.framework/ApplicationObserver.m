@implementation ApplicationObserver

- (ApplicationObserver)init
{
  ApplicationObserver *v2;
  void *v3;
  ApplicationObserver *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ApplicationObserver;
  v2 = -[ApplicationObserver init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CA5880], "defaultWorkspace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:", v2);

    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CA5880], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ApplicationObserver;
  -[ApplicationObserver dealloc](&v4, sel_dealloc);
}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ApplicationObserver delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationsDidInstall:", v4);

}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ApplicationObserver delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationsDidUninstall:", v4);

}

- (ApplicationObserver)delegate
{
  return (ApplicationObserver *)objc_loadWeakRetained((id *)&self->_delegate);
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
