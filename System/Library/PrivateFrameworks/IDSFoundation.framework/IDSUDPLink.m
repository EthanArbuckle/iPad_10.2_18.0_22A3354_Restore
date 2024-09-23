@implementation IDSUDPLink

- (IDSUDPLink)initWithDeviceUniqueID:(id)a3 cbuuid:(id)a4
{
  id v7;
  id v8;
  IDSUDPLink *v9;
  IDSUDPLink *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSUDPLink;
  v9 = -[IDSUDPLink init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cbuuid, a4);
    objc_storeStrong((id *)&v10->_deviceUniqueID, a3);
    *(_QWORD *)&v10->_socket = -1;
    v10->_state = 0;
    v10->_previousReportTime = ids_monotonic_time();
  }

  return v10;
}

- (void)dealloc
{
  BOOL skipTransportThread;
  objc_super v4;
  _QWORD v5[5];
  BOOL v6;

  if (!self->_isInvalidated)
  {
    skipTransportThread = self->_skipTransportThread;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = sub_19BABE604;
    v5[3] = &unk_1E3C220C0;
    v6 = skipTransportThread;
    v5[4] = *(_QWORD *)&self->_socket;
    IDSTransportThreadAddBlock(v5);
  }
  v4.receiver = self;
  v4.super_class = (Class)IDSUDPLink;
  -[IDSUDPLink dealloc](&v4, sel_dealloc);
}

- (id)_createNetworkInterfaceArrayWithIPVersion:(unint64_t)a3 wantsAWDL:(BOOL)a4 wantsWiFi:(BOOL)a5 wantsCellular:(BOOL)a6 allowsLinkLocal:(BOOL)a7 useDefaultInterfaceOnly:(BOOL)a8 defaultPairedDevice:(BOOL)a9
{
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  int isCellular;
  const char *v21;
  uint64_t v22;
  double v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  double v27;
  uint64_t v28;
  const char *v29;
  double v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  GLUCreateNetworkInterfaceArrayWithOptions(a3, a4, a5, a6, a7, a8, a9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v32, 0.0, v36, 16);
  if (v12)
  {
    v16 = v12;
    v17 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v10);
        v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        isCellular = objc_msgSend_isCellular(v19, v13, v14, v15);
        objc_msgSend_address(v19, v21, v22, v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (isCellular)
          v28 = objc_msgSend_cellularPort(self, v24, v25, v27);
        else
          v28 = objc_msgSend_port(self, v24, v25, v27);
        objc_msgSend_updateLocalPort_(v26, v29, v28, v30);

      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v32, v15, v36, 16);
    }
    while (v16);
  }
  return v10;
}

