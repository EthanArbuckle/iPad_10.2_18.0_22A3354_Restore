@implementation DADevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DADevice)initWithCoder:(id)a3
{
  id v4;
  DADevice *v5;
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
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  DADevice *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  objc_super v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)DADevice;
  v5 = -[DADevice init](&v38, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v9 = v8;
    if (objc_msgSend(v9, "containsValueForKey:", CFSTR("dvFl")))
      v5->_flags = objc_msgSend(v9, "decodeIntegerForKey:", CFSTR("dvFl"));

    v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v11 = v10;
    objc_opt_class();
    NSDecodeObjectIfPresent();

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
    if (objc_msgSend(v15, "containsValueForKey:", CFSTR("dvGr")))
      v5->_supportsGrouping = objc_msgSend(v15, "decodeBoolForKey:", CFSTR("dvGr"));

    v16 = v15;
    if (objc_msgSend(v16, "containsValueForKey:", CFSTR("dvCa")))
      v5->_type = objc_msgSend(v16, "decodeIntegerForKey:", CFSTR("dvCa"));

    objc_opt_class();
    NSDecodeObjectIfPresent();
    v17 = v16;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v18 = v17;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v19 = v18;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_storeStrong((id *)&v5->_url, v20);
    v21 = v19;
    if (objc_msgSend(v21, "containsValueForKey:", CFSTR("mpSt")))
      v5->_mediaPlaybackState = objc_msgSend(v21, "decodeIntegerForKey:", CFSTR("mpSt"));

    v22 = v21;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v23 = v22;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v24 = v23;
    if (objc_msgSend(v24, "containsValueForKey:", CFSTR("dvDe")))
      v5->_discoveredInExtension = objc_msgSend(v24, "decodeBoolForKey:", CFSTR("dvDe"));

    v25 = v24;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v26 = v25;
    if (objc_msgSend(v26, "containsValueForKey:", CFSTR("btAP")))
      v5->_allowPairing = objc_msgSend(v26, "decodeBoolForKey:", CFSTR("btAP"));

    v27 = v26;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v28 = v5;
  }
  else
  {
    v30 = objc_opt_class();
    DAErrorF(350001, (uint64_t)"%@ init failed", v31, v32, v33, v34, v35, v36, v30);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v37);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *v4;
  void *v5;
  NSUUID *bluetoothIdentifier;
  NSString *bluetoothOTAName;
  NSURL *displayImageFileURL;
  unint64_t flags;
  NSString *identifier;
  NSString *name;
  OS_nw_endpoint *v12;
  void *v13;
  int64_t protocol;
  UTType *protocolType;
  NSString *SSID;
  int64_t type;
  NSData *txtRecordData;
  void *v19;
  int64_t mediaPlaybackState;
  NSString *mediaContentTitle;
  NSString *mediaContentArtistName;
  NSString *displayImageName;
  NSData *bluetoothClassicAddress;
  id v25;

  v25 = a3;
  v4 = self->_appAccessInfoDeviceMap;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v25, "encodeObject:forKey:", v5, CFSTR("dAaI"));

  }
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
    objc_msgSend(v25, "encodeObject:forKey:", bluetoothIdentifier, CFSTR("btID"));
  bluetoothOTAName = self->_bluetoothOTAName;
  if (bluetoothOTAName)
    objc_msgSend(v25, "encodeObject:forKey:", bluetoothOTAName, CFSTR("btNm"));
  displayImageFileURL = self->_displayImageFileURL;
  if (displayImageFileURL)
    objc_msgSend(v25, "encodeObject:forKey:", displayImageFileURL, CFSTR("dvDIuR"));
  flags = self->_flags;
  if (flags)
    objc_msgSend(v25, "encodeInteger:forKey:", flags, CFSTR("dvFl"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v25, "encodeObject:forKey:", identifier, CFSTR("id"));
  name = self->_name;
  if (name)
    objc_msgSend(v25, "encodeObject:forKey:", name, CFSTR("name"));
  v12 = self->_networkEndpoint;
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDE07C8], "endpointWithCEndpoint:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v25, "encodeObject:forKey:", v13, CFSTR("nwEP"));

  }
  protocol = self->_protocol;
  if (protocol)
    objc_msgSend(v25, "encodeInteger:forKey:", protocol, CFSTR("dvPT"));
  protocolType = self->_protocolType;
  if (protocolType)
    objc_msgSend(v25, "encodeObject:forKey:", protocolType, CFSTR("prTy"));
  SSID = self->_SSID;
  if (SSID)
    objc_msgSend(v25, "encodeObject:forKey:", SSID, CFSTR("ssID"));
  if (self->_supportsGrouping)
    objc_msgSend(v25, "encodeBool:forKey:", 1, CFSTR("dvGr"));
  type = self->_type;
  if (type)
    objc_msgSend(v25, "encodeInteger:forKey:", type, CFSTR("dvCa"));
  txtRecordData = self->_txtRecordData;
  if (txtRecordData)
    objc_msgSend(v25, "encodeObject:forKey:", txtRecordData, CFSTR("txRD"));
  -[NSURL absoluteString](self->_url, "absoluteString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v25, "encodeObject:forKey:", v19, CFSTR("urlS"));
  mediaPlaybackState = self->_mediaPlaybackState;
  if (mediaPlaybackState)
    objc_msgSend(v25, "encodeInteger:forKey:", mediaPlaybackState, CFSTR("mpSt"));
  mediaContentTitle = self->_mediaContentTitle;
  if (mediaContentTitle)
    objc_msgSend(v25, "encodeObject:forKey:", mediaContentTitle, CFSTR("mTi"));
  mediaContentArtistName = self->_mediaContentArtistName;
  if (mediaContentArtistName)
    objc_msgSend(v25, "encodeObject:forKey:", mediaContentArtistName, CFSTR("mArt"));
  if (self->_discoveredInExtension)
    objc_msgSend(v25, "encodeBool:forKey:", 1, CFSTR("dvDe"));
  displayImageName = self->_displayImageName;
  if (displayImageName)
    objc_msgSend(v25, "encodeObject:forKey:", displayImageName, CFSTR("dvDI"));
  if (self->_allowPairing)
    objc_msgSend(v25, "encodeBool:forKey:", 1, CFSTR("btAP"));
  bluetoothClassicAddress = self->_bluetoothClassicAddress;
  if (bluetoothClassicAddress)
    objc_msgSend(v25, "encodeObject:forKey:", bluetoothClassicAddress, CFSTR("btCa"));

}

