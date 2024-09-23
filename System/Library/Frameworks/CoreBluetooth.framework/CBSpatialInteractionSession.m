@implementation CBSpatialInteractionSession

+ (id)dictionaryWithTokenData:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = (void *)OPACKDecodeData();
  if (!v5)
  {
    if (a4)
    {
      CUPrintErrorCode();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      CBErrorF(312900, (uint64_t)"Decode token failed: %@", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v12 = 0;
      goto LABEL_4;
    }
LABEL_9:
    v12 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      CBErrorF(312900, (uint64_t)"Non-dict token", v6, v7, v8, v9, v10, v11, v21);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v12 = v5;
LABEL_4:

  return v12;
}

- (CBSpatialInteractionSession)init
{
  CBSpatialInteractionSession *v2;
  CBSpatialInteractionSession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CBSpatialInteractionSession;
  v2 = -[CBSpatialInteractionSession init](&v5, sel_init);
  if (v2)
  {
    v2->_clientID = CBXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v2->_ucat = (LogCategory *)&gLogCategory_CBSpatial;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CBSpatialInteractionSession;
  -[CBSpatialInteractionSession dealloc](&v4, sel_dealloc);
}

- (CBSpatialInteractionSession)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CBSpatialInteractionSession *v13;
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
  CBSpatialInteractionSession *v24;
  const char *v26;
  uint64_t v27;

  v6 = a3;
  v13 = -[CBSpatialInteractionSession init](self, "init");
  if (!v13)
  {
    if (!a4)
      goto LABEL_42;
    v26 = "init failed";
LABEL_41:
    CBErrorF(-6756, (uint64_t)v26, v7, v8, v9, v10, v11, v12, v27);
    v24 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  if (MEMORY[0x1A85D2194](v6) != MEMORY[0x1E0C812F8])
  {
    if (!a4)
      goto LABEL_42;
    v26 = "XPC non-dict";
    goto LABEL_41;
  }
  v14 = CUXPCDecodeSInt64RangedEx();
  if (v14 == 6)
  {
    v13->_advertiseRate = 0;
  }
  else if (v14 == 5)
  {
    goto LABEL_42;
  }
  v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v13->_clientID = 0;
  }
  else if (v15 == 5)
  {
    goto LABEL_42;
  }
  if (!CUXPCDecodeBool())
    goto LABEL_42;
  v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v13->_internalFlags = 0;
  }
  else if (v16 == 5)
  {
    goto LABEL_42;
  }
  v17 = CUXPCDecodeSInt64RangedEx();
  if (v17 == 6)
  {
    v13->_scanRate = 0;
  }
  else if (v17 == 5)
  {
    goto LABEL_42;
  }
  v18 = CUXPCDecodeSInt64RangedEx();
  if (v18 == 6)
  {
    v13->_scanRateOverride = 0;
  }
  else if (v18 == 5)
  {
    goto LABEL_42;
  }
  v19 = CUXPCDecodeSInt64RangedEx();
  if (v19 == 6)
  {
    v13->_scanRateScreenOff = 0;
  }
  else if (v19 == 5)
  {
    goto LABEL_42;
  }
  v20 = CUXPCDecodeSInt64RangedEx();
  if (v20 == 6)
  {
    v13->_bleRSSIThresholdHint = 0;
  }
  else if (v20 == 5)
  {
    goto LABEL_42;
  }
  v21 = CUXPCDecodeUInt64RangedEx();
  if (v21 == 6)
  {
    v13->_bleRSSIThresholdOrder = 0;
  }
  else if (v21 == 5)
  {
    goto LABEL_42;
  }
  v22 = CUXPCDecodeUInt64RangedEx();
  if (v22 == 6)
  {
    v13->_controlFlags = 0;
  }
  else if (v22 == 5)
  {
    goto LABEL_42;
  }
  if (!CUXPCDecodeNSData())
    goto LABEL_42;
  v23 = CUXPCDecodeUInt64RangedEx();
  if (v23 != 6)
  {
    if (v23 != 5)
      goto LABEL_35;
LABEL_42:
    v24 = 0;
    goto LABEL_36;
  }
  v13->_uwbTokenFlags = 0;
LABEL_35:
  CUXPCDecodeNSDataOfLength();
  CUXPCDecodeNSDataOfLength();
  v24 = v13;
LABEL_36:

  return v24;
}

- (void)encodeWithXPCObject:(id)a3
{
  int64_t advertiseRate;
  uint64_t clientID;
  uint64_t internalFlags;
  int64_t scanRate;
  int64_t scanRateOverride;
  int64_t scanRateScreenOff;
  uint64_t controlFlags;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  const char *v16;
  uint64_t uwbTokenFlags;
  NSData *clientIrkData;
  NSData *v19;
  NSData *v20;
  id v21;
  NSData *v22;
  uint64_t v23;
  const char *v24;
  size_t v25;
  int var0;
  NSData *clientIdentifierData;
  NSData *v28;
  NSData *v29;
  id v30;
  NSData *v31;
  uint64_t v32;
  const char *v33;
  size_t v34;
  int v35;
  NSUInteger v36;
  uint64_t v37;
  xpc_object_t xdict;

  xdict = a3;
  advertiseRate = self->_advertiseRate;
  if ((_DWORD)advertiseRate)
    xpc_dictionary_set_int64(xdict, "advR", advertiseRate);
  clientID = self->_clientID;
  if ((_DWORD)clientID)
    xpc_dictionary_set_uint64(xdict, "cid", clientID);
  if (self->_enableEPAForLEAdvertisement)
    xpc_dictionary_set_BOOL(xdict, "naEE", 1);
  internalFlags = self->_internalFlags;
  if ((_DWORD)internalFlags)
    xpc_dictionary_set_uint64(xdict, "intF", internalFlags);
  scanRate = self->_scanRate;
  if ((_DWORD)scanRate)
    xpc_dictionary_set_int64(xdict, "scnR", scanRate);
  scanRateOverride = self->_scanRateOverride;
  if ((_DWORD)scanRateOverride)
    xpc_dictionary_set_int64(xdict, "scRO", scanRateOverride);
  scanRateScreenOff = self->_scanRateScreenOff;
  if ((_DWORD)scanRateScreenOff)
    xpc_dictionary_set_int64(xdict, "scRS", scanRateScreenOff);
  if (self->_bleRSSIThresholdHint)
    xpc_dictionary_set_int64(xdict, "blRT", self->_bleRSSIThresholdHint);
  if (self->_bleRSSIThresholdOrder)
    xpc_dictionary_set_uint64(xdict, "blRO", self->_bleRSSIThresholdOrder);
  controlFlags = self->_controlFlags;
  if ((_DWORD)controlFlags)
    xpc_dictionary_set_uint64(xdict, "siCF", controlFlags);
  -[CBSpatialInteractionSession uwbConfigData](self, "uwbConfigData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = objc_retainAutorelease(v11);
    v14 = xdict;
    v15 = objc_msgSend(v13, "bytes");
    if (v15)
      v16 = (const char *)v15;
    else
      v16 = "";
    xpc_dictionary_set_data(v14, "siUC", v16, objc_msgSend(v13, "length"));

  }
  uwbTokenFlags = self->_uwbTokenFlags;
  if ((_DWORD)uwbTokenFlags)
    xpc_dictionary_set_uint64(xdict, "siUF", uwbTokenFlags);
  clientIrkData = self->_clientIrkData;
  if (clientIrkData)
  {
    if (-[NSData length](clientIrkData, "length") == 16)
    {
      v19 = self->_clientIrkData;
      if (v19)
      {
        v20 = objc_retainAutorelease(v19);
        v21 = xdict;
        v22 = v20;
        v23 = -[NSData bytes](v22, "bytes");
        if (v23)
          v24 = (const char *)v23;
        else
          v24 = "";
        v25 = -[NSData length](v22, "length");

        xpc_dictionary_set_data(v21, "irkD", v24, v25);
      }
    }
    else
    {
      var0 = self->_ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      {
        v36 = -[NSData length](self->_clientIrkData, "length");
        v37 = 16;
        LogPrintF_safe();
      }
    }
  }
  clientIdentifierData = self->_clientIdentifierData;
  if (clientIdentifierData)
  {
    if (-[NSData length](clientIdentifierData, "length") == 3)
    {
      v28 = self->_clientIdentifierData;
      if (v28)
      {
        v29 = objc_retainAutorelease(v28);
        v30 = xdict;
        v31 = v29;
        v32 = -[NSData bytes](v31, "bytes");
        if (v32)
          v33 = (const char *)v32;
        else
          v33 = "";
        v34 = -[NSData length](v31, "length", v36, v37);

        xpc_dictionary_set_data(v30, "id", v33, v34);
      }
    }
    else
    {
      v35 = self->_ucat->var0;
      if (v35 <= 90 && (v35 != -1 || _LogCategory_Initialize()))
      {
        -[NSData length](self->_clientIdentifierData, "length", v36, v37);
        LogPrintF_safe();
      }
    }
  }

}

