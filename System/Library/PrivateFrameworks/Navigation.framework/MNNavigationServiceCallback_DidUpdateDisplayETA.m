@implementation MNNavigationServiceCallback_DidUpdateDisplayETA

- (unint64_t)type
{
  return 6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MNNavigationServiceCallback_DidUpdateDisplayETA;
  v4 = a3;
  -[MNNavigationServiceCallbackParameters encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_batteryChargeInfo, CFSTR("_batteryChargeInfo"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayETAInfo, CFSTR("_displayETAInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeDistanceInfo, CFSTR("_routeDistanceInfo"));

}

- (MNNavigationServiceCallback_DidUpdateDisplayETA)initWithCoder:(id)a3
{
  id v4;
  MNNavigationServiceCallback_DidUpdateDisplayETA *v5;
  uint64_t v6;
  MNBatteryChargeInfo *batteryChargeInfo;
  uint64_t v8;
  MNDisplayETAInfo *displayETAInfo;
  uint64_t v10;
  MNRouteDistanceInfo *routeDistanceInfo;
  MNNavigationServiceCallback_DidUpdateDisplayETA *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MNNavigationServiceCallback_DidUpdateDisplayETA;
  v5 = -[MNNavigationServiceCallbackParameters initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_batteryChargeInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    batteryChargeInfo = v5->_batteryChargeInfo;
    v5->_batteryChargeInfo = (MNBatteryChargeInfo *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_displayETAInfo"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayETAInfo = v5->_displayETAInfo;
    v5->_displayETAInfo = (MNDisplayETAInfo *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeDistanceInfo"));
    v10 = objc_claimAutoreleasedReturnValue();
    routeDistanceInfo = v5->_routeDistanceInfo;
    v5->_routeDistanceInfo = (MNRouteDistanceInfo *)v10;

    v12 = v5;
  }

  return v5;
}

- (MNBatteryChargeInfo)batteryChargeInfo
{
  return self->_batteryChargeInfo;
}

- (void)setBatteryChargeInfo:(id)a3
{
  objc_storeStrong((id *)&self->_batteryChargeInfo, a3);
}

- (MNDisplayETAInfo)displayETAInfo
{
  return self->_displayETAInfo;
}

- (void)setDisplayETAInfo:(id)a3
{
  objc_storeStrong((id *)&self->_displayETAInfo, a3);
}

- (MNRouteDistanceInfo)routeDistanceInfo
{
  return self->_routeDistanceInfo;
}

- (void)setRouteDistanceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_routeDistanceInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeDistanceInfo, 0);
  objc_storeStrong((id *)&self->_displayETAInfo, 0);
  objc_storeStrong((id *)&self->_batteryChargeInfo, 0);
}

@end
