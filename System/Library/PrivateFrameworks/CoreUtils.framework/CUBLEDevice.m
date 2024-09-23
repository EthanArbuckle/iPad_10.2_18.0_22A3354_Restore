@implementation CUBLEDevice

- (id)description
{
  return -[CUBLEDevice descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v10;
  NSData *v11;
  NSData *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSData *v34;
  NSData *v35;
  NSData *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __CFString *v44;
  NSData *manufacturerData;
  NSData *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t deviceFlags;
  __CFString *v55;
  NSData *lgDeviceID;
  NSData *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  __CFString *v65;
  uint64_t lgFlags;
  __CFString *v67;
  unsigned int nearbyActivityLevel;
  const char *v69;
  __CFString *v70;
  uint64_t nearbyFlags;
  __CFString *v72;
  NSData *nearbyAuthTag;
  NSData *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __CFString *v81;
  int objectDiscoveryMode;
  const char *v83;
  const char *v84;
  const char *v85;
  __CFString *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  __CFString *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t objectDiscoveryBatteryState;
  NSData *objectDiscoveryPublicKeyData;
  NSData *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  __CFString *v109;
  uint64_t proximityPairingProductID;
  __CFString *v111;
  __CFString *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t changeFlags;
  __CFString *v120;
  __CFString *v121;
  uint64_t v123;
  CFMutableStringRef v124;
  CFMutableStringRef v125;
  CFMutableStringRef v126;
  CFMutableStringRef v127;
  CFMutableStringRef v128;
  CFMutableStringRef v129;
  CFMutableStringRef v130;
  CFMutableStringRef v131;
  CFMutableStringRef v132;
  CFMutableStringRef v133;
  CFMutableStringRef v134;
  CFMutableStringRef v135;
  CFMutableStringRef v136;
  CFMutableStringRef v137;
  CFMutableStringRef v138;
  CFMutableStringRef v139;
  CFMutableStringRef v140;
  CFMutableStringRef v141;
  CFMutableStringRef v142;
  CFMutableStringRef v143;

  v143 = 0;
  NSAppendPrintF(&v143, (uint64_t)"CUBLEDevice %@", *(uint64_t *)&a3, v3, v4, v5, v6, v7, (uint64_t)self->_identifier);
  v10 = v143;
  v11 = self->_addressData;
  v12 = v11;
  if (v11)
  {
    v142 = v10;
    if (-[NSData length](v11, "length") == 6)
      v19 = -[NSData bytes](objc_retainAutorelease(v12), "bytes");
    else
      v19 = 0;
    NSAppendPrintF(&v142, (uint64_t)", Addr %.6a", v13, v14, v15, v16, v17, v18, v19);
    v20 = v142;

    v10 = v20;
  }

  v141 = v10;
  NSAppendPrintF(&v141, (uint64_t)", RSSI %3d", v21, v22, v23, v24, v25, v26, self->_rawRSSI);
  v27 = v141;

  if (a3 < 50)
  {
    v34 = self->_appleManufacturerData;
    v35 = v34;
    if (v34)
    {
      v140 = v27;
      v36 = objc_retainAutorelease(v34);
      v37 = -[NSData bytes](v36, "bytes");
      -[NSData length](v36, "length");
      NSAppendPrintF(&v140, (uint64_t)", AMD <%H>", v38, v39, v40, v41, v42, v43, v37);
      v44 = v140;
    }
    else
    {
      manufacturerData = self->_manufacturerData;
      if (!manufacturerData)
      {
LABEL_12:

        goto LABEL_13;
      }
      v139 = v27;
      v46 = objc_retainAutorelease(manufacturerData);
      v47 = -[NSData bytes](v46, "bytes");
      -[NSData length](v46, "length");
      NSAppendPrintF(&v139, (uint64_t)", MfD <%H>", v48, v49, v50, v51, v52, v53, v47);
      v44 = v139;

      v27 = (__CFString *)v46;
    }

    v27 = v44;
    goto LABEL_12;
  }
LABEL_13:
  deviceFlags = self->_deviceFlags;
  if ((_DWORD)deviceFlags)
  {
    v138 = v27;
    NSAppendPrintF(&v138, (uint64_t)", DF %#{flags}", v28, v29, v30, v31, v32, v33, deviceFlags);
    v55 = v138;

    v27 = v55;
  }
  lgDeviceID = self->_lgDeviceID;
  if (lgDeviceID)
  {
    v137 = v27;
    v57 = objc_retainAutorelease(lgDeviceID);
    v58 = -[NSData bytes](v57, "bytes");
    -[NSData length](v57, "length");
    NSAppendPrintF(&v137, (uint64_t)", LGID <%H>", v59, v60, v61, v62, v63, v64, v58);
    v65 = v137;

    v27 = v65;
  }
  lgFlags = self->_lgFlags;
  if ((_DWORD)lgFlags)
  {
    v136 = v27;
    NSAppendPrintF(&v136, (uint64_t)", LGF %#{flags}", v28, v29, v30, v31, v32, v33, lgFlags);
    v67 = v136;

    v27 = v67;
  }
  nearbyActivityLevel = self->_nearbyActivityLevel;
  if (self->_nearbyActivityLevel)
  {
    v135 = v27;
    if (nearbyActivityLevel > 0xE)
      v69 = "?";
    else
      v69 = off_1E25DC228[(nearbyActivityLevel - 1)];
    NSAppendPrintF(&v135, (uint64_t)", AL %s", v28, v29, v30, v31, v32, v33, (uint64_t)v69);
    v70 = v135;

    v27 = v70;
  }
  nearbyFlags = self->_nearbyFlags;
  if ((_DWORD)nearbyFlags)
  {
    v134 = v27;
    NSAppendPrintF(&v134, (uint64_t)", Fl %#{flags}", v28, v29, v30, v31, v32, v33, nearbyFlags);
    v72 = v134;

    v27 = v72;
  }
  nearbyAuthTag = self->_nearbyAuthTag;
  if (nearbyAuthTag)
  {
    v133 = v27;
    v74 = nearbyAuthTag;
    NSAppendPrintF(&v133, (uint64_t)", AT <%@>", v75, v76, v77, v78, v79, v80, (uint64_t)v74);
    v81 = v133;

    v27 = v81;
  }
  objectDiscoveryMode = self->_objectDiscoveryMode;
  if (objectDiscoveryMode)
  {
    v83 = "?";
    v84 = "NearOwner";
    if (objectDiscoveryMode != 1)
      v84 = "?";
    if (objectDiscoveryMode == 2)
      v85 = "Wild";
    else
      v85 = v84;
    v132 = v27;
    NSAppendPrintF(&v132, (uint64_t)", ObjDisc %s", v28, v29, v30, v31, v32, v33, (uint64_t)v85);
    v86 = v132;

    v131 = v86;
    NSAppendPrintF(&v131, (uint64_t)", PID %d", v87, v88, v89, v90, v91, v92, self->_objectDiscoveryProductID);
    v93 = v131;

    v130 = v93;
    objectDiscoveryBatteryState = self->_objectDiscoveryBatteryState;
    if (objectDiscoveryBatteryState <= 5)
      v83 = off_1E25DC298[objectDiscoveryBatteryState];
    NSAppendPrintF(&v130, (uint64_t)", Battery %s", v94, v95, v96, v97, v98, v99, (uint64_t)v83);
    v27 = v130;

    objectDiscoveryPublicKeyData = self->_objectDiscoveryPublicKeyData;
    if (objectDiscoveryPublicKeyData)
    {
      v129 = v27;
      v102 = objectDiscoveryPublicKeyData;
      NSAppendPrintF(&v129, (uint64_t)", PK <%@>", v103, v104, v105, v106, v107, v108, (uint64_t)v102);
      v109 = v129;

      v27 = v109;
    }
  }
  proximityPairingProductID = self->_proximityPairingProductID;
  if (self->_proximityPairingProductID)
  {
    v128 = v27;
    NSAppendPrintF(&v128, (uint64_t)", PP PID 0x%04x, ST %d (%s)", v28, v29, v30, v31, v32, v33, proximityPairingProductID);
    v111 = v128;

    v27 = v111;
  }
  if (self->_proximityPairingSubType == 1)
  {
    v127 = v27;
    NSAppendPrintF(&v127, (uint64_t)", ASC %d", v28, v29, v30, v31, v32, v33, self->_proximityPairingAudioSourceCount);
    v112 = v127;

    v126 = v112;
    NSAppendPrintF(&v126, (uint64_t)", LCH %02X:%02X:%02X", v113, v114, v115, v116, v117, v118, self->_proximityPairingLastConnectedHost.bytes[0]);
    v27 = v126;

  }
  changeFlags = self->_changeFlags;
  if ((_DWORD)changeFlags)
  {
    v125 = v27;
    NSAppendPrintF(&v125, (uint64_t)", %#{flags}", v28, v29, v30, v31, v32, v33, changeFlags);
    v120 = v125;

    v27 = v120;
  }
  if (a3 < 21)
  {
    v124 = v27;
    NSAppendPrintF(&v124, (uint64_t)"\n", v28, v29, v30, v31, v32, v33, v123);
    v121 = v124;

    v27 = v121;
  }
  return v27;
}

- (unsigned)updateWithAdvertisementData:(id)a3 rssi:(int)a4 oldDevice:(id)a5
{
  const __CFDictionary *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  unsigned int v16;
  id v17;
  CFTypeID TypeID;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  int v24;
  int v25;

  v8 = (const __CFDictionary *)a3;
  v9 = a5;
  v10 = (id)getCBAdvertisementDataDeviceAddress[0]();
  CFDictionaryGetCFDataOfLength(v8, v10, 6, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v9, "addressData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
    v14 = v12;
    v15 = v14;
    if (v13 == v14)
    {
      v16 = 0;
    }
    else
    {
      v16 = 2;
      if (v14)
      {
        if (objc_msgSend(v13, "isEqual:", v14))
          v16 = 0;
        else
          v16 = 2;
      }
    }

    objc_storeStrong((id *)&self->_addressData, v11);
  }
  else
  {
    v16 = 0;
  }

  v17 = (id)getCBAdvertisementDataManufacturerDataKey[0]();
  TypeID = CFDataGetTypeID();
  CFDictionaryGetTypedValue(v8, v17, TypeID, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v9, "manufacturerData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v19;
    v22 = v20;
    v23 = v22;
    if (v21 == v22)
    {
      v24 = 0;
    }
    else if (v22)
    {
      v24 = objc_msgSend(v21, "isEqual:", v22) ^ 1;
    }
    else
    {
      v24 = 1;
    }

    v16 |= v24;
    objc_storeStrong((id *)&self->_manufacturerData, v19);
    -[CUBLEDevice _parseManufacturerData:advertisementFields:](self, "_parseManufacturerData:advertisementFields:", v21, v8);
  }

  if ((a4 - 20) >= 0x6B)
    v25 = a4;
  else
    v25 = a4 - 126;
  if ((v25 - 1) < 0xFFFFFFA5)
    v25 = 0;
  if (v25 != self->_rawRSSI)
  {
    v16 |= 8u;
    self->_rawRSSI = v25;
  }

  return v16;
}

- (void)_parseManufacturerData:(id)a3 advertisementFields:(id)a4
{
  id v6;
  id v7;
  unsigned __int16 *v8;
  uint64_t v9;
  char *v10;
  int v11;
  unsigned __int16 *v12;
  int v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v14 = objc_retainAutorelease(v6);
  v8 = (unsigned __int16 *)objc_msgSend(v14, "bytes");
  v9 = objc_msgSend(v14, "length");
  if (v9 >= 2)
  {
    v10 = (char *)v8 + v9;
    v13 = *v8;
    v12 = v8 + 1;
    v11 = v13;
    if (v13 == 196)
    {
      -[CUBLEDevice _parseLGManufacturerPtr:end:fields:](self, "_parseLGManufacturerPtr:end:fields:", v12, v10, v7);
    }
    else if (v11 == 76)
    {
      -[CUBLEDevice _parseAppleManufacturerPtr:end:data:](self, "_parseAppleManufacturerPtr:end:data:", v12, v10, v14);
    }
  }

}

- (void)_parseAppleManufacturerPtr:(const char *)a3 end:(const char *)a4 data:(id)a5
{
  int64_t v9;
  int v10;
  id v11;

  v11 = a5;
  if (a4 - a3 < 2)
  {
LABEL_13:
    objc_storeStrong((id *)&self->_appleManufacturerData, a5);
  }
  else
  {
    while (1)
    {
      v9 = a3[1] & 0x1F;
      if (a4 - (a3 + 2) < v9)
        break;
      v10 = *(unsigned __int8 *)a3;
      a3 += v9 + 2;
      if (v10 > 15)
      {
        if (v10 == 16)
        {
          -[CUBLEDevice _parseAppleNearbyInfoPtr:end:](self, "_parseAppleNearbyInfoPtr:end:");
        }
        else if (v10 == 18)
        {
          -[CUBLEDevice _parseAppleObjectDiscoveryPtr:end:](self, "_parseAppleObjectDiscoveryPtr:end:");
        }
      }
      else if (v10 == 7)
      {
        -[CUBLEDevice _parseAppleProximityPairingPtr:end:](self, "_parseAppleProximityPairingPtr:end:");
      }
      else if (v10 == 15)
      {
        -[CUBLEDevice _parseAppleNearbyActionPtr:end:](self, "_parseAppleNearbyActionPtr:end:");
      }
      if (a4 - a3 <= 1)
        goto LABEL_13;
    }
  }

}

- (void)_parseAppleNearbyActionPtr:(const char *)a3 end:(const char *)a4
{
  unsigned int v5;
  int v6;
  NSData *v7;
  NSData *nearbyAuthTag;

  if (a4 - a3 >= 1)
  {
    v5 = *(unsigned __int8 *)a3;
    v6 = (v5 >> 4) & 8;
    self->_nearbyFlags |= (4 * v5) & 0x100 | (16 * v5) & 0x200 | v6;
    if ((uint64_t)&a4[~(unint64_t)a3] >= 1)
    {
      self->_nearbyActionType = *((unsigned __int8 *)a3 + 1);
      if (v6)
      {
        if (a4 - (a3 + 2) >= 3)
        {
          v7 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3 + 2, 3);
          nearbyAuthTag = self->_nearbyAuthTag;
          self->_nearbyAuthTag = v7;

        }
      }
    }
  }
  self->_scanFlags |= 2u;
}

