@implementation CTStewieState

- (id)description
{
  void *v3;
  unint64_t v4;
  const char *v5;
  unint64_t v6;
  const char *v7;
  unint64_t v8;
  const char *v9;
  _BOOL4 v10;
  const char *v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", allowedServices=%ld"), -[CTStewieState allowedServices](self, "allowedServices"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", activeServices=%ld"), -[CTStewieState activeServices](self, "activeServices"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", subscriptionDeterminedServices=%ld"), -[CTStewieState subscriptionDeterminedServices](self, "subscriptionDeterminedServices"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", subscribedServices=%ld"), -[CTStewieState subscribedServices](self, "subscribedServices"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", congestedServices=%ld"), -[CTStewieState congestedServices](self, "congestedServices"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", dataPathAssertedServices=%ld"), -[CTStewieState dataPathAssertedServices](self, "dataPathAssertedServices"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", demoAllowedServices=%ld"), -[CTStewieState demoAllowedServices](self, "demoAllowedServices"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", offGridCriteriaSatisfiedServices=%ld"), -[CTStewieState offGridCriteriaSatisfiedServices](self, "offGridCriteriaSatisfiedServices"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", configuredForLocationServices=%ld"), -[CTStewieState configuredForLocationServices](self, "configuredForLocationServices"));
  v4 = -[CTStewieState status](self, "status");
  if (v4 > 6)
    v5 = "???";
  else
    v5 = off_1E1530390[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR(", status=%s"), v5);
  v6 = -[CTStewieState reason](self, "reason");
  if (v6 > 8)
    v7 = "???";
  else
    v7 = off_1E15303C8[v6];
  objc_msgSend(v3, "appendFormat:", CFSTR(", reason=%s"), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR(", baseReason=%s"), CTStewieServiceStatusReasonAsString(-[CTStewieState baseReason](self, "baseReason")));
  v8 = -[CTStewieState transportType](self, "transportType");
  if (v8 > 2)
    v9 = "???";
  else
    v9 = off_1E1530410[v8];
  objc_msgSend(v3, "appendFormat:", CFSTR(", transportType=%s"), v9);
  v10 = -[CTStewieState displaySatelliteIcon](self, "displaySatelliteIcon");
  v11 = "no";
  if (v10)
    v11 = "yes";
  objc_msgSend(v3, "appendFormat:", CFSTR(", displaySatelliteIcon=%s"), v11);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (int64_t)subscriptionDeterminedServices
{
  return self->_subscriptionDeterminedServices;
}

- (int64_t)subscribedServices
{
  return self->_subscribedServices;
}

- (int64_t)status
{
  return self->_status;
}

- (int64_t)reason
{
  return self->_reason;
}

- (int64_t)offGridCriteriaSatisfiedServices
{
  return self->_offGridCriteriaSatisfiedServices;
}

- (int64_t)congestedServices
{
  return self->_congestedServices;
}

- (int64_t)configuredForLocationServices
{
  return self->_configuredForLocationServices;
}

- (int64_t)baseReason
{
  return self->_baseReason;
}

- (int64_t)allowedServices
{
  return self->_allowedServices;
}

- (int64_t)activeServices
{
  return self->_activeServices;
}

- (CTStewieState)init
{
  CTStewieState *v2;
  CTStewieState *v3;
  CTStewieState *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CTStewieState;
  v2 = -[CTStewieState init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_displaySatelliteIcon = 0;
    *(_OWORD *)&v2->_allowedServices = 0u;
    *(_OWORD *)&v2->_status = 0u;
    *(_OWORD *)&v2->_transportType = 0u;
    *(_OWORD *)&v2->_subscribedServices = 0u;
    *(_OWORD *)&v2->_dataPathAssertedServices = 0u;
    *(_OWORD *)&v2->_offGridCriteriaSatisfiedServices = 0u;
    v2->_baseReason = 0;
    v4 = v2;
  }

  return v3;
}

