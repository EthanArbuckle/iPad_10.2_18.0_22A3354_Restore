@implementation MNRouteCoordinateWithType

- (id)description
{
  unint64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;

  v3 = -[MNRouteCoordinateWithType significanceType](self, "significanceType");
  v4 = CFSTR("Divergence");
  if (v3 == 1)
    v4 = CFSTR("Convergence");
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%u, %0.2f] - %@"), -[MNRouteCoordinateWithType routeCoordinate](self, "routeCoordinate"), COERCE_FLOAT((unint64_t)-[MNRouteCoordinateWithType routeCoordinate](self, "routeCoordinate") >> 32), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)divergenceCoordinate:(PolylineCoordinate)a3
{
  MNRouteCoordinateWithType *v4;

  v4 = objc_alloc_init(MNRouteCoordinateWithType);
  -[MNRouteCoordinateWithType setSignificanceType:](v4, "setSignificanceType:", 0);
  -[MNRouteCoordinateWithType setRouteCoordinate:](v4, "setRouteCoordinate:", a3);
  return v4;
}

+ (id)convergenceCoordinate:(PolylineCoordinate)a3
{
  MNRouteCoordinateWithType *v4;

  v4 = objc_alloc_init(MNRouteCoordinateWithType);
  -[MNRouteCoordinateWithType setSignificanceType:](v4, "setSignificanceType:", 1);
  -[MNRouteCoordinateWithType setRouteCoordinate:](v4, "setRouteCoordinate:", a3);
  return v4;
}

- (unint64_t)significanceType
{
  return self->_significanceType;
}

- (void)setSignificanceType:(unint64_t)a3
{
  self->_significanceType = a3;
}

- (PolylineCoordinate)routeCoordinate
{
  return self->_routeCoordinate;
}

- (void)setRouteCoordinate:(PolylineCoordinate)a3
{
  self->_routeCoordinate = a3;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0xBF80000000000000;
  return self;
}

@end
