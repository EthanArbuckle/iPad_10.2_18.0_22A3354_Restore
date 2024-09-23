@implementation FKOrderMessagesPreviewMetadata

- (FKOrderMessagesPreviewMetadata)initWithOrderData:(id)a3 workingDirectory:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  FKOrderMessagesPreviewMetadata *v10;
  __FKOrderMessagesPreviewMetadata *v11;
  __FKOrderMessagesPreviewMetadata *v12;
  FKOrderMessagesPreviewMetadata *v13;
  void *v14;
  FKOrderMessagesPreviewMetadataImage *v15;
  void *v16;
  uint64_t v17;
  FKOrderMessagesPreviewMetadataImage *headerImage;
  FKOrderMessagesPreviewMetadataText *v19;
  void *v20;
  uint64_t v21;
  FKOrderMessagesPreviewMetadataText *primaryText;
  void *v23;
  FKOrderMessagesPreviewMetadataText *v24;
  void *v25;
  uint64_t v26;
  FKOrderMessagesPreviewMetadataText *secondaryText;
  void *v28;
  FKOrderMessagesPreviewMetadataText *v29;
  void *v30;
  uint64_t v31;
  FKOrderMessagesPreviewMetadataText *tertiaryText;
  objc_super v34;

  v8 = a3;
  v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)FKOrderMessagesPreviewMetadata;
  v10 = -[FKOrderMessagesPreviewMetadata init](&v34, sel_init);
  if (!v10)
  {
LABEL_13:
    v13 = v10;
    goto LABEL_14;
  }
  v11 = [__FKOrderMessagesPreviewMetadata alloc];
  if (v9)
    v12 = -[__FKOrderMessagesPreviewMetadata initWithOrderData:workingDirectory:error:](v11, "initWithOrderData:workingDirectory:error:", v8, v9, a5);
  else
    v12 = -[__FKOrderMessagesPreviewMetadata initWithOrderData:error:](v11, "initWithOrderData:error:", v8, a5);
  v13 = (FKOrderMessagesPreviewMetadata *)v12;
  if (v12)
  {
    -[__FKOrderMessagesPreviewMetadata image](v12, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [FKOrderMessagesPreviewMetadataImage alloc];
      -[FKOrderMessagesPreviewMetadata image](v13, "image");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[FKOrderMessagesPreviewMetadataImage _initWithImage:](v15, "_initWithImage:", v16);
      headerImage = v10->_headerImage;
      v10->_headerImage = (FKOrderMessagesPreviewMetadataImage *)v17;

    }
    v10->_backgroundColor = CGColorRetain(-[FKOrderMessagesPreviewMetadata backgroundColor](v13, "backgroundColor"));
    v19 = [FKOrderMessagesPreviewMetadataText alloc];
    -[FKOrderMessagesPreviewMetadata primaryText](v13, "primaryText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[FKOrderMessagesPreviewMetadataText _initWithText:](v19, "_initWithText:", v20);
    primaryText = v10->_primaryText;
    v10->_primaryText = (FKOrderMessagesPreviewMetadataText *)v21;

    -[FKOrderMessagesPreviewMetadata secondaryText](v13, "secondaryText");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = [FKOrderMessagesPreviewMetadataText alloc];
      -[FKOrderMessagesPreviewMetadata secondaryText](v13, "secondaryText");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[FKOrderMessagesPreviewMetadataText _initWithText:](v24, "_initWithText:", v25);
      secondaryText = v10->_secondaryText;
      v10->_secondaryText = (FKOrderMessagesPreviewMetadataText *)v26;

    }
    -[FKOrderMessagesPreviewMetadata tertiaryText](v13, "tertiaryText");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [FKOrderMessagesPreviewMetadataText alloc];
      -[FKOrderMessagesPreviewMetadata tertiaryText](v13, "tertiaryText");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[FKOrderMessagesPreviewMetadataText _initWithText:](v29, "_initWithText:", v30);
      tertiaryText = v10->_tertiaryText;
      v10->_tertiaryText = (FKOrderMessagesPreviewMetadataText *)v31;

    }
    goto LABEL_13;
  }
LABEL_14:

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_backgroundColor);
  v3.receiver = self;
  v3.super_class = (Class)FKOrderMessagesPreviewMetadata;
  -[FKOrderMessagesPreviewMetadata dealloc](&v3, sel_dealloc);
}

+ (id)walletDeepLinkForExistingOrderAtURL:(id)a3
{
  return +[__FKOrderMessagesPreviewMetadata createWalletDeepLinkForExistingOrderAt:](__FKOrderMessagesPreviewMetadata, "createWalletDeepLinkForExistingOrderAt:", a3);
}

- (FKOrderMessagesPreviewMetadataImage)headerImage
{
  return self->_headerImage;
}

- (CGColor)backgroundColor
{
  return self->_backgroundColor;
}

- (FKOrderMessagesPreviewMetadataText)primaryText
{
  return self->_primaryText;
}

- (FKOrderMessagesPreviewMetadataText)secondaryText
{
  return self->_secondaryText;
}

- (FKOrderMessagesPreviewMetadataText)tertiaryText
{
  return self->_tertiaryText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_headerImage, 0);
}

@end
