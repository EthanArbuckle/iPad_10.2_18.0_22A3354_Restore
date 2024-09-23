@implementation CTDataStatus

- (void)setAttached:(BOOL)a3
{
  self->_attached = a3;
}

- (void)setTotalActiveContexts:(unsigned int)a3
{
  self->_totalActiveContexts = a3;
}

- (void)setRoamAllowed:(BOOL)a3
{
  self->_roamAllowed = a3;
}

- (void)setReason:(int)a3
{
  self->_reason = a3;
}

- (void)setRadioTechnology:(int)a3
{
  self->_radioTechnology = a3;
}

- (void)setIndicatorOverride:(int)a3
{
  self->_indicatorOverride = a3;
}

- (void)setIndicator:(int)a3
{
  self->_indicator = a3;
}

- (void)setInHomeCountry:(BOOL)a3
{
  self->_inHomeCountry = a3;
}

- (void)setDataSim:(BOOL)a3
{
  self->_dataSim = a3;
}

- (void)setDataPlanSignalingReductionOverride:(BOOL)a3
{
  self->_dataPlanSignalingReductionOverride = a3;
}

- (void)setDataMode:(int)a3
{
  self->_dataMode = a3;
}

- (void)setDataBearerTechnology:(int)a3
{
  self->_dataBearerTechnology = a3;
}

- (void)setDataBearerSoMask:(unsigned int)a3
{
  self->_dataBearerSoMask = a3;
}

- (void)setCellularDataPossible:(BOOL)a3
{
  self->_cellularDataPossible = a3;
}

- (void)setActiveContexts:(unsigned int)a3
{
  self->_activeContexts = a3;
}

- (CTDataStatus)initWithCoder:(id)a3
{
  id v4;
  CTDataStatus *v5;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CTDataStatus;
  v5 = -[CTDataStatus init](&v8, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("DataStatusFlags"));
    v5->_attached = v6 & 1;
    v5->_dataPlanSignalingReductionOverride = v6 < 0;
    v5->_inHomeCountry = (v6 & 4) != 0;
    v5->_roamAllowed = (v6 & 8) != 0;
    v5->_cellularDataPossible = (v6 & 0x10) != 0;
    v5->_dataSim = (v6 & 0x40) != 0;
    v5->_indicator = objc_msgSend(v4, "decodeIntForKey:", CFSTR("indicator"));
    v5->_indicatorOverride = objc_msgSend(v4, "decodeIntForKey:", CFSTR("indicatorOverride"));
    v5->_radioTechnology = objc_msgSend(v4, "decodeIntForKey:", CFSTR("radioTechnology"));
    v5->_dataMode = objc_msgSend(v4, "decodeIntForKey:", CFSTR("dataMode"));
    v5->_dataBearerTechnology = objc_msgSend(v4, "decodeIntForKey:", CFSTR("dataBearerTechnology"));
    v5->_dataBearerSoMask = objc_msgSend(v4, "decodeIntForKey:", CFSTR("dataBearerSoMask"));
    v5->_activeContexts = objc_msgSend(v4, "decodeIntForKey:", CFSTR("activeContexts"));
    v5->_totalActiveContexts = objc_msgSend(v4, "decodeIntForKey:", CFSTR("totalActiveContexts"));
    v5->_reason = objc_msgSend(v4, "decodeIntForKey:", CFSTR("reason"));
  }

  return v5;
}

- (id)copyBasic
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setAttached:", -[CTDataStatus attached](self, "attached"));
  objc_msgSend(v3, "setHasIndicator:", -[CTDataStatus indicator](self, "indicator") != 0);
  objc_msgSend(v3, "setInHomeCountry:", -[CTDataStatus inHomeCountry](self, "inHomeCountry"));
  objc_msgSend(v3, "setRoamAllowed:", -[CTDataStatus roamAllowed](self, "roamAllowed"));
  objc_msgSend(v3, "setCellularDataPossible:", -[CTDataStatus cellularDataPossible](self, "cellularDataPossible"));
  objc_msgSend(v3, "setNewRadioCoverage:", -[CTDataStatus newRadioCoverage](self, "newRadioCoverage"));
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  unsigned int v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = -[CTDataStatus attached](self, "attached");
  if (-[CTDataStatus dataSim](self, "dataSim"))
    v4 |= 0x40u;
  if (-[CTDataStatus inHomeCountry](self, "inHomeCountry"))
    v4 |= 4u;
  if (-[CTDataStatus roamAllowed](self, "roamAllowed"))
    v4 |= 8u;
  if (-[CTDataStatus dataPlanSignalingReductionOverride](self, "dataPlanSignalingReductionOverride"))
    v4 |= 0x80u;
  if (-[CTDataStatus cellularDataPossible](self, "cellularDataPossible"))
    v5 = v4 | 0x10;
  else
    v5 = v4;
  objc_msgSend(v6, "encodeInt:forKey:", v5, CFSTR("DataStatusFlags"));
  objc_msgSend(v6, "encodeInt:forKey:", -[CTDataStatus indicator](self, "indicator"), CFSTR("indicator"));
  objc_msgSend(v6, "encodeInt:forKey:", -[CTDataStatus indicatorOverride](self, "indicatorOverride"), CFSTR("indicatorOverride"));
  objc_msgSend(v6, "encodeInt:forKey:", -[CTDataStatus radioTechnology](self, "radioTechnology"), CFSTR("radioTechnology"));
  objc_msgSend(v6, "encodeInt:forKey:", -[CTDataStatus dataMode](self, "dataMode"), CFSTR("dataMode"));
  objc_msgSend(v6, "encodeInt:forKey:", -[CTDataStatus dataBearerTechnology](self, "dataBearerTechnology"), CFSTR("dataBearerTechnology"));
  objc_msgSend(v6, "encodeInt:forKey:", -[CTDataStatus dataBearerSoMask](self, "dataBearerSoMask"), CFSTR("dataBearerSoMask"));
  objc_msgSend(v6, "encodeInt:forKey:", -[CTDataStatus activeContexts](self, "activeContexts"), CFSTR("activeContexts"));
  objc_msgSend(v6, "encodeInt:forKey:", -[CTDataStatus totalActiveContexts](self, "totalActiveContexts"), CFSTR("totalActiveContexts"));
  objc_msgSend(v6, "encodeInt:forKey:", -[CTDataStatus reason](self, "reason"), CFSTR("reason"));

}

