@implementation MTRDeviceEnergyManagementClusterModifyForecastRequestParams

- (MTRDeviceEnergyManagementClusterModifyForecastRequestParams)init
{
  MTRDeviceEnergyManagementClusterModifyForecastRequestParams *v2;
  MTRDeviceEnergyManagementClusterModifyForecastRequestParams *v3;
  NSNumber *forecastID;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *slotAdjustments;
  NSNumber *cause;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTRDeviceEnergyManagementClusterModifyForecastRequestParams;
  v2 = -[MTRDeviceEnergyManagementClusterModifyForecastRequestParams init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    forecastID = v2->_forecastID;
    v2->_forecastID = (NSNumber *)&unk_250591A40;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    slotAdjustments = v3->_slotAdjustments;
    v3->_slotAdjustments = (NSArray *)v7;

    cause = v3->_cause;
    v3->_cause = (NSNumber *)&unk_250591A40;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDeviceEnergyManagementClusterModifyForecastRequestParams *v4;
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

  v4 = objc_alloc_init(MTRDeviceEnergyManagementClusterModifyForecastRequestParams);
  objc_msgSend_forecastID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setForecastID_(v4, v8, (uint64_t)v7);

  objc_msgSend_slotAdjustments(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSlotAdjustments_(v4, v12, (uint64_t)v11);

  objc_msgSend_cause(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCause_(v4, v16, (uint64_t)v15);

  objc_msgSend_timedInvokeTimeoutMs(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v20, (uint64_t)v19);

  objc_msgSend_serverSideProcessingTimeout(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v24, (uint64_t)v23);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: forecastID:%@; slotAdjustments:%@; cause:%@; >"),
    v5,
    self->_forecastID,
    self->_slotAdjustments,
    self->_cause);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)forecastID
{
  return self->_forecastID;
}

- (void)setForecastID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)slotAdjustments
{
  return self->_slotAdjustments;
}

- (void)setSlotAdjustments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)cause
{
  return self->_cause;
}

- (void)setCause:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_cause, 0);
  objc_storeStrong((id *)&self->_slotAdjustments, 0);
  objc_storeStrong((id *)&self->_forecastID, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  _QWORD *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t i;
  void *v28;
  const char *v29;
  uint64_t v30;
  unint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  char isKindOfClass;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  unsigned int v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t *v70;
  unint64_t v72[8];
  void *v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint64_t v77;
  uint64_t *v78;
  _QWORD v79[2];
  int v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  _BYTE v84[32];

  v80 = 0;
  v81 = 0;
  v82 = 0;
  v83 = 0;
  v79[0] = 0;
  v79[1] = 0;
  v78 = v79;
  objc_msgSend_forecastID(self, a3, (uint64_t)a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend_unsignedIntValue(v6, v7, v8);

  objc_msgSend_slotAdjustments(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_count(v11, v12, v13);

  if (v14)
  {
    v70 = &v81;
    v17 = (_QWORD *)operator new();
    objc_msgSend_slotAdjustments(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_count(v20, v21, v22);
    sub_233CB037C(v17, v23);

    if (v17[1])
    {
      v72[0] = (unint64_t)v17;
      sub_233CAF24C(&v78, v72, (uint64_t *)v72);
      v26 = 0;
      for (i = 0; ; ++i)
      {
        objc_msgSend_slotAdjustments(self, v24, v25, v70);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend_count(v28, v29, v30);

        if (i >= v31)
        {
          v61 = v17[1];
          objc_msgSend_slotAdjustments(self, v32, v33);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend_count(v62, v63, v64);
          sub_233CAF22C(v72, v61, v65);
          *(_OWORD *)v70 = *(_OWORD *)v72;

          goto LABEL_12;
        }
        objc_msgSend_slotAdjustments(self, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v34, v35, i);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          break;
        objc_msgSend_slotAdjustments(self, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v40, v41, i);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_slotIndex(v42, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v17[1] + v26) = objc_msgSend_unsignedCharValue(v45, v46, v47);

        objc_msgSend_nominalPower(v42, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50)
        {
          v53 = v17[1] + v26;
          *(_BYTE *)(v53 + 8) = 1;
          *(_QWORD *)(v53 + 16) = 0;
          objc_msgSend_nominalPower(v42, v51, v52);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)(v53 + 16) = objc_msgSend_longLongValue(v54, v55, v56);

        }
        objc_msgSend_duration(v42, v51, v52);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)(v17[1] + v26 + 24) = objc_msgSend_unsignedIntValue(v57, v58, v59);

        v26 += 32;
      }
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v60 = 16443;
    }
    else
    {
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v60 = 16437;
    }
    retstr->mLine = v60;
  }
  else
  {
    v81 = 0;
    v82 = 0;
LABEL_12:
    objc_msgSend_cause(self, v15, v16);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend_unsignedCharValue(v66, v67, v68);

    sub_234118674(0x62FuLL, 0, &v77);
    if (v77)
    {
      sub_234106C48((uint64_t)v72);
      v74 = 0;
      v75 = 0;
      v73 = &unk_250504030;
      v76 = 0;
      sub_233CAF098((uint64_t)&v73, &v77, 0);
      sub_234106CA8((uint64_t)v72, (uint64_t)&v73, 0xFFFFFFFF, (uint64_t)v84);
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233D209E8((uint64_t)&v80, (char *)v72, 0x100uLL, (uint64_t)retstr);
      if (!retstr->mError)
      {
        *(_QWORD *)&retstr->mError = 0;
        retstr->mFile = 0;
        *(_QWORD *)&retstr->mLine = 0;
        sub_233C115F0((uint64_t)v72, &v77, retstr);
        if (!retstr->mError)
        {
          sub_233C11670((uint64_t)a4, &v77);
          sub_234106010((uint64_t)a4, 21, 256, retstr);
        }
      }
      v73 = &unk_250504030;
      sub_233CAF128(&v75);
      sub_233CAF128(&v74);
    }
    else
    {
      retstr->mError = 11;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      retstr->mLine = 16465;
    }
    sub_233CAF128(&v77);
  }
  return (ChipError *)sub_233CAF15C((uint64_t)&v78);
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
    v11 = 16494;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
