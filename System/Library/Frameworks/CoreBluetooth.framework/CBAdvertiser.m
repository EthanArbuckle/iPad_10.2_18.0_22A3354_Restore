@implementation CBAdvertiser

- (unsigned)nearbyInfoV2Flags
{
  return self->_nearbyInfoV2Flags;
}

- (unsigned)nearbyInfoV2DecryptedFlags
{
  return self->_nearbyInfoV2DecryptedFlags;
}

- (unsigned)airplaySourceFlags
{
  return self->_airplaySourceFlags;
}

- (BOOL)needsIdentify
{
  return (self->_nearbyInfoV2Flags & 4) != 0 || (self->_nearbyInfoV2DecryptedFlags & 7) != 0;
}

- (CBAdvertiser)init
{
  CBAdvertiser *v2;
  CBAdvertiser *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CBAdvertiser;
  v2 = -[CBAdvertiser init](&v5, sel_init);
  if (v2)
  {
    v2->_clientID = CBXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v2->_ucat = (LogCategory *)&gLogCategory_CBAdvertiser;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  NSString *v3;
  NSString *v4;
  LogCategory *ucat;
  objc_super v6;

  v3 = self->_mockID;
  v4 = v3;
  if (v3)
    CBMockRemoveAdvertiser(v3, self);
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CBAdvertiser;
  -[CBAdvertiser dealloc](&v6, sel_dealloc);
}

- (CBAdvertiser)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  CBAdvertiser *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  NSData *v49;
  NSData *v50;
  int v51;
  int v52;
  int v53;
  CBAdvertiser *v54;

  v6 = a3;
  v7 = -[CBAdvertiser init](self, "init");

  if (!v7)
  {
    if (!a4)
      goto LABEL_165;
LABEL_161:
    NSErrorF();
    v54 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_157;
  }
  if (MEMORY[0x1A85D2194](v6) != MEMORY[0x1E0C812F8])
  {
    if (!a4)
      goto LABEL_165;
    goto LABEL_161;
  }
  v8 = CUXPCDecodeSInt64RangedEx();
  if (v8 == 6)
  {
    v7->_advertiseRate = 0;
  }
  else if (v8 == 5)
  {
    goto LABEL_165;
  }
  v9 = CUXPCDecodeUInt64RangedEx();
  if (v9 == 6)
  {
    v7->_clientID = 0;
  }
  else if (v9 == 5)
  {
    goto LABEL_165;
  }
  v10 = CUXPCDecodeUInt64RangedEx();
  if (v10 == 6)
  {
    v7->_internalFlags = 0;
  }
  else if (v10 == 5)
  {
    goto LABEL_165;
  }
  objc_opt_class();
  if (!CUXPCDecodeObject())
    goto LABEL_165;
  v11 = CUXPCDecodeUInt64RangedEx();
  if (v11 == 6)
  {
    v7->_useCase = 0;
  }
  else if (v11 == 5)
  {
    goto LABEL_165;
  }
  if (!CUXPCDecodeNSArrayOfNSString())
    goto LABEL_165;
  v12 = CUXPCDecodeUInt64RangedEx();
  if (v12 == 6)
  {
    v7->_airdropFlags = 0;
  }
  else if (v12 == 5)
  {
    goto LABEL_165;
  }
  if (!CUXPCDecodeNSData())
    goto LABEL_165;
  v13 = CUXPCDecodeUInt64RangedEx();
  if (v13 == 6)
  {
    v7->_airdropModel = 0;
  }
  else if (v13 == 5)
  {
    goto LABEL_165;
  }
  v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v7->_airdropVersion = 0;
  }
  else if (v14 == 5)
  {
    goto LABEL_165;
  }
  v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v7->_airdropHash1 = 0;
  }
  else if (v15 == 5)
  {
    goto LABEL_165;
  }
  v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v7->_airdropHash2 = 0;
  }
  else if (v16 == 5)
  {
    goto LABEL_165;
  }
  v17 = CUXPCDecodeUInt64RangedEx();
  if (v17 == 6)
  {
    v7->_airdropHash3 = 0;
  }
  else if (v17 == 5)
  {
    goto LABEL_165;
  }
  v18 = CUXPCDecodeUInt64RangedEx();
  if (v18 == 6)
  {
    v7->_airdropHash4 = 0;
  }
  else if (v18 == 5)
  {
    goto LABEL_165;
  }
  v19 = CUXPCDecodeUInt64RangedEx();
  if (v19 == 6)
  {
    v7->_airdropConfigData = 0;
  }
  else if (v19 == 5)
  {
    goto LABEL_165;
  }
  if (!CUXPCDecodeNSData())
    goto LABEL_165;
  v20 = CUXPCDecodeUInt64RangedEx();
  if (v20 == 6)
  {
    v7->_airplaySourceFlags = 0;
  }
  else if (v20 == 5)
  {
    goto LABEL_165;
  }
  if (!CUXPCDecodeNSData())
    goto LABEL_165;
  v21 = CUXPCDecodeUInt64RangedEx();
  if (v21 == 6)
  {
    v7->_airplayTargetConfigSeed = 0;
  }
  else if (v21 == 5)
  {
    goto LABEL_165;
  }
  v22 = CUXPCDecodeUInt64RangedEx();
  if (v22 == 6)
  {
    v7->_airplayTargetFlags = 0;
  }
  else if (v22 == 5)
  {
    goto LABEL_165;
  }
  v23 = CUXPCDecodeUInt64RangedEx();
  if (v23 == 6)
  {
    v7->_airplayTargetIPv4 = 0;
  }
  else if (v23 == 5)
  {
    goto LABEL_165;
  }
  v24 = CUXPCDecodeUInt64RangedEx();
  if (v24 == 6)
  {
    v7->_airplayTargetPort = 0;
  }
  else if (v24 == 5)
  {
    goto LABEL_165;
  }
  v25 = CUXPCDecodeUInt64RangedEx();
  if (v25 == 6)
  {
    v7->_dsActionFlags = 0;
  }
  else if (v25 == 5)
  {
    goto LABEL_165;
  }
  v26 = CUXPCDecodeSInt64RangedEx();
  if (v26 == 6)
  {
    v7->_dsActionMeasuredPower = 0;
  }
  else if (v26 == 5)
  {
    goto LABEL_165;
  }
  v27 = CUXPCDecodeUInt64RangedEx();
  if (v27 == 6)
  {
    v7->_dsActionTieBreaker = 0;
  }
  else if (v27 == 5)
  {
    goto LABEL_165;
  }
  v28 = CUXPCDecodeUInt64RangedEx();
  if (v28 == 6)
  {
    v7->_dsInfoVehicleConfidence = 0;
  }
  else if (v28 == 5)
  {
    goto LABEL_165;
  }
  v29 = CUXPCDecodeUInt64RangedEx();
  if (v29 == 6)
  {
    v7->_dsInfoVehicleState = 0;
  }
  else if (v29 == 5)
  {
    goto LABEL_165;
  }
  if (!CUXPCDecodeBool() || !CUXPCDecodeNSData())
    goto LABEL_165;
  v30 = CUXPCDecodeUInt64RangedEx();
  if (v30 == 6)
  {
    v7->_heySiriConfidence = 0;
  }
  else if (v30 == 5)
  {
    goto LABEL_165;
  }
  v31 = CUXPCDecodeUInt64RangedEx();
  if (v31 == 6)
  {
    v7->_heySiriDeviceClass = 0;
  }
  else if (v31 == 5)
  {
    goto LABEL_165;
  }
  v32 = CUXPCDecodeUInt64RangedEx();
  if (v32 == 6)
  {
    v7->_heySiriPerceptualHash = 0;
  }
  else if (v32 == 5)
  {
    goto LABEL_165;
  }
  v33 = CUXPCDecodeUInt64RangedEx();
  if (v33 == 6)
  {
    v7->_heySiriProductType = 0;
  }
  else if (v33 == 5)
  {
    goto LABEL_165;
  }
  v34 = CUXPCDecodeUInt64RangedEx();
  if (v34 == 6)
  {
    v7->_heySiriRandom = 0;
  }
  else if (v34 == 5)
  {
    goto LABEL_165;
  }
  v35 = CUXPCDecodeUInt64RangedEx();
  if (v35 == 6)
  {
    v7->_heySiriSNR = 0;
  }
  else if (v35 == 5)
  {
    goto LABEL_165;
  }
  if (!CUXPCDecodeNSDataOfLength())
    goto LABEL_165;
  v36 = CUXPCDecodeUInt64RangedEx();
  if (v36 == 6)
  {
    v7->_nearbyActionColorCode = 0;
  }
  else if (v36 == 5)
  {
    goto LABEL_165;
  }
  v37 = CUXPCDecodeUInt64RangedEx();
  if (v37 == 6)
  {
    v7->_nearbyActionFlags = 0;
  }
  else if (v37 == 5)
  {
    goto LABEL_165;
  }
  v38 = CUXPCDecodeUInt64RangedEx();
  if (v38 == 6)
  {
    v7->_nearbyActionType = 0;
  }
  else if (v38 == 5)
  {
    goto LABEL_165;
  }
  if (!CUXPCDecodeNSDataOfLength())
    goto LABEL_165;
  v39 = CUXPCDecodeUInt64RangedEx();
  if (v39 == 6)
  {
    v7->_nearbyActionV2Flags = 0;
  }
  else if (v39 == 5)
  {
    goto LABEL_165;
  }
  if (!CUXPCDecodeNSDataOfLength())
    goto LABEL_165;
  v40 = CUXPCDecodeUInt64RangedEx();
  if (v40 == 6)
  {
    v7->_nearbyActionV2Type = 0;
  }
  else if (v40 == 5)
  {
    goto LABEL_165;
  }
  v41 = CUXPCDecodeUInt64RangedEx();
  if (v41 == 6)
  {
    v7->_nearbyInfoFlags = 0;
  }
  else if (v41 == 5)
  {
    goto LABEL_165;
  }
  if (!CUXPCDecodeDouble())
    goto LABEL_165;
  v42 = CUXPCDecodeUInt64RangedEx();
  if (v42 == 6)
  {
    v7->_nearbyInfoStatusTime = 0;
  }
  else if (v42 == 5)
  {
    goto LABEL_165;
  }
  v43 = CUXPCDecodeUInt64RangedEx();
  if (v43 == 6)
  {
    v7->_nearbyInfoStatusType = 0;
  }
  else if (v43 == 5)
  {
    goto LABEL_165;
  }
  v44 = CUXPCDecodeUInt64RangedEx();
  if (v44 == 6)
  {
    v7->_nearbyInfoV2DecryptedFlags = 0;
  }
  else if (v44 == 5)
  {
    goto LABEL_165;
  }
  v45 = CUXPCDecodeUInt64RangedEx();
  if (v45 == 6)
  {
    v7->_nearbyInfoV2Flags = 0;
  }
  else if (v45 == 5)
  {
    goto LABEL_165;
  }
  if (!CUXPCDecodeNSData() || !CUXPCDecodeNSData())
    goto LABEL_165;
  v46 = CUXPCDecodeUInt64RangedEx();
  if (v46 == 6)
  {
    v7->_nearbyInfoV2InvitationCounter = 0;
  }
  else if (v46 == 5)
  {
    goto LABEL_165;
  }
  v47 = CUXPCDecodeUInt64RangedEx();
  if (v47 == 6)
  {
    v7->_nearbyInfoV2InvitationTypes = 0;
  }
  else if (v47 == 5)
  {
    goto LABEL_165;
  }
  v48 = CUXPCDecodeUInt64RangedEx();
  if (v48 == 6)
  {
    v7->_nearbyInfoV2InvitationRouteType = 0;
  }
  else if (v48 == 5)
  {
    goto LABEL_165;
  }
  if (!CUXPCDecodeNSData())
    goto LABEL_165;
  v49 = v7->_safetyAlertsAlertData;
  v50 = v49;
  if (v49 && -[NSData length](v49, "length") >= 0x1D)
  {
    if (a4)
    {
      NSErrorF();
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_165;
  }

  if (!CUXPCDecodeNSDataOfLength() || !CUXPCDecodeNSDataOfLength())
  {
LABEL_165:
    v54 = 0;
    goto LABEL_157;
  }
  v51 = CUXPCDecodeUInt64RangedEx();
  if (v51 == 6)
  {
    v7->_safetyAlertsVersion = 0;
  }
  else if (v51 == 5)
  {
    goto LABEL_165;
  }
  if (!CUXPCDecodeNSData())
    goto LABEL_165;
  v52 = CUXPCDecodeUInt64RangedEx();
  if (v52 == 6)
  {
    v7->_nearbyActionNoWakeType = 0;
  }
  else if (v52 == 5)
  {
    goto LABEL_165;
  }
  v53 = CUXPCDecodeUInt64RangedEx();
  if (v53 != 6)
  {
    if (v53 != 5)
      goto LABEL_154;
    goto LABEL_165;
  }
  v7->_nearbyActionNWPrecisionFindingStatus = 0;
LABEL_154:
  if (!CUXPCDecodeNSDataOfLength() || !CUXPCDecodeNSDataOfLength())
    goto LABEL_165;
  v54 = v7;
LABEL_157:

  return v54;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  int64_t advertiseRate;
  uint64_t clientID;
  uint64_t internalFlags;
  uint64_t useCase;
  NSData *airdropTempAuthTagData;
  NSData *v10;
  id v11;
  uint64_t v12;
  const char *v13;
  size_t v14;
  NSData *airplaySourceAuthTagData;
  NSData *v16;
  id v17;
  uint64_t v18;
  const char *v19;
  size_t v20;
  NSData *airplaySourceUWBConfigData;
  NSData *v22;
  id v23;
  uint64_t v24;
  const char *v25;
  size_t v26;
  uint64_t airplayTargetIPv4;
  NSData *fidoPayloadData;
  NSData *v29;
  id v30;
  uint64_t v31;
  const char *v32;
  size_t v33;
  NSData *nearbyActionAuthTagData;
  NSData *v35;
  id v36;
  uint64_t v37;
  const char *v38;
  size_t v39;
  uint64_t nearbyActionFlags;
  NSData *nearbyActionTargetData;
  NSData *v42;
  id v43;
  uint64_t v44;
  const char *v45;
  size_t v46;
  uint64_t nearbyActionV2Flags;
  NSData *nearbyActionV2TargetData;
  NSData *v49;
  id v50;
  uint64_t v51;
  const char *v52;
  size_t v53;
  uint64_t nearbyInfoFlags;
  double nearbyInfoStatusProgress;
  NSData *nearbyInfoV2AuthTagData;
  NSData *v57;
  id v58;
  uint64_t v59;
  const char *v60;
  size_t v61;
  NSData *nearbyInfoV2AuthIntegrityTagData;
  NSData *v63;
  id v64;
  uint64_t v65;
  const char *v66;
  size_t v67;
  NSData *safetyAlertsAlertData;
  NSData *v69;
  id v70;
  uint64_t v71;
  const char *v72;
  size_t v73;
  NSData *safetyAlertsAlertID;
  NSData *v75;
  id v76;
  uint64_t v77;
  const char *v78;
  size_t v79;
  NSData *safetyAlertsSignature;
  NSData *v81;
  id v82;
  uint64_t v83;
  const char *v84;
  size_t v85;
  NSData *watchSetupData;
  NSData *v87;
  id v88;
  uint64_t v89;
  const char *v90;
  size_t v91;
  NSData *nearbyActionNoWakeAuthTagData;
  NSData *v93;
  id v94;
  uint64_t v95;
  const char *v96;
  size_t v97;
  NSData *nearbyActionNoWakeConfigData;
  NSData *v99;
  id v100;
  uint64_t v101;
  const char *v102;
  size_t v103;
  xpc_object_t xdict;

  v4 = a3;
  advertiseRate = self->_advertiseRate;
  xdict = v4;
  if ((_DWORD)advertiseRate)
    xpc_dictionary_set_int64(v4, "advR", advertiseRate);
  clientID = self->_clientID;
  if ((_DWORD)clientID)
    xpc_dictionary_set_uint64(xdict, "cid", clientID);
  internalFlags = self->_internalFlags;
  if ((_DWORD)internalFlags)
    xpc_dictionary_set_uint64(xdict, "intF", internalFlags);
  CUXPCEncodeObject();
  useCase = self->_useCase;
  if ((_DWORD)useCase)
    xpc_dictionary_set_uint64(xdict, "ucas", useCase);
  CUXPCEncodeNSArrayOfNSString();
  if (self->_airdropFlags)
    xpc_dictionary_set_uint64(xdict, "adFl", self->_airdropFlags);
  airdropTempAuthTagData = self->_airdropTempAuthTagData;
  if (airdropTempAuthTagData)
  {
    v10 = objc_retainAutorelease(airdropTempAuthTagData);
    v11 = xdict;
    v12 = -[NSData bytes](v10, "bytes");
    if (v12)
      v13 = (const char *)v12;
    else
      v13 = "";
    v14 = -[NSData length](v10, "length");

    xpc_dictionary_set_data(v11, "adTa", v13, v14);
  }
  if (self->_airdropModel)
    xpc_dictionary_set_uint64(xdict, "adMl", self->_airdropModel);
  if (self->_airdropVersion)
    xpc_dictionary_set_uint64(xdict, "adVs", self->_airdropVersion);
  if (self->_airdropHash1)
    xpc_dictionary_set_uint64(xdict, "adH1", self->_airdropHash1);
  if (self->_airdropHash2)
    xpc_dictionary_set_uint64(xdict, "adH2", self->_airdropHash2);
  if (self->_airdropHash3)
    xpc_dictionary_set_uint64(xdict, "adH3", self->_airdropHash3);
  if (self->_airdropHash4)
    xpc_dictionary_set_uint64(xdict, "adH4", self->_airdropHash4);
  if (self->_airdropConfigData)
    xpc_dictionary_set_uint64(xdict, "adCd", self->_airdropConfigData);
  airplaySourceAuthTagData = self->_airplaySourceAuthTagData;
  if (airplaySourceAuthTagData)
  {
    v16 = objc_retainAutorelease(airplaySourceAuthTagData);
    v17 = xdict;
    v18 = -[NSData bytes](v16, "bytes");
    if (v18)
      v19 = (const char *)v18;
    else
      v19 = "";
    v20 = -[NSData length](v16, "length");

    xpc_dictionary_set_data(v17, "apAT", v19, v20);
  }
  if (self->_airplaySourceFlags)
    xpc_dictionary_set_uint64(xdict, "apSF", self->_airplaySourceFlags);
  airplaySourceUWBConfigData = self->_airplaySourceUWBConfigData;
  if (airplaySourceUWBConfigData)
  {
    v22 = objc_retainAutorelease(airplaySourceUWBConfigData);
    v23 = xdict;
    v24 = -[NSData bytes](v22, "bytes");
    if (v24)
      v25 = (const char *)v24;
    else
      v25 = "";
    v26 = -[NSData length](v22, "length");

    xpc_dictionary_set_data(v23, "apUW", v25, v26);
  }
  if (self->_airplayTargetConfigSeed)
    xpc_dictionary_set_uint64(xdict, "apTC", self->_airplayTargetConfigSeed);
  if (self->_airplayTargetFlags)
    xpc_dictionary_set_uint64(xdict, "apTF", self->_airplayTargetFlags);
  airplayTargetIPv4 = self->_airplayTargetIPv4;
  if ((_DWORD)airplayTargetIPv4)
    xpc_dictionary_set_uint64(xdict, "apTI", airplayTargetIPv4);
  if (self->_airplayTargetPort)
    xpc_dictionary_set_uint64(xdict, "apTP", self->_airplayTargetPort);
  if (self->_dsActionFlags)
    xpc_dictionary_set_uint64(xdict, "dsAF", self->_dsActionFlags);
  if (self->_dsActionMeasuredPower)
    xpc_dictionary_set_int64(xdict, "dsAP", self->_dsActionMeasuredPower);
  if (self->_dsActionTieBreaker)
    xpc_dictionary_set_uint64(xdict, "dsAT", self->_dsActionTieBreaker);
  if (self->_dsInfoVehicleConfidence)
    xpc_dictionary_set_uint64(xdict, "dsVC", self->_dsInfoVehicleConfidence);
  if (self->_dsInfoVehicleState)
    xpc_dictionary_set_uint64(xdict, "dsVS", self->_dsInfoVehicleState);
  if (self->_enableEPAForLEAdvertisement)
    xpc_dictionary_set_BOOL(xdict, "naEE", 1);
  fidoPayloadData = self->_fidoPayloadData;
  if (fidoPayloadData)
  {
    v29 = objc_retainAutorelease(fidoPayloadData);
    v30 = xdict;
    v31 = -[NSData bytes](v29, "bytes");
    if (v31)
      v32 = (const char *)v31;
    else
      v32 = "";
    v33 = -[NSData length](v29, "length");

    xpc_dictionary_set_data(v30, "fdPD", v32, v33);
  }
  if (self->_heySiriConfidence)
    xpc_dictionary_set_uint64(xdict, "hsCf", self->_heySiriConfidence);
  if (self->_heySiriDeviceClass)
    xpc_dictionary_set_uint64(xdict, "hsDC", self->_heySiriDeviceClass);
  if (self->_heySiriPerceptualHash)
    xpc_dictionary_set_uint64(xdict, "hsPH", self->_heySiriPerceptualHash);
  if (self->_heySiriProductType)
    xpc_dictionary_set_uint64(xdict, "hsPT", self->_heySiriProductType);
  if (self->_heySiriRandom)
    xpc_dictionary_set_uint64(xdict, "hsRn", self->_heySiriRandom);
  if (self->_heySiriSNR)
    xpc_dictionary_set_uint64(xdict, "hsSN", self->_heySiriSNR);
  nearbyActionAuthTagData = self->_nearbyActionAuthTagData;
  if (nearbyActionAuthTagData)
  {
    v35 = objc_retainAutorelease(nearbyActionAuthTagData);
    v36 = xdict;
    v37 = -[NSData bytes](v35, "bytes");
    if (v37)
      v38 = (const char *)v37;
    else
      v38 = "";
    v39 = -[NSData length](v35, "length");

    xpc_dictionary_set_data(v36, "nbAT", v38, v39);
  }
  if (self->_nearbyActionColorCode)
    xpc_dictionary_set_uint64(xdict, "naCC", self->_nearbyActionColorCode);
  nearbyActionFlags = self->_nearbyActionFlags;
  if ((_DWORD)nearbyActionFlags)
    xpc_dictionary_set_uint64(xdict, "nbAF", nearbyActionFlags);
  nearbyActionTargetData = self->_nearbyActionTargetData;
  if (nearbyActionTargetData)
  {
    v42 = objc_retainAutorelease(nearbyActionTargetData);
    v43 = xdict;
    v44 = -[NSData bytes](v42, "bytes");
    if (v44)
      v45 = (const char *)v44;
    else
      v45 = "";
    v46 = -[NSData length](v42, "length");

    xpc_dictionary_set_data(v43, "nbTg", v45, v46);
  }
  if (self->_nearbyActionType)
    xpc_dictionary_set_uint64(xdict, "nbAc", self->_nearbyActionType);
  nearbyActionV2Flags = self->_nearbyActionV2Flags;
  if ((_DWORD)nearbyActionV2Flags)
    xpc_dictionary_set_uint64(xdict, "n2AF", nearbyActionV2Flags);
  nearbyActionV2TargetData = self->_nearbyActionV2TargetData;
  if (nearbyActionV2TargetData)
  {
    v49 = objc_retainAutorelease(nearbyActionV2TargetData);
    v50 = xdict;
    v51 = -[NSData bytes](v49, "bytes");
    if (v51)
      v52 = (const char *)v51;
    else
      v52 = "";
    v53 = -[NSData length](v49, "length");

    xpc_dictionary_set_data(v50, "n2Tg", v52, v53);
  }
  if (self->_nearbyActionV2Type)
    xpc_dictionary_set_uint64(xdict, "n2Ac", self->_nearbyActionV2Type);
  nearbyInfoFlags = self->_nearbyInfoFlags;
  if ((_DWORD)nearbyInfoFlags)
    xpc_dictionary_set_uint64(xdict, "nbIF", nearbyInfoFlags);
  nearbyInfoStatusProgress = self->_nearbyInfoStatusProgress;
  if (nearbyInfoStatusProgress != 0.0)
    xpc_dictionary_set_double(xdict, "nsPr", nearbyInfoStatusProgress);
  if (self->_nearbyInfoStatusTime)
    xpc_dictionary_set_uint64(xdict, "nsTi", self->_nearbyInfoStatusTime);
  if (self->_nearbyInfoStatusType)
    xpc_dictionary_set_uint64(xdict, "nsTy", self->_nearbyInfoStatusType);
  if (self->_nearbyInfoV2DecryptedFlags)
    xpc_dictionary_set_uint64(xdict, "nb2Fe", self->_nearbyInfoV2DecryptedFlags);
  if (self->_nearbyInfoV2Flags)
    xpc_dictionary_set_uint64(xdict, "nb2F", self->_nearbyInfoV2Flags);
  nearbyInfoV2AuthTagData = self->_nearbyInfoV2AuthTagData;
  if (nearbyInfoV2AuthTagData)
  {
    v57 = objc_retainAutorelease(nearbyInfoV2AuthTagData);
    v58 = xdict;
    v59 = -[NSData bytes](v57, "bytes");
    if (v59)
      v60 = (const char *)v59;
    else
      v60 = "";
    v61 = -[NSData length](v57, "length");

    xpc_dictionary_set_data(v58, "nb2A", v60, v61);
  }
  nearbyInfoV2AuthIntegrityTagData = self->_nearbyInfoV2AuthIntegrityTagData;
  if (nearbyInfoV2AuthIntegrityTagData)
  {
    v63 = objc_retainAutorelease(nearbyInfoV2AuthIntegrityTagData);
    v64 = xdict;
    v65 = -[NSData bytes](v63, "bytes");
    if (v65)
      v66 = (const char *)v65;
    else
      v66 = "";
    v67 = -[NSData length](v63, "length");

    xpc_dictionary_set_data(v64, "nb2Ai", v66, v67);
  }
  if (self->_nearbyInfoV2InvitationCounter)
    xpc_dictionary_set_uint64(xdict, "nb2Ic", self->_nearbyInfoV2InvitationCounter);
  if (self->_nearbyInfoV2InvitationTypes)
    xpc_dictionary_set_uint64(xdict, "nb2It", self->_nearbyInfoV2InvitationTypes);
  if (self->_nearbyInfoV2InvitationRouteType)
    xpc_dictionary_set_uint64(xdict, "nb2Ir", self->_nearbyInfoV2InvitationRouteType);
  safetyAlertsAlertData = self->_safetyAlertsAlertData;
  if (safetyAlertsAlertData)
  {
    v69 = objc_retainAutorelease(safetyAlertsAlertData);
    v70 = xdict;
    v71 = -[NSData bytes](v69, "bytes");
    if (v71)
      v72 = (const char *)v71;
    else
      v72 = "";
    v73 = -[NSData length](v69, "length");

    xpc_dictionary_set_data(v70, "saAd", v72, v73);
  }
  safetyAlertsAlertID = self->_safetyAlertsAlertID;
  if (safetyAlertsAlertID)
  {
    v75 = objc_retainAutorelease(safetyAlertsAlertID);
    v76 = xdict;
    v77 = -[NSData bytes](v75, "bytes");
    if (v77)
      v78 = (const char *)v77;
    else
      v78 = "";
    v79 = -[NSData length](v75, "length");

    xpc_dictionary_set_data(v76, "saAi", v78, v79);
  }
  safetyAlertsSignature = self->_safetyAlertsSignature;
  if (safetyAlertsSignature)
  {
    v81 = objc_retainAutorelease(safetyAlertsSignature);
    v82 = xdict;
    v83 = -[NSData bytes](v81, "bytes");
    if (v83)
      v84 = (const char *)v83;
    else
      v84 = "";
    v85 = -[NSData length](v81, "length");

    xpc_dictionary_set_data(v82, "saSg", v84, v85);
  }
  if (self->_safetyAlertsVersion)
    xpc_dictionary_set_uint64(xdict, "saVs", self->_safetyAlertsVersion);
  watchSetupData = self->_watchSetupData;
  if (watchSetupData)
  {
    v87 = objc_retainAutorelease(watchSetupData);
    v88 = xdict;
    v89 = -[NSData bytes](v87, "bytes");
    if (v89)
      v90 = (const char *)v89;
    else
      v90 = "";
    v91 = -[NSData length](v87, "length");

    xpc_dictionary_set_data(v88, "wsDa", v90, v91);
  }
  if (self->_nearbyActionNoWakeType)
    xpc_dictionary_set_uint64(xdict, "nawT", self->_nearbyActionNoWakeType);
  if (self->_nearbyActionNWPrecisionFindingStatus)
    xpc_dictionary_set_uint64(xdict, "nawS", self->_nearbyActionNWPrecisionFindingStatus);
  nearbyActionNoWakeAuthTagData = self->_nearbyActionNoWakeAuthTagData;
  if (nearbyActionNoWakeAuthTagData)
  {
    v93 = objc_retainAutorelease(nearbyActionNoWakeAuthTagData);
    v94 = xdict;
    v95 = -[NSData bytes](v93, "bytes");
    if (v95)
      v96 = (const char *)v95;
    else
      v96 = "";
    v97 = -[NSData length](v93, "length");

    xpc_dictionary_set_data(v94, "nawA", v96, v97);
  }
  nearbyActionNoWakeConfigData = self->_nearbyActionNoWakeConfigData;
  if (nearbyActionNoWakeConfigData)
  {
    v99 = objc_retainAutorelease(nearbyActionNoWakeConfigData);
    v100 = xdict;
    v101 = -[NSData bytes](v99, "bytes");
    if (v101)
      v102 = (const char *)v101;
    else
      v102 = "";
    v103 = -[NSData length](v99, "length");

    xpc_dictionary_set_data(v100, "nawC", v102, v103);
  }

}

