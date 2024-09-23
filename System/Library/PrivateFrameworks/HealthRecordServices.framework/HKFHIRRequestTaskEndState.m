@implementation HKFHIRRequestTaskEndState

- (HKFHIRRequestTaskEndState)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKFHIRRequestTaskEndState)initWithRequestedURL:(id)a3 responseStatusCode:(int64_t)a4 requestDuration:(double)a5 hadError:(BOOL)a6
{
  id v10;
  HKFHIRRequestTaskEndState *v11;
  uint64_t v12;
  NSURL *requestedURL;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKFHIRRequestTaskEndState;
  v11 = -[HKFHIRRequestTaskEndState init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    requestedURL = v11->_requestedURL;
    v11->_requestedURL = (NSURL *)v12;

    v11->_responseStatusCode = a4;
    v11->_requestDuration = a5;
    v11->_hadError = a6;
  }

  return v11;
}

+ (id)endStateForCanceledRequestAtURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequestedURL:responseStatusCode:requestDuration:hadError:", v4, 0, 1, 0.0);

  return v5;
}

- (NSString)eventLoggingDescription
{
  void *v2;
  NSURL *requestedURL;
  int64_t responseStatusCode;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  requestedURL = self->_requestedURL;
  responseStatusCode = self->_responseStatusCode;
  HKStringFromBool();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("End state for URL: %@; HTTP status: %lu; had error: %@"),
    requestedURL,
    responseStatusCode,
    v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)asErrorEndState
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRequestedURL:responseStatusCode:requestDuration:hadError:", self->_requestedURL, self->_responseStatusCode, 1, self->_requestDuration);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ %p> URL: %@; HTTP status: %lu"),
               objc_opt_class(),
               self,
               self->_requestedURL,
               self->_responseStatusCode);
}

- (unint64_t)hash
{
  return self->_responseStatusCode ^ -[NSURL hash](self->_requestedURL, "hash") ^ self->_hadError ^ (unint64_t)self->_requestDuration;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKFHIRRequestTaskEndState *v6;
  HKFHIRRequestTaskEndState *v7;
  HKFHIRRequestTaskEndState *v8;
  NSURL *requestedURL;
  NSURL *v10;
  uint64_t v11;
  NSURL *v12;
  BOOL v13;
  BOOL v14;
  int64_t responseStatusCode;
  double requestDuration;
  double v17;
  _BOOL4 hadError;

  v6 = (HKFHIRRequestTaskEndState *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
LABEL_17:

      goto LABEL_18;
    }
    requestedURL = self->_requestedURL;
    -[HKFHIRRequestTaskEndState requestedURL](v8, "requestedURL");
    v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
    if (requestedURL == v10)
      goto LABEL_9;
    -[HKFHIRRequestTaskEndState requestedURL](v8, "requestedURL");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v14 = 0;
      goto LABEL_16;
    }
    v3 = (void *)v11;
    v12 = self->_requestedURL;
    -[HKFHIRRequestTaskEndState requestedURL](v8, "requestedURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSURL isEqual:](v12, "isEqual:", v4))
    {
LABEL_9:
      responseStatusCode = self->_responseStatusCode;
      if (responseStatusCode == -[HKFHIRRequestTaskEndState responseStatusCode](v8, "responseStatusCode")
        && (requestDuration = self->_requestDuration,
            -[HKFHIRRequestTaskEndState requestDuration](v8, "requestDuration"),
            requestDuration == v17))
      {
        hadError = self->_hadError;
        v13 = hadError == -[HKFHIRRequestTaskEndState hadError](v8, "hadError");
        v14 = v13;
      }
      else
      {
        v13 = 0;
        v14 = 0;
      }
      if (requestedURL == v10)
        goto LABEL_16;
    }
    else
    {
      v13 = 0;
    }

    v14 = v13;
LABEL_16:

    goto LABEL_17;
  }
  v14 = 1;
LABEL_18:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *requestedURL;
  id v5;

  requestedURL = self->_requestedURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", requestedURL, CFSTR("requestedURL"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_responseStatusCode, CFSTR("responseStatusCode"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("requestDuration"), self->_requestDuration);
  objc_msgSend(v5, "encodeBool:forKey:", self->_hadError, CFSTR("hadError"));

}

- (HKFHIRRequestTaskEndState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  HKFHIRRequestTaskEndState *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestedURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("responseStatusCode"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("requestDuration"))
    && (objc_msgSend(v4, "containsValueForKey:", CFSTR("hadError")) & 1) != 0)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("responseStatusCode"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("requestDuration"));
    self = -[HKFHIRRequestTaskEndState initWithRequestedURL:responseStatusCode:requestDuration:hadError:](self, "initWithRequestedURL:responseStatusCode:requestDuration:hadError:", v5, v6, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hadError")), v7);
    v8 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v8 = 0;
  }

  return v8;
}

- (NSURL)requestedURL
{
  return self->_requestedURL;
}

- (int64_t)responseStatusCode
{
  return self->_responseStatusCode;
}

- (double)requestDuration
{
  return self->_requestDuration;
}

- (BOOL)hadError
{
  return self->_hadError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedURL, 0);
}

@end
