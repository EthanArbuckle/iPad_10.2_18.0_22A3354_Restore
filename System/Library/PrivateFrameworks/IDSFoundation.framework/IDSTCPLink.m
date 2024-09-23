@implementation IDSTCPLink

- (IDSTCPLink)initWithDeviceUniqueID:(id)a3 cbuuid:(id)a4 isSSL:(BOOL)a5 getPacketLength:(id)a6
{
  id v11;
  id v12;
  id v13;
  IDSTCPLink *v14;
  IDSTCPLink *v15;
  uint64_t v16;
  id getPacketLength;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)IDSTCPLink;
  v14 = -[IDSTCPLink init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_cbuuid, a4);
    objc_storeStrong((id *)&v15->_deviceUniqueID, a3);
    v15->_isSSL = a5;
    _Block_copy(v13);
    v16 = objc_claimAutoreleasedReturnValue();
    getPacketLength = v15->_getPacketLength;
    v15->_getPacketLength = (id)v16;

    v15->_previousReportTime = ids_monotonic_time();
    v15->_addressFamily = 2;
  }

  return v15;
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  objc_super v7;
  uint8_t buf[16];

  OSLogHandleForTransportCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v3, OS_LOG_TYPE_DEFAULT, "IDSTCPLink dealloc", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("IDSTCPLink dealloc"));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("IDSTCPLink dealloc"));
    }
  }
  objc_msgSend_invalidate(self, v4, v5, v6);
  v7.receiver = self;
  v7.super_class = (Class)IDSTCPLink;
  -[IDSTCPLink dealloc](&v7, sel_dealloc);
}

- (void)invalidate
{
  NSObject *v3;
  IDSTCPConnection_ *conns;
  IDSTCPConnection_ *var11;
  int v6;
  id getPacketLength;
  id v8;
  uint8_t v9[16];

  OSLogHandleForTransportCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_19B949000, v3, OS_LOG_TYPE_DEFAULT, "invalidate", v9, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("invalidate"));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("invalidate"));
    }
  }
  conns = self->_conns;
  if (conns)
  {
    do
    {
      var11 = conns->var11;
      v6 = conns->var2 - 1;
      conns->var2 = v6;
      if (!v6)
        sub_19B99C7C4((unsigned int *)conns);
      conns = var11;
    }
    while (var11);
  }
  self->_conns = 0;
  getPacketLength = self->_getPacketLength;
  if (getPacketLength)
  {
    _Block_release(getPacketLength);
    v8 = self->_getPacketLength;
    self->_getPacketLength = 0;

  }
}

- (unint64_t)headerOverhead
{
  int addressFamily;
  unint64_t v3;

  addressFamily = self->_addressFamily;
  v3 = 255;
  if (addressFamily == 30)
    v3 = 48;
  if (addressFamily == 2)
    return 28;
  else
    return v3;
}

- (NSString)linkTypeString
{
  return (NSString *)CFSTR("TCP");
}

- (id)copyLinkStatsDict
{
  id v3;
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;

  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v4, self->_counters._totalBytesReceived, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v7, self->_counters._totalBytesSent, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v10, self->_counters._totalPacketsReceived, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v13, self->_counters._totalPacketsSent, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend_initWithObjectsAndKeys_(v3, v16, (uint64_t)v6, v17, CFSTR("bytesReceived"), v9, CFSTR("bytesSent"), v12, CFSTR("packetsReceived"), v15, CFSTR("packetsSent"), 0);

  return v18;
}

- (int64_t)getPacketLength:(id *)a3 isChannelData:(BOOL *)a4
{
  return (*((uint64_t (**)(void))self->_getPacketLength + 2))();
}