- (void)_parseAppleNearbyInfoPtr:(const char *)a3 end:(const char *)a4
{
  int v5;
  int v6;
  unsigned int v7;
  NSData *v8;
  NSData *nearbyAuthTag;

  if (a4 - a3 < 1)
  {
    v6 = 0;
  }
  else
  {
    v5 = *(unsigned __int8 *)a3;
    self->_nearbyActivityLevel = v5 & 0xF;
    v6 = (4 * v5) & 0xC0;
    if ((uint64_t)&a4[~(unint64_t)a3] >= 1)
    {
      v7 = *((unsigned __int8 *)a3 + 1);
      v6 |= (8 * v7) & 0x20 | (16 * ((v7 >> 3) & 1)) | (v7 >> 3) & 4 | (v7 >> 1) & 8 | (v7 >> 5) & 2 | (v7 >> 7);
      if (((v7 >> 1) & 8) != 0 && a4 - (a3 + 2) >= 3)
      {
        v8 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3 + 2, 3);
        nearbyAuthTag = self->_nearbyAuthTag;
        self->_nearbyAuthTag = v8;

      }
    }
  }
  self->_nearbyFlags |= v6;
  self->_scanFlags |= 4u;
}

- (void)_parseAppleObjectDiscoveryPtr:(const char *)a3 end:(const char *)a4
{
  unsigned int v7;
  const char *v8;
  unsigned __int16 v9;
  NSData *v10;
  uint64_t v11;
  __int16 v12;
  NSData *v13;
  NSData *objectDiscoveryNearOwnerID;
  uint64_t v15;
  __int16 v16;
  NSData *v17;
  int v18;
  __int16 v19;
  _BYTE v20[22];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a4 - a3 >= 1)
  {
    v8 = a3 + 1;
    v7 = *(unsigned __int8 *)a3;
    if ((v7 & 0x10) != 0)
      v9 = 21760;
    else
      v9 = -26215;
    v10 = self->_addressData;
    if (-[NSData length](v10, "length") != 6)
      goto LABEL_17;
    if (a4 - v8 < 22)
    {
      v15 = -[NSData bytes](objc_retainAutorelease(v10), "bytes");
      v16 = *(_WORD *)(v15 + 4);
      v18 = *(_DWORD *)v15;
      v19 = v16;
      if (a4 - v8 >= 1)
        LOBYTE(v18) = v18 & 0x3F | (*v8 << 6);
      v13 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v18, 6);
      self->_objectDiscoveryBatteryState = v7 >> 5;
      self->_objectDiscoveryMode = 1;
      self->_objectDiscoveryProductID = v9;
      if (!v13)
        goto LABEL_16;
      objectDiscoveryNearOwnerID = self->_objectDiscoveryNearOwnerID;
      self->_objectDiscoveryNearOwnerID = v13;
    }
    else
    {
      v11 = -[NSData bytes](objc_retainAutorelease(v10), "bytes");
      v12 = *(_WORD *)(v11 + 4);
      v18 = *(_DWORD *)v11;
      v19 = v12;
      *(_OWORD *)v20 = *(_OWORD *)v8;
      *(_QWORD *)&v20[14] = *(_QWORD *)(v8 + 14);
      if (a4 - (a3 + 23) >= 1)
        LOBYTE(v18) = v18 & 0x3F | (a3[23] << 6);
      v13 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v18, 28);
      self->_objectDiscoveryBatteryState = v7 >> 5;
      self->_objectDiscoveryMode = 2;
      self->_objectDiscoveryProductID = v9;
      if (!v13)
        goto LABEL_16;
      objectDiscoveryNearOwnerID = self->_objectDiscoveryPublicKeyData;
      self->_objectDiscoveryPublicKeyData = v13;
    }
    v17 = v13;

