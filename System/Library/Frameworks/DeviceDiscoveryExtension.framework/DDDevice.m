@implementation DDDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)createDADevice
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE2BEC8]);
  v4 = v3;
  if (self->_bluetoothIdentifier)
    objc_msgSend(v3, "setBluetoothIdentifier:");
  if (self->_category)
    objc_msgSend(v4, "setType:");
  if (self->_displayName)
    objc_msgSend(v4, "setName:");
  if (self->_identifier)
    objc_msgSend(v4, "setIdentifier:");
  if (self->_networkEndpoint)
    objc_msgSend(v4, "setNetworkEndpoint:");
  if (self->_protocol)
    objc_msgSend(v4, "setProtocol:");
  if (self->_protocolType)
    objc_msgSend(v4, "setProtocolType:");
  if (self->_state)
    objc_msgSend(v4, "setState:");
  if (self->_supportsGrouping)
    objc_msgSend(v4, "setSupportsGrouping:", 1);
  if (self->_txtRecordData)
    objc_msgSend(v4, "setTxtRecordData:");
  if (self->_url)
    objc_msgSend(v4, "setUrl:");
  if (self->_mediaPlaybackState)
    objc_msgSend(v4, "setMediaPlaybackState:");
  if (self->_mediaContentTitle)
    objc_msgSend(v4, "setMediaContentTitle:");
  if (self->_mediaContentSubtitle)
    objc_msgSend(v4, "setMediaContentArtistName:");
  if (self->_displayImageName)
    objc_msgSend(v4, "setDisplayImageName:");
  if (self->_SSID)
    objc_msgSend(v4, "setSSID:");
  if (self->_allowPairing)
    objc_msgSend(v4, "setAllowPairing:", 1);
  if ((-[DDDevice deviceSupports](self, "deviceSupports") & 2) != 0)
    objc_msgSend(v4, "setAllowPairing:", 1);
  if ((-[DDDevice deviceSupports](self, "deviceSupports") & 4) != 0)
    objc_msgSend(v4, "setFlags:", objc_msgSend(v4, "flags") | 0x10);
  objc_msgSend(v4, "setPendingRemoval:", 0);
  return v4;
}

- (DDDevice)init
{
  objc_exception_throw(0);
}

- (DDDevice)initWithDisplayName:(NSString *)displayName category:(DDDeviceCategory)category protocolType:(UTType *)protocolType identifier:(NSString *)identifier
{
  NSString *v11;
  UTType *v12;
  NSString *v13;
  DDDevice *v14;
  DDDevice *v15;
  DDDevice *v16;
  objc_super v18;

  v11 = displayName;
  v12 = protocolType;
  v13 = identifier;
  v18.receiver = self;
  v18.super_class = (Class)DDDevice;
  v14 = -[DDDevice init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_displayName, displayName);
    v15->_category = category;
    objc_storeStrong((id *)&v15->_identifier, identifier);
    objc_storeStrong((id *)&v15->_protocolType, protocolType);
    v15->_supportsGrouping = 0;
    v16 = v15;
  }

  return v15;
}