- (DADevice)initWithPersistentDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  DADevice *v7;
  double v8;
  void *v9;
  uint64_t v10;
  NSUUID *bluetoothIdentifier;
  uint64_t v12;
  NSString *bluetoothOTAName;
  uint64_t v14;
  DADiscoveryConfiguration *discoveryConfiguration;
  uint64_t v16;
  uint64_t v17;
  NSURL *displayImageFileURL;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  OS_nw_endpoint *networkEndpoint;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *SSID;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSData *bluetoothClassicAddress;
  DADevice *v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  objc_super v55;

  v6 = a3;
  v55.receiver = self;
  v55.super_class = (Class)DADevice;
  v7 = -[DADevice init](&v55, sel_init);
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
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v12 = objc_claimAutoreleasedReturnValue();
    bluetoothOTAName = v7->_bluetoothOTAName;
    v7->_bluetoothOTAName = (NSString *)v12;

    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v54, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    discoveryConfiguration = v7->_discoveryConfiguration;
    v7->_discoveryConfiguration = (DADiscoveryConfiguration *)v14;

    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      displayImageFileURL = v7->_displayImageFileURL;
      v7->_displayImageFileURL = (NSURL *)v17;

    }
    NSDictionaryGetNSNumber();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      v7->_flags = objc_msgSend(v19, "unsignedIntValue");
    v52 = v20;
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      objc_storeStrong((id *)&v7->_identifier, v21);
    v53 = (void *)v16;
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_storeStrong((id *)&v7->_name, v22);
    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v51, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v50, "copyCEndpoint");
    networkEndpoint = v7->_networkEndpoint;
    v7->_networkEndpoint = (OS_nw_endpoint *)v23;

    NSDictionaryGetNSNumber();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_protocol = objc_msgSend(v25, "integerValue");

    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        objc_storeStrong((id *)&v7->_protocolType, v27);

    }
    NSDictionaryGetNSNumber();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_state = objc_msgSend(v28, "integerValue");

    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v29 = objc_claimAutoreleasedReturnValue();
    SSID = v7->_SSID;
    v7->_SSID = (NSString *)v29;

    v7->_supportsGrouping = CFDictionaryGetInt64() != 0;
    NSDictionaryGetNSNumber();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_type = objc_msgSend(v31, "integerValue");

    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
      objc_storeStrong((id *)&v7->_txtRecordData, v32);
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
        objc_storeStrong((id *)&v7->_url, v34);

    }
    v7->_pendingRemoval = CFDictionaryGetInt64() != 0;
    NSDictionaryGetNSNumber();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_mediaPlaybackState = objc_msgSend(v35, "integerValue");

    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
      objc_storeStrong((id *)&v7->_mediaContentTitle, v36);
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
      objc_storeStrong((id *)&v7->_mediaContentArtistName, v37);
    v7->_discoveredInExtension = CFDictionaryGetInt64() != 0;
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
      objc_storeStrong((id *)&v7->_displayImageName, v38);
    v7->_allowPairing = CFDictionaryGetInt64() != 0;
    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v39 = objc_claimAutoreleasedReturnValue();
    bluetoothClassicAddress = v7->_bluetoothClassicAddress;
    v7->_bluetoothClassicAddress = (NSData *)v39;

    v41 = v7;
  }
  else if (a4)
  {
    v43 = objc_opt_class();
    DAErrorF(350001, (uint64_t)"%@ super init failed", v44, v45, v46, v47, v48, v49, v43);
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
  NSString *bluetoothOTAName;
  DADiscoveryConfiguration *v8;
  void *v9;
  void *v10;
  NSString *identifier;
  NSString *name;
  OS_nw_endpoint *v13;
  void *v14;
  void *v15;
  void *v16;
  UTType *protocolType;
  void *v18;
  NSString *SSID;
  NSURL *displayImageFileURL;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSData *txtRecordData;
  NSURL *url;
  void *v27;
  void *v28;
  NSString *mediaContentTitle;
  NSString *mediaContentArtistName;
  void *v31;
  NSString *displayImageName;
  void *v33;
  NSData *bluetoothClassicAddress;
  void *v35;
  void *v36;

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
  bluetoothOTAName = self->_bluetoothOTAName;
  if (bluetoothOTAName)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", bluetoothOTAName, CFSTR("bluetoothOTAName"));
  v8 = self->_discoveryConfiguration;
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("configuration"));

  }
  if (self->_flags)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("flags"));

  }
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", identifier, CFSTR("identifier"));
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", name, CFSTR("name"));
  v13 = self->_networkEndpoint;
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDE07C8], "endpointWithCEndpoint:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("nwEndpoint"));

  }
  if (self->_protocol)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("protocol"));

  }
  protocolType = self->_protocolType;
  if (protocolType)
  {
    -[UTType identifier](protocolType, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("protocolType"));

  }
  SSID = self->_SSID;
  if (SSID)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", SSID, CFSTR("deviceSSID"));
  displayImageFileURL = self->_displayImageFileURL;
  if (displayImageFileURL)
  {
    -[NSURL absoluteString](displayImageFileURL, "absoluteString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("displayImageURL"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_state);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("deviceState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_supportsGrouping);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("deviceSupportsGrouping"));

  if (self->_type)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("type"));

  }
  txtRecordData = self->_txtRecordData;
  if (txtRecordData)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", txtRecordData, CFSTR("txtRecordData"));
  url = self->_url;
  if (url)
  {
    -[NSURL absoluteString](url, "absoluteString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("url"));

  }
  if (self->_mediaPlaybackState)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("mediaPlaybackState"));

  }
  mediaContentTitle = self->_mediaContentTitle;
  if (mediaContentTitle)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", mediaContentTitle, CFSTR("mediaContentTitle"));
  mediaContentArtistName = self->_mediaContentArtistName;
  if (mediaContentArtistName)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", mediaContentArtistName, CFSTR("mediaContentArtist"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_discoveredInExtension);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("discoveredInExtension"));

  displayImageName = self->_displayImageName;
  if (displayImageName)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", displayImageName, CFSTR("displayImageName"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowPairing);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("deviceAllowsPairing"));

  bluetoothClassicAddress = self->_bluetoothClassicAddress;
  if (bluetoothClassicAddress)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", bluetoothClassicAddress, CFSTR("deviceBluetoothClassicAddress"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_pendingRemoval);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("pendingRemoval"));

  v36 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v36;
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

