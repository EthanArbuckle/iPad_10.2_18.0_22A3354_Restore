@implementation MNNavigationServiceCallback_DidUpdateVehicleParkingInfo

- (unint64_t)type
{
  return 13;
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
  v5.super_class = (Class)MNNavigationServiceCallback_DidUpdateVehicleParkingInfo;
  v4 = a3;
  -[MNNavigationServiceCallbackParameters encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_vehicleParkingInfo, CFSTR("_vehicleParkingInfo"), v5.receiver, v5.super_class);

}

- (MNNavigationServiceCallback_DidUpdateVehicleParkingInfo)initWithCoder:(id)a3
{
  id v4;
  MNNavigationServiceCallback_DidUpdateVehicleParkingInfo *v5;
  uint64_t v6;
  MNVehicleParkingInfo *vehicleParkingInfo;
  MNNavigationServiceCallback_DidUpdateVehicleParkingInfo *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNNavigationServiceCallback_DidUpdateVehicleParkingInfo;
  v5 = -[MNNavigationServiceCallbackParameters initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_vehicleParkingInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    vehicleParkingInfo = v5->_vehicleParkingInfo;
    v5->_vehicleParkingInfo = (MNVehicleParkingInfo *)v6;

    v8 = v5;
  }

  return v5;
}

- (MNVehicleParkingInfo)vehicleParkingInfo
{
  return self->_vehicleParkingInfo;
}

- (void)setVehicleParkingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleParkingInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleParkingInfo, 0);
}

@end