LABEL_16:
    self->_scanFlags |= 0x20u;
LABEL_17:

  }
}

- (void)_parseAppleProximityPairingPtr:(const char *)a3 end:(const char *)a4
{
  const char *v5;
  int v6;
  int v7;
  unsigned __int16 v8;

  if (a4 - a3 < 1)
  {
    self->_proximityPairingProductID = 0;
    self->_proximityPairingSubType = 255;
    self->_scanFlags |= 0x10u;
  }
  else
  {
    v7 = *(unsigned __int8 *)a3;
    v5 = a3 + 1;
    v6 = v7;
    if (a4 - v5 <= 1)
    {
      v8 = 0;
    }
    else
    {
      v8 = *(_WORD *)(a3 + 1);
      v5 = a3 + 3;
    }
    self->_proximityPairingProductID = v8;
    self->_proximityPairingSubType = v6;
    self->_scanFlags |= 0x10u;
    if (v6 == 5)
    {
      -[CUBLEDevice _parseAppleProximityPairingObjectSetupPtr:end:](self, "_parseAppleProximityPairingObjectSetupPtr:end:", v5);
    }
    else if (v6 == 1)
    {
      -[CUBLEDevice _parseAppleProximityPairingStatusPtr:end:](self, "_parseAppleProximityPairingStatusPtr:end:", v5);
    }
  }
}

