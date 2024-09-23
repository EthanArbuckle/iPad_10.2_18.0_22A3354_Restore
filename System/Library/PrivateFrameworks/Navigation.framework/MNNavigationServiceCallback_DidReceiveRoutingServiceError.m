@implementation MNNavigationServiceCallback_DidReceiveRoutingServiceError

- (unint64_t)type
{
  return 3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_error, CFSTR("_error"));
}

- (MNNavigationServiceCallback_DidReceiveRoutingServiceError)initWithCoder:(id)a3
{
  id v4;
  MNNavigationServiceCallback_DidReceiveRoutingServiceError *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSError *error;
  MNNavigationServiceCallback_DidReceiveRoutingServiceError *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MNNavigationServiceCallback_DidReceiveRoutingServiceError;
  v5 = -[MNNavigationServiceCallbackParameters initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("_error"));
    v10 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v10;

    v12 = v5;
  }

  return v5;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
