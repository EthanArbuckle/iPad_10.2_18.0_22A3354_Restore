@implementation MXAggregateEndpointCallback

- (MXAggregateEndpointCallback)initWithAggregate:(OpaqueFigEndpoint *)a3 features:(unint64_t)a4 options:(id)a5 callback:(void *)a6 callbackRefCon:(void *)a7 operationType:(unint64_t)a8
{
  MXAggregateEndpointCallback *v14;
  OpaqueFigEndpoint *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MXAggregateEndpointCallback;
  v14 = -[MXAggregateEndpointCallback init](&v17, sel_init);
  if (v14)
  {
    if (a3)
      v15 = (OpaqueFigEndpoint *)CFRetain(a3);
    else
      v15 = 0;
    v14->_endpoint = v15;
    v14->_features = a4;
    v14->_options = (NSDictionary *)objc_msgSend(a5, "copy");
    v14->_callback = a6;
    v14->_callbackRefCon = a7;
    v14->_operationType = a8;
    v14->_creationTime = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
  }
  return v14;
}

- (void)dealloc
{
  OpaqueFigEndpoint *endpoint;
  NSDictionary *options;
  objc_super v5;

  endpoint = self->_endpoint;
  if (endpoint)
  {
    CFRelease(endpoint);
    self->_endpoint = 0;
  }
  options = self->_options;
  if (options)
  {
    CFRelease(options);
    self->_options = 0;
  }
  self->_callback = 0;
  self->_callbackRefCon = 0;

  self->_creationTime = 0;
  v5.receiver = self;
  v5.super_class = (Class)MXAggregateEndpointCallback;
  -[MXAggregateEndpointCallback dealloc](&v5, sel_dealloc);
}

- (id)_debugStringForOperationType:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("Unknown");
  else
    return off_1E309F130[a3 - 1];
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MXAggregateEndpoint (%p)] [endpoint: (%p)] [operationType: %@]"), self, self->_endpoint, -[MXAggregateEndpointCallback _debugStringForOperationType:](self, "_debugStringForOperationType:", self->_operationType));
}

- (OpaqueFigEndpoint)endpoint
{
  return self->_endpoint;
}

- (unint64_t)features
{
  return self->_features;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)callback
{
  return self->_callback;
}

- (void)callbackRefCon
{
  return self->_callbackRefCon;
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (NSDate)creationTime
{
  return self->_creationTime;
}

@end