- (id)description
{
  void *v3;
  unsigned int v4;
  const char *v5;
  unsigned int v6;
  const char *v7;
  unsigned int v8;
  const char *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", attached=%d"), -[CTDataStatus attached](self, "attached"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", dataSim=%d"), -[CTDataStatus dataSim](self, "dataSim"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", indicator=%s (%d)"), indicatorToString(-[CTDataStatus indicator](self, "indicator")), -[CTDataStatus indicator](self, "indicator"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", indicatorOverride=%s (%d)"), indicatorToString(-[CTDataStatus indicatorOverride](self, "indicatorOverride")), -[CTDataStatus indicatorOverride](self, "indicatorOverride"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", roamAllowed=%d"), -[CTDataStatus roamAllowed](self, "roamAllowed"));
  v4 = -[CTDataStatus radioTechnology](self, "radioTechnology");
  if (v4 > 0xA)
    v5 = "unknown";
  else
    v5 = off_1E1530250[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR(", radioTechnology=%s (%d)"), v5, -[CTDataStatus radioTechnology](self, "radioTechnology"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", reg.dataMode=%s (%d)"), dataModeToString(-[CTDataStatus dataMode](self, "dataMode")), -[CTDataStatus dataMode](self, "dataMode"));
  v6 = -[CTDataStatus dataBearerTechnology](self, "dataBearerTechnology") - 1;
  if (v6 > 5)
    v7 = "unknown";
  else
    v7 = off_1E15302A8[v6];
  objc_msgSend(v3, "appendFormat:", CFSTR(", dataBearerTechnology=%s (%d)"), v7, -[CTDataStatus dataBearerTechnology](self, "dataBearerTechnology"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", dataBearerSoMask=0x%x"), -[CTDataStatus dataBearerSoMask](self, "dataBearerSoMask"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", signalingReduction=%d"), -[CTDataStatus dataPlanSignalingReductionOverride](self, "dataPlanSignalingReductionOverride"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", cellularDataPossible=%d"), -[CTDataStatus cellularDataPossible](self, "cellularDataPossible"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", activeContexts=%d"), -[CTDataStatus activeContexts](self, "activeContexts"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", totalActiveContexts=%d"), -[CTDataStatus totalActiveContexts](self, "totalActiveContexts"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", inHomeCountry=%d"), -[CTDataStatus inHomeCountry](self, "inHomeCountry"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", newRadioCoverage=%d"), -[CTDataStatus newRadioCoverage](self, "newRadioCoverage"));
  v8 = -[CTDataStatus reason](self, "reason") - 1;
  if (v8 > 0xA)
    v9 = "unknown";
  else
    v9 = off_1E15302D8[v8];
  objc_msgSend(v3, "appendFormat:", CFSTR(", reason=%s (%d)"), v9, -[CTDataStatus reason](self, "reason"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (int)indicator
{
  return self->_indicator;
}

- (int)radioTechnology
{
  return self->_radioTechnology;
}

- (int)indicatorOverride
{
  return self->_indicatorOverride;
}

- (int)dataBearerTechnology
{
  return self->_dataBearerTechnology;
}

- (int)dataMode
{
  return self->_dataMode;
}

- (int)reason
{
  return self->_reason;
}

- (BOOL)inHomeCountry
{
  return self->_inHomeCountry;
}

- (BOOL)roamAllowed
{
  return self->_roamAllowed;
}

- (BOOL)attached
{
  return self->_attached;
}

- (BOOL)cellularDataPossible
{
  return self->_cellularDataPossible;
}

- (unsigned)totalActiveContexts
{
  return self->_totalActiveContexts;
}

- (BOOL)dataSim
{
  return self->_dataSim;
}

- (BOOL)dataPlanSignalingReductionOverride
{
  return self->_dataPlanSignalingReductionOverride;
}

- (unsigned)dataBearerSoMask
{
  return self->_dataBearerSoMask;
}

- (unsigned)activeContexts
{
  return self->_activeContexts;
}

- (BOOL)newRadioCoverage
{
  unsigned int v3;
  unsigned int v4;

  if (-[CTDataStatus radioTechnology](self, "radioTechnology") == 10)
    return 1;
  if (-[CTDataStatus newRadioDataBearer](self, "newRadioDataBearer"))
    return 1;
  v3 = -[CTDataStatus indicator](self, "indicator") - 8;
  if (v3 < 0xB && ((0x701u >> v3) & 1) != 0)
    return 1;
  v4 = -[CTDataStatus indicatorOverride](self, "indicatorOverride");
  if (v4 >= 0x13)
    return 0;
  else
    return (0x70100u >> v4) & 1;
}

- (BOOL)newRadioDataBearer
{
  return -[CTDataStatus dataBearerTechnology](self, "dataBearerTechnology") - 5 < 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAttached:", -[CTDataStatus attached](self, "attached"));
  objc_msgSend(v4, "setDataSim:", -[CTDataStatus dataSim](self, "dataSim"));
  objc_msgSend(v4, "setIndicator:", -[CTDataStatus indicator](self, "indicator"));
  objc_msgSend(v4, "setIndicatorOverride:", -[CTDataStatus indicatorOverride](self, "indicatorOverride"));
  objc_msgSend(v4, "setRoamAllowed:", -[CTDataStatus roamAllowed](self, "roamAllowed"));
  objc_msgSend(v4, "setRadioTechnology:", -[CTDataStatus radioTechnology](self, "radioTechnology"));
  objc_msgSend(v4, "setDataMode:", -[CTDataStatus dataMode](self, "dataMode"));
  objc_msgSend(v4, "setDataBearerTechnology:", -[CTDataStatus dataBearerTechnology](self, "dataBearerTechnology"));
  objc_msgSend(v4, "setDataBearerSoMask:", -[CTDataStatus dataBearerSoMask](self, "dataBearerSoMask"));
  objc_msgSend(v4, "setDataPlanSignalingReductionOverride:", -[CTDataStatus dataPlanSignalingReductionOverride](self, "dataPlanSignalingReductionOverride"));
  objc_msgSend(v4, "setCellularDataPossible:", -[CTDataStatus cellularDataPossible](self, "cellularDataPossible"));
  objc_msgSend(v4, "setActiveContexts:", -[CTDataStatus activeContexts](self, "activeContexts"));
  objc_msgSend(v4, "setTotalActiveContexts:", -[CTDataStatus totalActiveContexts](self, "totalActiveContexts"));
  objc_msgSend(v4, "setInHomeCountry:", -[CTDataStatus inHomeCountry](self, "inHomeCountry"));
  objc_msgSend(v4, "setReason:", -[CTDataStatus reason](self, "reason"));
  return v4;
}

- (BOOL)newRadioSaCoverage
{
  _BOOL4 v3;

  v3 = -[CTDataStatus newRadioCoverage](self, "newRadioCoverage");
  if (v3)
    LOBYTE(v3) = -[CTDataStatus radioTechnology](self, "radioTechnology") == 10;
  return v3;
}

- (BOOL)newRadioNsaCoverage
{
  _BOOL4 v3;

  v3 = -[CTDataStatus newRadioCoverage](self, "newRadioCoverage");
  if (v3)
    LOBYTE(v3) = !-[CTDataStatus newRadioSaCoverage](self, "newRadioSaCoverage");
  return v3;
}

- (BOOL)newRadioMmWaveDataBearer
{
  _BOOL4 v3;

  v3 = -[CTDataStatus newRadioDataBearer](self, "newRadioDataBearer");
  if (v3)
    return (-[CTDataStatus dataBearerSoMask](self, "dataBearerSoMask") >> 3) & 1;
  return v3;
}

- (BOOL)newRadioSub6DataBearer
{
  _BOOL4 v3;

  v3 = -[CTDataStatus newRadioDataBearer](self, "newRadioDataBearer");
  if (v3)
    return (-[CTDataStatus dataBearerSoMask](self, "dataBearerSoMask") >> 2) & 1;
  return v3;
}

- (BOOL)newRadioNsaDataBearer
{
  return -[CTDataStatus dataBearerTechnology](self, "dataBearerTechnology") == 5;
}

- (BOOL)newRadioSaDataBearer
{
  return -[CTDataStatus dataBearerTechnology](self, "dataBearerTechnology") == 6;
}

@end
