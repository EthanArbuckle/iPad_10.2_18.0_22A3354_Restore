@implementation MNNavigationServiceCallback_DidUpdateBackgroundWalkingRoute

- (unint64_t)type
{
  return 5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_routeInfo, CFSTR("_routeInfo"));
}

- (MNNavigationServiceCallback_DidUpdateBackgroundWalkingRoute)initWithCoder:(id)a3
{
  id v4;
  MNNavigationServiceCallback_DidUpdateBackgroundWalkingRoute *v5;
  uint64_t v6;
  MNActiveRouteInfo *routeInfo;
  MNNavigationServiceCallback_DidUpdateBackgroundWalkingRoute *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNNavigationServiceCallback_DidUpdateBackgroundWalkingRoute;
  v5 = -[MNNavigationServiceCallbackParameters initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    routeInfo = v5->_routeInfo;
    v5->_routeInfo = (MNActiveRouteInfo *)v6;

    v8 = v5;
  }

  return v5;
}

- (MNActiveRouteInfo)routeInfo
{
  return self->_routeInfo;
}

- (void)setRouteInfo:(id)a3
{
  objc_storeStrong((id *)&self->_routeInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeInfo, 0);
}

@end