- (void)_processIncomingPacketOnSocket:(int)a3
{
  uint64_t v4;
  __int128 v5;
  _BYTE *v6;
  uint64_t v7;
  id **v8;
  uint64_t v9;
  uint64_t i;
  _QWORD *v11;
  _OWORD *v12;
  uint64_t v13;
  _BYTE *v14;
  id *v15;
  id *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  _BYTE *v20;
  int64x2_t v21;
  uint64_t j;
  _BYTE *v23;
  _DWORD *v24;
  unsigned int v25;
  _BYTE *v26;
  _QWORD *v27;
  unsigned int *v28;
  unsigned int *v29;
  int64x2_t *v30;
  unsigned int v31;
  unsigned int *v32;
  uint64_t v33;
  int isInterfaceIndexCellular;
  uint64_t v35;
  void *v36;
  const char *v37;
  double v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  double v42;
  NSString *v43;
  int64x2_t v44;
  id WeakRetained;
  const char *v46;
  double v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  int v51;
  const char *v52;
  uint64_t v53;
  NSObject *v54;
  IDSSockAddrWrapper *v55;
  NSObject *v56;
  uint64_t k;
  IDSSockAddrWrapper *destinationAddress;
  const char *v59;
  uint64_t v60;
  double v61;
  NSObject *v62;
  NSDictionary *destinationAddressToDeviceIDMap;
  _OWORD v64[3];
  __int128 v65;
  _QWORD v66[4];
  __int128 v67;
  _QWORD v68[4];
  __int128 v69;
  _QWORD v70[4];
  __int128 v71;
  _QWORD v72[4];
  __int128 v73;
  _QWORD v74[4];
  __int128 v75;
  _QWORD v76[4];
  __int128 v77;
  _QWORD v78[4];
  __int128 v79;
  _QWORD v80[4];
  __int128 v81;
  _QWORD v82[4];
  _BYTE v83[88];
  _QWORD *v84;
  _BYTE *v85;
  unsigned int v86;
  int64x2_t v87;
  id *p_delegate;
  uint64_t v89;
  _BYTE v90[24];
  _BYTE v91[536];
  uint8_t buf[4];
  const char *v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  unsigned int v97;
  __int16 v98;
  NSDictionary *v99;
  uint64_t v100;

  v86 = a3;
  v4 = 0;
  v100 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  do
  {
    v6 = &v90[v4];
    *((_QWORD *)v6 + 6) = 0xAAAAAAAAAAAAAAAALL;
    *((_OWORD *)v6 + 1) = v5;
    *((_OWORD *)v6 + 2) = v5;
    *(_OWORD *)v6 = v5;
    v4 += 56;
  }
  while (v4 != 560);
  v7 = MEMORY[0x1E0C80A78](self);
  v8 = (id **)v83;
  v9 = MEMORY[0x1E0C80A78](v7);
  for (i = 0; i != 20; i += 2)
  {
    v11 = &v76[i + 2];
    *v11 = 0xAAAAAAAAAAAAAAAALL;
    v11[1] = 0xAAAAAAAAAAAAAAAALL;
  }
  MEMORY[0x1E0C80A78](v9);
  v12 = v64;
  memset(v83, 0, 80);
  bzero(v90, 0x230uLL);
  v13 = 0;
  memset(v82, 0, sizeof(v82));
  v81 = 0u;
  v79 = 0u;
  memset(v80, 0, sizeof(v80));
  memset(v78, 0, sizeof(v78));
  v77 = 0u;
  memset(v64, 0, sizeof(v64));
  memset(v66, 0, sizeof(v66));
  v67 = 0u;
  memset(v68, 0, sizeof(v68));
  v69 = 0u;
  memset(v70, 0, sizeof(v70));
  v71 = 0u;
  memset(v72, 0, sizeof(v72));
  v73 = 0u;
  memset(v74, 0, sizeof(v74));
  v14 = v91;
  v75 = 0u;
  memset(v76, 0, sizeof(v76));
  v85 = v83;
  v65 = 0u;
  do
  {
    v15 = _IDSLinkPacketBufferCreate();
    *v8++ = v15;
    v16 = (id *)&v76[v13 + 2];
    *v16 = *v15;
    v16[1] = v15[1];
    *((_QWORD *)v14 - 3) = v15 + 23;
    *((_DWORD *)v14 - 4) = 128;
    *((_QWORD *)v14 - 1) = &v76[v13 + 2];
    *(_DWORD *)v14 = 1;
    *((_QWORD *)v14 + 1) = v12;
    *((_DWORD *)v14 + 4) = 32;
    v13 += 2;
    v14 += 56;
    v12 += 2;
  }
  while (v13 != 20);
  v17 = recvmsg_x();
  v20 = v85;
  v89 = v17;
  if (v17 < 0)
  {
LABEL_34:
    v51 = *__error();
    if (*__error() != 35)
    {
      objc_msgSend_IDSUDPLink(IDSFoundationLog, v52, v53, *(double *)v21.i64);
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        sub_19BAF9924();

    }
    if (v51 == 57)
    {
      if (!self->_hasFixedDestination)
      {
        destinationAddress = self->_destinationAddress;
        self->_destinationAddress = 0;

        self->_state = 1;
        objc_msgSend_invalidate(self, v59, v60, v61);
      }
    }
    else if (v51 == 61 && !self->_hasFixedDestination)
    {
      v55 = self->_destinationAddress;
      self->_destinationAddress = 0;

      self->_state = 1;
    }
  }
  else
  {
    p_delegate = (id *)&self->_delegate;
    v21 = vdupq_n_s64(1uLL);
    v87 = v21;
    v84 = &v76[2];
    while (v89)
    {
      for (j = 0; j != v89; ++j)
      {
        v23 = &v90[56 * j];
        v25 = *((_DWORD *)v23 + 10);
        v24 = v23 + 40;
        if (v25 < 0xC || (v91[56 * j + 20] & 0x20) != 0)
        {
          objc_msgSend_IDSUDPLink(IDSFoundationLog, v18, v19, *(double *)v21.i64, v64[0], *(_QWORD *)&v64[1], *(_OWORD *)((char *)&v64[1] + 8), *((_QWORD *)&v64[2] + 1), v65, v66[0], *(_OWORD *)&v66[1], v66[3], v67, v68[0], *(_OWORD *)&v68[1], v68[3], v69, v70[0], *(_OWORD *)&v70[1],
            v70[3],
            v71,
            v72[0],
            *(_OWORD *)&v72[1],
            v72[3],
            v73,
            v74[0],
            *(_OWORD *)&v74[1],
            v74[3],
            v75,
            v76[0],
            *(_OWORD *)&v76[1],
            v76[3],
            v77,
            v78[0],
            *(_OWORD *)&v78[1],
            v78[3],
            v79,
            v80[0],
            *(_OWORD *)&v80[1],
            v80[3],
            v81,
            v82[0],
            *(_OWORD *)&v82[1]);
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            sub_19BAF99A4(v24, v86, v56);

          goto LABEL_45;
        }
        v26 = &v90[56 * j];
        v29 = (unsigned int *)*((_QWORD *)v26 + 4);
        v27 = v26 + 32;
        v28 = v29;
        v30 = *(int64x2_t **)&v20[8 * j];
        v30[1].i64[0] = v27[2];
        if (v29)
        {
          do
          {
            v31 = v28[1];
            if (v31 == 41)
            {
              if (v28[2] == 46)
              {
                v30[3].i16[4] = 7708;
                v21 = *(int64x2_t *)(v28 + 3);
                v30[4] = v21;
                v32 = v28 + 7;
                goto LABEL_20;
              }
            }
            else if (!v31 && v28[2] == 26)
            {
              v32 = v28 + 3;
              v30[3].i16[4] = 528;
              v30[3].i32[3] = v28[5];
LABEL_20:
              v33 = *v32;
              v30[3].i32[0] = v33;
              isInterfaceIndexCellular = objc_msgSend__isInterfaceIndexCellular_(self, v18, v33, *(double *)v21.i64, *(_QWORD *)&v64[0], *((_QWORD *)&v64[0] + 1), *(_QWORD *)&v64[1], *((_QWORD *)&v64[1] + 1), *(_QWORD *)&v64[2], *((_QWORD *)&v64[2] + 1), (_QWORD)v65, *((_QWORD *)&v65 + 1), v66[0], v66[1], v66[2], v66[3], (_QWORD)v67, *((_QWORD *)&v67 + 1), v68[0],
                                           v68[1],
                                           v68[2],
                                           v68[3],
                                           (_QWORD)v69,
                                           *((_QWORD *)&v69 + 1),
                                           v70[0],
                                           v70[1],
                                           v70[2],
                                           v70[3],
                                           (_QWORD)v71,
                                           *((_QWORD *)&v71 + 1),
                                           v72[0],
                                           v72[1],
                                           v72[2],
                                           v72[3],
                                           (_QWORD)v73,
                                           *((_QWORD *)&v73 + 1),
                                           v74[0],
                                           v74[1],
                                           v74[2],
                                           v74[3],
                                           (_QWORD)v75,
                                           *((_QWORD *)&v75 + 1),
                                           v76[0],
                                           v76[1],
                                           v76[2],
                                           v76[3],
                                           (_QWORD)v77,
                                           *((_QWORD *)&v77 + 1),
                                           v78[0],
                                           v78[1],
                                           v78[2],
                                           v78[3],
                                           (_QWORD)v79,
                                           *((_QWORD *)&v79 + 1),
                                           v80[0],
                                           v80[1],
                                           v80[2],
                                           v80[3],
                                           (_QWORD)v81,
                                           *((_QWORD *)&v81 + 1),
                                           v82[0],
                                           v82[1],
                                           v82[2]);
              v35 = 58;
              if (!isInterfaceIndexCellular)
                v35 = 56;
              v30[3].i16[5] = bswap32(*(unsigned __int16 *)((char *)&self->super.isa + v35)) >> 16;
            }
            v28 = (unsigned int *)((char *)v28 + ((*v28 + 3) & 0x1FFFFFFFCLL));
          }
          while ((unint64_t)(v28 + 3) <= *v27 + (unint64_t)*v24);
        }
        if (self->_hasFixedDestination && self->_destinationAddressToDeviceIDMap)
        {
          objc_msgSend_wrapperWithSockAddr_(IDSSockAddrWrapper, v18, (uint64_t)&v30[11].i64[1], *(double *)v21.i64);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(self->_destinationAddressToDeviceIDMap, v37, (uint64_t)v36, v38);
          v39 = objc_claimAutoreleasedReturnValue();
          if (!v39)
          {
            objc_msgSend_IDSUDPLink(IDSFoundationLog, v40, v41, v42);
            v62 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              destinationAddressToDeviceIDMap = self->_destinationAddressToDeviceIDMap;
              *(_DWORD *)buf = 136315906;
              v93 = "-[IDSUDPLink _processIncomingPacketOnSocket:]";
              v94 = 2112;
              v95 = v36;
              v96 = 1024;
              v97 = v86;
              v98 = 2112;
              v99 = destinationAddressToDeviceIDMap;
              _os_log_error_impl(&dword_19B949000, v62, OS_LOG_TYPE_ERROR, "%s found no matching deviceID for %@, socket %d, map = %@", buf, 0x26u);
            }

            goto LABEL_45;
          }
          v43 = (NSString *)v39;

        }
        else
        {
          v43 = self->_cbuuid;
        }
        v44.i64[1] = v87.i64[1];
        v44.i64[0] = v30[1].i64[0];
        *(int64x2_t *)&self->_totalBytesReceived = vaddq_s64(*(int64x2_t *)&self->_totalBytesReceived, v44);
        WeakRetained = objc_loadWeakRetained(p_delegate);
        objc_msgSend_link_didReceivePacket_fromDeviceUniqueID_cbuuid_(WeakRetained, v46, (uint64_t)self, v47, v30, self->_deviceUniqueID, v43);

      }
      if (v89 != 10)
        break;
      v48 = 0;
      v49 = v84;
      do
      {
        v50 = *(_QWORD **)&v20[v48];
        IDSLinkPacketBufferResetBufferStart(v50, (const char *)0xF, v19, *(double *)v21.i64);
        *v49 = *v50;
        v49 += 2;
        v48 += 8;
      }
      while (v48 != 80);
      v89 = recvmsg_x();
      if (v89 < 0)
        goto LABEL_34;
    }
  }
LABEL_45:
  for (k = 0; k != 80; k += 8)
    _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSUDPLink.m", (const char *)0x106, *(_QWORD *)&v20[k], *(double *)v21.i64);
}

