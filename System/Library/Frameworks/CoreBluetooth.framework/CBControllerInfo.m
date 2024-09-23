@implementation CBControllerInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CBControllerInfo)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CBControllerInfo *v9;
  _QWORD v11[9];

  v11[8] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  v11[3] = objc_opt_class();
  v11[4] = objc_opt_class();
  v11[5] = objc_opt_class();
  v11[6] = objc_opt_class();
  v11[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("ctrI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[CBControllerInfo initWithDictionary:error:](self, "initWithDictionary:error:", v8, 0);
  return v9;
}

- (CBControllerInfo)initWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CBControllerInfo *v13;
  uint64_t v15;

  v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v12)
  {
    self = -[CBControllerInfo initWithXPCObject:error:](self, "initWithXPCObject:error:", v12, a4);
    v13 = self;
  }
  else if (a4)
  {
    CBErrorF(-6700, (uint64_t)"CBControllerInfo convert XPC dict failed", v6, v7, v8, v9, v10, v11, v15);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)dictionaryRepresentation
{
  xpc_object_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = xpc_dictionary_create(0, 0, 0);
  -[CBControllerInfo encodeWithXPCObject:](self, "encodeWithXPCObject:", v3);
  v4 = (void *)CUXPCCreateCFObjectFromXPCObject();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA70];
  v6 = v4;

  return v6;
}

- (CBControllerInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CBControllerInfo *v13;
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
  CBControllerInfo *v26;
  const char *v28;
  uint64_t v29;

  v6 = a3;
  v13 = -[CBControllerInfo init](self, "init");
  if (!v13)
  {
    if (!a4)
      goto LABEL_53;
    v28 = "CBControllerInfo init failed";
LABEL_52:
    CBErrorF(-6756, (uint64_t)v28, v7, v8, v9, v10, v11, v12, v29);
    v26 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_47;
  }
  if (MEMORY[0x1A85D2194](v6) != MEMORY[0x1E0C812F8])
  {
    if (!a4)
      goto LABEL_53;
    v28 = "XPC non-dict";
    goto LABEL_52;
  }
  objc_opt_class();
  if (!CUXPCDecodeNSArrayOfClass())
    goto LABEL_53;
  v14 = CUXPCDecodeSInt64RangedEx();
  if (v14 == 6)
  {
    v13->_bluetoothState = 0;
  }
  else if (v14 == 5)
  {
    goto LABEL_53;
  }
  if (!CUXPCDecodeNSString())
    goto LABEL_53;
  v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v13->_cloudSyncStatus = 0;
  }
  else if (v15 == 5)
  {
    goto LABEL_53;
  }
  v16 = CUXPCDecodeSInt64RangedEx();
  if (v16 == 6)
  {
    v13->_discoverableState = 0;
  }
  else if (v16 == 5)
  {
    goto LABEL_53;
  }
  if (!CUXPCDecodeBool())
    goto LABEL_53;
  v17 = CUXPCDecodeUInt64RangedEx();
  if (v17 == 6)
  {
    v13->_fastLEConnectionInfoVersion = 0;
  }
  else if (v17 == 5)
  {
    goto LABEL_53;
  }
  if (!CUXPCDecodeNSData()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSDataOfLength())
  {
    goto LABEL_53;
  }
  v18 = CUXPCDecodeSInt64RangedEx();
  if (v18 == 6)
  {
    v13->_hciTransportType = 0;
  }
  else if (v18 == 5)
  {
    goto LABEL_53;
  }
  v19 = CUXPCDecodeSInt64RangedEx();
  if (v19 == 6)
  {
    v13->_inquiryState = 0;
  }
  else if (v19 == 5)
  {
    goto LABEL_53;
  }
  v20 = CUXPCDecodeUInt64RangedEx();
  if (v20 == 6)
  {
    v13->_leaVersion = 0;
  }
  else if (v20 == 5)
  {
    goto LABEL_53;
  }
  v21 = CUXPCDecodeUInt64RangedEx();
  if (v21 == 6)
  {
    v13->_lmpVersion = 0;
  }
  else if (v21 == 5)
  {
    goto LABEL_53;
  }
  v22 = CUXPCDecodeUInt64RangedEx();
  if (v22 == 6)
  {
    v13->_productID = 0;
  }
  else if (v22 == 5)
  {
    goto LABEL_53;
  }
  v23 = CUXPCDecodeUInt64RangedEx();
  if (v23 == 6)
  {
    v13->_supportedServices = 0;
  }
  else if (v23 == 5)
  {
    goto LABEL_53;
  }
  v24 = CUXPCDecodeUInt64RangedEx();
  if (v24 == 6)
  {
    v13->_vendorID = 0;
  }
  else if (v24 == 5)
  {
    goto LABEL_53;
  }
  v25 = CUXPCDecodeUInt64RangedEx();
  if (v25 != 6)
  {
    if (v25 != 5)
      goto LABEL_46;
LABEL_53:
    v26 = 0;
    goto LABEL_47;
  }
  v13->_vendorIDSource = 0;
