@implementation ASCAdLockupPresenter

- (ASCAdLockupPresenter)initWithView:(id)a3 lockupPresenter:(id)a4
{
  id v7;
  id v8;
  ASCAdLockupPresenter *v9;
  ASCAdLockupPresenter *v10;
  void *v11;
  uint64_t v12;
  ASCLockup *lockup;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ASCAdLockupPresenter;
  v9 = -[ASCAdLockupPresenter init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_view, a3);
    objc_msgSend(v8, "lockup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    lockup = v10->_lockup;
    v10->_lockup = (ASCLockup *)v12;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v10, sel_lockupPresenterDidChange_, 0x1E7564C88, v8);

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ASCAdLockupPresenter;
  -[ASCAdLockupPresenter dealloc](&v4, sel_dealloc);
}

- (void)lockupPresenterDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAdLockupPresenter setLockup:](self, "setLockup:", v4);

}

- (void)setLockup:(id)a3
{
  ASCLockup *v4;
  ASCLockup *lockup;
  BOOL v6;
  ASCLockup *v7;
  ASCLockup *v8;
  void *v9;
  char v10;
  ASCAdLockupPresenter *v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  ASCLockup *v18;

  v4 = (ASCLockup *)a3;
  lockup = self->_lockup;
  v18 = v4;
  if (v4 && lockup)
  {
    v6 = -[ASCLockup isEqual:](lockup, "isEqual:", v4);
    v4 = v18;
    if (v6)
      goto LABEL_19;
LABEL_6:
    v7 = (ASCLockup *)-[ASCLockup copy](v4, "copy");
    v8 = self->_lockup;
    self->_lockup = v7;

    if (!v18)
    {
      -[ASCAdLockupPresenter setEditorsChoice:](self, "setEditorsChoice:", 0);
      LODWORD(v13) = 0;
      -[ASCAdLockupPresenter setProductRating:](self, "setProductRating:", v13);
      -[ASCAdLockupPresenter setProductRatingBadge:](self, "setProductRatingBadge:", 0);
      -[ASCAdLockupPresenter setProductDescription:](self, "setProductDescription:", 0);
      -[ASCAdLockupPresenter setAdTransparencyButtonHidden:](self, "setAdTransparencyButtonHidden:", 1);
      -[ASCAdLockupPresenter setDeveloperName:](self, "setDeveloperName:", 0);
LABEL_18:
      v4 = v18;
      goto LABEL_19;
    }
    -[ASCLockup offer](v18, "offer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "flags");

    if ((v10 & 8) != 0)
    {
      v11 = self;
      v12 = 0;
    }
    else
    {
      if (!-[ASCLockup isEditorsChoice](v18, "isEditorsChoice"))
      {
        -[ASCAdLockupPresenter setEditorsChoice:](self, "setEditorsChoice:", 0);
        -[ASCLockup productRating](v18, "productRating");
        -[ASCAdLockupPresenter setProductRating:](self, "setProductRating:");
        -[ASCLockup productRatingBadge](v18, "productRatingBadge");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCAdLockupPresenter setProductRatingBadge:](self, "setProductRatingBadge:", v15);

        goto LABEL_14;
      }
      v11 = self;
      v12 = 1;
    }
    -[ASCAdLockupPresenter setEditorsChoice:](v11, "setEditorsChoice:", v12);
    LODWORD(v14) = 0;
    -[ASCAdLockupPresenter setProductRating:](self, "setProductRating:", v14);
    -[ASCAdLockupPresenter setProductRatingBadge:](self, "setProductRatingBadge:", 0);
LABEL_14:
    if (-[ASCAdLockupPresenter shouldDisplayDescriptionForLockup:](self, "shouldDisplayDescriptionForLockup:", v18))
    {
      -[ASCLockup productDescription](v18, "productDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCAdLockupPresenter setProductDescription:](self, "setProductDescription:", v16);

    }
    else
    {
      -[ASCAdLockupPresenter setProductDescription:](self, "setProductDescription:", 0);
    }
    -[ASCAdLockupPresenter setAdTransparencyButtonHidden:](self, "setAdTransparencyButtonHidden:", 0);
    -[ASCLockup developerName](v18, "developerName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAdLockupPresenter setDeveloperName:](self, "setDeveloperName:", v17);

    goto LABEL_18;
  }
  if (lockup != v4)
    goto LABEL_6;
LABEL_19:

}

- (void)setAdTransparencyButtonHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ASCAdLockupPresenter view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdTransparencyButtonHidden:", v3);

}

- (void)setEditorsChoice:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[ASCAdLockupPresenter view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[ASCAdLockupPresenter view](self, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEditorsChoice:", v3);

  }
}

- (void)setProductRating:(float)a3
{
  void *v5;
  char v6;
  double v7;
  id v8;

  -[ASCAdLockupPresenter view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[ASCAdLockupPresenter view](self, "view");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v7 = a3;
    objc_msgSend(v8, "setProductRating:", v7);

  }
}

- (void)setProductRatingBadge:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ASCAdLockupPresenter view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ASCAdLockupPresenter view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProductRatingBadge:", v7);

  }
}

- (void)setProductDescription:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ASCAdLockupPresenter view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ASCAdLockupPresenter view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProductDescription:", v7);

  }
}

- (void)setDeveloperName:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ASCAdLockupPresenter view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ASCAdLockupPresenter view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDeveloperName:", v7);

  }
}

- (BOOL)shouldDisplayDescriptionForLockup:(id)a3
{
  return objc_msgSend(a3, "hasMedia") ^ 1;
}

- (ASCAdLockupPresenterView)view
{
  return self->_view;
}

- (ASCLockup)lockup
{
  return self->_lockup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockup, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