- (id)description
{
  return -[CBSpatialInteractionSession descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  id v5;
  NSData *advertisingAddressData;
  NSData *v7;
  id v8;
  int advertiseRate;
  int v10;
  const char *v11;
  id v12;
  id v13;
  int scanRate;
  int v15;
  const char *v16;
  id v17;
  int scanRateScreenOff;
  int v19;
  const char *v20;
  id v21;
  int scanRateOverride;
  int v23;
  const char *v24;
  id v25;
  id v26;
  id v27;
  NSData *identifierData;
  id v29;
  NSData *irkData;
  NSData *v31;
  id v32;
  NSData *tokenData;
  NSData *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  NSMutableDictionary *deviceMap;
  NSMutableDictionary *v41;
  id v42;
  NSData *clientIrkData;
  NSData *v44;
  id v45;
  NSData *clientIdentifierData;
  NSData *v47;
  id v48;
  uint64_t clientID;
  void *v51;
  void *v52;
  void *v53;
  void *v54;

  clientID = self->_clientID;
  NSAppendPrintF_safe();
  v4 = 0;
  if (self->_controlFlags)
  {
    CUPrintFlags32();
    clientID = objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v5 = v4;

    v4 = v5;
  }
  advertisingAddressData = self->_advertisingAddressData;
  if (advertisingAddressData)
  {
    v7 = advertisingAddressData;
    CUPrintNSDataAddress();
    clientID = objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v8 = v4;

    v4 = v8;
  }
  advertiseRate = self->_advertiseRate;
  if (advertiseRate)
  {
    v10 = advertiseRate - 10;
    v11 = "Periodic";
    switch(v10)
    {
      case 0:
        break;
      case 5:
        v11 = "PeriodicHigh";
        break;
      case 10:
        v11 = "Background";
        break;
      case 20:
        v11 = "Low";
        break;
      case 30:
        v11 = "Medium";
        break;
      case 32:
        v11 = "MediumMid";
        break;
      case 35:
        v11 = "MediumHigh";
        break;
      case 40:
        v11 = "High";
        break;
      case 50:
        v11 = "Max";
        break;
      default:
        v11 = "?";
        break;
    }
    clientID = (uint64_t)v11;
    NSAppendPrintF_safe();
    v12 = v4;

    v4 = v12;
  }
  if (self->_enableEPAForLEAdvertisement)
  {
    clientID = 1;
    NSAppendPrintF_safe();
    v13 = v4;

    v4 = v13;
  }
  scanRate = self->_scanRate;
  if (scanRate)
  {
    v15 = scanRate - 10;
    v16 = "Periodic";
    switch(v15)
    {
      case 0:
        break;
      case 10:
        v16 = "Background";
        break;
      case 20:
        v16 = "Low";
        break;
      case 25:
        v16 = "MediumLow";
        break;
      case 30:
        v16 = "Medium";
        break;
      case 40:
        v16 = "High";
        break;
      case 50:
        v16 = "Max";
        break;
      default:
        v16 = "?";
        break;
    }
    clientID = (uint64_t)v16;
    NSAppendPrintF_safe();
    v17 = v4;

    v4 = v17;
  }
  scanRateScreenOff = self->_scanRateScreenOff;
  if (scanRateScreenOff)
  {
    v19 = scanRateScreenOff - 10;
    v20 = "Periodic";
    switch(v19)
    {
      case 0:
        break;
      case 10:
        v20 = "Background";
        break;
      case 20:
        v20 = "Low";
        break;
      case 25:
        v20 = "MediumLow";
        break;
      case 30:
        v20 = "Medium";
        break;
      case 40:
        v20 = "High";
        break;
      case 50:
        v20 = "Max";
        break;
      default:
        v20 = "?";
        break;
    }
    clientID = (uint64_t)v20;
    NSAppendPrintF_safe();
    v21 = v4;

    v4 = v21;
  }
  scanRateOverride = self->_scanRateOverride;
  if (scanRateOverride)
  {
    v23 = scanRateOverride - 10;
    v24 = "Periodic";
    switch(v23)
    {
      case 0:
        break;
      case 10:
        v24 = "Background";
        break;
      case 20:
        v24 = "Low";
        break;
      case 25:
        v24 = "MediumLow";
        break;
      case 30:
        v24 = "Medium";
        break;
      case 40:
        v24 = "High";
        break;
      case 50:
        v24 = "Max";
        break;
      default:
        v24 = "?";
        break;
    }
    clientID = (uint64_t)v24;
    NSAppendPrintF_safe();
    v25 = v4;

    v4 = v25;
  }
  if (self->_bleRSSIThresholdHint)
  {
    clientID = self->_bleRSSIThresholdHint;
    NSAppendPrintF_safe();
    v26 = v4;

    v4 = v26;
  }
  if (self->_bleRSSIThresholdOrder)
  {
    CUPrintFlags32();
    clientID = objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v27 = v4;

    v4 = v27;
  }
  identifierData = self->_identifierData;
  if (identifierData)
  {
    clientID = identifierData;
    NSAppendPrintF_safe();
    v29 = v4;

    v4 = v29;
  }
  irkData = self->_irkData;
  if (irkData)
  {
    v31 = irkData;
    CUPrintNSObjectMasked();
    clientID = objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v32 = v4;

    v4 = v32;
  }
  tokenData = self->_tokenData;
  if (tokenData)
  {
    v34 = tokenData;
    CUPrintNSObjectMasked();
    clientID = objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v35 = v4;

    v4 = v35;
  }
  -[CBSpatialInteractionSession uwbConfigData](self, "uwbConfigData", clientID);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    CUPrintNSDataHex();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v37 = v4;

    v4 = v37;
  }

  if (self->_uwbTokenFlags)
  {
    NSAppendPrintF_safe();
    v38 = v4;

    v4 = v38;
  }
  if (self->_systemOverrideFlags)
  {
    CUPrintFlags32();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v39 = v4;

    v4 = v39;
  }
  deviceMap = self->_deviceMap;
  if (deviceMap)
  {
    v41 = deviceMap;
    -[NSMutableDictionary count](v41, "count");
    NSAppendPrintF_safe();
    v42 = v4;

    v4 = v42;
  }
  clientIrkData = self->_clientIrkData;
  if (clientIrkData)
  {
    v44 = clientIrkData;
    CUPrintNSObjectMasked();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v45 = v4;

    v4 = v45;
  }
  clientIdentifierData = self->_clientIdentifierData;
  if (clientIdentifierData)
  {
    v47 = clientIdentifierData;
    CUPrintNSObjectMasked();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v48 = v4;

    v4 = v48;
  }
  return v4;
}

- (BOOL)matchesWithDevice:(id)a3
{
  unsigned int v4;
  unsigned int controlFlags;
  _BOOL4 v6;

  v4 = objc_msgSend(a3, "deviceFlags");
  controlFlags = self->_controlFlags;
  if ((v4 & 0x100) != 0 && (controlFlags & 0x40) != 0)
  {
    LOBYTE(v6) = 1;
  }
  else if ((v4 & 0x400) != 0 && (controlFlags & 0x100) != 0)
  {
    LOBYTE(v6) = 1;
  }
  else if ((v4 & 0x80) != 0 && (controlFlags & 0x20) != 0)
  {
    LOBYTE(v6) = 1;
  }
  else if ((v4 & 0x200) != 0 && (controlFlags & 0x80) != 0)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    return (v4 >> 11) & ((self->_controlFlags & 0x200) >> 9);
  }
  return v6;
}

