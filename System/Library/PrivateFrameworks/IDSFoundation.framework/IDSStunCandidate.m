@implementation IDSStunCandidate

+ (id)candidateWithType:(unint64_t)a3 transport:(int64_t)a4 radioAccessTechnology:(unsigned int)a5 mtu:(unsigned int)a6 index:(int)a7 address:(sockaddr *)a8 external:(sockaddr *)a9
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  IDSStunCandidate *v15;
  const char *v16;
  double v17;

  v10 = *(_QWORD *)&a7;
  v11 = *(_QWORD *)&a6;
  v12 = *(_QWORD *)&a5;
  v15 = [IDSStunCandidate alloc];
  return (id)objc_msgSend_initWithType_transport_radioAccessTechnology_mtu_index_address_external_(v15, v16, a3, v17, a4, v12, v11, v10, a8, a9);
}

- (IDSStunCandidate)initWithType:(unint64_t)a3 transport:(int64_t)a4 radioAccessTechnology:(unsigned int)a5 mtu:(unsigned int)a6 index:(int)a7 address:(sockaddr *)a8 external:(sockaddr *)a9
{
  IDSStunCandidate *v15;
  IDSStunCandidate *v16;
  unint64_t v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)IDSStunCandidate;
  v15 = -[IDSStunCandidate init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_active = 1;
    v15->_type = a3;
    v15->_transport = a4;
    if (a3 > 3)
      v17 = 0;
    else
      v17 = qword_19BB12CD8[a3];
    v15->_priority = v17;
    v15->_index = a7;
    if (a8 && IsValidSA((_BOOL8)a8))
      memcpy(&v16->_address, a8, a8->sa_len);
    if (a9 && IsValidSA((_BOOL8)a9))
      memcpy(&v16->_external, a9, a9->sa_len);
    v16->_radioAccessTechnology = a5;
    v16->_mtu = a6;
  }
  return v16;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)IDSStunCandidate;
  -[IDSStunCandidate dealloc](&v2, sel_dealloc);
}