- (DADevice)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  DADevice *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  OS_nw_endpoint *networkEndpoint;
  int v18;
  int v19;
  int v20;
  int v21;
  DADevice *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v32.receiver = self;
  v32.super_class = (Class)DADevice;
  v7 = -[DADevice init](&v32, sel_init);
  if (v7)
  {
    CUXPCDecodeNSData();
    if (!CUXPCDecodeNSUUID() || !CUXPCDecodeNSString())
    {
      v22 = 0;
      goto LABEL_41;
    }
    objc_opt_class();
    CUXPCDecodeObject();
    if (!CUXPCDecodeNSString())
      goto LABEL_45;
    v33 = 0;
    v8 = CUXPCDecodeUInt64RangedEx();
    if (v8 == 6)
    {
      v7->_flags = v33;
    }
    else if (v8 == 5)
    {
      goto LABEL_45;
    }
    if (CUXPCDecodeNSString() && CUXPCDecodeNSString())
    {
      xpc_dictionary_get_dictionary(v6, "nwEP");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = nw_endpoint_create_from_dictionary();
        if (!v10)
        {
          if (a4)
          {
            DAErrorF(350001, (uint64_t)"XPC->NW failed", v11, v12, v13, v14, v15, v16, v31);
            v22 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_39;
          }
          goto LABEL_51;
        }
        networkEndpoint = v7->_networkEndpoint;
        v7->_networkEndpoint = (OS_nw_endpoint *)v10;

      }
      v33 = 0;
      v18 = CUXPCDecodeSInt64RangedEx();
      if (v18 == 6)
      {
        v7->_protocol = v33;
LABEL_16:
        if (!CUXPCDecodeNSString() || !CUXPCDecodeNSString())
          goto LABEL_44;
        v33 = 0;
        v19 = CUXPCDecodeSInt64RangedEx();
        if (v19 == 6)
        {
          v7->_state = v33;
        }
        else if (v19 == 5)
        {
          goto LABEL_44;
        }
        if (CUXPCDecodeBool())
        {
          v33 = 0;
          v20 = CUXPCDecodeSInt64RangedEx();
          if (v20 == 6)
          {
            v7->_type = v33;
          }
          else if (v20 == 5)
          {
            goto LABEL_44;
          }
          if (CUXPCDecodeNSData())
          {
            if (CUXPCDecodeNSString())
            {
              v33 = 0;
              v21 = CUXPCDecodeSInt64RangedEx();
              if (v21 == 6)
              {
                v7->_mediaPlaybackState = v33;
              }
              else if (v21 == 5)
              {
                goto LABEL_43;
              }
              if (CUXPCDecodeNSString()
                && CUXPCDecodeNSString()
                && CUXPCDecodeBool()
                && CUXPCDecodeNSString()
                && CUXPCDecodeBool()
                && CUXPCDecodeNSData())
              {
                v22 = v7;
LABEL_37:

LABEL_38:
LABEL_39:

LABEL_40:
LABEL_41:

                goto LABEL_42;
              }
            }
LABEL_43:
            v22 = 0;
            goto LABEL_37;
          }
        }
LABEL_44:
        v22 = 0;
        goto LABEL_38;
      }
      if (v18 != 5)
        goto LABEL_16;
LABEL_51:
      v22 = 0;
      goto LABEL_39;
    }
