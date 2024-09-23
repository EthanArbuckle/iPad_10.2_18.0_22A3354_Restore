@implementation LPLinkMetadataPreviewTransformer

- (LPLinkMetadataPreviewTransformer)initWithMetadata:(id)a3 URL:(id)a4
{
  id v7;
  id v8;
  LPLinkMetadataPreviewTransformer *v9;
  LPLinkMetadataPreviewTransformer *v10;
  LPLinkMetadataPreviewTransformer *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LPLinkMetadataPreviewTransformer;
  v9 = -[LPLinkMetadataPreviewTransformer init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metadata, a3);
    objc_storeStrong((id *)&v10->_URL, a4);
    v11 = v10;
  }

  return v10;
}

- (NSString)previewSummary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  NSURL *URL;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  -[LPLinkMetadata specialization](self->_metadata, "specialization");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
LABEL_6:
    -[LPLinkMetadata title](self->_metadata, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    truncatedStringAtMaximumMetadataLength(v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    URL = self->_URL;
    v12 = URL;
    if (!URL)
    {
      -[LPLinkMetadata originalURL](self->_metadata, "originalURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "_lp_simplifiedDisplayString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    truncatedStringAtMaximumMetadataLength(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (URL)
    {
      if (!v8)
        goto LABEL_14;
    }
    else
    {

      if (!v8)
        goto LABEL_14;
    }
    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      LPLocalizedString(CFSTR("Website: %@ (%@)"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v16, v8, v14);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_14:
    if (!v14)
    {
      v9 = 0;
      goto LABEL_17;
    }
    v18 = (void *)MEMORY[0x1E0CB3940];
    LPLocalizedString(CFSTR("Website: %@"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v16, v14);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v9 = (void *)v17;

LABEL_17:
    goto LABEL_18;
  }
  v4 = (void *)v3;
  -[LPLinkMetadata specialization](self->_metadata, "specialization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE5E8638) & 1) == 0)
  {

    goto LABEL_6;
  }
  -[LPLinkMetadata specialization](self->_metadata, "specialization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
    goto LABEL_6;
  -[LPLinkMetadata specialization](self->_metadata, "specialization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "previewSummaryForTransformer:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return (NSString *)v9;
}

- (LPImage)previewImage
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
    if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE5E8638) & 1) == 0)
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
      objc_msgSend(v4, "previewImageForTransformer:", self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

      return (LPImage *)v8;
    }
  }
  v8 = 0;
  return (LPImage *)v8;
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