- (id)description
{
  return -[CBAdvertiser descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  void *v5;
  id v6;
  int advertiseRate;
  int v8;
  const char *v9;
  id v10;
  NSData *v11;
  id v12;
  NSData *v13;
  id v14;
  CBDevice *v15;
  CBDevice *v16;
  id v17;
  unsigned int useCase;
  id v19;
  NSArray *v20;
  id v21;
  id v22;
  NSData *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  NSData *v32;
  id v33;
  id v34;
  NSData *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  NSData *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  NSData *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  NSData *v60;
  id v61;
  id v62;
  NSData *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  NSData *v72;
  id v73;
  NSData *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  NSData *v80;
  id v81;
  NSData *v82;
  id v83;
  NSData *v84;
  id v85;
  id v86;
  NSData *v87;
  id v88;
  id v89;
  NSData *v90;
  id v91;
  NSData *v92;
  id v93;
  id v94;
  uint64_t clientID;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;

  clientID = self->_clientID;
  NSAppendPrintF_safe();
  v4 = 0;
  v5 = v4;
  if (self->_direct)
  {
    v116 = v4;
    NSAppendPrintF_safe();
    v6 = v116;

    v5 = v6;
  }
  advertiseRate = self->_advertiseRate;
  if (advertiseRate)
  {
    v8 = advertiseRate - 10;
    v9 = "2 seconds";
    switch(v8)
    {
      case 0:
        break;
      case 5:
        v9 = "1022.5 ms";
        break;
      case 10:
        v9 = "350 ms";
        break;
      case 30:
        v9 = "181.25 ms";
        break;
      case 32:
        v9 = "120 ms";
        break;
      case 35:
        v9 = "60 ms";
        break;
      case 40:
        v9 = "30 ms";
        break;
      case 50:
        v9 = "20 ms";
        break;
      default:
        v9 = "270 ms";
        break;
    }
    clientID = (uint64_t)v9;
    NSAppendPrintF_safe();
    v10 = v5;

    v5 = v10;
  }
  v11 = self->_advertisingAddressDataConnectable;
  if (v11)
  {
    CUPrintNSDataAddress();
    clientID = objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v12 = v5;

    v5 = v12;
  }

  v13 = self->_advertisingAddressDataNonConnectable;
  if (v13)
  {
    CUPrintNSDataAddress();
    clientID = objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v14 = v5;

    v5 = v14;
  }

  v15 = self->_remoteDevice;
  v16 = v15;
  if (v15)
  {
    clientID = (uint64_t)v15;
    NSAppendPrintF_safe();
    v17 = v5;

    v5 = v17;
  }

  useCase = self->_useCase;
  if (useCase)
  {
    clientID = (uint64_t)CBUseCaseToString(useCase);
    NSAppendPrintF_safe();
    v19 = v5;

    v5 = v19;
  }
  v20 = self->_useCaseClientIDs;
  if (v20)
  {
    CUPrintNSObjectOneLine();
    clientID = objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v21 = v5;

    v5 = v21;
  }

  if (self->_airdropFlags)
  {
    CUPrintFlags32();
    clientID = objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v22 = v5;

    v5 = v22;
  }
  v23 = self->_airdropTempAuthTagData;
  if (v23)
  {
    CUPrintNSDataHex();
    clientID = objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v24 = v5;

    v5 = v24;
  }

  if (self->_airdropModel)
  {
    clientID = self->_airdropModel;
    NSAppendPrintF_safe();
    v25 = v5;

    v5 = v25;
  }
  if (self->_airdropVersion)
  {
    clientID = self->_airdropVersion;
    NSAppendPrintF_safe();
    v26 = v5;

    v5 = v26;
  }
  if (self->_airdropHash1)
  {
    clientID = self->_airdropHash1;
    NSAppendPrintF_safe();
    v27 = v5;

    v5 = v27;
  }
  if (self->_airdropHash2)
  {
    clientID = self->_airdropHash2;
    NSAppendPrintF_safe();
    v28 = v5;

    v5 = v28;
  }
  if (self->_airdropHash3)
  {
    clientID = self->_airdropHash3;
    NSAppendPrintF_safe();
    v29 = v5;

    v5 = v29;
  }
  if (self->_airdropHash4)
  {
    clientID = self->_airdropHash4;
    NSAppendPrintF_safe();
    v30 = v5;

    v5 = v30;
  }
  if (self->_airdropConfigData)
  {
    CUPrintFlags32();
    clientID = objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v31 = v5;

    v5 = v31;
  }
  v32 = self->_airplaySourceAuthTagData;
  if (v32)
  {
    CUPrintNSDataHex();
    clientID = objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v33 = v5;

    v5 = v33;
  }

  if (self->_airplaySourceFlags)
  {
    CUPrintFlags32();
    clientID = objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v34 = v5;

    v5 = v34;
  }
  v35 = self->_airplaySourceUWBConfigData;
  if (v35)
  {
    CUPrintNSDataHex();
    clientID = objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v36 = v5;

    v5 = v36;
  }

  if (self->_airplayTargetConfigSeed)
  {
    clientID = self->_airplayTargetConfigSeed;
    NSAppendPrintF_safe();
    v37 = v5;

    v5 = v37;
  }
  if (self->_airplayTargetFlags)
  {
    CUPrintFlags32();
    clientID = objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v38 = v5;

    v5 = v38;
  }
  if (self->_airplayTargetIPv4)
  {
    CUPrintAddress();
    clientID = objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v39 = v5;

    v5 = v39;
  }
  if (self->_airplayTargetPort)
  {
    clientID = self->_airplayTargetPort;
    NSAppendPrintF_safe();
    v40 = v5;

    v5 = v40;
  }
  if (self->_dsActionFlags)
  {
    CUPrintFlags32();
    clientID = objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v41 = v5;

    v5 = v41;
  }
  if (self->_dsActionMeasuredPower)
  {
    clientID = self->_dsActionMeasuredPower;
    NSAppendPrintF_safe();
    v42 = v5;

    v5 = v42;
  }
  if (self->_dsActionTieBreaker)
  {
    clientID = self->_dsActionTieBreaker;
    NSAppendPrintF_safe();
    v43 = v5;

    v5 = v43;
  }
  if (self->_dsInfoVehicleConfidence)
  {
    -[CBAdvertiser dsInfoVehicleConfidence](self, "dsInfoVehicleConfidence", clientID);
    NSAppendPrintF_safe();
    v44 = v5;

    v5 = v44;
  }
  if (self->_dsInfoVehicleState)
  {
    -[CBAdvertiser dsInfoVehicleState](self, "dsInfoVehicleState");
    NSAppendPrintF_safe();
    v45 = v5;

    v5 = v45;
  }
  if (self->_enableEPAForLEAdvertisement)
  {
    NSAppendPrintF_safe();
    v46 = v5;

    v5 = v46;
  }
  v47 = self->_fidoPayloadData;
  if (v47)
  {
    CUPrintNSDataHex();
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v48 = v5;

    v5 = v48;
  }

  if (self->_heySiriConfidence)
  {
    NSAppendPrintF_safe();
    v49 = v5;

    v5 = v49;
  }
  if (self->_heySiriDeviceClass)
  {
    NSAppendPrintF_safe();
    v50 = v5;

    v5 = v50;
  }
  if (self->_heySiriPerceptualHash)
  {
    NSAppendPrintF_safe();
    v51 = v5;

    v5 = v51;
  }
  if (self->_heySiriProductType)
  {
    NSAppendPrintF_safe();
    v52 = v5;

    v5 = v52;
  }
  if (self->_heySiriRandom)
  {
    NSAppendPrintF_safe();
    v53 = v5;

    v5 = v53;
  }
  if (self->_heySiriSNR)
  {
    NSAppendPrintF_safe();
    v54 = v5;

    v5 = v54;
  }
  v55 = self->_nearbyActionAuthTagData;
  if (v55)
  {
    CUPrintNSDataHex();
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v56 = v5;

    v5 = v56;
  }

  if (self->_nearbyActionColorCode)
  {
    NSAppendPrintF_safe();
    v57 = v5;

    v5 = v57;
  }
  if (self->_nearbyActionFlags)
  {
    CUPrintFlags32();
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v58 = v5;

    v5 = v58;
  }
  if (self->_nearbyActionType)
  {
    NSAppendPrintF_safe();
    v59 = v5;

    v5 = v59;
  }
  v60 = self->_nearbyActionTargetData;
  if (v60)
  {
    CUPrintNSDataHex();
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v61 = v5;

    v5 = v61;
  }

  if (self->_nearbyActionV2Flags)
  {
    CUPrintFlags32();
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v62 = v5;

    v5 = v62;
  }
  v63 = self->_nearbyActionV2TargetData;
  if (v63)
  {
    CUPrintNSDataHex();
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v64 = v5;

    v5 = v64;
  }

  if (self->_nearbyActionV2Type)
  {
    NSAppendPrintF_safe();
    v65 = v5;

    v5 = v65;
  }
  if (self->_nearbyInfoFlags)
  {
    CUPrintFlags32();
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v66 = v5;

    v5 = v66;
  }
  if (self->_nearbyInfoStatusProgress != 0.0)
  {
    NSAppendPrintF_safe();
    v67 = v5;

    v5 = v67;
  }
  if (self->_nearbyInfoStatusTime)
  {
    NSAppendPrintF_safe();
    v68 = v5;

    v5 = v68;
  }
  if (self->_nearbyInfoStatusType)
  {
    NSAppendPrintF_safe();
    v69 = v5;

    v5 = v69;
  }
  if (self->_nearbyInfoV2Flags)
  {
    CUPrintFlags32();
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v70 = v5;

    v5 = v70;
  }
  if (self->_nearbyInfoV2DecryptedFlags)
  {
    CUPrintFlags32();
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v71 = v5;

    v5 = v71;
  }
  v72 = self->_nearbyInfoV2AuthTagData;
  if (v72)
  {
    CUPrintNSDataHex();
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v73 = v5;

    v5 = v73;
  }

  v74 = self->_nearbyInfoV2AuthIntegrityTagData;
  if (v74)
  {
    CUPrintNSDataHex();
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v75 = v5;

    v5 = v75;
  }

  if (self->_nearbyInfoV2InvitationCounter)
  {
    NSAppendPrintF_safe();
    v76 = v5;

    v5 = v76;
  }
  if (self->_nearbyInfoV2InvitationTypes)
  {
    CUPrintFlags32();
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v77 = v5;

    v5 = v77;
  }
  if (self->_nearbyInfoV2InvitationRouteType)
  {
    NSAppendPrintF_safe();
    v78 = v5;

    v5 = v78;
  }
  if (self->_nearbyActionNoWakeType)
  {
    NSAppendPrintF_safe();
    v79 = v5;

    v5 = v79;
  }
  v80 = self->_safetyAlertsAlertData;
  if (v80)
  {
    CUPrintNSDataHex();
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v81 = v5;

    v5 = v81;
  }

  v82 = self->_safetyAlertsAlertID;
  if (v82)
  {
    CUPrintNSDataHex();
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v83 = v5;

    v5 = v83;
  }

  v84 = self->_safetyAlertsSignature;
  if (v84)
  {
    CUPrintNSDataHex();
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v85 = v5;

    v5 = v85;
  }

  if (self->_safetyAlertsVersion)
  {
    NSAppendPrintF_safe();
    v86 = v5;

    v5 = v86;
  }
  v87 = self->_watchSetupData;
  if (v87)
  {
    CUPrintNSDataHex();
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v88 = v5;

    v5 = v88;
  }

  if (self->_nearbyActionNWPrecisionFindingStatus)
  {
    CUPrintFlags32();
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v89 = v5;

    v5 = v89;
  }
  v90 = self->_nearbyActionNoWakeAuthTagData;
  if (v90)
  {
    CUPrintNSDataHex();
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v91 = v5;

    v5 = v91;
  }

  v92 = self->_nearbyActionNoWakeConfigData;
  if (v92)
  {
    CUPrintNSDataHex();
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v93 = v5;

    v5 = v93;
  }

  v94 = v5;
  return v94;
}

- (void)setAirdropVersion:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__CBAdvertiser_setAirdropVersion___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __34__CBAdvertiser_setAirdropVersion___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 50);
  if (v1 != v3)
    *(_BYTE *)(v2 + 50) = v1;
  return v1 != v3;
}