LABEL_45:
    v22 = 0;
    goto LABEL_40;
  }
  if (a4)
  {
    v24 = objc_opt_class();
    DAErrorF(350001, (uint64_t)"%@ super init failed", v25, v26, v27, v28, v29, v30, v24);
    v22 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
LABEL_42:

  return v22;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  const char *v11;
  NSUUID *bluetoothIdentifier;
  id v13;
  NSString *bluetoothOTAName;
  id v15;
  const char *v16;
  NSURL *v17;
  NSURL *v18;
  void *v19;
  id v20;
  id v21;
  const char *v22;
  NSString *identifier;
  id v24;
  const char *v25;
  NSString *name;
  id v27;
  const char *v28;
  OS_nw_endpoint *v29;
  OS_nw_endpoint *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  const char *v35;
  NSString *SSID;
  id v37;
  const char *v38;
  NSData *txtRecordData;
  NSData *v40;
  id v41;
  NSData *v42;
  uint64_t v43;
  const char *v44;
  size_t v45;
  NSURL *v46;
  NSURL *v47;
  void *v48;
  id v49;
  id v50;
  const char *v51;
  NSString *mediaContentTitle;
  id v53;
  const char *v54;
  NSString *mediaContentArtistName;
  id v56;
  const char *v57;
  NSString *displayImageName;
  id v59;
  const char *v60;
  NSData *bluetoothClassicAddress;
  NSData *v62;
  id v63;
  NSData *v64;
  uint64_t v65;
  const char *v66;
  size_t v67;
  unsigned __int8 uuid[16];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_appAccessInfoDeviceMap;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_retainAutorelease(v6);
      v9 = v4;
      v10 = objc_msgSend(v8, "bytes");
      if (v10)
        v11 = (const char *)v10;
      else
        v11 = "";
      xpc_dictionary_set_data(v9, "dAaI", v11, objc_msgSend(v8, "length"));

    }
  }
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    v13 = v4;
    -[NSUUID getUUIDBytes:](bluetoothIdentifier, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v13, "btID", uuid);

  }
  bluetoothOTAName = self->_bluetoothOTAName;
  v15 = v4;
  v16 = -[NSString UTF8String](objc_retainAutorelease(bluetoothOTAName), "UTF8String");
  if (v16)
    xpc_dictionary_set_string(v15, "btNm", v16);

  CUXPCEncodeObject();
  v17 = self->_displayImageFileURL;
  v18 = v17;
  if (v17)
  {
    -[NSURL absoluteString](v17, "absoluteString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v15;
    v21 = objc_retainAutorelease(v19);
    v22 = (const char *)objc_msgSend(v21, "UTF8String");
    if (v22)
      xpc_dictionary_set_string(v20, "dvDIuR", v22);

  }
  xpc_dictionary_set_uint64(v15, "dvFl", self->_flags);
  identifier = self->_identifier;
  v24 = v15;
  v25 = -[NSString UTF8String](objc_retainAutorelease(identifier), "UTF8String");
  if (v25)
    xpc_dictionary_set_string(v24, "id", v25);

  name = self->_name;
  v27 = v24;
  v28 = -[NSString UTF8String](objc_retainAutorelease(name), "UTF8String");
  if (v28)
    xpc_dictionary_set_string(v27, "name", v28);

  v29 = self->_networkEndpoint;
  v30 = v29;
  if (v29)
  {
    v31 = (void *)MEMORY[0x2199CA5C4](v29);
    if (v31)
      xpc_dictionary_set_value(v27, "nwEP", v31);

  }
  xpc_dictionary_set_int64(v27, "dvPT", self->_protocol);
  -[UTType identifier](self->_protocolType, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v27;
  v34 = objc_retainAutorelease(v32);
  v35 = (const char *)objc_msgSend(v34, "UTF8String");
  if (v35)
    xpc_dictionary_set_string(v33, "prTy", v35);

  SSID = self->_SSID;
  v37 = v33;
  v38 = -[NSString UTF8String](objc_retainAutorelease(SSID), "UTF8String");
  if (v38)
    xpc_dictionary_set_string(v37, "ssID", v38);

  xpc_dictionary_set_int64(v37, "dvSt", self->_state);
  if (self->_supportsGrouping)
    xpc_dictionary_set_BOOL(v37, "dvGr", 1);
  xpc_dictionary_set_int64(v37, "dvCa", self->_type);
  txtRecordData = self->_txtRecordData;
  if (txtRecordData)
  {
    v40 = objc_retainAutorelease(txtRecordData);
    v41 = v37;
    v42 = v40;
    v43 = -[NSData bytes](v42, "bytes");
    if (v43)
      v44 = (const char *)v43;
    else
      v44 = "";
    v45 = -[NSData length](v42, "length");

    xpc_dictionary_set_data(v41, "txRD", v44, v45);
  }
  v46 = self->_url;
  v47 = v46;
  if (v46)
  {
    -[NSURL absoluteString](v46, "absoluteString");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v37;
    v50 = objc_retainAutorelease(v48);
    v51 = (const char *)objc_msgSend(v50, "UTF8String");
    if (v51)
      xpc_dictionary_set_string(v49, "urlS", v51);

  }
  xpc_dictionary_set_int64(v37, "mpSt", self->_mediaPlaybackState);
  mediaContentTitle = self->_mediaContentTitle;
  v53 = v37;
  v54 = -[NSString UTF8String](objc_retainAutorelease(mediaContentTitle), "UTF8String");
  if (v54)
    xpc_dictionary_set_string(v53, "mTi", v54);

  mediaContentArtistName = self->_mediaContentArtistName;
  v56 = v53;
  v57 = -[NSString UTF8String](objc_retainAutorelease(mediaContentArtistName), "UTF8String");
  if (v57)
    xpc_dictionary_set_string(v56, "mArt", v57);

  if (self->_discoveredInExtension)
    xpc_dictionary_set_BOOL(v56, "dvDe", 1);
  displayImageName = self->_displayImageName;
  v59 = v56;
  v60 = -[NSString UTF8String](objc_retainAutorelease(displayImageName), "UTF8String");
  if (v60)
    xpc_dictionary_set_string(v59, "dvDI", v60);

  if (self->_allowPairing)
    xpc_dictionary_set_BOOL(v59, "btAP", 1);
  bluetoothClassicAddress = self->_bluetoothClassicAddress;
  if (bluetoothClassicAddress)
  {
    v62 = objc_retainAutorelease(bluetoothClassicAddress);
    v63 = v59;
    v64 = v62;
    v65 = -[NSData bytes](v64, "bytes");
    if (v65)
      v66 = (const char *)v65;
    else
      v66 = "";
    v67 = -[NSData length](v64, "length");

    xpc_dictionary_set_data(v63, "btCa", v66, v67);
  }

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
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v4 + 176) = self->_approveTime;
  v5 = -[NSMutableDictionary copy](self->_appAccessInfoDeviceMap, "copy");
  v6 = *(void **)(v4 + 168);
  *(_QWORD *)(v4 + 168) = v5;

  v7 = -[NSData copy](self->_bluetoothClassicAddress, "copy");
  v8 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v7;

  v9 = -[NSUUID copy](self->_bluetoothIdentifier, "copy");
  v10 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v9;

  v11 = -[NSString copy](self->_bluetoothOTAName, "copy");
  v12 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v11;

  v13 = -[DADiscoveryConfiguration copy](self->_discoveryConfiguration, "copy");
  v14 = *(void **)(v4 + 184);
  *(_QWORD *)(v4 + 184) = v13;

  v15 = -[NSURL copy](self->_displayImageFileURL, "copy");
  v16 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v15;

  v17 = -[NSDictionary copy](self->_endpoints, "copy");
  v18 = *(void **)(v4 + 192);
  *(_QWORD *)(v4 + 192) = v17;

  *(_QWORD *)(v4 + 56) = self->_flags;
  v19 = -[NSString copy](self->_identifier, "copy");
  v20 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v19;

  v21 = -[NSString copy](self->_name, "copy");
  v22 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = v21;

  objc_storeStrong((id *)(v4 + 104), self->_networkEndpoint);
  *(_QWORD *)(v4 + 112) = self->_protocol;
  v23 = -[UTType copy](self->_protocolType, "copy");
  v24 = *(void **)(v4 + 120);
  *(_QWORD *)(v4 + 120) = v23;

  v25 = -[NSString copy](self->_SSID, "copy");
  v26 = *(void **)(v4 + 128);
  *(_QWORD *)(v4 + 128) = v25;

  *(_QWORD *)(v4 + 136) = self->_state;
  *(_BYTE *)(v4 + 10) = self->_supportsGrouping;
  *(_QWORD *)(v4 + 152) = self->_type;
  v27 = -[NSData copy](self->_txtRecordData, "copy");
  v28 = *(void **)(v4 + 144);
  *(_QWORD *)(v4 + 144) = v27;

  v29 = -[NSURL copy](self->_url, "copy");
  v30 = *(void **)(v4 + 160);
  *(_QWORD *)(v4 + 160) = v29;

  *(_QWORD *)(v4 + 72) = self->_mediaPlaybackState;
  v31 = -[NSString copy](self->_mediaContentTitle, "copy");
  v32 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = v31;

  v33 = -[NSString copy](self->_mediaContentArtistName, "copy");
  v34 = *(void **)(v4 + 88);
  *(_QWORD *)(v4 + 88) = v33;

  *(_BYTE *)(v4 + 9) = self->_discoveredInExtension;
  v35 = -[NSString copy](self->_displayImageName, "copy");
  v36 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v35;

  *(_BYTE *)(v4 + 8) = self->_allowPairing;
  *(_BYTE *)(v4 + 11) = self->_pendingRemoval;
  return (id)v4;
}