- (DDDevice)initWithCoder:(id)a3
{
  id v4;
  DDDevice *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  OS_nw_endpoint *networkEndpoint;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  DDDevice *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;

  v4 = a3;
  v5 = -[DDDevice init](self, "init");
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v6;
    if (objc_msgSend(v7, "containsValueForKey:", CFSTR("dvCa")))
      v5->_category = objc_msgSend(v7, "decodeIntegerForKey:", CFSTR("dvCa"));

    v8 = v7;
    if (objc_msgSend(v8, "containsValueForKey:", CFSTR("dfSp")))
      v5->_deviceSupports = objc_msgSend(v8, "decodeIntegerForKey:", CFSTR("dfSp"));

    v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v11 = v10;
    if (objc_msgSend(v11, "containsValueForKey:", CFSTR("dvGr")))
      v5->_supportsGrouping = objc_msgSend(v11, "decodeBoolForKey:", CFSTR("dvGr"));

    objc_opt_class();
    NSDecodeObjectIfPresent();
    v12 = objc_msgSend(0, "copyCEndpoint");
    networkEndpoint = v5->_networkEndpoint;
    v5->_networkEndpoint = (OS_nw_endpoint *)v12;

    v14 = v11;
    if (objc_msgSend(v14, "containsValueForKey:", CFSTR("dvPT")))
      v5->_protocol = objc_msgSend(v14, "decodeIntegerForKey:", CFSTR("dvPT"));

    objc_opt_class();
    NSDecodeObjectIfPresent();
    v15 = v14;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v16 = v15;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_storeStrong((id *)&v5->_url, v17);
    v18 = v16;
    if (objc_msgSend(v18, "containsValueForKey:", CFSTR("mpSt")))
      v5->_mediaPlaybackState = objc_msgSend(v18, "decodeIntegerForKey:", CFSTR("mpSt"));

    v19 = v18;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v20 = v19;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v21 = v20;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v22 = v21;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v23 = v22;
    if (objc_msgSend(v23, "containsValueForKey:", CFSTR("btAP")))
      v5->_allowPairing = objc_msgSend(v23, "decodeBoolForKey:", CFSTR("btAP"));

    v24 = v5;
  }
  else
  {
    v26 = objc_opt_class();
    DDErrorF(350001, (uint64_t)"%@ init failed", v27, v28, v29, v30, v31, v32, v26);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v33);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *bluetoothIdentifier;
  int64_t category;
  unint64_t deviceSupports;
  NSString *displayName;
  NSString *identifier;
  OS_nw_endpoint *v9;
  void *v10;
  int64_t protocol;
  UTType *protocolType;
  NSData *txtRecordData;
  void *v14;
  int64_t mediaPlaybackState;
  NSString *mediaContentTitle;
  NSString *mediaContentSubtitle;
  NSString *displayImageName;
  NSString *SSID;
  id v20;

  v20 = a3;
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
    objc_msgSend(v20, "encodeObject:forKey:", bluetoothIdentifier, CFSTR("btID"));
  category = self->_category;
  if (category)
    objc_msgSend(v20, "encodeInteger:forKey:", category, CFSTR("dvCa"));
  deviceSupports = self->_deviceSupports;
  if (deviceSupports)
    objc_msgSend(v20, "encodeInteger:forKey:", deviceSupports, CFSTR("dfSp"));
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v20, "encodeObject:forKey:", displayName, CFSTR("name"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v20, "encodeObject:forKey:", identifier, CFSTR("id"));
  if (self->_supportsGrouping)
    objc_msgSend(v20, "encodeBool:forKey:", 1, CFSTR("dvGr"));
  v9 = self->_networkEndpoint;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDE07C8], "endpointWithCEndpoint:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v20, "encodeObject:forKey:", v10, CFSTR("nwEP"));

  }
  protocol = self->_protocol;
  if (protocol)
    objc_msgSend(v20, "encodeInteger:forKey:", protocol, CFSTR("dvPT"));
  protocolType = self->_protocolType;
  if (protocolType)
    objc_msgSend(v20, "encodeObject:forKey:", protocolType, CFSTR("prTy"));
  txtRecordData = self->_txtRecordData;
  if (txtRecordData)
    objc_msgSend(v20, "encodeObject:forKey:", txtRecordData, CFSTR("txRD"));
  -[NSURL absoluteString](self->_url, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v20, "encodeObject:forKey:", v14, CFSTR("urlS"));
  mediaPlaybackState = self->_mediaPlaybackState;
  if (mediaPlaybackState)
    objc_msgSend(v20, "encodeInteger:forKey:", mediaPlaybackState, CFSTR("mpSt"));
  mediaContentTitle = self->_mediaContentTitle;
  if (mediaContentTitle)
    objc_msgSend(v20, "encodeObject:forKey:", mediaContentTitle, CFSTR("mTi"));
  mediaContentSubtitle = self->_mediaContentSubtitle;
  if (mediaContentSubtitle)
    objc_msgSend(v20, "encodeObject:forKey:", mediaContentSubtitle, CFSTR("mArt"));
  displayImageName = self->_displayImageName;
  if (displayImageName)
    objc_msgSend(v20, "encodeObject:forKey:", displayImageName, CFSTR("dvDI"));
  SSID = self->_SSID;
  if (SSID)
    objc_msgSend(v20, "encodeObject:forKey:", SSID, CFSTR("ssID"));
  if (self->_allowPairing)
    objc_msgSend(v20, "encodeBool:forKey:", 1, CFSTR("btAP"));

}