- (BOOL)updateWithSession:(id)a3
{
  id v4;
  int v5;
  int advertiseRate;
  BOOL v7;
  const char *v8;
  id v9;
  int v10;
  const char *v11;
  void *v12;
  id v13;
  int v14;
  int scanRate;
  int v16;
  int scanRateScreenOff;
  id v18;
  void *v19;
  id v20;
  int v21;
  const char *v22;
  int v23;
  const char *v24;
  id v25;
  int v26;
  const char *v27;
  int v28;
  const char *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  char v35;
  int var0;
  id v37;
  void *v38;
  const char *v40;
  uint64_t bleRSSIThresholdHint;
  const char *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  void *v48;

  v4 = a3;
  v5 = objc_msgSend(v4, "advertiseRate");
  advertiseRate = self->_advertiseRate;
  v7 = v5 != advertiseRate;
  if (v5 == advertiseRate)
  {
    v9 = 0;
    if (objc_msgSend(v4, "controlFlags") != self->_controlFlags)
    {
LABEL_27:
      CUPrintFlags32();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "controlFlags");
      CUPrintFlags32();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      CUAppendF();
      v13 = v9;

      self->_controlFlags = objc_msgSend(v4, "controlFlags", v12, v43);
      v7 = 1;
      v9 = v13;
    }
  }
  else
  {
    v8 = "Default";
    switch(advertiseRate)
    {
      case 0:
        break;
      case 10:
        v8 = "Periodic";
        break;
      case 15:
        v8 = "PeriodicHigh";
        break;
      case 20:
        v8 = "Background";
        break;
      case 30:
        v8 = "Low";
        break;
      case 40:
        v8 = "Medium";
        break;
      case 42:
        v8 = "MediumMid";
        break;
      case 45:
        v8 = "MediumHigh";
        break;
      case 50:
        v8 = "High";
        break;
      case 60:
        v8 = "Max";
        break;
      default:
        v8 = "?";
        break;
    }
    v10 = objc_msgSend(v4, "advertiseRate");
    v11 = "Default";
    switch(v10)
    {
      case 0:
        break;
      case 10:
        v11 = "Periodic";
        break;
      case 15:
        v11 = "PeriodicHigh";
        break;
      case 20:
        v11 = "Background";
        break;
      case 30:
        v11 = "Low";
        break;
      case 40:
        v11 = "Medium";
        break;
      case 42:
        v11 = "MediumMid";
        break;
      case 45:
        v11 = "MediumHigh";
        break;
      case 50:
        v11 = "High";
        break;
      case 60:
        v11 = "Max";
        break;
      default:
        v11 = "?";
        break;
    }
    v40 = v8;
    v42 = v11;
    CUAppendF();
    v9 = 0;
    self->_advertiseRate = objc_msgSend(v4, "advertiseRate", v40, v42);
    if (objc_msgSend(v4, "controlFlags") != self->_controlFlags)
      goto LABEL_27;
  }
  if (objc_msgSend(v4, "bleRSSIThresholdHint") == self->_bleRSSIThresholdHint)
  {
    if (objc_msgSend(v4, "bleRSSIThresholdOrder") == self->_bleRSSIThresholdOrder)
      goto LABEL_30;
  }
  else
  {
    bleRSSIThresholdHint = self->_bleRSSIThresholdHint;
    v44 = (int)objc_msgSend(v4, "bleRSSIThresholdHint");
    CUAppendF();
    v18 = v9;

    self->_bleRSSIThresholdHint = objc_msgSend(v4, "bleRSSIThresholdHint", bleRSSIThresholdHint, v44);
    v7 = 1;
    v9 = v18;
    if (objc_msgSend(v4, "bleRSSIThresholdOrder") == self->_bleRSSIThresholdOrder)
    {
LABEL_30:
      v14 = objc_msgSend(v4, "scanRate");
      scanRate = self->_scanRate;
      if (v14 == scanRate)
        goto LABEL_31;
      goto LABEL_35;
    }
  }
  CUPrintFlags32();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bleRSSIThresholdOrder");
  CUPrintFlags32();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  CUAppendF();
  v20 = v9;

  self->_bleRSSIThresholdOrder = objc_msgSend(v4, "bleRSSIThresholdOrder", v19, v45);
  v7 = 1;
  v9 = v20;
  v21 = objc_msgSend(v4, "scanRate");
  scanRate = self->_scanRate;
  if (v21 == scanRate)
  {
LABEL_31:
    v16 = objc_msgSend(v4, "scanRateScreenOff");
    scanRateScreenOff = self->_scanRateScreenOff;
    if (v16 == scanRateScreenOff)
      goto LABEL_73;
    goto LABEL_54;
  }
LABEL_35:
  v22 = "Default";
  switch(scanRate)
  {
    case 0:
      break;
    case 10:
      v22 = "Periodic";
      break;
    case 20:
      v22 = "Background";
      break;
    case 30:
      v22 = "Low";
      break;
    case 35:
      v22 = "MediumLow";
      break;
    case 40:
      v22 = "Medium";
      break;
    case 50:
      v22 = "High";
      break;
    case 60:
      v22 = "Max";
      break;
    default:
      v22 = "?";
      break;
  }
  v23 = objc_msgSend(v4, "scanRate");
  v24 = "Default";
  switch(v23)
  {
    case 0:
      break;
    case 10:
      v24 = "Periodic";
      break;
    case 20:
      v24 = "Background";
      break;
    case 30:
      v24 = "Low";
      break;
    case 35:
      v24 = "MediumLow";
      break;
    case 40:
      v24 = "Medium";
      break;
    case 50:
      v24 = "High";
      break;
    case 60:
      v24 = "Max";
      break;
    default:
      v24 = "?";
      break;
  }
  v46 = v24;
  CUAppendF();
  v25 = v9;

  self->_scanRate = objc_msgSend(v4, "scanRate", v22, v46);
  v7 = 1;
  v9 = v25;
  v26 = objc_msgSend(v4, "scanRateScreenOff");
  scanRateScreenOff = self->_scanRateScreenOff;
  if (v26 != scanRateScreenOff)
  {
LABEL_54:
    v27 = "Default";
    switch(scanRateScreenOff)
    {
      case 0:
        break;
      case 10:
        v27 = "Periodic";
        break;
      case 20:
        v27 = "Background";
        break;
      case 30:
        v27 = "Low";
        break;
      case 35:
        v27 = "MediumLow";
        break;
      case 40:
        v27 = "Medium";
        break;
      case 50:
        v27 = "High";
        break;
      case 60:
        v27 = "Max";
        break;
      default:
        v27 = "?";
        break;
    }
    v28 = objc_msgSend(v4, "scanRateScreenOff");
    v29 = "Default";
    switch(v28)
    {
      case 0:
        break;
      case 10:
        v29 = "Periodic";
        break;
      case 20:
        v29 = "Background";
        break;
      case 30:
        v29 = "Low";
        break;
      case 35:
        v29 = "MediumLow";
        break;
      case 40:
        v29 = "Medium";
        break;
      case 50:
        v29 = "High";
        break;
      case 60:
        v29 = "Max";
        break;
      default:
        v29 = "?";
        break;
    }
    v47 = v29;
    CUAppendF();
    v30 = v9;

    self->_scanRateScreenOff = objc_msgSend(v4, "scanRateScreenOff", v27, v47);
    v7 = 1;
    v9 = v30;
  }
LABEL_73:
  -[CBSpatialInteractionSession uwbConfigData](self, "uwbConfigData");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uwbConfigData");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v33 = v31;
  v34 = v33;
  if (v32 == v33)
  {

    var0 = self->_ucat->var0;
    if (v9)
      goto LABEL_77;
LABEL_84:
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
      goto LABEL_86;
    goto LABEL_90;
  }
  if ((v33 != 0) == (v32 == 0))
  {

LABEL_83:
    objc_msgSend(v4, "uwbConfigData");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v37 = v9;

    objc_msgSend(v4, "uwbConfigData", v34, v48);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBSpatialInteractionSession setUwbConfigData:](self, "setUwbConfigData:", v38);
    v7 = 1;
    v9 = v37;

    var0 = self->_ucat->var0;
    if (v37)
      goto LABEL_77;
    goto LABEL_84;
  }
  v35 = objc_msgSend(v32, "isEqual:", v33);

  if ((v35 & 1) == 0)
    goto LABEL_83;
  var0 = self->_ucat->var0;
  if (!v9)
    goto LABEL_84;
LABEL_77:
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
LABEL_86:
    LogPrintF_safe();
LABEL_90:

  return v7;
}

- (NSArray)discoveredDevices
{
  CBSpatialInteractionSession *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_deviceMap;
  v4 = v3;
  if (v3)
  {
    -[NSMutableDictionary allValues](v3, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  objc_sync_exit(v2);
  return (NSArray *)v5;
}

- (void)setAdvertiseRate:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__CBSpatialInteractionSession_setAdvertiseRate___block_invoke;
  v3[3] = &unk_1E53FFAA0;
  v4 = a3;
  v3[4] = self;
  -[CBSpatialInteractionSession _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __48__CBSpatialInteractionSession_setAdvertiseRate___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v5;
  int v6;
  int v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;

  v1 = *(_DWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 88);
  if (v1 != v3)
  {
    *(_DWORD *)(v2 + 88) = v1;
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v5 + 24))
    {
      v6 = **(_DWORD **)(v5 + 64);
      if (v6 <= 30)
      {
        if (v6 != -1 || (v7 = _LogCategory_Initialize(), v5 = *(_QWORD *)(a1 + 32), v7))
        {
          LogPrintF_safe();
          v5 = *(_QWORD *)(a1 + 32);
        }
      }
    }
    v8 = *(void **)(v5 + 24);
    if (v8)
    {
      v9 = v8;
      dispatch_source_cancel(v9);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 24);
      *(_QWORD *)(v10 + 24) = 0;

    }
  }
  return v1 != v3;
}

