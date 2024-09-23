@implementation C2MPMetric

- (C2MPNetworkEvent)networkEvent
{
  return self->_networkEvent;
}

- (void)setTriggers:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_triggers = a3;
}

- (void)setReportTransportSourceApplicationSecondaryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_reportTransportSourceApplicationSecondaryIdentifier, a3);
}

- (void)setReportTransportSourceApplicationBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_reportTransportSourceApplicationBundleIdentifier, a3);
}

- (void)setReportTransportAllowPowerNapScheduling:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_reportTransportAllowPowerNapScheduling = a3;
}

- (void)setReportTransportAllowExpensiveAccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_reportTransportAllowExpensiveAccess = a3;
}

- (void)setReportFrequencyBase:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_reportFrequencyBase = a3;
}

- (void)setReportFrequency:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reportFrequency = a3;
}

- (void)setMetricType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_metricType = a3;
}

- (void)setDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfo, a3);
}

- (void)setCloudkitInfo:(id)a3
{
  objc_storeStrong((id *)&self->_cloudkitInfo, a3);
}

- (C2MPCloudKitInfo)cloudkitInfo
{
  return self->_cloudkitInfo;
}

- (int)metricType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_metricType;
  else
    return 0;
}

- (C2MPDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (C2MPGenericEvent)genericEvent
{
  return self->_genericEvent;
}

- (void)setNetworkEvent:(id)a3
{
  objc_storeStrong((id *)&self->_networkEvent, a3);
}

- (void)setGenericEvent:(id)a3
{
  objc_storeStrong((id *)&self->_genericEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInfo, 0);
  objc_storeStrong((id *)&self->_reportTransportSourceApplicationSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_reportTransportSourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_networkEvent, 0);
  objc_storeStrong((id *)&self->_genericEvent, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_cloudkitInfo, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_deviceInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_cloudkitInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_serverInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 2) == 0)
        goto LABEL_12;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_27:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_14:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_15:
  if (self->_reportTransportSourceApplicationBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_reportTransportSourceApplicationSecondaryIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_networkEvent)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_genericEvent)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)setHasMetricType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMetricType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)metricTypeAsString:(int)a3
{
  __CFString *v3;

  switch(a3)
  {
    case 0:
      return CFSTR("none_type");
    case 201:
      return CFSTR("generic_event_type");
    case 200:
      v3 = CFSTR("network_event_type");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

- (int)StringAsMetricType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("none_type")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("network_event_type")) & 1) != 0)
  {
    v4 = 200;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("generic_event_type")))
  {
    v4 = 201;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasDeviceInfo
{
  return self->_deviceInfo != 0;
}

- (BOOL)hasCloudkitInfo
{
  return self->_cloudkitInfo != 0;
}

- (BOOL)hasServerInfo
{
  return self->_serverInfo != 0;
}

- (void)setHasTriggers:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTriggers
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasReportFrequency:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReportFrequency
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasReportFrequencyBase:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReportFrequencyBase
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasReportTransportAllowExpensiveAccess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasReportTransportAllowExpensiveAccess
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasReportTransportAllowPowerNapScheduling:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasReportTransportAllowPowerNapScheduling
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasReportTransportSourceApplicationBundleIdentifier
{
  return self->_reportTransportSourceApplicationBundleIdentifier != 0;
}

- (BOOL)hasReportTransportSourceApplicationSecondaryIdentifier
{
  return self->_reportTransportSourceApplicationSecondaryIdentifier != 0;
}

- (BOOL)hasNetworkEvent
{
  return self->_networkEvent != 0;
}

- (BOOL)hasGenericEvent
{
  return self->_genericEvent != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)C2MPMetric;
  -[C2MPMetric description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MPMetric dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int metricType;
  __CFString *v5;
  C2MPDeviceInfo *deviceInfo;
  void *v7;
  C2MPCloudKitInfo *cloudkitInfo;
  void *v9;
  C2MPServerInfo *serverInfo;
  void *v11;
  char has;
  void *v13;
  NSString *reportTransportSourceApplicationBundleIdentifier;
  NSString *reportTransportSourceApplicationSecondaryIdentifier;
  C2MPNetworkEvent *networkEvent;
  void *v17;
  C2MPGenericEvent *genericEvent;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    metricType = self->_metricType;
    if (metricType)
    {
      if (metricType == 201)
      {
        v5 = CFSTR("generic_event_type");
      }
      else if (metricType == 200)
      {
        v5 = CFSTR("network_event_type");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_metricType);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = CFSTR("none_type");
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("metric_type"));

  }
  deviceInfo = self->_deviceInfo;
  if (deviceInfo)
  {
    -[C2MPDeviceInfo dictionaryRepresentation](deviceInfo, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("device_info"));

  }
  cloudkitInfo = self->_cloudkitInfo;
  if (cloudkitInfo)
  {
    -[C2MPCloudKitInfo dictionaryRepresentation](cloudkitInfo, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("cloudkit_info"));

  }
  serverInfo = self->_serverInfo;
  if (serverInfo)
  {
    -[C2MPServerInfo dictionaryRepresentation](serverInfo, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("server_info"));

  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_triggers);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("triggers"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_18:
      if ((has & 2) == 0)
        goto LABEL_19;
      goto LABEL_33;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_reportFrequency);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("report_frequency"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_19:
    if ((has & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_reportFrequencyBase);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("report_frequency_base"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_20:
    if ((has & 0x20) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_reportTransportAllowExpensiveAccess);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("report_transport_allow_expensive_access"));

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_reportTransportAllowPowerNapScheduling);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("report_transport_allow_power_nap_scheduling"));

  }