- (DDDevice)initWithPersistentDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  DDDevice *v7;
  double v8;
  void *v9;
  uint64_t v10;
  NSUUID *bluetoothIdentifier;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  OS_nw_endpoint *networkEndpoint;
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
  DDDevice *v29;
  void *v31;
  void *v32;
  void *v33;

  v6 = a3;
  v7 = -[DDDevice init](self, "init");
  if (v7)
  {
    CFDictionaryGetDouble();
    v7->_approveTime = v8;
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v9);
      bluetoothIdentifier = v7->_bluetoothIdentifier;
      v7->_bluetoothIdentifier = (NSUUID *)v10;

    }
    NSDictionaryGetNSNumber();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_category = objc_msgSend(v12, "integerValue");

    v7->_deviceSupports = CFDictionaryGetInt64();
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_storeStrong((id *)&v7->_displayName, v13);
    v33 = v13;
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_storeStrong((id *)&v7->_identifier, v14);
    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v32, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v31, "copyCEndpoint");
    networkEndpoint = v7->_networkEndpoint;
    v7->_networkEndpoint = (OS_nw_endpoint *)v15;

    NSDictionaryGetNSNumber();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_protocol = objc_msgSend(v17, "integerValue");

    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        objc_storeStrong((id *)&v7->_protocolType, v19);

    }
    NSDictionaryGetNSNumber();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_state = objc_msgSend(v20, "integerValue");

    v7->_supportsGrouping = CFDictionaryGetInt64() != 0;
    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      objc_storeStrong((id *)&v7->_txtRecordData, v21);
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        objc_storeStrong((id *)&v7->_url, v23);

    }
    NSDictionaryGetNSNumber();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_mediaPlaybackState = objc_msgSend(v24, "integerValue");

    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
      objc_storeStrong((id *)&v7->_mediaContentTitle, v25);
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      objc_storeStrong((id *)&v7->_mediaContentSubtitle, v26);
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
      objc_storeStrong((id *)&v7->_displayImageName, v27);
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      objc_storeStrong((id *)&v7->_SSID, v28);
    v7->_allowPairing = CFDictionaryGetInt64() != 0;
    v29 = v7;

  }
  else if (a4)
  {
    objc_opt_class();
    DAErrorF();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (NSDictionary)persistentDictionaryRepresentation
{
  id v3;
  void *v4;
  NSUUID *bluetoothIdentifier;
  void *v6;
  void *v7;
  void *v8;
  NSString *displayName;
  NSString *identifier;
  OS_nw_endpoint *v11;
  void *v12;
  void *v13;
  void *v14;
  UTType *protocolType;
  void *v16;
  void *v17;
  void *v18;
  NSData *txtRecordData;
  NSURL *url;
  void *v21;
  void *v22;
  NSString *mediaContentTitle;
  NSString *mediaContentSubtitle;
  NSString *displayImageName;
  NSString *SSID;
  void *v27;
  void *v28;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_approveTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("approveTime"));

  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    -[NSUUID UUIDString](bluetoothIdentifier, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("bluetoothIdentifier"));

  }
  if (self->_category)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("type"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_deviceSupports);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("deviceFeatureSupport"));

  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", displayName, CFSTR("name"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", identifier, CFSTR("identifier"));
  v11 = self->_networkEndpoint;
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDE07C8], "endpointWithCEndpoint:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("nwEndpoint"));

  }
  if (self->_protocol)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("protocol"));

  }
  protocolType = self->_protocolType;
  if (protocolType)
  {
    -[UTType identifier](protocolType, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("protocolType"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_state);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("deviceState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_supportsGrouping);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("deviceSupportsGrouping"));

  txtRecordData = self->_txtRecordData;
  if (txtRecordData)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", txtRecordData, CFSTR("txtRecordData"));
  url = self->_url;
  if (url)
  {
    -[NSURL absoluteString](url, "absoluteString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("url"));

  }
  if (self->_mediaPlaybackState)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("mediaPlaybackState"));

  }
  mediaContentTitle = self->_mediaContentTitle;
  if (mediaContentTitle)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", mediaContentTitle, CFSTR("mediaContentTitle"));
  mediaContentSubtitle = self->_mediaContentSubtitle;
  if (mediaContentSubtitle)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", mediaContentSubtitle, CFSTR("mediaContentArtist"));
  displayImageName = self->_displayImageName;
  if (displayImageName)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", displayImageName, CFSTR("displayImageName"));
  SSID = self->_SSID;
  if (SSID)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", SSID, CFSTR("deviceSSID"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowPairing);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("deviceAllowsPairing"));

  v28 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v28;
}

+ (void)mergePersistentDictionary:(id)a3 into:(id)a4
{
  id v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  CFDictionaryGetDouble();
  if (v6 == 0.0)
  {
    CFDictionaryGetDouble();
    if (v7 != 0.0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("approveTime"));

    }
  }

}

