@implementation MTRNetworkCommissioningClusterScanNetworksResponseParams

- (MTRNetworkCommissioningClusterScanNetworksResponseParams)init
{
  MTRNetworkCommissioningClusterScanNetworksResponseParams *v2;
  MTRNetworkCommissioningClusterScanNetworksResponseParams *v3;
  NSNumber *networkingStatus;
  NSString *debugText;
  NSArray *wiFiScanResults;
  NSArray *threadScanResults;
  NSNumber *timedInvokeTimeoutMs;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRNetworkCommissioningClusterScanNetworksResponseParams;
  v2 = -[MTRNetworkCommissioningClusterScanNetworksResponseParams init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    networkingStatus = v2->_networkingStatus;
    v2->_networkingStatus = (NSNumber *)&unk_250591A40;

    debugText = v3->_debugText;
    v3->_debugText = 0;

    wiFiScanResults = v3->_wiFiScanResults;
    v3->_wiFiScanResults = 0;

    threadScanResults = v3->_threadScanResults;
    v3->_threadScanResults = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRNetworkCommissioningClusterScanNetworksResponseParams *v4;
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

  v4 = objc_alloc_init(MTRNetworkCommissioningClusterScanNetworksResponseParams);
  objc_msgSend_networkingStatus(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNetworkingStatus_(v4, v8, (uint64_t)v7);

  objc_msgSend_debugText(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDebugText_(v4, v12, (uint64_t)v11);

  objc_msgSend_wiFiScanResults(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWiFiScanResults_(v4, v16, (uint64_t)v15);

  objc_msgSend_threadScanResults(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setThreadScanResults_(v4, v20, (uint64_t)v19);

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
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: networkingStatus:%@; debugText:%@; wiFiScanResults:%@; threadScanResults:%@; >"),
    v5,
    self->_networkingStatus,
    self->_debugText,
    self->_wiFiScanResults,
    self->_threadScanResults);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRNetworkCommissioningClusterScanNetworksResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  NSDictionary *v6;
  const char *v7;
  MTRNetworkCommissioningClusterScanNetworksResponseParams *v8;
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
  MTRNetworkCommissioningClusterScanNetworksResponseParams *v30;
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
  v38.super_class = (Class)MTRNetworkCommissioningClusterScanNetworksResponseParams;
  v8 = -[MTRNetworkCommissioningClusterScanNetworksResponseParams init](&v38, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 49, 1, error);
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
      BYTE8(buf) = 0;
      v43 = 0;
      v44 = 0;
      sub_233D05A80((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
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

- (NSNumber)networkingStatus
{
  return self->_networkingStatus;
}

- (void)setNetworkingStatus:(NSNumber *)networkingStatus
{
  objc_setProperty_nonatomic_copy(self, a2, networkingStatus, 8);
}

- (NSString)debugText
{
  return self->_debugText;
}

- (void)setDebugText:(NSString *)debugText
{
  objc_setProperty_nonatomic_copy(self, a2, debugText, 16);
}

- (NSArray)wiFiScanResults
{
  return self->_wiFiScanResults;
}

- (void)setWiFiScanResults:(NSArray *)wiFiScanResults
{
  objc_setProperty_nonatomic_copy(self, a2, wiFiScanResults, 24);
}

- (NSArray)threadScanResults
{
  return self->_threadScanResults;
}

- (void)setThreadScanResults:(NSArray *)threadScanResults
{
  objc_setProperty_nonatomic_copy(self, a2, threadScanResults, 32);
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
  objc_storeStrong((id *)&self->_threadScanResults, 0);
  objc_storeStrong((id *)&self->_wiFiScanResults, 0);
  objc_storeStrong((id *)&self->_debugText, 0);
  objc_storeStrong((id *)&self->_networkingStatus, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  ChipError *result;
  const char *v21;
  void *v22;
  _BYTE *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  void *v30;
  const char *v31;
  const char *v32;
  void *v33;
  const char *v34;
  const char *v35;
  void *v36;
  const char *v37;
  const char *v38;
  void *v39;
  const char *v40;
  const char *v41;
  void *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  _BYTE *v46;
  int v47;
  _BYTE *v48;
  const char *v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  const char *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  const char *v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  void *v67;
  const char *v68;
  const char *v69;
  void *v70;
  const char *v71;
  const char *v72;
  void *v73;
  const char *v74;
  const char *v75;
  void *v76;
  const char *v77;
  const char *v78;
  void *v79;
  const char *v80;
  const char *v81;
  unsigned __int16 v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  unsigned __int8 v91;
  char v92;

  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], a3, *(unsigned __int8 *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNetworkingStatus_(self, v8, (uint64_t)v7);

  if (*((_BYTE *)a4 + 8))
  {
    v10 = (uint64_t *)sub_233C05DB8((_BYTE *)a4 + 8);
    v11 = *v10;
    v12 = v10[1];
    v13 = objc_alloc(MEMORY[0x24BDD17C8]);
    v15 = (void *)objc_msgSend_initWithBytes_length_encoding_(v13, v14, v11, v12, 4);
    objc_msgSend_setDebugText_(self, v16, (uint64_t)v15);

    objc_msgSend_debugText(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      *(_OWORD *)&retstr->mError = xmmword_2504EEBB0;
      *(_QWORD *)&retstr->mLine = 5107;
      return result;
    }
  }
  else
  {
    objc_msgSend_setDebugText_(self, v9, 0);
  }
  if (*((_BYTE *)a4 + 32))
  {
    v22 = (void *)objc_opt_new();
    v23 = sub_233C25EA4((_BYTE *)a4 + 32);
    v91 = v23[72];
    if (v91)
      v92 = v23[73];
    sub_233CAF51C((uint64_t)&v82, (uint64_t)v23, &v91);
    while (sub_233CAF59C((uint64_t)&v82))
    {
      v25 = (void *)objc_opt_new();
      objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v26, v82);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSecurity_(v25, v28, (uint64_t)v27);

      objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v29, v83, v84);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSsid_(v25, v31, (uint64_t)v30);

      objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v32, v85, v86);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setBssid_(v25, v34, (uint64_t)v33);

      objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v35, (unsigned __int16)v87);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setChannel_(v25, v37, (uint64_t)v36);

      objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v38, BYTE2(v87));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setWiFiBand_(v25, v40, (uint64_t)v39);

      objc_msgSend_numberWithChar_(MEMORY[0x24BDD16E0], v41, SBYTE3(v87));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRssi_(v25, v43, (uint64_t)v42);

      objc_msgSend_addObject_(v22, v44, (uint64_t)v25);
    }
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    if ((_DWORD)v88 == 33)
    {
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
      retstr->mLine = 147;
    }
    else
    {
      *(_OWORD *)&retstr->mError = v88;
      *(_QWORD *)&retstr->mLine = v89;
      if (retstr->mError)
        goto LABEL_28;
    }
    objc_msgSend_setWiFiScanResults_(self, v24, (uint64_t)v22);

  }
  else
  {
    objc_msgSend_setWiFiScanResults_(self, v21, 0);
  }
  v47 = *((unsigned __int8 *)a4 + 120);
  v46 = (char *)a4 + 120;
  if (v47)
  {
    v22 = (void *)objc_opt_new();
    v48 = sub_233C25EA4(v46);
    v91 = v48[72];
    if (v91)
      v92 = v48[73];
    sub_233CAF648((uint64_t)&v82, (uint64_t)v48, &v91);
    while (sub_233CAF6CC((uint64_t)&v82))
    {
      v50 = (void *)objc_opt_new();
      objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v51, v82);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPanId_(v50, v53, (uint64_t)v52);

      objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v54, v83);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setExtendedPanId_(v50, v56, (uint64_t)v55);

      v57 = v84;
      v58 = v85;
      v59 = objc_alloc(MEMORY[0x24BDD17C8]);
      v61 = (void *)objc_msgSend_initWithBytes_length_encoding_(v59, v60, v57, v58, 4);
      objc_msgSend_setNetworkName_(v50, v62, (uint64_t)v61);

      objc_msgSend_networkName(v50, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v65)
      {
        *(_OWORD *)&retstr->mError = xmmword_2504EEBC8;
        *(_QWORD *)&retstr->mLine = 5154;

        goto LABEL_28;
      }
      objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v66, (unsigned __int16)v86);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setChannel_(v50, v68, (uint64_t)v67);

      objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v69, BYTE2(v86));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setVersion_(v50, v71, (uint64_t)v70);

      objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v72, v87, (_QWORD)v88);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setExtendedAddress_(v50, v74, (uint64_t)v73);

      objc_msgSend_numberWithChar_(MEMORY[0x24BDD16E0], v75, SBYTE8(v88));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRssi_(v50, v77, (uint64_t)v76);

      objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v78, BYTE9(v88));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLqi_(v50, v80, (uint64_t)v79);

      objc_msgSend_addObject_(v22, v81, (uint64_t)v50);
    }
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    if ((_DWORD)v89 == 33)
    {
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
      retstr->mLine = 147;
LABEL_29:
      objc_msgSend_setThreadScanResults_(self, v49, (uint64_t)v22);

      goto LABEL_30;
    }
    *(_OWORD *)&retstr->mError = v89;
    *(_QWORD *)&retstr->mLine = v90;
    if (!retstr->mError)
      goto LABEL_29;
LABEL_28:

    return result;
  }
  result = (ChipError *)objc_msgSend_setThreadScanResults_(self, v45, 0);
LABEL_30:
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 5174;
  return result;
}

@end
