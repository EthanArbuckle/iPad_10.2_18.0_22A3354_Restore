@implementation MNTransitAlert

- (MNTransitAlert)initWithTransitBanner:(id)a3 transitStep:(id)a4 activeRoute:(id)a5
{
  id v9;
  id v10;
  id v11;
  MNTransitAlert *v12;
  MNTransitAlert *v13;
  id v14;
  void *v15;
  uint64_t v16;
  GEOComposedString *primaryString;
  id v18;
  void *v19;
  uint64_t v20;
  GEOComposedString *secondaryString;
  void *v22;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MNTransitAlert;
  v12 = -[MNTransitAlert init](&v24, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_banner, a3);
    v14 = objc_alloc(MEMORY[0x1E0D26FD8]);
    objc_msgSend(v9, "primaryText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithGeoFormattedString:", v15);
    primaryString = v13->_primaryString;
    v13->_primaryString = (GEOComposedString *)v16;

    v18 = objc_alloc(MEMORY[0x1E0D26FD8]);
    objc_msgSend(v9, "secondaryText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "initWithGeoFormattedString:", v19);
    secondaryString = v13->_secondaryString;
    v13->_secondaryString = (GEOComposedString *)v20;

    v13->_stepIndex = objc_msgSend(v10, "stepIndex");
    objc_msgSend(v10, "originStop");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_stopIndex = objc_msgSend(v22, "stopIndex");

    v13->_maneuverType = objc_msgSend(v10, "maneuver");
    objc_storeStrong((id *)&v13->_currentRouteInfo, a5);
  }

  return v13;
}

- (GEOServerFormattedString)command
{
  return (GEOServerFormattedString *)-[GEOTransitBanner primaryText](self->_banner, "primaryText");
}

- (GEOServerFormattedString)detail
{
  return (GEOServerFormattedString *)-[GEOTransitBanner secondaryText](self->_banner, "secondaryText");
}

- (GEOPBTransitArtwork)artwork
{
  return (GEOPBTransitArtwork *)-[GEOTransitBanner artwork](self->_banner, "artwork");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNTransitAlert)initWithCoder:(id)a3
{
  id v4;
  MNTransitAlert *v5;
  uint64_t v6;
  GEOTransitBanner *banner;
  uint64_t v8;
  MNActiveRouteInfo *currentRouteInfo;
  uint64_t v10;
  GEOComposedString *primaryString;
  uint64_t v12;
  GEOComposedString *secondaryString;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MNTransitAlert;
  v5 = -[MNTransitAlert init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_banner"));
    v6 = objc_claimAutoreleasedReturnValue();
    banner = v5->_banner;
    v5->_banner = (GEOTransitBanner *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_currentRouteInfo"));
    v8 = objc_claimAutoreleasedReturnValue();
    currentRouteInfo = v5->_currentRouteInfo;
    v5->_currentRouteInfo = (MNActiveRouteInfo *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_primaryString"));
    v10 = objc_claimAutoreleasedReturnValue();
    primaryString = v5->_primaryString;
    v5->_primaryString = (GEOComposedString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_secondaryString"));
    v12 = objc_claimAutoreleasedReturnValue();
    secondaryString = v5->_secondaryString;
    v5->_secondaryString = (GEOComposedString *)v12;

    v5->_stepIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_stepIndex"));
    v5->_stopIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_stopIndex"));
    v5->_maneuverType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_maneuverType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GEOTransitBanner *banner;
  id v5;

  banner = self->_banner;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", banner, CFSTR("_banner"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryString, CFSTR("_primaryString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryString, CFSTR("_secondaryString"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_stopIndex, CFSTR("_stopIndex"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_stepIndex, CFSTR("_stepIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentRouteInfo, CFSTR("_currentRouteInfo"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maneuverType, CFSTR("_maneuverType"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t stepIndex;
  unint64_t stopIndex;
  uint64_t maneuverType;
  __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MNTransitAlert command](self, "command");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formatStrings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  stopIndex = self->_stopIndex;
  stepIndex = self->_stepIndex;
  maneuverType = self->_maneuverType;
  if (maneuverType >= 0xB)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_maneuverType);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E61D6FB8[maneuverType];
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ | stepIndex: %lu | stopIndex: %lu | maneuverType: %@"), v6, stepIndex, stopIndex, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (MNActiveRouteInfo)currentRouteInfo
{
  return self->_currentRouteInfo;
}

- (GEOComposedString)primaryString
{
  return self->_primaryString;
}

- (GEOComposedString)secondaryString
{
  return self->_secondaryString;
}

- (int)maneuverType
{
  return self->_maneuverType;
}

- (unint64_t)stopIndex
{
  return self->_stopIndex;
}

- (unint64_t)stepIndex
{
  return self->_stepIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryString, 0);
  objc_storeStrong((id *)&self->_primaryString, 0);
  objc_storeStrong((id *)&self->_currentRouteInfo, 0);
  objc_storeStrong((id *)&self->_banner, 0);
}

@end