- (DDDevice)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  DDDevice *v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  OS_nw_endpoint *networkEndpoint;
  int v19;
  int v20;
  int v21;
  DDDevice *v22;
  uint64_t v24;

  v6 = a3;
  v7 = -[DDDevice init](self, "init");
  if (!v7)
  {
    if (a4)
    {
      objc_opt_class();
      DAErrorF();
      v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
    goto LABEL_41;
  }
  if (!CUXPCDecodeNSUUID())
    goto LABEL_41;
  v8 = CUXPCDecodeSInt64RangedEx();
  if (v8 == 6)
  {
    v7->_category = 0;
  }
  else if (v8 == 5)
  {
    goto LABEL_41;
  }
  v9 = CUXPCDecodeUInt64RangedEx();
  if (v9 != 6)
  {
    if (v9 != 5)
      goto LABEL_9;
LABEL_41:
    v22 = 0;
    goto LABEL_36;
  }
  v7->_deviceSupports = 0;
LABEL_9:
  if (!CUXPCDecodeNSString() || !CUXPCDecodeNSString())
    goto LABEL_41;
  xpc_dictionary_get_dictionary(v6, "nwEP");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = nw_endpoint_create_from_dictionary();
    if (!v11)
    {
      if (a4)
      {
        DDErrorF(350001, (uint64_t)"XPC->NW failed", v12, v13, v14, v15, v16, v17, v24);
        v22 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      goto LABEL_44;
    }
    networkEndpoint = v7->_networkEndpoint;
    v7->_networkEndpoint = (OS_nw_endpoint *)v11;

  }
  v19 = CUXPCDecodeSInt64RangedEx();
  if (v19 == 6)
  {
    v7->_protocol = 0;
    goto LABEL_17;
  }
  if (v19 == 5)
  {
LABEL_44:
    v22 = 0;
    goto LABEL_35;
  }
LABEL_17:
  if (!CUXPCDecodeNSString())
    goto LABEL_38;
  v20 = CUXPCDecodeSInt64RangedEx();
  if (v20 != 6)
  {
    if (v20 != 5)
      goto LABEL_21;
LABEL_38:
    v22 = 0;
    goto LABEL_34;
  }
  v7->_state = 0;
LABEL_21:
  if (!CUXPCDecodeBool() || !CUXPCDecodeNSData())
    goto LABEL_38;
  if (!CUXPCDecodeNSString())
    goto LABEL_37;
  v21 = CUXPCDecodeSInt64RangedEx();
  if (v21 != 6)
  {
    if (v21 != 5)
      goto LABEL_27;
LABEL_37:
    v22 = 0;
    goto LABEL_33;
  }
  v7->_mediaPlaybackState = 0;
LABEL_27:
  if (!CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeBool())
  {
    goto LABEL_37;
  }
  v22 = v7;
LABEL_33:

LABEL_34:
LABEL_35:

LABEL_36:
  return v22;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  NSUUID *bluetoothIdentifier;
  uint64_t deviceSupports;
  NSString *displayName;
  id v8;
  const char *v9;
  NSString *identifier;
  id v11;
  const char *v12;
  OS_nw_endpoint *v13;
  OS_nw_endpoint *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  const char *v19;
  NSData *txtRecordData;
  NSData *v21;
  id v22;
  NSData *v23;
  uint64_t v24;
  const char *v25;
  size_t v26;
  NSURL *v27;
  NSURL *v28;
  void *v29;
  id v30;
  id v31;
  const char *v32;
  NSString *mediaContentTitle;
  id v34;
  const char *v35;
  NSString *mediaContentSubtitle;
  id v37;
  const char *v38;
  NSString *displayImageName;
  id v40;
  const char *v41;
  NSString *SSID;
  id v43;
  const char *v44;
  unsigned __int8 uuid[16];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    -[NSUUID getUUIDBytes:](bluetoothIdentifier, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v4, "btID", uuid);
  }
  xpc_dictionary_set_int64(v4, "dvCa", self->_category);
  deviceSupports = self->_deviceSupports;
  if (deviceSupports)
    xpc_dictionary_set_uint64(v4, "dfSp", deviceSupports);
  displayName = self->_displayName;
  v8 = v4;
  v9 = -[NSString UTF8String](objc_retainAutorelease(displayName), "UTF8String");
  if (v9)
    xpc_dictionary_set_string(v8, "name", v9);

  identifier = self->_identifier;
  v11 = v8;
  v12 = -[NSString UTF8String](objc_retainAutorelease(identifier), "UTF8String");
  if (v12)
    xpc_dictionary_set_string(v11, "id", v12);

  v13 = self->_networkEndpoint;
  v14 = v13;
  if (v13)
  {
    v15 = (void *)MEMORY[0x22E2AE760](v13);
    if (v15)
      xpc_dictionary_set_value(v11, "nwEP", v15);

  }
  xpc_dictionary_set_int64(v11, "dvPT", self->_protocol);
  -[UTType identifier](self->_protocolType, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v11;
  v18 = objc_retainAutorelease(v16);
  v19 = (const char *)objc_msgSend(v18, "UTF8String");
  if (v19)
    xpc_dictionary_set_string(v17, "prTy", v19);

  xpc_dictionary_set_int64(v17, "dvSt", self->_state);
  if (self->_supportsGrouping)
    xpc_dictionary_set_BOOL(v17, "dvGr", 1);
  txtRecordData = self->_txtRecordData;
  if (txtRecordData)
  {
    v21 = objc_retainAutorelease(txtRecordData);
    v22 = v17;
    v23 = v21;
    v24 = -[NSData bytes](v23, "bytes");
    if (v24)
      v25 = (const char *)v24;
    else
      v25 = "";
    v26 = -[NSData length](v23, "length");

    xpc_dictionary_set_data(v22, "txRD", v25, v26);
  }
  v27 = self->_url;
  v28 = v27;
  if (v27)
  {
    -[NSURL absoluteString](v27, "absoluteString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v17;
    v31 = objc_retainAutorelease(v29);
    v32 = (const char *)objc_msgSend(v31, "UTF8String");
    if (v32)
      xpc_dictionary_set_string(v30, "urlS", v32);

  }
  xpc_dictionary_set_int64(v17, "mpSt", self->_mediaPlaybackState);
  mediaContentTitle = self->_mediaContentTitle;
  v34 = v17;
  v35 = -[NSString UTF8String](objc_retainAutorelease(mediaContentTitle), "UTF8String");
  if (v35)
    xpc_dictionary_set_string(v34, "mTi", v35);

  mediaContentSubtitle = self->_mediaContentSubtitle;
  v37 = v34;
  v38 = -[NSString UTF8String](objc_retainAutorelease(mediaContentSubtitle), "UTF8String");
  if (v38)
    xpc_dictionary_set_string(v37, "mArt", v38);

  displayImageName = self->_displayImageName;
  v40 = v37;
  v41 = -[NSString UTF8String](objc_retainAutorelease(displayImageName), "UTF8String");
  if (v41)
    xpc_dictionary_set_string(v40, "dvDI", v41);

  SSID = self->_SSID;
  v43 = v40;
  v44 = -[NSString UTF8String](objc_retainAutorelease(SSID), "UTF8String");
  if (v44)
    xpc_dictionary_set_string(v43, "ssID", v44);

  if (self->_allowPairing)
    xpc_dictionary_set_BOOL(v43, "btAP", 1);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v4 + 144) = self->_approveTime;
  v5 = -[NSUUID copy](self->_bluetoothIdentifier, "copy");
  v6 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v5;

  *(_QWORD *)(v4 + 32) = self->_category;
  *(_QWORD *)(v4 + 16) = self->_deviceSupports;
  v7 = -[NSString copy](self->_displayName, "copy");
  v8 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v7;

  v9 = -[NSString copy](self->_identifier, "copy");
  v10 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v9;

  objc_storeStrong((id *)(v4 + 88), self->_networkEndpoint);
  *(_QWORD *)(v4 + 96) = self->_protocol;
  v11 = -[UTType copy](self->_protocolType, "copy");
  v12 = *(void **)(v4 + 104);
  *(_QWORD *)(v4 + 104) = v11;

  *(_QWORD *)(v4 + 112) = self->_state;
  *(_BYTE *)(v4 + 8) = self->_supportsGrouping;
  v13 = -[NSData copy](self->_txtRecordData, "copy");
  v14 = *(void **)(v4 + 128);
  *(_QWORD *)(v4 + 128) = v13;

  v15 = -[NSURL copy](self->_url, "copy");
  v16 = *(void **)(v4 + 136);
  *(_QWORD *)(v4 + 136) = v15;

  *(_QWORD *)(v4 + 64) = self->_mediaPlaybackState;
  v17 = -[NSString copy](self->_mediaContentTitle, "copy");
  v18 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v17;

  v19 = -[NSString copy](self->_mediaContentSubtitle, "copy");
  v20 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = v19;

  v21 = -[NSString copy](self->_displayImageName, "copy");
  v22 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v21;

  v23 = -[NSString copy](self->_SSID, "copy");
  v24 = *(void **)(v4 + 120);
  *(_QWORD *)(v4 + 120) = v23;

  *(_BYTE *)(v4 + 9) = self->_allowPairing;
  return (id)v4;
}