- (void)_parseAppleProximityPairingStatusPtr:(const char *)a3 end:(const char *)a4
{
  __int16 v4;

  if (a4 - a3 <= 6)
  {
    self->_proximityPairingAudioSourceCount = 0;
  }
  else
  {
    self->_proximityPairingAudioSourceCount = (a3[6] >> 2) & 3;
    if ((unint64_t)(a4 - a3) >= 0xD)
    {
      v4 = *((_WORD *)a3 + 5);
      self->_proximityPairingLastConnectedHost.bytes[2] = a3[12];
      *(_WORD *)self->_proximityPairingLastConnectedHost.bytes = v4;
      return;
    }
  }
  self->_proximityPairingLastConnectedHost.bytes[2] = 0;
  *(_WORD *)self->_proximityPairingLastConnectedHost.bytes = 0;
}

- (void)_parseAppleProximityPairingObjectSetupPtr:(const char *)a3 end:(const char *)a4
{
  unsigned int v7;
  unsigned int v8;
  const char *v9;
  int64_t v10;
  id v11;
  NSString *objectSetupFontCode;
  NSString *v13;
  NSString *objectSetupMessage;
  NSString *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;

  self->_scanFlags |= 0x80u;
  if (a4 - a3 <= 0)
  {
    self->_objectSetupFlags = 0;
LABEL_8:
    objectSetupFontCode = self->_objectSetupFontCode;
    self->_objectSetupFontCode = 0;

    v11 = 0;
    v13 = 0;
    goto LABEL_9;
  }
  v7 = *(unsigned __int8 *)a3;
  self->_objectSetupFlags = v7;
  if ((uint64_t)&a4[~(unint64_t)a3] < 1)
    goto LABEL_8;
  v8 = *((unsigned __int8 *)a3 + 1);
  self->_objectSetupBatteryState = v8 & 7;
  self->_objectSetupBatteryPerformance = (v8 >> 3) & 3;
  if (a4 - a3 - 2 <= 0)
    goto LABEL_8;
  v9 = a3 + 3;
  self->_objectSetupColorCode = a3[2];
  v10 = a4 - (a3 + 3);
  if ((v7 & 0x10) != 0 && v10 >= 7)
  {
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a3 + 3, 7, 4);
    v9 = a3 + 10;
    objc_storeStrong((id *)&self->_objectSetupFontCode, v18);
    v11 = v18;
    v10 = a4 - (a3 + 10);
  }
  else
  {
    v15 = self->_objectSetupFontCode;
    self->_objectSetupFontCode = 0;

    v11 = 0;
    v13 = 0;
    if ((v7 & 0x10) == 0)
      goto LABEL_9;
  }
  v20 = v11;
  if (v10 < 1)
  {
    v13 = 0;
  }
  else
  {
    v16 = 0;
    v17 = 12;
    if ((unint64_t)v10 < 0xC)
      v17 = v10;
    while (v9[v16])
    {
      if (v17 == ++v16)
      {
        v16 = v17;
        break;
      }
    }
    v13 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v9, v16, 4);
  }
  v11 = v20;
