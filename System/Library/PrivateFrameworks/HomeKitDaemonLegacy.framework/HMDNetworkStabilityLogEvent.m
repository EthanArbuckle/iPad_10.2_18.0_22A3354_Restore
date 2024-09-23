@implementation HMDNetworkStabilityLogEvent

- (HMDNetworkStabilityLogEvent)initWithHomeUUID:(id)a3 numWifiAssociations:(unint64_t)a4 wifiDisassociations:(unint64_t)a5 apChanges:(unint64_t)a6 gatewayChanges:(unint64_t)a7 numReadWrites:(unint64_t)a8 numReadErrors:(unint64_t)a9 numWriteErrors:(unint64_t)a10 topReadWriteError:(id)a11 topSessionError:(id)a12 numSessionErrors:(unint64_t)a13 apOUI:(id)a14 ssid:(id)a15 gatewayMACAddress:(id)a16 localHourOfDay:(int64_t)a17 collectionDurationMinutes:(unint64_t)a18
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  HMDNetworkStabilityLogEvent *v28;
  HMDNetworkStabilityLogEvent *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  uint64_t v33;
  NSString *ssid;
  uint64_t v35;
  NSString *gatewayMACAddress;
  objc_super v40;

  v23 = a11;
  v24 = a12;
  v25 = a14;
  v26 = a15;
  v27 = a16;
  v40.receiver = self;
  v40.super_class = (Class)HMDNetworkStabilityLogEvent;
  v28 = -[HMMHomeLogEvent initWithHomeUUID:](&v40, sel_initWithHomeUUID_, a3);
  v29 = v28;
  if (v28)
  {
    v28->_numWifiAssociations = a4;
    v28->_numWifiDisassociations = a5;
    v28->_numAPChanges = a6;
    v28->_numGatewayChanges = a7;
    v28->_numReadWrites = a8;
    v28->_numReadErrors = a9;
    v28->_numWriteErrors = a10;
    if (v23)
      v30 = (__CFString *)objc_msgSend(v23, "copy");
    else
      v30 = CFSTR("<NO ERROR>");
    objc_storeStrong((id *)&v29->_topReadWriteError, v30);
    if (v23)

    if (v24)
      v31 = (__CFString *)objc_msgSend(v24, "copy");
    else
      v31 = CFSTR("<NO ERROR>");
    objc_storeStrong((id *)&v29->_topSessionError, v31);
    if (v24)

    v29->_numSessionErrors = a13;
    if (v25)
      v32 = (__CFString *)objc_msgSend(v25, "copy");
    else
      v32 = CFSTR("<NO AP>");
    objc_storeStrong((id *)&v29->_apOUI, v32);
    if (v25)

    v33 = objc_msgSend(v26, "copy", a7, a8);
    ssid = v29->_ssid;
    v29->_ssid = (NSString *)v33;

    v35 = objc_msgSend(v27, "copy");
    gatewayMACAddress = v29->_gatewayMACAddress;
    v29->_gatewayMACAddress = (NSString *)v35;

    v29->_localHourOfDay = a17;
    v29->_collectionDurationMinutes = a18;
  }

  return v29;
}

