@implementation _MNETAUpdateRequestParameters

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (BOOL)shouldUseConditionalRequest
{
  return self->_shouldUseConditionalRequest;
}

- (void)setShouldUseConditionalRequest:(BOOL)a3
{
  self->_shouldUseConditionalRequest = a3;
}

- (BOOL)shouldRepeatAfterCompletion
{
  return self->_shouldRepeatAfterCompletion;
}

- (void)setShouldRepeatAfterCompletion:(BOOL)a3
{
  self->_shouldRepeatAfterCompletion = a3;
}

- (BOOL)shouldRetryImmediatelyOnError
{
  return self->_shouldRetryImmediatelyOnError;
}

- (void)setShouldRetryImmediatelyOnError:(BOOL)a3
{
  self->_shouldRetryImmediatelyOnError = a3;
}

- (BOOL)shouldTrackPendingRequest
{
  return self->_shouldTrackPendingRequest;
}

- (void)setShouldTrackPendingRequest:(BOOL)a3
{
  self->_shouldTrackPendingRequest = a3;
}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (void)setRouteAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_routeAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeAttributes, 0);
}

@end
