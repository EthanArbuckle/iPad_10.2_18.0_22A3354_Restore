@implementation MNArrivalInfo

- (void)setArrivalState:(int64_t)a3
{
  self->_arrivalState = a3;
}

- (void)setLegIndex:(unint64_t)a3
{
  self->_legIndex = a3;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (void)setVehicleParkingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleParkingInfo, a3);
}

- (BOOL)isInArrivalState
{
  return (unint64_t)(self->_arrivalState - 2) < 3;
}

- (BOOL)isInParkingState
{
  return (self->_arrivalState < 7uLL) & (0x62u >> self->_arrivalState);
}

- (id)description
{
  void *v3;
  unint64_t arrivalState;
  const __CFString *v5;
  void *v6;
  void *v7;
  MNVehicleParkingInfo *vehicleParkingInfo;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  arrivalState = self->_arrivalState;
  if (arrivalState > 6)
    v5 = CFSTR("MNArrivalState_Unknown");
  else
    v5 = off_1E61D3DC8[arrivalState];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MNArrivalInfo: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("legIndex: %d"), self->_legIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  vehicleParkingInfo = self->_vehicleParkingInfo;
  if (vehicleParkingInfo)
  {
    -[MNVehicleParkingInfo description](vehicleParkingInfo, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t arrivalState;
  id v5;

  arrivalState = self->_arrivalState;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", arrivalState, CFSTR("_arrivalState"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_legIndex, CFSTR("_legIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destination, CFSTR("_destination"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vehicleParkingInfo, CFSTR("_vehicleParkingInfo"));

}

- (MNArrivalInfo)initWithCoder:(id)a3
{
  id v4;
  MNArrivalInfo *v5;
  uint64_t v6;
  GEOComposedWaypoint *destination;
  uint64_t v8;
  MNVehicleParkingInfo *vehicleParkingInfo;
  MNArrivalInfo *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MNArrivalInfo;
  v5 = -[MNArrivalInfo init](&v12, sel_init);
  if (v5)
  {
    v5->_arrivalState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_arrivalState"));
    v5->_legIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_legIndex"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_destination"));
    v6 = objc_claimAutoreleasedReturnValue();
    destination = v5->_destination;
    v5->_destination = (GEOComposedWaypoint *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_vehicleParkingInfo"));
    v8 = objc_claimAutoreleasedReturnValue();
    vehicleParkingInfo = v5->_vehicleParkingInfo;
    v5->_vehicleParkingInfo = (MNVehicleParkingInfo *)v8;

    v10 = v5;
  }

  return v5;
}

- (int64_t)arrivalState
{
  return self->_arrivalState;
}

- (unint64_t)legIndex
{
  return self->_legIndex;
}

- (GEOComposedWaypoint)destination
{
  return self->_destination;
}

- (MNVehicleParkingInfo)vehicleParkingInfo
{
  return self->_vehicleParkingInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleParkingInfo, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

@end