- (HMDNetworkStabilityLogEvent)initWithDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  HMDNetworkStabilityLogEvent *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  HMDNetworkStabilityLogEvent *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v61;
  id v62;
  void *v63;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("homeUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v55 = v6;
  if (v6)
    v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
  else
    v63 = 0;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numWifiAssociations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v54 = v8;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numWifiDisassociations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v53 = v10;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numWifiAPChanges"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v52 = v12;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numGatewayChanges"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v58 = v14;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numReadWrites"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v59 = v16;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numReadErrors"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v62 = v18;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numWriteErrors"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v51 = v20;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("topReadWriteError"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;
  v57 = v22;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("topSessionError"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  v56 = v24;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numSessionErrors"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v26 = v25;
  else
    v26 = 0;
  v61 = v26;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("APOUI"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v28 = v27;
  else
    v28 = 0;
  v50 = v28;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ssid"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v30 = v29;
  else
    v30 = 0;
  v31 = v30;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("gatewayMACAddress"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v33 = v32;
  else
    v33 = 0;
  v34 = v33;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localHourOfDay"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v36 = v35;
  else
    v36 = 0;
  v37 = v36;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("collectionDurationMinutes"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v39 = v38;
  else
    v39 = 0;
  v40 = v39;

  v41 = 0;
  if (!v63)
  {
    v43 = v53;
    v42 = v54;
    v44 = v52;
    v46 = v56;
    v45 = v57;
    v47 = v50;
    goto LABEL_70;
  }
  v42 = v54;
  if (!v54)
  {
    v44 = v52;
    v43 = v53;
LABEL_67:
    v45 = v57;
    goto LABEL_68;
  }
  v44 = v52;
  v43 = v53;
  if (!v53 || !v52 || !v58 || !v59 || !v62)
    goto LABEL_67;
  v45 = v57;
  if (!v57)
  {
LABEL_68:
    v46 = v56;
LABEL_69:
    v47 = v50;
    goto LABEL_70;
  }
  v46 = v56;
  if (!v56 || !v61)
    goto LABEL_69;
  if (v50)
  {
    v47 = v50;
    v46 = v56;
    v45 = v57;
    v43 = v53;
    v42 = v54;
    v44 = v52;
    v41 = objc_retain(-[HMDNetworkStabilityLogEvent initWithHomeUUID:numWifiAssociations:wifiDisassociations:apChanges:gatewayChanges:numReadWrites:numReadErrors:numWriteErrors:topReadWriteError:topSessionError:numSessionErrors:apOUI:ssid:gatewayMACAddress:localHourOfDay:collectionDurationMinutes:](self, "initWithHomeUUID:numWifiAssociations:wifiDisassociations:apChanges:gatewayChanges:numReadWrites:numReadErrors:numWriteErrors:topReadWriteError:topSessionError:numSessionErrors:apOUI:ssid:gatewayMACAddress:localHourOfDay:collectionDurationMinutes:", v63, objc_msgSend(v54, "unsignedIntegerValue"), objc_msgSend(v53, "unsignedIntegerValue"), objc_msgSend(v52, "unsignedIntegerValue"), objc_msgSend(v58, "unsignedIntegerValue"), objc_msgSend(v59, "unsignedIntegerValue"), objc_msgSend(v62, "unsignedIntegerValue"), objc_msgSend(v51, "unsignedIntegerValue"), v57, v56, objc_msgSend(v61, "unsignedIntegerValue"), v50, v31, v34,
              objc_msgSend(v37, "integerValue"),
              objc_msgSend(v40, "unsignedIntegerValue")));
    self = v41;
  }
  else
  {
    v47 = 0;
    v46 = v56;
    v45 = v57;
  }
LABEL_70:
  v49 = v41;

  return v49;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.network.stability");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[13];
  _QWORD v19[15];

  v19[13] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("numWifiAssociations");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numWifiAssociations](self, "numWifiAssociations"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v17;
  v18[1] = CFSTR("numWifiDisassociations");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numWifiDisassociations](self, "numWifiDisassociations"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v16;
  v18[2] = CFSTR("numWifiAPChanges");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numAPChanges](self, "numAPChanges"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v15;
  v18[3] = CFSTR("numGatewayChanges");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numGatewayChanges](self, "numGatewayChanges"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v14;
  v18[4] = CFSTR("numReadWrites");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numReadWrites](self, "numReadWrites"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v3;
  v18[5] = CFSTR("numReadErrors");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numReadErrors](self, "numReadErrors"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v4;
  v18[6] = CFSTR("numWriteErrors");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numWriteErrors](self, "numWriteErrors"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v5;
  v18[7] = CFSTR("topReadWriteError");
  -[HMDNetworkStabilityLogEvent topReadWriteError](self, "topReadWriteError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v6;
  v18[8] = CFSTR("topSessionError");
  -[HMDNetworkStabilityLogEvent topSessionError](self, "topSessionError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v7;
  v18[9] = CFSTR("numSessionErrors");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numSessionErrors](self, "numSessionErrors"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v8;
  v18[10] = CFSTR("APOUI");
  -[HMDNetworkStabilityLogEvent apOUI](self, "apOUI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[10] = v9;
  v18[11] = CFSTR("localHourOfDay");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDNetworkStabilityLogEvent localHourOfDay](self, "localHourOfDay"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[11] = v10;
  v18[12] = CFSTR("collectionDurationMinutes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent collectionDurationMinutes](self, "collectionDurationMinutes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[12] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (id)serializedLogEvent
{
  void *v3;
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
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMHomeLogEvent homeUUIDString](self, "homeUUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("homeUUID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numWifiAssociations](self, "numWifiAssociations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("numWifiAssociations"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numWifiDisassociations](self, "numWifiDisassociations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("numWifiDisassociations"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numAPChanges](self, "numAPChanges"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("numWifiAPChanges"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numGatewayChanges](self, "numGatewayChanges"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("numGatewayChanges"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numReadWrites](self, "numReadWrites"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("numReadWrites"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numReadErrors](self, "numReadErrors"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("numReadErrors"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numWriteErrors](self, "numWriteErrors"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("numWriteErrors"));

  -[HMDNetworkStabilityLogEvent topReadWriteError](self, "topReadWriteError");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("topReadWriteError"));

  -[HMDNetworkStabilityLogEvent topSessionError](self, "topSessionError");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("topSessionError"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent numSessionErrors](self, "numSessionErrors"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("numSessionErrors"));

  -[HMDNetworkStabilityLogEvent apOUI](self, "apOUI");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("APOUI"));

  -[HMDNetworkStabilityLogEvent ssid](self, "ssid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("ssid"));

  -[HMDNetworkStabilityLogEvent gatewayMACAddress](self, "gatewayMACAddress");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("gatewayMACAddress"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDNetworkStabilityLogEvent localHourOfDay](self, "localHourOfDay"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("localHourOfDay"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDNetworkStabilityLogEvent collectionDurationMinutes](self, "collectionDurationMinutes"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("collectionDurationMinutes"));

  v20 = (void *)objc_msgSend(v3, "copy");
  return v20;
}

- (unint64_t)numWifiAssociations
{
  return self->_numWifiAssociations;
}

- (unint64_t)numWifiDisassociations
{
  return self->_numWifiDisassociations;
}

- (unint64_t)numAPChanges
{
  return self->_numAPChanges;
}

- (unint64_t)numGatewayChanges
{
  return self->_numGatewayChanges;
}

- (unint64_t)numReadWrites
{
  return self->_numReadWrites;
}

- (unint64_t)numReadErrors
{
  return self->_numReadErrors;
}

- (unint64_t)numWriteErrors
{
  return self->_numWriteErrors;
}

- (unint64_t)numSessionErrors
{
  return self->_numSessionErrors;
}

- (NSString)topReadWriteError
{
  return self->_topReadWriteError;
}

- (NSString)topSessionError
{
  return self->_topSessionError;
}

- (NSString)apOUI
{
  return self->_apOUI;
}

- (int64_t)localHourOfDay
{
  return self->_localHourOfDay;
}

- (unint64_t)collectionDurationMinutes
{
  return self->_collectionDurationMinutes;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (NSString)gatewayMACAddress
{
  return self->_gatewayMACAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatewayMACAddress, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_apOUI, 0);
  objc_storeStrong((id *)&self->_topSessionError, 0);
  objc_storeStrong((id *)&self->_topReadWriteError, 0);
}

@end
