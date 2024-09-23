@implementation ASDiscoveryDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDiscoveryDescriptor)initWithDiscoveryConfiguration:(id)a3
{
  id v4;
  ASDiscoveryDescriptor *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  ASDiscoveryDescriptor *v9;
  void *v10;
  CBUUID *v11;
  void *v12;
  void *v13;
  unsigned __int16 v14;
  uint64_t v15;
  NSData *bluetoothManufacturerDataBlob;
  uint64_t v17;
  NSData *bluetoothManufacturerDataMask;
  uint64_t v19;
  NSString *bluetoothNameSubstring;
  uint64_t v21;
  NSData *bluetoothServiceDataBlob;
  uint64_t v23;
  NSData *bluetoothServiceDataMask;
  CBUUID *bluetoothServiceUUID;
  CBUUID *v26;
  void *v27;
  uint64_t v28;
  NSString *SSID;
  void *v30;
  uint64_t v31;
  NSString *SSIDPrefix;

  v4 = a3;
  v5 = -[ASDiscoveryDescriptor init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "associationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayName");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = 0;
    if (v6 && v7)
    {
      objc_msgSend(v4, "bluetoothServices");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (CBUUID *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "bluetoothCompanyIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedShortValue");

      if ((objc_msgSend(v4, "flags") & 2) != 0)
        v5->_supportedOptions |= 2uLL;
      if ((objc_msgSend(v4, "flags") & 4) != 0)
        v5->_supportedOptions |= 4uLL;
      v5->_bluetoothCompanyIdentifier = v14;
      objc_msgSend(v4, "bluetoothCompanyPayload");
      v15 = objc_claimAutoreleasedReturnValue();
      bluetoothManufacturerDataBlob = v5->_bluetoothManufacturerDataBlob;
      v5->_bluetoothManufacturerDataBlob = (NSData *)v15;

      objc_msgSend(v4, "bluetoothCompanyPayloadMask");
      v17 = objc_claimAutoreleasedReturnValue();
      bluetoothManufacturerDataMask = v5->_bluetoothManufacturerDataMask;
      v5->_bluetoothManufacturerDataMask = (NSData *)v17;

      objc_msgSend(v4, "bluetoothNameSubstring");
      v19 = objc_claimAutoreleasedReturnValue();
      bluetoothNameSubstring = v5->_bluetoothNameSubstring;
      v5->_bluetoothNameSubstring = (NSString *)v19;

      objc_msgSend(v4, "bluetoothServicePayload");
      v21 = objc_claimAutoreleasedReturnValue();
      bluetoothServiceDataBlob = v5->_bluetoothServiceDataBlob;
      v5->_bluetoothServiceDataBlob = (NSData *)v21;

      objc_msgSend(v4, "bluetoothServicePayloadMask");
      v23 = objc_claimAutoreleasedReturnValue();
      bluetoothServiceDataMask = v5->_bluetoothServiceDataMask;
      v5->_bluetoothServiceDataMask = (NSData *)v23;

      bluetoothServiceUUID = v5->_bluetoothServiceUUID;
      v5->_bluetoothServiceUUID = v11;
      v26 = v11;

      objc_msgSend(v4, "hotspotSSIDs");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "firstObject");
      v28 = objc_claimAutoreleasedReturnValue();
      SSID = v5->_SSID;
      v5->_SSID = (NSString *)v28;

      objc_msgSend(v4, "hotspotSSIDPrefixes");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "firstObject");
      v31 = objc_claimAutoreleasedReturnValue();
      SSIDPrefix = v5->_SSIDPrefix;
      v5->_SSIDPrefix = (NSString *)v31;

      v9 = v5;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (ASDiscoveryDescriptor)initWithCoder:(id)a3
{
  id v4;
  ASDiscoveryDescriptor *v5;
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
  ASDiscoveryDescriptor *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v4 = a3;
  v5 = -[ASDiscoveryDescriptor init](self, "init");
  if (v5)
  {
    v6 = v4;
    if (objc_msgSend(v6, "containsValueForKey:", CFSTR("fSp")))
      v5->_supportedOptions = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("fSp"));

    if (NSDecodeSInt64RangedIfPresent())
      v5->_bluetoothCompanyIdentifier = 0;
    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

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
    if (objc_msgSend(v13, "containsValueForKey:", CFSTR("bRg")))
      v5->_bluetoothRange = objc_msgSend(v13, "decodeIntegerForKey:", CFSTR("bRg"));

    v14 = v13;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v15 = v14;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v16 = v5;
  }
  else
  {
    v18 = objc_opt_class();
    ASErrorF(1, (uint64_t)"%@ init failed", v19, v20, v21, v22, v23, v24, v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v25);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t supportedOptions;
  NSData *bluetoothManufacturerDataBlob;
  NSData *bluetoothManufacturerDataMask;
  NSString *bluetoothNameSubstring;
  int64_t bluetoothRange;
  NSData *bluetoothServiceDataBlob;
  NSData *bluetoothServiceDataMask;
  void *v11;
  NSString *SSID;
  NSString *SSIDPrefix;
  void *v14;
  id v15;

  v15 = a3;
  supportedOptions = self->_supportedOptions;
  if (supportedOptions)
    objc_msgSend(v15, "encodeInteger:forKey:", supportedOptions, CFSTR("fSp"));
  if (self->_bluetoothCompanyIdentifier)
    objc_msgSend(v15, "encodeInteger:forKey:");
  bluetoothManufacturerDataBlob = self->_bluetoothManufacturerDataBlob;
  if (bluetoothManufacturerDataBlob)
    objc_msgSend(v15, "encodeObject:forKey:", bluetoothManufacturerDataBlob, CFSTR("mdb"));
  bluetoothManufacturerDataMask = self->_bluetoothManufacturerDataMask;
  if (bluetoothManufacturerDataMask)
    objc_msgSend(v15, "encodeObject:forKey:", bluetoothManufacturerDataMask, CFSTR("mdm"));
  bluetoothNameSubstring = self->_bluetoothNameSubstring;
  if (bluetoothNameSubstring)
    objc_msgSend(v15, "encodeObject:forKey:", bluetoothNameSubstring, CFSTR("aLn"));
  bluetoothRange = self->_bluetoothRange;
  if (bluetoothRange)
    objc_msgSend(v15, "encodeInteger:forKey:", bluetoothRange, CFSTR("bRg"));
  bluetoothServiceDataBlob = self->_bluetoothServiceDataBlob;
  if (bluetoothServiceDataBlob)
    objc_msgSend(v15, "encodeObject:forKey:", bluetoothServiceDataBlob, CFSTR("sdb"));
  bluetoothServiceDataMask = self->_bluetoothServiceDataMask;
  if (bluetoothServiceDataMask)
    objc_msgSend(v15, "encodeObject:forKey:", bluetoothServiceDataMask, CFSTR("sdm"));
  -[CBUUID data](self->_bluetoothServiceUUID, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v15, "encodeObject:forKey:", v11, CFSTR("bSi"));

  SSID = self->_SSID;
  if (SSID)
    objc_msgSend(v15, "encodeObject:forKey:", SSID, CFSTR("wsd"));
  SSIDPrefix = self->_SSIDPrefix;
  v14 = v15;
  if (SSIDPrefix)
  {
    objc_msgSend(v15, "encodeObject:forKey:", SSIDPrefix, CFSTR("wsP"));
    v14 = v15;
  }

}

