@implementation IDSMessageContext

- (IDSMessageContext)initWithDictionary:(id)a3 boostContext:(id)a4
{
  id v6;
  id v7;
  IDSMessageContext *v8;
  uint64_t v9;
  OS_os_transaction *transaction;
  const char *v11;
  double v12;
  void *v13;
  uint64_t v14;
  NSString *outgoingResponseIdentifier;
  const char *v16;
  double v17;
  void *v18;
  uint64_t v19;
  NSString *incomingResponseIdentifier;
  const char *v21;
  double v22;
  void *v23;
  uint64_t v24;
  NSString *serviceIdentifier;
  const char *v26;
  double v27;
  void *v28;
  uint64_t v29;
  NSString *storageGuid;
  const char *v31;
  double v32;
  void *v33;
  uint64_t v34;
  NSString *fromID;
  const char *v36;
  double v37;
  void *v38;
  uint64_t v39;
  NSString *toID;
  const char *v41;
  double v42;
  void *v43;
  uint64_t v44;
  NSString *originalDestinationDevice;
  const char *v46;
  double v47;
  void *v48;
  uint64_t v49;
  NSString *originalGUID;
  const char *v51;
  double v52;
  void *v53;
  uint64_t v54;
  NSData *engramGroupID;
  const char *v56;
  double v57;
  void *v58;
  uint64_t v59;
  NSNumber *originalCommand;
  const char *v61;
  double v62;
  void *v63;
  uint64_t v64;
  NSNumber *publicIntentAction;
  const char *v66;
  double v67;
  void *v68;
  uint64_t v69;
  NSNumber *broadcastTime;
  const char *v71;
  double v72;
  void *v73;
  uint64_t v74;
  NSNumber *priority;
  const char *v76;
  double v77;
  void *v78;
  uint64_t v79;
  NSNumber *serverTimestamp;
  const char *v81;
  double v82;
  void *v83;
  uint64_t v84;
  NSNumber *originalTimestamp;
  const char *v86;
  double v87;
  void *v88;
  uint64_t v89;
  NSString *senderCorrelationIdentifier;
  const char *v91;
  double v92;
  void *v93;
  uint64_t v94;
  NSString *destinationCorrelationIdentifier;
  const char *v96;
  double v97;
  void *v98;
  uint64_t v99;
  NSNumber *messageSequenceNumber;
  const char *v101;
  double v102;
  void *v103;
  uint64_t v104;
  NSNumber *bytesSent;
  const char *v106;
  double v107;
  void *v108;
  uint64_t v109;
  NSNumber *totalBytes;
  const char *v111;
  double v112;
  void *v113;
  uint64_t v114;
  NSDictionary *targettedPseudonymDict;
  const char *v116;
  double v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  double v121;
  const char *v122;
  double v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  double v127;
  const char *v128;
  double v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  double v133;
  const char *v134;
  double v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  double v139;
  const char *v140;
  double v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  double v145;
  const char *v146;
  double v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  double v151;
  const char *v152;
  double v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  double v157;
  const char *v158;
  double v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  double v163;
  const char *v164;
  double v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  double v169;
  double v170;
  const char *v171;
  double v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  double v176;
  const char *v177;
  double v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  double v182;
  const char *v183;
  double v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  double v188;
  const char *v189;
  double v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  double v194;
  const char *v195;
  double v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  double v200;
  const char *v201;
  double v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  double v206;
  const char *v207;
  double v208;
  void *v209;
  __CFString *v210;
  const char *v211;
  double v212;
  void *v213;
  void *v214;
  const char *v215;
  double v216;
  void *v217;
  void *v218;
  const char *v219;
  uint64_t v220;
  double v221;
  void *v222;
  const __CFString *v223;
  uint64_t v224;
  const char *v225;
  double v226;
  uint64_t v227;
  NSError *wpConnectionError;
  const char *v229;
  double v230;
  const char *v231;
  void *v232;
  double v233;
  IDSCertifiedDeliveryContext *v234;
  const char *v235;
  double v236;
  uint64_t v237;
  IDSCertifiedDeliveryContext *certifiedDeliveryContext;
  void *v239;
  uint64_t v240;
  NSString *resourceTransferURLString;
  const char *v242;
  double v243;
  void *v244;
  uint64_t v245;
  NSDictionary *resourceTransferMetadata;
  const char *v247;
  double v248;
  void *v249;
  uint64_t v250;
  NSString *resourceTransferSandboxExtension;
  objc_super v253;

  v6 = a3;
  v7 = a4;
  v253.receiver = self;
  v253.super_class = (Class)IDSMessageContext;
  v8 = -[IDSMessageContext init](&v253, sel_init);
  if (v8)
  {
    v9 = os_transaction_create();
    transaction = v8->_transaction;
    v8->_transaction = (OS_os_transaction *)v9;

    objc_storeStrong(&v8->_boostContext, a4);
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend_objectForKey_(v6, v11, (uint64_t)CFSTR("IDSMessageContextOutgoingResponseIdentifierKey"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v14 = objc_claimAutoreleasedReturnValue();
    outgoingResponseIdentifier = v8->_outgoingResponseIdentifier;
    v8->_outgoingResponseIdentifier = (NSString *)v14;

    objc_msgSend_objectForKey_(v6, v16, (uint64_t)CFSTR("IDSMessageContextIncomingResponseIdentifierKey"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v19 = objc_claimAutoreleasedReturnValue();
    incomingResponseIdentifier = v8->_incomingResponseIdentifier;
    v8->_incomingResponseIdentifier = (NSString *)v19;

    objc_msgSend_objectForKey_(v6, v21, (uint64_t)CFSTR("IDSMessageContextServiceIdentifierKey"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v24 = objc_claimAutoreleasedReturnValue();
    serviceIdentifier = v8->_serviceIdentifier;
    v8->_serviceIdentifier = (NSString *)v24;

    objc_msgSend_objectForKey_(v6, v26, (uint64_t)CFSTR("IDSMessageContextStorageGuidKey"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v29 = objc_claimAutoreleasedReturnValue();
    storageGuid = v8->_storageGuid;
    v8->_storageGuid = (NSString *)v29;

    objc_msgSend_objectForKey_(v6, v31, (uint64_t)CFSTR("IDSMessageContextFromIDKey"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v34 = objc_claimAutoreleasedReturnValue();
    fromID = v8->_fromID;
    v8->_fromID = (NSString *)v34;

    objc_msgSend_objectForKey_(v6, v36, (uint64_t)CFSTR("IDSMessageContextToIDKey"), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v39 = objc_claimAutoreleasedReturnValue();
    toID = v8->_toID;
    v8->_toID = (NSString *)v39;

    objc_msgSend_objectForKey_(v6, v41, (uint64_t)CFSTR("IDSMessageContextOriginalDestinationDeviceKey"), v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v44 = objc_claimAutoreleasedReturnValue();
    originalDestinationDevice = v8->_originalDestinationDevice;
    v8->_originalDestinationDevice = (NSString *)v44;

    objc_msgSend_objectForKey_(v6, v46, (uint64_t)CFSTR("IDSMessageContextOriginalGUIDKey"), v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v49 = objc_claimAutoreleasedReturnValue();
    originalGUID = v8->_originalGUID;
    v8->_originalGUID = (NSString *)v49;

    objc_msgSend_objectForKey_(v6, v51, (uint64_t)CFSTR("IDSMessageContextEngramGroupIDKey"), v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v54 = objc_claimAutoreleasedReturnValue();
    engramGroupID = v8->_engramGroupID;
    v8->_engramGroupID = (NSData *)v54;

    objc_msgSend_objectForKey_(v6, v56, (uint64_t)CFSTR("IDSMessageContextOriginalCommandKey"), v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v59 = objc_claimAutoreleasedReturnValue();
    originalCommand = v8->_originalCommand;
    v8->_originalCommand = (NSNumber *)v59;

    objc_msgSend_objectForKey_(v6, v61, (uint64_t)CFSTR("IDSMessageContextPublicIntentActionKey"), v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v64 = objc_claimAutoreleasedReturnValue();
    publicIntentAction = v8->_publicIntentAction;
    v8->_publicIntentAction = (NSNumber *)v64;

    objc_msgSend_objectForKey_(v6, v66, (uint64_t)CFSTR("IDSMessageContextBroadcastTimeKey"), v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v69 = objc_claimAutoreleasedReturnValue();
    broadcastTime = v8->_broadcastTime;
    v8->_broadcastTime = (NSNumber *)v69;

    objc_msgSend_objectForKey_(v6, v71, (uint64_t)CFSTR("IDSMessageContextPriorityKey"), v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v74 = objc_claimAutoreleasedReturnValue();
    priority = v8->_priority;
    v8->_priority = (NSNumber *)v74;

    objc_msgSend_objectForKey_(v6, v76, (uint64_t)CFSTR("IDSMessageContextServerTimestampKey"), v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v79 = objc_claimAutoreleasedReturnValue();
    serverTimestamp = v8->_serverTimestamp;
    v8->_serverTimestamp = (NSNumber *)v79;

    objc_msgSend_objectForKey_(v6, v81, (uint64_t)CFSTR("IDSMessageContextOriginalTimestampKey"), v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v84 = objc_claimAutoreleasedReturnValue();
    originalTimestamp = v8->_originalTimestamp;
    v8->_originalTimestamp = (NSNumber *)v84;

    objc_msgSend_objectForKey_(v6, v86, (uint64_t)CFSTR("IDSMessageContextSenderCorrelationIdentifierKey"), v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v89 = objc_claimAutoreleasedReturnValue();
    senderCorrelationIdentifier = v8->_senderCorrelationIdentifier;
    v8->_senderCorrelationIdentifier = (NSString *)v89;

    objc_msgSend_objectForKey_(v6, v91, (uint64_t)CFSTR("IDSMessageContextDestinationCorrelationIdentifierKey"), v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v94 = objc_claimAutoreleasedReturnValue();
    destinationCorrelationIdentifier = v8->_destinationCorrelationIdentifier;
    v8->_destinationCorrelationIdentifier = (NSString *)v94;

    objc_msgSend_objectForKey_(v6, v96, (uint64_t)CFSTR("IDSMessageContextSequenceNumberKey"), v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v99 = objc_claimAutoreleasedReturnValue();
    messageSequenceNumber = v8->_messageSequenceNumber;
    v8->_messageSequenceNumber = (NSNumber *)v99;

    objc_msgSend_objectForKey_(v6, v101, (uint64_t)CFSTR("IDSMessageContextBytesSent"), v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v104 = objc_claimAutoreleasedReturnValue();
    bytesSent = v8->_bytesSent;
    v8->_bytesSent = (NSNumber *)v104;

    objc_msgSend_objectForKey_(v6, v106, (uint64_t)CFSTR("IDSMessageContextTotalBytes"), v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v109 = objc_claimAutoreleasedReturnValue();
    totalBytes = v8->_totalBytes;
    v8->_totalBytes = (NSNumber *)v109;

    objc_msgSend_objectForKey_(v6, v111, (uint64_t)CFSTR("IDSMessageContextTargettedPseudonymKey"), v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v114 = objc_claimAutoreleasedReturnValue();
    targettedPseudonymDict = v8->_targettedPseudonymDict;
    v8->_targettedPseudonymDict = (NSDictionary *)v114;

    objc_msgSend_objectForKey_(v6, v116, (uint64_t)CFSTR("IDSMessageContextExpectsPeerResponseKey"), v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_expectsPeerResponse = objc_msgSend_BOOLValue(v118, v119, v120, v121);

    objc_msgSend_objectForKey_(v6, v122, (uint64_t)CFSTR("IDSMessageContextWantsAppAckKey"), v123);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_wantsAppAck = objc_msgSend_BOOLValue(v124, v125, v126, v127);

    objc_msgSend_objectForKey_(v6, v128, (uint64_t)CFSTR("IDSMessageContextIsDirectMessage"), v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_isDirectMessage = objc_msgSend_BOOLValue(v130, v131, v132, v133);

    objc_msgSend_objectForKey_(v6, v134, (uint64_t)CFSTR("IDSMessageContextBroadcastIDKey"), v135);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_broadcastID = objc_msgSend_longLongValue(v136, v137, v138, v139);

    objc_msgSend_objectForKey_(v6, v140, (uint64_t)CFSTR("IDSMessageContextWantsManualAckKey"), v141);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_wantsManualAck = objc_msgSend_BOOLValue(v142, v143, v144, v145);

    objc_msgSend_objectForKey_(v6, v146, (uint64_t)CFSTR("IDSMessageContextFromServerStorageKey"), v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_fromServerStorage = objc_msgSend_BOOLValue(v148, v149, v150, v151);

    objc_msgSend_objectForKey_(v6, v152, (uint64_t)CFSTR("IDSMessageContextConnectionTypeKey"), v153);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_connectionType = objc_msgSend_longLongValue(v154, v155, v156, v157);

    objc_msgSend_objectForKey_(v6, v158, (uint64_t)CFSTR("IDSMessageContextUsedEngramKey"), v159);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_usedEngram = objc_msgSend_BOOLValue(v160, v161, v162, v163);

    objc_msgSend_objectForKey_(v6, v164, (uint64_t)CFSTR("IDSMessageContextAverageLocalRTTKey"), v165);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v166, v167, v168, v169);
    v8->_averageLocalRTT = v170;

    objc_msgSend_objectForKey_(v6, v171, (uint64_t)CFSTR("IDSMessageContextLocalMessageStateKey"), v172);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_localMessageState = objc_msgSend_integerValue(v173, v174, v175, v176);

    objc_msgSend_objectForKey_(v6, v177, (uint64_t)CFSTR("IDSMessageContextEndpointStateKey"), v178);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_endpointState = objc_msgSend_integerValue(v179, v180, v181, v182);

    objc_msgSend_objectForKey_(v6, v183, (uint64_t)CFSTR("IDSMessageContextDeviceBlackedOutKey"), v184);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_deviceBlackedOut = objc_msgSend_BOOLValue(v185, v186, v187, v188);

    objc_msgSend_objectForKey_(v6, v189, (uint64_t)CFSTR("IDSMessageContextMessageHadEncryptedData"), v190);
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_messageHadEncryptedData = objc_msgSend_BOOLValue(v191, v192, v193, v194);

    objc_msgSend_objectForKey_(v6, v195, (uint64_t)CFSTR("IDSMessageContextIsFromTrustedSender"), v196);
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_isFromTrustedSender = objc_msgSend_BOOLValue(v197, v198, v199, v200);

    objc_msgSend_objectForKey_(v6, v201, (uint64_t)CFSTR("IDSMessageContextFileSize"), v202);
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_fileSize = objc_msgSend_integerValue(v203, v204, v205, v206);

    objc_msgSend_objectForKey_(v6, v207, (uint64_t)CFSTR("IDSMessageContextWPConnectionErrorDomainKey"), v208);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v210 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKey_(v6, v211, (uint64_t)CFSTR("IDSMessageContextWPConnectionErrorCodeKey"), v212);
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v214 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKey_(v6, v215, (uint64_t)CFSTR("IDSMessageContextWPConnectionErrorUserInfoKey"), v216);
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v218 = (void *)objc_claimAutoreleasedReturnValue();

    v222 = (void *)MEMORY[0x1E0CB35C8];
    if (v210)
      v223 = v210;
    else
      v223 = CFSTR("com.apple.ids.idssenderrordomain");
    v224 = objc_msgSend_integerValue(v214, v219, v220, v221);
    objc_msgSend_errorWithDomain_code_userInfo_(v222, v225, (uint64_t)v223, v226, v224, v218);
    v227 = objc_claimAutoreleasedReturnValue();
    wpConnectionError = v8->_wpConnectionError;
    v8->_wpConnectionError = (NSError *)v227;

    objc_msgSend_objectForKey_(v6, v229, (uint64_t)CFSTR("IDSMessageContextCertifiedDeliveryContextKey"), v230);
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    if (v232)
    {
      v234 = [IDSCertifiedDeliveryContext alloc];
      v237 = objc_msgSend_initWithDictionaryRepresentation_(v234, v235, (uint64_t)v232, v236);
      certifiedDeliveryContext = v8->_certifiedDeliveryContext;
      v8->_certifiedDeliveryContext = (IDSCertifiedDeliveryContext *)v237;

    }
    objc_msgSend_objectForKey_(v6, v231, (uint64_t)CFSTR("ids-message-resource-transfer-url"), v233);
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v240 = objc_claimAutoreleasedReturnValue();
    resourceTransferURLString = v8->_resourceTransferURLString;
    v8->_resourceTransferURLString = (NSString *)v240;

    objc_msgSend_objectForKey_(v6, v242, (uint64_t)CFSTR("ids-message-resource-transfer-metadata"), v243);
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v245 = objc_claimAutoreleasedReturnValue();
    resourceTransferMetadata = v8->_resourceTransferMetadata;
    v8->_resourceTransferMetadata = (NSDictionary *)v245;

    objc_msgSend_objectForKey_(v6, v247, (uint64_t)CFSTR("ids-message-resource-transfer-sandbox-extension"), v248);
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v250 = objc_claimAutoreleasedReturnValue();
    resourceTransferSandboxExtension = v8->_resourceTransferSandboxExtension;
    v8->_resourceTransferSandboxExtension = (NSString *)v250;

  }
  return v8;
}

- (id)objectForKey:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  double v6;
  NSObject *v7;

  v3 = a3;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v4, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_19BAF5BC8((uint64_t)v3, v7);

  return 0;
}

- (NSDate)serverReceivedTime
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;

  objc_msgSend_serverTimestamp(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v4)
  {
    v9 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend_doubleValue(v4, v5, v6, v7);
    objc_msgSend_dateWithTimeIntervalSince1970_(v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return (NSDate *)v13;
}

- (void)setOutgoingResponseIdentifier:(id)a3
{
  NSString *v4;
  NSString *outgoingResponseIdentifier;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  outgoingResponseIdentifier = self->_outgoingResponseIdentifier;
  self->_outgoingResponseIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)outgoingResponseIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_outgoingResponseIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setIncomingResponseIdentifier:(id)a3
{
  NSString *v4;
  NSString *incomingResponseIdentifier;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  incomingResponseIdentifier = self->_incomingResponseIdentifier;
  self->_incomingResponseIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)incomingResponseIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_incomingResponseIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setServiceIdentifier:(id)a3
{
  NSString *v4;
  NSString *serviceIdentifier;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  serviceIdentifier = self->_serviceIdentifier;
  self->_serviceIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)serviceIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_serviceIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setStorageGuid:(id)a3
{
  NSString *v4;
  NSString *storageGuid;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  storageGuid = self->_storageGuid;
  self->_storageGuid = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)storageGuid
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_storageGuid;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setFromID:(id)a3
{
  NSString *v4;
  NSString *fromID;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  fromID = self->_fromID;
  self->_fromID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)fromID
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_fromID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setToID:(id)a3
{
  NSString *v4;
  NSString *toID;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  toID = self->_toID;
  self->_toID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)toID
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_toID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setOriginalDestinationDevice:(id)a3
{
  NSString *v4;
  NSString *originalDestinationDevice;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  originalDestinationDevice = self->_originalDestinationDevice;
  self->_originalDestinationDevice = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)originalDestinationDevice
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_originalDestinationDevice;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setOriginalGuid:(id)a3
{
  NSString *v4;
  NSString *originalGUID;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  originalGUID = self->_originalGUID;
  self->_originalGUID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)originalGUID
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_originalGUID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setEngramGroupID:(id)a3
{
  NSData *v4;
  NSData *engramGroupID;

  v4 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  engramGroupID = self->_engramGroupID;
  self->_engramGroupID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)engramGroupID
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_engramGroupID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setOriginalCommand:(id)a3
{
  NSNumber *v4;
  NSNumber *originalCommand;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  originalCommand = self->_originalCommand;
  self->_originalCommand = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)originalCommand
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_originalCommand;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setBroadcastTime:(id)a3
{
  NSNumber *v4;
  NSNumber *broadcastTime;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  broadcastTime = self->_broadcastTime;
  self->_broadcastTime = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)broadcastTime
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_broadcastTime;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPriority:(id)a3
{
  NSNumber *v4;
  NSNumber *priority;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  priority = self->_priority;
  self->_priority = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)priority
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_priority;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setServerTimestamp:(id)a3
{
  NSNumber *v4;
  NSNumber *serverTimestamp;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  serverTimestamp = self->_serverTimestamp;
  self->_serverTimestamp = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)serverTimestamp
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_serverTimestamp;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setOriginalTimestamp:(id)a3
{
  NSNumber *v4;
  NSNumber *originalTimestamp;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  originalTimestamp = self->_originalTimestamp;
  self->_originalTimestamp = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)originalTimestamp
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_originalTimestamp;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSenderCorrelationIdentifier:(id)a3
{
  NSString *v4;
  NSString *senderCorrelationIdentifier;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  senderCorrelationIdentifier = self->_senderCorrelationIdentifier;
  self->_senderCorrelationIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)senderCorrelationIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_senderCorrelationIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDestinationCorrelationIdentifier:(id)a3
{
  NSString *v4;
  NSString *destinationCorrelationIdentifier;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  destinationCorrelationIdentifier = self->_destinationCorrelationIdentifier;
  self->_destinationCorrelationIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)destinationCorrelationIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_destinationCorrelationIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPublicIntentAction:(id)a3
{
  NSNumber *v4;
  NSNumber *publicIntentAction;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  publicIntentAction = self->_publicIntentAction;
  self->_publicIntentAction = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)publicIntentAction
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_publicIntentAction;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setWPConnectionError:(id)a3
{
  NSError *v4;
  NSError *wpConnectionError;

  v4 = (NSError *)a3;
  os_unfair_lock_lock(&self->_lock);
  wpConnectionError = self->_wpConnectionError;
  self->_wpConnectionError = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSError)wpConnectionError
{
  os_unfair_lock_s *p_lock;
  NSError *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_wpConnectionError;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setBytesSent:(id)a3
{
  NSNumber *v4;
  NSNumber *bytesSent;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  bytesSent = self->_bytesSent;
  self->_bytesSent = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)bytesSent
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_bytesSent;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setTotalBytes:(id)a3
{
  NSNumber *v4;
  NSNumber *totalBytes;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock(&self->_lock);
  totalBytes = self->_totalBytes;
  self->_totalBytes = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)totalBytes
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_totalBytes;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setResourceTransferURLString:(id)a3
{
  NSString *v4;
  NSString *resourceTransferURLString;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  resourceTransferURLString = self->_resourceTransferURLString;
  self->_resourceTransferURLString = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)resourceTransferURLString
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_resourceTransferURLString;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setResourceTransferMetadata:(id)a3
{
  NSDictionary *v4;
  NSDictionary *resourceTransferMetadata;

  v4 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  resourceTransferMetadata = self->_resourceTransferMetadata;
  self->_resourceTransferMetadata = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDictionary)resourceTransferMetadata
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_resourceTransferMetadata;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setResourceTransferSandboxExtension:(id)a3
{
  NSString *v4;
  NSString *resourceTransferSandboxExtension;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  resourceTransferSandboxExtension = self->_resourceTransferSandboxExtension;
  self->_resourceTransferSandboxExtension = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)resourceTransferSandboxExtension
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_resourceTransferSandboxExtension;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setExpectsPeerResponse:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_expectsPeerResponse = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)expectsPeerResponse
{
  IDSMessageContext *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_expectsPeerResponse;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setWantsAppAck:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_wantsAppAck = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)wantsAppAck
{
  IDSMessageContext *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_wantsAppAck;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setIsDirectMessage:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isDirectMessage = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isDirectMessage
{
  IDSMessageContext *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isDirectMessage;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setBroadcastID:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_broadcastID = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)broadcastID
{
  os_unfair_lock_s *p_lock;
  int64_t broadcastID;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  broadcastID = self->_broadcastID;
  os_unfair_lock_unlock(p_lock);
  return broadcastID;
}

- (void)setWantsManualAck:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_wantsManualAck = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)wantsManualAck
{
  IDSMessageContext *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_wantsManualAck;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setFromServerStorage:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_fromServerStorage = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)fromServerStorage
{
  IDSMessageContext *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_fromServerStorage;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setConnectionType:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_connectionType = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)connectionType
{
  os_unfair_lock_s *p_lock;
  int64_t connectionType;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  connectionType = self->_connectionType;
  os_unfair_lock_unlock(p_lock);
  return connectionType;
}

- (void)setUsedEngram:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_usedEngram = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)usedEngram
{
  IDSMessageContext *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_usedEngram;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setIsFromTrustedSender:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isFromTrustedSender = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isFromTrustedSender
{
  IDSMessageContext *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isFromTrustedSender;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (IDSPseudonym)targettedPseudonym
{
  IDSPseudonym *v3;
  const char *v4;
  double v5;
  void *v6;

  if (self->_targettedPseudonymDict)
  {
    v3 = [IDSPseudonym alloc];
    v6 = (void *)objc_msgSend_initWithDictionaryRepresentation_(v3, v4, (uint64_t)self->_targettedPseudonymDict, v5);
  }
  else
  {
    v6 = 0;
  }
  return (IDSPseudonym *)v6;
}

- (void)setOriginalGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)messageHadEncryptedData
{
  return self->_messageHadEncryptedData;
}

- (void)setMessageHadEncryptedData:(BOOL)a3
{
  self->_messageHadEncryptedData = a3;
}

- (double)averageLocalRTT
{
  return self->_averageLocalRTT;
}

- (int64_t)localMessageState
{
  return self->_localMessageState;
}

- (BOOL)deviceBlackedOut
{
  return self->_deviceBlackedOut;
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (id)boostContext
{
  return self->_boostContext;
}

- (void)setBoostContext:(id)a3
{
  objc_storeStrong(&self->_boostContext, a3);
}

- (NSNumber)messageSequenceNumber
{
  return self->_messageSequenceNumber;
}

- (int64_t)endpointState
{
  return self->_endpointState;
}

- (IDSCertifiedDeliveryContext)certifiedDeliveryContext
{
  return self->_certifiedDeliveryContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targettedPseudonymDict, 0);
  objc_storeStrong((id *)&self->_totalBytes, 0);
  objc_storeStrong((id *)&self->_bytesSent, 0);
  objc_storeStrong((id *)&self->_messageSequenceNumber, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_broadcastTime, 0);
  objc_storeStrong((id *)&self->_resourceTransferMetadata, 0);
  objc_storeStrong((id *)&self->_resourceTransferSandboxExtension, 0);
  objc_storeStrong((id *)&self->_resourceTransferURLString, 0);
  objc_storeStrong((id *)&self->_destinationCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_senderCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_wpConnectionError, 0);
  objc_storeStrong((id *)&self->_publicIntentAction, 0);
  objc_storeStrong((id *)&self->_originalTimestamp, 0);
  objc_storeStrong((id *)&self->_serverTimestamp, 0);
  objc_storeStrong((id *)&self->_originalCommand, 0);
  objc_storeStrong((id *)&self->_engramGroupID, 0);
  objc_storeStrong((id *)&self->_originalGUID, 0);
  objc_storeStrong((id *)&self->_originalDestinationDevice, 0);
  objc_storeStrong((id *)&self->_toID, 0);
  objc_storeStrong((id *)&self->_fromID, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_incomingResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_outgoingResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_storageGuid, 0);
  objc_storeStrong((id *)&self->_certifiedDeliveryContext, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong(&self->_boostContext, 0);
}

@end