- (id)description
{
  return -[DADevice descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  int v5;
  NSString *v6;
  id *v7;
  NSString *v8;
  id *v9;
  UTType *v10;
  id *v11;
  id *v12;
  id *v13;
  NSUUID *v14;
  id *v15;
  NSData *v16;
  id *v17;
  NSString *v18;
  id *v19;
  OS_nw_endpoint *v20;
  id *v21;
  NSDictionary *v22;
  NSDictionary *v23;
  id *v24;
  unint64_t flags;
  id *v26;
  int64_t protocol;
  __CFString *v28;
  id *v29;
  NSString *v30;
  id *v31;
  id *v32;
  unint64_t type;
  const __CFString *v34;
  NSData *v35;
  id *v36;
  NSURL *v37;
  NSURL *v38;
  id *v39;
  int64_t mediaPlaybackState;
  const __CFString *v41;
  __CFString *v42;
  id *v43;
  NSString *v44;
  NSString *v45;
  id *v46;
  NSString *v47;
  NSString *v48;
  id *v49;
  id *v50;
  NSString *v51;
  NSString *v52;
  id *v53;
  id *v54;
  id *v55;
  NSDictionary *endpoints;
  uint64_t v57;
  NSMutableDictionary *appAccessInfoDeviceMap;
  __CFString *v59;
  __CFString *v60;
  void *v62;
  void *v63;
  void *v64;
  __CFString *v65;
  char *v66;
  _QWORD v67[6];
  int v68;
  _QWORD v69[6];
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id obj;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  uint64_t v93;
  _QWORD v94[3];
  int v95;
  uint64_t v96;
  id *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;

  v96 = 0;
  v97 = (id *)&v96;
  v98 = 0x3032000000;
  v99 = __Block_byref_object_copy__0;
  v100 = __Block_byref_object_dispose__0;
  v101 = 0;
  v94[0] = 0;
  v94[1] = v94;
  v94[2] = 0x2020000000;
  if ((a3 & 0x8000000) != 0)
    v5 = 8;
  else
    v5 = 12;
  v95 = v5;
  if ((a3 & 0x8000000) == 0)
  {
    v93 = 0;
    objc_opt_class();
    CUAppendF();
    objc_storeStrong(&v101, 0);
  }
  v6 = self->_identifier;
  if (v6)
  {
    v7 = v97;
    v92 = v97[5];
    CUAppendF();
    objc_storeStrong(v7 + 5, v92);
  }

  v8 = self->_name;
  if (v8)
  {
    v9 = v97;
    v91 = v97[5];
    CUAppendF();
    objc_storeStrong(v9 + 5, v91);
  }

  v10 = self->_protocolType;
  if (v10)
  {
    v11 = v97;
    v90 = v97[5];
    CUAppendF();
    objc_storeStrong(v11 + 5, v90);
  }

  if ((self->_flags & 8) == 0)
  {
    v12 = v97;
    v89 = v97[5];
    DADeviceStateToString(self->_state);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    objc_storeStrong(v12 + 5, v89);

  }
  if (self->_supportsGrouping)
  {
    v13 = v97;
    v88 = v97[5];
    CUAppendF();
    objc_storeStrong(v13 + 5, v88);
  }
  v14 = self->_bluetoothIdentifier;
  if (v14)
  {
    v15 = v97;
    v87 = v97[5];
    CUAppendF();
    objc_storeStrong(v15 + 5, v87);
  }

  v16 = self->_bluetoothClassicAddress;
  if (v16)
  {
    v17 = v97;
    obj = v97[5];
    CUPrintNSDataAddress();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    objc_storeStrong(v17 + 5, obj);

  }
  v18 = self->_bluetoothOTAName;
  if (v18)
  {
    v19 = v97;
    v85 = v97[5];
    CUAppendF();
    objc_storeStrong(v19 + 5, v85);
  }

  v20 = self->_networkEndpoint;
  if (v20)
  {
    v21 = v97;
    v84 = v97[5];
    CUAppendF();
    objc_storeStrong(v21 + 5, v84);
  }

  v22 = self->_endpoints;
  v23 = v22;
  if (v22)
  {
    v24 = v97;
    v83 = v97[5];
    -[NSDictionary count](v22, "count");
    CUAppendF();
    objc_storeStrong(v24 + 5, v83);
  }

  flags = self->_flags;
  if (flags)
  {
    v26 = v97;
    v82 = v97[5];
    DADeviceFlagsToString(flags);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    objc_storeStrong(v26 + 5, v82);

  }
  protocol = self->_protocol;
  if (protocol)
  {
    if (protocol == 1)
      v28 = CFSTR("DIAL");
    else
      v28 = CFSTR("?");
    v29 = v97;
    v81 = v97[5];
    v65 = v28;
    CUAppendF();
    objc_storeStrong(v29 + 5, v81);

  }
  v30 = self->_SSID;
  if (v30)
  {
    v31 = v97;
    v80 = v97[5];
    CUAppendF();
    objc_storeStrong(v31 + 5, v80);
  }

  v32 = v97 + 5;
  v79 = v97[5];
  type = self->_type;
  v34 = CFSTR("?");
  if (type < 7)
    v34 = off_24D1690B0[type];
  v66 = (char *)v34;
  CUAppendF();
  objc_storeStrong(v32, v79);
  v35 = self->_txtRecordData;
  if (v35)
  {
    v36 = v97;
    v78 = v97[5];
    CUPrintNSObjectOneLine();
    v66 = (char *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    objc_storeStrong(v36 + 5, v78);

  }
  v37 = self->_url;
  v38 = v37;
  if (v37)
  {
    v39 = v97;
    v77 = v97[5];
    v66 = (char *)v37;
    CUAppendF();
    objc_storeStrong(v39 + 5, v77);
  }

  mediaPlaybackState = self->_mediaPlaybackState;
  if (mediaPlaybackState)
  {
    v41 = CFSTR("Paused");
    if (mediaPlaybackState != 1)
      v41 = CFSTR("?");
    if (mediaPlaybackState == 2)
      v42 = CFSTR("Playing");
    else
      v42 = (__CFString *)v41;
    v43 = v97;
    v76 = v97[5];
    v66 = v42;
    CUAppendF();
    objc_storeStrong(v43 + 5, v76);

  }
  v44 = self->_mediaContentTitle;
  v45 = v44;
  if (v44)
  {
    v46 = v97;
    v75 = v97[5];
    v66 = (char *)v44;
    CUAppendF();
    objc_storeStrong(v46 + 5, v75);
  }

  v47 = self->_mediaContentArtistName;
  v48 = v47;
  if (v47)
  {
    v49 = v97;
    v74 = v97[5];
    v66 = (char *)v47;
    CUAppendF();
    objc_storeStrong(v49 + 5, v74);
  }

  if (self->_discoveredInExtension)
  {
    v50 = v97;
    v73 = v97[5];
    v66 = "yes";
    CUAppendF();
    objc_storeStrong(v50 + 5, v73);
  }
  v51 = self->_displayImageName;
  v52 = v51;
  if (v51)
  {
    v53 = v97;
    v72 = v97[5];
    v66 = (char *)v51;
    CUAppendF();
    objc_storeStrong(v53 + 5, v72);
  }

  if (self->_allowPairing)
  {
    v54 = v97;
    v71 = v97[5];
    v66 = "yes";
    CUAppendF();
    objc_storeStrong(v54 + 5, v71);
  }
  if (self->_pendingRemoval)
  {
    v55 = v97;
    v70 = v97[5];
    v66 = "yes";
    CUAppendF();
    objc_storeStrong(v55 + 5, v70);
  }
  endpoints = self->_endpoints;
  v57 = MEMORY[0x24BDAC760];
  v69[0] = MEMORY[0x24BDAC760];
  v69[1] = 3221225472;
  v69[2] = __33__DADevice_descriptionWithLevel___block_invoke;
  v69[3] = &unk_24D169050;
  v69[4] = &v96;
  v69[5] = v94;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](endpoints, "enumerateKeysAndObjectsUsingBlock:", v69, v66);
  appAccessInfoDeviceMap = self->_appAccessInfoDeviceMap;
  v67[0] = v57;
  v67[1] = 3221225472;
  v67[2] = __33__DADevice_descriptionWithLevel___block_invoke_2;
  v67[3] = &unk_24D169078;
  v67[4] = &v96;
  v67[5] = v94;
  v68 = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appAccessInfoDeviceMap, "enumerateKeysAndObjectsUsingBlock:", v67);
  v59 = (__CFString *)v97[5];
  if (!v59)
    v59 = &stru_24D169BB8;
  v60 = v59;
  _Block_object_dispose(v94, 8);
  _Block_object_dispose(&v96, 8);

  return v60;
}

