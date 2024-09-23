@implementation MNGuidanceSignDescription

- (MNGuidanceSignDescription)initWithID:(id)a3 titles:(id)a4 details:(id)a5 variableOverrides:(id)a6 distanceDetailLevel:(int)a7 junction:(id)a8 artworkOverride:(id)a9 shieldText:(id)a10 shieldID:(int)a11 shieldStringID:(id)a12 composedGuidanceEventIndex:(int)a13
{
  id v19;
  MNGuidanceSignDescription *v20;
  MNGuidanceSignDescription *v21;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v30 = a3;
  v29 = a4;
  v28 = a5;
  v27 = a6;
  v26 = a8;
  v25 = a9;
  v24 = a10;
  v19 = a12;
  v31.receiver = self;
  v31.super_class = (Class)MNGuidanceSignDescription;
  v20 = -[MNGuidanceSignDescription init](&v31, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_uniqueID, a3);
    objc_storeStrong((id *)&v21->_titles, a4);
    objc_storeStrong((id *)&v21->_details, a5);
    objc_storeStrong((id *)&v21->_variableOverrides, a6);
    v21->_distanceDetailLevel = a7;
    objc_storeStrong((id *)&v21->_junction, a8);
    objc_storeStrong((id *)&v21->_artworkOverride, a9);
    objc_storeStrong((id *)&v21->_shieldText, a10);
    v21->_shieldID = a11;
    objc_storeStrong((id *)&v21->_shieldStringID, a12);
    v21->_composedGuidanceEventIndex = a13;
  }

  return v21;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MNGuidanceSignDescription uniqueID](self, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ | static: %d"), v4, self->_isStaticText);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MNGuidanceSignDescription titles](self, "titles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[MNGuidanceSignDescription titles](self, "titles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("\n  title:     %@"), v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }
  -[MNGuidanceSignDescription details](self, "details");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    -[MNGuidanceSignDescription details](self, "details");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("\n  detail:    %@"), v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v15;
  }
  return v5;
}

