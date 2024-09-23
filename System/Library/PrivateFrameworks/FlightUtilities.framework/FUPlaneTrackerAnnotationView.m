@implementation FUPlaneTrackerAnnotationView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setCurrentProgress:(double)a3
{
  id v4;

  -[FUPlaneTrackerAnnotationView planeLayer](self, "planeLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatePlaneStateForProgress:", a3);

}

- (void)setStartLocation:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  id v5;

  longitude = a3.longitude;
  latitude = a3.latitude;
  -[FUPlaneTrackerAnnotationView planeLayer](self, "planeLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStartLocation:", latitude, longitude);

}

- (void)setEndLocation:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  id v5;

  longitude = a3.longitude;
  latitude = a3.latitude;
  -[FUPlaneTrackerAnnotationView planeLayer](self, "planeLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEndLocation:", latitude, longitude);

}

- (CLLocationCoordinate2D)startLocation
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CLLocationCoordinate2D result;

  -[FUPlaneTrackerAnnotationView planeLayer](self, "planeLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startLocation");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.longitude = v8;
  result.latitude = v7;
  return result;
}

- (CLLocationCoordinate2D)endLocation
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CLLocationCoordinate2D result;

  -[FUPlaneTrackerAnnotationView planeLayer](self, "planeLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endLocation");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.longitude = v8;
  result.latitude = v7;
  return result;
}

- (double)currentProgress
{
  void *v2;
  double v3;
  double v4;

  -[FUPlaneTrackerAnnotationView planeLayer](self, "planeLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentProgress");
  v4 = v3;

  return v4;
}

- (CLLocationCoordinate2D)currentLocation
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CLLocationCoordinate2D result;

  -[FUPlaneTrackerAnnotationView planeLayer](self, "planeLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentLocation");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.longitude = v8;
  result.latitude = v7;
  return result;
}

- (void)setStartLatitude:(double)a3 startLongitude:(double)a4 endLatitude:(double)a5 endLongitude:(double)a6
{
  id v9;

  -[FUPlaneTrackerAnnotationView setStartLocation:](self, "setStartLocation:", a3, a4);
  -[FUPlaneTrackerAnnotationView setEndLocation:](self, "setEndLocation:", a5, a6);
  -[FUPlaneTrackerAnnotationView layer](self, "layer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updatePlaneStateForProgress:", 0.0);

}

- (FUPlaneTrackerAnnotationView)init
{
  FUPlaneTrackerAnnotationView *v2;
  FUPlaneTrackerAnnotationView *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FUPlaneTrackerAnnotationView;
  v2 = -[FUPlaneTrackerAnnotationView init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    -[FUPlaneTrackerAnnotationView layer](v2, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAnchorPoint:", 0.5, 0.5);

    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "CGColor");
    -[FUPlaneTrackerAnnotationView layer](v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShadowColor:", v6);

    -[FUPlaneTrackerAnnotationView layer](v3, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 1061997773;
    objc_msgSend(v8, "setShadowOpacity:", v9);

    -[FUPlaneTrackerAnnotationView layer](v3, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShadowRadius:", 2.0);

    -[FUPlaneTrackerAnnotationView layer](v3, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShadowOffset:", 0.0, 0.0);

  }
  return v3;
}

+ (id)defaultAnotation
{
  return objc_alloc_init(FUPlaneTrackerAnnotationView);
}

- (void)setShowsPlane:(BOOL)a3
{
  id v4;

  if (self->_showsPlane != a3)
  {
    self->_showsPlane = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("airplane"));
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[FUPlaneTrackerAnnotationView setPlaneImage:](self, "setPlaneImage:", v4);

    }
    else
    {
      -[FUPlaneTrackerAnnotationView setPlaneImage:](self, "setPlaneImage:", 0);
    }
  }
}

- (void)setPlaneImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FUPlaneTrackerAnnotationView planeLayer](self, "planeLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaneImage:", v4);

  -[FUPlaneTrackerAnnotationView layer](self, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  -[FUPlaneTrackerAnnotationView setFrame:](self, "setFrame:");

}

- (void)didMoveToSuperview
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)FUPlaneTrackerAnnotationView;
  -[MKAnnotationView didMoveToSuperview](&v12, sel_didMoveToSuperview);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[FUPlaneTrackerAnnotationView viewAddedBlock](self, "viewAddedBlock", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

  -[FUPlaneTrackerAnnotationView setViewAddedBlock:](self, "setViewAddedBlock:", 0);
}

- (void)notifyWhenIsVisibleWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[FUPlaneTrackerAnnotationView viewAddedBlock](self, "viewAddedBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[FUPlaneTrackerAnnotationView setViewAddedBlock:](self, "setViewAddedBlock:", v6);

  }
  -[FUPlaneTrackerAnnotationView viewAddedBlock](self, "viewAddedBlock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x22768FDE0](v4);

  objc_msgSend(v8, "addObject:", v7);
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

- (NSMutableArray)viewAddedBlock
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setViewAddedBlock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewAddedBlock, 0);
}

@end
