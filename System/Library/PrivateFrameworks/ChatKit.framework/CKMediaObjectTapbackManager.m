@implementation CKMediaObjectTapbackManager

- (Class)decorationViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTapbacksForAsset:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  -[CKMediaObjectTapbackManager chatItem](self, "chatItem");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CKMediaObjectTapbackManager chatItem](self, "chatItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _MediaObjectBackedAssetForPhotoKitAsset(v4, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = v9;

        v4 = v10;
      }

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "acknowledgmentChatItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 != 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)tapbackUserDataForAsset:(id)a3 previousAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  uint64_t v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  -[CKMediaObjectTapbackManager chatItem](self, "chatItem");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CKMediaObjectTapbackManager chatItem](self, "chatItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _MediaObjectBackedAssetForPhotoKitAsset(v6, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = v13;

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[CKMediaObjectTapbackManager chatItem](self, "chatItem");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          _MediaObjectBackedAssetForPhotoKitAsset(v7, v15);
          v16 = objc_claimAutoreleasedReturnValue();

          v7 = (id)v16;
        }
      }
      else
      {
        v14 = v6;
      }

      v6 = v14;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v6;
    objc_msgSend(v8, "setAsset:", v17);
    objc_msgSend(v17, "acknowledgmentChatItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "acknowledgmentChatItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
        goto LABEL_15;
    }
    else
    {
      v19 = 0;
      if (!v18)
        goto LABEL_15;
    }
    if (!v19)
    {
      v20 = 1;
      goto LABEL_17;
    }
LABEL_15:
    if (!v18)
    {
LABEL_18:

      goto LABEL_19;
    }
    v21 = objc_msgSend(v18, "latestAcknowledgmentType");
    v20 = v21 != objc_msgSend(v19, "latestAcknowledgmentType");
LABEL_17:
    objc_msgSend(v8, "setShouldAnimate:", v20);
    goto LABEL_18;
  }
LABEL_19:
  -[CKMediaObjectTapbackManager gradientReferenceView](self, "gradientReferenceView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGradientReferenceView:", v22);

  objc_msgSend(v8, "setInvertTailDirection:", -[CKMediaObjectTapbackManager invertTapbackTailDirection](self, "invertTapbackTailDirection"));
  objc_msgSend(v8, "setDisplayedInGridView:", -[CKMediaObjectTapbackManager originatedFromGridView](self, "originatedFromGridView"));

  return v8;
}

- (CKGradientReferenceView)gradientReferenceView
{
  return (CKGradientReferenceView *)objc_loadWeakRetained((id *)&self->_gradientReferenceView);
}

- (void)setGradientReferenceView:(id)a3
{
  objc_storeWeak((id *)&self->_gradientReferenceView, a3);
}

- (BOOL)invertTapbackTailDirection
{
  return self->_invertTapbackTailDirection;
}

- (void)setInvertTapbackTailDirection:(BOOL)a3
{
  self->_invertTapbackTailDirection = a3;
}

- (BOOL)originatedFromGridView
{
  return self->_originatedFromGridView;
}

- (void)setOriginatedFromGridView:(BOOL)a3
{
  self->_originatedFromGridView = a3;
}

- (CKAggregateAttachmentMessagePartChatItem)chatItem
{
  return self->_chatItem;
}

- (void)setChatItem:(id)a3
{
  objc_storeStrong((id *)&self->_chatItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatItem, 0);
  objc_destroyWeak((id *)&self->_gradientReferenceView);
}

@end
