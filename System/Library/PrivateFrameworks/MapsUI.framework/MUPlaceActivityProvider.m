@implementation MUPlaceActivityProvider

- (MUPlaceActivityProvider)initWithMapItem:(id)a3
{
  id v5;
  MUPlaceActivityProvider *v6;
  MUPlaceActivityProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPlaceActivityProvider;
  v6 = -[MUPlaceActivityProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mapItem, a3);

  return v7;
}

- (id)activityTitle
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[MUPlaceActivityProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUPlaceActivityProvider delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "titleForMapActivity:", self);
  }
  else
  {
    -[MUPlaceActivityProvider mapItem](self, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)activitySubTitle
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  -[MUPlaceActivityProvider mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_firstLocalizedCategoryName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUPlaceActivityProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MUPlaceActivityProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subtitleForMapActivity:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;

      v4 = v9;
    }

  }
  return v4;
}

- (id)activityImage
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[MUPlaceActivityProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUPlaceActivityProvider delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageForMapActivity:", self);
  }
  else
  {
    -[MUPlaceActivityProvider mapItem](self, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    categoryIconFromMapItem(v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)activityURL
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[MUPlaceActivityProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUPlaceActivityProvider delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "urlForMapActivity:", self);
  }
  else
  {
    -[MUPlaceActivityProvider mapItem](self, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_activityURL");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    -[MUPlaceActivityProvider mapItem](self, "mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sharingURL");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)activityAnnotationView
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[MUPlaceActivityProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUPlaceActivityProvider delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "annotationViewForMapActivity:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0CC1878]);
    -[MUPlaceActivityProvider mapItem](self, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placemark");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "initWithAnnotation:reuseIdentifier:", v8, 0);

  }
  return v6;
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
  void *v18;
  double v19;
  CLLocationDegrees v20;
  void *v21;
  CLLocationDegrees v22;
  CLLocationCoordinate2D v23;
  void *v24;
  double v25;
  double v26;
  void *v27;

  v3 = objc_alloc_init(MEMORY[0x1E0CC11D0]);
  -[MUPlaceActivityProvider activityTitle](self, "activityTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v4);

  -[MUPlaceActivityProvider mapItem](self, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_shortAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAddress:", v6);

  -[MUPlaceActivityProvider mapItem](self, "mapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_cnPostalAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAddressComponents:", v8);

  -[MUPlaceActivityProvider mapItem](self, "mapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_coordinate");
  objc_msgSend(v3, "setLocation:");

  -[MUPlaceActivityProvider mapItem](self, "mapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  categoryIconFromMapItem(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCategoryIcon:", v11);

  -[MUPlaceActivityProvider mapItem](self, "mapItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_firstLocalizedCategoryName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[MUPlaceActivityProvider mapItem](self, "mapItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_firstLocalizedCategoryName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCategory:", v15);

  }
  objc_msgSend(MEMORY[0x1E0CC1810], "sharedLocationManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "latLng");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lat");
  v20 = v19;
  objc_msgSend(v17, "latLng");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lng");
  v23 = CLLocationCoordinate2DMake(v20, v22);

  -[MUPlaceActivityProvider mapItem](self, "mapItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_coordinate");
  distanceBetweenCoordinates(v23.latitude, v23.longitude, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDistance:", v27);

  return v3;
}

- (MUPlaceActivityProviderDelegate)delegate
{
  return (MUPlaceActivityProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
