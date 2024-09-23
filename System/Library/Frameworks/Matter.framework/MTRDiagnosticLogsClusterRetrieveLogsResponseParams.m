@implementation MTRDiagnosticLogsClusterRetrieveLogsResponseParams

- (MTRDiagnosticLogsClusterRetrieveLogsResponseParams)init
{
  MTRDiagnosticLogsClusterRetrieveLogsResponseParams *v2;
  MTRDiagnosticLogsClusterRetrieveLogsResponseParams *v3;
  NSNumber *status;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSData *logContent;
  NSNumber *utcTimeStamp;
  NSNumber *timeSinceBoot;
  NSNumber *timedInvokeTimeoutMs;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTRDiagnosticLogsClusterRetrieveLogsResponseParams;
  v2 = -[MTRDiagnosticLogsClusterRetrieveLogsResponseParams init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    status = v2->_status;
    v2->_status = (NSNumber *)&unk_250591A40;

    objc_msgSend_data(MEMORY[0x24BDBCE50], v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    logContent = v3->_logContent;
    v3->_logContent = (NSData *)v7;

    utcTimeStamp = v3->_utcTimeStamp;
    v3->_utcTimeStamp = 0;

    timeSinceBoot = v3->_timeSinceBoot;
    v3->_timeSinceBoot = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDiagnosticLogsClusterRetrieveLogsResponseParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;

  v4 = objc_alloc_init(MTRDiagnosticLogsClusterRetrieveLogsResponseParams);
  objc_msgSend_status(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatus_(v4, v8, (uint64_t)v7);

  objc_msgSend_logContent(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLogContent_(v4, v12, (uint64_t)v11);

  objc_msgSend_utcTimeStamp(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUtcTimeStamp_(v4, v16, (uint64_t)v15);

  objc_msgSend_timeSinceBoot(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimeSinceBoot_(v4, v20, (uint64_t)v19);

  objc_msgSend_timedInvokeTimeoutMs(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSNumber *status;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  status = self->_status;
  objc_msgSend_base64EncodedStringWithOptions_(self->_logContent, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("<%@: status:%@; logContent:%@; utcTimeStamp:%@; timeSinceBoot:%@; >"),
    v5,
    status,
    v8,
    self->_utcTimeStamp,
    self->_timeSinceBoot);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (MTRDiagnosticLogsClusterRetrieveLogsResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  NSDictionary *v6;
  const char *v7;
  MTRDiagnosticLogsClusterRetrieveLogsResponseParams *v8;
  const char *v9;
  void *v10;
  char *v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  MTRDiagnosticLogsClusterRetrieveLogsResponseParams *v30;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  _BYTE v36[72];
  uint64_t v37;
  objc_super v38;
  uint64_t v39;
  void *v40;
  __int128 buf;
  uint64_t v42;
  char v43;
  char v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = responseValue;
  v38.receiver = self;
  v38.super_class = (Class)MTRDiagnosticLogsClusterRetrieveLogsResponseParams;
  v8 = -[MTRDiagnosticLogsClusterRetrieveLogsResponseParams init](&v38, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 50, 1, error);
  if (v37)
  {
    sub_234104468((uint64_t)v36);
    sub_234104498((uint64_t)v36, *(_QWORD *)(v37 + 8), *(_QWORD *)(v37 + 24));
    v34 = 0uLL;
    v35 = 0;
    sub_234105EE4((uint64_t)v36, 256, &v34);
    if (!(_DWORD)v34)
    {
      LOBYTE(buf) = 0;
      v44 = 0;
      *((_QWORD *)&buf + 1) = 0;
      v42 = 0;
      v43 = 0;
      sub_233D07800((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
      v34 = v32;
      v35 = v33;
      if (!(_DWORD)v32)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)&buf);
        v34 = v32;
        v35 = v33;
        if (!(_DWORD)v32)
        {
          v30 = v8;
          goto LABEL_14;
        }
      }
    }
    v10 = (void *)MEMORY[0x24BDD17C8];
    buf = v34;
    v42 = v35;
    v11 = sub_2341083CC((const char **)&buf, 1);
    objc_msgSend_stringWithFormat_(v10, v12, (uint64_t)CFSTR("Command payload decoding failed: %s"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_234117B80(0, "NotSpecified");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_retainAutorelease(v13);
      v18 = objc_msgSend_UTF8String(v15, v16, v17);
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_233BF3000, v14, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v21 = objc_retainAutorelease(v13);
      objc_msgSend_UTF8String(v21, v22, v23);
      sub_2341147D0(0, 1);
    }
    if (error)
    {
      v39 = *MEMORY[0x24BDD0FD8];
      objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v19, v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_2505249E8, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v26;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v27, (uint64_t)&v40, &v39, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v29, (uint64_t)CFSTR("MTRErrorDomain"), 13, v28);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

    }
  }
  v30 = 0;
LABEL_14:
  sub_233CAF128(&v37);
LABEL_16:

  return v30;
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(NSNumber *)status
{
  objc_setProperty_nonatomic_copy(self, a2, status, 8);
}

- (NSData)logContent
{
  return self->_logContent;
}

- (void)setLogContent:(NSData *)logContent
{
  objc_setProperty_nonatomic_copy(self, a2, logContent, 16);
}

- (NSNumber)utcTimeStamp
{
  return self->_utcTimeStamp;
}

- (void)setUtcTimeStamp:(NSNumber *)utcTimeStamp
{
  objc_setProperty_nonatomic_copy(self, a2, utcTimeStamp, 24);
}

- (NSNumber)timeSinceBoot
{
  return self->_timeSinceBoot;
}

- (void)setTimeSinceBoot:(NSNumber *)timeSinceBoot
{
  objc_setProperty_nonatomic_copy(self, a2, timeSinceBoot, 32);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_timeSinceBoot, 0);
  objc_storeStrong((id *)&self->_utcTimeStamp, 0);
  objc_storeStrong((id *)&self->_logContent, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  void *v13;
  uint64_t *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  _BYTE *v19;
  int v20;
  void *v21;
  uint64_t *v22;
  const char *v23;
  void *v24;
  const char *v25;
  ChipError *result;

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], a3, *(unsigned __int8 *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatus_(self, v8, (uint64_t)v7);

  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v9, *((_QWORD *)a4 + 1), *((_QWORD *)a4 + 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLogContent_(self, v11, (uint64_t)v10);

  if (*((_BYTE *)a4 + 24))
  {
    v13 = (void *)MEMORY[0x24BDD16E0];
    v14 = (uint64_t *)sub_233C25EA4((_BYTE *)a4 + 24);
    objc_msgSend_numberWithUnsignedLongLong_(v13, v15, *v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUtcTimeStamp_(self, v17, (uint64_t)v16);

  }
  else
  {
    objc_msgSend_setUtcTimeStamp_(self, v12, 0);
  }
  v20 = *((unsigned __int8 *)a4 + 40);
  v19 = (char *)a4 + 40;
  if (v20)
  {
    v21 = (void *)MEMORY[0x24BDD16E0];
    v22 = (uint64_t *)sub_233C25EA4(v19);
    objc_msgSend_numberWithUnsignedLongLong_(v21, v23, *v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTimeSinceBoot_(self, v25, (uint64_t)v24);

  }
  else
  {
    result = (ChipError *)objc_msgSend_setTimeSinceBoot_(self, v18, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 6261;
  return result;
}

@end