void __33__DADevice_descriptionWithLevel___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  id obj;

  if (objc_msgSend(a3, "selected"))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    obj = *(id *)(v6 + 40);
    CUAppendF();
    objc_storeStrong((id *)(v6 + 40), obj);
    *a4 = 1;
  }
}

void __33__DADevice_descriptionWithLevel___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id obj;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v1 + 40);
  CUDescriptionWithLevel();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CUAppendF();
  objc_storeStrong((id *)(v1 + 40), obj);

}

- (NSDictionary)appAccessInfoMap
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_appAccessInfoDeviceMap, "copy");
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

- (BOOL)allowPairing
{
  return self->_allowPairing;
}

- (void)setAllowPairing:(BOOL)a3
{
  self->_allowPairing = a3;
}

- (NSData)bluetoothClassicAddress
{
  return self->_bluetoothClassicAddress;
}

- (void)setBluetoothClassicAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)bluetoothIdentifier
{
  return self->_bluetoothIdentifier;
}

- (void)setBluetoothIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothIdentifier, a3);
}

- (NSString)bluetoothOTAName
{
  return self->_bluetoothOTAName;
}

- (void)setBluetoothOTAName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)discoveredInExtension
{
  return self->_discoveredInExtension;
}

- (void)setDiscoveredInExtension:(BOOL)a3
{
  self->_discoveredInExtension = a3;
}

