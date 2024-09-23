@implementation BLTPBProtobuf

- (BLTPBProtobuf)initWithProtobuf:(id)a3 type:(unsigned __int16)a4 isResponse:(BOOL)a5 sequenceNumberManager:(id)a6
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  int v30;
  const char *v31;
  __CFString *v32;
  BLTPBProtobuf *v33;
  BLTPBProtobuf *v34;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  unsigned int v43;
  _BOOL4 v44;
  objc_super v45;
  __int16 v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  __CFString *v50;
  uint64_t v51;

  v43 = a4;
  v44 = a5;
  v7 = a3;
  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a6;
  v10 = objc_alloc_init(MEMORY[0x24BE7AF00]);
  objc_msgSend(v8, "writeTo:", v10);
  objc_msgSend(v10, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    blt_ids_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[BLTPBProtobuf initWithProtobuf:type:isResponse:sequenceNumberManager:].cold.1((uint64_t)v8, v12, v13, v14, v15, v16, v17, v18);

  }
  +[BLTPBTransportData transportDataWithSequenceNumberManager:](BLTPBTransportData, "transportDataWithSequenceNumberManager:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (BLTIsDebugOrInternalBuild())
  {
    objc_msgSend(v11, "MD5:", buf);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMd5:", v20);

  }
  objc_msgSend(v19, "data");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "length");

  v46 = v22;
  v23 = v22 >> 16;
  if (v22 >> 16)
  {
    v46 = 0;
  }
  else
  {
    objc_msgSend(v19, "data");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendData:", v24);

  }
  objc_msgSend(v11, "appendBytes:length:", &v46, 2);
  blt_ids_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "serviceName");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v32 = CFSTR("not added");
    }
    else
    {
      v38 = (void *)MEMORY[0x24BDD17C8];
      v39 = v7;
      v27 = objc_msgSend(v19, "sequenceNumber");
      objc_msgSend(v9, "currentSessionIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "UUIDString");
      v28 = v8;
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v19, "sessionState");
      v31 = "startAck";
      if (v30 == 1)
        v31 = "start";
      if (!v30)
        v31 = "normal";
      v40 = (void *)v29;
      v36 = v27;
      v37 = v29;
      v8 = v28;
      v7 = v39;
      objc_msgSend(v38, "stringWithFormat:", CFSTR("%llu session: %@ state: %s"), v36, v37, v31);
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138412546;
    v48 = v26;
    v49 = 2112;
    v50 = v32;
    _os_log_impl(&dword_2173D9000, v25, OS_LOG_TYPE_INFO, "Sequence number attached to outgoing protobuf on service %@: %@", buf, 0x16u);
    if (!v23)
    {

    }
  }

  v45.receiver = self;
  v45.super_class = (Class)BLTPBProtobuf;
  v33 = -[BLTPBProtobuf initWithProtobufData:type:isResponse:](&v45, sel_initWithProtobufData_type_isResponse_, v11, v43, v44);
  v34 = v33;
  if (v33)
    objc_storeStrong((id *)&v33->_protobuf, v7);

  return v34;
}

