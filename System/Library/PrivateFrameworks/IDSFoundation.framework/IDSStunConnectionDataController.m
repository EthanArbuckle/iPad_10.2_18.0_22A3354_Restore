@implementation IDSStunConnectionDataController

+ (id)sharedInstance
{
  if (qword_1ECDD47D8 != -1)
    dispatch_once(&qword_1ECDD47D8, &unk_1E3C1B970);
  return (id)qword_1ECDD4828;
}

- (id)dataFromCandidates:(id)a3 token:(id)a4 remoteDeviceVersion:(unsigned int)a5
{
  NSMutableDictionary *tokenToConnectionData;
  void *v8;
  id v9;
  __int128 v10;
  const char *v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  unint64_t v22;
  double v23;
  uint64_t v24;
  const char *v25;
  double v26;
  NSObject *v27;
  uint64_t v28;
  int v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  double v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;
  double v37;
  int v38;
  int v39;
  const char *v40;
  uint64_t v41;
  double v42;
  char v43;
  NSObject *v45;
  int v46;
  const char *v47;
  double v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  const char *v54;
  double v55;
  _BOOL4 v56;
  uint64_t v57;
  char *v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  char *v64;
  NSObject *v65;
  NSObject *v66;
  __CFString *v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  size_t v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  char *v76;
  int64_t v77;
  const char *v78;
  double v79;
  void *v80;
  NSObject *v81;
  IDSStunConnectionDataController *v82;
  CFMutableDictionaryRef Mutable;
  NSMutableDictionary *v84;
  id v85;
  void *v86;
  uint64_t v87;
  IDSStunConnectionDataController *v88;
  id key;
  id v90;
  int v91;
  int v93;
  uint64_t v94;
  id obj;
  CFMutableArrayRef theArray;
  _OWORD *v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  char *v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint8_t buf[4];
  _BYTE v107[10];
  _BYTE v108[10];
  __int16 v109;
  int v110;
  __int16 v111;
  int v112;
  _BYTE v113[134];
  _WORD __b[725];
  _OWORD __src[32];
  _OWORD v116[32];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v90 = a3;
  key = a4;
  v88 = self;
  if (key)
  {
    tokenToConnectionData = self->_tokenToConnectionData;
    if (tokenToConnectionData)
    {
      v8 = (id)CFDictionaryGetValue((CFDictionaryRef)tokenToConnectionData, key);
      if (v8)
      {
        v9 = v8;
        goto LABEL_121;
      }
    }
  }
  theArray = (CFMutableArrayRef)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v116[31] = v10;
  v116[30] = v10;
  v116[29] = v10;
  v116[28] = v10;
  v116[27] = v10;
  v116[26] = v10;
  v116[25] = v10;
  v116[24] = v10;
  v116[23] = v10;
  v116[22] = v10;
  v116[21] = v10;
  v116[20] = v10;
  v116[19] = v10;
  v116[18] = v10;
  v116[17] = v10;
  v116[16] = v10;
  v116[15] = v10;
  v116[14] = v10;
  v116[13] = v10;
  v116[12] = v10;
  v116[11] = v10;
  v116[10] = v10;
  v116[9] = v10;
  v116[8] = v10;
  v116[7] = v10;
  v116[6] = v10;
  v116[5] = v10;
  v116[4] = v10;
  v116[3] = v10;
  v116[2] = v10;
  v116[1] = v10;
  v116[0] = v10;
  __src[31] = v10;
  __src[30] = v10;
  __src[29] = v10;
  __src[28] = v10;
  __src[27] = v10;
  __src[26] = v10;
  __src[25] = v10;
  __src[24] = v10;
  __src[23] = v10;
  __src[22] = v10;
  __src[21] = v10;
  __src[20] = v10;
  __src[19] = v10;
  __src[18] = v10;
  __src[17] = v10;
  __src[16] = v10;
  __src[15] = v10;
  __src[14] = v10;
  __src[13] = v10;
  __src[12] = v10;
  __src[11] = v10;
  __src[10] = v10;
  __src[9] = v10;
  __src[8] = v10;
  __src[7] = v10;
  __src[6] = v10;
  __src[5] = v10;
  __src[4] = v10;
  __src[3] = v10;
  __src[2] = v10;
  __src[1] = v10;
  __src[0] = v10;
  memset(__b, 170, sizeof(__b));
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  obj = v90;
  v100 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v102, v12, v113, 16);
  v101 = (char *)__src;
  v97 = v116;
  if (!v100)
  {
    LODWORD(v99) = 0;
    v91 = 0;
    goto LABEL_84;
  }
  v99 = 0;
  v15 = 0;
  v91 = 0;
  v16 = 138412290;
  v94 = *(_QWORD *)v103;
  for (i = *(_QWORD *)v103; ; i = *(_QWORD *)v103)
  {
    if (i != v94)
    {
      v18 = v15;
      objc_enumerationMutation(obj);
      v15 = v18;
    }
    v98 = v15;
    v19 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v15);
    v22 = objc_msgSend_type(v19, v13, v14, *(double *)&v16, v86);
    if (v22)
    {
      v24 = objc_msgSend_external(v19, v20, v21, v23);
      if (v22 >= 3)
      {
        OSLogHandleForTransportCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v107 = v19;
          _os_log_impl(&dword_19B949000, v27, OS_LOG_TYPE_DEFAULT, "skip candidate %@ due to invalid type.", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v86 = v19;
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("skip candidate %@ due to invalid type."));
            if (_IDSShouldLog())
            {
              v86 = v19;
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("skip candidate %@ due to invalid type."));
            }
          }
        }
