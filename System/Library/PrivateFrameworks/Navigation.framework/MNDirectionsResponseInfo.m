@implementation MNDirectionsResponseInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNDirectionsResponseInfo)initWithCoder:(id)a3
{
  id v4;
  MNDirectionsResponseInfo *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *routeInfos;
  uint64_t v11;
  GEODirectionsRequest *request;
  uint64_t v13;
  GEODirectionsResponse *response;
  uint64_t v15;
  NSError *error;
  uint64_t v17;
  GEODirectionsError *directionsError;
  uint64_t v19;
  MNTraceRecordingData *traceRecordingData;
  MNDirectionsResponseInfo *v21;

  v4 = a3;
  v5 = -[MNDirectionsResponseInfo init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_routeInfos"));
    v9 = objc_claimAutoreleasedReturnValue();
    routeInfos = v5->_routeInfos;
    v5->_routeInfos = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_request"));
    v11 = objc_claimAutoreleasedReturnValue();
    request = v5->_request;
    v5->_request = (GEODirectionsRequest *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_response"));
    v13 = objc_claimAutoreleasedReturnValue();
    response = v5->_response;
    v5->_response = (GEODirectionsResponse *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_error"));
    v15 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_directionsError"));
    v17 = objc_claimAutoreleasedReturnValue();
    directionsError = v5->_directionsError;
    v5->_directionsError = (GEODirectionsError *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_traceRecordingData"));
    v19 = objc_claimAutoreleasedReturnValue();
    traceRecordingData = v5->_traceRecordingData;
    v5->_traceRecordingData = (MNTraceRecordingData *)v19;

    v21 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *routeInfos;
  id v5;

  routeInfos = self->_routeInfos;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", routeInfos, CFSTR("_routeInfos"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_request, CFSTR("_request"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_response, CFSTR("_response"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("_error"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_directionsError, CFSTR("_directionsError"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_traceRecordingData, CFSTR("_traceRecordingData"));

}

- (NSArray)routeInfos
{
  return self->_routeInfos;
}

- (void)setRouteInfos:(id)a3
{
  objc_storeStrong((id *)&self->_routeInfos, a3);
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

- (GEODirectionsError)directionsError
{
  return self->_directionsError;
}

- (void)setDirectionsError:(id)a3
{
  objc_storeStrong((id *)&self->_directionsError, a3);
}

- (MNTraceRecordingData)traceRecordingData
{
  return self->_traceRecordingData;
}

- (void)setTraceRecordingData:(id)a3
{
  objc_storeStrong((id *)&self->_traceRecordingData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceRecordingData, 0);
  objc_storeStrong((id *)&self->_directionsError, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_routeInfos, 0);
}

@end
