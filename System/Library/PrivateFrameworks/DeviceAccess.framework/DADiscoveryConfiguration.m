@implementation DADiscoveryConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DADiscoveryConfiguration)initWithCoder:(id)a3
{
  id v4;
  DADiscoveryConfiguration *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  DADiscoveryConfiguration *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[DADiscoveryConfiguration init](self, "init");
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v31 = 0;
    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v11 = v10;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v12 = v11;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v13 = v12;
    if (objc_msgSend(v13, "containsValueForKey:", CFSTR("btAP")))
      v5->_allowsBluetoothPairing = objc_msgSend(v13, "decodeBoolForKey:", CFSTR("btAP"));

    v14 = v13;
    if (objc_msgSend(v14, "containsValueForKey:", CFSTR("btRg")))
      v5->_bluetoothRange = objc_msgSend(v14, "decodeIntegerForKey:", CFSTR("btRg"));

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    v15 = v14;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v16 = v15;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v17 = v16;
    if (objc_msgSend(v17, "containsValueForKey:", CFSTR("alRn")))
      v5->_allowsRename = objc_msgSend(v17, "decodeBoolForKey:", CFSTR("alRn"));

    v18 = v17;
    if (objc_msgSend(v18, "containsValueForKey:", CFSTR("dsFs")))
      v5->_flags = objc_msgSend(v18, "decodeIntegerForKey:", CFSTR("dsFs"));

    v19 = v18;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    v20 = v19;
    if (objc_msgSend(v20, "containsValueForKey:", CFSTR("prOn")))
      v5->_presenceOnly = objc_msgSend(v20, "decodeBoolForKey:", CFSTR("prOn"));

    v21 = v5;
  }
  else
  {
    v23 = objc_opt_class();
    DAErrorF(350001, (uint64_t)"%@ init failed", v24, v25, v26, v27, v28, v29, v23);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v30);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSString *associationIdentifier;
  NSUUID *bluetoothIdentifier;
  NSArray *bluetoothCompanyIdentifiers;
  NSData *bluetoothCompanyPayload;
  NSData *bluetoothCompanyPayloadMask;
  NSArray *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSData *bluetoothServicePayload;
  NSData *bluetoothServicePayloadMask;
  NSString *bluetoothNameSubstring;
  int64_t bluetoothRange;
  NSArray *bonjourServiceTypes;
  NSString *bundleID;
  NSString *displayName;
  unint64_t flags;
  NSString *networkHotspotSSID;
  NSArray *hotspotSSIDs;
  NSArray *hotspotSSIDPrefixes;
  UTType *iconType;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  associationIdentifier = self->_associationIdentifier;
  if (associationIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", associationIdentifier, CFSTR("id"));
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
    objc_msgSend(v5, "encodeObject:forKey:", bluetoothIdentifier, CFSTR("btID"));
  bluetoothCompanyIdentifiers = self->_bluetoothCompanyIdentifiers;
  if (bluetoothCompanyIdentifiers)
    objc_msgSend(v5, "encodeObject:forKey:", bluetoothCompanyIdentifiers, CFSTR("btCI"));
  bluetoothCompanyPayload = self->_bluetoothCompanyPayload;
  if (bluetoothCompanyPayload)
    objc_msgSend(v5, "encodeObject:forKey:", bluetoothCompanyPayload, CFSTR("btCP"));
  bluetoothCompanyPayloadMask = self->_bluetoothCompanyPayloadMask;
  if (bluetoothCompanyPayloadMask)
    objc_msgSend(v5, "encodeObject:forKey:", bluetoothCompanyPayloadMask, CFSTR("btCM"));
  v11 = self->_bluetoothServices;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v13 = v11;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "data", (_QWORD)v31);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v15);
  }

  if (v12)
    objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("btSv"));
  bluetoothServicePayload = self->_bluetoothServicePayload;
  if (bluetoothServicePayload)
    objc_msgSend(v5, "encodeObject:forKey:", bluetoothServicePayload, CFSTR("btSP"));
  bluetoothServicePayloadMask = self->_bluetoothServicePayloadMask;
  if (bluetoothServicePayloadMask)
    objc_msgSend(v5, "encodeObject:forKey:", bluetoothServicePayloadMask, CFSTR("btSM"));
  bluetoothNameSubstring = self->_bluetoothNameSubstring;
  if (bluetoothNameSubstring)
    objc_msgSend(v5, "encodeObject:forKey:", bluetoothNameSubstring, CFSTR("btNS"));
  if (self->_allowsBluetoothPairing)
    objc_msgSend(v5, "encodeBool:forKey:", 1, CFSTR("btAP"));
  bluetoothRange = self->_bluetoothRange;
  if (bluetoothRange)
    objc_msgSend(v5, "encodeInteger:forKey:", bluetoothRange, CFSTR("btRg"));
  bonjourServiceTypes = self->_bonjourServiceTypes;
  if (bonjourServiceTypes)
    objc_msgSend(v5, "encodeObject:forKey:", bonjourServiceTypes, CFSTR("bjST"));
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v5, "encodeObject:forKey:", bundleID, CFSTR("bndI"));
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v5, "encodeObject:forKey:", displayName, CFSTR("name"));
  if (self->_allowsRename)
    objc_msgSend(v5, "encodeBool:forKey:", 1, CFSTR("alRn"));
  flags = self->_flags;
  if (flags)
    objc_msgSend(v5, "encodeInteger:forKey:", flags, CFSTR("dsFs"));
  networkHotspotSSID = self->_networkHotspotSSID;
  if (networkHotspotSSID)
    objc_msgSend(v5, "encodeObject:forKey:", networkHotspotSSID, CFSTR("neHsd"));
  hotspotSSIDs = self->_hotspotSSIDs;
  if (hotspotSSIDs)
    objc_msgSend(v5, "encodeObject:forKey:", hotspotSSIDs, CFSTR("hSds"));
  hotspotSSIDPrefixes = self->_hotspotSSIDPrefixes;
  if (hotspotSSIDPrefixes)
    objc_msgSend(v5, "encodeObject:forKey:", hotspotSSIDPrefixes, CFSTR("hSPs"));
  iconType = self->_iconType;
  if (iconType)
    objc_msgSend(v5, "encodeObject:forKey:", iconType, CFSTR("dvPT"));
  if (self->_presenceOnly)
    objc_msgSend(v5, "encodeBool:forKey:", 1, CFSTR("prOn"));

}