- (void)setAirdropFlags:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__CBAdvertiser_setAirdropFlags___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __32__CBAdvertiser_setAirdropFlags___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 48);
  if (v1 != v3)
    *(_BYTE *)(v2 + 48) = v1;
  return v1 != v3;
}

- (void)setAirdropTempAuthTagData:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CBAdvertiser *v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__CBAdvertiser_setAirdropTempAuthTagData___block_invoke;
  v6[3] = &unk_1E53FFA50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);

}

BOOL __42__CBAdvertiser_setAirdropTempAuthTagData___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  char v7;
  void *v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 256);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  v5 = v3 != v4;
  if (v3 == v4)
  {

  }
  else
  {
    v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      v7 = objc_msgSend(v3, "isEqual:", v4);

      if ((v7 & 1) != 0)
        return 0;
    }
    else
    {

    }
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = v9;
    v3 = *(id *)(v10 + 256);
    *(_QWORD *)(v10 + 256) = v11;
  }

  return v5;
}

- (void)setModel:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __25__CBAdvertiser_setModel___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __25__CBAdvertiser_setModel___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 49);
  if (v1 != v3)
    *(_BYTE *)(v2 + 49) = v1;
  return v1 != v3;
}

- (void)setAirdrophash1:(unsigned __int16)a3
{
  _QWORD v3[5];
  unsigned __int16 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__CBAdvertiser_setAirdrophash1___block_invoke;
  v3[3] = &unk_1E53FFA78;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __32__CBAdvertiser_setAirdrophash1___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int16 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int16 *)(v2 + 80);
  if (v1 != v3)
    *(_WORD *)(v2 + 80) = v1;
  return v1 != v3;
}

- (void)setAirdrophash2:(unsigned __int16)a3
{
  _QWORD v3[5];
  unsigned __int16 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__CBAdvertiser_setAirdrophash2___block_invoke;
  v3[3] = &unk_1E53FFA78;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __32__CBAdvertiser_setAirdrophash2___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int16 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int16 *)(v2 + 82);
  if (v1 != v3)
    *(_WORD *)(v2 + 82) = v1;
  return v1 != v3;
}

- (void)setAirdrophash3:(unsigned __int16)a3
{
  _QWORD v3[5];
  unsigned __int16 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__CBAdvertiser_setAirdrophash3___block_invoke;
  v3[3] = &unk_1E53FFA78;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __32__CBAdvertiser_setAirdrophash3___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int16 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int16 *)(v2 + 84);
  if (v1 != v3)
    *(_WORD *)(v2 + 84) = v1;
  return v1 != v3;
}

- (void)setAirdrophash4:(unsigned __int16)a3
{
  _QWORD v3[5];
  unsigned __int16 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__CBAdvertiser_setAirdrophash4___block_invoke;
  v3[3] = &unk_1E53FFA78;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __32__CBAdvertiser_setAirdrophash4___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int16 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int16 *)(v2 + 86);
  if (v1 != v3)
    *(_WORD *)(v2 + 86) = v1;
  return v1 != v3;
}

- (void)setAirdropConfigData:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__CBAdvertiser_setAirdropConfigData___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __37__CBAdvertiser_setAirdropConfigData___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 51);
  if (v1 != v3)
    *(_BYTE *)(v2 + 51) = v1;
  return v1 != v3;
}

- (void)setAirplaySourceFlags:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__CBAdvertiser_setAirplaySourceFlags___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __38__CBAdvertiser_setAirplaySourceFlags___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 52);
  if (v1 != v3)
    *(_BYTE *)(v2 + 52) = v1;
  return v1 != v3;
}

- (void)setAirplaySourceUWBConfigData:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CBAdvertiser *v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__CBAdvertiser_setAirplaySourceUWBConfigData___block_invoke;
  v6[3] = &unk_1E53FFA50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);

}

BOOL __46__CBAdvertiser_setAirplaySourceUWBConfigData___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  char v7;
  void *v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 264);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  v5 = v3 != v4;
  if (v3 == v4)
  {

  }
  else
  {
    v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      v7 = objc_msgSend(v3, "isEqual:", v4);

      if ((v7 & 1) != 0)
        return 0;
    }
    else
    {

    }
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = v9;
    v3 = *(id *)(v10 + 264);
    *(_QWORD *)(v10 + 264) = v11;
  }

  return v5;
}

- (void)setAirplayTargetConfigSeed:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__CBAdvertiser_setAirplayTargetConfigSeed___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __43__CBAdvertiser_setAirplayTargetConfigSeed___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 53);
  if (v1 != v3)
    *(_BYTE *)(v2 + 53) = v1;
  return v1 != v3;
}

- (void)setAirplayTargetFlags:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__CBAdvertiser_setAirplayTargetFlags___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __38__CBAdvertiser_setAirplayTargetFlags___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 54);
  if (v1 != v3)
    *(_BYTE *)(v2 + 54) = v1;
  return v1 != v3;
}

- (void)setAirplayTargetIPv4:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__CBAdvertiser_setAirplayTargetIPv4___block_invoke;
  v3[3] = &unk_1E53FFAA0;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __37__CBAdvertiser_setAirplayTargetIPv4___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(_DWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 104);
  if (v1 != v3)
    *(_DWORD *)(v2 + 104) = v1;
  return v1 != v3;
}

- (void)setAirplayTargetPort:(unsigned __int16)a3
{
  _QWORD v3[5];
  unsigned __int16 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__CBAdvertiser_setAirplayTargetPort___block_invoke;
  v3[3] = &unk_1E53FFA78;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __37__CBAdvertiser_setAirplayTargetPort___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int16 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int16 *)(v2 + 88);
  if (v1 != v3)
    *(_WORD *)(v2 + 88) = v1;
  return v1 != v3;
}

- (void)setDsActionFlags:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__CBAdvertiser_setDsActionFlags___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __33__CBAdvertiser_setDsActionFlags___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 55);
  if (v1 != v3)
    *(_BYTE *)(v2 + 55) = v1;
  return v1 != v3;
}

- (void)setDsActionMeasuredPower:(char)a3
{
  _QWORD v3[5];
  char v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__CBAdvertiser_setDsActionMeasuredPower___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __41__CBAdvertiser_setDsActionMeasuredPower___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 56);
  if (v1 != v3)
    *(_BYTE *)(v2 + 56) = v1;
  return v1 != v3;
}

- (void)setDsActionTieBreaker:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__CBAdvertiser_setDsActionTieBreaker___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __38__CBAdvertiser_setDsActionTieBreaker___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 57);
  if (v1 != v3)
    *(_BYTE *)(v2 + 57) = v1;
  return v1 != v3;
}

- (void)setDsInfoVehicleConfidence:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__CBAdvertiser_setDsInfoVehicleConfidence___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __43__CBAdvertiser_setDsInfoVehicleConfidence___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 58);
  if (v1 != v3)
    *(_BYTE *)(v2 + 58) = v1;
  return v1 != v3;
}

- (void)setDsInfoVehicleState:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__CBAdvertiser_setDsInfoVehicleState___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __38__CBAdvertiser_setDsInfoVehicleState___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 59);
  if (v1 != v3)
    *(_BYTE *)(v2 + 59) = v1;
  return v1 != v3;
}

- (void)setFidoPayloadData:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CBAdvertiser *v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__CBAdvertiser_setFidoPayloadData___block_invoke;
  v6[3] = &unk_1E53FFA50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);

}

BOOL __35__CBAdvertiser_setFidoPayloadData___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  char v7;
  void *v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 272);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  v5 = v3 != v4;
  if (v3 == v4)
  {

  }
  else
  {
    v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      v7 = objc_msgSend(v3, "isEqual:", v4);

      if ((v7 & 1) != 0)
        return 0;
    }
    else
    {

    }
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = v9;
    v3 = *(id *)(v10 + 272);
    *(_QWORD *)(v10 + 272) = v11;
  }

  return v5;
}

- (void)setHeySiriConfidence:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__CBAdvertiser_setHeySiriConfidence___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __37__CBAdvertiser_setHeySiriConfidence___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 61);
  if (v1 != v3)
    *(_BYTE *)(v2 + 61) = v1;
  return v1 != v3;
}

- (void)setHeySiriDeviceClass:(unsigned __int16)a3
{
  _QWORD v3[5];
  unsigned __int16 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__CBAdvertiser_setHeySiriDeviceClass___block_invoke;
  v3[3] = &unk_1E53FFA78;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __38__CBAdvertiser_setHeySiriDeviceClass___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int16 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int16 *)(v2 + 90);
  if (v1 != v3)
    *(_WORD *)(v2 + 90) = v1;
  return v1 != v3;
}

- (void)setHeySiriPerceptualHash:(unsigned __int16)a3
{
  _QWORD v3[5];
  unsigned __int16 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__CBAdvertiser_setHeySiriPerceptualHash___block_invoke;
  v3[3] = &unk_1E53FFA78;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __41__CBAdvertiser_setHeySiriPerceptualHash___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int16 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int16 *)(v2 + 92);
  if (v1 != v3)
    *(_WORD *)(v2 + 92) = v1;
  return v1 != v3;
}

- (void)setHeySiriProductType:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__CBAdvertiser_setHeySiriProductType___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __38__CBAdvertiser_setHeySiriProductType___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 62);
  if (v1 != v3)
    *(_BYTE *)(v2 + 62) = v1;
  return v1 != v3;
}

- (void)setHeySiriRandom:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__CBAdvertiser_setHeySiriRandom___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __33__CBAdvertiser_setHeySiriRandom___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 63);
  if (v1 != v3)
    *(_BYTE *)(v2 + 63) = v1;
  return v1 != v3;
}

- (void)setHeySiriSNR:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__CBAdvertiser_setHeySiriSNR___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __30__CBAdvertiser_setHeySiriSNR___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 64);
  if (v1 != v3)
    *(_BYTE *)(v2 + 64) = v1;
  return v1 != v3;
}

- (void)setLabel:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_label, a3);
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  LogCategoryReplaceF();

}

- (void)setNearbyActionColorCode:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__CBAdvertiser_setNearbyActionColorCode___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __41__CBAdvertiser_setNearbyActionColorCode___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 65);
  if (v1 != v3)
    *(_BYTE *)(v2 + 65) = v1;
  return v1 != v3;
}

- (void)setNearbyInfoFlags:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__CBAdvertiser_setNearbyInfoFlags___block_invoke;
  v3[3] = &unk_1E53FFAA0;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __35__CBAdvertiser_setNearbyInfoFlags___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(_DWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 116);
  if (v1 != v3)
    *(_DWORD *)(v2 + 116) = v1;
  return v1 != v3;
}

- (void)setNearbyInfoStatusProgress:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__CBAdvertiser_setNearbyInfoStatusProgress___block_invoke;
  v3[3] = &unk_1E53FFAC8;
  *(double *)&v3[5] = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __44__CBAdvertiser_setNearbyInfoStatusProgress___block_invoke(uint64_t a1)
{
  double v1;
  uint64_t v2;
  double v3;

  v1 = *(double *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(double *)(v2 + 304);
  if (v1 != v3)
    *(double *)(v2 + 304) = v1;
  return v1 != v3;
}

- (void)setNearbyInfoStatusTime:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__CBAdvertiser_setNearbyInfoStatusTime___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __40__CBAdvertiser_setNearbyInfoStatusTime___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 68);
  if (v1 != v3)
    *(_BYTE *)(v2 + 68) = v1;
  return v1 != v3;
}