- (id)description
{
  return -[DDDevice descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  NSString *identifier;
  id v6;
  NSString *displayName;
  id v8;
  id v9;
  UTType *protocolType;
  id v11;
  id v12;
  id v13;
  NSUUID *bluetoothIdentifier;
  id v15;
  OS_nw_endpoint *networkEndpoint;
  id v17;
  id v18;
  NSData *txtRecordData;
  NSData *v20;
  id v21;
  NSURL *url;
  id v23;
  id v24;
  NSString *mediaContentTitle;
  id v26;
  NSString *mediaContentSubtitle;
  id v28;
  NSString *displayImageName;
  id v30;
  NSString *SSID;
  id v32;
  id v33;
  __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  NSString *v38;
  NSString *v39;
  UTType *v40;
  NSUUID *v41;
  OS_nw_endpoint *v42;
  void *v43;
  NSURL *v44;
  NSString *v45;
  NSString *v46;
  NSString *v47;
  NSString *v48;
  void *v49;

  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    v4 = 0;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    v38 = identifier;
    CUAppendF();
    v6 = v4;

    v4 = v6;
  }
  displayName = self->_displayName;
  if (displayName)
  {
    v39 = displayName;
    CUAppendF();
    v8 = v4;

    v4 = v8;
  }
  CUAppendF();
  v9 = v4;

  protocolType = self->_protocolType;
  if (protocolType)
  {
    v40 = protocolType;
    CUAppendF();
    v11 = v9;

    v9 = v11;
  }
  CUAppendF();
  v12 = v9;

  CUAppendF();
  v13 = v12;

  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    v41 = bluetoothIdentifier;
    CUAppendF();
    v15 = v13;

    v13 = v15;
  }
  networkEndpoint = self->_networkEndpoint;
  if (networkEndpoint)
  {
    v42 = networkEndpoint;
    CUAppendF();
    v17 = v13;

    v13 = v17;
  }
  CUAppendF();
  v18 = v13;

  txtRecordData = self->_txtRecordData;
  if (txtRecordData)
  {
    v20 = txtRecordData;
    CUPrintNSObjectOneLine();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v21 = v18;

    v18 = v21;
  }
  url = self->_url;
  if (url)
  {
    v44 = url;
    CUAppendF();
    v23 = v18;

    v18 = v23;
  }
  CUAppendF();
  v24 = v18;

  mediaContentTitle = self->_mediaContentTitle;
  if (mediaContentTitle)
  {
    v45 = mediaContentTitle;
    CUAppendF();
    v26 = v24;

    v24 = v26;
  }
  mediaContentSubtitle = self->_mediaContentSubtitle;
  if (mediaContentSubtitle)
  {
    v46 = mediaContentSubtitle;
    CUAppendF();
    v28 = v24;

    v24 = v28;
  }
  displayImageName = self->_displayImageName;
  if (displayImageName)
  {
    v47 = displayImageName;
    CUAppendF();
    v30 = v24;

    v24 = v30;
  }
  SSID = self->_SSID;
  if (SSID)
  {
    v48 = SSID;
    CUAppendF();
    v32 = v24;

    v24 = v32;
  }
  CUAppendF();
  v33 = v24;

  CUPrintFlags64();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  CUAppendF();
  v34 = (__CFString *)v33;

  v35 = &stru_24F0EEDC8;
  if (v34)
    v35 = v34;
  v36 = v35;

  return v36;
}

