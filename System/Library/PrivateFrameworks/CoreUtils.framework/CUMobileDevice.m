@implementation CUMobileDevice

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CUMobileDevice;
  -[CUMobileDevice dealloc](&v2, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  NSUUID *identifier;
  NSString *internalModel;
  NSString *name;
  NSString *udid;
  NSString *wifiAddress;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    if (self->_connected)
      *(_BYTE *)(v4 + 8) = 1;
    identifier = self->_identifier;
    if (identifier)
      objc_storeStrong((id *)(v4 + 16), identifier);
    internalModel = self->_internalModel;
    if (internalModel)
      objc_storeStrong((id *)(v5 + 24), internalModel);
    name = self->_name;
    if (name)
      objc_storeStrong((id *)(v5 + 32), name);
    if (self->_paired)
      *(_BYTE *)(v5 + 9) = 1;
    if (self->_placeholder)
      *(_BYTE *)(v5 + 10) = 1;
    udid = self->_udid;
    if (udid)
      objc_storeStrong((id *)(v5 + 40), udid);
    wifiAddress = self->_wifiAddress;
    if (wifiAddress)
      objc_storeStrong((id *)(v5 + 48), wifiAddress);
  }
  return (id)v5;
}

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
  __CFString *v16;
  NSString *udid;
  __CFString *v18;
  NSString *name;
  __CFString *v20;
  NSString *internalModel;
  __CFString *v22;
  NSString *wifiAddress;
  __CFString *v24;
  const char *v25;
  __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __CFString *v33;
  CFMutableStringRef v35;
  CFMutableStringRef v36;
  CFMutableStringRef v37;
  CFMutableStringRef v38;
  CFMutableStringRef v39;
  CFMutableStringRef v40;
  CFMutableStringRef v41;

  v41 = 0;
  NSAppendPrintF(&v41, (uint64_t)"CUMobileDevice ID %@", v2, v3, v4, v5, v6, v7, (uint64_t)self->_identifier);
  v9 = v41;
  v16 = v9;
  udid = self->_udid;
  if (udid)
  {
    v40 = v9;
    NSAppendPrintF(&v40, (uint64_t)", UDID '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)udid);
    v18 = v40;

    v16 = v18;
  }
  name = self->_name;
  if (name)
  {
    v39 = v16;
    NSAppendPrintF(&v39, (uint64_t)", Name '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)name);
    v20 = v39;

    v16 = v20;
  }
  internalModel = self->_internalModel;
  if (internalModel)
  {
    v38 = v16;
    NSAppendPrintF(&v38, (uint64_t)", Model '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)internalModel);
    v22 = v38;

    v16 = v22;
  }
  wifiAddress = self->_wifiAddress;
  if (wifiAddress)
  {
    v37 = v16;
    NSAppendPrintF(&v37, (uint64_t)", WiFi '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)wifiAddress);
    v24 = v37;

    v16 = v24;
  }
  v36 = v16;
  if (self->_paired)
    v25 = "yes";
  else
    v25 = "no";
  NSAppendPrintF(&v36, (uint64_t)", Paired %s", v10, v11, v12, v13, v14, v15, (uint64_t)v25);
  v26 = v36;

  if (self->_placeholder)
  {
    v35 = v26;
    NSAppendPrintF(&v35, (uint64_t)", Placeholder %s", v27, v28, v29, v30, v31, v32, (uint64_t)"yes");
    v33 = v35;

    v26 = v33;
  }
  return v26;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)internalModel
{
  return self->_internalModel;
}

- (void)setInternalModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)paired
{
  return self->_paired;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (BOOL)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (NSString)udid
{
  return self->_udid;
}

- (void)setUdid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)wifiAddress
{
  return self->_wifiAddress;
}

- (void)setWifiAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiAddress, 0);
  objc_storeStrong((id *)&self->_udid, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_internalModel, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
