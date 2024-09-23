@implementation IDSSocketPairDataMessage

- (IDSSocketPairDataMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4
{
  uint64_t v4;
  id v6;
  const char *v7;
  IDSSocketPairDataMessage *v8;
  double v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  unsigned int v19;
  uint64_t v20;
  const char *v21;
  double v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  unsigned int v27;
  int v28;
  const char *v29;
  uint64_t v30;
  double v31;
  const char *v32;
  uint64_t v33;
  double v34;
  IDSSocketPairDataMessage *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  const char *v40;
  double v41;
  uint64_t v42;
  NSString *peerResponseIdentifier;
  const char *v44;
  uint64_t v45;
  double v46;
  int v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id v51;
  const char *v52;
  double v53;
  uint64_t v54;
  NSString *messageUUID;
  char v56;
  unsigned int v57;
  void *v58;
  uint64_t v59;
  id v60;
  const char *v61;
  double v62;
  void *v63;
  const char *v64;
  double v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  double v69;
  char v70;
  id v71;
  unint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  NSDate *expiryDate;
  unsigned int v78;
  unsigned int v79;
  char v80;
  unsigned __int16 v81;
  unsigned int v82;
  objc_super v83;
  uint8_t buf[4];
  int v85;
  __int16 v86;
  unsigned int v87;
  __int16 v88;
  int v89;
  uint64_t v90;

  v4 = a3;
  v90 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v83.receiver = self;
  v83.super_class = (Class)IDSSocketPairDataMessage;
  v8 = -[IDSSocketPairMessage initWithCommand:underlyingData:](&v83, sel_initWithCommand_underlyingData_, v4, v6);
  if (!v8)
  {
LABEL_26:
    v35 = v8;
    goto LABEL_27;
  }
  v82 = -1431655766;
  objc_msgSend_getBytes_range_(v6, v7, (uint64_t)&v82, v9, 0, 4);
  v82 = bswap32(v82);
  v81 = -21846;
  objc_msgSend_getBytes_range_(v6, v10, (uint64_t)&v81, v11, 4, 2);
  v81 = bswap32(v81) >> 16;
  v80 = -86;
  objc_msgSend_getBytes_range_(v6, v12, (uint64_t)&v80, v13, 6, 1);
  v79 = -1431655766;
  objc_msgSend_getBytes_range_(v6, v14, (uint64_t)&v79, v15, 7, 4);
  v19 = v79;
  v20 = bswap32(v79);
  v79 = v20;
  if (!v19)
  {
    v36 = 11;
LABEL_14:
    *(_DWORD *)buf = -1431655766;
    objc_msgSend_getBytes_range_(v6, v16, (uint64_t)buf, v18, v36, 4);
    v47 = *(_DWORD *)buf;
    *(_DWORD *)buf = bswap32(*(unsigned int *)buf);
    v48 = v36 + 4;
    if (v47)
    {
      objc_msgSend_subdataWithRange_(v6, v44, v48, v46);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = *(unsigned int *)buf;
      v51 = objc_alloc(MEMORY[0x1E0CB3940]);
      v54 = objc_msgSend_initWithData_encoding_(v51, v52, (uint64_t)v49, v53, 4);
      messageUUID = v8->_messageUUID;
      v8->_messageUUID = (NSString *)v54;

      v48 += v50;
    }
    v56 = v80;
    if ((v80 & 0x10) != 0)
    {
      v78 = -1431655766;
      objc_msgSend_getBytes_range_(v6, v44, (uint64_t)&v78, v46, v48, 4);
      v57 = v78;
      v78 = bswap32(v78);
      v48 += 4;
      if (v57)
      {
        objc_msgSend_subdataWithRange_(v6, v44, v48, v46);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v78;
        v60 = objc_alloc(MEMORY[0x1E0CB3940]);
        v63 = (void *)objc_msgSend_initWithData_encoding_(v60, v61, (uint64_t)v58, v62, 4);
        objc_msgSend_setTopic_(v8, v64, (uint64_t)v63, v65);

        v48 += v59;
      }
      v56 = v80;
    }
    v8->_payloadOffset = v48;
    v78 = -1431655766;
    if ((v56 & 8) != 0)
      v66 = -4;
    else
      v66 = 0;
    v68 = v66 + objc_msgSend_length(v6, v44, v45, v46) - v8->_payloadOffset;
    v8->_payloadLength = v68;
    v70 = v80;
    if ((v80 & 8) != 0)
    {
      objc_msgSend_getBytes_range_(v6, v67, (uint64_t)&v78, v69, v68 + v48, 4);
      v78 = bswap32(v78);
      v71 = objc_alloc(MEMORY[0x1E0C99D68]);
      LODWORD(v72) = v78;
      v75 = objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v71, v73, v74, (double)v72);
      expiryDate = v8->_expiryDate;
      v8->_expiryDate = (NSDate *)v75;

      v70 = v80;
    }
    *(_DWORD *)(&v8->super._wasWrittenToConnection + 2) = v82;
    LOWORD(v8->_sequenceNumber) = v81;
    v8->_expectsPeerResponse = v70 & 1;
    v8->_compressed = (v70 & 2) != 0;
    v8->_wantsAppAck = (v70 & 4) != 0;
    v8->_didWakeHint = (v70 & 0x20) != 0;
    goto LABEL_26;
  }
  if (v20 + 11 <= (unint64_t)objc_msgSend_length(v6, v16, v17, v18))
  {
    objc_msgSend_subdataWithRange_(v6, v21, 11, v22, v79);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v79;
    v39 = objc_alloc(MEMORY[0x1E0CB3940]);
    v42 = objc_msgSend_initWithData_encoding_(v39, v40, (uint64_t)v37, v41, 4);
    peerResponseIdentifier = v8->_peerResponseIdentifier;
    v8->_peerResponseIdentifier = (NSString *)v42;

    v36 = v38 + 11;
    goto LABEL_14;
  }
  OSLogHandleForIDSCategory();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v27 = v79;
    v28 = objc_msgSend_length(v6, v24, v25, v26);
    *(_DWORD *)buf = 67109632;
    v85 = 11;
    v86 = 1024;
    v87 = v27;
    v88 = 1024;
    v89 = v28;
    _os_log_impl(&dword_19B949000, v23, OS_LOG_TYPE_DEFAULT, "Response identifier length is bigger than packet size, offset %u identifier length %u packet length %u\n", buf, 0x14u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      objc_msgSend_length(v6, v29, v30, v31);
      MarcoLog();
    }
    if (IMShouldLog())
    {
      objc_msgSend_length(v6, v32, v33, v34);
      IMLogString();
    }
  }
  v35 = 0;
