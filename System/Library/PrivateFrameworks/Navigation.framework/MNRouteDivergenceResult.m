@implementation MNRouteDivergenceResult

- (MNRouteDivergenceResult)init
{
  MNRouteDivergenceResult *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MNRouteDivergenceResult;
  result = -[MNRouteDivergenceResult init](&v3, sel_init);
  if (result)
    result->_routeCoordinate = (PolylineCoordinate)*MEMORY[0x1E0D26A38];
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t resultType;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  GEOPolylineCoordinateAsString();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  resultType = self->_resultType;
  v7 = CFSTR("None");
  if (resultType == 1)
    v7 = CFSTR("Divergence");
  if (resultType == 2)
    v8 = CFSTR("Convergence");
  else
    v8 = v7;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%f, %f) | %@ | %@"), v4, *(_QWORD *)&self->_locationCoordinate.latitude, *(_QWORD *)&self->_locationCoordinate.longitude, self->_routeID, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSUUID)routeID
{
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (unint64_t)resultType
{
  return self->_resultType;
}

- (void)setResultType:(unint64_t)a3
{
  self->_resultType = a3;
}

- (PolylineCoordinate)routeCoordinate
{
  return self->_routeCoordinate;
}

- (void)setRouteCoordinate:(PolylineCoordinate)a3
{
  self->_routeCoordinate = a3;
}

- ($1AB5FA073B851C12C2339EC22442E995)locationCoordinate
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_locationCoordinate.latitude;
  longitude = self->_locationCoordinate.longitude;
  altitude = self->_locationCoordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setLocationCoordinate:(id)a3
{
  self->_locationCoordinate = ($5B2A0FEE2A1717E36A90D599307F83D1)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeID, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0xBF80000000000000;
  return self;
}

@end