- (void)setNearbyInfoStatusType:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__CBAdvertiser_setNearbyInfoStatusType___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __40__CBAdvertiser_setNearbyInfoStatusType___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 69);
  if (v1 != v3)
    *(_BYTE *)(v2 + 69) = v1;
  return v1 != v3;
}

- (void)setNearbyInfoV2DecryptedFlags:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__CBAdvertiser_setNearbyInfoV2DecryptedFlags___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __46__CBAdvertiser_setNearbyInfoV2DecryptedFlags___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 71);
  if (v1 != v3)
    *(_BYTE *)(v2 + 71) = v1;
  return v1 != v3;
}

- (void)setNearbyInfoV2Flags:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__CBAdvertiser_setNearbyInfoV2Flags___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __37__CBAdvertiser_setNearbyInfoV2Flags___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 70);
  if (v1 != v3)
    *(_BYTE *)(v2 + 70) = v1;
  return v1 != v3;
}

- (void)setNearbyInfoV2InvitationCounter:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__CBAdvertiser_setNearbyInfoV2InvitationCounter___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __49__CBAdvertiser_setNearbyInfoV2InvitationCounter___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 72);
  if (v1 != v3)
    *(_BYTE *)(v2 + 72) = v1;
  return v1 != v3;
}

- (void)setNearbyInfoV2InvitationTypes:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__CBAdvertiser_setNearbyInfoV2InvitationTypes___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __47__CBAdvertiser_setNearbyInfoV2InvitationTypes___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 73);
  if (v1 != v3)
    *(_BYTE *)(v2 + 73) = v1;
  return v1 != v3;
}

- (void)setnearbyInfoV2InvitationRouteType:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__CBAdvertiser_setnearbyInfoV2InvitationRouteType___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __51__CBAdvertiser_setnearbyInfoV2InvitationRouteType___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 74);
  if (v1 != v3)
    *(_BYTE *)(v2 + 74) = v1;
  return v1 != v3;
}

- (void)setNearbyActionTargetData:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CBAdvertiser *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__CBAdvertiser_setNearbyActionTargetData___block_invoke;
  v6[3] = &unk_1E53FFA50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);

}

BOOL __42__CBAdvertiser_setNearbyActionTargetData___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  char v7;
  void *v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 288);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  v5 = v3 != v4;
  if (v3 == v4)
  {

  }
  else
  {
    v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      v7 = objc_msgSend(v3, "isEqual:", v4);

      if ((v7 & 1) != 0)
        return 0;
    }
    else
    {

    }
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = v9;
    v3 = *(id *)(v10 + 288);
    *(_QWORD *)(v10 + 288) = v11;
  }

  return v5;
}

- (void)setNearbyActionNoWakeType:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__CBAdvertiser_setNearbyActionNoWakeType___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __42__CBAdvertiser_setNearbyActionNoWakeType___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 75);
  if (v1 != v3)
    *(_BYTE *)(v2 + 75) = v1;
  return v1 != v3;
}

- (void)setSafetyAlertsAlertData:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CBAdvertiser *v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__CBAdvertiser_setSafetyAlertsAlertData___block_invoke;
  v6[3] = &unk_1E53FFA50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);

}

BOOL __41__CBAdvertiser_setSafetyAlertsAlertData___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  char v7;
  void *v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 336);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  v5 = v3 != v4;
  if (v3 == v4)
  {

  }
  else
  {
    v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      v7 = objc_msgSend(v3, "isEqual:", v4);

      if ((v7 & 1) != 0)
        return 0;
    }
    else
    {

    }
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = v9;
    v3 = *(id *)(v10 + 336);
    *(_QWORD *)(v10 + 336) = v11;
  }

  return v5;
}

- (void)setSafetyAlertsAlertID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  CBAdvertiser *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__CBAdvertiser_setSafetyAlertsAlertID___block_invoke;
  v8[3] = &unk_1E53FFAF0;
  v9 = v5;
  v10 = self;
  v11 = v4;
  v6 = v4;
  v7 = v5;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v8);

}

BOOL __39__CBAdvertiser_setSafetyAlertsAlertID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 344);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  v5 = v3 != v4;
  if (v3 == v4)
  {

  }
  else
  {
    v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      v7 = objc_msgSend(v3, "isEqual:", v4);

      if ((v7 & 1) != 0)
        return 0;
    }
    else
    {

    }
    v10 = a1 + 40;
    v9 = *(_QWORD *)(a1 + 40);
    v11 = *(id *)(v10 + 8);
    v3 = *(id *)(v9 + 344);
    *(_QWORD *)(v9 + 344) = v11;
  }

  return v5;
}

- (void)setSafetyAlertsSignature:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CBAdvertiser *v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__CBAdvertiser_setSafetyAlertsSignature___block_invoke;
  v6[3] = &unk_1E53FFA50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);

}

BOOL __41__CBAdvertiser_setSafetyAlertsSignature___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  char v7;
  void *v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 352);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  v5 = v3 != v4;
  if (v3 == v4)
  {

  }
  else
  {
    v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      v7 = objc_msgSend(v3, "isEqual:", v4);

      if ((v7 & 1) != 0)
        return 0;
    }
    else
    {

    }
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = v9;
    v3 = *(id *)(v10 + 352);
    *(_QWORD *)(v10 + 352) = v11;
  }

  return v5;
}

- (void)setSafetyAlertsVersion:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__CBAdvertiser_setSafetyAlertsVersion___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __39__CBAdvertiser_setSafetyAlertsVersion___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 78);
  if (v1 != v3)
    *(_BYTE *)(v2 + 78) = v1;
  return v1 != v3;
}

- (void)setUseCase:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__CBAdvertiser_setUseCase___block_invoke;
  v3[3] = &unk_1E53FFAA0;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __27__CBAdvertiser_setUseCase___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(_DWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 96);
  if (v1 != v3)
    *(_DWORD *)(v2 + 96) = v1;
  return v1 != v3;
}

- (void)setUseCaseClientIDs:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CBAdvertiser *v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__CBAdvertiser_setUseCaseClientIDs___block_invoke;
  v6[3] = &unk_1E53FFA50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);

}

BOOL __36__CBAdvertiser_setUseCaseClientIDs___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  char v7;
  void *v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 232);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  v5 = v3 != v4;
  if (v3 == v4)
  {

  }
  else
  {
    v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      v7 = objc_msgSend(v3, "isEqual:", v4);

      if ((v7 & 1) != 0)
        return 0;
    }
    else
    {

    }
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = v9;
    v3 = *(id *)(v10 + 232);
    *(_QWORD *)(v10 + 232) = v11;
  }

  return v5;
}

- (void)setWatchSetupData:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CBAdvertiser *v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__CBAdvertiser_setWatchSetupData___block_invoke;
  v6[3] = &unk_1E53FFA50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);

}

BOOL __34__CBAdvertiser_setWatchSetupData___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  char v7;
  void *v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 360);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  v5 = v3 != v4;
  if (v3 == v4)
  {

  }
  else
  {
    v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      v7 = objc_msgSend(v3, "isEqual:", v4);

      if ((v7 & 1) != 0)
        return 0;
    }
    else
    {

    }
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = v9;
    v3 = *(id *)(v10 + 360);
    *(_QWORD *)(v10 + 360) = v11;
  }

  return v5;
}

- (void)setNearbyActionNWPrecisionFindingStatus:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__CBAdvertiser_setNearbyActionNWPrecisionFindingStatus___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __56__CBAdvertiser_setNearbyActionNWPrecisionFindingStatus___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 76);
  if (v1 != v3)
    *(_BYTE *)(v2 + 76) = v1;
  return v1 != v3;
}

- (void)setNearbyActionNoWakeAuthTagData:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CBAdvertiser *v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__CBAdvertiser_setNearbyActionNoWakeAuthTagData___block_invoke;
  v6[3] = &unk_1E53FFA50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);

}

BOOL __49__CBAdvertiser_setNearbyActionNoWakeAuthTagData___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  char v7;
  void *v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 320);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  v5 = v3 != v4;
  if (v3 == v4)
  {

  }
  else
  {
    v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      v7 = objc_msgSend(v3, "isEqual:", v4);

      if ((v7 & 1) != 0)
        return 0;
    }
    else
    {

    }
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = v9;
    v3 = *(id *)(v10 + 320);
    *(_QWORD *)(v10 + 320) = v11;
  }

  return v5;
}

- (void)setNearbyActionNoWakeConfigData:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CBAdvertiser *v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__CBAdvertiser_setNearbyActionNoWakeConfigData___block_invoke;
  v6[3] = &unk_1E53FFA50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);

}

BOOL __48__CBAdvertiser_setNearbyActionNoWakeConfigData___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  char v7;
  void *v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 328);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  v5 = v3 != v4;
  if (v3 == v4)
  {

  }
  else
  {
    v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      v7 = objc_msgSend(v3, "isEqual:", v4);

      if ((v7 & 1) != 0)
        return 0;
    }
    else
    {

    }
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = v9;
    v3 = *(id *)(v10 + 328);
    *(_QWORD *)(v10 + 328) = v11;
  }

  return v5;
}

- (void)setEpaTxPower:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__CBAdvertiser_setEpaTxPower___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __30__CBAdvertiser_setEpaTxPower___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 60);
  if (v1 != v3)
    *(_BYTE *)(v2 + 60) = v1;
  return v1 != v3;
}

