@implementation ARCoachingFrame

- (ARCoachingFrame)initWithFrame:(id)a3
{
  id v4;
  ARCoachingFrame *v5;
  uint64_t v6;
  ARCamera *camera;
  double v8;
  uint64_t v9;
  ARGeoTrackingStatus *geoTrackingStatus;
  uint64_t v11;
  NSArray *anchors;
  uint64_t v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ARCoachingFrame;
  v5 = -[ARCoachingFrame init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "camera");
    v6 = objc_claimAutoreleasedReturnValue();
    camera = v5->_camera;
    v5->_camera = (ARCamera *)v6;

    objc_msgSend(v4, "timestamp");
    v5->_timestamp = v8;
    objc_msgSend(v4, "geoTrackingStatus");
    v9 = objc_claimAutoreleasedReturnValue();
    geoTrackingStatus = v5->_geoTrackingStatus;
    v5->_geoTrackingStatus = (ARGeoTrackingStatus *)v9;

    objc_msgSend(v4, "anchors");
    v11 = objc_claimAutoreleasedReturnValue();
    anchors = v5->_anchors;
    v5->_anchors = (NSArray *)v11;

    if (objc_msgSend(v4, "deviceOrientation"))
    {
      if (objc_msgSend(v4, "deviceOrientation") == 3)
      {
        v13 = 4;
      }
      else if (objc_msgSend(v4, "deviceOrientation") == 4)
      {
        v13 = 3;
      }
      else if (objc_msgSend(v4, "deviceOrientation") == 2)
      {
        v13 = 2;
      }
      else
      {
        v13 = 1;
      }
      v5->_interfaceOrientation = v13;
    }
    else
    {
      v5->_interfaceOrientation = 0;
    }
  }

  return v5;
}

- (ARCamera)camera
{
  return self->_camera;
}

- (void)setCamera:(id)a3
{
  objc_storeStrong((id *)&self->_camera, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (ARGeoTrackingStatus)geoTrackingStatus
{
  return self->_geoTrackingStatus;
}

- (void)setGeoTrackingStatus:(id)a3
{
  objc_storeStrong((id *)&self->_geoTrackingStatus, a3);
}

- (NSArray)anchors
{
  return self->_anchors;
}

- (void)setAnchors:(id)a3
{
  objc_storeStrong((id *)&self->_anchors, a3);
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchors, 0);
  objc_storeStrong((id *)&self->_geoTrackingStatus, 0);
  objc_storeStrong((id *)&self->_camera, 0);
}

@end