- (ASDiscoveryDescriptor)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  ASDiscoveryDescriptor *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  ASDiscoveryDescriptor *v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v7 = -[ASDiscoveryDescriptor init](self, "init");
  if (!v7)
  {
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ASErrorF(-6756, (uint64_t)"%@ init failed", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_15;
  }
  if (MEMORY[0x2349290D0](v6) != MEMORY[0x24BDACFA0])
  {
    if (a4)
    {
      ASErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_15:
    v14 = 0;
    goto LABEL_10;
  }
  if (CUXPCDecodeUInt64RangedEx() == 6)
    v7->_supportedOptions = 0;
  if (CUXPCDecodeUInt64RangedEx() == 6)
    v7->_bluetoothCompanyIdentifier = 0;
  CUXPCDecodeNSData();
  CUXPCDecodeNSData();
  CUXPCDecodeNSString();
  if (CUXPCDecodeSInt64RangedEx() == 6)
    v7->_bluetoothRange = 0;
  CUXPCDecodeNSData();
  CUXPCDecodeNSData();
  CUXPCDecodeNSData();
  CUXPCDecodeNSString();
  CUXPCDecodeNSString();
  v14 = v7;

LABEL_10:
  return v14;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t supportedOptions;
  NSData *bluetoothManufacturerDataBlob;
  NSData *v8;
  id v9;
  NSData *v10;
  uint64_t v11;
  const char *v12;
  size_t v13;
  NSData *bluetoothManufacturerDataMask;
  NSData *v15;
  id v16;
  NSData *v17;
  uint64_t v18;
  const char *v19;
  size_t v20;
  NSString *bluetoothNameSubstring;
  id v22;
  const char *v23;
  int64_t bluetoothRange;
  NSData *bluetoothServiceDataBlob;
  NSData *v26;
  id v27;
  NSData *v28;
  uint64_t v29;
  const char *v30;
  size_t v31;
  NSData *bluetoothServiceDataMask;
  NSData *v33;
  id v34;
  NSData *v35;
  uint64_t v36;
  const char *v37;
  size_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  const char *v44;
  NSString *SSID;
  id v46;
  const char *v47;
  NSString *SSIDPrefix;
  const char *v49;
  xpc_object_t xdict;

  v4 = a3;
  v5 = v4;
  supportedOptions = self->_supportedOptions;
  if (supportedOptions)
    xpc_dictionary_set_uint64(v4, "fSp", supportedOptions);
  if (self->_bluetoothCompanyIdentifier)
    xpc_dictionary_set_uint64(v5, "bcI", self->_bluetoothCompanyIdentifier);
  bluetoothManufacturerDataBlob = self->_bluetoothManufacturerDataBlob;
  if (bluetoothManufacturerDataBlob)
  {
    v8 = objc_retainAutorelease(bluetoothManufacturerDataBlob);
    v9 = v5;
    v10 = v8;
    v11 = -[NSData bytes](v10, "bytes");
    if (v11)
      v12 = (const char *)v11;
    else
      v12 = "";
    v13 = -[NSData length](v10, "length");

    xpc_dictionary_set_data(v9, "mdb", v12, v13);
  }
  bluetoothManufacturerDataMask = self->_bluetoothManufacturerDataMask;
  if (bluetoothManufacturerDataMask)
  {
    v15 = objc_retainAutorelease(bluetoothManufacturerDataMask);
    v16 = v5;
    v17 = v15;
    v18 = -[NSData bytes](v17, "bytes");
    if (v18)
      v19 = (const char *)v18;
    else
      v19 = "";
    v20 = -[NSData length](v17, "length");

    xpc_dictionary_set_data(v16, "mdm", v19, v20);
  }
  bluetoothNameSubstring = self->_bluetoothNameSubstring;
  v22 = v5;
  v23 = -[NSString UTF8String](objc_retainAutorelease(bluetoothNameSubstring), "UTF8String");
  if (v23)
    xpc_dictionary_set_string(v22, "aLn", v23);

  bluetoothRange = self->_bluetoothRange;
  if (bluetoothRange)
    xpc_dictionary_set_int64(v22, "bRg", bluetoothRange);
  bluetoothServiceDataBlob = self->_bluetoothServiceDataBlob;
  if (bluetoothServiceDataBlob)
  {
    v26 = objc_retainAutorelease(bluetoothServiceDataBlob);
    v27 = v22;
    v28 = v26;
    v29 = -[NSData bytes](v28, "bytes");
    if (v29)
      v30 = (const char *)v29;
    else
      v30 = "";
    v31 = -[NSData length](v28, "length");

    xpc_dictionary_set_data(v27, "sdb", v30, v31);
  }
  bluetoothServiceDataMask = self->_bluetoothServiceDataMask;
  if (bluetoothServiceDataMask)
  {
    v33 = objc_retainAutorelease(bluetoothServiceDataMask);
    v34 = v22;
    v35 = v33;
    v36 = -[NSData bytes](v35, "bytes");
    if (v36)
      v37 = (const char *)v36;
    else
      v37 = "";
    v38 = -[NSData length](v35, "length");

    xpc_dictionary_set_data(v34, "sdm", v37, v38);
  }
  -[CBUUID data](self->_bluetoothServiceUUID, "data");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
  {
    v41 = objc_retainAutorelease(v39);
    v42 = v22;
    v43 = objc_msgSend(v41, "bytes");
    if (v43)
      v44 = (const char *)v43;
    else
      v44 = "";
    xpc_dictionary_set_data(v42, "bSi", v44, objc_msgSend(v41, "length"));

  }
  SSID = self->_SSID;
  v46 = v22;
  v47 = -[NSString UTF8String](objc_retainAutorelease(SSID), "UTF8String");
  if (v47)
    xpc_dictionary_set_string(v46, "wsd", v47);

  SSIDPrefix = self->_SSIDPrefix;
  xdict = v46;
  v49 = -[NSString UTF8String](objc_retainAutorelease(SSIDPrefix), "UTF8String");
  if (v49)
    xpc_dictionary_set_string(xdict, "wsP", v49);

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

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 16) = self->_supportedOptions;
  *(_WORD *)(v4 + 8) = self->_bluetoothCompanyIdentifier;
  v5 = -[NSData copy](self->_bluetoothManufacturerDataBlob, "copy");
  v6 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v5;

  v7 = -[NSData copy](self->_bluetoothManufacturerDataMask, "copy");
  v8 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v7;

  v9 = -[NSString copy](self->_bluetoothNameSubstring, "copy");
  v10 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v9;

  *(_QWORD *)(v4 + 48) = self->_bluetoothRange;
  v11 = -[NSData copy](self->_bluetoothServiceDataBlob, "copy");
  v12 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v11;

  v13 = -[NSData copy](self->_bluetoothServiceDataMask, "copy");
  v14 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v13;

  v15 = -[CBUUID copy](self->_bluetoothServiceUUID, "copy");
  v16 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v15;

  objc_storeStrong((id *)(v4 + 80), self->_SSID);
  objc_storeStrong((id *)(v4 + 88), self->_SSIDPrefix);
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  ASDiscoveryDescriptor *v4;
  ASDiscoveryDescriptor *v5;
  ASDiscoveryDescriptor *v6;
  unint64_t supportedOptions;
  int bluetoothCompanyIdentifier;
  NSData *bluetoothManufacturerDataBlob;
  void *v10;
  NSData *v11;
  NSData *v12;
  NSData *v13;
  int v14;
  char v15;
  NSData *bluetoothManufacturerDataMask;
  void *v18;
  NSData *v19;
  NSData *v20;
  int v21;
  NSString *bluetoothNameSubstring;
  void *v23;
  NSString *p_isa;
  NSData *v25;
  int v26;
  int64_t bluetoothRange;
  NSData *bluetoothServiceDataBlob;
  void *v29;
  NSData *v30;
  NSData *v31;
  int v32;
  NSData *bluetoothServiceDataMask;
  void *v34;
  NSData *v35;
  NSData *v36;
  int v37;
  void *v38;
  void *v39;
  NSData *v40;
  NSString *v41;
  NSData *v42;
  NSString *SSID;
  NSString *v44;
  NSString *v45;
  NSString *SSIDPrefix;
  NSString *v47;
  NSString *v48;
  void *v49;
  int v50;
  NSString *v51;
  int v52;
  void *v53;
  NSData *v54;
  NSData *v55;
  NSData *v56;

  v4 = (ASDiscoveryDescriptor *)a3;
  v5 = v4;
  if (self == v4)
  {
    v15 = 1;
    goto LABEL_12;
  }
  v6 = v4;
  if (-[ASDiscoveryDescriptor isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
  {
    supportedOptions = self->_supportedOptions;
    if (supportedOptions == -[ASDiscoveryDescriptor supportedOptions](v6, "supportedOptions"))
    {
      bluetoothCompanyIdentifier = self->_bluetoothCompanyIdentifier;
      if (bluetoothCompanyIdentifier == -[ASDiscoveryDescriptor bluetoothCompanyIdentifier](v6, "bluetoothCompanyIdentifier"))
      {
        bluetoothManufacturerDataBlob = self->_bluetoothManufacturerDataBlob;
        -[ASDiscoveryDescriptor bluetoothManufacturerDataBlob](v6, "bluetoothManufacturerDataBlob");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = bluetoothManufacturerDataBlob;
        v12 = v10;
        v13 = v12;
        if (v11 == v12)
        {

        }
        else
        {
          if ((v11 == 0) == (v12 != 0))
          {
            v15 = 0;
            v19 = v12;
LABEL_67:

            goto LABEL_68;
          }
          v14 = -[NSData isEqual:](v11, "isEqual:", v12);

          if (!v14)
          {
            v15 = 0;
LABEL_69:

            goto LABEL_10;
          }
        }
        bluetoothManufacturerDataMask = self->_bluetoothManufacturerDataMask;
        -[ASDiscoveryDescriptor bluetoothManufacturerDataMask](v6, "bluetoothManufacturerDataMask");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = bluetoothManufacturerDataMask;
        v20 = v18;
        v11 = v20;
        if (v19 == v20)
        {

        }
        else
        {
          if ((v19 == 0) == (v20 != 0))
          {
            v15 = 0;
            p_isa = (NSString *)&v20->super.isa;
LABEL_66:

            goto LABEL_67;
          }
          v21 = -[NSData isEqual:](v19, "isEqual:", v20);

          if (!v21)
          {
            v15 = 0;
LABEL_68:

            goto LABEL_69;
          }
        }
        bluetoothNameSubstring = self->_bluetoothNameSubstring;
        -[ASDiscoveryDescriptor bluetoothNameSubstring](v6, "bluetoothNameSubstring");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        p_isa = bluetoothNameSubstring;
        v25 = v23;
        v19 = v25;
        if (p_isa == (NSString *)v25)
        {

        }
        else
        {
          if ((p_isa == 0) == (v25 != 0))
          {
            v15 = 0;
            v30 = v25;
LABEL_65:

            goto LABEL_66;
          }
          v26 = -[NSString isEqual:](p_isa, "isEqual:", v25);

          if (!v26)
            goto LABEL_31;
        }
        bluetoothRange = self->_bluetoothRange;
        if (bluetoothRange != -[ASDiscoveryDescriptor bluetoothRange](v6, "bluetoothRange"))
        {
LABEL_31:
          v15 = 0;
          goto LABEL_67;
        }
        bluetoothServiceDataBlob = self->_bluetoothServiceDataBlob;
        -[ASDiscoveryDescriptor bluetoothServiceDataBlob](v6, "bluetoothServiceDataBlob");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = bluetoothServiceDataBlob;
        v31 = v29;
        p_isa = (NSString *)&v31->super.isa;
        if (v30 == v31)
        {

        }
        else
        {
          if ((v30 == 0) == (v31 != 0))
          {
            v15 = 0;
            v35 = v31;
LABEL_64:

            goto LABEL_65;
          }
          v32 = -[NSData isEqual:](v30, "isEqual:", v31);

          if (!v32)
          {
            v15 = 0;
            goto LABEL_66;
          }
        }
        bluetoothServiceDataMask = self->_bluetoothServiceDataMask;
        -[ASDiscoveryDescriptor bluetoothServiceDataMask](v6, "bluetoothServiceDataMask");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = bluetoothServiceDataMask;
        v36 = v34;
        v30 = v36;
        if (v35 == v36)
        {

        }
        else
        {
          if ((v35 == 0) == (v36 != 0))
          {
            v15 = 0;
            v42 = v36;
LABEL_63:

            goto LABEL_64;
          }
          v37 = -[NSData isEqual:](v35, "isEqual:", v36);

          if (!v37)
          {
            v15 = 0;
            goto LABEL_65;
          }
        }
        -[CBUUID data](self->_bluetoothServiceUUID, "data");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASDiscoveryDescriptor bluetoothServiceUUID](v6, "bluetoothServiceUUID");
        v56 = (NSData *)objc_claimAutoreleasedReturnValue();
        -[NSData data](v56, "data");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v38;
        v40 = v39;
        v55 = v40;
        if (v35 == v40)
        {

        }
        else
        {
          v41 = (NSString *)&v40->super.isa;
          if ((v35 == 0) == (v40 != 0))
          {
            v15 = 0;
            v54 = v35;
LABEL_60:

            goto LABEL_61;
          }
          v52 = -[NSData isEqual:](v35, "isEqual:", v40);

          if (!v52)
          {
            v15 = 0;
LABEL_62:

            v42 = v56;
            goto LABEL_63;
          }
        }
        SSID = self->_SSID;
        -[ASDiscoveryDescriptor SSID](v6, "SSID");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = SSID;
        v44 = v53;
        v54 = (NSData *)v44;
        if (v41 == v44)
        {

        }
        else
        {
          v45 = v44;
          if ((v41 == 0) == (v44 != 0))
          {
            v15 = 0;
LABEL_59:

            goto LABEL_60;
          }
          v50 = -[NSString isEqual:](v41, "isEqual:", v44);

          if (!v50)
          {
            v15 = 0;
LABEL_61:

            goto LABEL_62;
          }
        }
        SSIDPrefix = self->_SSIDPrefix;
        -[ASDiscoveryDescriptor SSIDPrefix](v6, "SSIDPrefix");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = SSIDPrefix;
        v48 = v49;
        v41 = v48;
        v51 = v47;
        if (v47 == v48)
        {
          v15 = 1;
        }
        else if ((v47 == 0) == (v48 != 0))
        {
          v15 = 0;
        }
        else
        {
          v15 = -[NSString isEqual:](v47, "isEqual:", v48);
        }

        v45 = v51;
        goto LABEL_59;
      }
    }
  }
  v15 = 0;
LABEL_10:

LABEL_12:
  return v15;
}

- (id)description
{
  return -[ASDiscoveryDescriptor descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  NSData *bluetoothManufacturerDataBlob;
  __CFString *v8;
  NSData *bluetoothManufacturerDataMask;
  __CFString *v10;
  NSString *bluetoothNameSubstring;
  __CFString *v12;
  __CFString *v13;
  CBUUID *bluetoothServiceUUID;
  __CFString *v15;
  NSData *bluetoothServiceDataBlob;
  __CFString *v17;
  NSData *bluetoothServiceDataMask;
  __CFString *v19;
  NSString *SSID;
  __CFString *v21;
  NSString *SSIDPrefix;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  void *v27;
  NSData *v28;
  NSData *v29;
  NSString *v30;
  CBUUID *v31;
  NSData *v32;
  NSData *v33;
  NSString *v34;
  NSString *v35;

  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    v4 = (__CFString *)0;
  }
  if (self->_supportedOptions)
  {
    CUPrintFlags64();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v5 = v4;

    v4 = v5;
  }
  if (self->_bluetoothCompanyIdentifier)
  {
    CUAppendF();
    v6 = v4;

    v4 = v6;
  }
  bluetoothManufacturerDataBlob = self->_bluetoothManufacturerDataBlob;
  if (bluetoothManufacturerDataBlob)
  {
    v28 = bluetoothManufacturerDataBlob;
    CUAppendF();
    v8 = v4;

    v4 = v8;
  }
  bluetoothManufacturerDataMask = self->_bluetoothManufacturerDataMask;
  if (bluetoothManufacturerDataMask)
  {
    v29 = bluetoothManufacturerDataMask;
    CUAppendF();
    v10 = v4;

    v4 = v10;
  }
  bluetoothNameSubstring = self->_bluetoothNameSubstring;
  if (bluetoothNameSubstring)
  {
    v30 = bluetoothNameSubstring;
    CUAppendF();
    v12 = v4;

    v4 = v12;
  }
  if (self->_bluetoothRange)
  {
    CUAppendF();
    v13 = v4;

    v4 = v13;
  }
  bluetoothServiceUUID = self->_bluetoothServiceUUID;
  if (bluetoothServiceUUID)
  {
    v31 = bluetoothServiceUUID;
    CUAppendF();
    v15 = v4;

    v4 = v15;
  }
  bluetoothServiceDataBlob = self->_bluetoothServiceDataBlob;
  if (bluetoothServiceDataBlob)
  {
    v32 = bluetoothServiceDataBlob;
    CUAppendF();
    v17 = v4;

    v4 = v17;
  }
  bluetoothServiceDataMask = self->_bluetoothServiceDataMask;
  if (bluetoothServiceDataMask)
  {
    v33 = bluetoothServiceDataMask;
    CUAppendF();
    v19 = v4;

    v4 = v19;
  }
  SSID = self->_SSID;
  if (SSID)
  {
    v34 = SSID;
    CUAppendF();
    v21 = v4;

    v4 = v21;
  }
  SSIDPrefix = self->_SSIDPrefix;
  if (SSIDPrefix)
  {
    v35 = SSIDPrefix;
    CUAppendF();
    v23 = v4;

    v4 = v23;
  }
  v24 = &stru_250420148;
  if (v4)
    v24 = v4;
  v25 = v24;

  return v25;
}

- (unint64_t)hash
{
  uint64_t bluetoothCompanyIdentifier;
  NSData *bluetoothManufacturerDataBlob;
  unint64_t supportedOptions;
  uint64_t v6;
  NSData *bluetoothManufacturerDataMask;
  NSString *bluetoothNameSubstring;
  unint64_t v9;
  CBUUID *bluetoothServiceUUID;
  NSData *bluetoothServiceDataBlob;
  NSData *bluetoothServiceDataMask;
  NSString *SSID;
  NSString *SSIDPrefix;

  bluetoothCompanyIdentifier = self->_bluetoothCompanyIdentifier;
  supportedOptions = self->_supportedOptions;
  bluetoothManufacturerDataBlob = self->_bluetoothManufacturerDataBlob;
  v6 = supportedOptions ^ bluetoothCompanyIdentifier ^ 0x13;
  if (bluetoothManufacturerDataBlob)
    v6 ^= -[NSData hash](bluetoothManufacturerDataBlob, "hash");
  bluetoothManufacturerDataMask = self->_bluetoothManufacturerDataMask;
  if (bluetoothManufacturerDataMask)
    v6 ^= -[NSData hash](bluetoothManufacturerDataMask, "hash");
  bluetoothNameSubstring = self->_bluetoothNameSubstring;
  if (bluetoothNameSubstring)
    v6 ^= -[NSString hash](bluetoothNameSubstring, "hash");
  v9 = self->_bluetoothRange ^ v6;
  bluetoothServiceUUID = self->_bluetoothServiceUUID;
  if (bluetoothServiceUUID)
    v9 ^= -[CBUUID hash](bluetoothServiceUUID, "hash");
  bluetoothServiceDataBlob = self->_bluetoothServiceDataBlob;
  if (bluetoothServiceDataBlob)
    v9 ^= -[NSData hash](bluetoothServiceDataBlob, "hash");
  bluetoothServiceDataMask = self->_bluetoothServiceDataMask;
  if (bluetoothServiceDataMask)
    v9 ^= -[NSData hash](bluetoothServiceDataMask, "hash");
  SSID = self->_SSID;
  if (SSID)
    v9 ^= -[NSString hash](SSID, "hash");
  SSIDPrefix = self->_SSIDPrefix;
  if (SSIDPrefix)
    v9 ^= -[NSString hash](SSIDPrefix, "hash");
  return v9;
}

- (unint64_t)supportedOptions
{
  return self->_supportedOptions;
}

- (void)setSupportedOptions:(unint64_t)a3
{
  self->_supportedOptions = a3;
}

- (unsigned)bluetoothCompanyIdentifier
{
  return self->_bluetoothCompanyIdentifier;
}

- (void)setBluetoothCompanyIdentifier:(unsigned __int16)a3
{
  self->_bluetoothCompanyIdentifier = a3;
}

- (NSData)bluetoothManufacturerDataBlob
{
  return self->_bluetoothManufacturerDataBlob;
}

- (void)setBluetoothManufacturerDataBlob:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)bluetoothManufacturerDataMask
{
  return self->_bluetoothManufacturerDataMask;
}

