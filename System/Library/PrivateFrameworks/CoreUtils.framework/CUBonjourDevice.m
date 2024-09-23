@implementation CUBonjourDevice

- (id)shortDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return NSPrintF((uint64_t)"CUBonjourDevice %.6a, %'@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self->_deviceIDBytes);
}

- (id)description
{
  return -[CUBonjourDevice descriptionWithLevel:](self, "descriptionWithLevel:", 50);
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
  NSString *name;
  __CFString *v19;
  NSString *model;
  __CFString *v21;
  int64_t Int64Ranged;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __CFString *v29;
  NSDictionary *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __CFString *v44;
  uint64_t v46;
  CFMutableStringRef v47;
  CFMutableStringRef v48;
  CFMutableStringRef v49;
  CFMutableStringRef v50;
  CFMutableStringRef v51;
  CFMutableStringRef v52;

  v52 = 0;
  NSAppendPrintF(&v52, (uint64_t)"CUBonjourDevice %.6a", *(uint64_t *)&a3, v3, v4, v5, v6, v7, (uint64_t)self->_deviceIDBytes);
  v10 = v52;
  v17 = v10;
  name = self->_name;
  if (name)
  {
    v51 = v10;
    NSAppendPrintF(&v51, (uint64_t)", %''@", v11, v12, v13, v14, v15, v16, (uint64_t)name);
    v19 = v51;

    v17 = v19;
  }
  model = self->_model;
  if (model)
  {
    v50 = v17;
    NSAppendPrintF(&v50, (uint64_t)", Model %''@", v11, v12, v13, v14, v15, v16, (uint64_t)model);
    v21 = v50;

    v17 = v21;
  }
  Int64Ranged = CFDictionaryGetInt64Ranged((const __CFDictionary *)self->_deviceInfo, CFSTR("TrTy"), 0, 0xFFFFFFFFLL, 0);
  if ((_DWORD)Int64Ranged)
  {
    v49 = v17;
    NSAppendPrintF(&v49, (uint64_t)", TT %#{flags}", v23, v24, v25, v26, v27, v28, Int64Ranged);
    v29 = v49;

    v17 = v29;
  }
  if (a3 <= 30)
  {
    v30 = self->_txtDictionary;
    if (-[NSDictionary count](v30, "count"))
    {
      v48 = v17;
      NSAppendPrintF(&v48, (uint64_t)", TXT %##@", v31, v32, v33, v34, v35, v36, (uint64_t)v30);
      v37 = v48;

      v17 = v37;
    }

    if (a3 <= 20)
    {
      v47 = v17;
      NSAppendPrintF(&v47, (uint64_t)"\n", v38, v39, v40, v41, v42, v43, v46);
      v44 = v47;

      v17 = v44;
    }
  }
  return v17;
}

