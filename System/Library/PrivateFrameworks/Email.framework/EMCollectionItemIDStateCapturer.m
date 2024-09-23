@implementation EMCollectionItemIDStateCapturer

- (EMCollectionItemIDStateCapturer)initWithTitle:(id)a3 delegate:(id)a4
{
  id v6;
  EMCollectionItemIDStateCapturer *v7;
  EMCollectionItemIDStateCapturer *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)EMCollectionItemIDStateCapturer;
  v7 = -[EFListStateCapturer initWithTitle:itemName:headLimit:tailLimit:delegate:](&v10, sel_initWithTitle_itemName_headLimit_tailLimit_delegate_, a3, CFSTR("Item IDs"), 200, 100, self);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_delegate, v6);

  return v8;
}

- (id)labelForStateCapture
{
  void *v2;
  void *v3;

  -[EMCollectionItemIDStateCapturer delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "labelForStateCapture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)itemsForStateCaptureWithErrorString:(id *)a3
{
  void *v4;
  void *v5;

  -[EMCollectionItemIDStateCapturer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemIDsForStateCaptureWithErrorString:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)descriptionForItem:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (EMCollectionItemIDStateCapturerDelegate)delegate
{
  return (EMCollectionItemIDStateCapturerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
