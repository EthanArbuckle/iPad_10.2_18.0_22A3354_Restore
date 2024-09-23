@implementation DAEndpoint

- (DAEndpoint)initWithPersistentDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  DAEndpoint *v7;
  uint64_t v8;
  NSString *airplayDeviceID;
  uint64_t v10;
  NSString *bonjourHostname;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *ipv4String;
  uint64_t v16;
  NSString *name;
  uint64_t v18;
  NSString *protocolTypeString;
  DAEndpoint *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  objc_super v29;

  v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)DAEndpoint;
  v7 = -[DAEndpoint init](&v29, sel_init);
  if (v7)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v8 = objc_claimAutoreleasedReturnValue();
    airplayDeviceID = v7->_airplayDeviceID;
    v7->_airplayDeviceID = (NSString *)v8;

    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v10 = objc_claimAutoreleasedReturnValue();
    bonjourHostname = v7->_bonjourHostname;
    v7->_bonjourHostname = (NSString *)v10;

    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v12;

    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v14 = objc_claimAutoreleasedReturnValue();
    ipv4String = v7->_ipv4String;
    v7->_ipv4String = (NSString *)v14;

    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v16 = objc_claimAutoreleasedReturnValue();
    name = v7->_name;
    v7->_name = (NSString *)v16;

    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v18 = objc_claimAutoreleasedReturnValue();
    protocolTypeString = v7->_protocolTypeString;
    v7->_protocolTypeString = (NSString *)v18;

    v20 = v7;
  }
  else if (a4)
  {
    v22 = objc_opt_class();
    DAErrorF(350001, (uint64_t)"%@ super init failed", v23, v24, v25, v26, v27, v28, v22);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (NSDictionary)persistentDictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *airplayDeviceID;
  NSString *bonjourHostname;
  NSString *identifier;
  NSString *ipv4String;
  NSString *name;
  NSString *protocolTypeString;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = v3;
  airplayDeviceID = self->_airplayDeviceID;
  if (airplayDeviceID)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", airplayDeviceID, CFSTR("airplayDeviceID"));
  bonjourHostname = self->_bonjourHostname;
  if (bonjourHostname)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", bonjourHostname, CFSTR("bonjourHostname"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", identifier, CFSTR("identifier"));
  ipv4String = self->_ipv4String;
  if (ipv4String)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", ipv4String, CFSTR("ipv4String"));
  name = self->_name;
  if (name)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", name, CFSTR("name"));
  protocolTypeString = self->_protocolTypeString;
  if (protocolTypeString)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", protocolTypeString, CFSTR("protocolType"));
  v11 = (void *)objc_msgSend(v4, "copy");

  return (NSDictionary *)v11;
}