- (BLTPBProtobuf)initWithIDSProtobuf:(id)a3 sequenceNumberManager:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  BLTPBProtobuf *v20;
  void *v22;
  unint64_t v23;
  id v24;
  unint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  BLTPBProtobuf *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD *v35;
  BOOL v36;
  _BOOL4 v37;
  NSObject *v38;
  void *v39;
  __CFString *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  unint64_t sessionState;
  const char *v47;
  const char *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  objc_super v53;
  _BYTE buf[22];
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  const char *v58;
  uint8_t v59[4];
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    blt_ids_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2173D9000, v17, OS_LOG_TYPE_ERROR, "IDSProtobuf is nil", buf, 2u);
    }

    v16 = CFSTR("BLTPBProtobufNilIDSProtobuf");
    goto LABEL_13;
  }
  objc_msgSend(v7, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    blt_ids_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "extendedDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v19;
      _os_log_impl(&dword_2173D9000, v18, OS_LOG_TYPE_ERROR, "IDSProtobuf contains nil data: %@", buf, 0xCu);

    }
    v16 = CFSTR("BLTPBProtobufNilIDSProtobufData");
    goto LABEL_13;
  }
  objc_msgSend(v7, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11 > 1)
  {
    objc_msgSend(v7, "data");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length") - 2;
    v24 = objc_retainAutorelease(v22);
    v25 = *(unsigned __int16 *)(objc_msgSend(v24, "bytes") + v23);
    if (v23 < v25)
    {
      blt_ids_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "extendedDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v25;
        v55 = 2112;
        v56 = (uint64_t)v27;
        _os_log_impl(&dword_2173D9000, v26, OS_LOG_TYPE_ERROR, "IDSProtobuf transport data length is too big. Message data length: %lu transport data length: %lu protobof: %@", buf, 0x20u);

      }
      _BLTCaptureBug(CFSTR("BLTPBProtobufTransportDataLengthTooBig"));
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(objc_retainAutorelease(v24), "bytes"), v23 - v25, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v53.receiver = self;
    v53.super_class = (Class)BLTPBProtobuf;
    v29 = -[BLTPBProtobuf initWithProtobufData:type:isResponse:](&v53, sel_initWithProtobufData_type_isResponse_, v28, objc_msgSend(v7, "type"), objc_msgSend(v7, "isResponse"));

    if (v29)
    {
      objc_msgSend(v7, "context");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLTPBProtobuf setContext:](v29, "setContext:", v30);

      objc_storeStrong((id *)&v29->_idsProtobuf, a3);
      if ((_DWORD)v25)
      {
        objc_msgSend(v7, "transportData");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (!v31)
        {

          blt_ids_log();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "extendedDescription");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v50;
            _os_log_impl(&dword_2173D9000, v49, OS_LOG_TYPE_ERROR, "No transport data.  Protobuf: %@", buf, 0xCu);

          }
          v40 = CFSTR("BLTPBProtobufTransportDataDecodeFail");
          goto LABEL_46;
        }
        if (objc_msgSend(v31, "hasMd5"))
        {
          -[BLTPBProtobuf data](v29, "data");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "MD5:", buf);

          objc_msgSend(v32, "md5");
          v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v35 = (_QWORD *)objc_msgSend(v34, "bytes");
          v36 = *(_QWORD *)buf == *v35 && *(_QWORD *)&buf[8] == v35[1];
          v37 = !v36;

          if (v37)
          {

            blt_ids_log();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v7, "extendedDescription");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v59 = 138412290;
              v60 = v39;
              _os_log_impl(&dword_2173D9000, v38, OS_LOG_TYPE_ERROR, "IDSProtobuf contains bad data.  Protobuf: %@", v59, 0xCu);

            }
            v40 = CFSTR("BLTPBProtobufTransportDataBad");
LABEL_46:
            _BLTCaptureBug(v40);

            self = 0;
LABEL_19:
            v20 = 0;
LABEL_52:

            goto LABEL_14;
          }
        }
        if (objc_msgSend(v32, "hasSequenceNumber"))
        {
          v29->_sessionState = objc_msgSend(v32, "backwardsCompatibleSessionState");
          blt_ids_log();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v8, "serviceName");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v32, "sequenceNumber");
            objc_msgSend(v32, "sessionUUID");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "UUIDString");
            v44 = objc_claimAutoreleasedReturnValue();
            v45 = (void *)v44;
            sessionState = v29->_sessionState;
            v47 = "startAck";
            if (sessionState == 1)
              v47 = "start";
            *(_DWORD *)buf = 138413058;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[4] = v52;
            *(_QWORD *)&buf[14] = v42;
            if (sessionState)
              v48 = v47;
            else
              v48 = "normal";
            v55 = 2112;
            v56 = v44;
            v57 = 2080;
            v58 = v48;
            _os_log_impl(&dword_2173D9000, v41, OS_LOG_TYPE_INFO, "Sequence number attached to incoming protobuf on service %@: %llu session: %@ state: %s", buf, 0x2Au);

          }
          v29->_sequenceNumberError = objc_msgSend(v32, "setSequenceNumberOnManager:", v8);
        }
        else
        {
          blt_ids_log();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2173D9000, v51, OS_LOG_TYPE_INFO, "Received message without sequence number", buf, 2u);
          }

        }
      }
    }
    self = v29;
    v20 = self;
    goto LABEL_52;
  }
  blt_ids_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");
    objc_msgSend(v7, "extendedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    _os_log_impl(&dword_2173D9000, v12, OS_LOG_TYPE_ERROR, "IDSProtobuf missing transport data. Protobuf length: %lu protobof: %@", buf, 0x16u);

  }
  v16 = CFSTR("BLTPBProtobufMissingTransportData");
LABEL_13:
  _BLTCaptureBug(v16);
  v20 = 0;
LABEL_14:

  return v20;
}

- (PBCodable)protobuf
{
  return self->_protobuf;
}

- (void)setProtobuf:(id)a3
{
  objc_storeStrong((id *)&self->_protobuf, a3);
}

- (int64_t)sequenceNumberError
{
  return self->_sequenceNumberError;
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (IDSProtobuf)idsProtobuf
{
  return self->_idsProtobuf;
}

- (void)setIdsProtobuf:(id)a3
{
  objc_storeStrong((id *)&self->_idsProtobuf, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsProtobuf, 0);
  objc_storeStrong((id *)&self->_protobuf, 0);
}

- (void)initWithProtobuf:(uint64_t)a3 type:(uint64_t)a4 isResponse:(uint64_t)a5 sequenceNumberManager:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, a2, a3, "PBDataWriter failed to create NSData object for protobuf %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

@end