- (IDSTCPConnection_)_getIDSTCPConnection:(id *)a3
{
  sockaddr_storage *p_var17;
  sockaddr_storage *p_var18;
  IDSTCPConnection_ *conns;
  __int128 v6;
  NSObject *v7;
  uint8_t buf[4];
  char *v10;
  __int16 v11;
  char *v12;
  char v13[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char __str[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  p_var17 = &a3->var17;
  p_var18 = &a3->var18;
  conns = self->_conns;
  if (conns)
  {
    while (!IsSameSA((uint64_t)&conns->var5, (uint64_t)p_var17) || !IsSameSA((uint64_t)&conns->var6, (uint64_t)p_var18))
    {
      conns = conns->var11;
      if (!conns)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v27 = v6;
    v28 = v6;
    v25 = v6;
    v26 = v6;
    v23 = v6;
    v24 = v6;
    *(_OWORD *)__str = v6;
    v22 = v6;
    *(_OWORD *)v13 = v6;
    v14 = v6;
    v15 = v6;
    v16 = v6;
    v17 = v6;
    v18 = v6;
    v19 = v6;
    v20 = v6;
    SAToIPPortString(__str, 0x80uLL, (uint64_t)p_var17);
    SAToIPPortString(v13, 0x80uLL, (uint64_t)p_var18);
    OSLogHandleForTransportCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v10 = __str;
      v11 = 2080;
      v12 = v13;
      _os_log_impl(&dword_19B949000, v7, OS_LOG_TYPE_DEFAULT, "no connection from %s to %s", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("no connection from %s to %s"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("no connection from %s to %s"));
      }
    }
    return 0;
  }
  return conns;
}

- (sockaddr)connect:(int)a3 localAddress:(sockaddr *)a4 portRange:(unsigned __int16)a5 remoteAddress:(sockaddr *)a6 clientUUID:(unsigned __int8)a7[16] completionHandler:(id)a8
{
  int v10;
  id v14;
  __int128 v15;
  char *v16;
  _QWORD *v17;
  id *v18;
  int v19;
  int v20;
  sockaddr *v21;
  __int128 v22;
  unsigned int v23;
  int v24;
  int v25;
  unsigned int v26;
  socklen_t v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  uint64_t v35;
  double v36;
  NSObject *v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  double v41;
  NSObject *v42;
  _DWORD *v43;
  int v44;
  NSObject *v45;
  NSObject *v46;
  int v47;
  NSObject *v48;
  __int128 v49;
  uint64_t v50;
  NSObject *v51;
  int v52;
  NSObject *v53;
  int v54;
  NSObject *v55;
  int v56;
  unsigned int v57;
  NSObject *v58;
  int v59;
  NSObject *v60;
  NSObject *v61;
  _BYTE *v62;
  uint64_t v63;
  uint64_t v64;
  IDSTCPLinkCounter_ *p_counters;
  const unsigned __int8 *uu;
  id v67;
  IDSTCPLink *v68;
  id aBlock;
  _QWORD v70[5];
  int v71;
  socklen_t v72;
  char v73[16];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  char __str[16];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t buf[4];
  _BYTE *v90;
  __int16 v91;
  int v92;
  _BYTE v93[48];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;

  v10 = a5;
  v99 = *MEMORY[0x1E0C80C00];
  v14 = a8;
  if (self->_getPacketLength)
  {
    *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v87 = v15;
    v88 = v15;
    v85 = v15;
    v86 = v15;
    v83 = v15;
    v84 = v15;
    *(_OWORD *)__str = v15;
    v82 = v15;
    v79 = v15;
    v80 = v15;
    v77 = v15;
    v78 = v15;
    v75 = v15;
    v76 = v15;
    *(_OWORD *)v73 = v15;
    v74 = v15;
    v68 = self;
    aBlock = v14;
    v71 = 1;
    v16 = (char *)malloc_type_calloc(1uLL, 0x150uLL, 0x10A0040BEA2227EuLL);
    v67 = v14;
    if (v16
      && (v17 = sub_19BA580FC(0x4000, 0), (*((_QWORD *)v16 + 2) = v17) != 0)
      && (v18 = _IDSLinkPacketBufferCreate(), (*((_QWORD *)v16 + 35) = v18) != 0))
    {
      if (a4->sa_family == 30)
        v19 = 30;
      else
        v19 = 2;
      v20 = socket(v19, 1, 0);
      *(_DWORD *)v16 = v20;
      if (v20 < 0)
      {
        v35 = *__error();
        IDSAssertNonFatalErrnoWithSource(v35, "TCPLink", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSTCPLink.m", 355, v36);
        OSLogHandleForTransportCategory();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v93 = 67109120;
          *(_DWORD *)&v93[4] = v35;
          _os_log_impl(&dword_19B949000, v37, OS_LOG_TYPE_DEFAULT, "socket failed: %d", v93, 8u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("socket failed: %d"));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("socket failed: %d"));
          }
        }
      }
      else
      {
        uu = a7;
        IDSCheckFileDescriptorUsageWithSource((uint64_t)"IDSTCPLink.m", 360, 0);
        v21 = (sockaddr *)(v16 + 24);
        __memcpy_chk();
        *(_QWORD *)&v22 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v97 = v22;
        v98 = v22;
        v95 = v22;
        v96 = v22;
        *(_OWORD *)&v93[32] = v22;
        v94 = v22;
        *(_OWORD *)v93 = v22;
        *(_OWORD *)&v93[16] = v22;
        if (v16[25] == 30)
        {
          *(_DWORD *)buf = 1;
          setsockopt(*(_DWORD *)v16, 41, 27, buf, 4u);
        }
        p_counters = &self->_counters;
        v23 = *((unsigned __int16 *)v16 + 13);
        v24 = v10 + 1;
LABEL_12:
        v25 = 0;
        v26 = bswap32(v23) >> 16;
        while (1)
        {
          v27 = v16[24];
          v72 = v27;
          *((_WORD *)v16 + 13) = bswap32(v26 + v25) >> 16;
          if (!bind(*(_DWORD *)v16, (const sockaddr *)(v16 + 24), v27))
            break;
          SAToIPPortString(v93, 0x80uLL, (uint64_t)(v16 + 24));
          v28 = *__error();
          OSLogHandleForTransportCategory();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v90 = v93;
            v91 = 1024;
            v92 = v28;
            _os_log_impl(&dword_19B949000, v29, OS_LOG_TYPE_DEFAULT, "failed to bind to %s, errno: %d", buf, 0x12u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              v62 = v93;
              v63 = v28;
              _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("failed to bind to %s, errno: %d"));
              if (_IDSShouldLog())
              {
                v62 = v93;
                v63 = v28;
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("failed to bind to %s, errno: %d"));
              }
            }
          }
          if (!(_WORD)v23)
            goto LABEL_106;
          if (v24 == ++v25)
          {
            v23 = 0;
            *((_WORD *)v16 + 13) = 0;
            goto LABEL_12;
          }
        }
        if (!(_WORD)v23 && getsockname(*(_DWORD *)v16, (sockaddr *)(v16 + 24), &v72) < 0)
        {
          v52 = *__error();
          OSLogHandleForTransportCategory();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v90) = v52;
            _os_log_impl(&dword_19B949000, v53, OS_LOG_TYPE_DEFAULT, "getsockname failed: %d", buf, 8u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("getsockname failed: %d"));
              if (_IDSShouldLog())
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("getsockname failed: %d"));
            }
          }