- (BOOL)updateWithCBAdvertiser:(id)a3
{
  id v4;
  int v5;
  int advertiseRate;
  BOOL v7;
  int v8;
  const char *v9;
  id v10;
  unsigned int v11;
  unsigned int useCase;
  const char *v13;
  id v14;
  void *v15;
  NSArray *useCaseClientIDs;
  NSArray *v17;
  NSArray *v18;
  NSArray *v19;
  char v20;
  unsigned int v21;
  _BOOL8 enableEPAForLEAdvertisement;
  unsigned int v23;
  uint64_t airdropFlags;
  unsigned __int8 v25;
  id v26;
  void *v27;
  NSData *airdropTempAuthTagData;
  NSData *v29;
  NSData *v30;
  NSData *v31;
  char v32;
  unsigned int v33;
  uint64_t airdropModel;
  unsigned int v35;
  uint64_t airdropVersion;
  unsigned int v37;
  uint64_t airdropHash1;
  unsigned int v39;
  uint64_t airdropHash2;
  unsigned int v41;
  uint64_t airdropHash3;
  unsigned int v43;
  uint64_t airdropHash4;
  unsigned int v45;
  uint64_t airdropConfigData;
  unsigned __int8 v47;
  id v48;
  void *v49;
  NSData *airplaySourceAuthTagData;
  NSData *v51;
  NSData *v52;
  NSData *v53;
  char v54;
  NSArray *v55;
  NSData *v56;
  NSData *v57;
  void *v58;
  id v59;
  NSArray *v60;
  BOOL v61;
  id v62;
  void *v63;
  id v64;
  NSData *v65;
  unsigned __int8 v66;
  id v67;
  unsigned __int8 v68;
  id v69;
  unsigned __int16 v70;
  id v71;
  unsigned __int16 v72;
  id v73;
  unsigned __int16 v74;
  id v75;
  unsigned __int16 v76;
  id v77;
  void *v78;
  id v79;
  NSData *v80;
  int v81;
  void *v82;
  id v83;
  void *v84;
  NSData *airplaySourceUWBConfigData;
  NSData *v86;
  NSData *v87;
  NSData *v88;
  char v89;
  unsigned int v90;
  void *airplayTargetConfigSeed;
  unsigned __int8 v92;
  id v93;
  int v94;
  void *v95;
  id v96;
  unsigned int v97;
  uint64_t airplayTargetPort;
  int v99;
  int v100;
  uint64_t dsActionMeasuredPower;
  unsigned int v102;
  uint64_t dsActionTieBreaker;
  unsigned int v104;
  uint64_t dsInfoVehicleConfidence;
  unsigned int v106;
  uint64_t v107;
  unsigned int v108;
  _BOOL8 v109;
  BOOL v110;
  id v111;
  void *v112;
  NSData *fidoPayloadData;
  NSData *v114;
  NSData *v115;
  NSData *v116;
  char v117;
  unsigned int v118;
  uint64_t heySiriConfidence;
  unsigned int v120;
  uint64_t v121;
  unsigned int v122;
  uint64_t heySiriPerceptualHash;
  unsigned int v124;
  uint64_t v125;
  unsigned int v126;
  uint64_t heySiriRandom;
  unsigned int v128;
  uint64_t heySiriSNR;
  unsigned __int8 v130;
  id v131;
  void *v132;
  NSData *nearbyActionAuthTagData;
  NSData *v134;
  NSData *v135;
  NSData *v136;
  char v137;
  unsigned int v138;
  void *nearbyActionColorCode;
  unsigned __int8 v140;
  id v141;
  unsigned int v142;
  void *v143;
  id v144;
  unsigned int v145;
  unsigned int nearbyActionType;
  id v147;
  void *v148;
  NSData *nearbyActionTargetData;
  NSData *v150;
  NSData *v151;
  NSData *v152;
  char v153;
  void *v154;
  id v155;
  unsigned __int16 v156;
  id v157;
  void *v158;
  id v159;
  char v160;
  id v161;
  unsigned __int8 v162;
  id v163;
  unsigned __int8 v164;
  id v165;
  unsigned __int8 v166;
  const char *v167;
  const char *v168;
  NSData *v169;
  NSData *v170;
  NSData *v171;
  NSData *v172;
  void *v173;
  id v174;
  NSData *v175;
  void *v176;
  id v177;
  NSData *v178;
  unsigned __int8 v179;
  id v180;
  unsigned __int16 v181;
  const char *v182;
  const char *v183;
  void *v184;
  id v185;
  NSData *v186;
  void *v187;
  id v188;
  NSData *v189;
  unsigned int v190;
  void *v191;
  id v192;
  void *v193;
  NSData *nearbyActionV2TargetData;
  NSData *v195;
  NSData *v196;
  NSData *v197;
  char v198;
  unsigned int v199;
  unsigned int nearbyActionV2Type;
  id v201;
  unsigned int v202;
  void *v203;
  id v204;
  double v205;
  double v206;
  double nearbyInfoStatusProgress;
  id v208;
  unsigned int v209;
  uint64_t v210;
  unsigned int v211;
  uint64_t v212;
  int v213;
  int v214;
  void *v215;
  id v216;
  void *v217;
  NSData *nearbyInfoV2AuthIntegrityTagData;
  NSData *v219;
  NSData *v220;
  NSData *v221;
  char v222;
  unsigned __int8 v223;
  const char *v224;
  const char *v225;
  NSData *v226;
  NSData *v227;
  char *v228;
  id v229;
  NSData *v230;
  void *v231;
  id v232;
  NSData *v233;
  void *v234;
  NSData *nearbyInfoV2AuthTagData;
  NSData *v236;
  NSData *v237;
  NSData *v238;
  char v239;
  unsigned int v240;
  uint64_t nearbyInfoV2InvitationCounter;
  unsigned int v242;
  uint64_t nearbyInfoV2InvitationTypes;
  unsigned int v244;
  uint64_t nearbyInfoV2InvitationRouteType;
  int v246;
  int nearbyActionNoWakeType;
  unsigned __int8 v248;
  const char *v249;
  const char *v250;
  const char *v251;
  id v252;
  int v253;
  void *v254;
  id v255;
  void *v256;
  NSData *nearbyActionNoWakeAuthTagData;
  NSData *v258;
  NSData *v259;
  NSData *v260;
  char v261;
  NSData *v262;
  NSData *v263;
  void *v264;
  id v265;
  NSData *v266;
  unsigned __int8 v267;
  id v268;
  unsigned __int8 v269;
  id v270;
  unsigned __int8 v271;
  id v272;
  void *v273;
  id v274;
  NSData *v275;
  void *v276;
  NSData *nearbyActionNoWakeConfigData;
  NSData *v278;
  NSData *v279;
  NSData *v280;
  char v281;
  NSData *v282;
  void *v283;
  id v284;
  NSData *v285;
  NSData *v286;
  void *v287;
  id v288;
  NSData *v289;
  void *v290;
  id v291;
  NSData *v292;
  NSData *v293;
  char v294;
  void *v295;
  id v296;
  unsigned int v297;
  uint64_t safetyAlertsVersion;
  BOOL v299;
  unsigned __int8 v300;
  id v301;
  void *v302;
  NSData *watchSetupData;
  NSData *v304;
  NSData *v305;
  NSData *v306;
  char v307;
  NSData *v308;
  int var0;
  void *v310;
  id v311;
  NSData *v312;
  NSData *v313;
  id v314;
  id v315;
  unsigned __int16 v316;
  id v317;
  unsigned __int8 v318;
  const char *v319;
  const char *v320;
  id v321;
  unsigned __int8 v322;
  const char *v323;
  const char *v324;
  id v325;
  unsigned __int8 v326;
  id v327;
  id v328;
  void *v329;
  id v330;
  const char *v332;
  const char *v333;
  void *v334;
  uint64_t v335;
  void *v336;
  uint64_t v337;
  void *v338;
  _BOOL8 v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  void *v346;
  void *v347;
  void *v348;
  _BOOL8 v349;
  void *v350;
  uint64_t v351;
  void *v352;
  void *v353;
  const char *v354;
  void *v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  void *v361;
  const char *v362;
  void *v363;
  double v364;
  void *v365;
  void *v366;
  void *v367;
  const char *v368;
  void *v369;
  void *v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  void *v374;
  void *v375;
  void *v376;
  uint64_t v377;
  const char *v378;
  const char *v379;
  uint64_t v380;
  const char *v381;
  const char *v382;
  uint64_t v383;
  const char *v384;
  const char *v385;
  const char *v386;
  void *v387;
  uint64_t v388;
  void *v389;
  uint64_t v390;
  void *v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  void *v399;
  uint64_t v400;
  void *v401;
  uint64_t v402;
  void *v403;
  uint64_t v404;
  uint64_t v405;
  void *v406;
  const char *v407;
  void *v408;
  void *v409;
  uint64_t v410;
  void *v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  void *v416;
  void *v417;
  void *v418;
  double v419;
  void *v420;
  void *v421;
  void *v422;
  const char *v423;
  void *v424;
  void *v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  void *v429;
  void *v430;
  void *v431;
  uint64_t v432;
  void *v433;
  void *v434;
  const char *v435;
  const char *v436;
  uint64_t v437;
  const char *v438;
  const char *v439;
  uint64_t v440;
  const char *v441;
  void *v442;
  NSData *v443;
  NSData *v444;
  NSData *v445;
  NSData *v446;
  NSData *v447;
  NSData *v448;
  NSData *v449;
  NSData *v450;
  NSData *v451;
  NSData *v452;
  NSData *v453;
  NSData *v454;
  NSArray *v455;
  unsigned int v456;

  v4 = a3;
  v5 = objc_msgSend(v4, "advertiseRate");
  advertiseRate = self->_advertiseRate;
  v7 = v5 != advertiseRate;
  if (v5 == advertiseRate)
  {
    v10 = 0;
    v11 = objc_msgSend(v4, "useCase");
    useCase = self->_useCase;
    if (v11 != useCase)
    {
LABEL_27:
      v332 = CBUseCaseToString(useCase);
      v385 = CBUseCaseToString(v11);
      CUAppendF();
      v14 = v10;

      self->_useCase = v11;
      v7 = 1;
      v10 = v14;
    }
  }
  else
  {
    v8 = v5;
    v9 = "Default";
    switch(advertiseRate)
    {
      case 0:
        break;
      case 10:
        v9 = "Periodic";
        break;
      case 15:
        v9 = "PeriodicHigh";
        break;
      case 20:
        v9 = "Background";
        break;
      case 30:
        v9 = "Low";
        break;
      case 40:
        v9 = "Medium";
        break;
      case 42:
        v9 = "MediumMid";
        break;
      case 45:
        v9 = "MediumHigh";
        break;
      case 50:
        v9 = "High";
        break;
      case 60:
        v9 = "Max";
        break;
      default:
        v9 = "?";
        break;
    }
    v13 = "Default";
    switch(v5)
    {
      case 0:
        break;
      case 10:
        v13 = "Periodic";
        break;
      case 15:
        v13 = "PeriodicHigh";
        break;
      case 20:
        v13 = "Background";
        break;
      case 30:
        v13 = "Low";
        break;
      case 40:
        v13 = "Medium";
        break;
      case 42:
        v13 = "MediumMid";
        break;
      case 45:
        v13 = "MediumHigh";
        break;
      case 50:
        v13 = "High";
        break;
      case 60:
        v13 = "Max";
        break;
      default:
        v13 = "?";
        break;
    }
    v333 = v9;
    v386 = v13;
    CUAppendF();
    v10 = 0;
    self->_advertiseRate = v8;
    v11 = objc_msgSend(v4, "useCase", v333, v386);
    useCase = self->_useCase;
    if (v11 != useCase)
      goto LABEL_27;
  }
  objc_msgSend(v4, "useCaseClientIDs", v332, v385);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  useCaseClientIDs = self->_useCaseClientIDs;
  v17 = v15;
  v18 = useCaseClientIDs;
  if (v17 == v18)
  {

    v55 = v17;
  }
  else
  {
    v19 = v18;
    if ((v17 == 0) != (v18 != 0))
    {
      v20 = -[NSArray isEqual:](v17, "isEqual:", v18);

      if ((v20 & 1) != 0)
      {
        v21 = objc_msgSend(v4, "enableEPAForLEAdvertisement");
        enableEPAForLEAdvertisement = self->_enableEPAForLEAdvertisement;
        if (enableEPAForLEAdvertisement == v21)
          goto LABEL_32;
        goto LABEL_55;
      }
    }
    else
    {

    }
    CUPrintNSObjectOneLine();
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSObjectOneLine();
    v334 = v58;
    v387 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v59 = v10;

    v60 = v17;
    v55 = self->_useCaseClientIDs;
    self->_useCaseClientIDs = v60;
    v7 = 1;
    v10 = v59;
  }

  v21 = objc_msgSend(v4, "enableEPAForLEAdvertisement");
  enableEPAForLEAdvertisement = self->_enableEPAForLEAdvertisement;
  if (enableEPAForLEAdvertisement == v21)
  {
LABEL_32:
    v23 = objc_msgSend(v4, "airdropFlags", v334, v387);
    airdropFlags = self->_airdropFlags;
    if (v23 == (_DWORD)airdropFlags)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_55:
  v61 = v21;
  v339 = enableEPAForLEAdvertisement;
  v392 = v21;
  CUAppendF();
  v62 = v10;

  self->_enableEPAForLEAdvertisement = v61;
  v7 = 1;
  v10 = v62;
  v23 = objc_msgSend(v4, "airdropFlags", v339, v392);
  airdropFlags = self->_airdropFlags;
  if (v23 != (_DWORD)airdropFlags)
  {
LABEL_33:
    v25 = v23;
    v335 = airdropFlags;
    v388 = v23;
    CUAppendF();
    v26 = v10;

    self->_airdropFlags = v25;
    v7 = 1;
    v10 = v26;
  }
LABEL_34:
  objc_msgSend(v4, "airdropTempAuthTagData", v335, v388);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  airdropTempAuthTagData = self->_airdropTempAuthTagData;
  v29 = v27;
  v30 = airdropTempAuthTagData;
  if (v29 == v30)
  {

    v56 = v29;
  }
  else
  {
    v31 = v30;
    if ((v29 == 0) != (v30 != 0))
    {
      v32 = -[NSData isEqual:](v29, "isEqual:", v30);

      if ((v32 & 1) != 0)
      {
        v33 = objc_msgSend(v4, "airdropModel");
        airdropModel = self->_airdropModel;
        if (v33 == (_DWORD)airdropModel)
          goto LABEL_38;
        goto LABEL_60;
      }
    }
    else
    {

    }
    v7 = 1;
    CUPrintNSDataHex();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v336 = v63;
    v389 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v64 = v10;

    v65 = v29;
    v56 = self->_airdropTempAuthTagData;
    self->_airdropTempAuthTagData = v65;
    v10 = v64;
  }

  v33 = objc_msgSend(v4, "airdropModel");
  airdropModel = self->_airdropModel;
  if (v33 == (_DWORD)airdropModel)
  {
LABEL_38:
    v35 = objc_msgSend(v4, "airdropVersion", v336, v389);
    airdropVersion = self->_airdropVersion;
    if (v35 == (_DWORD)airdropVersion)
      goto LABEL_39;
    goto LABEL_61;
  }
LABEL_60:
  v66 = v33;
  v340 = airdropModel;
  v393 = v33;
  CUAppendF();
  v67 = v10;

  self->_airdropModel = v66;
  v7 = 1;
  v10 = v67;
  v35 = objc_msgSend(v4, "airdropVersion", v340, v393);
  airdropVersion = self->_airdropVersion;
  if (v35 == (_DWORD)airdropVersion)
  {
LABEL_39:
    v37 = objc_msgSend(v4, "airdropHash1");
    airdropHash1 = self->_airdropHash1;
    if (v37 == (_DWORD)airdropHash1)
      goto LABEL_40;
    goto LABEL_62;
  }
LABEL_61:
  v68 = v35;
  v341 = airdropVersion;
  v394 = v35;
  CUAppendF();
  v69 = v10;

  self->_airdropVersion = v68;
  v7 = 1;
  v10 = v69;
  v37 = objc_msgSend(v4, "airdropHash1", v341, v394);
  airdropHash1 = self->_airdropHash1;
  if (v37 == (_DWORD)airdropHash1)
  {
LABEL_40:
    v39 = objc_msgSend(v4, "airdropHash2");
    airdropHash2 = self->_airdropHash2;
    if (v39 == (_DWORD)airdropHash2)
      goto LABEL_41;
    goto LABEL_63;
  }
LABEL_62:
  v70 = v37;
  v342 = airdropHash1;
  v395 = v37;
  CUAppendF();
  v71 = v10;

  self->_airdropHash1 = v70;
  v7 = 1;
  v10 = v71;
  v39 = objc_msgSend(v4, "airdropHash2", v342, v395);
  airdropHash2 = self->_airdropHash2;
  if (v39 == (_DWORD)airdropHash2)
  {
LABEL_41:
    v41 = objc_msgSend(v4, "airdropHash3");
    airdropHash3 = self->_airdropHash3;
    if (v41 == (_DWORD)airdropHash3)
      goto LABEL_42;
    goto LABEL_64;
  }
LABEL_63:
  v72 = v39;
  v343 = airdropHash2;
  v396 = v39;
  CUAppendF();
  v73 = v10;

  self->_airdropHash2 = v72;
  v7 = 1;
  v10 = v73;
  v41 = objc_msgSend(v4, "airdropHash3", v343, v396);
  airdropHash3 = self->_airdropHash3;
  if (v41 == (_DWORD)airdropHash3)
  {
LABEL_42:
    v43 = objc_msgSend(v4, "airdropHash4");
    airdropHash4 = self->_airdropHash4;
    if (v43 == (_DWORD)airdropHash4)
      goto LABEL_43;
    goto LABEL_65;
  }
LABEL_64:
  v74 = v41;
  v344 = airdropHash3;
  v397 = v41;
  CUAppendF();
  v75 = v10;

  self->_airdropHash3 = v74;
  v7 = 1;
  v10 = v75;
  v43 = objc_msgSend(v4, "airdropHash4", v344, v397);
  airdropHash4 = self->_airdropHash4;
  if (v43 == (_DWORD)airdropHash4)
  {
LABEL_43:
    v45 = objc_msgSend(v4, "airdropConfigData");
    airdropConfigData = self->_airdropConfigData;
    if (v45 == (_DWORD)airdropConfigData)
      goto LABEL_45;
    goto LABEL_44;
  }
LABEL_65:
  v76 = v43;
  v345 = airdropHash4;
  v398 = v43;
  CUAppendF();
  v77 = v10;

  self->_airdropHash4 = v76;
  v7 = 1;
  v10 = v77;
  v45 = objc_msgSend(v4, "airdropConfigData", v345, v398);
  airdropConfigData = self->_airdropConfigData;
  if (v45 != (_DWORD)airdropConfigData)
  {
LABEL_44:
    v47 = v45;
    v337 = airdropConfigData;
    v390 = v45;
    CUAppendF();
    v48 = v10;

    self->_airdropConfigData = v47;
    v7 = 1;
    v10 = v48;
  }
LABEL_45:
  objc_msgSend(v4, "airplaySourceAuthTagData", v337, v390);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  airplaySourceAuthTagData = self->_airplaySourceAuthTagData;
  v51 = v49;
  v52 = airplaySourceAuthTagData;
  if (v51 == v52)
  {

    v57 = v51;
LABEL_69:

    goto LABEL_70;
  }
  v53 = v52;
  if ((v51 == 0) == (v52 != 0))
  {

    goto LABEL_68;
  }
  v54 = -[NSData isEqual:](v51, "isEqual:", v52);

  if ((v54 & 1) == 0)
  {
LABEL_68:
    v7 = 1;
    CUPrintNSDataHex();
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v338 = v78;
    v391 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v79 = v10;

    v80 = v51;
    v57 = self->_airplaySourceAuthTagData;
    self->_airplaySourceAuthTagData = v80;
    v10 = v79;
    goto LABEL_69;
  }
LABEL_70:
  v81 = objc_msgSend(v4, "airplaySourceFlags", v338, v391);
  v454 = v29;
  v455 = v17;
  if (v81 != self->_airplaySourceFlags)
  {
    CUPrintFlags32();
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintFlags32();
    v346 = v82;
    v399 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v83 = v10;

    self->_airplaySourceFlags = v81;
    v7 = 1;
    v10 = v83;
  }
  objc_msgSend(v4, "airplaySourceUWBConfigData", v346, v399);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  airplaySourceUWBConfigData = self->_airplaySourceUWBConfigData;
  v86 = v84;
  v87 = airplaySourceUWBConfigData;
  if (v86 == v87)
  {

    v169 = v86;
  }
  else
  {
    v88 = v87;
    if ((v86 == 0) != (v87 != 0))
    {
      v89 = -[NSData isEqual:](v86, "isEqual:", v87);

      if ((v89 & 1) != 0)
      {
        v90 = objc_msgSend(v4, "airplayTargetConfigSeed");
        airplayTargetConfigSeed = (void *)self->_airplayTargetConfigSeed;
        if (v90 == (_DWORD)airplayTargetConfigSeed)
          goto LABEL_77;
        goto LABEL_76;
      }
    }
    else
    {

    }
    v7 = 1;
    CUPrintNSDataHex();
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v347 = v173;
    v400 = objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v174 = v10;

    v175 = v86;
    v169 = self->_airplaySourceUWBConfigData;
    self->_airplaySourceUWBConfigData = v175;
    v10 = v174;
  }

  v90 = objc_msgSend(v4, "airplayTargetConfigSeed");
  airplayTargetConfigSeed = (void *)self->_airplayTargetConfigSeed;
  if (v90 != (_DWORD)airplayTargetConfigSeed)
  {
LABEL_76:
    v92 = v90;
    v347 = airplayTargetConfigSeed;
    v400 = v90;
    CUAppendF();
    v93 = v10;

    self->_airplayTargetConfigSeed = v92;
    v7 = 1;
    v10 = v93;
  }
LABEL_77:
  v94 = objc_msgSend(v4, "airplayTargetFlags", v347, v400);
  v452 = v86;
  if (v94 != self->_airplayTargetFlags)
  {
    CUPrintFlags32();
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintFlags32();
    v348 = v95;
    v401 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v96 = v10;

    self->_airplayTargetFlags = v94;
    v7 = 1;
    v10 = v96;
  }
  v456 = objc_msgSend(v4, "airplayTargetIPv4", v348, v401);
  if (v456 == self->_airplayTargetIPv4)
  {
    v97 = objc_msgSend(v4, "airplayTargetPort");
    airplayTargetPort = self->_airplayTargetPort;
    if (v97 == (_DWORD)airplayTargetPort)
      goto LABEL_81;
  }
  else
  {
    v7 = 1;
    CUPrintAddress();
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintAddress();
    v409 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v155 = v10;

    self->_airplayTargetIPv4 = v456;
    v10 = v155;
    v97 = objc_msgSend(v4, "airplayTargetPort", v154, v409);
    airplayTargetPort = self->_airplayTargetPort;
    if (v97 == (_DWORD)airplayTargetPort)
    {
LABEL_81:
      v99 = objc_msgSend(v4, "dsActionFlags");
      if (v99 == self->_dsActionFlags)
        goto LABEL_82;
      goto LABEL_113;
    }
  }
  v156 = v97;
  v356 = airplayTargetPort;
  v410 = v97;
  CUAppendF();
  v157 = v10;

  self->_airplayTargetPort = v156;
  v7 = 1;
  v10 = v157;
  v99 = objc_msgSend(v4, "dsActionFlags", v356, v410);
  if (v99 == self->_dsActionFlags)
  {
LABEL_82:
    v100 = objc_msgSend(v4, "dsActionMeasuredPower");
    dsActionMeasuredPower = self->_dsActionMeasuredPower;
    if (v100 == self->_dsActionMeasuredPower)
      goto LABEL_83;
    goto LABEL_114;
  }
LABEL_113:
  CUPrintFlags32();
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintFlags32();
  v411 = (void *)objc_claimAutoreleasedReturnValue();
  CUAppendF();
  v159 = v10;

  self->_dsActionFlags = v99;
  v7 = 1;
  v10 = v159;
  v100 = objc_msgSend(v4, "dsActionMeasuredPower", v158, v411);
  dsActionMeasuredPower = self->_dsActionMeasuredPower;
  if (v100 == self->_dsActionMeasuredPower)
  {
LABEL_83:
    v102 = objc_msgSend(v4, "dsActionTieBreaker");
    dsActionTieBreaker = self->_dsActionTieBreaker;
    if (v102 == (_DWORD)dsActionTieBreaker)
      goto LABEL_84;
    goto LABEL_115;
  }
LABEL_114:
  v160 = v100;
  v357 = dsActionMeasuredPower;
  v412 = v100;
  CUAppendF();
  v161 = v10;

  self->_dsActionMeasuredPower = v160;
  v7 = 1;
  v10 = v161;
  v102 = objc_msgSend(v4, "dsActionTieBreaker", v357, v412);
  dsActionTieBreaker = self->_dsActionTieBreaker;
  if (v102 == (_DWORD)dsActionTieBreaker)
  {
LABEL_84:
    v104 = objc_msgSend(v4, "dsInfoVehicleConfidence");
    dsInfoVehicleConfidence = self->_dsInfoVehicleConfidence;
    if (v104 == (_DWORD)dsInfoVehicleConfidence)
      goto LABEL_85;
    goto LABEL_116;
  }
LABEL_115:
  v162 = v102;
  v358 = dsActionTieBreaker;
  v413 = v102;
  CUAppendF();
  v163 = v10;

  self->_dsActionTieBreaker = v162;
  v7 = 1;
  v10 = v163;
  v104 = objc_msgSend(v4, "dsInfoVehicleConfidence", v358, v413);
  dsInfoVehicleConfidence = self->_dsInfoVehicleConfidence;
  if (v104 == (_DWORD)dsInfoVehicleConfidence)
  {
LABEL_85:
    v106 = objc_msgSend(v4, "dsInfoVehicleState");
    LODWORD(v107) = self->_dsInfoVehicleState;
    if (v106 == (_DWORD)v107)
      goto LABEL_86;
    goto LABEL_117;
  }
LABEL_116:
  v164 = v104;
  v359 = dsInfoVehicleConfidence;
  v414 = v104;
  CUAppendF();
  v165 = v10;

  self->_dsInfoVehicleConfidence = v164;
  v7 = 1;
  v10 = v165;
  v106 = objc_msgSend(v4, "dsInfoVehicleState", v359, v414);
  LODWORD(v107) = self->_dsInfoVehicleState;
  if (v106 == (_DWORD)v107)
  {
LABEL_86:
    v108 = objc_msgSend(v4, "enableEPAForLEAdvertisement");
    v109 = self->_enableEPAForLEAdvertisement;
    if (v109 == v108)
      goto LABEL_88;
    goto LABEL_87;
  }
LABEL_117:
  v166 = v106;
  v107 = (char)v107;
  if ((char)v107 > 2)
  {
    v167 = "?";
    if (v106 > 2)
      goto LABEL_119;
  }
  else
  {
    v167 = off_1E5400280[v107];
    if (v106 > 2)
    {
LABEL_119:
      v168 = "?";
      goto LABEL_243;
    }
  }
  v168 = off_1E5400280[(char)v106];
LABEL_243:
  v378 = v167;
  v435 = v168;
  CUAppendF();
  v314 = v10;

  self->_dsInfoVehicleState = v166;
  v7 = 1;
  v10 = v314;
  v108 = objc_msgSend(v4, "enableEPAForLEAdvertisement", v378, v435);
  v109 = self->_enableEPAForLEAdvertisement;
  if (v109 != v108)
  {
LABEL_87:
    v110 = v108;
    v349 = v109;
    v402 = v108;
    CUAppendF();
    v111 = v10;

    self->_enableEPAForLEAdvertisement = v110;
    v7 = 1;
    v10 = v111;
  }
LABEL_88:
  objc_msgSend(v4, "fidoPayloadData", v349, v402);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  fidoPayloadData = self->_fidoPayloadData;
  v114 = v112;
  v115 = fidoPayloadData;
  if (v114 == v115)
  {

    v170 = v114;
  }
  else
  {
    v116 = v115;
    if ((v114 == 0) != (v115 != 0))
    {
      v117 = -[NSData isEqual:](v114, "isEqual:", v115);

      if ((v117 & 1) != 0)
      {
        v118 = objc_msgSend(v4, "heySiriConfidence");
        heySiriConfidence = self->_heySiriConfidence;
        if (v118 == (_DWORD)heySiriConfidence)
          goto LABEL_92;
        goto LABEL_131;
      }
    }
    else
    {

    }
    v7 = 1;
    CUPrintNSDataHex();
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v350 = v176;
    v403 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v177 = v10;

    v178 = v114;
    v170 = self->_fidoPayloadData;
    self->_fidoPayloadData = v178;
    v10 = v177;
  }

  v118 = objc_msgSend(v4, "heySiriConfidence");
  heySiriConfidence = self->_heySiriConfidence;
  if (v118 == (_DWORD)heySiriConfidence)
  {
LABEL_92:
    v120 = objc_msgSend(v4, "heySiriDeviceClass", v350, v403);
    LODWORD(v121) = self->_heySiriDeviceClass;
    if (v120 == (_DWORD)v121)
      goto LABEL_93;
    goto LABEL_132;
  }
LABEL_131:
  v179 = v118;
  v360 = heySiriConfidence;
  v415 = v118;
  CUAppendF();
  v180 = v10;

  self->_heySiriConfidence = v179;
  v7 = 1;
  v10 = v180;
  v120 = objc_msgSend(v4, "heySiriDeviceClass", v360, v415);
  LODWORD(v121) = self->_heySiriDeviceClass;
  if (v120 == (_DWORD)v121)
  {
LABEL_93:
    v122 = objc_msgSend(v4, "heySiriPerceptualHash");
    heySiriPerceptualHash = self->_heySiriPerceptualHash;
    if (v122 == (_DWORD)heySiriPerceptualHash)
      goto LABEL_94;
    goto LABEL_248;
  }
LABEL_132:
  v181 = v120;
  v121 = (__int16)v121;
  if ((__int16)v121 > 0xA)
  {
    v182 = "?";
    if (v120 > 0xA)
      goto LABEL_134;
  }
  else
  {
    v182 = off_1E5400298[v121];
    if (v120 > 0xA)
    {
LABEL_134:
      v183 = "?";
      goto LABEL_247;
    }
  }
  v183 = off_1E5400298[(__int16)v120];
LABEL_247:
  v379 = v182;
  v436 = v183;
  CUAppendF();
  v315 = v10;

  self->_heySiriDeviceClass = v181;
  v7 = 1;
  v10 = v315;
  v122 = objc_msgSend(v4, "heySiriPerceptualHash", v379, v436);
  heySiriPerceptualHash = self->_heySiriPerceptualHash;
  if (v122 == (_DWORD)heySiriPerceptualHash)
  {
LABEL_94:
    v124 = objc_msgSend(v4, "heySiriProductType");
    LODWORD(v125) = self->_heySiriProductType;
    if (v124 == (_DWORD)v125)
      goto LABEL_95;
    goto LABEL_249;
  }
LABEL_248:
  v316 = v122;
  v380 = heySiriPerceptualHash;
  v437 = v122;
  CUAppendF();
  v317 = v10;

  self->_heySiriPerceptualHash = v316;
  v7 = 1;
  v10 = v317;
  v124 = objc_msgSend(v4, "heySiriProductType", v380, v437);
  LODWORD(v125) = self->_heySiriProductType;
  if (v124 == (_DWORD)v125)
  {
LABEL_95:
    v126 = objc_msgSend(v4, "heySiriRandom");
    heySiriRandom = self->_heySiriRandom;
    if (v126 == (_DWORD)heySiriRandom)
      goto LABEL_96;
    goto LABEL_261;
  }
LABEL_249:
  v318 = v124;
  v125 = (char)v125;
  if ((char)v125 > 4)
  {
    v319 = "?";
    if (v124 > 4)
      goto LABEL_251;
  }
  else
  {
    v319 = off_1E54002F0[v125];
    if (v124 > 4)
    {
LABEL_251:
      v320 = "?";
      goto LABEL_260;
    }
  }
  v320 = off_1E54002F0[(char)v124];
LABEL_260:
  v382 = v319;
  v439 = v320;
  CUAppendF();
  v325 = v10;

  self->_heySiriProductType = v318;
  v7 = 1;
  v10 = v325;
  v126 = objc_msgSend(v4, "heySiriRandom", v382, v439);
  heySiriRandom = self->_heySiriRandom;
  if (v126 == (_DWORD)heySiriRandom)
  {
LABEL_96:
    v128 = objc_msgSend(v4, "heySiriSNR");
    heySiriSNR = self->_heySiriSNR;
    if (v128 == (_DWORD)heySiriSNR)
      goto LABEL_98;
    goto LABEL_97;
  }
LABEL_261:
  v326 = v126;
  v383 = heySiriRandom;
  v440 = v126;
  CUAppendF();
  v327 = v10;

  self->_heySiriRandom = v326;
  v7 = 1;
  v10 = v327;
  v128 = objc_msgSend(v4, "heySiriSNR", v383, v440);
  heySiriSNR = self->_heySiriSNR;
  if (v128 != (_DWORD)heySiriSNR)
  {
LABEL_97:
    v130 = v128;
    v351 = heySiriSNR;
    v404 = v128;
    CUAppendF();
    v131 = v10;

    self->_heySiriSNR = v130;
    v7 = 1;
    v10 = v131;
  }
LABEL_98:
  objc_msgSend(v4, "nearbyActionAuthTagData", v351, v404);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  nearbyActionAuthTagData = self->_nearbyActionAuthTagData;
  v134 = v132;
  v135 = nearbyActionAuthTagData;
  if (v134 == v135)
  {

    v171 = v134;
  }
  else
  {
    v136 = v135;
    if ((v134 == 0) != (v135 != 0))
    {
      v137 = -[NSData isEqual:](v134, "isEqual:", v135);

      if ((v137 & 1) != 0)
      {
        v138 = objc_msgSend(v4, "nearbyActionColorCode");
        nearbyActionColorCode = (void *)self->_nearbyActionColorCode;
        if (v138 == (_DWORD)nearbyActionColorCode)
          goto LABEL_103;
        goto LABEL_102;
      }
    }
    else
    {

    }
    v7 = 1;
    CUPrintNSDataHex();
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v352 = v184;
    v405 = objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v185 = v10;

    v186 = v134;
    v171 = self->_nearbyActionAuthTagData;
    self->_nearbyActionAuthTagData = v186;
    v10 = v185;
  }

  v138 = objc_msgSend(v4, "nearbyActionColorCode");
  nearbyActionColorCode = (void *)self->_nearbyActionColorCode;
  if (v138 != (_DWORD)nearbyActionColorCode)
  {
LABEL_102:
    v140 = v138;
    v352 = nearbyActionColorCode;
    v405 = v138;
    CUAppendF();
    v141 = v10;

    self->_nearbyActionColorCode = v140;
    v7 = 1;
    v10 = v141;
  }
LABEL_103:
  v142 = objc_msgSend(v4, "nearbyActionFlags", v352, v405);
  v450 = v134;
  v451 = v114;
  if (v142 != self->_nearbyActionFlags)
  {
    CUPrintFlags32();
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintFlags32();
    v353 = v143;
    v406 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v144 = v10;

    self->_nearbyActionFlags = v142;
    v7 = 1;
    v10 = v144;
  }
  v145 = objc_msgSend(v4, "nearbyActionType", v353, v406);
  nearbyActionType = self->_nearbyActionType;
  if (v145 != nearbyActionType)
  {
    v354 = CBNearbyActionTypeToString(nearbyActionType);
    v407 = CBNearbyActionTypeToString(v145);
    CUAppendF();
    v147 = v10;

    self->_nearbyActionType = v145;
    v7 = 1;
    v10 = v147;
  }
  objc_msgSend(v4, "nearbyActionTargetData", v354, v407);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  nearbyActionTargetData = self->_nearbyActionTargetData;
  v150 = v148;
  v151 = nearbyActionTargetData;
  if (v150 == v151)
  {

    v172 = v150;
LABEL_141:

    goto LABEL_142;
  }
  v152 = v151;
  if ((v150 == 0) == (v151 != 0))
  {

    goto LABEL_140;
  }
  v153 = -[NSData isEqual:](v150, "isEqual:", v151);

  if ((v153 & 1) == 0)
  {
LABEL_140:
    v7 = 1;
    CUPrintNSDataHex();
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v355 = v187;
    v408 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v188 = v10;

    v189 = v150;
    v172 = self->_nearbyActionTargetData;
    self->_nearbyActionTargetData = v189;
    v10 = v188;
    goto LABEL_141;
  }
LABEL_142:
  v190 = objc_msgSend(v4, "nearbyActionV2Flags", v355, v408);
  v449 = v150;
  if (v190 != self->_nearbyActionV2Flags)
  {
    CUPrintFlags32();
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintFlags32();
    v361 = v191;
    v416 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v192 = v10;

    self->_nearbyActionV2Flags = v190;
    v7 = 1;
    v10 = v192;
  }
  objc_msgSend(v4, "nearbyActionV2TargetData", v361, v416);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  nearbyActionV2TargetData = self->_nearbyActionV2TargetData;
  v195 = v193;
  v196 = nearbyActionV2TargetData;
  if (v195 == v196)
  {

    v226 = v195;
  }
  else
  {
    v197 = v196;
    if ((v195 == 0) != (v196 != 0))
    {
      v198 = -[NSData isEqual:](v195, "isEqual:", v196);

      if ((v198 & 1) != 0)
      {
        v199 = objc_msgSend(v4, "nearbyActionV2Type");
        nearbyActionV2Type = self->_nearbyActionV2Type;
        if (v199 == nearbyActionV2Type)
          goto LABEL_149;
        goto LABEL_148;
      }
    }
    else
    {

    }
    v7 = 1;
    CUPrintNSDataHex();
    v228 = (char *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v362 = v228;
    v417 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v229 = v10;

    v230 = v195;
    v226 = self->_nearbyActionV2TargetData;
    self->_nearbyActionV2TargetData = v230;
    v10 = v229;
  }

  v199 = objc_msgSend(v4, "nearbyActionV2Type");
  nearbyActionV2Type = self->_nearbyActionV2Type;
  if (v199 != nearbyActionV2Type)
  {
LABEL_148:
    v362 = CBNearbyActionTypeToString(nearbyActionV2Type);
    v417 = (void *)CBNearbyActionTypeToString(v199);
    CUAppendF();
    v201 = v10;

    self->_nearbyActionV2Type = v199;
    v7 = 1;
    v10 = v201;
  }
LABEL_149:
  v202 = objc_msgSend(v4, "nearbyInfoFlags", v362, v417);
  v448 = v195;
  if (v202 != self->_nearbyInfoFlags)
  {
    CUPrintFlags32();
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintFlags32();
    v363 = v203;
    v418 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v204 = v10;

    self->_nearbyInfoFlags = v202;
    v7 = 1;
    v10 = v204;
  }
  objc_msgSend(v4, "nearbyInfoStatusProgress", v363, v418);
  v206 = v205;
  nearbyInfoStatusProgress = self->_nearbyInfoStatusProgress;
  if (v206 != nearbyInfoStatusProgress)
  {
    v364 = nearbyInfoStatusProgress * 100.0;
    v419 = v206 * 100.0;
    CUAppendF();
    v208 = v10;

    self->_nearbyInfoStatusProgress = v206;
    v7 = 1;
    v10 = v208;
  }
  v209 = objc_msgSend(v4, "nearbyInfoStatusTime", *(_QWORD *)&v364, *(_QWORD *)&v419);
  LODWORD(v210) = self->_nearbyInfoStatusTime;
  if (v209 == (_DWORD)v210)
  {
    v211 = objc_msgSend(v4, "nearbyInfoStatusType");
    LODWORD(v212) = self->_nearbyInfoStatusType;
    if (v211 == (_DWORD)v212)
      goto LABEL_155;
    goto LABEL_255;
  }
  v223 = v209;
  v210 = (char)v210;
  if ((char)v210 > 0xE)
  {
    v224 = "?";
    if (v209 > 0xE)
      goto LABEL_164;
  }
  else
  {
    v224 = off_1E5400318[v210];
    if (v209 > 0xE)
    {
LABEL_164:
      v225 = "?";
      goto LABEL_254;
    }
  }
  v225 = off_1E5400318[(char)v209];
LABEL_254:
  v381 = v224;
  v438 = v225;
  CUAppendF();
  v321 = v10;

  self->_nearbyInfoStatusTime = v223;
  v7 = 1;
  v10 = v321;
  v211 = objc_msgSend(v4, "nearbyInfoStatusType", v381, v438);
  LODWORD(v212) = self->_nearbyInfoStatusType;
  if (v211 == (_DWORD)v212)
  {
LABEL_155:
    v213 = objc_msgSend(v4, "nearbyInfoV2DecryptedFlags");
    if (v213 == self->_nearbyInfoV2DecryptedFlags)
      goto LABEL_156;
    goto LABEL_266;
  }
LABEL_255:
  v322 = v211;
  v212 = (char)v212;
  if ((char)v212 > 0xD)
  {
    v323 = "?";
    if (v211 > 0xD)
      goto LABEL_257;
  }
  else
  {
    v323 = off_1E5400390[v212];
    if (v211 > 0xD)
    {
LABEL_257:
      v324 = "?";
      goto LABEL_265;
    }
  }
  v324 = off_1E5400390[(char)v211];
LABEL_265:
  v384 = v323;
  v441 = v324;
  CUAppendF();
  v328 = v10;

  self->_nearbyInfoStatusType = v322;
  v7 = 1;
  v10 = v328;
  v213 = objc_msgSend(v4, "nearbyInfoV2DecryptedFlags", v384, v441);
  if (v213 == self->_nearbyInfoV2DecryptedFlags)
  {
LABEL_156:
    v214 = objc_msgSend(v4, "nearbyInfoV2Flags");
    if (v214 == self->_nearbyInfoV2Flags)
      goto LABEL_158;
    goto LABEL_157;
  }
LABEL_266:
  CUPrintFlags32();
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintFlags32();
  v442 = (void *)objc_claimAutoreleasedReturnValue();
  CUAppendF();
  v330 = v10;

  self->_nearbyInfoV2DecryptedFlags = v213;
  v7 = 1;
  v10 = v330;
  v214 = objc_msgSend(v4, "nearbyInfoV2Flags", v329, v442);
  if (v214 != self->_nearbyInfoV2Flags)
  {
LABEL_157:
    CUPrintFlags32();
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintFlags32();
    v365 = v215;
    v420 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v216 = v10;

    self->_nearbyInfoV2Flags = v214;
    v7 = 1;
    v10 = v216;
  }
LABEL_158:
  objc_msgSend(v4, "nearbyInfoV2AuthIntegrityTagData", v365, v420);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  nearbyInfoV2AuthIntegrityTagData = self->_nearbyInfoV2AuthIntegrityTagData;
  v219 = v217;
  v220 = nearbyInfoV2AuthIntegrityTagData;
  if (v219 == v220)
  {

    v227 = v219;
LABEL_173:

    goto LABEL_174;
  }
  v221 = v220;
  if ((v219 == 0) == (v220 != 0))
  {

    goto LABEL_172;
  }
  v222 = -[NSData isEqual:](v219, "isEqual:", v220);

  if ((v222 & 1) == 0)
  {
LABEL_172:
    v7 = 1;
    CUPrintNSDataHex();
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v366 = v231;
    v421 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v232 = v10;

    v233 = v219;
    v227 = self->_nearbyInfoV2AuthIntegrityTagData;
    self->_nearbyInfoV2AuthIntegrityTagData = v233;
    v10 = v232;
    goto LABEL_173;
  }
LABEL_174:
  objc_msgSend(v4, "nearbyInfoV2AuthTagData", v366, v421);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  nearbyInfoV2AuthTagData = self->_nearbyInfoV2AuthTagData;
  v236 = v234;
  v237 = nearbyInfoV2AuthTagData;
  if (v236 == v237)
  {

    v262 = v236;
  }
  else
  {
    v238 = v237;
    if ((v236 == 0) != (v237 != 0))
    {
      v239 = -[NSData isEqual:](v236, "isEqual:", v237);

      if ((v239 & 1) != 0)
      {
        v240 = objc_msgSend(v4, "nearbyInfoV2InvitationCounter");
        nearbyInfoV2InvitationCounter = self->_nearbyInfoV2InvitationCounter;
        if (v240 == (_DWORD)nearbyInfoV2InvitationCounter)
          goto LABEL_178;
        goto LABEL_203;
      }
    }
    else
    {

    }
    v7 = 1;
    CUPrintNSDataHex();
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v367 = v264;
    v422 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v265 = v10;

    v266 = v236;
    v262 = self->_nearbyInfoV2AuthTagData;
    self->_nearbyInfoV2AuthTagData = v266;
    v10 = v265;
  }

  v240 = objc_msgSend(v4, "nearbyInfoV2InvitationCounter");
  nearbyInfoV2InvitationCounter = self->_nearbyInfoV2InvitationCounter;
  if (v240 == (_DWORD)nearbyInfoV2InvitationCounter)
  {
LABEL_178:
    v242 = objc_msgSend(v4, "nearbyInfoV2InvitationTypes", v367, v422);
    nearbyInfoV2InvitationTypes = self->_nearbyInfoV2InvitationTypes;
    if (v242 == (_DWORD)nearbyInfoV2InvitationTypes)
      goto LABEL_179;
    goto LABEL_204;
  }
LABEL_203:
  v267 = v240;
  v371 = nearbyInfoV2InvitationCounter;
  v426 = v240;
  CUAppendF();
  v268 = v10;

  self->_nearbyInfoV2InvitationCounter = v267;
  v7 = 1;
  v10 = v268;
  v242 = objc_msgSend(v4, "nearbyInfoV2InvitationTypes", v371, v426);
  nearbyInfoV2InvitationTypes = self->_nearbyInfoV2InvitationTypes;
  if (v242 == (_DWORD)nearbyInfoV2InvitationTypes)
  {
LABEL_179:
    v244 = objc_msgSend(v4, "nearbyInfoV2InvitationRouteType");
    nearbyInfoV2InvitationRouteType = self->_nearbyInfoV2InvitationRouteType;
    if (v244 == (_DWORD)nearbyInfoV2InvitationRouteType)
      goto LABEL_180;
LABEL_205:
    v271 = v244;
    v373 = nearbyInfoV2InvitationRouteType;
    v428 = v244;
    CUAppendF();
    v272 = v10;

    self->_nearbyInfoV2InvitationRouteType = v271;
    v7 = 1;
    v10 = v272;
    v246 = objc_msgSend(v4, "nearbyActionNoWakeType", v373, v428);
    nearbyActionNoWakeType = self->_nearbyActionNoWakeType;
    if (v246 == nearbyActionNoWakeType)
      goto LABEL_192;
    goto LABEL_181;
  }
LABEL_204:
  v269 = v242;
  v372 = nearbyInfoV2InvitationTypes;
  v427 = v242;
  CUAppendF();
  v270 = v10;

  self->_nearbyInfoV2InvitationTypes = v269;
  v7 = 1;
  v10 = v270;
  v244 = objc_msgSend(v4, "nearbyInfoV2InvitationRouteType", v372, v427);
  nearbyInfoV2InvitationRouteType = self->_nearbyInfoV2InvitationRouteType;
  if (v244 != (_DWORD)nearbyInfoV2InvitationRouteType)
    goto LABEL_205;
LABEL_180:
  v246 = objc_msgSend(v4, "nearbyActionNoWakeType");
  nearbyActionNoWakeType = self->_nearbyActionNoWakeType;
  if (v246 == nearbyActionNoWakeType)
    goto LABEL_192;
LABEL_181:
  v248 = v246;
  v249 = "?";
  if (nearbyActionNoWakeType == 1)
    v250 = "PrecisionFinding";
  else
    v250 = "?";
  if (nearbyActionNoWakeType)
    v251 = v250;
  else
    v251 = "Unspecified";
  if (v246 == 1)
    v249 = "PrecisionFinding";
  if (!v246)
    v249 = "Unspecified";
  v368 = v251;
  v423 = v249;
  CUAppendF();
  v252 = v10;

  self->_nearbyActionNoWakeType = v248;
  v7 = 1;
  v10 = v252;
LABEL_192:
  v253 = objc_msgSend(v4, "nearbyActionNWPrecisionFindingStatus", v368, v423);
  v446 = v236;
  v447 = v219;
  if (v253 != self->_nearbyActionNWPrecisionFindingStatus)
  {
    CUPrintFlags32();
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintFlags32();
    v369 = v254;
    v424 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v255 = v10;

    self->_nearbyActionNWPrecisionFindingStatus = v253;
    v7 = 1;
    v10 = v255;
  }
  objc_msgSend(v4, "nearbyActionNoWakeAuthTagData", v369, v424);
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  nearbyActionNoWakeAuthTagData = self->_nearbyActionNoWakeAuthTagData;
  v258 = v256;
  v259 = nearbyActionNoWakeAuthTagData;
  if (v258 == v259)
  {

    v263 = v258;
LABEL_209:

    goto LABEL_210;
  }
  v260 = v259;
  if ((v258 == 0) == (v259 != 0))
  {

    goto LABEL_208;
  }
  v261 = -[NSData isEqual:](v258, "isEqual:", v259);

  if ((v261 & 1) == 0)
  {
LABEL_208:
    v7 = 1;
    CUPrintNSDataHex();
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v370 = v273;
    v425 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v274 = v10;

    v275 = v258;
    v263 = self->_nearbyActionNoWakeAuthTagData;
    self->_nearbyActionNoWakeAuthTagData = v275;
    v10 = v274;
    goto LABEL_209;
  }
LABEL_210:
  objc_msgSend(v4, "nearbyActionNoWakeConfigData", v370, v425);
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  nearbyActionNoWakeConfigData = self->_nearbyActionNoWakeConfigData;
  v278 = v276;
  v279 = nearbyActionNoWakeConfigData;
  if (v278 == v279)
  {

    v282 = v278;
LABEL_217:

    goto LABEL_218;
  }
  v280 = v279;
  if ((v278 == 0) == (v279 != 0))
  {

    goto LABEL_216;
  }
  v281 = -[NSData isEqual:](v278, "isEqual:", v279);

  if ((v281 & 1) == 0)
  {
LABEL_216:
    v7 = 1;
    CUPrintNSDataHex();
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v374 = v283;
    v429 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v284 = v10;

    v285 = v278;
    v282 = self->_nearbyActionNoWakeConfigData;
    self->_nearbyActionNoWakeConfigData = v285;
    v10 = v284;
    goto LABEL_217;
  }
LABEL_218:
  v444 = v278;
  v453 = v51;
  objc_msgSend(v4, "safetyAlertsAlertData", v374, v429);
  v286 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (v286 != self->_safetyAlertsAlertData)
  {
    v7 = 1;
    CUPrintNSDataHex();
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v375 = v287;
    v430 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v288 = v10;

    objc_storeStrong((id *)&self->_safetyAlertsAlertData, v286);
    v10 = v288;
  }
  v445 = v258;
  objc_msgSend(v4, "safetyAlertsAlertID", v375, v430);
  v289 = (NSData *)objc_claimAutoreleasedReturnValue();
  v443 = v289;
  if (v289 != self->_safetyAlertsAlertID)
  {
    v7 = 1;
    CUPrintNSDataHex();
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v376 = v290;
    v431 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v291 = v10;

    objc_storeStrong((id *)&self->_safetyAlertsAlertID, v289);
    v10 = v291;
  }
  v292 = v286;
  objc_msgSend(v4, "safetyAlertsSignature", v376, v431);
  v293 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (v293 == self->_safetyAlertsSignature)
  {
    v294 = v7;
    v297 = objc_msgSend(v4, "safetyAlertsVersion");
    safetyAlertsVersion = self->_safetyAlertsVersion;
    if (v297 == (_DWORD)safetyAlertsVersion)
      goto LABEL_224;
  }
  else
  {
    v294 = 1;
    CUPrintNSDataHex();
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v433 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v296 = v10;

    objc_storeStrong((id *)&self->_safetyAlertsSignature, v293);
    v10 = v296;
    v297 = objc_msgSend(v4, "safetyAlertsVersion", v295, v433);
    safetyAlertsVersion = self->_safetyAlertsVersion;
    if (v297 == (_DWORD)safetyAlertsVersion)
    {
LABEL_224:
      v299 = v294;
      goto LABEL_227;
    }
  }
  v300 = v297;
  v377 = safetyAlertsVersion;
  v432 = v297;
  CUAppendF();
  v301 = v10;

  self->_safetyAlertsVersion = v300;
  v299 = 1;
  v10 = v301;
LABEL_227:
  objc_msgSend(v4, "watchSetupData", v377, v432);
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  watchSetupData = self->_watchSetupData;
  v304 = v302;
  v305 = watchSetupData;
  if (v304 == v305)
  {

    v308 = v453;
    var0 = self->_ucat->var0;
    if (v10)
      goto LABEL_231;
LABEL_238:
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
      goto LABEL_240;
    goto LABEL_271;
  }
  v306 = v305;
  if ((v304 == 0) == (v305 != 0))
  {

LABEL_237:
    CUPrintNSDataHex();
    v310 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v434 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v311 = v10;

    v312 = v304;
    v313 = self->_watchSetupData;
    self->_watchSetupData = v312;
    v10 = v311;
    v299 = 1;

    v308 = v453;
    var0 = self->_ucat->var0;
    if (v10)
      goto LABEL_231;
    goto LABEL_238;
  }
  v307 = -[NSData isEqual:](v304, "isEqual:", v305);

  if ((v307 & 1) == 0)
    goto LABEL_237;
  v308 = v453;
  var0 = self->_ucat->var0;
  if (!v10)
    goto LABEL_238;
LABEL_231:
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
LABEL_240:
    LogPrintF_safe();
LABEL_271:

  return v299;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  CBAdvertiser *v5;
  uint64_t v6;
  id activateCompletion;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_activateCalled)
  {
    v5->_activateCalled = 1;
    v6 = MEMORY[0x1A85D1CE4](v4);
    activateCompletion = v5->_activateCompletion;
    v5->_activateCompletion = (id)v6;

    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__CBAdvertiser_activateWithCompletion___block_invoke;
    block[3] = &unk_1E53FF780;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);

}

uint64_t __39__CBAdvertiser_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  NSString *v3;
  void (**v4)(_QWORD, _QWORD);
  id activateCompletion;
  BOOL v6;
  _BOOL4 v7;
  int var0;
  void (**v9)(_QWORD, _QWORD);
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSString *v14;

  v3 = self->_mockID;
  v14 = v3;
  if (v3)
  {
    CBMockAddOrUpdateAdvertiser(v3, self);
    v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_activateCompletion);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v4)
      v4[2](v4, 0);