LABEL_64:
        v63 = v99;
        v64 = v101;
        goto LABEL_65;
      }
      v28 = v24;
      v29 = *(unsigned __int8 *)(v24 + 1);
      if (v22 == 1 && !IsValidSA(v24))
      {
        OSLogHandleForTransportCategory();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v107 = v19;
          _os_log_impl(&dword_19B949000, v65, OS_LOG_TYPE_DEFAULT, "skip candidate %@ with invalid external address.", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v86 = v19;
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("skip candidate %@ with invalid external address."));
            if (_IDSShouldLog())
            {
              v86 = v19;
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("skip candidate %@ with invalid external address."));
            }
          }
        }
        goto LABEL_64;
      }
    }
    else
    {
      v28 = objc_msgSend_address(v19, v20, v21, v23);
      v29 = *(unsigned __int8 *)(v28 + 1);
    }
    if (v29 == 2)
    {
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v25, *(unsigned int *)(v28 + 4), v26);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = 0;
    }
    else
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v25, v28 + 8, v26, 16);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = 0x8000;
    }
    v34 = *(_WORD *)(v28 + 2);
    if (objc_msgSend_active(v19, v30, v31, v33))
      v38 = 0x4000;
    else
      v38 = 0;
    v39 = objc_msgSend_radioAccessTechnology(v19, v35, v36, v37);
    v43 = v39;
    if (v39 == 9 && a5 < 3)
    {
      OSLogHandleForTransportCategory();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v45, OS_LOG_TYPE_DEFAULT, "RATType Wired -> NonCell due to remote version", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("RATType Wired -> NonCell due to remote version"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("RATType Wired -> NonCell due to remote version"));
        }
      }
      v43 = 0;
    }
    v46 = objc_msgSend_linkFlags(v19, v40, v41, v42);
    v51 = objc_msgSend_indexOfObject_(theArray, v47, (uint64_t)v32, v48);
    if (v51 == 0x7FFFFFFFFFFFFFFFLL)
      break;