- (void)setAdvertiseRate:(int)a3 timeout:(double)a4
{
  _QWORD v4[6];
  int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__CBSpatialInteractionSession_setAdvertiseRate_timeout___block_invoke;
  v4[3] = &unk_1E5403AC8;
  v5 = a3;
  v4[4] = self;
  *(double *)&v4[5] = a4;
  -[CBSpatialInteractionSession _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v4);
}

BOOL __56__CBSpatialInteractionSession_setAdvertiseRate_timeout___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v5;
  int v6;
  int v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  dispatch_source_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _QWORD handler[5];

  v1 = *(_DWORD *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 88);
  if (v1 != v3)
  {
    *(_DWORD *)(v2 + 88) = v1;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = **(_DWORD **)(v5 + 64);
    if (v6 <= 30)
    {
      if (v6 != -1 || (v7 = _LogCategory_Initialize(), v5 = *(_QWORD *)(a1 + 32), v7))
      {
        LogPrintF_safe();
        v5 = *(_QWORD *)(a1 + 32);
      }
    }
    v8 = *(void **)(v5 + 24);
    if (v8)
    {
      v9 = v8;
      dispatch_source_cancel(v9);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 24);
      *(_QWORD *)(v10 + 24) = 0;

    }
    v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 136));
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 24);
    *(_QWORD *)(v13 + 24) = v12;
    v15 = v12;

    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __56__CBSpatialInteractionSession_setAdvertiseRate_timeout___block_invoke_2;
    handler[3] = &unk_1E53FF780;
    handler[4] = *(_QWORD *)(a1 + 32);
    dispatch_source_set_event_handler(v15, handler);
    CUDispatchTimerSet();
    dispatch_activate(v15);

  }
  return v1 != v3;
}

uint64_t __56__CBSpatialInteractionSession_setAdvertiseRate_timeout___block_invoke_2(uint64_t a1)
{
  _DWORD **v2;
  int v3;
  int v4;
  _DWORD **v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v2 = *(_DWORD ***)(a1 + 32);
  v3 = *v2[8];
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      LogPrintF_safe();
      v2 = *(_DWORD ***)(a1 + 32);
    }
  }
  v5 = v2;
  objc_sync_enter(v5);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v6)
  {
    v7 = v6;
    dispatch_source_cancel(v7);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 24);
    *(_QWORD *)(v8 + 24) = 0;

  }
  objc_sync_exit(v5);

  return objc_msgSend(*(id *)(a1 + 32), "setAdvertiseRate:", 0);
}

- (void)setControlFlags:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__CBSpatialInteractionSession_setControlFlags___block_invoke;
  v3[3] = &unk_1E53FFAA0;
  v4 = a3;
  v3[4] = self;
  -[CBSpatialInteractionSession _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __47__CBSpatialInteractionSession_setControlFlags___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(_DWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 92);
  if (v1 != v3)
    *(_DWORD *)(v2 + 92) = v1;
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

- (void)setScanRate:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__CBSpatialInteractionSession_setScanRate___block_invoke;
  v3[3] = &unk_1E53FFAA0;
  v4 = a3;
  v3[4] = self;
  -[CBSpatialInteractionSession _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __43__CBSpatialInteractionSession_setScanRate___block_invoke(uint64_t a1)
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

- (void)setScanRateScreenOff:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__CBSpatialInteractionSession_setScanRateScreenOff___block_invoke;
  v3[3] = &unk_1E53FFAA0;
  v4 = a3;
  v3[4] = self;
  -[CBSpatialInteractionSession _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __52__CBSpatialInteractionSession_setScanRateScreenOff___block_invoke(uint64_t a1)
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

- (void)setBleRSSIThresholdOrder:(unsigned __int8)a3
{
  _QWORD v3[5];
  unsigned __int8 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__CBSpatialInteractionSession_setBleRSSIThresholdOrder___block_invoke;
  v3[3] = &unk_1E53FFA28;
  v4 = a3;
  v3[4] = self;
  -[CBSpatialInteractionSession _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __56__CBSpatialInteractionSession_setBleRSSIThresholdOrder___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 82);
  if (v1 != v3)
    *(_BYTE *)(v2 + 82) = v1;
  return v1 != v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  CBSpatialInteractionSession *v5;
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
    block[2] = __54__CBSpatialInteractionSession_activateWithCompletion___block_invoke;
    block[3] = &unk_1E53FF780;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);

}

uint64_t __54__CBSpatialInteractionSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  int var0;
  void (**v11)(_QWORD, _QWORD);
  id activateCompletion;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  if (self->_bluetoothStateChangedHandler)
    self->_internalFlags |= 1u;
  v9 = gCBDaemonServer;
  self->_direct = gCBDaemonServer != 0;
  if (self->_invalidateCalled)
  {
    CBErrorF(-71148, (uint64_t)"Activate after invalidate", v2, v3, v4, v5, v6, v7, v15);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_activateCompletion);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v11)
    {
      ((void (**)(_QWORD, id))v11)[2](v11, v17);
    }
    else
    {
      v13 = MEMORY[0x1A85D1CE4](self->_errorHandler);
      v14 = (void *)v13;
      if (v13)
        (*(void (**)(uint64_t, id))(v13 + 16))(v13, v17);

    }
  }
  else if (v9)
  {
    -[CBSpatialInteractionSession _activateDirectStart](self, "_activateDirectStart");
  }
  else
  {
    -[CBSpatialInteractionSession _activateXPCStart:](self, "_activateXPCStart:", 0);
  }
}

- (void)_activateDirectStart
{
  int var0;
  CBSpatialInteractionSession *v4;
  _QWORD v5[5];

  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v4 = self;
    LogPrintF_safe();
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__CBSpatialInteractionSession__activateDirectStart__block_invoke;
  v5[3] = &unk_1E53FFB18;
  v5[4] = self;
  objc_msgSend((id)gCBDaemonServer, "activateCBSpatialInteractionSession:completion:", self, v5, v4);
}

void __51__CBSpatialInteractionSession__activateDirectStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 136);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__CBSpatialInteractionSession__activateDirectStart__block_invoke_2;
  v7[3] = &unk_1E53FF5A0;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __51__CBSpatialInteractionSession__activateDirectStart__block_invoke_2(uint64_t a1)
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

  v4 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 64);
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
      v5 = MEMORY[0x1A85D1CE4](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));
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
  xpc_object_t v6;
  _xpc_connection_s *v7;
  NSObject *dispatchQueue;
  _QWORD handler[5];
  BOOL v10;

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
  v6 = xpc_dictionary_create(0, 0, 0);
  -[CBSpatialInteractionSession encodeWithXPCObject:](self, "encodeWithXPCObject:", v6);
  xpc_dictionary_set_string(v6, "mTyp", "SpIn");
  -[CBSpatialInteractionSession _ensureXPCStarted](self, "_ensureXPCStarted");
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __49__CBSpatialInteractionSession__activateXPCStart___block_invoke;
  handler[3] = &unk_1E5403AF0;
  handler[4] = self;
  v10 = a3;
  xpc_connection_send_message_with_reply(v7, v6, dispatchQueue, handler);

}

uint64_t __49__CBSpatialInteractionSession__activateXPCStart___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateXPCCompleted:reactivate:", a2, *(unsigned __int8 *)(a1 + 40));
}

