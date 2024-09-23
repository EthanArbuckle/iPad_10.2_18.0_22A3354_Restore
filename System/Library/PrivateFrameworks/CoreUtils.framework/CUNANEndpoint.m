@implementation CUNANEndpoint

- (CUNANEndpoint)initWithEndpointID:(const char *)a3 error:(id *)a4
{
  CUNANEndpoint *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  WiFiMACAddress *macAddress;
  CUNANEndpoint *v15;
  unsigned __int8 v17;
  unsigned int v18;
  unsigned __int16 v19;

  v6 = -[CUNANEndpoint init](self, "init");
  if (!v6)
    goto LABEL_6;
  v19 = 0;
  v18 = 0;
  v17 = 0;
  if (sscanf(a3, "%hhx:%hhx:%hhx:%hhx:%hhx:%hhx-%hhu", &v18, (char *)&v18 + 1, (char *)&v18 + 2, (char *)&v18 + 3, &v19, (char *)&v19 + 1, &v17) != 7)
  {
    if (a4)
    {
      NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960591, (uint64_t)"Bad peer ID: '%s'", v7, v8, v9, v10, v11, (uint64_t)a3);
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v15 = 0;
    goto LABEL_7;
  }
  v6->_instanceID = v17;
  v12 = objc_alloc((Class)getWiFiMACAddressClass[0]());
  v13 = objc_msgSend(v12, "initWithAddress:", v18 | ((unint64_t)v19 << 32));
  macAddress = v6->_macAddress;
  v6->_macAddress = (WiFiMACAddress *)v13;

  v15 = v6;
LABEL_7:

  return v15;
}