LABEL_22:
  reportTransportSourceApplicationBundleIdentifier = self->_reportTransportSourceApplicationBundleIdentifier;
  if (reportTransportSourceApplicationBundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", reportTransportSourceApplicationBundleIdentifier, CFSTR("report_transport_source_application_bundle_identifier"));
  reportTransportSourceApplicationSecondaryIdentifier = self->_reportTransportSourceApplicationSecondaryIdentifier;
  if (reportTransportSourceApplicationSecondaryIdentifier)
    objc_msgSend(v3, "setObject:forKey:", reportTransportSourceApplicationSecondaryIdentifier, CFSTR("report_transport_source_application_secondary_identifier"));
  networkEvent = self->_networkEvent;
  if (networkEvent)
  {
    -[C2MPNetworkEvent dictionaryRepresentation](networkEvent, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("network_event"));

  }
  genericEvent = self->_genericEvent;
  if (genericEvent)
  {
    -[C2MPGenericEvent dictionaryRepresentation](genericEvent, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("generic_event"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return C2MPMetricReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4[14] = self->_metricType;
    *((_BYTE *)v4 + 100) |= 8u;
  }
  v6 = v4;
  if (self->_deviceInfo)
  {
    objc_msgSend(v4, "setDeviceInfo:");
    v4 = v6;
  }
  if (self->_cloudkitInfo)
  {
    objc_msgSend(v6, "setCloudkitInfo:");
    v4 = v6;
  }
  if (self->_serverInfo)
  {
    objc_msgSend(v6, "setServerInfo:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = self->_triggers;
    *((_BYTE *)v4 + 100) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 2) == 0)
        goto LABEL_12;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  *((_QWORD *)v4 + 1) = self->_reportFrequency;
  *((_BYTE *)v4 + 100) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)v4 + 2) = self->_reportFrequencyBase;
  *((_BYTE *)v4 + 100) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_27:
  *((_BYTE *)v4 + 96) = self->_reportTransportAllowExpensiveAccess;
  *((_BYTE *)v4 + 100) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_14:
    *((_BYTE *)v4 + 97) = self->_reportTransportAllowPowerNapScheduling;
    *((_BYTE *)v4 + 100) |= 0x20u;
  }