- (void)_activateXPCCompleted:(id)a3 reactivate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  id v10;
  id *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  CBSpatialInteractionSession *v16;
  int var0;
  void (**v18)(_QWORD, _QWORD);
  id activateCompletion;
  uint64_t v20;
  void *v21;
  id *v22;
  id v23;
  CBSpatialInteractionSession *v24;
  _QWORD applier[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  id obj;
  _QWORD v39[6];
  uint64_t v40;
  id *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v4 = a4;
  v6 = a3;
  v40 = 0;
  v41 = (id *)&v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__8;
  v44 = __Block_byref_object_dispose__8;
  v45 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __64__CBSpatialInteractionSession__activateXPCCompleted_reactivate___block_invoke;
  v39[3] = &unk_1E53FF8C0;
  v39[4] = self;
  v39[5] = &v40;
  v8 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v39);
  CUXPCDecodeNSErrorIfNeeded();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v41[5];
  v41[5] = (id)v9;

  if (!v41[5])
  {
    CUXPCDecodeNSData();
    self->_bluetoothState = xpc_dictionary_get_int64(v6, "pwrS");
    v11 = v41;
    obj = v41[5];
    v12 = CUXPCDecodeNSData();
    objc_storeStrong(v11 + 5, obj);
    if (v12)
    {
      xpc_dictionary_get_array(v6, "devA");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (!v13)
        goto LABEL_7;
      v32 = 0;
      v33 = &v32;
      v34 = 0x3032000000;
      v35 = __Block_byref_object_copy__8;
      v36 = __Block_byref_object_dispose__8;
      v37 = 0;
      v26 = 0;
      v27 = &v26;
      v28 = 0x3032000000;
      v29 = __Block_byref_object_copy__8;
      v30 = __Block_byref_object_dispose__8;
      v31 = 0;
      applier[0] = v7;
      applier[1] = 3221225472;
      applier[2] = __64__CBSpatialInteractionSession__activateXPCCompleted_reactivate___block_invoke_2;
      applier[3] = &unk_1E5402490;
      applier[4] = &v26;
      applier[5] = &v32;
      xpc_array_apply(v13, applier);
      v15 = (void *)v27[5];
      if (v15)
      {
        v22 = v41;
        v23 = v15;
        v16 = (CBSpatialInteractionSession *)v22[5];
        v22[5] = v23;
      }
      else
      {
        v16 = self;
        objc_sync_enter(v16);
        objc_storeStrong((id *)&v16->_deviceMap, (id)v33[5]);
        objc_sync_exit(v16);
      }

      _Block_object_dispose(&v26, 8);
      _Block_object_dispose(&v32, 8);

      if (!v15)
      {
LABEL_7:
        var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          v24 = self;
          LogPrintF_safe();
        }
        v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_activateCompletion);
        activateCompletion = self->_activateCompletion;
        self->_activateCompletion = 0;

        if (v18)
          v18[2](v18, 0);
        if (v4)
        {
          v20 = MEMORY[0x1A85D1CE4](self->_tokenChangedHandler);
          v21 = (void *)v20;
          if (v20)
            (*(void (**)(uint64_t))(v20 + 16))(v20);
          -[CBSpatialInteractionSession _reAddTokens](self, "_reAddTokens", v24);

        }
      }

    }
  }
  v8[2](v8);

  _Block_object_dispose(&v40, 8);
}

void __64__CBSpatialInteractionSession__activateXPCCompleted_reactivate___block_invoke(uint64_t a1)
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
    v3 = **(_DWORD **)(v2 + 64);
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
      v7 = MEMORY[0x1A85D1CE4](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));
      v8 = (void *)v7;
      if (v7)
        (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    }
  }
}

BOOL __64__CBSpatialInteractionSession__activateXPCCompleted_reactivate___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  CBDevice *v5;
  uint64_t v6;
  CBDevice *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id obj;

  v4 = a3;
  v5 = [CBDevice alloc];
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v6 + 40);
  v7 = -[CBDevice initWithXPCObject:error:](v5, "initWithXPCObject:error:", v4, &obj);

  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    -[CBDevice identifier](v7, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;
    if (v14)
    {
      v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (!v16)
      {
        v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v19 = *(void **)(v18 + 40);
        *(_QWORD *)(v18 + 40) = v17;

        v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      }
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v7, v14);
    }
    else
    {
      CBErrorF(-6708, (uint64_t)"No device ID", v8, v9, v10, v11, v12, v13, v24);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v21;

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
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
  v5 = self->_testListenerEndpoint;
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
  v10[2] = __48__CBSpatialInteractionSession__ensureXPCStarted__block_invoke;
  v10[3] = &unk_1E53FFB68;
  v10[4] = self;
  v8 = mach_service;
  v11 = v8;
  xpc_connection_set_event_handler(v8, v10);
  xpc_connection_activate(v8);

  return v8;
}

_QWORD *__48__CBSpatialInteractionSession__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[9] == *(_QWORD *)(a1 + 40))
    return (_QWORD *)objc_msgSend(result, "_xpcReceivedEvent:", a2);
  return result;
}

- (void)_interrupted
{
  int var0;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CBSpatialInteractionSession *v8;

  if (!self->_invalidateCalled)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v8 = self;
      LogPrintF_safe();
    }
    -[CBSpatialInteractionSession _lostAllDevices](self, "_lostAllDevices", v8);
    v4 = MEMORY[0x1A85D1CE4](self->_interruptionHandler);
    v5 = (void *)v4;
    if (v4)
      (*(void (**)(uint64_t))(v4 + 16))(v4);

    self->_bluetoothState = 1;
    v6 = MEMORY[0x1A85D1CE4](self->_bluetoothStateChangedHandler);
    v7 = (void *)v6;
    if (v6)
      (*(void (**)(uint64_t))(v6 + 16))(v6);

    -[CBSpatialInteractionSession _activateXPCStart:](self, "_activateXPCStart:", 1);
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CBSpatialInteractionSession_invalidate__block_invoke;
  block[3] = &unk_1E53FF780;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__CBSpatialInteractionSession_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _DWORD **v3;
  int v4;
  int v5;
  _DWORD **v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _xpc_connection_s *v12;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 49))
  {
    v2 = result;
    *(_BYTE *)(v1 + 49) = 1;
    v3 = *(_DWORD ***)(result + 32);
    v4 = *v3[8];
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), v5))
      {
        LogPrintF_safe();
        v3 = *(_DWORD ***)(v2 + 32);
      }
    }
    v6 = v3;
    objc_sync_enter(v6);
    v7 = *(void **)(*(_QWORD *)(v2 + 32) + 24);
    if (v7)
    {
      v8 = v7;
      dispatch_source_cancel(v8);
      v9 = *(_QWORD *)(v2 + 32);
      v10 = *(void **)(v9 + 24);
      *(_QWORD *)(v9 + 24) = 0;

    }
    objc_sync_exit(v6);

    v11 = *(_QWORD *)(v2 + 32);
    if (*(_BYTE *)(v11 + 48))
    {
      objc_msgSend((id)v11, "_invalidateDirect");
      v11 = *(_QWORD *)(v2 + 32);
    }
    v12 = *(_xpc_connection_s **)(v11 + 72);
    if (v12)
      xpc_connection_cancel(v12);
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

- (void)_invalidateDirect
{
  objc_msgSend((id)gCBDaemonServer, "invalidateCBSpatialInteractionSession:completion:");
}

void __48__CBSpatialInteractionSession__invalidateDirect__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 136);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CBSpatialInteractionSession__invalidateDirect__block_invoke_2;
  block[3] = &unk_1E53FF780;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __48__CBSpatialInteractionSession__invalidateDirect__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_invalidated
{
  id advertisingAddressChangedHandler;
  id aopDataHandler;
  id bluetoothStateChangedHandler;
  id deviceFoundHandler;
  id deviceLostHandler;
  id errorHandler;
  id interruptionHandler;
  id invalidationHandler;
  id measurementHandler;
  id systemOverrideHandler;
  id tokenChangedHandler;
  void *v14;
  int var0;
  int v16;
  uint64_t v17;

  if (self->_invalidateCalled && !self->_invalidateDone && !self->_direct && !self->_xpcCnx)
  {
    self->_invalidateCalled = 1;
    advertisingAddressChangedHandler = self->_advertisingAddressChangedHandler;
    self->_advertisingAddressChangedHandler = 0;

    aopDataHandler = self->_aopDataHandler;
    self->_aopDataHandler = 0;

    bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
    self->_bluetoothStateChangedHandler = 0;

    deviceFoundHandler = self->_deviceFoundHandler;
    self->_deviceFoundHandler = 0;

    deviceLostHandler = self->_deviceLostHandler;
    self->_deviceLostHandler = 0;

    errorHandler = self->_errorHandler;
    self->_errorHandler = 0;

    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v17 = MEMORY[0x1A85D1CE4](self->_invalidationHandler);
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    measurementHandler = self->_measurementHandler;
    self->_measurementHandler = 0;

    systemOverrideHandler = self->_systemOverrideHandler;
    self->_systemOverrideHandler = 0;

    tokenChangedHandler = self->_tokenChangedHandler;
    self->_tokenChangedHandler = 0;

    v14 = (void *)v17;
    if (v17)
    {
      (*(void (**)(uint64_t))(v17 + 16))(v17);
      v14 = (void *)v17;
    }
    self->_invalidateDone = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30)
    {
      if (var0 != -1 || (v16 = _LogCategory_Initialize(), v14 = (void *)v17, v16))
      {
        LogPrintF_safe();
        v14 = (void *)v17;
      }
    }

  }
}

- (void)addPeerToken:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__CBSpatialInteractionSession_addPeerToken_userInfo_completion___block_invoke;
  v15[3] = &unk_1E5400810;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