- (void)_processIncomingPacket
{
  ((void (*)(IDSUDPLink *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel__processIncomingPacketOnSocket_, self->_socket);
}

- (void)_processIncomingCellularPacket
{
  ((void (*)(IDSUDPLink *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel__processIncomingPacketOnSocket_, self->_cellularSocket);
}

- (unint64_t)_sendBytes:(const void *)a3 length:(unint64_t)a4
{
  double v4;
  int socket;
  uint64_t v9;
  const char *v10;
  double v11;
  unint64_t result;
  IDSSockAddrWrapper *destinationAddress;
  const sockaddr *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  unsigned __int8 *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  NSObject *v22;
  IDSSockAddrWrapper *v23;
  int v24;
  int v25;
  const char *v26;
  uint64_t v27;
  double v28;
  NSObject *v29;
  ssize_t v30;
  ssize_t v31;
  int64x2_t v32;
  int v33;
  const char *v34;
  uint64_t v35;
  double v36;
  NSObject *v37;
  NSObject *v38;
  IDSSockAddrWrapper *v39;
  int v40;
  int v41;
  int v42;
  int v43;
  const char *v44;
  __int16 v45;
  _BYTE v46[14];
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  socket = self->_socket;
  if (socket == -1)
    return 7;
  if (self->_hasFixedDestination)
  {
    v9 = objc_msgSend_sa(self->_destinationAddress, a2, (uint64_t)a3, v4);
    return objc_msgSend__sendBytes_length_destinationAddress_(self, v10, (uint64_t)a3, v11, a4, v9);
  }
  else
  {
    if (self->_needToConnect)
    {
      destinationAddress = self->_destinationAddress;
      if (destinationAddress)
      {
        v14 = (const sockaddr *)objc_msgSend_sa(destinationAddress, a2, (uint64_t)a3, v4);
        v18 = (unsigned __int8 *)objc_msgSend_sa(self->_destinationAddress, v15, v16, v17);
        if (connect(socket, v14, *v18) < 0)
        {
          v25 = *__error();
          objc_msgSend_IDSUDPLink(IDSFoundationLog, v26, v27, v28);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v39 = self->_destinationAddress;
            v40 = self->_socket;
            v43 = 136315906;
            v44 = "-[IDSUDPLink _sendBytes:length:]";
            v45 = 2112;
            *(_QWORD *)v46 = v39;
            *(_WORD *)&v46[8] = 1024;
            *(_DWORD *)&v46[10] = v40;
            v47 = 1024;
            v48 = v25;
            _os_log_error_impl(&dword_19B949000, v29, OS_LOG_TYPE_ERROR, "%s connect(%@) on socket %d failed errno=%d", (uint8_t *)&v43, 0x22u);
          }

        }
        else
        {
          objc_msgSend_IDSUDPLink(IDSFoundationLog, v19, v20, v21);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            v23 = self->_destinationAddress;
            v24 = self->_socket;
            v43 = 136315650;
            v44 = "-[IDSUDPLink _sendBytes:length:]";
            v45 = 2112;
            *(_QWORD *)v46 = v23;
            *(_WORD *)&v46[8] = 1024;
            *(_DWORD *)&v46[10] = v24;
            _os_log_impl(&dword_19B949000, v22, OS_LOG_TYPE_INFO, "%s connect(%@) on socket %d succeeded. Reset _needToConnect", (uint8_t *)&v43, 0x1Cu);
          }

          self->_needToConnect = 0;
        }
      }
    }
    v30 = send(self->_socket, a3, a4, 0);
    if (v30 < 0)
    {
      v33 = *__error();
      result = sub_19BABF144();
      switch(result)
      {
        case 3uLL:
          objc_msgSend_IDSUDPLink(IDSFoundationLog, v34, v35, v36);
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v42 = self->_socket;
            v43 = 136316162;
            v44 = "-[IDSUDPLink _sendBytes:length:]";
            v45 = 1024;
            *(_DWORD *)v46 = 309;
            *(_WORD *)&v46[4] = 2048;
            *(_QWORD *)&v46[6] = a4;
            v47 = 1024;
            v48 = v42;
            v49 = 1024;
            v50 = v33;
            _os_log_error_impl(&dword_19B949000, v38, OS_LOG_TYPE_ERROR, "%s:%d send(%zu B) on socket %d failed errno=%d", (uint8_t *)&v43, 0x28u);
          }

          self->_hasTemporaryError = 1;
          return 3;
        case 0xBuLL:
          objc_msgSend_IDSUDPLink(IDSFoundationLog, v34, v35, v36);
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v41 = self->_socket;
            v43 = 136316162;
            v44 = "-[IDSUDPLink _sendBytes:length:]";
            v45 = 1024;
            *(_DWORD *)v46 = 307;
            *(_WORD *)&v46[4] = 2048;
            *(_QWORD *)&v46[6] = a4;
            v47 = 1024;
            v48 = v41;
            v49 = 1024;
            v50 = v33;
            _os_log_error_impl(&dword_19B949000, v37, OS_LOG_TYPE_ERROR, "%s:%d send(%zu B) on socket %d failed errno=%d", (uint8_t *)&v43, 0x28u);
          }

          return 11;
        case 6uLL:
          self->_needToConnect = 1;
          break;
      }
    }
    else
    {
      v31 = v30;
      result = 0;
      self->_hasTemporaryError = 0;
      v32 = vdupq_n_s64(1uLL);
      v32.i64[0] = v31;
      *(int64x2_t *)&self->_totalBytesSent = vaddq_s64(*(int64x2_t *)&self->_totalBytesSent, v32);
    }
  }
  return result;
}

- (unint64_t)_sendBytes:(const void *)a3 length:(unint64_t)a4 destinationAddress:(const sockaddr *)a5
{
  double v5;
  int socket;
  ssize_t v9;
  ssize_t v10;
  unint64_t result;
  int64x2_t v12;
  int v13;
  const char *v14;
  uint64_t v15;
  double v16;
  NSObject *v17;
  int v18;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  socket = self->_socket;
  if (socket == -1)
    return 7;
  if (self->_destinationAddress && !self->_hasFixedDestination)
  {
    if (a5 && a5->sa_family)
      return 5;
    else
      return objc_msgSend__sendBytes_length_(self, a2, (uint64_t)a3, v5, a4);
  }
  else
  {
    v9 = sendto(socket, a3, a4, 0, a5, a5->sa_len);
    if (v9 < 0)
    {
      v13 = *__error();
      result = sub_19BABF144();
      if (result == 3)
      {
        self->_hasTemporaryError = 1;
      }
      else if (result == 11)
      {
        objc_msgSend_IDSUDPLink(IDSFoundationLog, v14, v15, v16);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = self->_socket;
          v19 = 136316162;
          v20 = "-[IDSUDPLink _sendBytes:length:destinationAddress:]";
          v21 = 1024;
          v22 = 339;
          v23 = 2048;
          v24 = a4;
          v25 = 1024;
          v26 = v18;
          v27 = 1024;
          v28 = v13;
          _os_log_error_impl(&dword_19B949000, v17, OS_LOG_TYPE_ERROR, "%s:%d sendto(%zuB) on socket %d failed errno=%d", (uint8_t *)&v19, 0x28u);
        }

        return 11;
      }
    }
    else
    {
      v10 = v9;
      result = 0;
      self->_hasTemporaryError = 0;
      v12 = vdupq_n_s64(1uLL);
      v12.i64[0] = v10;
      *(int64x2_t *)&self->_totalBytesSent = vaddq_s64(*(int64x2_t *)&self->_totalBytesSent, v12);
    }
  }
  return result;
}

