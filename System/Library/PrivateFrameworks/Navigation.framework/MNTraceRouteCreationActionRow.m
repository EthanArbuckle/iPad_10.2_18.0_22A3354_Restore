@implementation MNTraceRouteCreationActionRow

- (double)requestTimestamp
{
  return self->_requestTimestamp;
}

- (void)setRequestTimestamp:(double)a3
{
  self->_requestTimestamp = a3;
}

- (double)responseTimestamp
{
  return self->_responseTimestamp;
}

- (void)setResponseTimestamp:(double)a3
{
  self->_responseTimestamp = a3;
}

- (GEODirectionsRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (GEODirectionsResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSArray)anchorPoints
{
  return self->_anchorPoints;
}

- (void)setAnchorPoints:(id)a3
{
  objc_storeStrong((id *)&self->_anchorPoints, a3);
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorPoints, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