- (id)description
{
  void *v3;
  GEOJunction *junction;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSUUID *uniqueID;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  junction = self->_junction;
  if (junction)
  {
    v5 = -[GEOJunction maneuverType](junction, "maneuverType");
    v6 = CFSTR("NO_TURN");
    switch((int)v5)
    {
      case 0:
        break;
      case 1:
        v6 = CFSTR("LEFT_TURN");
        break;
      case 2:
        v6 = CFSTR("RIGHT_TURN");
        break;
      case 3:
        v6 = CFSTR("STRAIGHT_AHEAD");
        break;
      case 4:
        v6 = CFSTR("U_TURN");
        break;
      case 5:
        v6 = CFSTR("FOLLOW_ROAD");
        break;
      case 6:
        v6 = CFSTR("ENTER_ROUNDABOUT");
        break;
      case 7:
        v6 = CFSTR("EXIT_ROUNDABOUT");
        break;
      case 11:
        v6 = CFSTR("OFF_RAMP");
        break;
      case 12:
        v6 = CFSTR("ON_RAMP");
        break;
      case 16:
        v6 = CFSTR("ARRIVE_END_OF_NAVIGATION");
        break;
      case 17:
        v6 = CFSTR("START_ROUTE");
        break;
      case 18:
        v6 = CFSTR("ARRIVE_AT_DESTINATION");
        break;
      case 20:
        v6 = CFSTR("KEEP_LEFT");
        break;
      case 21:
        v6 = CFSTR("KEEP_RIGHT");
        break;
      case 22:
        v6 = CFSTR("ENTER_FERRY");
        break;
      case 23:
        v6 = CFSTR("EXIT_FERRY");
        break;
      case 24:
        v6 = CFSTR("CHANGE_FERRY");
        break;
      case 25:
        v6 = CFSTR("START_ROUTE_WITH_U_TURN");
        break;
      case 26:
        v6 = CFSTR("U_TURN_AT_ROUNDABOUT");
        break;
      case 27:
        v6 = CFSTR("LEFT_TURN_AT_END");
        break;
      case 28:
        v6 = CFSTR("RIGHT_TURN_AT_END");
        break;
      case 29:
        v6 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
        break;
      case 30:
        v6 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
        break;
      case 33:
        v6 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
        break;
      case 34:
        v6 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
        break;
      case 35:
        v6 = CFSTR("U_TURN_WHEN_POSSIBLE");
        break;
      case 39:
        v6 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
        break;
      case 41:
        v6 = CFSTR("ROUNDABOUT_EXIT_1");
        break;
      case 42:
        v6 = CFSTR("ROUNDABOUT_EXIT_2");
        break;
      case 43:
        v6 = CFSTR("ROUNDABOUT_EXIT_3");
        break;
      case 44:
        v6 = CFSTR("ROUNDABOUT_EXIT_4");
        break;
      case 45:
        v6 = CFSTR("ROUNDABOUT_EXIT_5");
        break;
      case 46:
        v6 = CFSTR("ROUNDABOUT_EXIT_6");
        break;
      case 47:
        v6 = CFSTR("ROUNDABOUT_EXIT_7");
        break;
      case 48:
        v6 = CFSTR("ROUNDABOUT_EXIT_8");
        break;
      case 49:
        v6 = CFSTR("ROUNDABOUT_EXIT_9");
        break;
      case 50:
        v6 = CFSTR("ROUNDABOUT_EXIT_10");
        break;
      case 51:
        v6 = CFSTR("ROUNDABOUT_EXIT_11");
        break;
      case 52:
        v6 = CFSTR("ROUNDABOUT_EXIT_12");
        break;
      case 53:
        v6 = CFSTR("ROUNDABOUT_EXIT_13");
        break;
      case 54:
        v6 = CFSTR("ROUNDABOUT_EXIT_14");
        break;
      case 55:
        v6 = CFSTR("ROUNDABOUT_EXIT_15");
        break;
      case 56:
        v6 = CFSTR("ROUNDABOUT_EXIT_16");
        break;
      case 57:
        v6 = CFSTR("ROUNDABOUT_EXIT_17");
        break;
      case 58:
        v6 = CFSTR("ROUNDABOUT_EXIT_18");
        break;
      case 59:
        v6 = CFSTR("ROUNDABOUT_EXIT_19");
        break;
      case 60:
        v6 = CFSTR("SHARP_LEFT_TURN");
        break;
      case 61:
        v6 = CFSTR("SHARP_RIGHT_TURN");
        break;
      case 62:
        v6 = CFSTR("SLIGHT_LEFT_TURN");
        break;
      case 63:
        v6 = CFSTR("SLIGHT_RIGHT_TURN");
        break;
      case 64:
        v6 = CFSTR("CHANGE_HIGHWAY");
        break;
      case 65:
        v6 = CFSTR("CHANGE_HIGHWAY_LEFT");
        break;
      case 66:
        v6 = CFSTR("CHANGE_HIGHWAY_RIGHT");
        break;
      case 80:
        v6 = CFSTR("TOLL_STATION");
        break;
      case 81:
        v6 = CFSTR("ENTER_TUNNEL");
        break;
      case 82:
        v6 = CFSTR("WAYPOINT_STOP");
        break;
      case 83:
        v6 = CFSTR("WAYPOINT_STOP_LEFT");
        break;
      case 84:
        v6 = CFSTR("WAYPOINT_STOP_RIGHT");
        break;
      case 85:
        v6 = CFSTR("RESUME_ROUTE");
        break;
      case 86:
        v6 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
        break;
      case 87:
        v6 = CFSTR("CUSTOM");
        break;
      case 88:
        v6 = CFSTR("TURN_AROUND");
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    objc_msgSend(v3, "addObject:", v6);

  }
  -[NSArray firstObject](self->_primaryStrings, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "stringWithOptions:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v3, "addObject:", v9);

  }
  -[NSArray firstObject](self->_secondaryStrings, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "stringWithOptions:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v3, "addObject:", v12);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("static: %d"), self->_isStaticText);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  uniqueID = self->_uniqueID;
  if (uniqueID)
  {
    -[NSUUID UUIDString](uniqueID, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" | "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNGuidanceSignDescription)initWithCoder:(id)a3
{
  id v4;
  MNGuidanceSignDescription *v5;
  uint64_t v6;
  NSUUID *uniqueID;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *titles;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *details;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *primaryStrings;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSArray *secondaryStrings;
  double v28;
  uint64_t v29;
  NSMeasurement *displayRemainingDistance;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSDictionary *variableOverrides;
  uint64_t v37;
  GEOJunction *junction;
  uint64_t v39;
  GEOTransitArtworkDataSource *artworkOverride;
  void *v41;
  uint64_t v42;
  NSString *shieldText;
  void *v44;
  uint64_t v45;
  NSString *shieldStringID;
  objc_super v48;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)MNGuidanceSignDescription;
  v5 = -[MNGuidanceSignDescription init](&v48, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UniqueID"));
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSUUID *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("Titles"));
    v11 = objc_claimAutoreleasedReturnValue();
    titles = v5->_titles;
    v5->_titles = (NSArray *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("Details"));
    v16 = objc_claimAutoreleasedReturnValue();
    details = v5->_details;
    v5->_details = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("_primaryStrings"));
    v21 = objc_claimAutoreleasedReturnValue();
    primaryStrings = v5->_primaryStrings;
    v5->_primaryStrings = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("_secondaryStrings"));
    v26 = objc_claimAutoreleasedReturnValue();
    secondaryStrings = v5->_secondaryStrings;
    v5->_secondaryStrings = (NSArray *)v26;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_remainingDistance"));
    v5->_remainingDistance = v28;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_displayRemainingDistance"));
    v29 = objc_claimAutoreleasedReturnValue();
    displayRemainingDistance = v5->_displayRemainingDistance;
    v5->_displayRemainingDistance = (NSMeasurement *)v29;

    v31 = (void *)MEMORY[0x1E0C99E60];
    v32 = objc_opt_class();
    v33 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("VariableOverrides"));
    v35 = objc_claimAutoreleasedReturnValue();
    variableOverrides = v5->_variableOverrides;
    v5->_variableOverrides = (NSDictionary *)v35;

    v5->_distanceDetailLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DistanceDetailLevel"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Junction"));
    v37 = objc_claimAutoreleasedReturnValue();
    junction = v5->_junction;
    v5->_junction = (GEOJunction *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ArtworkOverride"));
    v39 = objc_claimAutoreleasedReturnValue();
    artworkOverride = v5->_artworkOverride;
    v5->_artworkOverride = (GEOTransitArtworkDataSource *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ShieldText"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "copy");
    shieldText = v5->_shieldText;
    v5->_shieldText = (NSString *)v42;

    v5->_shieldID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ShieldID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ShieldStringID"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "copy");
    shieldStringID = v5->_shieldStringID;
    v5->_shieldStringID = (NSString *)v45;

    v5->_composedGuidanceEventIndex = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ComposedGuidanceEventIndex"));
    v5->_isStaticText = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isStaticText"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  -[MNGuidanceSignDescription uniqueID](self, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MNGuidanceSignDescription uniqueID](self, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v5, CFSTR("UniqueID"));

  }
  -[MNGuidanceSignDescription titles](self, "titles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MNGuidanceSignDescription titles](self, "titles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v7, CFSTR("Titles"));

  }
  -[MNGuidanceSignDescription details](self, "details");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MNGuidanceSignDescription details](self, "details");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v9, CFSTR("Details"));

  }
  objc_msgSend(v20, "encodeObject:forKey:", self->_primaryStrings, CFSTR("_primaryStrings"));
  objc_msgSend(v20, "encodeObject:forKey:", self->_secondaryStrings, CFSTR("_secondaryStrings"));
  objc_msgSend(v20, "encodeDouble:forKey:", CFSTR("_remainingDistance"), self->_remainingDistance);
  objc_msgSend(v20, "encodeObject:forKey:", self->_displayRemainingDistance, CFSTR("_displayRemainingDistance"));
  -[MNGuidanceSignDescription shieldText](self, "shieldText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MNGuidanceSignDescription shieldText](self, "shieldText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v11, CFSTR("ShieldText"));

  }
  objc_msgSend(v20, "encodeInt32:forKey:", -[MNGuidanceSignDescription shieldID](self, "shieldID"), CFSTR("ShieldID"));
  -[MNGuidanceSignDescription shieldStringID](self, "shieldStringID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MNGuidanceSignDescription shieldStringID](self, "shieldStringID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v13, CFSTR("ShieldStringID"));

  }
  -[MNGuidanceSignDescription junction](self, "junction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[MNGuidanceSignDescription junction](self, "junction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v15, CFSTR("Junction"));

  }
  -[MNGuidanceSignDescription artworkOverride](self, "artworkOverride");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[MNGuidanceSignDescription artworkOverride](self, "artworkOverride");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v17, CFSTR("ArtworkOverride"));

  }
  objc_msgSend(v20, "encodeInteger:forKey:", -[MNGuidanceSignDescription distanceDetailLevel](self, "distanceDetailLevel"), CFSTR("DistanceDetailLevel"));
  -[MNGuidanceSignDescription variableOverrides](self, "variableOverrides");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[MNGuidanceSignDescription variableOverrides](self, "variableOverrides");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v19, CFSTR("VariableOverrides"));

  }
  objc_msgSend(v20, "encodeInt32:forKey:", -[MNGuidanceSignDescription composedGuidanceEventIndex](self, "composedGuidanceEventIndex"), CFSTR("ComposedGuidanceEventIndex"));
  objc_msgSend(v20, "encodeBool:forKey:", self->_isStaticText, CFSTR("_isStaticText"));

}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (NSArray)titles
{
  return self->_titles;
}