- (CTStewieState)initWithStewieState:(const StewieState *)a3
{
  CTStewieState *v4;
  CTStewieState *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  int var11;
  uint64_t v11;
  CTStewieState *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CTStewieState;
  v4 = -[CTStewieState init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    -[CTStewieState setAllowedServices:](v4, "setAllowedServices:", a3->var0);
    -[CTStewieState setActiveServices:](v5, "setActiveServices:", a3->var1);
    -[CTStewieState setSubscriptionDeterminedServices:](v5, "setSubscriptionDeterminedServices:", a3->var2);
    -[CTStewieState setSubscribedServices:](v5, "setSubscribedServices:", a3->var3);
    -[CTStewieState setCongestedServices:](v5, "setCongestedServices:", a3->var4);
    -[CTStewieState setDataPathAssertedServices:](v5, "setDataPathAssertedServices:", a3->var5);
    -[CTStewieState setDemoAllowedServices:](v5, "setDemoAllowedServices:", a3->var6);
    -[CTStewieState setOffGridCriteriaSatisfiedServices:](v5, "setOffGridCriteriaSatisfiedServices:", a3->var7);
    -[CTStewieState setConfiguredForLocationServices:](v5, "setConfiguredForLocationServices:", a3->var8);
    if ((a3->var9 - 1) > 3u)
      v6 = 0;
    else
      v6 = qword_1843CDB48[(char)(a3->var9 - 1)];
    -[CTStewieState setStatus:](v5, "setStatus:", v6);
    v7 = a3->var10 - 1;
    if (v7 > 5)
      v8 = 0;
    else
      v8 = qword_1843CDB68[(char)v7];
    -[CTStewieState setReason:](v5, "setReason:", v8);
    if (a3->var10 - 1 < 7)
      v9 = (a3->var10 - 1) + 1;
    else
      v9 = 0;
    -[CTStewieState setBaseReason:](v5, "setBaseReason:", v9);
    var11 = a3->var11;
    if (var11 == 2)
      v11 = 2;
    else
      v11 = var11 == 1;
    -[CTStewieState setTransportType:](v5, "setTransportType:", v11);
    -[CTStewieState setDisplaySatelliteIcon:](v5, "setDisplaySatelliteIcon:", a3->var12);
    v12 = v5;
  }

  return v5;
}

- (BOOL)isEqualToState:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  _BOOL4 v18;
  int v19;

  v4 = a3;
  v5 = -[CTStewieState allowedServices](self, "allowedServices");
  if (v5 != objc_msgSend(v4, "allowedServices"))
    goto LABEL_15;
  v6 = -[CTStewieState activeServices](self, "activeServices");
  if (v6 != objc_msgSend(v4, "activeServices"))
    goto LABEL_15;
  v7 = -[CTStewieState subscriptionDeterminedServices](self, "subscriptionDeterminedServices");
  if (v7 != objc_msgSend(v4, "subscriptionDeterminedServices"))
    goto LABEL_15;
  v8 = -[CTStewieState subscribedServices](self, "subscribedServices");
  if (v8 != objc_msgSend(v4, "subscribedServices"))
    goto LABEL_15;
  v9 = -[CTStewieState congestedServices](self, "congestedServices");
  if (v9 != objc_msgSend(v4, "congestedServices"))
    goto LABEL_15;
  v10 = -[CTStewieState dataPathAssertedServices](self, "dataPathAssertedServices");
  if (v10 != objc_msgSend(v4, "dataPathAssertedServices"))
    goto LABEL_15;
  v11 = -[CTStewieState demoAllowedServices](self, "demoAllowedServices");
  if (v11 == objc_msgSend(v4, "demoAllowedServices")
    && (v12 = -[CTStewieState offGridCriteriaSatisfiedServices](self, "offGridCriteriaSatisfiedServices"),
        v12 == objc_msgSend(v4, "offGridCriteriaSatisfiedServices"))
    && (v13 = -[CTStewieState configuredForLocationServices](self, "configuredForLocationServices"),
        v13 == objc_msgSend(v4, "configuredForLocationServices"))
    && (v14 = -[CTStewieState status](self, "status"), v14 == objc_msgSend(v4, "status"))
    && (v15 = -[CTStewieState reason](self, "reason"), v15 == objc_msgSend(v4, "reason"))
    && (v16 = -[CTStewieState baseReason](self, "baseReason"), v16 == objc_msgSend(v4, "baseReason"))
    && (v17 = -[CTStewieState transportType](self, "transportType"), v17 == objc_msgSend(v4, "transportType")))
  {
    v18 = -[CTStewieState displaySatelliteIcon](self, "displaySatelliteIcon");
    v19 = v18 ^ objc_msgSend(v4, "displaySatelliteIcon") ^ 1;
  }
  else
  {
LABEL_15:
    LOBYTE(v19) = 0;
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieState *v4;
  BOOL v5;

  v4 = (CTStewieState *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CTStewieState isEqualToState:](self, "isEqualToState:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAllowedServices:", -[CTStewieState allowedServices](self, "allowedServices"));
  objc_msgSend(v4, "setActiveServices:", -[CTStewieState activeServices](self, "activeServices"));
  objc_msgSend(v4, "setSubscriptionDeterminedServices:", -[CTStewieState subscriptionDeterminedServices](self, "subscriptionDeterminedServices"));
  objc_msgSend(v4, "setSubscribedServices:", -[CTStewieState subscribedServices](self, "subscribedServices"));
  objc_msgSend(v4, "setCongestedServices:", -[CTStewieState congestedServices](self, "congestedServices"));
  objc_msgSend(v4, "setDataPathAssertedServices:", -[CTStewieState dataPathAssertedServices](self, "dataPathAssertedServices"));
  objc_msgSend(v4, "setDemoAllowedServices:", -[CTStewieState demoAllowedServices](self, "demoAllowedServices"));
  objc_msgSend(v4, "setOffGridCriteriaSatisfiedServices:", -[CTStewieState offGridCriteriaSatisfiedServices](self, "offGridCriteriaSatisfiedServices"));
  objc_msgSend(v4, "setConfiguredForLocationServices:", -[CTStewieState configuredForLocationServices](self, "configuredForLocationServices"));
  objc_msgSend(v4, "setReason:", -[CTStewieState reason](self, "reason"));
  objc_msgSend(v4, "setBaseReason:", -[CTStewieState baseReason](self, "baseReason"));
  objc_msgSend(v4, "setStatus:", -[CTStewieState status](self, "status"));
  objc_msgSend(v4, "setTransportType:", -[CTStewieState transportType](self, "transportType"));
  objc_msgSend(v4, "setDisplaySatelliteIcon:", -[CTStewieState displaySatelliteIcon](self, "displaySatelliteIcon"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState allowedServices](self, "allowedServices"), CFSTR("allowedServices"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState activeServices](self, "activeServices"), CFSTR("activeServices"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState subscriptionDeterminedServices](self, "subscriptionDeterminedServices"), CFSTR("subscriptionDeterminedServices"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState subscribedServices](self, "subscribedServices"), CFSTR("subscribedServices"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState congestedServices](self, "congestedServices"), CFSTR("congestedServices"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState dataPathAssertedServices](self, "dataPathAssertedServices"), CFSTR("dataPathAssertedServices"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState demoAllowedServices](self, "demoAllowedServices"), CFSTR("demoAllowedServices"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState offGridCriteriaSatisfiedServices](self, "offGridCriteriaSatisfiedServices"), CFSTR("offGridCriteriaSatisfiedServices"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState configuredForLocationServices](self, "configuredForLocationServices"), CFSTR("configuredForLocationServices"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState status](self, "status"), CFSTR("status"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState reason](self, "reason"), CFSTR("reason"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState baseReason](self, "baseReason"), CFSTR("baseReason"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTStewieState transportType](self, "transportType"), CFSTR("transportType"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CTStewieState displaySatelliteIcon](self, "displaySatelliteIcon"), CFSTR("displaySatelliteIcon"));

}