LABEL_46:
  v26 = v13;
LABEL_47:

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CBControllerInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("ctrI"));

}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  int64_t bluetoothState;
  NSString *chipsetID;
  id v7;
  const char *v8;
  int64_t discoverableState;
  NSData *fastLEConnectionInfoData;
  NSData *v11;
  id v12;
  NSData *v13;
  uint64_t v14;
  const char *v15;
  size_t v16;
  NSString *firmwareName;
  id v18;
  const char *v19;
  NSString *firmwareVersion;
  const char *v21;
  NSData *hardwareAddressData;
  NSData *v23;
  id v24;
  NSData *v25;
  uint64_t v26;
  const char *v27;
  size_t v28;
  int64_t inquiryState;
  void *v30;
  uint64_t productID;
  uint64_t supportedServices;
  xpc_object_t xdict;

  v4 = a3;
  CUXPCEncodeNSArrayOfObjects();
  bluetoothState = self->_bluetoothState;
  if (bluetoothState)
    xpc_dictionary_set_int64(v4, "pwrS", bluetoothState);
  chipsetID = self->_chipsetID;
  v7 = v4;
  v8 = -[NSString UTF8String](objc_retainAutorelease(chipsetID), "UTF8String");
  if (v8)
    xpc_dictionary_set_string(v7, "chip", v8);

  if (self->_cloudSyncStatus)
    xpc_dictionary_set_uint64(v7, "clSy", self->_cloudSyncStatus);
  discoverableState = self->_discoverableState;
  if ((_DWORD)discoverableState)
    xpc_dictionary_set_int64(v7, "dsSt", discoverableState);
  if (self->_fastLEConnectionAllowed)
    xpc_dictionary_set_BOOL(v7, "fLEal", 1);
  if (self->_fastLEConnectionInfoVersion)
    xpc_dictionary_set_uint64(v7, "fLEVe", self->_fastLEConnectionInfoVersion);
  fastLEConnectionInfoData = self->_fastLEConnectionInfoData;
  if (fastLEConnectionInfoData)
  {
    v11 = objc_retainAutorelease(fastLEConnectionInfoData);
    v12 = v7;
    v13 = v11;
    v14 = -[NSData bytes](v13, "bytes");
    if (v14)
      v15 = (const char *)v14;
    else
      v15 = "";
    v16 = -[NSData length](v13, "length");

    xpc_dictionary_set_data(v12, "fLEDt", v15, v16);
  }
  firmwareName = self->_firmwareName;
  v18 = v7;
  v19 = -[NSString UTF8String](objc_retainAutorelease(firmwareName), "UTF8String");
  if (v19)
    xpc_dictionary_set_string(v18, "frmN", v19);

  firmwareVersion = self->_firmwareVersion;
  xdict = v18;
  v21 = -[NSString UTF8String](objc_retainAutorelease(firmwareVersion), "UTF8String");
  if (v21)
    xpc_dictionary_set_string(xdict, "frmV", v21);

  hardwareAddressData = self->_hardwareAddressData;
  if (hardwareAddressData)
  {
    v23 = objc_retainAutorelease(hardwareAddressData);
    v24 = xdict;
    v25 = v23;
    v26 = -[NSData bytes](v25, "bytes");
    if (v26)
      v27 = (const char *)v26;
    else
      v27 = "";
    v28 = -[NSData length](v25, "length");

    xpc_dictionary_set_data(v24, "btAd", v27, v28);
  }
  if (self->_hciTransportType)
    xpc_dictionary_set_int64(xdict, "hciT", self->_hciTransportType);
  inquiryState = self->_inquiryState;
  v30 = xdict;
  if ((_DWORD)inquiryState)
  {
    xpc_dictionary_set_int64(xdict, "inqS", inquiryState);
    v30 = xdict;
  }
  if (self->_leaVersion)
  {
    xpc_dictionary_set_uint64(xdict, "fLEAVe", self->_leaVersion);
    v30 = xdict;
  }
  if (self->_lmpVersion)
  {
    xpc_dictionary_set_uint64(xdict, "lmpV", self->_lmpVersion);
    v30 = xdict;
  }
  productID = self->_productID;
  if ((_DWORD)productID)
  {
    xpc_dictionary_set_uint64(xdict, "pid", productID);
    v30 = xdict;
  }
  supportedServices = self->_supportedServices;
  if ((_DWORD)supportedServices)
  {
    xpc_dictionary_set_uint64(xdict, "supS", supportedServices);
    v30 = xdict;
  }
  if (self->_vendorID)
  {
    xpc_dictionary_set_uint64(xdict, "vid", self->_vendorID);
    v30 = xdict;
  }
  if (self->_vendorIDSource)
  {
    xpc_dictionary_set_uint64(xdict, "vidS", self->_vendorIDSource);
    v30 = xdict;
  }

}