- (unint64_t)_sendBytesArray:(const void *)a3 lengthArray:(unint64_t *)a4 arraySize:(int)a5 localInterfaceIndex:(int)a6 localAddress:(const sockaddr *)a7 destinationAddress:(const sockaddr *)a8 trafficClass:(unsigned __int16)a9 DSCP:(unsigned __int8)a10
{
  double v10;
  unint64_t result;
  __int128 v14;
  const char *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 *v20;
  int v21;
  int v22;
  __int128 v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  _BYTE *v39;
  int SocketForInterfaceIndex;
  NSObject *v41;
  ssize_t v42;
  ssize_t v43;
  int64x2_t v44;
  const char *v45;
  uint64_t v46;
  double v47;
  NSObject *v48;
  _BYTE v49[32];
  __int128 v50;
  _BYTE v51[32];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (self->_socket == -1)
    return 7;
  if (!a7 || !a7->sa_family)
  {
    if (a5 == 1)
      return objc_msgSend__sendBytes_length_destinationAddress_(self, a2, (uint64_t)*a3, v10, *a4, a8, *(_QWORD *)&a6);
    return 12;
  }
  if (self->_destinationAddress)
  {
    if (a8 && a8->sa_family)
      return 5;
    if (a5 == 1)
      return objc_msgSend__sendBytes_length_(self, a2, (uint64_t)*a3, v10, *a4);
    return 12;
  }
  if (!a8 || !a8->sa_family)
    return 6;
  if (!a6)
  {
    objc_msgSend_IDSUDPLink(IDSFoundationLog, a2, (uint64_t)a3, v10, a4);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_19BAF9A34();
    goto LABEL_24;
  }
  *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v60 = v14;
  v61 = v14;
  v58 = v14;
  v59 = v14;
  v56 = v14;
  v57 = v14;
  v54 = v14;
  v55 = v14;
  v52 = v14;
  v53 = v14;
  *(_OWORD *)&v51[16] = v14;
  *(double *)&v23 = MEMORY[0x1E0C80A78](self);
  v50 = v23;
  *(_OWORD *)v51 = v23;
  *(_OWORD *)v49 = v23;
  *(_OWORD *)&v49[16] = v23;
  if (a5 > 8)
  {
    objc_msgSend_IDSUDPLink(IDSFoundationLog, v15, (uint64_t)v16, *(double *)&v23, *(_QWORD *)v49, *(_QWORD *)&v49[8], *(_QWORD *)&v49[16], *(_QWORD *)&v49[24], v50, *(_QWORD *)v51, *(_OWORD *)&v51[8], *(_QWORD *)&v51[24], v52, v53, v54, v55, v56, v57, v58,
      v59,
      v60,
      v61);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_19BAF9AAC();
LABEL_24:

    return 9;
  }
  if (a5 >= 1)
  {
    v25 = 0;
    v26 = a5;
    v27 = (_QWORD *)&v54 + 1;
    do
    {
      v29 = *v16++;
      v28 = v29;
      v30 = *v17++;
      *(v27 - 1) = v28;
      *v27 = v30;
      v25 += v30;
      v27 += 2;
      --v26;
    }
    while (v26);
  }
  *(_QWORD *)&v51[16] = v20;
  *(_DWORD *)&v51[24] = *v20;
  *(_QWORD *)&v52 = &v54;
  DWORD2(v52) = a5;
  HIDWORD(v53) = 0;
  v31 = *(unsigned __int8 *)(v19 + 1);
  if (v31 == 2)
  {
    v33 = 0;
    *(_QWORD *)&v53 = v49;
    DWORD2(v53) = 64;
    *(_QWORD *)&v34 = 24;
    *(_QWORD *)v49 = 24;
    *(_DWORD *)&v49[8] = 26;
    *(_DWORD *)&v49[12] = v18;
    v38 = 3;
    *(_DWORD *)&v49[16] = *(_DWORD *)(v19 + 4);
    v35 = 32;
    v32 = 28;
    v36 = 36;
    v37 = 24;
LABEL_32:
    v39 = &v49[v37];
    *(_DWORD *)&v49[v32] = v33;
    *(_DWORD *)&v49[v37] = 16;
    *(_DWORD *)&v49[v35] = v38;
    *(_DWORD *)&v49[v36] = v22;
    if (v21)
    {
      *((_QWORD *)v39 + 2) = 0xFFFF00000010;
      *((_DWORD *)v39 + 6) = 4230;
      *(_DWORD *)&v49[v37 + 28] = v21;
      SocketForInterfaceIndex = objc_msgSend__findSocketForInterfaceIndex_(self, v15, v18, COERCE_DOUBLE(0xFFFF00000010), v17, *(_QWORD *)v49, *(_QWORD *)&v49[8], *(_QWORD *)&v49[16], *(_QWORD *)&v49[24], (_QWORD)v50, *((_QWORD *)&v50 + 1), *(_QWORD *)v51, *(_QWORD *)&v51[8], *(_QWORD *)&v51[16], *(_QWORD *)&v51[24], (_QWORD)v52, *((_QWORD *)&v52 + 1), (_QWORD)v53, *((_QWORD *)&v53 + 1),
                                  v54,
                                  v55,
                                  v56,
                                  v57,
                                  v58,
                                  v59,
                                  v60,
                                  v61);
    }
    else
    {
      DWORD2(v53) = 48;
      SocketForInterfaceIndex = objc_msgSend__findSocketForInterfaceIndex_(self, v15, v18, *(double *)&v34, v17, *(_QWORD *)v49, *(_QWORD *)&v49[8], *(_QWORD *)&v49[16], *(_QWORD *)&v49[24], (_QWORD)v50, *((_QWORD *)&v50 + 1), *(_QWORD *)v51, *(_QWORD *)&v51[8], *(_QWORD *)&v51[16], *(_QWORD *)&v51[24], (_QWORD)v52, *((_QWORD *)&v52 + 1), (_QWORD)v53, *((_QWORD *)&v53 + 1),
                                  v54,
                                  v55,
                                  v56,
                                  v57,
                                  v58,
                                  v59,
                                  v60,
                                  v61);
    }
    v42 = sendmsg(SocketForInterfaceIndex, (const msghdr *)&v51[16], 0);
    if (v42 < 0)
    {
      __error();
      result = sub_19BABF144();
      if (result == 3)
      {
        self->_hasTemporaryError = 1;
      }
      else if (result == 11)
      {
        objc_msgSend_IDSUDPLink(IDSFoundationLog, v45, v46, v47);
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          sub_19BAF9BB8();

        return 11;
      }
    }
    else
    {
      v43 = v42;
      result = 0;
      self->_hasTemporaryError = 0;
      v44 = vdupq_n_s64(1uLL);
      v44.i64[0] = v43;
      *(int64x2_t *)&self->_totalBytesSent = vaddq_s64(*(int64x2_t *)&self->_totalBytesSent, v44);
    }
    return result;
  }
  if (v31 == 30)
  {
    *(_QWORD *)&v53 = v49;
    DWORD2(v53) = 64;
    *(_QWORD *)v49 = 0x2900000020;
    *(_DWORD *)&v49[8] = 46;
    *(_DWORD *)&v49[28] = v18;
    v32 = 36;
    v33 = 41;
    v34 = *(_OWORD *)(v19 + 8);
    *(_OWORD *)&v49[12] = v34;
    v35 = 40;
    v36 = 44;
    v37 = 32;
    v38 = 36;
    goto LABEL_32;
  }
  objc_msgSend_IDSUDPLink(IDSFoundationLog, v15, (uint64_t)v16, *(double *)&v23, v17, *(_QWORD *)v49, *(_QWORD *)&v49[8], *(_QWORD *)&v49[16], *(_QWORD *)&v49[24], v50, *(_QWORD *)v51, *(_OWORD *)&v51[8], *(_QWORD *)&v51[24], v52, v53, v54, v55, v56, v57,
    v58,
    v59,
    v60,
    v61);
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    sub_19BAF9B40();

  return 8;
}

- (int)_createNewUDPSocketWithIPVersion:(unint64_t)a3 localPort:(unsigned __int16 *)a4 wantsAWDL:(BOOL)a5 clientUUID:(unsigned __int8)a6[16]
{
  _BOOL4 v7;
  int v9;
  int v10;
  socklen_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  NSObject *v17;
  int *v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  int v23;
  __int128 v24;
  const char *v25;
  uint64_t v26;
  double v27;
  int v28;
  const char *v29;
  uint64_t v30;
  double v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  socklen_t v41;
  int v42;
  int v43;
  uint8_t buf[4];
  _BYTE v45[14];
  __int16 v46;
  int v47;
  __int16 v48;
  char *v49;
  __int16 v50;
  int v51;
  uuid_string_t out;
  sockaddr v53[8];
  uint64_t v54;

  v7 = a5;
  v54 = *MEMORY[0x1E0C80C00];
  memset(v53, 0, sizeof(v53));
  if (a3 == 1)
  {
    v10 = 0;
    *(_WORD *)&v53[0].sa_len = 7708;
    *(sockaddr *)&v53[0].sa_data[6] = *(sockaddr *)MEMORY[0x1E0C83920];
    *(_WORD *)v53[0].sa_data = bswap32(*a4) >> 16;
    v9 = 30;
    v11 = 28;
  }
  else
  {
    if (a3)
    {
      objc_msgSend_IDSUDPLink(IDSFoundationLog, a2, a3, 0.0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_19BAF9C48();
      goto LABEL_12;
    }
    *(_WORD *)&v53[0].sa_len = 528;
    *(_WORD *)v53[0].sa_data = bswap32(*a4) >> 16;
    v9 = 2;
    v10 = 1;
    v11 = 16;
  }
  v12 = socket(v9, 2, 17);
  if (v12 == -1)
  {
    v18 = __error();
    IDSAssertNonFatalErrnoWithSource(*v18, "UDPLink", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSUDPLink.m", 513, v19);
    objc_msgSend_IDSUDPLink(IDSFoundationLog, v20, v21, v22);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_19BAF9CD4();
LABEL_12:

    return -1;
  }
  v13 = v12;
  IDSCheckFileDescriptorUsageWithSource((uint64_t)"IDSUDPLink.m", 518, 0);
  v43 = 1;
  v14 = v13;
  if (v10)
  {
    v15 = 0;
    v16 = 26;
  }
  else
  {
    setsockopt(v13, 41, 27, &v43, 4u);
    v14 = v13;
    v15 = 41;
    v16 = 61;
  }
  setsockopt(v14, v15, v16, &v43, 4u);
  if (v7)
    setsockopt(v13, 0xFFFF, 4356, &v43, 4u);
  setsockopt(v13, 0xFFFF, 4130, &v43, 4u);
  v42 = 0x80000;
  setsockopt(v13, 0xFFFF, 4098, &v42, 4u);
  v23 = fcntl(v13, 3, 0);
  if (v23 != -1)
    fcntl(v13, 4, v23 | 4u);
  if (bind(v13, v53, v11) == -1)
  {
    __error();
    close(v13);
    objc_msgSend_IDSUDPLink(IDSFoundationLog, v33, v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_19BAF9D54();
    goto LABEL_28;
  }
  v41 = 128;
  if (getsockname(v13, v53, &v41) == -1)
  {
    __error();
    close(v13);
    objc_msgSend_IDSUDPLink(IDSFoundationLog, v37, v38, v39);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_19BAF9DC8();
LABEL_28:

    return -1;
  }
  *a4 = bswap32(*(unsigned __int16 *)v53[0].sa_data) >> 16;
  if (!uuid_is_null(a6))
  {
    *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)out = v24;
    *(_OWORD *)&out[16] = v24;
    uuid_unparse(a6, out);
    if (setsockopt(v13, 0xFFFF, 4360, a6, 0x10u))
    {
      v28 = *__error();
      objc_msgSend_IDSUDPLink(IDSFoundationLog, v29, v30, v31);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v45 = "-[IDSUDPLink _createNewUDPSocketWithIPVersion:localPort:wantsAWDL:clientUUID:]";
        *(_WORD *)&v45[8] = 1024;
        *(_DWORD *)&v45[10] = 579;
        v46 = 1024;
        v47 = v13;
        v48 = 2080;
        v49 = out;
        v50 = 1024;
        v51 = v28;
        _os_log_error_impl(&dword_19B949000, v32, OS_LOG_TYPE_ERROR, "%s:%d setsockopt on socket %d SO_DELEGATED_UUID failed for %s, errno: %d", buf, 0x28u);
      }
    }
    else
    {
      objc_msgSend_IDSUDPLink(IDSFoundationLog, v25, v26, v27);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v45 = v13;
        *(_WORD *)&v45[4] = 2080;
        *(_QWORD *)&v45[6] = out;
        _os_log_impl(&dword_19B949000, v32, OS_LOG_TYPE_INFO, "setsockopt on socket %d SO_DELEGATED_UUID for %s", buf, 0x12u);
      }
    }

  }
  return v13;
}