LABEL_27:

    return;
  }
  if (self->_bluetoothStateChangedHandler)
    self->_internalFlags |= 1u;
  if (self->_xpcListenerEndpoint)
    v6 = 1;
  else
    v6 = gCBDaemonServer == 0;
  v7 = !v6;
  self->_direct = v7;
  if (self->_invalidateCalled)
  {
    NSErrorF();
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_activateCompletion);
    v10 = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v9)
    {
      v9[2](v9, v4);
    }
    else
    {
      v11 = MEMORY[0x1A85D1CE4](self->_errorHandler);
      v12 = (void *)v11;
      if (v11)
        (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, v4);

    }
    goto LABEL_27;
  }
  if (v7)
    -[CBAdvertiser _activateDirectStart](self, "_activateDirectStart");
  else
    -[CBAdvertiser _activateXPCStart:](self, "_activateXPCStart:", 0);

}

- (void)_activateDirectStart
{
  int var0;
  uint64_t clientID;
  _QWORD v5[5];

  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    clientID = self->_clientID;
    LogPrintF_safe();
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__CBAdvertiser__activateDirectStart__block_invoke;
  v5[3] = &unk_1E53FFB18;
  v5[4] = self;
  objc_msgSend((id)gCBDaemonServer, "activateCBAdvertiser:completion:", self, v5, clientID);
}

