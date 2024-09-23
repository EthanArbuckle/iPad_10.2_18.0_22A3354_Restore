@implementation ASCMiniProductPagePresenter

- (ASCMiniProductPagePresenter)initWithView:(id)a3 lockupPresenter:(id)a4
{
  id v6;
  id v7;
  ASCMiniProductPagePresenter *v8;
  ASCMiniProductPagePresenter *v9;
  void *v10;
  uint64_t v11;
  ASCLockup *lockup;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ASCMiniProductPagePresenter;
  v8 = -[ASCMiniProductPagePresenter init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_view, v6);
    objc_msgSend(v7, "lockup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    lockup = v9->_lockup;
    v9->_lockup = (ASCLockup *)v11;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v9, sel_lockupPresenterDidChange_, 0x1E7564C88, v7);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ASCMiniProductPagePresenter;
  -[ASCMiniProductPagePresenter dealloc](&v4, sel_dealloc);
}

- (void)lockupPresenterDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCMiniProductPagePresenter setLockup:](self, "setLockup:", v4);

}

- (void)setLockup:(id)a3
{
  ASCLockup *v4;
  ASCLockup *lockup;
  BOOL v6;
  ASCLockup *v7;
  ASCLockup *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  ASCLockup *v17;

  v4 = (ASCLockup *)a3;
  lockup = self->_lockup;
  v17 = v4;
  if (v4 && lockup)
  {
    v6 = -[ASCLockup isEqual:](lockup, "isEqual:", v4);
    v4 = v17;
    if (v6)
      goto LABEL_12;
  }
  else if (lockup == v4)
  {
    goto LABEL_12;
  }
  v7 = (ASCLockup *)-[ASCLockup copy](v4, "copy");
  v8 = self->_lockup;
  self->_lockup = v7;

  if (!v17)
  {
    -[ASCMiniProductPagePresenter setMetadata:](self, "setMetadata:", 0);
    -[ASCMiniProductPagePresenter setDescription:](self, "setDescription:", 0);
    -[ASCMiniProductPagePresenter setAgeRating:](self, "setAgeRating:", 0);
    goto LABEL_11;
  }
  -[ASCLockup productPageMetadata](v17, "productPageMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCMiniProductPagePresenter setMetadata:](self, "setMetadata:", v9);

  -[ASCLockup productPageDescription](v17, "productPageDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCMiniProductPagePresenter setDescription:](self, "setDescription:", v10);

  -[ASCLockup ageRating](v17, "ageRating");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCMiniProductPagePresenter setAgeRating:](self, "setAgeRating:", v11);

  -[ASCLockup developerName](v17, "developerName");
  v12 = objc_claimAutoreleasedReturnValue();
  v4 = v17;
  if (v12)
  {
    v13 = (void *)v12;
    -[ASCLockup developerName](v17, "developerName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    v4 = v17;
    if (v15)
    {
      -[ASCLockup developerName](v17, "developerName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCMiniProductPagePresenter setSubtitle:](self, "setSubtitle:", v16);

LABEL_11:
      v4 = v17;
    }
  }
LABEL_12:

}

- (void)setSubtitle:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ASCMiniProductPagePresenter view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ASCMiniProductPagePresenter view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSubtitle:", v7);

  }
}

- (void)setMetadata:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ASCMiniProductPagePresenter view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ASCMiniProductPagePresenter view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMetadata:", v7);

  }
}

- (NSString)description
{
  return -[ASCLockup productPageDescription](self->_lockup, "productPageDescription");
}

- (void)setDescription:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ASCMiniProductPagePresenter view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ASCMiniProductPagePresenter view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collapsingNewlines");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDescription:", v7);

  }
}

- (void)setAgeRating:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ASCMiniProductPagePresenter view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ASCMiniProductPagePresenter view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAgeRating:", v7);

  }
}

- (ASCMiniProductPagePresenterView)view
{
  return (ASCMiniProductPagePresenterView *)objc_loadWeakRetained((id *)&self->_view);
}

- (ASCLockup)lockup
{
  return self->_lockup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockup, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end