- (id)description
{
  __int128 v3;
  void *v4;
  char *v5;
  uint64_t index;
  const char *v7;
  const char *v8;
  double v9;
  char v11[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char __str[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v25 = v3;
  v26 = v3;
  v23 = v3;
  v24 = v3;
  v21 = v3;
  v22 = v3;
  *(_OWORD *)__str = v3;
  v20 = v3;
  v17 = v3;
  v18 = v3;
  v15 = v3;
  v16 = v3;
  v13 = v3;
  v14 = v3;
  *(_OWORD *)v11 = v3;
  v12 = v3;
  SAToIPPortString(__str, 0x80uLL, (uint64_t)&self->_address);
  SAToIPPortString(v11, 0x80uLL, (uint64_t)&self->_external);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (&_IDSStunCandidateTypeStrings)[self->_type];
  index = self->_index;
  v7 = IDSRadioAccessTechnologyToString(self->_radioAccessTechnology);
  objc_msgSend_stringWithFormat_(v4, v8, (uint64_t)CFSTR("[%p/%s/%s/%s/%1d/%s/0x%x/%u]"), v9, self, __str, v11, v5, index, v7, self->_linkFlags, self->_dataSoMask);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (const)address
{
  return (const sockaddr *)&self->_address;
}

- (NSString)addressString
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  double v5;
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend_address(self, a2, v2, -3.72066208e-103, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL);
  SAToIPPortString((char *)&v7, 0x80uLL, v3);
  objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v4, (uint64_t)&v7, v5, 4);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (sockaddr)external
{
  return (sockaddr *)&self->_external;
}

- (void)setExternal:(sockaddr *)a3
{
  if (a3)
  {
    if (IsValidSA((_BOOL8)a3))
      memcpy(&self->_external, a3, a3->sa_len);
  }
}

- (void)setAddress:(const sockaddr *)a3 external:(const sockaddr *)a4
{
  void *v4;
  __int128 v6;
  NSObject *v7;
  __int128 v8;
  NSObject *v9;
  void *v10;
  void *__src;
  uint8_t buf[4];
  char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  IDSStunCandidate *v17;
  char v18[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char __str[16];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v4 = (void *)a4;
  v34 = *MEMORY[0x1E0C80C00];
  v10 = (void *)a4;
  __src = (void *)a3;
  if (a3 && IsValidSA((_BOOL8)a3))
  {
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v32 = v6;
    v33 = v6;
    v30 = v6;
    v31 = v6;
    v28 = v6;
    v29 = v6;
    *(_OWORD *)__str = v6;
    v27 = v6;
    v24 = v6;
    v25 = v6;
    v22 = v6;
    v23 = v6;
    v20 = v6;
    v21 = v6;
    *(_OWORD *)v18 = v6;
    v19 = v6;
    SAToIPPortString(__str, 0x80uLL, (uint64_t)&self->_address);
    SAToIPPortString(v18, 0x80uLL, (uint64_t)&__src);
    OSLogHandleForTransportCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v13 = __str;
      v14 = 2080;
      v15 = v18;
      v16 = 2112;
      v17 = self;
      _os_log_impl(&dword_19B949000, v7, OS_LOG_TYPE_DEFAULT, "update address (%s->%s) for %@.", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("update address (%s->%s) for %@."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("update address (%s->%s) for %@."));
      }
    }
    memcpy(&self->_address, __src, *(unsigned __int8 *)__src);
    v4 = v10;
  }
  if (v4 && IsValidSA((_BOOL8)v4))
  {
    *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v32 = v8;
    v33 = v8;
    v30 = v8;
    v31 = v8;
    v28 = v8;
    v29 = v8;
    *(_OWORD *)__str = v8;
    v27 = v8;
    v24 = v8;
    v25 = v8;
    v22 = v8;
    v23 = v8;
    v20 = v8;
    v21 = v8;
    *(_OWORD *)v18 = v8;
    v19 = v8;
    SAToIPPortString(__str, 0x80uLL, (uint64_t)&self->_external);
    SAToIPPortString(v18, 0x80uLL, (uint64_t)&v10);
    OSLogHandleForTransportCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v13 = __str;
      v14 = 2080;
      v15 = v18;
      v16 = 2112;
      v17 = self;
      _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "update external address (%s->%s) for %@.", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("update external address (%s->%s) for %@."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("update external address (%s->%s) for %@."));
    }
    memcpy(&self->_external, v10, *(unsigned __int8 *)v10);
  }
}

- (void)setLocalPort:(unsigned __int16)a3
{
  if (a3)
    SASetPort((uint64_t)&self->_address, a3);
}

- (void)setExternalAddress:(id)a3
{
  __int128 v4;
  uint64_t v5;
  unsigned __int8 *v6;
  _OWORD v7[8];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v7[6] = v4;
  v7[7] = v4;
  v7[4] = v4;
  v7[5] = v4;
  v7[2] = v4;
  v7[3] = v4;
  v7[0] = v4;
  v7[1] = v4;
  v5 = IPPortStringToSA(a3, (uint64_t)v7);
  if (v5)
  {
    v6 = (unsigned __int8 *)v5;
    if (IsValidSA(v5))
      memcpy(&self->_external, v6, *v6);
  }
}

- (void)updateTransport:(int64_t)a3
{
  self->_transport = a3;
}

- ($B0CAF2F970A52CDCEAEBD8ED9A40FEA0)prefix
{
  return ($B0CAF2F970A52CDCEAEBD8ED9A40FEA0 *)&self->_prefix;
}

- (void)setPrefix:(id *)a3
{
  if (a3)
    self->_prefix = ($BE1143823B49C92274321FF531FF3CB8)*a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t type;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  BOOL v17;

  v4 = a3;
  type = self->_type;
  if ((type == 3) != (objc_msgSend_type(v4, v6, v7, v8) == 3)
    || (v12 = objc_msgSend_address(v4, v9, v10, v11), !IsSameSA((uint64_t)&self->_address, v12)))
  {
    v17 = 0;
  }
  else
  {
    v16 = objc_msgSend_external(v4, v13, v14, v15);
    v17 = IsSameSA((uint64_t)&self->_external, v16);
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  IDSStunCandidate *v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;

  v4 = [IDSStunCandidate alloc];
  v7 = (void *)objc_msgSend_initWithType_transport_radioAccessTechnology_mtu_index_address_external_(v4, v5, self->_type, v6, self->_transport, self->_radioAccessTechnology, self->_mtu, self->_index, &self->_address, &self->_external);
  objc_msgSend_setDataSoMask_(v7, v8, self->_dataSoMask, v9);
  objc_msgSend_setLinkFlags_(v7, v10, self->_linkFlags, v11);
  objc_msgSend_setIsCLAT46_(v7, v12, self->_isCLAT46, v13);
  return v7;
}

- (BOOL)isCompatibleWithStunCandidate:(id)a3
{
  id v4;
  int64_t transport;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  int v14;
  double v15;
  unsigned int v16;
  unsigned int v17;
  const char *v18;
  uint64_t v19;
  double v20;
  int isCellularStunCandidate;
  const char *v22;
  uint64_t v23;
  double v24;
  const char *v25;
  uint64_t v26;
  double v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  int v31;
  uint64_t v32;
  unint64_t type;
  const char *v34;
  uint64_t v35;
  double v36;
  int isLinkLocalStunCandidate;
  const char *v39;
  uint64_t v40;
  double v41;

  v4 = a3;
  transport = self->_transport;
  if (transport != objc_msgSend_transport(v4, v6, v7, v8))
    goto LABEL_14;
  v14 = *(unsigned __int8 *)(objc_msgSend_external(v4, v9, v10, v11) + 1);
  if (v14 != self->_address.ss_family)
    goto LABEL_14;
  if (v14 != 2)
    goto LABEL_13;
  v16 = *(_DWORD *)&self->_address.__ss_pad1[2];
  v17 = *(_DWORD *)(objc_msgSend_external(v4, v12, v13, v15) + 4);
  isCellularStunCandidate = objc_msgSend_isCellularStunCandidate(self, v18, v19, v20);
  if (isCellularStunCandidate == objc_msgSend_isCellularStunCandidate(v4, v22, v23, v24)
    || (v28 = bswap32(v16), HIBYTE(v28) != 10) && (v28 & 0xFFF00000) != 0xAC100000 && (v28 & 0xFFFF0000) != 0xC0A80000
    || (LOBYTE(v29) = 0, v30 = bswap32(v17), HIBYTE(v30) != 10)
    && (v30 & 0xFFF00000) != 0xAC100000
    && (v30 & 0xFFFF0000) != 0xC0A80000)
  {
    v31 = *(unsigned __int16 *)self->_address.__ss_pad1;
    v32 = objc_msgSend_external(v4, v25, v26, v27);
    if (v16 != v17 || v31 != *(unsigned __int16 *)(v32 + 2))
    {
LABEL_13:
      type = self->_type;
      if ((type == 3) == (objc_msgSend_type(v4, v12, v13, v15) == 3))
      {
        isLinkLocalStunCandidate = objc_msgSend_isLinkLocalStunCandidate(self, v34, v35, v36);
        v29 = isLinkLocalStunCandidate ^ objc_msgSend_isLinkLocalStunCandidate(v4, v39, v40, v41) ^ 1;
        goto LABEL_15;
      }
    }
LABEL_14:
    LOBYTE(v29) = 0;
  }
LABEL_15:

  return v29;
}

- (BOOL)isSameNetworkType:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  uint64_t v9;
  double v10;
  BOOL v11;
  const char *v12;
  uint64_t v13;
  double v14;
  unsigned int radioAccessTechnology;
  BOOL v16;

  v4 = a3;
  if (objc_msgSend_isCellularStunCandidate(v4, v5, v6, v7)
    && (objc_msgSend_isCellularStunCandidate(self, v8, v9, v10) & 1) != 0)
  {
    v11 = 1;
  }
  else if (objc_msgSend_radioAccessTechnology(v4, v8, v9, v10)
         && objc_msgSend_radioAccessTechnology(v4, v12, v13, v14) != 9)
  {
    v11 = 0;
  }
  else
  {
    radioAccessTechnology = self->_radioAccessTechnology;
    if (radioAccessTechnology)
      v16 = radioAccessTechnology == 9;
    else
      v16 = 1;
    v11 = v16;
  }

  return v11;
}

- (BOOL)isServerReflexiveStunCandidate
{
  return self->_type == 1;
}

- (BOOL)isRelayStunCandidate
{
  return self->_type == 3;
}

- (BOOL)isCellularStunCandidate
{
  unsigned int radioAccessTechnology;
  BOOL v3;

  radioAccessTechnology = self->_radioAccessTechnology;
  if (radioAccessTechnology)
    v3 = radioAccessTechnology == 9;
  else
    v3 = 1;
  return !v3;
}

- (BOOL)isLinkLocalStunCandidate
{
  return IsLinkLocalSA((_BOOL8)&self->_address);
}

- (BOOL)hasNATIPv4Address
{
  unsigned int v3;
  unsigned int v4;
  BOOL v5;

  if (self->_address.ss_family != 2)
    return 0;
  if (*(_DWORD *)&self->_address.__ss_pad1[2] == 10)
    return 1;
  v3 = bswap32(*(_DWORD *)&self->_address.__ss_pad1[2]);
  v4 = v3 >> 20;
  v5 = HIWORD(v3) == 49320;
  return v4 == 2753 || v5;
}

- (BOOL)hasNATIPv4External
{
  unsigned int v3;
  unsigned int v4;
  BOOL v5;

  if (self->_external.ss_family != 2)
    return 0;
  if (*(_DWORD *)&self->_external.__ss_pad1[2] == 10)
    return 1;
  v3 = bswap32(*(_DWORD *)&self->_external.__ss_pad1[2]);
  v4 = v3 >> 20;
  v5 = HIWORD(v3) == 49320;
  return v4 == 2753 || v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (int)index
{
  return self->_index;
}

- (unsigned)radioAccessTechnology
{
  return self->_radioAccessTechnology;
}

- (void)setRadioAccessTechnology:(unsigned int)a3
{
  self->_radioAccessTechnology = a3;
}

- (int64_t)transport
{
  return self->_transport;
}

- (unsigned)mtu
{
  return self->_mtu;
}

- (void)setMtu:(unsigned int)a3
{
  self->_mtu = a3;
}

- (double)extIPDetectionStartTime
{
  return self->_extIPDetectionStartTime;
}

- (void)setExtIPDetectionStartTime:(double)a3
{
  self->_extIPDetectionStartTime = a3;
}

- (unsigned)dataSoMask
{
  return self->_dataSoMask;
}

- (void)setDataSoMask:(unsigned int)a3
{
  self->_dataSoMask = a3;
}

- (NSString)allocbindDataBlob
{
  return self->_allocbindDataBlob;
}

- (void)setAllocbindDataBlob:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isCLAT46
{
  return self->_isCLAT46;
}

- (void)setIsCLAT46:(BOOL)a3
{
  self->_isCLAT46 = a3;
}

- (unsigned)linkFlags
{
  return self->_linkFlags;
}

- (void)setLinkFlags:(unsigned __int16)a3
{
  self->_linkFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allocbindDataBlob, 0);
}

@end
