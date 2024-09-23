@implementation CKWalletItemBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6
{
  uint64_t v6;
  void *v9;
  id v10;

  v6 = a5;
  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v10, "presentationPropertiesForWidth:orientation:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKWalletItemBalloonView setPresentationProperties:](self, "setPresentationProperties:", v9);

  }
}

- (void)setPresentationProperties:(id)a3
{
  LPWebLinkPresentationProperties *v5;
  LPWebLinkPresentationProperties *v6;

  v5 = (LPWebLinkPresentationProperties *)a3;
  if (self->_presentationProperties != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_presentationProperties, a3);
    self->_pendingPropertyChange = 1;
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
    v5 = v6;
  }

}

- (void)prepareForReuse
{
  LPWebLinkPresentationProperties *presentationProperties;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKWalletItemBalloonView;
  -[CKLinkBalloonView prepareForReuse](&v4, sel_prepareForReuse);
  presentationProperties = self->_presentationProperties;
  self->_presentationProperties = 0;

  self->_pendingPropertyChange = 0;
}

- (void)prepareForDisplay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;
  id location;

  if (self->_pendingPropertyChange)
  {
    -[CKLinkBalloonView linkView](self, "linkView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    -[CKLinkBalloonView setLinkView:](self, "setLinkView:", 0);
    self->_pendingPropertyChange = 0;
  }
  -[CKLinkBalloonView linkView](self, "linkView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC11C8]), "initWithPresentationProperties:URL:", self->_presentationProperties, 0);
    -[CKLinkBalloonView setLinkView:](self, "setLinkView:", v5);

    -[CKBalloonView tapGestureRecognizer](self, "tapGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCancelsTouchesInView:", 1);

    location = 0;
    objc_initWeak(&location, self);
    -[CKLinkBalloonView linkView](self, "linkView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__CKWalletItemBalloonView_prepareForDisplay__block_invoke;
    v10[3] = &unk_1E274B548;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v7, "_setAction:withText:buttonType:", v10, &stru_1E276D870, 1);

    -[CKLinkBalloonView linkView](self, "linkView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsUpdateConstraints");

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  v9.receiver = self;
  v9.super_class = (Class)CKWalletItemBalloonView;
  -[CKLinkBalloonView prepareForDisplay](&v9, sel_prepareForDisplay);
}

void __44__CKWalletItemBalloonView_prepareForDisplay__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v2, "tapGestureRecognizer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tapGestureRecognized:", v1);

}

- (BOOL)isIrisAsset
{
  return self->_isIrisAsset;
}

- (void)setIsIrisAsset:(BOOL)a3
{
  self->_isIrisAsset = a3;
}

- (LPWebLinkPresentationProperties)presentationProperties
{
  return self->_presentationProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationProperties, 0);
}

@end