LABEL_27:

  return v35;
}

- (IDSSocketPairDataMessage)initWithSequenceNumber:(unsigned int)a3 streamID:(unsigned __int16)a4 expectsPeerResponse:(BOOL)a5 wantsAppAck:(BOOL)a6 compressed:(BOOL)a7 didWakeHint:(BOOL)a8 peerResponseIdentifier:(id)a9 messageUUID:(id)a10 data:(id)a11 expiryDate:(id)a12
{
  id v16;
  id v17;
  IDSSocketPairDataMessage *v18;
  IDSSocketPairDataMessage *v19;
  id v24;
  id v25;
  objc_super v26;

  v25 = a9;
  v24 = a10;
  v16 = a11;
  v17 = a12;
  v26.receiver = self;
  v26.super_class = (Class)IDSSocketPairDataMessage;
  v18 = -[IDSSocketPairDataMessage init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    *(_DWORD *)(&v18->super._wasWrittenToConnection + 2) = a3;
    LOWORD(v18->_sequenceNumber) = a4;
    objc_storeStrong((id *)&v18->_data, a11);
    v19->_expectsPeerResponse = a5;
    v19->_compressed = a7;
    v19->_wantsAppAck = a6;
    v19->_didWakeHint = a8;
    objc_storeStrong((id *)&v19->_peerResponseIdentifier, a9);
    objc_storeStrong((id *)&v19->_messageUUID, a10);
    objc_storeStrong((id *)&v19->_expiryDate, a12);
  }

  return v19;
}

- (unsigned)command
{
  return 0;
}