LABEL_9:
  v19 = v11;
  objectSetupMessage = self->_objectSetupMessage;
  self->_objectSetupMessage = v13;

}

- (void)_parseLGManufacturerPtr:(const char *)a3 end:(const char *)a4 fields:(id)a5
{
  const __CFDictionary *v6;
  CFTypeID TypeID;
  uint64_t v8;
  NSData *v9;
  NSData *lgBTAddress;
  id v11;

  self->_scanFlags |= 0x40u;
  self->_lgFlags = 0;
  if (a4 - a3 >= 4 && (a3[3] & 1) != 0)
    self->_lgFlags = 3;
  v6 = (const __CFDictionary *)a5;
  TypeID = CFDataGetTypeID();
  CFDictionaryGetTypedValue(v6, CFSTR("kCBAdvDataLeBluetoothDeviceAddress"), TypeID, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v11, "length") >= 7)
  {
    v8 = objc_msgSend(objc_retainAutorelease(v11), "bytes");
    v9 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v8 + 1, 6);
    lgBTAddress = self->_lgBTAddress;
    self->_lgBTAddress = v9;

  }
}

- (NSData)addressData
{
  return self->_addressData;
}

- (NSData)appleManufacturerData
{
  return self->_appleManufacturerData;
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_changeFlags = a3;
}