- (void)setBluetoothManufacturerDataMask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)bluetoothNameSubstring
{
  return self->_bluetoothNameSubstring;
}

- (void)setBluetoothNameSubstring:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)bluetoothRange
{
  return self->_bluetoothRange;
}

- (void)setBluetoothRange:(int64_t)a3
{
  self->_bluetoothRange = a3;
}

- (NSData)bluetoothServiceDataBlob
{
  return self->_bluetoothServiceDataBlob;
}

- (void)setBluetoothServiceDataBlob:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)bluetoothServiceDataMask
{
  return self->_bluetoothServiceDataMask;
}

- (void)setBluetoothServiceDataMask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (CBUUID)bluetoothServiceUUID
{
  return self->_bluetoothServiceUUID;
}

- (void)setBluetoothServiceUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)SSIDPrefix
{
  return self->_SSIDPrefix;
}

- (void)setSSIDPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SSIDPrefix, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
  objc_storeStrong((id *)&self->_bluetoothServiceUUID, 0);
  objc_storeStrong((id *)&self->_bluetoothServiceDataMask, 0);
  objc_storeStrong((id *)&self->_bluetoothServiceDataBlob, 0);
  objc_storeStrong((id *)&self->_bluetoothNameSubstring, 0);
  objc_storeStrong((id *)&self->_bluetoothManufacturerDataMask, 0);
  objc_storeStrong((id *)&self->_bluetoothManufacturerDataBlob, 0);
}

@end