- (BOOL)_isInterfaceIndexCellular:(int)a3
{
  double v3;

  return objc_msgSend_containsIndex_(self->_cellularInterfaceIndices, a2, a3, v3);
}

- (int)_findSocketForInterfaceIndex:(int)a3
{
  double v3;
  int isInterfaceIndexCellular;
  uint64_t v6;

  isInterfaceIndexCellular = objc_msgSend__isInterfaceIndexCellular_(self, a2, *(uint64_t *)&a3, v3);
  v6 = 8;
  if (isInterfaceIndexCellular)
    v6 = 12;
  return *(_DWORD *)((char *)&self->super.isa + v6);
}

- (BOOL)_setTrafficClassOnSocket:(int)a3 trafficClassValue:(int)a4
{
  const char *v5;
  uint64_t v6;
  int v7;
  double v8;
  int v9;
  const char *v10;
  uint64_t v11;
  double v12;
  NSObject *v13;
  int v15;
  uint8_t buf[4];
  _BYTE v17[10];
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v7 = setsockopt(a3, 0xFFFF, 4230, &v15, 4u);
  if (v7)
  {
    v9 = *__error();
    objc_msgSend_IDSUDPLink(IDSFoundationLog, v10, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v17 = "-[IDSUDPLink _setTrafficClassOnSocket:trafficClassValue:]";
      *(_WORD *)&v17[8] = 1024;
      v18 = 608;
      v19 = 1024;
      v20 = v15;
      v21 = 1024;
      v22 = a3;
      v23 = 1024;
      v24 = v9;
      _os_log_error_impl(&dword_19B949000, v13, OS_LOG_TYPE_ERROR, "%s:%d traffic class (%d) failed to set for socket (%d), error (%d).", buf, 0x24u);
    }
  }
  else
  {
    objc_msgSend_IDSUDPLink(IDSFoundationLog, v5, v6, v8);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v17 = v15;
      *(_WORD *)&v17[4] = 1024;
      *(_DWORD *)&v17[6] = a3;
      _os_log_impl(&dword_19B949000, v13, OS_LOG_TYPE_INFO, "traffic class (%d) is set for socket (%d).", buf, 0xEu);
    }
  }

  return v7 == 0;
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
  return (NSString *)CFSTR("InfraWiFi");
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
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v4, self->_totalBytesReceived, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v7, self->_totalBytesSent, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v10, self->_totalPacketsReceived, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v13, self->_totalPacketsSent, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend_initWithObjectsAndKeys_(v3, v16, (uint64_t)v6, v17, CFSTR("bytesReceived"), v9, CFSTR("bytesSent"), v12, CFSTR("packetsReceived"), v15, CFSTR("packetsSent"), 0);

  return v18;
}

- (void)removeSocket
{
  int socket;
  int cellularSocket;

  socket = self->_socket;
  if (socket != -1)
  {
    if (!self->_skipTransportThread)
    {
      IDSTransportThreadRemoveSocket(socket);
      socket = self->_socket;
    }
    close(socket);
    self->_socket = -1;
  }
  cellularSocket = self->_cellularSocket;
  if (cellularSocket != -1)
  {
    if (!self->_skipTransportThread)
    {
      IDSTransportThreadRemoveSocket(cellularSocket);
      cellularSocket = self->_cellularSocket;
    }
    close(cellularSocket);
    self->_cellularSocket = -1;
  }
}

- (void)invalidate
{
  uint64_t v2;
  double v3;

  objc_msgSend_removeSocket(self, a2, v2, v3);
  self->_isInvalidated = 1;
}

- (BOOL)setDestinationAddress:(id)a3 isFixedDestination:(BOOL)a4 fromAddress:(id)a5
{
  IDSSockAddrWrapper *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  double v17;
  int socket;
  const sockaddr *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  unsigned __int8 *v23;
  NSObject *WeakRetained;
  BOOL v25;
  NSObject *v26;
  IDSSockAddrWrapper *destinationAddress;
  int v28;
  const char *v29;
  uint64_t v30;
  double v31;
  NSObject *v32;
  IDSSockAddrWrapper *v33;
  IDSSockAddrWrapper *v34;
  double v35;
  const char *v36;
  uint64_t v37;
  NSObject *v38;
  IDSSockAddrWrapper *v39;
  unint64_t v40;
  const char *v41;
  double v42;
  int v44;
  _BYTE v45[18];
  __int16 v46;
  IDSSockAddrWrapper *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = (IDSSockAddrWrapper *)a3;
  v9 = a5;
  v13 = v9;
  if (self->_socket == -1)
  {
    self->_state = 0;
    objc_msgSend_IDSUDPLink(IDSFoundationLog, v10, v11, v12);
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      sub_19BAF9E3C();
    goto LABEL_13;
  }
  if (v9 && (objc_msgSend_isEqualToWrapper_(v8, v10, (uint64_t)v9, v12) & 1) == 0)
  {
    objc_msgSend_IDSUDPLink(IDSFoundationLog, v10, v14, v12);
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      sub_19BAF9EB4();
LABEL_13:
    v25 = 0;
    goto LABEL_25;
  }
  if ((objc_msgSend_isEqual_(v8, v10, (uint64_t)self->_destinationAddress, v12) & 1) == 0 && !a4)
  {
    if (v8)
    {
      socket = self->_socket;
      v19 = (const sockaddr *)objc_msgSend_sa(v8, v15, v16, v17);
      v23 = (unsigned __int8 *)objc_msgSend_sa(v8, v20, v21, v22);
      if (connect(socket, v19, *v23) < 0)
      {
        v28 = *__error();
        objc_msgSend_IDSUDPLink(IDSFoundationLog, v29, v30, v31);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v44 = self->_socket;
          *(_DWORD *)v45 = 136316162;
          *(_QWORD *)&v45[4] = "-[IDSUDPLink setDestinationAddress:isFixedDestination:fromAddress:]";
          *(_WORD *)&v45[12] = 1024;
          *(_DWORD *)&v45[14] = 677;
          v46 = 2112;
          v47 = v8;
          v48 = 1024;
          v49 = v44;
          v50 = 1024;
          v51 = v28;
          _os_log_error_impl(&dword_19B949000, v32, OS_LOG_TYPE_ERROR, "%s:%d connect(%@) on socket %d failed errno=%d", v45, 0x28u);
        }

        self->_needToConnect = 1;
      }
      else
      {
        self->_needToConnect = 0;
      }
    }
    else
    {
      objc_msgSend_IDSUDPLink(IDSFoundationLog, v15, v16, v17);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        destinationAddress = self->_destinationAddress;
        *(_DWORD *)v45 = 138412290;
        *(_QWORD *)&v45[4] = destinationAddress;
        _os_log_impl(&dword_19B949000, v26, OS_LOG_TYPE_DEFAULT, "dissolving old association with %@", v45, 0xCu);
      }

      *(_QWORD *)&v45[8] = 0;
      *(_QWORD *)&v45[2] = 0;
      *(_WORD *)v45 = 16;
      connect(self->_socket, (const sockaddr *)v45, 0x10u);
    }
  }
  v33 = (IDSSockAddrWrapper *)objc_msgSend_copy(v8, v15, v16, v17);
  v34 = self->_destinationAddress;
  self->_destinationAddress = v33;

  self->_hasFixedDestination = a4;
  v35 = ids_monotonic_time();
  self->_lastDestinationReceived = v35;
  objc_msgSend_IDSUDPLink(IDSFoundationLog, v36, v37, v35);
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    v39 = self->_destinationAddress;
    *(_DWORD *)v45 = 136315650;
    *(_QWORD *)&v45[4] = "-[IDSUDPLink setDestinationAddress:isFixedDestination:fromAddress:]";
    *(_WORD *)&v45[12] = 1024;
    *(_DWORD *)&v45[14] = 696;
    v46 = 2112;
    v47 = v39;
    _os_log_impl(&dword_19B949000, v38, OS_LOG_TYPE_DEFAULT, "%s:%d new destination set to %@", v45, 0x1Cu);
  }

  v40 = 4;
  if (!v8)
    v40 = 1;
  self->_state = v40;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend_link_didConnectForDeviceUniqueID_cbuuid_(WeakRetained, v41, (uint64_t)self, v42, self->_deviceUniqueID, self->_cbuuid);
  v25 = 1;
