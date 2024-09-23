@implementation MNNavigationServiceCallback_DidUpdateResumeRouteHandle

+ (id)didUpdateResumeRouteHandle:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setResumeRouteHandle:", v3);

  return v4;
}

- (unint64_t)type
{
  return 9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_resumeRouteHandle, CFSTR("_resumeRouteHandle"));
}

- (MNNavigationServiceCallback_DidUpdateResumeRouteHandle)initWithCoder:(id)a3
{
  id v4;
  MNNavigationServiceCallback_DidUpdateResumeRouteHandle *v5;
  uint64_t v6;
  GEOResumeRouteHandle *resumeRouteHandle;
  MNNavigationServiceCallback_DidUpdateResumeRouteHandle *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNNavigationServiceCallback_DidUpdateResumeRouteHandle;
  v5 = -[MNNavigationServiceCallbackParameters initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_resumeRouteHandle"));
    v6 = objc_claimAutoreleasedReturnValue();
    resumeRouteHandle = v5->_resumeRouteHandle;
    v5->_resumeRouteHandle = (GEOResumeRouteHandle *)v6;

    v8 = v5;
  }

  return v5;
}

- (GEOResumeRouteHandle)resumeRouteHandle
{
  return self->_resumeRouteHandle;
}

- (void)setResumeRouteHandle:(id)a3
{
  objc_storeStrong((id *)&self->_resumeRouteHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resumeRouteHandle, 0);
}

@end
