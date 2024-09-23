@implementation MTRMessagesClusterPresentMessagesRequestParams

- (MTRMessagesClusterPresentMessagesRequestParams)init
{
  const char *v2;
  uint64_t v3;
  MTRMessagesClusterPresentMessagesRequestParams *v4;
  uint64_t v5;
  NSData *messageID;
  NSNumber *priority;
  NSNumber *messageControl;
  NSNumber *startTime;
  NSNumber *duration;
  NSString *messageText;
  NSArray *responses;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MTRMessagesClusterPresentMessagesRequestParams;
  v4 = -[MTRMessagesClusterPresentMessagesRequestParams init](&v16, sel_init);
  if (v4)
  {
    objc_msgSend_data(MEMORY[0x24BDBCE50], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    messageID = v4->_messageID;
    v4->_messageID = (NSData *)v5;

    priority = v4->_priority;
    v4->_priority = (NSNumber *)&unk_250591A40;

    messageControl = v4->_messageControl;
    v4->_messageControl = (NSNumber *)&unk_250591A40;

    startTime = v4->_startTime;
    v4->_startTime = 0;

    duration = v4->_duration;
    v4->_duration = 0;

    messageText = v4->_messageText;
    v4->_messageText = (NSString *)&stru_2505249E8;

    responses = v4->_responses;
    v4->_responses = 0;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v4->_serverSideProcessingTimeout;
    v4->_serverSideProcessingTimeout = 0;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRMessagesClusterPresentMessagesRequestParams *v4;
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
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;

  v4 = objc_alloc_init(MTRMessagesClusterPresentMessagesRequestParams);
  objc_msgSend_messageID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMessageID_(v4, v8, (uint64_t)v7);

  objc_msgSend_priority(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPriority_(v4, v12, (uint64_t)v11);

  objc_msgSend_messageControl(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMessageControl_(v4, v16, (uint64_t)v15);

  objc_msgSend_startTime(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartTime_(v4, v20, (uint64_t)v19);

  objc_msgSend_duration(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDuration_(v4, v24, (uint64_t)v23);

  objc_msgSend_messageText(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMessageText_(v4, v28, (uint64_t)v27);

  objc_msgSend_responses(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponses_(v4, v32, (uint64_t)v31);

  objc_msgSend_timedInvokeTimeoutMs(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v36, (uint64_t)v35);

  objc_msgSend_serverSideProcessingTimeout(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v40, (uint64_t)v39);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_messageID, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("<%@: messageID:%@; priority:%@; messageControl:%@; startTime:%@; duration:%@; messageText:%@; responses:%@; >"),
    v5,
    v7,
    self->_priority,
    self->_messageControl,
    self->_startTime,
    self->_duration,
    self->_messageText,
    self->_responses);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)priority
{
  return self->_priority;
}

- (void)setPriority:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)messageControl
{
  return self->_messageControl;
}

- (void)setMessageControl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)messageText
{
  return self->_messageText;
}

- (void)setMessageText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)responses
{
  return self->_responses;
}

- (void)setResponses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_messageText, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_messageControl, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
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
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  id v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t i;
  void *v62;
  const char *v63;
  uint64_t v64;
  unint64_t v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  void *v70;
  char isKindOfClass;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  ChipError *v97;
  int v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v107[8];
  void *v108;
  uint64_t v109;
  uint64_t v110;
  char v111;
  uint64_t v112;
  uint64_t *v113;
  _QWORD v114[2];
  __int128 v115;
  __int16 v116;
  int v117;
  char v118;
  uint64_t v119;
  char v120;
  __int128 v121;
  char v122;
  __int128 v123;
  _BYTE v124[32];

  LOBYTE(v117) = 0;
  v118 = 0;
  LOBYTE(v119) = 0;
  v120 = 0;
  v115 = 0uLL;
  v116 = 0;
  v121 = 0uLL;
  v122 = 0;
  v114[0] = 0;
  v114[1] = 0;
  v113 = v114;
  objc_msgSend_messageID(self, a3, (uint64_t)a4);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend_bytes(v5, v6, v7);
  v11 = objc_msgSend_length(v5, v9, v10);
  sub_233BF7114(v107, v8, v11);

  v115 = *(_OWORD *)v107;
  objc_msgSend_priority(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v116) = objc_msgSend_unsignedCharValue(v14, v15, v16);

  objc_msgSend_messageControl(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  HIBYTE(v116) = objc_msgSend_unsignedCharValue(v19, v20, v21);

  objc_msgSend_startTime(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v117 = 0;
    v118 = 1;
    objc_msgSend_startTime(self, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = objc_msgSend_unsignedIntValue(v27, v28, v29);

  }
  objc_msgSend_duration(self, v25, v26);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v119 = 0;
    v120 = 1;
    objc_msgSend_duration(self, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = objc_msgSend_unsignedLongLongValue(v33, v34, v35);

  }
  objc_msgSend_messageText(self, v31, v32);
  v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v39 = objc_msgSend_UTF8String(v36, v37, v38);
  v41 = objc_msgSend_lengthOfBytesUsingEncoding_(v36, v40, 4);
  sub_233CAF22C(v107, v39, v41);

  v121 = *(_OWORD *)v107;
  objc_msgSend_responses(self, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v44)
    goto LABEL_19;
  v122 = 1;
  v123 = 0uLL;
  objc_msgSend_responses(self, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend_count(v47, v48, v49);

  if (!v50)
  {
    v123 = 0uLL;
LABEL_19:
    sub_234118674(0x62FuLL, 0, &v112);
    if (v112)
    {
      sub_234106C48((uint64_t)v107);
      v109 = 0;
      v110 = 0;
      v108 = &unk_250504030;
      v111 = 0;
      sub_233CAF098((uint64_t)&v108, &v112, 0);
      sub_234106CA8((uint64_t)v107, (uint64_t)&v108, 0xFFFFFFFF, (uint64_t)v124);
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233D1DD10((uint64_t)&v115, (char *)v107, 0x100uLL, (uint64_t)retstr);
      if (!retstr->mError)
      {
        *(_QWORD *)&retstr->mError = 0;
        retstr->mFile = 0;
        *(_QWORD *)&retstr->mLine = 0;
        sub_233C115F0((uint64_t)v107, &v112, retstr);
        if (!retstr->mError)
        {
          sub_233C11670((uint64_t)a4, &v112);
          sub_234106010((uint64_t)a4, 21, 256, retstr);
        }
      }
      v108 = &unk_250504030;
      sub_233CAF128(&v110);
      sub_233CAF128(&v109);
    }
    else
    {
      retstr->mError = 11;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      retstr->mLine = 15841;
    }
    sub_233CAF128(&v112);
    return (ChipError *)sub_233CAF15C((uint64_t)&v113);
  }
  v51 = (_QWORD *)operator new();
  objc_msgSend_responses(self, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend_count(v54, v55, v56);
  sub_233CB01AC(v51, v57);

  if (v51[1])
  {
    v107[0] = (unint64_t)v51;
    sub_233CAF24C(&v113, v107, (uint64_t *)v107);
    v60 = 0;
    for (i = 0; ; ++i)
    {
      objc_msgSend_responses(self, v58, v59);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend_count(v62, v63, v64);

      if (i >= v65)
      {
        v99 = v51[1];
        objc_msgSend_responses(self, v66, v67);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = objc_msgSend_count(v100, v101, v102);
        sub_233CAF22C(v107, v99, v103);
        v123 = *(_OWORD *)v107;

        goto LABEL_19;
      }
      objc_msgSend_responses(self, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v68, v69, i);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        break;
      objc_msgSend_responses(self, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v74, v75, i);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_messageResponseID(v76, v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      if (v79)
      {
        v82 = v51[1] + v60;
        *(_BYTE *)v82 = 1;
        *(_DWORD *)(v82 + 4) = 0;
        objc_msgSend_messageResponseID(v76, v80, v81);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)(v82 + 4) = objc_msgSend_unsignedIntValue(v83, v84, v85);

      }
      objc_msgSend_label(v76, v80, v81);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      if (v86)
      {
        v89 = v51[1];
        *(_QWORD *)(v89 + v60 + 16) = 0;
        v90 = v89 + v60 + 16;
        *(_BYTE *)(v90 - 8) = 1;
        *(_QWORD *)(v90 + 8) = 0;
        objc_msgSend_label(v76, v87, v88);
        v91 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v94 = objc_msgSend_UTF8String(v91, v92, v93);
        v96 = objc_msgSend_lengthOfBytesUsingEncoding_(v91, v95, 4);
        sub_233CAF22C(v107, v94, v96);

        *(_OWORD *)v90 = *(_OWORD *)v107;
      }

      v60 += 32;
    }
    v97 = retstr;
    retstr->mError = 47;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    v98 = 15819;
  }
  else
  {
    v97 = retstr;
    retstr->mError = 47;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    v98 = 15813;
  }
  v97->mLine = v98;
  return (ChipError *)sub_233CAF15C((uint64_t)&v113);
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
    v11 = 15870;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