LABEL_50:
    if ((char *)v116 - v101 <= 3)
    {
      OSLogHandleForTransportCategory();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v107 = v19;
        _os_log_impl(&dword_19B949000, v66, OS_LOG_TYPE_DEFAULT, "candidate buffer full, candidate: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("candidate buffer full, candidate: %@"));
          if ((_IDSShouldLog() & 1) != 0)
          {
            v67 = CFSTR("candidate buffer full, candidate: %@");
LABEL_82:
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), v67);
            goto LABEL_83;
          }
        }
      }
      goto LABEL_83;
    }
    OSLogHandleForTransportCategory();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v107 = v19;
      *(_WORD *)&v107[8] = 2048;
      *(_QWORD *)v108 = v51;
      _os_log_impl(&dword_19B949000, v59, OS_LOG_TYPE_DEFAULT, "candidate %@, ip_index [%lu]", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v86 = v19;
        v87 = v51;
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("candidate %@, ip_index [%lu]"));
        if (_IDSShouldLog())
        {
          v86 = v19;
          v87 = v51;
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("candidate %@, ip_index [%lu]"));
        }
      }
    }
    *(_WORD *)v101 = bswap32(v51 & 0x1F | (32 * (objc_msgSend_transport(v19, v60, v61, v62, v86, v87) & 7)) | ((_DWORD)v22 << 12)) >> 16;
    *((_WORD *)v101 + 1) = v34;

    v63 = (v99 + 1);
    v64 = v101 + 4;
LABEL_65:
    v15 = v98 + 1;
    v99 = v63;
    v101 = v64;
    if (v98 + 1 >= v100)
    {
      v100 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v102, *(double *)&v16, v113, 16);
      if (!v100)
        goto LABEL_84;
      v15 = 0;
    }
  }
  v53 = 18;
  if (v29 == 2)
    v53 = 6;
  if ((char *)&v117 - (char *)v97 >= v53)
  {
    v51 = objc_msgSend_count(theArray, v49, v50, v52);
    if (v32)
      v56 = theArray != 0;
    else
      v56 = 0;
    if (v56)
      CFArrayAppendValue(theArray, v32);
    ++v91;
    *(_WORD *)v97 = ((v46 << 7) & 0x200 | ((v43 & 0xF) << 10) | v38 | v93) >> 8;
    v57 = (uint64_t)v97 + 2;
    if (v29 == 2)
    {
      *(_DWORD *)((char *)v97 + 2) = objc_msgSend_unsignedIntValue(v32, v54, v57, v55);
      v58 = (char *)v97 + 6;
    }
    else
    {
      objc_msgSend_getBytes_length_(v32, v54, v57, v55, 16);
      v58 = (char *)v97 + 18;
    }
    v97 = v58;
    goto LABEL_50;
  }
  OSLogHandleForTransportCategory();
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v107 = v19;
    _os_log_impl(&dword_19B949000, v68, OS_LOG_TYPE_DEFAULT, "IP buffer full, candidate: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("IP buffer full, candidate: %@"));
      if ((_IDSShouldLog() & 1) != 0)
      {
        v67 = CFSTR("IP buffer full, candidate: %@");
        goto LABEL_82;
      }
    }
  }
LABEL_83:

LABEL_84:
  if (((char *)v97 - (char *)v116) - 1451 <= 0xFFFFFA55)
  {
    OSLogHandleForTransportCategory();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v107 = (char *)v97 - (char *)v116;
      _os_log_impl(&dword_19B949000, v69, OS_LOG_TYPE_DEFAULT, "invalid buffer length for IP list (%d).", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("invalid buffer length for IP list (%d)."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("invalid buffer length for IP list (%d)."));
      }
    }
    goto LABEL_119;
  }
  if ((v101 - (char *)__src) - 1451 <= 0xFFFFFA55)
  {
    OSLogHandleForTransportCategory();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v107 = v101 - (char *)__src;
      _os_log_impl(&dword_19B949000, v70, OS_LOG_TYPE_DEFAULT, "invalid buffer length for candidate list (%d).", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("invalid buffer length for candidate list (%d)."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("invalid buffer length for candidate list (%d)."));
      }
    }
    goto LABEL_119;
  }
  v71 = (v101 - (char *)__src);
  if (v71 + ((char *)v97 - (char *)v116) + 2 >= 0x5AB)
  {
    OSLogHandleForTransportCategory();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v107 = (char *)v97 - (char *)v116;
      *(_WORD *)&v107[4] = 1024;
      *(_DWORD *)&v107[6] = v101 - (char *)__src;
      _os_log_impl(&dword_19B949000, v72, OS_LOG_TYPE_DEFAULT, "invalid total buffer length: %d %d", buf, 0xEu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("invalid total buffer length: %d %d"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("invalid total buffer length: %d %d"));
      }
    }
    goto LABEL_119;
  }
  if (v91 >= 32)
  {
    OSLogHandleForTransportCategory();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v107 = v91;
      _os_log_impl(&dword_19B949000, v73, OS_LOG_TYPE_DEFAULT, "IP list reached max number (%u).", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("IP list reached max number (%u)."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("IP list reached max number (%u)."));
      }
    }
    goto LABEL_119;
  }
  if ((int)v99 < 64)
  {
    __b[0] = bswap32(v99 | (v91 << 6) | 0x2000) >> 16;
    __memcpy_chk();
    v76 = (char *)&__b[1] + ((char *)v97 - (char *)v116);
    memcpy(v76, __src, v71);
    v77 = &v76[v71] - (char *)__b;
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v78, (uint64_t)__b, v79, (int)v77);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    OSLogHandleForTransportCategory();
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)v107 = key;
      *(_WORD *)&v107[8] = 1024;
      *(_DWORD *)v108 = 1;
      *(_WORD *)&v108[4] = 1024;
      *(_DWORD *)&v108[6] = v91;
      v109 = 1024;
      v110 = v99;
      v111 = 1024;
      v112 = v77;
      _os_log_impl(&dword_19B949000, v81, OS_LOG_TYPE_DEFAULT, "new connection data for %@ (V:%1d #IP:%d #CAN:%d LEN:%dB).", buf, 0x24u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("new connection data for %@ (V:%1d #IP:%d #CAN:%d LEN:%dB)."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("new connection data for %@ (V:%1d #IP:%d #CAN:%d LEN:%dB)."));
      }
    }
    v82 = v88;
    if (!v88->_tokenToConnectionData)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v84 = v88->_tokenToConnectionData;
      v88->_tokenToConnectionData = (NSMutableDictionary *)Mutable;

      v82 = v88;
    }
    v85 = v80;
    if (v85)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v82->_tokenToConnectionData, key, v85);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_19BAF96A0();
    }

    v9 = v85;
  }
  else
  {
    OSLogHandleForTransportCategory();
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v107 = v99;
      _os_log_impl(&dword_19B949000, v74, OS_LOG_TYPE_DEFAULT, "reached max number of candidate: %u.", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("reached max number of candidate: %u."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("reached max number of candidate: %u."));
      }
    }
LABEL_119:
    v9 = 0;
  }

LABEL_121:
  return v9;
}