LABEL_106:
          v54 = *__error();
          OSLogHandleForTransportCategory();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v93 = 67109120;
            *(_DWORD *)&v93[4] = v54;
            _os_log_impl(&dword_19B949000, v55, OS_LOG_TYPE_DEFAULT, "bind failed: %d", v93, 8u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("bind failed: %d"));
              if (_IDSShouldLog())
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("bind failed: %d"));
            }
          }
          goto LABEL_30;
        }
        SAToIPPortString(v93, 0x80uLL, (uint64_t)(v16 + 24));
        OSLogHandleForTransportCategory();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v90 = v93;
          _os_log_impl(&dword_19B949000, v38, OS_LOG_TYPE_DEFAULT, "bind to %s", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v62 = v93;
            _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("bind to %s"));
            if (_IDSShouldLog())
            {
              v62 = v93;
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("bind to %s"));
            }
          }
        }
        if (setsockopt(*(_DWORD *)v16, 0xFFFF, 4130, &v71, 4u) < 0)
        {
          OSLogHandleForTransportCategory();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v93 = 0;
            _os_log_impl(&dword_19B949000, v42, OS_LOG_TYPE_DEFAULT, "failed to turn on SO_NOSIGPIPE", v93, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("failed to turn on SO_NOSIGPIPE"));
              if (_IDSShouldLog())
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("failed to turn on SO_NOSIGPIPE"));
            }
          }
        }
        if (aBlock)
          *((_QWORD *)v16 + 41) = _Block_copy(aBlock);
        *((_DWORD *)v16 + 2) = 1;
        *((_QWORD *)v16 + 40) = v68;
        *((_QWORD *)v16 + 37) = p_counters;
        *((_DWORD *)v16 + 3) = objc_msgSend_isSSL(v68, v39, v40, v41, v62, v63);
        __memcpy_chk();
        *((_DWORD *)v16 + 76) = a3;
        v43 = (_DWORD *)*((_QWORD *)v16 + 35);
        v43[12] = a3;
        memcpy(v43 + 14, v16 + 24, v16[24]);
        memcpy(v43 + 46, a6, a6->sa_len);
        if (!uuid_is_null(uu))
        {
          *(_QWORD *)&v93[29] = 0xAAAAAAAAAAAAAAAALL;
          *(_QWORD *)&v49 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v49 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)v93 = v49;
          *(_OWORD *)&v93[16] = v49;
          uuid_unparse(uu, v93);
          if (setsockopt(*(_DWORD *)v16, 0xFFFF, 4360, uu, 0x10u))
          {
            v50 = *__error();
            OSLogHandleForTransportCategory();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v90 = v93;
              v91 = 1024;
              v92 = v50;
              _os_log_impl(&dword_19B949000, v51, OS_LOG_TYPE_DEFAULT, "setsockopt SO_DELEGATED_UUID failed for %s, errno: %d", buf, 0x12u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                v64 = v50;
                _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("setsockopt SO_DELEGATED_UUID failed for %s, errno: %d"));
                if (_IDSShouldLog())
                {
                  v64 = v50;
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("setsockopt SO_DELEGATED_UUID failed for %s, errno: %d"));
                }
              }
            }
          }
          else
          {
            OSLogHandleForTransportCategory();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v90 = v93;
              _os_log_impl(&dword_19B949000, v60, OS_LOG_TYPE_DEFAULT, "setsockopt SO_DELEGATED_UUID for %s", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("setsockopt SO_DELEGATED_UUID for %s"));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("setsockopt SO_DELEGATED_UUID for %s"));
              }
            }
          }
        }
        v44 = fcntl(*(_DWORD *)v16, 3, 0, v64);
        if (v44 < 0 || fcntl(*(_DWORD *)v16, 4, v44 | 4u) < 0)
        {
          v47 = *__error();
          OSLogHandleForTransportCategory();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v93 = 67109120;
            *(_DWORD *)&v93[4] = v47;
            _os_log_impl(&dword_19B949000, v48, OS_LOG_TYPE_DEFAULT, "fcntl failed: %d", v93, 8u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("fcntl failed: %d"));
              if (_IDSShouldLog())
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("fcntl failed: %d"));
            }
          }
        }
        else
        {
          if ((connect(*(_DWORD *)v16, a6, a6->sa_len) & 0x80000000) == 0)
          {
            OSLogHandleForTransportCategory();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v93 = 0;
              _os_log_impl(&dword_19B949000, v45, OS_LOG_TYPE_DEFAULT, "asynchronous connect succeeded synchronously", v93, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("asynchronous connect succeeded synchronously"));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("asynchronous connect succeeded synchronously"));
              }
            }
            sub_19B99CD38((uint64_t)v16);