uint64_t __64__CBSpatialInteractionSession_addPeerToken_userInfo_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addPeerToken:userInfo:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)addPeerToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CBSpatialInteractionSession_addPeerToken_completion___block_invoke;
  block[3] = &unk_1E54007C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __55__CBSpatialInteractionSession_addPeerToken_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addPeerToken:userInfo:completion:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

- (void)_addPeerToken:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(_QWORD);
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CBSpatialInteractionPeerInfoClient *v25;
  uint64_t ClientID;
  void *v27;
  NSMutableDictionary *peerMap;
  NSMutableDictionary *v29;
  NSMutableDictionary *v30;
  int var0;
  xpc_object_t v32;
  id v33;
  id v34;
  const char *v35;
  size_t v36;
  _xpc_connection_s *v37;
  NSObject *dispatchQueue;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  id v52;
  void (**v53)(_QWORD);
  id v54;
  _QWORD handler[5];
  id v56;
  void *v57;
  id v58;
  int v59;
  _QWORD v60[5];
  id v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__8;
  v67 = __Block_byref_object_dispose__8;
  v68 = 0;
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __65__CBSpatialInteractionSession__addPeerToken_userInfo_completion___block_invoke;
  v60[3] = &unk_1E53FF898;
  v62 = &v63;
  v60[4] = self;
  v54 = v10;
  v61 = v54;
  v17 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v60);
  v53 = v17;
  if (self->_activateCalled)
  {
    v59 = 0;
    v18 = (void *)OPACKDecodeData();
    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = objc_alloc_init(CBSpatialInteractionPeerInfoClient);
        -[CBSpatialInteractionPeerInfoClient setTokenData:](v25, "setTokenData:", v8);
        -[CBSpatialInteractionPeerInfoClient setUserInfo:](v25, "setUserInfo:", v9);
        -[CBSpatialInteractionPeerInfoClient setUwbTokenFlags:](v25, "setUwbTokenFlags:", CFDictionaryGetInt64Ranged());
        v52 = v9;
        ClientID = CBXPCGetNextClientID();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", ClientID);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        peerMap = self->_peerMap;
        if (!peerMap)
        {
          v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          v30 = self->_peerMap;
          self->_peerMap = v29;

          peerMap = self->_peerMap;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](peerMap, "setObject:forKeyedSubscript:", v25, v27);
        var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSObjectMasked();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = ClientID;
          LogPrintF_safe();

        }
        v32 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_string(v32, "mTyp", "SpAT");
        if ((_DWORD)ClientID)
          xpc_dictionary_set_uint64(v32, "siPI", ClientID);
        if (v8)
        {
          v33 = objc_retainAutorelease(v8);
          v34 = v32;
          v35 = (const char *)objc_msgSend(v33, "bytes");
          v36 = objc_msgSend(v33, "length");
          if (!v35)
            v35 = "";

          xpc_dictionary_set_data(v34, "siTD", v35, v36);
        }
        -[CBSpatialInteractionSession _ensureXPCStarted](self, "_ensureXPCStarted", v50, v51);
        v37 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        dispatchQueue = self->_dispatchQueue;
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __65__CBSpatialInteractionSession__addPeerToken_userInfo_completion___block_invoke_122;
        handler[3] = &unk_1E5403B18;
        handler[4] = self;
        v56 = v8;
        v57 = v27;
        v58 = v54;
        xpc_connection_send_message_with_reply(v37, v32, dispatchQueue, handler);

        v9 = v52;
        v17 = v53;
      }
      else
      {
        CBErrorF(312900, (uint64_t)"Non-dict token", v19, v20, v21, v22, v23, v24, (uint64_t)v50);
        v49 = objc_claimAutoreleasedReturnValue();
        v25 = (CBSpatialInteractionPeerInfoClient *)v64[5];
        v64[5] = v49;
      }
    }
    else
    {
      CUPrintErrorCode();
      v25 = (CBSpatialInteractionPeerInfoClient *)objc_claimAutoreleasedReturnValue();
      CBErrorF(312900, (uint64_t)"Decode token failed: %@", v41, v42, v43, v44, v45, v46, (uint64_t)v25);
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = (void *)v64[5];
      v64[5] = v47;

    }
  }
  else
  {
    CBErrorF(-6745, (uint64_t)"Not activated", v11, v12, v13, v14, v15, v16, (uint64_t)v50);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v64[5];
    v64[5] = v39;

  }
  v17[2](v17);

  _Block_object_dispose(&v63, 8);
}

uint64_t __65__CBSpatialInteractionSession__addPeerToken_userInfo_completion___block_invoke(_QWORD *a1)
{
  uint64_t result;
  int v3;
  void *v4;

  result = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (result)
  {
    v3 = **(_DWORD **)(a1[4] + 64);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    return (*(uint64_t (**)(void))(a1[5] + 16))();
  }
  return result;
}

void __65__CBSpatialInteractionSession__addPeerToken_userInfo_completion___block_invoke_122(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = **(_DWORD **)(v3 + 64);
  v10 = (id)v2;
  if (v2)
  {
    if (v4 <= 90)
    {
      if (v4 != -1 || (v6 = _LogCategory_Initialize(), v3 = a1[4], v6))
      {
        CUPrintNSObjectMasked();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        CUPrintNSError();
        v7 = v5;
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v3 = a1[4];
      }
    }
    objc_msgSend(*(id *)(v3 + 56), "setObject:forKeyedSubscript:", 0, a1[6], v7, v9);
    (*(void (**)(_QWORD))(a1[7] + 16))(a1[7]);
  }
  else
  {
    if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSObjectMasked();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    (*(void (**)(_QWORD))(a1[7] + 16))(a1[7]);
  }

}

- (void)_reAddTokens
{
  NSMutableDictionary *peerMap;
  _QWORD v3[5];

  peerMap = self->_peerMap;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__CBSpatialInteractionSession__reAddTokens__block_invoke;
  v3[3] = &unk_1E5403B40;
  v3[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](peerMap, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __43__CBSpatialInteractionSession__reAddTokens__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  xpc_object_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  const char *v14;
  size_t v15;
  _xpc_connection_s *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  _QWORD handler[6];

  v5 = a3;
  v6 = objc_msgSend(a2, "unsignedIntValue");
  objc_msgSend(v5, "tokenData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 64);
  if (v8 <= 30 && (v8 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSObjectMasked();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v6;
    LogPrintF_safe();

  }
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v9, "mTyp", "SpAT");
  if ((_DWORD)v6)
    xpc_dictionary_set_uint64(v9, "siPI", v6);
  if (v7)
  {
    v10 = objc_retainAutorelease(v7);
    v11 = v9;
    v12 = v10;
    v13 = objc_msgSend(v12, "bytes");
    if (v13)
      v14 = (const char *)v13;
    else
      v14 = "";
    v15 = objc_msgSend(v12, "length", v19, v20);

    xpc_dictionary_set_data(v11, "siTD", v14, v15);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted", v19, v20);
  v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(NSObject **)(v17 + 136);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __43__CBSpatialInteractionSession__reAddTokens__block_invoke_2;
  handler[3] = &unk_1E53FFB68;
  handler[4] = v17;
  handler[5] = v7;
  xpc_connection_send_message_with_reply(v16, v9, v18, handler);

}

void __43__CBSpatialInteractionSession__reAddTokens__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = 90;
  else
    v4 = 30;
  v5 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 64);
  if (v4 >= v5)
  {
    v9 = (void *)v2;
    if (v5 != -1 || (v7 = _LogCategory_Initialize(), v3 = v9, v7))
    {
      CUPrintNSObjectMasked();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintNSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      v3 = v9;
    }
  }

}

- (void)removePeerToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CBSpatialInteractionSession_removePeerToken_completion___block_invoke;
  block[3] = &unk_1E54007C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __58__CBSpatialInteractionSession_removePeerToken_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  void *v31;
  id v32;
  int v33;
  int v34;
  void *v35;
  int v36;
  xpc_object_t v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  const char *v43;
  size_t v44;
  _xpc_connection_s *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  _QWORD handler[5];
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 8))
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend(*(id *)(v9 + 56), "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v58;
LABEL_4:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v58 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v14);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "tokenData");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 40);
        v19 = v17;
        v20 = v18;
        if (v19 == v20)
          break;
        v21 = v20;
        if ((v19 == 0) != (v20 != 0))
        {
          v22 = objc_msgSend(v19, "isEqual:", v20);

          if ((v22 & 1) != 0)
            goto LABEL_19;
        }
        else
        {

        }
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
          if (v12)
            goto LABEL_4;
          goto LABEL_14;
        }
      }

