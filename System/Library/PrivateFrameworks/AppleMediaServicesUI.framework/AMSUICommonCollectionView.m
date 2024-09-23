@implementation AMSUICommonCollectionView

- (AMSUICommonCollectionView)init
{
  id v3;
  AMSUICommonCollectionView *v4;
  void *v5;
  AMSUICommonCollectionViewHandler *v6;
  AMSUICommonCollectionViewHandler *handler;
  AMSUICommonCollectionViewHandler *v8;
  objc_super v10;

  v3 = objc_alloc_init(MEMORY[0x24BEBD488]);
  v4 = -[AMSUICommonCollectionView initWithFrame:collectionViewLayout:](self, "initWithFrame:collectionViewLayout:", v3, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

  if (v4)
  {
    -[AMSUICommonCollectionView setAlwaysBounceVertical:](v4, "setAlwaysBounceVertical:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "ams_clear");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUICommonCollectionView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = -[AMSUICommonCollectionViewHandler initWithCollectionView:]([AMSUICommonCollectionViewHandler alloc], "initWithCollectionView:", v4);
    handler = v4->_handler;
    v4->_handler = v6;

    v8 = v4->_handler;
    v10.receiver = v4;
    v10.super_class = (Class)AMSUICommonCollectionView;
    -[AMSUICommonCollectionView setDelegate:](&v10, sel_setDelegate_, v8);
  }
  return v4;
}

- (AMSUICommonCollectionViewDelegate)commonDelegate
{
  void *v2;
  void *v3;

  -[AMSUICommonCollectionView handler](self, "handler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSUICommonCollectionViewDelegate *)v3;
}

- (void)setCommonDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUICommonCollectionView handler](self, "handler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (AMSUICommonCollectionViewHandler)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handler, 0);
}

@end