- (id)description
{
  return -[DAEndpoint descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  __CFString *v4;
  NSString *identifier;
  __CFString *v6;
  NSString *name;
  __CFString *v8;
  NSString *protocolTypeString;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  NSString *airplayDeviceID;
  __CFString *v14;
  NSString *bonjourFullName;
  __CFString *v16;
  NSString *bonjourHostname;
  __CFString *v18;
  NSString *bonjourName;
  __CFString *v20;
  NSString *bonjourType;
  __CFString *v22;
  __CFString *v23;
  NSString *ipv4String;
  NSString *v25;
  __CFString *v26;
  DADevice *underlyingDADevice;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  NSString *v32;
  NSString *v33;
  NSString *v34;
  NSString *v35;
  NSString *v36;
  NSString *v37;
  NSString *v38;
  NSString *v39;
  void *v40;
  DADevice *v41;

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
  identifier = self->_identifier;
  if (identifier)
  {
    v32 = identifier;
    CUAppendF();
    v6 = v4;

    v4 = v6;
  }
  name = self->_name;
  if (name)
  {
    v33 = name;
    CUAppendF();
    v8 = v4;

    v4 = v8;
  }
  protocolTypeString = self->_protocolTypeString;
  if (protocolTypeString)
  {
    v34 = protocolTypeString;
    CUAppendF();
    v10 = v4;

    v4 = v10;
  }
  if (self->_selected)
  {
    CUAppendF();
    v11 = v4;

    v4 = v11;
  }
  if (self->_missing)
  {
    CUAppendF();
    v12 = v4;

    v4 = v12;
  }
  airplayDeviceID = self->_airplayDeviceID;
  if (airplayDeviceID)
  {
    v35 = airplayDeviceID;
    CUAppendF();
    v14 = v4;

    v4 = v14;
  }
  bonjourFullName = self->_bonjourFullName;
  if (bonjourFullName)
  {
    v36 = bonjourFullName;
    CUAppendF();
    v16 = v4;

    v4 = v16;
  }
  bonjourHostname = self->_bonjourHostname;
  if (bonjourHostname)
  {
    v37 = bonjourHostname;
    CUAppendF();
    v18 = v4;

    v4 = v18;
  }
  bonjourName = self->_bonjourName;
  if (bonjourName)
  {
    v38 = bonjourName;
    CUAppendF();
    v20 = v4;

    v4 = v20;
  }
  bonjourType = self->_bonjourType;
  if (bonjourType)
  {
    v39 = bonjourType;
    CUAppendF();
    v22 = v4;

    v4 = v22;
  }
  if (self->_bonjourInterfaceIndex)
  {
    CUAppendF();
    v23 = v4;

    v4 = v23;
  }
  ipv4String = self->_ipv4String;
  if (ipv4String)
  {
    v25 = ipv4String;
    CUPrintNSObjectOneLine();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v26 = v4;

    v4 = v26;
  }
  underlyingDADevice = self->_underlyingDADevice;
  if (underlyingDADevice)
  {
    v41 = underlyingDADevice;
    CUAppendF();
    v28 = v4;

    v4 = v28;
  }
  v29 = &stru_24D169BB8;
  if (v4)
    v29 = v4;
  v30 = v29;

  return v30;
}

- (BOOL)matchesSelectedEndpoint:(id)a3 allowName:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSString *protocolTypeString;
  NSString *airplayDeviceID;
  void *v10;
  NSString *bonjourHostname;
  void *v12;
  void *v14;
  NSString *name;
  void *v16;

  v4 = a4;
  v6 = a3;
  protocolTypeString = self->_protocolTypeString;
  objc_msgSend(v6, "protocolTypeString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(protocolTypeString) = -[NSString isEqual:](protocolTypeString, "isEqual:", v7);

  if ((_DWORD)protocolTypeString)
  {
    airplayDeviceID = self->_airplayDeviceID;
    objc_msgSend(v6, "airplayDeviceID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(airplayDeviceID) = -[NSString isEqual:](airplayDeviceID, "isEqual:", v10);

    if ((airplayDeviceID & 1) != 0
      || (bonjourHostname = self->_bonjourHostname,
          objc_msgSend(v6, "bonjourHostname"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          LOBYTE(bonjourHostname) = -[NSString isEqual:](bonjourHostname, "isEqual:", v12),
          v12,
          (bonjourHostname & 1) != 0))
    {
      LOBYTE(protocolTypeString) = 1;
    }
    else
    {
      protocolTypeString = self->_ipv4String;
      objc_msgSend(v6, "ipv4String");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(protocolTypeString) = -[NSString isEqual:](protocolTypeString, "isEqual:", v14);

      if ((protocolTypeString & 1) == 0 && v4)
      {
        name = self->_name;
        objc_msgSend(v6, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(protocolTypeString) = -[NSString isEqual:](name, "isEqual:", v16);

      }
    }
  }

  return (char)protocolTypeString;
}

- (void)mergeMissingInfoFromEndpoint:(id)a3
{
  void *v4;
  NSString **p_airplayDeviceID;
  NSString *airplayDeviceID;
  void *v7;

  objc_msgSend(a3, "airplayDeviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    airplayDeviceID = self->_airplayDeviceID;
    p_airplayDeviceID = &self->_airplayDeviceID;
    if (!airplayDeviceID)
    {
      v7 = v4;
      objc_storeStrong((id *)p_airplayDeviceID, v4);
      v4 = v7;
    }
  }

}

- (BOOL)sameDeviceAsEndpoint:(id)a3
{
  id v4;
  NSString *airplayDeviceID;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  NSString *v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  airplayDeviceID = self->_airplayDeviceID;
  objc_msgSend(v4, "airplayDeviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(airplayDeviceID) = -[NSString isEqual:](airplayDeviceID, "isEqual:", v6);

  if ((airplayDeviceID & 1) != 0)
  {
    v7 = 1;
  }
  else if (self->_protocolTypeString
         && (objc_msgSend(v4, "protocolTypeString"),
             v8 = (void *)objc_claimAutoreleasedReturnValue(),
             v8,
             v8)
         && (objc_msgSend(v4, "protocolTypeString"),
             v9 = (void *)objc_claimAutoreleasedReturnValue(),
             v10 = -[NSString isEqualToString:](self->_protocolTypeString, "isEqualToString:", v9),
             v9,
             v10))
  {
    v7 = 0;
  }
  else
  {
    v11 = self->_bonjourHostname;
    objc_msgSend(v4, "bonjourHostname");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11 && v12 && -[NSString caseInsensitiveCompare:](v11, "caseInsensitiveCompare:", v12) == NSOrderedSame)
    {
      v7 = 1;
    }
    else
    {
      v14 = self->_ipv4String;
      objc_msgSend(v4, "ipv4String");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      v7 = v14 && v15 && -[NSString caseInsensitiveCompare:](v14, "caseInsensitiveCompare:", v15) == NSOrderedSame;

    }
  }

  return v7;
}

- (void)updateWithEndpoint:(id)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  NSString *airplayDeviceID;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *bonjourFullName;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *bonjourHostname;
  void *v16;
  void *v17;
  NSString *v18;
  NSString *bonjourName;
  void *v20;
  void *v21;
  NSString *v22;
  NSString *bonjourType;
  void *v24;
  void *v25;
  NSString *v26;
  NSString *identifier;
  void *v28;
  void *v29;
  NSString *v30;
  NSString *ipv4String;
  void *v32;
  void *v33;
  NSString *v34;
  NSString *name;
  void *v36;
  void *v37;
  void *v38;
  NSString *v39;
  NSString *protocolTypeString;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSDictionary *v45;
  NSDictionary *userInfo;
  void *v47;
  void *v48;
  id v49;

  v49 = a3;
  objc_msgSend(v49, "airplayDeviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    airplayDeviceID = self->_airplayDeviceID;
    self->_airplayDeviceID = v6;

  }
  objc_msgSend(v49, "bonjourFullName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (NSString *)objc_msgSend(v8, "copy");
    bonjourFullName = self->_bonjourFullName;
    self->_bonjourFullName = v10;

  }
  objc_msgSend(v49, "bonjourHostname");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = (NSString *)objc_msgSend(v12, "copy");
    bonjourHostname = self->_bonjourHostname;
    self->_bonjourHostname = v14;

  }
  objc_msgSend(v49, "bonjourName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = (NSString *)objc_msgSend(v16, "copy");
    bonjourName = self->_bonjourName;
    self->_bonjourName = v18;

  }
  objc_msgSend(v49, "bonjourType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = (NSString *)objc_msgSend(v20, "copy");
    bonjourType = self->_bonjourType;
    self->_bonjourType = v22;

  }
  self->_bonjourInterfaceIndex = objc_msgSend(v49, "bonjourInterfaceIndex");
  objc_msgSend(v49, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    v26 = (NSString *)objc_msgSend(v24, "copy");
    identifier = self->_identifier;
    self->_identifier = v26;

  }
  objc_msgSend(v49, "ipv4String");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    v30 = (NSString *)objc_msgSend(v28, "copy");
    ipv4String = self->_ipv4String;
    self->_ipv4String = v30;

  }
  v47 = v17;
  objc_msgSend(v49, "name");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    v34 = (NSString *)objc_msgSend(v32, "copy");
    name = self->_name;
    self->_name = v34;

  }
  v36 = v13;
  v48 = v5;
  objc_msgSend(v49, "protocolTypeString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    v39 = (NSString *)objc_msgSend(v37, "copy");
    protocolTypeString = self->_protocolTypeString;
    self->_protocolTypeString = v39;

  }
  v41 = v9;
  objc_msgSend(v49, "underlyingDADevice");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
    objc_storeStrong((id *)&self->_underlyingDADevice, v42);
  objc_msgSend(v49, "userInfo");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v43)
  {
    v45 = (NSDictionary *)objc_msgSend(v43, "copy");
    userInfo = self->_userInfo;
    self->_userInfo = v45;

  }
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)airplayDeviceID
{
  return self->_airplayDeviceID;
}

