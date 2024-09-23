@implementation GEOComposedRouteTrafficIncidentInfo

- (GEOComposedRouteTrafficIncidentInfo)init
{
  GEOComposedRouteTrafficIncidentInfo *v2;
  GEOComposedRouteTrafficIncidentInfo *v3;
  GEOComposedRouteTrafficIncidentInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOComposedRouteTrafficIncidentInfo;
  v2 = -[GEOComposedRouteTrafficIncidentInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_offsetMeters = -1.0;
    v2->_routeCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)0xBF80000000000000;
    v4 = v2;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteTrafficIncidentInfo)initWithCoder:(id)a3
{
  id v4;
  GEOComposedRouteTrafficIncidentInfo *v5;
  uint64_t v6;
  GEORouteIncident *incident;
  id v8;
  const void *v9;
  size_t v10;
  double v11;
  const void *v12;
  size_t v13;
  unint64_t v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOComposedRouteTrafficIncidentInfo;
  v5 = -[GEOComposedRouteTrafficIncidentInfo init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_incident"));
    v6 = objc_claimAutoreleasedReturnValue();
    incident = v5->_incident;
    v5->_incident = (GEORouteIncident *)v6;

    v15 = 0;
    v8 = objc_retainAutorelease(v4);
    v9 = (const void *)objc_msgSend(v8, "decodeBytesForKey:returnedLength:", CFSTR("_coordinate"), &v15);
    if (v15 && v9)
    {
      if (v15 >= 0x10)
        v10 = 16;
      else
        v10 = v15;
      memcpy(&v5->_coordinate, v9, v10);
    }
    objc_msgSend(v8, "decodeDoubleForKey:", CFSTR("_offsetMeters"));
    v5->_offsetMeters = v11;
    v15 = 0;
    v12 = (const void *)objc_msgSend(objc_retainAutorelease(v8), "decodeBytesForKey:returnedLength:", CFSTR("_routeCoordinate"), &v15);
    if (v15 && v12)
    {
      if (v15 >= 8)
        v13 = 8;
      else
        v13 = v15;
      memcpy(&v5->_routeCoordinate, v12, v13);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GEORouteIncident *incident;
  id v5;

  incident = self->_incident;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", incident, CFSTR("_incident"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_coordinate, 16, CFSTR("_coordinate"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_offsetMeters"), self->_offsetMeters);
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_routeCoordinate, 8, CFSTR("_routeCoordinate"));

}

- (id)description
{
  double v2;
  uint64_t routeCoordinate;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  double latitude;
  double longitude;
  void *v13;
  void *v14;

  routeCoordinate = (uint64_t)self->_routeCoordinate;
  LODWORD(v2) = HIDWORD(routeCoordinate);
  if (*((float *)&routeCoordinate + 1) >= 0.0)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    GEOPolylineCoordinateAsString(routeCoordinate, 1, 0, v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@ | %gm] "), v7, *(_QWORD *)&self->_offsetMeters);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &stru_1E1C241D0;
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = -[GEORouteIncident type](self->_incident, "type", v2);
  v10 = CFSTR("ACCIDENT");
  switch((int)v9)
  {
    case 0:
      break;
    case 1:
      v10 = CFSTR("CONSTRUCTION");
      break;
    case 2:
      v10 = CFSTR("ROAD_CLOSURE");
      break;
    case 3:
      v10 = CFSTR("EVENT");
      break;
    case 4:
      v10 = CFSTR("HAZARD");
      break;
    case 5:
      v10 = CFSTR("LANE_CLOSURE");
      break;
    case 6:
      v10 = CFSTR("RAMP_CLOSURE");
      break;
    case 7:
      v10 = CFSTR("TRAFFIC");
      break;
    case 8:
      v10 = CFSTR("WALKING_CLOSURE");
      break;
    case 9:
      v10 = CFSTR("CONGESTION_ZONE_RESTRICTION");
      break;
    case 10:
      v10 = CFSTR("LICENSE_PLATE_RESTRICTION");
      break;
    case 11:
    case 12:
      goto LABEL_8;
    case 13:
      v10 = CFSTR("SPEED_TRAP");
      break;
    case 14:
      v10 = CFSTR("AREA_INCIDENT");
      break;
    default:
      if ((_DWORD)v9 == 100)
      {
        v10 = CFSTR("TIME_BASED_RESTRICTION");
      }
      else
      {
LABEL_8:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v9);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  -[GEORouteIncident street](self->_incident, "street");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@%@ (%f, %f) %@"), v5, v10, *(_QWORD *)&latitude, *(_QWORD *)&longitude, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (GEORouteIncident)incident
{
  return self->_incident;
}

- (void)setIncident:(id)a3
{
  objc_storeStrong((id *)&self->_incident, a3);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setCoordinate:(id)a3
{
  self->_coordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (double)offsetMeters
{
  return self->_offsetMeters;
}

- (void)setOffsetMeters:(double)a3
{
  self->_offsetMeters = a3;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_routeCoordinate;
}

- (void)setRouteCoordinate:(id)a3
{
  self->_routeCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incident, 0);
}

@end
