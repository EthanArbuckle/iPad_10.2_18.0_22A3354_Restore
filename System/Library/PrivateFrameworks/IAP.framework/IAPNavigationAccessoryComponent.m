@implementation IAPNavigationAccessoryComponent

- (IAPNavigationAccessoryComponent)initWithDict:(id)a3
{
  id v4;
  IAPNavigationAccessoryComponent *v5;
  IAPNavigationAccessoryComponent *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)IAPNavigationAccessoryComponent;
  v5 = -[IAPNavigationAccessoryComponent init](&v24, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->__enabledModified = 0;
    objc_msgSend(v4, "objectForKey:", CFSTR("isEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_isEnabled = objc_msgSend(v7, "isEqualToString:", CFSTR("YES"));
    objc_msgSend(v4, "objectForKey:", CFSTR("identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    if (v9)
      v6->_identifier = v9;
    objc_msgSend(v4, "objectForKey:", CFSTR("name"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_storeStrong((id *)&v6->_name, v10);
    objc_msgSend(v4, "objectForKey:", CFSTR("maxLength_CurrentRoadName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

    if (v12)
      v6->_maxLength_CurrentRoadName = v12;
    objc_msgSend(v4, "objectForKey:", CFSTR("maxLength_DestinationRoadName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

    if (v14)
      v6->_maxLength_DestinationRoadName = v14;
    objc_msgSend(v4, "objectForKey:", CFSTR("maxLength_PostManeuverRoadName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedIntegerValue");

    if (v16)
      v6->_maxLength_PostManeuverRoadName = v16;
    objc_msgSend(v4, "objectForKey:", CFSTR("maxLength_ManeuverDescription"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");

    if (v18)
      v6->_maxLength_ManeuverDescription = v18;
    objc_msgSend(v4, "objectForKey:", CFSTR("maxCapacity_GuidanceManeuver"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedIntegerValue");

    if (v20)
      v6->_maxCapacity_GuidanceManeuver = v20;
    objc_msgSend(v4, "objectForKey:", CFSTR("requestSourceName"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_requestSourceName = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("requestSourceSupportsRouteGuidance"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_requestSourceSupportsRouteGuidance = objc_msgSend(v22, "BOOLValue");

  }
  return v6;
}

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
  int requestSourceName;
  int requestSourceSupportsRouteGuidance;
  BOOL v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    identifier = self->_identifier;
    if (identifier == objc_msgSend(v5, "identifier"))
    {
      name = self->_name;
      objc_msgSend(v5, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](name, "isEqualToString:", v8)
        && (isEnabled = self->_isEnabled, isEnabled == objc_msgSend(v5, "isEnabled"))
        && (maxLength_CurrentRoadName = self->_maxLength_CurrentRoadName,
            maxLength_CurrentRoadName == objc_msgSend(v5, "maxLength_CurrentRoadName"))
        && (maxLength_DestinationRoadName = self->_maxLength_DestinationRoadName,
            maxLength_DestinationRoadName == objc_msgSend(v5, "maxLength_DestinationRoadName"))
        && (maxLength_PostManeuverRoadName = self->_maxLength_PostManeuverRoadName,
            maxLength_PostManeuverRoadName == objc_msgSend(v5, "maxLength_PostManeuverRoadName"))
        && (maxLength_ManeuverDescription = self->_maxLength_ManeuverDescription,
            maxLength_ManeuverDescription == objc_msgSend(v5, "maxLength_ManeuverDescription"))
        && (maxCapacity_GuidanceManeuver = self->_maxCapacity_GuidanceManeuver,
            maxCapacity_GuidanceManeuver == objc_msgSend(v5, "maxCapacity_GuidanceManeuver"))
        && (requestSourceName = self->_requestSourceName,
            requestSourceName == objc_msgSend(v5, "requestSourceName")))
      {
        requestSourceSupportsRouteGuidance = self->_requestSourceSupportsRouteGuidance;
        v17 = requestSourceSupportsRouteGuidance == objc_msgSend(v5, "requestSourceSupportsRouteGuidance");
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<IAPNavigationAccessoryComponent - name: %@, identifier: %d, isEnabled: %d>, max_CRN: %d, max_DRN: %d, max_PMRN: %d, max_MD: %d, max_GM: %d, reqSrcName: %d reqSrcSupportRG: %d>"), self->_name, self->_identifier, self->_isEnabled, self->_maxLength_CurrentRoadName, self->_maxLength_DestinationRoadName, self->_maxLength_PostManeuverRoadName, self->_maxLength_ManeuverDescription, self->_maxCapacity_GuidanceManeuver, self->_requestSourceName, self->_requestSourceSupportsRouteGuidance);
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

- (unint64_t)maxCapacity_GuidanceManeuver
{
  return self->_maxCapacity_GuidanceManeuver;
}

- (void)setMaxCapacity_GuidanceManeuver:(unint64_t)a3
{
  self->_maxCapacity_GuidanceManeuver = a3;
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

- (BOOL)_enabledModified
{
  return self->__enabledModified;
}

- (void)set_enabledModified:(BOOL)a3
{
  self->__enabledModified = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