- (void)setAirplayDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)bonjourFullName
{
  return self->_bonjourFullName;
}

- (void)setBonjourFullName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)bonjourHostname
{
  return self->_bonjourHostname;
}

- (void)setBonjourHostname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)bonjourName
{
  return self->_bonjourName;
}

- (void)setBonjourName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)bonjourType
{
  return self->_bonjourType;
}

- (void)setBonjourType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unsigned)bonjourInterfaceIndex
{
  return self->_bonjourInterfaceIndex;
}

- (void)setBonjourInterfaceIndex:(unsigned int)a3
{
  self->_bonjourInterfaceIndex = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)ipv4String
{
  return self->_ipv4String;
}

- (void)setIpv4String:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)missing
{
  return self->_missing;
}

- (NSString)protocolTypeString
{
  return self->_protocolTypeString;
}

- (void)setProtocolTypeString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (DADevice)underlyingDADevice
{
  return self->_underlyingDADevice;
}

- (void)setUnderlyingDADevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (unint64_t)addTicks
{
  return self->_addTicks;
}

- (void)setAddTicks:(unint64_t)a3
{
  self->_addTicks = a3;
}

- (BOOL)grouped
{
  return self->_grouped;
}

- (void)setGrouped:(BOOL)a3
{
  self->_grouped = a3;
}

- (DADevice)parentDevice
{
  return (DADevice *)objc_loadWeakRetained((id *)&self->_parentDevice);
}

- (void)setParentDevice:(id)a3
{
  objc_storeWeak((id *)&self->_parentDevice, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentDevice);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_underlyingDADevice, 0);
  objc_storeStrong((id *)&self->_protocolTypeString, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_ipv4String, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bonjourType, 0);
  objc_storeStrong((id *)&self->_bonjourName, 0);
  objc_storeStrong((id *)&self->_bonjourHostname, 0);
  objc_storeStrong((id *)&self->_bonjourFullName, 0);
  objc_storeStrong((id *)&self->_airplayDeviceID, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
}

@end
