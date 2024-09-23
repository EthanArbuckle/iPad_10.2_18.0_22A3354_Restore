@implementation ACCNavigationAccessoryComponent

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t identifier;
  NSString *name;
  void *v8;
  int isEnabled;
  unint64_t maxLength_CurrentRoadName;
  unint64_t maxLength_DestinationRoadName;
  unint64_t maxLength_PostManeuverRoadName;
  unint64_t maxLength_ManeuverDescription;
  unint64_t maxCapacity_GuidanceManeuver;
  unint64_t maxLength_LaneGuidanceDescription;
  unint64_t maxCapacity_LaneGuidance;
  int requestSourceName;
  int requestSourceSupportsRouteGuidance;
  int supportsExitInfo;
  BOOL v20;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    identifier = self->_identifier;
    if (identifier == objc_msgSend(v5, "identifier"))
    {
      name = self->_name;
      objc_msgSend(v5, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](name, "isEqualToString:", v8))
        goto LABEL_18;
      isEnabled = self->_isEnabled;
      if (isEnabled != objc_msgSend(v5, "isEnabled"))
        goto LABEL_18;
      maxLength_CurrentRoadName = self->_maxLength_CurrentRoadName;
      if (maxLength_CurrentRoadName != objc_msgSend(v5, "maxLength_CurrentRoadName"))
        goto LABEL_18;
      maxLength_DestinationRoadName = self->_maxLength_DestinationRoadName;
      if (maxLength_DestinationRoadName != objc_msgSend(v5, "maxLength_DestinationRoadName"))
        goto LABEL_18;
      maxLength_PostManeuverRoadName = self->_maxLength_PostManeuverRoadName;
      if (maxLength_PostManeuverRoadName == objc_msgSend(v5, "maxLength_PostManeuverRoadName")
        && (maxLength_ManeuverDescription = self->_maxLength_ManeuverDescription,
            maxLength_ManeuverDescription == objc_msgSend(v5, "maxLength_ManeuverDescription"))
        && (maxCapacity_GuidanceManeuver = self->_maxCapacity_GuidanceManeuver,
            maxCapacity_GuidanceManeuver == objc_msgSend(v5, "maxCapacity_GuidanceManeuver"))
        && (maxLength_LaneGuidanceDescription = self->_maxLength_LaneGuidanceDescription,
            maxLength_LaneGuidanceDescription == objc_msgSend(v5, "maxLength_LaneGuidanceDescription"))
        && (maxCapacity_LaneGuidance = self->_maxCapacity_LaneGuidance,
            maxCapacity_LaneGuidance == objc_msgSend(v5, "maxCapacity_LaneGuidance"))
        && (requestSourceName = self->_requestSourceName,
            requestSourceName == objc_msgSend(v5, "requestSourceName"))
        && (requestSourceSupportsRouteGuidance = self->_requestSourceSupportsRouteGuidance,
            requestSourceSupportsRouteGuidance == objc_msgSend(v5, "requestSourceSupportsRouteGuidance")))
      {
        supportsExitInfo = self->_supportsExitInfo;
        v20 = supportsExitInfo == objc_msgSend(v5, "supportsExitInfo");
      }
      else
      {
LABEL_18:
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  return self->_identifier;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<ACCNavigationAccessoryComponent - name: %@, identifier: %d, isEnabled: %d>, max_CRN: %d, max_DRN: %d, max_PMRN: %d, max_GM: %d, max_MD: %d, max_LD: %d, max_LG: %d, reqSrcName: %d reqSrcSupportRG: %d, exitInfo: %d, laneGuidance: %d, timeZoneOffset: %d>"), self->_name, self->_identifier, self->_isEnabled, self->_maxLength_CurrentRoadName, self->_maxLength_DestinationRoadName, self->_maxLength_PostManeuverRoadName, self->_maxLength_ManeuverDescription, self->_maxCapacity_GuidanceManeuver, self->_maxLength_LaneGuidanceDescription, self->_maxCapacity_LaneGuidance, self->_requestSourceName, self->_requestSourceSupportsRouteGuidance, self->_supportsExitInfo, self->_supportsLaneGuidance, self->_supportsTimeZoneOffset);
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _BOOL8 v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  id v26;

  v26 = a3;
  v4 = -[ACCNavigationAccessoryComponent identifier](self, "identifier");
  NSStringFromSelector(sel_identifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeInteger:forKey:", v4, v5);

  -[ACCNavigationAccessoryComponent name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v6, ACCNav_DispComp_Name);

  v7 = -[ACCNavigationAccessoryComponent isEnabled](self, "isEnabled");
  NSStringFromSelector(sel_isEnabled);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeBool:forKey:", v7, v8);

  v9 = -[ACCNavigationAccessoryComponent maxLength_CurrentRoadName](self, "maxLength_CurrentRoadName");
  objc_msgSend(v26, "encodeInteger:forKey:", v9, ACCNav_DispComp_MaxCurRoadNameLength);
  v10 = -[ACCNavigationAccessoryComponent maxLength_DestinationRoadName](self, "maxLength_DestinationRoadName");
  objc_msgSend(v26, "encodeInteger:forKey:", v10, ACCNav_DispComp_MaxDestinationNameLength);
  v11 = -[ACCNavigationAccessoryComponent maxLength_PostManeuverRoadName](self, "maxLength_PostManeuverRoadName");
  objc_msgSend(v26, "encodeInteger:forKey:", v11, ACCNav_DispComp_MaxAfterManeuverRoadNameLength);
  v12 = -[ACCNavigationAccessoryComponent maxLength_ManeuverDescription](self, "maxLength_ManeuverDescription");
  objc_msgSend(v26, "encodeInteger:forKey:", v12, ACCNav_DispComp_MaxManeuverDescriptionLength);
  v13 = -[ACCNavigationAccessoryComponent maxLength_LaneGuidanceDescription](self, "maxLength_LaneGuidanceDescription");
  objc_msgSend(v26, "encodeInteger:forKey:", v13, ACCNav_DispComp_MaxLaneGuidanceDescriptionLength);
  v14 = -[ACCNavigationAccessoryComponent requestSourceName](self, "requestSourceName");
  NSStringFromSelector(sel_requestSourceName);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeBool:forKey:", v14, v15);

  v16 = -[ACCNavigationAccessoryComponent requestSourceSupportsRouteGuidance](self, "requestSourceSupportsRouteGuidance");
  NSStringFromSelector(sel_requestSourceSupportsRouteGuidance);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeBool:forKey:", v16, v17);

  v18 = -[ACCNavigationAccessoryComponent supportsExitInfo](self, "supportsExitInfo");
  NSStringFromSelector(sel_supportsExitInfo);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeBool:forKey:", v18, v19);

  v20 = -[ACCNavigationAccessoryComponent supportsLaneGuidance](self, "supportsLaneGuidance");
  NSStringFromSelector(sel_supportsLaneGuidance);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeBool:forKey:", v20, v21);

  v22 = -[ACCNavigationAccessoryComponent supportsTimeZoneOffset](self, "supportsTimeZoneOffset");
  NSStringFromSelector(sel_supportsTimeZoneOffset);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeBool:forKey:", v22, v23);

  v24 = -[ACCNavigationAccessoryComponent maxCapacity_GuidanceManeuver](self, "maxCapacity_GuidanceManeuver");
  objc_msgSend(v26, "encodeInteger:forKey:", v24, ACCNav_DispComp_MaxMGuidanceManeuverCapacity);
  v25 = -[ACCNavigationAccessoryComponent maxCapacity_LaneGuidance](self, "maxCapacity_LaneGuidance");
  objc_msgSend(v26, "encodeInteger:forKey:", v25, ACCNav_DispComp_MaxLaneGuidanceStorageCapacity);

}

- (ACCNavigationAccessoryComponent)initWithCoder:(id)a3
{
  id v4;
  ACCNavigationAccessoryComponent *v5;
  void *v6;
  uint64_t v7;
  NSString *name;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ACCNavigationAccessoryComponent;
  v5 = -[ACCNavigationAccessoryComponent init](&v16, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_identifier);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_identifier = objc_msgSend(v4, "decodeIntegerForKey:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), ACCNav_DispComp_Name);
    v7 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v7;

    NSStringFromSelector(sel_isEnabled);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isEnabled = objc_msgSend(v4, "decodeBoolForKey:", v9);

    v5->_maxLength_CurrentRoadName = objc_msgSend(v4, "decodeIntegerForKey:", ACCNav_DispComp_MaxCurRoadNameLength);
    v5->_maxLength_DestinationRoadName = objc_msgSend(v4, "decodeIntegerForKey:", ACCNav_DispComp_MaxDestinationNameLength);
    v5->_maxLength_PostManeuverRoadName = objc_msgSend(v4, "decodeIntegerForKey:", ACCNav_DispComp_MaxAfterManeuverRoadNameLength);
    v5->_maxLength_ManeuverDescription = objc_msgSend(v4, "decodeIntegerForKey:", ACCNav_DispComp_MaxManeuverDescriptionLength);
    v5->_maxLength_LaneGuidanceDescription = objc_msgSend(v4, "decodeIntegerForKey:", ACCNav_DispComp_MaxLaneGuidanceDescriptionLength);
    NSStringFromSelector(sel_requestSourceName);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_requestSourceName = objc_msgSend(v4, "decodeBoolForKey:", v10);

    NSStringFromSelector(sel_requestSourceSupportsRouteGuidance);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_requestSourceSupportsRouteGuidance = objc_msgSend(v4, "decodeBoolForKey:", v11);

    NSStringFromSelector(sel_supportsExitInfo);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsExitInfo = objc_msgSend(v4, "decodeBoolForKey:", v12);

    NSStringFromSelector(sel_supportsLaneGuidance);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsLaneGuidance = objc_msgSend(v4, "decodeBoolForKey:", v13);

    NSStringFromSelector(sel_supportsTimeZoneOffset);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsTimeZoneOffset = objc_msgSend(v4, "decodeBoolForKey:", v14);

    v5->_maxCapacity_GuidanceManeuver = objc_msgSend(v4, "decodeIntegerForKey:", ACCNav_DispComp_MaxMGuidanceManeuverCapacity);
    v5->_maxCapacity_LaneGuidance = objc_msgSend(v4, "decodeIntegerForKey:", ACCNav_DispComp_MaxLaneGuidanceStorageCapacity);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (unint64_t)maxLength_CurrentRoadName
{
  return self->_maxLength_CurrentRoadName;
}

- (void)setMaxLength_CurrentRoadName:(unint64_t)a3
{
  self->_maxLength_CurrentRoadName = a3;
}

- (unint64_t)maxLength_DestinationRoadName
{
  return self->_maxLength_DestinationRoadName;
}

- (void)setMaxLength_DestinationRoadName:(unint64_t)a3
{
  self->_maxLength_DestinationRoadName = a3;
}

- (unint64_t)maxLength_PostManeuverRoadName
{
  return self->_maxLength_PostManeuverRoadName;
}

- (void)setMaxLength_PostManeuverRoadName:(unint64_t)a3
{
  self->_maxLength_PostManeuverRoadName = a3;
}

- (unint64_t)maxLength_ManeuverDescription
{
  return self->_maxLength_ManeuverDescription;
}

- (void)setMaxLength_ManeuverDescription:(unint64_t)a3
{
  self->_maxLength_ManeuverDescription = a3;
}

- (unint64_t)maxLength_LaneGuidanceDescription
{
  return self->_maxLength_LaneGuidanceDescription;
}

- (void)setMaxLength_LaneGuidanceDescription:(unint64_t)a3
{
  self->_maxLength_LaneGuidanceDescription = a3;
}

- (BOOL)requestSourceName
{
  return self->_requestSourceName;
}

- (void)setRequestSourceName:(BOOL)a3
{
  self->_requestSourceName = a3;
}

- (BOOL)requestSourceSupportsRouteGuidance
{
  return self->_requestSourceSupportsRouteGuidance;
}

- (void)setRequestSourceSupportsRouteGuidance:(BOOL)a3
{
  self->_requestSourceSupportsRouteGuidance = a3;
}

- (BOOL)supportsExitInfo
{
  return self->_supportsExitInfo;
}

- (void)setSupportsExitInfo:(BOOL)a3
{
  self->_supportsExitInfo = a3;
}

- (BOOL)supportsLaneGuidance
{
  return self->_supportsLaneGuidance;
}

- (void)setSupportsLaneGuidance:(BOOL)a3
{
  self->_supportsLaneGuidance = a3;
}

- (BOOL)supportsTimeZoneOffset
{
  return self->_supportsTimeZoneOffset;
}

- (void)setSupportsTimeZoneOffset:(BOOL)a3
{
  self->_supportsTimeZoneOffset = a3;
}

- (unint64_t)maxCapacity_GuidanceManeuver
{
  return self->_maxCapacity_GuidanceManeuver;
}

- (void)setMaxCapacity_GuidanceManeuver:(unint64_t)a3
{
  self->_maxCapacity_GuidanceManeuver = a3;
}

- (unint64_t)maxCapacity_LaneGuidance
{
  return self->_maxCapacity_LaneGuidance;
}

- (void)setMaxCapacity_LaneGuidance:(unint64_t)a3
{
  self->_maxCapacity_LaneGuidance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