- (NSURL)displayImageFileURL
{
  return self->_displayImageFileURL;
}

- (void)setDisplayImageFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)displayImageName
{
  return self->_displayImageName;
}

- (void)setDisplayImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)mediaPlaybackState
{
  return self->_mediaPlaybackState;
}

- (void)setMediaPlaybackState:(int64_t)a3
{
  self->_mediaPlaybackState = a3;
}

- (NSString)mediaContentTitle
{
  return self->_mediaContentTitle;
}

- (void)setMediaContentTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)mediaContentArtistName
{
  return self->_mediaContentArtistName;
}

- (void)setMediaContentArtistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (OS_nw_endpoint)networkEndpoint
{
  return self->_networkEndpoint;
}

- (void)setNetworkEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_networkEndpoint, a3);
}

- (int64_t)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(int64_t)a3
{
  self->_protocol = a3;
}

- (UTType)protocolType
{
  return self->_protocolType;
}

- (void)setProtocolType:(id)a3
{
  objc_storeStrong((id *)&self->_protocolType, a3);
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)supportsGrouping
{
  return self->_supportsGrouping;
}

- (void)setSupportsGrouping:(BOOL)a3
{
  self->_supportsGrouping = a3;
}

- (NSData)txtRecordData
{
  return self->_txtRecordData;
}