LABEL_80:

            SAToIPPortString(__str, 0x80uLL, (uint64_t)(v16 + 24));
            SAToIPPortString(v73, 0x80uLL, (uint64_t)(v16 + 152));
            OSLogHandleForTransportCategory();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v93 = 136315394;
              *(_QWORD *)&v93[4] = __str;
              *(_WORD *)&v93[12] = 2080;
              *(_QWORD *)&v93[14] = v73;
              _os_log_impl(&dword_19B949000, v46, OS_LOG_TYPE_DEFAULT, "opening TCP connection from %s to %s", v93, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("opening TCP connection from %s to %s"));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("opening TCP connection from %s to %s"));
              }
            }
            v32 = v67;
            *((_QWORD *)v16 + 39) = v68->_conns;
            v68->_conns = (IDSTCPConnection_ *)v16;
            goto LABEL_45;
          }
          v56 = *__error();
          if (v56 == 36)
          {
            v57 = *(_DWORD *)v16;
            v70[0] = MEMORY[0x1E0C809B0];
            v70[1] = 3221225472;
            v70[2] = sub_19B99CA5C;
            v70[3] = &unk_1E3C1C798;
            v70[4] = v16;
            IDSTransportThreadAddSocket(v57, 0, v70);
            OSLogHandleForTransportCategory();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              v59 = *(_DWORD *)v16;
              *(_DWORD *)v93 = 67109120;
              *(_DWORD *)&v93[4] = v59;
              _os_log_impl(&dword_19B949000, v58, OS_LOG_TYPE_DEFAULT, "connect in progress for fd: %d", v93, 8u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("connect in progress for fd: %d"));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("connect in progress for fd: %d"));
              }
            }
            goto LABEL_80;
          }
          OSLogHandleForTransportCategory();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v93 = 67109120;
            *(_DWORD *)&v93[4] = v56;
            _os_log_impl(&dword_19B949000, v61, OS_LOG_TYPE_DEFAULT, "connect failed: %d", v93, 8u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("connect failed: %d"));
              if (_IDSShouldLog())
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("connect failed: %d"));
            }
          }
        }
      }
    }
    else
    {
      OSLogHandleForTransportCategory();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v93 = 0;
        _os_log_impl(&dword_19B949000, v30, OS_LOG_TYPE_DEFAULT, "out of memory", v93, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("out of memory"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("out of memory"));
        }
      }
      if (!v16)
        goto LABEL_31;
    }