- (id)description
{
  return -[CUNANEndpoint descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  NSString *identifier;
  CFMutableStringRef *v19;
  WiFiMACAddress *macAddress;
  __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSString *serviceType;
  __CFString *v29;
  NSString *name;
  __CFString *v31;
  uint64_t port;
  __CFString *v33;
  NSData *customData;
  __CFString *v35;
  __CFString *v36;
  WiFiAwareDiscoveryResult *discoveryResult;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __CFString *v46;
  __CFString *v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  CFMutableStringRef v52;
  CFMutableStringRef v53;
  CFMutableStringRef v54;
  CFMutableStringRef v55;
  CFMutableStringRef v56;
  CFMutableStringRef v57;
  CFMutableStringRef v58;
  CFMutableStringRef v59;
  CFMutableStringRef v60;
  CFMutableStringRef v61;
  CFMutableStringRef v62;

  v62 = 0;
  NSAppendPrintF(&v62, (uint64_t)"CUNANEndpoint ", *(uint64_t *)&a3, v3, v4, v5, v6, v7, v49);
  v10 = v62;
  v17 = v10;
  identifier = self->_identifier;
  if (identifier)
  {
    v61 = v10;
    v19 = &v61;
    NSAppendPrintF(&v61, (uint64_t)"%@", v11, v12, v13, v14, v15, v16, (uint64_t)identifier);
  }
  else
  {
    macAddress = self->_macAddress;
    if (macAddress)
    {
      v60 = v10;
      v19 = &v60;
      NSAppendPrintF(&v60, (uint64_t)"%@-%u", v11, v12, v13, v14, v15, v16, (uint64_t)macAddress);
    }
    else
    {
      v59 = v10;
      v19 = &v59;
      NSAppendPrintF(&v59, (uint64_t)"?", v11, v12, v13, v14, v15, v16, v50);
    }
  }
  v21 = *v19;

  serviceType = self->_serviceType;
  if (serviceType)
  {
    v58 = v21;
    NSAppendPrintF(&v58, (uint64_t)", Sv '%@'", v22, v23, v24, v25, v26, v27, (uint64_t)serviceType);
    v29 = v58;

    v21 = v29;
  }
  name = self->_name;
  if (name)
  {
    v57 = v21;
    NSAppendPrintF(&v57, (uint64_t)", Nm '%@'", v22, v23, v24, v25, v26, v27, (uint64_t)name);
    v31 = v57;

    v21 = v31;
  }
  port = self->_port;
  if ((_DWORD)port)
  {
    v56 = v21;
    NSAppendPrintF(&v56, (uint64_t)", Pt %d", v22, v23, v24, v25, v26, v27, port);
    v33 = v56;

    v21 = v33;
  }
  customData = self->_customData;
  if (customData)
  {
    v55 = v21;
    NSAppendPrintF(&v55, (uint64_t)", CD %@", v22, v23, v24, v25, v26, v27, (uint64_t)customData);
    v35 = v55;

    v21 = v35;
  }
  if (a3 <= 30 && -[NSDictionary count](self->_textInfo, "count"))
  {
    v54 = v21;
    NSAppendPrintF(&v54, (uint64_t)", TI %##@", v22, v23, v24, v25, v26, v27, (uint64_t)self->_textInfo);
    v36 = v54;

    v21 = v36;
  }
  discoveryResult = self->_discoveryResult;
  if (discoveryResult)
  {
    v53 = v21;
    v38 = -[WiFiAwareDiscoveryResult datapathSupported](discoveryResult, "datapathSupported");
    -[WiFiAwareDiscoveryResult datapathSecurityRequired](self->_discoveryResult, "datapathSecurityRequired");
    v45 = 100;
    if (v38)
      v45 = 68;
    NSAppendPrintF(&v53, (uint64_t)", Fl <%c%c>", v39, v40, v41, v42, v43, v44, v45);
    v46 = v53;

    v21 = v46;
  }
  if (a3 <= 20)
  {
    v52 = v21;
    NSAppendPrintF(&v52, (uint64_t)"\n", v22, v23, v24, v25, v26, v27, v51);
    v47 = v52;

    v21 = v47;
  }
  return v21;
}

- (unsigned)updateWithDiscoveryResult:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSData *customData;
  NSData *v9;
  NSData *v10;
  NSData *v11;
  char v12;
  unsigned int v13;
  NSData *v14;
  NSData *v15;
  void *v16;
  void *v17;
  NSString *v18;
  NSString *identifier;
  void *v20;
  void *v21;
  NSString *name;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  char v26;
  uint64_t v27;
  void *v28;
  NSString *serviceType;
  NSString *v30;
  NSString *v31;
  NSString *v32;
  char v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  NSDictionary **p_textInfo;
  NSDictionary *textInfo;
  NSDictionary *v41;
  NSDictionary *v42;
  NSDictionary *v43;
  char v45;
  void *v46;

  v5 = a3;
  objc_storeStrong((id *)&self->_discoveryResult, a3);
  objc_msgSend(v5, "serviceSpecificInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "blob");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  customData = self->_customData;
  v9 = v7;
  v10 = customData;
  if (v9 == v10)
  {

    v13 = 0;
    v14 = v9;
LABEL_8:

    goto LABEL_9;
  }
  v11 = v10;
  if ((v9 == 0) == (v10 != 0))
  {

    goto LABEL_7;
  }
  v12 = -[NSData isEqual:](v9, "isEqual:", v10);

  if ((v12 & 1) == 0)
  {
LABEL_7:
    v15 = v9;
    v14 = self->_customData;
    self->_customData = v15;
    v13 = 1;
    goto LABEL_8;
  }
  v13 = 0;
LABEL_9:
  if (!self->_identifier)
  {
    objc_msgSend(v5, "publisherAddress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "publishID");
    _WiFiAwareCreateEndpointIdentifier(v17);
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    self->_identifier = v18;

    if (self->_identifier)
      v13 = 1;
  }
  objc_msgSend(v6, "instanceName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    name = self->_name;
    v23 = v20;
    v24 = name;
    if (v23 == v24)
    {

      goto LABEL_20;
    }
    v25 = v24;
    if (v24)
    {
      v26 = -[NSString isEqual:](v23, "isEqual:", v24);

      if ((v26 & 1) != 0)
        goto LABEL_20;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_name, v21);
    v13 |= 2u;
  }
LABEL_20:
  v27 = objc_msgSend(v5, "rssi");
  v46 = v6;
  if (v27 != self->_rssi)
  {
    self->_rssi = v27;
    v13 |= 0x10u;
  }
  objc_msgSend(v5, "serviceName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  serviceType = self->_serviceType;
  v30 = v28;
  v31 = serviceType;
  if (v30 == v31)
  {

    goto LABEL_29;
  }
  v32 = v31;
  if ((v30 == 0) == (v31 != 0))
  {

    v6 = v46;
    goto LABEL_28;
  }
  v33 = -[NSString isEqual:](v30, "isEqual:", v31);

  v6 = v46;
  if ((v33 & 1) == 0)
  {
LABEL_28:
    objc_storeStrong((id *)&self->_serviceType, v28);
    v13 |= 1u;
  }
LABEL_29:
  objc_msgSend(v6, "txtRecordData");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v34;
  if (v34)
  {
    v37 = (void *)CUTXTDictionaryCreateWithTXTData(v34, v35, 0);
    v38 = v37;
    if (!v37)
    {
LABEL_39:

      goto LABEL_40;
    }
    textInfo = self->_textInfo;
    p_textInfo = &self->_textInfo;
    v41 = v37;
    v42 = textInfo;
    if (v41 == v42)
    {

    }
    else
    {
      v43 = v42;
      if (v42)
      {
        v45 = -[NSDictionary isEqual:](v41, "isEqual:", v42);

        if ((v45 & 1) != 0)
          goto LABEL_38;
      }
      else
      {

      }
      objc_storeStrong((id *)p_textInfo, v38);
      v13 |= 8u;
    }
LABEL_38:
    v6 = v46;
    goto LABEL_39;
  }
LABEL_40:

  return v13;
}

- (NSData)customData
{
  return self->_customData;
}

- (void)setCustomData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)mockPeerEndpointString
{
  return self->_mockPeerEndpointString;
}

- (void)setMockPeerEndpointString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int)port
{
  return self->_port;
}

- (void)setPort:(int)a3
{
  self->_port = a3;
}

- (int)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int)a3
{
  self->_rssi = a3;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)textInfo
{
  return self->_textInfo;
}

- (void)setTextInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (WiFiAwareDiscoveryResult)discoveryResult
{
  return self->_discoveryResult;
}

- (void)setDiscoveryResult:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryResult, a3);
}

- (unsigned)instanceID
{
  return self->_instanceID;
}

- (void)setInstanceID:(unsigned __int8)a3
{
  self->_instanceID = a3;
}

- (WiFiMACAddress)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
  objc_storeStrong((id *)&self->_macAddress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_discoveryResult, 0);
  objc_storeStrong((id *)&self->_textInfo, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mockPeerEndpointString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_customData, 0);
}

@end
