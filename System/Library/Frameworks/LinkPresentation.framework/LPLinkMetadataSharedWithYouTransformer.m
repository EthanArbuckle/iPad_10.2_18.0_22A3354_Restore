@implementation LPLinkMetadataSharedWithYouTransformer

- (LPLinkMetadataSharedWithYouTransformer)initWithMetadata:(id)a3 URL:(id)a4
{
  id v7;
  id v8;
  LPLinkMetadataSharedWithYouTransformer *v9;
  LPLinkMetadataSharedWithYouTransformer *v10;
  LPLinkMetadataSharedWithYouTransformer *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LPLinkMetadataSharedWithYouTransformer;
  v9 = -[LPLinkMetadataSharedWithYouTransformer init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metadata, a3);
    objc_storeStrong((id *)&v10->_URL, a4);
    v11 = v10;
  }

  return v10;
}

- (BOOL)shouldDonateToSharedWithYou
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  char v8;

  -[LPLinkMetadata specialization](self->_metadata, "specialization");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[LPLinkMetadata specialization](self->_metadata, "specialization");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE5EA420) & 1) == 0)
    {

      v8 = 1;
      goto LABEL_7;
    }
    -[LPLinkMetadata specialization](self->_metadata, "specialization");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[LPLinkMetadata specialization](self->_metadata, "specialization");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "shouldDonateToSharedWithYouForTransformer:", self);
LABEL_7:

      return v8;
    }
  }
  return 1;
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
