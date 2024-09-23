@implementation MKMapSnapshotRequest

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t zoomLevel;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)MKMapSnapshotRequest;
  -[MKMapSnapshotRequest description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *(_QWORD *)&self->_coordinate.latitude, *(_QWORD *)&self->_coordinate.longitude);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  zoomLevel = self->_zoomLevel;
  NSStringFromCGSize(self->_size);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ c:%@ zoom:%lu size:%@"), v4, v5, zoomLevel, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)start
{
  VKMapSnapshotCreator *snapshotCreator;
  void *v4;
  void *v5;
  double v6;
  NSObject *v7;
  os_signpost_id_t v8;
  id v9;
  VKMapSnapshotCreator *v10;
  VKMapSnapshotCreator *v11;
  VKMapSnapshotCreator *v12;
  _QWORD v13[6];

  snapshotCreator = self->_snapshotCreator;
  if (snapshotCreator)
  {
    self->_snapshotCreator = 0;

  }
  objc_msgSend(MEMORY[0x1E0D27208], "_mapkit_mapRegionForCoordinateRegion:", MKCoordinateRegionMakeWithZoomLevel(self->_coordinate.latitude, self->_coordinate.longitude, (double)self->_zoomLevel, self->_size.width, self->_size.height));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isHiDPI"))
    v6 = 2.0;
  else
    v6 = 1.0;

  MKGetSnapshotLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  v9 = objc_alloc(MEMORY[0x1E0DC6518]);
  v10 = (VKMapSnapshotCreator *)objc_msgSend(v9, "initWithSize:scale:homeQueue:signpostId:mapType:mapDisplayStyles:mapDisplayStylesCount:auditToken:", MEMORY[0x1E0C80D38], v8, 0, 0, 0, 0, self->_size.width, self->_size.height, v6);
  v11 = self->_snapshotCreator;
  self->_snapshotCreator = v10;

  -[VKMapSnapshotCreator setMapType:](self->_snapshotCreator, "setMapType:", 0);
  -[VKMapSnapshotCreator setMapRegion:pitch:yaw:](self->_snapshotCreator, "setMapRegion:pitch:yaw:", v4, 0.0, 0.0);
  v12 = self->_snapshotCreator;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __29__MKMapSnapshotRequest_start__block_invoke;
  v13[3] = &unk_1E20D8ED8;
  v13[4] = self;
  *(double *)&v13[5] = v6;
  -[VKMapSnapshotCreator renderSnapshot:](v12, "renderSnapshot:", v13);

}

void __29__MKMapSnapshotRequest_start__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__MKMapSnapshotRequest_start__block_invoke_2;
  v4[3] = &unk_1E20D8EB0;
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "enumerateImagesWithBlock:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setAttributionString:", 0);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(WeakRetained, "_respondWithSnapshot");

}

void __29__MKMapSnapshotRequest_start__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", a3, 0, *(double *)(a1 + 40));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v4;

  }
}

- (void)cancel
{
  -[VKMapSnapshotCreator cancel](self->_snapshotCreator, "cancel");
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (id)requester
{
  return self->_requester;
}

- (void)setRequester:(id)a3
{
  objc_storeStrong(&self->_requester, a3);
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

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (unint64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setZoomLevel:(unint64_t)a3
{
  self->_zoomLevel = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (MKMapSnapshotCreator)delegate
{
  return (MKMapSnapshotCreator *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)attributionString
{
  return self->_attributionString;
}

- (void)setAttributionString:(id)a3
{
  objc_storeStrong((id *)&self->_attributionString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotCreator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_attributionString, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong(&self->_requester, 0);
}

@end