LABEL_25:

  return v25;
}

- (BOOL)setDestinationAddress:(id)a3 localIfIndex:(unsigned int)a4 isFixedDestination:(BOOL)a5 fromAddress:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  double v14;
  NSObject *v15;
  int socket;
  const char *v17;
  double v18;
  int v19;
  const char *v20;
  uint64_t v21;
  double v22;
  NSObject *v23;
  char isFixedDestination_fromAddress;
  int v26;
  unsigned int v27;
  uint8_t buf[4];
  _BYTE v29[10];
  int v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v7 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v27 = a4;
  v11 = a6;
  objc_msgSend_IDSUDPLink(IDSFoundationLog, v12, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    socket = self->_socket;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v29 = socket;
    *(_WORD *)&v29[4] = 1024;
    *(_DWORD *)&v29[6] = a4;
    _os_log_impl(&dword_19B949000, v15, OS_LOG_TYPE_DEFAULT, "setting local interface index on socket %d to %u", buf, 0xEu);
  }

  if (setsockopt(self->_socket, 0, 25, &v27, 4u) < 0)
  {
    v19 = *__error();
    objc_msgSend_IDSUDPLink(IDSFoundationLog, v20, v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v26 = self->_socket;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v29 = "-[IDSUDPLink setDestinationAddress:localIfIndex:isFixedDestination:fromAddress:]";
      *(_WORD *)&v29[8] = 1024;
      v30 = 720;
      v31 = 1024;
      v32 = v27;
      v33 = 1024;
      v34 = v26;
      v35 = 1024;
      v36 = v19;
      _os_log_error_impl(&dword_19B949000, v23, OS_LOG_TYPE_ERROR, "%s:%d setsockopt(IP_BOUND_IF,%u) on socket %d failed errno=%d", buf, 0x24u);
    }

  }
  isFixedDestination_fromAddress = objc_msgSend_setDestinationAddress_isFixedDestination_fromAddress_(self, v17, (uint64_t)v10, v18, v7, v11);

  return isFixedDestination_fromAddress;
}

- (BOOL)setDestinationAddressToDeviceIDMap:(id)a3
{
  id v5;
  id WeakRetained;
  const char *v7;
  double v8;

  objc_storeStrong((id *)&self->_destinationAddressToDeviceIDMap, a3);
  v5 = a3;
  self->_hasFixedDestination = 1;
  self->_state = 4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend_link_didConnectForDeviceUniqueID_cbuuid_(WeakRetained, v7, (uint64_t)self, v8, self->_deviceUniqueID, self->_cbuuid);

  return 1;
}

- (void)reconnectWithLocalAddress:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  double v7;
  IDSSockAddrWrapper *destinationAddress;
  int socket;
  const sockaddr *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  unsigned __int8 *v14;
  __int128 v15;
  const char *v16;
  uint64_t v17;
  double v18;
  IDSSockAddrWrapper *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  double v33;
  NSObject *v34;
  BOOL v35;
  int v36;
  const char *v37;
  uint64_t v38;
  double v39;
  NSObject *v40;
  IDSSockAddrWrapper *v41;
  int v42;
  uint8_t v43[12];
  socklen_t v44;
  _BYTE v45[48];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  destinationAddress = self->_destinationAddress;
  if (!destinationAddress || self->_hasFixedDestination)
    goto LABEL_19;
  socket = self->_socket;
  v10 = (const sockaddr *)objc_msgSend_sa(destinationAddress, v4, v5, v7);
  v14 = (unsigned __int8 *)objc_msgSend_sa(self->_destinationAddress, v11, v12, v13);
  if (connect(socket, v10, *v14) < 0)
  {
    v36 = *__error();
    objc_msgSend_IDSUDPLink(IDSFoundationLog, v37, v38, v39);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = self->_destinationAddress;
      v42 = self->_socket;
      *(_DWORD *)v45 = 136316162;
      *(_QWORD *)&v45[4] = "-[IDSUDPLink reconnectWithLocalAddress:]";
      *(_WORD *)&v45[12] = 1024;
      *(_DWORD *)&v45[14] = 742;
      *(_WORD *)&v45[18] = 2112;
      *(_QWORD *)&v45[20] = v41;
      *(_WORD *)&v45[28] = 1024;
      *(_DWORD *)&v45[30] = v42;
      *(_WORD *)&v45[34] = 1024;
      *(_DWORD *)&v45[36] = v36;
      _os_log_error_impl(&dword_19B949000, v40, OS_LOG_TYPE_ERROR, "%s:%d connect(%@) on socket %d failed errno=%d", v45, 0x28u);
    }
    goto LABEL_14;
  }
  *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v49 = v15;
  v50 = v15;
  v47 = v15;
  v48 = v15;
  *(_OWORD *)&v45[32] = v15;
  v46 = v15;
  *(_OWORD *)v45 = v15;
  *(_OWORD *)&v45[16] = v15;
  v44 = 128;
  if (getsockname(self->_socket, (sockaddr *)v45, &v44) == -1)
  {
    objc_msgSend_IDSUDPLink(IDSFoundationLog, v16, v17, v18);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      sub_19BAF9F44(v40);
LABEL_14:

    self->_needToConnect = 1;
    goto LABEL_19;
  }
  v19 = [IDSSockAddrWrapper alloc];
  v22 = (void *)objc_msgSend_initWithSockAddr_(v19, v20, (uint64_t)v45, v21);
  objc_msgSend_ipString(v6, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ipString(v22, v27, v28, v29);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26 && !objc_msgSend_isEqualToString_(v26, v30, (uint64_t)v32, v33))
  {
    objc_msgSend_IDSUDPLink(IDSFoundationLog, v30, v31, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_19BAF9FE4();
    v35 = 1;
  }
  else
  {
    objc_msgSend_IDSUDPLink(IDSFoundationLog, v30, v31, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_19B949000, v34, OS_LOG_TYPE_DEFAULT, "reconnectWithLocalAddress succeeded", v43, 2u);
    }
    v35 = 0;
  }

  self->_needToConnect = v35;
LABEL_19:

}

