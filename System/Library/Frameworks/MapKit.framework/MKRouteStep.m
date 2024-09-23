@implementation MKRouteStep

- (id)_initWithGEOComposedRouteStep:(id)a3 instructions:(id)a4 transportType:(unint64_t)a5 polyline:(id)a6
{
  id v11;
  id v12;
  id v13;
  MKRouteStep *v14;
  MKRouteStep *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MKRouteStep;
  v14 = -[MKRouteStep init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_geoComposedRouteStep, a3);
    objc_storeStrong((id *)&v15->_polyline, a6);
    v15->_transportType = a5;
    objc_storeStrong((id *)&v15->_instructions, a4);
  }

  return v15;
}

- (NSString)notice
{
  return 0;
}

- (CLLocationDistance)distance
{
  CLLocationDistance result;

  -[GEOComposedRouteStep distance](self->_geoComposedRouteStep, "distance");
  return result;
}

- (MKPolyline)polyline
{
  return &self->_polyline->super;
}

- (NSString)instructions
{
  return self->_instructions;
}

- (MKDirectionsTransportType)transportType
{
  return self->_transportType;
}

- (GEOComposedRouteStep)_geoComposedRouteStep
{
  return self->_geoComposedRouteStep;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_polyline, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_geoComposedRouteStep, 0);
}

@end
