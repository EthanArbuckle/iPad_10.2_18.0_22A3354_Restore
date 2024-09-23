@implementation IDSSocketPairProtobufMessage

- (IDSSocketPairProtobufMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4
{
  uint64_t v4;
  id v6;
  IDSSocketPairProtobufMessage *v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  unsigned int v20;
  uint64_t v21;
  const char *v22;
  double v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  unsigned int v28;
  int v29;
  const char *v30;
  uint64_t v31;
  double v32;
  const char *v33;
  uint64_t v34;
  double v35;
  IDSSocketPairProtobufMessage *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  const char *v41;
  double v42;
  uint64_t v43;
  NSString *peerResponseIdentifier;
  const char *v45;
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
  const char *v66;
  double v67;
  const char *v68;
  double v69;
  const char *v70;
  uint64_t v71;
  double v72;
  unint64_t v73;
  uint64_t v74;
  const char *v75;
  unint64_t v76;
  double v77;
  id v78;
  unint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  NSDate *expiryDate;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  char v88;
  unsigned __int16 v89;
  unsigned int v90;
  objc_super v91;
  uint8_t buf[4];
  int v93;
  __int16 v94;
  unsigned int v95;
  __int16 v96;
  int v97;
  uint64_t v98;

  v4 = a3;
  v98 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v91.receiver = self;
  v91.super_class = (Class)IDSSocketPairProtobufMessage;
  v7 = -[IDSSocketPairMessage initWithCommand:underlyingData:](&v91, sel_initWithCommand_underlyingData_, v4, v6);
  if (!v7)
  {
LABEL_26:
    v36 = v7;
    goto LABEL_27;
  }
  v8 = (void *)MEMORY[0x1A1AC8274]();
  v90 = -1431655766;
  objc_msgSend_getBytes_range_(v6, v9, (uint64_t)&v90, v10, 0, 4);
  v90 = bswap32(v90);
  v89 = -21846;
  objc_msgSend_getBytes_range_(v6, v11, (uint64_t)&v89, v12, 4, 2);
  v89 = bswap32(v89) >> 16;
  v88 = -86;
  objc_msgSend_getBytes_range_(v6, v13, (uint64_t)&v88, v14, 6, 1);
  v87 = -1431655766;
  objc_msgSend_getBytes_range_(v6, v15, (uint64_t)&v87, v16, 7, 4);
  v20 = v87;
  v21 = bswap32(v87);
  v87 = v21;
  if (!v20)
  {
    v37 = 11;
LABEL_14:
    *(_DWORD *)buf = -1431655766;
    objc_msgSend_getBytes_range_(v6, v17, (uint64_t)buf, v19, v37, 4);
    v47 = *(_DWORD *)buf;
    *(_DWORD *)buf = bswap32(*(unsigned int *)buf);
    v48 = v37 + 4;
    if (v47)
    {
      objc_msgSend_subdataWithRange_(v6, v45, v48, v46);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = *(unsigned int *)buf;
      v51 = objc_alloc(MEMORY[0x1E0CB3940]);
      v54 = objc_msgSend_initWithData_encoding_(v51, v52, (uint64_t)v49, v53, 4);
      messageUUID = v7->_messageUUID;
      v7->_messageUUID = (NSString *)v54;

      v48 += v50;
    }
    v56 = v88;
    if ((v88 & 0x10) != 0)
    {
      v86 = -1431655766;
      objc_msgSend_getBytes_range_(v6, v45, (uint64_t)&v86, v46, v48, 4);
      v57 = v86;
      v86 = bswap32(v86);
      v48 += 4;
      if (v57)
      {
        objc_msgSend_subdataWithRange_(v6, v45, v48, v46);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v86;
        v60 = objc_alloc(MEMORY[0x1E0CB3940]);
        v63 = (void *)objc_msgSend_initWithData_encoding_(v60, v61, (uint64_t)v58, v62, 4);
        objc_msgSend_setTopic_(v7, v64, (uint64_t)v63, v65);

        v48 += v59;
      }
      v56 = v88;
    }
    v7->_sequenceNumber = v90;
    v7->_streamID = v89;
    v7->_expectsPeerResponse = v56 & 1;
    v7->_compressed = (v56 & 2) != 0;
    v7->_wantsAppAck = (v56 & 4) != 0;
    v7->_didWakeHint = (v56 & 0x20) != 0;
    objc_msgSend_getBytes_range_(v6, v45, (uint64_t)&v7->_type, v46, v48, 2);
    v7->_type = bswap32(v7->_type) >> 16;
    objc_msgSend_getBytes_range_(v6, v66, (uint64_t)&v7->_isResponse, v67, v48 + 2, 2);
    v7->_isResponse = bswap32(v7->_isResponse) >> 16;
    v86 = 0;
    objc_msgSend_getBytes_range_(v6, v68, (uint64_t)&v86, v69, v48 + 4, 4);
    v85 = -1431655766;
    v86 = bswap32(v86);
    v73 = v48 + 8;
    v7->_payloadOffset = v73;
    if ((v88 & 8) != 0)
      v74 = -4;
    else
      v74 = 0;
    v76 = v74 + objc_msgSend_length(v6, v70, v71, v72) - v7->_payloadOffset;
    v7->_payloadLength = v76;
    if ((v88 & 8) != 0)
    {
      objc_msgSend_getBytes_range_(v6, v75, (uint64_t)&v85, v77, v76 + v73, 4);
      v85 = bswap32(v85);
      v78 = objc_alloc(MEMORY[0x1E0C99D68]);
      LODWORD(v79) = v85;
      v82 = objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v78, v80, v81, (double)v79);
      expiryDate = v7->_expiryDate;
      v7->_expiryDate = (NSDate *)v82;

    }
    objc_autoreleasePoolPop(v8);
    goto LABEL_26;
  }
  if (v21 + 11 <= (unint64_t)objc_msgSend_length(v6, v17, v18, v19))
  {
    objc_msgSend_subdataWithRange_(v6, v22, 11, v23, v87);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v87;
    v40 = objc_alloc(MEMORY[0x1E0CB3940]);
    v43 = objc_msgSend_initWithData_encoding_(v40, v41, (uint64_t)v38, v42, 4);
    peerResponseIdentifier = v7->_peerResponseIdentifier;
    v7->_peerResponseIdentifier = (NSString *)v43;

    v37 = v39 + 11;
    goto LABEL_14;
  }
  OSLogHandleForIDSCategory();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v28 = v87;
    v29 = objc_msgSend_length(v6, v25, v26, v27);
    *(_DWORD *)buf = 67109632;
    v93 = 11;
    v94 = 1024;
    v95 = v28;
    v96 = 1024;
    v97 = v29;
    _os_log_impl(&dword_19B949000, v24, OS_LOG_TYPE_DEFAULT, "Response identifier length is bigger than packet size, offset %u identifier length %u packet length %u\n", buf, 0x14u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      objc_msgSend_length(v6, v30, v31, v32);
      MarcoLog();
    }
    if (IMShouldLog())
    {
      objc_msgSend_length(v6, v33, v34, v35);
      IMLogString();
    }
  }
  objc_autoreleasePoolPop(v8);
  v36 = 0;