- (CTStewieState)initWithCoder:(id)a3
{
  id v4;
  CTStewieState *v5;
  CTStewieState *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CTStewieState;
  v5 = -[CTStewieState init](&v8, sel_init);
  if (v5)
  {
    v5->_allowedServices = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("allowedServices"));
    v5->_activeServices = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activeServices"));
    v5->_subscriptionDeterminedServices = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("subscriptionDeterminedServices"));
    v5->_subscribedServices = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("subscribedServices"));
    v5->_congestedServices = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("congestedServices"));
    v5->_dataPathAssertedServices = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dataPathAssertedServices"));
    v5->_demoAllowedServices = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("demoAllowedServices"));
    v5->_offGridCriteriaSatisfiedServices = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("offGridCriteriaSatisfiedServices"));
    v5->_configuredForLocationServices = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("configuredForLocationServices"));
    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    v5->_reason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reason"));
    v5->_baseReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("baseReason"));
    v5->_transportType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transportType"));
    v5->_displaySatelliteIcon = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("displaySatelliteIcon"));
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)displayInactiveSOSInStatusBar
{
  BOOL v3;

  v3 = 1;
  if (!-[CTStewieState isAllowedService:](self, "isAllowedService:", 1))
    v3 = -[CTStewieState isActiveService:](self, "isActiveService:", 1);
  return -[CTStewieState displaySatelliteIcon](self, "displaySatelliteIcon") && v3;
}

- (BOOL)isStewieActive
{
  return -[CTStewieState activeServices](self, "activeServices") != 0;
}

- (BOOL)isStewieActiveOverBB
{
  _BOOL4 v3;

  v3 = -[CTStewieState isStewieActive](self, "isStewieActive");
  if (v3)
    LOBYTE(v3) = -[CTStewieState transportType](self, "transportType") == 1;
  return v3;
}

- (BOOL)isStewieActiveOverInternet
{
  _BOOL4 v3;

  v3 = -[CTStewieState isStewieActive](self, "isStewieActive");
  if (v3)
    LOBYTE(v3) = -[CTStewieState transportType](self, "transportType") == 2;
  return v3;
}