- (id)description
{
  return -[CBControllerInfo descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  CBControllerInfo *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSArray *v16;
  CBControllerInfo *v17;
  id v18;
  NSArray *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  id v25;
  uint64_t i;
  uint64_t v27;
  id v28;
  uint64_t v29;
  const char *v30;
  id v31;
  NSString *v32;
  id v33;
  unsigned int cloudSyncStatus;
  const char *v35;
  id v36;
  NSString *chipsetID;
  id v38;
  uint64_t discoverableState;
  const char *v40;
  id v41;
  NSString *v42;
  NSString *v43;
  NSArray *v44;
  NSArray *v45;
  char v46;
  id v47;
  id *v48;
  id v49;
  NSData *hardwareAddressData;
  NSData *v51;
  id v52;
  id v53;
  id v54;
  char *fastLEConnectionInfoVersion;
  id v56;
  NSString *v57;
  NSString *v58;
  NSArray *v59;
  void *v60;
  char v61;
  id *v62;
  id v63;
  id v64;
  id v65;
  __CFString *v66;
  id v67;
  id v68;
  NSData *v69;
  NSData *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  __CFString *v78;
  __CFString *v79;
  const char *v81;
  char *v82;
  NSString *v83;
  const char *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  _QWORD v90[2];
  _QWORD v91[2];
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  id v102;
  uint64_t v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  _QWORD v110[2];
  id v111;
  id v112;
  id v113;
  id v114;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  _BYTE v121[128];
  uint64_t v122;

  v3 = self;
  v122 = *MEMORY[0x1E0C80C00];
  if (a3 <= 0x14u)
  {
    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v4 = self->_audioLinkQualityArray;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v116, v121, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v117;
      do
      {
        v9 = 0;
        v10 = v7;
        do
        {
          if (*(_QWORD *)v117 != v8)
            objc_enumerationMutation(v4);
          v11 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * v9);
          CUDescriptionWithLevel();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = v10;
          objc_msgSend(v11, "deviceName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_retainAutorelease(v12);
          objc_msgSend(v14, "UTF8String");
          CUPrintText();
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          NSAppendPrintF();
          v7 = v10;

          ++v9;
          v10 = v7;
        }
        while (v6 != v9);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v116, v121, 16, v13, v87);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    v114 = v7;
    NSAppendPrintF_safe();
    v36 = v7;

    chipsetID = self->_chipsetID;
    if (chipsetID)
    {
      v113 = v36;
      v83 = chipsetID;
      NSAppendPrintF_safe();
      v38 = v36;

      v36 = v38;
    }
    v112 = v36;
    discoverableState = self->_discoverableState;
    if (discoverableState >= 3)
      v40 = "?";
    else
      v40 = off_1E5400A30[discoverableState];
    v84 = v40;
    NSAppendPrintF_safe();
    v41 = v112;

    v42 = self->_firmwareName;
    v43 = self->_firmwareVersion;
    v16 = v42;
    v44 = v43;
    v45 = v44;
    if (v16 == v44)
    {

    }
    else
    {
      if ((v16 == 0) == (v44 != 0))
      {

        if (!v16)
          goto LABEL_43;
        goto LABEL_42;
      }
      v46 = -[NSArray isEqual:](v16, "isEqual:", v44, v84);

      if ((v46 & 1) == 0)
      {
        if (!v16)
        {
LABEL_43:
          if (!v45)
          {
LABEL_48:
            hardwareAddressData = self->_hardwareAddressData;
            if (hardwareAddressData)
            {
              v109 = v41;
              v51 = hardwareAddressData;
              CUPrintNSDataAddress();
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              NSAppendPrintF_safe();
              v52 = v41;

              v41 = v52;
            }
            v108 = v41;
            NSAppendPrintF_safe();
            v53 = v41;

            if (self->_hciTransportType)
            {
              v107 = v53;
              NSAppendPrintF_safe();
              v63 = v53;

              v53 = v63;
            }
            v106 = v53;
            NSAppendPrintF_safe();
            v64 = v53;

            v105 = v64;
            NSAppendPrintF_safe();
            v65 = v64;

            v104 = v65;
            CUPrintFlags32();
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            NSAppendPrintF_safe();
            v66 = (__CFString *)v65;
            goto LABEL_83;
          }
          v110[0] = v41;
          v48 = (id *)v110;
LABEL_47:
          NSAppendPrintF_safe();
          v49 = *v48;

          v41 = v49;
          goto LABEL_48;
        }
LABEL_42:
        v110[1] = v41;
        NSAppendPrintF_safe();
        v47 = v41;

        v41 = v47;
        goto LABEL_43;
      }
    }
    v111 = v41;
    v48 = &v111;
    goto LABEL_47;
  }
  if ((a3 & 0x8000000) != 0)
  {
    v15 = 0;
    v16 = self->_audioLinkQualityArray;
    if (!-[NSArray count](v16, "count"))
      goto LABEL_11;
  }
  else
  {
    v103 = 0;
    NSAppendPrintF_safe();
    v15 = 0;
    v16 = v3->_audioLinkQualityArray;
    if (!-[NSArray count](v16, "count"))
    {
LABEL_11:
      v95 = v15;
      goto LABEL_25;
    }
  }
  v17 = v3;
  v102 = v15;
  NSAppendPrintF_safe();
  v18 = v15;

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v19 = v16;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v98, v120, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v99;
    v23 = "";
    do
    {
      if (*(_QWORD *)v99 != v22)
        objc_enumerationMutation(v19);
      v24 = **((_QWORD **)&v98 + 1);
      v97 = v18;
      v81 = v23;
      v88 = v24;
      NSAppendPrintF_safe();
      v25 = v18;

      if (v21 < 2)
      {
        v18 = v25;
      }
      else
      {
        for (i = 1; i != v21; ++i)
        {
          if (*(_QWORD *)v99 != v22)
            objc_enumerationMutation(v19);
          v27 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * i);
          v97 = v25;
          v81 = ", ";
          v88 = v27;
          NSAppendPrintF_safe();
          v18 = v25;

          v25 = v18;
        }
      }
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v98, v120, 16, v81, v88);
      v23 = ", ";
    }
    while (v21);
  }

  v96 = v18;
  NSAppendPrintF_safe();
  v15 = v18;

  v3 = v17;
  v95 = v15;