- (NSArray)details
{
  return self->_details;
}

- (GEOJunction)junction
{
  return self->_junction;
}

- (GEOTransitArtworkDataSource)artworkOverride
{
  return self->_artworkOverride;
}

- (NSString)shieldText
{
  return self->_shieldText;
}

- (int)shieldID
{
  return self->_shieldID;
}

- (NSString)shieldStringID
{
  return self->_shieldStringID;
}

- (NSDictionary)variableOverrides
{
  return self->_variableOverrides;
}

- (int64_t)distanceDetailLevel
{
  return self->_distanceDetailLevel;
}

- (int)composedGuidanceEventIndex
{
  return self->_composedGuidanceEventIndex;
}

- (NSArray)primaryStrings
{
  return self->_primaryStrings;
}

- (void)setPrimaryStrings:(id)a3
{
  objc_storeStrong((id *)&self->_primaryStrings, a3);
}

- (NSArray)secondaryStrings
{
  return self->_secondaryStrings;
}

- (void)setSecondaryStrings:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryStrings, a3);
}

- (double)remainingDistance
{
  return self->_remainingDistance;
}

- (void)setRemainingDistance:(double)a3
{
  self->_remainingDistance = a3;
}

- (NSMeasurement)displayRemainingDistance
{
  return self->_displayRemainingDistance;
}

- (void)setDisplayRemainingDistance:(id)a3
{
  objc_storeStrong((id *)&self->_displayRemainingDistance, a3);
}

- (BOOL)isStaticText
{
  return self->_isStaticText;
}

- (void)setIsStaticText:(BOOL)a3
{
  self->_isStaticText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayRemainingDistance, 0);
  objc_storeStrong((id *)&self->_secondaryStrings, 0);
  objc_storeStrong((id *)&self->_primaryStrings, 0);
  objc_storeStrong((id *)&self->_variableOverrides, 0);
  objc_storeStrong((id *)&self->_shieldStringID, 0);
  objc_storeStrong((id *)&self->_shieldText, 0);
  objc_storeStrong((id *)&self->_artworkOverride, 0);
  objc_storeStrong((id *)&self->_junction, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end
