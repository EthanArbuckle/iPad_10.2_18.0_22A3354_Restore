@implementation GEOComposedWaypointDisplayInfo

- (GEOComposedWaypointDisplayInfo)initWithGeoWaypointInfo:(id)a3 waypoint:(id)a4
{
  id v6;
  id v7;
  GEOComposedWaypointDisplayInfo *v8;
  GEOComposedWaypointDisplayInfo *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GEOComposedWaypointDisplayInfo;
  v8 = -[GEOComposedWaypointDisplayInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[GEOComposedWaypointDisplayInfo setWaypointInfo:](v8, "setWaypointInfo:", v6);
    -[GEOComposedWaypointDisplayInfo _initPositionWithGeoWaypointInfo:waypoint:](v9, "_initPositionWithGeoWaypointInfo:waypoint:", v6, v7);
  }

  return v9;
}

- (void)_initPositionWithGeoWaypointInfo:(id)a3 waypoint:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  id v21;

  v21 = a3;
  v6 = a4;
  if (objc_msgSend(v21, "hasPosition"))
  {
    objc_msgSend(v21, "position");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lat");
    v9 = v8;
    objc_msgSend(v21, "position");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v14 = v10;
    objc_msgSend(v10, "lng");
    self->_position.latitude = v9;
    self->_position.longitude = v20;
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "hasWaypoint"))
  {
    objc_msgSend(v6, "waypoint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasWaypointPlace");

    if (v12)
    {
      objc_msgSend(v6, "waypoint");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "waypointPlace");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "center");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lat");
      v16 = v15;
      objc_msgSend(v7, "center");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lng");
      self->_position.latitude = v16;
      self->_position.longitude = v18;

LABEL_9:
      goto LABEL_10;
    }
  }
  if (objc_msgSend(v6, "hasLatLng"))
  {
    objc_msgSend(v6, "latLng");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lat");
    v9 = v19;
    objc_msgSend(v6, "latLng");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_10:

}