LABEL_15:
  if (self->_reportTransportSourceApplicationBundleIdentifier)
  {
    objc_msgSend(v6, "setReportTransportSourceApplicationBundleIdentifier:");
    v4 = v6;
  }
  if (self->_reportTransportSourceApplicationSecondaryIdentifier)
  {
    objc_msgSend(v6, "setReportTransportSourceApplicationSecondaryIdentifier:");
    v4 = v6;
  }
  if (self->_networkEvent)
  {
    objc_msgSend(v6, "setNetworkEvent:");
    v4 = v6;
  }
  if (self->_genericEvent)
  {
    objc_msgSend(v6, "setGenericEvent:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char has;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_metricType;
    *(_BYTE *)(v5 + 100) |= 8u;
  }
  v7 = -[C2MPDeviceInfo copyWithZone:](self->_deviceInfo, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v7;

  v9 = -[C2MPCloudKitInfo copyWithZone:](self->_cloudkitInfo, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v9;

  v11 = -[C2MPServerInfo copyWithZone:](self->_serverInfo, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v11;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v6 + 24) = self->_triggers;
    *(_BYTE *)(v6 + 100) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *(_QWORD *)(v6 + 8) = self->_reportFrequency;
  *(_BYTE *)(v6 + 100) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
LABEL_13:
    *(_BYTE *)(v6 + 96) = self->_reportTransportAllowExpensiveAccess;
    *(_BYTE *)(v6 + 100) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_12:
  *(_QWORD *)(v6 + 16) = self->_reportFrequencyBase;
  *(_BYTE *)(v6 + 100) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_7:
  if ((has & 0x20) != 0)
  {
LABEL_8:
    *(_BYTE *)(v6 + 97) = self->_reportTransportAllowPowerNapScheduling;
    *(_BYTE *)(v6 + 100) |= 0x20u;
  }
LABEL_9:
  v14 = -[NSString copyWithZone:](self->_reportTransportSourceApplicationBundleIdentifier, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v14;

  v16 = -[NSString copyWithZone:](self->_reportTransportSourceApplicationSecondaryIdentifier, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v16;

  v18 = -[C2MPNetworkEvent copyWithZone:](self->_networkEvent, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v18;

  v20 = -[C2MPGenericEvent copyWithZone:](self->_genericEvent, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v20;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  C2MPDeviceInfo *deviceInfo;
  C2MPCloudKitInfo *cloudkitInfo;
  C2MPServerInfo *serverInfo;
  NSString *reportTransportSourceApplicationBundleIdentifier;
  NSString *reportTransportSourceApplicationSecondaryIdentifier;
  C2MPNetworkEvent *networkEvent;
  C2MPGenericEvent *genericEvent;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 8) == 0 || self->_metricType != *((_DWORD *)v4 + 14))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 100) & 8) != 0)
  {
    goto LABEL_52;
  }
  deviceInfo = self->_deviceInfo;
  if ((unint64_t)deviceInfo | *((_QWORD *)v4 + 5) && !-[C2MPDeviceInfo isEqual:](deviceInfo, "isEqual:"))
    goto LABEL_52;
  cloudkitInfo = self->_cloudkitInfo;
  if ((unint64_t)cloudkitInfo | *((_QWORD *)v4 + 4))
  {
    if (!-[C2MPCloudKitInfo isEqual:](cloudkitInfo, "isEqual:"))
      goto LABEL_52;
  }
  serverInfo = self->_serverInfo;
  if ((unint64_t)serverInfo | *((_QWORD *)v4 + 11))
  {
    if (!-[C2MPServerInfo isEqual:](serverInfo, "isEqual:"))
      goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 4) == 0 || self->_triggers != *((_QWORD *)v4 + 3))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 100) & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 1) == 0 || self->_reportFrequency != *((_QWORD *)v4 + 1))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 100) & 1) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 2) == 0 || self->_reportFrequencyBase != *((_QWORD *)v4 + 2))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 100) & 2) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 0x10) == 0)
      goto LABEL_52;
    if (self->_reportTransportAllowExpensiveAccess)
    {
      if (!*((_BYTE *)v4 + 96))
        goto LABEL_52;
    }
    else if (*((_BYTE *)v4 + 96))
    {
      goto LABEL_52;
    }
  }
  else if ((*((_BYTE *)v4 + 100) & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 0x20) != 0)
    {
      if (self->_reportTransportAllowPowerNapScheduling)
      {
        if (!*((_BYTE *)v4 + 97))
          goto LABEL_52;
        goto LABEL_44;
      }
      if (!*((_BYTE *)v4 + 97))
        goto LABEL_44;
    }
