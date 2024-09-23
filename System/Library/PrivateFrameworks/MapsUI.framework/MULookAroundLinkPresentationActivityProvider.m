@implementation MULookAroundLinkPresentationActivityProvider

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  LPLinkMetadata *cachedMetadata;
  void *v5;
  LPLinkMetadata *v6;
  LPLinkMetadata *v7;
  void *v8;

  cachedMetadata = self->_cachedMetadata;
  if (!cachedMetadata)
  {
    -[MUPlaceActivityProvider activityURL](self, "activityURL", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    metadataWithURL(v5);
    v6 = (LPLinkMetadata *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedMetadata;
    self->_cachedMetadata = v6;

    -[MULookAroundLinkPresentationActivityProvider mapMetadataSpecialization](self, "mapMetadataSpecialization");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setSpecialization:](self->_cachedMetadata, "setSpecialization:", v8);

    cachedMetadata = self->_cachedMetadata;
  }
  return cachedMetadata;
}

- (id)mapMetadataSpecialization
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MULookAroundLinkPresentationActivityProvider;
  -[MUPlaceActivityProvider mapMetadataSpecialization](&v13, sel_mapMetadataSpecialization);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CC1A58]);
  -[MUPlaceActivityProvider activityURL](self, "activityURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithURL:", v5);

  objc_msgSend(v6, "parseIncludingCustomParameters:", 1);
  if (objc_msgSend(v6, "mapType") == 107)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CC1860]);
    objc_msgSend(v7, "setSize:", 300.0, 300.0);
    objc_msgSend(v7, "setMapType:", objc_msgSend(v6, "mapType"));
    objc_msgSend(v6, "mapCamera");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCamera:", v8);

    objc_msgSend(v7, "setSize:", 300.0, 300.0);
    objc_msgSend(v7, "_setShowsPointLabels:", 0);
    objc_msgSend(v7, "_setShowsAppleLogo:", 0);
    createMapSnapshotImage(v7, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:", v9);

    createMapSnapshotImage(v7, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDarkImage:", v10);

    v11 = v3;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMetadata, 0);
}

@end
