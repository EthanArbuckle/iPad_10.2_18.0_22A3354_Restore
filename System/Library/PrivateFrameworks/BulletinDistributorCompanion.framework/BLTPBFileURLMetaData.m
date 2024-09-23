@implementation BLTPBFileURLMetaData

- (BLTPBFileURLMetaData)initWithSequenceNumberManager:(id)a3 extraMetadata:(id)a4
{
  id v6;
  id v7;
  BLTPBFileURLMetaData *v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  const __CFString **v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *p_super;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;
  const __CFString *v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)BLTPBFileURLMetaData;
  v8 = -[BLTPBFileURLMetaData init](&v24, sel_init);
  if (v8)
  {
    +[BLTPBTransportData transportDataWithSequenceNumberManager:](BLTPBTransportData, "transportDataWithSequenceNumberManager:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && v10)
    {
      v27[0] = CFSTR("t");
      v27[1] = CFSTR("x");
      v28[0] = v10;
      v28[1] = v7;
      v11 = (void *)MEMORY[0x24BDBCE70];
      v12 = (void **)v28;
      v13 = (const __CFString **)v27;
      v14 = 2;
    }
    else
    {
      if (!v10)
      {
        blt_ids_log();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          -[BLTPBFileURLMetaData initWithSequenceNumberManager:extraMetadata:].cold.1((uint64_t)v6, p_super, v18, v19, v20, v21, v22, v23);
        goto LABEL_8;
      }
      v25 = CFSTR("t");
      v26 = v10;
      v11 = (void *)MEMORY[0x24BDBCE70];
      v12 = &v26;
      v13 = &v25;
      v14 = 1;
    }
    objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    p_super = &v8->_metadata->super;
    v8->_metadata = (NSDictionary *)v15;
LABEL_8:

    objc_storeStrong((id *)&v8->_extraMetadata, a4);
  }

  return v8;
}

- (BLTPBFileURLMetaData)initWithMetadata:(id)a3 sequenceNumberManager:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BLTPBTransportData *v10;
  void *v11;
  BLTPBTransportData *v12;
  BLTPBFileURLMetaData *v13;
  uint64_t v14;
  NSDictionary *extraMetadata;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  unint64_t sessionState;
  NSObject *v24;
  BLTPBFileURLMetaData *v25;
  NSObject *v26;
  NSObject *v27;
  objc_super v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("t"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [BLTPBTransportData alloc];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("t"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[BLTPBTransportData initWithData:](v10, "initWithData:", v11);

    if (v12)
    {
      v29.receiver = self;
      v29.super_class = (Class)BLTPBFileURLMetaData;
      v13 = -[BLTPBFileURLMetaData init](&v29, sel_init);
      if (v13)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("x"));
        v14 = objc_claimAutoreleasedReturnValue();
        extraMetadata = v13->_extraMetadata;
        v13->_extraMetadata = (NSDictionary *)v14;

        objc_storeStrong((id *)&v13->_metadata, a3);
        if (-[BLTPBTransportData hasSequenceNumber](v12, "hasSequenceNumber"))
        {
          v13->_sessionState = -[BLTPBTransportData backwardsCompatibleSessionState](v12, "backwardsCompatibleSessionState");
          blt_ids_log();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v8, "serviceName");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = -[BLTPBTransportData sequenceNumber](v12, "sequenceNumber");
            -[BLTPBTransportData sessionUUID](v12, "sessionUUID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "UUIDString");
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = (void *)v20;
            v22 = "startAck";
            sessionState = v13->_sessionState;
            if (sessionState == 1)
              v22 = "start";
            *(_DWORD *)buf = 138413058;
            v32 = 2048;
            v31 = v17;
            v33 = v18;
            if (!sessionState)
              v22 = "normal";
            v34 = 2112;
            v35 = v20;
            v36 = 2080;
            v37 = v22;
            _os_log_impl(&dword_2173D9000, v16, OS_LOG_TYPE_INFO, "Sequence number attached to incoming fileURL on service %@: %llu session: %@ state: %s", buf, 0x2Au);

          }
          v13->_sequenceNumberError = -[BLTPBTransportData setSequenceNumberOnManager:](v12, "setSequenceNumberOnManager:", v8);
        }
        else
        {
          blt_ids_log();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2173D9000, v27, OS_LOG_TYPE_INFO, "Received message without sequence number", buf, 2u);
          }

        }
      }
      self = v13;
      v25 = self;
    }
    else
    {
      blt_ids_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v7;
        _os_log_impl(&dword_2173D9000, v26, OS_LOG_TYPE_ERROR, "No transport data. Metadata: %@", buf, 0xCu);
      }

      _BLTCaptureBug(CFSTR("BLTPBFileURLMetaDataMissingTransportData"));
      v25 = 0;
    }

  }
  else
  {
    blt_ids_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v7;
      _os_log_impl(&dword_2173D9000, v24, OS_LOG_TYPE_ERROR, "No transport data. Metadata: %@", buf, 0xCu);
    }

    _BLTCaptureBug(CFSTR("BLTPBFileURLMetadataTransportDataKey is nil"));
    v25 = 0;
  }

  return v25;
}

- (id)transportData
{
  BLTPBTransportData *v3;
  void *v4;
  BLTPBTransportData *v5;

  v3 = [BLTPBTransportData alloc];
  -[NSDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("t"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BLTPBTransportData initWithData:](v3, "initWithData:", v4);

  return v5;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (int64_t)sequenceNumberError
{
  return self->_sequenceNumberError;
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (NSDictionary)extraMetadata
{
  return self->_extraMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)initWithSequenceNumberManager:(uint64_t)a3 extraMetadata:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, a2, a3, "BLTPBFileURLMetaData initWithSequenceNumberManager %@: transportData was nil!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

@end
