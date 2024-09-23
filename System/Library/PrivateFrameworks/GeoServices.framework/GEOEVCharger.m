@implementation GEOEVCharger

- (GEOEVCharger)initWithPlugs:(id)a3 aggregatedAvailabilityInfo:(id)a4
{
  id v7;
  id v8;
  GEOEVCharger *v9;
  id *p_isa;
  GEOEVCharger *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v13.receiver = self;
    v13.super_class = (Class)GEOEVCharger;
    v9 = -[GEOEVCharger init](&v13, sel_init);
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_plugs, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)chargerFromPlaceData:(id)a3
{
  id v3;
  id *v4;
  void *v5;
  void *v6;
  GEOEVChargerAvailability *v7;
  GEOEVCharger *v8;

  v3 = a3;
  +[GEOPDEVCharger evChargerFromPlaceData:](GEOPDEVCharger, "evChargerFromPlaceData:", v3);
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDEVCharger plugs](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOEVChargerPlug plugsFromPDPlugs:](GEOEVChargerPlug, "plugsFromPDPlugs:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[GEOEVChargerAvailability initWithPlaceData:]([GEOEVChargerAvailability alloc], "initWithPlaceData:", v3);
  v8 = -[GEOEVCharger initWithPlugs:aggregatedAvailabilityInfo:]([GEOEVCharger alloc], "initWithPlugs:aggregatedAvailabilityInfo:", v6, v7);

  return v8;
}

- (NSArray)plugs
{
  return self->_plugs;
}

- (GEOEVChargerAvailability)aggregatedAvailabilityInfo
{
  return self->_aggregatedAvailabilityInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregatedAvailabilityInfo, 0);
  objc_storeStrong((id *)&self->_plugs, 0);
}

@end