- (DADiscoveryConfiguration)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  DADiscoveryConfiguration *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  DADiscoveryConfiguration *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a3;
  v7 = -[DADiscoveryConfiguration init](self, "init");
  if (!v7)
  {
    if (!a4)
      goto LABEL_31;
    v24 = objc_opt_class();
    DAErrorF(350001, (uint64_t)"%@ init failed", v17, v18, v19, v20, v21, v22, v24);
LABEL_30:
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  if (MEMORY[0x2199CAB58](v6) != MEMORY[0x24BDACFA0])
  {
    if (!a4)
      goto LABEL_31;
    DAErrorF(350004, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
    goto LABEL_30;
  }
  if (!CUXPCDecodeNSString()
    || !CUXPCDecodeNSUUID()
    || !CUXPCDecodeNSArrayOfInteger()
    || !CUXPCDecodeNSData()
    || !CUXPCDecodeNSData())
  {
    goto LABEL_31;
  }
  v14 = CUXPCDecodeSInt64RangedEx();
  if (v14 == 6)
  {
    v7->_bluetoothRange = 0;
    goto LABEL_11;
  }
  if (v14 == 5)
  {
LABEL_31:
    v15 = 0;
    goto LABEL_25;
  }
LABEL_11:
  if (!DAXPCDecodeNSArrayOfCBUUID(v6, "btSv", (id *)&v7->_bluetoothServices, a4)
    || !CUXPCDecodeNSData()
    || !CUXPCDecodeNSData()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeBool()
    || !CUXPCDecodeNSArrayOfNSString()
    || !CUXPCDecodeNSString())
  {
    goto LABEL_31;
  }
  CUXPCDecodeNSString();
  CUXPCDecodeBool();
  if (CUXPCDecodeUInt64RangedEx() == 6)
    v7->_flags = 0;
  CUXPCDecodeNSString();
  if (!CUXPCDecodeNSArrayOfNSString() || !CUXPCDecodeNSArrayOfNSString())
    goto LABEL_31;
  CUXPCDecodeNSString();
  if (CUXPCDecodeBool())
    v15 = v7;
  else
    v15 = 0;

LABEL_25:
  return v15;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  const char *v5;
  NSUUID *bluetoothIdentifier;
  id v7;
  NSData *bluetoothCompanyPayload;
  NSData *v9;
  id v10;
  NSData *v11;
  uint64_t v12;
  const char *v13;
  size_t v14;
  NSData *bluetoothCompanyPayloadMask;
  NSData *v16;
  id v17;
  NSData *v18;
  uint64_t v19;
  const char *v20;
  size_t v21;
  int64_t bluetoothRange;
  NSData *bluetoothServicePayload;
  NSData *v24;
  id v25;
  NSData *v26;
  uint64_t v27;
  const char *v28;
  size_t v29;
  NSData *bluetoothServicePayloadMask;
  NSData *v31;
  id v32;
  NSData *v33;
  uint64_t v34;
  const char *v35;
  size_t v36;
  NSString *bluetoothNameSubstring;
  id v38;
  const char *v39;
  NSString *bundleID;
  id v41;
  const char *v42;
  uint64_t flags;
  NSString *networkHotspotSSID;
  id v45;
  const char *v46;
  NSString *displayName;
  id v48;
  const char *v49;
  void *v50;
  id v51;
  id v52;
  const char *v53;
  unsigned __int8 uuid[16];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[NSString UTF8String](objc_retainAutorelease(self->_associationIdentifier), "UTF8String");
  if (v5)
    xpc_dictionary_set_string(v4, "id", v5);
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    v7 = v4;
    -[NSUUID getUUIDBytes:](bluetoothIdentifier, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v7, "btID", uuid);

  }
  CUXPCEncodeNSArrayOfNSNumber();
  bluetoothCompanyPayload = self->_bluetoothCompanyPayload;
  if (bluetoothCompanyPayload)
  {
    v9 = objc_retainAutorelease(bluetoothCompanyPayload);
    v10 = v4;
    v11 = v9;
    v12 = -[NSData bytes](v11, "bytes");
    if (v12)
      v13 = (const char *)v12;
    else
      v13 = "";
    v14 = -[NSData length](v11, "length");

    xpc_dictionary_set_data(v10, "btCP", v13, v14);
  }
  bluetoothCompanyPayloadMask = self->_bluetoothCompanyPayloadMask;
  if (bluetoothCompanyPayloadMask)
  {
    v16 = objc_retainAutorelease(bluetoothCompanyPayloadMask);
    v17 = v4;
    v18 = v16;
    v19 = -[NSData bytes](v18, "bytes");
    if (v19)
      v20 = (const char *)v19;
    else
      v20 = "";
    v21 = -[NSData length](v18, "length");

    xpc_dictionary_set_data(v17, "btCM", v20, v21);
  }
  bluetoothRange = self->_bluetoothRange;
  if (bluetoothRange)
    xpc_dictionary_set_int64(v4, "btRg", bluetoothRange);
  DAXPCEncodeNSArrayOfCBUUID(v4, "btSv", self->_bluetoothServices);
  bluetoothServicePayload = self->_bluetoothServicePayload;
  if (bluetoothServicePayload)
  {
    v24 = objc_retainAutorelease(bluetoothServicePayload);
    v25 = v4;
    v26 = v24;
    v27 = -[NSData bytes](v26, "bytes");
    if (v27)
      v28 = (const char *)v27;
    else
      v28 = "";
    v29 = -[NSData length](v26, "length");

    xpc_dictionary_set_data(v25, "btSP", v28, v29);
  }
  bluetoothServicePayloadMask = self->_bluetoothServicePayloadMask;
  if (bluetoothServicePayloadMask)
  {
    v31 = objc_retainAutorelease(bluetoothServicePayloadMask);
    v32 = v4;
    v33 = v31;
    v34 = -[NSData bytes](v33, "bytes");
    if (v34)
      v35 = (const char *)v34;
    else
      v35 = "";
    v36 = -[NSData length](v33, "length");

    xpc_dictionary_set_data(v32, "btSM", v35, v36);
  }
  bluetoothNameSubstring = self->_bluetoothNameSubstring;
  v38 = v4;
  v39 = -[NSString UTF8String](objc_retainAutorelease(bluetoothNameSubstring), "UTF8String");
  if (v39)
    xpc_dictionary_set_string(v38, "btNS", v39);

  if (self->_allowsBluetoothPairing)
    xpc_dictionary_set_BOOL(v38, "btAP", 1);
  CUXPCEncodeNSArrayOfNSString();
  bundleID = self->_bundleID;
  v41 = v38;
  v42 = -[NSString UTF8String](objc_retainAutorelease(bundleID), "UTF8String");
  if (v42)
    xpc_dictionary_set_string(v41, "bndI", v42);

  flags = self->_flags;
  if (flags)
    xpc_dictionary_set_uint64(v41, "dsFs", flags);
  networkHotspotSSID = self->_networkHotspotSSID;
  v45 = v41;
  v46 = -[NSString UTF8String](objc_retainAutorelease(networkHotspotSSID), "UTF8String");
  if (v46)
    xpc_dictionary_set_string(v45, "neHsd", v46);

  CUXPCEncodeNSArrayOfNSString();
  CUXPCEncodeNSArrayOfNSString();
  displayName = self->_displayName;
  v48 = v45;
  v49 = -[NSString UTF8String](objc_retainAutorelease(displayName), "UTF8String");
  if (v49)
    xpc_dictionary_set_string(v48, "name", v49);

  if (self->_allowsRename)
    xpc_dictionary_set_BOOL(v48, "alRn", 1);
  -[UTType identifier](self->_iconType, "identifier");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v48;
  v52 = objc_retainAutorelease(v50);
  v53 = (const char *)objc_msgSend(v52, "UTF8String");
  if (v53)
    xpc_dictionary_set_string(v51, "dvPT", v53);

  if (self->_presenceOnly)
    xpc_dictionary_set_BOOL(v51, "prOn", 1);

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

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_associationIdentifier, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  v7 = -[NSUUID copy](self->_bluetoothIdentifier, "copy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  v9 = -[NSArray copy](self->_bluetoothCompanyIdentifiers, "copy");
  v10 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v9;

  objc_storeStrong((id *)(v4 + 40), self->_bluetoothCompanyPayload);
  objc_storeStrong((id *)(v4 + 48), self->_bluetoothCompanyPayloadMask);
  *(_QWORD *)(v4 + 112) = self->_bluetoothRange;
  v11 = -[NSArray copy](self->_bluetoothServices, "copy");
  v12 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v11;

  v13 = -[NSData copy](self->_bluetoothServicePayload, "copy");
  v14 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v13;

  v15 = -[NSData copy](self->_bluetoothServicePayloadMask, "copy");
  v16 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v15;

  v17 = -[NSString copy](self->_bluetoothNameSubstring, "copy");
  v18 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = v17;

  *(_BYTE *)(v4 + 8) = self->_allowsBluetoothPairing;
  v19 = -[NSArray copy](self->_bonjourServiceTypes, "copy");
  v20 = *(void **)(v4 + 88);
  *(_QWORD *)(v4 + 88) = v19;

  v21 = -[NSString copy](self->_bundleID, "copy");
  v22 = *(void **)(v4 + 144);
  *(_QWORD *)(v4 + 144) = v21;

  v23 = -[NSString copy](self->_displayName, "copy");
  v24 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = v23;

  *(_BYTE *)(v4 + 9) = self->_allowsRename;
  *(_QWORD *)(v4 + 104) = self->_flags;
  v25 = -[NSString copy](self->_networkHotspotSSID, "copy");
  v26 = *(void **)(v4 + 120);
  *(_QWORD *)(v4 + 120) = v25;

  v27 = -[NSArray copy](self->_hotspotSSIDs, "copy");
  v28 = *(void **)(v4 + 128);
  *(_QWORD *)(v4 + 128) = v27;

  v29 = -[NSArray copy](self->_hotspotSSIDPrefixes, "copy");
  v30 = *(void **)(v4 + 136);
  *(_QWORD *)(v4 + 136) = v29;

  v31 = -[UTType copy](self->_iconType, "copy");
  v32 = *(void **)(v4 + 152);
  *(_QWORD *)(v4 + 152) = v31;

  *(_BYTE *)(v4 + 10) = self->_presenceOnly;
  return (id)v4;
}

- (id)description
{
  NSString *associationIdentifier;
  NSString *v4;
  __CFString *v5;
  NSUUID *bluetoothIdentifier;
  NSUUID *v7;
  __CFString *v8;
  NSArray *bluetoothCompanyIdentifiers;
  NSArray *v10;
  __CFString *v11;
  NSData *bluetoothCompanyPayload;
  NSData *v13;
  __CFString *v14;
  NSData *bluetoothCompanyPayloadMask;
  NSData *v16;
  __CFString *v17;
  __CFString *v18;
  NSArray *bluetoothServices;
  NSArray *v20;
  __CFString *v21;
  NSData *bluetoothServicePayload;
  NSData *v23;
  __CFString *v24;
  NSData *bluetoothServicePayloadMask;
  NSData *v26;
  __CFString *v27;
  NSString *bluetoothNameSubstring;
  NSString *v29;
  __CFString *v30;
  __CFString *v31;
  NSArray *bonjourServiceTypes;
  NSArray *v33;
  __CFString *v34;
  NSString *bundleID;
  __CFString *v36;
  __CFString *v37;
  NSString *networkHotspotSSID;
  NSString *v39;
  __CFString *v40;
  NSArray *hotspotSSIDs;
  NSArray *v42;
  __CFString *v43;
  NSArray *hotspotSSIDPrefixes;
  NSArray *v45;
  __CFString *v46;
  UTType *iconType;
  UTType *v48;
  __CFString *v49;
  __CFString *v50;
  __CFString *v51;
  __CFString *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSString *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;

  associationIdentifier = self->_associationIdentifier;
  if (associationIdentifier)
  {
    v4 = associationIdentifier;
    CUPrintNSObjectOneLine();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v5 = (__CFString *)0;

  }
  else
  {
    v5 = 0;
  }
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    v7 = bluetoothIdentifier;
    CUPrintNSObjectOneLine();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v8 = v5;

    v5 = v8;
  }
  bluetoothCompanyIdentifiers = self->_bluetoothCompanyIdentifiers;
  if (bluetoothCompanyIdentifiers)
  {
    v10 = bluetoothCompanyIdentifiers;
    CUPrintNSObjectOneLine();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v11 = v5;

    v5 = v11;
  }
  bluetoothCompanyPayload = self->_bluetoothCompanyPayload;
  if (bluetoothCompanyPayload)
  {
    v13 = bluetoothCompanyPayload;
    CUPrintNSObjectOneLine();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v14 = v5;

    v5 = v14;
  }
  bluetoothCompanyPayloadMask = self->_bluetoothCompanyPayloadMask;
  if (bluetoothCompanyPayloadMask)
  {
    v16 = bluetoothCompanyPayloadMask;
    CUPrintNSObjectOneLine();
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v17 = v5;

    v5 = v17;
  }
  if (self->_bluetoothRange)
  {
    CUAppendF();
    v18 = v5;

    v5 = v18;
  }
  bluetoothServices = self->_bluetoothServices;
  if (bluetoothServices)
  {
    v20 = bluetoothServices;
    CUPrintNSObjectOneLine();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v21 = v5;

    v5 = v21;
  }
  bluetoothServicePayload = self->_bluetoothServicePayload;
  if (bluetoothServicePayload)
  {
    v23 = bluetoothServicePayload;
    CUPrintNSObjectOneLine();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v24 = v5;

    v5 = v24;
  }
  bluetoothServicePayloadMask = self->_bluetoothServicePayloadMask;
  if (bluetoothServicePayloadMask)
  {
    v26 = bluetoothServicePayloadMask;
    CUPrintNSObjectOneLine();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v27 = v5;

    v5 = v27;
  }
  bluetoothNameSubstring = self->_bluetoothNameSubstring;
  if (bluetoothNameSubstring)
  {
    v29 = bluetoothNameSubstring;
    CUPrintNSObjectOneLine();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v30 = v5;

    v5 = v30;
  }
  if (self->_allowsBluetoothPairing)
  {
    CUAppendF();
    v31 = v5;

    v5 = v31;
  }
  bonjourServiceTypes = self->_bonjourServiceTypes;
  if (bonjourServiceTypes)
  {
    v33 = bonjourServiceTypes;
    CUPrintNSObjectOneLine();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v34 = v5;

    v5 = v34;
  }
  bundleID = self->_bundleID;
  if (bundleID)
  {
    v64 = bundleID;
    CUAppendF();
    v36 = v5;

    v5 = v36;
  }
  if (self->_flags)
  {
    CUPrintFlags64();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v37 = v5;

    v5 = v37;
  }
  networkHotspotSSID = self->_networkHotspotSSID;
  if (networkHotspotSSID)
  {
    v39 = networkHotspotSSID;
    CUPrintNSObjectOneLine();
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v40 = v5;

    v5 = v40;
  }
  hotspotSSIDs = self->_hotspotSSIDs;
  if (hotspotSSIDs)
  {
    v42 = hotspotSSIDs;
    CUPrintNSObjectOneLine();
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v43 = v5;

    v5 = v43;
  }
  hotspotSSIDPrefixes = self->_hotspotSSIDPrefixes;
  if (hotspotSSIDPrefixes)
  {
    v45 = hotspotSSIDPrefixes;
    CUPrintNSObjectOneLine();
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v46 = v5;

    v5 = v46;
  }
  iconType = self->_iconType;
  if (iconType)
  {
    v48 = iconType;
    CUPrintNSObjectOneLine();
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v49 = v5;

    v5 = v49;
  }
  if (self->_presenceOnly)
  {
    CUAppendF();
    v50 = v5;

    v5 = v50;
  }
  v51 = CFSTR("none");
  if (v5)
    v51 = v5;
  v52 = v51;

  return v52;
}