LABEL_25:
  NSAppendPrintF_safe();
  v28 = v95;

  v94 = v28;
  v29 = v3->_discoverableState;
  v30 = "?";
  if (v29 <= 2)
    v30 = off_1E5400A30[v29];
  v82 = (char *)v30;
  NSAppendPrintF_safe();
  v31 = v94;

  v32 = v3->_chipsetID;
  if (v32)
  {
    v93 = v31;
    v82 = v32;
    NSAppendPrintF_safe();
    v33 = v31;

    v31 = v33;
  }
  cloudSyncStatus = v3->_cloudSyncStatus;
  if (v3->_cloudSyncStatus)
  {
    v92 = v31;
    if (cloudSyncStatus > 3)
      v35 = "?";
    else
      v35 = off_1E5400980[(char)(cloudSyncStatus - 1)];
    v82 = (char *)v35;
    NSAppendPrintF_safe();
    v54 = v92;

    v31 = v54;
  }
  fastLEConnectionInfoVersion = (char *)v3->_fastLEConnectionInfoVersion;
  if (v3->_fastLEConnectionInfoVersion)
  {
    v91[1] = v31;
    v82 = fastLEConnectionInfoVersion;
    NSAppendPrintF_safe();
    v56 = v31;

    v31 = v56;
  }
  v57 = v3->_firmwareName;
  v58 = v3->_firmwareVersion;
  v45 = v57;
  v59 = v58;
  v60 = v59;
  if (v45 != v59)
  {
    if ((v45 == 0) != (v59 != 0))
    {
      v61 = -[NSArray isEqual:](v45, "isEqual:", v59, v82);

      if ((v61 & 1) != 0)
      {
        if (!v60)
          goto LABEL_72;
        goto LABEL_62;
      }
    }
    else
    {

    }
    if (v45)
    {
      v90[1] = v31;
      NSAppendPrintF_safe();
      v67 = v31;

      v31 = v67;
    }
    if (!v60)
      goto LABEL_72;
    v90[0] = v31;
    v62 = (id *)v90;
    goto LABEL_71;
  }

  if (v60)
  {
LABEL_62:
    v91[0] = v31;
    v62 = (id *)v91;
LABEL_71:
    NSAppendPrintF_safe();
    v68 = *v62;

    v31 = v68;
  }