- (id)copyConnectionInfoWithFlags:(unint64_t)a3 interfaceName:(id)a4 error:(id *)a5
{
  id v8;
  NSDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSDictionary *v16;
  __CFArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __CFArray *v24;
  __CFArray *v25;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;

  v8 = a4;
  v9 = self->_deviceInfo;
  v16 = v9;
  if (v9)
  {
    v29 = 0;
    v17 = BonjourDevice_CopyConnectionInfo((const __CFDictionary *)v9, a3, v8, (int *)&v29);
    v24 = v17;
    if (v17)
    {
      v25 = v17;
    }
    else if (a5)
    {
      if (v29)
        v27 = v29;
      else
        v27 = 4294960596;
      NSErrorWithOSStatusF(v27, (uint64_t)"CopyConnectionInfo failed", v18, v19, v20, v21, v22, v23, v28);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else if (a5)
  {
    NSErrorWithOSStatusF(4294960551, (uint64_t)"No Bonjour Device Info", v10, v11, v12, v13, v14, v15, v28);
    v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)copyConnectionStringWithFlags:(unint64_t)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSDictionary *deviceInfo;
  const char *v10;
  char *v11;
  size_t v12;
  void *v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  unsigned int v26;

  deviceInfo = self->_deviceInfo;
  if (!deviceInfo)
  {
    if (a4)
    {
      v16 = "No Bonjour Device Info";
      v17 = 4294960551;
LABEL_12:
      NSErrorWithOSStatusF(v17, (uint64_t)v16, a3, (uint64_t)a4, v4, v5, v6, v7, v25);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return v14;
    }
    return 0;
  }
  v26 = 0;
  v10 = (const char *)BonjourDevice_CopyDNSNames((const __CFDictionary *)deviceInfo, a3, (int *)&v26);
  if (!v10)
  {
    if (a4)
    {
      if (v26)
        v17 = v26;
      else
        v17 = 4294960596;
      v16 = "CopyDNSNames failed";
      goto LABEL_12;
    }
    return 0;
  }
  v11 = (char *)v10;
  v12 = strlen(v10);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v11, v12, 4, 1);
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    free(v11);
    if (a4)
    {
      NSErrorWithOSStatusF(4294960596, (uint64_t)"String init with UTF-8 failed (%zu bytes)", v18, v19, v20, v21, v22, v23, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v14;
}

- (void)reconfirm
{
  NSDictionary *deviceInfo;

  deviceInfo = self->_deviceInfo;
  if (deviceInfo)
    BonjourDevice_Reconfirm((const __CFDictionary *)deviceInfo);
}

- (void)_updateTXTDictionary:(id)a3
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  id v6;
  unint64_t v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  void *v10;
  unsigned __int8 *v11;
  void *v12;
  NSDictionary *v13;
  NSDictionary *txtDictionary;
  id v15;

  v15 = objc_retainAutorelease(a3);
  v4 = (unsigned __int8 *)objc_msgSend(v15, "bytes");
  v5 = &v4[objc_msgSend(v15, "length")];
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  while (v5 - v4 >= 1)
  {
    v8 = v4 + 1;
    v7 = *v4;
    if (v5 - (v4 + 1) < v7)
      break;
    v4 += v7 + 1;
    v9 = v8;
    if ((_DWORD)v7)
    {
      while (*v9 != 61)
      {
        ++v9;
        if (!--v7)
        {
          v9 = v4;
          break;
        }
      }
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v8, v9 - v8, 4);
    if (v10)
    {
      if (v9 >= v4)
        v11 = v9;
      else
        v11 = v9 + 1;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v11, v4 - v11, 4);
      if (v12)
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v10);

    }
  }
  v13 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v6);
  txtDictionary = self->_txtDictionary;
  self->_txtDictionary = v13;

}

- (unsigned)updateWithBonjourDeviceInfo:(id)a3
{
  const __CFDictionary *v5;
  CFTypeID TypeID;
  void *v7;
  void *v8;
  NSString *name;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  char v13;
  unsigned int v14;
  CFTypeID v15;
  void *v16;
  void *v17;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  char v22;

  v5 = (const __CFDictionary *)a3;
  objc_storeStrong((id *)&self->_deviceInfo, a3);
  TypeID = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v5, CFSTR("name"), TypeID, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_7;
  name = self->_name;
  v10 = v7;
  v11 = name;
  if (v10 == v11)
  {

    goto LABEL_7;
  }
  v12 = v11;
  if (v11)
  {
    v13 = -[NSString isEqual:](v10, "isEqual:", v11);

    if ((v13 & 1) == 0)
      goto LABEL_9;
LABEL_7:
    v14 = 0;
    goto LABEL_10;
  }

LABEL_9:
  objc_storeStrong((id *)&self->_name, v8);
  v14 = 2;
LABEL_10:
  v15 = CFDataGetTypeID();
  CFDictionaryGetTypedValue(v5, CFSTR("txt"), v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = self->_name;
    v19 = v16;
    v20 = v18;
    if (v19 == v20)
    {

    }
    else
    {
      v21 = v20;
      if (v20)
      {
        v22 = -[NSString isEqual:](v19, "isEqual:", v20);

        if ((v22 & 1) != 0)
          goto LABEL_18;
      }
      else
      {

      }
      objc_storeStrong((id *)&self->_txtData, v17);
      -[CUBonjourDevice _updateTXTDictionary:](self, "_updateTXTDictionary:", v19);
      v14 |= 1u;
    }
  }
LABEL_18:

  return v14;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
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

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)txtDictionary
{
  return self->_txtDictionary;
}

- (NSData)txtData
{
  return self->_txtData;
}

- (void)setTxtData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)identifierStr
{
  return self->_identifierStr;
}

- (void)setIdentifierStr:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSUUID)identifierUUID
{
  return self->_identifierUUID;
}

- (void)setIdentifierUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierUUID, 0);
  objc_storeStrong((id *)&self->_identifierStr, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_txtData, 0);
  objc_storeStrong((id *)&self->_txtDictionary, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
