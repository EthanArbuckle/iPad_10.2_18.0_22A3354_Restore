@implementation _VNRequestForensicsRequestAndObservationsCacheKeyTuple

- (_VNRequestForensicsRequestAndObservationsCacheKeyTuple)initWithRequest:(id)a3 observationsCacheKey:(id)a4
{
  id v7;
  id v8;
  _VNRequestForensicsRequestAndObservationsCacheKeyTuple *v9;
  _VNRequestForensicsRequestAndObservationsCacheKeyTuple *v10;
  _VNRequestForensicsRequestAndObservationsCacheKeyTuple *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_VNRequestForensicsRequestAndObservationsCacheKeyTuple;
  v9 = -[_VNRequestForensicsRequestAndObservationsCacheKeyTuple init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_observationsCacheKey, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_VNRequestForensicsRequestAndObservationsCacheKeyTuple request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VNRequestForensicsRequestAndObservationsCacheKeyTuple observationsCacheKey](self, "observationsCacheKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("( %@, %@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[_VNRequestForensicsRequestAndObservationsCacheKeyTuple request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[_VNRequestForensicsRequestAndObservationsCacheKeyTuple observationsCacheKey](self, "observationsCacheKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ __ROR8__(v4, 51);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _VNRequestForensicsRequestAndObservationsCacheKeyTuple *v4;
  _VNRequestForensicsRequestAndObservationsCacheKeyTuple *v5;
  VNRequest *request;
  VNRequest *v7;
  char v8;
  NSObject *observationsCacheKey;
  void *v10;

  v4 = (_VNRequestForensicsRequestAndObservationsCacheKeyTuple *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      request = self->_request;
      -[_VNRequestForensicsRequestAndObservationsCacheKeyTuple request](v5, "request");
      v7 = (VNRequest *)objc_claimAutoreleasedReturnValue();

      if (request == v7)
      {
        observationsCacheKey = self->_observationsCacheKey;
        -[_VNRequestForensicsRequestAndObservationsCacheKeyTuple observationsCacheKey](v5, "observationsCacheKey");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[NSObject isEqual:](observationsCacheKey, "isEqual:", v10);

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (VNRequest)request
{
  return self->_request;
}

- (NSObject)observationsCacheKey
{
  return self->_observationsCacheKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationsCacheKey, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