LABEL_19:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKeyedSubscript:", 0, v15);
      v32 = v15;

      if (!v32)
        goto LABEL_23;
      v33 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 64);
      if (v33 <= 30 && (v33 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSObjectMasked();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v32, "unsignedIntValue");
        LogPrintF_safe();

      }
      v37 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v37, "mTyp", "SpRT");
      v38 = *(void **)(a1 + 40);
      if (v38)
      {
        v39 = objc_retainAutorelease(v38);
        v40 = v37;
        v41 = v39;
        v42 = objc_msgSend(v41, "bytes");
        if (v42)
          v43 = (const char *)v42;
        else
          v43 = "";
        v44 = objc_msgSend(v41, "length", v49, v50);

        xpc_dictionary_set_data(v40, "siTD", v43, v44);
      }
      objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted", v49);
      v45 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v46 = *(_QWORD *)(a1 + 32);
      v47 = *(void **)(a1 + 40);
      v48 = *(NSObject **)(v46 + 136);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __58__CBSpatialInteractionSession_removePeerToken_completion___block_invoke_2;
      handler[3] = &unk_1E5403B68;
      handler[4] = v46;
      v55 = v47;
      v56 = *(id *)(a1 + 48);
      xpc_connection_send_message_with_reply(v45, v37, v48, handler);

    }
    else
    {
LABEL_14:

LABEL_23:
      CBErrorF(-6727, (uint64_t)"Token not found", v23, v24, v25, v26, v27, v28, (uint64_t)v49);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v34 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 64);
      if (v34 <= 90 && (v34 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSObjectMasked();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        CUPrintNSError();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
      (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v32);
    }

  }
  else
  {
    CBErrorF(-6745, (uint64_t)"Not activated", a3, a4, a5, a6, a7, a8, (uint64_t)v49);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 64);
    v53 = (id)v29;
    if (v30 <= 90)
    {
      if (v30 != -1 || (v36 = _LogCategory_Initialize(), v29 = (uint64_t)v53, v36))
      {
        CUPrintNSObjectMasked();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        CUPrintNSError();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v29 = (uint64_t)v53;
      }
    }
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v29);

  }
}

void __58__CBSpatialInteractionSession_removePeerToken_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 64);
  v9 = (id)v2;
  if (v2)
  {
    v4 = (id)v2;
    if (v3 <= 90)
    {
      if (v3 != -1 || (v6 = _LogCategory_Initialize(), v4 = v9, v6))
      {
        CUPrintNSObjectMasked();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        CUPrintNSError();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v4 = v9;
      }
    }
    (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v4);
  }
  else
  {
    if (v3 <= 30 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSObjectMasked();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  }

}

- (void)_lostAllDevices
{
  void (**v3)(_QWORD, _QWORD);
  CBSpatialInteractionSession *v4;
  NSMutableDictionary *deviceMap;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_deviceLostHandler, a2);
  v4 = self;
  objc_sync_enter(v4);
  deviceMap = v4->_deviceMap;
  if (v3)
  {
    -[NSMutableDictionary allValues](deviceMap, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeAllObjects](v4->_deviceMap, "removeAllObjects");
    objc_sync_exit(v4);

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v7);
          v3[2](v3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
  else
  {
    -[NSMutableDictionary removeAllObjects](deviceMap, "removeAllObjects");
    objc_sync_exit(v4);

  }
}

- (void)_updateIfNeededWithBlock:(id)a3
{
  uint64_t (**v4)(_QWORD);
  CBSpatialInteractionSession *v5;
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
    block[2] = __56__CBSpatialInteractionSession__updateIfNeededWithBlock___block_invoke;
    block[3] = &unk_1E53FF780;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);

}

uint64_t __56__CBSpatialInteractionSession__updateIfNeededWithBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

- (void)_update
{
  CBSpatialInteractionSession *v2;
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
      -[CBSpatialInteractionSession encodeWithXPCObject:](v2, "encodeWithXPCObject:", xdict);
      xpc_dictionary_set_string(xdict, "mTyp", "SpIU");
      -[CBSpatialInteractionSession _ensureXPCStarted](v2, "_ensureXPCStarted");
      v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_send_message(v5, xdict);

    }
    else if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
}

- (void)_xpcReceivedEvent:(id)a3
{
  id v4;
  int var0;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  OS_xpc_object *xpcCnx;
  void *v22;
  void *v23;
  id v24;

  v4 = a3;
  var0 = self->_ucat->var0;
  v24 = v4;
  if (var0 <= 9)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), v4 = v24, v6))
    {
      CUPrintXPC();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      v4 = v24;
    }
  }
  if (MEMORY[0x1A85D2194](v4) == MEMORY[0x1E0C812F8])
  {
    -[CBSpatialInteractionSession _xpcReceivedMessage:](self, "_xpcReceivedMessage:", v24);
    goto LABEL_26;
  }
  if (v24 == (id)MEMORY[0x1E0C81258])
  {
    -[CBSpatialInteractionSession _interrupted](self, "_interrupted");
    goto LABEL_26;
  }
  if (v24 != (id)MEMORY[0x1E0C81260])
  {
    CUXPCDecodeNSErrorIfNeeded();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
    if (v7)
    {
      v15 = v7;

      v16 = self->_ucat->var0;
      if (v16 > 90)
        goto LABEL_21;
    }
    else
    {
      CBErrorF(-6700, (uint64_t)"XPC event error", v8, v9, v10, v11, v12, v13, (uint64_t)v22);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v16 = self->_ucat->var0;
      if (v16 > 90)
      {
LABEL_21:
        v19 = MEMORY[0x1A85D1CE4](self->_errorHandler);
        v20 = (void *)v19;
        if (v19)
          (*(void (**)(uint64_t, id))(v19 + 16))(v19, v15);

        goto LABEL_26;
      }
    }
    if (v16 != -1 || _LogCategory_Initialize())
    {
      CUPrintNSError();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintXPC();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    goto LABEL_21;
  }
  if (!self->_invalidateCalled)
  {
    v17 = self->_ucat->var0;
    if (v17 <= 90 && (v17 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
  }
  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0;

  -[CBSpatialInteractionSession _invalidated](self, "_invalidated");
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
      goto LABEL_14;
LABEL_13:
    LogPrintF_safe();
LABEL_14:

    return;
  }
  v5 = string;
  if (!strcmp(string, "DvFo"))
  {
    -[CBSpatialInteractionSession _xpcReceivedDeviceFound:](self, "_xpcReceivedDeviceFound:", v8);

  }
  else if (!strcmp(v5, "DvLo"))
  {
    -[CBSpatialInteractionSession _xpcReceivedDeviceLost:](self, "_xpcReceivedDeviceLost:", v8);

  }
  else if (!strcmp(v5, "AdAC"))
  {
    -[CBSpatialInteractionSession _xpcReceivedAdvertisingAddressChanged:](self, "_xpcReceivedAdvertisingAddressChanged:", v8);

  }
  else if (!strcmp(v5, "PwrC"))
  {
    -[CBSpatialInteractionSession _xpcReceivedPowerStateChanged:](self, "_xpcReceivedPowerStateChanged:", v8);

  }
  else if (!strcmp(v5, "SpAD"))
  {
    -[CBSpatialInteractionSession _xpcReceivedAOPData:](self, "_xpcReceivedAOPData:", v8);

  }
  else
  {
    if (strcmp(v5, "SyOC"))
    {
      v6 = self->_ucat->var0;
      if (v6 > 90 || v6 == -1 && !_LogCategory_Initialize())
        goto LABEL_14;
      goto LABEL_13;
    }
    -[CBSpatialInteractionSession _xpcReceivedSystemOverrideChanged:](self, "_xpcReceivedSystemOverrideChanged:", v8);

  }
}

- (void)_xpcReceivedAdvertisingAddressChanged:(id)a3
{
  int var0;
  uint64_t v5;
  void *v6;
  void *v7;

  CUXPCDecodeNSData();
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSDataAddress();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  objc_storeStrong((id *)&self->_advertisingAddressData, 0);
  v5 = MEMORY[0x1A85D1CE4](self->_advertisingAddressChangedHandler);
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t))(v5 + 16))(v5);

}

- (void)_xpcReceivedAOPData:(id)a3
{
  id v4;
  id v5;
  int v6;
  int var0;
  void *v8;

  v4 = a3;
  if (MEMORY[0x1A85D2194]() == MEMORY[0x1E0C812F8])
  {
    CUXPCDecodeNSData();
    v5 = 0;
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    goto LABEL_4;
  }
  v6 = self->_ucat->var0;
  if (v6 > 90 || v6 == -1 && !_LogCategory_Initialize())
  {
LABEL_4:

    return;
  }
  LogPrintF_safe();

}