LABEL_30:
    sub_19B99C7C4((unsigned int *)v16);
LABEL_31:

    OSLogHandleForTransportCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v93 = 0;
      _os_log_impl(&dword_19B949000, v31, OS_LOG_TYPE_DEFAULT, "failed to create connection", v93, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("failed to create connection"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("failed to create connection"));
      }
    }
    v21 = 0;
    v32 = v67;
    goto LABEL_45;
  }
  OSLogHandleForTransportCategory();
  v33 = objc_claimAutoreleasedReturnValue();
  v32 = v14;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v93 = 0;
    _os_log_impl(&dword_19B949000, v33, OS_LOG_TYPE_DEFAULT, "link invalidated", v93, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("link invalidated"));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("link invalidated"));
    }
  }
  v21 = 0;
LABEL_45:

  return v21;
}

- (BOOL)disconnect:(sockaddr_in *)a3 remoteAddress:(sockaddr_in *)a4
{
  __int128 v4;
  IDSTCPConnection_ **p_conns;
  IDSTCPConnection_ *v6;
  IDSTCPConnection_ *conns;
  IDSTCPConnection_ *v8;
  IDSTCPConnection_ *v9;
  NSObject *v12;
  int v13;
  NSObject *v14;
  IDSTCPConnection_ **p_var11;
  int v16;
  uint8_t buf[4];
  uint8_t *v19;
  uint8_t v20[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!self->_getPacketLength)
  {
    OSLogHandleForTransportCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_19B949000, v14, OS_LOG_TYPE_DEFAULT, "link invalidated", v20, 2u);
    }

    v13 = os_log_shim_legacy_logging_enabled();
    if (!v13)
      return v13;
    v13 = _IDSShouldLogTransport();
    if (!v13)
      return v13;
    _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("link invalidated"));
    v13 = _IDSShouldLog();
    if (!v13)
      return v13;
    _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("link invalidated"));
