@implementation IDSSessionEndedMetric

- (NSString)name
{
  return (NSString *)CFSTR("IDSSessionEnded");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  const char *v21;
  double v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  const char *v29;
  double v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  const char *v37;
  double v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  double v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  const char *v49;
  double v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  double v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  double v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  double v62;
  void *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  double v67;
  uint64_t v68;
  const char *v69;
  double v70;
  void *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  double v75;
  uint64_t v76;
  const char *v77;
  double v78;
  void *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  double v83;
  uint64_t v84;
  const char *v85;
  double v86;
  void *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  double v91;
  uint64_t v92;
  const char *v93;
  double v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  double v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  double v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  double v106;
  void *v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  double v111;
  uint64_t isInitiator;
  const char *v113;
  double v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  double v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  double v122;
  void *v123;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_guid(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v3, CFSTR("guid"), v7);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend_endedReason(self, v9, v10, v11);
  objc_msgSend_numberWithUnsignedInt_(v8, v13, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    CFDictionarySetValue(v3, CFSTR("endedReason"), v15);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  v20 = objc_msgSend_genericError(self, v17, v18, v19);
  objc_msgSend_numberWithUnsignedInt_(v16, v21, v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    CFDictionarySetValue(v3, CFSTR("genericError"), v23);

  v24 = (void *)MEMORY[0x1E0CB37E8];
  v28 = objc_msgSend_gameKitError(self, v25, v26, v27);
  objc_msgSend_numberWithUnsignedInt_(v24, v29, v28, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    CFDictionarySetValue(v3, CFSTR("gameKitError"), v31);

  v32 = (void *)MEMORY[0x1E0CB37E8];
  v36 = objc_msgSend_conferenceMiscError(self, v33, v34, v35);
  objc_msgSend_numberWithUnsignedInt_(v32, v37, v36, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    CFDictionarySetValue(v3, CFSTR("conferenceMiscError"), v39);

  objc_msgSend_callDuration(self, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
    CFDictionarySetValue(v3, CFSTR("callDuration"), v43);

  v44 = (void *)MEMORY[0x1E0CB37E8];
  v48 = objc_msgSend_networkCheckResult(self, v45, v46, v47);
  objc_msgSend_numberWithUnsignedInt_(v44, v49, v48, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
    CFDictionarySetValue(v3, CFSTR("networkCheckResult"), v51);

  objc_msgSend_dataRate(self, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
    CFDictionarySetValue(v3, CFSTR("dataRate"), v55);

  objc_msgSend_gksError(self, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59)
    CFDictionarySetValue(v3, CFSTR("gksError"), v59);

  objc_msgSend_connectDuration(self, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (v63)
    CFDictionarySetValue(v3, CFSTR("connectDuration"), v63);

  v64 = (void *)MEMORY[0x1E0CB37E8];
  v68 = objc_msgSend_remoteNetworkConnection(self, v65, v66, v67);
  objc_msgSend_numberWithUnsignedInt_(v64, v69, v68, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v71)
    CFDictionarySetValue(v3, CFSTR("remoteNetworkConnection"), v71);

  v72 = (void *)MEMORY[0x1E0CB37E8];
  v76 = objc_msgSend_localNetworkConnection(self, v73, v74, v75);
  objc_msgSend_numberWithUnsignedInt_(v72, v77, v76, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (v79)
    CFDictionarySetValue(v3, CFSTR("localNetworkConnection"), v79);

  v80 = (void *)MEMORY[0x1E0CB37E8];
  v84 = objc_msgSend_connectionType(self, v81, v82, v83);
  objc_msgSend_numberWithUnsignedInt_(v80, v85, v84, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (v87)
    CFDictionarySetValue(v3, CFSTR("connectionType"), v87);

  v88 = (void *)MEMORY[0x1E0CB37E8];
  v92 = objc_msgSend_usesRelay(self, v89, v90, v91);
  objc_msgSend_numberWithBool_(v88, v93, v92, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (v95)
    CFDictionarySetValue(v3, CFSTR("usesRelay"), v95);

  objc_msgSend_currentNATType(self, v96, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if (v99)
    CFDictionarySetValue(v3, CFSTR("currentNATType"), v99);

  objc_msgSend_remoteNATType(self, v100, v101, v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  if (v103)
    CFDictionarySetValue(v3, CFSTR("remoteNATType"), v103);

  objc_msgSend_relayConnectDuration(self, v104, v105, v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if (v107)
    CFDictionarySetValue(v3, CFSTR("relayConnectDuration"), v107);

  v108 = (void *)MEMORY[0x1E0CB37E8];
  isInitiator = objc_msgSend_isInitiator(self, v109, v110, v111);
  objc_msgSend_numberWithBool_(v108, v113, isInitiator, v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  if (v115)
    CFDictionarySetValue(v3, CFSTR("isInitiator"), v115);

  objc_msgSend_linkQuality(self, v116, v117, v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  if (v119)
    CFDictionarySetValue(v3, CFSTR("linkQuality"), v119);

  objc_msgSend_gksReturnCode(self, v120, v121, v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  if (v123)
    CFDictionarySetValue(v3, CFSTR("gksReturnCode"), v123);

  return (NSDictionary *)v3;
}

- (IDSSessionEndedMetric)initWithGuid:(id)a3 endedReason:(unsigned int)a4 genericError:(unsigned int)a5 gameKitError:(unsigned int)a6 conferenceMiscError:(unsigned int)a7 callDuration:(id)a8 networkCheckResult:(unsigned int)a9 dataRate:(id)a10 gksError:(id)a11 connectDuration:(id)a12 remoteNetworkConnection:(unsigned int)a13 localNetworkConnection:(unsigned int)a14 connectionType:(unsigned int)a15 usesRelay:(BOOL)a16 currentNATType:(id)a17 remoteNATType:(id)a18 relayConnectDuration:(id)a19 isInitiator:(BOOL)a20 linkQuality:(id)a21 gksReturnCode:(id)a22
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  IDSSessionEndedMetric *v30;
  IDSSessionEndedMetric *v31;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  objc_super v43;

  v39 = a3;
  v38 = a8;
  v41 = a8;
  v40 = a10;
  v24 = a11;
  v25 = a12;
  v42 = a17;
  v26 = a18;
  v27 = a19;
  v28 = a21;
  v29 = a22;
  v43.receiver = self;
  v43.super_class = (Class)IDSSessionEndedMetric;
  v30 = -[IDSSessionEndedMetric init](&v43, sel_init);
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_guid, a3);
    v31->_endedReason = a4;
    v31->_genericError = a5;
    v31->_gameKitError = a6;
    v31->_conferenceMiscError = a7;
    objc_storeStrong((id *)&v31->_callDuration, v38);
    v31->_networkCheckResult = a9;
    objc_storeStrong((id *)&v31->_dataRate, a10);
    objc_storeStrong((id *)&v31->_gksError, a11);
    objc_storeStrong((id *)&v31->_connectDuration, a12);
    v31->_remoteNetworkConnection = a13;
    v31->_localNetworkConnection = a14;
    v31->_connectionType = a15;
    v31->_usesRelay = a16;
    objc_storeStrong((id *)&v31->_currentNATType, a17);
    objc_storeStrong((id *)&v31->_remoteNATType, a18);
    objc_storeStrong((id *)&v31->_relayConnectDuration, a19);
    v31->_isInitiator = a20;
    objc_storeStrong((id *)&v31->_linkQuality, a21);
    objc_storeStrong((id *)&v31->_gksReturnCode, a22);
  }

  return v31;
}

- (NSString)guid
{
  return self->_guid;
}

- (unsigned)endedReason
{
  return self->_endedReason;
}

- (unsigned)genericError
{
  return self->_genericError;
}

- (unsigned)gameKitError
{
  return self->_gameKitError;
}

- (unsigned)conferenceMiscError
{
  return self->_conferenceMiscError;
}

- (NSNumber)callDuration
{
  return self->_callDuration;
}

- (unsigned)networkCheckResult
{
  return self->_networkCheckResult;
}

- (NSNumber)dataRate
{
  return self->_dataRate;
}

- (NSNumber)gksError
{
  return self->_gksError;
}

- (NSNumber)connectDuration
{
  return self->_connectDuration;
}

- (unsigned)remoteNetworkConnection
{
  return self->_remoteNetworkConnection;
}

- (unsigned)localNetworkConnection
{
  return self->_localNetworkConnection;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (BOOL)usesRelay
{
  return self->_usesRelay;
}

- (NSNumber)currentNATType
{
  return self->_currentNATType;
}

- (NSNumber)remoteNATType
{
  return self->_remoteNATType;
}

- (NSNumber)relayConnectDuration
{
  return self->_relayConnectDuration;
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (NSNumber)linkQuality
{
  return self->_linkQuality;
}

- (NSNumber)gksReturnCode
{
  return self->_gksReturnCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gksReturnCode, 0);
  objc_storeStrong((id *)&self->_linkQuality, 0);
  objc_storeStrong((id *)&self->_relayConnectDuration, 0);
  objc_storeStrong((id *)&self->_remoteNATType, 0);
  objc_storeStrong((id *)&self->_currentNATType, 0);
  objc_storeStrong((id *)&self->_connectDuration, 0);
  objc_storeStrong((id *)&self->_gksError, 0);
  objc_storeStrong((id *)&self->_dataRate, 0);
  objc_storeStrong((id *)&self->_callDuration, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