- (unsigned)deviceFlags
{
  return self->_deviceFlags;
}

- (void)setDeviceFlags:(unsigned int)a3
{
  self->_deviceFlags = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSData)lgBTAddress
{
  return self->_lgBTAddress;
}

- (NSData)lgDeviceID
{
  return self->_lgDeviceID;
}

- (unsigned)lgFlags
{
  return self->_lgFlags;
}

- (NSData)manufacturerData
{
  return self->_manufacturerData;
}

- (unsigned)nearbyActivityLevel
{
  return self->_nearbyActivityLevel;
}

- (int)nearbyActionType
{
  return self->_nearbyActionType;
}

- (NSData)nearbyAuthTag
{
  return self->_nearbyAuthTag;
}

- (unsigned)nearbyFlags
{
  return self->_nearbyFlags;
}

- (unsigned)objectDiscoveryBatteryState
{
  return self->_objectDiscoveryBatteryState;
}

- (int)objectDiscoveryMode
{
  return self->_objectDiscoveryMode;
}

- (NSData)objectDiscoveryNearOwnerID
{
  return self->_objectDiscoveryNearOwnerID;
}

- (unsigned)objectDiscoveryProductID
{
  return self->_objectDiscoveryProductID;
}

- (NSData)objectDiscoveryPublicKeyData
{
  return self->_objectDiscoveryPublicKeyData;
}

