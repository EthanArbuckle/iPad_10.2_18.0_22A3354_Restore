@implementation _GEOCandidateRouteMatch

- (_GEOCandidateRouteMatch)initWithRoute:(id)a3
{
  _GEOCandidateRouteMatch *v3;
  _GEOCandidateRouteMatch *v4;
  _GEOCandidateRouteMatch *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_GEOCandidateRouteMatch;
  v3 = -[_GEOCandidateRouteMatch init](&v7, sel_init, a3);
  v4 = v3;
  if (v3)
  {
    v3->_distanceFromRoute = -1.79769313e308;
    v3->_score = -1.79769313e308;
    v3->_routeCoordinate = (PolylineCoordinate)0xBF80000000000000;
    v3->_locationCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)kGEOLocationCoordinate2DInvalid;
    v5 = v3;
  }

  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Candidate match: [%0.2f] (%0.5f, %0.5f) | score: %0.2f | dist: %0.1fm"), (float)(self->_routeCoordinate.offset + (float)self->_routeCoordinate.index), *(_QWORD *)&self->_locationCoordinate.latitude, *(_QWORD *)&self->_locationCoordinate.longitude, *(_QWORD *)&self->_score, *(_QWORD *)&self->_distanceFromRoute);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0xBF80000000000000;
  return self;
}

@end
