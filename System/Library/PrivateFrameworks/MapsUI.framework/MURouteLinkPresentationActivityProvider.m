@implementation MURouteLinkPresentationActivityProvider

- (MURouteLinkPresentationActivityProvider)initWithSource:(id)a3 destination:(id)a4 composedRoute:(id)a5
{
  id v9;
  MURouteLinkPresentationActivityProvider *v10;
  MURouteLinkPresentationActivityProvider *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MURouteLinkPresentationActivityProvider;
  v10 = -[MURouteActivityProvider initWithSource:destination:](&v13, sel_initWithSource_destination_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_composedRoute, a5);

  return v11;
}

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
    -[MURouteActivityProvider activityURL](self, "activityURL", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    metadataWithURL(v5);
    v6 = (LPLinkMetadata *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedMetadata;
    self->_cachedMetadata = v6;

    -[MURouteLinkPresentationActivityProvider mapMetadataSpecialization](self, "mapMetadataSpecialization");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadata setSpecialization:](self->_cachedMetadata, "setSpecialization:", v8);

    cachedMetadata = self->_cachedMetadata;
  }
  return cachedMetadata;
}

- (id)mapMetadataSpecialization
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  CLLocationCoordinate2D v33;
  CLLocationCoordinate2D v34;

  v3 = objc_alloc_init(MEMORY[0x1E0CC11D0]);
  -[MURouteActivityProvider activitySourceTitle](self, "activitySourceTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v4);

  -[MURouteActivityProvider sourceMapItem](self, "sourceMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_shortAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDirectionsSourceAddress:", v6);

  -[MURouteActivityProvider sourceMapItem](self, "sourceMapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDirectionsSourceLocationName:", v8);

  -[MURouteActivityProvider sourceMapItem](self, "sourceMapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_cnPostalAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDirectionsSourceAddressComponents:", v10);

  -[MURouteActivityProvider destinationMapItem](self, "destinationMapItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_shortAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDirectionsDestinationAddress:", v12);

  -[MURouteActivityProvider destinationMapItem](self, "destinationMapItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_cnPostalAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDirectionsDestinationAddressComponents:", v14);

  -[MURouteActivityProvider destinationMapItem](self, "destinationMapItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDirectionsDestinationLocationName:", v16);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[GEOComposedRoute transportType](self->_composedRoute, "transportType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTransportType:", v17);

  -[MURouteActivityProvider sourceMapItem](self, "sourceMapItem");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[MURouteActivityProvider sourceMapItem](self, "sourceMapItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_coordinate");
    if (!CLLocationCoordinate2DIsValid(v33))
      goto LABEL_6;
    -[MURouteActivityProvider destinationMapItem](self, "destinationMapItem");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
      goto LABEL_6;
    v22 = (void *)v21;
    -[MURouteActivityProvider destinationMapItem](self, "destinationMapItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_coordinate");
    v24 = CLLocationCoordinate2DIsValid(v34);

    if (v24)
    {
      -[MURouteActivityProvider sourceMapItem](self, "sourceMapItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_coordinate");
      v26 = v25;
      v28 = v27;
      -[MURouteActivityProvider destinationMapItem](self, "destinationMapItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_coordinate");
      distanceBetweenCoordinates(v26, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setDistance:", v31);

LABEL_6:
    }
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMetadata, 0);
  objc_storeStrong((id *)&self->_composedRoute, 0);
}

@end
