@implementation CUWiFiDevice

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __CFString *v23;
  NSString *ssid;
  __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __CFString *v40;
  uint64_t deviceIEFlags;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __CFString *v48;
  CFMutableStringRef v50;
  CFMutableStringRef v51;
  CFMutableStringRef v52;
  CFMutableStringRef v53;
  CFMutableStringRef v54;
  CFMutableStringRef v55;

  v55 = 0;
  NSAppendPrintF(&v55, (uint64_t)"CUWiFiDevice %{ptr}", v2, v3, v4, v5, v6, v7, (uint64_t)self);
  v9 = v55;
  if (-[NSData length](self->_bssid, "length") == 6)
  {
    v54 = v9;
    v16 = -[NSData bytes](self->_bssid, "bytes");
    NSAppendPrintF(&v54, (uint64_t)", BSSID %.6a", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
    v23 = v54;

    v9 = v23;
  }
  ssid = self->_ssid;
  if (ssid)
  {
    v53 = v9;
    NSAppendPrintF(&v53, (uint64_t)", SSID '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)ssid);
    v25 = v53;

    v9 = v25;
  }
  v52 = v9;
  v26 = -[NSData length](self->_ieData, "length");
  NSAppendPrintF(&v52, (uint64_t)", IE %ld bytes", v27, v28, v29, v30, v31, v32, v26);
  v33 = v52;

  v51 = v33;
  NSAppendPrintF(&v51, (uint64_t)", RSSI %d", v34, v35, v36, v37, v38, v39, self->_rssi);
  v40 = v51;

  deviceIEFlags = self->_deviceIEFlags;
  v50 = v40;
  NSAppendPrintF(&v50, (uint64_t)", %#{flags}", v42, v43, v44, v45, v46, v47, deviceIEFlags);
  v48 = v50;

  return v48;
}

- (unsigned)_updateWithDeviceIE:(const char *)a3 end:(const char *)a4
{
  unsigned __int8 *v5;
  const char *v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  void *v11;
  NSData *deviceIEBluetoothMAC;
  NSData *v13;
  NSData *v14;
  NSData *v15;
  char v16;
  NSData *v17;
  NSData *v18;
  unsigned int UInt64;
  unint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  NSData *deviceIEDeviceID;
  NSData *v25;
  NSData *v26;
  NSData *v27;
  char v28;
  NSData *v29;
  NSData *v30;
  unint64_t v31;
  unsigned int v32;
  char *v33;
  unint64_t v34;
  int v35;
  int v36;
  unsigned int v37;
  int v38;
  int v39;
  char v40;
  int v41;
  int v42;
  int v43;
  int v44;
  char v45;
  int v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  int v50;
  void *v51;
  void *v52;
  NSString *deviceIEManufacturer;
  NSString *v54;
  NSString *v55;
  NSString *v56;
  char v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  int v61;
  void *v62;
  void *v63;
  NSString *deviceIEModel;
  NSString *v65;
  NSString *v66;
  NSString *v67;
  char v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  int v72;
  void *v73;
  void *v74;
  NSString *deviceIEName;
  NSString *v76;
  NSString *v77;
  NSString *v78;
  char v79;
  unint64_t v80;
  uint64_t v81;
  int v82;
  void *v83;
  NSData *deviceIDOUI;
  NSData *v85;
  NSData *v86;
  NSData *v87;
  char v88;
  NSData *v89;
  NSData *v90;
  uint64_t v91;
  int v92;
  void *v93;
  NSData *deviceIDSetupHash;
  NSData *v95;
  NSData *v96;
  NSData *v97;
  char v98;
  NSData *v99;
  NSData *v100;

  v5 = (unsigned __int8 *)a3;
  v7 = a3;
  while (1)
  {
    v8 = 0;
    if (a4 <= v7 || (unint64_t)(a4 - v7) < 2)
      break;
    v9 = *((unsigned __int8 *)v7 + 1);
    if (&v7[v9 + 2] > a4)
      goto LABEL_11;
    v10 = *(unsigned __int8 *)v7;
    v7 += v9 + 2;
    if (v10 == 6)
    {
      if (v9 != 6)
      {
LABEL_11:
        v8 = 0;
        break;
      }
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      deviceIEBluetoothMAC = self->_deviceIEBluetoothMAC;
      v13 = v11;
      v14 = deviceIEBluetoothMAC;
      if (v13 == v14)
      {

        v8 = 0;
        v17 = v13;
      }
      else
      {
        v15 = v14;
        if ((v13 == 0) != (v14 != 0))
        {
          v16 = -[NSData isEqual:](v13, "isEqual:", v14);

          if ((v16 & 1) != 0)
          {
            v8 = 0;
LABEL_16:

            break;
          }
        }
        else
        {

        }
        v18 = v13;
        v17 = self->_deviceIEBluetoothMAC;
        self->_deviceIEBluetoothMAC = v18;
        v8 = 1;
      }

      goto LABEL_16;
    }
  }
  UInt64 = TLV8GetUInt64(v5, (unsigned __int8 *)a4, 8, 0, 0);
  if (self->_deviceIECategory != UInt64)
  {
    self->_deviceIECategory = UInt64;
    v8 = 1;
  }
  v20 = (unint64_t)v5;
  while ((unint64_t)a4 > v20)
  {
    if ((unint64_t)&a4[-v20] < 2)
      break;
    v21 = *(unsigned __int8 *)(v20 + 1);
    if (v20 + 2 + v21 > (unint64_t)a4)
      break;
    v22 = *(unsigned __int8 *)v20;
    v20 += 2 + v21;
    if (v22 == 7)
    {
      if (v21 != 6)
        break;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      deviceIEDeviceID = self->_deviceIEDeviceID;
      v25 = v23;
      v26 = deviceIEDeviceID;
      if (v25 == v26)
      {

        v29 = v25;
      }
      else
      {
        v27 = v26;
        if ((v25 == 0) != (v26 != 0))
        {
          v28 = -[NSData isEqual:](v25, "isEqual:", v26);

          if ((v28 & 1) != 0)
            goto LABEL_33;
        }
        else
        {

        }
        v30 = v25;
        v29 = self->_deviceIEDeviceID;
        self->_deviceIEDeviceID = v30;
        v8 = 1;
      }

LABEL_33:
      break;
    }
  }
  v31 = (unint64_t)v5;
  do
  {
    v32 = 0;
    if ((unint64_t)a4 <= v31 || (unint64_t)&a4[-v31] < 2)
      goto LABEL_59;
    v33 = (char *)(v31 + 2);
    v34 = *(unsigned __int8 *)(v31 + 1);
    if (v31 + 2 + v34 > (unint64_t)a4)
      goto LABEL_53;
    v35 = *(unsigned __int8 *)v31;
    v31 += 2 + v34;
  }
  while (v35);
  if (v34 <= 1)
  {
    if (v34)
    {
      v39 = (*v33 < 0) << 31;
      goto LABEL_48;
    }
LABEL_53:
    v32 = 0;
  }
  else
  {
    v36 = v33[1];
    v37 = (v36 & 3) << 16;
    if (*v33 < 0)
      v37 = ((v36 & 3) << 16) | 0x80000000;
    v38 = v37 | 0x800000;
    if (v36 >= 0)
      v38 = v37;
    if (v34 == 2)
    {
      v39 = v38 | ((v36 & 0x60) << 16);
LABEL_48:
      v32 = v39 | ((*v33 & 0x60) << 24);
      goto LABEL_59;
    }
    v40 = v33[2];
    v41 = ((v36 & 0x20) << 16) | ((((v40 & 0x70) >> 4) & 7) << 12) | v38;
    v42 = (v36 & 0x40) << 16;
    if (v34 < 4)
    {
      v43 = v42 | v41;
    }
    else
    {
      v43 = v42 | v33[3] & 0x40 | v41;
      if (v33[3] < 0)
        v43 |= 0x80u;
    }
    v44 = v43 | ((v40 & 1) << 8) | ((*v33 & 0x20) << 24);
    v45 = v33[2];
    v46 = v44 | ((v45 & 6) << 8);
    if (v34 != 3)
      v46 |= v33[3] & 0x20;
    v32 = v46 | ((v45 & 8) << 8) | ((*v33 & 0x40) << 24);
    if (v34 >= 4)
      v32 |= v33[3] & 0x10;
  }
LABEL_59:
  if (v32 != self->_deviceIEFlags)
  {
    self->_deviceIEFlags = v32;
    v8 = 1;
  }
  v47 = (unint64_t)v5;
  while ((unint64_t)a4 > v47)
  {
    if ((unint64_t)&a4[-v47] < 2)
      break;
    v48 = v47 + 2;
    v49 = *(unsigned __int8 *)(v47 + 1);
    if (v47 + 2 + v49 > (unint64_t)a4)
      break;
    v50 = *(unsigned __int8 *)v47;
    v47 += 2 + v49;
    if (v50 == 2)
    {
      if (!v49)
        break;
      v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v48, v49, 4);
      v52 = v51;
      if (!v51)
        goto LABEL_75;
      deviceIEManufacturer = self->_deviceIEManufacturer;
      v54 = v51;
      v55 = deviceIEManufacturer;
      if (v54 == v55)
      {

      }
      else
      {
        v56 = v55;
        if (v55)
        {
          v57 = -[NSString isEqual:](v54, "isEqual:", v55);

          if ((v57 & 1) != 0)
            goto LABEL_75;
        }
        else
        {

        }
        objc_storeStrong((id *)&self->_deviceIEManufacturer, v52);
        v8 = 1;
      }
LABEL_75:

      break;
    }
  }
  v58 = (unint64_t)v5;
  while ((unint64_t)a4 > v58)
  {
    if ((unint64_t)&a4[-v58] < 2)
      break;
    v59 = v58 + 2;
    v60 = *(unsigned __int8 *)(v58 + 1);
    if (v58 + 2 + v60 > (unint64_t)a4)
      break;
    v61 = *(unsigned __int8 *)v58;
    v58 += 2 + v60;
    if (v61 == 3)
    {
      if (!v60)
        break;
      v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v59, v60, 4);
      v63 = v62;
      if (!v62)
        goto LABEL_90;
      deviceIEModel = self->_deviceIEModel;
      v65 = v62;
      v66 = deviceIEModel;
      if (v65 == v66)
      {

      }
      else
      {
        v67 = v66;
        if (v66)
        {
          v68 = -[NSString isEqual:](v65, "isEqual:", v66);

          if ((v68 & 1) != 0)
            goto LABEL_90;
        }
        else
        {

        }
        objc_storeStrong((id *)&self->_deviceIEModel, v63);
        v8 = 1;
      }
LABEL_90:

      break;
    }
  }
  v69 = (unint64_t)v5;
  while ((unint64_t)a4 > v69)
  {
    if ((unint64_t)&a4[-v69] < 2)
      break;
    v70 = v69 + 2;
    v71 = *(unsigned __int8 *)(v69 + 1);
    if (v69 + 2 + v71 > (unint64_t)a4)
      break;
    v72 = *(unsigned __int8 *)v69;
    v69 += 2 + v71;
    if (v72 == 1)
    {
      if (!v71)
        break;
      v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v70, v71, 4);
      v74 = v73;
      if (!v73)
        goto LABEL_105;
      deviceIEName = self->_deviceIEName;
      v76 = v73;
      v77 = deviceIEName;
      if (v76 == v77)
      {

      }
      else
      {
        v78 = v77;
        if (v77)
        {
          v79 = -[NSString isEqual:](v76, "isEqual:", v77);

          if ((v79 & 1) != 0)
            goto LABEL_105;
        }
        else
        {

        }
        objc_storeStrong((id *)&self->_deviceIEName, v74);
        v8 = 1;
      }
LABEL_105:

      break;
    }
  }
  v80 = (unint64_t)v5;
  while ((unint64_t)a4 > v80)
  {
    if ((unint64_t)&a4[-v80] < 2)
      break;
    v81 = *(unsigned __int8 *)(v80 + 1);
    if (v80 + 2 + v81 > (unint64_t)a4)
      break;
    v82 = *(unsigned __int8 *)v80;
    v80 += 2 + v81;
    if (v82 == 4)
    {
      if ((_DWORD)v81 != 3)
        break;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      deviceIDOUI = self->_deviceIDOUI;
      v85 = v83;
      v86 = deviceIDOUI;
      if (v85 == v86)
      {

        v89 = v85;
      }
      else
      {
        v87 = v86;
        if ((v85 == 0) != (v86 != 0))
        {
          v88 = -[NSData isEqual:](v85, "isEqual:", v86);

          if ((v88 & 1) != 0)
            goto LABEL_120;
        }
        else
        {

        }
        v90 = v85;
        v89 = self->_deviceIDOUI;
        self->_deviceIDOUI = v90;
        v8 = 1;
      }

LABEL_120:
      break;
    }
  }
  while (a4 > (const char *)v5)
  {
    if ((unint64_t)(a4 - (const char *)v5) < 2)
      break;
    v91 = v5[1];
    if (&v5[v91 + 2] > (unsigned __int8 *)a4)
      break;
    v92 = *v5;
    v5 += v91 + 2;
    if (v92 == 9)
    {
      if ((_DWORD)v91 != 4)
        return v8;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      deviceIDSetupHash = self->_deviceIDSetupHash;
      v95 = v93;
      v96 = deviceIDSetupHash;
      if (v95 == v96)
      {

        v99 = v95;
      }
      else
      {
        v97 = v96;
        if ((v95 == 0) != (v96 != 0))
        {
          v98 = -[NSData isEqual:](v95, "isEqual:", v96);

          if ((v98 & 1) != 0)
            goto LABEL_134;
        }
        else
        {

        }
        v100 = v95;
        v99 = self->_deviceIDSetupHash;
        self->_deviceIDSetupHash = v100;
        v8 = 1;
      }

LABEL_134:
      return v8;
    }
  }
  return v8;
}

