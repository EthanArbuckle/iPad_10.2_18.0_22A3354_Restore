@implementation ARSessionMetricsFrameProperties

- (ARSessionMetricsFrameProperties)initWithFrame:(id)a3
{
  id v4;
  ARSessionMetricsFrameProperties *v5;
  uint64_t v6;
  ARCamera *camera;
  uint64_t v8;
  ARWorldTrackingState *worldTrackingState;
  uint64_t v10;
  NSArray *anchors;
  uint64_t v12;
  ARGeoTrackingStatus *geoTrackingStatus;
  uint64_t v14;
  CLLocation *location;
  uint64_t v16;
  ARVLStateData *vlState;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ARSessionMetricsFrameProperties;
  v5 = -[ARSessionMetricsFrameProperties init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "camera");
    v6 = objc_claimAutoreleasedReturnValue();
    camera = v5->_camera;
    v5->_camera = (ARCamera *)v6;

    objc_msgSend(v4, "worldTrackingState");
    v8 = objc_claimAutoreleasedReturnValue();
    worldTrackingState = v5->_worldTrackingState;
    v5->_worldTrackingState = (ARWorldTrackingState *)v8;

    objc_msgSend(v4, "anchors");
    v10 = objc_claimAutoreleasedReturnValue();
    anchors = v5->_anchors;
    v5->_anchors = (NSArray *)v10;

    objc_msgSend(v4, "geoTrackingStatus");
    v12 = objc_claimAutoreleasedReturnValue();
    geoTrackingStatus = v5->_geoTrackingStatus;
    v5->_geoTrackingStatus = (ARGeoTrackingStatus *)v12;

    objc_msgSend(v4, "location");
    v14 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (CLLocation *)v14;

    objc_msgSend(v4, "vlState");
    v16 = objc_claimAutoreleasedReturnValue();
    vlState = v5->_vlState;
    v5->_vlState = (ARVLStateData *)v16;

  }
  return v5;
}

- (ARCamera)camera
{
  return self->_camera;
}

- (ARWorldTrackingState)worldTrackingState
{
  return self->_worldTrackingState;
}

- (NSArray)anchors
{
  return self->_anchors;
}

- (ARGeoTrackingStatus)geoTrackingStatus
{
  return self->_geoTrackingStatus;
}

- (CLLocation)location
{
  return self->_location;
}

- (ARVLStateData)vlState
{
  return self->_vlState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vlState, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_geoTrackingStatus, 0);
  objc_storeStrong((id *)&self->_anchors, 0);
  objc_storeStrong((id *)&self->_worldTrackingState, 0);
  objc_storeStrong((id *)&self->_camera, 0);
}

@end
