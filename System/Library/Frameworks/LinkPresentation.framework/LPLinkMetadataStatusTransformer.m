@implementation LPLinkMetadataStatusTransformer

- (LPLinkMetadataStatusTransformer)initWithMetadata:(id)a3 URL:(id)a4
{
  id v7;
  id v8;
  LPLinkMetadataStatusTransformer *v9;
  LPLinkMetadataStatusTransformer *v10;
  id *p_metadata;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  LPLinkMetadataStatusTransformer *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)LPLinkMetadataStatusTransformer;
  v9 = -[LPLinkMetadataStatusTransformer init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    p_metadata = (id *)&v9->_metadata;
    objc_storeStrong((id *)&v9->_metadata, a3);
    objc_storeStrong((id *)&v10->_URL, a4);
    -[LPLinkMetadata specialization](v10->_metadata, "specialization");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(*p_metadata, "specialization");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "conformsToProtocol:", &unk_1EE5E8818) & 1) == 0)
      {

        goto LABEL_7;
      }
      objc_msgSend(*p_metadata, "specialization");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        objc_msgSend(*p_metadata, "specialization");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "initializeForTransformer:", v10);
LABEL_7:

      }
    }
    v16 = v10;
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  objc_super v7;

  -[LPLinkMetadata specialization](self->_metadata, "specialization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[LPLinkMetadata specialization](self->_metadata, "specialization");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EE5E8818) & 1) == 0)
    {

      goto LABEL_6;
    }
    -[LPLinkMetadata specialization](self->_metadata, "specialization");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[LPLinkMetadata specialization](self->_metadata, "specialization");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "destroyForTransformer:", self);
LABEL_6:

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)LPLinkMetadataStatusTransformer;
  -[LPLinkMetadataStatusTransformer dealloc](&v7, sel_dealloc);
}

- (void)setMetadata:(id)a3
{
  LPLinkMetadata **p_metadata;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id WeakRetained;
  id v15;
  id v16;

  v16 = a3;
  p_metadata = &self->_metadata;
  -[LPLinkMetadata specialization](self->_metadata, "specialization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[LPLinkMetadata specialization](*p_metadata, "specialization");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EE5E8818) & 1) != 0)
    {
      -[LPLinkMetadata specialization](*p_metadata, "specialization");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) == 0)
        goto LABEL_7;
      -[LPLinkMetadata specialization](*p_metadata, "specialization");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "destroyForTransformer:", self);
    }
    else
    {

    }
  }
LABEL_7:
  objc_storeStrong((id *)&self->_metadata, a3);
  -[LPLinkMetadata specialization](*p_metadata, "specialization");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_13;
  -[LPLinkMetadata specialization](*p_metadata, "specialization");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "conformsToProtocol:", &unk_1EE5E8818) & 1) != 0)
  {
    -[LPLinkMetadata specialization](*p_metadata, "specialization");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0)
      goto LABEL_13;
    -[LPLinkMetadata specialization](*p_metadata, "specialization");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "initializeForTransformer:", self);
  }
  else
  {

  }
LABEL_13:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v15 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v15, "statusTransformerDidUpdate:", self);

  }
}

- (NSAttributedString)statusText
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  -[LPLinkMetadata specialization](self->_metadata, "specialization");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[LPLinkMetadata specialization](self->_metadata, "specialization");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE5E8818) & 1) == 0)
    {

      v8 = 0;
      goto LABEL_7;
    }
    -[LPLinkMetadata specialization](self->_metadata, "specialization");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[LPLinkMetadata specialization](self->_metadata, "specialization");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "statusForTransformer:", self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

      return (NSAttributedString *)v8;
    }
  }
  v8 = 0;
  return (NSAttributedString *)v8;
}

- (NSURL)actionURL
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  -[LPLinkMetadata specialization](self->_metadata, "specialization");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[LPLinkMetadata specialization](self->_metadata, "specialization");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE5E8818) & 1) == 0)
    {

      v8 = 0;
      goto LABEL_7;
    }
    -[LPLinkMetadata specialization](self->_metadata, "specialization");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[LPLinkMetadata specialization](self->_metadata, "specialization");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "actionURLForTransformer:", self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

      return (NSURL *)v8;
    }
  }
  v8 = 0;
  return (NSURL *)v8;
}

- (id)originalURL
{
  NSURL *URL;

  URL = self->_URL;
  if (URL)
    return URL;
  -[LPLinkMetadata originalURL](self->_metadata, "originalURL");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSURL)canonicalURL
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[LPLinkMetadata URL](self->_metadata, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[LPLinkMetadataStatusTransformer originalURL](self, "originalURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSURL *)v6;
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (LPLinkMetadataStatusTransformerDelegate)delegate
{
  return (LPLinkMetadataStatusTransformerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)wantsStatusItem
{
  return self->_wantsStatusItem;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