- (void)setWaypointInfo:(id)a3
{
  GEOWaypointInfo *v4;
  GEOARInfo *v5;
  GEOARInfo *arInfo;
  GEOPBTransitArtwork *v7;
  GEOPBTransitArtwork *artwork;
  GEOStyleAttributes *v9;
  GEOStyleAttributes *styleAttributes;
  NSString *v11;
  NSString *name;
  GEOComposedString *v13;
  void *v14;
  GEOComposedString *v15;
  GEOComposedString *waypointCaption;
  GEOComposedString *v17;
  GEOComposedRouteEVChargingStationInfo *v18;
  void *v19;
  GEOComposedRouteEVChargingStationInfo *v20;
  GEOComposedRouteEVChargingStationInfo *evChargingInfo;
  GEOComposedRouteEVChargingStationInfo *v22;
  GEOWaypointInfo *waypointInfo;

  v4 = (GEOWaypointInfo *)a3;
  -[GEOWaypointInfo arInfo](v4, "arInfo");
  v5 = (GEOARInfo *)objc_claimAutoreleasedReturnValue();
  arInfo = v5;
  if (!v5)
    arInfo = self->_arInfo;
  objc_storeStrong((id *)&self->_arInfo, arInfo);

  -[GEOWaypointInfo artwork](v4, "artwork");
  v7 = (GEOPBTransitArtwork *)objc_claimAutoreleasedReturnValue();
  artwork = v7;
  if (!v7)
    artwork = self->_artwork;
  objc_storeStrong((id *)&self->_artwork, artwork);

  -[GEOWaypointInfo styleAttributes](v4, "styleAttributes");
  v9 = (GEOStyleAttributes *)objc_claimAutoreleasedReturnValue();
  styleAttributes = v9;
  if (!v9)
    styleAttributes = self->_styleAttributes;
  objc_storeStrong((id *)&self->_styleAttributes, styleAttributes);

  -[GEOWaypointInfo name](v4, "name");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = v11;
  if (!v11)
    name = self->_name;
  objc_storeStrong((id *)&self->_name, name);

  if (-[GEOWaypointInfo hasWaypointCaption](v4, "hasWaypointCaption"))
  {
    v13 = [GEOComposedString alloc];
    -[GEOWaypointInfo waypointCaption](v4, "waypointCaption");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[GEOComposedString initWithGeoFormattedString:](v13, "initWithGeoFormattedString:", v14);
    waypointCaption = self->_waypointCaption;
    self->_waypointCaption = v15;

  }
  else
  {
    v17 = self->_waypointCaption;
    v14 = self->_waypointCaption;
    self->_waypointCaption = v17;
  }

  if (-[GEOWaypointInfo hasEvChargingInfo](v4, "hasEvChargingInfo"))
  {
    v18 = [GEOComposedRouteEVChargingStationInfo alloc];
    -[GEOWaypointInfo evChargingInfo](v4, "evChargingInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[GEOComposedRouteEVChargingStationInfo initWithGeoEVChargingInfo:muid:name:](v18, "initWithGeoEVChargingInfo:muid:name:", v19, -[GEOWaypointInfo muid](v4, "muid"), self->_name);
    evChargingInfo = self->_evChargingInfo;
    self->_evChargingInfo = v20;

  }
  else
  {
    v22 = self->_evChargingInfo;
    v19 = self->_evChargingInfo;
    self->_evChargingInfo = v22;
  }

  waypointInfo = self->_waypointInfo;
  self->_waypointInfo = v4;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  GEOARInfo *arInfo;
  id v5;

  arInfo = self->_arInfo;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", arInfo, CFSTR("_arInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artwork, CFSTR("_artwork"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_evChargingInfo, CFSTR("_evChargingInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("_name"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_position, 16, CFSTR("_position"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_styleAttributes, CFSTR("_styleAttributes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_waypointCaption, CFSTR("_waypointCaption"));

}

- (GEOComposedWaypointDisplayInfo)initWithCoder:(id)a3
{
  id v4;
  GEOComposedWaypointDisplayInfo *v5;
  uint64_t v6;
  GEOARInfo *arInfo;
  uint64_t v8;
  GEOPBTransitArtwork *artwork;
  uint64_t v10;
  GEOComposedRouteEVChargingStationInfo *evChargingInfo;
  uint64_t v12;
  NSString *name;
  id v14;
  const void *v15;
  size_t v16;
  uint64_t v17;
  GEOStyleAttributes *styleAttributes;
  uint64_t v19;
  GEOComposedString *waypointCaption;
  unint64_t v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)GEOComposedWaypointDisplayInfo;
  v5 = -[GEOComposedWaypointDisplayInfo init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_arInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    arInfo = v5->_arInfo;
    v5->_arInfo = (GEOARInfo *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_artwork"));
    v8 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (GEOPBTransitArtwork *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_evChargingInfo"));
    v10 = objc_claimAutoreleasedReturnValue();
    evChargingInfo = v5->_evChargingInfo;
    v5->_evChargingInfo = (GEOComposedRouteEVChargingStationInfo *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v12 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v12;

    v22 = 0;
    v14 = objc_retainAutorelease(v4);
    v15 = (const void *)objc_msgSend(v14, "decodeBytesForKey:returnedLength:", CFSTR("_position"), &v22);
    if (v22 && v15)
    {
      if (v22 >= 0x10)
        v16 = 16;
      else
        v16 = v22;
      memcpy(&v5->_position, v15, v16);
    }
    objc_msgSend(v14, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_styleAttributes"));
    v17 = objc_claimAutoreleasedReturnValue();
    styleAttributes = v5->_styleAttributes;
    v5->_styleAttributes = (GEOStyleAttributes *)v17;

    objc_msgSend(v14, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_waypointCaption"));
    v19 = objc_claimAutoreleasedReturnValue();
    waypointCaption = v5->_waypointCaption;
    v5->_waypointCaption = (GEOComposedString *)v19;

  }
  return v5;
}

- (id)description
{
  void *v3;
  GEOComposedRouteEVChargingStationInfo *evChargingInfo;
  NSString *name;
  void *v6;
  void *v7;
  __int128 v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9 = *(_OWORD *)&self->_arInfo;
  evChargingInfo = self->_evChargingInfo;
  name = self->_name;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *(_QWORD *)&self->_position.latitude, *(_QWORD *)&self->_position.longitude);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("arInfo: %@ | artwork: %@ | evChargingInfo: %@ | name: %@ | position: %@ | styleAttributes: %@ | caption: %@"), v9, evChargingInfo, name, v6, self->_styleAttributes, self->_waypointCaption);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (GEOARInfo)arInfo
{
  return self->_arInfo;
}

- (void)setArInfo:(id)a3
{
  objc_storeStrong((id *)&self->_arInfo, a3);
}

- (GEOPBTransitArtwork)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (GEOComposedRouteEVChargingStationInfo)evChargingInfo
{
  return self->_evChargingInfo;
}

- (void)setEvChargingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_evChargingInfo, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)position
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_position.latitude;
  longitude = self->_position.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setPosition:(id)a3
{
  self->_position = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (GEOStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (GEOComposedString)waypointCaption
{
  return self->_waypointCaption;
}

- (void)setWaypointCaption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (GEOWaypointInfo)waypointInfo
{
  return self->_waypointInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointCaption, 0);
  objc_storeStrong((id *)&self->_waypointInfo, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_evChargingInfo, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_arInfo, 0);
}

@end