void __36__CBAdvertiser__activateDirectStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 176);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__CBAdvertiser__activateDirectStart__block_invoke_2;
  v7[3] = &unk_1E53FF5A0;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __36__CBAdvertiser__activateDirectStart__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))MEMORY[0x1A85D1CE4](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    if (v4 <= 90 && (v4 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    if (v9)
    {
      v9[2](v9, *(_QWORD *)(a1 + 40));
    }
    else
    {
      v5 = MEMORY[0x1A85D1CE4](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 184));
      v6 = (void *)v5;
      if (v5)
        (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 40));

    }
    goto LABEL_17;
  }
  if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  v7 = v9;
  if (v9)
  {
    v9[2](v9, 0);
LABEL_17:
    v7 = v9;
  }

}

- (void)_activateXPCStart:(BOOL)a3
{
  int var0;
  xpc_object_t v5;
  _xpc_connection_s *v6;
  NSObject *dispatchQueue;
  _QWORD handler[5];

  var0 = self->_ucat->var0;
  if (a3)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
LABEL_7:
      LogPrintF_safe();
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  v5 = xpc_dictionary_create(0, 0, 0);
  -[CBAdvertiser encodeWithXPCObject:](self, "encodeWithXPCObject:", v5);
  xpc_dictionary_set_string(v5, "mTyp", "AdvA");
  -[CBAdvertiser _ensureXPCStarted](self, "_ensureXPCStarted");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __34__CBAdvertiser__activateXPCStart___block_invoke;
  handler[3] = &unk_1E53FFB40;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v6, v5, dispatchQueue, handler);

}

uint64_t __34__CBAdvertiser__activateXPCStart___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateXPCCompleted:", a2);
}

- (void)_activateXPCCompleted:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  uint64_t v6;
  void *v7;
  int var0;
  void (**v9)(_QWORD, _QWORD);
  id activateCompletion;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38__CBAdvertiser__activateXPCCompleted___block_invoke;
  v11[3] = &unk_1E53FF8C0;
  v11[4] = self;
  v11[5] = &v12;
  v5 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v11);
  CUXPCDecodeNSErrorIfNeeded();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v13[5];
  v13[5] = v6;

  if (!v13[5])
  {
    CUXPCDecodeNSData();
    CUXPCDecodeNSData();
    self->_bluetoothState = xpc_dictionary_get_int64(v4, "pwrS");
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_activateCompletion);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v9)
      v9[2](v9, 0);

  }
  v5[2](v5);

  _Block_object_dispose(&v12, 8);
}

void __38__CBAdvertiser__activateXPCCompleted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void (**v10)(id, _QWORD);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = **(_DWORD **)(v2 + 32);
    if (v3 <= 90)
    {
      if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v4))
      {
        CUPrintNSError();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 32);
      }
    }
    v10 = (void (**)(id, _QWORD))MEMORY[0x1A85D1CE4](*(_QWORD *)(v2 + 16));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = 0;

    if (v10)
    {
      v10[2](v10, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    }
    else
    {
      v7 = MEMORY[0x1A85D1CE4](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 184));
      v8 = (void *)v7;
      if (v7)
        (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    }
  }
}

- (id)_ensureXPCStarted
{
  OS_xpc_object **p_xpcCnx;
  OS_xpc_object *v4;
  OS_xpc_object *v5;
  OS_xpc_object *v6;
  _xpc_connection_s *mach_service;
  _xpc_connection_s *v8;
  _QWORD v10[5];
  _xpc_connection_s *v11;

  p_xpcCnx = &self->_xpcCnx;
  v4 = self->_xpcCnx;
  if (v4)
    return v4;
  v5 = self->_xpcListenerEndpoint;
  v6 = v5;
  if (v5)
  {
    mach_service = xpc_connection_create_from_endpoint(v5);
    xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)self->_dispatchQueue);
  }
  else
  {
    mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", (dispatch_queue_t)self->_dispatchQueue, 0);
  }
  objc_storeStrong((id *)p_xpcCnx, mach_service);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __33__CBAdvertiser__ensureXPCStarted__block_invoke;
  v10[3] = &unk_1E53FFB68;
  v10[4] = self;
  v8 = mach_service;
  v11 = v8;
  xpc_connection_set_event_handler(v8, v10);
  xpc_connection_activate(v8);

  return v8;
}

_QWORD *__33__CBAdvertiser__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[5] == *(_QWORD *)(a1 + 40))
    return (_QWORD *)objc_msgSend(result, "xpcReceivedMessage:", a2);
  return result;
}