- (void)_xpcReceivedDeviceFound:(id)a3
{
  id v4;
  CBDevice *v5;
  id v6;
  NSMutableDictionary *peerMap;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CBSpatialInteractionSession *v13;
  NSMutableDictionary *deviceMap;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  int var0;
  uint64_t v18;
  void *v19;
  int v20;
  int v21;
  int v22;
  int v23;
  id v24;

  v4 = a3;
  if (MEMORY[0x1A85D2194]() == MEMORY[0x1E0C812F8])
  {
    v24 = 0;
    v5 = -[CBDevice initWithXPCObject:error:]([CBDevice alloc], "initWithXPCObject:error:", v4, &v24);
    v6 = v24;
    if (v5)
    {
      peerMap = self->_peerMap;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CBDevice spatialInteractionPeerID](v5, "spatialInteractionPeerID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](peerMap, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "tokenData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 || -[CBSpatialInteractionSession matchesWithDevice:](self, "matchesWithDevice:", v5))
      {
        -[CBDevice setSpatialInteractionTokenData:](v5, "setSpatialInteractionTokenData:", v10);
        objc_msgSend(v9, "userInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBDevice setSpatialInteractionUserInfo:](v5, "setSpatialInteractionUserInfo:", v11);

        -[CBDevice setSpatialInteractionUWBTokenFlags:](v5, "setSpatialInteractionUWBTokenFlags:", objc_msgSend(v9, "uwbTokenFlags"));
        -[CBDevice identifier](v5, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = self;
          objc_sync_enter(v13);
          deviceMap = v13->_deviceMap;
          if (!deviceMap)
          {
            v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
            v16 = v13->_deviceMap;
            v13->_deviceMap = v15;

            deviceMap = v13->_deviceMap;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v5, v12);
          objc_sync_exit(v13);

          var0 = v13->_ucat->var0;
          if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
            LogPrintF_safe();
          v18 = MEMORY[0x1A85D1CE4](v13->_deviceFoundHandler);
          v19 = (void *)v18;
          if (v18)
            (*(void (**)(uint64_t, CBDevice *))(v18 + 16))(v18, v5);

        }
        else
        {
          v22 = self->_ucat->var0;
          if (v22 <= 90 && (v22 != -1 || _LogCategory_Initialize()))
            LogPrintF_safe();
        }

      }
      else
      {
        v23 = self->_ucat->var0;
        if (v23 <= 30 && (v23 != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
      }

    }
    else
    {
      v21 = self->_ucat->var0;
      if (v21 > 90 || v21 == -1 && !_LogCategory_Initialize())
        goto LABEL_18;
      CUPrintNSError();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();
    }

LABEL_18:
    goto LABEL_19;
  }
  v20 = self->_ucat->var0;
  if (v20 <= 90 && (v20 != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
LABEL_19:

}

- (void)_xpcReceivedDeviceLost:(id)a3
{
  id v4;
  CBDevice *v5;
  id v6;
  void *v7;
  CBSpatialInteractionSession *v8;
  void *v9;
  int var0;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  id v16;

  v4 = a3;
  if (MEMORY[0x1A85D2194]() == MEMORY[0x1E0C812F8])
  {
    v16 = 0;
    v5 = -[CBDevice initWithXPCObject:error:]([CBDevice alloc], "initWithXPCObject:error:", v4, &v16);
    v6 = v16;
    if (v5)
    {
      -[CBDevice identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = self;
        objc_sync_enter(v8);
        -[NSMutableDictionary objectForKeyedSubscript:](v8->_deviceMap, "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_deviceMap, "setObject:forKeyedSubscript:", 0, v7);
        objc_sync_exit(v8);

        var0 = v8->_ucat->var0;
        if (v9)
        {
          if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
            LogPrintF_safe();
          v11 = MEMORY[0x1A85D1CE4](v8->_deviceLostHandler);
          v12 = (void *)v11;
          if (v11)
            (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v9);

        }
        else if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }

        goto LABEL_13;
      }
      v15 = self->_ucat->var0;
      if (v15 > 90 || v15 == -1 && !_LogCategory_Initialize())
      {
LABEL_13:

LABEL_14:
        goto LABEL_15;
      }
    }
    else
    {
      v14 = self->_ucat->var0;
      if (v14 > 90 || v14 == -1 && !_LogCategory_Initialize())
        goto LABEL_14;
      CUPrintNSError();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    LogPrintF_safe();
    goto LABEL_13;
  }
  v13 = self->_ucat->var0;
  if (v13 <= 90 && (v13 != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
LABEL_15:

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

- (void)_xpcReceivedSystemOverrideChanged:(id)a3
{
  uint64_t v4;
  void *v5;
  int var0;
  xpc_object_t xdict;

  xdict = a3;
  if (MEMORY[0x1A85D2194]() == MEMORY[0x1E0C812F8])
  {
    self->_scanRateOverride = xpc_dictionary_get_int64(xdict, "scRO");
    self->_systemOverrideFlags = xpc_dictionary_get_uint64(xdict, "syOF");
    v4 = MEMORY[0x1A85D1CE4](self->_systemOverrideHandler);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)label
{
  return self->_label;
}

- (unsigned)systemOverrideFlags
{
  return self->_systemOverrideFlags;
}

- (id)systemOverrideHandler
{
  return self->_systemOverrideHandler;
}

- (void)setSystemOverrideHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (int)advertiseRate
{
  return self->_advertiseRate;
}

- (id)advertisingAddressChangedHandler
{
  return self->_advertisingAddressChangedHandler;
}

- (void)setAdvertisingAddressChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSData)advertisingAddressData
{
  return self->_advertisingAddressData;
}

- (void)setAdvertisingAddressData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (id)aopDataHandler
{
  return self->_aopDataHandler;
}

- (void)setAopDataHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (unsigned)controlFlags
{
  return self->_controlFlags;
}

- (BOOL)enableEPAForLEAdvertisement
{
  return self->_enableEPAForLEAdvertisement;
}

- (void)setEnableEPAForLEAdvertisement:(BOOL)a3
{
  self->_enableEPAForLEAdvertisement = a3;
}

- (id)measurementHandler
{
  return self->_measurementHandler;
}

- (void)setMeasurementHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (int)scanRate
{
  return self->_scanRate;
}

- (int)scanRateOverride
{
  return self->_scanRateOverride;
}

- (void)setScanRateOverride:(int)a3
{
  self->_scanRateOverride = a3;
}

- (int)scanRateScreenOff
{
  return self->_scanRateScreenOff;
}

- (id)tokenChangedHandler
{
  return self->_tokenChangedHandler;
}

- (void)setTokenChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSData)tokenData
{
  return self->_tokenData;
}

- (void)setTokenData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSData)uwbConfigData
{
  return (NSData *)objc_getProperty(self, a2, 248, 1);
}

- (void)setUwbConfigData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 248);
}

- (unsigned)uwbTokenFlags
{
  return self->_uwbTokenFlags;
}

- (void)setUwbTokenFlags:(unsigned int)a3
{
  self->_uwbTokenFlags = a3;
}

- (char)bleRSSIThresholdHint
{
  return self->_bleRSSIThresholdHint;
}

- (void)setBleRSSIThresholdHint:(char)a3
{
  self->_bleRSSIThresholdHint = a3;
}

- (unsigned)bleRSSIThresholdOrder
{
  return self->_bleRSSIThresholdOrder;
}

- (NSData)clientIrkData
{
  return (NSData *)objc_getProperty(self, a2, 256, 1);
}

- (void)setClientIrkData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 256);
}

- (NSData)clientIdentifierData
{
  return (NSData *)objc_getProperty(self, a2, 264, 1);
}

- (void)setClientIdentifierData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 264);
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (NSData)identifierData
{
  return self->_identifierData;
}

- (void)setIdentifierData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (unsigned)internalFlags
{
  return self->_internalFlags;
}

- (void)setInternalFlags:(unsigned int)a3
{
  self->_internalFlags = a3;
}

- (NSData)irkData
{
  return self->_irkData;
}

- (void)setIrkData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (OS_xpc_object)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTestListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_irkData, 0);
  objc_storeStrong((id *)&self->_identifierData, 0);
  objc_storeStrong((id *)&self->_clientIdentifierData, 0);
  objc_storeStrong((id *)&self->_clientIrkData, 0);
  objc_storeStrong((id *)&self->_uwbConfigData, 0);
  objc_storeStrong((id *)&self->_tokenData, 0);
  objc_storeStrong(&self->_tokenChangedHandler, 0);
  objc_storeStrong(&self->_measurementHandler, 0);
  objc_storeStrong(&self->_aopDataHandler, 0);
  objc_storeStrong((id *)&self->_advertisingAddressData, 0);
  objc_storeStrong(&self->_advertisingAddressChangedHandler, 0);
  objc_storeStrong(&self->_systemOverrideHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_peerMap, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
  objc_storeStrong((id *)&self->_advertiseRateTimer, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

@end
