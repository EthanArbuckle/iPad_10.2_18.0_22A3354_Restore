@implementation MSDMapAnnotation

- (MSDMapAnnotation)initWithStoreInfo:(id)a3
{
  id v5;
  MSDMapAnnotation *v6;
  MSDMapAnnotation *v7;
  uint64_t v8;
  NSString *title;
  void *v10;
  CLLocationDegrees v11;
  CLLocationDegrees v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MSDMapAnnotation;
  v6 = -[MSDMapAnnotation init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storeInfo, a3);
    objc_msgSend(v5, "storeName");
    v8 = objc_claimAutoreleasedReturnValue();
    title = v7->_title;
    v7->_title = (NSString *)v8;

    objc_msgSend(v5, "storeLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "coordinate");
    v7->_coordinate.latitude = v11;
    v7->_coordinate.longitude = v12;

  }
  return v7;
}

- (BOOL)isSameLocation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  BOOL v21;
  void *v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[MSDMapAnnotation storeInfo](self, "storeInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "storeLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "coordinate");
    v9 = v8;
    objc_msgSend(v5, "storeInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "storeLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "coordinate");
    if (v9 == v12)
    {
      -[MSDMapAnnotation storeInfo](self, "storeInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "storeLocation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "coordinate");
      v15 = v14;
      objc_msgSend(v5, "storeInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "storeLocation");
      v17 = v7;
      v18 = v6;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "coordinate");
      v21 = v15 == v20;

      v6 = v18;
      v7 = v17;

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (NSString)title
{
  return self->_title;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (MSDStoreInfo)storeInfo
{
  return self->_storeInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeInfo, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
