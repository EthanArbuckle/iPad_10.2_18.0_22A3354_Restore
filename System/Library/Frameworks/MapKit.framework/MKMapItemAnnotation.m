@implementation MKMapItemAnnotation

- (MKMapItemAnnotation)initWithMapItem:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  MKMapItemAnnotation *v15;
  MKMapItemAnnotation *v16;
  MKMapItemAnnotation *v17;
  objc_super v19;

  v5 = a3;
  objc_msgSend(v5, "placemark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v5, "placemark");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "coordinate");
    v12 = v11;
    v14 = v13;

    v15 = 0;
    if (v14 >= -180.0 && v14 <= 180.0 && v12 >= -90.0 && v12 <= 90.0)
    {
      v19.receiver = self;
      v19.super_class = (Class)MKMapItemAnnotation;
      v16 = -[MKMapItemAnnotation init](&v19, sel_init);
      v17 = v16;
      if (v16)
        objc_storeStrong((id *)&v16->_mapItem, a3);
      self = v17;
      v15 = self;
    }
  }
  else
  {

    v15 = 0;
  }

  return v15;
}

- (CLLocationCoordinate2D)coordinate
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CLLocationCoordinate2D result;

  -[MKMapItem placemark](self->_mapItem, "placemark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "coordinate");
    v5 = v4;
    v7 = v6;
  }
  else
  {
    v5 = *MEMORY[0x1E0C9E500];
    v7 = *(double *)(MEMORY[0x1E0C9E500] + 8);
  }

  v8 = v5;
  v9 = v7;
  result.longitude = v9;
  result.latitude = v8;
  return result;
}

- (NSString)title
{
  return -[MKMapItem name](self->_mapItem, "name");
}

- (MKMapItem)_representedMapItem
{
  return self->_mapItem;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
