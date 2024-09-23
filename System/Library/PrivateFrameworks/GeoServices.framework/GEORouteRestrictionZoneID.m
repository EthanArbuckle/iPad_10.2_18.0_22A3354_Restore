@implementation GEORouteRestrictionZoneID

- (GEORouteRestrictionZoneID)init
{
  GEORouteRestrictionZoneID *result;

  result = (GEORouteRestrictionZoneID *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEORouteRestrictionZoneID)initWithGeoRestrictedZoneId:(id)a3
{
  id v4;
  GEORouteRestrictionZoneID *v5;
  unsigned int v6;
  GEORouteRestrictionZoneID *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEORouteRestrictionZoneID;
  v5 = -[GEORouteRestrictionZoneID init](&v9, sel_init);
  if (v5)
  {
    v5->_identifier = objc_msgSend(v4, "identifier");
    v5->_version = objc_msgSend(v4, "version");
    v6 = objc_msgSend(v4, "type");
    if (v6 <= 2)
      v5->_restrictionType = v6;
    v7 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORouteRestrictionZoneID)initWithCoder:(id)a3
{
  id v4;
  GEORouteRestrictionZoneID *v5;
  GEORouteRestrictionZoneID *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEORouteRestrictionZoneID;
  v5 = -[GEORouteRestrictionZoneID init](&v8, sel_init);
  if (v5)
  {
    v5->_identifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_identifier"));
    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_version"));
    v5->_restrictionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_restrictionType"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", identifier, CFSTR("_identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_version, CFSTR("_version"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_restrictionType, CFSTR("_restrictionType"));

}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (unint64_t)version
{
  return self->_version;
}

- (int64_t)restrictionType
{
  return self->_restrictionType;
}

@end