- (id)candidatesFromData:(id)a3 token:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  int v9;
  id v10;
  const char *v11;
  uint64_t v12;
  double v13;
  unsigned __int16 *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  unint64_t v18;
  NSObject *v19;
  __CFArray *v20;
  unint64_t v21;
  unsigned __int16 *v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  NSObject *v27;
  const char *v28;
  double v29;
  unint64_t v30;
  void *v31;
  int v32;
  void *v33;
  unsigned int *v34;
  int v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BOOL4 v39;
  void *v40;
  BOOL v41;
  void *v42;
  const char *v43;
  int v44;
  uint64_t v45;
  unsigned __int16 *v46;
  unsigned int v47;
  unsigned __int16 v48;
  void *v49;
  const char *v50;
  double v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  uint64_t v56;
  NSObject *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  double v61;
  unsigned __int16 v62;
  const char *v63;
  uint64_t v64;
  double v65;
  unsigned int v66;
  id v67;
  const char *v68;
  uint64_t v69;
  double v70;
  uint64_t v71;
  __int16 v72;
  __int16 v73;
  int v74;
  int v75;
  __int16 LinkOverhead;
  const char *v77;
  double v78;
  void *v79;
  const char *v80;
  double v81;
  const char *v82;
  double v83;
  NSObject *v84;
  NSObject *v85;
  NSObject *v86;
  NSObject *v87;
  NSObject *v88;
  id v89;
  const char *v90;
  uint64_t v91;
  double v92;
  NSObject *v93;
  NSObject *v94;
  NSObject *v96;
  int v97;
  __CFArray *v98;
  id v99;
  id v100;
  int v101;
  __CFArray *v102;
  __CFArray *theArray;
  unsigned int v104;
  uint8_t v105[4];
  unint64_t v106;
  __int16 v107;
  unsigned int v108;
  uint8_t buf[48];
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v99 = a4;
  v9 = objc_msgSend_length(v5, v6, v7, v8);
  v10 = objc_retainAutorelease(v5);
  v14 = (unsigned __int16 *)objc_msgSend_bytes(v10, v11, v12, v13);
  v100 = v10;
  v18 = objc_msgSend_length(v10, v15, v16, v17);
  if (v18 > 1)
  {
    v21 = v18;
    v23 = *v14;
    v22 = v14 + 1;
    v24 = bswap32(v23);
    v25 = v24 >> 29;
    v26 = HIWORD(v24) & 0x1000;
    v104 = (v24 >> 22) & 0x1F;
    v101 = HIWORD(v24) & 0x3F;
    v97 = v9;
    OSLogHandleForTransportCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&buf[4] = v25;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v26 >> 12;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v104;
      *(_WORD *)&buf[20] = 1024;
      *(_DWORD *)&buf[22] = v101;
      *(_WORD *)&buf[26] = 2112;
      *(_QWORD *)&buf[28] = v100;
      _os_log_impl(&dword_19B949000, v27, OS_LOG_TYPE_DEFAULT, "receive connection data (ver:%u ext:%d numIP:%d numCandidate:%d) %@.", buf, 0x24u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive connection data (ver:%u ext:%d numIP:%d numCandidate:%d) %@."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive connection data (ver:%u ext:%d numIP:%d numCandidate:%d) %@."));
      }
    }
    theArray = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v102 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = v21 - 2;
    if (v104)
    {
      v31 = 0;
      v32 = 0;
      while (1)
      {
        v33 = v31;
        if (v30 <= 1)
          break;
        v34 = (unsigned int *)(v22 + 1);
        v35 = (int)bswap32(*v22) >> 16;
        v36 = v30 - 2;
        if (v35 < 0)
        {
          if (v36 <= 0xF)
          {
            OSLogHandleForTransportCategory();
            v94 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v32;
              _os_log_impl(&dword_19B949000, v94, OS_LOG_TYPE_DEFAULT, "Error: connectionData is too short for IPv6 address, i = %d", buf, 8u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Error: connectionData is too short for IPv6 address, i = %d"));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Error: connectionData is too short for IPv6 address, i = %d"));
              }
            }
            goto LABEL_142;
          }
          objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v28, (uint64_t)v34, v29, 16);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = -18;
          v38 = 18;
        }
        else
        {
          if (v36 <= 3)
          {
            OSLogHandleForTransportCategory();
            v86 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v32;
              _os_log_impl(&dword_19B949000, v86, OS_LOG_TYPE_DEFAULT, "Error: connectionData is too short for IPv4 address, i = %d", buf, 8u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Error: connectionData is too short for IPv4 address, i = %d"));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Error: connectionData is too short for IPv4 address, i = %d"));
              }
            }
            goto LABEL_142;
          }
          objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v28, *v34, v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = -6;
          v38 = 6;
        }

        if (v31)
          v39 = theArray != 0;
        else
          v39 = 0;
        if (v39)
          CFArrayAppendValue(theArray, v31);
        if (v102)
        {
          objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v28, (unsigned __int16)v35, v29);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v40 == 0;

          if (!v41)
          {
            objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v28, (unsigned __int16)v35, v29);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            CFArrayAppendValue(v102, v42);

          }
        }
        v22 = (unsigned __int16 *)((char *)v22 + v38);
        v30 += v37;
        if (v104 == ++v32)
          goto LABEL_34;
      }
      OSLogHandleForTransportCategory();
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v32;
        _os_log_impl(&dword_19B949000, v85, OS_LOG_TYPE_DEFAULT, "Error: connectionData is too short for header, i = %d", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Error: connectionData is too short for header, i = %d"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Error: connectionData is too short for header, i = %d"));
        }
      }