LABEL_27:

  return v36;
}

- (IDSSocketPairProtobufMessage)initWithSequenceNumber:(unsigned int)a3 streamID:(unsigned __int16)a4 expectsPeerResponse:(BOOL)a5 wantsAppAck:(BOOL)a6 compressed:(BOOL)a7 didWakeHint:(BOOL)a8 peerResponseIdentifier:(id)a9 messageUUID:(id)a10 expiryDate:(id)a11 protobuf:(id)a12
{
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  IDSSocketPairProtobufMessage *v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  NSData *data;
  id v35;
  objc_super v36;

  v35 = a9;
  v16 = a10;
  v17 = a11;
  v18 = a12;
  v36.receiver = self;
  v36.super_class = (Class)IDSSocketPairProtobufMessage;
  v21 = -[IDSSocketPairProtobufMessage init](&v36, sel_init);
  if (v21)
  {
    v21->_isResponse = objc_msgSend_isResponse(v18, v19, v20, v22);
    v21->_type = objc_msgSend_type(v18, v23, v24, v25);
    objc_msgSend_data(v18, v26, v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    data = v21->_data;
    v21->_data = (NSData *)v29;

    v21->_sequenceNumber = a3;
    v21->_streamID = a4;
    v21->_expectsPeerResponse = a5;
    v21->_wantsAppAck = a6;
    v21->_compressed = a7;
    v21->_didWakeHint = a8;
    objc_storeStrong((id *)&v21->_peerResponseIdentifier, a9);
    objc_storeStrong((id *)&v21->_messageUUID, a10);
    objc_storeStrong((id *)&v21->_expiryDate, a11);
  }

  return v21;
}

- (unsigned)command
{
  return 3;
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
  id v3;
  const char *v4;
  uint64_t v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  char expectsPeerResponse;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  int v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  const char *v30;
  double v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  const char *v38;
  double v39;
  const char *v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  double v46;
  void *v47;
  int v48;
  void *v49;
  const char *v50;
  double v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  double v55;
  const char *v56;
  double v57;
  const char *v58;
  double v59;
  const char *v60;
  double v61;
  const char *v62;
  uint64_t v63;
  double v64;
  const char *v65;
  double v66;
  const char *v67;
  uint64_t v68;
  double v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  double v73;
  unsigned int v74;
  const char *v75;
  double v76;
  const char *v77;
  uint64_t v78;
  double v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  double v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  double v87;
  void *v88;
  const char *v89;
  double v90;
  NSDate *expiryDate;
  double v92;
  const char *v93;
  unsigned int v95;
  __int16 v96;
  __int16 v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  char v101;
  __int16 v102;
  unsigned int v103;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v103 = bswap32(objc_msgSend_sequenceNumber(self, v4, v5, v6));
  objc_msgSend_appendBytes_length_(v3, v7, (uint64_t)&v103, v8, 4);
  v102 = __rev16(objc_msgSend_streamID(self, v9, v10, v11));
  objc_msgSend_appendBytes_length_(v3, v12, (uint64_t)&v102, v13, 2);
  expectsPeerResponse = self->_expectsPeerResponse;
  v101 = expectsPeerResponse;
  if (self->_compressed)
  {
    expectsPeerResponse |= 2u;
    v101 = expectsPeerResponse;
  }
  if (self->_wantsAppAck)
  {
    expectsPeerResponse |= 4u;
    v101 = expectsPeerResponse;
  }
  if (self->_expiryDate)
  {
    expectsPeerResponse |= 8u;
    v101 = expectsPeerResponse;
  }
  objc_msgSend_topic(self, v14, v15, v16);
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v22 = (void *)v18;
    v23 = objc_msgSend_useDynamicServiceName(self, v19, v20, v21);

    if (v23)
    {
      expectsPeerResponse |= 0x10u;
      v101 = expectsPeerResponse;
    }
  }
  if (self->_didWakeHint)
    v101 = expectsPeerResponse | 0x20;
  objc_msgSend_appendBytes_length_(v3, v19, (uint64_t)&v101, v21, 1);
  objc_msgSend_dataUsingEncoding_(self->_peerResponseIdentifier, v24, 4, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = bswap32(objc_msgSend_length(v26, v27, v28, v29));
  objc_msgSend_appendBytes_length_(v3, v30, (uint64_t)&v100, v31, 4);
  if (v100)
    objc_msgSend_appendData_(v3, v32, (uint64_t)v26, v33);
  objc_msgSend_dataUsingEncoding_(self->_messageUUID, v32, 4, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = bswap32(objc_msgSend_length(v34, v35, v36, v37));
  objc_msgSend_appendBytes_length_(v3, v38, (uint64_t)&v99, v39, 4);
  if (v99)
    objc_msgSend_appendData_(v3, v40, (uint64_t)v34, v42);
  objc_msgSend_topic(self, v40, v41, v42);
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v47 = (void *)v43;
    v48 = objc_msgSend_useDynamicServiceName(self, v44, v45, v46);

    if (v48)
    {
      objc_msgSend_topic(self, v44, v45, v46);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dataUsingEncoding_(v49, v50, 4, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v98 = bswap32(objc_msgSend_length(v52, v53, v54, v55));
      objc_msgSend_appendBytes_length_(v3, v56, (uint64_t)&v98, v57, 4);
      if (v98)
        objc_msgSend_appendData_(v3, v58, (uint64_t)v52, v59);

    }
  }
  v97 = __rev16(objc_msgSend_type(self, v44, v45, v46));
  objc_msgSend_appendBytes_length_(v3, v60, (uint64_t)&v97, v61, 2);
  v96 = __rev16(objc_msgSend_isResponse(self, v62, v63, v64));
  objc_msgSend_appendBytes_length_(v3, v65, (uint64_t)&v96, v66, 2);
  objc_msgSend_data(self, v67, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = bswap32(objc_msgSend_length(v70, v71, v72, v73));

  v98 = v74;
  objc_msgSend_appendBytes_length_(v3, v75, (uint64_t)&v98, v76, 4);
  objc_msgSend_data(self, v77, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend_length(v80, v81, v82, v83);

  if (v84)
  {
    objc_msgSend_data(self, v85, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendData_(v3, v89, (uint64_t)v88, v90);

  }
  expiryDate = self->_expiryDate;
  if (expiryDate)
  {
    objc_msgSend_timeIntervalSinceReferenceDate(expiryDate, v85, v86, v87);
    v95 = bswap32(v92);
    objc_msgSend_appendBytes_length_(v3, v93, (uint64_t)&v95, v92, 4);
  }

  return v3;
}

- (BOOL)expectsPeerResponse
{
  return self->_expectsPeerResponse;
}

- (NSString)messageUUID
{
  return self->_messageUUID;
}

- (BOOL)wantsAppAck
{
  return self->_wantsAppAck;
}

- (NSString)peerResponseIdentifier
{
  return self->_peerResponseIdentifier;
}

- (unsigned)isResponse
{
  return self->_isResponse;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unsigned __int16)a3
{
  self->_streamID = a3;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  self->_sequenceNumber = a3;
}

- (BOOL)compressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);
  objc_storeStrong((id *)&self->_peerResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