- (int)objectSetupBatteryPerformance
{
  return self->_objectSetupBatteryPerformance;
}

- (unsigned)objectSetupBatteryState
{
  return self->_objectSetupBatteryState;
}

- (unsigned)objectSetupColorCode
{
  return self->_objectSetupColorCode;
}

- (unsigned)objectSetupFlags
{
  return self->_objectSetupFlags;
}

- (NSString)objectSetupFontCode
{
  return self->_objectSetupFontCode;
}

- (NSString)objectSetupMessage
{
  return self->_objectSetupMessage;
}

- ($7EB1B296D1955B59A85A052388D5D5F9)proximityPairingLastConnectedHost
{
  return ($7EB1B296D1955B59A85A052388D5D5F9)(*(unsigned __int16 *)self->_proximityPairingLastConnectedHost.bytes | (self->_proximityPairingLastConnectedHost.bytes[2] << 16));
}

- (unsigned)proximityPairingProductID
{
  return self->_proximityPairingProductID;
}

- (int)proximityPairingSubType
{
  return self->_proximityPairingSubType;
}

- (unsigned)proximityPairingAudioSourceCount
{
  return self->_proximityPairingAudioSourceCount;
}

- (int)rawRSSI
{
  return self->_rawRSSI;
}

- (unsigned)scanFlags
{
  return self->_scanFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectSetupMessage, 0);
  objc_storeStrong((id *)&self->_objectSetupFontCode, 0);
  objc_storeStrong((id *)&self->_objectDiscoveryPublicKeyData, 0);
  objc_storeStrong((id *)&self->_objectDiscoveryNearOwnerID, 0);
  objc_storeStrong((id *)&self->_nearbyAuthTag, 0);
  objc_storeStrong((id *)&self->_manufacturerData, 0);
  objc_storeStrong((id *)&self->_lgDeviceID, 0);
  objc_storeStrong((id *)&self->_lgBTAddress, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_appleManufacturerData, 0);
  objc_storeStrong((id *)&self->_addressData, 0);
}

@end