- (BOOL)isAllowedService:(int64_t)a3
{
  return (a3 & ~-[CTStewieState allowedServices](self, "allowedServices")) == 0;
}

- (BOOL)isActiveService:(int64_t)a3
{
  return (a3 & ~-[CTStewieState activeServices](self, "activeServices")) == 0;
}

- (BOOL)isSubscriptionRequired:(int64_t)a3
{
  return (a3 & 0x3D) != 0;
}

- (BOOL)isSubscribedService:(int64_t)a3
{
  return (a3 & ~-[CTStewieState subscribedServices](self, "subscribedServices") & 0x3DLL) == 0;
}

- (BOOL)isSubscriptionStatusNetworkDetermined:(int64_t)a3
{
  return (a3 & ~-[CTStewieState subscriptionDeterminedServices](self, "subscriptionDeterminedServices")) == 0;
}

- (BOOL)isCongestedService:(int64_t)a3
{
  return (-[CTStewieState congestedServices](self, "congestedServices") & a3) != 0;
}

- (BOOL)isDemoAllowedForService:(int64_t)a3
{
  return (a3 & ~-[CTStewieState demoAllowedServices](self, "demoAllowedServices")) == 0;
}

- (BOOL)isPermittedAtCurrentLocation:(int64_t)a3
{
  return (a3 & ~-[CTStewieState configuredForLocationServices](self, "configuredForLocationServices")) == 0;
}

- (BOOL)isOffGridCriteriaSatisfied:(int64_t)a3
{
  return (a3 & ~-[CTStewieState offGridCriteriaSatisfiedServices](self, "offGridCriteriaSatisfiedServices")) == 0;
}

- (int64_t)statusReasonForService:(int64_t)a3
{
  int64_t result;
  BOOL v6;

  result = 0;
  v6 = (a3 & (a3 - 1)) != 0 && a3 > 0;
  if ((a3 & 0x3F) != 0 && !v6)
  {
    result = -[CTStewieState status](self, "status");
    if (result)
    {
      if (-[CTStewieState isAllowedService:](self, "isAllowedService:", a3))
      {
        return 0;
      }
      else if (-[CTStewieState baseReason](self, "baseReason"))
      {
        return -[CTStewieState baseReason](self, "baseReason");
      }
      else if (-[CTStewieState isPermittedAtCurrentLocation:](self, "isPermittedAtCurrentLocation:", a3))
      {
        if (-[CTStewieState isSubscribedService:](self, "isSubscribedService:", a3))
        {
          if (-[CTStewieState isCongestedService:](self, "isCongestedService:", a3))
          {
            return 10;
          }
          else if (-[CTStewieState isOffGridCriteriaSatisfied:](self, "isOffGridCriteriaSatisfied:", a3))
          {
            return 0;
          }
          else
          {
            return 11;
          }
        }
        else if (-[CTStewieState isSubscriptionStatusNetworkDetermined:](self, "isSubscriptionStatusNetworkDetermined:", a3))
        {
          return 8;
        }
        else
        {
          return 9;
        }
      }
      else
      {
        return 4;
      }
    }
  }
  return result;
}

- (void)setAllowedServices:(int64_t)a3
{
  self->_allowedServices = a3;
}

- (void)setActiveServices:(int64_t)a3
{
  self->_activeServices = a3;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (void)setSubscriptionDeterminedServices:(int64_t)a3
{
  self->_subscriptionDeterminedServices = a3;
}

- (void)setSubscribedServices:(int64_t)a3
{
  self->_subscribedServices = a3;
}

- (void)setCongestedServices:(int64_t)a3
{
  self->_congestedServices = a3;
}

- (int64_t)dataPathAssertedServices
{
  return self->_dataPathAssertedServices;
}

- (void)setDataPathAssertedServices:(int64_t)a3
{
  self->_dataPathAssertedServices = a3;
}

- (int64_t)demoAllowedServices
{
  return self->_demoAllowedServices;
}

- (void)setDemoAllowedServices:(int64_t)a3
{
  self->_demoAllowedServices = a3;
}

- (void)setOffGridCriteriaSatisfiedServices:(int64_t)a3
{
  self->_offGridCriteriaSatisfiedServices = a3;
}

- (void)setConfiguredForLocationServices:(int64_t)a3
{
  self->_configuredForLocationServices = a3;
}

- (void)setBaseReason:(int64_t)a3
{
  self->_baseReason = a3;
}

- (BOOL)displaySatelliteIcon
{
  return self->_displaySatelliteIcon;
}

- (void)setDisplaySatelliteIcon:(BOOL)a3
{
  self->_displaySatelliteIcon = a3;
}

@end