+ (BOOL)deviceMetadataURLValid:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v3 = a3;
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5 > 0x31)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v3, "query");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v3, "host");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7 && (unint64_t)objc_msgSend(v7, "length") <= 0x13)
      {
        objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("^[a-zA-Z0-9.-]+$"), 1, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "numberOfMatchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length")) != 0;

      }
      else
      {
        v10 = 0;
      }

    }
  }

  return v10;
}

- (unint64_t)deviceSupports
{
  return self->_deviceSupports;
}

- (void)setDeviceSupports:(unint64_t)a3
{
  self->_deviceSupports = a3;
}

- (NSUUID)bluetoothIdentifier
{
  return self->_bluetoothIdentifier;
}

- (void)setBluetoothIdentifier:(NSUUID *)bluetoothIdentifier
{
  objc_storeStrong((id *)&self->_bluetoothIdentifier, bluetoothIdentifier);
}

- (DDDeviceCategory)category
{
  return self->_category;
}

- (void)setCategory:(DDDeviceCategory)category
{
  self->_category = category;
}

- (NSString)displayImageName
{
  return self->_displayImageName;
}

- (void)setDisplayImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(NSString *)displayName
{
  objc_setProperty_nonatomic_copy(self, a2, displayName, 48);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(NSString *)identifier
{
  objc_setProperty_nonatomic_copy(self, a2, identifier, 56);
}

- (DDDeviceMediaPlaybackState)mediaPlaybackState
{
  return self->_mediaPlaybackState;
}

- (void)setMediaPlaybackState:(DDDeviceMediaPlaybackState)mediaPlaybackState
{
  self->_mediaPlaybackState = mediaPlaybackState;
}

- (NSString)mediaContentTitle
{
  return self->_mediaContentTitle;
}

- (void)setMediaContentTitle:(NSString *)mediaContentTitle
{
  objc_setProperty_nonatomic_copy(self, a2, mediaContentTitle, 72);
}

- (NSString)mediaContentSubtitle
{
  return self->_mediaContentSubtitle;
}

- (void)setMediaContentSubtitle:(NSString *)mediaContentSubtitle
{
  objc_setProperty_nonatomic_copy(self, a2, mediaContentSubtitle, 80);
}

- (nw_endpoint_t)networkEndpoint
{
  return (nw_endpoint_t)self->_networkEndpoint;
}

- (void)setNetworkEndpoint:(nw_endpoint_t)networkEndpoint
{
  objc_storeStrong((id *)&self->_networkEndpoint, networkEndpoint);
}

- (DDDeviceProtocol)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(DDDeviceProtocol)protocol
{
  self->_protocol = protocol;
}

- (UTType)protocolType
{
  return self->_protocolType;
}

- (void)setProtocolType:(UTType *)protocolType
{
  objc_storeStrong((id *)&self->_protocolType, protocolType);
}

- (DDDeviceState)state
{
  return self->_state;
}

- (void)setState:(DDDeviceState)state
{
  self->_state = state;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)supportsGrouping
{
  return self->_supportsGrouping;
}

- (void)setSupportsGrouping:(BOOL)supportsGrouping
{
  self->_supportsGrouping = supportsGrouping;
}

- (NSData)txtRecordData
{
  return self->_txtRecordData;
}

- (void)setTxtRecordData:(NSData *)txtRecordData
{
  objc_setProperty_nonatomic_copy(self, a2, txtRecordData, 128);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(NSURL *)url
{
  objc_setProperty_nonatomic_copy(self, a2, url, 136);
}

- (BOOL)allowPairing
{
  return self->_allowPairing;
}

- (void)setAllowPairing:(BOOL)a3
{
  self->_allowPairing = a3;
}

- (double)approveTime
{
  return self->_approveTime;
}

- (void)setApproveTime:(double)a3
{
  self->_approveTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_txtRecordData, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
  objc_storeStrong((id *)&self->_protocolType, 0);
  objc_storeStrong((id *)&self->_networkEndpoint, 0);
  objc_storeStrong((id *)&self->_mediaContentSubtitle, 0);
  objc_storeStrong((id *)&self->_mediaContentTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_displayImageName, 0);
  objc_storeStrong((id *)&self->_bluetoothIdentifier, 0);
}

@end
