@implementation MUPlaceLinkPresentationActivityProvider

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  LPLinkMetadata *cachedMetadata;
  void *v5;
  LPLinkMetadata *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  LPLinkMetadata *v12;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  cachedMetadata = self->_cachedMetadata;
  if (!cachedMetadata)
  {
    -[MUPlaceActivityProvider activityURL](self, "activityURL", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    metadataWithURL(v5);
    v6 = (LPLinkMetadata *)objc_claimAutoreleasedReturnValue();

    v14.receiver = self;
    v14.super_class = (Class)MUPlaceLinkPresentationActivityProvider;
    -[MUPlaceActivityProvider mapMetadataSpecialization](&v14, sel_mapMetadataSpecialization);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceActivityProvider mapItem](self, "mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    annotatedSnapshotImageWithMapItems(v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v10);

    annotatedSnapshotImageWithMapItems(v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDarkImage:", v11);

    -[LPLinkMetadata setSpecialization:](v6, "setSpecialization:", v7);
    v12 = self->_cachedMetadata;
    self->_cachedMetadata = v6;

    cachedMetadata = self->_cachedMetadata;
  }
  return cachedMetadata;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return 0;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMetadata, 0);
}

@end
