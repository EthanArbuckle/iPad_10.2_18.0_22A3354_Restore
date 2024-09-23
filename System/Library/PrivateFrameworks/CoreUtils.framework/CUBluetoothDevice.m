@implementation CUBluetoothDevice

- (CUBluetoothDevice)init
{
  CUBluetoothDevice *v2;
  CUBluetoothDevice *v3;
  CUBluetoothDevice *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUBluetoothDevice;
  v2 = -[CUBluetoothDevice init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_colorCode = -1;
    v4 = v2;
  }

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  __CFString *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t productIdentifier;
  __CFString *v54;
  uint64_t versionID;
  __CFString *v56;
  uint64_t deviceType;
  __CFString *v58;
  NSString *firmwareVersion;
  NSString *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __CFString *v67;
  uint64_t connectedServices;
  __CFString *v69;
  unsigned int primaryPlacement;
  const char *v71;
  __CFString *v72;
  unsigned int secondaryPlacement;
  const char *v74;
  __CFString *v75;
  unsigned int streamState;
  const char *v77;
  __CFString *v78;
  __CFString *v79;
  __CFString *v80;
  uint64_t colorCode;
  __CFString *v82;
  uint64_t deviceFlags;
  __CFString *v84;
  uint64_t disconnectReason;
  __CFString *v86;
  uint64_t v88;
  CFMutableStringRef v89;
  CFMutableStringRef v90;
  CFMutableStringRef v91;
  CFMutableStringRef v92;
  CFMutableStringRef v93;
  CFMutableStringRef v94;
  CFMutableStringRef v95;
  CFMutableStringRef v96;
  CFMutableStringRef v97;
  CFMutableStringRef v98;
  CFMutableStringRef v99;
  CFMutableStringRef v100;
  CFMutableStringRef v101;
  CFMutableStringRef v102;
  CFMutableStringRef v103;
  CFMutableStringRef v104;
  CFMutableStringRef v105;
  CFMutableStringRef v106;

  v106 = 0;
  -[CUBluetoothDevice addressString](self, "addressString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF(&v106, (uint64_t)"CUBluetoothDevice %@", v4, v5, v6, v7, v8, v9, (uint64_t)v3);
  v10 = v106;

  -[CUBluetoothDevice identifier](self, "identifier");
  v11 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v11;
  if (v11)
  {
    v105 = v10;
    NSAppendPrintF(&v105, (uint64_t)", ID '%@'", v12, v13, v14, v15, v16, v17, v11);
    v19 = v105;

    v10 = v19;
  }

  -[CUBluetoothDevice name](self, "name");
  v20 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v20;
  if (v20)
  {
    v104 = v10;
    NSAppendPrintF(&v104, (uint64_t)", '%@'", v21, v22, v23, v24, v25, v26, v20);
    v28 = v104;

    v10 = v28;
  }

  -[CUBluetoothDevice manufacturer](self, "manufacturer");
  v29 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v29;
  if (v29)
  {
    v103 = v10;
    NSAppendPrintF(&v103, (uint64_t)", Mfg '%@'", v30, v31, v32, v33, v34, v35, v29);
    v37 = v103;

    v10 = v37;
  }

  -[CUBluetoothDevice modelNumber](self, "modelNumber");
  v38 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v38;
  if (v38)
  {
    v102 = v10;
    NSAppendPrintF(&v102, (uint64_t)", Md %@", v39, v40, v41, v42, v43, v44, v38);
    v46 = v102;

    v10 = v46;
  }

  productIdentifier = self->_productIdentifier;
  if ((_DWORD)productIdentifier)
  {
    v101 = v10;
    NSAppendPrintF(&v101, (uint64_t)", PID 0x%X", v47, v48, v49, v50, v51, v52, productIdentifier);
    v54 = v101;

    v10 = v54;
  }
  versionID = self->_versionID;
  if ((_DWORD)versionID)
  {
    v100 = v10;
    NSAppendPrintF(&v100, (uint64_t)", VrI 0x%X", v47, v48, v49, v50, v51, v52, versionID);
    v56 = v100;

    v10 = v56;
  }
  deviceType = self->_deviceType;
  if ((_DWORD)deviceType)
  {
    v99 = v10;
    NSAppendPrintF(&v99, (uint64_t)", DT %d", v47, v48, v49, v50, v51, v52, deviceType);
    v58 = v99;

    v10 = v58;
  }
  firmwareVersion = self->_firmwareVersion;
  if (firmwareVersion)
  {
    v98 = v10;
    v60 = firmwareVersion;
    NSAppendPrintF(&v98, (uint64_t)", FV '%@'", v61, v62, v63, v64, v65, v66, (uint64_t)v60);
    v67 = v98;

    v10 = v67;
  }
  connectedServices = self->_connectedServices;
  if ((_DWORD)connectedServices)
  {
    v97 = v10;
    NSAppendPrintF(&v97, (uint64_t)", CnS 0x%X", v47, v48, v49, v50, v51, v52, connectedServices);
    v69 = v97;

    v10 = v69;
  }
  primaryPlacement = self->_primaryPlacement;
  if (primaryPlacement)
  {
    v96 = v10;
    if (primaryPlacement > 7)
      v71 = "?";
    else
      v71 = off_1E25DC510[primaryPlacement - 1];
    NSAppendPrintF(&v96, (uint64_t)", PriP %s", v47, v48, v49, v50, v51, v52, (uint64_t)v71);
    v72 = v96;

    v10 = v72;
  }
  secondaryPlacement = self->_secondaryPlacement;
  if (secondaryPlacement)
  {
    v95 = v10;
    if (secondaryPlacement > 7)
      v74 = "?";
    else
      v74 = off_1E25DC510[secondaryPlacement - 1];
    NSAppendPrintF(&v95, (uint64_t)", 2ndP %s", v47, v48, v49, v50, v51, v52, (uint64_t)v74);
    v75 = v95;

    v10 = v75;
  }
  streamState = self->_streamState;
  if (streamState)
  {
    v94 = v10;
    if (streamState > 3)
      v77 = "?";
    else
      v77 = off_1E25DC548[streamState - 1];
    NSAppendPrintF(&v94, (uint64_t)", Strm %s", v47, v48, v49, v50, v51, v52, (uint64_t)v77);
    v78 = v94;

    v10 = v78;
  }
  if (self->_magicPaired)
  {
    v93 = v10;
    NSAppendPrintF(&v93, (uint64_t)", MagicPaired", v47, v48, v49, v50, v51, v52, v88);
    v79 = v93;

    v10 = v79;
  }
  if (self->_supportsAACPService)
  {
    v92 = v10;
    NSAppendPrintF(&v92, (uint64_t)", AACP", v47, v48, v49, v50, v51, v52, v88);
    v80 = v92;

    v10 = v80;
  }
  colorCode = self->_colorCode;
  if ((_DWORD)colorCode != -1)
  {
    v91 = v10;
    NSAppendPrintF(&v91, (uint64_t)", Color %d (%s)", v47, v48, v49, v50, v51, v52, colorCode);
    v82 = v91;

    v10 = v82;
  }
  deviceFlags = self->_deviceFlags;
  if ((_DWORD)deviceFlags)
  {
    v90 = v10;
    NSAppendPrintF(&v90, (uint64_t)", DF %#{flags}", v47, v48, v49, v50, v51, v52, deviceFlags);
    v84 = v90;

    v10 = v84;
  }
  disconnectReason = self->_disconnectReason;
  if ((_DWORD)disconnectReason)
  {
    v89 = v10;
    NSAppendPrintF(&v89, (uint64_t)", DR %#m", v47, v48, v49, v50, v51, v52, disconnectReason);
    v86 = v89;

    v10 = v86;
  }
  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CUBluetoothDevice addressString](self, "addressString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CUBluetoothDevice addressString](self, "addressString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addressString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      v10 = 1;
    }
    else if ((v7 == 0) == (v8 != 0))
    {
      v10 = 0;
    }
    else
    {
      v10 = objc_msgSend(v7, "isEqual:", v8);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- ($D91DDCA3822F03E96939068EA8DE741A)address
{
  return ($D91DDCA3822F03E96939068EA8DE741A)(*(unsigned int *)self->_address.bytes | ((unint64_t)*(unsigned __int16 *)&self->_address.bytes[4] << 32));
}

- (void)setAddress:(id)a3
{
  self->_address = ($F37A0EEEFB629DA6F1DB93542131767D)a3;
}

- (NSString)addressString
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAddressString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (unsigned)connectedServices
{
  return self->_connectedServices;
}

- (void)setConnectedServices:(unsigned int)a3
{
  self->_connectedServices = a3;
}

- (int)colorCode
{
  return self->_colorCode;
}

- (void)setColorCode:(int)a3
{
  self->_colorCode = a3;
}

- (unsigned)deviceFlags
{
  return self->_deviceFlags;
}

- (void)setDeviceFlags:(unsigned int)a3
{
  self->_deviceFlags = a3;
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unsigned int)a3
{
  self->_deviceType = a3;
}

- (int)disconnectReason
{
  return self->_disconnectReason;
}

- (void)setDisconnectReason:(int)a3
{
  self->_disconnectReason = a3;
}

- (NSString)firmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFirmwareVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (BOOL)magicPaired
{
  return self->_magicPaired;
}

- (void)setMagicPaired:(BOOL)a3
{
  self->_magicPaired = a3;
}

- (NSString)manufacturer
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setManufacturer:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSString)modelNumber
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setModelNumber:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (int)primaryPlacement
{
  return self->_primaryPlacement;
}

- (void)setPrimaryPlacement:(int)a3
{
  self->_primaryPlacement = a3;
}

- (int)secondaryPlacement
{
  return self->_secondaryPlacement;
}

- (void)setSecondaryPlacement:(int)a3
{
  self->_secondaryPlacement = a3;
}

- (unsigned)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(unsigned int)a3
{
  self->_productIdentifier = a3;
}

- (int)streamState
{
  return self->_streamState;
}

- (void)setStreamState:(int)a3
{
  self->_streamState = a3;
}

- (BOOL)supportsAACPService
{
  return self->_supportsAACPService;
}

- (void)setSupportsAACPService:(BOOL)a3
{
  self->_supportsAACPService = a3;
}

- (unsigned)versionID
{
  return self->_versionID;
}

- (void)setVersionID:(unsigned int)a3
{
  self->_versionID = a3;
}

- (BOOL)present
{
  return self->_present;
}

- (void)setPresent:(BOOL)a3
{
  self->_present = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_addressString, 0);
}

@end