LABEL_26:
    LOBYTE(v13) = 0;
    return v13;
  }
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v26 = v4;
  v27 = v4;
  v24 = v4;
  v25 = v4;
  v22 = v4;
  v23 = v4;
  *(_OWORD *)v20 = v4;
  v21 = v4;
  conns = self->_conns;
  p_conns = &self->_conns;
  v6 = conns;
  if (!conns)
  {
LABEL_14:
    SAToIPPortString((char *)v20, 0x80uLL, (uint64_t)a4);
    OSLogHandleForTransportCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = v20;
      _os_log_impl(&dword_19B949000, v12, OS_LOG_TYPE_DEFAULT, "no connection for %s", buf, 0xCu);
    }

    v13 = os_log_shim_legacy_logging_enabled();
    if (!v13)
      return v13;
    v13 = _IDSShouldLogTransport();
    if (!v13)
      return v13;
    _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("no connection for %s"));
    v13 = _IDSShouldLog();
    if (!v13)
      return v13;
    _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("no connection for %s"));
    goto LABEL_26;
  }
  v8 = 0;
  while (1)
  {
    v9 = v6;
    if (*(_QWORD *)&v6->var5.ss_len == *(_QWORD *)&a3->sin_len
      && v6->var5.__ss_align == *(_QWORD *)a3->sin_zero
      && *(_QWORD *)&v6->var6.ss_len == *(_QWORD *)&a4->sin_len
      && v6->var6.__ss_align == *(_QWORD *)a4->sin_zero)
    {
      break;
    }
    v6 = v6->var11;
    v8 = v9;
    if (!v6)
      goto LABEL_14;
  }
  if (v8)
    p_var11 = &v8->var11;
  else
    p_var11 = p_conns;
  *p_var11 = v6->var11;
  v16 = v6->var2 - 1;
  v6->var2 = v16;
  if (!v16)
    sub_19B99C7C4((unsigned int *)v6);
  LOBYTE(v13) = 1;
  return v13;
}

- (void)processIncomingPacket:(id *)a3
{
  const char *v5;
  double v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend_link_didReceivePacket_fromDeviceUniqueID_cbuuid_(WeakRetained, v5, (uint64_t)self, v6, a3, self->_deviceUniqueID, self->_cbuuid);

}

- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  double v5;
  $D38D7C82BC04D962879521F520F2ED6C *v7;

  v7 = a3;
  return objc_msgSend_sendPacketBufferArray_arraySize_toDeviceUniqueID_cbuuid_(self, a2, (uint64_t)&v7, v5, 1, a4, a5);
}

- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  id v10;
  id v11;
  const char *v12;
  double v13;
  void *v14;
  uint64_t IDSTCPConnection;
  uint64_t v16;
  double v17;
  uint64_t v18;
  NSObject *v19;
  unint64_t v20;
  __CFString *v21;
  NSObject *v22;
  NSObject *v23;
  NSString *cbuuid;
  NSObject *v25;
  uint64_t v26;
  uint64_t v28;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **v29;
  uint64_t v30;
  unsigned int v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  NSString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v14 = v11;
  if (!self->_getPacketLength)
  {
    OSLogHandleForTransportCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v22, OS_LOG_TYPE_DEFAULT, "link invalidated", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("link invalidated"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("link invalidated"));
      }
    }
    v20 = 6;
    goto LABEL_28;
  }
  if (v11 && (objc_msgSend_isEqualToString_(v11, v12, (uint64_t)self->_cbuuid, v13) & 1) == 0)
  {
    OSLogHandleForTransportCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      cbuuid = self->_cbuuid;
      *(_DWORD *)buf = 138412546;
      v33 = v14;
      v34 = 2112;
      v35 = cbuuid;
      _os_log_impl(&dword_19B949000, v23, OS_LOG_TYPE_DEFAULT, "wrong device: %@ %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("wrong device: %@ %@"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("wrong device: %@ %@"));
      }
    }
    v20 = 10;
    goto LABEL_28;
  }
  if (a4 < 1)
  {
    v20 = 11;
    goto LABEL_43;
  }
  IDSTCPConnection = objc_msgSend__getIDSTCPConnection_(self, v12, (uint64_t)*a3, v13);
  if (!IDSTCPConnection)
  {
    v20 = 11;
    goto LABEL_41;
  }
  v18 = IDSTCPConnection;
  if ((*(_DWORD *)IDSTCPConnection & 0x80000000) == 0)
  {
    if (*(_QWORD *)(IDSTCPConnection + 288))
    {
      OSLogHandleForTransportCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v19, OS_LOG_TYPE_DEFAULT, "drop packet", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("drop packet"));
        v20 = 0;
        if ((_IDSShouldLog() & 1) == 0)
          goto LABEL_41;
        v21 = CFSTR("drop packet");
LABEL_38:
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), v21);
        goto LABEL_41;
      }
      v20 = 0;
      goto LABEL_41;
    }
    if (*(_DWORD *)(IDSTCPConnection + 12))
    {
      v28 = a4;
      v29 = a3;
      do
      {
        v30 = (uint64_t)*v29++;
        v31 = bswap32(*(unsigned __int16 *)(v30 + 16) + 3) >> 16;
        IDSLinkPacketBufferAddBufferStart((_QWORD *)v30, (const char *)0xFFFFFFF8, v16, v17);
        **(_QWORD **)v30 = 66327;
        *(_WORD *)(*(_QWORD *)v30 + 3) = v31;
        --v28;
      }
      while (v28);
    }
    v20 = sub_19B99BBC4(v18);
    if (v20 == 14)
    {
      if (*(_BYTE *)(v18 + 4))
        v20 = 14;
      else
        v20 = 0;
    }
LABEL_28:
    if (a4 <= 0)
      goto LABEL_43;
    goto LABEL_41;
  }
  OSLogHandleForTransportCategory();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v25, OS_LOG_TYPE_DEFAULT, "connection closed", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("connection closed"));
    v20 = 6;
    if ((_IDSShouldLog() & 1) == 0)
      goto LABEL_41;
    v21 = CFSTR("connection closed");
    goto LABEL_38;
  }
  v20 = 6;
LABEL_41:
  v26 = a4;
  do
  {
    _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSTCPLink.m", (const char *)0x40E, (uint64_t)*a3++, v17);
    --v26;
  }
  while (v26);
LABEL_43:

  return v20;
}

- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4
{
  double previousReportTime;
  double v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  unint64_t totalPacketsSent;
  const char *v14;
  double v15;
  void *v16;
  unint64_t v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  void *v22;
  unint64_t totalPacketsReceived;
  const char *v24;
  double v25;
  const char *v26;
  void *v27;
  double v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  _BOOL4 v33;
  unint64_t v34;
  void *v35;

  previousReportTime = self->_previousReportTime;
  if (previousReportTime == 0.0)
  {
    v30 = 0;
  }
  else
  {
    v7 = a3 - previousReportTime;
    v8 = self->_counters._totalBytesSent - self->_previousCounters._totalBytesSent;
    v9 = self->_counters._totalBytesReceived - self->_previousCounters._totalBytesReceived;
    v34 = self->_counters._totalPacketsSent - self->_previousCounters._totalPacketsSent;
    v35 = (void *)MEMORY[0x1E0CB3940];
    v33 = a4;
    formattedBytes(v8, a2, previousReportTime);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    formattedSpeed((unint64_t)((double)(8 * v8) / v7 + 0.5), v11, (double)(8 * v8) / v7 + 0.5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    totalPacketsSent = self->_counters._totalPacketsSent;
    formattedBytes(self->_counters._totalBytesSent, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self->_counters._totalPacketsReceived - self->_previousCounters._totalPacketsReceived;
    formattedBytes(v9, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    formattedSpeed((unint64_t)((double)(8 * v9) / v7 + 0.5), v21, (double)(8 * v9) / v7 + 0.5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    totalPacketsReceived = self->_counters._totalPacketsReceived;
    formattedBytes(self->_counters._totalBytesReceived, v24, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 32;
    if (v33)
      v29 = 42;
    objc_msgSend_stringWithFormat_(v35, v26, (uint64_t)CFSTR("%c Tx %6llu pkts %@B %@bps     %6llu pkts %@B\n                        Rx %6llu pkts %@B %@bps     %6llu pkts %@B\n"), v28, v29, v34, v10, v12, totalPacketsSent, v16, v17, v20, v22, totalPacketsReceived, v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  self->_previousReportTime = a3;
  v31 = *(_OWORD *)&self->_counters._totalBytesReceived;
  *(_OWORD *)&self->_previousCounters._totalBytesSent = *(_OWORD *)&self->_counters._totalBytesSent;
  *(_OWORD *)&self->_previousCounters._totalBytesReceived = v31;
  return v30;
}

- (void)setWiFiAssistState:(BOOL)a3
{
  IDSTCPConnection_ *conns;
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  int var0;
  int v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  conns = self->_conns;
  if (conns)
  {
    v4 = a3;
    if (a3)
      v6 = 1;
    else
      v6 = 2;
    v7 = 136315650;
    do
    {
      if (objc_msgSend_containsIndex_(self->_cellularInterfaceIndices, a2, conns->var10, *(double *)&v7, v12, v13, v14))
      {
        var0 = conns->var0;
        v15 = v6;
        v16 = v4;
        v9 = setsockopt(var0, 0xFFFF, 4387, &v15, 8u);
        if (!v9)
          v9 = setsockopt(var0, 0xFFFF, 4373, &v16, 4u);
        if (v9 == -1)
        {
          OSLogHandleForTransportCategory();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v11 = *__error();
            *(_DWORD *)buf = 136315650;
            v18 = "-[IDSTCPLink setWiFiAssistState:]";
            v19 = 1024;
            v20 = 1087;
            v21 = 1024;
            v22 = v11;
            _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d setsockopt failed %d", buf, 0x18u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
          {
            v13 = 1087;
            v14 = *__error();
            v12 = "-[IDSTCPLink setWiFiAssistState:]";
            _IDSLogTransport(CFSTR("TCPLink"), CFSTR("IDS"), CFSTR("%s:%d setsockopt failed %d"));
            if (_IDSShouldLog())
            {
              v13 = 1087;
              v14 = *__error();
              v12 = "-[IDSTCPLink setWiFiAssistState:]";
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("TCPLink"), CFSTR("%s:%d setsockopt failed %d"));
            }
          }
        }
        else
        {
          self->_wifiAssistEnabled = v4;
        }
      }
      conns = conns->var11;
    }
    while (conns);
  }
}

- (NSString)cbuuid
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCbuuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)deviceUniqueID
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDeviceUniqueID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (IDSLinkDelegate)delegate
{
  return (IDSLinkDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isSSL
{
  return self->_isSSL;
}

- (unint64_t)state
{
  return self->_state;
}

- (IDSLinkDelegate)alternateDelegate
{
  return (IDSLinkDelegate *)objc_loadWeakRetained((id *)&self->_alternateDelegate);
}

- (void)setAlternateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_alternateDelegate, a3);
}

- (NSIndexSet)cellularInterfaceIndices
{
  return self->_cellularInterfaceIndices;
}

- (void)setCellularInterfaceIndices:(id)a3
{
  objc_storeStrong((id *)&self->_cellularInterfaceIndices, a3);
}

- (BOOL)wifiAssistEnabled
{
  return self->_wifiAssistEnabled;
}

- (void)setWifiAssistEnabled:(BOOL)a3
{
  self->_wifiAssistEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularInterfaceIndices, 0);
  objc_destroyWeak((id *)&self->_alternateDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deviceUniqueID, 0);
  objc_storeStrong((id *)&self->_cbuuid, 0);
  objc_storeStrong(&self->_getPacketLength, 0);
}

@end