- (id)newSocketWithIPVersion:(unint64_t)a3 wantsAWDL:(BOOL)a4 wantsWiFi:(BOOL)a5 wantsCellular:(BOOL)a6 clientUUID:(unsigned __int8)a7[16]
{
  double v7;
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  int v14;
  unsigned int NewUDPSocketWithIPVersion_localPort_wantsAWDL_clientUUID;
  const char *v16;
  uint64_t v17;
  double v18;
  unsigned int v19;
  const char *v20;
  uint64_t v21;
  double v22;
  NSObject *v23;
  int port;
  int socket;
  int cellularSocket;
  int cellularPort;
  _BOOL8 allowsLinkLocal;
  _BOOL8 useDefaultInterfaceOnly;
  const char *v30;
  double v31;
  const char *v32;
  double v33;
  id result;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  char isEqualToString;
  _QWORD v40[5];
  _QWORD v41[5];
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  if (a3)
    v14 = 30;
  else
    v14 = 2;
  self->_addressFamily = v14;
  self->_wantsAWDL = a4;
  self->_wantsWiFi = a5;
  self->_wantsCellular = a6;
  NewUDPSocketWithIPVersion_localPort_wantsAWDL_clientUUID = objc_msgSend__createNewUDPSocketWithIPVersion_localPort_wantsAWDL_clientUUID_(self, a2, a3, v7, &self->_port, a4, a7);
  self->_socket = NewUDPSocketWithIPVersion_localPort_wantsAWDL_clientUUID;
  if (NewUDPSocketWithIPVersion_localPort_wantsAWDL_clientUUID == -1)
  {
    objc_msgSend_IDSUDPLink(IDSFoundationLog, v16, v17, v18);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_19BAFA05C();
    goto LABEL_18;
  }
  if (!self->_skipTransportThread)
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = sub_19BAC0A84;
    v41[3] = &unk_1E3C1F898;
    v41[4] = self;
    IDSTransportThreadAddSocket(NewUDPSocketWithIPVersion_localPort_wantsAWDL_clientUUID, v41, 0);
  }
  v19 = objc_msgSend__createNewUDPSocketWithIPVersion_localPort_wantsAWDL_clientUUID_(self, v16, a3, v18, &self->_cellularPort, v11, a7);
  self->_cellularSocket = v19;
  if (v19 == -1)
  {
    objc_msgSend_removeSocket(self, v20, v21, v22);
    objc_msgSend_IDSUDPLink(IDSFoundationLog, v36, v37, v38);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_19BAFA0D4();
LABEL_18:

    return 0;
  }
  if (!self->_skipTransportThread)
  {
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = sub_19BAC0A8C;
    v40[3] = &unk_1E3C1F898;
    v40[4] = self;
    IDSTransportThreadAddSocket(v19, v40, 0);
  }
  objc_msgSend_IDSUDPLink(IDSFoundationLog, v20, v21, v22);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    port = self->_port;
    socket = self->_socket;
    cellularSocket = self->_cellularSocket;
    cellularPort = self->_cellularPort;
    *(_DWORD *)buf = 136316162;
    v43 = "-[IDSUDPLink newSocketWithIPVersion:wantsAWDL:wantsWiFi:wantsCellular:clientUUID:]";
    v44 = 1024;
    v45 = socket;
    v46 = 1024;
    v47 = port;
    v48 = 1024;
    v49 = cellularSocket;
    v50 = 1024;
    v51 = cellularPort;
    _os_log_impl(&dword_19B949000, v23, OS_LOG_TYPE_DEFAULT, "%s created UDP sockets. default %d port %d cellular %d cellularPort %d", buf, 0x24u);
  }

  allowsLinkLocal = self->_allowsLinkLocal;
  useDefaultInterfaceOnly = self->_useDefaultInterfaceOnly;
  isEqualToString = objc_msgSend_isEqualToString_(self->_cbuuid, v30, (uint64_t)CFSTR("12345678-7654-DADA-DADA-DADADADADADA"), v31);
  objc_msgSend__createNetworkInterfaceArrayWithIPVersion_wantsAWDL_wantsWiFi_wantsCellular_allowsLinkLocal_useDefaultInterfaceOnly_defaultPairedDevice_(self, v32, a3, v33, v11, v10, v9, allowsLinkLocal, useDefaultInterfaceOnly, isEqualToString);
  result = (id)objc_claimAutoreleasedReturnValue();
  if (!result)
    self->_state = 1;
  return result;
}

- (id)newSocketWithIPVersion:(unint64_t)a3 wantsAWDL:(BOOL)a4 wantsWiFi:(BOOL)a5 wantsCellular:(BOOL)a6
{
  double v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v8[0] = 0;
  v8[1] = 0;
  return (id)objc_msgSend_newSocketWithIPVersion_wantsAWDL_wantsWiFi_wantsCellular_clientUUID_(self, a2, a3, v6, a4, a5, a6, v8);
}

- (id)copyCurrentNetworkInterfaces
{
  double v2;
  _BOOL8 v4;
  _BOOL8 wantsAWDL;
  _BOOL8 wantsWiFi;
  _BOOL8 wantsCellular;
  _BOOL8 allowsLinkLocal;
  _BOOL8 useDefaultInterfaceOnly;
  const char *v10;
  double v11;
  char isEqualToString;

  v4 = self->_addressFamily != 2;
  wantsAWDL = self->_wantsAWDL;
  wantsWiFi = self->_wantsWiFi;
  wantsCellular = self->_wantsCellular;
  allowsLinkLocal = self->_allowsLinkLocal;
  useDefaultInterfaceOnly = self->_useDefaultInterfaceOnly;
  isEqualToString = objc_msgSend_isEqualToString_(self->_cbuuid, a2, (uint64_t)CFSTR("12345678-7654-DADA-DADA-DADADADADADA"), v2);
  objc_msgSend__createNetworkInterfaceArrayWithIPVersion_wantsAWDL_wantsWiFi_wantsCellular_allowsLinkLocal_useDefaultInterfaceOnly_defaultPairedDevice_(self, v10, v4, v11, wantsAWDL, wantsWiFi, wantsCellular, allowsLinkLocal, useDefaultInterfaceOnly, isEqualToString);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  double v11;
  void *v12;
  char *var0;
  uint64_t var16;
  uint64_t v15;
  double v16;
  unint64_t v17;
  int v19;
  int64_t var2;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v12 = v9;
  if (v9 && (objc_msgSend_isEqualToString_(v9, v10, (uint64_t)self->_cbuuid, v11) & 1) == 0)
  {
    _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSUDPLink.m", (const char *)0x333, (uint64_t)a3, v11);
    v17 = 10;
  }
  else
  {
    var0 = a3->var0;
    var2 = a3->var2;
    v21[0] = var0;
    if (a3->var18.ss_family)
    {
      if (a3->var17.ss_family && (var16 = a3->var16, (_DWORD)var16))
      {
        BYTE2(v19) = a3->var21;
        LOWORD(v19) = a3->var20;
        v15 = objc_msgSend__sendBytesArray_lengthArray_arraySize_localInterfaceIndex_localAddress_destinationAddress_trafficClass_DSCP_(self, v10, (uint64_t)v21, v11, &var2, 1, var16, &a3->var17, &a3->var18, v19);
      }
      else
      {
        v15 = objc_msgSend__sendBytes_length_destinationAddress_(self, v10, (uint64_t)var0, v11);
      }
    }
    else
    {
      v15 = objc_msgSend__sendBytes_length_(self, v10, (uint64_t)var0, v11);
    }
    v17 = v15;
    _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSUDPLink.m", (const char *)0x34F, (uint64_t)a3, v16);
  }

  return v17;
}

- (unint64_t)sendPacketBuffer:(id *)a3 destination:(id)a4 toDeviceID:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  char *var0;
  int64_t var2;
  uint64_t v16;
  const char *v17;
  double v18;
  unint64_t v19;
  double v20;

  v8 = a4;
  v9 = a5;
  v13 = v9;
  if (v9 && (objc_msgSend_isEqualToString_(v9, v10, (uint64_t)self->_cbuuid, v12) & 1) == 0)
  {
    _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSUDPLink.m", (const char *)0x355, (uint64_t)a3, v12);
    v19 = 10;
  }
  else
  {
    var0 = a3->var0;
    var2 = a3->var2;
    v16 = objc_msgSend_sa(v8, v10, v11, v12);
    v19 = objc_msgSend__sendBytes_length_destinationAddress_(self, v17, (uint64_t)var0, v18, var2, v16);
    _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSUDPLink.m", (const char *)0x35D, (uint64_t)a3, v20);
  }

  return v19;
}

- (unint64_t)sendPacketBuffer:(id *)a3 sourceInterface:(id)a4 destination:(id)a5 toDeviceID:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  char *var0;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  const char *v31;
  double v32;
  unint64_t v33;
  double v34;
  int v36;
  int64_t var2;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v16 = v12;
  if (v12 && (objc_msgSend_isEqualToString_(v12, v13, (uint64_t)self->_cbuuid, v15) & 1) == 0)
  {
    _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSUDPLink.m", (const char *)0x363, (uint64_t)a3, v15);
    v33 = 10;
  }
  else
  {
    var0 = a3->var0;
    var2 = a3->var2;
    v38[0] = var0;
    v18 = objc_msgSend_index(v10, v13, v14, v15);
    objc_msgSend_address(v10, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_sa(v22, v23, v24, v25);
    v30 = objc_msgSend_sa(v11, v27, v28, v29);
    BYTE2(v36) = a3->var21;
    LOWORD(v36) = a3->var20;
    v33 = objc_msgSend__sendBytesArray_lengthArray_arraySize_localInterfaceIndex_localAddress_destinationAddress_trafficClass_DSCP_(self, v31, (uint64_t)v38, v32, &var2, 1, v18, v26, v30, v36);

    _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSUDPLink.m", (const char *)0x373, (uint64_t)a3, v34);
  }

  return v33;
}

- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  const char *v12;
  double v13;
  void *v14;
  double v15;
  __int128 v16;
  _QWORD *v17;
  _QWORD *v18;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **v19;
  uint64_t v20;
  _QWORD *v21;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v30;
  _OWORD v31[4];
  _OWORD v32[4];
  uint64_t v33;

  v7 = *(_QWORD *)&a4;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v14 = v11;
  if (v11 && (objc_msgSend_isEqualToString_(v11, v12, (uint64_t)self->_cbuuid, v13) & 1) == 0)
  {
    if ((int)v7 < 1)
    {
      v26 = 10;
    }
    else
    {
      v24 = v7;
      v26 = 10;
      do
      {
        v25 = (uint64_t)*a3++;
        _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSUDPLink.m", (const char *)0x37A, v25, v15);
        --v24;
      }
      while (v24);
    }
  }
  else
  {
    *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v32[2] = v16;
    v32[3] = v16;
    v32[0] = v16;
    v32[1] = v16;
    v31[2] = v16;
    v31[3] = v16;
    v31[0] = v16;
    v31[1] = v16;
    if ((int)v7 >= 1)
    {
      v17 = v31;
      v18 = v32;
      v19 = a3;
      v20 = v7;
      do
      {
        v21 = *v19++;
        *v18++ = *v21;
        *v17++ = v21[2];
        --v20;
      }
      while (v20);
    }
    v22 = *a3;
    if (!*((_BYTE *)*a3 + 185) || (*((_BYTE *)v22 + 57) ? (v23 = *((_DWORD *)v22 + 12) == 0) : (v23 = 1), v23))
    {
      v26 = 12;
    }
    else
    {
      BYTE2(v30) = *((_BYTE *)v22 + 442);
      LOWORD(v30) = *((_WORD *)v22 + 220);
      v26 = objc_msgSend__sendBytesArray_lengthArray_arraySize_localInterfaceIndex_localAddress_destinationAddress_trafficClass_DSCP_(self, v12, (uint64_t)v32, -3.72066208e-103, v31, v7, v30);
    }
    if ((int)v7 >= 1)
    {
      v27 = v7;
      do
      {
        v28 = (uint64_t)*a3++;
        _IDSLinkPacketBufferRelease((uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSUDPLink.m", (const char *)0x39A, v28, *(double *)&v16);
        --v27;
      }
      while (v27);
    }
  }

  return v26;
}

- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4
{
  double previousReportTime;
  double v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  unint64_t state;
  void *v14;
  const char *v15;
  void *v16;
  unint64_t totalPacketsSent;
  const char *v18;
  double v19;
  void *v20;
  unint64_t v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  void *v26;
  unint64_t totalPacketsReceived;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  __int128 v33;
  unint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;

  previousReportTime = self->_previousReportTime;
  if (previousReportTime == 0.0)
  {
    v12 = 0;
  }
  else
  {
    v7 = a3 - previousReportTime;
    v8 = self->_totalBytesSent - self->_previousBytesSent;
    v9 = self->_totalBytesReceived - self->_previousBytesReceived;
    if (a4)
      v10 = 42;
    else
      v10 = 32;
    v37 = v10;
    v38 = (void *)MEMORY[0x1E0CB3940];
    if (self->_hasTemporaryError)
    {
      v11 = " HostDown";
    }
    else
    {
      state = self->_state;
      if (state > 6)
        v11 = "UnexpectedState";
      else
        v11 = _IDSLinkStateStrings[state];
    }
    v36 = v11;
    v35 = self->_totalPacketsSent - self->_previousPacketsSent;
    formattedBytes(v8, a2, previousReportTime);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    formattedSpeed((unint64_t)((double)(8 * v8) / v7 + 0.5), v15, (double)(8 * v8) / v7 + 0.5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    totalPacketsSent = self->_totalPacketsSent;
    formattedBytes(self->_totalBytesSent, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = self->_totalPacketsReceived - self->_previousPacketsReceived;
    formattedBytes(v9, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    formattedSpeed((unint64_t)((double)(8 * v9) / v7 + 0.5), v25, (double)(8 * v9) / v7 + 0.5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    totalPacketsReceived = self->_totalPacketsReceived;
    formattedBytes(self->_totalBytesReceived, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v38, v31, (uint64_t)CFSTR("%c InfraWiFi (%s) Tx %6llu pkts %@B %@bps     %6llu pkts %@B\n                        Rx %6llu pkts %@B %@bps     %6llu pkts %@B\n"), v32, v37, v36, v35, v14, v16, totalPacketsSent, v20, v21, v24, v26, totalPacketsReceived, v30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  self->_previousReportTime = a3;
  v33 = *(_OWORD *)&self->_totalBytesReceived;
  *(_OWORD *)&self->_previousBytesSent = *(_OWORD *)&self->_totalBytesSent;
  *(_OWORD *)&self->_previousBytesReceived = v33;
  return v12;
}

- (BOOL)setTrafficClass:(int)a3
{
  double v3;
  uint64_t v4;
  uint64_t socket;
  int v7;
  const char *v8;
  double v9;
  uint64_t cellularSocket;

  v4 = *(_QWORD *)&a3;
  socket = self->_socket;
  if ((_DWORD)socket == -1)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v7 = objc_msgSend__setTrafficClassOnSocket_trafficClassValue_(self, a2, socket, v3, v4);
    if (v7)
    {
      cellularSocket = self->_cellularSocket;
      if ((_DWORD)cellularSocket == -1)
        LOBYTE(v7) = 1;
      else
        LOBYTE(v7) = objc_msgSend__setTrafficClassOnSocket_trafficClassValue_(self, v8, cellularSocket, v9, v4);
    }
  }
  return v7;
}

- (void)setWiFiAssistState:(BOOL)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  double v8;
  NSObject *v9;
  int v10;
  _BOOL4 v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = 1;
  if (!a3)
    v5 = 2;
  v12 = v5;
  v11 = a3;
  if (setsockopt(self->_cellularSocket, 0xFFFF, 4387, &v12, 8u) == -1
    || setsockopt(self->_cellularSocket, 0xFFFF, 4373, &v11, 4u) == -1)
  {
    objc_msgSend_IDSUDPLink(IDSFoundationLog, v6, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *__error();
      *(_DWORD *)buf = 136315650;
      v14 = "-[IDSUDPLink setWiFiAssistState:]";
      v15 = 1024;
      v16 = 983;
      v17 = 1024;
      v18 = v10;
      _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d setsockopt failed, errno: %d", buf, 0x18u);
    }

  }
  else
  {
    self->_wifiAssistEnabled = a3;
  }
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)cbuuid
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCbuuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSString)deviceUniqueID
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setDeviceUniqueID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned __int16)a3
{
  self->_port = a3;
}

- (unsigned)cellularPort
{
  return self->_cellularPort;
}

- (void)setCellularPort:(unsigned __int16)a3
{
  self->_cellularPort = a3;
}

- (int)socket
{
  return self->_socket;
}

- (BOOL)useDefaultInterfaceOnly
{
  return self->_useDefaultInterfaceOnly;
}

- (void)setUseDefaultInterfaceOnly:(BOOL)a3
{
  self->_useDefaultInterfaceOnly = a3;
}

- (BOOL)isInvalidated
{
  return self->_isInvalidated;
}

- (double)lastDestinationSent
{
  return self->_lastDestinationSent;
}

- (void)setLastDestinationSent:(double)a3
{
  self->_lastDestinationSent = a3;
}

- (double)lastDestinationReceived
{
  return self->_lastDestinationReceived;
}

- (IDSLinkDelegate)delegate
{
  return (IDSLinkDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IDSLinkDelegate)alternateDelegate
{
  return (IDSLinkDelegate *)objc_loadWeakRetained((id *)&self->_alternateDelegate);
}

- (void)setAlternateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_alternateDelegate, a3);
}

- (BOOL)skipTransportThread
{
  return self->_skipTransportThread;
}

- (void)setSkipTransportThread:(BOOL)a3
{
  self->_skipTransportThread = a3;
}

- (int)cellularSocket
{
  return self->_cellularSocket;
}

- (BOOL)allowsLinkLocal
{
  return self->_allowsLinkLocal;
}

- (void)setAllowsLinkLocal:(BOOL)a3
{
  self->_allowsLinkLocal = a3;
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
  objc_storeStrong((id *)&self->_destinationAddressToDeviceIDMap, 0);
  objc_storeStrong((id *)&self->_destinationAddress, 0);
  objc_storeStrong((id *)&self->_localAddress, 0);
}

@end