- (void)setTxtRecordData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSMutableDictionary)appAccessInfoDeviceMap
{
  return self->_appAccessInfoDeviceMap;
}

- (void)setAppAccessInfoDeviceMap:(id)a3
{
  objc_storeStrong((id *)&self->_appAccessInfoDeviceMap, a3);
}

- (double)approveTime
{
  return self->_approveTime;
}

- (void)setApproveTime:(double)a3
{
  self->_approveTime = a3;
}

- (DADiscoveryConfiguration)discoveryConfiguration
{
  return self->_discoveryConfiguration;
}

- (void)setDiscoveryConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSDictionary)endpoints
{
  return self->_endpoints;
}

- (void)setEndpoints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (BOOL)pendingRemoval
{
  return self->_pendingRemoval;
}

- (void)setPendingRemoval:(BOOL)a3
{
  self->_pendingRemoval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_discoveryConfiguration, 0);
  objc_storeStrong((id *)&self->_appAccessInfoDeviceMap, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_txtRecordData, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
  objc_storeStrong((id *)&self->_protocolType, 0);
  objc_storeStrong((id *)&self->_networkEndpoint, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mediaContentArtistName, 0);
  objc_storeStrong((id *)&self->_mediaContentTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayImageName, 0);
  objc_storeStrong((id *)&self->_displayImageFileURL, 0);
  objc_storeStrong((id *)&self->_bluetoothOTAName, 0);
  objc_storeStrong((id *)&self->_bluetoothIdentifier, 0);
  objc_storeStrong((id *)&self->_bluetoothClassicAddress, 0);
}

@end
