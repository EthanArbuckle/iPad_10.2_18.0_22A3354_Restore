@implementation IDSSessionCompleted

- (NSString)name
{
  return (NSString *)CFSTR("SessionCompleted");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
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
  uint64_t isQREnabled;
  const char *v29;
  double v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  uint64_t isUsingQRDirectly;
  const char *v37;
  double v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  double v43;
  uint64_t isInitiator;
  const char *v45;
  double v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  double v51;
  uint64_t isScreenSharingSessionType;
  const char *v53;
  double v54;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  double v59;
  uint64_t v60;
  const char *v61;
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
  void *v104;
  const char *v105;
  uint64_t v106;
  double v107;
  uint64_t isWifiInterfaceDisallowed;
  const char *v109;
  double v110;
  void *v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  double v115;
  uint64_t isCellularInterfaceDisallowed;
  const char *v117;
  double v118;
  void *v119;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_guid(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v3, CFSTR("guid"), v7);

  objc_msgSend_protocolVersionNumber(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("protocolVersionNumber"), v11);

  objc_msgSend_serviceName(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    CFDictionarySetValue(v3, CFSTR("serviceName"), v15);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  v20 = objc_msgSend_clientType(self, v17, v18, v19);
  objc_msgSend_numberWithUnsignedInt_(v16, v21, v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    CFDictionarySetValue(v3, CFSTR("clientType"), v23);

  v24 = (void *)MEMORY[0x1E0CB37E8];
  isQREnabled = objc_msgSend_isQREnabled(self, v25, v26, v27);
  objc_msgSend_numberWithBool_(v24, v29, isQREnabled, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    CFDictionarySetValue(v3, CFSTR("isQREnabled"), v31);

  v32 = (void *)MEMORY[0x1E0CB37E8];
  isUsingQRDirectly = objc_msgSend_isUsingQRDirectly(self, v33, v34, v35);
  objc_msgSend_numberWithBool_(v32, v37, isUsingQRDirectly, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    CFDictionarySetValue(v3, CFSTR("isUsingQRDirectly"), v39);

  v40 = (void *)MEMORY[0x1E0CB37E8];
  isInitiator = objc_msgSend_isInitiator(self, v41, v42, v43);
  objc_msgSend_numberWithBool_(v40, v45, isInitiator, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
    CFDictionarySetValue(v3, CFSTR("isInitiator"), v47);

  v48 = (void *)MEMORY[0x1E0CB37E8];
  isScreenSharingSessionType = objc_msgSend_isScreenSharingSessionType(self, v49, v50, v51);
  objc_msgSend_numberWithBool_(v48, v53, isScreenSharingSessionType, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
    CFDictionarySetValue(v3, CFSTR("isScreenSharingSessionType"), v55);

  v56 = (void *)MEMORY[0x1E0CB37E8];
  v60 = objc_msgSend_isWithDefaultPairedDevice(self, v57, v58, v59);
  objc_msgSend_numberWithBool_(v56, v61, v60, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (v63)
    CFDictionarySetValue(v3, CFSTR("isWithDefaultPairedDevice"), v63);

  v64 = (void *)MEMORY[0x1E0CB37E8];
  v68 = objc_msgSend_transportType(self, v65, v66, v67);
  objc_msgSend_numberWithUnsignedInt_(v64, v69, v68, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v71)
    CFDictionarySetValue(v3, CFSTR("transportType"), v71);

  v72 = (void *)MEMORY[0x1E0CB37E8];
  v76 = objc_msgSend_linkType(self, v73, v74, v75);
  objc_msgSend_numberWithUnsignedInt_(v72, v77, v76, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (v79)
    CFDictionarySetValue(v3, CFSTR("linkType"), v79);

  v80 = (void *)MEMORY[0x1E0CB37E8];
  v84 = objc_msgSend_linkProtocol(self, v81, v82, v83);
  objc_msgSend_numberWithUnsignedInt_(v80, v85, v84, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (v87)
    CFDictionarySetValue(v3, CFSTR("linkProtocol"), v87);

  v88 = (void *)MEMORY[0x1E0CB37E8];
  v92 = objc_msgSend_destinationType(self, v89, v90, v91);
  objc_msgSend_numberWithUnsignedInt_(v88, v93, v92, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (v95)
    CFDictionarySetValue(v3, CFSTR("destinationType"), v95);

  objc_msgSend_durationOfSession(self, v96, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if (v99)
    CFDictionarySetValue(v3, CFSTR("durationOfSession"), v99);

  objc_msgSend_durationToConnect(self, v100, v101, v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  if (v103)
    CFDictionarySetValue(v3, CFSTR("durationToConnect"), v103);

  v104 = (void *)MEMORY[0x1E0CB37E8];
  isWifiInterfaceDisallowed = objc_msgSend_isWifiInterfaceDisallowed(self, v105, v106, v107);
  objc_msgSend_numberWithBool_(v104, v109, isWifiInterfaceDisallowed, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  if (v111)
    CFDictionarySetValue(v3, CFSTR("isWifiInterfaceDisallowed"), v111);

  v112 = (void *)MEMORY[0x1E0CB37E8];
  isCellularInterfaceDisallowed = objc_msgSend_isCellularInterfaceDisallowed(self, v113, v114, v115);
  objc_msgSend_numberWithBool_(v112, v117, isCellularInterfaceDisallowed, v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  if (v119)
    CFDictionarySetValue(v3, CFSTR("isCellularInterfaceDisallowed"), v119);

  return (NSDictionary *)v3;
}

- (IDSSessionCompleted)initWithGuid:(id)a3 protocolVersionNumber:(id)a4 serviceName:(id)a5 clientType:(unsigned int)a6 isQREnabled:(BOOL)a7 isUsingQRDirectly:(BOOL)a8 isInitiator:(BOOL)a9 isScreenSharingSessionType:(BOOL)a10 isWithDefaultPairedDevice:(BOOL)a11 transportType:(unsigned int)a12 linkType:(unsigned int)a13 linkProtocol:(unsigned int)a14 endedReason:(unsigned int)a15 destinationType:(unsigned int)a16 durationOfSession:(id)a17 durationToConnect:(id)a18 isWifiInterfaceDisallowed:(BOOL)a19 isCellularInterfaceDisallowed:(BOOL)a20
{
  id v25;
  id v26;
  id v27;
  IDSSessionCompleted *v28;
  IDSSessionCompleted *v29;
  id v33;
  id v34;
  objc_super v35;

  v25 = a3;
  v26 = a4;
  v27 = a5;
  v34 = a17;
  v33 = a18;
  v35.receiver = self;
  v35.super_class = (Class)IDSSessionCompleted;
  v28 = -[IDSSessionCompleted init](&v35, sel_init);
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_guid, a3);
    objc_storeStrong((id *)&v29->_protocolVersionNumber, a4);
    objc_storeStrong((id *)&v29->_serviceName, a5);
    v29->_isQREnabled = a7;
    v29->_isUsingQRDirectly = a8;
    v29->_isInitiator = a9;
    v29->_isScreenSharingSessionType = a10;
    v29->_isWithDefaultPairedDevice = a11;
    v29->_clientType = a6;
    v29->_transportType = a12;
    v29->_linkType = a13;
    v29->_linkProtocol = a14;
    v29->_endedReason = a15;
    v29->_destinationType = a16;
    objc_storeStrong((id *)&v29->_durationOfSession, a17);
    objc_storeStrong((id *)&v29->_durationToConnect, a18);
  }

  return v29;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSNumber)protocolVersionNumber
{
  return self->_protocolVersionNumber;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (unsigned)clientType
{
  return self->_clientType;
}

- (BOOL)isQREnabled
{
  return self->_isQREnabled;
}

- (BOOL)isUsingQRDirectly
{
  return self->_isUsingQRDirectly;
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (BOOL)isScreenSharingSessionType
{
  return self->_isScreenSharingSessionType;
}

- (BOOL)isWithDefaultPairedDevice
{
  return self->_isWithDefaultPairedDevice;
}

- (unsigned)transportType
{
  return self->_transportType;
}

- (unsigned)linkType
{
  return self->_linkType;
}

- (unsigned)linkProtocol
{
  return self->_linkProtocol;
}

- (unsigned)endedReason
{
  return self->_endedReason;
}

- (unsigned)destinationType
{
  return self->_destinationType;
}

- (NSNumber)durationOfSession
{
  return self->_durationOfSession;
}

- (NSNumber)durationToConnect
{
  return self->_durationToConnect;
}

- (BOOL)isWifiInterfaceDisallowed
{
  return self->_isWifiInterfaceDisallowed;
}

- (BOOL)isCellularInterfaceDisallowed
{
  return self->_isCellularInterfaceDisallowed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationToConnect, 0);
  objc_storeStrong((id *)&self->_durationOfSession, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_protocolVersionNumber, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