LABEL_142:
      v20 = 0;
      goto LABEL_143;
    }
    v31 = 0;
LABEL_34:
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v110 = 0u;
    memset(buf, 0, sizeof(buf));
    v98 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v101)
    {
      v44 = 0;
      v45 = 134218240;
      while (v30 > 1)
      {
        if ((v30 & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          OSLogHandleForTransportCategory();
          v88 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v105 = 67109120;
            LODWORD(v106) = v44;
            _os_log_impl(&dword_19B949000, v88, OS_LOG_TYPE_DEFAULT, "Error: connectionData is too short for port, i = %d", v105, 8u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Error: connectionData is too short for port, i = %d"));
              if (_IDSShouldLog())
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Error: connectionData is too short for port, i = %d"));
            }
          }
          goto LABEL_134;
        }
        v46 = v22;
        v47 = bswap32(*v22) >> 16;
        if ((v47 & 0x1F) >= v104)
        {
          OSLogHandleForTransportCategory();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v105 = 134218240;
            v106 = v47 & 0x1F;
            v107 = 1024;
            v108 = v104;
            _os_log_impl(&dword_19B949000, v54, OS_LOG_TYPE_DEFAULT, "invalid ip_index (%lu >= %d).", v105, 0x12u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("invalid ip_index (%lu >= %d)."));
              if (_IDSShouldLog())
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("invalid ip_index (%lu >= %d)."));
            }
          }
        }
        else
        {
          v48 = v22[1];
          objc_msgSend_objectAtIndex_(theArray, v43, v47 & 0x1F, *(double *)&v45);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (v49)
          {
            v52 = v47 >> 12;
            if (v47 < 0x4000)
            {
              v56 = v47 >> 5;
              if (v56 < 5)
              {
                objc_msgSend_objectAtIndex_(v102, v50, v47 & 0x1F, v51);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v62 = objc_msgSend_unsignedShortValue(v58, v59, v60, v61);

                if ((__int16)v62 < 0)
                {
                  memset(&buf[8], 0, 20);
                  *(_QWORD *)buf = 7708;
                  *(_WORD *)&buf[2] = v48;
                  if ((unint64_t)objc_msgSend_length(v49, v63, v64, v65) <= 0xF)
                  {
                    OSLogHandleForTransportCategory();
                    v96 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v105 = 67109120;
                      LODWORD(v106) = v44;
                      _os_log_impl(&dword_19B949000, v96, OS_LOG_TYPE_DEFAULT, "Error: connectionData is too short for sin6_addr.s6_addr, i = %d", v105, 8u);
                    }

                    if (os_log_shim_legacy_logging_enabled())
                    {
                      if (_IDSShouldLogTransport())
                      {
                        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Error: connectionData is too short for sin6_addr.s6_addr, i = %d"));
                        if (_IDSShouldLog())
                          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Error: connectionData is too short for sin6_addr.s6_addr, i = %d"));
                      }
                    }
                    v20 = 0;
                    v31 = v49;
                    goto LABEL_135;
                  }
                  v67 = objc_retainAutorelease(v49);
                  *(_OWORD *)&buf[8] = *(_OWORD *)objc_msgSend_bytes(v67, v68, v69, v70);
                  v66 = 1280;
                }
                else
                {
                  *(_QWORD *)&buf[8] = 0;
                  *(_QWORD *)buf = 528;
                  *(_WORD *)&buf[2] = v48;
                  *(_DWORD *)&buf[4] = objc_msgSend_unsignedLongValue(v49, v63, v64, v65);
                  v66 = 1450;
                }
                v71 = ((__int16)v62 >> 10) & 0xF;
                if (v66 >= 0x578)
                  v72 = 1400;
                else
                  v72 = v66;
                if ((_DWORD)v71 == 9)
                  v72 = v66;
                if ((_DWORD)v71)
                  v73 = v72;
                else
                  v73 = v66;
                if ((_DWORD)v56 == 3)
                  v74 = 896;
                else
                  v74 = 0;
                if ((_DWORD)v56 == 2)
                  v74 = 4;
                if ((v62 & 0x8000u) == 0)
                  v75 = 1;
                else
                  v75 = 2;
                LinkOverhead = GLUtilGetLinkOverhead(v75 | v74);
                objc_msgSend_candidateWithType_transport_radioAccessTechnology_mtu_index_address_external_(IDSStunCandidate, v77, v52, v78, v56, v71, (unsigned __int16)(v73 - LinkOverhead), 0xFFFFFFFFLL, buf, buf);
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setActive_(v79, v80, (v62 >> 14) & 1, v81);
                if ((v62 & 0x200) != 0)
                  objc_msgSend_setLinkFlags_(v79, v82, 4, v83);
                if (v98 && v79)
                  CFArrayAppendValue(v98, v79);
                OSLogHandleForTransportCategory();
                v84 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v105 = 138412290;
                  v106 = (unint64_t)v79;
                  _os_log_impl(&dword_19B949000, v84, OS_LOG_TYPE_DEFAULT, "receive remote candidate %@.", v105, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive remote candidate %@."));
                    if (_IDSShouldLog())
                      _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive remote candidate %@."));
                  }
                }

              }
              else
              {
                OSLogHandleForTransportCategory();
                v57 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v105 = 134217984;
                  v106 = v47 >> 5;
                  _os_log_impl(&dword_19B949000, v57, OS_LOG_TYPE_DEFAULT, "candidatesFromData: transport is invalid: %lu.", v105, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("candidatesFromData: transport is invalid: %lu."));
                    if (_IDSShouldLog())
                      _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("candidatesFromData: transport is invalid: %lu."));
                  }
                }
              }
            }
            else
            {
              OSLogHandleForTransportCategory();
              v53 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v105 = 134217984;
                v106 = v47 >> 12;
                _os_log_impl(&dword_19B949000, v53, OS_LOG_TYPE_DEFAULT, "candidatesFromData: IDSStunCandidateType is invalid: %lu.", v105, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("candidatesFromData: IDSStunCandidateType is invalid: %lu."));
                  if (_IDSShouldLog())
                    _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("candidatesFromData: IDSStunCandidateType is invalid: %lu."));
                }
              }
            }
            v31 = v49;
          }
          else
          {
            OSLogHandleForTransportCategory();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v105 = 134217984;
              v106 = v47 & 0x1F;
              _os_log_impl(&dword_19B949000, v55, OS_LOG_TYPE_DEFAULT, "found no ipAdderss at index %lu.", v105, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("found no ipAdderss at index %lu."));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("found no ipAdderss at index %lu."));
              }
            }
            v31 = 0;
          }
        }
        ++v44;
        v30 -= 4;
        v22 = v46 + 2;
        if (v101 == v44)
        {
          LODWORD(v22) = (_DWORD)v46 + 4;
          goto LABEL_126;
        }
      }
      OSLogHandleForTransportCategory();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 67109120;
        LODWORD(v106) = v44;
        _os_log_impl(&dword_19B949000, v87, OS_LOG_TYPE_DEFAULT, "Error: connectionData is too short for candidateHeader, i = %d", v105, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Error: connectionData is too short for candidateHeader, i = %d"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Error: connectionData is too short for candidateHeader, i = %d"));
        }
      }
    }
    else
    {
LABEL_126:
      v89 = objc_retainAutorelease(v100);
      if ((_DWORD)v22 - objc_msgSend_bytes(v89, v90, v91, v92) == v97)
      {
        v20 = v98;
LABEL_135:

        v33 = v31;
LABEL_143:

        goto LABEL_144;
      }
      OSLogHandleForTransportCategory();
      v93 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 67109120;
        LODWORD(v106) = v97;
        _os_log_impl(&dword_19B949000, v93, OS_LOG_TYPE_DEFAULT, "invalid connection data length (%d).", v105, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("invalid connection data length (%d)."));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("invalid connection data length (%d)."));
        }
      }
    }
