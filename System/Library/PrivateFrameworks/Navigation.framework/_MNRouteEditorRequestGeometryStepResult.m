@implementation _MNRouteEditorRequestGeometryStepResult

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
}

- (GEODirectionsRequest)directionsRequest
{
  return self->_directionsRequest;
}

- (void)setDirectionsRequest:(id)a3
{
  objc_storeStrong((id *)&self->_directionsRequest, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (GEODirectionsError)directionsError
{
  return self->_directionsError;
}

- (void)setDirectionsError:(id)a3
{
  objc_storeStrong((id *)&self->_directionsError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsError, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_directionsRequest, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

@end