- (NSData)data
{
  uint64_t v2;
  double v3;
  NSData *data;
  NSData *v5;
  void *v7;
  const char *v8;
  double v9;

  data = self->_data;
  if (data)
  {
    v5 = data;
  }
  else
  {
    objc_msgSend__existingUnderlyingData(self, a2, v2, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_subdataWithRangeNoCopy_(v7, v8, self->_payloadOffset, v9, self->_payloadLength);
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_nonHeaderData
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  char expectsPeerResponse;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  double v23;
  void *v24;
  int v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  const char *v32;
  double v33;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  const char *v40;
  double v41;
  const char *v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  double v48;
  void *v49;
  int v50;
  void *v51;
  const char *v52;
  double v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  double v57;
  const char *v58;
  double v59;
  const char *v60;
  double v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  double v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  double v69;
  void *v70;
  const char *v71;
  double v72;
  NSDate *expiryDate;
  double v74;
  const char *v75;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  char v80;
  __int16 v81;
  unsigned int v82;

  objc_msgSend_data(MEMORY[0x1E0C99DF0], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = bswap32(objc_msgSend_sequenceNumber(self, v6, v7, v8));
  objc_msgSend_appendBytes_length_(v5, v9, (uint64_t)&v82, v10, 4);
  v81 = __rev16(objc_msgSend_streamID(self, v11, v12, v13));
  objc_msgSend_appendBytes_length_(v5, v14, (uint64_t)&v81, v15, 2);
  expectsPeerResponse = self->_expectsPeerResponse;
  v80 = expectsPeerResponse;
  if (self->_compressed)
  {
    expectsPeerResponse |= 2u;
    v80 = expectsPeerResponse;
  }
  if (self->_wantsAppAck)
  {
    expectsPeerResponse |= 4u;
    v80 = expectsPeerResponse;
  }
  if (self->_expiryDate)
  {
    expectsPeerResponse |= 8u;
    v80 = expectsPeerResponse;
  }
  objc_msgSend_topic(self, v16, v17, v18);
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v24 = (void *)v20;
    v25 = objc_msgSend_useDynamicServiceName(self, v21, v22, v23);

    if (v25)
    {
      expectsPeerResponse |= 0x10u;
      v80 = expectsPeerResponse;
    }
  }
  if (self->_didWakeHint)
    v80 = expectsPeerResponse | 0x20;
  objc_msgSend_appendBytes_length_(v5, v21, (uint64_t)&v80, v23, 1);
  objc_msgSend_dataUsingEncoding_(self->_peerResponseIdentifier, v26, 4, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = bswap32(objc_msgSend_length(v28, v29, v30, v31));
  objc_msgSend_appendBytes_length_(v5, v32, (uint64_t)&v79, v33, 4);
  if (v79)
    objc_msgSend_appendData_(v5, v34, (uint64_t)v28, v35);
  objc_msgSend_dataUsingEncoding_(self->_messageUUID, v34, 4, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = bswap32(objc_msgSend_length(v36, v37, v38, v39));
  objc_msgSend_appendBytes_length_(v5, v40, (uint64_t)&v78, v41, 4);
  if (v78)
    objc_msgSend_appendData_(v5, v42, (uint64_t)v36, v44);
  objc_msgSend_topic(self, v42, v43, v44);
  v45 = objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v49 = (void *)v45;
    v50 = objc_msgSend_useDynamicServiceName(self, v46, v47, v48);

    if (v50)
    {
      objc_msgSend_topic(self, v46, v47, v48);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dataUsingEncoding_(v51, v52, 4, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      v77 = bswap32(objc_msgSend_length(v54, v55, v56, v57));
      objc_msgSend_appendBytes_length_(v5, v58, (uint64_t)&v77, v59, 4);
      if (v77)
        objc_msgSend_appendData_(v5, v60, (uint64_t)v54, v61);

    }
  }
  objc_msgSend_data(self, v46, v47, v48);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend_length(v62, v63, v64, v65);

  if (v66)
  {
    objc_msgSend_data(self, v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendData_(v5, v71, (uint64_t)v70, v72);

  }
  expiryDate = self->_expiryDate;
  if (expiryDate)
  {
    objc_msgSend_timeIntervalSinceReferenceDate(expiryDate, v67, v68, v69);
    v77 = bswap32(v74);
    objc_msgSend_appendBytes_length_(v5, v75, (uint64_t)&v77, v74, 4);
  }

  return v5;
}

- (BOOL)compressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (NSString)messageUUID
{
  return self->_messageUUID;
}

- (BOOL)expectsPeerResponse
{
  return self->_expectsPeerResponse;
}

- (NSString)peerResponseIdentifier
{
  return self->_peerResponseIdentifier;
}

- (BOOL)wantsAppAck
{
  return self->_wantsAppAck;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void)setExpiryDate:(id)a3
{
  objc_storeStrong((id *)&self->_expiryDate, a3);
}

- (BOOL)didWakeHint
{
  return self->_didWakeHint;
}

- (void)setDidWakeHint:(BOOL)a3
{
  self->_didWakeHint = a3;
}

- (unsigned)streamID
{
  return self->_sequenceNumber;
}

- (void)setStreamID:(unsigned __int16)a3
{
  LOWORD(self->_sequenceNumber) = a3;
}

- (unsigned)sequenceNumber
{
  return *(_DWORD *)(&self->super._wasWrittenToConnection + 2);
}

- (void)setSequenceNumber:(unsigned int)a3
{
  *(_DWORD *)(&self->super._wasWrittenToConnection + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);
  objc_storeStrong((id *)&self->_peerResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