- (NSData)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)deviceIEBluetoothMAC
{
  return self->_deviceIEBluetoothMAC;
}

- (void)setDeviceIEBluetoothMAC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unsigned)deviceIECategory
{
  return self->_deviceIECategory;
}

- (void)setDeviceIECategory:(unsigned int)a3
{
  self->_deviceIECategory = a3;
}

- (NSData)deviceIEDeviceID
{
  return self->_deviceIEDeviceID;
}

- (void)setDeviceIEDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unsigned)deviceIEFlags
{
  return self->_deviceIEFlags;
}

- (void)setDeviceIEFlags:(unsigned int)a3
{
  self->_deviceIEFlags = a3;
}

- (NSString)deviceIEManufacturer
{
  return self->_deviceIEManufacturer;
}

- (void)setDeviceIEManufacturer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)deviceIEModel
{
  return self->_deviceIEModel;
}

- (void)setDeviceIEModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)deviceIEName
{
  return self->_deviceIEName;
}

- (void)setDeviceIEName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSData)deviceIDOUI
{
  return self->_deviceIDOUI;
}

- (void)setDeviceIDOUI:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)deviceIDSetupHash
{
  return self->_deviceIDSetupHash;
}

- (void)setDeviceIDSetupHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSData)ieData
{
  return self->_ieData;
}

- (void)setIeData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)platformObject
{
  return self->_platformObject;
}

- (void)setPlatformObject:(id)a3
{
  objc_storeStrong(&self->_platformObject, a3);
}

- (NSDictionary)rawScanResult
{
  return self->_rawScanResult;
}

- (void)setRawScanResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int)a3
{
  self->_rssi = a3;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (int)present
{
  return self->_present;
}

- (void)setPresent:(int)a3
{
  self->_present = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_rawScanResult, 0);
  objc_storeStrong(&self->_platformObject, 0);
  objc_storeStrong((id *)&self->_ieData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_deviceIDSetupHash, 0);
  objc_storeStrong((id *)&self->_deviceIDOUI, 0);
  objc_storeStrong((id *)&self->_deviceIEName, 0);
  objc_storeStrong((id *)&self->_deviceIEModel, 0);
  objc_storeStrong((id *)&self->_deviceIEManufacturer, 0);
  objc_storeStrong((id *)&self->_deviceIEDeviceID, 0);
  objc_storeStrong((id *)&self->_deviceIEBluetoothMAC, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
}

@end