LABEL_134:
    v20 = 0;
    goto LABEL_135;
  }
  OSLogHandleForTransportCategory();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v19, OS_LOG_TYPE_DEFAULT, "Error: connectionData is too short for header", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Error: connectionData is too short for header"));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Error: connectionData is too short for header"));
    }
  }
  v20 = 0;
LABEL_144:

  return v20;
}

- (unint64_t)deliveryStatus:(id)a3
{
  double v3;
  void *Value;
  NSMutableDictionary *tokenToDeliveryStatus;

  Value = 0;
  if (a3)
  {
    tokenToDeliveryStatus = self->_tokenToDeliveryStatus;
    if (tokenToDeliveryStatus)
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)tokenToDeliveryStatus, a3);
  }
  return objc_msgSend_unsignedIntegerValue(Value, a2, (uint64_t)a3, v3);
}

- (void)setDeliveryStatus:(id)a3 status:(unint64_t)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  double v9;
  const __CFDictionary *tokenToDeliveryStatus;
  uint64_t v11;
  const char *v12;
  double v13;
  uint64_t v14;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    tokenToDeliveryStatus = (const __CFDictionary *)self->_tokenToDeliveryStatus;
    if (tokenToDeliveryStatus)
      tokenToDeliveryStatus = (const __CFDictionary *)CFDictionaryGetValue(tokenToDeliveryStatus, v8);
    v11 = objc_msgSend_unsignedIntegerValue(tokenToDeliveryStatus, v6, v7, v9);
    if (v11 != a4)
    {
      v14 = v11;
      if (!self->_tokenToDeliveryStatus)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v16 = self->_tokenToDeliveryStatus;
        self->_tokenToDeliveryStatus = Mutable;

      }
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v12, a4, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)self->_tokenToDeliveryStatus, v8, v17);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        sub_19BAF9718();
      }

      OSLogHandleForTransportCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v21 = v8;
        v22 = 2048;
        v23 = v14;
        v24 = 2048;
        v25 = a4;
        _os_log_impl(&dword_19B949000, v19, OS_LOG_TYPE_DEFAULT, "set connection data delivery status for %@ (%lu->%lu).", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("set connection data delivery status for %@ (%lu->%lu)."));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("set connection data delivery status for %@ (%lu->%lu)."));
        }
      }
    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v18, OS_LOG_TYPE_DEFAULT, "set connection data delivery status failed due to invalid token.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("LC_GLOBALLINK"), CFSTR("IDS"), CFSTR("set connection data delivery status failed due to invalid token."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("LC_GLOBALLINK"), CFSTR("set connection data delivery status failed due to invalid token."));
      }
    }
  }

}