- (void)_interrupted
{
  int var0;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (!self->_invalidateCalled)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v4 = MEMORY[0x1A85D1CE4](self->_interruptionHandler);
    v5 = (void *)v4;
    if (v4)
      (*(void (**)(uint64_t))(v4 + 16))(v4);

    self->_bluetoothState = 1;
    v6 = MEMORY[0x1A85D1CE4](self->_bluetoothStateChangedHandler);
    v7 = (void *)v6;
    if (v6)
      (*(void (**)(uint64_t))(v6 + 16))(v6);

    -[CBAdvertiser _activateXPCStart:](self, "_activateXPCStart:", 1);
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__CBAdvertiser_invalidate__block_invoke;
  block[3] = &unk_1E53FF780;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __26__CBAdvertiser_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  int v4;
  int v5;
  id v6;
  uint64_t v7;
  _xpc_connection_s *v8;
  uint64_t v9;
  id v10;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 26))
  {
    *(_BYTE *)(v1 + 26) = 1;
    v3 = *(_QWORD *)(a1 + 32);
    v4 = **(_DWORD **)(v3 + 32);
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = *(_QWORD *)(a1 + 32), v5))
      {
        v9 = v3;
        LogPrintF_safe();
        v3 = *(_QWORD *)(a1 + 32);
      }
    }
    v6 = *(id *)(v3 + 248);
    v10 = v6;
    if (v6)
      CBMockRemoveAdvertiser(v6, *(void **)(a1 + 32));
    v7 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v7 + 25))
    {
      objc_msgSend((id)v7, "_invalidateDirect");
      v7 = *(_QWORD *)(a1 + 32);
    }
    v8 = *(_xpc_connection_s **)(v7 + 40);
    if (v8)
      xpc_connection_cancel(v8);
    objc_msgSend(*(id *)(a1 + 32), "_invalidated", v9);

  }
}

- (void)_invalidateDirect
{
  objc_msgSend((id)gCBDaemonServer, "invalidateCBAdvertiser:completion:");
}

void __33__CBAdvertiser__invalidateDirect__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 176);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CBAdvertiser__invalidateDirect__block_invoke_2;
  block[3] = &unk_1E53FF780;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __33__CBAdvertiser__invalidateDirect__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_invalidated
{
  void (**invalidationHandler)(id, SEL);
  id advertisingAddressChangedHandler;
  id bluetoothStateChangedHandler;
  id errorHandler;
  id interruptionHandler;
  id v8;
  int var0;

  if (self->_invalidateCalled && !self->_invalidateDone && !self->_direct && !self->_xpcCnx)
  {
    self->_invalidateCalled = 1;
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2](invalidationHandler, a2);
    advertisingAddressChangedHandler = self->_advertisingAddressChangedHandler;
    self->_advertisingAddressChangedHandler = 0;

    bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
    self->_bluetoothStateChangedHandler = 0;

    errorHandler = self->_errorHandler;
    self->_errorHandler = 0;

    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v8 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
  }
}

- (void)_updateIfNeededWithBlock:(id)a3
{
  uint64_t (**v4)(_QWORD);
  CBAdvertiser *v5;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = (uint64_t (**)(_QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  if ((v4[2](v4) & 1) != 0 && v5->_activateCalled && !v5->_changesPending)
  {
    v5->_changesPending = 1;
    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__CBAdvertiser__updateIfNeededWithBlock___block_invoke;
    block[3] = &unk_1E53FF780;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);

}

uint64_t __41__CBAdvertiser__updateIfNeededWithBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

- (void)_update
{
  CBAdvertiser *v2;
  _BOOL4 changesPending;
  int var0;
  _xpc_connection_s *v5;
  xpc_object_t xdict;

  if (!self->_invalidateCalled)
  {
    v2 = self;
    objc_sync_enter(v2);
    changesPending = v2->_changesPending;
    v2->_changesPending = 0;
    objc_sync_exit(v2);

    var0 = v2->_ucat->var0;
    if (changesPending)
    {
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      xdict = xpc_dictionary_create(0, 0, 0);
      -[CBAdvertiser encodeWithXPCObject:](v2, "encodeWithXPCObject:", xdict);
      xpc_dictionary_set_string(xdict, "mTyp", "AdvU");
      -[CBAdvertiser _ensureXPCStarted](v2, "_ensureXPCStarted");
      v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_send_message(v5, xdict);

    }
    else if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
}

- (void)xpcReceivedMessage:(id)a3
{
  id v4;
  int var0;
  int v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  OS_xpc_object *xpcCnx;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  var0 = self->_ucat->var0;
  v18 = v4;
  if (var0 <= 9)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), v4 = v18, v6))
    {
      CUPrintXPC();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      v4 = v18;
    }
  }
  if (MEMORY[0x1A85D2194](v4) == MEMORY[0x1E0C812F8])
  {
    -[CBAdvertiser _xpcReceivedMessage:](self, "_xpcReceivedMessage:", v18);
    goto LABEL_26;
  }
  if (v18 == (id)MEMORY[0x1E0C81258])
  {
    -[CBAdvertiser _interrupted](self, "_interrupted");
    goto LABEL_26;
  }
  if (v18 != (id)MEMORY[0x1E0C81260])
  {
    CUXPCDecodeNSErrorIfNeeded();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;

      v10 = self->_ucat->var0;
      if (v10 > 90)
        goto LABEL_21;
    }
    else
    {
      NSErrorF();
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v10 = self->_ucat->var0;
      if (v10 > 90)
      {
LABEL_21:
        v13 = MEMORY[0x1A85D1CE4](self->_errorHandler);
        v14 = (void *)v13;
        if (v13)
          (*(void (**)(uint64_t, id))(v13 + 16))(v13, v9);

        goto LABEL_26;
      }
    }
    if (v10 != -1 || _LogCategory_Initialize())
    {
      CUPrintNSError();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintXPC();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    goto LABEL_21;
  }
  if (!self->_invalidateCalled)
  {
    v11 = self->_ucat->var0;
    if (v11 <= 90 && (v11 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
  }
  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0;

  -[CBAdvertiser _invalidated](self, "_invalidated");
LABEL_26:

}

- (void)_xpcReceivedMessage:(id)a3
{
  const char *string;
  const char *v5;
  int v6;
  int var0;
  id v8;

  v8 = a3;
  string = xpc_dictionary_get_string(v8, "mTyp");
  if (!string)
  {
    var0 = self->_ucat->var0;
    if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize())
      goto LABEL_10;
LABEL_9:
    LogPrintF_safe();
LABEL_10:

    return;
  }
  v5 = string;
  if (!strcmp(string, "AdAC"))
  {
    -[CBAdvertiser _xpcReceivedAdvertisingAddressChanged:](self, "_xpcReceivedAdvertisingAddressChanged:", v8);

  }
  else
  {
    if (strcmp(v5, "PwrC"))
    {
      v6 = self->_ucat->var0;
      if (v6 > 90 || v6 == -1 && !_LogCategory_Initialize())
        goto LABEL_10;
      goto LABEL_9;
    }
    -[CBAdvertiser _xpcReceivedPowerStateChanged:](self, "_xpcReceivedPowerStateChanged:", v8);

  }
}

- (void)_xpcReceivedAdvertisingAddressChanged:(id)a3
{
  id v4;
  int var0;
  uint64_t v6;
  void *v7;

  v4 = a3;
  CUXPCDecodeNSData();
  CUXPCDecodeNSData();
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  v6 = MEMORY[0x1A85D1CE4](self->_advertisingAddressChangedHandler);
  v7 = (void *)v6;
  if (v6)
    (*(void (**)(uint64_t))(v6 + 16))(v6);

}

- (void)_xpcReceivedPowerStateChanged:(id)a3
{
  uint64_t v4;
  void *v5;
  int var0;
  xpc_object_t xdict;

  xdict = a3;
  if (MEMORY[0x1A85D2194]() == MEMORY[0x1E0C812F8])
  {
    self->_bluetoothState = xpc_dictionary_get_int64(xdict, "pwrS");
    v4 = MEMORY[0x1A85D1CE4](self->_bluetoothStateChangedHandler);
    v5 = (void *)v4;
    if (v4)
      (*(void (**)(uint64_t))(v4 + 16))(v4);

  }
  else
  {
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();

      return;
    }
  }

}

- (id)advertisingAddressChangedHandler
{
  return self->_advertisingAddressChangedHandler;
}

- (void)setAdvertisingAddressChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSData)advertisingAddressDataConnectable
{
  return self->_advertisingAddressDataConnectable;
}

- (void)setAdvertisingAddressDataConnectable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSData)advertisingAddressDataNonConnectable
{
  return self->_advertisingAddressDataNonConnectable;
}

- (void)setAdvertisingAddressDataNonConnectable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSData)airplaySourceAuthTagData
{
  return self->_airplaySourceAuthTagData;
}

- (void)setAirplaySourceAuthTagData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)label
{
  return self->_label;
}

- (NSData)nearbyInfoV2AuthTagData
{
  return self->_nearbyInfoV2AuthTagData;
}

- (void)setNearbyInfoV2AuthTagData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (CBDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDevice, a3);
}

- (unsigned)useCase
{
  return self->_useCase;
}

- (NSArray)useCaseClientIDs
{
  return self->_useCaseClientIDs;
}

- (int)advertiseRate
{
  return self->_advertiseRate;
}

- (void)setAdvertiseRate:(int)a3
{
  self->_advertiseRate = a3;
}

- (CBDevice)mockDevice
{
  return self->_mockDevice;
}

- (void)setMockDevice:(id)a3
{
  objc_storeStrong((id *)&self->_mockDevice, a3);
}

- (NSString)mockID
{
  return self->_mockID;
}

- (void)setMockID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (unsigned)airdropFlags
{
  return self->_airdropFlags;
}

- (NSData)airdropTempAuthTagData
{
  return self->_airdropTempAuthTagData;
}

- (unsigned)airdropModel
{
  return self->_airdropModel;
}

- (void)setAirdropModel:(unsigned __int8)a3
{
  self->_airdropModel = a3;
}

- (unsigned)airdropVersion
{
  return self->_airdropVersion;
}

- (unsigned)airdropHash1
{
  return self->_airdropHash1;
}

- (void)setAirdropHash1:(unsigned __int16)a3
{
  self->_airdropHash1 = a3;
}

- (unsigned)airdropHash2
{
  return self->_airdropHash2;
}

- (void)setAirdropHash2:(unsigned __int16)a3
{
  self->_airdropHash2 = a3;
}

- (unsigned)airdropHash3
{
  return self->_airdropHash3;
}

- (void)setAirdropHash3:(unsigned __int16)a3
{
  self->_airdropHash3 = a3;
}

- (unsigned)airdropHash4
{
  return self->_airdropHash4;
}

- (void)setAirdropHash4:(unsigned __int16)a3
{
  self->_airdropHash4 = a3;
}

- (unsigned)airdropConfigData
{
  return self->_airdropConfigData;
}

- (NSData)airplaySourceUWBConfigData
{
  return self->_airplaySourceUWBConfigData;
}

- (unsigned)airplayTargetConfigSeed
{
  return self->_airplayTargetConfigSeed;
}

- (unsigned)airplayTargetFlags
{
  return self->_airplayTargetFlags;
}

- (unsigned)airplayTargetIPv4
{
  return self->_airplayTargetIPv4;
}

- (unsigned)airplayTargetPort
{
  return self->_airplayTargetPort;
}

- (unsigned)dsActionFlags
{
  return self->_dsActionFlags;
}

- (char)dsActionMeasuredPower
{
  return self->_dsActionMeasuredPower;
}

- (unsigned)dsActionTieBreaker
{
  return self->_dsActionTieBreaker;
}

- (unsigned)dsInfoVehicleConfidence
{
  return self->_dsInfoVehicleConfidence;
}

- (unsigned)dsInfoVehicleState
{
  return self->_dsInfoVehicleState;
}

- (BOOL)enableEPAForLEAdvertisement
{
  return self->_enableEPAForLEAdvertisement;
}

- (void)setEnableEPAForLEAdvertisement:(BOOL)a3
{
  self->_enableEPAForLEAdvertisement = a3;
}

- (NSData)fidoPayloadData
{
  return self->_fidoPayloadData;
}

- (unsigned)heySiriConfidence
{
  return self->_heySiriConfidence;
}

- (unsigned)heySiriDeviceClass
{
  return self->_heySiriDeviceClass;
}

- (unsigned)heySiriPerceptualHash
{
  return self->_heySiriPerceptualHash;
}

- (unsigned)heySiriProductType
{
  return self->_heySiriProductType;
}

- (unsigned)heySiriRandom
{
  return self->_heySiriRandom;
}

- (unsigned)heySiriSNR
{
  return self->_heySiriSNR;
}

- (NSData)nearbyActionAuthTagData
{
  return self->_nearbyActionAuthTagData;
}

- (void)setNearbyActionAuthTagData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (unsigned)nearbyActionColorCode
{
  return self->_nearbyActionColorCode;
}

- (unsigned)nearbyActionFlags
{
  return self->_nearbyActionFlags;
}

- (void)setNearbyActionFlags:(unsigned int)a3
{
  self->_nearbyActionFlags = a3;
}

- (unsigned)nearbyActionType
{
  return self->_nearbyActionType;
}

- (void)setNearbyActionType:(unsigned __int8)a3
{
  self->_nearbyActionType = a3;
}

- (NSData)nearbyActionTargetData
{
  return self->_nearbyActionTargetData;
}

- (unsigned)nearbyActionV2Flags
{
  return self->_nearbyActionV2Flags;
}

- (void)setNearbyActionV2Flags:(unsigned int)a3
{
  self->_nearbyActionV2Flags = a3;
}

- (NSData)nearbyActionV2TargetData
{
  return self->_nearbyActionV2TargetData;
}

- (void)setNearbyActionV2TargetData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (unsigned)nearbyActionV2Type
{
  return self->_nearbyActionV2Type;
}

- (void)setNearbyActionV2Type:(unsigned __int8)a3
{
  self->_nearbyActionV2Type = a3;
}

- (unsigned)nearbyInfoFlags
{
  return self->_nearbyInfoFlags;
}

- (double)nearbyInfoStatusProgress
{
  return self->_nearbyInfoStatusProgress;
}

- (unsigned)nearbyInfoStatusTime
{
  return self->_nearbyInfoStatusTime;
}

- (unsigned)nearbyInfoStatusType
{
  return self->_nearbyInfoStatusType;
}

- (unsigned)nearbyInfoV2InvitationCounter
{
  return self->_nearbyInfoV2InvitationCounter;
}

- (unsigned)nearbyInfoV2InvitationTypes
{
  return self->_nearbyInfoV2InvitationTypes;
}

- (unsigned)nearbyInfoV2InvitationRouteType
{
  return self->_nearbyInfoV2InvitationRouteType;
}

- (void)setNearbyInfoV2InvitationRouteType:(unsigned __int8)a3
{
  self->_nearbyInfoV2InvitationRouteType = a3;
}

- (NSData)nearbyInfoV2TempAuthTagData
{
  return self->_nearbyInfoV2TempAuthTagData;
}

- (void)setNearbyInfoV2TempAuthTagData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (unsigned)nearbyActionNoWakeType
{
  return self->_nearbyActionNoWakeType;
}

- (unsigned)nearbyActionNWPrecisionFindingStatus
{
  return self->_nearbyActionNWPrecisionFindingStatus;
}

- (NSData)nearbyActionNoWakeAuthTagData
{
  return self->_nearbyActionNoWakeAuthTagData;
}

- (NSData)nearbyActionNoWakeConfigData
{
  return self->_nearbyActionNoWakeConfigData;
}

- (NSData)safetyAlertsAlertData
{
  return self->_safetyAlertsAlertData;
}

- (NSData)safetyAlertsAlertID
{
  return self->_safetyAlertsAlertID;
}

- (unsigned)safetyAlertsAlertIndex
{
  return self->_safetyAlertsAlertIndex;
}

- (void)setSafetyAlertsAlertIndex:(unsigned __int8)a3
{
  self->_safetyAlertsAlertIndex = a3;
}

- (NSData)safetyAlertsSignature
{
  return self->_safetyAlertsSignature;
}

- (unsigned)safetyAlertsVersion
{
  return self->_safetyAlertsVersion;
}

- (NSData)watchSetupData
{
  return self->_watchSetupData;
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (unsigned)internalFlags
{
  return self->_internalFlags;
}

- (void)setInternalFlags:(unsigned int)a3
{
  self->_internalFlags = a3;
}

- (NSData)nearbyInfoV2AuthIntegrityTagData
{
  return self->_nearbyInfoV2AuthIntegrityTagData;
}

- (void)setNearbyInfoV2AuthIntegrityTagData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSData)nearbyInfoV2RapportIRKData
{
  return self->_nearbyInfoV2RapportIRKData;
}

- (void)setNearbyInfoV2RapportIRKData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (OS_xpc_object)xpcListenerEndpoint
{
  return self->_xpcListenerEndpoint;
}

- (void)setXpcListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_nearbyInfoV2RapportIRKData, 0);
  objc_storeStrong((id *)&self->_nearbyInfoV2AuthIntegrityTagData, 0);
  objc_storeStrong((id *)&self->_watchSetupData, 0);
  objc_storeStrong((id *)&self->_safetyAlertsSignature, 0);
  objc_storeStrong((id *)&self->_safetyAlertsAlertID, 0);
  objc_storeStrong((id *)&self->_safetyAlertsAlertData, 0);
  objc_storeStrong((id *)&self->_nearbyActionNoWakeConfigData, 0);
  objc_storeStrong((id *)&self->_nearbyActionNoWakeAuthTagData, 0);
  objc_storeStrong((id *)&self->_nearbyInfoV2TempAuthTagData, 0);
  objc_storeStrong((id *)&self->_nearbyActionV2TargetData, 0);
  objc_storeStrong((id *)&self->_nearbyActionTargetData, 0);
  objc_storeStrong((id *)&self->_nearbyActionAuthTagData, 0);
  objc_storeStrong((id *)&self->_fidoPayloadData, 0);
  objc_storeStrong((id *)&self->_airplaySourceUWBConfigData, 0);
  objc_storeStrong((id *)&self->_airdropTempAuthTagData, 0);
  objc_storeStrong((id *)&self->_mockID, 0);
  objc_storeStrong((id *)&self->_mockDevice, 0);
  objc_storeStrong((id *)&self->_useCaseClientIDs, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_nearbyInfoV2AuthTagData, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_airplaySourceAuthTagData, 0);
  objc_storeStrong((id *)&self->_advertisingAddressDataNonConnectable, 0);
  objc_storeStrong((id *)&self->_advertisingAddressDataConnectable, 0);
  objc_storeStrong(&self->_advertisingAddressChangedHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

@end
