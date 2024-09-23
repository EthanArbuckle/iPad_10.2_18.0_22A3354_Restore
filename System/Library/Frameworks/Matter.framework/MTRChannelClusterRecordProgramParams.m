@implementation MTRChannelClusterRecordProgramParams

- (MTRChannelClusterRecordProgramParams)init
{
  MTRChannelClusterRecordProgramParams *v2;
  MTRChannelClusterRecordProgramParams *v3;
  NSString *programIdentifier;
  NSNumber *shouldRecordSeries;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *externalIDList;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSData *data;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MTRChannelClusterRecordProgramParams;
  v2 = -[MTRChannelClusterRecordProgramParams init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    programIdentifier = v2->_programIdentifier;
    v2->_programIdentifier = (NSString *)&stru_2505249E8;

    shouldRecordSeries = v3->_shouldRecordSeries;
    v3->_shouldRecordSeries = (NSNumber *)&unk_250591A40;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    externalIDList = v3->_externalIDList;
    v3->_externalIDList = (NSArray *)v8;

    objc_msgSend_data(MEMORY[0x24BDBCE50], v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    data = v3->_data;
    v3->_data = (NSData *)v12;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRChannelClusterRecordProgramParams *v4;
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
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;

  v4 = objc_alloc_init(MTRChannelClusterRecordProgramParams);
  objc_msgSend_programIdentifier(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProgramIdentifier_(v4, v8, (uint64_t)v7);

  objc_msgSend_shouldRecordSeries(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setShouldRecordSeries_(v4, v12, (uint64_t)v11);

  objc_msgSend_externalIDList(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExternalIDList_(v4, v16, (uint64_t)v15);

  objc_msgSend_data(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setData_(v4, v20, (uint64_t)v19);

  objc_msgSend_timedInvokeTimeoutMs(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v24, (uint64_t)v23);

  objc_msgSend_serverSideProcessingTimeout(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *programIdentifier;
  NSNumber *shouldRecordSeries;
  NSArray *externalIDList;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  programIdentifier = self->_programIdentifier;
  shouldRecordSeries = self->_shouldRecordSeries;
  externalIDList = self->_externalIDList;
  objc_msgSend_base64EncodedStringWithOptions_(self->_data, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v11, (uint64_t)CFSTR("<%@: programIdentifier:%@; shouldRecordSeries:%@; externalIDList:%@; data:%@; >"),
    v5,
    programIdentifier,
    shouldRecordSeries,
    externalIDList,
    v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)programIdentifier
{
  return self->_programIdentifier;
}

- (void)setProgramIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)shouldRecordSeries
{
  return self->_shouldRecordSeries;
}

- (void)setShouldRecordSeries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)externalIDList
{
  return self->_externalIDList;
}

- (void)setExternalIDList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_externalIDList, 0);
  objc_storeStrong((id *)&self->_shouldRecordSeries, 0);
  objc_storeStrong((id *)&self->_programIdentifier, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  _QWORD *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t i;
  void *v38;
  const char *v39;
  uint64_t v40;
  unint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  void *v46;
  char isKindOfClass;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  id v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  id v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  unsigned int v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v84[8];
  void *v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t *v90;
  _QWORD v91[2];
  __int128 v92;
  char v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[40];

  v92 = 0uLL;
  v93 = 0;
  v94 = 0u;
  v95 = 0u;
  v91[0] = 0;
  v91[1] = 0;
  v90 = v91;
  objc_msgSend_programIdentifier(self, a3, (uint64_t)a4);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend_UTF8String(v6, v7, v8);
  v11 = objc_msgSend_lengthOfBytesUsingEncoding_(v6, v10, 4);
  sub_233CAF22C(v84, v9, v11);

  v92 = *(_OWORD *)v84;
  objc_msgSend_shouldRecordSeries(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend_BOOLValue(v14, v15, v16);

  objc_msgSend_externalIDList(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_count(v19, v20, v21);

  if (v22)
  {
    v25 = (_QWORD *)operator new();
    objc_msgSend_externalIDList(self, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_count(v28, v29, v30);
    *v25 = &off_2504EF5C8;
    v32 = (void *)operator new[]();
    v33 = v32;
    if (v31)
      bzero(v32, 32 * v31);
    v25[1] = v33;

    if (v25[1])
    {
      v84[0] = (unint64_t)v25;
      sub_233CAF24C(&v90, v84, (uint64_t *)v84);
      v36 = 0;
      for (i = 0; ; ++i)
      {
        objc_msgSend_externalIDList(self, v34, v35);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend_count(v38, v39, v40);

        if (i >= v41)
        {
          v70 = v25[1];
          objc_msgSend_externalIDList(self, v42, v43);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = objc_msgSend_count(v71, v72, v73);
          sub_233CAF22C(v84, v70, v74);
          v94 = *(_OWORD *)v84;

          goto LABEL_12;
        }
        objc_msgSend_externalIDList(self, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v44, v45, i);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          break;
        objc_msgSend_externalIDList(self, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v50, v51, i);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_name(v52, v53, v54);
        v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v58 = objc_msgSend_UTF8String(v55, v56, v57);
        v60 = objc_msgSend_lengthOfBytesUsingEncoding_(v55, v59, 4);
        sub_233CAF22C(v84, v58, v60);

        *(_OWORD *)(v25[1] + v36) = *(_OWORD *)v84;
        objc_msgSend_value(v52, v61, v62);
        v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v66 = objc_msgSend_UTF8String(v63, v64, v65);
        v68 = objc_msgSend_lengthOfBytesUsingEncoding_(v63, v67, 4);
        sub_233CAF22C(v84, v66, v68);

        *(_OWORD *)(v25[1] + v36 + 16) = *(_OWORD *)v84;
        v36 += 32;
      }
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v69 = 26700;
    }
    else
    {
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v69 = 26694;
    }
    retstr->mLine = v69;
  }
  else
  {
    v94 = 0uLL;
LABEL_12:
    objc_msgSend_data(self, v23, v24);
    v75 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v78 = objc_msgSend_bytes(v75, v76, v77);
    v81 = objc_msgSend_length(v75, v79, v80);
    sub_233BF7114(v84, v78, v81);

    v95 = *(_OWORD *)v84;
    sub_234118674(0x62FuLL, 0, &v89);
    if (v89)
    {
      sub_234106C48((uint64_t)v84);
      v86 = 0;
      v87 = 0;
      v85 = &unk_250504030;
      v88 = 0;
      sub_233CAF098((uint64_t)&v85, &v89, 0);
      sub_234106CA8((uint64_t)v84, (uint64_t)&v85, 0xFFFFFFFF, (uint64_t)v96);
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233D35630((uint64_t)&v92, (char *)v84, 0x100uLL, (uint64_t)retstr);
      if (!retstr->mError)
      {
        *(_QWORD *)&retstr->mError = 0;
        retstr->mFile = 0;
        *(_QWORD *)&retstr->mLine = 0;
        sub_233C115F0((uint64_t)v84, &v89, retstr);
        if (!retstr->mError)
        {
          sub_233C11670((uint64_t)a4, &v89);
          sub_234106010((uint64_t)a4, 21, 256, retstr);
        }
      }
      v85 = &unk_250504030;
      sub_233CAF128(&v87);
      sub_233CAF128(&v86);
    }
    else
    {
      retstr->mError = 11;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      retstr->mLine = 26718;
    }
    sub_233CAF128(&v89);
  }
  return (ChipError *)sub_233CAF15C((uint64_t)&v90);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  int v11;
  __int128 v12;
  uint64_t v13;
  _BYTE v14[72];
  uint64_t v15;

  v5 = sub_234104468((uint64_t)v14);
  v15 = 0;
  v12 = 0uLL;
  v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  sub_233CE3234((uint64_t)v14, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((_QWORD *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    v11 = 26747;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