LABEL_52:
    v12 = 0;
    goto LABEL_53;
  }
  if ((*((_BYTE *)v4 + 100) & 0x20) != 0)
    goto LABEL_52;
LABEL_44:
  reportTransportSourceApplicationBundleIdentifier = self->_reportTransportSourceApplicationBundleIdentifier;
  if ((unint64_t)reportTransportSourceApplicationBundleIdentifier | *((_QWORD *)v4 + 9)
    && !-[NSString isEqual:](reportTransportSourceApplicationBundleIdentifier, "isEqual:"))
  {
    goto LABEL_52;
  }
  reportTransportSourceApplicationSecondaryIdentifier = self->_reportTransportSourceApplicationSecondaryIdentifier;
  if ((unint64_t)reportTransportSourceApplicationSecondaryIdentifier | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](reportTransportSourceApplicationSecondaryIdentifier, "isEqual:"))
      goto LABEL_52;
  }
  networkEvent = self->_networkEvent;
  if ((unint64_t)networkEvent | *((_QWORD *)v4 + 8))
  {
    if (!-[C2MPNetworkEvent isEqual:](networkEvent, "isEqual:"))
      goto LABEL_52;
  }
  genericEvent = self->_genericEvent;
  if ((unint64_t)genericEvent | *((_QWORD *)v4 + 6))
    v12 = -[C2MPGenericEvent isEqual:](genericEvent, "isEqual:");
  else
    v12 = 1;
LABEL_53:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  unint64_t v15;

  if ((*(_BYTE *)&self->_has & 8) != 0)
    v3 = 2654435761 * self->_metricType;
  else
    v3 = 0;
  v4 = -[C2MPDeviceInfo hash](self->_deviceInfo, "hash");
  v5 = -[C2MPCloudKitInfo hash](self->_cloudkitInfo, "hash");
  v6 = -[C2MPServerInfo hash](self->_serverInfo, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v7 = 2654435761u * self->_triggers;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_6:
      v8 = 2654435761u * self->_reportFrequency;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_7;
      goto LABEL_12;
    }
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_7:
    v9 = 2654435761u * self->_reportFrequencyBase;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_8;
LABEL_13:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_9;
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
LABEL_12:
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_13;
LABEL_8:
  v10 = 2654435761 * self->_reportTransportAllowExpensiveAccess;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_9:
  v11 = 2654435761 * self->_reportTransportAllowPowerNapScheduling;