LABEL_72:
  v69 = v3->_hardwareAddressData;
  if (v69)
  {
    v70 = v69;
    CUPrintNSDataAddress();
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v71 = v31;

    v31 = v71;
  }
  if (v3->_productID)
  {
    NSAppendPrintF_safe();
    v72 = v31;

    v31 = v72;
  }
  if (v3->_vendorID)
  {
    NSAppendPrintF_safe();
    v73 = v31;

    v31 = v73;
  }
  if (v3->_vendorIDSource)
  {
    NSAppendPrintF_safe();
    v74 = v31;

    v31 = v74;
  }
  if (v3->_hciTransportType)
  {
    NSAppendPrintF_safe();
    v75 = v31;

    v31 = v75;
  }
  NSAppendPrintF_safe();
  v76 = v31;

  NSAppendPrintF_safe();
  v77 = v76;

  CUPrintFlags32();
  v65 = (id)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  v66 = (__CFString *)v77;

LABEL_83:
  if (v66)
    v78 = v66;
  else
    v78 = &stru_1E5403C08;
  v79 = v78;

  return v79;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSArray *audioLinkQualityArray;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  int v11;
  int64_t v12;
  int64_t bluetoothState;
  NSString *chipsetID;
  void *v15;
  NSArray *v16;
  int v17;
  int v18;
  int cloudSyncStatus;
  int discoverableState;
  int fastLEConnectionAllowed;
  int fastLEConnectionInfoVersion;
  NSData *fastLEConnectionInfoData;
  void *v24;
  NSArray *v25;
  int v26;
  NSString *firmwareName;
  void *v28;
  NSArray *v29;
  int v30;
  NSString *firmwareVersion;
  void *v32;
  NSArray *v33;
  int v34;
  NSData *hardwareAddressData;
  void *v36;
  NSArray *v37;
  int v38;
  char v39;
  int hciTransportType;
  int inquiryState;
  int leaVersion;
  int lmpVersion;
  unsigned int productID;
  unsigned int supportedServices;
  int vendorID;
  int vendorIDSource;
  NSError *lastChipsetInitError;
  void *v49;
  NSArray *v50;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    audioLinkQualityArray = self->_audioLinkQualityArray;
    objc_msgSend(v5, "audioLinkQualityArray");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = audioLinkQualityArray;
    v9 = v7;
    if (v8 == v9)
    {

      bluetoothState = self->_bluetoothState;
      if (bluetoothState != objc_msgSend(v5, "bluetoothState"))
        goto LABEL_49;
    }
    else
    {
      v10 = v9;
      if ((v8 == 0) == (v9 != 0))
        goto LABEL_50;
      v11 = -[NSArray isEqual:](v8, "isEqual:", v9);

      if (!v11)
        goto LABEL_49;
      v12 = self->_bluetoothState;
      if (v12 != objc_msgSend(v5, "bluetoothState"))
        goto LABEL_49;
    }
    chipsetID = self->_chipsetID;
    objc_msgSend(v5, "chipsetID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = chipsetID;
    v16 = v15;
    if (v8 == v16)
    {

      cloudSyncStatus = self->_cloudSyncStatus;
      if (cloudSyncStatus != objc_msgSend(v5, "cloudSyncStatus"))
        goto LABEL_49;
    }
    else
    {
      v10 = v16;
      if ((v8 == 0) == (v16 != 0))
        goto LABEL_50;
      v17 = -[NSArray isEqual:](v8, "isEqual:", v16);

      if (!v17)
        goto LABEL_49;
      v18 = self->_cloudSyncStatus;
      if (v18 != objc_msgSend(v5, "cloudSyncStatus"))
        goto LABEL_49;
    }
    discoverableState = self->_discoverableState;
    if (discoverableState != objc_msgSend(v5, "discoverableState"))
      goto LABEL_49;
    fastLEConnectionAllowed = self->_fastLEConnectionAllowed;
    if (fastLEConnectionAllowed != objc_msgSend(v5, "fastLEConnectionAllowed"))
      goto LABEL_49;
    fastLEConnectionInfoVersion = self->_fastLEConnectionInfoVersion;
    if (fastLEConnectionInfoVersion != objc_msgSend(v5, "fastLEConnectionInfoVersion"))
      goto LABEL_49;
    fastLEConnectionInfoData = self->_fastLEConnectionInfoData;
    objc_msgSend(v5, "fastLEConnectionInfoData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = fastLEConnectionInfoData;
    v25 = v24;
    if (v8 == v25)
    {

    }
    else
    {
      v10 = v25;
      if ((v8 == 0) == (v25 != 0))
        goto LABEL_50;
      v26 = -[NSArray isEqual:](v8, "isEqual:", v25);

      if (!v26)
        goto LABEL_49;
    }
    firmwareName = self->_firmwareName;
    objc_msgSend(v5, "firmwareName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = firmwareName;
    v29 = v28;
    if (v8 == v29)
    {

    }
    else
    {
      v10 = v29;
      if ((v8 == 0) == (v29 != 0))
        goto LABEL_50;
      v30 = -[NSArray isEqual:](v8, "isEqual:", v29);

      if (!v30)
        goto LABEL_49;
    }
    firmwareVersion = self->_firmwareVersion;
    objc_msgSend(v5, "firmwareVersion");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = firmwareVersion;
    v33 = v32;
    if (v8 == v33)
    {

    }
    else
    {
      v10 = v33;
      if ((v8 == 0) == (v33 != 0))
        goto LABEL_50;
      v34 = -[NSArray isEqual:](v8, "isEqual:", v33);

      if (!v34)
        goto LABEL_49;
    }
    hardwareAddressData = self->_hardwareAddressData;
    objc_msgSend(v5, "hardwareAddressData");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = hardwareAddressData;
    v37 = v36;
    if (v8 == v37)
    {

    }
    else
    {
      v10 = v37;
      if ((v8 == 0) == (v37 != 0))
        goto LABEL_50;
      v38 = -[NSArray isEqual:](v8, "isEqual:", v37);

      if (!v38)
        goto LABEL_49;
    }
    hciTransportType = self->_hciTransportType;
    if (hciTransportType == objc_msgSend(v5, "hciTransportType"))
    {
      inquiryState = self->_inquiryState;
      if (inquiryState == objc_msgSend(v5, "inquiryState"))
      {
        leaVersion = self->_leaVersion;
        if (leaVersion == objc_msgSend(v5, "leaVersion"))
        {
          lmpVersion = self->_lmpVersion;
          if (lmpVersion == objc_msgSend(v5, "lmpVersion"))
          {
            productID = self->_productID;
            if (productID == objc_msgSend(v5, "productID"))
            {
              supportedServices = self->_supportedServices;
              if (supportedServices == objc_msgSend(v5, "supportedServices"))
              {
                vendorID = self->_vendorID;
                if (vendorID == objc_msgSend(v5, "vendorID"))
                {
                  vendorIDSource = self->_vendorIDSource;
                  if (vendorIDSource == objc_msgSend(v5, "vendorIDSource"))
                  {
                    lastChipsetInitError = self->_lastChipsetInitError;
                    objc_msgSend(v5, "lastChipsetInitError");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    v8 = lastChipsetInitError;
                    v50 = v49;
                    v10 = v50;
                    if (v8 == v50)
                    {
                      v39 = 1;
                      goto LABEL_51;
                    }
                    if ((v8 == 0) != (v50 != 0))
                    {
                      v39 = -[NSArray isEqual:](v8, "isEqual:", v50);
LABEL_51:

                      goto LABEL_52;
                    }
LABEL_50:
                    v39 = 0;
                    goto LABEL_51;
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_49:
    v39 = 0;
LABEL_52:

    goto LABEL_53;
  }
  v39 = 0;
LABEL_53:

  return v39;
}

- (NSArray)audioLinkQualityArray
{
  return self->_audioLinkQualityArray;
}

- (void)setAudioLinkQualityArray:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (void)setBluetoothState:(int64_t)a3
{
  self->_bluetoothState = a3;
}

- (NSString)chipsetID
{
  return self->_chipsetID;
}

- (void)setChipsetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unsigned)cloudSyncStatus
{
  return self->_cloudSyncStatus;
}

- (void)setCloudSyncStatus:(unsigned __int8)a3
{
  self->_cloudSyncStatus = a3;
}

- (int)discoverableState
{
  return self->_discoverableState;
}

- (void)setDiscoverableState:(int)a3
{
  self->_discoverableState = a3;
}

- (unsigned)fastLEConnectionInfoVersion
{
  return self->_fastLEConnectionInfoVersion;
}

- (void)setFastLEConnectionInfoVersion:(unsigned __int8)a3
{
  self->_fastLEConnectionInfoVersion = a3;
}

- (NSData)fastLEConnectionInfoData
{
  return self->_fastLEConnectionInfoData;
}

- (void)setFastLEConnectionInfoData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)firmwareName
{
  return self->_firmwareName;
}

- (void)setFirmwareName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSData)hardwareAddressData
{
  return self->_hardwareAddressData;
}

- (void)setHardwareAddressData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (char)hciTransportType
{
  return self->_hciTransportType;
}

- (void)setHciTransportType:(char)a3
{
  self->_hciTransportType = a3;
}

- (int)inquiryState
{
  return self->_inquiryState;
}

- (void)setInquiryState:(int)a3
{
  self->_inquiryState = a3;
}

- (unsigned)leaVersion
{
  return self->_leaVersion;
}

- (void)setLeaVersion:(unsigned __int8)a3
{
  self->_leaVersion = a3;
}

- (unsigned)lmpVersion
{
  return self->_lmpVersion;
}

- (void)setLmpVersion:(unsigned __int8)a3
{
  self->_lmpVersion = a3;
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned int)a3
{
  self->_productID = a3;
}

- (unsigned)supportedServices
{
  return self->_supportedServices;
}

- (void)setSupportedServices:(unsigned int)a3
{
  self->_supportedServices = a3;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(unsigned __int16)a3
{
  self->_vendorID = a3;
}

- (unsigned)vendorIDSource
{
  return self->_vendorIDSource;
}

- (void)setVendorIDSource:(unsigned __int8)a3
{
  self->_vendorIDSource = a3;
}

- (NSError)lastChipsetInitError
{
  return self->_lastChipsetInitError;
}

- (void)setLastChipsetInitError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)fastLEConnectionAllowed
{
  return self->_fastLEConnectionAllowed;
}

- (void)setFastLEConnectionAllowed:(BOOL)a3
{
  self->_fastLEConnectionAllowed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastChipsetInitError, 0);
  objc_storeStrong((id *)&self->_hardwareAddressData, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_firmwareName, 0);
  objc_storeStrong((id *)&self->_fastLEConnectionInfoData, 0);
  objc_storeStrong((id *)&self->_chipsetID, 0);
  objc_storeStrong((id *)&self->_audioLinkQualityArray, 0);
}

@end