- (void)removeData:(id)a3
{
  id v4;
  NSMutableDictionary *tokenToConnectionData;
  NSMutableDictionary *tokenToDeliveryStatus;
  NSObject *v7;
  NSObject *v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    tokenToConnectionData = self->_tokenToConnectionData;
    if (tokenToConnectionData)
      CFDictionaryRemoveValue((CFMutableDictionaryRef)tokenToConnectionData, v4);
    tokenToDeliveryStatus = self->_tokenToDeliveryStatus;
    if (tokenToDeliveryStatus)
      CFDictionaryRemoveValue((CFMutableDictionaryRef)tokenToDeliveryStatus, v4);
    OSLogHandleForTransportCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_19B949000, v7, OS_LOG_TYPE_DEFAULT, "removed connection data for %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("removed connection data for %@."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("removed connection data for %@."));
      }
    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v8, OS_LOG_TYPE_DEFAULT, "remove connection data failed due to invalid token.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("LC_GLOBALLINK"), CFSTR("IDS"), CFSTR("remove connection data failed due to invalid token."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("LC_GLOBALLINK"), CFSTR("remove connection data failed due to invalid token."));
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenToDeliveryStatus, 0);
  objc_storeStrong((id *)&self->_tokenToConnectionData, 0);
}

@end