- (BOOL)allowsBluetoothPairing
{
  return self->_allowsBluetoothPairing;
}

- (void)setAllowsBluetoothPairing:(BOOL)a3
{
  self->_allowsBluetoothPairing = a3;
}

- (NSString)associationIdentifier
{
  return self->_associationIdentifier;
}

- (void)setAssociationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)bluetoothIdentifier
{
  return self->_bluetoothIdentifier;
}

- (void)setBluetoothIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)bluetoothCompanyIdentifiers
{
  return self->_bluetoothCompanyIdentifiers;
}

- (void)setBluetoothCompanyIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)bluetoothCompanyPayload
{
  return self->_bluetoothCompanyPayload;
}

- (void)setBluetoothCompanyPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)bluetoothCompanyPayloadMask
{
  return self->_bluetoothCompanyPayloadMask;
}

- (void)setBluetoothCompanyPayloadMask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)bluetoothServices
{
  return self->_bluetoothServices;
}

- (void)setBluetoothServices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)bluetoothServicePayload
{
  return self->_bluetoothServicePayload;
}

- (void)setBluetoothServicePayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSData)bluetoothServicePayloadMask
{
  return self->_bluetoothServicePayloadMask;
}

- (void)setBluetoothServicePayloadMask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)bluetoothNameSubstring
{
  return self->_bluetoothNameSubstring;
}