LABEL_15:
  v12 = v4 ^ v3 ^ v5 ^ v6;
  v13 = v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSString hash](self->_reportTransportSourceApplicationBundleIdentifier, "hash");
  v14 = v12 ^ v13 ^ -[NSString hash](self->_reportTransportSourceApplicationSecondaryIdentifier, "hash");
  v15 = -[C2MPNetworkEvent hash](self->_networkEvent, "hash");
  return v14 ^ v15 ^ -[C2MPGenericEvent hash](self->_genericEvent, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  C2MPDeviceInfo *deviceInfo;
  uint64_t v7;
  C2MPCloudKitInfo *cloudkitInfo;
  uint64_t v9;
  C2MPServerInfo *serverInfo;
  uint64_t v11;
  char v12;
  C2MPNetworkEvent *networkEvent;
  uint64_t v14;
  C2MPGenericEvent *genericEvent;
  uint64_t v16;
  id v17;

  v4 = a3;
  v5 = v4;
  if ((v4[25] & 8) != 0)
  {
    self->_metricType = v4[14];
    *(_BYTE *)&self->_has |= 8u;
  }
  deviceInfo = self->_deviceInfo;
  v7 = *((_QWORD *)v5 + 5);
  v17 = v5;
  if (deviceInfo)
  {
    if (!v7)
      goto LABEL_9;
    -[C2MPDeviceInfo mergeFrom:](deviceInfo, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[C2MPMetric setDeviceInfo:](self, "setDeviceInfo:");
  }
  v5 = v17;
LABEL_9:
  cloudkitInfo = self->_cloudkitInfo;
  v9 = *((_QWORD *)v5 + 4);
  if (cloudkitInfo)
  {
    if (!v9)
      goto LABEL_15;
    -[C2MPCloudKitInfo mergeFrom:](cloudkitInfo, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[C2MPMetric setCloudkitInfo:](self, "setCloudkitInfo:");
  }
  v5 = v17;
LABEL_15:
  serverInfo = self->_serverInfo;
  v11 = *((_QWORD *)v5 + 11);
  if (serverInfo)
  {
    if (!v11)
      goto LABEL_21;
    -[C2MPServerInfo mergeFrom:](serverInfo, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_21;
    -[C2MPMetric setServerInfo:](self, "setServerInfo:");
  }
  v5 = v17;
LABEL_21:
  v12 = *((_BYTE *)v5 + 100);
  if ((v12 & 4) != 0)
  {
    self->_triggers = *((_QWORD *)v5 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v12 = *((_BYTE *)v5 + 100);
    if ((v12 & 1) == 0)
    {
LABEL_23:
      if ((v12 & 2) == 0)
        goto LABEL_24;
      goto LABEL_36;
    }
  }
  else if ((*((_BYTE *)v5 + 100) & 1) == 0)
  {
    goto LABEL_23;
  }
  self->_reportFrequency = *((_QWORD *)v5 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v12 = *((_BYTE *)v5 + 100);
  if ((v12 & 2) == 0)
  {
LABEL_24:
    if ((v12 & 0x10) == 0)
      goto LABEL_25;
    goto LABEL_37;
  }
LABEL_36:
  self->_reportFrequencyBase = *((_QWORD *)v5 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v12 = *((_BYTE *)v5 + 100);
  if ((v12 & 0x10) == 0)
  {
LABEL_25:
    if ((v12 & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_37:
  self->_reportTransportAllowExpensiveAccess = *((_BYTE *)v5 + 96);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)v5 + 100) & 0x20) != 0)
  {
LABEL_26:
    self->_reportTransportAllowPowerNapScheduling = *((_BYTE *)v5 + 97);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_27:
  if (*((_QWORD *)v5 + 9))
  {
    -[C2MPMetric setReportTransportSourceApplicationBundleIdentifier:](self, "setReportTransportSourceApplicationBundleIdentifier:");
    v5 = v17;
  }
  if (*((_QWORD *)v5 + 10))
  {
    -[C2MPMetric setReportTransportSourceApplicationSecondaryIdentifier:](self, "setReportTransportSourceApplicationSecondaryIdentifier:");
    v5 = v17;
  }
  networkEvent = self->_networkEvent;
  v14 = *((_QWORD *)v5 + 8);
  if (networkEvent)
  {
    if (!v14)
      goto LABEL_42;
    -[C2MPNetworkEvent mergeFrom:](networkEvent, "mergeFrom:");
  }
  else
  {
    if (!v14)
      goto LABEL_42;
    -[C2MPMetric setNetworkEvent:](self, "setNetworkEvent:");
  }
  v5 = v17;
LABEL_42:
  genericEvent = self->_genericEvent;
  v16 = *((_QWORD *)v5 + 6);
  if (genericEvent)
  {
    if (v16)
    {
      -[C2MPGenericEvent mergeFrom:](genericEvent, "mergeFrom:");
LABEL_47:
      v5 = v17;
    }
  }
  else if (v16)
  {
    -[C2MPMetric setGenericEvent:](self, "setGenericEvent:");
    goto LABEL_47;
  }

}

- (C2MPServerInfo)serverInfo
{
  return self->_serverInfo;
}

- (void)setServerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_serverInfo, a3);
}

- (unint64_t)triggers
{
  return self->_triggers;
}

- (unint64_t)reportFrequency
{
  return self->_reportFrequency;
}

- (unint64_t)reportFrequencyBase
{
  return self->_reportFrequencyBase;
}

- (BOOL)reportTransportAllowExpensiveAccess
{
  return self->_reportTransportAllowExpensiveAccess;
}

- (BOOL)reportTransportAllowPowerNapScheduling
{
  return self->_reportTransportAllowPowerNapScheduling;
}

- (NSString)reportTransportSourceApplicationBundleIdentifier
{
  return self->_reportTransportSourceApplicationBundleIdentifier;
}

- (NSString)reportTransportSourceApplicationSecondaryIdentifier
{
  return self->_reportTransportSourceApplicationSecondaryIdentifier;
}

@end
