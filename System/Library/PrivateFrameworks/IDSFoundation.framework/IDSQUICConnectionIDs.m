@implementation IDSQUICConnectionIDs

- (unsigned)_generateUniqueQUICConnectionID:(unsigned int)a3 usedLocalConnectionIDs:(id *)a4
{
  double v4;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  const char *v15;
  double v16;
  int v17;
  uint64_t v18;
  id v20;
  void *v21;
  const char *v22;
  double v23;
  const char *v24;
  uint64_t v25;
  double v26;
  NSObject *v27;
  unsigned int __buf;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend_GlobalLink(IDSFoundationLog, a2, *(uint64_t *)&a3, v4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend_count(*a4, v8, v9, v10);
    *(_DWORD *)buf = 134217984;
    v31 = v11;
    _os_log_impl(&dword_19B949000, v7, OS_LOG_TYPE_DEFAULT, "generating a connection ID (%lu already taken)", buf, 0xCu);
  }

  __buf = -1431655766;
  v12 = a3 << 28;
  v13 = -100000;
  do
  {
    arc4random_buf(&__buf, 4uLL);
    v17 = __buf & 0xFFFFFFF | v12;
    v18 = v17 | 0x800000u;
    __buf = v17 | 0x800000;
    if (__CFADD__(v13++, 1))
      sub_19BAF6294(v16, v14, v15, v18);
    v20 = *a4;
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v15, v18, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v20) = objc_msgSend_containsObject_(v20, v22, (uint64_t)v21, v23);

  }
  while ((v20 & 1) != 0);
  objc_msgSend_GlobalLink(IDSFoundationLog, v24, v25, v26);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v31) = __buf;
    _os_log_impl(&dword_19B949000, v27, OS_LOG_TYPE_DEFAULT, "generated connection ID %08x", buf, 8u);
  }

  return __buf;
}

- (id)_getConnectionIDData:(unsigned int)a3
{
  double v3;
  unsigned int v5;

  v5 = bswap32(a3);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], a2, (uint64_t)&v5, v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)_convertConnectionIDDataToUInt32:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  double v6;

  v3 = objc_retainAutorelease(a3);
  return bswap32(*(_DWORD *)objc_msgSend_bytes(v3, v4, v5, v6));
}

- (id)_getConnectionIDDispatchData:(unsigned int)a3
{
  unsigned int buffer;

  buffer = bswap32(a3);
  return dispatch_data_create(&buffer, 4uLL, 0, 0);
}

- (id)generateLocalIDs:(id *)a3
{
  double v3;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  self->_localAVCConnectionID = objc_msgSend__generateUniqueQUICConnectionID_usedLocalConnectionIDs_(self, a2, 0, v3, a3);
  self->_localIDSConnectionID = objc_msgSend__generateUniqueQUICConnectionID_usedLocalConnectionIDs_(self, v6, 1, v7, a3);
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v8, self->_localAVCConnectionID, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v11, self->_localIDSConnectionID, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v14, (uint64_t)v18, v15, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)description
{
  double v2;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("LocalAVC: 0x%08x, RemoteAVC: 0x%08x, LocalIDS: 0x%08x, RemoteIDS: 0x%08x"), v2, self->_localAVCConnectionID, self->_remoteAVCConnectionID, self->_localIDSConnectionID, self->_remoteIDSConnectionID);
}

- (NSData)localAVCConnectionIDData
{
  return (NSData *)((uint64_t (*)(IDSQUICConnectionIDs *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel__getConnectionIDData_, self->_localAVCConnectionID);
}

- (NSData)localIDSConnectionIDData
{
  return (NSData *)((uint64_t (*)(IDSQUICConnectionIDs *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel__getConnectionIDData_, self->_localIDSConnectionID);
}

- (NSData)remoteAVCConnectionIDData
{
  return (NSData *)((uint64_t (*)(IDSQUICConnectionIDs *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel__getConnectionIDData_, self->_remoteAVCConnectionID);
}

- (NSData)remoteIDSConnectionIDData
{
  return (NSData *)((uint64_t (*)(IDSQUICConnectionIDs *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel__getConnectionIDData_, self->_remoteIDSConnectionID);
}

- (void)setLocalAVCConnectionIDData:(id)a3
{
  double v3;

  self->_localAVCConnectionID = objc_msgSend__convertConnectionIDDataToUInt32_(self, a2, (uint64_t)a3, v3);
}

- (void)setLocalIDSConnectionIDData:(id)a3
{
  double v3;

  self->_localIDSConnectionID = objc_msgSend__convertConnectionIDDataToUInt32_(self, a2, (uint64_t)a3, v3);
}

- (void)setRemoteAVCConnectionIDData:(id)a3
{
  double v3;

  self->_remoteAVCConnectionID = objc_msgSend__convertConnectionIDDataToUInt32_(self, a2, (uint64_t)a3, v3);
}

- (void)setRemoteIDSConnectionIDData:(id)a3
{
  double v3;

  self->_remoteIDSConnectionID = objc_msgSend__convertConnectionIDDataToUInt32_(self, a2, (uint64_t)a3, v3);
}

- (id)localAVCConnectionIDDispatchData
{
  return (id)((uint64_t (*)(IDSQUICConnectionIDs *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel__getConnectionIDDispatchData_, self->_localAVCConnectionID);
}

- (id)localIDSConnectionIDDispatchData
{
  return (id)((uint64_t (*)(IDSQUICConnectionIDs *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel__getConnectionIDDispatchData_, self->_localIDSConnectionID);
}

- (id)remoteAVCConnectionIDDispatchData
{
  return (id)((uint64_t (*)(IDSQUICConnectionIDs *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel__getConnectionIDDispatchData_, self->_remoteAVCConnectionID);
}

- (id)remoteIDSConnectionIDDispatchData
{
  return (id)((uint64_t (*)(IDSQUICConnectionIDs *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel__getConnectionIDDispatchData_, self->_remoteIDSConnectionID);
}

- (BOOL)isComplete
{
  return self->_localAVCConnectionID
      && self->_localIDSConnectionID
      && self->_remoteAVCConnectionID
      && self->_remoteIDSConnectionID != 0;
}

- (unsigned)localAVCConnectionID
{
  return self->_localAVCConnectionID;
}

- (void)setLocalAVCConnectionID:(unsigned int)a3
{
  self->_localAVCConnectionID = a3;
}

- (unsigned)localIDSConnectionID
{
  return self->_localIDSConnectionID;
}

- (void)setLocalIDSConnectionID:(unsigned int)a3
{
  self->_localIDSConnectionID = a3;
}

- (unsigned)remoteAVCConnectionID
{
  return self->_remoteAVCConnectionID;
}

- (void)setRemoteAVCConnectionID:(unsigned int)a3
{
  self->_remoteAVCConnectionID = a3;
}

- (unsigned)remoteIDSConnectionID
{
  return self->_remoteIDSConnectionID;
}

- (void)setRemoteIDSConnectionID:(unsigned int)a3
{
  self->_remoteIDSConnectionID = a3;
}

@end