- (void)setBluetoothNameSubstring:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)bonjourServiceTypes
{
  return self->_bonjourServiceTypes;
}

- (void)setBonjourServiceTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)allowsRename
{
  return self->_allowsRename;
}

- (void)setAllowsRename:(BOOL)a3
{
  self->_allowsRename = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (int64_t)bluetoothRange
{
  return self->_bluetoothRange;
}

- (void)setBluetoothRange:(int64_t)a3
{
  self->_bluetoothRange = a3;
}

- (NSString)networkHotspotSSID
{
  return self->_networkHotspotSSID;
}

- (void)setNetworkHotspotSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)hotspotSSIDs
{
  return self->_hotspotSSIDs;
}

- (void)setHotspotSSIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)hotspotSSIDPrefixes
{
  return self->_hotspotSSIDPrefixes;
}

- (void)setHotspotSSIDPrefixes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (UTType)iconType
{
  return self->_iconType;
}

- (void)setIconType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)presenceOnly
{
  return self->_presenceOnly;
}

- (void)setPresenceOnly:(BOOL)a3
{
  self->_presenceOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconType, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_hotspotSSIDPrefixes, 0);
  objc_storeStrong((id *)&self->_hotspotSSIDs, 0);
  objc_storeStrong((id *)&self->_networkHotspotSSID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bonjourServiceTypes, 0);
  objc_storeStrong((id *)&self->_bluetoothNameSubstring, 0);
  objc_storeStrong((id *)&self->_bluetoothServicePayloadMask, 0);
  objc_storeStrong((id *)&self->_bluetoothServicePayload, 0);
  objc_storeStrong((id *)&self->_bluetoothServices, 0);
  objc_storeStrong((id *)&self->_bluetoothCompanyPayloadMask, 0);
  objc_storeStrong((id *)&self->_bluetoothCompanyPayload, 0);
  objc_storeStrong((id *)&self->_bluetoothCompanyIdentifiers, 0);
  objc_storeStrong((id *)&self->_bluetoothIdentifier, 0);
  objc_storeStrong((id *)&self->_associationIdentifier, 0);
}

@end
